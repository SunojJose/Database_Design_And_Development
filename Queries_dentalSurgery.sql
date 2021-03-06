-- Other Queries by Sunoj Jose
--
-- Updating table patient 
--
-- -----------------------------------------------------------------------------------------------------------------------------------------------
UPDATE `patient` SET `billOverdue` = '100.00' WHERE `patient`.`patient_ID` = 102;
-- -----------------------------------------------------------------------------------------------------------------------------------------------
UPDATE `patient` SET `med_CardNo` = NULL WHERE `patient`.`patient_ID` = 101;
-- -----------------------------------------------------------------------------------------------------------------------------------------------

-- Updating table dentalproblem
--
-- -----------------------------------------------------------------------------------------------------------------------------------------------
UPDATE `dentalproblem` SET `allergy` = 'None' WHERE `dentalproblem`.`prob_ID` = 'P-1' AND `dentalproblem`.`appNumber` = 'APR/10';
-- -----------------------------------------------------------------------------------------------------------------------------------------------

-- Inserting a new bill
--
-- -----------------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO `bill` (`billNumber`, `refNumber`, `patientName`, `billDate`, `dueDate`, `process`, `amount`, `billOverdue`, `total`, `totalPayable`, `treat_Number`) VALUES ('B-119', 'P-22', 'Patric Kennedy', '2019-04-30', '2019-05-30', 'Late Cancellation', '10.00', '50.00', '60.00', '60.00', 'NULL');
-- -----------------------------------------------------------------------------------------------------------------------------------------------

-- Information of Appintments,Patients,Dental Problem 
--
-- -----------------------------------------------------------------------------------------------------------------------------------------------
SELECT `appNumber`, `patientName`, `problemName` FROM `appointment`;
-- -----------------------------------------------------------------------------------------------------------------------------------------------
-- Information of Cancelled Appointments
--
-- -----------------------------------------------------------------------------------------------------------------------------------------------
SELECT patientName, appDate FROM `appointment` WHERE status = "Cancelled";
-- -----------------------------------------------------------------------------------------------------------------------------------------------

-- Sorting bill in Ascending order of billoverdue
--
-- ------------------------------------------------------------------------------------------------------------------------------------------------
SELECT * FROM `bill` ORDER BY `bill`.`billOverdue` ASC;
-- ------------------------------------------------------------------------------------------------------------------------------------------------

-- Dleting a paid bill from "bill"
--
-- ------------------------------------------------------------------------------------------------------------------------------------------------
DELETE FROM `bill` WHERE `bill`.`billNumber` = 'B-110' AND `bill`.`refNumber` = 'P-15';
-- ------------------------------------------------------------------------------------------------------------------------------------------------

-- Information of patents having a prescription
--
-- -------------------------------------------------------------------------------------------------------------------------------------------------
SELECT prob_ID, patientName FROM `dentalproblem` WHERE prescription IS NOT NULL;
-- -------------------------------------------------------------------------------------------------------------------------------------------------
-- Next of Kin Phone number of Mary Joyce
--
-- -------------------------------------------------------------------------------------------------------------------------------------------------
SELECT n_o_k_Phone FROM patient WHERE patient_ID=105;
-- -------------------------------------------------------------------------------------------------------------------------------------------------
-- Name of patients who have prescription
--
-- -------------------------------------------------------------------------------------------------------------------------------------------------
SELECT prob_ID,appNumber,patientName FROM `dentalproblem` WHERE prescription IS NOT NULL;
-- -- ----------------------------------------------------------------------------------------------------------------------------------------------------
-- Creating a view which contain details of patients have overdue of bill
--
-- ------------------------------------------------------------------------------------------------------------------------------------------------
CREATE VIEW overdue AS SELECT patient_ID, patientName, billOverdue FROM patient WHERE billOverdue>0;
--
-- -------------------------------------------------------------------------------------------------------------------------------------------------
-- Information of patients already took a treatment
--
-- -------------------------------------------------------------------------------------------------------------------------------------------------
SELECT patientName,appNumber,work_No FROM visitcard WHERE work_No IS NOT NULL;
--
-- -------------------------------------------------------------------------------------------------------------------------------------------------
-- Adding FOREIGN KEY CONSTRAINT to table work
--
-- -------------------------------------------------------------------------------------------------------------------------------------------------
ALTER TABLE work ADD FOREIGN KEY (treat_Number) REFERENCES treatment (treat_Number);
-- -------------------------------------------------------------------------------------------------------------------------------------------------
