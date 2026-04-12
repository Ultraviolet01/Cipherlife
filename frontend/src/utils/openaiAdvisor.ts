// @ts-nocheck
import axios from 'axios';

/**
 * Client-side wrapper for the OpenAI AI Advisor.
 * Communicates with our secure backend proxy to protect API keys.
 */

const API_BASE = 'http://localhost:3001/api/advisor';

export const getHealthInsights = async (healthScore, riskLevel) => {
  const response = await axios.post(API_BASE, {
    module: 'health',
    scores: { health: healthScore, riskLevel },
    patterns: ''
  });
  return response.data.content;
};

export const getMentalHealthInsights = async (mindScore, burnoutRisk, patterns) => {
  const response = await axios.post(API_BASE, {
    module: 'mind',
    scores: { mindScore, burnoutRisk },
    patterns
  });
  return response.data.content;
};

export const getFinanceInsights = async (financeScore, stressLevel, patterns) => {
  const response = await axios.post(API_BASE, {
    module: 'finance',
    scores: { financeScore, stressLevel },
    patterns
  });
  return response.data.content;
};

export const getCombinedInsights = async (h, m, f, patterns, customQuestion = '') => {
  const response = await axios.post(API_BASE, {
    module: 'combined',
    scores: { health: h, mind: m, finance: f, customQuestion },
    patterns
  });
  return response.data.content;
};
