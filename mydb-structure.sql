-- MySQL dump 10.13  Distrib 5.5.27, for Win32 (x86)
--
-- Host: localhost    Database: mydb
-- ------------------------------------------------------
-- Server version	5.5.27

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
-- Table structure for table `agency`
--

DROP TABLE IF EXISTS `agency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `agency` (
  `agency_id` varchar(50) NOT NULL,
  `agency_name` varchar(50) DEFAULT NULL,
  `agency_url` varchar(1000) DEFAULT NULL,
  `agency_timezone` varchar(50) DEFAULT NULL,
  `agency_lang` varchar(50) DEFAULT NULL,
  `agency_phone` varchar(50) DEFAULT NULL,
  `agency_fare_url` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`agency_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `calendar`
--

DROP TABLE IF EXISTS `calendar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `calendar` (
  `service_id` varchar(50) NOT NULL,
  `monday` int(11) NOT NULL,
  `tuesday` int(11) NOT NULL,
  `wednesday` int(11) NOT NULL,
  `thursday` int(11) NOT NULL,
  `friday` int(11) NOT NULL,
  `saturday` int(11) NOT NULL,
  `sunday` int(11) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  KEY `calendar_ibfk_1_idx` (`service_id`),
  CONSTRAINT `calendar_ibfk_1` FOREIGN KEY (`service_id`) REFERENCES `trips` (`service_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `calendar_dates`
--

DROP TABLE IF EXISTS `calendar_dates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `calendar_dates` (
  `service_id` varchar(50) NOT NULL,
  `date` date NOT NULL,
  `exception_type` varchar(50) NOT NULL,
  KEY `calendar_dates_ibfk_1_idx` (`service_id`),
  CONSTRAINT `calendar_dates_ibfk_1` FOREIGN KEY (`service_id`) REFERENCES `trips` (`service_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fare_attributes`
--

DROP TABLE IF EXISTS `fare_attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fare_attributes` (
  `fare_id` varchar(50) NOT NULL DEFAULT '',
  `price` varchar(50) DEFAULT NULL,
  `currency_type` varchar(50) DEFAULT NULL,
  `payment_method` varchar(50) DEFAULT NULL,
  `transfers` varchar(50) DEFAULT NULL,
  `transfer_duration` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`fare_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fare_rules`
--

DROP TABLE IF EXISTS `fare_rules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fare_rules` (
  `fare_id` varchar(50) NOT NULL DEFAULT '',
  `route_id` varchar(50) DEFAULT NULL,
  `origin_id` varchar(50) DEFAULT NULL,
  `destination_id` varchar(50) DEFAULT NULL,
  `contains_id` varchar(50) DEFAULT NULL,
  KEY `fare_rules_ibfk_1_idx` (`fare_id`),
  KEY `fare_rules_ibfk_2_idx` (`route_id`),
  KEY `fare_rules_ibfk_3_idx` (`origin_id`),
  KEY `fare_rules_ibfk_4_idx` (`destination_id`),
  KEY `fare_rules_ibfk_5_idx` (`contains_id`),
  CONSTRAINT `fare_rules_ibfk_1` FOREIGN KEY (`fare_id`) REFERENCES `fare_attributes` (`fare_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fare_rules_ibfk_2` FOREIGN KEY (`route_id`) REFERENCES `routes` (`route_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fare_rules_ibfk_3` FOREIGN KEY (`origin_id`) REFERENCES `stops` (`zone_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fare_rules_ibfk_4` FOREIGN KEY (`destination_id`) REFERENCES `stops` (`zone_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fare_rules_ibfk_5` FOREIGN KEY (`contains_id`) REFERENCES `stops` (`zone_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `feed_info`
--

