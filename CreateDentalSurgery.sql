--Details of dentalSurgery Database by Sunoj Jose
--
--
-- -----------------------------------------------------------------------------------------------------------------------------------------------
--Creating table patient
--
-- -----------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE patient (patient_ID int(10) NOT NULL, patientName varchar(50) NOT NULL, dob date NOT NULL, gender char(6) NOT NULL, ppsNo varchar(15) NOT NULL, med_CardNo varchar (10) DEFAULT NULL, addressLine1 varchar(50) NOT NULL, addressLine2 varchar(50) DEFAULT NULL, eircode varchar(10) NOT NULL, phone varchar(15) NOT NULL, n_o_k_Phone varchar(15) NOT NULL, billOverdue decimal(10,2) NOT NULL, PRIMARY KEY ( patient_ID) );

--Creating table dentalProblem
--
-- ------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE dentalProblem ( prob_ID varchar(10) NOT NULL , patientName varchar(50) NOT NULL, problemName varchar(50) NOT NULL, appNumber varchar(10) NOT NULL, appDate date NOT NULL, appTime time NOT NULL, dateLastVisit date DEFAULT NULL, allergy varchar(50) DEFAULT NULL, medication varchar(50) DEFAULT NULL, prescription varchar(50) DEFAULT NULL, dentist_ID int(10) NOT NULL, CONSTRAINT PK_dentalProblem PRIMARY KEY (prob_ID,appNumber) );


--Creating Table appointment
--
-- ------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE appointment (appNumber varchar(10) NOT NULL, patientName varchar(50) NOT NULL, problemName varchar(50) NOT NULL, appDate date NOT NULL, appTime time NOT NULL, status varchar(50) NOT NULL, staff_ID int(10) NOT NULL, dentist_ID int(10) NOT NULL, PRIMARY KEY (appNumber) );

--Creating Table visitCard
--
-- ------------------------------------------------------------------------------------------------------------------------------------------------CREATE TABLE visitCard ( patientName varchar(50) NOT NULL, appNumber varchar(10) NOT NULL, problemName varchar(50) NOT NULL, appDate date NOT NULL, appTime time NOT NULL, medication varchar(50) DEFAULT NULL, prescription varchar(50) DEFAULT NULL, spName varchar(50) DEFAULT NULL, work_No int(10) DEFAULT NULL, CONSTRAINT PK_visitCard PRIMARY KEY ( patientName, appNumber) );

-- Creating Table staff
--
-- -----------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE staff (staff_ID int(10) NOT NULL, staffName varchar(50) NOT NULL, staffTitle varchar(50) NOT NULL, address varchar(50) NOT NULL, phone varchar(15) NOT NULL, email varchar(50) NOT NULL, PRIMARY KEY ( staff_ID));

-- Creating Table dentist
--
-- -----------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE dentist (dentist_ID int(10) NOT NULL, dName varchar (50) NOT NULL, dAddress varchar(50) NOT NULL, dphone varchar(15) NOT NULL, d_email varchar(50) NOt NULL, PRIMARY KEY ( dentist_ID));

-- Creating Table specialist
--
-- --------------------------------------------------------------------------------------------------------------------------------------------------CREATE TABLE specialist ( spID int(10) NOT NULL, spName varchar(50) NOT NULL, spTittle varchar(50) NOT NULL, spAddress varchar(50) NOT NULL, spPhone varchar(50) NOT NULL, spEmail varchar(50) NOT NULL, PRIMARY KEY ( spID));

-- Creating Table treatment
--
-- -----------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE treatment (treat_Number varchar(10) NOT NULL, patientName varchar(50) NOT NULL, problemName varchar(50) NOT NULL, treat_Date date NOT NULL, treat_Time time NOT NULL, dentist_ID int(10) NOT NULL, PRIMARY KEY ( treat_Number));

-- Creating Table work
--
-- -----------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE work (work_No int(10) NOT NULL, process varchar(50) NOT NULL, notes varchar(300) NOT NULL, status varchar(50) NOT NULL,treat_Number varchar(50) NOT NULL,CONSTRAINT PK_work PRIMARY KEY (work_No,process));

-- Creating Table feeGuide
--
-- ------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE feeGuide ( refNumber varchar(10) NOT NULL, process varchar(50) NOT NULL, amount decimal(10,2) NOT NULL, dentist_ID int(10) NOT NULL, staff_ID int(10) NOt NULL, PRIMARY KEY(refNumber));

-- Creating Table bill
--
-- -------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE bill ( billNumber varchar(10) NOT NULL, refNumber varchar(10) NOT NULL, patientName varchar(50) NOT NULL, billDate date NOT NULL, dueDate date NOT NULL, process varchar(50) NOT NULL, amount decimal(10,2) NOT NULL, billOverdue decimal(10,2) NOT NULL, total decimal(10,2) NOT NULL, totalPayable decimal(10,2) NOT NULL, treat_Number varchar(10), CONSTRAINT PK_bill PRIMARY KEY ( billNumber,refNumber));

-- Creating Table payments
--
-- ------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE payment ( billNumber varchar(10) NOT NULL,refNumber varchar(10) NOT NULL, patient_ID int(10) NOT NULL, pay_Date date NOT NULL, modeOfPay varchar(15) NOT NULL, totalPaid decimal(10,2) NOT NULL, CONSTRAINT PK_payment PRIMARY KEY ( billNumber, refNumber));

-- ------------------------------------------------------------------------------------------------------------------------------------------------

-- Adding FOREIGN KEY CONSTRAINTS
--
-- -------------------------------------------------------------------------------------------------------------------------------------------------
ALTER TABLE work ADD FOREIGN KEY (treat_Number) REFERENCES treatment (treat_Number);
-- -------------------------------------------------------------------------------------------------------------------------------------------------
ALTER TABLE payment ADD FOREIGN KEY (patient_ID) REFERENCES patient (patient_ID);
-- -------------------------------------------------------------------------------------------------------------------------------------------------
ALTER TABLE dentalproblem ADD FOREIGN KEY (dentist_ID) REFERENCES dentist (dentist_ID;
-- -------------------------------------------------------------------------------------------------------------------------------------------------
ALTER TABLE visitcard ADD FOREIGN KEY (work_No) REFERENCES work(work_No);
-- -------------------------------------------------------------------------------------------------------------------------------------------------
ALTER TABLE feeguide ADD FOREIGN KEY (dentist_ID) REFERENCES dentist(dentist_ID);
ALTER TABLE feeguide ADD FOREIGN KEY (staff_ID) REFERENCES staff(staff_ID);
-- --------------------------------------------------------------------------------------------------------------------------------------------------
ALTER TABLE appointment ADD FOREIGN KEY (staff_ID) REFERENCES staff(staff_ID);
ALTER TABLE appointment ADD FOREIGN KEY (dentist_ID) REFERENCES dentist(dentist_ID;
-- --------------------------------------------------------------------------------------------------------------------------------------------------
ALTER TABLE treatment ADD FOREIGN KEY (dentist_ID) REFERENCES dentist(dentist_ID);
-- --------------------------------------------------------------------------------------------------------------------------------------------------
