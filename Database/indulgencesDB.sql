-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: vacations_db
-- ------------------------------------------------------
-- Server version	8.0.36

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `app_users`
--

DROP TABLE IF EXISTS `app_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_users` (
  `userId` bigint NOT NULL AUTO_INCREMENT,
  `firstname` varchar(255) DEFAULT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `role_type` bigint DEFAULT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`userId`),
  KEY `role_type` (`role_type`),
  CONSTRAINT `app_users_ibfk_1` FOREIGN KEY (`role_type`) REFERENCES `roles` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_users`
--

LOCK TABLES `app_users` WRITE;
/*!40000 ALTER TABLE `app_users` DISABLE KEYS */;
INSERT INTO `app_users` VALUES (30,'henry','ford','fordmotors@gmail.com','96cc4662480ec2cc688d7154158098caeccea440d95fce6b6a068c3bafbf28f4040bcdd33f2585b04f78f7ff58d07f4c69ce3b6f697cb82859446c42bac9a671',2,NULL),(31,'Testy','tiesto','testosterone@hotmail.com','9c2147e8a35d27725496af1223053e985dd368bcbb83ef4e433aa264de44e8c8c1e3159dde58ab318dce5a7cb84abbdbac1b50b6152fb26d23f2dfeebf268946',2,NULL),(34,'Admin','Primarch','to@gmail.com','pbkdf2_sha256$870000$X7z3MNMwwr0gxUV1qxCk5d$L1GPQ7aBHqbt+A55SIve71s0Vj60XAkyKoCrV/lSvl4=',1,NULL),(36,'Admin2','Master','to3@gmail.com','c918ecfd5274d3b4048fd70a79827028ff9a580b1f710b19a9d9ca7d1f74522bf0747af081d26fdb4fbed6a248ef59157c5432e2032a4e8dea7cd1ff913539fc',1,NULL);
/*!40000 ALTER TABLE `app_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `countires`
--

