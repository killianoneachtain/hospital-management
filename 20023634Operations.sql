-- USE hospital;

-- -----------------------------------------------------
-- Frequently Used Queries
-- -----------------------------------------------------

-- -----------------------------------------------------------------------------------------------------------------------------------------------
-- Total Capacity of Hospital

-- SELECT SUM(wardLimit) FROM WardCapacity;

-- -----------------------------------------------------------------------------------------------------------------------------------------------
-- Total Current Occupancy

-- SELECT SUM(count) FROM WardCapacity;

-- -----------------------------------------------------------------------------------------------------------------------------------------------
-- Number of Available Beds in Wards

-- SELECT count(bedNumber) FROM Bed WHERE patientID IS NULL AND wardID IS NOT NULL;

-- -----------------------------------------------------------------------------------------------------------------------------------------------
-- Total Number of Doctors

-- SELECT count(PPS) FROM Doctor;

-- -----------------------------------------------------------------------------------------------------------------------------------------------
-- Total Number of Patients

-- SELECT count(patientID) FROM Patient;

-- -----------------------------------------------------------------------------------------------------------------------------------------------
-- Total Number of Current In-Patients

-- SELECT count(patientID) FROM Admissions WHERE dischargeDate IS NULL;

-- -----------------------------------------------------------------------------------------------------------------------------------------------
-- Ward Limits and Current Occupancy

-- Select Ward.*,wardLimit,count from Ward JOIN WardCapacity
-- ON Ward.wardID = WardCapacity.wardID;

-- -----------------------------------------------------------------------------------------------------------------------------------------------
-- Log of Previous Visits

-- SELECT date, time, Visit.visitId,Patient.patientID, concat(patient.fName,' ',patient.lName) AS 'Patient', 
--        DOB, sex,concat(Doctor.fName,' ',Doctor.lName) AS 'Doctor' , specialisation, Drug.*, dosageDetails
-- FROM Visit JOIN Doctor ON Visit.PPS = Doctor.PPS
-- JOIN Patient ON Visit.patientID = Patient.patientID
-- LEFT JOIN Prescription ON Visit.visitID = Prescription.visitID
-- LEFT JOIN Drug ON Prescription.drugID = Drug.drugID
-- WHERE date < now()
-- ORDER BY date desc,time;

-- -----------------------------------------------------------------------------------------------------------------------------------------------
-- Quick Count of Patients In each ward

-- SELECT Ward.wardID, wardName, count(Distinct(Patient.patientID)) AS 'Patient Count'
-- FROM Bed JOIN Patient ON Bed.patientID = Patient.patientID
-- JOIN Ward ON Bed.wardID = Ward.wardID
-- GROUP BY Ward.wardID;


-- -----------------------------------------------------------------------------------------------------------------------------------------------
-- Current Patient Details of each Ward 

-- SELECT Bed.bedNumber,Bed.bedType, bedDescription, Ward.wardID,wardName, wardType, Patient.patientID, concat(fName,' ',lName) AS 'Patient Name',
-- DOB, sex, arriveDate FROM Bed JOIN Patient
-- ON Bed.patientID = Patient.patientID
-- JOIN Ward ON Bed.wardID = Ward.wardID
-- JOIN Admissions ON Bed.patientID = Admissions.patientID
-- JOIN BedType ON Bed.bedType = BedType.bedType
-- ORDER BY wardID, bedNumber;

-- -----------------------------------------------------------------------------------------------------------------------------------------------
-- Current In-Patient Prescription Details

-- SELECT * FROM currentBedPatientPrescriptions;

-- -----------------------------------------------------------------------------------------------------------------------------------------------
-- Log of all Admissions
-- SELECT Admissions.*, Patient.* , arriveDate, dischargeDate 
-- FROM Admissions JOIN Patient
-- ON Admissions.patientID = Patient.patientID
-- ORDER BY Patient.patientID;

-- -----------------------------------------------------------------------------------------------------------------------------------------------
-- Patients in Maternity Ward

-- SELECT Ward.wardID, wardType,Bed.bedNumber,Admissions.admissionNumber,Patient.* FROM Ward
-- JOIN Bed ON Ward.wardID = Bed.wardID
-- JOIN Patient on Bed.patientID = Patient.patientID
-- JOIN Admissions ON Admissions.PatientID = Patient.patientID
-- WHERE Ward.wardID = 'C02002'
-- ORDER BY admissionNumber;

