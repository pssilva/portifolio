CREATE DATABASE  IF NOT EXISTS `multiweb` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `multiweb`;
-- MySQL dump 10.13  Distrib 5.5.37, for debian-linux-gnu (i686)
--
-- Host: 127.0.0.1    Database: multiweb
-- ------------------------------------------------------
-- Server version	5.5.37-0ubuntu0.13.10.1

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
-- Table structure for table `acos`
--

DROP TABLE IF EXISTS `acos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acos` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) DEFAULT NULL,
  `model` varchar(255) DEFAULT NULL,
  `foreign_key` int(10) DEFAULT NULL,
  `alias` varchar(255) DEFAULT NULL,
  `lft` int(10) DEFAULT NULL,
  `rght` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acos`
--
-- ORDER BY:  `id`

LOCK TABLES `acos` WRITE;
/*!40000 ALTER TABLE `acos` DISABLE KEYS */;
/*!40000 ALTER TABLE `acos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aros`
--

DROP TABLE IF EXISTS `aros`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aros` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) DEFAULT NULL,
  `model` varchar(255) DEFAULT NULL,
  `foreign_key` int(10) DEFAULT NULL,
  `alias` varchar(255) DEFAULT NULL,
  `lft` int(10) DEFAULT NULL,
  `rght` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aros`
--
-- ORDER BY:  `id`

LOCK TABLES `aros` WRITE;
/*!40000 ALTER TABLE `aros` DISABLE KEYS */;
INSERT INTO `aros` VALUES (1,NULL,NULL,NULL,'Groups',1,8),(3,1,'Group',6,NULL,2,3),(4,1,'Group',7,NULL,4,7),(5,NULL,NULL,NULL,'Users',9,16),(6,5,'User',11,NULL,10,11),(7,5,'User',12,NULL,12,13),(8,5,'User',13,NULL,14,15),(9,4,'User',14,NULL,5,6);
/*!40000 ALTER TABLE `aros` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aros_acos`
--

