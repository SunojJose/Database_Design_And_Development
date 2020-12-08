-- Inserting data into denatlSurgery by Sunoj Jose
--
-- --------------------------------------------------------------------------------------------------------------------------------------------------
-- Inserting into staff
--
-- --------------------------------------------------------------------------------------------------------------------------------------------------


INSERT INTO `staff` (`staff_ID`, `staffName`, `staffTitle`, `address`, `phone`, `email`) VALUES ('1', 'Helen', 'Secretary', '12 A Middleton', '021736306', 'helen@dental.com');

-- Inserting into dentist
--
-- ----------------------------------------------------------------------------------------------------------------------------------------------------


INSERT INTO `dentist` (`dentist_ID`, `dName`, `dAddress`, `dphone`, `d_email`) VALUES ('1', 'Dr Mary Mulcahy', '12 A Middleton', '021736305', 'mmulcahy@dental.com');
-- -------------------------------------------------------------------------------------------------------------------------------------------------
-- Inserting into patient
-- 
-- -------------------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO `patient` (`patient_ID`, `patientName`, `dob`, `gender`, `ppsNo`, `med_CardNo`, `addressLine1`, `addressLine2`, `eircode`, `phone`, `n_o_k_Phone`, `billOverdue`) VALUES ('101', 'Patric Kennedy', '2001-06-03', 'Male', '1234567KT', '0K12356', 'Apartment 2A', 'Middleton', 'H21W6YD', '083660081', '085559911', '50.00'),('102', 'James PJ', '1995-05-02', 'Male', '1234577R', NULL, '6A Lakeview', NULL, 'A65 F8E4', '0894592681', '0863333333', '150.00'),('103', 'Anna Pitt', '1985-04-23', 'Female', '1234567RW', '0A00009', '26 Riverside', 'Middleton', 'A65 F4E2', '021745555', '0873155001', '0.0'),('104', 'Brian Cowel', '1999-10-14', 'Male', '1224567S', NULL, '70 Church Street', NULL, 'C21F8FW', '021121121', '021234234', '0.00'),('105', 'Mary Joyce', '1979-03-31', 'Female', '1234566RS', '0A12009', '15 Church Street', '', 'A06 K8E5', '0874002814', '0873155044', '0.00');
-- -------------------------------------------------------------------------------------------------------------------------------------------------
-- Inserting into dentalProblem
--
-- -------------------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO `dentalProblem` (`prob_ID`, `patientName`, `problemName`, `appNumber`, `appDate`, `appTime`, `dateLastVisit`, `allergy`, `medication`, `prescription`, `dentist_ID`) VALUES  ('P-1', 'Patric Kennedy', 'Toothache', 'MAR/12', '2019-03-15', '10:30:00', NULL, NULL,'Panadol', NULL, '1'),
 ('P-1', 'James PJ', 'Toothache', 'APR/10', '2019-04-04', '15:00:00', NULL, NULL, 'Panadol','amoxicillin' , '1'),
('P-1', 'Anna Pitt', 'Toothache', 'APR/11', '2019-04-24', '09:00:00', NULL, NULL, NULL, NULL, '1'),
 ('P-2', 'James PJ', 'Cavity', 'APR/14', '2019-04-25', '11:30:00', '2019-04-04', NULL, NULL, NULL, '1'),
('P-1', 'Brian Cowel', 'Toothache', 'APR/13', '2019-04-24', '10:45:00', NULL, NULL, NULL, NULL, '1'),
 ('P-3', 'Patric Kennedy', 'Mouth Sores', 'APR/12', '2019-04-24', '10:00:00', '2019-03-15', NULL, NULL, NULL, '1'),
 ('P-1', 'Mary Joyce', 'Toothache', 'APR/15', '2019-04-25', '15:00:00', NULL, NULL, NULL, NULL, '1');
-- -------------------------------------------------------------------------------------------------------------------------------------------------
-- Inserting into appointments
--
-- -------------------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO `appointment` (`appNumber`, `patientName`, `problemName`, `appDate`, `appTime`, `staff_ID`, `dentist_ID`, `status`) VALUES ('MAR/12', 'Patric Kennedy', 'Toothache', '2019-03-15', '10:30:00', '1', '1', 'Completed'), 
('APR/10', 'James PJ', 'Toothache', '2019-04-04', '15:00:00', '1', '1', 'Completed'),
 ('APR/11', 'Anna Pitt', 'Toothache', '2019-04-24', '09:00:00', '1', '1', 'Confirmed'),
('APR/12', 'Patric Kennedy', 'Mouth Sores', '2019-04-24', '10:00:00', '1', '1', 'Cancelled'),
('APR/13', 'Brian Cowel', 'Toothache', '2019-04-24', '10:45:00', '1', '1', 'Confirmed'),
('APR/14', 'James PJ', 'Cavity', '2019-04-25', '11:30:00', '1', '1', 'Confirmed'),
('APR/15', 'Mary Joyce', 'Toothache', '2019-04-25', '15:00:00', '1', '1', 'Confirmed');
-- --------------------------------------------------------------------------------------------------------------------------------------------------

