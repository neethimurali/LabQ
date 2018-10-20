-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 25, 2018 at 04:23 PM
-- Server version: 10.1.21-MariaDB
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `labq`
--

-- --------------------------------------------------------

--
-- Table structure for table `qn_data`
--

CREATE TABLE `qn_data` (
  `id` int(11) NOT NULL,
  `stf_id` varchar(50) NOT NULL,
  `subj_id` varchar(25) NOT NULL,
  `qn` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `qn_data`
--

INSERT INTO `qn_data` (`id`, `stf_id`, `subj_id`, `qn`) VALUES
(1, 'v101', 'S302', 'Write a program to find sum of two Numbers?'),
(2, 'v101', 'S302', 'Write a program to find palindrome numbers between two limits?');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `qn_data`
--
ALTER TABLE `qn_data`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `qn_data`
--
ALTER TABLE `qn_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
