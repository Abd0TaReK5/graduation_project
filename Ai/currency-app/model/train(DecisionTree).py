import pandas as pd
from sklearn.tree import DecisionTreeClassifier
import joblib

# Load the events data from CSV
df = pd.read_csv('data/events.csv')

# Convert date to datetime format
df['date'] = pd.to_datetime(df['date'])

# Extract features: month and weekday from the date
df['month'] = df['date'].dt.month
df['weekday'] = df['date'].dt.weekday

# Map event column to binary (1 for event, 0 for non-event)
df['is_event'] = df['event'].apply(lambda x: 1 if x else 0)

# Features (input): 'month', 'weekday'
X = df[['month', 'weekday']]

# Target (output): 'is_event'
y = df['is_event']

# Train the Decision Tree Classifier
clf = DecisionTreeClassifier()
clf.fit(X, y)

# Save the trained model to a file
joblib.dump(clf, 'model/event_classifier.joblib')

print("Model training complete and saved.")
