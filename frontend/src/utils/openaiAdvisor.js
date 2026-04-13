import React, { useState } from 'react';

// Call our Vercel serverless function
// NEVER call OpenAI directly from browser
const ADVISOR_URL = 
  import.meta.env.VITE_ADVISOR_URL 
  || '/api/advisor';

async function callAdvisor(payload) {
  const response = await fetch(ADVISOR_URL, {
    method: 'POST',
    headers: { 
      'Content-Type': 'application/json' 
    },
    body: JSON.stringify(payload)
  });

  if (!response.ok) {
    const err = await response.json()
      .catch(() => ({}));
    
    // Specific error for missing API key
    if (err.error === 'API_KEY_MISSING') {
      throw new Error(
        'OPENAI_KEY_NOT_CONFIGURED'
      );
    }
    throw new Error(
      err.message || 
      `Request failed: ${response.status}`
    );
  }

  const data = await response.json();
  return data.insight;
}

export async function getCombinedInsights(
  healthScore, mindScore, 
  financeScore, crossPatterns
) {
  return callAdvisor({
    module: 'combined',
    scores: { 
      health: healthScore, 
      mind: mindScore, 
      finance: financeScore 
    },
    patterns: crossPatterns
  });
}

export async function getHealthInsights(
  healthScore, riskLevel
) {
  return callAdvisor({
    module: 'health',
    scores: { 
      health: healthScore, 
      riskLevel 
    }
  });
}

export async function getMentalHealthInsights(
  mindScore, burnoutRisk, patterns
) {
  return callAdvisor({
    module: 'mental',
    scores: { 
      mind: mindScore, 
      burnoutRisk 
    },
    patterns
  });
}

export async function getFinanceInsights(
  financeScore, stressLevel, patterns
) {
  return callAdvisor({
    module: 'finance',
    scores: { 
      finance: financeScore, 
      stressLevel 
    },
    patterns
  });
}

export async function askAdvisor(
  question, healthScore, 
  mindScore, financeScore
) {
  return callAdvisor({
    module: 'chat',
    scores: { 
      health: healthScore, 
      mind: mindScore, 
      finance: financeScore 
    },
    question
  });
}

export function useOpenAIAdvisor() {
  const [isLoading, setIsLoading] = 
    useState(false);
  const [insights, setInsights] = 
    useState(null);
  const [error, setError] = 
    useState(null);

  const getInsights = async (
    module, scores, patterns
  ) => {
    const cacheKey = 
      `insights_${module}_` +
      `${scores.health}_` +
      `${scores.mind}_` +
      `${scores.finance}`;
    
    const cached = 
      sessionStorage.getItem(cacheKey);
    if (cached) {
      setInsights(cached);
      return cached;
    }

    setIsLoading(true);
    setError(null);

    try {
      let result;

      if (module === 'combined') {
        result = await getCombinedInsights(
          scores.health, scores.mind,
          scores.finance, patterns
        );
      } else if (module === 'health') {
        result = await getHealthInsights(
          scores.health, scores.riskLevel
        );
      } else if (module === 'mental') {
        result = await getMentalHealthInsights(
          scores.mind, scores.burnoutRisk,
          patterns
        );
      } else if (module === 'finance') {
        result = await getFinanceInsights(
          scores.finance, scores.stressLevel,
          patterns
        );
      }

      sessionStorage.setItem(cacheKey, result);
      setInsights(result);
      return result;

    } catch (err) {
      console.error('Advisor error:', err);
      
      // Show specific, helpful error messages
      if (err.message === 
          'OPENAI_KEY_NOT_CONFIGURED') {
        setError('API_KEY_MISSING');
      } else if (err.message?.includes('401')) {
        setError('INVALID_API_KEY');
      } else if (err.message?.includes('429')) {
        setError('RATE_LIMITED');
      } else {
        setError('CONNECTION_FAILED');
      }
    } finally {
      setIsLoading(false);
    }
  };

  return { 
    getInsights, isLoading, insights, error 
  };
}
