CREATE DATABASE  IF NOT EXISTS `zgzy` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `zgzy`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: zgzy
-- ------------------------------------------------------
-- Server version	5.7.20-log

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
-- Table structure for table `tbbug`
--

DROP TABLE IF EXISTS `tbbug`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbbug` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `UserName` varchar(50) DEFAULT NULL,
  `UserIp` varchar(50) DEFAULT NULL,
  `BugInfo` longtext,
  `BugReply` longtext,
  `BugDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `IfShow` tinyint(1) DEFAULT NULL,
  `IfSolve` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbbug`
--

LOCK TABLES `tbbug` WRITE;
/*!40000 ALTER TABLE `tbbug` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbbug` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbbutton`
--

DROP TABLE IF EXISTS `tbbutton`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbbutton` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) DEFAULT NULL,
  `Code` varchar(50) DEFAULT NULL,
  `Icon` varchar(50) DEFAULT NULL,
  `Sort` int(11) DEFAULT NULL,
  `AddDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `Description` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbbutton`
--

LOCK TABLES `tbbutton` WRITE;
/*!40000 ALTER TABLE `tbbutton` DISABLE KEYS */;
INSERT INTO `tbbutton` VALUES (1,'浏览','browser','icon-eye',1,'2013-12-04 03:46:04',NULL),(3,'添加','add','icon-add',3,'2013-12-04 03:46:04',NULL),(4,'修改','edit','icon-application_edit',4,'2013-12-04 03:46:04',NULL),(5,'删除','delete','icon-delete',5,'2013-12-04 03:46:04',NULL),(6,'导出','export','icon-page_excel',6,'2013-12-04 03:46:04',NULL),(7,'部门设置','setdepartment','icon-group',8,'2013-12-04 03:46:04',NULL),(8,'角色设置','setrole','icon-user_key',7,'2013-12-04 03:46:04',NULL),(9,'角色授权','authorize','icon-key',9,'2013-12-04 03:46:04',NULL),(10,'分配按钮','setbutton','icon-link',10,'2013-12-11 01:13:23',NULL),(11,'全部展开','expandall','icon-expand',11,'2013-12-11 02:28:38',NULL),(12,'全部隐藏','collapseall','icon-collapse',12,'2013-12-11 02:28:55',NULL);
/*!40000 ALTER TABLE `tbbutton` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbdepartment`
--

DROP TABLE IF EXISTS `tbdepartment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbdepartment` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `DepartmentName` varchar(50) DEFAULT NULL,
  `ParentId` int(11) DEFAULT NULL,
  `Sort` int(11) DEFAULT NULL,
  `AddDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbdepartment`
--

LOCK TABLES `tbdepartment` WRITE;
/*!40000 ALTER TABLE `tbdepartment` DISABLE KEYS */;
INSERT INTO `tbdepartment` VALUES (1,'人事行政部',0,3,'2013-10-15 13:55:14'),(2,'研发部',0,1,'2013-10-15 13:55:19'),(3,'技术支持',0,2,'2013-10-15 13:55:27'),(4,'人事部',1,1,'2013-10-15 13:55:28'),(5,'行政部',1,2,'2013-10-15 13:56:04'),(7,'C#组',2,2,'2013-10-15 13:56:18'),(8,'Java组',2,1,'2013-10-15 13:56:22'),(9,'Shell脚本组',2,5,'2013-10-15 13:56:39'),(10,'C/C++组',2,4,'2013-10-15 13:56:46'),(11,'宽带光纤',3,2,'2013-10-15 13:56:57'),(12,'系统运维',3,1,'2013-10-15 13:57:05'),(15,'IT',4,1,'2013-12-11 03:04:14'),(16,'行政1部',5,2,'2013-12-16 02:32:02'),(17,'行政2部',5,1,'2013-12-16 02:32:20'),(41,'销售部',0,4,'2014-01-08 03:09:33'),(43,'销售组',41,1,'2014-01-08 03:10:02'),(46,'PHP组',2,3,'2014-01-08 03:11:21');
/*!40000 ALTER TABLE `tbdepartment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbloginlog`
--

DROP TABLE IF EXISTS `tbloginlog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbloginlog` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `UserName` varchar(50) DEFAULT NULL,
  `UserIp` varchar(50) DEFAULT NULL,
  `City` varchar(50) DEFAULT NULL,
  `Success` tinyint(1) DEFAULT NULL,
  `LoginDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=96 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbloginlog`
--

LOCK TABLES `tbloginlog` WRITE;
/*!40000 ALTER TABLE `tbloginlog` DISABLE KEYS */;
INSERT INTO `tbloginlog` VALUES (1,'admin','::1','广东东莞',1,'2017-04-14 02:58:25'),(2,'admin','::1','广东东莞',1,'2017-04-14 02:58:36'),(3,'admin','::1','广东东莞',1,'2017-04-14 03:01:20'),(4,'admin','::1','广东东莞',1,'2017-04-14 03:01:33'),(5,'admin','::1','未知',1,'2017-04-14 03:02:19'),(6,'admin','::1','广东东莞',1,'2017-04-14 03:02:23'),(7,'admin','::1','广东东莞',0,'2017-04-14 06:42:59'),(8,'admin','::1','广东东莞',1,'2017-04-14 06:43:12'),(9,'admin','::1','广东东莞',1,'2017-04-14 06:43:15'),(10,'admin','::1','广东东莞',1,'2017-04-14 07:47:50'),(11,'admin','::1','未知',1,'2017-04-17 02:26:28'),(12,'admin','::1','未知',1,'2017-04-17 02:26:34'),(13,'admin','::1','未知',1,'2017-04-17 03:56:18'),(14,'admin','::1','广东东莞',1,'2017-04-17 05:16:30'),(15,'admin','::1','广东东莞',1,'2017-05-15 05:42:28'),(16,'admin','::1','?????',1,'2017-05-15 05:43:25'),(17,'admin','::1','广东东莞',1,'2017-05-15 06:17:31'),(18,'admin','::1','?????',1,'2017-05-15 06:18:14'),(19,'admin','::1','?????',1,'2017-05-15 06:19:16'),(20,'admin','::1','?????',1,'2017-05-15 06:19:18'),(21,'admin','::1','广东东莞',1,'2017-05-15 06:19:41'),(22,'admin','::1','?????',1,'2017-05-15 06:20:18'),(23,'admin','::1','广东东莞',1,'2017-05-15 06:21:34'),(24,'admin','::1','广东东莞',1,'2017-05-15 06:23:53'),(25,'admin','::1','?????',1,'2017-05-15 06:24:04'),(26,'admin','::1','广东东莞',1,'2017-05-15 06:25:02'),(27,'admin','::1','?????',1,'2017-05-15 06:25:10'),(28,'admin','::1','广东东莞',1,'2017-07-04 02:53:33'),(29,'admin','::1','?????',1,'2017-07-04 02:53:39'),(30,'admin','::1','?????',1,'2017-07-04 03:00:09'),(31,'admin','::1','广东东莞',1,'2017-07-04 03:06:01'),(32,'admin','::1','?????',1,'2017-07-04 03:06:12'),(33,'admin','::1',NULL,1,'2017-07-04 06:56:38'),(34,'admin','::1',NULL,1,'2017-07-04 07:00:40'),(35,'admin','::1',NULL,1,'2017-07-04 07:00:40'),(36,'admin','::1',NULL,1,'2017-07-04 07:00:40'),(37,'admin','::1','未知',1,'2017-08-21 08:09:22'),(38,'admin','::1','未知',1,'2017-08-21 08:09:28'),(39,'admin','::1','未知',1,'2017-08-21 08:09:38'),(40,'admin','::1','未知',1,'2017-10-18 07:31:36'),(41,'admin','::1','未知',1,'2017-10-18 07:32:22'),(42,'admin','::1','未知',1,'2017-10-18 07:34:45'),(43,'admin','::1','未知',1,'2017-10-18 07:37:09'),(44,'admin','::1','未知',1,'2017-10-18 07:39:09'),(45,'admin','::1','未知',1,'2017-10-18 08:43:40'),(46,'admin','::1','未知',1,'2017-10-18 08:44:10'),(47,'admin','::1','未知',1,'2017-10-18 08:44:47'),(48,NULL,'::1','未知',0,'2017-10-18 08:45:32'),(49,NULL,'::1','未知',0,'2017-10-18 08:45:51'),(50,'admin','::1','未知',1,'2017-10-18 08:46:16'),(51,'admin','::1','未知',1,'2017-10-18 08:47:45'),(52,'admin','::1','未知',1,'2017-10-18 08:50:03'),(53,'admin','::1','未知',1,'2017-10-18 09:16:35'),(54,'admin','::1','未知',1,'2017-10-18 09:22:34'),(55,'admin','::1','未知',1,'2017-11-06 06:49:17'),(56,'admin','::1','未知',1,'2017-11-06 07:18:57'),(57,'admin','::1','未知',1,'2017-11-06 07:24:25'),(58,'admin','::1','未知',1,'2017-11-06 09:06:32'),(59,'admin','::1','未知',1,'2017-11-06 09:08:56'),(60,'admin','::1','未知',1,'2017-11-06 09:10:45'),(61,'admin','::1','未知',1,'2017-11-23 00:46:21'),(62,'admin','::1','未知',1,'2017-12-27 05:27:42'),(63,'admin','::1','未知',1,'2017-12-27 05:50:16'),(64,'admin','::1','广东东莞',1,'2017-12-27 06:27:55'),(65,'admin','::1','广东东莞',1,'2017-12-27 06:28:04'),(66,'admin','::1','未知',1,'2017-12-27 06:30:32'),(67,'admin','::1','未知',1,'2017-12-27 06:32:37'),(68,'admin','::1','未知',1,'2017-12-27 07:32:05'),(69,'admin','::1','未知',1,'2017-12-27 07:57:10'),(70,'admin','::1','未知',1,'2017-12-27 07:59:29'),(71,'admin','::1','未知',1,'2017-12-27 08:06:38'),(72,'admin','::1','未知',1,'2017-12-27 08:16:12'),(73,'admin','::1','未知',1,'2017-12-27 08:49:11'),(74,'admin','::1','未知',1,'2017-12-27 09:02:49'),(75,'admin','::1','未知',1,'2017-12-27 09:03:14'),(76,'admin','::1','未知',1,'2017-12-27 09:07:24'),(77,'admin','::1','未知',1,'2017-12-29 00:52:03'),(78,'admin','::1','未知',1,'2017-12-29 02:20:24'),(79,'admin','::1','未知',1,'2018-01-09 03:40:42'),(80,'admin','::1','未知',1,'2018-01-09 08:40:41'),(81,'admin','::1','未知',1,'2018-01-09 09:09:38'),(82,'admin','::1','未知',1,'2018-01-09 09:17:16'),(83,'admin','::1','未知',1,'2018-01-09 09:17:16'),(84,'admin','::1','未知',1,'2018-01-09 09:26:37'),(85,'admin','::1','未知',1,'2018-01-09 09:26:37'),(86,'admin','::1','未知',1,'2018-01-09 09:31:15'),(87,'admin','::1','未知',1,'2018-01-09 09:31:15'),(88,'admin','::1','未知',1,'2018-01-10 01:58:40'),(89,'admin','::1','未知',1,'2018-01-10 01:58:40'),(90,'admin','::1','未知',1,'2018-01-10 02:33:31'),(91,'admin','::1','未知',1,'2018-01-10 02:33:31'),(92,'admin','::1','未知',1,'2018-01-10 02:55:46'),(93,'admin','::1','未知',1,'2018-01-10 02:55:46'),(94,'admin','::1','未知',1,'2018-01-10 03:02:48'),(95,'admin','::1','未知',1,'2018-01-10 03:02:48');
/*!40000 ALTER TABLE `tbloginlog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbmenu`
--

DROP TABLE IF EXISTS `tbmenu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbmenu` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) DEFAULT NULL,
  `ParentId` int(11) DEFAULT NULL,
  `Code` varchar(50) DEFAULT NULL,
  `LinkAddress` varchar(100) DEFAULT NULL,
  `Icon` varchar(50) DEFAULT NULL,
  `Sort` int(11) DEFAULT NULL,
  `AddDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbmenu`
--

LOCK TABLES `tbmenu` WRITE;
/*!40000 ALTER TABLE `tbmenu` DISABLE KEYS */;
INSERT INTO `tbmenu` VALUES (1,'系统设置',0,NULL,NULL,'icon-cog',1,'2013-09-21 06:32:43'),(2,'其他',0,NULL,NULL,'icon-tux',2,'2013-09-21 06:32:43'),(3,'菜单管理',1,'menu','html/ui_menu.html','icon-layout',2,'2013-09-21 06:32:43'),(4,'用户管理',1,'user','html/ui_user.html','icon-user_suit_black',3,'2013-09-21 06:32:43'),(5,'部门管理',1,'department','html/ui_department.html','icon-group',5,'2013-09-21 06:32:43'),(6,'角色管理',1,'role','html/ui_role.html','icon-key_go',4,'2013-09-21 06:32:43'),(7,'按钮管理',1,'button','html/ui_button.html','icon-button',1,'2013-09-21 06:32:43'),(8,'登录日志',2,'loginlog','html/ui_loginlog.html','icon-drive_user',1,'2013-09-21 06:32:43'),(9,'操作日志',2,'operatelog','html/ui_operatelog.html','icon-table',2,'2013-09-21 06:32:43'),(10,'Bug反馈',2,'bugs','html/ui_bugs.html','icon-bug',3,'2013-09-21 06:32:43');
/*!40000 ALTER TABLE `tbmenu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbmenu_new`
--

DROP TABLE IF EXISTS `tbmenu_new`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbmenu_new` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `MODEL` varchar(30) NOT NULL,
  `Name` varchar(50) DEFAULT NULL,
  `EN_NAME` varchar(50) DEFAULT NULL,
  `ParentId` int(11) DEFAULT NULL,
  `Code` varchar(50) DEFAULT NULL,
  `LinkAddress` varchar(100) DEFAULT NULL,
  `Icon` varchar(50) DEFAULT NULL,
  `Sort` int(11) DEFAULT NULL,
  `AddDate` datetime(6) DEFAULT NULL,
  `CREAT_BY` varchar(30) DEFAULT NULL,
  `MODIFY_DATE` datetime(6) DEFAULT NULL,
  `MODIFY_BY` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbmenu_new`
--

LOCK TABLES `tbmenu_new` WRITE;
/*!40000 ALTER TABLE `tbmenu_new` DISABLE KEYS */;
INSERT INTO `tbmenu_new` VALUES (1,'sys-manage','系统设置','',0,NULL,NULL,'icon-cog',1,'2013-09-21 14:32:43.253000','','1900-01-01 00:00:00.000000',''),(2,'sys-manage','其他','',0,NULL,NULL,'icon-tux',2,'2013-09-21 14:32:43.253000','','1900-01-01 00:00:00.000000',''),(3,'sys-manage','菜单管理','',1,'menu','html/ui_menu.html','icon-layout',2,'2013-09-21 14:32:43.253000','','1900-01-01 00:00:00.000000',''),(4,'sys-manage','用户管理','',1,'user','html/ui_user.html','icon-user_suit_black',3,'2013-09-21 14:32:43.253000','','1900-01-01 00:00:00.000000',''),(5,'sys-manage','部门管理','',1,'department','html/ui_department.html','icon-group',5,'2013-09-21 14:32:43.253000','','1900-01-01 00:00:00.000000',''),(6,'sys-manage','角色管理','',1,'role','html/ui_role.html','icon-key_go',4,'2013-09-21 14:32:43.253000','','1900-01-01 00:00:00.000000',''),(7,'sys-manage','按钮管理','',1,'button','html/ui_button.html','icon-button',1,'2013-09-21 14:32:43.253000','','1900-01-01 00:00:00.000000',''),(8,'sys-manage','登录日志','',2,'loginlog','html/ui_loginlog.html','icon-drive_user',1,'2013-09-21 14:32:43.253000','','1900-01-01 00:00:00.000000',''),(9,'sys-manage','操作日志','',2,'operatelog','html/ui_operatelog.html','icon-table',2,'2013-09-21 14:32:43.253000','','1900-01-01 00:00:00.000000',''),(10,'sys-manage','Bug反馈','',2,'bugs','html/ui_bugs.html','icon-bug',3,'2013-09-21 14:32:43.253000','','1900-01-01 00:00:00.000000','');
/*!40000 ALTER TABLE `tbmenu_new` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbmenubutton`
--

DROP TABLE IF EXISTS `tbmenubutton`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbmenubutton` (
  `MenuId` int(11) DEFAULT NULL,
  `ButtonId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbmenubutton`
--

LOCK TABLES `tbmenubutton` WRITE;
/*!40000 ALTER TABLE `tbmenubutton` DISABLE KEYS */;
INSERT INTO `tbmenubutton` VALUES (3,1),(3,3),(3,4),(3,5),(4,1),(4,7),(4,3),(4,4),(4,5),(5,1),(5,3),(5,4),(5,5),(6,1),(6,3),(6,4),(6,5),(7,1),(7,3),(7,4),(7,5),(8,1),(4,8),(8,6),(9,1),(6,9),(3,10),(10,1),(5,11),(10,3),(10,4),(10,6),(5,12);
/*!40000 ALTER TABLE `tbmenubutton` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbrole`
--

DROP TABLE IF EXISTS `tbrole`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbrole` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `RoleName` varchar(50) DEFAULT NULL,
  `Description` varchar(100) DEFAULT NULL,
  `AddDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `ModifyDate` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbrole`
--

LOCK TABLES `tbrole` WRITE;
/*!40000 ALTER TABLE `tbrole` DISABLE KEYS */;
INSERT INTO `tbrole` VALUES (1,'超级管理员','拥有所有增删改查权限s','2013-11-11 08:01:25','2017-12-27 15:57:22.290000'),(52,'浏览角色','仅拥有浏览菜单的权限，无增删改权限ss','2014-02-19 01:30:15','2017-12-27 15:56:28.210000'),(53,'test','test','2017-12-27 07:55:37',NULL);
/*!40000 ALTER TABLE `tbrole` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbrolemenubutton`
--

DROP TABLE IF EXISTS `tbrolemenubutton`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbrolemenubutton` (
  `RoleId` int(11) DEFAULT NULL,
  `MenuId` int(11) DEFAULT NULL,
  `ButtonId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbrolemenubutton`
--

LOCK TABLES `tbrolemenubutton` WRITE;
/*!40000 ALTER TABLE `tbrolemenubutton` DISABLE KEYS */;
INSERT INTO `tbrolemenubutton` VALUES (1,3,1),(1,3,3),(1,3,4),(1,3,5),(1,4,1),(1,4,3),(1,4,7),(1,4,4),(1,4,5),(1,5,1),(1,5,3),(1,5,4),(1,5,5),(1,6,1),(1,6,3),(1,6,4),(1,6,5),(1,7,1),(1,7,3),(1,7,4),(1,7,5),(1,8,1),(1,4,8),(1,8,6),(1,9,1),(1,6,9),(1,3,10),(1,10,1),(1,5,11),(1,10,3),(1,10,4),(1,10,6),(52,1,0),(52,9,1),(52,4,1),(52,7,1),(52,3,1),(52,2,0),(52,10,1),(52,5,1),(1,1,0),(1,2,0),(52,6,1),(52,8,1),(1,5,12);
/*!40000 ALTER TABLE `tbrolemenubutton` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbuser`
--

DROP TABLE IF EXISTS `tbuser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbuser` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `UserId` varchar(50) DEFAULT NULL,
  `UserName` varchar(50) DEFAULT NULL,
  `UserPwd` varchar(50) DEFAULT NULL,
  `IsAble` tinyint(1) DEFAULT NULL,
  `IfChangePwd` tinyint(1) DEFAULT NULL,
  `AddDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `Description` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=93 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbuser`
--

LOCK TABLES `tbuser` WRITE;
/*!40000 ALTER TABLE `tbuser` DISABLE KEYS */;
INSERT INTO `tbuser` VALUES (72,'admin','adminitrator','21232F297A57A5A743894A0E4A801F',1,1,'2014-01-08 02:32:58','管理员账号'),(74,'wangjie','汪杰','209EAE20CEF54355B3FC1086CB9CEA',1,1,'2014-02-19 01:26:36','oppoic.cnblogs.com'),(75,'test','测试用户','202CB962AC59075B964B07152D234B',1,1,'2014-02-24 01:56:01','测试账号'),(76,'michael','michael zhu','202CB962AC59075B964B07152D234B',1,0,'2017-12-27 06:20:43','test admin'),(92,'tt','test','202CB962AC59075B964B07152D234B',1,0,'2018-01-10 02:14:10','sdf');
/*!40000 ALTER TABLE `tbuser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbuserdepartment`
--

DROP TABLE IF EXISTS `tbuserdepartment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbuserdepartment` (
  `UserId` int(11) DEFAULT NULL,
  `DepartmentId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbuserdepartment`
--

LOCK TABLES `tbuserdepartment` WRITE;
/*!40000 ALTER TABLE `tbuserdepartment` DISABLE KEYS */;
INSERT INTO `tbuserdepartment` VALUES (72,15);
/*!40000 ALTER TABLE `tbuserdepartment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbuseroperatelog`
--

DROP TABLE IF EXISTS `tbuseroperatelog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbuseroperatelog` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `UserName` varchar(50) DEFAULT NULL,
  `UserIp` varchar(50) DEFAULT NULL,
  `OperateInfo` varchar(64) DEFAULT NULL,
  `Description` longtext,
  `IfSuccess` tinyint(1) DEFAULT NULL,
  `OperateDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=256 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbuseroperatelog`
--

LOCK TABLES `tbuseroperatelog` WRITE;
/*!40000 ALTER TABLE `tbuseroperatelog` DISABLE KEYS */;
INSERT INTO `tbuseroperatelog` VALUES (1,NULL,'::1','菜单功能异常','Object reference not set to an instance of an object.',0,'2017-04-14 02:58:01'),(2,NULL,'::1','菜单功能异常','Object reference not set to an instance of an object.',0,'2017-04-14 05:24:15'),(3,NULL,'::1','菜单功能异常','Object reference not set to an instance of an object.',0,'2017-04-14 05:44:13'),(4,NULL,'::1','菜单功能异常','Object reference not set to an instance of an object.',0,'2017-04-14 05:45:07'),(5,NULL,'::1','菜单功能异常','Object reference not set to an instance of an object.',0,'2017-04-14 05:50:03'),(6,NULL,'::1','菜单功能异常','Object reference not set to an instance of an object.',0,'2017-04-14 05:50:51'),(7,NULL,'::1','菜单功能异常','Object reference not set to an instance of an object.',0,'2017-04-14 05:52:53'),(8,NULL,'::1','菜单功能异常','Object reference not set to an instance of an object.',0,'2017-04-14 06:42:51'),(9,NULL,'::1','菜单功能异常','Object reference not set to an instance of an object.',0,'2017-04-14 07:05:39'),(10,NULL,'::1','菜单功能异常','Object reference not set to an instance of an object.',0,'2017-04-14 07:06:31'),(11,NULL,'::1','菜单功能异常','Object reference not set to an instance of an object.',0,'2017-04-14 07:10:06'),(12,NULL,'::1','按钮功能异常','Object reference not set to an instance of an object.',0,'2017-04-17 06:25:10'),(13,NULL,'::1','按钮功能异常','Object reference not set to an instance of an object.',0,'2017-04-17 06:25:34'),(14,NULL,'::1','按钮功能异常','Object reference not set to an instance of an object.',0,'2017-04-17 06:26:15'),(15,NULL,'::1','按钮功能异常','Object reference not set to an instance of an object.',0,'2017-04-17 06:26:22'),(16,NULL,'::1','按钮功能异常','Object reference not set to an instance of an object.',0,'2017-05-15 06:14:09'),(17,NULL,'::1','按钮功能异常','Object reference not set to an instance of an object.',0,'2017-05-15 06:14:30'),(18,'admin','::1','查询角色','查询条件：1=1 排序：AddDate asc 页码/每页大小：1 20',1,'2017-05-15 06:28:00'),(19,'admin','::1','查询角色用户','查询角色Id：1 排序：AddDate asc 页码/每页大小：1 20',1,'2017-05-15 06:28:03'),(20,'admin','::1','查询角色','查询条件：1=1 排序：AddDate asc 页码/每页大小：1 20',1,'2017-05-15 06:30:24'),(21,'admin','::1','查询角色用户','查询角色Id：1 排序：AddDate asc 页码/每页大小：1 20',1,'2017-05-15 06:30:26'),(22,'admin','::1','查询角色','查询条件：1=1 排序：AddDate asc 页码/每页大小：1 20',1,'2017-05-15 06:31:31'),(23,'admin','::1','查询角色用户','查询角色Id：1 排序：AddDate asc 页码/每页大小：1 20',1,'2017-05-15 06:31:32'),(24,'admin','::1','查询按钮','查询条件：1=1 排序：Sort asc 页码/每页大小：1 20',1,'2017-07-04 02:53:56'),(25,'admin','::1','查询用户','查询条件：1=1 排序：AddDate desc 页码/每页大小：1 20',1,'2017-07-04 02:54:00'),(26,'admin','::1','查询部门','查询条件：1=1',1,'2017-07-04 02:54:58'),(27,'admin','::1','查询按钮','查询条件：1=1 排序：Sort asc 页码/每页大小：1 20',1,'2017-07-04 03:05:21'),(28,'admin','::1','查询登陆日志','查询条件：1=1 排序：LoginDate desc 页码/每页大小：1 20',1,'2017-08-21 08:10:48'),(29,'admin','::1','查询登陆日志','查询条件：1=1 排序：LoginDate desc 页码/每页大小：1 20',1,'2017-08-21 08:11:02'),(30,'admin','::1','查询登陆日志','查询条件：1=1 排序：LoginDate desc 页码/每页大小：1 40',1,'2017-08-21 08:11:17'),(31,'admin','::1','查询登陆日志','查询条件：1=1 排序：LoginDate desc 页码/每页大小：1 100',1,'2017-08-21 08:11:21'),(32,'admin','::1','查询登陆日志','查询条件：1=1 排序：LoginDate desc 页码/每页大小：1 20',1,'2017-08-21 08:11:36'),(33,'admin','::1','查询登陆日志','查询条件：1=1 排序：LoginDate desc 页码/每页大小：1 100',1,'2017-08-21 08:11:40'),(34,'admin','::1','查询登陆日志','查询条件：1=1 排序：LoginDate desc 页码/每页大小：1 100',1,'2017-08-21 08:11:44'),(35,'admin','::1','查询登陆日志','查询条件：1=1 排序：LoginDate desc 页码/每页大小：1 20',1,'2017-08-21 08:11:49'),(36,'admin','::1','查询登陆日志','查询条件：1=1 排序：LoginDate desc 页码/每页大小：2 20',1,'2017-08-21 08:11:50'),(37,'admin','::1','查询登陆日志','查询条件：1=1 排序：LoginDate desc 页码/每页大小：1 20',1,'2017-08-21 08:11:55'),(38,NULL,'::1','按钮功能异常','Object reference not set to an instance of an object.',0,'2017-10-18 05:45:19'),(39,NULL,'::1','按钮功能异常','Object reference not set to an instance of an object.',0,'2017-10-18 05:51:17'),(40,NULL,'::1','按钮功能异常','Object reference not set to an instance of an object.',0,'2017-10-18 05:51:27'),(41,NULL,'::1','按钮功能异常','Object reference not set to an instance of an object.',0,'2017-10-18 05:51:39'),(42,NULL,'::1','按钮功能异常','Object reference not set to an instance of an object.',0,'2017-10-18 05:52:12'),(43,NULL,'::1','按钮功能异常','Object reference not set to an instance of an object.',0,'2017-10-18 05:55:08'),(44,NULL,'::1','按钮功能异常','Object reference not set to an instance of an object.',0,'2017-10-18 05:56:52'),(45,NULL,'::1','按钮功能异常','Object reference not set to an instance of an object.',0,'2017-10-18 05:57:57'),(46,'admin','::1','查询用户','查询条件：1=1 排序：AddDate desc 页码/每页大小：1 20',1,'2017-11-06 06:50:35'),(47,'admin','::1','查询用户','查询条件：1=1 排序：AddDate desc 页码/每页大小：1 20',1,'2017-11-06 06:51:15'),(48,'admin','::1','查询用户','查询条件：1=1 排序：AddDate desc 页码/每页大小：1 20',1,'2017-11-06 06:51:53'),(49,'admin','::1','查询登陆日志','查询条件：1=1 排序：LoginDate desc 页码/每页大小：1 20',1,'2017-11-06 06:52:16'),(50,'admin','::1','查询登陆日志','查询条件：1=1 and UserName like \'%michael%\' 排序：LoginDate desc 页码/每页大小：1 20',1,'2017-11-06 06:52:34'),(51,'admin','::1','查询登陆日志','查询条件：1=1 排序：LoginDate desc 页码/每页大小：1 20',1,'2017-11-06 06:52:42'),(52,'admin','::1','查询登陆日志','查询条件：1=1 and Success = \'true\' 排序：LoginDate desc 页码/每页大小：1 20',1,'2017-11-06 06:52:50'),(53,'admin','::1','查询登陆日志','查询条件：1=1 排序：LoginDate desc 页码/每页大小：1 20',1,'2017-11-06 06:52:54'),(54,'admin','::1','查询登陆日志','查询条件：1=1 排序：LoginDate desc 页码/每页大小：1 20',1,'2017-11-06 06:53:50'),(55,'admin','::1','查询用户','查询条件：1=1 排序：AddDate desc 页码/每页大小：1 20',1,'2017-11-06 06:54:01'),(56,'admin','::1','查询用户','查询条件：1=1 排序：AddDate desc 页码/每页大小：1 20',1,'2017-11-06 06:54:43'),(57,'admin','::1','查询用户','查询条件：1=1 排序：AddDate desc 页码/每页大小：1 20',1,'2017-11-06 07:51:11'),(58,'admin','::1','查询用户','查询条件：1=1 排序：AddDate desc 页码/每页大小：1 20',1,'2017-11-06 07:51:13'),(59,'admin','::1','查询用户','查询条件：1=1 排序：AddDate desc 页码/每页大小：1 20',1,'2017-11-06 09:15:07'),(60,'admin','::1','查询用户','查询条件：1=1 排序：AddDate desc 页码/每页大小：1 20',1,'2017-11-23 00:46:40'),(61,'admin','::1','查询用户','查询条件：1=1 排序：AddDate desc 页码/每页大小：1 20',1,'2017-11-23 00:47:08'),(62,'admin','::1','查询用户','查询条件：1=1 排序：AddDate desc 页码/每页大小：1 20',1,'2017-12-27 05:28:00'),(63,'admin','::1','查询菜单','查询条件：1=1 排序：ParentId asc,Sort asc 页码/每页大小：1 20',1,'2017-12-27 05:34:20'),(64,'admin','::1','查询菜单','查询条件：1=1 排序：ParentId asc,Sort asc 页码/每页大小：1 20',1,'2017-12-27 05:35:40'),(65,'admin','::1','查询菜单','查询条件：1=1 排序：ParentId asc,Sort asc 页码/每页大小：1 20',1,'2017-12-27 05:35:45'),(66,'admin','::1','查询菜单','查询条件：1=1 排序：ParentId asc,Sort asc 页码/每页大小：1 20',1,'2017-12-27 05:36:06'),(67,'admin','::1','查询菜单','查询条件：1=1 排序：ParentId asc,Sort asc 页码/每页大小：1 20',1,'2017-12-27 05:37:06'),(68,'admin','::1','查询菜单','查询条件：1=1 排序：ParentId asc,Sort asc 页码/每页大小：1 20',1,'2017-12-27 05:42:32'),(69,'admin','::1','查询菜单','查询条件：1=1 排序：ParentId asc,Sort asc 页码/每页大小：1 20',1,'2017-12-27 05:44:13'),(70,'admin','::1','查询菜单','查询条件：1=1 排序：ParentId asc,Sort asc 页码/每页大小：1 20',1,'2017-12-27 05:44:20'),(71,'admin','::1','查询菜单','查询条件：1=1 排序：ParentId asc,Sort asc 页码/每页大小：1 20',1,'2017-12-27 05:44:23'),(72,'admin','::1','查询菜单','查询条件：1=1 排序：ParentId asc,Sort asc 页码/每页大小：1 20',1,'2017-12-27 05:44:42'),(73,'admin','::1','查询用户','查询条件：1=1 排序：AddDate desc 页码/每页大小：1 20',1,'2017-12-27 05:50:49'),(74,'admin','::1','查询用户','查询条件：1=1 排序：AddDate desc 页码/每页大小：1 20',1,'2017-12-27 05:51:04'),(75,'admin','::1','查询用户','查询条件：1=1 排序：AddDate desc 页码/每页大小：1 20',1,'2017-12-27 05:59:23'),(76,'admin','::1','查询用户','查询条件：1=1 排序：AddDate desc 页码/每页大小：1 20',1,'2017-12-27 05:59:32'),(77,'admin','::1','查询用户','查询条件：1=1 排序：AddDate desc 页码/每页大小：1 20',1,'2017-12-27 05:59:53'),(78,'admin','::1','查询菜单','查询条件：1=1 排序：ParentId asc,Sort asc 页码/每页大小：1 20',1,'2017-12-27 06:06:55'),(79,'admin','::1','查询菜单','查询条件：1=1 排序：ParentId asc,Sort asc 页码/每页大小：1 20',1,'2017-12-27 06:07:03'),(80,'admin','::1','查询菜单','查询条件：1=1 排序：ParentId asc,Sort asc 页码/每页大小：1 20',1,'2017-12-27 06:10:59'),(81,'admin','::1','查询菜单','查询条件：1=1 排序：ParentId asc,Sort asc 页码/每页大小：1 20',1,'2017-12-27 06:13:58'),(82,'admin','::1','查询用户','查询条件：1=1 排序：AddDate desc 页码/每页大小：1 20',1,'2017-12-27 06:14:34'),(83,'admin','::1','查询菜单','查询条件：1=1 排序：ParentId asc,Sort desc 页码/每页大小：1 20',1,'2017-12-27 06:15:23'),(84,'admin','::1','查询菜单','查询条件：1=1 排序：ParentId asc 页码/每页大小：1 20',1,'2017-12-27 06:15:30'),(85,'admin','::1','查询菜单','查询条件：1=1 排序：ParentId asc,Sort asc 页码/每页大小：1 20',1,'2017-12-27 06:17:03'),(86,'admin','::1','查询用户','查询条件：1=1 排序：AddDate desc 页码/每页大小：1 20',1,'2017-12-27 06:19:10'),(87,'admin','::1','查询用户','查询条件：1=1 排序：AddDate desc 页码/每页大小：1 20',1,'2017-12-27 06:20:15'),(88,'admin','::1','添加用户','添加成功，用户主键：76',1,'2017-12-27 06:20:43'),(89,'admin','::1','添加用户','添加成功，用户主键：77',1,'2017-12-27 06:21:25'),(90,'admin','::1','添加用户','添加成功，用户主键：78',1,'2017-12-27 06:23:36'),(91,'admin','::1','查询用户','查询条件：1=1 排序：AddDate desc 页码/每页大小：1 20',1,'2017-12-27 06:28:10'),(92,'admin','::1','添加用户','添加成功，用户主键：79',1,'2017-12-27 06:28:19'),(93,'admin','::1','查询用户','查询条件：1=1 排序：AddDate desc 页码/每页大小：1 20',1,'2017-12-27 06:28:33'),(94,'admin','::1','查询用户','查询条件：1=1 排序：AddDate desc 页码/每页大小：1 20',1,'2017-12-27 06:28:56'),(95,'admin','::1','查询用户','查询条件：1=1 排序：AddDate desc 页码/每页大小：1 20',1,'2017-12-27 06:30:40'),(96,'admin','::1','添加用户','添加成功，用户主键：80',1,'2017-12-27 06:30:53'),(97,'admin','::1','查询用户','查询条件：1=1 排序：AddDate desc 页码/每页大小：1 20',1,'2017-12-27 06:30:55'),(98,NULL,'::1','按钮功能异常','Object reference not set to an instance of an object.',0,'2017-12-27 06:31:26'),(99,NULL,'::1','按钮功能异常','Object reference not set to an instance of an object.',0,'2017-12-27 06:31:33'),(100,'admin','::1','查询用户','查询条件：1=1 排序：AddDate desc 页码/每页大小：1 20',1,'2017-12-27 06:32:57'),(101,'admin','::1','查询用户','查询条件：1=1 排序：AddDate desc 页码/每页大小：1 20',1,'2017-12-27 06:33:04'),(102,'admin','::1','添加用户','添加成功，用户主键：81',1,'2017-12-27 06:33:14'),(103,'admin','::1','查询用户','查询条件：1=1 排序：AddDate desc 页码/每页大小：1 20',1,'2017-12-27 06:33:28'),(104,'admin','::1','添加用户','添加成功，用户主键：82',1,'2017-12-27 06:33:33'),(105,'admin','::1','查询用户','查询条件：1=1 排序：AddDate desc 页码/每页大小：1 20',1,'2017-12-27 06:37:48'),(106,'admin','::1','添加用户','添加成功，用户主键：83',1,'2017-12-27 06:38:03'),(107,'admin','::1','查询用户','查询条件：1=1 排序：AddDate desc 页码/每页大小：1 20',1,'2017-12-27 06:38:16'),(108,'admin','::1','用户功能异常','已经存在此用户！',0,'2017-12-27 06:38:47'),(109,'admin','::1','查询用户','查询条件：1=1 排序：AddDate desc 页码/每页大小：1 20',1,'2017-12-27 06:51:15'),(110,'admin','::1','查询角色','查询条件：1=1 排序：AddDate asc 页码/每页大小：1 20',1,'2017-12-27 06:54:29'),(111,'admin','::1','查询用户','查询条件：1=1 排序：AddDate desc 页码/每页大小：1 20',1,'2017-12-27 06:54:29'),(112,'admin','::1','查询用户','查询条件：1=1 排序：AddDate desc 页码/每页大小：1 20',1,'2017-12-27 06:59:21'),(113,'admin','::1','修改用户','修改成功，用户主键：88',1,'2017-12-27 06:59:28'),(114,'admin','::1','查询用户','查询条件：1=1 and UserId like \'%wer%\' 排序：AddDate desc 页码/每页大小：1 20',1,'2017-12-27 06:59:45'),(115,'admin','::1','查询用户','查询条件：1=1 排序：AddDate desc 页码/每页大小：1 20',1,'2017-12-27 07:17:22'),(116,'admin','::1','查询用户','查询条件：1=1 排序：AddDate desc 页码/每页大小：1 20',1,'2017-12-27 07:23:10'),(117,'admin','::1','查询用户','查询条件：1=1 排序：AddDate desc 页码/每页大小：1 20',1,'2017-12-27 07:28:25'),(118,'admin','::1','用户功能异常','已经存在此用户！',0,'2017-12-27 07:28:30'),(119,'admin','::1','查询用户','查询条件：1=1 排序：AddDate desc 页码/每页大小：1 20',1,'2017-12-27 07:32:09'),(120,'admin','::1','用户功能异常','已经存在此用户！',0,'2017-12-27 07:32:29'),(121,'admin','::1','用户功能异常','已经存在此用户！',0,'2017-12-27 07:32:42'),(122,'admin','::1','查询用户','查询条件：1=1 排序：AddDate desc 页码/每页大小：1 20',1,'2017-12-27 07:33:03'),(123,'admin','::1','查询用户','查询条件：1=1 排序：AddDate desc 页码/每页大小：1 20',1,'2017-12-27 07:33:54'),(124,'admin','::1','查询用户','查询条件：1=1 排序：AddDate desc 页码/每页大小：1 20',1,'2017-12-27 07:35:44'),(125,'admin','::1','修改用户','修改成功，用户主键：90',1,'2017-12-27 07:35:52'),(126,'admin','::1','查询用户','查询条件：1=1 排序：AddDate desc 页码/每页大小：1 20',1,'2017-12-27 07:35:52'),(127,'admin','::1','查询用户','查询条件：1=1 排序：AddDate desc 页码/每页大小：1 20',1,'2017-12-27 07:52:03'),(128,'admin','::1','删除用户','删除成功，用户主键：91,90,89,88,87,86,85,84,83,82,81,80,79,78,77',1,'2017-12-27 07:52:21'),(129,'admin','::1','查询用户','查询条件：1=1 排序：AddDate desc 页码/每页大小：1 20',1,'2017-12-27 07:52:21'),(130,'admin','::1','查询菜单','查询条件：1=1 排序：ParentId asc,Sort asc 页码/每页大小：1 20',1,'2017-12-27 07:52:47'),(131,'admin','::1','查询角色','查询条件：1=1 排序：AddDate asc 页码/每页大小：1 20',1,'2017-12-27 07:53:02'),(132,'admin','::1','查询角色','查询条件：1=1 排序：AddDate asc 页码/每页大小：1 20',1,'2017-12-27 07:53:36'),(133,'admin','::1','查询角色用户','查询角色Id：1 排序：AddDate asc 页码/每页大小：1 20',1,'2017-12-27 07:53:41'),(134,'admin','::1','修改角色','修改成功，角色主键：1',1,'2017-12-27 07:53:45'),(135,'admin','::1','修改角色','修改成功，角色主键：1',1,'2017-12-27 07:54:11'),(136,'admin','::1','修改角色','修改成功，角色主键：1',1,'2017-12-27 07:55:16'),(137,'admin','::1','查询角色','查询条件：1=1 排序：AddDate asc 页码/每页大小：1 20',1,'2017-12-27 07:55:29'),(138,'admin','::1','添加角色','添加成功，角色主键：53',1,'2017-12-27 07:55:37'),(139,'admin','::1','查询角色','查询条件：1=1 排序：AddDate asc 页码/每页大小：1 20',1,'2017-12-27 07:56:15'),(140,'admin','::1','查询角色用户','查询角色Id：52 排序：AddDate asc 页码/每页大小：1 20',1,'2017-12-27 07:56:19'),(141,'admin','::1','修改角色','修改成功，角色主键：52',1,'2017-12-27 07:56:28'),(142,'admin','::1','查询角色','查询条件：1=1 排序：AddDate asc 页码/每页大小：1 20',1,'2017-12-27 07:57:15'),(143,'admin','::1','查询角色用户','查询角色Id：1 排序：AddDate asc 页码/每页大小：1 20',1,'2017-12-27 07:57:20'),(144,'admin','::1','修改角色','修改成功，角色主键：1',1,'2017-12-27 07:57:22'),(145,'admin','::1','查询角色','查询条件：1=1 排序：AddDate asc 页码/每页大小：1 20',1,'2017-12-27 07:57:22'),(146,'admin','::1','查询角色用户','查询角色Id：52 排序：AddDate asc 页码/每页大小：1 20',1,'2017-12-27 07:57:41'),(147,'admin','::1','查询角色用户','查询角色Id：53 排序：AddDate asc 页码/每页大小：1 20',1,'2017-12-27 07:57:42'),(148,'admin','::1','查询角色用户','查询角色Id：1 排序：AddDate asc 页码/每页大小：1 20',1,'2017-12-27 07:57:45'),(149,'admin','::1','查询按钮','查询条件：1=1 排序：Sort asc 页码/每页大小：1 20',1,'2017-12-27 08:08:26'),(150,'admin','::1','查询角色','查询条件：1=1 排序：AddDate asc 页码/每页大小：1 20',1,'2017-12-27 08:08:37'),(151,'admin','::1','查询角色用户','查询角色Id：1 排序：AddDate asc 页码/每页大小：1 20',1,'2017-12-27 08:08:38'),(152,'admin','::1','查询角色用户','查询角色Id：52 排序：AddDate asc 页码/每页大小：1 20',1,'2017-12-27 08:08:48'),(153,'admin','::1','查询角色用户','查询角色Id：1 排序：AddDate asc 页码/每页大小：1 20',1,'2017-12-27 08:08:50'),(154,'admin','::1','查询角色用户','查询角色Id：52 排序：AddDate asc 页码/每页大小：1 20',1,'2017-12-27 08:08:51'),(155,'admin','::1','查询角色用户','查询角色Id：1 排序：AddDate asc 页码/每页大小：1 20',1,'2017-12-27 08:08:52'),(156,'admin','::1','查询部门','查询条件：1=1',1,'2017-12-27 08:10:09'),(157,'admin','::1','查询部门用户','查询部门Id：8,7,46,10,9,2 排序：AddDate asc 页码/每页大小：1 20',1,'2017-12-27 08:10:12'),(158,'admin','::1','查询部门用户','查询部门Id：8 排序：AddDate asc 页码/每页大小：1 20',1,'2017-12-27 08:10:14'),(159,'admin','::1','查询部门用户','查询部门Id：7 排序：AddDate asc 页码/每页大小：1 20',1,'2017-12-27 08:10:18'),(160,'admin','::1','查询部门用户','查询部门Id：8,7,46,10,9,2 排序：AddDate asc 页码/每页大小：1 20',1,'2017-12-27 08:10:25'),(161,'admin','::1','查询部门','查询条件：1=1',1,'2017-12-27 08:10:58'),(162,'admin','::1','查询部门','查询条件：1=1',1,'2017-12-27 08:11:23'),(163,'admin','::1','查询用户','查询条件：1=1 排序：AddDate desc 页码/每页大小：1 20',1,'2017-12-27 08:11:31'),(164,'admin','::1','查询用户','查询条件：1=1 排序：AddDate desc 页码/每页大小：1 20',1,'2017-12-27 08:12:56'),(165,'admin','::1','查询用户','查询条件：1=1 排序：AddDate desc 页码/每页大小：1 20',1,'2017-12-27 08:16:24'),(166,'admin','::1','设置用户角色','设置成功，用户主键：76 角色主键：1',1,'2017-12-27 08:17:34'),(167,'admin','::1','查询用户','查询条件：1=1 排序：AddDate desc 页码/每页大小：1 20',1,'2017-12-27 08:17:34'),(168,'admin','::1','查询按钮','查询条件：1=1 排序：Sort asc 页码/每页大小：1 20',1,'2017-12-27 08:18:02'),(169,'admin','::1','查询菜单','查询条件：1=1 排序：ParentId asc,Sort asc 页码/每页大小：1 20',1,'2017-12-27 08:18:10'),(170,'admin','::1','查询登陆日志','查询条件：1=1 排序：LoginDate desc 页码/每页大小：1 20',1,'2017-12-27 08:18:41'),(171,'admin','::1','查询操作日志','查询条件：1=1 排序：OperateDate desc 页码/每页大小：1 20',1,'2017-12-27 08:19:31'),(172,'admin','::1','查询操作日志','查询条件：1=1 排序：OperateDate desc 页码/每页大小：2 20',1,'2017-12-27 08:20:09'),(173,'admin','::1','查询操作日志','查询条件：1=1 排序：OperateDate desc 页码/每页大小：3 20',1,'2017-12-27 08:20:14'),(174,'admin','::1','查询用户','查询条件：1=1 排序：AddDate desc 页码/每页大小：1 20',1,'2017-12-27 08:49:26'),(175,'admin','::1','查询按钮','查询条件：1=1 排序：Sort asc 页码/每页大小：1 20',1,'2017-12-27 08:49:37'),(176,'admin','::1','查询角色','查询条件：1=1 排序：AddDate asc 页码/每页大小：1 20',1,'2017-12-27 08:49:39'),(177,'admin','::1','查询部门','查询条件：1=1',1,'2017-12-27 08:49:41'),(178,'admin','::1','查询部门用户','查询部门Id：7 排序：AddDate asc 页码/每页大小：1 20',1,'2017-12-27 08:49:48'),(179,'admin','::1','查询菜单','查询条件：1=1 排序：ParentId asc,Sort asc 页码/每页大小：1 20',1,'2017-12-27 08:59:54'),(180,'admin','::1','查询我的信息','查询我的信息',1,'2017-12-27 09:00:01'),(181,'admin','::1','用户修改密码','修改成功，用户主键：72',1,'2017-12-27 09:02:42'),(182,'admin','::1','用户修改密码','修改成功，用户主键：72',1,'2017-12-27 09:03:06'),(183,'admin','::1','查询菜单','查询条件：1=1 排序：ParentId asc,Sort asc 页码/每页大小：1 20',1,'2017-12-27 09:03:22'),(184,'admin','::1','查询菜单','查询条件：1=1 排序：ParentId asc,Sort asc 页码/每页大小：1 20',1,'2017-12-27 09:12:20'),(185,'admin','::1','查询按钮','查询条件：1=1 排序：Sort asc 页码/每页大小：1 20',1,'2017-12-29 00:52:09'),(186,'admin','::1','查询用户','查询条件：1=1 排序：AddDate desc 页码/每页大小：1 20',1,'2017-12-29 00:52:24'),(187,'admin','::1','查询部门','查询条件：1=1',1,'2017-12-29 00:52:34'),(188,'admin','::1','查询部门用户','查询部门Id：9 排序：AddDate asc 页码/每页大小：1 20',1,'2017-12-29 00:52:36'),(189,'admin','::1','查询部门用户','查询部门Id：10 排序：AddDate asc 页码/每页大小：1 20',1,'2017-12-29 00:52:38'),(190,'admin','::1','查询部门用户','查询部门Id：8 排序：AddDate asc 页码/每页大小：1 20',1,'2017-12-29 00:52:57'),(191,'admin','::1','查询角色','查询条件：1=1 排序：AddDate asc 页码/每页大小：1 20',1,'2017-12-29 00:53:26'),(192,'admin','::1','查询角色用户','查询角色Id：1 排序：AddDate asc 页码/每页大小：1 20',1,'2017-12-29 00:53:27'),(193,'admin','::1','查询登陆日志','查询条件：1=1 排序：LoginDate desc 页码/每页大小：1 20',1,'2017-12-29 00:53:47'),(194,'admin','::1','查询操作日志','查询条件：1=1 排序：OperateDate desc 页码/每页大小：1 20',1,'2017-12-29 00:54:20'),(195,'admin','::1','查询登陆日志','查询条件：1=1 排序：LoginDate desc 页码/每页大小：1 20',1,'2017-12-29 00:56:29'),(196,'admin','::1','查询按钮','查询条件：1=1 排序：Sort asc 页码/每页大小：1 20',1,'2017-12-29 01:30:43'),(197,'admin','::1','查询按钮','查询条件：1=1 排序：Sort asc 页码/每页大小：1 20',1,'2017-12-29 05:30:10'),(198,'admin','::1','查询按钮','查询条件：1=1 排序：Description asc 页码/每页大小：1 20',1,'2017-12-29 05:30:15'),(199,'admin','::1','查询按钮','查询条件：1=1 排序：AddDate asc 页码/每页大小：1 20',1,'2017-12-29 05:30:17'),(200,'admin','::1','查询按钮','查询条件：1=1 排序：AddDate desc 页码/每页大小：1 20',1,'2017-12-29 05:30:18'),(201,'admin','::1','查询按钮','查询条件：1=1 排序：AddDate asc 页码/每页大小：1 20',1,'2017-12-29 05:30:19'),(202,'admin','::1','查询按钮','查询条件：1=1 排序：AddDate desc 页码/每页大小：1 20',1,'2017-12-29 05:30:20'),(203,'admin','::1','查询按钮','查询条件：1=1 排序：Sort asc 页码/每页大小：1 20',1,'2018-01-09 03:40:47'),(204,'admin','::1','查询菜单','查询条件：1=1 排序：ParentId asc,Sort asc 页码/每页大小：1 20',1,'2018-01-09 03:40:48'),(205,'admin','::1','查询我的信息','查询我的信息',1,'2018-01-09 03:41:01'),(206,'admin','::1','查询角色','查询条件：1=1 排序：AddDate asc 页码/每页大小：1 20',1,'2018-01-09 03:41:40'),(207,'admin','::1','查询操作日志','查询条件：1=1 排序：OperateDate desc 页码/每页大小：1 20',1,'2018-01-09 03:41:46'),(208,'admin','::1','查询登陆日志','查询条件：1=1 排序：LoginDate desc 页码/每页大小：1 20',1,'2018-01-09 03:42:06'),(209,'admin','::1','查询按钮','查询条件：1=1 排序：Sort asc 页码/每页大小：1 20',1,'2018-01-09 08:40:51'),(210,'admin','::1','查询菜单','查询条件：1=1 排序：ParentId asc,Sort asc 页码/每页大小：1 20',1,'2018-01-09 08:41:44'),(211,'admin','::1','查询登陆日志','查询条件：1=1 排序：LoginDate desc 页码/每页大小：1 20',1,'2018-01-09 08:42:04'),(212,'admin','::1','查询用户','查询条件：1=1 排序：AddDate desc 页码/每页大小：1 20',1,'2018-01-09 08:42:11'),(213,'admin','::1','查询角色','查询条件：1=1 排序：AddDate asc 页码/每页大小：1 20',1,'2018-01-09 08:42:53'),(214,'admin','::1','查询角色用户','查询角色Id：1 排序：AddDate asc 页码/每页大小：1 20',1,'2018-01-09 08:42:56'),(215,'admin','::1','查询角色','查询条件：1=1 排序：AddDate asc 页码/每页大小：1 20',1,'2018-01-09 08:46:27'),(216,'admin','::1','查询角色用户','查询角色Id：1 排序：AddDate asc 页码/每页大小：1 20',1,'2018-01-09 08:46:33'),(217,'admin','::1','角色授权','授权成功，菜单/按钮Id：7 1,7 3,7 4,7 5,3 1,3 3,3 4,3 5,3 10,4 1,4 3,4 4,4 5,4 8,4 7,6 1,6 3,6 4,6 5,6 9,5 1,5 3,5 4,5 5,5 11,5 12,8 1,8 6,9 1,10 1,10 3,10 4,10 6',1,'2018-01-09 08:46:48'),(218,'admin','::1','查询菜单','查询条件：1=1 排序：ParentId desc,Sort asc 页码/每页大小：1 20',1,'2018-01-09 08:52:31'),(219,'admin','::1','查询菜单','查询条件：1=1 排序：Sort asc 页码/每页大小：1 20',1,'2018-01-09 08:52:32'),(220,'admin','::1','查询菜单','查询条件：1=1 排序：Sort asc,ParentId asc 页码/每页大小：1 20',1,'2018-01-09 08:52:34'),(221,'admin','::1','查询菜单','查询条件：1=1 排序：ParentId asc,Sort asc 页码/每页大小：1 20',1,'2018-01-09 09:00:39'),(222,'admin','::1','查询角色','查询条件：1=1 排序：AddDate asc 页码/每页大小：1 20',1,'2018-01-09 09:09:42'),(223,'admin','::1','查询角色','查询条件：1=1 排序：AddDate asc 页码/每页大小：1 20',1,'2018-01-09 09:19:48'),(224,'admin','::1','查询用户','查询条件：1=1 排序：AddDate desc 页码/每页大小：1 20',1,'2018-01-09 09:22:32'),(225,'admin','::1','查询用户','查询条件：1=1 排序：AddDate desc 页码/每页大小：1 20',1,'2018-01-09 09:23:02'),(226,'admin','::1','查询用户','查询条件：1=1 排序：AddDate desc 页码/每页大小：1 20',1,'2018-01-09 09:23:31'),(227,'admin','::1','查询用户','查询条件：1=1 排序：AddDate desc 页码/每页大小：1 20',1,'2018-01-09 09:24:03'),(228,'admin','::1','查询用户','查询条件：1=1 排序：AddDate desc 页码/每页大小：1 20',1,'2018-01-09 09:26:43'),(229,'admin','::1','查询用户','查询条件：1=1 排序：AddDate desc 页码/每页大小：1 20',1,'2018-01-09 09:27:12'),(230,'admin','::1','查询用户','查询条件：1=1 排序：AddDate desc 页码/每页大小：1 20',1,'2018-01-09 09:28:10'),(231,'admin','::1','查询用户','查询条件：1=1 排序：AddDate desc 页码/每页大小：1 20',1,'2018-01-09 09:28:42'),(232,'admin','::1','查询菜单','查询条件：1=1 排序：ParentId asc,Sort asc 页码/每页大小：1 20',1,'2018-01-10 01:58:44'),(233,'admin','::1','查询用户','查询条件：1=1 排序：AddDate desc 页码/每页大小：1 20',1,'2018-01-10 01:58:47'),(234,'admin','::1','查询角色','查询条件：1=1 排序：AddDate asc 页码/每页大小：1 20',1,'2018-01-10 01:59:02'),(235,'admin','::1','查询角色用户','查询角色Id：1 排序：AddDate asc 页码/每页大小：1 20',1,'2018-01-10 01:59:03'),(236,'admin','::1','查询用户','查询条件：1=1 排序：AddDate desc 页码/每页大小：1 20',1,'2018-01-10 02:05:17'),(237,'admin','::1','查询用户','查询条件：1=1 排序：AddDate desc 页码/每页大小：1 20',1,'2018-01-10 02:06:52'),(238,'admin','::1','查询用户','查询条件：1=1 排序：AddDate desc 页码/每页大小：1 20',1,'2018-01-10 02:07:58'),(239,'admin','::1','查询用户','查询条件：1=1 排序：AddDate desc 页码/每页大小：1 20',1,'2018-01-10 02:14:10'),(240,'admin','::1','设置用户角色','设置成功，用户主键：92 角色主键：53',1,'2018-01-10 02:15:10'),(241,'admin','::1','查询用户','查询条件：1=1 排序：AddDate desc 页码/每页大小：1 20',1,'2018-01-10 02:15:10'),(242,'admin','::1','查询菜单','查询条件：1=1 排序：ParentId asc,Sort asc 页码/每页大小：1 20',1,'2018-01-10 02:30:37'),(243,'admin','::1','查询菜单','查询条件：1=1 排序：ParentId asc,Sort asc 页码/每页大小：1 20',1,'2018-01-10 02:31:07'),(244,'admin','::1','菜单功能异常','Invalid column name \'MODEL\'.',0,'2018-01-10 02:32:00'),(245,'admin','::1','查询菜单','查询条件：1=1 排序：ParentId asc,Sort asc 页码/每页大小：1 20',1,'2018-01-10 02:33:40'),(246,'admin','::1','查询菜单','查询条件：1=1 排序：ParentId asc,Sort asc,MODEL asc 页码/每页大小：1 20',1,'2018-01-10 02:33:54'),(247,'admin','::1','查询菜单','查询条件：1=1 排序：ParentId asc,Sort asc 页码/每页大小：1 20',1,'2018-01-10 02:35:14'),(248,'admin','::1','查询用户','查询条件：1=1 排序：AddDate desc 页码/每页大小：1 20',1,'2018-01-10 03:10:05'),(249,'admin','::1','修改用户','修改成功，用户主键：72',1,'2018-01-10 03:10:25'),(250,'admin','::1','查询用户','查询条件：1=1 排序：AddDate desc 页码/每页大小：1 20',1,'2018-01-10 03:10:26'),(251,'admin','::1','查询部门','查询条件：1=1',1,'2018-01-10 03:10:36'),(252,'admin','::1','查询部门用户','查询部门Id：15 排序：AddDate asc 页码/每页大小：1 20',1,'2018-01-10 03:10:39'),(253,'admin','::1','修改部门','修改成功，部门主键：15',1,'2018-01-10 03:10:56'),(254,'admin','::1','查询部门','查询条件：1=1',1,'2018-01-10 03:10:56'),(255,'admin','::1','查询菜单','查询条件：1=1 排序：ParentId asc,Sort asc 页码/每页大小：1 20',1,'2018-01-10 03:16:09');
/*!40000 ALTER TABLE `tbuseroperatelog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbuserrole`
--

DROP TABLE IF EXISTS `tbuserrole`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbuserrole` (
  `UserId` int(11) DEFAULT NULL,
  `RoleId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbuserrole`
--

LOCK TABLES `tbuserrole` WRITE;
/*!40000 ALTER TABLE `tbuserrole` DISABLE KEYS */;
INSERT INTO `tbuserrole` VALUES (74,52),(72,1),(76,1),(92,53);
/*!40000 ALTER TABLE `tbuserrole` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'zgzy'
--

--
-- Dumping routines for database 'zgzy'
--
/*!50003 DROP PROCEDURE IF EXISTS `pr_pager` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pr_pager`(

    IN    p_table_name        VARCHAR(1024),        
    IN    p_fields            VARCHAR(1024),        
    IN    p_page_size            INT,                
    IN    p_page_now            INT,                
    IN    p_order_string        VARCHAR(128),        
    IN    p_where_string        VARCHAR(1024),        
     OUT    p_out_rows            INT                    

)
    COMMENT '分页存储过程'
BEGIN


    DECLARE m_begin_row INT DEFAULT 0;
    DECLARE m_limit_string CHAR(64);


    SET m_begin_row = (p_page_now - 1) * p_page_size;
    SET m_limit_string = CONCAT(' LIMIT ', m_begin_row, ', ', p_page_size);

    SET @COUNT_STRING = CONCAT('SELECT COUNT(*) INTO @ROWS_TOTAL FROM ', p_table_name, ' ', p_where_string);
    SET @MAIN_STRING = CONCAT('SELECT ', p_fields, ' FROM ', p_table_name, ' ', p_where_string, ' ', p_order_string,m_limit_string);


    PREPARE count_stmt FROM @COUNT_STRING;
    EXECUTE count_stmt;
    DEALLOCATE PREPARE count_stmt;
    SET p_out_rows = @ROWS_TOTAL;

    PREPARE main_stmt FROM @MAIN_STRING;
    EXECUTE main_stmt;
    DEALLOCATE PREPARE main_stmt;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_checklogin` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`michael`@`%` PROCEDURE `sp_checklogin`(IN ip nvarchar(50),OUT lastErrorLoginTime datetime )
BEGIN
declare errorLoginCount int;
select errorLoginCount = Count(1) from tbLoginLog where Success = 0 and DATE_ADD(LoginDate,INTERVAL 30 minute) > NOW() and UserIp = ip;
if errorLoginCount>=5 then
 
 select  lastErrorLoginTime = T.LoginDate 
 from (select  LoginDate from tbLoginLog where UserIp = ip order by LoginDate desc limit 0,5 ) T order by LoginDate asc limit 0,1;  
else 
 set lastErrorLoginTime = null ; 
end if;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-02-12  9:25:44
