#  🛋️ Heavenly Touch - Fullstack Project

This is a fullstack furniture shop project built with Node.js for the backend and a separate frontend using modern JavaScript (React or any other JS framework).  
Follow the steps below to install and run the project locally.

---

## 🛠️ Requirements

- Node.js (v18 or higher recommended)
- npm (comes with Node.js)
- MySQL or MariaDB

---
# 1. Clone the Repository

git clone https://github.com/YOUR_USERNAME/YOUR_REPO_NAME.git
cd YOUR_REPO_NAME

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
#### 4. Run the Backend Server
- cd api
- npm start
- This will run the backend on: http://localhost:5000 (or any port defined in your code)

---

###### 5.Run the Frontend App

In a new terminal:

- cd furniture-world
- npm start
This will start the frontend (usually on http://localhost:3000) and connect to the backen

---

✅ Everything Ready?
You should now have:

Backend running on port 5000
Frontend running on port 3000
Database imported and connected

---

📄 License
This project is for educational and commercial purposes. Free to modify and extend.
