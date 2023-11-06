-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 06, 2023 at 05:21 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ecommerce`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(50) NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 'mobile', 1, '2023-11-06 14:23:08', '2023-11-06 14:23:08'),
(2, 'computer', 1, '2023-11-06 14:23:31', '2023-11-06 14:23:31'),
(3, 'Watch', 1, '2023-11-06 14:27:01', '2023-11-06 14:27:01'),
(4, 'pen', 1, '2023-11-06 14:27:14', '2023-11-06 14:27:14'),
(5, 'book', 2, '2023-11-06 14:27:28', '2023-11-06 14:27:28'),
(6, 'head phone', 2, '2023-11-06 14:27:53', '2023-11-06 14:27:53');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(50) NOT NULL,
  `mobile` varchar(50) NOT NULL,
  `location` varchar(350) NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `email`, `mobile`, `location`, `user_id`, `created_at`, `updated_at`) VALUES
(2, 'mdmhddin@gmail.com', '01831332732', 'Dhaka Bangladesh', 1, '2023-11-06 14:39:55', '2023-11-06 14:39:55'),
(3, 'mwtbd@gmail.com', '01831332732', 'Dhaka Bangladesh', 2, '2023-11-06 14:40:28', '2023-11-06 14:40:28'),
(4, 'mtw@gmail.com', '01911555084', 'Bangladesh', 3, '2023-11-06 14:41:25', '2023-11-06 14:41:25'),
(5, 'demo@gmail.com', '01911555084', 'Bangladesh', 5, '2023-11-06 14:41:54', '2023-11-06 14:41:54'),
(6, 'demo@gmail.com', '01911555084', 'Bangladesh', 5, '2023-11-06 14:42:06', '2023-11-06 14:42:06');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `total_amount` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `customer_id`, `user_id`, `total_amount`, `created_at`, `updated_at`) VALUES
(1, 5, 5, '1000', '2023-11-06 14:43:09', '2023-11-06 14:43:09'),
(2, 3, 3, '3000', '2023-11-06 14:43:36', '2023-11-06 14:43:36'),
(3, 3, 3, '4000', '2023-11-06 14:43:50', '2023-11-06 14:43:50'),
(4, 3, 3, '4000', '2023-11-06 14:43:57', '2023-11-06 14:43:57'),
(5, 3, 3, '6000', '2023-11-06 15:19:52', '2023-11-06 15:19:52');

-- --------------------------------------------------------

--
-- Table structure for table `order_otems`
--

CREATE TABLE `order_otems` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `cat_id` int(20) NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `quantity` varchar(50) NOT NULL,
  `unit_price` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_otems`
--

INSERT INTO `order_otems` (`id`, `product_id`, `cat_id`, `order_id`, `quantity`, `unit_price`, `created_at`, `updated_at`) VALUES
(1, 5, 4, 3, '5', '4000', '2023-11-06 14:44:23', '2023-11-06 15:57:18'),
(2, 5, 4, 3, '5', '4000', '2023-11-06 14:44:41', '2023-11-06 15:57:22'),
(3, 5, 4, 3, '5', '4000', '2023-11-06 14:44:47', '2023-11-06 15:57:25');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `price` varchar(50) NOT NULL,
  `unit` varchar(50) NOT NULL,
  `img_url` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `user_id`, `category_id`, `name`, `price`, `unit`, `img_url`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'Wireless Bluetooth Headphone', '350', '10', '', '2023-11-06 14:34:20', '2023-11-06 14:34:20'),
(2, 1, 2, 'TRIPOD 330A Professional Aluminum computer', '400', '5', '', '2023-11-06 14:35:34', '2023-11-06 14:35:34'),
(3, 2, 6, 'TRIPOD 330A Professional Aluminum headphone', '250', '10', '', '2023-11-06 14:36:31', '2023-11-06 14:36:31'),
(4, 2, 3, 'TRIPOD 330A Professional Aluminum headphone', '250', '10', '', '2023-11-06 14:36:51', '2023-11-06 14:36:51'),
(5, 2, 4, 'TRIPOD 330A Professional Aluminum', '300', '10', '', '2023-11-06 14:37:12', '2023-11-06 14:37:12'),
(6, 2, 4, 'TRIPOD 330A Professional Aluminum headphone', '340', '50', '', '2023-11-06 14:37:39', '2023-11-06 14:37:39');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `firstName` varchar(50) NOT NULL,
  `lastName` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `mobile` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `firstName`, `lastName`, `email`, `mobile`, `password`, `created_at`, `updated_at`) VALUES
(1, 'MD', 'Mohiuddin', 'mdmhddin@gmail.com', '01831332732', 'c78924131dc7907e2e5af7e02925ac4c', '2023-11-06 14:11:03', '2023-11-06 14:11:03'),
(2, 'MD', 'Salman', 'mwtbd@gmail.com', '01911555084', '9efa2d7c97fdbd47a8eac84bfefd97b4', '2023-11-06 14:12:43', '2023-11-06 14:12:43'),
(3, 'MS', 'Salma', 'mtw@gmail.com', '01911555084', '9efa2d7c97fdbd47a8eac84bfefd97b4', '2023-11-06 14:13:32', '2023-11-06 14:13:32'),
(4, 'MD', 'Bhuiyan', 'mtw@gmail.com', '01911555084', '9efa2d7c97fdbd47a8eac84bfefd97b4', '2023-11-06 14:14:37', '2023-11-06 14:14:37'),
(5, 'MD', 'Shahed', 'demo@gmail.com', '01911555084', '9efa2d7c97fdbd47a8eac84bfefd97b4', '2023-11-06 14:15:02', '2023-11-06 14:15:02'),
(6, 'MD', 'Alam', 'demo@gmail.com', '01919055788', '9efa2d7c97fdbd47a8eac84bfefd97b4', '2023-11-06 14:20:22', '2023-11-06 14:20:22'),
(7, 'MD', 'Khaled', 'demo@gmail.com', '01911555084', '9efa2d7c97fdbd47a8eac84bfefd97b4', '2023-11-06 14:21:05', '2023-11-06 14:21:05');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customer_id` (`customer_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `order_otems`
--
ALTER TABLE `order_otems`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `order_id` (`order_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `order_otems`
--
ALTER TABLE `order_otems`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `customers`
--
ALTER TABLE `customers`
  ADD CONSTRAINT `customers_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `order_otems`
--
ALTER TABLE `order_otems`
  ADD CONSTRAINT `order_otems_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `order_otems_ibfk_2` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `products_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
