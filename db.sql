-- MySQL dump 10.13  Distrib 8.0.27, for Linux (x86_64)
--
-- Host: localhost    Database: mood_tracker
-- ------------------------------------------------------
-- Server version	8.0.27-0ubuntu0.20.04.1

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
-- Table structure for table `answer_groups`
--

DROP TABLE IF EXISTS `answer_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `answer_groups` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `answer_groups_user_id_foreign` (`user_id`),
  CONSTRAINT `answer_groups_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `answer_groups`
--

LOCK TABLES `answer_groups` WRITE;
/*!40000 ALTER TABLE `answer_groups` DISABLE KEYS */;
INSERT INTO `answer_groups` VALUES (16,8,NULL,'2021-12-09 12:13:39','2021-12-09 12:13:39'),(17,9,NULL,'2021-12-09 12:24:49','2021-12-09 12:24:49'),(18,8,NULL,'2021-12-09 13:51:58','2021-12-09 13:51:58'),(19,10,NULL,'2021-12-09 13:58:41','2021-12-09 13:58:41'),(20,11,NULL,'2021-12-16 12:21:34','2021-12-16 12:21:34'),(21,11,NULL,'2021-12-16 12:28:53','2021-12-16 12:28:53'),(22,11,NULL,'2021-12-16 20:01:44','2021-12-16 20:01:44'),(23,12,NULL,'2021-12-16 20:44:28','2021-12-16 20:44:28'),(24,12,NULL,'2021-12-16 20:45:27','2021-12-16 20:45:27');
/*!40000 ALTER TABLE `answer_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `answers`
--

DROP TABLE IF EXISTS `answers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `answers` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `answer_group_id` bigint unsigned NOT NULL,
  `choice_id` bigint unsigned NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `answers_answer_group_id_foreign` (`answer_group_id`),
  KEY `answers_choice_id_foreign` (`choice_id`),
  KEY `answers_user_id_foreign` (`user_id`),
  CONSTRAINT `answers_answer_group_id_foreign` FOREIGN KEY (`answer_group_id`) REFERENCES `answer_groups` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `answers_choice_id_foreign` FOREIGN KEY (`choice_id`) REFERENCES `choices` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `answers_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=112 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `answers`
--

LOCK TABLES `answers` WRITE;
/*!40000 ALTER TABLE `answers` DISABLE KEYS */;
INSERT INTO `answers` VALUES (40,16,71,8,NULL,'2021-12-09 12:13:39','2021-12-09 12:13:39'),(41,16,62,8,NULL,'2021-12-09 12:13:39','2021-12-09 12:13:39'),(42,16,58,8,NULL,'2021-12-09 12:13:39','2021-12-09 12:13:39'),(43,16,55,8,NULL,'2021-12-09 12:13:39','2021-12-09 12:13:39'),(44,16,49,8,NULL,'2021-12-09 12:13:39','2021-12-09 12:13:39'),(45,16,74,8,NULL,'2021-12-09 12:13:39','2021-12-09 12:13:39'),(46,16,79,8,NULL,'2021-12-09 12:13:39','2021-12-09 12:13:39'),(47,16,88,8,NULL,'2021-12-09 12:13:39','2021-12-09 12:13:39'),(48,17,70,9,NULL,'2021-12-09 12:24:49','2021-12-09 12:24:49'),(49,17,61,9,NULL,'2021-12-09 12:24:49','2021-12-09 12:24:49'),(50,17,59,9,NULL,'2021-12-09 12:24:49','2021-12-09 12:24:49'),(51,17,54,9,NULL,'2021-12-09 12:24:49','2021-12-09 12:24:49'),(52,17,50,9,NULL,'2021-12-09 12:24:49','2021-12-09 12:24:49'),(53,17,73,9,NULL,'2021-12-09 12:24:49','2021-12-09 12:24:49'),(54,17,79,9,NULL,'2021-12-09 12:24:49','2021-12-09 12:24:49'),(55,17,85,9,NULL,'2021-12-09 12:24:49','2021-12-09 12:24:49'),(56,18,69,8,NULL,'2021-12-09 13:51:58','2021-12-09 13:51:58'),(57,18,62,8,NULL,'2021-12-09 13:51:58','2021-12-09 13:51:58'),(58,18,59,8,NULL,'2021-12-09 13:51:58','2021-12-09 13:51:58'),(59,18,53,8,NULL,'2021-12-09 13:51:58','2021-12-09 13:51:58'),(60,18,50,8,NULL,'2021-12-09 13:51:58','2021-12-09 13:51:58'),(61,18,73,8,NULL,'2021-12-09 13:51:58','2021-12-09 13:51:58'),(62,18,77,8,NULL,'2021-12-09 13:51:58','2021-12-09 13:51:58'),(63,18,85,8,NULL,'2021-12-09 13:51:58','2021-12-09 13:51:58'),(64,19,69,10,NULL,'2021-12-09 13:58:41','2021-12-09 13:58:41'),(65,19,61,10,NULL,'2021-12-09 13:58:41','2021-12-09 13:58:41'),(66,19,57,10,NULL,'2021-12-09 13:58:41','2021-12-09 13:58:41'),(67,19,54,10,NULL,'2021-12-09 13:58:41','2021-12-09 13:58:41'),(68,19,49,10,NULL,'2021-12-09 13:58:41','2021-12-09 13:58:41'),(69,19,73,10,NULL,'2021-12-09 13:58:41','2021-12-09 13:58:41'),(70,19,77,10,NULL,'2021-12-09 13:58:41','2021-12-09 13:58:41'),(71,19,86,10,NULL,'2021-12-09 13:58:41','2021-12-09 13:58:41'),(72,20,70,11,NULL,'2021-12-16 12:21:34','2021-12-16 12:21:34'),(73,20,62,11,NULL,'2021-12-16 12:21:34','2021-12-16 12:21:34'),(74,20,57,11,NULL,'2021-12-16 12:21:34','2021-12-16 12:21:34'),(75,20,56,11,NULL,'2021-12-16 12:21:34','2021-12-16 12:21:34'),(76,20,50,11,NULL,'2021-12-16 12:21:34','2021-12-16 12:21:34'),(77,20,74,11,NULL,'2021-12-16 12:21:34','2021-12-16 12:21:34'),(78,20,78,11,NULL,'2021-12-16 12:21:34','2021-12-16 12:21:34'),(79,20,87,11,NULL,'2021-12-16 12:21:34','2021-12-16 12:21:34'),(80,21,72,11,NULL,'2021-12-16 12:28:53','2021-12-16 12:28:53'),(81,21,64,11,NULL,'2021-12-16 12:28:53','2021-12-16 12:28:53'),(82,21,60,11,NULL,'2021-12-16 12:28:53','2021-12-16 12:28:53'),(83,21,56,11,NULL,'2021-12-16 12:28:53','2021-12-16 12:28:53'),(84,21,52,11,NULL,'2021-12-16 12:28:53','2021-12-16 12:28:53'),(85,21,76,11,NULL,'2021-12-16 12:28:53','2021-12-16 12:28:53'),(86,21,80,11,NULL,'2021-12-16 12:28:53','2021-12-16 12:28:53'),(87,21,88,11,NULL,'2021-12-16 12:28:53','2021-12-16 12:28:53'),(88,22,69,11,NULL,'2021-12-16 20:01:44','2021-12-16 20:01:44'),(89,22,62,11,NULL,'2021-12-16 20:01:44','2021-12-16 20:01:44'),(90,22,59,11,NULL,'2021-12-16 20:01:44','2021-12-16 20:01:44'),(91,22,53,11,NULL,'2021-12-16 20:01:44','2021-12-16 20:01:44'),(92,22,52,11,NULL,'2021-12-16 20:01:44','2021-12-16 20:01:44'),(93,22,75,11,NULL,'2021-12-16 20:01:44','2021-12-16 20:01:44'),(94,22,79,11,NULL,'2021-12-16 20:01:44','2021-12-16 20:01:44'),(95,22,86,11,NULL,'2021-12-16 20:01:44','2021-12-16 20:01:44'),(96,23,69,12,NULL,'2021-12-16 20:44:28','2021-12-16 20:44:28'),(97,23,61,12,NULL,'2021-12-16 20:44:28','2021-12-16 20:44:28'),(98,23,57,12,NULL,'2021-12-16 20:44:28','2021-12-16 20:44:28'),(99,23,53,12,NULL,'2021-12-16 20:44:28','2021-12-16 20:44:28'),(100,23,49,12,NULL,'2021-12-16 20:44:28','2021-12-16 20:44:28'),(101,23,73,12,NULL,'2021-12-16 20:44:28','2021-12-16 20:44:28'),(102,23,77,12,NULL,'2021-12-16 20:44:28','2021-12-16 20:44:28'),(103,23,85,12,NULL,'2021-12-16 20:44:28','2021-12-16 20:44:28'),(104,24,71,12,NULL,'2021-12-16 20:45:27','2021-12-16 20:45:27'),(105,24,62,12,NULL,'2021-12-16 20:45:27','2021-12-16 20:45:27'),(106,24,59,12,NULL,'2021-12-16 20:45:27','2021-12-16 20:45:27'),(107,24,54,12,NULL,'2021-12-16 20:45:27','2021-12-16 20:45:27'),(108,24,50,12,NULL,'2021-12-16 20:45:27','2021-12-16 20:45:27'),(109,24,75,12,NULL,'2021-12-16 20:45:27','2021-12-16 20:45:27'),(110,24,79,12,NULL,'2021-12-16 20:45:27','2021-12-16 20:45:27'),(111,24,88,12,NULL,'2021-12-16 20:45:27','2021-12-16 20:45:27');
/*!40000 ALTER TABLE `answers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `choices`
--

DROP TABLE IF EXISTS `choices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `choices` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `choice` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `score` decimal(8,2) NOT NULL,
  `question_id` bigint unsigned NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `choices_question_id_foreign` (`question_id`),
  CONSTRAINT `choices_question_id_foreign` FOREIGN KEY (`question_id`) REFERENCES `questions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=89 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `choices`
--

LOCK TABLES `choices` WRITE;
/*!40000 ALTER TABLE `choices` DISABLE KEYS */;
INSERT INTO `choices` VALUES (41,'aa',11.00,4,NULL,'2021-12-09 10:45:34','2021-12-09 10:45:34'),(42,'aa',22.00,4,NULL,'2021-12-09 10:45:34','2021-12-09 10:45:34'),(43,'aa',22.00,4,NULL,'2021-12-09 10:45:34','2021-12-09 10:45:34'),(44,'aa',22.00,4,NULL,'2021-12-09 10:45:34','2021-12-09 10:45:34'),(49,'All The Time',1.00,6,NULL,'2021-12-09 10:53:07','2021-12-09 10:53:07'),(50,'Sometimes',3.00,6,NULL,'2021-12-09 10:53:07','2021-12-09 10:53:07'),(51,'Rarely',5.00,6,NULL,'2021-12-09 10:53:07','2021-12-09 10:53:07'),(52,'Never',10.00,6,NULL,'2021-12-09 10:53:07','2021-12-09 10:53:07'),(53,'All The Time',1.00,5,NULL,'2021-12-09 10:53:18','2021-12-09 10:53:18'),(54,'Sometimes',3.00,5,NULL,'2021-12-09 10:53:18','2021-12-09 10:53:18'),(55,'Rarely',5.00,5,NULL,'2021-12-09 10:53:18','2021-12-09 10:53:18'),(56,'Never',10.00,5,NULL,'2021-12-09 10:53:18','2021-12-09 10:53:18'),(57,'All The Time',1.00,3,NULL,'2021-12-09 10:53:27','2021-12-09 10:53:27'),(58,'Sometimes',3.00,3,NULL,'2021-12-09 10:53:27','2021-12-09 10:53:27'),(59,'Rarely',5.00,3,NULL,'2021-12-09 10:53:27','2021-12-09 10:53:27'),(60,'Never',10.00,3,NULL,'2021-12-09 10:53:27','2021-12-09 10:53:27'),(61,'All The Time',1.00,2,NULL,'2021-12-09 10:53:36','2021-12-09 10:53:36'),(62,'Sometimes',3.00,2,NULL,'2021-12-09 10:53:36','2021-12-09 10:53:36'),(63,'Rarely',5.00,2,NULL,'2021-12-09 10:53:36','2021-12-09 10:53:36'),(64,'Never',10.00,2,NULL,'2021-12-09 10:53:36','2021-12-09 10:53:36'),(69,'All The Time',1.00,1,NULL,'2021-12-09 10:55:22','2021-12-09 10:55:22'),(70,'Sometimes',3.00,1,NULL,'2021-12-09 10:55:22','2021-12-09 10:55:22'),(71,'Rarely',5.00,1,NULL,'2021-12-09 10:55:22','2021-12-09 10:55:22'),(72,'Never',10.00,1,NULL,'2021-12-09 10:55:22','2021-12-09 10:55:22'),(73,'All The Time',1.00,7,NULL,'2021-12-09 10:57:36','2021-12-09 10:57:36'),(74,'Sometimes',3.00,7,NULL,'2021-12-09 10:57:36','2021-12-09 10:57:36'),(75,'Rarely',5.00,7,NULL,'2021-12-09 10:57:36','2021-12-09 10:57:36'),(76,'Never',10.00,7,NULL,'2021-12-09 10:57:36','2021-12-09 10:57:36'),(77,'All The Time',1.00,8,NULL,'2021-12-09 10:59:00','2021-12-09 10:59:00'),(78,'Sometimes',3.00,8,NULL,'2021-12-09 10:59:00','2021-12-09 10:59:00'),(79,'Rarely',5.00,8,NULL,'2021-12-09 10:59:00','2021-12-09 10:59:00'),(80,'Never',10.00,8,NULL,'2021-12-09 10:59:00','2021-12-09 10:59:00'),(85,'All The Time',1.00,9,NULL,'2021-12-09 11:00:59','2021-12-09 11:00:59'),(86,'Sometimes',3.00,9,NULL,'2021-12-09 11:00:59','2021-12-09 11:00:59'),(87,'Rarely',5.00,9,NULL,'2021-12-09 11:00:59','2021-12-09 11:00:59'),(88,'Never',10.00,9,NULL,'2021-12-09 11:00:59','2021-12-09 11:00:59');
/*!40000 ALTER TABLE `choices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `diaries`
--

DROP TABLE IF EXISTS `diaries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `diaries` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `date` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` longtext COLLATE utf8mb4_unicode_ci,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `diaries_user_id_foreign` (`user_id`),
  CONSTRAINT `diaries_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `diaries`
--

LOCK TABLES `diaries` WRITE;
/*!40000 ALTER TABLE `diaries` DISABLE KEYS */;
INSERT INTO `diaries` VALUES (1,1,'2021-12-18','sample lang',NULL,'2021-12-18 05:38:06','2021-12-18 05:38:35');
/*!40000 ALTER TABLE `diaries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dummies`
--

DROP TABLE IF EXISTS `dummies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dummies` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `banner_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `banner_description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `product_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `product_price` decimal(9,2) DEFAULT NULL,
  `product_featured` tinyint(1) NOT NULL DEFAULT '0',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dummies`
--

LOCK TABLES `dummies` WRITE;
/*!40000 ALTER TABLE `dummies` DISABLE KEYS */;
INSERT INTO `dummies` VALUES (1,'Sample Title','Lorem ipsum dolor sit amet',NULL,NULL,NULL,0,NULL,'2021-10-27 15:20:13','2021-10-27 07:31:36'),(4,NULL,NULL,'Tesla','lorem ipsum',69.00,0,NULL,'2021-10-27 08:19:09','2021-10-27 08:51:11');
/*!40000 ALTER TABLE `dummies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dummy_tag`
--

DROP TABLE IF EXISTS `dummy_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dummy_tag` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `dummy_id` bigint unsigned NOT NULL,
  `tag_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dummy_tag`
--

LOCK TABLES `dummy_tag` WRITE;
/*!40000 ALTER TABLE `dummy_tag` DISABLE KEYS */;
INSERT INTO `dummy_tag` VALUES (1,7,1,NULL,NULL),(2,7,2,NULL,NULL),(3,4,2,NULL,NULL);
/*!40000 ALTER TABLE `dummy_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `images`
--

DROP TABLE IF EXISTS `images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `images` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int unsigned DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alt` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `path_resized` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sequence` int DEFAULT NULL,
  `temporary_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_size` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `images`
--

LOCK TABLES `images` WRITE;
/*!40000 ALTER TABLE `images` DISABLE KEYS */;
INSERT INTO `images` VALUES (1,1,'wew',NULL,NULL,'uploads/2021-10-27/15-46-22-116343/84642165_3183429141690133_2244773955858595840_n.jpg','uploads/2021-10-27/15-46-22-116343/84642165_3183429141690133_2244773955858595840_n_thumbnail.jpg','dummy',2,NULL,'84642165_3183429141690133_2244773955858595840_n.jpg','34.22 KB','2021-10-27 15:20:13','2021-10-27 07:46:22',NULL),(2,3,NULL,NULL,NULL,'uploads/2021-10-27/16-19-07-352810/248556537_4485358678219308_6648917592001517640_n.jpg','uploads/2021-10-27/16-19-07-352810/248556537_4485358678219308_6648917592001517640_n_thumbnail.jpg','dummy',1,NULL,'248556537_4485358678219308_6648917592001517640_n.jpg','97.51 KB','2021-10-27 08:19:07','2021-10-27 08:19:07',NULL),(3,4,NULL,NULL,NULL,'uploads/2021-10-27/16-19-09-987868/248556537_4485358678219308_6648917592001517640_n.jpg','uploads/2021-10-27/16-19-09-987868/248556537_4485358678219308_6648917592001517640_n_thumbnail.jpg','dummy',1,NULL,'248556537_4485358678219308_6648917592001517640_n.jpg','97.51 KB','2021-10-27 08:19:10','2021-10-27 08:19:10',NULL);
/*!40000 ALTER TABLE `images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_resets_table',1),(3,'2016_06_01_000001_create_oauth_auth_codes_table',1),(4,'2016_06_01_000002_create_oauth_access_tokens_table',1),(5,'2016_06_01_000003_create_oauth_refresh_tokens_table',1),(6,'2016_06_01_000004_create_oauth_clients_table',1),(7,'2016_06_01_000005_create_oauth_personal_access_clients_table',1),(8,'2019_08_19_000000_create_failed_jobs_table',1),(9,'2019_12_14_000001_create_personal_access_tokens_table',1),(10,'2021_10_27_013637_create_questions_table',2),(11,'2021_10_27_014021_create_choices_table',3),(16,'2021_10_27_014600_create_answer_groups_table',4),(17,'2021_10_27_014601_create_answers_table',4),(22,'2021_10_27_145958_create_dummies_table',5),(23,'2021_10_27_150924_create_images_table',5),(25,'2021_10_27_163803_create_tags_table',6),(26,'2021_10_27_164203_create_dummy_tags_table',6),(27,'2021_11_03_133118_create_scoring_settings_table',7),(28,'2021_12_18_131000_create_diaries_table',8);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_access_tokens`
--

DROP TABLE IF EXISTS `oauth_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `client_id` bigint unsigned NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_access_tokens_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_access_tokens`
--

LOCK TABLES `oauth_access_tokens` WRITE;
/*!40000 ALTER TABLE `oauth_access_tokens` DISABLE KEYS */;
INSERT INTO `oauth_access_tokens` VALUES ('014eefba4f4ed4c29b71e156c5a0028e211af2122c204a68c84e984fc8347f4a1a4fc0dca3faa723',1,1,'MoodTracker API Grant','[]',1,'2021-10-07 07:45:16','2021-10-07 07:45:16','2022-04-07 15:45:16'),('01b973ae146dfd2e8a9126fb84f4f3f50bbcbcb420462221a416bf357d79a30e7f21ca88829f5012',1,1,'MoodTracker API Grant','[]',1,'2021-10-07 03:53:09','2021-10-07 03:53:09','2022-04-07 11:53:09'),('024f9daf455e9ee7206da95ba6e1ab50107def02b7550d340165c28710f6621b9640d782346bf56a',1,1,'MoodTracker API Grant','[]',1,'2021-10-07 07:26:56','2021-10-07 07:26:56','2022-04-07 15:26:56'),('06194d498c03c7c9b13569eaf368c2c4d1bd390c2ffba58a9cc982d900d43c66685ba0d2b872346d',1,1,'MoodTracker API Grant','[]',1,'2021-11-27 19:33:22','2021-11-27 19:33:22','2022-05-28 03:33:22'),('067437cccd0fa424a176ca835809d87e11ac5d2d1e65b3dca966d5eca6b1ab37cf494cd7c1be17eb',4,1,'MoodTracker API Grant','[]',0,'2021-12-09 10:27:50','2021-12-09 10:27:50','2022-06-09 10:27:50'),('0a72927a63ec2dc2fc0e042b4b6f3264309c0feb8bb0f69ea55bf2ea1ad1f1bd9ed7b32774bc792a',4,1,'MoodTracker API Grant','[]',0,'2021-11-03 05:51:25','2021-11-03 05:51:25','2022-05-03 13:51:25'),('0c8561112bddd612734a9853a4e82aad8c582c65cc15347c17121a854079c5a5008480577928bb2a',1,1,'MoodTracker API Grant','[]',0,'2021-11-27 20:40:42','2021-11-27 20:40:42','2022-05-28 04:40:42'),('0de60c58f6bc705269572c1d37af389ae25e218ddfdd00a16dc6ec016d21f13b7bac8b000c28a02d',4,1,'MoodTracker API Grant','[]',0,'2021-11-28 13:23:38','2021-11-28 13:23:38','2022-05-28 21:23:38'),('11afab9d7c63d46a8fc0a616cd7fe63828357373fbcbdb2919c633c8f2858873042de3833cb70f94',4,1,'MoodTracker API Grant','[]',0,'2021-11-30 18:49:43','2021-11-30 18:49:43','2022-05-30 18:49:43'),('17e5d4edb3d07c52163399eeaba0a8d2725fc804bb43374f0bd0ac6e0468a79661eb3b701fbf16c2',8,1,'MoodTracker API Grant','[]',1,'2021-12-09 13:51:44','2021-12-09 13:51:44','2022-06-09 13:51:44'),('18272c255263034f591ee88f8ad654beb2b13d60ecabb4624b5861051cc80d114f855643dc27bc2c',1,1,'MoodTracker API Grant','[]',1,'2021-10-07 04:42:22','2021-10-07 04:42:22','2022-04-07 12:42:22'),('220874611d841030d10afb090cf8fe93eda3229686e9e9a5f0ee4af4e987acf685e8bd2f28287366',1,1,'MoodTracker API Grant','[]',0,'2021-11-27 20:41:17','2021-11-27 20:41:17','2022-05-28 04:41:17'),('226de2bc6fbfd2f974cd0e757a6604e3602eb9cbee20063a259b2286e802361a61f9bfe21e62d81d',8,1,'MoodTracker API Grant','[]',1,'2021-12-09 12:12:39','2021-12-09 12:12:39','2022-06-09 12:12:39'),('22bf948d0bdf3af5079cf5f4bf287e4bc84932b22ad3201867414e20316d50fc08f8d7ee01657a66',4,1,'MoodTracker API Grant','[]',0,'2021-10-27 07:59:07','2021-10-27 07:59:07','2022-04-27 15:59:07'),('28fc6cc13e4b1fea48cc7630e5b85307c479014060f94bf98d2a9f40c73c42d3b85e8bb3eefcf7fb',1,1,'MoodTracker API Grant','[]',1,'2021-11-03 05:53:14','2021-11-03 05:53:14','2022-05-03 13:53:13'),('2ae4e86ab65d3ece172f778aee882b1e0913a2b123363d81c06c57242ec9f1ae1dc35635ed98d1de',1,1,'MoodTracker API Grant','[]',1,'2021-11-27 19:32:24','2021-11-27 19:32:24','2022-05-28 03:32:24'),('343add5af9f70d349a1462fee8b41c4ba0bb741fed2aee6fc925d79e91d54d033af59b0941f393db',1,1,'MoodTracker API Grant','[]',1,'2021-10-07 04:49:52','2021-10-07 04:49:52','2022-04-07 12:49:52'),('3518c6ec06f543a0a96cc7d35c78a333a953227419b77c1ba9b6dabb93fc33abda0e873bf5f3830a',4,1,'MoodTracker API Grant','[]',0,'2021-12-16 20:45:21','2021-12-16 20:45:21','2022-06-16 20:45:21'),('380e0eb524a657f4395379caa33175028e5f6d23e89be8b45808b3df06a1b3abf4bc6154dd8f68df',1,1,'MoodTracker API Grant','[]',0,'2021-12-17 02:13:52','2021-12-17 02:13:52','2022-06-17 10:13:51'),('38c7f9fa0ce7b28146c11bdec0cf7b458dcc96a7e0e989ab0f4b092f9ed137c969b9ed96b6b90c32',1,1,'MoodTracker API Grant','[]',0,'2021-10-27 07:59:51','2021-10-27 07:59:51','2022-04-27 15:59:51'),('3d106679410b256045c54b3eb3838b01350ac154904c1663435b97842cab5d10b304fe75112251c8',1,1,'MoodTracker API Grant','[]',1,'2021-11-03 06:03:58','2021-11-03 06:03:58','2022-05-03 14:03:58'),('425b2b72335d608619421ab828113195733bfcdecf3ca0e18250cadd2b820fca8438cbd26a968c7e',11,1,'MoodTracker API Grant','[]',0,'2021-12-16 12:20:34','2021-12-16 12:20:34','2022-06-16 12:20:34'),('489844c47992f98be0cfc436da6347b58d0aa2237847060bb6fffca6d1aef21928d26b4dcabd2037',12,1,'MoodTracker API Grant','[]',0,'2021-12-16 20:43:26','2021-12-16 20:43:26','2022-06-16 20:43:26'),('4a6a58f72a98762fb071f861cbdc510769bfad7bbb1890532c9998078e6bd8eac4f0fae145e8c0f7',1,1,'MoodTracker API Grant','[]',1,'2021-11-03 08:03:05','2021-11-03 08:03:05','2022-05-03 16:03:05'),('516a5fe2d7724c1fbfa0b3fb4d7680b81534ea0c47497d509c049ab5c5f721c4feb808d0d43b865a',4,1,'MoodTracker API Grant','[]',0,'2021-12-11 13:24:21','2021-12-11 13:24:21','2022-06-11 13:24:21'),('59c99239cfd5320063b0a935984f8ac3b7e99a6eec928e955139b864f6817092f9872c25e28a3f29',4,1,'MoodTracker API Grant','[]',0,'2021-12-09 10:09:40','2021-12-09 10:09:40','2022-06-09 10:09:40'),('5a4a8c3b7c731d2c523ebfa18b87c06705d079acfdd0431d0d430d2389592009afdd518a89432074',4,1,'MoodTracker API Grant','[]',1,'2021-11-30 18:44:09','2021-11-30 18:44:09','2022-05-30 18:44:09'),('5c2703c070ca49eef73edc046295f75e0c1dfe92b80fc45e5a5f3ecb89f05483560b1d44d7d34dc6',1,1,'MoodTracker API Grant','[]',1,'2021-10-07 08:20:50','2021-10-07 08:20:50','2022-04-07 16:20:50'),('5c7444b9cacad7288f151f1687d92dc1922598e3e10f7f4ca49cdf88d5323cab7d21af26e27c5c9a',1,1,'MoodTracker API Grant','[]',1,'2021-10-07 06:11:47','2021-10-07 06:11:47','2022-04-07 14:11:47'),('5d4f212ad7ce91bc604118323297e1980a97ef6b69d28b7dfaaf8e6aa550deede9837c765ea4bfac',7,1,'MoodTracker API Grant','[]',1,'2021-11-28 22:23:28','2021-11-28 22:23:28','2022-05-28 22:23:27'),('5df31e3a513ec3273a6641a17d5b69f17a3cb86e33525d869fe4a2fe982efc4bb0fe480711b91a38',1,1,'MoodTracker API Grant','[]',0,'2021-10-07 03:54:10','2021-10-07 03:54:10','2022-04-07 11:54:10'),('5fd932061143d8ac83b895725ed20438336b988c7a31627a76e95f21861931d8886104ffbed08489',1,1,'MoodTracker API Grant','[]',1,'2021-10-07 04:50:28','2021-10-07 04:50:28','2022-04-07 12:50:27'),('5fdd03811a7ca9e3629293be51e998d4cbab6739bbee21ec3a48aa9780a029e2f8177e7bd61fe282',6,1,'MoodTracker API Grant','[]',1,'2021-11-03 07:35:17','2021-11-03 07:35:17','2022-05-03 15:35:17'),('63419ff8a7251abffc89f2ab7a6e99be53af6563f4a72785e2eaf28b655a6e42b021719e1caa7eec',9,1,'MoodTracker API Grant','[]',0,'2021-12-09 12:23:53','2021-12-09 12:23:53','2022-06-09 12:23:53'),('63609c6effbaf67dd70daea399949ac2ec8be6503ee5488bb1159f9fb2ebe1c2e409b747d696cddc',6,1,'MoodTracker API Grant','[]',1,'2021-11-03 07:27:58','2021-11-03 07:27:58','2022-05-03 15:27:58'),('65812d76272158bb2393a6704d7c1c09ec786a2b5cbebef461502262d48d12e1cac0d2369b71cad7',1,1,'MoodTracker API Grant','[]',1,'2021-10-07 04:47:44','2021-10-07 04:47:44','2022-04-07 12:47:44'),('684c970af1766eced4c009c67ae32b6260b8bca596e3c56cdf496b220ea940b06a4cd7fcca2047e9',6,1,'MoodTracker API Grant','[]',1,'2021-11-03 07:28:16','2021-11-03 07:28:16','2022-05-03 15:28:16'),('6a2c1f074865c9302faea1108b92dbc8b59ef8ff4f7dd3e6d2aacfdb314a23b8e5c1054a097c0c60',1,1,'MoodTracker API Grant','[]',1,'2021-10-07 07:26:41','2021-10-07 07:26:41','2022-04-07 15:26:41'),('6aec40ca2dc6b2f082606b60ec5b406868f9eea053ec82ac09b7fc518937e748b9270012c7b66e90',1,1,'MoodTracker API Grant','[]',0,'2021-10-26 18:10:39','2021-10-26 18:10:39','2022-04-27 02:10:39'),('70d7f074b3f32585f1eacbeccb816a98754659d4ee57b6f15503b713d359af0284f2b3eeeb8d721e',6,1,'MoodTracker API Grant','[]',1,'2021-11-03 07:38:56','2021-11-03 07:38:56','2022-05-03 15:38:56'),('7aa490437f3124322cd6494ae777079f6b3dbcd59e938fec8fb64e2910b0fbf0b308d2bda5b1b5a8',1,1,'MoodTracker API Grant','[]',1,'2021-10-07 06:22:40','2021-10-07 06:22:40','2022-04-07 14:22:40'),('7b8f8ab2bbd9ac9ef573ded9c1ed1bd13431530b3559626552be47018b79015fab96f665a4d99c43',1,1,'MoodTracker API Grant','[]',1,'2021-10-07 04:51:40','2021-10-07 04:51:40','2022-04-07 12:51:40'),('8abd98c81e2785b457e670fd1eb1b14512b46042fb203549e0ab219b4f56c2d2a0ce68fecfa5ef03',1,1,'MoodTracker API Grant','[]',1,'2021-11-03 07:47:40','2021-11-03 07:47:40','2022-05-03 15:47:40'),('8ae1788d8a09ef7c1b3bce105208706739dc0595100fbf35d7df6ec7ba1adbade2c1562845528e6d',1,1,'MoodTracker API Grant','[]',1,'2021-10-07 04:51:37','2021-10-07 04:51:37','2022-04-07 12:51:37'),('8b028aaa26a818fe81d6ba1a1f1cfb4fe8a4a9afcef08a65c5366b80af9b9a01ba995244a263a880',1,1,'MoodTracker API Grant','[]',1,'2021-10-07 06:11:53','2021-10-07 06:11:53','2022-04-07 14:11:53'),('9e0677c51765a35559b1320719c5d09c167b891a4b2c5c1c47c507f5ae0f8f62c023bb1c9a3b092d',11,1,'MoodTracker API Grant','[]',1,'2021-12-16 12:28:06','2021-12-16 12:28:06','2022-06-16 12:28:06'),('a0abcb4751e1163ad6aa3c5e0bba91b251a0685519ffa87574435e016a6158d86484daedba76b1d9',7,1,'MoodTracker API Grant','[]',0,'2021-11-28 22:23:27','2021-11-28 22:23:27','2022-05-28 22:23:27'),('a2ac6a1f73699cb87187b3c86fdb48e6c6f1c6ece2c75e6d3c93ceb7236d65f33d99ef0fbb0ef201',4,1,'MoodTracker API Grant','[]',1,'2021-10-07 04:57:29','2021-10-07 04:57:29','2022-04-07 12:57:29'),('a3c463cfe8af324df7442997beab91666d9435069a8fec5f5363072c84f0bb7bcce6f41d79a6e6da',5,1,'MoodTracker API Grant','[]',0,'2021-11-03 07:16:39','2021-11-03 07:16:39','2022-05-03 15:16:39'),('a84d5f6671859a4e98dfe654980357c1ab1ae15ba09cb34f9f68ad4676d6b456543a1302c96cc4fb',10,1,'MoodTracker API Grant','[]',0,'2021-12-09 13:57:50','2021-12-09 13:57:50','2022-06-09 13:57:50'),('a94b6149c70b1060fb327f27bef513db4b7de66edb4943d29bf7be9086b7a6340697c00840409c75',4,1,'MoodTracker API Grant','[]',0,'2021-10-27 08:15:19','2021-10-27 08:15:19','2022-04-27 16:15:19'),('b0bbf7c6c8352d73df9bf2b821096715d1e8f9caa14142b19d67577f336fca36dfc7c62bda8614cd',1,1,'MoodTracker API Grant','[]',1,'2021-11-03 07:35:15','2021-11-03 07:35:15','2022-05-03 15:35:15'),('b22855e3689b5bbb7528416e771faf2c2c6f63816ff672a6def1321b6507ffa28fa5ef615c3ff8e5',7,1,'MoodTracker API Grant','[]',1,'2021-11-28 22:41:49','2021-11-28 22:41:49','2022-05-28 22:41:49'),('b3873f0344fb999bcf83ef9b9c935f757eac6a1f312c04acc94916b7b37578013b72a1929a6b58fd',1,1,'MoodTracker API Grant','[]',1,'2021-11-27 19:41:11','2021-11-27 19:41:11','2022-05-28 03:41:11'),('b633c6bbb8a2ae9030d298df6d9601b48ce7f29136aee1937e6feb441c60afa9c9fc1eeec5be1add',6,1,'MoodTracker API Grant','[]',0,'2021-11-03 07:23:26','2021-11-03 07:23:26','2022-05-03 15:23:26'),('bbc51bd322fa893444e1c58632d44c19d291e3d26d97023ea4315e165e860904386892b54383c967',4,1,'MoodTracker API Grant','[]',0,'2021-10-26 18:09:07','2021-10-26 18:09:07','2022-04-27 02:09:07'),('bdaab83ed8d7e927cd33eb679bf3a91e3d246dceb6dc8fa95bb68a71461a78ebac97d53183bb8bce',4,1,'MoodTracker API Grant','[]',0,'2021-12-16 13:03:49','2021-12-16 13:03:49','2022-06-16 21:03:49'),('c241cd11f3de1bcbf6a48b6d38ad424228eba3904f50f8ea6e5e5e54ce41eba5191cc7132df4a477',1,1,'MoodTracker API Grant','[]',1,'2021-10-07 04:46:13','2021-10-07 04:46:13','2022-04-07 12:46:13'),('c4dbf8e0bf29f82fc2efba6f2e101e653b347abf1bf1681d1f6c717709350e9fc1d3e17a89b5d95e',10,1,'MoodTracker API Grant','[]',0,'2021-12-09 13:57:50','2021-12-09 13:57:50','2022-06-09 13:57:50'),('c5095dc07cbdf4484734853c1d90c6bfe537859496b3c13a20d79ce3520df80bede5ed722a89efee',1,1,'MoodTracker API Grant','[]',1,'2021-11-28 14:12:10','2021-11-28 14:12:10','2022-05-28 22:12:10'),('c75e4822550b8092fc053974c7d5f2670da9419ff4148c82bd0e899342278c9f7a3d11781706c139',3,1,'MoodTracker API Grant','[]',0,'2021-10-07 04:56:10','2021-10-07 04:56:10','2022-04-07 12:56:10'),('cbb20e0d0f1558befd80a619a25025964298981a767e7882df12a92060a906653fcc2df2b3fee07a',1,1,'MoodTracker API Grant','[]',1,'2021-10-07 04:50:53','2021-10-07 04:50:53','2022-04-07 12:50:53'),('d275be34d807770c36a77ce9978a5f5daa51038de8e7df896dfdbfe1c5c6374d43f893554aacd377',6,1,'MoodTracker API Grant','[]',1,'2021-11-03 07:35:37','2021-11-03 07:35:37','2022-05-03 15:35:37'),('d57c223f994c22372eec7b53c511213e7ad4d874e0a638a2338d446a426a0545a95cdb0a85e81230',1,1,'MoodTracker API Grant','[]',1,'2021-11-03 06:09:24','2021-11-03 06:09:24','2022-05-03 14:09:24'),('d603bbf8c9e34c91742d972f3c773c70903a627797ec2d171a0756bfc83f4e590934691df8a8eac2',6,1,'MoodTracker API Grant','[]',1,'2021-11-03 07:35:32','2021-11-03 07:35:32','2022-05-03 15:35:32'),('d64ab7b1a27d88cd926e039f30fb10f6dd3438813abb61df2d7d18cd584ba49caaefad805109bd38',1,1,'MoodTracker API Grant','[]',0,'2021-10-27 07:58:53','2021-10-27 07:58:53','2022-04-27 15:58:53'),('d873fc344bc2960b6db16305a23bee8d4396f9585e3a93f8c2ba53419bfd81326381e255ae5e8e4e',1,1,'MoodTracker API Grant','[]',1,'2021-10-07 04:52:41','2021-10-07 04:52:41','2022-04-07 12:52:41'),('d95ce50ae211afbad9eb47f1e56fc5f383334a550562085d1f565b9d01c501c0003ae6cf5bd26b17',11,1,'MoodTracker API Grant','[]',1,'2021-12-16 12:20:34','2021-12-16 12:20:34','2022-06-16 12:20:34'),('db35ee43ba729cc39b2f0cf9974f1e8e0e1a998bd103f818decf474ae4dc39112cc4129f56163c34',5,1,'MoodTracker API Grant','[]',0,'2021-11-03 07:16:42','2021-11-03 07:16:42','2022-05-03 15:16:42'),('df079c7e9d720573e69df06a53aa2f70564623034f4eb649cb5801ee2564405a1d12bf1453f9910d',1,1,'MoodTracker API Grant','[]',0,'2021-11-30 18:50:36','2021-11-30 18:50:36','2022-05-30 18:50:36'),('df79eec0538a7b7d4680b92212df63cb1496fdb6491fb74697b83f95d8c006717b15f8dfe90ccbca',1,1,'MoodTracker API Grant','[]',1,'2021-10-07 04:52:28','2021-10-07 04:52:28','2022-04-07 12:52:28'),('e04df1797bb983a204fadd59d616ac126189aa652fd6eeb3c6fc44a3c01c76aa5c9d7417d7993f89',11,1,'MoodTracker API Grant','[]',1,'2021-12-16 12:23:05','2021-12-16 12:23:05','2022-06-16 12:23:05'),('e0607e4dfa129c807b8b19a572bdc169818a5d882fea7f28e4b4487dc99c1cb90c5e0ea792b08df1',4,1,'MoodTracker API Grant','[]',0,'2021-10-07 04:57:29','2021-10-07 04:57:29','2022-04-07 12:57:29'),('e0938e5961112ec556764424e474cc0572c3495dde049a4167301b8f6c4f600306a9ef638a395913',4,1,'MoodTracker API Grant','[]',0,'2021-10-27 08:04:48','2021-10-27 08:04:48','2022-04-27 16:04:48'),('e12f50b63963507a691f2d228d60e8489a7cf6c9a8ea0e9fa7f10748fe194aee676d6a730bc22881',5,1,'MoodTracker API Grant','[]',0,'2021-11-03 07:16:44','2021-11-03 07:16:44','2022-05-03 15:16:44'),('e26a5c391206b08b51c7606bfdd34cd8ee4b048f77614789422f2b30d2f6157d577f43cf71639518',1,1,'MoodTracker API Grant','[]',1,'2021-11-28 14:12:57','2021-11-28 14:12:57','2022-05-28 22:12:57'),('e512c2f4c196691a35071500db0e952f69d9179c94014f4e9ffecbd43a9bb0e5fd6b866e3d12b6e8',1,1,'MoodTracker API Grant','[]',0,'2021-12-18 05:37:35','2021-12-18 05:37:35','2022-06-18 13:37:35'),('e92d1475f7274619eb70d569ceb3bc87fe6f1dbcec62505a2461b7ec3532a599925df03246eb4508',8,1,'MoodTracker API Grant','[]',0,'2021-12-09 12:12:39','2021-12-09 12:12:39','2022-06-09 12:12:39'),('ead5a33df59a73b7713045ba9de52e2969ce24fb3b980e338d4029d16dbaaacaccfb981d37252c50',6,1,'MoodTracker API Grant','[]',0,'2021-11-03 07:17:15','2021-11-03 07:17:15','2022-05-03 15:17:15'),('efb61ad00bf27eefae161ade7ac5a5e9c7c14df72b1fb4a63e0adf3bf3190c5c4680b6680375dc41',1,1,'MoodTracker API Grant','[]',0,'2021-10-26 18:06:10','2021-10-26 18:06:10','2022-04-27 02:06:10'),('f23fa776aa44841a816983663703969d3b435e0f7a531094c648375921b47a88d22106b327ba40b6',2,1,'MoodTracker API Grant','[]',0,'2021-10-07 04:55:34','2021-10-07 04:55:34','2022-04-07 12:55:34'),('f5f1a7028e5a5721534b4c1ae2ee863594a51c79b9e220fd39c69b776186580478733c1a90342544',9,1,'MoodTracker API Grant','[]',0,'2021-12-09 12:23:52','2021-12-09 12:23:52','2022-06-09 12:23:52'),('fc5d0f4217eba1bb5bb9131af615e08e302480b47fc600a19abc21e6c29f21c852f7d953fa9936b2',5,1,'MoodTracker API Grant','[]',0,'2021-11-03 07:16:45','2021-11-03 07:16:45','2022-05-03 15:16:45');
/*!40000 ALTER TABLE `oauth_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_auth_codes`
--

DROP TABLE IF EXISTS `oauth_auth_codes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `client_id` bigint unsigned NOT NULL,
  `scopes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_auth_codes_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_auth_codes`
--

LOCK TABLES `oauth_auth_codes` WRITE;
/*!40000 ALTER TABLE `oauth_auth_codes` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_auth_codes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_clients`
--

DROP TABLE IF EXISTS `oauth_clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth_clients` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_clients_user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_clients`
--

LOCK TABLES `oauth_clients` WRITE;
/*!40000 ALTER TABLE `oauth_clients` DISABLE KEYS */;
INSERT INTO `oauth_clients` VALUES (1,NULL,'MoodTrackerAPI Personal Access Client','rCRaAaAHViO8DP8TrmtYRErec3xNtNaHWDW8P7NN',NULL,'http://localhost',1,0,0,'2021-10-06 22:36:29','2021-10-06 22:36:29'),(2,NULL,'MoodTrackerAPI Password Grant Client','wcAclRHMPJEmK5FGoeGQb2p9t7w1bzLNVhaZcPVJ','users','http://localhost',0,1,0,'2021-10-06 22:36:29','2021-10-06 22:36:29');
/*!40000 ALTER TABLE `oauth_clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_personal_access_clients`
--

DROP TABLE IF EXISTS `oauth_personal_access_clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth_personal_access_clients` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `client_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_personal_access_clients`
--

LOCK TABLES `oauth_personal_access_clients` WRITE;
/*!40000 ALTER TABLE `oauth_personal_access_clients` DISABLE KEYS */;
INSERT INTO `oauth_personal_access_clients` VALUES (1,1,'2021-10-06 22:36:29','2021-10-06 22:36:29');
/*!40000 ALTER TABLE `oauth_personal_access_clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_refresh_tokens`
--

DROP TABLE IF EXISTS `oauth_refresh_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_refresh_tokens`
--

LOCK TABLES `oauth_refresh_tokens` WRITE;
/*!40000 ALTER TABLE `oauth_refresh_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_refresh_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_resets` (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
INSERT INTO `personal_access_tokens` VALUES (1,'App\\Models\\User',1,'MoodTracker API Grant','4bfab71924e5bb2d7463c93a84e11c5ea16405842857de9c4de9e17eed15eb4c','[\"*\"]',NULL,'2021-10-07 03:20:14','2021-10-07 03:20:14'),(2,'App\\Models\\User',1,'MoodTracker API Grant','f9ce3df6bbc3650b43e74a6ecc8876c8297e3c8e9edf72a0851710cff293affc','[\"*\"]',NULL,'2021-10-07 03:21:03','2021-10-07 03:21:03'),(3,'App\\Models\\User',1,'MoodTracker API Grant','33059699d77e62e0d3a8299ab3a842fd2bb97dfd78e2f43ec213badd9cdf0353','[\"*\"]',NULL,'2021-10-07 03:42:05','2021-10-07 03:42:05'),(4,'App\\Models\\User',1,'MoodTracker API Grant','d3e62e94c6d932209b2ba3952840dcc5ef9de317253bfe11d580e82ac350d1ed','[\"*\"]',NULL,'2021-10-07 03:42:07','2021-10-07 03:42:07'),(5,'App\\Models\\User',1,'MoodTracker API Grant','2518651447178c1d6b7c1ce63a9f680e2d5c1859be404a21b3cd9a519f562c7c','[\"*\"]',NULL,'2021-10-07 03:42:34','2021-10-07 03:42:34'),(6,'App\\Models\\User',1,'MoodTracker API Grant','01e0bdbbce7ac52ea554a901768596dcc1945fb952f4c27384d0aa306ebebedd','[\"*\"]',NULL,'2021-10-07 03:43:41','2021-10-07 03:43:41'),(7,'App\\Models\\User',1,'MoodTracker API Grant','ad1035024b6575ead9a20b057e145e14395272ec6c43122164bcfda383e53d47','[\"*\"]',NULL,'2021-10-07 03:43:42','2021-10-07 03:43:42'),(8,'App\\Models\\User',1,'MoodTracker API Grant','4dad5184ebdaf34b2cd9a0aedeacc30e4c4d157c823058c32f3d680e279c430e','[\"*\"]',NULL,'2021-10-07 03:43:45','2021-10-07 03:43:45'),(9,'App\\Models\\User',1,'MoodTracker API Grant','fd402f15bdc65d8adbfd0e99bd903a7bae19895603796fee728c99e4dcf6b925','[\"*\"]',NULL,'2021-10-07 03:43:53','2021-10-07 03:43:53'),(10,'App\\Models\\User',1,'MoodTracker API Grant','da9e23209f9c91d9bbd24bca36331d606953810469a451269c5293d89a9450d7','[\"*\"]',NULL,'2021-10-07 03:44:01','2021-10-07 03:44:01'),(11,'App\\Models\\User',1,'MoodTracker API Grant','9e3be295c09973730f7fb80cd855db2947e8e628c9c2561b973c5bcfc6dd8fb7','[\"*\"]',NULL,'2021-10-07 03:44:04','2021-10-07 03:44:04'),(12,'App\\Models\\User',1,'MoodTracker API Grant','e2cbae54121e68f194af775fcb1f4d97bcf8e0fb6922023118fa104f3cbe9e0a','[\"*\"]',NULL,'2021-10-07 03:44:07','2021-10-07 03:44:07'),(13,'App\\Models\\User',1,'MoodTracker API Grant','d2f2b19a0718de5367d0344787466175c3296661ee5bd2f5eddcfe03565966f2','[\"*\"]',NULL,'2021-10-07 03:44:17','2021-10-07 03:44:17'),(14,'App\\Models\\User',1,'MoodTracker API Grant','48a8390aefdeaa83704e81885432ab9937064b9ad4842eb0cf6e26e02e5c8d6a','[\"*\"]',NULL,'2021-10-07 03:45:12','2021-10-07 03:45:12'),(15,'App\\Models\\User',1,'MoodTracker API Grant','f57f37063f7be3f3753a9ece271eacad1b2cb5cd39d1755a0f842ac3d700353f','[\"*\"]',NULL,'2021-10-07 03:45:44','2021-10-07 03:45:44'),(16,'App\\Models\\User',1,'MoodTracker API Grant','e24f5b81ffe664124c283266c8fbfbb5d807eb0a14f6aba3cdfe02f63c2fef09','[\"*\"]',NULL,'2021-10-07 03:45:46','2021-10-07 03:45:46'),(17,'App\\Models\\User',1,'MoodTracker API Grant','e280c5aede28c891d6976573c9f565db6b8444d9f250014d43edff3bdee4b77c','[\"*\"]',NULL,'2021-10-07 03:46:52','2021-10-07 03:46:52'),(18,'App\\Models\\User',1,'MoodTracker API Grant','afb8fec14c734db8803f48c9e1a5261abd90032a9d8caaed21e553709e22cedb','[\"*\"]',NULL,'2021-10-07 03:46:54','2021-10-07 03:46:54'),(19,'App\\Models\\User',1,'MoodTracker API Grant','bd8cf02d8ccca1bae5918c591e418c464887c46cf945bec0632dd00fa5ea22f4','[\"*\"]',NULL,'2021-10-07 03:46:56','2021-10-07 03:46:56'),(20,'App\\Models\\User',1,'MoodTracker API Grant','99ca2aaaf0298dc8c91d17a541cb2bb956c2a10e6400ca0ff0c0fbff7b74f15a','[\"*\"]',NULL,'2021-10-07 03:47:38','2021-10-07 03:47:38'),(21,'App\\Models\\User',1,'MoodTracker API Grant','c033491e29ce883f897294552db27a3ef6b44b126466dcb140800e19719a8d48','[\"*\"]',NULL,'2021-10-07 03:47:57','2021-10-07 03:47:57'),(22,'App\\Models\\User',1,'MoodTracker API Grant','af12ac4dfa5570135c0eecf36dda98218d95c810905d7973a398dd00ec4bbc4b','[\"*\"]',NULL,'2021-10-07 03:48:03','2021-10-07 03:48:03'),(23,'App\\Models\\User',1,'MoodTracker API Grant','e61b53632c404db59e1f16e8e54408c2c52c9154f07b5e3a1dafa671bac43dff','[\"*\"]',NULL,'2021-10-07 03:48:05','2021-10-07 03:48:05'),(24,'App\\Models\\User',1,'MoodTracker API Grant','d810881ce5b613f748b24a8bdd9b71c85e3d53096936751414f5597bb9c8e2e9','[\"*\"]',NULL,'2021-10-07 03:48:46','2021-10-07 03:48:46'),(25,'App\\Models\\User',1,'MoodTracker API Grant','ad4a1e1cd27b80e2bf21ad679dd2b696447ae774913014f9b9b514ce272202e8','[\"*\"]',NULL,'2021-10-07 03:48:51','2021-10-07 03:48:51'),(26,'App\\Models\\User',1,'MoodTracker API Grant','cf86900ad7ab1fa26a3790a8f9c84820ed6698a3771566010994d00615a2aa36','[\"*\"]',NULL,'2021-10-07 03:48:57','2021-10-07 03:48:57'),(27,'App\\Models\\User',1,'MoodTracker API Grant','71fe2b265ee46f2b9571d0b2d93a9a80d80f634d46781b217123ebcfad21176b','[\"*\"]',NULL,'2021-10-07 03:50:23','2021-10-07 03:50:23'),(28,'App\\Models\\User',1,'MoodTracker API Grant','81612aa0b2a6db5788ee329f9b31782550b9a090eeb4f8ba301d2536063c9b27','[\"*\"]',NULL,'2021-10-07 03:50:24','2021-10-07 03:50:24'),(29,'App\\Models\\User',1,'MoodTracker API Grant','cb2ddecafdd5f3e1a7667fe6ebe4b92aa55547d354c550e8981e419f188e0e7e','[\"*\"]',NULL,'2021-10-07 03:51:02','2021-10-07 03:51:02'),(30,'App\\Models\\User',1,'MoodTracker API Grant','1d72963e9b86607f98e60d9138fae9ab42f810a593e71c1d5859a51be728c0e8','[\"*\"]',NULL,'2021-10-07 03:51:04','2021-10-07 03:51:04');
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `questions`
--

DROP TABLE IF EXISTS `questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `questions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `question` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sequence` int NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questions`
--

LOCK TABLES `questions` WRITE;
/*!40000 ALTER TABLE `questions` DISABLE KEYS */;
INSERT INTO `questions` VALUES (1,'Do you ever feel gloomy, depressed, or hopeless?',6,NULL,'2021-10-26 18:39:56','2021-12-09 10:53:45'),(2,'Struggling falling or staying asleep, or sleeping too much?/Struggling falling or staying asleep, or lying in bed too much?',6,NULL,'2021-10-26 18:42:47','2021-12-09 10:53:36'),(3,'Feeling depressed on yourself, like a failure, or like you\'ve failed yourself or your family?',6,NULL,'2021-10-26 18:44:09','2021-12-09 10:53:27'),(4,'test',5,'2021-12-09 10:45:38','2021-12-09 10:45:24','2021-12-09 10:45:38'),(5,'Do you have ideas that you\'d be better off dead, or that you\'d be better off hurting yourself in some way?',6,NULL,'2021-12-09 10:49:39','2021-12-09 10:53:18'),(6,'Feeling anxious, nervous, or tense?',5,NULL,'2021-12-09 10:53:07','2021-12-09 10:53:07'),(7,'Worrying unnecessarily about many issues?',6,NULL,'2021-12-09 10:57:36','2021-12-09 10:57:36'),(8,'Easily irritated or annoyed?',7,NULL,'2021-12-09 10:59:00','2021-12-09 10:59:00'),(9,'Fearful that something terrible will happen?',9,NULL,'2021-12-09 10:59:39','2021-12-09 11:00:59');
/*!40000 ALTER TABLE `questions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scoring_settings`
--

DROP TABLE IF EXISTS `scoring_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `scoring_settings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `score` decimal(9,2) NOT NULL,
  `result` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `remarks` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scoring_settings`
--

LOCK TABLES `scoring_settings` WRITE;
/*!40000 ALTER TABLE `scoring_settings` DISABLE KEYS */;
INSERT INTO `scoring_settings` VALUES (1,1.00,'WORST MOOD',NULL,'2021-11-03 05:46:48','2021-12-11 13:25:45','<p>fix it yourself</p>'),(2,10.00,'BAD MOOD',NULL,'2021-11-03 05:47:01','2021-12-11 13:25:55','null'),(4,11.00,'test','2021-12-09 12:44:26','2021-12-09 12:44:18','2021-12-09 12:44:26','<p>test</p>'),(5,5.00,'NEUTRAL MOOD',NULL,'2021-12-11 15:00:48','2021-12-11 15:00:48','<p>You can do it</p><p><br></p>');
/*!40000 ALTER TABLE `scoring_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tags` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
INSERT INTO `tags` VALUES (1,'Meat','2021-10-27 16:44:46','2021-10-27 16:44:46'),(2,'Veggies','2021-10-27 16:44:46','2021-10-27 16:44:46');
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fullname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'user',
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `facebook_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reset_password_token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'John','Doe','John Doe','johndoe@email.com',NULL,'$2y$10$boXKLOPs6IHgTseeCKHFnObkFBzJnc9GYTF10QoDSw2UBRrZq7dX2','user',NULL,NULL,'2021-10-07 03:20:14','2021-11-28 14:12:57',NULL,'4rTXOi2nXPY1'),(4,'Admin','Admin','Admin Admin','admin@admin.com',NULL,'$2y$10$iPcRYemJC1Z9hfP/dgoxUuEdNOX3XOhyLmIkhd3EddKF5wwjdGpfy','admin',NULL,NULL,'2021-10-07 04:57:29','2021-10-07 04:57:29',NULL,NULL),(6,'Deither','Corpuz','Deither Corpuz','dthrcrpz@gmail.com',NULL,'the-facebook-dMBQQKe62obALkq3M4nEXR8szvOhq9','user',NULL,NULL,'2021-11-03 07:17:15','2021-11-03 07:17:15','5094602760572752',NULL),(7,'Shi','Hikisaku','Shi Hikisaku','shihikisaku@gmail.com',NULL,'$2y$10$Cqg3s60QEPSE/cR6XNkp.u5NGu69yYl9XxXi9XRGMlVBbOmTc6IDi','user',NULL,NULL,'2021-11-28 22:23:27','2021-11-28 22:41:48',NULL,'JZ9Fc2ZJ5EFw'),(8,'Edrian','Subere','Edrian Subere','Edriansubere0519@gmail.com',NULL,'$2y$10$Y4kH.pDltMS96KaCb8OTRutaD3kA3tD7cpAvxFLFKGe13e.IQknWS','user',NULL,NULL,'2021-12-09 12:12:39','2021-12-09 13:51:44','5141998132495657',NULL),(9,'Camille','Santos','Camille Santos','tayloralison0612@gmail.com',NULL,'$2y$10$ygCLdIK2H89lBKEVz8dD3u0OArJ41OJZcY7Bw//.e2qDhf3MOnu2C','user',NULL,NULL,'2021-12-09 12:23:52','2021-12-09 12:23:52',NULL,NULL),(10,'phia','del rosario','phia del rosario','sophiadelrosario0@gmail.com',NULL,'$2y$10$sNEPqg9jyri.Kd0jK5ss5eVL3v9HdsZVsXa.s18b6Qu4XgQ5thkrO','user',NULL,NULL,'2021-12-09 13:57:50','2021-12-09 13:57:50',NULL,NULL),(11,'Aliza','Fabiana','Aliza Fabiana','fabiana.alizamay.t@gmail.com',NULL,'$2y$10$3M3VAoPYaYZ5uHkkehMOw.QcBv90/LbdkuJGauHaafa7jzU/dA2VG','user',NULL,NULL,'2021-12-16 12:20:34','2021-12-16 12:20:34',NULL,NULL),(12,'Michael Jay','Castillo','Michael Jay Castillo','yeahboy2798@gmail.com',NULL,'the-facebook-PKkzQj5Sy9MuPz25VoXOG1iiVemZfO','user',NULL,NULL,'2021-12-16 20:43:26','2021-12-16 20:43:26','3031260967148691',NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-12-18 13:38:49
