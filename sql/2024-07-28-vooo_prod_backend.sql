-- MySQL dump 10.13  Distrib 8.0.37, for Linux (x86_64)
--
-- Host: mysql.vooo.ws    Database: vooo_prod_backend
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
-- Table structure for table `address`
--


DROP DATABASE IF EXISTS `vooo_prod_backend`;
CREATE DATABASE `vooo_prod_backend`;
USE `vooo_prod_backend`;

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `address` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `street` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `number` int(11) NOT NULL,
  `complement` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `neighbor` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `city` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `state` varchar(4) COLLATE utf8_unicode_ci NOT NULL,
  `country` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `zipcode` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `aggregator`
--

DROP TABLE IF EXISTS `aggregator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aggregator` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_client` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `analise_dados_sb_chave_01`
--

DROP TABLE IF EXISTS `analise_dados_sb_chave_01`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `analise_dados_sb_chave_01` (
  `id` int(10) unsigned NOT NULL,
  `point` varchar(64) DEFAULT NULL,
  `empresa` varchar(20) DEFAULT NULL,
  `data_lancamento` date DEFAULT NULL,
  `data_documento` date DEFAULT NULL,
  `exercicio` varchar(10) DEFAULT NULL,
  `tipo_documento` varchar(10) DEFAULT NULL,
  `moeda` varchar(3) DEFAULT NULL,
  `referencia` varchar(20) NOT NULL,
  `texto_cabecalho` varchar(64) DEFAULT NULL,
  `chave_lancamento` varchar(5) DEFAULT NULL,
  `conta_cliente` varchar(16) DEFAULT NULL,
  `montante` decimal(16,2) DEFAULT NULL,
  `montante_mi` decimal(16,2) DEFAULT NULL,
  `local_negocio` varchar(15) DEFAULT NULL,
  `divisao` varchar(15) DEFAULT NULL,
  `sociedade` varchar(15) DEFAULT NULL,
  `centro_custo` varchar(15) DEFAULT NULL,
  `centro_lucro` varchar(15) DEFAULT NULL,
  `tp_movimento` varchar(15) DEFAULT NULL,
  `condicao_pgto` varchar(15) DEFAULT NULL,
  `chave_bloq_pgto` varchar(15) DEFAULT NULL,
  `forma_pagamento` varchar(15) DEFAULT NULL,
  `parceiro_txt` varchar(64) DEFAULT NULL,
  `data_txt` varchar(64) DEFAULT NULL,
  `taxa_1_txt` varchar(64) DEFAULT NULL,
  `taxa_2_txt` varchar(64) DEFAULT NULL,
  `taxa_3_txt` varchar(64) DEFAULT NULL,
  `atribuicao` varchar(15) DEFAULT NULL,
  `elemento_pep` varchar(15) DEFAULT NULL,
  `centro` varchar(15) DEFAULT NULL,
  `ordem` varchar(15) DEFAULT NULL,
  `material` varchar(15) DEFAULT NULL,
  `data_efetiva` date DEFAULT NULL,
  `razao_especial` varchar(15) DEFAULT NULL,
  `data_vencimento` date DEFAULT NULL,
  `data_pagamento` date DEFAULT NULL,
  `fee_parceiro` decimal(16,2) DEFAULT NULL,
  `fee_revendedor` decimal(16,2) DEFAULT NULL,
  `fee_payly` decimal(16,2) DEFAULT NULL,
  `taxa_parceiro` decimal(16,2) DEFAULT NULL,
  `taxa_revendedor` decimal(16,2) DEFAULT NULL,
  `taxa_payly` decimal(16,2) DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `analise_sb_01_17`
--

DROP TABLE IF EXISTS `analise_sb_01_17`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `analise_sb_01_17` (
  `id` int(10) unsigned NOT NULL,
  `point` varchar(64) DEFAULT NULL,
  `empresa` varchar(20) DEFAULT NULL,
  `data_lancamento` date DEFAULT NULL,
  `data_documento` date DEFAULT NULL,
  `exercicio` varchar(10) DEFAULT NULL,
  `tipo_documento` varchar(10) DEFAULT NULL,
  `moeda` varchar(3) DEFAULT NULL,
  `referencia` varchar(20) NOT NULL,
  `texto_cabecalho` varchar(64) DEFAULT NULL,
  `chave_lancamento` varchar(5) DEFAULT NULL,
  `conta_cliente` varchar(16) DEFAULT NULL,
  `montante` decimal(16,2) DEFAULT NULL,
  `montante_mi` decimal(16,2) DEFAULT NULL,
  `local_negocio` varchar(15) DEFAULT NULL,
  `divisao` varchar(15) DEFAULT NULL,
  `sociedade` varchar(15) DEFAULT NULL,
  `centro_custo` varchar(15) DEFAULT NULL,
  `centro_lucro` varchar(15) DEFAULT NULL,
  `tp_movimento` varchar(15) DEFAULT NULL,
  `condicao_pgto` varchar(15) DEFAULT NULL,
  `chave_bloq_pgto` varchar(15) DEFAULT NULL,
  `forma_pagamento` varchar(15) DEFAULT NULL,
  `parceiro_txt` varchar(64) DEFAULT NULL,
  `data_txt` varchar(64) DEFAULT NULL,
  `taxa_1_txt` varchar(64) DEFAULT NULL,
  `taxa_2_txt` varchar(64) DEFAULT NULL,
  `taxa_3_txt` varchar(64) DEFAULT NULL,
  `atribuicao` varchar(15) DEFAULT NULL,
  `elemento_pep` varchar(15) DEFAULT NULL,
  `centro` varchar(15) DEFAULT NULL,
  `ordem` varchar(15) DEFAULT NULL,
  `material` varchar(15) DEFAULT NULL,
  `data_efetiva` date DEFAULT NULL,
  `razao_especial` varchar(15) DEFAULT NULL,
  `data_vencimento` date DEFAULT NULL,
  `data_pagamento` date DEFAULT NULL,
  `fee_parceiro` decimal(16,2) DEFAULT NULL,
  `fee_revendedor` decimal(16,2) DEFAULT NULL,
  `fee_payly` decimal(16,2) DEFAULT NULL,
  `taxa_parceiro` decimal(16,2) DEFAULT NULL,
  `taxa_revendedor` decimal(16,2) DEFAULT NULL,
  `taxa_payly` decimal(16,2) DEFAULT NULL,
  `sb_id` int(10) unsigned NOT NULL DEFAULT '0',
  `id_consolidado` int(10) unsigned DEFAULT NULL,
  `consolidado` int(10) unsigned DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `analise_sb_detalhado`
--

DROP TABLE IF EXISTS `analise_sb_detalhado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `analise_sb_detalhado` (
  `id` int(10) unsigned NOT NULL,
  `sales_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `payment_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `payment_date` date NOT NULL,
  `payment_time` time NOT NULL,
  `gross_value` decimal(10,2) NOT NULL,
  `net_value` decimal(10,2) NOT NULL,
  `fee_value` decimal(10,2) NOT NULL,
  `fee_rate` decimal(5,4) NOT NULL,
  `payment_installments` decimal(2,0) NOT NULL,
  `authorization_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `provider_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `provider_code_extra` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `txn_id_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `credit_card_mask` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `vendor_mcc` decimal(6,0) DEFAULT NULL,
  `vbv_transaction` tinyint(1) DEFAULT NULL,
  `vendor_document` decimal(20,0) DEFAULT NULL,
  `status_id` decimal(2,0) NOT NULL,
  `power_id` decimal(1,0) NOT NULL,
  `key_id` decimal(2,0) NOT NULL,
  `register_type_id` decimal(2,0) NOT NULL,
  `unity` decimal(1,0) NOT NULL,
  `approuched_date` decimal(1,0) NOT NULL,
  `event_lot_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `output_sales_adjusts_id` int(10) unsigned DEFAULT NULL,
  `terminal_id` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `administration_fee_value` decimal(10,2) DEFAULT '0.00',
  `administration_fare_value` decimal(10,2) DEFAULT '0.00',
  `interchange_fee_value` decimal(10,2) DEFAULT '0.00',
  `financial_fee_value` decimal(10,2) DEFAULT '0.00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `analise_sb_full`
--

DROP TABLE IF EXISTS `analise_sb_full`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `analise_sb_full` (
  `id` int(10) unsigned NOT NULL,
  `point` varchar(64) DEFAULT NULL,
  `empresa` varchar(20) DEFAULT NULL,
  `data_lancamento` date DEFAULT NULL,
  `data_documento` date DEFAULT NULL,
  `exercicio` varchar(10) DEFAULT NULL,
  `tipo_documento` varchar(10) DEFAULT NULL,
  `moeda` varchar(3) DEFAULT NULL,
  `referencia` varchar(20) NOT NULL,
  `texto_cabecalho` varchar(64) DEFAULT NULL,
  `chave_lancamento` varchar(5) DEFAULT NULL,
  `conta_cliente` varchar(16) DEFAULT NULL,
  `montante` decimal(16,2) DEFAULT NULL,
  `montante_mi` decimal(16,2) DEFAULT NULL,
  `local_negocio` varchar(15) DEFAULT NULL,
  `divisao` varchar(15) DEFAULT NULL,
  `sociedade` varchar(15) DEFAULT NULL,
  `centro_custo` varchar(15) DEFAULT NULL,
  `centro_lucro` varchar(15) DEFAULT NULL,
  `tp_movimento` varchar(15) DEFAULT NULL,
  `condicao_pgto` varchar(15) DEFAULT NULL,
  `chave_bloq_pgto` varchar(15) DEFAULT NULL,
  `forma_pagamento` varchar(15) DEFAULT NULL,
  `parceiro_txt` varchar(64) DEFAULT NULL,
  `data_txt` varchar(64) DEFAULT NULL,
  `taxa_1_txt` varchar(64) DEFAULT NULL,
  `taxa_2_txt` varchar(64) DEFAULT NULL,
  `taxa_3_txt` varchar(64) DEFAULT NULL,
  `atribuicao` varchar(15) DEFAULT NULL,
  `elemento_pep` varchar(15) DEFAULT NULL,
  `centro` varchar(15) DEFAULT NULL,
  `ordem` varchar(15) DEFAULT NULL,
  `material` varchar(15) DEFAULT NULL,
  `data_efetiva` date DEFAULT NULL,
  `razao_especial` varchar(15) DEFAULT NULL,
  `data_vencimento` date DEFAULT NULL,
  `data_pagamento` date DEFAULT NULL,
  `fee_parceiro` decimal(16,2) DEFAULT NULL,
  `fee_revendedor` decimal(16,2) DEFAULT NULL,
  `fee_payly` decimal(16,2) DEFAULT NULL,
  `taxa_parceiro` decimal(16,2) DEFAULT NULL,
  `taxa_revendedor` decimal(16,2) DEFAULT NULL,
  `taxa_payly` decimal(16,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `analise_sb_mp`
--

DROP TABLE IF EXISTS `analise_sb_mp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `analise_sb_mp` (
  `id` int(10) unsigned NOT NULL,
  `point` varchar(64) DEFAULT NULL,
  `empresa` varchar(20) DEFAULT NULL,
  `data_lancamento` date DEFAULT NULL,
  `data_documento` date DEFAULT NULL,
  `exercicio` varchar(10) DEFAULT NULL,
  `tipo_documento` varchar(10) DEFAULT NULL,
  `moeda` varchar(3) DEFAULT NULL,
  `referencia` varchar(20) NOT NULL,
  `texto_cabecalho` varchar(64) DEFAULT NULL,
  `chave_lancamento` varchar(5) DEFAULT NULL,
  `conta_cliente` varchar(16) DEFAULT NULL,
  `montante` decimal(16,2) DEFAULT NULL,
  `montante_mi` decimal(16,2) DEFAULT NULL,
  `local_negocio` varchar(15) DEFAULT NULL,
  `divisao` varchar(15) DEFAULT NULL,
  `sociedade` varchar(15) DEFAULT NULL,
  `centro_custo` varchar(15) DEFAULT NULL,
  `centro_lucro` varchar(15) DEFAULT NULL,
  `tp_movimento` varchar(15) DEFAULT NULL,
  `condicao_pgto` varchar(15) DEFAULT NULL,
  `chave_bloq_pgto` varchar(15) DEFAULT NULL,
  `forma_pagamento` varchar(15) DEFAULT NULL,
  `parceiro_txt` varchar(64) DEFAULT NULL,
  `data_txt` varchar(64) DEFAULT NULL,
  `taxa_1_txt` varchar(64) DEFAULT NULL,
  `taxa_2_txt` varchar(64) DEFAULT NULL,
  `taxa_3_txt` varchar(64) DEFAULT NULL,
  `atribuicao` varchar(15) DEFAULT NULL,
  `elemento_pep` varchar(15) DEFAULT NULL,
  `centro` varchar(15) DEFAULT NULL,
  `ordem` varchar(15) DEFAULT NULL,
  `material` varchar(15) DEFAULT NULL,
  `data_efetiva` date DEFAULT NULL,
  `razao_especial` varchar(15) DEFAULT NULL,
  `data_vencimento` date DEFAULT NULL,
  `data_pagamento` date DEFAULT NULL,
  `fee_parceiro` decimal(16,2) DEFAULT NULL,
  `fee_revendedor` decimal(16,2) DEFAULT NULL,
  `fee_payly` decimal(16,2) DEFAULT NULL,
  `taxa_parceiro` decimal(16,2) DEFAULT NULL,
  `taxa_revendedor` decimal(16,2) DEFAULT NULL,
  `taxa_payly` decimal(16,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `analise_sb_novos`
--

DROP TABLE IF EXISTS `analise_sb_novos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `analise_sb_novos` (
  `id` int(10) unsigned NOT NULL,
  `point` varchar(64) DEFAULT NULL,
  `empresa` varchar(20) DEFAULT NULL,
  `data_lancamento` date DEFAULT NULL,
  `data_documento` date DEFAULT NULL,
  `exercicio` varchar(10) DEFAULT NULL,
  `tipo_documento` varchar(10) DEFAULT NULL,
  `moeda` varchar(3) DEFAULT NULL,
  `referencia` varchar(20) NOT NULL,
  `texto_cabecalho` varchar(64) DEFAULT NULL,
  `chave_lancamento` varchar(5) DEFAULT NULL,
  `conta_cliente` varchar(16) DEFAULT NULL,
  `montante` decimal(16,2) DEFAULT NULL,
  `montante_mi` decimal(16,2) DEFAULT NULL,
  `local_negocio` varchar(15) DEFAULT NULL,
  `divisao` varchar(15) DEFAULT NULL,
  `sociedade` varchar(15) DEFAULT NULL,
  `centro_custo` varchar(15) DEFAULT NULL,
  `centro_lucro` varchar(15) DEFAULT NULL,
  `tp_movimento` varchar(15) DEFAULT NULL,
  `condicao_pgto` varchar(15) DEFAULT NULL,
  `chave_bloq_pgto` varchar(15) DEFAULT NULL,
  `forma_pagamento` varchar(15) DEFAULT NULL,
  `parceiro_txt` varchar(64) DEFAULT NULL,
  `data_txt` varchar(64) DEFAULT NULL,
  `taxa_1_txt` varchar(64) DEFAULT NULL,
  `taxa_2_txt` varchar(64) DEFAULT NULL,
  `taxa_3_txt` varchar(64) DEFAULT NULL,
  `atribuicao` varchar(15) DEFAULT NULL,
  `elemento_pep` varchar(15) DEFAULT NULL,
  `centro` varchar(15) DEFAULT NULL,
  `ordem` varchar(15) DEFAULT NULL,
  `material` varchar(15) DEFAULT NULL,
  `data_efetiva` date DEFAULT NULL,
  `razao_especial` varchar(15) DEFAULT NULL,
  `data_vencimento` date DEFAULT NULL,
  `data_pagamento` date DEFAULT NULL,
  `fee_parceiro` decimal(16,2) DEFAULT NULL,
  `fee_revendedor` decimal(16,2) DEFAULT NULL,
  `fee_payly` decimal(16,2) DEFAULT NULL,
  `taxa_parceiro` decimal(16,2) DEFAULT NULL,
  `taxa_revendedor` decimal(16,2) DEFAULT NULL,
  `taxa_payly` decimal(16,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bank`
--

DROP TABLE IF EXISTS `bank`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bank` (
  `id` decimal(3,0) NOT NULL,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `billing`
--

DROP TABLE IF EXISTS `billing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `billing` (
  `processing_date` date NOT NULL,
  `aggregator_id` int(10) unsigned NOT NULL,
  `client_id` int(10) NOT NULL DEFAULT '0',
  `provider_id` int(10) NOT NULL DEFAULT '0',
  `type_transactions` int(10) unsigned NOT NULL,
  `connection_id` int(10) unsigned NOT NULL,
  `transactions` int(10) unsigned NOT NULL,
  `processing_type` int(10) unsigned NOT NULL,
  `connection_date` datetime DEFAULT NULL,
  PRIMARY KEY (`connection_id`,`aggregator_id`,`client_id`,`provider_id`,`type_transactions`,`processing_date`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `billing_rule`
--

DROP TABLE IF EXISTS `billing_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `billing_rule` (
  `processing_type` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `billed` tinyint(1) DEFAULT NULL,
  `description` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`processing_type`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `brazil_bank_holidays`
--

DROP TABLE IF EXISTS `brazil_bank_holidays`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `brazil_bank_holidays` (
  `holiday` date NOT NULL,
  PRIMARY KEY (`holiday`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `card_bin_base`
--

DROP TABLE IF EXISTS `card_bin_base`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `card_bin_base` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `number` decimal(6,0) unsigned NOT NULL,
  `brand` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `issuer` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `category` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `country_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `country_iso_a2_code` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `country_iso_a3_code` varchar(3) COLLATE utf8_unicode_ci DEFAULT NULL,
  `country_iso_number` decimal(3,0) DEFAULT NULL,
  `created_lot_id` int(11) unsigned NOT NULL,
  `updated_lot_id` int(11) unsigned DEFAULT NULL,
  `deleted_lot_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_card_bin_base_number` (`number`),
  KEY `fk_card_bin_base_card_bin_base_file1_idx` (`created_lot_id`),
  KEY `fk_card_bin_base_card_bin_base_file2_idx` (`updated_lot_id`),
  KEY `fk_card_bin_base_card_bin_base_file3_idx` (`deleted_lot_id`),
  CONSTRAINT `fk_card_bin_base_card_bin_base_file1` FOREIGN KEY (`created_lot_id`) REFERENCES `card_bin_lot` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_card_bin_base_card_bin_base_file2` FOREIGN KEY (`updated_lot_id`) REFERENCES `card_bin_lot` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_card_bin_base_card_bin_base_file3` FOREIGN KEY (`deleted_lot_id`) REFERENCES `card_bin_lot` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=321783 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `card_bin_lot`
--

DROP TABLE IF EXISTS `card_bin_lot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `card_bin_lot` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `datetime` datetime NOT NULL,
  `file_path` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `file_checksum` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `card_flag`
--

DROP TABLE IF EXISTS `card_flag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `card_flag` (
  `card_flag_id` int(10) unsigned NOT NULL,
  `name` varchar(75) NOT NULL,
  `description` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`card_flag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cielo_auth`
--

DROP TABLE IF EXISTS `cielo_auth`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cielo_auth` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_client` int(10) unsigned DEFAULT NULL,
  `access_token` varchar(255) DEFAULT NULL,
  `refresh_token` varchar(255) DEFAULT NULL,
  `token_type` varchar(255) DEFAULT NULL,
  `expires_in` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_client` (`id_client`)
) ENGINE=InnoDB AUTO_INCREMENT=200 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cielo_auth_log`
--

DROP TABLE IF EXISTS `cielo_auth_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cielo_auth_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_client` int(10) unsigned DEFAULT NULL,
  `response` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `id_client` (`id_client`)
) ENGINE=InnoDB AUTO_INCREMENT=371 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cielo_auth_merchants`
--

DROP TABLE IF EXISTS `cielo_auth_merchants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cielo_auth_merchants` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_client` int(10) unsigned DEFAULT NULL,
  `legalEntityNumber` varchar(255) DEFAULT NULL,
  `merchantId` varchar(255) DEFAULT NULL,
  `registerID` varchar(255) DEFAULT NULL,
  `type` text,
  `acknowledge` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `id_client` (`id_client`),
  KEY `merchantId` (`merchantId`)
) ENGINE=InnoDB AUTO_INCREMENT=148 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `client`
--

DROP TABLE IF EXISTS `client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `client` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `economic_group_id` int(10) unsigned DEFAULT NULL,
  `id_address` int(10) unsigned DEFAULT NULL,
  `id_contact` int(10) unsigned DEFAULT NULL,
  `id_document` int(10) unsigned NOT NULL,
  `id_author` int(10) unsigned NOT NULL,
  `headquarter_id` int(10) unsigned DEFAULT NULL,
  `id_aggregator` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `trading` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `brand` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `client_id_address_foreign` (`id_address`),
  KEY `client_id_contact_foreign` (`id_contact`),
  KEY `client_id_document_foreign` (`id_document`),
  KEY `client_id_author_foreign` (`id_author`),
  KEY `client_id_economic_group` (`economic_group_id`),
  KEY `fk_headquarter_id` (`headquarter_id`),
  CONSTRAINT `cleint_id_document_foreign` FOREIGN KEY (`id_document`) REFERENCES `document` (`id`),
  CONSTRAINT `client_id_address_foreign` FOREIGN KEY (`id_address`) REFERENCES `address` (`id`),
  CONSTRAINT `client_id_author_foreign` FOREIGN KEY (`id_author`) REFERENCES `user` (`id`),
  CONSTRAINT `fk_headquarter_id` FOREIGN KEY (`headquarter_id`) REFERENCES `client` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2294 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `vooo_prod_backend`.`client_BEFORE_UPDATE` BEFORE UPDATE ON `client` FOR EACH ROW
BEGIN
IF(NEW.status != OLD.status) THEN
SET NEW.updated_at = NOW();
END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `client_average_sales`
--

DROP TABLE IF EXISTS `client_average_sales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `client_average_sales` (
  `client_id` int(10) unsigned NOT NULL,
  `average_three_month_sales_qty` bigint(20) unsigned NOT NULL,
  `last_three_months` varchar(45) NOT NULL,
  `client_custom_type_id` int(10) unsigned NOT NULL,
  `last_updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `client_bank_balance`
--

DROP TABLE IF EXISTS `client_bank_balance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `client_bank_balance` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `client_id` int(10) unsigned DEFAULT NULL,
  `client_bank_info` varchar(30) DEFAULT NULL,
  `balance_date` date DEFAULT NULL,
  `income` decimal(15,2) DEFAULT NULL,
  `withdrawal` decimal(15,2) DEFAULT NULL,
  `balance` decimal(15,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_client_bank_balance_client_id_idx` (`client_id`),
  CONSTRAINT `fk_client_bank_balance_client_id` FOREIGN KEY (`client_id`) REFERENCES `client` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `client_bank_register_type`
--

DROP TABLE IF EXISTS `client_bank_register_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `client_bank_register_type` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `client_id` int(11) DEFAULT NULL,
  `type` varchar(45) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `client_connector`
--

DROP TABLE IF EXISTS `client_connector`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `client_connector` (
  `client_id` int(10) unsigned NOT NULL,
  `connector_id` int(10) unsigned NOT NULL,
  `contract_code` decimal(20,0) DEFAULT NULL,
  `initial_processing_date` date DEFAULT NULL,
  `initial_processing_id` int(11) unsigned DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `server_id` int(10) NOT NULL DEFAULT '0',
  `inclusive` decimal(1,0) NOT NULL DEFAULT '1',
  `alive` decimal(1,0) NOT NULL DEFAULT '1',
  `load_sales_code` decimal(1,0) NOT NULL DEFAULT '0',
  `ignore_weekend` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`client_id`,`connector_id`),
  KEY `fk_client_connector_connector1_idx1` (`connector_id`),
  KEY `fk_client_connector_client1_idx` (`client_id`),
  KEY `idx_client_connector_server` (`server_id`),
  CONSTRAINT `fk_client_connector_client1` FOREIGN KEY (`client_id`) REFERENCES `client` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_client_connector_connector1` FOREIGN KEY (`connector_id`) REFERENCES `connector` (`connector_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `client_connector_crawler`
--

DROP TABLE IF EXISTS `client_connector_crawler`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `client_connector_crawler` (
  `client_id` int(10) unsigned NOT NULL,
  `connector_id` int(10) unsigned NOT NULL,
  `login` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  PRIMARY KEY (`client_id`,`connector_id`),
  KEY `connector_id` (`connector_id`),
  CONSTRAINT `client_connector_crawler_ibfk_1` FOREIGN KEY (`client_id`, `connector_id`) REFERENCES `client_connector` (`client_id`, `connector_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `client_connector_edi`
--

DROP TABLE IF EXISTS `client_connector_edi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `client_connector_edi` (
  `client_id` int(10) unsigned NOT NULL,
  `connector_id` int(10) unsigned NOT NULL,
  `path` varchar(500) NOT NULL,
  `key` varchar(100) DEFAULT NULL,
  `prefix` varchar(100) DEFAULT NULL,
  `suffix` varchar(100) DEFAULT NULL,
  `extension` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`client_id`,`connector_id`),
  CONSTRAINT `fk_client_connector_edi_client_connector1` FOREIGN KEY (`client_id`, `connector_id`) REFERENCES `client_connector` (`client_id`, `connector_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `client_connector_edi_extra_path`
--

DROP TABLE IF EXISTS `client_connector_edi_extra_path`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `client_connector_edi_extra_path` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `client_id` int(10) unsigned NOT NULL,
  `connector_id` int(10) unsigned NOT NULL,
  `path` varchar(500) NOT NULL,
  `key` varchar(100) DEFAULT NULL,
  `prefix` varchar(100) DEFAULT NULL,
  `suffix` varchar(100) DEFAULT NULL,
  `extension` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `client_id` (`client_id`,`connector_id`),
  CONSTRAINT `fx_01` FOREIGN KEY (`client_id`, `connector_id`) REFERENCES `client_connector_edi` (`client_id`, `connector_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `client_connector_edi_tivit`
--

DROP TABLE IF EXISTS `client_connector_edi_tivit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `client_connector_edi_tivit` (
  `client_id` int(10) unsigned NOT NULL,
  `connector_id` int(10) unsigned NOT NULL,
  `mailbox` varchar(100) NOT NULL,
  `mailbox_password` varchar(100) NOT NULL,
  PRIMARY KEY (`client_id`,`connector_id`),
  CONSTRAINT `fk_client_connector_edi_tivit_client_connector_edi` FOREIGN KEY (`client_id`, `connector_id`) REFERENCES `client_connector_edi` (`client_id`, `connector_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `client_connector_extra_contract`
--

DROP TABLE IF EXISTS `client_connector_extra_contract`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `client_connector_extra_contract` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `client_id` int(10) unsigned NOT NULL,
  `connector_id` int(10) unsigned NOT NULL,
  `contract_code` decimal(15,0) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_client_connector_extra_contract_client_connector1_idx` (`client_id`,`connector_id`),
  CONSTRAINT `fk_client_connector_extra_contract_client_connector1` FOREIGN KEY (`client_id`, `connector_id`) REFERENCES `client_connector` (`client_id`, `connector_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=107 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `client_connector_pagador`
--

DROP TABLE IF EXISTS `client_connector_pagador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `client_connector_pagador` (
  `client_id` int(10) unsigned NOT NULL,
  `connector_id` int(10) unsigned NOT NULL,
  `establishmentCode` varchar(50) DEFAULT NULL,
  `merchantId` varchar(50) NOT NULL,
  PRIMARY KEY (`client_id`,`connector_id`),
  CONSTRAINT `client_connector_pagador_ibfk_1` FOREIGN KEY (`client_id`, `connector_id`) REFERENCES `client_connector` (`client_id`, `connector_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `client_connector_rest`
--

DROP TABLE IF EXISTS `client_connector_rest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `client_connector_rest` (
  `client_id` int(10) unsigned NOT NULL,
  `connector_id` int(10) unsigned NOT NULL,
  `key` varchar(500) NOT NULL,
  `user` varchar(64) DEFAULT NULL,
  `port` decimal(5,0) DEFAULT NULL,
  PRIMARY KEY (`client_id`,`connector_id`),
  CONSTRAINT `fk_client_connector_rest_client_connector` FOREIGN KEY (`client_id`, `connector_id`) REFERENCES `client_connector` (`client_id`, `connector_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `client_connector_sales_system`
--

DROP TABLE IF EXISTS `client_connector_sales_system`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `client_connector_sales_system` (
  `client_id` int(10) unsigned NOT NULL,
  `connector_id` int(10) unsigned NOT NULL,
  `close_period_detection` decimal(1,0) NOT NULL DEFAULT '1',
  PRIMARY KEY (`client_id`,`connector_id`),
  CONSTRAINT `fk_client_connector_edi_client_connector10` FOREIGN KEY (`client_id`, `connector_id`) REFERENCES `client_connector` (`client_id`, `connector_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `client_connector_sitef_provider`
--

DROP TABLE IF EXISTS `client_connector_sitef_provider`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `client_connector_sitef_provider` (
  `client_id` int(10) unsigned NOT NULL,
  `connector_id` int(10) unsigned NOT NULL,
  `provider_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`client_id`,`connector_id`),
  KEY `provider_id` (`provider_id`),
  CONSTRAINT `client_connector_sitef_provider_ibfk_1` FOREIGN KEY (`client_id`, `connector_id`) REFERENCES `client_connector` (`client_id`, `connector_id`),
  CONSTRAINT `client_connector_sitef_provider_ibfk_3` FOREIGN KEY (`provider_id`) REFERENCES `provider` (`provider_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `client_connector_status`
--

DROP TABLE IF EXISTS `client_connector_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `client_connector_status` (
  `client_id` int(10) unsigned NOT NULL,
  `connector_id` int(10) unsigned NOT NULL,
  `processing_status_id` int(10) unsigned NOT NULL,
  `status_detail` varchar(500) DEFAULT NULL,
  `first_processed_datetime` datetime DEFAULT NULL,
  `last_processed_datetime` datetime DEFAULT NULL,
  `control_status_id` decimal(2,0) NOT NULL DEFAULT '0',
  `control_last_date` date DEFAULT NULL,
  `reprocessing` tinyint(1) DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`client_id`,`connector_id`),
  KEY `fk_client_connector_status_processing_status1_idx` (`processing_status_id`),
  CONSTRAINT `fk_client_connector_status_client_connector1` FOREIGN KEY (`client_id`, `connector_id`) REFERENCES `client_connector` (`client_id`, `connector_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_client_connector_status_processing_status1` FOREIGN KEY (`processing_status_id`) REFERENCES `processing_status` (`processing_status_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `client_connector_status_detail`
--

DROP TABLE IF EXISTS `client_connector_status_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `client_connector_status_detail` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `client_id` int(10) unsigned NOT NULL,
  `connector_id` int(10) unsigned NOT NULL,
  `date` date NOT NULL,
  `external_id` varchar(30) DEFAULT NULL,
  `status_id` decimal(2,0) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `status_id` (`status_id`,`client_id`,`connector_id`),
  KEY `client_connector_status_detail_ibfk_1_idx` (`client_id`,`connector_id`),
  CONSTRAINT `client_connector_status_detail_ibfk_1` FOREIGN KEY (`client_id`, `connector_id`) REFERENCES `client_connector_status` (`client_id`, `connector_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1549629 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `client_connector_status_log`
--

DROP TABLE IF EXISTS `client_connector_status_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `client_connector_status_log` (
  `client_connector_status_log_id` int(10) unsigned NOT NULL,
  `client_id` int(10) unsigned NOT NULL,
  `connector_id` int(10) unsigned NOT NULL,
  `processing_status_id` int(10) unsigned NOT NULL,
  `closed_date` date DEFAULT NULL,
  `inserted_at` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`client_connector_status_log_id`),
  KEY `fk_client_connector_status_log_processing_status1_idx` (`processing_status_id`),
  KEY `fk_client_connector_status_log_client_connector_status1_idx` (`client_id`,`connector_id`),
  CONSTRAINT `fk_client_connector_status_log_client_connector_status1` FOREIGN KEY (`client_id`, `connector_id`) REFERENCES `client_connector_status` (`client_id`, `connector_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_client_connector_status_log_processing_status1` FOREIGN KEY (`processing_status_id`) REFERENCES `processing_status` (`processing_status_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `client_customization`
--

DROP TABLE IF EXISTS `client_customization`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `client_customization` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `client_id` int(10) unsigned NOT NULL,
  `client_customization_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_client_customization_client_customization_type_idx` (`client_customization_id`),
  CONSTRAINT `fk_client_customization_client_customization_type` FOREIGN KEY (`client_customization_id`) REFERENCES `client_customization_type` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1029 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `client_customization_type`
--

DROP TABLE IF EXISTS `client_customization_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `client_customization_type` (
  `id` int(11) unsigned NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `client_dashboard`
--

DROP TABLE IF EXISTS `client_dashboard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `client_dashboard` (
  `client_id` int(10) unsigned NOT NULL,
  `total_sales` decimal(32,2) NOT NULL DEFAULT '0.00',
  `total_fee` decimal(38,2) NOT NULL DEFAULT '0.00',
  `settlement_value` decimal(15,2) NOT NULL DEFAULT '0.00',
  `credit_sales_value` decimal(15,2) DEFAULT '0.00',
  `avg_days` smallint(6) DEFAULT NULL,
  `debit_sales_value` decimal(15,2) DEFAULT '0.00',
  `outher_debits_value` decimal(15,2) DEFAULT '0.00',
  `future_value` decimal(15,2) DEFAULT '0.00',
  `outher_credits_value` decimal(15,2) DEFAULT '0.00',
  `anticipation_simulation_value` decimal(15,2) DEFAULT '0.00',
  `updated_at` datetime DEFAULT NULL,
  `anticipation_value` decimal(15,2) DEFAULT '0.00',
  `cancellations_value` decimal(15,2) DEFAULT '0.00',
  `chargebacks_value` decimal(15,2) DEFAULT '0.00',
  PRIMARY KEY (`client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `client_external_id`
--

DROP TABLE IF EXISTS `client_external_id`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `client_external_id` (
  `client_id` int(10) unsigned NOT NULL,
  `external_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`client_id`),
  CONSTRAINT `client_external_id_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `client` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `client_notprocessing_alert`
--

DROP TABLE IF EXISTS `client_notprocessing_alert`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `client_notprocessing_alert` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `client_id` int(10) unsigned NOT NULL,
  `providers` varchar(50) DEFAULT NULL,
  `emails` varchar(512) DEFAULT NULL,
  `check_time` time DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `notified_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `active` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `Idx_providers` (`client_id`,`providers`),
  CONSTRAINT `FK_client_unprocessing_alert_client` FOREIGN KEY (`client_id`) REFERENCES `client` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `client_processing_notification`
--

DROP TABLE IF EXISTS `client_processing_notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `client_processing_notification` (
  `client_id` int(10) unsigned NOT NULL,
  `provider_id` int(10) unsigned NOT NULL,
  `emails` varchar(512) NOT NULL,
  `active` tinyint(3) unsigned DEFAULT '1',
  `last_connection_id` int(10) unsigned DEFAULT '1',
  `notified_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`client_id`,`provider_id`),
  KEY `FK_alert_conciliation_client_provider` (`provider_id`),
  CONSTRAINT `FK_alert_conciliation_client_client` FOREIGN KEY (`client_id`) REFERENCES `client` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_alert_conciliation_client_provider` FOREIGN KEY (`provider_id`) REFERENCES `provider` (`provider_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `client_provider_composition`
--

DROP TABLE IF EXISTS `client_provider_composition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `client_provider_composition` (
  `client_id` int(10) unsigned NOT NULL,
  `provider_id` int(10) unsigned NOT NULL,
  `last_date` date NOT NULL,
  `status` decimal(2,0) DEFAULT NULL,
  `server_id` decimal(5,0) DEFAULT NULL,
  PRIMARY KEY (`client_id`,`provider_id`),
  KEY `provider_id` (`provider_id`),
  KEY `ix_vooo_prod_backend_client_provider_composition_last_date` (`last_date`),
  KEY `ix_vooo_prod_backend_client_provider_composition_status` (`status`),
  KEY `ix_vooo_prod_backend_client_provider_composition_server_id` (`server_id`),
  CONSTRAINT `client_provider_composition_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `client` (`id`),
  CONSTRAINT `client_provider_composition_ibfk_2` FOREIGN KEY (`provider_id`) REFERENCES `provider` (`provider_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `client_service`
--

DROP TABLE IF EXISTS `client_service`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `client_service` (
  `client_id` int(10) unsigned NOT NULL,
  `service_id` int(10) unsigned NOT NULL,
  `service_init` datetime NOT NULL,
  `processing_status_id` int(10) unsigned NOT NULL,
  `status_detail` varchar(500) DEFAULT NULL,
  `headquarter_status_id` int(10) unsigned DEFAULT NULL,
  `headquarter_status_detail` varchar(500) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`client_id`,`service_id`),
  KEY `fk_client_service_client_service_status1_idx` (`processing_status_id`),
  KEY `fk_client_service_service1_idx` (`service_id`),
  KEY `fk_client_service_processing_status1_idx` (`headquarter_status_id`),
  CONSTRAINT `fk_client_service_client1` FOREIGN KEY (`client_id`) REFERENCES `client` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_client_service_client_service_status1` FOREIGN KEY (`processing_status_id`) REFERENCES `processing_status` (`processing_status_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_client_service_processing_status1` FOREIGN KEY (`headquarter_status_id`) REFERENCES `processing_status` (`processing_status_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_client_service_service1` FOREIGN KEY (`service_id`) REFERENCES `service` (`service_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `client_token_time_expire`
--

DROP TABLE IF EXISTS `client_token_time_expire`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `client_token_time_expire` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `client_id` int(10) unsigned DEFAULT NULL,
  `user_id` int(11) unsigned DEFAULT NULL,
  `seconds_to_expire` int(11) DEFAULT NULL,
  `description` varchar(150) DEFAULT 'Tempo customizado para usuário/cliente',
  PRIMARY KEY (`id`),
  UNIQUE KEY `client_id_UNIQUE` (`client_id`),
  UNIQUE KEY `user_id_UNIQUE` (`user_id`),
  CONSTRAINT `fk_token_expire_client` FOREIGN KEY (`client_id`) REFERENCES `client` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_token_expire_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `client_user`
--

DROP TABLE IF EXISTS `client_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `client_user` (
  `id_client` int(10) unsigned NOT NULL,
  `id_user` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  PRIMARY KEY (`id_client`,`id_user`),
  KEY `fk_user` (`id_user`),
  CONSTRAINT `fk_client` FOREIGN KEY (`id_client`) REFERENCES `client` (`id`),
  CONSTRAINT `fk_user` FOREIGN KEY (`id_user`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `company`
--

DROP TABLE IF EXISTS `company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `company` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `id_type` int(11) NOT NULL,
  `id_client` int(11) DEFAULT NULL,
  `id_provider` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_company_type__company_idx` (`id_type`),
  CONSTRAINT `fk_company_type__company` FOREIGN KEY (`id_type`) REFERENCES `company_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `company_type`
--

DROP TABLE IF EXISTS `company_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `company_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `connect_item_btg`
--

DROP TABLE IF EXISTS `connect_item_btg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `connect_item_btg` (
  `item_id` int(10) unsigned NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `connection`
--

DROP TABLE IF EXISTS `connection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `connection` (
  `connection_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `client_id` int(10) unsigned NOT NULL,
  `connector_id` int(10) unsigned NOT NULL,
  `connection_status_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned DEFAULT NULL,
  `init_datetime` datetime NOT NULL,
  `end_datetime` datetime DEFAULT NULL,
  `end_reconciliation` datetime DEFAULT NULL,
  `item_qty` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`connection_id`),
  KEY `status_id` (`connection_status_id`),
  KEY `fk_connection_client_connector1_idx` (`connector_id`,`client_id`),
  KEY `fk_connection_user1_idx` (`user_id`),
  CONSTRAINT `connection_sub_interaction_ibfk_2` FOREIGN KEY (`connection_status_id`) REFERENCES `connection_status` (`connection_status_id`),
  CONSTRAINT `fk_connection_client_connector1` FOREIGN KEY (`client_id`, `connector_id`) REFERENCES `client_connector` (`client_id`, `connector_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_connection_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=161315516 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `connection_crawler`
--

DROP TABLE IF EXISTS `connection_crawler`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `connection_crawler` (
  `connection_id` int(10) unsigned NOT NULL,
  `reference_init_datetime` datetime NOT NULL,
  `reference_end_datetime` datetime NOT NULL,
  `html` varchar(300) NOT NULL,
  PRIMARY KEY (`connection_id`),
  CONSTRAINT `connection_crawler_ibfk_1` FOREIGN KEY (`connection_id`) REFERENCES `connection` (`connection_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `connection_edi`
--

DROP TABLE IF EXISTS `connection_edi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `connection_edi` (
  `connection_id` int(10) unsigned NOT NULL,
  `path` varchar(500) NOT NULL,
  `file` varchar(200) NOT NULL,
  PRIMARY KEY (`connection_id`),
  KEY `idx_1` (`file`),
  CONSTRAINT `fk_connection_edi_connection1` FOREIGN KEY (`connection_id`) REFERENCES `connection` (`connection_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `connection_error`
--

DROP TABLE IF EXISTS `connection_error`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `connection_error` (
  `connection_error_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `connection_id` int(10) unsigned NOT NULL,
  `connection_error_desc_id` int(10) unsigned DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `connection_position` int(10) DEFAULT NULL,
  PRIMARY KEY (`connection_error_id`),
  KEY `fk_connection_error_connection1_idx` (`connection_id`),
  KEY `fk_connection_error_connection_error_desc1_idx` (`connection_error_desc_id`),
  CONSTRAINT `fk_connection_error_connection1` FOREIGN KEY (`connection_id`) REFERENCES `connection` (`connection_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_connection_error_connection_error_desc1` FOREIGN KEY (`connection_error_desc_id`) REFERENCES `connection_error_desc` (`connection_error_desc_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=19119310 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `connection_error_desc`
--

DROP TABLE IF EXISTS `connection_error_desc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `connection_error_desc` (
  `connection_error_desc_id` int(10) unsigned NOT NULL,
  `name` varchar(75) NOT NULL,
  `description` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`connection_error_desc_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `connection_item`
--

DROP TABLE IF EXISTS `connection_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `connection_item` (
  `item_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `connection_id` int(10) unsigned NOT NULL,
  `connection_position` int(10) NOT NULL,
  `client_branch_id` int(10) unsigned DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `reconciliated` decimal(1,0) DEFAULT '0',
  PRIMARY KEY (`item_id`),
  KEY `fk_connection_item_connection1_idx` (`connection_id`),
  KEY `fk_connection_item_client1_idx` (`client_branch_id`),
  KEY `idx_reconciliated` (`reconciliated`),
  CONSTRAINT `fk_connection_item_client1` FOREIGN KEY (`client_branch_id`) REFERENCES `client` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_connection_item_connection1` FOREIGN KEY (`connection_id`) REFERENCES `connection` (`connection_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=950731660 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `connection_rest`
--

DROP TABLE IF EXISTS `connection_rest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `connection_rest` (
  `connection_id` int(10) unsigned NOT NULL,
  `reference_init_datetime` datetime NOT NULL,
  `reference_end_datetime` datetime NOT NULL,
  `end_point` varchar(500) NOT NULL,
  `key_md5` varchar(32) NOT NULL,
  `response_code` decimal(5,0) DEFAULT NULL,
  `response_error_message` varchar(100) DEFAULT NULL,
  `response_md5` varchar(32) DEFAULT NULL,
  `duplicate_records` int(10) unsigned DEFAULT '0',
  `url` varchar(500) DEFAULT NULL,
  `key_hashed` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`connection_id`),
  KEY `fk_connection_edi_connection1_idx` (`connection_id`),
  CONSTRAINT `fk_connection_rest_connection10` FOREIGN KEY (`connection_id`) REFERENCES `connection` (`connection_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `connection_sales_lot`
--

DROP TABLE IF EXISTS `connection_sales_lot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `connection_sales_lot` (
  `connection_id` int(10) unsigned NOT NULL,
  `hash_code` varchar(45) NOT NULL,
  `return_message` varchar(20000) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`connection_id`),
  KEY `fk_connection_edi_connection1_idx` (`connection_id`),
  KEY `hash_code` (`hash_code`),
  CONSTRAINT `fk_connection_edi_connection10` FOREIGN KEY (`connection_id`) REFERENCES `connection` (`connection_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `connection_sales_system`
--

DROP TABLE IF EXISTS `connection_sales_system`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `connection_sales_system` (
  `connection_id` int(10) unsigned NOT NULL,
  `call_type` varchar(1) NOT NULL,
  `authorization` varchar(550) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `establishment_code` varchar(60) DEFAULT NULL,
  `merchant_id` varchar(60) NOT NULL,
  `status_description` varchar(100) NOT NULL,
  `page_size` decimal(10,0) NOT NULL,
  `expected_total_pages` decimal(10,0) NOT NULL,
  `expected_total_transactions` decimal(10,0) NOT NULL,
  `realized_total_pages` decimal(10,0) NOT NULL,
  `realized_total_transactions` decimal(10,0) NOT NULL,
  `inserted_transactions` decimal(10,0) NOT NULL,
  `canceled_transactions` decimal(10,0) NOT NULL,
  `duplicated_transactions` decimal(10,0) NOT NULL,
  `other_payment_method_transactions` decimal(10,0) NOT NULL DEFAULT '0',
  PRIMARY KEY (`connection_id`),
  CONSTRAINT `connection_sales_system_ibfk_1` FOREIGN KEY (`connection_id`) REFERENCES `connection` (`connection_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `connection_status`
--

DROP TABLE IF EXISTS `connection_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `connection_status` (
  `connection_status_id` int(10) unsigned NOT NULL,
  `name` varchar(75) NOT NULL,
  `description` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`connection_status_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `connector`
--

DROP TABLE IF EXISTS `connector`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `connector` (
  `connector_id` int(10) unsigned NOT NULL,
  `connector_type_id` int(10) unsigned NOT NULL,
  `provider_id` int(10) unsigned NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` varchar(100) DEFAULT NULL,
  `periodicity` varchar(2) NOT NULL,
  `periodicity_last_datetime` datetime DEFAULT NULL,
  `external_code_id` int(10) unsigned DEFAULT NULL,
  `periodicity_week_day` decimal(1,0) DEFAULT NULL,
  `working_days` decimal(1,0) DEFAULT '0',
  `connector_package` varchar(128) DEFAULT NULL,
  `connector_class_name` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`connector_id`),
  KEY `fk_connector_provider1_idx` (`provider_id`),
  KEY `fk_connector_connector_type1_idx` (`connector_type_id`),
  CONSTRAINT `fk_connector_connector_type1` FOREIGN KEY (`connector_type_id`) REFERENCES `connector_type` (`connector_type_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_connector_provider1` FOREIGN KEY (`provider_id`) REFERENCES `provider` (`provider_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `connector_authorizer`
--

DROP TABLE IF EXISTS `connector_authorizer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `connector_authorizer` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `connector_crawler`
--

DROP TABLE IF EXISTS `connector_crawler`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `connector_crawler` (
  `connector_id` int(10) unsigned NOT NULL,
  `url` varchar(300) NOT NULL,
  `start_frame_time` time DEFAULT NULL,
  `end_frame_time` time DEFAULT NULL,
  PRIMARY KEY (`connector_id`),
  CONSTRAINT `connector_crawler_ibfk_1` FOREIGN KEY (`connector_id`) REFERENCES `connector` (`connector_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `connector_edi`
--

DROP TABLE IF EXISTS `connector_edi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `connector_edi` (
  `connector_id` int(10) unsigned NOT NULL,
  `file_prefix` varchar(100) NOT NULL,
  `extension` varchar(45) NOT NULL,
  PRIMARY KEY (`connector_id`),
  CONSTRAINT `fk_connnector_edi_connector1` FOREIGN KEY (`connector_id`) REFERENCES `connector` (`connector_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `connector_rest`
--

DROP TABLE IF EXISTS `connector_rest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `connector_rest` (
  `connector_id` int(10) unsigned NOT NULL,
  `url` varchar(300) NOT NULL,
  `start_frame_time` time DEFAULT NULL,
  `end_frame_time` time DEFAULT NULL,
  PRIMARY KEY (`connector_id`),
  CONSTRAINT `fk_connnector_edi_connector10` FOREIGN KEY (`connector_id`) REFERENCES `connector` (`connector_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `connector_rest_credential`
--

DROP TABLE IF EXISTS `connector_rest_credential`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `connector_rest_credential` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `connector_id` int(10) unsigned DEFAULT NULL,
  `client_id` int(10) unsigned DEFAULT NULL,
  `id_aggregator` int(10) DEFAULT NULL,
  `username` varchar(120) COLLATE utf8_bin DEFAULT NULL,
  `password` varchar(120) COLLATE utf8_bin DEFAULT NULL,
  `economic_group` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `connector_id` (`connector_id`) USING BTREE,
  KEY `client_id` (`client_id`) USING BTREE,
  KEY `FK_connector_rest_credential_aggregator` (`id_aggregator`) USING BTREE,
  CONSTRAINT `FK_connector_rest_credential_aggregator` FOREIGN KEY (`id_aggregator`) REFERENCES `aggregator` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `connector_rest_credential_ibfk_1` FOREIGN KEY (`connector_id`) REFERENCES `connector` (`connector_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `connector_rest_credential_ibfk_2` FOREIGN KEY (`client_id`) REFERENCES `client` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `connector_settlement_bank`
--

DROP TABLE IF EXISTS `connector_settlement_bank`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `connector_settlement_bank` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `connector_id` int(10) unsigned NOT NULL,
  `pattern` varchar(100) NOT NULL,
  `provider_id` int(10) unsigned NOT NULL,
  `payment_method_id` int(10) unsigned NOT NULL,
  `card_flag_id` int(10) unsigned NOT NULL,
  `output_settlement_type_id` int(10) unsigned NOT NULL,
  `status_id` decimal(2,0) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `connector_id` (`connector_id`),
  KEY `provider_id` (`provider_id`),
  KEY `payment_method_id` (`payment_method_id`),
  KEY `card_flag_id` (`card_flag_id`),
  KEY `output_settlement_type_id` (`output_settlement_type_id`),
  CONSTRAINT `connector_settlement_bank_ibfk_1` FOREIGN KEY (`connector_id`) REFERENCES `connector` (`connector_id`),
  CONSTRAINT `connector_settlement_bank_ibfk_2` FOREIGN KEY (`provider_id`) REFERENCES `provider` (`provider_id`),
  CONSTRAINT `connector_settlement_bank_ibfk_3` FOREIGN KEY (`payment_method_id`) REFERENCES `payment_method` (`payment_method_id`),
  CONSTRAINT `connector_settlement_bank_ibfk_4` FOREIGN KEY (`card_flag_id`) REFERENCES `card_flag` (`card_flag_id`),
  CONSTRAINT `connector_settlement_bank_ibfk_5` FOREIGN KEY (`output_settlement_type_id`) REFERENCES `output_settlement_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `connector_type`
--

DROP TABLE IF EXISTS `connector_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `connector_type` (
  `connector_type_id` int(10) unsigned NOT NULL,
  `name` varchar(75) NOT NULL,
  `description` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`connector_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `contact`
--

DROP TABLE IF EXISTS `contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contact` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `id_company` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_contact__company_idx` (`id_company`),
  CONSTRAINT `fk_contact__company` FOREIGN KEY (`id_company`) REFERENCES `company` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=225 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `contact_emails`
--

DROP TABLE IF EXISTS `contact_emails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contact_emails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(45) NOT NULL,
  `id_contact` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_contact_emails__contact_idx` (`id_contact`),
  CONSTRAINT `fk_contact_emails__contact` FOREIGN KEY (`id_contact`) REFERENCES `contact` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=216 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `contact_others`
--

DROP TABLE IF EXISTS `contact_others`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contact_others` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(250) NOT NULL,
  `id_contact` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_contact_others__contact_idx` (`id_contact`),
  CONSTRAINT `fk_contact_others__contact` FOREIGN KEY (`id_contact`) REFERENCES `contact` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `contact_phones`
--

DROP TABLE IF EXISTS `contact_phones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contact_phones` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `number` varchar(15) NOT NULL,
  `id_contact` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_contact_phones__contact_idx` (`id_contact`),
  CONSTRAINT `fk_contact_phones__contact` FOREIGN KEY (`id_contact`) REFERENCES `contact` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `daily_reports_rates`
--

DROP TABLE IF EXISTS `daily_reports_rates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `daily_reports_rates` (
  `client_id` int(10) unsigned NOT NULL,
  `year` int(11) NOT NULL,
  `month` int(11) NOT NULL,
  `day` int(11) NOT NULL,
  `payment_method_id` int(11) NOT NULL,
  `provider_id` int(11) NOT NULL,
  `gross_value` decimal(32,2) NOT NULL DEFAULT '0.00',
  `fee_value` decimal(32,2) NOT NULL DEFAULT '0.00',
  `fee_rate` decimal(32,2) NOT NULL DEFAULT '0.00',
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`client_id`,`year`,`month`,`payment_method_id`,`provider_id`,`day`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `daily_reports_receipts`
--

DROP TABLE IF EXISTS `daily_reports_receipts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `daily_reports_receipts` (
  `client_id` int(10) unsigned NOT NULL,
  `year` int(11) NOT NULL,
  `month` int(11) NOT NULL,
  `day` int(11) NOT NULL,
  `provider_id` int(11) NOT NULL,
  `bank_account_mask` varchar(25) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `net_value` decimal(32,2) NOT NULL DEFAULT '0.00',
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`client_id`,`year`,`month`,`provider_id`,`day`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `daily_reports_sales`
--

DROP TABLE IF EXISTS `daily_reports_sales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `daily_reports_sales` (
  `client_id` int(10) unsigned NOT NULL,
  `year` int(11) NOT NULL,
  `month` int(11) NOT NULL,
  `day` int(11) NOT NULL,
  `recognized` decimal(32,2) NOT NULL DEFAULT '0.00',
  `recognized_count` decimal(32,2) NOT NULL DEFAULT '0.00',
  `recognized_media` decimal(32,2) NOT NULL DEFAULT '0.00',
  `registered` decimal(32,2) NOT NULL DEFAULT '0.00',
  `registered_count` decimal(32,2) NOT NULL DEFAULT '0.00',
  `registered_media` decimal(32,2) NOT NULL DEFAULT '0.00',
  `conciled` decimal(32,2) NOT NULL DEFAULT '0.00',
  `conciled_count` decimal(32,2) NOT NULL DEFAULT '0.00',
  `conciled_media` decimal(32,2) NOT NULL DEFAULT '0.00',
  `not_recognized` decimal(32,2) NOT NULL DEFAULT '0.00',
  `not_recognized_count` decimal(32,2) NOT NULL DEFAULT '0.00',
  `not_recognized_media` decimal(32,2) NOT NULL DEFAULT '0.00',
  `not_registered` decimal(32,2) NOT NULL DEFAULT '0.00',
  `not_registered_count` decimal(32,2) NOT NULL DEFAULT '0.00',
  `not_registered_media` decimal(32,2) NOT NULL DEFAULT '0.00',
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`client_id`,`year`,`month`,`day`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `data_source`
--

DROP TABLE IF EXISTS `data_source`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `data_source` (
  `id` int(11) NOT NULL,
  `data_source_type_id` int(11) unsigned NOT NULL DEFAULT '1',
  `name` varchar(45) NOT NULL,
  `description` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_type` (`data_source_type_id`),
  CONSTRAINT `fk_type` FOREIGN KEY (`data_source_type_id`) REFERENCES `data_source_type` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `data_source_connector`
--

DROP TABLE IF EXISTS `data_source_connector`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `data_source_connector` (
  `data_source_id` int(11) NOT NULL,
  `connector_id` int(10) unsigned NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`data_source_id`,`connector_id`),
  KEY `fk_connector_idx` (`connector_id`),
  KEY `fk_data_source_idx` (`data_source_id`),
  CONSTRAINT `fk_connector` FOREIGN KEY (`connector_id`) REFERENCES `connector` (`connector_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_data_source` FOREIGN KEY (`data_source_id`) REFERENCES `data_source` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `data_source_type`
--

DROP TABLE IF EXISTS `data_source_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `data_source_type` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `document`
--

DROP TABLE IF EXISTS `document`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `document` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `number` decimal(20,0) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2291 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `economic_group`
--

DROP TABLE IF EXISTS `economic_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `economic_group` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fee_execution_control`
--

DROP TABLE IF EXISTS `fee_execution_control`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fee_execution_control` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `file_name` varchar(100) DEFAULT NULL,
  `client_id` int(10) unsigned DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `provider_id` int(10) unsigned DEFAULT NULL,
  `payment_method_id` int(10) unsigned DEFAULT NULL,
  `r_installment_type_id` int(10) unsigned DEFAULT NULL,
  `card_flag_id` int(10) unsigned DEFAULT NULL,
  `contract_code` int(10) unsigned DEFAULT NULL,
  `status` decimal(1,0) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fee_execution_setting`
--

DROP TABLE IF EXISTS `fee_execution_setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fee_execution_setting` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fee_execution_control_id` int(10) unsigned NOT NULL,
  `client_id` int(10) unsigned DEFAULT NULL,
  `provider_id` int(10) unsigned DEFAULT NULL,
  `payment_method_id` int(10) unsigned DEFAULT NULL,
  `installment_type_id` int(10) unsigned DEFAULT NULL,
  `contract_code` int(10) unsigned DEFAULT NULL,
  `card_flag_id` int(10) unsigned DEFAULT NULL,
  `fee_rate` decimal(5,4) DEFAULT NULL,
  `std_dev` decimal(5,4) DEFAULT NULL,
  `registers` decimal(10,0) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fee_execution_control_id` (`fee_execution_control_id`),
  CONSTRAINT `fee_execution_setting_ibfk_1` FOREIGN KEY (`fee_execution_control_id`) REFERENCES `fee_execution_control` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4697 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `files_aws_s3_bucket`
--

DROP TABLE IF EXISTS `files_aws_s3_bucket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `files_aws_s3_bucket` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `type_id` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_aws_s3_bucket_aws_s3_type_idx` (`type_id`),
  CONSTRAINT `fk_aws_s3_bucket_aws_s3_type` FOREIGN KEY (`type_id`) REFERENCES `files_aws_s3_bucket_type` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COLLATE=latin1_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `files_aws_s3_bucket_type`
--

DROP TABLE IF EXISTS `files_aws_s3_bucket_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `files_aws_s3_bucket_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COLLATE=latin1_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `files_aws_s3_client`
--

DROP TABLE IF EXISTS `files_aws_s3_client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `files_aws_s3_client` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `bucket_id` int(11) unsigned NOT NULL,
  `client_id` int(11) NOT NULL,
  `folder_name` varchar(300) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`),
  KEY `client_id` (`client_id`),
  KEY `fk_aws_s3_client_aws_s3_bucket_idx` (`bucket_id`),
  CONSTRAINT `fk_aws_s3_client_aws_s3_bucket` FOREIGN KEY (`bucket_id`) REFERENCES `files_aws_s3_bucket` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3463 DEFAULT CHARSET=latin1 COLLATE=latin1_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `files_aws_s3_control`
--

DROP TABLE IF EXISTS `files_aws_s3_control`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `files_aws_s3_control` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `client_folder_id` int(10) unsigned NOT NULL,
  `file` varchar(300) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_aws_s3_control_aws_s3_client_idx` (`client_folder_id`),
  CONSTRAINT `fk_aws_s3_control_aws_s3_client` FOREIGN KEY (`client_folder_id`) REFERENCES `files_aws_s3_client` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=122192 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `files_control_action`
--

DROP TABLE IF EXISTS `files_control_action`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `files_control_action` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `files_control_vector_id` bigint(20) NOT NULL,
  `file_name` varchar(100) NOT NULL,
  `file_datetime` datetime NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `files_control_vector_id` (`files_control_vector_id`),
  CONSTRAINT `files_control_action_ibfk_1` FOREIGN KEY (`files_control_vector_id`) REFERENCES `files_control_vector` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9570186 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `files_control_control`
--

DROP TABLE IF EXISTS `files_control_control`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `files_control_control` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `start_at` datetime NOT NULL,
  `files_processed` int(11) NOT NULL,
  `end_at` datetime DEFAULT NULL,
  `end_status` varchar(1) DEFAULT NULL,
  `server_id` decimal(10,0) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=808849 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `files_control_vector`
--

DROP TABLE IF EXISTS `files_control_vector`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `files_control_vector` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `path_from` varchar(100) NOT NULL,
  `path_to` varchar(100) NOT NULL,
  `created_at` datetime NOT NULL,
  `start_at` datetime DEFAULT NULL,
  `key_filter` varchar(100) DEFAULT NULL,
  `key_extension` varchar(10) DEFAULT NULL,
  `zip_files_in` smallint(6) DEFAULT '0',
  `move_files_in` smallint(6) DEFAULT '0',
  `insert_extension` varchar(10) DEFAULT NULL,
  `status` decimal(1,0) NOT NULL,
  `type` varchar(50) DEFAULT NULL,
  `server_id` decimal(10,0) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1405 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `files_control_vector_ftp`
--

DROP TABLE IF EXISTS `files_control_vector_ftp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `files_control_vector_ftp` (
  `id` bigint(20) NOT NULL,
  `host` varchar(500) NOT NULL,
  `port` decimal(10,0) DEFAULT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `key_filename` varchar(255) DEFAULT NULL,
  `ftp_type` varchar(2) NOT NULL,
  `filter_by_contract_code` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  CONSTRAINT `files_control_vector_ftp_ibfk_1` FOREIGN KEY (`id`) REFERENCES `files_control_vector` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `files_original_path`
--

DROP TABLE IF EXISTS `files_original_path`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `files_original_path` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `connector_id` int(11) NOT NULL,
  `path` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL DEFAULT 'origem',
  `origin_server` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=218 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `generic_layout`
--

DROP TABLE IF EXISTS `generic_layout`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `generic_layout` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `client_id` int(10) DEFAULT NULL,
  `name` varchar(60) NOT NULL,
  `provider_id` int(10) unsigned NOT NULL,
  `extract_type` tinyint(3) unsigned NOT NULL,
  `source_type` tinyint(3) unsigned NOT NULL,
  `field_delimiter` char(1) NOT NULL DEFAULT ';',
  `text_delimiter` char(1) NOT NULL DEFAULT '"',
  `extension` varchar(5) NOT NULL,
  `date_format` varchar(30) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `hash` text CHARACTER SET utf8 COLLATE utf8_bin,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `generic_layout_connect_fields`
--

DROP TABLE IF EXISTS `generic_layout_connect_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `generic_layout_connect_fields` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `layout_id` int(10) unsigned DEFAULT NULL,
  `generic_layout_field_id` int(10) unsigned DEFAULT NULL,
  `field_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_layout_id` (`layout_id`),
  KEY `FK_generic_field_id` (`generic_layout_field_id`),
  CONSTRAINT `FK_generic_field_id` FOREIGN KEY (`generic_layout_field_id`) REFERENCES `generic_layout_fields` (`id`) ON UPDATE NO ACTION,
  CONSTRAINT `FK_layout_id` FOREIGN KEY (`layout_id`) REFERENCES `generic_layout` (`id`) ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1923 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `generic_layout_fields`
--

DROP TABLE IF EXISTS `generic_layout_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `generic_layout_fields` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `field_name` varchar(50) DEFAULT NULL,
  `display` varchar(50) DEFAULT NULL,
  `required` tinyint(1) DEFAULT '0',
  `mapped_table` varchar(50) DEFAULT '',
  `mapped_key` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `generic_layout_map_values`
--

DROP TABLE IF EXISTS `generic_layout_map_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `generic_layout_map_values` (
  `layout_id` int(10) unsigned NOT NULL,
  `field_id` int(10) unsigned NOT NULL,
  `field_value` varchar(50) NOT NULL DEFAULT '',
  `mapped_value` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`layout_id`,`field_id`,`field_value`),
  KEY `FK_generic_layout_map_values_generic_layout_connect_fields` (`field_id`),
  CONSTRAINT `FK_generic_layout_map_values_generic_layout_connect_fields` FOREIGN KEY (`field_id`) REFERENCES `generic_layout_connect_fields` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `generic_layout_upload`
--

DROP TABLE IF EXISTS `generic_layout_upload`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `generic_layout_upload` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `layout_id` int(10) unsigned DEFAULT NULL,
  `original_filename` varchar(120) DEFAULT NULL,
  `connector_filename` varchar(120) DEFAULT NULL,
  `uploaded_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_layout_upload` (`layout_id`) USING BTREE,
  CONSTRAINT `fk_layout_upload` FOREIGN KEY (`layout_id`) REFERENCES `generic_layout` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1037 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `group`
--

DROP TABLE IF EXISTS `group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `group` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `label` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `level` tinyint(4) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `group_bkp`
--

DROP TABLE IF EXISTS `group_bkp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `group_bkp` (
  `id` int(10) unsigned NOT NULL DEFAULT '0',
  `label` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `level` tinyint(4) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mcc_base`
--

DROP TABLE IF EXISTS `mcc_base`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mcc_base` (
  `code` decimal(4,0) unsigned NOT NULL,
  `description` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `under_6041` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mercadopago_transacao31.03`
--

DROP TABLE IF EXISTS `mercadopago_transacao31.03`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mercadopago_transacao31.03` (
  `trxMercadopago` bigint(20) NOT NULL,
  `trxShellbox` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `monthly_reports_rates`
--

DROP TABLE IF EXISTS `monthly_reports_rates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `monthly_reports_rates` (
  `client_id` int(10) unsigned NOT NULL,
  `year` int(11) NOT NULL,
  `month` int(11) NOT NULL,
  `payment_method_id` int(11) NOT NULL,
  `provider_id` int(11) NOT NULL,
  `gross_value` decimal(32,2) NOT NULL DEFAULT '0.00',
  `fee_value` decimal(32,2) NOT NULL DEFAULT '0.00',
  `fee_rate` decimal(32,2) NOT NULL DEFAULT '0.00',
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`client_id`,`year`,`month`,`payment_method_id`,`provider_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `monthly_reports_receipts`
--

DROP TABLE IF EXISTS `monthly_reports_receipts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `monthly_reports_receipts` (
  `client_id` int(10) unsigned NOT NULL,
  `year` int(11) NOT NULL,
  `month` int(11) NOT NULL,
  `provider_id` int(11) NOT NULL,
  `bank_account_mask` varchar(25) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `net_value` decimal(32,2) NOT NULL DEFAULT '0.00',
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`client_id`,`year`,`month`,`provider_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `monthly_reports_sales`
--

DROP TABLE IF EXISTS `monthly_reports_sales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `monthly_reports_sales` (
  `client_id` int(10) unsigned NOT NULL,
  `year` int(11) NOT NULL,
  `month` int(11) NOT NULL,
  `recognized` decimal(32,2) NOT NULL DEFAULT '0.00',
  `recognized_count` decimal(32,2) NOT NULL DEFAULT '0.00',
  `recognized_media` decimal(32,2) NOT NULL DEFAULT '0.00',
  `registered` decimal(32,2) NOT NULL DEFAULT '0.00',
  `registered_count` decimal(32,2) NOT NULL DEFAULT '0.00',
  `registered_media` decimal(32,2) NOT NULL DEFAULT '0.00',
  `conciled` decimal(32,2) NOT NULL DEFAULT '0.00',
  `conciled_count` decimal(32,2) NOT NULL DEFAULT '0.00',
  `conciled_media` decimal(32,2) NOT NULL DEFAULT '0.00',
  `not_recognized` decimal(32,2) NOT NULL DEFAULT '0.00',
  `not_recognized_count` decimal(32,2) NOT NULL DEFAULT '0.00',
  `not_recognized_media` decimal(32,2) NOT NULL DEFAULT '0.00',
  `not_registered` decimal(32,2) NOT NULL DEFAULT '0.00',
  `not_registered_count` decimal(32,2) NOT NULL DEFAULT '0.00',
  `not_registered_media` decimal(32,2) NOT NULL DEFAULT '0.00',
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`client_id`,`year`,`month`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `nespresso_converter`
--

DROP TABLE IF EXISTS `nespresso_converter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nespresso_converter` (
  `txn_id_code` varchar(20) NOT NULL,
  `description` varchar(100) NOT NULL,
  PRIMARY KEY (`txn_id_code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `output`
--

DROP TABLE IF EXISTS `output`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `output` (
  `id` int(10) unsigned NOT NULL,
  `service_id` int(10) unsigned NOT NULL,
  `name` varchar(75) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `periodicity` varchar(1) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_output_service1_idx` (`service_id`),
  CONSTRAINT `fk_output_service1` FOREIGN KEY (`service_id`) REFERENCES `service` (`service_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `output_agenda`
--

DROP TABLE IF EXISTS `output_agenda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `output_agenda` (
  `id` int(10) unsigned NOT NULL,
  `settlement_date` date NOT NULL,
  `accrual_date` date NOT NULL,
  `gross_value` decimal(10,2) NOT NULL,
  `net_value` decimal(10,2) NOT NULL,
  `fee_value` decimal(10,2) NOT NULL,
  `fee_rate` decimal(5,4) NOT NULL,
  `event_id` decimal(3,0) NOT NULL,
  `event_name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `event_lot_code` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `event_lot_length` decimal(6,0) NOT NULL DEFAULT '1',
  `installment` decimal(2,0) DEFAULT NULL,
  `payment_installments` decimal(2,0) DEFAULT NULL,
  `bank_account_mask` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `provider_event_id` decimal(4,0) DEFAULT NULL,
  `provider_event_description` varchar(75) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status_id` decimal(2,0) NOT NULL,
  `expected_settlement_date` date DEFAULT NULL,
  `realized_settlement_date` date DEFAULT NULL,
  `term_status_id` decimal(1,0) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_event_lot_code` (`event_lot_code`),
  KEY `idx_oytput_agenda_term_status` (`term_status_id`),
  KEY `event_id` (`event_id`,`status_id`,`settlement_date`),
  KEY `idx_output_agenda_status_id` (`status_id`,`settlement_date`),
  KEY `idx_accrual_date_event_id` (`accrual_date`,`event_id`),
  CONSTRAINT `fk_output_anticipation_sum_output_reconciliation211` FOREIGN KEY (`id`) REFERENCES `output_reconciliation` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `output_agenda_reversal`
--

DROP TABLE IF EXISTS `output_agenda_reversal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `output_agenda_reversal` (
  `output_agenda_id` int(10) unsigned NOT NULL,
  `output_reversal_id` int(10) unsigned NOT NULL,
  `gross_value` decimal(10,2) NOT NULL,
  `fee_value` decimal(10,2) NOT NULL,
  `net_value` decimal(10,2) NOT NULL,
  `fee_rate` decimal(5,4) NOT NULL,
  `status_id` decimal(2,0) NOT NULL DEFAULT '-1',
  `connection_item_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`output_agenda_id`,`output_reversal_id`),
  KEY `fk_output_agenda_reversal_output_reversal1_idx` (`output_reversal_id`),
  KEY `fk_output_agenda_reversal_connection_item1_idx` (`connection_item_id`),
  CONSTRAINT `fk_output_agenda_reversal_connection_item1` FOREIGN KEY (`connection_item_id`) REFERENCES `connection_item` (`item_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_output_agenda_reversal_output_agenda1` FOREIGN KEY (`output_agenda_id`) REFERENCES `output_agenda` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_output_agenda_reversal_output_reversal1` FOREIGN KEY (`output_reversal_id`) REFERENCES `output_reversal` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `output_agenda_sales`
--

DROP TABLE IF EXISTS `output_agenda_sales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `output_agenda_sales` (
  `output_agenda_id` int(10) unsigned NOT NULL,
  `output_sales_id` int(10) unsigned NOT NULL,
  `gross_value` decimal(10,2) NOT NULL,
  `fee_value` decimal(10,2) NOT NULL,
  `net_value` decimal(10,2) NOT NULL,
  `fee_rate` decimal(5,4) NOT NULL,
  `installment` decimal(2,0) NOT NULL DEFAULT '1',
  `settlement_date` date NOT NULL,
  `gross_adjust` decimal(10,2) DEFAULT NULL,
  `net_adjust` decimal(10,2) DEFAULT NULL,
  `gross_sales_difference` decimal(10,2) DEFAULT NULL,
  `net_sales_difference` decimal(10,2) DEFAULT NULL,
  `status_id` decimal(2,0) NOT NULL DEFAULT '-1',
  `connection_item_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`output_agenda_id`,`output_sales_id`),
  KEY `fk_output_agenda_sales_output_sales1_idx` (`output_sales_id`),
  KEY `idx_agenda_sales_01` (`output_sales_id`,`installment`),
  KEY `fk_output_agenda_sales_connection_item1_idx` (`connection_item_id`),
  CONSTRAINT `fk_output_agenda_sales_connection_item1` FOREIGN KEY (`connection_item_id`) REFERENCES `connection_item` (`item_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_output_agenda_sales_output_agenda1` FOREIGN KEY (`output_agenda_id`) REFERENCES `output_agenda` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_output_agenda_sales_output_sales1` FOREIGN KEY (`output_sales_id`) REFERENCES `output_sales` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `output_agenda_settlement`
--

DROP TABLE IF EXISTS `output_agenda_settlement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `output_agenda_settlement` (
  `output_agenda_id` int(10) unsigned NOT NULL,
  `output_settlement_id` int(10) unsigned NOT NULL,
  `output_anticipation_id` int(10) unsigned NOT NULL,
  `status_id` decimal(1,0) NOT NULL,
  `settlement_date` date NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`output_agenda_id`,`output_settlement_id`,`output_anticipation_id`),
  KEY `output_settlement_id` (`output_settlement_id`),
  KEY `output_anticipation_id` (`output_anticipation_id`),
  CONSTRAINT `output_agenda_settlement_ibfk_1` FOREIGN KEY (`output_agenda_id`) REFERENCES `output_agenda` (`id`),
  CONSTRAINT `output_agenda_settlement_ibfk_2` FOREIGN KEY (`output_settlement_id`) REFERENCES `output_settlement` (`id`),
  CONSTRAINT `output_agenda_settlement_ibfk_3` FOREIGN KEY (`output_anticipation_id`) REFERENCES `output_anticipation` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `output_agenda_settlement_reference`
--

DROP TABLE IF EXISTS `output_agenda_settlement_reference`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `output_agenda_settlement_reference` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `output_agenda_id` int(10) unsigned NOT NULL,
  `output_settlement_id` int(10) unsigned DEFAULT NULL,
  `output_anticipation_id` int(10) unsigned DEFAULT NULL,
  `output_unschedule_id` int(10) unsigned DEFAULT NULL,
  `status_id` decimal(1,0) NOT NULL,
  `settlement_date` date NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_output_agenda_settlement_reference` (`output_agenda_id`,`output_settlement_id`,`output_anticipation_id`),
  KEY `output_settlement_id` (`output_settlement_id`),
  KEY `output_anticipation_id` (`output_anticipation_id`),
  KEY `output_unschedule_id` (`output_unschedule_id`),
  CONSTRAINT `output_agenda_settlement_reference_ibfk_1` FOREIGN KEY (`output_agenda_id`) REFERENCES `output_agenda` (`id`),
  CONSTRAINT `output_agenda_settlement_reference_ibfk_2` FOREIGN KEY (`output_settlement_id`) REFERENCES `output_settlement` (`id`),
  CONSTRAINT `output_agenda_settlement_reference_ibfk_3` FOREIGN KEY (`output_anticipation_id`) REFERENCES `output_anticipation` (`id`),
  CONSTRAINT `output_agenda_settlement_reference_ibfk_4` FOREIGN KEY (`output_unschedule_id`) REFERENCES `output_unschedule` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=161143632 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `output_alert`
--

DROP TABLE IF EXISTS `output_alert`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `output_alert` (
  `id` int(11) NOT NULL,
  `name` varchar(75) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `alert_type` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `output_anticipation`
--

DROP TABLE IF EXISTS `output_anticipation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `output_anticipation` (
  `id` int(10) unsigned NOT NULL,
  `anticipation_date` date NOT NULL,
  `bank_account_mask` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `original_date` date NOT NULL,
  `original_gross_value` decimal(10,2) NOT NULL,
  `transaction_fee_value` decimal(10,2) NOT NULL DEFAULT '0.00',
  `original_net_value` decimal(10,2) NOT NULL,
  `anticipation_fee_value` decimal(10,2) NOT NULL DEFAULT '0.00',
  `anticipation_value` decimal(10,2) NOT NULL,
  `discounted_value` decimal(10,2) NOT NULL,
  `anticipation_discounted_value` decimal(10,2) NOT NULL DEFAULT '0.00',
  `transaction_fee_rate` decimal(5,4) NOT NULL,
  `period_fee_rate` decimal(5,4) NOT NULL,
  `monthly_fee_rate` decimal(5,4) NOT NULL,
  `sales_date` date NOT NULL,
  `event_lot_code` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `event_lot_length` decimal(6,0) NOT NULL,
  `installment` decimal(2,0) NOT NULL,
  `payment_installments` decimal(2,0) NOT NULL,
  `operation_code` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status_id` decimal(2,0) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_output_anticipation_1` (`event_lot_code`),
  CONSTRAINT `fk_output_anticipation_output_reconciliation1` FOREIGN KEY (`id`) REFERENCES `output_reconciliation` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `output_composition`
--

DROP TABLE IF EXISTS `output_composition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `output_composition` (
  `id` int(10) unsigned NOT NULL,
  `initial_gross_value` decimal(10,2) NOT NULL,
  `initial_net_value` decimal(10,2) NOT NULL,
  `sales_gross_value` decimal(10,2) NOT NULL,
  `sales_net_value` decimal(10,2) NOT NULL,
  `reversal_gross_value` decimal(10,2) NOT NULL,
  `reversal_net_value` decimal(10,2) NOT NULL,
  `settlement_gross_value` decimal(10,2) NOT NULL,
  `settlement_net_value` decimal(10,2) NOT NULL,
  `anticipation_gross_value` decimal(10,2) NOT NULL,
  `anticipation_net_value` decimal(10,2) NOT NULL,
  `adjusts_gross_value` decimal(10,2) NOT NULL,
  `adjusts_net_value` decimal(10,2) NOT NULL,
  `backward_gross_value` decimal(10,2) NOT NULL,
  `backward_net_value` decimal(10,2) NOT NULL,
  `divergence_gross_value` decimal(10,2) NOT NULL,
  `divergence_net_value` decimal(10,2) NOT NULL,
  `final_gross_value` decimal(10,2) NOT NULL,
  `final_net_value` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `output_composition_ibfk_1` FOREIGN KEY (`id`) REFERENCES `output_reconciliation` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `output_composition_item`
--

DROP TABLE IF EXISTS `output_composition_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `output_composition_item` (
  `id` int(10) unsigned NOT NULL,
  `output_id` int(10) unsigned NOT NULL,
  `client_id` int(10) unsigned NOT NULL,
  `provider_id` int(10) unsigned NOT NULL,
  `item_date` date NOT NULL,
  `status_id` decimal(2,0) NOT NULL,
  `referenced_by` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `output_id` (`output_id`),
  KEY `provider_id` (`provider_id`),
  KEY `referenced_by` (`referenced_by`),
  KEY `output_composition_item_idx1` (`client_id`,`provider_id`,`status_id`,`item_date`),
  CONSTRAINT `output_composition_item_ibfk_1` FOREIGN KEY (`id`) REFERENCES `output_item` (`id`),
  CONSTRAINT `output_composition_item_ibfk_2` FOREIGN KEY (`output_id`) REFERENCES `output` (`id`),
  CONSTRAINT `output_composition_item_ibfk_3` FOREIGN KEY (`client_id`) REFERENCES `client` (`id`),
  CONSTRAINT `output_composition_item_ibfk_4` FOREIGN KEY (`provider_id`) REFERENCES `provider` (`provider_id`),
  CONSTRAINT `output_composition_item_ibfk_5` FOREIGN KEY (`referenced_by`) REFERENCES `output_item` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `output_connection_item`
--

DROP TABLE IF EXISTS `output_connection_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `output_connection_item` (
  `output_item_id` int(10) unsigned NOT NULL,
  `connection_item_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`output_item_id`,`connection_item_id`),
  KEY `fk_output_connection_item_connection_item1_idx` (`connection_item_id`),
  CONSTRAINT `fk_output_connection_item_connection_item1` FOREIGN KEY (`connection_item_id`) REFERENCES `connection_item` (`item_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_output_connection_item_output_item1` FOREIGN KEY (`output_item_id`) REFERENCES `output_item` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `output_connection_item_back`
--

DROP TABLE IF EXISTS `output_connection_item_back`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `output_connection_item_back` (
  `output_item_id` int(10) unsigned NOT NULL,
  `connection_item_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`output_item_id`,`connection_item_id`),
  KEY `connection_item_id` (`connection_item_id`),
  CONSTRAINT `output_connection_item_back_ibfk_1` FOREIGN KEY (`output_item_id`) REFERENCES `output_item` (`id`),
  CONSTRAINT `output_connection_item_back_ibfk_2` FOREIGN KEY (`connection_item_id`) REFERENCES `connection_item` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `output_copy_action`
--

DROP TABLE IF EXISTS `output_copy_action`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `output_copy_action` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `source_id` int(10) unsigned NOT NULL,
  `destination_id` int(10) unsigned NOT NULL,
  `from_client_id` int(10) unsigned NOT NULL,
  `to_client_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `source_id` (`source_id`),
  KEY `destination_id` (`destination_id`),
  KEY `from_client_id` (`from_client_id`),
  KEY `to_client_id` (`to_client_id`),
  CONSTRAINT `output_copy_action_ibfk_1` FOREIGN KEY (`source_id`) REFERENCES `output` (`id`),
  CONSTRAINT `output_copy_action_ibfk_2` FOREIGN KEY (`destination_id`) REFERENCES `output` (`id`),
  CONSTRAINT `output_copy_action_ibfk_3` FOREIGN KEY (`from_client_id`) REFERENCES `client` (`id`),
  CONSTRAINT `output_copy_action_ibfk_4` FOREIGN KEY (`to_client_id`) REFERENCES `client` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `output_copy_control`
--

DROP TABLE IF EXISTS `output_copy_control`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `output_copy_control` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `from_client_id` int(10) unsigned NOT NULL,
  `to_client_id` int(10) unsigned NOT NULL,
  `initial_date` date NOT NULL,
  `final_date` date NOT NULL,
  `provider_id` int(10) unsigned NOT NULL,
  `status_id` decimal(1,0) NOT NULL,
  `done_until_date` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `from_client_id` (`from_client_id`),
  KEY `to_client_id` (`to_client_id`),
  KEY `provider_id` (`provider_id`),
  CONSTRAINT `output_copy_control_ibfk_1` FOREIGN KEY (`from_client_id`) REFERENCES `client` (`id`),
  CONSTRAINT `output_copy_control_ibfk_2` FOREIGN KEY (`to_client_id`) REFERENCES `client` (`id`),
  CONSTRAINT `output_copy_control_ibfk_3` FOREIGN KEY (`provider_id`) REFERENCES `provider` (`provider_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `output_events_sum`
--

DROP TABLE IF EXISTS `output_events_sum`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `output_events_sum` (
  `id` int(10) unsigned NOT NULL,
  `accrual_date` date NOT NULL,
  `sign` varchar(1) COLLATE utf8_unicode_ci NOT NULL,
  `gross_value` decimal(10,2) NOT NULL,
  `net_value` decimal(10,2) NOT NULL,
  `fee_value` decimal(10,2) NOT NULL,
  `fee_rate` decimal(5,4) NOT NULL,
  `event_id` varchar(1) COLLATE utf8_unicode_ci NOT NULL,
  `event_name` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `status_id` varchar(1) COLLATE utf8_unicode_ci NOT NULL,
  `status_name` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_output_anticipation_sum_output_reconciliation12220` FOREIGN KEY (`id`) REFERENCES `output_reconciliation` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `output_item`
--

DROP TABLE IF EXISTS `output_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `output_item` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `output_id` int(10) unsigned NOT NULL,
  `client_id` int(10) unsigned NOT NULL,
  `headquarter_id` int(10) unsigned NOT NULL,
  `item_date` date DEFAULT NULL,
  `secondary_date` date DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_output_item_output1_idx` (`output_id`),
  KEY `fk_output_item_client1_idx` (`client_id`),
  KEY `fk_output_item_client2_idx` (`headquarter_id`),
  KEY `idx_output_item_headquarter_item_date` (`headquarter_id`,`output_id`,`item_date`),
  KEY `idx_output_item_cllient_item_date` (`client_id`,`item_date`),
  KEY `idx_output_item_cllient_update_date` (`client_id`,`updated_at`),
  KEY `idx_output_item_headquarter_update_date` (`headquarter_id`,`updated_at`),
  KEY `idx_output_item_100` (`output_id`,`client_id`,`item_date`),
  KEY `idx_output_item_101` (`output_id`,`client_id`,`updated_at`),
  KEY `idx_output_item_102` (`output_id`,`headquarter_id`,`item_date`),
  KEY `idx_output_item_103` (`output_id`,`headquarter_id`,`updated_at`),
  KEY `idx_output_item_104` (`updated_at`),
  KEY `idx_output_item_105` (`output_id`,`client_id`,`secondary_date`),
  KEY `idx_output_item_106` (`output_id`,`headquarter_id`,`secondary_date`),
  CONSTRAINT `fk_output_item_client1` FOREIGN KEY (`client_id`) REFERENCES `client` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_output_item_client2` FOREIGN KEY (`headquarter_id`) REFERENCES `client` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_output_item_output1` FOREIGN KEY (`output_id`) REFERENCES `output` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=625330320 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `output_item_composition_reference`
--

DROP TABLE IF EXISTS `output_item_composition_reference`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `output_item_composition_reference` (
  `id` int(10) unsigned NOT NULL,
  `output_id` int(10) unsigned NOT NULL,
  `client_id` int(10) unsigned NOT NULL,
  `provider_id` int(10) unsigned NOT NULL,
  `item_date` date NOT NULL,
  `status_id` decimal(2,0) NOT NULL,
  `output_composition_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `output_id` (`output_id`),
  KEY `provider_id` (`provider_id`),
  KEY `output_composition_item_idx1` (`client_id`,`provider_id`,`status_id`,`item_date`),
  KEY `ix_vooo_prod_backend_output_item_composition_reference_o_84c1` (`output_composition_id`),
  CONSTRAINT `output_item_composition_reference_ibfk_1` FOREIGN KEY (`id`) REFERENCES `output_item` (`id`),
  CONSTRAINT `output_item_composition_reference_ibfk_2` FOREIGN KEY (`output_id`) REFERENCES `output` (`id`),
  CONSTRAINT `output_item_composition_reference_ibfk_3` FOREIGN KEY (`client_id`) REFERENCES `client` (`id`),
  CONSTRAINT `output_item_composition_reference_ibfk_4` FOREIGN KEY (`provider_id`) REFERENCES `provider` (`provider_id`),
  CONSTRAINT `output_item_composition_reference_ibfk_5` FOREIGN KEY (`output_composition_id`) REFERENCES `output_composition` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `output_manual_conciliation`
--

DROP TABLE IF EXISTS `output_manual_conciliation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `output_manual_conciliation` (
  `output_sales_id` int(10) unsigned NOT NULL,
  `manual_conciliation_date` date DEFAULT NULL,
  `reversable` decimal(1,0) unsigned DEFAULT NULL,
  `user_id` int(10) unsigned DEFAULT NULL,
  `sales_id_discard` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`output_sales_id`),
  CONSTRAINT `fk_manual_conciliation_output_item` FOREIGN KEY (`output_sales_id`) REFERENCES `output_item` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `output_outstanding`
--

DROP TABLE IF EXISTS `output_outstanding`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `output_outstanding` (
  `id` int(10) unsigned NOT NULL,
  `outstanding_date` date NOT NULL,
  `settlement_date` date NOT NULL,
  `accrual_date` date DEFAULT NULL,
  `gross_value` decimal(10,2) NOT NULL,
  `fee_value` decimal(10,2) NOT NULL,
  `net_value` decimal(10,2) NOT NULL,
  `anticipation_value` decimal(10,2) NOT NULL,
  `outstanding_value` decimal(10,2) NOT NULL,
  `fee_rate` decimal(5,4) NOT NULL,
  `event_id` decimal(2,0) NOT NULL,
  `event_name` varchar(30) NOT NULL,
  `event_lot_code` varchar(64) NOT NULL,
  `event_lot_length` decimal(6,0) NOT NULL,
  `installment` decimal(2,0) DEFAULT NULL,
  `payment_installments` decimal(2,0) DEFAULT NULL,
  `status_id` decimal(2,0) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `output_outstanding_ibfk_1` FOREIGN KEY (`id`) REFERENCES `output_reconciliation` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `output_reconciliation`
--

DROP TABLE IF EXISTS `output_reconciliation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `output_reconciliation` (
  `id` int(10) unsigned NOT NULL,
  `reconciliation_date` date DEFAULT NULL,
  `payment_method_id` int(10) unsigned NOT NULL,
  `provider_id` int(10) unsigned NOT NULL,
  `card_flag_id` int(10) unsigned NOT NULL,
  `payment_channel_id` int(10) unsigned DEFAULT '0',
  `contract_code` decimal(15,0) DEFAULT NULL,
  `uuid` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `provider_source` varchar(200) CHARACTER SET utf8 DEFAULT NULL,
  `provider_source_line` decimal(10,0) DEFAULT NULL,
  `provider_lot_code` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_reconciliation_output_payment_method1_idx` (`payment_method_id`),
  KEY `fk_reconciliation_output_provider1_idx` (`provider_id`),
  KEY `fk_reconciliation_output_card_flag1_idx` (`card_flag_id`),
  KEY `fk_reconciliation_output_message` (`uuid`),
  KEY `fk_output_reconciliation_payment_channel1_idx` (`payment_channel_id`),
  CONSTRAINT `fk_output_anticipation_output_item1` FOREIGN KEY (`id`) REFERENCES `output_item` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_output_reconciliation_payment_channel1` FOREIGN KEY (`payment_channel_id`) REFERENCES `payment_channel` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_reconciliation_output_card_flag1` FOREIGN KEY (`card_flag_id`) REFERENCES `card_flag` (`card_flag_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_reconciliation_output_payment_method1` FOREIGN KEY (`payment_method_id`) REFERENCES `payment_method` (`payment_method_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_reconciliation_output_provider1` FOREIGN KEY (`provider_id`) REFERENCES `provider` (`provider_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `output_reconciliation_alert`
--

DROP TABLE IF EXISTS `output_reconciliation_alert`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `output_reconciliation_alert` (
  `output_reconciliation_id` int(10) unsigned NOT NULL,
  `output_alert_id` int(11) NOT NULL,
  `message` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`output_reconciliation_id`,`output_alert_id`),
  KEY `fk_output_reconciliation_alerts_output_alert1_idx` (`output_alert_id`),
  CONSTRAINT `fk_output_reconciliation_alerts_output_alert1` FOREIGN KEY (`output_alert_id`) REFERENCES `output_alert` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_output_reconciliation_alerts_output_reconciliation1` FOREIGN KEY (`output_reconciliation_id`) REFERENCES `output_reconciliation` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `output_reference`
--

DROP TABLE IF EXISTS `output_reference`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `output_reference` (
  `referenced_id` int(10) unsigned NOT NULL,
  `referrer_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`referenced_id`,`referrer_id`),
  KEY `fk_output_reference_output_item2_idx` (`referrer_id`),
  KEY `fk_output_reference_output_item1_idx` (`referenced_id`),
  CONSTRAINT `fk_output_reference_output_item1` FOREIGN KEY (`referenced_id`) REFERENCES `output_item` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_output_reference_output_item2` FOREIGN KEY (`referrer_id`) REFERENCES `output_item` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `output_report_files`
--

DROP TABLE IF EXISTS `output_report_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `output_report_files` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `client_id` int(11) unsigned NOT NULL,
  `creation_date` datetime NOT NULL,
  `initial_date` date NOT NULL,
  `final_date` date DEFAULT NULL,
  `report_id` int(10) unsigned NOT NULL,
  `report_type` varchar(50) COLLATE latin1_bin NOT NULL,
  `provider_list_names` varchar(512) COLLATE latin1_bin DEFAULT NULL,
  `file_type` varchar(45) COLLATE latin1_bin DEFAULT NULL,
  `file_path` varchar(512) COLLATE latin1_bin NOT NULL,
  PRIMARY KEY (`id`),
  KEY `client_id` (`client_id`),
  KEY `report_id` (`report_id`),
  KEY `creation_date` (`creation_date`),
  CONSTRAINT `output_report_files_2_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `client` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=27069 DEFAULT CHARSET=latin1 COLLATE=latin1_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `output_report_files_type`
--

DROP TABLE IF EXISTS `output_report_files_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `output_report_files_type` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `output_reversal`
--

DROP TABLE IF EXISTS `output_reversal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `output_reversal` (
  `id` int(10) unsigned NOT NULL,
  `sales_code` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `payment_code` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `payment_date` date NOT NULL,
  `payment_installments` decimal(2,0) NOT NULL,
  `credit_card_mask` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `authorization_code` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `provider_code` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `provider_code_extra` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `txn_id_code` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `payment_value` decimal(10,2) NOT NULL,
  `reversal_value` decimal(10,2) NOT NULL,
  `reversal_registred_value` decimal(10,2) NOT NULL DEFAULT '0.00',
  `reversal_date` date NOT NULL,
  `status_id` tinyint(2) NOT NULL DEFAULT '1',
  `event_id` decimal(3,0) NOT NULL,
  `event_name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `provider_event_id` decimal(4,0) DEFAULT NULL,
  `provider_event_description` varchar(75) CHARACTER SET utf8 DEFAULT NULL,
  `event_lot_code` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `sales_lot_code` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `output_sales_id` int(10) unsigned DEFAULT NULL,
  `sales_status_id` decimal(2,0) NOT NULL,
  `agenda_status_id` decimal(2,0) NOT NULL,
  `agenda_gross_value` decimal(10,2) NOT NULL,
  `agenda_net_value` decimal(10,2) NOT NULL,
  `output_reversal_adjusts_id` int(10) unsigned DEFAULT NULL,
  `terminal_id` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `vendor_document` decimal(20,0) DEFAULT NULL,
  `descount_sb` decimal(10,2) NOT NULL DEFAULT '0.00',
  `sb_compliment_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `REVERSAL_KEY1_x` (`authorization_code`,`provider_code`,`reversal_date`,`provider_event_id`),
  KEY `fk_output_reversal_output_reversal_adjusts1_idx_x` (`output_reversal_adjusts_id`),
  KEY `idx_output_reversal_output_sales_id` (`output_sales_id`),
  CONSTRAINT `fk_output_reversal_output_reversal_adjusts1` FOREIGN KEY (`output_reversal_adjusts_id`) REFERENCES `output_reversal_adjusts` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_output_reversal_reconciliation` FOREIGN KEY (`id`) REFERENCES `output_reconciliation` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_output_sales_id` FOREIGN KEY (`output_sales_id`) REFERENCES `output_sales` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `output_reversal_adjusts`
--

DROP TABLE IF EXISTS `output_reversal_adjusts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `output_reversal_adjusts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `payment_date` date DEFAULT NULL,
  `payment_value` decimal(10,2) DEFAULT NULL,
  `payment_installments` decimal(2,0) DEFAULT NULL,
  `credit_card_mask` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `authorization_code` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `provider_code` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `provider_code_extra` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=612944 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `output_reversal_bin`
--

DROP TABLE IF EXISTS `output_reversal_bin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `output_reversal_bin` (
  `output_reversal_id` int(10) unsigned NOT NULL,
  `card_bin_base_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`output_reversal_id`),
  KEY `fk_output_sales_bin_copy1_card_bin_base1_idx` (`card_bin_base_id`),
  CONSTRAINT `fk_output_sales_bin_copy1_card_bin_base1` FOREIGN KEY (`card_bin_base_id`) REFERENCES `card_bin_base` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_output_sales_bin_copy1_output_reversal1` FOREIGN KEY (`output_reversal_id`) REFERENCES `output_reversal` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `output_sales`
--

DROP TABLE IF EXISTS `output_sales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `output_sales` (
  `id` int(10) unsigned NOT NULL,
  `sales_code` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `payment_code` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `payment_date` date NOT NULL,
  `payment_time` time NOT NULL,
  `gross_value` decimal(10,2) NOT NULL,
  `net_value` decimal(10,2) NOT NULL,
  `fee_value` decimal(10,2) NOT NULL,
  `fee_rate` decimal(5,4) NOT NULL,
  `payment_installments` decimal(2,0) NOT NULL,
  `authorization_code` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `provider_code` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `provider_code_extra` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `txn_id_code` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `credit_card_mask` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `vendor_mcc` decimal(6,0) DEFAULT NULL,
  `vbv_transaction` tinyint(1) DEFAULT NULL,
  `vendor_document` decimal(20,0) DEFAULT NULL,
  `status_id` decimal(2,0) NOT NULL,
  `power_id` decimal(1,0) NOT NULL,
  `key_id` decimal(2,0) NOT NULL,
  `register_type_id` decimal(2,0) NOT NULL,
  `unity` decimal(1,0) NOT NULL,
  `approuched_date` decimal(1,0) NOT NULL,
  `event_lot_code` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `output_sales_adjusts_id` int(10) unsigned DEFAULT NULL,
  `terminal_id` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `administration_fee_value` decimal(10,2) DEFAULT '0.00',
  `administration_fare_value` decimal(10,2) DEFAULT '0.00',
  `interchange_fee_value` decimal(10,2) DEFAULT '0.00',
  `financial_fee_value` decimal(10,2) DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `fk_output_sales_output_fee_adjusts1_idx` (`output_sales_adjusts_id`),
  KEY `idx_output_sales_1` (`authorization_code`,`provider_code`),
  KEY `idx_output_sales_2` (`provider_code`,`provider_code_extra`),
  KEY `idx_output_sales_3` (`authorization_code`,`provider_code_extra`),
  KEY `idx_output_sales_4` (`sales_code`,`payment_code`),
  KEY `idx_output_sales_5` (`status_id`),
  KEY `idx_payment_code` (`payment_code`),
  CONSTRAINT `fK_sales_status` FOREIGN KEY (`status_id`) REFERENCES `output_sales_status` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_output_adjusts` FOREIGN KEY (`output_sales_adjusts_id`) REFERENCES `output_sales_adjusts` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_output_anticipation_sum_output_reconciliation1221` FOREIGN KEY (`id`) REFERENCES `output_reconciliation` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `output_sales_adjusts`
--

DROP TABLE IF EXISTS `output_sales_adjusts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `output_sales_adjusts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `client_id` int(10) unsigned DEFAULT NULL,
  `payment_method_id` int(10) unsigned DEFAULT NULL,
  `provider_id` int(10) unsigned DEFAULT NULL,
  `card_flag_id` int(10) unsigned DEFAULT NULL,
  `payment_date` date DEFAULT NULL,
  `payment_installments` decimal(2,0) DEFAULT NULL,
  `gross_value` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_output_fee_adjusts_payment_method1_idx` (`payment_method_id`),
  KEY `fk_output_fee_adjusts_provider1_idx` (`provider_id`),
  KEY `fk_output_fee_adjusts_card_flag1_idx` (`card_flag_id`),
  KEY `fk_output_sales_adjusts_client1_idx` (`client_id`),
  KEY `fk_output_sales_adjusts_date` (`payment_date`),
  CONSTRAINT `fk_output_fee_adjusts_card_flag1` FOREIGN KEY (`card_flag_id`) REFERENCES `card_flag` (`card_flag_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_output_fee_adjusts_payment_method1` FOREIGN KEY (`payment_method_id`) REFERENCES `payment_method` (`payment_method_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_output_fee_adjusts_provider1` FOREIGN KEY (`provider_id`) REFERENCES `provider` (`provider_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_output_sales_adjusts_client1` FOREIGN KEY (`client_id`) REFERENCES `client` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=8449544 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `output_sales_bin`
--

DROP TABLE IF EXISTS `output_sales_bin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `output_sales_bin` (
  `output_sales_id` int(10) unsigned NOT NULL,
  `card_bin_base_id` int(10) unsigned DEFAULT NULL,
  `r_card_bin_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`output_sales_id`),
  KEY `fk_output_sales_bin_card_bin_base1_idx` (`card_bin_base_id`),
  KEY `fk_output_sales_bin_r_card_bin1_idx` (`r_card_bin_id`),
  CONSTRAINT `fk_output_sales_bin_card_bin_base1` FOREIGN KEY (`card_bin_base_id`) REFERENCES `card_bin_base` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_output_sales_bin_output_sales1` FOREIGN KEY (`output_sales_id`) REFERENCES `output_sales` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_output_sales_bin_r_card_bin1` FOREIGN KEY (`r_card_bin_id`) REFERENCES `r_card_bin` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `output_sales_fee`
--

DROP TABLE IF EXISTS `output_sales_fee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `output_sales_fee` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `output_sales_id` int(10) unsigned NOT NULL,
  `status_id` decimal(2,0) NOT NULL,
  `r_fee_id` int(11) unsigned NOT NULL,
  `expected_fee_value` decimal(10,2) NOT NULL,
  `expected_charge_value` decimal(10,2) NOT NULL,
  `expected_upper_limit` decimal(10,2) DEFAULT NULL,
  `expected_total_value` decimal(10,2) NOT NULL,
  `realized_total_value` decimal(10,2) NOT NULL,
  `expected_total_rate` decimal(5,4) NOT NULL,
  `realized_total_rate` decimal(5,4) NOT NULL,
  `r_installment_type_id` int(11) unsigned DEFAULT NULL,
  `r_mcc_group_id` int(11) unsigned DEFAULT NULL,
  `r_card_category_id` int(11) unsigned DEFAULT NULL,
  `r_payment_channel_id` int(11) unsigned DEFAULT NULL,
  `fee_type` varchar(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'A',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_output_sales_fee_r_fee1_idx` (`r_fee_id`),
  KEY `fk_output_sales_fee_output_sales1_idx` (`output_sales_id`),
  KEY `fk_output_sales_fee_r_card_category1_idx` (`r_card_category_id`),
  KEY `fk_output_sales_fee_r_mcc_group1_idx` (`r_mcc_group_id`),
  KEY `fk_output_sales_fee_r_installment_type1_idx` (`r_installment_type_id`),
  KEY `fk_output_sales_fee_r_payment_channel1_idx` (`r_payment_channel_id`),
  KEY `fk_sales_fee_status` (`status_id`),
  CONSTRAINT `fk_output_sales_fee_output_sales1` FOREIGN KEY (`output_sales_id`) REFERENCES `output_sales` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_output_sales_fee_r_card_category1` FOREIGN KEY (`r_card_category_id`) REFERENCES `r_card_category` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_output_sales_fee_r_fee1` FOREIGN KEY (`r_fee_id`) REFERENCES `r_fee` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_output_sales_fee_r_installment_type1` FOREIGN KEY (`r_installment_type_id`) REFERENCES `r_installment_type` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_output_sales_fee_r_mcc_group1` FOREIGN KEY (`r_mcc_group_id`) REFERENCES `r_mcc_group` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_output_sales_fee_r_payment_channel1` FOREIGN KEY (`r_payment_channel_id`) REFERENCES `r_payment_channel` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_sales_fee_status` FOREIGN KEY (`status_id`) REFERENCES `sales_fee_status` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=271933476 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `output_sales_performance`
--

DROP TABLE IF EXISTS `output_sales_performance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `output_sales_performance` (
  `id` int(10) unsigned NOT NULL,
  `period_init` datetime NOT NULL,
  `period_end` datetime NOT NULL,
  `value` decimal(10,2) NOT NULL,
  `quantity` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_output_sales_performance_output_item1` FOREIGN KEY (`id`) REFERENCES `output_item` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `output_sales_settlement_item`
--

DROP TABLE IF EXISTS `output_sales_settlement_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `output_sales_settlement_item` (
  `output_sales_id` int(10) unsigned NOT NULL,
  `output_settlement_item_id` int(10) NOT NULL,
  `type` varchar(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'C',
  PRIMARY KEY (`output_sales_id`,`output_settlement_item_id`),
  KEY `fk_output_sales_settlement_output_settlement_item1_idx` (`output_settlement_item_id`),
  CONSTRAINT `fk_output_sales_settlement_output_sales1` FOREIGN KEY (`output_sales_id`) REFERENCES `output_sales` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_output_sales_settlement_output_settlement_item1` FOREIGN KEY (`output_settlement_item_id`) REFERENCES `output_settlement_item` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `output_sales_status`
--

DROP TABLE IF EXISTS `output_sales_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `output_sales_status` (
  `id` decimal(2,0) NOT NULL,
  `name` varchar(45) CHARACTER SET latin1 NOT NULL,
  `description` varchar(150) CHARACTER SET latin1 DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `output_settlement`
--

DROP TABLE IF EXISTS `output_settlement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `output_settlement` (
  `id` int(10) unsigned NOT NULL,
  `settlement_date` date NOT NULL,
  `accrual_date` date NOT NULL,
  `gross_value` decimal(10,2) NOT NULL,
  `net_value` decimal(10,2) NOT NULL,
  `fee_value` decimal(10,2) NOT NULL,
  `fee_rate` decimal(5,4) NOT NULL,
  `event_id` decimal(3,0) NOT NULL,
  `event_name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `event_lot_code` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `event_lot_length` decimal(6,0) NOT NULL DEFAULT '1',
  `installment` decimal(2,0) DEFAULT NULL,
  `payment_installments` decimal(2,0) DEFAULT NULL,
  `bank_account_mask` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `provider_event_id` decimal(4,0) DEFAULT NULL,
  `provider_event_description` varchar(75) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status_id` decimal(2,0) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_output_settlement_date` (`settlement_date`),
  KEY `idx_output_settlement_2` (`event_lot_code`),
  CONSTRAINT `fk_output_anticipation_sum_output_reconciliation1220` FOREIGN KEY (`id`) REFERENCES `output_reconciliation` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `output_settlement_bank`
--

DROP TABLE IF EXISTS `output_settlement_bank`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `output_settlement_bank` (
  `id` int(10) unsigned NOT NULL,
  `output_settlement_type_id` int(10) unsigned NOT NULL,
  `bank_id` decimal(3,0) NOT NULL,
  `bank_branch` decimal(6,0) NOT NULL,
  `bank_account` varchar(10) NOT NULL,
  `settlement_date` date DEFAULT NULL,
  `expected_value` decimal(10,2) NOT NULL,
  `realized_value` decimal(10,2) NOT NULL,
  `entry` varchar(15) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `document` varchar(30) DEFAULT NULL,
  `connector_settlement_bank_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `output_settlement_type_id` (`output_settlement_type_id`),
  KEY `bank_id` (`bank_id`),
  KEY `connector_settlement_bank_id` (`connector_settlement_bank_id`),
  CONSTRAINT `fk_output_settlement_bank_5` FOREIGN KEY (`connector_settlement_bank_id`) REFERENCES `connector_settlement_bank` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `output_settlement_bank_ibfk_1` FOREIGN KEY (`id`) REFERENCES `output_reconciliation` (`id`),
  CONSTRAINT `output_settlement_bank_ibfk_2` FOREIGN KEY (`output_settlement_type_id`) REFERENCES `output_settlement_type` (`id`),
  CONSTRAINT `output_settlement_bank_ibfk_3` FOREIGN KEY (`bank_id`) REFERENCES `bank` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `output_settlement_bank_pattern`
--

DROP TABLE IF EXISTS `output_settlement_bank_pattern`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `output_settlement_bank_pattern` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `bank_id` decimal(3,0) NOT NULL,
  `name` varchar(75) NOT NULL,
  `pattern` varchar(100) NOT NULL,
  `provider_id` int(10) unsigned NOT NULL,
  `card_flag_id` int(10) unsigned NOT NULL,
  `payment_channel_id` int(10) unsigned NOT NULL,
  `output_settlement_type_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `bank_id` (`bank_id`),
  KEY `provider_id` (`provider_id`),
  KEY `card_flag_id` (`card_flag_id`),
  KEY `payment_channel_id` (`payment_channel_id`),
  KEY `output_settlement_type_id` (`output_settlement_type_id`),
  CONSTRAINT `output_settlement_bank_pattern_ibfk_1` FOREIGN KEY (`bank_id`) REFERENCES `bank` (`id`),
  CONSTRAINT `output_settlement_bank_pattern_ibfk_2` FOREIGN KEY (`provider_id`) REFERENCES `provider` (`provider_id`),
  CONSTRAINT `output_settlement_bank_pattern_ibfk_3` FOREIGN KEY (`card_flag_id`) REFERENCES `card_flag` (`card_flag_id`),
  CONSTRAINT `output_settlement_bank_pattern_ibfk_4` FOREIGN KEY (`payment_channel_id`) REFERENCES `payment_channel` (`id`),
  CONSTRAINT `output_settlement_bank_pattern_ibfk_5` FOREIGN KEY (`output_settlement_type_id`) REFERENCES `output_settlement_type` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `output_settlement_files`
--

DROP TABLE IF EXISTS `output_settlement_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `output_settlement_files` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `client_id` int(11) unsigned NOT NULL,
  `creation_date` datetime NOT NULL,
  `initial_date` date NOT NULL,
  `final_date` date NOT NULL,
  `file_type` int(11) unsigned NOT NULL,
  `file_path` varchar(512) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `client_id` (`client_id`),
  CONSTRAINT `output_settlement_files_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `client` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `output_settlement_item`
--

DROP TABLE IF EXISTS `output_settlement_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `output_settlement_item` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `output_settlement_id` int(10) unsigned DEFAULT NULL,
  `output_anticipation_id` int(10) unsigned DEFAULT NULL,
  `output_sales_id` int(10) unsigned DEFAULT NULL,
  `output_reversal_id` int(10) unsigned DEFAULT NULL,
  `gross_value` decimal(10,2) NOT NULL,
  `fee_value` decimal(10,2) NOT NULL,
  `net_value` decimal(10,2) NOT NULL,
  `anticipation_fee_value` decimal(10,2) DEFAULT NULL,
  `settlement_value` decimal(10,2) DEFAULT NULL,
  `fee_rate` decimal(5,4) NOT NULL,
  `period_fee_rate` decimal(5,4) DEFAULT NULL,
  `monthly_fee_rate` decimal(5,4) DEFAULT NULL,
  `payment_date` date DEFAULT NULL,
  `payment_time` time DEFAULT NULL,
  `reversal_date` date DEFAULT NULL,
  `sales_code` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `payment_code` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `authorization_code` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `provider_code` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `provider_code_extra` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `credit_card_mask` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `payment_installments` decimal(2,0) DEFAULT NULL,
  `status_id` decimal(2,0) NOT NULL,
  `connection_item_id` int(10) unsigned DEFAULT NULL,
  `terminal_id` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `administration_fee_value` decimal(10,2) DEFAULT NULL,
  `interchange_fee_value` decimal(10,2) DEFAULT NULL,
  `financial_fee_value` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_output_settlement_sales_output_sales_idx` (`output_sales_id`),
  KEY `fk_output_settlement_sales_output_settlement_idx` (`output_settlement_id`),
  KEY `fk_output_settlement_sales_output_reversal1_idx` (`output_reversal_id`),
  KEY `fk_output_settlement_item_output_anticipation1_idx` (`output_anticipation_id`),
  KEY `fk_output_settlement_item_connection_item1_idx` (`connection_item_id`),
  KEY `uk_output_settlement_sales` (`output_settlement_id`,`output_sales_id`),
  CONSTRAINT `fk_output_settlement_item_connection_item1` FOREIGN KEY (`connection_item_id`) REFERENCES `connection_item` (`item_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_output_settlement_item_output_anticipation1` FOREIGN KEY (`output_anticipation_id`) REFERENCES `output_anticipation` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_output_settlement_sales_output_reversal1` FOREIGN KEY (`output_reversal_id`) REFERENCES `output_reversal` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_output_settlement_sales_output_sales1` FOREIGN KEY (`output_sales_id`) REFERENCES `output_sales` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_output_settlement_sales_output_settlement1` FOREIGN KEY (`output_settlement_id`) REFERENCES `output_settlement` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=359634544 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `output_settlement_type`
--

DROP TABLE IF EXISTS `output_settlement_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `output_settlement_type` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(75) NOT NULL,
  `description` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `output_statement`
--

DROP TABLE IF EXISTS `output_statement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `output_statement` (
  `id` int(10) unsigned NOT NULL,
  `statement_date` date NOT NULL,
  `expected_value` decimal(10,0) DEFAULT NULL,
  `realized_value` decimal(10,0) DEFAULT NULL,
  `statement_description` varchar(100) DEFAULT NULL,
  `statement_entry_code` varchar(20) DEFAULT NULL,
  `statement_agreement_code` decimal(16,0) DEFAULT NULL,
  `bank` decimal(3,0) DEFAULT NULL,
  `bank_branch` decimal(10,0) DEFAULT NULL,
  `bank_account` varchar(15) DEFAULT NULL,
  `status_id` decimal(2,0) DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `output_statement_ibfk_1` FOREIGN KEY (`id`) REFERENCES `output_reconciliation` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `output_unschedule`
--

DROP TABLE IF EXISTS `output_unschedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `output_unschedule` (
  `id` int(10) unsigned NOT NULL,
  `output_agenda_id` int(10) unsigned DEFAULT NULL,
  `status_id` decimal(1,0) NOT NULL,
  `event_lot_code` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `installment` decimal(2,0) NOT NULL,
  `payment_installments` decimal(2,0) NOT NULL,
  `gross_value` decimal(10,2) NOT NULL,
  `net_value` decimal(10,2) NOT NULL,
  `fee_value` decimal(10,2) NOT NULL,
  `payment_date` date NOT NULL,
  `unschedule_code` varchar(64) CHARACTER SET latin1 DEFAULT NULL,
  `unschedule_date` date NOT NULL,
  `unschedule_time` time NOT NULL,
  PRIMARY KEY (`id`),
  KEY `output_agenda_id` (`output_agenda_id`),
  KEY `event_lot_code` (`event_lot_code`),
  CONSTRAINT `output_unschedule_ibfk_1` FOREIGN KEY (`id`) REFERENCES `output_reconciliation` (`id`),
  CONSTRAINT `output_unschedule_ibfk_2` FOREIGN KEY (`output_agenda_id`) REFERENCES `output_agenda` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pagarme_payable_control`
--

DROP TABLE IF EXISTS `pagarme_payable_control`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pagarme_payable_control` (
  `id` int(11) NOT NULL,
  `transaction_id` int(11) DEFAULT NULL,
  `date_created` datetime NOT NULL,
  `payment_date` datetime NOT NULL,
  `original_payment_date` datetime DEFAULT NULL,
  `payment_method` varchar(36) DEFAULT NULL,
  `client_id` int(10) unsigned NOT NULL,
  `connector_id` int(10) unsigned DEFAULT NULL,
  `status` varchar(36) DEFAULT NULL,
  `type` varchar(36) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`,`client_id`),
  KEY `ix_pagarme_payable_control_transaction_id` (`transaction_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pagarme_transaction_control`
--

DROP TABLE IF EXISTS `pagarme_transaction_control`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pagarme_transaction_control` (
  `id` int(11) NOT NULL,
  `status` varchar(36) DEFAULT NULL,
  `client_id` int(10) unsigned NOT NULL,
  `connector_id` int(10) unsigned DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  `payment_method` varchar(32) DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `paid_amount` decimal(10,2) DEFAULT NULL,
  `refunded_amount` decimal(10,2) DEFAULT NULL,
  `authorized_amount` decimal(10,2) DEFAULT NULL,
  `cost` decimal(10,2) DEFAULT NULL,
  `installments` int(11) DEFAULT NULL,
  `authorization_code` varchar(128) DEFAULT NULL,
  `card_brand` varchar(32) DEFAULT NULL,
  `card_first_digits` varchar(6) DEFAULT NULL,
  `card_last_digits` varchar(4) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`,`client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pagseguro_control`
--

DROP TABLE IF EXISTS `pagseguro_control`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pagseguro_control` (
  `code` varchar(36) NOT NULL,
  `client_id` int(10) unsigned DEFAULT NULL,
  `connector_id` int(10) unsigned DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `date` datetime NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`code`),
  KEY `ix_pagseguro_control_status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `payment_channel`
--

DROP TABLE IF EXISTS `payment_channel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment_channel` (
  `id` int(10) unsigned NOT NULL,
  `name` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `payment_installments_group`
--

DROP TABLE IF EXISTS `payment_installments_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment_installments_group` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `payment_method_id` int(10) unsigned NOT NULL,
  `provider_id` int(10) unsigned NOT NULL,
  `installment_init` decimal(2,0) NOT NULL,
  `installment_end` decimal(2,0) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_installments_groups_payment_method_provider1_idx` (`payment_method_id`,`provider_id`),
  CONSTRAINT `fk_installments_groups_payment_method_provider1` FOREIGN KEY (`payment_method_id`, `provider_id`) REFERENCES `payment_method_provider` (`payment_method_id`, `provider_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `payment_method`
--

DROP TABLE IF EXISTS `payment_method`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment_method` (
  `payment_method_id` int(10) unsigned NOT NULL,
  `name` varchar(75) NOT NULL,
  `description` varchar(150) DEFAULT NULL,
  `reconciliation_service_status` decimal(1,0) NOT NULL,
  PRIMARY KEY (`payment_method_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `payment_method_provider`
--

DROP TABLE IF EXISTS `payment_method_provider`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment_method_provider` (
  `payment_method_id` int(10) unsigned NOT NULL,
  `provider_id` int(10) unsigned NOT NULL,
  `default_term` decimal(3,0) NOT NULL,
  PRIMARY KEY (`payment_method_id`,`provider_id`),
  KEY `fk_payment_method_provider_provider1_idx` (`provider_id`),
  CONSTRAINT `fk_payment_method_provider_payment_method1` FOREIGN KEY (`payment_method_id`) REFERENCES `payment_method` (`payment_method_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_payment_method_provider_provider1` FOREIGN KEY (`provider_id`) REFERENCES `provider` (`provider_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pending_vooo`
--

DROP TABLE IF EXISTS `pending_vooo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pending_vooo` (
  `transaction_id` varchar(20) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`transaction_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `policies`
--

DROP TABLE IF EXISTS `policies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `policies` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int(10) unsigned NOT NULL,
  `privileges_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_policies_privileges1_idx` (`privileges_id`),
  KEY `fk_policies_role1_idx` (`role_id`),
  CONSTRAINT `fk_policies_privileges1` FOREIGN KEY (`privileges_id`) REFERENCES `privileges` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_policies_role1` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1832 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `privileges`
--

DROP TABLE IF EXISTS `privileges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `privileges` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `resources_id` int(11) NOT NULL,
  `permissions_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_previleges_resources_idx` (`resources_id`),
  KEY `fk_previleges_permissions1_idx` (`permissions_id`),
  CONSTRAINT `fk_previleges_permissions1` FOREIGN KEY (`permissions_id`) REFERENCES `permissions` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_previleges_resources` FOREIGN KEY (`resources_id`) REFERENCES `resources` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1833 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `processing_status`
--

DROP TABLE IF EXISTS `processing_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `processing_status` (
  `processing_status_id` int(10) unsigned NOT NULL,
  `name` varchar(75) NOT NULL,
  `description` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`processing_status_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `projections_R`
--

DROP TABLE IF EXISTS `projections_R`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `projections_R` (
  `headquarter_id` int(11) NOT NULL,
  `projection_date` datetime NOT NULL,
  `projection_value` decimal(10,2) NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `projection_method` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'ARIMA',
  PRIMARY KEY (`headquarter_id`,`projection_date`,`projection_method`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `projections_R_history`
--

DROP TABLE IF EXISTS `projections_R_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `projections_R_history` (
  `headquarter_id` int(11) NOT NULL,
  `projection_date` date NOT NULL,
  `projection_value` decimal(10,2) NOT NULL,
  `created_at` date NOT NULL,
  `projection_method` varchar(100) NOT NULL DEFAULT 'ARIMA',
  PRIMARY KEY (`headquarter_id`,`projection_method`,`created_at`,`projection_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `provider`
--

DROP TABLE IF EXISTS `provider`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `provider` (
  `provider_id` int(10) unsigned NOT NULL,
  `provider_type_id` int(10) NOT NULL DEFAULT '2',
  `name` varchar(75) NOT NULL,
  `description` varchar(150) DEFAULT NULL,
  `reconciliation_service_status` decimal(1,0) NOT NULL,
  `auto_settlement` decimal(1,0) NOT NULL DEFAULT '0',
  `has_gateway` decimal(1,0) DEFAULT '0',
  PRIMARY KEY (`provider_id`),
  KEY `FK_PROVIDER_TYPE_idx` (`provider_type_id`),
  CONSTRAINT `FK_PROVIDER_TYPE` FOREIGN KEY (`provider_type_id`) REFERENCES `provider_type` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `provider_connector_mapping`
--

DROP TABLE IF EXISTS `provider_connector_mapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `provider_connector_mapping` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `provider_id` int(11) NOT NULL,
  `connector_id` int(11) NOT NULL,
  `group` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=319 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `provider_type`
--

DROP TABLE IF EXISTS `provider_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `provider_type` (
  `id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `description` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `purge_backend_table_list`
--

DROP TABLE IF EXISTS `purge_backend_table_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `purge_backend_table_list` (
  `backend_table_name` varchar(120) NOT NULL,
  `table_order` int(10) unsigned NOT NULL,
  `table_priority` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`backend_table_name`),
  UNIQUE KEY `backend_table_name` (`backend_table_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `purge_rawdata_table_list`
--

DROP TABLE IF EXISTS `purge_rawdata_table_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `purge_rawdata_table_list` (
  `rawdata_table_name` varchar(120) NOT NULL,
  `provider_id` int(10) unsigned NOT NULL,
  `table_type` int(10) unsigned NOT NULL,
  PRIMARY KEY (`rawdata_table_name`),
  UNIQUE KEY `rawdata_table_name` (`rawdata_table_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `r_admin_fee`
--

DROP TABLE IF EXISTS `r_admin_fee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `r_admin_fee` (
  `id` int(11) unsigned NOT NULL,
  `client_id` int(10) unsigned NOT NULL,
  `provider_id` int(10) unsigned NOT NULL,
  `start_amount` decimal(10,2) NOT NULL,
  `end_amount` decimal(10,2) DEFAULT NULL,
  `contract_code_extra` decimal(15,0) DEFAULT NULL,
  `r_mcc_group_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_r_admin_fee_r_mcc_type1_idx` (`r_mcc_group_id`),
  KEY `fk_r_admin_fee_provider1_idx` (`provider_id`),
  KEY `fk_r_admin_fee_client1_idx` (`client_id`),
  CONSTRAINT `fk_r_admin_fee_client1` FOREIGN KEY (`client_id`) REFERENCES `client` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_r_admin_fee_provider1` FOREIGN KEY (`provider_id`) REFERENCES `provider` (`provider_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_r_admin_fee_r_mcc_type1` FOREIGN KEY (`r_mcc_group_id`) REFERENCES `r_mcc_group` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_r_config_fee_r_fee1` FOREIGN KEY (`id`) REFERENCES `r_fee` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `r_card_bin`
--

DROP TABLE IF EXISTS `r_card_bin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `r_card_bin` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `r_card_category_id` int(11) unsigned NOT NULL,
  `number` decimal(6,0) NOT NULL,
  `card_bin_base_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_card_bin_number` (`number`),
  KEY `fk_card_bin_type_card_type1_idx` (`r_card_category_id`),
  KEY `fk_r_card_bin_card_bin_base1_idx` (`card_bin_base_id`),
  CONSTRAINT `fk_card_bin_type_card_type1` FOREIGN KEY (`r_card_category_id`) REFERENCES `r_card_category` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_r_card_bin_card_bin_base1` FOREIGN KEY (`card_bin_base_id`) REFERENCES `card_bin_base` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=328783 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `r_card_category`
--

DROP TABLE IF EXISTS `r_card_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `r_card_category` (
  `id` int(11) unsigned NOT NULL,
  `name` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `brand` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `search_rule` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `priority` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `r_client_exchange_fee`
--

DROP TABLE IF EXISTS `r_client_exchange_fee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `r_client_exchange_fee` (
  `client_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`client_id`),
  CONSTRAINT `fk_r_client_exchange_fee_client1` FOREIGN KEY (`client_id`) REFERENCES `client` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `r_client_interchange_fee`
--

DROP TABLE IF EXISTS `r_client_interchange_fee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `r_client_interchange_fee` (
  `client_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`client_id`),
  CONSTRAINT `r_client_interchange_fee_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `client` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `r_client_term`
--

DROP TABLE IF EXISTS `r_client_term`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `r_client_term` (
  `client_id` int(10) unsigned NOT NULL,
  `payment_method_id` int(10) unsigned NOT NULL,
  `provider_id` int(10) unsigned NOT NULL,
  `days` decimal(3,0) NOT NULL,
  PRIMARY KEY (`client_id`,`payment_method_id`,`provider_id`),
  KEY `fk_r_client_term_payment_method1_idx` (`payment_method_id`,`provider_id`),
  CONSTRAINT `fk_r_client_term_client` FOREIGN KEY (`client_id`) REFERENCES `client` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_r_client_term_payment_method1` FOREIGN KEY (`payment_method_id`, `provider_id`) REFERENCES `payment_method_provider` (`payment_method_id`, `provider_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `r_exchange_fee`
--

DROP TABLE IF EXISTS `r_exchange_fee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `r_exchange_fee` (
  `id` int(10) unsigned NOT NULL,
  `r_card_category_id` int(10) unsigned NOT NULL,
  `r_mcc_group_id` int(10) unsigned NOT NULL,
  `r_payment_channel_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `r_card_category_id` (`r_card_category_id`),
  KEY `r_mcc_group_id` (`r_mcc_group_id`),
  KEY `r_payment_channel_id` (`r_payment_channel_id`),
  CONSTRAINT `r_exchange_fee_ibfk_1` FOREIGN KEY (`id`) REFERENCES `r_fee` (`id`),
  CONSTRAINT `r_exchange_fee_ibfk_2` FOREIGN KEY (`r_card_category_id`) REFERENCES `r_card_category` (`id`),
  CONSTRAINT `r_exchange_fee_ibfk_3` FOREIGN KEY (`r_mcc_group_id`) REFERENCES `r_mcc_group` (`id`),
  CONSTRAINT `r_exchange_fee_ibfk_4` FOREIGN KEY (`r_payment_channel_id`) REFERENCES `r_payment_channel` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `r_fee`
--

DROP TABLE IF EXISTS `r_fee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `r_fee` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `payment_method_id` int(10) unsigned DEFAULT NULL,
  `card_flag_id` int(10) unsigned DEFAULT NULL,
  `r_installment_type_id` int(11) unsigned NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date DEFAULT NULL,
  `fee_rate` decimal(6,6) NOT NULL,
  `charge_value` decimal(10,2) NOT NULL,
  `upper_limit_value` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_r_fee_r_installment_type1_idx` (`r_installment_type_id`),
  KEY `fk_r_fee_payment_method1_idx` (`payment_method_id`),
  KEY `fk_r_fee_card_flag1_idx` (`card_flag_id`),
  CONSTRAINT `fk_r_fee_card_flag1` FOREIGN KEY (`card_flag_id`) REFERENCES `card_flag` (`card_flag_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_r_fee_payment_method1` FOREIGN KEY (`payment_method_id`) REFERENCES `payment_method` (`payment_method_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_r_fee_r_installment_type1` FOREIGN KEY (`r_installment_type_id`) REFERENCES `r_installment_type` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1002647580 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `r_installment_type`
--

DROP TABLE IF EXISTS `r_installment_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `r_installment_type` (
  `id` int(11) unsigned NOT NULL,
  `name` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `start_installment` decimal(2,0) NOT NULL,
  `end_installment` decimal(2,0) DEFAULT NULL,
  `installment_group` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_r_installment_type` (`installment_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `r_interchange_fee`
--

DROP TABLE IF EXISTS `r_interchange_fee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `r_interchange_fee` (
  `id` int(11) unsigned NOT NULL,
  `r_card_category_id` int(11) unsigned NOT NULL,
  `r_mcc_group_id` int(11) unsigned NOT NULL,
  `r_payment_channel_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_reconciliation_exchange_fee_config_card_type1_idx` (`r_card_category_id`),
  KEY `fk_r_exchange_fee_r_mcc_type1_idx` (`r_mcc_group_id`),
  KEY `fk_r_exchange_fee_r_payment_channel1_idx` (`r_payment_channel_id`),
  CONSTRAINT `fk_r_exchange_fee_r_fee1` FOREIGN KEY (`id`) REFERENCES `r_fee` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_r_exchange_fee_r_mcc_type1` FOREIGN KEY (`r_mcc_group_id`) REFERENCES `r_mcc_group` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_r_exchange_fee_r_payment_channel1` FOREIGN KEY (`r_payment_channel_id`) REFERENCES `r_payment_channel` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_reconciliation_exchange_fee_config_card_type1` FOREIGN KEY (`r_card_category_id`) REFERENCES `r_card_category` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `r_mcc_group`
--

DROP TABLE IF EXISTS `r_mcc_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `r_mcc_group` (
  `id` int(11) unsigned NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `r_mcc_group_card_flag`
--

DROP TABLE IF EXISTS `r_mcc_group_card_flag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `r_mcc_group_card_flag` (
  `r_mcc_group_id` int(11) unsigned NOT NULL,
  `card_flag_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`r_mcc_group_id`,`card_flag_id`),
  KEY `fk_r_mcc_group_has_card_flag_card_flag1_idx` (`card_flag_id`),
  KEY `fk_r_mcc_group_has_card_flag_r_mcc_group1_idx` (`r_mcc_group_id`),
  CONSTRAINT `fk_r_mcc_group_has_card_flag_card_flag1` FOREIGN KEY (`card_flag_id`) REFERENCES `card_flag` (`card_flag_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_r_mcc_group_has_card_flag_r_mcc_group1` FOREIGN KEY (`r_mcc_group_id`) REFERENCES `r_mcc_group` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `r_mcc_group_codes`
--

DROP TABLE IF EXISTS `r_mcc_group_codes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `r_mcc_group_codes` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `r_mcc_group_id` int(11) unsigned NOT NULL,
  `start_code` decimal(6,0) NOT NULL,
  `end_code` decimal(6,0) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_mcc_mcc_type1_idx` (`r_mcc_group_id`),
  CONSTRAINT `fk_mcc_mcc_group_code` FOREIGN KEY (`r_mcc_group_id`) REFERENCES `r_mcc_group` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=163 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `r_payment_channel`
--

DROP TABLE IF EXISTS `r_payment_channel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `r_payment_channel` (
  `id` int(11) unsigned NOT NULL,
  `name` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `reconciliation_client_provider_actions`
--

DROP TABLE IF EXISTS `reconciliation_client_provider_actions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reconciliation_client_provider_actions` (
  `client_id` int(10) unsigned NOT NULL,
  `provider_id` int(10) unsigned NOT NULL,
  `settlement_to_sales` decimal(1,0) NOT NULL DEFAULT '0',
  PRIMARY KEY (`client_id`,`provider_id`),
  KEY `fk_reconciliation_client_actions_provider1_idx` (`provider_id`),
  CONSTRAINT `fk_reconciliation_client_actions_client1` FOREIGN KEY (`client_id`) REFERENCES `client` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_reconciliation_client_actions_provider1` FOREIGN KEY (`provider_id`) REFERENCES `provider` (`provider_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `reconciliation_client_provider_default_account`
--

DROP TABLE IF EXISTS `reconciliation_client_provider_default_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reconciliation_client_provider_default_account` (
  `bank_info_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `client_id` int(10) unsigned NOT NULL,
  `provider_id` int(10) unsigned NOT NULL,
  `bank_code` decimal(3,0) NOT NULL,
  `branch` decimal(4,0) NOT NULL,
  `account` varchar(12) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`bank_info_id`,`client_id`,`provider_id`),
  KEY `fk_reconciliation_client_sales_rule_client_idx` (`client_id`),
  KEY `fk_reconciliation_client_provider_bank_account_provider1_idx` (`provider_id`),
  CONSTRAINT `fk_reconciliation_client_provider_bank_account_provider1` FOREIGN KEY (`provider_id`) REFERENCES `provider` (`provider_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_reconciliation_client_provider_bank_account_provider2` FOREIGN KEY (`client_id`) REFERENCES `client` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `reconciliation_client_rule`
--

DROP TABLE IF EXISTS `reconciliation_client_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reconciliation_client_rule` (
  `client_id` int(10) unsigned NOT NULL,
  `reconciliation_rule_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`client_id`),
  KEY `fk_reconciliation_client_sales_rule_client_idx` (`client_id`),
  KEY `fk_reconciliation_client_rule_reconciliation_rule1_idx` (`reconciliation_rule_id`),
  CONSTRAINT `fk_reconciliation_client_rule_reconciliation_rule1` FOREIGN KEY (`reconciliation_rule_id`) REFERENCES `reconciliation_rule` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_reconciliation_fee_config_client10` FOREIGN KEY (`client_id`) REFERENCES `client` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `reconciliation_connection_item`
--

DROP TABLE IF EXISTS `reconciliation_connection_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reconciliation_connection_item` (
  `item_id` int(10) unsigned NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `fk_reconciliation_processed_item_connection_item1` FOREIGN KEY (`item_id`) REFERENCES `connection_item` (`item_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `reconciliation_fee_config`
--

DROP TABLE IF EXISTS `reconciliation_fee_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reconciliation_fee_config` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `client_id` int(10) unsigned NOT NULL,
  `payment_installments_group_id` int(11) unsigned NOT NULL,
  `contract_code_extra` decimal(10,0) DEFAULT NULL,
  `fee` decimal(5,4) NOT NULL,
  `fee_lower_limit` decimal(5,4) DEFAULT NULL,
  `fee_upper_limit` decimal(5,4) DEFAULT NULL,
  `date_start` date NOT NULL,
  `date_finish` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_reconciliation_fee_config_client1_idx` (`client_id`),
  KEY `fk_reconciliation_fee_config_payment_installlment_group1_idx` (`payment_installments_group_id`),
  CONSTRAINT `fk_reconciliation_fee_config_client1` FOREIGN KEY (`client_id`) REFERENCES `reconciliation_transaction_fee` (`client_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_reconciliation_fee_config_payment_installlment_group1` FOREIGN KEY (`payment_installments_group_id`) REFERENCES `payment_installments_group` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=160 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `reconciliation_fee_type`
--

DROP TABLE IF EXISTS `reconciliation_fee_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reconciliation_fee_type` (
  `id` int(10) unsigned NOT NULL,
  `name` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `reconciliation_rule`
--

DROP TABLE IF EXISTS `reconciliation_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reconciliation_rule` (
  `id` int(10) unsigned NOT NULL,
  `name` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `reconciliation_statement_description`
--

DROP TABLE IF EXISTS `reconciliation_statement_description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reconciliation_statement_description` (
  `payment_method_id` int(10) unsigned NOT NULL,
  `provider_id` int(10) unsigned NOT NULL,
  `card_flag_id` int(10) unsigned NOT NULL,
  `description` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`payment_method_id`,`provider_id`,`card_flag_id`),
  KEY `fk_output_statement_description_provider1_idx` (`provider_id`),
  KEY `fk_output_statement_description_card_flag1_idx` (`card_flag_id`),
  CONSTRAINT `fk_output_statement_description_card_flag1` FOREIGN KEY (`card_flag_id`) REFERENCES `card_flag` (`card_flag_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_output_statement_description_payment_method1` FOREIGN KEY (`payment_method_id`) REFERENCES `payment_method` (`payment_method_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_output_statement_description_provider1` FOREIGN KEY (`provider_id`) REFERENCES `provider` (`provider_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `reconciliation_transaction_fee`
--

DROP TABLE IF EXISTS `reconciliation_transaction_fee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reconciliation_transaction_fee` (
  `client_id` int(10) unsigned NOT NULL,
  `reconciliation_fee_type_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`client_id`),
  KEY `fk_reconciliation_transaction_fee_reconciliation_fee_type1_idx` (`reconciliation_fee_type_id`),
  CONSTRAINT `fk_client_reconciliation_fee_client1` FOREIGN KEY (`client_id`) REFERENCES `client` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_reconciliation_transaction_fee_reconciliation_fee_type1` FOREIGN KEY (`reconciliation_fee_type_id`) REFERENCES `reconciliation_fee_type` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rede_files_action`
--

DROP TABLE IF EXISTS `rede_files_action`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rede_files_action` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `rede_files_control_id` bigint(20) NOT NULL,
  `to_name` varchar(100) NOT NULL,
  `lines` decimal(10,0) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `rede_files_control_id` (`rede_files_control_id`),
  KEY `ix_rede_files_action_to_name` (`to_name`),
  CONSTRAINT `rede_files_action_ibfk_1` FOREIGN KEY (`rede_files_control_id`) REFERENCES `rede_files_control` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7029 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rede_files_control`
--

DROP TABLE IF EXISTS `rede_files_control`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rede_files_control` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `rede_files_vector_id` bigint(20) NOT NULL,
  `from_name` varchar(100) NOT NULL,
  `lines` decimal(10,0) NOT NULL,
  `status` decimal(1,0) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `rede_files_vector_id` (`rede_files_vector_id`),
  KEY `ix_rede_files_control_from_name` (`from_name`),
  CONSTRAINT `rede_files_control_ibfk_1` FOREIGN KEY (`rede_files_vector_id`) REFERENCES `rede_files_vector` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2775 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rede_files_node`
--

DROP TABLE IF EXISTS `rede_files_node`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rede_files_node` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `rede_files_vector_id` bigint(20) NOT NULL,
  `contract_code` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `rede_files_vector_id` (`rede_files_vector_id`),
  CONSTRAINT `rede_files_node_ibfk_1` FOREIGN KEY (`rede_files_vector_id`) REFERENCES `rede_files_vector` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rede_files_vector`
--

DROP TABLE IF EXISTS `rede_files_vector`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rede_files_vector` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `path` varchar(100) NOT NULL,
  `file_prefix` varchar(100) NOT NULL,
  `file_extension` varchar(100) NOT NULL,
  `file_new_prefix` varchar(100) DEFAULT NULL,
  `file_new_extension` varchar(100) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `status` decimal(1,0) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rede_request`
--

DROP TABLE IF EXISTS `rede_request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rede_request` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `client_id` int(11) DEFAULT NULL,
  `aggregator_id` int(11) DEFAULT NULL,
  `request_id` varchar(100) DEFAULT NULL,
  `request_type` varchar(45) DEFAULT NULL,
  `permission` varchar(45) DEFAULT NULL,
  `status` varchar(25) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=197 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `referencias_dinheiro_sb`
--

DROP TABLE IF EXISTS `referencias_dinheiro_sb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `referencias_dinheiro_sb` (
  `referencia` varchar(64) NOT NULL DEFAULT '0',
  PRIMARY KEY (`referencia`),
  KEY `referencia` (`referencia`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rel_ant`
--

DROP TABLE IF EXISTS `rel_ant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rel_ant` (
  `client_id` int(10) unsigned NOT NULL,
  `item_date` date DEFAULT NULL,
  `provider_id` int(10) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `reprocess_files_controll`
--

DROP TABLE IF EXISTS `reprocess_files_controll`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reprocess_files_controll` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `client_id` int(11) NOT NULL,
  `connector_id` int(11) NOT NULL,
  `server_id` int(11) NOT NULL,
  `periodo_inicial` date NOT NULL,
  `periodo_final` date NOT NULL,
  `contract_code` varchar(20) NOT NULL DEFAULT '',
  `processing_type` smallint(6) NOT NULL,
  `file` varchar(250) NOT NULL DEFAULT '',
  `processing_status` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uni_file` (`file`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `resources`
--

DROP TABLE IF EXISTS `resources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `resources` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_group` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `roles_id_group_foreign` (`id_group`),
  CONSTRAINT `roles_id_group_foreign` FOREIGN KEY (`id_group`) REFERENCES `group` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4868 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sales`
--

DROP TABLE IF EXISTS `sales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sales` (
  `item_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sales_code` varchar(50) NOT NULL,
  `payment_code` varchar(50) NOT NULL,
  `tax_code` varchar(50) DEFAULT NULL,
  `sales_date` date NOT NULL,
  `sales_time` time NOT NULL,
  `payment_date` date NOT NULL,
  `payment_time` time NOT NULL,
  `sales_value` decimal(10,2) NOT NULL,
  `payment_value` decimal(10,2) NOT NULL,
  `payment_installments` int(10) unsigned NOT NULL,
  `payment_method_id` int(10) unsigned NOT NULL,
  `provider_id` int(10) unsigned DEFAULT NULL,
  `card_flag_id` int(10) unsigned DEFAULT NULL,
  `credit_card_mask` varchar(20) DEFAULT NULL,
  `authorization_code` varchar(64) DEFAULT NULL,
  `nsu_code` varchar(64) DEFAULT NULL,
  `tid_code` varchar(64) DEFAULT NULL,
  `txn_id_code` varchar(64) DEFAULT NULL,
  `client_id` int(10) unsigned DEFAULT NULL,
  `terminal_id` varchar(30) DEFAULT NULL,
  `sitef_provider_id` int(10) DEFAULT NULL,
  `sitef_card_flag_id` int(10) DEFAULT NULL,
  `sales_status` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  UNIQUE KEY `uk_sales_client_codes` (`client_id`,`sales_code`,`payment_code`,`provider_id`),
  KEY `payment_method_id` (`payment_method_id`),
  KEY `provider_id` (`provider_id`),
  KEY `card_flag_id` (`card_flag_id`),
  KEY `idx_sales_1` (`sales_code`,`payment_code`),
  KEY `idx_client_provider` (`payment_date`,`provider_id`,`client_id`),
  CONSTRAINT `fk_client_sales_card_flag_id` FOREIGN KEY (`card_flag_id`) REFERENCES `card_flag` (`card_flag_id`),
  CONSTRAINT `fk_client_sales_item_id` FOREIGN KEY (`item_id`) REFERENCES `connection_item` (`item_id`),
  CONSTRAINT `fk_client_sales_pm_id` FOREIGN KEY (`payment_method_id`) REFERENCES `payment_method` (`payment_method_id`),
  CONSTRAINT `fk_client_sales_provider_id` FOREIGN KEY (`provider_id`) REFERENCES `provider` (`provider_id`),
  CONSTRAINT `fk_sales_client1` FOREIGN KEY (`client_id`) REFERENCES `client` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=950731660 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sales_cancel_log`
--

DROP TABLE IF EXISTS `sales_cancel_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sales_cancel_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `client_id` int(10) unsigned NOT NULL,
  `sales_id_cancel_list` varchar(1000) NOT NULL,
  `sales_cancel_date` datetime NOT NULL,
  `sales_cancel_type_id` int(11) unsigned DEFAULT NULL,
  `user_comment` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_sales_cancel_log_sales_cancel_type1_idx` (`sales_cancel_type_id`),
  CONSTRAINT `fk_sales_cancel_log_sales_cancel_type1` FOREIGN KEY (`sales_cancel_type_id`) REFERENCES `sales_cancel_type` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2298 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sales_cancel_type`
--

DROP TABLE IF EXISTS `sales_cancel_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sales_cancel_type` (
  `id` int(10) unsigned NOT NULL,
  `name` varchar(50) COLLATE latin1_bin NOT NULL,
  `description` varchar(500) COLLATE latin1_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sales_closed_period`
--

DROP TABLE IF EXISTS `sales_closed_period`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sales_closed_period` (
  `item_id` int(10) unsigned NOT NULL,
  `closing_datetime` datetime NOT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `fk_sales_closing_date_connection_item1` FOREIGN KEY (`item_id`) REFERENCES `connection_item` (`item_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sales_complement`
--

DROP TABLE IF EXISTS `sales_complement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sales_complement` (
  `item_id` int(10) unsigned NOT NULL,
  `customer_name` varchar(50) DEFAULT NULL,
  `customer_email` varchar(50) DEFAULT NULL,
  `customer_document` varchar(20) DEFAULT NULL,
  `customer_payment_product` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `sales_complement_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `sales` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sales_fee_status`
--

DROP TABLE IF EXISTS `sales_fee_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sales_fee_status` (
  `id` decimal(2,0) NOT NULL,
  `status` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary view structure for view `sales_statement`
--

DROP TABLE IF EXISTS `sales_statement`;
/*!50001 DROP VIEW IF EXISTS `sales_statement`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `sales_statement` AS SELECT 
 1 AS `client_id`,
 1 AS `item_date`,
 1 AS `payment_method_id`,
 1 AS `payment_method_name`,
 1 AS `provider_id`,
 1 AS `provider_name`,
 1 AS `registered`,
 1 AS `confirmed`,
 1 AS `reconciliated`,
 1 AS `not_registered`,
 1 AS `not_recognized`,
 1 AS `diverged_value`,
 1 AS `total_divergence`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `service`
--

DROP TABLE IF EXISTS `service`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `service` (
  `service_id` int(10) unsigned NOT NULL,
  `name` varchar(75) NOT NULL,
  `description` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`service_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `service_alert`
--

DROP TABLE IF EXISTS `service_alert`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `service_alert` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `service_id` int(10) unsigned NOT NULL,
  `description` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL,
  PRIMARY KEY (`id`),
  KEY `service_id` (`service_id`),
  CONSTRAINT `service_alert_ibfk_1` FOREIGN KEY (`service_id`) REFERENCES `service` (`service_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `service_connector`
--

DROP TABLE IF EXISTS `service_connector`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `service_connector` (
  `service_id` int(10) unsigned NOT NULL,
  `connector_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`service_id`,`connector_id`),
  KEY `fk_service_connector_connector1_idx` (`connector_id`),
  CONSTRAINT `fk_service_connector_connector1` FOREIGN KEY (`connector_id`) REFERENCES `connector` (`connector_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_service_connector_service1` FOREIGN KEY (`service_id`) REFERENCES `service` (`service_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `shellbox_data_cross_reports`
--

DROP TABLE IF EXISTS `shellbox_data_cross_reports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shellbox_data_cross_reports` (
  `reference_date` date NOT NULL,
  `status` smallint(2) DEFAULT '0',
  `filename` varchar(255) NOT NULL,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`reference_date`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `shellbox_mdr_compare`
--

DROP TABLE IF EXISTS `shellbox_mdr_compare`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shellbox_mdr_compare` (
  `output_sales_id` int(10) unsigned NOT NULL,
  `mdr_registrado` decimal(15,2) DEFAULT NULL,
  `mdr_reconhecido` decimal(15,2) DEFAULT NULL,
  `mdr_divergente` decimal(15,2) DEFAULT NULL,
  PRIMARY KEY (`output_sales_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `shellbox_reports`
--

DROP TABLE IF EXISTS `shellbox_reports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shellbox_reports` (
  `filename` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`filename`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `shellbox_sales_compliment`
--

DROP TABLE IF EXISTS `shellbox_sales_compliment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shellbox_sales_compliment` (
  `id` int(10) unsigned NOT NULL,
  `point` varchar(64) DEFAULT NULL,
  `empresa` varchar(20) DEFAULT NULL,
  `data_lancamento` date DEFAULT NULL,
  `data_documento` date DEFAULT NULL,
  `exercicio` varchar(10) DEFAULT NULL,
  `tipo_documento` varchar(10) DEFAULT NULL,
  `moeda` varchar(3) DEFAULT NULL,
  `referencia` varchar(20) NOT NULL,
  `texto_cabecalho` varchar(64) DEFAULT NULL,
  `chave_lancamento` varchar(5) DEFAULT NULL,
  `conta_cliente` varchar(16) DEFAULT NULL,
  `montante` decimal(16,2) DEFAULT NULL,
  `montante_mi` decimal(16,2) DEFAULT NULL,
  `local_negocio` varchar(15) DEFAULT NULL,
  `divisao` varchar(15) DEFAULT NULL,
  `sociedade` varchar(15) DEFAULT NULL,
  `centro_custo` varchar(15) DEFAULT NULL,
  `centro_lucro` varchar(15) DEFAULT NULL,
  `tp_movimento` varchar(15) DEFAULT NULL,
  `condicao_pgto` varchar(15) DEFAULT NULL,
  `chave_bloq_pgto` varchar(15) DEFAULT NULL,
  `forma_pagamento` varchar(15) DEFAULT NULL,
  `parceiro_txt` varchar(64) DEFAULT NULL,
  `data_txt` varchar(64) DEFAULT NULL,
  `taxa_1_txt` varchar(64) DEFAULT NULL,
  `taxa_2_txt` varchar(64) DEFAULT NULL,
  `taxa_3_txt` varchar(64) DEFAULT NULL,
  `atribuicao` varchar(20) DEFAULT NULL,
  `elemento_pep` varchar(15) DEFAULT NULL,
  `centro` varchar(15) DEFAULT NULL,
  `ordem` varchar(15) DEFAULT NULL,
  `material` varchar(15) DEFAULT NULL,
  `data_efetiva` date DEFAULT NULL,
  `razao_especial` varchar(15) DEFAULT NULL,
  `data_vencimento` date DEFAULT NULL,
  `data_pagamento` date DEFAULT NULL,
  `fee_parceiro` decimal(16,2) DEFAULT NULL,
  `fee_revendedor` decimal(16,2) DEFAULT NULL,
  `fee_payly` decimal(16,2) DEFAULT NULL,
  `taxa_parceiro` decimal(16,2) DEFAULT NULL,
  `taxa_revendedor` decimal(16,2) DEFAULT NULL,
  `taxa_payly` decimal(16,2) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `referencia` (`referencia`),
  KEY `data_lancamento` (`data_lancamento`),
  KEY `index4` (`data_lancamento`,`data_documento`,`chave_lancamento`,`conta_cliente`,`data_vencimento`,`data_pagamento`,`centro_custo`),
  KEY `index5` (`conta_cliente`,`data_pagamento`),
  KEY `pagamento` (`data_pagamento`),
  KEY `referencia_find` (`referencia`),
  CONSTRAINT `shellbox_sales_compliment_ibfk_1` FOREIGN KEY (`id`) REFERENCES `shellbox_sales_line` (`sb_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `shellbox_sales_compliment_callback`
--

DROP TABLE IF EXISTS `shellbox_sales_compliment_callback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shellbox_sales_compliment_callback` (
  `id` int(10) unsigned NOT NULL,
  `url` varchar(300) NOT NULL,
  `status` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_status` (`status`),
  CONSTRAINT `shellbox_sales_compliment_callback_fk` FOREIGN KEY (`id`) REFERENCES `shellbox_sales_line` (`sb_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `shellbox_sales_compliment_control`
--

DROP TABLE IF EXISTS `shellbox_sales_compliment_control`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shellbox_sales_compliment_control` (
  `id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `original_data_lancamento` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_created_at` (`created_at`),
  CONSTRAINT `shellbox_sales_compliment_control_fk` FOREIGN KEY (`id`) REFERENCES `shellbox_sales_line` (`sb_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `shellbox_sales_consolidado`
--

DROP TABLE IF EXISTS `shellbox_sales_consolidado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shellbox_sales_consolidado` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `data_lancamento` date DEFAULT NULL,
  `data_documento` date DEFAULT NULL,
  `referencia` bigint(16) unsigned NOT NULL DEFAULT '0',
  `tipo_documento` varchar(10) DEFAULT NULL,
  `taxa_2_txt` varchar(64) DEFAULT NULL,
  `exercicio` varchar(10) DEFAULT NULL,
  `texto_cabecalho` varchar(64) DEFAULT NULL,
  `chave_lancamento` varchar(5) DEFAULT NULL,
  `conta_cliente` varchar(16) DEFAULT NULL,
  `centro_custo` varchar(15) DEFAULT NULL,
  `montante` decimal(16,2) DEFAULT NULL,
  `local_negocio` varchar(45) DEFAULT NULL,
  `data_vencimento` date DEFAULT NULL,
  `data_pagamento` date DEFAULT NULL,
  `fee_parceiro` decimal(16,2) DEFAULT NULL,
  `fee_revendedor` decimal(16,2) DEFAULT NULL,
  `fee_payly` decimal(16,2) DEFAULT NULL,
  `taxa_parceiro` decimal(16,2) DEFAULT NULL,
  `taxa_revendedor` decimal(16,2) DEFAULT NULL,
  `taxa_payly` decimal(16,2) DEFAULT NULL,
  `enviado` decimal(1,0) DEFAULT NULL,
  `data_consolidacao` datetime DEFAULT NULL,
  `envio_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`,`referencia`),
  KEY `data_lancamento` (`data_lancamento`),
  KEY `referencia` (`referencia`),
  KEY `FK_shellbox_sales_consolidado_shellbox_sales_consolidado_envio` (`envio_id`),
  CONSTRAINT `CT_shellbox_sales_consolidado_shellbox_sales_consolidado_envio` FOREIGN KEY (`envio_id`, `referencia`) REFERENCES `shellbox_sales_consolidado_envio` (`id`, `referencia`)
) ENGINE=InnoDB AUTO_INCREMENT=1056136 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `shellbox_sales_consolidado_callback`
--

DROP TABLE IF EXISTS `shellbox_sales_consolidado_callback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shellbox_sales_consolidado_callback` (
  `referencia` bigint(16) unsigned NOT NULL DEFAULT '0',
  `exercicio` smallint(5) NOT NULL,
  `batch_token` varchar(300) NOT NULL,
  `status` tinyint(3) NOT NULL,
  PRIMARY KEY (`referencia`,`exercicio`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `shellbox_sales_consolidado_dispatch`
--

DROP TABLE IF EXISTS `shellbox_sales_consolidado_dispatch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shellbox_sales_consolidado_dispatch` (
  `uuid` varchar(40) NOT NULL,
  `limit_date` date NOT NULL,
  `started_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `status_id` int(11) NOT NULL,
  `total` int(11) NOT NULL,
  `done` int(11) NOT NULL,
  PRIMARY KEY (`uuid`),
  KEY `status_id` (`status_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `shellbox_sales_consolidado_engage`
--

DROP TABLE IF EXISTS `shellbox_sales_consolidado_engage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shellbox_sales_consolidado_engage` (
  `uuid` varchar(40) NOT NULL,
  `started_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `status_id` int(11) NOT NULL,
  `total` int(11) NOT NULL,
  `done` int(11) NOT NULL,
  PRIMARY KEY (`uuid`),
  KEY `status_id` (`status_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `shellbox_sales_consolidado_envio`
--

DROP TABLE IF EXISTS `shellbox_sales_consolidado_envio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shellbox_sales_consolidado_envio` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `referencia` bigint(16) unsigned NOT NULL DEFAULT '0',
  `point` int(10) unsigned DEFAULT NULL,
  `enviado` decimal(1,0) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `sended_at` datetime DEFAULT NULL,
  `checked_at` datetime DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  `exercicio` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`,`referencia`),
  KEY `referencia` (`referencia`),
  KEY `referencia_exercicio` (`referencia`,`exercicio`),
  KEY `idx_sended` (`sended_at`)
) ENGINE=InnoDB AUTO_INCREMENT=433034 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `shellbox_sales_consolidado_keys`
--

DROP TABLE IF EXISTS `shellbox_sales_consolidado_keys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shellbox_sales_consolidado_keys` (
  `id` int(10) unsigned NOT NULL,
  `k1` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_k1` (`k1`)
  # CONSTRAINT `shellbox_sales_consolidado_key_fk` FOREIGN KEY (`id`) REFERENCES `shellbox_sales_consolidado` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `shellbox_sales_consolidado_link`
--

DROP TABLE IF EXISTS `shellbox_sales_consolidado_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shellbox_sales_consolidado_link` (
  `sb_id` int(10) unsigned NOT NULL,
  `id_consolidado` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `status_id` int(11) DEFAULT NULL,
  `original_data_lancamento` datetime DEFAULT NULL,
  PRIMARY KEY (`sb_id`),
  UNIQUE KEY `id_consolidado` (`id_consolidado`,`sb_id`),
  KEY `id_consolidado_2` (`id_consolidado`),
  CONSTRAINT `shellbox_sales_consolidado_link_fk1` FOREIGN KEY (`sb_id`) REFERENCES `shellbox_sales_line` (`sb_id`)
  # CONSTRAINT `shellbox_sales_consolidado_link_fk2` FOREIGN KEY (`id_consolidado`) REFERENCES `shellbox_sales_consolidado` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `shellbox_sales_consolidado_scrape`
--

DROP TABLE IF EXISTS `shellbox_sales_consolidado_scrape`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shellbox_sales_consolidado_scrape` (
  `uuid` varchar(40) NOT NULL,
  `release_date` date DEFAULT NULL,
  `created_beyond` datetime DEFAULT NULL,
  `created_until` datetime NOT NULL,
  `started_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `status_id` int(11) NOT NULL,
  `total` int(11) NOT NULL,
  `done` int(11) NOT NULL,
  PRIMARY KEY (`uuid`),
  KEY `status_id` (`status_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `shellbox_sales_consolidado_seq`
--

DROP TABLE IF EXISTS `shellbox_sales_consolidado_seq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shellbox_sales_consolidado_seq` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `shellbox_sales_consolidado_temp`
--

DROP TABLE IF EXISTS `shellbox_sales_consolidado_temp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shellbox_sales_consolidado_temp` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `data_lancamento` date DEFAULT NULL,
  `data_documento` date DEFAULT NULL,
  `referencia` int(10) unsigned NOT NULL,
  `exercicio` varchar(10) DEFAULT NULL,
  `texto_cabecalho` varchar(64) DEFAULT NULL,
  `chave_lancamento` varchar(5) DEFAULT NULL,
  `conta_cliente` varchar(16) DEFAULT NULL,
  `centro_custo` varchar(15) DEFAULT NULL,
  `montante` decimal(16,2) DEFAULT NULL,
  `data_vencimento` date DEFAULT NULL,
  `data_pagamento` date DEFAULT NULL,
  `fee_parceiro` decimal(16,2) DEFAULT NULL,
  `fee_revendedor` decimal(16,2) DEFAULT NULL,
  `fee_payly` decimal(16,2) DEFAULT NULL,
  `taxa_parceiro` decimal(16,2) DEFAULT NULL,
  `taxa_revendedor` decimal(16,2) DEFAULT NULL,
  `taxa_payly` decimal(16,2) DEFAULT NULL,
  `enviado` decimal(1,0) DEFAULT NULL,
  `data_consolidacao` datetime DEFAULT NULL,
  `local_negocio` varchar(50) DEFAULT NULL,
  `tipo_documento` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`,`referencia`),
  KEY `data_lancamento` (`data_lancamento`)
) ENGINE=InnoDB AUTO_INCREMENT=2478 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `shellbox_sales_line`
--

DROP TABLE IF EXISTS `shellbox_sales_line`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shellbox_sales_line` (
  `sb_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_consolidado` int(10) unsigned DEFAULT NULL,
  `consolidado` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`sb_id`),
  KEY `id_consolidado` (`id_consolidado`),
  KEY `id_sb` (`sb_id`)
  #CONSTRAINT `shellbox_sales_line_ibfk_1` FOREIGN KEY (`id_consolidado`) REFERENCES `shellbox_sales_consolidado` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=222610360 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sitef_control`
--

DROP TABLE IF EXISTS `sitef_control`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sitef_control` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `client_id` int(10) unsigned NOT NULL,
  `connector_id` int(10) unsigned NOT NULL,
  `reference_date` date NOT NULL,
  `file_date` date NOT NULL,
  `file_name` varchar(100) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_sitef_control_01` (`client_id`,`connector_id`,`file_date`)
) ENGINE=InnoDB AUTO_INCREMENT=1013 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `stix_1405`
--

DROP TABLE IF EXISTS `stix_1405`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stix_1405` (
  `documento_consolidador` bigint(20) NOT NULL,
  `referencia` int(11) NOT NULL,
  `texto_cabecalho` varchar(10) COLLATE utf8_bin NOT NULL,
  `montante` varchar(10) COLLATE utf8_bin NOT NULL,
  `data_de_lancamento` varchar(10) COLLATE utf8_bin NOT NULL,
  `data_sb` date DEFAULT NULL,
  `id_sb` int(11) DEFAULT NULL,
  `data_stix` date DEFAULT NULL,
  `id_stix` int(11) DEFAULT NULL,
  KEY `idxr` (`referencia`),
  KEY `Index 1` (`id_sb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sync_client`
--

DROP TABLE IF EXISTS `sync_client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sync_client` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `client_from` int(10) unsigned NOT NULL,
  `client_to` int(10) unsigned NOT NULL,
  `providers` varchar(150) DEFAULT NULL,
  `active` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `client_from` (`client_from`),
  KEY `client_to` (`client_to`),
  CONSTRAINT `sync_client_ibfk_1` FOREIGN KEY (`client_from`) REFERENCES `client` (`id`),
  CONSTRAINT `sync_client_ibfk_2` FOREIGN KEY (`client_to`) REFERENCES `client` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `temp_333_delete_duplicate`
--

DROP TABLE IF EXISTS `temp_333_delete_duplicate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `temp_333_delete_duplicate` (
  `id` int(10) unsigned NOT NULL DEFAULT '0',
  `output_id` int(10) unsigned NOT NULL,
  `client_id` int(10) unsigned NOT NULL,
  `headquarter_id` int(10) unsigned NOT NULL,
  `item_date` date DEFAULT NULL,
  `secondary_date` date DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `temp_del_zul_sales`
--

DROP TABLE IF EXISTS `temp_del_zul_sales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `temp_del_zul_sales` (
  `output_item_id` int(10) unsigned NOT NULL,
  `connection_item_id` int(10) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `temp_gross_value_lesser`
--

DROP TABLE IF EXISTS `temp_gross_value_lesser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `temp_gross_value_lesser` (
  `count(a.id)` bigint(21) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `temp_gross_value_lesser_dup`
--

DROP TABLE IF EXISTS `temp_gross_value_lesser_dup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `temp_gross_value_lesser_dup` (
  `count(a.id)` bigint(21) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `temp_sales_xp_del`
--

DROP TABLE IF EXISTS `temp_sales_xp_del`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `temp_sales_xp_del` (
  `output_item_id` int(10) unsigned NOT NULL,
  `connection_item_id` int(10) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `temp_shellbox_analitico`
--

DROP TABLE IF EXISTS `temp_shellbox_analitico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `temp_shellbox_analitico` (
  `Documento Consolidador` int(11) unsigned NOT NULL DEFAULT '0',
  `Ponteiro` varchar(64) DEFAULT NULL,
  `Empresa` varchar(20) DEFAULT NULL,
  `Data de lançamento` date DEFAULT NULL,
  `Data Documento` date DEFAULT NULL,
  `Exercício` varchar(10) DEFAULT NULL,
  `Tipo Documento` varchar(10) DEFAULT NULL,
  `Moeda` varchar(3) DEFAULT NULL,
  `Referência` varchar(20) NOT NULL,
  `Texto cabeçalho` varchar(64) DEFAULT NULL,
  `Chave Lançamento` varchar(5) DEFAULT NULL,
  `Conta/Cliente/Fornecedor` varchar(16) DEFAULT NULL,
  `Montante` decimal(16,2) DEFAULT NULL,
  `Montante MI` decimal(16,2) DEFAULT NULL,
  `Local de Negócio` varchar(15) DEFAULT NULL,
  `Divisão` varchar(15) DEFAULT NULL,
  `Sociedade Parceira` varchar(15) DEFAULT NULL,
  `Centro Custo` varchar(15) DEFAULT NULL,
  `Centro Lucro` varchar(15) DEFAULT NULL,
  `Tp Movimento` varchar(15) DEFAULT NULL,
  `Condição pagto` varchar(15) DEFAULT NULL,
  `Chv Bloq Pagto` varchar(15) DEFAULT NULL,
  `Forma Pagto` varchar(15) DEFAULT NULL,
  `Parceiro` varchar(64) DEFAULT NULL,
  `Data Parceiro` varchar(64) DEFAULT NULL,
  `Taxa 1` varchar(64) DEFAULT NULL,
  `Taxa 2` varchar(64) DEFAULT NULL,
  `Taxa 3` varchar(64) DEFAULT NULL,
  `Atribuição` varchar(20) DEFAULT NULL,
  `Elemento PEP` varchar(15) DEFAULT NULL,
  `Centro` varchar(15) DEFAULT NULL,
  `ORDEM` varchar(15) DEFAULT NULL,
  `Material` varchar(15) DEFAULT NULL,
  `Data Efetiva` date DEFAULT NULL,
  `Razao Especial` varchar(15) DEFAULT NULL,
  `Data Vencimento` date DEFAULT NULL,
  `Data Pagamento` date DEFAULT NULL,
  `Valor_feeparceiro` decimal(16,2) DEFAULT NULL,
  `Valor_feerevendedor` decimal(16,2) DEFAULT NULL,
  `Valor_feepayly` decimal(16,2) DEFAULT NULL,
  `taxa parceiro` decimal(16,2) DEFAULT NULL,
  `taxa revendedor` decimal(16,2) DEFAULT NULL,
  `taxa payly` decimal(16,2) DEFAULT NULL,
  `status do envio` decimal(1,0) DEFAULT NULL,
  `Mensagem SAP` varchar(100) DEFAULT NULL,
  `VALOR TOTAL` decimal(38,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `temp_shellbox_analitico_2`
--

DROP TABLE IF EXISTS `temp_shellbox_analitico_2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `temp_shellbox_analitico_2` (
  `Documento Consolidador` int(11) unsigned NOT NULL DEFAULT '0',
  `Ponteiro` varchar(64) DEFAULT NULL,
  `Empresa` varchar(20) DEFAULT NULL,
  `Data de lançamento` date DEFAULT NULL,
  `Data Documento` date DEFAULT NULL,
  `Exercício` varchar(10) DEFAULT NULL,
  `Tipo Documento` varchar(10) DEFAULT NULL,
  `Moeda` varchar(3) DEFAULT NULL,
  `Referência` varchar(20) NOT NULL,
  `Texto cabeçalho` varchar(64) DEFAULT NULL,
  `Chave Lançamento` varchar(5) DEFAULT NULL,
  `Conta/Cliente/Fornecedor` varchar(16) DEFAULT NULL,
  `Montante` decimal(16,2) DEFAULT NULL,
  `Montante MI` decimal(16,2) DEFAULT NULL,
  `Local de Negócio` varchar(15) DEFAULT NULL,
  `Divisão` varchar(15) DEFAULT NULL,
  `Sociedade Parceira` varchar(15) DEFAULT NULL,
  `Centro Custo` varchar(15) DEFAULT NULL,
  `Centro Lucro` varchar(15) DEFAULT NULL,
  `Tp Movimento` varchar(15) DEFAULT NULL,
  `Condição pagto` varchar(15) DEFAULT NULL,
  `Chv Bloq Pagto` varchar(15) DEFAULT NULL,
  `Forma Pagto` varchar(15) DEFAULT NULL,
  `Parceiro` varchar(64) DEFAULT NULL,
  `Data Parceiro` varchar(64) DEFAULT NULL,
  `Taxa 1` varchar(64) DEFAULT NULL,
  `Taxa 2` varchar(64) DEFAULT NULL,
  `Taxa 3` varchar(64) DEFAULT NULL,
  `Atribuição` varchar(20) DEFAULT NULL,
  `Elemento PEP` varchar(15) DEFAULT NULL,
  `Centro` varchar(15) DEFAULT NULL,
  `ORDEM` varchar(15) DEFAULT NULL,
  `Material` varchar(15) DEFAULT NULL,
  `Data Efetiva` date DEFAULT NULL,
  `Razao Especial` varchar(15) DEFAULT NULL,
  `Data Vencimento` date DEFAULT NULL,
  `Data Pagamento` date DEFAULT NULL,
  `Valor_feeparceiro` decimal(16,2) DEFAULT NULL,
  `Valor_feerevendedor` decimal(16,2) DEFAULT NULL,
  `Valor_feepayly` decimal(16,2) DEFAULT NULL,
  `taxa parceiro` decimal(16,2) DEFAULT NULL,
  `taxa revendedor` decimal(16,2) DEFAULT NULL,
  `taxa payly` decimal(16,2) DEFAULT NULL,
  `status do envio` decimal(1,0) DEFAULT NULL,
  `Mensagem SAP` varchar(100) DEFAULT NULL,
  `VALOR TOTAL` decimal(38,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `temp_shellbox_sales_count`
--

DROP TABLE IF EXISTS `temp_shellbox_sales_count`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `temp_shellbox_sales_count` (
  `count(b.sb_id)` bigint(21) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ticket_files_action`
--

DROP TABLE IF EXISTS `ticket_files_action`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ticket_files_action` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `rede_files_control_id` bigint(20) NOT NULL,
  `to_name` varchar(100) NOT NULL,
  `lines` decimal(10,0) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `rede_files_control_id` (`rede_files_control_id`),
  KEY `ix_ticket_files_action_to_name` (`to_name`),
  CONSTRAINT `ticket_files_action_ibfk_1` FOREIGN KEY (`rede_files_control_id`) REFERENCES `ticket_files_control` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4730 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ticket_files_control`
--

DROP TABLE IF EXISTS `ticket_files_control`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ticket_files_control` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ticket_files_vector_id` bigint(20) NOT NULL,
  `from_name` varchar(100) NOT NULL,
  `lines` decimal(10,0) NOT NULL,
  `status` decimal(1,0) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `ticket_files_vector_id` (`ticket_files_vector_id`),
  KEY `ix_ticket_files_control_from_name` (`from_name`),
  CONSTRAINT `ticket_files_control_ibfk_1` FOREIGN KEY (`ticket_files_vector_id`) REFERENCES `ticket_files_vector` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27793 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ticket_files_node`
--

DROP TABLE IF EXISTS `ticket_files_node`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ticket_files_node` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ticket_files_vector_id` bigint(20) NOT NULL,
  `contract_code` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ticket_files_vector_id` (`ticket_files_vector_id`),
  CONSTRAINT `ticket_files_node_ibfk_1` FOREIGN KEY (`ticket_files_vector_id`) REFERENCES `ticket_files_vector` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ticket_files_vector`
--

DROP TABLE IF EXISTS `ticket_files_vector`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ticket_files_vector` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `path` varchar(100) NOT NULL,
  `file_prefix` varchar(100) NOT NULL,
  `file_extension` varchar(100) NOT NULL,
  `file_new_prefix` varchar(100) DEFAULT NULL,
  `file_new_extension` varchar(100) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `status` decimal(1,0) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tivit_control`
--

DROP TABLE IF EXISTS `tivit_control`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tivit_control` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mailbox` varchar(100) DEFAULT NULL,
  `last_processed_datetime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_tivit_control_mailbox` (`mailbox`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tmp_768_arq14`
--

DROP TABLE IF EXISTS `tmp_768_arq14`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tmp_768_arq14` (
  `connector_id` int(10) unsigned NOT NULL,
  `connection_id` int(10) unsigned NOT NULL DEFAULT '0',
  `item_id` int(10) unsigned NOT NULL DEFAULT '0',
  `reconciliated` decimal(1,0) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tmp_ajuste_picpay_1`
--

DROP TABLE IF EXISTS `tmp_ajuste_picpay_1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tmp_ajuste_picpay_1` (
  `output_item_id` int(10) unsigned NOT NULL,
  `connection_item_id` int(10) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tmp_ajuste_picpay_janeiro`
--

DROP TABLE IF EXISTS `tmp_ajuste_picpay_janeiro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tmp_ajuste_picpay_janeiro` (
  `output_item_id` int(10) unsigned NOT NULL,
  `connection_item_id` int(10) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tmp_all_vendas_porto`
--

DROP TABLE IF EXISTS `tmp_all_vendas_porto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tmp_all_vendas_porto` (
  `payment_date` date NOT NULL,
  `payment_time` time NOT NULL,
  `sales_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `payment_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `authorization_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `provider_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `gross_value` decimal(10,2) NOT NULL,
  `net_value` decimal(10,2) NOT NULL,
  `fee_value` decimal(10,2) NOT NULL,
  `credit_card_mask` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` varchar(15) CHARACTER SET utf8mb4 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tmp_analise_sales_05`
--

DROP TABLE IF EXISTS `tmp_analise_sales_05`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tmp_analise_sales_05` (
  `item_id` int(10) unsigned NOT NULL DEFAULT '0',
  `sales_code` varchar(50) NOT NULL,
  `payment_code` varchar(50) NOT NULL,
  `tax_code` varchar(50) DEFAULT NULL,
  `sales_date` date NOT NULL,
  `sales_time` time NOT NULL,
  `payment_date` date NOT NULL,
  `payment_time` time NOT NULL,
  `sales_value` decimal(10,2) NOT NULL,
  `payment_value` decimal(10,2) NOT NULL,
  `payment_installments` int(10) unsigned NOT NULL,
  `payment_method_id` int(10) unsigned NOT NULL,
  `provider_id` int(10) unsigned DEFAULT NULL,
  `card_flag_id` int(10) unsigned DEFAULT NULL,
  `credit_card_mask` varchar(20) DEFAULT NULL,
  `authorization_code` varchar(64) DEFAULT NULL,
  `nsu_code` varchar(64) DEFAULT NULL,
  `tid_code` varchar(64) DEFAULT NULL,
  `txn_id_code` varchar(64) DEFAULT NULL,
  `client_id` int(10) unsigned DEFAULT NULL,
  `terminal_id` varchar(30) DEFAULT NULL,
  `sitef_provider_id` int(10) DEFAULT NULL,
  `sitef_card_flag_id` int(10) DEFAULT NULL,
  `sales_status` varchar(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `item_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tmp_analise_sales_06`
--

DROP TABLE IF EXISTS `tmp_analise_sales_06`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tmp_analise_sales_06` (
  `item_id` int(10) unsigned NOT NULL DEFAULT '0',
  `sales_code` varchar(50) NOT NULL,
  `payment_code` varchar(50) NOT NULL,
  `tax_code` varchar(50) DEFAULT NULL,
  `sales_date` date NOT NULL,
  `sales_time` time NOT NULL,
  `payment_date` date NOT NULL,
  `payment_time` time NOT NULL,
  `sales_value` decimal(10,2) NOT NULL,
  `payment_value` decimal(10,2) NOT NULL,
  `payment_installments` int(10) unsigned NOT NULL,
  `payment_method_id` int(10) unsigned NOT NULL,
  `provider_id` int(10) unsigned DEFAULT NULL,
  `card_flag_id` int(10) unsigned DEFAULT NULL,
  `credit_card_mask` varchar(20) DEFAULT NULL,
  `authorization_code` varchar(64) DEFAULT NULL,
  `nsu_code` varchar(64) DEFAULT NULL,
  `tid_code` varchar(64) DEFAULT NULL,
  `txn_id_code` varchar(64) DEFAULT NULL,
  `client_id` int(10) unsigned DEFAULT NULL,
  `terminal_id` varchar(30) DEFAULT NULL,
  `sitef_provider_id` int(10) DEFAULT NULL,
  `sitef_card_flag_id` int(10) DEFAULT NULL,
  `sales_status` varchar(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `item_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tmp_analise_sales_07`
--

DROP TABLE IF EXISTS `tmp_analise_sales_07`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tmp_analise_sales_07` (
  `item_id` int(10) unsigned NOT NULL DEFAULT '0',
  `sales_code` varchar(50) NOT NULL,
  `payment_code` varchar(50) NOT NULL,
  `tax_code` varchar(50) DEFAULT NULL,
  `sales_date` date NOT NULL,
  `sales_time` time NOT NULL,
  `payment_date` date NOT NULL,
  `payment_time` time NOT NULL,
  `sales_value` decimal(10,2) NOT NULL,
  `payment_value` decimal(10,2) NOT NULL,
  `payment_installments` int(10) unsigned NOT NULL,
  `payment_method_id` int(10) unsigned NOT NULL,
  `provider_id` int(10) unsigned DEFAULT NULL,
  `card_flag_id` int(10) unsigned DEFAULT NULL,
  `credit_card_mask` varchar(20) DEFAULT NULL,
  `authorization_code` varchar(64) DEFAULT NULL,
  `nsu_code` varchar(64) DEFAULT NULL,
  `tid_code` varchar(64) DEFAULT NULL,
  `txn_id_code` varchar(64) DEFAULT NULL,
  `client_id` int(10) unsigned DEFAULT NULL,
  `terminal_id` varchar(30) DEFAULT NULL,
  `sitef_provider_id` int(10) DEFAULT NULL,
  `sitef_card_flag_id` int(10) DEFAULT NULL,
  `sales_status` varchar(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `item_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tmp_analise_sales_08`
--

DROP TABLE IF EXISTS `tmp_analise_sales_08`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tmp_analise_sales_08` (
  `item_id` int(10) unsigned NOT NULL DEFAULT '0',
  `sales_code` varchar(50) NOT NULL,
  `payment_code` varchar(50) NOT NULL,
  `tax_code` varchar(50) DEFAULT NULL,
  `sales_date` date NOT NULL,
  `sales_time` time NOT NULL,
  `payment_date` date NOT NULL,
  `payment_time` time NOT NULL,
  `sales_value` decimal(10,2) NOT NULL,
  `payment_value` decimal(10,2) NOT NULL,
  `payment_installments` int(10) unsigned NOT NULL,
  `payment_method_id` int(10) unsigned NOT NULL,
  `provider_id` int(10) unsigned DEFAULT NULL,
  `card_flag_id` int(10) unsigned DEFAULT NULL,
  `credit_card_mask` varchar(20) DEFAULT NULL,
  `authorization_code` varchar(64) DEFAULT NULL,
  `nsu_code` varchar(64) DEFAULT NULL,
  `tid_code` varchar(64) DEFAULT NULL,
  `txn_id_code` varchar(64) DEFAULT NULL,
  `client_id` int(10) unsigned DEFAULT NULL,
  `terminal_id` varchar(30) DEFAULT NULL,
  `sitef_provider_id` int(10) DEFAULT NULL,
  `sitef_card_flag_id` int(10) DEFAULT NULL,
  `sales_status` varchar(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `item_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tmp_antecipacao_2_803`
--

DROP TABLE IF EXISTS `tmp_antecipacao_2_803`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tmp_antecipacao_2_803` (
  `id` int(10) unsigned NOT NULL DEFAULT '0',
  `output_agenda_id` int(10) unsigned NOT NULL,
  `output_settlement_id` int(10) unsigned DEFAULT NULL,
  `output_anticipation_id` int(10) unsigned DEFAULT NULL,
  `output_unschedule_id` int(10) unsigned DEFAULT NULL,
  `status_id` decimal(1,0) NOT NULL,
  `settlement_date` date NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tmp_antecipacao_rede_evo_2`
--

DROP TABLE IF EXISTS `tmp_antecipacao_rede_evo_2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tmp_antecipacao_rede_evo_2` (
  `id` int(10) unsigned NOT NULL DEFAULT '0',
  `output_agenda_id` int(10) unsigned NOT NULL,
  `output_settlement_id` int(10) unsigned DEFAULT NULL,
  `output_anticipation_id` int(10) unsigned DEFAULT NULL,
  `output_unschedule_id` int(10) unsigned DEFAULT NULL,
  `status_id` decimal(1,0) NOT NULL,
  `settlement_date` date NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tmp_chamado_3622`
--

DROP TABLE IF EXISTS `tmp_chamado_3622`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tmp_chamado_3622` (
  `provider_id` int(10) unsigned NOT NULL,
  `name` varchar(75) NOT NULL,
  `settlement_date` date NOT NULL,
  `payment_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `net_value` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tmp_check_porto`
--

DROP TABLE IF EXISTS `tmp_check_porto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tmp_check_porto` (
  `payment_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `net_value` decimal(10,2) NOT NULL,
  `ID_TRANSACAO` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `DESCRICAO` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `DATA_MOVIMENTO` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `VALOR` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `PLASTICO` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `COD_AUT` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `CPF` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `DATA_TRANSACAO` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `AUTHORIZATION_ID` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tmp_cielo_auth`
--

DROP TABLE IF EXISTS `tmp_cielo_auth`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tmp_cielo_auth` (
  `id` int(10) unsigned DEFAULT '0',
  `id_client` int(10) unsigned DEFAULT NULL,
  `access_token` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `refresh_token` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `token_type` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `expires_in` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tmp_codigos_venda_pag`
--

DROP TABLE IF EXISTS `tmp_codigos_venda_pag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tmp_codigos_venda_pag` (
  `item_id` int(10) unsigned NOT NULL,
  `codigo_venda` varchar(64) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tmp_conn_59`
--

DROP TABLE IF EXISTS `tmp_conn_59`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tmp_conn_59` (
  `connection_id` int(10) unsigned NOT NULL DEFAULT '0',
  `client_id` int(10) unsigned NOT NULL,
  `connector_id` int(10) unsigned NOT NULL,
  `connection_status_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned DEFAULT NULL,
  `init_datetime` datetime NOT NULL,
  `end_datetime` datetime DEFAULT NULL,
  `end_reconciliation` datetime DEFAULT NULL,
  `item_qty` int(10) unsigned DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tmp_connectionPaypal`
--

DROP TABLE IF EXISTS `tmp_connectionPaypal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tmp_connectionPaypal` (
  `item_date` date DEFAULT NULL,
  `connection_id` int(10) unsigned NOT NULL,
  `provider_source` varchar(200) CHARACTER SET utf8 DEFAULT NULL,
  `item_qty` int(10) unsigned DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tmp_connections_sales`
--

DROP TABLE IF EXISTS `tmp_connections_sales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tmp_connections_sales` (
  `connection_id` int(10) unsigned NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tmp_dispatch`
--

DROP TABLE IF EXISTS `tmp_dispatch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tmp_dispatch` (
  `chave` tinyint(4) NOT NULL,
  `lote` bigint(20) NOT NULL,
  `conta_cli` mediumint(9) NOT NULL,
  `montante` decimal(20,6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tmp_dr_without_cv`
--

DROP TABLE IF EXISTS `tmp_dr_without_cv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tmp_dr_without_cv` (
  `item_id` int(10) unsigned NOT NULL,
  `codigo_registro` varchar(2) NOT NULL,
  `identificacao_loja` varchar(15) DEFAULT NULL,
  `nsu_host_transacao` decimal(12,0) DEFAULT NULL,
  `data_transacao_original` date DEFAULT NULL,
  `hora_transacao_original` time DEFAULT NULL,
  `numero_parcela` decimal(2,0) DEFAULT NULL,
  `data_lancamento` date DEFAULT NULL,
  `tipo_negociacao` varchar(2) DEFAULT NULL,
  `valor_liquido` decimal(13,2) DEFAULT NULL,
  `identificacao_tomador` varchar(50) DEFAULT NULL,
  `tipo_conta` varchar(2) DEFAULT NULL,
  `banco` decimal(4,0) DEFAULT NULL,
  `agencia` decimal(6,0) DEFAULT NULL,
  `conta` varchar(20) DEFAULT NULL,
  `ec_submissor` decimal(9,0) DEFAULT NULL,
  `tipo_operacao` decimal(1,0) DEFAULT NULL,
  `numero_ro` decimal(50,0) DEFAULT NULL,
  `nseq` decimal(8,0) DEFAULT NULL,
  `codigo_operacao` varchar(20) DEFAULT NULL,
  `seq_operacao` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tmp_green_pass_reprocessamento_1`
--

DROP TABLE IF EXISTS `tmp_green_pass_reprocessamento_1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tmp_green_pass_reprocessamento_1` (
  `connection_id` int(10) unsigned NOT NULL,
  `item_id` int(10) unsigned NOT NULL DEFAULT '0',
  `output_item_id` int(10) unsigned
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tmp_green_pass_reprocessamento_2`
--

DROP TABLE IF EXISTS `tmp_green_pass_reprocessamento_2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tmp_green_pass_reprocessamento_2` (
  `id` int(10) unsigned NOT NULL DEFAULT '0',
  `output_agenda_id` int(10) unsigned NOT NULL,
  `output_settlement_id` int(10) unsigned DEFAULT NULL,
  `output_anticipation_id` int(10) unsigned DEFAULT NULL,
  `output_unschedule_id` int(10) unsigned DEFAULT NULL,
  `status_id` decimal(1,0) NOT NULL,
  `settlement_date` date NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tmp_green_pass_reprocessamento_vendas`
--

DROP TABLE IF EXISTS `tmp_green_pass_reprocessamento_vendas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tmp_green_pass_reprocessamento_vendas` (
  `item_id` int(10) unsigned NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tmp_lav_1`
--

DROP TABLE IF EXISTS `tmp_lav_1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tmp_lav_1` (
  `id` int(10) unsigned NOT NULL,
  `point` varchar(64) DEFAULT NULL,
  `empresa` varchar(20) DEFAULT NULL,
  `data_lancamento` date DEFAULT NULL,
  `data_documento` date DEFAULT NULL,
  `exercicio` varchar(10) DEFAULT NULL,
  `tipo_documento` varchar(10) DEFAULT NULL,
  `moeda` varchar(3) DEFAULT NULL,
  `referencia` varchar(20) NOT NULL,
  `texto_cabecalho` varchar(64) DEFAULT NULL,
  `chave_lancamento` varchar(5) DEFAULT NULL,
  `conta_cliente` varchar(16) DEFAULT NULL,
  `montante` decimal(16,2) DEFAULT NULL,
  `montante_mi` decimal(16,2) DEFAULT NULL,
  `local_negocio` varchar(15) DEFAULT NULL,
  `divisao` varchar(15) DEFAULT NULL,
  `sociedade` varchar(15) DEFAULT NULL,
  `centro_custo` varchar(15) DEFAULT NULL,
  `centro_lucro` varchar(15) DEFAULT NULL,
  `tp_movimento` varchar(15) DEFAULT NULL,
  `condicao_pgto` varchar(15) DEFAULT NULL,
  `chave_bloq_pgto` varchar(15) DEFAULT NULL,
  `forma_pagamento` varchar(15) DEFAULT NULL,
  `parceiro_txt` varchar(64) DEFAULT NULL,
  `data_txt` varchar(64) DEFAULT NULL,
  `taxa_1_txt` varchar(64) DEFAULT NULL,
  `taxa_2_txt` varchar(64) DEFAULT NULL,
  `taxa_3_txt` varchar(64) DEFAULT NULL,
  `atribuicao` varchar(20) DEFAULT NULL,
  `elemento_pep` varchar(15) DEFAULT NULL,
  `centro` varchar(15) DEFAULT NULL,
  `ordem` varchar(15) DEFAULT NULL,
  `material` varchar(15) DEFAULT NULL,
  `data_efetiva` date DEFAULT NULL,
  `razao_especial` varchar(15) DEFAULT NULL,
  `data_vencimento` date DEFAULT NULL,
  `data_pagamento` date DEFAULT NULL,
  `fee_parceiro` decimal(16,2) DEFAULT NULL,
  `fee_revendedor` decimal(16,2) DEFAULT NULL,
  `fee_payly` decimal(16,2) DEFAULT NULL,
  `taxa_parceiro` decimal(16,2) DEFAULT NULL,
  `taxa_revendedor` decimal(16,2) DEFAULT NULL,
  `taxa_payly` decimal(16,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tmp_lavinas_1`
--

DROP TABLE IF EXISTS `tmp_lavinas_1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tmp_lavinas_1` (
  `item_id` int(10) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tmp_lavinas_2`
--

DROP TABLE IF EXISTS `tmp_lavinas_2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tmp_lavinas_2` (
  `output_item_id` int(10) unsigned NOT NULL,
  `connection_item_id` int(10) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tmp_lavinas_3`
--

DROP TABLE IF EXISTS `tmp_lavinas_3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tmp_lavinas_3` (
  `item_id` int(10) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tmp_lavinas_4`
--

DROP TABLE IF EXISTS `tmp_lavinas_4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tmp_lavinas_4` (
  `output_item_id` int(10) unsigned NOT NULL,
  `connection_item_id` int(10) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tmp_lavinas_5`
--

DROP TABLE IF EXISTS `tmp_lavinas_5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tmp_lavinas_5` (
  `id` int(10) unsigned NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tmp_liqMP01`
--

DROP TABLE IF EXISTS `tmp_liqMP01`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tmp_liqMP01` (
  `item_id` int(10) unsigned NOT NULL DEFAULT '0',
  `connection_id` int(10) unsigned NOT NULL,
  `connection_position` int(10) NOT NULL,
  `client_branch_id` int(10) unsigned DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `reconciliated` decimal(1,0) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tmp_liqMercadoPago`
--

DROP TABLE IF EXISTS `tmp_liqMercadoPago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tmp_liqMercadoPago` (
  `id` int(10) DEFAULT '0',
  `output_settlement_id` int(10) unsigned DEFAULT NULL,
  `output_anticipation_id` int(10) unsigned DEFAULT NULL,
  `output_sales_id` int(10) unsigned DEFAULT NULL,
  `output_reversal_id` int(10) unsigned DEFAULT NULL,
  `gross_value` decimal(10,2),
  `fee_value` decimal(10,2),
  `net_value` decimal(10,2),
  `anticipation_fee_value` decimal(10,2) DEFAULT NULL,
  `settlement_value` decimal(10,2) DEFAULT NULL,
  `fee_rate` decimal(5,4),
  `period_fee_rate` decimal(5,4) DEFAULT NULL,
  `monthly_fee_rate` decimal(5,4) DEFAULT NULL,
  `payment_date` date DEFAULT NULL,
  `payment_time` time DEFAULT NULL,
  `reversal_date` date DEFAULT NULL,
  `sales_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `payment_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `authorization_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `provider_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `provider_code_extra` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `credit_card_mask` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `payment_installments` decimal(2,0) DEFAULT NULL,
  `status_id` decimal(2,0),
  `connection_item_id` int(10) unsigned DEFAULT NULL,
  `terminal_id` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `administration_fee_value` decimal(10,2) DEFAULT NULL,
  `interchange_fee_value` decimal(10,2) DEFAULT NULL,
  `financial_fee_value` decimal(10,2) DEFAULT NULL,
  `StId` int(10) unsigned NOT NULL,
  `source_id` bigint(20) unsigned DEFAULT NULL,
  `external_reference` varchar(120) DEFAULT NULL,
  KEY `source_id` (`source_id`),
  KEY `external_reference` (`external_reference`),
  KEY `payment_code` (`payment_code`),
  KEY `authorization_code` (`authorization_code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tmp_liqui_eefi_porto`
--

DROP TABLE IF EXISTS `tmp_liqui_eefi_porto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tmp_liqui_eefi_porto` (
  `tipo` varchar(10) COLLATE utf8_bin NOT NULL,
  `codigosucursal` varchar(10) COLLATE utf8_bin NOT NULL,
  `numerodocumento` varchar(20) COLLATE utf8_bin NOT NULL,
  `datalancamento` date NOT NULL,
  `valorlancamento` decimal(20,6) NOT NULL,
  `c_credito_` varchar(10) COLLATE utf8_bin NOT NULL,
  `banco` varchar(10) COLLATE utf8_bin NOT NULL,
  `ag_ncia` varchar(10) COLLATE utf8_bin NOT NULL,
  `conta_corrente` varchar(20) COLLATE utf8_bin NOT NULL,
  `datamovimento` date NOT NULL,
  `numerorv` varchar(10) COLLATE utf8_bin NOT NULL,
  `datarv` date NOT NULL,
  `bandeira` varchar(10) COLLATE utf8_bin NOT NULL,
  `tipotransac_o` varchar(10) COLLATE utf8_bin NOT NULL,
  `valordesconto` decimal(20,6) NOT NULL,
  `numeroparcela` varchar(10) COLLATE utf8_bin NOT NULL,
  `numerototalparcelas` varchar(10) COLLATE utf8_bin NOT NULL,
  `statuscredito` varchar(10) COLLATE utf8_bin NOT NULL,
  `idautorizacao` varchar(20) COLLATE utf8_bin NOT NULL,
  `idautorizacaooriginal` varchar(20) COLLATE utf8_bin NOT NULL,
  KEY `Index 1` (`numerodocumento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tmp_liquid`
--

DROP TABLE IF EXISTS `tmp_liquid`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tmp_liquid` (
  `id` int(10) NOT NULL DEFAULT '0',
  `output_settlement_id` int(10) unsigned DEFAULT NULL,
  `output_anticipation_id` int(10) unsigned DEFAULT NULL,
  `output_sales_id` int(10) unsigned DEFAULT NULL,
  `output_reversal_id` int(10) unsigned DEFAULT NULL,
  `gross_value` decimal(10,2) NOT NULL,
  `fee_value` decimal(10,2) NOT NULL,
  `net_value` decimal(10,2) NOT NULL,
  `anticipation_fee_value` decimal(10,2) DEFAULT NULL,
  `settlement_value` decimal(10,2) DEFAULT NULL,
  `fee_rate` decimal(5,4) NOT NULL,
  `period_fee_rate` decimal(5,4) DEFAULT NULL,
  `monthly_fee_rate` decimal(5,4) DEFAULT NULL,
  `payment_date` date DEFAULT NULL,
  `payment_time` time DEFAULT NULL,
  `reversal_date` date DEFAULT NULL,
  `sales_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `payment_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `authorization_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `provider_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `provider_code_extra` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `credit_card_mask` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `payment_installments` decimal(2,0) DEFAULT NULL,
  `status_id` decimal(2,0) NOT NULL,
  `connection_item_id` int(10) unsigned DEFAULT NULL,
  `terminal_id` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `administration_fee_value` decimal(10,2) DEFAULT NULL,
  `interchange_fee_value` decimal(10,2) DEFAULT NULL,
  `financial_fee_value` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tmp_liquidacao_1`
--

DROP TABLE IF EXISTS `tmp_liquidacao_1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tmp_liquidacao_1` (
  `connection_id` int(10) unsigned NOT NULL,
  `item_id` int(10) unsigned NOT NULL DEFAULT '0',
  `output_item_id` int(10) unsigned
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tmp_liquidacao_1333`
--

DROP TABLE IF EXISTS `tmp_liquidacao_1333`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tmp_liquidacao_1333` (
  `connection_id` int(10) unsigned NOT NULL,
  `item_id` int(10) unsigned NOT NULL DEFAULT '0',
  `output_item_id` int(10) unsigned
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tmp_liquidacao_2`
--

DROP TABLE IF EXISTS `tmp_liquidacao_2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tmp_liquidacao_2` (
  `id` int(10) unsigned NOT NULL DEFAULT '0',
  `output_agenda_id` int(10) unsigned NOT NULL,
  `output_settlement_id` int(10) unsigned DEFAULT NULL,
  `output_anticipation_id` int(10) unsigned DEFAULT NULL,
  `output_unschedule_id` int(10) unsigned DEFAULT NULL,
  `status_id` decimal(1,0) NOT NULL,
  `settlement_date` date NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tmp_liquidacao_2333`
--

DROP TABLE IF EXISTS `tmp_liquidacao_2333`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tmp_liquidacao_2333` (
  `id` int(10) unsigned NOT NULL DEFAULT '0',
  `output_agenda_id` int(10) unsigned NOT NULL,
  `output_settlement_id` int(10) unsigned DEFAULT NULL,
  `output_anticipation_id` int(10) unsigned DEFAULT NULL,
  `output_unschedule_id` int(10) unsigned DEFAULT NULL,
  `status_id` decimal(1,0) NOT NULL,
  `settlement_date` date NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tmp_liquidacao_pp`
--

DROP TABLE IF EXISTS `tmp_liquidacao_pp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tmp_liquidacao_pp` (
  `output_item_id` int(10) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tmp_liquidacoes_99`
--

DROP TABLE IF EXISTS `tmp_liquidacoes_99`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tmp_liquidacoes_99` (
  `output_item_id` int(10) unsigned NOT NULL,
  `connection_item_id` int(10) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tmp_lotes_sapcl`
--

DROP TABLE IF EXISTS `tmp_lotes_sapcl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tmp_lotes_sapcl` (
  `referencia` varchar(30) COLLATE utf8_bin NOT NULL,
  `nundoc` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `valor` decimal(20,6) DEFAULT NULL,
  PRIMARY KEY (`referencia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tmp_ltm_reprocessamento_1`
--

DROP TABLE IF EXISTS `tmp_ltm_reprocessamento_1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tmp_ltm_reprocessamento_1` (
  `connection_id` int(10) unsigned NOT NULL,
  `item_id` int(10) unsigned NOT NULL DEFAULT '0',
  `output_item_id` int(10) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tmp_ltm_reprocessamento_2`
--

DROP TABLE IF EXISTS `tmp_ltm_reprocessamento_2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tmp_ltm_reprocessamento_2` (
  `id` int(10) unsigned NOT NULL DEFAULT '0',
  `output_agenda_id` int(10) unsigned NOT NULL,
  `output_settlement_id` int(10) unsigned DEFAULT NULL,
  `output_anticipation_id` int(10) unsigned DEFAULT NULL,
  `output_unschedule_id` int(10) unsigned DEFAULT NULL,
  `status_id` decimal(1,0) NOT NULL,
  `settlement_date` date NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tmp_ltm_reprocessamento_5`
--

DROP TABLE IF EXISTS `tmp_ltm_reprocessamento_5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tmp_ltm_reprocessamento_5` (
  `id` int(10) unsigned NOT NULL DEFAULT '0',
  `output_id` int(10) unsigned NOT NULL,
  `client_id` int(10) unsigned NOT NULL,
  `headquarter_id` int(10) unsigned NOT NULL,
  `item_date` date DEFAULT NULL,
  `secondary_date` date DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tmp_ltm_reprocessamento_vendas`
--

DROP TABLE IF EXISTS `tmp_ltm_reprocessamento_vendas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tmp_ltm_reprocessamento_vendas` (
  `item_id` int(10) unsigned NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tmp_mercado_pago_not_rec`
--

DROP TABLE IF EXISTS `tmp_mercado_pago_not_rec`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tmp_mercado_pago_not_rec` (
  `item_id` int(10) unsigned NOT NULL,
  `source_id` bigint(20) unsigned DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tmp_mercadopago_duplicate`
--

DROP TABLE IF EXISTS `tmp_mercadopago_duplicate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tmp_mercadopago_duplicate` (
  `item_id` int(10) unsigned NOT NULL,
  `external_reference` varchar(120) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tmp_mpDuplicados`
--

DROP TABLE IF EXISTS `tmp_mpDuplicados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tmp_mpDuplicados` (
  `source_id` bigint(20) unsigned DEFAULT NULL,
  `description` varchar(120) DEFAULT NULL,
  `transaction_approval_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tmp_nupay_reprocessamento_1`
--

DROP TABLE IF EXISTS `tmp_nupay_reprocessamento_1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tmp_nupay_reprocessamento_1` (
  `connection_id` int(10) unsigned NOT NULL,
  `item_id` int(10) unsigned NOT NULL DEFAULT '0',
  `output_item_id` int(10) unsigned
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tmp_nupay_reprocessamento_2`
--

DROP TABLE IF EXISTS `tmp_nupay_reprocessamento_2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tmp_nupay_reprocessamento_2` (
  `id` int(10) unsigned NOT NULL DEFAULT '0',
  `output_agenda_id` int(10) unsigned NOT NULL,
  `output_settlement_id` int(10) unsigned DEFAULT NULL,
  `output_anticipation_id` int(10) unsigned DEFAULT NULL,
  `output_unschedule_id` int(10) unsigned DEFAULT NULL,
  `status_id` decimal(1,0) NOT NULL,
  `settlement_date` date NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tmp_nupay_reprocessamento_vendas`
--

DROP TABLE IF EXISTS `tmp_nupay_reprocessamento_vendas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tmp_nupay_reprocessamento_vendas` (
  `item_id` int(10) unsigned NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tmp_pagseguro_transacional`
--

DROP TABLE IF EXISTS `tmp_pagseguro_transacional`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tmp_pagseguro_transacional` (
  `authorization_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `item_id` int(1) NOT NULL DEFAULT '0',
  `codigo_venda` varchar(80) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tmp_payly_sap`
--

DROP TABLE IF EXISTS `tmp_payly_sap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tmp_payly_sap` (
  `id` int(10) unsigned NOT NULL,
  `point` varchar(64) DEFAULT NULL,
  `empresa` varchar(20) DEFAULT NULL,
  `data_lancamento` date DEFAULT NULL,
  `data_documento` date DEFAULT NULL,
  `exercicio` varchar(10) DEFAULT NULL,
  `tipo_documento` varchar(10) DEFAULT NULL,
  `moeda` varchar(3) DEFAULT NULL,
  `referencia` varchar(20) NOT NULL,
  `texto_cabecalho` varchar(64) DEFAULT NULL,
  `chave_lancamento` varchar(5) DEFAULT NULL,
  `conta_cliente` varchar(16) DEFAULT NULL,
  `montante` decimal(16,2) DEFAULT NULL,
  `montante_mi` decimal(16,2) DEFAULT NULL,
  `local_negocio` varchar(15) DEFAULT NULL,
  `divisao` varchar(15) DEFAULT NULL,
  `sociedade` varchar(15) DEFAULT NULL,
  `centro_custo` varchar(15) DEFAULT NULL,
  `centro_lucro` varchar(15) DEFAULT NULL,
  `tp_movimento` varchar(15) DEFAULT NULL,
  `condicao_pgto` varchar(15) DEFAULT NULL,
  `chave_bloq_pgto` varchar(15) DEFAULT NULL,
  `forma_pagamento` varchar(15) DEFAULT NULL,
  `parceiro_txt` varchar(64) DEFAULT NULL,
  `data_txt` varchar(64) DEFAULT NULL,
  `taxa_1_txt` varchar(64) DEFAULT NULL,
  `taxa_2_txt` varchar(64) DEFAULT NULL,
  `taxa_3_txt` varchar(64) DEFAULT NULL,
  `atribuicao` varchar(20) DEFAULT NULL,
  `elemento_pep` varchar(15) DEFAULT NULL,
  `centro` varchar(15) DEFAULT NULL,
  `ordem` varchar(15) DEFAULT NULL,
  `material` varchar(15) DEFAULT NULL,
  `data_efetiva` date DEFAULT NULL,
  `razao_especial` varchar(15) DEFAULT NULL,
  `data_vencimento` date DEFAULT NULL,
  `data_pagamento` date DEFAULT NULL,
  `fee_parceiro` decimal(16,2) DEFAULT NULL,
  `fee_revendedor` decimal(16,2) DEFAULT NULL,
  `fee_payly` decimal(16,2) DEFAULT NULL,
  `taxa_parceiro` decimal(16,2) DEFAULT NULL,
  `taxa_revendedor` decimal(16,2) DEFAULT NULL,
  `taxa_payly` decimal(16,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tmp_payly_sap_full`
--

DROP TABLE IF EXISTS `tmp_payly_sap_full`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tmp_payly_sap_full` (
  `id` int(10) unsigned NOT NULL,
  `point` varchar(64) DEFAULT NULL,
  `empresa` varchar(20) DEFAULT NULL,
  `data_lancamento` date DEFAULT NULL,
  `data_documento` date DEFAULT NULL,
  `exercicio` varchar(10) DEFAULT NULL,
  `tipo_documento` varchar(10) DEFAULT NULL,
  `moeda` varchar(3) DEFAULT NULL,
  `referencia` varchar(20) NOT NULL,
  `texto_cabecalho` varchar(64) DEFAULT NULL,
  `chave_lancamento` varchar(5) DEFAULT NULL,
  `conta_cliente` varchar(16) DEFAULT NULL,
  `montante` decimal(16,2) DEFAULT NULL,
  `montante_mi` decimal(16,2) DEFAULT NULL,
  `local_negocio` varchar(15) DEFAULT NULL,
  `divisao` varchar(15) DEFAULT NULL,
  `sociedade` varchar(15) DEFAULT NULL,
  `centro_custo` varchar(15) DEFAULT NULL,
  `centro_lucro` varchar(15) DEFAULT NULL,
  `tp_movimento` varchar(15) DEFAULT NULL,
  `condicao_pgto` varchar(15) DEFAULT NULL,
  `chave_bloq_pgto` varchar(15) DEFAULT NULL,
  `forma_pagamento` varchar(15) DEFAULT NULL,
  `parceiro_txt` varchar(64) DEFAULT NULL,
  `data_txt` varchar(64) DEFAULT NULL,
  `taxa_1_txt` varchar(64) DEFAULT NULL,
  `taxa_2_txt` varchar(64) DEFAULT NULL,
  `taxa_3_txt` varchar(64) DEFAULT NULL,
  `atribuicao` varchar(20) DEFAULT NULL,
  `elemento_pep` varchar(15) DEFAULT NULL,
  `centro` varchar(15) DEFAULT NULL,
  `ordem` varchar(15) DEFAULT NULL,
  `material` varchar(15) DEFAULT NULL,
  `data_efetiva` date DEFAULT NULL,
  `razao_especial` varchar(15) DEFAULT NULL,
  `data_vencimento` date DEFAULT NULL,
  `data_pagamento` date DEFAULT NULL,
  `fee_parceiro` decimal(16,2) DEFAULT NULL,
  `fee_revendedor` decimal(16,2) DEFAULT NULL,
  `fee_payly` decimal(16,2) DEFAULT NULL,
  `taxa_parceiro` decimal(16,2) DEFAULT NULL,
  `taxa_revendedor` decimal(16,2) DEFAULT NULL,
  `taxa_payly` decimal(16,2) DEFAULT NULL,
  KEY `k1` (`referencia`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tmp_payly_sap_todos`
--

DROP TABLE IF EXISTS `tmp_payly_sap_todos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tmp_payly_sap_todos` (
  `id` int(10) unsigned NOT NULL,
  `point` varchar(64) DEFAULT NULL,
  `empresa` varchar(20) DEFAULT NULL,
  `data_lancamento` date DEFAULT NULL,
  `data_documento` date DEFAULT NULL,
  `exercicio` varchar(10) DEFAULT NULL,
  `tipo_documento` varchar(10) DEFAULT NULL,
  `moeda` varchar(3) DEFAULT NULL,
  `referencia` varchar(20) NOT NULL,
  `texto_cabecalho` varchar(64) DEFAULT NULL,
  `chave_lancamento` varchar(5) DEFAULT NULL,
  `conta_cliente` varchar(16) DEFAULT NULL,
  `montante` decimal(16,2) DEFAULT NULL,
  `montante_mi` decimal(16,2) DEFAULT NULL,
  `local_negocio` varchar(15) DEFAULT NULL,
  `divisao` varchar(15) DEFAULT NULL,
  `sociedade` varchar(15) DEFAULT NULL,
  `centro_custo` varchar(15) DEFAULT NULL,
  `centro_lucro` varchar(15) DEFAULT NULL,
  `tp_movimento` varchar(15) DEFAULT NULL,
  `condicao_pgto` varchar(15) DEFAULT NULL,
  `chave_bloq_pgto` varchar(15) DEFAULT NULL,
  `forma_pagamento` varchar(15) DEFAULT NULL,
  `parceiro_txt` varchar(64) DEFAULT NULL,
  `data_txt` varchar(64) DEFAULT NULL,
  `taxa_1_txt` varchar(64) DEFAULT NULL,
  `taxa_2_txt` varchar(64) DEFAULT NULL,
  `taxa_3_txt` varchar(64) DEFAULT NULL,
  `atribuicao` varchar(20) DEFAULT NULL,
  `elemento_pep` varchar(15) DEFAULT NULL,
  `centro` varchar(15) DEFAULT NULL,
  `ordem` varchar(15) DEFAULT NULL,
  `material` varchar(15) DEFAULT NULL,
  `data_efetiva` date DEFAULT NULL,
  `razao_especial` varchar(15) DEFAULT NULL,
  `data_vencimento` date DEFAULT NULL,
  `data_pagamento` date DEFAULT NULL,
  `fee_parceiro` decimal(16,2) DEFAULT NULL,
  `fee_revendedor` decimal(16,2) DEFAULT NULL,
  `fee_payly` decimal(16,2) DEFAULT NULL,
  `taxa_parceiro` decimal(16,2) DEFAULT NULL,
  `taxa_revendedor` decimal(16,2) DEFAULT NULL,
  `taxa_payly` decimal(16,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tmp_payly_sap_todos_2`
--

DROP TABLE IF EXISTS `tmp_payly_sap_todos_2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tmp_payly_sap_todos_2` (
  `id` int(10) unsigned NOT NULL,
  `referencia` varchar(20) NOT NULL,
  `exercicio` varchar(10) DEFAULT NULL,
  `c` bigint(21) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tmp_payly_sap_todos_3`
--

DROP TABLE IF EXISTS `tmp_payly_sap_todos_3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tmp_payly_sap_todos_3` (
  `id` int(10) unsigned NOT NULL,
  `referencia` varchar(20) NOT NULL,
  `exercicio` varchar(10) DEFAULT NULL,
  `c` bigint(21) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tmp_payly_sap_todos_4`
--

DROP TABLE IF EXISTS `tmp_payly_sap_todos_4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tmp_payly_sap_todos_4` (
  `id` int(10) unsigned NOT NULL,
  `point` varchar(64) DEFAULT NULL,
  `empresa` varchar(20) DEFAULT NULL,
  `data_lancamento` date DEFAULT NULL,
  `data_documento` date DEFAULT NULL,
  `exercicio` varchar(10) DEFAULT NULL,
  `tipo_documento` varchar(10) DEFAULT NULL,
  `moeda` varchar(3) DEFAULT NULL,
  `referencia` varchar(20) NOT NULL,
  `texto_cabecalho` varchar(64) DEFAULT NULL,
  `chave_lancamento` varchar(5) DEFAULT NULL,
  `conta_cliente` varchar(16) DEFAULT NULL,
  `montante` decimal(16,2) DEFAULT NULL,
  `montante_mi` decimal(16,2) DEFAULT NULL,
  `local_negocio` varchar(15) DEFAULT NULL,
  `divisao` varchar(15) DEFAULT NULL,
  `sociedade` varchar(15) DEFAULT NULL,
  `centro_custo` varchar(15) DEFAULT NULL,
  `centro_lucro` varchar(15) DEFAULT NULL,
  `tp_movimento` varchar(15) DEFAULT NULL,
  `condicao_pgto` varchar(15) DEFAULT NULL,
  `chave_bloq_pgto` varchar(15) DEFAULT NULL,
  `forma_pagamento` varchar(15) DEFAULT NULL,
  `parceiro_txt` varchar(64) DEFAULT NULL,
  `data_txt` varchar(64) DEFAULT NULL,
  `taxa_1_txt` varchar(64) DEFAULT NULL,
  `taxa_2_txt` varchar(64) DEFAULT NULL,
  `taxa_3_txt` varchar(64) DEFAULT NULL,
  `atribuicao` varchar(20) DEFAULT NULL,
  `elemento_pep` varchar(15) DEFAULT NULL,
  `centro` varchar(15) DEFAULT NULL,
  `ordem` varchar(15) DEFAULT NULL,
  `material` varchar(15) DEFAULT NULL,
  `data_efetiva` date DEFAULT NULL,
  `razao_especial` varchar(15) DEFAULT NULL,
  `data_vencimento` date DEFAULT NULL,
  `data_pagamento` date DEFAULT NULL,
  `fee_parceiro` decimal(16,2) DEFAULT NULL,
  `fee_revendedor` decimal(16,2) DEFAULT NULL,
  `fee_payly` decimal(16,2) DEFAULT NULL,
  `taxa_parceiro` decimal(16,2) DEFAULT NULL,
  `taxa_revendedor` decimal(16,2) DEFAULT NULL,
  `taxa_payly` decimal(16,2) DEFAULT NULL,
  KEY `k1` (`referencia`,`exercicio`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tmp_payly_sap_todos_5`
--

DROP TABLE IF EXISTS `tmp_payly_sap_todos_5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tmp_payly_sap_todos_5` (
  `id` int(10) unsigned NOT NULL,
  `point` varchar(64) DEFAULT NULL,
  `empresa` varchar(20) DEFAULT NULL,
  `data_lancamento` date DEFAULT NULL,
  `data_documento` date DEFAULT NULL,
  `exercicio` varchar(10) DEFAULT NULL,
  `tipo_documento` varchar(10) DEFAULT NULL,
  `moeda` varchar(3) DEFAULT NULL,
  `referencia` varchar(20) NOT NULL,
  `texto_cabecalho` varchar(64) DEFAULT NULL,
  `chave_lancamento` varchar(5) DEFAULT NULL,
  `conta_cliente` varchar(16) DEFAULT NULL,
  `montante` decimal(16,2) DEFAULT NULL,
  `montante_mi` decimal(16,2) DEFAULT NULL,
  `local_negocio` varchar(15) DEFAULT NULL,
  `divisao` varchar(15) DEFAULT NULL,
  `sociedade` varchar(15) DEFAULT NULL,
  `centro_custo` varchar(15) DEFAULT NULL,
  `centro_lucro` varchar(15) DEFAULT NULL,
  `tp_movimento` varchar(15) DEFAULT NULL,
  `condicao_pgto` varchar(15) DEFAULT NULL,
  `chave_bloq_pgto` varchar(15) DEFAULT NULL,
  `forma_pagamento` varchar(15) DEFAULT NULL,
  `parceiro_txt` varchar(64) DEFAULT NULL,
  `data_txt` varchar(64) DEFAULT NULL,
  `taxa_1_txt` varchar(64) DEFAULT NULL,
  `taxa_2_txt` varchar(64) DEFAULT NULL,
  `taxa_3_txt` varchar(64) DEFAULT NULL,
  `atribuicao` varchar(20) DEFAULT NULL,
  `elemento_pep` varchar(15) DEFAULT NULL,
  `centro` varchar(15) DEFAULT NULL,
  `ordem` varchar(15) DEFAULT NULL,
  `material` varchar(15) DEFAULT NULL,
  `data_efetiva` date DEFAULT NULL,
  `razao_especial` varchar(15) DEFAULT NULL,
  `data_vencimento` date DEFAULT NULL,
  `data_pagamento` date DEFAULT NULL,
  `fee_parceiro` decimal(16,2) DEFAULT NULL,
  `fee_revendedor` decimal(16,2) DEFAULT NULL,
  `fee_payly` decimal(16,2) DEFAULT NULL,
  `taxa_parceiro` decimal(16,2) DEFAULT NULL,
  `taxa_revendedor` decimal(16,2) DEFAULT NULL,
  `taxa_payly` decimal(16,2) DEFAULT NULL,
  KEY `k1` (`referencia`,`exercicio`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tmp_payly_sap_todos_6`
--

DROP TABLE IF EXISTS `tmp_payly_sap_todos_6`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tmp_payly_sap_todos_6` (
  `referencia` varchar(20) NOT NULL,
  `exercicio` varchar(10) DEFAULT NULL,
  `count` bigint(21) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tmp_payly_sap_todos_7`
--

DROP TABLE IF EXISTS `tmp_payly_sap_todos_7`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tmp_payly_sap_todos_7` (
  `referencia` varchar(20) NOT NULL,
  `exercicio` varchar(10) DEFAULT NULL,
  `count` bigint(21) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tmp_paypal_sales_raw`
--

DROP TABLE IF EXISTS `tmp_paypal_sales_raw`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tmp_paypal_sales_raw` (
  `output_item_id` int(10) unsigned NOT NULL,
  `connection_item_id` int(10) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tmp_porto_seguro_reprocessamento_1`
--

DROP TABLE IF EXISTS `tmp_porto_seguro_reprocessamento_1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tmp_porto_seguro_reprocessamento_1` (
  `connection_id` int(10) unsigned NOT NULL,
  `item_id` int(10) unsigned NOT NULL DEFAULT '0',
  `output_item_id` int(10) unsigned
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tmp_porto_seguro_reprocessamento_2`
--

DROP TABLE IF EXISTS `tmp_porto_seguro_reprocessamento_2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tmp_porto_seguro_reprocessamento_2` (
  `id` int(10) unsigned NOT NULL DEFAULT '0',
  `output_agenda_id` int(10) unsigned NOT NULL,
  `output_settlement_id` int(10) unsigned DEFAULT NULL,
  `output_anticipation_id` int(10) unsigned DEFAULT NULL,
  `output_unschedule_id` int(10) unsigned DEFAULT NULL,
  `status_id` decimal(1,0) NOT NULL,
  `settlement_date` date NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tmp_porto_seguro_reprocessamento_vendas`
--

DROP TABLE IF EXISTS `tmp_porto_seguro_reprocessamento_vendas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tmp_porto_seguro_reprocessamento_vendas` (
  `item_id` int(10) unsigned NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tmp_rede_ci_672`
--

DROP TABLE IF EXISTS `tmp_rede_ci_672`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tmp_rede_ci_672` (
  `item_id` int(10) unsigned NOT NULL DEFAULT '0',
  `connection_id` int(10) unsigned NOT NULL,
  `connection_position` int(10) NOT NULL,
  `client_branch_id` int(10) unsigned DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `reconciliated` decimal(1,0) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tmp_rede_eef_34`
--

DROP TABLE IF EXISTS `tmp_rede_eef_34`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tmp_rede_eef_34` (
  `output_item_id` int(10) unsigned NOT NULL,
  `connection_item_id` int(10) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tmp_rede_eef_35`
--

DROP TABLE IF EXISTS `tmp_rede_eef_35`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tmp_rede_eef_35` (
  `settlement_id` int(10) unsigned NOT NULL,
  `settlement_item_id` int(10) NOT NULL DEFAULT '0',
  `reversal_id` int(10) unsigned NOT NULL,
  `agenda_id` int(10) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tmp_referShell_ajuste`
--

DROP TABLE IF EXISTS `tmp_referShell_ajuste`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tmp_referShell_ajuste` (
  `referencia` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tmp_reprocessamento_0_816`
--

DROP TABLE IF EXISTS `tmp_reprocessamento_0_816`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tmp_reprocessamento_0_816` (
  `connection_id` int(10) unsigned NOT NULL,
  `item_id` int(10) unsigned NOT NULL DEFAULT '0',
  `data_pagamento` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tmp_reprocessamento_1`
--

DROP TABLE IF EXISTS `tmp_reprocessamento_1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tmp_reprocessamento_1` (
  `output_item_id` int(10) unsigned NOT NULL,
  `connection_item_id` int(10) unsigned NOT NULL,
  `item_id` int(10) unsigned NOT NULL DEFAULT '0',
  `connection_id` int(10) unsigned NOT NULL,
  `connection_position` int(10) NOT NULL,
  `client_branch_id` int(10) unsigned DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `reconciliated` decimal(1,0) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tmp_reprocessamento_10_816`
--

DROP TABLE IF EXISTS `tmp_reprocessamento_10_816`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tmp_reprocessamento_10_816` (
  `connection_id` int(10) unsigned NOT NULL,
  `item_id` int(10) unsigned NOT NULL DEFAULT '0',
  `output_item_id` int(10) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tmp_reprocessamento_1_816`
--

DROP TABLE IF EXISTS `tmp_reprocessamento_1_816`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tmp_reprocessamento_1_816` (
  `connection_id` int(10) unsigned NOT NULL,
  `item_id` int(10) unsigned NOT NULL DEFAULT '0',
  `output_item_id` int(10) unsigned,
  `data_pagamento` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tmp_reprocessamento_1_pagg`
--

DROP TABLE IF EXISTS `tmp_reprocessamento_1_pagg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tmp_reprocessamento_1_pagg` (
  `connection_id` int(10) unsigned NOT NULL,
  `item_id` int(10) unsigned NOT NULL DEFAULT '0',
  `output_item_id` int(10) unsigned
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tmp_reprocessamento_1_stone`
--

DROP TABLE IF EXISTS `tmp_reprocessamento_1_stone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tmp_reprocessamento_1_stone` (
  `connection_id` int(10) unsigned NOT NULL,
  `item_id` int(10) unsigned NOT NULL DEFAULT '0',
  `output_item_id` int(10) unsigned
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tmp_reprocessamento_2`
--

DROP TABLE IF EXISTS `tmp_reprocessamento_2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tmp_reprocessamento_2` (
  `id` int(10) unsigned NOT NULL DEFAULT '0',
  `output_agenda_id` int(10) unsigned NOT NULL,
  `output_settlement_id` int(10) unsigned DEFAULT NULL,
  `output_anticipation_id` int(10) unsigned DEFAULT NULL,
  `output_unschedule_id` int(10) unsigned DEFAULT NULL,
  `status_id` decimal(1,0) NOT NULL,
  `settlement_date` date NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tmp_reprocessamento_20_816`
--

DROP TABLE IF EXISTS `tmp_reprocessamento_20_816`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tmp_reprocessamento_20_816` (
  `id` int(10) unsigned NOT NULL DEFAULT '0',
  `output_agenda_id` int(10) unsigned NOT NULL,
  `output_settlement_id` int(10) unsigned DEFAULT NULL,
  `output_anticipation_id` int(10) unsigned DEFAULT NULL,
  `output_unschedule_id` int(10) unsigned DEFAULT NULL,
  `status_id` decimal(1,0) NOT NULL,
  `settlement_date` date NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tmp_reprocessamento_2B`
--

DROP TABLE IF EXISTS `tmp_reprocessamento_2B`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tmp_reprocessamento_2B` (
  `id` int(10) unsigned NOT NULL DEFAULT '0',
  `output_agenda_id` int(10) unsigned NOT NULL,
  `output_settlement_id` int(10) unsigned DEFAULT NULL,
  `output_anticipation_id` int(10) unsigned DEFAULT NULL,
  `output_unschedule_id` int(10) unsigned DEFAULT NULL,
  `status_id` decimal(1,0) NOT NULL,
  `settlement_date` date NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tmp_reprocessamento_entrepay`
--

DROP TABLE IF EXISTS `tmp_reprocessamento_entrepay`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tmp_reprocessamento_entrepay` (
  `connection_id` int(10) unsigned NOT NULL,
  `item_id` int(10) unsigned NOT NULL DEFAULT '0',
  `output_item_id` int(10) unsigned
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tmp_reprocessamento_entrepay2`
--

DROP TABLE IF EXISTS `tmp_reprocessamento_entrepay2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tmp_reprocessamento_entrepay2` (
  `id` int(10) unsigned NOT NULL DEFAULT '0',
  `output_agenda_id` int(10) unsigned NOT NULL,
  `output_settlement_id` int(10) unsigned DEFAULT NULL,
  `output_anticipation_id` int(10) unsigned DEFAULT NULL,
  `output_unschedule_id` int(10) unsigned DEFAULT NULL,
  `status_id` decimal(1,0) NOT NULL,
  `settlement_date` date NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tmp_reprocessamento_entrepay_sales`
--

DROP TABLE IF EXISTS `tmp_reprocessamento_entrepay_sales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tmp_reprocessamento_entrepay_sales` (
  `item_id` int(10) unsigned NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tmp_reprocessamento_pagseguro`
--

DROP TABLE IF EXISTS `tmp_reprocessamento_pagseguro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tmp_reprocessamento_pagseguro` (
  `connection_id` int(10) unsigned NOT NULL,
  `item_id` int(10) unsigned NOT NULL DEFAULT '0',
  `output_item_id` int(10) unsigned
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tmp_reprocessamento_pagseguro2`
--

DROP TABLE IF EXISTS `tmp_reprocessamento_pagseguro2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tmp_reprocessamento_pagseguro2` (
  `id` int(10) unsigned NOT NULL DEFAULT '0',
  `output_agenda_id` int(10) unsigned NOT NULL,
  `output_settlement_id` int(10) unsigned DEFAULT NULL,
  `output_anticipation_id` int(10) unsigned DEFAULT NULL,
  `output_unschedule_id` int(10) unsigned DEFAULT NULL,
  `status_id` decimal(1,0) NOT NULL,
  `settlement_date` date NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tmp_reprocessamento_pagseguro_sales`
--

DROP TABLE IF EXISTS `tmp_reprocessamento_pagseguro_sales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tmp_reprocessamento_pagseguro_sales` (
  `item_id` int(10) unsigned NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tmp_reprocessamento_paypal_STL_1`
--

DROP TABLE IF EXISTS `tmp_reprocessamento_paypal_STL_1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tmp_reprocessamento_paypal_STL_1` (
  `connection_id` int(10) unsigned NOT NULL,
  `item_id` int(10) unsigned NOT NULL DEFAULT '0',
  `output_item_id` int(10) unsigned
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tmp_reprocessamento_paypal_STL_2`
--

DROP TABLE IF EXISTS `tmp_reprocessamento_paypal_STL_2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tmp_reprocessamento_paypal_STL_2` (
  `id` int(10) unsigned NOT NULL DEFAULT '0',
  `output_agenda_id` int(10) unsigned NOT NULL,
  `output_settlement_id` int(10) unsigned DEFAULT NULL,
  `output_anticipation_id` int(10) unsigned DEFAULT NULL,
  `output_unschedule_id` int(10) unsigned DEFAULT NULL,
  `status_id` decimal(1,0) NOT NULL,
  `settlement_date` date NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tmp_reprocessamento_sap`
--

DROP TABLE IF EXISTS `tmp_reprocessamento_sap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tmp_reprocessamento_sap` (
  `env_id` int(10) unsigned DEFAULT '0',
  `sb_id` int(10) unsigned NOT NULL DEFAULT '0',
  `id_consolidado` int(10) unsigned DEFAULT NULL,
  `consolidado` int(10) unsigned DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tmp_reprocessamento_vendas`
--

DROP TABLE IF EXISTS `tmp_reprocessamento_vendas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tmp_reprocessamento_vendas` (
  `item_id` int(10) unsigned NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tmp_reprocessamento_vendas_paypay`
--

DROP TABLE IF EXISTS `tmp_reprocessamento_vendas_paypay`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tmp_reprocessamento_vendas_paypay` (
  `item_id` int(10) unsigned NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tmp_sales_and_compliment`
--

DROP TABLE IF EXISTS `tmp_sales_and_compliment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tmp_sales_and_compliment` (
  `id` int(10) unsigned NOT NULL,
  `referencia` varchar(20) NOT NULL,
  KEY `idx_payment` (`referencia`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tmp_sales_and_compliment_2`
--

DROP TABLE IF EXISTS `tmp_sales_and_compliment_2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tmp_sales_and_compliment_2` (
  `id` int(10) unsigned NOT NULL,
  `referencia` varchar(20) NOT NULL,
  `sales_id` int(10) unsigned,
  KEY `idx_payment` (`referencia`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tmp_sales_system`
--

DROP TABLE IF EXISTS `tmp_sales_system`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tmp_sales_system` (
  `output_item_id` int(10) unsigned NOT NULL,
  `connection_item_id` int(10) unsigned NOT NULL,
  `status_id` decimal(2,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tmp_sales_zul`
--

DROP TABLE IF EXISTS `tmp_sales_zul`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tmp_sales_zul` (
  `output_item_id` int(10) unsigned NOT NULL,
  `connection_item_id` int(10) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tmp_sb_cancelamentos_fev2023`
--

DROP TABLE IF EXISTS `tmp_sb_cancelamentos_fev2023`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tmp_sb_cancelamentos_fev2023` (
  `ID_TRANSACAO` int(11) NOT NULL,
  `DESCRICAO` varchar(20) COLLATE utf8_bin NOT NULL,
  `DATA_MOVIMENTO` int(11) NOT NULL,
  `VALOR` varchar(10) COLLATE utf8_bin NOT NULL,
  `PLASTICO` varchar(20) COLLATE utf8_bin NOT NULL,
  `COD_AUT` varchar(20) COLLATE utf8_bin NOT NULL,
  `CPF` varchar(20) COLLATE utf8_bin NOT NULL,
  `DH_TRANSACTION` datetime NOT NULL,
  `AUTHORIZATION_ID` varchar(50) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tmp_sb_cancelamentos_jan23_portoseguro`
--

DROP TABLE IF EXISTS `tmp_sb_cancelamentos_jan23_portoseguro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tmp_sb_cancelamentos_jan23_portoseguro` (
  `ID_TRANSACAO` varchar(10) COLLATE utf8_bin NOT NULL,
  `DESCRICAO` varchar(20) COLLATE utf8_bin NOT NULL,
  `DATA_MOVIMENTO` varchar(10) COLLATE utf8_bin NOT NULL,
  `VALOR` varchar(10) COLLATE utf8_bin NOT NULL,
  `PLASTICO` varchar(20) COLLATE utf8_bin NOT NULL,
  `COD_AUT` varchar(10) COLLATE utf8_bin NOT NULL,
  `CPF` bigint(20) NOT NULL,
  `DATA DA TRANSAÇÃO` varchar(10) COLLATE utf8_bin NOT NULL,
  `HORÁRIO` varchar(10) COLLATE utf8_bin NOT NULL,
  `AUTHORIZATION_ID (NSU)` int(11) NOT NULL,
  `ID SHELL BOX` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  KEY `index1` (`COD_AUT`),
  KEY `index2` (`AUTHORIZATION_ID (NSU)`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tmp_settlement_pag`
--

DROP TABLE IF EXISTS `tmp_settlement_pag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tmp_settlement_pag` (
  `output_item_id` int(10) unsigned NOT NULL,
  `connection_item_id` int(10) unsigned NOT NULL,
  `settlement_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tmp_shellBoxLotes`
--

DROP TABLE IF EXISTS `tmp_shellBoxLotes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tmp_shellBoxLotes` (
  `sb_id` int(10) unsigned NOT NULL DEFAULT '0',
  `id_consolidado` int(10) unsigned DEFAULT NULL,
  `consolidado` int(10) unsigned DEFAULT NULL,
  `id` int(10) unsigned NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tmp_shell_without_sales`
--

DROP TABLE IF EXISTS `tmp_shell_without_sales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tmp_shell_without_sales` (
  `referencia` varchar(20) NOT NULL,
  `data_documento` date DEFAULT NULL,
  `data_envio` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tmp_shellbox_envio_errado_compli`
--

DROP TABLE IF EXISTS `tmp_shellbox_envio_errado_compli`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tmp_shellbox_envio_errado_compli` (
  `id_cons` int(10) unsigned NOT NULL DEFAULT '0',
  `id_envio` int(10) unsigned NOT NULL DEFAULT '0',
  `sb_id` int(10) unsigned NOT NULL DEFAULT '0',
  `id_consolidado` int(10) unsigned DEFAULT NULL,
  `consolidado` int(10) unsigned DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tmp_shellbox_lotes_202305310140001e2`
--

DROP TABLE IF EXISTS `tmp_shellbox_lotes_202305310140001e2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tmp_shellbox_lotes_202305310140001e2` (
  `id` int(10) unsigned NOT NULL,
  `point` varchar(64) DEFAULT NULL,
  `empresa` varchar(20) DEFAULT NULL,
  `data_lancamento` date DEFAULT NULL,
  `data_documento` date DEFAULT NULL,
  `exercicio` varchar(10) DEFAULT NULL,
  `tipo_documento` varchar(10) DEFAULT NULL,
  `moeda` varchar(3) DEFAULT NULL,
  `referencia` varchar(20) NOT NULL,
  `texto_cabecalho` varchar(64) DEFAULT NULL,
  `chave_lancamento` varchar(5) DEFAULT NULL,
  `conta_cliente` varchar(16) DEFAULT NULL,
  `montante` decimal(16,2) DEFAULT NULL,
  `montante_mi` decimal(16,2) DEFAULT NULL,
  `local_negocio` varchar(15) DEFAULT NULL,
  `divisao` varchar(15) DEFAULT NULL,
  `sociedade` varchar(15) DEFAULT NULL,
  `centro_custo` varchar(15) DEFAULT NULL,
  `centro_lucro` varchar(15) DEFAULT NULL,
  `tp_movimento` varchar(15) DEFAULT NULL,
  `condicao_pgto` varchar(15) DEFAULT NULL,
  `chave_bloq_pgto` varchar(15) DEFAULT NULL,
  `forma_pagamento` varchar(15) DEFAULT NULL,
  `parceiro_txt` varchar(64) DEFAULT NULL,
  `data_txt` varchar(64) DEFAULT NULL,
  `taxa_1_txt` varchar(64) DEFAULT NULL,
  `taxa_2_txt` varchar(64) DEFAULT NULL,
  `taxa_3_txt` varchar(64) DEFAULT NULL,
  `atribuicao` varchar(20) DEFAULT NULL,
  `elemento_pep` varchar(15) DEFAULT NULL,
  `centro` varchar(15) DEFAULT NULL,
  `ordem` varchar(15) DEFAULT NULL,
  `material` varchar(15) DEFAULT NULL,
  `data_efetiva` date DEFAULT NULL,
  `razao_especial` varchar(15) DEFAULT NULL,
  `data_vencimento` date DEFAULT NULL,
  `data_pagamento` date DEFAULT NULL,
  `fee_parceiro` decimal(16,2) DEFAULT NULL,
  `fee_revendedor` decimal(16,2) DEFAULT NULL,
  `fee_payly` decimal(16,2) DEFAULT NULL,
  `taxa_parceiro` decimal(16,2) DEFAULT NULL,
  `taxa_revendedor` decimal(16,2) DEFAULT NULL,
  `taxa_payly` decimal(16,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tmp_shellboxids`
--

DROP TABLE IF EXISTS `tmp_shellboxids`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tmp_shellboxids` (
  `id` varchar(12) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tmp_sp_reprocessamento_1`
--

DROP TABLE IF EXISTS `tmp_sp_reprocessamento_1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tmp_sp_reprocessamento_1` (
  `connection_id` int(10) unsigned NOT NULL,
  `item_id` int(10) unsigned NOT NULL DEFAULT '0',
  `output_item_id` int(10) unsigned
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tmp_sp_reprocessamento_2`
--

DROP TABLE IF EXISTS `tmp_sp_reprocessamento_2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tmp_sp_reprocessamento_2` (
  `id` int(10) unsigned NOT NULL DEFAULT '0',
  `output_agenda_id` int(10) unsigned NOT NULL,
  `output_settlement_id` int(10) unsigned DEFAULT NULL,
  `output_anticipation_id` int(10) unsigned DEFAULT NULL,
  `output_unschedule_id` int(10) unsigned DEFAULT NULL,
  `status_id` decimal(1,0) NOT NULL,
  `settlement_date` date NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tmp_sp_reprocessamento_vendas`
--

DROP TABLE IF EXISTS `tmp_sp_reprocessamento_vendas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tmp_sp_reprocessamento_vendas` (
  `item_id` int(10) unsigned NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tmp_stellantis_reprocessamento_1`
--

DROP TABLE IF EXISTS `tmp_stellantis_reprocessamento_1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tmp_stellantis_reprocessamento_1` (
  `connection_id` int(10) unsigned NOT NULL,
  `item_id` int(10) unsigned NOT NULL DEFAULT '0',
  `output_item_id` int(10) unsigned
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tmp_stellantis_reprocessamento_2`
--

DROP TABLE IF EXISTS `tmp_stellantis_reprocessamento_2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tmp_stellantis_reprocessamento_2` (
  `id` int(10) unsigned NOT NULL DEFAULT '0',
  `output_agenda_id` int(10) unsigned NOT NULL,
  `output_settlement_id` int(10) unsigned DEFAULT NULL,
  `output_anticipation_id` int(10) unsigned DEFAULT NULL,
  `output_unschedule_id` int(10) unsigned DEFAULT NULL,
  `status_id` decimal(1,0) NOT NULL,
  `settlement_date` date NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tmp_stellantis_reprocessamento_vendas`
--

DROP TABLE IF EXISTS `tmp_stellantis_reprocessamento_vendas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tmp_stellantis_reprocessamento_vendas` (
  `item_id` int(10) unsigned NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tmp_tmp_liqui_eefi_porto_with_cv`
--

DROP TABLE IF EXISTS `tmp_tmp_liqui_eefi_porto_with_cv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tmp_tmp_liqui_eefi_porto_with_cv` (
  `codigo_shellbox` varchar(50) DEFAULT NULL,
  `tipo` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `codigosucursal` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `numerodocumento` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `datalancamento` date NOT NULL,
  `valorlancamento` decimal(20,6) NOT NULL,
  `c_credito_` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `banco` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `ag_ncia` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `conta_corrente` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `datamovimento` date NOT NULL,
  `numerorv` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `datarv` date NOT NULL,
  `bandeira` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `tipotransac_o` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `valordesconto` decimal(20,6) NOT NULL,
  `numeroparcela` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `numerototalparcelas` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `statuscredito` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `idautorizacao` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `idautorizacaooriginal` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tmp_vendas_1`
--

DROP TABLE IF EXISTS `tmp_vendas_1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tmp_vendas_1` (
  `connection_id` int(10) unsigned NOT NULL,
  `item_id` int(10) unsigned NOT NULL DEFAULT '0',
  `output_item_id` int(10) unsigned
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tmp_vendas_1333`
--

DROP TABLE IF EXISTS `tmp_vendas_1333`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tmp_vendas_1333` (
  `connection_id` int(10) unsigned NOT NULL,
  `item_id` int(10) unsigned NOT NULL DEFAULT '0',
  `output_item_id` int(10) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tmp_vendas_porto_2`
--

DROP TABLE IF EXISTS `tmp_vendas_porto_2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tmp_vendas_porto_2` (
  `item_id` int(10) unsigned NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tmp_vendas_xp_rep`
--

DROP TABLE IF EXISTS `tmp_vendas_xp_rep`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tmp_vendas_xp_rep` (
  `id` int(10) NOT NULL DEFAULT '0',
  `output_settlement_id` int(10) unsigned DEFAULT NULL,
  `output_anticipation_id` int(10) unsigned DEFAULT NULL,
  `output_sales_id` int(10) unsigned DEFAULT NULL,
  `output_reversal_id` int(10) unsigned DEFAULT NULL,
  `gross_value` decimal(10,2) NOT NULL,
  `fee_value` decimal(10,2) NOT NULL,
  `net_value` decimal(10,2) NOT NULL,
  `anticipation_fee_value` decimal(10,2) DEFAULT NULL,
  `settlement_value` decimal(10,2) DEFAULT NULL,
  `fee_rate` decimal(5,4) NOT NULL,
  `period_fee_rate` decimal(5,4) DEFAULT NULL,
  `monthly_fee_rate` decimal(5,4) DEFAULT NULL,
  `payment_date` date DEFAULT NULL,
  `payment_time` time DEFAULT NULL,
  `reversal_date` date DEFAULT NULL,
  `sales_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `payment_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `authorization_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `provider_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `provider_code_extra` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `credit_card_mask` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `payment_installments` decimal(2,0) DEFAULT NULL,
  `status_id` decimal(2,0) NOT NULL,
  `connection_item_id` int(10) unsigned DEFAULT NULL,
  `terminal_id` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `administration_fee_value` decimal(10,2) DEFAULT NULL,
  `interchange_fee_value` decimal(10,2) DEFAULT NULL,
  `financial_fee_value` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tmp_x_100`
--

DROP TABLE IF EXISTS `tmp_x_100`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tmp_x_100` (
  `output_item_id` int(10) unsigned NOT NULL,
  `connection_item_id` int(10) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tmp_x_101`
--

DROP TABLE IF EXISTS `tmp_x_101`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tmp_x_101` (
  `agenda_id` int(10) unsigned NOT NULL,
  `settlement_id` int(10) unsigned DEFAULT NULL,
  `item_id` int(10) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tmp_xp_reprocessamento`
--

DROP TABLE IF EXISTS `tmp_xp_reprocessamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tmp_xp_reprocessamento` (
  `connection_id` int(10) unsigned NOT NULL,
  `output_item_id` int(10) unsigned NOT NULL,
  `connection_item_id` int(10) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tmp_xp_reprocessamento_2`
--

DROP TABLE IF EXISTS `tmp_xp_reprocessamento_2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tmp_xp_reprocessamento_2` (
  `id` int(10) unsigned NOT NULL DEFAULT '0',
  `output_agenda_id` int(10) unsigned NOT NULL,
  `output_settlement_id` int(10) unsigned DEFAULT NULL,
  `output_anticipation_id` int(10) unsigned DEFAULT NULL,
  `output_unschedule_id` int(10) unsigned DEFAULT NULL,
  `status_id` decimal(1,0) NOT NULL,
  `settlement_date` date NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tmp_xp_reprocessamento_vendas`
--

DROP TABLE IF EXISTS `tmp_xp_reprocessamento_vendas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tmp_xp_reprocessamento_vendas` (
  `item_id` int(10) unsigned NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `transacao_btg`
--

DROP TABLE IF EXISTS `transacao_btg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transacao_btg` (
  `id` int(10) unsigned NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `transacoes_erradas`
--

DROP TABLE IF EXISTS `transacoes_erradas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transacoes_erradas` (
  `output_item_id` int(10) unsigned NOT NULL,
  `connection_item_id` int(10) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `transacoes_sap_08_07`
--

DROP TABLE IF EXISTS `transacoes_sap_08_07`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transacoes_sap_08_07` (
  `data_envio` datetime DEFAULT NULL,
  `1` int(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_client` int(10) unsigned DEFAULT NULL,
  `id_role` int(10) unsigned DEFAULT NULL,
  `id_contact` int(10) unsigned DEFAULT NULL,
  `headquarter_id` int(10) unsigned DEFAULT NULL,
  `id_aggregator` int(11) DEFAULT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `last_access_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `last_password_change_date` date NOT NULL DEFAULT '0000-00-00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  KEY `users_id_company_foreign` (`id_client`),
  KEY `users_id_role_foreign` (`id_role`),
  KEY `users_id_contact_foreign` (`id_contact`),
  KEY `fk_headquarter_id_user` (`headquarter_id`),
  KEY `fk_user_status_user_status_id_idx` (`status`),
  CONSTRAINT `fk_headquarter_id_user` FOREIGN KEY (`headquarter_id`) REFERENCES `client` (`id`),
  CONSTRAINT `users_id_company_foreign` FOREIGN KEY (`id_client`) REFERENCES `client` (`id`),
  CONSTRAINT `users_id_contact_foreign` FOREIGN KEY (`id_contact`) REFERENCES `contact` (`id`),
  CONSTRAINT `users_id_role_foreign` FOREIGN KEY (`id_role`) REFERENCES `role` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5727 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_backoffice`
--

DROP TABLE IF EXISTS `user_backoffice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_backoffice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) NOT NULL,
  `enabled` tinyint(4) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_user` (`id_user`)
) ENGINE=InnoDB AUTO_INCREMENT=88 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_control`
--

DROP TABLE IF EXISTS `user_control`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_control` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `client_id` int(10) unsigned DEFAULT NULL,
  `user_id` int(10) unsigned DEFAULT NULL,
  `time_window_in_minutes` int(10) unsigned NOT NULL,
  `password_days_to_expire` int(11) NOT NULL DEFAULT '90',
  `description` varchar(150) DEFAULT 'Tempo customizado para usuário/cliente',
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id_UNIQUE` (`user_id`),
  UNIQUE KEY `client_id_UNIQUE` (`client_id`),
  KEY `fk_user_control_user_idx` (`user_id`),
  KEY `fk_user_control_client_idx` (`client_id`),
  CONSTRAINT `fk_user_control_client` FOREIGN KEY (`client_id`) REFERENCES `client` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_control_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_login_control`
--

DROP TABLE IF EXISTS `user_login_control`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_login_control` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `login_date` timestamp NOT NULL,
  `successful` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_user_login_user_idx` (`user_id`),
  KEY `index_user_id_login_date_successful` (`user_id`,`login_date`,`successful`),
  CONSTRAINT `fk_user_login_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=225608 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_notification_processing`
--

DROP TABLE IF EXISTS `user_notification_processing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_notification_processing` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) NOT NULL,
  `check_time` time NOT NULL DEFAULT '12:00:00',
  `emails` varchar(512) DEFAULT NULL,
  `notified_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `active` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_user` (`user_id`,`check_time`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_old_passwords`
--

DROP TABLE IF EXISTS `user_old_passwords`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_old_passwords` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `old_password` varchar(80) NOT NULL,
  `pw_date` date NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `old_password_UNIQUE` (`old_password`,`user_id`,`pw_date`) USING BTREE,
  KEY `fk_user_old_pw_user_idx` (`user_id`),
  CONSTRAINT `fk_user_old_pw_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=726 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_status`
--

DROP TABLE IF EXISTS `user_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_status` (
  `id` tinyint(1) NOT NULL,
  `name` varchar(45) NOT NULL,
  `description` varchar(150) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_status_log`
--

DROP TABLE IF EXISTS `user_status_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_status_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `update_user_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_user_status_log_user1_idx` (`user_id`),
  KEY `fk_user_status_log_user2_idx` (`update_user_id`),
  CONSTRAINT `fk_user_status_log_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_status_log_user2` FOREIGN KEY (`update_user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Final view structure for view `sales_statement`
--

/*!50001 DROP VIEW IF EXISTS `sales_statement`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `sales_statement` AS select `it`.`client_id` AS `client_id`,`it`.`item_date` AS `item_date`,`pm`.`payment_method_id` AS `payment_method_id`,`pm`.`name` AS `payment_method_name`,`prov`.`provider_id` AS `provider_id`,`prov`.`name` AS `provider_name`,sum((case when (`sl`.`status_id` <> 1) then (case when isnull(`ad`.`gross_value`) then `sl`.`gross_value` else `ad`.`gross_value` end) else 0 end)) AS `registered`,sum((case when (`sl`.`status_id` <> 0) then `sl`.`gross_value` else 0 end)) AS `confirmed`,sum((case when (`sl`.`status_id` in (3,4)) then `sl`.`gross_value` else 0 end)) AS `reconciliated`,sum((case when (`sl`.`status_id` = 1) then `sl`.`gross_value` else 0 end)) AS `not_registered`,(-(1) * sum((case when (`sl`.`status_id` = 0) then `sl`.`gross_value` else 0 end))) AS `not_recognized`,sum((case when ((`sl`.`status_id` = 3) and (`ad`.`gross_value` is not null)) then (`sl`.`gross_value` - `ad`.`gross_value`) else 0 end)) AS `diverged_value`,(sum((case when (`sl`.`status_id` <> 0) then `sl`.`gross_value` else 0 end)) - sum((case when (`sl`.`status_id` <> 1) then (case when isnull(`ad`.`gross_value`) then `sl`.`gross_value` else `ad`.`gross_value` end) else 0 end))) AS `total_divergence` from (((((`output_item` `it` join `output_reconciliation` `rec` on((`rec`.`id` = `it`.`id`))) join `output_sales` `sl` on((`sl`.`id` = `rec`.`id`))) left join `output_sales_adjusts` `ad` on((`ad`.`id` = `sl`.`output_sales_adjusts_id`))) join `payment_method` `pm` on((`pm`.`payment_method_id` = `rec`.`payment_method_id`))) join `provider` `prov` on((`prov`.`provider_id` = `rec`.`provider_id`))) group by `it`.`client_id`,`it`.`item_date`,`pm`.`payment_method_id`,`prov`.`provider_id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-07-28 13:29:32
