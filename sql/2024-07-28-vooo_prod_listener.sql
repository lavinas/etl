-- MySQL dump 10.13  Distrib 8.0.37, for Linux (x86_64)
--
-- Host: mysql.vooo.ws    Database: vooo_prod_listener
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
-- Table structure for table `client_connector_alive`
--

DROP TABLE IF EXISTS `client_connector_alive`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `client_connector_alive` (
  `client_conn_alive_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `client_id` int(10) unsigned NOT NULL,
  `connector_id` int(10) unsigned NOT NULL,
  `last_message` datetime NOT NULL,
  PRIMARY KEY (`client_conn_alive_id`,`client_id`,`connector_id`),
  KEY `client_connector_alive_ibfk_1_idx` (`client_id`,`connector_id`),
  CONSTRAINT `fk_alive_client_connector` FOREIGN KEY (`client_id`, `connector_id`) REFERENCES `vooo_prod_backend`.`client_connector` (`client_id`, `connector_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=130 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `client_job_scheduler`
--

DROP TABLE IF EXISTS `client_job_scheduler`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `client_job_scheduler` (
  `client_scheduler_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `client_id` int(10) unsigned NOT NULL,
  `connector_id` int(10) unsigned NOT NULL,
  `weekday` int(10) unsigned DEFAULT NULL,
  `hour` int(10) unsigned DEFAULT NULL,
  `minute` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`client_scheduler_id`,`client_id`,`connector_id`),
  KEY `client_id` (`client_id`),
  KEY `connector_id` (`connector_id`),
  CONSTRAINT `client_job_scheduler_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `vooo_prod_backend`.`client_connector` (`client_id`),
  CONSTRAINT `client_job_scheduler_ibfk_2` FOREIGN KEY (`connector_id`) REFERENCES `vooo_prod_backend`.`client_connector` (`connector_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `client_login`
--

DROP TABLE IF EXISTS `client_login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `client_login` (
  `client_login_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `client_id` int(10) unsigned NOT NULL,
  `connector_id` int(10) unsigned NOT NULL,
  `login` varchar(100) NOT NULL,
  `passwd` varchar(100) NOT NULL,
  PRIMARY KEY (`client_login_id`,`client_id`,`connector_id`),
  KEY `client_id` (`client_id`),
  KEY `connector_id` (`connector_id`),
  CONSTRAINT `client_login_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `vooo_prod_backend`.`client_connector` (`client_id`),
  CONSTRAINT `client_login_ibfk_2` FOREIGN KEY (`connector_id`) REFERENCES `vooo_prod_backend`.`client_connector` (`connector_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_bill_header`
--

DROP TABLE IF EXISTS `conn_bill_header`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_bill_header` (
  `item_id` int(10) unsigned NOT NULL,
  `token` varchar(50) DEFAULT NULL,
  `transmission_date` date DEFAULT NULL,
  `transmission_time` time DEFAULT NULL,
  `period_init` date DEFAULT NULL,
  `period_end` date DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_bill_header_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_bill_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_bill_item`
--

DROP TABLE IF EXISTS `conn_bill_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_bill_item` (
  `item_id` int(10) unsigned NOT NULL,
  `empresa_faturada` int(10) unsigned DEFAULT NULL,
  `codigo_pedido` int(10) unsigned DEFAULT NULL,
  `codigo_fiscal` int(10) unsigned DEFAULT NULL,
  `data_pedido` date DEFAULT NULL,
  `hora_pedido` time DEFAULT NULL,
  `data_pagamento` date DEFAULT NULL,
  `hora_pagamento` time DEFAULT NULL,
  `evento_notificado` int(10) unsigned DEFAULT NULL,
  `data_evento` date DEFAULT NULL,
  `hora_evento` time DEFAULT NULL,
  `tipo_operacao` int(10) unsigned DEFAULT NULL,
  `valor_bruto_pedido` decimal(10,2) DEFAULT NULL,
  `valor_desconto_pedido` decimal(10,2) DEFAULT NULL,
  `valor_acrescimos_pedido` decimal(10,2) DEFAULT NULL,
  `valor_liquido_pedido` decimal(10,2) DEFAULT NULL,
  `valor_pago_pedido` decimal(10,2) DEFAULT NULL,
  `meio_pagamento` int(10) unsigned DEFAULT NULL,
  `instituicao_financeira` int(10) unsigned DEFAULT NULL,
  `ponto_venda_instituicao_financeira` int(10) unsigned DEFAULT NULL,
  `numero_parcelas` int(10) unsigned DEFAULT NULL,
  `bandeira` int(10) unsigned DEFAULT NULL,
  `chave_primaria_instituicao_financeira` varchar(10) DEFAULT NULL,
  `chave_secundaria_instituicao_financeira` varchar(10) DEFAULT NULL,
  `chave_ternaria_instituicao_financeira` varchar(10) DEFAULT NULL,
  `banco_domicilio` int(10) unsigned DEFAULT NULL,
  `agencia_domicilio` int(10) unsigned DEFAULT NULL,
  `conta_corrente_domicilio` int(10) unsigned DEFAULT NULL,
  `taxa_instituicao_financeira` decimal(10,2) DEFAULT NULL,
  `valor_tarifa_instituicao_finaceira` decimal(10,2) DEFAULT NULL,
  `unidade_venda` varchar(50) DEFAULT NULL,
  `vendedor` varchar(50) DEFAULT NULL,
  `itens_vendidos` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_bill_item_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_bill_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_bill_line`
--

DROP TABLE IF EXISTS `conn_bill_line`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_bill_line` (
  `item_id` int(10) unsigned NOT NULL,
  `registertype` int(10) unsigned DEFAULT NULL,
  `masterid` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  KEY `masterid` (`masterid`),
  CONSTRAINT `conn_bill_line_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `vooo_prod_backend`.`connection_item` (`item_id`),
  CONSTRAINT `conn_bill_line_ibfk_2` FOREIGN KEY (`masterid`) REFERENCES `conn_bill_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_bill_product`
--

DROP TABLE IF EXISTS `conn_bill_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_bill_product` (
  `item_id` int(10) unsigned NOT NULL,
  `product_sales_id` int(10) unsigned DEFAULT NULL,
  `sales_id` int(10) unsigned DEFAULT NULL,
  `product_id` int(10) unsigned DEFAULT NULL,
  `group_id` int(10) unsigned DEFAULT NULL,
  `description` varchar(70) DEFAULT NULL,
  `gross_value` decimal(10,2) DEFAULT NULL,
  `discount_value` decimal(10,2) DEFAULT NULL,
  `net_value` decimal(10,2) DEFAULT NULL,
  `paid_value` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_bill_product_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_bill_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_bill_trailer`
--

DROP TABLE IF EXISTS `conn_bill_trailer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_bill_trailer` (
  `item_id` int(10) unsigned NOT NULL,
  `totalrecords` int(11) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_bill_trailer_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_bill_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_control`
--

DROP TABLE IF EXISTS `conn_control`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_control` (
  `control_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `client_id` int(10) unsigned NOT NULL,
  `connector_id` int(10) unsigned NOT NULL,
  `last_execution` datetime NOT NULL,
  `last_executed_datetime` datetime NOT NULL,
  `last_executed_register` int(10) unsigned NOT NULL,
  `last_executed_quantity` int(10) unsigned NOT NULL,
  PRIMARY KEY (`control_id`,`client_id`,`connector_id`),
  KEY `client_id` (`client_id`),
  KEY `connector_id` (`connector_id`),
  CONSTRAINT `conn_control_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `vooo_prod_backend`.`client_connector` (`client_id`),
  CONSTRAINT `conn_control_ibfk_2` FOREIGN KEY (`connector_id`) REFERENCES `vooo_prod_backend`.`client_connector` (`connector_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_control_log`
--

DROP TABLE IF EXISTS `conn_control_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_control_log` (
  `log_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `control_id` int(10) unsigned NOT NULL,
  `client_id` int(10) unsigned NOT NULL,
  `connector_id` int(10) unsigned NOT NULL,
  `last_execution` datetime NOT NULL,
  `last_executed_datetime` datetime NOT NULL,
  `last_executed_register` int(10) unsigned NOT NULL,
  `last_executed_quantity` int(10) unsigned NOT NULL,
  PRIMARY KEY (`log_id`,`client_id`,`connector_id`),
  KEY `control_id` (`control_id`),
  KEY `client_id` (`client_id`),
  KEY `connector_id` (`connector_id`),
  CONSTRAINT `conn_control_log_ibfk_1` FOREIGN KEY (`control_id`) REFERENCES `conn_control` (`control_id`),
  CONSTRAINT `conn_control_log_ibfk_2` FOREIGN KEY (`client_id`) REFERENCES `vooo_prod_backend`.`client_connector` (`client_id`),
  CONSTRAINT `conn_control_log_ibfk_3` FOREIGN KEY (`connector_id`) REFERENCES `vooo_prod_backend`.`client_connector` (`connector_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12996 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `session_login`
--

DROP TABLE IF EXISTS `session_login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `session_login` (
  `session_login_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `client_login_id` int(10) unsigned NOT NULL,
  `login` varchar(50) NOT NULL,
  `token` varchar(50) NOT NULL,
  `status` varchar(1) NOT NULL,
  `initdate` datetime NOT NULL,
  `enddate` datetime DEFAULT NULL,
  PRIMARY KEY (`session_login_id`),
  KEY `client_login_id` (`client_login_id`),
  CONSTRAINT `session_login_ibfk_1` FOREIGN KEY (`client_login_id`) REFERENCES `client_login` (`client_login_id`)
) ENGINE=InnoDB AUTO_INCREMENT=450715 DEFAULT CHARSET=utf8;
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

-- Dump completed on 2024-07-28 13:50:30
