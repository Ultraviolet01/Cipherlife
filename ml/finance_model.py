import numpy as np
from concrete.ml.sklearn import LinearRegression
from sklearn.model_selection import train_test_split
import time

# 1. Generate synthetic data for financial stress score
def generate_finance_data(n_samples=500):
    np.random.seed(44)
    
    # Features: debt_ratio(0-100), savings_rate(0-100), spending_volatility(0-100), income_stability(0-100)
    X = np.zeros((n_samples, 4))
    X[:, 0] = np.random.randint(0, 101, n_samples) # debt_ratio
    X[:, 1] = np.random.randint(0, 101, n_samples) # savings_rate
    X[:, 2] = np.random.randint(0, 101, n_samples) # volatility
    X[:, 3] = np.random.randint(0, 101, n_samples) # stability
    
    # Score logic (0-100): High debt/volatility increases stress, high savings/stability reduces it
    # Normalize inputs to 0-1 for weights
    y = (X[:, 0] * 0.4) + ( (100 - X[:, 1]) * 0.3) + (X[:, 2] * 0.2) + ((100 - X[:, 3]) * 0.1)
    
    # Add some noise and clip to 0-100
    y = np.clip(y + np.random.normal(0, 2, n_samples), 0, 100)
    
    return X, y

def main():
    print("--- CipherLife Financial Stress Regressor ---")
    X, y = generate_finance_data()
    X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=44)

    # Use a LinearRegression from Concrete ML
    # We use 8-bit quantization for high precision on 0-100 scale
    model = LinearRegression(n_bits=8)
    
    print("Training model...")
    model.fit(X_train, y_train)

    print("Compiling model for FHE...")
    start_compile = time.time()
    model.compile(X_train)
    end_compile = time.time()
    print(f"Compilation finished in {end_compile - start_compile:.2f}s")
    
    def encrypted_inference(inputs):
        return model.predict(inputs, fhe="execute")

    print("\nRunning test inference...")
    test_samples = X_test[:3]
    y_pred_clear = model.predict(test_samples)
    y_pred_fhe = encrypted_inference(test_samples)
    
    print(f"Test Predicted Scores: {y_pred_fhe}")
    print(f"FHE Match (rounded): {np.allclose(y_pred_clear, y_pred_fhe, atol=1)}")

if __name__ == "__main__":
    main()