-- -----------------------------------------------------------------------------------------------------------------------------------------------
-- Future Visits

-- SELECT * FROM futureVisitAppointments;

-- -----------------------------------------------------------------------------------------------------------------------------------------------
-- Patient Visits and Prescriptions

-- SELECT * FROM allPreviousVisits;

-- -----------------------------------------------------------------------------------------------------------------------------------------------
-- Number of Beds Available by Ward

-- SELECT * FROM availableBeds;

-- -----------------------------------------------------------------------------------------------------------------------------------------------

-- Current In Patient Prescriptions
-- SELECT * FROM currentBedPatientPrescriptions;

-- -----------------------------------------------------------------------------------------------------------------------------------------------
-- Average Time Spent in Hospital

-- SELECT AVG(count) FROM time_in_hospital WHERE count > 0;
 
-- -----------------------------------------------------------------------------------------------------------------------------------------------
-- Return the type and price difference of all beds whose price is greater than the average bed price.

-- SELECT bedDescription, bedPrice-(SELECT ROUND(avg(bedPrice)) FROM BedType) AS "Price Difference"
-- FROM BedType
-- WHERE bedPrice-(SELECT ROUND(avg(bedPrice)) FROM BedType) > 0
-- ORDER BY bedPrice desc;

-- -----------------------------------------------------------------------------------------------------------------------------------------------
-- Return the patients who have never been an 'IN-Patient' OR had a visit

-- SELECT patientID FROM Patient
-- WHERE patientID NOT IN
-- 	(SELECT patientID FROM Visit)
--    AND patientID NOT IN
--    (SELECT patientID FROM Admissions);

-- ------------------------------------------------------------------------------------------------------------------------------------------------
-- Discharge Patient From Hospital

-- UPDATE Admissions
-- SET
-- 	dischargeDate = '2019/11/20'
-- WHERE 
-- 	patientID = '571';

-- -----------------------------------------------------------------------------------------------------------------------------------------------
-- Return Name of 'JOHN DOE' for patients with Null values for fName,lName

-- SELECT patientID,IF (fName IS NULL, DEFAULT (fName),fName) AS 'First Name',
--  IF (lName IS NULL, DEFAULT (lName),lName) AS 'Last Name' FROM Patient;

-- -----------------------------------------------------
-- Create / Remove Index Statements
-- -----------------------------------------------------

-- DOB in patient
-- CREATE INDEX patientDOB ON Patient(DOB);
-- ALTER TABLE Patient DROP INDEX patientDOB;

-- sex in patient
-- CREATE INDEX patientGender ON Patient(sex);
-- ALTER TABLE Patient DROP INDEX patientGender;

-- wardName in ward
-- CREATE INDEX nameOfWard ON Ward(wardName);
-- ALTER TABLE Ward DROP INDEX nameOfWard;

-- arriveDate in admissions
-- CREATE INDEX patientArrive ON Admissions(arriveDate);
-- ALTER TABLE Admissions DROP INDEX patientArrive;

-- dischargeDate in admissions
-- CREATE INDEX patientDepart ON Admissions(dischargeDate);
-- ALTER TABLE Admissions DROP INDEX patientDepart;

-- drugName in drug
-- CREATE INDEX nameOfDrug ON Drug(drugName);
-- ALTER TABLE Drug DROP INDEX nameOfDrug;

-- date in Visit table
-- CREATE INDEX visitDate ON Visit(date);
-- ALTER TABLE Visit DROP INDEX visitDate;

-- specialisation in Doctor table
-- CREATE INDEX doctorSpecialisation ON Doctor(specialisation);
-- ALTER TABLE Doctor DROP INDEX doctorSpecialisation;


-- -----------------------------------------------------
-- Create Trigger Statements
-- -----------------------------------------------------


-- -------------------------------------------------------------------
-- Create Trigger childrens_ward_admission
-- Does not allow patients born before '2003-01-01' to be admitted
-- to a Children's Ward.
-- --------------------------------------------------------------------

