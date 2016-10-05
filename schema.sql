-- MySQL dump 10.13  Distrib 5.5.37, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: rumblr
-- ------------------------------------------------------
-- Server version	5.5.37-0ubuntu0.14.04.1

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
-- Table structure for table `blogs`
--

DROP TABLE IF EXISTS `blogs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blogs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `config` text COLLATE utf8_unicode_ci NOT NULL,
  `domain` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `blogs_user_id_foreign` (`user_id`),
  CONSTRAINT `blogs_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blogs`
--

LOCK TABLES `blogs` WRITE;
/*!40000 ALTER TABLE `blogs` DISABLE KEYS */;
INSERT INTO `blogs` VALUES (1,1,'admin','{\"title\":\"Admin Tumbelog\",\"picture\":\"uploads\\/pictures\\/580982786333084419_5564db5a95d9.jpg\",\"description\":\"Tumbelog ~ admin.\",\"customcss\":\"\"}','','2014-05-15 03:08:26','2014-05-15 04:30:08'),(2,2,'somus','{\"title\":\"Untitled\",\"picture\":\"assets\\/images\\/default_avatar.png\",\"description\":\"\",\"customcss\":\"\"}','','2014-05-15 04:23:40','2014-05-15 04:23:40'),(3,3,'icupbaby','{\"title\":\"Untitled\",\"picture\":\"assets\\/images\\/default_avatar.png\",\"description\":\"\",\"customcss\":\"\"}','','2014-05-15 04:39:31','2014-05-15 04:39:31'),(4,3,'22222','{\"title\":\"Healthy Search\",\"picture\":\"assets\\/images\\/default_avatar.png\",\"description\":\"\",\"customcss\":\"\"}','','2014-05-15 04:41:06','2014-05-15 04:41:06'),(5,4,'John','{\"title\":\"Bikini World\",\"picture\":\"uploads\\/pictures\\/x200 (2).jpg\",\"description\":\"Buy Bikini from bikini world\",\"customcss\":\"\"}','','2014-05-15 04:48:57','2014-05-15 04:50:12'),(6,5,'Mike','{\"title\":\"Shoes corner\",\"picture\":\"uploads\\/pictures\\/x200 (1).jpg\",\"description\":\"Worldly shoes \",\"customcss\":\"\"}','','2014-05-15 04:55:02','2014-05-15 04:57:41'),(7,6,'Bill','{\"title\":\"Fun for life\",\"picture\":\"uploads\\/pictures\\/x200.jpg\",\"description\":\"fun for life .. blog by Bill.\",\"customcss\":\"\"}','','2014-05-15 05:04:55','2014-05-15 05:06:38'),(8,7,'sriraman','{\"title\":\"Untitled\",\"picture\":\"assets\\/images\\/default_avatar.png\",\"description\":\"\",\"customcss\":\"\"}','','2014-05-15 05:31:14','2014-05-15 08:18:38'),(9,8,'','{\"title\":\"Untitled\",\"picture\":\"assets\\/images\\/default_avatar.png\",\"description\":\"\",\"customcss\":\"\"}','','2014-05-15 05:49:29','2014-05-15 05:49:29'),(10,1,'makeup','{\"title\":\"Makeup blog\",\"picture\":\"uploads\\/pictures\\/x200 (3).jpg\",\"description\":\"\",\"customcss\":\"\"}','','2014-05-15 06:10:20','2014-05-15 06:11:09'),(11,9,'payxoo','{\"title\":\"Payxoo\",\"picture\":\"uploads\\/pictures\\/logo1.png\",\"description\":\"Love this script!\",\"customcss\":\"\"}','','2014-05-16 03:22:17','2014-05-16 03:28:15');
/*!40000 ALTER TABLE `blogs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `follows`
--

DROP TABLE IF EXISTS `follows`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `follows` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `blog_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `follows_blog_id_foreign` (`blog_id`),
  KEY `follows_user_id_foreign` (`user_id`),
  CONSTRAINT `follows_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `follows_blog_id_foreign` FOREIGN KEY (`blog_id`) REFERENCES `blogs` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `follows`
--

