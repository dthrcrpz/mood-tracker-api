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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `answer_groups`
--

LOCK TABLES `answer_groups` WRITE;
/*!40000 ALTER TABLE `answer_groups` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `answers`
--

LOCK TABLES `answers` WRITE;
/*!40000 ALTER TABLE `answers` DISABLE KEYS */;
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
  `choice` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `score` decimal(8,2) NOT NULL,
  `question_id` bigint unsigned NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `choices_question_id_foreign` (`question_id`),
  CONSTRAINT `choices_question_id_foreign` FOREIGN KEY (`question_id`) REFERENCES `questions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `choices`
--

LOCK TABLES `choices` WRITE;
/*!40000 ALTER TABLE `choices` DISABLE KEYS */;
INSERT INTO `choices` VALUES (1,'Super Yes!',1.00,1,NULL,'2021-10-26 18:39:56','2021-10-26 18:39:56'),(2,'Yes',3.00,1,NULL,'2021-10-26 18:39:56','2021-10-26 18:39:56'),(3,'No',10.00,1,NULL,'2021-10-26 18:39:56','2021-10-26 18:39:56'),(4,'Lorem',5.00,1,NULL,'2021-10-26 18:39:56','2021-10-26 18:39:56'),(5,'Kind Of',1.00,2,NULL,'2021-10-26 18:42:47','2021-10-26 18:42:47'),(6,'Yes',3.00,2,NULL,'2021-10-26 18:42:47','2021-10-26 18:42:47'),(7,'No',10.00,2,NULL,'2021-10-26 18:42:47','2021-10-26 18:42:47'),(8,'Lorem',5.00,2,NULL,'2021-10-26 18:42:47','2021-10-26 18:42:47'),(13,'Of course, the only answer is yes',1.00,3,NULL,'2021-10-26 19:12:40','2021-10-26 19:12:40'),(14,'Same with A',3.00,3,NULL,'2021-10-26 19:12:40','2021-10-26 19:12:40'),(15,'Are you kidding me?!',10.00,3,NULL,'2021-10-26 19:12:40','2021-10-26 19:12:40'),(16,'OH YES!',5.00,3,NULL,'2021-10-26 19:12:40','2021-10-26 19:12:40');
/*!40000 ALTER TABLE `choices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dummies`
--

DROP TABLE IF EXISTS `dummies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dummies` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `banner_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `banner_description` longtext COLLATE utf8mb4_unicode_ci,
  `product_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_description` longtext COLLATE utf8mb4_unicode_ci,
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
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
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
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alt` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `path_resized` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sequence` int DEFAULT NULL,
  `temporary_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_size` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_resets_table',1),(3,'2016_06_01_000001_create_oauth_auth_codes_table',1),(4,'2016_06_01_000002_create_oauth_access_tokens_table',1),(5,'2016_06_01_000003_create_oauth_refresh_tokens_table',1),(6,'2016_06_01_000004_create_oauth_clients_table',1),(7,'2016_06_01_000005_create_oauth_personal_access_clients_table',1),(8,'2019_08_19_000000_create_failed_jobs_table',1),(9,'2019_12_14_000001_create_personal_access_tokens_table',1),(10,'2021_10_27_013637_create_questions_table',2),(11,'2021_10_27_014021_create_choices_table',3),(16,'2021_10_27_014600_create_answer_groups_table',4),(17,'2021_10_27_014601_create_answers_table',4),(22,'2021_10_27_145958_create_dummies_table',5),(23,'2021_10_27_150924_create_images_table',5),(25,'2021_10_27_163803_create_tags_table',6),(26,'2021_10_27_164203_create_dummy_tags_table',6);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_access_tokens`
--

