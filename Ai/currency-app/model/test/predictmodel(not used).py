# models/event_lstm.py
import numpy as np
import pandas as pd
from tensorflow.keras.models import Sequential
from tensorflow.keras.layers import LSTM, Dense
from tensorflow.keras.callbacks import EarlyStopping
import joblib

# 1) Prepare the sequence of days‐since‐last‐event
df = pd.read_csv('events.csv', parse_dates=['date'])  # only rows where label=1
df.sort_values('date', inplace=True)
df['delta'] = df['date'].diff().dt.days.fillna(0)
seq = df['delta'].values

# 2) build training windows
WINDOW = 5
X, y = [], []
for i in range(len(seq) - WINDOW):
    X.append(seq[i:i+WINDOW])
    y.append(seq[i+WINDOW])
X = np.array(X).reshape(-1, WINDOW, 1)
y = np.array(y)

# 3) define/train LSTM
model = Sequential([
    LSTM(32, input_shape=(WINDOW,1)),
    Dense(1)
])
model.compile('adam','mse')
model.fit(X, y, epochs=200, validation_split=0.2,
          callbacks=[EarlyStopping(patience=10)])
model.save('event_lstm.h5')
