-- MySQL dump 10.13  Distrib 8.0.40, for macos15.2 (arm64)
--
-- Host: localhost    Database: mbilling7
-- ------------------------------------------------------
-- Server version	8.0.40

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

--
-- Table structure for table `pkg_alarm`
--

DROP TABLE IF EXISTS `pkg_alarm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pkg_alarm` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` int NOT NULL,
  `amount` int NOT NULL,
  `condition` int NOT NULL,
  `status` int NOT NULL,
  `creationdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `period` int DEFAULT NULL,
  `id_plan` int DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `last_notification` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `subject` varchar(200) NOT NULL DEFAULT 'MagnusBilling ALARM',
  `message` varchar(1000) NOT NULL DEFAULT 'MagnusBilling ALARM email body, customize',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pkg_alarm`
--

LOCK TABLES `pkg_alarm` WRITE;
/*!40000 ALTER TABLE `pkg_alarm` DISABLE KEYS */;
/*!40000 ALTER TABLE `pkg_alarm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pkg_api`
--

DROP TABLE IF EXISTS `pkg_api`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pkg_api` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_user` int NOT NULL,
  `status` tinyint NOT NULL DEFAULT '1',
  `api_key` varchar(150) NOT NULL,
  `api_secret` varchar(150) NOT NULL,
  `api_restriction_ips` varchar(150) DEFAULT NULL,
  `action` varchar(7) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pkg_api`
--