-- DELIMITER $$
-- 	CREATE TRIGGER childrens_ward_admission
-- 		BEFORE INSERT ON Bed
--         FOR EACH ROW
-- 	BEGIN
-- 		DECLARE patient_DOB DATE;
-- 		DECLARE _message VARCHAR(100);
--         
--         SELECT DOB FROM Patient WHERE Patient.patientID = NEW.patientID INTO patient_DOB;
--                             
-- 		SELECT concat('Patient : ',NEW.patientID,' is of too old! Born After 2013-01-01. NOT ADMITTED TO CHILDRENS WARD : ',NEW.wardID) INTO _message;        
--         
-- 		IF ((New.wardID = 'B01013' OR New.wardID = 'B02015') AND (patient_DOB < '2003-01-01'))
--           THEN 
-- 			SIGNAL SQLSTATE '45003'
-- 				SET MESSAGE_TEXT = _message; 
-- 	    END IF;
-- 	END $$
-- DELIMITER ;

-- ---------------------------------------------------------------------
-- Create Trigger maternity_admission
-- This trigger checks, for insert into the Maternity Ward : C02002,
-- the patient gender is 'F'(Female), and will display
-- a error if the patient's sex is 'M'(Male).
-- ---------------------------------------------------------------------
    
-- DELIMITER $$
-- 	CREATE TRIGGER maternity_admission
-- 		BEFORE INSERT ON Bed
--         FOR EACH ROW
-- 	BEGIN
-- 		DECLARE S CHAR(1);
--         DECLARE _message VARCHAR(100);
--         
--         SELECT sex INTO S
--             FROM Patient
--             WHERE Patient.patientID = NEW.patientID;	
--             
-- 		SELECT concat('Patient : ',NEW.patientID,' is of Gender : ',S, '. NOT ADMITTED TO MATERNITY WARD : ',NEW.wardID) INTO _message;        
--         
-- 		IF (New.wardID = 'C02002' AND S = 'M')
--           THEN 
-- 			SIGNAL SQLSTATE '45001'
-- 				SET MESSAGE_TEXT = _message; 
-- 	    END IF;
-- 	END $$
-- DELIMITER ;


-- ------------------------------------------------------------
-- Create Trigger patient_admission
-- This trigger checks the ward isn't full, and will display
-- a error of ward number and patientID.
-- ----------------------------------------------------------

-- DELIMITER $$
-- 	CREATE TRIGGER patient_admission
-- 		BEFORE INSERT ON Bed        
--         FOR EACH ROW        
-- 	BEGIN        
-- 		DECLARE C INT;
        -- Variable to store current capacity of Ward
      
--         DECLARE L INT;
        -- Variable to store limit of number of beds in Ward
        
--         DECLARE Discharge_Date DATE ;
        -- Variable to store discharge date, if available.
        
--         DECLARE Arrive_Date DATE;
        -- Variable to store arrive date.
        
--         DECLARE admission_Number INT;
        -- Variable to store admission Number
        
--         DECLARE bed_Number INT;
        
--         DECLARE status char(1);       
                
--         DECLARE _message VARCHAR(50);
--         DECLARE _not_found_message VARCHAR(100);
        
--         SELECT admissionNumber FROM Admissions
--         WHERE Admissions.patientID = NEW.patientID
--         ORDER BY admissionNumber DESC LIMIT 1 INTO admission_Number;
        
--         SET NEW.admissionNumber = admission_Number;
        
--         SELECT dischargeDate INTO Discharge_Date 
--         FROM Admissions
--         WHERE admissionNumber = NEW.admissionNumber;
        
--         SELECT arriveDate INTO Arrive_Date 
--         FROM Admissions
--         WHERE admissionNumber = NEW.admissionNumber;        
        
--         SELECT available INTO status
--         FROM Bed
--         WHERE bedNumber = New.bedNumber; 
        
--         SELECT New.BedNumber INTO bed_Number;
                        
--         SELECT concat('Ward is Full! Ward Number/PatientID:',NEW.wardID,'/',NEW.patientID) INTO _message;
        
--         IF (NEW.patientID NOT IN (SELECT patientID FROM Patient)) THEN
--            SELECT concat('Patient ID not Found : ',NEW.patientID) INTO _not_found_message;
--            SIGNAL SQLSTATE '45010'
-- 		      SET MESSAGE_TEXT = _not_found_message; 
-- 		END IF;
        
--         IF (NEW.bedType NOT IN (SELECT bedType FROM BedType)) THEN
--            SELECT concat('Bed Type not Found : ',NEW.bedType) INTO _not_found_message;
--            SIGNAL SQLSTATE '45010'
-- 				SET MESSAGE_TEXT = _not_found_message; 
-- 		END IF;
        
