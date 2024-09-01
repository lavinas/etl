-- MySQL dump 10.13  Distrib 8.0.37, for Linux (x86_64)
--
-- Host: mysql.vooo.ws    Database: vooo_billing
-- ------------------------------------------------------
-- Server version	5.7.44-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
SET @MYSQLDUMP_TEMP_LOG_BIN = @@SESSION.SQL_LOG_BIN;
SET @@SESSION.SQL_LOG_BIN=0;

--
-- GTID state at the beginning of the backup 
--

SET @@GLOBAL.GTID_PURGED=/*!80000 '+'*/ '';


DROP DATABASE IF EXISTS `vooo_migration`;
CREATE DATABASE `vooo_migration`;


USE `vooo_migration`;

--
-- Table structure for table `_ref`
--
DROP TABLE IF EXISTS `_ref`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_ref` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `referrer_schema` varchar(100) not null,
  `referrer_table` varchar(100) not null,
  `referrer_field` varchar(100) not null,
  `referenced_schema` varchar(100) not null,
  `referenced_table` varchar(100) not null,
  `referenced_field` varchar(100) not null,
  PRIMARY KEY (`id`)
  ) ENGINE=InnoDB AUTO_INCREMENT=21027 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_expt`
--
DROP TABLE IF EXISTS `_expt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE  `_expt` (
  `id` bigint PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `stat` varchar(500) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_schma`
--
DROP TABLE IF EXISTS `_schma`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_schma` (
  `id` bigint PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `ref_type` varchar(30) NOT NULL,
  `init_key` BIGINT NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_key`
--
DROP TABLE IF EXISTS `_key`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_key` (
  `id` bigint PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `object` varchar(100) NOT NULL,
  `field` varchar(100) NOT NULL,
  `init_key` bigint NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `job`
--
DROP TABLE IF EXISTS `job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `job` (
  `id` bigint PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `type` varchar(30) NOT NULL,
  `action` varchar(30) NOT NULL,
  `base` varchar(100) NOT NULL,
  `object` varchar(100) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `job_key`
--
DROP TABLE IF EXISTS `job_key`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `job_key` (
  `id` bigint PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `job_id` bigint NOT NULL,
  `name` varchar(100) NOT NULL,
  `last` bigint NOT NULL,
  `step` bigint NOT NULL,
  key `job_id` (`job_id`),
  CONSTRAINT `job_key_ibfk_1` FOREIGN KEY (`job_id`) REFERENCES `job` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;


--
-- Table structure for table `ref`
--
DROP TABLE IF EXISTS `ref`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ref` (
  `id` bigint PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `referrer` bigint NOT NULL,
  `referred` bigint NOT NULL,
  UNIQUE KEY `referrer_uk` (`referrer`,`referred`),
  KEY `referred` (`referred`),
  KEY `referrer` (`referrer`),
  CONSTRAINT `reference_ibfk_1` FOREIGN KEY (`referrer`) REFERENCES `job` (`id`) ON DELETE CASCADE,
  CONSTRAINT `reference_ibfk_2` FOREIGN KEY (`referred`) REFERENCES `job` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ref_key`
--
DROP TABLE IF EXISTS `ref_key`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ref_key` (
  `id` bigint PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `ref_id` bigint NOT NULL,
  `referrer` varchar(100) NOT NULL,
  `referred` varchar(100) NOT NULL,
  key `ref_id_key` (`ref_id`),
  CONSTRAINT `ref_key_ibfk_1` FOREIGN KEY (`ref_id`) REFERENCES `ref` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `log`
--
DROP TABLE IF EXISTS `log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `log` (
  `id` bigint PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `job_id` bigint NOT NULL,
  `shift` bigint NOT NULL,
  `status` varchar(20) NOT NULL,
  `detail` varchar(255) NOT NULL,
  `start` datetime NOT NULL,
  `duration` decimal(10, 4) NOT NULL,
  `more` bigint NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

# ending tables

SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-07-28 13:42:07
