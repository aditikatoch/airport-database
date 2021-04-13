-- MySQL dump 10.13  Distrib 8.0.21, for Win64 (x86_64)
--
-- Host: localhost    Database: airport
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
-- Table structure for table `airline`
--

DROP TABLE IF EXISTS `airline`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `airline` (
  `airline_id` varchar(3) NOT NULL,
  `airline_name` varchar(50) DEFAULT NULL,
  `airline_3_digit_code` int DEFAULT NULL,
  PRIMARY KEY (`airline_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `airline`
--

LOCK TABLES `airline` WRITE;
/*!40000 ALTER TABLE `airline` DISABLE KEYS */;
INSERT INTO `airline` VALUES ('AA','American Airlines',1),('AF','Air France',57),('BA','British Airways',125),('EK','Emirates',176),('ET','Ethopian Airlines',71),('EY','Ethiad Airways',607),('LH','Lufthansa',220),('LX','SWISS',724),('QR','Qatar Airways',157),('VS','Virgin Atlantic',932);
/*!40000 ALTER TABLE `airline` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `airport-details`
--

DROP TABLE IF EXISTS `airport-details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `airport-details` (
  `airport_code` varchar(3) NOT NULL,
  `airport_name` varchar(100) DEFAULT NULL,
  `city` varchar(100) NOT NULL,
  `country` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`airport_code`),
  UNIQUE KEY `city_UNIQUE` (`city`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `airport-details`
--

LOCK TABLES `airport-details` WRITE;
/*!40000 ALTER TABLE `airport-details` DISABLE KEYS */;
INSERT INTO `airport-details` VALUES ('ADD','Addis Ababa Bole International Airport','Addis Ababa','Ethiopia'),('AUH','Abu Dhabi International Airport','Abu Dhabi','UAE'),('CDG','Charles de Gaulle Airport','Paris','France'),('DEL','Indira Gandhi International Airport','Delhi','India'),('DOH','Hamad International Airport ','Doha','Qatar'),('DXB','Dubai International Airport','Dubai','UAE'),('FRA','Frankfurt Airport','Frankfurt','Germany'),('JFK','John F. Kennedy International Airport','New York City','USA'),('LAX','Los Angeles International Airport','Los Angeles','USA'),('LHR','Heathrow Airport','London','UK'),('SYD','Sydney Airport','Sydney','Australia'),('YYZ','Toronto Pearson International Airport','Toronto','Canada'),('ZRH','Zurich Airport','Zurich','Switzerland');
/*!40000 ALTER TABLE `airport-details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `arrivals`
--

DROP TABLE IF EXISTS `arrivals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `arrivals` (
  `terminal` varchar(2) DEFAULT NULL,
  `flight_number` varchar(20) NOT NULL,
  `arriving_from` varchar(100) DEFAULT NULL,
  `arrival_date` date DEFAULT NULL,
  `arrival_time` time DEFAULT NULL,
  PRIMARY KEY (`flight_number`),
  KEY `arrival_from_idx` (`arriving_from`),
  CONSTRAINT `arriving_from` FOREIGN KEY (`arriving_from`) REFERENCES `airport-details` (`city`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `arrivals`
--

LOCK TABLES `arrivals` WRITE;
/*!40000 ALTER TABLE `arrivals` DISABLE KEYS */;
INSERT INTO `arrivals` VALUES ('A','AA6261','New York City','2021-03-15','01:00:00'),('C','AA6581','Frankfurt','2021-04-15','01:45:00'),('A','AA6693','Los Angeles','2021-04-15','01:50:00'),('C','AA8968','Los Angeles ','2021-04-15','12:40:00'),('B','AF288','Paris','2021-04-15','01:30:00'),('C','AF5968','Sydney','2021-04-15','06:25:00'),('C','AF8095','Sydney','2021-04-15','03:40:00'),('A','BA038','Toronto','2021-04-15','04:30:00'),('B','BA475','Abu Dhabi','2021-04-15','05:55:00'),('B','BA5229','London','2021-04-15','02:25:00'),('A','BA883','Delhi','2021-04-15','07:30:00'),('C','EK6035','Dubai','2021-04-15','02:40:00'),('B','EK859','Toronto','2021-04-15','06:45:00'),('A','ET6910','Addis Ababa','2021-04-15','03:15:00'),('B','EY800','Zurich','2021-04-15','03:50:00'),('A','EY937','Addis Ababa','2021-04-15','10:35:00'),('C','LH5458','New York City','2021-04-15','04:05:00'),('B','LH891','Frankfurt','2021-04-15','08:00:00'),('B','LX1333','Delhi','2021-04-15','04:45:00'),('C','LX927','Sydney','2021-04-15','09:20:00'),('C','QR268','Doha','2021-04-15','05:15:00'),('B','VS1292','London','2021-04-15','11:16:00'),('A','VS589','London','2021-04-15','06:00:00');
/*!40000 ALTER TABLE `arrivals` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `assign arrival terminal` BEFORE INSERT ON `arrivals` FOR EACH ROW BEGIN
DECLARE terminal varchar(2);
IF `terminal` IS NULL
	THEN SET terminal = 'A'OR 'B' OR 'C';
END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `departures`
--

DROP TABLE IF EXISTS `departures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `departures` (
  `departure-terminal` varchar(2) DEFAULT NULL,
  `flight-number` varchar(20) NOT NULL,
  `destination` varchar(20) DEFAULT NULL,
  `departure_date` date DEFAULT NULL,
  `departure_time` time DEFAULT NULL,
  PRIMARY KEY (`flight-number`),
  KEY `destination` (`destination`),
  CONSTRAINT `departures_ibfk_1` FOREIGN KEY (`destination`) REFERENCES `airport-details` (`airport_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departures`
--

LOCK TABLES `departures` WRITE;
/*!40000 ALTER TABLE `departures` DISABLE KEYS */;
INSERT INTO `departures` VALUES ('C','AA5581','DEL','2021-04-16','01:45:00'),('A','AA5693','DXB','2021-04-16','01:50:00'),('A','AA7261','ADD','2021-04-16','01:00:00'),('C','AA9968','LAX','2021-04-16','12:40:00'),('B','AF388','CDG','2021-04-16','01:30:00'),('C','AF6968','SYD','2021-04-16','06:25:00'),('C','AF7095','LHR','2021-04-16','03:40:00'),('A','BA138','ZRH','2021-04-16','04:30:00'),('B','BA275','AUH','2021-04-16','05:55:00'),('B','BA4229','FRA','2021-04-16','02:25:00'),('A','BA783','DEL','2021-04-16','07:30:00'),('C','EK7035','JFK','2021-04-16','02:40:00'),('B','EK759','YYZ','2021-04-16','06:45:00'),('A','ET8910','LAX','2021-04-16','03:15:00'),('B','EY600','SYD','2021-04-16','03:50:00'),('A','EY637','ADD','2021-04-16','10:35:00'),('C','LH4458','YYZ','2021-04-16','04:05:00'),('B','LH591','FRA','2021-04-16','08:00:00'),('B','LX2333','AUH','2021-04-16','04:45:00'),('C','LX727','JFK','2021-04-16','09:20:00'),('C','QR368','DOH','2021-04-16','05:15:00'),('B','VS2292','LHR','2021-04-16','11:16:00'),('A','VS489','LHR','2021-04-16','06:00:00');
/*!40000 ALTER TABLE `departures` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `assign depature terminal` BEFORE INSERT ON `departures` FOR EACH ROW BEGIN
DECLARE terminal varchar(1);
SET terminal = rand(A-C);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `employee_id` int NOT NULL,
  `First Name` varchar(20) DEFAULT NULL,
  `Last Name` varchar(20) DEFAULT NULL,
  `Job` varchar(30) DEFAULT NULL,
  `Shift` varchar(20) DEFAULT NULL,
  `Employee-airport-code` varchar(45) NOT NULL,
  `availability` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`employee_id`),
  KEY `employee_airport_idx` (`Employee-airport-code`),
  CONSTRAINT `employee_airport` FOREIGN KEY (`Employee-airport-code`) REFERENCES `airport-details` (`airport_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (123456329,'Lola','Wen','Ground Handling','NIGHT','DXB',NULL),(123456789,'Linda','Parks','Administrative Service','NIGHT','LHR',NULL),(125478129,'Carly','Shaw','Ground Handling','DAY','DXB',NULL),(125478909,'Patrick','Cole','Customer Service','DAY','FRA',NULL),(127987987,'Saddie','Glenn','Engineer','NIGHT','CDG',NULL),(134737482,'Maya','Hill','Engineer','DAY','CDG',NULL),(312743875,'Johnny','Larense','Customer Service','DAY','LHR',NULL),(324563497,'Francis','Stone','Ground Handling','DAY','DEL',NULL),(324567897,'Allison','Derek','Traffic monitor','DAY','DOH',NULL),(326437697,'Annie','Morus','Ground Handling','DAY','JFK',NULL),(333423455,'Jake','Singh','Customer Service','DAY','ADD',NULL),(333445555,'Jane','Truman','Administrative Service','DAY','LAX',NULL),(623643844,'Riley','Valris','Traffic monitor','NIGHT','ADD',NULL),(666882384,'Don','Cooper','Traffic monitor','NIGHT','LAX',NULL),(666884444,'Shelly','Hall','Traffic monitor','NIGHT','JFK',NULL),(987654321,'Simon','Green','Customer Service','NIGHT','DOH',NULL),(987654341,'Olivia','Wil','Engineer','DAY','SYD',NULL),(987982387,'Chris','Snow','Engineer','DAY','YYZ',NULL),(987987987,'Nichole','Pearson','Engineer','DAY','ZRH',NULL),(999887127,'James','Blake','Ground Handling','NIGHT','SYD',NULL);
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `flight`
--

DROP TABLE IF EXISTS `flight`;
/*!50001 DROP VIEW IF EXISTS `flight`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `flight` AS SELECT 
 1 AS `airlineID`,
 1 AS `number`,
 1 AS `location`,
 1 AS `date`,
 1 AS `expected time`,
 1 AS `time`,
 1 AS `remarks`,
 1 AS `departure-terminal`,
 1 AS `flight-number`,
 1 AS `destination`,
 1 AS `departure_date`,
 1 AS `departure_time`,
 1 AS `terminal`,
 1 AS `flight_number`,
 1 AS `arriving_from`,
 1 AS `arrival_date`,
 1 AS `arrival_time`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `shops`
--

DROP TABLE IF EXISTS `shops`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shops` (
  `shop_number` int NOT NULL AUTO_INCREMENT,
  `shop_name` varchar(100) DEFAULT NULL,
  `details` varchar(5000) DEFAULT NULL,
  `terminal_number` varchar(255) DEFAULT NULL,
  `location` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`shop_number`),
  KEY `shop-location` (`location`),
  CONSTRAINT `shop-location` FOREIGN KEY (`location`) REFERENCES `airport-details` (`city`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shops`
--

LOCK TABLES `shops` WRITE;
/*!40000 ALTER TABLE `shops` DISABLE KEYS */;
INSERT INTO `shops` VALUES (1,'Sim LOCAL','Sim Local is the one stop shop for all your cell/mobile telephone needs.','T2','Frankfurt'),(2,'Sim LOCAL','Sim Local is the one stop shop for all your cell/mobile telephone needs.','T5','London'),(3,'Boots','Health and beauty essentials, including sun cream, insect repellent and other travel products.','T2','Dubai'),(4,'Boots','Health and beauty essentials, including sun cream, insect repellent and other travel products.','T5','Abu Dhabi'),(5,'Excess Baggage Company','Excess Baggage Company offers a convenient baggage service including a safe and secure place to store your luggage at affordable rates.','T5','Sydney'),(6,'Excess Baggage Company','Excess Baggage Company offers a convenient baggage service including a safe and secure place to store your luggage at affordable rates.','T3','Los Angeles'),(7,'Excess Baggage Company','Excess Baggage Company offers a convenient baggage service including a safe and secure place to store your luggage at affordable rates.','T2','Zurich'),(8,'Travelex','Global foreign exchange specialist Travelex provides banknotes in up to 80 different currencies, Cash Passport pre-paid currency cards, travel insurance and phone cards.','T5','New York City'),(9,'WHSmith','or convenience on the move, including best-selling books, news and magazines, food and drink or even something to keep the kids amused, visit your WHSmith – it\'s a one-stop shop for all your journey essentials. ','T3','Addis Ababa'),(10,'WHSmith','or convenience on the move, including best-selling books, news and magazines, food and drink or even something to keep the kids amused, visit your WHSmith – it\'s a one-stop shop for all your journey essentials. ','T5','Doha'),(11,'World Duty Free','World Duty Free aims to offer the ultimate airport shopping experience. As the leading travel retailer it features over 17,000 products across its airport stores and aims to bring you the very latest products at great value prices.','T2','Paris');
/*!40000 ALTER TABLE `shops` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `time-table`
--

DROP TABLE IF EXISTS `time-table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `time-table` (
  `airlineID` varchar(3) DEFAULT NULL,
  `number` int DEFAULT NULL,
  `location` varchar(100) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `expected time` time DEFAULT NULL,
  `time` time DEFAULT NULL,
  `remarks` varchar(20) DEFAULT NULL,
  KEY `time-table_ibfk_1` (`airlineID`),
  KEY `time-table_ibfk_2` (`location`),
  CONSTRAINT `time-table_ibfk_1` FOREIGN KEY (`airlineID`) REFERENCES `airline` (`airline_id`),
  CONSTRAINT `time-table_ibfk_2` FOREIGN KEY (`location`) REFERENCES `airport-details` (`city`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `time-table`
--

LOCK TABLES `time-table` WRITE;
/*!40000 ALTER TABLE `time-table` DISABLE KEYS */;
INSERT INTO `time-table` VALUES ('EY',228,'Abu Dhabi','2021-04-15','07:55:00','07:23:00','Arrival'),('EK',224,'Dubai','2021-04-15','19:30:00','19:30:00','Arrival'),('LH',113,'Frankfurt','2021-04-15','11:45:00','11:45:00','Arrival'),('LX',331,'Zurich','2021-04-15','02:20:00','02:30:00','Arrival'),('VS',333,'London','2021-04-15','12:05:00','12:05:00','Arrival'),('QR',315,'Doha','2021-04-15','23:00:00','23:00:00','Arrival'),('LH',323,'Los Angeles','2021-04-15','09:55:00','10:55:00','Arrival'),('ET',406,'Addis Ababa','2021-04-15','20:20:00','20:20:00','Arrival'),('QR',402,'Sydney','2021-04-15','05:55:00','05:55:00','Arrival'),('BA',381,'New York City','2021-04-15','11:30:00','11:30:00','Arrival'),('EK',380,'Dubai','2021-04-16','23:00:00','23:00:00','Departure'),('LH',2642,'Sydney','2021-04-16','08:55:00','08:55:00','Departure'),('LX',436,'Zurich','2021-04-16','09:25:00','09:20:00','Departure'),('AA',763,'New York City','2021-04-16','09:10:00','09:10:00','Departure'),('BA',2315,'London','2021-04-16','09:30:00','09:30:00','Departure'),('QR',5549,'Paris','2021-04-16','19:00:00','18:00:00','Departure'),('VS',5547,'Delhi','2021-04-16','01:20:00','01:20:00','Departure'),('LX',402,'Toronto','2021-04-16','05:55:00','05:45:00','Departure'),('BA',381,'Dubai','2021-04-16','11:30:00','11:30:00','Departure'),('LH',402,'Sydney','2021-04-16','05:55:00','05:45:00','Departure'),('AF',381,'Paris','2021-04-16','11:30:00','11:50:00','Departure'),('EK',353,'Abu Dhabi','2021-04-16','19:05:00','19:05:00','Departure');
/*!40000 ALTER TABLE `time-table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'airport'
--
/*!50003 DROP FUNCTION IF EXISTS `time remarks` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `time remarks`(`expected time` time, `time` time, `remarks` varchar(20)) RETURNS varchar(30) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
DECLARE `time remarks` varchar(30);
IF `expected time` = `time` and `remarks` = 'Arrival'
		THEN set `time remarks` = 'ON TIME';
ELSEIF `expected time` > `time` and `remarks` = 'Arrival'
		THEN set `time remarks` = 'DELAYED';
ELSEIF `expected time` < `time` and `remarks` = 'Arrival'
		THEN set `time remarks` = 'EARLY';
ELSEIF `expected time` = `time` and `remarks` = 'Departure'
		THEN set `time remarks` = 'BOARDING';
ELSEIF `expected time` > `time` and `remarks` = 'Departure'
		THEN set `time remarks` = 'DELAYED';
ELSEIF `expected time` < `time` and `remarks` = 'Departure'
		THEN set `time remarks` = 'CHECK - IN';     
END IF;
	RETURN (`time remarks`);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `airline name` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `airline name`(idCode varchar(3))
BEGIN
SELECT * from airport.airline where airline_id = idCode;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `airport name` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `airport name`(letterCode varchar(3))
BEGIN
SELECT * FROM airport.`airport-details`
where airport_code = letterCode;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `flight`
--

/*!50001 DROP VIEW IF EXISTS `flight`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `flight` AS select `t`.`airlineID` AS `airlineID`,`t`.`number` AS `number`,`t`.`location` AS `location`,`t`.`date` AS `date`,`t`.`expected time` AS `expected time`,`t`.`time` AS `time`,`t`.`remarks` AS `remarks`,`d`.`departure-terminal` AS `departure-terminal`,`d`.`flight-number` AS `flight-number`,`d`.`destination` AS `destination`,`d`.`departure_date` AS `departure_date`,`d`.`departure_time` AS `departure_time`,`a`.`terminal` AS `terminal`,`a`.`flight_number` AS `flight_number`,`a`.`arriving_from` AS `arriving_from`,`a`.`arrival_date` AS `arrival_date`,`a`.`arrival_time` AS `arrival_time` from ((`time-table` `t` left join `departures` `d` on((concat(`t`.`airlineID`,`t`.`number`) = `d`.`flight-number`))) left join `arrivals` `a` on((concat(`t`.`airlineID`,`t`.`number`) = `a`.`flight_number`))) */;
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

-- Dump completed on 2021-04-13  4:28:09
