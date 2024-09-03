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
SET @@SESSION.SQL_LOG_BIN= 0;

--
-- GTID state at the beginning of the backup 
--

-- SET @@GLOBAL.GTID_PURGED=/*!80000 '+'*/ '';

DROP DATABASE IF EXISTS `vooo_billing`;
CREATE DATABASE `vooo_billing`;
USE `vooo_billing`;

--
-- Table structure for table `billing_amount`
--


DROP TABLE IF EXISTS `billing_amount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `billing_amount` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `client_id` int(11) NOT NULL,
  `billing_month` varchar(25) NOT NULL,
  `provider_id` int(11) NOT NULL,
  `accrual_month` varchar(11) NOT NULL,
  `transactions` bigint(20) NOT NULL,
  `reprocessed_transactions` bigint(20) NOT NULL,
  `status_id` decimal(1,0) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_billing_month` (`client_id`,`billing_month`,`provider_id`,`accrual_month`)
) ENGINE=InnoDB AUTO_INCREMENT=39736 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `billing_closing`
--

DROP TABLE IF EXISTS `billing_closing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `billing_closing` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `billing_month` varchar(11) NOT NULL,
  `closing_datetime` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `billing_control`
--

DROP TABLE IF EXISTS `billing_control`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `billing_control` (
  `client_id` int(11) NOT NULL,
  `last_processed_date` datetime NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `billing_detail`
--

DROP TABLE IF EXISTS `billing_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `billing_detail` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `billing_month` varchar(11) NOT NULL,
  `output_sales_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=57769 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `billing_history`
--

DROP TABLE IF EXISTS `billing_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `billing_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_aggregator` int(11) NOT NULL,
  `billing_month` varchar(255) NOT NULL,
  `initial_date` date NOT NULL,
  `final_date` date NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=219 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tmp_billing_2020_04`
--

DROP TABLE IF EXISTS `tmp_billing_2020_04`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tmp_billing_2020_04` (
  `id` bigint(20) NOT NULL DEFAULT '0',
  `client_id` int(11) NOT NULL,
  `billing_month` varchar(11) NOT NULL,
  `provider_id` int(11) NOT NULL,
  `accrual_month` varchar(11) NOT NULL,
  `transactions` bigint(20) NOT NULL,
  `status_id` decimal(1,0) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
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
