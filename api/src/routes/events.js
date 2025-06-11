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

router.get('/event-message', (req, res) => {
  const query = 'SELECT message FROM event_result ORDER BY updated_at DESC LIMIT 1';

  db.query(query, (err, result) => {
    if (err) return res.status(500).json({ error: err.message });

    if (result.length > 0) {
      res.json(result[0]);
    } else {
      res.status(404).json({ message: 'No event data found' });
    }
  });
});

module.exports = router;