DROP TABLE IF EXISTS `feed_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `feed_info` (
  `feed_publisher_name` varchar(50) DEFAULT NULL,
  `feed_publisher_url` varchar(50) DEFAULT NULL,
  `feed_lang` varchar(50) DEFAULT NULL,
  `feed_start_date` varchar(50) DEFAULT NULL,
  `feed_end_date` varchar(50) DEFAULT NULL,
  `feed_version` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `frequencies`
--

DROP TABLE IF EXISTS `frequencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `frequencies` (
  `trip_id` varchar(50) NOT NULL DEFAULT '',
  `start_time` varchar(50) DEFAULT NULL,
  `end_time` varchar(50) DEFAULT NULL,
  `headway_secs` varchar(50) DEFAULT NULL,
  `exact_times` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`trip_id`),
  KEY `frequency_ibfk_1_idx` (`trip_id`),
  CONSTRAINT `frequency_ibfk_1` FOREIGN KEY (`trip_id`) REFERENCES `trips` (`trip_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `routes`
--

DROP TABLE IF EXISTS `routes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `routes` (
  `route_id` varchar(50) NOT NULL,
  `agency_id` varchar(50) DEFAULT NULL,
  `route_short_name` varchar(50) DEFAULT NULL,
  `route_long_name` varchar(1000) DEFAULT NULL,
  `route_desc` varchar(1000) DEFAULT NULL,
  `route_type` varchar(50) DEFAULT NULL,
  `route_url` varchar(1000) DEFAULT NULL,
  `route_color` varchar(50) DEFAULT NULL,
  `route_text_color` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`route_id`),
  KEY `route_ibfk_1_idx` (`agency_id`),
  CONSTRAINT `route_ibfk_1` FOREIGN KEY (`agency_id`) REFERENCES `agency` (`agency_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `shapes`
--

DROP TABLE IF EXISTS `shapes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shapes` (
  `shape_id` varchar(50) NOT NULL DEFAULT '',
  `shape_pt_lat` varchar(50) DEFAULT NULL,
  `shape_pt_lon` varchar(50) DEFAULT NULL,
  `shape_pt_sequence` int(11) NOT NULL,
  `shape_dist_traveled` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`shape_id`,`shape_pt_sequence`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `stop_times`
--

DROP TABLE IF EXISTS `stop_times`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stop_times` (
  `trip_id` varchar(50) NOT NULL,
  `arrival_time` varchar(50) NOT NULL,
  `departure_time` varchar(50) NOT NULL,
  `stop_id` varchar(50) NOT NULL,
  `stop_sequence` int(11) NOT NULL,
  `stop_headsign` varchar(50) DEFAULT NULL,
  `pickup_type` varchar(50) DEFAULT NULL,
  `drop_off_type` varchar(50) DEFAULT NULL,
  `shape_dist_traveled` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`trip_id`,`stop_sequence`),
  KEY `stop_times_ibfk_1_idx` (`trip_id`),
  KEY `stop_times_ibfk_2_idx` (`stop_id`),
  CONSTRAINT `stop_times_ibfk_1` FOREIGN KEY (`trip_id`) REFERENCES `trips` (`trip_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `stop_times_ibfk_2` FOREIGN KEY (`stop_id`) REFERENCES `stops` (`stop_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `stops`
--

DROP TABLE IF EXISTS `stops`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stops` (
  `stop_id` varchar(50) NOT NULL,
  `stop_code` varchar(50) DEFAULT NULL,
  `stop_name` varchar(50) DEFAULT NULL,
  `stop_desc` varchar(1000) DEFAULT NULL,
  `stop_lat` decimal(9,6) DEFAULT NULL,
  `stop_lon` decimal(9,6) DEFAULT NULL,
  `zone_id` varchar(50) DEFAULT NULL,
  `stop_url` varchar(1000) DEFAULT NULL,
  `location_type` varchar(50) DEFAULT NULL,
  `parent_station` varchar(50) DEFAULT NULL,
  `stop_timezone` varchar(50) DEFAULT NULL,
  `wheelchair_boarding` varchar(50) DEFAULT NULL,
  `wheelchair_accessible` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`stop_id`),
  KEY `stop_loc` (`stop_lat`,`stop_lon`),
  KEY `stop_zone_id` (`zone_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `transfers`
--

DROP TABLE IF EXISTS `transfers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transfers` (
  `from_stop_id` varchar(50) NOT NULL DEFAULT '',
  `to_stop_id` varchar(50) NOT NULL DEFAULT '',
  `transfer_type` varchar(50) DEFAULT NULL,
  `min_transfer_time` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`from_stop_id`,`to_stop_id`),
  KEY `transfer_ibfk_1_idx` (`from_stop_id`),
  KEY `transfer_ibfk_2_idx` (`to_stop_id`),
  CONSTRAINT `transfer_ibfk_1` FOREIGN KEY (`from_stop_id`) REFERENCES `stops` (`stop_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `transfer_ibfk_2` FOREIGN KEY (`to_stop_id`) REFERENCES `stops` (`stop_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `trips`
--

DROP TABLE IF EXISTS `trips`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trips` (
  `route_id` varchar(50) NOT NULL,
  `service_id` varchar(50) NOT NULL,
  `trip_id` varchar(50) NOT NULL,
  `trip_headsign` varchar(1000) DEFAULT NULL,
  `trip_short_name` varchar(50) DEFAULT NULL,
  `direction_id` varchar(50) DEFAULT NULL,
  `block_id` varchar(50) DEFAULT NULL,
  `shape_id` varchar(50) DEFAULT NULL,
  `wheelchair_boarding` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`trip_id`),
  KEY `trips_ibfk_1_idx` (`route_id`),
  KEY `trips_ibfk_2_idx` (`shape_id`),
  KEY `trips_ibfk_3_idx` (`service_id`),
  CONSTRAINT `trips_ibfk_1` FOREIGN KEY (`route_id`) REFERENCES `routes` (`route_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `trips_ibfk_2` FOREIGN KEY (`shape_id`) REFERENCES `shapes` (`shape_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-11-05 22:43:01
