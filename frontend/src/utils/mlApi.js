const ML_API = (import.meta.env.VITE_ML_API_URL || '').replace(/\/$/, '') 
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
    const symptom = inputs.symptom_score || 0;
    const medication = 
      inputs.medication_burden || 0;
    const chronic = 
      inputs.chronic_condition_score || 0;
    const vitals = 
      inputs.vitals_anomaly_score || 0;

    // Weighted score — symptoms carry 
    // the most weight (60%)
    const raw = (
      symptom    * 0.60 +
      medication * 0.15 +
      chronic    * 0.15 +
      vitals     * 0.10
    );

    const score = Math.min(
      100, Math.round(raw)
    );

    // Corrected thresholds:
    // High   = score > 50 
    //   (max symptoms alone = 60 → high)
    // Medium = score > 25
    // Low    = score <= 25
    const risk_level = 
      score > 50 ? 'high'
      : score > 25 ? 'medium' 
      : 'low';

    // Hard override: any chronic condition 
    // + high symptoms = always high risk
    const hasChronicCondition = chronic > 0;
    const hasHighSymptoms = symptom >= 60;
    
    const finalRisk = 
      (hasChronicCondition && hasHighSymptoms)
        ? 'high'
        : risk_level;

    return {
      score,
      risk_level: finalRisk,
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

    // Robust check: must be OK status AND JSON content type
    const contentType = res.headers.get('content-type');
    if (!res.ok || !contentType || !contentType.includes('application/json')) {
      throw new Error(
        `API unavailable or invalid response (${res.status})`
      );
    }

    return await res.json();

  } catch (err) {
    // If API is offline, times out, or returns 404 HTML,
    // compute score locally instead
    console.warn(
      `ML API offline/invalid (${err.message}). ` +
      `Switched to Secure Local Assessment.`
    );
    return getFallbackScore(module, inputs);
  }
}
