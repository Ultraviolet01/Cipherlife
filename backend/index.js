const express = require('express');
const cors = require('cors');
require('dotenv').config();

const app = express();
const PORT = process.env.PORT || 3001;

app.use(cors());
app.use(express.json());

app.get('/api/health', (req, res) => {
  res.json({ status: 'healthy', timestamp: new Date().toISOString() });
});

const { OpenAI } = require('openai');

// FHE Analysis endpoints
const createMockResult = (module) => ({
  encrypted_result: `0xmock_encrypted_handle_${module}_${Date.now()}`,
  status: 'success'
});

app.post('/analyze/health', (req, res) => {
  res.json(createMockResult('health'));
});

app.post('/analyze/mental', (req, res) => {
  res.json(createMockResult('mental'));
});

app.post('/analyze/finance', (req, res) => {
  res.json(createMockResult('finance'));
});

// OpenAI Advisor Proxy
app.post('/api/advisor', async (req, res) => {
  const { module, scores, patterns } = req.body;
  const apiKey = process.env.OPENAI_API_KEY;

  if (!apiKey) {
    console.warn("⚠️ AI Advisor: Strategic guidance disabled. Missing OPENAI_API_KEY in backend/.env");
    return res.status(500).json({ 
      error: 'API_KEY_MISSING',
      message: 'AI Advisor is missing configuration on the server.'
    });
  }

  const openai = new OpenAI({ apiKey });

  let systemPrompt = "";
  let userMsg = "";

  switch (module) {
    case 'health':
      systemPrompt = `You are a compassionate health advisor inside CipherLife, a privacy-first wellness app. You receive only anonymized risk scores (0-100), never personal data. Your response must: Give 3 specific, actionable improvements. Be warm and non-alarmist in tone. Be formatted with clear sections. ALWAYS end with this exact disclaimer on its own line: '⚕️ Important: This is AI-generated guidance only. Please consult a qualified medical professional for any health concerns, diagnosis, or treatment.' Never claim to diagnose anything. Never recommend specific medications. Keep response under 200 words.`;
      userMsg = `Health risk score: ${scores.health}/100. Risk level: ${scores.riskLevel}. Provide wellness improvement suggestions.`;
      break;

    case 'mind':
      systemPrompt = `You are a compassionate mental wellness guide inside CipherLife. You only see anonymized burnout and mood scores. Your response must: Validate the user's experience with empathy. Give 3 evidence-based coping strategies. Suggest one lifestyle adjustment. ALWAYS end with this exact disclaimer: '🧠 Important: This is AI-generated wellness guidance only. For mental health concerns, diagnosis, or ongoing difficulties, please consult a licensed therapist, psychologist, or psychiatrist. If you are in crisis, please contact a crisis helpline immediately.' Never attempt to diagnose mental illness. Never replace professional therapy. Keep response under 200 words.`;
      userMsg = `Burnout Risk score: ${scores.burnoutRisk}/100. Mood score: ${scores.mindScore}/100. Patterns: ${patterns}. Provide mental support suggestions.`;
      break;

    case 'finance':
      systemPrompt = `You are a practical financial wellness coach inside CipherLife. You only see anonymized financial stress scores. Your response must: Give 3 concrete, actionable money moves. Prioritize by impact vs effort. Use simple, jargon-free language. ALWAYS end with: '💼 Important: This is AI-generated financial guidance only. Please consult a certified financial advisor or planner for personalized financial decisions, investments, or debt management.' Never recommend specific investments. Keep response under 200 words.`;
      userMsg = `Financial stress score: ${scores.financeScore}/100. Stress Level: ${scores.stressLevel}. Patterns: ${patterns}. Provide financial coaching.`;
      break;

    case 'combined':
      systemPrompt = `You are CipherLife's holistic life advisor. You see three anonymized wellness scores and detected cross-domain patterns only. Your response must: Start with one powerful observation about how the three scores relate to each other. Give one insight per domain (3 total) with cross-domain connections. Give one unified priority action. Format with emoji section headers: 🫀 Health | 🧠 Mind | 💰 Finance | ⭐ Priority Action. ALWAYS end with: '─────────────────────────────\n⚕️ Medical Disclaimer: All health and mental health guidance is AI-generated for informational purposes only. Consult qualified medical and mental health professionals for proper diagnosis and treatment.\n💼 Financial Disclaimer: Financial suggestions are general guidance only. Consult a certified financial advisor for personalized advice.\n─────────────────────────────'. Keep total response under 300 words.`;
      userMsg = `Health score: ${scores.health}/100. Mental health score: ${scores.mind}/100. Financial score: ${scores.finance}/100. Detected patterns: ${patterns}. Give holistic life improvement advice. ${scores.customQuestion ? `User specific question: ${scores.customQuestion}` : ''}`;
      break;

    default:
      return res.status(400).json({ error: "Invalid advisor module." });
  }

  try {
    const response = await openai.chat.completions.create({
      model: "gpt-4o",
      messages: [
        { role: "system", content: systemPrompt },
        { role: "user", content: userMsg }
      ],
      max_tokens: 1000,
    });

    res.json({ insight: response.choices[0].message.content });
  } catch (error) {
    console.error("OpenAI API Error:", error.message);

    if (error.message?.includes('402') || 
        error.message?.includes('quota') ||
        error.status === 402) {
      
      const h = scores.health || 0;
      const m = scores.mind || scores.mindScore || 0;
      const f = scores.finance || scores.financeScore || 0;
      
      const fallback = `
🫀 **Health** — Your health score of 
${h}/100 suggests focusing on consistent 
sleep, hydration, and light daily movement. 
Even 20 minutes of walking significantly 
improves biomarkers.

🧠 **Mind** — Your mind score of ${m}/100 
indicates stress management should be a 
priority. Try box breathing (4-4-4-4) 
and limit screen time before bed.

💰 **Finance** — Your finance score of 
${f}/100 suggests building a small 
emergency buffer first before focusing 
on long-term investments.

⭐ **Priority Action** — Start with one 
small habit this week: a 10-minute 
evening walk. It improves all three 
domains simultaneously.

---
⚕️ Medical Disclaimer: AI-generated for 
informational purposes only. Consult 
qualified medical professionals.
💼 Financial Disclaimer: General guidance 
only. Consult a certified financial advisor.
      `;
      
      return res.status(200).json({ insight: fallback });
    }

    res.status(500).json({ error: "Strategic advisor offline. Please try again later." });
  }
});

if (process.env.NODE_ENV !== 'production') {
  app.listen(PORT, () => {
    console.log(`CipherLife Backend running on http://localhost:${PORT}`);
  });
}

module.exports = app;
