// scripts/updateDollarRate.js
const https = require('https');
const mysql = require('mysql2');

// API
const apiKey = 'b360fdf2d35bfdb36d882e0e';
const apiUrl = `https://v6.exchangerate-api.com/v6/${apiKey}/latest/USD`;

// DB connection
const db = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: '', // حط الباسورد بتاعك هنا لو فيه
  database: 'furniscape' // غيرها لو اسم الداتا بيز مختلف
});

https.get(apiUrl, (res) => {
  let data = '';

  // Collect response chunks
  res.on('data', chunk => {
    data += chunk;
  });

  // Response ended
  res.on('end', () => {
    try {
      const json = JSON.parse(data);
      const rate = json.conversion_rates.EGP;

      if (!rate) {
        console.error("❌ Couldn't find EGP rate");
        return;
      }

      // Insert or update currency table
      const currencyName = 'USD';
      const query = `
        INSERT INTO currency (curreny, rate_to_egp)
        VALUES (?, ?)
        ON DUPLICATE KEY UPDATE rate_to_egp = VALUES(rate_to_egp)
      `;

      db.query(query, [currencyName, rate], (err, result) => {
        if (err) {
          console.error('❌ Database Error:', err);
        } else {
          console.log(`✅ Dollar rate saved: 1 USD = ${rate} EGP`);
        }

        db.end(); // Close DB connection
      });

    } catch (err) {
      console.error('❌ Error parsing response:', err.message);
    }
  });

}).on('error', (err) => {
  console.error('❌ HTTPS Request Failed:', err.message);
});
