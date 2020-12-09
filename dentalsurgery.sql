-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 09, 2020 at 06:35 PM
-- Server version: 10.1.37-MariaDB
-- PHP Version: 7.3.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dentalsurgery`
--

-- --------------------------------------------------------

--
-- Table structure for table `appointment`
--

CREATE TABLE `appointment` (
  `appNumber` varchar(10) NOT NULL,
  `patientName` varchar(50) NOT NULL,
  `problemName` varchar(50) NOT NULL,
  `appDate` date NOT NULL,
  `appTime` time NOT NULL,
  `staff_ID` int(10) NOT NULL,
  `dentist_ID` int(10) NOT NULL,
  `status` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `appointment`
--

INSERT INTO `appointment` (`appNumber`, `patientName`, `problemName`, `appDate`, `appTime`, `staff_ID`, `dentist_ID`, `status`) VALUES
('APR/10', 'James PJ', 'Toothache', '2019-04-04', '15:00:00', 1, 1, 'Completed'),
('APR/11', 'Anna Pitt', 'Toothache', '2019-04-24', '09:00:00', 1, 1, 'Confirmed'),
('APR/12', 'Patric Kennedy', 'Mouth Sores', '2019-04-24', '10:00:00', 1, 1, 'Cancelled'),
('APR/13', 'Brian Cowel', 'Toothache', '2019-04-24', '10:45:00', 1, 1, 'Confirmed'),
('APR/14', 'James PJ', 'Cavity', '2019-04-25', '11:30:00', 1, 1, 'Confirmed'),
('APR/15', 'Mary Joyce', 'Toothache', '2019-04-25', '15:00:00', 1, 1, 'Confirmed'),
('MAR/12', 'Patric Kennedy', 'Toothache', '2019-03-15', '10:30:00', 1, 1, 'Completed');

-- --------------------------------------------------------

--
-- Table structure for table `bill`
--

CREATE TABLE `bill` (
  `billNumber` varchar(10) NOT NULL,
  `refNumber` varchar(10) NOT NULL,
  `patientName` varchar(50) NOT NULL,
  `billDate` date NOT NULL,
  `dueDate` date NOT NULL,
  `process` varchar(50) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `billOverdue` decimal(10,2) NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `totalPayable` decimal(10,2) NOT NULL,
  `treat_Number` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bill`
--

INSERT INTO `bill` (`billNumber`, `refNumber`, `patientName`, `billDate`, `dueDate`, `process`, `amount`, `billOverdue`, `total`, `totalPayable`, `treat_Number`) VALUES
('B-110', 'P-14', 'Patric Kennedy', '2019-03-19', '2019-04-19', 'X-Ray', '50.00', '0.00', '50.00', '50.00', 'T/55'),
('B-110', 'P-15', 'Patric Kennedy', '2019-03-19', '2019-04-19', 'Routine Extraction', '100.00', '0.00', '100.00', '100.00', 'T/55'),
('B-117', 'P-14', 'James PJ', '2019-04-09', '2019-05-09', 'X-Ray', '50.00', '0.00', '50.00', '50.00', 'T/63'),
('B-117', 'P-17', 'James PJ', '2019-04-09', '2019-05-09', 'Temp Fillings', '100.00', '0.00', '100.00', '100.00', 'T/63'),
('B-119', 'P-22', 'Patric Kennedy', '2019-04-30', '2019-05-30', 'Late Cancellation', '10.00', '50.00', '60.00', '60.00', 'NULL');

-- --------------------------------------------------------

--
-- Table structure for table `dentalproblem`
--

