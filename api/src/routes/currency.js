const express = require('express');
const router = express.Router();
const mysql = require('mysql2');

// اتصال بقاعدة البيانات
const db = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: '',
  database: 'furniscape'
});

// Get all products with EGP price
router.get('/products', async (req, res) => {
  try {
    // Get exchange rate from DB
    const [currencyResult] = await db.promise().query("SELECT rate_to_egp FROM currency WHERE curreny = 'USD' LIMIT 1");

    if (currencyResult.length === 0) {
      return res.status(500).json({ error: "No USD rate found in DB" });
    }

    const dollarRate = currencyResult[0].rate_to_egp;

    // Get products
    const [products] = await db.promise().query("SELECT id, name, price FROM products");

    // Calculate EGP price
    const updatedProducts = products.map(p => ({
      ...p,
      price_egp: (p.price * dollarRate).toFixed(2)
    }));

    res.json({ dollar_rate: dollarRate, products: updatedProducts });

  } catch (err) {
    console.error("Error in /products:", err.message);
    res.status(500).json({ error: "Something went wrong" });
  }
});

module.exports = router;
