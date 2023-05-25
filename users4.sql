-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 25, 2023 at 04:10 PM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `lecture`
--

-- --------------------------------------------------------

--
-- Table structure for table `users4`
--

CREATE TABLE `users4` (
  `id` int(11) NOT NULL,
  `title` varchar(100) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `bedrooms` int(11) DEFAULT NULL,
  `bathrooms` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users4`
--

INSERT INTO `users4` (`id`, `title`, `address`, `city`, `price`, `bedrooms`, `bathrooms`) VALUES
(1, 'Modern Apartment', '123 Main Street', 'City A', 1200, 2, 1),
(2, 'Cozy Cottage', '456 Elm Street', 'City B', 800, 1, 1),
(3, 'Spacious Condo', '789 Oak Street', 'City C', 1500, 3, 2),
(4, 'Luxury Penthouse', '321 Maple Avenue', 'City A', 2500, 4, 3),
(5, 'Charming Bungalow', '654 Pine Lane', 'City B', 900, 2, 1),
(6, 'Renovated Townhouse', '987 Cedar Road', 'City C', 1100, 2, 2),
(7, 'Modern Loft', '246 Walnut Avenue', 'City A', 1800, 1, 1),
(8, 'Victorian Mansion', '135 Magnolia Drive', 'City B', 3500, 5, 4),
(9, 'Coastal Beach House', '864 Seashell Lane', 'City C', 2000, 3, 2),
(10, 'Rustic Cabin', '579 Forest Road', 'City A', 700, 1, 1),
(11, 'Rustic Cabin', '987 Cedar Road', 'City C', 700, 1, 1),
(12, 'Modern Townhouse', '246 Elm Avenue', 'City A', 1800, 3, 2),
(13, 'Coastal Villa', '753 Ocean Drive', 'City B', 3500, 5, 4),
(14, 'Quaint Farmhouse', '159 Harvest Lane', 'City C', 1100, 3, 2),
(15, 'Elegant Mansion', '864 Grand Boulevard', 'City A', 5000, 6, 5),
(16, 'Urban Loft', '357 Loft Street', 'City B', 1600, 2, 1),
(17, 'Lakefront Retreat', '951 Shoreline Drive', 'City C', 2200, 4, 3),
(18, 'Historic Brownstone', '582 Brick Lane', 'City A', 1900, 3, 2),
(19, 'Mountain Chalet', '279 Summit Avenue', 'City B', 1300, 2, 2),
(20, 'Contemporary Duplex', '798 Reflection Road', 'City C', 1700, 3, 2),
(21, 'Beachfront Condo', '413 Sandcastle Court', 'City A', 2800, 2, 2),
(22, 'Country Estate', '627 Meadow Lane', 'City B', 4500, 4, 4),
(23, 'Urban Studio', '834 Studio Street', 'City C', 950, 1, 1),
(24, 'Riverfront Cottage', '162 Riverside Road', 'City A', 1100, 2, 1),
(25, 'Garden Villa', '375 Blooming Avenue', 'City B', 2000, 3, 2),
(26, 'Ranch Retreat', '729 Serenity Lane', 'City C', 1800, 3, 2),
(27, 'Historic Townhouse', '251 Heritage Road', 'City A', 1400, 2, 1),
(28, 'Lakeview Apartment', '642 Lakeview Drive', 'City B', 1200, 2, 2),
(29, 'Modern Farmhouse', '936 Harvest Lane', 'City C', 2100, 4, 3),
(30, 'Downtown Penthouse', '519 High Street', 'City A', 3500, 3, 2),
(31, 'Charming Cottage', '783 Blossom Lane', 'City B', 1300, 2, 1),
(32, 'Seaside Bungalow', '624 Coastal Road', 'City C', 1800, 3, 2),
(33, 'Victorian Manor', '921 Heritage Court', 'City A', 2800, 4, 3),
(34, 'Cosy Condo', '456 Oak Street', 'City B', 950, 1, 1),
(35, 'Lakeside Cabin', '753 Lakeshore Drive', 'City C', 1200, 2, 1),
(36, 'Spacious Townhouse', '285 Maple Avenue', 'City A', 2000, 3, 2),
(37, 'Mountain Retreat', '639 Alpine Way', 'City B', 2200, 4, 3),
(38, 'Luxury Penthouse', '167 Skyline Boulevard', 'City C', 4000, 3, 2),
(39, 'Riverside Lodge', '728 River Road', 'City A', 1500, 3, 2),
(40, 'Cozy Cottage', '532 Meadow Lane', 'City B', 1100, 2, 1),
(41, 'Sunny Villa', '976 Sunshine Street', 'City C', 1800, 3, 2),
(42, 'Urban Condo', '362 Downtown Avenue', 'City A', 1300, 1, 1),
(43, 'Countryside Farmhouse', '571 Country Road', 'City B', 2500, 4, 3),
(44, 'Lakefront Chalet', '843 Lakeview Drive', 'City C', 2400, 3, 2),
(45, 'Modern Apartment', '185 High Rise Road', 'City A', 1700, 2, 2),
(46, 'Beach House', '426 Shoreline Court', 'City B', 2800, 3, 2),
(47, 'Quaint Cabin', '782 Forest Lane', 'City C', 900, 1, 1),
(48, 'City Loft', '562 Urban Street', 'City A', 1600, 2, 1),
(49, 'Charming Duplex', '923 Delightful Lane', 'City B', 2000, 3, 2),
(50, 'Scenic Retreat', '337 Serenity Lane', 'City C', 2100, 3, 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `users4`
--
ALTER TABLE `users4`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `users4`
--
ALTER TABLE `users4`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
