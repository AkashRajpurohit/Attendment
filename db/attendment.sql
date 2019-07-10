-- phpMyAdmin SQL Dump
-- version 4.8.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 18, 2018 at 08:54 PM
-- Server version: 10.1.31-MariaDB
-- PHP Version: 7.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `attendment`
--

-- --------------------------------------------------------

--
-- Table structure for table `branch_year`
--

CREATE TABLE `branch_year` (
  `id` int(2) NOT NULL,
  `year` text NOT NULL,
  `branch` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `branch_year`
--

INSERT INTO `branch_year` (`id`, `year`, `branch`) VALUES
(1, 'SE', 'INFT'),
(2, 'SE', 'COMPS'),
(3, 'SE', 'INST'),
(4, 'SE', 'EXTC'),
(5, 'SE', 'MECH'),
(6, 'SE', 'CIVIL'),
(7, 'TE', 'INFT'),
(8, 'TE', 'COMPS'),
(9, 'TE', 'INST'),
(10, 'TE', 'EXTC'),
(11, 'TE', 'MECH'),
(12, 'TE', 'CIVIL'),
(13, 'BE', 'INFT'),
(14, 'BE', 'COMPS'),
(15, 'BE', 'INST'),
(16, 'BE', 'EXTC'),
(17, 'BE', 'MECH'),
(18, 'BE', 'CIVIL');

-- --------------------------------------------------------

--
-- Table structure for table `faculty_record`
--

CREATE TABLE `faculty_record` (
  `id` int(3) NOT NULL,
  `applicationId` int(12) NOT NULL,
  `name` text NOT NULL,
  `email` text NOT NULL,
  `password` text NOT NULL,
  `mobileNo` text NOT NULL,
  `gender` text NOT NULL,
  `dept` text NOT NULL,
  `dob` text NOT NULL,
  `address` text NOT NULL,
  `city` text NOT NULL,
  `state` text NOT NULL,
  `joiningDate` text NOT NULL,
  `activeStatus` text NOT NULL,
  `userType` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `faculty_record`
--

INSERT INTO `faculty_record` (`id`, `applicationId`, `name`, `email`, `password`, `mobileNo`, `gender`, `dept`, `dob`, `address`, `city`, `state`, `joiningDate`, `activeStatus`, `userType`) VALUES
(1, 1, 'PROF. CHANDAN KOLWANKAR', 'chandan.kolwankar@vcet.edu.in', '12344321', '2502338234', 'MALE', 'INFT', 'null', 'Vasai', 'Thane', 'Maharashtra', 'null', '1', 'Faculty'),
(2, 2, 'MRS. ARCHANA EKBOTE', 'archana.ekbote@vcet.edu.in', '12344321', '2502338234', 'FEMALE', 'INFT', 'null', 'Vasai', 'Thane', 'Maharashtra', 'null', '1', 'Faculty'),
(3, 3, 'MRS. MADHAVI WAGHMARE', 'madhavi.waghmare@vcet.edu.in', '12344321', '2502338234', 'FEMALE', 'INFT', 'null', 'Vasai', 'Thane', 'Maharashtra', 'null', '1', 'Faculty'),
(4, 4, 'MRS. VAISHALI SHIRSATH', 'vaishali.shirsath@vcet.edu.in', '12344321', '2502338234', 'FEMALE', 'INFT', 'null', 'Vasai', 'Thane', 'Maharashtra', 'null', '1', 'Faculty'),
(5, 5, 'MR. SAINATH  PATIL', 'sainath.patil@vcet.edu.in', '12344321', '2502338234', 'MALE', 'INFT', 'null', 'Vasai', 'Thane', 'Maharashtra', 'null', '1', 'Faculty'),
(6, 6, 'MRS. ANAGHA PATIL', 'anagha.patil@vcet.edu.in', '12344321', '2502338234', 'MALE', 'INFT', 'null', 'Dahisar', 'Thane', 'Maharashtra', 'null', '1', 'Faculty'),
(7, 7, 'MRS. BHARATI GONDHALEKAR', 'bharati.gondhalekar@vcet.edu.in', '12344321', '2502338234', 'FEMALE', 'INFT', 'null', 'Vasai', 'Thane', 'Maharashtra', 'null', '1', 'Faculty'),
(8, 8, 'MR. YOGESH PINGLE', 'yogesh.pingle@vcet.edu.in', '12344321', '2502338234', 'MALE', 'INFT', 'null', 'Vasai', 'Thane', 'Maharashtra', 'null', '1', 'Faculty'),
(9, 9, 'MRS. MARIYAM J. K', 'mariyam.jawadwala@vcet.edu.in', '12344321', '2502338234', 'FEMALE', 'INFT', 'null', 'Vasai', 'Thane', 'Maharashtra', 'null', '1', 'Faculty'),
(10, 10, 'MS. SWATI SAIGAONKAR', 'swati.saigaonkar@vcet.edu.in', '12344321', '2502338234', 'FEMALE', 'INFT', 'null', 'Vasai', 'Thane', 'Maharashtra', 'null', '1', 'Faculty');

-- --------------------------------------------------------

--
-- Table structure for table `facul_attend`
--

CREATE TABLE `facul_attend` (
  `id` int(10) NOT NULL,
  `fapplicationId` int(12) NOT NULL,
  `subject` text NOT NULL,
  `roomNo` int(3) NOT NULL,
  `startTime` text NOT NULL,
  `endTime` text NOT NULL,
  `date` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `facul_attend`
--

INSERT INTO `facul_attend` (`id`, `fapplicationId`, `subject`, `roomNo`, `startTime`, `endTime`, `date`) VALUES
(1, 8, 'ECEB', 510, 'Tue Sep 25 09:00:00 IST 2018', 'Tue Sep 25 10:00:00 IST 2018', '25-09-2018'),
(2, 1, 'IP', 223, 'Tue Sep 25 10:00:00 IST 2018', 'Tue Sep 25 11:00:00 IST 2018', '25-09-2018'),
(3, 8, 'MES', 511, 'Tue Sep 25 11:00:00 IST 2018', 'Tue Sep 25 12:00:00 IST 2018', '25-09-2018'),
(4, 1, 'IP Lab', 225, 'Tue Sep 25 12:00:00 IST 2018', 'Tue Sep 25 01:00:00 IST 2018', '25-09-2018'),
(5, 8, 'IOT Lab', 207, 'Tue Sep 25 02:00:00 IST 2018', 'Tue Sep 25 03:00:00 IST 2018', '25-09-2018'),
(6, 6, 'Security Lab', 210, 'Tue Sep 25 03:00:00 IST 2018', 'Tue Sep 25 04:00:00 IST 2018', '25-09-2018'),
(7, 6, 'CNS', 510, 'Tue Sep 25 04:00:00 IST 2018', 'Tue Sep 25 05:00:00 IST 2018', '25-09-2018'),
(8, 8, 'MES', 510, 'Wed Sep 26 09:00:00 IST 2018', 'Wed Sep 26 10:00:00 IST 2018', '26-09-2018'),
(9, 8, 'ECEB', 511, 'Wed Sep 26 10:00:00 IST 2018', 'Wed Sep 26 11:00:00 IST 2018', '26-09-2018'),
(10, 6, 'Security Lab', 210, 'Wed Sep 26 11:00:00 IST 2018', 'Wed Sep 26 12:00:00 IST 2018', '26-09-2018'),
(11, 1, 'IP', 223, 'Wed Sep 26 12:00:00 IST 2018', 'Wed Sep 26 01:00:00 IST 2018', '26-09-2018'),
(12, 6, 'CNS', 510, 'Wed Sep 26 02:00:00 IST 2018', 'Wed Sep 26 03:00:00 IST 2018', '26-09-2018'),
(13, 1, 'IP Lab', 225, 'Wed Sep 26 03:00:00 IST 2018', 'Wed Sep 26 04:00:00 IST 2018', '26-09-2018'),
(14, 8, 'IOT Lab', 207, 'Wed Sep 26 04:00:00 IST 2018', 'Wed Sep 26 05:00:00 IST 2018', '26-09-2018'),
(15, 8, 'IOT Lab', 207, 'Thur Sep 27 09:00:00 IST 2018', 'Thur Sep 27 10:00:00 IST 2018', '27-09-2018'),
(16, 6, 'CNS', 511, 'Thur Sep 27 10:00:00 IST 2018', 'Thur Sep 27 11:00:00 IST 2018', '27-09-2018'),
(17, 6, 'Security Lab', 210, 'Thur Sep 27 11:00:00 IST 2018', 'Thur Sep 27 12:00:00 IST 2018', '27-09-2018'),
(18, 1, 'IP', 223, 'Thur Sep 27 12:00:00 IST 2018', 'Thur Sep 27 01:00:00 IST 2018', '27-09-2018'),
(19, 8, 'MES', 511, 'Thur Sep 27 02:00:00 IST 2018', 'Thur Sep 27 03:00:00 IST 2018', '27-09-2018'),
(20, 8, 'ECEB', 510, 'Thur Sep 27 03:00:00 IST 2018', 'Thur Sep 27 04:00:00 IST 2018', '27-09-2018'),
(21, 1, 'IP Lab', 225, 'Thur Sep 27 04:00:00 IST 2018', 'Thur Sep 27 05:00:00 IST 2018', '27-09-2018'),
(23, 1, 'IP', 223, 'Fri Sep 28 09:00:40 IST 2018', 'Fri Sep 28 10:00:40 IST 2018', '28-9-2018'),
(24, 6, 'CNS', 511, 'Fri Sep 28 12:00:00 IST 2018', 'Fri Sep 28 13:00:00 IST 2018', '28-9-2018'),
(25, 8, 'ECEB', 510, 'Fri Sep 28 13:00:54 IST 2018', 'Fri Sep 28 14:00:54 IST 2018', '28-9-2018'),
(26, 8, 'MES', 207, 'Fri Sep 28 14:00:00 IST 2018', 'Fri Sep 28 15:00:00 IST 2018', '28-9-2018'),
(27, 8, 'MES', 200, 'Fri Sep 28 14:00:00 IST 2018', 'Fri Sep 28 13:00:00 IST 2018', '28-9-2018'),
(28, 8, 'IOT Lab', 510, 'Fri Sep 28 14:00:00 IST 2018', 'Fri Sep 28 15:00:00 IST 2018', '28-9-2018'),
(29, 8, 'MES', 511, 'Fri Sep 28 14:00:00 IST 2018', 'Fri Sep 28 15:00:00 IST 2018', '28-9-2018'),
(30, 8, 'ECEB', 210, 'Fri Sep 28 14:00:00 IST 2018', 'Fri Sep 28 15:00:00 IST 2018', '28-9-2018'),
(31, 8, 'MES', 224, 'Fri Sep 28 14:00:00 IST 2018', 'Fri Sep 28 15:00:00 IST 2018', '28-9-2018'),
(32, 8, 'IOT Lab', 225, 'Fri Sep 28 14:00:00 IST 2018', 'Fri Sep 28 15:00:00 IST 2018', '28-9-2018'),
(33, 8, 'IOT Lab', 216, 'Fri Sep 28 14:00:00 IST 2018', 'Fri Sep 28 15:00:00 IST 2018', '28-9-2018'),
(34, 8, 'IOT Lab', 225, 'Fri Sep 28 14:00:00 IST 2018', 'Fri Sep 28 15:00:00 IST 2018', '28-9-2018'),
(35, 8, 'ECEB', 511, 'Fri Sep 28 16:00:00 IST 2018', 'Fri Sep 28 17:00:00 IST 2018', '28-9-2018'),
(36, 8, 'IOT Lab', 205, 'Fri Sep 28 15:00:00 IST 2018', 'Fri Sep 28 16:00:00 IST 2018', '28-9-2018'),
(37, 8, 'MES', 511, 'Fri Sep 28 15:00:00 IST 2018', 'Fri Sep 28 16:00:00 IST 2018', '28-9-2018'),
(38, 8, 'ECEB', 207, 'Fri Sep 28 09:00:00 IST 2018', 'Fri Sep 28 10:00:00 IST 2018', '28-9-2018'),
(39, 6, 'OS', 210, 'Thu Oct 11 14:00:28 IST 2018', 'Thu Oct 11 15:00:28 IST 2018', '11-10-2018'),
(40, 8, 'MES', 511, 'Sat Oct 27 12:00:00 IST 2018', 'Sat Oct 27 13:00:00 IST 2018', '27-10-2018');

-- --------------------------------------------------------

--
-- Table structure for table `structure_record`
--

CREATE TABLE `structure_record` (
  `id` int(3) NOT NULL,
  `floor` int(1) NOT NULL,
  `roomNo` int(3) NOT NULL,
  `type` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `structure_record`
--

INSERT INTO `structure_record` (`id`, `floor`, `roomNo`, `type`) VALUES
(1, 2, 201, 'COMPS HOD'),
(2, 2, 202, 'Pracs Lab'),
(3, 2, 207, 'Pracs Lab'),
(4, 2, 209, 'Pracs Lab'),
(5, 2, 210, 'Pracs Lab'),
(6, 2, 211, 'Pracs Lab'),
(7, 2, 213, 'ASH HOD'),
(8, 2, 215, 'Classroom'),
(9, 2, 216, 'Classroom'),
(10, 2, 217, 'Maths Faculty Room'),
(11, 2, 218, 'CIVIL HOD'),
(12, 2, 219, 'PHY LAB'),
(13, 2, 220, 'CHEM LAB'),
(14, 2, 220, 'Classroom'),
(15, 2, 221, 'Classroom'),
(16, 2, 222, 'Classroom'),
(17, 2, 223, 'Classroom'),
(18, 2, 224, 'INTERNET CENTER'),
(19, 2, 225, 'C3 Room'),
(20, 5, 510, 'Classroom'),
(21, 5, 511, 'Classroom'),
(22, 5, 512, 'Classroom'),
(23, 5, 513, 'Tutorial Room');

-- --------------------------------------------------------

--
-- Table structure for table `student_record`
--

CREATE TABLE `student_record` (
  `id` int(20) NOT NULL,
  `applicationId` int(11) NOT NULL,
  `rollNo` int(3) NOT NULL,
  `fname` text NOT NULL,
  `mname` text NOT NULL,
  `lname` text NOT NULL,
  `year` text NOT NULL,
  `branch` text NOT NULL,
  `email` text NOT NULL,
  `password` text NOT NULL,
  `mobileNo` text NOT NULL,
  `gender` text NOT NULL,
  `dob` text NOT NULL,
  `address` text NOT NULL,
  `city` text NOT NULL,
  `state` text NOT NULL,
  `activeStatus` int(1) NOT NULL,
  `userType` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `student_record`
--

INSERT INTO `student_record` (`id`, `applicationId`, `rollNo`, `fname`, `mname`, `lname`, `year`, `branch`, `email`, `password`, `mobileNo`, `gender`, `dob`, `address`, `city`, `state`, `activeStatus`, `userType`) VALUES
(1, 1, 0, 'PROF. CHANDAN', '', 'KOLWANKAR', 'null', 'INFT', 'chandan.kolwankar@vcet.edu.in', '12344321', '2502338234', 'MALE', 'null', 'Vasai', 'Thane', 'Maharashtra', 1, 'Faculty'),
(2, 2, 0, 'MRS. ARCHANA', '', 'EKBOTE', 'null', 'INFT', 'archana.ekbote@vcet.edu.in', '12344321', '2502338234', 'FEMALE', 'null', 'Vasai', 'Thane', 'Maharashtra', 1, 'Faculty'),
(3, 3, 0, 'MRS. MADHAVI', '', 'WAGHMARE', 'null', 'INFT', 'madhavi.waghmare@vcet.edu.in', '12344321', '2502338234', 'FEMALE', 'null', 'Vasai', 'Thane', 'Maharashtra', 1, 'Faculty'),
(4, 4, 0, 'MRS. VAISHALI', '', 'SHIRSATH', 'null', 'INFT', 'vaishali.shirsath@vcet.edu.in', '12344321', '2502338234', 'FEMALE', 'null', 'Vasai', 'Thane', 'Maharashtra', 1, 'Faculty'),
(5, 5, 0, 'MR. SAINATH ', '', 'PATIL', 'null', 'INFT', 'sainath.patil@vcet.edu.in', '12344321', '2502338234', 'MALE', 'null', 'Vasai', 'Thane', 'Maharashtra', 1, 'Faculty'),
(6, 6, 0, 'MRS. ANAGHA ', '', 'PATIL', 'null', 'INFT', 'anagha.patil@vcet.edu.in', '12344321', '2502338234', 'MALE', 'null', 'Dahisar', 'Thane', 'Maharashtra', 1, 'Faculty'),
(7, 7, 0, 'MRS. BHARATI', '', 'GONDHALEKAR', 'null', 'INFT', 'bharati.gondhalekar@vcet.edu.in', '12344321', '2502338234', 'FEMALE', 'null', 'Vasai', 'Thane', 'Maharashtra', 1, 'Faculty'),
(8, 8, 0, 'MR. YOGESH', '', 'PINGLE', 'null', 'INFT', 'yogesh.pingle@vcet.edu.in', '12344321', '2502338234', 'MALE', 'null', 'Vasai', 'Thane', 'Maharashtra', 1, 'Faculty'),
(9, 9, 0, 'MRS. MARIYAM', 'J.', 'K', 'null', 'INFT', 'mariyam.jawadwala@vcet.edu.in', '12344321', '2502338234', 'FEMALE', 'null', 'Vasai', 'Thane', 'Maharashtra', 1, 'Faculty'),
(10, 10, 0, 'MS. SWATI', '', 'SAIGAONKAR', 'null', 'INFT', 'swati.saigaonkar@vcet.edu.in', '12344321', '2502338234', 'FEMALE', 'null', 'Vasai', 'Thane', 'Maharashtra', 1, 'Faculty'),
(11, 164101239, 73, 'Sanchitsagar', 'Manojkumar', 'Singh', 'TE', 'INFT', 'sanchitsingh0409@gmail.com', 'sanchit', '9869505118', 'male', '4/9/1998', 'Sundar Darshan, Navghar Road, Bhayander East, Thane - 401105', 'Mumbai', 'Maharshtra', 1, 'customer'),
(12, 164101240, 37, 'Akash', 'Gulab', 'Rajpurohit', 'TE', 'INFT', 'rajpurohitakash.008@gmail.com', 'akash', '7854298924', 'male', '01/09/19997', 'Suncit,  Virar West', 'Palghar', 'Maharashtra', 1, 'customer'),
(13, 164101241, 53, 'Aditya', 'Daniel', 'Manze', 'TE', 'INFT', 'manzeaditya@gmail.com', 'aditya', '6502342568', 'male', '4/7/1998', 'Times, New York', 'Bulade', 'New York', 0, 'customer'),
(14, 164101242, 52, 'Raj', 'Suresh', 'Kotadia', 'TE', 'INFT', 'rajkotadia15@gmail.com', 'raj', '8768569043', 'male', '2/5/1997', 'Surekha Complex, Andheri West', 'Mumbai', 'Maharashtra', 0, 'customer');

-- --------------------------------------------------------

--
-- Table structure for table `stud_attend_final`
--

CREATE TABLE `stud_attend_final` (
  `id` int(10) NOT NULL,
  `applicationId` int(12) NOT NULL,
  `roomNo` int(3) NOT NULL,
  `date` text NOT NULL,
  `startTime` text NOT NULL,
  `endTime` text NOT NULL,
  `subject` text NOT NULL,
  `faculty` int(11) NOT NULL,
  `branch` text NOT NULL,
  `year` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `stud_attend_final`
--

INSERT INTO `stud_attend_final` (`id`, `applicationId`, `roomNo`, `date`, `startTime`, `endTime`, `subject`, `faculty`, `branch`, `year`) VALUES
(1, 164101239, 510, '25-09-2018', 'Tue Sep 25 09:00:00 IST 2018', 'Tue Sep 25 10:00:00 IST 2018', 'ECEB', 8, 'INFT', 'TE'),
(2, 164101240, 510, '25-09-2018', 'Tue Sep 25 09:00:00 IST 2018', 'Tue Sep 25 10:00:00 IST 2018', 'ECEB', 8, 'INFT', 'TE'),
(3, 164101241, 510, '25-09-2018', 'Tue Sep 25 09:00:00 IST 2018', 'Tue Sep 25 10:00:00 IST 2018', 'ECEB', 8, 'INFT', 'TE'),
(4, 164101242, 510, '25-09-2018', 'Tue Sep 25 09:00:00 IST 2018', 'Tue Sep 25 10:00:00 IST 2018', 'ECEB', 8, 'INFT', 'TE'),
(5, 164101239, 223, '25-09-2018', 'Tue Sep 25 10:00:00 IST 2018', 'Tue Sep 25 11:00:00 IST 2018', 'IP', 1, 'INFT', 'TE'),
(6, 164101241, 223, '25-09-2018', 'Tue Sep 25 10:00:00 IST 2018', 'Tue Sep 25 11:00:00 IST 2018', 'IP', 1, 'INFT', 'TE'),
(7, 164101239, 511, '25-09-2018', 'Tue Sep 25 11:00:00 IST 2018', 'Tue Sep 25 12:00:00 IST 2018', 'MES', 8, 'INFT', 'TE'),
(8, 164101240, 511, '25-09-2018', 'Tue Sep 25 11:00:00 IST 2018', 'Tue Sep 25 12:00:00 IST 2018', 'MES', 8, 'INFT', 'TE'),
(9, 164101242, 511, '25-09-2018', 'Tue Sep 25 11:00:00 IST 2018', 'Tue Sep 25 12:00:00 IST 2018', 'MES', 0, 'INFT', 'TE'),
(10, 164101239, 225, '25-09-2018', 'Tue Sep 25 12:00:00 IST 2018', 'Tue Sep 25 01:00:00 IST 2018', 'IP Lab', 1, 'INFT', 'TE'),
(11, 164101242, 225, '25-09-2018', 'Tue Sep 25 12:00:00 IST 2018', 'Tue Sep 25 01:00:00 IST 2018', 'IP Lab', 1, 'INFT', 'TE'),
(12, 164101239, 207, '25-09-2018', 'Tue Sep 25 02:00:00 IST 2018', 'Tue Sep 25 03:00:00 IST 2018', 'IOT Lab', 8, 'INFT', 'TE'),
(13, 164101240, 207, '25-09-2018', 'Tue Sep 25 02:00:00 IST 2018', 'Tue Sep 25 03:00:00 IST 2018', 'IOT Lab', 8, 'INFT', 'TE'),
(14, 164101241, 207, '25-09-2018', 'Tue Sep 25 02:00:00 IST 2018', 'Tue Sep 25 03:00:00 IST 2018', 'IOT Lab', 8, 'INFT', 'TE'),
(15, 164101242, 207, '25-09-2018', 'Tue Sep 25 02:00:00 IST 2018', 'Tue Sep 25 03:00:00 IST 2018', 'IOT Lab', 8, 'INFT', 'TE'),
(16, 164101239, 210, '25-09-2018', 'Tue Sep 25 03:00:00 IST 2018', 'Tue Sep 25 04:00:00 IST 2018', 'Security Lab', 6, 'INFT', 'TE'),
(17, 164101240, 210, '25-09-2018', 'Tue Sep 25 03:00:00 IST 2018', 'Tue Sep 25 04:00:00 IST 2018', 'Security Lab', 6, 'INFT', 'TE'),
(18, 164101241, 210, '25-09-2018', 'Tue Sep 25 03:00:00 IST 2018', 'Tue Sep 25 04:00:00 IST 2018', 'Security Lab', 6, 'INFT', 'TE'),
(19, 164101242, 210, '25-09-2018', 'Tue Sep 25 03:00:00 IST 2018', 'Tue Sep 25 04:00:00 IST 2018', 'Security Lab', 6, 'INFT', 'TE'),
(20, 164101242, 510, '25-09-2018', 'Tue Sep 25 04:00:00 IST 2018', 'Tue Sep 25 05:00:00 IST 2018', 'CNS', 6, 'INFT', 'TE'),
(21, 164101239, 510, '26-09-2018', 'Wed Sep 26 09:00:00 IST 2018', 'Wed Sep 26 10:00:00 IST 2018', 'MES', 8, 'INFT', 'TE'),
(22, 164101240, 510, '26-09-2018', 'Wed Sep 26 09:00:00 IST 2018', 'Wed Sep 26 10:00:00 IST 2018', 'MES', 8, 'INFT', 'TE'),
(23, 164101241, 510, '26-09-2018', 'Wed Sep 26 09:00:00 IST 2018', 'Wed Sep 26 10:00:00 IST 2018', 'MES', 8, 'INFT', 'TE'),
(24, 164101242, 510, '26-09-2018', 'Wed Sep 26 09:00:00 IST 2018', 'Wed Sep 26 10:00:00 IST 2018', 'MES', 8, 'INFT', 'TE'),
(25, 164101239, 511, '26-09-2018', 'Wed Sep 26 10:00:00 IST 2018', 'Wed Sep 26 11:00:00 IST 2018', 'ECEB', 8, 'INFT', 'TE'),
(26, 164101240, 511, '26-09-2018', 'Wed Sep 26 10:00:00 IST 2018', 'Wed Sep 26 11:00:00 IST 2018', 'ECEB', 8, 'INFT', 'TE'),
(27, 164101241, 511, '26-09-2018', 'Wed Sep 26 10:00:00 IST 2018', 'Wed Sep 26 11:00:00 IST 2018', 'ECEB', 8, 'INFT', 'TE'),
(28, 164101239, 210, '26-09-2018', 'Wed Sep 26 11:00:00 IST 2018', 'Wed Sep 26 12:00:00 IST 2018', 'Security Lab', 6, 'INFT', 'TE'),
(29, 164101240, 210, '26-09-2018', 'Wed Sep 26 11:00:00 IST 2018', 'Wed Sep 26 12:00:00 IST 2018', 'Security Lab', 6, 'INFT', 'TE'),
(30, 164101241, 223, '26-09-2018', 'Wed Sep 26 12:00:00 IST 2018', 'Wed Sep 26 01:00:00 IST 2018', 'IP', 1, 'INFT', 'TE'),
(31, 164101239, 510, '26-09-2018', 'Wed Sep 26 02:00:00 IST 2018', 'Wed Sep 26 03:00:00 IST 2018', 'CNS', 6, 'INFT', 'TE'),
(32, 164101240, 510, '26-09-2018', 'Wed Sep 26 02:00:00 IST 2018', 'Wed Sep 26 03:00:00 IST 2018', 'CNS', 6, 'INFT', 'TE'),
(33, 164101241, 510, '26-09-2018', 'Wed Sep 26 02:00:00 IST 2018', 'Wed Sep 26 03:00:00 IST 2018', 'CNS', 6, 'INFT', 'TE'),
(34, 164101242, 510, '26-09-2018', 'Wed Sep 26 02:00:00 IST 2018', 'Wed Sep 26 03:00:00 IST 2018', 'CNS', 6, 'INFT', 'TE'),
(35, 164101239, 225, '26-09-2018', 'Wed Sep 26 03:00:00 IST 2018', 'Wed Sep 26 04:00:00 IST 2018', 'IP Lab', 1, 'INFT', 'TE'),
(36, 164101241, 225, '26-09-2018', 'Wed Sep 26 03:00:00 IST 2018', 'Wed Sep 26 04:00:00 IST 2018', 'IP Lab', 1, 'INFT', 'TE'),
(37, 164101242, 225, '26-09-2018', 'Wed Sep 26 03:00:00 IST 2018', 'Wed Sep 26 04:00:00 IST 2018', 'IP Lab', 1, 'INFT', 'TE'),
(38, 164101239, 207, '26-09-2018', 'Wed Sep 26 04:00:00 IST 2018', 'Wed Sep 26 05:00:00 IST 2018', 'IOT Lab', 8, 'INFT', 'TE'),
(39, 164101240, 207, '26-09-2018', 'Wed Sep 26 04:00:00 IST 2018', 'Wed Sep 26 05:00:00 IST 2018', 'IOT Lab', 8, 'INFT', 'TE'),
(40, 164101241, 207, '26-09-2018', 'Wed Sep 26 04:00:00 IST 2018', 'Wed Sep 26 05:00:00 IST 2018', 'IOT Lab', 8, 'INFT', 'TE'),
(41, 164101242, 207, '26-09-2018', 'Wed Sep 26 04:00:00 IST 2018', 'Wed Sep 26 05:00:00 IST 2018', 'IOT Lab', 8, 'INFT', 'TE'),
(42, 164101239, 207, '27-09-2018', 'Thur Sep 27 09:00:00 IST 2018', 'Thur Sep 27 10:00:00 IST 2018', 'IOT Lab', 8, 'INFT', 'TE'),
(43, 164101239, 511, '27-09-2018', 'Thur Sep 27 10:00:00 IST 2018', 'Thur Sep 27 11:00:00 IST 2018', 'CNS', 6, 'INFT', 'TE'),
(44, 164101240, 511, '27-09-2018', 'Thur Sep 27 10:00:00 IST 2018', 'Thur Sep 27 11:00:00 IST 2018', 'CNS', 6, 'INFT', 'TE'),
(45, 164101241, 511, '27-09-2018', 'Thur Sep 27 10:00:00 IST 2018', 'Thur Sep 27 11:00:00 IST 2018', 'CNS', 6, 'INFT', 'TE'),
(46, 164101242, 511, '27-09-2018', 'Thur Sep 27 10:00:00 IST 2018', 'Thur Sep 27 11:00:00 IST 2018', 'CNS', 6, 'INFT', 'TE'),
(47, 164101239, 210, '27-09-2018', 'Thur Sep 27 11:00:00 IST 2018', 'Thur Sep 27 12:00:00 IST 2018', 'Security Lab', 6, 'INFT', 'TE'),
(48, 164101240, 210, '27-09-2018', 'Thur Sep 27 11:00:00 IST 2018', 'Thur Sep 27 12:00:00 IST 2018', 'Security Lab', 6, 'INFT', 'TE'),
(49, 164101241, 210, '27-09-2018', 'Thur Sep 27 11:00:00 IST 2018', 'Thur Sep 27 12:00:00 IST 2018', 'Security Lab', 6, 'INFT', 'TE'),
(50, 164101242, 210, '27-09-2018', 'Thur Sep 27 11:00:00 IST 2018', 'Thur Sep 27 12:00:00 IST 2018', 'Security Lab', 6, 'INFT', 'TE'),
(51, 164101239, 223, '27-09-2018', 'Thur Sep 27 12:00:00 IST 2018', 'Thur Sep 27 01:00:00 IST 2018', 'IP', 1, 'INFT', 'TE'),
(52, 164101242, 223, '27-09-2018', 'Thur Sep 27 12:00:00 IST 2018', 'Thur Sep 27 01:00:00 IST 2018', 'IP', 1, 'INFT', 'TE'),
(53, 164101240, 511, '27-09-2018', 'Thur Sep 27 02:00:00 IST 2018', 'Thur Sep 27 03:00:00 IST 2018', 'MES', 8, 'INFT', 'TE'),
(54, 164101241, 511, '27-09-2018', 'Thur Sep 27 02:00:00 IST 2018', 'Thur Sep 27 03:00:00 IST 2018', 'MES', 8, 'INFT', 'TE'),
(55, 164101242, 511, '27-09-2018', 'Thur Sep 27 02:00:00 IST 2018', 'Thur Sep 27 03:00:00 IST 2018', 'MES', 8, 'INFT', 'TE'),
(56, 164101239, 510, '27-09-2018', 'Thur Sep 27 03:00:00 IST 2018', 'Thur Sep 27 04:00:00 IST 2018', 'ECEB', 8, 'INFT', 'TE'),
(57, 164101241, 510, '27-09-2018', 'Thur Sep 27 03:00:00 IST 2018', 'Thur Sep 27 04:00:00 IST 2018', 'ECEB', 8, 'INFT', 'TE'),
(58, 164101239, 225, '27-09-2018', 'Thur Sep 27 04:00:00 IST 2018', 'Thur Sep 27 05:00:00 IST 2018', 'IP Lab', 1, 'INFT', 'TE'),
(59, 164101240, 225, '27-09-2018', 'Thur Sep 27 04:00:00 IST 2018', 'Thur Sep 27 05:00:00 IST 2018', 'IP Lab', 1, 'INFT', 'TE'),
(60, 164101241, 225, '27-09-2018', 'Thur Sep 27 04:00:00 IST 2018', 'Thur Sep 27 05:00:00 IST 2018', 'IP Lab', 1, 'INFT', 'TE'),
(61, 164101242, 225, '27-09-2018', 'Thur Sep 27 04:00:00 IST 2018', 'Thur Sep 27 05:00:00 IST 2018', 'IP Lab', 1, 'INFT', 'TE');

-- --------------------------------------------------------

--
-- Table structure for table `stud_attend_temp`
--

CREATE TABLE `stud_attend_temp` (
  `id` int(10) NOT NULL,
  `applicationId` int(12) NOT NULL,
  `roomNo` int(3) NOT NULL,
  `startTime` text NOT NULL,
  `startPhase` int(1) NOT NULL,
  `endTime` text NOT NULL,
  `endPhase` int(1) NOT NULL,
  `date` text NOT NULL,
  `macAddress` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `stud_attend_temp`
--

INSERT INTO `stud_attend_temp` (`id`, `applicationId`, `roomNo`, `startTime`, `startPhase`, `endTime`, `endPhase`, `date`, `macAddress`) VALUES
(1, 164101239, 511, 'Sat Oct 27 13:00:00 IST 2018', 1, '', 0, '27-10-2018', 'f6c2c2929804');

-- --------------------------------------------------------

--
-- Table structure for table `teacher_branch_year_sub`
--

CREATE TABLE `teacher_branch_year_sub` (
  `id` int(11) NOT NULL,
  `teacher_id` int(11) NOT NULL,
  `branch_year_id` int(11) NOT NULL,
  `semester` int(1) NOT NULL,
  `subject` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `teacher_branch_year_sub`
--

INSERT INTO `teacher_branch_year_sub` (`id`, `teacher_id`, `branch_year_id`, `semester`, `subject`) VALUES
(1, 0, 1, 3, 'AM-3'),
(2, 3, 1, 3, 'LD'),
(3, 5, 1, 3, 'DSA'),
(4, 4, 1, 3, 'DMS'),
(5, 2, 1, 3, 'PCOM'),
(6, 3, 1, 3, 'DD Lab'),
(7, 5, 1, 3, 'DS Lab'),
(8, 4, 1, 3, 'SQL Lab'),
(9, 1, 1, 3, 'JAVA Lab'),
(10, 0, 1, 4, 'AM-4'),
(11, 2, 1, 4, 'CN'),
(12, 6, 1, 4, 'OS'),
(13, 3, 1, 4, 'COA'),
(14, 9, 1, 4, 'AT'),
(15, 2, 1, 4, 'NET Lab'),
(16, 6, 1, 4, 'UNIX Lab'),
(17, 3, 1, 4, 'MP Lab'),
(18, 9, 1, 4, 'AT Lab'),
(19, 1, 1, 4, 'Python Lab'),
(20, 8, 7, 5, 'MES'),
(21, 1, 7, 5, 'IP'),
(22, 9, 7, 5, 'ADMT'),
(23, 6, 7, 5, 'CNS'),
(24, 10, 7, 5, 'IP Lab'),
(25, 6, 7, 5, 'Security Lab'),
(26, 9, 7, 5, 'OLAP Lab'),
(27, 8, 7, 5, 'IOT Lab'),
(28, 0, 7, 5, 'BCE'),
(29, 10, 7, 5, 'AOA'),
(30, 8, 7, 5, 'ECEB'),
(31, 9, 7, 5, 'ECEB'),
(32, 5, 7, 5, 'IMP'),
(33, 0, 7, 6, 'SEPM'),
(34, 0, 7, 6, 'DMBI'),
(35, 0, 7, 6, 'CCS'),
(36, 0, 7, 6, 'WN'),
(37, 0, 7, 6, 'SD Lab'),
(38, 0, 7, 6, 'BI Lab'),
(39, 0, 7, 6, 'CSD Lab'),
(40, 0, 7, 6, 'SN Lab'),
(41, 0, 7, 6, 'Mini Project Lab'),
(42, 0, 7, 6, 'AIP'),
(43, 0, 7, 6, 'SA'),
(44, 0, 7, 6, 'MS');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `branch_year`
--
ALTER TABLE `branch_year`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `faculty_record`
--
ALTER TABLE `faculty_record`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `facul_attend`
--
ALTER TABLE `facul_attend`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `structure_record`
--
ALTER TABLE `structure_record`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `student_record`
--
ALTER TABLE `student_record`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `stud_attend_final`
--
ALTER TABLE `stud_attend_final`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `stud_attend_temp`
--
ALTER TABLE `stud_attend_temp`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `teacher_branch_year_sub`
--
ALTER TABLE `teacher_branch_year_sub`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `branch_year`
--
ALTER TABLE `branch_year`
  MODIFY `id` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `facul_attend`
--
ALTER TABLE `facul_attend`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `structure_record`
--
ALTER TABLE `structure_record`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `student_record`
--
ALTER TABLE `student_record`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `stud_attend_final`
--
ALTER TABLE `stud_attend_final`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT for table `stud_attend_temp`
--
ALTER TABLE `stud_attend_temp`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `teacher_branch_year_sub`
--
ALTER TABLE `teacher_branch_year_sub`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
