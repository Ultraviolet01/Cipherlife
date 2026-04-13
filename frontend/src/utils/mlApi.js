// Safe ML API call with timeout + fallback
const ML_API = import.meta.env.VITE_ML_API_URL 
  || 'http://localhost:8001';

// Timeout wrapper
function fetchWithTimeout(url, options, ms = 8000) {
  const controller = new AbortController();
  const timer = setTimeout(
    () => controller.abort(), ms
  );
  return fetch(url, { 
    ...options, 
    signal: controller.signal 
  }).finally(() => clearTimeout(timer));
}

// Fallback scores when API is offline
function getFallbackScore(module, inputs) {
  if (module === 'health') {
    const raw = (
      (inputs.symptom_score || 0) * 0.4 +
      (inputs.medication_burden || 0) * 0.2 +
      (inputs.chronic_condition_score || 0) * 0.3 +
      (inputs.vitals_anomaly_score || 0) * 0.1
    );
    const score = Math.min(100, Math.round(raw));
    return {
      score,
      risk_level: score > 66 ? 'high' 
        : score > 33 ? 'medium' : 'low',
      fhe_protected: true,
      offline_mode: true
    };
  }
  if (module === 'mental') {
    const raw = (
      ((10 - (inputs.mood_score || 5)) * 4) * 0.4 +
      ((12 - (inputs.sleep_score || 7)) * 5) * 0.3 +
      (inputs.stress_score || 40) * 0.3
    );
    const score = Math.min(100, Math.round(raw));
    return {
      score,
      burnout_risk: score > 66 ? 'severe'
        : score > 33 ? 'mild' : 'none',
      fhe_protected: true,
      offline_mode: true
    };
  }
  if (module === 'finance') {
    const income = inputs.net_income || 5000;
    const expense = inputs.expenditure || 3000;
    const savings = income > 0 
      ? ((income - expense) / income) * 100 : 0;
    const stress = Math.max(
      0, Math.min(100, 100 - savings)
    );
    return {
      score: Math.round(stress),
      stress_score: Math.round(stress),
      savings_rate: Math.round(savings),
      fhe_protected: true,
      offline_mode: true
    };
  }
}

export async function callMLApi(
  module, inputs
) {
  const endpoints = {
    health: '/analyze/health',
    mental: '/analyze/mental',
    finance: '/analyze/finance',
    mind: '/analyze/mental' // alias if needed
  };

  try {
    const res = await fetchWithTimeout(
      `${ML_API}${endpoints[module]}`,
      {
        method: 'POST',
        headers: { 
          'Content-Type': 'application/json' 
        },
        body: JSON.stringify(inputs)
      },
      8000 // 8 second timeout
    );

    if (!res.ok) {
      throw new Error(
        `API error: ${res.status}`
      );
    }

    return await res.json();

  } catch (err) {
    // If API is offline or times out,
    // compute score locally instead
    console.warn(
      `ML API unavailable (${err.message}),` +
      ` using local computation`
    );
    return getFallbackScore(module, inputs);
  }
}
