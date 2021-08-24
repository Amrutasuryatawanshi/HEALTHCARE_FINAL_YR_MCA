-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 24, 2021 at 09:28 AM
-- Server version: 10.4.19-MariaDB
-- PHP Version: 8.0.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_healthcare`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_avldaytime`
--

CREATE TABLE `tbl_avldaytime` (
  `adt_id` int(4) NOT NULL,
  `user_id` int(4) NOT NULL,
  `role_id` int(4) NOT NULL,
  `avl_day` varchar(100) NOT NULL,
  `avl_shift` varchar(20) DEFAULT NULL,
  `avl_time` varchar(50) DEFAULT NULL,
  `booking_status` varchar(15) DEFAULT NULL,
  `availability_status` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_avldaytime`
--

INSERT INTO `tbl_avldaytime` (`adt_id`, `user_id`, `role_id`, `avl_day`, `avl_shift`, `avl_time`, `booking_status`, `availability_status`) VALUES
(1, 1, 8, 'Wednesday', NULL, NULL, 'Pending', 'Available'),
(2, 1, 8, ' Friday', 'Morning', '12:00PM - 12:30PM', 'Pending', 'Available'),
(3, 1, 8, ' Thursday', ' Afternoon', '12:00PM - 12:30PM', NULL, 'Un-Available'),
(4, 3, 5, 'Monday', 'Evening', '12:00PM - 12:30PM', 'Complete', NULL),
(5, 3, 5, ' Saturday', ' Evening', '5:00PM - 5:30PM', 'Complete', NULL),
(6, 2, 4, 'Tuesday', 'Afternoon', '', NULL, 'Un-Available'),
(7, 2, 4, 'Friday', 'Afternoon', '', NULL, NULL),
(8, 2, 4, 'Wednesday', 'Evening', '9:30PM - 10:00PM', NULL, NULL),
(9, 2, 4, 'Tuesday', 'Morning', '5:00PM - 5:30PM', NULL, NULL),
(10, 10, 3, 'Tuesday', 'Evening', '7:00PM - 7:30PM', NULL, NULL),
(11, 1, 8, 'Monday', '', '', NULL, 'Available'),
(12, 1, 8, ' Wednesday', ' Morning', '7:30AM - 8:00AM', NULL, 'Available');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_daprofile`
--

CREATE TABLE `tbl_daprofile` (
  `da_id` int(4) NOT NULL,
  `image` varchar(10) NOT NULL,
  `qualification` varchar(25) NOT NULL,
  `yoc` int(10) NOT NULL,
  `landmark` varchar(10) NOT NULL,
  `city` varchar(10) NOT NULL,
  `state` varchar(10) NOT NULL,
  `pincode` varchar(25) NOT NULL,
  `identity_proof` varchar(25) NOT NULL,
  `degree_proof` varchar(25) NOT NULL,
  `reg_date` date NOT NULL,
  `added_by` varchar(25) NOT NULL,
  `user_id` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_daprofile`
--

INSERT INTO `tbl_daprofile` (`da_id`, `image`, `qualification`, `yoc`, `landmark`, `city`, `state`, `pincode`, `identity_proof`, `degree_proof`, `reg_date`, `added_by`, `user_id`) VALUES
(6, 'img1.jfif', 'ba', 4, 'MIDC      ', 'Baramati', 'maharastra', '', '', '', '2021-03-27', 'System-User', 9);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_dtbed`
--

CREATE TABLE `tbl_dtbed` (
  `bed_id` int(4) NOT NULL,
  `total_bed` int(4) NOT NULL,
  `price` float NOT NULL,
  `ward_id` int(4) NOT NULL,
  `dt_id` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_dtbed`
--

INSERT INTO `tbl_dtbed` (`bed_id`, `total_bed`, `price`, `ward_id`, `dt_id`) VALUES
(2, 2, 20, 2, 1),
(3, 5, 300, 3, 2),
(4, 99, 99, 4, 1),
(5, 3, 3, 5, 1),
(6, 4, 3, 6, 1),
(7, 99, 999, 7, 1),
(8, 3, 999, 8, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_dthospitalservices`
--

CREATE TABLE `tbl_dthospitalservices` (
  `hs_id` int(4) NOT NULL,
  `other_service_name` varchar(25) DEFAULT NULL,
  `charges` int(4) DEFAULT NULL,
  `availability_status` varchar(15) DEFAULT NULL,
  `dt_id` int(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_dthospitalservices`
--

INSERT INTO `tbl_dthospitalservices` (`hs_id`, `other_service_name`, `charges`, `availability_status`, `dt_id`) VALUES
(15, 'XRay', 150, NULL, 2),
(16, 'name', 50, NULL, 2),
(17, 'abcd', 600, 'Available', 1),
(18, 'abc', 600, 'Un-Available', 1),
(19, 'abc', 600, 'Available', 1),
(20, 'abc', 600, 'Available', 1),
(21, 'abc', 600, 'Available', 1),
(22, 'xray', 200, 'Available', 1),
(23, 'PQR', 600, 'Available', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_dtpatient_service_charges`
--

CREATE TABLE `tbl_dtpatient_service_charges` (
  `service_charges_id` int(4) NOT NULL,
  `hs_id` int(4) NOT NULL,
  `ipd_id` int(4) DEFAULT NULL,
  `inclinic_consult_id` int(4) DEFAULT NULL,
  `pt_id` int(4) NOT NULL,
  `family_member_id` int(4) DEFAULT NULL,
  `dt_id` int(4) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_dtpatient_service_charges`
--

INSERT INTO `tbl_dtpatient_service_charges` (`service_charges_id`, `hs_id`, `ipd_id`, `inclinic_consult_id`, `pt_id`, `family_member_id`, `dt_id`, `date`) VALUES
(1, 17, NULL, 25, 1, NULL, 1, '2021-06-04'),
(2, 17, NULL, 25, 1, NULL, 1, '2021-06-04'),
(3, 17, NULL, 25, 1, NULL, 1, '2021-06-04'),
(4, 17, NULL, 25, 1, NULL, 1, '2021-06-04'),
(5, 17, NULL, 25, 1, NULL, 1, '2021-06-04'),
(6, 17, NULL, 25, 1, NULL, 1, '2021-06-04'),
(7, 17, NULL, 25, 1, NULL, 1, '2021-06-04'),
(8, 17, NULL, 25, 1, NULL, 1, '2021-06-04'),
(11, 17, 1, NULL, 1, NULL, 1, '2021-06-04'),
(12, 17, 1, NULL, 1, NULL, 1, '2021-06-04'),
(13, 17, 1, NULL, 1, NULL, 1, '2021-06-04'),
(14, 17, 1, NULL, 1, NULL, 1, '2021-06-04'),
(15, 17, 1, NULL, 1, NULL, 1, '2021-06-04'),
(16, 17, 1, NULL, 1, NULL, 1, '2021-06-04'),
(17, 19, NULL, 31, 1, 1, 1, '2021-06-26'),
(18, 21, NULL, 31, 1, 1, 1, '2021-06-26'),
(19, 17, 2, NULL, 1, NULL, 1, '2021-06-27');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_dtprofile`
--

CREATE TABLE `tbl_dtprofile` (
  `dt_id` int(20) NOT NULL,
  `user_id` int(20) NOT NULL,
  `photo` varchar(100) NOT NULL,
  `degree` varchar(100) NOT NULL,
  `speciality` varchar(100) NOT NULL,
  `college` varchar(100) NOT NULL,
  `y_completion` int(20) NOT NULL,
  `experience` varchar(100) NOT NULL,
  `consult_fee` int(50) NOT NULL,
  `hospital_name` varchar(100) NOT NULL,
  `hospital_landmark` varchar(100) NOT NULL,
  `hospital_city` varchar(100) NOT NULL,
  `hospital_state` varchar(100) NOT NULL,
  `hospital_pincode` int(20) NOT NULL,
  `hospital_contact` int(10) NOT NULL,
  `hospital_email` varchar(100) NOT NULL,
  `identity_proof` varchar(100) NOT NULL,
  `degree_proof` varchar(100) NOT NULL,
  `medical_proof` varchar(100) NOT NULL,
  `status` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_dtprofile`
--

INSERT INTO `tbl_dtprofile` (`dt_id`, `user_id`, `photo`, `degree`, `speciality`, `college`, `y_completion`, `experience`, `consult_fee`, `hospital_name`, `hospital_landmark`, `hospital_city`, `hospital_state`, `hospital_pincode`, `hospital_contact`, `hospital_email`, `identity_proof`, `degree_proof`, `medical_proof`, `status`) VALUES
(1, 1, '', 'Bachelor of Dental Surgery', 'Cancer', 'vp college', 2000, '5', 200, 'city hospital', 'near temple', 'karmala', 'Maharashtra', 111111, 2147483647, 'suryawanshiamu@gmail.com', 'doc1.jpg', 'doc1.jpg', 'doc1.jpg', 1),
(2, 10, 'doc1.jpg', 'Bachelor of Medicine, Bachelor of Surgery', 'Bone&joint', 'VIIT', 1997, '2 year', 300, 'Shri Hospital', 'Baramati', 'Baramati', 'Maharashtra', 413102, 2147483647, 'Shri12@gmail.com', 'doc1.jpg', 'doc1.jpg', 'doc1.jpg', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_dtpt_bill`
--

CREATE TABLE `tbl_dtpt_bill` (
  `bill_id` int(4) NOT NULL,
  `service_charges_total` float DEFAULT NULL,
  `bed_charges` double DEFAULT NULL,
  `total_admit_days` int(15) DEFAULT NULL,
  `consult_fee` float DEFAULT NULL,
  `medicine_charges` float DEFAULT NULL,
  `inclinic_consult_id` int(4) DEFAULT NULL,
  `discharge_date` date DEFAULT NULL,
  `ipd_id` int(4) DEFAULT NULL,
  `pt_id` int(4) DEFAULT NULL,
  `family_member_id` int(4) DEFAULT NULL,
  `dt_id` int(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_dtpt_bill`
--

INSERT INTO `tbl_dtpt_bill` (`bill_id`, `service_charges_total`, `bed_charges`, `total_admit_days`, `consult_fee`, `medicine_charges`, `inclinic_consult_id`, `discharge_date`, `ipd_id`, `pt_id`, `family_member_id`, `dt_id`) VALUES
(1, 3600, NULL, NULL, 200, 44, 25, NULL, NULL, 1, NULL, 1),
(2, 4200, NULL, NULL, 200, 55, NULL, NULL, NULL, 1, NULL, 1),
(3, 4800, NULL, NULL, 200, 55, NULL, NULL, 3, 1, NULL, 1),
(4, 1800, 3996, 4, 200, 55, NULL, '2021-07-01', 1, 1, NULL, 1),
(5, 2400, 3996, 4, 200, 55, NULL, '2021-07-01', 1, 1, NULL, 1),
(6, 3000, 3996, 4, 200, 55, NULL, '2021-07-01', 1, 1, NULL, 1),
(7, 3600, 3996, 4, 200, 55, NULL, '2021-07-01', 1, 1, NULL, 1),
(8, 1200, NULL, NULL, 200, 44, 31, NULL, NULL, 1, 1, 1),
(9, 600, 1998, 2, 200, 55, NULL, '2021-06-01', 2, 1, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_dtward`
--

CREATE TABLE `tbl_dtward` (
  `ward_id` int(4) NOT NULL,
  `ward_cat` varchar(25) NOT NULL,
  `dt_id` int(4) NOT NULL,
  `availability_status` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_dtward`
--

INSERT INTO `tbl_dtward` (`ward_id`, `ward_cat`, `dt_id`, `availability_status`) VALUES
(1, 'General A/C', 1, NULL),
(2, 'Special Non A/C', 1, 'Un-Available'),
(3, 'General A/C', 2, NULL),
(4, 'General Non A/C', 1, 'Available'),
(5, 'General Non A/C', 1, 'Available'),
(6, 'Special A/C', 1, 'Available'),
(7, 'Special Non A/C', 1, 'Available'),
(8, 'ICU A/C', 1, 'Available');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_hcprofile`
--

CREATE TABLE `tbl_hcprofile` (
  `hc_id` int(11) NOT NULL,
  `image` varchar(104) NOT NULL,
  `qualification` varchar(10) NOT NULL,
  `yoc` varchar(10) NOT NULL,
  `landmark` varchar(10) NOT NULL,
  `city` varchar(10) NOT NULL,
  `state` varchar(10) NOT NULL,
  `pincode` int(6) NOT NULL,
  `identity_proof` varchar(10) NOT NULL,
  `degree_proof` varchar(10) NOT NULL,
  `reg_date` date NOT NULL,
  `added_by` varchar(10) NOT NULL,
  `user_id` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_hcprofile`
--

INSERT INTO `tbl_hcprofile` (`hc_id`, `image`, `qualification`, `yoc`, `landmark`, `city`, `state`, `pincode`, `identity_proof`, `degree_proof`, `reg_date`, `added_by`, `user_id`) VALUES
(2, 'img3.jpg', 'B.A(m)', '2012', 'Sangali   ', 'Sangali', 'Maharastra', 212121, '  ', '  ', '2021-02-22', 'System-Use', 6),
(3, 'img2.jpg', 'B.A(m)', '2012', 'Sangali   ', 'Sangali', 'Maharastra', 212121, '  ', '  ', '2021-03-17', 'System-Use', 6);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_lbpackage`
--

CREATE TABLE `tbl_lbpackage` (
  `package_id` int(50) NOT NULL,
  `lb_id` int(50) NOT NULL,
  `package_added_date` date NOT NULL,
  `package_name` varchar(100) NOT NULL,
  `package_expire_date` date DEFAULT NULL,
  `package_price` int(50) NOT NULL,
  `package_duration` varchar(50) NOT NULL,
  `availability_status` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_lbpackage`
--

INSERT INTO `tbl_lbpackage` (`package_id`, `lb_id`, `package_added_date`, `package_name`, `package_expire_date`, `package_price`, `package_duration`, `availability_status`) VALUES
(3, 1, '2021-03-13', 'Health', '2021-03-20', 200, '9', 'Available');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_lbpackages_test`
--

CREATE TABLE `tbl_lbpackages_test` (
  `test_package_id` int(50) NOT NULL,
  `test_name` varchar(100) NOT NULL,
  `package_id` int(50) NOT NULL,
  `lb_id` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_lbpackages_test`
--

INSERT INTO `tbl_lbpackages_test` (`test_package_id`, `test_name`, `package_id`, `lb_id`) VALUES
(1, ' Blood Test', 3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_lbprofile`
--

CREATE TABLE `tbl_lbprofile` (
  `lb_id` int(50) NOT NULL,
  `user_id` int(50) NOT NULL,
  `photo` varchar(100) NOT NULL,
  `degree` varchar(100) NOT NULL,
  `year` varchar(100) NOT NULL,
  `lab_name` varchar(100) NOT NULL,
  `lab_contact` varchar(10) NOT NULL,
  `lab_landmark` varchar(100) NOT NULL,
  `lab_city` varchar(100) NOT NULL,
  `lab_state` varchar(100) NOT NULL,
  `lab_pincode` int(6) NOT NULL,
  `identity_proof` varchar(100) NOT NULL,
  `degree_proof` varchar(100) NOT NULL,
  `reg_proof` varchar(100) NOT NULL,
  `status` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_lbprofile`
--

INSERT INTO `tbl_lbprofile` (`lb_id`, `user_id`, `photo`, `degree`, `year`, `lab_name`, `lab_contact`, `lab_landmark`, `lab_city`, `lab_state`, `lab_pincode`, `identity_proof`, `degree_proof`, `reg_proof`, `status`) VALUES
(1, 3, 'doc1.jpg', 'ParaMedical', '2000', 'CityLab', '7767852054', 'Bus Stop', 'Pandare', 'Maharashtra', 111111, ' ', 'ParaMedical', '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_lbpt_report`
--

CREATE TABLE `tbl_lbpt_report` (
  `lbpt_report_id` int(4) NOT NULL,
  `report` varchar(15) NOT NULL,
  `upload_date` date DEFAULT NULL,
  `testboolking_id` int(4) DEFAULT NULL,
  `packagebooking_id` int(4) DEFAULT NULL,
  `lb_id` int(4) NOT NULL,
  `pt_id` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_lbpt_report`
--

INSERT INTO `tbl_lbpt_report` (`lbpt_report_id`, `report`, `upload_date`, `testboolking_id`, `packagebooking_id`, `lb_id`, `pt_id`) VALUES
(2, ' doc2.jpg', NULL, 0, 1, 1, 1),
(3, ' doc2.jpg', NULL, 0, 1, 1, 1),
(4, ' doc2.jpg', NULL, 0, 1, 1, 1),
(5, ' doc2.jpg', NULL, 13, NULL, 1, 1),
(6, ' doc2.jpg', NULL, NULL, 1, 1, 1),
(7, ' doc2.jpg', NULL, NULL, 1, 1, 1),
(8, ' doc2.jpg', NULL, 14, NULL, 1, 1),
(9, ' 69306850.cms.j', NULL, 15, NULL, 1, 1),
(10, ' 69306850.cms.j', NULL, 19, NULL, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_lbtest`
--

CREATE TABLE `tbl_lbtest` (
  `test_id` int(50) NOT NULL,
  `user_id` int(50) NOT NULL,
  `lb_id` int(50) NOT NULL,
  `test_added_date` date NOT NULL,
  `test_name` varchar(100) NOT NULL,
  `test_price` varchar(50) NOT NULL,
  `test_report_duration` varchar(50) NOT NULL,
  `test_type` varchar(100) NOT NULL,
  `collecting_sample` varchar(50) DEFAULT NULL,
  `availability_status` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_lbtest`
--

INSERT INTO `tbl_lbtest` (`test_id`, `user_id`, `lb_id`, `test_added_date`, `test_name`, `test_price`, `test_report_duration`, `test_type`, `collecting_sample`, `availability_status`) VALUES
(1, 3, 1, '2021-03-13', 'Blood Test', '200', '2', 'Home Collection', '', 'Un-Available'),
(2, 3, 1, '2021-03-17', 'HB', '200', '4', 'Home Collection', 'Sample', NULL),
(4, 3, 1, '2021-03-17', 'Bp test', '200', '2', 'In Lab', 'bp ', NULL),
(5, 3, 1, '2021-06-05', 'urin', '234', '2', 'Home Collection', 'urin', NULL),
(6, 3, 1, '2021-06-05', 'HB', '88', '4', 'Home Collection', 'NO', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_leave`
--

CREATE TABLE `tbl_leave` (
  `leave_id` int(4) NOT NULL,
  `date_from` date NOT NULL,
  `date_to` date NOT NULL,
  `reason` varchar(14) NOT NULL,
  `user_id` int(4) NOT NULL,
  `role_id` int(4) NOT NULL,
  `status` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_leave`
--

INSERT INTO `tbl_leave` (`leave_id`, `date_from`, `date_to`, `reason`, `user_id`, `role_id`, `status`) VALUES
(3, '0000-00-00', '0000-00-00', 'Family Problem', 10, 3, ''),
(4, '2021-04-06', '2021-04-08', 'For the visit', 10, 3, 'Pending'),
(5, '2021-06-08', '2021-06-17', 'Family Problem', 1, 8, 'Pending');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_login`
--

CREATE TABLE `tbl_login` (
  `login_id` int(4) NOT NULL,
  `user_id` int(4) NOT NULL,
  `status` int(4) NOT NULL,
  `username` varchar(25) NOT NULL,
  `password` varchar(25) NOT NULL,
  `role_id` int(4) NOT NULL,
  `availability_status` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_login`
--

INSERT INTO `tbl_login` (`login_id`, `user_id`, `status`, `username`, `password`, `role_id`, `availability_status`) VALUES
(1, 1, 1, '9529935434', 'Mayuri@05', 3, NULL),
(2, 2, 1, '8830730831', 'Swapna1', 4, NULL),
(3, 3, 1, '7767852054', 'Sujata1', 5, NULL),
(4, 4, 1, '9090909090', 'Priti123', 9, NULL),
(5, 5, 0, '7767973907', 'Rupali@0', 2, NULL),
(6, 6, 0, '8787878787', 'Radha@123', 7, NULL),
(11, 9, 0, '9898909090', 'Ram@123', 6, NULL),
(12, 10, 0, '7410530476', 'Shital@05', 3, NULL),
(13, 11, 1, '5050505050', 'admin', 1, NULL),
(25, 23, 0, '8830730830', 'Ni1234', 10, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_otp`
--

CREATE TABLE `tbl_otp` (
  `otp_id` int(4) NOT NULL,
  `otp` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_otp`
--

INSERT INTO `tbl_otp` (`otp_id`, `otp`) VALUES
(1, 753532),
(2, 867764),
(3, 867764),
(4, 867764),
(5, 867764),
(6, 867764),
(7, 867764),
(8, 867764),
(9, 867764),
(10, 867764);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_phprescription_bill`
--

CREATE TABLE `tbl_phprescription_bill` (
  `phprescription_bill_id` int(4) NOT NULL,
  `medicine` varchar(15) NOT NULL,
  `quantity` int(4) NOT NULL,
  `price` float NOT NULL,
  `product_order_id` int(4) DEFAULT NULL,
  `ph_id` int(4) NOT NULL,
  `pt_id` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_phprescription_bill`
--

INSERT INTO `tbl_phprescription_bill` (`phprescription_bill_id`, `medicine`, `quantity`, `price`, `product_order_id`, `ph_id`, `pt_id`) VALUES
(1, 'gg', 2, 33, 8, 3, 1),
(2, 'ghg', 2, 12, 12, 3, 1),
(3, 'dd', 4, 3, 12, 3, 1),
(4, 'a', 0, 2, 12, 3, 1),
(5, 'ee', 3, 12, 8, 3, 1),
(6, 'rr', 5, 12, 17, 3, 1),
(7, 'd', 2, 4, 15, 3, 1),
(8, '5', 4, 4, 15, 3, 1),
(9, 'd', 5, 55, 15, 3, 1),
(10, 'f5', 6, 99, 15, 3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_phproduct`
--

CREATE TABLE `tbl_phproduct` (
  `product_id` int(4) NOT NULL,
  `product_name` varchar(50) NOT NULL,
  `product_quantity` int(4) NOT NULL,
  `product_price` int(4) NOT NULL,
  `add_date` date NOT NULL,
  `product_expdate` int(4) NOT NULL,
  `ph_id` int(4) NOT NULL,
  `category_id` int(4) NOT NULL,
  `brand_id` int(4) NOT NULL,
  `status` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_phproduct`
--

INSERT INTO `tbl_phproduct` (`product_id`, `product_name`, `product_quantity`, `product_price`, `add_date`, `product_expdate`, `ph_id`, `category_id`, `brand_id`, `status`) VALUES
(1, '  abc', 7, 77, '0000-00-00', 2021, 3, 2, 1, 'Un-Available'),
(4, 'body lotion', 1, 50, '2021-03-24', 2021, 3, 2, 1, 'Available');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_phproduct_brand`
--

CREATE TABLE `tbl_phproduct_brand` (
  `brand_id` int(4) NOT NULL,
  `brand_name` varchar(20) NOT NULL,
  `add_date` date NOT NULL,
  `availability_status` varchar(15) NOT NULL,
  `ph_id` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_phproduct_brand`
--

INSERT INTO `tbl_phproduct_brand` (`brand_id`, `brand_name`, `add_date`, `availability_status`, `ph_id`) VALUES
(1, 'Himalayas', '2021-03-24', 'Un-Available', 3),
(2, 'Dove', '2021-03-24', '', 3);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_phproduct_category`
--

CREATE TABLE `tbl_phproduct_category` (
  `category_id` int(4) NOT NULL,
  `category_name` varchar(20) NOT NULL,
  `add_date` date NOT NULL,
  `availability_status` varchar(15) NOT NULL,
  `ph_id` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_phproduct_category`
--

INSERT INTO `tbl_phproduct_category` (`category_id`, `category_name`, `add_date`, `availability_status`, `ph_id`) VALUES
(2, 'Skin Product', '2021-03-24', 'Available', 3),
(3, 'Skin Product', '2021-06-06', '', 3),
(4, 'Skin Product', '2021-06-06', '', 3),
(5, 'abc', '2021-06-06', '', 3);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_phprofile`
--

CREATE TABLE `tbl_phprofile` (
  `ph_id` int(4) NOT NULL,
  `user_id` int(4) NOT NULL,
  `photo` varchar(50) NOT NULL,
  `degree` varchar(20) NOT NULL,
  `year` int(4) NOT NULL,
  `medical_name` varchar(20) NOT NULL,
  `medical_contact` int(10) NOT NULL,
  `medical_landmark` varchar(20) NOT NULL,
  `medical_city` varchar(20) NOT NULL,
  `medical_state` varchar(20) NOT NULL,
  `medical_pincode` int(6) NOT NULL,
  `identity_proof` varchar(50) NOT NULL,
  `degree_proof` varchar(50) NOT NULL,
  `reg_proof` varchar(50) NOT NULL,
  `status` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_phprofile`
--

INSERT INTO `tbl_phprofile` (`ph_id`, `user_id`, `photo`, `degree`, `year`, `medical_name`, `medical_contact`, `medical_landmark`, `medical_city`, `medical_state`, `medical_pincode`, `identity_proof`, `degree_proof`, `reg_proof`, `status`) VALUES
(3, 2, '', 'DPharmacy', 2000, 'sai medical', 2147483647, 'petrol pump', 'karmala', 'Maharashtra', 111111, '', ' ', ' ', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_ptdisease`
--

CREATE TABLE `tbl_ptdisease` (
  `disease_id` int(4) NOT NULL,
  `symptom` varchar(25) NOT NULL,
  `finding_symptom` varchar(25) NOT NULL,
  `family_histry_disease` varchar(25) NOT NULL,
  `personal_histry_disease` varchar(25) NOT NULL,
  `patient_type` varchar(25) NOT NULL,
  `pt_id` int(4) NOT NULL,
  `family_member_id` int(4) DEFAULT NULL,
  `inclinic_consult_id` int(4) DEFAULT NULL,
  `ipd_id` int(4) DEFAULT NULL,
  `dt_id` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_ptdisease`
--

INSERT INTO `tbl_ptdisease` (`disease_id`, `symptom`, `finding_symptom`, `family_histry_disease`, `personal_histry_disease`, `patient_type`, `pt_id`, `family_member_id`, `inclinic_consult_id`, `ipd_id`, `dt_id`) VALUES
(3, 'cold', 'dd', 'dd', 'dd', 'OPD', 1, NULL, NULL, NULL, 1),
(4, 'cold', 'dd', 'dd', 'dd', 'OPD', 1, NULL, NULL, NULL, 1),
(5, 'cold', 'dd', 'dd', 'dd', 'OPD', 1, NULL, NULL, NULL, 1),
(6, 'cold', 'dd', 'dd', 'dd', 'IPD', 1, NULL, NULL, NULL, 1),
(7, 'cold', '', 'dd', '', 'OPD', 1, NULL, NULL, NULL, 1),
(8, '', '', '', '', 'IPD', 1, NULL, NULL, NULL, 1),
(9, 'cold', 'dd', 'dd', 'dd', 'OPD', 1, NULL, NULL, NULL, 1),
(10, '', '', '', '', 'IPD', 1, NULL, NULL, NULL, 1),
(11, '', '', '', '', 'OPD', 1, NULL, NULL, NULL, 1),
(12, '', '', '', '', 'OPD', 1, NULL, NULL, NULL, 1),
(13, 'cold', 'dd', 'dd', 'd', 'OPD', 1, NULL, NULL, NULL, 1),
(14, '44', 'gg', '44', 'gg', 'OPD', 1, NULL, NULL, NULL, 1),
(15, '44', 'gg', '44', 'gg', 'OPD', 1, NULL, NULL, NULL, 1),
(16, 'cold', 'flue', 'no', 'cold', 'OPD', 1, NULL, NULL, NULL, 1),
(17, 'cold', 'flue', '44', 'gg', 'OPD', 1, NULL, NULL, NULL, 1),
(18, 'kk', 'gg', 'n', 'gg', 'OPD', 1, NULL, NULL, NULL, 1),
(19, 'cold', 'gg', '44', 'gg', 'OPD', 1, NULL, NULL, NULL, 1),
(20, '44', 'gg', '44', 'cold', 'OPD', 1, NULL, NULL, NULL, 1),
(21, '44', 'flue', '44', 'gg', 'OPD', 1, NULL, NULL, NULL, 1),
(22, 'cold', 'flue', 'no', 'cold', 'IPD', 1, NULL, NULL, NULL, 1),
(23, 'cold', 'flue', 'no', 'cold', 'IPD', 1, NULL, NULL, NULL, 1),
(24, 'cold', 'gg', 'no', 'cold', 'IPD', 1, NULL, NULL, NULL, 1),
(25, 'cold', 'gg', '44', 'cold', 'IPD', 1, NULL, NULL, NULL, 1),
(26, '', '', '', '', 'IPD', 1, NULL, NULL, NULL, 1),
(27, '', '', '', '', 'IPD', 1, NULL, NULL, NULL, 1),
(28, '44', '', 'f', 'f', 'IPD', 1, NULL, NULL, NULL, 1),
(29, 'cold', 'gg', 'no', 'cold', 'OPD', 1, NULL, NULL, NULL, 1),
(30, 'cold', 'flue', 'no', 'cold', 'IPD', 1, NULL, NULL, NULL, 1),
(31, 'a', 'v', '3', 'v', 'OPD', 1, 1, NULL, NULL, 1),
(32, 'cold', 'gg', 'no', 'cold', 'OPD', 1, 1, NULL, NULL, 1),
(33, 'cold', 'gg', 'no', 'cold', 'OPD', 1, 1, NULL, NULL, 1),
(34, 'cold', 'gg', 'no', 'cold', 'OPD', 1, 1, NULL, NULL, 1),
(35, 'cold', 'gg', 'no', 'cold', 'OPD', 1, 1, 31, NULL, 1),
(36, '44', 'gg', 'no', 'cold', 'IPD', 1, NULL, NULL, 10, 1),
(37, '44', 'gg', 'no', 'cold', 'IPD', 1, NULL, NULL, 10, 1),
(38, 'cold', 'flue', 'no', 'cold', 'IPD', 1, NULL, NULL, 10, 1),
(39, '44', 'r', 'no', 'cold', 'IPD', 1, NULL, NULL, 10, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_ptfamily`
--

CREATE TABLE `tbl_ptfamily` (
  `family_member_id` int(4) NOT NULL,
  `name` varchar(25) NOT NULL,
  `blood_grp` varchar(15) NOT NULL,
  `age` int(4) DEFAULT NULL,
  `weight` float NOT NULL,
  `height` varchar(25) NOT NULL,
  `hb` int(15) NOT NULL,
  `relation` varchar(15) NOT NULL,
  `family_histry_disease` varchar(15) NOT NULL,
  `personal_histry_disease` varchar(15) NOT NULL,
  `address` varchar(25) NOT NULL,
  `pincode` int(6) DEFAULT NULL,
  `dob` date NOT NULL,
  `mob_no` int(12) NOT NULL,
  `pt_id` int(4) NOT NULL,
  `added_date` date NOT NULL,
  `status` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_ptfamily`
--

INSERT INTO `tbl_ptfamily` (`family_member_id`, `name`, `blood_grp`, `age`, `weight`, `height`, `hb`, `relation`, `family_histry_disease`, `personal_histry_disease`, `address`, `pincode`, `dob`, `mob_no`, `pt_id`, `added_date`, `status`) VALUES
(1, 'Amruta Manohar Suryawansh', 'O-', NULL, 56, '33', 898989898, 'Sister', ' noo', 'bp ', 'At-Nimbut,Tal-Baramati,Di', NULL, '2021-02-23', 898989898, 1, '2021-02-24', 'Available');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_pthealthlocker`
--

CREATE TABLE `tbl_pthealthlocker` (
  `healthlocker_id` int(4) NOT NULL,
  `photo` varchar(20) NOT NULL,
  `record_title` varchar(20) NOT NULL,
  `record_type` varchar(20) NOT NULL,
  `record_by` varchar(20) NOT NULL,
  `pt_id` int(4) NOT NULL,
  `family_member_id` int(4) DEFAULT NULL,
  `status` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_pthealthlocker`
--

INSERT INTO `tbl_pthealthlocker` (`healthlocker_id`, `photo`, `record_title`, `record_type`, `record_by`, `pt_id`, `family_member_id`, `status`) VALUES
(20, ' doc1.jpg', 'ss', 'Prescription', 'self', 1, NULL, ''),
(21, 'doc1.jpg', 'ss', 'Prescription', 'other', 1, NULL, ''),
(29, 'doc1.jpg', ' abc', 'Prescription', ' self', 1, NULL, 'Active'),
(30, ' ', ' abcd', 'Prescription', ' other', 3, NULL, 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_ptinclinic_consultation`
--

CREATE TABLE `tbl_ptinclinic_consultation` (
  `inclinic_consult_id` int(4) NOT NULL,
  `booking_date` varchar(25) DEFAULT NULL,
  `appointment_date` date NOT NULL,
  `symptoms` varchar(25) DEFAULT NULL,
  `dt_id` int(4) NOT NULL,
  `family_member_id` int(4) DEFAULT NULL,
  `pt_id` int(4) NOT NULL,
  `adt_id` int(4) NOT NULL,
  `status` varchar(15) DEFAULT NULL,
  `bill_status` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_ptinclinic_consultation`
--

INSERT INTO `tbl_ptinclinic_consultation` (`inclinic_consult_id`, `booking_date`, `appointment_date`, `symptoms`, `dt_id`, `family_member_id`, `pt_id`, `adt_id`, `status`, `bill_status`) VALUES
(25, '2021-04-02 15:41:27 ', '2021-04-02', 'cold', 1, 1, 1, 3, 'Complete', 'Done'),
(27, NULL, '0000-00-00', NULL, 2, NULL, 1, 10, 'Pending', NULL),
(28, '2021-04-02 17:19:27', '0000-00-00', 'cold', 2, 1, 1, 10, 'Delete', NULL),
(29, '2021-04-02 17:22:49', '0000-00-00', 'flue', 2, NULL, 1, 10, NULL, NULL),
(30, '2021-04-02 17:23:22', '0000-00-00', 'cold', 2, NULL, 1, 10, 'Pending', NULL),
(31, '2021-04-02 17:25:21', '0000-00-00', 'flue', 1, 1, 1, 10, 'Complete', 'Done'),
(32, '2021-04-02 17:28:01', '0000-00-00', 'cold', 2, NULL, 1, 10, 'Pending', NULL),
(33, '2021-06-21', '2021-06-23', 'sd', 1, 1, 1, 1, 'Pending', NULL),
(34, '2021-06-21', '2021-06-23', 'd', 1, 1, 1, 1, 'Pending', NULL),
(35, '2021-06-21', '2021-06-23', 'd', 1, 1, 1, 1, 'Pending', NULL),
(36, '2021-06-23', '0000-00-00', 'sd', 1, 1, 1, 1, 'Pending', NULL),
(37, '2021-06-23', '0000-00-00', 'sd', 1, 1, 1, 1, 'Pending', NULL),
(38, '2021-06-23', '0000-00-00', 'sd', 1, 1, 1, 1, 'Delete', NULL),
(39, '2021-06-23', '0000-00-00', 'sd', 1, 1, 1, 1, 'Pending', NULL),
(40, '2021-06-24', '2021-06-30', 'e', 1, 1, 1, 1, 'Pending', NULL),
(41, '2021-06-24 ', '2021-06-30', 'sd', 1, NULL, 1, 1, 'Pending', NULL),
(42, '2021-08-08 ', '2021-08-11', 'd', 1, NULL, 1, 1, NULL, NULL),
(43, '2021-08-14 ', '2021-08-18', 'sd', 1, 1, 1, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_ptipd`
--

CREATE TABLE `tbl_ptipd` (
  `ipd_id` int(4) NOT NULL,
  `pt_id` int(4) NOT NULL,
  `dt_id` int(4) NOT NULL,
  `family_member_id` int(4) DEFAULT NULL,
  `ward_id` int(4) NOT NULL,
  `allocate_bed` int(4) NOT NULL,
  `admit_date` date NOT NULL,
  `discharge_date` date DEFAULT NULL,
  `inclinic_consult_id` int(4) NOT NULL,
  `bill_status` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_ptipd`
--

INSERT INTO `tbl_ptipd` (`ipd_id`, `pt_id`, `dt_id`, `family_member_id`, `ward_id`, `allocate_bed`, `admit_date`, `discharge_date`, `inclinic_consult_id`, `bill_status`) VALUES
(1, 1, 1, NULL, 4, 4, '2021-06-04', NULL, 25, 'Done'),
(2, 1, 1, NULL, 4, 4, '2021-06-04', '2021-06-27', 25, 'Done'),
(3, 1, 1, NULL, 4, 6, '2021-06-04', '2021-06-27', 25, 'Done'),
(4, 1, 1, NULL, 4, 4, '2021-06-04', NULL, 25, NULL),
(5, 1, 1, NULL, 4, 5, '2021-06-04', NULL, 25, NULL),
(6, 1, 1, NULL, 4, 6, '2021-06-04', NULL, 25, NULL),
(7, 1, 1, NULL, 4, 6, '2021-06-04', NULL, 25, NULL),
(8, 1, 1, NULL, 4, 4, '2021-06-04', NULL, 25, NULL),
(9, 1, 1, NULL, 4, 1, '2021-06-07', NULL, 25, NULL),
(10, 1, 1, 1, 6, 4, '2021-06-26', NULL, 31, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_ptlabtest_booking`
--

CREATE TABLE `tbl_ptlabtest_booking` (
  `testboolking_id` int(4) NOT NULL,
  `pt_id` int(4) DEFAULT NULL,
  `lb_id` int(4) DEFAULT NULL,
  `booking_date` date DEFAULT NULL,
  `test_date` date DEFAULT NULL,
  `pickup_date` date DEFAULT NULL,
  `pickup_time` date DEFAULT NULL,
  `family_member_id` int(4) DEFAULT NULL,
  `adt_id` int(4) DEFAULT NULL,
  `test_id` int(4) DEFAULT NULL,
  `status` varchar(25) DEFAULT NULL,
  `report_status` varchar(15) DEFAULT NULL,
  `bill_status` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_ptlabtest_booking`
--

INSERT INTO `tbl_ptlabtest_booking` (`testboolking_id`, `pt_id`, `lb_id`, `booking_date`, `test_date`, `pickup_date`, `pickup_time`, `family_member_id`, `adt_id`, `test_id`, `status`, `report_status`, `bill_status`) VALUES
(13, 1, 1, NULL, '2021-06-07', NULL, NULL, NULL, 5, 1, 'Complete', 'DONE', NULL),
(14, 1, 1, NULL, NULL, NULL, NULL, NULL, 5, 1, '0', 'DONE', NULL),
(15, 1, 1, '2021-03-14', NULL, NULL, NULL, 1, 5, 1, 'Complete', 'DONE', NULL),
(16, 1, 1, '2021-03-18', NULL, NULL, NULL, 1, 5, 1, 'Complete', NULL, NULL),
(17, 1, 1, NULL, NULL, NULL, NULL, NULL, 4, 1, '', NULL, NULL),
(18, 1, 1, '2021-03-23', NULL, NULL, NULL, 1, 4, 1, 'Delete', NULL, NULL),
(19, 1, 1, '2021-03-23', NULL, NULL, NULL, 1, 5, 1, 'Pending', 'DONE', NULL),
(20, 1, 1, '2021-03-23', NULL, NULL, NULL, 1, 5, 1, 'Delete', NULL, NULL),
(21, 1, 1, '2021-03-23', NULL, NULL, NULL, 1, 5, 1, 'Delete', NULL, NULL),
(22, 1, 1, '2021-07-02', '0000-00-00', NULL, NULL, NULL, 5, 4, NULL, NULL, NULL),
(23, 1, 1, '2021-06-22', '0000-00-00', NULL, NULL, NULL, 4, 4, 'Complete', NULL, NULL),
(24, 1, 1, '2021-06-22', '0000-00-00', NULL, NULL, NULL, 4, 4, NULL, NULL, NULL),
(25, 1, 1, '2021-06-22', '2021-06-28', NULL, NULL, NULL, 4, 4, NULL, NULL, NULL),
(26, 1, 1, '2021-06-22', '2021-06-28', NULL, NULL, NULL, 4, 4, NULL, NULL, NULL),
(27, 1, 1, '2021-06-22', '2021-06-28', NULL, NULL, NULL, 4, 4, NULL, NULL, NULL),
(28, 1, 1, '2021-06-22', '2021-06-28', NULL, NULL, NULL, 4, 4, NULL, NULL, NULL),
(29, 1, 1, '2021-06-22', '2021-06-28', NULL, NULL, NULL, 4, 4, NULL, NULL, NULL),
(30, 1, 1, '2021-06-22', '2021-06-28', NULL, NULL, NULL, 4, 4, 'Complete', NULL, NULL),
(31, 1, 1, '2021-06-22', '2021-06-28', NULL, NULL, NULL, 4, 4, NULL, NULL, NULL),
(32, 1, 1, '2021-06-23', '2021-06-26', NULL, NULL, NULL, 5, 4, NULL, NULL, NULL),
(33, 1, 1, '2021-06-23', '2021-06-26', NULL, NULL, NULL, 5, 4, NULL, NULL, NULL),
(34, 1, 1, '2021-06-23', NULL, '2021-06-15', '0000-00-00', NULL, NULL, 1, NULL, NULL, NULL),
(35, 1, 1, '2021-06-24', '2021-06-26', NULL, NULL, NULL, 5, 4, NULL, NULL, NULL),
(36, 1, 1, '2021-06-24', NULL, '2021-06-16', '0000-00-00', NULL, NULL, 1, 'Delete', NULL, NULL),
(37, 1, 1, '2021-06-30', '2021-07-03', NULL, NULL, NULL, 5, 4, NULL, NULL, NULL),
(38, 1, 1, '2021-07-01', '2021-07-03', NULL, NULL, NULL, 5, 4, NULL, NULL, NULL),
(39, 1, 1, '2021-07-01', '2021-07-03', NULL, NULL, NULL, 5, 4, NULL, NULL, NULL),
(40, 1, 1, '2021-07-01', '2021-07-03', NULL, NULL, NULL, 5, 4, NULL, NULL, NULL),
(41, 1, 1, '2021-07-01', '2021-07-03', NULL, NULL, NULL, 5, 4, 'Pending', NULL, NULL),
(42, 1, 1, '2021-08-08', '2021-08-14', NULL, NULL, NULL, 5, 4, NULL, NULL, NULL),
(43, 1, 1, '2021-08-08', NULL, '2021-08-09', '0000-00-00', NULL, NULL, 1, NULL, NULL, NULL),
(44, 1, 1, '2021-08-08', NULL, '2021-08-10', '0000-00-00', NULL, NULL, 1, NULL, NULL, NULL),
(45, 1, 1, '2021-08-08', NULL, '2021-08-10', '0000-00-00', NULL, NULL, 1, NULL, NULL, NULL),
(46, 1, 1, '2021-08-08', NULL, '2021-08-16', '0000-00-00', NULL, NULL, 1, NULL, NULL, 'Done');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_ptmycart`
--

CREATE TABLE `tbl_ptmycart` (
  `cart_product_id` int(4) NOT NULL,
  `order_date` date NOT NULL,
  `product_quantity` int(4) NOT NULL,
  `total_price` double NOT NULL,
  `status` varchar(25) NOT NULL,
  `product_id` int(4) NOT NULL,
  `pt_id` int(4) NOT NULL,
  `ph_id` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_ptmycart`
--

INSERT INTO `tbl_ptmycart` (`cart_product_id`, `order_date`, `product_quantity`, `total_price`, `status`, `product_id`, `pt_id`, `ph_id`) VALUES
(3, '2021-03-25', 1, 77, 'Delete', 1, 1, 3),
(4, '2021-04-07', 1, 50, 'Pending', 4, 1, 3),
(5, '2021-04-24', 4, 308, 'Pending', 1, 1, 3),
(6, '2021-04-24', 4, 308, 'Pending', 1, 1, 3),
(7, '2021-06-24', 1, 77, 'Delete', 1, 1, 3),
(8, '2021-06-29', 3, 400, 'Delete', 1, 1, 3),
(9, '2021-06-29', 2, 300, 'Delete', 1, 1, 3),
(10, '2021-08-05', 2, 300, 'Delete', 1, 1, 3);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_ptonline_consultation`
--

CREATE TABLE `tbl_ptonline_consultation` (
  `consult_id` int(4) NOT NULL,
  `booking_date` date DEFAULT NULL,
  `consult_date` date DEFAULT NULL,
  `symptoms` varchar(25) DEFAULT NULL,
  `dt_id` int(4) DEFAULT NULL,
  `pt_id` int(4) DEFAULT NULL,
  `family_member_id` int(4) DEFAULT NULL,
  `adt_id` int(4) DEFAULT NULL,
  `status` varchar(15) DEFAULT NULL,
  `bill_status` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_ptonline_consultation`
--

INSERT INTO `tbl_ptonline_consultation` (`consult_id`, `booking_date`, `consult_date`, `symptoms`, `dt_id`, `pt_id`, `family_member_id`, `adt_id`, `status`, `bill_status`) VALUES
(51, '2021-04-02', NULL, 'cold', 2, 1, NULL, 10, 'Delete', NULL),
(54, '2021-07-02', '2021-04-02', 'cold', 1, 1, NULL, 2, 'Complete', 'Done'),
(55, '2021-04-07', NULL, 'cold', 2, 1, NULL, 10, 'Pending', NULL),
(56, '2021-06-06', '2021-06-10', 'cold', 1, 1, 1, 12, 'Complete', 'Done'),
(57, '2021-06-23', '2021-06-01', '44', 1, 1, 1, 11, 'Done', NULL),
(58, '2021-06-23', '2021-06-08', 'cold', 1, 1, 1, 12, 'Delete', NULL),
(59, '2021-06-23', '2021-06-07', '44', 1, 1, 1, 11, 'Pending', NULL),
(62, '2021-06-24', '2021-06-24', 'cold', 1, 1, NULL, 3, 'Pending', NULL),
(63, '2021-06-30', '2021-06-30', 'cold', 1, 1, 1, 12, 'Pending', NULL),
(64, '2021-06-30', '2021-08-20', 'cold', 1, 1, NULL, 12, 'Pending', NULL),
(65, '2021-07-08', '2021-07-12', 'dd', 1, 1, NULL, 11, NULL, NULL),
(66, '2021-08-08', '2021-08-09', 'f', 1, 1, NULL, 11, NULL, NULL),
(67, '2021-08-08', '2021-08-09', 'f', 1, 1, NULL, 11, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_ptorder_product`
--

CREATE TABLE `tbl_ptorder_product` (
  `product_order_id` int(11) NOT NULL,
  `product_quantity` int(4) DEFAULT NULL,
  `total_price` int(4) DEFAULT NULL,
  `payble_amt` float DEFAULT NULL,
  `order_date` date DEFAULT NULL,
  `pt_id` int(11) DEFAULT NULL,
  `ph_id` int(4) DEFAULT NULL,
  `product_id` int(4) DEFAULT NULL,
  `status` varchar(15) DEFAULT NULL,
  `order_status` varchar(15) DEFAULT NULL,
  `return_reason` varchar(30) DEFAULT NULL,
  `bill_status` varchar(15) DEFAULT NULL,
  `prescription` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_ptorder_product`
--

INSERT INTO `tbl_ptorder_product` (`product_order_id`, `product_quantity`, `total_price`, `payble_amt`, `order_date`, `pt_id`, `ph_id`, `product_id`, `status`, `order_status`, `return_reason`, `bill_status`, `prescription`) VALUES
(5, 1, 77, NULL, '2021-03-25', 1, 3, 1, 'Pending', 'Return', NULL, NULL, NULL),
(6, 1, 77, NULL, '2021-04-23', 1, 3, 1, 'Pending', NULL, NULL, '0', NULL),
(8, 2, 33, NULL, '2021-07-02', 1, 3, NULL, NULL, 'Return', NULL, 'Done', 'img.jpg'),
(9, 1, 77, NULL, '2021-04-24', 1, 3, 1, 'Pending', NULL, NULL, '0', NULL),
(10, 4, 308, NULL, '2021-04-25', 1, 3, 1, NULL, NULL, NULL, '0', NULL),
(11, 4, 308, NULL, '2021-04-25', 1, 3, 1, NULL, NULL, NULL, '0', NULL),
(12, 6, 17, NULL, '2021-04-25', 1, 3, NULL, 'Done', NULL, NULL, '0', 'img.jpg'),
(13, NULL, NULL, NULL, '2021-06-06', 1, NULL, NULL, 'Pending', NULL, NULL, '0', 'doc1.jpg'),
(14, 1, 77, NULL, '2021-06-07', 1, 3, 1, NULL, NULL, NULL, '0', NULL),
(15, 17, 562, NULL, '2021-06-24', 1, 3, NULL, '4-Done', NULL, NULL, '0', '2year result mc'),
(16, NULL, NULL, NULL, '2021-06-24', 1, NULL, NULL, 'Pending', NULL, NULL, '0', 'doc1.jpg'),
(17, NULL, 33, NULL, '2021-06-24', 1, NULL, NULL, 'Complete', NULL, '66', 'Done', 'doc1.jpg'),
(18, 1, 77, NULL, '2021-06-24', 1, 3, 1, NULL, NULL, NULL, '0', NULL),
(19, 1, 77, NULL, '2021-06-29', 1, 3, 1, 'Complete', 'Return', '5df', '0', NULL),
(20, 1, 77, NULL, '2021-06-29', 1, 3, 1, NULL, NULL, NULL, NULL, NULL),
(21, 1, 77, NULL, '2021-06-29', 1, 3, 1, NULL, NULL, NULL, NULL, NULL),
(22, 1, 77, NULL, '2021-06-29', 1, 3, 1, NULL, NULL, NULL, NULL, NULL),
(23, 1, 77, NULL, '2021-06-29', 1, 3, 1, NULL, NULL, NULL, NULL, NULL),
(24, 1, 77, NULL, '2021-06-29', 1, 3, 1, 'Pending', NULL, NULL, NULL, NULL),
(25, 1, 77, NULL, '2021-06-29', 1, 3, 1, NULL, NULL, NULL, NULL, NULL),
(26, 4, 308, NULL, '2021-06-29', 1, 3, 1, NULL, NULL, NULL, NULL, NULL),
(27, 1, 77, NULL, '2021-06-29', 1, 3, 1, NULL, NULL, NULL, NULL, NULL),
(28, 1, 77, NULL, '2021-06-29', 1, 3, 1, NULL, NULL, NULL, NULL, NULL),
(29, 1, 77, NULL, '2021-06-29', 1, 3, 1, NULL, NULL, NULL, NULL, NULL),
(30, 1, 77, NULL, '2021-06-29', 1, 3, 1, NULL, NULL, NULL, NULL, NULL),
(31, 1, 77, NULL, '2021-06-29', 1, 3, 1, NULL, NULL, NULL, NULL, NULL),
(32, 4, 308, NULL, '2021-06-29', 1, 3, 1, NULL, NULL, NULL, NULL, NULL),
(33, 1, 77, NULL, '2021-06-30', 1, 3, 1, NULL, NULL, NULL, NULL, NULL),
(34, 1, 77, NULL, '2021-06-30', 1, 3, 1, NULL, NULL, NULL, NULL, NULL),
(35, 1, 77, NULL, '2021-06-30', 1, 3, 1, NULL, NULL, NULL, NULL, NULL),
(36, 1, 77, NULL, '2021-06-30', 1, 3, 1, NULL, NULL, NULL, NULL, NULL),
(37, 1, 77, NULL, '2021-06-30', 1, 3, 1, NULL, NULL, NULL, NULL, NULL),
(38, 1, 77, NULL, '2021-06-30', 1, 3, 1, 'Pending', NULL, NULL, NULL, NULL),
(39, 0, 77, NULL, '2021-07-30', 1, 3, 1, '4-Done', NULL, NULL, NULL, NULL),
(40, 1, 77, NULL, '2021-07-30', 1, 3, 1, NULL, NULL, NULL, NULL, NULL),
(41, 1, 50, NULL, '2021-07-30', 1, 3, 4, NULL, NULL, NULL, NULL, NULL),
(42, 1, 50, NULL, '2021-07-30', 1, 3, 4, NULL, NULL, NULL, NULL, NULL),
(43, 1, 77, NULL, '2021-07-30', 1, 3, 1, NULL, NULL, NULL, NULL, NULL),
(44, 1, 50, NULL, '2021-07-30', 1, 3, 4, NULL, NULL, NULL, NULL, NULL),
(45, 1, 77, NULL, '2021-08-03', 1, 3, 1, NULL, NULL, NULL, NULL, NULL),
(46, 1, 50, NULL, '2021-08-03', 1, 3, 4, NULL, NULL, NULL, NULL, NULL),
(47, 1, 50, NULL, '2021-08-03', 1, 3, 4, NULL, NULL, NULL, NULL, NULL),
(48, 1, 50, NULL, '2021-08-03', 1, 3, 4, NULL, NULL, NULL, NULL, NULL),
(49, 1, 50, NULL, '2021-08-03', 1, 3, 4, NULL, NULL, NULL, NULL, NULL),
(50, 1, 50, NULL, '2021-08-03', 1, 3, 4, NULL, NULL, NULL, NULL, NULL),
(51, 1, 50, NULL, '2021-08-03', 1, 3, 4, NULL, NULL, NULL, NULL, NULL),
(52, 1, 50, NULL, '2021-08-03', 1, 3, 4, NULL, NULL, NULL, NULL, NULL),
(53, 4, 308, NULL, '2021-08-03', 1, 3, 1, NULL, NULL, NULL, NULL, NULL),
(54, 4, 308, NULL, '2021-08-03', 1, 3, 1, NULL, NULL, NULL, NULL, NULL),
(55, 1, 50, NULL, '2021-08-03', 1, 3, 4, NULL, NULL, NULL, NULL, NULL),
(56, 1, 50, NULL, '2021-08-03', 1, 3, 4, NULL, NULL, NULL, NULL, NULL),
(57, 4, 308, NULL, '2021-08-03', 1, 3, 1, NULL, NULL, NULL, NULL, NULL),
(58, 1, 50, NULL, '2021-08-03', 1, 3, 4, NULL, NULL, NULL, NULL, NULL),
(59, 1, 77, NULL, '2021-08-03', 1, 3, 1, NULL, NULL, NULL, NULL, NULL),
(60, 3, 400, NULL, '2021-08-03', 1, 3, 1, NULL, NULL, NULL, NULL, NULL),
(61, 1, 50, NULL, '2021-08-05', 1, 3, 4, NULL, NULL, NULL, NULL, NULL),
(62, 1, 77, NULL, '2021-08-05', 1, 3, 1, NULL, NULL, NULL, NULL, NULL),
(63, 1, 77, NULL, '2021-08-05', 1, 3, 1, NULL, NULL, NULL, NULL, NULL),
(64, 1, 50, NULL, '2021-08-05', 1, 3, 4, NULL, NULL, NULL, NULL, NULL),
(65, 1, 50, NULL, '2021-08-05', 1, 3, 4, NULL, NULL, NULL, NULL, NULL),
(66, 1, 50, NULL, '2021-08-05', 1, 3, 4, NULL, NULL, NULL, NULL, NULL),
(67, 1, 50, NULL, '2021-08-05', 1, 3, 4, NULL, NULL, NULL, NULL, NULL),
(68, 4, 308, NULL, '2021-08-05', 1, 3, 1, NULL, NULL, NULL, NULL, NULL),
(69, 1, 50, NULL, '2021-08-08', 1, 3, 4, NULL, NULL, NULL, NULL, NULL),
(70, 4, 308, NULL, '2021-08-08', 1, 3, 1, NULL, NULL, NULL, NULL, NULL),
(71, 1, 50, NULL, '2021-08-08', 1, 3, 4, NULL, NULL, NULL, NULL, NULL),
(72, 4, 308, NULL, '2021-08-14', 1, 3, 1, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_ptpackagebooking`
--

CREATE TABLE `tbl_ptpackagebooking` (
  `packagebooking_id` int(4) NOT NULL,
  `pt_id` int(4) NOT NULL,
  `lb_id` int(4) NOT NULL,
  `booking_date` date NOT NULL,
  `test_date` date DEFAULT NULL,
  `family_member_id` int(4) DEFAULT NULL,
  `adt_id` int(4) NOT NULL,
  `package_id` int(4) NOT NULL,
  `status` varchar(15) DEFAULT NULL,
  `report_status` varchar(15) DEFAULT NULL,
  `bill_status` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_ptpackagebooking`
--

INSERT INTO `tbl_ptpackagebooking` (`packagebooking_id`, `pt_id`, `lb_id`, `booking_date`, `test_date`, `family_member_id`, `adt_id`, `package_id`, `status`, `report_status`, `bill_status`) VALUES
(1, 1, 1, '2021-06-02', '2021-06-02', 1, 5, 3, 'Complete', 'DONE', NULL),
(5, 1, 1, '2021-06-06', '2021-06-07', NULL, 4, 3, 'Delete', NULL, NULL),
(6, 1, 1, '2021-06-06', '2021-06-12', NULL, 5, 3, 'Delete', NULL, NULL),
(7, 1, 1, '2021-06-23', '2021-06-26', NULL, 5, 3, 'Pending', NULL, NULL),
(8, 1, 1, '2021-06-23', '2021-06-26', 1, 5, 3, 'Delete', NULL, NULL),
(9, 1, 1, '2021-06-30', '2021-07-03', NULL, 5, 3, 'Pending', NULL, NULL),
(10, 1, 1, '2021-06-30', '2021-07-03', NULL, 5, 3, NULL, NULL, NULL),
(13, 1, 1, '2021-08-08', '2021-08-09', NULL, 4, 3, NULL, NULL, NULL),
(14, 1, 1, '2021-08-08', '2021-08-14', NULL, 5, 3, NULL, NULL, NULL),
(15, 1, 1, '2021-08-08', '2021-08-14', NULL, 5, 3, NULL, NULL, NULL),
(16, 1, 1, '2021-08-08', '2021-08-14', NULL, 5, 3, NULL, NULL, NULL),
(17, 1, 1, '2021-08-08', '2021-08-14', NULL, 5, 3, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_ptprescription`
--

CREATE TABLE `tbl_ptprescription` (
  `prescription_id` int(4) NOT NULL,
  `mediciene` varchar(25) NOT NULL,
  `dossage` varchar(25) NOT NULL,
  `notes` varchar(25) NOT NULL,
  `next_visit` varchar(25) NOT NULL,
  `advice` varchar(25) NOT NULL,
  `date` date NOT NULL,
  `dt_id` int(4) NOT NULL,
  `pt_id` int(4) NOT NULL,
  `family_member_id` int(4) DEFAULT NULL,
  `inclinic_consult_id` int(4) DEFAULT NULL,
  `ipd_id` int(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_ptprescription`
--

INSERT INTO `tbl_ptprescription` (`prescription_id`, `mediciene`, `dossage`, `notes`, `next_visit`, `advice`, `date`, `dt_id`, `pt_id`, `family_member_id`, `inclinic_consult_id`, `ipd_id`) VALUES
(1, 'a', '2', 'no', 'o', ' no', '2021-03-06', 1, 1, NULL, 25, NULL),
(2, 'b', '2', 'no', 'o', ' no', '2021-03-06', 1, 1, NULL, 25, NULL),
(3, 'a', '2', 'a', '2', ' a', '2021-03-06', 1, 1, NULL, NULL, NULL),
(4, '232', '3', '4', 'o', ' ', '2021-03-22', 1, 1, NULL, NULL, NULL),
(5, '', '', '', 'o', ' ', '2021-03-22', 1, 1, NULL, NULL, NULL),
(6, '', '', '', 'o', ' ', '2021-03-22', 1, 1, NULL, NULL, NULL),
(7, '', '', '', 'o', ' ', '2021-06-04', 1, 1, NULL, NULL, NULL),
(8, '', '', '', 'o', ' ', '2021-06-04', 1, 1, NULL, NULL, NULL),
(9, '', '', '', 'o', ' ', '2021-06-04', 1, 1, NULL, NULL, NULL),
(10, 'd', 'd', 'd', 'o', ' ', '2021-06-04', 1, 1, NULL, NULL, NULL),
(11, 'd', 'd', 'd', 'o', ' ', '2021-06-04', 1, 1, NULL, NULL, NULL),
(12, 'dd', 'ff', 'gg', '5', ' fd', '2021-06-04', 1, 1, NULL, NULL, NULL),
(13, 'gg', 'gg', 'gg', '5', ' fd', '2021-06-04', 1, 1, NULL, NULL, NULL),
(14, 's', 'ss', 's', '5', ' d', '2021-06-04', 1, 1, NULL, NULL, NULL),
(15, 's', 's', 'd', '5', ' d', '2021-06-04', 1, 1, NULL, NULL, NULL),
(16, 'd', 'f', 'g', '0', ' d', '2021-06-04', 1, 1, NULL, NULL, NULL),
(17, 'd', 'd', 's', '0', ' ', '2021-06-04', 1, 1, NULL, NULL, NULL),
(18, '', '', '', '0', ' ', '2021-06-04', 1, 1, NULL, NULL, NULL),
(19, 'g', 'g', 'h', '0', ' ', '2021-06-04', 1, 1, NULL, NULL, NULL),
(20, 'a', '3', '3', '2', ' v', '2021-06-26', 1, 1, 1, 31, NULL),
(21, 'd3', '3', '3', '2', ' v', '2021-06-26', 1, 1, 1, 31, NULL),
(22, 'h', '7', '3', '2', ' e', '2021-06-26', 1, 1, 1, NULL, 10);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_ptprofile`
--

CREATE TABLE `tbl_ptprofile` (
  `pt_id` int(4) NOT NULL,
  `age` int(4) NOT NULL,
  `blood_grp` varchar(15) NOT NULL,
  `height` float NOT NULL,
  `weight` float NOT NULL,
  `hb` varchar(25) NOT NULL,
  `state` varchar(15) NOT NULL,
  `city` varchar(15) NOT NULL,
  `locality` varchar(15) NOT NULL,
  `user_id` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_ptprofile`
--

INSERT INTO `tbl_ptprofile` (`pt_id`, `age`, `blood_grp`, `height`, `weight`, `hb`, `state`, `city`, `locality`, `user_id`) VALUES
(1, 32, ' B+', 4, 33, '13 ', '', '', '', 5),
(2, 32, ' B+', 4, 33, '13 ', '', '', '', 5),
(3, 32, ' B+', 4, 33, '13 ', '', '', '', 5);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_pttest_reports`
--

CREATE TABLE `tbl_pttest_reports` (
  `report_id` int(4) NOT NULL,
  `pt_id` int(4) NOT NULL,
  `lb_id` int(4) NOT NULL,
  `test_id` int(4) NOT NULL,
  `report` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_pttest_reports`
--

INSERT INTO `tbl_pttest_reports` (`report_id`, `pt_id`, `lb_id`, `test_id`, `report`) VALUES
(1, 0, 1, 0, ' '),
(2, 0, 1, 0, ' '),
(3, 0, 1, 1, ' '),
(4, 0, 1, 1, ' '),
(5, 0, 1, 1, ' '),
(6, 0, 1, 1, ' '),
(8, 0, 1, 1, 'Feedback (1).png'),
(9, 1, 1, 1, 'Feedback.png'),
(10, 0, 1, 1, ''),
(11, 0, 1, 1, ''),
(12, 1, 1, 1, 'Resume.pdf');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_registration`
--

CREATE TABLE `tbl_registration` (
  `user_id` int(4) NOT NULL,
  `user_name` varchar(25) NOT NULL,
  `user_gender` varchar(15) NOT NULL,
  `user_dob` date NOT NULL,
  `user_address` varchar(15) NOT NULL,
  `user_pincode` int(6) NOT NULL,
  `user_email` varchar(15) NOT NULL,
  `username` varchar(12) NOT NULL,
  `otp` int(6) NOT NULL,
  `password` varchar(15) NOT NULL,
  `booking_date` varchar(25) NOT NULL,
  `role_id` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_registration`
--

INSERT INTO `tbl_registration` (`user_id`, `user_name`, `user_gender`, `user_dob`, `user_address`, `user_pincode`, `user_email`, `username`, `otp`, `password`, `booking_date`, `role_id`) VALUES
(1, 'Mayuri Gosavi', 'female', '2021-02-03', 'Baramati   ', 412300, 'mayurig@gmail.c', '9529935434', 790809, 'Mayuri@05', '2021-02-19 10:19:55', 8),
(2, 'Swapnali Sunil JoshI', 'female', '2021-02-01', 'Karmala', 989898, 'swapnali@gmail.', '8830730831', 206712, 'Swapna1', '2021-02-21 14:35:08', 4),
(3, 'Sujata ', 'female', '2021-03-01', 'Pandare', 111111, 'sujatalakade@gm', '7767852054', 212332, 'Sujata1', '2021-02-21 15:36:03', 5),
(4, 'Priti', 'Female', '2021-02-09', 'Mumbai', 898989, 'priti@gmail.com', '9090909090', 898900, 'Priti123', '2021-02-09', 9),
(5, 'Rupali', 'female', '2021-02-05', 'Mumbaii', 212121, 'rupali@gmail.co', '7767973907', 478533, 'Rupali@0', '2021-02-24 16:25:22', 2),
(6, 'Radhika', 'female', '2021-02-09', 'Sangali', 898989, 'Radha@gmail.com', '', 0, '', '', 7),
(7, 'Rutuja', 'Female', '2021-02-09', 'Pune', 878787, 'rutu@gmail.com', 'rutu', 78678, '', '', 6),
(9, 'Rama', 'male', '2021-03-23', 'Baramati', 0, 'ram@gmail.com', '9898909090', 0, 'Ram@123', '2021-03-27 07:59:05', 6),
(10, 'Shital', 'female', '2021-04-14', 'Baramati    ', 787878, 'shital@gmail.co', '7410530476', 76406, 'Shital@05', '2021-04-01 16:50:31', 3),
(11, 'admin', 'male', '2021-06-01', 'pune', 989898, 'admin@gmail.com', 'admin', 678678, 'admin', '2021-06-02', 1),
(23, 'Nikita', 'female', '2021-05-31', 'Baramati', 676767, 'nikita@gmail.co', '8830730830', 867764, 'Ni1234', '2021-06-07', 10);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_role`
--

CREATE TABLE `tbl_role` (
  `role_id` int(4) NOT NULL,
  `role_category` varchar(15) NOT NULL,
  `role_created_by` varchar(15) NOT NULL,
  `status` varchar(15) DEFAULT NULL,
  `create_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_role`
--

INSERT INTO `tbl_role` (`role_id`, `role_category`, `role_created_by`, `status`, `create_date`) VALUES
(1, 'admin', '', NULL, NULL),
(2, 'patient', '', NULL, NULL),
(3, 'doctor', '', NULL, NULL),
(4, 'pharmacist', '', NULL, NULL),
(5, 'labrotarist', '', NULL, NULL),
(6, 'deliveryagent', '', NULL, NULL),
(7, 'homecollectiona', '', NULL, NULL),
(8, 'unauthorisedoct', '', NULL, NULL),
(9, 'Manager', 'Admin', 'De-Active', NULL),
(10, 'Accountant', 'Admin', 'Active', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_stassign_da`
--

CREATE TABLE `tbl_stassign_da` (
  `assign_da_id` int(4) NOT NULL,
  `da_id` int(4) NOT NULL,
  `product_order_id` int(4) NOT NULL,
  `assign_order_date` date NOT NULL,
  `delivery_date` date NOT NULL,
  `delivery_time` varchar(25) NOT NULL,
  `delivery_status` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_stassign_da`
--

INSERT INTO `tbl_stassign_da` (`assign_da_id`, `da_id`, `product_order_id`, `assign_order_date`, `delivery_date`, `delivery_time`, `delivery_status`) VALUES
(1, 6, 5, '2021-03-28', '2021-03-28', '12AM-6PM', 'Pending'),
(2, 6, 5, '2021-03-28', '2021-03-28', '12AM-6PM', 'Pending'),
(3, 6, 5, '2021-04-02', '2021-04-02', '12AM-6PM', 'Pending'),
(4, 6, 19, '2021-04-16', '2021-04-16', '12AM-6PM', 'Pending'),
(5, 6, 17, '2021-06-06', '2021-06-17', '7AM-12AM', 'Pending'),
(6, 6, 9, '2021-07-02', '2021-07-13', '7AM-12AM', 'Pending'),
(7, 6, 38, '2021-07-02', '2021-07-29', '7AM-12AM', 'Pending'),
(8, 6, 24, '2021-07-02', '2021-07-21', '7AM-12AM', 'Pending'),
(9, 6, 15, '2021-07-02', '2021-07-06', '7AM-12AM', 'Pending'),
(10, 6, 16, '2021-07-02', '2021-07-05', '12AM-6PM', 'Pending');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_stassign_hc`
--

CREATE TABLE `tbl_stassign_hc` (
  `assign_hc_id` int(11) NOT NULL,
  `hc_id` int(11) NOT NULL,
  `testbooking_id` int(11) NOT NULL,
  `assign_order_date` date NOT NULL,
  `pickup_date` date DEFAULT NULL,
  `pickup_time` varchar(15) NOT NULL,
  `pickup_status` varchar(14) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_stassign_hc`
--

INSERT INTO `tbl_stassign_hc` (`assign_hc_id`, `hc_id`, `testbooking_id`, `assign_order_date`, `pickup_date`, `pickup_time`, `pickup_status`) VALUES
(1, 2, 13, '0000-00-00', NULL, '', 'Complete'),
(2, 2, 15, '2021-03-16', NULL, '', ''),
(3, 3, 16, '2021-03-23', NULL, '', 'Pending'),
(4, 2, 18, '2021-03-29', NULL, '', 'Complete'),
(5, 3, 17, '2021-04-15', NULL, '', 'Pending'),
(6, 2, 19, '2021-04-16', NULL, '', 'Pending'),
(7, 2, 21, '2021-04-16', NULL, '', 'Pending'),
(8, 2, 20, '2021-04-16', NULL, '', 'Pending'),
(9, 2, 19, '2021-06-06', NULL, '', 'Pending'),
(10, 3, 34, '2021-07-02', NULL, '', 'Pending');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_avldaytime`
--
ALTER TABLE `tbl_avldaytime`
  ADD PRIMARY KEY (`adt_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `role_id` (`role_id`);

--
-- Indexes for table `tbl_daprofile`
--
ALTER TABLE `tbl_daprofile`
  ADD PRIMARY KEY (`da_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `tbl_dtbed`
--
ALTER TABLE `tbl_dtbed`
  ADD PRIMARY KEY (`bed_id`),
  ADD KEY `dt_id` (`dt_id`),
  ADD KEY `ward_id` (`ward_id`);

--
-- Indexes for table `tbl_dthospitalservices`
--
ALTER TABLE `tbl_dthospitalservices`
  ADD PRIMARY KEY (`hs_id`),
  ADD KEY `dt_id` (`dt_id`),
  ADD KEY `dt_id_2` (`dt_id`),
  ADD KEY `dt_id_3` (`dt_id`);

--
-- Indexes for table `tbl_dtpatient_service_charges`
--
ALTER TABLE `tbl_dtpatient_service_charges`
  ADD PRIMARY KEY (`service_charges_id`),
  ADD KEY `dt_id` (`dt_id`),
  ADD KEY `pt_id` (`pt_id`),
  ADD KEY `inclinic_consult_id` (`inclinic_consult_id`),
  ADD KEY `hs_id` (`hs_id`),
  ADD KEY `ipd_id` (`ipd_id`),
  ADD KEY `family_member_id` (`family_member_id`);

--
-- Indexes for table `tbl_dtprofile`
--
ALTER TABLE `tbl_dtprofile`
  ADD PRIMARY KEY (`dt_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `tbl_dtpt_bill`
--
ALTER TABLE `tbl_dtpt_bill`
  ADD PRIMARY KEY (`bill_id`),
  ADD KEY `dt_id` (`dt_id`),
  ADD KEY `pt_id` (`pt_id`),
  ADD KEY `inclinic_consult_id` (`inclinic_consult_id`),
  ADD KEY `ipd_id` (`ipd_id`),
  ADD KEY `family_member_id` (`family_member_id`);

--
-- Indexes for table `tbl_dtward`
--
ALTER TABLE `tbl_dtward`
  ADD PRIMARY KEY (`ward_id`),
  ADD KEY `dt_id` (`dt_id`);

--
-- Indexes for table `tbl_hcprofile`
--
ALTER TABLE `tbl_hcprofile`
  ADD PRIMARY KEY (`hc_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `tbl_lbpackage`
--
ALTER TABLE `tbl_lbpackage`
  ADD PRIMARY KEY (`package_id`),
  ADD KEY `lb_id` (`lb_id`);

--
-- Indexes for table `tbl_lbpackages_test`
--
ALTER TABLE `tbl_lbpackages_test`
  ADD PRIMARY KEY (`test_package_id`),
  ADD KEY `lb_id` (`lb_id`),
  ADD KEY `package_id` (`package_id`);

--
-- Indexes for table `tbl_lbprofile`
--
ALTER TABLE `tbl_lbprofile`
  ADD PRIMARY KEY (`lb_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `tbl_lbpt_report`
--
ALTER TABLE `tbl_lbpt_report`
  ADD PRIMARY KEY (`lbpt_report_id`),
  ADD KEY `testboolking_id` (`testboolking_id`),
  ADD KEY `packagebooking_id` (`packagebooking_id`),
  ADD KEY `lb_id` (`lb_id`),
  ADD KEY `pt_id` (`pt_id`);

--
-- Indexes for table `tbl_lbtest`
--
ALTER TABLE `tbl_lbtest`
  ADD PRIMARY KEY (`test_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `lb_id` (`lb_id`);

--
-- Indexes for table `tbl_leave`
--
ALTER TABLE `tbl_leave`
  ADD PRIMARY KEY (`leave_id`),
  ADD KEY `dt_id` (`user_id`),
  ADD KEY `role_id` (`role_id`);

--
-- Indexes for table `tbl_login`
--
ALTER TABLE `tbl_login`
  ADD PRIMARY KEY (`login_id`),
  ADD UNIQUE KEY `usrname` (`username`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `role_id` (`role_id`);

--
-- Indexes for table `tbl_otp`
--
ALTER TABLE `tbl_otp`
  ADD PRIMARY KEY (`otp_id`);

--
-- Indexes for table `tbl_phprescription_bill`
--
ALTER TABLE `tbl_phprescription_bill`
  ADD PRIMARY KEY (`phprescription_bill_id`),
  ADD KEY `pt_id` (`pt_id`),
  ADD KEY `ph_id` (`ph_id`),
  ADD KEY `product_order_id` (`product_order_id`);

--
-- Indexes for table `tbl_phproduct`
--
ALTER TABLE `tbl_phproduct`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `ph_id` (`ph_id`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `brand_id` (`brand_id`);

--
-- Indexes for table `tbl_phproduct_brand`
--
ALTER TABLE `tbl_phproduct_brand`
  ADD PRIMARY KEY (`brand_id`),
  ADD KEY `ph_id` (`ph_id`);

--
-- Indexes for table `tbl_phproduct_category`
--
ALTER TABLE `tbl_phproduct_category`
  ADD PRIMARY KEY (`category_id`),
  ADD KEY `ph_id` (`ph_id`);

--
-- Indexes for table `tbl_phprofile`
--
ALTER TABLE `tbl_phprofile`
  ADD PRIMARY KEY (`ph_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `tbl_ptdisease`
--
ALTER TABLE `tbl_ptdisease`
  ADD PRIMARY KEY (`disease_id`),
  ADD KEY `pt_id` (`pt_id`),
  ADD KEY `dt_id` (`dt_id`),
  ADD KEY `family_member_id` (`family_member_id`),
  ADD KEY `inclinic_consult_id` (`inclinic_consult_id`),
  ADD KEY `ipd_id` (`ipd_id`);

--
-- Indexes for table `tbl_ptfamily`
--
ALTER TABLE `tbl_ptfamily`
  ADD PRIMARY KEY (`family_member_id`),
  ADD KEY `user_id` (`pt_id`);

--
-- Indexes for table `tbl_pthealthlocker`
--
ALTER TABLE `tbl_pthealthlocker`
  ADD PRIMARY KEY (`healthlocker_id`),
  ADD KEY `family_member_id` (`family_member_id`),
  ADD KEY `user_id` (`pt_id`);

--
-- Indexes for table `tbl_ptinclinic_consultation`
--
ALTER TABLE `tbl_ptinclinic_consultation`
  ADD PRIMARY KEY (`inclinic_consult_id`),
  ADD KEY `dt_id` (`dt_id`),
  ADD KEY `pt_id` (`pt_id`),
  ADD KEY `adt_id` (`adt_id`),
  ADD KEY `pt_id_2` (`pt_id`),
  ADD KEY `family_member_id` (`family_member_id`);

--
-- Indexes for table `tbl_ptipd`
--
ALTER TABLE `tbl_ptipd`
  ADD PRIMARY KEY (`ipd_id`),
  ADD KEY `pt_id` (`pt_id`),
  ADD KEY `dt_id` (`dt_id`),
  ADD KEY `inclinic_consult_id` (`inclinic_consult_id`),
  ADD KEY `ward_id` (`ward_id`),
  ADD KEY `family_member_id` (`family_member_id`);

--
-- Indexes for table `tbl_ptlabtest_booking`
--
ALTER TABLE `tbl_ptlabtest_booking`
  ADD PRIMARY KEY (`testboolking_id`),
  ADD KEY `pt_id` (`pt_id`),
  ADD KEY `lb_id` (`lb_id`),
  ADD KEY `family_member_id` (`family_member_id`),
  ADD KEY `adt_id` (`adt_id`),
  ADD KEY `test_id` (`test_id`);

--
-- Indexes for table `tbl_ptmycart`
--
ALTER TABLE `tbl_ptmycart`
  ADD PRIMARY KEY (`cart_product_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `pt_id` (`pt_id`),
  ADD KEY `ph_id` (`ph_id`);

--
-- Indexes for table `tbl_ptonline_consultation`
--
ALTER TABLE `tbl_ptonline_consultation`
  ADD PRIMARY KEY (`consult_id`),
  ADD KEY `dt_id` (`dt_id`),
  ADD KEY `pt_id` (`pt_id`),
  ADD KEY `family_member_id` (`family_member_id`),
  ADD KEY `adt_id` (`adt_id`);

--
-- Indexes for table `tbl_ptorder_product`
--
ALTER TABLE `tbl_ptorder_product`
  ADD PRIMARY KEY (`product_order_id`),
  ADD KEY `pt_id` (`pt_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `ph_id` (`ph_id`),
  ADD KEY `pt_id_2` (`pt_id`,`ph_id`,`product_id`),
  ADD KEY `ph_id_2` (`ph_id`);

--
-- Indexes for table `tbl_ptpackagebooking`
--
ALTER TABLE `tbl_ptpackagebooking`
  ADD PRIMARY KEY (`packagebooking_id`),
  ADD KEY `package_id` (`package_id`),
  ADD KEY `adt_id` (`adt_id`),
  ADD KEY `family_member_id` (`family_member_id`),
  ADD KEY `booking_date` (`booking_date`),
  ADD KEY `lb_id` (`lb_id`),
  ADD KEY `pt_id` (`pt_id`);

--
-- Indexes for table `tbl_ptprescription`
--
ALTER TABLE `tbl_ptprescription`
  ADD PRIMARY KEY (`prescription_id`),
  ADD KEY `dt_id` (`dt_id`),
  ADD KEY `pt_id` (`pt_id`),
  ADD KEY `family_member_id` (`family_member_id`),
  ADD KEY `inclinic_consult_id` (`inclinic_consult_id`),
  ADD KEY `ipd_id` (`ipd_id`);

--
-- Indexes for table `tbl_ptprofile`
--
ALTER TABLE `tbl_ptprofile`
  ADD PRIMARY KEY (`pt_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `tbl_pttest_reports`
--
ALTER TABLE `tbl_pttest_reports`
  ADD PRIMARY KEY (`report_id`),
  ADD KEY `pt_id` (`pt_id`),
  ADD KEY `lb_id` (`lb_id`),
  ADD KEY `test_id` (`test_id`);

--
-- Indexes for table `tbl_registration`
--
ALTER TABLE `tbl_registration`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD KEY `role_id` (`role_id`),
  ADD KEY `role_id_2` (`role_id`);

--
-- Indexes for table `tbl_role`
--
ALTER TABLE `tbl_role`
  ADD PRIMARY KEY (`role_id`);

--
-- Indexes for table `tbl_stassign_da`
--
ALTER TABLE `tbl_stassign_da`
  ADD PRIMARY KEY (`assign_da_id`),
  ADD KEY `da_id` (`da_id`),
  ADD KEY `product_order_id` (`product_order_id`);

--
-- Indexes for table `tbl_stassign_hc`
--
ALTER TABLE `tbl_stassign_hc`
  ADD PRIMARY KEY (`assign_hc_id`),
  ADD KEY `hc_id` (`hc_id`),
  ADD KEY `testbooking_id` (`testbooking_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_avldaytime`
--
ALTER TABLE `tbl_avldaytime`
  MODIFY `adt_id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `tbl_daprofile`
--
ALTER TABLE `tbl_daprofile`
  MODIFY `da_id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tbl_dtbed`
--
ALTER TABLE `tbl_dtbed`
  MODIFY `bed_id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `tbl_dthospitalservices`
--
ALTER TABLE `tbl_dthospitalservices`
  MODIFY `hs_id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `tbl_dtpatient_service_charges`
--
ALTER TABLE `tbl_dtpatient_service_charges`
  MODIFY `service_charges_id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `tbl_dtprofile`
--
ALTER TABLE `tbl_dtprofile`
  MODIFY `dt_id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_dtpt_bill`
--
ALTER TABLE `tbl_dtpt_bill`
  MODIFY `bill_id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `tbl_dtward`
--
ALTER TABLE `tbl_dtward`
  MODIFY `ward_id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `tbl_hcprofile`
--
ALTER TABLE `tbl_hcprofile`
  MODIFY `hc_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_lbpackage`
--
ALTER TABLE `tbl_lbpackage`
  MODIFY `package_id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_lbpackages_test`
--
ALTER TABLE `tbl_lbpackages_test`
  MODIFY `test_package_id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_lbprofile`
--
ALTER TABLE `tbl_lbprofile`
  MODIFY `lb_id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_lbpt_report`
--
ALTER TABLE `tbl_lbpt_report`
  MODIFY `lbpt_report_id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `tbl_lbtest`
--
ALTER TABLE `tbl_lbtest`
  MODIFY `test_id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tbl_leave`
--
ALTER TABLE `tbl_leave`
  MODIFY `leave_id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tbl_login`
--
ALTER TABLE `tbl_login`
  MODIFY `login_id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `tbl_otp`
--
ALTER TABLE `tbl_otp`
  MODIFY `otp_id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `tbl_phprescription_bill`
--
ALTER TABLE `tbl_phprescription_bill`
  MODIFY `phprescription_bill_id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `tbl_phproduct`
--
ALTER TABLE `tbl_phproduct`
  MODIFY `product_id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tbl_phproduct_brand`
--
ALTER TABLE `tbl_phproduct_brand`
  MODIFY `brand_id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_phproduct_category`
--
ALTER TABLE `tbl_phproduct_category`
  MODIFY `category_id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tbl_phprofile`
--
ALTER TABLE `tbl_phprofile`
  MODIFY `ph_id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_ptdisease`
--
ALTER TABLE `tbl_ptdisease`
  MODIFY `disease_id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `tbl_ptfamily`
--
ALTER TABLE `tbl_ptfamily`
  MODIFY `family_member_id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_pthealthlocker`
--
ALTER TABLE `tbl_pthealthlocker`
  MODIFY `healthlocker_id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `tbl_ptinclinic_consultation`
--
ALTER TABLE `tbl_ptinclinic_consultation`
  MODIFY `inclinic_consult_id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `tbl_ptipd`
--
ALTER TABLE `tbl_ptipd`
  MODIFY `ipd_id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `tbl_ptlabtest_booking`
--
ALTER TABLE `tbl_ptlabtest_booking`
  MODIFY `testboolking_id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `tbl_ptmycart`
--
ALTER TABLE `tbl_ptmycart`
  MODIFY `cart_product_id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `tbl_ptonline_consultation`
--
ALTER TABLE `tbl_ptonline_consultation`
  MODIFY `consult_id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;

--
-- AUTO_INCREMENT for table `tbl_ptorder_product`
--
ALTER TABLE `tbl_ptorder_product`
  MODIFY `product_order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- AUTO_INCREMENT for table `tbl_ptpackagebooking`
--
ALTER TABLE `tbl_ptpackagebooking`
  MODIFY `packagebooking_id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `tbl_ptprescription`
--
ALTER TABLE `tbl_ptprescription`
  MODIFY `prescription_id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `tbl_ptprofile`
--
ALTER TABLE `tbl_ptprofile`
  MODIFY `pt_id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_pttest_reports`
--
ALTER TABLE `tbl_pttest_reports`
  MODIFY `report_id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `tbl_registration`
--
ALTER TABLE `tbl_registration`
  MODIFY `user_id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `tbl_role`
--
ALTER TABLE `tbl_role`
  MODIFY `role_id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `tbl_stassign_da`
--
ALTER TABLE `tbl_stassign_da`
  MODIFY `assign_da_id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `tbl_stassign_hc`
--
ALTER TABLE `tbl_stassign_hc`
  MODIFY `assign_hc_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbl_avldaytime`
--
ALTER TABLE `tbl_avldaytime`
  ADD CONSTRAINT `tbl_avldaytime_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `tbl_role` (`role_id`),
  ADD CONSTRAINT `tbl_avldaytime_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `tbl_registration` (`user_id`);

--
-- Constraints for table `tbl_daprofile`
--
ALTER TABLE `tbl_daprofile`
  ADD CONSTRAINT `tbl_daprofile_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `tbl_registration` (`user_id`);

--
-- Constraints for table `tbl_dtbed`
--
ALTER TABLE `tbl_dtbed`
  ADD CONSTRAINT `tbl_dtbed_ibfk_1` FOREIGN KEY (`dt_id`) REFERENCES `tbl_dtprofile` (`dt_id`),
  ADD CONSTRAINT `tbl_dtbed_ibfk_2` FOREIGN KEY (`ward_id`) REFERENCES `tbl_dtward` (`ward_id`);

--
-- Constraints for table `tbl_dthospitalservices`
--
ALTER TABLE `tbl_dthospitalservices`
  ADD CONSTRAINT `tbl_dthospitalservices_ibfk_1` FOREIGN KEY (`dt_id`) REFERENCES `tbl_dtprofile` (`dt_id`);

--
-- Constraints for table `tbl_dtpatient_service_charges`
--
ALTER TABLE `tbl_dtpatient_service_charges`
  ADD CONSTRAINT `tbl_dtpatient_service_charges_ibfk_1` FOREIGN KEY (`dt_id`) REFERENCES `tbl_dtprofile` (`dt_id`),
  ADD CONSTRAINT `tbl_dtpatient_service_charges_ibfk_2` FOREIGN KEY (`hs_id`) REFERENCES `tbl_dthospitalservices` (`hs_id`),
  ADD CONSTRAINT `tbl_dtpatient_service_charges_ibfk_3` FOREIGN KEY (`inclinic_consult_id`) REFERENCES `tbl_ptinclinic_consultation` (`inclinic_consult_id`),
  ADD CONSTRAINT `tbl_dtpatient_service_charges_ibfk_4` FOREIGN KEY (`pt_id`) REFERENCES `tbl_ptprofile` (`pt_id`),
  ADD CONSTRAINT `tbl_dtpatient_service_charges_ibfk_5` FOREIGN KEY (`ipd_id`) REFERENCES `tbl_ptipd` (`ipd_id`),
  ADD CONSTRAINT `tbl_dtpatient_service_charges_ibfk_6` FOREIGN KEY (`family_member_id`) REFERENCES `tbl_ptfamily` (`family_member_id`);

--
-- Constraints for table `tbl_dtprofile`
--
ALTER TABLE `tbl_dtprofile`
  ADD CONSTRAINT `tbl_dtprofile_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `tbl_registration` (`user_id`);

--
-- Constraints for table `tbl_dtpt_bill`
--
ALTER TABLE `tbl_dtpt_bill`
  ADD CONSTRAINT `tbl_dtpt_bill_ibfk_1` FOREIGN KEY (`dt_id`) REFERENCES `tbl_dtprofile` (`dt_id`),
  ADD CONSTRAINT `tbl_dtpt_bill_ibfk_2` FOREIGN KEY (`inclinic_consult_id`) REFERENCES `tbl_ptinclinic_consultation` (`inclinic_consult_id`),
  ADD CONSTRAINT `tbl_dtpt_bill_ibfk_3` FOREIGN KEY (`pt_id`) REFERENCES `tbl_ptprofile` (`pt_id`),
  ADD CONSTRAINT `tbl_dtpt_bill_ibfk_4` FOREIGN KEY (`ipd_id`) REFERENCES `tbl_ptipd` (`ipd_id`),
  ADD CONSTRAINT `tbl_dtpt_bill_ibfk_5` FOREIGN KEY (`family_member_id`) REFERENCES `tbl_ptfamily` (`family_member_id`);

--
-- Constraints for table `tbl_dtward`
--
ALTER TABLE `tbl_dtward`
  ADD CONSTRAINT `tbl_dtward_ibfk_1` FOREIGN KEY (`dt_id`) REFERENCES `tbl_dtprofile` (`dt_id`);

--
-- Constraints for table `tbl_hcprofile`
--
ALTER TABLE `tbl_hcprofile`
  ADD CONSTRAINT `tbl_hcprofile_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `tbl_registration` (`user_id`);

--
-- Constraints for table `tbl_lbpackage`
--
ALTER TABLE `tbl_lbpackage`
  ADD CONSTRAINT `tbl_lbpackage_ibfk_1` FOREIGN KEY (`lb_id`) REFERENCES `tbl_lbprofile` (`lb_id`);

--
-- Constraints for table `tbl_lbpackages_test`
--
ALTER TABLE `tbl_lbpackages_test`
  ADD CONSTRAINT `tbl_lbpackages_test_ibfk_1` FOREIGN KEY (`package_id`) REFERENCES `tbl_lbpackage` (`package_id`),
  ADD CONSTRAINT `tbl_lbpackages_test_ibfk_2` FOREIGN KEY (`lb_id`) REFERENCES `tbl_lbprofile` (`lb_id`);

--
-- Constraints for table `tbl_lbprofile`
--
ALTER TABLE `tbl_lbprofile`
  ADD CONSTRAINT `tbl_lbprofile_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `tbl_registration` (`user_id`);

--
-- Constraints for table `tbl_lbtest`
--
ALTER TABLE `tbl_lbtest`
  ADD CONSTRAINT `tbl_lbtest_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `tbl_registration` (`user_id`),
  ADD CONSTRAINT `tbl_lbtest_ibfk_2` FOREIGN KEY (`lb_id`) REFERENCES `tbl_lbprofile` (`lb_id`);

--
-- Constraints for table `tbl_leave`
--
ALTER TABLE `tbl_leave`
  ADD CONSTRAINT `tbl_leave_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `tbl_registration` (`user_id`),
  ADD CONSTRAINT `tbl_leave_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `tbl_role` (`role_id`);

--
-- Constraints for table `tbl_login`
--
ALTER TABLE `tbl_login`
  ADD CONSTRAINT `tbl_login_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `tbl_role` (`role_id`),
  ADD CONSTRAINT `tbl_login_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `tbl_registration` (`user_id`);

--
-- Constraints for table `tbl_phprescription_bill`
--
ALTER TABLE `tbl_phprescription_bill`
  ADD CONSTRAINT `tbl_phprescription_bill_ibfk_1` FOREIGN KEY (`ph_id`) REFERENCES `tbl_phprofile` (`ph_id`),
  ADD CONSTRAINT `tbl_phprescription_bill_ibfk_2` FOREIGN KEY (`product_order_id`) REFERENCES `tbl_ptorder_product` (`product_order_id`),
  ADD CONSTRAINT `tbl_phprescription_bill_ibfk_3` FOREIGN KEY (`pt_id`) REFERENCES `tbl_ptprofile` (`pt_id`);

--
-- Constraints for table `tbl_phproduct`
--
ALTER TABLE `tbl_phproduct`
  ADD CONSTRAINT `tbl_phproduct_ibfk_1` FOREIGN KEY (`ph_id`) REFERENCES `tbl_phprofile` (`ph_id`),
  ADD CONSTRAINT `tbl_phproduct_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `tbl_phproduct_category` (`category_id`),
  ADD CONSTRAINT `tbl_phproduct_ibfk_3` FOREIGN KEY (`brand_id`) REFERENCES `tbl_phproduct_brand` (`brand_id`);

--
-- Constraints for table `tbl_phproduct_brand`
--
ALTER TABLE `tbl_phproduct_brand`
  ADD CONSTRAINT `tbl_phproduct_brand_ibfk_1` FOREIGN KEY (`ph_id`) REFERENCES `tbl_phprofile` (`ph_id`);

--
-- Constraints for table `tbl_phproduct_category`
--
ALTER TABLE `tbl_phproduct_category`
  ADD CONSTRAINT `tbl_phproduct_category_ibfk_1` FOREIGN KEY (`ph_id`) REFERENCES `tbl_phprofile` (`ph_id`);

--
-- Constraints for table `tbl_phprofile`
--
ALTER TABLE `tbl_phprofile`
  ADD CONSTRAINT `tbl_phprofile_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `tbl_registration` (`user_id`);

--
-- Constraints for table `tbl_ptdisease`
--
ALTER TABLE `tbl_ptdisease`
  ADD CONSTRAINT `tbl_ptdisease_ibfk_1` FOREIGN KEY (`pt_id`) REFERENCES `tbl_ptprofile` (`pt_id`),
  ADD CONSTRAINT `tbl_ptdisease_ibfk_2` FOREIGN KEY (`dt_id`) REFERENCES `tbl_dtprofile` (`dt_id`),
  ADD CONSTRAINT `tbl_ptdisease_ibfk_3` FOREIGN KEY (`family_member_id`) REFERENCES `tbl_ptfamily` (`family_member_id`),
  ADD CONSTRAINT `tbl_ptdisease_ibfk_4` FOREIGN KEY (`inclinic_consult_id`) REFERENCES `tbl_ptinclinic_consultation` (`inclinic_consult_id`),
  ADD CONSTRAINT `tbl_ptdisease_ibfk_5` FOREIGN KEY (`ipd_id`) REFERENCES `tbl_ptipd` (`ipd_id`);

--
-- Constraints for table `tbl_ptfamily`
--
ALTER TABLE `tbl_ptfamily`
  ADD CONSTRAINT `tbl_ptfamily_ibfk_1` FOREIGN KEY (`pt_id`) REFERENCES `tbl_ptprofile` (`pt_id`);

--
-- Constraints for table `tbl_pthealthlocker`
--
ALTER TABLE `tbl_pthealthlocker`
  ADD CONSTRAINT `tbl_pthealthlocker_ibfk_1` FOREIGN KEY (`pt_id`) REFERENCES `tbl_ptprofile` (`pt_id`),
  ADD CONSTRAINT `tbl_pthealthlocker_ibfk_2` FOREIGN KEY (`family_member_id`) REFERENCES `tbl_ptfamily` (`family_member_id`);

--
-- Constraints for table `tbl_ptinclinic_consultation`
--
ALTER TABLE `tbl_ptinclinic_consultation`
  ADD CONSTRAINT `tbl_ptinclinic_consultation_ibfk_1` FOREIGN KEY (`dt_id`) REFERENCES `tbl_dtprofile` (`dt_id`),
  ADD CONSTRAINT `tbl_ptinclinic_consultation_ibfk_2` FOREIGN KEY (`adt_id`) REFERENCES `tbl_avldaytime` (`adt_id`),
  ADD CONSTRAINT `tbl_ptinclinic_consultation_ibfk_3` FOREIGN KEY (`family_member_id`) REFERENCES `tbl_ptfamily` (`family_member_id`),
  ADD CONSTRAINT `tbl_ptinclinic_consultation_ibfk_4` FOREIGN KEY (`pt_id`) REFERENCES `tbl_ptprofile` (`pt_id`);

--
-- Constraints for table `tbl_ptipd`
--
ALTER TABLE `tbl_ptipd`
  ADD CONSTRAINT `tbl_ptipd_ibfk_1` FOREIGN KEY (`inclinic_consult_id`) REFERENCES `tbl_ptinclinic_consultation` (`inclinic_consult_id`),
  ADD CONSTRAINT `tbl_ptipd_ibfk_2` FOREIGN KEY (`ward_id`) REFERENCES `tbl_dtward` (`ward_id`),
  ADD CONSTRAINT `tbl_ptipd_ibfk_3` FOREIGN KEY (`family_member_id`) REFERENCES `tbl_ptfamily` (`family_member_id`);

--
-- Constraints for table `tbl_ptlabtest_booking`
--
ALTER TABLE `tbl_ptlabtest_booking`
  ADD CONSTRAINT `tbl_ptlabtest_booking_ibfk_1` FOREIGN KEY (`adt_id`) REFERENCES `tbl_avldaytime` (`adt_id`),
  ADD CONSTRAINT `tbl_ptlabtest_booking_ibfk_2` FOREIGN KEY (`family_member_id`) REFERENCES `tbl_ptfamily` (`family_member_id`),
  ADD CONSTRAINT `tbl_ptlabtest_booking_ibfk_3` FOREIGN KEY (`lb_id`) REFERENCES `tbl_lbprofile` (`lb_id`),
  ADD CONSTRAINT `tbl_ptlabtest_booking_ibfk_4` FOREIGN KEY (`test_id`) REFERENCES `tbl_lbtest` (`test_id`),
  ADD CONSTRAINT `tbl_ptlabtest_booking_ibfk_5` FOREIGN KEY (`pt_id`) REFERENCES `tbl_ptprofile` (`pt_id`);

--
-- Constraints for table `tbl_ptmycart`
--
ALTER TABLE `tbl_ptmycart`
  ADD CONSTRAINT `tbl_ptmycart_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `tbl_phproduct` (`product_id`),
  ADD CONSTRAINT `tbl_ptmycart_ibfk_2` FOREIGN KEY (`pt_id`) REFERENCES `tbl_ptprofile` (`pt_id`),
  ADD CONSTRAINT `tbl_ptmycart_ibfk_3` FOREIGN KEY (`ph_id`) REFERENCES `tbl_phprofile` (`ph_id`);

--
-- Constraints for table `tbl_ptonline_consultation`
--
ALTER TABLE `tbl_ptonline_consultation`
  ADD CONSTRAINT `tbl_ptonline_consultation_ibfk_1` FOREIGN KEY (`dt_id`) REFERENCES `tbl_dtprofile` (`dt_id`),
  ADD CONSTRAINT `tbl_ptonline_consultation_ibfk_2` FOREIGN KEY (`family_member_id`) REFERENCES `tbl_ptfamily` (`family_member_id`),
  ADD CONSTRAINT `tbl_ptonline_consultation_ibfk_3` FOREIGN KEY (`pt_id`) REFERENCES `tbl_ptprofile` (`pt_id`),
  ADD CONSTRAINT `tbl_ptonline_consultation_ibfk_4` FOREIGN KEY (`adt_id`) REFERENCES `tbl_avldaytime` (`adt_id`);

--
-- Constraints for table `tbl_ptorder_product`
--
ALTER TABLE `tbl_ptorder_product`
  ADD CONSTRAINT `tbl_ptorder_product_ibfk_1` FOREIGN KEY (`ph_id`) REFERENCES `tbl_phprofile` (`ph_id`),
  ADD CONSTRAINT `tbl_ptorder_product_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `tbl_phproduct` (`product_id`) ON DELETE SET NULL ON UPDATE SET NULL,
  ADD CONSTRAINT `tbl_ptorder_product_ibfk_3` FOREIGN KEY (`pt_id`) REFERENCES `tbl_ptprofile` (`pt_id`);

--
-- Constraints for table `tbl_ptpackagebooking`
--
ALTER TABLE `tbl_ptpackagebooking`
  ADD CONSTRAINT `tbl_ptpackagebooking_ibfk_1` FOREIGN KEY (`adt_id`) REFERENCES `tbl_avldaytime` (`adt_id`),
  ADD CONSTRAINT `tbl_ptpackagebooking_ibfk_2` FOREIGN KEY (`lb_id`) REFERENCES `tbl_lbprofile` (`lb_id`),
  ADD CONSTRAINT `tbl_ptpackagebooking_ibfk_3` FOREIGN KEY (`family_member_id`) REFERENCES `tbl_ptfamily` (`family_member_id`),
  ADD CONSTRAINT `tbl_ptpackagebooking_ibfk_4` FOREIGN KEY (`package_id`) REFERENCES `tbl_lbpackage` (`package_id`),
  ADD CONSTRAINT `tbl_ptpackagebooking_ibfk_5` FOREIGN KEY (`pt_id`) REFERENCES `tbl_ptprofile` (`pt_id`);

--
-- Constraints for table `tbl_ptprescription`
--
ALTER TABLE `tbl_ptprescription`
  ADD CONSTRAINT `tbl_ptprescription_ibfk_1` FOREIGN KEY (`dt_id`) REFERENCES `tbl_dtprofile` (`dt_id`),
  ADD CONSTRAINT `tbl_ptprescription_ibfk_2` FOREIGN KEY (`pt_id`) REFERENCES `tbl_ptprofile` (`pt_id`),
  ADD CONSTRAINT `tbl_ptprescription_ibfk_3` FOREIGN KEY (`family_member_id`) REFERENCES `tbl_ptfamily` (`family_member_id`),
  ADD CONSTRAINT `tbl_ptprescription_ibfk_4` FOREIGN KEY (`inclinic_consult_id`) REFERENCES `tbl_ptinclinic_consultation` (`inclinic_consult_id`),
  ADD CONSTRAINT `tbl_ptprescription_ibfk_5` FOREIGN KEY (`ipd_id`) REFERENCES `tbl_ptipd` (`ipd_id`);

--
-- Constraints for table `tbl_ptprofile`
--
ALTER TABLE `tbl_ptprofile`
  ADD CONSTRAINT `tbl_ptprofile_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `tbl_registration` (`user_id`);

--
-- Constraints for table `tbl_registration`
--
ALTER TABLE `tbl_registration`
  ADD CONSTRAINT `tbl_registration_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `tbl_role` (`role_id`);

--
-- Constraints for table `tbl_stassign_da`
--
ALTER TABLE `tbl_stassign_da`
  ADD CONSTRAINT `tbl_stassign_da_ibfk_1` FOREIGN KEY (`da_id`) REFERENCES `tbl_daprofile` (`da_id`),
  ADD CONSTRAINT `tbl_stassign_da_ibfk_2` FOREIGN KEY (`product_order_id`) REFERENCES `tbl_ptorder_product` (`product_order_id`);

--
-- Constraints for table `tbl_stassign_hc`
--
ALTER TABLE `tbl_stassign_hc`
  ADD CONSTRAINT `tbl_stassign_hc_ibfk_1` FOREIGN KEY (`hc_id`) REFERENCES `tbl_hcprofile` (`hc_id`),
  ADD CONSTRAINT `tbl_stassign_hc_ibfk_2` FOREIGN KEY (`testbooking_id`) REFERENCES `tbl_ptlabtest_booking` (`testboolking_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
