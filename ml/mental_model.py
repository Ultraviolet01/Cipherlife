import numpy as np
from concrete.ml.sklearn import DecisionTreeClassifier
from sklearn.model_selection import train_test_split
from sklearn.metrics import accuracy_score
import time

# 1. Generate synthetic data for mental health burnout risk
def generate_mental_data(n_samples=500):
    np.random.seed(43)
    
    # Features: mood (0-10), sleep_hours (0-12), stress (0-10), social_score (0-10)
    X = np.zeros((n_samples, 4))
    X[:, 0] = np.random.randint(0, 11, n_samples)  # mood
    X[:, 1] = np.random.randint(0, 13, n_samples)  # sleep
    X[:, 2] = np.random.randint(0, 11, n_samples)  # stress
    X[:, 3] = np.random.randint(0, 11, n_samples)  # social
    
    # Ground truth logic: Higher stress and lower sleep/mood increases burnout risk
    # points = (10 - mood) + (12 - sleep) + stress + (10 - social)
    risk_points = (10 - X[:, 0]) + (12 - X[:, 1]) + X[:, 2] + (10 - X[:, 3])
    
    y = np.zeros(n_samples, dtype=int)
    y[risk_points < 12] = 0  # Low / None
    y[(risk_points >= 12) & (risk_points < 25)] = 1 # Mild
    y[risk_points >= 25] = 2 # Severe
    
    return X, y

def main():
    print("--- CipherLife Mental Health Burnout Classifier ---")
    X, y = generate_mental_data()
    X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=43)

    # Use a DecisionTreeClassifier from Concrete ML
    # max_depth=4 as requested for FHE efficiency
    model = DecisionTreeClassifier(max_depth=4)
    
    print("Training model...")
    model.fit(X_train, y_train)

    print("Compiling model for FHE...")
    start_compile = time.time()
    model.compile(X_train)
    end_compile = time.time()
    print(f"Compilation finished in {end_compile - start_compile:.2f}s")
    
    def encrypted_inference(inputs):
        return model.predict(inputs, fhe="execute")

    print("\nRunning inference comparison...")
    test_samples = X_test[:3]
    y_pred_clear = model.predict(test_samples)
    y_pred_fhe = encrypted_inference(test_samples)
    
    accuracy = accuracy_score(y_test, model.predict(X_test))
    print(f"Model Accuracy: {accuracy * 100:.2f}%")
    print(f"FHE Match: {(y_pred_clear == y_pred_fhe).all()}")

if __name__ == "__main__":
    main()
