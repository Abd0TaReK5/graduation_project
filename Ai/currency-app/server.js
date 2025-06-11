const express = require('express');
const axios = require('axios');
const fs = require('fs');
const { exec } = require('child_process');
const app = express();
const PORT = 3000;

// API for exchange rate
const apiKey = 'b360fdf2d35bfdb36d882e0e';
const apiUrl = `https://v6.exchangerate-api.com/v6/${apiKey}/latest/USD`;

// Serve static files (frontend)
app.use(express.static('public'));

// Fetch currency exchange data
app.get('/api/data', async (req, res) => {
  try {
    const exchangeRes = await axios.get(apiUrl);
    const rates = exchangeRes.data.conversion_rates;

    if (!rates || !rates.EGP) {
      return res.status(500).json({ error: "EGP doesn't exist" });
    }

    const dollarToEGP = rates.EGP;

    // Read products from file
    const products = JSON.parse(fs.readFileSync('products.json', 'utf-8'));

    // Update product prices based on currency rate
    const updatedProducts = products.map(p => ({
      name: p.name,
      price_usd: p.price_usd,
      price_egp: (p.price_usd * dollarToEGP).toFixed(2)
    }));

    res.json({ dollar_rate: dollarToEGP, products: updatedProducts });

  } catch (err) {
    console.error(" Error in /api/data:", err.message);
    res.status(500).json({ error: "Error fetching data" });
  }
});

app.use(express.static('public')); // serves index.html

app.get('/api/event-message', (req, res) => {
  exec('python model/sales_prediction.py', (error, stdout, stderr) => {
    if (error || stderr) {
      console.error("Python error:", error || stderr);
      return res.status(500).json({ message: "⚠️ Event data unavailable" });
    }

    try {
      const data = JSON.parse(stdout);
      res.json({ message: data.message });  // Only send the message to banner
    } catch (e) {
      res.status(500).json({ message: "⚠️ Invalid event data" });
    }
  });
});


// AI-based sales prediction
app.get('/api/prediction', (req, res) => {
  exec('python model/sales_prediction.py', { timeout: 10000 }, (error, stdout, stderr) => {
    if (error) {
      console.error(`Error: ${error.message}`);
      return res.status(500).json({ error: 'Prediction failed' });
    }

    try {
      const prediction = JSON.parse(stdout);
      res.json(prediction);
    } catch (e) {
      console.error('Parsing error:', stdout);
      res.status(500).json({ error: 'Invalid JSON output from Python' });
    }
  });
});

// Start server
app.listen(PORT, () => {
  console.log(`Server running at http://localhost:${PORT}`);
});
