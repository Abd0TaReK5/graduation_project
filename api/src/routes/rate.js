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

router.get('/rate', async (req, res) => {
  try {
    const [results] = await db.promise().query('SELECT rate_to_egp FROM currency WHERE curreny = "USD" LIMIT 1');

    if (results.length === 0) {
      return res.status(404).json({ error: 'Rate not found' });
    }

    res.json({ rate: results[0].rate_to_egp });

  } catch (err) {
    console.error("Error in /rate:", err.message);
    res.status(500).json({ error: "Something went wrong" });
  }
});

module.exports = router;
