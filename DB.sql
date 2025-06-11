-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 09, 2025 at 09:48 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `furniscape`
--
CREATE DATABASE IF NOT EXISTS `furniscape` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `furniscape`;

-- --------------------------------------------------------

--
-- Table structure for table `currency`
--

CREATE TABLE `currency` (
  `id` int(11) NOT NULL,
  `curreny` varchar(255) DEFAULT NULL,
  `rate_to_egp` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `currency`
--

INSERT INTO `currency` (`id`, `curreny`, `rate_to_egp`) VALUES
(1, 'USD', 50);

-- --------------------------------------------------------

--
-- Table structure for table `event_result`
--

CREATE TABLE `event_result` (
  `id` int(11) NOT NULL,
  `is_event_today` tinyint(1) DEFAULT NULL,
  `event_name` varchar(255) DEFAULT NULL,
  `next_event` date DEFAULT NULL,
  `discount` varchar(100) DEFAULT NULL,
  `days_left` int(11) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `event_result`
--

INSERT INTO `event_result` (`id`, `is_event_today`, `event_name`, `next_event`, `discount`, `days_left`, `message`, `updated_at`) VALUES
(1, 1, 'Eid al-Adha', '2025-06-06', '33%', 22, 'Eid al-Adha on 2025-06-06 with 33% discount, Stay Tuned!', '2025-05-14 15:33:46');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `userId` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `status` varchar(255) NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `payment` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_product`
--

CREATE TABLE `order_product` (
  `orderId` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `productId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_products`
--

CREATE TABLE `order_products` (
  `orderId` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `productId` int(11) NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `price` decimal(8,2) NOT NULL,
  `image_url` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL DEFAULT current_timestamp(),
  `updatedAt` datetime NOT NULL DEFAULT current_timestamp(),
  `category` varchar(255) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `quantity` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `description`, `price`, `image_url`, `createdAt`, `updatedAt`, `category`, `status`, `quantity`) VALUES
(1, 'Wooden Dining Table Set', 'Solid wood table with 4 chairs, ideal for family meals.', 200.00, '/images/products/1.jpg', '2025-05-14 00:42:45', '2025-05-14 21:34:49', 'Dining Room', 'available', 10),
(2, 'Round Glass Dining Table', 'Modern round table with tempered glass top.', 180.00, '/images/products/2.jpg', '2025-05-14 00:42:45', '2025-05-14 00:42:45', 'Dining Room', 'available', 6),
(3, 'Rustic Farmhouse Bench', 'Perfect for farmhouse-style dining rooms.', 80.00, '/images/products/3.jpg', '2025-05-14 00:42:45', '2025-05-14 00:42:45', 'Dining Room', 'available', 4),
(4, 'Upholstered Dining Chairs (Set of 2)', 'Comfortable and stylish fabric chairs.', 135.00, '/images/products/4.jpg', '2025-05-14 00:42:45', '2025-05-14 00:42:45', 'Dining Room', 'available', 8),
(5, 'Queen Size Platform Bed', 'Wooden frame with modern low-profile design.', 500.00, '/images/products/5.jpg', '2025-05-14 00:42:45', '2025-05-14 00:42:45', 'Bedroom', 'available', 5),
(6, 'Nightstand with Drawer', 'Sleek nightstand for bedside storage.', 75.00, '/images/products/6.jpg', '2025-05-14 00:42:45', '2025-05-14 00:42:45', 'Bedroom', 'available', 12),
(7, 'Wardrobe Closet', 'Spacious wardrobe with shelves and hangers.', 320.00, '/images/products/7.jpg', '2025-05-14 00:42:45', '2025-05-14 00:42:45', 'Bedroom', 'available', 3),
(8, 'Memory Foam Mattress', 'High-quality memory foam for comfort.', 899.99, '/images/products/8.jpg', '2025-05-14 00:42:45', '2025-05-14 00:42:45', 'Bedroom', 'available', 7),
(9, 'Kitchen Island with Storage', 'Centerpiece island for extra prep space and storage.', 420.00, '/images/products/9.jpg', '2025-05-14 00:42:45', '2025-05-14 00:42:45', 'Kitchen', 'available', 4),
(10, 'Bar Stools (Set of 2)', 'Adjustable stools with footrest.', 220.00, '/images/products/10.jpg', '2025-05-14 00:42:45', '2025-05-14 00:42:45', 'Kitchen', 'available', 10),
(11, 'Pantry Cabinet', 'Tall cabinet for organized kitchen storage.', 230.00, '/images/products/11.jpg', '2025-05-14 00:52:26', '2025-05-14 00:52:26', 'Kitchen', 'available', 3),
(12, 'Rolling Utility Cart', 'Multi-functional for serving and storage.', 70.00, '/images/products/12.jpg', '2025-05-14 00:52:26', '2025-05-14 00:52:26', 'Kitchen', 'available', 6),
(13, 'Ergonomic Office Chair', 'Back-supporting chair for all-day comfort.', 160.00, '/images/products/13.jpg', '2025-05-14 00:52:26', '2025-05-14 00:52:26', 'Office', 'available', 8),
(14, 'Adjustable Standing Desk', 'Electric height-adjustable for sitting or standing.', 300.00, '/images/products/14.jpg', '2025-05-14 00:52:26', '2025-05-14 00:52:26', 'Office', 'available', 5),
(15, 'Filing Cabinet', 'Metal drawer cabinet with lock.', 199.99, '/images/products/15.jpg', '2025-05-14 00:52:26', '2025-05-14 00:52:26', 'Office', 'available', 4),
(16, 'Office Bookshelf', '5-tier shelf for books and decor.', 229.99, '/images/products/16.jpg', '2025-05-14 00:52:26', '2025-05-14 00:52:26', 'Office', 'available', 9),
(17, 'L-Shaped Sofa', 'Spacious and stylish for modern living rooms.', 1099.99, '/images/products/17.jpg', '2025-05-14 00:52:26', '2025-05-14 00:52:26', 'Living Room', 'available', 2),
(18, 'Coffee Table with Storage', 'Modern coffee table with hidden storage.', 280.00, '/images/products/18.jpg', '2025-05-14 00:52:26', '2025-05-14 00:52:26', 'Living Room', 'available', 6),
(19, 'black Media shelf', 'TV stand with shelves and cable management.', 330.00, '/images/products/19.jpg', '2025-05-14 03:06:21', '2025-05-14 03:06:21', 'Living Room', 'available', 3),
(20, 'Accent Armchair', 'Colorful armchair for a cozy corner.', 235.00, '/images/products/20.jpg', '2025-05-14 03:06:21', '2025-05-14 03:06:21', 'Living Room', 'available', 4);

-- --------------------------------------------------------

--
-- Table structure for table `sequelizemeta`
--

CREATE TABLE `sequelizemeta` (
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sequelizemeta`
--

INSERT INTO `sequelizemeta` (`name`) VALUES
('20250513201612-create-products.js');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `role` varchar(255) DEFAULT NULL,
  `fullname` varchar(255) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `profileImg_dir` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `password`, `role`, `fullname`, `phone`, `address`, `country`, `profileImg_dir`, `createdAt`, `updatedAt`) VALUES
('5887eb32-1ca3-4380-9d9c-e9254e0d3071', 'mohamedkhalil12@gmail.com', '$2a$10$aqHPPpoFY87zL.MWiv1MV..yyh0vo3Ofix7O6sl1.xrsv./XwVbhW', 'admin', 'mohamed khalid khalil', '02385123746', 'menofia', 'Egypt', NULL, '2025-06-09 18:42:15', '2025-06-09 18:42:15'),
('9b90e9e9-f1de-488a-8f58-0ef9ee964769', 'abdelrahman123@gmail.com', '$2a$10$uwFRaLKsbMNR0EZ3wcAZb.pm2bj7ybX/LgFlRPJjGudrJx75qXvwq', 'user', 'abdo tarek', '01124853453', 'menofia', 'Egypt', NULL, '2025-05-13 21:14:25', '2025-05-13 21:14:25'),
('9f9956aa-5187-49f1-b79c-1ff1e5f061fd', 'admin@hotmail.com', '$2a$10$dWs8Py92dXUAdbbIlC2TKuNml3MTd9zVrYZdHvPAnuvZimGA1j66S', 'admin', 'mohamed nabil', '01096192125', 'menofia', 'Egypt', NULL, '2025-05-14 21:06:01', '2025-05-14 21:06:01');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `currency`
--
ALTER TABLE `currency`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `event_result`
--
ALTER TABLE `event_result`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `userId` (`userId`);

--
-- Indexes for table `order_product`
--
ALTER TABLE `order_product`
  ADD PRIMARY KEY (`orderId`,`productId`),
  ADD KEY `productId` (`productId`);

--
-- Indexes for table `order_products`
--
ALTER TABLE `order_products`
  ADD PRIMARY KEY (`orderId`,`productId`),
  ADD KEY `productId` (`productId`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sequelizemeta`
--
ALTER TABLE `sequelizemeta`
  ADD PRIMARY KEY (`name`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `currency`
--
ALTER TABLE `currency`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `event_result`
--
ALTER TABLE `event_result`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=211;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `order_product`
--
ALTER TABLE `order_product`
  ADD CONSTRAINT `order_product_ibfk_1` FOREIGN KEY (`orderId`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `order_product_ibfk_2` FOREIGN KEY (`productId`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `order_products`
--
ALTER TABLE `order_products`
  ADD CONSTRAINT `order_products_ibfk_1` FOREIGN KEY (`orderId`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `order_products_ibfk_2` FOREIGN KEY (`productId`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
