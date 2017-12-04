CREATE DATABASE  IF NOT EXISTS `db_test` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `db_test`;
-- MySQL dump 10.13  Distrib 5.7.20, for Linux (x86_64)
--
-- Host: localhost    Database: db_test
-- ------------------------------------------------------
-- Server version	5.7.20-0ubuntu0.16.04.1

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
-- Table structure for table `akses`
--

DROP TABLE IF EXISTS `akses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `akses` (
  `idx_akses` int(11) NOT NULL AUTO_INCREMENT,
  `nama_akses` varchar(45) NOT NULL,
  `idx_parent` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idx_akses`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `akses`
--

LOCK TABLES `akses` WRITE;
/*!40000 ALTER TABLE `akses` DISABLE KEYS */;
INSERT INTO `akses` VALUES (1,'Menu1',0),(2,'Menu2',0),(3,'Menu3',0),(4,'Menu4',0),(5,'Menu5',0),(6,'Menu6',0),(7,'Menu7',0);
/*!40000 ALTER TABLE `akses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grup_akses`
--

DROP TABLE IF EXISTS `grup_akses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grup_akses` (
  `idx_grup_akses` int(11) NOT NULL AUTO_INCREMENT,
  `idx_grup_pengguna` int(11) NOT NULL,
  `idx_akses` int(11) NOT NULL,
  PRIMARY KEY (`idx_grup_akses`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grup_akses`
--

LOCK TABLES `grup_akses` WRITE;
/*!40000 ALTER TABLE `grup_akses` DISABLE KEYS */;
INSERT INTO `grup_akses` VALUES (1,1,1),(2,1,2),(3,2,3),(4,2,4),(5,3,6),(6,3,7),(7,4,3),(8,4,6);
/*!40000 ALTER TABLE `grup_akses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grup_pengguna`
--

DROP TABLE IF EXISTS `grup_pengguna`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grup_pengguna` (
  `idx_grup_pengguna` int(11) NOT NULL AUTO_INCREMENT,
  `nama_grup` varchar(45) NOT NULL,
  PRIMARY KEY (`idx_grup_pengguna`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grup_pengguna`
--

LOCK TABLES `grup_pengguna` WRITE;
/*!40000 ALTER TABLE `grup_pengguna` DISABLE KEYS */;
INSERT INTO `grup_pengguna` VALUES (1,'HRD'),(2,'Finance'),(3,'Accounting'),(4,'Operasional');
/*!40000 ALTER TABLE `grup_pengguna` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pengguna`
--

DROP TABLE IF EXISTS `pengguna`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pengguna` (
  `idx_pengguna` int(11) NOT NULL AUTO_INCREMENT,
  `nama_pengguna` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `passwd` varchar(45) NOT NULL,
  `creation_time` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`idx_pengguna`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pengguna`
--

LOCK TABLES `pengguna` WRITE;
/*!40000 ALTER TABLE `pengguna` DISABLE KEYS */;
INSERT INTO `pengguna` VALUES (2,'Cahyo Purnomo','c.purnomo@gmail.com','ac43724f16e9241d990427ab7c8f4228','2017-12-03 08:22:57'),(4,'Ali Zainal Abidin','ali@gmail.com','ac43724f16e9241d990427ab7c8f4228','2017-12-04 06:39:47'),(5,'Aisyah','aisyah@yahoo.com','ac43724f16e9241d990427ab7c8f4228','2017-12-04 06:52:41'),(6,'tes','tes@gmail.com','0368be89b398ee472fb6c44408da3209','2017-12-04 07:59:54'),(7,'Widya Wardani','wwardani@gmail.com','ac43724f16e9241d990427ab7c8f4228','2017-12-04 08:00:36');
/*!40000 ALTER TABLE `pengguna` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-12-04  8:55:19
