-- MySQL dump 10.13  Distrib 8.0.16, for macos10.14 (x86_64)
--
-- Host: localhost    Database: hospital
-- ------------------------------------------------------
-- Server version	8.0.16

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Admissions`
--

DROP TABLE IF EXISTS `Admissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Admissions` (
  `admissionNumber` int(11) NOT NULL AUTO_INCREMENT,
  `patientID` int(11) NOT NULL,
  `arriveDate` date NOT NULL,
  `dischargeDate` date DEFAULT NULL,
  `bedNumber` int(11) DEFAULT NULL,
  PRIMARY KEY (`admissionNumber`),
  UNIQUE KEY `admissionNumber` (`admissionNumber`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Admissions`
--

LOCK TABLES `Admissions` WRITE;
/*!40000 ALTER TABLE `Admissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `Admissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Bed`
--

DROP TABLE IF EXISTS `Bed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Bed` (
  `bedNumber` int(11) NOT NULL,
  `bedType` int(11) NOT NULL,
  `wardID` varchar(6) DEFAULT NULL,
  `patientID` int(11) DEFAULT NULL,
  `admissionNumber` int(11) DEFAULT NULL,
  `available` char(1) DEFAULT 'Y',
  UNIQUE KEY `patientID` (`patientID`),
  KEY `fk_Ward` (`wardID`),
  KEY `bedType` (`bedType`),
  KEY `admissionNumber` (`admissionNumber`),
  CONSTRAINT `bed_ibfk_1` FOREIGN KEY (`bedType`) REFERENCES `bedtype` (`bedType`) ON UPDATE CASCADE,
  CONSTRAINT `bed_ibfk_2` FOREIGN KEY (`admissionNumber`) REFERENCES `admissions` (`admissionNumber`) ON UPDATE CASCADE,
  CONSTRAINT `fk_Patient` FOREIGN KEY (`patientID`) REFERENCES `patient` (`patientID`) ON UPDATE CASCADE,
  CONSTRAINT `fk_Ward` FOREIGN KEY (`wardID`) REFERENCES `ward` (`wardID`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Bed`
--

LOCK TABLES `Bed` WRITE;
/*!40000 ALTER TABLE `Bed` DISABLE KEYS */;
/*!40000 ALTER TABLE `Bed` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BedType`
--

DROP TABLE IF EXISTS `BedType`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `BedType` (
  `bedType` int(3) NOT NULL,
  `bedDescription` varchar(30) DEFAULT NULL,
  `bedPrice` decimal(7,2) DEFAULT NULL,
  PRIMARY KEY (`bedType`),
  UNIQUE KEY `bedDescription` (`bedDescription`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BedType`
--

LOCK TABLES `BedType` WRITE;
/*!40000 ALTER TABLE `BedType` DISABLE KEYS */;
/*!40000 ALTER TABLE `BedType` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Doctor`
--

DROP TABLE IF EXISTS `Doctor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Doctor` (
  `PPS` varchar(9) NOT NULL,
  `fName` varchar(15) NOT NULL,
  `lName` varchar(15) NOT NULL,
  `street` varchar(25) DEFAULT NULL,
  `town` varchar(20) DEFAULT NULL,
  `county` varchar(15) DEFAULT NULL,
  `contactNo` varchar(15) DEFAULT NULL,
  `hireDate` date NOT NULL,
  `specialisation` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`PPS`),
  UNIQUE KEY `PPS` (`PPS`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Doctor`
--

LOCK TABLES `Doctor` WRITE;
/*!40000 ALTER TABLE `Doctor` DISABLE KEYS */;
/*!40000 ALTER TABLE `Doctor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Drug`
--

DROP TABLE IF EXISTS `Drug`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Drug` (
  `drugID` int(11) NOT NULL AUTO_INCREMENT,
  `drugName` varchar(60) NOT NULL,
  `manufacturer` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`drugID`),
  UNIQUE KEY `drugID` (`drugID`)
) ENGINE=InnoDB AUTO_INCREMENT=100013 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Drug`
--

LOCK TABLES `Drug` WRITE;
/*!40000 ALTER TABLE `Drug` DISABLE KEYS */;
/*!40000 ALTER TABLE `Drug` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Gender`
--

DROP TABLE IF EXISTS `Gender`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Gender` (
  `sex` char(1) NOT NULL,
  `description` varchar(7) DEFAULT NULL,
  PRIMARY KEY (`sex`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Gender`
--

LOCK TABLES `Gender` WRITE;
/*!40000 ALTER TABLE `Gender` DISABLE KEYS */;
/*!40000 ALTER TABLE `Gender` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Patient`
--

DROP TABLE IF EXISTS `Patient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Patient` (
  `patientID` int(11) NOT NULL AUTO_INCREMENT,
  `fName` varchar(15) DEFAULT 'JOHN',
  `lName` varchar(15) DEFAULT 'DOE',
  `DOB` date DEFAULT NULL,
  `sex` char(1) DEFAULT NULL,
  `street` varchar(25) DEFAULT NULL,
  `town` varchar(20) DEFAULT NULL,
  `county` varchar(15) DEFAULT NULL,
  `contactNo` varchar(12) DEFAULT NULL,
  PRIMARY KEY (`patientID`),
  UNIQUE KEY `patientID` (`patientID`),
  KEY `fk_Gender` (`sex`),
  CONSTRAINT `fk_Gender` FOREIGN KEY (`sex`) REFERENCES `gender` (`sex`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=585 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Patient`
--

LOCK TABLES `Patient` WRITE;
/*!40000 ALTER TABLE `Patient` DISABLE KEYS */;
/*!40000 ALTER TABLE `Patient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Prescription`
--

DROP TABLE IF EXISTS `Prescription`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Prescription` (
  `visitID` int(11) NOT NULL,
  `drugID` int(11) NOT NULL,
  `dosageDetails` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`visitID`,`drugID`),
  KEY `drugID` (`drugID`),
  CONSTRAINT `prescription_ibfk_1` FOREIGN KEY (`visitID`) REFERENCES `visit` (`visitID`) ON UPDATE CASCADE,
  CONSTRAINT `prescription_ibfk_2` FOREIGN KEY (`drugID`) REFERENCES `drug` (`drugID`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Prescription`
--

LOCK TABLES `Prescription` WRITE;
/*!40000 ALTER TABLE `Prescription` DISABLE KEYS */;
/*!40000 ALTER TABLE `Prescription` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `time_in_hospital`
--

DROP TABLE IF EXISTS `time_in_hospital`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `time_in_hospital` (
  `patientID` int(11) DEFAULT NULL,
  `count` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `time_in_hospital`
--

LOCK TABLES `time_in_hospital` WRITE;
/*!40000 ALTER TABLE `time_in_hospital` DISABLE KEYS */;
/*!40000 ALTER TABLE `time_in_hospital` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Visit`
--

DROP TABLE IF EXISTS `Visit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Visit` (
  `visitID` int(11) NOT NULL AUTO_INCREMENT,
  `patientID` int(11) NOT NULL,
  `PPS` varchar(9) NOT NULL,
  `date` date NOT NULL,
  `time` time DEFAULT NULL,
  PRIMARY KEY (`visitID`),
  UNIQUE KEY `visitID` (`visitID`),
  KEY `patientID` (`patientID`),
  KEY `PPS` (`PPS`),
  CONSTRAINT `visit_ibfk_1` FOREIGN KEY (`patientID`) REFERENCES `patient` (`patientID`) ON UPDATE CASCADE,
  CONSTRAINT `visit_ibfk_2` FOREIGN KEY (`PPS`) REFERENCES `doctor` (`PPS`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1027 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Visit`
--

LOCK TABLES `Visit` WRITE;
/*!40000 ALTER TABLE `Visit` DISABLE KEYS */;
/*!40000 ALTER TABLE `Visit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Ward`
--

DROP TABLE IF EXISTS `Ward`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Ward` (
  `wardID` varchar(6) NOT NULL,
  `wardName` varchar(15) NOT NULL,
  `wardType` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`wardID`),
  UNIQUE KEY `wardID` (`wardID`),
  UNIQUE KEY `wardName` (`wardName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Ward`
--

LOCK TABLES `Ward` WRITE;
/*!40000 ALTER TABLE `Ward` DISABLE KEYS */;
/*!40000 ALTER TABLE `Ward` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `WardCapacity`
--

DROP TABLE IF EXISTS `WardCapacity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `WardCapacity` (
  `wardID` varchar(6) NOT NULL,
  `wardLimit` tinyint(2) DEFAULT NULL,
  `count` tinyint(4) DEFAULT NULL,
  KEY `wardID` (`wardID`),
  CONSTRAINT `wardcapacity_ibfk_1` FOREIGN KEY (`wardID`) REFERENCES `ward` (`wardID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `WardCapacity`
--

LOCK TABLES `WardCapacity` WRITE;
/*!40000 ALTER TABLE `WardCapacity` DISABLE KEYS */;
/*!40000 ALTER TABLE `WardCapacity` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-11-22 15:30:23