DROP TABLE IF EXISTS `countires`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `countires` (
  `country_Id` int NOT NULL AUTO_INCREMENT,
  `country_name` varchar(45) NOT NULL,
  PRIMARY KEY (`country_Id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `countires`
--

LOCK TABLES `countires` WRITE;
/*!40000 ALTER TABLE `countires` DISABLE KEYS */;
INSERT INTO `countires` VALUES (1,'USA'),(2,'Monaco'),(3,'Croatia'),(4,'Greece'),(5,'Spain'),(6,'Maldives'),(7,'Brazil'),(8,'Thailand'),(9,'Bahamas'),(10,'Seychelle'),(11,'Australia'),(12,'Israel');
/*!40000 ALTER TABLE `countires` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_app_users_userId` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_app_users_userId` FOREIGN KEY (`user_id`) REFERENCES `app_users` (`userId`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2024-10-26 10:35:47.890837'),(2,'api','0001_initial','2024-10-26 10:35:47.900366'),(3,'admin','0001_initial','2024-10-26 10:35:48.262136'),(4,'admin','0002_logentry_remove_auto_add','2024-10-26 10:35:48.279160'),(5,'admin','0003_logentry_add_action_flag_choices','2024-10-26 10:35:48.301288'),(6,'contenttypes','0002_remove_content_type_name','2024-10-26 10:35:48.562891'),(7,'auth','0001_initial','2024-10-26 10:35:49.132894'),(8,'auth','0002_alter_permission_name_max_length','2024-10-26 10:35:49.267566'),(9,'auth','0003_alter_user_email_max_length','2024-10-26 10:35:49.279680'),(10,'auth','0004_alter_user_username_opts','2024-10-26 10:35:49.292672'),(11,'auth','0005_alter_user_last_login_null','2024-10-26 10:35:49.303216'),(12,'auth','0006_require_contenttypes_0002','2024-10-26 10:35:49.309197'),(13,'auth','0007_alter_validators_add_error_messages','2024-10-26 10:35:49.319396'),(14,'auth','0008_alter_user_username_max_length','2024-10-26 10:35:49.330019'),(15,'auth','0009_alter_user_last_name_max_length','2024-10-26 10:35:49.343069'),(16,'auth','0010_alter_group_name_max_length','2024-10-26 10:35:49.371226'),(17,'auth','0011_update_proxy_permissions','2024-10-26 10:35:49.383786'),(18,'auth','0012_alter_user_first_name_max_length','2024-10-26 10:35:49.396751'),(19,'auth','0013_alter_user_options','2024-10-26 10:35:49.406691'),(20,'api','0002_refreshtokenmodel','2024-10-26 12:16:23.112693');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `likes`
--

DROP TABLE IF EXISTS `likes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `likes` (
  `userId` bigint NOT NULL,
  `vacation_id` int NOT NULL,
  KEY `fk_vacataion_Id` (`vacation_id`),
  KEY `fk_userId` (`userId`),
  CONSTRAINT `fk_userId` FOREIGN KEY (`userId`) REFERENCES `app_users` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `likes`
--

LOCK TABLES `likes` WRITE;
/*!40000 ALTER TABLE `likes` DISABLE KEYS */;
INSERT INTO `likes` VALUES (30,39),(30,36),(30,32),(31,34),(31,31),(31,35),(30,33),(30,41),(31,41),(36,40),(36,37),(36,38);
/*!40000 ALTER TABLE `likes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `price` int DEFAULT NULL,
  `stock` int DEFAULT NULL,
  `image_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'tshirt',29,45,'tshirt.jpg'),(4,'hat',19,1776,'hat.jpg'),(5,'Cup',15,47,'e328cf7a-0276-48ec-af0d-fdda600e000f.jpg'),(9,'asd',11,22,'40dca5c9-c38d-4809-9427-041b7c5bcede.png');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `refresh_tokens`
--

DROP TABLE IF EXISTS `refresh_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `refresh_tokens` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `token` varchar(1024) NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `refresh_tokens_user_id_b02a6331_fk_app_users_userId` (`user_id`),
  CONSTRAINT `refresh_tokens_user_id_b02a6331_fk_app_users_userId` FOREIGN KEY (`user_id`) REFERENCES `app_users` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `refresh_tokens`
--

LOCK TABLES `refresh_tokens` WRITE;
/*!40000 ALTER TABLE `refresh_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `refresh_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `Id` bigint NOT NULL AUTO_INCREMENT,
  `role_type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'Admin'),(2,'User');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vacations`
--

DROP TABLE IF EXISTS `vacations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vacations` (
  `vacation_id` int NOT NULL AUTO_INCREMENT,
  `country_id` int NOT NULL,
  `vacation_details` varchar(1000) NOT NULL,
  `vacation_date_start` varchar(45) NOT NULL,
  `vacation_date_end` varchar(45) NOT NULL,
  `vacation_price` int NOT NULL,
  `vacation_picture_file` varchar(45) NOT NULL,
  PRIMARY KEY (`vacation_id`),
  KEY `country_Id_idx` (`country_id`),
  CONSTRAINT `country_Id` FOREIGN KEY (`country_id`) REFERENCES `countires` (`country_Id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=449 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vacations`
--

LOCK TABLES `vacations` WRITE;
/*!40000 ALTER TABLE `vacations` DISABLE KEYS */;
INSERT INTO `vacations` VALUES (30,1,'Discover Santa Monica\'s coastal gem, where immaculate golden sands merge with azure surf. Relish spectacular sunsets, savor exquisite waterfront cuisine, and enjoy dynamic pier entertainment in a sophisticated, seaside enclave.','2024-08-19','2024-08-22',489,'CaliforniaBeach.jpg'),(31,2,'Experience luxury on Monaco\'s glamorous beaches. Relax on pristine sands, indulge in upscale amenities, and enjoy stunning Mediterranean views. Explore the vibrant coastal city and its exclusive waterfront attractions.','2024-08-26','2024-08-28',509,'MonacoBeach.jpg'),(32,3,'Unwind on Croatia\'s breathtaking beaches. Discover crystal-clear waters, charming coastal towns, and scenic coves. Enjoy vibrant nightlife, local cuisine, and picturesque views along the stunning Adriatic coast.','2024-08-25','2024-08-29',349,'CroatiaBeach.jpg'),(33,4,'Immerse yourself in Greece’s idyllic beaches. Relax on sun-drenched sands, swim in azure waters, and explore charming islands. Savor Greek cuisine and experience rich history amid stunning coastal landscapes.','2024-09-01','2024-09-15',380,'GreeceBeach.jpg'),(34,5,'Escape to Costa del Sol’s sun-kissed beaches. Enjoy golden sands, warm Mediterranean waters, and vibrant nightlife. Discover charming towns, savor local cuisine, and experience endless sunshine along Spain’s stunning coast.','2024-10-20','2024-10-30',388,'SpainBeach.jpg'),(35,6,'Experience paradise in the Maldives. Relax on pristine white-sand beaches, swim in turquoise lagoons, and enjoy luxurious overwater bungalows. Discover vibrant marine life and indulge in ultimate tranquility in this tropical haven.','2024-11-03','2024-11-17',7527,'MaldivesBeach.jpg'),(36,7,'Discover Brazil’s vibrant beach scene. Relax on golden sands, dance to samba rhythms, and savor fresh seafood. Explore stunning coastlines, from Rio’s iconic beaches to the lush beauty of the Amazon’s shores.','2024-11-19','2024-12-17',1200,'BrazilBeach.jpg'),(37,8,'Escape to Thailand’s exotic beaches. Bask on powdery white sands, swim in crystal-clear waters, and explore lush islands. Enjoy vibrant nightlife, delectable Thai cuisine, and breathtaking sunsets in tropical paradise.','2024-01-16','2025-01-19',179,'ThailandBeach.jpg'),(38,9,'Explore the Bahamas’ stunning beaches. Lounge on powdery white sands, swim in turquoise waters, and explore vibrant coral reefs. Enjoy world-class diving, delectable seafood, and tranquil island vibes in paradise.','2024-02-17','2025-02-19',388,'BahamasBeach.jpg'),(39,10,'Unwind in the Seychelles, where pristine white sands and crystal-clear waters meet lush tropical scenery. Experience breathtaking sunsets, luxurious resorts, and serene, unspoiled beaches for a truly idyllic getaway.','2024-03-20','2024-03-24',241,'SeychelleBeach.jpg'),(40,11,'Ride the waves at Sydney’s top surfing beaches, like Bondi and Manly. Enjoy world-class breaks, vibrant coastal scenes, and stunning ocean views. Experience thrilling surf, golden sands, and a lively beach culture.','2025-04-21','2024-04-25',298,'AustraliaBeach.jpg'),(41,12,'Relax on Tel Aviv\'s exquisite beaches, where golden sands meet azure Mediterranean waters. Revel in the vibrant atmosphere, stroll lively promenades, savor delectable local cuisine, and immerse yourself in the city\'s coastal allure.','2025-05-25','2025-06-01',532,'IsraelBeach.jpg');
/*!40000 ALTER TABLE `vacations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vacations.users`
--

DROP TABLE IF EXISTS `vacations.users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vacations.users` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `last_login` datetime(6) DEFAULT NULL,
  `firstname` varchar(20) NOT NULL,
  `lastname` varchar(20) NOT NULL,
  `email` varchar(30) NOT NULL,
  `password` varchar(128) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vacations.users`
--

LOCK TABLES `vacations.users` WRITE;
/*!40000 ALTER TABLE `vacations.users` DISABLE KEYS */;
/*!40000 ALTER TABLE `vacations.users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-11-05 11:44:21