--         IF (NEW.wardID NOT IN (SELECT wardID FROM Ward)) THEN
--            SELECT concat('Ward ID not Found : ',NEW.wardID) INTO _not_found_message;
--            SIGNAL SQLSTATE '45010'
-- 				SET MESSAGE_TEXT = _not_found_message; 
-- 		END IF;
                        
--         IF (New.patientID IS NOT NULL AND Discharge_Date IS NULL) THEN
		
-- 			UPDATE WardCapacity
-- 			SET count = count + 1       
-- 			WHERE wardID = NEW.wardID;
        
-- 			SELECT count INTO C
-- 			FROM WardCapacity
-- 			WHERE wardID = NEW.wardID;
        
-- 			SELECT wardLimit INTO L
-- 			FROM WardCapacity
-- 			WHERE wardID = NEW.wardID;
    
-- 			SET NEW.available = 'N';
            
--             IF(C > L) THEN
-- 				SIGNAL SQLSTATE '45000'
-- 				SET MESSAGE_TEXT = _message;
-- 			END IF;
--         END IF;        
             
--         IF(Discharge_Date IS NOT NULL) THEN           
--            SET NEW.patientID = NULL;
--            SET NEW.admissionNumber = NULL;          
-- 		   END IF;
           
-- 		UPDATE Admissions
-- 			SET bedNumber = NEW.bedNumber
-- 			WHERE Admissions.admissionNumber = NEW.admissionNumber;
        
-- 	   END $$    
--     DELIMITER ;
    
-- ---------------------------------------------------------------------
-- Create trigger hospital_time
-- This calculates time spent in hospital for patients and inserts
-- into table.
-- ---------------------------------------------------------------------

-- DELIMITER $$
-- CREATE TRIGGER hospital_time
--   AFTER INSERT ON Admissions
--   FOR EACH ROW
-- BEGIN
--   IF (New.dischargeDate IS NOT NULL) THEN	  
-- 	  INSERT INTO time_in_hospital VALUES (NEW.patientID, (DATEDIFF (New.dischargeDate, New.arriveDate)));   
--   END IF;
-- END $$
-- DELIMITER ;



    
-- -----------------------------------------------------------------------------------------
-- Create Trigger discharge_patient
-- This trigger will add discharge date to patient record, reduce count 
-- in the WardCapacity table and remove the patientID from the Bed table.
-- 
-- Admissions(admissionNumber,patientID,arriveDate,dischargeDate,bedNumber)
-- -----------------------------------------------------------------------------------------

-- DELIMITER $$
-- 	CREATE TRIGGER discharge_patient
-- 		BEFORE UPDATE ON Admissions
--         FOR EACH ROW
-- 	BEGIN
        
-- 		DECLARE ward VARCHAR(6);
--      DECLARE bed_Number INT;
--      DECLARE _message VARCHAR(120);
--      DECLARE _not_found_message VARCHAR(100);
        
--      IF (NEW.patientID NOT IN (SELECT patientID FROM Patient)) THEN
--         SELECT concat('Patient ID not Found : ',NEW.patientID) INTO _not_found_message;
--         SIGNAL SQLSTATE '45000'
-- 		      SET MESSAGE_TEXT = _not_found_message; 
-- 		END IF;
        

        
--         IF !(NEW.dischargeDate <=> OLD.dischargeDate) THEN
        
--         SELECT concat('Patient discharge date is already set. ',OLD.patientID,' Discharged on : ',OLD.dischargeDate) INTO _message;
		
--         IF !(NEW.dischargeDate <=> OLD.dischargeDate) THEN	        
-- 			SELECT wardID FROM Bed WHERE Bed.patientID = NEW.patientID INTO ward;
-- 			UPDATE WardCapacity
-- 			SET count = count - 1
-- 			WHERE wardID = ward;     
-- 		   ELSE
-- 			SIGNAL SQLSTATE '45000'
-- 				SET MESSAGE_TEXT = _message;        
-- 		   END IF;         
        
--         SELECT BedNumber FROM Bed
--         WHERE patientID = NEW.patientID
--         INTO bed_Number;
        
--         SET NEW.bedNumber = bed_Number;
        
        -- Update Bed Table to clear all patient details from the associated bed.
