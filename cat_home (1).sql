-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Feb 15, 2023 at 02:20 PM
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
-- Database: `cat_home`
--

-- --------------------------------------------------------

--
-- Table structure for table `cages`
--

DROP TABLE IF EXISTS `cages`;
CREATE TABLE IF NOT EXISTS `cages` (
  `cage_id` int(11) NOT NULL AUTO_INCREMENT,
  `cage_size` int(11) NOT NULL,
  `color` varchar(255) NOT NULL,
  PRIMARY KEY (`cage_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cages`
--

INSERT INTO `cages` (`cage_id`, `cage_size`, `color`) VALUES
(1, 15, 'green'),
(2, 20, 'red'),
(3, 25, 'blue');

-- --------------------------------------------------------

--
-- Table structure for table `caretakers`
--

DROP TABLE IF EXISTS `caretakers`;
CREATE TABLE IF NOT EXISTS `caretakers` (
  `caretaker_id` int(11) NOT NULL AUTO_INCREMENT,
  `caretaker_name` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`caretaker_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `caretakers`
--

INSERT INTO `caretakers` (`caretaker_id`, `caretaker_name`, `email`) VALUES
(1, 'Anna', 'anna@cathome.com'),
(2, 'Pelle', 'pelle@cathome.com');

-- --------------------------------------------------------

--
-- Table structure for table `cats`
--

DROP TABLE IF EXISTS `cats`;
CREATE TABLE IF NOT EXISTS `cats` (
  `cat_id` int(11) NOT NULL AUTO_INCREMENT,
  `cat_owner_id` int(11) NOT NULL,
  `cage_id` int(11) DEFAULT NULL,
  `caretaker_id` int(11) DEFAULT NULL,
  `cat_name` varchar(255) NOT NULL,
  `birth_year` varchar(255) DEFAULT NULL,
  `alive` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`cat_id`),
  KEY `cat_owner_id` (`cat_owner_id`),
  KEY `cage_id` (`cage_id`),
  KEY `caretaker_id` (`caretaker_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cats`
--

INSERT INTO `cats` (`cat_id`, `cat_owner_id`, `cage_id`, `caretaker_id`, `cat_name`, `birth_year`, `alive`) VALUES
(1, 1, NULL, NULL, 'Lambada', NULL, NULL),
(2, 1, 3, 1, 'Medusa', NULL, 1),
(3, 2, 2, 2, 'Albis', '2015', 1);

-- --------------------------------------------------------

--
-- Table structure for table `cat_owners`
--

DROP TABLE IF EXISTS `cat_owners`;
CREATE TABLE IF NOT EXISTS `cat_owners` (
  `cat_owner_id` int(11) NOT NULL AUTO_INCREMENT,
  `cat_owner_name` varchar(255) NOT NULL,
  `birth_year` int(11) DEFAULT NULL,
  `phone_number` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`cat_owner_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cat_owners`
--

INSERT INTO `cat_owners` (`cat_owner_id`, `cat_owner_name`, `birth_year`, `phone_number`) VALUES
(1, 'Linus', 1994, '076123456'),
(2, 'Maria', 1990, '076123458');

-- --------------------------------------------------------

--
-- Table structure for table `owner_residences`
--

DROP TABLE IF EXISTS `owner_residences`;
CREATE TABLE IF NOT EXISTS `owner_residences` (
  `owner_residence_id` int(11) NOT NULL AUTO_INCREMENT,
  `residence_id` int(11) NOT NULL,
  `cat_owner_id` int(11) NOT NULL,
  `move_in_date` datetime NOT NULL,
  PRIMARY KEY (`owner_residence_id`),
  KEY `residence_id` (`residence_id`),
  KEY `cat_owner_id` (`cat_owner_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `owner_residences`
--

INSERT INTO `owner_residences` (`owner_residence_id`, `residence_id`, `cat_owner_id`, `move_in_date`) VALUES
(1, 1, 1, '2000-12-31 00:00:00'),
(2, 1, 2, '2010-04-24 00:00:00'),
(3, 3, 2, '2008-05-19 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `residences`
--

DROP TABLE IF EXISTS `residences`;
CREATE TABLE IF NOT EXISTS `residences` (
  `residence_id` int(11) NOT NULL AUTO_INCREMENT,
  `address` varchar(255) NOT NULL,
  `area` int(11) DEFAULT NULL,
  PRIMARY KEY (`residence_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `residences`
--

INSERT INTO `residences` (`residence_id`, `address`, `area`) VALUES
(1, 'Landalabergen', 90),
(2, 'Guldheden', 50),
(3, 'Dr Fries Torg', 25);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
