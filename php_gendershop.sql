-- phpMyAdmin SQL Dump
-- version 4.0.4
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Oct 29, 2022 at 10:46 AM
-- Server version: 5.6.12-log
-- PHP Version: 5.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `php_gendershop`
--
CREATE DATABASE IF NOT EXISTS `php_gendershop` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `php_gendershop`;

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE IF NOT EXISTS `admin` (
  `userid` varchar(200) NOT NULL,
  `pwd` varchar(100) NOT NULL,
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`userid`, `pwd`) VALUES
('admin', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE IF NOT EXISTS `cart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` varchar(200) NOT NULL,
  `pid` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

-- --------------------------------------------------------

--
-- Table structure for table `newuser`
--

CREATE TABLE IF NOT EXISTS `newuser` (
  `uname` varchar(100) NOT NULL,
  `addr` varchar(100) NOT NULL,
  `city` varchar(100) NOT NULL,
  `country` varchar(100) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `dob` date NOT NULL,
  `mobile` varchar(15) NOT NULL,
  `userid` varchar(100) NOT NULL,
  `pwd` varchar(50) NOT NULL,
  `uphoto` varchar(500) NOT NULL,
  `ftype` varchar(200) NOT NULL,
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `newuser`
--

INSERT INTO `newuser` (`uname`, `addr`, `city`, `country`, `gender`, `dob`, `mobile`, `userid`, `pwd`, `uphoto`, `ftype`) VALUES
('Anita', '34,KK Nagar,', 'Chennai', 'India', 'Female', '1988-05-06', '7801555454', 'anita@gmail.com', 'a', 'ups/userpic.gif', 'image/jpeg'),
('Hari', '454,South Car Street,', 'Madurai', 'India', 'Male', '1985-08-01', '8023492394', 'hari@gmail.com', 'hari', 'ups/userpic.gif', 'image/jpeg'),
('James', '33,Greams Road,', 'New Town', 'Australia', 'Male', '1992-10-26', '7850255458', 'james@gmail.com', 'j', 'ups/userpic.gif', 'image/jpeg'),
('Ram', '423,South Car Street', 'Madurai', 'India', 'Male', '1970-09-26', '9823438273', 'ram@gmail.com', 'r', 'ups/userpic.gif', 'image/jpeg'),
('Sita', '987,Main street', 'Madurai', 'India', 'Female', '1975-01-19', '8902152555', 'sita@gmail.com', 'sita', 'ups/userpic.gif', 'image/jpeg'),
('Umesh', '34, Greams Road', 'Chennai', 'India', 'Male', '1988-08-09', '8798054124', 'umesh@gmail.com', 'umesh', 'ups/userpic.gif', 'image/jpeg'),
('Vasanthi', '343,North Car Street', 'Trichy', 'India', 'Female', '1990-10-26', '9878687098', 'vasanthi@gmail.com', 'v', 'ups/userpic.gif', 'image/jpeg');

-- --------------------------------------------------------

--
-- Table structure for table `pcategory`
--

CREATE TABLE IF NOT EXISTS `pcategory` (
  `cname` varchar(100) NOT NULL,
  PRIMARY KEY (`cname`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pcategory`
--

INSERT INTO `pcategory` (`cname`) VALUES
('Mobile'),
('Shampoo');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE IF NOT EXISTS `product` (
  `pid` int(11) NOT NULL AUTO_INCREMENT,
  `cname` varchar(100) NOT NULL,
  `pname` varchar(100) NOT NULL,
  `brand` varchar(100) NOT NULL,
  `price` float NOT NULL,
  `pimage` varchar(300) NOT NULL,
  `ftype` varchar(300) NOT NULL,
  PRIMARY KEY (`pid`),
  UNIQUE KEY `pid` (`pid`),
  UNIQUE KEY `pname` (`pname`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=12 ;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`pid`, `cname`, `pname`, `brand`, `price`, `pimage`, `ftype`) VALUES
(10, 'Mobile', 'BB M2', 'BlackBerry', 9500, 'pimages/1666864244bb1.jpg', 'image/jpeg'),
(11, 'Mobile', 'N8', 'Nokia', 12700, 'pimages/1666864271bb2.jpg', 'image/jpeg');

-- --------------------------------------------------------

--
-- Table structure for table `pur`
--

CREATE TABLE IF NOT EXISTS `pur` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` varchar(200) NOT NULL,
  `dt` date NOT NULL,
  `pid` int(11) NOT NULL,
  `delivery` varchar(10) NOT NULL DEFAULT 'no',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `pur`
--

INSERT INTO `pur` (`id`, `userid`, `dt`, `pid`, `delivery`) VALUES
(5, 'ram@gmail.com', '2022-10-27', 10, 'yes'),
(6, 'sita@gmail.com', '2022-10-27', 10, 'yes'),
(7, 'hari@gmail.com', '2022-10-27', 10, 'yes'),
(8, 'umesh@gmail.com', '2022-10-27', 10, 'no'),
(9, 'vasanthi@gmail.com', '2022-10-29', 10, 'no'),
(10, 'james@gmail.com', '2022-10-29', 10, 'no');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
