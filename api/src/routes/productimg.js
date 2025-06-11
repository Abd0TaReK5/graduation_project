const express = require('express');
const router = express.Router();
const db = require('../models');
console.log("Available Models:", Object.keys(db));
const path = require('path');
const fs = require('fs');

// راجع الموديلات المتاحة
console.log("Available Models:", Object.keys(db));

router.get('/getProductPicture', async (req, res) => {
  try {
    const productId = req.query.id;
    const product = await db.Product.findByPk(productId);
      const imagePath = path.join(__dirname, '..','..','..','furniture-world', 'public', product.image_url);
      console.log('Image path:', imagePath);  // طباعة المسار لنتأكد

    if (!product || !product.image_url) {
      return res.status(400).json({ message: 'Image path is null or undefined' });
    }

    

    if (!fs.existsSync(imagePath)) {
      return res.status(404).json({ message: 'Image not found on disk' });
    }

    res.sendFile(imagePath);
  } catch (error) {
    console.error('Error fetching product image:', error);
    res.status(500).json({ message: 'Internal server error' });
  }
});

module.exports = router;