--         UPDATE Bed
--         SET available = 'Y'
--         WHERE Bed.patientID = NEW.patientID;
        
--         UPDATE Bed
--         SET admissionNumber = NULL
--         WHERE Bed.patientID = NEW.patientID;
        
--         UPDATE Bed
--         SET patientID = NULL
--         WHERE Bed.patientID = NEW.patientID;
        
--         INSERT INTO time_in_hospital VALUES (NEW.patientID, (DATEDIFF (New.dischargeDate, New.arriveDate))); 
        
--         END IF;
-- 	END $$
-- DELIMITER ;

-- ---------------------------------------------------------------------
-- Create Trigger prescribe_Prozac
-- This trigger will only allow Doctors of '%Psychiatr%' to prescribe
-- the drug Prozac. 

-- Prescription(visitID, drugID, dosageDetails)
-- ---------------------------------------------------------------------

-- DELIMITER $$
-- CREATE TRIGGER prescribe_Prozac
--   BEFORE INSERT ON Prescription
--   FOR EACH ROW
-- BEGIN
--   DECLARE _PPS VARCHAR(9);
--   DECLARE _specialisation CHAR(30);
--   DECLARE _message VARCHAR(150);
--   DECLARE _not_found_message VARCHAR(100);
        
--   IF (NEW.visitID NOT IN (SELECT visitID FROM Visit)) THEN
--      SELECT concat('Visit ID not Found : ',NEW.visitID) INTO _not_found_message;
--         SIGNAL SQLSTATE '45000'
-- 		      SET MESSAGE_TEXT = _not_found_message; 
--   END IF;
  
--   IF (NEW.drugID NOT IN (SELECT drugID FROM Drug)) THEN
--      SELECT concat('Drug ID not Found : ',NEW.DrugID) INTO _not_found_message;
--         SIGNAL SQLSTATE '45000'
-- 		      SET MESSAGE_TEXT = _not_found_message; 
--   END IF;
  
--   SELECT PPS FROM Visit WHERE visitID = NEW.visitID INTO _PPS;
  
--   SELECT specialisation FROM Doctor WHERE PPS = _PPS INTO _specialisation;
  
--   SELECT concat('Not a Psychiatrist! Prozac not permitted for prescription. VisitID: ',NEW.visitID,
--   '/ Doctor ',_PPS,' / Specialisation : ',_specialisation) INTO _message;
  
--   IF (NEW.drugID = '100001') THEN
	
--     IF (_specialisation NOT LIKE '%Psychiatr%') THEN
-- 		SIGNAL SQLSTATE '45000'
-- 				SET MESSAGE_TEXT = _message; 
-- 	END IF;
    
--   END IF;
-- END $$
-- DELIMITER ;
 
-- ---------------------------------------------------------------------
-- Create Trigger Gyno_Females
-- This trigger will only allow Doctors of 'Gynaecolgists' to visit
-- female patients. 
-- 
-- Visit(visitID,patientID,PPS,date,time)
-- ---------------------------------------------------------------------

-- DELIMITER $$
-- CREATE TRIGGER Gyno_Females
--   BEFORE INSERT ON Visit
--   FOR EACH ROW
-- BEGIN
--   DECLARE _specialisation CHAR(30);
--   DECLARE _sex CHAR(1);
--   DECLARE _message VARCHAR(150); 
--   DECLARE _not_found_message VARCHAR(100);
  
--   IF (NEW.patientID NOT IN (SELECT patientID FROM Patient)) THEN
--            SELECT concat('Patient ID not Found : ',NEW.patientID) INTO _not_found_message;
--            SIGNAL SQLSTATE '45000'
-- 		      SET MESSAGE_TEXT = _not_found_message; 
--   END IF;
  
--   IF (NEW.PPS NOT IN (SELECT PPS FROM Doctor)) THEN
--            SELECT concat('Doctor\'s PPS not Found : ',NEW.PPS) INTO _not_found_message;
--            SIGNAL SQLSTATE '45000'
-- 		      SET MESSAGE_TEXT = _not_found_message; 
--   END IF;
   
--   SELECT specialisation FROM Doctor WHERE PPS = NEW.PPS INTO _specialisation;
  
--   SELECT sex FROM Patient WHERE patientID = NEW.patientID INTO _sex;
  