-- Inserting into visitCard
--
-- --------------------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO `visitcard` (`patientName`, `appNumber`, `problemName`, `appDate`, `appTime`, `medication`, `prescription`, `spName`, `work_No`) VALUES ('Patric Kennedy', 'MAR/12', 'Toothache', '2019-03-15', '10:30:00', NULL, 'Panadol', NULL, '1001'),
('James PJ', 'APR/10', 'Toothache', '2019-04-04', '15:00:00', 'Panadol', 'amoxicillin', NULL, '1010'),
('Anna Pitt', 'APR/11', 'Toothache', '2019-04-24', '09:00:00', NULL, NULL, NULL, NULL),
('Brian Cowel', 'APR/13', 'Toothache', '2019-04-24', '10:45:00', NULL, NULL, NULL, NULL),
('James PJ', 'APR/14', 'Cavity', '2019-04-25', '11:30:00', NULL, NULL, NULL, NULL),
 ('Mary Joyce', 'APR/15', 'Toothache', '2019-04-25', '15:00:00', NULL, NULL, NULL, NULL);
-- --------------------------------------------------------------------------------------------------------------------------------------------------
-- Inserting into work
--
-- --------------------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO `work` (`work_No`, `process`, `notes`, `status`, `treat_Number`) VALUES ('1001', 'X-Ray', 'Severe decay found/immediate extraction of lower third molar', 'Completed', 'T/55'),('1001', 'Routine Extraction', 'Follow Medication/Take rest', 'Completed', 'T/55'),
('1010', 'X-Ray', 'Cavities Found/Need fillings', 'Completed', 'T/63'),('1010', 'Temp Fillings', 'Temporary Fillings done/Follow Medication&Prescription', 'Follow up in Three weeks', 'T/63');

-- --------------------------------------------------------------------------------------------------------------------------------------------------
-- Inserting into treatment
--
-- --------------------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO `treatment` (`treat_Number`, `patientName`, `problemName`, `treat_Date`, `treat_Time`, `dentist_ID`) VALUES ('T/55', 'Patric Kennedy', 'Toothache', '2019-03-15', '10:30:00', '1'),('T/63', 'James PJ', 'Toothache', '2019-04-04', '15:15:00', '1');
-- --------------------------------------------------------------------------------------------------------------------------------------------------
-- Inserting into feeGuide
--
-- --------------------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO `feeguide` (`refNumber`, `process`, `amount`, `dentist_ID`, `staff_ID`) VALUES ('P-11', 'Examination with PRSI', '0.00', '1', '1'),
('P-12', 'Examination', '40.00', '1', '1'),('P-13', 'Issue of Prescription', '25.00', '1', '1'),('P-14', 'X-Ray', '50.00', '1', '1'),('P-15', 'Routine Extraction', '100.00', '1', '1'),('P-16', 'Surgical Extraction', '200.00', '1', '1'),('P-17', 'Temp Fillings', '100.00', '1', '1'),
('P-18', 'Perm Fillings', '150.00', '1', '1'), ('P-19', 'Whitening', '100.00', '1', '1'),('P-20', 'Scale&Polish', '90.00', '1', '1'),
('P-21', 'Scale&Polish with PRSI', '25.00', '1', '1'),('P-22', 'Late Cancellation', '10.00', '1', '1');
-- --------------------------------------------------------------------------------------------------------------------------------------------------
-- Inserting into bill
--
-- --------------------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO `bill` (`billNumber`, `refNumber`, `patientName`, `billDate`, `dueDate`, `process`, `amount`, `billOverdue`, `total`, `totalPayable`, `treat_Number`) VALUES ('B-110', 'P-14', 'Patric Kennedy', '2019-03-19', '2019-04-19', 'X-Ray', '50.00', '0.00', '50.00', '50.00', 'T/55'),
('B-110', 'P-15', 'Patric Kennedy', '2019-03-19', '2019-04-19', 'Routine Extraction', '100.00', '0.00', '100.00', '100.00', 'T/55'),
('B-117', 'P-14', 'James PJ', '2019-04-09', '2019-05-09', 'X-Ray', '50.00', '0.00', '50.00', '50.00', 'T/63'),
('B-117', 'P-17', 'James PJ', '2019-04-09', '2019-05-09', 'Temp Fillings', '100.00', '0.00', '100.00', '100.00', 'T/63');
-- --------------------------------------------------------------------------------------------------------------------------------------------------
-- Inserting into payments
--
-- --------------------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO `payment` (`billNumber`, `refNumber`, `patient_ID`, `pay_Date`, `modeOfPay`, `totalPaid`) VALUES ('B-110', 'P-15', '101', '2019-04-10', 'Cash', '100.00');
-- --------------------------------------------------------------------------------------------------------------------------------------------------

-- Inserting into specialist
--
-- --------------------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO `specialist` (`spID`, `spName`, `spTittle`, `spAddress`, `spPhone`, `spEmail`) VALUES ('12', 'Dr Catherine Connolly', 'Orthodontist', '20-21 Main Street', '021754123', 'cat_connolly@corkdental.ie'),
('15', 'Dr. Allen Murphy', 'Endodontist', '5 Middle Street', '021554433', 'allenmurhy@murphys.ie');
-- --------------------------------------------------------------------------------------------------------------------------------------------------














