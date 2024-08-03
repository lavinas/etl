-- MySQL dump 10.13  Distrib 8.0.37, for Linux (x86_64)
--
-- Host: mysql.vooo.ws    Database: vooo_prod_rawdata
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

DROP DATABASE IF EXISTS `vooo_prod_rawdata`;
CREATE DATABASE `vooo_prod_rawdata`;
USE `vooo_prod_rawdata`;

--
-- Table structure for table `conn_item_accesstage_control`
--

DROP TABLE IF EXISTS `conn_item_accesstage_control`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_accesstage_control` (
  `item_id` int(10) unsigned NOT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `file_type` varchar(50) DEFAULT NULL,
  `provider` varchar(50) DEFAULT NULL,
  `store` varchar(50) DEFAULT NULL,
  `check_status` decimal(1,0) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_accesstage_control_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_accesstage_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_accesstage_line`
--

DROP TABLE IF EXISTS `conn_item_accesstage_line`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_accesstage_line` (
  `item_id` int(10) unsigned NOT NULL,
  `register_type` varchar(10) DEFAULT NULL,
  `masterid` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  KEY `masterid` (`masterid`),
  CONSTRAINT `conn_item_accesstage_line_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `vooo_prod_backend`.`connection_item` (`item_id`),
  CONSTRAINT `conn_item_accesstage_line_ibfk_2` FOREIGN KEY (`masterid`) REFERENCES `conn_item_accesstage_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_accesstage_sales`
--

DROP TABLE IF EXISTS `conn_item_accesstage_sales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_accesstage_sales` (
  `item_id` int(10) unsigned NOT NULL,
  `data_venda` date DEFAULT NULL,
  `plano` decimal(2,0) DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `lote` varchar(10) DEFAULT NULL,
  `nsu` varchar(10) DEFAULT NULL,
  `autorizacao` varchar(10) DEFAULT NULL,
  `sinal` varchar(1) DEFAULT NULL,
  `venda` decimal(10,2) DEFAULT NULL,
  `taxa_administracao` decimal(10,2) DEFAULT NULL,
  `taxa_antecipacao` decimal(10,2) DEFAULT NULL,
  `liquido_pago` decimal(10,2) DEFAULT NULL,
  `produto` varchar(20) DEFAULT NULL,
  `operadora` varchar(20) DEFAULT NULL,
  `banco` decimal(5,0) DEFAULT NULL,
  `agencia` decimal(10,0) DEFAULT NULL,
  `conta_corrente` varchar(15) DEFAULT NULL,
  `tid` varchar(20) DEFAULT NULL,
  `numero_logico` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  KEY `idx_accesstage_sales_1` (`data_venda`),
  KEY `idx_accesstage_sales_tmp_1` (`nsu`,`data_venda`,`operadora`),
  CONSTRAINT `conn_item_accesstage_sales_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_accesstage_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_accesstage_settlement`
--

DROP TABLE IF EXISTS `conn_item_accesstage_settlement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_accesstage_settlement` (
  `item_id` int(10) unsigned NOT NULL,
  `data_venda` date DEFAULT NULL,
  `parcela` decimal(2,0) DEFAULT NULL,
  `plano` decimal(2,0) DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `lote` varchar(10) DEFAULT NULL,
  `nsu` varchar(10) DEFAULT NULL,
  `autorizacao` varchar(10) DEFAULT NULL,
  `sinal` varchar(1) DEFAULT NULL,
  `venda` decimal(10,2) DEFAULT NULL,
  `taxa_administracao` decimal(10,2) DEFAULT NULL,
  `taxa_antecipacao` decimal(10,2) DEFAULT NULL,
  `liquido_pago` decimal(10,2) DEFAULT NULL,
  `data_credito` date DEFAULT NULL,
  `produto` varchar(20) DEFAULT NULL,
  `operadora` varchar(20) DEFAULT NULL,
  `banco` decimal(5,0) DEFAULT NULL,
  `agencia` decimal(10,0) DEFAULT NULL,
  `conta_corrente` varchar(15) DEFAULT NULL,
  `tid` varchar(20) DEFAULT NULL,
  `numero_logico` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_accesstage_settlement_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_accesstage_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_adiq_ajustes`
--

DROP TABLE IF EXISTS `conn_item_adiq_ajustes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_adiq_ajustes` (
  `item_id` int(10) unsigned NOT NULL,
  `codigo_registro` varchar(2) NOT NULL,
  `codigo_estabelecimento` varchar(15) NOT NULL,
  `nsu_host_transacao_original` decimal(12,0) NOT NULL,
  `data_transacao_original` date NOT NULL,
  `numero_parcela` decimal(2,0) NOT NULL,
  `nsu_host_transacao` decimal(12,0) NOT NULL,
  `data_transacao_aj` date NOT NULL,
  `horario_transacao` time NOT NULL,
  `tipo_lancamento` varchar(2) NOT NULL,
  `data_lancamento` date NOT NULL,
  `meio_captura_aj` decimal(1,0) NOT NULL,
  `tipo_aj` decimal(1,0) NOT NULL,
  `codigo_aj` decimal(3,0) NOT NULL,
  `descricao_motivo_aj` varchar(30) NOT NULL,
  `valor_bruto` decimal(11,2) NOT NULL,
  `valor_desconto` decimal(11,2) NOT NULL,
  `valor_liquido` decimal(11,2) NOT NULL,
  `banco` decimal(3,0) NOT NULL,
  `agencia` decimal(6,0) NOT NULL,
  `conta_corrente` varchar(11) NOT NULL,
  `numero_cartao_transacao_original` varchar(19) NOT NULL,
  `codigo_bandeira` varchar(3) NOT NULL,
  `codigo_produto` varchar(3) NOT NULL,
  `valor_taxa_antecipacao` decimal(11,2) NOT NULL,
  `valor_liquido_antecipado` decimal(11,2) NOT NULL,
  `id_envelope` decimal(18,0) NOT NULL,
  `trace` decimal(6,0) NOT NULL,
  `conta_pagamento` decimal(20,0) NOT NULL,
  `codigo_pedido` varchar(30) NOT NULL,
  `id_financeira_payware` decimal(18,0) NOT NULL,
  `id_antecipacao_payware` decimal(18,0) NOT NULL,
  `id_pagamento_payware` decimal(18,0) NOT NULL,
  `codigo_comercio_payware` decimal(18,0) NOT NULL,
  `codigo_filial_payware` decimal(18,0) NOT NULL,
  `mcc` decimal(4,0) NOT NULL,
  `filial_adquirente` decimal(9,0) NOT NULL,
  `nsu_host_terminal` decimal(12,0) NOT NULL,
  `nseq` decimal(6,0) NOT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_adiq_ajustes_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_adiq_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_adiq_cancelamentos`
--

DROP TABLE IF EXISTS `conn_item_adiq_cancelamentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_adiq_cancelamentos` (
  `item_id` int(10) unsigned NOT NULL,
  `codigo_registro` varchar(2) NOT NULL,
  `codigo_estabelecimento` varchar(15) NOT NULL,
  `nsu_host_transacao_original` decimal(12,0) NOT NULL,
  `data_transacao_original` date NOT NULL,
  `numero_parcela` decimal(2,0) NOT NULL,
  `nsu_host_transacao` decimal(12,0) NOT NULL,
  `data_transacao` date NOT NULL,
  `horario_transacao` time NOT NULL,
  `meio_captura` decimal(1,0) NOT NULL,
  `id_envelope` decimal(18,0) NOT NULL,
  `trace` decimal(6,0) NOT NULL,
  `codigo_pedido` varchar(30) NOT NULL,
  `id_financeira_payware` decimal(18,0) NOT NULL,
  `id_antecipacao_payware` decimal(18,0) NOT NULL,
  `id_pagamento_payware` decimal(18,0) NOT NULL,
  `codigo_comercio_payware` decimal(18,0) NOT NULL,
  `codigo_filial_payware` decimal(18,0) NOT NULL,
  `mcc` decimal(4,0) NOT NULL,
  `filial_adquirente` decimal(9,0) NOT NULL,
  `valor_bruto_cancelamento` decimal(12,2) NOT NULL,
  `valor_bruto_parcela_cancelamento` decimal(12,2) NOT NULL,
  `valor_desconto_cancelamento` decimal(12,2) NOT NULL,
  `valor_liquido_cancelamento` decimal(12,2) NOT NULL,
  `valor_bruto_original` decimal(12,2) NOT NULL,
  `valor_liquido_original` decimal(12,2) NOT NULL,
  `valor_comissao_original` decimal(12,2) NOT NULL,
  `numero_parcelas_original` decimal(4,0) NOT NULL,
  `codigo_autorizacao_original` decimal(12,0) NOT NULL,
  `nsu_host_terminal` decimal(12,0) NOT NULL,
  `nseq` decimal(6,0) NOT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_adiq_cancelamentos_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_adiq_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_adiq_cv`
--

DROP TABLE IF EXISTS `conn_item_adiq_cv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_adiq_cv` (
  `item_id` int(10) unsigned NOT NULL,
  `codigo_registro` varchar(2) NOT NULL,
  `codigo_estabelecimento` varchar(15) NOT NULL,
  `nsu_host_transacao` decimal(12,0) NOT NULL,
  `data_transacao` date NOT NULL,
  `horario_transacao` time NOT NULL,
  `tipo_lancamento` varchar(2) NOT NULL,
  `data_lancamento` date NOT NULL,
  `tipo_produto` varchar(1) NOT NULL,
  `meio_captura` decimal(1,0) NOT NULL,
  `valor_bruto` decimal(11,2) NOT NULL,
  `valor_desconto` decimal(11,2) NOT NULL,
  `valor_liquido` decimal(11,2) NOT NULL,
  `numero_cartao` varchar(19) NOT NULL,
  `numero_parcela` decimal(2,0) NOT NULL,
  `numero_total_parcelas` decimal(2,0) NOT NULL,
  `nsu_host_parcela` decimal(12,0) NOT NULL,
  `valor_bruto_parcela` decimal(11,2) NOT NULL,
  `valor_desconto_parcela` decimal(11,2) NOT NULL,
  `valor_liquido_parcela` decimal(11,2) NOT NULL,
  `banco` decimal(3,0) NOT NULL,
  `agencia` decimal(6,0) NOT NULL,
  `conta_corrente` varchar(11) NOT NULL,
  `codigo_autorizacao` varchar(12) NOT NULL,
  `codigo_bandeira` varchar(3) NOT NULL,
  `codigo_produto` varchar(3) NOT NULL,
  `valor_taxa_interchange` decimal(11,2) NOT NULL,
  `valor_taxa_administracao` decimal(11,2) NOT NULL,
  `valor_taxa_interchange_parcela` decimal(11,2) NOT NULL,
  `valor_taxa_administracao_parcela` decimal(11,2) NOT NULL,
  `valor_redutor_multi_fronteira` decimal(11,2) NOT NULL,
  `valor_taxa_antecipacao` decimal(11,2) NOT NULL,
  `valor_liquido_antecipado` decimal(11,2) NOT NULL,
  `tipo_transacao` decimal(2,0) NOT NULL,
  `codigo_pedido` varchar(30) NOT NULL,
  `sigla_pais` varchar(3) NOT NULL,
  `numero_terminal` varchar(8) NOT NULL,
  `id_envelope` decimal(18,0) NOT NULL,
  `trace` decimal(6,0) NOT NULL,
  `conta_pagamento` decimal(20,0) NOT NULL,
  `id_financeira_payware` decimal(18,0) NOT NULL,
  `id_antecipacao_payware` decimal(18,0) NOT NULL,
  `id_pagamento_payware` decimal(18,0) NOT NULL,
  `codigo_comercio_payware` decimal(18,0) NOT NULL,
  `codigo_filial_payware` decimal(18,0) NOT NULL,
  `mcc` decimal(4,0) NOT NULL,
  `filial_adquirente` decimal(9,0) NOT NULL,
  `nsu_host_terminal` decimal(12,0) NOT NULL,
  `nseq` decimal(6,0) NOT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_adiq_cv_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_adiq_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_adiq_header`
--

DROP TABLE IF EXISTS `conn_item_adiq_header`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_adiq_header` (
  `item_id` int(10) unsigned NOT NULL,
  `codigo_registro` varchar(2) NOT NULL,
  `versao_layout` varchar(6) NOT NULL,
  `data_criacao_arquivo` date NOT NULL,
  `hora_criacao_arquivo` time NOT NULL,
  `id_movimento` decimal(6,0) NOT NULL,
  `nome_adquirente` varchar(30) NOT NULL,
  `id_provedor_servico` decimal(4,0) NOT NULL,
  `codigo_estabelecimento` decimal(9,0) NOT NULL,
  `tipo_processamento` varchar(1) NOT NULL,
  `nseq` decimal(6,0) NOT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_adiq_header_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_adiq_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_adiq_header_lote`
--

DROP TABLE IF EXISTS `conn_item_adiq_header_lote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_adiq_header_lote` (
  `item_id` int(10) unsigned NOT NULL,
  `codigo_registro` varchar(2) NOT NULL,
  `data_movimento` date NOT NULL,
  `id_moeda` varchar(2) NOT NULL,
  `nseq` decimal(6,0) NOT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_adiq_header_lote_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_adiq_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_adiq_line`
--

DROP TABLE IF EXISTS `conn_item_adiq_line`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_adiq_line` (
  `item_id` int(10) unsigned NOT NULL,
  `registertype` varchar(2) NOT NULL,
  `masterid` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  KEY `masterid` (`masterid`),
  CONSTRAINT `conn_item_adiq_line_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `vooo_prod_backend`.`connection_item` (`item_id`),
  CONSTRAINT `conn_item_adiq_line_ibfk_2` FOREIGN KEY (`masterid`) REFERENCES `conn_item_adiq_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_adiq_trailer`
--

DROP TABLE IF EXISTS `conn_item_adiq_trailer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_adiq_trailer` (
  `item_id` int(10) unsigned NOT NULL,
  `codigo_registro` varchar(2) NOT NULL,
  `quantidade_registros` decimal(6,0) NOT NULL,
  `nseq` decimal(6,0) NOT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_adiq_trailer_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_adiq_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_adiq_trailer_lote`
--

DROP TABLE IF EXISTS `conn_item_adiq_trailer_lote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_adiq_trailer_lote` (
  `item_id` int(10) unsigned NOT NULL,
  `codigo_registro` varchar(2) NOT NULL,
  `quantidade_registros` decimal(6,0) NOT NULL,
  `total_valores` decimal(14,0) NOT NULL,
  `nseq` decimal(6,0) NOT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_adiq_trailer_lote_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_adiq_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_alelo_antecipacao`
--

DROP TABLE IF EXISTS `conn_item_alelo_antecipacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_alelo_antecipacao` (
  `item_id` int(10) unsigned NOT NULL,
  `regtypeid` int(10) unsigned DEFAULT NULL,
  `estabelecimentoemissor` int(10) unsigned DEFAULT NULL,
  `numerooperacaofinanceira` int(10) unsigned DEFAULT NULL,
  `datacredito` date DEFAULT NULL,
  `sinalbrutoantecipacaoavista` varchar(1) DEFAULT NULL,
  `valorbrutoantecipacaoavista` decimal(10,2) DEFAULT NULL,
  `sinalbrutoantecipacaoparcelado` varchar(1) DEFAULT NULL,
  `valorbrutoantecipacaoparcelado` decimal(10,2) DEFAULT NULL,
  `sinalbrutoantecipacaoelectron` varchar(1) DEFAULT NULL,
  `valorbrutoantecipacaoelectron` decimal(10,2) DEFAULT NULL,
  `sinalbrutoantecipacaototal` varchar(1) DEFAULT NULL,
  `valorbrutoantecipacaototal` decimal(10,2) DEFAULT NULL,
  `sinalliquidoantecipacaoavista` varchar(1) DEFAULT NULL,
  `valorliquidoantecipacaoavista` decimal(10,2) DEFAULT NULL,
  `sinalliquidoantecipacaoparcelado` varchar(1) DEFAULT NULL,
  `valorliquidoantecipacaoparcelado` decimal(10,2) DEFAULT NULL,
  `sinalliquidoantecipacaoelectron` varchar(1) DEFAULT NULL,
  `valorliquidoantecipacaoelectron` decimal(10,2) DEFAULT NULL,
  `sinalliquidoantecipacaototal` varchar(1) DEFAULT NULL,
  `valorliquidoantecipacaototal` decimal(10,2) DEFAULT NULL,
  `taxadescontoantecipacao` decimal(10,2) DEFAULT NULL,
  `banco` int(10) unsigned DEFAULT NULL,
  `agencia` int(10) unsigned DEFAULT NULL,
  `contacorrente` varchar(15) DEFAULT NULL,
  `sinalliquidoantecipacao` varchar(1) DEFAULT NULL,
  `valorliquidoantecipacao` decimal(10,2) DEFAULT NULL,
  `reservadoalelo` varchar(68) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_alelo_antecipacao_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_alelo_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_alelo_cv`
--

DROP TABLE IF EXISTS `conn_item_alelo_cv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_alelo_cv` (
  `item_id` int(10) unsigned NOT NULL,
  `regtypeid` int(10) unsigned DEFAULT NULL,
  `estabelecimentosubmissor` int(10) unsigned DEFAULT NULL,
  `numeroRO` int(10) unsigned DEFAULT NULL,
  `numerocartao` varchar(19) DEFAULT NULL,
  `datavendaajuste` date DEFAULT NULL,
  `sinalcompraparcela` varchar(1) DEFAULT NULL,
  `valorcompraparcela` decimal(10,2) DEFAULT NULL,
  `parcela` int(10) unsigned DEFAULT NULL,
  `totalparcelas` int(10) unsigned DEFAULT NULL,
  `motivorejeicao` varchar(3) DEFAULT NULL,
  `codigoautorizacao` varchar(6) DEFAULT NULL,
  `TID` varchar(20) DEFAULT NULL,
  `NSU` varchar(6) DEFAULT NULL,
  `valorcomplementar` decimal(10,2) DEFAULT NULL,
  `numerodigitoscartao` int(10) unsigned DEFAULT NULL,
  `valortotalvenda` decimal(10,2) DEFAULT NULL,
  `valorproximaparcela` decimal(10,2) DEFAULT NULL,
  `numeronotafiscal` varchar(20) DEFAULT NULL,
  `cartaoemitidoexterior` int(10) unsigned DEFAULT NULL,
  `numerologicoterminal` varchar(8) DEFAULT NULL,
  `identificadortaxaembarque` varchar(2) DEFAULT NULL,
  `referenciacodigopedido` varchar(20) DEFAULT NULL,
  `horatransacao` time DEFAULT NULL,
  `numerounicotransacao` varchar(29) DEFAULT NULL,
  `indicadoralelopremia` varchar(1) DEFAULT NULL,
  `usoalelo` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_alelo_cv_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_alelo_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_alelo_header`
--

DROP TABLE IF EXISTS `conn_item_alelo_header`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_alelo_header` (
  `item_id` int(10) unsigned NOT NULL,
  `regtypeid` int(10) unsigned DEFAULT NULL,
  `estabelecimentomatriz` decimal(11,0) DEFAULT NULL,
  `dataprocessamento` date DEFAULT NULL,
  `periodoinicial` date DEFAULT NULL,
  `periodofinal` date DEFAULT NULL,
  `sequencia` int(10) unsigned DEFAULT NULL,
  `opcaoextrato` int(10) unsigned DEFAULT NULL,
  `empresaadquirente` varchar(50) DEFAULT NULL,
  `transmissao` varchar(1) DEFAULT NULL,
  `caixa_postal` varchar(20) DEFAULT NULL,
  `versao_layout` decimal(3,0) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_alelo_header_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_alelo_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_alelo_line`
--

DROP TABLE IF EXISTS `conn_item_alelo_line`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_alelo_line` (
  `item_id` int(10) unsigned NOT NULL,
  `registertype` int(10) unsigned DEFAULT NULL,
  `filetype` int(10) unsigned DEFAULT NULL,
  `fileline` varchar(350) DEFAULT NULL,
  `masterid` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  KEY `masterid` (`masterid`),
  CONSTRAINT `conn_item_alelo_line_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `vooo_prod_backend`.`connection_item` (`item_id`),
  CONSTRAINT `conn_item_alelo_line_ibfk_2` FOREIGN KEY (`masterid`) REFERENCES `conn_item_alelo_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_alelo_ro`
--

DROP TABLE IF EXISTS `conn_item_alelo_ro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_alelo_ro` (
  `item_id` int(10) unsigned NOT NULL,
  `regtypeid` int(10) unsigned DEFAULT NULL,
  `estabelecimentosubmissor` int(10) unsigned DEFAULT NULL,
  `numeroRO` int(10) unsigned DEFAULT NULL,
  `parcela` varchar(2) DEFAULT NULL,
  `filler` varchar(2) DEFAULT NULL,
  `plano` varchar(2) DEFAULT NULL,
  `tipotransacao` int(10) unsigned DEFAULT NULL,
  `dataapresentacao` date DEFAULT NULL,
  `datapagamento` date DEFAULT NULL,
  `dataenviobanco` date DEFAULT NULL,
  `sinalvalorbruto` varchar(1) DEFAULT NULL,
  `valorbruto` decimal(10,2) DEFAULT NULL,
  `sinalcomissao` varchar(1) DEFAULT NULL,
  `valorcomissao` decimal(10,2) DEFAULT NULL,
  `sinalrejeitado` varchar(1) DEFAULT NULL,
  `valorrejeitado` decimal(10,2) DEFAULT NULL,
  `sinalliquido` varchar(1) DEFAULT NULL,
  `valorliquido` decimal(10,2) DEFAULT NULL,
  `banco` int(10) unsigned DEFAULT NULL,
  `agencia` int(10) unsigned DEFAULT NULL,
  `contacorrente` varchar(15) DEFAULT NULL,
  `statuspagamento` int(10) unsigned DEFAULT NULL,
  `qtdeCVaceitos` int(10) unsigned DEFAULT NULL,
  `idvelhoproduto` varchar(2) DEFAULT NULL,
  `qtdeCV` int(10) unsigned DEFAULT NULL,
  `revendaaceleracao` varchar(1) DEFAULT NULL,
  `datacaptura` date DEFAULT NULL,
  `origemajuste` varchar(2) DEFAULT NULL,
  `valorcomplementar` decimal(10,2) DEFAULT NULL,
  `tipoantecipacao` varchar(1) DEFAULT NULL,
  `correspondenciaantecipacao` int(10) unsigned DEFAULT NULL,
  `sinalantecipacaobruto` varchar(1) DEFAULT NULL,
  `valorantecipacaobruto` decimal(10,2) DEFAULT NULL,
  `bandeira` int(10) unsigned DEFAULT NULL,
  `numerounicoro` varchar(22) DEFAULT NULL,
  `percentalcomissao` int(10) unsigned DEFAULT NULL,
  `tarifa` int(10) unsigned DEFAULT NULL,
  `taxagarantia` int(10) unsigned DEFAULT NULL,
  `meiocaptura` varchar(2) DEFAULT NULL,
  `numerologicoterminal` varchar(8) DEFAULT NULL,
  `idnovoproduto` int(10) unsigned DEFAULT NULL,
  `usoalelo` varchar(15) DEFAULT NULL,
  `percentual_comissao_decimal` decimal(5,4) DEFAULT NULL,
  `numerounicoro_15` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_alelo_ro_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_alelo_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_alelo_ro_antecipado`
--

DROP TABLE IF EXISTS `conn_item_alelo_ro_antecipado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_alelo_ro_antecipado` (
  `item_id` int(10) unsigned NOT NULL,
  `regtypeid` int(10) unsigned DEFAULT NULL,
  `estabelecimentoemissor` int(10) unsigned DEFAULT NULL,
  `numerooperacaoantecipacao` int(10) unsigned DEFAULT NULL,
  `datavencimentoro` date DEFAULT NULL,
  `numeroroantecipado` int(10) unsigned DEFAULT NULL,
  `parcelaantecipada` int(10) unsigned DEFAULT NULL,
  `totalparcelas` int(10) unsigned DEFAULT NULL,
  `sinalbrutooriginal` varchar(1) DEFAULT NULL,
  `valorbrutooriginal` decimal(10,2) DEFAULT NULL,
  `sinalliquidooriginal` varchar(1) DEFAULT NULL,
  `valorliquidooriginal` decimal(10,2) DEFAULT NULL,
  `sinalbrutoantecipacao` varchar(1) DEFAULT NULL,
  `valorbrutoantecipacao` decimal(10,2) DEFAULT NULL,
  `sinalliquidoantecipacao` varchar(1) DEFAULT NULL,
  `valorliquidoantecipacao` decimal(10,2) DEFAULT NULL,
  `bandeira` int(10) unsigned DEFAULT NULL,
  `numerounicoro` varchar(22) DEFAULT NULL,
  `usoalelo` varchar(130) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_alelo_ro_antecipado_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_alelo_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_alelo_ro_debito_antecipacao`
--

DROP TABLE IF EXISTS `conn_item_alelo_ro_debito_antecipacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_alelo_ro_debito_antecipacao` (
  `item_id` int(10) unsigned NOT NULL,
  `regtypeid` int(10) unsigned DEFAULT NULL,
  `estabelecimentosubmissor` int(10) unsigned DEFAULT NULL,
  `numerounicorooriginalvenda` varchar(22) DEFAULT NULL,
  `numerorooriginalvenda` int(10) unsigned DEFAULT NULL,
  `datapagamentoroantecipado` date DEFAULT NULL,
  `sinalbrutoroantecipado` varchar(1) DEFAULT NULL,
  `valorbrutoroantecipado` decimal(10,2) DEFAULT NULL,
  `numerounicorovendageradorajuste` varchar(22) DEFAULT NULL,
  `numeroroajuste` int(10) unsigned DEFAULT NULL,
  `datapagamentoajuste` date DEFAULT NULL,
  `sinalajustedebito` varchar(1) DEFAULT NULL,
  `valorajustedebito` decimal(10,2) DEFAULT NULL,
  `sinalvalorcompensado` varchar(1) DEFAULT NULL,
  `valorcompensado` decimal(10,2) DEFAULT NULL,
  `sinalsaldoroantecipado` varchar(1) DEFAULT NULL,
  `valorsaldoroantecipado` decimal(10,2) DEFAULT NULL,
  `usoalelo` varchar(9) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_alelo_ro_debito_antecipacao_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_alelo_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_alelo_trailer`
--

DROP TABLE IF EXISTS `conn_item_alelo_trailer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_alelo_trailer` (
  `item_id` int(10) unsigned NOT NULL,
  `regtypeid` int(10) unsigned DEFAULT NULL,
  `totalregistro` int(10) unsigned DEFAULT NULL,
  `usoalelo` varchar(238) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_alelo_trailer_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_alelo_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_alelo_v2_header`
--

DROP TABLE IF EXISTS `conn_item_alelo_v2_header`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_alelo_v2_header` (
  `item_id` int(10) unsigned NOT NULL,
  `tipo_registro` int(10) unsigned DEFAULT NULL,
  `identificador_agrupamento` decimal(15,0) DEFAULT NULL,
  `data_processamento` date DEFAULT NULL,
  `periodo_inicial` date DEFAULT NULL,
  `periodo_final` date DEFAULT NULL,
  `tipo_arquivo` varchar(1) DEFAULT NULL,
  `sequencia` int(10) unsigned DEFAULT NULL,
  `empresa_adquirente` varchar(50) DEFAULT NULL,
  `tipo_extrato` int(10) unsigned DEFAULT NULL,
  `caixa_postal` varchar(50) DEFAULT NULL,
  `versao_layout` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_alelo_v2_header_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_alelo_v2_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_alelo_v2_line`
--

DROP TABLE IF EXISTS `conn_item_alelo_v2_line`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_alelo_v2_line` (
  `item_id` int(10) unsigned NOT NULL,
  `register_type` int(10) unsigned DEFAULT NULL,
  `filetype` int(10) unsigned DEFAULT NULL,
  `masterid` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  KEY `masterid` (`masterid`),
  CONSTRAINT `conn_item_alelo_v2_line_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `vooo_prod_backend`.`connection_item` (`item_id`),
  CONSTRAINT `conn_item_alelo_v2_line_ibfk_2` FOREIGN KEY (`masterid`) REFERENCES `conn_item_alelo_v2_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_alelo_v2_movimento`
--

DROP TABLE IF EXISTS `conn_item_alelo_v2_movimento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_alelo_v2_movimento` (
  `item_id` int(10) unsigned NOT NULL,
  `tipo_registro` int(10) unsigned DEFAULT NULL,
  `id_pagamento` varchar(30) DEFAULT NULL,
  `estabelecimento_matriz` decimal(15,0) DEFAULT NULL,
  `ec_filial` decimal(15,0) DEFAULT NULL,
  `raiz_cnpj` varchar(8) DEFAULT NULL,
  `tipo_movimento` varchar(3) DEFAULT NULL,
  `origem_ajuste` varchar(6) DEFAULT NULL,
  `id_compensacao` decimal(15,0) DEFAULT NULL,
  `data_processamento` date DEFAULT NULL,
  `data_evento` date DEFAULT NULL,
  `data_captura` date DEFAULT NULL,
  `hora_captura` time DEFAULT NULL,
  `data_previsao_liquidacao` date DEFAULT NULL,
  `sinal_valor_bruto` varchar(1) DEFAULT NULL,
  `valor_bruto` decimal(15,2) DEFAULT NULL,
  `sinal_valor_liquido` varchar(1) DEFAULT NULL,
  `valor_liquido` decimal(15,2) DEFAULT NULL,
  `sinal_taxa_adm` varchar(1) DEFAULT NULL,
  `valor_taxa_adm` decimal(15,2) DEFAULT NULL,
  `percentual_taxa_adm` decimal(15,4) DEFAULT NULL,
  `valor_tarifa_adm` decimal(15,2) DEFAULT NULL,
  `codigo_produto` varchar(4) DEFAULT NULL,
  `tipo_captura` varchar(2) DEFAULT NULL,
  `meio_captura` varchar(2) DEFAULT NULL,
  `bandeira` int(10) unsigned DEFAULT NULL,
  `modo_entrada_cartao` varchar(3) DEFAULT NULL,
  `numero_cartao` varchar(19) DEFAULT NULL,
  `numero_logico_terminal` varchar(8) DEFAULT NULL,
  `codigo_autorizacao` varchar(8) DEFAULT NULL,
  `nsu_doc` varchar(6) DEFAULT NULL,
  `banco` varchar(4) DEFAULT NULL,
  `agencia` varchar(5) DEFAULT NULL,
  `conta_corrente` varchar(14) DEFAULT NULL,
  `id_movimento` int(10) unsigned DEFAULT NULL,
  `psr` varchar(3) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_alelo_v2_movimento_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_alelo_v2_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_alelo_v2_pagamento`
--

DROP TABLE IF EXISTS `conn_item_alelo_v2_pagamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_alelo_v2_pagamento` (
  `item_id` int(10) unsigned NOT NULL,
  `tipo_registro` int(10) unsigned DEFAULT NULL,
  `estabelecimento_comercial` decimal(15,0) DEFAULT NULL,
  `raiz_cnpj` varchar(8) DEFAULT NULL,
  `estabelecimento_matriz` decimal(15,0) DEFAULT NULL,
  `id_pagamento` varchar(30) DEFAULT NULL,
  `tipo_pagamento` varchar(1) DEFAULT NULL,
  `status_pagamento` int(10) unsigned DEFAULT NULL,
  `rejeicao_pagamento` varchar(5) DEFAULT NULL,
  `reenvio_pagamento` varchar(1) DEFAULT NULL,
  `data_pagamento_original` date DEFAULT NULL,
  `data_pagamento` date DEFAULT NULL,
  `data_envio_banco` date DEFAULT NULL,
  `sinal_valor_pagamento` varchar(1) DEFAULT NULL,
  `valor_pagamento` decimal(15,2) DEFAULT NULL,
  `numero_operacao_antecipacao` decimal(9,0) DEFAULT NULL,
  `sinal_valor_antecipacao` varchar(1) DEFAULT NULL,
  `valor_liquido_antecipacao` decimal(15,2) DEFAULT NULL,
  `desconto_valor_antecipacao` decimal(15,2) DEFAULT NULL,
  `banco` varchar(4) DEFAULT NULL,
  `agencia` varchar(5) DEFAULT NULL,
  `conta_corrente` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_alelo_v2_pagamento_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_alelo_v2_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_alelo_v2_pagamento_multi`
--

DROP TABLE IF EXISTS `conn_item_alelo_v2_pagamento_multi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_alelo_v2_pagamento_multi` (
  `item_id` int(10) unsigned NOT NULL,
  `tipo_registro` int(10) unsigned DEFAULT NULL,
  `id_pagamento` varchar(30) DEFAULT NULL,
  `identificador_ip` varchar(30) DEFAULT NULL,
  `estabelecimento_comercial` decimal(11,0) DEFAULT NULL,
  `raiz_cnpj` varchar(8) DEFAULT NULL,
  `tipo_pagamento` varchar(2) DEFAULT NULL,
  `status_pagamento` int(10) unsigned DEFAULT NULL,
  `rejeicao_pagamento` varchar(5) DEFAULT NULL,
  `data_pagamento` date DEFAULT NULL,
  `sinal_valor_pagamento` varchar(1) DEFAULT NULL,
  `valor_pagamento` decimal(15,2) DEFAULT NULL,
  `unidade_recebivel` varchar(50) DEFAULT NULL,
  `numero_contrato` varchar(50) DEFAULT NULL,
  `banco` varchar(4) DEFAULT NULL,
  `agencia` varchar(5) DEFAULT NULL,
  `conta_corrente` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_alelo_v2_pagamento_multi_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_alelo_v2_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_alelo_v2_trailer`
--

DROP TABLE IF EXISTS `conn_item_alelo_v2_trailer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_alelo_v2_trailer` (
  `item_id` int(10) unsigned NOT NULL,
  `tipo_registro` int(10) unsigned DEFAULT NULL,
  `total_registros` decimal(11,0) DEFAULT NULL,
  `total_filiais` decimal(6,0) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_alelo_v2_trailer_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_alelo_v2_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_amex_ajuste`
--

DROP TABLE IF EXISTS `conn_item_amex_ajuste`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_amex_ajuste` (
  `item_id` int(10) unsigned NOT NULL,
  `estabelecimento` decimal(10,0) DEFAULT NULL,
  `datapagamento` date DEFAULT NULL,
  `sequenciapagamento` decimal(6,0) DEFAULT NULL,
  `numerosequencial` decimal(5,0) DEFAULT NULL,
  `tiporegistro` decimal(1,0) DEFAULT NULL,
  `reservado1` decimal(1,0) DEFAULT NULL,
  `numeroreferencia` decimal(15,0) DEFAULT NULL,
  `valorbruto` decimal(16,2) DEFAULT NULL,
  `valordesconto` decimal(16,2) DEFAULT NULL,
  `reservado2` decimal(16,2) DEFAULT NULL,
  `valorservico` decimal(16,2) DEFAULT NULL,
  `valorliquido` decimal(16,2) DEFAULT NULL,
  `numerocartao` varchar(19) DEFAULT NULL,
  `codigoajuste` varchar(10) DEFAULT NULL,
  `descricaoajuste` varchar(64) DEFAULT NULL,
  `codigomoeda` decimal(3,0) DEFAULT NULL,
  `numeroantecipacao` decimal(9,0) DEFAULT NULL,
  `valorcredito` decimal(15,2) DEFAULT NULL,
  `valordebito` decimal(15,2) DEFAULT NULL,
  `estabelecimentosubmissor` decimal(10,0) DEFAULT NULL,
  `nsuoriginal` varchar(9) DEFAULT NULL,
  `numerobilheteoriginal` varchar(15) DEFAULT NULL,
  `nsureferencia1` varchar(15) DEFAULT NULL,
  `xidoriginal` varchar(20) DEFAULT NULL,
  `quantidadeparcelas` decimal(5,0) DEFAULT NULL,
  `dataoriginal` date DEFAULT NULL,
  `diasantecipados` decimal(5,0) DEFAULT NULL,
  `encargosantecipacao` decimal(16,2) DEFAULT NULL,
  `valororiginal` decimal(16,2) DEFAULT NULL,
  `datasubmissao` date DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_amex_ajuste_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_amex_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_amex_cv`
--

DROP TABLE IF EXISTS `conn_item_amex_cv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_amex_cv` (
  `item_id` int(10) unsigned NOT NULL,
  `estabelecimento` decimal(10,0) DEFAULT NULL,
  `datapagamento` date DEFAULT NULL,
  `sequenciapagamento` decimal(6,0) DEFAULT NULL,
  `estabelecimentosubmissor` decimal(10,0) DEFAULT NULL,
  `numerosequencial` decimal(5,0) DEFAULT NULL,
  `tiporegistro` decimal(1,0) DEFAULT NULL,
  `reservado1` decimal(1,0) DEFAULT NULL,
  `datavenda` date DEFAULT NULL,
  `nsu` varchar(9) DEFAULT NULL,
  `codigoautorizacao` varchar(6) DEFAULT NULL,
  `numerocartao` varchar(19) DEFAULT NULL,
  `valorvenda` decimal(16,2) DEFAULT NULL,
  `valorparcela1` decimal(16,2) DEFAULT NULL,
  `valorparcelan` decimal(16,2) DEFAULT NULL,
  `quantidadeparcelas` decimal(5,0) DEFAULT NULL,
  `numeroparcela` decimal(5,0) DEFAULT NULL,
  `codigorejeicao` decimal(6,0) DEFAULT NULL,
  `descricaorejeicao` varchar(30) DEFAULT NULL,
  `nsureferencia1` varchar(15) DEFAULT NULL,
  `xidoriginal` varchar(20) DEFAULT NULL,
  `numerobilhete` varchar(15) DEFAULT NULL,
  `manutencaoparcelado` varchar(1) DEFAULT NULL,
  `valorultimaparcela` decimal(16,2) DEFAULT NULL,
  `valororiginal` decimal(16,2) DEFAULT NULL,
  `dataoriginal` date DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_amex_cv_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_amex_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_amex_header`
--

DROP TABLE IF EXISTS `conn_item_amex_header`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_amex_header` (
  `item_id` int(10) unsigned NOT NULL,
  `estabelecimento` decimal(10,0) DEFAULT NULL,
  `reservado1` varchar(8) DEFAULT NULL,
  `reservado2` decimal(6,0) DEFAULT NULL,
  `reservado3` varchar(10) DEFAULT NULL,
  `reservado4` decimal(5,0) DEFAULT NULL,
  `tiporegistro` decimal(1,0) DEFAULT NULL,
  `reservado5` decimal(1,0) DEFAULT NULL,
  `dataarquivo` date DEFAULT NULL,
  `horaarquivo` time DEFAULT NULL,
  `numeroarquivo` decimal(6,0) DEFAULT NULL,
  `nomearquivo` varchar(30) DEFAULT NULL,
  `versaoarquivo` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  KEY `estabelecimento` (`estabelecimento`,`dataarquivo`),
  KEY `data_arquivo` (`dataarquivo`),
  CONSTRAINT `conn_item_amex_header_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_amex_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_amex_line`
--

DROP TABLE IF EXISTS `conn_item_amex_line`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_amex_line` (
  `item_id` int(10) unsigned NOT NULL,
  `registertype` decimal(1,0) DEFAULT NULL,
  `correctiontype` varchar(1) DEFAULT NULL,
  `masterid` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  KEY `masterid` (`masterid`),
  CONSTRAINT `conn_item_amex_line_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `vooo_prod_backend`.`connection_item` (`item_id`),
  CONSTRAINT `conn_item_amex_line_ibfk_2` FOREIGN KEY (`masterid`) REFERENCES `conn_item_amex_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_amex_mexico_adjustment`
--

DROP TABLE IF EXISTS `conn_item_amex_mexico_adjustment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_amex_mexico_adjustment` (
  `item_id` int(10) unsigned NOT NULL,
  `payment_id` int(10) unsigned NOT NULL,
  `membership` varchar(10) DEFAULT NULL,
  `payment_date` date DEFAULT NULL,
  `adjustment_seq` decimal(6,0) DEFAULT NULL,
  `establishment_id` varchar(10) DEFAULT NULL,
  `adjustment_reference_number` varchar(15) DEFAULT NULL,
  `gross_amount` decimal(16,2) DEFAULT NULL,
  `adjustment_discount_amount` decimal(16,2) DEFAULT NULL,
  `tax_amount` decimal(16,2) DEFAULT NULL,
  `plan_rate_amount` decimal(16,2) DEFAULT NULL,
  `discount_net_amount` decimal(16,2) DEFAULT NULL,
  `card_number` varchar(19) DEFAULT NULL,
  `adjustment_code` varchar(10) DEFAULT NULL,
  `adjustment_description` varchar(64) DEFAULT NULL,
  `currency_code` varchar(3) DEFAULT NULL,
  `acceleration_adjustment_number` decimal(7,0) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  KEY `payment_id` (`payment_id`),
  CONSTRAINT `conn_item_amex_mexico_adjustment_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `vooo_prod_backend`.`connection_item` (`item_id`),
  CONSTRAINT `conn_item_amex_mexico_adjustment_ibfk_2` FOREIGN KEY (`payment_id`) REFERENCES `conn_item_amex_mexico_payment` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_amex_mexico_header`
--

DROP TABLE IF EXISTS `conn_item_amex_mexico_header`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_amex_mexico_header` (
  `item_id` int(10) unsigned NOT NULL,
  `membership` varchar(10) DEFAULT NULL,
  `file_date` date DEFAULT NULL,
  `file_time` time DEFAULT NULL,
  `file_id` decimal(6,0) DEFAULT NULL,
  `file_name` varchar(28) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_amex_mexico_header_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `vooo_prod_backend`.`connection_item` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_amex_mexico_payment`
--

DROP TABLE IF EXISTS `conn_item_amex_mexico_payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_amex_mexico_payment` (
  `item_id` int(10) unsigned NOT NULL,
  `header_id` int(10) unsigned NOT NULL,
  `membership` varchar(10) DEFAULT NULL,
  `payment_date` date DEFAULT NULL,
  `payment_seq` decimal(6,0) DEFAULT NULL,
  `payment_amount` decimal(16,2) DEFAULT NULL,
  `bank_code` varchar(9) DEFAULT NULL,
  `bank_branch` varchar(6) DEFAULT NULL,
  `bank_account` varchar(20) DEFAULT NULL,
  `establishment_name` varchar(38) DEFAULT NULL,
  `currency_code` decimal(3,0) DEFAULT NULL,
  `debits_amount` decimal(16,2) DEFAULT NULL,
  `gross_amount` decimal(16,2) DEFAULT NULL,
  `discount_amount` decimal(16,2) DEFAULT NULL,
  `tax_amount` decimal(16,2) DEFAULT NULL,
  `acceleration_amount` decimal(16,2) DEFAULT NULL,
  `net_amount` decimal(16,2) DEFAULT NULL,
  `payment_status` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  KEY `header_id` (`header_id`),
  CONSTRAINT `conn_item_amex_mexico_payment_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `vooo_prod_backend`.`connection_item` (`item_id`),
  CONSTRAINT `conn_item_amex_mexico_payment_ibfk_2` FOREIGN KEY (`header_id`) REFERENCES `conn_item_amex_mexico_header` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_amex_mexico_pricing`
--

DROP TABLE IF EXISTS `conn_item_amex_mexico_pricing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_amex_mexico_pricing` (
  `item_id` int(10) unsigned NOT NULL,
  `payment_id` int(10) unsigned NOT NULL,
  `membership` varchar(10) DEFAULT NULL,
  `banking_establishment_number` varchar(10) DEFAULT NULL,
  `pricing_seq` decimal(6,0) DEFAULT NULL,
  `description` varchar(64) DEFAULT NULL,
  `transactions_number` decimal(5,0) DEFAULT NULL,
  `debit_gross_amount` decimal(16,2) DEFAULT NULL,
  `credit_gross_amount` decimal(16,2) DEFAULT NULL,
  `discount_amount` decimal(16,2) DEFAULT NULL,
  `pricing_total_amount` decimal(16,2) DEFAULT NULL,
  `special_adjustment_taxes` decimal(16,2) DEFAULT NULL,
  `pricing_net_amount` decimal(16,2) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  KEY `payment_id` (`payment_id`),
  CONSTRAINT `conn_item_amex_mexico_pricing_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `vooo_prod_backend`.`connection_item` (`item_id`),
  CONSTRAINT `conn_item_amex_mexico_pricing_ibfk_2` FOREIGN KEY (`payment_id`) REFERENCES `conn_item_amex_mexico_payment` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_amex_mexico_soc`
--

DROP TABLE IF EXISTS `conn_item_amex_mexico_soc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_amex_mexico_soc` (
  `item_id` int(10) unsigned NOT NULL,
  `payment_id` int(10) unsigned NOT NULL,
  `membership` varchar(10) DEFAULT NULL,
  `payment_date` date DEFAULT NULL,
  `deposit_id` decimal(6,0) DEFAULT NULL,
  `establishment_id` varchar(10) DEFAULT NULL,
  `soc_seq` varchar(5) DEFAULT NULL,
  `process_initial_date` date DEFAULT NULL,
  `deposit_reference_number` decimal(16,0) DEFAULT NULL,
  `gross_amount_deposited` decimal(16,2) DEFAULT NULL,
  `gross_amount_calculated` decimal(16,2) DEFAULT NULL,
  `discount_rate` decimal(16,2) DEFAULT NULL,
  `tax_amount` decimal(16,2) DEFAULT NULL,
  `acceleration_amount` decimal(16,2) DEFAULT NULL,
  `net_amount_deposited` decimal(16,2) DEFAULT NULL,
  `roc_transactions` decimal(5,0) DEFAULT NULL,
  `currency_code` varchar(3) DEFAULT NULL,
  `dollar_exchange_rate` decimal(16,2) DEFAULT NULL,
  `montlhy_payments` decimal(5,0) DEFAULT NULL,
  `acceleration_number` decimal(8,0) DEFAULT NULL,
  `original_deposit_date` date DEFAULT NULL,
  `deposit_acceleration_date` date DEFAULT NULL,
  `days_accelerated` decimal(5,0) DEFAULT NULL,
  `acceleration_rate` decimal(16,2) DEFAULT NULL,
  `acceleration_net_amount` decimal(16,2) DEFAULT NULL,
  `gross_amount_charges` decimal(16,2) DEFAULT NULL,
  `gross_amount_credits` decimal(16,2) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  KEY `payment_id` (`payment_id`),
  CONSTRAINT `conn_item_amex_mexico_soc_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `vooo_prod_backend`.`connection_item` (`item_id`),
  CONSTRAINT `conn_item_amex_mexico_soc_ibfk_2` FOREIGN KEY (`payment_id`) REFERENCES `conn_item_amex_mexico_payment` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_amex_mexico_trailer`
--

DROP TABLE IF EXISTS `conn_item_amex_mexico_trailer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_amex_mexico_trailer` (
  `item_id` int(10) unsigned NOT NULL,
  `header_id` int(10) unsigned NOT NULL,
  `membership` varchar(10) DEFAULT NULL,
  `file_date` date DEFAULT NULL,
  `file_time` time DEFAULT NULL,
  `file_id` decimal(6,0) DEFAULT NULL,
  `file_name` varchar(28) DEFAULT NULL,
  `total_records` decimal(7,0) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  KEY `header_id` (`header_id`),
  CONSTRAINT `conn_item_amex_mexico_trailer_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `vooo_prod_backend`.`connection_item` (`item_id`),
  CONSTRAINT `conn_item_amex_mexico_trailer_ibfk_2` FOREIGN KEY (`header_id`) REFERENCES `conn_item_amex_mexico_header` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_amex_mexico_transaction`
--

DROP TABLE IF EXISTS `conn_item_amex_mexico_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_amex_mexico_transaction` (
  `item_id` int(10) unsigned NOT NULL,
  `soc_id` int(10) unsigned NOT NULL,
  `membership` varchar(10) DEFAULT NULL,
  `payment_date` date DEFAULT NULL,
  `transaction_seq` decimal(6,0) DEFAULT NULL,
  `establishment_id` varchar(10) DEFAULT NULL,
  `soc_seq` varchar(5) DEFAULT NULL,
  `record_date` date DEFAULT NULL,
  `transaction_number` decimal(9,0) DEFAULT NULL,
  `transaction_approval` decimal(3,0) DEFAULT NULL,
  `card_number` varchar(19) DEFAULT NULL,
  `total_amount` decimal(16,2) DEFAULT NULL,
  `first_installment_amount` decimal(16,2) DEFAULT NULL,
  `subsequent_installment_amount` decimal(16,2) DEFAULT NULL,
  `total_installments` decimal(5,0) DEFAULT NULL,
  `installment` decimal(5,0) DEFAULT NULL,
  `declined_charge_code` decimal(2,0) DEFAULT NULL,
  `declined_charge_description` decimal(2,0) DEFAULT NULL,
  `transaction_id` decimal(15,0) DEFAULT NULL,
  `transaction_reference_number` varchar(20) DEFAULT NULL,
  `client_reference_number` varchar(15) DEFAULT NULL,
  `plan_rate_amount` decimal(16,2) DEFAULT NULL,
  `discount_rate_amount` decimal(16,2) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  KEY `soc_id` (`soc_id`),
  CONSTRAINT `conn_item_amex_mexico_transaction_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `vooo_prod_backend`.`connection_item` (`item_id`),
  CONSTRAINT `conn_item_amex_mexico_transaction_ibfk_2` FOREIGN KEY (`soc_id`) REFERENCES `conn_item_amex_mexico_soc` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_amex_pagamento`
--

DROP TABLE IF EXISTS `conn_item_amex_pagamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_amex_pagamento` (
  `item_id` int(10) unsigned NOT NULL,
  `estabelecimento` decimal(10,0) DEFAULT NULL,
  `datapagamento` date DEFAULT NULL,
  `sequenciapagamento` decimal(6,0) DEFAULT NULL,
  `reservado1` varchar(10) DEFAULT NULL,
  `reservado2` decimal(5,0) DEFAULT NULL,
  `tiporegistro` decimal(1,0) DEFAULT NULL,
  `reservado3` decimal(1,0) DEFAULT NULL,
  `valorpagamento` decimal(16,2) DEFAULT NULL,
  `banco` decimal(3,0) DEFAULT NULL,
  `agencia` decimal(6,0) DEFAULT NULL,
  `contacorrente` decimal(20,0) DEFAULT NULL,
  `nomeestabelecimento` varchar(38) DEFAULT NULL,
  `codigomoeda` decimal(3,0) DEFAULT NULL,
  `debitoanterior` decimal(16,2) DEFAULT NULL,
  `valorbruto` decimal(16,2) DEFAULT NULL,
  `valordesconto` decimal(16,2) DEFAULT NULL,
  `reservado4` decimal(16,2) DEFAULT NULL,
  `encargosantecipacao` decimal(16,2) DEFAULT NULL,
  `valorliquido` decimal(16,2) DEFAULT NULL,
  `tipopagamento` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_amex_pagamento_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_amex_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_amex_ro`
--

DROP TABLE IF EXISTS `conn_item_amex_ro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_amex_ro` (
  `item_id` int(10) unsigned NOT NULL,
  `estabelecimento` decimal(10,0) DEFAULT NULL,
  `datapagamento` date DEFAULT NULL,
  `sequenciapagamento` decimal(6,0) DEFAULT NULL,
  `estabelecimentosubmissor` decimal(10,0) DEFAULT NULL,
  `numerosequencial` decimal(5,0) DEFAULT NULL,
  `tiporegistro` decimal(1,0) DEFAULT NULL,
  `reservado1` decimal(1,0) DEFAULT NULL,
  `datasubmissao` date DEFAULT NULL,
  `numeroreferencia` decimal(16,0) DEFAULT NULL,
  `valortotal` decimal(16,2) DEFAULT NULL,
  `valorbruto` decimal(16,2) DEFAULT NULL,
  `valordesconto` decimal(16,2) DEFAULT NULL,
  `reservado2` decimal(16,2) DEFAULT NULL,
  `reservado3` decimal(16,2) DEFAULT NULL,
  `valorliquido` decimal(16,2) DEFAULT NULL,
  `quantidadecv` decimal(5,0) DEFAULT NULL,
  `codigomoeda` decimal(3,0) DEFAULT NULL,
  `reservado4` decimal(16,2) DEFAULT NULL,
  `numeroparcela` decimal(5,0) DEFAULT NULL,
  `numeroantecipacao` decimal(9,0) DEFAULT NULL,
  `dataoriginal` date DEFAULT NULL,
  `dataantecipacao` date DEFAULT NULL,
  `diasantecipados` decimal(5,0) DEFAULT NULL,
  `encargosantecipacao` decimal(16,2) DEFAULT NULL,
  `valororiginal` decimal(16,2) DEFAULT NULL,
  `valordebito` decimal(16,2) DEFAULT NULL,
  `valorcredito` decimal(16,2) DEFAULT NULL,
  `manutencaoparcelado` varchar(1) DEFAULT NULL,
  `totalparcelas` decimal(5,0) DEFAULT NULL,
  `meiosubmissao` decimal(2,0) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_amex_ro_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_amex_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_amex_trailer`
--

DROP TABLE IF EXISTS `conn_item_amex_trailer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_amex_trailer` (
  `item_id` int(10) unsigned NOT NULL,
  `estabelecimento` decimal(10,0) DEFAULT NULL,
  `reservado1` varchar(8) DEFAULT NULL,
  `reservado2` decimal(6,0) DEFAULT NULL,
  `reservado3` varchar(10) DEFAULT NULL,
  `reservado4` decimal(5,0) DEFAULT NULL,
  `tiporegistro` decimal(1,0) DEFAULT NULL,
  `reservado5` decimal(1,0) DEFAULT NULL,
  `dataarquivo` date DEFAULT NULL,
  `horaarquivo` time DEFAULT NULL,
  `numeroarquivo` decimal(6,0) DEFAULT NULL,
  `nomearquivo` varchar(30) DEFAULT NULL,
  `versaoarquivo` varchar(5) DEFAULT NULL,
  `quantidaderegistros` decimal(7,0) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_amex_trailer_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_amex_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_banco_inter_ajuste`
--

DROP TABLE IF EXISTS `conn_item_banco_inter_ajuste`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_banco_inter_ajuste` (
  `item_id` int(10) unsigned NOT NULL,
  `tiporegistro` varchar(2) DEFAULT NULL,
  `codigo_ec` decimal(15,0) DEFAULT NULL,
  `nsu_transacao_original` varchar(12) DEFAULT NULL,
  `data_transacao_original` date DEFAULT NULL,
  `num_da_parcela` decimal(2,0) DEFAULT NULL,
  `nsu_transacao` decimal(12,0) DEFAULT NULL,
  `data_transacao_ajuste` date DEFAULT NULL,
  `hora_transacao_ajuste` time DEFAULT NULL,
  `tipo_lancamento` decimal(1,0) DEFAULT NULL,
  `data_lancamento` date DEFAULT NULL,
  `forma_captura` decimal(1,0) DEFAULT NULL,
  `tipo_ajuste` decimal(1,0) DEFAULT NULL,
  `codigo_ajuste` decimal(3,0) DEFAULT NULL,
  `descricao_ajuste` varchar(30) DEFAULT NULL,
  `valor_bruto` decimal(11,2) DEFAULT NULL,
  `valor_desconto` decimal(11,2) DEFAULT NULL,
  `valor_liquido` decimal(11,2) DEFAULT NULL,
  `banco` decimal(3,0) DEFAULT NULL,
  `agencia` decimal(6,0) DEFAULT NULL,
  `conta_corrente` varchar(11) DEFAULT NULL,
  `num_cartao` varchar(19) DEFAULT NULL,
  `codigo_bandeira` varchar(3) DEFAULT NULL,
  `codigo_produto` varchar(3) DEFAULT NULL,
  `valor_bruto_parcela` decimal(11,2) DEFAULT NULL,
  `valor_liquido_parcela` decimal(11,2) DEFAULT NULL,
  `codigo_pedido` varchar(30) DEFAULT NULL,
  `codigo_autorizacao` varchar(12) DEFAULT NULL,
  `num_parcelas` decimal(2,0) DEFAULT NULL,
  `sequencia_registro` decimal(6,0) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_banco_inter_ajuste_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_banco_inter_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_banco_inter_cancel`
--

DROP TABLE IF EXISTS `conn_item_banco_inter_cancel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_banco_inter_cancel` (
  `item_id` int(10) unsigned NOT NULL,
  `tiporegistro` varchar(2) DEFAULT NULL,
  `codigo_ec` decimal(15,0) DEFAULT NULL,
  `nsu_transacao_original` decimal(12,0) DEFAULT NULL,
  `data_transacao_original` date DEFAULT NULL,
  `num_da_parcela` decimal(2,0) DEFAULT NULL,
  `nsu_transacao` decimal(12,0) DEFAULT NULL,
  `data_transacao_cancelamento` date DEFAULT NULL,
  `hora_transacao_cancelamento` time DEFAULT NULL,
  `forma_captura` decimal(1,0) DEFAULT NULL,
  `codigo_pedido` varchar(30) DEFAULT NULL,
  `codigo_autorizacao` varchar(12) DEFAULT NULL,
  `valor_bruto` decimal(11,0) DEFAULT NULL,
  `valor_liquido` decimal(11,0) DEFAULT NULL,
  `valor_bruto_parcela` decimal(11,0) DEFAULT NULL,
  `valor_liquido_parcela` decimal(11,0) DEFAULT NULL,
  `codigo_ajuste` decimal(3,0) DEFAULT NULL,
  `descricao_ajuste` varchar(30) DEFAULT NULL,
  `num_parcelas` decimal(2,0) DEFAULT NULL,
  `sequencia_registro` decimal(6,0) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_banco_inter_cancel_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_banco_inter_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_banco_inter_cv`
--

DROP TABLE IF EXISTS `conn_item_banco_inter_cv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_banco_inter_cv` (
  `item_id` int(10) unsigned NOT NULL,
  `tipo_registro` varchar(2) DEFAULT NULL,
  `codigo_ec` decimal(15,0) DEFAULT NULL,
  `nsu_adquirente` varchar(36) DEFAULT NULL,
  `data_transacao` date DEFAULT NULL,
  `hora_transacao` time DEFAULT NULL,
  `tipo_lancamento` decimal(1,0) DEFAULT NULL,
  `data_pagamento` date DEFAULT NULL,
  `tipo_produto` varchar(1) DEFAULT NULL,
  `forma_captura` decimal(1,0) DEFAULT NULL,
  `valor_bruto` decimal(11,2) DEFAULT NULL,
  `valor_desconto` decimal(11,2) DEFAULT NULL,
  `valor_liquido` decimal(11,2) DEFAULT NULL,
  `num_cartao` varchar(19) DEFAULT NULL,
  `num_da_parcela` decimal(2,0) DEFAULT NULL,
  `num_parcelas` decimal(2,0) DEFAULT NULL,
  `nsu_parcela` varchar(36) DEFAULT NULL,
  `valor_bruto_parcela` decimal(11,2) DEFAULT NULL,
  `valor_desconto_parcela` decimal(11,2) DEFAULT NULL,
  `valor_liquido_parcela` decimal(11,2) DEFAULT NULL,
  `banco` decimal(3,0) DEFAULT NULL,
  `agencia` decimal(6,0) DEFAULT NULL,
  `conta_corrente` varchar(11) DEFAULT NULL,
  `codigo_autorizacao` varchar(36) DEFAULT NULL,
  `codigo_bandeira` varchar(3) DEFAULT NULL,
  `codigo_produto` varchar(3) DEFAULT NULL,
  `valor_taxa_1` decimal(11,2) DEFAULT NULL,
  `valor_taxa_2` decimal(11,2) DEFAULT NULL,
  `valor_taxa_1_parcela` decimal(11,2) DEFAULT NULL,
  `valor_taxa_2_parcela` decimal(11,2) DEFAULT NULL,
  `valor_taxa_antecipacao` decimal(11,2) DEFAULT NULL,
  `valor_liquido_antecipado` decimal(11,2) DEFAULT NULL,
  `codigo_pedido` varchar(30) DEFAULT NULL,
  `numero_terminal` varchar(8) DEFAULT NULL,
  `id_shellbox` varchar(43) DEFAULT NULL,
  `sequencia_registro` decimal(6,0) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_banco_inter_cv_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_banco_inter_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_banco_inter_header`
--

DROP TABLE IF EXISTS `conn_item_banco_inter_header`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_banco_inter_header` (
  `item_id` int(10) unsigned NOT NULL,
  `tipo_registro` varchar(2) DEFAULT NULL,
  `versao_layout` varchar(6) DEFAULT NULL,
  `data_criacao` date DEFAULT NULL,
  `hora_criacao` time DEFAULT NULL,
  `sequencia` decimal(6,0) DEFAULT NULL,
  `nome_adquirente` varchar(30) DEFAULT NULL,
  `codigo_ec` decimal(13,0) DEFAULT NULL,
  `tipo_processamento` varchar(1) DEFAULT NULL,
  `sequencia_registro` decimal(6,0) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_banco_inter_header_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_banco_inter_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_banco_inter_header_mov`
--

DROP TABLE IF EXISTS `conn_item_banco_inter_header_mov`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_banco_inter_header_mov` (
  `item_id` int(10) unsigned NOT NULL,
  `tipo_registro` varchar(2) DEFAULT NULL,
  `data_movimento` date DEFAULT NULL,
  `moeda` varchar(2) DEFAULT NULL,
  `sequencia_registro` decimal(6,0) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_banco_inter_header_mov_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_banco_inter_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_banco_inter_line`
--

DROP TABLE IF EXISTS `conn_item_banco_inter_line`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_banco_inter_line` (
  `item_id` int(10) unsigned NOT NULL,
  `register_type` varchar(2) NOT NULL,
  `masterid` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  KEY `masterid` (`masterid`),
  CONSTRAINT `conn_item_banco_inter_line_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `vooo_prod_backend`.`connection_item` (`item_id`),
  CONSTRAINT `conn_item_banco_inter_line_ibfk_2` FOREIGN KEY (`masterid`) REFERENCES `conn_item_banco_inter_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_banco_inter_trailer`
--

DROP TABLE IF EXISTS `conn_item_banco_inter_trailer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_banco_inter_trailer` (
  `item_id` int(10) unsigned NOT NULL,
  `tipo_registro` varchar(2) DEFAULT NULL,
  `qtd_registros` decimal(6,0) DEFAULT NULL,
  `sequencia_registro` decimal(6,0) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_banco_inter_trailer_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_banco_inter_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_banco_inter_trailermov`
--

DROP TABLE IF EXISTS `conn_item_banco_inter_trailermov`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_banco_inter_trailermov` (
  `item_id` int(10) unsigned NOT NULL,
  `tipo_registro` varchar(2) DEFAULT NULL,
  `total_registros` decimal(6,0) DEFAULT NULL,
  `total_creditos` decimal(12,2) DEFAULT NULL,
  `sequencia_registro` decimal(6,0) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_banco_inter_trailermov_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_banco_inter_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_bank_statement_control`
--

DROP TABLE IF EXISTS `conn_item_bank_statement_control`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_bank_statement_control` (
  `item_id` int(10) unsigned NOT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `check_status` decimal(1,0) DEFAULT NULL,
  `registers` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  KEY `ix_vooo_prod_rawdata_conn_item_bank_statement_control_end_date` (`end_date`),
  KEY `ix_vooo_prod_rawdata_conn_item_bank_statement_control_start_date` (`start_date`),
  CONSTRAINT `conn_item_bank_statement_control_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_bank_statement_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_bank_statement_line`
--

DROP TABLE IF EXISTS `conn_item_bank_statement_line`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_bank_statement_line` (
  `item_id` int(10) unsigned NOT NULL,
  `register_type` varchar(15) DEFAULT NULL,
  `masterid` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  KEY `masterid` (`masterid`),
  CONSTRAINT `conn_item_bank_statement_line_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `vooo_prod_backend`.`connection_item` (`item_id`),
  CONSTRAINT `conn_item_bank_statement_line_ibfk_2` FOREIGN KEY (`masterid`) REFERENCES `conn_item_bank_statement_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_bank_statement_transaction`
--

DROP TABLE IF EXISTS `conn_item_bank_statement_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_bank_statement_transaction` (
  `item_id` int(10) unsigned NOT NULL,
  `data` date DEFAULT NULL,
  `historico` varchar(50) DEFAULT NULL,
  `descricao` varchar(50) DEFAULT NULL,
  `documento` varchar(50) DEFAULT NULL,
  `credito` decimal(10,2) DEFAULT NULL,
  `debito` decimal(10,2) DEFAULT NULL,
  `saldo` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_bank_statement_transaction_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_bank_statement_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_banorte_chargeback_control`
--

DROP TABLE IF EXISTS `conn_item_banorte_chargeback_control`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_banorte_chargeback_control` (
  `item_id` int(10) unsigned NOT NULL,
  `initial_reference_date` date DEFAULT NULL,
  `final_reference_date` date DEFAULT NULL,
  `transactions` decimal(10,0) DEFAULT NULL,
  `file_date` date DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_banorte_chargeback_control_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_banorte_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_banorte_chargeback_transaction`
--

DROP TABLE IF EXISTS `conn_item_banorte_chargeback_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_banorte_chargeback_transaction` (
  `item_id` int(10) unsigned NOT NULL,
  `state_of_dispute` varchar(2) DEFAULT NULL,
  `merchant_id_affiliation` decimal(10,0) DEFAULT NULL,
  `case_number` decimal(10,0) DEFAULT NULL,
  `merchant_reference_terminal_id` decimal(10,0) DEFAULT NULL,
  `payment_trace` varchar(10) DEFAULT NULL,
  `transaction_date` date DEFAULT NULL,
  `customer_chargeback_date` date DEFAULT NULL,
  `issuer_chargeback_date` date DEFAULT NULL,
  `currency` varchar(3) DEFAULT NULL,
  `disputed_amount` decimal(10,2) DEFAULT NULL,
  `won_amount` decimal(10,2) DEFAULT NULL,
  `issuer_reason_code` varchar(10) DEFAULT NULL,
  `representation_deadline_date` date DEFAULT NULL,
  `transaction_unit_class` varchar(10) DEFAULT NULL,
  `transaction_amount` decimal(10,2) DEFAULT NULL,
  `amount_debited` decimal(1,0) DEFAULT NULL,
  `comments` varchar(100) DEFAULT NULL,
  `open_code_reason` varchar(10) DEFAULT NULL,
  `bin` decimal(6,0) DEFAULT NULL,
  `payworks_reference` decimal(10,0) DEFAULT NULL,
  `authorization_code` varchar(30) DEFAULT NULL,
  `interbank_referece` decimal(30,0) DEFAULT NULL,
  `customer_ref1` varchar(20) DEFAULT NULL,
  `customer_ref2` varchar(20) DEFAULT NULL,
  `customer_ref3` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_banorte_chargeback_transaction_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_banorte_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_banorte_line`
--

DROP TABLE IF EXISTS `conn_item_banorte_line`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_banorte_line` (
  `item_id` int(10) unsigned NOT NULL,
  `register_type` varchar(2) DEFAULT NULL,
  `masterid` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  KEY `masterid` (`masterid`),
  CONSTRAINT `conn_item_banorte_line_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `vooo_prod_backend`.`connection_item` (`item_id`),
  CONSTRAINT `conn_item_banorte_line_ibfk_2` FOREIGN KEY (`masterid`) REFERENCES `conn_item_banorte_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_banorte_settlement_header`
--

DROP TABLE IF EXISTS `conn_item_banorte_settlement_header`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_banorte_settlement_header` (
  `item_id` int(10) unsigned NOT NULL,
  `type` varchar(1) DEFAULT NULL,
  `currency` varchar(3) DEFAULT NULL,
  `total_settlement_amount` decimal(10,2) DEFAULT NULL,
  `commissions_paid` decimal(10,2) DEFAULT NULL,
  `commissions_charged` decimal(10,2) DEFAULT NULL,
  `transactions` decimal(10,0) DEFAULT NULL,
  `reference` decimal(10,0) DEFAULT NULL,
  `deposit_date` date DEFAULT NULL,
  `account_number` decimal(10,0) DEFAULT NULL,
  `bank_name` varchar(10) DEFAULT NULL,
  `effective_date` date DEFAULT NULL,
  `settlement_file_number` decimal(10,0) DEFAULT NULL,
  `tax_paid` decimal(10,2) DEFAULT NULL,
  `tax_charged` decimal(10,2) DEFAULT NULL,
  `file_date` date DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_banorte_settlement_header_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_banorte_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_banorte_settlement_transaction`
--

DROP TABLE IF EXISTS `conn_item_banorte_settlement_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_banorte_settlement_transaction` (
  `item_id` int(10) unsigned NOT NULL,
  `type` varchar(1) DEFAULT NULL,
  `merchant_id_affiliation` decimal(10,0) DEFAULT NULL,
  `merchant_reference_terminal_id` decimal(10,0) DEFAULT NULL,
  `card` decimal(10,0) DEFAULT NULL,
  `settled_amount` decimal(10,2) DEFAULT NULL,
  `commissions` decimal(10,2) DEFAULT NULL,
  `transaction_date` date DEFAULT NULL,
  `gross_amount` decimal(10,2) DEFAULT NULL,
  `currency` varchar(3) DEFAULT NULL,
  `transaction_type` varchar(20) DEFAULT NULL,
  `iva_tax` decimal(10,2) DEFAULT NULL,
  `installments_tax` decimal(10,2) DEFAULT NULL,
  `iva_cashback_paid` decimal(10,2) DEFAULT NULL,
  `iva_cashback_charged` decimal(10,2) DEFAULT NULL,
  `cashback_fees_paid` decimal(10,2) DEFAULT NULL,
  `cashback_fees_charged` decimal(10,2) DEFAULT NULL,
  `installment_fees` decimal(10,2) DEFAULT NULL,
  `cashback_amount` decimal(10,2) DEFAULT NULL,
  `number_of_payments` decimal(10,0) DEFAULT NULL,
  `initial_deferment` decimal(3,0) DEFAULT NULL,
  `plan_type` decimal(3,0) DEFAULT NULL,
  `auth_code` varchar(30) DEFAULT NULL,
  `eci` varchar(30) DEFAULT NULL,
  `interbank_reference` decimal(30,0) DEFAULT NULL,
  `payworks_reference` decimal(30,0) DEFAULT NULL,
  `customer_ref1` varchar(20) DEFAULT NULL,
  `customer_ref2` varchar(20) DEFAULT NULL,
  `customer_ref3` varchar(20) DEFAULT NULL,
  `control_number` varchar(20) DEFAULT NULL,
  `card_type` varchar(1) DEFAULT NULL,
  `transaction_source` varchar(1) DEFAULT NULL,
  `prosa_reference` varchar(20) DEFAULT NULL,
  `acquirer_commission` decimal(10,2) DEFAULT NULL,
  `Acquirer_iva_tax` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_banorte_settlement_transaction_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_banorte_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_banrisul_cancelamentos`
--

DROP TABLE IF EXISTS `conn_item_banrisul_cancelamentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_banrisul_cancelamentos` (
  `item_id` int(10) unsigned NOT NULL,
  `tipo_registro` varchar(2) DEFAULT NULL,
  `data_cancelamento` date DEFAULT NULL,
  `hora_cancelamento` time DEFAULT NULL,
  `nome_solicitante` varchar(30) DEFAULT NULL,
  `tipo_solicitante` varchar(1) DEFAULT NULL,
  `operador` varchar(8) DEFAULT NULL,
  `cnpj_estabelecimento` decimal(14,0) DEFAULT NULL,
  `rede` decimal(11,0) DEFAULT NULL,
  `estabelecimento` decimal(15,0) DEFAULT NULL,
  `terminal` varchar(8) DEFAULT NULL,
  `data_movimento` date DEFAULT NULL,
  `nsu_movimento` varchar(10) DEFAULT NULL,
  `parcela` decimal(2,0) DEFAULT NULL,
  `qt_parcela` decimal(2,0) DEFAULT NULL,
  `hora_movimento` time DEFAULT NULL,
  `data_origem` date DEFAULT NULL,
  `hora_origem` time DEFAULT NULL,
  `nsu_origem` decimal(6,0) DEFAULT NULL,
  `cod_mensagem` decimal(4,0) DEFAULT NULL,
  `cod_processamento` decimal(6,0) DEFAULT NULL,
  `servico` varchar(4) DEFAULT NULL,
  `situacao` varchar(2) DEFAULT NULL,
  `valor` decimal(15,2) DEFAULT NULL,
  `valor_cancelamento` decimal(15,2) DEFAULT NULL,
  `data_previsao_credito` date DEFAULT NULL,
  `tarifa_admin_fixa` decimal(6,2) DEFAULT NULL,
  `taxa_admin` decimal(6,2) DEFAULT NULL,
  `tarifa_admin_cobrada` decimal(10,2) DEFAULT NULL,
  `situacao_parcela` varchar(1) DEFAULT NULL,
  `id_pedido_b2b` varchar(40) DEFAULT NULL,
  `cnpj_cpf_b2b` varchar(14) DEFAULT NULL,
  `bandeira` decimal(3,0) DEFAULT NULL,
  `modalidade_cancelamento` decimal(3,0) DEFAULT NULL,
  `reserva` varchar(40) DEFAULT NULL,
  `nseq_registro` decimal(9,0) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_banrisul_cancelamentos_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_banrisul_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_banrisul_header`
--

DROP TABLE IF EXISTS `conn_item_banrisul_header`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_banrisul_header` (
  `item_id` int(10) unsigned NOT NULL,
  `tipo_registro` varchar(2) DEFAULT NULL,
  `nome_arquivo` varchar(40) DEFAULT NULL,
  `identificador_arquivo` varchar(8) DEFAULT NULL,
  `data_referencia_banrisul_cartoes` date DEFAULT NULL,
  `data_referencia_vero` date DEFAULT NULL,
  `data_geracao` date DEFAULT NULL,
  `hora_geracao` time DEFAULT NULL,
  `origem` varchar(10) DEFAULT NULL,
  `cnpj_conveniado` decimal(14,0) DEFAULT NULL,
  `versao` varchar(5) DEFAULT NULL,
  `nseq_registro` decimal(9,0) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_banrisul_header_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_banrisul_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_banrisul_lancamento`
--

DROP TABLE IF EXISTS `conn_item_banrisul_lancamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_banrisul_lancamento` (
  `item_id` int(10) unsigned NOT NULL,
  `tipo_registro` varchar(2) NOT NULL,
  `rede` decimal(11,0) DEFAULT NULL,
  `estabelecimento` decimal(15,0) DEFAULT NULL,
  `data_lancamento` date DEFAULT NULL,
  `cartao_internacional` varchar(1) DEFAULT NULL,
  `cod_lancamento` decimal(4,0) DEFAULT NULL,
  `seq_lancamento` decimal(2,0) DEFAULT NULL,
  `cnpj` decimal(14,0) DEFAULT NULL,
  `valor_lancamento` decimal(15,2) DEFAULT NULL,
  `nseq_registro` decimal(9,0) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_banrisul_lancamento_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_banrisul_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_banrisul_line`
--

DROP TABLE IF EXISTS `conn_item_banrisul_line`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_banrisul_line` (
  `item_id` int(10) unsigned NOT NULL,
  `registertype` varchar(2) NOT NULL,
  `masterid` int(10) unsigned DEFAULT NULL,
  `filetype` varchar(2) NOT NULL,
  PRIMARY KEY (`item_id`),
  KEY `masterid` (`masterid`),
  CONSTRAINT `conn_item_banrisul_line_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `vooo_prod_backend`.`connection_item` (`item_id`),
  CONSTRAINT `conn_item_banrisul_line_ibfk_2` FOREIGN KEY (`masterid`) REFERENCES `conn_item_banrisul_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_banrisul_movimento`
--

DROP TABLE IF EXISTS `conn_item_banrisul_movimento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_banrisul_movimento` (
  `item_id` int(10) unsigned NOT NULL,
  `tipo_registro` varchar(2) DEFAULT NULL,
  `cnpj_estabelecimento` decimal(14,0) DEFAULT NULL,
  `rede` decimal(11,0) DEFAULT NULL,
  `estabelecimento` decimal(15,0) DEFAULT NULL,
  `terminal` varchar(8) DEFAULT NULL,
  `data_movimento` date DEFAULT NULL,
  `hora_movimento` time DEFAULT NULL,
  `nsu_movimento` varchar(8) DEFAULT NULL,
  `parcela` decimal(2,0) DEFAULT NULL,
  `qt_parcela` decimal(2,0) DEFAULT NULL,
  `data_origem` date DEFAULT NULL,
  `hora_origem` time DEFAULT NULL,
  `nsu_origem` decimal(6,0) DEFAULT NULL,
  `cod_mensagem` decimal(4,0) DEFAULT NULL,
  `cod_processamento` decimal(6,0) DEFAULT NULL,
  `servico` varchar(4) DEFAULT NULL,
  `situacao` varchar(2) DEFAULT NULL,
  `valor` decimal(15,2) DEFAULT NULL,
  `valor_parcela` decimal(15,2) DEFAULT NULL,
  `data_previsao_credito` date DEFAULT NULL,
  `tarifa_admin_fixa` decimal(6,2) DEFAULT NULL,
  `taxa_admin` decimal(6,2) DEFAULT NULL,
  `tarifa_admin_cobrada` decimal(10,2) DEFAULT NULL,
  `tarifa_comunicacao` decimal(6,2) DEFAULT NULL,
  `valor_liquido` decimal(15,2) DEFAULT NULL,
  `prazo` decimal(3,0) DEFAULT NULL,
  `prazo_ultima_parcela` decimal(3,0) DEFAULT NULL,
  `data_confirmacao` date DEFAULT NULL,
  `hora_confirmacao` time DEFAULT NULL,
  `numero_logico` decimal(15,0) DEFAULT NULL,
  `rede_propria` varchar(1) DEFAULT NULL,
  `bandeira` decimal(3,0) DEFAULT NULL,
  `cartao_internacional` varchar(1) DEFAULT NULL,
  `pan` varchar(20) DEFAULT NULL,
  `id_b2b` varchar(40) DEFAULT NULL,
  `cnpj_cpf` varchar(14) DEFAULT NULL,
  `id_rec` varchar(8) DEFAULT NULL,
  `data_rec_origem` date DEFAULT NULL,
  `nsu_rec_origem` decimal(8,0) DEFAULT NULL,
  `parcela_rec` decimal(3,0) DEFAULT NULL,
  `qt_parcela_rec` decimal(3,0) DEFAULT NULL,
  `solucao_captura` decimal(2,0) DEFAULT NULL,
  `campo_adicional` varchar(338) DEFAULT NULL,
  `nseq_registro` decimal(9,0) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_banrisul_movimento_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_banrisul_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_banrisul_parcela_lancamento`
--

DROP TABLE IF EXISTS `conn_item_banrisul_parcela_lancamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_banrisul_parcela_lancamento` (
  `item_id` int(10) unsigned NOT NULL,
  `tipo_registro` varchar(2) DEFAULT NULL,
  `rede` varchar(11) DEFAULT NULL,
  `estabelecimento` varchar(15) DEFAULT NULL,
  `data_lancamento` date DEFAULT NULL,
  `cod_lancamento` decimal(4,0) DEFAULT NULL,
  `seq_lancamento` decimal(2,0) DEFAULT NULL,
  `data_movimento` date DEFAULT NULL,
  `nsu_movimento` decimal(8,0) DEFAULT NULL,
  `parcela` decimal(2,0) DEFAULT NULL,
  `valor` decimal(15,2) DEFAULT NULL,
  `tarifa_admin_fixa` decimal(8,2) DEFAULT NULL,
  `taxa_admin` decimal(8,2) DEFAULT NULL,
  `tarifa_admin` decimal(10,2) DEFAULT NULL,
  `tarifa_comunicacao` decimal(10,2) DEFAULT NULL,
  `valor_liquido` decimal(15,2) DEFAULT NULL,
  `pedido` varchar(40) DEFAULT NULL,
  `cnpj` decimal(14,0) DEFAULT NULL,
  `nseq_arquivo` decimal(9,0) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_banrisul_parcela_lancamento_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_banrisul_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_banrisul_trailer`
--

DROP TABLE IF EXISTS `conn_item_banrisul_trailer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_banrisul_trailer` (
  `item_id` int(10) unsigned NOT NULL,
  `tipo_registro` varchar(2) DEFAULT NULL,
  `nome_arquivo` varchar(40) DEFAULT NULL,
  `identificador_arquivo` varchar(8) DEFAULT NULL,
  `data_referencia_vero` date DEFAULT NULL,
  `data_referencia_banrisul_cartoes` date DEFAULT NULL,
  `data_geracao` date DEFAULT NULL,
  `hora_geracao` time DEFAULT NULL,
  `origem` varchar(10) DEFAULT NULL,
  `cnpj` decimal(14,0) DEFAULT NULL,
  `qt_registros_f1` decimal(9,0) DEFAULT NULL,
  `qt_registros_f2` decimal(9,0) DEFAULT NULL,
  `qt_registros_g1` decimal(9,0) DEFAULT NULL,
  `nseq_registro` decimal(15,0) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_banrisul_trailer_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_banrisul_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_benvisa_aj`
--

DROP TABLE IF EXISTS `conn_item_benvisa_aj`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_benvisa_aj` (
  `item_id` int(10) unsigned NOT NULL,
  `codigo_registro` varchar(2) NOT NULL,
  `identificacao_loja` varchar(15) DEFAULT NULL,
  `nsu_host_original` varchar(12) DEFAULT NULL,
  `nsu_tef` varchar(12) DEFAULT NULL,
  `nsu_terminal` varchar(12) DEFAULT NULL,
  `codigo_adquirente` int(6) DEFAULT NULL,
  `data_transacao_original` date DEFAULT NULL,
  `numero_parcela` tinyint(4) DEFAULT NULL,
  `nsu_host_transacao` varchar(12) DEFAULT NULL,
  `data_transacao_aj` date DEFAULT NULL,
  `hora_transacao_aj` time DEFAULT NULL,
  `tipo_lancamento` tinyint(4) DEFAULT NULL,
  `data_lancamento` date DEFAULT NULL,
  `meio_captura_ajuste` tinyint(4) DEFAULT NULL,
  `tipo_ajuste` tinyint(4) DEFAULT NULL,
  `codigo_ajuste` varchar(3) DEFAULT NULL,
  `descricao_motivo_ajuste` varchar(30) DEFAULT NULL,
  `valor_bruto` decimal(10,2) DEFAULT NULL,
  `valor_desconto_comissao` decimal(10,2) DEFAULT NULL,
  `valor_liquido` decimal(10,2) DEFAULT NULL,
  `banco` varchar(3) DEFAULT NULL,
  `agencia` varchar(6) DEFAULT NULL,
  `conta` varchar(11) DEFAULT NULL,
  `numero_cartao_transacao_original` varchar(19) DEFAULT NULL,
  `codigo_bandeira` int(3) DEFAULT NULL,
  `codigo_produto` varchar(3) DEFAULT NULL,
  `codigo_ec` decimal(15,0) DEFAULT NULL,
  `codigo_autorizacao` varchar(12) DEFAULT NULL,
  `nseq` varchar(6) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_benvisa_aj_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_benvisa_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_benvisa_cc`
--

DROP TABLE IF EXISTS `conn_item_benvisa_cc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_benvisa_cc` (
  `item_id` int(10) unsigned NOT NULL,
  `codigo_registro` varchar(2) NOT NULL,
  `identificacao_loja` varchar(15) DEFAULT NULL,
  `nsu_host_original` varchar(12) DEFAULT NULL,
  `nsu_tef` varchar(12) DEFAULT NULL,
  `nsu_terminal` varchar(12) DEFAULT NULL,
  `codigo_adquirente` int(6) DEFAULT NULL,
  `data_transacao_original` date DEFAULT NULL,
  `numero_parcela` tinyint(4) DEFAULT NULL,
  `nsu_host_transacao` varchar(12) DEFAULT NULL,
  `data_transacao` date DEFAULT NULL,
  `hora_transacao` time DEFAULT NULL,
  `meio_captura` int(1) DEFAULT NULL,
  `codigo_ec` decimal(15,0) DEFAULT NULL,
  `codigo_autorizacao` varchar(12) DEFAULT NULL,
  `nseq` varchar(6) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  KEY `ix_vooo_prod_rawdata_conn_item_benvisa_cc_nsu_host_original` (`nsu_host_original`),
  CONSTRAINT `conn_item_benvisa_cc_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_benvisa_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_benvisa_cv`
--

DROP TABLE IF EXISTS `conn_item_benvisa_cv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_benvisa_cv` (
  `item_id` int(10) unsigned NOT NULL,
  `codigo_registro` varchar(2) NOT NULL,
  `identificacao_loja` varchar(15) DEFAULT NULL,
  `nsu_host` varchar(12) DEFAULT NULL,
  `nsu_tef` varchar(12) DEFAULT NULL,
  `nsu_terminal` varchar(12) DEFAULT NULL,
  `codigo_adquirente` int(6) DEFAULT NULL,
  `data_transacao` date DEFAULT NULL,
  `hora_transacao` time DEFAULT NULL,
  `tipo_lancamento` int(1) DEFAULT NULL,
  `data_lancamento` date DEFAULT NULL,
  `tipo_produto` varchar(1) DEFAULT NULL,
  `meio_captura` tinyint(4) DEFAULT NULL,
  `valor_bruto_venda` decimal(10,2) DEFAULT NULL,
  `valor_desconto_venda` decimal(10,2) DEFAULT NULL,
  `valor_liquido_venda` decimal(10,2) DEFAULT NULL,
  `numero_cartao` varchar(19) DEFAULT NULL,
  `numero_parcela` tinyint(4) DEFAULT NULL,
  `total_parcelas` tinyint(4) DEFAULT NULL,
  `nsu_host_parcela` varchar(12) DEFAULT NULL,
  `valor_bruto_parcela` decimal(10,2) DEFAULT NULL,
  `valor_desconto_parcela` decimal(10,2) DEFAULT NULL,
  `valor_liquido_parcela` decimal(10,2) DEFAULT NULL,
  `banco` varchar(3) DEFAULT NULL,
  `agencia` varchar(6) DEFAULT NULL,
  `conta` varchar(11) DEFAULT NULL,
  `codigo_autorizacao` varchar(12) DEFAULT NULL,
  `codigo_bandeira` smallint(6) DEFAULT NULL,
  `codigo_produto` smallint(6) DEFAULT NULL,
  `codigo_ec` decimal(15,0) DEFAULT NULL,
  `nseq` varchar(6) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  KEY `ix_vooo_prod_rawdata_conn_item_benvisa_cv_identificacao_loja` (`identificacao_loja`),
  KEY `ix_vooo_prod_rawdata_conn_item_benvisa_cv_nsu_host` (`nsu_host`),
  CONSTRAINT `conn_item_benvisa_cv_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_benvisa_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_benvisa_header_arquivo`
--

DROP TABLE IF EXISTS `conn_item_benvisa_header_arquivo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_benvisa_header_arquivo` (
  `item_id` int(10) unsigned NOT NULL,
  `codigo_registro` varchar(2) NOT NULL,
  `versao_layout` varchar(6) DEFAULT NULL,
  `data_geracao_arquivo` date DEFAULT NULL,
  `hora_geracao_arquivo` time DEFAULT NULL,
  `id_movimento` int(6) DEFAULT NULL,
  `nome_administradora` varchar(60) DEFAULT NULL,
  `identificacao_remetente` int(4) DEFAULT NULL,
  `identificacao_destinatario` int(6) DEFAULT NULL,
  `tipo_processamento` varchar(1) DEFAULT NULL,
  `nseq_registro` int(6) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_benvisa_header_arquivo_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_benvisa_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_benvisa_header_lote`
--

DROP TABLE IF EXISTS `conn_item_benvisa_header_lote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_benvisa_header_lote` (
  `item_id` int(10) unsigned NOT NULL,
  `codigo_registro` varchar(2) NOT NULL,
  `data_movimento` date DEFAULT NULL,
  `identificacao_moeda` varchar(2) DEFAULT NULL,
  `nseq` varchar(6) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_benvisa_header_lote_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_benvisa_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_benvisa_line`
--

DROP TABLE IF EXISTS `conn_item_benvisa_line`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_benvisa_line` (
  `item_id` int(10) unsigned NOT NULL,
  `registertype` varchar(2) NOT NULL,
  `file_version` varchar(6) NOT NULL,
  `masterid` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  KEY `masterid` (`masterid`),
  CONSTRAINT `conn_item_benvisa_line_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `vooo_prod_backend`.`connection_item` (`item_id`),
  CONSTRAINT `conn_item_benvisa_line_ibfk_2` FOREIGN KEY (`masterid`) REFERENCES `conn_item_benvisa_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_benvisa_rv`
--

DROP TABLE IF EXISTS `conn_item_benvisa_rv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_benvisa_rv` (
  `item_id` int(10) unsigned NOT NULL,
  `codigo_registro` varchar(2) NOT NULL,
  `identificacao_loja` varchar(15) DEFAULT NULL,
  `numero_rv` varchar(20) DEFAULT NULL,
  `data_rv` date DEFAULT NULL,
  `tipo_lancamento` tinyint(4) DEFAULT NULL,
  `data_pagamento` date DEFAULT NULL,
  `cvs_aprovados` int(11) DEFAULT NULL,
  `cvs_reprovados` int(11) DEFAULT NULL,
  `tipo_produto` varchar(1) DEFAULT NULL,
  `codigo_produto` smallint(6) DEFAULT NULL,
  `banco` varchar(3) DEFAULT NULL,
  `agencia` varchar(6) DEFAULT NULL,
  `conta_corrente` varchar(11) DEFAULT NULL,
  `valor_bruto` decimal(12,2) DEFAULT NULL,
  `sinal_valor_bruto` varchar(1) DEFAULT NULL,
  `valor_liquido` decimal(12,2) DEFAULT NULL,
  `sinal_valor_liquido` varchar(1) DEFAULT NULL,
  `valor_credito` decimal(12,2) DEFAULT NULL,
  `sinal_valor_credito` varchar(1) DEFAULT NULL,
  `valor_comissao` decimal(12,2) DEFAULT NULL,
  `sinal_valor_comissao` varchar(1) DEFAULT NULL,
  `identificador_ajuste_rv` varchar(1) DEFAULT NULL,
  `codigo_ajuste` smallint(6) DEFAULT NULL,
  `codigo_ec` decimal(15,0) DEFAULT NULL,
  `codigo_adquirente` int(6) DEFAULT NULL,
  `nseq` varchar(6) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  KEY `ix_vooo_prod_rawdata_conn_item_benvisa_rv_identificacao_loja` (`identificacao_loja`),
  CONSTRAINT `conn_item_benvisa_rv_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_benvisa_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_benvisa_trailer_arquivo`
--

DROP TABLE IF EXISTS `conn_item_benvisa_trailer_arquivo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_benvisa_trailer_arquivo` (
  `item_id` int(10) unsigned NOT NULL,
  `codigo_registro` varchar(2) NOT NULL,
  `total_geral_registros` int(6) DEFAULT NULL,
  `nseq` varchar(6) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_benvisa_trailer_arquivo_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_benvisa_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_benvisa_trailer_lote`
--

DROP TABLE IF EXISTS `conn_item_benvisa_trailer_lote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_benvisa_trailer_lote` (
  `item_id` int(10) unsigned NOT NULL,
  `codigo_registro` varchar(2) NOT NULL,
  `total_registros_transacao` int(6) DEFAULT NULL,
  `total_valores_creditos` decimal(10,2) DEFAULT NULL,
  `nseq` varchar(6) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_benvisa_trailer_lote_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_benvisa_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_bin_line`
--

DROP TABLE IF EXISTS `conn_item_bin_line`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_bin_line` (
  `item_id` int(10) unsigned NOT NULL,
  `registertype` varchar(3) NOT NULL,
  `filetype` varchar(2) DEFAULT NULL,
  `masterid` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  KEY `masterid` (`masterid`),
  CONSTRAINT `conn_item_bin_line_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `vooo_prod_backend`.`connection_item` (`item_id`),
  CONSTRAINT `conn_item_bin_line_ibfk_2` FOREIGN KEY (`masterid`) REFERENCES `conn_item_bin_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_bin_mf_ajustes_processados`
--

DROP TABLE IF EXISTS `conn_item_bin_mf_ajustes_processados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_bin_mf_ajustes_processados` (
  `item_id` int(10) unsigned NOT NULL,
  `tipo_registro` varchar(3) DEFAULT NULL,
  `codigo_cliente_ajustado` varchar(8) DEFAULT NULL,
  `data_liquidacao_ajuste` date DEFAULT NULL,
  `numero_controle_ajuste` varchar(15) DEFAULT NULL,
  `valor_ajuste` decimal(15,2) DEFAULT NULL,
  `tipo_operacao` varchar(1) DEFAULT NULL,
  `tipo_pagamento` decimal(1,0) DEFAULT NULL,
  `codigo_ajuste` varchar(3) DEFAULT NULL,
  `descricao_ajuste` varchar(40) DEFAULT NULL,
  `numero_referencia_processo` varchar(15) DEFAULT NULL,
  `data_solicitacao_ajuste` date DEFAULT NULL,
  `valor_solicitacao_ajuste` decimal(15,2) DEFAULT NULL,
  `tipo_solicitacao` varchar(1) DEFAULT NULL,
  `numero_comprovante_venda` varchar(12) DEFAULT NULL,
  `numero_cartao` varchar(19) DEFAULT NULL,
  `numero_controle_cliente` varchar(20) DEFAULT NULL,
  `autorizacao` varchar(6) DEFAULT NULL,
  `tipo_venda` varchar(1) DEFAULT NULL,
  `data_comprovante` date DEFAULT NULL,
  `valor_bruto_comprovante_venda` decimal(15,2) DEFAULT NULL,
  `parcela_comprovante_venda` decimal(2,0) DEFAULT NULL,
  `total_parcelas_comprovante_venda` decimal(2,0) DEFAULT NULL,
  `codigo_cliente_origem_venda` varchar(8) DEFAULT NULL,
  `codigo_terminal` varchar(8) DEFAULT NULL,
  `qtde_transacoes_recarga` decimal(6,0) DEFAULT NULL,
  `numero_sequencia_registro` decimal(6,0) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_bin_mf_ajustes_processados_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_bin_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_bin_mf_ajustes_programados`
--

DROP TABLE IF EXISTS `conn_item_bin_mf_ajustes_programados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_bin_mf_ajustes_programados` (
  `item_id` int(10) unsigned NOT NULL,
  `tipo_registro` varchar(3) DEFAULT NULL,
  `codigo_cliente_ajustado` varchar(8) DEFAULT NULL,
  `data_liquidacao_ajuste` date DEFAULT NULL,
  `numero_controle_ajuste` varchar(15) DEFAULT NULL,
  `valor_ajuste` decimal(15,2) DEFAULT NULL,
  `tipo_operacao` varchar(1) DEFAULT NULL,
  `codigo_ajuste` varchar(3) DEFAULT NULL,
  `descricao_ajuste` varchar(40) DEFAULT NULL,
  `numero_referencia_processo` varchar(15) DEFAULT NULL,
  `data_solicitacao_ajuste` date DEFAULT NULL,
  `valor_solicitacao_ajuste` decimal(15,2) DEFAULT NULL,
  `tipo_solicitacao` varchar(1) DEFAULT NULL,
  `numero_comprovante_venda` varchar(12) DEFAULT NULL,
  `numero_cartao` varchar(20) DEFAULT NULL,
  `numero_controle_cliente` varchar(20) DEFAULT NULL,
  `autorizacao` varchar(6) DEFAULT NULL,
  `tipo_venda` varchar(1) DEFAULT NULL,
  `data_comprovante` date DEFAULT NULL,
  `valor_bruto_comprovante_venda` decimal(15,2) DEFAULT NULL,
  `parcela_comprovante_venda` decimal(6,0) DEFAULT NULL,
  `total_parcelas_comprovante_venda` decimal(2,0) DEFAULT NULL,
  `codigo_cliente_origem_venda` varchar(8) DEFAULT NULL,
  `codigo_terminal` varchar(8) DEFAULT NULL,
  `qtde_transacoes_recarga` decimal(6,0) DEFAULT NULL,
  `numero_sequencia_registro` decimal(6,0) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_bin_mf_ajustes_programados_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_bin_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_bin_mf_comprovante_movimentacao_liquidado`
--

DROP TABLE IF EXISTS `conn_item_bin_mf_comprovante_movimentacao_liquidado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_bin_mf_comprovante_movimentacao_liquidado` (
  `item_id` int(10) unsigned NOT NULL,
  `tipo_registro` varchar(3) DEFAULT NULL,
  `codigo_cliente` varchar(8) DEFAULT NULL,
  `data_pagamento` date DEFAULT NULL,
  `numero_comprovante_venda` varchar(12) DEFAULT NULL,
  `valor_liquido_comprovante` decimal(15,2) DEFAULT NULL,
  `valor_bruto_comprovante` decimal(15,2) DEFAULT NULL,
  `valor_desconto` decimal(15,2) DEFAULT NULL,
  `valor_taxa_intercambio_plus` decimal(15,2) DEFAULT NULL,
  `data_venda` date DEFAULT NULL,
  `numero_cartao` varchar(19) DEFAULT NULL,
  `numero_controle_cliente` varchar(20) DEFAULT NULL,
  `autorizacao` varchar(6) DEFAULT NULL,
  `numero_resumo_vendas` decimal(15,0) DEFAULT NULL,
  `numero_sequencia_registro` decimal(6,0) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_bin_mf_comprovante_movimentacao_liquidado_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_bin_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_bin_mf_comprovante_venda_debito`
--

DROP TABLE IF EXISTS `conn_item_bin_mf_comprovante_venda_debito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_bin_mf_comprovante_venda_debito` (
  `item_id` int(10) unsigned NOT NULL,
  `tipo_registro` varchar(3) DEFAULT NULL,
  `codigo_cliente` varchar(8) DEFAULT NULL,
  `data_pagamento` date DEFAULT NULL,
  `numero_comprovante_venda` varchar(12) DEFAULT NULL,
  `valor_liquido_comprovante` decimal(15,2) DEFAULT NULL,
  `valor_bruto_comprovante` decimal(15,2) DEFAULT NULL,
  `valor_desconto` decimal(15,2) DEFAULT NULL,
  `valor_taxa_intercambio_plus` decimal(15,2) DEFAULT NULL,
  `data_venda` date DEFAULT NULL,
  `numero_cartao` varchar(19) DEFAULT NULL,
  `numero_controle_cliente` varchar(20) DEFAULT NULL,
  `autorizacao` varchar(6) DEFAULT NULL,
  `tipo_pagamento` decimal(6,0) DEFAULT NULL,
  `status_pagamento` decimal(6,0) DEFAULT NULL,
  `numero_resumo_venda` varchar(15) DEFAULT NULL,
  `nome_operadora_recarga` varchar(50) DEFAULT NULL,
  `codigo_cliente_recarga` varchar(9) DEFAULT NULL,
  `terminal_recarga` varchar(8) DEFAULT NULL,
  `codigo_recarga` varchar(8) DEFAULT NULL,
  `valor_cashback` decimal(15,2) DEFAULT NULL,
  `intercambio_reverso` decimal(15,2) DEFAULT NULL,
  `numero_sequencia_registro` decimal(6,0) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  KEY `ix_vooo_prod_rawdata_conn_item_bin_mf_comprovante_venda__775e` (`codigo_cliente`),
  CONSTRAINT `conn_item_bin_mf_comprovante_venda_debito_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_bin_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_bin_mf_comprovante_vendas_credito`
--

DROP TABLE IF EXISTS `conn_item_bin_mf_comprovante_vendas_credito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_bin_mf_comprovante_vendas_credito` (
  `item_id` int(10) unsigned NOT NULL,
  `tipo_registro` varchar(3) DEFAULT NULL,
  `codigo_cliente` varchar(8) DEFAULT NULL,
  `data_pagamento` date DEFAULT NULL,
  `numero_comprovante_venda` varchar(12) DEFAULT NULL,
  `valor_liquido_comprovante` decimal(15,2) DEFAULT NULL,
  `valor_bruto_comprovante` decimal(15,2) DEFAULT NULL,
  `valor_desconto` decimal(15,2) DEFAULT NULL,
  `valor_taxa_intercambio_plus` decimal(15,2) DEFAULT NULL,
  `data_venda` date DEFAULT NULL,
  `numero_cartao` varchar(19) DEFAULT NULL,
  `numero_controle_cliente` varchar(20) DEFAULT NULL,
  `autorizacao` varchar(6) DEFAULT NULL,
  `tipo_pagamento` decimal(6,0) DEFAULT NULL,
  `status_pagamento` decimal(6,0) DEFAULT NULL,
  `numero_resumo_venda` varchar(15) DEFAULT NULL,
  `nome_operadora_recarga` varchar(50) DEFAULT NULL,
  `codigo_cliente_recarga` varchar(9) DEFAULT NULL,
  `placeholder` varchar(45) DEFAULT NULL,
  `placeholder2` varchar(45) DEFAULT NULL,
  `terminal_recarga` varchar(15) DEFAULT NULL,
  `codigo_recarga` varchar(15) DEFAULT NULL,
  `numero_sequencia_registro` decimal(6,0) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_bin_mf_comprovante_vendas_credito_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_bin_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_bin_mf_comprovante_vendas_parcelado`
--

DROP TABLE IF EXISTS `conn_item_bin_mf_comprovante_vendas_parcelado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_bin_mf_comprovante_vendas_parcelado` (
  `item_id` int(10) unsigned NOT NULL,
  `tipo_registro` varchar(3) DEFAULT NULL,
  `codigo_cliente` varchar(8) DEFAULT NULL,
  `data_pagamento` date DEFAULT NULL,
  `numero_comprovante_venda` varchar(12) DEFAULT NULL,
  `valor_liquido_parcela` decimal(15,2) DEFAULT NULL,
  `parcela_comprovante` decimal(2,0) DEFAULT NULL,
  `total_parcelas_comprovante` decimal(2,0) DEFAULT NULL,
  `valor_bruto_comprovante` decimal(15,2) DEFAULT NULL,
  `valor_desconto` decimal(15,2) DEFAULT NULL,
  `valor_taxa_intercambio_plus` decimal(15,2) DEFAULT NULL,
  `data_venda` date DEFAULT NULL,
  `numero_cartao` varchar(19) DEFAULT NULL,
  `numero_controle_cliente` varchar(20) DEFAULT NULL,
  `autorizacao` varchar(6) DEFAULT NULL,
  `tipo_pagamento` decimal(6,0) DEFAULT NULL,
  `status_pagamento` decimal(6,0) DEFAULT NULL,
  `numero_resumo_venda` varchar(15) DEFAULT NULL,
  `parcela_resumo_venda` varchar(15) DEFAULT NULL,
  `numero_sequencia_registro` decimal(6,0) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_bin_mf_comprovante_vendas_parcelado_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_bin_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_bin_mf_header`
--

DROP TABLE IF EXISTS `conn_item_bin_mf_header`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_bin_mf_header` (
  `item_id` int(10) unsigned NOT NULL,
  `tipo_registro` varchar(3) DEFAULT NULL,
  `data_processamento` date DEFAULT NULL,
  `nome_adquirente` varchar(50) DEFAULT NULL,
  `tipo_arquivo` varchar(25) DEFAULT NULL,
  `numero_arquivo` decimal(8,0) DEFAULT NULL,
  `codigo_cliente` varchar(8) DEFAULT NULL,
  `nome_cliente` varchar(50) DEFAULT NULL,
  `tipo_processamento` varchar(15) DEFAULT NULL,
  `layout_arquivo` varchar(5) DEFAULT NULL,
  `numero_sequencia_registro` decimal(6,0) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_bin_mf_header_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_bin_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_bin_mf_header_centralizadora`
--

DROP TABLE IF EXISTS `conn_item_bin_mf_header_centralizadora`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_bin_mf_header_centralizadora` (
  `item_id` int(10) unsigned NOT NULL,
  `tipo_registro` varchar(3) DEFAULT NULL,
  `data_processamento` date DEFAULT NULL,
  `codigo_cliente` varchar(8) DEFAULT NULL,
  `nome_cliente` varchar(50) DEFAULT NULL,
  `numero_sequencia_registro` decimal(6,0) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_bin_mf_header_centralizadora_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_bin_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_bin_mf_header_matriz`
--

DROP TABLE IF EXISTS `conn_item_bin_mf_header_matriz`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_bin_mf_header_matriz` (
  `item_id` int(10) unsigned NOT NULL,
  `tipo_registro` varchar(3) DEFAULT NULL,
  `data_processamento` date DEFAULT NULL,
  `codigo_cliente` varchar(8) DEFAULT NULL,
  `nome_cliente` varchar(50) DEFAULT NULL,
  `numero_sequencia_registro` decimal(6,0) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_bin_mf_header_matriz_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_bin_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_bin_mf_header_regional`
--

DROP TABLE IF EXISTS `conn_item_bin_mf_header_regional`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_bin_mf_header_regional` (
  `item_id` int(10) unsigned NOT NULL,
  `tipo_registro` varchar(3) DEFAULT NULL,
  `data_processamento` date DEFAULT NULL,
  `codigo_cliente` varchar(8) DEFAULT NULL,
  `nome_cliente` varchar(50) DEFAULT NULL,
  `numero_sequencia_registro` decimal(6,0) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_bin_mf_header_regional_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_bin_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_bin_mf_pagamentos_valores_suspensos`
--

DROP TABLE IF EXISTS `conn_item_bin_mf_pagamentos_valores_suspensos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_bin_mf_pagamentos_valores_suspensos` (
  `item_id` int(10) unsigned NOT NULL,
  `tipo_registro` varchar(3) DEFAULT NULL,
  `codigo_cliente` varchar(8) DEFAULT NULL,
  `numero_resumo_vendas` decimal(15,0) DEFAULT NULL,
  `qtde_comprovantes` decimal(6,0) DEFAULT NULL,
  `tipo_venda` varchar(1) DEFAULT NULL,
  `data_resumo_venda` date DEFAULT NULL,
  `valor_pagamento_suspenso` decimal(15,2) DEFAULT NULL,
  `data_pagamento_original` date DEFAULT NULL,
  `data_suspensao` date DEFAULT NULL,
  `parcela_resumo_venda` decimal(2,0) DEFAULT NULL,
  `total_parcelas_resumo_vendas` decimal(2,0) DEFAULT NULL,
  `numero_sequencia_registro` decimal(6,0) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_bin_mf_pagamentos_valores_suspensos_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_bin_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_bin_mf_resumo_liquidacao_entre_contas`
--

DROP TABLE IF EXISTS `conn_item_bin_mf_resumo_liquidacao_entre_contas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_bin_mf_resumo_liquidacao_entre_contas` (
  `item_id` int(10) unsigned NOT NULL,
  `tipo_registro` varchar(3) DEFAULT NULL,
  `codigo_cliente` varchar(8) DEFAULT NULL,
  `data_liquidacao` date DEFAULT NULL,
  `oc_doc` varchar(20) DEFAULT NULL,
  `valor_pagamento` decimal(15,2) DEFAULT NULL,
  `tipo_operacao` varchar(1) DEFAULT NULL,
  `conta_corrente` varchar(15) DEFAULT NULL,
  `bandeira_cartao` varchar(3) DEFAULT NULL,
  `numero_sequencia_registro` decimal(6,0) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_bin_mf_resumo_liquidacao_entre_contas_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_bin_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_bin_mf_rv_credito`
--

DROP TABLE IF EXISTS `conn_item_bin_mf_rv_credito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_bin_mf_rv_credito` (
  `item_id` int(10) unsigned NOT NULL,
  `tipo_registro` varchar(3) DEFAULT NULL,
  `codigo_cliente` varchar(8) DEFAULT NULL,
  `data_pagamento` date DEFAULT NULL,
  `oc_doc` varchar(20) DEFAULT NULL,
  `valor_pagamento` decimal(15,2) DEFAULT NULL,
  `tipo_operacao` varchar(1) DEFAULT NULL,
  `tipo_pagamento` decimal(1,0) DEFAULT NULL,
  `status_pagamento` decimal(1,0) DEFAULT NULL,
  `banco` varchar(3) DEFAULT NULL,
  `agencia` varchar(6) DEFAULT NULL,
  `conta_corrente` varchar(15) DEFAULT NULL,
  `numero_resumo_venda` varchar(15) DEFAULT NULL,
  `data_venda` date DEFAULT NULL,
  `qtde_comprovante_vendas` decimal(6,0) DEFAULT NULL,
  `bandeira_cartao` varchar(3) DEFAULT NULL,
  `valor_bruto_resumo_vendas` decimal(15,2) DEFAULT NULL,
  `valor_desconto` decimal(15,2) DEFAULT NULL,
  `valor_liquido_resumo_vendas` decimal(15,2) DEFAULT NULL,
  `data_vencimento_original` date DEFAULT NULL,
  `codigo_cliente_origem_venda` varchar(8) DEFAULT NULL,
  `numero_sequencia_registro` decimal(6,0) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  KEY `ix_vooo_prod_rawdata_conn_item_bin_mf_rv_credito_codigo_cliente` (`codigo_cliente`),
  CONSTRAINT `conn_item_bin_mf_rv_credito_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_bin_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_bin_mf_rv_debito`
--

DROP TABLE IF EXISTS `conn_item_bin_mf_rv_debito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_bin_mf_rv_debito` (
  `item_id` int(10) unsigned NOT NULL,
  `tipo_registro` varchar(3) DEFAULT NULL,
  `codigo_cliente` varchar(8) DEFAULT NULL,
  `data_pagamento` date DEFAULT NULL,
  `oc_doc` varchar(20) DEFAULT NULL,
  `valor_pagamento` decimal(15,2) DEFAULT NULL,
  `tipo_operacao` varchar(1) DEFAULT NULL,
  `tipo_pagamento` decimal(1,0) DEFAULT NULL,
  `status_pagamento` decimal(1,0) DEFAULT NULL,
  `banco` varchar(3) DEFAULT NULL,
  `agencia` varchar(6) DEFAULT NULL,
  `conta_corrente` varchar(15) DEFAULT NULL,
  `numero_resumo_venda` varchar(15) DEFAULT NULL,
  `data_venda` date DEFAULT NULL,
  `qtde_comprovante_vendas` decimal(6,0) DEFAULT NULL,
  `bandeira_cartao` varchar(3) DEFAULT NULL,
  `valor_bruto_resumo_vendas` decimal(15,2) DEFAULT NULL,
  `valor_desconto` decimal(15,2) DEFAULT NULL,
  `codigo_cliente_origem_venda` varchar(8) DEFAULT NULL,
  `valor_cashback` decimal(15,2) DEFAULT NULL,
  `intercambio_reverso` decimal(15,2) DEFAULT NULL,
  `numero_sequencia_registro` decimal(6,0) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_bin_mf_rv_debito_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_bin_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_bin_mf_rv_parcelado`
--

DROP TABLE IF EXISTS `conn_item_bin_mf_rv_parcelado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_bin_mf_rv_parcelado` (
  `item_id` int(10) unsigned NOT NULL,
  `tipo_registro` varchar(3) DEFAULT NULL,
  `codigo_cliente` varchar(8) DEFAULT NULL,
  `data_pagamento` date DEFAULT NULL,
  `oc_doc` varchar(20) DEFAULT NULL,
  `valor_pagamento` decimal(15,2) DEFAULT NULL,
  `tipo_operacao` varchar(1) DEFAULT NULL,
  `tipo_pagamento` decimal(1,0) DEFAULT NULL,
  `status_pagamento` decimal(1,0) DEFAULT NULL,
  `parcela_resumo_vendas` decimal(2,0) DEFAULT NULL,
  `total_parcelas_resumo_vendas` decimal(2,0) DEFAULT NULL,
  `banco` varchar(3) DEFAULT NULL,
  `agencia` varchar(6) DEFAULT NULL,
  `conta_corrente` varchar(15) DEFAULT NULL,
  `numero_resumo_venda` varchar(15) DEFAULT NULL,
  `data_venda` date DEFAULT NULL,
  `qtde_comprovante_vendas` decimal(6,0) DEFAULT NULL,
  `bandeira_cartao` varchar(3) DEFAULT NULL,
  `valor_bruto_resumo_vendas` decimal(15,2) DEFAULT NULL,
  `valor_desconto` decimal(15,2) DEFAULT NULL,
  `valor_liquido_resumo_vendas` decimal(15,2) DEFAULT NULL,
  `data_vencimento_parcela_resumo_venda` date DEFAULT NULL,
  `codigo_cliente_origem_venda` varchar(8) DEFAULT NULL,
  `numero_sequencia_registro` decimal(6,0) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  KEY `ix_vooo_prod_rawdata_conn_item_bin_mf_rv_parcelado_codig_d100` (`codigo_cliente`),
  CONSTRAINT `conn_item_bin_mf_rv_parcelado_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_bin_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_bin_mf_solicitacao_comprovante_chargeback`
--

DROP TABLE IF EXISTS `conn_item_bin_mf_solicitacao_comprovante_chargeback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_bin_mf_solicitacao_comprovante_chargeback` (
  `item_id` int(10) unsigned NOT NULL,
  `tipo_registro` varchar(3) DEFAULT NULL,
  `codigo_cliente_ajustado` varchar(8) DEFAULT NULL,
  `data_pedido_copia` date DEFAULT NULL,
  `numero_comprovante_venda` varchar(12) DEFAULT NULL,
  `bandeira_cartao` varchar(3) DEFAULT NULL,
  `numero_cartao` varchar(19) DEFAULT NULL,
  `numero_controle_cliente` varchar(20) DEFAULT NULL,
  `autorizacao` varchar(6) DEFAULT NULL,
  `tipo_venda_comprovante` varchar(1) DEFAULT NULL,
  `data_comprovante_venda` date DEFAULT NULL,
  `valor_bruto_comprovante` decimal(15,2) DEFAULT NULL,
  `numero_processo_chargeback` varchar(15) DEFAULT NULL,
  `codigo_motivo_chargeback` varchar(5) DEFAULT NULL,
  `data_limite_resposta` date DEFAULT NULL,
  `numero_sequencia_registro` decimal(6,0) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_bin_mf_solicitacao_comprovante_chargeback_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_bin_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_bin_mf_trailer`
--

DROP TABLE IF EXISTS `conn_item_bin_mf_trailer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_bin_mf_trailer` (
  `item_id` int(10) unsigned NOT NULL,
  `tipo_registro` varchar(3) DEFAULT NULL,
  `data_processamento` date DEFAULT NULL,
  `codigo_cliente` varchar(8) DEFAULT NULL,
  `qtde_matriz` decimal(6,0) DEFAULT NULL,
  `qtde_resumo_vendas_debito` decimal(6,0) DEFAULT NULL,
  `valor_pagamentos_vendas_debito_mastercard` decimal(15,2) DEFAULT NULL,
  `valor_pagamentos_vendas_debito_visa` decimal(15,2) DEFAULT NULL,
  `valor_pagamentos_vendas_debito_cabal` decimal(15,2) DEFAULT NULL,
  `valor_liquido_vendas_debito` decimal(15,2) DEFAULT NULL,
  `qtde_resumo_vendas_credito` decimal(6,0) DEFAULT NULL,
  `qtde_resumo_vendas_credito_parcelado` decimal(6,0) DEFAULT NULL,
  `valor_pagamentos_vendas_credito_mastercard` decimal(15,2) DEFAULT NULL,
  `valor_pagamentos_vendas_credito_visa` decimal(15,2) DEFAULT NULL,
  `valor_pagamentos_vendas_credito_cabal` decimal(15,2) DEFAULT NULL,
  `valor_liquido_vendas_credito` decimal(15,2) DEFAULT NULL,
  `qtde_resumo_vendas_antecipado` decimal(15,2) DEFAULT NULL,
  `valor_antecipado` decimal(15,2) DEFAULT NULL,
  `qtde_ajustes` decimal(6,0) DEFAULT NULL,
  `valor_ajustes` decimal(15,2) DEFAULT NULL,
  `valor_liquido_arquivo` decimal(15,2) DEFAULT NULL,
  `valor_cashback` decimal(15,2) DEFAULT NULL,
  `intercambio_reverso` decimal(15,2) DEFAULT NULL,
  `numero_sequencia_registro` decimal(6,0) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_bin_mf_trailer_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_bin_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_bin_mf_trailer_centralizadora`
--

DROP TABLE IF EXISTS `conn_item_bin_mf_trailer_centralizadora`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_bin_mf_trailer_centralizadora` (
  `item_id` int(10) unsigned NOT NULL,
  `tipo_registro` varchar(3) DEFAULT NULL,
  `data_processamento` date DEFAULT NULL,
  `codigo_cliente` varchar(8) DEFAULT NULL,
  `qtde_resumo_vendas_debito` decimal(6,0) DEFAULT NULL,
  `valor_pagamentos_vendas_debito` decimal(15,2) DEFAULT NULL,
  `qtde_resumo_vendas_credito` decimal(6,0) DEFAULT NULL,
  `valor_pagamentos_vendas_credito` decimal(15,2) DEFAULT NULL,
  `qtde_resumo_vendas_credito_parcelado` decimal(6,0) DEFAULT NULL,
  `valor_pagamentos_vendas_credito_parcelado` decimal(15,2) DEFAULT NULL,
  `qtde_lotes_vendas_antecipados` decimal(6,0) DEFAULT NULL,
  `valor_antecipacao` decimal(15,2) DEFAULT NULL,
  `qtde_ajustes` decimal(6,0) DEFAULT NULL,
  `valor_total_ajustes` decimal(15,2) DEFAULT NULL,
  `valor_liquido_pagamento` decimal(15,2) DEFAULT NULL,
  `valor_cashback` decimal(15,2) DEFAULT NULL,
  `intercambio_reverso` decimal(15,2) DEFAULT NULL,
  `numero_sequencia_registro` decimal(6,0) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_bin_mf_trailer_centralizadora_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_bin_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_bin_mf_trailer_matriz`
--

DROP TABLE IF EXISTS `conn_item_bin_mf_trailer_matriz`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_bin_mf_trailer_matriz` (
  `item_id` int(10) unsigned NOT NULL,
  `tipo_registro` varchar(3) DEFAULT NULL,
  `data_processamento` date DEFAULT NULL,
  `codigo_cliente` varchar(8) DEFAULT NULL,
  `qtde_resumo_vendas_debito` decimal(6,0) DEFAULT NULL,
  `valor_pagamentos_vendas_debito` decimal(15,2) DEFAULT NULL,
  `qtde_resumo_vendas_credito` decimal(6,0) DEFAULT NULL,
  `valor_pagamentos_vendas_credito` decimal(15,2) DEFAULT NULL,
  `qtde_resumo_vendas_credito_parcelado` decimal(6,0) DEFAULT NULL,
  `valor_pagamentos_vendas_credito_parcelado` decimal(15,2) DEFAULT NULL,
  `qtde_lotes_vendas_antecipados` decimal(6,0) DEFAULT NULL,
  `valor_antecipacao` decimal(15,2) DEFAULT NULL,
  `qtde_ajustes` decimal(6,0) DEFAULT NULL,
  `valor_total_ajustes` decimal(15,2) DEFAULT NULL,
  `valor_liquido_pagamento` decimal(15,2) DEFAULT NULL,
  `valor_cashback` decimal(15,2) DEFAULT NULL,
  `intercambio_reverso` decimal(15,2) DEFAULT NULL,
  `numero_sequencia_registro` decimal(6,0) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_bin_mf_trailer_matriz_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_bin_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_bin_mf_trailer_regional`
--

DROP TABLE IF EXISTS `conn_item_bin_mf_trailer_regional`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_bin_mf_trailer_regional` (
  `item_id` int(10) unsigned NOT NULL,
  `tipo_registro` varchar(3) DEFAULT NULL,
  `data_processamento` date DEFAULT NULL,
  `codigo_cliente` varchar(8) DEFAULT NULL,
  `qtde_resumo_vendas_debito` decimal(6,0) DEFAULT NULL,
  `valor_pagamentos_vendas_debito` decimal(15,2) DEFAULT NULL,
  `qtde_resumo_vendas_credito` decimal(6,0) DEFAULT NULL,
  `valor_pagamentos_vendas_credito` decimal(15,2) DEFAULT NULL,
  `qtde_resumo_vendas_credito_parcelado` decimal(6,0) DEFAULT NULL,
  `valor_pagamentos_vendas_credito_parcelado` decimal(15,2) DEFAULT NULL,
  `qtde_lotes_vendas_antecipados` decimal(6,0) DEFAULT NULL,
  `valor_antecipacao` decimal(15,2) DEFAULT NULL,
  `qtde_ajustes` decimal(6,0) DEFAULT NULL,
  `valor_total_ajustes` decimal(15,2) DEFAULT NULL,
  `valor_liquido_pagamento` decimal(15,2) DEFAULT NULL,
  `valor_cashback` decimal(15,2) DEFAULT NULL,
  `intercambio_reverso` decimal(15,2) DEFAULT NULL,
  `numero_sequencia_registro` decimal(6,0) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_bin_mf_trailer_regional_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_bin_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_bin_mv_comprovante_vendas_parcelado`
--

DROP TABLE IF EXISTS `conn_item_bin_mv_comprovante_vendas_parcelado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_bin_mv_comprovante_vendas_parcelado` (
  `item_id` int(10) unsigned NOT NULL,
  `tipo_registro` varchar(3) DEFAULT NULL,
  `codigo_cliente` varchar(8) DEFAULT NULL,
  `data_venda` date DEFAULT NULL,
  `numero_resumo_venda` varchar(15) DEFAULT NULL,
  `numero_comprovante_venda` varchar(12) DEFAULT NULL,
  `bandeira_cartao` varchar(3) DEFAULT NULL,
  `numero_cartao` varchar(19) DEFAULT NULL,
  `numero_controle_cliente` varchar(20) DEFAULT NULL,
  `autorizacao` varchar(6) DEFAULT NULL,
  `horario_transacao` time DEFAULT NULL,
  `numero_terminal` varchar(8) DEFAULT NULL,
  `tipo_captura` varchar(3) DEFAULT NULL,
  `emissor_cartao` decimal(1,0) DEFAULT NULL,
  `total_parcelas_comprovante` decimal(13,0) DEFAULT NULL,
  `valor_bruto_comprovante` decimal(15,2) DEFAULT NULL,
  `valor_desconto` decimal(15,2) DEFAULT NULL,
  `valor_taxa_intercambio_plus` decimal(15,2) DEFAULT NULL,
  `valor_liquido_comprovante` decimal(15,2) DEFAULT NULL,
  `valor_primeira_parcela_venda` decimal(15,2) DEFAULT NULL,
  `data_credito_primeira_parcela` date DEFAULT NULL,
  `numero_sequencia_registro` decimal(6,0) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_bin_mv_comprovante_vendas_parcelado_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_bin_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_bin_mv_cv_credito`
--

DROP TABLE IF EXISTS `conn_item_bin_mv_cv_credito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_bin_mv_cv_credito` (
  `item_id` int(10) unsigned NOT NULL,
  `tipo_registro` varchar(3) DEFAULT NULL,
  `codigo_cliente` varchar(8) DEFAULT NULL,
  `data_venda` date DEFAULT NULL,
  `numero_resumo_venda` varchar(15) DEFAULT NULL,
  `numero_comprovante_venda` varchar(12) DEFAULT NULL,
  `bandeira_cartao` varchar(3) DEFAULT NULL,
  `numero_cartao` varchar(19) DEFAULT NULL,
  `numero_controle_cliente` varchar(20) DEFAULT NULL,
  `autorizacao` varchar(6) DEFAULT NULL,
  `horario_transacao` time DEFAULT NULL,
  `numero_terminal` varchar(8) DEFAULT NULL,
  `tipo_captura` varchar(3) DEFAULT NULL,
  `emissor_cartao` decimal(1,0) DEFAULT NULL,
  `valor_bruto` decimal(15,2) DEFAULT NULL,
  `valor_desconto` decimal(15,2) DEFAULT NULL,
  `valor_taxa_intercambio_plus` decimal(15,2) DEFAULT NULL,
  `valor_liquido` decimal(15,2) DEFAULT NULL,
  `data_credito` date DEFAULT NULL,
  `nome_operadora_recarga` varchar(50) DEFAULT NULL,
  `codigo_cliente_recarga` varchar(15) DEFAULT NULL,
  `terminal_recarga` varchar(8) DEFAULT NULL,
  `codigo_recarga` varchar(9) DEFAULT NULL,
  `numero_sequencia_registro` decimal(6,0) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_bin_mv_cv_credito_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_bin_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_bin_mv_cv_debito`
--

DROP TABLE IF EXISTS `conn_item_bin_mv_cv_debito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_bin_mv_cv_debito` (
  `item_id` int(10) unsigned NOT NULL,
  `tipo_registro` varchar(3) DEFAULT NULL,
  `codigo_cliente` varchar(8) DEFAULT NULL,
  `data_venda` date DEFAULT NULL,
  `numero_resumo_venda` varchar(15) DEFAULT NULL,
  `numero_comprovante_venda` varchar(12) DEFAULT NULL,
  `tipo_venda_comprovante` varchar(3) DEFAULT NULL,
  `bandeira_cartao` varchar(3) DEFAULT NULL,
  `numero_cartao` varchar(19) DEFAULT NULL,
  `numero_controle_cliente` varchar(20) DEFAULT NULL,
  `autorizacao` varchar(6) DEFAULT NULL,
  `horario_transacao` time DEFAULT NULL,
  `numero_terminal` varchar(8) DEFAULT NULL,
  `tipo_captura` varchar(3) DEFAULT NULL,
  `emissor_cartao` decimal(1,0) DEFAULT NULL,
  `valor_bruto` decimal(15,2) DEFAULT NULL,
  `valor_desconto` decimal(15,2) DEFAULT NULL,
  `valor_taxa_intercambio_plus` decimal(15,2) DEFAULT NULL,
  `valor_liquido` decimal(15,2) DEFAULT NULL,
  `data_credito` date DEFAULT NULL,
  `nome_operadora_recarga` varchar(50) DEFAULT NULL,
  `codigo_cliente_recarga` varchar(15) DEFAULT NULL,
  `terminal_recarga` varchar(8) DEFAULT NULL,
  `codigo_recarga` varchar(9) DEFAULT NULL,
  `valor_cashback` decimal(15,2) DEFAULT NULL,
  `intercambio_reverso` decimal(15,2) DEFAULT NULL,
  `numero_sequencia_registro` decimal(6,0) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_bin_mv_cv_debito_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_bin_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_bin_mv_header`
--

DROP TABLE IF EXISTS `conn_item_bin_mv_header`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_bin_mv_header` (
  `item_id` int(10) unsigned NOT NULL,
  `tipo_registro` varchar(3) DEFAULT NULL,
  `data_processamento` date DEFAULT NULL,
  `nome_adquirente` varchar(50) DEFAULT NULL,
  `tipo_arquivo` varchar(25) DEFAULT NULL,
  `numero_arquivo` decimal(8,0) DEFAULT NULL,
  `codigo_cliente` varchar(8) DEFAULT NULL,
  `nome_cliente` varchar(50) DEFAULT NULL,
  `tipo_processamento` varchar(15) DEFAULT NULL,
  `layout_arquivo` varchar(5) DEFAULT NULL,
  `numero_sequencia_registro` decimal(6,0) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_bin_mv_header_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_bin_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_bin_mv_header_centralizadora`
--

DROP TABLE IF EXISTS `conn_item_bin_mv_header_centralizadora`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_bin_mv_header_centralizadora` (
  `item_id` int(10) unsigned NOT NULL,
  `tipo_registro` varchar(3) DEFAULT NULL,
  `data_processamento` date DEFAULT NULL,
  `codigo_cliente` varchar(8) DEFAULT NULL,
  `nome_cliente` varchar(50) DEFAULT NULL,
  `numero_sequencia_registro` decimal(6,0) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_bin_mv_header_centralizadora_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_bin_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_bin_mv_header_matriz`
--

DROP TABLE IF EXISTS `conn_item_bin_mv_header_matriz`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_bin_mv_header_matriz` (
  `item_id` int(10) unsigned NOT NULL,
  `tipo_registro` varchar(3) DEFAULT NULL,
  `data_processamento` date DEFAULT NULL,
  `codigo_cliente` varchar(8) DEFAULT NULL,
  `nome_cliente` varchar(50) DEFAULT NULL,
  `numero_sequencia_registro` decimal(6,0) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_bin_mv_header_matriz_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_bin_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_bin_mv_header_regional`
--

DROP TABLE IF EXISTS `conn_item_bin_mv_header_regional`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_bin_mv_header_regional` (
  `item_id` int(10) unsigned NOT NULL,
  `tipo_registro` varchar(3) DEFAULT NULL,
  `data_processamento` date DEFAULT NULL,
  `codigo_cliente` varchar(8) DEFAULT NULL,
  `nome_cliente` varchar(50) DEFAULT NULL,
  `numero_sequencia_registro` decimal(6,0) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_bin_mv_header_regional_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_bin_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_bin_mv_parcelas_comprovante_venda_parcelado`
--

DROP TABLE IF EXISTS `conn_item_bin_mv_parcelas_comprovante_venda_parcelado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_bin_mv_parcelas_comprovante_venda_parcelado` (
  `item_id` int(10) unsigned NOT NULL,
  `tipo_registro` varchar(3) DEFAULT NULL,
  `codigo_cliente` varchar(8) DEFAULT NULL,
  `data_venda` date DEFAULT NULL,
  `numero_resumo_venda` varchar(15) DEFAULT NULL,
  `numero_comprovante_venda` varchar(12) DEFAULT NULL,
  `bandeira_cartao` varchar(3) DEFAULT NULL,
  `valor_liquido_venda` decimal(15,2) DEFAULT NULL,
  `parcela_comprovante` decimal(2,0) DEFAULT NULL,
  `total_parcela_comprovante` decimal(3,0) DEFAULT NULL,
  `valor_liquido_parcela` decimal(15,2) DEFAULT NULL,
  `data_credito_parcela` date DEFAULT NULL,
  `numero_sequencia_registro` decimal(6,0) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_bin_mv_parcelas_comprovante_venda_parcelado_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_bin_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_bin_mv_parcelas_rv_credito_parcelado`
--

DROP TABLE IF EXISTS `conn_item_bin_mv_parcelas_rv_credito_parcelado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_bin_mv_parcelas_rv_credito_parcelado` (
  `item_id` int(10) unsigned NOT NULL,
  `tipo_registro` varchar(3) DEFAULT NULL,
  `codigo_cliente` varchar(8) DEFAULT NULL,
  `data_venda` date DEFAULT NULL,
  `numero_resumo_venda` varchar(15) DEFAULT NULL,
  `qtde_comprovante` decimal(6,0) DEFAULT NULL,
  `bandeira_cartao` varchar(3) DEFAULT NULL,
  `valor_liquido_resumo_vendas` decimal(15,2) DEFAULT NULL,
  `parcela_resumo_vendas` decimal(2,0) DEFAULT NULL,
  `total_parcela_resumo_vendas` decimal(13,0) DEFAULT NULL,
  `valor_liquido_parcela` decimal(15,2) DEFAULT NULL,
  `data_credito_parcela` date DEFAULT NULL,
  `numero_sequencia_registro` decimal(6,0) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_bin_mv_parcelas_rv_credito_parcelado_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_bin_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_bin_mv_rv_credito`
--

DROP TABLE IF EXISTS `conn_item_bin_mv_rv_credito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_bin_mv_rv_credito` (
  `item_id` int(10) unsigned NOT NULL,
  `tipo_registro` varchar(3) DEFAULT NULL,
  `codigo_cliente` varchar(8) DEFAULT NULL,
  `data_venda` date DEFAULT NULL,
  `numero_resumo_venda` varchar(15) DEFAULT NULL,
  `qtde_comprovante` decimal(6,0) DEFAULT NULL,
  `bandeira_cartao` varchar(3) DEFAULT NULL,
  `valor_bruto` decimal(15,2) DEFAULT NULL,
  `valor_desconto` decimal(15,2) DEFAULT NULL,
  `valor_liquido` decimal(15,2) DEFAULT NULL,
  `data_credito` date DEFAULT NULL,
  `banco` varchar(3) DEFAULT NULL,
  `agencia` varchar(6) DEFAULT NULL,
  `conta_corrente` varchar(15) DEFAULT NULL,
  `numero_sequencia_registro` decimal(6,0) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_bin_mv_rv_credito_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_bin_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_bin_mv_rv_credito_parcelado`
--

DROP TABLE IF EXISTS `conn_item_bin_mv_rv_credito_parcelado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_bin_mv_rv_credito_parcelado` (
  `item_id` int(10) unsigned NOT NULL,
  `tipo_registro` varchar(3) DEFAULT NULL,
  `codigo_cliente` varchar(8) DEFAULT NULL,
  `data_venda` date DEFAULT NULL,
  `numero_resumo_venda` varchar(15) DEFAULT NULL,
  `qtde_comprovante` decimal(6,0) DEFAULT NULL,
  `bandeira_cartao` varchar(3) DEFAULT NULL,
  `valor_bruto` decimal(15,2) DEFAULT NULL,
  `valor_desconto` decimal(15,2) DEFAULT NULL,
  `valor_liquido` decimal(15,2) DEFAULT NULL,
  `numero_parcelas_resumo_vendas` decimal(6,0) DEFAULT NULL,
  `valor_primeira_parcela_resumo_vendas` decimal(15,2) DEFAULT NULL,
  `data_credito_primeira_parcela` date DEFAULT NULL,
  `banco` varchar(3) DEFAULT NULL,
  `agencia` varchar(6) DEFAULT NULL,
  `conta_corrente` varchar(15) DEFAULT NULL,
  `numero_sequencia_registro` decimal(6,0) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_bin_mv_rv_credito_parcelado_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_bin_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_bin_mv_rv_debito`
--

DROP TABLE IF EXISTS `conn_item_bin_mv_rv_debito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_bin_mv_rv_debito` (
  `item_id` int(10) unsigned NOT NULL,
  `tipo_registro` varchar(3) DEFAULT NULL,
  `codigo_cliente` varchar(8) DEFAULT NULL,
  `data_venda` date DEFAULT NULL,
  `numero_resumo_venda` varchar(15) DEFAULT NULL,
  `qtde_comprovante` decimal(6,0) DEFAULT NULL,
  `bandeira_cartao` varchar(3) DEFAULT NULL,
  `tipo_resumo_vendas` varchar(3) DEFAULT NULL,
  `valor_bruto` decimal(15,2) DEFAULT NULL,
  `valor_desconto` decimal(15,2) DEFAULT NULL,
  `valor_taxa_intercambio_plus` decimal(15,2) DEFAULT NULL,
  `valor_liquido` decimal(15,2) DEFAULT NULL,
  `data_credito` date DEFAULT NULL,
  `banco` varchar(3) DEFAULT NULL,
  `agencia` varchar(6) DEFAULT NULL,
  `conta_corrente` varchar(15) DEFAULT NULL,
  `valor_cashback` decimal(15,2) DEFAULT NULL,
  `intercambio_reverso` decimal(15,2) DEFAULT NULL,
  `numero_sequencia_registro` decimal(6,0) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_bin_mv_rv_debito_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_bin_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_bin_mv_trailer`
--

DROP TABLE IF EXISTS `conn_item_bin_mv_trailer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_bin_mv_trailer` (
  `item_id` int(10) unsigned NOT NULL,
  `tipo_registro` varchar(3) DEFAULT NULL,
  `data_processamento` date DEFAULT NULL,
  `codigo_cliente` varchar(8) DEFAULT NULL,
  `qtde_matriz` decimal(6,0) DEFAULT NULL,
  `qtde_comprovante_venda_debito` decimal(6,0) DEFAULT NULL,
  `valor_bruto_vendas_debito` decimal(15,2) DEFAULT NULL,
  `total_taxa_vendas_debito` decimal(15,2) DEFAULT NULL,
  `valor_liquido_vendas_debito` decimal(15,2) DEFAULT NULL,
  `qtde_comprovante_venda_credito` decimal(6,0) DEFAULT NULL,
  `valor_bruto_vendas_credito` decimal(15,2) DEFAULT NULL,
  `total_taxa_vendas_credito` decimal(15,2) DEFAULT NULL,
  `valor_liquido_vendas_credito` decimal(15,2) DEFAULT NULL,
  `qtde_comprovante_vendas_credito_parcelado` decimal(6,0) DEFAULT NULL,
  `valor_bruto_vendas_credito_parcelado` decimal(15,2) DEFAULT NULL,
  `total_taxa_vendas_credito_parcelado` decimal(15,2) DEFAULT NULL,
  `valor_liquido_vendas_credito_parcelado` decimal(15,2) DEFAULT NULL,
  `valor_cashback` decimal(15,2) DEFAULT NULL,
  `intercambio_reverso` decimal(15,2) DEFAULT NULL,
  `total_registros_arquivo` decimal(6,0) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_bin_mv_trailer_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_bin_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_bin_mv_trailer_centralizadora`
--

DROP TABLE IF EXISTS `conn_item_bin_mv_trailer_centralizadora`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_bin_mv_trailer_centralizadora` (
  `item_id` int(10) unsigned NOT NULL,
  `tipo_registro` varchar(3) DEFAULT NULL,
  `data_processamento` date DEFAULT NULL,
  `codigo_cliente` varchar(8) DEFAULT NULL,
  `qtde_comprovante_venda_debito` decimal(6,0) DEFAULT NULL,
  `valor_bruto_vendas_debito` decimal(15,2) DEFAULT NULL,
  `total_taxa_vendas_debito` decimal(15,2) DEFAULT NULL,
  `valor_liquido_vendas_debito` decimal(15,2) DEFAULT NULL,
  `qtde_comprovante_venda_credito` decimal(6,0) DEFAULT NULL,
  `valor_bruto_vendas_credito` decimal(15,2) DEFAULT NULL,
  `total_taxa_vendas_credito` decimal(15,2) DEFAULT NULL,
  `valor_liquido_vendas_credito` decimal(15,2) DEFAULT NULL,
  `qtde_comprovante_vendas_credito_parcelado` decimal(6,0) DEFAULT NULL,
  `valor_bruto_vendas_credito_parcelado` decimal(15,2) DEFAULT NULL,
  `total_taxa_vendas_credito_parcelado` decimal(15,2) DEFAULT NULL,
  `valor_liquido_vendas_credito_parcelado` decimal(15,2) DEFAULT NULL,
  `valor_cashback` decimal(15,2) DEFAULT NULL,
  `intercambio_reverso` decimal(15,2) DEFAULT NULL,
  `numero_sequencia_registro` decimal(6,0) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_bin_mv_trailer_centralizadora_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_bin_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_bin_mv_trailer_matriz`
--

DROP TABLE IF EXISTS `conn_item_bin_mv_trailer_matriz`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_bin_mv_trailer_matriz` (
  `item_id` int(10) unsigned NOT NULL,
  `tipo_registro` varchar(3) DEFAULT NULL,
  `data_processamento` date DEFAULT NULL,
  `codigo_cliente` varchar(8) DEFAULT NULL,
  `qtde_comprovante_venda_debito` decimal(6,0) DEFAULT NULL,
  `valor_bruto_vendas_debito` decimal(15,2) DEFAULT NULL,
  `total_taxa_vendas_debito` decimal(15,2) DEFAULT NULL,
  `valor_liquido_vendas_debito` decimal(15,2) DEFAULT NULL,
  `qtde_comprovante_venda_credito` decimal(6,0) DEFAULT NULL,
  `valor_bruto_vendas_credito` decimal(15,2) DEFAULT NULL,
  `total_taxa_vendas_credito` decimal(15,2) DEFAULT NULL,
  `valor_liquido_vendas_credito` decimal(15,2) DEFAULT NULL,
  `qtde_comprovante_vendas_credito_parcelado` decimal(6,0) DEFAULT NULL,
  `valor_bruto_vendas_credito_parcelado` decimal(15,2) DEFAULT NULL,
  `total_taxa_vendas_credito_parcelado` decimal(15,2) DEFAULT NULL,
  `valor_liquido_vendas_credito_parcelado` decimal(15,2) DEFAULT NULL,
  `valor_cashback` decimal(15,2) DEFAULT NULL,
  `intercambio_reverso` decimal(15,2) DEFAULT NULL,
  `numero_sequencia_registro` decimal(6,0) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_bin_mv_trailer_matriz_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_bin_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_bin_mv_trailer_regional`
--

DROP TABLE IF EXISTS `conn_item_bin_mv_trailer_regional`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_bin_mv_trailer_regional` (
  `item_id` int(10) unsigned NOT NULL,
  `tipo_registro` varchar(3) DEFAULT NULL,
  `data_processamento` date DEFAULT NULL,
  `codigo_cliente` varchar(8) DEFAULT NULL,
  `qtde_comprovante_venda_debito` decimal(6,0) DEFAULT NULL,
  `valor_bruto_vendas_debito` decimal(15,2) DEFAULT NULL,
  `total_taxa_vendas_debito` decimal(15,2) DEFAULT NULL,
  `valor_liquido_vendas_debito` decimal(15,2) DEFAULT NULL,
  `qtde_comprovante_venda_credito` decimal(6,0) DEFAULT NULL,
  `valor_bruto_vendas_credito` decimal(15,2) DEFAULT NULL,
  `total_taxa_vendas_credito` decimal(15,2) DEFAULT NULL,
  `valor_liquido_vendas_credito` decimal(15,2) DEFAULT NULL,
  `qtde_comprovante_vendas_credito_parcelado` decimal(6,0) DEFAULT NULL,
  `valor_bruto_vendas_credito_parcelado` decimal(15,2) DEFAULT NULL,
  `total_taxa_vendas_credito_parcelado` decimal(15,2) DEFAULT NULL,
  `valor_liquido_vendas_credito_parcelado` decimal(15,2) DEFAULT NULL,
  `valor_cashback` decimal(15,2) DEFAULT NULL,
  `intercambio_reverso` decimal(15,2) DEFAULT NULL,
  `numero_sequencia_registro` decimal(6,0) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_bin_mv_trailer_regional_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_bin_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_bin_ur_detalhe_pagamento`
--

DROP TABLE IF EXISTS `conn_item_bin_ur_detalhe_pagamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_bin_ur_detalhe_pagamento` (
  `item_id` int(10) unsigned NOT NULL,
  `tipo_registro` varchar(3) DEFAULT NULL,
  `codigo_cliente` varchar(14) DEFAULT NULL,
  `data_pagamento_original` date DEFAULT NULL,
  `valor_unidade_recebivel` decimal(15,2) DEFAULT NULL,
  `valor_desconto` decimal(15,2) DEFAULT NULL,
  `id_unidade_recebivel` varchar(50) DEFAULT NULL,
  `numero_sequencia_registro` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_bin_ur_detalhe_pagamento_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_bin_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_bin_ur_header`
--

DROP TABLE IF EXISTS `conn_item_bin_ur_header`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_bin_ur_header` (
  `item_id` int(10) unsigned NOT NULL,
  `tipo_registro` varchar(3) DEFAULT NULL,
  `data_processamento` date DEFAULT NULL,
  `hora_processamento` time DEFAULT NULL,
  `nome_adquirente` varchar(50) DEFAULT NULL,
  `tipo_arquivo` varchar(50) DEFAULT NULL,
  `numero_arquivo` decimal(20,0) DEFAULT NULL,
  `codigo_cliente` varchar(14) DEFAULT NULL,
  `nome_cliente` varchar(100) DEFAULT NULL,
  `tipo_processamento` varchar(50) DEFAULT NULL,
  `layout_arquivo` varchar(5) DEFAULT NULL,
  `numero_sequencia_registro` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_bin_ur_header_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_bin_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_bin_ur_resumo_pagamento`
--

DROP TABLE IF EXISTS `conn_item_bin_ur_resumo_pagamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_bin_ur_resumo_pagamento` (
  `item_id` int(10) unsigned NOT NULL,
  `tipo_registro` varchar(3) DEFAULT NULL,
  `codigo_cliente` varchar(14) DEFAULT NULL,
  `id_pagamento` varchar(45) DEFAULT NULL,
  `data_pagamento` date DEFAULT NULL,
  `valor_pagamento` decimal(15,2) DEFAULT NULL,
  `valor_desconto` decimal(15,2) DEFAULT NULL,
  `tipo_pagamento` varchar(20) DEFAULT NULL,
  `banco` varchar(5) DEFAULT NULL,
  `agencia` varchar(5) DEFAULT NULL,
  `digito_agencia` varchar(1) DEFAULT NULL,
  `conta_corrente` varchar(20) DEFAULT NULL,
  `digito_conta` varchar(1) DEFAULT NULL,
  `moeda` varchar(3) DEFAULT NULL,
  `numero_sequencia_registro` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_bin_ur_resumo_pagamento_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_bin_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_bin_ur_trailer`
--

DROP TABLE IF EXISTS `conn_item_bin_ur_trailer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_bin_ur_trailer` (
  `item_id` int(10) unsigned NOT NULL,
  `tipo_registro` varchar(3) DEFAULT NULL,
  `data_processamento` date DEFAULT NULL,
  `hora_processamento` time DEFAULT NULL,
  `codigo_cliente` varchar(14) DEFAULT NULL,
  `total_atribuicao` varchar(20) DEFAULT NULL,
  `soma_valor_pagamento` decimal(15,2) DEFAULT NULL,
  `soma_valor_desconto` decimal(15,2) DEFAULT NULL,
  `total_registros` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_bin_ur_trailer_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_bin_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_bin_v2_header_arquivo`
--

DROP TABLE IF EXISTS `conn_item_bin_v2_header_arquivo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_bin_v2_header_arquivo` (
  `item_id` int(10) unsigned NOT NULL,
  `tipo_registro` varchar(3) DEFAULT NULL,
  `data_processamento` date DEFAULT NULL,
  `nome_adquirente` varchar(50) DEFAULT NULL,
  `tipo_arquivo` varchar(30) DEFAULT NULL,
  `numero_arquivo` decimal(20,0) DEFAULT NULL,
  `codigo_cliente` varchar(8) DEFAULT NULL,
  `nome_cliente` varchar(50) DEFAULT NULL,
  `documento_estabelecimento` varchar(16) DEFAULT NULL,
  `tipo_processamento` varchar(15) DEFAULT NULL,
  `layout_arquivo` varchar(5) DEFAULT NULL,
  `numero_sequencia_registro` decimal(6,0) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_bin_v2_header_arquivo_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_bin_v2_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_bin_v2_line`
--

DROP TABLE IF EXISTS `conn_item_bin_v2_line`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_bin_v2_line` (
  `item_id` int(10) unsigned NOT NULL,
  `registertype` varchar(3) NOT NULL,
  `filetype` varchar(2) DEFAULT NULL,
  `masterid` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  KEY `masterid` (`masterid`),
  CONSTRAINT `conn_item_bin_v2_line_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `vooo_prod_backend`.`connection_item` (`item_id`),
  CONSTRAINT `conn_item_bin_v2_line_ibfk_2` FOREIGN KEY (`masterid`) REFERENCES `conn_item_bin_v2_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_bin_v2_mf_ajustes_programados`
--

DROP TABLE IF EXISTS `conn_item_bin_v2_mf_ajustes_programados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_bin_v2_mf_ajustes_programados` (
  `item_id` int(10) unsigned NOT NULL,
  `tipo_registro` varchar(3) DEFAULT NULL,
  `bandeira_cartao` varchar(20) DEFAULT NULL,
  `data_pagamento_ajuste` date DEFAULT NULL,
  `codigo_cliente_ajustado` varchar(8) DEFAULT NULL,
  `numero_controle_ajuste` varchar(15) DEFAULT NULL,
  `tipo_transacao_ajuste` varchar(3) DEFAULT NULL,
  `tipo_resumo_venda` varchar(20) DEFAULT NULL,
  `referencia_venda` varchar(12) DEFAULT NULL,
  `data_transacao` date DEFAULT NULL,
  `numero_parcela_cv` decimal(6,0) DEFAULT NULL,
  `total_parcelas_cv` decimal(6,0) DEFAULT NULL,
  `data_solicitacao_ajuste` date DEFAULT NULL,
  `numero_controle_cliente` varchar(20) DEFAULT NULL,
  `numero_cartao` varchar(20) DEFAULT NULL,
  `numero_referencia_conta_pgto` varchar(50) DEFAULT NULL,
  `autorizacao` varchar(6) DEFAULT NULL,
  `numero_referencia_processo` varchar(15) DEFAULT NULL,
  `tipo_ajuste` varchar(10) DEFAULT NULL,
  `valor_bruto_cv` decimal(15,2) DEFAULT NULL,
  `valor_ajustado` decimal(15,2) DEFAULT NULL,
  `valor_bruto_ajuste` decimal(15,2) DEFAULT NULL,
  `descricao_ajuste` varchar(40) DEFAULT NULL,
  `tipo_solicitacao` varchar(10) DEFAULT NULL,
  `numero_terminal` decimal(6,0) DEFAULT NULL,
  `numero_referencia_adquirente` decimal(30,0) DEFAULT NULL,
  `numero_sequencia_registro` decimal(6,0) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_bin_v2_mf_ajustes_programados_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_bin_v2_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_bin_v2_mf_cv_credito`
--

DROP TABLE IF EXISTS `conn_item_bin_v2_mf_cv_credito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_bin_v2_mf_cv_credito` (
  `item_id` int(10) unsigned NOT NULL,
  `tipo_registro` varchar(3) DEFAULT NULL,
  `bandeira_cartao` varchar(50) DEFAULT NULL,
  `data_pagamento` date DEFAULT NULL,
  `codigo_cliente` varchar(8) DEFAULT NULL,
  `codigo_estabelecimento` varchar(20) DEFAULT NULL,
  `oc_doc` varchar(20) DEFAULT NULL,
  `numero_rv` varchar(20) DEFAULT NULL,
  `qtde_comprovante` decimal(6,0) DEFAULT NULL,
  `tipo_pagamento` varchar(50) DEFAULT NULL,
  `tipo_transacao` varchar(50) DEFAULT NULL,
  `codigo_descricao_transacao` varchar(10) DEFAULT NULL,
  `descricao_transacao` varchar(50) DEFAULT NULL,
  `numero_resumo_pagamento` varchar(20) DEFAULT NULL,
  `cnpj_beneficiario_lockin` varchar(19) DEFAULT NULL,
  `tipo_lockin` varchar(20) DEFAULT NULL,
  `tipo_conta` varchar(30) DEFAULT NULL,
  `status_pagamento` varchar(20) DEFAULT NULL,
  `descricao_transacao_pagamento` varchar(50) DEFAULT NULL,
  `chargeback_comprovante` varchar(50) DEFAULT NULL,
  `referencia_venda` varchar(12) DEFAULT NULL,
  `tipo_transacao_venda` varchar(10) DEFAULT NULL,
  `data_transacao_cv` date DEFAULT NULL,
  `horario_transacao_cv` time DEFAULT NULL,
  `conta_corrente` varchar(15) DEFAULT NULL,
  `data_geracao_rp` date DEFAULT NULL,
  `data_pagamento_rp` date DEFAULT NULL,
  `numero_controle_cliente` varchar(20) DEFAULT NULL,
  `numero_cartao` varchar(19) DEFAULT NULL,
  `numero_referencia_conta_pgto` varchar(50) DEFAULT NULL,
  `autorizacao` varchar(6) DEFAULT NULL,
  `numero_cv` varchar(12) DEFAULT NULL,
  `tipo_comprovante` varchar(50) DEFAULT NULL,
  `valor_bruto_cv` decimal(15,2) DEFAULT NULL,
  `valor_taxa_cv` decimal(15,2) DEFAULT NULL,
  `valor_liquido_cv` decimal(15,2) DEFAULT NULL,
  `valor_taxa_antecipacao_cv` decimal(15,2) DEFAULT NULL,
  `valor_liquido_antecipado` decimal(15,2) DEFAULT NULL,
  `numero_referencia_adquirente` decimal(30,0) DEFAULT NULL,
  `id_cancelamento` decimal(30,0) DEFAULT NULL,
  `numero_sequencia_registro` decimal(6,0) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_bin_v2_mf_cv_credito_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_bin_v2_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_bin_v2_mf_cv_debito`
--

DROP TABLE IF EXISTS `conn_item_bin_v2_mf_cv_debito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_bin_v2_mf_cv_debito` (
  `item_id` int(10) unsigned NOT NULL,
  `tipo_registro` varchar(3) DEFAULT NULL,
  `bandeira_cartao` varchar(50) DEFAULT NULL,
  `data_pagamento` date DEFAULT NULL,
  `codigo_cliente` varchar(8) DEFAULT NULL,
  `codigo_estabelecimento` varchar(20) DEFAULT NULL,
  `oc_doc` varchar(20) DEFAULT NULL,
  `numero_rv` varchar(20) DEFAULT NULL,
  `qtde_comprovante` decimal(6,0) DEFAULT NULL,
  `tipo_pagamento` varchar(50) DEFAULT NULL,
  `tipo_transacao` varchar(50) DEFAULT NULL,
  `codigo_descricao_transacao` varchar(10) DEFAULT NULL,
  `descricao_transacao` varchar(50) DEFAULT NULL,
  `numero_resumo_pagamento` varchar(20) DEFAULT NULL,
  `cnpj_beneficiario_lockin` varchar(19) DEFAULT NULL,
  `tipo_lockin` varchar(20) DEFAULT NULL,
  `tipo_conta` varchar(30) DEFAULT NULL,
  `status_pagamento` varchar(20) DEFAULT NULL,
  `descricao_transacao_pagamento` varchar(50) DEFAULT NULL,
  `chargeback_comprovante` varchar(50) DEFAULT NULL,
  `referencia_venda` varchar(12) DEFAULT NULL,
  `data_transacao_cv` date DEFAULT NULL,
  `horario_transacao_cv` time DEFAULT NULL,
  `conta_corrente` varchar(15) DEFAULT NULL,
  `data_geracao_rp` date DEFAULT NULL,
  `data_pagamento_rp` date DEFAULT NULL,
  `numero_controle_cliente` varchar(20) DEFAULT NULL,
  `numero_cartao` varchar(19) DEFAULT NULL,
  `autorizacao` varchar(6) DEFAULT NULL,
  `numero_cv` varchar(12) DEFAULT NULL,
  `tipo_comprovante` varchar(50) DEFAULT NULL,
  `valor_bruto_cv` decimal(15,2) DEFAULT NULL,
  `valor_taxa_cv` decimal(15,2) DEFAULT NULL,
  `valor_liquido_cv` decimal(15,2) DEFAULT NULL,
  `valor_taxa_antecipacao_cv` decimal(15,2) DEFAULT NULL,
  `valor_liquido_antecipado` decimal(15,2) DEFAULT NULL,
  `valor_cashback` decimal(15,2) DEFAULT NULL,
  `intercambio_reverso` decimal(15,2) DEFAULT NULL,
  `numero_referencia_adquirente` decimal(30,0) DEFAULT NULL,
  `numero_sequencia_registro` decimal(6,0) DEFAULT NULL,
  `id_cancelamento` decimal(30,0) DEFAULT NULL,
  `numero_referencia_pagamento` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_bin_v2_mf_cv_debito_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_bin_v2_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_bin_v2_mf_cv_parcelado`
--

DROP TABLE IF EXISTS `conn_item_bin_v2_mf_cv_parcelado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_bin_v2_mf_cv_parcelado` (
  `item_id` int(10) unsigned NOT NULL,
  `tipo_registro` varchar(3) DEFAULT NULL,
  `bandeira_cartao` varchar(50) DEFAULT NULL,
  `data_pagamento` date DEFAULT NULL,
  `codigo_cliente` varchar(8) DEFAULT NULL,
  `codigo_estabelecimento` varchar(20) DEFAULT NULL,
  `oc_doc` varchar(20) DEFAULT NULL,
  `numero_rv` varchar(20) DEFAULT NULL,
  `qtde_comprovante` decimal(6,0) DEFAULT NULL,
  `tipo_pagamento` varchar(50) DEFAULT NULL,
  `tipo_transacao` varchar(50) DEFAULT NULL,
  `codigo_descricao_transacao` varchar(10) DEFAULT NULL,
  `descricao_transacao` varchar(50) DEFAULT NULL,
  `numero_resumo_pagamento` varchar(20) DEFAULT NULL,
  `cnpj_beneficiario_lockin` varchar(19) DEFAULT NULL,
  `tipo_lockin` varchar(20) DEFAULT NULL,
  `tipo_conta` varchar(30) DEFAULT NULL,
  `status_pagamento` varchar(20) DEFAULT NULL,
  `descricao_transacao_pagamento` varchar(50) DEFAULT NULL,
  `chargeback_comprovante` varchar(50) DEFAULT NULL,
  `referencia_venda` varchar(12) DEFAULT NULL,
  `tipo_transacao_venda` varchar(10) DEFAULT NULL,
  `data_transacao_cv` date DEFAULT NULL,
  `horario_transacao_cv` time DEFAULT NULL,
  `numero_parcela_cv` decimal(6,0) DEFAULT NULL,
  `total_parcelas_cv` decimal(6,0) DEFAULT NULL,
  `conta_corrente` varchar(15) DEFAULT NULL,
  `data_geracao_rp` date DEFAULT NULL,
  `data_pagamento_rp` date DEFAULT NULL,
  `numero_controle_cliente` varchar(20) DEFAULT NULL,
  `numero_cartao` varchar(19) DEFAULT NULL,
  `numero_referencia_conta_pgto` varchar(50) DEFAULT NULL,
  `autorizacao` varchar(6) DEFAULT NULL,
  `numero_cv` varchar(12) DEFAULT NULL,
  `tipo_comprovante` varchar(50) DEFAULT NULL,
  `valor_bruto_cv` decimal(15,2) DEFAULT NULL,
  `valor_taxa_cv` decimal(15,2) DEFAULT NULL,
  `valor_liquido_cv` decimal(15,2) DEFAULT NULL,
  `valor_taxa_antecipacao_cv` decimal(15,2) DEFAULT NULL,
  `valor_liquido_antecipado` decimal(15,2) DEFAULT NULL,
  `numero_referencia_adquirente` decimal(30,0) DEFAULT NULL,
  `numero_sequencia_registro` decimal(6,0) DEFAULT NULL,
  `id_cancelamento` decimal(30,0) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_bin_v2_mf_cv_parcelado_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_bin_v2_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_bin_v2_mf_detalhe_transferencia_entre_contas`
--

DROP TABLE IF EXISTS `conn_item_bin_v2_mf_detalhe_transferencia_entre_contas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_bin_v2_mf_detalhe_transferencia_entre_contas` (
  `item_id` int(10) unsigned NOT NULL,
  `tipo_registro` varchar(3) DEFAULT NULL,
  `bandeira_cartao` varchar(50) DEFAULT NULL,
  `tipo_cartao` varchar(10) DEFAULT NULL,
  `data_pagamento` date DEFAULT NULL,
  `codigo_cliente` varchar(8) DEFAULT NULL,
  `codigo_estabelecimento` varchar(20) DEFAULT NULL,
  `numero_rv` varchar(20) DEFAULT NULL,
  `qtde_comprovante` decimal(6,0) DEFAULT NULL,
  `conta_corrente` varchar(15) DEFAULT NULL,
  `data_geracao_rv` date DEFAULT NULL,
  `data_pagamento_rv` date DEFAULT NULL,
  `tipo_pagamento` varchar(50) DEFAULT NULL,
  `descricao_transacao` varchar(50) DEFAULT NULL,
  `tipo_transacao` varchar(15) DEFAULT NULL,
  `numero_resumo_pagamento` varchar(20) DEFAULT NULL,
  `tipo_transacao_pagamento` varchar(20) DEFAULT NULL,
  `tipo_conta` varchar(20) DEFAULT NULL,
  `status_pagamento_invoice` varchar(30) DEFAULT NULL,
  `data_transacao_cv` date DEFAULT NULL,
  `horario_transacao_cv` time DEFAULT NULL,
  `referencia_venda` varchar(12) DEFAULT NULL,
  `numero_controle_cliente` varchar(20) DEFAULT NULL,
  `numero_parcela_cv` decimal(6,0) DEFAULT NULL,
  `total_parcelas_cv` decimal(6,0) DEFAULT NULL,
  `numero_cartao` varchar(19) DEFAULT NULL,
  `autorizacao` varchar(6) DEFAULT NULL,
  `numero_cv` varchar(12) DEFAULT NULL,
  `tipo_comprovante` varchar(50) DEFAULT NULL,
  `valor_bruto_cv` decimal(15,2) DEFAULT NULL,
  `valor_taxa_cv` decimal(15,2) DEFAULT NULL,
  `valor_liquido_cv` decimal(15,2) DEFAULT NULL,
  `valor_taxa_antecipacao_cv` decimal(15,2) DEFAULT NULL,
  `valor_liquido_antecipado` decimal(15,2) DEFAULT NULL,
  `numero_terminal` varchar(10) DEFAULT NULL,
  `numero_referencia_adquirente` decimal(30,0) DEFAULT NULL,
  `numero_sequencia_registro` decimal(6,0) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_bin_v2_mf_detalhe_transferencia_entre_contas_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_bin_v2_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_bin_v2_mf_detalhe_ur_antecipacao`
--

DROP TABLE IF EXISTS `conn_item_bin_v2_mf_detalhe_ur_antecipacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_bin_v2_mf_detalhe_ur_antecipacao` (
  `item_id` int(10) unsigned NOT NULL,
  `tipo_registro` varchar(3) DEFAULT NULL,
  `documento_cliente` varchar(20) DEFAULT NULL,
  `data_pagamento_original` date DEFAULT NULL,
  `valor_unidade_recebivel` decimal(15,2) DEFAULT NULL,
  `valor_desconto` decimal(15,2) DEFAULT NULL,
  `id_recebivel` varchar(20) DEFAULT NULL,
  `nome_credenciadora` varchar(50) DEFAULT NULL,
  `documento_credenciadora` varchar(20) DEFAULT NULL,
  `numero_sequencia_registro` decimal(6,0) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_bin_v2_mf_detalhe_ur_antecipacao_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_bin_v2_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_bin_v2_mf_header_matriz`
--

DROP TABLE IF EXISTS `conn_item_bin_v2_mf_header_matriz`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_bin_v2_mf_header_matriz` (
  `item_id` int(10) unsigned NOT NULL,
  `tipo_registro` varchar(3) DEFAULT NULL,
  `data_processamento` date DEFAULT NULL,
  `codigo_cliente_matriz` varchar(8) DEFAULT NULL,
  `nome_cliente_matriz` varchar(50) DEFAULT NULL,
  `codigo_cliente_filial` varchar(20) DEFAULT NULL,
  `nome_cliente_filial` varchar(50) DEFAULT NULL,
  `documento_cliente` varchar(20) DEFAULT NULL,
  `numero_sequencia_registro` decimal(6,0) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_bin_v2_mf_header_matriz_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_bin_v2_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_bin_v2_mf_pagamentos_valores_suspensos`
--

DROP TABLE IF EXISTS `conn_item_bin_v2_mf_pagamentos_valores_suspensos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_bin_v2_mf_pagamentos_valores_suspensos` (
  `item_id` int(10) unsigned NOT NULL,
  `tipo_registro` varchar(3) DEFAULT NULL,
  `codigo_cliente` varchar(8) DEFAULT NULL,
  `data_pagamento` date DEFAULT NULL,
  `transacao_pagamento` varchar(20) DEFAULT NULL,
  `descricao_tipo_transacao` varchar(50) DEFAULT NULL,
  `descricao_rv` varchar(50) DEFAULT NULL,
  `qtde_cv` decimal(6,0) DEFAULT NULL,
  `tipo_pagamento` varchar(20) DEFAULT NULL,
  `transacao_referencia_hold` varchar(50) DEFAULT NULL,
  `comprovante_referencia` varchar(50) DEFAULT NULL,
  `referencia_venda` varchar(20) DEFAULT NULL,
  `status_pagamento` varchar(10) DEFAULT NULL,
  `descricao_tipo_pagamento` varchar(50) DEFAULT NULL,
  `data_geracao_rv` date DEFAULT NULL,
  `data_pagamento_rv` date DEFAULT NULL,
  `tipo_cartao` varchar(10) DEFAULT NULL,
  `valor_liquido` decimal(15,2) DEFAULT NULL,
  `data_origem_pagamento` date DEFAULT NULL,
  `numero_parcela` decimal(6,0) DEFAULT NULL,
  `total_parcelas` decimal(6,0) DEFAULT NULL,
  `numero_referencia_adquirente` decimal(30,0) DEFAULT NULL,
  `numero_sequencia_registro` decimal(6,0) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_bin_v2_mf_pagamentos_valores_suspensos_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_bin_v2_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_bin_v2_mf_resumo_pagamento_antecipacao`
--

DROP TABLE IF EXISTS `conn_item_bin_v2_mf_resumo_pagamento_antecipacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_bin_v2_mf_resumo_pagamento_antecipacao` (
  `item_id` int(10) unsigned NOT NULL,
  `tipo_registro` varchar(3) DEFAULT NULL,
  `documento_cliente` varchar(20) DEFAULT NULL,
  `oc_doc` varchar(20) DEFAULT NULL,
  `data_pagamento` date DEFAULT NULL,
  `valor_pagamento` decimal(15,2) DEFAULT NULL,
  `valor_desconto` decimal(15,2) DEFAULT NULL,
  `bandeira_cartao` varchar(15) DEFAULT NULL,
  `banco` varchar(3) DEFAULT NULL,
  `agencia` varchar(6) DEFAULT NULL,
  `digito_agencia` varchar(1) DEFAULT NULL,
  `conta_corrente` varchar(15) DEFAULT NULL,
  `digito_conta` varchar(1) DEFAULT NULL,
  `moeda` varchar(20) DEFAULT NULL,
  `prazo_medio` decimal(10,0) DEFAULT NULL,
  `taxa_nominal_antecipacao` decimal(15,2) DEFAULT NULL,
  `numero_sequencia_registro` decimal(6,0) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_bin_v2_mf_resumo_pagamento_antecipacao_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_bin_v2_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_bin_v2_mf_resumo_transferencia_entre_contas`
--

DROP TABLE IF EXISTS `conn_item_bin_v2_mf_resumo_transferencia_entre_contas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_bin_v2_mf_resumo_transferencia_entre_contas` (
  `item_id` int(10) unsigned NOT NULL,
  `tipo_registro` varchar(3) DEFAULT NULL,
  `bandeira_cartao` varchar(50) DEFAULT NULL,
  `tipo_cartao` varchar(13) DEFAULT NULL,
  `data_pagamento` date DEFAULT NULL,
  `codigo_cliente` varchar(8) DEFAULT NULL,
  `codigo_estabelecimento` varchar(20) DEFAULT NULL,
  `numero_resumo_pagamento` varchar(20) DEFAULT NULL,
  `tipo_comprovante` varchar(50) DEFAULT NULL,
  `valor_a_pagar` decimal(15,2) DEFAULT NULL,
  `descricao_pagamento` varchar(50) DEFAULT NULL,
  `numero_sequencia_registro` decimal(6,0) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_bin_v2_mf_resumo_transferencia_entre_contas_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_bin_v2_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_bin_v2_mf_rv_credito`
--

DROP TABLE IF EXISTS `conn_item_bin_v2_mf_rv_credito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_bin_v2_mf_rv_credito` (
  `item_id` int(10) unsigned NOT NULL,
  `tipo_registro` varchar(3) DEFAULT NULL,
  `bandeira_cartao` varchar(50) DEFAULT NULL,
  `data_pagamento` date DEFAULT NULL,
  `codigo_cliente` varchar(8) DEFAULT NULL,
  `codigo_estabelecimento` varchar(20) DEFAULT NULL,
  `oc_doc` varchar(20) DEFAULT NULL,
  `valor_pagamento` decimal(15,2) DEFAULT NULL,
  `banco` varchar(3) DEFAULT NULL,
  `agencia` varchar(6) DEFAULT NULL,
  `tipo_conta` varchar(50) DEFAULT NULL,
  `conta_corrente` varchar(15) DEFAULT NULL,
  `data_geracao_transacao` date DEFAULT NULL,
  `qtde_rv` decimal(6,0) DEFAULT NULL,
  `numero_sequencia_registro` decimal(6,0) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_bin_v2_mf_rv_credito_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_bin_v2_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_bin_v2_mf_rv_debito`
--

DROP TABLE IF EXISTS `conn_item_bin_v2_mf_rv_debito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_bin_v2_mf_rv_debito` (
  `item_id` int(10) unsigned NOT NULL,
  `tipo_registro` varchar(3) DEFAULT NULL,
  `bandeira` varchar(50) DEFAULT NULL,
  `data_pagamento` date DEFAULT NULL,
  `codigo_cliente` varchar(8) DEFAULT NULL,
  `codigo_estabelecimento` varchar(20) DEFAULT NULL,
  `oc_doc` varchar(20) DEFAULT NULL,
  `valor_pagamento` decimal(15,2) DEFAULT NULL,
  `banco` varchar(3) DEFAULT NULL,
  `agencia` varchar(6) DEFAULT NULL,
  `tipo_conta` varchar(50) DEFAULT NULL,
  `conta_corrente` varchar(15) DEFAULT NULL,
  `data_geracao_transacao` date DEFAULT NULL,
  `qtde_rv` decimal(6,0) DEFAULT NULL,
  `valor_cashback` decimal(15,2) DEFAULT NULL,
  `intercambio_reverso` decimal(15,2) DEFAULT NULL,
  `numero_sequencia_registro` decimal(6,0) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_bin_v2_mf_rv_debito_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_bin_v2_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_bin_v2_mf_rv_parcelado`
--

DROP TABLE IF EXISTS `conn_item_bin_v2_mf_rv_parcelado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_bin_v2_mf_rv_parcelado` (
  `item_id` int(10) unsigned NOT NULL,
  `tipo_registro` varchar(3) DEFAULT NULL,
  `bandeira_cartao` varchar(50) DEFAULT NULL,
  `data_pagamento` date DEFAULT NULL,
  `codigo_cliente` varchar(8) DEFAULT NULL,
  `codigo_estabelecimento` varchar(8) DEFAULT NULL,
  `oc_doc` varchar(20) DEFAULT NULL,
  `valor_pagamento` decimal(15,2) DEFAULT NULL,
  `banco` varchar(3) DEFAULT NULL,
  `agencia` varchar(6) DEFAULT NULL,
  `tipo_conta` varchar(50) DEFAULT NULL,
  `conta_corrente` varchar(15) DEFAULT NULL,
  `data_geracao_transacao` date DEFAULT NULL,
  `qtde_rv` decimal(6,0) DEFAULT NULL,
  `numero_sequencia_registro` decimal(6,0) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_bin_v2_mf_rv_parcelado_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_bin_v2_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_bin_v2_mf_solicitacao_comprovante_chargeback`
--

DROP TABLE IF EXISTS `conn_item_bin_v2_mf_solicitacao_comprovante_chargeback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_bin_v2_mf_solicitacao_comprovante_chargeback` (
  `item_id` int(10) unsigned NOT NULL,
  `tipo_registro` varchar(3) DEFAULT NULL,
  `bandeira_cartao` varchar(50) DEFAULT NULL,
  `codigo_cliente_ajustado` varchar(8) DEFAULT NULL,
  `tipo_transacao` varchar(20) DEFAULT NULL,
  `descricao_transacao` varchar(50) DEFAULT NULL,
  `descricao_transacao_pagamento` varchar(50) DEFAULT NULL,
  `chargeback_comprovante` varchar(50) DEFAULT NULL,
  `referencia_venda` varchar(12) DEFAULT NULL,
  `data_transacao_cv` date DEFAULT NULL,
  `data_geracao_rv` date DEFAULT NULL,
  `numero_controle_cliente` varchar(20) DEFAULT NULL,
  `numero_cartao` varchar(19) DEFAULT NULL,
  `autorizacao` varchar(6) DEFAULT NULL,
  `numero_cv` varchar(12) DEFAULT NULL,
  `valor_bruto_cv` decimal(15,2) DEFAULT NULL,
  `codigo_motivo_chargeback` varchar(5) DEFAULT NULL,
  `numero_referencia_adquirente` decimal(30,0) DEFAULT NULL,
  `numero_sequencia_registro` decimal(6,0) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_bin_v2_mf_solicitacao_comprovante_chargeback_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_bin_v2_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_bin_v2_mf_trailer`
--

DROP TABLE IF EXISTS `conn_item_bin_v2_mf_trailer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_bin_v2_mf_trailer` (
  `item_id` int(10) unsigned NOT NULL,
  `tipo_registro` varchar(3) DEFAULT NULL,
  `codigo_cliente` varchar(8) DEFAULT NULL,
  `qtde_rv_debito` decimal(6,0) DEFAULT NULL,
  `valor_bruto_debito_mastercard` decimal(15,2) DEFAULT NULL,
  `valor_bruto_debito_visa` decimal(15,2) DEFAULT NULL,
  `valor_bruto_debito_cabal` decimal(15,2) DEFAULT NULL,
  `valor_bruto_debito_elo` decimal(15,2) DEFAULT NULL,
  `valor_bruto_debito_hipercard` decimal(15,2) DEFAULT NULL,
  `valor_liquido_debito` decimal(15,2) DEFAULT NULL,
  `qtde_rv_credito` decimal(6,0) DEFAULT NULL,
  `qtde_rv_credito_parcelado` decimal(6,0) DEFAULT NULL,
  `valor_bruto_credito_mastercard` decimal(15,2) DEFAULT NULL,
  `valor_bruto_credito_visa` decimal(15,2) DEFAULT NULL,
  `valor_bruto_credito_cabal` decimal(15,2) DEFAULT NULL,
  `valor_bruto_credito_elo` decimal(15,2) DEFAULT NULL,
  `valor_bruto_credito_hipercard` decimal(15,2) DEFAULT NULL,
  `valor_bruto_credito_amex` decimal(15,2) DEFAULT NULL,
  `valor_liquido_credito` decimal(15,2) DEFAULT NULL,
  `qtde_rv_antecipacao` decimal(6,0) DEFAULT NULL,
  `valor_antecipado` decimal(15,2) DEFAULT NULL,
  `qtde_ajustes_realizados` decimal(6,0) DEFAULT NULL,
  `sinal_ajuste_realizado` varchar(10) DEFAULT NULL,
  `valor_ajustes_realizados` decimal(15,2) DEFAULT NULL,
  `qtde_ajustes_programados` decimal(6,0) DEFAULT NULL,
  `valor_ajustes_programados` decimal(15,2) DEFAULT NULL,
  `valor_liquido_arquivo` decimal(15,2) DEFAULT NULL,
  `valor_cashback` decimal(15,2) DEFAULT NULL,
  `valor_intercambio_reverso` decimal(15,2) DEFAULT NULL,
  `numero_sequencia_registro` decimal(6,0) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_bin_v2_mf_trailer_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_bin_v2_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_bin_v2_mf_trailer_antecipacao`
--

DROP TABLE IF EXISTS `conn_item_bin_v2_mf_trailer_antecipacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_bin_v2_mf_trailer_antecipacao` (
  `item_id` int(10) unsigned NOT NULL,
  `tipo_registro` varchar(3) DEFAULT NULL,
  `data_processamento` date DEFAULT NULL,
  `codigo_cliente` varchar(8) DEFAULT NULL,
  `assignment` decimal(10,0) DEFAULT NULL,
  `total_valor_pagamento` decimal(13,2) DEFAULT NULL,
  `total_valor_desconto` decimal(13,2) DEFAULT NULL,
  `numero_sequencia_registro` decimal(6,0) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_bin_v2_mf_trailer_antecipacao_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_bin_v2_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_bin_v2_mf_trailer_matriz`
--

DROP TABLE IF EXISTS `conn_item_bin_v2_mf_trailer_matriz`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_bin_v2_mf_trailer_matriz` (
  `item_id` int(10) unsigned NOT NULL,
  `tipo_registro` varchar(3) DEFAULT NULL,
  `codigo_cliente_matriz` varchar(8) DEFAULT NULL,
  `codigo_cliente_filial` varchar(8) DEFAULT NULL,
  `qtde_rv_debito` decimal(6,0) DEFAULT NULL,
  `valor_bruto_debito_mastercard` decimal(15,2) DEFAULT NULL,
  `valor_bruto_debito_visa` decimal(15,2) DEFAULT NULL,
  `valor_bruto_debito_cabal` decimal(15,2) DEFAULT NULL,
  `valor_bruto_debito_elo` decimal(15,2) DEFAULT NULL,
  `valor_bruto_debito_hipercard` decimal(15,2) DEFAULT NULL,
  `valor_liquido_debito` decimal(15,2) DEFAULT NULL,
  `qtde_rv_credito` decimal(6,0) DEFAULT NULL,
  `qtde_rv_credito_parcelado` decimal(6,0) DEFAULT NULL,
  `valor_bruto_credito_mastercard` decimal(15,2) DEFAULT NULL,
  `valor_bruto_credito_visa` decimal(15,2) DEFAULT NULL,
  `valor_bruto_credito_cabal` decimal(15,2) DEFAULT NULL,
  `valor_bruto_credito_elo` decimal(15,2) DEFAULT NULL,
  `valor_bruto_credito_hipercard` decimal(15,2) DEFAULT NULL,
  `valor_bruto_credito_amex` decimal(15,2) DEFAULT NULL,
  `valor_liquido_credito` decimal(15,2) DEFAULT NULL,
  `qtde_rv_antecipacao` decimal(6,0) DEFAULT NULL,
  `valor_antecipado` decimal(15,2) DEFAULT NULL,
  `qtde_ajustes_realizados` decimal(6,0) DEFAULT NULL,
  `sinal_ajuste_realizado` varchar(10) DEFAULT NULL,
  `valor_ajustes_realizados` decimal(15,2) DEFAULT NULL,
  `qtde_ajustes_programados` decimal(6,0) DEFAULT NULL,
  `valor_ajustes_programados` decimal(15,2) DEFAULT NULL,
  `valor_liquido_arquivo` decimal(15,2) DEFAULT NULL,
  `valor_cashback` decimal(15,2) DEFAULT NULL,
  `valor_intercambio_reverso` decimal(15,2) DEFAULT NULL,
  `numero_sequencia_registro` decimal(6,0) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_bin_v2_mf_trailer_matriz_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_bin_v2_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_bin_v2_mv_cv_aceleracao`
--

DROP TABLE IF EXISTS `conn_item_bin_v2_mv_cv_aceleracao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_bin_v2_mv_cv_aceleracao` (
  `item_id` int(10) unsigned NOT NULL,
  `tipo_registro` varchar(3) DEFAULT NULL,
  `codigo_cliente_matriz` varchar(8) DEFAULT NULL,
  `codigo_cliente` varchar(8) DEFAULT NULL,
  `data_venda` date DEFAULT NULL,
  `numero_rv` varchar(15) DEFAULT NULL,
  `numero_cv` varchar(12) DEFAULT NULL,
  `bandeira_cartao` varchar(50) DEFAULT NULL,
  `tipo_venda_comprovante` varchar(50) DEFAULT NULL,
  `entry_mode` varchar(50) DEFAULT NULL,
  `tipo_cartao` varchar(50) DEFAULT NULL,
  `valor_bruto` decimal(15,2) DEFAULT NULL,
  `valor_desconto` decimal(15,2) DEFAULT NULL,
  `valor_liquido` decimal(15,2) DEFAULT NULL,
  `data_credito` date DEFAULT NULL,
  `numero_controle_cliente` varchar(20) DEFAULT NULL,
  `numero_cv_parcela` varchar(12) DEFAULT NULL,
  `numero_da_parcela_cv` decimal(13,0) DEFAULT NULL,
  `total_parcelas_cv` decimal(13,0) DEFAULT NULL,
  `numero_referencia_adquirente` decimal(30,0) DEFAULT NULL,
  `numero_sequencia_registro` decimal(6,0) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_bin_v2_mv_cv_aceleracao_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_bin_v2_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_bin_v2_mv_cv_credito`
--

DROP TABLE IF EXISTS `conn_item_bin_v2_mv_cv_credito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_bin_v2_mv_cv_credito` (
  `item_id` int(10) unsigned NOT NULL,
  `tipo_registro` varchar(3) DEFAULT NULL,
  `codigo_cliente` varchar(8) DEFAULT NULL,
  `data_venda` date DEFAULT NULL,
  `numero_rv` varchar(15) DEFAULT NULL,
  `numero_cv` varchar(12) DEFAULT NULL,
  `bandeira_cartao` varchar(50) DEFAULT NULL,
  `tipo_venda_comprovante` varchar(50) DEFAULT NULL,
  `numero_cartao` varchar(19) DEFAULT NULL,
  `numero_referencia_conta_pgto` varchar(50) DEFAULT NULL,
  `numero_controle_cliente` varchar(20) DEFAULT NULL,
  `autorizacao` varchar(6) DEFAULT NULL,
  `horario_transacao` time DEFAULT NULL,
  `numero_terminal` varchar(8) DEFAULT NULL,
  `tipo_captura` varchar(50) DEFAULT NULL,
  `entry_mode` varchar(50) DEFAULT NULL,
  `emissor_cartao` decimal(1,0) DEFAULT NULL,
  `tipo_cartao` varchar(50) DEFAULT NULL,
  `valor_bruto` decimal(15,2) DEFAULT NULL,
  `valor_desconto` decimal(15,2) DEFAULT NULL,
  `valor_taxa_intercambio_plus` decimal(15,2) DEFAULT NULL,
  `valor_liquido` decimal(15,2) DEFAULT NULL,
  `data_credito` date DEFAULT NULL,
  `nome_operadora_recarga` varchar(50) DEFAULT NULL,
  `codigo_cliente_recarga` varchar(15) DEFAULT NULL,
  `terminal_recarga` varchar(8) DEFAULT NULL,
  `codigo_recarga` varchar(9) DEFAULT NULL,
  `taxa_percentual` decimal(15,2) DEFAULT NULL,
  `valor_base` decimal(15,2) DEFAULT NULL,
  `valor_minimo_taxa` decimal(15,2) DEFAULT NULL,
  `valor_maximo_taxa` decimal(15,2) DEFAULT NULL,
  `numero_referencia_adquirente` decimal(30,0) DEFAULT NULL,
  `numero_sequencia_registro` decimal(6,0) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_bin_v2_mv_cv_credito_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_bin_v2_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_bin_v2_mv_cv_debito`
--

DROP TABLE IF EXISTS `conn_item_bin_v2_mv_cv_debito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_bin_v2_mv_cv_debito` (
  `item_id` int(10) unsigned NOT NULL,
  `tipo_registro` varchar(3) DEFAULT NULL,
  `codigo_cliente` varchar(8) DEFAULT NULL,
  `data_venda` date DEFAULT NULL,
  `numero_rv` varchar(15) DEFAULT NULL,
  `numero_cv` varchar(12) DEFAULT NULL,
  `bandeira_cartao` varchar(50) DEFAULT NULL,
  `tipo_venda_comprovante` varchar(50) DEFAULT NULL,
  `numero_cartao` varchar(19) DEFAULT NULL,
  `numero_referencia_conta_pgto` varchar(50) DEFAULT NULL,
  `numero_controle_cliente` varchar(20) DEFAULT NULL,
  `autorizacao` varchar(6) DEFAULT NULL,
  `horario_transacao` time DEFAULT NULL,
  `numero_terminal` varchar(8) DEFAULT NULL,
  `tipo_captura` varchar(50) DEFAULT NULL,
  `entry_mode` varchar(50) DEFAULT NULL,
  `emissor_cartao` decimal(1,0) DEFAULT NULL,
  `tipo_cartao` varchar(50) DEFAULT NULL,
  `valor_bruto` decimal(15,2) DEFAULT NULL,
  `valor_desconto` decimal(15,2) DEFAULT NULL,
  `valor_taxa_intercambio_plus` decimal(15,2) DEFAULT NULL,
  `valor_liquido` decimal(15,2) DEFAULT NULL,
  `data_credito` date DEFAULT NULL,
  `nome_operadora_recarga` varchar(50) DEFAULT NULL,
  `codigo_cliente_recarga` varchar(15) DEFAULT NULL,
  `terminal_recarga` varchar(8) DEFAULT NULL,
  `codigo_recarga` varchar(9) DEFAULT NULL,
  `valor_cashback` decimal(15,2) DEFAULT NULL,
  `intercambio_reverso` decimal(15,2) DEFAULT NULL,
  `taxa_percentual` decimal(15,2) DEFAULT NULL,
  `valor_base` decimal(15,2) DEFAULT NULL,
  `valor_minimo_taxa` decimal(15,2) DEFAULT NULL,
  `valor_maximo_taxa` decimal(15,2) DEFAULT NULL,
  `numero_referencia_adquirente` decimal(30,0) DEFAULT NULL,
  `numero_sequencia_registro` decimal(6,0) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_bin_v2_mv_cv_debito_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_bin_v2_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_bin_v2_mv_cv_parcelado`
--

DROP TABLE IF EXISTS `conn_item_bin_v2_mv_cv_parcelado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_bin_v2_mv_cv_parcelado` (
  `item_id` int(10) unsigned NOT NULL,
  `tipo_registro` varchar(3) DEFAULT NULL,
  `codigo_cliente` varchar(8) DEFAULT NULL,
  `data_venda` date DEFAULT NULL,
  `numero_rv` varchar(15) DEFAULT NULL,
  `numero_cv` varchar(12) DEFAULT NULL,
  `bandeira_cartao` varchar(50) DEFAULT NULL,
  `tipo_venda_comprovante` varchar(50) DEFAULT NULL,
  `valor_desconto` decimal(15,2) DEFAULT NULL,
  `valor_liquido_parcela` decimal(15,2) DEFAULT NULL,
  `valor_liquido_compra` decimal(15,2) DEFAULT NULL,
  `data_credito` date DEFAULT NULL,
  `numero_cv_parcela` varchar(12) DEFAULT NULL,
  `numero_da_parcela_cv` decimal(10,0) DEFAULT NULL,
  `total_parcelas_cv` decimal(10,0) DEFAULT NULL,
  `numero_referencia_adquirente` decimal(30,0) DEFAULT NULL,
  `numero_sequencia_registro` decimal(6,0) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_bin_v2_mv_cv_parcelado_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_bin_v2_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_bin_v2_mv_header_matriz`
--

DROP TABLE IF EXISTS `conn_item_bin_v2_mv_header_matriz`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_bin_v2_mv_header_matriz` (
  `item_id` int(10) unsigned NOT NULL,
  `tipo_registro` varchar(3) DEFAULT NULL,
  `data_processamento` date DEFAULT NULL,
  `codigo_cliente_matriz` varchar(8) DEFAULT NULL,
  `nome_cliente_matriz` varchar(50) DEFAULT NULL,
  `documento_cliente` varchar(16) DEFAULT NULL,
  `codigo_cliente_filial` varchar(8) DEFAULT NULL,
  `nome_cliente_filial` varchar(50) DEFAULT NULL,
  `numero_sequencia_registro` decimal(6,0) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_bin_v2_mv_header_matriz_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_bin_v2_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_bin_v2_mv_rv_aceleracao`
--

DROP TABLE IF EXISTS `conn_item_bin_v2_mv_rv_aceleracao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_bin_v2_mv_rv_aceleracao` (
  `item_id` int(10) unsigned NOT NULL,
  `tipo_registro` varchar(3) DEFAULT NULL,
  `codigo_cliente_matriz` varchar(8) DEFAULT NULL,
  `codigo_cliente` varchar(8) DEFAULT NULL,
  `data_venda` date DEFAULT NULL,
  `numero_resumo_venda` varchar(15) DEFAULT NULL,
  `qtde_comprovante` decimal(6,0) DEFAULT NULL,
  `tipo_transacao` varchar(50) DEFAULT NULL,
  `status_transacao` varchar(50) DEFAULT NULL,
  `valor_bruto` decimal(15,2) DEFAULT NULL,
  `valor_desconto` decimal(15,2) DEFAULT NULL,
  `valor_liquido` decimal(15,2) DEFAULT NULL,
  `data_credito` date DEFAULT NULL,
  `total_parcelas_cv` decimal(13,0) DEFAULT NULL,
  `banco` varchar(3) DEFAULT NULL,
  `agencia` varchar(6) DEFAULT NULL,
  `tipo_conta` varchar(50) DEFAULT NULL,
  `conta_corrente` varchar(15) DEFAULT NULL,
  `numero_sequencia_registro` decimal(6,0) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_bin_v2_mv_rv_aceleracao_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_bin_v2_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_bin_v2_mv_rv_credito`
--

DROP TABLE IF EXISTS `conn_item_bin_v2_mv_rv_credito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_bin_v2_mv_rv_credito` (
  `item_id` int(10) unsigned NOT NULL,
  `tipo_registro` varchar(3) DEFAULT NULL,
  `codigo_cliente_matriz` varchar(8) DEFAULT NULL,
  `codigo_cliente_filial` varchar(8) DEFAULT NULL,
  `data_venda` date DEFAULT NULL,
  `numero_rv` varchar(15) DEFAULT NULL,
  `qtde_comprovante` decimal(6,0) DEFAULT NULL,
  `bandeira_cartao` varchar(50) DEFAULT NULL,
  `tipo_transacao` varchar(50) DEFAULT NULL,
  `status_transacao` varchar(50) DEFAULT NULL,
  `valor_bruto` decimal(15,2) DEFAULT NULL,
  `valor_desconto` decimal(15,2) DEFAULT NULL,
  `valor_liquido` decimal(15,2) DEFAULT NULL,
  `data_credito` date DEFAULT NULL,
  `banco` varchar(3) DEFAULT NULL,
  `agencia` varchar(6) DEFAULT NULL,
  `tipo_conta` varchar(50) DEFAULT NULL,
  `conta_corrente` varchar(15) DEFAULT NULL,
  `numero_sequencia_registro` decimal(6,0) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_bin_v2_mv_rv_credito_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_bin_v2_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_bin_v2_mv_rv_debito`
--

DROP TABLE IF EXISTS `conn_item_bin_v2_mv_rv_debito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_bin_v2_mv_rv_debito` (
  `item_id` int(10) unsigned NOT NULL,
  `tipo_registro` varchar(3) DEFAULT NULL,
  `codigo_cliente_matriz` varchar(8) DEFAULT NULL,
  `codigo_cliente_filial` varchar(8) DEFAULT NULL,
  `data_venda` date DEFAULT NULL,
  `numero_rv` varchar(15) DEFAULT NULL,
  `qtde_comprovante` decimal(6,0) DEFAULT NULL,
  `bandeira_cartao` varchar(50) DEFAULT NULL,
  `tipo_transacao` varchar(50) DEFAULT NULL,
  `status_transacao` varchar(50) DEFAULT NULL,
  `valor_bruto` decimal(15,2) DEFAULT NULL,
  `valor_desconto` decimal(15,2) DEFAULT NULL,
  `valor_liquido` decimal(15,2) DEFAULT NULL,
  `data_credito` date DEFAULT NULL,
  `valor_cashback` decimal(15,2) DEFAULT NULL,
  `intercambio_reverso` decimal(15,2) DEFAULT NULL,
  `banco` varchar(3) DEFAULT NULL,
  `agencia` varchar(6) DEFAULT NULL,
  `tipo_conta` varchar(50) DEFAULT NULL,
  `conta_corrente` varchar(15) DEFAULT NULL,
  `numero_sequencia_registro` decimal(6,0) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_bin_v2_mv_rv_debito_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_bin_v2_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_bin_v2_mv_rv_parcelado`
--

DROP TABLE IF EXISTS `conn_item_bin_v2_mv_rv_parcelado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_bin_v2_mv_rv_parcelado` (
  `item_id` int(10) unsigned NOT NULL,
  `tipo_registro` varchar(3) DEFAULT NULL,
  `codigo_cliente_matriz` varchar(8) DEFAULT NULL,
  `codigo_cliente` varchar(8) DEFAULT NULL,
  `data_venda` date DEFAULT NULL,
  `numero_rv` varchar(15) DEFAULT NULL,
  `qtde_comprovante` decimal(6,0) DEFAULT NULL,
  `bandeira_cartao` varchar(50) DEFAULT NULL,
  `emissor_cartao` decimal(1,0) DEFAULT NULL,
  `tipo_cartao` varchar(50) DEFAULT NULL,
  `tipo_transacao` varchar(50) DEFAULT NULL,
  `status_transacao` varchar(50) DEFAULT NULL,
  `numero_cartao` varchar(19) DEFAULT NULL,
  `numero_referencia_conta_pgto` varchar(50) DEFAULT NULL,
  `numero_controle_cliente` varchar(20) DEFAULT NULL,
  `autorizacao` varchar(6) DEFAULT NULL,
  `horario_transacao` time DEFAULT NULL,
  `numero_terminal` varchar(8) DEFAULT NULL,
  `tipo_captura` varchar(50) DEFAULT NULL,
  `entry_mode` varchar(50) DEFAULT NULL,
  `valor_bruto` decimal(15,2) DEFAULT NULL,
  `valor_desconto` decimal(15,2) DEFAULT NULL,
  `valor_taxa_intercambio_plus` decimal(15,2) DEFAULT NULL,
  `valor_liquido` decimal(15,2) DEFAULT NULL,
  `data_credito_primeira_parcela` date DEFAULT NULL,
  `total_parcelas_rv` decimal(6,0) DEFAULT NULL,
  `banco` varchar(3) DEFAULT NULL,
  `agencia` varchar(6) DEFAULT NULL,
  `tipo_conta` varchar(50) DEFAULT NULL,
  `conta_corrente` varchar(15) DEFAULT NULL,
  `taxa_percentual` decimal(15,2) DEFAULT NULL,
  `valor_base` decimal(15,2) DEFAULT NULL,
  `valor_minimo_taxa` decimal(15,2) DEFAULT NULL,
  `valor_maximo_taxa` decimal(15,2) DEFAULT NULL,
  `numero_sequencia_registro` decimal(6,0) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_bin_v2_mv_rv_parcelado_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_bin_v2_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_bin_v2_mv_trailer`
--

DROP TABLE IF EXISTS `conn_item_bin_v2_mv_trailer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_bin_v2_mv_trailer` (
  `item_id` int(10) unsigned NOT NULL,
  `tipo_registro` varchar(3) DEFAULT NULL,
  `codigo_cliente` varchar(8) DEFAULT NULL,
  `qtde_cv_debito` decimal(6,0) DEFAULT NULL,
  `valor_bruto_vendas_debito` decimal(15,2) DEFAULT NULL,
  `total_taxa_vendas_debito` decimal(15,2) DEFAULT NULL,
  `valor_liquido_vendas_debito` decimal(15,2) DEFAULT NULL,
  `qtde_cv_credito` decimal(6,0) DEFAULT NULL,
  `valor_bruto_vendas_credito` decimal(15,2) DEFAULT NULL,
  `total_taxa_vendas_credito` decimal(15,2) DEFAULT NULL,
  `valor_liquido_vendas_credito` decimal(15,2) DEFAULT NULL,
  `qtde_cv_credito_parcelado` decimal(6,0) DEFAULT NULL,
  `valor_bruto_vendas_credito_parcelado` decimal(15,2) DEFAULT NULL,
  `total_taxa_vendas_credito_parcelado` decimal(15,2) DEFAULT NULL,
  `valor_liquido_vendas_credito_parcelado` decimal(15,2) DEFAULT NULL,
  `qtde_cv_credito_parcelado_emissor` decimal(6,0) DEFAULT NULL,
  `valor_bruto_vendas_credito_parcelado_emissor` decimal(15,2) DEFAULT NULL,
  `total_taxa_vendas_credito_parcelado_emissor` decimal(15,2) DEFAULT NULL,
  `valor_liquido_vendas_credito_parcelado_emissor` decimal(15,2) DEFAULT NULL,
  `qtde_cv_crediario` decimal(6,0) DEFAULT NULL,
  `valor_bruto_vendas_crediario` decimal(15,2) DEFAULT NULL,
  `total_taxa_vendas_crediario` decimal(15,2) DEFAULT NULL,
  `valor_liquido_vendas_crediario` decimal(15,2) DEFAULT NULL,
  `valor_cashback` decimal(15,2) DEFAULT NULL,
  `intercambio_reverso` decimal(15,2) DEFAULT NULL,
  `qtde_transacoes_recarga` decimal(10,0) DEFAULT NULL,
  `numero_sequencia_registro` decimal(6,0) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_bin_v2_mv_trailer_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_bin_v2_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_bin_v2_mv_trailer_matriz`
--

DROP TABLE IF EXISTS `conn_item_bin_v2_mv_trailer_matriz`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_bin_v2_mv_trailer_matriz` (
  `item_id` int(10) unsigned NOT NULL,
  `tipo_registro` varchar(3) DEFAULT NULL,
  `codigo_cliente_matriz` varchar(8) DEFAULT NULL,
  `codigo_cliente_filial` varchar(8) DEFAULT NULL,
  `qtde_cv_debito` decimal(6,0) DEFAULT NULL,
  `valor_bruto_vendas_debito` decimal(15,2) DEFAULT NULL,
  `total_taxa_vendas_debito` decimal(15,2) DEFAULT NULL,
  `valor_liquido_vendas_debito` decimal(15,2) DEFAULT NULL,
  `qtde_cv_credito` decimal(6,0) DEFAULT NULL,
  `valor_bruto_vendas_credito` decimal(15,2) DEFAULT NULL,
  `total_taxa_vendas_credito` decimal(15,2) DEFAULT NULL,
  `valor_liquido_vendas_credito` decimal(15,2) DEFAULT NULL,
  `qtde_cv_credito_parcelado` decimal(6,0) DEFAULT NULL,
  `valor_bruto_vendas_credito_parcelado` decimal(15,2) DEFAULT NULL,
  `total_taxa_vendas_credito_parcelado` decimal(15,2) DEFAULT NULL,
  `valor_liquido_vendas_credito_parcelado` decimal(15,2) DEFAULT NULL,
  `qtde_cv_credito_parcelado_emissor` decimal(6,0) DEFAULT NULL,
  `valor_bruto_vendas_credito_parcelado_emissor` decimal(15,2) DEFAULT NULL,
  `total_taxa_vendas_credito_parcelado_emissor` decimal(15,2) DEFAULT NULL,
  `valor_liquido_vendas_credito_parcelado_emissor` decimal(15,2) DEFAULT NULL,
  `qtde_cv_crediario` decimal(6,0) DEFAULT NULL,
  `valor_bruto_vendas_crediario` decimal(15,2) DEFAULT NULL,
  `total_taxa_vendas_crediario` decimal(15,2) DEFAULT NULL,
  `valor_liquido_vendas_crediario` decimal(15,2) DEFAULT NULL,
  `valor_cashback` decimal(15,2) DEFAULT NULL,
  `intercambio_reverso` decimal(15,2) DEFAULT NULL,
  `qtde_transacoes_recarga` decimal(10,0) DEFAULT NULL,
  `numero_sequencia_registro` decimal(6,0) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_bin_v2_mv_trailer_matriz_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_bin_v2_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_bin_v2_mv_transacoes_pix`
--

DROP TABLE IF EXISTS `conn_item_bin_v2_mv_transacoes_pix`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_bin_v2_mv_transacoes_pix` (
  `item_id` int(10) unsigned NOT NULL,
  `tipo_registro` varchar(3) DEFAULT NULL,
  `instituicao` decimal(8,0) DEFAULT NULL,
  `service_contract_id` decimal(3,0) DEFAULT NULL,
  `documento_cliente` decimal(15,0) DEFAULT NULL,
  `numero_estabelecimento` decimal(15,0) DEFAULT NULL,
  `terminal_logico` varchar(50) DEFAULT NULL,
  `codigo_psp` decimal(20,0) DEFAULT NULL,
  `status_qrcode` varchar(50) DEFAULT NULL,
  `data_geracao_qrcode` date DEFAULT NULL,
  `hora_geracao_qrcode` time DEFAULT NULL,
  `data_liquidacao_qrcode` date DEFAULT NULL,
  `hora_liquidacao_qrcode` time DEFAULT NULL,
  `valor_qrcode` decimal(13,2) DEFAULT NULL,
  `indicador_pix` varchar(50) DEFAULT NULL,
  `NSU_pix` decimal(20,0) DEFAULT NULL,
  `codigo_cancelamento_qrcode` decimal(20,0) DEFAULT NULL,
  `data_cancelamento_qrcode` date DEFAULT NULL,
  `hora_cancelamento_qrcode` time DEFAULT NULL,
  `motivo_cancelamento` varchar(100) DEFAULT NULL,
  `numero_referencia_fepas` decimal(20,0) DEFAULT NULL,
  `codigo_autorizacao` varchar(40) DEFAULT NULL,
  `numero_referencia_retorno_sistema` decimal(30,0) DEFAULT NULL,
  `numero_sequencia_registro` decimal(6,0) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_bin_v2_mv_transacoes_pix_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_bin_v2_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_brasilcard_aj`
--

DROP TABLE IF EXISTS `conn_item_brasilcard_aj`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_brasilcard_aj` (
  `item_id` int(10) unsigned NOT NULL,
  `codigo_registro` varchar(2) NOT NULL,
  `identificacao_loja` varchar(15) DEFAULT NULL,
  `nsu_transacao_original` varchar(12) DEFAULT NULL,
  `data_transacao_original` date DEFAULT NULL,
  `numero_parcela` int(2) DEFAULT NULL,
  `nsu_transacao` varchar(12) DEFAULT NULL,
  `data_transacao_aj` date DEFAULT NULL,
  `hora_transacao_aj` time DEFAULT NULL,
  `data_lancamento` date DEFAULT NULL,
  `meio_captura_ajuste` int(1) DEFAULT NULL,
  `tipo_ajuste` int(1) DEFAULT NULL,
  `codigo_ajuste` varchar(3) DEFAULT NULL,
  `descricao_motivo_ajuste` varchar(30) DEFAULT NULL,
  `valor_bruto` decimal(10,2) DEFAULT NULL,
  `valor_desconto_comissao` decimal(10,2) DEFAULT NULL,
  `valor_liquido` decimal(10,2) DEFAULT NULL,
  `banco` varchar(3) DEFAULT NULL,
  `agencia` varchar(6) DEFAULT NULL,
  `conta` varchar(11) DEFAULT NULL,
  `nseq` varchar(6) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_brasilcard_aj_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_brasilcard_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_brasilcard_cc`
--

DROP TABLE IF EXISTS `conn_item_brasilcard_cc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_brasilcard_cc` (
  `item_id` int(10) unsigned NOT NULL,
  `codigo_registro` varchar(2) NOT NULL,
  `identificacao_loja` varchar(15) DEFAULT NULL,
  `nsu_transacao_original` varchar(12) DEFAULT NULL,
  `data_transacao_original` date DEFAULT NULL,
  `numero_parcela` int(2) DEFAULT NULL,
  `nsu_transacao` varchar(12) DEFAULT NULL,
  `data_transacao` date DEFAULT NULL,
  `hora_transacao` time DEFAULT NULL,
  `meio_captura` int(1) DEFAULT NULL,
  `nseq` varchar(6) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  KEY `ix_vooo_prod_rawdata_conn_item_brasilcard_cc_nsu_transac_2b9c` (`nsu_transacao_original`),
  CONSTRAINT `conn_item_brasilcard_cc_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_brasilcard_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_brasilcard_cv`
--

DROP TABLE IF EXISTS `conn_item_brasilcard_cv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_brasilcard_cv` (
  `item_id` int(10) unsigned NOT NULL,
  `codigo_registro` varchar(2) NOT NULL,
  `identificacao_loja` varchar(15) DEFAULT NULL,
  `nsu` varchar(12) DEFAULT NULL,
  `data_transacao` date DEFAULT NULL,
  `hora_transacao` time DEFAULT NULL,
  `tipo_lancamento` int(1) DEFAULT NULL,
  `data_lancamento` date DEFAULT NULL,
  `tipo_produto` varchar(1) DEFAULT NULL,
  `meio_captura` int(1) DEFAULT NULL,
  `valor_bruto_venda` decimal(10,2) DEFAULT NULL,
  `valor_desconto` decimal(10,2) DEFAULT NULL,
  `valor_liquido_venda` decimal(10,2) DEFAULT NULL,
  `numero_cartao` varchar(19) DEFAULT NULL,
  `numero_parcela` int(2) DEFAULT NULL,
  `numero_total_parcelas` int(2) DEFAULT NULL,
  `nsu_parcela` varchar(12) DEFAULT NULL,
  `valor_bruto_parcela` decimal(10,2) DEFAULT NULL,
  `valor_desconto_parcela` decimal(10,2) DEFAULT NULL,
  `valor_liquido_parcela` decimal(10,2) DEFAULT NULL,
  `banco` varchar(3) DEFAULT NULL,
  `agencia` varchar(6) DEFAULT NULL,
  `conta` varchar(11) DEFAULT NULL,
  `codigo_autorizacao` int(6) DEFAULT NULL,
  `nseq` varchar(6) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  KEY `ix_vooo_prod_rawdata_conn_item_brasilcard_cv_nsu` (`nsu`),
  KEY `ix_vooo_prod_rawdata_conn_item_brasilcard_cv_identificacao_loja` (`identificacao_loja`),
  CONSTRAINT `conn_item_brasilcard_cv_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_brasilcard_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_brasilcard_header_arquivo`
--

DROP TABLE IF EXISTS `conn_item_brasilcard_header_arquivo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_brasilcard_header_arquivo` (
  `item_id` int(10) unsigned NOT NULL,
  `codigo_registro` varchar(2) NOT NULL,
  `versao_layout` varchar(6) DEFAULT NULL,
  `data_geracao_arquivo` date DEFAULT NULL,
  `hora_geracao_arquivo` time DEFAULT NULL,
  `id_movimento` int(6) DEFAULT NULL,
  `nome_administradora` varchar(30) DEFAULT NULL,
  `identificacao_remetente` int(4) DEFAULT NULL,
  `identificacao_destinatario` int(6) DEFAULT NULL,
  `nseq_registro` int(6) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_brasilcard_header_arquivo_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_brasilcard_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_brasilcard_header_lote`
--

DROP TABLE IF EXISTS `conn_item_brasilcard_header_lote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_brasilcard_header_lote` (
  `item_id` int(10) unsigned NOT NULL,
  `codigo_registro` varchar(2) NOT NULL,
  `data_movimento` date DEFAULT NULL,
  `identificacao_moeda` varchar(2) DEFAULT NULL,
  `nseq` varchar(6) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_brasilcard_header_lote_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_brasilcard_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_brasilcard_line`
--

DROP TABLE IF EXISTS `conn_item_brasilcard_line`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_brasilcard_line` (
  `item_id` int(10) unsigned NOT NULL,
  `file_version` varchar(6) DEFAULT NULL,
  `registertype` varchar(2) NOT NULL,
  `masterid` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  KEY `masterid` (`masterid`),
  CONSTRAINT `conn_item_brasilcard_line_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `vooo_prod_backend`.`connection_item` (`item_id`),
  CONSTRAINT `conn_item_brasilcard_line_ibfk_2` FOREIGN KEY (`masterid`) REFERENCES `conn_item_brasilcard_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_brasilcard_trailer_arquivo`
--

DROP TABLE IF EXISTS `conn_item_brasilcard_trailer_arquivo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_brasilcard_trailer_arquivo` (
  `item_id` int(10) unsigned NOT NULL,
  `codigo_registro` varchar(2) NOT NULL,
  `total_geral_registros` int(6) DEFAULT NULL,
  `nseq` varchar(6) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_brasilcard_trailer_arquivo_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_brasilcard_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_brasilcard_trailer_lote`
--

DROP TABLE IF EXISTS `conn_item_brasilcard_trailer_lote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_brasilcard_trailer_lote` (
  `item_id` int(10) unsigned NOT NULL,
  `codigo_registro` varchar(2) NOT NULL,
  `total_registros_transacao` int(6) DEFAULT NULL,
  `total_valores_creditos` decimal(10,2) DEFAULT NULL,
  `nseq` varchar(6) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_brasilcard_trailer_lote_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_brasilcard_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_braspag_control`
--

DROP TABLE IF EXISTS `conn_item_braspag_control`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_braspag_control` (
  `item_id` int(10) unsigned NOT NULL,
  `start_sales_date` date DEFAULT NULL,
  `end_sales_date` date DEFAULT NULL,
  `start_payment_date` date DEFAULT NULL,
  `end_payment_date` date DEFAULT NULL,
  `store` varchar(30) DEFAULT NULL,
  `check_status` decimal(1,0) DEFAULT NULL,
  `registers` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  KEY `ix_vooo_prod_rawdata_conn_item_braspag_control_end_payment_date` (`end_payment_date`),
  KEY `ix_vooo_prod_rawdata_conn_item_braspag_control_start_sales_date` (`start_sales_date`),
  KEY `ix_vooo_prod_rawdata_conn_item_braspag_control_end_sales_date` (`end_sales_date`),
  KEY `ix_vooo_prod_rawdata_conn_item_braspag_control_start_pay_cd44` (`start_payment_date`),
  CONSTRAINT `conn_item_braspag_control_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_braspag_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_braspag_duplicated`
--

DROP TABLE IF EXISTS `conn_item_braspag_duplicated`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_braspag_duplicated` (
  `item_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `original_id` int(10) unsigned DEFAULT NULL,
  `duplicated_id` int(10) unsigned DEFAULT NULL,
  `status` varchar(2) NOT NULL,
  PRIMARY KEY (`item_id`),
  KEY `original_id` (`original_id`),
  KEY `duplicated_id` (`duplicated_id`),
  CONSTRAINT `conn_item_braspag_duplicated_ibfk_1` FOREIGN KEY (`original_id`) REFERENCES `conn_item_braspag_transaction` (`item_id`),
  CONSTRAINT `conn_item_braspag_duplicated_ibfk_2` FOREIGN KEY (`duplicated_id`) REFERENCES `conn_item_braspag_transaction` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_braspag_line`
--

DROP TABLE IF EXISTS `conn_item_braspag_line`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_braspag_line` (
  `item_id` int(10) unsigned NOT NULL,
  `register_type` varchar(15) DEFAULT NULL,
  `masterid` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  KEY `masterid` (`masterid`),
  CONSTRAINT `conn_item_braspag_line_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `vooo_prod_backend`.`connection_item` (`item_id`),
  CONSTRAINT `conn_item_braspag_line_ibfk_2` FOREIGN KEY (`masterid`) REFERENCES `conn_item_braspag_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_braspag_transaction`
--

DROP TABLE IF EXISTS `conn_item_braspag_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_braspag_transaction` (
  `item_id` int(10) unsigned NOT NULL,
  `document` decimal(20,0) DEFAULT NULL,
  `sales_code` varchar(64) DEFAULT NULL,
  `sales_value` decimal(10,2) DEFAULT NULL,
  `sales_date` date DEFAULT NULL,
  `sales_time` time DEFAULT NULL,
  `store` varchar(30) DEFAULT NULL,
  `cashier_code` varchar(30) DEFAULT NULL,
  `salesman_code` varchar(30) DEFAULT NULL,
  `client_code` varchar(30) DEFAULT NULL,
  `external_code` varchar(30) DEFAULT NULL,
  `payment_code` varchar(64) DEFAULT NULL,
  `payment_method` varchar(30) DEFAULT NULL,
  `payment_value` decimal(10,2) DEFAULT NULL,
  `payment_date` date DEFAULT NULL,
  `payment_time` time DEFAULT NULL,
  `installments` decimal(2,0) DEFAULT NULL,
  `provider` varchar(30) DEFAULT NULL,
  `card_suffix` decimal(6,0) DEFAULT NULL,
  `authorization_code` varchar(20) DEFAULT NULL,
  `nsu_code` varchar(20) DEFAULT NULL,
  `card_flag` varchar(30) DEFAULT NULL,
  `nsu_tef` varchar(20) DEFAULT NULL,
  `status` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  KEY `IDX_ITEM_BRASPAG_TRANSACTION_1` (`payment_code`),
  CONSTRAINT `conn_item_braspag_transaction_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_braspag_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_btg_line`
--

DROP TABLE IF EXISTS `conn_item_btg_line`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_btg_line` (
  `item_id` int(10) unsigned NOT NULL,
  `register_type` decimal(1,0) DEFAULT NULL,
  `id_shellbox` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  UNIQUE KEY `id_shellbox` (`id_shellbox`),
  CONSTRAINT `conn_item_btg_line_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `vooo_prod_backend`.`connection_item` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_btg_sales`
--

DROP TABLE IF EXISTS `conn_item_btg_sales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_btg_sales` (
  `item_id` int(10) unsigned NOT NULL,
  `realized_at` timestamp NULL DEFAULT NULL,
  `error_code` varchar(25) DEFAULT NULL,
  `gas_type` varchar(40) DEFAULT NULL,
  `gas_type_id` varchar(40) DEFAULT NULL,
  `nsu_code` varchar(40) DEFAULT NULL,
  `payment_method_code` varchar(40) DEFAULT NULL,
  `price_per_litre` decimal(10,0) DEFAULT NULL,
  `quantity_in_litre` decimal(10,3) DEFAULT NULL,
  `total_discount_cents` decimal(15,0) DEFAULT NULL,
  `total_in_cents` decimal(15,0) DEFAULT NULL,
  `transfer_value` decimal(15,2) DEFAULT NULL,
  `bank_tax` decimal(15,2) DEFAULT NULL,
  `transaction_id` varchar(32) DEFAULT NULL,
  `external_id` varchar(32) DEFAULT NULL,
  `prevision_settled` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_btg_sales_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_btg_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_btg_settlement`
--

DROP TABLE IF EXISTS `conn_item_btg_settlement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_btg_settlement` (
  `item_id` int(10) unsigned NOT NULL,
  `realized_at` datetime DEFAULT NULL,
  `error_code` varchar(25) DEFAULT NULL,
  `gas_type` varchar(25) DEFAULT NULL,
  `gas_type_id` varchar(25) DEFAULT NULL,
  `nsu_code` varchar(25) DEFAULT NULL,
  `payment_method_code` varchar(25) DEFAULT NULL,
  `price_per_litre` decimal(10,0) DEFAULT NULL,
  `quantity_in_litre` decimal(10,3) DEFAULT NULL,
  `settled_at` date DEFAULT NULL,
  `total_discount_cents` decimal(15,0) DEFAULT NULL,
  `total_in_cents` decimal(15,0) DEFAULT NULL,
  `total_in_cents_without_fee` decimal(15,0) DEFAULT NULL,
  `transaction_id` varchar(64) DEFAULT NULL,
  `external_id` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_btg_settlement_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_btg_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_c6_bank_ajuste`
--

DROP TABLE IF EXISTS `conn_item_c6_bank_ajuste`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_c6_bank_ajuste` (
  `item_id` int(10) unsigned NOT NULL,
  `tiporegistro` varchar(2) DEFAULT NULL,
  `codigo_ec` decimal(15,0) DEFAULT NULL,
  `nsu_transacao_original` varchar(40) DEFAULT NULL,
  `data_transacao_original` date DEFAULT NULL,
  `num_da_parcela` decimal(2,0) DEFAULT NULL,
  `nsu_transacao` varchar(40) DEFAULT NULL,
  `data_transacao_ajuste` date DEFAULT NULL,
  `hora_transacao_ajuste` time DEFAULT NULL,
  `tipo_lancamento` decimal(1,0) DEFAULT NULL,
  `data_lancamento` date DEFAULT NULL,
  `forma_captura` decimal(1,0) DEFAULT NULL,
  `tipo_ajuste` decimal(1,0) DEFAULT NULL,
  `codigo_ajuste` decimal(3,0) DEFAULT NULL,
  `descricao_ajuste` varchar(30) DEFAULT NULL,
  `valor_bruto` decimal(11,2) DEFAULT NULL,
  `valor_desconto` decimal(11,2) DEFAULT NULL,
  `valor_liquido` decimal(11,2) DEFAULT NULL,
  `banco` decimal(3,0) DEFAULT NULL,
  `agencia` decimal(6,0) DEFAULT NULL,
  `conta_corrente` varchar(11) DEFAULT NULL,
  `num_cartao` varchar(19) DEFAULT NULL,
  `codigo_bandeira` varchar(3) DEFAULT NULL,
  `codigo_produto` varchar(3) DEFAULT NULL,
  `valor_bruto_parcela` decimal(11,2) DEFAULT NULL,
  `valor_liquido_parcela` decimal(11,2) DEFAULT NULL,
  `codigo_pedido` varchar(36) DEFAULT NULL,
  `codigo_autorizacao` varchar(36) DEFAULT NULL,
  `num_parcelas` decimal(2,0) DEFAULT NULL,
  `sequencia_registro` decimal(6,0) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_c6_bank_ajuste_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_c6_bank_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_c6_bank_cancel`
--

DROP TABLE IF EXISTS `conn_item_c6_bank_cancel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_c6_bank_cancel` (
  `item_id` int(10) unsigned NOT NULL,
  `tiporegistro` varchar(2) DEFAULT NULL,
  `codigo_ec` decimal(15,0) DEFAULT NULL,
  `nsu_transacao_original` varchar(40) DEFAULT NULL,
  `data_transacao_original` date DEFAULT NULL,
  `num_da_parcela` decimal(2,0) DEFAULT NULL,
  `nsu_transacao` varchar(40) DEFAULT NULL,
  `data_transacao_cancelamento` date DEFAULT NULL,
  `hora_transacao_cancelamento` time DEFAULT NULL,
  `forma_captura` decimal(1,0) DEFAULT NULL,
  `codigo_pedido` varchar(36) DEFAULT NULL,
  `codigo_autorizacao` varchar(40) DEFAULT NULL,
  `valor_bruto` decimal(11,2) DEFAULT NULL,
  `valor_liquido` decimal(11,2) DEFAULT NULL,
  `valor_bruto_parcela` decimal(11,2) DEFAULT NULL,
  `valor_liquido_parcela` decimal(11,2) DEFAULT NULL,
  `codigo_ajuste` decimal(3,0) DEFAULT NULL,
  `descricao_ajuste` varchar(30) DEFAULT NULL,
  `num_parcelas` decimal(2,0) DEFAULT NULL,
  `sequencia_registro` decimal(6,0) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_c6_bank_cancel_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_c6_bank_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_c6_bank_cv`
--

DROP TABLE IF EXISTS `conn_item_c6_bank_cv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_c6_bank_cv` (
  `item_id` int(10) unsigned NOT NULL,
  `tipo_registro` varchar(2) DEFAULT NULL,
  `codigo_ec` decimal(15,0) DEFAULT NULL,
  `nsu_adquirente` varchar(40) DEFAULT NULL,
  `data_transacao` date DEFAULT NULL,
  `hora_transacao` time DEFAULT NULL,
  `tipo_lancamento` decimal(1,0) DEFAULT NULL,
  `data_pagamento` date DEFAULT NULL,
  `tipo_produto` varchar(1) DEFAULT NULL,
  `forma_captura` decimal(1,0) DEFAULT NULL,
  `valor_bruto` decimal(11,2) DEFAULT NULL,
  `valor_desconto` decimal(11,2) DEFAULT NULL,
  `valor_liquido` decimal(11,2) DEFAULT NULL,
  `num_cartao` varchar(19) DEFAULT NULL,
  `num_da_parcela` decimal(2,0) DEFAULT NULL,
  `num_parcelas` decimal(2,0) DEFAULT NULL,
  `nsu_parcela` varchar(40) DEFAULT NULL,
  `valor_bruto_parcela` decimal(11,2) DEFAULT NULL,
  `valor_desconto_parcela` decimal(11,2) DEFAULT NULL,
  `valor_liquido_parcela` decimal(11,2) DEFAULT NULL,
  `banco` decimal(3,0) DEFAULT NULL,
  `agencia` decimal(6,0) DEFAULT NULL,
  `conta_corrente` varchar(11) DEFAULT NULL,
  `codigo_autorizacao` varchar(40) DEFAULT NULL,
  `codigo_bandeira` varchar(3) DEFAULT NULL,
  `codigo_produto` varchar(3) DEFAULT NULL,
  `valor_taxa_1` decimal(11,2) DEFAULT NULL,
  `valor_taxa_2` decimal(11,2) DEFAULT NULL,
  `valor_taxa_1_parcela` decimal(11,2) DEFAULT NULL,
  `valor_taxa_2_parcela` decimal(11,2) DEFAULT NULL,
  `filler_1` decimal(11,0) DEFAULT NULL,
  `valor_taxa_antecipacao` decimal(11,2) DEFAULT NULL,
  `valor_liquido_antecipado` decimal(11,2) DEFAULT NULL,
  `filler_2` decimal(2,0) DEFAULT NULL,
  `codigo_pedido` varchar(40) DEFAULT NULL,
  `filler_3` varchar(3) DEFAULT NULL,
  `numero_terminal` varchar(8) DEFAULT NULL,
  `codigo_shellbox` varchar(50) DEFAULT NULL,
  `sequencia_registro` decimal(6,0) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_c6_bank_cv_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_c6_bank_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_c6_bank_header`
--

DROP TABLE IF EXISTS `conn_item_c6_bank_header`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_c6_bank_header` (
  `item_id` int(10) unsigned NOT NULL,
  `tipo_registro` varchar(2) DEFAULT NULL,
  `versao_layout` varchar(6) DEFAULT NULL,
  `data_criacao` date DEFAULT NULL,
  `hora_criacao` time DEFAULT NULL,
  `sequencia` decimal(6,0) DEFAULT NULL,
  `nome_adquirente` varchar(30) DEFAULT NULL,
  `filler` decimal(1,0) DEFAULT NULL,
  `codigo_ec` decimal(13,0) DEFAULT NULL,
  `tipo_processamento` varchar(1) DEFAULT NULL,
  `sequencia_registro` decimal(6,0) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_c6_bank_header_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_c6_bank_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_c6_bank_header_mov`
--

DROP TABLE IF EXISTS `conn_item_c6_bank_header_mov`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_c6_bank_header_mov` (
  `item_id` int(10) unsigned NOT NULL,
  `tipo_registro` varchar(2) DEFAULT NULL,
  `data_movimento` date DEFAULT NULL,
  `moeda` varchar(2) DEFAULT NULL,
  `sequencia_registro` decimal(6,0) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_c6_bank_header_mov_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_c6_bank_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_c6_bank_line`
--

DROP TABLE IF EXISTS `conn_item_c6_bank_line`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_c6_bank_line` (
  `item_id` int(10) unsigned NOT NULL,
  `register_type` varchar(2) NOT NULL,
  `masterid` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  KEY `masterid` (`masterid`),
  CONSTRAINT `conn_item_c6_bank_line_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `vooo_prod_backend`.`connection_item` (`item_id`),
  CONSTRAINT `conn_item_c6_bank_line_ibfk_2` FOREIGN KEY (`masterid`) REFERENCES `conn_item_c6_bank_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_c6_bank_trailer`
--

DROP TABLE IF EXISTS `conn_item_c6_bank_trailer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_c6_bank_trailer` (
  `item_id` int(10) unsigned NOT NULL,
  `tipo_registro` varchar(2) DEFAULT NULL,
  `qtd_registros` decimal(6,0) DEFAULT NULL,
  `sequencia_registro` decimal(6,0) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_c6_bank_trailer_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_c6_bank_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_c6_bank_trailer_mov`
--

DROP TABLE IF EXISTS `conn_item_c6_bank_trailer_mov`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_c6_bank_trailer_mov` (
  `item_id` int(10) unsigned NOT NULL,
  `tipo_registro` varchar(2) DEFAULT NULL,
  `total_registros` decimal(6,0) DEFAULT NULL,
  `total_creditos` decimal(14,2) DEFAULT NULL,
  `sequencia_registro` decimal(6,0) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_c6_bank_trailer_mov_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_c6_bank_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_change_sales_code`
--

DROP TABLE IF EXISTS `conn_item_change_sales_code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_change_sales_code` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `arquivo` varchar(100) DEFAULT NULL,
  `linha` decimal(10,0) DEFAULT NULL,
  `old_key` varchar(100) DEFAULT NULL,
  `new_key` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2270841 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_cielo_antecipacao`
--

DROP TABLE IF EXISTS `conn_item_cielo_antecipacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_cielo_antecipacao` (
  `item_id` int(10) unsigned NOT NULL,
  `regtypeid` int(10) unsigned DEFAULT NULL,
  `estabelecimentoemissor` int(10) unsigned DEFAULT NULL,
  `numerooperacaofinanceira` int(10) unsigned DEFAULT NULL,
  `datacredito` date DEFAULT NULL,
  `sinalbrutoantecipacaoavista` varchar(1) DEFAULT NULL,
  `valorbrutoantecipacaoavista` decimal(10,2) DEFAULT NULL,
  `sinalbrutoantecipacaoparcelado` varchar(1) DEFAULT NULL,
  `valorbrutoantecipacaoparcelado` decimal(10,2) DEFAULT NULL,
  `sinalbrutoantecipacaoelectron` varchar(1) DEFAULT NULL,
  `valorbrutoantecipacaoelectron` decimal(10,2) DEFAULT NULL,
  `sinalbrutoantecipacaototal` varchar(1) DEFAULT NULL,
  `valorbrutoantecipacaototal` decimal(10,2) DEFAULT NULL,
  `sinalliquidoantecipacaoavista` varchar(1) DEFAULT NULL,
  `valorliquidoantecipacaoavista` decimal(10,2) DEFAULT NULL,
  `sinalliquidoantecipacaoparcelado` varchar(1) DEFAULT NULL,
  `valorliquidoantecipacaoparcelado` decimal(10,2) DEFAULT NULL,
  `sinalliquidoantecipacaoelectron` varchar(1) DEFAULT NULL,
  `valorliquidoantecipacaoelectron` decimal(10,2) DEFAULT NULL,
  `sinalliquidoantecipacaototal` varchar(1) DEFAULT NULL,
  `valorliquidoantecipacaototal` decimal(10,2) DEFAULT NULL,
  `taxadescontoantecipacao` decimal(10,2) DEFAULT NULL,
  `banco` int(10) unsigned DEFAULT NULL,
  `agencia` int(10) unsigned DEFAULT NULL,
  `contacorrente` int(10) unsigned DEFAULT NULL,
  `sinalliquidoantecipacao` varchar(1) DEFAULT NULL,
  `valorliquidoantecipacao` decimal(10,2) DEFAULT NULL,
  `reservadocielo` varchar(68) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_cielo_antecipacao_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_cielo_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_cielo_circularizacao_header`
--

DROP TABLE IF EXISTS `conn_item_cielo_circularizacao_header`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_cielo_circularizacao_header` (
  `item_id` int(10) unsigned NOT NULL,
  `tipo` varchar(50) NOT NULL,
  `data_arquivo` date NOT NULL,
  `data_base` date NOT NULL,
  `razao_social` varchar(200) NOT NULL,
  `grupo` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_cielo_circularizacao_header_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_cielo_circularizacao_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_cielo_circularizacao_line`
--

DROP TABLE IF EXISTS `conn_item_cielo_circularizacao_line`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_cielo_circularizacao_line` (
  `item_id` int(10) unsigned NOT NULL,
  `file_type` varchar(100) NOT NULL,
  `register_type` int(10) unsigned NOT NULL,
  `masterid` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  KEY `masterid` (`masterid`),
  CONSTRAINT `conn_item_cielo_circularizacao_line_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `vooo_prod_backend`.`connection_item` (`item_id`),
  CONSTRAINT `conn_item_cielo_circularizacao_line_ibfk_2` FOREIGN KEY (`masterid`) REFERENCES `conn_item_cielo_circularizacao_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_cielo_circularizacao_resumo`
--

DROP TABLE IF EXISTS `conn_item_cielo_circularizacao_resumo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_cielo_circularizacao_resumo` (
  `item_id` int(10) unsigned NOT NULL,
  `estabelecimento_submissor` int(10) unsigned NOT NULL,
  `debito_bruto` decimal(10,2) NOT NULL,
  `debito_liquido` decimal(10,2) NOT NULL,
  `vista_real_bruto` decimal(10,2) NOT NULL,
  `vista_real_liquido` decimal(10,2) NOT NULL,
  `vista_dolar_bruto` decimal(10,2) NOT NULL,
  `vista_dolar_liquido` decimal(10,2) NOT NULL,
  `antecipado_arv_bruto` decimal(10,2) NOT NULL,
  `antecipado_arv_liquido` decimal(10,2) NOT NULL,
  `antecipado_sessao_bruto` decimal(10,2) NOT NULL,
  `antecipado_sessao_liquido` decimal(10,2) NOT NULL,
  `rotativo_bruto` decimal(10,2) NOT NULL,
  `rotativo_liquido` decimal(10,2) NOT NULL,
  `parcelado_bruto` decimal(10,2) NOT NULL,
  `parcelado_liquido` decimal(10,2) NOT NULL,
  `parcelado_negociado` decimal(10,2) NOT NULL,
  `parcelado_saldo_aberto` decimal(10,2) NOT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_cielo_circularizacao_resumo_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_cielo_circularizacao_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_cielo_circularizacao_ro_parcelado`
--

DROP TABLE IF EXISTS `conn_item_cielo_circularizacao_ro_parcelado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_cielo_circularizacao_ro_parcelado` (
  `item_id` int(10) unsigned NOT NULL,
  `estabelecimento_submissor` int(10) unsigned NOT NULL,
  `numero_ro` int(10) unsigned NOT NULL,
  `bandeira` varchar(23) NOT NULL,
  `quantidade_cv` decimal(5,0) NOT NULL,
  `data_deposito` date NOT NULL,
  `data_vencimento` date NOT NULL,
  `data_liberacao` date NOT NULL,
  `valor_bruto` decimal(10,2) NOT NULL,
  `valor_liquido` decimal(10,2) NOT NULL,
  `total_pr` decimal(5,0) NOT NULL,
  `total_pd` decimal(5,0) NOT NULL,
  `valor_negociado` decimal(10,2) NOT NULL,
  `total_neg` decimal(5,0) NOT NULL,
  `saldo_aberto` decimal(10,2) NOT NULL,
  `descricao` varchar(33) NOT NULL,
  `conceito` varchar(9) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_cielo_circularizacao_ro_parcelado_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_cielo_circularizacao_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_cielo_circularizacao_ro_rotativo`
--

DROP TABLE IF EXISTS `conn_item_cielo_circularizacao_ro_rotativo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_cielo_circularizacao_ro_rotativo` (
  `item_id` int(10) unsigned NOT NULL,
  `estabelecimento_submissor` int(10) unsigned NOT NULL,
  `numero_ro` int(10) unsigned NOT NULL,
  `descricao` varchar(33) NOT NULL,
  `quantidade_cv` decimal(5,0) NOT NULL,
  `data_deposito` date NOT NULL,
  `data_captura` date NOT NULL,
  `data_pagamento` date NOT NULL,
  `moeda` varchar(5) NOT NULL,
  `valor_bruto` decimal(10,2) NOT NULL,
  `valor_liquido` decimal(10,2) NOT NULL,
  `bandeira` varchar(23) NOT NULL,
  `sec` varchar(3) DEFAULT NULL,
  `conceito` varchar(9) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_cielo_circularizacao_ro_rotativo_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_cielo_circularizacao_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_cielo_cv`
--

DROP TABLE IF EXISTS `conn_item_cielo_cv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_cielo_cv` (
  `item_id` int(10) unsigned NOT NULL,
  `regtypeid` int(10) unsigned DEFAULT NULL,
  `estabelecimentosubmissor` int(10) unsigned DEFAULT NULL,
  `numeroRO` int(10) unsigned DEFAULT NULL,
  `numerocartao` varchar(19) DEFAULT NULL,
  `datavendaajuste` date DEFAULT NULL,
  `sinalcompraparcela` varchar(1) DEFAULT NULL,
  `valorcompraparcela` decimal(10,2) DEFAULT NULL,
  `parcela` int(10) unsigned DEFAULT NULL,
  `totalparcelas` int(10) unsigned DEFAULT NULL,
  `motivorejeicao` varchar(3) DEFAULT NULL,
  `codigoautorizacao` varchar(6) DEFAULT NULL,
  `TID` varchar(20) DEFAULT NULL,
  `NSU` varchar(6) DEFAULT NULL,
  `valorcomplementar` decimal(10,2) DEFAULT NULL,
  `numerodigitoscartao` int(10) unsigned DEFAULT NULL,
  `valortotalvenda` decimal(10,2) DEFAULT NULL,
  `valorproximaparcela` decimal(10,2) DEFAULT NULL,
  `numeronotafiscal` varchar(20) DEFAULT NULL,
  `cartaoemitidoexterior` int(10) unsigned DEFAULT NULL,
  `numerologicoterminal` varchar(8) DEFAULT NULL,
  `identificadortaxaembarque` varchar(2) DEFAULT NULL,
  `referenciacodigopedido` varchar(20) DEFAULT NULL,
  `horatransacao` time DEFAULT NULL,
  `numerounicotransacao` varchar(29) DEFAULT NULL,
  `indicadorcielopremia` varchar(1) DEFAULT NULL,
  `usocielo` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_cielo_cv_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_cielo_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_cielo_header`
--

DROP TABLE IF EXISTS `conn_item_cielo_header`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_cielo_header` (
  `item_id` int(10) unsigned NOT NULL,
  `regtypeid` int(10) unsigned DEFAULT NULL,
  `estabelecimentomatriz` decimal(11,0) unsigned DEFAULT NULL,
  `dataprocessamento` date DEFAULT NULL,
  `periodoinicial` date DEFAULT NULL,
  `periodofinal` date DEFAULT NULL,
  `sequencia` int(10) unsigned DEFAULT NULL,
  `opcaoextrato` int(10) unsigned DEFAULT NULL,
  `empresaadquirente` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  KEY `idx_data_processamento` (`dataprocessamento`),
  KEY `idx_estabelecimento` (`estabelecimentomatriz`,`periodoinicial`,`periodofinal`),
  CONSTRAINT `conn_item_cielo_header_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_cielo_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_cielo_line`
--

DROP TABLE IF EXISTS `conn_item_cielo_line`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_cielo_line` (
  `item_id` int(10) unsigned NOT NULL,
  `registertype` int(10) unsigned DEFAULT NULL,
  `filetype` int(10) unsigned DEFAULT NULL,
  `fileline` varchar(350) DEFAULT NULL,
  `masterid` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  KEY `masterid` (`masterid`),
  CONSTRAINT `conn_item_cielo_line_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `vooo_prod_backend`.`connection_item` (`item_id`),
  CONSTRAINT `conn_item_cielo_line_ibfk_2` FOREIGN KEY (`masterid`) REFERENCES `conn_item_cielo_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_cielo_product`
--

DROP TABLE IF EXISTS `conn_item_cielo_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_cielo_product` (
  `id` int(11) NOT NULL,
  `description` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_cielo_ro`
--

DROP TABLE IF EXISTS `conn_item_cielo_ro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_cielo_ro` (
  `item_id` int(10) unsigned NOT NULL,
  `regtypeid` int(10) unsigned DEFAULT NULL,
  `estabelecimentosubmissor` int(10) unsigned DEFAULT NULL,
  `numeroRO` int(10) unsigned DEFAULT NULL,
  `parcela` varchar(2) DEFAULT NULL,
  `filler` varchar(2) DEFAULT NULL,
  `plano` varchar(2) DEFAULT NULL,
  `tipotransacao` int(10) unsigned DEFAULT NULL,
  `dataapresentacao` date DEFAULT NULL,
  `datapagamento` date DEFAULT NULL,
  `dataenviobanco` date DEFAULT NULL,
  `sinalvalorbruto` varchar(1) DEFAULT NULL,
  `valorbruto` decimal(10,2) DEFAULT NULL,
  `sinalcomissao` varchar(1) DEFAULT NULL,
  `valorcomissao` decimal(10,2) DEFAULT NULL,
  `sinalrejeitado` varchar(1) DEFAULT NULL,
  `valorrejeitado` decimal(10,2) DEFAULT NULL,
  `sinalliquido` varchar(1) DEFAULT NULL,
  `valorliquido` decimal(10,2) DEFAULT NULL,
  `banco` int(10) unsigned DEFAULT NULL,
  `agencia` int(10) unsigned DEFAULT NULL,
  `contacorrente` varchar(15) DEFAULT NULL,
  `statuspagamento` int(10) unsigned DEFAULT NULL,
  `qtdeCVaceitos` int(10) unsigned DEFAULT NULL,
  `idvelhoproduto` varchar(2) DEFAULT NULL,
  `qtdeCV` int(10) unsigned DEFAULT NULL,
  `revendaaceleracao` varchar(1) DEFAULT NULL,
  `datacaptura` date DEFAULT NULL,
  `origemajuste` varchar(2) DEFAULT NULL,
  `valorcomplementar` decimal(10,2) DEFAULT NULL,
  `tipoantecipacao` varchar(1) DEFAULT NULL,
  `correspondenciaantecipacao` int(10) unsigned DEFAULT NULL,
  `sinalantecipacaobruto` varchar(1) DEFAULT NULL,
  `valorantecipacaobruto` decimal(10,2) DEFAULT NULL,
  `bandeira` int(10) unsigned DEFAULT NULL,
  `numerounicoro` varchar(22) DEFAULT NULL,
  `percentalcomissao` int(10) unsigned DEFAULT NULL,
  `tarifa` decimal(10,2) unsigned DEFAULT NULL,
  `taxagarantia` int(10) unsigned DEFAULT NULL,
  `meiocaptura` varchar(2) DEFAULT NULL,
  `numerologicoterminal` varchar(8) DEFAULT NULL,
  `idnovoproduto` int(10) unsigned DEFAULT NULL,
  `usocielo` varchar(15) DEFAULT NULL,
  `percentual_comissao_decimal` decimal(5,4) DEFAULT NULL,
  `numerounicoro_15` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  KEY `IDX_numerounicoro` (`numerounicoro_15`),
  CONSTRAINT `conn_item_cielo_ro_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_cielo_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_cielo_ro_antecipado`
--

DROP TABLE IF EXISTS `conn_item_cielo_ro_antecipado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_cielo_ro_antecipado` (
  `item_id` int(10) unsigned NOT NULL,
  `regtypeid` int(10) unsigned DEFAULT NULL,
  `estabelecimentoemissor` int(10) unsigned DEFAULT NULL,
  `numerooperacaoantecipacao` int(10) unsigned DEFAULT NULL,
  `datavencimentoro` date DEFAULT NULL,
  `numeroroantecipado` int(10) unsigned DEFAULT NULL,
  `parcelaantecipada` int(10) unsigned DEFAULT NULL,
  `totalparcelas` int(10) unsigned DEFAULT NULL,
  `sinalbrutooriginal` varchar(1) DEFAULT NULL,
  `valorbrutooriginal` decimal(10,2) DEFAULT NULL,
  `sinalliquidooriginal` varchar(1) DEFAULT NULL,
  `valorliquidooriginal` decimal(10,2) DEFAULT NULL,
  `sinalbrutoantecipacao` varchar(1) DEFAULT NULL,
  `valorbrutoantecipacao` decimal(10,2) DEFAULT NULL,
  `sinalliquidoantecipacao` varchar(1) DEFAULT NULL,
  `valorliquidoantecipacao` decimal(10,2) DEFAULT NULL,
  `bandeira` int(10) unsigned DEFAULT NULL,
  `numerounicoro` varchar(22) DEFAULT NULL,
  `usocielo` varchar(130) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_cielo_ro_antecipado_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_cielo_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_cielo_ro_debito_antecipacao`
--

DROP TABLE IF EXISTS `conn_item_cielo_ro_debito_antecipacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_cielo_ro_debito_antecipacao` (
  `item_id` int(10) unsigned NOT NULL,
  `regtypeid` int(10) unsigned DEFAULT NULL,
  `estabelecimentosubmissor` int(10) unsigned DEFAULT NULL,
  `numerounicorooriginalvenda` varchar(22) DEFAULT NULL,
  `numerorooriginalvenda` int(10) unsigned DEFAULT NULL,
  `datapagamentoroantecipado` date DEFAULT NULL,
  `sinalbrutoroantecipado` varchar(1) DEFAULT NULL,
  `valorbrutoroantecipado` decimal(10,2) DEFAULT NULL,
  `numerounicorovendageradorajuste` varchar(22) DEFAULT NULL,
  `numeroroajuste` int(10) unsigned DEFAULT NULL,
  `datapagamentoajuste` date DEFAULT NULL,
  `sinalajustedebito` varchar(1) DEFAULT NULL,
  `valorajustedebito` decimal(10,2) DEFAULT NULL,
  `sinalvalorcompensado` varchar(1) DEFAULT NULL,
  `valorcompensado` decimal(10,2) DEFAULT NULL,
  `sinalsaldoroantecipado` varchar(1) DEFAULT NULL,
  `valorsaldoroantecipado` decimal(10,2) DEFAULT NULL,
  `usocielo` varchar(9) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_cielo_ro_debito_antecipacao_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_cielo_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_cielo_ro_replace`
--

DROP TABLE IF EXISTS `conn_item_cielo_ro_replace`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_cielo_ro_replace` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `arquivo` varchar(100) DEFAULT NULL,
  `linha` decimal(10,0) DEFAULT NULL,
  `opcaoextrato` int(11) DEFAULT NULL,
  `dataprocessamento` date DEFAULT NULL,
  `periodoinicial` date DEFAULT NULL,
  `periodofinal` date DEFAULT NULL,
  `sequencia` int(11) DEFAULT NULL,
  `estabelecimentosubmissor` int(11) DEFAULT NULL,
  `numerounicoro` varchar(22) DEFAULT NULL,
  `dataapresentacao` date DEFAULT NULL,
  `datapagamento` date DEFAULT NULL,
  `datacaptura` date DEFAULT NULL,
  `tipotransacao` int(11) DEFAULT NULL,
  `bandeira` int(11) DEFAULT NULL,
  `idnovoproduto` int(11) DEFAULT NULL,
  `valorbruto` decimal(10,2) DEFAULT NULL,
  `comissao` decimal(10,2) DEFAULT NULL,
  `valorliquido` decimal(10,2) DEFAULT NULL,
  `percentual_comissao_decimal` decimal(5,4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_1` (`numerounicoro`,`opcaoextrato`,`estabelecimentosubmissor`,`dataapresentacao`,`dataprocessamento`,`periodoinicial`,`periodofinal`,`sequencia`)
) ENGINE=InnoDB AUTO_INCREMENT=55689 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_cielo_saldo_header`
--

DROP TABLE IF EXISTS `conn_item_cielo_saldo_header`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_cielo_saldo_header` (
  `item_id` int(10) unsigned NOT NULL,
  `tipo` varchar(50) NOT NULL,
  `data_arquivo` date NOT NULL,
  `data_base` date NOT NULL,
  `razao_social` varchar(200) NOT NULL,
  `grupo` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_cielo_saldo_header_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_cielo_saldo_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_cielo_saldo_line`
--

DROP TABLE IF EXISTS `conn_item_cielo_saldo_line`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_cielo_saldo_line` (
  `item_id` int(10) unsigned NOT NULL,
  `file_type` varchar(100) NOT NULL,
  `register_type` int(10) unsigned NOT NULL,
  `masterid` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  KEY `masterid` (`masterid`),
  CONSTRAINT `conn_item_cielo_saldo_line_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `vooo_prod_backend`.`connection_item` (`item_id`),
  CONSTRAINT `conn_item_cielo_saldo_line_ibfk_2` FOREIGN KEY (`masterid`) REFERENCES `conn_item_cielo_saldo_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_cielo_saldo_resumo`
--

DROP TABLE IF EXISTS `conn_item_cielo_saldo_resumo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_cielo_saldo_resumo` (
  `item_id` int(10) unsigned NOT NULL,
  `estabelecimento_submissor` int(10) unsigned NOT NULL,
  `debito_bruto` decimal(10,2) NOT NULL,
  `debito_liquido` decimal(10,2) NOT NULL,
  `vista_real_bruto` decimal(10,2) NOT NULL,
  `vista_real_liquido` decimal(10,2) NOT NULL,
  `vista_dolar_bruto` decimal(10,2) NOT NULL,
  `vista_dolar_liquido` decimal(10,2) NOT NULL,
  `antecipado_arv_bruto` decimal(10,2) NOT NULL,
  `antecipado_arv_liquido` decimal(10,2) NOT NULL,
  `antecipado_sessao_bruto` decimal(10,2) NOT NULL,
  `antecipado_sessao_liquido` decimal(10,2) NOT NULL,
  `rotativo_bruto` decimal(10,2) NOT NULL,
  `rotativo_liquido` decimal(10,2) NOT NULL,
  `parcelado_bruto` decimal(10,2) NOT NULL,
  `parcelado_liquido` decimal(10,2) NOT NULL,
  `parcelado_negociado` decimal(10,2) NOT NULL,
  `parcelado_saldo` decimal(10,2) NOT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_cielo_saldo_resumo_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_cielo_saldo_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_cielo_saldo_ro_parcelado`
--

DROP TABLE IF EXISTS `conn_item_cielo_saldo_ro_parcelado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_cielo_saldo_ro_parcelado` (
  `item_id` int(10) unsigned NOT NULL,
  `estabelecimento_submissor` int(10) unsigned NOT NULL,
  `numero_ro` int(10) unsigned NOT NULL,
  `bandeira` varchar(23) NOT NULL,
  `quantidade_cv` decimal(5,0) NOT NULL,
  `data_deposito` date NOT NULL,
  `data_vencimento` date NOT NULL,
  `data_liberacao` date NOT NULL,
  `valor_bruto` decimal(10,2) NOT NULL,
  `valor_liquido` decimal(10,2) NOT NULL,
  `total_pr` decimal(5,0) NOT NULL,
  `total_pd` decimal(5,0) NOT NULL,
  `valor_negociado` decimal(10,2) NOT NULL,
  `total_neg` decimal(5,0) NOT NULL,
  `saldo` decimal(10,2) NOT NULL,
  `descricao` varchar(33) NOT NULL,
  `conceito` varchar(9) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_cielo_saldo_ro_parcelado_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_cielo_saldo_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_cielo_saldo_ro_rotativo`
--

DROP TABLE IF EXISTS `conn_item_cielo_saldo_ro_rotativo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_cielo_saldo_ro_rotativo` (
  `item_id` int(10) unsigned NOT NULL,
  `estabelecimento_submissor` int(10) unsigned NOT NULL,
  `numero_ro` int(10) unsigned NOT NULL,
  `descricao` varchar(33) NOT NULL,
  `quantidade_cv` decimal(5,0) NOT NULL,
  `data_deposito` date NOT NULL,
  `data_captura` date NOT NULL,
  `data_pagamento` date NOT NULL,
  `moeda` varchar(5) NOT NULL,
  `valor_bruto` decimal(10,2) NOT NULL,
  `valor_liquido` decimal(10,2) NOT NULL,
  `bandeira` varchar(23) NOT NULL,
  `sec` varchar(3) DEFAULT NULL,
  `conceito` varchar(9) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_cielo_saldo_ro_rotativo_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_cielo_saldo_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_cielo_trailer`
--

DROP TABLE IF EXISTS `conn_item_cielo_trailer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_cielo_trailer` (
  `item_id` int(10) unsigned NOT NULL,
  `regtypeid` int(10) unsigned DEFAULT NULL,
  `totalregistro` int(10) unsigned DEFAULT NULL,
  `usocielo` varchar(238) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_cielo_trailer_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_cielo_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_cielo_v15_conta_recebimento_recebiveis`
--

DROP TABLE IF EXISTS `conn_item_cielo_v15_conta_recebimento_recebiveis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_cielo_v15_conta_recebimento_recebiveis` (
  `item_id` int(10) unsigned NOT NULL,
  `tipo_registro` char(1) DEFAULT NULL,
  `banco` smallint(5) unsigned DEFAULT NULL,
  `agencia` smallint(5) unsigned DEFAULT NULL,
  `conta` varchar(20) DEFAULT NULL,
  `sinal_valor_deposito` char(1) DEFAULT NULL,
  `valor_deposito` decimal(12,2) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_cielo_v15_conta_recebimento_recebiveis_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_cielo_v15_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_cielo_v15_detalhe_negociacoes_recebiveis`
--

DROP TABLE IF EXISTS `conn_item_cielo_v15_detalhe_negociacoes_recebiveis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_cielo_v15_detalhe_negociacoes_recebiveis` (
  `item_id` int(10) unsigned NOT NULL,
  `tipo_registro` char(1) DEFAULT NULL,
  `data_negociacao` date DEFAULT NULL,
  `data_vencimento_original` date DEFAULT NULL,
  `cpf_cnpj` varchar(15) DEFAULT NULL,
  `bandeira` smallint(5) unsigned DEFAULT NULL,
  `tipo_liquidacao` smallint(5) unsigned DEFAULT NULL,
  `sinal_valor_bruto` char(1) DEFAULT NULL,
  `valor_bruto` decimal(10,2) DEFAULT NULL,
  `sinal_valor_liquido` char(1) DEFAULT NULL,
  `valor_liquido` decimal(10,2) DEFAULT NULL,
  `taxa_efetiva` decimal(9,3) DEFAULT NULL,
  `instituicao_financeira` varchar(50) DEFAULT NULL,
  `num_estabelecimento` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_cielo_v15_detalhe_negociacoes_recebiveis_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_cielo_v15_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_cielo_v15_detalhe_pix`
--

DROP TABLE IF EXISTS `conn_item_cielo_v15_detalhe_pix`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_cielo_v15_detalhe_pix` (
  `item_id` int(10) unsigned NOT NULL,
  `tipo_registro` char(1) DEFAULT NULL,
  `estabelecimento_submissor` bigint(20) unsigned DEFAULT NULL,
  `tipo_transacao` smallint(5) unsigned DEFAULT NULL,
  `data_transacao` date DEFAULT NULL,
  `hora_transacao` time DEFAULT NULL,
  `id_pix` varchar(36) DEFAULT NULL,
  `nsu` varchar(6) DEFAULT NULL,
  `data_pagamento` date DEFAULT NULL,
  `sinal_valor_bruto` char(1) DEFAULT NULL,
  `valor_bruto` decimal(10,2) DEFAULT NULL,
  `sinal_taxa_admin` char(1) DEFAULT NULL,
  `valor_taxa_admin` decimal(10,2) DEFAULT NULL,
  `sinal_valor_liquido` char(1) DEFAULT NULL,
  `valor_liquido` decimal(10,2) DEFAULT NULL,
  `banco` smallint(5) unsigned DEFAULT NULL,
  `agencia` smallint(5) unsigned DEFAULT NULL,
  `conta` varchar(20) DEFAULT NULL,
  `data_captura` date DEFAULT NULL,
  `taxa_admin` decimal(10,2) DEFAULT NULL,
  `tarifa_admin` decimal(10,2) DEFAULT NULL,
  `meio_captura` smallint(5) unsigned DEFAULT NULL,
  `numero_terminal` varchar(8) DEFAULT NULL,
  `data_transacao_original` date DEFAULT NULL,
  `hora_transacao_original` time DEFAULT NULL,
  `id_pix_original` varchar(36) DEFAULT NULL,
  `ind_troco_saque` char(1) DEFAULT NULL,
  `origem_ajuste` varchar(6) DEFAULT NULL,
  `ind_transferencia_auto` char(1) DEFAULT NULL,
  `status_transferencia_conta_pgto` char(2) DEFAULT NULL,
  `data_pagamento_conta_cielo` date DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  KEY `idx_estabelecimento_submissor` (`estabelecimento_submissor`,`data_pagamento`),
  CONSTRAINT `conn_item_cielo_v15_detalhe_pix_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_cielo_v15_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_cielo_v15_header`
--

DROP TABLE IF EXISTS `conn_item_cielo_v15_header`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_cielo_v15_header` (
  `item_id` int(10) unsigned NOT NULL,
  `tipo_registro` smallint(6) DEFAULT NULL,
  `estabelecimento_matriz` bigint(20) unsigned DEFAULT NULL,
  `data_processamento` date DEFAULT NULL,
  `periodo_inicial` date DEFAULT NULL,
  `periodo_final` date DEFAULT NULL,
  `sequencia` int(10) unsigned DEFAULT NULL,
  `empresa_adquirente` varchar(5) DEFAULT NULL,
  `opcao_extrato` smallint(5) unsigned DEFAULT NULL,
  `transmissao` char(1) DEFAULT NULL,
  `caixa_postal` varchar(20) DEFAULT NULL,
  `versao_layout` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  KEY `idx_estabelecimento_matriz` (`estabelecimento_matriz`),
  CONSTRAINT `conn_item_cielo_v15_header_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_cielo_v15_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_cielo_v15_line`
--

DROP TABLE IF EXISTS `conn_item_cielo_v15_line`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_cielo_v15_line` (
  `item_id` int(10) unsigned NOT NULL,
  `register_type` char(2) DEFAULT NULL,
  `file_type` smallint(6) DEFAULT NULL,
  `masterid` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  KEY `masterid` (`masterid`),
  CONSTRAINT `conn_item_cielo_v15_line_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `vooo_prod_backend`.`connection_item` (`item_id`),
  CONSTRAINT `conn_item_cielo_v15_line_ibfk_2` FOREIGN KEY (`masterid`) REFERENCES `conn_item_cielo_v15_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_cielo_v15_reserva_financeira`
--

DROP TABLE IF EXISTS `conn_item_cielo_v15_reserva_financeira`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_cielo_v15_reserva_financeira` (
  `item_id` int(10) unsigned NOT NULL,
  `tipo_registro` char(1) DEFAULT NULL,
  `estabelecimento_submissor` bigint(20) unsigned DEFAULT NULL,
  `cpf_cnpj_titular` varchar(15) DEFAULT NULL,
  `bandeira` smallint(3) DEFAULT NULL,
  `matriz_pagamento` bigint(20) unsigned DEFAULT NULL,
  `sinal_valor_reserva` char(1) DEFAULT NULL,
  `valor_reserva` decimal(10,2) DEFAULT NULL,
  `chave_ur` varchar(100) DEFAULT NULL,
  `data_vencimento_original` date DEFAULT NULL,
  `num_estabelecimento_pagamento` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  KEY `idx_estabelecimento_submissor` (`estabelecimento_submissor`),
  CONSTRAINT `conn_item_cielo_v15_reserva_financeira_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_cielo_v15_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_cielo_v15_resumo_negociacoes_recebiveis`
--

DROP TABLE IF EXISTS `conn_item_cielo_v15_resumo_negociacoes_recebiveis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_cielo_v15_resumo_negociacoes_recebiveis` (
  `item_id` int(10) unsigned NOT NULL,
  `tipo_registro` char(1) DEFAULT NULL,
  `data_negociacao` date DEFAULT NULL,
  `data_pagamento` date DEFAULT NULL,
  `cpf_cnpj` varchar(15) DEFAULT NULL,
  `prazo_medio` smallint(5) unsigned DEFAULT NULL,
  `taxa_nominal` decimal(10,3) DEFAULT NULL,
  `sinal_valor_bruto` char(1) DEFAULT NULL,
  `valor_bruto` decimal(15,2) DEFAULT NULL,
  `sinal_valor_liquido` char(1) DEFAULT NULL,
  `valor_liquido` decimal(10,2) DEFAULT NULL,
  `num_negociacao` bigint(20) unsigned DEFAULT NULL,
  `forma_pagamento` char(3) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_cielo_v15_resumo_negociacoes_recebiveis_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_cielo_v15_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_cielo_v15_trailer`
--

DROP TABLE IF EXISTS `conn_item_cielo_v15_trailer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_cielo_v15_trailer` (
  `item_id` int(10) unsigned NOT NULL,
  `tipo_registro` smallint(6) DEFAULT NULL,
  `total_registros` int(10) unsigned DEFAULT NULL,
  `sinal_valor_liquido` char(1) DEFAULT NULL,
  `valor_liquido` decimal(10,2) DEFAULT NULL,
  `qtd_registros_e` int(10) unsigned DEFAULT NULL,
  `sinal_valor_bruto_soma_registros` char(1) DEFAULT NULL,
  `valor_bruto_soma_registros` decimal(10,2) DEFAULT NULL,
  `sinal_valor_liquido_cedidos` char(1) DEFAULT NULL,
  `valor_liquido_cedidos` decimal(10,2) DEFAULT NULL,
  `sinal_valor_liquido_garantias` char(1) DEFAULT NULL,
  `valor_liquido_garantias` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_cielo_v15_trailer_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_cielo_v15_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_cielo_v15_ur_agenda`
--

DROP TABLE IF EXISTS `conn_item_cielo_v15_ur_agenda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_cielo_v15_ur_agenda` (
  `item_id` int(10) unsigned NOT NULL,
  `tipo_registro` char(1) DEFAULT NULL,
  `estabelecimento_submissor` bigint(20) unsigned DEFAULT NULL,
  `cpf_cnpj_titular` varchar(15) DEFAULT NULL,
  `cpf_cnpj_movimento` varchar(15) DEFAULT NULL,
  `cpf_cnpj_recebedor` varchar(15) DEFAULT NULL,
  `bandeira` smallint(3) DEFAULT NULL,
  `tipo_liquidacao` char(3) DEFAULT NULL,
  `matriz_pagamento` bigint(20) unsigned DEFAULT NULL,
  `status_pagamento` smallint(6) DEFAULT NULL,
  `sinal_valor_bruto` char(1) DEFAULT NULL,
  `valor_bruto` decimal(10,2) DEFAULT NULL,
  `sinal_taxa_adm` char(1) DEFAULT NULL,
  `taxa_adm` decimal(10,2) DEFAULT NULL,
  `sinal_valor_liquido` char(1) DEFAULT NULL,
  `valor_liquido` decimal(10,2) DEFAULT NULL,
  `banco` smallint(5) unsigned DEFAULT NULL,
  `agencia` smallint(5) unsigned DEFAULT NULL,
  `conta` varchar(20) DEFAULT NULL,
  `digito_conta` char(1) DEFAULT NULL,
  `qtd_lancamentos_ur` int(10) unsigned DEFAULT NULL,
  `tipo_lancamento` smallint(5) unsigned DEFAULT NULL,
  `chave_ur` varchar(100) DEFAULT NULL,
  `tipo_lancamento_original` smallint(5) unsigned DEFAULT NULL,
  `tipo_antecipacao` smallint(5) unsigned DEFAULT NULL,
  `numero_antecipacao` int(10) unsigned DEFAULT NULL,
  `taxa_antecipacao` decimal(10,2) DEFAULT NULL,
  `data_pagamento` date DEFAULT NULL,
  `data_envio_banco` date DEFAULT NULL,
  `data_vencimento_original` date DEFAULT NULL,
  `num_estabelecimento_pagamento` bigint(20) unsigned DEFAULT NULL,
  `ind_lancamento_pendente` char(1) DEFAULT NULL,
  `ind_reenvio_pagamento` char(1) DEFAULT NULL,
  `ind_negociacao_gravame` char(1) DEFAULT NULL,
  `cpf_cnpj_negociador` varchar(15) DEFAULT NULL,
  `ind_saldo_aberto` char(1) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  KEY `idx_estabelecimento_submissor` (`estabelecimento_submissor`,`data_pagamento`),
  CONSTRAINT `conn_item_cielo_v15_ur_agenda_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_cielo_v15_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_cielo_v15_ur_analitico`
--

DROP TABLE IF EXISTS `conn_item_cielo_v15_ur_analitico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_cielo_v15_ur_analitico` (
  `item_id` int(10) unsigned NOT NULL,
  `tipo_registro` char(1) DEFAULT NULL,
  `estabelecimento_submissor` bigint(20) unsigned DEFAULT NULL,
  `bandeira_liquidacao` smallint(3) DEFAULT NULL,
  `tipo_liquidacao` char(3) DEFAULT NULL,
  `parcela` smallint(6) DEFAULT NULL,
  `numero_parcelas` smallint(6) DEFAULT NULL,
  `codigo_autorizacao` varchar(6) DEFAULT NULL,
  `tipo_lancamento` smallint(5) unsigned DEFAULT NULL,
  `chave_ur` varchar(100) DEFAULT NULL,
  `codigo_transacao` varchar(22) DEFAULT NULL,
  `codigo_ajuste` char(4) DEFAULT NULL,
  `forma_pagamento` smallint(5) unsigned DEFAULT NULL,
  `ind_cielo_promo` char(1) DEFAULT NULL,
  `ind_dcc` char(1) DEFAULT NULL,
  `ind_comissao_minima` char(1) DEFAULT NULL,
  `ind_recebimento_auto` char(1) DEFAULT NULL,
  `ind_taxa_zero` char(1) DEFAULT NULL,
  `ind_transacao_rejeitada` char(1) DEFAULT NULL,
  `ind_venda_tardia` char(1) DEFAULT NULL,
  `bin_cartao` varchar(6) DEFAULT NULL,
  `numero_cartao` varchar(4) DEFAULT NULL,
  `nsu` int(10) unsigned DEFAULT NULL,
  `num_nota_fiscal` int(10) unsigned DEFAULT NULL,
  `tid` varchar(20) DEFAULT NULL,
  `codigo_pedido` varchar(20) DEFAULT NULL,
  `taxa_mdr` decimal(10,2) DEFAULT NULL,
  `taxa_recebimento` decimal(10,2) DEFAULT NULL,
  `taxa_venda` decimal(10,2) DEFAULT NULL,
  `sinal_valor_venda` char(1) DEFAULT NULL,
  `valor_venda` decimal(10,2) DEFAULT NULL,
  `sinal_valor_bruto` char(1) DEFAULT NULL,
  `valor_bruto` decimal(10,2) DEFAULT NULL,
  `sinal_valor_liquido` char(1) DEFAULT NULL,
  `valor_liquido` decimal(10,2) DEFAULT NULL,
  `sinal_valor_comissao` char(1) DEFAULT NULL,
  `valor_comissao` decimal(10,2) DEFAULT NULL,
  `sinal_valor_comissao_minima` char(1) DEFAULT NULL,
  `valor_comissao_minima` decimal(10,2) DEFAULT NULL,
  `sinal_valor_entrada` char(1) DEFAULT NULL,
  `valor_entrada` decimal(10,2) DEFAULT NULL,
  `sinal_valor_tarifa` char(1) DEFAULT NULL,
  `valor_tarifa` decimal(10,2) DEFAULT NULL,
  `sinal_valor_receba_rapido` char(1) DEFAULT NULL,
  `valor_recebimento_auto` decimal(10,2) DEFAULT NULL,
  `sinal_valor_saque` char(1) DEFAULT NULL,
  `valor_saque` decimal(10,2) DEFAULT NULL,
  `sinal_valor_tarifa_embarque` char(1) DEFAULT NULL,
  `valor_tafifa_embarque` decimal(10,2) DEFAULT NULL,
  `sinal_valor_pendente` char(1) DEFAULT NULL,
  `valor_pendente` decimal(10,2) DEFAULT NULL,
  `sinal_valor_divida` char(1) DEFAULT NULL,
  `valor_divida` decimal(10,2) DEFAULT NULL,
  `sinal_valor_cobrado` char(1) DEFAULT NULL,
  `valor_cobrado` decimal(10,2) DEFAULT NULL,
  `sinal_valor_tarifa_admin` char(1) DEFAULT NULL,
  `valor_tarifa_admin` decimal(10,2) DEFAULT NULL,
  `sinal_valor_cielo_promo` char(1) DEFAULT NULL,
  `valor_cielo_promo` decimal(10,2) DEFAULT NULL,
  `sinal_valor_dcc` char(1) DEFAULT NULL,
  `valor_dcc` decimal(10,2) DEFAULT NULL,
  `hora_transacao` time DEFAULT NULL,
  `grupo_cartoes` char(2) DEFAULT NULL,
  `cpf_cnpj_recebedor` varchar(15) DEFAULT NULL,
  `bandeira_autorizacao` smallint(3) DEFAULT NULL,
  `codigo_unico_venda` varchar(15) DEFAULT NULL,
  `codigo_original_venda` varchar(15) DEFAULT NULL,
  `codigo_unico_ajuste` varchar(15) DEFAULT NULL,
  `meio_captura` smallint(6) DEFAULT NULL,
  `numero_terminal` int(10) unsigned DEFAULT NULL,
  `tipo_lancamento_original` smallint(5) unsigned DEFAULT NULL,
  `tipo_transacao` smallint(5) unsigned DEFAULT NULL,
  `numero_antecipacao` int(10) unsigned DEFAULT NULL,
  `data_autorizacao` date DEFAULT NULL,
  `data_captura` date DEFAULT NULL,
  `data_movimento` date DEFAULT NULL,
  `data_movimento_original_venda` date DEFAULT NULL,
  `numero_lote` int(10) unsigned DEFAULT NULL,
  `numero_transacao` bigint(20) unsigned DEFAULT NULL,
  `motivo_rejeicao` varchar(3) DEFAULT NULL,
  `data_vencimento_original` date DEFAULT NULL,
  `matriz_pagamento` bigint(20) unsigned DEFAULT NULL,
  `tipo_cartao` char(2) DEFAULT NULL,
  `origen_cartao` char(1) DEFAULT NULL,
  `ind_mdr_tp_cartao` char(1) DEFAULT NULL,
  `ind_parcelado_cliente` char(1) DEFAULT NULL,
  `banco` smallint(5) unsigned DEFAULT NULL,
  `agencia` smallint(5) unsigned DEFAULT NULL,
  `conta` varchar(20) DEFAULT NULL,
  `digito_conta` char(1) DEFAULT NULL,
  `arn` varchar(24) DEFAULT NULL,
  `ind_negocio_recebivel` char(1) DEFAULT NULL,
  `tipo_captura` smallint(5) unsigned DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  KEY `idx_estabelecimento_submissor` (`estabelecimento_submissor`,`data_movimento`),
  KEY `idx_chave_ur` (`chave_ur`),
  CONSTRAINT `conn_item_cielo_v15_ur_analitico_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_cielo_v15_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_cielo_v2_conta_recebimentos`
--

DROP TABLE IF EXISTS `conn_item_cielo_v2_conta_recebimentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_cielo_v2_conta_recebimentos` (
  `item_id` int(10) unsigned NOT NULL,
  `regtypeid` int(10) unsigned DEFAULT NULL,
  `banco` varchar(4) DEFAULT NULL,
  `agencia` varchar(5) DEFAULT NULL,
  `conta` varchar(20) DEFAULT NULL,
  `sinaldeposito` varchar(1) DEFAULT NULL,
  `valordepositado` decimal(13,2) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_cielo_v2_conta_recebimentos_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_cielo_v2_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_cielo_v2_cv`
--

DROP TABLE IF EXISTS `conn_item_cielo_v2_cv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_cielo_v2_cv` (
  `item_id` int(10) unsigned NOT NULL,
  `regtypeid` int(10) unsigned DEFAULT NULL,
  `estabelecimentosubmissor` int(10) unsigned DEFAULT NULL,
  `numeroRO` int(10) unsigned DEFAULT NULL,
  `numerocartao` varchar(19) DEFAULT NULL,
  `datavendaajuste` date DEFAULT NULL,
  `sinalcompraparcela` varchar(1) DEFAULT NULL,
  `valorcompraparcela` decimal(13,2) DEFAULT NULL,
  `parcela` int(10) unsigned DEFAULT NULL,
  `totalparcelas` int(10) unsigned DEFAULT NULL,
  `motivorejeicao` varchar(3) DEFAULT NULL,
  `codigoautorizacao` varchar(6) DEFAULT NULL,
  `TID` varchar(20) DEFAULT NULL,
  `NSU` varchar(6) DEFAULT NULL,
  `valorcomplementar` decimal(13,2) DEFAULT NULL,
  `numerodigitoscartao` int(10) unsigned DEFAULT NULL,
  `valortotalvenda` decimal(13,2) DEFAULT NULL,
  `valorproximaparcela` decimal(13,2) DEFAULT NULL,
  `numeronotafiscal` varchar(20) DEFAULT NULL,
  `tipocartao` varchar(2) DEFAULT NULL,
  `grupocartao` varchar(2) DEFAULT NULL,
  `cartaoemitidoexterior` int(10) unsigned DEFAULT NULL,
  `numerologicoterminal` varchar(8) DEFAULT NULL,
  `identificadortaxaembarque` varchar(2) DEFAULT NULL,
  `referenciacodigopedido` varchar(20) DEFAULT NULL,
  `horatransacao` time DEFAULT NULL,
  `numerounicotransacao` varchar(29) DEFAULT NULL,
  `indicadorcielopremia` varchar(1) DEFAULT NULL,
  `modoentradacartao` varchar(2) DEFAULT NULL,
  `codigovenda` varchar(15) DEFAULT NULL,
  `codigointerno` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_cielo_v2_cv_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_cielo_v2_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_cielo_v2_detalhe_negociacoes_recebiveis`
--

DROP TABLE IF EXISTS `conn_item_cielo_v2_detalhe_negociacoes_recebiveis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_cielo_v2_detalhe_negociacoes_recebiveis` (
  `item_id` int(10) unsigned NOT NULL,
  `regtypeid` int(10) unsigned DEFAULT NULL,
  `datanegociacao` date DEFAULT NULL,
  `datapagamento` date DEFAULT NULL,
  `documento` varchar(14) DEFAULT NULL,
  `bandeira` decimal(3,0) DEFAULT NULL,
  `tipoliquidacao` varchar(4) DEFAULT NULL,
  `sinalvalorbruto` varchar(1) DEFAULT NULL,
  `valorbruto` decimal(13,2) DEFAULT NULL,
  `sinalvalorliquido` varchar(1) DEFAULT NULL,
  `valorliquido` decimal(13,2) DEFAULT NULL,
  `taxaefetiva` decimal(5,2) DEFAULT NULL,
  `instituicaofinanceira` varchar(50) DEFAULT NULL,
  `codigooperacao` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_cielo_v2_detalhe_negociacoes_recebiveis_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_cielo_v2_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_cielo_v2_header`
--

DROP TABLE IF EXISTS `conn_item_cielo_v2_header`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_cielo_v2_header` (
  `item_id` int(10) unsigned NOT NULL,
  `regtypeid` int(10) unsigned DEFAULT NULL,
  `estabelecimentomatriz` decimal(11,0) DEFAULT NULL,
  `dataprocessamento` date DEFAULT NULL,
  `periodoinicial` date DEFAULT NULL,
  `periodofinal` date DEFAULT NULL,
  `sequencia` int(10) unsigned DEFAULT NULL,
  `opcaoextrato` int(10) unsigned DEFAULT NULL,
  `empresaadquirente` varchar(50) DEFAULT NULL,
  `transmissao` varchar(1) DEFAULT NULL,
  `caixapostal` varchar(20) DEFAULT NULL,
  `versaolayout` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_cielo_v2_header_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_cielo_v2_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_cielo_v2_line`
--

DROP TABLE IF EXISTS `conn_item_cielo_v2_line`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_cielo_v2_line` (
  `item_id` int(10) unsigned NOT NULL,
  `registertype` int(10) unsigned DEFAULT NULL,
  `filetype` int(10) unsigned DEFAULT NULL,
  `fileline` varchar(350) DEFAULT NULL,
  `masterid` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  KEY `masterid` (`masterid`),
  CONSTRAINT `conn_item_cielo_v2_line_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `vooo_prod_backend`.`connection_item` (`item_id`),
  CONSTRAINT `conn_item_cielo_v2_line_ibfk_2` FOREIGN KEY (`masterid`) REFERENCES `conn_item_cielo_v2_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_cielo_v2_operacao_recebiveis`
--

DROP TABLE IF EXISTS `conn_item_cielo_v2_operacao_recebiveis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_cielo_v2_operacao_recebiveis` (
  `item_id` int(10) unsigned NOT NULL,
  `regtypeid` int(10) unsigned DEFAULT NULL,
  `estabelecimento` decimal(10,0) DEFAULT NULL,
  `codigooperacao` varchar(20) DEFAULT NULL,
  `documentotitular` varchar(14) DEFAULT NULL,
  `documentorecebedor` varchar(14) DEFAULT NULL,
  `documentotitularconta` varchar(14) DEFAULT NULL,
  `datapagamento` date DEFAULT NULL,
  `datavencimentooriginal` date DEFAULT NULL,
  `tipooperacao` varchar(2) DEFAULT NULL,
  `bandeira` varchar(3) DEFAULT NULL,
  `tipoliquidacao` varchar(3) DEFAULT NULL,
  `sinalvaloroperacao` varchar(1) DEFAULT NULL,
  `valoroperacao` decimal(17,2) DEFAULT NULL,
  `codigomoeda` decimal(3,0) DEFAULT NULL,
  `banco` varchar(10) DEFAULT NULL,
  `agencia` varchar(10) DEFAULT NULL,
  `conta` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_cielo_v2_operacao_recebiveis_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_cielo_v2_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_cielo_v2_pix`
--

DROP TABLE IF EXISTS `conn_item_cielo_v2_pix`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_cielo_v2_pix` (
  `item_id` int(10) unsigned NOT NULL,
  `regtypeid` int(10) unsigned DEFAULT NULL,
  `estabelecimento` decimal(10,0) DEFAULT NULL,
  `tipotransacao` decimal(2,0) DEFAULT NULL,
  `datatransacao` date DEFAULT NULL,
  `horatransacao` time DEFAULT NULL,
  `idpix` varchar(36) DEFAULT NULL,
  `nsudoc` varchar(6) DEFAULT NULL,
  `datapagamento` date DEFAULT NULL,
  `sinalvalorbruto` varchar(1) DEFAULT NULL,
  `valorbruto` decimal(13,2) DEFAULT NULL,
  `sinaltaxaadministrativa` varchar(1) DEFAULT NULL,
  `valortaxaadministrativa` decimal(13,2) DEFAULT NULL,
  `sinalvalorliquido` varchar(1) DEFAULT NULL,
  `valorliquido` decimal(13,2) DEFAULT NULL,
  `banco` varchar(4) DEFAULT NULL,
  `agencia` varchar(5) DEFAULT NULL,
  `conta` varchar(20) DEFAULT NULL,
  `datacaptura` date DEFAULT NULL,
  `taxaadministrativa` decimal(13,2) DEFAULT NULL,
  `tarifaadministrativa` decimal(13,2) DEFAULT NULL,
  `meiocaptura` decimal(2,0) DEFAULT NULL,
  `numlogicoterminal` varchar(8) DEFAULT NULL,
  `datatransacaooriginal` date DEFAULT NULL,
  `horatransacaooriginal` time DEFAULT NULL,
  `idpixoriginal` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_cielo_v2_pix_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_cielo_v2_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_cielo_v2_resumo_negociacoes_recebiveis`
--

DROP TABLE IF EXISTS `conn_item_cielo_v2_resumo_negociacoes_recebiveis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_cielo_v2_resumo_negociacoes_recebiveis` (
  `item_id` int(10) unsigned NOT NULL,
  `regtypeid` int(10) unsigned DEFAULT NULL,
  `datanegociacao` date DEFAULT NULL,
  `datapagamento` date DEFAULT NULL,
  `documento` varchar(14) DEFAULT NULL,
  `prazomedio` decimal(3,0) DEFAULT NULL,
  `taxanominal` decimal(5,2) DEFAULT NULL,
  `sinalvalorbruto` varchar(1) DEFAULT NULL,
  `valorbruto` decimal(13,2) DEFAULT NULL,
  `sinalvalorliquido` varchar(1) DEFAULT NULL,
  `valorliquido` decimal(13,2) DEFAULT NULL,
  `codigooperacao` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_cielo_v2_resumo_negociacoes_recebiveis_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_cielo_v2_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_cielo_v2_ro`
--

DROP TABLE IF EXISTS `conn_item_cielo_v2_ro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_cielo_v2_ro` (
  `item_id` int(10) unsigned NOT NULL,
  `regtypeid` int(10) unsigned DEFAULT NULL,
  `estabelecimentosubmissor` int(10) unsigned DEFAULT NULL,
  `numeroRO` int(10) unsigned DEFAULT NULL,
  `parcela` varchar(2) DEFAULT NULL,
  `filler` varchar(2) DEFAULT NULL,
  `plano` varchar(2) DEFAULT NULL,
  `tipotransacao` int(10) unsigned DEFAULT NULL,
  `dataapresentacao` date DEFAULT NULL,
  `datapagamento` date DEFAULT NULL,
  `datavencimentooriginal` date DEFAULT NULL,
  `sinalvalorbruto` varchar(1) DEFAULT NULL,
  `valorbruto` decimal(13,2) DEFAULT NULL,
  `sinalcomissao` varchar(1) DEFAULT NULL,
  `valorcomissao` decimal(13,2) DEFAULT NULL,
  `sinalrejeitado` varchar(1) DEFAULT NULL,
  `valorrejeitado` decimal(13,2) DEFAULT NULL,
  `sinalliquido` varchar(1) DEFAULT NULL,
  `valorliquido` decimal(13,2) DEFAULT NULL,
  `banco` int(10) unsigned DEFAULT NULL,
  `agencia` int(10) unsigned DEFAULT NULL,
  `contacorrente` varchar(15) DEFAULT NULL,
  `statuspagamento` int(10) unsigned DEFAULT NULL,
  `qtdeCVaceitos` int(10) unsigned DEFAULT NULL,
  `idvelhoproduto` varchar(2) DEFAULT NULL,
  `indicadorrecebarapido` varchar(1) DEFAULT NULL,
  `indicadortaxaminima` varchar(1) DEFAULT NULL,
  `qtdeCV` int(10) unsigned DEFAULT NULL,
  `revendaaceleracao` varchar(1) DEFAULT NULL,
  `datacaptura` date DEFAULT NULL,
  `origemajuste` varchar(2) DEFAULT NULL,
  `valorcomplementar` decimal(13,0) DEFAULT NULL,
  `tipoantecipacao` varchar(1) DEFAULT NULL,
  `correspondenciaantecipacao` int(10) unsigned DEFAULT NULL,
  `sinalantecipacaobruto` varchar(1) DEFAULT NULL,
  `valorantecipacaobruto` decimal(13,2) DEFAULT NULL,
  `bandeira` int(10) unsigned DEFAULT NULL,
  `numerounicoro` varchar(22) DEFAULT NULL,
  `percentalcomissao` int(10) unsigned DEFAULT NULL,
  `tarifa` int(10) unsigned DEFAULT NULL,
  `taxagarantia` int(10) unsigned DEFAULT NULL,
  `taxarecebarapido` decimal(4,2) DEFAULT NULL,
  `meiocaptura` varchar(2) DEFAULT NULL,
  `numerologicoterminal` varchar(8) DEFAULT NULL,
  `idnovoproduto` int(10) unsigned DEFAULT NULL,
  `matrizpagamento` decimal(10,0) DEFAULT NULL,
  `reenviopagamento` varchar(1) DEFAULT NULL,
  `conceitoaplicado` varchar(1) DEFAULT NULL,
  `grupocartao` varchar(2) DEFAULT NULL,
  `percentual_comissao_decimal` decimal(5,4) DEFAULT NULL,
  `numerounicoro_15` varchar(15) DEFAULT NULL,
  `indicadorsaldoaberto` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_cielo_v2_ro_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_cielo_v2_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_cielo_v2_trailer`
--

DROP TABLE IF EXISTS `conn_item_cielo_v2_trailer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_cielo_v2_trailer` (
  `item_id` int(10) unsigned NOT NULL,
  `regtypeid` int(10) unsigned DEFAULT NULL,
  `totalregistro` int(10) unsigned DEFAULT NULL,
  `sinalvalorliquidoCV` varchar(1) DEFAULT NULL,
  `valorliquidoCV` decimal(17,2) DEFAULT NULL,
  `quantidadetotalCV` decimal(11,0) DEFAULT NULL,
  `sinalvalorbrutosomaRO` varchar(1) DEFAULT NULL,
  `valorbrutosomaRO` decimal(17,2) DEFAULT NULL,
  `sinalvalorbrutoantecipadoRO` varchar(1) DEFAULT NULL,
  `valorbrutoantecipadoRO` decimal(17,2) DEFAULT NULL,
  `sinalsomavalornegociado` varchar(1) DEFAULT NULL,
  `somavalornegociado` decimal(17,2) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_cielo_v2_trailer_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_cielo_v2_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_clip_control`
--

DROP TABLE IF EXISTS `conn_item_clip_control`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_clip_control` (
  `item_id` int(10) unsigned NOT NULL,
  `initial_date` date DEFAULT NULL,
  `final_date` date DEFAULT NULL,
  `inserted` decimal(10,0) NOT NULL,
  `duplicated` decimal(10,0) NOT NULL,
  `rejected` decimal(10,0) NOT NULL,
  `status` decimal(1,0) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  KEY `ix_vooo_prod_rawdata_conn_item_clip_control_initial_date` (`initial_date`),
  KEY `ix_vooo_prod_rawdata_conn_item_clip_control_final_date` (`final_date`),
  CONSTRAINT `conn_item_clip_control_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_clip_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_clip_line`
--

DROP TABLE IF EXISTS `conn_item_clip_line`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_clip_line` (
  `item_id` int(10) unsigned NOT NULL,
  `register_type` varchar(15) DEFAULT NULL,
  `masterid` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  KEY `masterid` (`masterid`),
  CONSTRAINT `conn_item_clip_line_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `vooo_prod_backend`.`connection_item` (`item_id`),
  CONSTRAINT `conn_item_clip_line_ibfk_2` FOREIGN KEY (`masterid`) REFERENCES `conn_item_clip_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_clip_transaction`
--

DROP TABLE IF EXISTS `conn_item_clip_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_clip_transaction` (
  `item_id` int(10) unsigned NOT NULL,
  `transaction_id` varchar(50) NOT NULL,
  `date` date NOT NULL,
  `clip_created_at` datetime NOT NULL,
  `psp` varchar(20) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `clave_autorizacion` varchar(50) DEFAULT NULL,
  `bin` decimal(6,0) NOT NULL,
  `last4` decimal(4,0) NOT NULL,
  `status_code` decimal(3,0) NOT NULL,
  `order_id` varchar(50) NOT NULL,
  `msi` decimal(2,0) NOT NULL,
  `clip_reader` varchar(20) NOT NULL,
  `status` varchar(1) NOT NULL,
  PRIMARY KEY (`item_id`),
  KEY `ix_vooo_prod_rawdata_conn_item_clip_transaction_transaction_id` (`transaction_id`),
  CONSTRAINT `conn_item_clip_transaction_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_clip_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_cloudwalk_header`
--

DROP TABLE IF EXISTS `conn_item_cloudwalk_header`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_cloudwalk_header` (
  `item_id` int(10) unsigned NOT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_cloudwalk_header_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_cloudwalk_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_cloudwalk_line`
--

DROP TABLE IF EXISTS `conn_item_cloudwalk_line`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_cloudwalk_line` (
  `item_id` int(10) unsigned NOT NULL,
  `registertype` varchar(50) DEFAULT NULL,
  `masterid` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  KEY `masterid` (`masterid`),
  CONSTRAINT `conn_item_cloudwalk_line_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `vooo_prod_backend`.`connection_item` (`item_id`),
  CONSTRAINT `conn_item_cloudwalk_line_ibfk_2` FOREIGN KEY (`masterid`) REFERENCES `conn_item_cloudwalk_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_cloudwalk_sale`
--

DROP TABLE IF EXISTS `conn_item_cloudwalk_sale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_cloudwalk_sale` (
  `item_id` int(10) unsigned NOT NULL,
  `started_at` datetime DEFAULT NULL,
  `finished_at` datetime DEFAULT NULL,
  `nsu` varchar(128) DEFAULT NULL,
  `card_brand` varchar(32) DEFAULT NULL,
  `card_holder_name` varchar(64) DEFAULT NULL,
  `card_first_digits` varchar(16) DEFAULT NULL,
  `card_last_digits` varchar(16) DEFAULT NULL,
  `card_expiration_date` varchar(16) DEFAULT NULL,
  `type` varchar(16) DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `status` varchar(16) DEFAULT NULL,
  `acquirer` varchar(16) DEFAULT NULL,
  `installment_type` varchar(16) DEFAULT NULL,
  `installment_quantity` int(11) DEFAULT NULL,
  `nsu_reference` varchar(64) DEFAULT NULL,
  `status_reason` varchar(16) DEFAULT NULL,
  `capture_method` varchar(16) DEFAULT NULL,
  `payment_method` varchar(16) DEFAULT NULL,
  `transaction_id` varchar(64) DEFAULT NULL,
  `authorization_code` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_cloudwalk_sale_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_cloudwalk_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_cybersource_control`
--

DROP TABLE IF EXISTS `conn_item_cybersource_control`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_cybersource_control` (
  `item_id` int(10) unsigned NOT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `check_status` decimal(1,0) DEFAULT NULL,
  `registers` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  KEY `ix_vooo_prod_rawdata_conn_item_cybersource_control_end_date` (`end_date`),
  KEY `ix_vooo_prod_rawdata_conn_item_cybersource_control_start_date` (`start_date`),
  CONSTRAINT `conn_item_cybersource_control_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_cybersource_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_cybersource_line`
--

DROP TABLE IF EXISTS `conn_item_cybersource_line`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_cybersource_line` (
  `item_id` int(10) unsigned NOT NULL,
  `register_type` varchar(15) DEFAULT NULL,
  `masterid` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  KEY `masterid` (`masterid`),
  CONSTRAINT `conn_item_cybersource_line_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `vooo_prod_backend`.`connection_item` (`item_id`),
  CONSTRAINT `conn_item_cybersource_line_ibfk_2` FOREIGN KEY (`masterid`) REFERENCES `conn_item_cybersource_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_cybersource_transaction`
--

DROP TABLE IF EXISTS `conn_item_cybersource_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_cybersource_transaction` (
  `item_id` int(10) unsigned NOT NULL,
  `request_id` varchar(30) DEFAULT NULL,
  `request_date` date DEFAULT NULL,
  `request_time` time DEFAULT NULL,
  `merchant_id` varchar(30) DEFAULT NULL,
  `re_lag` varchar(50) DEFAULT NULL,
  `bill_to_country` varchar(30) DEFAULT NULL,
  `bill_to_customer_id` varchar(30) DEFAULT NULL,
  `bill_to_first_name` varchar(50) DEFAULT NULL,
  `bill_to_last_name` varchar(50) DEFAULT NULL,
  `signal` varchar(1) DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `authorization_code` varchar(10) DEFAULT NULL,
  `bin_number` decimal(6,0) DEFAULT NULL,
  `network_transaction_id` varchar(20) DEFAULT NULL,
  `number_of_installments` decimal(2,0) DEFAULT NULL,
  `payment_processor` varchar(20) DEFAULT NULL,
  `request_amount_currency_code` varchar(10) DEFAULT NULL,
  `transaction_reference_number` varchar(60) DEFAULT NULL,
  `account_suffix` varchar(10) DEFAULT NULL,
  `card_type` varchar(20) DEFAULT NULL,
  `merchant_reference_number` decimal(50,0) DEFAULT NULL,
  `status` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  KEY `ix_vooo_prod_rawdata_conn_item_cybersource_transaction_t_dbbe` (`transaction_reference_number`),
  KEY `ix_vooo_prod_rawdata_conn_item_cybersource_transaction_r_865b` (`request_id`),
  KEY `ix_vooo_prod_rawdata_conn_item_cybersource_transaction_r_900b` (`merchant_reference_number`,`amount`),
  KEY `ix_vooo_prod_rawdata_conn_item_cybersource_transaction_r_1000b` (`bill_to_customer_id`),
  CONSTRAINT `conn_item_cybersource_transaction_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_cybersource_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_entrepay_aj`
--

DROP TABLE IF EXISTS `conn_item_entrepay_aj`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_entrepay_aj` (
  `item_id` int(10) unsigned NOT NULL,
  `codigo_registro` varchar(2) DEFAULT NULL,
  `cnpj_loja` decimal(15,0) DEFAULT NULL,
  `nsu_transacao_original` varchar(12) DEFAULT NULL,
  `data_transacao_original` date DEFAULT NULL,
  `num_da_parcela` decimal(2,0) DEFAULT NULL,
  `nsu_transacao` decimal(12,0) DEFAULT NULL,
  `data_transacao_ajuste` date DEFAULT NULL,
  `hora_transacao_ajuste` time DEFAULT NULL,
  `tipo_lancamento` decimal(1,0) DEFAULT NULL,
  `data_lancamento` date DEFAULT NULL,
  `meio_captura` decimal(1,0) DEFAULT NULL,
  `tipo_ajuste` decimal(1,0) DEFAULT NULL,
  `codigo_ajuste` decimal(3,0) DEFAULT NULL,
  `descricao_ajuste` varchar(30) DEFAULT NULL,
  `valor_bruto` decimal(9,2) DEFAULT NULL,
  `valor_desconto` decimal(9,2) DEFAULT NULL,
  `valor_liquido` decimal(9,2) DEFAULT NULL,
  `banco` decimal(3,0) DEFAULT NULL,
  `agencia` decimal(6,0) DEFAULT NULL,
  `conta_corrente` varchar(11) DEFAULT NULL,
  `num_cartao` varchar(19) DEFAULT NULL,
  `codigo_bandeira` varchar(3) DEFAULT NULL,
  `codigo_produto` varchar(3) DEFAULT NULL,
  `valor_taxa_antecipacao` decimal(9,2) DEFAULT NULL,
  `valor_liquido_antecipado` decimal(9,2) DEFAULT NULL,
  `id_envelope` decimal(18,0) DEFAULT NULL,
  `trace` decimal(6,0) DEFAULT NULL,
  `conta_pagamento` decimal(20,0) DEFAULT NULL,
  `codigo_pedido` varchar(30) DEFAULT NULL,
  `identif_financeiro_payware` decimal(18,0) DEFAULT NULL,
  `identif_antecipacao_payware` decimal(18,0) DEFAULT NULL,
  `identif_pagamento_payware` decimal(18,0) DEFAULT NULL,
  `codigo_comercio_payware` decimal(18,0) DEFAULT NULL,
  `codigo_filial_payware` decimal(18,0) DEFAULT NULL,
  `merchant_category_code` decimal(4,0) DEFAULT NULL,
  `segreg_adquirente_payware` decimal(9,0) DEFAULT NULL,
  `codigo_autorizacao` varchar(12) DEFAULT NULL,
  `nsu_terminal` varchar(12) DEFAULT NULL,
  `filler` varchar(20) DEFAULT NULL,
  `num_seq` decimal(6,0) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_entrepay_aj_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_entrepay_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_entrepay_cc`
--

DROP TABLE IF EXISTS `conn_item_entrepay_cc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_entrepay_cc` (
  `item_id` int(10) unsigned NOT NULL,
  `codigo_registro` varchar(2) DEFAULT NULL,
  `cnpj_loja` decimal(15,0) DEFAULT NULL,
  `nsu_transacao_original` varchar(12) DEFAULT NULL,
  `data_transacao_original` date DEFAULT NULL,
  `num_da_parcela` decimal(2,0) DEFAULT NULL,
  `nsu_transacao` decimal(12,0) DEFAULT NULL,
  `data_transacao_ajuste` date DEFAULT NULL,
  `hora_transacao_ajuste` time DEFAULT NULL,
  `meio_captura` decimal(1,0) DEFAULT NULL,
  `id_envelope` decimal(18,0) DEFAULT NULL,
  `trace` decimal(6,0) DEFAULT NULL,
  `codigo_pedido` varchar(30) DEFAULT NULL,
  `identif_financeiro_payware` decimal(18,0) DEFAULT NULL,
  `identif_antecipacao_payware` decimal(18,0) DEFAULT NULL,
  `identif_pagamento_payware` decimal(18,0) DEFAULT NULL,
  `codigo_comercio_payware` decimal(18,0) DEFAULT NULL,
  `codigo_filial_payware` decimal(18,0) DEFAULT NULL,
  `merchant_category_code` decimal(4,0) DEFAULT NULL,
  `segreg_adquirente_payware` decimal(9,0) DEFAULT NULL,
  `valor_bruto_cancelamento` decimal(9,2) DEFAULT NULL,
  `valor_bruto_parcela_cancelamento` decimal(9,2) DEFAULT NULL,
  `valor_desconto_cancelamento` decimal(9,2) DEFAULT NULL,
  `valor_liquido_cancelamento` decimal(9,2) DEFAULT NULL,
  `valor_bruto_original` decimal(9,2) DEFAULT NULL,
  `valor_liquido_original` decimal(9,2) DEFAULT NULL,
  `valor_comissao_original` decimal(9,2) DEFAULT NULL,
  `num_parcelas` decimal(2,0) DEFAULT NULL,
  `codigo_autorizacao` varchar(12) DEFAULT NULL,
  `nsu_terminal` varchar(12) DEFAULT NULL,
  `filler` varchar(20) DEFAULT NULL,
  `num_seq` decimal(6,0) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_entrepay_cc_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_entrepay_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_entrepay_cv`
--

DROP TABLE IF EXISTS `conn_item_entrepay_cv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_entrepay_cv` (
  `item_id` int(10) unsigned NOT NULL,
  `codigo_registro` varchar(2) DEFAULT NULL,
  `cnpj_loja` decimal(15,0) DEFAULT NULL,
  `nsu_transacao` decimal(12,0) DEFAULT NULL,
  `data_transacao` date DEFAULT NULL,
  `hora_transacao` time DEFAULT NULL,
  `tipo_lancamento` decimal(1,0) DEFAULT NULL,
  `data_pagamento` date DEFAULT NULL,
  `tipo_produto` varchar(1) DEFAULT NULL,
  `meio_captura` decimal(1,0) DEFAULT NULL,
  `valor_bruto` decimal(9,2) DEFAULT NULL,
  `valor_desconto` decimal(9,2) DEFAULT NULL,
  `valor_liquido` decimal(9,2) DEFAULT NULL,
  `num_cartao` varchar(19) DEFAULT NULL,
  `num_da_parcela` decimal(2,0) DEFAULT NULL,
  `num_parcelas` decimal(2,0) DEFAULT NULL,
  `nsu_parcela` varchar(12) DEFAULT NULL,
  `valor_bruto_parcela` decimal(9,2) DEFAULT NULL,
  `valor_desconto_parcela` decimal(9,2) DEFAULT NULL,
  `valor_liquido_parcela` decimal(9,2) DEFAULT NULL,
  `banco` decimal(3,0) DEFAULT NULL,
  `agencia` decimal(6,0) DEFAULT NULL,
  `conta_corrente` varchar(11) DEFAULT NULL,
  `codigo_autorizacao` varchar(12) DEFAULT NULL,
  `codigo_bandeira` varchar(3) DEFAULT NULL,
  `codigo_produto` varchar(3) DEFAULT NULL,
  `valor_taxa_interchange` decimal(9,2) DEFAULT NULL,
  `valor_taxa_administracao` decimal(9,2) DEFAULT NULL,
  `valor_taxa_interchange_parcela` decimal(9,2) DEFAULT NULL,
  `valor_taxa_administracao_parcela` decimal(9,2) DEFAULT NULL,
  `valor_taxa_multifronteira` decimal(9,2) DEFAULT NULL,
  `valor_taxa_antecipacao` decimal(9,2) DEFAULT NULL,
  `valor_liquido_antecipado` decimal(9,2) DEFAULT NULL,
  `tipo_transacao` decimal(2,0) DEFAULT NULL,
  `codigo_pedido` varchar(30) DEFAULT NULL,
  `sigla_pais` varchar(3) DEFAULT NULL,
  `numero_terminal` varchar(8) DEFAULT NULL,
  `id_envelope` decimal(18,0) DEFAULT NULL,
  `trace` decimal(6,0) DEFAULT NULL,
  `conta_pagamento` decimal(20,0) DEFAULT NULL,
  `identif_financeiro_payware` decimal(18,0) DEFAULT NULL,
  `identif_antecipacao_payware` decimal(18,0) DEFAULT NULL,
  `identif_pagamento_payware` decimal(18,0) DEFAULT NULL,
  `codigo_comercio_payware` decimal(18,0) DEFAULT NULL,
  `codigo_filial_payware` decimal(18,0) DEFAULT NULL,
  `merchant_category_code` decimal(4,0) DEFAULT NULL,
  `segreg_adquirente_payware` decimal(9,0) DEFAULT NULL,
  `nsu_terminal` varchar(12) DEFAULT NULL,
  `reservado` varchar(28) DEFAULT NULL,
  `num_seq` decimal(6,0) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  KEY `idx_cnpj_nsu` (`cnpj_loja`,`nsu_transacao`),
  CONSTRAINT `conn_item_entrepay_cv_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_entrepay_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_entrepay_header`
--

DROP TABLE IF EXISTS `conn_item_entrepay_header`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_entrepay_header` (
  `item_id` int(10) unsigned NOT NULL,
  `codigo_registro` varchar(2) DEFAULT NULL,
  `versao_layout` varchar(6) DEFAULT NULL,
  `data_geracao` date DEFAULT NULL,
  `hora_geracao` time DEFAULT NULL,
  `id_movimento` decimal(6,0) DEFAULT NULL,
  `nome_adminstradora` varchar(30) DEFAULT NULL,
  `identif_remetente` decimal(4,0) DEFAULT NULL,
  `codigo_ec` decimal(9,0) DEFAULT NULL,
  `tipo_processamento` varchar(1) DEFAULT NULL,
  `num_seq` decimal(6,0) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_entrepay_header_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_entrepay_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_entrepay_header_lote`
--

DROP TABLE IF EXISTS `conn_item_entrepay_header_lote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_entrepay_header_lote` (
  `item_id` int(10) unsigned NOT NULL,
  `codigo_registro` varchar(2) DEFAULT NULL,
  `data_movimento` date DEFAULT NULL,
  `moeda` varchar(2) DEFAULT NULL,
  `num_seq` decimal(6,0) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_entrepay_header_lote_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_entrepay_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_entrepay_line`
--

DROP TABLE IF EXISTS `conn_item_entrepay_line`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_entrepay_line` (
  `item_id` int(10) unsigned NOT NULL,
  `register_type` char(2) DEFAULT NULL,
  `masterid` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  KEY `masterid` (`masterid`),
  CONSTRAINT `conn_item_entrepay_line_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `vooo_prod_backend`.`connection_item` (`item_id`),
  CONSTRAINT `conn_item_entrepay_line_ibfk_2` FOREIGN KEY (`masterid`) REFERENCES `conn_item_entrepay_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_entrepay_trailer`
--

DROP TABLE IF EXISTS `conn_item_entrepay_trailer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_entrepay_trailer` (
  `item_id` int(10) unsigned NOT NULL,
  `codigo_registro` varchar(2) DEFAULT NULL,
  `total_geral` decimal(6,0) DEFAULT NULL,
  `num_seq` decimal(6,0) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_entrepay_trailer_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_entrepay_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_entrepay_trailer_lote`
--

DROP TABLE IF EXISTS `conn_item_entrepay_trailer_lote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_entrepay_trailer_lote` (
  `item_id` int(10) unsigned NOT NULL,
  `codigo_registro` varchar(2) DEFAULT NULL,
  `qtd_registros_transacao` decimal(6,0) DEFAULT NULL,
  `total_creditos` decimal(12,2) DEFAULT NULL,
  `num_seq` decimal(6,0) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_entrepay_trailer_lote_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_entrepay_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_fortbrasil_aj`
--

DROP TABLE IF EXISTS `conn_item_fortbrasil_aj`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_fortbrasil_aj` (
  `item_id` int(10) unsigned NOT NULL,
  `codigo_registro` varchar(2) NOT NULL,
  `identificacao_loja` varchar(15) DEFAULT NULL,
  `nsu_transacao_original` int(12) DEFAULT NULL,
  `data_transacao_original` date DEFAULT NULL,
  `numero_parcela` int(2) DEFAULT NULL,
  `nsu_transacao` int(12) DEFAULT NULL,
  `data_transacao_aj` date DEFAULT NULL,
  `hora_transacao_aj` time DEFAULT NULL,
  `tipo_lancamento` int(1) DEFAULT NULL,
  `data_lancamento` date DEFAULT NULL,
  `meio_captura_ajuste` int(1) DEFAULT NULL,
  `tipo_ajuste` int(1) DEFAULT NULL,
  `codigo_ajuste` int(4) DEFAULT NULL,
  `descricao_motivo_ajuste` varchar(30) DEFAULT NULL,
  `valor_bruto` decimal(10,2) DEFAULT NULL,
  `valor_desconto_comissao` decimal(10,2) DEFAULT NULL,
  `valor_liquido` decimal(10,2) DEFAULT NULL,
  `banco` varchar(3) DEFAULT NULL,
  `agencia` varchar(6) DEFAULT NULL,
  `conta` varchar(11) DEFAULT NULL,
  `numero_cartao_transacao_original` varchar(19) DEFAULT NULL,
  `codigo_bandeira` varchar(3) DEFAULT NULL,
  `codigo_produto` varchar(3) DEFAULT NULL,
  `nseq` int(6) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_fortbrasil_aj_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_fortbrasil_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_fortbrasil_cc`
--

DROP TABLE IF EXISTS `conn_item_fortbrasil_cc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_fortbrasil_cc` (
  `item_id` int(10) unsigned NOT NULL,
  `codigo_registro` varchar(2) NOT NULL,
  `identificacao_loja` varchar(15) DEFAULT NULL,
  `nsu_transacao_original` int(12) DEFAULT NULL,
  `data_transacao_original` date DEFAULT NULL,
  `numero_parcela` int(2) DEFAULT NULL,
  `nsu_transacao` int(12) DEFAULT NULL,
  `data_transacao` date DEFAULT NULL,
  `hora_transacao` time DEFAULT NULL,
  `meio_captura` int(1) DEFAULT NULL,
  `nseq` int(6) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_fortbrasil_cc_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_fortbrasil_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_fortbrasil_cp`
--

DROP TABLE IF EXISTS `conn_item_fortbrasil_cp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_fortbrasil_cp` (
  `item_id` int(10) unsigned NOT NULL,
  `codigo_registro` varchar(2) NOT NULL,
  `identificacao_loja` varchar(15) DEFAULT NULL,
  `nsu` int(12) DEFAULT NULL,
  `data_transacao` date DEFAULT NULL,
  `hora_transacao` time DEFAULT NULL,
  `tipo_lancamento` int(1) DEFAULT NULL,
  `data_lancamento` date DEFAULT NULL,
  `meio_captura` int(1) DEFAULT NULL,
  `valor_bruto_pagamento` decimal(10,2) DEFAULT NULL,
  `valor_desconto` decimal(10,2) DEFAULT NULL,
  `valor_liquido_pagamento` decimal(10,2) DEFAULT NULL,
  `numero_cartao` varchar(19) DEFAULT NULL,
  `numero_meios_pagamento` int(2) DEFAULT NULL,
  `meio_pagamento` int(1) DEFAULT NULL,
  `sequencial_meio_pagamento` int(2) DEFAULT NULL,
  `valor_meio_pagamento` decimal(10,2) DEFAULT NULL,
  `banco` varchar(3) DEFAULT NULL,
  `agencia` varchar(6) DEFAULT NULL,
  `conta` varchar(11) DEFAULT NULL,
  `codigo_autorizacao` int(12) DEFAULT NULL,
  `nseq` int(6) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_fortbrasil_cp_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_fortbrasil_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_fortbrasil_cv`
--

DROP TABLE IF EXISTS `conn_item_fortbrasil_cv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_fortbrasil_cv` (
  `item_id` int(10) unsigned NOT NULL,
  `codigo_registro` varchar(2) NOT NULL,
  `identificacao_loja` varchar(15) DEFAULT NULL,
  `nsu` int(12) DEFAULT NULL,
  `data_transacao` date DEFAULT NULL,
  `hora_transacao` time DEFAULT NULL,
  `tipo_lancamento` int(1) DEFAULT NULL,
  `data_lancamento` date DEFAULT NULL,
  `tipo_produto` varchar(1) DEFAULT NULL,
  `meio_captura` int(1) DEFAULT NULL,
  `valor_bruto_venda` decimal(10,2) DEFAULT NULL,
  `valor_desconto` decimal(10,2) DEFAULT NULL,
  `valor_liquido_venda` decimal(10,2) DEFAULT NULL,
  `numero_cartao` varchar(19) DEFAULT NULL,
  `numero_parcela` int(2) DEFAULT NULL,
  `numero_total_parcelas` int(2) DEFAULT NULL,
  `nsu_parcela` int(12) DEFAULT NULL,
  `valor_bruto_parcela` decimal(10,2) DEFAULT NULL,
  `valor_desconto_parcela` decimal(10,2) DEFAULT NULL,
  `valor_liquido_parcela` decimal(10,2) DEFAULT NULL,
  `banco` varchar(3) DEFAULT NULL,
  `agencia` varchar(6) DEFAULT NULL,
  `conta` varchar(11) DEFAULT NULL,
  `codigo_autorizacao` int(12) DEFAULT NULL,
  `codigo_bandeira` varchar(3) DEFAULT NULL,
  `codigo_produto` varchar(3) DEFAULT NULL,
  `nseq` int(6) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  KEY `idx_item_fortbrasil_cv` (`numero_parcela`,`nsu`,`identificacao_loja`),
  CONSTRAINT `conn_item_fortbrasil_cv_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_fortbrasil_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_fortbrasil_header_arquivo`
--

DROP TABLE IF EXISTS `conn_item_fortbrasil_header_arquivo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_fortbrasil_header_arquivo` (
  `item_id` int(10) unsigned NOT NULL,
  `codigo_registro` varchar(2) NOT NULL,
  `versao_layout` varchar(6) DEFAULT NULL,
  `data_geracao_arquivo` date DEFAULT NULL,
  `hora_geracao_arquivo` time DEFAULT NULL,
  `id_movimento` int(6) DEFAULT NULL,
  `nome_administradora` varchar(30) DEFAULT NULL,
  `identificacao_remetente` int(4) DEFAULT NULL,
  `identificacao_destinatario` int(6) DEFAULT NULL,
  `tipo_processamento` varchar(1) DEFAULT NULL,
  `nseq_registro` int(6) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_fortbrasil_header_arquivo_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_fortbrasil_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_fortbrasil_header_lote`
--

DROP TABLE IF EXISTS `conn_item_fortbrasil_header_lote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_fortbrasil_header_lote` (
  `item_id` int(10) unsigned NOT NULL,
  `codigo_registro` varchar(2) NOT NULL,
  `data_movimento` date DEFAULT NULL,
  `identificacao_moeda` varchar(2) DEFAULT NULL,
  `nseq` int(6) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_fortbrasil_header_lote_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_fortbrasil_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_fortbrasil_line`
--

DROP TABLE IF EXISTS `conn_item_fortbrasil_line`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_fortbrasil_line` (
  `item_id` int(10) unsigned NOT NULL,
  `registertype` varchar(2) NOT NULL,
  `masterid` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  KEY `masterid` (`masterid`),
  CONSTRAINT `conn_item_fortbrasil_line_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `vooo_prod_backend`.`connection_item` (`item_id`),
  CONSTRAINT `conn_item_fortbrasil_line_ibfk_2` FOREIGN KEY (`masterid`) REFERENCES `conn_item_fortbrasil_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_fortbrasil_trailer_arquivo`
--

DROP TABLE IF EXISTS `conn_item_fortbrasil_trailer_arquivo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_fortbrasil_trailer_arquivo` (
  `item_id` int(10) unsigned NOT NULL,
  `codigo_registro` varchar(2) NOT NULL,
  `total_geral_registros` int(6) DEFAULT NULL,
  `nseq` int(6) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_fortbrasil_trailer_arquivo_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_fortbrasil_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_fortbrasil_trailer_lote`
--

DROP TABLE IF EXISTS `conn_item_fortbrasil_trailer_lote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_fortbrasil_trailer_lote` (
  `item_id` int(10) unsigned NOT NULL,
  `codigo_registro` varchar(2) NOT NULL,
  `total_registros_transacao` int(6) DEFAULT NULL,
  `total_valores_creditos` decimal(10,2) DEFAULT NULL,
  `nseq` int(6) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_fortbrasil_trailer_lote_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_fortbrasil_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_general_site_description`
--

DROP TABLE IF EXISTS `conn_item_general_site_description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_general_site_description` (
  `item_id` int(10) unsigned NOT NULL,
  `column_0` varchar(20) DEFAULT NULL,
  `column_1` varchar(20) DEFAULT NULL,
  `column_2` varchar(20) DEFAULT NULL,
  `column_3` varchar(20) DEFAULT NULL,
  `column_4` varchar(20) DEFAULT NULL,
  `column_5` varchar(20) DEFAULT NULL,
  `column_6` varchar(20) DEFAULT NULL,
  `column_7` varchar(20) DEFAULT NULL,
  `column_8` varchar(20) DEFAULT NULL,
  `column_9` varchar(20) DEFAULT NULL,
  `column_10` varchar(20) DEFAULT NULL,
  `column_11` varchar(20) DEFAULT NULL,
  `column_12` varchar(20) DEFAULT NULL,
  `column_13` varchar(20) DEFAULT NULL,
  `column_14` varchar(20) DEFAULT NULL,
  `column_15` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_general_site_description_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_general_site_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_general_site_header`
--

DROP TABLE IF EXISTS `conn_item_general_site_header`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_general_site_header` (
  `item_id` int(10) unsigned NOT NULL,
  `file_type` varchar(20) DEFAULT NULL,
  `provider` varchar(20) DEFAULT NULL,
  `main_establishment_code` varchar(20) DEFAULT NULL,
  `generation_date` date DEFAULT NULL,
  `generation_time` time DEFAULT NULL,
  `registers` decimal(10,0) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  KEY `idx_general_header_1` (`generation_date`),
  KEY `idx_general_header_2` (`start_date`),
  KEY `idx_general_header_3` (`end_date`),
  CONSTRAINT `conn_item_general_site_header_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_general_site_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_general_site_line`
--

DROP TABLE IF EXISTS `conn_item_general_site_line`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_general_site_line` (
  `item_id` int(10) unsigned NOT NULL,
  `register_type` varchar(20) NOT NULL,
  `masterid` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  KEY `masterid` (`masterid`),
  CONSTRAINT `conn_item_general_site_line_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `vooo_prod_backend`.`connection_item` (`item_id`),
  CONSTRAINT `conn_item_general_site_line_ibfk_2` FOREIGN KEY (`masterid`) REFERENCES `conn_item_general_site_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_general_site_transaction`
--

DROP TABLE IF EXISTS `conn_item_general_site_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_general_site_transaction` (
  `item_id` int(10) unsigned NOT NULL,
  `sales_date` date DEFAULT NULL,
  `sales_time` time DEFAULT NULL,
  `settlement_date` date DEFAULT NULL,
  `total_installments` decimal(2,0) DEFAULT NULL,
  `installment` decimal(2,0) DEFAULT NULL,
  `payment_method` varchar(30) DEFAULT NULL,
  `card_flag` varchar(30) DEFAULT NULL,
  `authorization_code` varchar(64) DEFAULT NULL,
  `provider_code` varchar(64) DEFAULT NULL,
  `gross_value` decimal(10,2) DEFAULT NULL,
  `net_value` decimal(10,2) DEFAULT NULL,
  `establishment_code` varchar(20) DEFAULT NULL,
  `card_number` varchar(20) DEFAULT NULL,
  `terminal` varchar(20) DEFAULT NULL,
  `channel` varchar(20) DEFAULT NULL,
  `description` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_general_site_transaction_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_general_site_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_generic_header`
--

DROP TABLE IF EXISTS `conn_item_generic_header`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_generic_header` (
  `item_id` int(10) unsigned NOT NULL,
  `layout_id` int(10) unsigned DEFAULT NULL,
  `user_id` int(10) unsigned DEFAULT NULL,
  `client_id` int(10) unsigned DEFAULT NULL,
  `provider_id` smallint(5) unsigned DEFAULT NULL,
  `extract_type` smallint(5) unsigned DEFAULT NULL,
  `source_type` smallint(5) unsigned DEFAULT NULL,
  `upload_at` date DEFAULT NULL,
  `original_filename` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  KEY `layout_id` (`layout_id`),
  CONSTRAINT `conn_item_generic_header_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_generic_line` (`item_id`),
  CONSTRAINT `conn_item_generic_header_ibfk_2` FOREIGN KEY (`layout_id`) REFERENCES `vooo_prod_backend`.`generic_layout` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_generic_line`
--

DROP TABLE IF EXISTS `conn_item_generic_line`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_generic_line` (
  `item_id` int(10) unsigned NOT NULL,
  `registertype` int(10) unsigned DEFAULT NULL,
  `masterid` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  KEY `masterid` (`masterid`),
  CONSTRAINT `conn_item_generic_line_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `vooo_prod_backend`.`connection_item` (`item_id`),
  CONSTRAINT `conn_item_generic_line_ibfk_2` FOREIGN KEY (`masterid`) REFERENCES `conn_item_generic_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_generic_transactions`
--

DROP TABLE IF EXISTS `conn_item_generic_transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_generic_transactions` (
  `item_id` int(10) unsigned NOT NULL,
  `sales_code` varchar(50) DEFAULT NULL,
  `payment_code` varchar(50) DEFAULT NULL,
  `provider_code` varchar(64) DEFAULT NULL,
  `nsu_code` varchar(64) DEFAULT NULL,
  `authorization_code` varchar(64) DEFAULT NULL,
  `tid_code` varchar(64) DEFAULT NULL,
  `terminal_id` varchar(30) DEFAULT NULL,
  `sales_date` date DEFAULT NULL,
  `sales_time` time DEFAULT NULL,
  `settlement_date` date DEFAULT NULL,
  `payment_method` varchar(64) DEFAULT NULL,
  `card_flag` varchar(64) DEFAULT NULL,
  `payment_channel` varchar(64) DEFAULT NULL,
  `payment_installments` decimal(2,0) DEFAULT NULL,
  `installment` decimal(2,0) DEFAULT NULL,
  `credit_card_mask` varchar(20) DEFAULT NULL,
  `contract_code` varchar(15) DEFAULT NULL,
  `gross_value` decimal(10,2) DEFAULT NULL,
  `net_value` decimal(10,2) DEFAULT NULL,
  `fee_value` decimal(10,2) DEFAULT NULL,
  `fee_rate` decimal(5,4) DEFAULT NULL,
  `extra_field01` varchar(64) DEFAULT NULL,
  `extra_field02` varchar(64) DEFAULT NULL,
  `extra_field03` varchar(64) DEFAULT NULL,
  `extra_field04` varchar(64) DEFAULT NULL,
  `extra_field05` varchar(64) DEFAULT NULL,
  `extra_field06` varchar(64) DEFAULT NULL,
  `extra_field07` varchar(64) DEFAULT NULL,
  `extra_field08` varchar(64) DEFAULT NULL,
  `extra_field09` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_generic_transactions_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_generic_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_getnet_ajuste`
--

DROP TABLE IF EXISTS `conn_item_getnet_ajuste`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_getnet_ajuste` (
  `item_id` int(10) unsigned NOT NULL,
  `tiporegistro` decimal(1,0) DEFAULT NULL,
  `codigo_ec` decimal(15,0) DEFAULT NULL,
  `num_rv_ajustado` decimal(9,0) DEFAULT NULL,
  `data_rv` date DEFAULT NULL,
  `id_ajuste` varchar(20) DEFAULT NULL,
  `brancos` varchar(1) DEFAULT NULL,
  `sinal_valor_ajuste` varchar(1) DEFAULT NULL,
  `valor_ajuste` decimal(12,2) DEFAULT NULL,
  `motivo_ajuste` varchar(2) DEFAULT NULL,
  `data_carta` date DEFAULT NULL,
  `num_cartao` varchar(19) DEFAULT NULL,
  `num_rv_original` decimal(9,0) DEFAULT NULL,
  `nsu_adquirente` decimal(12,0) DEFAULT NULL,
  `data_transacao_original` date DEFAULT NULL,
  `id_tipo_pagamento` varchar(2) DEFAULT NULL,
  `num_terminal` varchar(8) DEFAULT NULL,
  `data_pagamento_rv` date DEFAULT NULL,
  `moeda` decimal(3,0) DEFAULT NULL,
  `valor_comissao_venda` decimal(12,2) DEFAULT NULL,
  `id_tipo_prox_conteudo` varchar(2) DEFAULT NULL,
  `conteudo_dinamico` varchar(118) DEFAULT NULL,
  `data_pagamento_original` date DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_getnet_ajuste_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_getnet_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_getnet_antecipacao`
--

DROP TABLE IF EXISTS `conn_item_getnet_antecipacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_getnet_antecipacao` (
  `item_id` int(10) unsigned NOT NULL,
  `tiporegistro` decimal(1,0) DEFAULT NULL,
  `codigo_ec` decimal(15,0) DEFAULT NULL,
  `data_operacao` date DEFAULT NULL,
  `data_credito` date DEFAULT NULL,
  `num_operacao` decimal(15,0) DEFAULT NULL,
  `valor_bruto_antecipado` decimal(12,2) DEFAULT NULL,
  `valor_taxa_antecipacao` decimal(12,2) DEFAULT NULL,
  `valor_liquido_antecipado` decimal(12,2) DEFAULT NULL,
  `taxa_ao_mes_operacao` decimal(11,7) DEFAULT NULL,
  `codigo_ec_centralizador` decimal(15,0) DEFAULT NULL,
  `banco_domicilio_bancario` decimal(3,0) DEFAULT NULL,
  `ag_domicilio_bancario` decimal(6,0) DEFAULT NULL,
  `cc_domicilio_bancario` decimal(11,0) DEFAULT NULL,
  `canal_antecipacao` varchar(3) DEFAULT NULL,
  `id_tipo_pagamento` varchar(2) DEFAULT NULL,
  `metadado` varchar(2) DEFAULT NULL,
  `conta_pagamento` decimal(20,0) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_getnet_antecipacao_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_getnet_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_getnet_cv`
--

DROP TABLE IF EXISTS `conn_item_getnet_cv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_getnet_cv` (
  `item_id` int(10) unsigned NOT NULL,
  `tiporegistro` decimal(1,0) DEFAULT NULL,
  `codigo_ec` decimal(15,0) DEFAULT NULL,
  `num_rv` decimal(9,0) DEFAULT NULL,
  `nsu_adquirente` decimal(12,0) DEFAULT NULL,
  `data_transacao` date DEFAULT NULL,
  `hora_transacao` time DEFAULT NULL,
  `num_cartao` varchar(19) DEFAULT NULL,
  `valor_transacao` decimal(12,2) DEFAULT NULL,
  `valor_saque` decimal(12,2) DEFAULT NULL,
  `valor_taxa_servico` decimal(12,2) DEFAULT NULL,
  `num_parcelas` decimal(2,0) DEFAULT NULL,
  `num_da_parcela` decimal(2,0) DEFAULT NULL,
  `valor_parcela` decimal(12,2) DEFAULT NULL,
  `data_pagamento` date DEFAULT NULL,
  `codigo_autorizacao` varchar(10) DEFAULT NULL,
  `forma_captura` varchar(3) DEFAULT NULL,
  `status_transacao` varchar(1) DEFAULT NULL,
  `codigo_ec_centralizador` decimal(15,0) DEFAULT NULL,
  `num_terminal` varchar(8) DEFAULT NULL,
  `moeda` decimal(3,0) DEFAULT NULL,
  `origem_emissor_cartao` varchar(1) DEFAULT NULL,
  `sinal_transacao` varchar(1) DEFAULT NULL,
  `carteira_digital` varchar(3) DEFAULT NULL,
  `valor_comissao_venda` decimal(12,2) DEFAULT NULL,
  `id_tipo_proximo_conteudo` decimal(2,0) DEFAULT NULL,
  `conteudo_dinamico` varchar(118) DEFAULT NULL,
  `id_tipo_proximo_conteudo_info` decimal(2,0) DEFAULT NULL,
  `conteudo_dinamico_info` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  KEY `idx_ec_rv` (`codigo_ec`,`num_rv`),
  CONSTRAINT `conn_item_getnet_cv_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_getnet_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_getnet_gravame_cessao`
--

DROP TABLE IF EXISTS `conn_item_getnet_gravame_cessao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_getnet_gravame_cessao` (
  `item_id` int(10) unsigned NOT NULL,
  `tiporegistro` decimal(1,0) DEFAULT NULL,
  `codigo_ec` decimal(15,0) DEFAULT NULL,
  `data_operacao` date DEFAULT NULL,
  `data_credito` date DEFAULT NULL,
  `num_operacao` decimal(20,0) DEFAULT NULL,
  `tipo_operacao` varchar(2) DEFAULT NULL,
  `valor_bruto_total` decimal(12,2) DEFAULT NULL,
  `valor_bruto_adquirencia` decimal(12,2) DEFAULT NULL,
  `valor_custo_operacao` decimal(12,2) DEFAULT NULL,
  `valor_liquido` decimal(12,2) DEFAULT NULL,
  `taxa_mensal_operacao` decimal(11,2) DEFAULT NULL,
  `tipo_conta_estabelecimento` varchar(2) DEFAULT NULL,
  `banco_domicilio_bancario` decimal(3,0) DEFAULT NULL,
  `ag_domicilio_bancario` decimal(6,0) DEFAULT NULL,
  `conta_domicilio_bancario` varchar(11) DEFAULT NULL,
  `canal_operacao` varchar(3) DEFAULT NULL,
  `tipo_movimento` varchar(1) DEFAULT NULL,
  `tipo_paricipante` varchar(3) DEFAULT NULL,
  `id_participante` decimal(16,0) DEFAULT NULL,
  `tipo_doc_participante` varchar(1) DEFAULT NULL,
  `doc_participante` decimal(14,0) DEFAULT NULL,
  `tipo_conta_participante` varchar(2) DEFAULT NULL,
  `banco_participante` decimal(3,0) DEFAULT NULL,
  `ag_participante` decimal(6,0) DEFAULT NULL,
  `conta_participante` varchar(11) DEFAULT NULL,
  `codigo_ec_centralizador` varchar(15) DEFAULT NULL,
  `razao_social_participante` varchar(25) DEFAULT NULL,
  `codigo_produto` varchar(2) DEFAULT NULL,
  `chave_ur` decimal(18,0) DEFAULT NULL,
  `data_vencimento_ur` date DEFAULT NULL,
  `valor_bruto_total_ur` decimal(12,2) DEFAULT NULL,
  `valor_bruto_adquirencia_ur` decimal(12,2) DEFAULT NULL,
  `valor_custo_operacao_ur` decimal(12,2) DEFAULT NULL,
  `valor_liquido_ur` decimal(12,2) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_getnet_gravame_cessao_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_getnet_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_getnet_gravame_cessao_detalhamento`
--

DROP TABLE IF EXISTS `conn_item_getnet_gravame_cessao_detalhamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_getnet_gravame_cessao_detalhamento` (
  `item_id` int(10) unsigned NOT NULL,
  `tiporegistro` decimal(1,0) DEFAULT NULL,
  `codigo_ec` decimal(15,0) DEFAULT NULL,
  `data_operacao` date DEFAULT NULL,
  `num_operacao` decimal(18,0) DEFAULT NULL,
  `tipo_operacao` varchar(2) DEFAULT NULL,
  `chave_ur` decimal(18,0) DEFAULT NULL,
  `codigo_produto` varchar(2) DEFAULT NULL,
  `data_vencimento_ur` date DEFAULT NULL,
  `valor_bruto_total_ur` decimal(12,2) DEFAULT NULL,
  `valor_bruto_adquirencia_ur` decimal(12,2) DEFAULT NULL,
  `valor_custo_operacao_ur` decimal(12,2) DEFAULT NULL,
  `valor_liquido_ur` decimal(12,2) DEFAULT NULL,
  `tipo_conta_estabelecimento` varchar(2) DEFAULT NULL,
  `banco_domicilio_bancario` decimal(3,0) DEFAULT NULL,
  `ag_domicilio_bancario` decimal(6,0) DEFAULT NULL,
  `conta_domicilio_bancario` varchar(11) DEFAULT NULL,
  `tipo_movimento` varchar(1) DEFAULT NULL,
  `tipo_paricipante` varchar(3) DEFAULT NULL,
  `id_participante` decimal(16,0) DEFAULT NULL,
  `tipo_doc_participante` varchar(1) DEFAULT NULL,
  `doc_participante` decimal(14,0) DEFAULT NULL,
  `tipo_conta_participante` varchar(2) DEFAULT NULL,
  `banco_participante` decimal(3,0) DEFAULT NULL,
  `ag_participante` decimal(6,0) DEFAULT NULL,
  `conta_participante` varchar(11) DEFAULT NULL,
  `codigo_ec_centralizador` varchar(15) DEFAULT NULL,
  `razao_social_participante` varchar(25) DEFAULT NULL,
  `chave_unidade_recebiveis` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_getnet_gravame_cessao_detalhamento_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_getnet_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_getnet_header`
--

DROP TABLE IF EXISTS `conn_item_getnet_header`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_getnet_header` (
  `item_id` int(10) unsigned NOT NULL,
  `tiporegistro` decimal(1,0) DEFAULT NULL,
  `datacriacao` date DEFAULT NULL,
  `horacriacao` time DEFAULT NULL,
  `datareferencia` date DEFAULT NULL,
  `arquivoversao` varchar(8) DEFAULT NULL,
  `codigo_ec` decimal(15,0) DEFAULT NULL,
  `cnpj_adquirente` decimal(14,0) DEFAULT NULL,
  `nome_adquirente` varchar(20) DEFAULT NULL,
  `sequencia` decimal(9,0) DEFAULT NULL,
  `codigo_adquirente` varchar(2) DEFAULT NULL,
  `versao_layout` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  KEY `codigo_ec` (`codigo_ec`,`datareferencia`),
  KEY `dt_referencia` (`datareferencia`),
  CONSTRAINT `conn_item_getnet_header_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_getnet_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_getnet_line`
--

DROP TABLE IF EXISTS `conn_item_getnet_line`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_getnet_line` (
  `item_id` int(10) unsigned NOT NULL,
  `registertype` decimal(1,0) NOT NULL,
  `rotype` varchar(3) DEFAULT NULL,
  `fileversion` varchar(5) DEFAULT NULL,
  `masterid` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  KEY `masterid` (`masterid`),
  CONSTRAINT `conn_item_getnet_line_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `vooo_prod_backend`.`connection_item` (`item_id`),
  CONSTRAINT `conn_item_getnet_line_ibfk_2` FOREIGN KEY (`masterid`) REFERENCES `conn_item_getnet_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_getnet_rv`
--

DROP TABLE IF EXISTS `conn_item_getnet_rv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_getnet_rv` (
  `item_id` int(10) unsigned NOT NULL,
  `tiporegistro` decimal(1,0) DEFAULT NULL,
  `codigo_ec` decimal(15,0) DEFAULT NULL,
  `codigo_produto` varchar(2) DEFAULT NULL,
  `forma_captura` varchar(3) DEFAULT NULL,
  `numero_rv` decimal(9,0) DEFAULT NULL,
  `data_rv` date DEFAULT NULL,
  `data_pagamento_rv` date DEFAULT NULL,
  `banco` decimal(3,0) DEFAULT NULL,
  `agencia` decimal(6,0) DEFAULT NULL,
  `conta_corrente` decimal(11,0) DEFAULT NULL,
  `qtd_cv_aceitos` decimal(9,0) DEFAULT NULL,
  `qtd_cv_rejeitados` decimal(9,0) DEFAULT NULL,
  `valor_bruto` decimal(12,2) DEFAULT NULL,
  `valor_liquido` decimal(12,2) DEFAULT NULL,
  `taxa_servico` decimal(12,2) DEFAULT NULL,
  `taxa_desconto` decimal(12,2) DEFAULT NULL,
  `valor_rejeitado` decimal(12,2) DEFAULT NULL,
  `valor_credito` decimal(12,2) DEFAULT NULL,
  `valor_encargos` decimal(12,2) DEFAULT NULL,
  `tipo_pagamento` varchar(2) DEFAULT NULL,
  `parcela_rv` decimal(2,0) DEFAULT NULL,
  `qtd_parcelas` decimal(2,0) DEFAULT NULL,
  `codigo_ec_centralizador` decimal(15,0) DEFAULT NULL,
  `num_operacao_antecipacao` varchar(15) DEFAULT NULL,
  `vencimento_original_rv_antecipado` date DEFAULT NULL,
  `custo_operacao` decimal(12,2) DEFAULT NULL,
  `valor_liquido_rv_antecipado` decimal(12,2) DEFAULT NULL,
  `num_controle_cobranca` decimal(18,0) DEFAULT NULL,
  `valor_liquido_cobranca` decimal(12,0) DEFAULT NULL,
  `id_compensacao` decimal(15,0) DEFAULT NULL,
  `moeda` decimal(3,0) DEFAULT NULL,
  `id_baixa_cobranca` varchar(1) DEFAULT NULL,
  `sinal_transacao` varchar(1) DEFAULT NULL,
  `metadado` varchar(2) DEFAULT NULL,
  `conta_pagamento` decimal(20,0) DEFAULT NULL,
  `chave_ur` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_getnet_rv_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_getnet_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_getnet_trailer`
--

DROP TABLE IF EXISTS `conn_item_getnet_trailer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_getnet_trailer` (
  `item_id` int(10) unsigned NOT NULL,
  `tiporegistro` decimal(1,0) DEFAULT NULL,
  `qtd_registros` decimal(9,0) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_getnet_trailer_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_getnet_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_globals_ajuste`
--

DROP TABLE IF EXISTS `conn_item_globals_ajuste`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_globals_ajuste` (
  `item_id` int(10) unsigned NOT NULL,
  `tiporegistro` varchar(2) DEFAULT NULL,
  `codigo_ec` decimal(15,0) DEFAULT NULL,
  `nsu_transacao_original` varchar(12) DEFAULT NULL,
  `data_transacao_original` date DEFAULT NULL,
  `num_da_parcela` decimal(2,0) DEFAULT NULL,
  `nsu_transacao` decimal(12,0) DEFAULT NULL,
  `data_transacao_ajuste` date DEFAULT NULL,
  `hora_transacao_ajuste` time DEFAULT NULL,
  `tipo_lancamento` decimal(1,0) DEFAULT NULL,
  `data_lancamento` date DEFAULT NULL,
  `forma_captura` decimal(1,0) DEFAULT NULL,
  `tipo_ajuste` decimal(1,0) DEFAULT NULL,
  `codigo_ajuste` decimal(3,0) DEFAULT NULL,
  `descricao_ajuste` varchar(30) DEFAULT NULL,
  `valor_bruto` decimal(9,2) DEFAULT NULL,
  `valor_desconto` decimal(9,2) DEFAULT NULL,
  `valor_liquido` decimal(9,2) DEFAULT NULL,
  `banco` decimal(3,0) DEFAULT NULL,
  `agencia` decimal(6,0) DEFAULT NULL,
  `conta_corrente` varchar(11) DEFAULT NULL,
  `num_cartao` varchar(19) DEFAULT NULL,
  `codigo_bandeira` varchar(3) DEFAULT NULL,
  `codigo_produto` varchar(3) DEFAULT NULL,
  `valor_taxa_antecipacao` decimal(9,2) DEFAULT NULL,
  `valor_liquido_antecipado` decimal(9,2) DEFAULT NULL,
  `codigo_pedido_ecommerce` varchar(30) DEFAULT NULL,
  `id_envelope` varchar(18) DEFAULT NULL,
  `trace` varchar(6) DEFAULT NULL,
  `conta_pagamento` varchar(20) DEFAULT NULL,
  `identif_financeira_payware` varchar(18) DEFAULT NULL,
  `identif_antecipacao_payware` varchar(18) DEFAULT NULL,
  `identif_pagamento_payware` varchar(18) DEFAULT NULL,
  `codigo_comercio_payware` varchar(18) DEFAULT NULL,
  `codigo_filial_payware` varchar(18) DEFAULT NULL,
  `merchant_category_code` varchar(4) DEFAULT NULL,
  `segregacao_adquirente_payware` varchar(9) DEFAULT NULL,
  `nsu_host_terminal` varchar(12) DEFAULT NULL,
  `filler` varchar(20) DEFAULT NULL,
  `sequenciareg` decimal(6,0) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_globals_ajuste_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_globals_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_globals_cancel`
--

DROP TABLE IF EXISTS `conn_item_globals_cancel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_globals_cancel` (
  `item_id` int(10) unsigned NOT NULL,
  `tiporegistro` varchar(2) DEFAULT NULL,
  `codigo_ec` decimal(15,0) DEFAULT NULL,
  `nsu_transacao_original` decimal(12,0) DEFAULT NULL,
  `data_transacao_original` date DEFAULT NULL,
  `num_da_parcela` decimal(2,0) DEFAULT NULL,
  `nsu_transacao` decimal(12,0) DEFAULT NULL,
  `data_transacao_cancelamento` date DEFAULT NULL,
  `hora_transacao_cancelamento` time DEFAULT NULL,
  `forma_captura` decimal(1,0) DEFAULT NULL,
  `codigo_pedido_ecommerce` varchar(30) DEFAULT NULL,
  `id_envelope` varchar(18) DEFAULT NULL,
  `trace` varchar(6) DEFAULT NULL,
  `identif_financeira_payware` varchar(18) DEFAULT NULL,
  `identif_antecipacao_payware` varchar(18) DEFAULT NULL,
  `identif_pagamento_payware` varchar(18) DEFAULT NULL,
  `codigo_comercio_payware` varchar(18) DEFAULT NULL,
  `codigo_filial_payware` varchar(18) DEFAULT NULL,
  `merchant_category_code` varchar(4) DEFAULT NULL,
  `segregacao_adquirente_payware` varchar(9) DEFAULT NULL,
  `valor_bruto_cancelamento` decimal(12,2) DEFAULT NULL,
  `valor_bruto_parcela_cancelamento` decimal(12,2) DEFAULT NULL,
  `valor_desconto_cancelamento` decimal(12,2) DEFAULT NULL,
  `valor_liquido_cancelamento` decimal(12,2) DEFAULT NULL,
  `valor_bruto_original` decimal(12,2) DEFAULT NULL,
  `valor_liquido_original` decimal(12,2) DEFAULT NULL,
  `valor_comissao_original` decimal(12,2) DEFAULT NULL,
  `numero_parcelas_original` int(10) unsigned DEFAULT NULL,
  `codigo_autorizacao_original` varchar(12) DEFAULT NULL,
  `nsu_host_terminal` varchar(12) DEFAULT NULL,
  `tipo_transacao` varchar(1) DEFAULT NULL,
  `filler` varchar(20) DEFAULT NULL,
  `sequenciareg` decimal(6,0) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_globals_cancel_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_globals_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_globals_cv`
--

DROP TABLE IF EXISTS `conn_item_globals_cv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_globals_cv` (
  `item_id` int(10) unsigned NOT NULL,
  `tiporegistro` varchar(2) DEFAULT NULL,
  `codigo_ec` decimal(15,0) DEFAULT NULL,
  `nsu_adquirente` decimal(12,0) DEFAULT NULL,
  `data_transacao` date DEFAULT NULL,
  `hora_transacao` time DEFAULT NULL,
  `tipo_lancamento` decimal(1,0) DEFAULT NULL,
  `data_pagamento` date DEFAULT NULL,
  `tipo_produto` varchar(1) DEFAULT NULL,
  `forma_captura` decimal(1,0) DEFAULT NULL,
  `valor_bruto` decimal(9,2) DEFAULT NULL,
  `valor_desconto` decimal(9,2) DEFAULT NULL,
  `valor_liquido` decimal(9,2) DEFAULT NULL,
  `num_cartao` varchar(19) DEFAULT NULL,
  `num_da_parcela` decimal(2,0) DEFAULT NULL,
  `num_parcelas` decimal(2,0) DEFAULT NULL,
  `nsu_parcela` varchar(12) DEFAULT NULL,
  `valor_bruto_parcela` decimal(9,2) DEFAULT NULL,
  `valor_desconto_parcela` decimal(9,2) DEFAULT NULL,
  `valor_liquido_parcela` decimal(9,2) DEFAULT NULL,
  `banco` decimal(3,0) DEFAULT NULL,
  `agencia` decimal(6,0) DEFAULT NULL,
  `conta_corrente` varchar(11) DEFAULT NULL,
  `codigo_autorizacao` varchar(12) DEFAULT NULL,
  `codigo_bandeira` varchar(3) DEFAULT NULL,
  `codigo_produto` varchar(3) DEFAULT NULL,
  `valor_taxa_interchange` decimal(9,2) DEFAULT NULL,
  `valor_taxa_administracao` decimal(9,2) DEFAULT NULL,
  `valor_taxa_interchange_parcela` decimal(9,2) DEFAULT NULL,
  `valor_taxa_administracao_parcela` decimal(9,2) DEFAULT NULL,
  `valor_taxa_multifronteira` decimal(9,2) DEFAULT NULL,
  `valor_taxa_antecipacao` decimal(9,2) DEFAULT NULL,
  `valor_liquido_rv_antecipado` decimal(9,2) DEFAULT NULL,
  `tipo_transacao` decimal(2,0) DEFAULT NULL,
  `codigo_pedido_ecommerce` varchar(30) DEFAULT NULL,
  `sigla_pais` varchar(3) DEFAULT NULL,
  `numero_terminal` varchar(8) DEFAULT NULL,
  `id_envelope` varchar(18) DEFAULT NULL,
  `trace` varchar(6) DEFAULT NULL,
  `conta_pagamento` varchar(20) DEFAULT NULL,
  `identif_financeira_payware` varchar(18) DEFAULT NULL,
  `identif_antecipacao_payware` varchar(18) DEFAULT NULL,
  `identif_pagamento_payware` varchar(18) DEFAULT NULL,
  `codigo_comercio_payware` varchar(18) DEFAULT NULL,
  `codigo_filial_payware` varchar(18) DEFAULT NULL,
  `merchant_category_code` varchar(4) DEFAULT NULL,
  `segregacao_adquirente_payware` varchar(9) DEFAULT NULL,
  `nsu_host_terminal` varchar(12) DEFAULT NULL,
  `tipo_transacao2` varchar(1) DEFAULT NULL,
  `reservado` varchar(30) DEFAULT NULL,
  `sequenciareg` decimal(6,0) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  KEY `idx_global_cv_1` (`codigo_autorizacao`,`nsu_adquirente`),
  KEY `isx_global_cv_2` (`nsu_adquirente`,`data_transacao`,`tipo_lancamento`),
  KEY `idx_global_cv_3` (`nsu_parcela`,`data_transacao`),
  KEY `idx_global_cv_4` (`nsu_parcela`),
  KEY `idx_global_cv_5` (`codigo_pedido_ecommerce`),
  CONSTRAINT `conn_item_globals_cv_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_globals_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_globals_external_transactions`
--

DROP TABLE IF EXISTS `conn_item_globals_external_transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_globals_external_transactions` (
  `item_id` int(10) unsigned NOT NULL,
  `id_comercio` decimal(15,0) DEFAULT NULL,
  `id_filial` decimal(15,0) DEFAULT NULL,
  `data_processamento` date DEFAULT NULL,
  `data_pagamento` date DEFAULT NULL,
  `id_produto` decimal(3,0) DEFAULT NULL,
  `produto` varchar(30) DEFAULT NULL,
  `ajuste` varchar(30) DEFAULT NULL,
  `tipo_movimento` varchar(30) DEFAULT NULL,
  `codigo_operacao` varchar(30) DEFAULT NULL,
  `qtde_parcelas` decimal(2,0) DEFAULT NULL,
  `numero_parcela` decimal(15,0) DEFAULT NULL,
  `valor_movimento` decimal(15,2) DEFAULT NULL,
  `plano_venda` varchar(30) DEFAULT NULL,
  `tipo_tecnologia` varchar(30) DEFAULT NULL,
  `data_transacao` date DEFAULT NULL,
  `numero_bin` decimal(20,0) DEFAULT NULL,
  `nsu` varchar(30) DEFAULT NULL,
  `codigo_autorizacao` varchar(30) DEFAULT NULL,
  `valor_original_transacao` decimal(15,2) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_globals_external_transactions_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_globals_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_globals_header`
--

DROP TABLE IF EXISTS `conn_item_globals_header`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_globals_header` (
  `item_id` int(10) unsigned NOT NULL,
  `tiporegistro` varchar(2) DEFAULT NULL,
  `versao_layout` varchar(6) DEFAULT NULL,
  `datacriacao` date DEFAULT NULL,
  `horacriacao` time DEFAULT NULL,
  `sequencia` decimal(6,0) DEFAULT NULL,
  `nome_adquirente` varchar(30) DEFAULT NULL,
  `codigo_adquirente` decimal(4,0) DEFAULT NULL,
  `codigo_ec` decimal(9,0) DEFAULT NULL,
  `tipoprocessamento` varchar(1) DEFAULT NULL,
  `sequenciareg` decimal(6,0) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_globals_header_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_globals_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_globals_headermov`
--

DROP TABLE IF EXISTS `conn_item_globals_headermov`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_globals_headermov` (
  `item_id` int(10) unsigned NOT NULL,
  `tiporegistro` varchar(2) DEFAULT NULL,
  `datamovimento` date DEFAULT NULL,
  `moeda` varchar(2) DEFAULT NULL,
  `sequenciareg` decimal(6,0) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_globals_headermov_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_globals_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_globals_line`
--

DROP TABLE IF EXISTS `conn_item_globals_line`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_globals_line` (
  `item_id` int(10) unsigned NOT NULL,
  `registertype` varchar(2) NOT NULL,
  `rotype` varchar(3) DEFAULT NULL,
  `masterid` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  KEY `masterid` (`masterid`),
  CONSTRAINT `conn_item_globals_line_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `vooo_prod_backend`.`connection_item` (`item_id`),
  CONSTRAINT `conn_item_globals_line_ibfk_2` FOREIGN KEY (`masterid`) REFERENCES `conn_item_globals_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_globals_trailer`
--

DROP TABLE IF EXISTS `conn_item_globals_trailer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_globals_trailer` (
  `item_id` int(10) unsigned NOT NULL,
  `tiporegistro` varchar(2) DEFAULT NULL,
  `qtd_registros` decimal(6,0) DEFAULT NULL,
  `sequenciareg` decimal(6,0) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_globals_trailer_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_globals_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_globals_trailermov`
--

DROP TABLE IF EXISTS `conn_item_globals_trailermov`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_globals_trailermov` (
  `item_id` int(10) unsigned NOT NULL,
  `tiporegistro` varchar(2) DEFAULT NULL,
  `qtd_registrostransacao` decimal(6,0) DEFAULT NULL,
  `totalCreditos` decimal(12,2) DEFAULT NULL,
  `sequenciareg` decimal(6,0) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_globals_trailermov_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_globals_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_green_pass_ajuste`
--

DROP TABLE IF EXISTS `conn_item_green_pass_ajuste`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_green_pass_ajuste` (
  `item_id` int(10) unsigned NOT NULL,
  `tiporegistro` varchar(2) DEFAULT NULL,
  `codigo_ec` decimal(15,0) DEFAULT NULL,
  `nsu_transacao_original` varchar(40) DEFAULT NULL,
  `data_transacao_original` date DEFAULT NULL,
  `num_da_parcela` decimal(2,0) DEFAULT NULL,
  `nsu_transacao` varchar(40) DEFAULT NULL,
  `data_transacao_ajuste` date DEFAULT NULL,
  `hora_transacao_ajuste` time DEFAULT NULL,
  `tipo_lancamento` decimal(1,0) DEFAULT NULL,
  `data_lancamento` date DEFAULT NULL,
  `forma_captura` decimal(1,0) DEFAULT NULL,
  `tipo_ajuste` decimal(1,0) DEFAULT NULL,
  `codigo_ajuste` decimal(3,0) DEFAULT NULL,
  `descricao_ajuste` varchar(30) DEFAULT NULL,
  `valor_bruto` decimal(11,2) DEFAULT NULL,
  `valor_desconto` decimal(11,2) DEFAULT NULL,
  `valor_liquido` decimal(11,2) DEFAULT NULL,
  `banco` decimal(3,0) DEFAULT NULL,
  `agencia` decimal(6,0) DEFAULT NULL,
  `conta_corrente` varchar(11) DEFAULT NULL,
  `num_cartao` varchar(19) DEFAULT NULL,
  `codigo_bandeira` varchar(3) DEFAULT NULL,
  `codigo_produto` varchar(3) DEFAULT NULL,
  `valor_bruto_parcela` decimal(11,2) DEFAULT NULL,
  `valor_liquido_parcela` decimal(11,2) DEFAULT NULL,
  `codigo_pedido` varchar(36) DEFAULT NULL,
  `codigo_autorizacao` varchar(36) DEFAULT NULL,
  `num_parcelas` decimal(2,0) DEFAULT NULL,
  `sequencia_registro` decimal(6,0) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_green_pass_ajuste_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_green_pass_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_green_pass_cancel`
--

DROP TABLE IF EXISTS `conn_item_green_pass_cancel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_green_pass_cancel` (
  `item_id` int(10) unsigned NOT NULL,
  `tiporegistro` varchar(2) DEFAULT NULL,
  `codigo_ec` decimal(15,0) DEFAULT NULL,
  `nsu_transacao_original` varchar(40) DEFAULT NULL,
  `data_transacao_original` date DEFAULT NULL,
  `num_da_parcela` decimal(2,0) DEFAULT NULL,
  `nsu_transacao` varchar(40) DEFAULT NULL,
  `data_transacao_cancelamento` date DEFAULT NULL,
  `hora_transacao_cancelamento` time DEFAULT NULL,
  `forma_captura` decimal(1,0) DEFAULT NULL,
  `codigo_pedido` varchar(36) DEFAULT NULL,
  `codigo_autorizacao` varchar(40) DEFAULT NULL,
  `valor_bruto` decimal(11,2) DEFAULT NULL,
  `valor_liquido` decimal(11,2) DEFAULT NULL,
  `valor_bruto_parcela` decimal(11,2) DEFAULT NULL,
  `valor_liquido_parcela` decimal(11,2) DEFAULT NULL,
  `codigo_ajuste` decimal(3,0) DEFAULT NULL,
  `descricao_ajuste` varchar(30) DEFAULT NULL,
  `num_parcelas` decimal(2,0) DEFAULT NULL,
  `sequencia_registro` decimal(6,0) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_green_pass_cancel_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_green_pass_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_green_pass_cv`
--

DROP TABLE IF EXISTS `conn_item_green_pass_cv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_green_pass_cv` (
  `item_id` int(10) unsigned NOT NULL,
  `tipo_registro` varchar(2) DEFAULT NULL,
  `codigo_ec` decimal(15,0) DEFAULT NULL,
  `nsu_adquirente` varchar(40) DEFAULT NULL,
  `data_transacao` date DEFAULT NULL,
  `hora_transacao` time DEFAULT NULL,
  `tipo_lancamento` decimal(1,0) DEFAULT NULL,
  `data_liquidacao` date DEFAULT NULL,
  `tipo_produto` varchar(1) DEFAULT NULL,
  `forma_captura` decimal(1,0) DEFAULT NULL,
  `valor_bruto` decimal(11,2) DEFAULT NULL,
  `valor_desconto` decimal(11,2) DEFAULT NULL,
  `valor_liquido` decimal(11,2) DEFAULT NULL,
  `num_cartao` varchar(19) DEFAULT NULL,
  `num_da_parcela` decimal(2,0) DEFAULT NULL,
  `num_parcelas` decimal(2,0) DEFAULT NULL,
  `nsu_parcela` varchar(40) DEFAULT NULL,
  `valor_bruto_parcela` decimal(11,2) DEFAULT NULL,
  `valor_desconto_parcela` decimal(11,2) DEFAULT NULL,
  `valor_liquido_parcela` decimal(11,2) DEFAULT NULL,
  `banco` decimal(3,0) DEFAULT NULL,
  `agencia` decimal(6,0) DEFAULT NULL,
  `conta_corrente` varchar(11) DEFAULT NULL,
  `codigo_autorizacao` varchar(40) DEFAULT NULL,
  `codigo_bandeira` varchar(3) DEFAULT NULL,
  `codigo_produto` varchar(3) DEFAULT NULL,
  `valor_taxa_1` decimal(11,2) DEFAULT NULL,
  `valor_taxa_2` decimal(11,2) DEFAULT NULL,
  `valor_taxa_1_parcela` decimal(11,2) DEFAULT NULL,
  `valor_taxa_2_parcela` decimal(11,2) DEFAULT NULL,
  `filler_1` decimal(11,0) DEFAULT NULL,
  `valor_taxa_antecipacao` decimal(11,2) DEFAULT NULL,
  `valor_liquido_antecipado` decimal(11,2) DEFAULT NULL,
  `filler_2` decimal(2,0) DEFAULT NULL,
  `codigo_pedido` varchar(40) DEFAULT NULL,
  `filler_3` varchar(3) DEFAULT NULL,
  `numero_terminal` varchar(8) DEFAULT NULL,
  `codigo_shellbox` varchar(50) DEFAULT NULL,
  `sequencia_registro` decimal(6,0) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_green_pass_cv_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_green_pass_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_green_pass_header`
--

DROP TABLE IF EXISTS `conn_item_green_pass_header`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_green_pass_header` (
  `item_id` int(10) unsigned NOT NULL,
  `tipo_registro` varchar(2) DEFAULT NULL,
  `versao_layout` varchar(6) DEFAULT NULL,
  `data_criacao` date DEFAULT NULL,
  `hora_criacao` time DEFAULT NULL,
  `sequencia` decimal(6,0) DEFAULT NULL,
  `nome_adquirente` varchar(30) DEFAULT NULL,
  `filler` decimal(1,0) DEFAULT NULL,
  `codigo_ec` decimal(13,0) DEFAULT NULL,
  `tipo_processamento` varchar(1) DEFAULT NULL,
  `sequencia_registro` decimal(6,0) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_green_pass_header_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_green_pass_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_green_pass_header_mov`
--

DROP TABLE IF EXISTS `conn_item_green_pass_header_mov`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_green_pass_header_mov` (
  `item_id` int(10) unsigned NOT NULL,
  `tipo_registro` varchar(2) DEFAULT NULL,
  `data_movimento` date DEFAULT NULL,
  `moeda` varchar(2) DEFAULT NULL,
  `sequencia_registro` decimal(6,0) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_green_pass_header_mov_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_green_pass_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_green_pass_line`
--

DROP TABLE IF EXISTS `conn_item_green_pass_line`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_green_pass_line` (
  `item_id` int(10) unsigned NOT NULL,
  `register_type` varchar(2) NOT NULL,
  `masterid` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  KEY `masterid` (`masterid`),
  CONSTRAINT `conn_item_green_pass_line_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `vooo_prod_backend`.`connection_item` (`item_id`),
  CONSTRAINT `conn_item_green_pass_line_ibfk_2` FOREIGN KEY (`masterid`) REFERENCES `conn_item_green_pass_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_green_pass_trailer`
--

DROP TABLE IF EXISTS `conn_item_green_pass_trailer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_green_pass_trailer` (
  `item_id` int(10) unsigned NOT NULL,
  `tipo_registro` varchar(2) DEFAULT NULL,
  `qtd_registros` decimal(6,0) DEFAULT NULL,
  `sequencia_registro` decimal(6,0) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_green_pass_trailer_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_green_pass_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_green_pass_trailer_mov`
--

DROP TABLE IF EXISTS `conn_item_green_pass_trailer_mov`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_green_pass_trailer_mov` (
  `item_id` int(10) unsigned NOT NULL,
  `tipo_registro` varchar(2) DEFAULT NULL,
  `total_registros` decimal(6,0) DEFAULT NULL,
  `total_creditos` decimal(14,2) DEFAULT NULL,
  `sequencia_registro` decimal(6,0) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_green_pass_trailer_mov_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_green_pass_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_ifood_transaction`
--

DROP TABLE IF EXISTS `conn_item_ifood_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_ifood_transaction` (
  `item_id` int(10) unsigned NOT NULL,
  `numero_pedido` decimal(25,0) DEFAULT NULL,
  `data_pedido` date DEFAULT NULL,
  `hora_pedido` time DEFAULT NULL,
  `estabelecimento` varchar(50) DEFAULT NULL,
  `id_do_estabelecimento` decimal(25,0) DEFAULT NULL,
  `taxa_de_entrega` decimal(11,2) DEFAULT NULL,
  `valor_dos_itens` decimal(11,2) DEFAULT NULL,
  `incentivo_promocional_ifood` decimal(11,2) DEFAULT NULL,
  `incentivo_promocional_loja` decimal(11,2) DEFAULT NULL,
  `taxa_de_servico` decimal(11,2) DEFAULT NULL,
  `total_do_parceiro` decimal(11,2) DEFAULT NULL,
  `total_do_pedido` decimal(11,2) DEFAULT NULL,
  `formas_de_pagamento` varchar(100) DEFAULT NULL,
  `data_do_cancelamento` date DEFAULT NULL,
  `origem_do_cancelamento` varchar(50) DEFAULT NULL,
  `motivo_do_cancelamento` varchar(50) DEFAULT NULL,
  `cancelamento_contestavel` varchar(50) DEFAULT NULL,
  `motivo_impossibilidade_contestar` varchar(100) DEFAULT NULL,
  `data_limite_contestacao` date DEFAULT NULL,
  `confirmado` varchar(20) DEFAULT NULL,
  `data_de_agendamento` date DEFAULT NULL,
  `tipo_de_pedido` varchar(20) DEFAULT NULL,
  `agendado` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_ifood_transaction_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `vooo_prod_backend`.`connection_item` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_ipagare_control`
--

DROP TABLE IF EXISTS `conn_item_ipagare_control`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_ipagare_control` (
  `item_id` int(10) unsigned NOT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `check_status` decimal(1,0) DEFAULT NULL,
  `registers` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  KEY `ix_vooo_prod_rawdata_conn_item_ipagare_control_start_date` (`start_date`),
  KEY `ix_vooo_prod_rawdata_conn_item_ipagare_control_end_date` (`end_date`),
  CONSTRAINT `conn_item_ipagare_control_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_ipagare_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_ipagare_line`
--

DROP TABLE IF EXISTS `conn_item_ipagare_line`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_ipagare_line` (
  `item_id` int(10) unsigned NOT NULL,
  `register_type` varchar(15) DEFAULT NULL,
  `masterid` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  KEY `masterid` (`masterid`),
  CONSTRAINT `conn_item_ipagare_line_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `vooo_prod_backend`.`connection_item` (`item_id`),
  CONSTRAINT `conn_item_ipagare_line_ibfk_2` FOREIGN KEY (`masterid`) REFERENCES `conn_item_ipagare_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_ipagare_transaction`
--

DROP TABLE IF EXISTS `conn_item_ipagare_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_ipagare_transaction` (
  `item_id` int(10) unsigned NOT NULL,
  `request_id` varchar(30) DEFAULT NULL,
  `request_date` date DEFAULT NULL,
  `request_time` time DEFAULT NULL,
  `merchant_id` varchar(30) DEFAULT NULL,
  `re_lag` varchar(20) DEFAULT NULL,
  `bill_to_country` varchar(30) DEFAULT NULL,
  `bill_to_customer_id` varchar(30) DEFAULT NULL,
  `bill_to_first_name` varchar(50) DEFAULT NULL,
  `bill_to_last_name` varchar(50) DEFAULT NULL,
  `signal` varchar(1) DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `authorization_code` varchar(10) DEFAULT NULL,
  `bin_number` decimal(6,0) DEFAULT NULL,
  `network_transaction_id` varchar(20) DEFAULT NULL,
  `number_of_installments` decimal(2,0) DEFAULT NULL,
  `payment_processor` varchar(20) DEFAULT NULL,
  `request_amount_currency_code` varchar(10) DEFAULT NULL,
  `transaction_reference_number` varchar(20) DEFAULT NULL,
  `account_suffix` varchar(10) DEFAULT NULL,
  `card_type` varchar(20) DEFAULT NULL,
  `merchant_reference_number` decimal(12,0) DEFAULT NULL,
  `status` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  KEY `ix_vooo_prod_rawdata_conn_item_ipagare_transaction_bill__26c4` (`bill_to_customer_id`),
  KEY `ix_vooo_prod_rawdata_conn_item_ipagare_transaction_request_id` (`request_id`),
  KEY `ix_vooo_prod_rawdata_conn_item_ipagare_transaction_merch_1dce` (`merchant_reference_number`),
  KEY `ix_vooo_prod_rawdata_conn_item_ipagare_transaction_trans_47b5` (`transaction_reference_number`),
  CONSTRAINT `conn_item_ipagare_transaction_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_ipagare_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_linxpay_ajuste`
--

DROP TABLE IF EXISTS `conn_item_linxpay_ajuste`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_linxpay_ajuste` (
  `item_id` int(10) unsigned NOT NULL,
  `tiporegistro` varchar(2) DEFAULT NULL,
  `codigo_ec` decimal(15,0) DEFAULT NULL,
  `nsu_transacao_original` varchar(12) DEFAULT NULL,
  `data_transacao_original` date DEFAULT NULL,
  `num_da_parcela` decimal(2,0) DEFAULT NULL,
  `nsu_transacao` decimal(12,0) DEFAULT NULL,
  `data_transacao_ajuste` date DEFAULT NULL,
  `hora_transacao_ajuste` time DEFAULT NULL,
  `tipo_lancamento` decimal(1,0) DEFAULT NULL,
  `data_lancamento` date DEFAULT NULL,
  `forma_captura` decimal(1,0) DEFAULT NULL,
  `tipo_ajuste` decimal(1,0) DEFAULT NULL,
  `codigo_ajuste` decimal(3,0) DEFAULT NULL,
  `descricao_ajuste` varchar(30) DEFAULT NULL,
  `valor_bruto` decimal(11,2) DEFAULT NULL,
  `valor_desconto` decimal(11,2) DEFAULT NULL,
  `valor_liquido` decimal(11,2) DEFAULT NULL,
  `banco` decimal(3,0) DEFAULT NULL,
  `agencia` decimal(6,0) DEFAULT NULL,
  `conta_corrente` varchar(11) DEFAULT NULL,
  `num_cartao` varchar(19) DEFAULT NULL,
  `codigo_bandeira` varchar(3) DEFAULT NULL,
  `codigo_produto` varchar(3) DEFAULT NULL,
  `valor_taxa_antecipacao` decimal(11,2) DEFAULT NULL,
  `valor_liquido_antecipado` decimal(11,2) DEFAULT NULL,
  `codigo_pedido_ecommerce` varchar(19) DEFAULT NULL,
  `id_transacao` varchar(36) DEFAULT NULL,
  `id_pagamento` varchar(55) DEFAULT NULL,
  `sequenciareg` decimal(6,0) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_linxpay_ajuste_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_linxpay_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_linxpay_cancel`
--

DROP TABLE IF EXISTS `conn_item_linxpay_cancel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_linxpay_cancel` (
  `item_id` int(10) unsigned NOT NULL,
  `tiporegistro` varchar(2) DEFAULT NULL,
  `codigo_ec` decimal(15,0) DEFAULT NULL,
  `nsu_transacao_original` decimal(12,0) DEFAULT NULL,
  `data_transacao_original` date DEFAULT NULL,
  `num_da_parcela` decimal(2,0) DEFAULT NULL,
  `nsu_transacao` decimal(12,0) DEFAULT NULL,
  `data_transacao_cancelamento` date DEFAULT NULL,
  `hora_transacao_cancelamento` time DEFAULT NULL,
  `forma_captura` decimal(1,0) DEFAULT NULL,
  `codigo_pedido_ecommerce` varchar(30) DEFAULT NULL,
  `sequenciareg` decimal(6,0) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_linxpay_cancel_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_linxpay_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_linxpay_cv`
--

DROP TABLE IF EXISTS `conn_item_linxpay_cv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_linxpay_cv` (
  `item_id` int(10) unsigned NOT NULL,
  `tiporegistro` varchar(2) DEFAULT NULL,
  `codigo_ec` decimal(15,0) DEFAULT NULL,
  `nsu_adquirente` decimal(12,0) DEFAULT NULL,
  `data_transacao` date DEFAULT NULL,
  `hora_transacao` time DEFAULT NULL,
  `tipo_lancamento` decimal(1,0) DEFAULT NULL,
  `data_pagamento` date DEFAULT NULL,
  `tipo_produto` varchar(1) DEFAULT NULL,
  `forma_captura` decimal(1,0) DEFAULT NULL,
  `valor_bruto` decimal(11,2) DEFAULT NULL,
  `valor_desconto` decimal(11,2) DEFAULT NULL,
  `valor_liquido` decimal(11,2) DEFAULT NULL,
  `num_cartao` varchar(19) DEFAULT NULL,
  `num_da_parcela` decimal(2,0) DEFAULT NULL,
  `num_parcelas` decimal(2,0) DEFAULT NULL,
  `nsu_parcela` varchar(12) DEFAULT NULL,
  `valor_bruto_parcela` decimal(11,2) DEFAULT NULL,
  `valor_desconto_parcela` decimal(11,2) DEFAULT NULL,
  `valor_liquido_parcela` decimal(11,2) DEFAULT NULL,
  `banco` decimal(3,0) DEFAULT NULL,
  `agencia` decimal(6,0) DEFAULT NULL,
  `conta_corrente` varchar(11) DEFAULT NULL,
  `codigo_autorizacao` varchar(12) DEFAULT NULL,
  `codigo_bandeira` varchar(3) DEFAULT NULL,
  `codigo_produto` varchar(3) DEFAULT NULL,
  `valor_taxa_interchange` decimal(11,2) DEFAULT NULL,
  `valor_taxa_administracao` decimal(11,2) DEFAULT NULL,
  `valor_taxa_interchange_parcela` decimal(11,2) DEFAULT NULL,
  `valor_taxa_administracao_parcela` decimal(11,2) DEFAULT NULL,
  `valor_taxa_multifronteira` decimal(11,2) DEFAULT NULL,
  `valor_taxa_antecipacao` decimal(11,2) DEFAULT NULL,
  `valor_liquido_rv_antecipado` decimal(11,2) DEFAULT NULL,
  `tipo_transacao` decimal(2,0) DEFAULT NULL,
  `codigo_pedido_ecommerce` varchar(19) DEFAULT NULL,
  `sigla_pais` varchar(3) DEFAULT NULL,
  `numero_terminal` varchar(8) DEFAULT NULL,
  `id_transacao` varchar(69) DEFAULT NULL,
  `id_pagamento` varchar(36) DEFAULT NULL,
  `sequenciareg` decimal(6,0) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_linxpay_cv_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_linxpay_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_linxpay_external_transactions`
--

DROP TABLE IF EXISTS `conn_item_linxpay_external_transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_linxpay_external_transactions` (
  `item_id` int(10) unsigned NOT NULL,
  `id_comercio` decimal(15,0) DEFAULT NULL,
  `id_filial` decimal(15,0) DEFAULT NULL,
  `data_processamento` date DEFAULT NULL,
  `data_pagamento` date DEFAULT NULL,
  `id_produto` decimal(3,0) DEFAULT NULL,
  `produto` varchar(30) DEFAULT NULL,
  `ajuste` varchar(30) DEFAULT NULL,
  `tipo_movimento` varchar(30) DEFAULT NULL,
  `codigo_operacao` varchar(30) DEFAULT NULL,
  `qtde_parcelas` decimal(2,0) DEFAULT NULL,
  `numero_parcela` decimal(15,0) DEFAULT NULL,
  `valor_movimento` decimal(15,2) DEFAULT NULL,
  `plano_venda` varchar(30) DEFAULT NULL,
  `tipo_tecnologia` varchar(30) DEFAULT NULL,
  `data_transacao` date DEFAULT NULL,
  `numero_bin` decimal(20,0) DEFAULT NULL,
  `nsu` varchar(30) DEFAULT NULL,
  `codigo_autorizacao` varchar(30) DEFAULT NULL,
  `valor_original_transacao` decimal(15,2) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_linxpay_external_transactions_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_linxpay_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_linxpay_header`
--

DROP TABLE IF EXISTS `conn_item_linxpay_header`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_linxpay_header` (
  `item_id` int(10) unsigned NOT NULL,
  `tiporegistro` varchar(2) DEFAULT NULL,
  `versao_layout` varchar(6) DEFAULT NULL,
  `datacriacao` date DEFAULT NULL,
  `horacriacao` time DEFAULT NULL,
  `sequencia` decimal(6,0) DEFAULT NULL,
  `nome_adquirente` varchar(30) DEFAULT NULL,
  `codigo_adquirente` decimal(4,0) DEFAULT NULL,
  `codigo_ec` decimal(9,0) DEFAULT NULL,
  `tipoprocessamento` varchar(1) DEFAULT NULL,
  `sequenciareg` decimal(6,0) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_linxpay_header_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_linxpay_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_linxpay_headermov`
--

DROP TABLE IF EXISTS `conn_item_linxpay_headermov`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_linxpay_headermov` (
  `item_id` int(10) unsigned NOT NULL,
  `tiporegistro` varchar(2) DEFAULT NULL,
  `datamovimento` date DEFAULT NULL,
  `moeda` varchar(2) DEFAULT NULL,
  `sequenciareg` decimal(6,0) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_linxpay_headermov_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_linxpay_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_linxpay_line`
--

DROP TABLE IF EXISTS `conn_item_linxpay_line`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_linxpay_line` (
  `item_id` int(10) unsigned NOT NULL,
  `registertype` varchar(2) NOT NULL,
  `rotype` varchar(3) DEFAULT NULL,
  `masterid` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  KEY `masterid` (`masterid`),
  CONSTRAINT `conn_item_linxpay_line_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `vooo_prod_backend`.`connection_item` (`item_id`),
  CONSTRAINT `conn_item_linxpay_line_ibfk_2` FOREIGN KEY (`masterid`) REFERENCES `conn_item_linxpay_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_linxpay_trailer`
--

DROP TABLE IF EXISTS `conn_item_linxpay_trailer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_linxpay_trailer` (
  `item_id` int(10) unsigned NOT NULL,
  `tiporegistro` varchar(2) DEFAULT NULL,
  `qtd_registros` decimal(6,0) DEFAULT NULL,
  `sequenciareg` decimal(6,0) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_linxpay_trailer_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_linxpay_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_linxpay_trailermov`
--

DROP TABLE IF EXISTS `conn_item_linxpay_trailermov`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_linxpay_trailermov` (
  `item_id` int(10) unsigned NOT NULL,
  `tiporegistro` varchar(2) DEFAULT NULL,
  `qtd_registrostransacao` decimal(6,0) DEFAULT NULL,
  `totalCreditos` decimal(14,2) DEFAULT NULL,
  `sequenciareg` decimal(6,0) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_linxpay_trailermov_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_linxpay_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_ltm_ajustes`
--

DROP TABLE IF EXISTS `conn_item_ltm_ajustes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_ltm_ajustes` (
  `item_id` int(10) unsigned NOT NULL,
  `tipo_registro` varchar(1) NOT NULL,
  `codigo_estabelecimento` varchar(15) NOT NULL,
  `numero_rv_ajustado` decimal(9,0) DEFAULT NULL,
  `data_rv` date DEFAULT NULL,
  `data_pagamento_rv` date DEFAULT NULL,
  `identificador_ajuste` varchar(20) NOT NULL,
  `brancos` varchar(1) DEFAULT NULL,
  `sinal_valor_ajuste` varchar(1) NOT NULL,
  `valor_ajuste` decimal(10,2) NOT NULL,
  `motivo_ajuste` varchar(2) NOT NULL,
  `data_carta` date DEFAULT NULL,
  `numero_cartao` varchar(19) DEFAULT NULL,
  `numero_rv_original` decimal(9,0) DEFAULT NULL,
  `nsu_original_administradora` decimal(12,0) DEFAULT NULL,
  `data_transacao_original` date DEFAULT NULL,
  `indicador_tipo_pagamento` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_ltm_ajustes_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_ltm_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_ltm_header`
--

DROP TABLE IF EXISTS `conn_item_ltm_header`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_ltm_header` (
  `item_id` int(10) unsigned NOT NULL,
  `tipo_registro` varchar(1) NOT NULL,
  `data_criacao_arquivo` date NOT NULL,
  `hora_criacao_arquivo` time NOT NULL,
  `data_referencia_movimento` date NOT NULL,
  `arquivo_versao` varchar(8) NOT NULL,
  `codigo_estabelecimento` varchar(15) NOT NULL,
  `cnpj_administradora` decimal(15,0) NOT NULL,
  `nome_administradora` varchar(20) NOT NULL,
  `sequencia` decimal(9,0) NOT NULL,
  `codigo_administradora` varchar(2) NOT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_ltm_header_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_ltm_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_ltm_line`
--

DROP TABLE IF EXISTS `conn_item_ltm_line`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_ltm_line` (
  `item_id` int(10) unsigned NOT NULL,
  `registertype` varchar(2) NOT NULL,
  `masterid` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  KEY `masterid` (`masterid`),
  CONSTRAINT `conn_item_ltm_line_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `vooo_prod_backend`.`connection_item` (`item_id`),
  CONSTRAINT `conn_item_ltm_line_ibfk_2` FOREIGN KEY (`masterid`) REFERENCES `conn_item_ltm_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_ltm_modalidades_pagamento`
--

DROP TABLE IF EXISTS `conn_item_ltm_modalidades_pagamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_ltm_modalidades_pagamento` (
  `item_id` int(10) unsigned NOT NULL,
  `tipo_registro` varchar(1) NOT NULL,
  `codigo_estabelecimento` varchar(15) NOT NULL,
  `nsu_administradora` varchar(12) NOT NULL,
  `data_transacao` date NOT NULL,
  `hora_transacao` time NOT NULL,
  `modalidade_pagamento_1` varchar(2) DEFAULT NULL,
  `valor_recebido_1` decimal(10,2) DEFAULT NULL,
  `modalidade_pagamento_2` varchar(2) DEFAULT NULL,
  `valor_recebido_2` decimal(10,2) DEFAULT NULL,
  `modalidade_pagamento_3` varchar(2) DEFAULT NULL,
  `valor_recebido_3` decimal(10,2) DEFAULT NULL,
  `modalidade_pagamento_4` varchar(2) DEFAULT NULL,
  `valor_recebido_4` decimal(10,2) DEFAULT NULL,
  `modalidade_pagamento_5` varchar(2) DEFAULT NULL,
  `valor_recebido_5` decimal(10,2) DEFAULT NULL,
  `modalidade_pagamento_6` varchar(2) DEFAULT NULL,
  `valor_recebido_6` decimal(10,2) DEFAULT NULL,
  `modalidade_pagamento_7` varchar(2) DEFAULT NULL,
  `valor_recebido_7` decimal(10,2) DEFAULT NULL,
  `modalidade_pagamento_8` varchar(2) DEFAULT NULL,
  `valor_recebido_8` decimal(10,2) DEFAULT NULL,
  `modalidade_pagamento_9` varchar(2) DEFAULT NULL,
  `valor_recebido_9` decimal(10,2) DEFAULT NULL,
  `modalidade_pagamento_10` varchar(2) DEFAULT NULL,
  `valor_recebido_10` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_ltm_modalidades_pagamento_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_ltm_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_ltm_resumo_vendas`
--

DROP TABLE IF EXISTS `conn_item_ltm_resumo_vendas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_ltm_resumo_vendas` (
  `item_id` int(10) unsigned NOT NULL,
  `tipo_registro` varchar(1) NOT NULL,
  `codigo_estabelecimento` varchar(15) NOT NULL,
  `codigo_produto` varchar(2) NOT NULL,
  `forma_captura` varchar(3) DEFAULT NULL,
  `numero_rv` decimal(9,0) NOT NULL,
  `data_rv` date NOT NULL,
  `data_pagamento_rv` date DEFAULT NULL,
  `banco` decimal(3,0) NOT NULL,
  `agencia` decimal(6,0) NOT NULL,
  `conta_corrente` decimal(11,0) NOT NULL,
  `numero_cv_aceitos` decimal(9,0) NOT NULL,
  `numero_cv_rejeitados` decimal(9,0) NOT NULL,
  `valor_bruto` decimal(10,2) NOT NULL,
  `valor_liquido` decimal(10,2) NOT NULL,
  `valor_taxa_servico` decimal(10,2) NOT NULL,
  `valor_comissao` decimal(10,2) NOT NULL,
  `valor_rejeitado` decimal(10,2) NOT NULL,
  `valor_credito` decimal(10,2) NOT NULL,
  `valor_encargos` decimal(10,2) NOT NULL,
  `indicador_tipo_pagamento` varchar(2) NOT NULL,
  `numero_parcela_rv` decimal(10,0) NOT NULL,
  `quantidade_parcela_rv` decimal(10,0) NOT NULL,
  `data_pagamento_prevista` date DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_ltm_resumo_vendas_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_ltm_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_ltm_trailler`
--

DROP TABLE IF EXISTS `conn_item_ltm_trailler`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_ltm_trailler` (
  `item_id` int(10) unsigned NOT NULL,
  `tipo_registro` varchar(1) NOT NULL,
  `quantidade_registros` int(11) NOT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_ltm_trailler_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_ltm_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_ltm_transacoes`
--

DROP TABLE IF EXISTS `conn_item_ltm_transacoes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_ltm_transacoes` (
  `item_id` int(10) unsigned NOT NULL,
  `tipo_registro` varchar(1) NOT NULL,
  `codigo_estabelecimento` varchar(15) NOT NULL,
  `numero_rv` int(11) NOT NULL,
  `nsu_administradora` decimal(12,0) NOT NULL,
  `data_transacao` date NOT NULL,
  `hora_transacao` time NOT NULL,
  `numero_cartao` varchar(19) NOT NULL,
  `valor_transacao` decimal(10,2) NOT NULL,
  `valor_saque` decimal(10,2) NOT NULL,
  `valor_taxa_servico` decimal(10,2) NOT NULL,
  `numero_parcelas` decimal(10,0) NOT NULL,
  `numero_parcela_paga` decimal(10,0) NOT NULL,
  `valor_parcela_paga` decimal(10,2) NOT NULL,
  `data_pagamento` date DEFAULT NULL,
  `codigo_autorizacao` decimal(10,0) NOT NULL,
  `forma_captura` varchar(3) NOT NULL,
  `status_transacao` varchar(2) NOT NULL,
  `modalidade_pagamento` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_ltm_transacoes_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_ltm_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_mercadopago1_antecipacao`
--

DROP TABLE IF EXISTS `conn_item_mercadopago1_antecipacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_mercadopago1_antecipacao` (
  `item_id` int(10) unsigned NOT NULL,
  `tipo_registro` decimal(1,0) DEFAULT NULL,
  `estabelecimento` decimal(10,0) DEFAULT NULL,
  `data_inicial_transacao` date DEFAULT NULL,
  `hora_inicial_transacao` time DEFAULT NULL,
  `data_venda_ajuste` date DEFAULT NULL,
  `hora_venda_ajuste` time DEFAULT NULL,
  `tipo_evento` decimal(2,0) DEFAULT NULL,
  `tipo_transacao` decimal(2,0) DEFAULT NULL,
  `codigo_transacao` varchar(32) DEFAULT NULL,
  `codigo_venda` varchar(20) DEFAULT NULL,
  `valor_total_transacao` decimal(10,2) DEFAULT NULL,
  `valor_parcela` decimal(10,2) DEFAULT NULL,
  `plano` decimal(2,0) DEFAULT NULL,
  `parcela` decimal(2,0) DEFAULT NULL,
  `quantidade_parcela` decimal(2,0) DEFAULT NULL,
  `data_prevista_pagamento` date DEFAULT NULL,
  `data_movimentacao` date DEFAULT NULL,
  `valor_liquido_transacao` decimal(10,2) DEFAULT NULL,
  `taxa_antecipacao` decimal(10,2) DEFAULT NULL,
  `valor_liquido_antecipacao` decimal(10,2) DEFAULT NULL,
  `status_pagamento` decimal(2,0) DEFAULT NULL,
  `num_logico` varchar(32) DEFAULT NULL,
  `nsu` varchar(14) DEFAULT NULL,
  `cartao_bin` varchar(6) DEFAULT NULL,
  `cartao_holder` varchar(4) DEFAULT NULL,
  `codigo_autorizacao` varchar(6) DEFAULT NULL,
  `codigo_cv` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_mercadopago1_antecipacao_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_mercadopago1_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_mercadopago1_financeiro`
--

DROP TABLE IF EXISTS `conn_item_mercadopago1_financeiro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_mercadopago1_financeiro` (
  `item_id` int(10) unsigned NOT NULL,
  `tipo_registro` decimal(1,0) DEFAULT NULL,
  `estabelecimento` decimal(10,0) DEFAULT NULL,
  `data_inicial_transacao` date DEFAULT NULL,
  `hora_inicial_transacao` time DEFAULT NULL,
  `data_venda_ajuste` date DEFAULT NULL,
  `hora_venda_ajuste` time DEFAULT NULL,
  `tipo_evento` decimal(2,0) DEFAULT NULL,
  `tipo_transacao` decimal(2,0) DEFAULT NULL,
  `codigo_transacao` varchar(32) DEFAULT NULL,
  `codigo_venda` varchar(20) DEFAULT NULL,
  `valor_total_transacao` decimal(10,2) DEFAULT NULL,
  `valor_parcela` decimal(10,2) DEFAULT NULL,
  `pagamento_prazo` varchar(1) DEFAULT NULL,
  `plano` decimal(2,0) DEFAULT NULL,
  `parcela` decimal(2,0) DEFAULT NULL,
  `quantidade_parcela` decimal(2,0) DEFAULT NULL,
  `data_movimentacao` date DEFAULT NULL,
  `taxa_parcela_comprador` decimal(10,2) DEFAULT NULL,
  `tarifa_boleto_compra` decimal(10,2) DEFAULT NULL,
  `valor_original_transacao` decimal(10,2) DEFAULT NULL,
  `taxa_parcela_vendedor` decimal(10,2) DEFAULT NULL,
  `taxa_intermediacao` decimal(10,2) DEFAULT NULL,
  `tarifa_intermediacao` decimal(10,2) DEFAULT NULL,
  `tarifa_boleto_vendedor` decimal(10,2) DEFAULT NULL,
  `taxa_rep_aplicacao` decimal(10,2) DEFAULT NULL,
  `valor_liquido_transacao` decimal(10,2) DEFAULT NULL,
  `taxa_antecipacao` decimal(10,2) DEFAULT NULL,
  `valor_liquido_antecipacao` decimal(10,2) DEFAULT NULL,
  `status_pagamento` decimal(2,0) DEFAULT NULL,
  `identificador_revenda` varchar(2) DEFAULT NULL,
  `meio_pagamento` decimal(2,0) DEFAULT NULL,
  `instituicao_financeira` varchar(30) DEFAULT NULL,
  `canal_entrada` varchar(2) DEFAULT NULL,
  `leitor` decimal(2,0) DEFAULT NULL,
  `meio_captura` decimal(2,0) DEFAULT NULL,
  `cod_banco` decimal(6,0) DEFAULT NULL,
  `banco_agencia` varchar(9) DEFAULT NULL,
  `conta_banco` varchar(16) DEFAULT NULL,
  `num_logico` varchar(32) DEFAULT NULL,
  `nsu` varchar(14) DEFAULT NULL,
  `cartao_bin` varchar(6) DEFAULT NULL,
  `cartao_holder` varchar(4) DEFAULT NULL,
  `codigo_autorizacao` varchar(6) DEFAULT NULL,
  `codigo_cv` varchar(32) DEFAULT NULL,
  `numero_serie_leitor` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_mercadopago1_financeiro_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_mercadopago1_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_mercadopago1_line`
--

DROP TABLE IF EXISTS `conn_item_mercadopago1_line`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_mercadopago1_line` (
  `item_id` int(10) unsigned NOT NULL,
  `register_type` decimal(1,0) DEFAULT NULL,
  `movimento_api_codigo` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  UNIQUE KEY `movimento_api_codigo` (`movimento_api_codigo`),
  CONSTRAINT `conn_item_mercadopago1_line_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `vooo_prod_backend`.`connection_item` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_mercadopago1_transacional`
--

DROP TABLE IF EXISTS `conn_item_mercadopago1_transacional`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_mercadopago1_transacional` (
  `item_id` int(10) unsigned NOT NULL,
  `tipo_registro` decimal(1,0) DEFAULT NULL,
  `estabelecimento` decimal(10,0) DEFAULT NULL,
  `data_inicial_transacao` date DEFAULT NULL,
  `hora_inicial_transacao` time DEFAULT NULL,
  `data_venda_ajuste` date DEFAULT NULL,
  `hora_venda_ajuste` time DEFAULT NULL,
  `tipo_evento` decimal(2,0) DEFAULT NULL,
  `tipo_transacao` decimal(2,0) DEFAULT NULL,
  `codigo_transacao` varchar(32) DEFAULT NULL,
  `codigo_venda` varchar(20) DEFAULT NULL,
  `valor_total_transacao` decimal(10,2) DEFAULT NULL,
  `valor_parcela` decimal(10,2) DEFAULT NULL,
  `pagamento_prazo` varchar(1) DEFAULT NULL,
  `plano` decimal(2,0) DEFAULT NULL,
  `parcela` decimal(2,0) DEFAULT NULL,
  `quantidade_parcela` decimal(2,0) DEFAULT NULL,
  `data_prevista_pagamento` date DEFAULT NULL,
  `taxa_parcela_comprador` decimal(10,2) DEFAULT NULL,
  `tarifa_boleto_compra` decimal(10,2) DEFAULT NULL,
  `valor_original_transacao` decimal(10,2) DEFAULT NULL,
  `taxa_parcela_vendedor` decimal(10,2) DEFAULT NULL,
  `taxa_intermediacao` decimal(10,2) DEFAULT NULL,
  `tarifa_intermediacao` decimal(10,2) DEFAULT NULL,
  `tarifa_boleto_vendedor` decimal(10,2) DEFAULT NULL,
  `taxa_rep_aplicacao` decimal(10,2) DEFAULT NULL,
  `valor_liquido_transacao` decimal(10,2) DEFAULT NULL,
  `status_pagamento` decimal(2,0) DEFAULT NULL,
  `meio_pagamento` decimal(2,0) DEFAULT NULL,
  `instituicao_financeira` varchar(30) DEFAULT NULL,
  `canal_entrada` varchar(2) DEFAULT NULL,
  `leitor` decimal(2,0) DEFAULT NULL,
  `meio_captura` decimal(2,0) DEFAULT NULL,
  `num_logico` varchar(32) DEFAULT NULL,
  `nsu` varchar(14) DEFAULT NULL,
  `cartao_bin` varchar(6) DEFAULT NULL,
  `cartao_holder` varchar(4) DEFAULT NULL,
  `codigo_autorizacao` varchar(6) DEFAULT NULL,
  `codigo_cv` varchar(32) DEFAULT NULL,
  `numero_serie_leitor` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_mercadopago1_transacional_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_mercadopago1_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_mercadopago_api_bank_report`
--

DROP TABLE IF EXISTS `conn_item_mercadopago_api_bank_report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_mercadopago_api_bank_report` (
  `item_id` int(10) unsigned NOT NULL,
  `bank_date` datetime DEFAULT NULL,
  `source_id` bigint(20) unsigned DEFAULT NULL,
  `external_reference` varchar(120) DEFAULT NULL,
  `record_type` varchar(30) DEFAULT NULL,
  `description` varchar(120) DEFAULT NULL,
  `net_credit_amount` decimal(15,2) DEFAULT NULL,
  `net_debit_amount` decimal(15,2) DEFAULT NULL,
  `gross_amount` decimal(15,2) DEFAULT NULL,
  `mp_fee_amount` decimal(10,4) DEFAULT NULL,
  `financing_fee_amount` decimal(10,4) DEFAULT NULL,
  `shipping_fee_amount` decimal(10,4) DEFAULT NULL,
  `taxes_amount` decimal(10,4) DEFAULT NULL,
  `coupon_amount` decimal(10,4) DEFAULT NULL,
  `installments` smallint(6) DEFAULT NULL,
  `payment_method` varchar(30) DEFAULT NULL,
  `tax_detail` varchar(60) DEFAULT NULL,
  `tax_amount_telco` decimal(10,4) DEFAULT NULL,
  `transaction_approval_date` datetime DEFAULT NULL,
  `pos_id` varchar(50) DEFAULT NULL,
  `pos_name` varchar(50) DEFAULT NULL,
  `external_pos_id` varchar(50) DEFAULT NULL,
  `store_id` varchar(50) DEFAULT NULL,
  `store_name` varchar(50) DEFAULT NULL,
  `external_store_id` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  KEY `ix_vooo_prod_rawdata_conn_item_mercadopago_api_bank_repo_312c` (`bank_date`),
  KEY `ix_vooo_prod_rawdata_conn_item_mercadopago_api_bank_repo_2a0c` (`source_id`),
  KEY `idx_settlement` (`source_id`,`description`,`record_type`),
  CONSTRAINT `conn_item_mercadopago_api_bank_report_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_mercadopago_api_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_mercadopago_api_bank_summary`
--

DROP TABLE IF EXISTS `conn_item_mercadopago_api_bank_summary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_mercadopago_api_bank_summary` (
  `item_id` int(10) unsigned NOT NULL,
  `record_type` varchar(30) DEFAULT NULL,
  `description` varchar(120) DEFAULT NULL,
  `net_credit_amount` decimal(15,2) DEFAULT NULL,
  `net_debit_amount` decimal(15,2) DEFAULT NULL,
  `gross_amount` decimal(15,2) DEFAULT NULL,
  `mp_fee_amount` decimal(10,4) DEFAULT NULL,
  `financing_fee_amount` decimal(10,4) DEFAULT NULL,
  `shipping_fee_amount` decimal(10,4) DEFAULT NULL,
  `taxes_amount` decimal(10,4) DEFAULT NULL,
  `coupon_amount` decimal(10,4) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_mercadopago_api_bank_summary_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_mercadopago_api_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_mercadopago_api_header`
--

DROP TABLE IF EXISTS `conn_item_mercadopago_api_header`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_mercadopago_api_header` (
  `item_id` int(10) unsigned NOT NULL,
  `id` int(10) unsigned DEFAULT NULL,
  `user_id` int(10) unsigned DEFAULT NULL,
  `begin_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `file_name` varchar(80) DEFAULT NULL,
  `created_from` varchar(30) DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  `download_date` datetime DEFAULT NULL,
  `status` varchar(30) DEFAULT NULL,
  `internal_management` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_mercadopago_api_header_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_mercadopago_api_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_mercadopago_api_line`
--

DROP TABLE IF EXISTS `conn_item_mercadopago_api_line`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_mercadopago_api_line` (
  `item_id` int(10) unsigned NOT NULL,
  `register_type` smallint(6) DEFAULT NULL,
  `master_id` int(10) unsigned DEFAULT NULL,
  `duplicated` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`item_id`),
  KEY `master_id` (`master_id`),
  CONSTRAINT `conn_item_mercadopago_api_line_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `vooo_prod_backend`.`connection_item` (`item_id`),
  CONSTRAINT `conn_item_mercadopago_api_line_ibfk_2` FOREIGN KEY (`master_id`) REFERENCES `conn_item_mercadopago_api_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_mercadopago_api_settlement_report`
--

DROP TABLE IF EXISTS `conn_item_mercadopago_api_settlement_report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_mercadopago_api_settlement_report` (
  `item_id` int(10) unsigned NOT NULL,
  `external_reference` varchar(120) DEFAULT NULL,
  `source_id` bigint(20) unsigned DEFAULT NULL,
  `user_id` int(10) unsigned DEFAULT NULL,
  `payment_method_type` varchar(30) DEFAULT NULL,
  `payment_method` varchar(30) DEFAULT NULL,
  `site` varchar(30) DEFAULT NULL,
  `transaction_type` varchar(30) DEFAULT NULL,
  `transaction_amount` decimal(15,2) DEFAULT NULL,
  `transaction_currency` varchar(3) DEFAULT NULL,
  `seller_amount` decimal(15,2) DEFAULT NULL,
  `transaction_date` datetime DEFAULT NULL,
  `fee_amount` decimal(10,4) DEFAULT NULL,
  `settlement_net_amount` decimal(10,4) DEFAULT NULL,
  `settlement_currency` varchar(3) DEFAULT NULL,
  `settlement_date` datetime DEFAULT NULL,
  `real_amount` decimal(10,4) DEFAULT NULL,
  `coupon_amount` decimal(10,4) DEFAULT NULL,
  `mkp_fee_amount` decimal(10,4) DEFAULT NULL,
  `financing_fee_amount` decimal(10,4) DEFAULT NULL,
  `shipping_fee_amount` decimal(10,4) DEFAULT NULL,
  `taxes_amount` decimal(10,4) DEFAULT NULL,
  `installments` smallint(6) DEFAULT NULL,
  `tax_detail` varchar(60) DEFAULT NULL,
  `tax_amount_telco` decimal(10,4) DEFAULT NULL,
  `pos_id` varchar(50) DEFAULT NULL,
  `store_id` varchar(50) DEFAULT NULL,
  `store_name` varchar(50) DEFAULT NULL,
  `external_pos_id` varchar(50) DEFAULT NULL,
  `pos_name` varchar(50) DEFAULT NULL,
  `external_store_id` varchar(50) DEFAULT NULL,
  `fee_prevision` decimal(10,4) DEFAULT NULL,
  `order_id` varchar(50) DEFAULT NULL,
  `shipping_id` varchar(50) DEFAULT NULL,
  `shipment_mode` varchar(50) DEFAULT NULL,
  `pack_id` varchar(50) DEFAULT NULL,
  `metadata_json` text,
  PRIMARY KEY (`item_id`),
  KEY `ix_vooo_prod_rawdata_conn_item_mercadopago_api_settlemen_3b8b` (`user_id`),
  KEY `ix_vooo_prod_rawdata_conn_item_mercadopago_api_settlemen_4636` (`source_id`),
  KEY `ix_vooo_prod_rawdata_conn_item_mercadopago_api_settlemen_60a3` (`transaction_date`),
  KEY `idx_external_reference` (`external_reference`),
  KEY `idx_settlement_date` (`settlement_date`),
  CONSTRAINT `conn_item_mercadopago_api_settlement_report_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_mercadopago_api_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_mgcard_aj`
--

DROP TABLE IF EXISTS `conn_item_mgcard_aj`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_mgcard_aj` (
  `item_id` int(10) unsigned NOT NULL,
  `codigo_registro` varchar(2) NOT NULL,
  `identificacao_loja` varchar(15) DEFAULT NULL,
  `nsu_transacao_original` varchar(12) DEFAULT NULL,
  `data_transacao_original` date DEFAULT NULL,
  `numero_parcela` int(2) DEFAULT NULL,
  `nsu_transacao` varchar(12) DEFAULT NULL,
  `data_transacao_aj` date DEFAULT NULL,
  `hora_transacao_aj` time DEFAULT NULL,
  `tipo_lancamento` int(1) DEFAULT NULL,
  `data_lancamento` date DEFAULT NULL,
  `meio_captura_ajuste` int(1) DEFAULT NULL,
  `tipo_ajuste` int(1) DEFAULT NULL,
  `codigo_ajuste` varchar(3) DEFAULT NULL,
  `descricao_motivo_ajuste` varchar(30) DEFAULT NULL,
  `valor_bruto` decimal(10,2) DEFAULT NULL,
  `valor_desconto_comissao` decimal(10,2) DEFAULT NULL,
  `valor_liquido` decimal(10,2) DEFAULT NULL,
  `banco` varchar(3) DEFAULT NULL,
  `agencia` varchar(6) DEFAULT NULL,
  `conta` varchar(11) DEFAULT NULL,
  `numero_cartao_transacao_original` varchar(19) DEFAULT NULL,
  `codigo_bandeira` varchar(3) DEFAULT NULL,
  `codigo_produto` varchar(3) DEFAULT NULL,
  `nseq` varchar(6) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_mgcard_aj_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_mgcard_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_mgcard_cc`
--

DROP TABLE IF EXISTS `conn_item_mgcard_cc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_mgcard_cc` (
  `item_id` int(10) unsigned NOT NULL,
  `codigo_registro` varchar(2) NOT NULL,
  `identificacao_loja` varchar(15) DEFAULT NULL,
  `nsu_transacao_original` varchar(12) DEFAULT NULL,
  `data_transacao_original` date DEFAULT NULL,
  `numero_parcela` int(2) DEFAULT NULL,
  `nsu_transacao` varchar(12) DEFAULT NULL,
  `data_transacao` date DEFAULT NULL,
  `hora_transacao` time DEFAULT NULL,
  `meio_captura` int(1) DEFAULT NULL,
  `nseq` varchar(6) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  KEY `ix_vooo_prod_rawdata_conn_item_mgcard_cc_nsu_transacao_original` (`nsu_transacao_original`),
  CONSTRAINT `conn_item_mgcard_cc_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_mgcard_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_mgcard_cp`
--

DROP TABLE IF EXISTS `conn_item_mgcard_cp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_mgcard_cp` (
  `item_id` int(10) unsigned NOT NULL,
  `codigo_registro` varchar(2) NOT NULL,
  `identificacao_loja` varchar(15) DEFAULT NULL,
  `nsu` int(12) DEFAULT NULL,
  `data_transacao` date DEFAULT NULL,
  `hora_transacao` time DEFAULT NULL,
  `tipo_lancamento` int(1) DEFAULT NULL,
  `data_lancamento` date DEFAULT NULL,
  `meio_captura` int(1) DEFAULT NULL,
  `valor_bruto_pagamento` decimal(10,2) DEFAULT NULL,
  `valor_desconto` decimal(10,2) DEFAULT NULL,
  `valor_liquido_pagamento` decimal(10,2) DEFAULT NULL,
  `numero_cartao` varchar(19) DEFAULT NULL,
  `numero_meios_pagamento` varchar(3) DEFAULT NULL,
  `meio_pagamento` int(1) DEFAULT NULL,
  `sequencial_meio_pagamento` int(2) DEFAULT NULL,
  `valor_meio_pagamento` decimal(10,2) DEFAULT NULL,
  `banco` varchar(3) DEFAULT NULL,
  `agencia` varchar(6) DEFAULT NULL,
  `conta` varchar(11) DEFAULT NULL,
  `codigo_autorizacao` varchar(12) DEFAULT NULL,
  `nseq` int(6) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_mgcard_cp_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_mgcard_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_mgcard_cv`
--

DROP TABLE IF EXISTS `conn_item_mgcard_cv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_mgcard_cv` (
  `item_id` int(10) unsigned NOT NULL,
  `codigo_registro` varchar(2) NOT NULL,
  `identificacao_loja` varchar(15) DEFAULT NULL,
  `nsu` varchar(12) DEFAULT NULL,
  `data_transacao` date DEFAULT NULL,
  `hora_transacao` time DEFAULT NULL,
  `tipo_lancamento` int(1) DEFAULT NULL,
  `data_lancamento` date DEFAULT NULL,
  `tipo_produto` varchar(1) DEFAULT NULL,
  `meio_captura` int(1) DEFAULT NULL,
  `valor_bruto_venda` decimal(10,2) DEFAULT NULL,
  `valor_desconto` decimal(10,2) DEFAULT NULL,
  `valor_liquido_venda` decimal(10,2) DEFAULT NULL,
  `numero_cartao` varchar(19) DEFAULT NULL,
  `numero_parcela` int(2) DEFAULT NULL,
  `numero_total_parcelas` int(2) DEFAULT NULL,
  `nsu_parcela` varchar(12) DEFAULT NULL,
  `valor_bruto_parcela` decimal(10,2) DEFAULT NULL,
  `valor_desconto_parcela` decimal(10,2) DEFAULT NULL,
  `valor_liquido_parcela` decimal(10,2) DEFAULT NULL,
  `banco` varchar(3) DEFAULT NULL,
  `agencia` varchar(6) DEFAULT NULL,
  `conta` varchar(11) DEFAULT NULL,
  `codigo_autorizacao` varchar(12) DEFAULT NULL,
  `codigo_bandeira` varchar(3) DEFAULT NULL,
  `codigo_produto` varchar(3) DEFAULT NULL,
  `nseq` varchar(6) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  KEY `ix_vooo_prod_rawdata_conn_item_mgcard_cv_nsu` (`nsu`),
  KEY `ix_vooo_prod_rawdata_conn_item_mgcard_cv_identificacao_loja` (`identificacao_loja`),
  CONSTRAINT `conn_item_mgcard_cv_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_mgcard_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_mgcard_header_arquivo`
--

DROP TABLE IF EXISTS `conn_item_mgcard_header_arquivo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_mgcard_header_arquivo` (
  `item_id` int(10) unsigned NOT NULL,
  `codigo_registro` varchar(2) NOT NULL,
  `versao_layout` varchar(6) DEFAULT NULL,
  `data_geracao_arquivo` date DEFAULT NULL,
  `hora_geracao_arquivo` time DEFAULT NULL,
  `id_movimento` varchar(6) DEFAULT NULL,
  `nome_administradora` varchar(30) DEFAULT NULL,
  `identificacao_remetente` int(4) DEFAULT NULL,
  `identificacao_destinatario` int(6) DEFAULT NULL,
  `tipo_processamento` varchar(1) DEFAULT NULL,
  `nseq_registro` varchar(6) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_mgcard_header_arquivo_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_mgcard_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_mgcard_header_lote`
--

DROP TABLE IF EXISTS `conn_item_mgcard_header_lote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_mgcard_header_lote` (
  `item_id` int(10) unsigned NOT NULL,
  `codigo_registro` varchar(2) NOT NULL,
  `data_movimento` date DEFAULT NULL,
  `identificacao_moeda` varchar(2) DEFAULT NULL,
  `nseq` varchar(6) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_mgcard_header_lote_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_mgcard_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_mgcard_line`
--

DROP TABLE IF EXISTS `conn_item_mgcard_line`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_mgcard_line` (
  `item_id` int(10) unsigned NOT NULL,
  `registertype` varchar(2) NOT NULL,
  `masterid` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  KEY `masterid` (`masterid`),
  CONSTRAINT `conn_item_mgcard_line_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `vooo_prod_backend`.`connection_item` (`item_id`),
  CONSTRAINT `conn_item_mgcard_line_ibfk_2` FOREIGN KEY (`masterid`) REFERENCES `conn_item_mgcard_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_mgcard_trailer_arquivo`
--

DROP TABLE IF EXISTS `conn_item_mgcard_trailer_arquivo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_mgcard_trailer_arquivo` (
  `item_id` int(10) unsigned NOT NULL,
  `codigo_registro` varchar(2) NOT NULL,
  `total_geral_registros` int(6) DEFAULT NULL,
  `nseq` varchar(6) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_mgcard_trailer_arquivo_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_mgcard_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_mgcard_trailer_lote`
--

DROP TABLE IF EXISTS `conn_item_mgcard_trailer_lote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_mgcard_trailer_lote` (
  `item_id` int(10) unsigned NOT NULL,
  `codigo_registro` varchar(2) NOT NULL,
  `total_registros_transacao` int(6) DEFAULT NULL,
  `total_valores_creditos` decimal(10,2) DEFAULT NULL,
  `nseq` varchar(6) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_mgcard_trailer_lote_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_mgcard_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_nespresso_cognos_control`
--

DROP TABLE IF EXISTS `conn_item_nespresso_cognos_control`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_nespresso_cognos_control` (
  `item_id` int(10) unsigned NOT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `check_status` decimal(1,0) DEFAULT NULL,
  `registers` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  KEY `ix_vooo_prod_rawdata_conn_item_nespresso_cognos_control_end_date` (`end_date`),
  KEY `ix_vooo_prod_rawdata_conn_item_nespresso_cognos_control__8035` (`start_date`),
  CONSTRAINT `conn_item_nespresso_cognos_control_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_nespresso_cognos_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_nespresso_cognos_line`
--

DROP TABLE IF EXISTS `conn_item_nespresso_cognos_line`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_nespresso_cognos_line` (
  `item_id` int(10) unsigned NOT NULL,
  `register_type` varchar(15) DEFAULT NULL,
  `masterid` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  KEY `masterid` (`masterid`),
  CONSTRAINT `conn_item_nespresso_cognos_line_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `vooo_prod_backend`.`connection_item` (`item_id`),
  CONSTRAINT `conn_item_nespresso_cognos_line_ibfk_2` FOREIGN KEY (`masterid`) REFERENCES `conn_item_nespresso_cognos_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_nespresso_cognos_transaction`
--

DROP TABLE IF EXISTS `conn_item_nespresso_cognos_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_nespresso_cognos_transaction` (
  `item_id` int(10) unsigned NOT NULL,
  `Order` varchar(20) DEFAULT NULL,
  `External_Reference_Id` varchar(100) DEFAULT NULL,
  `Order_Source_Descr` varchar(50) DEFAULT NULL,
  `Date` date DEFAULT NULL,
  `Input_Time` time DEFAULT NULL,
  `status` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  KEY `idx_nespresso_cognos_transaction_1` (`Order`),
  CONSTRAINT `conn_item_nespresso_cognos_transaction_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_nespresso_cognos_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_nespresso_family_control`
--

DROP TABLE IF EXISTS `conn_item_nespresso_family_control`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_nespresso_family_control` (
  `item_id` int(10) unsigned NOT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `check_status` decimal(1,0) DEFAULT NULL,
  `registers` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  KEY `ix_vooo_prod_rawdata_conn_item_nespresso_family_control_end_date` (`end_date`),
  KEY `ix_vooo_prod_rawdata_conn_item_nespresso_family_control__0906` (`start_date`),
  CONSTRAINT `conn_item_nespresso_family_control_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_nespresso_family_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_nespresso_family_line`
--

DROP TABLE IF EXISTS `conn_item_nespresso_family_line`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_nespresso_family_line` (
  `item_id` int(10) unsigned NOT NULL,
  `register_type` varchar(15) DEFAULT NULL,
  `masterid` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  KEY `masterid` (`masterid`),
  CONSTRAINT `conn_item_nespresso_family_line_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `vooo_prod_backend`.`connection_item` (`item_id`),
  CONSTRAINT `conn_item_nespresso_family_line_ibfk_2` FOREIGN KEY (`masterid`) REFERENCES `conn_item_nespresso_family_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_nespresso_family_transaction`
--

DROP TABLE IF EXISTS `conn_item_nespresso_family_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_nespresso_family_transaction` (
  `item_id` int(10) unsigned NOT NULL,
  `Order` varchar(20) DEFAULT NULL,
  `Third` varchar(20) DEFAULT NULL,
  `Delivery_Date` date DEFAULT NULL,
  `CPF` varchar(20) DEFAULT NULL,
  `status` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  KEY `idx_nessoft_family_transaction|_1` (`Delivery_Date`,`Third`),
  KEY `idx_nessoft_family_transaction|_2` (`Order`),
  CONSTRAINT `conn_item_nespresso_family_transaction_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_nespresso_family_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_nessoft_control`
--

DROP TABLE IF EXISTS `conn_item_nessoft_control`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_nessoft_control` (
  `item_id` int(10) unsigned NOT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `check_status` decimal(1,0) DEFAULT NULL,
  `registers` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_nessoft_control_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_nessoft_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_nessoft_line`
--

DROP TABLE IF EXISTS `conn_item_nessoft_line`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_nessoft_line` (
  `item_id` int(10) unsigned NOT NULL,
  `register_type` varchar(15) DEFAULT NULL,
  `masterid` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  KEY `masterid` (`masterid`),
  CONSTRAINT `conn_item_nessoft_line_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `vooo_prod_backend`.`connection_item` (`item_id`),
  CONSTRAINT `conn_item_nessoft_line_ibfk_2` FOREIGN KEY (`masterid`) REFERENCES `conn_item_nessoft_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_nessoft_link`
--

DROP TABLE IF EXISTS `conn_item_nessoft_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_nessoft_link` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nessoft_transaction_id` int(10) unsigned NOT NULL,
  `reference_type` varchar(2) DEFAULT NULL,
  `reference_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `nessoft_transaction_id` (`nessoft_transaction_id`),
  KEY `reference_transaction_id` (`reference_id`,`reference_type`),
  CONSTRAINT `conn_item_nessoft_link_ibfk_1` FOREIGN KEY (`nessoft_transaction_id`) REFERENCES `conn_item_nessoft_transaction` (`item_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12178924 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_nessoft_transaction`
--

DROP TABLE IF EXISTS `conn_item_nessoft_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_nessoft_transaction` (
  `item_id` int(10) unsigned NOT NULL,
  `payment_mode` varchar(2) DEFAULT NULL,
  `entry_type` varchar(2) DEFAULT NULL,
  `customer` decimal(10,0) DEFAULT NULL,
  `invoice` decimal(10,0) DEFAULT NULL,
  `voucher` varchar(15) DEFAULT NULL,
  `value_date` date DEFAULT NULL,
  `order_code` decimal(10,0) DEFAULT NULL,
  `order_date` date DEFAULT NULL,
  `order_time` time DEFAULT NULL,
  `signal` varchar(1) DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `currency` varchar(3) DEFAULT NULL,
  `user` varchar(20) DEFAULT NULL,
  `order_user` varchar(20) NOT NULL,
  `provider_trans_id` varchar(60) DEFAULT NULL,
  `payment_module` varchar(20) DEFAULT NULL,
  `cash_register` varchar(20) DEFAULT NULL,
  `installment` decimal(2,0) DEFAULT NULL,
  `technologies` varchar(10) DEFAULT NULL,
  `reconciliation_id` varchar(60) DEFAULT NULL,
  `imported_order_id` varchar(30) DEFAULT NULL,
  `status` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  KEY `idx_conn_item_nessoft_transaction_1` (`customer`,`amount`),
  KEY `idx_nessoft_transaction_1` (`order_code`,`value_date`,`reconciliation_id`,`payment_mode`,`entry_type`),
  CONSTRAINT `conn_item_nessoft_transaction_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_nessoft_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_nupay_ajuste`
--

DROP TABLE IF EXISTS `conn_item_nupay_ajuste`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_nupay_ajuste` (
  `item_id` int(10) unsigned NOT NULL,
  `id_lote_liquidacao` varchar(64) DEFAULT NULL,
  `data_liquidacao` date DEFAULT NULL,
  `tipo` varchar(50) DEFAULT NULL,
  `sub_tipo` varchar(50) DEFAULT NULL,
  `id_extorno` varchar(50) DEFAULT NULL,
  `data_extorno` date DEFAULT NULL,
  `status_extorno` varchar(50) DEFAULT NULL,
  `valor` decimal(11,2) DEFAULT NULL,
  `num_estabelecimento` varchar(36) DEFAULT NULL,
  `nome_estabelecimento` varchar(36) DEFAULT NULL,
  `ordem` int(11) DEFAULT NULL,
  `tid` varchar(64) DEFAULT NULL,
  `valor_ordem` decimal(11,2) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_nupay_ajuste_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_nupay_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_nupay_header`
--

DROP TABLE IF EXISTS `conn_item_nupay_header`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_nupay_header` (
  `item_id` int(10) unsigned NOT NULL,
  `file_type` varchar(30) DEFAULT NULL,
  `file_name` varchar(80) DEFAULT NULL,
  `periodo_inicial` date DEFAULT NULL,
  `periodo_final` date DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_nupay_header_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_nupay_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_nupay_line`
--

DROP TABLE IF EXISTS `conn_item_nupay_line`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_nupay_line` (
  `item_id` int(10) unsigned NOT NULL,
  `register_type` smallint(6) NOT NULL,
  `masterid` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  KEY `masterid` (`masterid`),
  CONSTRAINT `conn_item_nupay_line_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `vooo_prod_backend`.`connection_item` (`item_id`),
  CONSTRAINT `conn_item_nupay_line_ibfk_2` FOREIGN KEY (`masterid`) REFERENCES `conn_item_nupay_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_nupay_pagamentos`
--

DROP TABLE IF EXISTS `conn_item_nupay_pagamentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_nupay_pagamentos` (
  `item_id` int(10) unsigned NOT NULL,
  `canal` varchar(15) DEFAULT NULL,
  `num_estabelecimento` varchar(36) DEFAULT NULL,
  `data_venda` date DEFAULT NULL,
  `data_autorizacao` date DEFAULT NULL,
  `ordem` varchar(20) DEFAULT NULL,
  `tid` varchar(64) DEFAULT NULL,
  `status_venda` varchar(15) DEFAULT NULL,
  `instituicao_pagador` varchar(50) DEFAULT NULL,
  `valor_bruto` decimal(11,2) DEFAULT NULL,
  `valor_liquido` decimal(11,2) DEFAULT NULL,
  `num_da_parcela` smallint(6) DEFAULT NULL,
  `plano` smallint(6) DEFAULT NULL,
  `valor_bruto_parcela` decimal(11,2) DEFAULT NULL,
  `valor_liquido_parcela` decimal(11,2) DEFAULT NULL,
  `taxa_admin` decimal(10,2) DEFAULT NULL,
  `valor_admin` decimal(11,2) DEFAULT NULL,
  `id_lote_liquidacao` varchar(64) DEFAULT NULL,
  `previsao_liquidacao` date DEFAULT NULL,
  `data_liquidacao` date DEFAULT NULL,
  `status_pagamento` varchar(15) DEFAULT NULL,
  `numero_banco` smallint(6) DEFAULT NULL,
  `agencia` int(11) DEFAULT NULL,
  `banco` varchar(50) DEFAULT NULL,
  `operacao` varchar(50) DEFAULT NULL,
  `taxa_fixa_admin` decimal(10,2) DEFAULT NULL,
  `percent_mdr` decimal(10,2) DEFAULT NULL,
  `valor_mdr` decimal(10,2) DEFAULT NULL,
  `forma_pagamento` varchar(30) DEFAULT NULL,
  `conta_corrente` int(11) DEFAULT NULL,
  `valor_custo_capital` decimal(10,2) DEFAULT NULL,
  `taxa_custo_capital` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_nupay_pagamentos_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_nupay_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_ofx_account`
--

DROP TABLE IF EXISTS `conn_item_ofx_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_ofx_account` (
  `item_id` int(10) unsigned NOT NULL,
  `curdef` varchar(50) DEFAULT NULL,
  `account_id` decimal(30,0) DEFAULT NULL,
  `routing_number` decimal(30,0) DEFAULT NULL,
  `branch_id` decimal(30,0) DEFAULT NULL,
  `account_type` varchar(50) DEFAULT NULL,
  `institution` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_ofx_account_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_ofx_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_ofx_line`
--

DROP TABLE IF EXISTS `conn_item_ofx_line`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_ofx_line` (
  `item_id` int(10) unsigned NOT NULL,
  `typedef` varchar(15) DEFAULT NULL,
  `masterid` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  KEY `masterid` (`masterid`),
  CONSTRAINT `conn_item_ofx_line_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `vooo_prod_backend`.`connection_item` (`item_id`),
  CONSTRAINT `conn_item_ofx_line_ibfk_2` FOREIGN KEY (`masterid`) REFERENCES `conn_item_ofx_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_ofx_statement`
--

DROP TABLE IF EXISTS `conn_item_ofx_statement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_ofx_statement` (
  `item_id` int(10) unsigned NOT NULL,
  `start_date` date DEFAULT NULL,
  `start_time` time DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `end_time` time DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_ofx_statement_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_ofx_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_ofx_transaction`
--

DROP TABLE IF EXISTS `conn_item_ofx_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_ofx_transaction` (
  `item_id` int(10) unsigned NOT NULL,
  `payee` varchar(50) DEFAULT NULL,
  `type` varchar(30) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `time` time DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `id` varchar(30) DEFAULT NULL,
  `memo` varchar(150) DEFAULT NULL,
  `sic` varchar(30) DEFAULT NULL,
  `mcc` varchar(30) DEFAULT NULL,
  `checknum` decimal(30,0) DEFAULT NULL,
  `tipo_movimentacao` varchar(100) DEFAULT NULL,
  `consolidado_saldo` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_ofx_transaction_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_ofx_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_pagarme_header`
--

DROP TABLE IF EXISTS `conn_item_pagarme_header`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_pagarme_header` (
  `item_id` int(10) unsigned NOT NULL,
  `date` datetime NOT NULL,
  `connector` int(11) NOT NULL,
  `client` int(11) NOT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_pagarme_header_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_pagarme_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_pagarme_line`
--

DROP TABLE IF EXISTS `conn_item_pagarme_line`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_pagarme_line` (
  `item_id` int(10) unsigned NOT NULL,
  `registertype` varchar(50) DEFAULT NULL,
  `masterid` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  KEY `masterid` (`masterid`),
  CONSTRAINT `conn_item_pagarme_line_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `vooo_prod_backend`.`connection_item` (`item_id`),
  CONSTRAINT `conn_item_pagarme_line_ibfk_2` FOREIGN KEY (`masterid`) REFERENCES `conn_item_pagarme_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_pagarme_payables_chargeback`
--

DROP TABLE IF EXISTS `conn_item_pagarme_payables_chargeback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_pagarme_payables_chargeback` (
  `item_id` int(10) unsigned NOT NULL,
  `id` int(11) DEFAULT NULL,
  `status` varchar(32) DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `fee` decimal(10,2) DEFAULT NULL,
  `anticipation_fee` decimal(10,2) DEFAULT NULL,
  `installment` int(11) DEFAULT NULL,
  `transaction_id` int(11) DEFAULT NULL,
  `payment_date` datetime DEFAULT NULL,
  `original_payment_date` datetime DEFAULT NULL,
  `type` varchar(32) DEFAULT NULL,
  `payment_method` varchar(32) DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  `accrual_date` datetime DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  KEY `ix_vooo_prod_rawdata_conn_item_pagarme_payables_chargeback_id` (`id`),
  CONSTRAINT `conn_item_pagarme_payables_chargeback_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_pagarme_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_pagarme_payables_chargeback_refund`
--

DROP TABLE IF EXISTS `conn_item_pagarme_payables_chargeback_refund`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_pagarme_payables_chargeback_refund` (
  `item_id` int(10) unsigned NOT NULL,
  `id` int(11) DEFAULT NULL,
  `status` varchar(32) DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `fee` decimal(10,2) DEFAULT NULL,
  `anticipation_fee` decimal(10,2) DEFAULT NULL,
  `installment` int(11) DEFAULT NULL,
  `transaction_id` int(11) DEFAULT NULL,
  `payment_date` datetime DEFAULT NULL,
  `original_payment_date` datetime DEFAULT NULL,
  `type` varchar(32) DEFAULT NULL,
  `payment_method` varchar(32) DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  `accrual_date` datetime DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  KEY `ix_vooo_prod_rawdata_conn_item_pagarme_payables_chargeba_f210` (`id`),
  CONSTRAINT `conn_item_pagarme_payables_chargeback_refund_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_pagarme_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_pagarme_payables_credit`
--

DROP TABLE IF EXISTS `conn_item_pagarme_payables_credit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_pagarme_payables_credit` (
  `item_id` int(10) unsigned NOT NULL,
  `id` int(11) DEFAULT NULL,
  `status` varchar(32) DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `fee` decimal(10,2) DEFAULT NULL,
  `anticipation_fee` decimal(10,2) DEFAULT NULL,
  `installment` int(11) DEFAULT NULL,
  `transaction_id` int(11) DEFAULT NULL,
  `payment_date` datetime DEFAULT NULL,
  `original_payment_date` datetime DEFAULT NULL,
  `type` varchar(32) DEFAULT NULL,
  `payment_method` varchar(32) DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  `accrual_date` datetime DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  KEY `ix_vooo_prod_rawdata_conn_item_pagarme_payables_credit_id` (`id`),
  CONSTRAINT `conn_item_pagarme_payables_credit_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_pagarme_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_pagarme_payables_paid`
--

DROP TABLE IF EXISTS `conn_item_pagarme_payables_paid`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_pagarme_payables_paid` (
  `item_id` int(10) unsigned NOT NULL,
  `id` int(11) DEFAULT NULL,
  `status` varchar(32) DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `fee` decimal(10,2) DEFAULT NULL,
  `anticipation_fee` decimal(10,2) DEFAULT NULL,
  `installment` int(11) DEFAULT NULL,
  `transaction_id` int(11) DEFAULT NULL,
  `payment_date` datetime DEFAULT NULL,
  `original_payment_date` datetime DEFAULT NULL,
  `type` varchar(32) DEFAULT NULL,
  `payment_method` varchar(32) DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  `accrual_date` datetime DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  KEY `ix_vooo_prod_rawdata_conn_item_pagarme_payables_paid_id` (`id`),
  CONSTRAINT `conn_item_pagarme_payables_paid_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_pagarme_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_pagarme_payables_refund`
--

DROP TABLE IF EXISTS `conn_item_pagarme_payables_refund`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_pagarme_payables_refund` (
  `item_id` int(10) unsigned NOT NULL,
  `id` int(11) DEFAULT NULL,
  `status` varchar(32) DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `fee` decimal(10,2) DEFAULT NULL,
  `anticipation_fee` decimal(10,2) DEFAULT NULL,
  `installment` int(11) DEFAULT NULL,
  `transaction_id` int(11) DEFAULT NULL,
  `payment_date` datetime DEFAULT NULL,
  `original_payment_date` datetime DEFAULT NULL,
  `type` varchar(32) DEFAULT NULL,
  `payment_method` varchar(32) DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  `accrual_date` datetime DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  KEY `ix_vooo_prod_rawdata_conn_item_pagarme_payables_refund_id` (`id`),
  CONSTRAINT `conn_item_pagarme_payables_refund_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_pagarme_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_pagarme_trailer`
--

DROP TABLE IF EXISTS `conn_item_pagarme_trailer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_pagarme_trailer` (
  `item_id` int(10) unsigned NOT NULL,
  `connector` int(11) NOT NULL,
  `client` int(11) NOT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_pagarme_trailer_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_pagarme_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_pagarme_transactions`
--

DROP TABLE IF EXISTS `conn_item_pagarme_transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_pagarme_transactions` (
  `item_id` int(10) unsigned NOT NULL,
  `id` int(11) DEFAULT NULL,
  `card_first_digits` varchar(6) DEFAULT NULL,
  `card_last_digits` varchar(4) DEFAULT NULL,
  `nsu` int(11) DEFAULT NULL,
  `tid` int(11) DEFAULT NULL,
  `card_brand` varchar(32) DEFAULT NULL,
  `authorization_code` varchar(128) DEFAULT NULL,
  `payment_method` varchar(32) DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  `installments` int(11) DEFAULT NULL,
  `status` varchar(32) DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `paid_amount` decimal(10,2) DEFAULT NULL,
  `refunded_amount` decimal(10,2) DEFAULT NULL,
  `authorized_amount` decimal(10,2) DEFAULT NULL,
  `cost` decimal(10,2) DEFAULT NULL,
  `acquirer_name` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  KEY `ix_vooo_prod_rawdata_conn_item_pagarme_transactions_id` (`id`),
  CONSTRAINT `conn_item_pagarme_transactions_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_pagarme_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_pago_header`
--

DROP TABLE IF EXISTS `conn_item_pago_header`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_pago_header` (
  `item_id` int(10) unsigned NOT NULL,
  `nome_empresa` varchar(30) DEFAULT NULL,
  `cnpj_empresa` varchar(14) DEFAULT NULL,
  `data_arquivo` date DEFAULT NULL,
  `hora_arquivo` time DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_pago_header_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_pago_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_pago_line`
--

DROP TABLE IF EXISTS `conn_item_pago_line`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_pago_line` (
  `item_id` int(10) unsigned NOT NULL,
  `registertype` decimal(1,0) DEFAULT NULL,
  `fileline` varchar(250) DEFAULT NULL,
  `masterid` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  KEY `masterid` (`masterid`),
  CONSTRAINT `conn_item_pago_line_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `vooo_prod_backend`.`connection_item` (`item_id`),
  CONSTRAINT `conn_item_pago_line_ibfk_2` FOREIGN KEY (`masterid`) REFERENCES `conn_item_pago_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_pago_trailer`
--

DROP TABLE IF EXISTS `conn_item_pago_trailer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_pago_trailer` (
  `item_id` int(10) unsigned NOT NULL,
  `qtde_registros` decimal(6,0) DEFAULT NULL,
  `valor_total` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_pago_trailer_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_pago_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_pago_transaction`
--

DROP TABLE IF EXISTS `conn_item_pago_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_pago_transaction` (
  `item_id` int(10) unsigned NOT NULL,
  `sequencial` decimal(6,0) DEFAULT NULL,
  `data_transacao` date DEFAULT NULL,
  `hora_transacao` time DEFAULT NULL,
  `valor_transacao` decimal(15,2) DEFAULT NULL,
  `numero_cartao` varchar(11) DEFAULT NULL,
  `nsu_pdv` decimal(6,0) DEFAULT NULL,
  `id_transacao` decimal(12,0) DEFAULT NULL,
  `pdv` decimal(3,0) DEFAULT NULL,
  `qtde_parcelas` decimal(2,0) DEFAULT NULL,
  `autorizacao` varchar(6) DEFAULT NULL,
  `codigo_resposta` decimal(2,0) DEFAULT NULL,
  `codigo_adquirente` decimal(2,0) DEFAULT NULL,
  `cnpj_estabelecimento` varchar(14) DEFAULT NULL,
  `tipo_transacao` decimal(2,0) DEFAULT NULL,
  `bandeira` decimal(2,0) DEFAULT NULL,
  `forma_parcelamento` decimal(2,0) DEFAULT NULL,
  `nsu_host` decimal(12,0) DEFAULT NULL,
  `mcc` decimal(6,0) DEFAULT NULL,
  `vbv` decimal(1,0) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  KEY `idx_conn_item_pago_transaction_id` (`id_transacao`),
  CONSTRAINT `conn_item_pago_transaction_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_pago_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_pagseguro2_control`
--

DROP TABLE IF EXISTS `conn_item_pagseguro2_control`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_pagseguro2_control` (
  `item_id` int(10) unsigned NOT NULL,
  `request_date` date NOT NULL,
  `reference_date` date NOT NULL,
  `inserted` decimal(10,0) NOT NULL,
  `duplicated` decimal(10,0) NOT NULL,
  `rejected` decimal(10,0) NOT NULL,
  `updated` decimal(10,0) NOT NULL,
  `not_updated` decimal(10,0) NOT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_pagseguro2_control_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_pagseguro2_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_pagseguro2_event`
--

DROP TABLE IF EXISTS `conn_item_pagseguro2_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_pagseguro2_event` (
  `item_id` int(10) unsigned NOT NULL,
  `transaction_item_id` int(10) unsigned NOT NULL,
  `from_date` datetime DEFAULT NULL,
  `from_status` decimal(2,0) DEFAULT NULL,
  `to_date` datetime NOT NULL,
  `to_status` decimal(2,0) NOT NULL,
  PRIMARY KEY (`item_id`),
  KEY `transaction_item_id` (`transaction_item_id`),
  CONSTRAINT `conn_item_pagseguro2_event_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_pagseguro2_line` (`item_id`),
  CONSTRAINT `conn_item_pagseguro2_event_ibfk_2` FOREIGN KEY (`transaction_item_id`) REFERENCES `conn_item_pagseguro2_transaction` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_pagseguro2_line`
--

DROP TABLE IF EXISTS `conn_item_pagseguro2_line`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_pagseguro2_line` (
  `item_id` int(10) unsigned NOT NULL,
  `line_type` varchar(2) DEFAULT NULL,
  `masterid` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  KEY `masterid` (`masterid`),
  CONSTRAINT `conn_item_pagseguro2_line_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `vooo_prod_backend`.`connection_item` (`item_id`),
  CONSTRAINT `conn_item_pagseguro2_line_ibfk_2` FOREIGN KEY (`masterid`) REFERENCES `conn_item_pagseguro2_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_pagseguro2_transaction`
--

DROP TABLE IF EXISTS `conn_item_pagseguro2_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_pagseguro2_transaction` (
  `item_id` int(10) unsigned NOT NULL,
  `date` datetime NOT NULL,
  `code` varchar(100) NOT NULL,
  `type` decimal(2,0) NOT NULL,
  `status` decimal(2,0) NOT NULL,
  `event_date` datetime NOT NULL,
  `payment_method_type` decimal(2,0) NOT NULL,
  `payment_method_code` decimal(5,0) NOT NULL,
  `gross_amount` decimal(10,2) NOT NULL,
  `discount_amount` decimal(10,2) NOT NULL,
  `installment_fee_amount` decimal(10,2) NOT NULL,
  `intermediation_fee_amount` decimal(10,2) NOT NULL,
  `net_amount` decimal(10,2) NOT NULL,
  `extra_amount` decimal(10,2) NOT NULL,
  `escrow_end_datetime` datetime DEFAULT NULL,
  `installment_count` decimal(3,0) NOT NULL,
  `public_key` varchar(100) NOT NULL,
  PRIMARY KEY (`item_id`),
  KEY `ix_vooo_prod_rawdata_conn_item_pagseguro2_transaction_status` (`status`),
  KEY `ix_vooo_prod_rawdata_conn_item_pagseguro2_transaction_code` (`code`),
  CONSTRAINT `conn_item_pagseguro2_transaction_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_pagseguro2_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_pagseguro3_antecipacao`
--

DROP TABLE IF EXISTS `conn_item_pagseguro3_antecipacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_pagseguro3_antecipacao` (
  `item_id` int(10) unsigned NOT NULL,
  `tipo_registro` decimal(1,0) DEFAULT NULL,
  `estabelecimento` decimal(10,0) DEFAULT NULL,
  `data_inicial_transacao` date DEFAULT NULL,
  `hora_inicial_transacao` time DEFAULT NULL,
  `data_venda_ajuste` date DEFAULT NULL,
  `hora_venda_ajuste` time DEFAULT NULL,
  `tipo_evento` decimal(2,0) DEFAULT NULL,
  `tipo_transacao` decimal(2,0) DEFAULT NULL,
  `codigo_transacao` varchar(32) DEFAULT NULL,
  `codigo_venda` varchar(20) DEFAULT NULL,
  `valor_total_transacao` decimal(10,2) DEFAULT NULL,
  `valor_parcela` decimal(10,2) DEFAULT NULL,
  `plano` decimal(2,0) DEFAULT NULL,
  `parcela` decimal(2,0) DEFAULT NULL,
  `quantidade_parcela` decimal(2,0) DEFAULT NULL,
  `data_prevista_pagamento` date DEFAULT NULL,
  `data_movimentacao` date DEFAULT NULL,
  `valor_liquido_transacao` decimal(10,2) DEFAULT NULL,
  `taxa_antecipacao` decimal(10,2) DEFAULT NULL,
  `valor_liquido_antecipacao` decimal(10,2) DEFAULT NULL,
  `status_pagamento` decimal(2,0) DEFAULT NULL,
  `num_logico` varchar(32) DEFAULT NULL,
  `nsu` varchar(14) DEFAULT NULL,
  `cartao_bin` varchar(6) DEFAULT NULL,
  `cartao_holder` varchar(4) DEFAULT NULL,
  `codigo_autorizacao` varchar(6) DEFAULT NULL,
  `codigo_cv` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_pagseguro3_antecipacao_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_pagseguro3_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_pagseguro3_financeiro`
--

DROP TABLE IF EXISTS `conn_item_pagseguro3_financeiro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_pagseguro3_financeiro` (
  `item_id` int(10) unsigned NOT NULL,
  `tipo_registro` decimal(1,0) DEFAULT NULL,
  `estabelecimento` decimal(10,0) DEFAULT NULL,
  `data_inicial_transacao` date DEFAULT NULL,
  `hora_inicial_transacao` time DEFAULT NULL,
  `data_venda_ajuste` date DEFAULT NULL,
  `hora_venda_ajuste` time DEFAULT NULL,
  `tipo_evento` decimal(2,0) DEFAULT NULL,
  `tipo_transacao` decimal(2,0) DEFAULT NULL,
  `codigo_transacao` varchar(64) DEFAULT NULL,
  `codigo_venda` varchar(64) DEFAULT NULL,
  `valor_total_transacao` decimal(10,2) DEFAULT NULL,
  `valor_parcela` decimal(10,2) DEFAULT NULL,
  `pagamento_prazo` varchar(1) DEFAULT NULL,
  `plano` decimal(2,0) DEFAULT NULL,
  `parcela` decimal(2,0) DEFAULT NULL,
  `quantidade_parcela` decimal(2,0) DEFAULT NULL,
  `data_movimentacao` date DEFAULT NULL,
  `taxa_parcela_comprador` decimal(10,2) DEFAULT NULL,
  `tarifa_boleto_compra` decimal(10,2) DEFAULT NULL,
  `valor_original_transacao` decimal(10,2) DEFAULT NULL,
  `taxa_parcela_vendedor` decimal(10,2) DEFAULT NULL,
  `taxa_intermediacao` decimal(10,2) DEFAULT NULL,
  `tarifa_intermediacao` decimal(10,2) DEFAULT NULL,
  `tarifa_boleto_vendedor` decimal(10,2) DEFAULT NULL,
  `taxa_rep_aplicacao` decimal(10,2) DEFAULT NULL,
  `valor_liquido_transacao` decimal(10,2) DEFAULT NULL,
  `taxa_antecipacao` decimal(10,2) DEFAULT NULL,
  `valor_liquido_antecipacao` decimal(10,2) DEFAULT NULL,
  `status_pagamento` decimal(2,0) DEFAULT NULL,
  `identificador_revenda` varchar(2) DEFAULT NULL,
  `meio_pagamento` decimal(2,0) DEFAULT NULL,
  `instituicao_financeira` varchar(30) DEFAULT NULL,
  `canal_entrada` varchar(2) DEFAULT NULL,
  `leitor` decimal(2,0) DEFAULT NULL,
  `meio_captura` decimal(2,0) DEFAULT NULL,
  `cod_banco` decimal(6,0) DEFAULT NULL,
  `banco_agencia` varchar(9) DEFAULT NULL,
  `conta_banco` varchar(16) DEFAULT NULL,
  `num_logico` varchar(32) DEFAULT NULL,
  `nsu` varchar(14) DEFAULT NULL,
  `cartao_bin` varchar(6) DEFAULT NULL,
  `cartao_holder` varchar(4) DEFAULT NULL,
  `codigo_autorizacao` varchar(6) DEFAULT NULL,
  `codigo_cv` varchar(32) DEFAULT NULL,
  `numero_serie_leitor` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  KEY `idx_cliente_date` (`estabelecimento`,`data_movimentacao`),
  KEY `idx_codigo_transacao` (`codigo_transacao`),
  CONSTRAINT `conn_item_pagseguro3_financeiro_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_pagseguro3_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_pagseguro3_line`
--

DROP TABLE IF EXISTS `conn_item_pagseguro3_line`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_pagseguro3_line` (
  `item_id` int(10) unsigned NOT NULL,
  `register_type` decimal(1,0) DEFAULT NULL,
  `movimento_api_codigo` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  UNIQUE KEY `movimento_api_codigo` (`movimento_api_codigo`),
  CONSTRAINT `conn_item_pagseguro3_line_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `vooo_prod_backend`.`connection_item` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_pagseguro3_transacional`
--

DROP TABLE IF EXISTS `conn_item_pagseguro3_transacional`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_pagseguro3_transacional` (
  `item_id` int(10) unsigned NOT NULL,
  `tipo_registro` decimal(1,0) DEFAULT NULL,
  `estabelecimento` decimal(10,0) DEFAULT NULL,
  `data_inicial_transacao` date DEFAULT NULL,
  `hora_inicial_transacao` time DEFAULT NULL,
  `data_venda_ajuste` date DEFAULT NULL,
  `hora_venda_ajuste` time DEFAULT NULL,
  `tipo_evento` decimal(2,0) DEFAULT NULL,
  `tipo_transacao` decimal(2,0) DEFAULT NULL,
  `codigo_transacao` varchar(64) DEFAULT NULL,
  `codigo_venda` varchar(64) DEFAULT NULL,
  `valor_total_transacao` decimal(10,2) DEFAULT NULL,
  `valor_parcela` decimal(10,2) DEFAULT NULL,
  `pagamento_prazo` varchar(1) DEFAULT NULL,
  `plano` decimal(2,0) DEFAULT NULL,
  `parcela` decimal(2,0) DEFAULT NULL,
  `quantidade_parcela` decimal(2,0) DEFAULT NULL,
  `data_prevista_pagamento` date DEFAULT NULL,
  `taxa_parcela_comprador` decimal(10,2) DEFAULT NULL,
  `tarifa_boleto_compra` decimal(10,2) DEFAULT NULL,
  `valor_original_transacao` decimal(10,2) DEFAULT NULL,
  `taxa_parcela_vendedor` decimal(10,2) DEFAULT NULL,
  `taxa_intermediacao` decimal(10,2) DEFAULT NULL,
  `tarifa_intermediacao` decimal(10,2) DEFAULT NULL,
  `tarifa_boleto_vendedor` decimal(10,2) DEFAULT NULL,
  `taxa_rep_aplicacao` decimal(10,2) DEFAULT NULL,
  `valor_liquido_transacao` decimal(10,2) DEFAULT NULL,
  `status_pagamento` decimal(2,0) DEFAULT NULL,
  `meio_pagamento` decimal(2,0) DEFAULT NULL,
  `instituicao_financeira` varchar(30) DEFAULT NULL,
  `canal_entrada` varchar(2) DEFAULT NULL,
  `leitor` decimal(2,0) DEFAULT NULL,
  `meio_captura` decimal(2,0) DEFAULT NULL,
  `num_logico` varchar(32) DEFAULT NULL,
  `nsu` varchar(14) DEFAULT NULL,
  `cartao_bin` varchar(6) DEFAULT NULL,
  `cartao_holder` varchar(4) DEFAULT NULL,
  `codigo_autorizacao` varchar(6) DEFAULT NULL,
  `codigo_cv` varchar(32) DEFAULT NULL,
  `numero_serie_leitor` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  KEY `idx_cliente` (`estabelecimento`),
  KEY `idx_codigo_transacao` (`codigo_transacao`),
  CONSTRAINT `conn_item_pagseguro3_transacional_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_pagseguro3_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_pagseguro_disagreement`
--

DROP TABLE IF EXISTS `conn_item_pagseguro_disagreement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_pagseguro_disagreement` (
  `item_id` int(10) unsigned NOT NULL,
  `reference` varchar(200) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `cancellationSource` varchar(8) DEFAULT NULL,
  `lastEventDate` datetime DEFAULT NULL,
  `grossAmount` decimal(20,2) NOT NULL,
  `discountAmount` decimal(20,2) NOT NULL,
  `creditorFees_installmentFeeAmount` decimal(20,2) NOT NULL,
  `creditorFees_operationalFeeAmount` decimal(20,2) NOT NULL,
  `creditorFees_intermediationRateAmount` decimal(20,2) NOT NULL,
  `creditorFees_intermediationFeeAmount` decimal(20,2) NOT NULL,
  `creditorFees_commissionFeeAmount` decimal(20,2) NOT NULL,
  `netAmount` decimal(20,2) NOT NULL,
  `escrowEndDate` datetime DEFAULT NULL,
  `installmentCount` int(11) DEFAULT NULL,
  `promoCode` int(11) DEFAULT NULL,
  `extraAmount` decimal(20,2) NOT NULL,
  `paymentMethod_Type` int(11) DEFAULT NULL,
  `paymentMethod_Code` int(11) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `code` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_pagseguro_disagreement_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_pagseguro_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_pagseguro_header`
--

DROP TABLE IF EXISTS `conn_item_pagseguro_header`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_pagseguro_header` (
  `item_id` int(10) unsigned NOT NULL,
  `date` datetime NOT NULL,
  `connector` int(11) NOT NULL,
  `client` int(11) NOT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_pagseguro_header_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_pagseguro_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_pagseguro_line`
--

DROP TABLE IF EXISTS `conn_item_pagseguro_line`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_pagseguro_line` (
  `item_id` int(10) unsigned NOT NULL,
  `registertype` varchar(50) DEFAULT NULL,
  `masterid` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  KEY `masterid` (`masterid`),
  CONSTRAINT `conn_item_pagseguro_line_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `vooo_prod_backend`.`connection_item` (`item_id`),
  CONSTRAINT `conn_item_pagseguro_line_ibfk_2` FOREIGN KEY (`masterid`) REFERENCES `conn_item_pagseguro_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_pagseguro_reversal`
--

DROP TABLE IF EXISTS `conn_item_pagseguro_reversal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_pagseguro_reversal` (
  `item_id` int(10) unsigned NOT NULL,
  `reference` varchar(200) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `cancellationSource` varchar(8) DEFAULT NULL,
  `lastEventDate` datetime DEFAULT NULL,
  `grossAmount` decimal(20,2) NOT NULL,
  `discountAmount` decimal(20,2) NOT NULL,
  `creditorFees_installmentFeeAmount` decimal(20,2) NOT NULL,
  `creditorFees_operationalFeeAmount` decimal(20,2) NOT NULL,
  `creditorFees_intermediationRateAmount` decimal(20,2) NOT NULL,
  `creditorFees_intermediationFeeAmount` decimal(20,2) NOT NULL,
  `creditorFees_commissionFeeAmount` decimal(20,2) NOT NULL,
  `netAmount` decimal(20,2) NOT NULL,
  `escrowEndDate` datetime DEFAULT NULL,
  `installmentCount` int(11) DEFAULT NULL,
  `promoCode` int(11) DEFAULT NULL,
  `extraAmount` decimal(20,2) NOT NULL,
  `paymentMethod_Type` int(11) DEFAULT NULL,
  `paymentMethod_Code` int(11) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `code` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_pagseguro_reversal_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_pagseguro_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_pagseguro_sale`
--

DROP TABLE IF EXISTS `conn_item_pagseguro_sale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_pagseguro_sale` (
  `item_id` int(10) unsigned NOT NULL,
  `reference` varchar(200) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `cancellationSource` varchar(8) DEFAULT NULL,
  `lastEventDate` datetime DEFAULT NULL,
  `grossAmount` decimal(20,2) NOT NULL,
  `discountAmount` decimal(20,2) NOT NULL,
  `creditorFees_installmentFeeAmount` decimal(20,2) NOT NULL,
  `creditorFees_operationalFeeAmount` decimal(20,2) NOT NULL,
  `creditorFees_intermediationRateAmount` decimal(20,2) NOT NULL,
  `creditorFees_intermediationFeeAmount` decimal(20,2) NOT NULL,
  `creditorFees_commissionFeeAmount` decimal(20,2) NOT NULL,
  `netAmount` decimal(20,2) NOT NULL,
  `escrowEndDate` datetime DEFAULT NULL,
  `installmentCount` int(11) DEFAULT NULL,
  `promoCode` int(11) DEFAULT NULL,
  `extraAmount` decimal(20,2) NOT NULL,
  `paymentMethod_Type` int(11) DEFAULT NULL,
  `paymentMethod_Code` int(11) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `code` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_pagseguro_sale_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_pagseguro_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_pagseguro_settlement`
--

DROP TABLE IF EXISTS `conn_item_pagseguro_settlement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_pagseguro_settlement` (
  `item_id` int(10) unsigned NOT NULL,
  `reference` varchar(200) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `cancellationSource` varchar(8) DEFAULT NULL,
  `lastEventDate` datetime DEFAULT NULL,
  `grossAmount` decimal(20,2) NOT NULL,
  `discountAmount` decimal(20,2) NOT NULL,
  `creditorFees_installmentFeeAmount` decimal(20,2) NOT NULL,
  `creditorFees_operationalFeeAmount` decimal(20,2) NOT NULL,
  `creditorFees_intermediationRateAmount` decimal(20,2) NOT NULL,
  `creditorFees_intermediationFeeAmount` decimal(20,2) NOT NULL,
  `creditorFees_commissionFeeAmount` decimal(20,2) NOT NULL,
  `netAmount` decimal(20,2) NOT NULL,
  `escrowEndDate` datetime DEFAULT NULL,
  `installmentCount` int(11) DEFAULT NULL,
  `promoCode` int(11) DEFAULT NULL,
  `extraAmount` decimal(20,2) NOT NULL,
  `paymentMethod_Type` int(11) DEFAULT NULL,
  `paymentMethod_Code` int(11) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `code` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_pagseguro_settlement_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_pagseguro_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_pagseguro_trailer`
--

DROP TABLE IF EXISTS `conn_item_pagseguro_trailer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_pagseguro_trailer` (
  `item_id` int(10) unsigned NOT NULL,
  `date` datetime NOT NULL,
  `connector` int(11) NOT NULL,
  `client` int(11) NOT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_pagseguro_trailer_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_pagseguro_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_paygo_header`
--

DROP TABLE IF EXISTS `conn_item_paygo_header`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_paygo_header` (
  `item_id` int(10) unsigned NOT NULL,
  `file_format` varchar(10) DEFAULT NULL,
  `establishment_code` decimal(10,0) DEFAULT NULL,
  `file_datetime` datetime DEFAULT NULL,
  `exporting_type` varchar(1) DEFAULT NULL,
  `file_minutes` decimal(2,0) DEFAULT NULL,
  `last_success_datetime` datetime DEFAULT NULL,
  `errors_last_success` decimal(5,0) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_paygo_header_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_paygo_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_paygo_line`
--

DROP TABLE IF EXISTS `conn_item_paygo_line`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_paygo_line` (
  `item_id` int(10) unsigned NOT NULL,
  `register_type` varchar(15) DEFAULT NULL,
  `masterid` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  KEY `masterid` (`masterid`),
  CONSTRAINT `conn_item_paygo_line_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `vooo_prod_backend`.`connection_item` (`item_id`),
  CONSTRAINT `conn_item_paygo_line_ibfk_2` FOREIGN KEY (`masterid`) REFERENCES `conn_item_paygo_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_paygo_trailer`
--

DROP TABLE IF EXISTS `conn_item_paygo_trailer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_paygo_trailer` (
  `item_id` int(10) unsigned NOT NULL,
  `transactions` decimal(10,0) DEFAULT NULL,
  `hash` varchar(50) DEFAULT NULL,
  `sales_value` decimal(10,2) DEFAULT NULL,
  `cancel_value` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_paygo_trailer_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_paygo_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_paygo_transaction`
--

DROP TABLE IF EXISTS `conn_item_paygo_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_paygo_transaction` (
  `item_id` int(10) unsigned NOT NULL,
  `datetime` datetime DEFAULT NULL,
  `status_id` decimal(1,0) DEFAULT NULL,
  `status_desc` varchar(85) DEFAULT NULL,
  `terminal` decimal(5,0) DEFAULT NULL,
  `provider_id` decimal(5,0) DEFAULT NULL,
  `provider_name` varchar(50) DEFAULT NULL,
  `operation_desc` varchar(70) DEFAULT NULL,
  `operation_id` decimal(3,0) DEFAULT NULL,
  `card_type_id` decimal(2,0) DEFAULT NULL,
  `financing_type_id` decimal(2,0) DEFAULT NULL,
  `installments` decimal(2,0) DEFAULT NULL,
  `prepaid_date` date DEFAULT NULL,
  `card_desc` varchar(20) DEFAULT NULL,
  `currency_id` decimal(3,0) DEFAULT NULL,
  `value` decimal(10,2) DEFAULT NULL,
  `terminal_sequence` decimal(5,0) DEFAULT NULL,
  `session_id` decimal(10,0) DEFAULT NULL,
  `reference_id` decimal(10,0) DEFAULT NULL,
  `nsu_code` varchar(20) DEFAULT NULL,
  `authorization_code` varchar(10) DEFAULT NULL,
  `original_datetime` datetime DEFAULT NULL,
  `original_reference_id` decimal(10,0) DEFAULT NULL,
  `original_nsu_code` varchar(20) DEFAULT NULL,
  `checkout_id` varchar(20) DEFAULT NULL,
  `contract_code` decimal(15,0) DEFAULT NULL,
  `message` varchar(50) DEFAULT NULL,
  `fiscal_doc` varchar(10) DEFAULT NULL,
  `original_value` decimal(10,2) DEFAULT NULL,
  `discount` decimal(10,2) DEFAULT NULL,
  `change_value` decimal(10,2) DEFAULT NULL,
  `solution` decimal(3,0) DEFAULT NULL,
  `checkout_code` decimal(3,0) DEFAULT NULL,
  `checkout` varchar(50) DEFAULT NULL,
  `ckeckout_conf` decimal(3,0) DEFAULT NULL,
  `filler_1` varchar(10) DEFAULT NULL,
  `filler_2` varchar(10) DEFAULT NULL,
  `filler_3` varchar(10) DEFAULT NULL,
  `filler_4` varchar(10) DEFAULT NULL,
  `serie_number` decimal(3,0) DEFAULT NULL,
  `event_data` varchar(10) DEFAULT NULL,
  `hash` varchar(30) DEFAULT NULL,
  `card_mask` varchar(20) DEFAULT NULL,
  `card_name` varchar(30) DEFAULT NULL,
  `due_value` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  KEY `ix_vooo_prod_rawdata_conn_item_paygo_transaction_reference_id` (`reference_id`),
  KEY `ix_vooo_prod_rawdata_conn_item_paygo_transaction_nsu_code` (`nsu_code`),
  CONSTRAINT `conn_item_paygo_transaction_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_paygo_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_payly_autar_ajustes`
--

DROP TABLE IF EXISTS `conn_item_payly_autar_ajustes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_payly_autar_ajustes` (
  `item_id` int(10) unsigned NOT NULL,
  `tipo_registro` varchar(1) NOT NULL,
  `codigo_estabelecimento` varchar(15) NOT NULL,
  `numero_rv_ajustado` decimal(9,0) DEFAULT NULL,
  `data_rv` date DEFAULT NULL,
  `data_pagamento_rv` date DEFAULT NULL,
  `identificador_ajuste` varchar(20) NOT NULL,
  `brancos` varchar(1) DEFAULT NULL,
  `sinal_valor_ajuste` varchar(1) NOT NULL,
  `valor_ajuste` decimal(10,2) NOT NULL,
  `motivo_ajuste` varchar(2) NOT NULL,
  `data_carta` date DEFAULT NULL,
  `numero_cartao` varchar(19) DEFAULT NULL,
  `numero_rv_original` decimal(9,0) DEFAULT NULL,
  `nsu_original_administradora` decimal(12,0) DEFAULT NULL,
  `data_transacao_original` date DEFAULT NULL,
  `indicador_tipo_pagamento` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_payly_autar_ajustes_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_payly_autar_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_payly_autar_header`
--

DROP TABLE IF EXISTS `conn_item_payly_autar_header`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_payly_autar_header` (
  `item_id` int(10) unsigned NOT NULL,
  `tipo_registro` varchar(1) NOT NULL,
  `data_criacao_arquivo` date NOT NULL,
  `hora_criacao_arquivo` time NOT NULL,
  `data_referencia_movimento` date NOT NULL,
  `arquivo_versao` varchar(8) NOT NULL,
  `codigo_estabelecimento` varchar(15) NOT NULL,
  `cnpj_administradora` decimal(15,0) NOT NULL,
  `nome_administradora` varchar(20) NOT NULL,
  `sequencia` decimal(9,0) NOT NULL,
  `codigo_administradora` varchar(2) NOT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_payly_autar_header_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_payly_autar_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_payly_autar_line`
--

DROP TABLE IF EXISTS `conn_item_payly_autar_line`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_payly_autar_line` (
  `item_id` int(10) unsigned NOT NULL,
  `registertype` varchar(2) NOT NULL,
  `masterid` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  KEY `masterid` (`masterid`),
  CONSTRAINT `conn_item_payly_autar_line_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `vooo_prod_backend`.`connection_item` (`item_id`),
  CONSTRAINT `conn_item_payly_autar_line_ibfk_2` FOREIGN KEY (`masterid`) REFERENCES `conn_item_payly_autar_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_payly_autar_modalidades_pagamento`
--

DROP TABLE IF EXISTS `conn_item_payly_autar_modalidades_pagamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_payly_autar_modalidades_pagamento` (
  `item_id` int(10) unsigned NOT NULL,
  `tipo_registro` varchar(1) NOT NULL,
  `codigo_estabelecimento` varchar(15) NOT NULL,
  `nsu_administradora` varchar(12) NOT NULL,
  `data_transacao` date NOT NULL,
  `hora_transacao` time NOT NULL,
  `modalidade_pagamento_1` varchar(2) DEFAULT NULL,
  `valor_recebido_1` decimal(10,2) DEFAULT NULL,
  `modalidade_pagamento_2` varchar(2) DEFAULT NULL,
  `valor_recebido_2` decimal(10,2) DEFAULT NULL,
  `modalidade_pagamento_3` varchar(2) DEFAULT NULL,
  `valor_recebido_3` decimal(10,2) DEFAULT NULL,
  `modalidade_pagamento_4` varchar(2) DEFAULT NULL,
  `valor_recebido_4` decimal(10,2) DEFAULT NULL,
  `modalidade_pagamento_5` varchar(2) DEFAULT NULL,
  `valor_recebido_5` decimal(10,2) DEFAULT NULL,
  `modalidade_pagamento_6` varchar(2) DEFAULT NULL,
  `valor_recebido_6` decimal(10,2) DEFAULT NULL,
  `modalidade_pagamento_7` varchar(2) DEFAULT NULL,
  `valor_recebido_7` decimal(10,2) DEFAULT NULL,
  `modalidade_pagamento_8` varchar(2) DEFAULT NULL,
  `valor_recebido_8` decimal(10,2) DEFAULT NULL,
  `modalidade_pagamento_9` varchar(2) DEFAULT NULL,
  `valor_recebido_9` decimal(10,2) DEFAULT NULL,
  `modalidade_pagamento_10` varchar(2) DEFAULT NULL,
  `valor_recebido_10` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_payly_autar_modalidades_pagamento_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_payly_autar_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_payly_autar_resumo_vendas`
--

DROP TABLE IF EXISTS `conn_item_payly_autar_resumo_vendas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_payly_autar_resumo_vendas` (
  `item_id` int(10) unsigned NOT NULL,
  `tipo_registro` varchar(1) NOT NULL,
  `codigo_estabelecimento` varchar(15) NOT NULL,
  `codigo_produto` varchar(2) NOT NULL,
  `forma_captura` varchar(3) DEFAULT NULL,
  `numero_rv` decimal(9,0) NOT NULL,
  `data_rv` date NOT NULL,
  `data_pagamento_rv` date DEFAULT NULL,
  `banco` decimal(3,0) NOT NULL,
  `agencia` decimal(6,0) NOT NULL,
  `conta_corrente` decimal(11,0) NOT NULL,
  `numero_cv_aceitos` decimal(9,0) NOT NULL,
  `numero_cv_rejeitados` decimal(9,0) NOT NULL,
  `valor_bruto` decimal(10,2) NOT NULL,
  `valor_liquido` decimal(10,2) NOT NULL,
  `valor_taxa_servico` decimal(10,2) NOT NULL,
  `valor_comissao` decimal(10,2) NOT NULL,
  `valor_rejeitado` decimal(10,2) NOT NULL,
  `valor_credito` decimal(10,2) NOT NULL,
  `valor_encargos` decimal(10,2) NOT NULL,
  `indicador_tipo_pagamento` varchar(2) NOT NULL,
  `numero_parcela_rv` decimal(10,0) NOT NULL,
  `quantidade_parcela_rv` decimal(10,0) NOT NULL,
  `data_pagamento_prevista` date DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_payly_autar_resumo_vendas_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_payly_autar_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_payly_autar_trailler`
--

DROP TABLE IF EXISTS `conn_item_payly_autar_trailler`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_payly_autar_trailler` (
  `item_id` int(10) unsigned NOT NULL,
  `tipo_registro` varchar(1) NOT NULL,
  `quantidade_registros` int(11) NOT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_payly_autar_trailler_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_payly_autar_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_payly_autar_transacoes`
--

DROP TABLE IF EXISTS `conn_item_payly_autar_transacoes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_payly_autar_transacoes` (
  `item_id` int(10) unsigned NOT NULL,
  `tipo_registro` varchar(1) NOT NULL,
  `codigo_estabelecimento` varchar(15) NOT NULL,
  `numero_rv` int(11) NOT NULL,
  `nsu_administradora` decimal(12,0) NOT NULL,
  `data_transacao` date NOT NULL,
  `hora_transacao` time NOT NULL,
  `numero_cartao` varchar(19) NOT NULL,
  `valor_transacao` decimal(10,2) NOT NULL,
  `valor_saque` decimal(10,2) NOT NULL,
  `valor_taxa_servico` decimal(10,2) NOT NULL,
  `numero_parcelas` decimal(10,0) NOT NULL,
  `numero_parcela_paga` decimal(10,0) NOT NULL,
  `valor_parcela_paga` decimal(10,2) NOT NULL,
  `data_pagamento` date DEFAULT NULL,
  `codigo_autorizacao` decimal(10,0) NOT NULL,
  `forma_captura` varchar(3) NOT NULL,
  `status_transacao` varchar(2) NOT NULL,
  `modalidade_pagamento` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_payly_autar_transacoes_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_payly_autar_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_paypal_api_line`
--

DROP TABLE IF EXISTS `conn_item_paypal_api_line`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_paypal_api_line` (
  `item_id` int(10) unsigned NOT NULL,
  `registertype` varchar(2) NOT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_paypal_api_line_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `vooo_prod_backend`.`connection_item` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_paypal_api_transaction`
--

DROP TABLE IF EXISTS `conn_item_paypal_api_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_paypal_api_transaction` (
  `item_id` int(10) unsigned NOT NULL,
  `id` varchar(64) DEFAULT NULL,
  `legacy_id` varchar(64) DEFAULT NULL,
  `realized_at` timestamp NULL DEFAULT NULL,
  `amount_value` decimal(15,2) DEFAULT NULL,
  `amount_currency_code` varchar(64) DEFAULT NULL,
  `merchant_id` varchar(64) DEFAULT NULL,
  `merchant_account_id` varchar(64) DEFAULT NULL,
  `merchant_name` varchar(64) DEFAULT NULL,
  `order_id` varchar(64) DEFAULT NULL,
  `purchase_order_number` varchar(64) DEFAULT NULL,
  `current_status` varchar(64) DEFAULT NULL,
  `last_status_history` varchar(64) DEFAULT NULL,
  `last_date_history` date DEFAULT NULL,
  `last_amount_value_history` decimal(15,2) DEFAULT NULL,
  `last_currency_code_history` varchar(64) DEFAULT NULL,
  `last_source_history` varchar(64) DEFAULT NULL,
  `last_terminal_history` varchar(64) DEFAULT NULL,
  `channel` varchar(64) DEFAULT NULL,
  `source` varchar(64) DEFAULT NULL,
  `tax_amount` decimal(15,2) DEFAULT NULL,
  `tax_exempt` decimal(15,2) DEFAULT NULL,
  `discount_amount` decimal(15,2) DEFAULT NULL,
  `disbursement_date` date DEFAULT NULL,
  `disbursement_amount` decimal(15,2) DEFAULT NULL,
  `disbursement_currency_code` varchar(64) DEFAULT NULL,
  `disbursement_exchange_rate` varchar(64) DEFAULT NULL,
  `disbursement_funds_held` varchar(64) DEFAULT NULL,
  `payment_method` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  KEY `id` (`id`),
  CONSTRAINT `conn_item_paypal_api_transaction_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_paypal_api_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_paypal_cv`
--

DROP TABLE IF EXISTS `conn_item_paypal_cv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_paypal_cv` (
  `item_id` int(10) unsigned NOT NULL,
  `register_type` varchar(2) DEFAULT NULL,
  `funding_account` varchar(25) DEFAULT NULL,
  `record_id` varchar(25) DEFAULT NULL,
  `paypal_transaction_id` varchar(30) DEFAULT NULL,
  `record_type` varchar(30) DEFAULT NULL,
  `record_subtype` varchar(30) DEFAULT NULL,
  `merchant_account_id` varchar(30) DEFAULT NULL,
  `paypal_account_id` varchar(30) DEFAULT NULL,
  `creation_date` timestamp NULL DEFAULT NULL,
  `settlement_date` date DEFAULT NULL,
  `disbursement_date` date DEFAULT NULL,
  `transaction_currency` varchar(5) DEFAULT NULL,
  `gross_transaction_amount` decimal(15,2) DEFAULT NULL,
  `gross_transaction_fees` decimal(15,2) DEFAULT NULL,
  `net_transaction_amount` decimal(15,2) DEFAULT NULL,
  `settlement_currency` varchar(5) DEFAULT NULL,
  `gross_settlement_amount` decimal(15,2) DEFAULT NULL,
  `gross_settlement_fees` decimal(15,2) DEFAULT NULL,
  `net_disbursed_amount` decimal(15,2) DEFAULT NULL,
  `exchange_rate` decimal(15,2) DEFAULT NULL,
  `tax_amount` decimal(15,2) DEFAULT NULL,
  `tax_exempt` varchar(10) DEFAULT NULL,
  `transfer_id` decimal(25,0) DEFAULT NULL,
  `currency_conversion_record_id` decimal(25,0) DEFAULT NULL,
  `dispute_id` decimal(25,0) DEFAULT NULL,
  `order_id` decimal(25,0) DEFAULT NULL,
  `purchase_order_number` decimal(25,0) DEFAULT NULL,
  `paypal_custom_field` varchar(25) DEFAULT NULL,
  `original_record_id` varchar(25) DEFAULT NULL,
  `original_order_id` varchar(25) DEFAULT NULL,
  `store_id` varchar(25) DEFAULT NULL,
  `acquirer_reference_number` varchar(25) DEFAULT NULL,
  `payment_instrument_type` varchar(25) DEFAULT NULL,
  `payment_instrument_subtype` varchar(25) DEFAULT NULL,
  `payment_method_token` varchar(25) DEFAULT NULL,
  `number_of_installments` varchar(25) DEFAULT NULL,
  `installment_number` varchar(25) DEFAULT NULL,
  `bank_account` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_paypal_cv_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_paypal_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_paypal_header`
--

DROP TABLE IF EXISTS `conn_item_paypal_header`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_paypal_header` (
  `item_id` int(10) unsigned NOT NULL,
  `register_type` varchar(2) DEFAULT NULL,
  `report_name` varchar(64) DEFAULT NULL,
  `report_status` varchar(20) DEFAULT NULL,
  `report_generated` date DEFAULT NULL,
  `hierarchy` varchar(64) DEFAULT NULL,
  `timezone` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_paypal_header_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_paypal_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_paypal_legado`
--

DROP TABLE IF EXISTS `conn_item_paypal_legado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_paypal_legado` (
  `item_id` int(10) unsigned NOT NULL,
  `data` date DEFAULT NULL,
  `hora` time DEFAULT NULL,
  `tipo` varchar(70) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `moeda` varchar(50) DEFAULT NULL,
  `bruto` decimal(11,2) DEFAULT NULL,
  `tarifa` decimal(11,2) DEFAULT NULL,
  `liquido` decimal(11,2) DEFAULT NULL,
  `id_transacao` varchar(50) DEFAULT NULL,
  `id_referencia` varchar(50) DEFAULT NULL,
  `id_shellbox` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_paypal_legado_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `vooo_prod_backend`.`connection_item` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_paypal_line`
--

DROP TABLE IF EXISTS `conn_item_paypal_line`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_paypal_line` (
  `item_id` int(10) unsigned NOT NULL,
  `registertype` varchar(2) NOT NULL,
  `filetype` varchar(2) DEFAULT NULL,
  `masterid` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  KEY `masterid` (`masterid`),
  CONSTRAINT `conn_item_paypal_line_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `vooo_prod_backend`.`connection_item` (`item_id`),
  CONSTRAINT `conn_item_paypal_line_ibfk_2` FOREIGN KEY (`masterid`) REFERENCES `conn_item_paypal_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_paypal_section_body`
--

DROP TABLE IF EXISTS `conn_item_paypal_section_body`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_paypal_section_body` (
  `item_id` int(10) unsigned NOT NULL,
  `register_type` varchar(2) DEFAULT NULL,
  `transaction_id` varchar(30) DEFAULT NULL,
  `invoice_id` varchar(150) DEFAULT NULL,
  `reference_id` varchar(30) DEFAULT NULL,
  `reference_id_type` varchar(5) DEFAULT NULL,
  `event_code` varchar(7) DEFAULT NULL,
  `initiation_date` datetime DEFAULT NULL,
  `completion_date` datetime DEFAULT NULL,
  `transaction_payment_method` varchar(30) DEFAULT NULL,
  `gross_amount` decimal(15,2) DEFAULT NULL,
  `gross_currency` varchar(3) DEFAULT NULL,
  `fee_payment_method` varchar(30) DEFAULT NULL,
  `fee_amount` decimal(15,2) DEFAULT NULL,
  `fee_currency` varchar(3) DEFAULT NULL,
  `custom_field` varchar(255) DEFAULT NULL,
  `consumer_id` varchar(150) DEFAULT NULL,
  `payment_tracking_id` varchar(150) DEFAULT NULL,
  `store_id` varchar(60) DEFAULT NULL,
  `bank_reference_id` varchar(20) DEFAULT NULL,
  `credit_transactional_fee` decimal(15,2) DEFAULT NULL,
  `credit_promotional_fee` decimal(15,2) DEFAULT NULL,
  `credit_term` varchar(30) DEFAULT NULL,
  `item_name` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  KEY `ix_vooo_prod_rawdata_conn_item_paypal_section_body_invoice_id` (`invoice_id`),
  CONSTRAINT `conn_item_paypal_section_body_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_paypal_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_paypal_section_header`
--

DROP TABLE IF EXISTS `conn_item_paypal_section_header`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_paypal_section_header` (
  `item_id` int(10) unsigned NOT NULL,
  `register_type` varchar(2) DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `end_date_date` datetime DEFAULT NULL,
  `account_id` varchar(20) DEFAULT NULL,
  `partern_account_id` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_paypal_section_header_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_paypal_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_paypal_stl_header`
--

DROP TABLE IF EXISTS `conn_item_paypal_stl_header`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_paypal_stl_header` (
  `item_id` int(10) unsigned NOT NULL,
  `register_type` varchar(2) DEFAULT NULL,
  `report_generated` datetime DEFAULT NULL,
  `report_window` varchar(2) DEFAULT NULL,
  `account_id` varchar(20) DEFAULT NULL,
  `report_version` varchar(8) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_paypal_stl_header_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_paypal_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_paypal_stl_trailer`
--

DROP TABLE IF EXISTS `conn_item_paypal_stl_trailer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_paypal_stl_trailer` (
  `item_id` int(10) unsigned NOT NULL,
  `register_type` varchar(2) DEFAULT NULL,
  `currency_balance` varchar(3) DEFAULT NULL,
  `total_gross_credits` decimal(15,2) DEFAULT NULL,
  `total_gross_debits` decimal(15,2) DEFAULT NULL,
  `total_fee_credits` decimal(15,2) DEFAULT NULL,
  `total_fee_debits` decimal(15,2) DEFAULT NULL,
  `begin_available_balance` varchar(2) DEFAULT NULL,
  `begin_available_value` decimal(15,2) DEFAULT NULL,
  `end_available_balance` varchar(2) DEFAULT NULL,
  `end_available_value` decimal(15,2) DEFAULT NULL,
  `begin_total_balance` varchar(2) DEFAULT NULL,
  `begin_total_value` decimal(15,2) DEFAULT NULL,
  `end_total_balance` varchar(2) DEFAULT NULL,
  `end_total_value` decimal(15,2) DEFAULT NULL,
  `begin_payable_balance` varchar(2) DEFAULT NULL,
  `begin_payable_value` decimal(15,2) DEFAULT NULL,
  `end_payable_balance` varchar(2) DEFAULT NULL,
  `end_payable_value` decimal(15,2) DEFAULT NULL,
  `total_records` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_paypal_stl_trailer_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_paypal_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_paypal_trailer`
--

DROP TABLE IF EXISTS `conn_item_paypal_trailer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_paypal_trailer` (
  `item_id` int(10) unsigned NOT NULL,
  `register_type` varchar(2) DEFAULT NULL,
  `file_number` varchar(64) DEFAULT NULL,
  `total_records` decimal(30,0) DEFAULT NULL,
  `total_files` decimal(6,0) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_paypal_trailer_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_paypal_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_paypal_transaciton_level_fee_report`
--

DROP TABLE IF EXISTS `conn_item_paypal_transaciton_level_fee_report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_paypal_transaciton_level_fee_report` (
  `item_id` int(10) unsigned NOT NULL,
  `merchant_account_id` varchar(40) DEFAULT NULL,
  `transaction_id` varchar(40) DEFAULT NULL,
  `original_sale_transaction_id` varchar(40) DEFAULT NULL,
  `transaction_type` varchar(20) DEFAULT NULL,
  `presentment_currency` varchar(10) DEFAULT NULL,
  `original_sale_amount` decimal(15,2) DEFAULT NULL,
  `settlement_currency` varchar(10) DEFAULT NULL,
  `settlement_amount` decimal(15,2) DEFAULT NULL,
  `settlement_date` date DEFAULT NULL,
  `disbursement_date` date DEFAULT NULL,
  `payment_instrument` varchar(40) DEFAULT NULL,
  `card_brand` varchar(40) DEFAULT NULL,
  `card_type` varchar(40) DEFAULT NULL,
  `first_6_of_cc` decimal(6,0) DEFAULT NULL,
  `issuing_bank` varchar(80) DEFAULT NULL,
  `refunded_amount` decimal(15,2) DEFAULT NULL,
  `refund_type` varchar(40) DEFAULT NULL,
  `exchange_rate` decimal(5,2) DEFAULT NULL,
  `order_id` varchar(40) DEFAULT NULL,
  `acquirer_reference_number` varchar(40) DEFAULT NULL,
  `card_issuing_country` varchar(40) DEFAULT NULL,
  `discount` decimal(5,2) DEFAULT NULL,
  `discount_credit` decimal(5,2) DEFAULT NULL,
  `funds_anticipation_fee` decimal(15,2) DEFAULT NULL,
  `funds_anticipation_fee_credit` decimal(15,2) DEFAULT NULL,
  `per_transaction_fee` decimal(15,2) DEFAULT NULL,
  `per_transaction_fee_credit` decimal(15,2) DEFAULT NULL,
  `braintree_total_amount` decimal(15,2) DEFAULT NULL,
  `multicurrency_fee_amount` decimal(15,2) DEFAULT NULL,
  `multicurrency_fee_credit` decimal(15,2) DEFAULT NULL,
  `total_fee_amount` decimal(15,2) DEFAULT NULL,
  `number_of_installments` decimal(3,0) DEFAULT NULL,
  `installment_number` decimal(3,0) DEFAULT NULL,
  `reason` varchar(40) DEFAULT NULL,
  `adjuster_id` varchar(20) DEFAULT NULL,
  `record_type` varchar(20) DEFAULT NULL,
  `record_subtype` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_paypal_transaciton_level_fee_report_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `vooo_prod_backend`.`connection_item` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_picpay_aj`
--

DROP TABLE IF EXISTS `conn_item_picpay_aj`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_picpay_aj` (
  `item_id` int(10) unsigned NOT NULL,
  `tipo_registro` varchar(2) DEFAULT NULL,
  `codigo_ec` decimal(15,0) DEFAULT NULL,
  `nome_ec` varchar(50) DEFAULT NULL,
  `data_transacao` date DEFAULT NULL,
  `data_ajuste` date DEFAULT NULL,
  `nseq_register_file` decimal(10,0) DEFAULT NULL,
  `id_mensagem` decimal(4,0) DEFAULT NULL,
  `id_tipo_transacao` varchar(40) DEFAULT NULL,
  `qtde_casas_decimais` decimal(2,0) DEFAULT NULL,
  `tipo_ajuste` varchar(1) DEFAULT NULL,
  `valor_bruto_ajuste` decimal(15,2) DEFAULT NULL,
  `codigo_autorizacao` decimal(15,0) DEFAULT NULL,
  `id_unico_transacao` varchar(64) DEFAULT NULL,
  `historico_ajustes` decimal(2,0) DEFAULT NULL,
  `cnpj_ec` decimal(14,0) DEFAULT NULL,
  `nsu_autorizacao_pdv` decimal(25,0) DEFAULT NULL,
  `numero_parcela` decimal(2,0) DEFAULT NULL,
  `horario_transacao` time DEFAULT NULL,
  `meio_captura` varchar(30) DEFAULT NULL,
  `valor_liquido` decimal(12,2) DEFAULT '0.00',
  `numero_cartao` varchar(20) DEFAULT NULL,
  `codigo_ec_matriz` decimal(15,0) DEFAULT NULL,
  `numero_lote` varchar(30) DEFAULT NULL,
  `unidade_recebivel` varchar(30) DEFAULT NULL,
  `transacao_split` char(1) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  KEY `ixd_id_unico_transacao` (`id_unico_transacao`),
  CONSTRAINT `conn_item_picpay_aj_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_picpay_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_picpay_cv`
--

DROP TABLE IF EXISTS `conn_item_picpay_cv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_picpay_cv` (
  `item_id` int(10) unsigned NOT NULL,
  `tipo_registro` varchar(2) DEFAULT NULL,
  `codigo_ec` decimal(15,0) DEFAULT NULL,
  `nome_ec` varchar(50) DEFAULT NULL,
  `codigo_operador` decimal(15,0) DEFAULT NULL,
  `data_geracao` date DEFAULT NULL,
  `nseq_register_file` decimal(10,0) DEFAULT NULL,
  `id_mensagem` decimal(4,0) DEFAULT NULL,
  `id_tipo_transacao` varchar(40) DEFAULT NULL,
  `qtde_casas_decimais` decimal(2,0) DEFAULT NULL,
  `valor_bruto_transacao` decimal(15,2) DEFAULT NULL,
  `taxa_comissao` decimal(15,2) DEFAULT NULL,
  `valor_comissao` decimal(15,2) DEFAULT NULL,
  `valor_liquido` decimal(15,2) DEFAULT NULL,
  `data_transacao_pdv` date DEFAULT NULL,
  `hora_transacao_pdv` time DEFAULT NULL,
  `data_pagamento_ec` date DEFAULT NULL,
  `id_transacao_pdv` varchar(30) DEFAULT NULL,
  `codigo_autorizacao` decimal(15,0) DEFAULT NULL,
  `id_unico_transacao` varchar(64) DEFAULT NULL,
  `status_transacao` decimal(2,0) DEFAULT NULL,
  `descricao_status_transacao` varchar(50) DEFAULT NULL,
  `codigo_resp_autorizacao` decimal(2,0) DEFAULT NULL,
  `cnpj_ec` decimal(14,0) DEFAULT NULL,
  `codigo_ec_pdv` decimal(15,0) DEFAULT NULL,
  `codigo_terminal_pdv` varchar(20) DEFAULT NULL,
  `codigo_produto` decimal(2,0) DEFAULT NULL,
  `desc_tipo_produto` varchar(60) DEFAULT NULL,
  `codigo_categoria` decimal(2,0) DEFAULT NULL,
  `tipo_operacao` char(1) DEFAULT NULL,
  `tipo_movimento` varchar(20) DEFAULT NULL,
  `data_confirmacao_transacao` date DEFAULT NULL,
  `codigo_ec_matriz` decimal(15,0) DEFAULT NULL,
  `numero_total_parcelas` decimal(2,0) DEFAULT NULL,
  `numero_parcela` decimal(2,0) DEFAULT NULL,
  `numero_cartao` varchar(20) DEFAULT NULL,
  `bandeira` varchar(30) DEFAULT NULL,
  `valor_comissao_parcela` decimal(10,2) DEFAULT '0.00',
  `juros_estabelecimento` decimal(10,2) DEFAULT '0.00',
  `numero_lote` varchar(30) DEFAULT NULL,
  `nacionalidade_cartao` varchar(30) DEFAULT NULL,
  `tipo_entrada` varchar(30) DEFAULT NULL,
  `unidade_recebivel` varchar(30) DEFAULT NULL,
  `modo_captura` smallint(6) DEFAULT NULL,
  `desconto_antecipacao` decimal(10,2) DEFAULT '0.00',
  `transacao_split` char(1) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  KEY `k1` (`id_transacao_pdv`),
  KEY `ixd_id_unico_transacao` (`id_unico_transacao`),
  CONSTRAINT `conn_item_picpay_cv_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_picpay_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_picpay_header`
--

DROP TABLE IF EXISTS `conn_item_picpay_header`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_picpay_header` (
  `item_id` int(10) unsigned NOT NULL,
  `tipo_registro` varchar(2) DEFAULT NULL,
  `layout_arquivo` varchar(6) DEFAULT NULL,
  `data_geracao` date DEFAULT NULL,
  `hora_geracao` time DEFAULT NULL,
  `nseq_file` decimal(10,0) DEFAULT NULL,
  `id_geradora` varchar(6) DEFAULT NULL,
  `codigo_destinatario` decimal(14,0) DEFAULT NULL,
  `nome_destinatario` varchar(50) DEFAULT NULL,
  `id_processamento` varchar(1) DEFAULT NULL,
  `nseq_register_file` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_picpay_header_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_picpay_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_picpay_line`
--

DROP TABLE IF EXISTS `conn_item_picpay_line`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_picpay_line` (
  `item_id` int(10) unsigned NOT NULL,
  `registertype` varchar(2) NOT NULL,
  `filetype` varchar(2) DEFAULT NULL,
  `masterid` int(10) unsigned DEFAULT NULL,
  `duplicated` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`item_id`),
  KEY `masterid` (`masterid`),
  CONSTRAINT `conn_item_picpay_line_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `vooo_prod_backend`.`connection_item` (`item_id`),
  CONSTRAINT `conn_item_picpay_line_ibfk_2` FOREIGN KEY (`masterid`) REFERENCES `conn_item_picpay_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_picpay_pg`
--

DROP TABLE IF EXISTS `conn_item_picpay_pg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_picpay_pg` (
  `item_id` int(10) unsigned NOT NULL,
  `tipo_registro` varchar(2) DEFAULT NULL,
  `codigo_ec` decimal(15,0) DEFAULT NULL,
  `nome_ec` varchar(50) DEFAULT NULL,
  `data_transacao` date DEFAULT NULL,
  `data_pagamento` date DEFAULT NULL,
  `nseq_register_file` decimal(10,0) DEFAULT NULL,
  `id_mensagem` decimal(4,0) DEFAULT NULL,
  `id_tipo_transacao` varchar(40) DEFAULT NULL,
  `qtde_casas_decimais` decimal(2,0) DEFAULT NULL,
  `valor_bruto_transacao` decimal(15,2) DEFAULT NULL,
  `taxa_comissao` decimal(15,2) DEFAULT NULL,
  `valor_comissao` decimal(15,2) DEFAULT NULL,
  `valor_liquido` decimal(15,2) DEFAULT NULL,
  `id_unico_transacao` varchar(64) DEFAULT NULL,
  `status_transacao` decimal(2,0) DEFAULT NULL,
  `descricao_status_transacao` varchar(50) DEFAULT NULL,
  `codigo_resp_autorizacao` decimal(2,0) DEFAULT NULL,
  `cnpj_ec` decimal(14,0) DEFAULT NULL,
  `codigo_ec_pdv` decimal(15,0) DEFAULT NULL,
  `codigo_terminal_pdv` varchar(20) DEFAULT NULL,
  `codigo_autorizacao` decimal(15,0) DEFAULT NULL,
  `nsu_autorizacao_pdv` decimal(25,0) DEFAULT NULL,
  `codigo_produto` decimal(2,0) DEFAULT NULL,
  `tipo_operacao` char(1) DEFAULT NULL,
  `id_transacao` varchar(64) DEFAULT NULL,
  `codigo_categoria` decimal(2,0) DEFAULT NULL,
  `data_prevista_liquidacao_transacao` date DEFAULT NULL,
  `data_liquidacao_transacao` date DEFAULT NULL,
  `codigo_ec_matriz` decimal(15,0) DEFAULT NULL,
  `numero_total_parcelas` decimal(2,0) DEFAULT NULL,
  `numero_parcela` decimal(2,0) DEFAULT NULL,
  `numero_cartao` varchar(20) DEFAULT NULL,
  `codigo_antecipacao` decimal(15,0) DEFAULT NULL,
  `taxa_antecipacao` decimal(12,2) DEFAULT '0.00',
  `valor_antecipado` decimal(12,2) DEFAULT '0.00',
  `valor_total_taxa` decimal(12,2) DEFAULT '0.00',
  `valor_cancelamento` decimal(12,2) DEFAULT '0.00',
  `valor_taxa_cancelamento` decimal(12,2) DEFAULT '0.00',
  `juros_titular_cartao` decimal(12,2) DEFAULT '0.00',
  `juros_estabelecimento` decimal(12,2) DEFAULT '0.00',
  `cancelamento_juros_estabelecimento` decimal(12,2) DEFAULT '0.00',
  `total_juros_estabelecimento` decimal(12,2) DEFAULT '0.00',
  `codigo_agencia` decimal(10,0) DEFAULT NULL,
  `codigo_banco` decimal(6,0) DEFAULT NULL,
  `numero_conta` decimal(10,0) DEFAULT NULL,
  `numero_lote` varchar(30) DEFAULT NULL,
  `modo_entrada` varchar(30) DEFAULT NULL,
  `unidade_recebivel` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  KEY `ixd_id_unico_transacao` (`id_unico_transacao`),
  CONSTRAINT `conn_item_picpay_pg_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_picpay_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_picpay_pix`
--

DROP TABLE IF EXISTS `conn_item_picpay_pix`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_picpay_pix` (
  `item_id` int(10) unsigned NOT NULL,
  `tipo_registro` varchar(2) DEFAULT NULL,
  `id_movimento` varchar(64) DEFAULT NULL,
  `codigo_ec` varchar(15) DEFAULT NULL,
  `nome_ec` varchar(50) DEFAULT NULL,
  `documento` varchar(15) DEFAULT NULL,
  `tipo_documento` varchar(6) DEFAULT NULL,
  `data_transacao` date DEFAULT NULL,
  `data_movimento` date DEFAULT NULL,
  `data_pagamento` date DEFAULT NULL,
  `tipo_venda` varchar(6) DEFAULT NULL,
  `tipo_canal` smallint(6) DEFAULT NULL,
  `tipo_movimento` varchar(50) DEFAULT NULL,
  `valor_transacao` decimal(10,2) DEFAULT NULL,
  `valor_comissao` decimal(10,2) DEFAULT NULL,
  `porcentagem_comissao` decimal(10,2) DEFAULT NULL,
  `valor_liquido` decimal(10,2) DEFAULT NULL,
  `taxa_contratual` decimal(10,2) DEFAULT NULL,
  `plano` smallint(6) DEFAULT NULL,
  `parcela` smallint(6) DEFAULT NULL,
  `id_transacao` varchar(64) DEFAULT NULL,
  `id_pix` varchar(64) DEFAULT NULL,
  `nome_pagado` varchar(120) DEFAULT NULL,
  `documento_pagador` varchar(15) DEFAULT NULL,
  `conta_pagador` varchar(15) DEFAULT NULL,
  `agendia_pagador` varchar(12) DEFAULT NULL,
  `banco_pagador` varchar(8) DEFAULT NULL,
  `chave_receptor` varchar(120) DEFAULT NULL,
  `conta_receptor` varchar(15) DEFAULT NULL,
  `agendia_receptor` varchar(12) DEFAULT NULL,
  `banco_receptor` varchar(8) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_picpay_pix_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_picpay_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_picpay_retiradas`
--

DROP TABLE IF EXISTS `conn_item_picpay_retiradas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_picpay_retiradas` (
  `item_id` int(10) unsigned NOT NULL,
  `tipo_registro` varchar(2) DEFAULT NULL,
  `data_retirada` date DEFAULT NULL,
  `nseq_register_file` decimal(10,0) DEFAULT NULL,
  `id_saque` decimal(15,0) DEFAULT NULL,
  `cnpj_ec` decimal(14,0) DEFAULT NULL,
  `nome_ec` varchar(50) DEFAULT NULL,
  `codigo_ec` decimal(15,0) DEFAULT NULL,
  `qtde_casas_decimais` decimal(2,0) DEFAULT NULL,
  `valor_retirada` decimal(15,2) DEFAULT NULL,
  `agencia` decimal(4,0) DEFAULT NULL,
  `banco` decimal(4,0) DEFAULT NULL,
  `contacorrente` varchar(10) DEFAULT NULL,
  `id_mensagem` varchar(40) DEFAULT NULL,
  `id_tipo_transacao` varchar(40) DEFAULT NULL,
  `valor_comissao_perc` decimal(12,2) DEFAULT '0.00',
  `valor_comissao` decimal(12,2) DEFAULT '0.00',
  `valor_liquido` decimal(12,2) DEFAULT '0.00',
  `id_unico_transacao` varchar(64) DEFAULT NULL,
  `status_transacao` decimal(2,0) DEFAULT NULL,
  `descricao_status_transacao` varchar(50) DEFAULT NULL,
  `codigo_resp_autorizacao` decimal(2,0) DEFAULT NULL,
  `cnpj_ec2` decimal(14,0) DEFAULT NULL,
  `ec_pdv` decimal(15,2) DEFAULT NULL,
  `numero_terminal` varchar(30) DEFAULT NULL,
  `codigo_autorizacao` int(10) unsigned DEFAULT NULL,
  `nsu_pdv` varchar(30) DEFAULT NULL,
  `codigo_produto` decimal(2,0) DEFAULT NULL,
  `tipo_operacao` varchar(1) DEFAULT NULL,
  `codigo_categoria` decimal(2,0) DEFAULT NULL,
  `data_prevista_liquidacao_transacao` date DEFAULT NULL,
  `data_liquidacao_transacao` date DEFAULT NULL,
  `codigo_ec_matriz` decimal(15,0) DEFAULT NULL,
  `numero_total_parcelas` decimal(2,0) DEFAULT NULL,
  `numero_parcela` decimal(2,0) DEFAULT NULL,
  `numero_cartao` varchar(20) DEFAULT NULL,
  `codigo_antecipacao` decimal(11,0) DEFAULT NULL,
  `taxa_antecipacao` decimal(12,2) DEFAULT NULL,
  `valor_antecipado` decimal(12,2) DEFAULT NULL,
  `valor_cancelamento` decimal(12,2) DEFAULT NULL,
  `valor_taxa_cancelamento` decimal(12,2) DEFAULT NULL,
  `juros_titular_cartao` decimal(12,2) DEFAULT NULL,
  `juros_estabelecimento` decimal(12,2) DEFAULT NULL,
  `cancelamento_juros_estabelecimento` decimal(12,2) DEFAULT NULL,
  `total_juros_estabelecimento` decimal(12,2) DEFAULT NULL,
  `numero_lote` varchar(30) DEFAULT NULL,
  `modo_entrada` varchar(30) DEFAULT NULL,
  `transacao_split` char(1) DEFAULT NULL,
  `transacao_ecommerce` char(1) DEFAULT NULL,
  `transacao_recorente` char(1) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_picpay_retiradas_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_picpay_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_picpay_trailer`
--

DROP TABLE IF EXISTS `conn_item_picpay_trailer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_picpay_trailer` (
  `item_id` int(10) unsigned NOT NULL,
  `tipo_registro` varchar(2) DEFAULT NULL,
  `total_registros` decimal(10,0) DEFAULT NULL,
  `somatorio_valor_bruto` decimal(15,2) DEFAULT NULL,
  `nseq_register_file` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_picpay_trailer_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_picpay_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_pix_reversal_transactions`
--

DROP TABLE IF EXISTS `conn_item_pix_reversal_transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_pix_reversal_transactions` (
  `item_id` int(10) unsigned NOT NULL,
  `codigo_estabelecimento` varchar(20) DEFAULT NULL,
  `nsu_venda` varchar(64) DEFAULT NULL,
  `codigo_autorizacao` varchar(64) DEFAULT NULL,
  `codigo_pedido` varchar(64) DEFAULT NULL,
  `data_venda` date DEFAULT NULL,
  `hora_venda` time DEFAULT NULL,
  `data_cancelamento` date DEFAULT NULL,
  `codigo_cancelamento` varchar(64) DEFAULT NULL,
  `nsu_cancelamento` varchar(64) DEFAULT NULL,
  `valor_bruto` decimal(11,2) DEFAULT NULL,
  `valor_liquido` decimal(11,2) DEFAULT NULL,
  `data_liquidacao` date DEFAULT NULL,
  `num_da_parcela` decimal(2,0) DEFAULT NULL,
  `num_parcelas` decimal(2,0) DEFAULT NULL,
  `client_id` int(11) DEFAULT NULL,
  `provider_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_pix_reversal_transactions_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `vooo_prod_backend`.`connection_item` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_policard_ajustes`
--

DROP TABLE IF EXISTS `conn_item_policard_ajustes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_policard_ajustes` (
  `item_id` int(10) unsigned NOT NULL,
  `tipo_registro` varchar(1) NOT NULL,
  `codigo_estabelecimento` varchar(15) NOT NULL,
  `numero_rv_ajustado` varchar(9) DEFAULT NULL,
  `data_rv` date DEFAULT NULL,
  `data_pagamento_rv` date DEFAULT NULL,
  `identificador_ajuste` varchar(20) NOT NULL,
  `brancos` varchar(1) DEFAULT NULL,
  `sinal_valor_ajuste` varchar(1) NOT NULL,
  `valor_ajuste` decimal(10,2) NOT NULL,
  `motivo_ajuste` varchar(2) NOT NULL,
  `data_carta` date DEFAULT NULL,
  `numero_cartao` varchar(19) DEFAULT NULL,
  `numero_rv_original` varchar(19) DEFAULT NULL,
  `nsu_original_administradora` varchar(12) DEFAULT NULL,
  `data_transacao_original` date DEFAULT NULL,
  `indicador_tipo_pagamento` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_policard_ajustes_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_policard_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_policard_header`
--

DROP TABLE IF EXISTS `conn_item_policard_header`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_policard_header` (
  `item_id` int(10) unsigned NOT NULL,
  `tipo_registro` varchar(1) NOT NULL,
  `data_criacao_arquivo` date NOT NULL,
  `hora_criacao_arquivo` time NOT NULL,
  `data_referencia_movimento` date NOT NULL,
  `arquivo_versao` varchar(8) NOT NULL,
  `codigo_estabelecimento` varchar(15) NOT NULL,
  `cnpj_administradora` varchar(14) NOT NULL,
  `nome_administradora` varchar(20) NOT NULL,
  `sequencia` int(11) NOT NULL,
  `codigo_administradora` varchar(2) NOT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_policard_header_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_policard_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_policard_line`
--

DROP TABLE IF EXISTS `conn_item_policard_line`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_policard_line` (
  `item_id` int(10) unsigned NOT NULL,
  `registertype` varchar(2) NOT NULL,
  `masterid` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  KEY `masterid` (`masterid`),
  CONSTRAINT `conn_item_policard_line_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `vooo_prod_backend`.`connection_item` (`item_id`),
  CONSTRAINT `conn_item_policard_line_ibfk_2` FOREIGN KEY (`masterid`) REFERENCES `conn_item_policard_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_policard_resumo_vendas`
--

DROP TABLE IF EXISTS `conn_item_policard_resumo_vendas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_policard_resumo_vendas` (
  `item_id` int(10) unsigned NOT NULL,
  `tipo_registro` varchar(1) NOT NULL,
  `codigo_estabelecimento` varchar(15) NOT NULL,
  `codigo_produto` varchar(2) NOT NULL,
  `forma_captura` varchar(3) DEFAULT NULL,
  `numero_rv` varchar(9) NOT NULL,
  `data_rv` date NOT NULL,
  `data_pagamento_rv` date DEFAULT NULL,
  `banco` varchar(3) NOT NULL,
  `agencia` varchar(6) NOT NULL,
  `conta_corrente` varchar(11) NOT NULL,
  `numero_cv_aceitos` int(11) NOT NULL,
  `numero_cv_rejeitados` int(11) NOT NULL,
  `valor_bruto` decimal(10,2) NOT NULL,
  `valor_liquido` decimal(10,2) NOT NULL,
  `valor_taxa_servico` decimal(10,2) NOT NULL,
  `valor_comissao` decimal(10,2) NOT NULL,
  `valor_rejeitado` decimal(10,2) NOT NULL,
  `valor_credito` decimal(10,2) NOT NULL,
  `valor_encargos` decimal(10,2) NOT NULL,
  `indicador_tipo_pagamento` varchar(2) NOT NULL,
  `numero_parcela_rv` int(11) NOT NULL,
  `quantidade_parcela_rv` int(11) NOT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_policard_resumo_vendas_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_policard_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_policard_trailler`
--

DROP TABLE IF EXISTS `conn_item_policard_trailler`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_policard_trailler` (
  `item_id` int(10) unsigned NOT NULL,
  `tipo_registro` varchar(1) NOT NULL,
  `quantidade_registros` int(11) NOT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_policard_trailler_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_policard_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_policard_transacoes`
--

DROP TABLE IF EXISTS `conn_item_policard_transacoes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_policard_transacoes` (
  `item_id` int(10) unsigned NOT NULL,
  `tipo_registro` varchar(1) NOT NULL,
  `codigo_estabelecimento` varchar(15) NOT NULL,
  `numero_rv` varchar(9) NOT NULL,
  `nsu_administradora` varchar(12) NOT NULL,
  `data_transacao` date NOT NULL,
  `hora_transacao` time NOT NULL,
  `numero_cartao` varchar(19) NOT NULL,
  `valor_transacao` decimal(10,2) NOT NULL,
  `valor_saque` decimal(10,2) NOT NULL,
  `valor_taxa_servico` decimal(10,2) NOT NULL,
  `numero_parcelas` int(11) NOT NULL,
  `numero_parcela_paga` int(11) NOT NULL,
  `valor_parcela_paga` decimal(10,2) NOT NULL,
  `data_pagamento` date DEFAULT NULL,
  `codigo_autorizacao` varchar(10) NOT NULL,
  `forma_captura` varchar(3) NOT NULL,
  `status_transacao` varchar(2) NOT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_policard_transacoes_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_policard_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_porto_seguro_ajuste`
--

DROP TABLE IF EXISTS `conn_item_porto_seguro_ajuste`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_porto_seguro_ajuste` (
  `item_id` int(10) unsigned NOT NULL,
  `tiporegistro` varchar(2) DEFAULT NULL,
  `codigo_ec` decimal(15,0) DEFAULT NULL,
  `nsu_transacao_original` varchar(36) DEFAULT NULL,
  `data_transacao_original` date DEFAULT NULL,
  `num_da_parcela` decimal(2,0) DEFAULT NULL,
  `nsu_transacao` decimal(12,0) DEFAULT NULL,
  `data_transacao_ajuste` date DEFAULT NULL,
  `hora_transacao_ajuste` time DEFAULT NULL,
  `tipo_lancamento` decimal(1,0) DEFAULT NULL,
  `data_lancamento` date DEFAULT NULL,
  `forma_captura` decimal(1,0) DEFAULT NULL,
  `tipo_ajuste` decimal(1,0) DEFAULT NULL,
  `codigo_ajuste` decimal(3,0) DEFAULT NULL,
  `descricao_ajuste` varchar(30) DEFAULT NULL,
  `valor_bruto` decimal(11,2) DEFAULT NULL,
  `valor_desconto` decimal(11,2) DEFAULT NULL,
  `valor_liquido` decimal(11,2) DEFAULT NULL,
  `banco` decimal(3,0) DEFAULT NULL,
  `agencia` decimal(6,0) DEFAULT NULL,
  `conta_corrente` varchar(11) DEFAULT NULL,
  `num_cartao` varchar(19) DEFAULT NULL,
  `codigo_bandeira` varchar(3) DEFAULT NULL,
  `codigo_produto` varchar(3) DEFAULT NULL,
  `valor_bruto_parcela` decimal(11,2) DEFAULT NULL,
  `valor_liquido_parcela` decimal(11,2) DEFAULT NULL,
  `codigo_pedido` varchar(36) DEFAULT NULL,
  `codigo_autorizacao` varchar(36) DEFAULT NULL,
  `num_parcelas` decimal(2,0) DEFAULT NULL,
  `sequencia_registro` decimal(6,0) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_porto_seguro_ajuste_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_porto_seguro_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_porto_seguro_cancel`
--

DROP TABLE IF EXISTS `conn_item_porto_seguro_cancel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_porto_seguro_cancel` (
  `item_id` int(10) unsigned NOT NULL,
  `tiporegistro` varchar(2) DEFAULT NULL,
  `codigo_ec` decimal(15,0) DEFAULT NULL,
  `nsu_transacao_original` decimal(36,0) DEFAULT NULL,
  `data_transacao_original` date DEFAULT NULL,
  `num_da_parcela` decimal(2,0) DEFAULT NULL,
  `nsu_transacao` decimal(36,0) DEFAULT NULL,
  `data_transacao_cancelamento` date DEFAULT NULL,
  `hora_transacao_cancelamento` time DEFAULT NULL,
  `forma_captura` decimal(1,0) DEFAULT NULL,
  `codigo_pedido` varchar(36) DEFAULT NULL,
  `codigo_autorizacao` varchar(36) DEFAULT NULL,
  `valor_bruto` decimal(11,0) DEFAULT NULL,
  `valor_liquido` decimal(11,0) DEFAULT NULL,
  `valor_bruto_parcela` decimal(11,0) DEFAULT NULL,
  `valor_liquido_parcela` decimal(11,0) DEFAULT NULL,
  `codigo_ajuste` decimal(3,0) DEFAULT NULL,
  `descricao_ajuste` varchar(30) DEFAULT NULL,
  `num_parcelas` decimal(2,0) DEFAULT NULL,
  `sequencia_registro` decimal(6,0) DEFAULT NULL,
  `data_liquidacao` date DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_porto_seguro_cancel_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_porto_seguro_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_porto_seguro_cv`
--

DROP TABLE IF EXISTS `conn_item_porto_seguro_cv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_porto_seguro_cv` (
  `item_id` int(10) unsigned NOT NULL,
  `tipo_registro` varchar(2) DEFAULT NULL,
  `codigo_ec` decimal(15,0) DEFAULT NULL,
  `nsu_adquirente` decimal(12,0) DEFAULT NULL,
  `data_transacao` date DEFAULT NULL,
  `hora_transacao` time DEFAULT NULL,
  `tipo_lancamento` decimal(1,0) DEFAULT NULL,
  `data_pagamento` date DEFAULT NULL,
  `tipo_produto` varchar(1) DEFAULT NULL,
  `forma_captura` decimal(1,0) DEFAULT NULL,
  `valor_bruto` decimal(11,2) DEFAULT NULL,
  `valor_desconto` decimal(11,2) DEFAULT NULL,
  `valor_liquido` decimal(11,2) DEFAULT NULL,
  `num_cartao` varchar(19) DEFAULT NULL,
  `num_da_parcela` decimal(2,0) DEFAULT NULL,
  `num_parcelas` decimal(2,0) DEFAULT NULL,
  `nsu_parcela` varchar(36) DEFAULT NULL,
  `valor_bruto_parcela` decimal(11,2) DEFAULT NULL,
  `valor_desconto_parcela` decimal(11,2) DEFAULT NULL,
  `valor_liquido_parcela` decimal(11,2) DEFAULT NULL,
  `banco` decimal(3,0) DEFAULT NULL,
  `agencia` decimal(6,0) DEFAULT NULL,
  `conta_corrente` varchar(11) DEFAULT NULL,
  `codigo_autorizacao` varchar(36) DEFAULT NULL,
  `codigo_bandeira` varchar(3) DEFAULT NULL,
  `codigo_produto` varchar(3) DEFAULT NULL,
  `valor_taxa_1` decimal(11,2) DEFAULT NULL,
  `valor_taxa_2` decimal(11,2) DEFAULT NULL,
  `valor_taxa_1_parcela` decimal(11,2) DEFAULT NULL,
  `valor_taxa_2_parcela` decimal(11,2) DEFAULT NULL,
  `valor_taxa_antecipacao` decimal(11,2) DEFAULT NULL,
  `valor_liquido_antecipado` decimal(11,2) DEFAULT NULL,
  `codigo_pedido` varchar(36) DEFAULT NULL,
  `numero_terminal` varchar(8) DEFAULT NULL,
  `codigo_shellbox` varchar(50) DEFAULT NULL,
  `sequencia_registro` decimal(6,0) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  KEY `idx_nsu_adquirente` (`nsu_adquirente`),
  CONSTRAINT `conn_item_porto_seguro_cv_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_porto_seguro_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_porto_seguro_header`
--

DROP TABLE IF EXISTS `conn_item_porto_seguro_header`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_porto_seguro_header` (
  `item_id` int(10) unsigned NOT NULL,
  `tipo_registro` varchar(2) DEFAULT NULL,
  `versao_layout` varchar(6) DEFAULT NULL,
  `data_criacao` date DEFAULT NULL,
  `hora_criacao` time DEFAULT NULL,
  `sequencia` decimal(6,0) DEFAULT NULL,
  `nome_adquirente` varchar(30) DEFAULT NULL,
  `codigo_ec` decimal(13,0) DEFAULT NULL,
  `tipo_processamento` varchar(1) DEFAULT NULL,
  `sequencia_registro` decimal(6,0) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_porto_seguro_header_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_porto_seguro_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_porto_seguro_header_mov`
--

DROP TABLE IF EXISTS `conn_item_porto_seguro_header_mov`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_porto_seguro_header_mov` (
  `item_id` int(10) unsigned NOT NULL,
  `tipo_registro` varchar(2) DEFAULT NULL,
  `data_movimento` date DEFAULT NULL,
  `moeda` varchar(2) DEFAULT NULL,
  `sequencia_registro` decimal(6,0) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_porto_seguro_header_mov_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_porto_seguro_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_porto_seguro_line`
--

DROP TABLE IF EXISTS `conn_item_porto_seguro_line`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_porto_seguro_line` (
  `item_id` int(10) unsigned NOT NULL,
  `register_type` varchar(2) NOT NULL,
  `masterid` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  KEY `masterid` (`masterid`),
  CONSTRAINT `conn_item_porto_seguro_line_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `vooo_prod_backend`.`connection_item` (`item_id`),
  CONSTRAINT `conn_item_porto_seguro_line_ibfk_2` FOREIGN KEY (`masterid`) REFERENCES `conn_item_porto_seguro_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_porto_seguro_trailer`
--

DROP TABLE IF EXISTS `conn_item_porto_seguro_trailer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_porto_seguro_trailer` (
  `item_id` int(10) unsigned NOT NULL,
  `tipo_registro` varchar(2) DEFAULT NULL,
  `qtd_registros` decimal(6,0) DEFAULT NULL,
  `sequencia_registro` decimal(6,0) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_porto_seguro_trailer_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_porto_seguro_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_porto_seguro_trailermov`
--

DROP TABLE IF EXISTS `conn_item_porto_seguro_trailermov`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_porto_seguro_trailermov` (
  `item_id` int(10) unsigned NOT NULL,
  `tipo_registro` varchar(2) DEFAULT NULL,
  `total_registros` decimal(6,0) DEFAULT NULL,
  `total_creditos` decimal(12,2) DEFAULT NULL,
  `sequencia_registro` decimal(6,0) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_porto_seguro_trailermov_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_porto_seguro_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_rede_api_cancelments`
--

DROP TABLE IF EXISTS `conn_item_rede_api_cancelments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_rede_api_cancelments` (
  `item_id` int(10) unsigned NOT NULL,
  `merchant_company_number` varchar(9) DEFAULT NULL,
  `merchant_document_number` varchar(15) DEFAULT NULL,
  `merchant_company_name` varchar(50) DEFAULT NULL,
  `merchant_trade_name` varchar(50) DEFAULT NULL,
  `brand_code` smallint(6) DEFAULT NULL,
  `authorization_code` varchar(6) DEFAULT NULL,
  `modality_type` varchar(15) DEFAULT NULL,
  `modality_code` smallint(6) DEFAULT NULL,
  `modality_product` varchar(50) DEFAULT NULL,
  `modality_product_code` smallint(6) DEFAULT NULL,
  `installment_quantity` smallint(6) DEFAULT NULL,
  `nsu` varchar(15) DEFAULT NULL,
  `tid` varchar(20) DEFAULT NULL,
  `order_number` varchar(20) DEFAULT NULL,
  `sale_summary_number` varchar(15) DEFAULT NULL,
  `movement_date` date DEFAULT NULL,
  `sale_date` date DEFAULT NULL,
  `sale_hour` time DEFAULT NULL,
  `status` varchar(12) DEFAULT NULL,
  `chargeback_status` varchar(50) DEFAULT NULL,
  `device_type` varchar(10) DEFAULT NULL,
  `device` varchar(10) DEFAULT NULL,
  `capture_type` varchar(50) DEFAULT NULL,
  `capture_type_code` smallint(6) DEFAULT NULL,
  `amount` decimal(15,2) DEFAULT NULL,
  `mdr_fee` decimal(8,5) DEFAULT NULL,
  `mdr_amount` decimal(15,2) DEFAULT NULL,
  `flex` smallint(6) DEFAULT NULL,
  `flex_fee` decimal(8,5) DEFAULT NULL,
  `flex_amount` decimal(15,2) DEFAULT NULL,
  `fee_total` decimal(8,5) DEFAULT NULL,
  `discount_amount` decimal(15,2) DEFAULT NULL,
  `net_amount` decimal(15,2) DEFAULT NULL,
  `boarding_fee_amount` decimal(15,2) DEFAULT NULL,
  `ard` varchar(23) DEFAULT NULL,
  `last_tracking_amount` decimal(15,2) DEFAULT NULL,
  `last_tracking_date` date DEFAULT NULL,
  `last_tracking_status` varchar(30) DEFAULT NULL,
  `tokenized` smallint(6) DEFAULT NULL,
  `card_number` varchar(20) DEFAULT NULL,
  `token_number` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_rede_api_cancelments_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_rede_api_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_rede_api_header`
--

DROP TABLE IF EXISTS `conn_item_rede_api_header`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_rede_api_header` (
  `item_id` int(10) unsigned NOT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `amount` decimal(15,2) DEFAULT NULL,
  `amount_credit` decimal(15,2) DEFAULT NULL,
  `amount_debit` decimal(15,2) DEFAULT NULL,
  `net_amount` decimal(15,2) DEFAULT NULL,
  `quantity` int(10) unsigned DEFAULT NULL,
  `discount_amount` decimal(15,2) DEFAULT NULL,
  `total_settlement` decimal(15,2) DEFAULT NULL,
  `total_cancellations` decimal(15,2) DEFAULT NULL,
  `contract_code` bigint(20) unsigned DEFAULT NULL,
  `data_type` smallint(2) unsigned DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  KEY `idx_contract_code` (`start_date`,`contract_code`),
  CONSTRAINT `conn_item_rede_api_header_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_rede_api_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_rede_api_line`
--

DROP TABLE IF EXISTS `conn_item_rede_api_line`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_rede_api_line` (
  `item_id` int(10) unsigned NOT NULL,
  `register_type` smallint(6) DEFAULT NULL,
  `masterid` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  KEY `conn_item_rede_api_line_ibfk_2` (`masterid`),
  CONSTRAINT `conn_item_rede_api_line_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `vooo_prod_backend`.`connection_item` (`item_id`),
  CONSTRAINT `conn_item_rede_api_line_ibfk_2` FOREIGN KEY (`masterid`) REFERENCES `conn_item_rede_api_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_rede_api_payments`
--

DROP TABLE IF EXISTS `conn_item_rede_api_payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_rede_api_payments` (
  `item_id` int(10) unsigned NOT NULL,
  `payment_id` varchar(20) DEFAULT NULL,
  `payment_date` date DEFAULT NULL,
  `credit_order_number` varchar(15) DEFAULT NULL,
  `sales_summary_number` varchar(15) DEFAULT NULL,
  `brand_code` smallint(6) DEFAULT NULL,
  `company_number` varchar(9) DEFAULT NULL,
  `amount` decimal(15,2) DEFAULT NULL,
  `discount_amount` decimal(15,2) DEFAULT NULL,
  `net_amount` decimal(15,2) DEFAULT NULL,
  `type` varchar(15) DEFAULT NULL,
  `type_code` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_rede_api_payments_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_rede_api_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_rede_api_sales`
--

DROP TABLE IF EXISTS `conn_item_rede_api_sales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_rede_api_sales` (
  `item_id` int(10) unsigned NOT NULL,
  `merchant_company_number` varchar(9) DEFAULT NULL,
  `merchant_document_number` varchar(15) DEFAULT NULL,
  `merchant_company_name` varchar(30) DEFAULT NULL,
  `merchant_trade_name` varchar(30) DEFAULT NULL,
  `brand_code` smallint(6) DEFAULT NULL,
  `authorization_code` varchar(6) DEFAULT NULL,
  `modality_type` varchar(15) DEFAULT NULL,
  `modality_code` smallint(6) DEFAULT NULL,
  `modality_product` varchar(50) DEFAULT NULL,
  `modality_product_code` smallint(6) DEFAULT NULL,
  `installment_quantity` smallint(6) DEFAULT NULL,
  `nsu` varchar(15) DEFAULT NULL,
  `tid` varchar(20) DEFAULT NULL,
  `order_number` varchar(20) DEFAULT NULL,
  `sale_summary_number` varchar(15) DEFAULT NULL,
  `movement_date` date DEFAULT NULL,
  `sale_date` date DEFAULT NULL,
  `sale_hour` time DEFAULT NULL,
  `status` varchar(12) DEFAULT NULL,
  `chargeback_status` varchar(50) DEFAULT NULL,
  `device_type` varchar(10) DEFAULT NULL,
  `device` varchar(10) DEFAULT NULL,
  `capture_type` varchar(50) DEFAULT NULL,
  `capture_type_code` smallint(6) DEFAULT NULL,
  `amount` decimal(15,2) DEFAULT NULL,
  `mdr_fee` decimal(8,5) DEFAULT NULL,
  `mdr_amount` decimal(15,2) DEFAULT NULL,
  `flex` smallint(6) DEFAULT NULL,
  `flex_fee` decimal(8,5) DEFAULT NULL,
  `flex_amount` decimal(15,2) DEFAULT NULL,
  `fee_total` decimal(8,5) DEFAULT NULL,
  `discount_amount` decimal(15,2) DEFAULT NULL,
  `net_amount` decimal(15,2) DEFAULT NULL,
  `boarding_fee_amount` decimal(15,2) DEFAULT NULL,
  `ard` varchar(23) DEFAULT NULL,
  `last_tracking_amount` decimal(15,2) DEFAULT NULL,
  `last_tracking_date` date DEFAULT NULL,
  `last_tracking_status` varchar(20) DEFAULT NULL,
  `tokenized` smallint(6) DEFAULT NULL,
  `card_number` varchar(20) DEFAULT NULL,
  `token_number` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  KEY `idx_sale` (`merchant_company_number`,`sale_date`,`nsu`),
  CONSTRAINT `conn_item_rede_api_sales_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_rede_api_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_rede_api_sales_installments`
--

DROP TABLE IF EXISTS `conn_item_rede_api_sales_installments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_rede_api_sales_installments` (
  `item_id` int(10) unsigned NOT NULL,
  `company_number` varchar(9) DEFAULT NULL,
  `nsu` varchar(15) DEFAULT NULL,
  `tid` varchar(20) DEFAULT NULL,
  `sale_date` date DEFAULT NULL,
  `movement_date` date DEFAULT NULL,
  `expiration_date` date DEFAULT NULL,
  `installment_quantity` smallint(6) DEFAULT NULL,
  `installment_number` smallint(6) DEFAULT NULL,
  `sale_summary_number` varchar(15) DEFAULT NULL,
  `mdr_amount` decimal(8,5) DEFAULT NULL,
  `amount` decimal(15,2) DEFAULT NULL,
  `sale_amount` decimal(15,2) DEFAULT NULL,
  `discount_amount` decimal(15,2) DEFAULT NULL,
  `net_amount` decimal(15,2) DEFAULT NULL,
  `mdr_fee` decimal(8,2) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  KEY `idx_sale` (`sale_date`,`company_number`,`nsu`),
  CONSTRAINT `conn_item_rede_api_sales_installments_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_rede_api_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_rede_api_settlement`
--

DROP TABLE IF EXISTS `conn_item_rede_api_settlement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_rede_api_settlement` (
  `item_id` int(10) unsigned NOT NULL,
  `payment_id` varchar(20) DEFAULT NULL,
  `payment_date` date DEFAULT NULL,
  `credit_order_number` varchar(15) DEFAULT NULL,
  `sale_summary_number` varchar(15) DEFAULT NULL,
  `brand_code` smallint(6) DEFAULT NULL,
  `company_number` varchar(9) DEFAULT NULL,
  `amount` decimal(15,2) DEFAULT NULL,
  `discount_amount` decimal(15,2) DEFAULT NULL,
  `net_amount` decimal(15,2) DEFAULT NULL,
  `type` varchar(15) DEFAULT NULL,
  `type_code` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  KEY `idx_company_number` (`company_number`,`sale_summary_number`),
  CONSTRAINT `conn_item_rede_api_settlement_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_rede_api_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_rede_api_settlement_debits`
--

DROP TABLE IF EXISTS `conn_item_rede_api_settlement_debits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_rede_api_settlement_debits` (
  `item_id` int(10) unsigned NOT NULL,
  `trade_name` varchar(50) DEFAULT NULL,
  `company_name` varchar(50) DEFAULT NULL,
  `company_number` varchar(9) DEFAULT NULL,
  `document_number` varchar(15) DEFAULT NULL,
  `debit_number` varchar(15) DEFAULT NULL,
  `compensated_date` date DEFAULT NULL,
  `credit_order_number` varchar(15) DEFAULT NULL,
  `sale_summary_number` varchar(15) DEFAULT NULL,
  `adjustment_type_description` varchar(80) DEFAULT NULL,
  `payment_date` date DEFAULT NULL,
  `credit_order_expiration_date` date DEFAULT NULL,
  `adjustment_type_code` smallint(5) unsigned DEFAULT NULL,
  `type` varchar(15) DEFAULT NULL,
  `debit_compensated_amount` decimal(10,2) DEFAULT NULL,
  `debit_amount` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  KEY `idx_company_number` (`company_number`,`payment_date`),
  CONSTRAINT `conn_item_rede_api_settlement_debits_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_rede_api_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_rede_eef_creditadjusts`
--

DROP TABLE IF EXISTS `conn_item_rede_eef_creditadjusts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_rede_eef_creditadjusts` (
  `item_id` int(10) unsigned NOT NULL,
  `tiporegistro` int(10) unsigned DEFAULT NULL,
  `numeropv` int(10) unsigned DEFAULT NULL,
  `numeroresumocredito` bigint(20) unsigned DEFAULT NULL,
  `numerodocumento` bigint(20) unsigned DEFAULT NULL,
  `dataemissao` date DEFAULT NULL,
  `datacredito` date DEFAULT NULL,
  `valorcredito` decimal(10,2) DEFAULT NULL,
  `flagcredito` varchar(1) DEFAULT NULL,
  `banco` int(10) unsigned DEFAULT NULL,
  `agencia` int(10) unsigned DEFAULT NULL,
  `contacorrente` int(10) unsigned DEFAULT NULL,
  `motivocredito` int(10) unsigned DEFAULT NULL,
  `motivocreditodesc` varchar(28) DEFAULT NULL,
  `bandeira` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_rede_eef_creditadjusts_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_rede_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_rede_eef_credits`
--

DROP TABLE IF EXISTS `conn_item_rede_eef_credits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_rede_eef_credits` (
  `item_id` int(10) unsigned NOT NULL,
  `tiporegistro` int(10) unsigned DEFAULT NULL,
  `numeropv` int(10) unsigned DEFAULT NULL,
  `numerodocumento` bigint(20) unsigned DEFAULT NULL,
  `datalancamento` date DEFAULT NULL,
  `valorlancamento` decimal(10,2) DEFAULT NULL,
  `flagcredito` varchar(1) DEFAULT NULL,
  `banco` int(10) unsigned DEFAULT NULL,
  `agencia` int(10) unsigned DEFAULT NULL,
  `contacorrente` int(10) unsigned DEFAULT NULL,
  `datamovimento` date DEFAULT NULL,
  `numerorv` int(10) unsigned DEFAULT NULL,
  `datarv` date DEFAULT NULL,
  `bandeira` varchar(1) DEFAULT NULL,
  `tipotransacao` int(10) unsigned DEFAULT NULL,
  `valorbrutorv` decimal(10,2) DEFAULT NULL,
  `valortaxadesconto` decimal(10,2) DEFAULT NULL,
  `parcela` int(10) unsigned DEFAULT NULL,
  `separa` varchar(1) DEFAULT NULL,
  `totalparcelas` int(10) unsigned DEFAULT NULL,
  `statuscredito` varchar(2) DEFAULT NULL,
  `numeropvoriginal` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_rede_eef_credits_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_rede_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_rede_eef_debitadjust`
--

DROP TABLE IF EXISTS `conn_item_rede_eef_debitadjust`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_rede_eef_debitadjust` (
  `item_id` int(10) unsigned NOT NULL,
  `tiporegistro` int(10) unsigned DEFAULT NULL,
  `numeropv` int(10) unsigned DEFAULT NULL,
  `numerodocumento` bigint(20) unsigned DEFAULT NULL,
  `dataemissao` date DEFAULT NULL,
  `valordebito` decimal(10,2) DEFAULT NULL,
  `flagdebito` varchar(1) DEFAULT NULL,
  `banco` int(10) unsigned DEFAULT NULL,
  `agencia` int(10) unsigned DEFAULT NULL,
  `contacorrente` int(10) unsigned DEFAULT NULL,
  `numerorvoriginal` int(10) unsigned DEFAULT NULL,
  `datarvoriginal` date DEFAULT NULL,
  `valorcreditooriginal` decimal(10,2) DEFAULT NULL,
  `motivodebito` int(10) unsigned DEFAULT NULL,
  `motivodebitodesc` varchar(28) DEFAULT NULL,
  `numerocartao` varchar(20) DEFAULT NULL,
  `numerocarta` varchar(15) DEFAULT NULL,
  `mesreferencia` int(10) unsigned DEFAULT NULL,
  `datacarta` date DEFAULT NULL,
  `valorcancelamentosolicitado` decimal(10,2) DEFAULT NULL,
  `numeroprocesso` bigint(20) unsigned DEFAULT NULL,
  `numeropvoriginal` int(10) unsigned DEFAULT NULL,
  `datatransacaocv` date DEFAULT NULL,
  `numetonsu` int(10) unsigned DEFAULT NULL,
  `numeroresumodebito` bigint(20) unsigned DEFAULT NULL,
  `datadebito` date DEFAULT NULL,
  `valortransacaooriginal` decimal(10,2) DEFAULT NULL,
  `numeroautorizacao` varchar(6) DEFAULT NULL,
  `tipodebito` varchar(1) DEFAULT NULL,
  `valortotaldebito` decimal(10,2) DEFAULT NULL,
  `valorpendente` decimal(10,2) DEFAULT NULL,
  `bandeirarvoriginal` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_rede_eef_debitadjust_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_rede_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_rede_eef_desagendamento_parcela_complementar`
--

DROP TABLE IF EXISTS `conn_item_rede_eef_desagendamento_parcela_complementar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_rede_eef_desagendamento_parcela_complementar` (
  `item_id` int(10) unsigned NOT NULL,
  `tiporegistro` int(10) unsigned DEFAULT NULL,
  `numeropvoriginal` decimal(9,0) DEFAULT NULL,
  `numerorvoriginal` decimal(9,0) DEFAULT NULL,
  `datarvoriginal` date DEFAULT NULL,
  `numeronovopvajustado` decimal(9,0) DEFAULT NULL,
  `numeronovorvajustado` decimal(9,0) DEFAULT NULL,
  `novovalorparcelaajustado` decimal(15,2) DEFAULT NULL,
  `valororiginalparcelaalterada` decimal(15,2) DEFAULT NULL,
  `numeroreferencia` varchar(15) DEFAULT NULL,
  `datacreditorvajustado` date DEFAULT NULL,
  `valorajuste` decimal(15,2) DEFAULT NULL,
  `numeroparcelarvoriginal` decimal(2,0) DEFAULT NULL,
  `datacancelamento` date DEFAULT NULL,
  `valorcancelamentosolicitado` decimal(15,2) DEFAULT NULL,
  `numerocartao` varchar(16) DEFAULT NULL,
  `datatransacao` date DEFAULT NULL,
  `nsu` decimal(12,0) DEFAULT NULL,
  `tipodebito` decimal(1,0) DEFAULT NULL,
  `numeroparcelarvajustado` decimal(8,0) DEFAULT NULL,
  `bandeirarvajustado` varchar(1) DEFAULT NULL,
  `datarvajustado` date DEFAULT NULL,
  `tiponegociacao` varchar(1) DEFAULT NULL,
  `numerocontratonegociacao` decimal(17,0) DEFAULT NULL,
  `numerocnpjparceiro` decimal(15,0) DEFAULT NULL,
  `datanegociacao` date DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_rede_eef_desagendamento_parcela_complementar_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_rede_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_rede_eef_group_header`
--

DROP TABLE IF EXISTS `conn_item_rede_eef_group_header`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_rede_eef_group_header` (
  `item_id` int(10) unsigned NOT NULL,
  `tiporegistro` int(10) unsigned DEFAULT NULL,
  `pvmatriz` varchar(9) DEFAULT NULL,
  `nomematriz` varchar(22) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_rede_eef_group_header_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_rede_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_rede_eef_grouptrailer`
--

DROP TABLE IF EXISTS `conn_item_rede_eef_grouptrailer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_rede_eef_grouptrailer` (
  `item_id` int(10) unsigned NOT NULL,
  `tiporegistro` int(10) unsigned DEFAULT NULL,
  `numeropvmatriz` int(10) unsigned DEFAULT NULL,
  `qtdetotalmatriz` int(10) unsigned DEFAULT NULL,
  `valortotalmatriz` decimal(10,2) DEFAULT NULL,
  `qtdeantecipados` int(10) unsigned DEFAULT NULL,
  `valorantecipado` decimal(18,2) DEFAULT NULL,
  `qtdeajestescreditos` int(10) unsigned DEFAULT NULL,
  `valorajustescreditos` decimal(10,2) DEFAULT NULL,
  `qtdeajuestesdebitos` int(10) unsigned DEFAULT NULL,
  `valorajustesdebitos` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_rede_eef_grouptrailer_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_rede_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_rede_eef_header`
--

DROP TABLE IF EXISTS `conn_item_rede_eef_header`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_rede_eef_header` (
  `item_id` int(10) unsigned NOT NULL,
  `tiporegistro` int(10) unsigned DEFAULT NULL,
  `dataemissao` date DEFAULT NULL,
  `adquirente` varchar(8) DEFAULT NULL,
  `descricao` varchar(34) DEFAULT NULL,
  `empresamatriz` varchar(22) DEFAULT NULL,
  `sequencia` int(10) unsigned DEFAULT NULL,
  `numeroPVmatiz` int(10) unsigned DEFAULT NULL,
  `tipoprocessamento` varchar(15) DEFAULT NULL,
  `versaoarquivo` varchar(20) DEFAULT NULL,
  `periodoinicial` date DEFAULT NULL,
  `periodofinal` date DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  KEY `idx_dataemissao` (`dataemissao`),
  KEY `idx_pv_matriz` (`numeroPVmatiz`,`dataemissao`),
  CONSTRAINT `conn_item_rede_eef_header_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_rede_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_rede_eef_installmentscancel`
--

DROP TABLE IF EXISTS `conn_item_rede_eef_installmentscancel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_rede_eef_installmentscancel` (
  `item_id` int(10) unsigned NOT NULL,
  `tiporegistro` int(10) unsigned DEFAULT NULL,
  `numeropvoriginal` int(10) unsigned DEFAULT NULL,
  `numerorvoriginal` int(10) unsigned DEFAULT NULL,
  `numeroreferencia` bigint(20) unsigned DEFAULT NULL,
  `datacredito` date DEFAULT NULL,
  `valornovoparcela` decimal(10,2) DEFAULT NULL,
  `valororiginalparcela` decimal(10,2) DEFAULT NULL,
  `valorajuste` decimal(10,2) DEFAULT NULL,
  `datacancelamento` date DEFAULT NULL,
  `valorrvoriginal` decimal(10,2) DEFAULT NULL,
  `valorcancelamentosolicitado` decimal(10,2) DEFAULT NULL,
  `numerocartao` varchar(16) DEFAULT NULL,
  `datatransacao` date DEFAULT NULL,
  `nsu` int(10) unsigned DEFAULT NULL,
  `tipodebito` int(10) unsigned DEFAULT NULL,
  `numeroparcela` int(10) unsigned DEFAULT NULL,
  `bandeirarvoriginal` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_rede_eef_installmentscancel_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_rede_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_rede_eef_negociacoes`
--

DROP TABLE IF EXISTS `conn_item_rede_eef_negociacoes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_rede_eef_negociacoes` (
  `item_id` int(10) unsigned NOT NULL,
  `tiporegistro` int(10) unsigned DEFAULT NULL,
  `numeroestabelecimento` decimal(20,0) unsigned DEFAULT NULL,
  `numerodocumentoocref` decimal(20,0) unsigned DEFAULT NULL,
  `valoroc` decimal(10,2) DEFAULT NULL,
  `datalancamentooc` date DEFAULT NULL,
  `numeroestabelecimentooriginal` decimal(10,2) unsigned DEFAULT NULL,
  `numeroresumodevendas` int(10) unsigned DEFAULT NULL,
  `datavenda` date DEFAULT NULL,
  `identificadortransacao` decimal(20,0) unsigned DEFAULT NULL,
  `codigobandeira` varchar(3) DEFAULT NULL,
  `tiponegociacao` int(10) unsigned DEFAULT NULL,
  `numerocontratonegociacao` decimal(20,0) unsigned DEFAULT NULL,
  `numerocnpjparceiro` decimal(20,0) unsigned DEFAULT NULL,
  `numerodocumentoocnegociacao` decimal(20,0) unsigned DEFAULT NULL,
  `valornegociado` decimal(10,2) DEFAULT NULL,
  `datanegociacao` date DEFAULT NULL,
  `dataliquidacao` date DEFAULT NULL,
  `banco` int(10) unsigned DEFAULT NULL,
  `agencia` int(10) unsigned DEFAULT NULL,
  `conta` int(10) unsigned DEFAULT NULL,
  `statuscredito` int(10) unsigned DEFAULT NULL,
  `numeroparcela` decimal(2,0) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_rede_eef_negociacoes_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_rede_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_rede_eef_netadjusts`
--

DROP TABLE IF EXISTS `conn_item_rede_eef_netadjusts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_rede_eef_netadjusts` (
  `item_id` int(10) unsigned NOT NULL,
  `tiporegistro` int(10) unsigned DEFAULT NULL,
  `numeropv` int(10) unsigned DEFAULT NULL,
  `numerorv` int(10) unsigned DEFAULT NULL,
  `dataajuste` date DEFAULT NULL,
  `valorajuste` decimal(10,2) DEFAULT NULL,
  `flagdebito` varchar(1) DEFAULT NULL,
  `motivoajuste` int(10) unsigned DEFAULT NULL,
  `motivoajustedesc` varchar(28) DEFAULT NULL,
  `numerocartao` varchar(20) DEFAULT NULL,
  `datatransacao` date DEFAULT NULL,
  `numerorvoriginal` int(10) unsigned DEFAULT NULL,
  `numerocarta` varchar(15) DEFAULT NULL,
  `datacarta` date DEFAULT NULL,
  `mesreferencia` int(10) unsigned DEFAULT NULL,
  `numeropvoriginal` int(10) unsigned DEFAULT NULL,
  `datarvoriginal` varchar(8) DEFAULT NULL,
  `valortransacao` decimal(10,2) DEFAULT NULL,
  `desagendamentoounet` varchar(1) DEFAULT NULL,
  `datacredito` date DEFAULT NULL,
  `novovalorparcela` decimal(10,2) DEFAULT NULL,
  `valororiginalparcela` decimal(10,2) DEFAULT NULL,
  `valorbrutoresumo` decimal(10,2) DEFAULT NULL,
  `valorcancelamento` decimal(10,2) DEFAULT NULL,
  `numeronsu` int(10) unsigned DEFAULT NULL,
  `numeroautorizacao` varchar(6) DEFAULT NULL,
  `tipodebito` varchar(1) DEFAULT NULL,
  `numeroordemdebito` bigint(20) unsigned DEFAULT NULL,
  `valordebitototal` decimal(10,2) DEFAULT NULL,
  `valorpendente` decimal(10,2) DEFAULT NULL,
  `bandeirarvoriginal` varchar(1) DEFAULT NULL,
  `bandeirarvajustado` varchar(1) DEFAULT NULL,
  `numeroparcelarvajustado` decimal(2,0) DEFAULT NULL,
  `numeroparcelarvoriginal` decimal(2,0) DEFAULT NULL,
  `datarvajustado` date DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  KEY `idx_1` (`numeropv`,`numeronsu`,`numeroautorizacao`),
  CONSTRAINT `conn_item_rede_eef_netadjusts_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_rede_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_rede_eef_pendingdebits`
--

DROP TABLE IF EXISTS `conn_item_rede_eef_pendingdebits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_rede_eef_pendingdebits` (
  `item_id` int(10) unsigned NOT NULL,
  `tiporegistro` int(10) unsigned DEFAULT NULL,
  `numeropv` int(10) unsigned DEFAULT NULL,
  `numeroordemdebito` bigint(20) unsigned DEFAULT NULL,
  `dataordemdebito` date DEFAULT NULL,
  `valorordemdebito` decimal(10,2) DEFAULT NULL,
  `motivoajuste` int(10) unsigned DEFAULT NULL,
  `motivoajustedesc` varchar(28) DEFAULT NULL,
  `numerocartao` varchar(20) DEFAULT NULL,
  `numeronsu` int(10) unsigned DEFAULT NULL,
  `datacv` date DEFAULT NULL,
  `numeroautorizacao` varchar(6) DEFAULT NULL,
  `valortransacaooriginal` decimal(10,2) DEFAULT NULL,
  `numerorvoriginal` int(10) unsigned DEFAULT NULL,
  `datarvoriginal` date DEFAULT NULL,
  `numeropvoriginal` int(10) unsigned DEFAULT NULL,
  `numerocarta` varchar(15) DEFAULT NULL,
  `datacarta` date DEFAULT NULL,
  `numeroprocchargeback` bigint(20) unsigned DEFAULT NULL,
  `mesreferencia` int(10) unsigned DEFAULT NULL,
  `valorcompensado` decimal(10,2) DEFAULT NULL,
  `datapagamento` date DEFAULT NULL,
  `valorpendentedebito` decimal(10,2) DEFAULT NULL,
  `numeroprocretencao` bigint(20) unsigned DEFAULT NULL,
  `meiocompensacao` int(10) unsigned DEFAULT NULL,
  `meiocompensacaodesc` varchar(28) DEFAULT NULL,
  `identificabandeira` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_rede_eef_pendingdebits_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_rede_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_rede_eef_rav`
--

DROP TABLE IF EXISTS `conn_item_rede_eef_rav`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_rede_eef_rav` (
  `item_id` int(10) unsigned NOT NULL,
  `tiporegistro` int(10) unsigned DEFAULT NULL,
  `numeropv` int(10) unsigned DEFAULT NULL,
  `numerodocumento` bigint(20) unsigned DEFAULT NULL,
  `datalancamento` date DEFAULT NULL,
  `valorlancamento` decimal(10,2) DEFAULT NULL,
  `flagcredito` varchar(1) DEFAULT NULL,
  `banco` int(10) unsigned DEFAULT NULL,
  `agencia` int(10) unsigned DEFAULT NULL,
  `contacorrente` int(10) unsigned DEFAULT NULL,
  `numerorvcorrespondente` int(10) unsigned DEFAULT NULL,
  `datarvcorrespondente` date DEFAULT NULL,
  `valorcreditooriginal` decimal(10,2) DEFAULT NULL,
  `datavencimentooriginal` date DEFAULT NULL,
  `numeroparcelaoutotal` varchar(5) DEFAULT NULL,
  `valorbruto` decimal(10,2) DEFAULT NULL,
  `valortaxadesconto` decimal(10,2) DEFAULT NULL,
  `numeropvoriginal` int(10) unsigned DEFAULT NULL,
  `bandeira` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_rede_eef_rav_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_rede_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_rede_eef_requests`
--

DROP TABLE IF EXISTS `conn_item_rede_eef_requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_rede_eef_requests` (
  `item_id` int(10) unsigned NOT NULL,
  `tiporegistro` int(10) unsigned DEFAULT NULL,
  `numeropv` int(10) unsigned DEFAULT NULL,
  `quantidadeconsultas` int(10) unsigned DEFAULT NULL,
  `valortotal` decimal(10,2) DEFAULT NULL,
  `datainicio` date DEFAULT NULL,
  `datafim` date DEFAULT NULL,
  `valorconsulta` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_rede_eef_requests_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_rede_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_rede_eef_settleddebits`
--

DROP TABLE IF EXISTS `conn_item_rede_eef_settleddebits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_rede_eef_settleddebits` (
  `item_id` int(10) unsigned NOT NULL,
  `tiporegistro` int(10) unsigned DEFAULT NULL,
  `numeropv` int(10) unsigned DEFAULT NULL,
  `numeroordemdebito` bigint(20) unsigned DEFAULT NULL,
  `dataordemdebito` date DEFAULT NULL,
  `valorordemdebito` decimal(10,2) DEFAULT NULL,
  `motivoajuste` int(10) unsigned DEFAULT NULL,
  `motivoajustedesc` varchar(28) DEFAULT NULL,
  `numerocartao` varchar(20) DEFAULT NULL,
  `numeronsu` int(10) unsigned DEFAULT NULL,
  `datacv` date DEFAULT NULL,
  `numeroautorizacao` varchar(6) DEFAULT NULL,
  `valortransacaooriginal` decimal(10,2) DEFAULT NULL,
  `numerorvoriginal` int(10) unsigned DEFAULT NULL,
  `datarvoriginal` date DEFAULT NULL,
  `numeropvoriginal` int(10) unsigned DEFAULT NULL,
  `numerocarta` varchar(15) DEFAULT NULL,
  `datacarta` date DEFAULT NULL,
  `numeroprocchargeback` bigint(20) unsigned DEFAULT NULL,
  `mesreferencia` int(10) unsigned DEFAULT NULL,
  `valorliquidado` decimal(10,2) DEFAULT NULL,
  `dataliquidacao` date DEFAULT NULL,
  `numeroprocretencao` varchar(15) DEFAULT NULL,
  `meiocompensacao` int(10) unsigned DEFAULT NULL,
  `meiocompensacaodesc` varchar(28) DEFAULT NULL,
  `identificabandeira` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_rede_eef_settleddebits_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_rede_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_rede_eef_totalcredits`
--

DROP TABLE IF EXISTS `conn_item_rede_eef_totalcredits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_rede_eef_totalcredits` (
  `item_id` int(10) unsigned NOT NULL,
  `tiporegistro` int(10) unsigned DEFAULT NULL,
  `numeropv` int(10) unsigned DEFAULT NULL,
  `brancos` varchar(7) DEFAULT NULL,
  `datacredito` date DEFAULT NULL,
  `valortotalcredito` decimal(10,2) DEFAULT NULL,
  `brancos2` varchar(1) DEFAULT NULL,
  `banco` int(10) unsigned DEFAULT NULL,
  `agencia` int(10) unsigned DEFAULT NULL,
  `contacorrente` int(10) unsigned DEFAULT NULL,
  `datageracaoarquivo` date DEFAULT NULL,
  `datecreditoantecipado` date DEFAULT NULL,
  `valorcreditoantecipado` decimal(10,2) DEFAULT NULL,
  `valordivergente` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_rede_eef_totalcredits_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_rede_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_rede_eef_trailer`
--

DROP TABLE IF EXISTS `conn_item_rede_eef_trailer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_rede_eef_trailer` (
  `item_id` int(10) unsigned NOT NULL,
  `tiporegistro` int(10) unsigned DEFAULT NULL,
  `qtdematrizes` int(10) unsigned DEFAULT NULL,
  `qtderegistros` int(10) unsigned DEFAULT NULL,
  `numeropvgrupo` int(10) unsigned DEFAULT NULL,
  `qtderesumos` int(10) unsigned DEFAULT NULL,
  `valorcredito` decimal(10,2) DEFAULT NULL,
  `qtdeantecipado` int(10) unsigned DEFAULT NULL,
  `valorantecipado` decimal(18,2) DEFAULT NULL,
  `qtdeajustecredito` int(10) unsigned DEFAULT NULL,
  `valorajustecredito` decimal(10,2) DEFAULT NULL,
  `qtdeajustedebito` int(10) unsigned DEFAULT NULL,
  `valorajustedebito` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_rede_eef_trailer_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_rede_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_rede_eev_adjust`
--

DROP TABLE IF EXISTS `conn_item_rede_eev_adjust`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_rede_eev_adjust` (
  `item_id` int(10) unsigned NOT NULL,
  `tiporegistro` int(10) unsigned DEFAULT NULL,
  `numeropv` int(10) unsigned DEFAULT NULL,
  `numerorv` int(10) unsigned DEFAULT NULL,
  `dataajuste` date DEFAULT NULL,
  `valorajuste` decimal(10,2) DEFAULT NULL,
  `datacredito` date DEFAULT NULL,
  `valorcredito` decimal(10,2) DEFAULT NULL,
  `creditodebito` varchar(1) DEFAULT NULL,
  `banco` int(10) unsigned DEFAULT NULL,
  `agencia` int(10) unsigned DEFAULT NULL,
  `contacorrente` int(10) unsigned DEFAULT NULL,
  `motivoajuste` int(10) unsigned DEFAULT NULL,
  `descricao` varchar(28) DEFAULT NULL,
  `bandeira` varchar(1) DEFAULT NULL,
  `numerocartao` varchar(20) DEFAULT NULL,
  `datatransacao` date DEFAULT NULL,
  `numerorvoriginal` int(10) unsigned DEFAULT NULL,
  `numeroreferenciacarta` bigint(20) unsigned DEFAULT NULL,
  `datacarta` date DEFAULT NULL,
  `mesreferencia` int(10) unsigned DEFAULT NULL,
  `numeropvoriginal` int(10) unsigned DEFAULT NULL,
  `datarvoriginal` date DEFAULT NULL,
  `valortransacao` decimal(10,2) DEFAULT NULL,
  `valorbrutorvoriginal` decimal(10,2) DEFAULT NULL,
  `valorcancelamentosolicitado` decimal(10,2) DEFAULT NULL,
  `numeronsu` int(10) unsigned DEFAULT NULL,
  `numeroautorizacao` int(10) unsigned DEFAULT NULL,
  `tipodebito` varchar(10) DEFAULT NULL,
  `numeroordemdebito` bigint(20) unsigned DEFAULT NULL,
  `valorpendente` decimal(10,2) DEFAULT NULL,
  `bandeiraajustado` varchar(1) DEFAULT NULL,
  `operdebitocredito` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_rede_eev_adjust_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_rede_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_rede_eev_cv`
--

DROP TABLE IF EXISTS `conn_item_rede_eev_cv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_rede_eev_cv` (
  `item_id` int(10) unsigned NOT NULL,
  `tiporegistro` int(10) unsigned DEFAULT NULL,
  `numeropv` int(10) unsigned DEFAULT NULL,
  `numerorv` int(10) unsigned DEFAULT NULL,
  `datacv` date DEFAULT NULL,
  `zeros` int(10) unsigned DEFAULT NULL,
  `valorcv` decimal(10,2) DEFAULT NULL,
  `valortaxa` decimal(10,2) DEFAULT NULL,
  `numerocartao` varchar(20) DEFAULT NULL,
  `statuscv` varchar(3) DEFAULT NULL,
  `numeroparcelas` int(10) unsigned DEFAULT NULL,
  `numerocv` int(10) unsigned DEFAULT NULL,
  `numeroreferencia` varchar(13) DEFAULT NULL,
  `valordesconto` decimal(10,2) DEFAULT NULL,
  `autorizacao` varchar(6) DEFAULT NULL,
  `horatransacao` time DEFAULT NULL,
  `bilhete1` varchar(16) DEFAULT NULL,
  `bilhete2` varchar(16) DEFAULT NULL,
  `bilhete3` varchar(16) DEFAULT NULL,
  `bilhete4` varchar(16) DEFAULT NULL,
  `tipocaptura` varchar(1) DEFAULT NULL,
  `valorliquido` decimal(10,2) DEFAULT NULL,
  `primeiraparcela` decimal(10,2) DEFAULT NULL,
  `outrasparcelas` decimal(10,2) DEFAULT NULL,
  `numeroterminal` varchar(8) DEFAULT NULL,
  `siglapais` varchar(3) DEFAULT NULL,
  `bandeira` varchar(1) DEFAULT NULL,
  `datacredito` date DEFAULT NULL,
  `tipotransacao` varchar(8) DEFAULT NULL,
  `valorcompra` decimal(10,2) DEFAULT NULL,
  `valorsaque` decimal(10,2) DEFAULT NULL,
  `rvparcelado` tinyint(1) DEFAULT NULL,
  `operdebitocredito` varchar(1) DEFAULT NULL,
  `cvecommerceid` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  KEY `ecommerceid` (`cvecommerceid`),
  KEY `idx_eev_cv_1` (`numerocv`,`autorizacao`),
  CONSTRAINT `conn_item_rede_eev_cv_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_rede_line` (`item_id`),
  CONSTRAINT `conn_item_rede_eev_cv_ibfk_2` FOREIGN KEY (`cvecommerceid`) REFERENCES `conn_item_rede_eev_cv_ecommerce` (`item_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_rede_eev_cv_ecommerce`
--

DROP TABLE IF EXISTS `conn_item_rede_eev_cv_ecommerce`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_rede_eev_cv_ecommerce` (
  `item_id` int(10) unsigned NOT NULL,
  `tiporegistro` int(10) unsigned DEFAULT NULL,
  `numeropv` int(10) unsigned DEFAULT NULL,
  `numerorv` int(10) unsigned DEFAULT NULL,
  `datacv` date DEFAULT NULL,
  `valorcv` decimal(10,2) DEFAULT NULL,
  `numerocartao` varchar(20) DEFAULT NULL,
  `numerocv` int(10) unsigned DEFAULT NULL,
  `autorizacao` varchar(6) DEFAULT NULL,
  `TID` varchar(20) DEFAULT NULL,
  `pedido` varchar(30) DEFAULT NULL,
  `rvparcelado` tinyint(1) DEFAULT NULL,
  `operdebitocredito` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_rede_eev_cv_ecommerce_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_rede_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_rede_eev_gravamedebito`
--

DROP TABLE IF EXISTS `conn_item_rede_eev_gravamedebito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_rede_eev_gravamedebito` (
  `item_id` int(10) unsigned NOT NULL,
  `tiporegistro` int(10) unsigned DEFAULT NULL,
  `numeroestabelecimento` decimal(20,0) unsigned DEFAULT NULL,
  `numeroresumovendas` decimal(20,0) unsigned DEFAULT NULL,
  `datavenda` date DEFAULT NULL,
  `datacredito` date DEFAULT NULL,
  `tipotransacao` varchar(3) DEFAULT NULL,
  `codigobandeira` varchar(3) DEFAULT NULL,
  `tiponegociacao` int(10) unsigned DEFAULT NULL,
  `numeroresumoliquidacao` decimal(20,0) unsigned DEFAULT NULL,
  `dataresumoliquidacao` date DEFAULT NULL,
  `valorresumonegociacao` decimal(10,2) DEFAULT NULL,
  `numerocontratonegociacao` decimal(20,0) unsigned DEFAULT NULL,
  `numerocnpjparceiro` decimal(20,0) unsigned DEFAULT NULL,
  `numerorlnegociacao` decimal(20,0) unsigned DEFAULT NULL,
  `valornegociado` decimal(10,2) DEFAULT NULL,
  `datanegociacao` date DEFAULT NULL,
  `dataliquidacao` date DEFAULT NULL,
  `banco` int(10) unsigned DEFAULT NULL,
  `agencia` int(10) unsigned DEFAULT NULL,
  `conta` int(10) unsigned DEFAULT NULL,
  `statuscredito` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_rede_eev_gravamedebito_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_rede_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_rede_eev_groupheader`
--

DROP TABLE IF EXISTS `conn_item_rede_eev_groupheader`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_rede_eev_groupheader` (
  `item_id` int(10) unsigned NOT NULL,
  `tiporegistro` int(10) unsigned DEFAULT NULL,
  `numeropvmatriz` varchar(9) DEFAULT NULL,
  `nomematriz` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_rede_eev_groupheader_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_rede_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_rede_eev_grouptrailer`
--

DROP TABLE IF EXISTS `conn_item_rede_eev_grouptrailer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_rede_eev_grouptrailer` (
  `item_id` int(10) unsigned NOT NULL,
  `tiporegistro` int(10) unsigned DEFAULT NULL,
  `pvmatriz` varchar(9) DEFAULT NULL,
  `valorbruto` decimal(10,2) DEFAULT NULL,
  `quantidaderejeitado` int(10) unsigned DEFAULT NULL,
  `valorrejeitado` decimal(10,2) DEFAULT NULL,
  `valorrotativo` decimal(10,2) DEFAULT NULL,
  `valorparcelado` decimal(10,2) DEFAULT NULL,
  `valoriata` decimal(10,2) DEFAULT NULL,
  `valordolar` decimal(10,2) DEFAULT NULL,
  `valordesconto` decimal(10,2) DEFAULT NULL,
  `valorliquido` decimal(10,2) DEFAULT NULL,
  `valortaxa` decimal(10,2) DEFAULT NULL,
  `valortaxaembarque` decimal(10,2) DEFAULT NULL,
  `quantidadeacatado` int(10) unsigned DEFAULT NULL,
  `valorbrutopredatado` decimal(10,2) DEFAULT NULL,
  `valordescontopredatado` decimal(10,2) DEFAULT NULL,
  `valorliquidopredatado` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_rede_eev_grouptrailer_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_rede_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_rede_eev_header`
--

DROP TABLE IF EXISTS `conn_item_rede_eev_header`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_rede_eev_header` (
  `item_id` int(10) unsigned NOT NULL,
  `tiporegistro` int(10) unsigned DEFAULT NULL,
  `dataemissao` date DEFAULT NULL,
  `adquirente` varchar(8) DEFAULT NULL,
  `descricao` varchar(50) DEFAULT NULL,
  `nomematriz` varchar(30) DEFAULT NULL,
  `sequencia` int(10) unsigned DEFAULT NULL,
  `pvmatriz` int(10) unsigned DEFAULT NULL,
  `tipoprocessamento` varchar(15) DEFAULT NULL,
  `versaoarquivo` varchar(20) DEFAULT NULL,
  `periodoinicial` date DEFAULT NULL,
  `periodofinal` date DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  KEY `idx_dataemissao` (`dataemissao`),
  KEY `idx_pvmatriz` (`pvmatriz`,`dataemissao`),
  CONSTRAINT `conn_item_rede_eev_header_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_rede_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_rede_eev_installments`
--

DROP TABLE IF EXISTS `conn_item_rede_eev_installments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_rede_eev_installments` (
  `item_id` int(10) unsigned NOT NULL,
  `tiporegistro` int(10) unsigned DEFAULT NULL,
  `numeropv` int(10) unsigned DEFAULT NULL,
  `numerorv` int(10) unsigned DEFAULT NULL,
  `datarv` date DEFAULT NULL,
  `brancos` int(10) unsigned DEFAULT NULL,
  `numeroparcela` int(10) unsigned DEFAULT NULL,
  `valorbruto` decimal(10,2) DEFAULT NULL,
  `valordesconto` decimal(10,2) DEFAULT NULL,
  `valorliquido` decimal(10,2) DEFAULT NULL,
  `datacredito` date DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_rede_eev_installments_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_rede_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_rede_eev_request`
--

DROP TABLE IF EXISTS `conn_item_rede_eev_request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_rede_eev_request` (
  `item_id` int(10) unsigned NOT NULL,
  `tiporegistro` int(10) unsigned DEFAULT NULL,
  `numeropv` int(10) unsigned DEFAULT NULL,
  `numerorv` int(10) unsigned DEFAULT NULL,
  `numerocartao` varchar(20) DEFAULT NULL,
  `valortransacao` decimal(10,2) DEFAULT NULL,
  `datatransacao` date DEFAULT NULL,
  `referencia` bigint(20) unsigned DEFAULT NULL,
  `numeroprocesso` bigint(20) unsigned DEFAULT NULL,
  `numerocv` int(10) unsigned DEFAULT NULL,
  `codigoautorizacao` varchar(6) DEFAULT NULL,
  `codigorequest` varchar(4) DEFAULT NULL,
  `datalimite` date DEFAULT NULL,
  `bandeira` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_rede_eev_request_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_rede_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_rede_eev_rv`
--

DROP TABLE IF EXISTS `conn_item_rede_eev_rv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_rede_eev_rv` (
  `item_id` int(10) unsigned NOT NULL,
  `tiporegistro` int(10) unsigned DEFAULT NULL,
  `numeropv` int(10) unsigned DEFAULT NULL,
  `numerorv` int(10) unsigned DEFAULT NULL,
  `banco` int(10) unsigned DEFAULT NULL,
  `agencia` int(10) unsigned DEFAULT NULL,
  `contacorrente` int(10) unsigned DEFAULT NULL,
  `datarv` date DEFAULT NULL,
  `quatidadecv` int(10) unsigned DEFAULT NULL,
  `valorbruto` decimal(10,2) DEFAULT NULL,
  `valortaxa` decimal(10,2) DEFAULT NULL,
  `valorrejeitado` decimal(10,2) DEFAULT NULL,
  `valordesconto` decimal(10,2) DEFAULT NULL,
  `valorliquido` decimal(10,2) DEFAULT NULL,
  `datacredito` date DEFAULT NULL,
  `bandeira` varchar(1) DEFAULT NULL,
  `rvparcelado` tinyint(1) DEFAULT NULL,
  `debitocredito` varchar(1) DEFAULT NULL,
  `totalparcelas` int(10) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  KEY `idx_conn_item_rede_eev_rv_01` (`datarv`,`numerorv`,`numeropv`),
  CONSTRAINT `conn_item_rede_eev_rv_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_rede_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_rede_eev_trailer`
--

DROP TABLE IF EXISTS `conn_item_rede_eev_trailer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_rede_eev_trailer` (
  `item_id` int(10) unsigned NOT NULL,
  `tiporegistro` int(10) unsigned DEFAULT NULL,
  `quantidadematrizes` int(10) unsigned DEFAULT NULL,
  `quantidaderegistros` int(10) unsigned DEFAULT NULL,
  `pvgrupo` varchar(9) DEFAULT NULL,
  `valorbruto` decimal(10,2) DEFAULT NULL,
  `quantidaderejeitado` int(10) unsigned DEFAULT NULL,
  `valorrejeitado` decimal(10,2) DEFAULT NULL,
  `valorrotativo` decimal(10,2) DEFAULT NULL,
  `valorparcelado` decimal(10,2) DEFAULT NULL,
  `valoriata` decimal(10,2) DEFAULT NULL,
  `valordolar` decimal(10,2) DEFAULT NULL,
  `valordesconto` decimal(10,2) DEFAULT NULL,
  `valorliquido` decimal(10,2) DEFAULT NULL,
  `valortaxa` decimal(10,2) DEFAULT NULL,
  `valortaxaembarque` decimal(10,2) DEFAULT NULL,
  `quantidadeacatado` int(10) unsigned DEFAULT NULL,
  `valorbrutopredatado` decimal(10,2) DEFAULT NULL,
  `valordescontopredatado` decimal(10,2) DEFAULT NULL,
  `valorliquidopredatado` decimal(10,2) DEFAULT NULL,
  `quantidadeRV` int(10) unsigned DEFAULT NULL,
  `quantidadeCV` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_rede_eev_trailer_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_rede_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_rede_line`
--

DROP TABLE IF EXISTS `conn_item_rede_line`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_rede_line` (
  `item_id` int(10) unsigned NOT NULL,
  `registertype` int(10) unsigned DEFAULT NULL,
  `filetype` int(10) unsigned DEFAULT NULL,
  `fileline` varchar(350) DEFAULT NULL,
  `masterid` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  KEY `masterid` (`masterid`),
  CONSTRAINT `conn_item_rede_line_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `vooo_prod_backend`.`connection_item` (`item_id`),
  CONSTRAINT `conn_item_rede_line_ibfk_2` FOREIGN KEY (`masterid`) REFERENCES `conn_item_rede_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_redecrawler_agenda`
--

DROP TABLE IF EXISTS `conn_item_redecrawler_agenda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_redecrawler_agenda` (
  `item_id` int(10) unsigned NOT NULL,
  `nr_estabelecimento` varchar(32) NOT NULL,
  `data_venda` date NOT NULL,
  `data_recebimento` date NOT NULL,
  `prazo_recebimento` varchar(32) NOT NULL,
  `resumo_vendas` varchar(32) NOT NULL,
  `quantidade_vendas` int(11) NOT NULL,
  `modalidade` varchar(32) NOT NULL,
  `bandeira` varchar(32) NOT NULL,
  `valor_bruto` decimal(10,2) DEFAULT NULL,
  `valor_descontado` decimal(10,2) DEFAULT NULL,
  `correcoes` decimal(10,2) DEFAULT NULL,
  `valor_liquido` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_redecrawler_agenda_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_redecrawler_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_redecrawler_anticipation`
--

DROP TABLE IF EXISTS `conn_item_redecrawler_anticipation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_redecrawler_anticipation` (
  `item_id` int(10) unsigned NOT NULL,
  `nr_estabelecimento` varchar(64) NOT NULL,
  `datavenda` date NOT NULL,
  `previsao_recebimento` date NOT NULL,
  `data_antecipacao` date NOT NULL,
  `resumo_vendas` varchar(32) NOT NULL,
  `modalidade` varchar(32) DEFAULT NULL,
  `bandeira` varchar(32) DEFAULT NULL,
  `tipo_antecipacao` varchar(32) DEFAULT NULL,
  `qtde_vendas` int(11) DEFAULT NULL,
  `valor_disponivel_antecipar` decimal(10,2) DEFAULT NULL,
  `valor_antecipado` decimal(10,2) DEFAULT NULL,
  `banco_agencia_conta` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_redecrawler_anticipation_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_redecrawler_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_redecrawler_header`
--

DROP TABLE IF EXISTS `conn_item_redecrawler_header`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_redecrawler_header` (
  `item_id` int(10) unsigned NOT NULL,
  `client_id` int(11) NOT NULL,
  `registers_date` date NOT NULL,
  `created_date` date NOT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_redecrawler_header_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_redecrawler_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_redecrawler_line`
--

DROP TABLE IF EXISTS `conn_item_redecrawler_line`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_redecrawler_line` (
  `item_id` int(10) unsigned NOT NULL,
  `filetype` varchar(1) DEFAULT NULL,
  `registertype` varchar(36) NOT NULL,
  `masterid` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  KEY `masterid` (`masterid`),
  CONSTRAINT `conn_item_redecrawler_line_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `vooo_prod_backend`.`connection_item` (`item_id`),
  CONSTRAINT `conn_item_redecrawler_line_ibfk_2` FOREIGN KEY (`masterid`) REFERENCES `conn_item_redecrawler_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_redecrawler_reversal`
--

DROP TABLE IF EXISTS `conn_item_redecrawler_reversal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_redecrawler_reversal` (
  `item_id` int(10) unsigned NOT NULL,
  `nr_estabelecimento` varchar(32) NOT NULL,
  `resumo_debitado` varchar(64) NOT NULL,
  `data_pagamento` date NOT NULL,
  `valor_devido` decimal(10,2) DEFAULT NULL,
  `valor_compensado` decimal(10,2) DEFAULT NULL,
  `data_inclusao` date NOT NULL,
  `numero_pv_origem` varchar(64) NOT NULL,
  `motivo_debito` varchar(64) NOT NULL,
  `referencia` varchar(64) NOT NULL,
  `resumo_origem` varchar(64) NOT NULL,
  `data_venda` date NOT NULL,
  `cartao` varchar(64) NOT NULL,
  `nr_cv` varchar(64) NOT NULL,
  `valor_contestado` decimal(10,2) DEFAULT NULL,
  `parcela` int(11) NOT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_redecrawler_reversal_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_redecrawler_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_redecrawler_sales`
--

DROP TABLE IF EXISTS `conn_item_redecrawler_sales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_redecrawler_sales` (
  `item_id` int(10) unsigned NOT NULL,
  `tid` varchar(64) NOT NULL,
  `nsu` varchar(64) NOT NULL,
  `carteira_digital` varchar(64) NOT NULL,
  `cartao_virtual` varchar(64) NOT NULL,
  `pais_origem` varchar(64) NOT NULL,
  `data_venda` date NOT NULL,
  `hora` time NOT NULL,
  `valor_bruto` decimal(10,2) DEFAULT NULL,
  `qtde_parcelas` int(11) DEFAULT NULL,
  `nr_estabelecimento` varchar(32) DEFAULT NULL,
  `tipo_captura` varchar(32) DEFAULT NULL,
  `venda_cancelada` varchar(8) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_redecrawler_sales_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_redecrawler_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_redecrawler_sales_header`
--

DROP TABLE IF EXISTS `conn_item_redecrawler_sales_header`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_redecrawler_sales_header` (
  `item_id` int(10) unsigned NOT NULL,
  `datavenda` date NOT NULL,
  `dataprocessamento` date NOT NULL,
  `resumovendas` int(11) NOT NULL,
  `bandeira` varchar(32) DEFAULT NULL,
  `qtdevendas` int(11) NOT NULL,
  `valorbruto` decimal(10,2) DEFAULT NULL,
  `valordescontado` decimal(10,2) DEFAULT NULL,
  `valorliquido` decimal(10,2) DEFAULT NULL,
  `taxaembarque` decimal(10,2) DEFAULT NULL,
  `operacao` varchar(32) NOT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_redecrawler_sales_header_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_redecrawler_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_redecrawler_settlement`
--

DROP TABLE IF EXISTS `conn_item_redecrawler_settlement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_redecrawler_settlement` (
  `item_id` int(10) unsigned NOT NULL,
  `nr_estabelecimento` varchar(32) NOT NULL,
  `data_venda` date NOT NULL,
  `data_recebimento` date NOT NULL,
  `prazo_recebimento` varchar(32) NOT NULL,
  `resumo_vendas` varchar(32) NOT NULL,
  `quantidade_vendas` int(11) NOT NULL,
  `bandeira` varchar(32) NOT NULL,
  `valor_bruto` decimal(10,2) DEFAULT NULL,
  `valor_liquido` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_redecrawler_settlement_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_redecrawler_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_safrapay_aj`
--

DROP TABLE IF EXISTS `conn_item_safrapay_aj`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_safrapay_aj` (
  `item_id` int(10) unsigned NOT NULL,
  `codigo_registro` varchar(2) NOT NULL,
  `identificacao_loja` varchar(15) DEFAULT NULL,
  `nsu_host_transacao_original` decimal(12,0) DEFAULT NULL,
  `data_transacao_original` date DEFAULT NULL,
  `numero_parcela` int(2) DEFAULT NULL,
  `nsu_host_transacao` decimal(12,0) DEFAULT NULL,
  `data_transacao_aj` date DEFAULT NULL,
  `hora_transacao_aj` time DEFAULT NULL,
  `tipo_lancamento` decimal(1,0) DEFAULT NULL,
  `data_lancamento` date DEFAULT NULL,
  `meio_captura_ajuste` decimal(1,0) DEFAULT NULL,
  `tipo_ajuste` decimal(1,0) DEFAULT NULL,
  `codigo_ajuste` varchar(4) DEFAULT NULL,
  `descricao_motivo_ajuste` varchar(150) DEFAULT NULL,
  `valor_bruto` decimal(11,2) DEFAULT NULL,
  `valor_desconto_comissao` decimal(11,2) DEFAULT NULL,
  `valor_liquido` decimal(11,2) DEFAULT NULL,
  `banco` decimal(3,0) DEFAULT NULL,
  `agencia` decimal(6,0) DEFAULT NULL,
  `conta` varchar(11) DEFAULT NULL,
  `numero_cartao_transacao_original` varchar(19) DEFAULT NULL,
  `codigo_bandeira` varchar(4) DEFAULT NULL,
  `codigo_produto` varchar(3) DEFAULT NULL,
  `numero_operacao_pagamento` decimal(9,0) DEFAULT NULL,
  `system_key_cmm_transacao_original` decimal(18,0) DEFAULT NULL,
  `nseq` decimal(8,0) DEFAULT NULL,
  `valor_desconto_4` decimal(15,2) DEFAULT NULL,
  `valor_liquido_4` decimal(15,2) DEFAULT NULL,
  `numero_total_parcelas` decimal(2,0) DEFAULT NULL,
  `modalidade_venda` varchar(4) DEFAULT NULL,
  `data_processamento` date DEFAULT NULL,
  `ec_submissor` decimal(9,0) DEFAULT NULL,
  `terminal` varchar(8) DEFAULT NULL,
  `data_vencimento_original` date DEFAULT NULL,
  `taxa_antecipacao` decimal(10,2) DEFAULT NULL,
  `dias_antecipados` decimal(3,0) DEFAULT NULL,
  `ec_pagamento` decimal(9,0) DEFAULT NULL,
  `numero_ro` decimal(50,0) DEFAULT NULL,
  `tipo_conta` varchar(2) DEFAULT NULL,
  `conta_pagamento` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  KEY `idx_loja` (`identificacao_loja`),
  CONSTRAINT `conn_item_safrapay_aj_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_safrapay_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_safrapay_cc`
--

DROP TABLE IF EXISTS `conn_item_safrapay_cc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_safrapay_cc` (
  `item_id` int(10) unsigned NOT NULL,
  `codigo_registro` varchar(2) NOT NULL,
  `identificacao_loja` varchar(15) DEFAULT NULL,
  `nsu_host_transacao_original` decimal(12,0) DEFAULT NULL,
  `data_transacao_original` date DEFAULT NULL,
  `numero_parcela` decimal(2,0) DEFAULT NULL,
  `nsu_host_transacao` decimal(12,0) DEFAULT NULL,
  `data_transacao` date DEFAULT NULL,
  `hora_transacao` time DEFAULT NULL,
  `meio_captura` decimal(1,0) DEFAULT NULL,
  `system_key_cmm_transacao_original` decimal(18,0) DEFAULT NULL,
  `nseq` decimal(8,0) DEFAULT NULL,
  `valor_cancelado` decimal(11,2) DEFAULT NULL,
  `data_pagamento_original` date DEFAULT NULL,
  `valor_bruto_venda` decimal(11,2) DEFAULT NULL,
  `valor_bruto_parcela` decimal(11,2) DEFAULT NULL,
  `valor_desconto_4` decimal(15,4) DEFAULT NULL,
  `valor_liquido_4` decimal(15,4) DEFAULT NULL,
  `numero_total_parcelas` decimal(2,0) DEFAULT NULL,
  `codigo_bandeira` varchar(4) DEFAULT NULL,
  `modalidade_venda` varchar(4) DEFAULT NULL,
  `data_processamento` date DEFAULT NULL,
  `ec_emissor` varchar(9) DEFAULT NULL,
  `terminal` varchar(8) DEFAULT NULL,
  `ec_pagamento` decimal(9,0) DEFAULT NULL,
  `numero_ro` decimal(50,0) DEFAULT NULL,
  `motivo_desagendamento` decimal(2,0) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_safrapay_cc_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_safrapay_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_safrapay_cv`
--

DROP TABLE IF EXISTS `conn_item_safrapay_cv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_safrapay_cv` (
  `item_id` int(10) unsigned NOT NULL,
  `codigo_registro` varchar(2) NOT NULL,
  `identificacao_loja` varchar(15) DEFAULT NULL,
  `nsu_host_transacao` decimal(12,0) DEFAULT NULL,
  `data_transacao` date DEFAULT NULL,
  `hora_transacao` time DEFAULT NULL,
  `tipo_lancamento` decimal(1,0) DEFAULT NULL,
  `data_lancamento` date DEFAULT NULL,
  `tipo_produto` varchar(1) DEFAULT NULL,
  `meio_captura` varchar(1) DEFAULT NULL,
  `valor_bruto_venda` decimal(11,2) DEFAULT NULL,
  `valor_desconto` decimal(11,2) DEFAULT NULL,
  `valor_liquido_venda` decimal(11,2) DEFAULT NULL,
  `numero_cartao` varchar(19) DEFAULT NULL,
  `numero_parcela` decimal(2,0) DEFAULT NULL,
  `numero_total_parcelas` decimal(2,0) DEFAULT NULL,
  `valor_bruto_parcela` decimal(11,2) DEFAULT NULL,
  `valor_desconto_parcela` decimal(11,2) DEFAULT NULL,
  `valor_liquido_parcela` decimal(11,2) DEFAULT NULL,
  `banco` decimal(3,0) DEFAULT NULL,
  `agencia` decimal(6,0) DEFAULT NULL,
  `conta` varchar(11) DEFAULT NULL,
  `codigo_autorizacao` varchar(6) DEFAULT NULL,
  `codigo_bandeira` varchar(4) DEFAULT NULL,
  `codigo_produto` varchar(3) DEFAULT NULL,
  `modalidade_venda` varchar(4) DEFAULT NULL,
  `numero_operacao_pagamento` decimal(9,0) DEFAULT NULL,
  `system_key_cmm` decimal(18,0) DEFAULT NULL,
  `nseq` decimal(8,0) DEFAULT NULL,
  `id_transacao` varchar(20) DEFAULT NULL,
  `valor_desconto_4` decimal(15,4) DEFAULT NULL,
  `valor_liquido_venda_4` decimal(15,4) DEFAULT NULL,
  `indicador_local_emissao_cartao` decimal(1,0) DEFAULT NULL,
  `taxa_administracao` decimal(10,2) DEFAULT NULL,
  `data_processamento` date DEFAULT NULL,
  `ec_submissor` decimal(9,0) DEFAULT NULL,
  `terminal` varchar(8) DEFAULT NULL,
  `data_vencimento_original` date DEFAULT NULL,
  `taxa_antecipacao` decimal(10,2) DEFAULT NULL,
  `dias_antecipados` decimal(3,0) DEFAULT NULL,
  `ec_pagamento` varchar(9) DEFAULT NULL,
  `modo_entrada_captura` varchar(4) DEFAULT NULL,
  `tipo_equipamento` decimal(1,0) DEFAULT NULL,
  `taxa_embarque` varchar(11) DEFAULT NULL,
  `numero_ro` decimal(50,0) DEFAULT NULL,
  `valor_entrada` varchar(11) DEFAULT NULL,
  `tipo_conta` varchar(2) DEFAULT NULL,
  `conta_pagamento` varchar(20) DEFAULT NULL,
  `valor_bruto_unificado_4` decimal(15,4) DEFAULT NULL,
  `valor_desconto_total_4` decimal(15,4) DEFAULT NULL,
  `identificacao_safra_qrcode` varchar(25) DEFAULT NULL,
  `aj_taxa_efetiva` decimal(9,8) DEFAULT NULL,
  `aj_taxa_mensal` decimal(9,8) DEFAULT NULL,
  `aj_valor_antecipado` decimal(10,2) DEFAULT NULL,
  `aj_prazo_medio` decimal(18,8) DEFAULT NULL,
  `aj_data_lancamento_original` date DEFAULT NULL,
  `aj_reference_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  KEY `aj_reference_id` (`aj_reference_id`),
  KEY `idx_loja` (`identificacao_loja`),
  KEY `idx_nsu` (`nsu_host_transacao`),
  CONSTRAINT `conn_item_safrapay_cv_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_safrapay_line` (`item_id`),
  CONSTRAINT `conn_item_safrapay_cv_ibfk_2` FOREIGN KEY (`aj_reference_id`) REFERENCES `conn_item_safrapay_aj` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_safrapay_detalhe_recebivel`
--

DROP TABLE IF EXISTS `conn_item_safrapay_detalhe_recebivel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_safrapay_detalhe_recebivel` (
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
  `seq_operacao` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_safrapay_detalhe_recebivel_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_safrapay_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_safrapay_header_arquivo`
--

DROP TABLE IF EXISTS `conn_item_safrapay_header_arquivo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_safrapay_header_arquivo` (
  `item_id` int(10) unsigned NOT NULL,
  `codigo_registro` varchar(2) NOT NULL,
  `versao_layout` varchar(6) DEFAULT NULL,
  `data_geracao_arquivo` date DEFAULT NULL,
  `hora_geracao_arquivo` time DEFAULT NULL,
  `id_movimento` decimal(6,0) DEFAULT NULL,
  `nome_administradora` varchar(30) DEFAULT NULL,
  `identificacao_remetente` decimal(4,0) DEFAULT NULL,
  `identificacao_destinatario` decimal(6,0) DEFAULT NULL,
  `tipo_processamento` varchar(1) DEFAULT NULL,
  `nseq_registro` decimal(8,0) DEFAULT NULL,
  `ec_matriz` decimal(9,0) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_safrapay_header_arquivo_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_safrapay_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_safrapay_header_lote`
--

DROP TABLE IF EXISTS `conn_item_safrapay_header_lote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_safrapay_header_lote` (
  `item_id` int(10) unsigned NOT NULL,
  `codigo_registro` varchar(2) NOT NULL,
  `data_movimento` date DEFAULT NULL,
  `identificacao_moeda` varchar(2) DEFAULT NULL,
  `nseq` decimal(8,0) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_safrapay_header_lote_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_safrapay_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_safrapay_line`
--

DROP TABLE IF EXISTS `conn_item_safrapay_line`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_safrapay_line` (
  `item_id` int(10) unsigned NOT NULL,
  `layout` varchar(6) DEFAULT NULL,
  `registertype` varchar(2) NOT NULL,
  `masterid` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  KEY `masterid` (`masterid`),
  CONSTRAINT `conn_item_safrapay_line_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `vooo_prod_backend`.`connection_item` (`item_id`),
  CONSTRAINT `conn_item_safrapay_line_ibfk_2` FOREIGN KEY (`masterid`) REFERENCES `conn_item_safrapay_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_safrapay_ro`
--

DROP TABLE IF EXISTS `conn_item_safrapay_ro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_safrapay_ro` (
  `item_id` int(10) unsigned NOT NULL,
  `codigo_registro` varchar(2) NOT NULL,
  `identificacao_loja` varchar(15) DEFAULT NULL,
  `numero_ro` decimal(50,0) DEFAULT NULL,
  `ec_submissor` decimal(9,0) DEFAULT NULL,
  `data_operacao_ro` date DEFAULT NULL,
  `data_processamento` date DEFAULT NULL,
  `data_lancamento_original` date DEFAULT NULL,
  `meio_captura` decimal(2,0) DEFAULT NULL,
  `produto` decimal(2,0) DEFAULT NULL,
  `bandeira` decimal(2,0) DEFAULT NULL,
  `terminal` decimal(8,0) DEFAULT NULL,
  `parcela` decimal(2,0) DEFAULT NULL,
  `total_parcelas` decimal(2,0) DEFAULT NULL,
  `tipo_transacao` decimal(1,0) DEFAULT NULL,
  `motivo_ajuste` decimal(4,0) DEFAULT NULL,
  `tipo_lancamento` decimal(1,0) DEFAULT NULL,
  `data_lancamento` date DEFAULT NULL,
  `ec_pagamento` decimal(9,0) DEFAULT NULL,
  `operacao_pagamento` decimal(9,0) DEFAULT NULL,
  `quantidade_transacoes` decimal(8,0) DEFAULT NULL,
  `valor_total` decimal(16,2) DEFAULT NULL,
  `valor_bruto` decimal(16,2) DEFAULT NULL,
  `valor_desconto_administrativo` decimal(18,4) DEFAULT NULL,
  `valor_liquido` decimal(18,4) DEFAULT NULL,
  `valor_desconto_antecipacao` decimal(18,4) DEFAULT NULL,
  `valor_liquido_antecipado` decimal(18,4) DEFAULT NULL,
  `taxa_administrativa` decimal(10,2) DEFAULT NULL,
  `taxa_antecipacao` decimal(10,2) DEFAULT NULL,
  `dias_antecipados` decimal(3,0) DEFAULT NULL,
  `banco` decimal(3,0) DEFAULT NULL,
  `agencia` decimal(6,0) DEFAULT NULL,
  `conta` varchar(11) DEFAULT NULL,
  `moeda` varchar(2) DEFAULT NULL,
  `nseq` decimal(8,0) DEFAULT NULL,
  `tipo_conta` varchar(2) DEFAULT NULL,
  `conta_pagamento` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_safrapay_ro_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_safrapay_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_safrapay_trailer_arquivo`
--

DROP TABLE IF EXISTS `conn_item_safrapay_trailer_arquivo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_safrapay_trailer_arquivo` (
  `item_id` int(10) unsigned NOT NULL,
  `codigo_registro` varchar(2) NOT NULL,
  `total_geral_registros` decimal(8,0) DEFAULT NULL,
  `nseq_registro` decimal(8,0) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_safrapay_trailer_arquivo_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_safrapay_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_safrapay_trailer_lote`
--

DROP TABLE IF EXISTS `conn_item_safrapay_trailer_lote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_safrapay_trailer_lote` (
  `item_id` int(10) unsigned NOT NULL,
  `codigo_registro` varchar(2) NOT NULL,
  `total_registros_transacao` decimal(8,0) DEFAULT NULL,
  `total_valores_creditos` decimal(14,2) DEFAULT NULL,
  `nseq` decimal(8,0) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_safrapay_trailer_lote_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_safrapay_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_sales_csv_control`
--

DROP TABLE IF EXISTS `conn_item_sales_csv_control`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_sales_csv_control` (
  `item_id` int(10) unsigned NOT NULL,
  `start_sales_date` date DEFAULT NULL,
  `end_sales_date` date DEFAULT NULL,
  `start_payment_date` date DEFAULT NULL,
  `end_payment_date` date DEFAULT NULL,
  `store` varchar(30) DEFAULT NULL,
  `check_status` decimal(1,0) DEFAULT NULL,
  `registers` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  KEY `ix_vooo_prod_rawdata_conn_item_sales_csv_control_end_pay_2ddd` (`end_payment_date`),
  KEY `ix_vooo_prod_rawdata_conn_item_sales_csv_control_end_sales_date` (`end_sales_date`),
  KEY `ix_vooo_prod_rawdata_conn_item_sales_csv_control_start_p_6002` (`start_payment_date`),
  KEY `ix_vooo_prod_rawdata_conn_item_sales_csv_control_start_s_7555` (`start_sales_date`),
  CONSTRAINT `conn_item_sales_csv_control_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_sales_csv_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_sales_csv_duplicated`
--

DROP TABLE IF EXISTS `conn_item_sales_csv_duplicated`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_sales_csv_duplicated` (
  `item_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `original_id` int(10) unsigned DEFAULT NULL,
  `duplicated_id` int(10) unsigned DEFAULT NULL,
  `status` varchar(2) NOT NULL,
  PRIMARY KEY (`item_id`),
  KEY `original_id` (`original_id`),
  KEY `duplicated_id` (`duplicated_id`),
  CONSTRAINT `conn_item_sales_csv_duplicated_ibfk_1` FOREIGN KEY (`original_id`) REFERENCES `conn_item_sales_csv_transaction` (`item_id`),
  CONSTRAINT `conn_item_sales_csv_duplicated_ibfk_2` FOREIGN KEY (`duplicated_id`) REFERENCES `conn_item_sales_csv_transaction` (`item_id`)
) ENGINE=InnoDB AUTO_INCREMENT=44871624 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_sales_csv_line`
--

DROP TABLE IF EXISTS `conn_item_sales_csv_line`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_sales_csv_line` (
  `item_id` int(10) unsigned NOT NULL,
  `register_type` varchar(15) DEFAULT NULL,
  `masterid` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  KEY `masterid` (`masterid`),
  CONSTRAINT `conn_item_sales_csv_line_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `vooo_prod_backend`.`connection_item` (`item_id`),
  CONSTRAINT `conn_item_sales_csv_line_ibfk_2` FOREIGN KEY (`masterid`) REFERENCES `conn_item_sales_csv_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_sales_csv_trailer`
--

DROP TABLE IF EXISTS `conn_item_sales_csv_trailer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_sales_csv_trailer` (
  `item_id` int(10) unsigned NOT NULL,
  `lines` decimal(10,0) NOT NULL,
  `initial_date` date NOT NULL,
  `final_date` date NOT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_sales_csv_trailer_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_sales_csv_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_sales_csv_transaction`
--

DROP TABLE IF EXISTS `conn_item_sales_csv_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_sales_csv_transaction` (
  `item_id` int(10) unsigned NOT NULL,
  `document` decimal(20,0) DEFAULT NULL,
  `sales_code` varchar(64) DEFAULT NULL,
  `sales_value` decimal(10,2) DEFAULT NULL,
  `sales_date` date DEFAULT NULL,
  `sales_time` time DEFAULT NULL,
  `store` varchar(30) DEFAULT NULL,
  `cashier_code` varchar(30) DEFAULT NULL,
  `salesman_code` varchar(30) DEFAULT NULL,
  `client_code` varchar(30) DEFAULT NULL,
  `external_code` varchar(30) DEFAULT NULL,
  `payment_code` varchar(64) DEFAULT NULL,
  `payment_method` varchar(30) DEFAULT NULL,
  `payment_value` decimal(10,2) DEFAULT NULL,
  `payment_date` date DEFAULT NULL,
  `payment_time` time DEFAULT NULL,
  `installments` decimal(2,0) DEFAULT NULL,
  `provider` varchar(30) DEFAULT NULL,
  `card_suffix` decimal(6,0) DEFAULT NULL,
  `authorization_code` varchar(20) DEFAULT NULL,
  `nsu_code` varchar(20) DEFAULT NULL,
  `card_flag` varchar(30) DEFAULT NULL,
  `nsu_tef` varchar(20) DEFAULT NULL,
  `status` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  KEY `idx_sales_csv` (`sales_code`,`payment_code`,`nsu_code`),
  KEY `idx_sales_csv_2` (`sales_date`,`sales_value`,`sales_time`),
  CONSTRAINT `conn_item_sales_csv_transaction_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_sales_csv_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_salessystem_cancelations`
--

DROP TABLE IF EXISTS `conn_item_salessystem_cancelations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_salessystem_cancelations` (
  `item_id` int(10) unsigned NOT NULL,
  `sales_code` varchar(50) NOT NULL,
  `sales_value` decimal(10,2) NOT NULL,
  `sales_date` date NOT NULL,
  `sales_time` time NOT NULL,
  `cancel_date` datetime DEFAULT NULL,
  `settlement_date` date DEFAULT NULL,
  `payment_code` varchar(50) NOT NULL,
  `payment_date` date NOT NULL,
  `payment_time` time NOT NULL,
  `payment_value` decimal(10,2) NOT NULL,
  `payment_installments` int(10) unsigned NOT NULL,
  `installment` int(10) unsigned DEFAULT NULL,
  `payment_method_id` int(10) unsigned NOT NULL,
  `provider_id` int(10) unsigned NOT NULL,
  `card_flag_id` int(10) unsigned DEFAULT NULL,
  `credit_card_mask` varchar(20) DEFAULT NULL,
  `authorization_code` varchar(64) DEFAULT NULL,
  `nsu_code` varchar(64) DEFAULT NULL,
  `tid_code` varchar(64) DEFAULT NULL,
  `client_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  KEY `idx_provider_id` (`provider_id`),
  KEY `idx_client_id` (`client_id`),
  KEY `idx_sales_date` (`sales_date`),
  CONSTRAINT `conn_item_salessystem_cancelations_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `vooo_prod_backend`.`connection_item` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_santander_esfera_ajuste`
--

DROP TABLE IF EXISTS `conn_item_santander_esfera_ajuste`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_santander_esfera_ajuste` (
  `item_id` int(10) unsigned NOT NULL,
  `tiporegistro` varchar(2) DEFAULT NULL,
  `codigo_ec` decimal(15,0) DEFAULT NULL,
  `nsu_transacao_original` varchar(12) DEFAULT NULL,
  `data_transacao_original` date DEFAULT NULL,
  `num_da_parcela` decimal(2,0) DEFAULT NULL,
  `nsu_transacao` decimal(12,0) DEFAULT NULL,
  `data_transacao_ajuste` date DEFAULT NULL,
  `hora_transacao_ajuste` time DEFAULT NULL,
  `tipo_lancamento` decimal(1,0) DEFAULT NULL,
  `data_lancamento` date DEFAULT NULL,
  `forma_captura` decimal(1,0) DEFAULT NULL,
  `tipo_ajuste` decimal(1,0) DEFAULT NULL,
  `codigo_ajuste` decimal(3,0) DEFAULT NULL,
  `descricao_ajuste` varchar(30) DEFAULT NULL,
  `valor_bruto` decimal(11,2) DEFAULT NULL,
  `valor_desconto` decimal(11,2) DEFAULT NULL,
  `valor_liquido` decimal(11,2) DEFAULT NULL,
  `banco` decimal(3,0) DEFAULT NULL,
  `agencia` decimal(6,0) DEFAULT NULL,
  `conta_corrente` varchar(11) DEFAULT NULL,
  `num_cartao` varchar(19) DEFAULT NULL,
  `codigo_bandeira` varchar(3) DEFAULT NULL,
  `codigo_produto` varchar(3) DEFAULT NULL,
  `valor_bruto_parcela` decimal(11,2) DEFAULT NULL,
  `valor_liquido_parcela` decimal(11,2) DEFAULT NULL,
  `codigo_pedido` varchar(36) DEFAULT NULL,
  `codigo_autorizacao` varchar(12) DEFAULT NULL,
  `num_parcelas` decimal(2,0) DEFAULT NULL,
  `sequencia_registro` decimal(6,0) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_santander_esfera_ajuste_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_santander_esfera_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_santander_esfera_cancel`
--

DROP TABLE IF EXISTS `conn_item_santander_esfera_cancel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_santander_esfera_cancel` (
  `item_id` int(10) unsigned NOT NULL,
  `tiporegistro` varchar(2) DEFAULT NULL,
  `codigo_ec` decimal(15,0) DEFAULT NULL,
  `nsu_transacao_original` decimal(12,0) DEFAULT NULL,
  `data_transacao_original` date DEFAULT NULL,
  `num_da_parcela` decimal(2,0) DEFAULT NULL,
  `nsu_transacao` decimal(12,0) DEFAULT NULL,
  `data_transacao_cancelamento` date DEFAULT NULL,
  `hora_transacao_cancelamento` time DEFAULT NULL,
  `forma_captura` decimal(1,0) DEFAULT NULL,
  `codigo_pedido` varchar(36) DEFAULT NULL,
  `codigo_autorizacao` varchar(12) DEFAULT NULL,
  `valor_bruto` decimal(11,0) DEFAULT NULL,
  `valor_liquido` decimal(11,0) DEFAULT NULL,
  `valor_bruto_parcela` decimal(11,0) DEFAULT NULL,
  `valor_liquido_parcela` decimal(11,0) DEFAULT NULL,
  `codigo_ajuste` decimal(3,0) DEFAULT NULL,
  `descricao_ajuste` varchar(30) DEFAULT NULL,
  `num_parcelas` decimal(2,0) DEFAULT NULL,
  `sequencia_registro` decimal(6,0) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_santander_esfera_cancel_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_santander_esfera_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_santander_esfera_cv`
--

DROP TABLE IF EXISTS `conn_item_santander_esfera_cv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_santander_esfera_cv` (
  `item_id` int(10) unsigned NOT NULL,
  `tipo_registro` varchar(2) DEFAULT NULL,
  `codigo_ec` decimal(15,0) DEFAULT NULL,
  `nsu_adquirente` varchar(36) DEFAULT NULL,
  `data_transacao` date DEFAULT NULL,
  `hora_transacao` time DEFAULT NULL,
  `tipo_lancamento` decimal(1,0) DEFAULT NULL,
  `data_pagamento` date DEFAULT NULL,
  `tipo_produto` varchar(1) DEFAULT NULL,
  `forma_captura` decimal(1,0) DEFAULT NULL,
  `valor_bruto` decimal(11,2) DEFAULT NULL,
  `valor_desconto` decimal(11,2) DEFAULT NULL,
  `valor_liquido` decimal(11,2) DEFAULT NULL,
  `num_cartao` varchar(19) DEFAULT NULL,
  `num_da_parcela` decimal(2,0) DEFAULT NULL,
  `num_parcelas` decimal(2,0) DEFAULT NULL,
  `nsu_parcela` varchar(36) DEFAULT NULL,
  `valor_bruto_parcela` decimal(11,2) DEFAULT NULL,
  `valor_desconto_parcela` decimal(11,2) DEFAULT NULL,
  `valor_liquido_parcela` decimal(11,2) DEFAULT NULL,
  `banco` decimal(3,0) DEFAULT NULL,
  `agencia` decimal(6,0) DEFAULT NULL,
  `conta_corrente` varchar(11) DEFAULT NULL,
  `codigo_autorizacao` varchar(36) DEFAULT NULL,
  `codigo_bandeira` varchar(3) DEFAULT NULL,
  `codigo_produto` varchar(3) DEFAULT NULL,
  `valor_taxa_1` decimal(11,2) DEFAULT NULL,
  `valor_taxa_2` decimal(11,2) DEFAULT NULL,
  `valor_taxa_1_parcela` decimal(11,2) DEFAULT NULL,
  `valor_taxa_2_parcela` decimal(11,2) DEFAULT NULL,
  `valor_taxa_antecipacao` decimal(11,2) DEFAULT NULL,
  `valor_liquido_antecipado` decimal(11,2) DEFAULT NULL,
  `codigo_pedido` varchar(36) DEFAULT NULL,
  `numero_terminal` varchar(8) DEFAULT NULL,
  `codigo_shellbox` varchar(43) DEFAULT NULL,
  `sequencia_registro` decimal(6,0) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_santander_esfera_cv_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_santander_esfera_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_santander_esfera_header`
--

DROP TABLE IF EXISTS `conn_item_santander_esfera_header`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_santander_esfera_header` (
  `item_id` int(10) unsigned NOT NULL,
  `tipo_registro` varchar(2) DEFAULT NULL,
  `versao_layout` varchar(6) DEFAULT NULL,
  `data_criacao` date DEFAULT NULL,
  `hora_criacao` time DEFAULT NULL,
  `sequencia` decimal(6,0) DEFAULT NULL,
  `nome_adquirente` varchar(30) DEFAULT NULL,
  `codigo_ec` decimal(13,0) DEFAULT NULL,
  `tipo_processamento` varchar(1) DEFAULT NULL,
  `sequencia_registro` decimal(6,0) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_santander_esfera_header_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_santander_esfera_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_santander_esfera_header_mov`
--

DROP TABLE IF EXISTS `conn_item_santander_esfera_header_mov`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_santander_esfera_header_mov` (
  `item_id` int(10) unsigned NOT NULL,
  `tipo_registro` varchar(2) DEFAULT NULL,
  `data_movimento` date DEFAULT NULL,
  `moeda` varchar(2) DEFAULT NULL,
  `sequencia_registro` decimal(6,0) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_santander_esfera_header_mov_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_santander_esfera_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_santander_esfera_line`
--

DROP TABLE IF EXISTS `conn_item_santander_esfera_line`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_santander_esfera_line` (
  `item_id` int(10) unsigned NOT NULL,
  `register_type` varchar(2) NOT NULL,
  `masterid` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  KEY `masterid` (`masterid`),
  CONSTRAINT `conn_item_santander_esfera_line_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `vooo_prod_backend`.`connection_item` (`item_id`),
  CONSTRAINT `conn_item_santander_esfera_line_ibfk_2` FOREIGN KEY (`masterid`) REFERENCES `conn_item_santander_esfera_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_santander_esfera_trailer`
--

DROP TABLE IF EXISTS `conn_item_santander_esfera_trailer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_santander_esfera_trailer` (
  `item_id` int(10) unsigned NOT NULL,
  `tipo_registro` varchar(2) DEFAULT NULL,
  `qtd_registros` decimal(6,0) DEFAULT NULL,
  `sequencia_registro` decimal(6,0) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_santander_esfera_trailer_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_santander_esfera_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_santander_esfera_trailermov`
--

DROP TABLE IF EXISTS `conn_item_santander_esfera_trailermov`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_santander_esfera_trailermov` (
  `item_id` int(10) unsigned NOT NULL,
  `tipo_registro` varchar(2) DEFAULT NULL,
  `total_registros` decimal(6,0) DEFAULT NULL,
  `total_creditos` decimal(12,2) DEFAULT NULL,
  `sequencia_registro` decimal(6,0) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_santander_esfera_trailermov_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_santander_esfera_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_santander_header_arquivo`
--

DROP TABLE IF EXISTS `conn_item_santander_header_arquivo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_santander_header_arquivo` (
  `item_id` int(10) unsigned NOT NULL,
  `bancoid` int(10) unsigned DEFAULT NULL,
  `lote` int(10) unsigned DEFAULT NULL,
  `regtypeid` int(10) unsigned DEFAULT NULL,
  `tipoempresa` int(10) unsigned DEFAULT NULL,
  `inscricaoempresa` decimal(14,0) DEFAULT NULL,
  `codigoconvenio` decimal(20,0) DEFAULT NULL,
  `codigoagencia` int(10) unsigned DEFAULT NULL,
  `digitoagencia` varchar(1) DEFAULT NULL,
  `contacorrente` int(10) unsigned DEFAULT NULL,
  `digitocontacorrente` int(10) unsigned DEFAULT NULL,
  `digitoverificador` varchar(1) DEFAULT NULL,
  `nomeempresa` varchar(30) DEFAULT NULL,
  `nomebanco` varchar(30) DEFAULT NULL,
  `codigoretorno` int(10) unsigned DEFAULT NULL,
  `datageracaoarquivo` date DEFAULT NULL,
  `horageracaoarquivo` time DEFAULT NULL,
  `sequenciansa` int(10) unsigned DEFAULT NULL,
  `versaolayoutarquivo` int(10) unsigned DEFAULT NULL,
  `densidadegravacaoarquivo` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_santander_header_arquivo_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_santander_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_santander_header_lote`
--

DROP TABLE IF EXISTS `conn_item_santander_header_lote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_santander_header_lote` (
  `item_id` int(10) unsigned NOT NULL,
  `bancoid` int(10) unsigned DEFAULT NULL,
  `lote` int(10) unsigned DEFAULT NULL,
  `regtypeid` int(10) unsigned DEFAULT NULL,
  `tipooperacao` varchar(1) DEFAULT NULL,
  `tiposervico` int(10) unsigned DEFAULT NULL,
  `formalancamento` int(10) unsigned DEFAULT NULL,
  `versaolayoutlote` int(10) unsigned DEFAULT NULL,
  `tipoempresa` int(10) unsigned DEFAULT NULL,
  `inscricaoempresa` decimal(14,0) DEFAULT NULL,
  `codigoconvenio` decimal(20,0) DEFAULT NULL,
  `codigoagencia` int(10) unsigned DEFAULT NULL,
  `digitoagencia` varchar(1) DEFAULT NULL,
  `contacorrente` int(10) unsigned DEFAULT NULL,
  `digitocontacorrente` int(10) unsigned DEFAULT NULL,
  `digitoverificador` varchar(1) DEFAULT NULL,
  `nomeempresa` varchar(30) DEFAULT NULL,
  `datasaldoinicial` date DEFAULT NULL,
  `saldoinicial` decimal(16,2) DEFAULT NULL,
  `situacaosaldoinicial` varchar(1) DEFAULT NULL,
  `posicaosaldoinicial` varchar(1) DEFAULT NULL,
  `moedareferenciaextrato` varchar(3) DEFAULT NULL,
  `numerosequeciaextrato` int(10) unsigned DEFAULT NULL,
  `saldoinicialbloqueadodia` int(10) unsigned DEFAULT NULL,
  `saldoinicialbloqueiojudicial` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_santander_header_lote_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_santander_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_santander_lancamentos`
--

DROP TABLE IF EXISTS `conn_item_santander_lancamentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_santander_lancamentos` (
  `item_id` int(10) unsigned NOT NULL,
  `bancoid` int(10) unsigned DEFAULT NULL,
  `lote` int(10) unsigned DEFAULT NULL,
  `regtypeid` int(10) unsigned DEFAULT NULL,
  `numeroregistrolote` int(10) unsigned DEFAULT NULL,
  `codigosegmentoreg` varchar(1) DEFAULT NULL,
  `tipoempresa` int(10) unsigned DEFAULT NULL,
  `inscricaoempresa` decimal(14,0) DEFAULT NULL,
  `codigoconvenio` decimal(20,0) DEFAULT NULL,
  `codigoagencia` int(10) unsigned DEFAULT NULL,
  `digitoagencia` varchar(1) DEFAULT NULL,
  `contacorrente` int(10) unsigned DEFAULT NULL,
  `digitocontacorrente` int(10) unsigned DEFAULT NULL,
  `digitoverificador` varchar(1) DEFAULT NULL,
  `nomeempresa` varchar(30) DEFAULT NULL,
  `naturalancamento` varchar(3) DEFAULT NULL,
  `tipocomplementolancamento` int(10) unsigned DEFAULT NULL,
  `complementolancamento` int(10) unsigned DEFAULT NULL,
  `isencaocpmf` varchar(1) DEFAULT NULL,
  `datacontabil` date DEFAULT NULL,
  `datalancamento` date DEFAULT NULL,
  `valorlancamento` decimal(18,2) DEFAULT NULL,
  `tipolancamento` varchar(1) DEFAULT NULL,
  `categorialancamento` int(10) unsigned DEFAULT NULL,
  `codigohistorico` int(10) unsigned DEFAULT NULL,
  `descricaohistoricolancamento` varchar(25) DEFAULT NULL,
  `numerodocumentolancamento` int(10) unsigned DEFAULT NULL,
  `complementohistorico` varchar(25) DEFAULT NULL,
  `horalancamento` time DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_santander_lancamentos_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_santander_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_santander_line`
--

DROP TABLE IF EXISTS `conn_item_santander_line`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_santander_line` (
  `item_id` int(10) unsigned NOT NULL,
  `registertype` int(10) unsigned DEFAULT NULL,
  `filetype` int(10) unsigned DEFAULT NULL,
  `fileline` varchar(350) DEFAULT NULL,
  `masterid` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  KEY `masterid` (`masterid`),
  CONSTRAINT `conn_item_santander_line_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `vooo_prod_backend`.`connection_item` (`item_id`),
  CONSTRAINT `conn_item_santander_line_ibfk_2` FOREIGN KEY (`masterid`) REFERENCES `conn_item_santander_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_santander_trailer_arquivo`
--

DROP TABLE IF EXISTS `conn_item_santander_trailer_arquivo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_santander_trailer_arquivo` (
  `item_id` int(10) unsigned NOT NULL,
  `bancoid` int(10) unsigned DEFAULT NULL,
  `lote` int(10) unsigned DEFAULT NULL,
  `regtypeid` int(10) unsigned DEFAULT NULL,
  `quantidadelotearquivo` int(10) unsigned DEFAULT NULL,
  `quantidaderegistroarquivo` int(10) unsigned DEFAULT NULL,
  `quantidadecontasconciliacao` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_santander_trailer_arquivo_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_santander_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_santander_trailer_lote`
--

DROP TABLE IF EXISTS `conn_item_santander_trailer_lote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_santander_trailer_lote` (
  `item_id` int(10) unsigned NOT NULL,
  `bancoid` int(10) unsigned DEFAULT NULL,
  `lote` int(10) unsigned DEFAULT NULL,
  `regtypeid` int(10) unsigned DEFAULT NULL,
  `tipoempresa` int(10) unsigned DEFAULT NULL,
  `inscricaoempresa` decimal(14,0) DEFAULT NULL,
  `codigoconvenio` decimal(20,0) DEFAULT NULL,
  `codigoagencia` int(10) unsigned DEFAULT NULL,
  `digitoagencia` varchar(1) DEFAULT NULL,
  `contacorrente` int(10) unsigned DEFAULT NULL,
  `digitocontacorrente` int(10) unsigned DEFAULT NULL,
  `digitoverificador` varchar(1) DEFAULT NULL,
  `saldobloqueadoacima` decimal(16,2) DEFAULT NULL,
  `limiteconta` decimal(16,2) DEFAULT NULL,
  `saldobloqueadoate` decimal(16,2) DEFAULT NULL,
  `datasaldofinal` date DEFAULT NULL,
  `valorsaldofinal` decimal(16,2) DEFAULT NULL,
  `situacaosaldofinal` varchar(1) DEFAULT NULL,
  `posicaosaldofinal` varchar(1) DEFAULT NULL,
  `quantidaderegistroslote` int(10) unsigned DEFAULT NULL,
  `somatoriovaloresdebito` int(10) unsigned DEFAULT NULL,
  `somatoriovalorescredito` int(10) unsigned DEFAULT NULL,
  `saldobloqueadodia` decimal(12,2) DEFAULT NULL,
  `saldobloqueadojudicial` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_santander_trailer_lote_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_santander_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_shellbox_ajuste`
--

DROP TABLE IF EXISTS `conn_item_shellbox_ajuste`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_shellbox_ajuste` (
  `item_id` int(10) unsigned NOT NULL,
  `tiporegistro` decimal(1,0) DEFAULT NULL,
  `codigo_ec` decimal(15,0) DEFAULT NULL,
  `num_rv_ajustado` decimal(9,0) DEFAULT NULL,
  `data_rv` date DEFAULT NULL,
  `id_ajuste` varchar(20) DEFAULT NULL,
  `brancos` varchar(1) DEFAULT NULL,
  `sinal_valor_ajuste` varchar(1) DEFAULT NULL,
  `valor_ajuste` decimal(12,2) DEFAULT NULL,
  `motivo_ajuste` varchar(2) DEFAULT NULL,
  `data_carta` date DEFAULT NULL,
  `num_cartao` varchar(19) DEFAULT NULL,
  `num_rv_original` decimal(9,0) DEFAULT NULL,
  `nsu_adquirente` decimal(12,0) DEFAULT NULL,
  `data_transacao_original` date DEFAULT NULL,
  `id_tipo_pagamento` varchar(2) DEFAULT NULL,
  `num_terminal` varchar(8) DEFAULT NULL,
  `data_pagamento_rv` date DEFAULT NULL,
  `moeda` decimal(3,0) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_shellbox_ajuste_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_shellbox_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_shellbox_antecipacao`
--

DROP TABLE IF EXISTS `conn_item_shellbox_antecipacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_shellbox_antecipacao` (
  `item_id` int(10) unsigned NOT NULL,
  `tiporegistro` decimal(1,0) DEFAULT NULL,
  `codigo_ec` decimal(15,0) DEFAULT NULL,
  `data_operacao` date DEFAULT NULL,
  `data_credito` date DEFAULT NULL,
  `num_operacao` decimal(15,0) DEFAULT NULL,
  `valor_bruto_antecipado` decimal(12,2) DEFAULT NULL,
  `valor_taxa_antecipacao` decimal(12,2) DEFAULT NULL,
  `valor_liquido_antecipado` decimal(12,2) DEFAULT NULL,
  `taxa_ao_mes_operacao` decimal(11,7) DEFAULT NULL,
  `codigo_ec_centralizador` decimal(15,0) DEFAULT NULL,
  `banco_domicilio_bancario` decimal(3,0) DEFAULT NULL,
  `ag_domicilio_bancario` decimal(6,0) DEFAULT NULL,
  `cc_domicilio_bancario` decimal(11,0) DEFAULT NULL,
  `canal_antecipacao` varchar(3) DEFAULT NULL,
  `id_tipo_pagamento` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_shellbox_antecipacao_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_shellbox_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_shellbox_cv`
--

DROP TABLE IF EXISTS `conn_item_shellbox_cv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_shellbox_cv` (
  `item_id` int(10) unsigned NOT NULL,
  `tiporegistro` decimal(1,0) DEFAULT NULL,
  `codigo_ec` decimal(15,0) DEFAULT NULL,
  `num_rv` decimal(9,0) DEFAULT NULL,
  `nsu_adquirente` decimal(12,0) DEFAULT NULL,
  `data_transacao` date DEFAULT NULL,
  `hora_transacao` time DEFAULT NULL,
  `num_cartao` varchar(19) DEFAULT NULL,
  `valor_transacao` decimal(12,2) DEFAULT NULL,
  `valor_saque` decimal(12,2) DEFAULT NULL,
  `valor_taxa_servico` decimal(12,2) DEFAULT NULL,
  `num_parcelas` decimal(2,0) DEFAULT NULL,
  `num_da_parcela` decimal(2,0) DEFAULT NULL,
  `valor_parcela` decimal(12,2) DEFAULT NULL,
  `data_pagamento` date DEFAULT NULL,
  `codigo_autorizacao` varchar(10) DEFAULT NULL,
  `forma_captura` varchar(3) DEFAULT NULL,
  `status_transacao` varchar(1) DEFAULT NULL,
  `codigo_ec_centralizador` decimal(15,0) DEFAULT NULL,
  `num_terminal` varchar(8) DEFAULT NULL,
  `moeda` decimal(3,0) DEFAULT NULL,
  `origem_emissor_cartao` varchar(1) DEFAULT NULL,
  `sinal_transacao` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_shellbox_cv_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_shellbox_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_shellbox_empresas_ajuste`
--

DROP TABLE IF EXISTS `conn_item_shellbox_empresas_ajuste`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_shellbox_empresas_ajuste` (
  `item_id` int(10) unsigned NOT NULL,
  `tiporegistro` varchar(2) DEFAULT NULL,
  `codigo_ec` decimal(15,0) DEFAULT NULL,
  `nsu_transacao_original` varchar(40) DEFAULT NULL,
  `data_transacao_original` date DEFAULT NULL,
  `num_da_parcela` decimal(2,0) DEFAULT NULL,
  `nsu_transacao` varchar(40) DEFAULT NULL,
  `data_transacao_ajuste` date DEFAULT NULL,
  `hora_transacao_ajuste` time DEFAULT NULL,
  `tipo_lancamento` decimal(1,0) DEFAULT NULL,
  `data_lancamento` date DEFAULT NULL,
  `forma_captura` decimal(1,0) DEFAULT NULL,
  `tipo_ajuste` decimal(1,0) DEFAULT NULL,
  `codigo_ajuste` decimal(3,0) DEFAULT NULL,
  `descricao_ajuste` varchar(30) DEFAULT NULL,
  `valor_bruto` decimal(11,2) DEFAULT NULL,
  `valor_desconto` decimal(11,2) DEFAULT NULL,
  `valor_liquido` decimal(11,2) DEFAULT NULL,
  `banco` decimal(3,0) DEFAULT NULL,
  `agencia` decimal(6,0) DEFAULT NULL,
  `conta_corrente` varchar(11) DEFAULT NULL,
  `num_cartao` varchar(19) DEFAULT NULL,
  `codigo_bandeira` varchar(3) DEFAULT NULL,
  `codigo_produto` varchar(3) DEFAULT NULL,
  `valor_bruto_parcela` decimal(11,2) DEFAULT NULL,
  `valor_liquido_parcela` decimal(11,2) DEFAULT NULL,
  `codigo_pedido` varchar(36) DEFAULT NULL,
  `codigo_autorizacao` varchar(36) DEFAULT NULL,
  `num_parcelas` decimal(2,0) DEFAULT NULL,
  `sequencia_registro` decimal(6,0) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_shellbox_empresas_ajuste_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_shellbox_empresas_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_shellbox_empresas_cancel`
--

DROP TABLE IF EXISTS `conn_item_shellbox_empresas_cancel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_shellbox_empresas_cancel` (
  `item_id` int(10) unsigned NOT NULL,
  `tiporegistro` varchar(2) DEFAULT NULL,
  `codigo_ec` decimal(15,0) DEFAULT NULL,
  `nsu_transacao_original` varchar(40) DEFAULT NULL,
  `data_transacao_original` date DEFAULT NULL,
  `num_da_parcela` decimal(2,0) DEFAULT NULL,
  `nsu_transacao` varchar(40) DEFAULT NULL,
  `data_transacao_cancelamento` date DEFAULT NULL,
  `hora_transacao_cancelamento` time DEFAULT NULL,
  `forma_captura` decimal(1,0) DEFAULT NULL,
  `codigo_pedido` varchar(36) DEFAULT NULL,
  `codigo_autorizacao` varchar(40) DEFAULT NULL,
  `valor_bruto` decimal(11,2) DEFAULT NULL,
  `valor_liquido` decimal(11,2) DEFAULT NULL,
  `valor_bruto_parcela` decimal(11,2) DEFAULT NULL,
  `valor_liquido_parcela` decimal(11,2) DEFAULT NULL,
  `codigo_ajuste` decimal(3,0) DEFAULT NULL,
  `descricao_ajuste` varchar(30) DEFAULT NULL,
  `num_parcelas` decimal(2,0) DEFAULT NULL,
  `sequencia_registro` decimal(6,0) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_shellbox_empresas_cancel_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_shellbox_empresas_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_shellbox_empresas_cv`
--

DROP TABLE IF EXISTS `conn_item_shellbox_empresas_cv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_shellbox_empresas_cv` (
  `item_id` int(10) unsigned NOT NULL,
  `tipo_registro` varchar(2) DEFAULT NULL,
  `codigo_ec` decimal(15,0) DEFAULT NULL,
  `nsu_adquirente` varchar(40) DEFAULT NULL,
  `data_transacao` date DEFAULT NULL,
  `hora_transacao` time DEFAULT NULL,
  `tipo_lancamento` decimal(1,0) DEFAULT NULL,
  `data_pagamento` date DEFAULT NULL,
  `tipo_produto` varchar(1) DEFAULT NULL,
  `forma_captura` decimal(1,0) DEFAULT NULL,
  `valor_bruto` decimal(11,2) DEFAULT NULL,
  `valor_desconto` decimal(11,2) DEFAULT NULL,
  `valor_liquido` decimal(11,2) DEFAULT NULL,
  `num_cartao` varchar(19) DEFAULT NULL,
  `num_da_parcela` decimal(2,0) DEFAULT NULL,
  `num_parcelas` decimal(2,0) DEFAULT NULL,
  `nsu_parcela` varchar(40) DEFAULT NULL,
  `valor_bruto_parcela` decimal(11,2) DEFAULT NULL,
  `valor_desconto_parcela` decimal(11,2) DEFAULT NULL,
  `valor_liquido_parcela` decimal(11,2) DEFAULT NULL,
  `banco` decimal(3,0) DEFAULT NULL,
  `agencia` decimal(6,0) DEFAULT NULL,
  `conta_corrente` varchar(11) DEFAULT NULL,
  `codigo_autorizacao` varchar(40) DEFAULT NULL,
  `codigo_bandeira` varchar(3) DEFAULT NULL,
  `codigo_produto` varchar(3) DEFAULT NULL,
  `valor_taxa_1` decimal(11,2) DEFAULT NULL,
  `valor_taxa_2` decimal(11,2) DEFAULT NULL,
  `valor_taxa_1_parcela` decimal(11,2) DEFAULT NULL,
  `valor_taxa_2_parcela` decimal(11,2) DEFAULT NULL,
  `filler_1` decimal(11,0) DEFAULT NULL,
  `valor_taxa_antecipacao` decimal(11,2) DEFAULT NULL,
  `valor_liquido_antecipado` decimal(11,2) DEFAULT NULL,
  `filler_2` decimal(2,0) DEFAULT NULL,
  `codigo_pedido` varchar(40) DEFAULT NULL,
  `filler_3` varchar(3) DEFAULT NULL,
  `numero_terminal` varchar(8) DEFAULT NULL,
  `codigo_shellbox` varchar(50) DEFAULT NULL,
  `sequencia_registro` decimal(6,0) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_shellbox_empresas_cv_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_shellbox_empresas_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_shellbox_empresas_header`
--

DROP TABLE IF EXISTS `conn_item_shellbox_empresas_header`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_shellbox_empresas_header` (
  `item_id` int(10) unsigned NOT NULL,
  `tipo_registro` varchar(2) DEFAULT NULL,
  `versao_layout` varchar(6) DEFAULT NULL,
  `data_criacao` date DEFAULT NULL,
  `hora_criacao` time DEFAULT NULL,
  `sequencia` decimal(6,0) DEFAULT NULL,
  `nome_adquirente` varchar(30) DEFAULT NULL,
  `filler` decimal(1,0) DEFAULT NULL,
  `codigo_ec` decimal(13,0) DEFAULT NULL,
  `tipo_processamento` varchar(1) DEFAULT NULL,
  `sequencia_registro` decimal(6,0) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_shellbox_empresas_header_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_shellbox_empresas_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_shellbox_empresas_header_mov`
--

DROP TABLE IF EXISTS `conn_item_shellbox_empresas_header_mov`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_shellbox_empresas_header_mov` (
  `item_id` int(10) unsigned NOT NULL,
  `tipo_registro` varchar(2) DEFAULT NULL,
  `data_movimento` date DEFAULT NULL,
  `moeda` varchar(2) DEFAULT NULL,
  `sequencia_registro` decimal(6,0) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_shellbox_empresas_header_mov_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_shellbox_empresas_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_shellbox_empresas_line`
--

DROP TABLE IF EXISTS `conn_item_shellbox_empresas_line`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_shellbox_empresas_line` (
  `item_id` int(10) unsigned NOT NULL,
  `register_type` varchar(2) NOT NULL,
  `masterid` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  KEY `masterid` (`masterid`),
  CONSTRAINT `conn_item_shellbox_empresas_line_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `vooo_prod_backend`.`connection_item` (`item_id`),
  CONSTRAINT `conn_item_shellbox_empresas_line_ibfk_2` FOREIGN KEY (`masterid`) REFERENCES `conn_item_shellbox_empresas_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_shellbox_empresas_trailer`
--

DROP TABLE IF EXISTS `conn_item_shellbox_empresas_trailer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_shellbox_empresas_trailer` (
  `item_id` int(10) unsigned NOT NULL,
  `tipo_registro` varchar(2) DEFAULT NULL,
  `qtd_registros` decimal(6,0) DEFAULT NULL,
  `sequencia_registro` decimal(6,0) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_shellbox_empresas_trailer_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_shellbox_empresas_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_shellbox_empresas_trailer_mov`
--

DROP TABLE IF EXISTS `conn_item_shellbox_empresas_trailer_mov`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_shellbox_empresas_trailer_mov` (
  `item_id` int(10) unsigned NOT NULL,
  `tipo_registro` varchar(2) DEFAULT NULL,
  `total_registros` decimal(6,0) DEFAULT NULL,
  `total_creditos` decimal(14,2) DEFAULT NULL,
  `sequencia_registro` decimal(6,0) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_shellbox_empresas_trailer_mov_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_shellbox_empresas_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_shellbox_header`
--

DROP TABLE IF EXISTS `conn_item_shellbox_header`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_shellbox_header` (
  `item_id` int(10) unsigned NOT NULL,
  `tiporegistro` decimal(1,0) DEFAULT NULL,
  `datacriacao` date DEFAULT NULL,
  `horacriacao` time DEFAULT NULL,
  `datareferencia` date DEFAULT NULL,
  `arquivoversao` varchar(8) DEFAULT NULL,
  `codigo_ec` decimal(15,0) DEFAULT NULL,
  `cnpj_adquirente` decimal(14,0) DEFAULT NULL,
  `nome_adquirente` varchar(20) DEFAULT NULL,
  `sequencia` decimal(9,0) DEFAULT NULL,
  `codigo_adquirente` varchar(2) DEFAULT NULL,
  `versao_layout` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_shellbox_header_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_shellbox_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_shellbox_line`
--

DROP TABLE IF EXISTS `conn_item_shellbox_line`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_shellbox_line` (
  `item_id` int(10) unsigned NOT NULL,
  `registertype` decimal(1,0) NOT NULL,
  `rotype` varchar(3) DEFAULT NULL,
  `masterid` int(10) unsigned DEFAULT NULL,
  `fileversion` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  KEY `masterid` (`masterid`),
  CONSTRAINT `conn_item_shellbox_line_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `vooo_prod_backend`.`connection_item` (`item_id`),
  CONSTRAINT `conn_item_shellbox_line_ibfk_2` FOREIGN KEY (`masterid`) REFERENCES `conn_item_shellbox_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_shellbox_rv`
--

DROP TABLE IF EXISTS `conn_item_shellbox_rv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_shellbox_rv` (
  `item_id` int(10) unsigned NOT NULL,
  `tiporegistro` decimal(1,0) DEFAULT NULL,
  `codigo_ec` decimal(15,0) DEFAULT NULL,
  `codigo_produto` varchar(2) DEFAULT NULL,
  `forma_captura` varchar(3) DEFAULT NULL,
  `numero_rv` decimal(9,0) DEFAULT NULL,
  `data_rv` date DEFAULT NULL,
  `data_pagamento_rv` date DEFAULT NULL,
  `banco` decimal(3,0) DEFAULT NULL,
  `agencia` decimal(6,0) DEFAULT NULL,
  `conta_corrente` decimal(11,0) DEFAULT NULL,
  `qtd_cv_aceitos` decimal(9,0) DEFAULT NULL,
  `qtd_cv_rejeitados` decimal(9,0) DEFAULT NULL,
  `valor_bruto` decimal(12,2) DEFAULT NULL,
  `valor_liquido` decimal(12,2) DEFAULT NULL,
  `taxa_servico` decimal(12,2) DEFAULT NULL,
  `taxa_desconto` decimal(12,2) DEFAULT NULL,
  `valor_rejeitado` decimal(12,2) DEFAULT NULL,
  `valor_credito` decimal(12,2) DEFAULT NULL,
  `valor_encargos` decimal(12,2) DEFAULT NULL,
  `tipo_pagamento` varchar(2) DEFAULT NULL,
  `parcela_rv` decimal(2,0) DEFAULT NULL,
  `qtd_parcelas` decimal(2,0) DEFAULT NULL,
  `codigo_ec_centralizador` decimal(15,0) DEFAULT NULL,
  `num_operacao_antecipacao` varchar(15) DEFAULT NULL,
  `vencimento_original_rv_antecipado` date DEFAULT NULL,
  `custo_operacao` decimal(12,2) DEFAULT NULL,
  `valor_liquido_rv_antecipado` decimal(12,2) DEFAULT NULL,
  `num_controle_cobranca` decimal(18,0) DEFAULT NULL,
  `valor_liquido_cobranca` decimal(12,0) DEFAULT NULL,
  `id_compensacao` decimal(15,0) DEFAULT NULL,
  `moeda` decimal(3,0) DEFAULT NULL,
  `id_baixa_cobranca` varchar(1) DEFAULT NULL,
  `sinal_transacao` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_shellbox_rv_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_shellbox_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_shellbox_trailer`
--

DROP TABLE IF EXISTS `conn_item_shellbox_trailer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_shellbox_trailer` (
  `item_id` int(10) unsigned NOT NULL,
  `tiporegistro` decimal(1,0) DEFAULT NULL,
  `qtd_registros` decimal(9,0) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_shellbox_trailer_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_shellbox_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_sipag_control`
--

DROP TABLE IF EXISTS `conn_item_sipag_control`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_sipag_control` (
  `item_id` int(10) unsigned NOT NULL,
  `file_type_name` varchar(30) DEFAULT NULL,
  `file_coin` varchar(10) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `check_status` decimal(1,0) DEFAULT NULL,
  `lines` decimal(10,0) DEFAULT NULL,
  `transactions` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  KEY `ix_vooo_prod_rawdata_conn_item_sipag_control_start_date` (`start_date`),
  KEY `ix_vooo_prod_rawdata_conn_item_sipag_control_end_date` (`end_date`),
  CONSTRAINT `conn_item_sipag_control_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_sipag_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_sipag_line`
--

DROP TABLE IF EXISTS `conn_item_sipag_line`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_sipag_line` (
  `item_id` int(10) unsigned NOT NULL,
  `file_type` varchar(2) NOT NULL,
  `register_type` varchar(15) NOT NULL,
  `masterid` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  KEY `masterid` (`masterid`),
  CONSTRAINT `conn_item_sipag_line_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `vooo_prod_backend`.`connection_item` (`item_id`),
  CONSTRAINT `conn_item_sipag_line_ibfk_2` FOREIGN KEY (`masterid`) REFERENCES `conn_item_sipag_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_sipag_transaction`
--

DROP TABLE IF EXISTS `conn_item_sipag_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_sipag_transaction` (
  `item_id` int(10) unsigned NOT NULL,
  `resumo_vendas` decimal(20,0) DEFAULT NULL,
  `data_credito` date DEFAULT NULL,
  `data_transacao` date DEFAULT NULL,
  `codigo_cliente` decimal(10,0) DEFAULT NULL,
  `comprovante` decimal(20,0) DEFAULT NULL,
  `produto` varchar(20) DEFAULT NULL,
  `tipo_transacao` varchar(30) DEFAULT NULL,
  `parcela` varchar(10) DEFAULT NULL,
  `autorizacao` varchar(10) DEFAULT NULL,
  `numero_cartao` varchar(20) DEFAULT NULL,
  `seu_numero` varchar(20) DEFAULT NULL,
  `eci_code` varchar(20) DEFAULT NULL,
  `terminal` varchar(20) DEFAULT NULL,
  `tipo_captura` varchar(20) DEFAULT NULL,
  `tipo_cartao` varchar(20) DEFAULT NULL,
  `valor_plano` decimal(10,2) DEFAULT NULL,
  `valor_bruto` decimal(10,2) DEFAULT NULL,
  `desconto` decimal(10,2) DEFAULT NULL,
  `valor_liquido` decimal(10,2) DEFAULT NULL,
  `desconto_plano` decimal(10,2) DEFAULT NULL,
  `valor_liquido_plano` decimal(10,2) DEFAULT NULL,
  `status` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  KEY `idx_item_sipag_trans1` (`comprovante`,`data_transacao`,`codigo_cliente`,`produto`,`tipo_transacao`,`parcela`),
  CONSTRAINT `conn_item_sipag_transaction_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_sipag_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_sitef2_control`
--

DROP TABLE IF EXISTS `conn_item_sitef2_control`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_sitef2_control` (
  `item_id` int(10) unsigned NOT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `provider` varchar(50) DEFAULT NULL,
  `check_status` decimal(1,0) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_sitef2_control_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_sitef2_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_sitef2_line`
--

DROP TABLE IF EXISTS `conn_item_sitef2_line`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_sitef2_line` (
  `item_id` int(10) unsigned NOT NULL,
  `register_type` varchar(10) DEFAULT NULL,
  `masterid` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  KEY `masterid` (`masterid`),
  CONSTRAINT `conn_item_sitef2_line_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `vooo_prod_backend`.`connection_item` (`item_id`),
  CONSTRAINT `conn_item_sitef2_line_ibfk_2` FOREIGN KEY (`masterid`) REFERENCES `conn_item_sitef2_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_sitef2_transaction`
--

DROP TABLE IF EXISTS `conn_item_sitef2_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_sitef2_transaction` (
  `item_id` int(10) unsigned NOT NULL,
  `loja` varchar(20) DEFAULT NULL,
  `data` date DEFAULT NULL,
  `hora` time DEFAULT NULL,
  `pdv` varchar(20) DEFAULT NULL,
  `nsu` varchar(20) DEFAULT NULL,
  `nsu_host` varchar(20) DEFAULT NULL,
  `rede` varchar(20) DEFAULT NULL,
  `produto` varchar(20) DEFAULT NULL,
  `transacao` varchar(50) DEFAULT NULL,
  `documento` varchar(20) DEFAULT NULL,
  `valor` decimal(10,2) DEFAULT NULL,
  `estado_transacao` varchar(50) DEFAULT NULL,
  `codigo_resposta` varchar(20) DEFAULT NULL,
  `doc_cancelamento` varchar(20) DEFAULT NULL,
  `cod_autorizacao` varchar(20) DEFAULT NULL,
  `nr_parcelas` decimal(2,0) DEFAULT NULL,
  `data_lancamento` date DEFAULT NULL,
  `usuario_pendente` varchar(20) DEFAULT NULL,
  `data_pendencia` date DEFAULT NULL,
  `hora_pendencia` time DEFAULT NULL,
  `tempo_resposta_rede` decimal(10,0) DEFAULT NULL,
  `bandeira` varchar(50) DEFAULT NULL,
  `cupom_fiscal` varchar(20) DEFAULT NULL,
  `operador` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_sitef2_transaction_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_sitef2_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_sitef_control`
--

DROP TABLE IF EXISTS `conn_item_sitef_control`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_sitef_control` (
  `item_id` int(10) unsigned NOT NULL,
  `client_id` int(10) unsigned DEFAULT NULL,
  `connector_id` int(10) unsigned DEFAULT NULL,
  `file_date` date DEFAULT NULL,
  `file_sequence` decimal(10,0) DEFAULT NULL,
  `check_code` varchar(50) DEFAULT NULL,
  `registers` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_sitef_control_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_sitef_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_sitef_line`
--

DROP TABLE IF EXISTS `conn_item_sitef_line`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_sitef_line` (
  `item_id` int(10) unsigned NOT NULL,
  `type` varchar(1) DEFAULT NULL,
  `masterid` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  KEY `masterid` (`masterid`),
  CONSTRAINT `conn_item_sitef_line_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `vooo_prod_backend`.`connection_item` (`item_id`),
  CONSTRAINT `conn_item_sitef_line_ibfk_2` FOREIGN KEY (`masterid`) REFERENCES `conn_item_sitef_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_sitef_transaction`
--

DROP TABLE IF EXISTS `conn_item_sitef_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_sitef_transaction` (
  `item_id` int(10) unsigned NOT NULL,
  `codSit` decimal(5,0) DEFAULT NULL,
  `dataTrn` date DEFAULT NULL,
  `nsuSitef` varchar(10) DEFAULT NULL,
  `codLojaSitef` decimal(10,0) DEFAULT NULL,
  `horaTrn` time DEFAULT NULL,
  `valor` decimal(10,2) DEFAULT NULL,
  `codResp` varchar(5) DEFAULT NULL,
  `estado` varchar(50) DEFAULT NULL,
  `codAutorizacao` varchar(6) DEFAULT NULL,
  `cupomFiscal` varchar(50) DEFAULT NULL,
  `produto` varchar(50) DEFAULT NULL,
  `infoTransacao` varchar(50) DEFAULT NULL,
  `documento` varchar(20) DEFAULT NULL,
  `numParcelas` decimal(2,0) DEFAULT NULL,
  `numPdv` varchar(20) DEFAULT NULL,
  `nsuHost` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_sitef_transaction_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_sitef_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_smiles_api_line`
--

DROP TABLE IF EXISTS `conn_item_smiles_api_line`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_smiles_api_line` (
  `item_id` int(10) unsigned NOT NULL,
  `register_type` smallint(6) DEFAULT NULL,
  `masterid` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  KEY `masterid` (`masterid`),
  CONSTRAINT `conn_item_smiles_api_line_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `vooo_homolog_backend`.`connection_item` (`item_id`),
  CONSTRAINT `conn_item_smiles_api_line_ibfk_2` FOREIGN KEY (`masterid`) REFERENCES `conn_item_smiles_api_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_smiles_api_transactions`
--

DROP TABLE IF EXISTS `conn_item_smiles_api_transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_smiles_api_transactions` (
  `item_id` int(10) unsigned NOT NULL,
  `orderNumber` int(10) unsigned DEFAULT NULL,
  `externalId` varchar(64) DEFAULT NULL,
  `transactionId` int(10) unsigned DEFAULT NULL,
  `orderDate` datetime DEFAULT NULL,
  `transactionDate` datetime DEFAULT NULL,
  `gasType` varchar(30) DEFAULT NULL,
  `miles` decimal(10,2) DEFAULT NULL,
  `grossPrice` decimal(10,2) DEFAULT NULL,
  `settlementDateTime` date DEFAULT NULL,
  `status` varchar(30) DEFAULT NULL,
  `saleDateTime` datetime DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_smiles_api_transactions_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_smiles_api_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_sodexo_ajustes`
--

DROP TABLE IF EXISTS `conn_item_sodexo_ajustes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_sodexo_ajustes` (
  `item_id` int(10) unsigned NOT NULL,
  `tiporegistro` int(10) unsigned DEFAULT NULL,
  `cnpjestabelecimento` varchar(15) DEFAULT NULL,
  `numerorv` varchar(9) DEFAULT NULL,
  `dataajuste` date DEFAULT NULL,
  `numerocartao` varchar(19) DEFAULT NULL,
  `sinalvalorajuste` varchar(1) DEFAULT NULL,
  `valorajuste` varchar(1) DEFAULT NULL,
  `motivoajuste` decimal(10,2) DEFAULT NULL,
  `numerorvoriginal` varchar(2) DEFAULT NULL,
  `nsuadministradora` decimal(12,2) DEFAULT NULL,
  `datatransacaooriginal` decimal(12,2) DEFAULT NULL,
  `codigoestabelecimento` decimal(2,0) DEFAULT NULL,
  `codigoloja` decimal(2,0) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_sodexo_ajustes_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_sodexo_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_sodexo_header`
--

DROP TABLE IF EXISTS `conn_item_sodexo_header`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_sodexo_header` (
  `item_id` int(10) unsigned NOT NULL,
  `tiporegistro` int(10) unsigned DEFAULT NULL,
  `datacriacao` date DEFAULT NULL,
  `horacriacao` time DEFAULT NULL,
  `datareferencia` date DEFAULT NULL,
  `arquivoversao` varchar(8) DEFAULT NULL,
  `cnpjestabilecimento` varchar(15) DEFAULT NULL,
  `cnpjadministradora` varchar(14) DEFAULT NULL,
  `nomeadministradora` varchar(20) DEFAULT NULL,
  `sequencia` int(10) unsigned DEFAULT NULL,
  `codigoestabelecimento` int(10) unsigned DEFAULT NULL,
  `codigoloja` varchar(10) DEFAULT NULL,
  `sequenciaarquivo` int(10) unsigned DEFAULT NULL,
  `codigoadministradora` varchar(2) DEFAULT NULL,
  `tipoarquivo` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_sodexo_header_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_sodexo_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_sodexo_line`
--

DROP TABLE IF EXISTS `conn_item_sodexo_line`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_sodexo_line` (
  `item_id` int(10) unsigned NOT NULL,
  `filetype` varchar(8) NOT NULL,
  `registertype` decimal(1,0) NOT NULL,
  `masterid` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  KEY `masterid` (`masterid`),
  CONSTRAINT `conn_item_sodexo_line_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `vooo_prod_backend`.`connection_item` (`item_id`),
  CONSTRAINT `conn_item_sodexo_line_ibfk_2` FOREIGN KEY (`masterid`) REFERENCES `conn_item_sodexo_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_sodexo_pg_ajustes`
--

DROP TABLE IF EXISTS `conn_item_sodexo_pg_ajustes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_sodexo_pg_ajustes` (
  `item_id` int(10) unsigned NOT NULL,
  `tiporegistro` int(10) unsigned DEFAULT NULL,
  `cnpjestabelecimento` varchar(15) DEFAULT NULL,
  `numerorv` varchar(9) DEFAULT NULL,
  `dataajuste` date DEFAULT NULL,
  `numerocartao` varchar(19) DEFAULT NULL,
  `sinalvalorajuste` varchar(1) DEFAULT NULL,
  `valorajuste` decimal(10,2) DEFAULT NULL,
  `motivoajuste` varchar(2) DEFAULT NULL,
  `numerorvoriginal` varchar(9) DEFAULT NULL,
  `nsuadministradora` varchar(12) DEFAULT NULL,
  `datatransacaooriginal` date DEFAULT NULL,
  `codigoestabelecimento` varchar(10) DEFAULT NULL,
  `codigoloja` varchar(10) DEFAULT NULL,
  `codigoforma` varchar(2) DEFAULT NULL,
  `codigoafiliacao` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_sodexo_pg_ajustes_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_sodexo_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_sodexo_pg_encargos`
--

DROP TABLE IF EXISTS `conn_item_sodexo_pg_encargos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_sodexo_pg_encargos` (
  `item_id` int(10) unsigned NOT NULL,
  `tiporegistro` int(10) unsigned DEFAULT NULL,
  `cnpjestabelecimento` varchar(15) DEFAULT NULL,
  `numerorv` varchar(9) DEFAULT NULL,
  `datapagamentooriginalrv` date DEFAULT NULL,
  `codigoencargo` varchar(3) DEFAULT NULL,
  `descricaoencargo` varchar(40) DEFAULT NULL,
  `valorencargoporrv` decimal(10,2) DEFAULT NULL,
  `codigoestabelecimento` varchar(10) DEFAULT NULL,
  `codigoloja` varchar(10) DEFAULT NULL,
  `origem` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_sodexo_pg_encargos_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_sodexo_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_sodexo_pg_header`
--

DROP TABLE IF EXISTS `conn_item_sodexo_pg_header`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_sodexo_pg_header` (
  `item_id` int(10) unsigned NOT NULL,
  `tiporegistro` int(10) unsigned DEFAULT NULL,
  `datacriacao` date DEFAULT NULL,
  `horacriacao` time DEFAULT NULL,
  `datareferencia` date DEFAULT NULL,
  `arquivoversao` varchar(8) DEFAULT NULL,
  `cnpjestabilecimento` varchar(15) DEFAULT NULL,
  `cnpjadministradora` varchar(14) DEFAULT NULL,
  `nomeadministradora` varchar(20) DEFAULT NULL,
  `sequencia` int(10) unsigned DEFAULT NULL,
  `codigoestabelecimento` int(10) unsigned DEFAULT NULL,
  `codigoloja` varchar(10) DEFAULT NULL,
  `sequenciaarquivo` int(10) unsigned DEFAULT NULL,
  `codigoadministradora` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_sodexo_pg_header_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_sodexo_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_sodexo_pg_rv`
--

DROP TABLE IF EXISTS `conn_item_sodexo_pg_rv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_sodexo_pg_rv` (
  `item_id` int(10) unsigned NOT NULL,
  `tiporegistro` int(10) unsigned DEFAULT NULL,
  `cnpjestabelecimento` varchar(15) DEFAULT NULL,
  `codigoproduto` int(10) unsigned DEFAULT NULL,
  `formacaptura` varchar(3) DEFAULT NULL,
  `numerorv` varchar(9) DEFAULT NULL,
  `datapagamentooriginalrv` date DEFAULT NULL,
  `datapagamentorv` date DEFAULT NULL,
  `banco` varchar(3) DEFAULT NULL,
  `agencia` varchar(6) DEFAULT NULL,
  `contacorrente` varchar(11) DEFAULT NULL,
  `numerocvaceitos` varchar(9) DEFAULT NULL,
  `numerocvrejeitados` varchar(9) DEFAULT NULL,
  `valorbruto` decimal(10,2) DEFAULT NULL,
  `valorliquido` decimal(10,2) DEFAULT NULL,
  `valortaxaservico` decimal(10,2) DEFAULT NULL,
  `valorcomissao` decimal(10,2) DEFAULT NULL,
  `valorrejeitado` decimal(10,2) DEFAULT NULL,
  `valorcredito` decimal(10,2) DEFAULT NULL,
  `valorencargos` decimal(10,2) DEFAULT NULL,
  `indicadortipopagamento` varchar(2) DEFAULT NULL,
  `codigoestabelecimento` varchar(10) DEFAULT NULL,
  `codigoloja` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_sodexo_pg_rv_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_sodexo_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_sodexo_pg_trailer`
--

DROP TABLE IF EXISTS `conn_item_sodexo_pg_trailer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_sodexo_pg_trailer` (
  `item_id` int(10) unsigned NOT NULL,
  `tiporegistro` int(10) unsigned DEFAULT NULL,
  `quantidaderegistros` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_sodexo_pg_trailer_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_sodexo_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_sodexo_pg_transacoes`
--

DROP TABLE IF EXISTS `conn_item_sodexo_pg_transacoes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_sodexo_pg_transacoes` (
  `item_id` int(10) unsigned NOT NULL,
  `tiporegistro` int(10) unsigned DEFAULT NULL,
  `cnpjestabelecimento` varchar(15) DEFAULT NULL,
  `numerorv` varchar(9) DEFAULT NULL,
  `nsuadministradora` varchar(12) DEFAULT NULL,
  `datatransacao` date DEFAULT NULL,
  `horatransacao` time DEFAULT NULL,
  `numerocartao` varchar(19) DEFAULT NULL,
  `valortransacao` decimal(10,2) DEFAULT NULL,
  `valorsaque` decimal(10,2) DEFAULT NULL,
  `valortaxaservico` decimal(10,2) DEFAULT NULL,
  `numeroparcelas` varchar(2) DEFAULT NULL,
  `numeroparcelapaga` varchar(2) DEFAULT NULL,
  `valorparcelapaga` decimal(10,2) DEFAULT NULL,
  `datapagamentooriginal` date DEFAULT NULL,
  `codigoautorizacao` varchar(10) DEFAULT NULL,
  `codigoestabelecimento` varchar(10) DEFAULT NULL,
  `codigoloja` varchar(10) DEFAULT NULL,
  `numeroterminal` varchar(8) DEFAULT NULL,
  `ntthost` varchar(6) DEFAULT NULL,
  `redecapturaorigem` varchar(3) DEFAULT NULL,
  `codigoforma` varchar(2) DEFAULT NULL,
  `codigoafiliacao` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_sodexo_pg_transacoes_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_sodexo_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_sodexo_rv`
--

DROP TABLE IF EXISTS `conn_item_sodexo_rv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_sodexo_rv` (
  `item_id` int(10) unsigned NOT NULL,
  `tiporegistro` int(10) unsigned DEFAULT NULL,
  `cnpjestabelecimento` varchar(15) DEFAULT NULL,
  `codigoproduto` int(10) unsigned DEFAULT NULL,
  `formacaptura` varchar(3) DEFAULT NULL,
  `numerorv` varchar(9) DEFAULT NULL,
  `datarv` date DEFAULT NULL,
  `datapagamentorv` date DEFAULT NULL,
  `banco` varchar(3) DEFAULT NULL,
  `agencia` varchar(6) DEFAULT NULL,
  `contacorrente` varchar(11) DEFAULT NULL,
  `numerocvaceitos` varchar(9) DEFAULT NULL,
  `numerocvrejeitados` varchar(9) DEFAULT NULL,
  `valorbruto` decimal(10,2) DEFAULT NULL,
  `valorliquido` decimal(10,2) DEFAULT NULL,
  `valortaxaservico` decimal(10,2) DEFAULT NULL,
  `valorcomissao` decimal(10,2) DEFAULT NULL,
  `valorrejeitado` decimal(10,2) DEFAULT NULL,
  `valorcredito` decimal(10,2) DEFAULT NULL,
  `valorencargos` decimal(10,2) DEFAULT NULL,
  `indicadortipopagamento` varchar(2) DEFAULT NULL,
  `codigoestabelecimento` varchar(10) DEFAULT NULL,
  `codigoloja` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_sodexo_rv_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_sodexo_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_sodexo_trailer`
--

DROP TABLE IF EXISTS `conn_item_sodexo_trailer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_sodexo_trailer` (
  `item_id` int(10) unsigned NOT NULL,
  `tiporegistro` int(10) unsigned DEFAULT NULL,
  `quantidaderegistros` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_sodexo_trailer_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_sodexo_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_sodexo_transacoes`
--

DROP TABLE IF EXISTS `conn_item_sodexo_transacoes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_sodexo_transacoes` (
  `item_id` int(10) unsigned NOT NULL,
  `tiporegistro` int(10) unsigned DEFAULT NULL,
  `cnpjestabelecimento` varchar(15) DEFAULT NULL,
  `numerorv` varchar(9) DEFAULT NULL,
  `nsuadministradora` varchar(12) DEFAULT NULL,
  `datatransacao` date DEFAULT NULL,
  `horatransacao` time DEFAULT NULL,
  `numerocartao` varchar(19) DEFAULT NULL,
  `valortransacao` decimal(10,2) DEFAULT NULL,
  `valorsaque` decimal(10,2) DEFAULT NULL,
  `valortaxaservico` decimal(10,2) DEFAULT NULL,
  `numeroparcelas` varchar(2) DEFAULT NULL,
  `numeroparcelapaga` varchar(2) DEFAULT NULL,
  `valorparcelapaga` decimal(10,2) DEFAULT NULL,
  `datapagamento` date DEFAULT NULL,
  `codigoautorizacao` varchar(10) DEFAULT NULL,
  `codigoestabelecimento` varchar(10) DEFAULT NULL,
  `codigoloja` varchar(10) DEFAULT NULL,
  `numeroterminal` varchar(8) DEFAULT NULL,
  `ntthost` varchar(6) DEFAULT NULL,
  `redecapturaorigem` varchar(3) DEFAULT NULL,
  `codigoforma` varchar(2) DEFAULT NULL,
  `codigoafiliacao` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_sodexo_transacoes_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_sodexo_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_sorocred_aj`
--

DROP TABLE IF EXISTS `conn_item_sorocred_aj`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_sorocred_aj` (
  `item_id` int(10) unsigned NOT NULL,
  `tipo_registro` tinyint(4) DEFAULT NULL,
  `codigo_estabelecimento` varchar(15) DEFAULT NULL,
  `numero_rv_ajustado` varchar(9) DEFAULT NULL,
  `data_rv` date DEFAULT NULL,
  `data_pagamento_rv` date DEFAULT NULL,
  `indicador_ajuste` varchar(20) DEFAULT NULL,
  `sinal_valor_ajuste` varchar(1) DEFAULT NULL,
  `valor_ajuste` decimal(10,2) DEFAULT NULL,
  `motivo_ajuste` varchar(2) DEFAULT NULL,
  `data_carta` date DEFAULT NULL,
  `numero_cartao` varchar(19) DEFAULT NULL,
  `numero_rv_original` varchar(9) DEFAULT NULL,
  `nsu_administradora` varchar(12) DEFAULT NULL,
  `data_transacao_original` date DEFAULT NULL,
  `indicador_tipo_pagamento` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_sorocred_aj_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_sorocred_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_sorocred_cv`
--

DROP TABLE IF EXISTS `conn_item_sorocred_cv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_sorocred_cv` (
  `item_id` int(10) unsigned NOT NULL,
  `tipo_registro` tinyint(4) DEFAULT NULL,
  `codigo_estabelecimento` varchar(15) DEFAULT NULL,
  `numero_rv` varchar(9) DEFAULT NULL,
  `nsu_administradora` varchar(12) DEFAULT NULL,
  `data_transacao` date DEFAULT NULL,
  `hora_transacao` time DEFAULT NULL,
  `numero_cartao` varchar(19) DEFAULT NULL,
  `valor_transacao` decimal(10,2) DEFAULT NULL,
  `valor_saque` decimal(10,2) DEFAULT NULL,
  `valor_taxa_servico` decimal(10,2) DEFAULT NULL,
  `numero_parcelas` tinyint(4) DEFAULT NULL,
  `numero_parcela_paga` tinyint(4) DEFAULT NULL,
  `valor_parcela_paga` decimal(10,2) DEFAULT NULL,
  `data_pagamento` date DEFAULT NULL,
  `codigo_autorizacao` varchar(10) DEFAULT NULL,
  `forma_captura` varchar(3) DEFAULT NULL,
  `status_transacao` varchar(1) DEFAULT NULL,
  `modalidade_pagamento` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_sorocred_cv_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_sorocred_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_sorocred_header`
--

DROP TABLE IF EXISTS `conn_item_sorocred_header`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_sorocred_header` (
  `item_id` int(10) unsigned NOT NULL,
  `tipo_registro` tinyint(4) DEFAULT NULL,
  `data_criacao_arquivo` date DEFAULT NULL,
  `hora_criacao_arquivo` time DEFAULT NULL,
  `data_referencia_movimento` date DEFAULT NULL,
  `arquivo_versao` varchar(8) DEFAULT NULL,
  `codigo_estabelecimento` varchar(15) DEFAULT NULL,
  `cnpj_administradora` varchar(14) DEFAULT NULL,
  `nome_administradora` varchar(20) DEFAULT NULL,
  `nseq` int(11) DEFAULT NULL,
  `codigo_administradora` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_sorocred_header_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_sorocred_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_sorocred_line`
--

DROP TABLE IF EXISTS `conn_item_sorocred_line`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_sorocred_line` (
  `item_id` int(10) unsigned NOT NULL,
  `registertype` int(10) unsigned DEFAULT NULL,
  `masterid` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  KEY `masterid` (`masterid`),
  CONSTRAINT `conn_item_sorocred_line_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `vooo_prod_backend`.`connection_item` (`item_id`),
  CONSTRAINT `conn_item_sorocred_line_ibfk_2` FOREIGN KEY (`masterid`) REFERENCES `conn_item_sorocred_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_sorocred_rv`
--

DROP TABLE IF EXISTS `conn_item_sorocred_rv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_sorocred_rv` (
  `item_id` int(10) unsigned NOT NULL,
  `tipo_registro` tinyint(4) DEFAULT NULL,
  `codigo_estabelecimento` varchar(15) DEFAULT NULL,
  `codigo_produto` varchar(2) DEFAULT NULL,
  `forma_captura` varchar(3) DEFAULT NULL,
  `numero_rv` int(11) DEFAULT NULL,
  `data_rv` date DEFAULT NULL,
  `data_pagamento_rv` date DEFAULT NULL,
  `banco` varchar(3) DEFAULT NULL,
  `agencia` varchar(6) DEFAULT NULL,
  `conta_corrente` varchar(11) DEFAULT NULL,
  `numero_cv_aceitos` varchar(9) DEFAULT NULL,
  `numero_cv_rejeitados` varchar(9) DEFAULT NULL,
  `valor_bruto` decimal(10,2) DEFAULT NULL,
  `valor_liquido` decimal(10,2) DEFAULT NULL,
  `valor_taxa_servico` decimal(10,2) DEFAULT NULL,
  `valor_comissao` decimal(10,2) DEFAULT NULL,
  `valor_rejeitado` decimal(10,2) DEFAULT NULL,
  `valor_credito` decimal(10,2) DEFAULT NULL,
  `valor_encargos` decimal(10,2) DEFAULT NULL,
  `indicador_tipo_pagamento` varchar(2) DEFAULT NULL,
  `numero_parcela_rv` tinyint(4) DEFAULT NULL,
  `quantidade_parcela_rv` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_sorocred_rv_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_sorocred_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_sorocred_trailer`
--

DROP TABLE IF EXISTS `conn_item_sorocred_trailer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_sorocred_trailer` (
  `item_id` int(10) unsigned NOT NULL,
  `tipo_registro` tinyint(4) DEFAULT NULL,
  `quantidade_registros` int(11) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_sorocred_trailer_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_sorocred_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_stellantis_ajuste`
--

DROP TABLE IF EXISTS `conn_item_stellantis_ajuste`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_stellantis_ajuste` (
  `item_id` int(10) unsigned NOT NULL,
  `tipo_registro` varchar(2) DEFAULT NULL,
  `identificacao_loja` varchar(15) DEFAULT NULL,
  `nsu_transacao_original` varchar(36) DEFAULT NULL,
  `data_transacao_original` date DEFAULT NULL,
  `num_da_parcela` decimal(2,0) DEFAULT NULL,
  `nsu_transacao` varchar(36) DEFAULT NULL,
  `data_transacao_ajuste` date DEFAULT NULL,
  `hora_transacao_ajuste` time DEFAULT NULL,
  `tipo_lancamento` decimal(1,0) DEFAULT NULL,
  `data_lancamento` date DEFAULT NULL,
  `meio_captura` decimal(1,0) DEFAULT NULL,
  `tipo_ajuste` decimal(1,0) DEFAULT NULL,
  `codigo_ajuste` decimal(3,0) DEFAULT NULL,
  `descricao_ajuste` varchar(30) DEFAULT NULL,
  `valor_bruto` decimal(11,2) DEFAULT NULL,
  `valor_desconto` decimal(11,2) DEFAULT NULL,
  `valor_liquido` decimal(11,2) DEFAULT NULL,
  `banco` decimal(3,0) DEFAULT NULL,
  `agencia` decimal(6,0) DEFAULT NULL,
  `conta_corrente` varchar(11) DEFAULT NULL,
  `num_cartao` varchar(19) DEFAULT NULL,
  `codigo_bandeira` varchar(3) DEFAULT NULL,
  `codigo_produto` varchar(3) DEFAULT NULL,
  `valor_bruto_parcela` decimal(11,2) DEFAULT NULL,
  `valor_liquido_parcela` decimal(11,2) DEFAULT NULL,
  `codigo_pedido` varchar(36) DEFAULT NULL,
  `codigo_autorizacao` varchar(36) DEFAULT NULL,
  `num_parcelas` decimal(2,0) DEFAULT NULL,
  `sequencia_registro` decimal(6,0) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_stellantis_ajuste_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_stellantis_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_stellantis_cancel`
--

DROP TABLE IF EXISTS `conn_item_stellantis_cancel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_stellantis_cancel` (
  `item_id` int(10) unsigned NOT NULL,
  `tipo_registro` varchar(2) DEFAULT NULL,
  `identificacao_loja` decimal(15,0) DEFAULT NULL,
  `nsu_transacao_original` varchar(36) DEFAULT NULL,
  `data_transacao_original` date DEFAULT NULL,
  `num_da_parcela` decimal(2,0) DEFAULT NULL,
  `nsu_transacao` varchar(36) DEFAULT NULL,
  `data_transacao_cancelamento` date DEFAULT NULL,
  `hora_transacao_cancelamento` time DEFAULT NULL,
  `meio_captura` decimal(1,0) DEFAULT NULL,
  `codigo_pedido` varchar(36) DEFAULT NULL,
  `codigo_autorizacao` varchar(36) DEFAULT NULL,
  `valor_bruto` decimal(11,0) DEFAULT NULL,
  `valor_liquido` decimal(11,0) DEFAULT NULL,
  `valor_bruto_parcela` decimal(11,0) DEFAULT NULL,
  `valor_liquido_parcela` decimal(11,0) DEFAULT NULL,
  `codigo_ajuste` decimal(3,0) DEFAULT NULL,
  `descricao_ajuste` varchar(30) DEFAULT NULL,
  `num_parcelas` decimal(2,0) DEFAULT NULL,
  `sequencia_registro` decimal(6,0) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_stellantis_cancel_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_stellantis_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_stellantis_cv`
--

DROP TABLE IF EXISTS `conn_item_stellantis_cv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_stellantis_cv` (
  `item_id` int(10) unsigned NOT NULL,
  `tipo_registro` varchar(2) DEFAULT NULL,
  `identificacao_loja` varchar(15) DEFAULT NULL,
  `nsu_transacao` varchar(36) DEFAULT NULL,
  `data_transacao` date DEFAULT NULL,
  `hora_transacao` time DEFAULT NULL,
  `tipo_lancamento` decimal(1,0) DEFAULT NULL,
  `data_liquidacao` date DEFAULT NULL,
  `tipo_produto` varchar(1) DEFAULT NULL,
  `meio_captura` decimal(1,0) DEFAULT NULL,
  `valor_bruto` decimal(11,2) DEFAULT NULL,
  `valor_desconto` decimal(11,2) DEFAULT NULL,
  `valor_liquido` decimal(11,2) DEFAULT NULL,
  `num_cartao` varchar(19) DEFAULT NULL,
  `num_da_parcela` decimal(2,0) DEFAULT NULL,
  `num_parcelas` decimal(2,0) DEFAULT NULL,
  `nsu_parcela` varchar(36) DEFAULT NULL,
  `valor_bruto_parcela` decimal(11,2) DEFAULT NULL,
  `valor_desconto_parcela` decimal(11,2) DEFAULT NULL,
  `valor_liquido_parcela` decimal(11,2) DEFAULT NULL,
  `banco` decimal(3,0) DEFAULT NULL,
  `agencia` decimal(6,0) DEFAULT NULL,
  `conta_corrente` varchar(11) DEFAULT NULL,
  `codigo_autorizacao` varchar(36) DEFAULT NULL,
  `codigo_bandeira` varchar(3) DEFAULT NULL,
  `codigo_produto` varchar(3) DEFAULT NULL,
  `valor_taxa_1` decimal(11,2) DEFAULT NULL,
  `valor_taxa_2` decimal(11,2) DEFAULT NULL,
  `valor_taxa_1_parcela` decimal(11,2) DEFAULT NULL,
  `valor_taxa_2_parcela` decimal(11,2) DEFAULT NULL,
  `valor_taxa_antecipacao` decimal(11,2) DEFAULT NULL,
  `valor_liquido_antecipado` decimal(11,2) DEFAULT NULL,
  `codigo_pedido` varchar(36) DEFAULT NULL,
  `numero_terminal` varchar(8) DEFAULT NULL,
  `codigo_shellbox` varchar(43) DEFAULT NULL,
  `sequencia_registro` decimal(6,0) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  KEY `idx_transacao` (`nsu_transacao`,`identificacao_loja`),
  CONSTRAINT `conn_item_stellantis_cv_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_stellantis_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_stellantis_header`
--

DROP TABLE IF EXISTS `conn_item_stellantis_header`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_stellantis_header` (
  `item_id` int(10) unsigned NOT NULL,
  `tipo_registro` varchar(2) DEFAULT NULL,
  `versao_layout` varchar(6) DEFAULT NULL,
  `data_criacao` date DEFAULT NULL,
  `hora_criacao` time DEFAULT NULL,
  `sequencia` decimal(6,0) DEFAULT NULL,
  `nome_adquirente` varchar(30) DEFAULT NULL,
  `codigo_ec` decimal(13,0) DEFAULT NULL,
  `tipo_processamento` varchar(1) DEFAULT NULL,
  `sequencia_registro` decimal(6,0) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_stellantis_header_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_stellantis_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_stellantis_header_lote`
--

DROP TABLE IF EXISTS `conn_item_stellantis_header_lote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_stellantis_header_lote` (
  `item_id` int(10) unsigned NOT NULL,
  `tipo_registro` varchar(2) DEFAULT NULL,
  `data_movimento` date DEFAULT NULL,
  `moeda` varchar(2) DEFAULT NULL,
  `sequencia_registro` decimal(6,0) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_stellantis_header_lote_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_stellantis_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_stellantis_line`
--

DROP TABLE IF EXISTS `conn_item_stellantis_line`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_stellantis_line` (
  `item_id` int(10) unsigned NOT NULL,
  `register_type` varchar(2) NOT NULL,
  `masterid` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  KEY `masterid` (`masterid`),
  CONSTRAINT `conn_item_stellantis_line_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `vooo_prod_backend`.`connection_item` (`item_id`),
  CONSTRAINT `conn_item_stellantis_line_ibfk_2` FOREIGN KEY (`masterid`) REFERENCES `conn_item_stellantis_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_stellantis_trailer`
--

DROP TABLE IF EXISTS `conn_item_stellantis_trailer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_stellantis_trailer` (
  `item_id` int(10) unsigned NOT NULL,
  `tipo_registro` varchar(2) DEFAULT NULL,
  `total_registros` int(10) unsigned DEFAULT NULL,
  `sequencia_registro` decimal(6,0) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_stellantis_trailer_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_stellantis_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_stellantis_trailer_lote`
--

DROP TABLE IF EXISTS `conn_item_stellantis_trailer_lote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_stellantis_trailer_lote` (
  `item_id` int(10) unsigned NOT NULL,
  `tipo_registro` varchar(2) DEFAULT NULL,
  `total_registros` int(10) unsigned DEFAULT NULL,
  `total_valores` decimal(10,2) DEFAULT NULL,
  `sequencia_registro` decimal(6,0) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_stellantis_trailer_lote_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_stellantis_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_stix_header`
--

DROP TABLE IF EXISTS `conn_item_stix_header`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_stix_header` (
  `item_id` int(10) unsigned NOT NULL,
  `filename` varchar(80) DEFAULT NULL,
  `client_id` int(11) DEFAULT NULL,
  `processing_date` datetime DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_stix_header_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_stix_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_stix_line`
--

DROP TABLE IF EXISTS `conn_item_stix_line`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_stix_line` (
  `item_id` int(10) unsigned NOT NULL,
  `register_type` varchar(2) NOT NULL,
  `masterid` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  KEY `masterid` (`masterid`),
  CONSTRAINT `conn_item_stix_line_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `vooo_prod_backend`.`connection_item` (`item_id`),
  CONSTRAINT `conn_item_stix_line_ibfk_2` FOREIGN KEY (`masterid`) REFERENCES `conn_item_stix_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_stix_transactions`
--

DROP TABLE IF EXISTS `conn_item_stix_transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_stix_transactions` (
  `item_id` int(10) unsigned NOT NULL,
  `integration_id` varchar(200) DEFAULT NULL,
  `vouche_number` varchar(30) DEFAULT NULL,
  `partner_transaction_id` varchar(200) DEFAULT NULL,
  `member_number` varchar(20) DEFAULT NULL,
  `voucher_status` varchar(50) DEFAULT NULL,
  `voucher_creation_date` datetime DEFAULT NULL,
  `voucher_availability_start` datetime DEFAULT NULL,
  `voucher_availability_end` datetime DEFAULT NULL,
  `cancellation_processing_date` datetime DEFAULT NULL,
  `voucher_use_data` datetime DEFAULT NULL,
  `partner_promotion_id` varchar(20) DEFAULT NULL,
  `partner_benefit_id` varchar(20) DEFAULT NULL,
  `product_name` varchar(200) DEFAULT NULL,
  `product_type` varchar(30) DEFAULT NULL,
  `partner_code` varchar(20) DEFAULT NULL,
  `points` int(11) DEFAULT NULL,
  `product_real_cost` decimal(15,3) DEFAULT NULL,
  `product_price_sale_real` decimal(15,3) DEFAULT NULL,
  `redemption_channel` varchar(30) DEFAULT NULL,
  `payment_date` datetime DEFAULT NULL,
  `payment_date_real` datetime DEFAULT NULL,
  `voucher_invoice_number` int(11) DEFAULT NULL,
  `voucher_store_id` int(11) DEFAULT NULL,
  `partner_transaction_date` datetime DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  KEY `idx_transacao` (`partner_transaction_id`),
  CONSTRAINT `conn_item_stix_transactions_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_stix_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_stone_account_billing`
--

DROP TABLE IF EXISTS `conn_item_stone_account_billing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_stone_account_billing` (
  `item_id` int(10) unsigned NOT NULL,
  `ChargedAmount` decimal(20,2) DEFAULT NULL,
  `ChargeDate` date DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_stone_account_billing_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_stone_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_stone_account_cancellation`
--

DROP TABLE IF EXISTS `conn_item_stone_account_cancellation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_stone_account_cancellation` (
  `item_id` int(10) unsigned NOT NULL,
  `InstallmentNumber` decimal(2,0) DEFAULT NULL,
  `OperationKey` varchar(32) DEFAULT NULL,
  `CancellationDateTime` datetime DEFAULT NULL,
  `ReturnedAmount` decimal(20,2) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_stone_account_cancellation_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_stone_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_stone_account_event`
--

DROP TABLE IF EXISTS `conn_item_stone_account_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_stone_account_event` (
  `item_id` int(10) unsigned NOT NULL,
  `EventId` varchar(60) DEFAULT NULL,
  `Description` varchar(60) DEFAULT NULL,
  `Type` decimal(2,0) DEFAULT NULL,
  `PaymentDate` date DEFAULT NULL,
  `Amount` decimal(20,2) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_stone_account_event_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_stone_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_stone_account_installment`
--

DROP TABLE IF EXISTS `conn_item_stone_account_installment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_stone_account_installment` (
  `item_id` int(10) unsigned NOT NULL,
  `InstallmentNumber` decimal(2,0) DEFAULT NULL,
  `GrossAmount` decimal(20,2) DEFAULT NULL,
  `NetAmount` decimal(20,2) DEFAULT NULL,
  `PaymentDate` date DEFAULT NULL,
  `AdvanceRateAmount` decimal(20,2) DEFAULT NULL,
  `AdvancedReceivableOriginalPaymentDate` datetime DEFAULT NULL,
  `SuspendedByChargeback` varchar(4) DEFAULT NULL,
  `PaymentId` decimal(13,0) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_stone_account_installment_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_stone_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_stone_account_transaction`
--

DROP TABLE IF EXISTS `conn_item_stone_account_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_stone_account_transaction` (
  `item_id` int(10) unsigned NOT NULL,
  `AcquirerTransactionKey` decimal(14,0) DEFAULT NULL,
  `InitiatorTransactionKey` varchar(128) DEFAULT NULL,
  `AuthorizationDateTime` datetime DEFAULT NULL,
  `CaptureLocalDateTime` datetime DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_stone_account_transaction_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_stone_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_stone_bank_account`
--

DROP TABLE IF EXISTS `conn_item_stone_bank_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_stone_bank_account` (
  `item_id` int(10) unsigned NOT NULL,
  `BankCode` decimal(4,0) DEFAULT NULL,
  `BankBranch` varchar(10) DEFAULT NULL,
  `BankAccountNumber` varchar(12) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_stone_bank_account_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_stone_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_stone_chargeback`
--

DROP TABLE IF EXISTS `conn_item_stone_chargeback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_stone_chargeback` (
  `item_id` int(10) unsigned NOT NULL,
  `Id` decimal(13,0) DEFAULT NULL,
  `Amount` decimal(20,2) DEFAULT NULL,
  `Date_` date DEFAULT NULL,
  `ChargeDate` date DEFAULT NULL,
  `ReasonCode` decimal(8,0) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_stone_chargeback_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_stone_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_stone_chargeback_refund`
--

DROP TABLE IF EXISTS `conn_item_stone_chargeback_refund`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_stone_chargeback_refund` (
  `item_id` int(10) unsigned NOT NULL,
  `Id` decimal(13,0) DEFAULT NULL,
  `Amount` decimal(20,2) DEFAULT NULL,
  `Date_` date DEFAULT NULL,
  `PaymentDate` date DEFAULT NULL,
  `ReasonCode` decimal(8,0) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_stone_chargeback_refund_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_stone_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_stone_events_count`
--

DROP TABLE IF EXISTS `conn_item_stone_events_count`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_stone_events_count` (
  `item_id` int(10) unsigned NOT NULL,
  `CancellationCharges` decimal(9,0) DEFAULT NULL,
  `Cancellations` decimal(9,0) DEFAULT NULL,
  `Captures` decimal(9,0) DEFAULT NULL,
  `ChargebackRefunds` decimal(9,0) DEFAULT NULL,
  `Chargebacks` decimal(9,0) DEFAULT NULL,
  `Payments` decimal(9,0) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_stone_events_count_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_stone_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_stone_financial_billing`
--

DROP TABLE IF EXISTS `conn_item_stone_financial_billing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_stone_financial_billing` (
  `item_id` int(10) unsigned NOT NULL,
  `ChargedAmount` decimal(20,2) DEFAULT NULL,
  `PrevisionChargeDate` date DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_stone_financial_billing_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_stone_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_stone_financial_cancellation`
--

DROP TABLE IF EXISTS `conn_item_stone_financial_cancellation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_stone_financial_cancellation` (
  `item_id` int(10) unsigned NOT NULL,
  `InstallmentNumber` decimal(2,0) DEFAULT NULL,
  `OperationKey` varchar(32) DEFAULT NULL,
  `CancellationDateTime` datetime DEFAULT NULL,
  `ReturnedAmount` decimal(20,2) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_stone_financial_cancellation_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_stone_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_stone_financial_event`
--

DROP TABLE IF EXISTS `conn_item_stone_financial_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_stone_financial_event` (
  `item_id` int(10) unsigned NOT NULL,
  `EventId` varchar(60) DEFAULT NULL,
  `Description` varchar(60) DEFAULT NULL,
  `Type` decimal(2,0) DEFAULT NULL,
  `PrevisionPaymentDate` date DEFAULT NULL,
  `Amount` decimal(20,2) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_stone_financial_event_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_stone_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_stone_financial_installment`
--

DROP TABLE IF EXISTS `conn_item_stone_financial_installment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_stone_financial_installment` (
  `item_id` int(10) unsigned NOT NULL,
  `InstallmentNumber` decimal(2,0) DEFAULT NULL,
  `GrossAmount` decimal(20,2) DEFAULT NULL,
  `NetAmount` decimal(20,2) DEFAULT NULL,
  `PrevisionPaymentDate` date DEFAULT NULL,
  `SuspendedByChargeback` tinyint(1) DEFAULT NULL,
  `OriginalPaymentDate` date DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_stone_financial_installment_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_stone_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_stone_financial_transaction`
--

DROP TABLE IF EXISTS `conn_item_stone_financial_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_stone_financial_transaction` (
  `item_id` int(10) unsigned NOT NULL,
  `AcquirerTransactionKey` decimal(14,0) DEFAULT NULL,
  `InitiatorTransactionKey` varchar(128) DEFAULT NULL,
  `AuthorizationDateTime` datetime DEFAULT NULL,
  `CaptureLocalDateTime` datetime DEFAULT NULL,
  `International` tinyint(1) DEFAULT NULL,
  `AccountType` varchar(4) DEFAULT NULL,
  `InstallmentType` varchar(60) DEFAULT NULL,
  `NumberOfInstallments` decimal(4,0) DEFAULT NULL,
  `AuthorizedAmount` decimal(20,2) DEFAULT NULL,
  `CapturedAmount` decimal(20,2) DEFAULT NULL,
  `CanceledAmount` decimal(20,2) DEFAULT NULL,
  `AuthorizationCurrencyCode` decimal(4,0) DEFAULT NULL,
  `IssuerAuthorizationCode` varchar(6) DEFAULT NULL,
  `BrandId` decimal(3,0) DEFAULT NULL,
  `CardNumber` varchar(19) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  KEY `idx_transaction_key` (`AcquirerTransactionKey`,`InitiatorTransactionKey`),
  CONSTRAINT `conn_item_stone_financial_transaction_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_stone_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_stone_header`
--

DROP TABLE IF EXISTS `conn_item_stone_header`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_stone_header` (
  `item_id` int(10) unsigned NOT NULL,
  `GenerationDateTime` datetime NOT NULL,
  `StoneCode` decimal(9,0) NOT NULL,
  `LayoutVersion` decimal(3,0) NOT NULL,
  `FileId` decimal(26,0) NOT NULL,
  `ReferenceDate` date NOT NULL,
  PRIMARY KEY (`item_id`),
  KEY `idx_ref_date` (`ReferenceDate`),
  KEY `idx_stonecode` (`StoneCode`,`ReferenceDate`),
  CONSTRAINT `conn_item_stone_header_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_stone_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_stone_line`
--

DROP TABLE IF EXISTS `conn_item_stone_line`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_stone_line` (
  `item_id` int(10) unsigned NOT NULL,
  `registertype` varchar(50) DEFAULT NULL,
  `masterid` int(10) unsigned DEFAULT NULL,
  `status` varchar(1) DEFAULT NULL,
  `bank_account_mask` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  KEY `masterid` (`masterid`),
  CONSTRAINT `conn_item_stone_line_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `vooo_prod_backend`.`connection_item` (`item_id`),
  CONSTRAINT `conn_item_stone_line_ibfk_2` FOREIGN KEY (`masterid`) REFERENCES `conn_item_stone_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_stone_payment`
--

DROP TABLE IF EXISTS `conn_item_stone_payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_stone_payment` (
  `item_id` int(10) unsigned NOT NULL,
  `Id` decimal(13,0) DEFAULT NULL,
  `TotalAmount` decimal(20,2) DEFAULT NULL,
  `TotalFinancialAccountsAmount` decimal(24,2) DEFAULT NULL,
  `LastNegativeAmount` decimal(24,2) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_stone_payment_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_stone_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_stone_poi`
--

DROP TABLE IF EXISTS `conn_item_stone_poi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_stone_poi` (
  `item_id` int(10) unsigned NOT NULL,
  `PoiType` decimal(4,0) DEFAULT NULL,
  `SerialNumber` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_stone_poi_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_stone_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_stone_trailer`
--

DROP TABLE IF EXISTS `conn_item_stone_trailer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_stone_trailer` (
  `item_id` int(10) unsigned NOT NULL,
  `CapturedTransactionsQuantity` decimal(9,0) DEFAULT NULL,
  `CanceledTransactionsQuantity` decimal(9,0) DEFAULT NULL,
  `PaidInstallmentsQuantity` decimal(9,0) DEFAULT NULL,
  `ChargedCancellationsQuantity` decimal(9,0) DEFAULT NULL,
  `ChargebacksQuantity` decimal(9,0) DEFAULT NULL,
  `ChargebacksRefundQuantity` decimal(9,0) DEFAULT NULL,
  `ChargedChargebacksQuantity` decimal(9,0) DEFAULT NULL,
  `PaidChargebacksRefundQuantity` decimal(9,0) DEFAULT NULL,
  `PaidEventsQuantity` decimal(9,0) DEFAULT NULL,
  `ChargedEventsQuantity` decimal(9,0) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_stone_trailer_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_stone_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_ticket_cv`
--

DROP TABLE IF EXISTS `conn_item_ticket_cv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_ticket_cv` (
  `item_id` int(10) unsigned NOT NULL,
  `tiporegistro` decimal(1,0) DEFAULT NULL,
  `codigo_ec` varchar(15) DEFAULT NULL,
  `num_rv` decimal(9,0) DEFAULT NULL,
  `nsu_adquirente` decimal(12,0) DEFAULT NULL,
  `data_transacao` date DEFAULT NULL,
  `hora_transacao` time DEFAULT NULL,
  `num_cartao` varchar(19) DEFAULT NULL,
  `valor_transacao` decimal(12,2) DEFAULT NULL,
  `valor_saque` decimal(12,2) DEFAULT NULL,
  `valor_taxa_servico` decimal(12,2) DEFAULT NULL,
  `num_parcelas` decimal(2,0) DEFAULT NULL,
  `num_da_parcela` decimal(2,0) DEFAULT NULL,
  `valor_parcela` decimal(12,2) DEFAULT NULL,
  `data_pagamento` date DEFAULT NULL,
  `codigo_autorizacao` varchar(10) DEFAULT NULL,
  `forma_captura` varchar(3) DEFAULT NULL,
  `codigo_rede_captura` decimal(5,0) DEFAULT NULL,
  `apelido_rede_captura` varchar(12) DEFAULT NULL,
  `indicador_tipo_transacao` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_ticket_cv_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_ticket_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_ticket_header`
--

DROP TABLE IF EXISTS `conn_item_ticket_header`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_ticket_header` (
  `item_id` int(10) unsigned NOT NULL,
  `tiporegistro` decimal(1,0) DEFAULT NULL,
  `datacriacao` date DEFAULT NULL,
  `horacriacao` time DEFAULT NULL,
  `datareferencia` date DEFAULT NULL,
  `arquivoversao` varchar(8) DEFAULT NULL,
  `codigo_ec` decimal(15,0) DEFAULT NULL,
  `cnpj_adquirente` decimal(14,0) DEFAULT NULL,
  `nome_adquirente` varchar(20) DEFAULT NULL,
  `sequencia` decimal(9,0) DEFAULT NULL,
  `tipo_extrato` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  KEY `idx_codigo_ec` (`codigo_ec`),
  CONSTRAINT `conn_item_ticket_header_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_ticket_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_ticket_line`
--

DROP TABLE IF EXISTS `conn_item_ticket_line`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_ticket_line` (
  `item_id` int(10) unsigned NOT NULL,
  `registertype` decimal(1,0) NOT NULL,
  `cardbin` decimal(6,0) DEFAULT NULL,
  `masterid` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  KEY `masterid` (`masterid`),
  CONSTRAINT `conn_item_ticket_line_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `vooo_prod_backend`.`connection_item` (`item_id`),
  CONSTRAINT `conn_item_ticket_line_ibfk_2` FOREIGN KEY (`masterid`) REFERENCES `conn_item_ticket_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_ticket_rf`
--

DROP TABLE IF EXISTS `conn_item_ticket_rf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_ticket_rf` (
  `item_id` int(10) unsigned NOT NULL,
  `tiporegistro` decimal(1,0) DEFAULT NULL,
  `codigo_ec` decimal(15,0) DEFAULT NULL,
  `num_rv` decimal(9,0) DEFAULT NULL,
  `data_pagamento` date DEFAULT NULL,
  `valor` decimal(15,2) DEFAULT NULL,
  `indicativo_debito_ou_credito` varchar(1) DEFAULT NULL,
  `descricao_tarifa` varchar(35) DEFAULT NULL,
  `codigo_tipo_tarifa` decimal(5,0) DEFAULT NULL,
  `quantidade_parcelas` decimal(5,0) DEFAULT NULL,
  `porcentagem` decimal(5,2) DEFAULT NULL,
  `diferenca_dias` decimal(5,0) DEFAULT NULL,
  `porcentagem_solicitado_adiantamento` decimal(5,2) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_ticket_rf_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_ticket_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_ticket_rv`
--

DROP TABLE IF EXISTS `conn_item_ticket_rv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_ticket_rv` (
  `item_id` int(10) unsigned NOT NULL,
  `tiporegistro` decimal(1,0) DEFAULT NULL,
  `codigo_ec` decimal(15,0) DEFAULT NULL,
  `codigo_produto` varchar(2) DEFAULT NULL,
  `numero_rv` decimal(9,0) DEFAULT NULL,
  `data_rv` date DEFAULT NULL,
  `data_pagamento_rv` date DEFAULT NULL,
  `banco` decimal(3,0) DEFAULT NULL,
  `agencia` decimal(6,0) DEFAULT NULL,
  `conta_corrente` decimal(11,0) DEFAULT NULL,
  `qtd_cv_aceitos` decimal(9,0) DEFAULT NULL,
  `qtd_cv_rejeitados` decimal(9,0) DEFAULT NULL,
  `valor_bruto` decimal(12,2) DEFAULT NULL,
  `valor_liquido` decimal(12,2) DEFAULT NULL,
  `taxa_servico` decimal(12,2) DEFAULT NULL,
  `taxa_comissao` decimal(12,2) DEFAULT NULL,
  `valor_rejeitado` decimal(12,2) DEFAULT NULL,
  `valor_credito` decimal(12,2) DEFAULT NULL,
  `valor_encargos` decimal(12,2) DEFAULT NULL,
  `tipo_pagamento` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_ticket_rv_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_ticket_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_ticket_trailer`
--

DROP TABLE IF EXISTS `conn_item_ticket_trailer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_ticket_trailer` (
  `item_id` int(10) unsigned NOT NULL,
  `tiporegistro` decimal(1,0) DEFAULT NULL,
  `qtd_registros` decimal(9,0) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_ticket_trailer_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_ticket_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_totvs_control`
--

DROP TABLE IF EXISTS `conn_item_totvs_control`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_totvs_control` (
  `item_id` int(10) unsigned NOT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `check_status` decimal(1,0) DEFAULT NULL,
  `registers` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  KEY `ix_vooo_prod_rawdata_conn_item_totvs_control_start_date` (`start_date`),
  KEY `ix_vooo_prod_rawdata_conn_item_totvs_control_end_date` (`end_date`),
  CONSTRAINT `conn_item_totvs_control_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_totvs_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_totvs_line`
--

DROP TABLE IF EXISTS `conn_item_totvs_line`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_totvs_line` (
  `item_id` int(10) unsigned NOT NULL,
  `register_type` varchar(15) DEFAULT NULL,
  `masterid` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  KEY `masterid` (`masterid`),
  CONSTRAINT `conn_item_totvs_line_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `vooo_prod_backend`.`connection_item` (`item_id`),
  CONSTRAINT `conn_item_totvs_line_ibfk_2` FOREIGN KEY (`masterid`) REFERENCES `conn_item_totvs_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_totvs_transaction`
--

DROP TABLE IF EXISTS `conn_item_totvs_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_totvs_transaction` (
  `item_id` int(10) unsigned NOT NULL,
  `filial` varchar(5) DEFAULT NULL,
  `documento` varchar(8) DEFAULT NULL,
  `forma_pagamento` varchar(5) DEFAULT NULL,
  `emissao` date DEFAULT NULL,
  `sinal` varchar(1) DEFAULT NULL,
  `valor` decimal(10,2) DEFAULT NULL,
  `nsu_host` varchar(10) DEFAULT NULL,
  `nsu_tef` varchar(10) DEFAULT NULL,
  `hora_tef` time DEFAULT NULL,
  `autorizacao` varchar(10) DEFAULT NULL,
  `pedido` decimal(10,0) DEFAULT NULL,
  `qtd_parcelas` decimal(2,0) DEFAULT NULL,
  `cliente` varchar(20) DEFAULT NULL,
  `hora` time DEFAULT NULL,
  `external_id` varchar(20) DEFAULT NULL,
  `loja` varchar(3) DEFAULT NULL,
  `status` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  KEY `idx_totvs_transaction_2` (`valor`,`emissao`,`hora`),
  KEY `idx_totvs_transaction_3` (`external_id`,`emissao`),
  KEY `idx_totvs_transaction` (`pedido`,`emissao`,`documento`,`filial`,`forma_pagamento`,`nsu_host`,`external_id`),
  KEY `idx_totvs_nsu_host` (`nsu_host`),
  CONSTRAINT `conn_item_totvs_transaction_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_totvs_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_tricard_ajustes`
--

DROP TABLE IF EXISTS `conn_item_tricard_ajustes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_tricard_ajustes` (
  `item_id` int(10) unsigned NOT NULL,
  `tiporegistro` decimal(3,0) DEFAULT NULL,
  `numeropvajustado` decimal(9,0) DEFAULT NULL,
  `numerorvajustado` decimal(9,0) DEFAULT NULL,
  `dataajuste` date DEFAULT NULL,
  `valorajuste` decimal(15,2) DEFAULT NULL,
  `debitocredito` varchar(1) DEFAULT NULL,
  `motivoajuste` decimal(3,0) DEFAULT NULL,
  `motivoajustedesc` varchar(28) DEFAULT NULL,
  `numerocartao` varchar(16) DEFAULT NULL,
  `datatransacao` date DEFAULT NULL,
  `numerorvoriginal` decimal(9,0) DEFAULT NULL,
  `numeroreferencia` varchar(15) DEFAULT NULL,
  `datacarta` date DEFAULT NULL,
  `mesreferencia` varchar(6) DEFAULT NULL,
  `numeropvoriginal` decimal(9,0) DEFAULT NULL,
  `datarvoriginal` date DEFAULT NULL,
  `valortransacao` decimal(15,2) DEFAULT NULL,
  `desagendamentonet` varchar(1) DEFAULT NULL,
  `datacredito` date DEFAULT NULL,
  `valornovoparcela` decimal(15,2) DEFAULT NULL,
  `valororiginalparcela` decimal(15,2) DEFAULT NULL,
  `valorbrutorovenda` decimal(15,2) DEFAULT NULL,
  `valorcancelamentosolicitado` decimal(15,2) DEFAULT NULL,
  `numeronsu` decimal(12,0) DEFAULT NULL,
  `autorizacao` decimal(6,0) DEFAULT NULL,
  `tipodebito` varchar(1) DEFAULT NULL,
  `numeroordemdebito` decimal(11,0) DEFAULT NULL,
  `valordebitototal` decimal(15,2) DEFAULT NULL,
  `valorpendente` decimal(15,2) DEFAULT NULL,
  `filler1` varchar(1) DEFAULT NULL,
  `zero` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_tricard_ajustes_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_tricard_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_tricard_creditos`
--

DROP TABLE IF EXISTS `conn_item_tricard_creditos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_tricard_creditos` (
  `item_id` int(10) unsigned NOT NULL,
  `tiporegistro` decimal(3,0) DEFAULT NULL,
  `pvcreditado` decimal(9,0) DEFAULT NULL,
  `numerodocumento` decimal(11,0) DEFAULT NULL,
  `datalancamento` date DEFAULT NULL,
  `valorlancamento` decimal(15,2) DEFAULT NULL,
  `creditodebito` varchar(1) DEFAULT NULL,
  `banco` decimal(3,0) DEFAULT NULL,
  `agencia` decimal(6,0) DEFAULT NULL,
  `contacorrente` decimal(11,0) DEFAULT NULL,
  `datamovimento` date DEFAULT NULL,
  `numerorv` decimal(9,0) DEFAULT NULL,
  `datatransacao` date DEFAULT NULL,
  `filler1` decimal(1,0) DEFAULT NULL,
  `tipotransacao` decimal(1,0) DEFAULT NULL,
  `valorbruto` decimal(15,2) DEFAULT NULL,
  `valordesconto` decimal(15,2) DEFAULT NULL,
  `parcela` varchar(5) DEFAULT NULL,
  `statuscredito` varchar(2) DEFAULT NULL,
  `pvoriginal` decimal(9,0) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_tricard_creditos_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_tricard_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_tricard_cv_parcelado`
--

DROP TABLE IF EXISTS `conn_item_tricard_cv_parcelado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_tricard_cv_parcelado` (
  `item_id` int(10) unsigned NOT NULL,
  `tiporegistro` decimal(3,0) DEFAULT NULL,
  `numeropv` decimal(9,0) DEFAULT NULL,
  `numerorv` decimal(9,0) DEFAULT NULL,
  `datavenda` date DEFAULT NULL,
  `filler1` decimal(8,0) DEFAULT NULL,
  `valorcvnsu` decimal(15,2) DEFAULT NULL,
  `valorgorjeta` decimal(15,2) DEFAULT NULL,
  `numerocartao` varchar(16) DEFAULT NULL,
  `filler2` varchar(3) DEFAULT NULL,
  `numeroparcelas` decimal(2,0) DEFAULT NULL,
  `numerocvnsu` decimal(12,0) DEFAULT NULL,
  `numeroreferencia` varchar(13) DEFAULT NULL,
  `valordesconto` decimal(15,2) DEFAULT NULL,
  `autorizacao` varchar(6) DEFAULT NULL,
  `horatransacao` time DEFAULT NULL,
  `bihete1` varchar(16) DEFAULT NULL,
  `bihete2` varchar(16) DEFAULT NULL,
  `bihete3` varchar(16) DEFAULT NULL,
  `bihete4` varchar(16) DEFAULT NULL,
  `tipocaptura` varchar(1) DEFAULT NULL,
  `valorliquido` decimal(15,2) DEFAULT NULL,
  `valorprimeiraparcela` decimal(15,2) DEFAULT NULL,
  `valordemaisparcelas` decimal(15,2) DEFAULT NULL,
  `terminal` varchar(8) DEFAULT NULL,
  `pais` varchar(3) DEFAULT NULL,
  `zero` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_tricard_cv_parcelado_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_tricard_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_tricard_cv_rotativo`
--

DROP TABLE IF EXISTS `conn_item_tricard_cv_rotativo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_tricard_cv_rotativo` (
  `item_id` int(10) unsigned NOT NULL,
  `tiporegistro` decimal(3,0) DEFAULT NULL,
  `numeropv` decimal(9,0) DEFAULT NULL,
  `numerorv` decimal(9,0) DEFAULT NULL,
  `datavenda` date DEFAULT NULL,
  `filler1` decimal(8,0) DEFAULT NULL,
  `valorcvnsu` decimal(15,2) DEFAULT NULL,
  `valorgorjeta` decimal(15,2) DEFAULT NULL,
  `numerocartao` varchar(16) DEFAULT NULL,
  `filler2` varchar(3) DEFAULT NULL,
  `numerocvnsu` decimal(12,0) DEFAULT NULL,
  `numeroreferencia` varchar(13) DEFAULT NULL,
  `valordesconto` decimal(15,2) DEFAULT NULL,
  `autorizacao` varchar(6) DEFAULT NULL,
  `horatransacao` time DEFAULT NULL,
  `bihete1` varchar(16) DEFAULT NULL,
  `bihete2` varchar(16) DEFAULT NULL,
  `bihete3` varchar(16) DEFAULT NULL,
  `bihete4` varchar(16) DEFAULT NULL,
  `tipocaptura` varchar(1) DEFAULT NULL,
  `valorliquido` decimal(15,2) DEFAULT NULL,
  `terminal` varchar(8) DEFAULT NULL,
  `pais` varchar(3) DEFAULT NULL,
  `zero` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_tricard_cv_rotativo_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_tricard_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_tricard_header`
--

DROP TABLE IF EXISTS `conn_item_tricard_header`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_tricard_header` (
  `item_id` int(10) unsigned NOT NULL,
  `tiporegistro` decimal(3,0) DEFAULT NULL,
  `dataemissao` date DEFAULT NULL,
  `adquirente` varchar(8) DEFAULT NULL,
  `tipoextrato` varchar(34) DEFAULT NULL,
  `nomecomercial` varchar(22) DEFAULT NULL,
  `sequencia` decimal(6,0) DEFAULT NULL,
  `pvgrupomatriz` decimal(9,0) DEFAULT NULL,
  `tipomovimento` varchar(15) DEFAULT NULL,
  `versaoarquivo` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_tricard_header_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_tricard_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_tricard_header_matriz`
--

DROP TABLE IF EXISTS `conn_item_tricard_header_matriz`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_tricard_header_matriz` (
  `item_id` int(10) unsigned NOT NULL,
  `tiporegistro` decimal(3,0) DEFAULT NULL,
  `pvmatriz` varchar(9) DEFAULT NULL,
  `nomecomercial` varchar(22) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_tricard_header_matriz_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_tricard_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_tricard_line`
--

DROP TABLE IF EXISTS `conn_item_tricard_line`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_tricard_line` (
  `item_id` int(10) unsigned NOT NULL,
  `registertype` decimal(3,0) NOT NULL,
  `masterid` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  KEY `masterid` (`masterid`),
  CONSTRAINT `conn_item_tricard_line_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `vooo_prod_backend`.`connection_item` (`item_id`),
  CONSTRAINT `conn_item_tricard_line_ibfk_2` FOREIGN KEY (`masterid`) REFERENCES `conn_item_tricard_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_tricard_parcelas`
--

DROP TABLE IF EXISTS `conn_item_tricard_parcelas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_tricard_parcelas` (
  `item_id` int(10) unsigned NOT NULL,
  `tiporegistro` decimal(3,0) DEFAULT NULL,
  `numeropv` decimal(9,0) DEFAULT NULL,
  `numerorv` decimal(9,0) DEFAULT NULL,
  `datavenda` date DEFAULT NULL,
  `filler1` varchar(8) DEFAULT NULL,
  `parcela` decimal(2,0) DEFAULT NULL,
  `valorbruto` decimal(15,2) DEFAULT NULL,
  `valordesconto` decimal(15,2) DEFAULT NULL,
  `valorliquido` decimal(15,2) DEFAULT NULL,
  `datacredito` date DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_tricard_parcelas_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_tricard_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_tricard_rv_parcelado`
--

DROP TABLE IF EXISTS `conn_item_tricard_rv_parcelado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_tricard_rv_parcelado` (
  `item_id` int(10) unsigned NOT NULL,
  `tiporegistro` decimal(3,0) DEFAULT NULL,
  `numeropv` decimal(9,0) DEFAULT NULL,
  `numerorv` decimal(9,0) DEFAULT NULL,
  `banco` decimal(3,0) DEFAULT NULL,
  `agencia` decimal(5,0) DEFAULT NULL,
  `contacorrente` decimal(11,0) DEFAULT NULL,
  `datavenda` date DEFAULT NULL,
  `qtdeacatado` decimal(5,0) DEFAULT NULL,
  `valorbruto` decimal(15,2) DEFAULT NULL,
  `valorgorjeta` decimal(15,2) DEFAULT NULL,
  `valorrejeitado` decimal(15,2) DEFAULT NULL,
  `valordesconto` decimal(15,2) DEFAULT NULL,
  `valorliquido` decimal(15,2) DEFAULT NULL,
  `dataprimeiraparcela` date DEFAULT NULL,
  `zero` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_tricard_rv_parcelado_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_tricard_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_tricard_rv_rotativo`
--

DROP TABLE IF EXISTS `conn_item_tricard_rv_rotativo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_tricard_rv_rotativo` (
  `item_id` int(10) unsigned NOT NULL,
  `tiporegistro` decimal(3,0) DEFAULT NULL,
  `numeropv` decimal(9,0) DEFAULT NULL,
  `numerorv` decimal(9,0) DEFAULT NULL,
  `banco` decimal(3,0) DEFAULT NULL,
  `agencia` decimal(5,0) DEFAULT NULL,
  `contacorrente` decimal(11,0) DEFAULT NULL,
  `datavenda` date DEFAULT NULL,
  `qtdeacatado` decimal(5,0) DEFAULT NULL,
  `valorbruto` decimal(15,2) DEFAULT NULL,
  `valorgorjeta` decimal(15,2) DEFAULT NULL,
  `valorrejeitado` decimal(15,2) DEFAULT NULL,
  `valordesconto` decimal(15,2) DEFAULT NULL,
  `valorliquido` decimal(15,2) DEFAULT NULL,
  `datacredito` date DEFAULT NULL,
  `zero` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_tricard_rv_rotativo_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_tricard_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_tricard_totalizador_creditos`
--

DROP TABLE IF EXISTS `conn_item_tricard_totalizador_creditos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_tricard_totalizador_creditos` (
  `item_id` int(10) unsigned NOT NULL,
  `tiporegistro` decimal(3,0) DEFAULT NULL,
  `numeropv` decimal(9,0) DEFAULT NULL,
  `filler1` varchar(7) DEFAULT NULL,
  `datacredito` date DEFAULT NULL,
  `valorcredito` decimal(15,2) DEFAULT NULL,
  `banco` decimal(3,0) DEFAULT NULL,
  `agencia` decimal(6,0) DEFAULT NULL,
  `contacorrente` decimal(11,0) DEFAULT NULL,
  `dataarquivo` date DEFAULT NULL,
  `datacreditoantecipado` date DEFAULT NULL,
  `valorantecipado` decimal(15,2) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_tricard_totalizador_creditos_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_tricard_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_tricard_trailer`
--

DROP TABLE IF EXISTS `conn_item_tricard_trailer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_tricard_trailer` (
  `item_id` int(10) unsigned NOT NULL,
  `tiporegistro` decimal(3,0) DEFAULT NULL,
  `qtdematrizes` decimal(4,0) DEFAULT NULL,
  `qtderegistros` decimal(6,0) DEFAULT NULL,
  `pvgrupo` varchar(9) DEFAULT NULL,
  `valorbruto` decimal(15,2) DEFAULT NULL,
  `qtderejeitados` decimal(6,0) DEFAULT NULL,
  `valorrejeitado` decimal(15,2) DEFAULT NULL,
  `valorrotativo` decimal(15,2) DEFAULT NULL,
  `valorparcelado` decimal(15,2) DEFAULT NULL,
  `filler1` decimal(15,0) DEFAULT NULL,
  `filler2` decimal(15,0) DEFAULT NULL,
  `valordesconto` decimal(15,2) DEFAULT NULL,
  `valorliquido` decimal(15,2) DEFAULT NULL,
  `valorgorjeta` decimal(15,2) DEFAULT NULL,
  `valortaxaembarque` decimal(15,2) DEFAULT NULL,
  `qtdeacatados` decimal(6,0) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_tricard_trailer_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_tricard_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_tricard_trailer_financeiro`
--

DROP TABLE IF EXISTS `conn_item_tricard_trailer_financeiro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_tricard_trailer_financeiro` (
  `item_id` int(10) unsigned NOT NULL,
  `tiporegistro` decimal(3,0) DEFAULT NULL,
  `qtdematrizes` decimal(4,0) DEFAULT NULL,
  `qtderegistros` decimal(6,0) DEFAULT NULL,
  `pvgrupo` varchar(9) DEFAULT NULL,
  `creditosnormais` decimal(6,0) DEFAULT NULL,
  `valorcreditosnormais` decimal(15,2) DEFAULT NULL,
  `creditosantecipados` decimal(6,0) DEFAULT NULL,
  `valorcreditosantecipados` decimal(15,2) DEFAULT NULL,
  `ajustescredito` decimal(4,0) DEFAULT NULL,
  `valorajustescredito` decimal(15,2) DEFAULT NULL,
  `ajustesdebito` decimal(4,0) DEFAULT NULL,
  `valorajustesdebito` decimal(15,2) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_tricard_trailer_financeiro_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_tricard_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_tricard_trailer_matriz`
--

DROP TABLE IF EXISTS `conn_item_tricard_trailer_matriz`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_tricard_trailer_matriz` (
  `item_id` int(10) unsigned NOT NULL,
  `tiporegistro` decimal(3,0) DEFAULT NULL,
  `pvmatriz` varchar(9) DEFAULT NULL,
  `valorbruto` decimal(15,2) DEFAULT NULL,
  `qtderejeitados` decimal(6,0) DEFAULT NULL,
  `valorrejeitado` decimal(15,2) DEFAULT NULL,
  `valorrotativo` decimal(15,2) DEFAULT NULL,
  `valorparcelado` decimal(15,2) DEFAULT NULL,
  `filler1` decimal(15,0) DEFAULT NULL,
  `filler2` decimal(15,0) DEFAULT NULL,
  `valordesconto` decimal(15,2) DEFAULT NULL,
  `valorliquido` decimal(15,2) DEFAULT NULL,
  `valorgorjeta` decimal(15,2) DEFAULT NULL,
  `valortaxaembarque` decimal(15,2) DEFAULT NULL,
  `qtdeacatados` decimal(6,0) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_tricard_trailer_matriz_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_tricard_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_tricard_trailer_matriz_financeiro`
--

DROP TABLE IF EXISTS `conn_item_tricard_trailer_matriz_financeiro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_tricard_trailer_matriz_financeiro` (
  `item_id` int(10) unsigned NOT NULL,
  `tiporegistro` decimal(3,0) DEFAULT NULL,
  `pvmatriz` varchar(9) DEFAULT NULL,
  `creditosnormais` decimal(6,0) DEFAULT NULL,
  `valorcreditosnormais` decimal(15,2) DEFAULT NULL,
  `creditosantecipados` decimal(6,0) DEFAULT NULL,
  `valorcreditosantecipados` decimal(15,2) DEFAULT NULL,
  `ajustescredito` decimal(4,0) DEFAULT NULL,
  `valorajustescredito` decimal(15,2) DEFAULT NULL,
  `ajustesdebito` decimal(4,0) DEFAULT NULL,
  `valorajustesdebito` decimal(15,2) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_tricard_trailer_matriz_financeiro_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_tricard_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_unidas_ajuste`
--

DROP TABLE IF EXISTS `conn_item_unidas_ajuste`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_unidas_ajuste` (
  `item_id` int(10) unsigned NOT NULL,
  `tiporegistro` varchar(2) DEFAULT NULL,
  `codigo_ec` decimal(15,0) DEFAULT NULL,
  `nsu_transacao_original` varchar(40) DEFAULT NULL,
  `data_transacao_original` date DEFAULT NULL,
  `num_da_parcela` decimal(2,0) DEFAULT NULL,
  `nsu_transacao` varchar(40) DEFAULT NULL,
  `data_transacao_ajuste` date DEFAULT NULL,
  `hora_transacao_ajuste` time DEFAULT NULL,
  `tipo_lancamento` decimal(1,0) DEFAULT NULL,
  `data_lancamento` date DEFAULT NULL,
  `forma_captura` decimal(1,0) DEFAULT NULL,
  `tipo_ajuste` decimal(1,0) DEFAULT NULL,
  `codigo_ajuste` decimal(3,0) DEFAULT NULL,
  `descricao_ajuste` varchar(30) DEFAULT NULL,
  `valor_bruto` decimal(11,2) DEFAULT NULL,
  `valor_desconto` decimal(11,2) DEFAULT NULL,
  `valor_liquido` decimal(11,2) DEFAULT NULL,
  `banco` decimal(3,0) DEFAULT NULL,
  `agencia` decimal(6,0) DEFAULT NULL,
  `conta_corrente` varchar(11) DEFAULT NULL,
  `num_cartao` varchar(19) DEFAULT NULL,
  `codigo_bandeira` varchar(3) DEFAULT NULL,
  `codigo_produto` varchar(3) DEFAULT NULL,
  `valor_bruto_parcela` decimal(11,2) DEFAULT NULL,
  `valor_liquido_parcela` decimal(11,2) DEFAULT NULL,
  `codigo_pedido` varchar(36) DEFAULT NULL,
  `codigo_autorizacao` varchar(36) DEFAULT NULL,
  `num_parcelas` decimal(2,0) DEFAULT NULL,
  `sequencia_registro` decimal(6,0) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_unidas_ajuste_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_unidas_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_unidas_cancel`
--

DROP TABLE IF EXISTS `conn_item_unidas_cancel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_unidas_cancel` (
  `item_id` int(10) unsigned NOT NULL,
  `tiporegistro` varchar(2) DEFAULT NULL,
  `codigo_ec` decimal(15,0) DEFAULT NULL,
  `nsu_transacao_original` varchar(40) DEFAULT NULL,
  `data_transacao_original` date DEFAULT NULL,
  `num_da_parcela` decimal(2,0) DEFAULT NULL,
  `nsu_transacao` varchar(40) DEFAULT NULL,
  `data_transacao_cancelamento` date DEFAULT NULL,
  `hora_transacao_cancelamento` time DEFAULT NULL,
  `forma_captura` decimal(1,0) DEFAULT NULL,
  `codigo_pedido` varchar(36) DEFAULT NULL,
  `codigo_autorizacao` varchar(40) DEFAULT NULL,
  `valor_bruto` decimal(11,2) DEFAULT NULL,
  `valor_liquido` decimal(11,2) DEFAULT NULL,
  `valor_bruto_parcela` decimal(11,2) DEFAULT NULL,
  `valor_liquido_parcela` decimal(11,2) DEFAULT NULL,
  `codigo_ajuste` decimal(3,0) DEFAULT NULL,
  `descricao_ajuste` varchar(30) DEFAULT NULL,
  `num_parcelas` decimal(2,0) DEFAULT NULL,
  `sequencia_registro` decimal(6,0) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_unidas_cancel_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_unidas_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_unidas_cv`
--

DROP TABLE IF EXISTS `conn_item_unidas_cv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_unidas_cv` (
  `item_id` int(10) unsigned NOT NULL,
  `tipo_registro` varchar(2) DEFAULT NULL,
  `codigo_ec` decimal(15,0) DEFAULT NULL,
  `nsu_adquirente` varchar(40) DEFAULT NULL,
  `data_transacao` date DEFAULT NULL,
  `hora_transacao` time DEFAULT NULL,
  `tipo_lancamento` decimal(1,0) DEFAULT NULL,
  `data_pagamento` date DEFAULT NULL,
  `tipo_produto` varchar(1) DEFAULT NULL,
  `forma_captura` decimal(1,0) DEFAULT NULL,
  `valor_bruto` decimal(11,2) DEFAULT NULL,
  `valor_desconto` decimal(11,2) DEFAULT NULL,
  `valor_liquido` decimal(11,2) DEFAULT NULL,
  `num_cartao` varchar(19) DEFAULT NULL,
  `num_da_parcela` decimal(2,0) DEFAULT NULL,
  `num_parcelas` decimal(2,0) DEFAULT NULL,
  `nsu_parcela` varchar(40) DEFAULT NULL,
  `valor_bruto_parcela` decimal(11,2) DEFAULT NULL,
  `valor_desconto_parcela` decimal(11,2) DEFAULT NULL,
  `valor_liquido_parcela` decimal(11,2) DEFAULT NULL,
  `banco` decimal(3,0) DEFAULT NULL,
  `agencia` decimal(6,0) DEFAULT NULL,
  `conta_corrente` varchar(11) DEFAULT NULL,
  `codigo_autorizacao` varchar(40) DEFAULT NULL,
  `codigo_bandeira` varchar(3) DEFAULT NULL,
  `codigo_produto` varchar(3) DEFAULT NULL,
  `valor_taxa_1` decimal(11,2) DEFAULT NULL,
  `valor_taxa_2` decimal(11,2) DEFAULT NULL,
  `valor_taxa_1_parcela` decimal(11,2) DEFAULT NULL,
  `valor_taxa_2_parcela` decimal(11,2) DEFAULT NULL,
  `filler_1` decimal(11,0) DEFAULT NULL,
  `valor_taxa_antecipacao` decimal(11,2) DEFAULT NULL,
  `valor_liquido_antecipado` decimal(11,2) DEFAULT NULL,
  `filler_2` decimal(2,0) DEFAULT NULL,
  `codigo_pedido` varchar(40) DEFAULT NULL,
  `filler_3` varchar(3) DEFAULT NULL,
  `numero_terminal` varchar(8) DEFAULT NULL,
  `codigo_shellbox` varchar(50) DEFAULT NULL,
  `sequencia_registro` decimal(6,0) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_unidas_cv_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_unidas_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_unidas_header`
--

DROP TABLE IF EXISTS `conn_item_unidas_header`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_unidas_header` (
  `item_id` int(10) unsigned NOT NULL,
  `tipo_registro` varchar(2) DEFAULT NULL,
  `versao_layout` varchar(6) DEFAULT NULL,
  `data_criacao` date DEFAULT NULL,
  `hora_criacao` time DEFAULT NULL,
  `sequencia` decimal(6,0) DEFAULT NULL,
  `nome_adquirente` varchar(30) DEFAULT NULL,
  `filler` decimal(1,0) DEFAULT NULL,
  `codigo_ec` decimal(13,0) DEFAULT NULL,
  `tipo_processamento` varchar(1) DEFAULT NULL,
  `sequencia_registro` decimal(6,0) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_unidas_header_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_unidas_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_unidas_header_mov`
--

DROP TABLE IF EXISTS `conn_item_unidas_header_mov`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_unidas_header_mov` (
  `item_id` int(10) unsigned NOT NULL,
  `tipo_registro` varchar(2) DEFAULT NULL,
  `data_movimento` date DEFAULT NULL,
  `moeda` varchar(2) DEFAULT NULL,
  `sequencia_registro` decimal(6,0) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_unidas_header_mov_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_unidas_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_unidas_line`
--

DROP TABLE IF EXISTS `conn_item_unidas_line`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_unidas_line` (
  `item_id` int(10) unsigned NOT NULL,
  `register_type` varchar(2) NOT NULL,
  `masterid` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  KEY `masterid` (`masterid`),
  CONSTRAINT `conn_item_unidas_line_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `vooo_prod_backend`.`connection_item` (`item_id`),
  CONSTRAINT `conn_item_unidas_line_ibfk_2` FOREIGN KEY (`masterid`) REFERENCES `conn_item_unidas_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_unidas_trailer`
--

DROP TABLE IF EXISTS `conn_item_unidas_trailer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_unidas_trailer` (
  `item_id` int(10) unsigned NOT NULL,
  `tipo_registro` varchar(2) DEFAULT NULL,
  `qtd_registros` decimal(6,0) DEFAULT NULL,
  `sequencia_registro` decimal(6,0) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_unidas_trailer_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_unidas_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_unidas_trailer_mov`
--

DROP TABLE IF EXISTS `conn_item_unidas_trailer_mov`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_unidas_trailer_mov` (
  `item_id` int(10) unsigned NOT NULL,
  `tipo_registro` varchar(2) DEFAULT NULL,
  `total_registros` decimal(6,0) DEFAULT NULL,
  `total_creditos` decimal(14,2) DEFAULT NULL,
  `sequencia_registro` decimal(6,0) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_unidas_trailer_mov_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_unidas_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_valecard_ajustes`
--

DROP TABLE IF EXISTS `conn_item_valecard_ajustes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_valecard_ajustes` (
  `item_id` int(10) unsigned NOT NULL,
  `tipo_registro` varchar(1) NOT NULL,
  `codigo_estabelecimento` varchar(15) NOT NULL,
  `numero_rv_ajustado` varchar(9) DEFAULT NULL,
  `data_rv` date DEFAULT NULL,
  `data_pagamento_rv` date DEFAULT NULL,
  `identificador_ajuste` varchar(20) NOT NULL,
  `brancos` varchar(1) DEFAULT NULL,
  `sinal_valor_ajuste` varchar(1) NOT NULL,
  `valor_ajuste` decimal(10,2) NOT NULL,
  `motivo_ajuste` varchar(2) NOT NULL,
  `data_carta` date DEFAULT NULL,
  `numero_cartao` varchar(19) DEFAULT NULL,
  `numero_rv_original` varchar(19) DEFAULT NULL,
  `nsu_original_administradora` varchar(12) DEFAULT NULL,
  `data_transacao_original` date DEFAULT NULL,
  `indicador_tipo_pagamento` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_valecard_ajustes_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_valecard_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_valecard_header`
--

DROP TABLE IF EXISTS `conn_item_valecard_header`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_valecard_header` (
  `item_id` int(10) unsigned NOT NULL,
  `tipo_registro` varchar(1) NOT NULL,
  `data_criacao_arquivo` date NOT NULL,
  `hora_criacao_arquivo` time NOT NULL,
  `data_referencia_movimento` date NOT NULL,
  `arquivo_versao` varchar(8) NOT NULL,
  `codigo_estabelecimento` varchar(15) NOT NULL,
  `cnpj_administradora` varchar(14) NOT NULL,
  `nome_administradora` varchar(20) NOT NULL,
  `sequencia` int(11) NOT NULL,
  `codigo_administradora` varchar(2) NOT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_valecard_header_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_valecard_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_valecard_line`
--

DROP TABLE IF EXISTS `conn_item_valecard_line`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_valecard_line` (
  `item_id` int(10) unsigned NOT NULL,
  `registertype` varchar(2) NOT NULL,
  `masterid` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  KEY `masterid` (`masterid`),
  CONSTRAINT `conn_item_valecard_line_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `vooo_prod_backend`.`connection_item` (`item_id`),
  CONSTRAINT `conn_item_valecard_line_ibfk_2` FOREIGN KEY (`masterid`) REFERENCES `conn_item_valecard_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_valecard_modalidades_pagamento`
--

DROP TABLE IF EXISTS `conn_item_valecard_modalidades_pagamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_valecard_modalidades_pagamento` (
  `item_id` int(10) unsigned NOT NULL,
  `tipo_registro` varchar(1) NOT NULL,
  `codigo_estabelecimento` varchar(15) NOT NULL,
  `nsu_administradora` varchar(12) NOT NULL,
  `data_transacao` date NOT NULL,
  `hora_transacao` time NOT NULL,
  `modalidade_pagamento_1` varchar(2) DEFAULT NULL,
  `valor_recebido_1` decimal(10,2) DEFAULT NULL,
  `modalidade_pagamento_2` varchar(2) DEFAULT NULL,
  `valor_recebido_2` decimal(10,2) DEFAULT NULL,
  `modalidade_pagamento_3` varchar(2) DEFAULT NULL,
  `valor_recebido_3` decimal(10,2) DEFAULT NULL,
  `modalidade_pagamento_4` varchar(2) DEFAULT NULL,
  `valor_recebido_4` decimal(10,2) DEFAULT NULL,
  `modalidade_pagamento_5` varchar(2) DEFAULT NULL,
  `valor_recebido_5` decimal(10,2) DEFAULT NULL,
  `modalidade_pagamento_6` varchar(2) DEFAULT NULL,
  `valor_recebido_6` decimal(10,2) DEFAULT NULL,
  `modalidade_pagamento_7` varchar(2) DEFAULT NULL,
  `valor_recebido_7` decimal(10,2) DEFAULT NULL,
  `modalidade_pagamento_8` varchar(2) DEFAULT NULL,
  `valor_recebido_8` decimal(10,2) DEFAULT NULL,
  `modalidade_pagamento_9` varchar(2) DEFAULT NULL,
  `valor_recebido_9` decimal(10,2) DEFAULT NULL,
  `modalidade_pagamento_10` varchar(2) DEFAULT NULL,
  `valor_recebido_10` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_valecard_modalidades_pagamento_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_valecard_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_valecard_resumo_vendas`
--

DROP TABLE IF EXISTS `conn_item_valecard_resumo_vendas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_valecard_resumo_vendas` (
  `item_id` int(10) unsigned NOT NULL,
  `tipo_registro` varchar(1) NOT NULL,
  `codigo_estabelecimento` varchar(15) NOT NULL,
  `codigo_produto` varchar(2) NOT NULL,
  `forma_captura` varchar(3) DEFAULT NULL,
  `numero_rv` varchar(9) NOT NULL,
  `data_rv` date NOT NULL,
  `data_pagamento_rv` date DEFAULT NULL,
  `banco` varchar(3) NOT NULL,
  `agencia` varchar(6) NOT NULL,
  `conta_corrente` varchar(11) NOT NULL,
  `numero_cv_aceitos` int(11) NOT NULL,
  `numero_cv_rejeitados` int(11) NOT NULL,
  `valor_bruto` decimal(10,2) NOT NULL,
  `valor_liquido` decimal(10,2) NOT NULL,
  `valor_taxa_servico` decimal(10,2) NOT NULL,
  `valor_comissao` decimal(10,2) NOT NULL,
  `valor_rejeitado` decimal(10,2) NOT NULL,
  `valor_credito` decimal(10,2) NOT NULL,
  `valor_encargos` decimal(10,2) NOT NULL,
  `indicador_tipo_pagamento` varchar(2) NOT NULL,
  `numero_parcela_rv` int(11) NOT NULL,
  `quantidade_parcela_rv` int(11) NOT NULL,
  `data_pagamento_prevista` date DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_valecard_resumo_vendas_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_valecard_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_valecard_trailler`
--

DROP TABLE IF EXISTS `conn_item_valecard_trailler`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_valecard_trailler` (
  `item_id` int(10) unsigned NOT NULL,
  `tipo_registro` varchar(1) NOT NULL,
  `quantidade_registros` int(11) NOT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_valecard_trailler_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_valecard_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_valecard_transacoes`
--

DROP TABLE IF EXISTS `conn_item_valecard_transacoes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_valecard_transacoes` (
  `item_id` int(10) unsigned NOT NULL,
  `tipo_registro` varchar(1) NOT NULL,
  `codigo_estabelecimento` varchar(15) NOT NULL,
  `numero_rv` varchar(9) NOT NULL,
  `nsu_administradora` varchar(12) NOT NULL,
  `data_transacao` date NOT NULL,
  `hora_transacao` time NOT NULL,
  `numero_cartao` varchar(19) NOT NULL,
  `valor_transacao` decimal(10,2) NOT NULL,
  `valor_saque` decimal(10,2) NOT NULL,
  `valor_taxa_servico` decimal(10,2) NOT NULL,
  `numero_parcelas` int(11) NOT NULL,
  `numero_parcela_paga` int(11) NOT NULL,
  `valor_parcela_paga` decimal(10,2) NOT NULL,
  `data_pagamento` date DEFAULT NULL,
  `codigo_autorizacao` varchar(10) NOT NULL,
  `forma_captura` varchar(3) NOT NULL,
  `status_transacao` varchar(2) NOT NULL,
  `modalidade_pagamento` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_valecard_transacoes_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_valecard_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_valeshop_aj`
--

DROP TABLE IF EXISTS `conn_item_valeshop_aj`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_valeshop_aj` (
  `item_id` int(10) unsigned NOT NULL,
  `codigo_registro` varchar(2) NOT NULL,
  `identificacao_loja` varchar(15) DEFAULT NULL,
  `nsu_transacao_original` varchar(12) DEFAULT NULL,
  `data_transacao_original` date DEFAULT NULL,
  `numero_parcela` int(2) DEFAULT NULL,
  `nsu_transacao` varchar(12) DEFAULT NULL,
  `data_transacao_aj` date DEFAULT NULL,
  `hora_transacao_aj` time DEFAULT NULL,
  `tipo_lancamento` int(1) DEFAULT NULL,
  `data_lancamento` date DEFAULT NULL,
  `meio_captura_ajuste` int(1) DEFAULT NULL,
  `tipo_ajuste` int(1) DEFAULT NULL,
  `codigo_ajuste` varchar(3) DEFAULT NULL,
  `descricao_motivo_ajuste` varchar(30) DEFAULT NULL,
  `valor_bruto` decimal(10,2) DEFAULT NULL,
  `valor_desconto_comissao` decimal(10,2) DEFAULT NULL,
  `valor_liquido` decimal(10,2) DEFAULT NULL,
  `banco` varchar(3) DEFAULT NULL,
  `agencia` varchar(6) DEFAULT NULL,
  `conta` varchar(11) DEFAULT NULL,
  `nseq` varchar(6) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_valeshop_aj_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_valeshop_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_valeshop_cc`
--

DROP TABLE IF EXISTS `conn_item_valeshop_cc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_valeshop_cc` (
  `item_id` int(10) unsigned NOT NULL,
  `codigo_registro` varchar(2) NOT NULL,
  `identificacao_loja` varchar(15) DEFAULT NULL,
  `nsu_transacao_original` varchar(12) DEFAULT NULL,
  `data_transacao_original` date DEFAULT NULL,
  `numero_parcela` int(2) DEFAULT NULL,
  `nsu_transacao` varchar(12) DEFAULT NULL,
  `data_transacao` date DEFAULT NULL,
  `hora_transacao` time DEFAULT NULL,
  `meio_captura` int(1) DEFAULT NULL,
  `nseq` varchar(6) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  KEY `ix_vooo_prod_rawdata_conn_item_valeshop_cc_nsu_transacao_fd6a` (`nsu_transacao_original`),
  CONSTRAINT `conn_item_valeshop_cc_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_valeshop_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_valeshop_cv`
--

DROP TABLE IF EXISTS `conn_item_valeshop_cv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_valeshop_cv` (
  `item_id` int(10) unsigned NOT NULL,
  `codigo_registro` varchar(2) NOT NULL,
  `identificacao_loja` decimal(15,0) DEFAULT NULL,
  `nsu` varchar(12) DEFAULT NULL,
  `data_transacao` date DEFAULT NULL,
  `hora_transacao` time DEFAULT NULL,
  `tipo_lancamento` int(1) DEFAULT NULL,
  `data_lancamento` date DEFAULT NULL,
  `tipo_produto` varchar(1) DEFAULT NULL,
  `meio_captura` int(1) DEFAULT NULL,
  `valor_bruto_venda` decimal(10,2) DEFAULT NULL,
  `valor_desconto` decimal(10,2) DEFAULT NULL,
  `valor_liquido_venda` decimal(10,2) DEFAULT NULL,
  `numero_cartao` varchar(19) DEFAULT NULL,
  `numero_parcela` int(2) DEFAULT NULL,
  `numero_total_parcelas` int(2) DEFAULT NULL,
  `nsu_parcela` varchar(12) DEFAULT NULL,
  `valor_bruto_parcela` decimal(10,2) DEFAULT NULL,
  `valor_desconto_parcela` decimal(10,2) DEFAULT NULL,
  `valor_liquido_parcela` decimal(10,2) DEFAULT NULL,
  `banco` varchar(3) DEFAULT NULL,
  `agencia` varchar(6) DEFAULT NULL,
  `conta` varchar(11) DEFAULT NULL,
  `codigo_autorizacao` varchar(12) DEFAULT NULL,
  `nseq` varchar(6) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  KEY `ix_vooo_prod_rawdata_conn_item_valeshop_cv_identificacao_loja` (`identificacao_loja`),
  KEY `ix_vooo_prod_rawdata_conn_item_valeshop_cv_nsu` (`nsu`),
  CONSTRAINT `conn_item_valeshop_cv_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_valeshop_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_valeshop_header_arquivo`
--

DROP TABLE IF EXISTS `conn_item_valeshop_header_arquivo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_valeshop_header_arquivo` (
  `item_id` int(10) unsigned NOT NULL,
  `codigo_registro` varchar(2) NOT NULL,
  `versao_layout` varchar(6) DEFAULT NULL,
  `data_geracao_arquivo` date DEFAULT NULL,
  `hora_geracao_arquivo` time DEFAULT NULL,
  `id_movimento` int(6) DEFAULT NULL,
  `nome_administradora` varchar(30) DEFAULT NULL,
  `identificacao_remetente` int(4) DEFAULT NULL,
  `identificacao_destinatario` int(6) DEFAULT NULL,
  `nseq` int(6) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_valeshop_header_arquivo_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_valeshop_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_valeshop_header_lote`
--

DROP TABLE IF EXISTS `conn_item_valeshop_header_lote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_valeshop_header_lote` (
  `item_id` int(10) unsigned NOT NULL,
  `codigo_registro` varchar(2) NOT NULL,
  `data_movimento` date DEFAULT NULL,
  `identificacao_moeda` varchar(2) DEFAULT NULL,
  `nseq` varchar(6) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_valeshop_header_lote_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_valeshop_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_valeshop_line`
--

DROP TABLE IF EXISTS `conn_item_valeshop_line`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_valeshop_line` (
  `item_id` int(10) unsigned NOT NULL,
  `file_version` varchar(6) NOT NULL,
  `registertype` varchar(2) NOT NULL,
  `masterid` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  KEY `masterid` (`masterid`),
  CONSTRAINT `conn_item_valeshop_line_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `vooo_prod_backend`.`connection_item` (`item_id`),
  CONSTRAINT `conn_item_valeshop_line_ibfk_2` FOREIGN KEY (`masterid`) REFERENCES `conn_item_valeshop_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_valeshop_trailer_arquivo`
--

DROP TABLE IF EXISTS `conn_item_valeshop_trailer_arquivo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_valeshop_trailer_arquivo` (
  `item_id` int(10) unsigned NOT NULL,
  `codigo_registro` varchar(2) NOT NULL,
  `total_geral_registros` int(6) DEFAULT NULL,
  `nseq` varchar(6) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_valeshop_trailer_arquivo_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_valeshop_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_valeshop_trailer_lote`
--

DROP TABLE IF EXISTS `conn_item_valeshop_trailer_lote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_valeshop_trailer_lote` (
  `item_id` int(10) unsigned NOT NULL,
  `codigo_registro` varchar(2) NOT NULL,
  `total_registros_transacao` int(6) DEFAULT NULL,
  `total_valores_creditos` decimal(10,2) DEFAULT NULL,
  `nseq` varchar(6) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_valeshop_trailer_lote_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_valeshop_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_vero_aj`
--

DROP TABLE IF EXISTS `conn_item_vero_aj`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_vero_aj` (
  `item_id` int(10) unsigned NOT NULL,
  `codigo_registro` varchar(2) NOT NULL,
  `identificacao_loja` varchar(15) DEFAULT NULL,
  `nsu_transacao_original` varchar(12) DEFAULT NULL,
  `data_transacao_original` date DEFAULT NULL,
  `numero_parcela` int(2) DEFAULT NULL,
  `nsu_transacao` varchar(12) DEFAULT NULL,
  `data_transacao_aj` date DEFAULT NULL,
  `hora_transacao_aj` time DEFAULT NULL,
  `tipo_lancamento` decimal(1,0) DEFAULT NULL,
  `data_lancamento` date DEFAULT NULL,
  `meio_captura_ajuste` int(1) DEFAULT NULL,
  `tipo_ajuste` decimal(1,0) DEFAULT NULL,
  `codigo_ajuste` varchar(3) DEFAULT NULL,
  `descricao_motivo_ajuste` varchar(30) DEFAULT NULL,
  `valor_bruto` decimal(10,2) DEFAULT NULL,
  `valor_desconto_comissao` decimal(10,2) DEFAULT NULL,
  `valor_liquido` decimal(10,2) DEFAULT NULL,
  `banco` varchar(3) DEFAULT NULL,
  `agencia` varchar(6) DEFAULT NULL,
  `conta` varchar(11) DEFAULT NULL,
  `numero_cartao_original` varchar(19) DEFAULT NULL,
  `nseq` varchar(6) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  KEY `idx_conn_item_vero_aj_1` (`nsu_transacao`,`data_transacao_aj`,`tipo_lancamento`),
  CONSTRAINT `conn_item_vero_aj_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_vero_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_vero_cc`
--

DROP TABLE IF EXISTS `conn_item_vero_cc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_vero_cc` (
  `item_id` int(10) unsigned NOT NULL,
  `codigo_registro` varchar(2) NOT NULL,
  `identificacao_loja` varchar(15) DEFAULT NULL,
  `nsu_transacao_original` varchar(12) DEFAULT NULL,
  `data_transacao_original` date DEFAULT NULL,
  `numero_parcela` int(2) DEFAULT NULL,
  `nsu_transacao` varchar(12) DEFAULT NULL,
  `data_transacao` date DEFAULT NULL,
  `hora_transacao` time DEFAULT NULL,
  `meio_captura` int(1) DEFAULT NULL,
  `nseq` varchar(6) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  KEY `ix_vooo_prod_rawdata_conn_item_vero_cc_nsu_transacao_original` (`nsu_transacao_original`),
  KEY `idx_conn_item_vero_cc_1` (`nsu_transacao`,`data_transacao`),
  CONSTRAINT `conn_item_vero_cc_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_vero_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_vero_cv`
--

DROP TABLE IF EXISTS `conn_item_vero_cv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_vero_cv` (
  `item_id` int(10) unsigned NOT NULL,
  `codigo_registro` varchar(2) NOT NULL,
  `identificacao_loja` varchar(15) DEFAULT NULL,
  `nsu` varchar(12) DEFAULT NULL,
  `data_transacao` date DEFAULT NULL,
  `hora_transacao` time DEFAULT NULL,
  `tipo_lancamento` int(1) DEFAULT NULL,
  `data_lancamento` date DEFAULT NULL,
  `tipo_produto` varchar(1) DEFAULT NULL,
  `meio_captura` int(1) DEFAULT NULL,
  `valor_bruto_venda` decimal(10,2) DEFAULT NULL,
  `valor_desconto` decimal(10,2) DEFAULT NULL,
  `valor_liquido_venda` decimal(10,2) DEFAULT NULL,
  `numero_cartao` varchar(19) DEFAULT NULL,
  `numero_parcela` int(2) DEFAULT NULL,
  `numero_total_parcelas` int(2) DEFAULT NULL,
  `nsu_parcela` varchar(12) DEFAULT NULL,
  `valor_bruto_parcela` decimal(10,2) DEFAULT NULL,
  `valor_desconto_parcela` decimal(10,2) DEFAULT NULL,
  `valor_liquido_parcela` decimal(10,2) DEFAULT NULL,
  `banco` varchar(3) DEFAULT NULL,
  `agencia` varchar(6) DEFAULT NULL,
  `conta` varchar(11) DEFAULT NULL,
  `codigo_autorizacao` int(12) DEFAULT NULL,
  `nseq` varchar(6) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  KEY `ix_vooo_prod_rawdata_conn_item_vero_cv_nsu` (`nsu`),
  KEY `ix_vooo_prod_rawdata_conn_item_vero_cv_identificacao_loja` (`identificacao_loja`),
  KEY `idx_conn_item_vero_cv_1` (`nsu`,`data_transacao`,`tipo_lancamento`),
  CONSTRAINT `conn_item_vero_cv_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_vero_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_vero_header_arquivo`
--

DROP TABLE IF EXISTS `conn_item_vero_header_arquivo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_vero_header_arquivo` (
  `item_id` int(10) unsigned NOT NULL,
  `codigo_registro` varchar(2) NOT NULL,
  `versao_layout` varchar(6) DEFAULT NULL,
  `data_geracao_arquivo` date DEFAULT NULL,
  `hora_geracao_arquivo` time DEFAULT NULL,
  `id_movimento` int(6) DEFAULT NULL,
  `nome_administradora` varchar(30) DEFAULT NULL,
  `identificacao_remetente` int(4) DEFAULT NULL,
  `identificacao_destinatario` int(6) DEFAULT NULL,
  `nseq_registro` int(6) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_vero_header_arquivo_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_vero_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_vero_header_lote`
--

DROP TABLE IF EXISTS `conn_item_vero_header_lote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_vero_header_lote` (
  `item_id` int(10) unsigned NOT NULL,
  `codigo_registro` varchar(2) NOT NULL,
  `data_movimento` date DEFAULT NULL,
  `identificacao_moeda` varchar(2) DEFAULT NULL,
  `nseq` varchar(6) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_vero_header_lote_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_vero_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_vero_line`
--

DROP TABLE IF EXISTS `conn_item_vero_line`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_vero_line` (
  `item_id` int(10) unsigned NOT NULL,
  `registertype` varchar(2) NOT NULL,
  `status` varchar(1) NOT NULL,
  `masterid` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  KEY `masterid` (`masterid`),
  CONSTRAINT `conn_item_vero_line_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `vooo_prod_backend`.`connection_item` (`item_id`),
  CONSTRAINT `conn_item_vero_line_ibfk_2` FOREIGN KEY (`masterid`) REFERENCES `conn_item_vero_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_vero_trailer_arquivo`
--

DROP TABLE IF EXISTS `conn_item_vero_trailer_arquivo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_vero_trailer_arquivo` (
  `item_id` int(10) unsigned NOT NULL,
  `codigo_registro` varchar(2) NOT NULL,
  `total_geral_registros` int(6) DEFAULT NULL,
  `nseq` varchar(6) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_vero_trailer_arquivo_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_vero_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_vero_trailer_lote`
--

DROP TABLE IF EXISTS `conn_item_vero_trailer_lote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_vero_trailer_lote` (
  `item_id` int(10) unsigned NOT NULL,
  `codigo_registro` varchar(2) NOT NULL,
  `total_registros_transacao` int(6) DEFAULT NULL,
  `total_valores_creditos` decimal(10,2) DEFAULT NULL,
  `nseq` varchar(6) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_vero_trailer_lote_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_vero_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_vooo_pix_adicionais`
--

DROP TABLE IF EXISTS `conn_item_vooo_pix_adicionais`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_vooo_pix_adicionais` (
  `item_id` int(10) unsigned NOT NULL,
  `tipo_registro` varchar(1) DEFAULT NULL,
  `identificador` varchar(35) DEFAULT NULL,
  `nome` varchar(50) DEFAULT NULL,
  `valor` decimal(20,2) DEFAULT NULL,
  `nome_2` varchar(50) DEFAULT NULL,
  `valor_2` decimal(20,2) DEFAULT NULL,
  `brancos` varchar(202) DEFAULT NULL,
  `nseq_detalhes` varchar(6) DEFAULT NULL,
  `nseq_infoads` varchar(6) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_vooo_pix_adicionais_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_vooo_pix_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_vooo_pix_geracaoQr`
--

DROP TABLE IF EXISTS `conn_item_vooo_pix_geracaoQr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_vooo_pix_geracaoQr` (
  `item_id` int(10) unsigned NOT NULL,
  `tipo_registro` varchar(1) DEFAULT NULL,
  `chave_pix` varchar(77) DEFAULT NULL,
  `codigo_movimento` varchar(2) DEFAULT NULL,
  `data_movimento` date DEFAULT NULL,
  `identificador` varchar(35) DEFAULT NULL,
  `pix_link` varchar(500) DEFAULT NULL,
  `location` varchar(77) DEFAULT NULL,
  `brancos` varchar(44) DEFAULT NULL,
  `numero_seq` decimal(6,0) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_vooo_pix_geracaoQr_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_vooo_pix_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_vooo_pix_geracaoQrImg`
--

DROP TABLE IF EXISTS `conn_item_vooo_pix_geracaoQrImg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_vooo_pix_geracaoQrImg` (
  `item_id` int(10) unsigned NOT NULL,
  `tipo_registro` varchar(1) DEFAULT NULL,
  `chave_pix` varchar(77) DEFAULT NULL,
  `codigo_movimento` varchar(2) DEFAULT NULL,
  `data_movimento` date DEFAULT NULL,
  `identificador` varchar(35) DEFAULT NULL,
  `emv_qr_code` varchar(500) DEFAULT NULL,
  `location` varchar(77) DEFAULT NULL,
  `brancos` varchar(44) DEFAULT NULL,
  `nseq` decimal(6,0) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_vooo_pix_geracaoQrImg_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_vooo_pix_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_vooo_pix_header`
--

DROP TABLE IF EXISTS `conn_item_vooo_pix_header`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_vooo_pix_header` (
  `item_id` int(10) unsigned NOT NULL,
  `tipo_registro` varchar(1) DEFAULT NULL,
  `codigo_retorno` decimal(1,0) DEFAULT NULL,
  `literal_retorno` varchar(7) DEFAULT NULL,
  `codigo_servico` decimal(2,0) DEFAULT NULL,
  `literal_servico` varchar(15) DEFAULT NULL,
  `ispb` varchar(8) DEFAULT NULL,
  `codigo_inscricao` decimal(2,0) DEFAULT NULL,
  `cpf_cnpj` decimal(14,0) DEFAULT NULL,
  `agencia` decimal(4,0) DEFAULT NULL,
  `conta` decimal(20,0) DEFAULT NULL,
  `tipo_conta` varchar(4) DEFAULT NULL,
  `chave_pix` varchar(77) DEFAULT NULL,
  `data_geracao` date DEFAULT NULL,
  `codigo_convenio` varchar(30) DEFAULT NULL,
  `exclusivo_psp` varchar(60) DEFAULT NULL,
  `codigo_erro` varchar(30) DEFAULT NULL,
  `brancos` varchar(458) DEFAULT NULL,
  `versao_arquivo` varchar(3) DEFAULT NULL,
  `nseq_arquivo` decimal(6,0) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_vooo_pix_header_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_vooo_pix_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_vooo_pix_line`
--

DROP TABLE IF EXISTS `conn_item_vooo_pix_line`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_vooo_pix_line` (
  `item_id` int(10) unsigned NOT NULL,
  `register_type` varchar(2) NOT NULL,
  `masterid` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  KEY `masterid` (`masterid`),
  CONSTRAINT `conn_item_vooo_pix_line_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `vooo_prod_backend`.`connection_item` (`item_id`),
  CONSTRAINT `conn_item_vooo_pix_line_ibfk_2` FOREIGN KEY (`masterid`) REFERENCES `conn_item_vooo_pix_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_vooo_pix_trailer`
--

DROP TABLE IF EXISTS `conn_item_vooo_pix_trailer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_vooo_pix_trailer` (
  `item_id` int(10) unsigned NOT NULL,
  `tipo_registro` varchar(1) DEFAULT NULL,
  `codigo_retorno` decimal(1,0) DEFAULT NULL,
  `codigo_servico` decimal(2,0) DEFAULT NULL,
  `ispb` varchar(8) DEFAULT NULL,
  `codigo_erro` varchar(30) DEFAULT NULL,
  `brancos` varchar(687) DEFAULT NULL,
  `qtd_detalhes` varchar(15) DEFAULT NULL,
  `nseq` varchar(6) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_vooo_pix_trailer_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_vooo_pix_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_vooo_pix_transacao`
--

DROP TABLE IF EXISTS `conn_item_vooo_pix_transacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_vooo_pix_transacao` (
  `item_id` int(10) unsigned NOT NULL,
  `tipo_registro` varchar(1) DEFAULT NULL,
  `ispb` varchar(9) DEFAULT NULL,
  `codigo_inscricao` decimal(2,0) DEFAULT NULL,
  `cpf_cnpj` decimal(14,0) DEFAULT NULL,
  `agencia` decimal(4,0) DEFAULT NULL,
  `conta` decimal(20,0) DEFAULT NULL,
  `tipo_conta` varchar(4) DEFAULT NULL,
  `chave_pix` varchar(77) DEFAULT NULL,
  `tipo_cobranca` decimal(1,0) DEFAULT NULL,
  `codigo_movimento` decimal(2,0) DEFAULT NULL,
  `data_movimento` date DEFAULT NULL,
  `identificador` varchar(35) DEFAULT NULL,
  `expiracao` decimal(15,0) DEFAULT NULL,
  `data_vencimento` date DEFAULT NULL,
  `valor_original` decimal(17,2) DEFAULT NULL,
  `valor_juros` decimal(17,2) DEFAULT NULL,
  `valor_multa` decimal(17,2) DEFAULT NULL,
  `valor_desconto_abatimento` decimal(17,2) DEFAULT NULL,
  `valor_final` decimal(17,2) DEFAULT NULL,
  `valor_pago` decimal(17,2) DEFAULT NULL,
  `tarifa_cobranca` decimal(17,2) DEFAULT NULL,
  `codigo_inscricao_devedor` decimal(2,0) DEFAULT NULL,
  `cpf_cnpj_devedor` varchar(14) DEFAULT NULL,
  `mensagem_pagador_final` varchar(140) DEFAULT NULL,
  `codigo_inscricao_pagador` decimal(2,0) DEFAULT NULL,
  `cpf_cnpj_pagador` varchar(14) DEFAULT NULL,
  `nome_pagador` varchar(140) DEFAULT NULL,
  `cod_liquidacao` decimal(2,0) DEFAULT NULL,
  `end_to_end` varchar(35) DEFAULT NULL,
  `codigo_erro` varchar(30) DEFAULT NULL,
  `brancos` varchar(47) DEFAULT NULL,
  `nseq` varchar(6) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_vooo_pix_transacao_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_vooo_pix_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_vr_ajustes`
--

DROP TABLE IF EXISTS `conn_item_vr_ajustes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_vr_ajustes` (
  `item_id` int(10) unsigned NOT NULL,
  `tipo_registro` varchar(1) NOT NULL,
  `codigo_estabelecimento` varchar(15) NOT NULL,
  `numero_rv_ajustado` varchar(9) DEFAULT NULL,
  `data_rv` date DEFAULT NULL,
  `data_pagamento_rv` date DEFAULT NULL,
  `identificador_ajuste` varchar(20) NOT NULL,
  `brancos` varchar(1) DEFAULT NULL,
  `sinal_valor_ajuste` varchar(1) NOT NULL,
  `valor_ajuste` decimal(10,2) NOT NULL,
  `motivo_ajuste` varchar(2) NOT NULL,
  `data_carta` date DEFAULT NULL,
  `numero_cartao` varchar(19) DEFAULT NULL,
  `numero_rv_original` varchar(19) DEFAULT NULL,
  `nsu_original_administradora` varchar(12) DEFAULT NULL,
  `data_transacao_original` date DEFAULT NULL,
  `indicador_tipo_pagamento` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_vr_ajustes_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_vr_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_vr_header`
--

DROP TABLE IF EXISTS `conn_item_vr_header`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_vr_header` (
  `item_id` int(10) unsigned NOT NULL,
  `tipo_registro` varchar(1) NOT NULL,
  `data_criacao_arquivo` date NOT NULL,
  `hora_criacao_arquivo` time NOT NULL,
  `data_referencia_movimento` date NOT NULL,
  `arquivo_versao` varchar(8) NOT NULL,
  `codigo_estabelecimento` varchar(15) NOT NULL,
  `cnpj_administradora` varchar(14) NOT NULL,
  `nome_administradora` varchar(20) NOT NULL,
  `sequencia` int(11) NOT NULL,
  `codigo_administradora` varchar(2) NOT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_vr_header_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_vr_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_vr_line`
--

DROP TABLE IF EXISTS `conn_item_vr_line`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_vr_line` (
  `item_id` int(10) unsigned NOT NULL,
  `registertype` varchar(2) NOT NULL,
  `masterid` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  KEY `masterid` (`masterid`),
  CONSTRAINT `conn_item_vr_line_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `vooo_prod_backend`.`connection_item` (`item_id`),
  CONSTRAINT `conn_item_vr_line_ibfk_2` FOREIGN KEY (`masterid`) REFERENCES `conn_item_vr_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_vr_modalidades_pagamento`
--

DROP TABLE IF EXISTS `conn_item_vr_modalidades_pagamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_vr_modalidades_pagamento` (
  `item_id` int(10) unsigned NOT NULL,
  `tipo_registro` varchar(1) NOT NULL,
  `codigo_estabelecimento` varchar(15) NOT NULL,
  `nsu_administradora` varchar(12) NOT NULL,
  `data_transacao` date NOT NULL,
  `hora_transacao` time NOT NULL,
  `modalidade_pagamento_1` varchar(2) DEFAULT NULL,
  `valor_recebido_1` decimal(10,2) DEFAULT NULL,
  `modalidade_pagamento_2` varchar(2) DEFAULT NULL,
  `valor_recebido_2` decimal(10,2) DEFAULT NULL,
  `modalidade_pagamento_3` varchar(2) DEFAULT NULL,
  `valor_recebido_3` decimal(10,2) DEFAULT NULL,
  `modalidade_pagamento_4` varchar(2) DEFAULT NULL,
  `valor_recebido_4` decimal(10,2) DEFAULT NULL,
  `modalidade_pagamento_5` varchar(2) DEFAULT NULL,
  `valor_recebido_5` decimal(10,2) DEFAULT NULL,
  `modalidade_pagamento_6` varchar(2) DEFAULT NULL,
  `valor_recebido_6` decimal(10,2) DEFAULT NULL,
  `modalidade_pagamento_7` varchar(2) DEFAULT NULL,
  `valor_recebido_7` decimal(10,2) DEFAULT NULL,
  `modalidade_pagamento_8` varchar(2) DEFAULT NULL,
  `valor_recebido_8` decimal(10,2) DEFAULT NULL,
  `modalidade_pagamento_9` varchar(2) DEFAULT NULL,
  `valor_recebido_9` decimal(10,2) DEFAULT NULL,
  `modalidade_pagamento_10` varchar(2) DEFAULT NULL,
  `valor_recebido_10` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_vr_modalidades_pagamento_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_vr_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_vr_resumo_vendas`
--

DROP TABLE IF EXISTS `conn_item_vr_resumo_vendas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_vr_resumo_vendas` (
  `item_id` int(10) unsigned NOT NULL,
  `tipo_registro` varchar(1) NOT NULL,
  `codigo_estabelecimento` varchar(15) NOT NULL,
  `codigo_produto` varchar(2) NOT NULL,
  `forma_captura` varchar(3) DEFAULT NULL,
  `numero_rv` varchar(9) NOT NULL,
  `data_rv` date NOT NULL,
  `data_pagamento_rv` date DEFAULT NULL,
  `banco` varchar(3) NOT NULL,
  `agencia` varchar(6) NOT NULL,
  `conta_corrente` varchar(11) NOT NULL,
  `numero_cv_aceitos` int(11) NOT NULL,
  `numero_cv_rejeitados` int(11) NOT NULL,
  `valor_bruto` decimal(10,2) NOT NULL,
  `valor_liquido` decimal(10,2) NOT NULL,
  `valor_taxa_servico` decimal(10,2) NOT NULL,
  `valor_comissao` decimal(10,2) NOT NULL,
  `valor_rejeitado` decimal(10,2) NOT NULL,
  `valor_credito` decimal(10,2) NOT NULL,
  `valor_encargos` decimal(10,2) NOT NULL,
  `indicador_tipo_pagamento` varchar(2) NOT NULL,
  `numero_parcela_rv` int(11) NOT NULL,
  `quantidade_parcela_rv` int(11) NOT NULL,
  `data_pagamento_prevista` date DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_vr_resumo_vendas_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_vr_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_vr_trailler`
--

DROP TABLE IF EXISTS `conn_item_vr_trailler`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_vr_trailler` (
  `item_id` int(10) unsigned NOT NULL,
  `tipo_registro` varchar(1) NOT NULL,
  `quantidade_registros` int(11) NOT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_vr_trailler_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_vr_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_vr_transacoes`
--

DROP TABLE IF EXISTS `conn_item_vr_transacoes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_vr_transacoes` (
  `item_id` int(10) unsigned NOT NULL,
  `tipo_registro` varchar(1) NOT NULL,
  `codigo_estabelecimento` varchar(15) NOT NULL,
  `numero_rv` varchar(9) NOT NULL,
  `nsu_administradora` varchar(12) NOT NULL,
  `data_transacao` date NOT NULL,
  `hora_transacao` time NOT NULL,
  `numero_cartao` varchar(19) NOT NULL,
  `valor_transacao` decimal(10,2) NOT NULL,
  `valor_saque` decimal(10,2) NOT NULL,
  `valor_taxa_servico` decimal(10,2) NOT NULL,
  `numero_parcelas` int(11) NOT NULL,
  `numero_parcela_paga` int(11) NOT NULL,
  `valor_parcela_paga` decimal(10,2) NOT NULL,
  `data_pagamento` date DEFAULT NULL,
  `codigo_autorizacao` varchar(10) NOT NULL,
  `forma_captura` varchar(3) NOT NULL,
  `status_transacao` varchar(2) NOT NULL,
  `modalidade_pagamento` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_vr_transacoes_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_vr_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_vtex_control`
--

DROP TABLE IF EXISTS `conn_item_vtex_control`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_vtex_control` (
  `item_id` int(10) unsigned NOT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `check_status` decimal(1,0) DEFAULT NULL,
  `registers` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  KEY `ix_vooo_prod_rawdata_conn_item_vtex_control_start_date` (`start_date`),
  KEY `ix_vooo_prod_rawdata_conn_item_vtex_control_end_date` (`end_date`),
  CONSTRAINT `conn_item_vtex_control_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_vtex_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_vtex_line`
--

DROP TABLE IF EXISTS `conn_item_vtex_line`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_vtex_line` (
  `item_id` int(10) unsigned NOT NULL,
  `register_type` varchar(15) DEFAULT NULL,
  `masterid` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  KEY `masterid` (`masterid`),
  CONSTRAINT `conn_item_vtex_line_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `vooo_prod_backend`.`connection_item` (`item_id`),
  CONSTRAINT `conn_item_vtex_line_ibfk_2` FOREIGN KEY (`masterid`) REFERENCES `conn_item_vtex_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_vtex_transaction`
--

DROP TABLE IF EXISTS `conn_item_vtex_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_vtex_transaction` (
  `item_id` int(10) unsigned NOT NULL,
  `Origin` varchar(20) DEFAULT NULL,
  `Order` varchar(30) DEFAULT NULL,
  `Sequence` decimal(10,0) DEFAULT NULL,
  `Creation_Date` date DEFAULT NULL,
  `Creation_Time` time DEFAULT NULL,
  `Client_Document` varchar(20) DEFAULT NULL,
  `Status` varchar(50) DEFAULT NULL,
  `Last_Change_Date` varchar(50) DEFAULT NULL,
  `Payment_System_Name` varchar(20) DEFAULT NULL,
  `Installments` decimal(2,0) DEFAULT NULL,
  `Payment_Value` decimal(10,2) DEFAULT NULL,
  `Reference_Code` varchar(20) DEFAULT NULL,
  `SKU_Value` decimal(10,2) DEFAULT NULL,
  `SKU_Selling_Price` decimal(10,2) DEFAULT NULL,
  `SKU_Total_Price` decimal(10,2) DEFAULT NULL,
  `Total_Value` decimal(10,2) DEFAULT NULL,
  `Discounts_Totals` decimal(10,2) DEFAULT NULL,
  `Authorization_id` varchar(20) DEFAULT NULL,
  `TID` varchar(20) DEFAULT NULL,
  `NSU` varchar(20) DEFAULT NULL,
  `Card_First_Digits` varchar(10) DEFAULT NULL,
  `Card_Last_Digits` varchar(10) DEFAULT NULL,
  `Authorized_Date` date DEFAULT NULL,
  `Authorized_Time` time DEFAULT NULL,
  `TransactionId` varchar(100) DEFAULT NULL,
  `PaymentId` varchar(100) DEFAULT NULL,
  `import_status` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  KEY `idx_vtex_transaction_1` (`Client_Document`,`Creation_Date`,`Payment_Value`),
  KEY `idx_vtex_transaction_2` (`Order`,`Reference_Code`),
  CONSTRAINT `conn_item_vtex_transaction_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_vtex_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_xp_line`
--

DROP TABLE IF EXISTS `conn_item_xp_line`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_xp_line` (
  `item_id` int(10) unsigned NOT NULL,
  `register_type` decimal(3,0) DEFAULT NULL,
  `id_shellbox` decimal(11,0) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  KEY `idx_shellbox` (`id_shellbox`),
  CONSTRAINT `conn_item_xp_line_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `vooo_prod_backend`.`connection_item` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_xp_sales`
--

DROP TABLE IF EXISTS `conn_item_xp_sales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_xp_sales` (
  `item_id` int(10) unsigned NOT NULL,
  `registryType` varchar(2) DEFAULT NULL,
  `storeCnpj` varchar(24) DEFAULT NULL,
  `transactionNsuCode` varchar(24) DEFAULT NULL,
  `transactionDate` date DEFAULT NULL,
  `transactionTime` time DEFAULT NULL,
  `entryType` varchar(1) DEFAULT NULL,
  `liquidationDate` date DEFAULT NULL,
  `grossPaymentValue` decimal(15,2) DEFAULT NULL,
  `discountValue` decimal(15,2) DEFAULT NULL,
  `netPaymentValue` decimal(15,2) DEFAULT NULL,
  `captureMethod` decimal(1,0) DEFAULT NULL,
  `productType` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_xp_sales_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_xp_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_zul_ajuste`
--

DROP TABLE IF EXISTS `conn_item_zul_ajuste`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_zul_ajuste` (
  `item_id` int(10) unsigned NOT NULL,
  `tiporegistro` varchar(2) DEFAULT NULL,
  `codigo_ec` decimal(15,0) DEFAULT NULL,
  `nsu_transacao_original` varchar(12) DEFAULT NULL,
  `data_transacao_original` date DEFAULT NULL,
  `num_da_parcela` decimal(2,0) DEFAULT NULL,
  `nsu_transacao` decimal(12,0) DEFAULT NULL,
  `data_transacao_ajuste` date DEFAULT NULL,
  `hora_transacao_ajuste` time DEFAULT NULL,
  `tipo_lancamento` decimal(1,0) DEFAULT NULL,
  `data_lancamento` date DEFAULT NULL,
  `forma_captura` decimal(1,0) DEFAULT NULL,
  `tipo_ajuste` decimal(1,0) DEFAULT NULL,
  `codigo_ajuste` decimal(3,0) DEFAULT NULL,
  `descricao_ajuste` varchar(30) DEFAULT NULL,
  `valor_bruto` decimal(11,2) DEFAULT NULL,
  `valor_desconto` decimal(11,2) DEFAULT NULL,
  `valor_liquido` decimal(11,2) DEFAULT NULL,
  `banco` decimal(3,0) DEFAULT NULL,
  `agencia` decimal(6,0) DEFAULT NULL,
  `conta_corrente` varchar(11) DEFAULT NULL,
  `num_cartao` varchar(19) DEFAULT NULL,
  `codigo_bandeira` varchar(3) DEFAULT NULL,
  `codigo_produto` varchar(3) DEFAULT NULL,
  `valor_bruto_parcela` decimal(11,2) DEFAULT NULL,
  `valor_liquido_parcela` decimal(11,2) DEFAULT NULL,
  `codigo_pedido` varchar(36) DEFAULT NULL,
  `codigo_autorizacao` varchar(12) DEFAULT NULL,
  `num_parcelas` decimal(2,0) DEFAULT NULL,
  `sequencia_registro` decimal(6,0) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_zul_ajuste_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_zul_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_zul_cancel`
--

DROP TABLE IF EXISTS `conn_item_zul_cancel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_zul_cancel` (
  `item_id` int(10) unsigned NOT NULL,
  `tiporegistro` varchar(2) DEFAULT NULL,
  `codigo_ec` decimal(15,0) DEFAULT NULL,
  `nsu_transacao_original` decimal(12,0) DEFAULT NULL,
  `data_transacao_original` date DEFAULT NULL,
  `num_da_parcela` decimal(2,0) DEFAULT NULL,
  `nsu_transacao` decimal(12,0) DEFAULT NULL,
  `data_transacao_cancelamento` date DEFAULT NULL,
  `hora_transacao_cancelamento` time DEFAULT NULL,
  `forma_captura` decimal(1,0) DEFAULT NULL,
  `codigo_pedido` varchar(36) DEFAULT NULL,
  `codigo_autorizacao` varchar(12) DEFAULT NULL,
  `valor_bruto` decimal(11,0) DEFAULT NULL,
  `valor_liquido` decimal(11,0) DEFAULT NULL,
  `valor_bruto_parcela` decimal(11,0) DEFAULT NULL,
  `valor_liquido_parcela` decimal(11,0) DEFAULT NULL,
  `codigo_ajuste` decimal(3,0) DEFAULT NULL,
  `descricao_ajuste` varchar(30) DEFAULT NULL,
  `num_parcelas` decimal(2,0) DEFAULT NULL,
  `sequencia_registro` decimal(6,0) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_zul_cancel_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_zul_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_zul_cv`
--

DROP TABLE IF EXISTS `conn_item_zul_cv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_zul_cv` (
  `item_id` int(10) unsigned NOT NULL,
  `tipo_registro` varchar(2) DEFAULT NULL,
  `codigo_ec` decimal(15,0) DEFAULT NULL,
  `nsu_adquirente` varchar(36) DEFAULT NULL,
  `data_transacao` date DEFAULT NULL,
  `hora_transacao` time DEFAULT NULL,
  `tipo_lancamento` decimal(1,0) DEFAULT NULL,
  `data_pagamento` date DEFAULT NULL,
  `tipo_produto` varchar(1) DEFAULT NULL,
  `forma_captura` decimal(1,0) DEFAULT NULL,
  `valor_bruto` decimal(11,2) DEFAULT NULL,
  `valor_desconto` decimal(11,2) DEFAULT NULL,
  `valor_liquido` decimal(11,2) DEFAULT NULL,
  `num_cartao` varchar(19) DEFAULT NULL,
  `num_da_parcela` decimal(2,0) DEFAULT NULL,
  `num_parcelas` decimal(2,0) DEFAULT NULL,
  `nsu_parcela` varchar(36) DEFAULT NULL,
  `valor_bruto_parcela` decimal(11,2) DEFAULT NULL,
  `valor_desconto_parcela` decimal(11,2) DEFAULT NULL,
  `valor_liquido_parcela` decimal(11,2) DEFAULT NULL,
  `banco` decimal(3,0) DEFAULT NULL,
  `agencia` decimal(6,0) DEFAULT NULL,
  `conta_corrente` varchar(11) DEFAULT NULL,
  `codigo_autorizacao` varchar(36) DEFAULT NULL,
  `codigo_bandeira` varchar(3) DEFAULT NULL,
  `codigo_produto` varchar(3) DEFAULT NULL,
  `valor_taxa_1` decimal(11,2) DEFAULT NULL,
  `valor_taxa_2` decimal(11,2) DEFAULT NULL,
  `valor_taxa_1_parcela` decimal(11,2) DEFAULT NULL,
  `valor_taxa_2_parcela` decimal(11,2) DEFAULT NULL,
  `valor_taxa_antecipacao` decimal(11,2) DEFAULT NULL,
  `valor_liquido_antecipado` decimal(11,2) DEFAULT NULL,
  `codigo_pedido` varchar(36) DEFAULT NULL,
  `numero_terminal` varchar(8) DEFAULT NULL,
  `codigo_shellbox` varchar(43) DEFAULT NULL,
  `sequencia_registro` decimal(6,0) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_zul_cv_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_zul_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_zul_header`
--

DROP TABLE IF EXISTS `conn_item_zul_header`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_zul_header` (
  `item_id` int(10) unsigned NOT NULL,
  `tipo_registro` varchar(2) DEFAULT NULL,
  `versao_layout` varchar(6) DEFAULT NULL,
  `data_criacao` date DEFAULT NULL,
  `hora_criacao` time DEFAULT NULL,
  `sequencia` decimal(6,0) DEFAULT NULL,
  `nome_adquirente` varchar(30) DEFAULT NULL,
  `codigo_ec` decimal(13,0) DEFAULT NULL,
  `tipo_processamento` varchar(1) DEFAULT NULL,
  `sequencia_registro` decimal(6,0) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_zul_header_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_zul_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_zul_header_mov`
--

DROP TABLE IF EXISTS `conn_item_zul_header_mov`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_zul_header_mov` (
  `item_id` int(10) unsigned NOT NULL,
  `tipo_registro` varchar(2) DEFAULT NULL,
  `data_movimento` date DEFAULT NULL,
  `moeda` varchar(2) DEFAULT NULL,
  `sequencia_registro` decimal(6,0) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_zul_header_mov_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_zul_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_zul_line`
--

DROP TABLE IF EXISTS `conn_item_zul_line`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_zul_line` (
  `item_id` int(10) unsigned NOT NULL,
  `register_type` varchar(2) NOT NULL,
  `masterid` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  KEY `masterid` (`masterid`),
  CONSTRAINT `conn_item_zul_line_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `vooo_prod_backend`.`connection_item` (`item_id`),
  CONSTRAINT `conn_item_zul_line_ibfk_2` FOREIGN KEY (`masterid`) REFERENCES `conn_item_zul_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_zul_trailer`
--

DROP TABLE IF EXISTS `conn_item_zul_trailer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_zul_trailer` (
  `item_id` int(10) unsigned NOT NULL,
  `tipo_registro` varchar(2) DEFAULT NULL,
  `qtd_registros` decimal(6,0) DEFAULT NULL,
  `sequencia_registro` decimal(6,0) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_zul_trailer_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_zul_line` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conn_item_zul_trailermov`
--

DROP TABLE IF EXISTS `conn_item_zul_trailermov`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conn_item_zul_trailermov` (
  `item_id` int(10) unsigned NOT NULL,
  `tipo_registro` varchar(2) DEFAULT NULL,
  `total_registros` decimal(6,0) DEFAULT NULL,
  `total_creditos` decimal(12,2) DEFAULT NULL,
  `sequencia_registro` decimal(6,0) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `conn_item_zul_trailermov_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `conn_item_zul_line` (`item_id`)
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

-- Dump completed on 2024-07-28 13:41:20
