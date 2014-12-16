CREATE DATABASE  IF NOT EXISTS `tmsasus` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `tmsasus`;
-- MySQL dump 10.13  Distrib 5.6.17, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: tmsasus
-- ------------------------------------------------------
-- Server version	5.6.21

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `advertisementinfo`
--

DROP TABLE IF EXISTS `advertisementinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `advertisementinfo` (
  `offerLetterID` int(10) NOT NULL,
  `departmentID` int(10) unsigned NOT NULL,
  `staffEmail` varchar(45) DEFAULT NULL,
  `advertisingStatus` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`offerLetterID`),
  KEY `fk_AdvertisementInfo_Department1_idx` (`departmentID`),
  CONSTRAINT `fk_AdvertisementInfo_Department1` FOREIGN KEY (`departmentID`) REFERENCES `department` (`departmentID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `advertisementinfo`
--

LOCK TABLES `advertisementinfo` WRITE;
/*!40000 ALTER TABLE `advertisementinfo` DISABLE KEYS */;
INSERT INTO `advertisementinfo` VALUES (1,4,'fmobaraya2@live.utm.my','sent'),(2,4,'hosni@utm.my','accepted'),(3,3,'mubarak@live.utm.my','sent'),(4,1,'zaini@utm.my','sent'),(5,2,'haris@utm.my','accepted');
/*!40000 ALTER TABLE `advertisementinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courseinfo`
--

DROP TABLE IF EXISTS `courseinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `courseinfo` (
  `courseID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `courseCode` varchar(45) NOT NULL,
  `courseName` varchar(45) DEFAULT NULL,
  `startDate` date DEFAULT NULL,
  `endDate` date DEFAULT NULL,
  `venue` varchar(45) DEFAULT NULL,
  `objectives` varchar(45) DEFAULT NULL,
  `category` varchar(45) DEFAULT NULL,
  `duration` time DEFAULT NULL,
  `organizer` varchar(45) DEFAULT NULL,
  `courseStatus` varchar(45) DEFAULT NULL,
  `staffNum` int(10) DEFAULT NULL,
  `courseTutor` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`courseID`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courseinfo`
--

LOCK TABLES `courseinfo` WRITE;
/*!40000 ALTER TABLE `courseinfo` DISABLE KEYS */;
INSERT INTO `courseinfo` VALUES (1,'SCSJ1023','Web dfsfsdfsd','2015-01-09','2015-01-10','Bilik Seminar','Develop web system using Java platform','Academic','01:00:00','FC fdasdasd','Done',1,'Dr. Ruhaidah Samsuin'),(2,'BEJY1102','Effective Writing Skills','2015-01-19','2015-01-22','Language Academy','Enhance writing skills in workplace','Academic','07:00:00','Language Academy','Available',3,'Dr. Aireen'),(3,'FEKI1011','Emotional Quotion Management','2014-12-16','2014-12-17','FIC','To help staff manage their emotion and stress','Non-academic','10:00:00','FIC','Available',5,'Mr. Elyeen Eminem'),(4,'SCSV2029','PHP & SQL Application Development','2014-12-12','2014-12-13','FC','To develop application using PHP & SQL','ICT training','08:00:00','FC','Full',2,'Dr. Antoni Anwar'),(5,'ASDW9182','Spiritual Development','2014-12-18','2014-12-20','Dewan Al-Ghazali, MSI','To instil the importance of spiritual practic','Non-academic','07:00:00','Pusat Islam','Available',4,'Mr. Hafiz Din'),(6,'GUIA0912','Introduction to Academic Advisory','2014-12-16','2014-12-17','Dewan Banquet','To explain in details the responsibilities of','Non-academic','08:00:00','FM','Full',8,'Mr. Azriz Jasni'),(7,'test11','test11','2014-12-02','2014-12-03','Dewan Sultan Iskandar','To instill something','Academic','06:00:00','UTM ','Done',5,'Mr sssss');
/*!40000 ALTER TABLE `courseinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `department` (
  `departmentID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `departmentShortForm` varchar(45) DEFAULT NULL,
  `departmentName` varchar(45) DEFAULT NULL,
  `facultyID` int(10) unsigned NOT NULL,
  `headofDepartmentID` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`departmentID`),
  KEY `fk_department_faculty1_idx` (`facultyID`),
  CONSTRAINT `fk_department_faculty1` FOREIGN KEY (`facultyID`) REFERENCES `faculty` (`facultyID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES (1,'SM','Department of Structure & Materials',3,7),(2,'GT','Department of Geotechnics & Transportation',3,8),(3,'HH','Department of Hydraulic & Hydrology ',3,4),(4,'EE','Department of Environmental Engineering',3,9),(5,'BME','Department of Biotechnology & Medical Enginee',2,10),(6,'BHS','Department of Biosciences & Health Sciences',2,11),(7,'CSC','Department of Clinical Sciences',2,12),(8,'CS','Department of Computer Science',4,13),(9,'SE','Department of Software Engineering',4,3),(10,'IS','Department of Information System',4,15);
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faculty`
--

DROP TABLE IF EXISTS `faculty`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `faculty` (
  `facultyID` int(10) unsigned NOT NULL,
  `facultyShortForm` varchar(45) DEFAULT NULL,
  `facultyName` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`facultyID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faculty`
--

LOCK TABLES `faculty` WRITE;
/*!40000 ALTER TABLE `faculty` DISABLE KEYS */;
INSERT INTO `faculty` VALUES (1,'FAB','Faculty of Built Environment'),(2,'FBME','Faculty of Biosciences and Medical Engineerin'),(3,'FKA','Faculty of Civil Engineering'),(4,'FC','Faculty of Computing'),(5,'FKE','Faculty of Electrical Engineering'),(6,'FChE','Faculty of Chemical Engineering'),(7,'FKM','Faculty of Mechanical Engineering'),(8,'FGHT','Faculty of Geoinformation and Real Estate'),(9,'FP','Faculty of Education'),(10,'FM','Faculty of Management'),(11,'FS','Faculty of Science'),(12,'FIC','Faculty of Islamic Civilization'),(13,'FPREE','Faculty of Petroleum and Renewable Energy Eng');
/*!40000 ALTER TABLE `faculty` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `generatecertificate`
--

DROP TABLE IF EXISTS `generatecertificate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `generatecertificate` (
  `certificateNo` varchar(45) NOT NULL,
  `staffID` int(10) unsigned NOT NULL,
  `signerName` varchar(45) NOT NULL,
  `signerPosition` varchar(45) NOT NULL,
  PRIMARY KEY (`certificateNo`),
  KEY `fk_GenerateCertificate_ParticipationInfo1_idx` (`staffID`),
  CONSTRAINT `fk_GenerateCertificate_ParticipationInfo1` FOREIGN KEY (`staffID`) REFERENCES `staffinfo` (`staffID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `generatecertificate`
--

LOCK TABLES `generatecertificate` WRITE;
/*!40000 ALTER TABLE `generatecertificate` DISABLE KEYS */;
INSERT INTO `generatecertificate` VALUES ('CE0192',1,'Assoc. Prof Dr. Dayang Norhayati Abang Jawawi','Head of Dept. SE'),('CE0821',2,'Assoc. Prof Dr. Dayang Norhayati Abang Jawawi','Head of Dept. SE'),('CEO13',1,'Assoc. Prof Dr. Dayang Norhayati Binti Abang ','Head of Dept.'),('CEO16',1,'Assoc. Prof Dr. Dayang Norhayati Binti Abang ','Head of Dept.'),('CEO31',1,'Assoc. Prof Dr. Dayang Norhayati Binti Abang ','Head of Dept.'),('CEO77',1,'Assoc. Prof Dr. Dayang Norhayati Binti Abang ','Head of Dept.'),('CEO96',1,'Assoc. Prof Dr. Dayang Norhayati Binti Abang ','Head of Dept.');
/*!40000 ALTER TABLE `generatecertificate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `generatereport`
--

DROP TABLE IF EXISTS `generatereport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `generatereport` (
  `reportNo` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `courseID` int(10) unsigned NOT NULL,
  `reportType` varchar(45) NOT NULL,
  PRIMARY KEY (`reportNo`),
  KEY `fk_GenerateReport_CourseInfo1_idx` (`courseID`),
  CONSTRAINT `fk_GenerateReport_CourseInfo1` FOREIGN KEY (`courseID`) REFERENCES `courseinfo` (`courseID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `generatereport`
--

LOCK TABLES `generatereport` WRITE;
/*!40000 ALTER TABLE `generatereport` DISABLE KEYS */;
INSERT INTO `generatereport` VALUES (1,1,'year'),(2,1,'month'),(3,2,'year'),(4,2,'month'),(5,3,'year'),(6,3,'month'),(7,4,'year'),(8,4,'month'),(9,5,'year'),(10,5,'month'),(11,6,'year'),(12,6,'month');
/*!40000 ALTER TABLE `generatereport` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `logininfo`
--

DROP TABLE IF EXISTS `logininfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `logininfo` (
  `staffID` int(10) unsigned NOT NULL,
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `privelage` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`staffID`),
  CONSTRAINT `fk_logininfo_staffinfo1` FOREIGN KEY (`staffID`) REFERENCES `staffinfo` (`staffID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logininfo`
--

LOCK TABLES `logininfo` WRITE;
/*!40000 ALTER TABLE `logininfo` DISABLE KEYS */;
INSERT INTO `logininfo` VALUES (1,'hishamudin2','st1111','staff'),(2,'fmobaraya2','tt1234','staff'),(3,'dayang','hd1111','head of dept.'),(4,'zulhilmi2','hd2222','head of dept.'),(5,'khalid3','hd3333','head of dept.'),(6,'bahiah','hd4444','head of dept.'),(7,'azrizu23','hd5555','head of dept.'),(8,'rosli5','hd6666','head of dept.'),(9,'azmi','hd7777','head of dept.'),(10,'nasrul83','hd8888','head of dept.'),(11,'shafinaz4','hd9999','head of dept.'),(12,'kahar','hd1010','head of dept.'),(13,'habib34','hd1011','head of dept.'),(14,'azizah2','hd1012','head of dept.'),(15,'zaini2','123456','admin'),(16,'haris3','st2222','staff');
/*!40000 ALTER TABLE `logininfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `participationinfo`
--

DROP TABLE IF EXISTS `participationinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `participationinfo` (
  `participationID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `staffID` int(10) unsigned NOT NULL,
  `courseID` int(10) unsigned NOT NULL,
  `participantRole` varchar(45) DEFAULT NULL,
  `participantStatus` varchar(45) DEFAULT NULL,
  `attendanceStatus` bit(1) DEFAULT NULL,
  PRIMARY KEY (`participationID`),
  KEY `fk_ParticipantInfo_CourseInfo_idx` (`courseID`),
  KEY `fk_ParticipationInfo_StaffInfo1` (`staffID`),
  CONSTRAINT `fk_ParticipantInfo_CourseInfo` FOREIGN KEY (`courseID`) REFERENCES `courseinfo` (`courseID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_ParticipationInfo_StaffInfo1` FOREIGN KEY (`staffID`) REFERENCES `staffinfo` (`staffID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `participationinfo`
--

LOCK TABLES `participationinfo` WRITE;
/*!40000 ALTER TABLE `participationinfo` DISABLE KEYS */;
INSERT INTO `participationinfo` VALUES (1,2,6,'participant','Unverified',''),(3,4,3,'participant','Unverified',''),(4,9,4,'participant','Unverified',''),(7,4,1,'participant','Unverified',''),(8,7,3,'participant','Unverified',''),(9,10,4,'participant','Unverified',''),(10,4,6,'participant','Unverified',''),(11,1,1,'speaker','Enrol',''),(12,5,1,'participant','Unverified',''),(13,1,3,'participant','Unverified',''),(14,11,4,'participant','Unverified',''),(15,5,6,'participant','Unverified',''),(16,2,1,'participant','Enrol','\0'),(17,8,1,'participant','Unverified',''),(18,2,3,'participant','Unverified',''),(19,1,5,'participant','Unverified',''),(20,7,6,'participant','Unverified',''),(21,6,1,'participant','Enrol',''),(22,9,1,'participant','Unverified',''),(24,2,5,'participant','Unverified',''),(25,8,6,'participant','Unverified',''),(26,6,6,'participant','Unverified','\0'),(27,10,1,'participant','Unverified',''),(28,8,3,'participant','Unverified',''),(29,3,5,'participant','Unverified',''),(30,9,6,'participant','Unverified',''),(31,7,1,'participant','Unverified','\0'),(32,11,1,'participant','Unverified',''),(33,10,3,'participant','Unverified',''),(34,4,5,'participant','Unverified',''),(35,10,6,'participant','Unverified',''),(36,8,2,'participant','Unverified','\0'),(37,12,1,'participant','Unverified',''),(38,11,3,'participant','Unverified',''),(39,5,5,'participant','Unverified',''),(40,11,6,'participant','Unverified',''),(41,9,3,'participant','Unverified','\0'),(42,1,2,'participant','Unverified',''),(43,1,4,'participant','Unverified',''),(44,6,5,'participant','Unverified',''),(45,13,6,'participant','Unverified',''),(46,10,4,'participant','Unverified','\0'),(47,3,2,'participant','Enrol',''),(48,2,4,'participant','Unverified',''),(49,7,5,'participant','Unverified',''),(50,14,4,'participant','Unverified',''),(51,11,5,'participant','Unverified',''),(52,5,2,'participant','Unverified',''),(53,3,4,'participant','Unverified',''),(54,8,5,'participant','Unverified',''),(55,12,6,'participant','Unverified',''),(56,6,2,'participant','Unverified',''),(57,4,4,'participant','Unverified',''),(58,9,5,'participant','Unverified',''),(59,2,3,'participant','Unverified','\0'),(60,7,2,'participant','Unverified',''),(61,5,4,'participant','Unverified',''),(62,10,5,'participant','Unverified',''),(63,2,2,'participant','Enrol','\0'),(64,8,2,'participant','Unverified',''),(65,6,4,'participant','Unverified',''),(66,11,5,'participant','Unverified',''),(67,10,2,'participant','Unverified',''),(68,7,4,'participant','Unverified',''),(69,12,5,'participant','Unverified',''),(70,5,3,'participant','Unverified',''),(71,8,4,'participant','Unverified',''),(72,1,6,'participant','Unverified',''),(73,3,3,'participant','Unverified','\0');
/*!40000 ALTER TABLE `participationinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staffinfo`
--

DROP TABLE IF EXISTS `staffinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `staffinfo` (
  `staffID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `staffNo` varchar(45) DEFAULT NULL,
  `numIC` varchar(45) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `position` varchar(45) DEFAULT NULL,
  `positionGrade` varchar(45) DEFAULT NULL,
  `address` varchar(45) DEFAULT NULL,
  `facultyID` int(10) unsigned NOT NULL,
  `departmentID` int(10) unsigned NOT NULL,
  `staffStatus` varchar(45) DEFAULT NULL,
  `staffEmail` varchar(45) NOT NULL,
  PRIMARY KEY (`staffID`),
  KEY `fk_staffinfo_department1_idx` (`departmentID`),
  KEY `fk_staffinfo_faculty1_idx` (`facultyID`),
  CONSTRAINT `fk_staffinfo_department1` FOREIGN KEY (`departmentID`) REFERENCES `department` (`departmentID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_staffinfo_faculty1` FOREIGN KEY (`facultyID`) REFERENCES `faculty` (`facultyID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staffinfo`
--

LOCK TABLES `staffinfo` WRITE;
/*!40000 ALTER TABLE `staffinfo` DISABLE KEYS */;
INSERT INTO `staffinfo` VALUES (1,'SA0910','645734-35-2352','Dr. Hishammuddin Bin Asmuni','Lecturer','GD12','UTM Skudai Johor',4,9,'Active','hishamudin@utm.my'),(2,'TS0123','931118-03-5010','Fatini Mobaraya Binti Mohamad','Tutor','S09','UTM Skudai Johor',4,9,'Active','f.mobaraya@live.utm.my'),(3,'HP0111','625235-23-2352','Assoc. Prof Dr. Dayang Norhayati Binti Abang ','Head of Dept.','DG54','UTM Skudai Johor',4,9,'Active','dayang@utm.my'),(4,'HP0942','517314-24-2414','Dr. Zulhilmi Ismail','Head of Dept.','DG55','UTM Skudai Johor',3,3,'Active','zulhilmi@utm.my'),(5,'TS0913','931321-24-1241','Kalid Ibrahim','Tutor','S10','UTM Skudai Johor',2,5,'Active','khalid@live.utm.my'),(6,'SA0019','782941-23-2421','Dr. Bahiah Hj Ahmad','Lecturer','GD10','UTM Skudai Johor',4,9,'Active','bahiah@utm.my'),(7,'HP0129','672421-35-2512','Assoc. Prof. Dr. Arizu Sulaiman','Head of Dept.','DG45','Pulai Johor',3,1,'Active','azrizu@utm.my'),(8,'HP0019','783251-63-9902','Prof. Dr. Mohd Rosli Hainin','Head of Dept.','DG50','Kulai Johor',3,2,'Active','rosli@utm.my'),(9,'HP2419','679124-09-3525','Assoc. Prof. Dr. Azmi Aris','Head of Dept.','DG48','Senai Johor',3,4,'Study leave','azmi@utm.my'),(10,'HP0241','773215-09-0356','Dr Nasrul Humaimi Bin Mahmood','Head of Dept.','Dg47','Taman Universiti, Johor',2,5,'Active','nasrul@utm.my'),(11,'HP0372','789125-37-2362','Dr. Shafinaz binti Shahir','Head of Dept.','DG55','Taman Mutiara Rini, Johor',2,6,'Active','shafinaz@utm.my'),(12,'HP0567','652561-23-3533','Dr. Kahar Osman','Head of Dept.','DG54','Skudai, Johor',2,7,'Study leave','kahar@utm.my'),(13,'HP0384','635161-33-3267','Prof. Dr. Habibollah bin Haron','Head of Dept.','DG52','Senai Johor',4,8,'Active','habib@utm.my'),(14,'HP0352','732626-09-3626','Assoc. Prof Dr. Azizah Abd. Rahman','Head of Dept.','DG50','Kulai Johor',4,10,'Active','azizah@utm.my'),(15,'TC0019','809241-00-2412','Zaini Tajol','Staff','S10','Skudai Johor',4,2,'Active','zaini2@utm.my'),(16,'TC0023','882245-22-2141','Haris Ismail','Satff','S11','Taman Pulai Utama, Johor',3,2,'Active','haris3@utm.my');
/*!40000 ALTER TABLE `staffinfo` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-12-16 20:11:11
