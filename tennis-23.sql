-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Apr 21, 2024 at 02:06 PM
-- Server version: 11.2.2-MariaDB
-- PHP Version: 8.2.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tennis-23`
--

-- --------------------------------------------------------

--
-- Table structure for table `committee_member`
--

DROP TABLE IF EXISTS `committee_member`;
CREATE TABLE IF NOT EXISTS `committee_member` (
  `playerno` int(11) NOT NULL,
  `begin_date` date NOT NULL,
  `end_date` date DEFAULT NULL,
  `position` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`playerno`,`begin_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `committee_member`
--

INSERT INTO `committee_member` (`playerno`, `begin_date`, `end_date`, `position`) VALUES
(2, '1990-01-01', '1992-12-31', 'Chairman'),
(2, '1994-01-01', NULL, 'Member'),
(6, '1990-01-01', '1990-12-31', 'Secretary'),
(6, '1991-01-01', '1992-12-31', 'Member'),
(6, '1992-01-01', '1993-12-31', 'Treasurer'),
(6, '1993-01-01', NULL, 'Chairman'),
(8, '1990-01-01', '1990-12-31', 'Treasurer'),
(8, '1991-01-01', '1991-12-31', 'Secretary'),
(8, '1993-01-01', '1993-12-31', 'Member'),
(8, '1994-01-01', NULL, 'Member'),
(27, '1990-01-01', '1990-12-31', 'Member'),
(27, '1991-01-01', '1991-12-31', 'Treasurer'),
(27, '1993-01-01', '1993-12-31', 'Treasurer'),
(57, '1992-01-01', '1992-12-31', 'Secretary'),
(95, '1994-01-01', NULL, 'Treasurer'),
(112, '1992-01-01', '1992-12-31', 'Member'),
(112, '1994-01-01', NULL, 'Secretary');

-- --------------------------------------------------------

--
-- Table structure for table `matches`
--

