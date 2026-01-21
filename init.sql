-- MySQL dump 10.13  Distrib 8.4.6, for Linux (x86_64)
--
-- Host: localhost    Database: example_db
-- ------------------------------------------------------
-- Server version	8.4.6

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
-- Table structure for table `bbs_entries`
--

DROP TABLE IF EXISTS `bbs_entries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bbs_entries` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `image_filename` text COLLATE utf8mb4_unicode_ci,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bbs_entries`
--

LOCK TABLES `bbs_entries` WRITE;
/*!40000 ALTER TABLE `bbs_entries` DISABLE KEYS */;
INSERT INTO `bbs_entries` VALUES (1,2,'aaa',NULL,'2025-11-19 10:03:07'),(2,2,'aaaaaa',NULL,'2025-11-19 10:11:07'),(3,2,'usausausa',NULL,'2025-11-19 10:19:38'),(4,3,'ohagisuki',NULL,'2025-11-19 10:22:03'),(5,3,'宇宙の様子','176351658702dfbcaa53939e4ee41f069525c274ad20cea7c49122d18bcf.png','2025-11-19 10:43:07'),(6,3,'おはぎ食べたい',NULL,'2026-01-14 10:25:37'),(7,3,'めっちゃ遅延してる\r\n',NULL,'2026-01-14 10:25:51'),(8,3,'U-NEXTめっちゃおすすめ',NULL,'2026-01-14 10:26:13'),(9,3,'韓ドラにはまりすぎてる',NULL,'2026-01-14 10:26:20'),(10,3,'あ',NULL,'2026-01-14 10:26:29'),(11,3,'い',NULL,'2026-01-14 10:26:33'),(12,3,'う',NULL,'2026-01-14 10:26:36'),(13,3,'え',NULL,'2026-01-14 10:26:38'),(14,3,'お',NULL,'2026-01-14 10:26:41');
/*!40000 ALTER TABLE `bbs_entries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_relationships`
--

DROP TABLE IF EXISTS `user_relationships`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_relationships` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `followee_user_id` int unsigned NOT NULL,
  `follower_user_id` int unsigned NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_relationships`
--

LOCK TABLES `user_relationships` WRITE;
/*!40000 ALTER TABLE `user_relationships` DISABLE KEYS */;
INSERT INTO `user_relationships` VALUES (1,2,3,'2025-12-10 09:55:26'),(3,3,3,'2025-12-10 10:11:57'),(4,2,2,'2025-12-10 10:13:06'),(5,3,2,'2025-12-10 10:13:50'),(6,1,3,'2025-12-17 11:47:49');
/*!40000 ALTER TABLE `user_relationships` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `icon_filename` text COLLATE utf8mb4_unicode_ci,
  `introduction` text COLLATE utf8mb4_unicode_ci,
  `cover_filename` text COLLATE utf8mb4_unicode_ci,
  `birthday` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'ちとせ','chitose@example.com','$2y$12$WlGEkfp860TFeZJ15gPSy.iXGa3c18K5Dog2pdP6jfHkbo7ShKsRG','2025-11-19 10:13:47',NULL,NULL,NULL,NULL),(2,'usa','usa@example.com','$2y$12$PdAdQuNQfGFCSH6iIsGTzOsv43TPWrWW2xpR8LJb7YJ8vFqTD0Oyu','2025-11-19 10:18:59',NULL,NULL,NULL,NULL),(3,'ohagi','ohagi@example.com','$2y$12$9r2pkujDW7kBc21cpzefUuz6Astkdr1A66jDbtgnLi.tkIM3mtS9i','2025-11-19 10:20:56','1763519861dde251705406a06571406926b548bdbdb0f56ddec5c439626e.png','宇宙のことを考えています','17641256284e59517d033e11ff6410c6dec3a64276ed6d3847823e22e497.png','2025-02-19');
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

-- Dump completed on 2026-01-21 10:48:58
