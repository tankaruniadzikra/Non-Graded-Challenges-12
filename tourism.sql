-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 05, 2023 at 01:37 PM
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
-- Database: `tourism`
--

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

CREATE TABLE `bookings` (
  `ID_Bookings` int(11) NOT NULL,
  `Guest_Name` varchar(50) DEFAULT NULL,
  `ID_Hotel` int(11) DEFAULT NULL,
  `Check_In` date DEFAULT NULL,
  `Check_Out` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bookings`
--

INSERT INTO `bookings` (`ID_Bookings`, `Guest_Name`, `ID_Hotel`, `Check_In`, `Check_Out`) VALUES
(1, 'Marcus Rashford', 1, '2023-09-01', '2023-09-03'),
(2, 'Andre Onana', 2, '2023-08-25', '2023-09-01'),
(3, 'Bruno Fernandes', 3, '2023-08-29', '2023-09-04');

-- --------------------------------------------------------

--
-- Table structure for table `destinations`
--

CREATE TABLE `destinations` (
  `ID_Destination` int(11) NOT NULL,
  `Name` varchar(20) DEFAULT NULL,
  `Country` varchar(20) DEFAULT NULL,
  `Description` varchar(100) DEFAULT NULL,
  `Rating` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `destinations`
--

INSERT INTO `destinations` (`ID_Destination`, `Name`, `Country`, `Description`, `Rating`) VALUES
(1, 'Lombok', 'Indonesia', 'Pulau yang memiliki ragam wisata terkhusus dengan kekayaan alamnya yang mengagumkan, mulai dari wisa', 5),
(2, 'Palawan', 'Filipina', 'Pulau yang memiliki hutan bakau, sungai, danau, serta air terjun yang indah', 3),
(3, 'Santorini', 'Yunani', 'Pulau Santorini di Yunani dikenal sebagai salah satu pulau paling instagramable. Di sini bukan hanya', 5);

-- --------------------------------------------------------

--
-- Table structure for table `hotels`
--

CREATE TABLE `hotels` (
  `ID_Hotel` int(11) NOT NULL,
  `Name` varchar(20) DEFAULT NULL,
  `ID_Destination` int(11) DEFAULT NULL,
  `Rating` int(11) DEFAULT NULL,
  `Address` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `hotels`
--

INSERT INTO `hotels` (`ID_Hotel`, `Name`, `ID_Destination`, `Rating`, `Address`) VALUES
(1, 'Golden Palace Hotel ', 1, 5, 'Jl. Sriwijaya No.38'),
(2, 'Lime Resort El Nido', 2, 5, 'Sitio Lugadia, Brgy. Corong Corong'),
(3, 'Nautilus Dome', 3, 4, 'Fira, Fira, 84700');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`ID_Bookings`),
  ADD KEY `ID_Hotel` (`ID_Hotel`);

--
-- Indexes for table `destinations`
--
ALTER TABLE `destinations`
  ADD PRIMARY KEY (`ID_Destination`);

--
-- Indexes for table `hotels`
--
ALTER TABLE `hotels`
  ADD PRIMARY KEY (`ID_Hotel`),
  ADD KEY `ID_Destination` (`ID_Destination`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bookings`
--
ALTER TABLE `bookings`
  MODIFY `ID_Bookings` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `destinations`
--
ALTER TABLE `destinations`
  MODIFY `ID_Destination` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `hotels`
--
ALTER TABLE `hotels`
  MODIFY `ID_Hotel` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bookings`
--
ALTER TABLE `bookings`
  ADD CONSTRAINT `bookings_ibfk_1` FOREIGN KEY (`ID_Hotel`) REFERENCES `hotels` (`ID_Hotel`);

--
-- Constraints for table `hotels`
--
ALTER TABLE `hotels`
  ADD CONSTRAINT `hotels_ibfk_1` FOREIGN KEY (`ID_Destination`) REFERENCES `destinations` (`ID_Destination`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