DROP TABLE IF EXISTS `oauth_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `client_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
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
INSERT INTO `oauth_access_tokens` VALUES ('014eefba4f4ed4c29b71e156c5a0028e211af2122c204a68c84e984fc8347f4a1a4fc0dca3faa723',1,1,'MoodTracker API Grant','[]',1,'2021-10-07 07:45:16','2021-10-07 07:45:16','2022-04-07 15:45:16'),('01b973ae146dfd2e8a9126fb84f4f3f50bbcbcb420462221a416bf357d79a30e7f21ca88829f5012',1,1,'MoodTracker API Grant','[]',1,'2021-10-07 03:53:09','2021-10-07 03:53:09','2022-04-07 11:53:09'),('024f9daf455e9ee7206da95ba6e1ab50107def02b7550d340165c28710f6621b9640d782346bf56a',1,1,'MoodTracker API Grant','[]',1,'2021-10-07 07:26:56','2021-10-07 07:26:56','2022-04-07 15:26:56'),('18272c255263034f591ee88f8ad654beb2b13d60ecabb4624b5861051cc80d114f855643dc27bc2c',1,1,'MoodTracker API Grant','[]',1,'2021-10-07 04:42:22','2021-10-07 04:42:22','2022-04-07 12:42:22'),('22bf948d0bdf3af5079cf5f4bf287e4bc84932b22ad3201867414e20316d50fc08f8d7ee01657a66',4,1,'MoodTracker API Grant','[]',0,'2021-10-27 07:59:07','2021-10-27 07:59:07','2022-04-27 15:59:07'),('343add5af9f70d349a1462fee8b41c4ba0bb741fed2aee6fc925d79e91d54d033af59b0941f393db',1,1,'MoodTracker API Grant','[]',1,'2021-10-07 04:49:52','2021-10-07 04:49:52','2022-04-07 12:49:52'),('38c7f9fa0ce7b28146c11bdec0cf7b458dcc96a7e0e989ab0f4b092f9ed137c969b9ed96b6b90c32',1,1,'MoodTracker API Grant','[]',0,'2021-10-27 07:59:51','2021-10-27 07:59:51','2022-04-27 15:59:51'),('5c2703c070ca49eef73edc046295f75e0c1dfe92b80fc45e5a5f3ecb89f05483560b1d44d7d34dc6',1,1,'MoodTracker API Grant','[]',0,'2021-10-07 08:20:50','2021-10-07 08:20:50','2022-04-07 16:20:50'),('5c7444b9cacad7288f151f1687d92dc1922598e3e10f7f4ca49cdf88d5323cab7d21af26e27c5c9a',1,1,'MoodTracker API Grant','[]',1,'2021-10-07 06:11:47','2021-10-07 06:11:47','2022-04-07 14:11:47'),('5df31e3a513ec3273a6641a17d5b69f17a3cb86e33525d869fe4a2fe982efc4bb0fe480711b91a38',1,1,'MoodTracker API Grant','[]',0,'2021-10-07 03:54:10','2021-10-07 03:54:10','2022-04-07 11:54:10'),('5fd932061143d8ac83b895725ed20438336b988c7a31627a76e95f21861931d8886104ffbed08489',1,1,'MoodTracker API Grant','[]',1,'2021-10-07 04:50:28','2021-10-07 04:50:28','2022-04-07 12:50:27'),('65812d76272158bb2393a6704d7c1c09ec786a2b5cbebef461502262d48d12e1cac0d2369b71cad7',1,1,'MoodTracker API Grant','[]',1,'2021-10-07 04:47:44','2021-10-07 04:47:44','2022-04-07 12:47:44'),('6a2c1f074865c9302faea1108b92dbc8b59ef8ff4f7dd3e6d2aacfdb314a23b8e5c1054a097c0c60',1,1,'MoodTracker API Grant','[]',1,'2021-10-07 07:26:41','2021-10-07 07:26:41','2022-04-07 15:26:41'),('6aec40ca2dc6b2f082606b60ec5b406868f9eea053ec82ac09b7fc518937e748b9270012c7b66e90',1,1,'MoodTracker API Grant','[]',0,'2021-10-26 18:10:39','2021-10-26 18:10:39','2022-04-27 02:10:39'),('7aa490437f3124322cd6494ae777079f6b3dbcd59e938fec8fb64e2910b0fbf0b308d2bda5b1b5a8',1,1,'MoodTracker API Grant','[]',1,'2021-10-07 06:22:40','2021-10-07 06:22:40','2022-04-07 14:22:40'),('7b8f8ab2bbd9ac9ef573ded9c1ed1bd13431530b3559626552be47018b79015fab96f665a4d99c43',1,1,'MoodTracker API Grant','[]',1,'2021-10-07 04:51:40','2021-10-07 04:51:40','2022-04-07 12:51:40'),('8ae1788d8a09ef7c1b3bce105208706739dc0595100fbf35d7df6ec7ba1adbade2c1562845528e6d',1,1,'MoodTracker API Grant','[]',1,'2021-10-07 04:51:37','2021-10-07 04:51:37','2022-04-07 12:51:37'),('8b028aaa26a818fe81d6ba1a1f1cfb4fe8a4a9afcef08a65c5366b80af9b9a01ba995244a263a880',1,1,'MoodTracker API Grant','[]',1,'2021-10-07 06:11:53','2021-10-07 06:11:53','2022-04-07 14:11:53'),('a2ac6a1f73699cb87187b3c86fdb48e6c6f1c6ece2c75e6d3c93ceb7236d65f33d99ef0fbb0ef201',4,1,'MoodTracker API Grant','[]',1,'2021-10-07 04:57:29','2021-10-07 04:57:29','2022-04-07 12:57:29'),('a94b6149c70b1060fb327f27bef513db4b7de66edb4943d29bf7be9086b7a6340697c00840409c75',4,1,'MoodTracker API Grant','[]',0,'2021-10-27 08:15:19','2021-10-27 08:15:19','2022-04-27 16:15:19'),('bbc51bd322fa893444e1c58632d44c19d291e3d26d97023ea4315e165e860904386892b54383c967',4,1,'MoodTracker API Grant','[]',0,'2021-10-26 18:09:07','2021-10-26 18:09:07','2022-04-27 02:09:07'),('c241cd11f3de1bcbf6a48b6d38ad424228eba3904f50f8ea6e5e5e54ce41eba5191cc7132df4a477',1,1,'MoodTracker API Grant','[]',1,'2021-10-07 04:46:13','2021-10-07 04:46:13','2022-04-07 12:46:13'),('c75e4822550b8092fc053974c7d5f2670da9419ff4148c82bd0e899342278c9f7a3d11781706c139',3,1,'MoodTracker API Grant','[]',0,'2021-10-07 04:56:10','2021-10-07 04:56:10','2022-04-07 12:56:10'),('cbb20e0d0f1558befd80a619a25025964298981a767e7882df12a92060a906653fcc2df2b3fee07a',1,1,'MoodTracker API Grant','[]',1,'2021-10-07 04:50:53','2021-10-07 04:50:53','2022-04-07 12:50:53'),('d64ab7b1a27d88cd926e039f30fb10f6dd3438813abb61df2d7d18cd584ba49caaefad805109bd38',1,1,'MoodTracker API Grant','[]',0,'2021-10-27 07:58:53','2021-10-27 07:58:53','2022-04-27 15:58:53'),('d873fc344bc2960b6db16305a23bee8d4396f9585e3a93f8c2ba53419bfd81326381e255ae5e8e4e',1,1,'MoodTracker API Grant','[]',1,'2021-10-07 04:52:41','2021-10-07 04:52:41','2022-04-07 12:52:41'),('df79eec0538a7b7d4680b92212df63cb1496fdb6491fb74697b83f95d8c006717b15f8dfe90ccbca',1,1,'MoodTracker API Grant','[]',1,'2021-10-07 04:52:28','2021-10-07 04:52:28','2022-04-07 12:52:28'),('e0607e4dfa129c807b8b19a572bdc169818a5d882fea7f28e4b4487dc99c1cb90c5e0ea792b08df1',4,1,'MoodTracker API Grant','[]',0,'2021-10-07 04:57:29','2021-10-07 04:57:29','2022-04-07 12:57:29'),('e0938e5961112ec556764424e474cc0572c3495dde049a4167301b8f6c4f600306a9ef638a395913',4,1,'MoodTracker API Grant','[]',0,'2021-10-27 08:04:48','2021-10-27 08:04:48','2022-04-27 16:04:48'),('efb61ad00bf27eefae161ade7ac5a5e9c7c14df72b1fb4a63e0adf3bf3190c5c4680b6680375dc41',1,1,'MoodTracker API Grant','[]',0,'2021-10-26 18:06:10','2021-10-26 18:06:10','2022-04-27 02:06:10'),('f23fa776aa44841a816983663703969d3b435e0f7a531094c648375921b47a88d22106b327ba40b6',2,1,'MoodTracker API Grant','[]',0,'2021-10-07 04:55:34','2021-10-07 04:55:34','2022-04-07 12:55:34');
/*!40000 ALTER TABLE `oauth_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_auth_codes`
--

DROP TABLE IF EXISTS `oauth_auth_codes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `client_id` bigint unsigned NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
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
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
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
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
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
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
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
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
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
  `question` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sequence` int NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questions`
--

LOCK TABLES `questions` WRITE;
/*!40000 ALTER TABLE `questions` DISABLE KEYS */;
INSERT INTO `questions` VALUES (1,'Do you feel like killing someone today?',1,NULL,'2021-10-26 18:39:56','2021-10-26 18:39:56'),(2,'Are you in the mood to socialize right now?',2,NULL,'2021-10-26 18:42:47','2021-10-26 18:42:47'),(3,'Are doggos cute?',4,NULL,'2021-10-26 18:44:09','2021-10-26 19:14:02');
/*!40000 ALTER TABLE `questions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tags` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
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
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fullname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'user',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'John','Doe','John Doe','johndoe@email.com',NULL,'$2y$10$jwo4kBfHr4.qaWmpmA6Kpec3T4jxTQo2XLH89CYKFzfv7FwxwO29i','user',NULL,NULL,'2021-10-07 03:20:14','2021-10-07 03:20:14'),(4,'Admin','Admin','Admin Admin','admin@admin.com',NULL,'$2y$10$AihdPmw1u1vjhsNF/7flbOO4Gg7vnNDbvY/PiYO/4YT9eWv9XJOfG','admin',NULL,NULL,'2021-10-07 04:57:29','2021-10-07 04:57:29');
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

-- Dump completed on 2021-10-28 13:13:37
