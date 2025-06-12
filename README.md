#  🛋️ Heavenly Touch - Furniture Project

Welcome to Heavenly Touch, an innovative e-commerce platform for furniture retail.We combine cutting-edge technology with user-centric design. Explore our wide range of furniture and enjoy special offers.
Heavenly Touch features secure user and admin signup pages. A promotional banner highlights new collections and discounts. Users can browse furniture categories like dining, living, and bedroom.




---

## 🛠️ Requirements

- Node.js (v18 or higher recommended)
- npm (comes with Node.js)
- MySQL or MariaDB (xampp or any DB application)

---
# 1. Clone the Repository

git clone https://github.com/Abd0TaReK5/graduation_project.git
cd graduation_project

---
## 2. Install Dependencies
You need to install node_modules for both frontend and backend:

Backend (api folder)
- cd api
- npm install


Frontend (furniture-world folder)
- cd ../furniture-world
- npm install

---
### 3. Set Up the Database
- install xampp or laragon for Database management
- Open phpMyAdmin or any MySQL client.

Import the SQL file:

- File name: DB.sql

This file contains all the necessary tables and data.

Update your backend database config (api/config/db.js or your .env file) with:

env
DB_HOST=localhost
DB_USER=root
DB_PASSWORD=
DB_NAME=furniscape
(Make sure to adjust credentials according to your setup)

---
## 4. Ai part 

- cd api/currency-app
- npm server.js (to run the backend server for updating the banner using the model)
- open index.html(test Ai page) in public folder
- press Update Prices and Get Sales Prediction
- the banner should be updated based on the model
- check Database for updated tables (currency,event_result)
- now when you run the project the banner on the home page should be displayed and updated!!
- close the server...

---
#### 5. Run the Backend Server
- cd api
- npm start
- This will run the backend on: http://localhost:5000 (or any port defined in your code)

---
##### 6. Run the Frontend App

In a new terminal:

- cd furniture-world
- npm start
- This will start the frontend (usually on http://localhost:3000) and connects to the backend

---
# ✅ Everything Ready?
You should now have:

- Backend running on port 5000
- Frontend running on port 3000
- Database imported and connected
- Ai currenct-app and banner-view is ready!!
---

# 📄 License
This project is for educational and commercial purposes. Free to modify and extend.
