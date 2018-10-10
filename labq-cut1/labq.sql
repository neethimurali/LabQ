-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 25, 2018 at 04:27 PM
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
-- Table structure for table `answr_data`
--

CREATE TABLE `answr_data` (
  `id` int(11) NOT NULL,
  `qn_id` varchar(25) NOT NULL,
  `regnum` varchar(50) NOT NULL,
  `ans` varchar(50) NOT NULL,
  `dt` date NOT NULL,
  `st` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `answr_data`
--

INSERT INTO `answr_data` (`id`, `qn_id`, `regnum`, `ans`, `dt`, `st`) VALUES
(1, '1', 'MCA101', 'c.txt', '2018-09-22', 2),
(4, '1', 'MCA101', 'll.txt', '2018-09-22', 1),
(5, '2', 'MCA101', 'll.txt', '2018-09-22', 2),
(6, '2', 'MCA101', 'll.txt', '2018-09-22', 0);

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

-- --------------------------------------------------------

--
-- Table structure for table `staff_data`
--

CREATE TABLE `staff_data` (
  `id` int(11) NOT NULL,
  `stf_nme` varchar(50) NOT NULL,
  `con` varchar(12) NOT NULL,
  `addr` text NOT NULL,
  `pic` varchar(50) NOT NULL,
  `uid` varchar(50) NOT NULL,
  `st` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `staff_data`
--

INSERT INTO `staff_data` (`id`, `stf_nme`, `con`, `addr`, `pic`, `uid`, `st`) VALUES
(1, 'Vineeth', '9446563005', 'Trinity\r\nTrivandrum', '0001.jpg', 'v101', 1),
(2, 'Jobin', '8590539909', 'Trinity\r\nTrivandrum', 'onam.jpg', 'j101', 1);

-- --------------------------------------------------------

--
-- Table structure for table `student_data`
--

CREATE TABLE `student_data` (
  `id` int(11) NOT NULL,
  `sem` varchar(15) NOT NULL,
  `nme` varchar(75) NOT NULL,
  `rollnum` varchar(15) NOT NULL,
  `con` varchar(15) NOT NULL,
  `addr` text NOT NULL,
  `pic` varchar(50) NOT NULL,
  `st` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `student_data`
--

INSERT INTO `student_data` (`id`, `sem`, `nme`, `rollnum`, `con`, `addr`, `pic`, `st`) VALUES
(1, '3', 'Priya', 'MCA101', '9895478523', 'Trinity\r\nTrivandrum', 'new1.gif', 1),
(2, '1', 'jithu', '18', '465654', 'tvm', 'if_88_111104.png', 1);

-- --------------------------------------------------------

--
-- Table structure for table `subject_data`
--

CREATE TABLE `subject_data` (
  `id` int(11) NOT NULL,
  `dep` varchar(50) NOT NULL,
  `sem` int(3) NOT NULL,
  `subj_id` varchar(20) NOT NULL,
  `subj_nme` varchar(80) NOT NULL,
  `st` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `subject_data`
--

INSERT INTO `subject_data` (`id`, `dep`, `sem`, `subj_id`, `subj_nme`, `st`) VALUES
(1, 'MCA', 1, 'S101', 'Programming with C', 0),
(2, 'MCA', 1, 'S102', 'CPP Programming', 0),
(3, 'MCA', 2, 'S201', 'Java :Programming', 0),
(4, 'MCA', 2, 'S202', 'Programming with Python', 0),
(5, 'MCA', 3, 'S301', 'HTML Lab', 0),
(6, 'MCA', 3, 'S302', 'PHP Lab', 0),
(9, 'MCA', 4, 'S401', 'Advanced PHP', 0);

-- --------------------------------------------------------

--
-- Table structure for table `subj_assign`
--

CREATE TABLE `subj_assign` (
  `id` int(11) NOT NULL,
  `subj_nm` varchar(50) NOT NULL,
  `subj_nme` varchar(100) NOT NULL,
  `stf_id` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `subj_assign`
--

INSERT INTO `subj_assign` (`id`, `subj_nm`, `subj_nme`, `stf_id`) VALUES
(1, 'PHP Lab', 'S302', 'v101'),
(2, 'Advanced PHP', 'S401', 'v101'),
(3, 'Programming with C', 'S101', 'j101'),
(4, 'CPP Programming', 'S102', 'j101');

-- --------------------------------------------------------

--
-- Table structure for table `user_log`
--

CREATE TABLE `user_log` (
  `id` int(11) NOT NULL,
  `uid` varchar(100) NOT NULL,
  `pass` varchar(100) NOT NULL,
  `typ` varchar(50) NOT NULL,
  `st` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_log`
--

INSERT INTO `user_log` (`id`, `uid`, `pass`, `typ`, `st`) VALUES
(1, 'admin', 'admin', 'admin', 1),
(2, 'v101', 'asd', 'staff', 1),
(3, 'j101', 'asd', 'staff', 1),
(4, 'MCA101', 'asd', 'stud', 1),
(5, '18', '123', 'stud', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `answr_data`
--
ALTER TABLE `answr_data`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `qn_data`
--
ALTER TABLE `qn_data`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `staff_data`
--
ALTER TABLE `staff_data`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `student_data`
--
ALTER TABLE `student_data`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subject_data`
--
ALTER TABLE `subject_data`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subj_assign`
--
ALTER TABLE `subj_assign`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_log`
--
ALTER TABLE `user_log`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `answr_data`
--
ALTER TABLE `answr_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `qn_data`
--
ALTER TABLE `qn_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `staff_data`
--
ALTER TABLE `staff_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `student_data`
--
ALTER TABLE `student_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `subject_data`
--
ALTER TABLE `subject_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `subj_assign`
--
ALTER TABLE `subj_assign`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `user_log`
--
ALTER TABLE `user_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
