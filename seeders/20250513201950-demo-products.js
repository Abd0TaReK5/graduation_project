"use strict";

const products = [
  {
    id: '19',
    name: 'black Media shelf',
    price: 699.99,
    category: 'Living Room',
    image_url: '/images/products/19.jpg',
    description: 'TV stand with shelves and cable management.',
    status: 'available',
    quantity: 3,
    createdAt: new Date().toISOString(),
    updatedAt: new Date().toISOString(),
  },
  {
    id: '20',
    name: 'Accent Armchair',
    price: 594.99,
    category: 'Living Room',
    image_url: '/images/products/20.jpg',
    description: 'Colorful armchair for a cozy corner.',
    status: 'available',
    quantity: 4,
    createdAt: new Date().toISOString(),
    updatedAt: new Date().toISOString(),
  },  
];

module.exports = {
  async up(queryInterface, Sequelize) {
    // أضف العناصر مباشرة بدون التحقق من وجودها مسبقًا
    await queryInterface.bulkInsert('Products', products, {});
  },

  async down(queryInterface, Sequelize) {
    // حذف البيانات لو حبيت ترجاعها
    await queryInterface.bulkDelete('Products', null, {});
  }
};