LOCK TABLES `follows` WRITE;
/*!40000 ALTER TABLE `follows` DISABLE KEYS */;
INSERT INTO `follows` VALUES (1,1,4,'2014-05-15 04:52:20','2014-05-15 04:52:20'),(2,5,1,'2014-05-15 04:52:41','2014-05-15 04:52:41'),(3,1,1,'2014-05-15 05:03:16','2014-05-15 05:03:16'),(4,6,1,'2014-05-15 05:03:34','2014-05-15 05:03:34'),(5,1,5,'2014-05-15 05:03:42','2014-05-15 05:03:42'),(7,1,6,'2014-05-15 05:42:51','2014-05-15 05:42:51');
/*!40000 ALTER TABLE `follows` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `groups`
--

DROP TABLE IF EXISTS `groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `groups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `permissions` text COLLATE utf8_unicode_ci,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `groups_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `groups`
--

LOCK TABLES `groups` WRITE;
/*!40000 ALTER TABLE `groups` DISABLE KEYS */;
INSERT INTO `groups` VALUES (1,'Users','{\"users\":1}','2014-05-15 03:07:52','2014-05-15 03:07:52'),(2,'Admins','{\"admin\":1,\"users\":1}','2014-05-15 03:07:52','2014-05-15 03:07:52');
/*!40000 ALTER TABLE `groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `likes`
--

DROP TABLE IF EXISTS `likes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `likes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `likes_post_id_foreign` (`post_id`),
  KEY `likes_user_id_foreign` (`user_id`),
  CONSTRAINT `likes_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `likes_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `likes`
--

LOCK TABLES `likes` WRITE;
/*!40000 ALTER TABLE `likes` DISABLE KEYS */;
INSERT INTO `likes` VALUES (1,4,3,'2014-05-15 04:40:41','2014-05-15 04:40:41'),(2,18,1,'2014-05-15 04:52:48','2014-05-15 04:52:48'),(3,17,1,'2014-05-15 04:52:51','2014-05-15 04:52:51'),(4,16,1,'2014-05-15 04:52:55','2014-05-15 04:52:55'),(5,15,1,'2014-05-15 04:52:58','2014-05-15 04:52:58'),(6,18,1,'2014-05-15 04:53:48','2014-05-15 04:53:48'),(7,10,4,'2014-05-15 04:54:17','2014-05-15 04:54:17'),(8,20,5,'2014-05-15 05:03:44','2014-05-15 05:03:44'),(9,19,5,'2014-05-15 05:03:45','2014-05-15 05:03:45'),(10,13,5,'2014-05-15 05:03:47','2014-05-15 05:03:47'),(11,10,5,'2014-05-15 05:03:50','2014-05-15 05:03:50'),(12,9,5,'2014-05-15 05:03:51','2014-05-15 05:03:51'),(13,1,5,'2014-05-15 05:03:53','2014-05-15 05:03:53'),(14,25,1,'2014-05-15 05:03:56','2014-05-15 05:03:56'),(15,24,1,'2014-05-15 05:03:57','2014-05-15 05:03:57'),(16,23,1,'2014-05-15 05:03:59','2014-05-15 05:03:59'),(17,22,1,'2014-05-15 05:04:06','2014-05-15 05:04:06'),(18,20,1,'2014-05-15 05:04:12','2014-05-15 05:04:12'),(19,26,5,'2014-05-15 05:04:21','2014-05-15 05:04:21'),(20,25,5,'2014-05-15 05:04:22','2014-05-15 05:04:22'),(21,24,5,'2014-05-15 05:04:24','2014-05-15 05:04:24'),(22,23,5,'2014-05-15 05:04:25','2014-05-15 05:04:25'),(23,39,1,'2014-05-15 06:09:48','2014-05-15 06:09:48'),(24,38,1,'2014-05-15 06:09:51','2014-05-15 06:09:51'),(25,41,1,'2014-05-15 06:19:05','2014-05-15 06:19:05'),(26,40,1,'2014-05-15 06:19:08','2014-05-15 06:19:08'),(27,33,1,'2014-05-15 06:19:16','2014-05-15 06:19:16'),(28,32,1,'2014-05-15 06:19:18','2014-05-15 06:19:18'),(29,35,1,'2014-05-15 06:19:31','2014-05-15 06:19:31'),(30,34,1,'2014-05-15 06:19:32','2014-05-15 06:19:32'),(31,26,1,'2014-05-15 06:19:37','2014-05-15 06:19:37'),(36,48,1,'2014-05-15 07:44:45','2014-05-15 07:44:45'),(37,50,6,'2014-05-15 07:59:27','2014-05-15 07:59:27'),(38,47,1,'2014-05-15 08:21:52','2014-05-15 08:21:52'),(39,46,1,'2014-05-15 08:21:54','2014-05-15 08:21:54'),(40,45,1,'2014-05-15 08:21:56','2014-05-15 08:21:56'),(41,44,1,'2014-05-15 08:21:59','2014-05-15 08:21:59'),(42,51,1,'2014-05-15 23:45:50','2014-05-15 23:45:50'),(43,50,1,'2014-05-15 23:45:51','2014-05-15 23:45:51'),(44,54,1,'2014-05-16 03:38:55','2014-05-16 03:38:55'),(45,53,1,'2014-05-16 03:38:56','2014-05-16 03:38:56'),(46,52,1,'2014-05-16 03:38:59','2014-05-16 03:38:59');
/*!40000 ALTER TABLE `likes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `messages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sender_id` int(10) unsigned NOT NULL,
  `receiver_id` int(10) unsigned NOT NULL,
  `message` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `messages_sender_id_foreign` (`sender_id`),
  KEY `messages_receiver_id_foreign` (`receiver_id`),
  CONSTRAINT `messages_receiver_id_foreign` FOREIGN KEY (`receiver_id`) REFERENCES `blogs` (`id`),
  CONSTRAINT `messages_sender_id_foreign` FOREIGN KEY (`sender_id`) REFERENCES `blogs` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messages`
--

LOCK TABLES `messages` WRITE;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
INSERT INTO `messages` VALUES (1,7,1,'hello admin. you got a nice blog','2014-05-15 05:43:01','2014-05-15 05:43:01'),(2,6,1,'Your blog post on Justin Bieber is unprofessional','2014-05-15 05:43:43','2014-05-15 05:43:43'),(3,5,1,'This is john from Bikini world.','2014-05-15 05:44:14','2014-05-15 05:44:14');
/*!40000 ALTER TABLE `messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES ('2012_12_06_225921_migration_cartalyst_sentry_install_users',1),('2012_12_06_225929_migration_cartalyst_sentry_install_groups',1),('2012_12_06_225945_migration_cartalyst_sentry_install_users_groups_pivot',1),('2012_12_06_225988_migration_cartalyst_sentry_install_throttle',1),('2014_04_15_115839_create_blogs_table',1),('2014_04_15_120600_create_posts_table',1),('2014_04_15_120923_create_tags_table',1),('2014_04_15_121026_create_regular_posts_table',1),('2014_04_15_122015_create_posts_tags_table',1),('2014_04_15_122307_create_pages_table',1),('2014_04_15_122520_create_likes_table',1),('2014_04_15_122740_create_follows_table',1),('2014_04_18_014521_add_username_field_to_users_table',1),('2014_04_22_130755_create_reblogged_posts_table',1),('2014_04_23_072224_create_messages_table',1),('2014_05_15_073948_settings',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pages`
--

DROP TABLE IF EXISTS `pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `content` text COLLATE utf8_unicode_ci NOT NULL,
  `blog_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `pages_blog_id_foreign` (`blog_id`),
  CONSTRAINT `pages_blog_id_foreign` FOREIGN KEY (`blog_id`) REFERENCES `blogs` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pages`
--

LOCK TABLES `pages` WRITE;
/*!40000 ALTER TABLE `pages` DISABLE KEYS */;
/*!40000 ALTER TABLE `pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `posts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` enum('regular','reblogged') COLLATE utf8_unicode_ci NOT NULL,
  `search_index` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `blog_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `posts_blog_id_foreign` (`blog_id`),
  CONSTRAINT `posts_blog_id_foreign` FOREIGN KEY (`blog_id`) REFERENCES `blogs` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES (1,'regular','Poem-poem, lines, quotes',1,'2014-05-15 04:39:53','2014-05-15 04:39:53',NULL),(2,'regular','dfsdf-sdfsf',3,'2014-05-15 04:39:56','2014-05-15 04:41:46','2014-05-15 04:41:46'),(3,'regular','#hugs #kiss',1,'2014-05-15 04:40:21','2014-05-15 04:41:40','2014-05-15 04:41:40'),(4,'regular','dddd - ',3,'2014-05-15 04:40:25','2014-05-15 04:41:35','2014-05-15 04:41:35'),(5,'regular','ada-hello',1,'2014-05-15 04:41:01','2014-05-15 04:41:43','2014-05-15 04:41:43'),(6,'regular','edgdsgb-a,b',2,'2014-05-15 04:42:11','2014-05-15 04:42:54','2014-05-15 04:42:54'),(7,'regular','asdas-hello poem',1,'2014-05-15 04:42:18','2014-05-15 04:42:23','2014-05-15 04:42:23'),(8,'regular','awsda-tag, asa',1,'2014-05-15 04:42:43','2014-05-15 04:42:53','2014-05-15 04:42:53'),(9,'regular','kiss, love, hugs',1,'2014-05-15 04:43:14','2014-05-15 04:43:14',NULL),(10,'regular','quotes, life, love, world, peace',1,'2014-05-15 04:44:32','2014-05-15 04:44:32',NULL),(11,'regular',' - ',1,'2014-05-15 04:44:41','2014-05-15 04:44:45','2014-05-15 04:44:45'),(12,'regular','Tales of Escapees Add to Worries About Nigerian Girls - girls nigeria',1,'2014-05-15 04:45:44','2014-05-15 04:45:58','2014-05-15 04:45:58'),(13,'regular','Tales of Escapees Add to Worries About Nigerian Girls - girls, nigeria',1,'2014-05-15 04:46:26','2014-05-15 04:46:26',NULL),(14,'regular','#red #girls',5,'2014-05-15 04:50:32','2014-05-15 04:50:58','2014-05-15 04:50:58'),(15,'regular','girls, bikini',5,'2014-05-15 04:51:09','2014-05-15 04:51:09',NULL),(16,'regular','girls, bikini, undie',5,'2014-05-15 04:51:26','2014-05-15 04:51:26',NULL),(17,'regular','bra, love, life',5,'2014-05-15 04:51:45','2014-05-15 04:51:45',NULL),(18,'regular','sex, love, life',5,'2014-05-15 04:52:08','2014-05-15 04:52:08',NULL),(19,'reblogged','sex, love, life',1,'2014-05-15 04:53:55','2014-05-15 04:53:55',NULL),(20,'reblogged','girls, bikini, undie',1,'2014-05-15 04:54:05','2014-05-15 04:54:05',NULL),(21,'reblogged','quotes, life, love, world, peace',5,'2014-05-15 04:54:19','2014-05-15 04:54:19',NULL),(22,'reblogged','kiss, love, hugs',5,'2014-05-15 04:54:25','2014-05-15 04:54:25',NULL),(23,'regular','shoes, red, nike',6,'2014-05-15 04:58:01','2014-05-15 04:58:01',NULL),(24,'regular','adidas, shoe, running',6,'2014-05-15 04:58:47','2014-05-15 04:58:47',NULL),(25,'regular','nike, do it right, ',6,'2014-05-15 04:58:59','2014-05-15 04:58:59',NULL),(26,'reblogged','kiss, love, hugs',1,'2014-05-15 05:04:09','2014-05-15 05:04:09',NULL),(27,'regular','dgdsg-a,b, ',2,'2014-05-15 05:05:08','2014-05-15 05:11:23','2014-05-15 05:11:23'),(28,'regular','dsfsdg-b, a,',2,'2014-05-15 05:06:46','2014-05-15 05:11:21','2014-05-15 05:11:21'),(29,'regular','dgrhdtjgj-sf, f, ',2,'2014-05-15 05:10:29','2014-05-15 05:11:20','2014-05-15 05:11:20'),(30,'regular','aaaaa-aa, aa',2,'2014-05-15 05:11:06','2014-05-15 05:11:18','2014-05-15 05:11:18'),(31,'regular','Funny text-chat, hello, world',7,'2014-05-15 05:14:22','2014-05-15 05:14:22',NULL),(32,'regular','sex, love, life',7,'2014-05-15 05:14:39','2014-05-15 05:14:39',NULL),(33,'regular','shoe, life, colors',7,'2014-05-15 05:15:06','2014-05-15 05:15:06',NULL),(34,'regular','chat, world, text',7,'2014-05-15 05:15:29','2014-05-15 05:15:29',NULL),(35,'regular','world',7,'2014-05-15 05:15:46','2014-05-15 05:15:46',NULL),(36,'regular','dummy',8,'2014-05-15 05:34:13','2014-05-15 05:34:13',NULL),(37,'regular','dfsdfsdf-',3,'2014-05-15 05:58:29','2014-05-15 06:09:54','2014-05-15 06:09:54'),(38,'regular','love, life, black',1,'2014-05-15 06:09:19','2014-05-15 06:09:19',NULL),(39,'regular','girls, fun, love, sex, life',1,'2014-05-15 06:09:43','2014-05-15 06:09:43',NULL),(40,'regular','wear, bra',10,'2014-05-15 06:10:39','2014-05-15 06:10:39',NULL),(41,'regular','#love',10,'2014-05-15 06:11:27','2014-05-15 06:11:27',NULL),(42,'reblogged','sex, love, life',1,'2014-05-15 06:19:13','2014-05-15 06:19:13',NULL),(43,'reblogged','shoe, life, colors',1,'2014-05-15 06:19:26','2014-05-15 06:19:26',NULL),(44,'regular','obama',8,'2014-05-15 06:42:57','2014-05-15 06:42:57',NULL),(45,'regular','priyanka',8,'2014-05-15 06:50:59','2014-05-15 06:50:59',NULL),(46,'regular','',1,'2014-05-15 07:10:49','2014-05-15 07:10:49',NULL),(47,'regular','',1,'2014-05-15 07:11:57','2014-05-15 07:11:57',NULL),(48,'regular','bodypaintedjeans,thongs',8,'2014-05-15 07:28:18','2014-05-15 07:28:18',NULL),(49,'reblogged','bodypaintedjeans,thongs',1,'2014-05-15 07:44:48','2014-05-15 07:54:08','2014-05-15 07:54:08'),(50,'regular','',7,'2014-05-15 07:59:18','2014-05-15 07:59:18',NULL),(51,'reblogged','bodypaintedjeans,thongs',1,'2014-05-15 08:08:01','2014-05-15 08:08:01',NULL),(52,'regular','Testing-love',11,'2014-05-16 03:23:28','2014-05-16 03:23:28',NULL),(53,'regular','#beach',11,'2014-05-16 03:24:45','2014-05-16 03:24:45',NULL),(54,'regular','good ',11,'2014-05-16 03:25:17','2014-05-16 03:25:17',NULL),(55,'regular','Arts &amp; Entertainment News-arts',11,'2014-05-16 03:31:02','2014-05-16 03:35:53','2014-05-16 03:35:53'),(56,'reblogged','Testing-love',1,'2014-05-16 03:38:46','2014-05-16 03:38:46',NULL),(57,'reblogged','good ',1,'2014-05-16 03:38:52','2014-05-16 03:38:52',NULL);
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts_tags`
--

DROP TABLE IF EXISTS `posts_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `posts_tags` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` int(10) unsigned NOT NULL,
  `tag_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `posts_tags_post_id_foreign` (`post_id`),
  KEY `posts_tags_tag_id_foreign` (`tag_id`),
  CONSTRAINT `posts_tags_tag_id_foreign` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`),
  CONSTRAINT `posts_tags_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=120 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts_tags`
--

LOCK TABLES `posts_tags` WRITE;
/*!40000 ALTER TABLE `posts_tags` DISABLE KEYS */;
INSERT INTO `posts_tags` VALUES (1,1,1,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2,1,2,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(3,1,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(4,2,4,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(5,3,5,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(6,4,6,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(7,5,7,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(8,6,8,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(9,6,9,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(10,7,10,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(11,8,11,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(12,8,12,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(13,9,13,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(14,9,14,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(15,9,15,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(16,10,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(17,10,16,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(18,10,14,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(19,10,17,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(20,10,18,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(21,11,6,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(22,12,19,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(23,13,20,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(24,13,21,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(25,14,22,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(26,15,20,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(27,15,23,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(28,16,20,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(29,16,23,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(30,16,24,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(31,17,25,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(32,17,14,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(33,17,16,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(34,18,26,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(35,18,14,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(36,18,16,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(37,19,26,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(38,19,14,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(39,19,16,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(40,20,20,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(41,20,23,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(42,20,24,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(43,21,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(44,21,16,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(45,21,14,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(46,21,17,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(47,21,18,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(48,22,13,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(49,22,14,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(50,22,15,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(51,23,27,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(52,23,28,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(53,23,29,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(54,24,30,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(55,24,31,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(56,24,32,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(57,25,29,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(58,25,33,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(59,25,6,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(60,26,13,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(61,26,14,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(62,26,15,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(63,27,8,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(64,27,9,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(65,27,6,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(66,28,9,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(67,28,8,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(68,28,6,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(69,29,34,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(70,29,35,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(71,29,6,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(72,30,36,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(73,30,36,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(74,31,37,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(75,31,7,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(76,31,17,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(77,32,26,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(78,32,14,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(79,32,16,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(80,33,31,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(81,33,16,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(82,33,38,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(83,34,37,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(84,34,17,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(85,34,39,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(86,35,17,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(87,36,40,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(88,37,6,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(89,38,14,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(90,38,16,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(91,38,41,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(92,39,20,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(93,39,42,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(94,39,14,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(95,39,26,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(96,39,16,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(97,40,43,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(98,40,25,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(99,41,44,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(100,42,26,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(101,42,14,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(102,42,16,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(103,43,31,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(104,43,16,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(105,43,38,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(106,44,45,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(107,45,46,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(108,48,47,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(109,48,48,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(110,49,47,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(111,49,48,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(112,51,47,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(113,51,48,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(114,52,14,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(115,53,49,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(116,54,50,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(117,55,51,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(118,56,14,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(119,57,50,'0000-00-00 00:00:00','0000-00-00 00:00:00');
/*!40000 ALTER TABLE `posts_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reblogged_posts`
--

DROP TABLE IF EXISTS `reblogged_posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reblogged_posts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` int(10) unsigned NOT NULL,
  `original_post_id` int(10) unsigned NOT NULL,
  `type` enum('text','image','quote','link') COLLATE utf8_unicode_ci NOT NULL,
  `content` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `reblogged_posts_post_id_foreign` (`post_id`),
  KEY `reblogged_posts_original_post_id_foreign` (`original_post_id`),
  CONSTRAINT `reblogged_posts_original_post_id_foreign` FOREIGN KEY (`original_post_id`) REFERENCES `posts` (`id`),
  CONSTRAINT `reblogged_posts_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reblogged_posts`
--

LOCK TABLES `reblogged_posts` WRITE;
/*!40000 ALTER TABLE `reblogged_posts` DISABLE KEYS */;
INSERT INTO `reblogged_posts` VALUES (1,19,18,'image','{\"comment\":\" Love. \"}','2014-05-15 04:53:55','2014-05-15 04:53:55',NULL),(2,20,16,'image','{\"comment\":\" \"}','2014-05-15 04:54:05','2014-05-15 04:54:05',NULL),(3,21,10,'quote','{\"comment\":\" \"}','2014-05-15 04:54:19','2014-05-15 04:54:19',NULL),(4,22,9,'image','{\"comment\":\" \"}','2014-05-15 04:54:25','2014-05-15 04:54:25',NULL),(5,26,9,'image','{\"comment\":\" \"}','2014-05-15 05:04:09','2014-05-15 05:04:09',NULL),(6,42,32,'image','{\"comment\":\" \"}','2014-05-15 06:19:13','2014-05-15 06:19:13',NULL),(7,43,33,'image','{\"comment\":\" \"}','2014-05-15 06:19:26','2014-05-15 06:19:26',NULL),(8,49,48,'','{\"comment\":\" \"}','2014-05-15 07:44:48','2014-05-15 07:44:48',NULL),(9,51,48,'','{\"comment\":\" \"}','2014-05-15 08:08:01','2014-05-15 08:08:01',NULL),(10,56,52,'text','{\"comment\":\" \"}','2014-05-16 03:38:46','2014-05-16 03:38:46',NULL),(11,57,54,'quote','{\"comment\":\" \"}','2014-05-16 03:38:52','2014-05-16 03:38:52',NULL);
/*!40000 ALTER TABLE `reblogged_posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `regular_posts`
--

DROP TABLE IF EXISTS `regular_posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `regular_posts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` int(10) unsigned NOT NULL,
  `type` enum('text','video','audio','image','quote','chat','link') COLLATE utf8_unicode_ci NOT NULL,
  `content` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `regular_posts_post_id_foreign` (`post_id`),
  CONSTRAINT `regular_posts_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `regular_posts`
--

LOCK TABLES `regular_posts` WRITE;
/*!40000 ALTER TABLE `regular_posts` DISABLE KEYS */;
INSERT INTO `regular_posts` VALUES (1,1,'text','{\"title\":\"Poem\",\"content\":\"she&rsquo;s beauty and she&rsquo;s grace, she dropped her phone on her face\"}','2014-05-15 04:39:53','2014-05-15 04:39:53',NULL),(2,2,'chat','{\"title\":\"dfsdf\",\"content\":\"sdfsf\"}','2014-05-15 04:39:56','2014-05-15 04:39:56',NULL),(3,3,'image','{\"files\":[\"uploads\\/pictures\\/tumblr_muyygg6jNT1rlba0uo1_250.png\"]}','2014-05-15 04:40:21','2014-05-15 04:40:21',NULL),(4,4,'link','{\"url\":\"https:\\/\\/www.youtube.com\\/watch?v=DMbG5hSbtWw\",\"title\":\"dddd\",\"caption\":\"\"}','2014-05-15 04:40:25','2014-05-15 04:40:25',NULL),(5,5,'text','{\"title\":\"ada\",\"content\":\"asa\"}','2014-05-15 04:41:01','2014-05-15 04:41:01',NULL),(6,6,'text','{\"title\":\"edgdsgb\",\"content\":\"dgdg\"}','2014-05-15 04:42:11','2014-05-15 04:42:11',NULL),(7,7,'text','{\"title\":\"asdas\",\"content\":\"sasa\"}','2014-05-15 04:42:18','2014-05-15 04:42:18',NULL),(8,8,'text','{\"title\":\"awsda\",\"content\":\"asdfa\"}','2014-05-15 04:42:43','2014-05-15 04:42:43',NULL),(9,9,'image','{\"files\":[\"uploads\\/pictures\\/tumblr_muyygg6jNT1rlba0uo1_250.png\"]}','2014-05-15 04:43:14','2014-05-15 04:43:14',NULL),(10,10,'quote','{\"content\":\"I welcome questions, I hate assumptions\",\"source\":\"www.google.com\"}','2014-05-15 04:44:32','2014-05-15 04:44:32',NULL),(11,11,'link','{\"url\":\"htt\",\"title\":\"\",\"caption\":\"\"}','2014-05-15 04:44:41','2014-05-15 04:44:41',NULL),(12,12,'link','{\"url\":\"http:\\/\\/www.nytimes.com\\/2014\\/05\\/15\\/world\\/africa\\/tales-of-escapees-in-nigeria-add-to-worries-about-other-kidnapped-girls.html?hp\",\"title\":\"Tales of Escapees Add to Worries About Nigerian Girls\",\"caption\":\"Some of the 53 schoolgirls who escaped Boko Haram kidnappers told of their terror as President Goodluck Jonathan rejected the militant group&rsquo;s demand for a prisoner exchange.\"}','2014-05-15 04:45:44','2014-05-15 04:45:44',NULL),(13,13,'link','{\"url\":\"http:\\/\\/www.nytimes.com\\/2014\\/05\\/15\\/world\\/africa\\/tales-of-escapees-in-nigeria-add-to-worries-about-other-kidnapped-girls.html?hp\",\"title\":\"Tales of Escapees Add to Worries About Nigerian Girls\",\"caption\":\"Nigerian Girls\"}','2014-05-15 04:46:26','2014-05-15 04:46:26',NULL),(14,14,'image','{\"files\":[\"uploads\\/pictures\\/original (9).jpg\"]}','2014-05-15 04:50:32','2014-05-15 04:50:32',NULL),(15,15,'image','{\"files\":[\"uploads\\/pictures\\/original (9).jpg\"]}','2014-05-15 04:51:09','2014-05-15 04:51:09',NULL),(16,16,'image','{\"files\":[\"uploads\\/pictures\\/original (8).jpg\"]}','2014-05-15 04:51:26','2014-05-15 04:51:26',NULL),(17,17,'image','{\"files\":[\"uploads\\/pictures\\/original (7).jpg\"]}','2014-05-15 04:51:45','2014-05-15 04:51:45',NULL),(18,18,'image','{\"files\":[\"uploads\\/pictures\\/tumblr_muxjjs9fmW1rlba0uo1_250.gif\"]}','2014-05-15 04:52:08','2014-05-15 04:52:08',NULL),(19,23,'image','{\"files\":[\"uploads\\/pictures\\/original (13).jpg\"]}','2014-05-15 04:58:01','2014-05-15 04:58:01',NULL),(20,24,'image','{\"files\":[\"uploads\\/pictures\\/original (12).jpg\"]}','2014-05-15 04:58:47','2014-05-15 04:58:47',NULL),(21,25,'image','{\"files\":[\"uploads\\/pictures\\/original (10).jpg\"]}','2014-05-15 04:58:59','2014-05-15 04:58:59',NULL),(22,27,'text','{\"title\":\"dgdsg\",\"content\":\"dgdg\"}','2014-05-15 05:05:08','2014-05-15 05:05:08',NULL),(23,28,'text','{\"title\":\"dsfsdg\",\"content\":\"dfdg\"}','2014-05-15 05:06:46','2014-05-15 05:06:46',NULL),(24,29,'text','{\"title\":\"dgrhdtjgj\",\"content\":\"sfdsg\"}','2014-05-15 05:10:29','2014-05-15 05:10:29',NULL),(25,30,'text','{\"title\":\"aaaaa\",\"content\":\"sgdfhfdhj\"}','2014-05-15 05:11:06','2014-05-15 05:11:06',NULL),(26,31,'chat','{\"title\":\"Funny text\",\"content\":\"User 1: Hello\\r\\nUser 2: How are you\"}','2014-05-15 05:14:22','2014-05-15 05:14:22',NULL),(27,32,'image','{\"files\":[\"uploads\\/pictures\\/tumblr_n371rkrOVS1rlba0uo1_250.gif\"]}','2014-05-15 05:14:39','2014-05-15 05:14:39',NULL),(28,33,'image','{\"files\":[\"uploads\\/pictures\\/original (11).jpg\"]}','2014-05-15 05:15:06','2014-05-15 05:15:06',NULL),(29,34,'image','{\"files\":[\"uploads\\/pictures\\/tumblr_mzdb6q8uoe1snkwx1o1_500.jpg\"]}','2014-05-15 05:15:29','2014-05-15 05:15:29',NULL),(30,35,'quote','{\"content\":\"Evil world. \",\"source\":\"www.google.com\"}','2014-05-15 05:15:46','2014-05-15 05:15:46',NULL),(31,36,'video','{\"url\":\"uploads\\/videos\\/1 Second Video.mp4\",\"filename\":\"1 Second Video.mp4\"}','2014-05-15 05:34:13','2014-05-15 05:34:13',NULL),(32,37,'chat','{\"title\":\"dfsdfsdf\",\"content\":\"sdfsf\"}','2014-05-15 05:58:29','2014-05-15 05:58:29',NULL),(33,38,'image','{\"files\":[\"uploads\\/pictures\\/original (1).jpg\"]}','2014-05-15 06:09:19','2014-05-15 06:09:19',NULL),(34,39,'image','{\"files\":[\"uploads\\/pictures\\/original (2).jpg\"]}','2014-05-15 06:09:43','2014-05-15 06:09:43',NULL),(35,40,'image','{\"files\":[\"uploads\\/pictures\\/original (6).jpg\"]}','2014-05-15 06:10:39','2014-05-15 06:10:39',NULL),(36,41,'image','{\"files\":[\"uploads\\/pictures\\/tumblr_mo4jegpeVK1rlba0uo1_250.jpg\"]}','2014-05-15 06:11:27','2014-05-15 06:11:27',NULL),(37,44,'video','{\"url\":\"uploads\\/videos\\/Message from President Obama- Happy National Small Business Week.mp4\",\"filename\":\"Message from President Obama- Happy National Small Business Week.mp4\"}','2014-05-15 06:42:57','2014-05-15 06:42:57',NULL),(38,45,'video','{\"url\":\"uploads\\/videos\\/Nagada Sang Dhol Song - Goliyon Ki Raasleela Ram-leela ft. Deepika Padukone, Ranveer Singh.mp4\",\"filename\":\"Nagada Sang Dhol Song - Goliyon Ki Raasleela Ram-leela ft. Deepika Padukone, Ranveer Singh.mp4\"}','2014-05-15 06:50:59','2014-05-15 06:50:59',NULL),(39,46,'video','{\"url\":\"uploads\\/videos\\/Double the Fun DCT Short Film.mp4\",\"filename\":\"Double the Fun DCT Short Film.mp4\"}','2014-05-15 07:10:49','2014-05-15 07:10:49',NULL),(40,47,'video','{\"url\":\"uploads\\/videos\\/NBC News Anchor Fired In Less Than A Minute.mp4\",\"filename\":\"NBC News Anchor Fired In Less Than A Minute.mp4\"}','2014-05-15 07:11:57','2014-05-15 07:11:57',NULL),(41,48,'video','{\"url\":\"uploads\\/videos\\/Elle se balade cul nu dans la rue.mp4\",\"filename\":\"Elle se balade cul nu dans la rue.mp4\"}','2014-05-15 07:28:18','2014-05-15 07:28:18',NULL),(42,50,'audio','{\"url\":\"uploads\\/audios\\/01. Newly Married.mp3\",\"filename\":\"01. Newly Married.mp3\"}','2014-05-15 07:59:18','2014-05-15 07:59:18',NULL),(43,52,'text','{\"title\":\"Testing\",\"content\":\"Love this script\"}','2014-05-16 03:23:28','2014-05-16 03:23:28',NULL),(44,53,'image','{\"files\":[\"uploads\\/pictures\\/208ba73285f964de44729c70338685b2.jpeg\"]}','2014-05-16 03:24:45','2014-05-16 03:24:45',NULL),(45,54,'quote','{\"content\":\"Good Script\",\"source\":\"- jose\"}','2014-05-16 03:25:17','2014-05-16 03:25:17',NULL),(46,55,'chat','{\"title\":\"Arts &amp; Entertainment News\",\"content\":\"what can you say about this subject?\"}','2014-05-16 03:31:02','2014-05-16 03:31:02',NULL);
/*!40000 ALTER TABLE `regular_posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `settings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `option` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings`
--

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT INTO `settings` VALUES (1,'header_code','&lt;!-- Sample header embed --&gt;','2014-05-15 03:07:52','2014-05-15 04:05:00'),(2,'footer_code','&lt;script&gt;\r\n\r\n&lt;/script&gt;','2014-05-15 03:07:52','2014-05-15 04:05:35');
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tags` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
INSERT INTO `tags` VALUES (1,'poem','2014-05-15 04:39:53','2014-05-15 04:39:53'),(2,'lines','2014-05-15 04:39:53','2014-05-15 04:39:53'),(3,'quotes','2014-05-15 04:39:53','2014-05-15 04:39:53'),(4,'sdfsf','2014-05-15 04:39:56','2014-05-15 04:39:56'),(5,'#hugs#kiss','2014-05-15 04:40:21','2014-05-15 04:40:21'),(6,'','2014-05-15 04:40:25','2014-05-15 04:40:25'),(7,'hello','2014-05-15 04:41:01','2014-05-15 04:41:01'),(8,'a','2014-05-15 04:42:11','2014-05-15 04:42:11'),(9,'b','2014-05-15 04:42:11','2014-05-15 04:42:11'),(10,'hellopoem','2014-05-15 04:42:18','2014-05-15 04:42:18'),(11,'tag','2014-05-15 04:42:43','2014-05-15 04:42:43'),(12,'asa','2014-05-15 04:42:43','2014-05-15 04:42:43'),(13,'kiss','2014-05-15 04:43:14','2014-05-15 04:43:14'),(14,'love','2014-05-15 04:43:14','2014-05-15 04:43:14'),(15,'hugs','2014-05-15 04:43:14','2014-05-15 04:43:14'),(16,'life','2014-05-15 04:44:32','2014-05-15 04:44:32'),(17,'world','2014-05-15 04:44:32','2014-05-15 04:44:32'),(18,'peace','2014-05-15 04:44:32','2014-05-15 04:44:32'),(19,'girlsnigeria','2014-05-15 04:45:44','2014-05-15 04:45:44'),(20,'girls','2014-05-15 04:46:26','2014-05-15 04:46:26'),(21,'nigeria','2014-05-15 04:46:26','2014-05-15 04:46:26'),(22,'#red#girls','2014-05-15 04:50:32','2014-05-15 04:50:32'),(23,'bikini','2014-05-15 04:51:09','2014-05-15 04:51:09'),(24,'undie','2014-05-15 04:51:26','2014-05-15 04:51:26'),(25,'bra','2014-05-15 04:51:45','2014-05-15 04:51:45'),(26,'sex','2014-05-15 04:52:08','2014-05-15 04:52:08'),(27,'shoes','2014-05-15 04:58:01','2014-05-15 04:58:01'),(28,'red','2014-05-15 04:58:01','2014-05-15 04:58:01'),(29,'nike','2014-05-15 04:58:01','2014-05-15 04:58:01'),(30,'adidas','2014-05-15 04:58:47','2014-05-15 04:58:47'),(31,'shoe','2014-05-15 04:58:47','2014-05-15 04:58:47'),(32,'running','2014-05-15 04:58:47','2014-05-15 04:58:47'),(33,'doitright','2014-05-15 04:58:59','2014-05-15 04:58:59'),(34,'sf','2014-05-15 05:10:29','2014-05-15 05:10:29'),(35,'f','2014-05-15 05:10:29','2014-05-15 05:10:29'),(36,'aa','2014-05-15 05:11:06','2014-05-15 05:11:06'),(37,'chat','2014-05-15 05:14:22','2014-05-15 05:14:22'),(38,'colors','2014-05-15 05:15:06','2014-05-15 05:15:06'),(39,'text','2014-05-15 05:15:29','2014-05-15 05:15:29'),(40,'dummy','2014-05-15 05:34:13','2014-05-15 05:34:13'),(41,'black','2014-05-15 06:09:19','2014-05-15 06:09:19'),(42,'fun','2014-05-15 06:09:43','2014-05-15 06:09:43'),(43,'wear','2014-05-15 06:10:39','2014-05-15 06:10:39'),(44,'#love','2014-05-15 06:11:27','2014-05-15 06:11:27'),(45,'obama','2014-05-15 06:42:57','2014-05-15 06:42:57'),(46,'priyanka','2014-05-15 06:50:59','2014-05-15 06:50:59'),(47,'bodypaintedjeans','2014-05-15 07:28:18','2014-05-15 07:28:18'),(48,'thongs','2014-05-15 07:28:18','2014-05-15 07:28:18'),(49,'beach','2014-05-16 03:24:45','2014-05-16 03:24:45'),(50,'good','2014-05-16 03:25:17','2014-05-16 03:25:17'),(51,'arts','2014-05-16 03:31:02','2014-05-16 03:31:02');
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `throttle`
--

DROP TABLE IF EXISTS `throttle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `throttle` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `ip_address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `attempts` int(11) NOT NULL DEFAULT '0',
  `suspended` tinyint(1) NOT NULL DEFAULT '0',
  `banned` tinyint(1) NOT NULL DEFAULT '0',
  `last_attempt_at` timestamp NULL DEFAULT NULL,
  `suspended_at` timestamp NULL DEFAULT NULL,
  `banned_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `throttle_user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `throttle`
--

LOCK TABLES `throttle` WRITE;
/*!40000 ALTER TABLE `throttle` DISABLE KEYS */;
INSERT INTO `throttle` VALUES (1,1,NULL,0,0,0,NULL,NULL,NULL),(2,2,'103.6.158.181',0,0,0,NULL,NULL,NULL),(3,3,'207.6.94.236',0,0,0,NULL,NULL,NULL),(4,4,'103.6.158.181',0,0,0,NULL,NULL,NULL),(5,5,'103.6.158.181',0,0,0,NULL,NULL,NULL),(6,6,'103.6.158.181',0,0,0,NULL,NULL,NULL),(7,7,'103.6.158.181',0,0,0,NULL,NULL,NULL),(8,8,NULL,0,0,0,NULL,NULL,NULL),(9,9,'69.118.34.45',0,0,0,NULL,NULL,NULL);
/*!40000 ALTER TABLE `throttle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `permissions` text COLLATE utf8_unicode_ci,
  `activated` tinyint(1) NOT NULL DEFAULT '0',
  `activation_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `activated_at` timestamp NULL DEFAULT NULL,
  `last_login` timestamp NULL DEFAULT NULL,
  `persist_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `reset_password_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `first_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  KEY `users_activation_code_index` (`activation_code`),
  KEY `users_reset_password_code_index` (`reset_password_code`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin@rumblr.biz','$2y$10$0r7Ot4s8aex8sCQJ2kSJiunafcGoDt1WV0OZNn3fqPXP1rS5wb6nu',NULL,1,NULL,NULL,'2014-05-16 04:13:33','$2y$10$7bo59fn4YqX5mHeUX.KXQeKwBL.QnInzqx6NkpeDG7WjWedtrq84.',NULL,NULL,NULL,'2014-05-15 03:08:25','2014-05-16 04:13:33','admin'),(2,'somasundaram321@gmail.com','$2y$10$7xM.RJbf6G24iLGQOtPRCu1WiV638BQMl4yx2sMo0jNJ/XCsc5hSS',NULL,1,NULL,'2014-05-15 04:25:41','2014-05-15 04:26:19','$2y$10$PpbCHWHCxxq91jIKqaKxLuw38z0ZifeIWh4VU7cSk953Ngwhw9UHO',NULL,NULL,NULL,'2014-05-15 04:23:40','2014-05-15 04:26:19','somus'),(3,'icupbaby@gmail.com','$2y$10$WlG7O4moANZXJ.6lI/Md9e4pVH1IcGj/LXP6zN1mru1quEUg3XbkC',NULL,1,NULL,'2014-05-15 04:39:41','2014-05-15 05:58:20','$2y$10$4amau9De7omqWAnS.P7tP.9.RieOpOCS2eB.ZA4pisZV9TtR6mF2q',NULL,NULL,NULL,'2014-05-15 04:39:30','2014-05-15 05:58:20','icupbaby'),(4,'john@mailinator.com','$2y$10$UKOBnrwuwY6Hkp/VbPA0sOiFbInfsBYkjk5OJNRaFJuyj41YMmlmS',NULL,1,NULL,'2014-05-15 04:49:12','2014-05-15 05:43:57','$2y$10$9XLYI94sKuvpyFONJ7uun.DJjSUJkdQNUZfNbKQ4JCGjoo09wHJwa',NULL,NULL,NULL,'2014-05-15 04:48:56','2014-05-15 05:43:57','John'),(5,'mike@mailinator.com','$2y$10$LOpy00/0Ir8ZjOOQtQ4Iv.sYrsFlBvtmfjIyjDr5XeAE1l64vZPna',NULL,1,NULL,'2014-05-15 04:55:17','2014-05-15 05:43:11','$2y$10$T1sFQCRvSJNq5WFMyjdvcuEmk9fL0I6IwH6RV0KgHdbex2HmK4awy',NULL,NULL,NULL,'2014-05-15 04:55:01','2014-05-15 05:43:11','Mike'),(6,'bill@mailinator.com','$2y$10$C2OU6LT496ehV85oJCiSoOgxuPQhI10oMQvwpJ1r7nP/3Rq0r4YIK',NULL,1,NULL,'2014-05-15 05:06:00','2014-05-15 05:56:37','$2y$10$eWmZGtZHS8n65NHxtsZHeOlb.1jBg9kaVUz3T19bpOhFMD9xw393S',NULL,NULL,NULL,'2014-05-15 05:04:54','2014-05-15 05:56:37','Bill'),(7,'sriramancse@gmail.com','$2y$10$of.VBkPvMg3xEzxJkFYnme/FbwK0co.4nx6UYQ6SdU5sEeettQShy',NULL,1,NULL,'2014-05-15 05:32:58','2014-05-15 07:26:35','$2y$10$FyiLM7zHJpPJOrnnJGzXYOcAxIKCpIDzQ0HeI0TFzl.pWDGnUZEf6',NULL,NULL,NULL,'2014-05-15 05:31:13','2014-05-15 07:26:35','sriraman'),(8,'markmitch@mailinator.com','$2y$10$L4DyGT2kZ1.B33fFBQCumOrGRXKsrFmvyamERVp4Eoq/5kHZDMAYu',NULL,0,'6H1dh6XjETiMDSLaZNbXqazUYdXVwANiAtCU2JajhD',NULL,NULL,NULL,NULL,NULL,NULL,'2014-05-15 05:49:28','2014-05-15 05:49:28',''),(9,'payxoo@gmail.com','$2y$10$iwVPMeGhlg/nIazwMDbppuPvFsGjOUoOzdpwC07fkbk1wgJVpV/h.',NULL,1,NULL,'2014-05-16 03:22:47','2014-05-16 03:22:56','$2y$10$IGSA3aRKKAkmfyY4HtxvnO5pdX0GCi1zpZPkuKT.li0vhSQHsE/lq',NULL,NULL,NULL,'2014-05-16 03:22:16','2014-05-16 03:22:56','payxoo');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_groups`
--

DROP TABLE IF EXISTS `users_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_groups` (
  `user_id` int(10) unsigned NOT NULL,
  `group_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_groups`
--

LOCK TABLES `users_groups` WRITE;
/*!40000 ALTER TABLE `users_groups` DISABLE KEYS */;
INSERT INTO `users_groups` VALUES (1,2),(2,1),(3,1),(4,1),(5,1),(6,1),(7,1),(8,1),(9,1);
/*!40000 ALTER TABLE `users_groups` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-05-16 15:15:59
