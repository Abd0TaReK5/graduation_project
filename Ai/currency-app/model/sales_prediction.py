import json
from datetime import datetime, timedelta
import joblib
import pandas as pd
import numpy as np
from tensorflow.keras.models import load_model
import mysql.connector
from datetime import datetime

# Load models
clf = joblib.load('model/event_classifier.joblib')
# lstm = load_model('model/event_lstm.h5', compile=False)

# Load and parse event data
df = pd.read_csv('data/events.csv')
df['date'] = pd.to_datetime(df['date'], format='%m/%d/%Y')
df = df.sort_values('date')
df['delta'] = df['date'].diff().dt.days.fillna(0)

# Get today's date
today = datetime.today()
features = pd.DataFrame([{  
    'month': today.month,
    'weekday': today.weekday(),
}])

# Predict if today is an event
is_event = bool(clf.predict(features)[0])

# Check if today is in the events list
today_event = df[df['date'] == pd.to_datetime(today.date())]

if not today_event.empty:
    # Today is a known event from the file
    event_name = today_event.iloc[0]['event']
    discount = today_event.iloc[0]['discount']
    msg = f"🎉 Today is {event_name} and we have a {discount} discount!"
    next_event_date = today_event.iloc[0]['date']
    days_left = 0
else:
    # Find the next upcoming event
    upcoming = df[df['date'] > today]
    if not upcoming.empty:
        next_event = upcoming.iloc[0]
        next_event_date = next_event['date']
        event_name = next_event['event']
        discount = next_event['discount']
        days_left = (next_event_date - today).days
        msg = f"Next event: {event_name} on {next_event_date.date()} with {discount} discount, Stay Tuned!"
    # else:
    #     # No future events in file — predict next using LSTM (under development)
    #     deltas = df['delta'].values[-5:].reshape(1, -1, 1)
    #     pred_days = int(lstm.predict(deltas)[0, 0])
    #     next_event_date = df['date'].max() + timedelta(days=pred_days)
    #     event_name = "Predicted Event"
    #     discount = "TBD"
    #     days_left = (next_event_date - today).days
    #     msg = f"Next predicted event on {next_event_date.date()} with {discount} discount!"

# Output result
print(json.dumps({
    'is_event_today': is_event,
    'event_name': event_name,
    'next_event': next_event_date.strftime('%Y-%m-%d'),
    'discount': discount,
    'days_left': days_left,
    'message': msg
}))


conn = mysql.connector.connect(
    host='localhost',
    user='root',
    password='',  
    database='furniscape'
)
cursor = conn.cursor()

# امسح القديم (لو عايز تخزن واحدة بس كل مرة)
cursor.execute("DELETE FROM event_result")

# خزّن الجديد
sql = """
INSERT INTO event_result (is_event_today, event_name, next_event, discount, days_left, message, updated_at)
VALUES (%s, %s, %s, %s, %s, %s, %s)
"""
values = (
    is_event,
    event_name,
    next_event_date.strftime('%Y-%m-%d'),
    discount,
    days_left,
    msg,
    datetime.now().strftime('%Y-%m-%d %H:%M:%S')
)

cursor.execute(sql, values)
conn.commit()
cursor.close()
conn.close()