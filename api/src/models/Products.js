module.exports = (sequelize, DataTypes) => {
  const Product = sequelize.define('Product', {
    id: {
      type: DataTypes.INTEGER,
      primaryKey: true,
      autoIncrement: true,
    },
    name: DataTypes.STRING,
    description: DataTypes.STRING,
    price: DataTypes.FLOAT,
    image_url: DataTypes.STRING,
    category: DataTypes.STRING,  // حطينا category هنا
    status: DataTypes.STRING,    // حطينا status هنا
    quantity: DataTypes.INTEGER, // حطينا quantity هنا
    createdAt: DataTypes.DATE,
    updatedAt: DataTypes.DATE,
  });

  return Product;
};