DROP TABLE IF EXISTS `aros_acos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aros_acos` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `aro_id` int(10) NOT NULL,
  `aco_id` int(10) NOT NULL,
  `_create` varchar(2) NOT NULL DEFAULT '0',
  `_read` varchar(2) NOT NULL DEFAULT '0',
  `_update` varchar(2) NOT NULL DEFAULT '0',
  `_delete` varchar(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ARO_ACO_KEY` (`aro_id`,`aco_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aros_acos`
--
-- ORDER BY:  `id`

LOCK TABLES `aros_acos` WRITE;
/*!40000 ALTER TABLE `aros_acos` DISABLE KEYS */;
/*!40000 ALTER TABLE `aros_acos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `arquivos`
--

DROP TABLE IF EXISTS `arquivos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `arquivos` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'ID Processos',
  `uuid` varchar(45) NOT NULL,
  `alias` varchar(120) DEFAULT NULL COMMENT 'Apelido',
  `words_key` varchar(255) DEFAULT NULL COMMENT 'Palavras_chave\\n',
  `local` varchar(255) NOT NULL COMMENT 'Local Arquivado',
  `a_nome` varchar(100) NOT NULL COMMENT 'Nome do Arquivo',
  `a_descricao` varchar(255) DEFAULT NULL,
  `a_hash` varchar(80) NOT NULL,
  `userId` int(10) NOT NULL DEFAULT '-1' COMMENT 'Usuário que cadastrou ou alterou',
  `modifiedByUserId` int(10) NOT NULL DEFAULT '-1',
  `created` date DEFAULT NULL COMMENT 'Data Criação',
  `modified` date DEFAULT NULL COMMENT 'Data Modificação',
  PRIMARY KEY (`id`),
  UNIQUE KEY `a_nome_UNIQUE` (`a_nome`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Aqui aramazenaremos as arquivos que serão importados.\nAinda ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `arquivos`
--
-- ORDER BY:  `id`

LOCK TABLES `arquivos` WRITE;
/*!40000 ALTER TABLE `arquivos` DISABLE KEYS */;
/*!40000 ALTER TABLE `arquivos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `groups`
--

DROP TABLE IF EXISTS `groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `groups` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `uuid` varchar(36) NOT NULL,
  `g_nome` varchar(120) DEFAULT NULL COMMENT 'Grupo',
  `g_descricao` varchar(255) DEFAULT NULL COMMENT 'Descrição',
  `modifiedUserById` int(10) NOT NULL DEFAULT '-1' COMMENT 'Modificado por',
  `created` datetime DEFAULT NULL COMMENT 'Criado em',
  `modified` datetime DEFAULT NULL COMMENT 'Modificado em',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `groups`
--
-- ORDER BY:  `id`

LOCK TABLES `groups` WRITE;
/*!40000 ALTER TABLE `groups` DISABLE KEYS */;
INSERT INTO `groups` VALUES (6,'b7848dd9-eb29-11e3-b848-50b7c33c01a6','Administradores','Administres do sistema',-1,'2014-06-03 10:38:50','2014-06-03 10:38:50'),(7,'b8cbe16f-eb29-11e3-b848-50b7c33c01a6','Público','Acesso público ao sistema',-1,'2014-06-03 10:38:50','2014-06-03 10:38:50');
/*!40000 ALTER TABLE `groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `p_fisicas`
--

DROP TABLE IF EXISTS `p_fisicas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `p_fisicas` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'Código Pessoa Física',
  `uuid` varchar(36) NOT NULL,
  `pessoa_id` int(10) NOT NULL COMMENT 'Código Pessoa',
  `cpf` varchar(255) DEFAULT NULL COMMENT 'CPF',
  `rg` varchar(25) DEFAULT NULL COMMENT 'RG',
  `orgao_emissor` varchar(255) DEFAULT NULL COMMENT 'Órgão Emissor',
  `dt_nascimento` datetime DEFAULT NULL COMMENT 'Data Nascimento',
  `nacionalidade` varchar(50) DEFAULT NULL COMMENT 'Nacionalidade',
  `naturalidade` varchar(50) DEFAULT NULL COMMENT 'Naturalidade',
  `celular` varchar(20) DEFAULT NULL COMMENT 'Celular',
  `email` varchar(85) DEFAULT NULL COMMENT 'Email',
  `estado_Civil` varchar(20) DEFAULT NULL COMMENT 'Estado Civil',
  `regime_Casamento` varchar(80) DEFAULT NULL COMMENT 'Regima Casamento',
  `escolaridade` varchar(55) DEFAULT NULL COMMENT 'Escolaridade',
  `nome_Mae` varchar(120) DEFAULT NULL COMMENT 'Nome da Mãe',
  `nome_Pai` varchar(120) DEFAULT NULL COMMENT 'Nome do Pai',
  `cartNac_Habilitacao` varchar(255) DEFAULT NULL COMMENT 'CNH',
  `nome_Conjuge` varchar(120) DEFAULT NULL COMMENT 'Nome Conjuge',
  `obs_P_Fisica` longtext COMMENT 'OBS Pessoa Física',
  `userId` int(10) NOT NULL DEFAULT '-1' COMMENT 'ID Usuário que cadastrou',
  `modifiedByUserId` int(10) NOT NULL DEFAULT '-1' COMMENT 'ID Usuário atualizou',
  `modified` date DEFAULT NULL COMMENT 'Data Modificação',
  `created` datetime DEFAULT NULL COMMENT 'Data Criação',
  PRIMARY KEY (`id`),
  KEY `fk_p_fisica_1_idx` (`pessoa_id`),
  CONSTRAINT `fk_p_fisicas_1` FOREIGN KEY (`pessoa_id`) REFERENCES `pessoas` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `p_fisicas`
--
-- ORDER BY:  `id`

LOCK TABLES `p_fisicas` WRITE;
/*!40000 ALTER TABLE `p_fisicas` DISABLE KEYS */;
/*!40000 ALTER TABLE `p_fisicas` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `multiweb`.`UUID_insert_p_fisicas`
BEFORE INSERT ON `multiweb`.`p_fisicas`
FOR EACH ROW
BEGIN
	-- IF new.uuid is null then
	  SET new.uuid := UUID();
	-- END IF;
	SET new.created := NOW();
	SET new.modified := NOW();
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `multiweb`.`UUID_update_p_fisicas`
BEFORE UPDATE ON `multiweb`.`p_fisicas`
FOR EACH ROW
BEGIN
	SET NEW.modified := NOW();
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `p_juridicas`
--

DROP TABLE IF EXISTS `p_juridicas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `p_juridicas` (
  `id` int(10) NOT NULL COMMENT 'Código da Pessoa',
  `uuid` varchar(36) NOT NULL,
  `pessoa_id` int(10) NOT NULL DEFAULT '-1' COMMENT 'ID Pessoa',
  `cnpj` varchar(120) DEFAULT NULL COMMENT 'CNPJ',
  `nomeFantasia` varchar(120) DEFAULT NULL COMMENT 'Nome Fantasia',
  `razaoSocial` varchar(120) DEFAULT NULL COMMENT 'Razão Social',
  `atividade_principal` varchar(255) DEFAULT NULL COMMENT 'Atividade Principal',
  `atividade_secundaria` varchar(255) DEFAULT NULL COMMENT 'Atividade Secundária',
  `natureza_juridica` varchar(255) DEFAULT NULL COMMENT 'Natureza Juridica',
  `situacao_cadastral` varchar(120) DEFAULT NULL COMMENT 'Situação Cadastral',
  `motivo_situacao` varchar(35) DEFAULT NULL COMMENT 'Motivo Situação',
  `situacao_especial` varchar(255) DEFAULT NULL COMMENT 'Situação Especial',
  `insc_estadual` varchar(255) DEFAULT NULL COMMENT 'Inscrição Estadual',
  `insc_municipal` varchar(255) DEFAULT NULL COMMENT 'Inscrição Municipal',
  `Origem_cad` varchar(255) DEFAULT NULL COMMENT 'Origem do Cadastro',
  `userId` int(10) NOT NULL DEFAULT '-1' COMMENT 'ID Usuário que cadastrou',
  `modifiedByUserId` int(10) NOT NULL DEFAULT '-1' COMMENT 'ID Usuário atualizou',
  `created` datetime DEFAULT NULL COMMENT 'Data cadastro',
  `modified` datetime DEFAULT NULL COMMENT 'Data Modificação',
  PRIMARY KEY (`id`),
  KEY `fk_p_juridica_pessoas1_idx` (`pessoa_id`),
  CONSTRAINT `fk_p_juridicas_1` FOREIGN KEY (`pessoa_id`) REFERENCES `pessoas` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `p_juridicas`
--
-- ORDER BY:  `id`

LOCK TABLES `p_juridicas` WRITE;
/*!40000 ALTER TABLE `p_juridicas` DISABLE KEYS */;
/*!40000 ALTER TABLE `p_juridicas` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `multiweb`.`UUID_insert_p_juridicas`
BEFORE INSERT ON `multiweb`.`p_juridicas`
FOR EACH ROW
BEGIN
	-- IF new.uuid is null then
	  SET new.uuid := UUID();
	-- END IF;
	SET new.created := NOW();
	SET new.modified := NOW();
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `multiweb`.`UUID_update_p_juridicas`
BEFORE UPDATE ON `multiweb`.`p_juridicas`
FOR EACH ROW
BEGIN
	SET NEW.modified := NOW();
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `pessoas`
--

DROP TABLE IF EXISTS `pessoas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pessoas` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'ID da Pessoa',
  `uuid` varchar(36) NOT NULL,
  `user_id` int(10) NOT NULL DEFAULT '-1' COMMENT 'User ID ao qual o registro pertence.',
  `nome` varchar(100) NOT NULL DEFAULT 'Primeiro Nome' COMMENT 'Nome',
  `sobrenome` varchar(100) DEFAULT NULL COMMENT 'Sobrenome',
  `celular` varchar(20) DEFAULT NULL COMMENT 'Celular',
  `tipo_pessoa` varchar(2) DEFAULT NULL COMMENT 'Fisca ou Juridica (PF ou PJ)',
  `obs_gerais` varchar(255) DEFAULT NULL COMMENT 'Observações Gerais',
  `userId` int(10) NOT NULL DEFAULT '-1' COMMENT 'ID Usuário que cadastrou',
  `modifiedByUserId` int(10) NOT NULL DEFAULT '-1' COMMENT 'ID Usuário atualizou',
  `created` datetime DEFAULT NULL COMMENT 'Data Criação',
  `modified` datetime DEFAULT NULL COMMENT 'Data Modificação',
  PRIMARY KEY (`id`),
  KEY `fk_pessoas_1_idx` (`user_id`),
  CONSTRAINT `fk_pessoas_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pessoas`
--
-- ORDER BY:  `id`

LOCK TABLES `pessoas` WRITE;
/*!40000 ALTER TABLE `pessoas` DISABLE KEYS */;
/*!40000 ALTER TABLE `pessoas` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `multiweb`.`UUID_insert_pessoas`
BEFORE INSERT ON `multiweb`.`pessoas`
FOR EACH ROW
BEGIN
	-- IF new.uuid is null then
	  SET new.uuid := UUID();
	-- END IF;
	SET new.created := NOW();
	SET new.modified := NOW();
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `multiweb`.`UUID_update_pessoas`
BEFORE UPDATE ON `multiweb`.`pessoas`
FOR EACH ROW
BEGIN
	SET NEW.modified := NOW();
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `projetos`
--

DROP TABLE IF EXISTS `projetos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projetos` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'ID Projeto',
  `uuid` varchar(36) NOT NULL,
  `nome_projeto` varchar(120) DEFAULT NULL COMMENT 'Nome do Projeto',
  `desc_projeto` blob COMMENT 'Descrição do Projeto',
  `dt_inicio` date DEFAULT NULL COMMENT 'Data Inicio',
  `dt_fim` date DEFAULT NULL COMMENT 'Data Fim',
  `gerente_projeto` varchar(255) DEFAULT NULL COMMENT 'Gerente de Projeto',
  `userId` int(10) NOT NULL DEFAULT '-1' COMMENT 'Usuário que cadastrou ou alterou',
  `modifiedByUserId` int(10) NOT NULL DEFAULT '-1',
  `created` datetime DEFAULT NULL COMMENT 'Data Modificação',
  `modified` datetime DEFAULT NULL COMMENT 'Data Criação',
  PRIMARY KEY (`id`),
  KEY `projetos_1_idx` (`nome_projeto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projetos`
--
-- ORDER BY:  `id`

LOCK TABLES `projetos` WRITE;
/*!40000 ALTER TABLE `projetos` DISABLE KEYS */;
/*!40000 ALTER TABLE `projetos` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `multiweb`.`UUID_insert_projetos`
BEFORE INSERT ON `multiweb`.`projetos`
FOR EACH ROW
BEGIN
	-- IF new.uuid is null then
	  SET new.uuid := UUID();
	-- END IF;
	SET new.created := NOW();
	SET new.modified := NOW();
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `multiweb`.`UUID_update_projetos`
BEFORE UPDATE ON `multiweb`.`projetos`
FOR EACH ROW
BEGIN
	SET NEW.modified := NOW();
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `projetos_arquivos`
--

DROP TABLE IF EXISTS `projetos_arquivos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projetos_arquivos` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `uuid` varchar(36) NOT NULL,
  `projeto_id` int(10) NOT NULL DEFAULT '-1' COMMENT 'ID Projeto',
  `arquivo_id` int(10) NOT NULL DEFAULT '-1' COMMENT 'ID Arquivo',
  `userId` int(10) NOT NULL DEFAULT '-1' COMMENT 'Usuário que cadastrou ou alterou',
  `modifiedByUserId` int(10) NOT NULL DEFAULT '-1',
  `created` datetime DEFAULT NULL COMMENT 'Data Criação',
  `modified` datetime DEFAULT NULL COMMENT 'Data Modificação',
  PRIMARY KEY (`id`),
  KEY `fk_projetos_arquivos_1_idx` (`projeto_id`),
  KEY `fk_projetos_arquivos_2_idx` (`arquivo_id`),
  CONSTRAINT `fk_projetos_arquivos_1` FOREIGN KEY (`projeto_id`) REFERENCES `projetos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_projetos_arquivos_2` FOREIGN KEY (`arquivo_id`) REFERENCES `arquivos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projetos_arquivos`
--
-- ORDER BY:  `id`

LOCK TABLES `projetos_arquivos` WRITE;
/*!40000 ALTER TABLE `projetos_arquivos` DISABLE KEYS */;
/*!40000 ALTER TABLE `projetos_arquivos` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `multiweb`.`UUID_insert_projetos_arquivos`
BEFORE INSERT ON `multiweb`.`projetos_arquivos`
FOR EACH ROW
BEGIN
	-- IF new.uuid is null then
	  SET new.uuid := UUID();
	-- END IF;
	SET new.created := NOW();
	SET new.modified := NOW();
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `multiweb`.`UUID_update_projetos_arquivos`
BEFORE UPDATE ON `multiweb`.`projetos_arquivos`
FOR EACH ROW
BEGIN
	SET NEW.modified := NOW();
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `uuid` varchar(36) NOT NULL,
  `group_id` int(10) NOT NULL DEFAULT '-1' COMMENT 'Regra',
  `username` varchar(50) DEFAULT NULL COMMENT 'Login',
  `password` varchar(50) DEFAULT NULL COMMENT 'Senha',
  `userId` int(10) DEFAULT '-1' COMMENT 'Usuário que cadastrou ou alterou',
  `modifiedByUserId` int(10) DEFAULT '-1' COMMENT 'Modificado por',
  `created` datetime DEFAULT NULL COMMENT 'Criado em',
  `modified` datetime DEFAULT NULL COMMENT 'Modificado em',
  PRIMARY KEY (`id`),
  KEY `fk_users_1_idx` (`group_id`),
  CONSTRAINT `fk_users_1` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--
-- ORDER BY:  `id`

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (11,'f51088bf-eb29-11e3-b848-50b7c33c01a6',6,'admin','21232f297a57a5a743894a0e4a801fc3',-1,-1,'2014-06-03 10:41:59','2014-06-03 10:41:59'),(12,'f6272e1b-eb29-11e3-b848-50b7c33c01a6',7,'publico','83951dcbdb9d96d2e43b8f20c3663943',-1,-1,'2014-06-03 10:41:59','2014-06-03 10:41:59'),(13,'1e47a0c7-ed79-11e3-8f55-50b7c33c01a6',6,'pssilva','c4f900e40e576a48f1b23808f85477a7',-1,-1,'2014-06-06 09:50:20','2014-06-06 09:50:20'),(14,'d585de3c-ed7b-11e3-8f55-50b7c33c01a6',7,'publico_1','15a420ebad1c72813922c180d6b5eaf0',-1,-1,'2014-06-06 10:09:47','2014-06-06 10:09:47');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `multiweb`.`UUID_insert_users`
BEFORE INSERT ON `multiweb`.`users`
FOR EACH ROW
BEGIN
	-- IF new.uuid is null then
	  SET new.uuid := UUID();
	-- END IF;
	SET new.created := NOW();
	SET new.modified := NOW();
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `multiweb`.`UUID_update_users`
BEFORE UPDATE ON `multiweb`.`users`
FOR EACH ROW
BEGIN
	SET NEW.modified := NOW();
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Dumping events for database 'multiweb'
--

--
-- Dumping routines for database 'multiweb'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-06-07  7:24:49
