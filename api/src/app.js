  const express = require("express");
  const bodyParser = require("body-parser");
  const cors = require("cors");
  const morgan = require("morgan");
  require("dotenv").config();
  const { engine } = require("express-handlebars");
  const cookieParser = require("cookie-parser");
  const { errorHandler } = require("./utils/error.js");
  const path = require("path");
  
  // const config = require("./config/config");

  //export router
  const userRouter = require(`./routes/user.route`);
  const authRouter = require("./routes/auth.route");
  const productRouter = require("./routes/product.route");
  const orderRouter = require("./routes/order.route");
  const eventRoutes = require('./routes/events');
  const currencyRoutes = require('./routes/currency');
  const rateRoutes = require('./routes/rate');
  const productimg = require('./routes/productimg.js');
  //datebase setup
  const db = require("./models/index.js");
  const PORT = 5000;

  const app = express(); // create your express app
  //app.use(morgan('combined')) // log requests source if needed
  app.use(bodyParser.json()); // parse json requests
  app.use(cors()); // enable cors
  app.use(express.static(path.join(__dirname, "Resources")));
  app.use(express.json());
  app.use(cookieParser());
  
  //get
  //post
  //put
  //delete
  //patch
  



  
  app.use("/api/user", userRouter);
  app.use("/api/auth", authRouter);
  app.use("/api/product", productRouter);
  app.use("/api/order", orderRouter);
  app.use('/api/events', eventRoutes);
  app.use('/api/currency', currencyRoutes);
  app.use('/api/rate', rateRoutes);
  app.use('/api/productimg', productimg);
  app.use((err, req, res, next) => {
    const statusCode = err.statusCode || 500;
    const message = err.message || "Internal Server Error";
    return res.status(statusCode).json({
      success: false,
      message,
    });
  });

  
  // routes (endpoints)
  // require('./routes')(app)

  db.sequelize.sync().then((req) => {
    app.listen(PORT);
    console.log("Serving static files from:", path.join(__dirname, '..', '..','..', 'furniture-world', 'public', 'images','products'));
    console.log(`Server started in port ${PORT}`);
  });
