-- MySQL dump 10.13  Distrib 8.4.10, for Linux (aarch64)
--
-- Host: localhost    Database: leantime_db
-- ------------------------------------------------------
-- Server version	8.4.10

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
-- Table structure for table `zp_access_tokens`
--

DROP TABLE IF EXISTS `zp_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zp_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zp_access_tokens`
--

LOCK TABLES `zp_access_tokens` WRITE;
/*!40000 ALTER TABLE `zp_access_tokens` DISABLE KEYS */;
INSERT INTO `zp_access_tokens` VALUES (3,'Leantime\\Domain\\Auth\\Services\\Auth',1,'Leantime Work Archive','61476b647735c2511a214933092c6b3db31eea65f18fe475f79878263d8c6f0e','[\"*\"]','2026-07-30 21:07:05',NULL,'2026-07-24 14:34:31',NULL);
/*!40000 ALTER TABLE `zp_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zp_approvals`
--

DROP TABLE IF EXISTS `zp_approvals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zp_approvals` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `module` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `entityId` int DEFAULT NULL,
  `requestorId` int DEFAULT NULL,
  `approverId` int DEFAULT NULL,
  `approvalStatus` int DEFAULT NULL,
  `requestedOn` datetime DEFAULT NULL,
  `lastStatusChange` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zp_approvals`
--

LOCK TABLES `zp_approvals` WRITE;
/*!40000 ALTER TABLE `zp_approvals` DISABLE KEYS */;
/*!40000 ALTER TABLE `zp_approvals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zp_audit`
--

DROP TABLE IF EXISTS `zp_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zp_audit` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `userId` int DEFAULT NULL,
  `projectId` int DEFAULT NULL,
  `action` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `entity` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `entityId` int DEFAULT NULL,
  `values` text COLLATE utf8mb4_unicode_ci,
  `date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_audit_projectId` (`projectId`),
  KEY `idx_audit_projectAction` (`projectId`,`action`),
  KEY `idx_audit_projectEntityEntityId` (`projectId`,`entity`,`entityId`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zp_audit`
--

LOCK TABLES `zp_audit` WRITE;
/*!40000 ALTER TABLE `zp_audit` DISABLE KEYS */;
INSERT INTO `zp_audit` VALUES (1,1,1,'article.create','article',2,'{\"title\":\"Untitled\"}','2026-07-17 19:50:55'),(2,1,1,'article.title','article',2,'{\"from\":\"Untitled\",\"to\":\"sample\"}','2026-07-17 19:51:05'),(3,1,1,'article.edit','article',2,'','2026-07-17 19:51:17'),(4,1,1,'article.edit','article',2,'','2026-07-17 19:51:35'),(5,1,1,'article.edit','article',2,'','2026-07-17 19:51:37'),(6,1,1,'article.edit','article',2,'','2026-07-17 19:51:38'),(7,1,3,'article.create','article',6,'{\"title\":\"Untitled\"}','2026-07-30 12:59:33'),(8,1,2,'article.create','article',7,'{\"title\":\"Untitled\"}','2026-07-30 13:13:17'),(9,1,2,'article.edit','article',7,'','2026-07-30 13:13:20'),(10,1,2,'article.edit','article',7,'','2026-07-30 13:13:24'),(11,1,2,'article.edit','article',7,'','2026-07-30 13:13:33'),(12,1,2,'article.title','article',7,'{\"from\":\"Untitled\",\"to\":\"\\ud83d\\udcd1 RFP Extraction Summary: [Project \\/ Client Name]\"}','2026-07-30 13:13:48'),(13,1,2,'article.edit','article',7,'','2026-07-30 13:15:12'),(14,1,2,'article.edit','article',7,'','2026-07-30 13:15:26'),(15,1,2,'article.edit','article',7,'','2026-07-30 13:15:54'),(16,1,2,'article.edit','article',7,'','2026-07-30 13:16:00'),(17,1,2,'article.edit','article',7,'','2026-07-30 13:16:02'),(18,1,2,'article.edit','article',7,'','2026-07-30 13:16:05'),(19,1,2,'article.edit','article',7,'','2026-07-30 13:16:07'),(20,1,2,'article.edit','article',7,'','2026-07-30 13:16:10'),(21,1,2,'article.edit','article',7,'','2026-07-30 13:16:12'),(22,1,2,'article.edit','article',7,'','2026-07-30 13:16:19'),(23,1,2,'article.status','article',7,'{\"from\":\"draft\",\"to\":\"published\"}','2026-07-30 13:30:12'),(24,1,2,'article.status','article',7,'{\"from\":\"published\",\"to\":\"draft\"}','2026-07-30 13:30:17'),(25,1,2,'article.create','article',12,'{\"title\":\"Untitled\"}','2026-08-16 17:18:40'),(26,1,2,'article.title','article',12,'{\"from\":\"Untitled\",\"to\":\"Training Schedule\"}','2026-08-16 17:18:48'),(27,1,2,'article.edit','article',12,'','2026-08-16 17:18:51'),(28,1,2,'article.delete','article',12,'','2026-08-16 17:19:09'),(29,1,2,'article.delete','article',7,'','2026-08-16 17:19:12');
/*!40000 ALTER TABLE `zp_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zp_calendar`
--

DROP TABLE IF EXISTS `zp_calendar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zp_calendar` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `userId` int DEFAULT NULL,
  `dateFrom` datetime DEFAULT NULL,
  `dateTo` datetime DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `kind` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `allDay` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_calendar_userId_dateFrom_dateTo` (`userId`,`dateFrom`,`dateTo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zp_calendar`
--

LOCK TABLES `zp_calendar` WRITE;
/*!40000 ALTER TABLE `zp_calendar` DISABLE KEYS */;
/*!40000 ALTER TABLE `zp_calendar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zp_canvas`
--

DROP TABLE IF EXISTS `zp_canvas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zp_canvas` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `author` int DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `projectId` int DEFAULT NULL,
  `type` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `color` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT 'ocean',
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ProjectIdType` (`projectId`,`type`),
  KEY `idx_canvas_type_id` (`type`,`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zp_canvas`
--

LOCK TABLES `zp_canvas` WRITE;
/*!40000 ALTER TABLE `zp_canvas` DISABLE KEYS */;
INSERT INTO `zp_canvas` VALUES (1,'My Goals',1,'2026-07-17 19:41:11',1,'goalcanvas','','ocean',NULL),(2,'Board',1,'2026-07-17 19:50:31',1,'idea',NULL,'ocean',NULL),(3,'Default',1,'2026-07-17 00:00:00',1,'wiki',NULL,'ocean',NULL),(4,'Default',1,'2026-07-26 00:00:00',2,'wiki',NULL,'ocean',NULL),(5,'Board',1,'2026-07-26 18:14:34',2,'goalcanvas','','ocean',NULL),(6,'Board',1,'2026-07-29 11:07:54',3,'idea',NULL,'ocean',NULL),(7,'Board',1,'2026-07-29 11:07:55',3,'goalcanvas','','ocean',NULL),(8,'Default',1,'2026-07-30 00:00:00',3,'wiki',NULL,'ocean',NULL),(9,'Board',1,'2026-07-30 13:08:33',2,'idea',NULL,'ocean',NULL),(10,'Board',1,'2026-08-03 23:45:29',4,'goalcanvas','','ocean',NULL),(11,'Board',1,'2026-08-14 08:06:49',2,'valuecanvas','','ocean',NULL),(12,'Board',1,'2026-08-14 08:07:11',2,'logicmodelcanvas','','ocean',NULL),(13,'Board',1,'2026-08-14 08:07:24',2,'swotcanvas','','ocean',NULL),(14,'Board',1,'2026-08-14 08:07:35',2,'minempathycanvas','','ocean',NULL),(15,'Board',1,'2026-08-14 08:08:09',2,'riskscanvas','','ocean',NULL);
/*!40000 ALTER TABLE `zp_canvas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zp_canvas_items`
--

DROP TABLE IF EXISTS `zp_canvas_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zp_canvas_items` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `description` text COLLATE utf8mb4_unicode_ci,
  `assumptions` text COLLATE utf8mb4_unicode_ci,
  `data` text COLLATE utf8mb4_unicode_ci,
  `conclusion` text COLLATE utf8mb4_unicode_ci,
  `box` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `author` int DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `canvasId` int DEFAULT NULL,
  `sortindex` int DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `relates` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `milestoneId` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent` int DEFAULT NULL,
  `featured` int DEFAULT NULL,
  `tags` text COLLATE utf8mb4_unicode_ci,
  `kpi` int DEFAULT NULL,
  `data1` text COLLATE utf8mb4_unicode_ci,
  `data2` text COLLATE utf8mb4_unicode_ci,
  `data3` text COLLATE utf8mb4_unicode_ci,
  `data4` text COLLATE utf8mb4_unicode_ci,
  `data5` text COLLATE utf8mb4_unicode_ci,
  `startDate` datetime DEFAULT NULL,
  `endDate` datetime DEFAULT NULL,
  `setting` text COLLATE utf8mb4_unicode_ci,
  `metricType` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `startValue` decimal(10,2) DEFAULT NULL,
  `currentValue` decimal(10,2) DEFAULT NULL,
  `endValue` decimal(10,2) DEFAULT NULL,
  `impact` int DEFAULT NULL,
  `effort` int DEFAULT NULL,
  `probability` int DEFAULT NULL,
  `action` text COLLATE utf8mb4_unicode_ci,
  `assignedTo` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `CanvasLookUp` (`canvasId`,`box`),
  KEY `idx_canvas_items_box_milestoneId` (`box`,`milestoneId`),
  KEY `idx_canvas_items_box_status_author` (`box`,`status`,`author`),
  KEY `idx_canvas_items_parent_title` (`parent`,`title`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zp_canvas_items`
--

LOCK TABLES `zp_canvas_items` WRITE;
/*!40000 ALTER TABLE `zp_canvas_items` DISABLE KEYS */;
INSERT INTO `zp_canvas_items` VALUES (2,'<p><strong>How to create a more value to customers?</strong></p><p></p>',NULL,'far fa-file-alt',NULL,'article',1,'2026-07-17 00:00:00','2026-07-17 00:00:00',3,10,'draft',NULL,NULL,'sample',0,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(3,'Once i officially start working as an employee with everyday checkin and checkout','','','','goal',1,'2026-07-19 19:49:21','2026-08-12 16:52:04',1,NULL,'status_ontrack','','1','Start working as an HT employee',0,NULL,'',0,'',NULL,NULL,NULL,NULL,'2026-07-04 00:00:00','2026-08-15 23:59:59','','percent',0.00,0.00,100.00,0,0,0,'',0),(6,'',NULL,'far fa-file-alt',NULL,'article',1,'2026-07-30 00:00:00','2026-07-30 00:00:00',8,10,'draft',NULL,NULL,'Untitled',0,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(9,'When i learn all product lines, each 1 % increase means i learned something related to products','','','','goal',1,'2026-08-08 22:59:24','2026-08-13 17:02:16',5,NULL,'status_ontrack','','37','Formal Training and learning is over',0,NULL,'',0,'',NULL,NULL,NULL,NULL,'2026-08-03 00:00:00','2026-10-31 23:59:59','','percent',2.00,0.00,93.00,0,0,0,'',0),(10,'Hiding small things with the Boss- 盛总','<ul><li><p>Always think before what you do, if confusion or little knowledge ask for clarification and point out the issue clearly.</p></li><li><p>Practice thinking deep and analyzing the situations if this situation need to be shared with Boss or not. If there is a confusion just ask colleague for better thinking. If still not resolved just ask the Boss</p></li></ul>','<img src=\"http://localhost:8080/files/get?module=project&amp;encName=bf3b421b6aedcbf082d2b967b4ed7f1b&amp;ext=png&amp;realName=image.png\" alt=\"image.png\">','<ul><li><p>Even a simple thing that does not seem that important must be clarified with the Boss otherwise it will bite me later in the job</p></li></ul>','risks_imp_high_pro_high',1,'2026-08-14 02:22:41','2026-08-14 02:36:06',15,NULL,'status_valid','relates_environment','37','',0,NULL,'',0,'',NULL,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00','','',0.00,0.00,0.00,0,0,0,'',0),(11,'Money deductions From Salary related rules and regulation','<ul><li><p>Keep Room clean</p></li><li><p>Keep Restroom clean</p></li><li><p>No high power appliance in room</p></li><li><p>Keep all appliance off and unplugged when not in use</p></li><li><p>Remember to check in before 7:50 and after 17:40 everyday (except on holidays/weekends/business trip)</p></li><li><p>Remember to send Daily and Weekly report to Mr. Sheng and Mr. Lu.</p></li><li><p></p></li></ul>','<p>Pay attention to these documents</p><ul><li><p>亨通国际产业集团营销管理与商务共享通知 商务字〔2026〕39 号</p></li><li><p><span style=\"color: rgba(0, 0, 0, 0.85); font-family: &quot;PingFang SC&quot;, &quot;Source Han Sans&quot;, 思源黑体, &quot;Microsoft YaHei&quot;, 微软雅黑, Arial, &quot;sans-serif&quot;; font-size: 14px;\">行政外联字〔2026〕23号 关于7月份员工行为规范检查结果的通报</span><span style=\"color: transparent; font-family: sans-serif; font-size: 18.7333px;\">商</span></p></li><li><p><span style=\"color: transparent; font-family: sans-serif; font-size: 18.7333px;\">务字商务字〔2026〕39 号〔2026〕39 号</span> <span style=\"color: transparent; font-family: sans-serif; font-size: 18.7333px;\">商务字〔2026〕39 号</span></p></li></ul>','<p>If not paid attention the details of the these main rules and regulations, this might result in punishment resulting in ¥50 to increasing amount according to severity of the case</p><p></p><p></p>','risks_imp_high_pro_low',1,'2026-08-14 02:28:34','2026-08-16 17:13:20',15,NULL,'status_review','relates_environment','37','',0,NULL,'',0,'',NULL,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00','','',0.00,0.00,0.00,0,0,0,'',0);
/*!40000 ALTER TABLE `zp_canvas_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zp_clients`
--

DROP TABLE IF EXISTS `zp_clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zp_clients` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `street` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip` int DEFAULT NULL,
  `city` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `internet` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `published` int DEFAULT NULL,
  `age` int DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zp_clients`
--

LOCK TABLES `zp_clients` WRITE;
/*!40000 ALTER TABLE `zp_clients` DISABLE KEYS */;
INSERT INTO `zp_clients` VALUES (1,'HTGD','',0,'','','','','',NULL,NULL,'',NULL);
/*!40000 ALTER TABLE `zp_clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zp_comment`
--

DROP TABLE IF EXISTS `zp_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zp_comment` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `module` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `userId` int DEFAULT NULL,
  `commentParent` int DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `moduleId` int DEFAULT NULL,
  `text` text COLLATE utf8mb4_unicode_ci,
  `status` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_comment_moduleId_module_commentParent` (`moduleId`,`module`,`commentParent`),
  KEY `idx_comment_userId_module` (`userId`,`module`),
  KEY `idx_comment_moduleId_module_date` (`moduleId`,`module`,`date`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zp_comment`
--

LOCK TABLES `zp_comment` WRITE;
/*!40000 ALTER TABLE `zp_comment` DISABLE KEYS */;
INSERT INTO `zp_comment` VALUES (1,'ticket',1,0,'2026-08-17 00:13:41',61,'<p></p>','4'),(2,'ticket',1,0,'2026-08-17 00:16:05',56,'<p></p>','4'),(3,'ticket',1,0,'2026-08-17 00:16:21',55,'<p></p>','4'),(4,'ticket',1,0,'2026-08-17 00:17:07',56,'<p></p>','0'),(5,'ticket',1,0,'2026-08-17 00:19:45',62,'<p></p>','3'),(6,'ticket',1,0,'2026-08-17 01:17:31',63,'<p></p>','4');
/*!40000 ALTER TABLE `zp_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zp_entity_relationship`
--

DROP TABLE IF EXISTS `zp_entity_relationship`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zp_entity_relationship` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `entityA` int DEFAULT NULL,
  `entityAType` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `entityB` int DEFAULT NULL,
  `entityBType` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `relationship` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `createdOn` datetime DEFAULT NULL,
  `createdBy` int DEFAULT NULL,
  `meta` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `idx_entity_relationship_entityA` (`entityA`,`entityAType`,`relationship`),
  KEY `idx_entity_relationship_entityB` (`entityB`,`entityBType`,`relationship`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zp_entity_relationship`
--

LOCK TABLES `zp_entity_relationship` WRITE;
/*!40000 ALTER TABLE `zp_entity_relationship` DISABLE KEYS */;
/*!40000 ALTER TABLE `zp_entity_relationship` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zp_file`
--

DROP TABLE IF EXISTS `zp_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zp_file` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `module` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `moduleId` int DEFAULT NULL,
  `userId` int DEFAULT NULL,
  `extension` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `encName` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `realName` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_file_module_moduleId_userId` (`module`,`moduleId`,`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zp_file`
--

LOCK TABLES `zp_file` WRITE;
/*!40000 ALTER TABLE `zp_file` DISABLE KEYS */;
INSERT INTO `zp_file` VALUES (2,'user',1,1,'png','a24230477624807cc8673ce58973c1e4','userPicture.png','2026-07-17 19:48:52'),(3,'project',1,1,'pdf','9667556b091ccac73bd621fdf86a9943','04_IEC 60840-2023.pdf','2026-07-21 09:36:38'),(5,'project',1,1,'jpg','78dfb86ad47afbca345aad999c8aa078','cam-1784597906658.jpg','2026-07-21 09:38:26'),(6,'ticket',14,1,'png','618612c403f425db689f38a318c77268','47a1b617af151c3e4f4071aa8ec08b96.png','2026-07-21 14:34:09'),(7,'ticket',14,1,'png','474baf7c5d61cd315f44ebeca00b17a3','80af323d6622f994098892e483e030df.png','2026-07-21 02:11:42'),(8,'ticket',14,1,'png','8e1bd2f9a4b78d1adb03bf27bbf9ba7e','1732539d859fcd794b8334447aa81ecc.png','2026-07-22 00:56:08'),(9,'project',1,1,'jpg','d0110f8afc62a1e97a291da185607f9f','cam-1784788910779.jpg','2026-07-22 23:41:50'),(10,'project',1,1,'png','dee9fa5515eaca071cefa952e32a616a','1fbac60d2aa900eeb049fc3e3f79bfa1.png','2026-07-29 11:03:56'),(11,'project',2,1,'html','0c36a015422912fa911913f42dc7a9ef','rgb-lab.html','2026-08-02 22:20:42'),(12,'ticket',40,1,'png','9c2720fe4faea9b511585229565ee30d','1c3f8c3add377ccee4558def637967bc.png','2026-08-04 17:31:48'),(13,'ticket',27,1,'png','c2208c30ae5beda0a7715d264a599054','image.png','2026-08-12 16:50:42'),(14,'ticket',27,1,'png','270dbf14ae88655498d6848b51ef9a8e','image.png','2026-08-12 16:50:55'),(16,'project',2,1,'png','01ca36d466f72dfcdd61b2d8a20d3f5b','profileImage-2.png','2026-08-12 17:00:20'),(17,'ticket',55,1,'png','15a493eff46477c4e392d96afaae4b14','619ffd9941af4de8b52598d1ccc34302.png','2026-08-13 18:35:09'),(18,'ticket',55,1,'png','8cf70f40dcb05eaa8776d725b87e8f36','a38c54b8ccf2f8b9112a75e446afcec5.png','2026-08-13 18:35:59'),(19,'ticket',59,1,'png','0aceb3789f218b34d444823a03a41616','image.png','2026-08-13 19:14:58'),(20,'ticket',47,1,'png','b5ebe25109380e6bc16a56c2cb2adb0e','image.png','2026-08-13 19:58:50'),(21,'project',2,1,'png','bf3b421b6aedcbf082d2b967b4ed7f1b','image.png','2026-08-14 02:21:03'),(22,'project',2,1,'png','0ae45ac6f79c2f22f46b3c203e6d531e','image.png','2026-08-14 02:22:23');
/*!40000 ALTER TABLE `zp_file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zp_gcallinks`
--

DROP TABLE IF EXISTS `zp_gcallinks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zp_gcallinks` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `userId` int DEFAULT NULL,
  `url` text COLLATE utf8mb4_unicode_ci,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `colorClass` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_gcallinks_userId` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zp_gcallinks`
--

LOCK TABLES `zp_gcallinks` WRITE;
/*!40000 ALTER TABLE `zp_gcallinks` DISABLE KEYS */;
/*!40000 ALTER TABLE `zp_gcallinks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zp_integration`
--

DROP TABLE IF EXISTS `zp_integration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zp_integration` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `providerId` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `method` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `entity` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fields` text COLLATE utf8mb4_unicode_ci,
  `schedule` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `notes` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `auth` text COLLATE utf8mb4_unicode_ci,
  `meta` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `createdOn` datetime DEFAULT NULL,
  `createdBy` int DEFAULT NULL,
  `lastSync` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zp_integration`
--

LOCK TABLES `zp_integration` WRITE;
/*!40000 ALTER TABLE `zp_integration` DISABLE KEYS */;
/*!40000 ALTER TABLE `zp_integration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zp_jobs`
--

DROP TABLE IF EXISTS `zp_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zp_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint unsigned NOT NULL,
  `reserved_at` int unsigned DEFAULT NULL,
  `available_at` int unsigned NOT NULL,
  `created_at` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `zp_jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zp_jobs`
--

LOCK TABLES `zp_jobs` WRITE;
/*!40000 ALTER TABLE `zp_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `zp_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zp_note`
--

DROP TABLE IF EXISTS `zp_note`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zp_note` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `userId` int DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zp_note`
--

LOCK TABLES `zp_note` WRITE;
/*!40000 ALTER TABLE `zp_note` DISABLE KEYS */;
/*!40000 ALTER TABLE `zp_note` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zp_notifications`
--

DROP TABLE IF EXISTS `zp_notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zp_notifications` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `read` int DEFAULT NULL,
  `type` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `module` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `moduleId` int DEFAULT NULL,
  `datetime` datetime DEFAULT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `authorId` int DEFAULT NULL,
  `message` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `idx_notifications_userId` (`userId`),
  KEY `idx_notifications_userId_datetime` (`userId`,`datetime`),
  KEY `idx_notifications_userId_read` (`userId`,`read`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zp_notifications`
--

LOCK TABLES `zp_notifications` WRITE;
/*!40000 ALTER TABLE `zp_notifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `zp_notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zp_permissions`
--

DROP TABLE IF EXISTS `zp_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zp_permissions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `permissionKey` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `domain` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `action` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `isProjectScoped` tinyint NOT NULL DEFAULT '1',
  `createdOn` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_permissions_key` (`permissionKey`),
  KEY `idx_permissions_domain` (`domain`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zp_permissions`
--

LOCK TABLES `zp_permissions` WRITE;
/*!40000 ALTER TABLE `zp_permissions` DISABLE KEYS */;
INSERT INTO `zp_permissions` VALUES (1,'api.manage','api','manage','Manage API keys',0,'2026-07-17 16:52:14','2026-07-17 16:52:14'),(2,'blueprints.view','blueprints','view','View canvas boards',1,'2026-07-17 16:52:14','2026-07-17 16:52:14'),(3,'blueprints.create','blueprints','create','Create canvas boards and items',1,'2026-07-17 16:52:14','2026-07-17 16:52:14'),(4,'blueprints.edit','blueprints','edit','Edit canvas boards and items',1,'2026-07-17 16:52:14','2026-07-17 16:52:14'),(5,'blueprints.delete','blueprints','delete','Delete canvas boards and items',1,'2026-07-17 16:52:14','2026-07-17 16:52:14'),(6,'calendar.view','calendar','view','View your calendar',1,'2026-07-17 16:52:14','2026-07-17 16:52:14'),(7,'calendar.create','calendar','create','Add calendar events',1,'2026-07-17 16:52:14','2026-07-17 16:52:14'),(8,'calendar.edit','calendar','edit','Edit calendar events',1,'2026-07-17 16:52:14','2026-07-17 16:52:14'),(9,'calendar.delete','calendar','delete','Delete calendar events',1,'2026-07-17 16:52:14','2026-07-17 16:52:14'),(10,'calendar.manage','calendar','manage','Manage any user\'s calendar',0,'2026-07-17 16:52:14','2026-07-17 16:52:14'),(11,'clients.view','clients','view','View clients',0,'2026-07-17 16:52:14','2026-07-17 16:52:14'),(12,'clients.create','clients','create','Create clients',0,'2026-07-17 16:52:14','2026-07-17 16:52:14'),(13,'clients.edit','clients','edit','Edit clients',0,'2026-07-17 16:52:14','2026-07-17 16:52:14'),(14,'clients.delete','clients','delete','Delete clients',0,'2026-07-17 16:52:14','2026-07-17 16:52:14'),(15,'comments.view','comments','view','View comments',1,'2026-07-17 16:52:14','2026-07-17 16:52:14'),(16,'comments.create','comments','create','Add comments',1,'2026-07-17 16:52:14','2026-07-17 16:52:14'),(17,'comments.moderate','comments','moderate','Moderate (edit/delete) any comment',1,'2026-07-17 16:52:14','2026-07-17 16:52:14'),(18,'connector.manage','connector','manage','Manage integrations',0,'2026-07-17 16:52:14','2026-07-17 16:52:14'),(19,'files.view','files','view','View and download project files',1,'2026-07-17 16:52:14','2026-07-17 16:52:14'),(20,'files.upload','files','upload','Upload files to projects',1,'2026-07-17 16:52:14','2026-07-17 16:52:14'),(21,'files.delete','files','delete','Delete project files',1,'2026-07-17 16:52:14','2026-07-17 16:52:14'),(22,'goals.view','goals','view','View goals',1,'2026-07-17 16:52:14','2026-07-17 16:52:14'),(23,'goals.create','goals','create','Create goals and goal boards',1,'2026-07-17 16:52:14','2026-07-17 16:52:14'),(24,'goals.edit','goals','edit','Edit goals and goal boards',1,'2026-07-17 16:52:14','2026-07-17 16:52:14'),(25,'goals.delete','goals','delete','Delete goals and goal boards',1,'2026-07-17 16:52:14','2026-07-17 16:52:14'),(26,'ideas.view','ideas','view','View idea boards',1,'2026-07-17 16:52:14','2026-07-17 16:52:14'),(27,'ideas.create','ideas','create','Create idea boards and ideas',1,'2026-07-17 16:52:14','2026-07-17 16:52:14'),(28,'ideas.edit','ideas','edit','Edit ideas',1,'2026-07-17 16:52:14','2026-07-17 16:52:14'),(29,'ideas.delete','ideas','delete','Delete idea boards and ideas',1,'2026-07-17 16:52:14','2026-07-17 16:52:14'),(30,'plugins.manage','plugins','manage','Manage plugins',0,'2026-07-17 16:52:14','2026-07-17 16:52:14'),(31,'projects.view','projects','view','View a project',1,'2026-07-17 16:52:14','2026-07-17 16:52:14'),(32,'projects.create','projects','create','Create projects',0,'2026-07-17 16:52:14','2026-07-17 16:52:14'),(33,'projects.edit','projects','edit','Edit projects',0,'2026-07-17 16:52:14','2026-07-17 16:52:14'),(34,'projects.delete','projects','delete','Delete projects',0,'2026-07-17 16:52:14','2026-07-17 16:52:14'),(35,'reports.view','reports','view','View project reports',1,'2026-07-17 16:52:14','2026-07-17 16:52:14'),(36,'company.settings.view','company','settings.view','View company settings',0,'2026-07-17 16:52:14','2026-07-17 16:52:14'),(37,'company.settings.edit','company','settings.edit','Edit company settings',0,'2026-07-17 16:52:14','2026-07-17 16:52:14'),(38,'projectsettings.labels.manage','projectsettings','labels.manage','Rename project labels',1,'2026-07-17 16:52:14','2026-07-17 16:52:14'),(39,'sprints.view','sprints','view','View sprints',1,'2026-07-17 16:52:14','2026-07-17 16:52:14'),(40,'sprints.create','sprints','create','Create sprints',1,'2026-07-17 16:52:14','2026-07-17 16:52:14'),(41,'sprints.edit','sprints','edit','Edit sprints',1,'2026-07-17 16:52:14','2026-07-17 16:52:14'),(42,'sprints.delete','sprints','delete','Delete sprints',1,'2026-07-17 16:52:14','2026-07-17 16:52:14'),(43,'tickets.view','tickets','view','View to-dos',1,'2026-07-17 16:52:14','2026-07-17 16:52:14'),(44,'tickets.comment','tickets','comment','Comment on to-dos',1,'2026-07-17 16:52:14','2026-07-17 16:52:14'),(45,'tickets.upload','tickets','upload','Upload files to to-dos',1,'2026-07-17 16:52:14','2026-07-17 16:52:14'),(46,'tickets.create','tickets','create','Create to-dos',1,'2026-07-17 16:52:14','2026-07-17 16:52:14'),(47,'tickets.edit','tickets','edit','Edit to-dos',1,'2026-07-17 16:52:14','2026-07-17 16:52:14'),(48,'tickets.delete','tickets','delete','Delete to-dos',1,'2026-07-17 16:52:14','2026-07-17 16:52:14'),(49,'timesheets.view','timesheets','view','View own timesheets (anyone\'s when manager+)',0,'2026-07-17 16:52:14','2026-07-17 16:52:14'),(50,'timesheets.create','timesheets','create','Log time for own account (others when manager+)',0,'2026-07-17 16:52:14','2026-07-17 16:52:14'),(51,'timesheets.edit','timesheets','edit','Edit own timesheets (others when manager+)',0,'2026-07-17 16:52:14','2026-07-17 16:52:14'),(52,'timesheets.delete','timesheets','delete','Delete own timesheets (others when manager+)',0,'2026-07-17 16:52:14','2026-07-17 16:52:14'),(53,'timesheets.manage','timesheets','manage','Manage timesheets company-wide (invoice/pay/reports)',0,'2026-07-17 16:52:14','2026-07-17 16:52:14'),(54,'users.view','users','view','View users',0,'2026-07-17 16:52:14','2026-07-17 16:52:14'),(55,'users.create','users','create','Invite/create users',0,'2026-07-17 16:52:14','2026-07-17 16:52:14'),(56,'users.edit','users','edit','Edit users',0,'2026-07-17 16:52:14','2026-07-17 16:52:14'),(57,'users.delete','users','delete','Delete users',0,'2026-07-17 16:52:14','2026-07-17 16:52:14'),(58,'users.import','users','import','Import users (LDAP)',0,'2026-07-17 16:52:14','2026-07-17 16:52:14'),(59,'wiki.view','wiki','view','View wiki articles',1,'2026-07-17 16:52:14','2026-07-17 16:52:14'),(60,'wiki.create','wiki','create','Create wiki articles',1,'2026-07-17 16:52:14','2026-07-17 16:52:14'),(61,'wiki.edit','wiki','edit','Edit wiki articles',1,'2026-07-17 16:52:14','2026-07-17 16:52:14'),(62,'wiki.delete','wiki','delete','Delete wiki articles',1,'2026-07-17 16:52:14','2026-07-17 16:52:14');
/*!40000 ALTER TABLE `zp_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zp_plugins`
--

DROP TABLE IF EXISTS `zp_plugins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zp_plugins` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `enabled` tinyint DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `version` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `installdate` datetime DEFAULT NULL,
  `foldername` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `homepage` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `authors` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `license` text COLLATE utf8mb4_unicode_ci,
  `format` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zp_plugins`
--

LOCK TABLES `zp_plugins` WRITE;
/*!40000 ALTER TABLE `zp_plugins` DISABLE KEYS */;
/*!40000 ALTER TABLE `zp_plugins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zp_projects`
--

DROP TABLE IF EXISTS `zp_projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zp_projects` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `clientId` int DEFAULT NULL,
  `details` text COLLATE utf8mb4_unicode_ci,
  `state` int DEFAULT NULL,
  `hourBudget` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `dollarBudget` int DEFAULT NULL,
  `active` int DEFAULT NULL,
  `menuType` text COLLATE utf8mb4_unicode_ci,
  `psettings` text COLLATE utf8mb4_unicode_ci,
  `parent` int DEFAULT NULL,
  `type` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `start` datetime DEFAULT NULL,
  `end` datetime DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `avatar` text COLLATE utf8mb4_unicode_ci,
  `cover` text COLLATE utf8mb4_unicode_ci,
  `sortIndex` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zp_projects`
--

LOCK TABLES `zp_projects` WRITE;
/*!40000 ALTER TABLE `zp_projects` DISABLE KEYS */;
INSERT INTO `zp_projects` VALUES (1,'Getting Started in HT',1,'Welcome to your first project in Leantime!<br />This is your space to organize tasks, track goals, and plan your work. Feel free to modify anything here or create additional projects as you grow. This project is just for you to get started',0,'0',0,NULL,'default','restricted',0,'project','2026-07-06 07:00:00','2026-08-08 07:00:00','2026-07-17 19:41:11','2026-08-12 17:00:55',NULL,NULL,NULL),(2,'Training For Fresh Graduate recruits',1,'<p>Training for new recruits starts in August officially. There are many courses. According to documents provided by Jay these are the main subjects:</p><ol><li><p>IEC tests and requirements</p></li><li><p>Terminologies</p></li><li><p>Company Culture</p></li><li><p>Power cable installation</p></li><li><p>Basic rules and regulations</p></li></ol>',0,'0',0,NULL,'default','restricted',0,'project','2026-08-04 07:00:00','2026-08-05 07:00:00','2026-07-23 01:42:08','2026-08-12 17:00:27','16',NULL,NULL),(3,'My AI Projects',1,'<p>Use claude-code to create content for youtube explore niche based on my interest and publish at least 2 videos every week, film and schedule during weekend script on weekdays</p>',-1,'0',0,NULL,'default','restricted',0,'project',NULL,NULL,'2026-07-26 09:06:16','2026-08-13 00:12:50',NULL,NULL,NULL),(4,'My Project',0,'Welcome to your first project in Leantime!<br />This is your space to organize tasks, track goals, and plan your work. Feel free to modify anything here or create additional projects as you grow. This project is just for you to get started',NULL,'0',0,NULL,'','restricted',NULL,'project',NULL,NULL,'2026-08-03 23:32:05','2026-08-03 23:32:05',NULL,NULL,NULL);
/*!40000 ALTER TABLE `zp_projects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zp_punch_clock`
--

DROP TABLE IF EXISTS `zp_punch_clock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zp_punch_clock` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `minutes` int DEFAULT NULL,
  `hours` int DEFAULT NULL,
  `punchIn` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_punch_clock_userId` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zp_punch_clock`
--

LOCK TABLES `zp_punch_clock` WRITE;
/*!40000 ALTER TABLE `zp_punch_clock` DISABLE KEYS */;
/*!40000 ALTER TABLE `zp_punch_clock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zp_queue`
--

DROP TABLE IF EXISTS `zp_queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zp_queue` (
  `msghash` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `channel` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `userId` int NOT NULL,
  `subject` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `thedate` datetime NOT NULL,
  `projectId` int NOT NULL,
  PRIMARY KEY (`msghash`),
  KEY `idx_queue_projectId` (`projectId`),
  KEY `idx_queue_userId` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zp_queue`
--

LOCK TABLES `zp_queue` WRITE;
/*!40000 ALTER TABLE `zp_queue` DISABLE KEYS */;
/*!40000 ALTER TABLE `zp_queue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zp_reactions`
--

DROP TABLE IF EXISTS `zp_reactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zp_reactions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `userId` int DEFAULT NULL,
  `moduleId` int DEFAULT NULL,
  `module` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reaction` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_reactions_entity` (`moduleId`,`module`,`reaction`),
  KEY `idx_reactions_user` (`userId`,`moduleId`,`module`,`reaction`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zp_reactions`
--

LOCK TABLES `zp_reactions` WRITE;
/*!40000 ALTER TABLE `zp_reactions` DISABLE KEYS */;
/*!40000 ALTER TABLE `zp_reactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zp_read`
--

DROP TABLE IF EXISTS `zp_read`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zp_read` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `module` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `moduleId` int DEFAULT NULL,
  `userId` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_read_userId_module_moduleId` (`userId`,`module`,`moduleId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zp_read`
--

LOCK TABLES `zp_read` WRITE;
/*!40000 ALTER TABLE `zp_read` DISABLE KEYS */;
/*!40000 ALTER TABLE `zp_read` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zp_recurring_patterns`
--

DROP TABLE IF EXISTS `zp_recurring_patterns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zp_recurring_patterns` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `entityId` int NOT NULL,
  `module` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `trigger` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `interval` int NOT NULL DEFAULT '1',
  `weekDays` text COLLATE utf8mb4_unicode_ci,
  `monthDay` int DEFAULT NULL,
  `months` text COLLATE utf8mb4_unicode_ci,
  `action` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'reset',
  `lastProcessed` datetime DEFAULT NULL,
  `nextProcessingDate` datetime DEFAULT NULL,
  `enabled` tinyint NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `idx_recurring_patterns_entityId` (`entityId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zp_recurring_patterns`
--

LOCK TABLES `zp_recurring_patterns` WRITE;
/*!40000 ALTER TABLE `zp_recurring_patterns` DISABLE KEYS */;
/*!40000 ALTER TABLE `zp_recurring_patterns` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zp_relationuserproject`
--

DROP TABLE IF EXISTS `zp_relationuserproject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zp_relationuserproject` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `userId` int DEFAULT NULL,
  `projectId` int DEFAULT NULL,
  `wage` int DEFAULT NULL,
  `projectRole` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `zp_relationuserproject_projectId_index` (`projectId`),
  KEY `zp_relationuserproject_userId_index` (`userId`),
  KEY `idx_relationuserproject_userId_projectId` (`userId`,`projectId`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zp_relationuserproject`
--

LOCK TABLES `zp_relationuserproject` WRITE;
/*!40000 ALTER TABLE `zp_relationuserproject` DISABLE KEYS */;
INSERT INTO `zp_relationuserproject` VALUES (1,1,1,NULL,''),(2,1,1,NULL,''),(3,1,2,NULL,''),(4,1,3,NULL,''),(9,4,4,NULL,'20');
/*!40000 ALTER TABLE `zp_relationuserproject` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zp_role_permissions`
--

DROP TABLE IF EXISTS `zp_role_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zp_role_permissions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `roleId` bigint unsigned NOT NULL,
  `permissionId` bigint unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_role_permissions_unique` (`roleId`,`permissionId`),
  KEY `idx_role_permissions_roleId` (`roleId`),
  KEY `idx_role_permissions_permissionId` (`permissionId`)
) ENGINE=InnoDB AUTO_INCREMENT=240 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zp_role_permissions`
--

LOCK TABLES `zp_role_permissions` WRITE;
/*!40000 ALTER TABLE `zp_role_permissions` DISABLE KEYS */;
INSERT INTO `zp_role_permissions` VALUES (1,1,2),(2,1,6),(3,1,15),(4,1,19),(5,1,22),(6,1,26),(7,1,31),(8,1,35),(9,1,39),(10,1,43),(11,1,59),(12,2,2),(13,2,6),(14,2,15),(15,2,16),(16,2,19),(17,2,20),(18,2,22),(19,2,26),(20,2,31),(21,2,35),(22,2,39),(23,2,43),(24,2,44),(25,2,45),(26,2,59),(27,3,2),(28,3,3),(29,3,4),(30,3,5),(31,3,6),(32,3,7),(33,3,8),(34,3,9),(35,3,15),(36,3,16),(37,3,19),(38,3,20),(39,3,21),(40,3,22),(41,3,23),(42,3,24),(43,3,25),(44,3,26),(45,3,27),(46,3,28),(47,3,29),(48,3,31),(49,3,35),(50,3,39),(51,3,40),(52,3,41),(53,3,42),(54,3,43),(55,3,44),(56,3,45),(57,3,46),(58,3,47),(59,3,48),(60,3,49),(61,3,50),(62,3,51),(63,3,52),(64,3,59),(65,3,60),(66,3,61),(67,3,62),(68,4,2),(69,4,3),(70,4,4),(71,4,5),(72,4,6),(73,4,7),(74,4,8),(75,4,9),(76,4,15),(77,4,16),(78,4,17),(79,4,19),(80,4,20),(81,4,21),(82,4,22),(83,4,23),(84,4,24),(85,4,25),(86,4,26),(87,4,27),(88,4,28),(89,4,29),(90,4,31),(91,4,32),(92,4,33),(93,4,34),(94,4,35),(95,4,38),(96,4,39),(97,4,40),(98,4,41),(99,4,42),(100,4,43),(101,4,44),(102,4,45),(103,4,46),(104,4,47),(105,4,48),(106,4,49),(107,4,50),(108,4,51),(109,4,52),(110,4,53),(111,4,55),(112,4,59),(113,4,60),(114,4,61),(115,4,62),(116,5,1),(117,5,2),(118,5,3),(119,5,4),(120,5,5),(121,5,6),(122,5,7),(123,5,8),(124,5,9),(125,5,10),(126,5,11),(127,5,12),(128,5,13),(129,5,14),(130,5,15),(131,5,16),(132,5,17),(133,5,18),(134,5,19),(135,5,20),(136,5,21),(137,5,22),(138,5,23),(139,5,24),(140,5,25),(141,5,26),(142,5,27),(143,5,28),(144,5,29),(145,5,30),(146,5,31),(147,5,32),(148,5,33),(149,5,34),(150,5,35),(151,5,36),(152,5,37),(153,5,38),(154,5,39),(155,5,40),(156,5,41),(157,5,42),(158,5,43),(159,5,44),(160,5,45),(161,5,46),(162,5,47),(163,5,48),(164,5,49),(165,5,50),(166,5,51),(167,5,52),(168,5,53),(169,5,54),(170,5,55),(171,5,56),(172,5,57),(173,5,58),(174,5,59),(175,5,60),(176,5,61),(177,5,62),(178,6,1),(179,6,2),(180,6,3),(181,6,4),(182,6,5),(183,6,6),(184,6,7),(185,6,8),(186,6,9),(187,6,10),(188,6,11),(189,6,12),(190,6,13),(191,6,14),(192,6,15),(193,6,16),(194,6,17),(195,6,18),(196,6,19),(197,6,20),(198,6,21),(199,6,22),(200,6,23),(201,6,24),(202,6,25),(203,6,26),(204,6,27),(205,6,28),(206,6,29),(207,6,30),(208,6,31),(209,6,32),(210,6,33),(211,6,34),(212,6,35),(213,6,36),(214,6,37),(215,6,38),(216,6,39),(217,6,40),(218,6,41),(219,6,42),(220,6,43),(221,6,44),(222,6,45),(223,6,46),(224,6,47),(225,6,48),(226,6,49),(227,6,50),(228,6,51),(229,6,52),(230,6,53),(231,6,54),(232,6,55),(233,6,56),(234,6,57),(235,6,58),(236,6,59),(237,6,60),(238,6,61),(239,6,62);
/*!40000 ALTER TABLE `zp_role_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zp_roles`
--

DROP TABLE IF EXISTS `zp_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zp_roles` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `displayName` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `level` int NOT NULL,
  `isSystem` tinyint NOT NULL DEFAULT '0',
  `description` text COLLATE utf8mb4_unicode_ci,
  `createdOn` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_roles_name` (`name`),
  KEY `idx_roles_level` (`level`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zp_roles`
--

LOCK TABLES `zp_roles` WRITE;
/*!40000 ALTER TABLE `zp_roles` DISABLE KEYS */;
INSERT INTO `zp_roles` VALUES (1,'readonly','Read Only',5,1,NULL,'2026-07-17 16:52:15','2026-07-17 16:52:15'),(2,'commenter','Commenter',10,1,NULL,'2026-07-17 16:52:15','2026-07-17 16:52:15'),(3,'editor','Editor',20,1,NULL,'2026-07-17 16:52:15','2026-07-17 16:52:15'),(4,'manager','Company Manager',30,1,NULL,'2026-07-17 16:52:15','2026-07-17 16:52:15'),(5,'admin','Admin',40,1,NULL,'2026-07-17 16:52:15','2026-07-17 16:52:15'),(6,'owner','Owner',50,1,NULL,'2026-07-17 16:52:15','2026-07-17 16:52:15');
/*!40000 ALTER TABLE `zp_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zp_settings`
--

DROP TABLE IF EXISTS `zp_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zp_settings` (
  `key` varchar(175) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zp_settings`
--

LOCK TABLES `zp_settings` WRITE;
/*!40000 ALTER TABLE `zp_settings` DISABLE KEYS */;
INSERT INTO `zp_settings` VALUES ('companysettings.telemetry.active','true'),('companysettings.telemetry.anonymousId','46d2b2f2-7d0f-4ede-9908-4b8d23b24343'),('db-version','3.5.20'),('projectsettings.2.stepsComplete','a:2:{s:11:\"description\";s:2:\"on\";s:10:\"defineTeam\";s:2:\"on\";}'),('user.1.firstLoginCompleted','1'),('user.1.myTodosSorting','[{\"id\":11,\"parentId\":null,\"parentType\":\"section\",\"level\":0,\"order\":10,\"groupKey\":\"overdue\"},{\"id\":14,\"parentId\":null,\"parentType\":\"section\",\"level\":0,\"order\":10,\"groupKey\":\"thisWeek\"},{\"id\":12,\"parentId\":null,\"parentType\":\"section\",\"level\":0,\"order\":11,\"groupKey\":\"thisWeek\"},{\"id\":16,\"parentId\":12,\"parentType\":\"task\",\"level\":1,\"order\":10,\"groupKey\":\"thisWeek\"},{\"id\":17,\"parentId\":16,\"parentType\":\"task\",\"level\":2,\"order\":10,\"groupKey\":\"thisWeek\"},{\"id\":13,\"parentId\":null,\"parentType\":\"section\",\"level\":0,\"order\":10,\"groupKey\":\"later\"},{\"id\":10,\"parentId\":null,\"parentType\":\"section\",\"level\":0,\"order\":11,\"groupKey\":\"later\"},{\"id\":15,\"parentId\":10,\"parentType\":\"task\",\"level\":1,\"order\":10,\"groupKey\":\"later\"}]'),('user.4.firstLoginCompleted','1'),('usersetting.1.submenuToggle','a:22:{s:38:\"accordion_content-task-children-later1\";s:4:\"open\";s:8:\"mainMenu\";s:4:\"open\";s:45:\"accordion_content-myProjectsHub-otherProjects\";s:4:\"open\";s:11:\"materialize\";s:4:\"open\";s:10:\"understand\";s:4:\"open\";s:8:\"dataroom\";s:4:\"open\";s:40:\"accordion_content-task-children-overdue1\";s:4:\"open\";s:39:\"accordion_content-ticketBox1-thisWeek-0\";s:4:\"open\";s:36:\"accordion_content-ticketBox1-later-1\";s:4:\"open\";s:21:\"dashboardCalendarView\";s:11:\"timeGridDay\";s:42:\"accordion_content-task-children-thisWeek14\";s:4:\"open\";s:42:\"accordion_content-task-children-thisWeek11\";s:6:\"closed\";s:39:\"accordion_content-task-children-later10\";s:6:\"closed\";s:39:\"accordion_content-ticketBox1-thisWeek-1\";s:4:\"open\";s:36:\"accordion_content-ticketBox1-later-2\";s:4:\"open\";s:10:\"Management\";s:4:\"open\";s:14:\"administration\";s:4:\"open\";s:41:\"accordion_content-task-children-overdue16\";s:4:\"open\";s:38:\"accordion_content-ticketBox1-overdue-0\";s:4:\"open\";s:31:\"accordion_content-tickets-dates\";s:4:\"open\";s:41:\"accordion_content-task-children-overdue37\";s:6:\"closed\";s:41:\"accordion_content-myProjectsHub-favorites\";s:6:\"closed\";}'),('usersettings.1.colorMode','light'),('usersettings.1.colorScheme','themeDefault'),('usersettings.1.date_format','m/d/Y'),('usersettings.1.daySchedule','a:5:{s:6:\"wakeup\";s:0:\"\";s:9:\"workStart\";s:1:\"6\";s:5:\"lunch\";s:2:\"10\";s:7:\"workEnd\";s:2:\"18\";s:3:\"bed\";s:0:\"\";}'),('usersettings.1.icalSecret','ecac5aa8-d832-429a-a2ef-ba7accd4d4e7'),('usersettings.1.language','en-US'),('usersettings.1.lastMessageDate','2026-07-26 09:06:17'),('usersettings.1.lastProject','2'),('usersettings.1.recentProjects','a:4:{i:0;i:2;i:1;i:1;i:2;i:3;i:3;i:4;}'),('usersettings.1.theme','default'),('usersettings.1.themeFont','Shantell Sans'),('usersettings.1.time_format','h:i A'),('usersettings.1.timezone','Asia/Shanghai'),('usersettings.1.widgetHistory','a:1:{s:10:\"myprojects\";i:1787011250;}'),('usersettings.4.colorMode','light'),('usersettings.4.colorScheme','themeDefault'),('usersettings.4.daySchedule','a:5:{s:6:\"wakeup\";s:0:\"\";s:9:\"workStart\";s:2:\"10\";s:5:\"lunch\";s:2:\"12\";s:7:\"workEnd\";s:2:\"18\";s:3:\"bed\";s:0:\"\";}'),('usersettings.4.lastProject','4'),('usersettings.4.recentProjects','a:1:{i:0;i:4;}'),('usersettings.4.theme','minimal'),('usersettings.4.themeFont','Roboto');
/*!40000 ALTER TABLE `zp_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zp_sprints`
--

DROP TABLE IF EXISTS `zp_sprints`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zp_sprints` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `projectId` int DEFAULT NULL,
  `name` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `startDate` datetime DEFAULT NULL,
  `endDate` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_sprints_projectId_startDate_endDate` (`projectId`,`startDate`,`endDate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zp_sprints`
--

LOCK TABLES `zp_sprints` WRITE;
/*!40000 ALTER TABLE `zp_sprints` DISABLE KEYS */;
/*!40000 ALTER TABLE `zp_sprints` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zp_stats`
--

DROP TABLE IF EXISTS `zp_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zp_stats` (
  `sprintId` int DEFAULT NULL,
  `projectId` int DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `sum_todos` int DEFAULT NULL,
  `sum_open_todos` int DEFAULT NULL,
  `sum_progres_todos` int DEFAULT NULL,
  `sum_closed_todos` int DEFAULT NULL,
  `sum_planned_hours` double DEFAULT NULL,
  `sum_estremaining_hours` double DEFAULT NULL,
  `sum_logged_hours` double DEFAULT NULL,
  `sum_points` int DEFAULT NULL,
  `sum_points_done` int DEFAULT NULL,
  `sum_points_progress` int DEFAULT NULL,
  `sum_points_open` int DEFAULT NULL,
  `sum_todos_xs` int DEFAULT NULL,
  `sum_todos_s` int DEFAULT NULL,
  `sum_todos_m` int DEFAULT NULL,
  `sum_todos_l` int DEFAULT NULL,
  `sum_todos_xl` int DEFAULT NULL,
  `sum_todos_xxl` int DEFAULT NULL,
  `sum_todos_none` int DEFAULT NULL,
  `tickets` int DEFAULT NULL,
  `daily_avg_hours_booked_todo` double DEFAULT NULL,
  `daily_avg_hours_booked_point` double DEFAULT NULL,
  `daily_avg_hours_planned_todo` double DEFAULT NULL,
  `daily_avg_hours_planned_point` double DEFAULT NULL,
  `daily_avg_hours_remaining_point` double DEFAULT NULL,
  `daily_avg_hours_remaining_todo` double DEFAULT NULL,
  `sum_teammembers` int DEFAULT NULL,
  KEY `idx_stats_projectId` (`projectId`,`sprintId`),
  KEY `idx_stats_projectId_sprintId_date` (`projectId`,`sprintId`,`date`),
  KEY `idx_stats_sprintId_date` (`sprintId`,`date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zp_stats`
--

LOCK TABLES `zp_stats` WRITE;
/*!40000 ALTER TABLE `zp_stats` DISABLE KEYS */;
INSERT INTO `zp_stats` VALUES (-1,1,'2026-07-19 00:00:00',6,2,4,0,0,0,0.43,13,0,10,3,0,0,4,0,0,0,1,10,0.07,0.03,0,0,0,0,1),(-1,1,'2026-07-20 00:00:00',8,1,6,1,0,0,0.74,13,0,13,0,0,0,4,0,0,0,3,10,0.09,0.06,0,0,0,0,1),(-1,1,'2026-07-22 00:00:00',9,0,5,4,0,0,0.74,13,4,9,0,0,0,4,0,0,0,4,10,0.08,0.06,0,0,0,0,1),(-1,1,'2026-07-23 00:00:00',9,0,5,4,0,0,0.74,13,4,9,0,0,0,4,0,0,0,4,10,0.08,0.06,0,0,0,0,1),(-1,2,'2026-07-23 00:00:00',3,3,0,0,0,0,NULL,16,0,0,16,0,0,1,1,1,0,0,21,NULL,NULL,0,0,0,0,1),(-1,1,'2026-07-24 00:00:00',9,0,5,4,0,0,0.74,13,4,9,0,0,0,4,0,0,0,4,10,0.08,0.06,0,0,0,0,1),(-1,2,'2026-07-24 00:00:00',4,2,2,0,0,0,NULL,16,0,13,3,0,0,1,1,1,0,1,21,NULL,NULL,0,0,0,0,1),(-1,1,'2026-07-25 00:00:00',9,0,5,4,0,0,0.74,13,4,9,0,0,0,4,0,0,0,4,10,0.08,0.06,0,0,0,0,1),(-1,2,'2026-07-25 00:00:00',4,2,2,0,0,0,NULL,16,0,13,3,0,0,1,1,1,0,1,21,NULL,NULL,0,0,0,0,1),(-1,1,'2026-07-28 00:00:00',9,0,0,9,0,0,0.74,13,13,0,0,0,0,4,0,0,0,4,10,0.08,0.06,0,0,0,0,1),(-1,2,'2026-07-29 00:00:00',6,0,5,1,0,0,NULL,16,5,11,0,0,0,1,1,1,0,3,21,NULL,NULL,0,0,0,0,1),(-1,1,'2026-07-31 00:00:00',13,4,0,9,0,0,0.74,13,13,0,0,0,0,4,0,0,0,8,10,0.06,0.06,0,0,0,0,1),(-1,3,'2026-07-31 00:00:00',2,0,0,2,0,0,NULL,0,0,0,0,0,0,0,0,0,0,2,30,NULL,NULL,0,NULL,NULL,0,1),(-1,2,'2026-07-31 00:00:00',6,0,5,1,0,0,NULL,16,5,11,0,0,0,1,1,1,0,3,21,NULL,NULL,0,0,0,0,1),(-1,1,'2026-08-03 00:00:00',13,3,0,10,0,0,0.74,13,13,0,0,0,0,4,0,0,0,8,10,0.06,0.06,0,0,0,0,1),(-1,4,'2026-08-03 00:00:00',1,1,0,0,0,0,NULL,0,0,0,0,0,0,0,0,0,0,1,39,NULL,NULL,0,NULL,NULL,0,1),(-1,3,'2026-08-03 00:00:00',2,0,0,2,0,0,NULL,0,0,0,0,0,0,0,0,0,0,2,30,NULL,NULL,0,NULL,NULL,0,1),(-1,2,'2026-08-03 00:00:00',7,0,6,1,0,0,NULL,16,5,11,0,0,0,1,1,1,0,4,21,NULL,NULL,0,0,0,0,1),(-1,4,'2026-08-13 00:00:00',1,1,0,0,0,0,NULL,0,0,0,0,0,0,0,0,0,0,1,39,NULL,NULL,0,NULL,NULL,0,1),(-1,1,'2026-08-13 00:00:00',16,1,1,14,0,0,0.74,13,13,0,0,0,0,4,0,0,0,11,10,0.05,0.06,0,0,0,0,1),(-1,2,'2026-08-13 00:00:00',21,5,4,12,0,0,NULL,69,35,5,29,2,3,1,4,3,1,6,21,NULL,NULL,0,0,0,0,1),(-1,2,'2026-08-16 00:00:00',23,4,6,13,0,0,NULL,69,37,13,19,2,3,1,4,3,1,8,21,NULL,NULL,0,0,0,0,1),(-1,4,'2026-08-16 00:00:00',1,1,0,0,0,0,NULL,0,0,0,0,0,0,0,0,0,0,1,39,NULL,NULL,0,NULL,NULL,0,1),(-1,1,'2026-08-16 00:00:00',16,1,1,14,0,0,0.74,13,13,0,0,0,0,4,0,0,0,11,10,0.05,0.06,0,0,0,0,1),(-1,4,'2026-08-17 00:00:00',1,1,0,0,0,0,NULL,0,0,0,0,0,0,0,0,0,0,1,39,NULL,NULL,0,NULL,NULL,0,1),(-1,1,'2026-08-17 00:00:00',18,2,2,14,0,0,0.74,13,13,0,0,0,0,4,0,0,0,13,10,0.04,0.06,0,0,0,0,1),(-1,2,'2026-08-17 00:00:00',24,5,5,14,0,0,NULL,69,37,13,19,2,3,1,4,3,1,9,21,NULL,NULL,0,0,0,0,1);
/*!40000 ALTER TABLE `zp_stats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zp_tickethistory`
--

DROP TABLE IF EXISTS `zp_tickethistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zp_tickethistory` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `userId` int DEFAULT NULL,
  `ticketId` int DEFAULT NULL,
  `changeType` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `changeValue` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_tickethistory_ticketId` (`ticketId`)
) ENGINE=InnoDB AUTO_INCREMENT=284 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zp_tickethistory`
--

LOCK TABLES `zp_tickethistory` WRITE;
/*!40000 ALTER TABLE `zp_tickethistory` DISABLE KEYS */;
INSERT INTO `zp_tickethistory` VALUES (1,1,10,'deadline','2026-08-02 06:59:59','2026-07-17 19:45:07'),(2,1,10,'status','4','2026-07-17 19:45:20'),(3,1,10,'status','4','2026-07-17 19:45:20'),(4,1,8,'status','1','2026-07-17 19:52:18'),(5,1,8,'status','3','2026-07-17 19:52:20'),(6,1,12,'deadline','2026-08-01 06:59:59','2026-07-19 19:05:40'),(7,1,11,'deadline','2026-07-21 06:59:59','2026-07-19 19:05:49'),(8,1,13,'status','4','2026-07-19 19:05:58'),(9,1,13,'status','4','2026-07-19 19:05:58'),(10,1,11,'status','1','2026-07-19 19:06:04'),(11,1,11,'status','1','2026-07-19 19:06:04'),(12,1,12,'status','2','2026-07-19 19:06:07'),(13,1,12,'status','2','2026-07-19 19:06:07'),(14,1,12,'status','1','2026-07-19 19:06:12'),(15,1,12,'status','1','2026-07-19 19:06:12'),(16,1,11,'status','2','2026-07-19 19:06:15'),(17,1,11,'status','2','2026-07-19 19:06:15'),(18,1,11,'headline','Work Permit Applicaiton','2026-07-19 19:07:36'),(19,1,11,'description','<p>I have asked Asai to apply for Work Permit and now it is with the Government officials</p>','2026-07-19 19:07:36'),(20,1,11,'priority','1','2026-07-19 19:07:36'),(21,1,11,'deadline','2026-07-21 06:59:00','2026-07-19 19:07:36'),(22,1,11,'status','4','2026-07-19 19:08:12'),(23,1,11,'status','4','2026-07-19 19:08:12'),(24,1,12,'status','3','2026-07-19 19:08:20'),(25,1,12,'status','3','2026-07-19 19:08:20'),(26,1,12,'headline','Apply Work Visa','2026-07-19 19:08:48'),(27,1,12,'priority','1','2026-07-19 19:08:48'),(28,1,12,'deadline','2026-08-01 06:59:00','2026-07-19 19:08:48'),(29,1,11,'deadline','2026-07-21 06:59:59','2026-07-19 19:09:43'),(30,1,11,'deadline','2026-07-20 13:00:00','2026-07-19 19:10:20'),(31,1,11,'deadline','2026-07-20 09:00:00','2026-07-19 19:11:26'),(32,1,11,'status','2','2026-07-19 19:32:07'),(33,1,11,'status','2','2026-07-19 19:32:07'),(34,1,14,'status','4','2026-07-19 19:32:20'),(35,1,14,'status','4','2026-07-19 19:32:20'),(36,1,15,'deadline','2026-07-21 06:59:59','2026-07-19 19:34:57'),(37,1,15,'deadline','2026-07-20 19:00:00','2026-07-19 19:35:52'),(38,1,10,'priority','3','2026-07-19 19:54:47'),(39,1,13,'priority','3','2026-07-19 19:54:51'),(40,1,10,'priority','2','2026-07-19 19:54:56'),(41,1,14,'priority','1','2026-07-19 19:55:01'),(42,1,15,'priority','3','2026-07-19 19:55:07'),(43,1,14,'deadline','2026-07-21 06:59:59','2026-07-19 21:18:55'),(44,1,14,'deadline','2026-07-22 06:59:59','2026-07-19 21:50:39'),(45,1,17,'deadline','2026-07-23 06:59:59','2026-07-20 00:08:19'),(46,1,16,'deadline','2026-07-22 06:59:59','2026-07-20 00:08:26'),(47,1,15,'status','4','2026-07-20 00:08:46'),(48,1,15,'status','4','2026-07-20 00:08:46'),(49,1,17,'deadline','2026-07-22 06:59:00','2026-07-20 15:36:47'),(50,1,14,'deadline','2026-07-21 06:59:00','2026-07-20 15:37:08'),(51,1,16,'headline','Temporary Accomodation document preparation by Asai HR','2026-07-20 15:37:34'),(52,1,16,'deadline','2026-07-21 06:59:00','2026-07-20 15:37:34'),(53,1,18,'deadline','2026-07-21 15:59:59','2026-07-20 16:20:36'),(54,1,18,'status','2','2026-07-20 16:20:45'),(55,1,11,'headline','Work Permit Application','2026-07-20 16:20:56'),(56,1,11,'description','<p>I have asked Asai to apply for Work Permit and now it is with the Government officials,</p><blockquote><p>They said the system is down and might ch','2026-07-20 16:20:56'),(57,1,11,'status','1','2026-07-20 16:20:56'),(58,1,17,'priority','2','2026-07-20 16:22:30'),(59,1,16,'priority','2','2026-07-20 16:22:34'),(60,1,17,'priority','1','2026-07-20 16:22:46'),(61,1,16,'priority','1','2026-07-20 16:22:49'),(62,1,10,'priority','3','2026-07-20 16:23:26'),(63,1,14,'status','2','2026-07-20 16:23:38'),(64,1,12,'deadline','2026-07-24 00:00:00','2026-07-20 16:26:17'),(65,1,12,'status','4','2026-07-20 16:26:40'),(66,1,12,'status','4','2026-07-20 16:26:40'),(67,1,11,'description','<p>I have asked Asai to apply for Work Permit and now it is with the Government officials,</p><blockquote><p>They said the system is down and might ch','2026-07-20 17:43:40'),(68,1,11,'description','<p>I have asked Asai to apply for Work Permit and now it is with the Government officials,</p>','2026-07-20 17:45:06'),(69,1,14,'description','<p></p><blockquote><p>They said the system is down at 07-20-2026 and might check tomorrow</p></blockquote><p>Date: 21st July 2026: Asai said it will o','2026-07-20 17:46:28'),(70,1,16,'deadline','2026-07-22 06:59:59','2026-07-20 17:46:42'),(71,1,17,'deadline','2026-07-23 06:59:59','2026-07-20 17:46:44'),(72,1,17,'deadline','2026-07-22 15:59:59','2026-07-21 08:52:13'),(73,1,16,'deadline','2026-07-21 15:59:59','2026-07-21 08:52:17'),(74,1,12,'deadline','2026-07-23 15:59:59','2026-07-21 08:52:29'),(75,1,14,'description','<p></p><blockquote><p>They said the system is down at 07-20-2026 and might check tomorrow</p></blockquote><p>Date: 21st July 2026: Asai said it will o','2026-07-21 09:30:12'),(76,1,16,'description','<p>At 9:30 July 21st, Asai called the police station asking what kind of document is needed for accomoadation registration. They did not pick up. He w','2026-07-21 09:32:47'),(77,1,16,'deadline','2026-07-21 15:59:00','2026-07-21 09:32:47'),(78,1,16,'status','4','2026-07-21 09:33:05'),(79,1,16,'status','4','2026-07-21 09:33:05'),(80,1,13,'status','0','2026-07-21 09:33:27'),(81,1,13,'status','0','2026-07-21 09:33:27'),(82,1,13,'status','4','2026-07-21 09:33:47'),(83,1,13,'status','4','2026-07-21 09:33:47'),(84,1,13,'description','<p>currently downloading courses on projectr mangement using chatgpt and udemy course </p>','2026-07-21 09:34:19'),(85,1,15,'status','0','2026-07-21 09:34:31'),(86,1,15,'status','0','2026-07-21 09:34:31'),(87,1,15,'description','<p>Made multiple choice quesetion and Falsh crad and video for IEC 60840 learning using notebooklm.google.com</p>','2026-07-21 09:35:32'),(88,1,14,'description','<p></p><blockquote><p>They said the system is down at 07-20-2026 and might check tomorrow</p></blockquote><p>Date: 21st July 2026: Asai said it will o','2026-07-21 14:34:18'),(89,1,14,'description','<p></p><blockquote><p>They said the system is down at 07-20-2026 and might check tomorrow</p></blockquote><p>Date: 21st July 2026: Asai said it will o','2026-07-21 14:35:40'),(90,1,14,'description','<p></p><blockquote><p>They said the system is down at 07-20-2026 and might check tomorrow</p></blockquote><p>Date: 21st July 2026: Asai said it will o','2026-07-21 02:12:12'),(91,1,14,'description','<p></p><blockquote><p>They said the system is down at 07-20-2026 and might check tomorrow</p></blockquote><p>Date: 21st July 2026: Asai said it will o','2026-07-22 00:56:15'),(92,1,19,'status','4','2026-07-22 01:02:41'),(93,1,19,'description','<p>document 2- Accomodation is remain, need a letter from company then get it from Police station go tomorrow</p><p>document 7,14,15 and 17 is given b','2026-07-22 01:06:04'),(94,1,19,'priority','1','2026-07-22 01:06:04'),(95,1,19,'deadline','2026-07-25 06:59:59','2026-07-22 01:06:04'),(96,1,19,'deadline','2026-07-24 15:59:59','2026-07-22 16:14:57'),(97,1,12,'deadline','2026-07-24 15:59:59','2026-07-22 16:15:33'),(98,1,17,'deadline','2026-07-23 15:59:59','2026-07-22 16:15:46'),(99,1,17,'deadline','2026-07-22 15:59:59','2026-07-22 16:15:52'),(100,1,17,'status','4','2026-07-23 13:17:29'),(101,1,17,'status','4','2026-07-23 13:17:29'),(102,1,14,'status','0','2026-07-23 13:17:38'),(103,1,14,'status','0','2026-07-23 13:17:38'),(104,1,11,'status','0','2026-07-23 13:17:41'),(105,1,11,'status','0','2026-07-23 13:17:41'),(106,1,20,'headline','How to Clean philips coffee machine?','2026-07-22 23:40:25'),(107,1,20,'description','<p><a target=\"_blank\" rel=\"noopener noreferrer\" href=\"https://www.philips.iq/en/c-p/EP2220_10/series-2200-fully-automatic-espresso-machines/support\">h','2026-07-22 23:40:25'),(108,1,20,'deadline','2026-07-20 06:59:00','2026-07-22 23:40:25'),(109,1,20,'status','0','2026-07-22 23:40:25'),(110,1,21,'description','<p>Use AI to create a workflow that records weekly work done, problem risen, solution proposed, future suggestions and other to create a monthly summa','2026-07-23 02:02:20'),(111,1,21,'deadline','2026-08-01 06:59:00','2026-07-23 02:02:20'),(112,1,21,'fromDate','2026-07-24 07:00:00','2026-07-23 02:02:20'),(113,1,21,'toDate','2026-08-01 06:59:59','2026-07-23 02:02:20'),(114,1,21,'toDate','2026-08-01 06:59:00','2026-07-23 02:11:26'),(115,1,21,'deadline','2026-09-01 06:59:59','2026-07-23 02:12:12'),(116,1,21,'deadline','2026-08-22 06:59:59','2026-07-23 02:12:19'),(117,1,22,'deadline','2026-08-01 06:59:59','2026-07-23 02:12:25'),(118,1,21,'deadline','2026-08-22 06:59:00','2026-07-23 02:15:33'),(119,1,21,'toDate','2026-08-22 06:59:00','2026-07-23 02:15:33'),(120,1,22,'deadline','2026-08-01 06:59:00','2026-07-23 02:16:03'),(121,1,22,'fromDate','2026-07-24 07:00:00','2026-07-23 02:16:03'),(122,1,22,'toDate','2026-08-01 06:59:59','2026-07-23 02:16:03'),(123,1,22,'description','<p>create one or multiple custom list of company rules and regulation related to work such as daily attendance, leave (daily, monthly, yearly), holida','2026-07-24 17:48:32'),(124,1,22,'toDate','2026-08-01 06:59:00','2026-07-24 17:48:32'),(125,1,17,'description','<p>planed for Monday 2026-07-27</p>','2026-07-24 17:50:28'),(126,1,17,'deadline','2026-07-22 15:59:00','2026-07-24 17:50:28'),(127,1,21,'toDate','2026-07-24 15:59:00','2026-07-24 17:51:49'),(128,1,21,'status','4','2026-07-24 17:52:14'),(129,1,21,'status','4','2026-07-24 17:52:14'),(130,1,22,'status','4','2026-07-24 17:52:17'),(131,1,22,'status','4','2026-07-24 17:52:17'),(132,1,22,'toDate','2026-07-24 10:59:00','2026-07-24 17:52:35'),(133,1,12,'status','0','2026-07-28 19:55:20'),(134,1,12,'status','0','2026-07-28 19:55:20'),(135,1,16,'status','0','2026-07-28 19:55:23'),(136,1,16,'status','0','2026-07-28 19:55:23'),(137,1,17,'status','0','2026-07-28 19:55:26'),(138,1,17,'status','0','2026-07-28 19:55:26'),(139,1,19,'status','0','2026-07-28 19:55:29'),(140,1,19,'status','0','2026-07-28 19:55:29'),(141,1,10,'status','0','2026-07-28 19:56:02'),(142,1,13,'status','0','2026-07-28 19:56:07'),(143,1,28,'headline','Attend evening meal for new college students','2026-07-29 11:05:46'),(144,1,29,'deadline','2026-08-05 15:59:59','2026-07-29 11:07:12'),(145,1,25,'deadline','2026-08-03 15:59:59','2026-07-29 11:07:21'),(146,1,30,'deadline','2026-07-29 15:59:59','2026-07-29 11:08:27'),(147,1,30,'deadline','2026-07-29 13:00:00','2026-07-29 11:09:05'),(148,1,27,'description','<p></p>','2026-07-29 11:10:47'),(149,1,27,'deadline','2026-08-14 15:59:00','2026-07-29 11:10:47'),(150,1,26,'deadline','2026-08-11 06:59:00','2026-07-29 11:11:24'),(151,1,21,'status','0','2026-07-29 11:12:01'),(152,1,21,'description','<p>Use AI to create a workflow that records weekly work done, problem risen, solution proposed, future suggestions and other to create a monthly summa','2026-07-29 11:12:47'),(153,1,23,'description','<p>Create a system for notetaking and organizing ideas, tools, etc</p><p></p><p>USE ANKI, NOTES APP, WPS, LEANTIME</p>','2026-07-29 11:13:25'),(154,1,23,'deadline','2026-11-01 06:59:00','2026-07-29 11:13:25'),(155,1,23,'status','4','2026-07-29 11:13:36'),(156,1,29,'status','4','2026-07-29 11:13:43'),(157,1,25,'status','1','2026-07-29 11:13:55'),(158,1,22,'status','2','2026-07-29 11:14:01'),(159,1,24,'status','4','2026-07-29 11:14:07'),(160,1,24,'description','<p>create a script and imporve and build confidence on communication with clients, including difficult clients, unexpected scenario, building good rel','2026-07-29 11:14:54'),(161,1,24,'deadline','2026-09-30 15:59:00','2026-07-29 11:14:54'),(162,1,22,'description','<p>create one or multiple custom list of company rules and regulation related to work such as daily attendance, leave (daily, monthly, yearly), holida','2026-07-29 11:15:34'),(163,1,31,'deadline','2026-08-10 15:59:59','2026-07-30 09:38:49'),(164,1,32,'deadline','2026-07-31 15:59:59','2026-07-30 09:41:45'),(165,1,32,'status','0','2026-07-30 12:28:14'),(166,1,30,'status','0','2026-07-30 12:28:18'),(167,1,29,'deadline','2026-08-05 15:59:00','2026-07-30 13:31:23'),(168,1,36,'description','<p>8月5日早上7:30</p><p>50座大巴苏EU1573王师傅138 6202 2773</p>','2026-08-02 22:14:35'),(169,1,37,'toDate','2026-11-01 06:59:59','2026-08-02 22:15:54'),(170,1,37,'status','4','2026-08-02 22:17:45'),(171,1,35,'description','<p>位同事：</p><p>为便于统一管理及工作传达，根据参训名单现将集训名单进行初步分组并初步筛选组长。（若小组成员达成一致可更换组长）。</p><p>组长主要职责：</p><p>1、集训期间人员签到、组织；</p><p>2、周六、周日参访等户外活动协助；</p><p>3、临时事项处理；</p><','2026-08-02 22:23:14'),(172,1,35,'status','4','2026-08-02 22:23:14'),(173,1,38,'deadline','2026-08-05 06:59:59','2026-08-03 16:08:16'),(174,1,36,'deadline','2026-08-06 06:59:59','2026-08-03 16:08:20'),(175,1,38,'description','<p>注意事项</p><p>1、填写出差申请单（8/5-8/12，XZ003）：为了5-12日期间的考勤，凯莱无考勤机，所以需要申请出差。</p><p>2、集训人员信息收集中在备注栏更新各自信息。</p><p>3、组长与分组，若有建议，请下班前提出</p><p>4、自备运动服一套（户外拓展用）</p','2026-08-03 16:09:45'),(176,1,38,'deadline','2026-08-05 00:00:00','2026-08-03 16:09:45'),(177,1,35,'description','<p>一、基本信息</p><p>【集训时间】8月5日 - 8月12日（共8天封闭培训）</p><p>【入住酒店】苏州0572太湖温泉酒店</p><p>【培训酒店】苏州亨通凯莱度假酒店</p><p>二、8月5日安排（先到酒店办理入住，9:30 到凯莱酒店开营）</p><p>吴江园区 → 统一大巴出发<','2026-08-03 16:10:59'),(178,1,35,'deadline','2026-08-13 01:00:00','2026-08-03 16:10:59'),(179,1,38,'status','0','2026-08-03 19:08:04'),(180,1,36,'status','4','2026-08-03 19:08:17'),(181,1,38,'status','2','2026-08-03 19:08:32'),(182,1,36,'deadline','2026-08-05 15:59:59','2026-08-04 14:15:23'),(183,1,26,'deadline','2026-08-06 15:59:59','2026-08-04 14:15:41'),(184,1,26,'deadline','2026-08-06 03:30:00','2026-08-04 14:15:57'),(185,1,27,'deadline','2026-08-06 15:59:59','2026-08-04 14:17:32'),(186,1,28,'status','0','2026-08-04 14:17:37'),(187,1,40,'status','2','2026-08-04 00:48:55'),(188,1,41,'deadline','2026-08-07 06:59:59','2026-08-04 01:34:31'),(189,1,41,'headline','TIN Application','2026-08-04 01:34:51'),(190,1,41,'deadline','2026-08-07 06:59:00','2026-08-04 01:34:51'),(191,1,41,'description','<p>Taxpayer Identification Number for Bank account opening.</p><p></p><h2>Two practical paths</h2><ul><li><p><strong>Employer does it (standard)</stro','2026-08-04 02:29:21'),(192,1,41,'status','4','2026-08-04 02:29:26'),(193,1,35,'deadline','2026-08-12 15:59:59','2026-08-04 17:30:45'),(194,1,40,'status','0','2026-08-04 17:31:17'),(195,1,40,'description','<p>Dear LEO,</p><p>I hope this message finds you well.</p><p>I would like to inform you that Basma (珉华) and I need to visit the police station on Augu','2026-08-04 17:31:53'),(196,1,38,'status','0','2026-08-04 17:32:22'),(197,1,42,'status','4','2026-08-04 17:36:49'),(198,1,42,'deadline','2026-08-08 15:59:59','2026-08-04 17:36:55'),(199,1,26,'status','0','2026-08-05 23:19:25'),(200,1,44,'deadline','2026-08-08 06:59:59','2026-08-06 02:19:18'),(201,1,45,'status','0','2026-08-07 05:57:52'),(202,1,45,'status','0','2026-08-07 05:57:52'),(203,1,46,'status','2','2026-08-07 05:58:44'),(204,1,41,'deadline','2026-08-13 19:10:00','2026-08-07 06:08:15'),(205,1,44,'status','0','2026-08-08 22:57:53'),(206,1,44,'status','0','2026-08-08 22:57:53'),(207,1,48,'status','0','2026-08-12 03:42:10'),(208,1,49,'description','<p></p>','2026-08-12 03:43:29'),(209,1,27,'description','<img src=\"http://localhost:8080/files/get?module=ticket&amp;encName=270dbf14ae88655498d6848b51ef9a8e&amp;ext=png&amp;realName=image.png\" alt=\"image.pn','2026-08-12 16:51:08'),(210,1,27,'deadline','2026-08-06 15:59:00','2026-08-12 16:51:08'),(211,1,27,'status','4','2026-08-12 16:51:47'),(212,1,25,'status','-1','2026-08-12 17:01:07'),(213,1,25,'status','-1','2026-08-12 17:01:07'),(214,1,51,'description','<p><strong>Result:</strong><br>she  is going to give me more materrails later but for now this is all</p><p>内部录播选修课：<a target=\"_blank\" rel=\"noopener n','2026-08-12 17:24:33'),(215,1,51,'status','4','2026-08-12 17:24:43'),(216,1,51,'description','<p><strong>Result:</strong><br>she is going to give me more materrails later but for now this is all</p><p>内部录播选修课：<a target=\"_blank\" rel=\"noopener no','2026-08-12 17:26:01'),(217,1,52,'description','<p>His response was: </p><ol><li><p>We\'ve already visited the Conductor and OPGW factories on 7.22 and 7.24</p></li><li><p>I am not sure whether we wi','2026-08-13 00:12:26'),(218,1,52,'status','0','2026-08-13 00:12:26'),(219,1,41,'status','0','2026-08-13 15:13:56'),(220,1,46,'status','0','2026-08-13 15:19:16'),(221,1,51,'status','0','2026-08-13 15:19:45'),(222,1,50,'status','0','2026-08-13 17:02:54'),(223,1,49,'status','0','2026-08-13 17:03:01'),(224,1,36,'status','0','2026-08-14 08:03:30'),(225,1,36,'status','0','2026-08-14 08:03:30'),(226,1,35,'status','0','2026-08-14 08:03:34'),(227,1,35,'status','0','2026-08-14 08:03:34'),(228,1,22,'status','0','2026-08-14 08:03:52'),(229,1,22,'status','0','2026-08-14 08:03:52'),(230,1,47,'deadline','2026-08-28 15:59:59','2026-08-14 08:04:23'),(231,1,43,'deadline','2026-08-28 15:59:59','2026-08-14 08:04:27'),(232,1,31,'description','<p>i have already scanned the receipt but it is not very clear, scan again using phone and make pdf and save , can apply for 400 yuan reimbursement af','2026-08-13 17:18:19'),(233,1,31,'deadline','2026-08-10 15:59:00','2026-08-13 17:18:19'),(234,1,55,'headline','Learn about OPGW and conductor','2026-08-13 18:38:16'),(235,1,55,'description','<p>by october 16th and CRM as well, so that i don\'t get left behind</p><img src=\"http://localhost:8080/files/get?module=ticket&amp;encName=15a493eff46','2026-08-13 18:38:16'),(236,1,55,'deadline','2026-10-17 06:59:00','2026-08-13 18:38:16'),(237,1,53,'description','<p>Sent messaget o him</p>','2026-08-13 18:38:46'),(238,1,53,'status','0','2026-08-13 18:38:46'),(239,1,54,'description','<p>1. Our training mainly covers two parts: technical knowledge and commercial‑business content. I have sent you some technical PPTs about two product','2026-08-13 18:39:26'),(240,1,54,'headline','HV cable factory - Changshu is from 16th October start learning HV cable from that','2026-08-13 18:39:52'),(241,1,54,'fromDate','2026-10-16 07:00:00','2026-08-13 18:40:25'),(242,1,54,'toDate','2027-01-01 07:59:59','2026-08-13 18:40:25'),(243,1,54,'deadline','2027-01-01 07:59:59','2026-08-13 18:40:47'),(244,1,54,'toDate','2027-01-01 07:59:00','2026-08-13 18:40:47'),(245,1,47,'deadline','2026-10-17 06:59:59','2026-08-13 18:41:03'),(246,1,43,'deadline','2026-10-17 06:59:59','2026-08-13 18:41:15'),(247,1,47,'headline','Learn to use CRM system to et hands‑on practice on real‑world commercial projects (not technical projects) via the CRM quotation system.','2026-08-13 18:42:19'),(248,1,47,'description','<p></p>','2026-08-13 18:42:19'),(249,1,47,'deadline','2026-10-17 06:59:00','2026-08-13 18:42:19'),(250,1,47,'headline','Learn to use CRM system','2026-08-13 18:42:42'),(251,1,47,'description','<p> To get hands‑on practice on real‑world commercial projects (not technical projects) via the CRM quotation system.</p>','2026-08-13 18:42:42'),(252,1,47,'status','2','2026-08-13 19:05:50'),(253,1,57,'priority','2','2026-08-13 19:06:08'),(254,1,56,'priority','3','2026-08-13 19:06:12'),(255,1,55,'priority','1','2026-08-13 19:06:16'),(256,1,54,'priority','3','2026-08-13 19:06:21'),(257,1,43,'priority','3','2026-08-13 19:06:27'),(258,1,42,'priority','3','2026-08-13 19:06:33'),(259,1,29,'priority','4','2026-08-13 19:06:39'),(260,1,24,'priority','4','2026-08-13 19:06:43'),(261,1,23,'priority','5','2026-08-13 19:06:48'),(262,1,56,'deadline','2026-08-15 06:59:59','2026-08-13 19:09:56'),(263,1,59,'description','<img src=\"http://localhost:8080/files/get?module=ticket&amp;encName=0aceb3789f218b34d444823a03a41616&amp;ext=png&amp;realName=image.png\" alt=\"image.pn','2026-08-13 19:15:08'),(264,1,59,'status','0','2026-08-13 19:15:14'),(265,1,57,'status','0','2026-08-13 19:57:56'),(266,1,47,'description','<p>To get hands‑on practice on real‑world commercial projects (not technical projects) via the CRM quotation system.</p><p></p><p>study the trading te','2026-08-13 19:58:53'),(267,1,47,'status','-1','2026-08-13 19:58:56'),(268,1,58,'description','<p>Jeff: For the exams, please let 王夏青 to support you to collate from tutors. The aim is not on how many scores you get but to check how well you get ','2026-08-13 19:59:43'),(269,1,60,'deadline','2026-10-17 06:59:59','2026-08-13 23:09:44'),(270,1,60,'deadline','2026-10-17 06:59:00','2026-08-13 23:10:13'),(271,1,61,'status','4','2026-08-16 17:13:41'),(272,1,56,'deadline','2026-08-15 06:59:00','2026-08-16 17:16:05'),(273,1,56,'status','4','2026-08-16 17:16:05'),(274,1,55,'status','4','2026-08-16 17:16:21'),(275,1,56,'description','<p>lecture series 1-7</p><p></p>','2026-08-16 17:17:07'),(276,1,56,'status','0','2026-08-16 17:17:07'),(277,1,63,'description','<p></p>','2026-08-16 18:17:31'),(278,1,63,'status','4','2026-08-16 18:17:31'),(279,1,63,'project','1','2026-08-17 01:22:33'),(280,1,64,'project','1','2026-08-17 01:22:39'),(281,1,61,'status','0','2026-08-17 03:36:57'),(282,1,29,'status','0','2026-08-18 19:41:47'),(283,1,66,'headline','Daily task Wednesday Aug 19 2026 focused on Companies and products','2026-08-18 19:43:08');
/*!40000 ALTER TABLE `zp_tickethistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zp_tickets`
--

DROP TABLE IF EXISTS `zp_tickets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zp_tickets` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `projectId` int DEFAULT NULL,
  `headline` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `acceptanceCriteria` text COLLATE utf8mb4_unicode_ci,
  `date` datetime DEFAULT NULL,
  `dateToFinish` datetime DEFAULT NULL,
  `priority` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int DEFAULT NULL,
  `userId` int DEFAULT NULL,
  `os` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `browser` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `resolution` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `component` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `version` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dependingTicketId` int DEFAULT NULL,
  `editFrom` datetime DEFAULT NULL,
  `editTo` datetime DEFAULT NULL,
  `editorId` varchar(75) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `planHours` double DEFAULT NULL,
  `hourRemaining` double DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `production` int NOT NULL DEFAULT '0',
  `staging` int NOT NULL DEFAULT '0',
  `storypoints` double DEFAULT NULL,
  `sprint` int DEFAULT NULL,
  `sortindex` bigint DEFAULT NULL,
  `kanbanSortIndex` bigint DEFAULT NULL,
  `tags` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `milestoneid` int DEFAULT NULL,
  `leancanvasitemid` int DEFAULT NULL,
  `retrospectiveid` int DEFAULT NULL,
  `ideaid` int DEFAULT NULL,
  `zp_ticketscol` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ProjectUserId` (`projectId`,`userId`),
  KEY `StatusSprint` (`status`,`sprint`),
  KEY `Sorting` (`sortindex`),
  KEY `idx_tickets_editorId` (`editorId`),
  KEY `idx_tickets_milestoneid` (`milestoneid`),
  KEY `idx_tickets_editFrom` (`editFrom`),
  KEY `idx_tickets_editTo` (`editTo`),
  KEY `idx_tickets_dateToFinish` (`dateToFinish`),
  KEY `idx_tickets_modified` (`modified`),
  KEY `idx_tickets_projectId_status` (`projectId`,`status`),
  KEY `idx_tickets_projectId_type` (`projectId`,`type`),
  KEY `idx_tickets_status_type` (`status`,`type`),
  KEY `idx_tickets_dependingTicketId` (`dependingTicketId`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zp_tickets`
--

LOCK TABLES `zp_tickets` WRITE;
/*!40000 ALTER TABLE `zp_tickets` DISABLE KEYS */;
INSERT INTO `zp_tickets` VALUES (1,1,'🚀 Getting Started','','','2026-07-18 02:41:11','0000-00-00 00:00:00','3',3,1,NULL,NULL,NULL,NULL,NULL,NULL,0,'2026-07-18 09:41:11','2026-08-01 09:41:11','1',0,0,'milestone',0,0,0,0,102,0,'#124F7D',0,NULL,NULL,NULL,NULL,'2026-08-03 05:17:28'),(10,1,'Learn IEC 60840 2023','','','2026-07-17 19:42:17','2026-08-02 06:59:59','3',0,1,NULL,NULL,NULL,NULL,NULL,NULL,0,'0000-00-00 00:00:00','0000-00-00 00:00:00','1',0,0,'task',0,0,3,0,0,300,'',0,NULL,NULL,NULL,NULL,'2026-07-29 02:56:02'),(11,1,'Work Permit Application','<p>I have asked Asai to apply for Work Permit and now it is with the Government officials,</p>','','2026-07-21 00:45:06','2026-07-20 09:00:00','1',0,1,NULL,NULL,NULL,NULL,NULL,NULL,0,'0000-00-00 00:00:00','0000-00-00 00:00:00','1',0,0,'task',0,0,3,0,0,0,'',0,NULL,NULL,NULL,NULL,'2026-07-23 05:17:41'),(12,1,'Apply Work Visa','','','2026-07-20 02:08:48','2026-07-24 15:59:59','1',0,1,NULL,NULL,NULL,NULL,NULL,NULL,0,'0000-00-00 00:00:00','0000-00-00 00:00:00','1',0,0,'task',0,0,3,0,0,200,'',0,NULL,NULL,NULL,NULL,'2026-07-29 02:55:20'),(13,1,'Learn Project Mangament strategies and implement in Leantime','<p>currently downloading courses on projectr mangement using chatgpt and udemy course </p>','','2026-07-21 01:34:19','0000-00-00 00:00:00','3',0,1,NULL,NULL,NULL,NULL,NULL,NULL,0,'0000-00-00 00:00:00','0000-00-00 00:00:00','1',0,0,'task',0,0,3,0,0,0,'',0,NULL,NULL,NULL,NULL,'2026-07-29 02:56:07'),(14,1,'Check on Work Permit with Asai','<p></p><blockquote><p>They said the system is down at 07-20-2026 and might check tomorrow</p></blockquote><p>Date: 21st July 2026: Asai said it will open around 9, it’s 8:43 now need wait more time</p><blockquote><p>He said if I am qualified for work permit, I can extent my student visa residense permit to temporary residense permit of 30 days until i get my work visa.</p></blockquote><p>14:33 2026-07-21- 我真的很无奈. I am really helpless.</p><img src=\"http://localhost:8080/files/get?module=ticket&amp;encName=618612c403f425db689f38a318c77268&amp;ext=png&amp;realName=47a1b617af151c3e4f4071aa8ec08b96.png\" alt=\"47a1b617af151c3e4f4071aa8ec08b96.png\"><p>Need new documents and translated version of recommendatiaon letter, I asked professor to provide new letter</p><img src=\"http://localhost:8080/files/get?module=ticket&amp;encName=474baf7c5d61cd315f44ebeca00b17a3&amp;ext=png&amp;realName=80af323d6622f994098892e483e030df.png\" alt=\"80af323d6622f994098892e483e030df.png\"><p></p><p>Finally Passed the first review</p><img src=\"http://localhost:8080/files/get?module=ticket&amp;encName=8e1bd2f9a4b78d1adb03bf27bbf9ba7e&amp;ext=png&amp;realName=1732539d859fcd794b8334447aa81ecc.png\" alt=\"1732539d859fcd794b8334447aa81ecc.png\">','','2026-07-22 07:56:15','2026-07-21 06:59:00','1',0,1,NULL,NULL,NULL,NULL,NULL,NULL,0,'0000-00-00 00:00:00','0000-00-00 00:00:00','1',0,0,'task',0,0,0.5,0,0,0,'',0,NULL,NULL,NULL,NULL,'2026-07-23 05:17:38'),(15,1,'check with Gemini on IEC 60840 about why it\'s purpose','<p>Made multiple choice quesetion and Falsh crad and video for IEC 60840 learning using notebooklm.google.com</p>','','2026-07-21 01:35:32','0000-00-00 00:00:00','3',0,1,NULL,NULL,NULL,NULL,NULL,NULL,10,'0000-00-00 00:00:00','0000-00-00 00:00:00','1',0,0,'task',0,0,0,0,0,100,'',0,NULL,NULL,NULL,NULL,'2026-07-21 01:35:32'),(16,1,'Temporary Accomodation document preparation by Asai HR','<p>At 9:30 July 21st, Asai called the police station asking what kind of document is needed for accomoadation registration. They did not pick up. He will call them again later.</p><p></p>','','2026-07-21 01:33:02','2026-07-21 15:59:00','1',0,1,NULL,NULL,NULL,NULL,NULL,NULL,12,'0000-00-00 00:00:00','0000-00-00 00:00:00','1',0,0,'task',0,0,0,0,0,100,'',0,NULL,NULL,NULL,NULL,'2026-07-29 02:55:23'),(17,1,'Temporary Accomodation document application go to police station','<p>planed for Monday 2026-07-27</p>','','2026-07-24 09:50:28','2026-07-22 15:59:00','1',0,1,NULL,NULL,NULL,NULL,NULL,NULL,16,'0000-00-00 00:00:00','0000-00-00 00:00:00','1',0,0,'task',0,0,0,0,0,0,'',0,NULL,NULL,NULL,NULL,'2026-07-29 02:55:26'),(19,1,'Prepare all document according to the checklist','<p>document 2- Accomodation is remain, need a letter from company then get it from Police station go tomorrow</p><p>document 7,14,15 and 17 is given by company</p><p> document 19 is work permit</p><p>document 8 and 9 is photo one is 2inch photo another is in PSB</p>','','2026-07-22 08:06:04','2026-07-24 15:59:59','1',0,1,NULL,NULL,NULL,NULL,NULL,NULL,12,'0000-00-00 00:00:00','0000-00-00 00:00:00','1',0,0,'subtask',0,0,0,0,NULL,0,'',0,NULL,NULL,NULL,NULL,'2026-07-29 02:55:29'),(20,1,'How to Clean philips coffee machine?','<p><a target=\"_blank\" rel=\"noopener noreferrer\" href=\"https://www.philips.iq/en/c-p/EP2220_10/series-2200-fully-automatic-espresso-machines/support\">https://www.philips.iq/en/c-p/EP2220_10/series-2200-fully-automatic-espresso-machines/support</a></p>','','2026-07-23 06:40:25','2026-07-20 06:59:00','',0,1,NULL,NULL,NULL,NULL,NULL,NULL,0,'0000-00-00 00:00:00','0000-00-00 00:00:00','1',0,0,'task',0,0,0,0,0,0,'',0,NULL,NULL,NULL,NULL,'2026-07-23 06:40:25'),(21,2,'Semi annual Work report and planning workflow','<p>Use AI to create a workflow that records weekly work done, problem risen, solution proposed, future suggestions and other to create a monthly summary then finally make a semi-annual report using the following format:</p><p><span style=\"font-family: &quot;Times New Roman&quot;; font-size: 14pt;\"><strong>&nbsp;Work Summary and Plan&nbsp;Template(</strong>20XX)</span></p><p style=\"text-align: left;\"><span style=\"font-family: &quot;Times New Roman&quot;; font-size: 14pt;\">（Main Text）</span></p><p style=\"text-align: left;\"><span style=\"font-family: &quot;Times New Roman&quot;; font-size: 14pt;\">&nbsp;</span></p><p style=\"text-align: justify;\"><span style=\"font-family: &quot;Times New Roman&quot;; font-size: 14pt;\"><strong>Part 1: Review and Summarize the achievement of various tasks and objectives in 20XX</strong></span></p><p style=\"text-align: justify;\"><span style=\"font-family: &quot;Times New Roman&quot;; font-size: 14pt;\">I.</span></p><p style=\"text-align: justify;\"><span style=\"font-family: &quot;Times New Roman&quot;; font-size: 14pt;\">II.</span></p><p style=\"text-align: justify;\"><span style=\"font-family: &quot;Times New Roman&quot;; font-size: 14pt;\">III.</span></p><p style=\"text-align: justify;\"><span style=\"font-family: &quot;Times New Roman&quot;; font-size: 14pt;\">&nbsp;</span></p><p style=\"text-align: justify;\"><span style=\"font-family: &quot;Times New Roman&quot;; font-size: 14pt;\"><strong>Part 2: Challenges and main issues&nbsp;in the work</strong></span></p><p style=\"text-align: justify;\"><span style=\"font-family: &quot;Times New Roman&quot;; font-size: 14pt;\">I.</span></p><p style=\"text-align: justify;\"><span style=\"font-family: &quot;Times New Roman&quot;; font-size: 14pt;\">II.</span></p><p style=\"text-align: justify;\"><span style=\"font-family: &quot;Times New Roman&quot;; font-size: 14pt;\">III.</span></p><p style=\"text-align: justify;\"><span style=\"font-family: &quot;Times New Roman&quot;; font-size: 14pt;\">&nbsp;</span></p><p style=\"text-align: justify;\"><span style=\"font-family: &quot;Times New Roman&quot;; font-size: 14pt;\"><strong>Part 3: 20</strong></span><span style=\"font-family: SimSun; font-size: 14pt;\"><strong>XX</strong></span><span style=\"font-family: &quot;Times New Roman&quot;; font-size: 14pt;\"><strong>&nbsp;Operational Objectives&amp;Work Plan</strong></span></p><p style=\"text-align: justify;\"><span style=\"font-family: &quot;Times New Roman&quot;; font-size: 14pt;\">I.</span></p><p style=\"text-align: justify;\"><span style=\"font-family: &quot;Times New Roman&quot;; font-size: 14pt;\">II.</span></p><p style=\"text-align: justify;\"><span style=\"font-family: &quot;Times New Roman&quot;; font-size: 14pt;\">III.</span></p><p style=\"text-align: justify;\"></p><p style=\"text-align: justify;\"><span style=\"font-family: &quot;Times New Roman&quot;; font-size: 14pt;\">FINISHED THE PROJECT ALWAYS REMEMBER TO SYNC USING PYTHON API: THE DOCUMENTATION IS GIVEN IN FIRST APP FOLDER IN CLAUDE APP</span></p>','','2026-07-29 03:12:47','2026-08-22 06:59:00','4',0,1,NULL,NULL,NULL,NULL,NULL,NULL,0,'2026-07-24 07:00:00','2026-07-24 15:59:00','1',0,0,'task',0,0,5,0,NULL,1200,'workflow,report,semi-annual,planning,submit,system',0,NULL,NULL,NULL,NULL,'2026-08-14 02:04:38'),(22,2,'Company Rules and Regulation awareness Questionaire','<p>create one or multiple custom list of company rules and regulation related to work such as daily attendance, leave (daily, monthly, yearly), holidays, notices, OA application codes, reimbursement regulations, find necessary documents for bookkeeping information</p><ol><li><p>No. of check in and check out machines and locations</p></li><li><p>Spring festival holidays and other holidays</p></li><li><p>Monthly and annual personal leave hours or days</p></li><li><p>How and where find Specific application OA codes?</p></li><li><p>How to apply or overtime (OT) hours?</p></li><li><p>Does OT give more benefits if done voluntarily or its doesn’t and only applies when necessarily done ?</p></li><li><p>How is travel expense and other expense reimbursement handled or applied ?</p></li></ol><p></p><p></p><p>Asked Asai about this, just find the related document from AI learning website and parse and translate and when given OA code save them</p>','','2026-07-29 03:15:34','2026-08-01 06:59:00','2',0,1,NULL,NULL,NULL,NULL,NULL,NULL,0,'2026-07-24 07:00:00','2026-07-24 10:59:00','1',0,0,'task',0,0,8,0,106,1100,'rules,FAQ,regulations,check-in,bookkeeping',37,NULL,NULL,NULL,NULL,'2026-08-14 02:04:38'),(23,2,'Create a workflow/system of notetaking of ideas and tools','<p>Create a system for notetaking and organizing ideas, tools, etc</p><p></p><p>USE ANKI, NOTES APP, WPS, LEANTIME</p>','','2026-07-29 03:13:25','2026-11-01 06:59:00','5',4,1,NULL,NULL,NULL,NULL,NULL,NULL,0,'0000-00-00 00:00:00','0000-00-00 00:00:00','1',0,0,'task',0,0,3,0,NULL,300,'workflow,system,ideas,tools',37,NULL,NULL,NULL,NULL,'2026-08-14 02:06:50'),(24,2,'work on communication language with client','<p>create a script and imporve and build confidence on communication with clients, including difficult clients, unexpected scenario, building good relationship, etc</p><ol><li><p>created a ppt and docx on this topic next do more research</p></li></ol><p></p><p></p>','','2026-07-29 03:14:54','2026-09-30 15:59:00','4',4,1,NULL,NULL,NULL,NULL,NULL,NULL,0,'0000-00-00 00:00:00','0000-00-00 00:00:00','1',0,0,'task',0,0,0,0,105,200,'',37,NULL,NULL,NULL,NULL,'2026-08-14 02:06:43'),(25,2,'make the budgeting app from python to node.js and react app and then to mac and iphone and apk app','<p>i have a python app that i made a few months ago that python libraries. User input the data on CLI and it is saved in .dat file and when user asks for report or summary an excel file is generated for that months with deatils</p>','','2026-07-27 05:15:22','2026-08-03 15:59:59','',-1,1,NULL,NULL,NULL,NULL,NULL,NULL,0,'0000-00-00 00:00:00','0000-00-00 00:00:00','1',0,0,'task',0,0,0,0,NULL,0,'python,app,development,personal project',0,NULL,NULL,NULL,NULL,'2026-08-13 00:01:07'),(26,1,'Collect Passpart from Police station','','','2026-08-04 06:15:57','2026-08-06 03:30:00','',0,1,NULL,NULL,NULL,NULL,NULL,NULL,0,'0000-00-00 00:00:00','0000-00-00 00:00:00','1',0,0,'task',0,0,0,0,NULL,0,'passport,visa,police,embassy,accomodoation,work permit',0,NULL,NULL,NULL,NULL,'2026-08-06 06:19:25'),(27,1,'create a bank account on China construction bank','<img src=\"http://localhost:8080/files/get?module=ticket&amp;encName=270dbf14ae88655498d6848b51ef9a8e&amp;ext=png&amp;realName=image.png\" alt=\"image.png\"><p></p>','','2026-08-13 07:11:03','2026-08-06 15:59:00','',4,1,NULL,NULL,NULL,NULL,NULL,NULL,0,'0000-00-00 00:00:00','0000-00-00 00:00:00','1',0,0,'task',0,0,0,0,NULL,0,'card,bank,salary,money,tax',1,NULL,NULL,NULL,NULL,'2026-08-13 07:11:03'),(28,1,'Attend evening meal for new college students','<p>本周五的晚宴地点已定，位于香雪海饭店（吴中大道店）。</p><p>1、【用车安排】：其中吴江园区和七都园区的人数较多，已统一申请大巴，晚些时候将大巴信息公布，常熟5人（自行申请2辆亨通滴滴）、无锡2人（自行申请1辆亨通滴滴），当天往返。</p><p>2、【饮酒注意】：请各位同事注意适量饮酒，注意身体，不可酗酒，相互关照。</p><p>3、【考勤相关】：各园区同事可提前出发，7月31日下班的考勤将统一做好。</p><p></p><p>新大学生晚餐地址变更如下：</p><p>【时 间】7月31号 18:30</p><p>【地 点】海景壹号吴江店  4楼宴会厅</p><p>【地 址】仲英大道999号</p><p>【导 航】高德地图<a target=\"_blank\" rel=\"noopener noreferrer\" href=\"https://surl.amap.com/AxqRFL7N2hI\">https://surl.amap.com/AxqRFL7N2hI</a></p><p></p><img src=\"http://localhost:8080/files/get?module=project&amp;encName=dee9fa5515eaca071cefa952e32a616a&amp;ext=png&amp;realName=1fbac60d2aa900eeb049fc3e3f79bfa1.png\" alt=\"1fbac60d2aa900eeb049fc3e3f79bfa1.png\">','','2026-07-29 03:09:51','2026-07-31 10:30:00','',0,1,NULL,NULL,NULL,NULL,NULL,NULL,0,'0000-00-00 00:00:00','0000-00-00 00:00:00','1',0,0,'task',0,0,0,0,NULL,0,'dinner,meal,party,drinking,company,HT',0,NULL,NULL,NULL,NULL,'2026-08-04 06:17:37'),(29,2,'Parse and translate all chinese document given by Jay','<p></p>','','2026-07-30 05:31:23','2026-08-05 15:59:00','4',0,1,NULL,NULL,NULL,NULL,NULL,NULL,0,'0000-00-00 00:00:00','0000-00-00 00:00:00','1',0,0,'task',0,0,0,0,104,100,'translate,chinese,documents,work,technical',37,NULL,NULL,NULL,NULL,'2026-08-19 02:41:47'),(30,3,'Submit paper to Energy journal','','','2026-07-29 03:09:05','2026-07-29 13:00:00','',0,1,NULL,NULL,NULL,NULL,NULL,NULL,0,'0000-00-00 00:00:00','0000-00-00 00:00:00','1',0,0,'task',0,0,0,0,0,0,'journal,Professor,Battery',0,NULL,NULL,NULL,NULL,'2026-07-30 04:28:18'),(31,1,'Apply reimbursement for Visa application ¥400','<p>i have already scanned the receipt but it is not very clear, scan again using phone and make pdf and save , can apply for 400 yuan reimbursement after I get the Visa</p><p>Update Fri Aug 14 2026:  I have the TIN number but i don’t have the back account to get the reimbursement which i am going to resolve on 15th or 16th with Asai and Basma.</p><p></p><p></p>','','2026-08-14 00:18:19','2026-08-10 15:59:00','',3,1,NULL,NULL,NULL,NULL,NULL,NULL,0,'0000-00-00 00:00:00','0000-00-00 00:00:00','1',0,0,'task',0,0,0,0,NULL,0,'',1,NULL,NULL,NULL,NULL,'2026-08-14 00:18:19'),(32,3,'make overleaf account and upload the project','<p>make the project on overleaf and convert the the project to docsx</p>','','2026-07-30 01:41:39','2026-07-31 15:59:59','',0,1,NULL,NULL,NULL,NULL,NULL,NULL,0,'0000-00-00 00:00:00','0000-00-00 00:00:00','1',0,0,'task',0,0,0,0,NULL,0,'',0,NULL,NULL,NULL,NULL,'2026-07-30 04:28:14'),(35,2,'Attend 8 day trainin in Qidu Hotel','<p>一、基本信息</p><p>【集训时间】8月5日 - 8月12日（共8天封闭培训）</p><p>【入住酒店】苏州0572太湖温泉酒店</p><p>【培训酒店】苏州亨通凯莱度假酒店</p><p>二、8月5日安排（先到酒店办理入住，9:30 到凯莱酒店开营）</p><p>吴江园区 → 统一大巴出发</p><p>时间：8月5日 早上 7:30</p><p>车辆：50座大巴 苏EU1573，王师傅 138 6202 2773</p><p>七都园区→ 统一大巴出发（变化，正在申请大巴）</p><p>其他园区 → 自行前往</p><p>常熟、无锡：多申请几次滴滴，方便酒店间用车</p><p>三、注意事项</p><p>1、填写出差申请单（8/5-8/12，XZ003）：为了5-12日期间的考勤，凯莱无考勤机，所以需要申请出差。</p><p>2、集训人员信息收集中在备注栏更新各自信息。</p><p>3、组长与分组，若有建议，请下班前提出</p><p>4、自备运动服一套（户外拓展用）</p><p>5、带好随身物品</p><p>6、请不要自驾，外出请提前报备</p><p>7、集训期间全程着正装，若有变动，将在群里通知，请随时关注群内消息</p><p>四、分组与考勤</p><p>分组详见：金山文档 - 大学生集训分组</p><p>组长职责：签到组织、户外活动协助、临时事项处理</p><p>组长需申请编辑权限，每天确认考勤</p><p>请假需提前告知组长，并经领导同意才可登记</p><p>五、关键链接</p><p>📄 集训分组（组长需申请编辑权限）：</p><p><a target=\"_blank\" rel=\"noopener noreferrer\" href=\"https://www.kdocs.cn/l/clzY14UjA5Cz\">https://www.kdocs.cn/l/clzY14UjA5Cz</a></p><p>📄 集训人员信息收集：</p><p><a target=\"_blank\" rel=\"noopener noreferrer\" href=\"https://www.kdocs.cn/l/cmYT2DwfKLK3\">https://www.kdocs.cn/l/cmYT2DwfKLK3</a></p>','','2026-08-03 23:11:05','2026-08-12 15:59:59','',0,1,NULL,NULL,NULL,NULL,NULL,NULL,0,'0000-00-00 00:00:00','0000-00-00 00:00:00','1',0,0,'task',0,0,5,0,NULL,1000,'Training,Qidu,Hotel,8 day,trip,Bus',37,NULL,NULL,NULL,NULL,'2026-08-14 02:04:38'),(36,2,'Get on Bus at 7:30 on 5th Aug','<p>8月5日早上7:30</p><p>50座大巴苏EU1573王师傅138 6202 2773</p>','','2026-08-03 05:14:35','2026-08-05 15:59:59','3',0,1,NULL,NULL,NULL,NULL,NULL,NULL,35,'0000-00-00 00:00:00','0000-00-00 00:00:00','1',0,0,'subtask',0,0,0,0,NULL,900,'',37,NULL,NULL,NULL,NULL,'2026-08-14 02:04:38'),(37,2,'Training','','','2026-08-03 05:19:40','0000-00-00 00:00:00','3',4,1,NULL,NULL,NULL,NULL,NULL,NULL,0,'2026-08-02 07:00:00','2026-11-01 06:59:59','1',0,0,'milestone',0,0,0,0,100,0,'#865034',NULL,NULL,NULL,NULL,NULL,'2026-08-03 05:19:40'),(38,2,'Apply for business trip on OA portal','<p>注意事项</p><p>1、填写出差申请单（8/5-8/12，XZ003）：为了5-12日期间的考勤，凯莱无考勤机，所以需要申请出差。</p><p>2、集训人员信息收集中在备注栏更新各自信息。</p><p>3、组长与分组，若有建议，请下班前提出</p><p>4、自备运动服一套（户外拓展用）</p><p>5、带好随身物品</p><p>6、请不要自驾，外出请提前报备</p><p>7、集训期间全程着正装，若有变动，将在群里通知，请随时关注群内消息</p>','','2026-08-03 23:09:45','2026-08-05 00:00:00','3',0,1,NULL,NULL,NULL,NULL,NULL,NULL,35,'0000-00-00 00:00:00','0000-00-00 00:00:00','1',0,0,'subtask',0,0,0,0,NULL,800,'OA,Business,trip,application,system,portal',37,NULL,NULL,NULL,NULL,'2026-08-14 02:04:38'),(39,4,'finish slide desk for tomorrow\'s presentation','','','2026-08-03 23:35:42',NULL,'',3,4,NULL,NULL,NULL,NULL,NULL,NULL,0,'0000-00-00 00:00:00','0000-00-00 00:00:00','4',0,0,'task',0,0,0,0,0,0,'',0,NULL,NULL,NULL,NULL,'2026-08-04 06:36:54'),(40,2,'write a message to leo','<p>Dear LEO,</p><p>I hope this message finds you well.</p><p>I would like to inform you that Basma (珉华) and I need to visit the police station on August 6 to collect our passport, which has now been endorsed with our work visa. As such, we will need to be temporarily away from the training camp for the day.</p><p>Could you kindly advise on the following:</p><ol><li><p>Is there any formal leave application or reporting procedure I should follow for this?</p></li><li><p>What time window would be most appropriate for us to step out without disrupting the schedule?</p></li><li><p>Can we apply Hengtong Didi for this trip?</p></li></ol><p>Please rest assured that I will bring my temporary ID card and passport photocopy to the training day (tomorrow) as required.</p><p>Thank you very much for your understanding and guidance.<br><br>RESPONSE :</p><img src=\"http://localhost:8080/files/get?module=ticket&amp;encName=9c2720fe4faea9b511585229565ee30d&amp;ext=png&amp;realName=1c3f8c3add377ccee4558def637967bc.png\" alt=\"1c3f8c3add377ccee4558def637967bc.png\"><p></p><p></p>','','2026-08-04 09:31:53','0000-00-00 00:00:00','',0,1,NULL,NULL,NULL,NULL,NULL,NULL,0,'0000-00-00 00:00:00','0000-00-00 00:00:00','1',0,0,'task',0,0,0,0,NULL,700,'',0,NULL,NULL,NULL,NULL,'2026-08-14 02:04:38'),(41,1,'TIN Application','<p>Taxpayer Identification Number for Bank account opening.</p><p></p><h2>Two practical paths</h2><ul><li><p><strong>Employer does it (standard)</strong>: Your company’s HR registers you in the&nbsp;<strong>自然人电子税务局 / 扣缴端</strong>​ using your passport + work permit + contract. The system pulls/creates your TIN and prints it on your monthly payslip and annual IIT settlement. You only go to the tax hall if the system can’t verify you.</p></li><li><p><strong>Self-report at tax hall (办税服务厅)</strong>: If HR can’t, you walk into the&nbsp;<strong>competent tax service hall</strong>​ (where your employer is registered or where you reside), hand in the list above, and they assign the TIN on the spot (“即时办结”)<br>0512-66962126</p></li><li><p>江苏省苏州市吴中区金鸡湖街道星塘大厦(园区市民服务中心苏州大道东136号)三楼南侧大厅</p></li></ul>','','2026-08-12 23:49:55','2026-08-13 19:10:00','',0,1,NULL,NULL,NULL,NULL,NULL,NULL,0,'0000-00-00 00:00:00','0000-00-00 00:00:00','1',0,0,'task',0,0,0,0,NULL,0,'tax,salary,money',1,NULL,NULL,NULL,NULL,'2026-08-13 07:13:56'),(42,2,'Read VTR14-01E Cables 52-170 kV','<p><span style=\"color: rgb(0, 0, 0); font-family: Calibri; font-size: 12pt;\">Technical Guideline for cables VTR14-01E, 2024-10-22</span></p><p><span style=\"color: rgb(0, 0, 0); font-family: Calibri-Bold; font-size: 12pt;\"><strong>Summary</strong></span></p><p><span style=\"color: rgb(0, 0, 0); font-family: Calibri; font-size: 12pt;\">This guideline contains technical requirements and data for cables to be installed in the</span></p><p><span style=\"color: rgb(0, 0, 0); font-family: Calibri; font-size: 12pt;\">Vattenfall Eldistribution grid from 52 kV to 170 kV</span></p>','','2026-08-04 09:36:43','2026-08-08 15:59:59','3',4,1,NULL,NULL,NULL,NULL,NULL,NULL,0,'0000-00-00 00:00:00','0000-00-00 00:00:00','1',0,0,'task',0,0,2,0,NULL,0,'',37,NULL,NULL,NULL,NULL,'2026-08-14 02:06:33'),(43,2,'check out scanned document test requirements','<p>there is a scanned doucment of all different test on cable check those test document and IEC </p>','','2026-08-06 06:43:12','2026-10-17 06:59:59','3',3,1,NULL,NULL,NULL,NULL,NULL,NULL,0,'0000-00-00 00:00:00','0000-00-00 00:00:00','1',0,0,'task',0,0,1,0,NULL,500,'',37,NULL,NULL,NULL,NULL,'2026-08-14 02:06:28'),(44,1,'sign on updated labor contract','','','2026-08-06 09:15:33','2026-08-08 06:59:59','',0,1,NULL,NULL,NULL,NULL,NULL,NULL,0,'0000-00-00 00:00:00','0000-00-00 00:00:00','1',0,0,'task',0,0,0,0,NULL,0,'',0,NULL,NULL,NULL,NULL,'2026-08-09 05:57:53'),(45,1,'Inform Leo about the status','','','2026-08-06 09:30:31','0000-00-00 00:00:00','',0,1,NULL,NULL,NULL,NULL,NULL,NULL,0,'0000-00-00 00:00:00','0000-00-00 00:00:00','1',0,0,'task',0,0,0,0,NULL,0,'',0,NULL,NULL,NULL,NULL,'2026-08-07 12:57:52'),(46,2,'CRM application','','','2026-08-07 12:58:33','0000-00-00 00:00:00','',0,1,NULL,NULL,NULL,NULL,NULL,NULL,0,'0000-00-00 00:00:00','0000-00-00 00:00:00','1',0,0,'task',0,0,1,0,NULL,600,'',37,NULL,NULL,NULL,NULL,'2026-08-14 02:04:38'),(47,2,'Learn to use CRM system','<p>To get hands‑on practice on real‑world commercial projects (not technical projects) via the CRM quotation system.</p><p></p><p>study the trading terms such as what is FOB,CIF ,DDP ,DDU ...</p><p></p><img src=\"http://localhost:8080/files/get?module=ticket&amp;encName=b5ebe25109380e6bc16a56c2cb2adb0e&amp;ext=png&amp;realName=image.png\" alt=\"image.png\">','','2026-08-14 02:58:53','2026-10-17 06:59:00','',-1,1,NULL,NULL,NULL,NULL,NULL,NULL,57,'0000-00-00 00:00:00','0000-00-00 00:00:00','1',0,0,'task',0,0,5,0,NULL,100,'',37,NULL,NULL,NULL,NULL,'2026-08-14 02:58:56'),(48,2,'Learn Company Anthem','<p>Gent: </p><p>事业成就着我们的理想</p><p>光电传输着我们的深情</p><p>Lady: </p><p>用智慧编织信息的网络</p><p>用科技缩小浩渺的时空</p><p>让山与山相连</p>','','2026-08-08 00:09:13','0000-00-00 00:00:00','',0,1,NULL,NULL,NULL,NULL,NULL,NULL,0,'0000-00-00 00:00:00','0000-00-00 00:00:00','1',0,0,'task',0,0,2,0,NULL,500,'song,anthem',0,NULL,NULL,NULL,NULL,'2026-08-14 02:04:38'),(49,2,'Receive and analyze training materials','<p></p>','','2026-08-13 00:08:12','0000-00-00 00:00:00','2',0,1,NULL,NULL,NULL,NULL,NULL,NULL,0,'0000-00-00 00:00:00','0000-00-00 00:00:00','1',0,0,'task',0,0,8,0,NULL,400,'',37,NULL,NULL,NULL,NULL,'2026-08-14 02:04:38'),(50,2,'Discuss training material with Jeff and create a training schedule','','','2026-08-12 10:43:13','0000-00-00 00:00:00','3',0,1,NULL,NULL,NULL,NULL,NULL,NULL,49,'0000-00-00 00:00:00','0000-00-00 00:00:00','1',0,0,'subtask',0,0,0,0,NULL,300,'',37,NULL,NULL,NULL,NULL,'2026-08-14 02:04:38'),(51,2,'contact Ms. Zhang yuan asking for all of the training materials which especially contains all the product lines;','<p><strong>Result:</strong><br>she is going to give me more materrails later but for now this is all</p><p>内部录播选修课：<a target=\"_blank\" rel=\"noopener noreferrer\" href=\"https://v2.fangcloud.com/share/2ba4d26f2345216a845b154c6d\">https://v2.fangcloud.com/share/2ba4d26f2345216a845b154c6d</a> 访问密码：123</p>','','2026-08-13 00:26:01','0000-00-00 00:00:00','3',0,1,NULL,NULL,NULL,NULL,NULL,NULL,49,'0000-00-00 00:00:00','0000-00-00 00:00:00','1',0,0,'subtask',0,0,0,0,NULL,200,'',37,NULL,NULL,NULL,NULL,'2026-08-14 02:04:38'),(52,2,'Contact 王夏青 to ask for the production line visit schedule','<p>His response was: </p><ol><li><p>We\'ve already visited the Conductor and OPGW factories on 7.22 and 7.24</p></li><li><p>I am not sure whether we will have another visit later</p></li><li><p>The factory visit only lets us observe what the machines and workflows look like. We won’t get to do any practical hands‑on work inside the workshop.</p></li></ol>','','2026-08-13 07:12:26','0000-00-00 00:00:00','',0,1,NULL,NULL,NULL,NULL,NULL,NULL,0,'0000-00-00 00:00:00','0000-00-00 00:00:00','1',0,0,'task',0,0,0,0,NULL,100,'',0,NULL,NULL,NULL,NULL,'2026-08-14 02:04:38'),(53,2,'keep an eye on 王智军 who takes the leading role of new recuirtment internal trianing arrangement to check further production line visiti of conductor and OPGW schedule.','<p>Sent messaget o him</p>','','2026-08-14 01:38:46','0000-00-00 00:00:00','',0,1,NULL,NULL,NULL,NULL,NULL,NULL,0,'0000-00-00 00:00:00','0000-00-00 00:00:00','1',0,0,'task',0,0,0,0,NULL,0,'',37,NULL,NULL,NULL,NULL,'2026-08-14 02:04:38'),(54,2,'HV cable factory - Changshu is from 16th October start learning HV cable from that','<p>1. Our training mainly covers two parts: technical knowledge and commercial‑business content. I have sent you some technical PPTs about two product lines: overhead conductors and OPGW. You will need to learn their product structure, performance characteristics, classification, as well as regional standards for different countries. I will share the commercial‑business PPTs with you after you finish the technical learning.</p><p>2. Yes, I have visited our factory on‑site, where I observed the actual production processes and finished products. I would suggest you visit the factory and see real‑life products yourself if you get a chance alongside your theoretical study.</p><p><em>3. We have a tutor delivering theoretical lectures for around one hour every day. Besides, we get hands‑on practice on real‑world commercial projects (not technical projects) via the CRM quotation system.</em></p><p><em>4. We used to take weekly exams covering both commercial and technical knowledge. At this stage, we focus more on practical exercises within the CRM system.</em></p><p>5. We don’t have dedicated one‑on‑one tutoring since our product‑line instructors are heavily occupied. Nevertheless, we can go directly to consult them whenever we encounter unsolvable questions.</p>','','2026-08-14 01:40:47','2027-01-01 07:59:59','3',3,1,NULL,NULL,NULL,NULL,NULL,NULL,0,'2026-10-16 07:00:00','2027-01-01 07:59:00','1',0,0,'task',0,0,5,0,NULL,400,'',37,NULL,NULL,NULL,NULL,'2026-08-14 02:06:21'),(55,2,'Learn about OPGW and conductor','<p>by october 16th and CRM as well, so that i don\'t get left behind</p><img src=\"http://localhost:8080/files/get?module=ticket&amp;encName=15a493eff46477c4e392d96afaae4b14&amp;ext=png&amp;realName=619ffd9941af4de8b52598d1ccc34302.png\" alt=\"619ffd9941af4de8b52598d1ccc34302.png\"><img src=\"http://localhost:8080/files/get?module=ticket&amp;encName=8cf70f40dcb05eaa8776d725b87e8f36&amp;ext=png&amp;realName=a38c54b8ccf2f8b9112a75e446afcec5.png\" alt=\"a38c54b8ccf2f8b9112a75e446afcec5.png\">','','2026-08-17 00:16:21','2026-10-17 06:59:00','1',4,1,NULL,NULL,NULL,NULL,NULL,NULL,0,'0000-00-00 00:00:00','0000-00-00 00:00:00','1',0,0,'task',0,0,8,0,NULL,300,'',37,NULL,NULL,NULL,NULL,'2026-08-17 00:16:21'),(56,2,'GO through HR materials according to schedule prepared','<p>lecture series 1-7</p><p></p>','','2026-08-17 00:17:07','2026-08-15 06:59:00','3',0,1,NULL,NULL,NULL,NULL,NULL,NULL,0,'0000-00-00 00:00:00','0000-00-00 00:00:00','1',0,0,'task',0,0,2,0,NULL,200,'',37,NULL,NULL,NULL,NULL,'2026-08-17 00:17:07'),(57,2,'Talk to Mr. Sheng to confirm whether CRM is necessary based on my further job roles','','','2026-08-14 02:47:39','0000-00-00 00:00:00','2',0,1,NULL,NULL,NULL,NULL,NULL,NULL,0,'0000-00-00 00:00:00','0000-00-00 00:00:00','1',0,0,'task',0,0,0.5,0,NULL,0,'',37,NULL,NULL,NULL,NULL,'2026-08-14 02:57:56'),(58,2,'Prepare for exams with 王夏青','<p>Jeff: For the exams, please let 王夏青 to support you to collate from tutors. The aim is not on how many scores you get but to check how well you get relative knowledge.</p><p>Ryan-王夏青: we can discuss about technical and commercial-business knowledge to improve together[GoForIt]<br></p><p>ME: Also can you please, inform me about the regular tests or exams? Is there a schedule about this if not when can we expect to have this?</p><p>Ryan : no i don\'t know whether we will have test</p><p></p>','','2026-08-14 02:59:43','0000-00-00 00:00:00','',3,1,NULL,NULL,NULL,NULL,NULL,NULL,0,'0000-00-00 00:00:00','0000-00-00 00:00:00','1',0,0,'task',0,0,13,0,NULL,0,'',37,NULL,NULL,NULL,NULL,'2026-08-14 02:59:43'),(59,2,'Ask Ryan about exam details and schedule and arrangement with tutors','<img src=\"http://localhost:8080/files/get?module=ticket&amp;encName=0aceb3789f218b34d444823a03a41616&amp;ext=png&amp;realName=image.png\" alt=\"image.png\"><p>he doesn’t know about the tests</p>','','2026-08-14 02:15:08','0000-00-00 00:00:00','3',0,1,NULL,NULL,NULL,NULL,NULL,NULL,58,'0000-00-00 00:00:00','0000-00-00 00:00:00','1',0,0,'subtask',0,0,0.5,0,NULL,0,'',37,NULL,NULL,NULL,NULL,'2026-08-14 02:15:14'),(60,2,'Remind 王夏青to inform me about production lines after October 16th','','','2026-08-14 06:10:13','2026-10-17 06:59:00','3',3,1,NULL,NULL,NULL,NULL,NULL,NULL,58,'0000-00-00 00:00:00','0000-00-00 00:00:00','1',0,0,'subtask',0,0,8,0,NULL,0,'production line,visit,factory,product,HV,Cables',37,NULL,NULL,NULL,NULL,'2026-08-17 10:37:11'),(61,2,'create all money deduction risk accessment blueprint','<ul><li><p>make a list of thing that might deduct money if not proper attention and put them in the blueprint</p></li><li><p>Check monthly review mailbox especially around fist two week of every month</p></li></ul><p></p>','','2026-08-17 00:13:41','0000-00-00 00:00:00','2',0,1,NULL,NULL,NULL,NULL,NULL,NULL,0,'0000-00-00 00:00:00','0000-00-00 00:00:00','1',0,0,'task',0,0,0,0,NULL,0,'money,salary,risk,planning,blueprint',37,NULL,NULL,NULL,NULL,'2026-08-17 10:36:57'),(62,2,'GO through Production Line according to schedule prepared','<table style=\"min-width: 125px;\"><colgroup><col style=\"min-width: 25px;\"><col style=\"min-width: 25px;\"><col style=\"min-width: 25px;\"><col style=\"min-width: 25px;\"><col style=\"min-width: 25px;\"></colgroup><tbody><tr><td colspan=\"1\" rowspan=\"1\"><p style=\"text-align: justify;\"><span style=\"font-family: Calibri;\">Lecture series</span></p></td><td colspan=\"1\" rowspan=\"1\"><p style=\"text-align: justify;\"><span style=\"font-family: Calibri;\">Categories</span></p></td><td colspan=\"1\" rowspan=\"1\"><p style=\"text-align: justify;\"><span style=\"font-family: Calibri;\">Time allocation</span></p></td><td colspan=\"1\" rowspan=\"1\"><p style=\"text-align: justify;\"><span style=\"font-family: Calibri;\">Date and time</span></p></td><td colspan=\"1\" rowspan=\"1\"><p style=\"text-align: justify;\"><span style=\"font-family: Calibri;\">Progress</span></p></td></tr><tr><td colspan=\"1\" rowspan=\"1\"><p style=\"text-align: justify;\"><span style=\"font-family: Calibri;\">1 - 7</span></p></td><td colspan=\"1\" rowspan=\"1\"><p style=\"text-align: justify;\"><span style=\"font-family: Calibri;\">Human resource (HR)</span></p></td><td colspan=\"1\" rowspan=\"1\"><p style=\"text-align: justify;\"><span style=\"font-family: Calibri;\">2 hours</span></p></td><td colspan=\"1\" rowspan=\"1\"><p style=\"text-align: justify;\"><span style=\"font-family: Calibri;\">2026-08-14 8:00 - 10:00</span></p></td><td colspan=\"1\" rowspan=\"1\"><p style=\"text-align: justify;\"><span style=\"font-family: Calibri;\">complete</span></p></td></tr><tr><td colspan=\"1\" rowspan=\"1\"><p style=\"text-align: justify;\"><span style=\"font-family: Calibri;\">8</span></p></td><td colspan=\"1\" rowspan=\"1\"><p style=\"text-align: justify;\"><span style=\"font-family: Calibri;\">Business department</span></p></td><td colspan=\"1\" rowspan=\"1\"><p style=\"text-align: justify;\"><span style=\"font-family: Calibri;\">4 hours</span></p></td><td colspan=\"1\" rowspan=\"1\"><p style=\"text-align: justify;\"><span style=\"font-family: Calibri;\">2026-08-14 10:00 - 12:00</span></p><p style=\"text-align: justify;\"><span style=\"font-family: Calibri;\">2026-08-14 13:00 - 15:00</span></p></td><td colspan=\"1\" rowspan=\"1\"><p style=\"text-align: left;\"><span style=\"font-family: Calibri;\">complete</span></p></td></tr><tr><td colspan=\"1\" rowspan=\"1\"><p style=\"text-align: justify;\"><span style=\"font-family: Calibri;\">9, 10, 11</span></p></td><td colspan=\"1\" rowspan=\"1\"><p style=\"text-align: justify;\"><span style=\"font-family: Calibri;\">Business code of conduct, Finance, Supply chain,</span></p><p style=\"text-align: justify;\"><span style=\"font-family: Calibri;\">Trading Terms</span></p><p style=\"text-align: justify;\"><span style=\"font-family: Calibri;\">&nbsp;</span></p></td><td colspan=\"1\" rowspan=\"1\"><p style=\"text-align: justify;\"><span style=\"font-family: Calibri;\">2.5 hours</span></p></td><td colspan=\"1\" rowspan=\"1\"><p style=\"text-align: justify;\"><span style=\"font-family: Calibri;\">2026-08-14 15:00 - 17:30</span></p><p style=\"text-align: justify;\"><span style=\"font-family: Calibri;\">&nbsp;</span></p><p style=\"text-align: justify;\"><span style=\"font-family: Calibri;\">&nbsp;</span></p></td><td colspan=\"1\" rowspan=\"1\"><p style=\"text-align: justify;\"><span style=\"font-family: Calibri;\">complete</span></p></td></tr><tr><td colspan=\"1\" rowspan=\"1\"><p style=\"text-align: justify;\"><span style=\"font-family: Calibri;\">12, 16</span></p></td><td colspan=\"1\" rowspan=\"1\"><p style=\"text-align: justify;\"><span style=\"font-family: Calibri;\">Product lines Introduction</span></p></td><td colspan=\"1\" rowspan=\"1\"><p style=\"text-align: justify;\"><span style=\"font-family: Calibri;\">8-10 hours</span></p></td><td colspan=\"1\" rowspan=\"1\"><p style=\"text-align: justify;\"><span style=\"font-family: Calibri;\">2026-08-17 08:00 - 17:30</span></p></td><td colspan=\"1\" rowspan=\"1\"><p style=\"text-align: justify;\"><span style=\"font-family: Calibri;\">&nbsp;</span></p></td></tr><tr><td colspan=\"1\" rowspan=\"1\"><p style=\"text-align: justify;\"><span style=\"font-family: Calibri;\">13, 14 ,15</span></p></td><td colspan=\"1\" rowspan=\"1\"><p style=\"text-align: justify;\"><span style=\"font-family: Calibri;\">BG division Introduction, Operation and management, Services of Engineering companies</span></p></td><td colspan=\"1\" rowspan=\"1\"><p style=\"text-align: justify;\"><span style=\"font-family: Calibri;\">4 hours</span></p></td><td colspan=\"1\" rowspan=\"1\"><p style=\"text-align: justify;\"><span style=\"font-family: Calibri;\">2026-08-18 08:00 - 12:00</span></p><p style=\"text-align: justify;\"><span style=\"font-family: Calibri;\">&nbsp;</span></p></td><td colspan=\"1\" rowspan=\"1\"><p style=\"text-align: justify;\"><span style=\"font-family: Calibri;\">&nbsp;</span></p></td></tr><tr><td colspan=\"1\" rowspan=\"1\"><p style=\"text-align: justify;\"><span style=\"font-family: Calibri;\">17, 18, 19</span></p></td><td colspan=\"1\" rowspan=\"1\"><p style=\"text-align: justify;\"><span style=\"font-family: Calibri;\">Project management and Operations</span></p></td><td colspan=\"1\" rowspan=\"1\"><p style=\"text-align: justify;\"><span style=\"font-family: Calibri;\">4.5 hours</span></p></td><td colspan=\"1\" rowspan=\"1\"><p style=\"text-align: justify;\"><span style=\"font-family: Calibri;\">2026-08-18 13:00 - 17:30</span></p><p style=\"text-align: justify;\"><span style=\"font-family: Calibri;\">&nbsp;</span></p></td><td colspan=\"1\" rowspan=\"1\"><p style=\"text-align: justify;\"><span style=\"font-family: Calibri;\">&nbsp;</span></p></td></tr><tr><td colspan=\"1\" rowspan=\"1\"><p style=\"text-align: justify;\"><span style=\"font-family: Calibri;\">From </span><span style=\"font-family: SimSun;\">王夏青</span></p></td><td colspan=\"1\" rowspan=\"1\"><p style=\"text-align: justify;\"><span style=\"font-family: Calibri;\">OPGW, conductors ppts and other related</span></p><p style=\"text-align: justify;\"><span style=\"font-family: Calibri;\">documents</span></p></td><td colspan=\"1\" rowspan=\"1\"><p style=\"text-align: justify;\"><span style=\"font-family: Calibri;\">8-10 hours</span></p></td><td colspan=\"1\" rowspan=\"1\"><p style=\"text-align: justify;\"><span style=\"font-family: Calibri;\">2026-08-19 08:00 - 17:30</span></p><p style=\"text-align: justify;\"><span style=\"font-family: Calibri;\">&nbsp;</span></p></td><td colspan=\"1\" rowspan=\"1\"><p style=\"text-align: justify;\"></p></td></tr></tbody></table>','','2026-08-17 00:19:45','0000-00-00 00:00:00','',3,1,NULL,NULL,NULL,NULL,NULL,NULL,0,'0000-00-00 00:00:00','0000-00-00 00:00:00','1',0,0,'task',0,0,0,0,NULL,0,'',37,NULL,NULL,NULL,NULL,'2026-08-17 00:19:45'),(63,1,'Apply HOusing Subsidy in Suzhou app','<p></p>','','2026-08-17 01:17:31','0000-00-00 00:00:00','',4,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00','1',0,0,'task',0,0,0,NULL,NULL,0,'',1,NULL,NULL,NULL,NULL,'2026-08-17 08:22:49'),(64,1,'Wash Curtain in B122 room and then contact reception for putting it back','','','2026-08-17 00:57:24','0000-00-00 00:00:00','',3,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00','1',0,0,'task',0,0,0,NULL,NULL,0,'',1,NULL,NULL,NULL,NULL,'2026-08-17 08:22:50'),(65,2,'Attend conference in Main Hall of Hengtong at 9 am','','','2026-08-17 10:36:45','0000-00-00 00:00:00','',3,1,NULL,NULL,NULL,NULL,NULL,NULL,0,'0000-00-00 00:00:00','0000-00-00 00:00:00','1',0,0,'task',0,0,0,0,NULL,0,'',37,NULL,NULL,NULL,NULL,'2026-08-17 10:36:49'),(66,2,'Daily task Wednesday Aug 19 2026 focused on Companies and products','<p><span style=\"font-family: SimSun; font-size: 12pt;\"><strong>Action 1 :</strong>&nbsp;&nbsp;Research main four +1 main companies acquired by Hengtong : Voksel, Cablescomm, Aberdare, Alcobre and HT-CABOS. because these companies can help use enter the local market more easily.</span></p><p><span style=\"font-family: SimSun; font-size: 12pt;\"><strong>&nbsp;</strong></span></p><p><span style=\"font-family: SimSun; font-size: 12pt;\"><strong>Results:</strong></span></p><p><span>1. </span><span style=\"font-family: SimSun; font-size: 12pt;\">Made a docx file to share with 孙德林-Sampson and discussed how to effectively present Hengtong group to customers</span></p><p><span style=\"font-family: Calibri; font-size: 12pt;\"><strong>&nbsp;</strong></span></p><p><span style=\"font-family: SimSun; font-size: 12pt;\"><strong>Action 2: </strong>Understand confusion and unknown things raised in the meeting with 孙德林-Sampson; such as Hengtong companies, subsidiaries and industrial parks.</span></p><p><span style=\"font-family: SimSun; font-size: 12pt;\"><strong>&nbsp;</strong></span></p><p><span style=\"font-family: SimSun; font-size: 12pt;\"><strong>Results:</strong></span></p><p><span style=\"font-family: Calibri; font-size: 12pt;\"><strong>&nbsp;</strong></span></p><p><span style=\"font-family: SimSun; font-size: 12pt;\"><strong>Action 3: </strong>&nbsp;Go through these ppt and document to better understand products</span></p><p></p><img src=\"file:////Users/amritdhakal/Library/Containers/com.kingsoft.wpsoffice.mac/Data/tmp/wps-amritdhakal/ksohtml//wps1.jpg\" width=\"1660\" style=\"width: 1660px;\"><p><span style=\"font-family: SimSun; font-size: 12pt;\">&nbsp;</span></p><p><span style=\"font-family: SimSun; font-size: 12pt;\"><strong>Results:</strong></span></p><p><span style=\"font-family: Calibri; font-size: 12pt;\">&nbsp;</span></p><p><span style=\"font-family: Calibri; font-size: 12pt;\">&nbsp;</span></p><p><span style=\"font-family: SimSun; font-size: 12pt;\"><strong>Action 4: </strong>Attend meeting with 孙德林-Sampson at 2pm</span></p><p><span style=\"font-family: SimSun; font-size: 12pt;\">&nbsp;</span></p><p><span style=\"font-family: SimSun; font-size: 12pt;\"><strong>Results:</strong></span></p><p><span style=\"font-family: SimSun; font-size: 12pt;\">&nbsp;</span></p><p><span style=\"font-family: SimSun; font-size: 12pt;\"><strong>Next Steps</strong></span></p><p><span style=\"font-family: Calibri; font-size: 12pt;\">&nbsp;</span></p><p><span style=\"font-family: Calibri; font-size: 12pt;\">&nbsp;</span></p>','','2026-08-19 02:43:08','0000-00-00 00:00:00','',3,1,NULL,NULL,NULL,NULL,NULL,NULL,0,'0000-00-00 00:00:00','0000-00-00 00:00:00','1',0,0,'task',0,0,0,0,NULL,0,'',37,NULL,NULL,NULL,NULL,'2026-08-19 02:43:08');
/*!40000 ALTER TABLE `zp_tickets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zp_timesheets`
--

DROP TABLE IF EXISTS `zp_timesheets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zp_timesheets` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `userId` int DEFAULT NULL,
  `ticketId` int DEFAULT NULL,
  `workDate` datetime DEFAULT NULL,
  `hours` double DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `kind` varchar(175) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `invoicedEmpl` int DEFAULT NULL,
  `invoicedComp` int DEFAULT NULL,
  `invoicedEmplDate` datetime DEFAULT NULL,
  `invoicedCompDate` datetime DEFAULT NULL,
  `rate` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `paid` int DEFAULT NULL,
  `paidDate` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Unique` (`userId`,`ticketId`,`workDate`,`kind`),
  KEY `idx_timesheets_ticketId` (`ticketId`),
  KEY `idx_timesheets_userId_workDate` (`userId`,`workDate`),
  KEY `idx_timesheets_ticketId_workDate` (`ticketId`,`workDate`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zp_timesheets`
--

LOCK TABLES `zp_timesheets` WRITE;
/*!40000 ALTER TABLE `zp_timesheets` DISABLE KEYS */;
INSERT INTO `zp_timesheets` VALUES (1,1,10,'2026-07-19 07:00:00',0.74,NULL,'GENERAL_BILLABLE',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2026-07-19 20:13:45');
/*!40000 ALTER TABLE `zp_timesheets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zp_user`
--

DROP TABLE IF EXISTS `zp_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zp_user` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(175) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `firstname` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `lastname` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `phone` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `profileId` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `lastlogin` datetime DEFAULT NULL,
  `status` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'A',
  `expires` datetime DEFAULT NULL,
  `role` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `session` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sessiontime` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `wage` int DEFAULT NULL,
  `hours` int DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `clientId` int DEFAULT NULL,
  `notifications` int DEFAULT NULL,
  `pwReset` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pwResetExpiration` datetime DEFAULT NULL,
  `pwResetCount` int DEFAULT NULL,
  `forcePwReset` tinyint DEFAULT NULL,
  `lastpwd_change` datetime DEFAULT NULL,
  `settings` text COLLATE utf8mb4_unicode_ci,
  `twoFAEnabled` tinyint NOT NULL DEFAULT '0',
  `twoFASecret` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `createdOn` datetime DEFAULT NULL,
  `source` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `jobTitle` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `jobLevel` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `department` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  KEY `idx_user_clientId` (`clientId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zp_user`
--

LOCK TABLES `zp_user` WRITE;
/*!40000 ALTER TABLE `zp_user` DISABLE KEYS */;
INSERT INTO `zp_user` VALUES (1,'bhokanid@gmail.com','$2y$10$TX.NBlEy.kKQeM4pTtmEguim3VdRAcwh8ymW8YNe5Xo1IoDu2Lv3q','Anid','Bhok','','2','2026-08-18 19:41:37','A',NULL,'50','uc1NK75cz86yMql0H0Wk36Ck8j72E8ZI87E1UPxX','1787107297',0,0,NULL,0,1,NULL,NULL,NULL,NULL,NULL,'a:10:{s:6:\"modals\";a:11:{s:17:\"homeDashboardTour\";i:1;s:4:\"home\";s:1:\"1\";s:20:\"projectDashboardTour\";i:1;s:16:\"projectDashboard\";s:1:\"1\";s:6:\"kanban\";i:1;s:7:\"roadmap\";i:1;s:5:\"goals\";i:1;s:12:\"mytimesheets\";i:1;s:9:\"ideaBoard\";i:1;s:10:\"blueprints\";i:1;s:4:\"wiki\";i:1;}s:13:\"submenuToggle\";a:10:{s:38:\"accordion_content-task-children-later1\";s:4:\"open\";s:8:\"mainMenu\";s:4:\"open\";s:45:\"accordion_content-myProjectsHub-otherProjects\";s:4:\"open\";s:11:\"materialize\";s:4:\"open\";s:10:\"understand\";s:4:\"open\";s:8:\"dataroom\";s:4:\"open\";s:40:\"accordion_content-task-children-overdue1\";s:4:\"open\";s:39:\"accordion_content-ticketBox1-thisWeek-0\";s:4:\"open\";s:36:\"accordion_content-ticketBox1-later-1\";s:4:\"open\";s:21:\"dashboardCalendarView\";s:11:\"timeGridDay\";}s:6:\"colors\";a:2:{s:12:\"primaryColor\";b:0;s:14:\"secondaryColor\";s:7:\"#00a887\";}s:15:\"backgroundImage\";s:0:\"\";s:5:\"theme\";s:7:\"default\";s:9:\"colorMode\";s:5:\"light\";s:11:\"colorScheme\";s:12:\"themeDefault\";s:9:\"themeFont\";s:6:\"Roboto\";s:14:\"backgroundType\";s:8:\"gradient\";s:5:\"views\";a:1:{s:7:\"roadmap\";s:4:\"Week\";}}',0,NULL,'2026-07-17 09:52:14',NULL,'International market reserve','','','2026-08-14 08:08:55'),(4,'elmansourib986@gmail.com','$2y$10$gluXeR65Z.JLt.VOuc8rwOcrsasb4iwjJA3O3NEwDxmfd63NYuYHi','basma','','','','2026-08-03 23:32:05','a',NULL,'20','1W6ANoRF6ivEReECcviEaqoNqeC40o2HiAUwFRCi','1785825125',0,0,NULL,0,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,'2026-08-04 14:22:17','','','','','2026-08-04 14:34:32');
/*!40000 ALTER TABLE `zp_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zp_work_structure_elements`
--

DROP TABLE IF EXISTS `zp_work_structure_elements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zp_work_structure_elements` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `structure_id` bigint unsigned NOT NULL,
  `type_key` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `domain_reference` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sort_order` int NOT NULL DEFAULT '0',
  `meta` json DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_wse_structure_type_key` (`structure_id`,`type_key`),
  KEY `idx_wse_structure_id` (`structure_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zp_work_structure_elements`
--

LOCK TABLES `zp_work_structure_elements` WRITE;
/*!40000 ALTER TABLE `zp_work_structure_elements` DISABLE KEYS */;
INSERT INTO `zp_work_structure_elements` VALUES (1,1,'milestone','Milestone','','Leantime\\Domain\\Tickets',1,NULL,'2026-07-17 09:52:15'),(2,1,'task','Task','','Leantime\\Domain\\Tickets',2,NULL,'2026-07-17 09:52:15'),(3,1,'goal','Goal','','Leantime\\Domain\\Goalcanvas',3,NULL,'2026-07-17 09:52:15');
/*!40000 ALTER TABLE `zp_work_structure_elements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zp_work_structure_mappings`
--

DROP TABLE IF EXISTS `zp_work_structure_mappings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zp_work_structure_mappings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `source_structure_id` bigint unsigned NOT NULL,
  `source_element_id` bigint unsigned NOT NULL,
  `target_structure_id` bigint unsigned NOT NULL,
  `target_element_id` bigint unsigned NOT NULL,
  `mapping_type` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'generates',
  `meta` json DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_wsm_unique_mapping` (`source_structure_id`,`source_element_id`,`target_structure_id`),
  KEY `idx_wsm_source_target` (`source_structure_id`,`target_structure_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zp_work_structure_mappings`
--

LOCK TABLES `zp_work_structure_mappings` WRITE;
/*!40000 ALTER TABLE `zp_work_structure_mappings` DISABLE KEYS */;
/*!40000 ALTER TABLE `zp_work_structure_mappings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zp_work_structure_relationships`
--

DROP TABLE IF EXISTS `zp_work_structure_relationships`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zp_work_structure_relationships` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `structure_id` bigint unsigned NOT NULL,
  `from_element_id` bigint unsigned NOT NULL,
  `to_element_id` bigint unsigned NOT NULL,
  `relationship_type` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `meta` json DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_wsr_structure_id` (`structure_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zp_work_structure_relationships`
--

LOCK TABLES `zp_work_structure_relationships` WRITE;
/*!40000 ALTER TABLE `zp_work_structure_relationships` DISABLE KEYS */;
INSERT INTO `zp_work_structure_relationships` VALUES (1,1,2,1,'belongs_to','',NULL),(2,1,1,3,'measures','',NULL);
/*!40000 ALTER TABLE `zp_work_structure_relationships` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zp_work_structures`
--

DROP TABLE IF EXISTS `zp_work_structures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zp_work_structures` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `type` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'custom',
  `created_by` int DEFAULT NULL,
  `meta` json DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `modified_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_work_structures_title` (`title`),
  KEY `idx_work_structures_type` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zp_work_structures`
--

LOCK TABLES `zp_work_structures` WRITE;
/*!40000 ALTER TABLE `zp_work_structures` DISABLE KEYS */;
INSERT INTO `zp_work_structures` VALUES (1,'Project','','system',NULL,NULL,'2026-07-17 09:52:15','2026-07-17 09:52:15');
/*!40000 ALTER TABLE `zp_work_structures` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-08-19  3:02:16
