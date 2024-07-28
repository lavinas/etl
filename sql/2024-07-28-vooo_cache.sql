-- MySQL dump 10.13  Distrib 8.0.37, for Linux (x86_64)
--
-- Host: mysql.vooo.ws    Database: vooo_cache
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
-- Table structure for table `cache_statement`
--

DROP TABLE IF EXISTS `cache_statement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cache_statement` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `client_id` int(11) NOT NULL,
  `provider_id` int(11) NOT NULL,
  `version` decimal(2,0) NOT NULL,
  `date` date NOT NULL,
  `format` varchar(5) NOT NULL,
  `type` varchar(5) NOT NULL,
  `status` decimal(2,0) NOT NULL,
  `content` mediumblob NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_cash_statement` (`client_id`,`provider_id`,`date`,`version`,`format`,`type`)
) ENGINE=InnoDB AUTO_INCREMENT=5813 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cash_flow`
--

DROP TABLE IF EXISTS `cash_flow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cash_flow` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `client_id` int(11) NOT NULL,
  `provider_id` int(11) NOT NULL,
  `version` decimal(2,0) NOT NULL,
  `date` date NOT NULL,
  `sequence` decimal(5,0) NOT NULL DEFAULT '0',
  `format` varchar(5) NOT NULL,
  `type` varchar(5) NOT NULL,
  `status` decimal(2,0) NOT NULL,
  `content` longblob NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_cashglow` (`client_id`,`provider_id`,`date`,`version`,`format`,`type`),
  KEY `idx_date` (`date`)
) ENGINE=InnoDB AUTO_INCREMENT=1869165 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cnab_files`
--

DROP TABLE IF EXISTS `cnab_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cnab_files` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `client_id` int(11) NOT NULL,
  `provider_id` int(11) NOT NULL,
  `initial_date` date NOT NULL,
  `final_date` date NOT NULL,
  `created_at` datetime NOT NULL,
  `nseq_file` decimal(5,0) NOT NULL,
  `file_name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cross_sales`
--