DROP TABLE IF EXISTS `matches`;
CREATE TABLE IF NOT EXISTS `matches` (
  `matchno` int(11) NOT NULL,
  `teamno` int(11) NOT NULL,
  `playerno` int(11) NOT NULL,
  `won` int(11) NOT NULL,
  `lost` int(11) NOT NULL,
  PRIMARY KEY (`matchno`),
  KEY `teamno` (`teamno`,`playerno`),
  KEY `playerno` (`playerno`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `matches`
--

INSERT INTO `matches` (`matchno`, `teamno`, `playerno`, `won`, `lost`) VALUES
(1, 1, 6, 3, 1),
(2, 1, 6, 2, 3),
(3, 1, 6, 3, 0),
(4, 1, 44, 3, 2),
(5, 1, 83, 0, 3),
(6, 1, 2, 1, 3),
(7, 1, 57, 3, 0),
(8, 1, 8, 0, 3),
(9, 2, 27, 3, 2),
(10, 2, 104, 3, 2),
(11, 2, 112, 2, 3),
(12, 2, 112, 1, 3),
(13, 2, 8, 0, 3);

-- --------------------------------------------------------

--
-- Table structure for table `penalties`
--

DROP TABLE IF EXISTS `penalties`;
CREATE TABLE IF NOT EXISTS `penalties` (
  `paymentno` int(11) NOT NULL,
  `playerno` int(11) NOT NULL,
  `payment_date` date NOT NULL,
  `amount` double NOT NULL,
  PRIMARY KEY (`paymentno`),
  KEY `playerno` (`playerno`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `penalties`
--

INSERT INTO `penalties` (`paymentno`, `playerno`, `payment_date`, `amount`) VALUES
(1, 6, '1980-12-08', 100),
(2, 44, '1981-05-05', 75),
(3, 27, '1983-09-10', 100),
(4, 104, '1984-12-08', 50),
(5, 44, '1980-12-08', 25),
(6, 8, '1980-12-08', 25),
(7, 44, '1982-12-30', 30),
(8, 27, '1984-11-12', 75);

-- --------------------------------------------------------

--
-- Table structure for table `players`
--

DROP TABLE IF EXISTS `players`;
CREATE TABLE IF NOT EXISTS `players` (
  `playerno` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `init` varchar(3) NOT NULL,
  `birth_date` date NOT NULL,
  `sex` char(1) NOT NULL,
  `joined` year(4) NOT NULL,
  `street` varchar(50) NOT NULL,
  `houseno` varchar(10) NOT NULL,
  `postcode` varchar(10) NOT NULL,
  `town` varchar(50) NOT NULL,
  `phoneno` varchar(20) NOT NULL,
  `leagueno` int(11) NOT NULL,
  PRIMARY KEY (`playerno`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `players`
--

INSERT INTO `players` (`playerno`, `name`, `init`, `birth_date`, `sex`, `joined`, `street`, `houseno`, `postcode`, `town`, `phoneno`, `leagueno`) VALUES
(2, 'Everett', 'R', '1948-09-01', 'M', '1975', 'Stoney Road', '43', '3575NH', 'Stratford', '070-237893', 2411),
(6, 'Parmenter', 'R', '1964-06-25', 'M', '1977', 'Haseltine Lane', '80', '1234KK', 'Stratford', '070-476357', 8467),
(7, 'Wise', 'GWS', '1963-05-11', 'M', '1981', 'Edgecombe Way', '39', '9758VB', 'Stratford', '070-357689', 0),
(8, 'Newcastle', 'B', '1962-07-08', 'F', '1980', 'Station Road', '4', '6584RO', 'Inglewood', '070-458458', 2983),
(27, 'Collins', 'DD', '1964-12-28', 'F', '1983', 'Long Drive', '804', '8457DK', 'Eltham', '079-234857', 2513),
(28, 'Collins', 'C', '1963-06-22', 'F', '1983', 'Old Main Road', '10', '1294QK', 'Midhurst', '071-659599', 0),
(39, 'Bishop', 'D', '1965-10-29', 'M', '1980', 'Eaton Square', '78', '9629CD', 'Stratford', '070-393435', 0),
(44, 'Baker', 'E', '1963-01-09', 'M', '1980', 'Lewis Street', '23', '4444LJ', 'Inglewood', '070-368753', 1124),
(57, 'Brown', 'M', '1971-08-17', 'M', '1985', 'Edgecombe Way', '16', '4377CB', 'Stratford', '070-473458', 6409),
(83, 'Hope', 'PK', '1956-11-11', 'M', '1982', 'Magdalene Road', '16A', '1812UP', 'Stratford', '070-353548', 1608),
(95, 'Miller', 'P', '1963-05-14', 'M', '1972', 'High Street', '33A', '5746OP', 'Douglas', '070-867564', 0),
(100, 'Parmenter', 'P', '1963-02-28', 'M', '1979', 'Haseltine Lane', '80', '1234KK', 'Stratford', '070-494593', 6524),
(104, 'Moorman', 'D', '1970-05-10', 'F', '1984', 'Stout Street', '65', '9437AO', 'Eltham', '079-987571', 7060),
(112, 'Bailey', 'IP', '1963-10-01', 'F', '1984', 'Vixen Road', '8', '6392LK', 'Plymouth', '010-548745', 1319);

-- --------------------------------------------------------

--
-- Table structure for table `teams`
--

DROP TABLE IF EXISTS `teams`;
CREATE TABLE IF NOT EXISTS `teams` (
  `teamno` int(11) NOT NULL,
  `playerno` int(11) NOT NULL,
  `division` varchar(20) NOT NULL,
  PRIMARY KEY (`teamno`,`playerno`),
  KEY `playerno` (`playerno`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `teams`
--

INSERT INTO `teams` (`teamno`, `playerno`, `division`) VALUES
(1, 6, 'first'),
(2, 27, 'second');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `committee_member`
--
ALTER TABLE `committee_member`
  ADD CONSTRAINT `committee_member_ibfk_1` FOREIGN KEY (`playerno`) REFERENCES `players` (`playerno`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `matches`
--
ALTER TABLE `matches`
  ADD CONSTRAINT `matches_ibfk_1` FOREIGN KEY (`teamno`) REFERENCES `teams` (`teamno`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `matches_ibfk_2` FOREIGN KEY (`playerno`) REFERENCES `players` (`playerno`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `penalties`
--
ALTER TABLE `penalties`
  ADD CONSTRAINT `penalties_ibfk_1` FOREIGN KEY (`playerno`) REFERENCES `players` (`playerno`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `teams`
--
ALTER TABLE `teams`
  ADD CONSTRAINT `teams_ibfk_1` FOREIGN KEY (`playerno`) REFERENCES `players` (`playerno`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