--   SELECT concat('Gynaecologists cannot visit Males. PatientID: ',NEW.patientID,
--   '/ Doctor ',NEW.PPS,' / Specialisation : ',_specialisation) INTO _message;
  
--   IF (_specialisation LIKE '%Gynaecolog%' AND _sex LIKE 'M') THEN
-- 	SIGNAL SQLSTATE '45005'
-- 				SET MESSAGE_TEXT = _message; 
-- 	END IF;  

-- END $$
-- DELIMITER ;

-- ---------------------------------------------------------------------
-- Create Trigger Paediatrics
-- This trigger will only allow Doctors of 'Paediatry' to visit
-- patients from birth to age 18. 
-- ---------------------------------------------------------------------

-- (visitID,patientID,PPS)

-- DELIMITER $$
-- CREATE TRIGGER paediatrics
--   BEFORE INSERT ON Visit
--   FOR EACH ROW
-- BEGIN
--   DECLARE _specialisation CHAR(30);
--   DECLARE _age tinyint;
--   DECLARE _message VARCHAR(150); 
--   DECLARE _not_found_message VARCHAR(100);
   
--   IF (NEW.patientID NOT IN (SELECT patientID FROM Patient)) THEN
--            SELECT concat('Patient ID not Found : ',NEW.patientID) INTO _not_found_message;
--            SIGNAL SQLSTATE '45000'
-- 		      SET MESSAGE_TEXT = _not_found_message; 
--   END IF;
  
--   IF (NEW.PPS NOT IN (SELECT PPS FROM Doctor)) THEN
--            SELECT concat('Doctor\'s PPS not Found : ',NEW.PPS) INTO _not_found_message;
--            SIGNAL SQLSTATE '45000'
-- 		      SET MESSAGE_TEXT = _not_found_message; 
--   END IF;
  
--   SELECT specialisation FROM Doctor WHERE PPS = NEW.PPS INTO _specialisation;
  
--   SELECT YEAR(CURRENT_TIMESTAMP) - YEAR(DOB) - (RIGHT(CURRENT_TIMESTAMP, 5) < RIGHT(DOB, 5)) FROM Patient WHERE patientID = NEW.patientID INTO _age;
  
--   SELECT concat('Paediatricians only visit patients < 18. PatientID: ',NEW.patientID,
--   '/ Doctor ',NEW.PPS,' / Specialisation : ',_specialisation) INTO _message;
  
--   IF (_specialisation LIKE '%Paediatr%' AND _age > 18) THEN
-- 	SIGNAL SQLSTATE '45005'
-- 				SET MESSAGE_TEXT = _message; 
-- 	END IF;  

-- END $$
-- DELIMITER ;


-- -----------------------------------------------------
-- Create Views

-- SELECT * FROM allpreviousvisits;
-- SELECT * FROM availablebeds;
-- SELECT * FROM currentbedpatientprescriptions;
-- SELECT * FROM futurevisitappointments;
-- SELECT * FROM gatchbeddetails;

-- -----------------------------------------------------

-- CREATE OR REPLACE VIEW availableBeds AS
-- 	SELECT bedNumber,Bed.wardID AS 'Current Location',BedType.*
--     FROM Bed 
--     JOIN BedType ON BedType.bedType = Bed.bedType
--     WHERE patientID IS NULL
--     ORDER BY bedNumber;
    
-- CREATE OR REPLACE VIEW currentBedPatientPrescriptions AS
-- 	SELECT Ward.wardID, wardName,Admissions.bedNumber, bedDescription, Patient.patientID, concat(Patient.fName,' ',Patient.lName) AS 'Patient Name', arriveDate, 
-- 	concat(Doctor.fName,' ',Doctor.lName) AS 'Doctor', Visit.visitID, Visit.date AS 'Date of Visit', Visit.time AS 'Time of Visit',
-- 	drugName AS 'Prescription', dosageDetails AS 'Dosage'
-- 	FROM Bed JOIN BedType ON Bed.bedType = BedType.bedType
-- 	JOIN Patient ON Bed.patientID = Patient.patientID
--     JOIN Admissions ON Patient.patientID = Admissions.patientID
-- 	JOIN Ward ON Bed.wardID = Ward.wardID
-- 	JOIN Visit ON Patient.patientID = Visit.patientID
-- 	JOIN Doctor ON Visit.PPS = Doctor.PPS
-- 	JOIN Prescription ON Visit.visitID = Prescription.visitID
-- 	JOIN Drug ON Prescription.drugID = Drug.drugID
--     WHERE dischargeDate IS NULL
-- 	ORDER BY patientID, date, time;
    