DROP TABLE IF EXISTS `cross_sales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cross_sales` (
  `report_id` bigint(20) NOT NULL,
  `payment_date` date DEFAULT NULL,
  `payment_code` varchar(50) NOT NULL,
  `authorization_code` varchar(64) DEFAULT NULL,
  `registrado` decimal(10,2) DEFAULT NULL,
  `reconhecido` decimal(10,2) NOT NULL DEFAULT '0.00',
  `fee_value` decimal(10,2) NOT NULL,
  `provider_id` int(10) unsigned DEFAULT NULL,
  `provedor` varchar(50) DEFAULT NULL,
  KEY `payment_code` (`payment_code`),
  KEY `shellboxId 1` (`report_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cross_sap`
--

DROP TABLE IF EXISTS `cross_sap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cross_sap` (
  `report_id` bigint(20) NOT NULL,
  `referencia` varchar(20) NOT NULL DEFAULT '0',
  `data_lancamento` date DEFAULT NULL,
  `data_documento` date DEFAULT NULL,
  `texto_cabecalho` varchar(64) DEFAULT NULL,
  `montante` decimal(16,2) DEFAULT NULL,
  `fee_parceiro` decimal(16,2) DEFAULT NULL,
  `local_negocio` int(10) unsigned DEFAULT NULL,
  KEY `shellboxId` (`referencia`),
  KEY `report_id` (`report_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `view_agenda`
--

DROP TABLE IF EXISTS `view_agenda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `view_agenda` (
  `agenda_id` int(10) unsigned NOT NULL DEFAULT '0',
  `client_id` int(10) unsigned NOT NULL,
  `item_date` date DEFAULT NULL,
  `secondary_date` date DEFAULT NULL,
  `payment_method_id` int(10) unsigned DEFAULT NULL,
  `payment_method` varchar(80) DEFAULT NULL,
  `provider_id` int(10) unsigned DEFAULT NULL,
  `provider` varchar(80) DEFAULT NULL,
  `card_flag_id` int(10) unsigned DEFAULT NULL,
  `card_flag` varchar(80) DEFAULT NULL,
  `provider_lot_code` varchar(50) DEFAULT NULL,
  `contract_code` decimal(15,0) DEFAULT NULL,
  `status_id` decimal(2,0) DEFAULT NULL,
  `settlement_date` date DEFAULT NULL,
  `realized_settlement_date` date DEFAULT NULL,
  `accrual_date` date DEFAULT NULL,
  `event_id` decimal(3,0) DEFAULT NULL,
  `event_name` varchar(30) DEFAULT NULL,
  `bank_account_mask` varchar(25) DEFAULT NULL,
  `sales_id` int(10) unsigned DEFAULT NULL,
  `sales_status_id` decimal(2,0) DEFAULT '0',
  `provider_code` varchar(64) DEFAULT NULL,
  `authorization_code` varchar(64) DEFAULT NULL,
  `sales_code` varchar(50) DEFAULT NULL,
  `payment_code` varchar(50) DEFAULT NULL,
  `agenda_gross_value` decimal(10,2) DEFAULT '0.00',
  `agenda_fee_value` decimal(10,2) DEFAULT '0.00',
  `agenda_net_value` decimal(10,2) DEFAULT '0.00',
  `gross_value` decimal(10,2) DEFAULT '0.00',
  `fee_value` decimal(10,2) DEFAULT '0.00',
  `net_value` decimal(10,2) DEFAULT '0.00',
  `terminal_id` varchar(30) DEFAULT '0.00',
  `update_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  KEY `client` (`client_id`),
  KEY `event_id` (`event_id`),
  KEY `provider_id` (`provider_id`),
  KEY `card_flag_id` (`card_flag_id`),
  KEY `payment_method_id` (`payment_method_id`),
  KEY `status_id` (`status_id`),
  KEY `sales_status_id` (`sales_status_id`),
  KEY `authorization_code` (`authorization_code`),
  KEY `sales_code` (`sales_code`),
  KEY `provider_code` (`provider_code`),
  KEY `terminal_id` (`terminal_id`),
  KEY `item_date` (`item_date`,`client_id`),
  KEY `settlement_date` (`settlement_date`,`client_id`),
  KEY `secondary_date` (`secondary_date`,`client_id`),
  KEY `realized_settlement_date` (`realized_settlement_date`,`client_id`),
  KEY `agenda_id` (`agenda_id`,`client_id`),
  KEY `sales_id` (`sales_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `view_summary_agenda`
--

DROP TABLE IF EXISTS `view_summary_agenda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `view_summary_agenda` (
  `client_id` int(10) DEFAULT NULL,
  `item_date` date DEFAULT NULL,
  `last_id` int(10) DEFAULT NULL,
  `secondary_date` date DEFAULT NULL,
  `realized_settlement_date` date DEFAULT NULL,
  `settlement_date` date DEFAULT NULL,
  `gross_value` decimal(12,2) NOT NULL DEFAULT '0.00',
  `net_value` decimal(12,2) NOT NULL DEFAULT '0.00',
  `provider_id` int(10) DEFAULT NULL,
  `card_flag_id` int(10) DEFAULT NULL,
  `payment_method_id` int(10) DEFAULT NULL,
  `event_id` smallint(6) DEFAULT NULL,
  KEY `item_date` (`client_id`,`item_date`),
  KEY `provider_id` (`provider_id`,`client_id`,`item_date`),
  KEY `card_flag_id` (`card_flag_id`,`client_id`,`item_date`),
  KEY `payment_method_id` (`payment_method_id`,`client_id`,`item_date`),
  KEY `event_id` (`event_id`,`client_id`,`item_date`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `view_summary_taxas`
--

DROP TABLE IF EXISTS `view_summary_taxas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `view_summary_taxas` (
  `item_date` date NOT NULL,
  `client_id` int(10) unsigned NOT NULL,
  `last_id` int(10) unsigned DEFAULT '0',
  `payment_method_id` int(10) unsigned DEFAULT '0',
  `payment_method` varchar(75) DEFAULT '',
  `provider_id` int(10) unsigned DEFAULT '0',
  `provider` varchar(75) DEFAULT '',
  `card_flag_id` int(10) DEFAULT NULL,
  `card_flag` varchar(75) DEFAULT '',
  `payment_installments_group` varchar(5) DEFAULT '',
  `gross_value` decimal(12,2) DEFAULT '0.00',
  `interchange_fee_value` decimal(10,2) DEFAULT '0.00',
  `administration_fee_value` decimal(10,2) DEFAULT '0.00',
  `fee_value` decimal(10,2) DEFAULT '0.00',
  `fee_rate` decimal(10,4) DEFAULT '0.0000',
  `total` int(10) NOT NULL DEFAULT '0',
  KEY `item_date` (`client_id`,`item_date`),
  KEY `provider_id` (`provider_id`,`client_id`,`item_date`),
  KEY `card_flag_id` (`card_flag_id`,`client_id`,`item_date`),
  KEY `payment_method_id` (`payment_method_id`,`client_id`,`item_date`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `vooo_homolog_backend.cnab_files`
--

DROP TABLE IF EXISTS `vooo_homolog_backend.cnab_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vooo_homolog_backend.cnab_files` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `client_id` int(11) NOT NULL,
  `provider_id` int(11) NOT NULL,
  `initial_date` date NOT NULL,
  `final_date` date NOT NULL,
  `created_at` datetime NOT NULL,
  `nseq_file` decimal(5,0) NOT NULL,
  `file_name` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
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

-- Dump completed on 2024-07-28 13:47:53
