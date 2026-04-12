import json

def compute_life_wellness_score(health_risk, burnout_risk, financial_stress):
    """
    Aggregates scores from all 3 FHE domains.
    health_risk: 0 (Low), 1 (Med), 2 (High)
    burnout_risk: 0 (Low), 1 (Med), 2 (High)
    financial_stress: 0-100 (High = bad)
    """
    # Inverse scales so higher = better (Wellness)
    health_score = (2 - health_risk) * 50  # 0->100, 1->50, 2->0
    mental_score = (2 - burnout_risk) * 50 # 0->100, 1->50, 2->0
    finance_score = 100 - financial_stress
    
    # Unified Wellness Score (Simple Average)
    wellness_score = (health_score + mental_score + finance_score) / 3
    
    # Pattern Detection
    patterns = []
    
    # 1. Stress & Debt Correlation
    if burnout_risk >= 1 and financial_stress > 60:
        patterns.append({
            "correlation": "Finance-Mental Tension",
            "message": "Critical: High financial stress is correlating with emerging burnout risk.",
            "severity": "High"
        })
    
    # 2. Chronic Workload Impact
    if health_risk >= 1 and burnout_risk >= 2:
        patterns.append({
            "correlation": "Health-Burnout Synergy",
            "message": "Warning: Severe burnout is beginning to impact somatic health metrics.",
            "severity": "Critical"
        })
        
    return {
        "unified_score": round(wellness_score, 2),
        "domain_breakdown": {
            "health": health_score,
            "mental": mental_score,
            "finance": round(finance_score, 2)
        },
        "patterns": patterns,
        "status": "Healthy" if wellness_score > 70 else "At Risk" if wellness_score > 40 else "Critical"
    }

def main():
    # Example usage with mock outputs from our 3 FHE models
    # Case: Normal user with some debt
    print("--- CipherLife Cross-Domain Analysis Engine ---")
    
    result = compute_life_wellness_score(
        health_risk=0,       # Low risk
        burnout_risk=1,      # Mild burnout
        financial_stress=65   # Moderate-High stress
    )
    
    print(json.dumps(result, indent=2))

if __name__ == "__main__":
    main()
