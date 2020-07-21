CREATE DATABASE  IF NOT EXISTS `tms_db` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `tms_db`;
-- MySQL dump 10.13  Distrib 8.0.12, for Win64 (x86_64)
--
-- Host: localhost    Database: tms_db
-- ------------------------------------------------------
-- Server version	8.0.12

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
-- Table structure for table `contracts`
--

DROP TABLE IF EXISTS `contracts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `contracts` (
  `conId` int(11) NOT NULL AUTO_INCREMENT,
  `conName` varchar(21) NOT NULL,
  `conStartDate` datetime DEFAULT NULL,
  `conExpiryDate` datetime DEFAULT NULL,
  PRIMARY KEY (`conId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contracts`
--

LOCK TABLES `contracts` WRITE;
/*!40000 ALTER TABLE `contracts` DISABLE KEYS */;
INSERT INTO `contracts` VALUES (1,'Contract 1',NULL,NULL),(2,'Contract 2',NULL,NULL),(3,'Contract 3',NULL,NULL),(4,'Contract 4',NULL,NULL),(5,'Contract 5',NULL,NULL);
/*!40000 ALTER TABLE `contracts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `employees` (
  `empId` int(11) NOT NULL AUTO_INCREMENT,
  `empName` varchar(21) NOT NULL,
  `empPosition` varchar(21) NOT NULL,
  `empAddress` varchar(21) NOT NULL,
  `empPhone` varchar(11) NOT NULL,
  `empExpYear` varchar(11) NOT NULL,
  `staId` int(11) NOT NULL,
  `conId` int(11) NOT NULL,
  PRIMARY KEY (`empId`),
  KEY `conId_idx` (`conId`),
  KEY `staId_idx` (`staId`),
  CONSTRAINT `conId` FOREIGN KEY (`conId`) REFERENCES `contracts` (`conid`),
  CONSTRAINT `staId` FOREIGN KEY (`staId`) REFERENCES `stations` (`staid`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees`
--

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` VALUES (2,'Name 2','Pos 2','Addr 2','Phone 2','Exp 2',2,2),(5,'EmpName3','pos3','addr3','phone3','123',3,3),(6,'EmpName3','pos3','addr3','phone3','123',3,3),(9,'EmpName3','pos3','addr3','phone3','123',3,3),(10,'EmpName3','pos3','addr3','phone3','123',3,3);
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stations`
--

DROP TABLE IF EXISTS `stations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `stations` (
  `staId` int(11) NOT NULL AUTO_INCREMENT,
  `staName` varchar(21) NOT NULL,
  `staAddress` varchar(21) DEFAULT NULL,
  PRIMARY KEY (`staId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stations`
--

LOCK TABLES `stations` WRITE;
/*!40000 ALTER TABLE `stations` DISABLE KEYS */;
INSERT INTO `stations` VALUES (1,'Station 1',NULL),(2,'Station 2',NULL),(3,'Station 3',NULL),(4,'Station 4',NULL),(5,'Station 5',NULL);
/*!40000 ALTER TABLE `stations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehicles`
--

DROP TABLE IF EXISTS `vehicles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `vehicles` (
  `vehId` int(11) NOT NULL AUTO_INCREMENT,
  `vehPlateNumber` varchar(21) NOT NULL,
  `vehManufacturer` varchar(21) NOT NULL,
  `vehColor` varchar(21) NOT NULL,
  `empId` int(11) NOT NULL,
  PRIMARY KEY (`vehId`),
  KEY `empId_idx` (`empId`),
  CONSTRAINT `empId` FOREIGN KEY (`empId`) REFERENCES `employees` (`empid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehicles`
--

LOCK TABLES `vehicles` WRITE;
/*!40000 ALTER TABLE `vehicles` DISABLE KEYS */;
INSERT INTO `vehicles` VALUES (3,'30F-01234','Honda','White',5),(4,'77L-77777','Lamborghini','Red',6);
/*!40000 ALTER TABLE `vehicles` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-11-08 11:49:15