LOCK TABLES `pkg_api` WRITE;
/*!40000 ALTER TABLE `pkg_api` DISABLE KEYS */;
INSERT INTO `pkg_api` VALUES (1,4,1,'ewewe222222232323','wedwedewdewd3232323','','r');
/*!40000 ALTER TABLE `pkg_api` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pkg_balance`
--

DROP TABLE IF EXISTS `pkg_balance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pkg_balance` (
  `id` int NOT NULL AUTO_INCREMENT,
  `last_use` int NOT NULL,
  `id_prefix` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pkg_balance`
--

LOCK TABLES `pkg_balance` WRITE;
/*!40000 ALTER TABLE `pkg_balance` DISABLE KEYS */;
/*!40000 ALTER TABLE `pkg_balance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pkg_boleto`
--

DROP TABLE IF EXISTS `pkg_boleto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pkg_boleto` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_user` int NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `description` mediumtext NOT NULL,
  `status` varchar(4) NOT NULL,
  `payment` varchar(10) NOT NULL,
  `vencimento` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `fk_pkg_user_pkg_boleto` (`id_user`),
  CONSTRAINT `fk_pkg_user_pkg_boleto` FOREIGN KEY (`id_user`) REFERENCES `pkg_user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pkg_boleto`
--

LOCK TABLES `pkg_boleto` WRITE;
/*!40000 ALTER TABLE `pkg_boleto` DISABLE KEYS */;
/*!40000 ALTER TABLE `pkg_boleto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pkg_call_chart`
--

DROP TABLE IF EXISTS `pkg_call_chart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pkg_call_chart` (
  `id` int NOT NULL AUTO_INCREMENT,
  `answer` int DEFAULT NULL,
  `date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `total` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `date` (`date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pkg_call_chart`
--

LOCK TABLES `pkg_call_chart` WRITE;
/*!40000 ALTER TABLE `pkg_call_chart` DISABLE KEYS */;
/*!40000 ALTER TABLE `pkg_call_chart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pkg_call_online`
--

DROP TABLE IF EXISTS `pkg_call_online`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pkg_call_online` (
  `id` int NOT NULL AUTO_INCREMENT,
  `uniqueid` varchar(25) DEFAULT NULL,
  `sip_account` varchar(50) DEFAULT NULL,
  `id_user` int DEFAULT NULL,
  `canal` varchar(50) DEFAULT NULL,
  `tronco` varchar(50) DEFAULT NULL,
  `ndiscado` varchar(25) DEFAULT '0',
  `codec` varchar(5) NOT NULL,
  `status` varchar(16) NOT NULL,
  `duration` int NOT NULL DEFAULT '0',
  `reinvite` varchar(5) NOT NULL,
  `from_ip` varchar(50) DEFAULT NULL,
  `server` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `starttime` (`status`),
  KEY `fk_pkg_user_pkg_call_online` (`id_user`),
  CONSTRAINT `fk_pkg_user_pkg_call_online` FOREIGN KEY (`id_user`) REFERENCES `pkg_user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pkg_call_online`
--

LOCK TABLES `pkg_call_online` WRITE;
/*!40000 ALTER TABLE `pkg_call_online` DISABLE KEYS */;
/*!40000 ALTER TABLE `pkg_call_online` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pkg_callback`
--

DROP TABLE IF EXISTS `pkg_callback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pkg_callback` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_user` int NOT NULL,
  `id_did` int NOT NULL,
  `uniqueid` varchar(40) DEFAULT NULL,
  `entry_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` varchar(80) DEFAULT NULL,
  `server_ip` varchar(40) DEFAULT NULL,
  `num_attempt` int NOT NULL DEFAULT '0',
  `last_attempt_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `manager_result` varchar(60) DEFAULT NULL,
  `agi_result` varchar(60) DEFAULT NULL,
  `callback_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `channel` varchar(60) DEFAULT NULL,
  `exten` varchar(60) DEFAULT NULL,
  `context` varchar(60) DEFAULT NULL,
  `priority` varchar(60) DEFAULT NULL,
  `application` varchar(60) DEFAULT NULL,
  `data` varchar(60) DEFAULT NULL,
  `timeout` varchar(60) DEFAULT NULL,
  `callerid` varchar(60) DEFAULT NULL,
  `variable` varchar(300) DEFAULT NULL,
  `account` varchar(60) DEFAULT NULL,
  `async` varchar(60) DEFAULT NULL,
  `actionid` varchar(60) DEFAULT NULL,
  `id_server` int DEFAULT NULL,
  `id_server_group` int DEFAULT NULL,
  `sessiontime` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `pkg_callback_uniqueid_key` (`uniqueid`),
  KEY `fk_pkg_user_pkg_callback` (`id_user`),
  CONSTRAINT `fk_pkg_user_pkg_callback` FOREIGN KEY (`id_user`) REFERENCES `pkg_user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pkg_callback`
--

LOCK TABLES `pkg_callback` WRITE;
/*!40000 ALTER TABLE `pkg_callback` DISABLE KEYS */;
/*!40000 ALTER TABLE `pkg_callback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pkg_callerid`
--

DROP TABLE IF EXISTS `pkg_callerid`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pkg_callerid` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cid` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL DEFAULT '',
  `description` mediumtext,
  `id_user` int NOT NULL,
  `activated` char(1) NOT NULL DEFAULT 't',
  PRIMARY KEY (`id`),
  UNIQUE KEY `cons_pkg_callerid_cid` (`cid`),
  KEY `fk_pkg_user_pkg_callerid` (`id_user`),
  CONSTRAINT `fk_pkg_user_pkg_callerid` FOREIGN KEY (`id_user`) REFERENCES `pkg_user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pkg_callerid`
--

LOCK TABLES `pkg_callerid` WRITE;
/*!40000 ALTER TABLE `pkg_callerid` DISABLE KEYS */;
INSERT INTO `pkg_callerid` VALUES (1,'34343434','','testerer',2,'1'),(2,'4343434','','testerer',2,'1'),(3,'3r4f3fewfwef','ewfewf','teste',3,'1'),(4,'5334343434','','',3,'1'),(5,'t34343','','',4,'1');
/*!40000 ALTER TABLE `pkg_callerid` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pkg_callshop`
--

DROP TABLE IF EXISTS `pkg_callshop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pkg_callshop` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sessionid` varchar(100) NOT NULL,
  `id_user` int NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `buycost` decimal(15,5) NOT NULL DEFAULT '0.00000',
  `price` decimal(15,5) NOT NULL,
  `price_min` decimal(15,5) NOT NULL DEFAULT '0.00000',
  `calledstation` varchar(50) NOT NULL,
  `destination` varchar(100) DEFAULT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `sessiontime` int NOT NULL,
  `cabina` varchar(30) NOT NULL,
  `markup` decimal(15,5) NOT NULL DEFAULT '0.00000',
  PRIMARY KEY (`id`),
  KEY `cabina` (`cabina`),
  KEY `fk_pkg_user_pkg_callshop` (`id_user`),
  CONSTRAINT `fk_pkg_user_pkg_callshop` FOREIGN KEY (`id_user`) REFERENCES `pkg_user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pkg_callshop`
--

LOCK TABLES `pkg_callshop` WRITE;
/*!40000 ALTER TABLE `pkg_callshop` DISABLE KEYS */;
/*!40000 ALTER TABLE `pkg_callshop` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `update_sip_status_after_insert` AFTER INSERT ON `pkg_callshop` FOR EACH ROW BEGIN
                    UPDATE pkg_sip SET status = 2 WHERE name = new.cabina;
                END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `pkg_campaign`
--

DROP TABLE IF EXISTS `pkg_campaign`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pkg_campaign` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_user` int NOT NULL,
  `id_plan` int DEFAULT NULL,
  `name` char(50) NOT NULL,
  `callerid` varchar(100) DEFAULT '',
  `creationdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `startingdate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `expirationdate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `description` mediumtext,
  `secondusedreal` int DEFAULT '0',
  `nb_callmade` int DEFAULT '0',
  `status` int NOT NULL DEFAULT '1',
  `frequency` int NOT NULL DEFAULT '0',
  `max_frequency` int NOT NULL DEFAULT '0',
  `forward_number` varchar(160) DEFAULT NULL,
  `daily_start_time` time NOT NULL DEFAULT '10:00:00',
  `daily_stop_time` time NOT NULL DEFAULT '18:00:00',
  `monday` tinyint NOT NULL DEFAULT '1',
  `tuesday` tinyint NOT NULL DEFAULT '1',
  `wednesday` tinyint NOT NULL DEFAULT '1',
  `thursday` tinyint NOT NULL DEFAULT '1',
  `friday` tinyint NOT NULL DEFAULT '1',
  `saturday` tinyint NOT NULL DEFAULT '0',
  `sunday` tinyint NOT NULL DEFAULT '0',
  `audio` varchar(100) DEFAULT NULL,
  `audio_2` varchar(100) DEFAULT NULL,
  `type` int DEFAULT '1',
  `restrict_phone` int NOT NULL DEFAULT '0',
  `enable_max_call` int NOT NULL DEFAULT '0',
  `digit_authorize` smallint NOT NULL DEFAULT '1',
  `tts_audio` varchar(200) DEFAULT NULL,
  `tts_audio2` varchar(200) DEFAULT NULL,
  `asr_audio` varchar(200) DEFAULT NULL,
  `asr_options` varchar(200) DEFAULT NULL,
  `auto_reprocess` int DEFAULT '0',
  `from` varchar(20) DEFAULT NULL,
  `record_call` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_pkg_user_pkg_campaign` (`id_user`),
  KEY `fk_pkg_plan_pkg_campaign` (`id_plan`),
  CONSTRAINT `fk_pkg_plan_pkg_campaign` FOREIGN KEY (`id_plan`) REFERENCES `pkg_plan` (`id`),
  CONSTRAINT `fk_pkg_user_pkg_campaign` FOREIGN KEY (`id_user`) REFERENCES `pkg_user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pkg_campaign`
--

LOCK TABLES `pkg_campaign` WRITE;
/*!40000 ALTER TABLE `pkg_campaign` DISABLE KEYS */;
/*!40000 ALTER TABLE `pkg_campaign` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pkg_campaign_log`
--

DROP TABLE IF EXISTS `pkg_campaign_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pkg_campaign_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `total` int NOT NULL DEFAULT '0',
  `loops` int NOT NULL DEFAULT '0',
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `trunks` varchar(200) DEFAULT NULL,
  `campaigns` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pkg_campaign_log`
--

LOCK TABLES `pkg_campaign_log` WRITE;
/*!40000 ALTER TABLE `pkg_campaign_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `pkg_campaign_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pkg_campaign_phonebook`
--

DROP TABLE IF EXISTS `pkg_campaign_phonebook`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pkg_campaign_phonebook` (
  `id_campaign` int NOT NULL,
  `id_phonebook` int NOT NULL,
  PRIMARY KEY (`id_campaign`,`id_phonebook`),
  KEY `fk_pkg_campaign_pkg_campaign_phonebook` (`id_campaign`),
  KEY `fk_pkg_phonebook_pkg_campaign_phonebook` (`id_phonebook`),
  CONSTRAINT `fk_pkg_campaign_pkg_campaign_phonebook` FOREIGN KEY (`id_campaign`) REFERENCES `pkg_campaign` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_pkg_phonebook_pkg_campaign_phonebook` FOREIGN KEY (`id_phonebook`) REFERENCES `pkg_phonebook` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pkg_campaign_phonebook`
--

LOCK TABLES `pkg_campaign_phonebook` WRITE;
/*!40000 ALTER TABLE `pkg_campaign_phonebook` DISABLE KEYS */;
/*!40000 ALTER TABLE `pkg_campaign_phonebook` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pkg_campaign_poll`
--

DROP TABLE IF EXISTS `pkg_campaign_poll`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pkg_campaign_poll` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_user` int NOT NULL,
  `id_campaign` int DEFAULT NULL,
  `name` varchar(50) NOT NULL,
  `description` varchar(100) DEFAULT NULL,
  `arq_audio` varchar(100) DEFAULT NULL,
  `ordem_exibicao` int DEFAULT NULL,
  `option0` varchar(300) NOT NULL,
  `option1` varchar(300) NOT NULL,
  `option2` varchar(300) NOT NULL,
  `option3` varchar(300) NOT NULL,
  `option4` varchar(300) NOT NULL,
  `option5` varchar(300) NOT NULL,
  `option6` varchar(300) NOT NULL,
  `option7` varchar(300) NOT NULL,
  `option8` varchar(300) NOT NULL,
  `option9` varchar(300) NOT NULL,
  `option10` varchar(150) DEFAULT NULL,
  `digit_authorize` int NOT NULL DEFAULT '1',
  `request_authorize` int NOT NULL DEFAULT '0',
  `repeat` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `fk_pkg_campaign_pkg_campaign_poll` (`id_campaign`),
  CONSTRAINT `fk_pkg_campaign_pkg_campaign_poll` FOREIGN KEY (`id_campaign`) REFERENCES `pkg_campaign` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pkg_campaign_poll`
--

LOCK TABLES `pkg_campaign_poll` WRITE;
/*!40000 ALTER TABLE `pkg_campaign_poll` DISABLE KEYS */;
/*!40000 ALTER TABLE `pkg_campaign_poll` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pkg_campaign_poll_info`
--

DROP TABLE IF EXISTS `pkg_campaign_poll_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pkg_campaign_poll_info` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_campaign_poll` int NOT NULL,
  `resposta` int NOT NULL,
  `number` varchar(18) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `obs` varchar(200) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `resposta_text` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_pkg_campaign_poll_pkg_campaign_poll_info` (`id_campaign_poll`),
  KEY `number` (`number`),
  CONSTRAINT `fk_pkg_campaign_poll_pkg_campaign_poll_info` FOREIGN KEY (`id_campaign_poll`) REFERENCES `pkg_campaign_poll` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pkg_campaign_poll_info`
--

LOCK TABLES `pkg_campaign_poll_info` WRITE;
/*!40000 ALTER TABLE `pkg_campaign_poll_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `pkg_campaign_poll_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pkg_campaign_report`
--

DROP TABLE IF EXISTS `pkg_campaign_report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pkg_campaign_report` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_campaign` int NOT NULL,
  `id_phonenumber` int NOT NULL,
  `id_user` int NOT NULL,
  `id_trunk` int NOT NULL,
  `unix_timestamp` int NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '2',
  PRIMARY KEY (`id`),
  KEY `unix_timestamp` (`unix_timestamp`),
  KEY `fk_pkg_campaign_report_pkg_campaign` (`id_campaign`),
  KEY `fk_pkg_campaign_report_pkg_phonenumber` (`id_phonenumber`),
  KEY `fk_pkg_campaign_report_pkg_user` (`id_user`),
  KEY `fk_pkg_campaign_report_pkg_trunk` (`id_trunk`),
  CONSTRAINT `fk_pkg_campaign_report_pkg_campaign` FOREIGN KEY (`id_campaign`) REFERENCES `pkg_campaign` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_pkg_campaign_report_pkg_phonenumber` FOREIGN KEY (`id_phonenumber`) REFERENCES `pkg_phonenumber` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_pkg_campaign_report_pkg_trunk` FOREIGN KEY (`id_trunk`) REFERENCES `pkg_trunk` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_pkg_campaign_report_pkg_user` FOREIGN KEY (`id_user`) REFERENCES `pkg_user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pkg_campaign_report`
--

LOCK TABLES `pkg_campaign_report` WRITE;
/*!40000 ALTER TABLE `pkg_campaign_report` DISABLE KEYS */;
/*!40000 ALTER TABLE `pkg_campaign_report` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pkg_campaign_restrict_phone`
--

DROP TABLE IF EXISTS `pkg_campaign_restrict_phone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pkg_campaign_restrict_phone` (
  `id` int NOT NULL AUTO_INCREMENT,
  `number` bigint NOT NULL,
  `description` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `number` (`number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pkg_campaign_restrict_phone`
--

LOCK TABLES `pkg_campaign_restrict_phone` WRITE;
/*!40000 ALTER TABLE `pkg_campaign_restrict_phone` DISABLE KEYS */;
/*!40000 ALTER TABLE `pkg_campaign_restrict_phone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pkg_cdr`
--

DROP TABLE IF EXISTS `pkg_cdr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pkg_cdr` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_user` int NOT NULL,
  `id_plan` int DEFAULT NULL,
  `id_trunk` int DEFAULT NULL,
  `id_server` int DEFAULT NULL,
  `id_prefix` int DEFAULT NULL,
  `id_campaign` int DEFAULT NULL,
  `callerid` varchar(40) NOT NULL DEFAULT '',
  `uniqueid` varchar(30) NOT NULL,
  `starttime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `sessiontime` int DEFAULT NULL,
  `calledstation` varchar(30) NOT NULL,
  `sessionbill` float DEFAULT NULL,
  `sipiax` int DEFAULT '0',
  `src` varchar(40) NOT NULL,
  `buycost` decimal(15,6) DEFAULT '0.000000',
  `real_sessiontime` int DEFAULT NULL,
  `terminatecauseid` int DEFAULT '1',
  `agent_bill` decimal(15,6) DEFAULT '0.000000',
  PRIMARY KEY (`id`),
  KEY `id_user` (`id_user`),
  KEY `id_trunk` (`id_trunk`),
  KEY `id_prefix` (`id_prefix`),
  KEY `calledstation` (`calledstation`),
  KEY `src` (`src`),
  KEY `callerid` (`callerid`),
  KEY `starttime` (`starttime`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pkg_cdr`
--

LOCK TABLES `pkg_cdr` WRITE;
/*!40000 ALTER TABLE `pkg_cdr` DISABLE KEYS */;
INSERT INTO `pkg_cdr` VALUES (1,2,1,1,NULL,1,NULL,'343434','343434','2025-01-21 18:31:26',1,'3434343434',0.005,0,'443434',0.000000,NULL,1,0.000000);
/*!40000 ALTER TABLE `pkg_cdr` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `update_user_credit_after_insert` AFTER INSERT ON `pkg_cdr` FOR EACH ROW BEGIN
                    IF NEW.sessionbill > 0 THEN
                        IF NEW.agent_bill > 0 THEN
                            SET @IDAGENT = (SELECT id_user FROM pkg_user WHERE id = new.id_user LIMIT 1);
                            UPDATE pkg_user SET credit = credit - new.agent_bill WHERE pkg_user.id = new.id_user;
                            UPDATE pkg_user SET credit = credit - new.sessionbill WHERE pkg_user.id = @IDAGENT;
                        ELSE
                            UPDATE pkg_user SET credit = credit - new.sessionbill WHERE pkg_user.id = new.id_user;
                        END IF;
                    END IF;
                END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `pkg_cdr_archive`
--

DROP TABLE IF EXISTS `pkg_cdr_archive`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pkg_cdr_archive` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_user` int NOT NULL,
  `id_plan` int DEFAULT NULL,
  `id_trunk` int DEFAULT NULL,
  `id_did` int DEFAULT NULL,
  `id_offer` int DEFAULT '0',
  `id_prefix` int DEFAULT NULL,
  `uniqueid` varchar(30) NOT NULL,
  `starttime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `stoptime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `sessiontime` int DEFAULT NULL,
  `calledstation` varchar(30) NOT NULL,
  `sessionbill` float DEFAULT NULL,
  `sipiax` int DEFAULT '0',
  `src` varchar(40) NOT NULL,
  `buycost` decimal(15,5) DEFAULT '0.00000',
  `real_sessiontime` int DEFAULT NULL,
  `terminatecauseid` int DEFAULT '1',
  `agent_bill` decimal(15,5) DEFAULT '0.00000',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pkg_cdr_archive`
--

LOCK TABLES `pkg_cdr_archive` WRITE;
/*!40000 ALTER TABLE `pkg_cdr_archive` DISABLE KEYS */;
/*!40000 ALTER TABLE `pkg_cdr_archive` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pkg_cdr_failed`
--

DROP TABLE IF EXISTS `pkg_cdr_failed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pkg_cdr_failed` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_user` int NOT NULL,
  `id_plan` int DEFAULT NULL,
  `id_trunk` int DEFAULT NULL,
  `id_prefix` int DEFAULT NULL,
  `id_server` int DEFAULT NULL,
  `sessionid` varchar(40) DEFAULT NULL,
  `uniqueid` varchar(30) NOT NULL,
  `starttime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `calledstation` varchar(30) NOT NULL,
  `sipiax` int DEFAULT '0',
  `src` varchar(40) NOT NULL,
  `callerid` varchar(40) DEFAULT NULL,
  `terminatecauseid` int DEFAULT '1',
  `hangupcause` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_user` (`id_user`),
  KEY `id_trunk` (`id_trunk`),
  KEY `calledstation` (`calledstation`),
  KEY `starttime` (`starttime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pkg_cdr_failed`
--

LOCK TABLES `pkg_cdr_failed` WRITE;
/*!40000 ALTER TABLE `pkg_cdr_failed` DISABLE KEYS */;
/*!40000 ALTER TABLE `pkg_cdr_failed` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pkg_cdr_summary_day`
--

DROP TABLE IF EXISTS `pkg_cdr_summary_day`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pkg_cdr_summary_day` (
  `id` int NOT NULL AUTO_INCREMENT,
  `day` varchar(10) NOT NULL,
  `sessiontime` bigint NOT NULL,
  `aloc_all_calls` int NOT NULL,
  `nbcall` int NOT NULL,
  `nbcall_fail` int DEFAULT NULL,
  `buycost` float NOT NULL DEFAULT '0',
  `sessionbill` float NOT NULL DEFAULT '0',
  `lucro` float DEFAULT NULL,
  `asr` float DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `day` (`day`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pkg_cdr_summary_day`
--

LOCK TABLES `pkg_cdr_summary_day` WRITE;
/*!40000 ALTER TABLE `pkg_cdr_summary_day` DISABLE KEYS */;
/*!40000 ALTER TABLE `pkg_cdr_summary_day` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pkg_cdr_summary_day_agent`
--

DROP TABLE IF EXISTS `pkg_cdr_summary_day_agent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pkg_cdr_summary_day_agent` (
  `id` int NOT NULL AUTO_INCREMENT,
  `day` varchar(10) NOT NULL,
  `id_user` int NOT NULL,
  `sessiontime` bigint NOT NULL,
  `aloc_all_calls` int NOT NULL,
  `nbcall` int NOT NULL,
  `nbcall_fail` int NOT NULL DEFAULT '0',
  `buycost` float NOT NULL DEFAULT '0',
  `sessionbill` float NOT NULL DEFAULT '0',
  `lucro` float DEFAULT '0',
  `agent_bill` float NOT NULL DEFAULT '0',
  `agent_lucro` float NOT NULL DEFAULT '0',
  `asr` float NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `day` (`day`),
  KEY `id_user` (`id_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pkg_cdr_summary_day_agent`
--

LOCK TABLES `pkg_cdr_summary_day_agent` WRITE;
/*!40000 ALTER TABLE `pkg_cdr_summary_day_agent` DISABLE KEYS */;
/*!40000 ALTER TABLE `pkg_cdr_summary_day_agent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pkg_cdr_summary_day_trunk`
--

DROP TABLE IF EXISTS `pkg_cdr_summary_day_trunk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pkg_cdr_summary_day_trunk` (
  `id` int NOT NULL AUTO_INCREMENT,
  `day` varchar(10) NOT NULL,
  `id_trunk` int NOT NULL,
  `sessiontime` bigint NOT NULL,
  `aloc_all_calls` int NOT NULL,
  `nbcall` int NOT NULL,
  `nbcall_fail` int NOT NULL DEFAULT '0',
  `buycost` float NOT NULL DEFAULT '0',
  `sessionbill` float NOT NULL DEFAULT '0',
  `lucro` float DEFAULT '0',
  `asr` float NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `day` (`day`),
  KEY `id_trunk` (`id_trunk`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pkg_cdr_summary_day_trunk`
--

LOCK TABLES `pkg_cdr_summary_day_trunk` WRITE;
/*!40000 ALTER TABLE `pkg_cdr_summary_day_trunk` DISABLE KEYS */;
/*!40000 ALTER TABLE `pkg_cdr_summary_day_trunk` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pkg_cdr_summary_day_user`
--

DROP TABLE IF EXISTS `pkg_cdr_summary_day_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pkg_cdr_summary_day_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `day` varchar(10) NOT NULL,
  `id_user` int NOT NULL,
  `sessiontime` bigint NOT NULL,
  `aloc_all_calls` int NOT NULL,
  `nbcall` int NOT NULL,
  `nbcall_fail` int NOT NULL DEFAULT '0',
  `buycost` float DEFAULT '0',
  `sessionbill` float DEFAULT '0',
  `lucro` float DEFAULT '0',
  `isAgent` tinyint(1) DEFAULT NULL,
  `agent_bill` float NOT NULL DEFAULT '0',
  `asr` float NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `day` (`day`),
  KEY `id_user` (`id_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pkg_cdr_summary_day_user`
--

LOCK TABLES `pkg_cdr_summary_day_user` WRITE;
/*!40000 ALTER TABLE `pkg_cdr_summary_day_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `pkg_cdr_summary_day_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pkg_cdr_summary_ids`
--

DROP TABLE IF EXISTS `pkg_cdr_summary_ids`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pkg_cdr_summary_ids` (
  `id` int NOT NULL AUTO_INCREMENT,
  `day` date NOT NULL,
  `cdr_id` int NOT NULL,
  `cdr_falide_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `day` (`day`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pkg_cdr_summary_ids`
--

LOCK TABLES `pkg_cdr_summary_ids` WRITE;
/*!40000 ALTER TABLE `pkg_cdr_summary_ids` DISABLE KEYS */;
/*!40000 ALTER TABLE `pkg_cdr_summary_ids` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pkg_cdr_summary_month`
--

DROP TABLE IF EXISTS `pkg_cdr_summary_month`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pkg_cdr_summary_month` (
  `id` int NOT NULL AUTO_INCREMENT,
  `month` varchar(20) NOT NULL,
  `sessiontime` bigint NOT NULL,
  `aloc_all_calls` int NOT NULL,
  `nbcall` int NOT NULL,
  `nbcall_fail` int NOT NULL DEFAULT '0',
  `buycost` float NOT NULL DEFAULT '0',
  `sessionbill` float NOT NULL DEFAULT '0',
  `lucro` float DEFAULT '0',
  `asr` float NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `month` (`month`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pkg_cdr_summary_month`
--

LOCK TABLES `pkg_cdr_summary_month` WRITE;
/*!40000 ALTER TABLE `pkg_cdr_summary_month` DISABLE KEYS */;
/*!40000 ALTER TABLE `pkg_cdr_summary_month` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pkg_cdr_summary_month_did`
--

DROP TABLE IF EXISTS `pkg_cdr_summary_month_did`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pkg_cdr_summary_month_did` (
  `id` int NOT NULL AUTO_INCREMENT,
  `month` varchar(20) NOT NULL,
  `id_did` int NOT NULL,
  `sessiontime` int NOT NULL,
  `aloc_all_calls` int NOT NULL,
  `nbcall` int NOT NULL,
  `sessionbill` float NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `month` (`month`),
  KEY `id_did` (`id_did`),
  CONSTRAINT `pkg_cdr_summary_month_did_ibfk_1` FOREIGN KEY (`id_did`) REFERENCES `pkg_did` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pkg_cdr_summary_month_did`
--

LOCK TABLES `pkg_cdr_summary_month_did` WRITE;
/*!40000 ALTER TABLE `pkg_cdr_summary_month_did` DISABLE KEYS */;
/*!40000 ALTER TABLE `pkg_cdr_summary_month_did` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pkg_cdr_summary_month_trunk`
--

DROP TABLE IF EXISTS `pkg_cdr_summary_month_trunk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pkg_cdr_summary_month_trunk` (
  `id` int NOT NULL AUTO_INCREMENT,
  `month` varchar(20) NOT NULL,
  `id_trunk` int NOT NULL,
  `sessiontime` bigint NOT NULL,
  `aloc_all_calls` int NOT NULL,
  `nbcall` int NOT NULL,
  `nbcall_fail` int NOT NULL DEFAULT '0',
  `buycost` float NOT NULL DEFAULT '0',
  `sessionbill` float NOT NULL DEFAULT '0',
  `lucro` float DEFAULT '0',
  `asr` float NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `month` (`month`),
  KEY `id_trunk` (`id_trunk`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pkg_cdr_summary_month_trunk`
--

LOCK TABLES `pkg_cdr_summary_month_trunk` WRITE;
/*!40000 ALTER TABLE `pkg_cdr_summary_month_trunk` DISABLE KEYS */;
/*!40000 ALTER TABLE `pkg_cdr_summary_month_trunk` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pkg_cdr_summary_month_user`
--

DROP TABLE IF EXISTS `pkg_cdr_summary_month_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pkg_cdr_summary_month_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `month` varchar(20) NOT NULL,
  `id_user` int NOT NULL,
  `sessiontime` bigint NOT NULL,
  `aloc_all_calls` int NOT NULL,
  `nbcall` int NOT NULL,
  `nbcall_fail` int NOT NULL DEFAULT '0',
  `buycost` float NOT NULL DEFAULT '0',
  `sessionbill` float NOT NULL DEFAULT '0',
  `lucro` float DEFAULT '0',
  `isAgent` tinyint(1) DEFAULT NULL,
  `agent_bill` float NOT NULL DEFAULT '0',
  `asr` float NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `month` (`month`),
  KEY `id_user` (`id_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pkg_cdr_summary_month_user`
--

LOCK TABLES `pkg_cdr_summary_month_user` WRITE;
/*!40000 ALTER TABLE `pkg_cdr_summary_month_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `pkg_cdr_summary_month_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pkg_cdr_summary_trunk`
--

DROP TABLE IF EXISTS `pkg_cdr_summary_trunk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pkg_cdr_summary_trunk` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_trunk` int NOT NULL,
  `sessiontime` bigint NOT NULL,
  `aloc_all_calls` int NOT NULL,
  `nbcall` int NOT NULL,
  `nbcall_fail` int DEFAULT NULL,
  `buycost` float NOT NULL DEFAULT '0',
  `sessionbill` float NOT NULL DEFAULT '0',
  `lucro` float DEFAULT NULL,
  `asr` float DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_trunk` (`id_trunk`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pkg_cdr_summary_trunk`
--

LOCK TABLES `pkg_cdr_summary_trunk` WRITE;
/*!40000 ALTER TABLE `pkg_cdr_summary_trunk` DISABLE KEYS */;
/*!40000 ALTER TABLE `pkg_cdr_summary_trunk` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pkg_cdr_summary_user`
--

DROP TABLE IF EXISTS `pkg_cdr_summary_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pkg_cdr_summary_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_user` int NOT NULL,
  `sessiontime` bigint NOT NULL,
  `aloc_all_calls` int NOT NULL,
  `nbcall` int NOT NULL,
  `nbcall_fail` int DEFAULT NULL,
  `buycost` float NOT NULL DEFAULT '0',
  `sessionbill` float NOT NULL DEFAULT '0',
  `lucro` float DEFAULT NULL,
  `asr` float DEFAULT NULL,
  `isAgent` int DEFAULT NULL,
  `agent_bill` float NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `id_user` (`id_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pkg_cdr_summary_user`
--

LOCK TABLES `pkg_cdr_summary_user` WRITE;
/*!40000 ALTER TABLE `pkg_cdr_summary_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `pkg_cdr_summary_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pkg_configuration`
--

DROP TABLE IF EXISTS `pkg_configuration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pkg_configuration` (
  `id` int NOT NULL AUTO_INCREMENT,
  `config_title` varchar(100) DEFAULT NULL,
  `config_key` varchar(100) DEFAULT NULL,
  `config_value` varchar(200) DEFAULT NULL,
  `config_description` varchar(500) DEFAULT NULL,
  `config_group_title` varchar(64) NOT NULL,
  `status` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=317 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pkg_configuration`
--

LOCK TABLES `pkg_configuration` WRITE;
/*!40000 ALTER TABLE `pkg_configuration` DISABLE KEYS */;
INSERT INTO `pkg_configuration` VALUES (1,'Moeda','base_currency','R$','Moeda usada no sistema','global',1),(2,'Idioma do MBilling','base_language','pt_BR','Valores permitidos\nen English\nes Espanhol\nbr Português','global',1),(3,'Versão','version','7.8.4.9','Versão MagnusBilling','global',1),(4,'Licence','licence','free','MBilling Licence','global',0),(5,'Server IP','ip_servers','','Ip do servidor MBilling','global',1),(6,'Template','template','black-neptune','Allowed values:\ngreen, gray, blue, yellow, red, orange, purple','global',0),(7,'País','base_country','BRL','Valores permitidos\nUSA United States,BRL Brasil,\nARG Argentina,\nNLD Netherlands,\nESP Spanish,\nITA Italy,\nMEX Mexico','global',1),(8,'Desktop layout','layout','0','Active Desktop template, only to FULL version\n1 - Enable (Only to full version)\n0 - Disable','global',0),(9,'Wallpaper','wallpaper','Azul','Default Wallpaper, only FULL version.','global',0),(10,'SMTP Host','smtp_host','mail.magnusbilling.com','SMTP Hostname','global',0),(11,'SMTP UserName','smtp_username','billin2g@2magnusbilling.com','SMTP server Username','global',0),(12,'SMTP Password','smtp_password','magnus','SMTP server Password','global',0),(13,'SMTP Encryption','smtp_encryption','null','SMTP Encryption: tls, ssl or blank','global',0),(14,'SMTP Port','smtp_port','587','SMTP Port','global',0),(15,'Email do administrador','admin_email','billin2g@2magnusbilling.com','Email usado para receber notificações','global',1),(16,'Enviar copias para o admin','admin_received_email','1','Receber no email do administrador copias dos emails gerados pelo sistema','global',1),(19,'Intervalo de notificação','delay_notifications','3','Intervalo para notificar os cliente de que estão com pouco credito.','global',1),(20,'Arredondar tempo','bloc_time_call','1','Arredonda o tempo da chamada respeitando a tarifa de venda.\n1: Sim\n0: Não\n','global',1),(21,'Notificação de Pacotes de Ofertas','planbilling_daytopay','5','Total Dias anterior ao vencimento que o MBilling avisara o cliente para pagar o pacote de oferta.','global',1),(22,'Limite de recarga de revendedores','agent_limit_refill','5','Credito máximo que um revendedor para usar para recarga. Este total é calculado levando em consideração o saldo do revendedor.\nEX: Se o revendedor tem R$100 e o limite de recarga esta em 5, quer dizer que o total de credito entre todos os clientes do revendedor, não pode superar R$500.','global',1),(23,'Arquivar ligações','archive_call_prior_x_month','4','Arquivar ligações anterior a determinada quantidade de meses.','global',1),(25,'Decimal precisão','decimal_precision','0000','Número de zeros apôs a virgula.','global',1),(26,'Paypal para novos cliente','paypal_new_user','0','Permitir recargas automáticas para cliente novos.\n0 - Desativado (RECOMENDADO )\n1 - Ativado','global',1),(29,'Portabilidade Usuário','portabilidadeUsername','0','Usuário da portabilidade para consulta via WebService','global',1),(30,'Portabilidade Senha','portabilidadePassword','0','Senha da portabilidade para consulta via WebService','global',1),(31,'AGI - Answer Call','answer_call','0','Se ativado, o MBilling atendera a chamada no inicio.\n\n1 - Ativo\n0 - Desativado (DEFAULT)','agi-conf1',1),(32,'AGI - User DNID','use_dnid','1','Se desativar, será solicitado ao cliente que marque o número que deseja chamar.\n\n1 - Ativo (DEFAULT)\n0 - Desativado','agi-conf1',1),(34,'AGI - Audio inicial','intro_prompt','','Audio para ser executado no inicio de cada chamada. Deixe em branco para não executar nada','agi-conf1',1),(37,'AGI - International prefixes','international_prefixes','00,09','Lista de prefixos que o MagnusBilling vai retirar do numero discado.','agi-conf1',1),(38,'AGI - Informar preço do minuto','say_rateinitial','0','Informa ao cliente o valor do minuto no inicio de cada chamada.\n\n0 - Não\n1 - Sim','agi-conf1',1),(39,'AGI - Informar tempo disponível','say_timetocall','0','informa no inicio da chamada o tempo total de minutos disponível ','agi-conf1',1),(40,'AGI - Autenticação por CallerID','cid_enable','0','Ativar autenticação por CallerID.\n0 - Não\n1 - Sim\n','agi-conf1',1),(41,'AGI - Backup por LCR/LCD Prefix','failover_lc_prefix','1','Se ativo e existir dois prefixo idênticos no mesmo plano, o MBilling vai usar 1º o de menor custo.\nSe o tronco da 1º tarifa nao completar a chamada, e não tiver um tronco backup, o MBilling usará a segunda tarifa','agi-conf1',1),(42,'AGI - Comando Dial','dialcommand_param',',60,L(%timeout%:61000:30000)','Mais informações em : http://voip-info.org/wiki-Asterisk+cmd+dial','agi-conf1',1),(43,'AGI - Internal Call, Dial Command Params','dialcommand_param_sipiax_friend',',60,TtiL(3600000:61000:30000)','Parâmetros para o DIAL usado em ligações entre clientes.\nby default (3600000 = 1HOUR MAX CALL).','agi-conf1',1),(44,'AGI - DID Dial Command Params','dialcommand_param_call_2did',',45,TtiL(%timeout%:61000:30000)','%timeout% is the value of the paramater : Max time to Call a DID no billed','agi-conf1',1),(45,'AGI - Limite de tronco backup','failover_recursive_limit','5','Limite máximo de busca uso de tronco backup','agi-conf1',1),(46,'AGI - Tentativas de discagem','number_try','1','Números de tentativas para marcar o numero. Usado para callingcard\nValor minimo 1','agi-conf1',1),(47,'AGI - Outbound Call','switchdialcommand','0','Order para o comando DIAL\n\n1 - SIP/number@trunk\n0 - SIP/trunk/number\n\nAs duas formas trabalham iguais, mas alguns gateways so aceitam SIP/number@trunk.','agi-conf1',1),(48,'AGI - Informar saldo apôs chamada','say_balance_after_call','0','Diz o credito do cliente ao final da chamada\n0 - Não\n1 - Sim','agi-conf1',1),(85,'Ramal Voip para Espiar chamadas','channel_spy','0','Ramal Voip para Espiar chamada','global',1),(142,'Gerar usuário automaticamente','username_generate','1','Gerar usuário automaticamente quando for criar um novo cliente','global',1),(143,'Username Prefixo','generate_prefix','0','Prefixo para ser colocado no inicio quando for criado novos usuarios','global',1),(144,'Username tamanho','generate_length','5','Qual tamanho dos usuarios que devera ser criado? Ex 5 para gerar usuarios com 5 digitos','global',1),(145,'Atender o Callback','answer_callback','0','Atende callback e executa um audio','global',1),(146,'Callback - Adicionar prefixo','callback_add_prefix','','Adicionar prefixo no CallerID quando a chamada for um callback','global',1),(147,'Callback remover Prefixo','callback_remove_prefix','','Remove prefixo no CallerID quando a chamada for um callback','global',1),(233,'Menu color (Tema windows)','color_menu','White','Menu color, Black or White','global',0),(234,'Menu color (Tema windows)','color_menu','White','Menu color, Black or White','global',1),(235,'Cobrar Sip Call','charge_sip_call','0','Cobrar sip call entre clientes','global',1),(236,'URL to extra module','module_extra','index.php/extra/read','Url to extra module, default: index.php/extra/read','global',1),(237,'intra/inter Billing','intra-inter','0','Enable Intra-Inter Billing. If you enable this option, and you have another plan with the same name + Intra on the name Mbilling use the new plan to intra call','global',0),(238,'Ativar Paypal no Softphone Android','paypal-softphone','0','Ativar Paypal no Android Softphones, 0 - Disable 1 - Enable','global',1),(239,'Mostrar CallBack no Softphone','callback-softphone','0','Ativa o Callback no softphone Android 0 - Desativa 1 - Ativa','global',1),(240,'Invoice tax','invoice_tax','0','Tax to add in Invoice.','global',1),(241,'Log nivel','log','0','min 0 - max 5 ','global',0),(242,'Asterisk','asterisk_version','11','Set your Asterisk Version instaled. Default 1.8','global',0),(243,'Tts URL','tts_url','https://translate.google.com/translate_tts?ie=UTF-8&q=$name&tl=pt-BR&total=1&idx=0&textlen=25&client=t&tk=55786|34299.','Set here the URL to use in Massive Call. Use variable $name in the string field','global',1),(244,'fm.transfer-to.com username','fm_transfer_to_username',NULL,'Username in Transfer To','global',0),(245,'fm.transfer-to.com token','fm_transfer_to_ token',NULL,'Token to Transfer To API','global',0),(248,'Days to find in Summary per agent','summary_per_agent_days','7','Days to find when you open the menu Summary per Agent','global',1),(249,'MixMonitor Format','MixMonitor_format','gsm','Veja as extensões permitidas em http://www.voip-info.org/wiki/view/MixMonitor','global',1),(251,'fm.transfer-to.com print Header','fm_transfer_print_header','Change it in configuration menu','Description to print header','global',0),(252,'fm.transfer-to.com print Footer','fm_transfer_print_footer','Change it in configuration menu','Description to print footer','global',0),(253,'fm.transfer-to.com Currency','fm_transfer_currency','€','Set the transfer-to currency','global',0),(254,'Sip trunk short duration call','trunk_short_duration_call','3','SIP TRUNK short duration call','global',1),(255,'Sip trunk short total calls','trunk_short_total_calls','0','Sip trunk short total calls','global',1),(256,'Enable IAX','enable_izx','3','Enable IAX','global',0),(259,'BDService Url','BDService_url','https://req.ovinovo.net','Default https://req.ovinovo.net','global',0),(260,'Gerar a senha automaticamente no formulario de registro','signup_auto_pass','0','Coloque o numero total de digitos que deseja gerar a senha. EX: Se quer uma senha de 10 digitos, colocar 10. Minimo 6. Deixe em branco para o usuário poder cadastrar a propria senha','global',1),(261,'Link para redes sociais para mostrar no painel de cliente','social_media_network','','Link para redes sociais para mostrar no painel de cliente','global',1),(262,'Link termos do formulario de register','accept_terms_link','','Link para os termos de registro','global',1),(263,'Gerar automaticamente o usuario do formulario de registro','auto_generate_user_signup','1','Gerar automaticamente o usuario do formulario de registro','global',1),(264,'Notificação de  Pagamento de serviços','service_daytopay','5','Total Dias anterior ao vencimento que o MagnusBilling avisara o cliente para pagar os serviços','global',1),(265,'Start User Call Limit','start_user_call_limit','-1','Default call limit for new user','global',0),(266,'CallingCard atender a chamada','callingcard_answer','1','Executa o Answer no CallingCard','agi-conf1',1),(267,'CallingCard ativar CID authentication','callingcard_cid_enable','1','CID authentication no CallingCard','agi-conf1',1),(268,'CallingCard tentativas','callingcard_number_try','3','Quantas vezes o CallingCard vai pedir para digitar o numero desejado, caso falhar.','agi-conf1',1),(269,'CallingCard diz preço da tarifa','callingcard_say_rateinitial','0','CallingCard diz preço da tarifa','agi-conf1',1),(270,'CallingCard diz tempo total restante','callingcard_say_timetocall','0','CallingCard diz tempo total restante','agi-conf1',1),(271,'reCaptchaKey sitekey','reCaptchaKey','','Generate your sitekey in https://www.google.com/recaptcha/admin#list','global',1),(272,'BDService Username','BDService_username','','BDService username','global',0),(273,'BDService token','BDService_token','','BDService token','global',0),(274,'BDService flexiload values','BDService_flexiload','10-1000','BDService flexiload values','global',0),(275,'BDService bkash values','BDService_bkash','50-2500','BDService bkash values','global',0),(276,'BDService currency translation','BDService_cambio','0.01','BDService currency translation','global',0),(277,'BDService DBBL/Rocket values','BDService_dbbl_rocket','10-1000','DBBL/Rocket flexiload values','global',0),(278,'BDService Credit','BDService_credit_provider','0','BDService Credit','global',0),(279,'Session timeout','session_timeout','3600','Tempo em segundos para fechar as sessoes do painel.','global',1),(280,'Mostrar icone PLAY no menu Relatório de Ligaçōes','show_playicon_cdr','0','Mostrar icone PLAY no menu Relatório de Ligaçōes','global',1),(281,'Mostrar icone de ajuda','show_filed_help','1','Mostrar icone de ajuda nos formulários','global',1),(282,'Autenticação por IP/tech - Tamanho do tech','ip_tech_length','6','Autenticação IP/tech Tamanho 4, 5 or 6 digitos','global',1),(283,'Baixar gravaçoes via API URL','external_record_link','','URL para baixar as gravaçoes. Permite baixar somente 1 audio por vez. Deixe em branco para desativar. URL EX: http://IP/record.php?username=%user%&amp;audio=%number%.%uniqueid%.%audio_exten%','global',1),(284,'Campaign call limit to users','campaign_user_limit','1','Campaign call limit to users','global',1),(285,'Ativar CallingCard','enable_callingcard','1','Ativar CallingCard. \n 0 - Desativa \n 1 - Ativa','global',1),(286,'Avisar admin/email quando alguem se registrar','signup_admin_email','1','Envia um email para o administrador quando alguem se cadastrar no formulário de registro. \n 0 - Desativa \n 1 - Ativa','global',1),(287,'Show Signup button on login page','show_signup_button','0','Show Signup button on login page\n 0 - Disable \n1 - Enable','global',1),(288,'reCaptchaKey secretkey','reCaptchaSecret','','Generate your secredt key in https://www.google.com/recaptcha/admin#list','global',1),(289,'Enable Signup Form','enable_signup','1','Enable Signup form','global',1),(290,'Background Color','backgroundColor','#1b1e23','Background Color','global',1),(291,'DIDWW APY KEY','didww_api_key','','DIDWW APY KEY','global',1),(292,'DIDWW APY URL','didww_url','https://api.didww.com/v3/','DIDWW APY URL','global',1),(293,'DIDWW PROFIT','didww_profit','0','DIDWW profit percentage. Integer value','global',1),(294,'URL to extra module2','module_extra2','','Url to extra module, default: index.php/extra2/read','global',1),(295,'URL to extra module3','module_extra3','','Url to extra module, default: index.php/extra3/read','global',1),(296,'DIDWW CURRENCY CONVERTER','didww_curreny_converter','0','DIDWW CURRENCY CONVERTER. Ex. 1 USD in your local currency is 3.25, so add here 3.25','global',1),(297,'Fixed CallerId to use on Signup','fixed_callerid_signup','','Fixed CallerId to use on Signup, Leave blank to use the user phone','global',1),(298,'Apply the local prefix rule on DID and Sip Call','apply_local_prefix_did_sip','0','Apply the local prefix rule on DID and Sip Call','global',1),(299,'Default Codecs','default_codeds','g729,gsm,opus,alaw,ulaw','Default Codecs','global',1),(300,'Permitir usuários se registrar com CPF/CNPJ já em uso','signup_unique_doc','1','config_desc_signup_unique_doc','global',1),(301,'Show Broadcasting DashBoard on User home panel','showMCDashBoard','0','Show the Campaign DashBoard to User','global',1),(302,'Incoming DID first Digit Removal','did_ignore_zero_on_did','0','0=Disable \n1=Enable Remove First Digit of Incoming DID','global',1),(303,'Enable IAX internal calls','use_sip_to_iax','0','Enable IAX internal calls','global',1),(304,'Login header','login_header','Log in','Login header','global',1),(305,'Record all calls','global_record_calls','0','0=Disable \n1=Enable\n Record all calls, the fields record calls will be hidden if this option is activated.','global',1),(306,'Default prefix rule','default_prefix_rule','','This rule will be used when you create a new user or on the Sign up  form. More details about prefix rule on the bellow link https://www.magnusbilling.org/local_prefix','global',1),(307,'Deletar ligações arquivadas anterior a X meses','delete_cdr_archived_prior_x_month','0','Deletar ligações arquivadas anterior a X meses.','global',1),(308,'Deletar ligações rejeitadas arquivadas anterior a X meses','delete_cdr_failed_archived_prior_x_month','0','Deletar ligações rejeitadas arquivadas anterior a X meses','global',1),(309,'Cobrar o DID/serviços se o cliente tiver crédito suficiente antes da data de vencimento','charge_did_services_before_due_date','1','Cobrar o DID/serviços se o cliente tiver crédito suficiente antes da data de vencimento','global',1),(310,'Allow login on webpanel with SIP user and password','sipuser_login','1','Allow login on webpanel with SIP user and password','global',1),(311,'Disable CDR count','remove_count_cdr','0','It will make the CDR more efficiency, particularly when utilizing filters','global',1),(312,'Max call duration','max_call_duration','3600','Maximum call duration in seconds','global',1),(313,'API allow multiple user/email','api_allow_same_ip','0','Allow create muiltiple clients with same email via API','global',1),(314,'Disable CDR count','remove_count_cdr','0','It will make the CDR more efficiency, particularly when utilizing filters','global',1),(315,'Max call duration','max_call_duration','3600','Maximum call duration in seconds','global',1),(316,'API allow multiple user/email','api_allow_same_ip','0','Allow create muiltiple clients with same email via API','global',1);
/*!40000 ALTER TABLE `pkg_configuration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pkg_cryptocurrency`
--

DROP TABLE IF EXISTS `pkg_cryptocurrency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pkg_cryptocurrency` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_user` int NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `currency` varchar(50) NOT NULL,
  `amountCrypto` decimal(15,8) NOT NULL DEFAULT '0.00000000',
  `amount` decimal(15,8) NOT NULL DEFAULT '0.00000000',
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_pkg_user_pkg_cryptocurrency` (`id_user`),
  CONSTRAINT `fk_pkg_user_pkg_cryptocurrency` FOREIGN KEY (`id_user`) REFERENCES `pkg_user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pkg_cryptocurrency`
--

LOCK TABLES `pkg_cryptocurrency` WRITE;
/*!40000 ALTER TABLE `pkg_cryptocurrency` DISABLE KEYS */;
INSERT INTO `pkg_cryptocurrency` VALUES (1,2,1,'USDT',16.57585500,100.00000000,'2025-01-16 18:48:46'),(2,2,1,'USDT',16.57593800,100.00000000,'2025-01-16 19:00:04');
/*!40000 ALTER TABLE `pkg_cryptocurrency` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pkg_did`
--

DROP TABLE IF EXISTS `pkg_did`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pkg_did` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_user` int DEFAULT NULL,
  `id_server` int DEFAULT NULL,
  `activated` int NOT NULL DEFAULT '1',
  `reserved` tinyint DEFAULT '0',
  `did` char(50) NOT NULL,
  `callerid` varchar(50) NOT NULL DEFAULT '',
  `creationdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `startingdate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `expirationdate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `description` mediumtext,
  `secondusedreal` int DEFAULT '0',
  `billingtype` int DEFAULT '0',
  `cbr` tinyint(1) NOT NULL DEFAULT '0',
  `fixrate` float NOT NULL DEFAULT '0',
  `connection_charge` decimal(15,5) NOT NULL DEFAULT '0.00000',
  `expression_1` varchar(150) NOT NULL DEFAULT '*',
  `selling_rate_1` decimal(15,5) NOT NULL DEFAULT '0.00000',
  `agent_client_rate_1` decimal(15,5) NOT NULL DEFAULT '0.00000',
  `buy_rate_1` decimal(15,5) NOT NULL DEFAULT '0.00000',
  `expression_2` varchar(150) NOT NULL DEFAULT '*',
  `selling_rate_2` decimal(15,5) NOT NULL DEFAULT '0.00000',
  `agent_client_rate_2` decimal(15,5) NOT NULL DEFAULT '0.00000',
  `buy_rate_2` decimal(15,5) NOT NULL DEFAULT '0.00000',
  `connection_sell` decimal(15,5) NOT NULL DEFAULT '0.00000',
  `minimal_time_charge` int NOT NULL DEFAULT '0',
  `minimal_time_buy` int NOT NULL DEFAULT '1',
  `initblock` int NOT NULL DEFAULT '1',
  `buyrateinitblock` int NOT NULL DEFAULT '1',
  `cbr_ua` tinyint(1) NOT NULL DEFAULT '0',
  `cbr_em` tinyint(1) NOT NULL DEFAULT '0',
  `cbr_total_try` int NOT NULL DEFAULT '3',
  `cbr_time_try` int NOT NULL DEFAULT '30',
  `increment` int NOT NULL DEFAULT '1',
  `buyrateincrement` int NOT NULL DEFAULT '1',
  `block_expression_1` smallint NOT NULL DEFAULT '0',
  `block_expression_2` smallint NOT NULL DEFAULT '0',
  `expression_3` varchar(150) NOT NULL DEFAULT '*',
  `selling_rate_3` decimal(15,5) NOT NULL DEFAULT '0.00000',
  `agent_client_rate_3` decimal(15,5) NOT NULL DEFAULT '0.00000',
  `buy_rate_3` decimal(15,5) NOT NULL DEFAULT '0.00000',
  `block_expression_3` smallint NOT NULL DEFAULT '0',
  `charge_of` int NOT NULL DEFAULT '1',
  `send_to_callback_1` tinyint(1) NOT NULL DEFAULT '0',
  `send_to_callback_2` tinyint(1) NOT NULL DEFAULT '0',
  `send_to_callback_3` tinyint(1) NOT NULL DEFAULT '0',
  `TimeOfDay_monFri` varchar(150) DEFAULT NULL,
  `TimeOfDay_sat` varchar(150) DEFAULT NULL,
  `TimeOfDay_sun` varchar(150) DEFAULT NULL,
  `workaudio` varchar(150) DEFAULT NULL,
  `noworkaudio` varchar(150) DEFAULT NULL,
  `calllimit` int NOT NULL DEFAULT '-1',
  `record_call` int NOT NULL DEFAULT '0',
  `country` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `did` (`did`),
  KEY `fk_pkg_user_pkg_did` (`id_user`),
  CONSTRAINT `fk_pkg_user_pkg_did` FOREIGN KEY (`id_user`) REFERENCES `pkg_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=141 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pkg_did`
--

LOCK TABLES `pkg_did` WRITE;
/*!40000 ALTER TABLE `pkg_did` DISABLE KEYS */;
INSERT INTO `pkg_did` VALUES (2,3,NULL,1,1,'22222','','2025-01-21 21:21:41','2025-01-21 21:21:41','2030-08-21 03:00:00','',0,0,0,0,0.00000,'.*',0.00000,0.00000,0.00000,'.*',0.00000,0.00000,0.00000,0.00000,1,1,1,1,0,0,3,30,1,1,0,0,'.*',0.00000,0.00000,0.00000,0,1,0,0,0,'09:00-12:00|14:00-18:00','09:00-12:00','00:00',NULL,NULL,-1,0,''),(130,NULL,NULL,1,0,'10','','2025-01-24 21:45:52','2025-01-24 21:45:52','2030-08-21 03:00:00','',0,0,0,0,0.00000,'.*',0.00000,0.00000,0.00000,'.*',0.00000,0.00000,0.00000,0.00000,1,1,1,1,0,0,3,30,1,1,0,0,'.*',0.00000,0.00000,0.00000,0,1,0,0,0,'09:00-12:00|14:00-18:00','09:00-12:00','00:00',NULL,NULL,-1,0,''),(131,NULL,NULL,1,0,'11','','2025-01-24 21:45:52','2025-01-24 21:45:52','2030-08-21 03:00:00','',0,0,0,0,0.00000,'.*',0.00000,0.00000,0.00000,'.*',0.00000,0.00000,0.00000,0.00000,1,1,1,1,0,0,3,30,1,1,0,0,'.*',0.00000,0.00000,0.00000,0,1,0,0,0,'09:00-12:00|14:00-18:00','09:00-12:00','00:00',NULL,NULL,-1,0,''),(132,NULL,NULL,1,0,'12','','2025-01-24 21:45:52','2025-01-24 21:45:52','2030-08-21 03:00:00','',0,0,0,0,0.00000,'.*',0.00000,0.00000,0.00000,'.*',0.00000,0.00000,0.00000,0.00000,1,1,1,1,0,0,3,30,1,1,0,0,'.*',0.00000,0.00000,0.00000,0,1,0,0,0,'09:00-12:00|14:00-18:00','09:00-12:00','00:00',NULL,NULL,-1,0,''),(133,NULL,NULL,1,0,'13','','2025-01-24 21:45:52','2025-01-24 21:45:52','2030-08-21 03:00:00','',0,0,0,0,0.00000,'.*',0.00000,0.00000,0.00000,'.*',0.00000,0.00000,0.00000,0.00000,1,1,1,1,0,0,3,30,1,1,0,0,'.*',0.00000,0.00000,0.00000,0,1,0,0,0,'09:00-12:00|14:00-18:00','09:00-12:00','00:00',NULL,NULL,-1,0,''),(134,NULL,NULL,1,0,'14','','2025-01-24 21:45:52','2025-01-24 21:45:52','2030-08-21 03:00:00','',0,0,0,0,0.00000,'.*',0.00000,0.00000,0.00000,'.*',0.00000,0.00000,0.00000,0.00000,1,1,1,1,0,0,3,30,1,1,0,0,'.*',0.00000,0.00000,0.00000,0,1,0,0,0,'09:00-12:00|14:00-18:00','09:00-12:00','00:00',NULL,NULL,-1,0,''),(135,NULL,NULL,1,0,'15','','2025-01-24 21:45:52','2025-01-24 21:45:52','2030-08-21 03:00:00','',0,0,0,0,0.00000,'.*',0.00000,0.00000,0.00000,'.*',0.00000,0.00000,0.00000,0.00000,1,1,1,1,0,0,3,30,1,1,0,0,'.*',0.00000,0.00000,0.00000,0,1,0,0,0,'09:00-12:00|14:00-18:00','09:00-12:00','00:00',NULL,NULL,-1,0,''),(136,NULL,NULL,1,0,'16','','2025-01-24 21:45:52','2025-01-24 21:45:52','2030-08-21 03:00:00','',0,0,0,0,0.00000,'.*',0.00000,0.00000,0.00000,'.*',0.00000,0.00000,0.00000,0.00000,1,1,1,1,0,0,3,30,1,1,0,0,'.*',0.00000,0.00000,0.00000,0,1,0,0,0,'09:00-12:00|14:00-18:00','09:00-12:00','00:00',NULL,NULL,-1,0,''),(137,NULL,NULL,1,0,'17','','2025-01-24 21:45:52','2025-01-24 21:45:52','2030-08-21 03:00:00','',0,0,0,0,0.00000,'.*',0.00000,0.00000,0.00000,'.*',0.00000,0.00000,0.00000,0.00000,1,1,1,1,0,0,3,30,1,1,0,0,'.*',0.00000,0.00000,0.00000,0,1,0,0,0,'09:00-12:00|14:00-18:00','09:00-12:00','00:00',NULL,NULL,-1,0,''),(138,NULL,NULL,1,0,'18','','2025-01-24 21:45:52','2025-01-24 21:45:52','2030-08-21 03:00:00','',0,0,0,0,0.00000,'.*',0.00000,0.00000,0.00000,'.*',0.00000,0.00000,0.00000,0.00000,1,1,1,1,0,0,3,30,1,1,0,0,'.*',0.00000,0.00000,0.00000,0,1,0,0,0,'09:00-12:00|14:00-18:00','09:00-12:00','00:00',NULL,NULL,-1,0,''),(139,NULL,NULL,1,0,'19','','2025-01-24 21:45:52','2025-01-24 21:45:52','2030-08-21 03:00:00','',0,0,0,0,0.00000,'.*',0.00000,0.00000,0.00000,'.*',0.00000,0.00000,0.00000,0.00000,1,1,1,1,0,0,3,30,1,1,0,0,'.*',0.00000,0.00000,0.00000,0,1,0,0,0,'09:00-12:00|14:00-18:00','09:00-12:00','00:00',NULL,NULL,-1,0,''),(140,NULL,NULL,1,0,'20','','2025-01-24 21:45:52','2025-01-24 21:45:52','2030-08-21 03:00:00','',0,0,0,0,0.00000,'.*',0.00000,0.00000,0.00000,'.*',0.00000,0.00000,0.00000,0.00000,1,1,1,1,0,0,3,30,1,1,0,0,'.*',0.00000,0.00000,0.00000,0,1,0,0,0,'09:00-12:00|14:00-18:00','09:00-12:00','00:00',NULL,NULL,-1,0,'');
/*!40000 ALTER TABLE `pkg_did` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pkg_did_destination`
--

DROP TABLE IF EXISTS `pkg_did_destination`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pkg_did_destination` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_user` int NOT NULL,
  `id_ivr` int DEFAULT NULL,
  `id_sip` int DEFAULT NULL,
  `id_queue` int DEFAULT NULL,
  `id_did` int NOT NULL,
  `destination` varchar(120) NOT NULL,
  `context` text,
  `priority` int NOT NULL DEFAULT '0',
  `creationdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `activated` int NOT NULL DEFAULT '1',
  `secondusedreal` int DEFAULT '0',
  `voip_call` int DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_pkg_did_pkg_did_destination` (`id_did`),
  KEY `fk_pkg_user_pkg_did_destination` (`id_user`),
  CONSTRAINT `fk_pkg_did_pkg_did_destination` FOREIGN KEY (`id_did`) REFERENCES `pkg_did` (`id`),
  CONSTRAINT `fk_pkg_user_pkg_did_destination` FOREIGN KEY (`id_user`) REFERENCES `pkg_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pkg_did_destination`
--

LOCK TABLES `pkg_did_destination` WRITE;
/*!40000 ALTER TABLE `pkg_did_destination` DISABLE KEYS */;
INSERT INTO `pkg_did_destination` VALUES (2,3,0,2,0,2,'','',1,'2025-01-21 21:21:41',1,0,1);
/*!40000 ALTER TABLE `pkg_did_destination` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pkg_did_history`
--

DROP TABLE IF EXISTS `pkg_did_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pkg_did_history` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL,
  `did` varchar(50) DEFAULT NULL,
  `reservationdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `releasedate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `month_payed` int DEFAULT '0',
  `description` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `username` (`username`),
  KEY `did` (`did`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pkg_did_history`
--

LOCK TABLES `pkg_did_history` WRITE;
/*!40000 ALTER TABLE `pkg_did_history` DISABLE KEYS */;
INSERT INTO `pkg_did_history` VALUES (1,'teste24','11111','2025-01-21 16:37:20','2025-01-24 20:55:38',1,''),(2,'11642','20','2025-01-24 18:45:52','2025-01-24 21:46:06',1,''),(3,'11642','10','2025-01-24 18:45:52','2025-01-24 21:46:06',1,''),(4,'11642','11','2025-01-24 18:45:52','2025-01-24 21:46:06',1,''),(5,'11642','12','2025-01-24 18:45:52','2025-01-24 21:46:06',1,''),(6,'11642','13','2025-01-24 18:45:52','2025-01-24 21:46:06',1,''),(7,'11642','14','2025-01-24 18:45:52','2025-01-24 21:46:06',1,''),(8,'11642','15','2025-01-24 18:45:52','2025-01-24 21:46:06',1,''),(9,'11642','16','2025-01-24 18:45:52','2025-01-24 21:46:06',1,''),(10,'11642','17','2025-01-24 18:45:52','2025-01-24 21:46:06',1,''),(11,'11642','18','2025-01-24 18:45:52','2025-01-24 21:46:06',1,''),(12,'11642','19','2025-01-24 18:45:52','2025-01-24 21:46:06',1,'');
/*!40000 ALTER TABLE `pkg_did_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pkg_did_use`
--

DROP TABLE IF EXISTS `pkg_did_use`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pkg_did_use` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_user` int DEFAULT NULL,
  `id_did` int DEFAULT NULL,
  `reservationdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `releasedate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `status` int DEFAULT '0',
  `month_payed` int DEFAULT '0',
  `reminded` tinyint NOT NULL DEFAULT '0',
  `next_due_date` varchar(30) DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `id_card` (`id_user`),
  KEY `id_did` (`id_did`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pkg_did_use`
--

LOCK TABLES `pkg_did_use` WRITE;
/*!40000 ALTER TABLE `pkg_did_use` DISABLE KEYS */;
INSERT INTO `pkg_did_use` VALUES (2,3,2,'2025-01-21 18:21:41','0000-00-00 00:00:00',1,1,0,'2025-02-21 15:21:41'),(3,34,130,'2025-01-24 18:45:52','2025-01-24 21:46:06',0,1,0,''),(4,34,131,'2025-01-24 18:45:52','2025-01-24 21:46:06',0,1,0,''),(5,34,132,'2025-01-24 18:45:52','2025-01-24 21:46:06',0,1,0,''),(6,34,133,'2025-01-24 18:45:52','2025-01-24 21:46:06',0,1,0,''),(7,34,134,'2025-01-24 18:45:52','2025-01-24 21:46:06',0,1,0,''),(8,34,135,'2025-01-24 18:45:52','2025-01-24 21:46:06',0,1,0,''),(9,34,136,'2025-01-24 18:45:52','2025-01-24 21:46:06',0,1,0,''),(10,34,137,'2025-01-24 18:45:52','2025-01-24 21:46:06',0,1,0,''),(11,34,138,'2025-01-24 18:45:52','2025-01-24 21:46:06',0,1,0,''),(12,34,139,'2025-01-24 18:45:52','2025-01-24 21:46:06',0,1,0,''),(13,34,140,'2025-01-24 18:45:52','2025-01-24 21:46:06',0,1,0,'');
/*!40000 ALTER TABLE `pkg_did_use` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pkg_estados`
--

DROP TABLE IF EXISTS `pkg_estados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pkg_estados` (
  `id` int NOT NULL,
  `nome` varchar(45) NOT NULL,
  `sigla` varchar(2) NOT NULL,
  PRIMARY KEY (`id`,`sigla`),
  UNIQUE KEY `sigla_UNIQUE` (`sigla`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pkg_estados`
--

LOCK TABLES `pkg_estados` WRITE;
/*!40000 ALTER TABLE `pkg_estados` DISABLE KEYS */;
INSERT INTO `pkg_estados` VALUES (1,'Acre','AC'),(2,'Alagoas','AL'),(3,'Amazonas','AM'),(4,'Amapá','AP'),(5,'Bahia','BA'),(6,'Ceará','CE'),(7,'Distrito Federal','DF'),(8,'Espírito Santo','ES'),(9,'Goiás','GO'),(10,'Maranhão','MA'),(11,'Minas Gerais','MG'),(12,'Mato Grosso do Sul','MS'),(13,'Mato Grosso','MT'),(14,'Pará','PA'),(15,'Paraíba','PB'),(16,'Pernambuco','PE'),(17,'Piauí','PI'),(18,'Paraná','PR'),(19,'Rio de Janeiro','RJ'),(20,'Rio Grande do Norte','RN'),(21,'Rondônia','RO'),(22,'Roraima','RR'),(23,'Rio Grande do Sul','RS'),(24,'Santa Catarina','SC'),(25,'Sergipe','SE'),(26,'São Paulo','SP'),(27,'Tocantins','TO');
/*!40000 ALTER TABLE `pkg_estados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pkg_firewall`
--

DROP TABLE IF EXISTS `pkg_firewall`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pkg_firewall` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ip` varchar(50) NOT NULL,
  `action` int NOT NULL,
  `description` text NOT NULL,
  `jail` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pkg_firewall`
--

LOCK TABLES `pkg_firewall` WRITE;
/*!40000 ALTER TABLE `pkg_firewall` DISABLE KEYS */;
/*!40000 ALTER TABLE `pkg_firewall` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pkg_group_module`
--

DROP TABLE IF EXISTS `pkg_group_module`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pkg_group_module` (
  `id_group` int NOT NULL,
  `id_module` int NOT NULL,
  `action` varchar(45) NOT NULL,
  `show_menu` tinyint(1) NOT NULL DEFAULT '1',
  `createShortCut` tinyint(1) NOT NULL DEFAULT '0',
  `createQuickStart` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_group`,`id_module`),
  KEY `fk_pkg_module_group_pkg_module` (`id_module`),
  CONSTRAINT `fk_pkg_group_user_pkg_group_module` FOREIGN KEY (`id_group`) REFERENCES `pkg_group_user` (`id`),
  CONSTRAINT `fk_pkg_module_group_pkg_module` FOREIGN KEY (`id_module`) REFERENCES `pkg_module` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pkg_group_module`
--

LOCK TABLES `pkg_group_module` WRITE;
/*!40000 ALTER TABLE `pkg_group_module` DISABLE KEYS */;
INSERT INTO `pkg_group_module` VALUES (1,1,'r',1,0,0),(1,3,'crud',1,0,0),(1,4,'crud',1,0,0),(1,5,'r',1,0,0),(1,6,'crud',1,0,0),(1,7,'r',1,0,0),(1,8,'r',1,0,0),(1,9,'r',1,0,0),(1,10,'r',1,0,0),(1,12,'r',1,0,0),(1,14,'r',1,0,0),(1,15,'crud',1,0,0),(1,16,'crud',1,0,0),(1,17,'crud',1,1,1),(1,19,'crud',1,1,1),(1,20,'crud',1,0,0),(1,21,'crud',1,1,1),(1,22,'crud',1,0,0),(1,23,'crud',1,1,1),(1,25,'crud',1,0,0),(1,26,'crud',1,0,0),(1,27,'crud',1,0,0),(1,28,'crud',1,0,0),(1,29,'crud',1,1,1),(1,30,'crud',1,1,1),(1,31,'crud',1,0,0),(1,32,'crud',1,0,0),(1,33,'crud',1,0,0),(1,34,'crud',1,0,0),(1,36,'crud',1,0,0),(1,40,'crud',1,1,1),(1,45,'crud',1,0,0),(1,46,'crud',1,0,0),(1,48,'crud',1,0,0),(1,50,'crud',1,0,0),(1,51,'crud',1,0,0),(1,53,'crud',1,0,0),(1,54,'crud',1,0,0),(1,55,'crud',1,0,0),(1,56,'crud',1,0,0),(1,58,'crud',1,0,0),(1,59,'crud',1,0,0),(1,60,'crud',1,0,0),(1,61,'crud',1,0,0),(1,64,'crud',1,0,0),(1,65,'crud',1,0,0),(1,66,'crud',1,0,0),(1,67,'crud',1,0,0),(1,68,'crud',1,0,0),(1,69,'crud',1,0,0),(1,71,'crud',1,0,0),(1,72,'crud',1,0,0),(1,73,'crud',1,0,0),(1,77,'crud',1,0,0),(1,78,'crud',1,0,0),(1,79,'crud',1,0,0),(1,80,'crud',1,0,0),(1,83,'crud',1,0,0),(1,85,'r',1,0,0),(1,86,'crud',1,0,0),(1,87,'crud',1,0,0),(1,88,'crud',1,0,0),(1,89,'crud',1,0,0),(1,90,'crud',1,0,0),(1,91,'crud',1,0,0),(1,92,'crud',1,0,0),(1,93,'crud',1,0,0),(1,94,'crud',1,0,0),(1,95,'crud',1,0,0),(1,96,'crud',1,0,0),(1,97,'crud',1,0,0),(1,98,'crud',1,0,0),(1,99,'crud',1,0,0),(1,100,'crud',1,0,0),(1,101,'crud',1,0,0),(1,102,'crud',1,0,0),(1,104,'crud',1,0,0),(1,106,'crud',1,0,0),(1,107,'crud',1,0,0),(1,108,'crud',1,0,0),(1,109,'crud',1,0,0),(1,110,'crud',1,0,0),(1,111,'crud',1,0,0),(1,112,'crud',1,0,0),(3,1,'r',1,0,0),(3,5,'r',1,0,0),(3,7,'r',1,0,0),(3,8,'r',1,0,0),(3,9,'r',0,0,0),(3,15,'ru',1,0,0),(3,19,'r',1,0,0),(3,20,'r',1,0,0),(3,21,'r',1,0,0),(3,22,'r',1,0,0),(3,23,'r',1,0,0),(3,25,'r',0,0,0),(3,26,'r',0,0,0),(3,28,'r',0,0,0),(3,29,'r',1,0,0),(3,30,'r',0,0,0),(3,31,'r',1,0,0),(3,32,'ru',1,0,0),(3,33,'r',0,0,0),(3,34,'r',0,0,0),(3,36,'r',1,0,0),(3,45,'r',0,0,0),(3,46,'r',0,0,0),(3,48,'r',1,0,0),(3,55,'r',1,0,0),(3,56,'cr',1,0,0),(3,58,'cr',1,0,0),(3,59,'cr',1,0,0),(3,61,'r',1,0,0),(3,66,'r',0,0,0),(3,67,'r',0,0,0),(3,68,'r',1,0,0),(3,78,'r',1,0,0),(3,79,'r',0,0,0),(3,80,'r',0,0,0),(3,83,'r',0,0,0),(3,90,'r',0,0,0),(3,93,'r',0,0,0),(3,99,'r',1,0,0),(3,106,'r',1,0,0),(3,111,'r',0,0,0),(3,112,'r',1,0,0),(4,1,'r',1,0,0),(4,3,'crud',1,0,0),(4,4,'crud',1,0,0),(4,5,'r',1,0,0),(4,6,'crud',1,0,0),(4,7,'r',1,0,0),(4,8,'r',1,0,0),(4,9,'r',1,0,0),(4,10,'r',1,0,0),(4,12,'r',1,0,0),(4,14,'r',1,0,0),(4,15,'crud',1,0,0),(4,16,'crud',1,0,0),(4,17,'crud',1,1,1),(4,19,'crud',1,1,1),(4,20,'crud',1,0,0),(4,21,'crud',1,1,1),(4,22,'crud',1,0,0),(4,23,'crud',1,1,1),(4,25,'crud',1,0,0),(4,26,'crud',1,0,0),(4,27,'crud',1,0,0),(4,28,'crud',1,0,0),(4,29,'crud',1,1,1),(4,30,'crud',1,1,1),(4,31,'crud',1,0,0),(4,32,'crud',1,0,0),(4,33,'crud',1,0,0),(4,34,'crud',1,0,0),(4,36,'crud',1,0,0),(4,40,'crud',1,1,1),(4,45,'crud',1,0,0),(4,46,'crud',1,0,0),(4,48,'crud',1,0,0),(4,50,'crud',1,0,0),(4,51,'crud',1,0,0),(4,53,'crud',1,0,0),(4,54,'crud',1,0,0),(4,55,'crud',1,0,0),(4,56,'crud',1,0,0),(4,58,'crud',1,0,0),(4,59,'crud',1,0,0),(4,60,'crud',1,0,0),(4,61,'crud',1,0,0),(4,64,'crud',1,0,0),(4,65,'crud',1,0,0),(4,66,'crud',1,0,0),(4,67,'crud',1,0,0),(4,68,'crud',1,0,0),(4,69,'crud',1,0,0),(4,71,'crud',1,0,0),(4,72,'crud',1,0,0),(4,73,'crud',1,0,0),(4,77,'crud',1,0,0),(4,78,'crud',1,0,0),(4,79,'crud',1,0,0),(4,80,'crud',1,0,0),(4,83,'crud',1,0,0),(4,85,'r',1,0,0),(4,86,'crud',1,0,0),(4,87,'crud',1,0,0),(4,88,'crud',1,0,0),(4,89,'crud',1,0,0),(4,90,'crud',1,0,0),(4,91,'crud',1,0,0),(4,92,'crud',1,0,0),(4,93,'crud',1,0,0),(4,94,'crud',1,0,0),(4,95,'crud',1,0,0),(4,96,'crud',1,0,0),(4,97,'crud',1,0,0),(4,98,'crud',1,0,0),(4,99,'crud',1,0,0),(4,100,'crud',1,0,0),(4,101,'crud',1,0,0),(4,102,'crud',1,0,0),(4,104,'crud',1,0,0),(4,106,'crud',1,0,0),(4,107,'crud',1,0,0),(4,108,'crud',1,0,0),(4,109,'crud',1,0,0),(4,110,'crud',1,0,0),(4,111,'crud',1,0,0),(4,112,'crud',1,0,0),(5,1,'r',1,0,0),(5,5,'r',1,0,0),(5,7,'r',1,0,0),(5,8,'r',1,0,0),(5,9,'r',0,0,0),(5,15,'ru',1,0,0),(5,19,'r',1,0,0),(5,20,'r',1,0,0),(5,21,'r',1,0,0),(5,22,'r',1,0,0),(5,23,'r',1,0,0),(5,25,'r',0,0,0),(5,26,'r',0,0,0),(5,28,'r',0,0,0),(5,29,'r',1,0,0),(5,30,'r',0,0,0),(5,31,'r',1,0,0),(5,32,'ru',1,0,0),(5,33,'r',0,0,0),(5,34,'r',0,0,0),(5,36,'r',1,0,0),(5,45,'r',0,0,0),(5,46,'r',0,0,0),(5,48,'r',1,0,0),(5,55,'r',1,0,0),(5,56,'cr',1,0,0),(5,58,'cr',1,0,0),(5,59,'cr',1,0,0),(5,61,'r',1,0,0),(5,66,'r',0,0,0),(5,67,'r',0,0,0),(5,68,'r',1,0,0),(5,78,'r',1,0,0),(5,79,'r',0,0,0),(5,80,'r',0,0,0),(5,83,'r',0,0,0),(5,90,'r',0,0,0),(5,93,'r',0,0,0),(5,99,'r',1,0,0),(5,106,'r',1,0,0),(5,111,'r',0,0,0),(5,112,'r',1,0,0),(6,1,'r',1,0,0),(6,5,'r',1,0,0),(6,7,'r',1,0,0),(6,8,'r',1,0,0),(6,9,'r',0,0,0),(6,15,'ru',1,0,0),(6,19,'r',1,0,0),(6,20,'r',1,0,0),(6,21,'r',1,0,0),(6,22,'r',1,0,0),(6,23,'r',1,0,0),(6,25,'r',0,0,0),(6,26,'r',0,0,0),(6,28,'r',0,0,0),(6,29,'r',1,0,0),(6,30,'r',0,0,0),(6,31,'r',1,0,0),(6,32,'ru',1,0,0),(6,33,'r',0,0,0),(6,34,'r',0,0,0),(6,36,'r',1,0,0),(6,45,'r',0,0,0),(6,46,'r',0,0,0),(6,48,'r',1,0,0),(6,55,'r',1,0,0),(6,56,'cr',1,0,0),(6,58,'cr',1,0,0),(6,59,'cr',1,0,0),(6,61,'r',1,0,0),(6,66,'r',0,0,0),(6,67,'r',0,0,0),(6,68,'r',1,0,0),(6,78,'r',1,0,0),(6,79,'r',0,0,0),(6,80,'r',0,0,0),(6,83,'r',0,0,0),(6,90,'r',0,0,0),(6,93,'r',0,0,0),(6,99,'r',1,0,0),(6,106,'r',1,0,0),(6,111,'r',0,0,0),(6,112,'r',1,0,0),(7,1,'r',1,0,0),(7,3,'crud',1,0,0),(7,4,'crud',1,0,0),(7,5,'r',1,0,0),(7,6,'crud',1,0,0),(7,7,'r',1,0,0),(7,8,'r',1,0,0),(7,9,'r',1,0,0),(7,10,'r',1,0,0),(7,12,'r',1,0,0),(7,14,'r',1,0,0),(7,15,'crud',1,0,0),(7,16,'crud',1,0,0),(7,17,'crud',1,1,1),(7,19,'crud',1,1,1),(7,20,'crud',1,0,0),(7,21,'crud',1,1,1),(7,22,'crud',1,0,0),(7,23,'crud',1,1,1),(7,25,'crud',1,0,0),(7,26,'crud',1,0,0),(7,27,'crud',1,0,0),(7,28,'crud',1,0,0),(7,29,'crud',1,1,1),(7,30,'crud',1,1,1),(7,31,'crud',1,0,0),(7,32,'crud',1,0,0),(7,33,'crud',1,0,0),(7,34,'crud',1,0,0),(7,36,'crud',1,0,0),(7,40,'crud',1,1,1),(7,45,'crud',1,0,0),(7,46,'crud',1,0,0),(7,48,'crud',1,0,0),(7,50,'crud',1,0,0),(7,51,'crud',1,0,0),(7,53,'crud',1,0,0),(7,54,'crud',1,0,0),(7,55,'crud',1,0,0),(7,56,'crud',1,0,0),(7,58,'crud',1,0,0),(7,59,'crud',1,0,0),(7,60,'crud',1,0,0),(7,61,'crud',1,0,0),(7,64,'crud',1,0,0),(7,65,'crud',1,0,0),(7,66,'crud',1,0,0),(7,67,'crud',1,0,0),(7,68,'crud',1,0,0),(7,69,'crud',1,0,0),(7,71,'crud',1,0,0),(7,72,'crud',1,0,0),(7,73,'crud',1,0,0),(7,77,'crud',1,0,0),(7,78,'crud',1,0,0),(7,79,'crud',1,0,0),(7,80,'crud',1,0,0),(7,83,'crud',1,0,0),(7,85,'r',1,0,0),(7,86,'crud',1,0,0),(7,87,'crud',1,0,0),(7,88,'crud',1,0,0),(7,89,'crud',1,0,0),(7,90,'crud',1,0,0),(7,91,'crud',1,0,0),(7,92,'crud',1,0,0),(7,93,'crud',1,0,0),(7,94,'crud',1,0,0),(7,95,'crud',1,0,0),(7,96,'crud',1,0,0),(7,97,'crud',1,0,0),(7,98,'crud',1,0,0),(7,99,'crud',1,0,0),(7,100,'crud',1,0,0),(7,101,'crud',1,0,0),(7,102,'crud',1,0,0),(7,104,'crud',1,0,0),(7,106,'crud',1,0,0),(7,107,'crud',1,0,0),(7,108,'crud',1,0,0),(7,109,'crud',1,0,0),(7,110,'crud',1,0,0),(7,111,'crud',1,0,0),(7,112,'crud',1,0,0);
/*!40000 ALTER TABLE `pkg_group_module` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pkg_group_user`
--

DROP TABLE IF EXISTS `pkg_group_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pkg_group_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `id_user_type` int NOT NULL,
  `user_prefix` int DEFAULT NULL,
  `hidden_prices` tinyint(1) NOT NULL DEFAULT '0',
  `hidden_batch_update` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `pkg_user_type_pkg_group_user` (`id_user_type`),
  CONSTRAINT `pkg_user_type_pkg_group_user` FOREIGN KEY (`id_user_type`) REFERENCES `pkg_user_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pkg_group_user`
--

LOCK TABLES `pkg_group_user` WRITE;
/*!40000 ALTER TABLE `pkg_group_user` DISABLE KEYS */;
INSERT INTO `pkg_group_user` VALUES (1,'Administrator',1,NULL,0,0),(2,'Agent',2,NULL,0,0),(3,'Client',3,NULL,0,0),(4,'Administrator Cloned2',1,NULL,0,0),(5,'Client Cloned',3,NULL,0,0),(6,'Client Cloned',3,NULL,0,0),(7,'Administrator Cloned',1,NULL,0,0);
/*!40000 ALTER TABLE `pkg_group_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pkg_group_user_group`
--

DROP TABLE IF EXISTS `pkg_group_user_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pkg_group_user_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_group_user` int NOT NULL,
  `id_group` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_pkg_pkg_group_user_pkg_group` (`id_group_user`),
  KEY `fk_pkg_group_pkg_pkg_group_user_group` (`id_group`),
  CONSTRAINT `fk_pkg_group_pkg_pkg_group_user_group` FOREIGN KEY (`id_group`) REFERENCES `pkg_group_user` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_pkg_pkg_group_user_pkg_group` FOREIGN KEY (`id_group_user`) REFERENCES `pkg_group_user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pkg_group_user_group`
--

LOCK TABLES `pkg_group_user_group` WRITE;
/*!40000 ALTER TABLE `pkg_group_user_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `pkg_group_user_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pkg_holidays`
--

DROP TABLE IF EXISTS `pkg_holidays`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pkg_holidays` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `day` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pkg_holidays`
--

LOCK TABLES `pkg_holidays` WRITE;
/*!40000 ALTER TABLE `pkg_holidays` DISABLE KEYS */;
INSERT INTO `pkg_holidays` VALUES (1,'teste','2025-01-22');
/*!40000 ALTER TABLE `pkg_holidays` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pkg_iax`
--

DROP TABLE IF EXISTS `pkg_iax`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pkg_iax` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_user` int NOT NULL DEFAULT '0',
  `name` varchar(80) NOT NULL,
  `accountcode` varchar(20) NOT NULL,
  `regexten` varchar(20) NOT NULL,
  `amaflags` char(7) DEFAULT NULL,
  `callgroup` char(10) DEFAULT NULL,
  `callerid` varchar(80) NOT NULL,
  `canreinvite` varchar(20) DEFAULT NULL,
  `context` varchar(80) NOT NULL,
  `DEFAULTip` char(15) DEFAULT NULL,
  `dtmfmode` char(7) NOT NULL DEFAULT 'RFC2833',
  `fromuser` varchar(80) NOT NULL,
  `fromdomain` varchar(80) NOT NULL,
  `host` varchar(31) NOT NULL,
  `insecure` varchar(20) NOT NULL,
  `language` char(2) DEFAULT NULL,
  `mailbox` varchar(50) NOT NULL,
  `md5secret` varchar(80) NOT NULL,
  `nat` varchar(25) DEFAULT 'force_rport,comedia',
  `permit` varchar(95) NOT NULL,
  `deny` varchar(95) NOT NULL,
  `mask` varchar(95) DEFAULT NULL,
  `pickupgroup` char(10) DEFAULT NULL,
  `port` char(5) NOT NULL DEFAULT '',
  `qualify` char(7) DEFAULT 'yes',
  `restrictcid` char(1) DEFAULT NULL,
  `rtptimeout` char(3) DEFAULT NULL,
  `rtpholdtimeout` char(3) DEFAULT NULL,
  `secret` varchar(80) NOT NULL,
  `type` char(6) NOT NULL DEFAULT 'friend',
  `username` varchar(80) NOT NULL,
  `disallow` varchar(100) NOT NULL,
  `allow` varchar(100) NOT NULL,
  `musiconhold` varchar(100) DEFAULT NULL,
  `regseconds` int NOT NULL DEFAULT '0',
  `ipaddr` char(15) NOT NULL DEFAULT '',
  `cancallforward` char(3) DEFAULT 'yes',
  `trunk` char(3) DEFAULT 'no',
  `useragent` varchar(200) NOT NULL DEFAULT '',
  `requirecalltoken` varchar(3) NOT NULL DEFAULT 'no',
  `calllimit` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `cons_pkg_iax_name` (`name`),
  KEY `name` (`name`),
  KEY `host` (`host`),
  KEY `ipaddr` (`ipaddr`),
  KEY `port` (`port`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pkg_iax`
--

LOCK TABLES `pkg_iax` WRITE;
/*!40000 ALTER TABLE `pkg_iax` DISABLE KEYS */;
/*!40000 ALTER TABLE `pkg_iax` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pkg_ivr`
--

DROP TABLE IF EXISTS `pkg_ivr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pkg_ivr` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_user` int NOT NULL,
  `id_did` int DEFAULT NULL,
  `name` varchar(50) NOT NULL,
  `monFriStart` varchar(200) NOT NULL DEFAULT '09:00-12:00|14:00-18:00',
  `satStart` varchar(200) NOT NULL DEFAULT '09:00-12:00',
  `sunStart` varchar(200) NOT NULL DEFAULT '00:00',
  `option_0` varchar(50) DEFAULT NULL,
  `option_1` varchar(50) DEFAULT NULL,
  `option_2` varchar(50) DEFAULT NULL,
  `option_3` varchar(50) DEFAULT NULL,
  `option_4` varchar(50) DEFAULT NULL,
  `option_5` varchar(50) DEFAULT NULL,
  `option_6` varchar(50) DEFAULT NULL,
  `option_7` varchar(50) DEFAULT NULL,
  `option_8` varchar(50) DEFAULT NULL,
  `option_9` varchar(50) DEFAULT NULL,
  `option_10` varchar(50) DEFAULT NULL,
  `direct_extension` tinyint(1) DEFAULT '0',
  `workaudio` varchar(100) DEFAULT NULL,
  `noworkaudio` varchar(100) DEFAULT NULL,
  `option_out_0` varchar(50) DEFAULT NULL,
  `option_out_1` varchar(50) DEFAULT NULL,
  `option_out_2` varchar(50) DEFAULT NULL,
  `option_out_3` varchar(50) DEFAULT NULL,
  `option_out_4` varchar(50) DEFAULT NULL,
  `option_out_5` varchar(50) DEFAULT NULL,
  `option_out_6` varchar(50) DEFAULT NULL,
  `option_out_7` varchar(50) DEFAULT NULL,
  `option_out_8` varchar(50) DEFAULT NULL,
  `option_out_9` varchar(50) DEFAULT NULL,
  `option_out_10` varchar(50) DEFAULT NULL,
  `use_holidays` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_pkg_user_pkg_ivr` (`id_user`),
  KEY `fk_pkg_did_pkg_ivr` (`id_did`),
  CONSTRAINT `fk_pkg_user_pkg_ivr` FOREIGN KEY (`id_user`) REFERENCES `pkg_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pkg_ivr`
--

LOCK TABLES `pkg_ivr` WRITE;
/*!40000 ALTER TABLE `pkg_ivr` DISABLE KEYS */;
INSERT INTO `pkg_ivr` VALUES (1,4,NULL,'dads','09:00-12:00|14:00-20:00','09:00-12:00','00:00','','','','','','','','','','','',0,NULL,NULL,'','','','','','','','','','','',1),(2,4,NULL,'ererer','09:00-12:00|14:00-20:00','09:00-12:00','00:00','','','','','','','','','','','',0,NULL,NULL,'','','','','','','','','','','',1);
/*!40000 ALTER TABLE `pkg_ivr` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pkg_log`
--

DROP TABLE IF EXISTS `pkg_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pkg_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_user` int DEFAULT NULL,
  `id_log_actions` int DEFAULT NULL,
  `description` mediumtext,
  `username` varchar(50) DEFAULT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ip` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_pkg_log_actions_pkg_log` (`id_log_actions`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pkg_log`
--

LOCK TABLES `pkg_log` WRITE;
/*!40000 ALTER TABLE `pkg_log` DISABLE KEYS */;
INSERT INTO `pkg_log` VALUES (1,1,1,'Username Login on the panel - User root',NULL,'2025-01-03 21:49:00','127.0.0.1'),(2,1,2,'Module: plan  {\"id_services_array\":\"\",\"name\":\"test\",\"signup\":\"0\",\"ini_credit\":\"0.0000\",\"play_audio\":\"1\",\"portabilidadeMobile\":\"0\",\"portabilidadeFixed\":\"0\",\"techprefix\":\"\",\"id\":\"0\",\"id_user\":1}',NULL,'2025-01-03 21:50:04','127.0.0.1'),(3,1,2,'Module: user  {\"id\":0,\"id_group\":3,\"id_plan\":1,\"offer\":0,\"id_user\":1,\"id_offer\":null,\"username\":\"teste\",\"password\":\"magnus\",\"active\":1,\"credit\":0,\"enableexpire\":0,\"expiredays\":0,\"status\":0,\"typepaid\":0,\"creditlimit\":0,\"credit_notification\":-1,\"restriction\":0,\"callingcard_pin\":432826,\"callshop\":0,\"plan_day\":0,\"active_paypal\":0,\"boleto\":0,\"lastname\":\"\",\"firstname\":\"\",\"redial\":\"\",\"tag\":\"\",\"company_name\":\"\",\"commercial_name\":\"\",\"address\":\"\",\"city\":\"\",\"state\":\"\",\"country\":\"1\",\"loginkey\":\"\",\"zipcode\":\"\",\"phone\":\"\",\"mobile\":\"\",\"email\":\"\",\"email2\":\"\",\"doc\":\"\",\"vat\":\"\",\"language\":\"en\",\"company_website\":\"\",\"prefix_local\":\"\",\"boleto_day\":0,\"firstusedate\":null,\"expirationdate\":null,\"lastuse\":null,\"description\":\"\",\"creationdate\":null,\"id_group_agent\":null,\"calllimit\":-1,\"mix_monitor_format\":\"gsm\",\"disk_space\":-1,\"sipaccountlimit\":-1,\"cpslimit\":-1,\"sip_count\":0,\"inbound_call_limit\":0,\"dist\":\"\",\"state_number\":\"\",\"neighborhood\":\"\",\"contract_value\":\"\",\"credit_notification_daily\":0,\"email_services\":1,\"email_did\":1,\"restriction_use\":1,\"transfer_international\":0,\"transfer_international_profit\":null,\"transfer_flexiload\":0,\"transfer_flexiload_profit\":null,\"transfer_bkash\":0,\"transfer_bkash_profit\":null,\"transfer_dbbl_rocket\":0,\"transfer_dbbl_rocket_profit\":null,\"transfer_bdservice_rate\":null,\"transfer_show_selling_price\":null,\"id_services_array\":\"\"}',NULL,'2025-01-03 21:54:31','127.0.0.1'),(4,1,2,'Module: user  {\"id\":0,\"id_group\":3,\"id_plan\":1,\"offer\":0,\"id_user\":1,\"id_offer\":null,\"username\":\"39171teste2\",\"password\":\"NryJQMxH\",\"active\":1,\"credit\":0,\"enableexpire\":0,\"expiredays\":0,\"status\":0,\"typepaid\":0,\"creditlimit\":0,\"credit_notification\":-1,\"restriction\":0,\"callingcard_pin\":775155,\"callshop\":0,\"plan_day\":0,\"active_paypal\":0,\"boleto\":0,\"lastname\":\"\",\"firstname\":\"\",\"redial\":\"\",\"tag\":\"\",\"company_name\":\"\",\"commercial_name\":\"\",\"address\":\"\",\"city\":\"\",\"state\":\"\",\"country\":\"1\",\"loginkey\":\"\",\"zipcode\":\"\",\"phone\":\"\",\"mobile\":\"\",\"email\":\"\",\"email2\":\"\",\"doc\":\"\",\"vat\":\"\",\"language\":\"en\",\"company_website\":\"\",\"prefix_local\":\"\",\"boleto_day\":0,\"firstusedate\":null,\"expirationdate\":null,\"lastuse\":null,\"description\":\"\",\"creationdate\":null,\"id_group_agent\":null,\"calllimit\":-1,\"mix_monitor_format\":\"gsm\",\"disk_space\":-1,\"sipaccountlimit\":-1,\"cpslimit\":-1,\"sip_count\":0,\"inbound_call_limit\":0,\"dist\":\"\",\"state_number\":\"\",\"neighborhood\":\"\",\"contract_value\":\"\",\"credit_notification_daily\":0,\"email_services\":1,\"email_did\":1,\"restriction_use\":1,\"transfer_international\":0,\"transfer_international_profit\":null,\"transfer_flexiload\":0,\"transfer_flexiload_profit\":null,\"transfer_bkash\":0,\"transfer_bkash_profit\":null,\"transfer_dbbl_rocket\":0,\"transfer_dbbl_rocket_profit\":null,\"transfer_bdservice_rate\":null,\"transfer_show_selling_price\":null}',NULL,'2025-01-03 21:55:15','127.0.0.1'),(5,1,2,'Module: trunk  {\"id\":0,\"trunkcode\":\"testerrrr\",\"trunkprefix\":\"\",\"providertech\":\"sip\",\"providerip\":\"\",\"removeprefix\":\"\",\"secondusedreal\":0,\"creationdate\":null,\"failover_trunk\":null,\"fromdomain\":\"\",\"addparameter\":\"\",\"id_provider\":1,\"inuse\":\"\",\"maxuse\":\"-1\",\"status\":1,\"if_max_use\":\"\",\"user\":\"\",\"secret\":\"\",\"allow\":\"g729,gsm,opus,alaw,ulaw\",\"link_sms\":\"\",\"directmedia\":\"no\",\"context\":\"billing\",\"dtmfmode\":\"RFC2833\",\"insecure\":\"port,invite\",\"nat\":\"force_rport,comedia\",\"qualify\":\"yes\",\"type\":\"peer\",\"disallow\":\"all\",\"host\":\"refer\",\"sms_res\":\"\",\"register\":0,\"language\":\"\",\"allow_error\":0,\"fromuser\":\"\",\"port\":5060,\"encryption\":\"\",\"transport\":\"\",\"sendrpid\":\"no\",\"cnl\":0,\"cid_add\":\"\",\"cid_remove\":\"\",\"register_string\":\"\",\"block_cid\":\"\",\"sip_config\":\"\",\"short_time_call\":0}',NULL,'2025-01-04 18:12:42','127.0.0.1'),(6,1,2,'Module: provider  {\"credit\":0.3333,\"id\":1}',NULL,'2025-01-06 18:54:11','127.0.0.1'),(7,1,6,'Module: Provider SET Array\n(\n    [credit] => 0.0000\n    [description] => teste\n)\n WHERE id IN(Array\n(\n    [0] => 1\n    [1] => 2\n    [2] => 3\n    [3] => 11\n)\n)',NULL,'2025-01-06 18:54:15','127.0.0.1'),(9,2,1,'Username Login on the panel - User root',NULL,'2025-01-07 17:10:12','127.0.0.1'),(35,1,1,'Username Login on the panel - User root',NULL,'2025-01-29 12:31:38','::1'),(36,1,3,'Module rate  {\"id\":1}',NULL,'2025-01-29 12:31:44','::1'),(37,1,2,'Module: groupuser  {\"hidden_batch_update\":0,\"id\":4}',NULL,'2025-01-29 12:34:23','::1'),(38,1,4,'Group Client Cloned',NULL,'2025-01-29 12:34:29','::1'),(39,1,4,'Group Client Cloned',NULL,'2025-01-29 12:34:36','::1'),(40,1,4,'Group Administrator Cloned',NULL,'2025-01-29 12:34:42','::1'),(41,1,4,'Group Administrator Cloned',NULL,'2025-01-29 12:34:55','::1'),(42,1,2,'Module: groupuser  {\"hidden_batch_update\":0,\"id\":1}',NULL,'2025-01-29 12:36:03','::1'),(43,1,4,'Group Administrator Cloned',NULL,'2025-01-29 12:36:15','::1'),(44,1,2,'Module: groupuser  {\"name\":\"Administrator Cloned2\",\"hidden_batch_update\":0,\"id\":4}',NULL,'2025-01-29 12:37:39','::1'),(45,1,4,'Group Administrator Cloned',NULL,'2025-01-29 12:37:41','::1'),(46,1,4,'Group Administrator Cloned',NULL,'2025-01-29 12:37:44','::1'),(47,1,4,'Group Administrator Cloned',NULL,'2025-01-29 12:37:46','::1'),(48,1,2,'Module: groupuser  {\"hidden_batch_update\":0,\"id\":1}',NULL,'2025-01-29 12:37:57','::1'),(49,1,4,'Group Administrator Cloned',NULL,'2025-01-29 12:38:00','::1'),(50,1,1,'Username Login on the panel - User root',NULL,'2025-01-29 12:44:03','::1'),(51,1,3,'Module groupuser  [{\"id\":8},{\"id\":9},{\"id\":10},{\"id\":11},{\"id\":12},{\"id\":13}]',NULL,'2025-01-29 12:44:39','::1'),(52,1,2,'Module: rate  {\"id\":0,\"id_plan\":2,\"id_trunk_group\":3,\"id_prefix\":1,\"rateinitial\":0.3434,\"initblock\":1,\"billingblock\":1,\"connectcharge\":0.0009,\"disconnectcharge\":0,\"additional_grace\":\"0\",\"minimal_cost\":0,\"minimal_time_charge\":0,\"package_offer\":0,\"status\":1}',NULL,'2025-01-29 12:44:53','::1'),(53,1,2,'Module: rate  {\"id\":0,\"id_plan\":2,\"id_trunk_group\":1,\"id_prefix\":1,\"rateinitial\":0.0044,\"initblock\":1,\"billingblock\":1,\"connectcharge\":0.0004,\"disconnectcharge\":0,\"additional_grace\":\"0\",\"minimal_cost\":0,\"minimal_time_charge\":0,\"package_offer\":0,\"status\":1}',NULL,'2025-01-29 12:45:04','::1'),(54,1,3,'Module rate  [{\"id\":2},{\"id\":3}]',NULL,'2025-01-29 12:45:08','::1'),(55,1,2,'Module: rate  {\"id\":0,\"id_plan\":2,\"id_trunk_group\":1,\"id_prefix\":1,\"rateinitial\":0.0555,\"initblock\":1,\"billingblock\":1,\"connectcharge\":0.0008,\"disconnectcharge\":0,\"additional_grace\":\"0\",\"minimal_cost\":0,\"minimal_time_charge\":0,\"package_offer\":0,\"status\":1}',NULL,'2025-01-29 12:52:28','::1'),(56,1,2,'Module: rate  {\"id\":0,\"id_plan\":2,\"id_trunk_group\":1,\"id_prefix\":1,\"rateinitial\":0.0666,\"initblock\":1,\"billingblock\":1,\"connectcharge\":0.0006,\"disconnectcharge\":0,\"additional_grace\":\"0\",\"minimal_cost\":0,\"minimal_time_charge\":0,\"package_offer\":0,\"status\":1}',NULL,'2025-01-29 12:52:38','::1'),(57,1,6,'Module: Rate SET Array\n(\n    [initblock] => 60\n)\n WHERE id IN(Array\n(\n    [0] => 4\n    [1] => 5\n)\n)',NULL,'2025-01-29 12:52:45','::1');
/*!40000 ALTER TABLE `pkg_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pkg_log_actions`
--

DROP TABLE IF EXISTS `pkg_log_actions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pkg_log_actions` (
  `id` int NOT NULL,
  `name` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pkg_log_actions`
--

LOCK TABLES `pkg_log_actions` WRITE;
/*!40000 ALTER TABLE `pkg_log_actions` DISABLE KEYS */;
INSERT INTO `pkg_log_actions` VALUES (1,'Login'),(2,'Edit'),(3,'Delete'),(4,'New'),(5,'Import'),(6,'UpdateAll'),(7,'Export'),(8,'Logout');
/*!40000 ALTER TABLE `pkg_log_actions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pkg_method_pay`
--

DROP TABLE IF EXISTS `pkg_method_pay`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pkg_method_pay` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_user` int NOT NULL,
  `payment_method` char(100) NOT NULL,
  `show_name` varchar(100) NOT NULL,
  `country` varchar(50) NOT NULL,
  `active` tinyint NOT NULL DEFAULT '0',
  `active_agent` tinyint NOT NULL DEFAULT '0',
  `obs` varchar(300) DEFAULT NULL,
  `url` varchar(100) NOT NULL,
  `username` varchar(1000) NOT NULL,
  `pagseguro_TOKEN` varchar(100) NOT NULL,
  `fee` tinyint(1) NOT NULL DEFAULT '0',
  `boleto_convenio` varchar(50) DEFAULT NULL,
  `boleto_banco` varchar(50) DEFAULT NULL,
  `boleto_agencia` varchar(50) DEFAULT NULL,
  `boleto_conta_corrente` varchar(50) DEFAULT NULL,
  `boleto_inicio_nosso_numeroa` varchar(50) DEFAULT NULL,
  `boleto_carteira` varchar(50) DEFAULT NULL,
  `boleto_taxa` varchar(50) DEFAULT NULL,
  `boleto_instrucoes` varchar(50) DEFAULT NULL,
  `boleto_nome_emp` varchar(50) DEFAULT NULL,
  `boleto_end_emp` varchar(50) DEFAULT NULL,
  `boleto_cidade_emp` varchar(50) DEFAULT NULL,
  `boleto_estado_emp` varchar(50) DEFAULT NULL,
  `boleto_cpf_emp` varchar(50) DEFAULT NULL,
  `P2P_CustomerSiteID` varchar(100) NOT NULL DEFAULT '',
  `P2P_KeyID` varchar(50) NOT NULL DEFAULT '',
  `P2P_Passphrase` varchar(50) NOT NULL DEFAULT '',
  `P2P_RecipientKeyID` varchar(100) NOT NULL DEFAULT '',
  `P2P_tax_amount` varchar(10) NOT NULL DEFAULT '0',
  `client_id` varchar(500) DEFAULT NULL,
  `client_secret` varchar(500) DEFAULT NULL,
  `SLAppToken` varchar(50) DEFAULT NULL,
  `SLAccessToken` varchar(50) DEFAULT NULL,
  `SLSecret` varchar(50) DEFAULT NULL,
  `SLIdProduto` int DEFAULT NULL,
  `SLvalidationtoken` varchar(100) DEFAULT NULL,
  `min` int NOT NULL DEFAULT '10',
  `max` int NOT NULL DEFAULT '10',
  `showFields` text,
  PRIMARY KEY (`id`),
  KEY `fk_pkg_user_pkg_method_pay` (`id_user`),
  CONSTRAINT `fk_pkg_user_pkg_method_pay` FOREIGN KEY (`id_user`) REFERENCES `pkg_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pkg_method_pay`
--

LOCK TABLES `pkg_method_pay` WRITE;
/*!40000 ALTER TABLE `pkg_method_pay` DISABLE KEYS */;
INSERT INTO `pkg_method_pay` VALUES (1,1,'Pagseguro','Pagseguro','Brasil',0,0,'','','','',0,'','','','','','','','','','','','','','','','','','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,'payment_method,show_name,id_user,country,active,min,max,username,pagseguro_TOKEN'),(3,1,'Moip','Moip','Brasil',0,0,'','https://www.moip.com.br/PagamentoMoIP.do','','',0,'','','','','','','','','','','','','','','','','','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,10,500,'payment_method,id_user,show_name,country,active,min,max,username,url'),(4,1,'Paypal','Paypal','Global',1,0,'','https://www.paypal.com/cgi-bin/webscr','info@magnusbilling.com','',0,'','','','','','','','','','','','','','','','','','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,500,'payment_method,show_name,id_user,country,active,min,max,username,url,fee'),(5,1,'CuentaDigital','PagoFacil o Rapipago','Argentina',0,0,'','http://www.cuentadigital.com/api.php','','',0,'','','','','','','','','','','','','','','','','','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,10,500,'payment_method,show_name,id_user,country,active,min,max,username,url'),(6,1,'DineroMail','Tarjeta de crédito, DineroMail','Brasil',0,0,'','https://argentina.dineromail.com/Shop/Shop_Ingreso.asp','','',0,'','','','','','','','','','','','','','','','','','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,10,500,'payment_method,show_name,id_user,country,active,min,max,min,max,username,url'),(7,1,'PlacetoPay','PlacetoPay','Brasil',0,0,'','','','',0,'','','','','','','','','','','','','','','','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,10,500,'payment_method,show_name,id_user,country,active,min,max,P2P_CustomerSiteID,P2P_KeyID,P2P_Passphrase,P2P_RecipientKeyID,P2P_tax_amount'),(8,1,'EFI','EFI','Brasil',1,0,'','','','',0,'','','','','','','','','','','','','','','','','','','Client_Id_ba14d0357718988cc7e0da09c9cdf99ea3d1c084','Client_Secret_aa3d09195892cf3f641734bbe454e1bf5f98789c',NULL,NULL,NULL,NULL,NULL,10,500,'payment_method,show_name,id_user,country,active,min,max,client_id,client_secret'),(9,1,'Pagseguro','Pagseguro','Brasil',0,0,'','','','',0,'','Banco do Brasil','','','','','','','','','','','','','','','','','','','','','',0,'',10,500,'payment_method,show_name,id_user,country,active,min,max,username,pagseguro_TOKEN'),(10,1,'MercadoPago','MercadoPago','Brasil',1,0,NULL,'','1900843390444089','XZSJeq48aRrf2GPXQ1Sqwpjo0A9AJ3X9',0,'','','','','','','','','','','','','','','','','','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,20,500,'payment_method,show_name,id_user,country,active,min,max,username,pagseguro_TOKEN'),(11,1,'paghiper','Boleto Bancario  paghiper','Brasil',0,0,NULL,'','','',0,'','','','','','','','','','','','','','','','','','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,10,500,'payment_method,show_name,id_user,country,active,min,max,username,pagseguro_TOKEN'),(13,1,'molpay','MoPay','Global',0,0,NULL,'','','',0,'','','','','','','','','','','','','','','','','','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,10,500,'payment_method,show_name,id_user,country,active,min,max,username,pagseguro_TOKEN,P2P_RecipientKeyID'),(14,1,'Sagepay','sagepay','Global',0,0,NULL,'','','',0,'','','','','','','','','','','','','','','','','','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,10,500,'payment_method,show_name,id_user,country,active,min,max,P2P_KeyID,client_id'),(15,1,'Stripe','Stripe','Global',0,0,NULL,'','','',0,'','','','','','','','','','','','','','','','','','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,10,500,'payment_method,show_name,id_user,country,active,min,max,client_id,client_secret'),(16,1,'Elavon','Elavon','Global',0,0,NULL,'','','',0,'','','','','','','','','','','','','','','','','','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,10,500,'payment_method,show_name,id_user,country,active,min,max,username,client_id,client_secret'),(17,1,'cryptocurrency','BITCOIN','Global',1,0,NULL,'','USDT(TRON)=>TSqqrXyNMuV8MQqxmkvvqTGRyHYYhKahmG|BTC(BTC)=>TQCiSHwE7TrkJ9HQCNn4edM61WoQBCeuCd','',0,'','','','','','','','','','','','','','','','','','0','','',NULL,NULL,NULL,NULL,NULL,10,500,'payment_method,show_name,id_user,country,active,min,max,username,client_id,client_secret'),(18,1,'Custom','Custom Method','Global',0,0,NULL,'','','',0,'','','','','','','','','','','','','','','','','','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,10,10,'payment_method,show_name,id_user,country,active,min,max,min,max,username,url');
/*!40000 ALTER TABLE `pkg_method_pay` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pkg_module`
--

DROP TABLE IF EXISTS `pkg_module`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pkg_module` (
  `id` int NOT NULL AUTO_INCREMENT,
  `text` varchar(100) NOT NULL,
  `module` varchar(100) DEFAULT NULL,
  `icon_cls` varchar(100) DEFAULT NULL,
  `id_module` int DEFAULT NULL,
  `priority` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_pkg_module_pkg_module` (`id_module`),
  CONSTRAINT `fk_pkg_module_pkg_module` FOREIGN KEY (`id_module`) REFERENCES `pkg_module` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=113 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pkg_module`
--

LOCK TABLES `pkg_module` WRITE;
/*!40000 ALTER TABLE `pkg_module` DISABLE KEYS */;
INSERT INTO `pkg_module` VALUES (1,'t(\'Clientes Module\')',NULL,'x-fa fa-arrow-right',NULL,1),(3,'t(\'Group Users\')','groupuser','x-fa fa-desktop',12,2),(4,'t(\'Menus\')','module','x-fa fa-desktop',12,1),(5,'t(\'DIDs\')',NULL,'x-fa fa-arrow-right',NULL,3),(6,'t(\'Configuration\')','configuration','x-fa fa-desktop',12,3),(7,'t(\'Billing\')',NULL,'x-fa fa-arrow-right',NULL,2),(8,'t(\'Rates\')',NULL,'x-fa fa-arrow-right',NULL,4),(9,'t(\'Reports\')',NULL,'x-fa fa-arrow-right',NULL,5),(10,'t(\'Routes\')',NULL,'x-fa fa-arrow-right',NULL,6),(12,'t(\'Settings\')',NULL,'x-fa fa-arrow-right',NULL,7),(14,'t(\'CallShop\')',NULL,'x-fa fa-arrow-right',NULL,9),(15,'t(\'Users\')','user','x-fa fa-desktop',1,1),(16,'t(\'Providers\')','provider','x-fa fa-desktop',10,1),(17,'t(\'Trunks\')','trunk','x-fa fa-desktop',10,2),(19,'t(\'SIP Users\')','sip','x-fa fa-desktop',1,2),(20,'t(\'ATA Linksys\')','sipuras','x-fa fa-desktop',1,5),(21,'t(\'Calls Online\')','callonline','x-fa fa-desktop',1,3),(22,'t(\'CallerID\')','callerid','x-fa fa-desktop',1,4),(23,'t(\'Refills\')','refill','x-fa fa-desktop',7,1),(25,'t(\'Payment Methods\')','methodpay','x-fa fa-desktop',7,2),(26,'t(\'Voucher\')','voucher','x-fa fa-desktop',7,3),(27,'t(\'Refill Providers\')','refillprovider','x-fa fa-desktop',7,4),(28,'t(\'Plans\')','plan','x-fa fa-desktop',8,1),(29,'t(\'Tariffs\')','rate','x-fa fa-desktop',8,2),(30,'t(\'CDR\')','call','x-fa fa-desktop',9,1),(31,'t(\'DIDs\')','did','x-fa fa-desktop',5,1),(32,'t(\'DID Destination\')','diddestination','x-fa fa-desktop',5,2),(33,'t(\'Prefixes\')','prefix','x-fa fa-desktop',8,3),(34,'t(\'Offers\')','offer','x-fa fa-desktop',8,5),(36,'t(\'DIDs Use\')','diduse','x-fa fa-desktop',5,3),(40,'t(\'Summary per Day\')','callsummaryperday','x-fa fa-desktop',9,3),(45,'t(\'Offer CDR\')','offercdr','x-fa fa-desktop',8,6),(46,'t(\'Offer Use\')','offeruse','x-fa fa-desktop',8,7),(48,'t(\'Restricted Number\')','restrictedphonenumber','x-fa fa-desktop',1,6),(50,'t(\'Booths\')','callshop','x-fa fa-desktop',14,1),(51,'t(\'Booths Report\')','callshopcdr','x-fa fa-desktop',14,2),(53,'t(\'Booths Tariffs\')','ratecallshop','x-fa fa-desktop',14,3),(54,'t(\'Emails Templates\')','templatemail','x-fa fa-desktop',12,4),(55,'t(\'Callback\')','callback','x-fa fa-desktop',1,7),(56,'t(\'IVRs\')','ivr','x-fa fa-desktop',5,4),(58,'t(\'Queues\')','queue','x-fa fa-desktop',5,5),(59,'t(\'Queues Members\')','queuemember','x-fa fa-desktop',5,6),(60,'t(\'Summary per Month\')','callsummarypermonth','x-fa fa-desktop',9,7),(61,'t(\'Buy Credit\')','buycredit','x-fa fa-desktop',1,8),(64,'t(\'Log Users\')','logusers','x-fa fa-desktop',12,5),(65,'t(\'Call per Minutes\')','campaignlog','x-fa fa-desktop',12,10),(66,'t(\'User Custom Rates\')','userrate','x-fa fa-desktop',8,4),(67,'t(\'CDR Failed\')','callfailed','x-fa fa-desktop',9,2),(68,'t(\'Buy DID\')','didbuy','x-fa fa-desktop',5,7),(69,'t(\'Extra\')','extra','x-fa fa-desktop',12,69),(71,'t(\'Dashboard\')','dashboard','x-fa fa-desktop',12,9),(72,'t(\'SMTP\')','smtps','x-fa fa-desktop',12,6),(73,'t(\'Summary per Day\')','callsummarycallshop','x-fa fa-desktop',14,4),(77,'t(\'Servers\')','servers','x-fa fa-desktop',10,5),(78,'t(\'Queue DashBoard\')','dashboardqueue','x-fa fa-desktop',5,8),(79,'t(\'Send Credit\')','transfertomobile','x-fa fa-desktop',1,11),(80,'t(\'Summary per User\')','callsummaryperuser','x-fa fa-desktop',9,10),(83,'t(\'Iax\')','iax','x-fa fa-desktop',1,9),(85,'t(\'Services\')',NULL,'x-fa fa-arrow-right',NULL,10),(86,'t(\'Services\')','services','x-fa fa-desktop',85,1),(87,'t(\'Services Use\')','servicesuse','x-fa fa-desktop',85,2),(88,'t(\'Send Credit Summary\')','sendcreditsummary','x-fa fa-desktop',9,13),(89,'t(\'Summary per Trunk\')','callsummarypertrunk','x-fa fa-desktop',9,11),(90,'t(\'Summary Day User\')','callsummarydayuser','x-fa fa-desktop',9,4),(91,'t(\'Summary Day Trunk\')','callsummarydaytrunk','x-fa fa-desktop',9,5),(92,'t(\'Summary Day Agent\')','callsummarydayagent','x-fa fa-desktop',9,6),(93,'t(\'Summary Month User\')','callsummarymonthuser','x-fa fa-desktop',9,8),(94,'t(\'Summary Month Trunk\')','callsummarymonthtrunk','x-fa fa-desktop',9,9),(95,'t(\'Call Archive\')','callarchive','x-fa fa-desktop',9,12),(96,'t(\'API\')','api','x-fa fa-desktop',12,8),(97,'t(\'Provider Rates\')','rateprovider','x-fa fa-desktop',10,4),(98,'t(\'Group to Admins\')','groupusergroup','x-fa fa-desktop',12,11),(99,'t(\'DIDww\')','didww','x-fa fa-desktop',5,10),(100,'t(\'Extra2\')','extra2','x-fa fa-desktop',12,10),(101,'t(\'Extra3\')','extra3','x-fa fa-desktop',12,11),(102,'t(\'Trunk Groups\')','trunkgroup','x-fa fa-desktop',10,3),(104,'t(\'Backup\')','backup','x-fa fa-desktop',12,15),(106,'t(\'Holidays\')','holidays','x-fa fa-desktop',5,11),(107,'t(\'Alarms\')','alarm','x-fa fa-desktop',12,16),(108,'t(\'Summary Month DID\')','callsummarymonthdid','x-fa fa-desktop',9,14),(109,'t(\'Trunk Errors\')','trunksipcodes','x-fa fa-desktop',10,7),(110,'t(\'Provider CNL\')','providercnl','x-fa fa-desktop',10,7),(111,'t(\'User History\')','userhistory','x-fa fa-desktop',1,12),(112,'t(\'DID History\')','didhistory','x-fa fa-desktop',5,12);
/*!40000 ALTER TABLE `pkg_module` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pkg_module_extra`
--

DROP TABLE IF EXISTS `pkg_module_extra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pkg_module_extra` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_module` int NOT NULL,
  `type` varchar(10) DEFAULT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `pkg_module_extra_id_module` (`id_module`),
  KEY `type` (`type`),
  CONSTRAINT `fk_pkg_module_pkg_module_extra` FOREIGN KEY (`id_module`) REFERENCES `pkg_module` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pkg_module_extra`
--

LOCK TABLES `pkg_module_extra` WRITE;
/*!40000 ALTER TABLE `pkg_module_extra` DISABLE KEYS */;
/*!40000 ALTER TABLE `pkg_module_extra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pkg_offer`
--

DROP TABLE IF EXISTS `pkg_offer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pkg_offer` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_user` int DEFAULT NULL,
  `creationdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `label` varchar(70) NOT NULL,
  `packagetype` int NOT NULL,
  `billingtype` int NOT NULL,
  `startday` int NOT NULL,
  `freetimetocall` int NOT NULL,
  `price` decimal(10,3) NOT NULL,
  `initblock` int NOT NULL DEFAULT '60',
  `billingblock` int NOT NULL DEFAULT '60',
  `minimal_time_charge` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_pkg_user_pkg_offer` (`id_user`),
  CONSTRAINT `fk_pkg_user_pkg_offer` FOREIGN KEY (`id_user`) REFERENCES `pkg_user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pkg_offer`
--

LOCK TABLES `pkg_offer` WRITE;
/*!40000 ALTER TABLE `pkg_offer` DISABLE KEYS */;
INSERT INTO `pkg_offer` VALUES (1,NULL,'2025-01-21 18:28:30','teste',0,0,0,54545,1.232,60,60,0);
/*!40000 ALTER TABLE `pkg_offer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pkg_offer_cdr`
--

DROP TABLE IF EXISTS `pkg_offer_cdr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pkg_offer_cdr` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_user` int NOT NULL,
  `id_offer` int NOT NULL,
  `date_consumption` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `used_secondes` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ind_pkg_offer_cdr_date_consumption` (`date_consumption`),
  KEY `fk_pkg_user_pkg_offer_cdr` (`id_user`),
  KEY `fk_pkg_offer_pkg_offer_cdr` (`id_offer`),
  CONSTRAINT `fk_pkg_offer_pkg_offer_cdr` FOREIGN KEY (`id_offer`) REFERENCES `pkg_offer` (`id`),
  CONSTRAINT `fk_pkg_user_pkg_offer_cdr` FOREIGN KEY (`id_user`) REFERENCES `pkg_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pkg_offer_cdr`
--

LOCK TABLES `pkg_offer_cdr` WRITE;
/*!40000 ALTER TABLE `pkg_offer_cdr` DISABLE KEYS */;
/*!40000 ALTER TABLE `pkg_offer_cdr` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pkg_offer_use`
--

DROP TABLE IF EXISTS `pkg_offer_use`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pkg_offer_use` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_user` int DEFAULT NULL,
  `id_offer` int NOT NULL,
  `reservationdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `releasedate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `status` int DEFAULT '0',
  `month_payed` int DEFAULT '0',
  `reminded` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_pkg_user_pkg_offer_use` (`id_user`),
  KEY `fk_pkg_offer_pkg_offer_use` (`id_offer`),
  CONSTRAINT `fk_pkg_offer_pkg_offer_use` FOREIGN KEY (`id_offer`) REFERENCES `pkg_offer` (`id`),
  CONSTRAINT `fk_pkg_user_pkg_offer_use` FOREIGN KEY (`id_user`) REFERENCES `pkg_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pkg_offer_use`
--

LOCK TABLES `pkg_offer_use` WRITE;
/*!40000 ALTER TABLE `pkg_offer_use` DISABLE KEYS */;
INSERT INTO `pkg_offer_use` VALUES (1,3,1,'2025-01-21 18:28:43','0000-00-00 00:00:00',1,1,0);
/*!40000 ALTER TABLE `pkg_offer_use` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pkg_phonebook`
--

DROP TABLE IF EXISTS `pkg_phonebook`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pkg_phonebook` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_user` int NOT NULL,
  `name` char(30) NOT NULL,
  `description` varchar(100) DEFAULT NULL,
  `status` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `fk_pkg_user_pkg_phonebook` (`id_user`),
  CONSTRAINT `fk_pkg_user_pkg_phonebook` FOREIGN KEY (`id_user`) REFERENCES `pkg_user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pkg_phonebook`
--

LOCK TABLES `pkg_phonebook` WRITE;
/*!40000 ALTER TABLE `pkg_phonebook` DISABLE KEYS */;
/*!40000 ALTER TABLE `pkg_phonebook` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pkg_phonenumber`
--

DROP TABLE IF EXISTS `pkg_phonenumber`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pkg_phonenumber` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_phonebook` int NOT NULL,
  `number` varchar(30) NOT NULL,
  `name` char(40) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `doc` varchar(200) DEFAULT NULL,
  `creationdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` smallint NOT NULL DEFAULT '1',
  `info` mediumtext,
  `try` smallint NOT NULL DEFAULT '0',
  `city` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_pkg_phonebook_pkg_phonenumber` (`id_phonebook`),
  KEY `number` (`number`),
  CONSTRAINT `fk_pkg_phonebook_pkg_phonenumber` FOREIGN KEY (`id_phonebook`) REFERENCES `pkg_phonebook` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pkg_phonenumber`
--

LOCK TABLES `pkg_phonenumber` WRITE;
/*!40000 ALTER TABLE `pkg_phonenumber` DISABLE KEYS */;
/*!40000 ALTER TABLE `pkg_phonenumber` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pkg_plan`
--

DROP TABLE IF EXISTS `pkg_plan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pkg_plan` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_user` int DEFAULT NULL,
  `name` char(50) NOT NULL,
  `lcrtype` int NOT NULL DEFAULT '0',
  `creationdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `removeinterprefix` int NOT NULL DEFAULT '1',
  `signup` int NOT NULL DEFAULT '0',
  `portabilidadeMobile` tinyint(1) NOT NULL DEFAULT '0',
  `portabilidadeFixed` tinyint(1) NOT NULL DEFAULT '0',
  `ini_credit` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `techprefix` varchar(7) NOT NULL DEFAULT '',
  `play_audio` smallint NOT NULL DEFAULT '0',
  `tariff_limit` int NOT NULL DEFAULT '3',
  PRIMARY KEY (`id`),
  KEY `fk_pkg_user_pkg_plan` (`id_user`),
  KEY `id_user` (`id_user`),
  CONSTRAINT `fk_pkg_user_pkg_plan` FOREIGN KEY (`id_user`) REFERENCES `pkg_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pkg_plan`
--

LOCK TABLES `pkg_plan` WRITE;
/*!40000 ALTER TABLE `pkg_plan` DISABLE KEYS */;
INSERT INTO `pkg_plan` VALUES (1,1,'premium2',0,'2025-01-03 21:50:04',1,1,0,0,0.00000,'',1,3),(2,1,'gold',0,'2025-01-09 13:06:37',1,0,0,0,0.00000,'',0,3),(3,1,'silver',0,'2025-01-09 13:09:15',1,0,1,0,0.00000,'',0,3);
/*!40000 ALTER TABLE `pkg_plan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pkg_prefix`
--

DROP TABLE IF EXISTS `pkg_prefix`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pkg_prefix` (
  `id` int NOT NULL AUTO_INCREMENT,
  `prefix` varchar(18) NOT NULL,
  `destination` varchar(60) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `prefix_2` (`prefix`),
  KEY `prefix` (`prefix`),
  KEY `destination` (`destination`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pkg_prefix`
--

LOCK TABLES `pkg_prefix` WRITE;
/*!40000 ALTER TABLE `pkg_prefix` DISABLE KEYS */;
INSERT INTO `pkg_prefix` VALUES (1,'55','brasil');
/*!40000 ALTER TABLE `pkg_prefix` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pkg_prefix_length`
--

DROP TABLE IF EXISTS `pkg_prefix_length`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pkg_prefix_length` (
  `id` int NOT NULL AUTO_INCREMENT,
  `code` int NOT NULL,
  `length` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pkg_prefix_length`
--

LOCK TABLES `pkg_prefix_length` WRITE;
/*!40000 ALTER TABLE `pkg_prefix_length` DISABLE KEYS */;
INSERT INTO `pkg_prefix_length` VALUES (1,55,2);
/*!40000 ALTER TABLE `pkg_prefix_length` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pkg_provider`
--

DROP TABLE IF EXISTS `pkg_provider`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pkg_provider` (
  `id` int NOT NULL AUTO_INCREMENT,
  `provider_name` char(30) NOT NULL,
  `creationdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `description` mediumtext,
  `credit` decimal(18,5) NOT NULL DEFAULT '0.00000',
  `credit_control` smallint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `cons_pkg_provider_provider_name` (`provider_name`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pkg_provider`
--

LOCK TABLES `pkg_provider` WRITE;
/*!40000 ALTER TABLE `pkg_provider` DISABLE KEYS */;
INSERT INTO `pkg_provider` VALUES (1,'provider 1','2025-01-04 12:57:21','testeeeee',10.00000,0),(2,'provider 2','2025-01-04 12:57:28','aaaa33333',0.00000,0),(3,'regregre','2025-01-04 12:57:34','testeeeee',0.00000,0),(14,'test','2025-01-29 21:23:19','magnus',0.00000,0);
/*!40000 ALTER TABLE `pkg_provider` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pkg_provider_cnl`
--

DROP TABLE IF EXISTS `pkg_provider_cnl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pkg_provider_cnl` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_provider` int NOT NULL,
  `cnl` int NOT NULL,
  `zone` varchar(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_provider` (`id_provider`),
  KEY `cnl` (`cnl`),
  CONSTRAINT `fk_pkg_provider_pkg_provider_cnl` FOREIGN KEY (`id_provider`) REFERENCES `pkg_provider` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pkg_provider_cnl`
--

LOCK TABLES `pkg_provider_cnl` WRITE;
/*!40000 ALTER TABLE `pkg_provider_cnl` DISABLE KEYS */;
INSERT INTO `pkg_provider_cnl` VALUES (1,1,343434,'CNA');
/*!40000 ALTER TABLE `pkg_provider_cnl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pkg_queue`
--

DROP TABLE IF EXISTS `pkg_queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pkg_queue` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `id_user` int DEFAULT NULL,
  `language` varchar(5) NOT NULL,
  `musiconhold` varchar(128) DEFAULT NULL,
  `announce` varchar(128) DEFAULT NULL,
  `context` varchar(128) DEFAULT NULL,
  `timeout` int DEFAULT NULL,
  `announce-frequency` int DEFAULT NULL,
  `announce-round-seconds` int DEFAULT NULL,
  `announce-holdtime` varchar(128) DEFAULT NULL,
  `announce-position` varchar(5) NOT NULL DEFAULT 'yes',
  `retry` int DEFAULT NULL,
  `wrapuptime` int DEFAULT NULL,
  `maxlen` int DEFAULT NULL,
  `servicelevel` int DEFAULT NULL,
  `strategy` varchar(128) DEFAULT NULL,
  `joinempty` varchar(128) DEFAULT NULL,
  `leavewhenempty` varchar(128) DEFAULT NULL,
  `eventmemberstatus` tinyint(1) DEFAULT NULL,
  `eventwhencalled` tinyint(1) DEFAULT NULL,
  `reportholdtime` tinyint(1) DEFAULT NULL,
  `memberdelay` int DEFAULT NULL,
  `weight` int DEFAULT NULL,
  `timeoutrestart` tinyint(1) DEFAULT NULL,
  `periodic-announce` varchar(200) DEFAULT NULL,
  `periodic-announce-frequency` int DEFAULT NULL,
  `ringinuse` varchar(3) DEFAULT NULL,
  `setinterfacevar` varchar(3) DEFAULT 'yes',
  `setqueuevar` varchar(3) NOT NULL DEFAULT 'yes',
  `setqueueentryvar` varchar(3) NOT NULL DEFAULT 'yes',
  `var_holdtime` int NOT NULL DEFAULT '0',
  `var_talktime` int NOT NULL DEFAULT '0',
  `var_totalCalls` int NOT NULL DEFAULT '0',
  `var_answeredCalls` int NOT NULL DEFAULT '0',
  `ring_or_moh` varchar(4) NOT NULL DEFAULT 'moh',
  `max_wait_time` int DEFAULT NULL,
  `max_wait_time_action` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `fk_pkg_user_pkg_queue` (`id_user`),
  CONSTRAINT `fk_pkg_user_pkg_queue` FOREIGN KEY (`id_user`) REFERENCES `pkg_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pkg_queue`
--

LOCK TABLES `pkg_queue` WRITE;
/*!40000 ALTER TABLE `pkg_queue` DISABLE KEYS */;
INSERT INTO `pkg_queue` VALUES (1,'teste',4,'br',NULL,NULL,NULL,30,45,NULL,'yes','yes',1,1,NULL,NULL,'ringall','yes','no',NULL,NULL,NULL,NULL,0,NULL,'queue-periodic-announce',30,'yes','yes','yes','yes',0,0,0,0,'moh',0,''),(2,'sdsdsdsd',3,'br',NULL,NULL,NULL,30,45,NULL,'yes','yes',1,1,NULL,NULL,'ringall','yes','no',NULL,NULL,NULL,NULL,0,NULL,'queue-periodic-announce',30,'yes','yes','yes','yes',0,0,0,0,'moh',0,'');
/*!40000 ALTER TABLE `pkg_queue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pkg_queue_agent_status`
--

DROP TABLE IF EXISTS `pkg_queue_agent_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pkg_queue_agent_status` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_user` int DEFAULT NULL,
  `id_queue` int NOT NULL,
  `agentName` varchar(40) DEFAULT NULL,
  `agentStatus` varchar(30) DEFAULT NULL,
  `totalCalls` int NOT NULL DEFAULT '0',
  `last_call` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_index` (`agentName`,`id_queue`),
  KEY `id_user` (`id_user`),
  KEY `id_queue` (`id_queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pkg_queue_agent_status`
--

LOCK TABLES `pkg_queue_agent_status` WRITE;
/*!40000 ALTER TABLE `pkg_queue_agent_status` DISABLE KEYS */;
/*!40000 ALTER TABLE `pkg_queue_agent_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pkg_queue_member`
--

DROP TABLE IF EXISTS `pkg_queue_member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pkg_queue_member` (
  `id` int NOT NULL AUTO_INCREMENT,
  `uniqueid` int DEFAULT NULL,
  `id_user` int NOT NULL,
  `membername` varchar(40) DEFAULT NULL,
  `queue_name` varchar(128) DEFAULT NULL,
  `interface` varchar(128) DEFAULT NULL,
  `penalty` int DEFAULT NULL,
  `paused` tinyint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `queue_interface` (`queue_name`,`interface`),
  KEY `fk_pkg_user_pkg_queue_member` (`id_user`),
  CONSTRAINT `fk_pkg_user_pkg_queue_member` FOREIGN KEY (`id_user`) REFERENCES `pkg_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pkg_queue_member`
--

LOCK TABLES `pkg_queue_member` WRITE;
/*!40000 ALTER TABLE `pkg_queue_member` DISABLE KEYS */;
/*!40000 ALTER TABLE `pkg_queue_member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pkg_queue_status`
--

DROP TABLE IF EXISTS `pkg_queue_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pkg_queue_status` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_queue` int DEFAULT NULL,
  `id_agent` int DEFAULT NULL,
  `callId` varchar(40) NOT NULL,
  `callerId` varchar(60) NOT NULL,
  `status` varchar(30) NOT NULL,
  `time` timestamp NULL DEFAULT NULL,
  `queue_name` varchar(25) NOT NULL,
  `priority` int NOT NULL DEFAULT '0',
  `channel` varchar(50) NOT NULL,
  `holdtime` varchar(11) DEFAULT '',
  `totalCalls` int DEFAULT NULL,
  `answeredCalls` int DEFAULT NULL,
  `callduration` int DEFAULT NULL,
  `oldtime` int NOT NULL DEFAULT '0',
  `agentName` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `callerId` (`callerId`),
  KEY `status` (`status`),
  KEY `timestamp` (`time`),
  KEY `queue_name` (`queue_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pkg_queue_status`
--

LOCK TABLES `pkg_queue_status` WRITE;
/*!40000 ALTER TABLE `pkg_queue_status` DISABLE KEYS */;
/*!40000 ALTER TABLE `pkg_queue_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pkg_rate`
--

DROP TABLE IF EXISTS `pkg_rate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pkg_rate` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_plan` int NOT NULL,
  `id_trunk_group` int NOT NULL,
  `id_prefix` int NOT NULL,
  `rateinitial` decimal(15,6) DEFAULT '0.000000',
  `initblock` int NOT NULL DEFAULT '1',
  `billingblock` int NOT NULL DEFAULT '1',
  `connectcharge` decimal(15,5) NOT NULL DEFAULT '0.00000',
  `disconnectcharge` decimal(15,5) NOT NULL DEFAULT '0.00000',
  `additional_grace` varchar(11) NOT NULL DEFAULT '0',
  `minimal_time_charge` int NOT NULL DEFAULT '0',
  `package_offer` smallint NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `dialprefix` bigint DEFAULT NULL,
  `destination` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_pkg_plan_pkg_rate` (`id_plan`),
  KEY `fk_pkg_prefix_pkg_rate` (`id_prefix`),
  KEY `fk_pkg_trunk_pkg_rate` (`id_trunk_group`),
  KEY `dialprefix` (`dialprefix`),
  CONSTRAINT `fk_pkg_plan_pkg_rate` FOREIGN KEY (`id_plan`) REFERENCES `pkg_plan` (`id`),
  CONSTRAINT `fk_pkg_trunk_group_pkg_rate` FOREIGN KEY (`id_trunk_group`) REFERENCES `pkg_trunk_group` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pkg_rate`
--

LOCK TABLES `pkg_rate` WRITE;
/*!40000 ALTER TABLE `pkg_rate` DISABLE KEYS */;
INSERT INTO `pkg_rate` VALUES (4,2,1,1,0.055500,60,1,0.00080,0.00000,'0',0,0,1,NULL,NULL),(5,2,1,1,0.066600,60,1,0.00060,0.00000,'0',0,0,1,NULL,NULL);
/*!40000 ALTER TABLE `pkg_rate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pkg_rate_agent`
--

DROP TABLE IF EXISTS `pkg_rate_agent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pkg_rate_agent` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_plan` int NOT NULL,
  `id_prefix` int NOT NULL,
  `rateinitial` decimal(15,5) NOT NULL DEFAULT '0.00000',
  `initblock` int NOT NULL DEFAULT '0',
  `billingblock` int NOT NULL DEFAULT '0',
  `minimal_time_charge` smallint NOT NULL DEFAULT '0',
  `package_offer` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_pkg_plan_pkg_rate_agent` (`id_plan`),
  KEY `fk_pkg_prefix_pkg_rate_agent` (`id_prefix`),
  CONSTRAINT `fk_pkg_plan_pkg_rate_agent` FOREIGN KEY (`id_plan`) REFERENCES `pkg_plan` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_pkg_prefix_pkg_rate_agent` FOREIGN KEY (`id_prefix`) REFERENCES `pkg_prefix` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pkg_rate_agent`
--

LOCK TABLES `pkg_rate_agent` WRITE;
/*!40000 ALTER TABLE `pkg_rate_agent` DISABLE KEYS */;
/*!40000 ALTER TABLE `pkg_rate_agent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pkg_rate_callshop`
--

DROP TABLE IF EXISTS `pkg_rate_callshop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pkg_rate_callshop` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_user` int DEFAULT NULL,
  `dialprefix` char(30) NOT NULL,
  `destination` varchar(100) NOT NULL,
  `buyrate` decimal(15,5) NOT NULL DEFAULT '0.00000',
  `minimo` int NOT NULL DEFAULT '1',
  `block` int NOT NULL DEFAULT '1',
  `minimal_time_charge` int DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `dialprefix` (`dialprefix`),
  KEY `fk_pkg_user_pkg_rate_callshop` (`id_user`),
  CONSTRAINT `fk_pkg_user_pkg_rate_callshop` FOREIGN KEY (`id_user`) REFERENCES `pkg_user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pkg_rate_callshop`
--

LOCK TABLES `pkg_rate_callshop` WRITE;
/*!40000 ALTER TABLE `pkg_rate_callshop` DISABLE KEYS */;
/*!40000 ALTER TABLE `pkg_rate_callshop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pkg_rate_provider`
--

DROP TABLE IF EXISTS `pkg_rate_provider`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pkg_rate_provider` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_provider` int NOT NULL,
  `id_prefix` int NOT NULL,
  `buyrate` decimal(15,6) DEFAULT '0.000000',
  `buyrateinitblock` int NOT NULL DEFAULT '1',
  `buyrateincrement` int NOT NULL DEFAULT '1',
  `minimal_time_buy` int NOT NULL DEFAULT '0',
  `dialprefix` varchar(20) DEFAULT NULL,
  `destination` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_pkg_prefix_pkg_rate` (`id_prefix`),
  KEY `dialprefix` (`dialprefix`),
  KEY `fk_pkg_provider_pkg_rate_provider` (`id_provider`),
  KEY `id_prefix` (`id_prefix`),
  CONSTRAINT `fk_pkg_provider_pkg_rate_provider` FOREIGN KEY (`id_provider`) REFERENCES `pkg_provider` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pkg_rate_provider`
--

LOCK TABLES `pkg_rate_provider` WRITE;
/*!40000 ALTER TABLE `pkg_rate_provider` DISABLE KEYS */;
INSERT INTO `pkg_rate_provider` VALUES (1,1,1,4.343400,1,1,0,NULL,NULL);
/*!40000 ALTER TABLE `pkg_rate_provider` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pkg_refill`
--

DROP TABLE IF EXISTS `pkg_refill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pkg_refill` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_user` int NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `credit` decimal(15,5) NOT NULL,
  `description` mediumtext,
  `refill_type` tinyint NOT NULL DEFAULT '0',
  `payment` tinyint(1) DEFAULT '0',
  `invoice_number` varchar(50) NOT NULL DEFAULT '',
  `image` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `fk_pkg_user_pkg_logrefill` (`id_user`),
  CONSTRAINT `fk_pkg_user_pkg_logrefill` FOREIGN KEY (`id_user`) REFERENCES `pkg_user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pkg_refill`
--

LOCK TABLES `pkg_refill` WRITE;
/*!40000 ALTER TABLE `pkg_refill` DISABLE KEYS */;
INSERT INTO `pkg_refill` VALUES (41,4,'2025-01-20 19:44:44',0.02220,'222, Crédito anterior 3.03',0,1,'',''),(42,3,'2025-01-20 19:44:44',0.05550,'55555, Crédito anterior 0.2',0,1,'',''),(43,34,'2025-01-20 19:44:44',10.00000,'reste, Crédito anterior 0',0,1,'',''),(44,34,'2025-01-20 19:44:44',10.00000,'reste, Crédito anterior 10',0,1,'',''),(45,34,'2025-01-20 19:44:44',10.00000,'reste, Crédito anterior 20',0,1,'',''),(46,34,'2025-01-20 19:44:44',10.00000,'reste, Crédito anterior 30',0,1,'',''),(47,34,'2025-01-20 19:44:44',10.00000,'reste, Crédito anterior 40',0,1,'',''),(48,4,'2025-01-20 19:48:08',50.00000,'test, Crédito anterior 3.05',0,1,'',''),(49,3,'2025-01-20 19:48:08',2.32320,'32323, Crédito anterior 0.26',0,1,'',''),(50,3,'2025-01-20 19:51:39',0.34340,'3434, Crédito anterior 0.26',0,1,'','');
/*!40000 ALTER TABLE `pkg_refill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pkg_refill_icepay`
--

DROP TABLE IF EXISTS `pkg_refill_icepay`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pkg_refill_icepay` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_user` int NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `credit` decimal(15,5) NOT NULL,
  `description` mediumtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pkg_refill_icepay`
--

LOCK TABLES `pkg_refill_icepay` WRITE;
/*!40000 ALTER TABLE `pkg_refill_icepay` DISABLE KEYS */;
/*!40000 ALTER TABLE `pkg_refill_icepay` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pkg_refill_provider`
--

DROP TABLE IF EXISTS `pkg_refill_provider`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pkg_refill_provider` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_provider` int NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `credit` decimal(15,5) NOT NULL,
  `description` mediumtext,
  `payment` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_pkg_provider_pkg_logrefill_provider` (`id_provider`),
  CONSTRAINT `fk_pkg_provider_pkg_logrefill_provider` FOREIGN KEY (`id_provider`) REFERENCES `pkg_provider` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pkg_refill_provider`
--

LOCK TABLES `pkg_refill_provider` WRITE;
/*!40000 ALTER TABLE `pkg_refill_provider` DISABLE KEYS */;
/*!40000 ALTER TABLE `pkg_refill_provider` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pkg_restrict_phone`
--

DROP TABLE IF EXISTS `pkg_restrict_phone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pkg_restrict_phone` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_user` int NOT NULL,
  `number` varchar(20) NOT NULL,
  `direction` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `fk_pkg_user_pkg_restricted_phonenumber` (`id_user`),
  KEY `number` (`number`),
  CONSTRAINT `fk_pkg_user_pkg_restricted_phonenumber` FOREIGN KEY (`id_user`) REFERENCES `pkg_user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pkg_restrict_phone`
--

LOCK TABLES `pkg_restrict_phone` WRITE;
/*!40000 ALTER TABLE `pkg_restrict_phone` DISABLE KEYS */;
INSERT INTO `pkg_restrict_phone` VALUES (1,3,'343434',2),(2,2,'r34343434',2);
/*!40000 ALTER TABLE `pkg_restrict_phone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pkg_send_credit`
--

DROP TABLE IF EXISTS `pkg_send_credit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pkg_send_credit` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_user` int NOT NULL,
  `date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `service` varchar(50) NOT NULL,
  `number` varchar(30) NOT NULL,
  `profit` varchar(10) DEFAULT '0',
  `earned` varchar(20) DEFAULT NULL,
  `amount` varchar(10) DEFAULT NULL,
  `total_sale` int DEFAULT NULL,
  `count` int DEFAULT NULL,
  `confirmed` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pkg_send_credit`
--

LOCK TABLES `pkg_send_credit` WRITE;
/*!40000 ALTER TABLE `pkg_send_credit` DISABLE KEYS */;
/*!40000 ALTER TABLE `pkg_send_credit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pkg_servers`
--

DROP TABLE IF EXISTS `pkg_servers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pkg_servers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `host` varchar(100) NOT NULL,
  `public_ip` varchar(80) DEFAULT NULL,
  `username` varchar(50) NOT NULL DEFAULT '',
  `password` varchar(50) NOT NULL,
  `port` char(10) NOT NULL,
  `sip_port` int NOT NULL DEFAULT '5060',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `type` varchar(20) NOT NULL DEFAULT 'freeswitch',
  `weight` int NOT NULL DEFAULT '1',
  `description` text NOT NULL,
  `last_call` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_call_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `host` (`host`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pkg_servers`
--

LOCK TABLES `pkg_servers` WRITE;
/*!40000 ALTER TABLE `pkg_servers` DISABLE KEYS */;
INSERT INTO `pkg_servers` VALUES (1,'dsdsds','10.0.0.1','10.0.0.1','','','',5060,1,'mbilling',0,'22','2025-01-21 18:33:15',NULL);
/*!40000 ALTER TABLE `pkg_servers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pkg_servers_servers`
--

DROP TABLE IF EXISTS `pkg_servers_servers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pkg_servers_servers` (
  `id_proxy` int NOT NULL,
  `id_server` int NOT NULL,
  PRIMARY KEY (`id_server`,`id_proxy`),
  KEY `fk_pkg_servers` (`id_server`),
  KEY `fk_pkg_proxy` (`id_proxy`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pkg_servers_servers`
--

LOCK TABLES `pkg_servers_servers` WRITE;
/*!40000 ALTER TABLE `pkg_servers_servers` DISABLE KEYS */;
/*!40000 ALTER TABLE `pkg_servers_servers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pkg_services`
--

DROP TABLE IF EXISTS `pkg_services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pkg_services` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `type` varchar(50) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `description` text,
  `disk_space` int DEFAULT NULL,
  `sipaccountlimit` int DEFAULT NULL,
  `calllimit` int DEFAULT NULL,
  `return_credit` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pkg_services`
--

LOCK TABLES `pkg_services` WRITE;
/*!40000 ALTER TABLE `pkg_services` DISABLE KEYS */;
/*!40000 ALTER TABLE `pkg_services` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pkg_services_module`
--

DROP TABLE IF EXISTS `pkg_services_module`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pkg_services_module` (
  `id_services` int NOT NULL,
  `id_module` int NOT NULL,
  `action` varchar(45) NOT NULL,
  `show_menu` tinyint(1) NOT NULL DEFAULT '1',
  `createShortCut` tinyint(1) NOT NULL DEFAULT '0',
  `createQuickStart` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_services`,`id_module`),
  KEY `fk_pkg_services_module_pkg_module` (`id_module`),
  CONSTRAINT `fk_pkg_services_module_pkg_module` FOREIGN KEY (`id_module`) REFERENCES `pkg_module` (`id`),
  CONSTRAINT `fk_pkg_services_pkg_services_module` FOREIGN KEY (`id_services`) REFERENCES `pkg_services` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pkg_services_module`
--

LOCK TABLES `pkg_services_module` WRITE;
/*!40000 ALTER TABLE `pkg_services_module` DISABLE KEYS */;
/*!40000 ALTER TABLE `pkg_services_module` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pkg_services_plan`
--

DROP TABLE IF EXISTS `pkg_services_plan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pkg_services_plan` (
  `id_services` int NOT NULL,
  `id_plan` int NOT NULL,
  PRIMARY KEY (`id_services`,`id_plan`),
  KEY `fk_pkg_services_pkg_services_plan` (`id_services`),
  KEY `fk_pkg_plan_pkg_services_plan` (`id_plan`),
  CONSTRAINT `fk_pkg_plan_pkg_services_plan` FOREIGN KEY (`id_plan`) REFERENCES `pkg_plan` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_pkg_services_pkg_services_plan` FOREIGN KEY (`id_services`) REFERENCES `pkg_services` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pkg_services_plan`
--

LOCK TABLES `pkg_services_plan` WRITE;
/*!40000 ALTER TABLE `pkg_services_plan` DISABLE KEYS */;
/*!40000 ALTER TABLE `pkg_services_plan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pkg_services_use`
--

DROP TABLE IF EXISTS `pkg_services_use`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pkg_services_use` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_user` int DEFAULT NULL,
  `id_services` int NOT NULL,
  `reservationdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `releasedate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `contract_period` datetime DEFAULT NULL,
  `termination_date` date DEFAULT NULL,
  `status` int DEFAULT '0',
  `month_payed` int DEFAULT '0',
  `reminded` tinyint NOT NULL DEFAULT '0',
  `id_method` int DEFAULT NULL,
  `next_due_date` varchar(30) DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `fk_pkg_user_pkg_services_use` (`id_user`),
  KEY `fk_pkg_services_pkg_services_use` (`id_services`),
  CONSTRAINT `fk_pkg_services_pkg_services_use` FOREIGN KEY (`id_services`) REFERENCES `pkg_services` (`id`),
  CONSTRAINT `fk_pkg_user_pkg_services_use` FOREIGN KEY (`id_user`) REFERENCES `pkg_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pkg_services_use`
--

LOCK TABLES `pkg_services_use` WRITE;
/*!40000 ALTER TABLE `pkg_services_use` DISABLE KEYS */;
/*!40000 ALTER TABLE `pkg_services_use` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pkg_sip`
--

DROP TABLE IF EXISTS `pkg_sip`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pkg_sip` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_user` int NOT NULL,
  `name` varchar(80) NOT NULL,
  `accountcode` varchar(30) DEFAULT NULL,
  `alias` varchar(10) DEFAULT NULL,
  `regexten` varchar(40) DEFAULT NULL,
  `amaflags` varchar(40) DEFAULT NULL,
  `callcounter` enum('yes','no') DEFAULT NULL,
  `busylevel` int DEFAULT NULL,
  `allowoverlap` enum('yes','no') DEFAULT NULL,
  `allowsubscribe` enum('yes','no') DEFAULT NULL,
  `videosupport` enum('yes','no') DEFAULT 'no',
  `callgroup` char(10) DEFAULT NULL,
  `callerid` varchar(80) DEFAULT NULL,
  `context` varchar(80) DEFAULT NULL,
  `DEFAULTip` char(15) DEFAULT NULL,
  `dtmfmode` char(7) DEFAULT 'RFC2833',
  `fromuser` varchar(80) DEFAULT NULL,
  `fromdomain` varchar(80) DEFAULT NULL,
  `host` varchar(31) DEFAULT NULL,
  `insecure` varchar(20) DEFAULT NULL,
  `language` char(2) DEFAULT NULL,
  `mailbox` varchar(50) DEFAULT NULL,
  `session-timers` enum('accept','refuse','originate') DEFAULT NULL,
  `session-expires` int DEFAULT NULL,
  `session-minse` int DEFAULT NULL,
  `session-refresher` enum('uac','uas') DEFAULT NULL,
  `t38pt_usertpsource` varchar(40) DEFAULT NULL,
  `md5secret` varchar(80) DEFAULT NULL,
  `nat` varchar(25) DEFAULT 'force_rport,comedia',
  `deny` varchar(95) DEFAULT NULL,
  `permit` varchar(95) DEFAULT NULL,
  `pickupgroup` char(10) DEFAULT NULL,
  `port` int DEFAULT NULL,
  `qualify` char(7) DEFAULT 'yes',
  `rtptimeout` int DEFAULT NULL,
  `rtpholdtimeout` int DEFAULT NULL,
  `secret` varchar(80) DEFAULT NULL,
  `type` char(6) DEFAULT 'friend',
  `disallow` varchar(100) DEFAULT 'all',
  `allow` varchar(100) DEFAULT NULL,
  `regseconds` int DEFAULT '0',
  `ipaddr` char(45) DEFAULT NULL,
  `fullcontact` varchar(80) DEFAULT NULL,
  `setvar` varchar(100) DEFAULT NULL,
  `regserver` varchar(20) DEFAULT NULL,
  `lastms` varchar(11) DEFAULT NULL,
  `defaultuser` varchar(40) DEFAULT NULL,
  `auth` varchar(10) DEFAULT NULL,
  `subscribemwi` varchar(10) DEFAULT NULL,
  `vmexten` varchar(20) DEFAULT NULL,
  `cid_number` varchar(40) DEFAULT NULL,
  `callingpres` varchar(20) DEFAULT NULL,
  `usereqphone` varchar(10) DEFAULT NULL,
  `mohsuggest` varchar(20) DEFAULT NULL,
  `allowtransfer` varchar(20) DEFAULT 'no',
  `autoframing` varchar(10) DEFAULT NULL,
  `maxcallbitrate` int DEFAULT NULL,
  `rfc2833compensate` enum('yes','no') DEFAULT NULL,
  `outboundproxy` varchar(40) DEFAULT NULL,
  `rtpkeepalive` int DEFAULT NULL,
  `useragent` varchar(100) DEFAULT NULL,
  `calllimit` int DEFAULT NULL,
  `status` smallint DEFAULT '1',
  `directmedia` varchar(10) DEFAULT 'no',
  `sippasswd` varchar(50) DEFAULT NULL,
  `callshopnumber` varchar(15) DEFAULT NULL,
  `callshoptime` int DEFAULT '0',
  `callbackextension` varchar(40) DEFAULT NULL,
  `sip_group` varchar(20) DEFAULT NULL,
  `ringfalse` tinyint(1) NOT NULL DEFAULT '0',
  `record_call` tinyint(1) NOT NULL DEFAULT '0',
  `voicemail` tinyint(1) NOT NULL DEFAULT '0',
  `voicemail_email` varchar(100) DEFAULT NULL,
  `voicemail_password` int DEFAULT NULL,
  `forward` varchar(50) NOT NULL DEFAULT '',
  `url_events` varchar(150) DEFAULT NULL,
  `block_call_reg` varchar(100) NOT NULL DEFAULT '',
  `dial_timeout` int NOT NULL DEFAULT '60',
  `techprefix` int DEFAULT NULL,
  `trace` tinyint(1) NOT NULL DEFAULT '0',
  `addparameter` varchar(50) NOT NULL DEFAULT '',
  `amd` int NOT NULL DEFAULT '0',
  `sip_config` text,
  `description` varchar(150) DEFAULT NULL,
  `id_trunk_group` int DEFAULT NULL,
  `cnl` varchar(11) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `techprefix` (`techprefix`),
  KEY `host` (`host`),
  KEY `ipaddr` (`ipaddr`),
  KEY `port` (`port`),
  KEY `pkg_sip_hp_index` (`host`,`port`),
  KEY `pkg_sip_ip_index` (`ipaddr`,`port`),
  KEY `fk_pkg_user_pkg_sip_buddies` (`id_user`),
  KEY `name` (`name`),
  CONSTRAINT `fk_pkg_user_pkg_sip_buddies` FOREIGN KEY (`id_user`) REFERENCES `pkg_user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pkg_sip`
--

LOCK TABLES `pkg_sip` WRITE;
/*!40000 ALTER TABLE `pkg_sip` DISABLE KEYS */;
INSERT INTO `pkg_sip` VALUES (1,2,'teste','teste',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'no',NULL,NULL,'billing',NULL,'RFC2833','',NULL,'dynamic','no',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'force_rport,comedia',NULL,NULL,NULL,NULL,'yes',NULL,NULL,'magnus','friend','all','g729,gsm,alaw,ulaw',0,NULL,NULL,NULL,NULL,NULL,'teste',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'no',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'no',NULL,NULL,0,NULL,NULL,0,0,0,NULL,NULL,'',NULL,'',60,NULL,0,'',0,NULL,NULL,NULL,''),(2,3,'39171teste2','test',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'no',NULL,NULL,'billing',NULL,'RFC2833','',NULL,'dynamic','no',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'force_rport,comedia',NULL,NULL,NULL,NULL,'yes',NULL,NULL,'NryJQMxH','friend','all','g729,gsm,alaw,ulaw',0,NULL,NULL,NULL,NULL,NULL,'39171teste2',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'no',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'no',NULL,NULL,0,NULL,NULL,0,0,0,NULL,NULL,'',NULL,'',60,NULL,0,'',0,NULL,NULL,NULL,''),(4,34,'11642','11642',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'no',NULL,NULL,NULL,NULL,'RFC2833','',NULL,'dynamic','no',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'force_rport,comedia',NULL,NULL,NULL,NULL,'yes',NULL,NULL,'upsYBq5f','friend','all','g729,gsm,opus,alaw,ulaw',0,NULL,NULL,NULL,NULL,NULL,'11642',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'no',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'no',NULL,NULL,0,NULL,NULL,0,0,0,NULL,NULL,'',NULL,'',60,NULL,0,'',0,NULL,NULL,NULL,'');
/*!40000 ALTER TABLE `pkg_sip` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pkg_sipura`
--

DROP TABLE IF EXISTS `pkg_sipura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pkg_sipura` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_user` int NOT NULL,
  `macadr` varchar(12) NOT NULL DEFAULT '',
  `senha_admin` varchar(8) NOT NULL DEFAULT '',
  `senha_user` varchar(8) NOT NULL DEFAULT '',
  `antireset` char(3) NOT NULL DEFAULT '',
  `lastmov` varchar(20) NOT NULL DEFAULT '',
  `estado` char(2) NOT NULL DEFAULT '',
  `obs` varchar(50) NOT NULL DEFAULT '',
  `email` varchar(60) NOT NULL DEFAULT '',
  `DHCP` char(3) NOT NULL DEFAULT 'yes',
  `Static_IP` varchar(15) NOT NULL DEFAULT '',
  `NetMask` varchar(15) NOT NULL DEFAULT '',
  `Gateway` varchar(15) NOT NULL DEFAULT '',
  `Primary_DNS` varchar(15) NOT NULL DEFAULT '',
  `Secondary_DNS` varchar(15) NOT NULL DEFAULT '',
  `Provision_Enable` char(3) NOT NULL DEFAULT 'yes',
  `Profile_Rule` varchar(60) DEFAULT 'http://billing.magnusbilling.com/x.php',
  `SIP_Port_1` varchar(5) NOT NULL DEFAULT '5060',
  `Proxy_1` varchar(60) NOT NULL DEFAULT '',
  `Use_Outbound_Proxy_1` char(3) NOT NULL DEFAULT 'no',
  `Outbound_Proxy_1` varchar(60) NOT NULL DEFAULT '',
  `Use_OB_Proxy_In_Dialog_1` char(3) NOT NULL DEFAULT 'yes',
  `Register_1` char(3) NOT NULL DEFAULT 'yes',
  `Make_Call_Without_Reg_1` char(3) NOT NULL DEFAULT 'no',
  `Register_Expires_1` varchar(4) NOT NULL DEFAULT '90',
  `Ans_Call_Without_Reg_1` char(3) NOT NULL DEFAULT 'no',
  `Use_DNS_SRV_1` char(3) NOT NULL DEFAULT 'yes',
  `DNS_SRV_Auto_Prefix_1` char(3) NOT NULL DEFAULT 'no',
  `Proxy_Fallback_Intvl_1` varchar(4) NOT NULL DEFAULT '3600',
  `Voice_Mail_Server_1` varchar(30) NOT NULL DEFAULT '',
  `SIP_Port_2` varchar(5) NOT NULL DEFAULT '5061',
  `Proxy_2` varchar(60) NOT NULL DEFAULT '',
  `Use_Outbound_Proxy_2` char(3) NOT NULL DEFAULT 'no',
  `Outbound_Proxy_2` varchar(60) NOT NULL DEFAULT '',
  `Use_OB_Proxy_In_Dialog_2` char(3) NOT NULL DEFAULT 'yes',
  `Register_2` char(3) NOT NULL DEFAULT 'yes',
  `Make_Call_Without_Reg_2` char(3) NOT NULL DEFAULT 'no',
  `Register_Expires_2` varchar(4) NOT NULL DEFAULT '120',
  `Ans_Call_Without_Reg_2` char(3) NOT NULL DEFAULT 'no',
  `Use_DNS_SRV_2` char(3) NOT NULL DEFAULT 'yes',
  `DNS_SRV_Auto_Prefix_2` char(3) NOT NULL DEFAULT 'no',
  `Proxy_Fallback_Intvl_2` varchar(4) NOT NULL DEFAULT '3600',
  `Voice_Mail_Server_2` varchar(30) NOT NULL DEFAULT '',
  `Display_Name_1` varchar(30) NOT NULL DEFAULT '',
  `Display_Name_2` varchar(30) NOT NULL DEFAULT '',
  `User_ID_1` varchar(25) NOT NULL DEFAULT '',
  `User_ID_2` varchar(25) NOT NULL DEFAULT '',
  `Password_1` varchar(25) NOT NULL DEFAULT '',
  `Password_2` varchar(25) NOT NULL DEFAULT '',
  `Use_Auth_ID_1` char(3) NOT NULL DEFAULT 'no',
  `Use_Auth_ID_2` char(3) NOT NULL DEFAULT '',
  `Auth_ID_1` varchar(25) NOT NULL DEFAULT '',
  `Auth_ID_2` varchar(25) NOT NULL DEFAULT '',
  `Preferred_Codec_1` varchar(8) NOT NULL DEFAULT 'G729a',
  `Preferred_Codec_2` varchar(8) NOT NULL DEFAULT 'G729a',
  `Use_Pref_Codec_Only_1` char(3) NOT NULL DEFAULT 'no',
  `Use_Pref_Codec_Only_2` char(3) NOT NULL DEFAULT 'no',
  `Dial_Plan_1` longtext NOT NULL,
  `Dial_Plan_2` longtext NOT NULL,
  `Caller_Conn_Polarity_1` varchar(10) NOT NULL DEFAULT 'Forward',
  `Caller_Conn_Polarity_2` varchar(10) NOT NULL DEFAULT 'Forward',
  `altera` char(3) NOT NULL DEFAULT 'si',
  `fultmov` varchar(30) NOT NULL DEFAULT '0000-00-00',
  `fultlig` varchar(30) NOT NULL DEFAULT '0000-00-00',
  `Enable_Web_Server` char(3) NOT NULL DEFAULT 'yes',
  `origem` varchar(5) NOT NULL DEFAULT '',
  `username` varchar(20) NOT NULL DEFAULT 'patel',
  `last_ip` varchar(15) NOT NULL DEFAULT '',
  `last_port` varchar(5) NOT NULL DEFAULT '',
  `Web_Server_Port` varchar(5) NOT NULL DEFAULT '80',
  `conf01` char(1) NOT NULL DEFAULT '',
  `conf02` char(1) NOT NULL DEFAULT '',
  `conf03` char(1) NOT NULL DEFAULT '',
  `borrado` char(2) NOT NULL DEFAULT '',
  `marca` char(2) NOT NULL DEFAULT 'X',
  `contador` int NOT NULL DEFAULT '0',
  `nserie` varchar(15) NOT NULL DEFAULT '',
  `Callee_Conn_Polarity_1` varchar(10) NOT NULL DEFAULT 'Forward',
  `Callee_Conn_Polarity_2` varchar(10) NOT NULL DEFAULT 'Forward',
  `Idle_Conn_Polarity_1` varchar(10) NOT NULL DEFAULT 'Forward',
  `Idle_Conn_Polarity_2` varchar(10) NOT NULL DEFAULT 'Forward',
  `Jitter_1` varchar(20) NOT NULL DEFAULT 'high',
  `Jitter_2` varchar(20) NOT NULL DEFAULT 'high',
  `RTP_Packet_Size` varchar(10) NOT NULL DEFAULT '0.030',
  `AVT_Dynamic_Payload` varchar(10) NOT NULL DEFAULT '101',
  `STUN_Enable` char(3) NOT NULL DEFAULT 'no',
  `STUN_Server` varchar(80) NOT NULL DEFAULT '',
  `Dial_Tone` varchar(80) NOT NULL DEFAULT '420@-16;10(*/0/1)',
  `Busy_Tone` varchar(80) NOT NULL DEFAULT '480@-19,620@-19;10(.5/.5/1+2)',
  `Reorder_Tone` varchar(80) NOT NULL DEFAULT '480@-19,620@-19;10(.25/.25/1+2)',
  `Ring_Back_Tone` varchar(80) NOT NULL DEFAULT '440@-19,480@-19;*(2/4/1+2)',
  `Hook_Flash_Timer_Min` varchar(10) NOT NULL DEFAULT '.1',
  `Hook_Flash_Timer_Max` varchar(10) NOT NULL DEFAULT '.9',
  `Time_Zone` varchar(20) NOT NULL DEFAULT 'GMT',
  `FXS_Port_Input_Gain` varchar(10) NOT NULL DEFAULT '-3',
  `FXS_Port_Output_Gain` varchar(10) NOT NULL DEFAULT '-3',
  `Echo_Supp_Enable_1_` char(3) NOT NULL DEFAULT 'yes',
  `Echo_Supp_Enable_2_` char(3) NOT NULL DEFAULT 'yes',
  `NAT_Keep_Alive_Enable_1_` char(3) NOT NULL DEFAULT 'no',
  `NAT_Keep_Alive_Enable_2_` char(3) NOT NULL DEFAULT 'no',
  `NAT_Mapping_Enable_1_` char(3) NOT NULL DEFAULT 'no',
  `NAT_Mapping_Enable_2_` char(3) NOT NULL DEFAULT 'no',
  `NAT_Keep_Alive_Dest_1_` varchar(80) DEFAULT '$PROXY',
  `NAT_Keep_Alive_Dest_2_` varchar(80) DEFAULT '$PROXY',
  `SIP_TOS_DiffServ_Value_1_` varchar(20) NOT NULL DEFAULT '0x68',
  `SIP_TOS_DiffServ_Value_2_` varchar(20) NOT NULL DEFAULT '0x68',
  `RTP_TOS_DiffServ_Value_1_` varchar(20) NOT NULL DEFAULT '0xb8',
  `RTP_TOS_DiffServ_Value_2_` varchar(20) NOT NULL DEFAULT '0xb8',
  `Upgrade_Enable` char(3) NOT NULL DEFAULT 'no',
  `Upgrade_Rule` varchar(80) NOT NULL DEFAULT '',
  `falta` date NOT NULL DEFAULT '0000-00-00',
  `Silence_Supp_Enable_1_` char(3) NOT NULL DEFAULT 'no',
  `Silence_Supp_Enable_2_` char(3) NOT NULL DEFAULT 'no',
  `DTMF_Tx_Method_1_` varchar(20) NOT NULL DEFAULT 'Auto',
  `DTMF_Tx_Method_2_` varchar(20) NOT NULL DEFAULT 'Auto',
  `Enable_IP_Dialing_1_` char(3) NOT NULL DEFAULT 'no',
  `Enable_IP_Dialing_2_` char(3) NOT NULL DEFAULT 'no',
  `SAS_DLG_Refresh_Intvl_1_` varchar(10) NOT NULL DEFAULT '30',
  `SAS_DLG_Refresh_Intvl_2_` varchar(10) NOT NULL DEFAULT '30',
  `SAS_Enable_1_` char(3) NOT NULL DEFAULT 'no',
  `SAS_Enable_2_` char(3) NOT NULL DEFAULT 'no',
  `ruleb` varchar(20) NOT NULL DEFAULT '',
  `RTP_Port_Min` varchar(10) NOT NULL DEFAULT '16384',
  `RTP_Port_Max` varchar(10) NOT NULL DEFAULT '16482',
  `Syslog_Server` varchar(20) NOT NULL DEFAULT '',
  `Debug_Server` varchar(20) NOT NULL DEFAULT '',
  `Debug_Level` char(1) NOT NULL DEFAULT '0',
  `SIP_Debug_Option_1_` varchar(25) NOT NULL DEFAULT 'none',
  `SIP_Debug_Option_2_` varchar(25) NOT NULL DEFAULT 'none',
  `Blind_Attn_Xfer_Enable_1_` char(3) NOT NULL DEFAULT 'no',
  `Blind_Attn_Xfer_Enable_2_` char(3) NOT NULL DEFAULT 'no',
  `Xfer_When_Hangup_Conf_1_` char(3) NOT NULL DEFAULT 'yes',
  `Xfer_When_Hangup_Conf_2_` char(3) NOT NULL DEFAULT 'yes',
  `Three_Way_Call_Serv_1_` char(3) NOT NULL DEFAULT 'yes',
  `Three_Way_Call_Serv_2_` char(3) NOT NULL DEFAULT 'yes',
  `Attn_Transfer_Serv_1_` char(3) NOT NULL DEFAULT 'yes',
  `Attn_Transfer_Serv_2_` char(3) NOT NULL DEFAULT 'yes',
  `Three_Way_Conf_Serv_1_` char(3) NOT NULL DEFAULT 'yes',
  `Three_Way_Conf_Serv_2_` char(3) NOT NULL DEFAULT 'yes',
  `Unattn_Transfer_Serv_1_` char(3) NOT NULL DEFAULT 'yes',
  `Unattn_Transfer_Serv_2_` char(3) NOT NULL DEFAULT 'yes',
  `nombre` tinytext,
  `Handle_VIA_received` char(3) NOT NULL DEFAULT 'no',
  `Handle_VIA_rport` char(3) NOT NULL DEFAULT 'no',
  `Insert_VIA_received` char(3) NOT NULL DEFAULT 'no',
  `Insert_VIA_rport` char(3) NOT NULL DEFAULT 'no',
  `Substitute_VIA_Addr` char(3) NOT NULL DEFAULT 'no',
  `Send_Resp_To_Src_Port` char(3) NOT NULL DEFAULT 'no',
  `STUN_Test_Enable` char(3) NOT NULL DEFAULT 'no',
  `Interdigit_Long_Timer` char(3) NOT NULL DEFAULT '10',
  `Speed_Dial_2_1_` tinytext,
  `Speed_Dial_3_1_` tinytext,
  `Speed_Dial_4_1_` tinytext,
  `Speed_Dial_5_1_` tinytext,
  `Speed_Dial_6_1_` tinytext,
  `Speed_Dial_7_1_` tinytext,
  `Speed_Dial_8_1_` tinytext,
  `Speed_Dial_9_1_` tinytext,
  `Speed_Dial_2_2_` tinytext,
  `Speed_Dial_3_2_` tinytext,
  `Speed_Dial_4_2_` tinytext,
  `Speed_Dial_5_2_` tinytext,
  `Speed_Dial_6_2_` tinytext,
  `Speed_Dial_7_2_` tinytext,
  `Speed_Dial_8_2_` tinytext,
  `Speed_Dial_9_2_` tinytext,
  `Caller_ID_Method` tinytext,
  UNIQUE KEY `interno` (`id`),
  KEY `email` (`email`,`id_user`),
  KEY `username` (`username`),
  KEY `fk_pkg_user_sipuras` (`id_user`),
  CONSTRAINT `fk_pkg_user_sipuras` FOREIGN KEY (`id_user`) REFERENCES `pkg_user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pkg_sipura`
