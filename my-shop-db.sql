-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Feb 13, 2023 at 09:25 AM
-- Server version: 5.7.36
-- PHP Version: 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `my-shop-db`
--

-- --------------------------------------------------------

--
-- Table structure for table `order-products`
--

DROP TABLE IF EXISTS `order-products`;
CREATE TABLE IF NOT EXISTS `order-products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order-id` int(11) NOT NULL,
  `product-id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `order-products`
--

INSERT INTO `order-products` (`id`, `order-id`, `product-id`) VALUES
(6, 4, 8),
(5, 4, 7),
(4, 4, 10),
(7, 5, 10),
(8, 5, 9),
(9, 6, 10),
(10, 6, 10),
(11, 7, 10),
(12, 7, 7),
(13, 8, 7),
(14, 8, 10),
(15, 9, 9),
(16, 9, 8);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
CREATE TABLE IF NOT EXISTS `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user-id` int(11) NOT NULL,
  `status` text NOT NULL,
  `order-date` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user-id`, `status`, `order-date`) VALUES
(6, 7, 'sent', '2022-06-15'),
(5, 7, 'sent', '2022-06-15'),
(4, 10, 'sent', '2022-06-13'),
(7, 1, 'sent', '2022-06-15'),
(8, 11, 'sent', '2022-08-16'),
(9, 11, 'waiting', '2022-08-16');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
CREATE TABLE IF NOT EXISTS `products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` text NOT NULL,
  `description` text NOT NULL,
  `price` int(11) NOT NULL,
  `img-url` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `title`, `description`, `price`, `img-url`) VALUES
(10, 'Aventador', 'Clarkson called this one \"a tame bull\"', 3200000, '/my-shop/assets/uploads/1654863497.jpg'),
(9, 'Reventon', 'A one in a million supercar.', 20000000, '/my-shop/assets/uploads/1654863521.jpg'),
(7, 'Gallardo', 'Quick, agile, and a hell of a car.', 500000, '/my-shop/assets/uploads/1654863540.jpg'),
(8, 'LM002', 'As big as they get, built for military use.', 750000, '/my-shop/assets/uploads/1654863563.jpg'),
(11, 'Countach', 'Old and true, one of the first lambos.', 1500000, '/my-shop/assets/uploads/1654863604.jpg'),
(12, 'Diablo', 'A car worthy for the devil.', 200000, '/my-shop/assets/uploads/1654863635.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` text NOT NULL,
  `password-hash` text NOT NULL,
  `role` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password-hash`, `role`) VALUES
(1, 'linus', '$2y$10$mgnqekoqeA/icw61X8MpI.bXolzceH/U9VFIfcyMKwc49VGhUDZ5q', 'admin'),
(7, 'ple', '$2y$10$zg7QlH4xB/fKqV4ZBgxE8enbKNqvHem6xq3sKwpf4GhCPsjH61QDe', 'admin'),
(8, 'linus2', '$2y$10$X6Sq8ZB03uhZkIQVO.OZUu7LTnE/D/2MP5d/XnJ1dFrw/7PML/Zn2', 'customer'),
(10, 'kunden', '$2y$10$Gz7RomACMo51Z7/VUw.Bs.zaQxb1FycrtzTj.x99gdIp/lg8GMMHO', 'customer'),
(11, 'resorb', '$2y$10$nz2S3XuOG166NdxVSt7YWuCMQYq/jGttey7w5xDu7dTSv4U/PeymC', 'customer'),
(12, 'admin-resorb', '$2y$10$gQnEDiKg944nwMHqgK4eHOc6iAkV1FwqdFHLAOT72DAySXyr8Gdve', 'admin'),
(13, 'resorb2', '$2y$10$Jwd.AqeXcmbfeFnsha7eFuMrT7bMNPJfkAOsYvf6Hs032V8dWNp0W', 'customer'),
(14, 'resorb10', '$2y$10$Fz8NDS70Djyw0U2Eqa2sZOzAU1OAiecLncf9Xk9r01qQEc2qJL4i2', 'customer');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
