-- MySQL dump 10.13  Distrib 8.0.21, for Win64 (x86_64)
--
-- Host: localhost    Database: top_motors
-- ------------------------------------------------------
-- Server version	8.0.21

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
-- Table structure for table `accounts`
--

DROP TABLE IF EXISTS `accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned DEFAULT NULL,
  `total` decimal(11,2) DEFAULT '0.00' COMMENT 'Счёт',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `user_id_UNIQUE` (`user_id`),
  CONSTRAINT `account_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Счета пользователей интернет магазина';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts`
--

LOCK TABLES `accounts` WRITE;
/*!40000 ALTER TABLE `accounts` DISABLE KEYS */;
INSERT INTO `accounts` VALUES (1,1,425.00,'2020-10-01 22:15:35','2020-10-01 22:32:46'),(2,4,5000.00,'2020-10-01 22:15:35','2020-10-01 22:15:35'),(3,3,1000.00,'2020-10-01 22:15:35','2020-10-01 22:15:35'),(4,12,10500.00,'2020-10-01 22:15:35','2020-10-01 22:15:35'),(5,10,9075.00,'2020-10-01 22:15:35','2020-10-01 22:32:46'),(6,2,3500.00,'2020-10-01 22:15:35','2020-10-01 22:15:35'),(7,5,34000.00,'2020-10-01 22:15:35','2020-10-01 22:15:35');
/*!40000 ALTER TABLE `accounts` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `users_accounts_log` AFTER INSERT ON `accounts` FOR EACH ROW BEGIN
	INSERT INTO accounts_logs (user_id, total_new) VALUES (NEW.user_id, NEW.total);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `users_accounts_update_log` AFTER UPDATE ON `accounts` FOR EACH ROW BEGIN
	INSERT INTO accounts_logs (user_id, total_old, total_new) VALUES (NEW.user_id, OLD.total, NEW.total);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `accounts_logs`
--

DROP TABLE IF EXISTS `accounts_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts_logs` (
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `user_id` int DEFAULT NULL COMMENT 'id пользователя',
  `total_old` decimal(11,2) DEFAULT '0.00' COMMENT 'баланс пользователя до транзакции',
  `total_new` decimal(11,2) DEFAULT NULL COMMENT 'баланс пользователя после транзакции'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_logs`
--

LOCK TABLES `accounts_logs` WRITE;
/*!40000 ALTER TABLE `accounts_logs` DISABLE KEYS */;
INSERT INTO `accounts_logs` VALUES ('2020-10-01 22:15:35',1,0.00,0.00),('2020-10-01 22:15:35',4,0.00,5000.00),('2020-10-01 22:15:35',3,0.00,1000.00),('2020-10-01 22:15:35',12,0.00,10500.00),('2020-10-01 22:15:35',10,0.00,9500.00),('2020-10-01 22:15:35',2,0.00,3500.00),('2020-10-01 22:15:35',5,0.00,34000.00),('2020-10-01 22:16:24',10,9500.00,9475.00),('2020-10-01 22:16:24',1,0.00,25.00),('2020-10-01 22:22:08',10,9475.00,9425.00),('2020-10-01 22:22:08',1,25.00,75.00),('2020-10-01 22:22:29',10,9425.00,9375.00),('2020-10-01 22:22:29',1,75.00,125.00),('2020-10-01 22:26:10',10,9375.00,9350.00),('2020-10-01 22:26:10',1,125.00,150.00),('2020-10-01 22:26:35',10,9350.00,9325.00),('2020-10-01 22:26:35',1,150.00,175.00),('2020-10-01 22:27:22',10,9325.00,9300.00),('2020-10-01 22:27:22',1,175.00,200.00),('2020-10-01 22:29:13',10,9300.00,9275.00),('2020-10-01 22:29:13',1,200.00,225.00),('2020-10-01 22:30:31',10,9275.00,9225.00),('2020-10-01 22:30:31',1,225.00,275.00),('2020-10-01 22:30:43',10,9225.00,9175.00),('2020-10-01 22:30:43',1,275.00,325.00),('2020-10-01 22:32:29',10,9175.00,9125.00),('2020-10-01 22:32:29',1,325.00,375.00),('2020-10-01 22:32:46',10,9125.00,9075.00),('2020-10-01 22:32:46',1,375.00,425.00);
/*!40000 ALTER TABLE `accounts_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalogs`
--

DROP TABLE IF EXISTS `catalogs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalogs` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL COMMENT 'Название раздела',
  `catalog_name` varchar(255) DEFAULT NULL COMMENT 'Название каталога',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `unique_name` (`catalog_name`(10))
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalogs`
--

LOCK TABLES `catalogs` WRITE;
/*!40000 ALTER TABLE `catalogs` DISABLE KEYS */;
INSERT INTO `catalogs` VALUES (1,'Запчасти','Оригинальные'),(2,'Запчасти','Catcar Aftermarket'),(3,'Запчасти','Оригинал США'),(4,'Запчасти','Неоригинал США'),(5,'Запчасти','Мотокаталоги'),(6,'Продукты','Предохранители'),(7,'Продукты','Химия'),(8,'Продукты','Лампы'),(9,'Продукты','Запчасти ТО'),(10,'Продукты','Аксессуары'),(11,'Продукты','Шины и диски'),(12,'Продукты','Масла'),(13,'Продукты','Автостекла'),(14,'Продукты','Аккумуляторы');
/*!40000 ALTER TABLE `catalogs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feedback`
--

DROP TABLE IF EXISTS `feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `feedback` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `body` text,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `feedback_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feedback`
--

LOCK TABLES `feedback` WRITE;
/*!40000 ALTER TABLE `feedback` DISABLE KEYS */;
INSERT INTO `feedback` VALUES (1,12,'Хочу вразить огромную благодарность всему коллективу магазина в городе Санкт-Петербурге!','2020-10-01 22:15:35',NULL),(2,2,'Подскажите, когда будет расширение асортимента???','2020-10-01 22:15:35',NULL);
/*!40000 ALTER TABLE `feedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `news`
--

DROP TABLE IF EXISTS `news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `news` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `shop_id` int unsigned NOT NULL,
  `body` text,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `shop_id` (`shop_id`),
  CONSTRAINT `shop_news` FOREIGN KEY (`shop_id`) REFERENCES `shops` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `news`
--

LOCK TABLES `news` WRITE;
/*!40000 ALTER TABLE `news` DISABLE KEYS */;
INSERT INTO `news` VALUES (1,1,'Уважаемые покупатели, мы рады сообщить вам о поступлении товаров в наш магазин!','2020-10-01 22:15:35',NULL),(2,2,'Уважаемые покупатели, ждём вас в нашем новом магазине!','2020-10-01 22:15:35',NULL);
/*!40000 ALTER TABLE `news` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `product_id` bigint unsigned DEFAULT NULL,
  `total` int unsigned DEFAULT '1' COMMENT 'Количество заказанных товарных позиций',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `index_of_user_id` (`user_id`),
  KEY `order_product_id` (`product_id`),
  CONSTRAINT `order_product_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  CONSTRAINT `order_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,3,2,2,'2020-10-01 22:15:35','2020-10-01 22:15:35'),(2,10,6,1,'2020-10-01 22:15:35','2020-10-01 22:15:35'),(3,5,4,2,'2020-10-01 22:15:35','2020-10-01 22:15:35');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `users_orders_log` AFTER INSERT ON `orders` FOR EACH ROW BEGIN
	INSERT INTO users_logs (tbl_name, event_id, user_id) VALUES ('orders', NEW.id, NEW.user_id);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `prod`
--

DROP TABLE IF EXISTS `prod`;
/*!50001 DROP VIEW IF EXISTS `prod`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `prod` AS SELECT 
 1 AS `name`,
 1 AS `cat_name`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `vendor_name` varchar(255) DEFAULT NULL COMMENT 'Производитель',
  `vendor_code` varchar(255) DEFAULT NULL COMMENT 'Артикул',
  `name` varchar(255) DEFAULT NULL COMMENT 'Название',
  `description` text COMMENT 'Описание',
  `price` decimal(11,2) DEFAULT NULL COMMENT 'Цена',
  `catalog_id` int unsigned DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `delivery_time` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `index_of_vendor_name` (`vendor_name`),
  KEY `index_of_vendor_code` (`vendor_code`),
  KEY `index_of_catalog_id` (`catalog_id`),
  CONSTRAINT `product_catalog_id` FOREIGN KEY (`catalog_id`) REFERENCES `catalogs` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'Tesla','FJ11 30A','Блок-предохранитель','Предохранитель CARTRIDGE (цвет розовый) 30А',50.00,1,'2020-10-01 22:15:35','2020-10-01 22:15:35',2),(2,'Tesla','FJ11 32A','Блок-предохранитель','Предохранитель CARTRIDGE (цвет розовый) 20А',150.00,1,'2020-10-01 22:15:35','2020-10-01 22:15:35',2),(3,'Tesla','FJ11 34A','Блок-предохранитель','Предохранитель CARTRIDGE (цвет розовый) 15А',30.00,1,'2020-10-01 22:15:35','2020-10-01 22:15:35',1),(4,'Bosch','1987529054','Блок-предохранитель','Плавкая вставка',200.00,1,'2020-10-01 22:15:35','2020-10-01 22:15:35',2),(5,'Bosch','1987521054','Блок-предохранитель','Плавкая вставка',160.00,1,'2020-10-01 22:15:35','2020-10-01 22:15:35',2),(6,'Bosch','1987527054','Блок-предохранитель','Плавкая вставка',25.00,1,'2020-10-01 22:15:35','2020-10-01 22:15:35',2),(7,'Liqui Moly','01164','Летняя жидкость для омывателя стекла','Летняя жидкость для омывателя стекла с ароматом Лайм-Мята',350.00,7,'2020-10-01 22:15:35','2020-10-01 22:15:35',2),(8,'Liqui Moly','01166','Летняя жидкость для омывателя стекла','Летняя жидкость для омывателя стекла с ароматом Лайм-Мята',350.00,7,'2020-10-01 22:15:35','2020-10-01 22:15:35',2),(9,'Liqui Moly','01168','Летняя жидкость для омывателя стекла','Летняя жидкость для омывателя стекла с ароматом Лайм-Мята',390.00,7,'2020-10-01 22:15:35','2020-10-01 22:15:35',2),(10,'Philips','12342','Лампа H4','Лампа галоген\" X-tremeVision H4\" 12В 60/55Вт, 1шт',590.00,8,'2020-10-01 22:15:35','2020-10-01 22:15:35',3),(11,'Philips','12342 XVB1','Лампа H4','Лампа галоген\" X-tremeVision H4\" 12В 60/55Вт, 1шт',790.00,8,'2020-10-01 22:15:35','2020-10-01 22:15:35',4),(12,'Hella','8GJ 002 525-131','Лампа H4','Лампа галоген\" H4\" 12В 60/55Вт',370.00,8,'2020-10-01 22:15:35','2020-10-01 22:15:35',2),(13,'YOKOHAMA','AC01','Шина','Шина летняя 195/55 R16',4360.00,11,'2020-10-01 22:15:35','2020-10-01 22:15:35',4),(14,'BMW','34356761448','Датчик','Датчик износа тормозных колодок, задний',3550.00,1,'2020-10-01 22:15:35','2020-10-01 22:15:35',2),(15,'VOLVO','30769113','Диск','Диск тормозной, задний',9890.00,1,'2020-10-01 22:15:35','2020-10-01 22:15:35',1),(16,'SSANGYONG','4840121101','Диск','Диск тормозной, задний',5700.00,1,'2020-10-01 22:15:35','2020-10-01 22:15:35',2),(17,'FORD','4668068','Диск','Диск тормозной, передний',15790.00,3,'2020-10-01 22:15:35','2020-10-01 22:15:35',12),(18,'BMW','07119963355','Прокладка','Прокладка сливной пробки поддона двигателя',50.00,5,'2020-10-01 22:15:35','2020-10-01 22:15:35',27),(19,'RENAULT','130C1-3954R','Ремкомплект ГРМ','Ремкомплект ГРМ',7450.00,2,'2020-10-01 22:15:35','2020-10-01 22:15:35',2),(20,'FORD','1770305','Свеча зажигания','Свеча зажигания',150.00,9,'2020-10-01 22:15:35','2020-10-01 22:15:35',0),(21,'SUZUKI','1378075F00','Фильтр','Фильтр воздушный',290.00,9,'2020-10-01 22:15:35','2020-10-01 22:15:35',0),(22,'VAG','03C115562	','Фильтр','Фильтр масляный',670.00,9,'2020-10-01 22:15:35','2020-10-01 22:15:35',5),(23,'VAG','1S0820367','Фильтр','Фильтр салона',1340.00,9,'2020-10-01 22:15:35','2020-10-01 22:15:35',7);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shopping_cart`
--

DROP TABLE IF EXISTS `shopping_cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shopping_cart` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `product_id` bigint unsigned DEFAULT NULL,
  `total` int unsigned DEFAULT '1' COMMENT 'Количество заказанных товарных позиций',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `order_status` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `index_of_user_id` (`user_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `product_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  CONSTRAINT `user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shopping_cart`
--

LOCK TABLES `shopping_cart` WRITE;
/*!40000 ALTER TABLE `shopping_cart` DISABLE KEYS */;
INSERT INTO `shopping_cart` VALUES (1,2,23,2,'2020-10-01 22:26:04','2020-10-01 22:26:04',NULL),(3,5,15,6,'2020-10-01 22:26:04','2020-10-01 22:26:04',NULL),(4,5,4,2,'2020-10-01 22:26:04','2020-10-01 22:26:04',NULL),(5,3,1,1,'2020-10-01 22:26:04','2020-10-01 22:26:04',NULL),(6,10,6,1,'2020-10-01 22:29:07','2020-10-01 22:32:46','ordered'),(7,10,6,1,'2020-10-01 22:30:24','2020-10-01 22:32:46','ordered');
/*!40000 ALTER TABLE `shopping_cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shops`
--

DROP TABLE IF EXISTS `shops`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shops` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `address` varchar(255) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `weekdays_start_time` time DEFAULT NULL,
  `weekdays_end_time` time DEFAULT NULL,
  `weekend_start_time` time DEFAULT NULL,
  `weekend_end_time` time DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shops`
--

LOCK TABLES `shops` WRITE;
/*!40000 ALTER TABLE `shops` DISABLE KEYS */;
INSERT INTO `shops` VALUES (1,'Санкт-Петербург, Московский пр-кт, д. 78, литер К','info@top-motors.ru','+7(812)7777555','10:00:00','20:00:00','10:00:00','18:00:00'),(2,'Калининград, Краснокаменная ул., д. 50, литер Г','info@top-motors.ru','+7(4012) 52-77-55','10:00:00','18:00:00','10:00:00','18:00:00');
/*!40000 ALTER TABLE `shops` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(150) DEFAULT NULL,
  `pass` varchar(100) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `surname` varchar(50) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `hometown` varchar(100) DEFAULT NULL,
  `discount` int DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `default_shop` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `email` (`email`),
  KEY `phone` (`phone`),
  KEY `name` (`name`,`surname`),
  KEY `def_shop_id_idx` (`default_shop`),
  CONSTRAINT `def_shop_id` FOREIGN KEY (`default_shop`) REFERENCES `shops` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'info@top-motors.ru','36766567f83079af02f517913d98a34e8a5514111','Топ','Моторс','812-777-7555','Санкт-Петербург',NULL,'2020-10-01 22:15:35',NULL),(2,'ifor@mail.ru','3866567f83079af02f517913d98a34e8a5514111','Иван','Иванов','921-333-9456','Москва',5,'2020-10-01 22:15:35',1),(3,'hhgidsh@ya.ru','4cbd30f625fd3440804baf6f509246e8ff81d46b','Степан','Киров','980-463-9490','Минск',15,'2020-10-01 22:15:35',2),(4,'iyyfgg@gmail.com','340287d956987900a051e920136b2c1c17351321','Олег','Носовичков','214-166-4371','Саратов',5,'2020-10-01 22:15:35',1),(5,'fuka@yandex.ru','d4a54226f86124d38f463d60c3658a32be191e0e','Кирилл','Петров','806-521-0191','Кольск',0,'2020-10-01 22:15:35',1),(6,'yygg334@bing.com','4cbd30f625fd3440804baf6f509246e8ff81d46b','Ольга','Мончих','248-935-6708','Омск',3,'2020-10-01 22:15:35',2),(7,'fedof@mail.ru','gh07f0f3ba714a20ee76785f5235877e6fa4a022','Сергей','Одинчев','231-247-6133','Санкт-Петербург',0,'2020-10-01 22:15:35',1),(8,'oleg1984@gmail.com','jk07f0f3ba714a20ee76785f52358ghe6fa4a022','Михаил','Поторов','113-281-2314','Новгород',10,'2020-10-01 22:15:35',1),(9,'1366fdajhd@ya.ru','r607f0f3ba714a20ee76785f663585be6fa4a022','Константин','Клюквин','345-166-1646','Саратов',0,'2020-10-01 22:15:35',1),(10,'ggrt@pisem.net','b607f0f3ba714a20ee76785f523bnbbe6fa4a022','Петр','Петриченко','737-744-4639','Тула',3,'2020-10-01 22:15:35',2),(11,'mort@oglsy.ru','e28882d420f3f02df4ef85cf57a7900520dd19bf','Денис','Пузыревский','353-262-4836','Харьков',5,'2020-10-01 22:15:35',2),(12,'gggf@yty.de','ad20ef3e300cc51ec105d937689feecfca82b66c','Коля','Кулаков','928-683-1036','Пушкин',0,'2020-10-01 22:15:35',1),(13,'mosya@n.com','5ea7a3f00a784345a7c7df7dbf303921565c4bf2','Евгения','Саранская','994-706-6870','Ахтуба',0,'2020-10-01 22:15:35',2);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_logs`
--

DROP TABLE IF EXISTS `users_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_logs` (
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `tbl_name` varchar(45) DEFAULT NULL COMMENT 'Название таблицы',
  `event_id` bigint NOT NULL COMMENT 'id события',
  `user_id` int DEFAULT NULL COMMENT 'id пользователя'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_logs`
--

LOCK TABLES `users_logs` WRITE;
/*!40000 ALTER TABLE `users_logs` DISABLE KEYS */;
INSERT INTO `users_logs` VALUES ('2020-10-01 22:15:35','shopping_cart',1,2),('2020-10-01 22:15:35','shopping_cart',2,10),('2020-10-01 22:15:35','shopping_cart',3,5),('2020-10-01 22:15:35','shopping_cart',4,5),('2020-10-01 22:15:35','shopping_cart',5,3),('2020-10-01 22:15:35','orders',1,3),('2020-10-01 22:15:35','orders',2,10),('2020-10-01 22:15:35','orders',3,5),('2020-10-01 22:21:45','shopping_cart',6,2),('2020-10-01 22:21:45','shopping_cart',7,10);
/*!40000 ALTER TABLE `users_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `prod`
--

/*!50001 DROP VIEW IF EXISTS `prod`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `prod` AS select `p`.`name` AS `name`,`c`.`catalog_name` AS `cat_name` from (`products` `p` join `catalogs` `c` on((`p`.`catalog_id` = `c`.`id`))) */;
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

-- Dump completed on 2020-10-04 10:30:27