--

LOCK TABLES `pkg_sipura` WRITE;
/*!40000 ALTER TABLE `pkg_sipura` DISABLE KEYS */;
INSERT INTO `pkg_sipura` VALUES (1,3,'3232323','','dddd','0','','','','','yes','','','','','','yes','http://billing.magnusbilling.com/x.php','5060','','no','','yes','yes','no','360','no','yes','no','3600','','5061','','no','','yes','yes','no','360','no','yes','no','3600','','','','2222','','','','no','','','','G729a','G729a','0','1','(*xx|[3469]11|0|00|[2-9]xxxxxx|1xxx[2-9]xxxxxxS0|xxxxxxxxxxxx.)','(*xx|[3469]11|0|00|[2-9]xxxxxx|1xxx[2-9]xxxxxxS0|xxxxxxxxxxxx.)','Forward','Forward','si','0000-00-00','0000-00-00','1','','patel','','','80','','','','','X',0,'23232','Forward','Forward','Forward','Forward','high','high','0.030','101','0','','420@-16;10(*/0/1)','480@-19,620@-19;10(.5/.5/1+2)','480@-19,620@-19;10(.25/.25/1+2)','440@-19,480@-19;*(2/4/1+2)','.1','.9','GMT','-3','-3','yes','yes','0','0','0','0','$PROXY','$PROXY','0x68','0x68','0xb8','0xb8','no','','0000-00-00','no','no','Auto','Auto','no','no','30','30','no','no','','16384','16482','','','0','none','none','no','no','yes','yes','yes','yes','yes','yes','yes','yes','yes','yes',NULL,'no','no','no','no','0','no','0','10',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(2,4,'ewdewdew','','','0','','','','','yes','','','','','','yes','http://billing.magnusbilling.com/x.php','5060','','no','','yes','yes','no','360','no','yes','no','3600','','5061','','no','','yes','yes','no','360','no','yes','no','3600','','','','2222','','','','no','','','','G729a','G729a','0','1','(*xx|[3469]11|0|00|[2-9]xxxxxx|1xxx[2-9]xxxxxxS0|xxxxxxxxxxxx.)','(*xx|[3469]11|0|00|[2-9]xxxxxx|1xxx[2-9]xxxxxxS0|xxxxxxxxxxxx.)','Forward','Forward','si','0000-00-00','0000-00-00','1','','patel','','','80','','','','','X',0,'wdewd','Forward','Forward','Forward','Forward','high','high','0.030','101','0','','420@-16;10(*/0/1)','480@-19,620@-19;10(.5/.5/1+2)','480@-19,620@-19;10(.25/.25/1+2)','440@-19,480@-19;*(2/4/1+2)','.1','.9','GMT','-3','-3','yes','yes','0','0','0','0','$PROXY','$PROXY','0x68','0x68','0xb8','0xb8','no','','0000-00-00','no','no','Auto','Auto','no','no','30','30','no','no','','16384','16482','','','0','none','none','no','no','yes','yes','yes','yes','yes','yes','yes','yes','yes','yes',NULL,'no','no','no','no','0','no','0','10',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `pkg_sipura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pkg_sms`
--

DROP TABLE IF EXISTS `pkg_sms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pkg_sms` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_user` int NOT NULL,
  `prefix` int NOT NULL DEFAULT '0',
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `telephone` varchar(50) NOT NULL DEFAULT '',
  `sms` mediumtext NOT NULL,
  `status` int NOT NULL DEFAULT '0',
  `rate` decimal(15,5) NOT NULL DEFAULT '0.00000',
  `sms_from` varchar(16) DEFAULT NULL,
  `result` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_pkg_user_pkg_sms` (`id_user`),
  KEY `prefix` (`prefix`),
  KEY `date` (`date`),
  CONSTRAINT `fk_pkg_user_pkg_sms` FOREIGN KEY (`id_user`) REFERENCES `pkg_user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pkg_sms`
--

LOCK TABLES `pkg_sms` WRITE;
/*!40000 ALTER TABLE `pkg_sms` DISABLE KEYS */;
/*!40000 ALTER TABLE `pkg_sms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pkg_smtp`
--

DROP TABLE IF EXISTS `pkg_smtp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pkg_smtp` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_user` int NOT NULL,
  `host` varchar(100) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(50) NOT NULL,
  `port` varchar(10) NOT NULL,
  `encryption` varchar(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_pkg_user_pkg_smtp` (`id_user`),
  CONSTRAINT `fk_pkg_user_pkg_smtp` FOREIGN KEY (`id_user`) REFERENCES `pkg_user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pkg_smtp`
--

LOCK TABLES `pkg_smtp` WRITE;
/*!40000 ALTER TABLE `pkg_smtp` DISABLE KEYS */;
INSERT INTO `pkg_smtp` VALUES (1,1,'smtp.zoho.com','info@addphone.net','JoseMarta81','587','tls');
/*!40000 ALTER TABLE `pkg_smtp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pkg_status_system`
--

DROP TABLE IF EXISTS `pkg_status_system`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pkg_status_system` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `cpuMediaUso` float NOT NULL DEFAULT '0',
  `cpuPercent` float NOT NULL DEFAULT '0',
  `memTotal` int DEFAULT NULL,
  `memUsed` float NOT NULL DEFAULT '0',
  `networkin` float NOT NULL DEFAULT '0',
  `networkout` float NOT NULL DEFAULT '0',
  `cpuModel` varchar(200) DEFAULT NULL,
  `uptime` varchar(200) DEFAULT NULL,
  `cps` int NOT NULL DEFAULT '0',
  `disk_free` int DEFAULT NULL,
  `disk_perc` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `date` (`date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pkg_status_system`
--

LOCK TABLES `pkg_status_system` WRITE;
/*!40000 ALTER TABLE `pkg_status_system` DISABLE KEYS */;
/*!40000 ALTER TABLE `pkg_status_system` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pkg_templatemail`
--

DROP TABLE IF EXISTS `pkg_templatemail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pkg_templatemail` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_user` int NOT NULL,
  `mailtype` char(50) DEFAULT NULL,
  `fromemail` char(70) DEFAULT NULL,
  `fromname` char(70) DEFAULT NULL,
  `subject` varchar(130) DEFAULT NULL,
  `messagehtml` varchar(3000) DEFAULT NULL,
  `language` varchar(5) DEFAULT 'br',
  `status` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pkg_templatemail`
--

LOCK TABLES `pkg_templatemail` WRITE;
/*!40000 ALTER TABLE `pkg_templatemail` DISABLE KEYS */;
INSERT INTO `pkg_templatemail` VALUES (1,1,'signup','noreply@site.com','VoIP','Ativação de conta','<p>$firstname$ $lastname$, bem vindo ao nosso sistema de comunicação IP!</p>\n<p>Para concluir o processo de ativação de sua conta por favor clique no link abaixo:</p>\n<p><a href=\"http://ip/mbilling//index.php/signup/$idcard$?username=$cardnumber$&password=$password$&loginkey=$loginkey$\">\nhttp://ip/mbilling/index.php/signup/$idcard$?username=$cardnumber$&password=$password$&loginkey=$loginkey$</a></p>\n<br>\n<p>Por favor não esqueça de ativar sua conta.</p>\n<br>\n<p>  Usuário=$login$  </p>\n<p> Senha:$password$  </p>\n<br> \n<p>Atenciosamente,<br>','br',1),(2,1,'reminder','noreply@site.com','VoIP','Sua conta esta com saldo baixo ( R$ $credit$)','<p>Olá $firstname$ $lastname$, </p>\n<p>Sua conta VoIP número $cardnumber$ está com saldo baixo.</p>\n<br>\n<p>Seu saldo atual é de R$ $credit$, valor abaixo do mánimo configurado em sua conta (R$ $credit_notification$,00).</p>\n<p>Adquiria novos créditos e não fique sem falar.</p>\n<br>  \n<p>Para adquirir créditos, entrar em contato conosco ou desativar o aviso de saldo baixo acesse sua Ã¡rea de cliente através de nosso site.</p>\n<p>Observação: Caso possua limite de crédito conosco ele Ã© somado ao seu saldo para o envio de notificação de saldo baixo.</p>\n<br> \n<p>Atenciosamente,<br>\n ','br',1),(3,1,'signupconfirmed','noreply@site.com','VoIP','Bem Vindo','<p>Bem vindo !</p>\n<p>Configure seu softphone com os dados abaixo e comece a ligar agora mesmo:</p>\n<br>\n<p>Usuário=$login$  </p>\n<p>Senha:$password$  </p>\n<br> \n<p>Atenciosamente,<br>','br',1),(4,1,'did_paid','noreply@site.com','VoIP','Pagamento de Numero Virtual - ($did$)','<p>SALDO DISPONÍVEL $balance_remaining$ $base_currency$</p>\n<p>Foi debitado automaticamente de seu saldo o valor de R$ $did_cost$,00   referente ao pagamento de seu número virtual (DID) ($did$).</p> <p>Custo mensal de seu número virtual: R$ $did_cost$,00</p> \n<br> \n<p>Atenciosamente,<br> ','br',1),(5,1,'did_unpaid','noreply@site.com','VoIP','Notificação para pagamento de Número Virtual ($did$)','<p>Olá.</p>\n<p>Seu crédito atual (R$ $balance_remaining$ $base_currency$) não é suficiente para o pagamento mensal de seu número virtual DID ($did$).</p>\n<p>O custo mensal de seu DID é  $did_cost$ $base_currency$</p>\n<br>\n<p>Você tem $days_remaining$ para efetuar uma recarga no valor suficiente para o pagamento do seu número virtual.</p>\n<p>Qualquer dúvida por favor entre em contato através de nosso suporte<br> </p> \n<br> \n<p>Atenciosamente,<br>','br',1),(6,1,'did_released','noreply@site.com','VoIP','Did Cancelado','<p>Olá</p> <p>Seu Número Virtual (DID) $did$ foi automaticamente cancelado até que o pagamento de sua sua ultima fatura seja confirmado. </p> <p>Durante esse período não será possí­vel receber chamadas através do mesmo.</p>\n<br> \n<p>Atenciosamente,<br>','br',1),(7,1,'did_confirmation','noreply@site.com','VoIP','Número DID $did$ ativado','<p>Olá  $firstname$ $lastname$</p>\n<p>O número  $did$ foi ativado para a conta $login$.</p>\n<br>\n<p>Usuário=$login$  </p>\n<p>Senha:$password$  </p>\n<br> \n<p>Atenciosamente,<br>','br',1),(8,1,'refill','noreply@site.com','VoIP','Recarga de crédito confirmada','<p>Olá $firstname$ $lastname$</p>\n<p>Uma recarga de crédito foi realizada com sucesso em sua conta $login$.</p>\n<p>Número da recarga = $itemID$</p>\n<br> \n<p>Valor = $itemAmount$ $base_currency$</p>\n<br>\n<p>Descrição= $description$</p>\n<br>\n<p>Seu crédito atual é de $credit$ $base_currency$</p>\n<br> \n<p>Atenciosamente,<br>\n','br',1),(9,1,'plan_unpaid','noreply@site.com','VoIP','Aviso de Vencimento do Plano Mensal','<p>Estimado $firstname$ $lastname$. <br>\n  Enviamos esta mensagem para avisar que seu plano esta por vencer e não tem crédito para efetuar o pagamento. </p>\n<p>Por favor, entre em sua área de cliente, menu, Comprar Crédito, e compre mínimo $plancost$  $base_currency$ de crédito. </p>\n<br>\n<p>Usário=$login$  </p>\n<p>Senha:$password$  </p>\n<br> \n<p>Você tem $days_to_pay$ dias para fazer o pagamento, ou seu plano sera cancelado.</p>\n<br> \n<p>Atenciosamente,<br>','br',1),(10,1,'plan_paid','noreply@site.com','VoIP','Pagamento do plano recebido','<p>Estimado $firstname$ $lastname$.</p>\n<p>O pagamento do seu plano já foi efetuado.</p>\n<br>\n<p>Seu crédito atual é de $credit$ $base_currency$</p>\n<p>Usuário=$login$  </p>\n<p>Senha:$password$  </p>\n<br> \n<p>Atenciosamente,<br>','br',1),(11,1,'plan_released','noreply@site.com','VoIP','Plano cancelado','<p>Estimado $firstname$ $lastname$.</p>\n<p>Seu plano foi cancelado por falta de pagamento</p>\n<br>\n<p>Usuário=$login$  </p>\n<p>Senha:$password$  </p>\n<br> \n<p>Atenciosamente,<br>','br',1),(32,1,'signup','noreply@site.com','VoIP','Confirmación de email','<p style=\"color: rgb(0, 0, 0);\">$lastname$ $firstname$, gracias por registrarse con nosotros.</p>\n<p style=\"color: rgb(0, 0, 0);\">Por favor, copie y pegue el código a continuación en la página de registro para activar su cuenta. <br></p>\n<p style=\"color: rgb(0, 0, 0);\">$loginkey$</p>\n<p style=\"color: rgb(0, 0, 0);\">o haga clic aquí &nbsp;<a href=\"http://SU_IP/mbilling/index.php/signup/$iduser$?username=$login$&amp;password=$password$&amp;loginkey=$loginkey$\">http://SU_IP/mbilling/index.php/signup/$iduser$?username=$login$&amp;password=$password$&amp;loginkey=$loginkey$</a></p>\n<p style=\"color: rgb(0, 0, 0);\"><br>\n  \n\n\n  Por favor, asegúrese de activar su cuenta.</p><p style=\"color: rgb(0, 0, 0);\">Un cordial saludo<br></p>','es',1),(33,1,'reminder','noreply@site.com','VoIP','Su cuenta VoIP tiene poco crédito ( $credit$ $currency$)','Hola $lastname$ $firstname$, su cuenta esta con poco crédito USUARIO $login$.\n\n<p>En la actualidad, solo hay $credit$ $currency$ en su cuenta, que es menor que el nivel de alerta definido por usted, que es de ($credit_notification$ ).</p>\n<p>Por favor recargue su cuenta lo antes posible para garantizar la continuidad del servicio.</p>\n<p><a href=\"http://SU_IP/mbilling\">http://SU_IP/mbilling</a><br></p><p>Nombre de usuario: $login$</p>\n<p>Contraseña: $password$</p>\n<p>Un cordial saludo</p>\n\n\n','es',1),(34,1,'signupconfirmed','noreply@site.com','VoIP','Confirmación de registro','<p><strong>Ahora usted es un usuario registrado.</strong></p>\n<p>Para entrar en su panel de cliente:</p><p><br>\n  <a href=\"http://SU_IP/mbilling\">http://SU_IP/mbilling</a><br>\n  Su usuario es: $login$<br>\n  Su clave es : $password$</p>\n<p></p><p><br></p>\n<p>Un cordial saludo</p>\n','es',1),(35,1,'did_paid','noreply@site.com','VoIP','Cobranza de su número DID - $did$','<p>Hola $lastname$ $firstname$.</p>\n<p>El importe de $did_cost$ $base_currency$ fue cobrado de su cuenta por el pago mensual de su DID  ($did$)</p>\n<p>Costo mensual por su DID : $did_cost$ $base_currency$</p>\n<p>El crédito actual de su cuenta $login$, es de $credit$  $base_currency$</p>\n<p>Un cordial saludo</p>\n<p><b>$obs$</b><br></p>','es',1),(36,1,'did_unpaid','noreply@site.com','VoIP','Notificación de vencimiento de su número $did$','<p>Hola $firstname$ $lastname$, el crédito actual de su cuenta $login$ es de $balance_remaining$ $base_currency$</p>\n<p>Su crédito no es suficiente para pagar su número DID  ($did$), el costo mensual por su DID es de $did_cost$ $base_currency$</p>\n<p>Por favor agregue crédito a su cuenta antes del día de vencimiento del DID, o el DID será dado de baja automáticamente.</p>\n<p>Para cargar crédito, entre en su cuenta, y haga clic en el menú Comprar Crédito.<br>\n</p>\n<p>Un cordial saludo</p>\n<b>$obs$</b>','es',1),(37,1,'did_released','noreply@site.com','VoIP','DID desactivado - ($did$)','<p>Hola $firstname$ $lastname$</p>\n<p>Esta es una notificación que el número DID  $did$ ha sido desactivado de su cuenta $login$.</p>\n<p>Se dará de baja definitivamente si no se renueva inmediatamente.<br>\n  <br>Una notificación anterior ha sido enviada al correo electrónico de contacto que aparece en su cuenta.</p>\n<p>Un cordial saludo<br><br></p>\n<b>$obs$</b>\n','es',1),(38,1,'did_confirmation','noreply@site.com','VoIP','Activación de número Fijo DID','<p style=\"color: rgb(0, 0, 0);\">Hola  $firstname$ $lastname$, Felicitaciones! </p>\n<p style=\"color: rgb(0, 0, 0);\">El número  $did$ fue activado con éxito para la cuenta $login$.</p>\n<p style=\"color: rgb(0, 0, 0);\">Usted puede reenviar su número para un fijo o celular, para esto entre en su panel de cliente.</p><p style=\"color: rgb(0, 0, 0);\"><br><a href=\"http://SU_IP/mbilling\">\n  http://SU_IP/mbilling</a><br>\n  Nombre de usuario : $login$<br>\n  Contraseña : $password$</p>\n<p style=\"color: rgb(0, 0, 0);\">Un cordial saludo<br></p>','es',1),(39,1,'refill','noreply@site.com','VoIP','Recarga de crédito confirmada','<p>Hola $firstname$ $lastname$</p>\n<p>Una recarga de crédito fue realizada con éxito en su cuenta $login$.</p>\n\n<p>Número de la recarga = $itemID$</p>\n<p>Importe = $itemAmount$ $base_currency$</p>\n<p>Descripción = $description$</p>\n\n<p>Su crédito actual es de $credit$ $base_currency$</p>\n<br>\nUn cordial saludo<br>\n','es',1),(40,1,'plan_unpaid','noreply@site.com','VoIP','Aviso de Vencimiento del Plan Mensual','<p>Estimado $firstname$ $lastname$. <br>\n  Le enviamos este mensaje para comunicarle que su plan esta por vencer y no posee crédito para efectuar el pago. </p>\n<p>Ud. puede ingresar a su área de Cliente con estos datos:<br></p><p><br><a href=\"http://SU_IP/mbilling\">http://SU_IP/mbilling</a><br>\n  Usuario=$login$ <br>\n  Clave:$password$ </p>\n<p>Por favor recargue su cuenta o su plan sera dado de baja automáticamente en el dia del vencimiento. </p>\n<p>Un cordial saludo<br></p>\n<p><br></p>\n\n<b>$obs$</b>','es',1),(41,1,'plan_paid','noreply@site.com','VoIP','Confirmación de pago del plan mensual recibido','<p>Estimado $firstname$ $lastname$.</p>\n<p>El pago de su plan mensual ya fue efectuado.</p>\n<p>Su crédito actual es de $credit$ $base_currency$</p>\n<p>Quedamos a su entera disposición ante  cualquier inquietud.</p>\n<p>Un cordial saludo</p>\n<b>$obs$</b>','es',1),(42,1,'plan_released','noreply@site.com','VoIP','Su plan fue dado de baja.','<p>Estimado $firstname$ $lastname$.</p>\n<p>Su plan venció hoy y no recibimos la confirmación de pago.</p>\n<p>Su plan fue suspendido automáticamente hasta que nos sea informado el pago.</p>\n<p>Ud. puede ingresar a su Área de Cliente con estos datos:&nbsp;<br></p><p><a href=\"http://SU_IP/mbilling\">http://SU_IP/mbilling</a><br>\n  Usuario=$login$<br>\n  Clave:$password$</p>\n<p>Un cordial saludo<br></p>\n$obs$','es',1),(43,1,'signup','noreply@site.com','VoIP','Account Activation','<p><span style=\"font-family: arial, sans, sans-serif;\">$lastname$ $firstname$, thank you for signing up with us</span><br style=\"font-family: arial, sans, sans-serif;\"><span style=\"font-family: arial, sans, sans-serif;\">Please click in this link to activate your account.</span><br style=\"font-family: arial, sans, sans-serif;\"><font face=\"arial, sans, sans-serif\"><a href=\"http://your_ip/mbilling/index.php/signup/$iduser$?username=$login$&amp;password=$password$&amp;loginkey=$loginkey$\">http://your_ip/mbilling/index.php/signup/$iduser$?username=$login$&amp;password=$password$&amp;loginkey=$loginkey$</a></font><br style=\"font-family: arial, sans, sans-serif;\"><br style=\"font-family: arial, sans, sans-serif;\"><span style=\"font-family: arial, sans, sans-serif;\">Please make sure to activate your account.</span><br style=\"font-family: arial, sans, sans-serif;\"><br></p><p><span style=\"font-family: arial, sans, sans-serif;\">Best regards</span></p>','en',1),(44,1,'reminder','noreply@site.com','VoIP','Your VOIP Account has a low credit balance of ( $credit$ $currency$)','<span style=\"font-family: arial, sans, sans-serif;\">Hello $lastname$ $firstname$, your account is low on credit. User $login$.</span><br style=\"font-family: arial, sans, sans-serif;\"><br style=\"font-family: arial, sans, sans-serif;\"><span style=\"font-family: arial, sans, sans-serif;\">Right now, there is $credit$ $currency$ in your account, which is lower than the alert level you defined, ($credit_notification$ ).</span><br style=\"font-family: arial, sans, sans-serif;\"><br style=\"font-family: arial, sans, sans-serif;\"><span style=\"font-family: arial, sans, sans-serif;\">To make sure your account continues working, please recharge your account as soon as possible.</span><br style=\"font-family: arial, sans, sans-serif;\"><br style=\"font-family: arial, sans, sans-serif;\"><span style=\"font-family: arial, sans, sans-serif;\">If you don\'t want to receive this notification any longer or want to change the balance amount for this alert, please login in the customer web page and change the alerts settings as needed.</span><br style=\"font-family: arial, sans, sans-serif;\"><br style=\"font-family: arial, sans, sans-serif;\"><a moz-do-not-send=\"true\" href=\"http://your_ip/mbilling\" style=\"font-family: arial, sans, sans-serif;\">http://your_ip/mbilling</a><br style=\"font-family: arial, sans, sans-serif;\"><br style=\"font-family: arial, sans, sans-serif;\"><span style=\"font-family: arial, sans, sans-serif;\">Username: $login$</span><br style=\"font-family: arial, sans, sans-serif;\"><br style=\"font-family: arial, sans, sans-serif;\"><span style=\"font-family: arial, sans, sans-serif;\">Password: $password$</span><br style=\"font-family: arial, sans, sans-serif;\"><br style=\"font-family: arial, sans, sans-serif;\"><span style=\"font-family: arial, sans, sans-serif;\">Greetings</span><br>\n\n\n','en',1),(45,1,'signupconfirmed','noreply@site.com','VoIP','Welcome. Your account login information in included','<p><span style=\"font-family: arial, sans, sans-serif;\">Hello $lastname$ $firstname$&nbsp;</span><br style=\"font-family: arial, sans, sans-serif;\"><br style=\"font-family: arial, sans, sans-serif;\"><span style=\"font-family: arial, sans, sans-serif;\">Here is you account infornation to access the client web site portal:</span><br style=\"font-family: arial, sans, sans-serif;\"><br style=\"font-family: arial, sans, sans-serif;\"><a moz-do-not-send=\"true\" href=\"http://your_ip/mbilling\" style=\"font-family: arial, sans, sans-serif;\">http://your_ip/mbilling</a><br style=\"font-family: arial, sans, sans-serif;\"><span style=\"font-family: arial, sans, sans-serif;\">Username : $login$&nbsp;</span><br style=\"font-family: arial, sans, sans-serif;\"><span style=\"font-family: arial, sans, sans-serif;\">Password : $password$&nbsp;</span><br style=\"font-family: arial, sans, sans-serif;\"><br style=\"font-family: arial, sans, sans-serif;\"><span style=\"font-family: arial, sans, sans-serif;\">Greetings</span><br></p>\n','en',1),(46,1,'did_paid','noreply@site.com','VoIP','Your DID number charges - $did$','<p><span style=\"font-family: arial, sans, sans-serif;\">Hello $lastname$ $firstname$.</span><br style=\"font-family: arial, sans, sans-serif;\"><br style=\"font-family: arial, sans, sans-serif;\"><span style=\"font-family: arial, sans, sans-serif;\">The following charge $did_cost$ $base_currency$, was charged to your account for the monthly fees for your DID ($did$)</span><br style=\"font-family: arial, sans, sans-serif;\"><br style=\"font-family: arial, sans, sans-serif;\"><span style=\"font-family: arial, sans, sans-serif;\">DID monthly fees: $did_cost$ $base_currency$</span><br style=\"font-family: arial, sans, sans-serif;\"><br style=\"font-family: arial, sans, sans-serif;\"><span style=\"font-family: arial, sans, sans-serif;\">Your current credit balance for account $login$, is $credit$ $base_currency$</span><br style=\"font-family: arial, sans, sans-serif;\"><br style=\"font-family: arial, sans, sans-serif;\"><span style=\"font-family: arial, sans, sans-serif;\">Greetings</span><br></p>','en',1),(47,1,'did_unpaid','noreply@site.com','VoIP','Notification alert, DID due date $did$','<p><span style=\"font-family: arial, sans, sans-serif;\">Hello $firstname$ $lastname$, your account $login$ current credit is $balance_remaining$ $base_currency$</span><br style=\"font-family: arial, sans, sans-serif;\"><br style=\"font-family: arial, sans, sans-serif;\"><span style=\"font-family: arial, sans, sans-serif;\">Your credit is insufficient to pay for your DID number ($did$), as the monthly cost is $did_cost$ $base_currency$</span><br style=\"font-family: arial, sans, sans-serif;\"><br style=\"font-family: arial, sans, sans-serif;\"><span style=\"font-family: arial, sans, sans-serif;\">Please add credit to your account so that the DID this is not released from your account automatically on the due date.</span><br style=\"font-family: arial, sans, sans-serif;\"><br style=\"font-family: arial, sans, sans-serif;\"><span style=\"font-family: arial, sans, sans-serif;\">To add credits to your account, login to the client web site and click on Buy Credits.</span><br style=\"font-family: arial, sans, sans-serif;\"><br style=\"font-family: arial, sans, sans-serif;\"><span style=\"font-family: arial, sans, sans-serif;\">Greetings</span><br></p>','en',1),(48,1,'did_released','noreply@site.com','VoIP','Cancelled DID - ($did$)','<p><span style=\"font-family: arial, sans, sans-serif;\">Hello $firstname$ $lastname$</span><br style=\"font-family: arial, sans, sans-serif;\"><br style=\"font-family: arial, sans, sans-serif;\"><span style=\"font-family: arial, sans, sans-serif;\">This is a notification that the DID number $did$ has been deactivated from your account $login$.</span><br style=\"font-family: arial, sans, sans-serif;\"><br style=\"font-family: arial, sans, sans-serif;\"><span style=\"font-family: arial, sans, sans-serif;\">It will be released if its not paid immediately.</span><br style=\"font-family: arial, sans, sans-serif;\"><br style=\"font-family: arial, sans, sans-serif;\"><span style=\"font-family: arial, sans, sans-serif;\">Past notifications has been send to the contact Email address set in your account.</span><br style=\"font-family: arial, sans, sans-serif;\"><br style=\"font-family: arial, sans, sans-serif;\"><span style=\"font-family: arial, sans, sans-serif;\">Greetings</span><br></p>','en',1),(49,1,'did_confirmation','noreply@site.com','VoIP','DID number $did$ activated','<p style=\"color: rgb(0, 0, 0);\"><span style=\"font-family: arial, sans, sans-serif;\">Hello $firstname$ $lastname$,&nbsp;</span><br style=\"font-family: arial, sans, sans-serif;\"><br style=\"font-family: arial, sans, sans-serif;\"><span style=\"font-family: arial, sans, sans-serif;\">Congratulations!&nbsp;</span><br style=\"font-family: arial, sans, sans-serif;\"><br style=\"font-family: arial, sans, sans-serif;\"><span style=\"font-family: arial, sans, sans-serif;\">The DID number $did$ was successfully activated in your account $login$.</span><br style=\"font-family: arial, sans, sans-serif;\"><br style=\"font-family: arial, sans, sans-serif;\"><span style=\"font-family: arial, sans, sans-serif;\">You can forward your DID number to a PSTN or Mobile number.&nbsp; If you wish to do this, login to your account at:</span><br style=\"font-family: arial, sans, sans-serif;\"><br style=\"font-family: arial, sans, sans-serif;\"><a moz-do-not-send=\"true\" href=\"http://your_ip/mbilling\" style=\"font-family: arial, sans, sans-serif;\">http://your_ip/mbilling</a><br style=\"font-family: arial, sans, sans-serif;\"><span style=\"font-family: arial, sans, sans-serif;\">Username : $login$</span><br style=\"font-family: arial, sans, sans-serif;\"><span style=\"font-family: arial, sans, sans-serif;\">Password : $password$</span><br style=\"font-family: arial, sans, sans-serif;\"><br style=\"font-family: arial, sans, sans-serif;\"><br style=\"font-family: arial, sans, sans-serif;\"><span style=\"font-family: arial, sans, sans-serif;\">If you have a problem getting it to forward to the desired number, please contact us.</span><br></p><p style=\"color: rgb(0, 0, 0);\"><span style=\"font-family: arial, sans, sans-serif;\"><br></span></p><p style=\"color: rgb(0, 0, 0);\"><span style=\"font-family: arial, sans, sans-serif;\">Greetings</span><span style=\"font-family: arial, sans, sans-serif;\"><br></span></p>','en',1),(50,1,'refill','noreply@site.com','VoIP','Credit recharge confirmed','<p><span style=\"font-family: arial, sans, sans-serif;\">Hello $firstname$ $lastname$</span><br style=\"font-family: arial, sans, sans-serif;\"><br style=\"font-family: arial, sans, sans-serif;\"><span style=\"font-family: arial, sans, sans-serif;\">A credit recharge was applied to the account $login$.</span><br style=\"font-family: arial, sans, sans-serif;\"><br style=\"font-family: arial, sans, sans-serif;\"><span style=\"font-family: arial, sans, sans-serif;\">Recharge number = $itemID$</span><br style=\"font-family: arial, sans, sans-serif;\"><br style=\"font-family: arial, sans, sans-serif;\"><span style=\"font-family: arial, sans, sans-serif;\">Value = $itemAmount$ $base_currency$</span><br style=\"font-family: arial, sans, sans-serif;\"><br style=\"font-family: arial, sans, sans-serif;\"><span style=\"font-family: arial, sans, sans-serif;\">Description = $description$</span><br style=\"font-family: arial, sans, sans-serif;\"><br style=\"font-family: arial, sans, sans-serif;\"><span style=\"font-family: arial, sans, sans-serif;\">Your current account credit balance is $credit$ $base_currency$</span><br style=\"font-family: arial, sans, sans-serif;\"><br style=\"font-family: arial, sans, sans-serif;\"><br style=\"font-family: arial, sans, sans-serif;\"><span style=\"font-family: arial, sans, sans-serif;\">Greetings</span><br></p>\n','en',1),(51,1,'plan_unpaid','noreply@site.com','VoIP','Balance Due Alert for your Monthly plan','<p><span style=\"font-family: arial, sans, sans-serif;\">Dear $firstname$ $lastname$.&nbsp;</span><br style=\"font-family: arial, sans, sans-serif;\"><span style=\"font-family: arial, sans, sans-serif;\">We are sending you this message to notify that your call plan is approaching the due date and your account does not have enough credit balance to make the payment.</span><br style=\"font-family: arial, sans, sans-serif;\"><br style=\"font-family: arial, sans, sans-serif;\"><span style=\"font-family: arial, sans, sans-serif;\">Please, login in you account area, select: Menu, Buy Credits, and recharge your account with at least $plancost$ $base_currency$.</span><br style=\"font-family: arial, sans, sans-serif;\"><br style=\"font-family: arial, sans, sans-serif;\"><span style=\"font-family: arial, sans, sans-serif;\">You can login the client are with the following data:</span><br style=\"font-family: arial, sans, sans-serif;\"><br style=\"font-family: arial, sans, sans-serif;\"><a moz-do-not-send=\"true\" href=\"http://your_ip/mbilling\" style=\"font-family: arial, sans, sans-serif;\">http://your_ip/mbilling</a><br style=\"font-family: arial, sans, sans-serif;\"><span style=\"font-family: arial, sans, sans-serif;\">Username=$login$&nbsp;</span><br style=\"font-family: arial, sans, sans-serif;\"><span style=\"font-family: arial, sans, sans-serif;\">Password=$password$&nbsp;</span><br style=\"font-family: arial, sans, sans-serif;\"><br style=\"font-family: arial, sans, sans-serif;\"><span style=\"font-family: arial, sans, sans-serif;\">Please recharge your account or your call plan will be deactivated automatically on the due date.</span><br style=\"font-family: arial, sans, sans-serif;\"><br><br style=\"font-family: arial, sans, sans-serif;\"><span style=\"font-family: arial, sans, sans-serif;\">Greetings</span><br></p>','en',1),(52,1,'plan_paid','noreply@site.com','VoIP','Confirmation of call plan payment','<p><span style=\"font-family: arial, sans, sans-serif;\">Dear $firstname$ $lastname$.</span><br style=\"font-family: arial, sans, sans-serif;\"><br style=\"font-family: arial, sans, sans-serif;\"><span style=\"font-family: arial, sans, sans-serif;\">We have received your monthly call plan payment.</span><br style=\"font-family: arial, sans, sans-serif;\"><br style=\"font-family: arial, sans, sans-serif;\"><span style=\"font-family: arial, sans, sans-serif;\">Your current credit balance is $credit$ $base_currency$</span><br style=\"font-family: arial, sans, sans-serif;\"><br style=\"font-family: arial, sans, sans-serif;\"><span style=\"font-family: arial, sans, sans-serif;\">If you have any questions or need additional help please contact us.</span><br style=\"font-family: arial, sans, sans-serif;\"><br style=\"font-family: arial, sans, sans-serif;\"><span style=\"font-family: arial, sans, sans-serif;\">Greetings</span><br></p>','en',1),(53,1,'plan_released','noreply@site.com','VoIP','Your call plan has been suspended','<p><span style=\"font-family: arial, sans, sans-serif;\">Dear $firstname$ $lastname$.</span><br style=\"font-family: arial, sans, sans-serif;\"><br style=\"font-family: arial, sans, sans-serif;\"><span style=\"font-family: arial, sans, sans-serif;\">Your call plan is due today and we have not receive a payment confirmation.</span><br style=\"font-family: arial, sans, sans-serif;\"><br style=\"font-family: arial, sans, sans-serif;\"><span style=\"font-family: arial, sans, sans-serif;\">Your plan has been automatically suspended until we receive a payment confirmation.</span><br style=\"font-family: arial, sans, sans-serif;\"><br style=\"font-family: arial, sans, sans-serif;\"><span style=\"font-family: arial, sans, sans-serif;\">To reactivate your call plan, please login in your account web site, select: Menu, Buy Credits and recharge your account with a minimum credit of $plancost$ $base_currency$.</span><br style=\"font-family: arial, sans, sans-serif;\"><br style=\"font-family: arial, sans, sans-serif;\"><span style=\"font-family: arial, sans, sans-serif;\">Greetings</span><br></p>','en',1),(54,1,'services_unpaid','usuario','VoIP','Aviso de Vencimento de serviço','<p>Olá $firstname$ $lastname$, </p>\r\n<p>Você tem serviços com vencimento em aberto e não possiu saldo para o pagamento. Por favor entre no link $service_pending_url$ para iniciar o pagamento. </p>\r\n<br> \r\n<p>Atenciosamente,<br>\r\n ','br',1),(55,1,'services_unpaid','usuario','VoIP','Aviso de Vencimiento de servicio','<p>Hola $firstname$ $lastname$, </p>\r\n<p>Usted tien servicios por vencer o vencido. Por favor entre en este link $service_pending_url$ para iniciar el pago.</p> \r\n<p>Saludos,<br>\r\n ','es',1),(56,1,'services_unpaid','username','VoIP','Balance Due Alert for your','<p>Hello $firstname$ $lastname$, </p>\r\n<p>You have services pendent. Please use this link $service_pending_url$ to start the payment</p>\r\n\r\n<br> \r\n<p>Best Regards<br>\r\n ','en',1),(57,1,'services_activation','usuario','VoIP','Ativação de serviço','<p>Olá $firstname$ $lastname$, </p>\r\n<p>Foi ativado o serviço $service_name$ com valor de $service_price$. </p>\r\n<br>\r\n\r\n<p>Este valor sera descontado do credito de sua conta automaticamente todos os meses.</p>\r\n\r\n<br> \r\n<p>Atenciosamente,<br>\r\n ','br',1),(58,1,'services_activation','usuario','VoIP','Activacion de servicio','<p>Hola $firstname$ $lastname$, </p>\r\n<p>Fue activado el servicio $service_name$ con importe $service_price$.</p>\r\n<br>\r\n\r\n<p>Este importe sera descontado del credito de su cuenta automaticamente todos los meses..</p>\r\n\r\n<br> \r\n<p>Saludos,<br>\r\n ','es',1),(59,1,'services_activation','username','VoIP','Service activation','<p>Hello $firstname$ $lastname$, </p>\r\n<p>The service $service_name$ was activated. Service price: $service_price$ .</p>\r\n<br>\r\n\r\n<p>This amount will be charged of your account every month.</p>\r\n\r\n<br> \r\n<p>Best Regards<br>\r\n ','en',1),(60,1,'services_pending','usuario','VoIP','Serviço pendente de pagamento','<p>Olá $firstname$ $lastname$, </p>\r\n<p>Foi solicitado o serviço $service_name$ com valor de $service_price$. </p>\r\n\r\n        <p>A ativaçao do serviço esta pendente de pagamento.</p>\r\n\r\n        <p>Link para pagamento $service_pending_url$.</p>\r\n\r\n       <br>\r\n\r\n<p></p>\r\n\r\n<br> \r\n<p>Atenciosamente,<br>\r\n ','br',1),(61,1,'services_pending','usuario','VoIP','Servicio pendente de pagao','<p>Hola $firstname$ $lastname$, </p>\r\n<p>Fue solicitado la activacion del servicio $service_name$ con importe $service_price$.</p>\r\n<p>La activacion del servicio esta pendiente de pago.</p>\r\n\r\n        <p>Link para el pago: $service_pending_url$.</p>\r\n<br>\r\n\r\n<p>.</p>\r\n\r\n<br> \r\n<p>Saludos,<br>\r\n ','es',1),(62,1,'services_pending','username','VoIP','Service pending','<p>Hello $firstname$ $lastname$, </p>\r\n<p>The service $service_name$ was pending. Service price: $service_price$ .</p>\r\n\r\n       <p>Please make the payment to active the service.</p>\r\n\r\n       <p>Payment Link:  $service_pending_url$.</p>\r\n\r\n        <br>\r\n\r\n<br> \r\n<p>Best Regards<br>\r\n ','en',1),(63,1,'services_released','usuario','VoIP','Cancelamento de serviço','<p>Olá $firstname$ $lastname$, </p>\r\n<p>Foi desativado o serviço $service_name$ com valor de $service_price$. </p>\r\n<br>\r\n\r\n<p></p>\r\n\r\n<br> \r\n<p>Atenciosamente,<br>\r\n ','br',1),(64,1,'services_released','usuario','VoIP','Baja de servicio','<p>Hola $firstname$ $lastname$, </p>\r\n<p>Fue dado de baja el servicio $service_name$ con importe $service_price$.</p>\r\n<br>\r\n\r\n<p>.</p>\r\n\r\n<br> \r\n<p>Saludos,<br>\r\n ','es',1),(65,1,'services_released','username','VoIP','Service canceled','<p>Hello $firstname$ $lastname$, </p>\r\n<p>The service $service_name$ was canceled. Service price: $service_price$ .</p>\r\n<br>\r\n\r\n<br> \r\n<p>Best Regards<br>\r\n ','en',1),(66,1,'services_paid','usuario','VoIP','Serviço Pago','<p>Olá $firstname$ $lastname$, </p>\r\n<p>Foi pago o serviço $service_name$ com valor de $service_price$. </p>\r\n<br>\r\n\r\n<p></p>\r\n\r\n<br> \r\n<p>Atenciosamente,<br>\r\n ','br',1),(67,1,'services_paid','usuario','VoIP','Servicio pago','<p>Hola $firstname$ $lastname$, </p>\r\n<p>Fue pago el servicio $service_name$ con importe $service_price$.</p>\r\n<br>\r\n\r\n<p>.</p>\r\n\r\n<br> \r\n<p>Saludos,<br>\r\n ','es',1),(68,1,'services_paid','username','VoIP','Service paid','<p>Hello $firstname$ $lastname$, </p>\r\n<p>The service $service_name$ was paid. Service price: $service_price$ .</p>\r\n<br>\r\n\r\n<br> \r\n<p>Best Regards<br>\r\n ','en',1),(69,1,'user_disk_space','usuario','VoIP','Armazenamento em disco superado','<p>Olá $firstname$ $lastname$, </p>\r\n<p>Sua conta VoIP número $cardnumber$ superou o limite de $disk_usage_limit$ GB.</p>\r\n<br>\r\n\r\n<p>Para manter o serviço foi deletado automaticamente os audios anteriores a $time_deleted$.</p>\r\n\r\n<br> \r\n<p>Atenciosamente,<br>\r\n ','br',1),(70,1,'user_disk_space','usuario','VoIP','Armazenamento en disco superado','<p>Hola $firstname$ $lastname$, </p>\r\n<p>Su cuenta VoIP número $cardnumber$ supero el limite de $disk_usage_limit$ GB.</p>\r\n<br>\r\n\r\n<p>Para mantener el servicio fue borrado automaticamente los audios anteriores a $time_deleted$.</p>\r\n\r\n<br> \r\n<p>Saludos,<br>\r\n ','es',1),(71,1,'user_disk_space','username','VoIP','Disk space surpassed','<p>Hello $firstname$ $lastname$, </p>\r\n<p>Your account $cardnumber$ surpassed the disk space limit of $disk_usage_limit$ GB.</p>\r\n<br>\r\n\r\n<p>To keep the service was deleted the records before than $time_deleted$.</p>\r\n\r\n<br> \r\n<p>Best Regards<br>\r\n ','en',1),(72,1,'forgetpassword','usuário','VoIP','Recuperação de senha','<p>Olá $firstname$ $lastname$, </p>\r\n<p>Você solicitou sua senha por email. </p>\r\nSua senha é: $password$<br>\r\n \r\n<p>Atenciosamente,<br>\r\n ','br',1),(73,1,'forgetpassword','usuario','VoIP','Recuperacion de contraseña','<p>Hola $firstname$ $lastname$, </p>\r\n<p>Usted solicito su contraseña por email. </p>\r\nSu contraseña es: $password$<br>\r\n \r\n<p>Saludos,<br>\r\n ','es',1),(74,1,'forgetpassword','username','VoIP','Password recovery','<p>Hello $firstname$ $lastname$, </p>\r\n<p>You request your password. </p>\r\nYour password is: $password$<br>\r\n \r\n<p>Best Regards,<br>\r\n ','en',1),(75,1,'credit','noreply@site.com','VoIP','Crédito atual da sua cuenta VoIP ( $credit$ $currency$)','<p>Olá $firstname$ $lastname$, </p> <br> <p>Seu saldo atual é de R$ $credit$.</p> <br> <p>Observação: Você pode desativar o recebimento deste email no seu painel de cliente.</p> <br> <p>Atenciosamente,<br>','br',1),(76,1,'credit','noreply@site.com','VoIP','Credito actual de su cuenta VoIP ( $credit$ $currency$)','<p>Hola $firstname$ $lastname$, </p> <br> <p>Su credito actual es de $credit$.</p> <br> <p>OBS: Puedes desactivar el envio de este email en su panel de cliente.</p> <br> <p>Saludos,<br>','es',1),(77,1,'credit','noreply@site.com','VoIP','You actual credit is ( $credit$ $currency$)','<p>Hello $firstname$ $lastname$, </p> <br> <p>Your credit is $credit$.</p> <br> <p>OBS: You can disable this email on your VoIP panel.</p> <br> <p>Atenciosamente,<br>','en',1);
/*!40000 ALTER TABLE `pkg_templatemail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pkg_trunk`
--

DROP TABLE IF EXISTS `pkg_trunk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pkg_trunk` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_provider` int NOT NULL,
  `failover_trunk` int DEFAULT NULL,
  `trunkcode` varchar(50) DEFAULT NULL,
  `host` varchar(100) NOT NULL,
  `fromdomain` varchar(100) NOT NULL,
  `trunkprefix` char(20) DEFAULT NULL,
  `providertech` char(20) NOT NULL,
  `providerip` char(80) NOT NULL,
  `removeprefix` char(20) DEFAULT NULL,
  `secondusedreal` int DEFAULT '0',
  `call_answered` int DEFAULT '0',
  `call_total` int DEFAULT '0',
  `creationdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `addparameter` char(120) DEFAULT NULL,
  `inuse` int DEFAULT '0',
  `maxuse` int DEFAULT '-1',
  `status` int DEFAULT '1',
  `if_max_use` int DEFAULT '0',
  `user` varchar(80) NOT NULL,
  `secret` varchar(50) NOT NULL,
  `allow` varchar(50) NOT NULL,
  `link_sms` varchar(250) NOT NULL,
  `directmedia` char(10) NOT NULL DEFAULT 'no',
  `context` char(20) NOT NULL DEFAULT 'billing',
  `dtmfmode` char(7) NOT NULL DEFAULT 'RFC2833',
  `insecure` varchar(20) NOT NULL DEFAULT 'port,invite',
  `nat` char(20) NOT NULL DEFAULT 'yes',
  `qualify` char(7) NOT NULL DEFAULT 'yes',
  `type` char(6) NOT NULL DEFAULT 'peer',
  `disallow` varchar(20) NOT NULL DEFAULT 'all',
  `sms_res` varchar(50) NOT NULL,
  `register` int NOT NULL DEFAULT '0',
  `language` varchar(10) NOT NULL,
  `allow_error` int NOT NULL DEFAULT '0' COMMENT 'Allow send for backup trunk incluse busy',
  `short_time_call` int NOT NULL DEFAULT '0',
  `fromuser` varchar(80) NOT NULL DEFAULT '',
  `register_string` varchar(300) NOT NULL DEFAULT '',
  `transport` varchar(3) NOT NULL DEFAULT 'no',
  `encryption` varchar(3) NOT NULL DEFAULT 'no',
  `port` varchar(5) NOT NULL DEFAULT '5060',
  `sendrpid` varchar(10) NOT NULL DEFAULT 'no',
  `sip_config` text,
  `cnl` int NOT NULL DEFAULT '0',
  `cid_add` varchar(11) NOT NULL DEFAULT '',
  `cid_remove` varchar(11) NOT NULL DEFAULT '',
  `block_cid` varchar(120) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `fk_pkg_provider_pkg_trunk` (`id_provider`),
  KEY `fk_pkg_trunk_pkg_trunk` (`failover_trunk`),
  CONSTRAINT `fk_pkg_provider_pkg_trunk` FOREIGN KEY (`id_provider`) REFERENCES `pkg_provider` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pkg_trunk`
--

LOCK TABLES `pkg_trunk` WRITE;
/*!40000 ALTER TABLE `pkg_trunk` DISABLE KEYS */;
INSERT INTO `pkg_trunk` VALUES (3,1,0,'teste2','rferferf','','3333','sip','teste2','',0,0,0,'2025-01-06 18:27:03','',NULL,-1,1,NULL,'','','g729,gsm,opus,alaw,ulaw','','no','billing','RFC2833','port,invite','force_rport,comedia','yes','peer','all','',0,'',0,0,'','','','','5060','no','',0,'','',''),(6,3,0,'teste','error','','3333','sip','teste','',0,0,0,'2025-01-06 18:34:04','',NULL,-1,1,NULL,'','','g729,gsm,opus,alaw,ulaw','','no','billing','RFC2833','port,invite','force_rport,comedia','yes','peer','all','',0,'',0,0,'','','','','5060','no','',0,'','','');
/*!40000 ALTER TABLE `pkg_trunk` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pkg_trunk_error`
--

DROP TABLE IF EXISTS `pkg_trunk_error`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pkg_trunk_error` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ip` varchar(100) NOT NULL,
  `code` int DEFAULT NULL,
  `total` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_index` (`ip`,`code`)
) ENGINE=InnoDB AUTO_INCREMENT=57319705 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pkg_trunk_error`
--

LOCK TABLES `pkg_trunk_error` WRITE;
/*!40000 ALTER TABLE `pkg_trunk_error` DISABLE KEYS */;
INSERT INTO `pkg_trunk_error` VALUES (56410871,'18.117.209.162',403,302502),(56410872,'18.117.209.162',404,1311482),(56410873,'18.117.209.162',480,383947),(56410874,'18.117.209.162',487,2964822),(56410875,'18.117.209.162',503,1372611),(56410876,'18.117.209.162',617,5898263),(56410877,'187.60.52.150',503,96015),(56410878,'200.71.79.60',487,150055),(56410879,'38.69.134.11',404,520090),(56410880,'38.69.134.11',487,632448),(56410884,'18.117.209.162',486,44478),(56410887,'18.117.209.162',611,285725),(56410888,'18.117.209.162',612,13523),(56410890,'200.201.218.140',503,233956),(56410893,'38.69.134.11',480,212128),(56410894,'38.69.134.11',481,1740),(56410896,'38.69.134.11',503,147496),(56410902,'18.117.209.162',604,6393),(56410907,'38.69.134.11',486,32323),(56410909,'38.69.134.11',500,14157),(56410920,'200.201.218.140',420,8304),(56410935,'38.69.134.11',403,4185),(56410953,'187.60.52.150',403,28579),(56410960,'187.60.52.150',404,47748),(56411000,'187.60.52.150',486,7935),(56411004,'38.69.134.11',484,3966),(56411107,'200.71.79.60',403,12640),(56411142,'38.69.134.11',604,525),(56411159,'200.71.79.60',480,10812),(56411220,'187.60.52.150',487,78963),(56411303,'18.117.209.162',614,75862),(56411361,'200.71.79.60',603,105),(56411429,'187.60.52.150',484,1767),(56411615,'200.71.79.60',404,27009),(56411674,'200.71.79.60',486,8568),(56411807,'187.60.52.150',500,2110),(56411834,'200.71.79.60',408,7922),(56411942,'177.70.30.4',484,63),(56411943,'177.70.30.4',487,28961),(56411946,'18.117.209.162',410,375),(56411947,'18.117.209.162',415,351),(56411948,'18.117.209.162',420,8993),(56411950,'18.117.209.162',484,22990),(56411953,'18.117.209.162',500,46045),(56411954,'18.117.209.162',501,16009),(56411956,'18.117.209.162',504,49486),(56411957,'18.117.209.162',603,57166),(56411961,'18.117.209.162',613,39244),(56411963,'18.117.209.162',615,27806),(56411965,'18.117.209.162',618,89832),(56411966,'18.117.209.162',619,449),(56411969,'187.60.52.150',480,39344),(56411975,'200.201.218.140',404,171),(56411987,'38.69.134.11',408,1785),(56411988,'38.69.134.11',410,304),(56411989,'38.69.134.11',420,138),(56411996,'38.69.134.11',502,629),(56411999,'sip.inforsolutions.com.br',403,10933),(56412773,'187.60.52.150',481,882),(56414465,'18.117.209.162',400,60),(56415142,'200.71.79.60',420,1972),(56420740,'200.71.79.60',503,9641),(56421046,'38.69.134.11',603,18351),(56427122,'38.69.134.11',504,14),(56427824,'187.60.52.150',482,245),(56430293,'38.69.134.11',501,1337),(56438042,'177.70.30.4',503,7028),(56438984,'18.117.209.162',482,350),(56440674,'200.71.79.60',484,246),(56441046,'18.117.209.162',408,1584),(56442196,'177.70.30.4',404,3687),(56445727,'18.117.209.162',606,170),(56450724,'38.69.134.11',482,123),(56453083,'200.71.79.60',500,1648),(56456795,'179.127.19.135',487,10603),(56470460,'187.60.52.150',504,1773),(56476646,'200.201.218.140',403,10),(56484607,'18.117.209.162',488,2066),(56496495,'18.117.209.162',405,38),(56503867,'200.71.79.60',481,25),(56520469,'177.52.175.204',503,725),(56520802,'201.20.148.28',402,10391),(56522257,'200.71.79.60',488,16),(56523594,'177.70.30.4',403,3931),(56523627,'179.127.19.135',500,528),(56528950,'177.70.30.4',480,5549),(56531606,'18.117.209.162',406,36),(56532583,'201.20.148.28',420,156),(56541141,'18.117.209.162',481,289),(56559820,'38.69.134.11',488,1225),(56570637,'38.69.134.11',405,40),(56577250,'179.127.19.135',404,411),(56577268,'179.127.19.135',480,456),(56591630,'200.71.79.60',504,44),(56599830,'201.20.148.28',404,66),(56653020,'38.69.134.11',415,86),(56653292,'179.127.19.135',403,365),(56657854,'177.70.30.4',486,1441),(56664564,'177.70.30.4',504,38),(56664670,'179.127.19.135',503,1313),(56664671,'179.127.19.135',504,12),(56671436,'177.70.30.4',500,119),(56677322,'179.127.19.135',486,60),(56681573,'200.71.79.60',482,18),(56696618,'187.60.52.150',410,150),(56700463,'187.60.52.150',408,56),(56706440,'187.60.52.150',603,329),(56708889,'187.60.60.161',403,48),(56737441,'38.69.134.11',606,52),(56738173,'201.20.148.28',403,4),(56739136,'187.60.52.150',502,636),(56743114,'177.70.30.4',603,32),(56745424,'179.127.19.135',603,69),(56747268,'187.60.52.150',606,4),(56749354,'38.69.134.11',400,14),(56755031,'8.242.33.175',604,184),(56755108,'8.242.33.175',408,98),(56755109,'8.242.33.175',503,1003),(56755141,'8.242.33.175',603,1126),(56755156,'8.242.33.175',404,4379),(56755215,'8.242.33.175',480,1594),(56755327,'8.242.33.175',487,4969),(56755660,'8.242.33.175',484,55),(56755926,'8.242.33.175',486,586),(56756604,'8.242.33.175',403,245),(56756957,'8.242.33.175',500,317),(56758011,'8.242.33.175',400,10),(56759308,'8.242.33.175',481,39),(56760320,'8.242.33.175',410,15),(56769808,'8.242.33.175',502,100),(56783509,'8.242.33.175',501,136),(56810536,'18.117.209.162',616,6),(56867485,'201.20.148.28',408,6),(56867494,'201.20.148.28',480,59),(56889214,'201.20.148.28',487,4),(56892225,'177.52.175.204',487,1254),(56892242,'177.52.175.204',480,15),(56892622,'177.52.175.204',404,118),(56896171,'200.71.79.60',410,58),(57010228,'187.60.52.150',604,4),(57027455,'177.70.30.4',488,6),(57030945,'177.70.30.4',502,27),(57038734,'177.70.30.4',410,2),(57053002,'200.71.79.60',400,2),(57057770,'200.71.79.60',502,460),(57101298,'177.70.30.4',408,2),(57119574,'179.127.19.135',408,24),(57122086,'177.53.148.164',403,13),(57122095,'18.117.209.162',407,97134),(57122685,'200.71.79.60',483,11),(57123086,'177.53.148.164',487,1172),(57137527,'38.69.134.11',483,4),(57154475,'177.53.148.164',503,331),(57162237,'200.71.79.60',415,3),(57163409,'177.53.148.164',404,146),(57163579,'177.53.148.164',480,256),(57165564,'177.53.148.164',603,58),(57165746,'177.53.148.164',500,38),(57173517,'177.53.148.164',486,14),(57182685,'177.53.148.164',501,2),(57215516,'177.53.148.164',408,2),(57222448,'177.53.148.164',484,9),(57277685,'179.127.19.135',484,116),(57280084,'177.53.148.164',420,2),(57288656,'179.127.19.135',410,2),(57294478,'200.71.79.60',405,10),(57297614,'18.117.209.162',483,4),(57305431,'200.159.177.162',503,1972),(57305764,'18.117.209.162',502,2),(57306073,'200.159.177.162',403,56),(57307578,'179.127.19.135',405,16),(57307982,'200.159.177.162',487,15),(57308232,'200.201.218.140',405,10),(57308239,'200.201.218.140',487,13);
/*!40000 ALTER TABLE `pkg_trunk_error` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pkg_trunk_group`
--

DROP TABLE IF EXISTS `pkg_trunk_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pkg_trunk_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `type` int NOT NULL DEFAULT '1',
  `description` text,
  `weight` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pkg_trunk_group`
--

LOCK TABLES `pkg_trunk_group` WRITE;
/*!40000 ALTER TABLE `pkg_trunk_group` DISABLE KEYS */;
INSERT INTO `pkg_trunk_group` VALUES (1,'teste',1,'',''),(3,'teste2',1,'','');
/*!40000 ALTER TABLE `pkg_trunk_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pkg_trunk_group_trunk`
--

DROP TABLE IF EXISTS `pkg_trunk_group_trunk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pkg_trunk_group_trunk` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_trunk_group` int NOT NULL,
  `id_trunk` int NOT NULL,
  `weight` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_trunk_group` (`id_trunk_group`),
  KEY `id_trunk` (`id_trunk`),
  CONSTRAINT `fk_pkg_trunk_group_trunk_pkg_trunk` FOREIGN KEY (`id_trunk`) REFERENCES `pkg_trunk` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_pkg_trunk_group_trunk_pkg_trunk_group` FOREIGN KEY (`id_trunk_group`) REFERENCES `pkg_trunk_group` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pkg_trunk_group_trunk`
--

LOCK TABLES `pkg_trunk_group_trunk` WRITE;
/*!40000 ALTER TABLE `pkg_trunk_group_trunk` DISABLE KEYS */;
INSERT INTO `pkg_trunk_group_trunk` VALUES (1,1,3,1),(19,3,6,1),(20,3,3,1);
/*!40000 ALTER TABLE `pkg_trunk_group_trunk` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pkg_user`
--

DROP TABLE IF EXISTS `pkg_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pkg_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_user` int DEFAULT NULL,
  `id_group` int NOT NULL,
  `id_group_agent` int DEFAULT NULL,
  `id_plan` int DEFAULT NULL,
  `id_offer` int DEFAULT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(100) NOT NULL,
  `credit` decimal(15,4) DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL,
  `creationdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `firstusedate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `expirationdate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `enableexpire` tinyint(1) DEFAULT '0',
  `expiredays` int DEFAULT '0',
  `lastname` varchar(50) NOT NULL DEFAULT '',
  `firstname` varchar(50) NOT NULL DEFAULT '',
  `address` varchar(100) DEFAULT NULL,
  `city` varchar(50) NOT NULL DEFAULT '',
  `neighborhood` varchar(50) DEFAULT NULL,
  `state` varchar(50) NOT NULL DEFAULT '',
  `country` varchar(50) NOT NULL DEFAULT '',
  `zipcode` varchar(20) DEFAULT '',
  `phone` varchar(50) NOT NULL DEFAULT '',
  `mobile` varchar(20) DEFAULT '',
  `email` varchar(100) NOT NULL DEFAULT '',
  `email2` varchar(100) NOT NULL DEFAULT '',
  `vat` varchar(50) DEFAULT NULL,
  `company_name` varchar(100) DEFAULT NULL,
  `commercial_name` varchar(100) DEFAULT NULL,
  `company_website` varchar(60) DEFAULT NULL,
  `state_number` varchar(40) DEFAULT NULL,
  `dist` varchar(100) DEFAULT NULL,
  `contract_value` float DEFAULT '0',
  `lastuse` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `typepaid` tinyint(1) DEFAULT '0',
  `creditlimit` int NOT NULL DEFAULT '0',
  `language` char(5) DEFAULT 'en',
  `redial` varchar(50) DEFAULT NULL,
  `loginkey` varchar(40) DEFAULT NULL,
  `last_notification` timestamp NULL DEFAULT NULL,
  `credit_notification` int NOT NULL DEFAULT '10',
  `credit_notification_daily` int NOT NULL DEFAULT '0',
  `restriction` tinyint NOT NULL DEFAULT '0',
  `callingcard_pin` int NOT NULL,
  `prefix_local` varchar(500) NOT NULL DEFAULT '',
  `callshop` varchar(20) DEFAULT '',
  `plan_day` tinyint(1) DEFAULT NULL,
  `record_call` tinyint(1) NOT NULL DEFAULT '0',
  `active_paypal` tinyint(1) NOT NULL DEFAULT '0',
  `boleto` tinyint(1) NOT NULL DEFAULT '0',
  `boleto_day` smallint DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `last_login` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `googleAuthenticator_enable` tinyint(1) NOT NULL DEFAULT '0',
  `google_authenticator_key` varchar(50) NOT NULL DEFAULT '',
  `doc` varchar(50) DEFAULT NULL,
  `id_sacado_sac` int DEFAULT NULL,
  `disk_space` int NOT NULL DEFAULT '-1',
  `sipaccountlimit` int NOT NULL DEFAULT '-1',
  `calllimit` int DEFAULT '-1',
  `cpslimit` int NOT NULL DEFAULT '-1',
  `calllimit_error` varchar(3) NOT NULL DEFAULT '503',
  `mix_monitor_format` varchar(5) DEFAULT 'gsm',
  `transfer_show_selling_price` tinyint(1) DEFAULT '0',
  `transfer_bdservice_rate` int DEFAULT '0',
  `transfer_dbbl_rocket_profit` int DEFAULT '0',
  `transfer_bkash_profit` int DEFAULT '0',
  `transfer_flexiload_profit` int DEFAULT '0',
  `transfer_international_profit` int DEFAULT '0',
  `transfer_dbbl_rocket` tinyint(1) NOT NULL DEFAULT '0',
  `transfer_bkash` tinyint(1) DEFAULT '0',
  `transfer_flexiload` tinyint(1) DEFAULT '0',
  `transfer_international` tinyint(1) DEFAULT '0',
  `restriction_use` int NOT NULL DEFAULT '1',
  `email_services` int NOT NULL DEFAULT '1',
  `email_did` int NOT NULL DEFAULT '1',
  `inbound_call_limit` int NOT NULL DEFAULT '-1',
  `access_token` varchar(500) DEFAULT NULL,
  `auth_key` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `callingcard_pin` (`callingcard_pin`),
  KEY `fk_pkg_group_user_pkg_user` (`id_group`),
  KEY `fk_pkg_plan_pkg_user` (`id_plan`),
  KEY `username` (`username`),
  KEY `fk_pkg_user_pkg_user` (`id_user`),
  KEY `fk_pkg_group_user_pkg_user_agent` (`id_group_agent`),
  CONSTRAINT `fk_pkg_group_user_pkg_user` FOREIGN KEY (`id_group`) REFERENCES `pkg_group_user` (`id`),
  CONSTRAINT `fk_pkg_group_user_pkg_user_agent` FOREIGN KEY (`id_group_agent`) REFERENCES `pkg_group_user` (`id`),
  CONSTRAINT `fk_pkg_plan_pkg_user` FOREIGN KEY (`id_plan`) REFERENCES `pkg_plan` (`id`),
  CONSTRAINT `fk_pkg_user_pkg_user` FOREIGN KEY (`id_user`) REFERENCES `pkg_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pkg_user`
--

LOCK TABLES `pkg_user` WRITE;
/*!40000 ALTER TABLE `pkg_user` DISABLE KEYS */;
INSERT INTO `pkg_user` VALUES (1,1,1,NULL,NULL,NULL,'root','29f8527f062f960808a4c6caf095ad58fcb86670',0.0000,1,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',0,0,'','','','',NULL,'','','','','','','','0','',NULL,'',NULL,NULL,0,'0000-00-00 00:00:00',0,0,'en','','',NULL,10,0,0,534565,'21','0',1,0,0,0,0,'teste','0000-00-00 00:00:00',0,'',NULL,NULL,-1,-1,-1,-1,'503','gsm',0,0,0,0,0,0,0,0,0,0,1,1,1,-1,NULL,''),(2,1,3,NULL,1,NULL,'teste','magnus',-9.6818,1,'2025-01-04 00:54:31','0000-00-00 00:00:00','0000-00-00 00:00:00',0,0,'','','','','','','1','','','51982464731','info@portabilidadecelular.com','','','','','',NULL,'',0,'0000-00-00 00:00:00',0,0,'en','','',NULL,-1,0,0,432826,'','0',0,0,0,0,0,'teste','0000-00-00 00:00:00',0,'','82627797034',NULL,-1,-1,-1,-1,'503','gsm',NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,1,1,1,0,NULL,NULL),(3,1,3,NULL,2,1,'test','magnus',0.5987,1,'2025-01-04 00:55:15','0000-00-00 00:00:00','0000-00-00 00:00:00',0,0,'','','','','','','1','','','','','','','','','',NULL,'',0,'0000-00-00 00:00:00',0,0,'en','','',NULL,-1,0,0,775155,'','0',0,0,0,0,0,'teste','0000-00-00 00:00:00',0,'','',NULL,-1,-1,-1,-1,'503','gsm',NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,1,1,1,0,NULL,NULL),(4,1,3,NULL,2,NULL,'teste24','scsdcsd',53.0474,NULL,'2025-01-09 15:13:41','0000-00-00 00:00:00','0000-00-00 00:00:00',0,0,'','',NULL,'','','','','','','','','',NULL,NULL,NULL,NULL,NULL,NULL,0,'0000-00-00 00:00:00',0,0,'en',NULL,NULL,NULL,10,0,0,543345,'','',NULL,0,0,0,NULL,'teste','0000-00-00 00:00:00',0,'',NULL,NULL,-1,-1,-1,-1,'503','gsm',0,0,0,0,0,0,0,0,0,0,1,1,1,-1,NULL,NULL),(34,1,3,NULL,2,NULL,'11642','upsYBq5f',50.0000,1,'2025-01-14 22:37:19','0000-00-00 00:00:00','0000-00-00 00:00:00',0,0,'','',NULL,'',NULL,'','','','','','','',NULL,NULL,NULL,NULL,NULL,NULL,0,'0000-00-00 00:00:00',0,0,'br',NULL,NULL,NULL,10,0,0,421459,'','',NULL,0,0,0,NULL,NULL,'0000-00-00 00:00:00',0,'',NULL,NULL,-1,-1,-1,-1,'503','gsm',0,0,0,0,0,0,0,0,0,0,1,1,1,-1,NULL,NULL);
/*!40000 ALTER TABLE `pkg_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pkg_user_history`
--

DROP TABLE IF EXISTS `pkg_user_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pkg_user_history` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_user` int NOT NULL,
  `description` mediumtext,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_pkg_user_pkg_user_history` (`id_user`),
  CONSTRAINT `fk_pkg_user_pkg_user_history` FOREIGN KEY (`id_user`) REFERENCES `pkg_user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pkg_user_history`
--

LOCK TABLES `pkg_user_history` WRITE;
/*!40000 ALTER TABLE `pkg_user_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `pkg_user_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pkg_user_rate`
--

DROP TABLE IF EXISTS `pkg_user_rate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pkg_user_rate` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_user` int NOT NULL,
  `id_prefix` int NOT NULL,
  `rateinitial` decimal(15,5) NOT NULL DEFAULT '0.00000',
  `initblock` int NOT NULL DEFAULT '0',
  `billingblock` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_pkg_user_pkg_user_rate` (`id_user`),
  KEY `fk_pkg_prefix_pkg_user_rate` (`id_prefix`),
  CONSTRAINT `fk_pkg_prefix_pkg_user_rate` FOREIGN KEY (`id_prefix`) REFERENCES `pkg_prefix` (`id`),
  CONSTRAINT `fk_pkg_user_pkg_user_rate` FOREIGN KEY (`id_user`) REFERENCES `pkg_user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pkg_user_rate`
--

LOCK TABLES `pkg_user_rate` WRITE;
/*!40000 ALTER TABLE `pkg_user_rate` DISABLE KEYS */;
INSERT INTO `pkg_user_rate` VALUES (1,3,1,0.00540,4,4);
/*!40000 ALTER TABLE `pkg_user_rate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pkg_user_type`
--

DROP TABLE IF EXISTS `pkg_user_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pkg_user_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(18) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pkg_user_type`
--

LOCK TABLES `pkg_user_type` WRITE;
/*!40000 ALTER TABLE `pkg_user_type` DISABLE KEYS */;
INSERT INTO `pkg_user_type` VALUES (1,'t(\'admin\')'),(2,'t(\'agent\')'),(3,'t(\'client\')');
/*!40000 ALTER TABLE `pkg_user_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `pkg_voicemail_users`
--

DROP TABLE IF EXISTS `pkg_voicemail_users`;
/*!50001 DROP VIEW IF EXISTS `pkg_voicemail_users`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `pkg_voicemail_users` AS SELECT 
 1 AS `id`,
 1 AS `customer_id`,
 1 AS `context`,
 1 AS `mailbox`,
 1 AS `password`,
 1 AS `fullname`,
 1 AS `email`,
 1 AS `pager`,
 1 AS `stamp`,
 1 AS `uniqueid`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `pkg_voucher`
--

DROP TABLE IF EXISTS `pkg_voucher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pkg_voucher` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_user` int DEFAULT NULL,
  `id_plan` int DEFAULT NULL,
  `creationdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `usedate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `expirationdate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `voucher` int NOT NULL,
  `tag` char(50) DEFAULT NULL,
  `credit` float NOT NULL DEFAULT '0',
  `used` int DEFAULT '0',
  `prefix_local` varchar(50) DEFAULT NULL,
  `language` char(5) NOT NULL DEFAULT 'en',
  PRIMARY KEY (`id`),
  UNIQUE KEY `cons_pkg_voucher_voucher` (`voucher`),
  KEY `fk_pkg_user_pkg_voucher` (`id_user`),
  CONSTRAINT `fk_pkg_user_pkg_voucher` FOREIGN KEY (`id_user`) REFERENCES `pkg_user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pkg_voucher`
--

LOCK TABLES `pkg_voucher` WRITE;
/*!40000 ALTER TABLE `pkg_voucher` DISABLE KEYS */;
/*!40000 ALTER TABLE `pkg_voucher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `pkg_voicemail_users`
--

/*!50001 DROP VIEW IF EXISTS `pkg_voicemail_users`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb3 */;
/*!50001 SET character_set_results     = utf8mb3 */;
/*!50001 SET collation_connection      = utf8mb3_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `pkg_voicemail_users` AS select `pkg_sip`.`id` AS `id`,`pkg_sip`.`id_user` AS `customer_id`,'billing' AS `context`,`pkg_sip`.`name` AS `mailbox`,`pkg_sip`.`voicemail_password` AS `password`,`pkg_user`.`firstname` AS `fullname`,`pkg_sip`.`voicemail_email` AS `email`,`pkg_sip`.`md5secret` AS `pager`,`pkg_user`.`creationdate` AS `stamp`,'' AS `uniqueid` from (`pkg_sip` join `pkg_user` on((`pkg_sip`.`id_user` = `pkg_user`.`id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-01-31 11:44:34
