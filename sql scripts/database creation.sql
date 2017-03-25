CREATE DATABASE  IF NOT EXISTS `gcd` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `gcd`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: gcd
-- ------------------------------------------------------
-- Server version	5.6.21-log

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
-- Table structure for table `brand_groups`
--

DROP TABLE IF EXISTS `brand_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `brand_groups` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `year_beagan` int(11) DEFAULT NULL,
  `year_ended` int(11) DEFAULT NULL,
  `notes` text,
  `url` text,
  `publisher_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `_idx` (`publisher_id`),
  CONSTRAINT `brand_groups_publishers_fk` FOREIGN KEY (`publisher_id`) REFERENCES `publishers` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `brands`
--

DROP TABLE IF EXISTS `brands`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `brands` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `year_began` int(11) DEFAULT NULL,
  `year_ended` int(11) DEFAULT NULL,
  `notes` text,
  `url` text,
  `publisher_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `_idx` (`publisher_id`),
  CONSTRAINT `brands_publishers_fk` FOREIGN KEY (`publisher_id`) REFERENCES `publishers` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `characters`
--

DROP TABLE IF EXISTS `characters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `characters` (
  `name` varchar(255) NOT NULL,
  `id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `countries`
--

DROP TABLE IF EXISTS `countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `countries` (
  `id` int(11) NOT NULL,
  `code` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`),
  UNIQUE KEY `code_UNIQUE` (`code`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `indicia_publishers`
--

DROP TABLE IF EXISTS `indicia_publishers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `indicia_publishers` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `publisher_id` int(11) DEFAULT NULL,
  `country_id` int(11) DEFAULT NULL,
  `year_began` int(11) DEFAULT NULL,
  `year_ended` int(11) DEFAULT NULL,
  `is_surrogate` tinyint(4) DEFAULT NULL,
  `notes` text,
  `url` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `indicia_publishers_countries_fk_idx` (`country_id`),
  KEY `indicia_publishers_publishers_fk_idx` (`publisher_id`),
  CONSTRAINT `indicia_publishers_countries_fk` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `indicia_publishers_publishers_fk` FOREIGN KEY (`publisher_id`) REFERENCES `publishers` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `issue_reprints`
--

DROP TABLE IF EXISTS `issue_reprints`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `issue_reprints` (
  `id` int(11) NOT NULL,
  `origin_issue_id` int(11) DEFAULT NULL,
  `target_issue_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `issue_reprints_target_issues_fk_idx` (`target_issue_id`),
  KEY `issue_reprints_origin_issues_fk_idx` (`origin_issue_id`),
  CONSTRAINT `issue_reprints_origin_issues_fk` FOREIGN KEY (`origin_issue_id`) REFERENCES `issues` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `issue_reprints_target_issues_fk` FOREIGN KEY (`target_issue_id`) REFERENCES `issues` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `issues`
--

DROP TABLE IF EXISTS `issues`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `issues` (
  `id` int(11) NOT NULL,
  `number` varchar(255) DEFAULT NULL,
  `series_id` int(11) DEFAULT NULL,
  `indicia_publisher_id` int(11) DEFAULT NULL,
  `publication_date` varchar(255) DEFAULT NULL,
  `price` varchar(255) DEFAULT NULL,
  `page_count` int(11) DEFAULT NULL,
  `indicia_frequency` varchar(255) DEFAULT NULL,
  `editing` text,
  `notes` text,
  `isbn` varchar(255) DEFAULT NULL,
  `valid_isbn` varchar(255) DEFAULT NULL,
  `barcode` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `on_sale_date` varchar(255) DEFAULT NULL,
  `rating` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `issues_indicia_publishers_fk` (`indicia_publisher_id`),
  KEY `issues_series_fk_idx` (`series_id`),
  CONSTRAINT `issues_indicia_publishers_fk` FOREIGN KEY (`indicia_publisher_id`) REFERENCES `indicia_publishers` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `issues_series_fk` FOREIGN KEY (`series_id`) REFERENCES `series` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `languages`
--

DROP TABLE IF EXISTS `languages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `languages` (
  `id` int(11) NOT NULL,
  `code` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`),
  UNIQUE KEY `code_UNIQUE` (`code`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `people`
--

DROP TABLE IF EXISTS `people`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `people` (
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `publishers`
--

DROP TABLE IF EXISTS `publishers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `publishers` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `country_id` int(11) DEFAULT NULL,
  `year_began` int(11) DEFAULT NULL,
  `year_ended` int(11) DEFAULT NULL,
  `notes` text,
  `url` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `publishers_countries_fk_idx` (`country_id`),
  CONSTRAINT `publishers_countries_fk` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `series`
--

DROP TABLE IF EXISTS `series`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `series` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `format` varchar(255) DEFAULT NULL,
  `year_began` int(11) DEFAULT NULL,
  `year_ended` int(11) DEFAULT NULL,
  `publication_dates` varchar(255) DEFAULT NULL,
  `first_issue_id` int(11) DEFAULT NULL,
  `last_issue_id` int(11) DEFAULT NULL,
  `publisher_id` int(11) DEFAULT NULL,
  `country_id` int(11) DEFAULT NULL,
  `language_id` int(11) DEFAULT NULL,
  `notes` text,
  `color` varchar(255) DEFAULT NULL,
  `dimensions` varchar(255) DEFAULT NULL,
  `paper_stock` varchar(255) DEFAULT NULL,
  `binding` varchar(255) DEFAULT NULL,
  `publishing_format` varchar(255) DEFAULT NULL,
  `publication_type_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `series_first_issues_fk_idx` (`first_issue_id`),
  KEY `series_last_issues_fk_idx` (`last_issue_id`),
  KEY `series_publishers_fk_idx` (`publisher_id`),
  KEY `series_countries_fk_idx` (`country_id`),
  KEY `series_languages_fk_idx` (`language_id`),
  CONSTRAINT `series_countries_fk` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `series_first_issues_fk` FOREIGN KEY (`first_issue_id`) REFERENCES `issues` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `series_languages_fk` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `series_last_issues_fk` FOREIGN KEY (`last_issue_id`) REFERENCES `issues` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `series_publishers_fk` FOREIGN KEY (`publisher_id`) REFERENCES `publishers` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `series_publication_types`
--

DROP TABLE IF EXISTS `series_publication_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `series_publication_types` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `stories`
--

DROP TABLE IF EXISTS `stories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stories` (
  `id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `feature` varchar(255) DEFAULT NULL,
  `issue_id` int(11) DEFAULT NULL,
  `script_id` int(11) DEFAULT NULL,
  `pencils_id` int(11) DEFAULT NULL,
  `inks_id` int(11) DEFAULT NULL,
  `colors_id` int(11) DEFAULT NULL,
  `letters_id` int(11) DEFAULT NULL,
  `editing` text,
  `genre` varchar(255) DEFAULT NULL,
  `characters_id` int(11) DEFAULT NULL,
  `synopsis` text,
  `reprint_notes` text,
  `notes` text,
  `type_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `stories_issues_fk_idx` (`issue_id`),
  KEY `stories_script_fk_idx` (`script_id`),
  KEY `stories_pencils_fk_idx` (`pencils_id`),
  KEY `stories_inks_fk_idx` (`inks_id`),
  KEY `stories_colors_fk_idx` (`colors_id`),
  KEY `stories_letters_fk_idx` (`letters_id`),
  KEY `stories_characters_fk_idx` (`characters_id`),
  KEY `stories_story_types_fk_idx` (`type_id`),
  CONSTRAINT `stories_characters_fk` FOREIGN KEY (`characters_id`) REFERENCES `stories_characters` (`story_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `stories_colors_fk` FOREIGN KEY (`colors_id`) REFERENCES `stories_colors` (`story_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `stories_inks_fk` FOREIGN KEY (`inks_id`) REFERENCES `stories_inks` (`story_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `stories_issues_fk` FOREIGN KEY (`issue_id`) REFERENCES `issues` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `stories_letters_fk` FOREIGN KEY (`letters_id`) REFERENCES `stories_letters` (`story_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `stories_pencils_fk` FOREIGN KEY (`pencils_id`) REFERENCES `stories_pencils` (`story_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `stories_script_fk` FOREIGN KEY (`script_id`) REFERENCES `stories_script` (`story_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `stories_story_types_fk` FOREIGN KEY (`type_id`) REFERENCES `story_types` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `stories_characters`
--

DROP TABLE IF EXISTS `stories_characters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stories_characters` (
  `story_id` int(11) NOT NULL,
  `character_id` int(11) NOT NULL,
  PRIMARY KEY (`story_id`,`character_id`),
  KEY `stories_characters_characters_fk_idx` (`character_id`),
  CONSTRAINT `stories_characters_characters_fk` FOREIGN KEY (`character_id`) REFERENCES `characters` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `stories_colors`
--

DROP TABLE IF EXISTS `stories_colors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stories_colors` (
  `story_id` int(11) NOT NULL,
  `person_id` int(11) NOT NULL,
  PRIMARY KEY (`story_id`,`person_id`),
  KEY `stories_colors_people_fk_idx` (`person_id`),
  CONSTRAINT `stories_colors_people_fk` FOREIGN KEY (`person_id`) REFERENCES `people` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `stories_inks`
--

DROP TABLE IF EXISTS `stories_inks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stories_inks` (
  `story_id` int(11) NOT NULL,
  `person_id` int(11) NOT NULL,
  PRIMARY KEY (`story_id`,`person_id`),
  KEY `stories_inks_people_fk_idx` (`person_id`),
  CONSTRAINT `stories_inks_people_fk` FOREIGN KEY (`person_id`) REFERENCES `people` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `stories_letters`
--

DROP TABLE IF EXISTS `stories_letters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stories_letters` (
  `story_id` int(11) NOT NULL,
  `person_id` int(11) NOT NULL,
  PRIMARY KEY (`story_id`,`person_id`),
  KEY `stories_letters_people_fk_idx` (`person_id`),
  CONSTRAINT `stories_letters_people_fk` FOREIGN KEY (`person_id`) REFERENCES `people` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `stories_pencils`
--

DROP TABLE IF EXISTS `stories_pencils`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stories_pencils` (
  `story_id` int(11) NOT NULL,
  `person_id` int(11) NOT NULL,
  PRIMARY KEY (`story_id`,`person_id`),
  KEY `stories_pencils_people_fk_idx` (`person_id`),
  CONSTRAINT `stories_pencils_people_fk` FOREIGN KEY (`person_id`) REFERENCES `people` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `stories_script`
--

DROP TABLE IF EXISTS `stories_script`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stories_script` (
  `story_id` int(11) NOT NULL,
  `person_id` int(11) NOT NULL,
  PRIMARY KEY (`story_id`,`person_id`),
  KEY `stories_script_people_fk_idx` (`person_id`),
  CONSTRAINT `stories_script_people_fk` FOREIGN KEY (`person_id`) REFERENCES `people` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `story_reprints`
--

DROP TABLE IF EXISTS `story_reprints`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `story_reprints` (
  `id` int(11) NOT NULL,
  `origin_id` int(11) DEFAULT NULL,
  `target_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `story_reprints_origin_stories_fk_idx` (`origin_id`),
  KEY `story_reprints_target_stories_fk_idx` (`target_id`),
  CONSTRAINT `story_reprints_origin_stories_fk` FOREIGN KEY (`origin_id`) REFERENCES `stories` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `story_reprints_target_stories_fk` FOREIGN KEY (`target_id`) REFERENCES `stories` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `story_types`
--

DROP TABLE IF EXISTS `story_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `story_types` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`),
  UNIQUE KEY `id_UNIQUE` (`id`)
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

-- Dump completed on 2017-03-25 18:45:26