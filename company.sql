-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 05, 2018 at 06:03 PM
-- Server version: 5.7.17
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `company`
--
CREATE Database company;

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--
CREATE TABLE `customer` (
  `id` int(11) NOT NULL,
  `company` varchar(50) NOT NULL,
  `contactFName` char(50) NOT NULL,
  `contactLName` char(50) NOT NULL,
  `position` char(50) NOT NULL,
  `busPh` varchar(10) DEFAULT NULL,
  `mobilePh` varchar(10) DEFAULT NULL,
  `fax` varchar(10) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `street` varchar(50) DEFAULT NULL,
  `zip` varchar(10) DEFAULT NULL,
  `webAddr` varchar(50) DEFAULT NULL,
  `repNum` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`id`, `company`, `contactFName`, `contactLName`, `position`, `busPh`, `mobilePh`, `fax`, `email`, `street`, `zip`, `webAddr`, `repNum`) VALUES
(1, 'Listen Up', 'andre', 'swiger', 'telephone operator', '5403649110', '4344098683', 'NULL', 'christina2000@hotmail.com', '2225 Hurry Street', '27115', 'NULL', 3),
(2, 'Value Giant', 'lottie', 'dunlap', 'biomass plant technician', '3154867273', '3154909385', 'NULL', 'milo1995@hotmail.com', '4700 Buckhannan Avenue', '13822', 'NULL', 5),
(3, 'Edge Garden Services', 'john', 'perna', 'telecommunications line installer and repairer', '2069091437', '2062944036', 'NULL', 'marcellus2006@yahoo.com', '380 Racoon Run', '98133', 'NULL', 2),
(4, 'Matrix Architectural Service', 'martha', 'sheldon', 'cartographer and photogrammetrist', '7344195760', '2486029334', 'NULL', 'elvis1986@gmail.com', '3900 Charles Street', '48075', 'NULL', 3),
(5, 'Briazz', 'rosalie', 'ott', 'graduate teaching assistant', '5613931514', '3052014677', 'NULL', 'macy.greenho@gmail.com', '3941 Wyatt Street', '33432', 'NULL', 3);

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `id` int(11) NOT NULL,
  `firstName` char(50) DEFAULT NULL,
  `lastName` char(50) DEFAULT NULL,
  `title` char(50) DEFAULT NULL,
  `street` varchar(50) DEFAULT NULL,
  `zip` varchar(10) DEFAULT NULL,
  `busPh` varchar(10) DEFAULT NULL,
  `homePh` varchar(10) DEFAULT NULL,
  `mobilePh` varchar(10) DEFAULT NULL,
  `fax` varchar(10) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `startDt` date DEFAULT NULL,
  `salaried` tinyint(1) DEFAULT NULL,
  `yearlyWages` decimal(10,0) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`id`, `firstName`, `lastName`, `title`, `street`, `zip`, `busPh`, `homePh`, `mobilePh`, `fax`, `email`, `startDt`, `salaried`, `yearlyWages`) VALUES
(8, 'Added a new record', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3, 'dwight', 'schrute', 'sales associate', '589 Saint Francis Way', '18974', '2672476787', 'NULL', '8782955975', '8665839471', 'dschrute@dundermifflin.com', '1999-02-22', 1, '60000'),
(4, 'pam', 'beesly', 'receptionist', '531 Elmwood Avenue', '19103', '4842003997', NULL, '2674183348', '8663849471', 'pbeesly@dundermifflin.com', '2001-01-17', 1, '45000'),
(5, 'stanley', 'hudson', 'sales associate', '2005 Terry Lane', '15211', '3214136231', NULL, NULL, '8662699348', 'shudson@dundermifflin.com', '1979-03-22', 1, '90000'),
(7, 'Added a new record', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `zipcode`
--

CREATE TABLE `zipcode` (
  `zipcode` varchar(10) NOT NULL,
  `city` char(50) DEFAULT NULL,
  `state` char(50) DEFAULT NULL,
  `country` char(50) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `zipcode`
--

INSERT INTO `zipcode` (`zipcode`, `city`, `state`, `country`) VALUES
('27115', 'Winston Salem', 'SC', 'US'),
('60185', 'west chicago', 'IL', 'US'),
('33432', 'Boca Raton', 'FL', 'US'),
('48075', 'Southfield', 'MI', 'US'),
('98133', 'Seattle', 'WA', 'US'),
('15001', 'Aliquippa', 'PA', 'US'),
('15211', 'Pittsburgh', 'PA', 'US'),
('15212', 'Pittsburgh', 'PA', 'US'),
('18974', 'Warminster', 'PA', 'US'),
('19103', 'Philadelphia', 'PA', 'US');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id`),
  ADD KEY `zip` (`zip`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`id`),
  ADD KEY `zip` (`zip`);

--
-- Indexes for table `zipcode`
--
ALTER TABLE `zipcode`
  ADD PRIMARY KEY (`zipcode`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `employee`
--
ALTER TABLE `employee`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
