-- MySQL dump 10.13  Distrib 8.0.37, for Linux (x86_64)
--
-- Host: mysql.vooo.ws    Database: vooo_prod_report
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

SET @@GLOBAL.GTID_PURGED=/*!80000 '+'*/ '';

--
-- Table structure for table `bank_statement_line`
--

DROP TABLE IF EXISTS `bank_statement_line`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bank_statement_line` (
  `sttline_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `payment_method_id` int(10) unsigned NOT NULL,
  `provider_id` int(10) unsigned DEFAULT NULL,
  `card_flag_id` int(10) unsigned DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`sttline_id`),
  KEY `payment_method_id` (`payment_method_id`),
  KEY `provider_id` (`provider_id`),
  KEY `card_flag_id` (`card_flag_id`),
  CONSTRAINT `bank_statement_line_ibfk_1` FOREIGN KEY (`payment_method_id`) REFERENCES `vooo_prod_backend`.`payment_method` (`payment_method_id`),
  CONSTRAINT `bank_statement_line_ibfk_2` FOREIGN KEY (`provider_id`) REFERENCES `vooo_prod_backend`.`provider` (`provider_id`),
  CONSTRAINT `bank_statement_line_ibfk_3` FOREIGN KEY (`card_flag_id`) REFERENCES `vooo_prod_backend`.`card_flag` (`card_flag_id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `client_report`
--

DROP TABLE IF EXISTS `client_report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `client_report` (
  `client_report_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `client_id` int(10) unsigned NOT NULL,
  `report_id` int(10) unsigned NOT NULL,
  `status` decimal(1,0) NOT NULL DEFAULT '1',
  `mail_list` varchar(500) DEFAULT NULL,
  `file_path` varchar(100) DEFAULT NULL,
  `file_prefix` varchar(45) DEFAULT NULL,
  `last_execution` datetime DEFAULT NULL,
  `backtrack_days` int(11) DEFAULT NULL,
  `accrued` decimal(1,0) DEFAULT NULL,
  `one_day_report` decimal(1,0) DEFAULT NULL,
  `monthly` decimal(1,0) DEFAULT NULL,
  `last_monthly_execution` datetime DEFAULT NULL,
  `receiving_type` varchar(1) DEFAULT 'A',
  `scope_type` varchar(1) DEFAULT 'H',
  `login` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`client_report_id`,`status`),
  KEY `client_id` (`client_id`),
  KEY `report_id` (`report_id`),
  CONSTRAINT `client_report_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `vooo_prod_backend`.`client` (`id`),
  CONSTRAINT `client_report_ibfk_2` FOREIGN KEY (`report_id`) REFERENCES `report` (`report_id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `client_report_log`
--

DROP TABLE IF EXISTS `client_report_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `client_report_log` (
  `log_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `client_report_id` int(10) unsigned NOT NULL,
  `execution_date` datetime NOT NULL,
  `send_mail_date` datetime NOT NULL,
  `mail_list` varchar(500) NOT NULL,
  `status` decimal(1,0) NOT NULL DEFAULT '1',
  PRIMARY KEY (`log_id`),
  KEY `client_report_id` (`client_report_id`),
  CONSTRAINT `client_report_log_ibfk_1` FOREIGN KEY (`client_report_id`) REFERENCES `client_report` (`client_report_id`)
) ENGINE=InnoDB AUTO_INCREMENT=60091 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `client_report_receiver`
--

DROP TABLE IF EXISTS `client_report_receiver`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `client_report_receiver` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `client_report_id` int(10) unsigned NOT NULL,
  `email` varchar(50) NOT NULL,
  `name` varchar(100) NOT NULL,
  `not_done_receiver` decimal(1,0) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `client_report_id` (`client_report_id`),
  CONSTRAINT `client_report_receiver_ibfk_1` FOREIGN KEY (`client_report_id`) REFERENCES `client_report` (`client_report_id`)
) ENGINE=InnoDB AUTO_INCREMENT=165 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `output_report_control`
--

DROP TABLE IF EXISTS `output_report_control`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `output_report_control` (
  `client_id` int(10) unsigned NOT NULL,
  `output_id` int(10) unsigned NOT NULL,
  `last_execution` datetime DEFAULT NULL,
  `last_processed_date` date DEFAULT NULL,
  PRIMARY KEY (`client_id`,`output_id`),
  KEY `output_id` (`output_id`),
  CONSTRAINT `output_report_control_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `vooo_prod_backend`.`client` (`id`),
  CONSTRAINT `output_report_control_ibfk_2` FOREIGN KEY (`output_id`) REFERENCES `vooo_prod_backend`.`output` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `report`
--

DROP TABLE IF EXISTS `report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `report` (
  `report_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `description` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`report_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sales_item`
--

DROP TABLE IF EXISTS `sales_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sales_item` (
  `sales_item_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `client_id` int(10) unsigned NOT NULL,
  `connector_id` int(10) unsigned NOT NULL,
  `salesdate` date NOT NULL,
  `salestime` time DEFAULT NULL,
  `payment_method_id` int(10) unsigned NOT NULL,
  `provider_id` int(10) unsigned DEFAULT NULL,
  `card_flag_id` int(10) unsigned DEFAULT NULL,
  `installments` int(10) unsigned DEFAULT NULL,
  `grossvalue` float NOT NULL,
  `cost` float NOT NULL,
  `costrate` float NOT NULL,
  `netvalue` float NOT NULL,
  `receivingdate` date DEFAULT NULL,
  `communicationdate` date DEFAULT NULL,
  `processingdate` datetime DEFAULT NULL,
  `registertype` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`sales_item_id`),
  KEY `connector_id` (`connector_id`),
  KEY `payment_method_id` (`payment_method_id`),
  KEY `provider_id` (`provider_id`),
  KEY `card_flag_id` (`card_flag_id`),
  KEY `client_id` (`client_id`,`connector_id`),
  CONSTRAINT `sales_item_ibfk_1` FOREIGN KEY (`client_id`, `connector_id`) REFERENCES `vooo_prod_backend`.`client_connector` (`client_id`, `connector_id`),
  CONSTRAINT `sales_item_ibfk_3` FOREIGN KEY (`payment_method_id`) REFERENCES `vooo_prod_backend`.`payment_method` (`payment_method_id`),
  CONSTRAINT `sales_item_ibfk_4` FOREIGN KEY (`provider_id`) REFERENCES `vooo_prod_backend`.`provider` (`provider_id`),
  CONSTRAINT `sales_item_ibfk_5` FOREIGN KEY (`card_flag_id`) REFERENCES `vooo_prod_backend`.`card_flag` (`card_flag_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6916722 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sales_report_control`
--

DROP TABLE IF EXISTS `sales_report_control`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sales_report_control` (
  `client_id` int(10) unsigned NOT NULL,
  `connector_id` int(10) unsigned NOT NULL,
  `last_execution` datetime DEFAULT NULL,
  `last_processed_date` date DEFAULT NULL,
  PRIMARY KEY (`client_id`,`connector_id`),
  KEY `connector_id` (`connector_id`),
  CONSTRAINT `sales_report_control_ibfk_1` FOREIGN KEY (`client_id`, `connector_id`) REFERENCES `vooo_prod_backend`.`client_connector` (`client_id`, `connector_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `store_names`
--

DROP TABLE IF EXISTS `store_names`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `store_names` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `document_number` decimal(20,0) NOT NULL,
  `store_name` varchar(100) NOT NULL,
  `store_type` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tmp_receiver`
--

DROP TABLE IF EXISTS `tmp_receiver`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tmp_receiver` (
  `id` int(10) unsigned NOT NULL DEFAULT '0',
  `client_report_id` int(10) unsigned NOT NULL,
  `email` varchar(50) CHARACTER SET utf8 NOT NULL,
  `name` varchar(100) CHARACTER SET utf8 NOT NULL,
  `not_done_receiver` decimal(1,0) DEFAULT '0'
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

-- Dump completed on 2024-07-28 13:51:39
