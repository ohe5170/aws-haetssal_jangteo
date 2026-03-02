-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: localhost    Database: haetssal_jangteo
-- ------------------------------------------------------
-- Server version	8.0.30

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
-- Table structure for table `tbl_auth`
--

DROP TABLE IF EXISTS `tbl_auth`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_auth` (
  `id` bigint unsigned NOT NULL,
  `auth_provider` enum('haetssal','social') DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_user_auth` FOREIGN KEY (`id`) REFERENCES `tbl_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_auth`
--

LOCK TABLES `tbl_auth` WRITE;
/*!40000 ALTER TABLE `tbl_auth` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_auth` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_category`
--

DROP TABLE IF EXISTS `tbl_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_category` (
  `id` bigint unsigned NOT NULL,
  `category_name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_category`
--

LOCK TABLES `tbl_category` WRITE;
/*!40000 ALTER TABLE `tbl_category` DISABLE KEYS */;
INSERT INTO `tbl_category` VALUES (1,'과일');
/*!40000 ALTER TABLE `tbl_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_delivery`
--

DROP TABLE IF EXISTS `tbl_delivery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_delivery` (
  `id` bigint unsigned NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `delivery_address` varchar(255) NOT NULL,
  `delivery_detail_address` varchar(255) NOT NULL,
  `delivery_phone` varchar(100) NOT NULL,
  `delivery_is_main` tinyint(1) DEFAULT '0',
  `delivery_message` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_delivery_user` (`user_id`),
  CONSTRAINT `fk_delivery_user` FOREIGN KEY (`user_id`) REFERENCES `tbl_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_delivery`
--

LOCK TABLES `tbl_delivery` WRITE;
/*!40000 ALTER TABLE `tbl_delivery` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_delivery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_file`
--

DROP TABLE IF EXISTS `tbl_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_file` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `file_type` enum('image','document') NOT NULL,
  `file_name` varchar(255) NOT NULL,
  `file_origin_name` varchar(255) NOT NULL,
  `file_saved_path` varchar(255) NOT NULL,
  `file_size` varchar(255) NOT NULL,
  `created_datetime` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_file`
--

LOCK TABLES `tbl_file` WRITE;
/*!40000 ALTER TABLE `tbl_file` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_file_item`
--

DROP TABLE IF EXISTS `tbl_file_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_file_item` (
  `id` bigint unsigned NOT NULL,
  `item_id` bigint unsigned NOT NULL,
  `file_item_type` enum('thumbnail','desc','seller-info','refund') NOT NULL,
  KEY `fk_file_item` (`id`),
  KEY `fk_target_item` (`item_id`),
  CONSTRAINT `fk_file_item` FOREIGN KEY (`id`) REFERENCES `tbl_file` (`id`),
  CONSTRAINT `fk_target_item` FOREIGN KEY (`item_id`) REFERENCES `tbl_item` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_file_item`
--

LOCK TABLES `tbl_file_item` WRITE;
/*!40000 ALTER TABLE `tbl_file_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_file_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_file_market`
--

DROP TABLE IF EXISTS `tbl_file_market`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_file_market` (
  `id` bigint unsigned NOT NULL,
  `market_id` bigint unsigned NOT NULL,
  KEY `fk_file_market` (`id`),
  KEY `fk_target_market` (`market_id`),
  CONSTRAINT `fk_file_market` FOREIGN KEY (`id`) REFERENCES `tbl_file` (`id`),
  CONSTRAINT `fk_target_market` FOREIGN KEY (`market_id`) REFERENCES `tbl_market` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_file_market`
--

LOCK TABLES `tbl_file_market` WRITE;
/*!40000 ALTER TABLE `tbl_file_market` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_file_market` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_file_report`
--

DROP TABLE IF EXISTS `tbl_file_report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_file_report` (
  `id` bigint unsigned NOT NULL,
  `report_id` bigint unsigned NOT NULL,
  KEY `fk_file_report` (`id`),
  KEY `fk_target_report` (`report_id`),
  CONSTRAINT `fk_file_report` FOREIGN KEY (`id`) REFERENCES `tbl_file` (`id`),
  CONSTRAINT `fk_target_report` FOREIGN KEY (`report_id`) REFERENCES `tbl_report` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_file_report`
--

LOCK TABLES `tbl_file_report` WRITE;
/*!40000 ALTER TABLE `tbl_file_report` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_file_report` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_file_review`
--

DROP TABLE IF EXISTS `tbl_file_review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_file_review` (
  `id` bigint unsigned NOT NULL,
  `report_id` bigint unsigned NOT NULL,
  KEY `fk_file_review` (`id`),
  KEY `fk_target_review` (`report_id`),
  CONSTRAINT `fk_file_review` FOREIGN KEY (`id`) REFERENCES `tbl_file` (`id`),
  CONSTRAINT `fk_target_review` FOREIGN KEY (`report_id`) REFERENCES `tbl_review` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_file_review`
--

LOCK TABLES `tbl_file_review` WRITE;
/*!40000 ALTER TABLE `tbl_file_review` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_file_review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_file_store`
--

DROP TABLE IF EXISTS `tbl_file_store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_file_store` (
  `id` bigint unsigned NOT NULL,
  `store_id` bigint unsigned NOT NULL,
  KEY `fk_file_store` (`id`),
  KEY `fk_target_store` (`store_id`),
  CONSTRAINT `fk_file_store` FOREIGN KEY (`id`) REFERENCES `tbl_file` (`id`),
  CONSTRAINT `fk_target_store` FOREIGN KEY (`store_id`) REFERENCES `tbl_store` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_file_store`
--

LOCK TABLES `tbl_file_store` WRITE;
/*!40000 ALTER TABLE `tbl_file_store` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_file_store` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_file_user`
--

DROP TABLE IF EXISTS `tbl_file_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_file_user` (
  `id` bigint unsigned NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  KEY `fk_file_user` (`id`),
  KEY `fk_target_user` (`user_id`),
  CONSTRAINT `fk_file_user` FOREIGN KEY (`id`) REFERENCES `tbl_file` (`id`),
  CONSTRAINT `fk_target_user` FOREIGN KEY (`user_id`) REFERENCES `tbl_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_file_user`
--

LOCK TABLES `tbl_file_user` WRITE;
/*!40000 ALTER TABLE `tbl_file_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_file_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_item`
--

DROP TABLE IF EXISTS `tbl_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_item` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `item_store_id` bigint unsigned NOT NULL,
  `item_category_id` bigint unsigned NOT NULL,
  `item_name` varchar(255) NOT NULL,
  `item_type` varchar(100) NOT NULL DEFAULT 'normal',
  `item_stock` varchar(255) DEFAULT '0',
  `item_price` varchar(255) DEFAULT '0',
  `item_delivery_fee` varchar(255) DEFAULT '0',
  `item_content` longtext NOT NULL,
  `item_state` enum('active','inactive','pending') DEFAULT 'active',
  `item_view_count` int DEFAULT '0',
  `created_datetime` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_datetime` datetime DEFAULT CURRENT_TIMESTAMP,
  `item_viewers` bigint unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_item_store` (`item_store_id`),
  KEY `fk_item_category` (`item_category_id`),
  CONSTRAINT `fk_item_category` FOREIGN KEY (`item_category_id`) REFERENCES `tbl_category` (`id`),
  CONSTRAINT `fk_item_store` FOREIGN KEY (`item_store_id`) REFERENCES `tbl_store` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_item`
--

LOCK TABLES `tbl_item` WRITE;
/*!40000 ALTER TABLE `tbl_item` DISABLE KEYS */;
INSERT INTO `tbl_item` VALUES (8,1,1,'사과박스','normal','10','15000','0','테스트','active',924,'2026-02-11 23:56:50','2026-02-11 23:56:50',0),(9,1,1,'사과 박스','normal','40','15000','0','사과 1 BOX (10KG)','active',143,'2026-02-11 23:57:44','2026-02-11 23:57:44',0),(10,1,1,'사과 박스','normal','40','15000','0','사과 1 BOX (10KG)','active',945,'2026-02-12 09:49:35','2026-02-18 19:55:07',0),(11,1,1,'사과박스','normal','10','15000','0','테스트','active',296,'2026-02-18 22:18:52','2026-02-18 22:18:52',0),(12,1,1,'사과박스','normal','10','15000','0','테스트','active',646,'2026-02-18 22:18:54','2026-02-18 22:18:54',0),(13,1,1,'사과박스','normal','10','15000','0','테스트','active',344,'2026-02-18 22:18:56','2026-02-18 22:18:56',0),(14,1,1,'사과박스','normal','10','15000','0','테스트','active',780,'2026-02-18 22:18:56','2026-02-18 22:18:56',0),(15,1,1,'사과박스','normal','10','15000','0','테스트','active',870,'2026-02-18 22:18:57','2026-02-18 22:18:57',0),(16,1,1,'사과박스','normal','10','15000','0','테스트','active',11,'2026-02-18 22:18:58','2026-02-18 22:18:58',0),(17,1,1,'사과박스','normal','10','15000','0','테스트','active',446,'2026-02-18 22:18:59','2026-02-18 22:18:59',0),(18,1,1,'사과박스','normal','10','15000','0','테스트','active',197,'2026-02-18 22:18:59','2026-02-18 22:18:59',0),(19,1,1,'사과박스','normal','10','15000','0','테스트','active',648,'2026-02-18 22:23:19','2026-02-18 22:23:19',0),(20,1,1,'사과박스','normal','10','15000','0','테스트','active',650,'2026-02-18 22:23:21','2026-02-18 22:23:21',0),(21,1,1,'사과박스','normal','10','15000','0','테스트','active',304,'2026-02-18 22:23:22','2026-02-18 22:23:22',0),(22,1,1,'사과박스','normal','10','15000','0','테스트','active',572,'2026-02-18 22:23:23','2026-02-18 22:23:23',0);
/*!40000 ALTER TABLE `tbl_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_item_option`
--

DROP TABLE IF EXISTS `tbl_item_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_item_option` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `option_item_id` bigint unsigned NOT NULL,
  `option_name` varchar(255) NOT NULL,
  `option_detail` longtext NOT NULL,
  `option_price` int DEFAULT '0',
  `option_stock` int DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_option_item` (`option_item_id`),
  CONSTRAINT `fk_option_item` FOREIGN KEY (`option_item_id`) REFERENCES `tbl_item` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_item_option`
--

LOCK TABLES `tbl_item_option` WRITE;
/*!40000 ALTER TABLE `tbl_item_option` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_item_option` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_keyword`
--

DROP TABLE IF EXISTS `tbl_keyword`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_keyword` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `content` varchar(255) NOT NULL,
  `keyword_member_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_keyword_user` (`keyword_member_id`),
  CONSTRAINT `fk_keyword_user` FOREIGN KEY (`keyword_member_id`) REFERENCES `tbl_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_keyword`
--

LOCK TABLES `tbl_keyword` WRITE;
/*!40000 ALTER TABLE `tbl_keyword` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_keyword` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_like_item`
--

DROP TABLE IF EXISTS `tbl_like_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_like_item` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `like_user_id` bigint unsigned NOT NULL,
  `like_item_id` bigint unsigned NOT NULL,
  `created_datetime` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_like_user` (`like_user_id`),
  KEY `fk_like_item` (`like_item_id`),
  CONSTRAINT `fk_like_item` FOREIGN KEY (`like_item_id`) REFERENCES `tbl_item` (`id`),
  CONSTRAINT `fk_like_user` FOREIGN KEY (`like_user_id`) REFERENCES `tbl_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_like_item`
--

LOCK TABLES `tbl_like_item` WRITE;
/*!40000 ALTER TABLE `tbl_like_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_like_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_market`
--

DROP TABLE IF EXISTS `tbl_market`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_market` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `market_region` varchar(100) NOT NULL,
  `market_name` varchar(255) NOT NULL,
  `market_location` varchar(255) NOT NULL,
  `market_state` enum('active','inactive','pending') DEFAULT 'active',
  `created_datetime` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_datetime` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_market`
--

LOCK TABLES `tbl_market` WRITE;
/*!40000 ALTER TABLE `tbl_market` DISABLE KEYS */;
INSERT INTO `tbl_market` VALUES (1,'서울','가락시장','송파구','inactive','2026-02-11 23:48:22','2026-02-18 19:55:28');
/*!40000 ALTER TABLE `tbl_market` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_order`
--

DROP TABLE IF EXISTS `tbl_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_order` (
  `id` bigint unsigned NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `order_delivery_type` enum('post','take') DEFAULT NULL,
  `order_state` enum('pending','complete') DEFAULT 'pending',
  `order_purchase_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `order_take_date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_payment_user` (`user_id`),
  CONSTRAINT `fk_payment_user` FOREIGN KEY (`user_id`) REFERENCES `tbl_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_order`
--

LOCK TABLES `tbl_order` WRITE;
/*!40000 ALTER TABLE `tbl_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_order_item`
--

DROP TABLE IF EXISTS `tbl_order_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_order_item` (
  `id` bigint unsigned NOT NULL,
  `order_id` bigint unsigned NOT NULL,
  `item_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_list_order` (`order_id`),
  KEY `fk_list_item` (`item_id`),
  CONSTRAINT `fk_list_item` FOREIGN KEY (`item_id`) REFERENCES `tbl_item` (`id`),
  CONSTRAINT `fk_list_order` FOREIGN KEY (`order_id`) REFERENCES `tbl_order` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_order_item`
--

LOCK TABLES `tbl_order_item` WRITE;
/*!40000 ALTER TABLE `tbl_order_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_order_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_payment`
--

DROP TABLE IF EXISTS `tbl_payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_payment` (
  `id` bigint unsigned NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `item_id` bigint unsigned NOT NULL,
  `payment_state` enum('pending','shipping','complete','cancelled') DEFAULT 'pending',
  PRIMARY KEY (`id`),
  KEY `fk_pay_user` (`user_id`),
  KEY `fk_pay_item` (`item_id`),
  CONSTRAINT `fk_pay_item` FOREIGN KEY (`item_id`) REFERENCES `tbl_item` (`id`),
  CONSTRAINT `fk_pay_user` FOREIGN KEY (`user_id`) REFERENCES `tbl_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_payment`
--

LOCK TABLES `tbl_payment` WRITE;
/*!40000 ALTER TABLE `tbl_payment` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_report`
--

DROP TABLE IF EXISTS `tbl_report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_report` (
  `id` bigint unsigned NOT NULL,
  `report_type` enum('market','seller','report') DEFAULT 'report',
  `report_reporter_id` bigint unsigned NOT NULL,
  `created_datetime` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_report`
--

LOCK TABLES `tbl_report` WRITE;
/*!40000 ALTER TABLE `tbl_report` DISABLE KEYS */;
INSERT INTO `tbl_report` VALUES (1,'seller',1,'2026-03-02 19:05:44'),(5,'market',1,'2026-02-27 19:15:21');
/*!40000 ALTER TABLE `tbl_report` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_report_item`
--

DROP TABLE IF EXISTS `tbl_report_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_report_item` (
  `report_id` bigint unsigned NOT NULL,
  `item_id` bigint unsigned NOT NULL,
  `report_reason` varchar(255) NOT NULL,
  `report_content` longtext NOT NULL,
  KEY `fk_report_item` (`report_id`),
  KEY `fk_report_target_item` (`item_id`),
  CONSTRAINT `fk_report_item` FOREIGN KEY (`report_id`) REFERENCES `tbl_report` (`id`),
  CONSTRAINT `fk_report_target_item` FOREIGN KEY (`item_id`) REFERENCES `tbl_item` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_report_item`
--

LOCK TABLES `tbl_report_item` WRITE;
/*!40000 ALTER TABLE `tbl_report_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_report_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_report_market`
--

DROP TABLE IF EXISTS `tbl_report_market`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_report_market` (
  `report_id` bigint unsigned NOT NULL,
  `market_id` bigint unsigned NOT NULL,
  `report_state` enum('pending','approved','denied') DEFAULT 'pending',
  KEY `fk_report_market` (`report_id`),
  KEY `fk_report_target_market` (`market_id`),
  CONSTRAINT `fk_report_market` FOREIGN KEY (`report_id`) REFERENCES `tbl_report` (`id`),
  CONSTRAINT `fk_report_target_market` FOREIGN KEY (`market_id`) REFERENCES `tbl_market` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_report_market`
--

LOCK TABLES `tbl_report_market` WRITE;
/*!40000 ALTER TABLE `tbl_report_market` DISABLE KEYS */;
INSERT INTO `tbl_report_market` VALUES (5,1,'pending');
/*!40000 ALTER TABLE `tbl_report_market` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_report_seller`
--

DROP TABLE IF EXISTS `tbl_report_seller`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_report_seller` (
  `report_id` bigint unsigned NOT NULL,
  `seller_id` bigint unsigned NOT NULL,
  `report_state` enum('pending','approved','denied') DEFAULT 'pending',
  KEY `fk_report_seller` (`report_id`),
  KEY `fk_report_target_seller` (`seller_id`),
  CONSTRAINT `fk_report_seller` FOREIGN KEY (`report_id`) REFERENCES `tbl_report` (`id`),
  CONSTRAINT `fk_report_target_seller` FOREIGN KEY (`seller_id`) REFERENCES `tbl_seller` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_report_seller`
--

LOCK TABLES `tbl_report_seller` WRITE;
/*!40000 ALTER TABLE `tbl_report_seller` DISABLE KEYS */;
INSERT INTO `tbl_report_seller` VALUES (1,1,'pending');
/*!40000 ALTER TABLE `tbl_report_seller` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_report_user`
--

DROP TABLE IF EXISTS `tbl_report_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_report_user` (
  `report_id` bigint unsigned NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `report_reason` varchar(255) NOT NULL,
  `report_content` longtext NOT NULL,
  KEY `fk_report_user` (`report_id`),
  KEY `fk_report_target_user` (`user_id`),
  CONSTRAINT `fk_report_target_user` FOREIGN KEY (`user_id`) REFERENCES `tbl_user` (`id`),
  CONSTRAINT `fk_report_user` FOREIGN KEY (`report_id`) REFERENCES `tbl_report` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_report_user`
--

LOCK TABLES `tbl_report_user` WRITE;
/*!40000 ALTER TABLE `tbl_report_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_report_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_review`
--

DROP TABLE IF EXISTS `tbl_review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_review` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `review_item_id` bigint unsigned NOT NULL,
  `review_user_id` bigint unsigned NOT NULL,
  `review_score_quality` int NOT NULL,
  `review_score_delivery` int NOT NULL,
  `review_score_kind` int NOT NULL,
  `review_content` longtext NOT NULL,
  `review_state` enum('active','inactive') DEFAULT NULL,
  `created_datetime` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_datetime` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_review_item` (`review_item_id`),
  KEY `fk_review_user` (`review_user_id`),
  CONSTRAINT `fk_review_item` FOREIGN KEY (`review_item_id`) REFERENCES `tbl_item` (`id`),
  CONSTRAINT `fk_review_user` FOREIGN KEY (`review_user_id`) REFERENCES `tbl_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_review`
--

LOCK TABLES `tbl_review` WRITE;
/*!40000 ALTER TABLE `tbl_review` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_seller`
--

DROP TABLE IF EXISTS `tbl_seller`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_seller` (
  `id` bigint unsigned NOT NULL,
  `seller_bank_name` varchar(100) NOT NULL,
  `seller_depositor` varchar(100) NOT NULL,
  `seller_account_number` varchar(255) NOT NULL,
  `seller_state` enum('pending','approved','denied') DEFAULT 'pending',
  PRIMARY KEY (`id`),
  UNIQUE KEY `seller_account_number` (`seller_account_number`),
  CONSTRAINT `fk_user_id` FOREIGN KEY (`id`) REFERENCES `tbl_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_seller`
--

LOCK TABLES `tbl_seller` WRITE;
/*!40000 ALTER TABLE `tbl_seller` DISABLE KEYS */;
INSERT INTO `tbl_seller` VALUES (1,'국민은행','홍길동','123-456-789012','approved');
/*!40000 ALTER TABLE `tbl_seller` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_store`
--

DROP TABLE IF EXISTS `tbl_store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_store` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `store_market_id` bigint unsigned NOT NULL,
  `store_owner_id` bigint unsigned NOT NULL,
  `store_category_id` bigint unsigned DEFAULT NULL,
  `store_name` varchar(255) NOT NULL,
  `store_intro` longtext NOT NULL,
  `store_address` varchar(255) NOT NULL,
  `store_score` int DEFAULT '100',
  `store_state` enum('pending','denied','open','close') DEFAULT 'pending',
  `store_is_confirmed` tinyint(1) DEFAULT '0',
  `created_datetime` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_datetime` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_market_store` (`store_market_id`),
  KEY `fk_owner_user` (`store_owner_id`),
  CONSTRAINT `fk_market_store` FOREIGN KEY (`store_market_id`) REFERENCES `tbl_market` (`id`),
  CONSTRAINT `fk_owner_user` FOREIGN KEY (`store_owner_id`) REFERENCES `tbl_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_store`
--

LOCK TABLES `tbl_store` WRITE;
/*!40000 ALTER TABLE `tbl_store` DISABLE KEYS */;
INSERT INTO `tbl_store` VALUES (1,1,1,1,'식후경','소개','경기 양평',100,'open',0,'2026-02-11 23:48:38','2026-03-02 21:02:38');
/*!40000 ALTER TABLE `tbl_store` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_sub_category`
--

DROP TABLE IF EXISTS `tbl_sub_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_sub_category` (
  `id` bigint unsigned NOT NULL,
  `category_name` varchar(100) NOT NULL,
  `parent_category_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_parent_category` (`parent_category_id`),
  CONSTRAINT `fk_parent_category` FOREIGN KEY (`parent_category_id`) REFERENCES `tbl_category` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_sub_category`
--

LOCK TABLES `tbl_sub_category` WRITE;
/*!40000 ALTER TABLE `tbl_sub_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_sub_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_user`
--

DROP TABLE IF EXISTS `tbl_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_user` (
  `id` bigint unsigned NOT NULL,
  `user_email` varchar(255) NOT NULL,
  `user_password` varchar(255) DEFAULT NULL,
  `user_phone` varchar(255) NOT NULL,
  `user_type` enum('normal','seller','admin') DEFAULT 'normal',
  `user_name` varchar(100) NOT NULL,
  `user_intro` longtext NOT NULL,
  `user_visit_count` int DEFAULT '1',
  `user_latest_login` datetime DEFAULT CURRENT_TIMESTAMP,
  `user_state` enum('active','inactive') DEFAULT 'active',
  `created_datetime` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_datetime` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_phone` (`user_phone`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_user`
--

LOCK TABLES `tbl_user` WRITE;
/*!40000 ALTER TABLE `tbl_user` DISABLE KEYS */;
INSERT INTO `tbl_user` VALUES (1,'example@example.com',NULL,'01012345678','seller','이순신','설명1',1,'2026-02-11 23:47:53','inactive','2026-02-11 23:47:53','2026-03-02 17:42:23');
/*!40000 ALTER TABLE `tbl_user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-03-03  1:16:53