CREATE TABLE `dentalproblem` (
  `prob_ID` varchar(10) NOT NULL,
  `patientName` varchar(50) NOT NULL,
  `problemName` varchar(50) NOT NULL,
  `appNumber` varchar(10) NOT NULL,
  `appDate` date NOT NULL,
  `appTime` time NOT NULL,
  `dateLastVisit` date DEFAULT NULL,
  `allergy` varchar(50) DEFAULT NULL,
  `medication` varchar(50) DEFAULT NULL,
  `prescription` varchar(50) DEFAULT NULL,
  `patient_ID` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dentalproblem`
--

INSERT INTO `dentalproblem` (`prob_ID`, `patientName`, `problemName`, `appNumber`, `appDate`, `appTime`, `dateLastVisit`, `allergy`, `medication`, `prescription`, `patient_ID`) VALUES
('P-1', 'James PJ', 'Toothache', 'APR/10', '2019-04-04', '15:00:00', NULL, 'None', 'Panadol', 'amoxicillin', 102),
('P-1', 'Anna Pitt', 'Toothache', 'APR/11', '2019-04-24', '09:00:00', NULL, NULL, NULL, NULL, 103),
('P-1', 'Brian Cowel', 'Toothache', 'APR/13', '2019-04-24', '10:45:00', NULL, NULL, NULL, NULL, 104),
('P-1', 'Mary Joyce', 'Toothache', 'APR/15', '2019-04-25', '15:00:00', NULL, NULL, NULL, NULL, 105),
('P-1', 'Patric Kennedy', 'Toothache', 'MAR/12', '2019-03-15', '10:30:00', NULL, NULL, 'Panadol', NULL, 101),
('P-2', 'James PJ', 'Cavity', 'APR/14', '2019-04-25', '11:30:00', '2019-04-04', NULL, NULL, NULL, 102),
('P-3', 'Patric Kennedy', 'Mouth Sores', 'APR/12', '2019-04-24', '10:00:00', '2019-03-15', NULL, NULL, NULL, 101);

-- --------------------------------------------------------

--
-- Table structure for table `dentist`
--

CREATE TABLE `dentist` (
  `dentist_ID` int(10) NOT NULL,
  `dName` varchar(50) NOT NULL,
  `dAddress` varchar(50) NOT NULL,
  `dphone` varchar(15) NOT NULL,
  `d_email` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dentist`
--

INSERT INTO `dentist` (`dentist_ID`, `dName`, `dAddress`, `dphone`, `d_email`) VALUES
(1, 'Dr Mary Mulcahy', '12 A Middleton', '021736305', 'mmulcahy@dental.com');

-- --------------------------------------------------------

--
-- Table structure for table `feeguide`
--

CREATE TABLE `feeguide` (
  `refNumber` varchar(10) NOT NULL,
  `process` varchar(50) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `dentist_ID` int(10) NOT NULL,
  `staff_ID` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `feeguide`
--

INSERT INTO `feeguide` (`refNumber`, `process`, `amount`, `dentist_ID`, `staff_ID`) VALUES
('P-11', 'Examination with PRSI', '0.00', 1, 1),
('P-12', 'Examination', '40.00', 1, 1),
('P-13', 'Issue of Prescription', '25.00', 1, 1),
('P-14', 'X-Ray', '50.00', 1, 1),
('P-15', 'Routine Extraction', '100.00', 1, 1),
('P-16', 'Surgical Extraction', '200.00', 1, 1),
('P-17', 'Temp Fillings', '100.00', 1, 1),
('P-18', 'Perm Fillings', '150.00', 1, 1),
('P-19', 'Whitening', '100.00', 1, 1),
('P-20', 'Scale&Polish', '90.00', 1, 1),
('P-21', 'Scale&Polish with PRSI', '25.00', 1, 1),
('P-22', 'Late Cancellation', '10.00', 1, 1);

-- --------------------------------------------------------

--
-- Stand-in structure for view `overdue`
-- (See below for the actual view)
--
CREATE TABLE `overdue` (
`patient_ID` int(10)
,`patientName` varchar(50)
,`billOverdue` decimal(10,2)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `overdue1`
-- (See below for the actual view)
--
CREATE TABLE `overdue1` (
`patient_ID` int(10)
,`patientName` varchar(50)
,`billOverdue` decimal(10,2)
);

-- --------------------------------------------------------

--
-- Table structure for table `patient`
--

CREATE TABLE `patient` (
  `patient_ID` int(10) NOT NULL,
  `patientName` varchar(50) NOT NULL,
  `dob` date NOT NULL,
  `gender` char(6) NOT NULL,
  `ppsNo` varchar(15) NOT NULL,
  `med_CardNo` varchar(10) DEFAULT NULL,
  `addressLine1` varchar(50) NOT NULL,
  `addressLine2` varchar(50) DEFAULT NULL,
  `eircode` varchar(10) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `n_o_k_Phone` varchar(15) NOT NULL,
  `billOverdue` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `patient`
--

INSERT INTO `patient` (`patient_ID`, `patientName`, `dob`, `gender`, `ppsNo`, `med_CardNo`, `addressLine1`, `addressLine2`, `eircode`, `phone`, `n_o_k_Phone`, `billOverdue`) VALUES
(101, 'Patric Kennedy', '2001-06-03', 'Male', '1234567KT', NULL, 'Apartment 2A', 'Middleton', 'H21W6YD', '083660081', '085559911', '50.00'),
(102, 'James PJ', '1995-05-02', 'Male', '1234577R', NULL, '6A Lakeview', NULL, 'A65 F8E4', '0894592681', '0863333333', '50.00'),
(103, 'Anna Pitt', '1985-04-23', 'Female', '1234567RW', '0A00009', '26 Riverside', 'Middleton', 'A65 F4E2', '021745555', '0873155001', '0.00'),
(104, 'Brian Cowel', '1999-10-14', 'Male', '1224567S', NULL, '70 Church Street', NULL, 'C21F8FW', '021121121', '021234234', '0.00'),
(105, 'Mary Joyce', '1979-03-31', 'Female', '1234566RS', '0A12009', '15 Church Street', NULL, 'A06 K8E5', '0874002814', '0873155044', '0.00');

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `billNumber` varchar(10) NOT NULL,
  `refNumber` varchar(10) NOT NULL,
  `patient_ID` int(10) NOT NULL,
  `pay_Date` date NOT NULL,
  `modeOfPay` varchar(15) NOT NULL,
  `totalPaid` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`billNumber`, `refNumber`, `patient_ID`, `pay_Date`, `modeOfPay`, `totalPaid`) VALUES
('B-110', 'P-15', 101, '2019-04-10', 'Cash', '100.00');

-- --------------------------------------------------------

--
-- Table structure for table `specialist`
--

CREATE TABLE `specialist` (
  `spID` int(10) NOT NULL,
  `spName` varchar(50) NOT NULL,
  `spTittle` varchar(50) NOT NULL,
  `spAddress` varchar(50) NOT NULL,
  `spPhone` varchar(50) NOT NULL,
  `spEmail` varchar(50) NOT NULL,
  `dentist_ID` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `specialist`
--

INSERT INTO `specialist` (`spID`, `spName`, `spTittle`, `spAddress`, `spPhone`, `spEmail`, `dentist_ID`) VALUES
(12, 'Dr Catherine Connolly', 'Orthodontist', '20-21 Main Street', '021754123', 'cat_connolly@corkdental.ie', 1),
(15, 'Dr. Allen Murphy', 'Endodontist', '5 Middle Street', '021554433', 'allenmurhy@murphys.ie', 1);

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `staff_ID` int(10) NOT NULL,
  `staffName` varchar(50) NOT NULL,
  `staffTitle` varchar(50) NOT NULL,
  `address` varchar(50) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `email` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`staff_ID`, `staffName`, `staffTitle`, `address`, `phone`, `email`) VALUES
(1, 'Helen', 'Secretary', '12 A Middleton', '021736306', 'helen@dental.com');

-- --------------------------------------------------------

--
-- Table structure for table `treatment`
--

CREATE TABLE `treatment` (
  `treat_Number` varchar(10) NOT NULL,
  `patientName` varchar(50) NOT NULL,
  `problemName` varchar(50) NOT NULL,
  `treat_Date` date NOT NULL,
  `treat_Time` time NOT NULL,
  `dentist_ID` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `treatment`
--

INSERT INTO `treatment` (`treat_Number`, `patientName`, `problemName`, `treat_Date`, `treat_Time`, `dentist_ID`) VALUES
('T/55', 'Patric Kennedy', 'Toothache', '2019-03-15', '10:30:00', 1),
('T/63', 'James PJ', 'Toothache', '2019-04-04', '15:15:00', 1);

-- --------------------------------------------------------

--
-- Table structure for table `visitcard`
--

CREATE TABLE `visitcard` (
  `patientName` varchar(50) NOT NULL,
  `appNumber` varchar(10) NOT NULL,
  `problemName` varchar(50) NOT NULL,
  `appDate` date NOT NULL,
  `appTime` time NOT NULL,
  `medication` varchar(50) DEFAULT NULL,
  `prescription` varchar(50) DEFAULT NULL,
  `spName` varchar(50) DEFAULT NULL,
  `work_No` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `visitcard`
--

INSERT INTO `visitcard` (`patientName`, `appNumber`, `problemName`, `appDate`, `appTime`, `medication`, `prescription`, `spName`, `work_No`) VALUES
('Anna Pitt', 'APR/11', 'Toothache', '2019-04-24', '09:00:00', NULL, NULL, NULL, NULL),
('Brian Cowel', 'APR/13', 'Toothache', '2019-04-24', '10:45:00', NULL, NULL, NULL, NULL),
('James PJ', 'APR/10', 'Toothache', '2019-04-04', '15:00:00', 'Panadol', 'amoxicillin', NULL, 1010),
('James PJ', 'APR/14', 'Cavity', '2019-04-25', '11:30:00', NULL, NULL, NULL, NULL),
('Mary Joyce', 'APR/15', 'Toothache', '2019-04-25', '15:00:00', NULL, NULL, NULL, NULL),
('Patric Kennedy', 'MAR/12', 'Toothache', '2019-03-15', '10:30:00', 'Panadol', NULL, NULL, 1001);

-- --------------------------------------------------------

--
-- Table structure for table `work`
--

CREATE TABLE `work` (
  `work_No` int(10) NOT NULL,
  `process` varchar(50) NOT NULL,
  `notes` varchar(300) NOT NULL,
  `status` varchar(50) NOT NULL,
  `treat_Number` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `work`
--

INSERT INTO `work` (`work_No`, `process`, `notes`, `status`, `treat_Number`) VALUES
(1001, 'Routine Extraction', 'Follow Medication/Take rest', 'Completed', 'T/55'),
(1001, 'X-Ray', 'Severe decay found/immediate extraction of lower third molar', 'Completed', 'T/55'),
(1010, 'Temp Fillings', 'Temporary Fillings done/Follow Medication&Prescription', 'Follow up in Three weeks', 'T/63'),
(1010, 'X-Ray', 'Cavities Found/Need fillings', 'Completed', 'T/63');

-- --------------------------------------------------------

--
-- Structure for view `overdue`
--
DROP TABLE IF EXISTS `overdue`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `overdue`  AS  select `patient`.`patient_ID` AS `patient_ID`,`patient`.`patientName` AS `patientName`,`patient`.`billOverdue` AS `billOverdue` from `patient` where (`patient`.`billOverdue` is not null) ;

-- --------------------------------------------------------

--
-- Structure for view `overdue1`
--
DROP TABLE IF EXISTS `overdue1`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `overdue1`  AS  select `patient`.`patient_ID` AS `patient_ID`,`patient`.`patientName` AS `patientName`,`patient`.`billOverdue` AS `billOverdue` from `patient` where (`patient`.`billOverdue` = 0) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `appointment`
--
ALTER TABLE `appointment`
  ADD PRIMARY KEY (`appNumber`),
  ADD KEY `staff_ID` (`staff_ID`),
  ADD KEY `dentist_ID` (`dentist_ID`);

--
-- Indexes for table `bill`
--
ALTER TABLE `bill`
  ADD PRIMARY KEY (`billNumber`,`refNumber`),
  ADD KEY `refNumber` (`refNumber`);

--
-- Indexes for table `dentalproblem`
--
ALTER TABLE `dentalproblem`
  ADD PRIMARY KEY (`prob_ID`,`appNumber`),
  ADD KEY `appNumber` (`appNumber`),
  ADD KEY `patient_ID` (`patient_ID`);

--
-- Indexes for table `dentist`
--
ALTER TABLE `dentist`
  ADD PRIMARY KEY (`dentist_ID`);

--
-- Indexes for table `feeguide`
--
ALTER TABLE `feeguide`
  ADD PRIMARY KEY (`refNumber`),
  ADD KEY `dentist_ID` (`dentist_ID`),
  ADD KEY `staff_ID` (`staff_ID`);

--
-- Indexes for table `patient`
--
ALTER TABLE `patient`
  ADD PRIMARY KEY (`patient_ID`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`billNumber`,`refNumber`),
  ADD KEY `patient_ID` (`patient_ID`);

--
-- Indexes for table `specialist`
--
ALTER TABLE `specialist`
  ADD PRIMARY KEY (`spID`),
  ADD KEY `dentist_ID` (`dentist_ID`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`staff_ID`);

--
-- Indexes for table `treatment`
--
ALTER TABLE `treatment`
  ADD PRIMARY KEY (`treat_Number`),
  ADD KEY `dentist_ID` (`dentist_ID`);

--
-- Indexes for table `visitcard`
--
ALTER TABLE `visitcard`
  ADD PRIMARY KEY (`patientName`,`appNumber`),
  ADD KEY `work_No` (`work_No`),
  ADD KEY `appNumber` (`appNumber`);

--
-- Indexes for table `work`
--
ALTER TABLE `work`
  ADD PRIMARY KEY (`work_No`,`process`),
  ADD KEY `treat_Number` (`treat_Number`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `appointment`
--
ALTER TABLE `appointment`
  ADD CONSTRAINT `appointment_ibfk_1` FOREIGN KEY (`staff_ID`) REFERENCES `staff` (`staff_ID`),
  ADD CONSTRAINT `appointment_ibfk_2` FOREIGN KEY (`dentist_ID`) REFERENCES `dentist` (`dentist_ID`);

--
-- Constraints for table `bill`
--
ALTER TABLE `bill`
  ADD CONSTRAINT `bill_ibfk_1` FOREIGN KEY (`refNumber`) REFERENCES `feeguide` (`refNumber`);

--
-- Constraints for table `dentalproblem`
--
ALTER TABLE `dentalproblem`
  ADD CONSTRAINT `dentalproblem_ibfk_1` FOREIGN KEY (`appNumber`) REFERENCES `appointment` (`appNumber`),
  ADD CONSTRAINT `dentalproblem_ibfk_2` FOREIGN KEY (`patient_ID`) REFERENCES `patient` (`patient_ID`);

--
-- Constraints for table `feeguide`
--
ALTER TABLE `feeguide`
  ADD CONSTRAINT `feeguide_ibfk_1` FOREIGN KEY (`dentist_ID`) REFERENCES `dentist` (`dentist_ID`),
  ADD CONSTRAINT `feeguide_ibfk_2` FOREIGN KEY (`staff_ID`) REFERENCES `staff` (`staff_ID`);

--
-- Constraints for table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`patient_ID`) REFERENCES `patient` (`patient_ID`),
  ADD CONSTRAINT `payment_ibfk_2` FOREIGN KEY (`billNumber`) REFERENCES `bill` (`billNumber`);

--
-- Constraints for table `specialist`
--
ALTER TABLE `specialist`
  ADD CONSTRAINT `specialist_ibfk_1` FOREIGN KEY (`dentist_ID`) REFERENCES `dentist` (`dentist_ID`);

--
-- Constraints for table `treatment`
--
ALTER TABLE `treatment`
  ADD CONSTRAINT `treatment_ibfk_1` FOREIGN KEY (`dentist_ID`) REFERENCES `dentist` (`dentist_ID`);

--
-- Constraints for table `visitcard`
--
ALTER TABLE `visitcard`
  ADD CONSTRAINT `visitcard_ibfk_1` FOREIGN KEY (`appNumber`) REFERENCES `appointment` (`appNumber`);

--
-- Constraints for table `work`
--
ALTER TABLE `work`
  ADD CONSTRAINT `work_ibfk_1` FOREIGN KEY (`treat_Number`) REFERENCES `treatment` (`treat_Number`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
