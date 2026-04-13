// /frontend/api/advisor.js
export default async function handler(
  req, res
) {
  // Allow CORS
  res.setHeader(
    'Access-Control-Allow-Origin', '*'
  );
  res.setHeader(
    'Access-Control-Allow-Methods', 
    'POST, OPTIONS'
  );
  res.setHeader(
    'Access-Control-Allow-Headers', 
    'Content-Type'
  );

  if (req.method === 'OPTIONS') {
    return res.status(200).end();
  }

  if (req.method !== 'POST') {
    return res.status(405).json({ 
      error: 'Method not allowed' 
    });
  }

  const apiKey = process.env.OPENAI_API_KEY;
  
  if (!apiKey) {
    return res.status(500).json({ 
      error: 'API_KEY_MISSING',
      message: 'OpenAI API key not configured'
    });
  }

  const { module, scores, patterns, question } 
    = req.body;

  if (!scores) {
    return res.status(400).json({ 
      error: 'Missing scores' 
    });
  }

  // Build the prompt based on module
  let systemPrompt = '';
  let userMessage = '';

  if (module === 'chat' && question) {
    systemPrompt = 
      `You are CipherLife's holistic 
       wellness advisor. The user's scores:
       Health: ${scores.health}/100
       Mind: ${scores.mind}/100
       Finance: ${scores.finance}/100
       
       Rules:
       - Answer based only on these scores
       - Never ask for personal details
       - Be warm, concise and practical
       - Always recommend professionals 
         for serious concerns
       - End with one relevant disclaimer`;
    userMessage = question;

  } else if (module === 'combined') {
    systemPrompt = 
      `You are CipherLife's holistic 
       life advisor. You see only anonymized 
       wellness scores. Never reference 
       personal data.
       
       Response format — use these headers:
       🫀 Health
       🧠 Mind  
       💰 Finance
       ⭐ Priority Action
       
       Rules:
       - Start with one cross-domain observation
       - One insight per domain (3 total)
       - Show how domains affect each other
       - One unified priority action
       - Under 300 words total
       - ALWAYS end with:
       
       ────────────────────────────────
       ⚕️ Medical Disclaimer: AI-generated 
       for informational purposes only. 
       Consult qualified medical and mental 
       health professionals for diagnosis 
       and treatment.
       💼 Financial Disclaimer: General 
       guidance only. Consult a certified 
       financial advisor for personalized advice.
       ────────────────────────────────`;
    userMessage = 
      `Health score: ${scores.health}/100
Mind score: ${scores.mind}/100
Finance score: ${scores.finance}/100
Patterns: ${patterns || 'none detected'}
Give holistic life improvement advice.`;

  } else if (module === 'health') {
    systemPrompt = 
      `You are a compassionate health 
       advisor. You only see anonymized 
       risk scores. Never personal data.
       Give 3 actionable improvements.
       Under 200 words.
       End with: ⚕️ Important: AI-generated 
       guidance only. Consult a qualified 
       medical professional for health 
       concerns, diagnosis, or treatment.`;
    userMessage = 
      `Health score: ${scores.health}/100
Risk level: ${scores.riskLevel || 'moderate'}
Give wellness improvement suggestions.`;

  } else if (module === 'mental') {
    systemPrompt = 
      `You are a mental wellness guide.
       You only see anonymized mood scores.
       Validate the user's experience first.
       Give 3 evidence-based coping strategies.
       Under 200 words.
       End with: 🧠 Important: AI-generated 
       guidance only. Consult a licensed 
       therapist or psychologist for mental 
       health concerns. If in crisis, contact 
       a crisis helpline immediately.`;
    userMessage = 
      `Mind score: ${scores.mind}/100
Burnout risk: ${scores.burnoutRisk || 'moderate'}
Patterns: ${patterns || 'none'}
Give mental wellness suggestions.`;

  } else if (module === 'finance') {
    systemPrompt = 
      `You are a financial wellness coach.
       You only see anonymized stress scores.
       Give 3 concrete money moves.
       No specific investment advice.
       Under 200 words.
       End with: 💼 Important: AI-generated 
       guidance only. Consult a certified 
       financial advisor for personalized 
       financial decisions.`;
    userMessage = 
      `Finance score: ${scores.finance}/100
Stress level: ${scores.stressLevel || 'moderate'}
Patterns: ${patterns || 'none'}
Give financial wellness suggestions.`;
  } else {
    return res.status(400).json({ 
      error: 'Invalid module' 
    });
  }

  try {
    const response = await fetch(
      'https://api.openai.com/v1/chat/completions',
      {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
          'Authorization': `Bearer ${apiKey}`
        },
        body: JSON.stringify({
          model: 'gpt-4o',
          max_tokens: 800,
          messages: [
            { role: 'system', content: systemPrompt },
            { role: 'user', content: userMessage }
          ]
        })
      }
    );

    if (!response.ok) {
      const errData = await response.json();
      console.error('OpenAI error:', errData);
      return res.status(response.status).json({
        error: 'OPENAI_ERROR',
        message: errData.error?.message 
          || 'OpenAI request failed',
        code: errData.error?.code
      });
    }

    const data = await response.json();
    const insight = data.choices[0]
      ?.message?.content;

    if (!insight) {
      return res.status(500).json({ 
        error: 'Empty response from OpenAI' 
      });
    }

    return res.status(200).json({ insight });

  } catch (err) {
    console.error('Advisor API error:', err);
    return res.status(500).json({ 
      error: 'SERVER_ERROR',
      message: err.message 
    });
  }
}