-- CREATE OR REPLACE VIEW allPreviousVisits AS
-- 	SELECT date, time, Visit.visitId,Patient.patientID, concat(patient.fName,' ',patient.lName) AS 'Patient', 
--        DOB, sex,concat(Doctor.fName,' ',Doctor.lName) AS 'Doctor', specialisation, Drug.*, dosageDetails
-- 	FROM Visit JOIN Doctor ON Visit.PPS = Doctor.PPS
-- 	JOIN Patient ON Visit.patientID = Patient.patientID
-- 	LEFT JOIN Prescription ON Visit.visitID = Prescription.visitID
-- 	LEFT JOIN Drug ON Prescription.drugID = Drug.drugID
-- 	WHERE date < now()
-- 	ORDER BY date desc,time;
    
-- CREATE OR REPLACE VIEW futureVisitAppointments AS
-- 	SELECT date,time, visitId, Patient.patientID, concat(patient.fName,' ',patient.lName) AS 'Patient Name', DOB, sex,
-- 		   concat(Doctor.fName,' ',Doctor.lName) AS 'Doctor',specialisation FROM
-- 	visit join Doctor on Visit.PPS = Doctor.PPS
-- 	JOIN Patient on Visit.patientID = Patient.patientID
-- 	WHERE date > now()
-- 	ORDER BY date desc,time;
    
-- CREATE OR REPLACE VIEW gatchBedDetails AS
-- 	SELECT Bed.bedNumber, Ward.wardID, wardName, Bed.patientID, arriveDate
-- 	FROM Bed LEFT JOIN Ward ON Ward.wardID = Bed.wardID
-- 	LEFT JOIN Admissions ON Bed.patientID = Admissions.patientID
-- 	WHERE bedType =
-- 	  (SELECT bedType
-- 	   FROM BedType
-- 	   WHERE bedDescription = 'Gatch Bed');	


-- -----------------------------------------------------
-- Create Users and Privileges
-- -----------------------------------------------------

-- DROP USER IF EXISTS DatabaseAdministrator;

-- CREATE USER DatabaseAdministrator IDENTIFIED BY 'DBAdmin';
-- GRANT ALL ON hospital.* TO DatabaseAdministrator WITH GRANT OPTION;

-- DROP USER IF EXISTS Admissions;

-- CREATE USER Admissions IDENTIFIED BY 'Admissions';
-- GRANT ALL ON Admissions TO Admissions;
-- REVOKE DELETE ON Admissions FROM Admissions;

-- GRANT ALL ON Bed TO Admissions;
-- REVOKE DELETE ON Bed FROM Admissions;

-- GRANT ALL ON Patient TO Admissions;
-- REVOKE DELETE ON Patient FROM Admissions;

-- GRANT ALL ON Ward TO Admissions;
-- GRANT ALL ON WardCapacity TO Admissions;

-- For User only with access to discharge patients possibility
-- GRANT UPDATE(dischargeDate),SELECT ON Admissions TO Admissions;

-- DROP USER IF EXISTS Bed_Management;

-- CREATE USER Bed_Management IDENTIFIED BY 'bedManagement';
-- GRANT ALL ON BedType to Bed_Management;
-- GRANT ALL ON WardCapacity TO Bed_Management;
-- GRANT INSERT(bedNumber),UPDATE(bedNumber,wardID),SELECT,DELETE ON Bed TO Bed_Management;


-- DROP USER IF EXISTS Doctor;

-- CREATE USER Doctor IDENTIFIED BY 'Doctor';
-- GRANT INSERT,UPDATE,SELECT ON Visit TO Doctor;
-- GRANT INSERT,SELECT,UPDATE(drugID) ON Prescription TO Doctor;
-- GRANT ALL ON Prescription TO Doctor;
-- GRANT 

-- DROP USER IF EXISTS HumanResources;

-- CREATE USER HumanResources IDENTIFIED BY 'Human_Resouurces';
-- GRANT ALL ON Doctor TO HumanResources;
-- REVOKE DELETE ON Doctor(PPS,hireDate) TO HumanResources;
 