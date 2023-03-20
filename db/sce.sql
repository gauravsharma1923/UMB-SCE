-- MySQL dump 10.14  Distrib 5.5.64-MariaDB, for Linux (x86_64)
--
-- Host: 10.34.234.132    Database: umbsc_live_test1
-- ------------------------------------------------------
-- Server version	10.4.7-MariaDB-log

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
-- Table structure for table `log`
--

DROP TABLE IF EXISTS `log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `log` (
  `dt` datetime DEFAULT NULL,
  `remarks` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `loggs`
--

DROP TABLE IF EXISTS `loggs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `loggs` (
  `l` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `logs`
--

DROP TABLE IF EXISTS `logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `logs` (
  `str` varchar(1000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t1`
--

DROP TABLE IF EXISTS `t1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t1` (
  `node_id` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL,
  `status` int(11) DEFAULT 1,
  `service_id` int(11) NOT NULL,
  `parent_service_id` int(11) DEFAULT NULL,
  `service_code` varchar(50) NOT NULL,
  `request_text` varchar(250) DEFAULT NULL,
  `response_text` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL,
  `regex` varchar(1000) DEFAULT NULL COMMENT 'Regular Expression validation for the current node',
  `invalid_response_text` varchar(1000) DEFAULT NULL COMMENT 'Invalid response text in case the regex validation fails',
  `invalid_menu_flag` int(11) DEFAULT NULL COMMENT 'Menu flag (Notify or continue session) in case the regex validation fails',
  `node_type` int(11) DEFAULT NULL COMMENT 'List, Single Element, Notification, To Application, Switch to Other Service Code',
  `is_header` tinyint(1) DEFAULT 0 COMMENT 'In Case node is element of list type and is a header (to be used only in case node_type is List)',
  `is_footer` tinyint(1) DEFAULT 0 COMMENT 'In Case node is element of list type and is a footer (to be used only in case node_type is List)',
  `is_list_element` tinyint(1) DEFAULT 0 COMMENT 'In Case node is element of list type and is a list element (to be used only in case node_type is List)',
  `is_application_node` tinyint(1) DEFAULT 0,
  `preference` int(11) DEFAULT NULL COMMENT 'in case of listing position of element',
  `menu_flag` int(11) DEFAULT NULL,
  `dcs` int(11) DEFAULT 0,
  `application_id` int(11) DEFAULT 0 COMMENT 'Application id in case the node is To Application',
  `variable_name` int(11) DEFAULT 0,
  `variable_value` varchar(100) DEFAULT NULL,
  `switch_service_id` int(11) DEFAULT NULL COMMENT 'Service id in case the node is Switch to Other Service Code from tbl_service_master',
  `switch_service_code` varchar(50) DEFAULT NULL COMMENT 'Service code in case the node is Switch to Other Service Code from tbl_service_master',
  `circle_id` varchar(50) DEFAULT NULL,
  `operator_id` varchar(50) DEFAULT NULL,
  `if_clause` int(11) DEFAULT NULL COMMENT 'Variable id for which if statement needs to be performed',
  `if_value_clause` varchar(100) DEFAULT NULL COMMENT 'Variable value for which if statement needs to be performed on true this node will be shown else ignored',
  `version_major` int(11) DEFAULT 1,
  `version_minor` int(11) DEFAULT 0,
  `created_on` datetime DEFAULT current_timestamp(),
  `last_modified` datetime DEFAULT NULL,
  `sequence_no` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`node_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbl_application_master`
--

DROP TABLE IF EXISTS `tbl_application_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_application_master` (
  `app_id` int(11) NOT NULL AUTO_INCREMENT,
  `app_mtype` int(11) NOT NULL,
  `app_name` varchar(100) NOT NULL,
  `app_response` varchar(300) DEFAULT NULL COMMENT 'Pipe separated response nodes',
  `app_description` varchar(250) DEFAULT NULL,
  `mandatory_params` varchar(300) DEFAULT NULL COMMENT 'Pipe separated mandatory parameters',
  `optional_params` varchar(300) DEFAULT NULL COMMENT 'Pipe separated optional parameters',
  `status` int(11) DEFAULT 1,
  `created_on` datetime DEFAULT current_timestamp(),
  `last_modified` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`app_id`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbl_application_master_bkp`
--

DROP TABLE IF EXISTS `tbl_application_master_bkp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_application_master_bkp` (
  `app_id` int(11) NOT NULL DEFAULT 0,
  `app_mtype` int(11) NOT NULL,
  `app_name` varchar(100) NOT NULL,
  `app_response` varchar(300) DEFAULT NULL COMMENT 'Pipe separated response nodes',
  `app_description` varchar(250) DEFAULT NULL,
  `mandatory_params` varchar(300) DEFAULT NULL COMMENT 'Pipe separated mandatory parameters',
  `optional_params` varchar(300) DEFAULT NULL COMMENT 'Pipe separated optional parameters',
  `status` int(11) DEFAULT 1,
  `created_on` datetime DEFAULT current_timestamp(),
  `last_modified` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbl_check`
--

DROP TABLE IF EXISTS `tbl_check`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_check` (
  `sequence_no` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbl_edit_service_history`
--

DROP TABLE IF EXISTS `tbl_edit_service_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_edit_service_history` (
  `edit_id` int(11) NOT NULL AUTO_INCREMENT,
  `service_id` int(11) NOT NULL DEFAULT 0,
  `service_name` varchar(100) NOT NULL,
  `service_code` varchar(50) NOT NULL,
  `creator_id` int(11) NOT NULL,
  `parent_service_id` int(11) DEFAULT 0,
  `status` int(11) DEFAULT 1,
  `modified_by` int(11) DEFAULT NULL,
  `current_version_major` int(11) DEFAULT 0,
  `current_version_minor` int(11) DEFAULT 0,
  `new_version_major` int(11) DEFAULT 0,
  `new_version_minor` int(11) DEFAULT 0,
  `remarks` text DEFAULT NULL,
  `created_on` timestamp NULL DEFAULT current_timestamp(),
  `last_modified` timestamp NULL DEFAULT current_timestamp(),
  `edit_flag` int(11) DEFAULT NULL,
  PRIMARY KEY (`edit_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11517 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbl_error_log`
--

DROP TABLE IF EXISTS `tbl_error_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_error_log` (
  `error_id` int(11) NOT NULL AUTO_INCREMENT,
  `proc_name` varchar(500) DEFAULT NULL,
  `error_code` decimal(38,0) DEFAULT NULL,
  `error_desc` varchar(500) DEFAULT NULL,
  `error_date` datetime DEFAULT NULL,
  PRIMARY KEY (`error_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6255 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbl_error_log_copy`
--

DROP TABLE IF EXISTS `tbl_error_log_copy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_error_log_copy` (
  `error_id` int(11) NOT NULL,
  `proc_name` varchar(500) DEFAULT NULL,
  `error_code` decimal(38,0) DEFAULT NULL,
  `error_desc` varchar(500) DEFAULT NULL,
  `error_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbl_header_scheduler`
--

DROP TABLE IF EXISTS `tbl_header_scheduler`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_header_scheduler` (
  `cid` int(10) NOT NULL AUTO_INCREMENT,
  `ServiceCode` varchar(100) NOT NULL,
  `HeaderServiceCode` varchar(200) DEFAULT NULL,
  `StartDateTime` datetime NOT NULL,
  `EndDateTime` datetime NOT NULL,
  `CreationDateTime` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `creatorId` int(10) NOT NULL,
  `IsDeleted` int(10) NOT NULL DEFAULT 0,
  `IsRunning` int(10) NOT NULL DEFAULT 0,
  `HeaderType` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`cid`),
  UNIQUE KEY `tbl_header_scheduler_uidx1` (`ServiceCode`,`HeaderServiceCode`,`StartDateTime`,`EndDateTime`,`HeaderType`)
) ENGINE=InnoDB AUTO_INCREMENT=128 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbl_logs`
--

DROP TABLE IF EXISTS `tbl_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_logs` (
  `parentId` int(11) DEFAULT NULL,
  `nodeId` int(11) DEFAULT NULL,
  `serviceId` int(11) DEFAULT NULL,
  `nodeText` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbl_ma_user_type`
--

DROP TABLE IF EXISTS `tbl_ma_user_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_ma_user_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbl_main_rules_mapping`
--

DROP TABLE IF EXISTS `tbl_main_rules_mapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_main_rules_mapping` (
  `main_rule_id` int(11) NOT NULL AUTO_INCREMENT,
  `main_rule` varchar(150) CHARACTER SET latin1 DEFAULT NULL,
  `salesarea` varchar(150) CHARACTER SET latin1 DEFAULT NULL,
  `category` varchar(150) CHARACTER SET latin1 DEFAULT NULL,
  `balance` varchar(150) CHARACTER SET latin1 DEFAULT NULL,
  `country` varchar(150) CHARACTER SET latin1 DEFAULT NULL,
  `imei` varchar(150) CHARACTER SET latin1 DEFAULT NULL,
  `profile` varchar(150) CHARACTER SET latin1 DEFAULT NULL,
  `account_group` varchar(150) CHARACTER SET latin1 DEFAULT NULL,
  `service_offering` varchar(150) CHARACTER SET latin1 DEFAULT NULL,
  `vlr` varchar(150) CHARACTER SET latin1 DEFAULT NULL,
  `offer_id` varchar(150) CHARACTER SET latin1 DEFAULT NULL,
  `zone` varchar(150) COLLATE latin1_bin DEFAULT NULL,
  `lte_flag` varchar(150) COLLATE latin1_bin DEFAULT NULL,
  `lang` varchar(150) COLLATE latin1_bin DEFAULT NULL,
  `preference` int(11) DEFAULT 10000,
  `short_code` varchar(200) COLLATE latin1_bin DEFAULT NULL,
  PRIMARY KEY (`main_rule_id`),
  UNIQUE KEY `tbl_main_rules_mapping_uidx2` (`short_code`,`main_rule`,`salesarea`,`category`,`balance`,`country`,`imei`,`profile`,`account_group`,`service_offering`,`vlr`,`offer_id`,`zone`,`lte_flag`,`lang`)
) ENGINE=InnoDB AUTO_INCREMENT=80 DEFAULT CHARSET=latin1 COLLATE=latin1_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbl_menu_flag_master`
--

DROP TABLE IF EXISTS `tbl_menu_flag_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_menu_flag_master` (
  `menu_flag` int(11) NOT NULL,
  `node_type` int(11) NOT NULL,
  `description` varchar(100) NOT NULL,
  `created_on` datetime DEFAULT current_timestamp(),
  `last_modified` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  UNIQUE KEY `uniq` (`menu_flag`,`node_type`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbl_msisdn_test`
--

DROP TABLE IF EXISTS `tbl_msisdn_test`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_msisdn_test` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `msisdn` varchar(30) DEFAULT NULL,
  `service_code` varchar(100) DEFAULT NULL,
  `service_id` int(11) DEFAULT NULL,
  `creator_id` int(11) DEFAULT NULL,
  `creation_on` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  UNIQUE KEY `unique_msisdn` (`msisdn`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=265 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbl_msisdn_test_archive`
--

DROP TABLE IF EXISTS `tbl_msisdn_test_archive`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_msisdn_test_archive` (
  `id` int(11) NOT NULL DEFAULT 0,
  `msisdn` varchar(30) DEFAULT NULL,
  `service_code` varchar(100) DEFAULT NULL,
  `service_id` int(11) DEFAULT NULL,
  `creator_id` int(11) DEFAULT NULL,
  `creation_on` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbl_node_type_master`
--

DROP TABLE IF EXISTS `tbl_node_type_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_node_type_master` (
  `node_type_id` int(11) NOT NULL COMMENT '1-List, 2-Single Element, 3-Notification, 4-To Application, 5-Switch to Other Service Code',
  `node_name` varchar(100) NOT NULL,
  `status` int(11) DEFAULT 1,
  `created_on` datetime DEFAULT current_timestamp(),
  `last_modified` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`node_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbl_notification`
--

DROP TABLE IF EXISTS `tbl_notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_notification` (
  `notification_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `notification_msg` varchar(100) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `read_date` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `insert_date` timestamp NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`notification_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7759 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbl_revision_history`
--

DROP TABLE IF EXISTS `tbl_revision_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_revision_history` (
  `revision_id` int(11) NOT NULL AUTO_INCREMENT,
  `service_id` int(11) NOT NULL DEFAULT 0,
  `service_name` varchar(100) DEFAULT NULL,
  `service_code` varchar(100) DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `old_version_major` int(11) DEFAULT NULL,
  `old_version_minor` int(11) DEFAULT NULL,
  `new_version_major` int(11) DEFAULT 0,
  `new_version_minor` int(11) DEFAULT 0,
  `remarks` text DEFAULT NULL,
  `created_on` timestamp NULL DEFAULT current_timestamp(),
  KEY `revision_id` (`revision_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4551 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbl_roles`
--

DROP TABLE IF EXISTS `tbl_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_roles` (
  `user_master_id` int(11) NOT NULL,
  `user_mgmt` varchar(1) DEFAULT '0',
  `service_mgmt` varchar(1) DEFAULT '0',
  PRIMARY KEY (`user_master_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbl_service_class_mapping`
--

DROP TABLE IF EXISTS `tbl_service_class_mapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_service_class_mapping` (
  `bucket_id` int(11) NOT NULL AUTO_INCREMENT,
  `bucket_name` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `short_code` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `service_class` varchar(12000) CHARACTER SET latin1 DEFAULT NULL,
  `preference` int(11) DEFAULT 1000000,
  `criteria` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  PRIMARY KEY (`bucket_id`)
) ENGINE=InnoDB AUTO_INCREMENT=856 DEFAULT CHARSET=latin1 COLLATE=latin1_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbl_service_deploy_logs`
--

DROP TABLE IF EXISTS `tbl_service_deploy_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_service_deploy_logs` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `service_id` int(11) DEFAULT NULL,
  `service_name` varchar(200) DEFAULT NULL,
  `service_code` varchar(200) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `version_major` int(11) DEFAULT NULL,
  `version_minor` int(11) DEFAULT NULL,
  `deployment_type` varchar(100) DEFAULT NULL,
  `deployment_time` timestamp NULL DEFAULT NULL,
  `login_id` int(11) DEFAULT NULL,
  `log_date` timestamp NULL DEFAULT NULL,
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3479 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbl_service_master`
--

DROP TABLE IF EXISTS `tbl_service_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_service_master` (
  `service_id` int(11) NOT NULL AUTO_INCREMENT,
  `service_name` varchar(100) NOT NULL,
  `service_code` varchar(50) NOT NULL,
  `creator_id` int(11) NOT NULL,
  `parent_service_id` int(11) DEFAULT 0,
  `scope` int(11) DEFAULT NULL,
  `dcs` int(11) DEFAULT NULL,
  `circle` varchar(40) DEFAULT NULL,
  `version_major` int(11) DEFAULT 0,
  `version_minor` int(11) DEFAULT 0,
  `status` int(11) DEFAULT 1,
  `operator` varchar(40) DEFAULT NULL,
  `subscriber_type` varchar(40) DEFAULT NULL,
  `description` varchar(250) DEFAULT NULL,
  `Edit_flag` varchar(1) DEFAULT NULL,
  `key_value` varchar(100) DEFAULT NULL,
  `created_on` timestamp NULL DEFAULT current_timestamp(),
  `last_modify_by` int(11) DEFAULT NULL,
  `last_modified` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`service_id`),
  UNIQUE KEY `service_code` (`service_code`)
) ENGINE=InnoDB AUTO_INCREMENT=1604 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbl_service_master_archive`
--

DROP TABLE IF EXISTS `tbl_service_master_archive`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_service_master_archive` (
  `service_id` int(11) NOT NULL DEFAULT 0,
  `service_name` varchar(100) NOT NULL,
  `service_code` varchar(50) NOT NULL,
  `creator_id` int(11) NOT NULL,
  `parent_service_id` int(11) DEFAULT NULL,
  `scope` int(11) DEFAULT NULL,
  `dcs` int(11) DEFAULT NULL,
  `circle` varchar(40) DEFAULT NULL,
  `status` int(11) DEFAULT 1,
  `operator` varchar(40) DEFAULT NULL,
  `subscriber_type` varchar(40) DEFAULT NULL,
  `description` varchar(250) DEFAULT NULL,
  `created_on` timestamp NULL DEFAULT current_timestamp(),
  `last_modified` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbl_service_nodes`
--

DROP TABLE IF EXISTS `tbl_service_nodes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_service_nodes` (
  `node_id` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL,
  `status` int(11) DEFAULT 1,
  `service_id` int(11) NOT NULL,
  `parent_service_id` int(11) DEFAULT NULL,
  `service_code` varchar(50) NOT NULL,
  `request_text` varchar(250) DEFAULT NULL,
  `response_text` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL,
  `regex` varchar(1000) DEFAULT NULL COMMENT 'Regular Expression validation for the current node',
  `invalid_response_text` varchar(1000) DEFAULT NULL COMMENT 'Invalid response text in case the regex validation fails',
  `invalid_menu_flag` int(11) DEFAULT NULL COMMENT 'Menu flag (Notify or continue session) in case the regex validation fails',
  `node_type` int(11) DEFAULT NULL COMMENT 'List, Single Element, Notification, To Application, Switch to Other Service Code',
  `is_header` tinyint(1) DEFAULT 0 COMMENT 'In Case node is element of list type and is a header (to be used only in case node_type is List)',
  `is_footer` tinyint(1) DEFAULT 0 COMMENT 'In Case node is element of list type and is a footer (to be used only in case node_type is List)',
  `is_list_element` tinyint(1) DEFAULT 0 COMMENT 'In Case node is element of list type and is a list element (to be used only in case node_type is List)',
  `is_application_node` tinyint(1) DEFAULT 0,
  `preference` int(11) DEFAULT NULL COMMENT 'in case of listing position of element',
  `menu_flag` int(11) DEFAULT NULL,
  `dcs` int(11) DEFAULT 0,
  `application_id` int(11) DEFAULT 0 COMMENT 'Application id in case the node is To Application',
  `variable_name` int(11) DEFAULT 0,
  `variable_value` varchar(100) DEFAULT NULL,
  `switch_service_id` int(11) DEFAULT NULL COMMENT 'Service id in case the node is Switch to Other Service Code from tbl_service_master',
  `switch_service_code` varchar(50) DEFAULT NULL COMMENT 'Service code in case the node is Switch to Other Service Code from tbl_service_master',
  `circle_id` varchar(50) DEFAULT NULL,
  `operator_id` varchar(50) DEFAULT NULL,
  `if_clause` int(11) DEFAULT NULL COMMENT 'Variable id for which if statement needs to be performed',
  `if_value_clause` varchar(5000) DEFAULT NULL COMMENT 'Variable value for which if statement needs to be performed on true this node will be shown else ignored',
  `version_major` int(11) DEFAULT 1,
  `version_minor` int(11) DEFAULT 0,
  `created_on` datetime DEFAULT current_timestamp(),
  `last_modified` datetime DEFAULT NULL,
  `sequence_no` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`node_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbl_service_nodes_25`
--

DROP TABLE IF EXISTS `tbl_service_nodes_25`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_service_nodes_25` (
  `node_id` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL,
  `status` int(11) DEFAULT 1,
  `service_id` int(11) NOT NULL,
  `parent_service_id` int(11) DEFAULT NULL,
  `service_code` varchar(50) NOT NULL,
  `request_text` varchar(250) DEFAULT NULL,
  `response_text` varchar(1000) DEFAULT NULL,
  `regex` varchar(1000) DEFAULT NULL COMMENT 'Regular Expression validation for the current node',
  `invalid_response_text` varchar(1000) DEFAULT NULL COMMENT 'Invalid response text in case the regex validation fails',
  `invalid_menu_flag` int(11) DEFAULT NULL COMMENT 'Menu flag (Notify or continue session) in case the regex validation fails',
  `node_type` int(11) DEFAULT NULL COMMENT 'List, Single Element, Notification, To Application, Switch to Other Service Code',
  `is_header` tinyint(1) DEFAULT 0 COMMENT 'In Case node is element of list type and is a header (to be used only in case node_type is List)',
  `is_footer` tinyint(1) DEFAULT 0 COMMENT 'In Case node is element of list type and is a footer (to be used only in case node_type is List)',
  `is_list_element` tinyint(1) DEFAULT 0 COMMENT 'In Case node is element of list type and is a list element (to be used only in case node_type is List)',
  `is_application_node` tinyint(1) DEFAULT 0,
  `preference` int(11) DEFAULT NULL COMMENT 'in case of listing position of element',
  `menu_flag` int(11) DEFAULT NULL,
  `dcs` int(11) DEFAULT 0,
  `application_id` int(11) DEFAULT 0 COMMENT 'Application id in case the node is To Application',
  `variable_name` int(11) DEFAULT 0,
  `variable_value` varchar(100) DEFAULT NULL,
  `switch_service_id` int(11) DEFAULT NULL COMMENT 'Service id in case the node is Switch to Other Service Code from tbl_service_master',
  `switch_service_code` varchar(50) DEFAULT NULL COMMENT 'Service code in case the node is Switch to Other Service Code from tbl_service_master',
  `circle_id` varchar(50) DEFAULT NULL,
  `operator_id` varchar(50) DEFAULT NULL,
  `if_clause` int(11) DEFAULT NULL COMMENT 'Variable id for which if statement needs to be performed',
  `if_value_clause` varchar(100) DEFAULT NULL COMMENT 'Variable value for which if statement needs to be performed on true this node will be shown else ignored',
  `version_major` int(11) DEFAULT 1,
  `version_minor` int(11) DEFAULT 0,
  `created_on` datetime DEFAULT current_timestamp(),
  `last_modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbl_service_nodes_26`
--

DROP TABLE IF EXISTS `tbl_service_nodes_26`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_service_nodes_26` (
  `node_id` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL,
  `status` int(11) DEFAULT 1,
  `service_id` int(11) NOT NULL,
  `parent_service_id` int(11) DEFAULT NULL,
  `service_code` varchar(50) NOT NULL,
  `request_text` varchar(250) DEFAULT NULL,
  `response_text` varchar(1000) DEFAULT NULL,
  `regex` varchar(1000) DEFAULT NULL COMMENT 'Regular Expression validation for the current node',
  `invalid_response_text` varchar(1000) DEFAULT NULL COMMENT 'Invalid response text in case the regex validation fails',
  `invalid_menu_flag` int(11) DEFAULT NULL COMMENT 'Menu flag (Notify or continue session) in case the regex validation fails',
  `node_type` int(11) DEFAULT NULL COMMENT 'List, Single Element, Notification, To Application, Switch to Other Service Code',
  `is_header` tinyint(1) DEFAULT 0 COMMENT 'In Case node is element of list type and is a header (to be used only in case node_type is List)',
  `is_footer` tinyint(1) DEFAULT 0 COMMENT 'In Case node is element of list type and is a footer (to be used only in case node_type is List)',
  `is_list_element` tinyint(1) DEFAULT 0 COMMENT 'In Case node is element of list type and is a list element (to be used only in case node_type is List)',
  `is_application_node` tinyint(1) DEFAULT 0,
  `preference` int(11) DEFAULT NULL COMMENT 'in case of listing position of element',
  `menu_flag` int(11) DEFAULT NULL,
  `dcs` int(11) DEFAULT 0,
  `application_id` int(11) DEFAULT 0 COMMENT 'Application id in case the node is To Application',
  `variable_name` int(11) DEFAULT 0,
  `variable_value` varchar(100) DEFAULT NULL,
  `switch_service_id` int(11) DEFAULT NULL COMMENT 'Service id in case the node is Switch to Other Service Code from tbl_service_master',
  `switch_service_code` varchar(50) DEFAULT NULL COMMENT 'Service code in case the node is Switch to Other Service Code from tbl_service_master',
  `circle_id` varchar(50) DEFAULT NULL,
  `operator_id` varchar(50) DEFAULT NULL,
  `if_clause` int(11) DEFAULT NULL COMMENT 'Variable id for which if statement needs to be performed',
  `if_value_clause` varchar(100) DEFAULT NULL COMMENT 'Variable value for which if statement needs to be performed on true this node will be shown else ignored',
  `version_major` int(11) DEFAULT 1,
  `version_minor` int(11) DEFAULT 0,
  `created_on` datetime DEFAULT current_timestamp(),
  `last_modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbl_service_nodes_30`
--

DROP TABLE IF EXISTS `tbl_service_nodes_30`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_service_nodes_30` (
  `node_id` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL,
  `status` int(11) DEFAULT 1,
  `service_id` int(11) NOT NULL,
  `parent_service_id` int(11) DEFAULT NULL,
  `service_code` varchar(50) NOT NULL,
  `request_text` varchar(250) DEFAULT NULL,
  `response_text` varchar(1000) DEFAULT NULL,
  `regex` varchar(1000) DEFAULT NULL COMMENT 'Regular Expression validation for the current node',
  `invalid_response_text` varchar(1000) DEFAULT NULL COMMENT 'Invalid response text in case the regex validation fails',
  `invalid_menu_flag` int(11) DEFAULT NULL COMMENT 'Menu flag (Notify or continue session) in case the regex validation fails',
  `node_type` int(11) DEFAULT NULL COMMENT 'List, Single Element, Notification, To Application, Switch to Other Service Code',
  `is_header` tinyint(1) DEFAULT 0 COMMENT 'In Case node is element of list type and is a header (to be used only in case node_type is List)',
  `is_footer` tinyint(1) DEFAULT 0 COMMENT 'In Case node is element of list type and is a footer (to be used only in case node_type is List)',
  `is_list_element` tinyint(1) DEFAULT 0 COMMENT 'In Case node is element of list type and is a list element (to be used only in case node_type is List)',
  `is_application_node` tinyint(1) DEFAULT 0,
  `preference` int(11) DEFAULT NULL COMMENT 'in case of listing position of element',
  `menu_flag` int(11) DEFAULT NULL,
  `dcs` int(11) DEFAULT 0,
  `application_id` int(11) DEFAULT 0 COMMENT 'Application id in case the node is To Application',
  `variable_name` int(11) DEFAULT 0,
  `variable_value` varchar(100) DEFAULT NULL,
  `switch_service_id` int(11) DEFAULT NULL COMMENT 'Service id in case the node is Switch to Other Service Code from tbl_service_master',
  `switch_service_code` varchar(50) DEFAULT NULL COMMENT 'Service code in case the node is Switch to Other Service Code from tbl_service_master',
  `circle_id` varchar(50) DEFAULT NULL,
  `operator_id` varchar(50) DEFAULT NULL,
  `if_clause` int(11) DEFAULT NULL COMMENT 'Variable id for which if statement needs to be performed',
  `if_value_clause` varchar(100) DEFAULT NULL COMMENT 'Variable value for which if statement needs to be performed on true this node will be shown else ignored',
  `version_major` int(11) DEFAULT 1,
  `version_minor` int(11) DEFAULT 0,
  `created_on` datetime DEFAULT current_timestamp(),
  `last_modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbl_service_nodes_31`
--

DROP TABLE IF EXISTS `tbl_service_nodes_31`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_service_nodes_31` (
  `node_id` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL,
  `status` int(11) DEFAULT 1,
  `service_id` int(11) NOT NULL,
  `parent_service_id` int(11) DEFAULT NULL,
  `service_code` varchar(50) NOT NULL,
  `request_text` varchar(250) DEFAULT NULL,
  `response_text` varchar(1000) DEFAULT NULL,
  `regex` varchar(1000) DEFAULT NULL COMMENT 'Regular Expression validation for the current node',
  `invalid_response_text` varchar(1000) DEFAULT NULL COMMENT 'Invalid response text in case the regex validation fails',
  `invalid_menu_flag` int(11) DEFAULT NULL COMMENT 'Menu flag (Notify or continue session) in case the regex validation fails',
  `node_type` int(11) DEFAULT NULL COMMENT 'List, Single Element, Notification, To Application, Switch to Other Service Code',
  `is_header` tinyint(1) DEFAULT 0 COMMENT 'In Case node is element of list type and is a header (to be used only in case node_type is List)',
  `is_footer` tinyint(1) DEFAULT 0 COMMENT 'In Case node is element of list type and is a footer (to be used only in case node_type is List)',
  `is_list_element` tinyint(1) DEFAULT 0 COMMENT 'In Case node is element of list type and is a list element (to be used only in case node_type is List)',
  `is_application_node` tinyint(1) DEFAULT 0,
  `preference` int(11) DEFAULT NULL COMMENT 'in case of listing position of element',
  `menu_flag` int(11) DEFAULT NULL,
  `dcs` int(11) DEFAULT 0,
  `application_id` int(11) DEFAULT 0 COMMENT 'Application id in case the node is To Application',
  `variable_name` int(11) DEFAULT 0,
  `variable_value` varchar(100) DEFAULT NULL,
  `switch_service_id` int(11) DEFAULT NULL COMMENT 'Service id in case the node is Switch to Other Service Code from tbl_service_master',
  `switch_service_code` varchar(50) DEFAULT NULL COMMENT 'Service code in case the node is Switch to Other Service Code from tbl_service_master',
  `circle_id` varchar(50) DEFAULT NULL,
  `operator_id` varchar(50) DEFAULT NULL,
  `if_clause` int(11) DEFAULT NULL COMMENT 'Variable id for which if statement needs to be performed',
  `if_value_clause` varchar(100) DEFAULT NULL COMMENT 'Variable value for which if statement needs to be performed on true this node will be shown else ignored',
  `version_major` int(11) DEFAULT 1,
  `version_minor` int(11) DEFAULT 0,
  `created_on` datetime DEFAULT current_timestamp(),
  `last_modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbl_service_nodes_32`
--

DROP TABLE IF EXISTS `tbl_service_nodes_32`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_service_nodes_32` (
  `node_id` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL,
  `status` int(11) DEFAULT 1,
  `service_id` int(11) NOT NULL,
  `parent_service_id` int(11) DEFAULT NULL,
  `service_code` varchar(50) NOT NULL,
  `request_text` varchar(250) DEFAULT NULL,
  `response_text` varchar(1000) DEFAULT NULL,
  `regex` varchar(1000) DEFAULT NULL COMMENT 'Regular Expression validation for the current node',
  `invalid_response_text` varchar(1000) DEFAULT NULL COMMENT 'Invalid response text in case the regex validation fails',
  `invalid_menu_flag` int(11) DEFAULT NULL COMMENT 'Menu flag (Notify or continue session) in case the regex validation fails',
  `node_type` int(11) DEFAULT NULL COMMENT 'List, Single Element, Notification, To Application, Switch to Other Service Code',
  `is_header` tinyint(1) DEFAULT 0 COMMENT 'In Case node is element of list type and is a header (to be used only in case node_type is List)',
  `is_footer` tinyint(1) DEFAULT 0 COMMENT 'In Case node is element of list type and is a footer (to be used only in case node_type is List)',
  `is_list_element` tinyint(1) DEFAULT 0 COMMENT 'In Case node is element of list type and is a list element (to be used only in case node_type is List)',
  `is_application_node` tinyint(1) DEFAULT 0,
  `preference` int(11) DEFAULT NULL COMMENT 'in case of listing position of element',
  `menu_flag` int(11) DEFAULT NULL,
  `dcs` int(11) DEFAULT 0,
  `application_id` int(11) DEFAULT 0 COMMENT 'Application id in case the node is To Application',
  `variable_name` int(11) DEFAULT 0,
  `variable_value` varchar(100) DEFAULT NULL,
  `switch_service_id` int(11) DEFAULT NULL COMMENT 'Service id in case the node is Switch to Other Service Code from tbl_service_master',
  `switch_service_code` varchar(50) DEFAULT NULL COMMENT 'Service code in case the node is Switch to Other Service Code from tbl_service_master',
  `circle_id` varchar(50) DEFAULT NULL,
  `operator_id` varchar(50) DEFAULT NULL,
  `if_clause` int(11) DEFAULT NULL COMMENT 'Variable id for which if statement needs to be performed',
  `if_value_clause` varchar(100) DEFAULT NULL COMMENT 'Variable value for which if statement needs to be performed on true this node will be shown else ignored',
  `version_major` int(11) DEFAULT 1,
  `version_minor` int(11) DEFAULT 0,
  `created_on` datetime DEFAULT current_timestamp(),
  `last_modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbl_service_nodes_archive`
--

DROP TABLE IF EXISTS `tbl_service_nodes_archive`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_service_nodes_archive` (
  `node_id` int(11) NOT NULL DEFAULT 0,
  `parent_id` int(11) NOT NULL,
  `status` int(11) DEFAULT 1,
  `service_id` int(11) NOT NULL,
  `parent_service_id` int(11) DEFAULT NULL,
  `service_code` varchar(50) NOT NULL,
  `request_text` varchar(250) DEFAULT NULL,
  `response_text` varchar(1000) DEFAULT NULL,
  `regex` varchar(1000) DEFAULT NULL COMMENT 'Regular Expression validation for the current node',
  `invalid_response_text` varchar(1000) DEFAULT NULL COMMENT 'Invalid response text in case the regex validation fails',
  `invalid_menu_flag` int(11) DEFAULT NULL COMMENT 'Menu flag (Notify or continue session) in case the regex validation fails',
  `node_type` int(11) DEFAULT NULL COMMENT 'List, Single Element, Notification, To Application, Switch to Other Service Code',
  `is_header` tinyint(1) DEFAULT 0 COMMENT 'In Case node is element of list type and is a header (to be used only in case node_type is List)',
  `is_footer` tinyint(1) DEFAULT 0 COMMENT 'In Case node is element of list type and is a footer (to be used only in case node_type is List)',
  `is_list_element` tinyint(1) DEFAULT 0 COMMENT 'In Case node is element of list type and is a list element (to be used only in case node_type is List)',
  `is_application_node` tinyint(1) DEFAULT 0,
  `preference` int(11) DEFAULT NULL COMMENT 'in case of listing position of element',
  `menu_flag` int(11) DEFAULT NULL,
  `dcs` int(11) DEFAULT 0,
  `application_id` int(11) DEFAULT 0 COMMENT 'Application id in case the node is To Application',
  `variable_name` int(11) DEFAULT 0,
  `variable_value` varchar(100) DEFAULT NULL,
  `switch_service_id` int(11) DEFAULT NULL COMMENT 'Service id in case the node is Switch to Other Service Code from tbl_service_master',
  `switch_service_code` varchar(50) DEFAULT NULL COMMENT 'Service code in case the node is Switch to Other Service Code from tbl_service_master',
  `circle_id` varchar(50) DEFAULT NULL,
  `operator_id` varchar(50) DEFAULT NULL,
  `if_clause` int(11) DEFAULT NULL COMMENT 'Variable id for which if statement needs to be performed',
  `if_value_clause` varchar(5000) DEFAULT NULL COMMENT 'Variable value for which if statement needs to be performed on true this node will be shown else ignored',
  `created_on` datetime DEFAULT current_timestamp(),
  `last_modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbl_service_nodes_backup24`
--

DROP TABLE IF EXISTS `tbl_service_nodes_backup24`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_service_nodes_backup24` (
  `node_id` int(11) NOT NULL DEFAULT 0,
  `parent_id` int(11) NOT NULL,
  `status` int(11) DEFAULT 1,
  `service_id` int(11) NOT NULL,
  `service_code` varchar(50) NOT NULL,
  `request_text` varchar(250) NOT NULL,
  `response_text` varchar(1000) NOT NULL,
  `regex` varchar(1000) NOT NULL COMMENT 'Regular Expression validation for the current node',
  `invalid_response_text` varchar(1000) DEFAULT NULL COMMENT 'Invalid response text in case the regex validation fails',
  `invalid_menu_flag` int(11) DEFAULT NULL COMMENT 'Menu flag (Notify or continue session) in case the regex validation fails',
  `node_type` int(11) NOT NULL COMMENT 'List, Single Element, Notification, To Application, Switch to Other Service Code',
  `is_header` tinyint(1) DEFAULT 0 COMMENT 'In Case node is element of list type and is a header (to be used only in case node_type is List)',
  `is_footer` tinyint(1) DEFAULT 0 COMMENT 'In Case node is element of list type and is a footer (to be used only in case node_type is List)',
  `is_list_element` tinyint(1) DEFAULT 0 COMMENT 'In Case node is element of list type and is a list element (to be used only in case node_type is List)',
  `is_application_node` tinyint(1) DEFAULT 0,
  `preference` int(11) DEFAULT NULL COMMENT 'in case of listing position of element',
  `menu_flag` int(11) NOT NULL,
  `dcs` int(11) NOT NULL DEFAULT 0,
  `application_id` int(11) DEFAULT 0 COMMENT 'Application id in case the node is To Application',
  `variable_name` int(11) DEFAULT 0,
  `variable_value` varchar(100) DEFAULT NULL,
  `switch_service_id` int(11) DEFAULT NULL COMMENT 'Service id in case the node is Switch to Other Service Code from tbl_service_master',
  `switch_service_code` varchar(50) DEFAULT NULL COMMENT 'Service code in case the node is Switch to Other Service Code from tbl_service_master',
  `circle_id` varchar(50) DEFAULT NULL,
  `operator_id` varchar(50) DEFAULT NULL,
  `if_clause` int(11) DEFAULT NULL COMMENT 'Variable id for which if statement needs to be performed',
  `if_value_clause` varchar(100) DEFAULT NULL COMMENT 'Variable value for which if statement needs to be performed on true this node will be shown else ignored',
  `created_on` datetime DEFAULT current_timestamp(),
  `last_modified` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbl_service_nodes_bkp_864`
--

DROP TABLE IF EXISTS `tbl_service_nodes_bkp_864`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_service_nodes_bkp_864` (
  `node_id` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL,
  `status` int(11) DEFAULT 1,
  `service_id` int(11) NOT NULL,
  `parent_service_id` int(11) DEFAULT NULL,
  `service_code` varchar(50) NOT NULL,
  `request_text` varchar(250) DEFAULT NULL,
  `response_text` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL,
  `regex` varchar(1000) DEFAULT NULL COMMENT 'Regular Expression validation for the current node',
  `invalid_response_text` varchar(1000) DEFAULT NULL COMMENT 'Invalid response text in case the regex validation fails',
  `invalid_menu_flag` int(11) DEFAULT NULL COMMENT 'Menu flag (Notify or continue session) in case the regex validation fails',
  `node_type` int(11) DEFAULT NULL COMMENT 'List, Single Element, Notification, To Application, Switch to Other Service Code',
  `is_header` tinyint(1) DEFAULT 0 COMMENT 'In Case node is element of list type and is a header (to be used only in case node_type is List)',
  `is_footer` tinyint(1) DEFAULT 0 COMMENT 'In Case node is element of list type and is a footer (to be used only in case node_type is List)',
  `is_list_element` tinyint(1) DEFAULT 0 COMMENT 'In Case node is element of list type and is a list element (to be used only in case node_type is List)',
  `is_application_node` tinyint(1) DEFAULT 0,
  `preference` int(11) DEFAULT NULL COMMENT 'in case of listing position of element',
  `menu_flag` int(11) DEFAULT NULL,
  `dcs` int(11) DEFAULT 0,
  `application_id` int(11) DEFAULT 0 COMMENT 'Application id in case the node is To Application',
  `variable_name` int(11) DEFAULT 0,
  `variable_value` varchar(100) DEFAULT NULL,
  `switch_service_id` int(11) DEFAULT NULL COMMENT 'Service id in case the node is Switch to Other Service Code from tbl_service_master',
  `switch_service_code` varchar(50) DEFAULT NULL COMMENT 'Service code in case the node is Switch to Other Service Code from tbl_service_master',
  `circle_id` varchar(50) DEFAULT NULL,
  `operator_id` varchar(50) DEFAULT NULL,
  `if_clause` int(11) DEFAULT NULL COMMENT 'Variable id for which if statement needs to be performed',
  `if_value_clause` varchar(100) DEFAULT NULL COMMENT 'Variable value for which if statement needs to be performed on true this node will be shown else ignored',
  `version_major` int(11) DEFAULT 1,
  `version_minor` int(11) DEFAULT 0,
  `created_on` datetime DEFAULT current_timestamp(),
  `last_modified` datetime DEFAULT NULL,
  `sequence_no` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbl_service_nodes_revision`
--

DROP TABLE IF EXISTS `tbl_service_nodes_revision`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_service_nodes_revision` (
  `node_id` int(11) NOT NULL DEFAULT 0,
  `parent_id` int(11) NOT NULL,
  `status` int(11) DEFAULT 1,
  `service_id` int(11) NOT NULL,
  `parent_service_id` int(11) DEFAULT NULL,
  `service_code` varchar(50) NOT NULL,
  `request_text` varchar(250) DEFAULT NULL,
  `response_text` varchar(1000) DEFAULT NULL,
  `regex` varchar(1000) DEFAULT NULL COMMENT 'Regular Expression validation for the current node',
  `invalid_response_text` varchar(1000) DEFAULT NULL COMMENT 'Invalid response text in case the regex validation fails',
  `invalid_menu_flag` int(11) DEFAULT NULL COMMENT 'Menu flag (Notify or continue session) in case the regex validation fails',
  `node_type` int(11) DEFAULT NULL COMMENT 'List, Single Element, Notification, To Application, Switch to Other Service Code',
  `is_header` tinyint(1) DEFAULT 0 COMMENT 'In Case node is element of list type and is a header (to be used only in case node_type is List)',
  `is_footer` tinyint(1) DEFAULT 0 COMMENT 'In Case node is element of list type and is a footer (to be used only in case node_type is List)',
  `is_list_element` tinyint(1) DEFAULT 0 COMMENT 'In Case node is element of list type and is a list element (to be used only in case node_type is List)',
  `is_application_node` tinyint(1) DEFAULT 0,
  `preference` int(11) DEFAULT NULL COMMENT 'in case of listing position of element',
  `menu_flag` int(11) DEFAULT NULL,
  `dcs` int(11) DEFAULT 0,
  `application_id` int(11) DEFAULT 0 COMMENT 'Application id in case the node is To Application',
  `variable_name` int(11) DEFAULT 0,
  `variable_value` varchar(100) DEFAULT NULL,
  `switch_service_id` int(11) DEFAULT NULL COMMENT 'Service id in case the node is Switch to Other Service Code from tbl_service_master',
  `switch_service_code` varchar(50) DEFAULT NULL COMMENT 'Service code in case the node is Switch to Other Service Code from tbl_service_master',
  `circle_id` varchar(50) DEFAULT NULL,
  `operator_id` varchar(50) DEFAULT NULL,
  `if_clause` int(11) DEFAULT NULL COMMENT 'Variable id for which if statement needs to be performed',
  `if_value_clause` varchar(5000) DEFAULT NULL COMMENT 'Variable value for which if statement needs to be performed on true this node will be shown else ignored',
  `version_major` int(11) DEFAULT 0,
  `version_minor` int(11) DEFAULT 0,
  `created_on` datetime DEFAULT current_timestamp(),
  `last_modified` datetime DEFAULT NULL,
  `sequence_no` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbl_service_nodes_t`
--

DROP TABLE IF EXISTS `tbl_service_nodes_t`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_service_nodes_t` (
  `node_id` int(11) DEFAULT NULL,
  `parent_id` int(11) NOT NULL,
  `status` int(11) DEFAULT 1,
  `service_id` int(11) NOT NULL,
  `parent_service_id` int(11) DEFAULT NULL,
  `service_code` varchar(50) NOT NULL,
  `request_text` varchar(250) DEFAULT NULL,
  `response_text` varchar(1000) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `regex` varchar(1000) DEFAULT NULL COMMENT 'Regular Expression validation for the current node',
  `invalid_response_text` varchar(1000) DEFAULT NULL COMMENT 'Invalid response text in case the regex validation fails',
  `invalid_menu_flag` int(11) DEFAULT NULL COMMENT 'Menu flag (Notify or continue session) in case the regex validation fails',
  `node_type` int(11) DEFAULT NULL COMMENT 'List, Single Element, Notification, To Application, Switch to Other Service Code',
  `is_header` tinyint(1) DEFAULT 0 COMMENT 'In Case node is element of list type and is a header (to be used only in case node_type is List)',
  `is_footer` tinyint(1) DEFAULT 0 COMMENT 'In Case node is element of list type and is a footer (to be used only in case node_type is List)',
  `is_list_element` tinyint(1) DEFAULT 0 COMMENT 'In Case node is element of list type and is a list element (to be used only in case node_type is List)',
  `is_application_node` tinyint(1) DEFAULT 0,
  `preference` int(11) DEFAULT NULL COMMENT 'in case of listing position of element',
  `menu_flag` int(11) DEFAULT NULL,
  `dcs` int(11) DEFAULT 0,
  `application_id` int(11) DEFAULT 0 COMMENT 'Application id in case the node is To Application',
  `variable_name` int(11) DEFAULT 0,
  `variable_value` varchar(100) DEFAULT NULL,
  `switch_service_id` int(11) DEFAULT NULL COMMENT 'Service id in case the node is Switch to Other Service Code from tbl_service_master',
  `switch_service_code` varchar(50) DEFAULT NULL COMMENT 'Service code in case the node is Switch to Other Service Code from tbl_service_master',
  `circle_id` varchar(50) DEFAULT NULL,
  `operator_id` varchar(50) DEFAULT NULL,
  `if_clause` int(11) DEFAULT NULL COMMENT 'Variable id for which if statement needs to be performed',
  `if_value_clause` varchar(100) DEFAULT NULL COMMENT 'Variable value for which if statement needs to be performed on true this node will be shown else ignored',
  `version_major` int(11) DEFAULT 1,
  `version_minor` int(11) DEFAULT 0,
  `created_on` datetime DEFAULT current_timestamp(),
  `last_modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbl_service_nodes_t1`
--

DROP TABLE IF EXISTS `tbl_service_nodes_t1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_service_nodes_t1` (
  `node_id` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL,
  `status` int(11) DEFAULT 1,
  `service_id` int(11) NOT NULL,
  `parent_service_id` int(11) DEFAULT NULL,
  `service_code` varchar(50) NOT NULL,
  `request_text` varchar(250) DEFAULT NULL,
  `response_text` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL,
  `regex` varchar(1000) DEFAULT NULL COMMENT 'Regular Expression validation for the current node',
  `invalid_response_text` varchar(1000) DEFAULT NULL COMMENT 'Invalid response text in case the regex validation fails',
  `invalid_menu_flag` int(11) DEFAULT NULL COMMENT 'Menu flag (Notify or continue session) in case the regex validation fails',
  `node_type` int(11) DEFAULT NULL COMMENT 'List, Single Element, Notification, To Application, Switch to Other Service Code',
  `is_header` tinyint(1) DEFAULT 0 COMMENT 'In Case node is element of list type and is a header (to be used only in case node_type is List)',
  `is_footer` tinyint(1) DEFAULT 0 COMMENT 'In Case node is element of list type and is a footer (to be used only in case node_type is List)',
  `is_list_element` tinyint(1) DEFAULT 0 COMMENT 'In Case node is element of list type and is a list element (to be used only in case node_type is List)',
  `is_application_node` tinyint(1) DEFAULT 0,
  `preference` int(11) DEFAULT NULL COMMENT 'in case of listing position of element',
  `menu_flag` int(11) DEFAULT NULL,
  `dcs` int(11) DEFAULT 0,
  `application_id` int(11) DEFAULT 0 COMMENT 'Application id in case the node is To Application',
  `variable_name` int(11) DEFAULT 0,
  `variable_value` varchar(100) DEFAULT NULL,
  `switch_service_id` int(11) DEFAULT NULL COMMENT 'Service id in case the node is Switch to Other Service Code from tbl_service_master',
  `switch_service_code` varchar(50) DEFAULT NULL COMMENT 'Service code in case the node is Switch to Other Service Code from tbl_service_master',
  `circle_id` varchar(50) DEFAULT NULL,
  `operator_id` varchar(50) DEFAULT NULL,
  `if_clause` int(11) DEFAULT NULL COMMENT 'Variable id for which if statement needs to be performed',
  `if_value_clause` varchar(100) DEFAULT NULL COMMENT 'Variable value for which if statement needs to be performed on true this node will be shown else ignored',
  `version_major` int(11) DEFAULT 1,
  `version_minor` int(11) DEFAULT 0,
  `created_on` datetime DEFAULT current_timestamp(),
  `last_modified` datetime DEFAULT NULL,
  `sequence_no` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`node_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbl_service_nodes_temp`
--

DROP TABLE IF EXISTS `tbl_service_nodes_temp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_service_nodes_temp` (
  `node_id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL,
  `status` int(11) DEFAULT 1,
  `service_id` int(11) NOT NULL,
  `parent_service_id` int(11) DEFAULT NULL,
  `service_code` varchar(50) NOT NULL,
  `request_text` varchar(250) DEFAULT NULL,
  `response_text` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL,
  `regex` varchar(1000) DEFAULT NULL COMMENT 'Regular Expression validation for the current node',
  `invalid_response_text` varchar(1000) DEFAULT NULL COMMENT 'Invalid response text in case the regex validation fails',
  `invalid_menu_flag` int(11) DEFAULT NULL COMMENT 'Menu flag (Notify or continue session) in case the regex validation fails',
  `node_type` int(11) DEFAULT NULL COMMENT 'List, Single Element, Notification, To Application, Switch to Other Service Code',
  `is_header` tinyint(1) DEFAULT 0 COMMENT 'In Case node is element of list type and is a header (to be used only in case node_type is List)',
  `is_footer` tinyint(1) DEFAULT 0 COMMENT 'In Case node is element of list type and is a footer (to be used only in case node_type is List)',
  `is_list_element` tinyint(1) DEFAULT 0 COMMENT 'In Case node is element of list type and is a list element (to be used only in case node_type is List)',
  `is_application_node` tinyint(1) DEFAULT 0,
  `preference` int(11) DEFAULT NULL COMMENT 'in case of listing position of element',
  `menu_flag` int(11) DEFAULT NULL,
  `dcs` int(11) DEFAULT 0,
  `application_id` int(11) DEFAULT 0 COMMENT 'Application id in case the node is To Application',
  `variable_name` int(11) DEFAULT 0,
  `variable_value` varchar(100) DEFAULT NULL,
  `switch_service_id` int(11) DEFAULT NULL COMMENT 'Service id in case the node is Switch to Other Service Code from tbl_service_master',
  `switch_service_code` varchar(50) DEFAULT NULL COMMENT 'Service code in case the node is Switch to Other Service Code from tbl_service_master',
  `circle_id` varchar(50) DEFAULT NULL,
  `operator_id` varchar(50) DEFAULT NULL,
  `if_clause` int(11) DEFAULT NULL COMMENT 'Variable id for which if statement needs to be performed',
  `if_value_clause` varchar(5000) DEFAULT NULL COMMENT 'Variable value for which if statement needs to be performed on true this node will be shown else ignored',
  `version_major` int(11) DEFAULT 0,
  `version_minor` int(11) DEFAULT 0,
  `created_on` datetime DEFAULT current_timestamp(),
  `last_modified` datetime DEFAULT NULL,
  `sequence_no` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`node_id`)
) ENGINE=InnoDB AUTO_INCREMENT=165620 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbl_service_request`
--

DROP TABLE IF EXISTS `tbl_service_request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_service_request` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `service_id` int(11) DEFAULT NULL,
  `service_code` varchar(200) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `desc` varchar(250) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `assignee` int(11) DEFAULT NULL,
  `target_date` datetime DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `assignee` (`assignee`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbl_service_request_archive`
--

DROP TABLE IF EXISTS `tbl_service_request_archive`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_service_request_archive` (
  `id` int(11) NOT NULL DEFAULT 0,
  `name` varchar(100) DEFAULT NULL,
  `desc` varchar(250) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `assignee` int(11) DEFAULT NULL,
  `target_date` datetime DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbl_service_request_comment`
--

DROP TABLE IF EXISTS `tbl_service_request_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_service_request_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login_id` int(11) DEFAULT NULL,
  `service_req_id` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `comment` longtext DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `last_modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbl_service_request_comment_archive`
--

DROP TABLE IF EXISTS `tbl_service_request_comment_archive`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_service_request_comment_archive` (
  `id` int(11) NOT NULL DEFAULT 0,
  `login_id` int(11) DEFAULT NULL,
  `service_req_id` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `comment` longtext DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `last_modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbl_service_request_hist`
--

DROP TABLE IF EXISTS `tbl_service_request_hist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_service_request_hist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sr_id` int(11) DEFAULT NULL,
  `assignee` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sr_id` (`sr_id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbl_sevice_nodes_32`
--

DROP TABLE IF EXISTS `tbl_sevice_nodes_32`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_sevice_nodes_32` (
  `node_id` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL,
  `status` int(11) DEFAULT 1,
  `service_id` int(11) NOT NULL,
  `parent_service_id` int(11) DEFAULT NULL,
  `service_code` varchar(50) NOT NULL,
  `request_text` varchar(250) DEFAULT NULL,
  `response_text` varchar(1000) DEFAULT NULL,
  `regex` varchar(1000) DEFAULT NULL COMMENT 'Regular Expression validation for the current node',
  `invalid_response_text` varchar(1000) DEFAULT NULL COMMENT 'Invalid response text in case the regex validation fails',
  `invalid_menu_flag` int(11) DEFAULT NULL COMMENT 'Menu flag (Notify or continue session) in case the regex validation fails',
  `node_type` int(11) DEFAULT NULL COMMENT 'List, Single Element, Notification, To Application, Switch to Other Service Code',
  `is_header` tinyint(1) DEFAULT 0 COMMENT 'In Case node is element of list type and is a header (to be used only in case node_type is List)',
  `is_footer` tinyint(1) DEFAULT 0 COMMENT 'In Case node is element of list type and is a footer (to be used only in case node_type is List)',
  `is_list_element` tinyint(1) DEFAULT 0 COMMENT 'In Case node is element of list type and is a list element (to be used only in case node_type is List)',
  `is_application_node` tinyint(1) DEFAULT 0,
  `preference` int(11) DEFAULT NULL COMMENT 'in case of listing position of element',
  `menu_flag` int(11) DEFAULT NULL,
  `dcs` int(11) DEFAULT 0,
  `application_id` int(11) DEFAULT 0 COMMENT 'Application id in case the node is To Application',
  `variable_name` int(11) DEFAULT 0,
  `variable_value` varchar(100) DEFAULT NULL,
  `switch_service_id` int(11) DEFAULT NULL COMMENT 'Service id in case the node is Switch to Other Service Code from tbl_service_master',
  `switch_service_code` varchar(50) DEFAULT NULL COMMENT 'Service code in case the node is Switch to Other Service Code from tbl_service_master',
  `circle_id` varchar(50) DEFAULT NULL,
  `operator_id` varchar(50) DEFAULT NULL,
  `if_clause` int(11) DEFAULT NULL COMMENT 'Variable id for which if statement needs to be performed',
  `if_value_clause` varchar(100) DEFAULT NULL COMMENT 'Variable value for which if statement needs to be performed on true this node will be shown else ignored',
  `version_major` int(11) DEFAULT 1,
  `version_minor` int(11) DEFAULT 0,
  `created_on` datetime DEFAULT current_timestamp(),
  `last_modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbl_trigger`
--

DROP TABLE IF EXISTS `tbl_trigger`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_trigger` (
  `trigger_id` int(11) NOT NULL AUTO_INCREMENT,
  `service_id` int(11) NOT NULL,
  `deployment_id` int(11) DEFAULT NULL,
  `deployment_type` varchar(100) DEFAULT NULL,
  `deployment_date` timestamp NULL DEFAULT NULL,
  `status` int(11) DEFAULT 1,
  `login_id` int(11) DEFAULT NULL,
  `created_on` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`trigger_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3928 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbl_url_handler`
--

DROP TABLE IF EXISTS `tbl_url_handler`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_url_handler` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `baseUrl` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fields` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbl_url_mapping`
--

DROP TABLE IF EXISTS `tbl_url_mapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_url_mapping` (
  `url_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `url` varchar(1000) DEFAULT NULL,
  `original_data` text DEFAULT NULL,
  `timeout` varchar(50) DEFAULT '0',
  PRIMARY KEY (`url_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1924 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbl_url_mapping_list`
--

DROP TABLE IF EXISTS `tbl_url_mapping_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_url_mapping_list` (
  `URL_ID` int(11) NOT NULL AUTO_INCREMENT,
  `baseURL` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `original_data` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`URL_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbl_url_variable`
--

DROP TABLE IF EXISTS `tbl_url_variable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_url_variable` (
  `variable_id` int(10) NOT NULL AUTO_INCREMENT,
  `variable_name` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`variable_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbl_user_status_master`
--

DROP TABLE IF EXISTS `tbl_user_status_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_user_status_master` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_status_id` int(11) DEFAULT NULL,
  `status_desc` varchar(200) DEFAULT NULL,
  `status_type` varchar(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_status` (`user_status_id`,`status_type`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbl_users_master`
--

DROP TABLE IF EXISTS `tbl_users_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_users_master` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_type` int(11) DEFAULT NULL COMMENT 'Role alloted to user/Bulk/Reseller',
  `username` varchar(100) DEFAULT NULL COMMENT 'Unique user name',
  `msisdn` varchar(15) DEFAULT NULL COMMENT 'user mobile number',
  `email` varchar(100) DEFAULT NULL,
  `status` int(11) DEFAULT 1 COMMENT 'Blocked/Active/Barred/Inactive/Configuration Penging',
  `um_permission` varchar(10) DEFAULT '0',
  `sc_permission` varchar(10) DEFAULT '0',
  `password` varchar(200) DEFAULT NULL COMMENT 'Encrypted password',
  `created_by` int(11) DEFAULT 0 COMMENT 'same as Parent id',
  `created_date` datetime DEFAULT NULL,
  `modified_by` int(11) DEFAULT 0 COMMENT 'id of person who modified',
  `last_modified` datetime DEFAULT '0000-00-00 00:00:00',
  `password_retry_limit` int(11) DEFAULT 5 COMMENT 'retry limit given 5 times default to every user',
  `password_retry_count` int(11) DEFAULT 0 COMMENT 'current retry limit. counter will increase every time user  enters wrong password',
  `last_password1` varchar(200) DEFAULT NULL COMMENT 'last password',
  `last_password2` varchar(200) DEFAULT NULL COMMENT 'second last password',
  `last_password3` varchar(200) DEFAULT NULL COMMENT 'third last password',
  `last_login_date` datetime DEFAULT NULL,
  `blocked_datetime` datetime DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username_key` (`username`),
  KEY `user_type` (`user_type`),
  CONSTRAINT `tbl_users_master_ibfk_1` FOREIGN KEY (`user_type`) REFERENCES `tbl_ma_user_type` (`id`),
  CONSTRAINT `tbl_users_master_ibfk_2` FOREIGN KEY (`user_type`) REFERENCES `tbl_ma_user_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=83 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbl_users_master_archive`
--

DROP TABLE IF EXISTS `tbl_users_master_archive`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_users_master_archive` (
  `user_id` int(11) NOT NULL DEFAULT 0,
  `user_type` int(11) DEFAULT NULL COMMENT 'Role alloted to user/Bulk/Reseller',
  `username` varchar(100) CHARACTER SET utf8 DEFAULT NULL COMMENT 'Unique user name',
  `msisdn` varchar(15) CHARACTER SET utf8 DEFAULT NULL COMMENT 'user mobile number',
  `email` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `status` int(11) DEFAULT 1 COMMENT 'Blocked/Active/Barred/Inactive/Configuration Penging',
  `um_permission` varchar(10) CHARACTER SET utf8 DEFAULT '0',
  `sc_permission` varchar(10) CHARACTER SET utf8 DEFAULT '0',
  `password` varchar(200) CHARACTER SET utf8 DEFAULT NULL COMMENT 'Encrypted password',
  `created_by` int(11) DEFAULT 0 COMMENT 'same as Parent id',
  `created_date` datetime DEFAULT NULL,
  `modified_by` int(11) DEFAULT 0 COMMENT 'id of person who modified',
  `last_modified` datetime DEFAULT '0000-00-00 00:00:00',
  `password_retry_limit` int(11) DEFAULT 5 COMMENT 'retry limit given 5 times default to every user',
  `password_retry_count` int(11) DEFAULT 0 COMMENT 'current retry limit. counter will increase every time user  enters wrong password',
  `last_password1` varchar(200) CHARACTER SET utf8 DEFAULT NULL COMMENT 'last password',
  `last_password2` varchar(200) CHARACTER SET utf8 DEFAULT NULL COMMENT 'second last password',
  `last_password3` varchar(200) CHARACTER SET utf8 DEFAULT NULL COMMENT 'third last password',
  `last_login_date` datetime DEFAULT NULL,
  `blocked_datetime` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbl_variable_api_mapping`
--

DROP TABLE IF EXISTS `tbl_variable_api_mapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_variable_api_mapping` (
  `app_id` int(11) DEFAULT NULL,
  `variable_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbl_variable_master`
--

DROP TABLE IF EXISTS `tbl_variable_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_variable_master` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `variable_id` int(11) NOT NULL,
  `variable_name` varchar(100) NOT NULL,
  `variable_type` int(11) NOT NULL COMMENT '1 - User Input,2 - System Defined',
  `variable_regex` varchar(500) DEFAULT NULL,
  `status` int(11) DEFAULT 1,
  `created_on` datetime DEFAULT current_timestamp(),
  `last_modified` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_varid_type` (`variable_id`,`variable_type`)
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `testing`
--

DROP TABLE IF EXISTS `testing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `testing` (
  `id` int(11) DEFAULT NULL,
  `str` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `x`
--

DROP TABLE IF EXISTS `x`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `x` (
  `name` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping routines for database 'umbsc_live_test1'
--
/*!50003 DROP PROCEDURE IF EXISTS `create_menu_file` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `create_menu_file`(IN pParentId INT,IN pLevel INT,IN pInMenu varchar(100),IN pServiceId INT,IN pReqText VARCHAR(200),IN pIfClauseValue VARCHAR(200))
BEGIN
  
  DECLARE done INT DEFAULT FALSE;
  DECLARE vId,vParentId,vNodeType,vAppMtype,vParentIsListEleVal,vChildListElement INT;
  DECLARE vMenuFlag,vIsHeader,vIsFooter,vIsListElement,vIsApplicationNode,vApplicationId,vVariableName,vIfClause,vPreference INT;
  DECLARE vChildCount,vCurrentCount,vNumbering INT;
  DECLARE vTitle,subTitle,vTitleMore,vHeaderText,vFooterText,vServiceCode,vSwithServiceCode,vRegex,vRequestText,vVariableValue,vIfClauseValue, vInvalidResponseText VARCHAR(250);
  DECLARE vOutMenuName VARCHAR(100);
  
  
  
  
  DECLARE C1 CURSOR FOR
	SELECT node_id,parent_id,request_text,response_text,node_type,menu_flag,is_header,is_footer,is_list_element,`is_application_node`,
	application_id,switch_service_code,regex,variable_name,variable_value,if_clause,if_value_clause, preference, invalid_response_text
	FROM `tbl_service_nodes` 
	WHERE STATUS =1 
	AND service_id=pServiceId
	AND parent_id = pParentId 
	AND is_header=0 and is_footer=0
	ORDER BY `preference` ASC;
	  
  DECLARE C2 CURSOR FOR
	SELECT response_text,is_list_element
	FROM `tbl_service_nodes` 
	WHERE STATUS =1 
	AND service_id=pServiceId
	AND parent_id = pParentId
	AND is_list_element in (1,2) 
	ORDER BY `preference` ASC;
  
  DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
    
  SET @@SESSION.max_sp_recursion_depth=100;
  IF pParentId = 0 THEN
	DROP TABLE IF EXISTS _menu;
  END IF;
  
  
  
  CREATE TEMPORARY TABLE IF NOT EXISTS _menu (service_code VARCHAR(50),request_text VARCHAR(500),response_text VARCHAR(500),`continue_flag` INT,`dcs` INT,app_id INT,in_menu VARCHAR(100),out_menu VARCHAR(100), `variable` INT,`variable_value` VARCHAR(100), `switched_service_code` VARCHAR(100),`if_clause` INT,`if_clause_value` VARCHAR(50),UNIQUE KEY(request_text,in_menu,out_menu));
  
  SELECT service_code INTO vServiceCode
  FROM tbl_service_master
  WHERE service_id=pServiceId LIMIT 1;
  
  SET pIfClauseValue=IFNULL(pIfClauseValue,'NA');
	
  
  SET pLevel = pLevel +1;
  SET vCurrentCount=0;
  OPEN C1;
	read_loop: LOOP
        FETCH C1 INTO vId,vParentId,vRequestText,vTitle,vNodeType,vMenuFlag,vIsHeader,vIsFooter,vIsListElement,vIsApplicationNode,
        	vApplicationId,vSwithServiceCode,vRegex,vVariableName,vVariableValue,vIfClause,vIfClauseValue,vPreference,vInvalidResponseText;
        	IF done THEN
            LEAVE read_loop;
    		END IF;
    
    SET vTitle=REPLACE(vTitle,'\r\n','^');
    SET vTitle=REPLACE(vTitle,'\r','^');
	SET vTitle=REPLACE(vTitle,'\n','^');
	
	    
	SET vCurrentCount = vCurrentCount +1;
	      
    
	      
	IF vIsApplicationNode = 1 THEN
	   		SET pReqText=vRequestText;
	   		CALL create_menu_file(vId,pLevel,pInMenu,pServiceId,pReqText,NULL);
	ELSEIF vIsApplicationNode = 2 THEN
	   		
	   		CALL create_menu_file(vId,pLevel,pInMenu,pServiceId,pReqText,vIfClauseValue);
	ELSE	   
		 
		IF vVariableValue IS NOT NULL THEN
			IF vNodeType <> 1 OR (vNodeType =1 AND vCurrentCount =1) THEN
			
				SET vOutMenuName=CONCAT("MENU",vId,'_',vVariableName);
				INSERT IGNORE INTO _menu(service_code,request_text,response_text,continue_flag,dcs,app_id,in_menu,out_menu,variable,variable_value,switched_service_code,`if_clause`,`if_clause_value`)
					VALUES (vServiceCode,pReqText,'Dummy Menu',4,0,0,pInMenu,vOutMenuName,vVariableName,'0','NA',0,pIfClauseValue);
	
				SET vVariableName=0;
				SET pInMenu=vOutMenuName;	
			END IF;
		ELSE
			SET vVariableValue='0';
		
			
		END IF;
		
			      
	   	IF vNodeType = 1 THEN
			IF vCurrentCount = 1 THEN
				SET vTitle="";
				
				SELECT response_text INTO vHeaderText
				FROM `tbl_service_nodes` 
				WHERE `status` =1
				AND parent_id = pParentId 
				AND service_id=pServiceId
				AND is_header=1;
				
				IF CHAR_LENGTH(vHeaderText) > 0 THEN
						SET vHeaderText=REPLACE(vHeaderText,'\r\n','^');
    					SET vHeaderText=REPLACE(vHeaderText,'\r','^');
						SET vHeaderText=REPLACE(vHeaderText,'\n','^');
					SET vTitle=CONCAT(vTitle,vHeaderText,'^');
				END IF;
				
				SELECT is_list_element INTO vParentIsListEleVal
				FROM `tbl_service_nodes` 
				WHERE `status` =1
				AND node_id = pParentId 
				AND service_id=pServiceId;
				
				IF vParentIsListEleVal = 2 THEN
					
					SELECT COUNT(1) INTO vNumbering 
					FROM `tbl_service_nodes` 
					WHERE `status` =1
					AND parent_id = pParentId 
					AND service_id=pServiceId
					AND is_list_element =1;
				
					
				ELSE
					SET vNumbering=0;	
				END IF;
				
				SET done = false;
				OPEN C2;
					read_loop_2: LOOP
						
						FETCH C2 INTO subTitle,vChildListElement;
						
						IF done THEN
							SET done = false; 
							LEAVE read_loop_2;
						END IF;
						
						SET subTitle=REPLACE(subTitle,'\r\n','^');
    					SET subTitle=REPLACE(subTitle,'\r','^');
						SET subTitle=REPLACE(subTitle,'\n','^');
						
						SET vNumbering = vNumbering +1;
						IF vChildListElement =2 THEN 
							SET vTitle=CONCAT(vTitle,'99 ',subTitle,'^');
						ELSE
							SET vTitle=CONCAT(vTitle,vNumbering,' ',subTitle,'^');
						END IF;
						 
					END LOOP read_loop_2;
				CLOSE C2;
				
				SELECT response_text INTO vFooterText 
				FROM `tbl_service_nodes` 
				WHERE STATUS =1
				AND parent_id = pParentId 
				AND service_id=pServiceId
				AND is_footer=1;
				
				
				
				IF CHAR_LENGTH(vFooterText) > 0 THEN
					SET vFooterText=REPLACE(vFooterText,'\r\n','^');
    					SET vFooterText=REPLACE(vFooterText,'\r','^');
						SET vFooterText=REPLACE(vFooterText,'\n','^');
					SET vTitle=CONCAT(vTitle,vFooterText);
				END IF;
				
				
				SET vOutMenuName=CONCAT("MENU",vId);
				
				INSERT INTO _menu(service_code,request_text,response_text,continue_flag,dcs,app_id,in_menu,out_menu,variable,variable_value,switched_service_code,`if_clause`,`if_clause_value`)
				VALUES (vServiceCode,pReqText,vTitle,vMenuFlag,0,0,pInMenu,vOutMenuName,vVariableName,vVariableValue,'NA',0,pIfClauseValue);
  
			END IF;
		
			CALL `proc_error_log`('create_menu_file check',809,CONCAT(pLevel,' - ',vCurrentCount,' - ',vId,'|',pLevel,'|',vOutMenuName,'|',pServiceId,'|',vCurrentCount,'|',vIsListElement,'|',vCurrentCount));
			IF vIsListElement = 2 THEN
				CALL create_menu_file(vId,pLevel,vOutMenuName,pServiceId,99,NULL);
			ELSE
				
				IF vIsListElement = 1 THEN
					
					SELECT IFNULL(is_list_element,0) INTO vParentIsListEleVal
					FROM `tbl_service_nodes` 
					WHERE `status` =1
					AND node_id = vParentId 
					AND service_id=pServiceId;
				
					
					IF vParentIsListEleVal = 2 THEN
				
						SELECT COUNT(1) INTO vNumbering 
						FROM `tbl_service_nodes` 
						WHERE `status` =1
						AND parent_id = pParentId 
						AND service_id=pServiceId
						AND is_list_element =1;
					
						SET vNumbering=IFNULL(vNumbering,0)+vCurrentCount;
						
					ELSE
						SET vNumbering=vCurrentCount;
					END IF;
				
					CALL create_menu_file(vId,pLevel,vOutMenuName,pServiceId,vNumbering,NULL);
					SET done = false; 
				
				END IF;
			END IF;
	
	   ELSEIF vNodeType = 2 THEN
	   		SET vOutMenuName=CONCAT("MENU",vId);	
			INSERT IGNORE INTO _menu(service_code,request_text,response_text,continue_flag,dcs,app_id,in_menu,out_menu,variable,variable_value,switched_service_code,`if_clause`,`if_clause_value`)
			VALUES (vServiceCode,pReqText,vTitle,vMenuFlag,0,vApplicationId,pInMenu,vOutMenuName,vVariableName,vVariableValue,'NA',0,pIfClauseValue);
			
			CALL create_menu_file(vId,pLevel,vOutMenuName,pServiceId,vRegex,NULL);
	
			IF CHAR_LENGTH(IFNULL(vInvalidResponseText,'')) > 0 THEN
				INSERT IGNORE INTO _menu(service_code,request_text,response_text,continue_flag,dcs,app_id,in_menu,out_menu,variable,variable_value,switched_service_code,`if_clause`,`if_clause_value`)
				VALUES (vServiceCode,'.*',vInvalidResponseText,0,0,0,vOutMenuName,'END',0,0,'NA',0,NULL);
			END IF; 
	      
	   ELSEIF vNodeType = 3 or vNodeType = 7 THEN
	   
	   		IF vMenuFlag = 30 THEN
	   			SELECT app_mtype INTO vAppMtype FROM `tbl_application_master`
	   			WHERE app_id =vApplicationId;
	   		ELSE
	   			SET vAppMtype=0;
	   		END IF;

			IF vNodeType = 7 and vMenuFlag = 7 THEN
				SET vTitle = "BACK MENU";
			ELSEIF vNodeType = 7 and vMenuFlag = 8 THEN
				SET vTitle = "MAIN MENU";
			END IF;
	   		
	   		SET vOutMenuName=CONCAT("MENU",vId);	
			INSERT IGNORE INTO _menu(service_code,request_text,response_text,continue_flag,dcs,app_id,in_menu,out_menu,variable,variable_value,switched_service_code,`if_clause`,`if_clause_value`)
			VALUES (vServiceCode,pReqText,vTitle,vMenuFlag,0,vAppMtype,pInMenu,vOutMenuName,vVariableName,vVariableValue,'NA',0,pIfClauseValue);
	      
	   	
	   ELSEIF vNodeType = 4 THEN
	   
	   		SELECT app_mtype INTO vAppMtype FROM `tbl_application_master`
	   		WHERE app_id =vApplicationId;
	   
	   		SET vOutMenuName=CONCAT("MENU",vId);	
			INSERT IGNORE INTO _menu(service_code,request_text,response_text,continue_flag,dcs,app_id,in_menu,out_menu,variable,variable_value,switched_service_code,`if_clause`,`if_clause_value`)
			VALUES (vServiceCode,pReqText,'To the Application',vMenuFlag,0,vAppMtype,pInMenu,vOutMenuName,vVariableName,vVariableValue,'NA',0,pIfClauseValue);
			CALL create_menu_file(vId,pLevel,vOutMenuName,pServiceId,pReqText,NULL);			
			
	   ELSEIF vNodeType = 5 THEN
	   		SET vOutMenuName=CONCAT("MENU",vId);	
			INSERT IGNORE INTO _menu(service_code,request_text,response_text,continue_flag,dcs,app_id,in_menu,out_menu,variable,variable_value,switched_service_code,`if_clause`,`if_clause_value`)
			VALUES (vServiceCode,pReqText,'Switch to Short Code',vMenuFlag,0,0,pInMenu,vOutMenuName,vVariableName,vVariableValue,vSwithServiceCode,0,pIfClauseValue);
			
	   ELSEIF vNodeType = 6 THEN
	   		SET vOutMenuName=CONCAT("MENU",vId);	
			INSERT IGNORE INTO _menu(service_code,request_text,response_text,continue_flag,dcs,app_id,in_menu,out_menu,variable,variable_value,switched_service_code,`if_clause`,`if_clause_value`)
			VALUES (vServiceCode,pReqText,'Dummy Menu - Logical check',4,0,0,pInMenu,vOutMenuName,vVariableName,vVariableValue,'NA',vIfClause,pIfClauseValue);
			CALL create_menu_file(vId,pLevel,vOutMenuName,pServiceId,pReqText,NULL);
	   END IF;
	   
	
	END IF;  
	      
	END LOOP read_loop;
  CLOSE C1;
  
IF pParentId = 0 THEN  
	SELECT * FROM _menu;
END IF;
  
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `create_menu_file_new` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `create_menu_file_new`(IN pParentId INT,IN pLevel INT,IN pInMenu varchar(100),IN pServiceId INT,IN pReqText VARCHAR(200),IN pIfClauseValue VARCHAR(200))
BEGIN
  
  DECLARE done INT DEFAULT FALSE;
  DECLARE vId,vParentId,vNodeType,vAppMtype,vParentIsListEleVal,vParentIdNodeMore,vChildListElement INT;
  DECLARE vMenuFlag,vIsHeader,vIsFooter,vIsListElement,vIsApplicationNode,vApplicationId,vVariableName,vIfClause,vPreference INT;
  DECLARE vChildCount,vCurrentCount,vNumbering INT;
  DECLARE vTitle,subTitle,vTitleMore,vHeaderText,vFooterText,vServiceCode,vSwithServiceCode,vRegex,vRequestText,vVariableValue,vIfClauseValue, vInvalidResponseText VARCHAR(250);
  DECLARE vOutMenuName VARCHAR(100);
  
  
  
  
  DECLARE C1 CURSOR FOR
	SELECT node_id,parent_id,request_text,response_text,node_type,menu_flag,is_header,is_footer,is_list_element,`is_application_node`,
	application_id,switch_service_code,regex,variable_name,variable_value,if_clause,if_value_clause, preference, invalid_response_text
	FROM `tbl_service_nodes` 
	WHERE STATUS =1 
	AND service_id=pServiceId
	AND parent_id = pParentId 
	AND is_header=0 and is_footer=0
	ORDER BY `preference` ASC;
	  
  DECLARE C2 CURSOR FOR
	SELECT response_text,is_list_element
	FROM `tbl_service_nodes` 
	WHERE STATUS =1 
	AND service_id=pServiceId
	AND parent_id = pParentId
	AND is_list_element in (1,2) 
	ORDER BY `preference` ASC;
  
  DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
    
  SET @@SESSION.max_sp_recursion_depth=100;
  IF pParentId = 0 THEN
	DROP TABLE IF EXISTS _menu;
  END IF;
  
  
  
  CREATE TEMPORARY TABLE IF NOT EXISTS _menu (service_code VARCHAR(50),request_text VARCHAR(500),response_text VARCHAR(500),`continue_flag` INT,`dcs` INT,app_id INT,in_menu VARCHAR(100),out_menu VARCHAR(100), `variable` INT,`variable_value` VARCHAR(100), `switched_service_code` VARCHAR(100),`if_clause` INT,`if_clause_value` VARCHAR(50),UNIQUE KEY(request_text,in_menu,out_menu));
  
  SELECT service_code INTO vServiceCode
  FROM tbl_service_master
  WHERE service_id=pServiceId LIMIT 1;
  
  SET pIfClauseValue=IFNULL(pIfClauseValue,'NA');
	
  
  SET pLevel = pLevel +1;
  SET vCurrentCount=0;
  OPEN C1;
	read_loop: LOOP
        FETCH C1 INTO vId,vParentId,vRequestText,vTitle,vNodeType,vMenuFlag,vIsHeader,vIsFooter,vIsListElement,vIsApplicationNode,
        	vApplicationId,vSwithServiceCode,vRegex,vVariableName,vVariableValue,vIfClause,vIfClauseValue,vPreference,vInvalidResponseText;
        	IF done THEN
            LEAVE read_loop;
    		END IF;
    		
    SET vRegex=REPLACE(vRegex,'|','~');
    
    SET vTitle=REPLACE(vTitle,'\r\n','^');
    SET vTitle=REPLACE(vTitle,'\r','^');
	SET vTitle=REPLACE(vTitle,'\n','^');
	
	    
	SET vCurrentCount = vCurrentCount +1;
	      
    
	      
	IF vIsApplicationNode = 1 THEN
	   		SET pReqText=vRequestText;
	   		CALL create_menu_file_new(vId,pLevel,pInMenu,pServiceId,pReqText,NULL);
	ELSEIF vIsApplicationNode = 2 THEN
	   		
	   		CALL create_menu_file_new(vId,pLevel,pInMenu,pServiceId,pReqText,vIfClauseValue);
	ELSE	   
		 
		IF vVariableValue IS NOT NULL THEN
			IF vNodeType <> 1 OR (vNodeType =1 AND vCurrentCount =1) THEN
			
				SET vOutMenuName=CONCAT("MENU",vParentId,'_',vVariableName);
				INSERT IGNORE INTO _menu(service_code,request_text,response_text,continue_flag,dcs,app_id,in_menu,out_menu,variable,variable_value,switched_service_code,`if_clause`,`if_clause_value`)
					VALUES (vServiceCode,pReqText,'Dummy Menu',4,0,0,pInMenu,vOutMenuName,vVariableName,'0','NA',0,pIfClauseValue);
	
				SET vVariableName=0;
				SET pInMenu=vOutMenuName;	
			END IF;
		ELSE
			SET vVariableValue='0';
		
			
		END IF;
		
			      
	   	IF vNodeType = 1 THEN
			IF vCurrentCount = 1 THEN
				SET vTitle="";
				
				SELECT response_text INTO vHeaderText
				FROM `tbl_service_nodes` 
				WHERE `status` =1
				AND parent_id = pParentId 
				AND service_id=pServiceId
				AND is_header=1;
				
				IF CHAR_LENGTH(vHeaderText) > 0 THEN
						SET vHeaderText=REPLACE(vHeaderText,'\r\n','^');
    					SET vHeaderText=REPLACE(vHeaderText,'\r','^');
						SET vHeaderText=REPLACE(vHeaderText,'\n','^');
					SET vTitle=CONCAT(vTitle,vHeaderText,'^');
				END IF;
				
				SELECT is_list_element,parent_id INTO vParentIsListEleVal,vParentIdNodeMore
				FROM `tbl_service_nodes` 
				WHERE `status` =1
				AND node_id = vParentId 
				AND service_id=pServiceId;
				
				
	
				IF vParentIsListEleVal = 2 THEN
					
					SELECT COUNT(1) INTO vNumbering 
					FROM `tbl_service_nodes` 
					WHERE `status` =1
					AND parent_id = vParentIdNodeMore 
					AND service_id=pServiceId
					AND is_list_element =1;
					
					
				ELSE
					SET vNumbering=0;	
				END IF;
				
				SET done = false;
				OPEN C2;
					read_loop_2: LOOP
						
						FETCH C2 INTO subTitle,vChildListElement;
						
						IF done THEN
							SET done = false; 
							LEAVE read_loop_2;
						END IF;
						
						SET subTitle=REPLACE(subTitle,'\r\n','^');
    					SET subTitle=REPLACE(subTitle,'\r','^');
						SET subTitle=REPLACE(subTitle,'\n','^');
						
						SET vNumbering = vNumbering +1;
						IF vChildListElement =2 THEN 
							SET vTitle=CONCAT(vTitle,'99 ',subTitle,'^');
						ELSE
							SET vTitle=CONCAT(vTitle,vNumbering,' ',subTitle,'^');
						END IF;
						
					END LOOP read_loop_2;
				CLOSE C2;
				
				SELECT response_text INTO vFooterText 
				FROM `tbl_service_nodes` 
				WHERE STATUS =1
				AND parent_id = pParentId 
				AND service_id=pServiceId
				AND is_footer=1;
				
				
				
				IF CHAR_LENGTH(vFooterText) > 0 THEN
					SET vFooterText=REPLACE(vFooterText,'\r\n','^');
    					SET vFooterText=REPLACE(vFooterText,'\r','^');
						SET vFooterText=REPLACE(vFooterText,'\n','^');
					SET vTitle=CONCAT(vTitle,vFooterText);
				END IF;
				
				
				SET vOutMenuName=CONCAT("MENU",vParentId);
				
				INSERT INTO _menu(service_code,request_text,response_text,continue_flag,dcs,app_id,in_menu,out_menu,variable,variable_value,switched_service_code,`if_clause`,`if_clause_value`)
				VALUES (vServiceCode,pReqText,vTitle,vMenuFlag,0,0,pInMenu,vOutMenuName,vVariableName,vVariableValue,'NA',0,pIfClauseValue);
  
			END IF;
		
			
			IF vIsListElement = 2 THEN
				CALL create_menu_file_new(vId,pLevel,vOutMenuName,pServiceId,99,NULL);
			ELSE
				
				IF vIsListElement = 1 THEN
					
					SELECT IFNULL(is_list_element,0),parent_id INTO vParentIsListEleVal,vParentIdNodeMore
					FROM `tbl_service_nodes` 
					WHERE `status` =1
					AND node_id = vParentId 
					AND service_id=pServiceId;
				
					
					IF vParentIsListEleVal = 2 THEN
				
						SELECT COUNT(1) INTO vNumbering 
						FROM `tbl_service_nodes` 
						WHERE `status` =1
						AND parent_id = vParentIdNodeMore 
						AND service_id=pServiceId
						AND is_list_element =1;
					
						SET vNumbering=IFNULL(vNumbering,0)+vCurrentCount;
						
					ELSE
						SET vNumbering=vCurrentCount;
					END IF;
				
					CALL create_menu_file_new(vId,pLevel,vOutMenuName,pServiceId,vNumbering,NULL);
					SET done = false; 
				
				END IF;
			END IF;
	
	   ELSEIF vNodeType = 2 THEN
	   		SET vOutMenuName=CONCAT("MENU",vParentId);	
			INSERT IGNORE INTO _menu(service_code,request_text,response_text,continue_flag,dcs,app_id,in_menu,out_menu,variable,variable_value,switched_service_code,`if_clause`,`if_clause_value`)
			VALUES (vServiceCode,pReqText,vTitle,vMenuFlag,0,vApplicationId,pInMenu,vOutMenuName,vVariableName,vVariableValue,'NA',0,pIfClauseValue);
			
			CALL create_menu_file_new(vId,pLevel,vOutMenuName,pServiceId,vRegex,NULL);
	
			IF CHAR_LENGTH(IFNULL(vInvalidResponseText,'')) > 0 THEN
				INSERT IGNORE INTO _menu(service_code,request_text,response_text,continue_flag,dcs,app_id,in_menu,out_menu,variable,variable_value,switched_service_code,`if_clause`,`if_clause_value`)
				VALUES (vServiceCode,'.*',vInvalidResponseText,0,0,0,vOutMenuName,'END',0,0,'NA',0,NULL);
			END IF; 
	      
	   ELSEIF vNodeType = 3 or vNodeType = 7 THEN
	   
	   		IF vMenuFlag = 30 THEN
	   			SELECT app_mtype INTO vAppMtype FROM `tbl_application_master`
	   			WHERE app_id =vApplicationId;
	   		ELSE
	   			SET vAppMtype=0;
	   		END IF;
	   	
			IF vNodeType = 7 and vMenuFlag = 7 THEN
				SET vTitle = "BACK MENU";
			ELSEIF vNodeType = 7 and vMenuFlag = 8 THEN
				SET vTitle = "MAIN MENU";
			END IF;

	   		SET vOutMenuName=CONCAT("MENU",vParentId);	
			INSERT IGNORE INTO _menu(service_code,request_text,response_text,continue_flag,dcs,app_id,in_menu,out_menu,variable,variable_value,switched_service_code,`if_clause`,`if_clause_value`)
			VALUES (vServiceCode,pReqText,vTitle,vMenuFlag,0,vAppMtype,pInMenu,vOutMenuName,vVariableName,vVariableValue,'NA',0,pIfClauseValue);
	      
	   	
	   ELSEIF vNodeType = 4 THEN
	   
	   		SELECT app_mtype INTO vAppMtype FROM `tbl_application_master`
	   		WHERE app_id =vApplicationId;
	   
	   		SET vOutMenuName=CONCAT("MENU",vParentId);	
			INSERT IGNORE INTO _menu(service_code,request_text,response_text,continue_flag,dcs,app_id,in_menu,out_menu,variable,variable_value,switched_service_code,`if_clause`,`if_clause_value`)
			VALUES (vServiceCode,pReqText,'To the Application',vMenuFlag,0,vAppMtype,pInMenu,vOutMenuName,vVariableName,vVariableValue,'NA',0,pIfClauseValue);
			CALL create_menu_file_new(vId,pLevel,vOutMenuName,pServiceId,pReqText,NULL);			
			
	   ELSEIF vNodeType = 5 THEN
	   		SET vOutMenuName=CONCAT("MENU",vParentId);	
			INSERT IGNORE INTO _menu(service_code,request_text,response_text,continue_flag,dcs,app_id,in_menu,out_menu,variable,variable_value,switched_service_code,`if_clause`,`if_clause_value`)
			VALUES (vServiceCode,pReqText,'Switch to Short Code',vMenuFlag,0,0,pInMenu,vOutMenuName,vVariableName,vVariableValue,vSwithServiceCode,0,pIfClauseValue);
			
	   ELSEIF vNodeType = 6 THEN
	   		SET vOutMenuName=CONCAT("MENU",vParentId);	
			INSERT IGNORE INTO _menu(service_code,request_text,response_text,continue_flag,dcs,app_id,in_menu,out_menu,variable,variable_value,switched_service_code,`if_clause`,`if_clause_value`)
			VALUES (vServiceCode,pReqText,'Dummy Menu - Logical check',4,0,0,pInMenu,vOutMenuName,vVariableName,vVariableValue,'NA',vIfClause,pIfClauseValue);
			CALL create_menu_file_new(vId,pLevel,vOutMenuName,pServiceId,pReqText,NULL);
	   END IF;
	   
	
	END IF;  
	      
	END LOOP read_loop;
  CLOSE C1;
  
IF pParentId = 0 THEN  
	SELECT * FROM _menu;
END IF;
  
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `create_menu_file_node_wise` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `create_menu_file_node_wise`(
	IN `pParentId` INT,
	IN `pLevel` INT,
	IN `pInMenu` varchar(100),
	IN `pServiceId` INT,
	IN `pReqText` VARCHAR(200),
	IN `pIfClauseValue` VARCHAR(5000),
	IN `pNodeId` INT,
	IN `pNodeText` VARCHAR(1000)
)
BEGIN
  
  DECLARE done INT DEFAULT FALSE;
  DECLARE vId,vParentId,vNodeType,vAppMtype,vParentIsListEleVal,vParentIdNodeMore,vChildListElement INT;
  DECLARE vMenuFlag,vIsHeader,vIsFooter,vIsListElement,vIsApplicationNode,vApplicationId,vVariableName,vIfClause,vPreference,vSwitchServiceId,vInvalidMenuFlag INT;
  DECLARE vDCS,vChildCount,vCurrentCount,vNumbering INT;
  DECLARE vSequenceNo, vSequenceNo1 varchar(100);
  DECLARE vTitle,subTitle,vTitleMore,vHeaderText,vFooterText,vServiceCode,vSwithServiceCode,vRegex,vRequestText,vVariableValue,vInvalidResponseText VARCHAR(250);
  DECLARE vIfClauseValue VARCHAR(5000);
  DECLARE vOutMenuName VARCHAR(100);
  
  
  
  
  DECLARE C1 CURSOR FOR
	SELECT node_id,parent_id,request_text,response_text,node_type,menu_flag,is_header,is_footer,is_list_element,`is_application_node`,
	application_id,switch_service_code,regex,variable_name,variable_value,if_clause,if_value_clause, preference,dcs, invalid_response_text,switch_service_id,invalid_menu_flag,sequence_no
	FROM `tbl_service_nodes` 
	WHERE (STATUS =1 or STATUS = 2)
	AND service_id=pServiceId
	AND parent_id = pParentId 
	AND is_header=0 and is_footer=0
	ORDER BY `preference` ASC;
	  
  DECLARE C2 CURSOR FOR
	SELECT response_text,is_list_element,sequence_no
	FROM `tbl_service_nodes` 
	WHERE STATUS =1 
	AND service_id=pServiceId
	AND parent_id = pParentId
	AND is_list_element in (1,2) 
	ORDER BY `preference` ASC;
  
  DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
    
  SET @@SESSION.max_sp_recursion_depth=100;
  IF pLevel = 0 THEN
	DROP TABLE IF EXISTS _menu;
  END IF;
  
  
  
  CREATE TEMPORARY TABLE IF NOT EXISTS _menu (service_code VARCHAR(50),request_text VARCHAR(500),response_text VARCHAR(500),`continue_flag` INT,`dcs` INT,app_id INT,in_menu VARCHAR(100),out_menu VARCHAR(100), `variable` INT,`variable_value` VARCHAR(100), `switched_service_code` VARCHAR(100),`if_clause` INT,`if_clause_value` VARCHAR(5000),`node_id` INT,`node_text` VARCHAR(500),UNIQUE KEY(request_text,in_menu,out_menu));
  
  SELECT service_code INTO vServiceCode
  FROM tbl_service_master
  WHERE service_id=pServiceId LIMIT 1;
  
  SET pIfClauseValue=IFNULL(pIfClauseValue,'NA');
	
  
  SET pLevel = pLevel +1;
  SET vCurrentCount=0;
  OPEN C1;
	read_loop: LOOP
        FETCH C1 INTO vId,vParentId,vRequestText,vTitle,vNodeType,vMenuFlag,vIsHeader,vIsFooter,vIsListElement,vIsApplicationNode,
        	vApplicationId,vSwithServiceCode,vRegex,vVariableName,vVariableValue,vIfClause,vIfClauseValue,vPreference,vDCS,vInvalidResponseText,vSwitchServiceId,vInvalidMenuFlag,vSequenceNo1;
        	IF done THEN
            LEAVE read_loop;
    		END IF;
    
    SET vRegex=REPLACE(vRegex,'|','~');  
    SET vTitle=REPLACE(vTitle,'\r\n','^');
    SET vTitle=REPLACE(vTitle,'\r','^');
	SET vTitle=REPLACE(vTitle,'\n','^');
	
	    
	SET vCurrentCount = vCurrentCount +1;
	      
    
	    
	IF vIsApplicationNode = 1 THEN
	   		SET pReqText=vRequestText;
	   		CALL create_menu_file_node_wise(vId,pLevel,pInMenu,pServiceId,pReqText,NULL,pNodeId,pNodeText);
	ELSEIF vIsApplicationNode = 2 THEN
	   		
	   		CALL create_menu_file_node_wise(vId,pLevel,pInMenu,pServiceId,pReqText,vIfClauseValue,pNodeId,pNodeText);
	ELSE	   
	
		IF vVariableValue = '0' OR vVariableValue = 'NA' THEN
			set vVariableValue =NULL;
		END IF;
		
		IF vVariableValue IS NOT NULL THEN
			IF vNodeType <> 1 OR (vNodeType =1 AND vCurrentCount =1) THEN
			
				SET vOutMenuName=CONCAT("MENU",pServiceId,'_',vParentId,'_',vVariableName);
				INSERT IGNORE INTO _menu(service_code,request_text,response_text,continue_flag,dcs,app_id,in_menu,out_menu,variable,variable_value,switched_service_code,`if_clause`,`if_clause_value`,`node_id`,`node_text`)
					VALUES (vServiceCode,pReqText,'Dummy Menu',4,vDCS,vAppMtype,pInMenu,vOutMenuName,vVariableName,'0','NA',0,pIfClauseValue,pNodeId,pNodeText);
	
				SET vVariableName=0;
				SET pInMenu=vOutMenuName;		
			END IF;
		ELSE
			SET vVariableValue='0';
		
			
		END IF;
		
		
		
			      
	   	IF vNodeType = 1 THEN
			SELECT app_mtype INTO vAppMtype FROM `tbl_application_master` WHERE app_id =vApplicationId limit 1;

			IF vCurrentCount = 1 THEN
				SET vTitle="";
				
				SELECT response_text INTO vHeaderText
				FROM `tbl_service_nodes` 
				WHERE `status` =1
				AND parent_id = pParentId 
				AND service_id=pServiceId
				AND is_header=1 limit 1;
				
				IF CHAR_LENGTH(vHeaderText) > 0 THEN
						SET vHeaderText=REPLACE(vHeaderText,'\r\n','^');
    					SET vHeaderText=REPLACE(vHeaderText,'\r','^');
						SET vHeaderText=REPLACE(vHeaderText,'\n','^');
					SET vTitle=CONCAT(vTitle,vHeaderText,'^');
				END IF;
				
				SELECT is_list_element,parent_id INTO vParentIsListEleVal,vParentIdNodeMore
				FROM `tbl_service_nodes` 
				WHERE `status` =1
				AND node_id = vParentId 
				AND service_id=pServiceId limit 1;
				
				
	
				IF vParentIsListEleVal = 2 THEN
					
					SELECT COUNT(1) INTO vNumbering 
					FROM `tbl_service_nodes` 
					WHERE `status` =1
					AND parent_id = vParentIdNodeMore 
					AND service_id=pServiceId
					AND is_list_element =1;
					
					
				ELSE
					SET vNumbering=0;	
				END IF;
				
				SET done = false;
				OPEN C2;
					read_loop_2: LOOP
						
						FETCH C2 INTO subTitle,vChildListElement,vSequenceNo;
						
						IF done THEN
							SET done = false; 
							LEAVE read_loop_2;
						END IF;
						
						SET subTitle=REPLACE(subTitle,'\r\n','^');
    					SET subTitle=REPLACE(subTitle,'\r','^');
						SET subTitle=REPLACE(subTitle,'\n','^');
						
						SET vNumbering = vNumbering +1;
						IF vChildListElement =2 THEN 
							SET vTitle=CONCAT(vTitle,'99 ',subTitle,'^');
						ELSE
							SET vTitle=CONCAT(vTitle,vSequenceNo,' ',subTitle,'^');
						END IF;
						
					END LOOP read_loop_2;
				CLOSE C2;
				
				SELECT response_text INTO vFooterText 
				FROM `tbl_service_nodes` 
				WHERE STATUS =1
				AND parent_id = pParentId 
				AND service_id=pServiceId
				AND is_footer=1 limit 1;
				
				
				
				IF CHAR_LENGTH(vFooterText) > 0 THEN
					SET vFooterText=REPLACE(vFooterText,'\r\n','^');
    					SET vFooterText=REPLACE(vFooterText,'\r','^');
						SET vFooterText=REPLACE(vFooterText,'\n','^');
					SET vTitle=CONCAT(vTitle,vFooterText);
				END IF;
				
				
				SET vOutMenuName=CONCAT("MENU",pServiceId,'_',vParentId);
				
				INSERT INTO _menu(service_code,request_text,response_text,continue_flag,dcs,app_id,in_menu,out_menu,variable,variable_value,switched_service_code,`if_clause`,`if_clause_value`,`node_id`,`node_text`)
				VALUES (vServiceCode,pReqText,vTitle,vMenuFlag,vDCS,vAppMtype,pInMenu,vOutMenuName,vVariableName,vVariableValue,'NA',0,pIfClauseValue,pNodeId,pNodeText);
  
			END IF;
		
			
			
			SELECT response_text INTO subTitle 
				FROM `tbl_service_nodes` 
				WHERE (STATUS =1 or STATUS = 2)
				AND node_id = vId 
				AND service_id=pServiceId limit 1;
				
			SET subTitle=REPLACE(subTitle,'\r\n','^');
    		SET subTitle=REPLACE(subTitle,'\r','^');
			SET subTitle=REPLACE(subTitle,'\n','^');
				
				
			IF vIsListElement = 2 THEN	
			
				CALL create_menu_file_node_wise(vId,pLevel,vOutMenuName,pServiceId,99,NULL,vId,subTitle);
			ELSE
				
				IF vIsListElement = 1 THEN
					
					SELECT IFNULL(is_list_element,0),parent_id INTO vParentIsListEleVal,vParentIdNodeMore
					FROM `tbl_service_nodes` 
					WHERE `status` =1
					AND node_id = vParentId 
					AND service_id=pServiceId limit 1;
				
					
					IF vParentIsListEleVal = 2 THEN
				
						SELECT COUNT(1) INTO vNumbering 
						FROM `tbl_service_nodes` 
						WHERE `status` =1
						AND parent_id = vParentIdNodeMore 
						AND service_id=pServiceId
						AND is_list_element =1;
					
						SET vNumbering=IFNULL(vNumbering,0)+vCurrentCount;
						
					ELSE
						SET vNumbering=vCurrentCount;
					END IF;
				
					CALL create_menu_file_node_wise(vId,pLevel,vOutMenuName,pServiceId,vSequenceNo1,NULL,vId,subTitle);
					SET done = false; 
				
				END IF;
			END IF;
	
		
	   ELSEIF vNodeType = 2 THEN
			SELECT app_mtype INTO vAppMtype FROM `tbl_application_master` WHERE app_id =vApplicationId limit 1;

	   		SET vOutMenuName=CONCAT("MENU",pServiceId,'_',vParentId);	
			INSERT IGNORE INTO _menu(service_code,request_text,response_text,continue_flag,dcs,app_id,in_menu,out_menu,variable,variable_value,switched_service_code,`if_clause`,`if_clause_value`,`node_id`,`node_text`)
			VALUES (vServiceCode,pReqText,vTitle,vMenuFlag,vDCS,vAppMtype,pInMenu,vOutMenuName,vVariableName,vVariableValue,'NA',0,pIfClauseValue,pNodeId,pNodeText);
			
			CALL create_menu_file_node_wise(vId,pLevel,vOutMenuName,pServiceId,vRegex,NULL,vId,vTitle);
	
			IF CHAR_LENGTH(IFNULL(vInvalidResponseText,'')) > 0 THEN
				IF vInvalidMenuFlag = 1 THEN
					INSERT IGNORE INTO _menu(service_code,request_text,response_text,continue_flag,dcs,app_id,in_menu,out_menu,variable,variable_value,switched_service_code,`if_clause`,`if_clause_value`)
					VALUES (vServiceCode,'.*',vInvalidResponseText,1,vDCS,vAppMtype,vOutMenuName,'END',0,0,'NA',0,NULL);	
				ELSEIF vInvalidMenuFlag = 2 THEN
					INSERT IGNORE INTO _menu(service_code,request_text,response_text,continue_flag,dcs,app_id,in_menu,out_menu,variable,variable_value,switched_service_code,`if_clause`,`if_clause_value`)
					VALUES (vServiceCode,'.*',vInvalidResponseText,1,vDCS,vAppMtype,vOutMenuName,vOutMenuName,vVariableName,0,'NA',0,NULL);
				ELSE
					INSERT IGNORE INTO _menu(service_code,request_text,response_text,continue_flag,dcs,app_id,in_menu,out_menu,variable,variable_value,switched_service_code,`if_clause`,`if_clause_value`)
					VALUES (vServiceCode,'.*',vInvalidResponseText,0,vDCS,vAppMtype,vOutMenuName,'END',0,0,'NA',0,NULL);
				END IF;
			END IF; 
	     
	   ELSEIF vNodeType = 3 or vNodeType = 7 THEN
	   
	   		SELECT app_mtype INTO vAppMtype FROM `tbl_application_master`
	   		WHERE app_id =vApplicationId limit 1;

			IF vNodeType = 7 and vMenuFlag = 7 THEN
				SET vTitle = "BACK MENU";
			ELSEIF vNodeType = 7 and vMenuFlag = 8 THEN
				SET vTitle = "MAIN MENU";
			END IF;
	   		
	   		SET vOutMenuName=CONCAT("MENU",pServiceId,'_',vParentId);	
			INSERT IGNORE INTO _menu(service_code,request_text,response_text,continue_flag,dcs,app_id,in_menu,out_menu,variable,variable_value,switched_service_code,`if_clause`,`if_clause_value`,`node_id`,`node_text`)
			VALUES (vServiceCode,pReqText,vTitle,vMenuFlag,vDCS,vAppMtype,pInMenu,vOutMenuName,vVariableName,vVariableValue,'NA',0,pIfClauseValue,pNodeId,pNodeText);
	      
	   
	   ELSEIF vNodeType = 4 THEN
	   
	   		SELECT app_mtype INTO vAppMtype FROM `tbl_application_master`
	   		WHERE app_id =vApplicationId limit 1;
	   
	   		SET vOutMenuName=CONCAT("MENU",pServiceId,'_',vParentId);	
			INSERT IGNORE INTO _menu(service_code,request_text,response_text,continue_flag,dcs,app_id,in_menu,out_menu,variable,variable_value,switched_service_code,`if_clause`,`if_clause_value`,`node_id`,`node_text`)
			VALUES (vServiceCode,pReqText,'To the Application',vMenuFlag,vDCS,vAppMtype,pInMenu,vOutMenuName,vVariableName,vVariableValue,'NA',0,pIfClauseValue,pNodeId,pNodeText);
			CALL create_menu_file_node_wise(vId,pLevel,vOutMenuName,pServiceId,pReqText,NULL,pNodeId,pNodeText);			
			
	   ELSEIF vNodeType = 5 THEN
	   		 SET vOutMenuName=CONCAT("MENU",pServiceId,'_',vParentId);

			SELECT app_mtype INTO vAppMtype FROM `tbl_application_master` WHERE app_id =vApplicationId limit 1;
	   			
			INSERT IGNORE INTO _menu(service_code,request_text,response_text,continue_flag,dcs,app_id,in_menu,out_menu,variable,variable_value,switched_service_code,`if_clause`,`if_clause_value`,`node_id`,`node_text`) VALUES (vServiceCode,pReqText,'Switch to Short Code',vMenuFlag,vDCS,vAppMtype,pInMenu,vOutMenuName,vVariableName,vVariableValue,vSwithServiceCode,0,pIfClauseValue,pNodeId,pNodeText);
			
			
	
	   ELSEIF vNodeType = 6 THEN
	   		SET vOutMenuName=CONCAT("MENU",pServiceId,'_',vParentId);
			SELECT app_mtype INTO vAppMtype FROM `tbl_application_master` WHERE app_id =vApplicationId limit 1;	
			INSERT IGNORE INTO _menu(service_code,request_text,response_text,continue_flag,dcs,app_id,in_menu,out_menu,variable,variable_value,switched_service_code,`if_clause`,`if_clause_value`,`node_id`,`node_text`)
			VALUES (vServiceCode,pReqText,'Dummy Menu - Logical check',4,vDCS,vAppMtype,pInMenu,vOutMenuName,vVariableName,vVariableValue,'NA',vIfClause,pIfClauseValue,pNodeId,pNodeText);
			CALL create_menu_file_node_wise(vId,pLevel,vOutMenuName,pServiceId,pReqText,NULL,pNodeId,pNodeText);
	   END IF;
	   
	
	END IF;  
	
	
	      
	END LOOP read_loop;
  CLOSE C1;
  
IF pLevel = 1 THEN  
	UPDATE _menu SET service_code = vServiceCode;
	SELECT * FROM _menu;
END IF;
  
END ;;

DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `create_menu_file_single` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `create_menu_file_single`(IN pParentId INT,IN pLevel INT,IN pInMenu varchar(100),IN pServiceId INT,IN pReqText VARCHAR(200),IN pIfClauseValue VARCHAR(200),IN pNodeId INT,IN pNodeText VARCHAR(1000))
BEGIN
  
  DECLARE done INT DEFAULT FALSE;
  DECLARE vId,vParentId,vNodeType,vAppMtype,vParentIsListEleVal,vParentIdNodeMore,vChildListElement INT;
  DECLARE vMenuFlag,vIsHeader,vIsFooter,vIsListElement,vIsApplicationNode,vApplicationId,vVariableName,vIfClause,vPreference,vSwitchServiceId INT;
  DECLARE vChildCount,vCurrentCount,vNumbering INT;
  DECLARE vTitle,subTitle,vTitleMore,vHeaderText,vFooterText,vServiceCode,vSwithServiceCode,vRegex,vRequestText,vVariableValue,vIfClauseValue, vInvalidResponseText VARCHAR(250);
  DECLARE vOutMenuName VARCHAR(100);
  
  
  
  
  DECLARE C1 CURSOR FOR
	SELECT node_id,parent_id,request_text,response_text,node_type,menu_flag,is_header,is_footer,is_list_element,`is_application_node`,
	application_id,switch_service_code,regex,variable_name,variable_value,if_clause,if_value_clause, preference, invalid_response_text,switch_service_id
	FROM `tbl_service_nodes` 
	WHERE STATUS =1 
	AND service_id=pServiceId
	AND parent_id = pParentId 
	AND is_header=0 and is_footer=0
	ORDER BY `preference` ASC;
	  
  DECLARE C2 CURSOR FOR
	SELECT response_text,is_list_element
	FROM `tbl_service_nodes` 
	WHERE STATUS =1 
	AND service_id=pServiceId
	AND parent_id = pParentId
	AND is_list_element in (1,2) 
	ORDER BY `preference` ASC;
  
  DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
    
  SET @@SESSION.max_sp_recursion_depth=100;
  IF pLevel = 0 THEN
	DROP TABLE IF EXISTS _menu;
  END IF;
  
  
  
  CREATE TEMPORARY TABLE IF NOT EXISTS _menu (service_code VARCHAR(50),request_text VARCHAR(500),response_text VARCHAR(500),`continue_flag` INT,`dcs` INT,app_id INT,in_menu VARCHAR(100),out_menu VARCHAR(100), `variable` INT,`variable_value` VARCHAR(100), `switched_service_code` VARCHAR(100),`if_clause` INT,`if_clause_value` VARCHAR(50),`node_id` INT,`node_text` VARCHAR(500),UNIQUE KEY(request_text,in_menu,out_menu));
  
  SELECT service_code INTO vServiceCode
  FROM tbl_service_master
  WHERE service_id=pServiceId LIMIT 1;
  
  SET pIfClauseValue=IFNULL(pIfClauseValue,'NA');
	
  
  SET pLevel = pLevel +1;
  SET vCurrentCount=0;
  OPEN C1;
	read_loop: LOOP
        FETCH C1 INTO vId,vParentId,vRequestText,vTitle,vNodeType,vMenuFlag,vIsHeader,vIsFooter,vIsListElement,vIsApplicationNode,
        	vApplicationId,vSwithServiceCode,vRegex,vVariableName,vVariableValue,vIfClause,vIfClauseValue,vPreference,vInvalidResponseText,vSwitchServiceId;
        	IF done THEN
            LEAVE read_loop;
    		END IF;
    
    
    
    SET vTitle=REPLACE(vTitle,'\r\n','^');
    SET vTitle=REPLACE(vTitle,'\r','^');
	SET vTitle=REPLACE(vTitle,'\n','^');
	
	    
	SET vCurrentCount = vCurrentCount +1;
	      
    
	    
	IF vIsApplicationNode = 1 THEN
	   		SET pReqText=vRequestText;
	   		CALL create_menu_file_single(vId,pLevel,pInMenu,pServiceId,pReqText,NULL,pNodeId,pNodeText);
	ELSEIF vIsApplicationNode = 2 THEN
	   		
	   		CALL create_menu_file_single(vId,pLevel,pInMenu,pServiceId,pReqText,vIfClauseValue,pNodeId,pNodeText);
	ELSE	   
	
		
		IF vVariableValue IS NOT NULL THEN
			IF vNodeType <> 1 OR (vNodeType =1 AND vCurrentCount =1) THEN
			
				SET vOutMenuName=CONCAT("MENU",pServiceId,'_',vParentId,'_',vVariableName);
				INSERT IGNORE INTO _menu(service_code,request_text,response_text,continue_flag,dcs,app_id,in_menu,out_menu,variable,variable_value,switched_service_code,`if_clause`,`if_clause_value`,`node_id`,`node_text`)
					VALUES (vServiceCode,pReqText,'Dummy Menu',4,0,0,pInMenu,vOutMenuName,vVariableName,'0','NA',0,pIfClauseValue,pNodeId,pNodeText);
	
				SET vVariableName=0;
				SET pInMenu=vOutMenuName;	
			END IF;
		ELSE
			SET vVariableValue='0';
		
			
		END IF;
		
		
		
			      
	   	IF vNodeType = 1 THEN
			IF vCurrentCount = 1 THEN
				SET vTitle="";
				
				SELECT response_text INTO vHeaderText
				FROM `tbl_service_nodes` 
				WHERE `status` =1
				AND parent_id = pParentId 
				AND service_id=pServiceId
				AND is_header=1;
				
				IF CHAR_LENGTH(vHeaderText) > 0 THEN
						SET vHeaderText=REPLACE(vHeaderText,'\r\n','^');
    					SET vHeaderText=REPLACE(vHeaderText,'\r','^');
						SET vHeaderText=REPLACE(vHeaderText,'\n','^');
					SET vTitle=CONCAT(vTitle,vHeaderText,'^');
				END IF;
				
				SELECT is_list_element,parent_id INTO vParentIsListEleVal,vParentIdNodeMore
				FROM `tbl_service_nodes` 
				WHERE `status` =1
				AND node_id = vParentId 
				AND service_id=pServiceId;
				
				
	
				IF vParentIsListEleVal = 2 THEN
					
					SELECT COUNT(1) INTO vNumbering 
					FROM `tbl_service_nodes` 
					WHERE `status` =1
					AND parent_id = vParentIdNodeMore 
					AND service_id=pServiceId
					AND is_list_element =1;
					
					
				ELSE
					SET vNumbering=0;	
				END IF;
				
				SET done = false;
				OPEN C2;
					read_loop_2: LOOP
						
						FETCH C2 INTO subTitle,vChildListElement;
						
						IF done THEN
							SET done = false; 
							LEAVE read_loop_2;
						END IF;
						
						SET subTitle=REPLACE(subTitle,'\r\n','^');
    					SET subTitle=REPLACE(subTitle,'\r','^');
						SET subTitle=REPLACE(subTitle,'\n','^');
						
						SET vNumbering = vNumbering +1;
						IF vChildListElement =2 THEN 
							SET vTitle=CONCAT(vTitle,'99 ',subTitle,'^');
						ELSE
							SET vTitle=CONCAT(vTitle,vNumbering,' ',subTitle,'^');
						END IF;
						
					END LOOP read_loop_2;
				CLOSE C2;
				
				SELECT response_text INTO vFooterText 
				FROM `tbl_service_nodes` 
				WHERE STATUS =1
				AND parent_id = pParentId 
				AND service_id=pServiceId
				AND is_footer=1;
				
				
				
				IF CHAR_LENGTH(vFooterText) > 0 THEN
					SET vFooterText=REPLACE(vFooterText,'\r\n','^');
    					SET vFooterText=REPLACE(vFooterText,'\r','^');
						SET vFooterText=REPLACE(vFooterText,'\n','^');
					SET vTitle=CONCAT(vTitle,vFooterText);
				END IF;
				
				
				SET vOutMenuName=CONCAT("MENU",pServiceId,'_',vParentId);
				
				INSERT INTO _menu(service_code,request_text,response_text,continue_flag,dcs,app_id,in_menu,out_menu,variable,variable_value,switched_service_code,`if_clause`,`if_clause_value`,`node_id`,`node_text`)
				VALUES (vServiceCode,pReqText,vTitle,vMenuFlag,0,0,pInMenu,vOutMenuName,vVariableName,vVariableValue,'NA',0,pIfClauseValue,pNodeId,pNodeText);
  
			END IF;
		
			
			
			SELECT response_text INTO subTitle 
				FROM `tbl_service_nodes` 
				WHERE STATUS =1
				AND node_id = vId 
				AND service_id=pServiceId;
				
			SET subTitle=REPLACE(subTitle,'\r\n','^');
    		SET subTitle=REPLACE(subTitle,'\r','^');
			SET subTitle=REPLACE(subTitle,'\n','^');
				
				
			IF vIsListElement = 2 THEN
				
			
				CALL create_menu_file_single(vId,pLevel,vOutMenuName,pServiceId,99,NULL,vId,subTitle);
			ELSE
				
				IF vIsListElement = 1 THEN
					
					SELECT IFNULL(is_list_element,0),parent_id INTO vParentIsListEleVal,vParentIdNodeMore
					FROM `tbl_service_nodes` 
					WHERE `status` =1
					AND node_id = vParentId 
					AND service_id=pServiceId;
				
					
					IF vParentIsListEleVal = 2 THEN
				
						SELECT COUNT(1) INTO vNumbering 
						FROM `tbl_service_nodes` 
						WHERE `status` =1
						AND parent_id = vParentIdNodeMore 
						AND service_id=pServiceId
						AND is_list_element =1;
					
						SET vNumbering=IFNULL(vNumbering,0)+vCurrentCount;
						
					ELSE
						SET vNumbering=vCurrentCount;
					END IF;
				
					CALL create_menu_file_single(vId,pLevel,vOutMenuName,pServiceId,vNumbering,NULL,vId,subTitle);
					SET done = false; 
				
				END IF;
			END IF;
	
		
	   ELSEIF vNodeType = 2 THEN
	   		SET vOutMenuName=CONCAT("MENU",pServiceId,'_',vParentId);	
			INSERT IGNORE INTO _menu(service_code,request_text,response_text,continue_flag,dcs,app_id,in_menu,out_menu,variable,variable_value,switched_service_code,`if_clause`,`if_clause_value`,`node_id`,`node_text`)
			VALUES (vServiceCode,pReqText,vTitle,vMenuFlag,0,vApplicationId,pInMenu,vOutMenuName,vVariableName,vVariableValue,'NA',0,pIfClauseValue,pNodeId,pNodeText);
			
			CALL create_menu_file_single(vId,pLevel,vOutMenuName,pServiceId,vRegex,NULL,vId,vTitle);
	
			IF CHAR_LENGTH(IFNULL(vInvalidResponseText,'')) > 0 THEN
				INSERT IGNORE INTO _menu(service_code,request_text,response_text,continue_flag,dcs,app_id,in_menu,out_menu,variable,variable_value,switched_service_code,`if_clause`,`if_clause_value`,`node_id`,`node_text`)
				VALUES (vServiceCode,'.*',vInvalidResponseText,0,0,0,vOutMenuName,'END',0,0,'NA',0,NULL,pNodeId,pNodeText);
			END IF; 
	     
	   ELSEIF vNodeType = 3 or vNodeType = 7 THEN
	   
	   		IF vMenuFlag = 30 THEN
	   			SELECT app_mtype INTO vAppMtype FROM `tbl_application_master`
	   			WHERE app_id =vApplicationId;
	   		ELSE
	   			SET vAppMtype=0;
	   		END IF;

			IF vNodeType = 7 and vMenuFlag = 7 THEN
				SET vTitle = "BACK MENU";
			ELSEIF vNodeType = 7 and vMenuFlag = 8 THEN
				SET vTitle = "MAIN MENU";
			END IF;
	   		
	   		SET vOutMenuName=CONCAT("MENU",pServiceId,'_',vParentId);	
			INSERT IGNORE INTO _menu(service_code,request_text,response_text,continue_flag,dcs,app_id,in_menu,out_menu,variable,variable_value,switched_service_code,`if_clause`,`if_clause_value`,`node_id`,`node_text`)
			VALUES (vServiceCode,pReqText,vTitle,vMenuFlag,0,vAppMtype,pInMenu,vOutMenuName,vVariableName,vVariableValue,'NA',0,pIfClauseValue,pNodeId,pNodeText);
	      
	   
	   ELSEIF vNodeType = 4 THEN
	   
	   		SELECT app_mtype INTO vAppMtype FROM `tbl_application_master`
	   		WHERE app_id =vApplicationId;
	   
	   		SET vOutMenuName=CONCAT("MENU",pServiceId,'_',vParentId);	
			INSERT IGNORE INTO _menu(service_code,request_text,response_text,continue_flag,dcs,app_id,in_menu,out_menu,variable,variable_value,switched_service_code,`if_clause`,`if_clause_value`,`node_id`,`node_text`)
			VALUES (vServiceCode,pReqText,'To the Application',vMenuFlag,0,vAppMtype,pInMenu,vOutMenuName,vVariableName,vVariableValue,'NA',0,pIfClauseValue,pNodeId,pNodeText);
			CALL create_menu_file_single(vId,pLevel,vOutMenuName,pServiceId,pReqText,NULL,pNodeId,pNodeText);			
			
	   ELSEIF vNodeType = 5 THEN
	   		
	   			
		
			
			CALL create_menu_file_single(0,pLevel,pInMenu,vSwitchServiceId,pReqText,NULL,pNodeId,pNodeText);
	
	   ELSEIF vNodeType = 6 THEN
	   		SET vOutMenuName=CONCAT("MENU",pServiceId,'_',vParentId);	
			INSERT IGNORE INTO _menu(service_code,request_text,response_text,continue_flag,dcs,app_id,in_menu,out_menu,variable,variable_value,switched_service_code,`if_clause`,`if_clause_value`,`node_id`,`node_text`)
			VALUES (vServiceCode,pReqText,'Dummy Menu - Logical check',4,0,0,pInMenu,vOutMenuName,vVariableName,vVariableValue,'NA',vIfClause,pIfClauseValue,pNodeId,pNodeText);
			CALL create_menu_file_single(vId,pLevel,vOutMenuName,pServiceId,pReqText,NULL,pNodeId,pNodeText);
	   END IF;
	   
	
	END IF;  
	
	
	      
	END LOOP read_loop;
  CLOSE C1;
  
IF pLevel = 1 THEN  
	UPDATE _menu SET service_code = vServiceCode;
	SELECT * FROM _menu;
END IF;
  
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `find_child_service_wise` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `find_child_service_wise`(parent_id INT,in_service_id INT)
BEGIN
  
  DROP TABLE IF EXISTS _tbl_find_child_service_wise;
  CREATE TEMPORARY TABLE _tbl_find_child_service_wise (node_id INT PRIMARY KEY,service_id INT);
  
  INSERT INTO _tbl_find_child_service_wise(node_id,service_id) VALUES (parent_id,in_service_id);
  
  DROP TABLE IF EXISTS _tmp;
  CREATE TEMPORARY TABLE _tmp LIKE _tbl_find_child_service_wise;
  REPEAT
    TRUNCATE TABLE _tmp;
    INSERT INTO _tmp(node_id,service_id) SELECT tmp.node_id AS node_id,in_service_id AS service_id
      FROM _tbl_find_child_service_wise as r JOIN tbl_service_nodes_temp as tmp ON r.node_id = tmp.parent_id WHERE tmp.service_id = in_service_id;
    INSERT IGNORE INTO _tbl_find_child_service_wise(node_id,service_id) SELECT node_id,service_id FROM _tmp;
  UNTIL ROW_COUNT() = 0
  END REPEAT;
  DROP TABLE _tmp;
  
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `find_parts` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `find_parts`(seed INT)
BEGIN
  
  DROP TABLE IF EXISTS _result;
  CREATE TEMPORARY TABLE _result (node INT PRIMARY KEY);
  
  INSERT INTO _result VALUES (seed);
  
  DROP TABLE IF EXISTS _tmp;
  CREATE TEMPORARY TABLE _tmp LIKE _result;
  REPEAT
    TRUNCATE TABLE _tmp;
    INSERT INTO _tmp SELECT node_id AS node
      FROM _result JOIN tbl_service_nodes_temp ON node = parent_id;
    INSERT IGNORE INTO _result SELECT node FROM _tmp;
  UNTIL ROW_COUNT() = 0
  END REPEAT;
  DROP TABLE _tmp;
  
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `proc_cancel_deployment` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_cancel_deployment`( 	
								IN in_login_id INT,
								IN in_deployment_id  INT,
								OUT OutStatus VARCHAR(100),
								OUT OutResponseCode INT,
								OUT OutDesc VARCHAR(200)
								)
proc:BEGIN
 
  
  DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		GET DIAGNOSTICS CONDITION 1 @sqlstate = RETURNED_SQLSTATE,  @errno = MYSQL_ERRNO, @text = MESSAGE_TEXT;
		SET OutResponseCode = @errno;
		SET OutStatus='F';
		SET OutDesc=@text;
		 CALL `proc_error_log`('proc_cancel_deployment',@errno,@text);
		 
	END;
		START TRANSACTION;
	
	IF NOT EXISTS (SELECT 1 FROM `tbl_service_deploy_logs` WHERE `id` = in_deployment_id) 
	THEN
		SET OutResponseCode = -1;
		SET OutStatus = 'Failure';
		SET OutDesc = 'Invalid Deployment Id !!';
		ROLLBACK;
		LEAVE proc;
	END IF;
	
	if exists(select 1  FROM `tbl_service_deploy_logs`  WHERE `id` = in_deployment_id and status =1)
	then	
		
			
			update `tbl_service_deploy_logs`
			set status=2
			where `id`=in_deployment_id;

			delete from tbl_trigger where deployment_id = in_deployment_id;
				
		COMMIT;
		SET OutResponseCode = 0;
		SET OutStatus = 'Success';
		SET OutDesc = 'Success';
	else
		SET OutResponseCode = -1;
		SET OutStatus = 'Failure';
		SET OutDesc = 'Invalid Status!!';
	
	end if;
  
  
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `proc_cancel_edit_service` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_cancel_edit_service`( 	
								IN in_login_id INT,
								IN in_service_id INT,
								OUT OutStatus VARCHAR(100),
								OUT OutResponseCode INT,
								OUT OutDesc VARCHAR(200)
								)
proc:BEGIN
  declare v_parent_service_id ,v_edit_flag,v_login_id int;
  DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		GET DIAGNOSTICS CONDITION 1 @sqlstate = RETURNED_SQLSTATE,  @errno = MYSQL_ERRNO, @text = MESSAGE_TEXT;
		SET OutResponseCode = @errno;
		SET OutStatus='F';
		SET OutDesc=@text;
		 CALL `proc_error_log`('proc_cancel_edit_service',@errno,@text);
	END;
  
SELECT  `parent_service_id` INTO v_parent_service_id FROM `tbl_service_master` WHERE `service_id`=in_service_id LIMIT 1;
  
	IF v_parent_service_id = 0 THEN
	 	SELECT edit_flag,creator_id INTO v_edit_flag,v_login_id FROM tbl_edit_service_history
		WHERE service_id =in_service_id AND edit_flag =1 LIMIT 1;
	 ELSE
	 	SELECT edit_flag,creator_id INTO v_edit_flag,v_login_id FROM tbl_edit_service_history
		WHERE service_id =v_parent_service_id AND edit_flag =1 LIMIT 1;
	 END IF;
	
	
	IF v_edit_flag<>1
	THEN
		SET OutResponseCode = 1;
		SET OutStatus = 'F';
		SET OutDesc = 'Service is not in Edit mode';
		LEAVE proc;
	ELSEIF v_login_id <> in_login_id THEN
		SET OutResponseCode = 1;
		SET OutStatus = 'F';
		SET OutDesc = 'You are not authorized as other user is working on this service';
		LEAVE proc;
	END IF; 
  
  
			
			
			UPDATE tbl_edit_service_history 
			SET edit_flag=3,
			`last_modified`=NOW()
			WHERE (service_id =in_service_id OR service_id = v_parent_service_id) AND edit_flag =1;
			 
			
	
	if v_parent_service_id=0
	then
			DELETE FROM `tbl_service_nodes_temp` WHERE (`service_id`= in_service_id or `parent_service_id`=in_service_id);	
	else
 
 
			DELETE FROM `tbl_service_nodes_temp` WHERE (`service_id`= v_parent_service_id or `parent_service_id`=v_parent_service_id);
 
	end if;
		
			SET OutResponseCode = 0;
			SET OutStatus = 'Success';
			SET OutDesc = 'Success';
  
  
  
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `proc_change_password` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_change_password`(IN in_userid int,
							      IN in_password VARCHAR(100),
							      in in_old_password varchar(100),
							      OUT OutStatus VARCHAR(100),
							      OUT OutResponseCode INT,
							      OUT OutDesc VARCHAR(200)	
								)
BEGIN
declare v_username,v_password varchar(100);	
declare v_count int;
DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		GET DIAGNOSTICS CONDITION 1 @sqlstate = RETURNED_SQLSTATE,  @errno = MYSQL_ERRNO, @text = MESSAGE_TEXT;
		SET OutResponseCode = @errno;
		SET OutStatus='F';
		SET OutDesc=@text;
		CALL `proc_error_log`('proc_change_password',@errno,@text);
	END;	
	
	select count(1) into v_count from tbl_users_master	
	where `user_id`=in_userid
	and password=in_old_password;	
	
if v_count=0
then
		SET OutResponseCode=-1;
		SET OutStatus = 'failure';
		SET OutDesc = 'Invalid Password or User ';
else
	
    	
	
	update tbl_users_master
	set password =in_password
	WHERE `user_id`=in_userid;
	
		SET OutResponseCode=0;
		SET OutStatus = 'success';
		SET OutDesc = 'password changed successfully.';
	
	 
		
end if;
	 
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `proc_check_compatibility` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`ussddev`@`%` PROCEDURE `proc_check_compatibility`(IN in_service_code VARCHAR(50),
						IN in_header_code VARCHAR(50),
						OUT OutResponseCode INT,
						OUT OutDesc VARCHAR(200))
compatibility : BEGIN
  DECLARE v_service_id1,v_service_id2,v_count1,v_count2 INT;
  
  DECLARE EXIT HANDLER FOR SQLEXCEPTION
		 BEGIN
			GET DIAGNOSTICS CONDITION 1 @sqlstate = RETURNED_SQLSTATE,  @errno = MYSQL_ERRNO, @text = MESSAGE_TEXT;
			SET OutResponseCode = @errno;
			SET OutDesc=@text;
			CALL `proc_error_log`('proc_check_compatibility',@errno,@text);
		END;
		
		
	SELECT service_id INTO v_service_id1 FROM tbl_service_master WHERE service_code = in_service_code;
	SELECT service_id INTO v_service_id2 FROM tbl_service_master WHERE service_code = in_header_code;
		
		
	SELECT COUNT(1) INTO v_count1 FROM tbl_service_nodes WHERE service_id = v_service_id1 AND parent_id = 0 AND node_type = 1;
	SELECT COUNT(1) INTO v_count2 FROM tbl_service_nodes WHERE service_id = v_service_id2 AND parent_id = 0 AND node_type = 1;
	 select v_count1;
	 select v_count2;
		IF v_count1 =0 OR v_count2 = 0 THEN
			SET OutResponseCode = 0;
			SET OutDesc='FALSE';
			LEAVE compatibility;
		ELSE 	
		TRUNCATE TABLE tbl_check;
		
			INSERT INTO tbl_check SELECT sequence_no FROM  tbl_service_nodes WHERE service_id = v_service_id1 AND parent_id = 0 AND is_header = 0 AND is_footer = 0;
			INSERT INTO tbl_check SELECT sequence_no FROM tbl_service_nodes WHERE service_id = v_service_id2 AND parent_id = 0 AND is_header = 0 AND is_footer = 0;	
			CREATE TEMPORARY TABLE tbl_check_tmp SELECT sequence_no,COUNT(1) AS `count` FROM tbl_check GROUP BY sequence_no HAVING COUNT(1)>1;
			
			SELECT COUNT(1) INTO @vCount3 FROM tbl_check_tmp;
					IF @vCount3 >0 THEN 
						SET OutResponseCode = 0;
						SET OutDesc='FALSE';
						DROP TEMPORARY TABLE  tbl_check_tmp;
						LEAVE compatibility;
					ELSE 
						
						SET OutResponseCode = 1;
						DROP TEMPORARY TABLE  tbl_check_tmp;
						SET OutDesc='TRUE';
					
					END IF;		
				
		END IF;
		
 END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `proc_clear_notification` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_clear_notification`(
							IN in_login_id INT,
							in in_user_id int,
							OUT OutStatus VARCHAR(100),
							OUT OutResponseCode INT,
							OUT OutDesc VARCHAR(2000)
							)
proc:BEGIN
DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		GET DIAGNOSTICS CONDITION 1 @sqlstate = RETURNED_SQLSTATE,  @errno = MYSQL_ERRNO, @text = MESSAGE_TEXT;
		SET OutResponseCode = @errno;
		SET OutStatus='F';
		SET OutDesc=@text;
		 CALL `proc_error_log`('proc_clear_notification',@errno,@text);
	END;
if not exists (select 1 from `tbl_notification` where `user_id`=in_login_id and status <> 3)
then
		SET OutResponseCode=0;
		SET OutStatus = 'failure';
		SET OutDesc = 'No notifications available.';
		leave proc;
end if;
	
	
		UPDATE tbl_notification
		SET `status`=3
		where user_id=in_login_id;
	
		SET OutResponseCode=0;
		SET OutStatus = 'success';
		SET OutDesc = 'Notification Clear Successfully.';
	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `proc_commit_service` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_commit_service`(
	IN in_login_id INT,
	IN in_version_type VARCHAR(100),
	IN in_service_id INT,
	IN in_remarks VARCHAR(100),
	OUT OutStatus VARCHAR(100),
	OUT OutResponseCode INT,
	OUT OutDesc VARCHAR(200)
					
)
proc:BEGIN
  DECLARE v_edit_flag,v_parent_service_id,v_login_id INT;
  DECLARE new_major_version ,new_minor_version INT;
  DECLARE v_current_version_major,v_current_version_minor INT;
  declare  v_service_names,v_service_codes varchar(100);		
	
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
BEGIN
		GET DIAGNOSTICS CONDITION 1 @sqlstate = RETURNED_SQLSTATE,  @errno = MYSQL_ERRNO, @text = MESSAGE_TEXT;
		SET OutResponseCode = @errno;
		SET OutStatus='F';
		SET OutDesc=@text;
		ROLLBACK;
		 CALL `proc_error_log`('proc_commit_service',@errno,@text);
	END;
		START TRANSACTION;
 
	SELECT  `parent_service_id`,`service_name`,`service_code`
	 INTO v_parent_service_id ,v_service_names,v_service_codes 
	FROM `tbl_service_master` WHERE `service_id`=in_service_id LIMIT 1;
  
	IF v_parent_service_id = 0 THEN
	 	SELECT edit_flag,creator_id INTO v_edit_flag,v_login_id FROM tbl_edit_service_history
		WHERE service_id =in_service_id AND edit_flag =1 LIMIT 1;
	 ELSE
	 	SELECT edit_flag,creator_id INTO v_edit_flag,v_login_id FROM tbl_edit_service_history
		WHERE service_id =v_parent_service_id AND edit_flag =1 LIMIT 1;
	 END IF;
	
	
	IF v_edit_flag<>1
	THEN
		SET OutResponseCode = 1;
		SET OutStatus = 'F';
		SET OutDesc = 'Service is not in Edit mode';
		ROLLBACK;
		LEAVE proc;
	ELSEIF v_login_id <> in_login_id THEN
		SET OutResponseCode = 1;
		SET OutStatus = 'F';
		SET OutDesc = 'You are not autherised as other user is working on this service';
		ROLLBACK;
		LEAVE proc;
	END IF; 
 
   
  
	IF v_parent_service_id=0
		THEN
			SELECT `current_version_major`,`current_version_minor` 
			INTO v_current_version_major,v_current_version_minor
			FROM `tbl_edit_service_history`
			WHERE 	`service_id`=in_service_id 
			AND edit_flag=1 LIMIT 1;
		  
			
          			
	
	
	
		IF v_current_version_major = 0 AND v_current_version_minor=0 THEN
			SET new_major_version=1;
			SET new_minor_version=0;
			
		
		ELSE
				IF in_version_type='MAJOR'
				
					THEN
					SET new_major_version=v_current_version_major+1;
					SET new_minor_version=0; 
						
					
				ELSE
				  
					 SET new_major_version=v_current_version_major;
					 SET new_minor_version=v_current_version_minor+1; 				
				
				END IF;
		END IF;
		
		
				
				
			
				
			INSERT INTO `tbl_service_nodes_revision`(
						`node_id`,
						`parent_id`,
						`status`,
						`service_id`,		
						`parent_service_id`,
						`service_code`,
						`request_text`,
						`response_text`,
						`regex`,		
						`invalid_response_text`,	
						`invalid_menu_flag`,
						`node_type`,
						`is_header`,
						`is_footer`,		
						`is_list_element`,
						`is_application_node`,
						`preference`,
						`menu_flag`,
						`dcs`,			
						`application_id`,
						`variable_name`,
						`variable_value`,	
						`switch_service_id`,	
						`switch_service_code`,
						`circle_id`,	
						`operator_id`,
						`if_clause`,		
						`if_value_clause`,
						`version_major`,
						`version_minor`,
						`created_on`,	
						`last_modified`,
						`sequence_no`
						)
						SELECT
						`node_id`,
						`parent_id`,
						`status`,
						`service_id`,		
						`parent_service_id`,
						`service_code`,
						`request_text`,
						`response_text`,
						`regex`,		
						`invalid_response_text`,	
						`invalid_menu_flag`,
						`node_type`,
						`is_header`,
						`is_footer`,		
						`is_list_element`,
						`is_application_node`,
						`preference`,
						`menu_flag`,
						`dcs`,			
						`application_id`,
						`variable_name`,
						`variable_value`,	
						`switch_service_id`,	
						`switch_service_code`,
						`circle_id`,	
						`operator_id`,
						`if_clause`,		
						`if_value_clause`,
						`version_major`,
						`version_minor`,
						`created_on`,	
						`last_modified`,
						`sequence_no`
					FROM `tbl_service_nodes`
					WHERE (service_id=in_service_id 
					OR parent_service_id = in_service_id);
			
							
				
				DELETE FROM tbl_service_nodes 
				WHERE (service_id=in_service_id OR parent_service_id = in_service_id);	
					
						
				
			INSERT INTO `tbl_service_nodes`(
						`node_id`,
						`parent_id`,
						`status`,
						`service_id`,		
						`parent_service_id`,
						`service_code`,
						`request_text`,
						`response_text`,
						`regex`,		
						`invalid_response_text`,	
						`invalid_menu_flag`,
						`node_type`,
						`is_header`,
						`is_footer`,		
						`is_list_element`,
						`is_application_node`,
						`preference`,
						`menu_flag`,
						`dcs`,			
						`application_id`,
						`variable_name`,
						`variable_value`,	
						`switch_service_id`,	
						`switch_service_code`,
						`circle_id`,	
						`operator_id`,
						`if_clause`,		
						`if_value_clause`,
						`version_major`,
						`version_minor`,
						`created_on`,	
						`last_modified`,
						`sequence_no`
						)
						SELECT
						`node_id`,
						`parent_id`,
						`status`,
						`service_id`,		
						`parent_service_id`,
						`service_code`,
						`request_text`,
						`response_text`,
						`regex`,		
						`invalid_response_text`,	
						`invalid_menu_flag`,
						`node_type`,
						`is_header`,
						`is_footer`,		
						`is_list_element`,
						`is_application_node`,
						`preference`,
						`menu_flag`,
						`dcs`,			
						`application_id`,
						`variable_name`,
						`variable_value`,	
						`switch_service_id`,	
						`switch_service_code`,
						`circle_id`,	
						`operator_id`,
						`if_clause`,		
						`if_value_clause`,
						new_major_version,
						new_minor_version,
						`created_on`,	
						`last_modified`,
						`sequence_no`
					FROM `tbl_service_nodes_temp`
					WHERE service_id=in_service_id OR parent_service_id = in_service_id;		
					
					
					UPDATE `tbl_edit_service_history`
					SET `new_version_major`=new_major_version,
					    `new_version_minor`=new_minor_version,
					    `edit_flag`=2,
					    remarks=in_remarks,
					    modified_by=in_login_id,
					    last_modified=NOW()
					WHERE (service_id=in_service_id OR parent_service_id = in_service_id) 
					AND edit_flag=1;		
					
				
					
					
					UPDATE `tbl_service_master`
					SET `version_major`=new_major_version,
					     `version_minor`=new_minor_version,
					     last_modified=NOW()
					 WHERE (service_id=in_service_id OR parent_service_id = in_service_id) ;
			
			
					
					DELETE FROM tbl_service_nodes_temp WHERE (service_id=in_service_id OR parent_service_id = in_service_id);
					
					
				
					
					INSERT INTO `tbl_revision_history`
					(
					`service_id`,
					`service_name`,
					`service_code`,
					`modified_by`,
					`old_version_major`,
					`old_version_minor`,
					`new_version_major`,
					`new_version_minor`,
					`remarks`,
					`created_on`
					)
					VALUES 
					(
					in_service_id,
					v_service_names,
					v_service_codes,
					 in_login_id,
					 v_current_version_major,
					 v_current_version_minor,
					 new_major_version,
					 new_minor_version,
					 in_remarks,
					 CURRENT_TIMESTAMP
					 )
					 ;
					 COMMIT;
					SET OutResponseCode = 1;
					SET OutStatus = 'Success';
					SET OutDesc = 'Success';			
	ELSE
			SELECT  `service_name`,`service_code`
	 		INTO  v_service_names,v_service_codes 
			FROM `tbl_service_master` WHERE `service_id`=v_parent_service_id LIMIT 1;
			
			SELECT `current_version_major`,`current_version_minor` 
			INTO v_current_version_major,v_current_version_minor
			FROM `tbl_edit_service_history`
			WHERE 	`service_id`=v_parent_service_id AND edit_flag=1 LIMIT 1 ;
		  
         			
				IF in_version_type='MAJOR'
				
					THEN
					SET new_major_version=v_current_version_major+1;
					SET new_minor_version=0; 	
					
				ELSE
				  
					 SET new_major_version=v_current_version_major;
					 SET new_minor_version=v_current_version_minor+1; 
						
				
				END IF;
				
          
		
					
			INSERT INTO `tbl_service_nodes_revision`(
						`node_id`,
						`parent_id`,
						`status`,
						`service_id`,		
						`parent_service_id`,
						`service_code`,
						`request_text`,
						`response_text`,
						`regex`,		
						`invalid_response_text`,	
						`invalid_menu_flag`,
						`node_type`,
						`is_header`,
						`is_footer`,		
						`is_list_element`,
						`is_application_node`,
						`preference`,
						`menu_flag`,
						`dcs`,			
						`application_id`,
						`variable_name`,
						`variable_value`,	
						`switch_service_id`,	
						`switch_service_code`,
						`circle_id`,	
						`operator_id`,
						`if_clause`,		
						`if_value_clause`,
						`version_major`,
						`version_minor`,
						`created_on`,	
						`last_modified`,
						`sequence_no`
						)
						SELECT
						`node_id`,
						`parent_id`,
						`status`,
						`service_id`,		
						`parent_service_id`,
						`service_code`,
						`request_text`,
						`response_text`,
						`regex`,		
						`invalid_response_text`,	
						`invalid_menu_flag`,
						`node_type`,
						`is_header`,
						`is_footer`,		
						`is_list_element`,
						`is_application_node`,
						`preference`,
						`menu_flag`,
						`dcs`,			
						`application_id`,
						`variable_name`,
						`variable_value`,	
						`switch_service_id`,	
						`switch_service_code`,
						`circle_id`,	
						`operator_id`,
						`if_clause`,		
						`if_value_clause`,
						`version_major`,
						`version_minor`,
						`created_on`,	
						`last_modified`,
						`sequence_no`
					FROM `tbl_service_nodes`
					WHERE (service_id=v_parent_service_id 
					OR parent_service_id = v_parent_service_id);
			
							
				
				DELETE FROM tbl_service_nodes 
				WHERE (service_id=v_parent_service_id OR parent_service_id = v_parent_service_id);	
					
				
				UPDATE `tbl_service_nodes_temp`
					SET `version_major`=new_major_version,
					    `version_minor`=new_minor_version
					 WHERE service_id=v_parent_service_id OR parent_service_id = v_parent_service_id;
						
				
			INSERT INTO `tbl_service_nodes`(
						`node_id`,
						`parent_id`,
						`status`,
						`service_id`,		
						`parent_service_id`,
						`service_code`,
						`request_text`,
						`response_text`,
						`regex`,		
						`invalid_response_text`,	
						`invalid_menu_flag`,
						`node_type`,
						`is_header`,
						`is_footer`,		
						`is_list_element`,
						`is_application_node`,
						`preference`,
						`menu_flag`,
						`dcs`,			
						`application_id`,
						`variable_name`,
						`variable_value`,	
						`switch_service_id`,	
						`switch_service_code`,
						`circle_id`,	
						`operator_id`,
						`if_clause`,		
						`if_value_clause`,
						`version_major`,
						`version_minor`,
						`created_on`,	
						`last_modified`,
						`sequence_no`
						)
						SELECT
						`node_id`,
						`parent_id`,
						`status`,
						`service_id`,		
						`parent_service_id`,
						`service_code`,
						`request_text`,
						`response_text`,
						`regex`,		
						`invalid_response_text`,	
						`invalid_menu_flag`,
						`node_type`,
						`is_header`,
						`is_footer`,		
						`is_list_element`,
						`is_application_node`,
						`preference`,
						`menu_flag`,
						`dcs`,			
						`application_id`,
						`variable_name`,
						`variable_value`,	
						`switch_service_id`,	
						`switch_service_code`,
						`circle_id`,	
						`operator_id`,
						`if_clause`,		
						`if_value_clause`,
						`version_major`,
						`version_minor`,
						`created_on`,	
						`last_modified`,
						`sequence_no`
					FROM `tbl_service_nodes_temp`
					WHERE service_id=v_parent_service_id OR parent_service_id = v_parent_service_id;		
					
					
					UPDATE `tbl_edit_service_history`
					SET `new_version_major`=new_major_version,
					    `new_version_minor`=new_minor_version,
					    `edit_flag`=2,
					    remarks=in_remarks,
					    modified_by=in_login_id,
					    last_modified=NOW()
					WHERE (service_id=v_parent_service_id OR parent_service_id = v_parent_service_id) 
					AND edit_flag=1;		
				
					
					
					UPDATE `tbl_service_master`
					SET `version_major`=new_major_version,
					     `version_minor`=new_minor_version,
					     last_modified=NOW()
					 WHERE (service_id=v_parent_service_id OR parent_service_id = v_parent_service_id) ;
					  
					  
					
					DELETE FROM tbl_service_nodes_temp WHERE (service_id=v_parent_service_id OR parent_service_id = v_parent_service_id);
					
						
					
					
					INSERT INTO `tbl_revision_history`
					(
					`service_id`,
					`service_name`,
					`service_code`,
					`modified_by`,
					`old_version_major`,
					`old_version_minor`,
					`new_version_major`,
					`new_version_minor`,
					`remarks`,
					`created_on`
					)
					VALUES 
					(
					v_parent_service_id,
					v_service_names,
					v_service_codes,
					 in_login_id,
					 v_current_version_major,
					 v_current_version_minor,
					 new_major_version,
					 new_minor_version,
					 in_remarks,
					 CURRENT_TIMESTAMP
					 )
					 ;
					 COMMIT;
					SET OutResponseCode = 1;
					SET OutStatus = 'Success';
					SET OutDesc = 'Success';
					
				
					
	END IF;
					
									
  
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `proc_copy_nodes_recursively` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_copy_nodes_recursively`(IN in_service_id INT,IN in_source_id INT,IN in_destination_id INT)
BEGIN
  
  DECLARE done INT DEFAULT FALSE;
  DECLARE v_node_id,v_parent_id, v_status, v_service_id, v_invalid_menu_flag, v_node_type, v_is_header, v_is_footer, v_is_list_element, v_last_last_insert_id INT;
  DECLARE v_preference, v_menu_flag, v_dcs, v_application_id, v_variable_name, v_switch_service_id,v_circle_id, v_operator_id, v_if_clause, v_is_application_node  INT;
  DECLARE v_service_code, v_request_text, v_response_text, v_regex, v_invalid_response_text, v_variable_value, v_switch_service_code, v_if_value_clause VARCHAR(250);
  declare v_edit_flag ,v_parent_service_id int;
  
  
	  DECLARE C1 CURSOR FOR
		SELECT 		node_id,
				parent_id,
				STATUS,
				service_id,
				parent_service_id,
				service_code,
				request_text,
				response_text,
				regex,
				invalid_response_text,
				invalid_menu_flag,
				node_type,
				is_header,
				is_footer,
				is_list_element,
				preference,
				menu_flag,
				dcs,
				application_id,
				variable_name, 
				variable_value,
				switch_service_id,
				switch_service_code,
				circle_id,
				operator_id,
				if_clause,
				if_value_clause,
				is_application_node
		FROM `tbl_service_nodes_temp` 
		WHERE 
		
	 service_id=in_service_id
		AND parent_id = in_source_id;
	  
	  DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
	    
	  SET @@SESSION.max_sp_recursion_depth=100;
	 
	  OPEN C1;
		read_loop: LOOP
		FETCH C1 INTO v_node_id,v_parent_id, v_status, v_service_id,v_parent_service_id, v_service_code, v_request_text, v_response_text, v_regex, v_invalid_response_text, v_invalid_menu_flag, v_node_type, v_is_header, v_is_footer, v_is_list_element, v_preference, v_menu_flag, v_dcs, v_application_id, v_variable_name, v_variable_value, v_switch_service_id, v_switch_service_code, v_circle_id, v_operator_id, v_if_clause, v_if_value_clause, v_is_application_node;
		IF done THEN
		    LEAVE read_loop;
		END IF;
		    
		    INSERT IGNORE INTO `tbl_service_nodes_temp`(parent_id, status, service_id,parent_service_id, service_code, request_text, response_text, regex, invalid_response_text, invalid_menu_flag, node_type, is_header, is_footer, is_list_element, preference, menu_flag, dcs, application_id, variable_name, variable_value, switch_service_id, switch_service_code, circle_id, operator_id, if_clause, if_value_clause, created_on, is_application_node) 
		    VALUES(in_destination_id,v_status, v_service_id,v_parent_service_id, v_service_code, v_request_text, v_response_text, v_regex, v_invalid_response_text, v_invalid_menu_flag, v_node_type, v_is_header, v_is_footer, v_is_list_element, v_preference, v_menu_flag, v_dcs, v_application_id, v_variable_name, v_variable_value, v_switch_service_id, v_switch_service_code, v_circle_id, v_operator_id, v_if_clause, v_if_value_clause, NOW(), v_is_application_node);
		    
		    SELECT LAST_INSERT_ID() INTO v_last_last_insert_id;
		    
		    IF v_last_last_insert_id IS NOT NULL THEN
			CALL proc_copy_nodes_recursively(v_service_id,v_node_id,v_last_last_insert_id);
		    END IF;
		    
			  
		END LOOP read_loop;
	  CLOSE C1;
 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `proc_copy_nodes_recursively_new` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_copy_nodes_recursively_new`(IN in_src_service_id INT,IN in_dest_service_id INT,IN in_source_id INT,IN in_destination_id INT)
BEGIN
  
  DECLARE done INT DEFAULT FALSE;
  DECLARE v_node_id,v_parent_id, v_status, v_service_id, v_invalid_menu_flag, v_node_type, v_is_header, v_is_footer, v_is_list_element, v_last_last_insert_id INT;
  DECLARE v_preference, v_menu_flag, v_dcs, v_application_id, v_variable_name, v_switch_service_id, v_operator_id, v_if_clause, v_is_application_node  INT;
  DECLARE v_service_code,v_dest_service_code, v_request_text, v_response_text, v_regex, v_invalid_response_text, v_variable_value, v_switch_service_code, v_if_value_clause VARCHAR(250);
  DECLARE v_sequence_no, v_circle_id VARCHAR(100);
  declare v_parent_service_id,v_dest_parent_service_id int ;
  
  
 
  
  DECLARE C1 CURSOR FOR
	SELECT 	node_id,
			parent_id,
			STATUS,
			service_id,
			parent_service_id,
			service_code,
			request_text,
			response_text,
			regex,
			invalid_response_text,
			invalid_menu_flag,
			node_type,
			is_header,
			is_footer,
			is_list_element,
			preference,
			menu_flag,
			dcs,
			application_id,
			variable_name, 
			variable_value,
			switch_service_id,
			switch_service_code,
			circle_id,
			operator_id,
			if_clause,
			if_value_clause,
			is_application_node,
			sequence_no
	FROM tbl_service_nodes 
	WHERE
	
    service_id=in_src_service_id
	AND parent_id = in_source_id;
  
  DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
    
  SET @@SESSION.max_sp_recursion_depth=100;
  
  
  
  
 
 
 
  SELECT service_code,parent_service_id INTO v_dest_service_code,v_dest_parent_service_id  from`tbl_service_master` where `service_id`=in_dest_service_id;
 
  OPEN C1;
	read_loop: LOOP
		
        FETCH C1 INTO v_node_id,v_parent_id, v_status, v_service_id,v_parent_service_id, v_service_code, v_request_text, v_response_text, v_regex, v_invalid_response_text, v_invalid_menu_flag, v_node_type, v_is_header, v_is_footer, v_is_list_element, v_preference, v_menu_flag, v_dcs, v_application_id, v_variable_name, v_variable_value, v_switch_service_id, v_switch_service_code, v_circle_id, v_operator_id, v_if_clause, v_if_value_clause, v_is_application_node,v_sequence_no;
        IF done THEN
            LEAVE read_loop;
    	END IF;
	    
	    
	    
	    INSERT IGNORE INTO `tbl_service_nodes_temp`(parent_id, status, service_id,parent_service_id, service_code, request_text, response_text, regex, invalid_response_text, invalid_menu_flag, node_type, is_header, is_footer, is_list_element, preference, menu_flag, dcs, application_id, variable_name, variable_value, switch_service_id, switch_service_code, circle_id, operator_id, if_clause, if_value_clause, created_on, is_application_node,sequence_no) 
	    VALUES(in_destination_id,v_status, in_dest_service_id,v_dest_parent_service_id, v_dest_service_code, v_request_text, v_response_text, v_regex, v_invalid_response_text, v_invalid_menu_flag, v_node_type, v_is_header, v_is_footer, v_is_list_element, v_preference, v_menu_flag, v_dcs, v_application_id, v_variable_name, v_variable_value, v_switch_service_id, v_switch_service_code, v_circle_id, v_operator_id, v_if_clause, v_if_value_clause, NOW(), v_is_application_node,v_sequence_no);
	    
	    SELECT LAST_INSERT_ID() INTO v_last_last_insert_id;
	    
	    SET v_last_last_insert_id=IFNULL(v_last_last_insert_id,0);
	  
	    
	    
	    IF v_last_last_insert_id <> 0 THEN
	    	CALL proc_copy_nodes_recursively_new(v_service_id,in_dest_service_id,v_node_id,v_last_last_insert_id);
	    END IF;
	    
	          
	END LOOP read_loop;
  CLOSE C1;
  
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `proc_copy_paste_node` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_copy_paste_node`( 
								IN in_login_id INT, 
								IN in_service_id INT, 
								IN in_source_id INT,
								IN in_destination_id INT, 
								OUT OutStatus VARCHAR(100), 
								OUT OutResponseCode INT, 
								OUT OutDesc VARCHAR(200) 
							      )
proc:BEGIN
		DECLARE v_source_node_type,v_destination_node_type,v_is_src_application_node,v_is_dest_application_node INT;
		DECLARE v_node_id,v_parent_id, v_status, v_service_id, v_invalid_menu_flag, v_node_type, v_is_header, v_is_footer, v_is_list_element, v_last_last_insert_id INT;
  		DECLARE v_preference, v_menu_flag, v_dcs, v_application_id, v_variable_name, v_switch_service_id,v_circle_id, v_operator_id, v_if_clause, v_is_application_node,vPreference  INT;
  		DECLARE v_service_code, v_request_text, v_response_text, v_regex, v_invalid_response_text, v_variable_value, v_switch_service_code, v_if_value_clause VARCHAR(250);
		declare v_edit_flag,v_login_id,v_parent_service_id int;
	
	SELECT  `parent_service_id` INTO v_parent_service_id FROM `tbl_service_master` WHERE `service_id`=in_service_id LIMIT 1;
  
	IF v_parent_service_id = 0 THEN
	 	SELECT edit_flag,creator_id INTO v_edit_flag,v_login_id FROM tbl_edit_service_history
		WHERE service_id =in_service_id AND edit_flag =1 LIMIT 1;
		
		update `tbl_edit_service_history`
		set`last_modified`=now()
		WHERE service_id = in_service_id and `edit_flag`=1;
	 ELSE
	 	SELECT edit_flag,creator_id INTO v_edit_flag,v_login_id FROM tbl_edit_service_history
		WHERE service_id =v_parent_service_id AND edit_flag =1 LIMIT 1;
		
		update `tbl_edit_service_history`
		set`last_modified`=now()
		WHERE service_id = v_parent_service_id and `edit_flag`=1;
	 END IF;
	
	
	IF v_edit_flag<>1
	THEN
		SET OutResponseCode = 1;
		SET OutStatus = 'F';
		SET OutDesc = 'Service is not in Edit mode';
		LEAVE proc;
	ELSEIF v_login_id <> in_login_id THEN
		SET OutResponseCode = 1;
		SET OutStatus = 'F';
		SET OutDesc = 'You are not autherised as other user is working on this service';
		LEAVE proc;
	END IF; 
	
	
	
		IF NOT EXISTS (SELECT 1 FROM `tbl_service_nodes_temp` WHERE service_id = in_service_id AND node_id=in_source_id) THEN
			SET OutResponseCode=-1;
			SET OutStatus = 'Failure';
			SET OutDesc = 'Invalid source node';
			LEAVE proc;
		END IF;
		
		
		IF in_destination_id <> 0 THEN
			IF NOT EXISTS(SELECT 1 FROM `tbl_service_nodes_temp` WHERE service_id = in_service_id AND node_id=in_destination_id) THEN
				SET OutResponseCode=-1;
				SET OutStatus = 'Failure';
				SET OutDesc = 'Invalid destination node';
				LEAVE proc;
			END IF;
		END IF;
		
		SELECT node_type, is_application_node INTO v_source_node_type, v_is_src_application_node 
	    	FROM `tbl_service_nodes_temp` WHERE service_id = in_service_id AND node_id=in_source_id LIMIT 1;
	    
	    SELECT node_type, is_application_node INTO v_destination_node_type, v_is_dest_application_node 
	    	FROM `tbl_service_nodes_temp` WHERE service_id = in_service_id AND parent_id=in_destination_id LIMIT 1;
	    	
	    IF v_is_src_application_node = 1 THEN
					SET OutResponseCode=-1;
					SET OutStatus = 'Failure';
					SET OutDesc = 'Cannot copy application nodes as they are auto generated.';
					LEAVE proc;	
	    ELSEIF v_is_src_application_node = 2 THEN
					SET OutResponseCode=-1;
					SET OutStatus = 'Failure';
					SET OutDesc = 'Cannot copy logical nodes as they are auto generated.';
					LEAVE proc;
		END IF;
	    		
		IF NOT EXISTS (SELECT 1 FROM `tbl_service_nodes_temp` WHERE service_id = in_service_id AND parent_id=in_destination_id) THEN
			
			INSERT INTO `tbl_service_nodes_temp`( parent_id, STATUS, service_id,`parent_service_id`, service_code, request_text, response_text, regex, invalid_response_text, invalid_menu_flag, node_type, is_header, is_footer, is_list_element, preference, menu_flag, dcs, application_id, variable_name, variable_value, switch_service_id, switch_service_code, circle_id, operator_id, if_clause, if_value_clause, is_application_node, sequence_no)  (SELECT in_destination_id,STATUS, service_id,parent_service_id,service_code, request_text, response_text, regex, invalid_response_text, invalid_menu_flag, node_type, is_header, is_footer, is_list_element, preference, menu_flag, dcs, application_id, variable_name, variable_value, switch_service_id, switch_service_code, circle_id, operator_id, if_clause, if_value_clause, is_application_node, sequence_no FROM `tbl_service_nodes_temp` WHERE service_id = in_service_id and node_id=in_source_id);
			SELECT LAST_INSERT_ID() INTO v_last_last_insert_id;
	    	CALL proc_copy_nodes_recursively(in_service_id,in_source_id,v_last_last_insert_id);
	    	
	    	
		IF v_source_node_type = 1 THEN
	    		INSERT INTO `tbl_service_nodes_temp`( parent_id, STATUS,service_id,`parent_service_id`, service_code, request_text, response_text, regex, invalid_response_text, invalid_menu_flag, node_type, is_header, is_footer, is_list_element, preference, menu_flag, dcs, application_id, variable_name, variable_value, switch_service_id, switch_service_code, circle_id, operator_id, if_clause, if_value_clause, is_application_node,sequence_no)  
	    		(SELECT in_destination_id,STATUS,service_id,parent_service_id,service_code, '', '', '', NULL, NULL, 1, 1, 0, 0, 0, menu_flag, 0, 0, 0, NULL, 0, 'NA', '', NULL, NULL, NULL, 0 , sequence_no FROM `tbl_service_nodes_temp` WHERE service_id = in_service_id AND node_id=in_source_id);
	    		
	    		INSERT INTO `tbl_service_nodes_temp`( parent_id, STATUS,service_id,`parent_service_id`, service_code, request_text, response_text, regex, invalid_response_text, invalid_menu_flag, node_type, is_header, is_footer, is_list_element, preference, menu_flag, dcs, application_id, variable_name, variable_value, switch_service_id, switch_service_code, circle_id, operator_id, if_clause, if_value_clause, is_application_node, sequence_no)  
	    		(SELECT in_destination_id,STATUS,service_id,parent_service_id,service_code, '', '', '', NULL, NULL, 1, 0, 1, 0, 0, menu_flag, 0, 0, 0, NULL, 0, 'NA', '', NULL, NULL, NULL, 0 , sequence_no FROM `tbl_service_nodes_temp` WHERE service_id = in_service_id AND node_id=in_source_id);
	    	
	    	END IF;
	    
	    ELSE
	    		SELECT preference INTO vPreference FROM `tbl_service_nodes_temp` 
	    			WHERE service_id = in_service_id AND parent_id=in_destination_id
	    			AND preference <>99 
	    			ORDER BY preference DESC LIMIT 1; 
	    		SET vPreference=vPreference+1;
	    		
		    	IF v_destination_node_type=1 AND v_source_node_type=1 THEN
		    		SELECT preference INTO vPreference FROM `tbl_service_nodes_temp`
		    		WHERE service_id = in_service_id and parent_id=in_destination_id and preference <> 99 order by preference DESC LIMIT 1;
		    	
		    		SET vPreference=IFNULL(vPreference,0)+1;
		    	
	    			INSERT INTO `tbl_service_nodes_temp`( parent_id, STATUS, service_id,`parent_service_id`, service_code, request_text, response_text, regex, invalid_response_text, invalid_menu_flag, node_type, is_header, is_footer, is_list_element, preference, menu_flag, dcs, application_id, variable_name, variable_value, switch_service_id, switch_service_code, circle_id, operator_id, if_clause, if_value_clause, is_application_node, sequence_no)  (SELECT in_destination_id,STATUS, service_id,`parent_service_id`, service_code, request_text, response_text, regex, invalid_response_text, invalid_menu_flag, node_type, is_header, is_footer, is_list_element, vPreference, menu_flag, dcs, application_id, variable_name, variable_value, switch_service_id, switch_service_code, circle_id, operator_id, if_clause, if_value_clause, is_application_node, sequence_no FROM `tbl_service_nodes_temp` WHERE service_id = in_service_id and node_id=in_source_id);
					SELECT LAST_INSERT_ID() INTO v_last_last_insert_id;
	    			CALL proc_copy_nodes_recursively(in_service_id,in_source_id,v_last_last_insert_id);
	    		ELSE
	    				    			
					SET OutResponseCode=-1;
					SET OutStatus = 'Failure';
					SET OutDesc = 'Cannot copy nodes as the destination node is not empty and the node being copied is a different node type.';
					LEAVE proc;
	    	
	    		END IF;
	    	
		END IF;
		
	
	
		SET OutResponseCode=0;
		SET OutStatus = 'success';
		SET OutDesc = 'Successfully copied';
		
		
			
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `proc_create_notification` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_create_notification`(
						
							in in_user_id int,
							in in_notification_msg varchar(200),
							in in_status int
							)
BEGIN
	
		insert into`tbl_notification`
		(
		`user_id`,
		`notification_msg`,
		`status`,
		 read_date,
		`insert_date`
		)
		values
		(
		in_user_id,
		in_notification_msg,
		in_status,
		null,
		now()
		);
				
 END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `proc_create_service_master` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_create_service_master`(
								IN in_login_id INT,
								IN in_creation_mode INT,
								IN in_source_service_id INT,
								IN in_tree_type INT,
								IN in_parent_service_id INT,
								IN in_service_name VARCHAR(100),
								IN in_service_code VARCHAR(50),
								IN in_description VARCHAR(250),
								OUT OutStatus VARCHAR(100),
								OUT OutResponseCode INT,
								OUT OutDesc VARCHAR(200)
									)
CRM: BEGIN
	
	
	DECLARE v_node_id,v_parent_id,v_service_id,vcount ,v_dest_service_id ,v_last_insert_id INT;
	DECLARE v_service_code,v_request_text,v_response_text,v_switch_service_code,v_source_service_code VARCHAR(1000);
	DECLARE v_invalid_menu_flag,v_node_type,v_is_header,v_is_footer,v_is_list_element INT;
	DECLARE v_preference,v_menu_flag,v_dcs,v_application_id,v_switch_service_id,v_dest_subtree_service_id INT;
	DECLARE v_version_major,v_version_minor,v_new_ver_major,v_new_ver_minor,v_parent_major,v_parent_minor  INT;
	DECLARE v_source_service_name VARCHAR(200);
	DECLARE v_parent_service_id ,v_is_application_node,v_variable_name, v_status ,v_if_clause INT;
	DECLARE v_regex,v_invalid_response_text ,v_variable_value,v_operator_id,v_circle_id,v_if_value_clause VARCHAR(2000);
	
	DECLARE v_serviceid,v_creator_id,vparent_service_id,vscope,vdcs,vversion_major,vversion_minor,vstatus,vlast_modify_by INT;
	DECLARE vservice_name,vservice_code,vcircle,voperator,vsubscriber_type,vdescription,vedit_flag,vkey_value VARCHAR(500);
	declare vOldPrefix,vNewPrefix,vNewServiceCode VARCHAR(300);
	declare v_old_switch_service_id,v_new_switch_service_id int ;
	declare v_new_switch_service_code varchar(200);
	DECLARE done INT DEFAULT FALSE;
	
 
	DECLARE c1 CURSOR FOR 
	SELECT `service_id`,
		`service_name`,
		`service_code`,
		`creator_id`,
		`parent_service_id`,
		`scope`,
		`dcs`,
		`circle`,
		`version_major`,
		`version_minor`,
		`status`,
		`operator`,
		`subscriber_type`,
		`description`,
		`Edit_flag`
	FROM `tbl_service_master`
	WHERE parent_service_id=in_source_service_id;		
	
	
	declare c2 CURSOR FOR 
	select 
	old_switch_service_id,
	new_switch_service_id,
	new_switch_service_code
	from _tbl_switch_service;
	
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
	DECLARE EXIT HANDLER
	FOR SQLEXCEPTION
	BEGIN
		GET DIAGNOSTICS CONDITION 1 @sqlstate = RETURNED_SQLSTATE
			,@errno = MYSQL_ERRNO
			,@text = MESSAGE_TEXT;
		IF @errno=1062
		THEN
			SET OutResponseCode = -1;
			SET OutStatus = 'F';
			SET OutDesc = 'Duplicate Service Code !!';
			
		ELSE
			SET OutResponseCode = @errno;
			SET OutStatus = 'F';
			SET OutDesc = @text;
			
		END IF; 
		ROLLBACK;
		
		CALL `proc_error_log`('proc_create_service_master', @errno, @text);
		
	END;
	
	
		START TRANSACTION;
	DROP TEMPORARY TABLE IF EXISTS _tbl_switch_service;
	create temporary table _tbl_switch_service(old_switch_service_id int,new_switch_service_id INT,new_switch_service_code VARCHAR(100));	
	
SET v_new_ver_major=0;
SET v_new_ver_minor=0;
	
IF in_creation_mode = 2 
	THEN
		IF NOT EXISTS (
				SELECT 1
				FROM tbl_service_master
				WHERE `service_id` = in_source_service_id
				) THEN
		
	
			SET OutResponseCode = 0;
			SET OutStatus = 'Failure';
			SET OutDesc = 'Invalid Source Service Id !!';
			ROLLBACK;
			LEAVE CRM;
		END IF;
	SET v_new_ver_major=1;
	SET v_new_ver_minor=0;
ELSE
	SET in_source_service_id=0;
	SET v_new_ver_major=0;
	SET v_new_ver_minor=0;
END IF;
IF in_tree_type=2
THEN
	IF NOT EXISTS (SELECT 1 FROM `tbl_service_master` WHERE service_id=in_parent_service_id) 
	THEN
		
			SET OutResponseCode = 0;
			SET OutStatus = 'Failure';
			SET OutDesc = 'Invalid Parent Service Id !!';
			ROLLBACK;
		LEAVE CRM;
	END IF;
	
	SELECT version_major,version_minor INTO v_parent_major,v_parent_minor FROM `tbl_service_master` WHERE service_id=in_parent_service_id;
		
	SET v_new_ver_major=v_parent_major;
	SET v_new_ver_minor=v_parent_minor;
ELSE
	SET in_parent_service_id=0;
	
END IF;
	
	
	IF in_creation_mode = 2 
	THEN
	
	SELECT service_code,`service_name` INTO v_source_service_code,v_source_service_name FROM tbl_service_master WHERE service_id=in_source_service_id;
		
	
			INSERT INTO tbl_service_master 
			(
			service_name,
			service_code,
			creator_id,
			parent_service_id,
			STATUS,
			description,
			version_major,
			version_minor,
			created_on
			)
			VALUES 
			(
			in_service_name,
			in_service_code,
			in_login_id,
			in_parent_service_id,
			1,
			in_description,
			v_new_ver_major,
			v_new_ver_minor,
			NOW()
			)
			;
			SELECT LAST_INSERT_ID() INTO v_dest_service_id ;
			
			
			
	
	CALL proc_copy_nodes_recursively_new(in_source_service_id,v_dest_service_id,0,0);
	
	IF in_tree_type=1
	THEN 
		
		OPEN c1;	
			read_loop: LOOP
				SET done = FALSE;
				FETCH c1 INTO v_serviceid,vservice_name,vservice_code,v_creator_id,vparent_service_id,vscope,vdcs,vcircle,vversion_major,vversion_minor,
							vstatus,voperator,vsubscriber_type,vdescription,vedit_flag;
				
				IF done THEN
					LEAVE read_loop;
				END IF;
				
				SET vOldPrefix=CONCAT('PF',IFNULL(v_source_service_code,''),'_');
				SET vNewPrefix=CONCAT('PF',in_service_code,'_');
				
				SET vNewServiceCode=REPLACE(vservice_code,vOldPrefix,'');
				SET vNewServiceCode=CONCAT(vNewPrefix,vNewServiceCode);
				
				 
				
				INSERT INTO tbl_service_master 
						(
						service_name,
						service_code,
						creator_id,
						parent_service_id,
						STATUS,
						description,
						version_major,
						version_minor,
						created_on
						)
						VALUES 
						(
						concat('copy of',vservice_name),
						vNewServiceCode,
						in_login_id,
						v_dest_service_id,
						1,
						concat('copy of',vdescription),
						v_new_ver_major,
						v_new_ver_minor,
						NOW()
						)
						;
						SELECT LAST_INSERT_ID() INTO v_dest_subtree_service_id ;
						
						
				
				CALL proc_copy_nodes_recursively_new(v_serviceid,v_dest_subtree_service_id,0,0);
				INSERT INTO _tbl_switch_service VALUES(v_serviceid,v_dest_subtree_service_id,vNewServiceCode);
			END LOOP;
		CLOSE c1;
			
		OPEN c2;	
			read_loop: LOOP
				SET done = FALSE;
				FETCH c2 INTO v_old_switch_service_id,v_new_switch_service_id,v_new_switch_service_code;
				IF done THEN
					LEAVE read_loop;
					END IF;
				
				update tbl_service_nodes_temp
				set `switch_service_id`=v_new_switch_service_id,
				    `switch_service_code`=v_new_switch_service_code
				    where switch_service_id=v_old_switch_service_id  
					AND (service_id=v_dest_service_id OR `parent_service_id`=v_dest_service_id);
				
			
			END LOOP;
		CLOSE c2;
				
	
	END IF;
	
	INSERT INTO `tbl_service_nodes`(
			`node_id`,
			`parent_id`,
			`status`,
			`service_id`,		
			`parent_service_id`,
			`service_code`,
			`request_text`,
			`response_text`,
			`regex`,		
			`invalid_response_text`,	
			`invalid_menu_flag`,
			`node_type`,
			`is_header`,
			`is_footer`,		
			`is_list_element`,
			`is_application_node`,
			`preference`,
			`menu_flag`,
			`dcs`,			
			`application_id`,
			`variable_name`,
			`variable_value`,	
			`switch_service_id`,	
			`switch_service_code`,
			`circle_id`,	
			`operator_id`,
			`if_clause`,		
			`if_value_clause`,
			`version_major`,
			`version_minor`,
			`sequence_no`
			)
			SELECT
			`node_id`,
			`parent_id`,
			`status`,
			`service_id`,		
			`parent_service_id`,
			`service_code`,
			`request_text`,
			`response_text`,
			`regex`,		
			`invalid_response_text`,	
			`invalid_menu_flag`,
			`node_type`,
			`is_header`,
			`is_footer`,		
			`is_list_element`,
			`is_application_node`,
			`preference`,
			`menu_flag`,
			`dcs`,			
			`application_id`,
			`variable_name`,
			`variable_value`,	
			`switch_service_id`,	
			`switch_service_code`,
			`circle_id`,	
			`operator_id`,
			`if_clause`,		
			`if_value_clause`,
			v_new_ver_major,
			v_new_ver_minor,
			sequence_no
		FROM tbl_service_nodes_temp
		WHERE (service_id=v_dest_service_id OR `parent_service_id`=v_dest_service_id);
		
		delete from tbl_service_nodes_temp WHERE (service_id=v_dest_service_id OR `parent_service_id`=v_dest_service_id);
	
	
		SELECT v_dest_service_id AS service_id;
	
		
		
		IF in_tree_type=1
		THEN
			
		  INSERT INTO `tbl_revision_history`(`service_id`,`service_name`,`service_code`,`modified_by`,`old_version_major`,`old_version_minor`,
				`new_version_major`,`new_version_minor`,`remarks`,`created_on`) 
			VALUES(`v_dest_service_id`,in_service_name,in_service_code,in_login_id,0,0,1,0,CONCAT('New Service created','(Copied from - ',v_source_service_name,')'),NOW());
		END IF;	
	
		
	ELSE
	
		
		INSERT INTO tbl_service_master (
			service_name
			,service_code
			,creator_id
			,parent_service_id
			,STATUS
			,description
			,created_on
			,version_major
			,version_minor
			)
		VALUES (
			in_service_name
			,in_service_code
			,in_login_id
			,in_parent_service_id
			,1
			,in_description
			,NOW()
			,v_new_ver_major
			,v_new_ver_minor
			);
		SELECT LAST_INSERT_ID() AS service_id;
	END IF ;
	COMMIT;
	SET OutResponseCode = 0;
	SET OutStatus = 'success';
	SET OutDesc = 'Service Created Successfully !!';
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `proc_create_service_node` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_create_service_node`(
						IN in_login_id INT(11),
						IN in_parent_id INT(11),
						IN in_status INT(11),
						IN in_service_id INT(11),
						IN in_service_code  VARCHAR(100),
						IN in_request_text VARCHAR(250),
						IN in_response_text VARCHAR(1000),
						IN in_regex VARCHAR(1000),
						IN in_invalid_response_text VARCHAR(1000),
						IN in_invalid_menu_flag INT(11),
						IN in_node_type INT(11),
						IN in_is_header VARCHAR(250),
						IN in_is_footer VARCHAR(250),
						IN in_is_list_element VARCHAR(250),
						IN in_preference INT,
						IN in_menu_flag INT(11),
						IN in_dcs INT(11),
						IN in_application_id INT(11),
						IN in_variable_name INT(11), 
						IN in_variable_value VARCHAR(250),
						IN in_switch_service_id INT(11),
						IN in_switch_service_code VARCHAR(250),
						IN in_circle_id  VARCHAR(250),
						IN in_operator_id  VARCHAR(250),
						IN in_if_clause  INT(11),
						IN in_if_value_clause  VARCHAR(5000),
						IN in_sequence_no  VARCHAR(100),
						OUT OutStatus VARCHAR(100),
						OUT OutResponseCode INT,
						OUT OutDesc VARCHAR(200)
							)
proc: BEGIN  
DECLARE v_parent_service_id,v_edit_flag,v_login_id INT;
		DECLARE done INT DEFAULT FALSE;
		DECLARE v_result VARCHAR(100);
		DECLARE v_node_id INT;	
		DECLARE c_txn_summary CURSOR FOR 	
				
		SELECT DISTINCT(val) FROM temp;
			
			
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		GET DIAGNOSTICS CONDITION 1 @sqlstate = RETURNED_SQLSTATE,  @errno = MYSQL_ERRNO, @text = MESSAGE_TEXT;
		SET OutResponseCode = @errno;
		SET OutStatus='F';
		SET OutDesc=@text;
		 CALL `proc_error_log`('proc_create_service_node',@errno,@text);
	END;
	 
	
	SELECT  `parent_service_id` INTO v_parent_service_id FROM `tbl_service_master` WHERE `service_id`=in_service_id LIMIT 1;
  
	IF v_parent_service_id = 0 THEN
	 	SELECT edit_flag,creator_id INTO v_edit_flag,v_login_id FROM tbl_edit_service_history
		WHERE service_id =in_service_id AND edit_flag =1 LIMIT 1;
	 ELSE
	 	SELECT edit_flag,creator_id INTO v_edit_flag,v_login_id FROM tbl_edit_service_history
		WHERE service_id =v_parent_service_id AND edit_flag =1 LIMIT 1;
	 END IF;
	
	
	IF v_edit_flag<>1
	THEN
		SET OutResponseCode = 1;
		SET OutStatus = 'F';
		SET OutDesc = 'Service is not in Edit mode';
		LEAVE proc;
	ELSEIF v_login_id <> in_login_id THEN
		SET OutResponseCode = 1;
		SET OutStatus = 'F';
		SET OutDesc = 'You are not autherised as other user is working on this service';
		LEAVE proc;
	END IF; 
	
	
	
	
	SELECT service_code INTO in_service_code FROM tbl_service_master 
	WHERE `service_id` = in_service_id LIMIT 1;
	
	IF in_node_type = 5 THEN
		SELECT service_code INTO in_switch_service_code FROM tbl_service_master 
		WHERE `service_id` = in_switch_service_id LIMIT 1;
	END IF;
	
			
			INSERT IGNORE INTO tbl_service_nodes_temp
			(
			
			parent_id,
			STATUS,
			service_id,
			parent_service_id,
			service_code,
			
			response_text,
			regex,
			invalid_response_text,
			invalid_menu_flag,
			node_type,
			is_header,
			is_footer,
			is_list_element,
			preference,
			menu_flag,
			dcs,
			application_id,
			variable_name, 
			variable_value,
			switch_service_id,
			switch_service_code,
			circle_id,
			operator_id,
			if_clause,
			if_value_clause,
			created_on,
			sequence_no
			)	
		
			VALUES 
			(
			in_parent_id,
			in_status,
			in_service_id,
			v_parent_service_id,
			in_service_code,
			
			in_response_text,
			in_regex,
			in_invalid_response_text,
			in_invalid_menu_flag,
			in_node_type,
			IFNULL(in_is_header,0),
			IFNULL(in_is_footer,0),
			IFNULL(in_is_list_element,0),
			IFNULL(in_preference,0),
			in_menu_flag,
			IFNULL(in_dcs,0),
			in_application_id,
			in_variable_name, 
			in_variable_value,
			in_switch_service_id,
			in_switch_service_code,
			in_circle_id,
			in_operator_id,
			in_if_clause,
			in_if_value_clause,
			NOW(),
			in_sequence_no
			);	
		
		SELECT LAST_INSERT_ID() AS node_id INTO v_node_id ;
		
IF in_node_type=4 THEN
	
		DROP TEMPORARY TABLE IF EXISTS temp;
		CREATE TEMPORARY TABLE temp( val CHAR(255) );
		SET @sql = CONCAT("insert into temp (val) values ('", REPLACE(( SELECT GROUP_CONCAT(DISTINCT app_response) AS DATA FROM tbl_application_master WHERE app_id=in_application_id), "|", "'),('"),"');");
		PREPARE stmt1 FROM @sql;
		EXECUTE stmt1;
	
	OPEN c_txn_summary;	
	read_loop: LOOP
	SET done = FALSE;
	FETCH c_txn_summary INTO  v_result;
	
	IF done THEN
		  LEAVE read_loop;
		END IF;
		
		INSERT IGNORE INTO tbl_service_nodes_temp
			(
			
			parent_id,
			STATUS,
			service_id,
			parent_service_id,
			service_code,
			request_text,
			response_text,
			regex,
			invalid_response_text,
			invalid_menu_flag,
			node_type,
			is_header,
			is_footer,
			is_list_element,
			preference,
			menu_flag,
			dcs,
			application_id,
			variable_name, 
			variable_value,
			switch_service_id,
			switch_service_code,
			circle_id,
			operator_id,
			if_clause,
			if_value_clause,
			created_on,
			is_application_node,
			sequence_no
			)	
		
			VALUES 
			(
			v_node_id,
			in_status,
			in_service_id,
			v_parent_service_id,
			in_service_code,
			v_result,
			'',
			'',
			'',
			0,
			1,
			0,
			0,
			0,
			0,
			0,
			0,
			0,
			NULL, 
			NULL,
			NULL,
			NULL,
			NULL,
			NULL,
			NULL,
			NULL,
			NOW(),
			1,
			in_sequence_no
			);
		
		
	
          
           	
	END LOOP;
	CLOSE c_txn_summary;
ELSEIF in_node_type=6
THEN
		DROP TEMPORARY TABLE IF EXISTS temp;
		CREATE TEMPORARY TABLE temp( val CHAR(5000) );
		SET @sql = CONCAT("insert into temp (val) values ('", REPLACE(in_if_value_clause, "|", "'),('"),"');");
		PREPARE stmt1 FROM @sql;
		EXECUTE stmt1;
	
	OPEN c_txn_summary;	
	read_loop: LOOP
	SET done = FALSE;
	FETCH c_txn_summary INTO  v_result;
	
	IF done THEN
		  LEAVE read_loop;
		END IF;
		
		INSERT IGNORE INTO tbl_service_nodes_temp
			(
			
			parent_id,
			STATUS,
			service_id,
			parent_service_id,
			service_code,
			request_text,
			response_text,
			regex,
			invalid_response_text,
			invalid_menu_flag,
			node_type,
			is_header,
			is_footer,
			is_list_element,
			preference,
			menu_flag,
			dcs,
			application_id,
			variable_name, 
			variable_value,
			switch_service_id,
			switch_service_code,
			circle_id,
			operator_id,
			if_clause,
			if_value_clause,
			created_on,
			is_application_node,
			sequence_no
			)	
		
			VALUES 
			(
			v_node_id,
			in_status,
			in_service_id,
			v_parent_service_id,
			in_service_code,
			'',
			'',
			'',
			'',
			0,
			2,
			0,
			0,
			0,
			0,
			0,
			0,
			0,
			NULL, 
			NULL,
			NULL,
			NULL,
			NULL,
			NULL,
			NULL,
			v_result,
			NOW(),
			2,
			in_sequence_no
			);
		
     
           	
	END LOOP;
	CLOSE c_txn_summary;
		
	
END IF;	
			
			SELECT v_node_id AS node_id;
			SET OutResponseCode=0;
			SET OutStatus = 'success';
			SET OutDesc = 'success';
	
		
		UPDATE 	tbl_edit_service_history 
		SET `last_modified` = NOW()
		WHERE service_id =in_service_id AND edit_flag =1;
	
   COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `proc_create_service_node_test5` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`ussddev`@`%` PROCEDURE `proc_create_service_node_test5`(IN in_login_id INT(11),
						IN in_parent_id INT(11),
						IN in_status INT(11),
						IN in_service_id INT(11),
						IN in_service_code  VARCHAR(100),
						IN in_request_text VARCHAR(250),
						IN in_response_text VARCHAR(1000),
						IN in_regex VARCHAR(1000),
						IN in_invalid_response_text VARCHAR(1000),
						IN in_invalid_menu_flag INT(11),
						IN in_node_type INT(11),
						IN in_is_header VARCHAR(250),
						IN in_is_footer VARCHAR(250),
						IN in_is_list_element VARCHAR(250),
						IN in_preference INT,
						IN in_menu_flag INT(11),
						IN in_dcs INT(11),
						IN in_application_id INT(11),
						IN in_variable_name INT(11), 
						IN in_variable_value VARCHAR(250),
						IN in_switch_service_id INT(11),
						IN in_switch_service_code VARCHAR(250),
						IN in_circle_id  VARCHAR(250),
						IN in_operator_id  VARCHAR(250),
						IN in_if_clause  INT(11),
						IN in_if_value_clause  VARCHAR(250),
						OUT OutStatus VARCHAR(100),
						OUT OutResponseCode INT,
						OUT OutDesc VARCHAR(200))
proc: BEGIN
	 
	 DECLARE v_parent_service_id,v_edit_flag,v_login_id INT;
		DECLARE done INT DEFAULT FALSE;
		DECLARE v_result VARCHAR(100);
		DECLARE v_node_id INT;	
		DECLARE c_txn_summary CURSOR FOR 	
				
	        SELECT DISTINCT(val) FROM temp;
		
			
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		GET DIAGNOSTICS CONDITION 1 @sqlstate = RETURNED_SQLSTATE,  @errno = MYSQL_ERRNO, @text = MESSAGE_TEXT;
		SET OutResponseCode = @errno;
		SET OutStatus='F';
		SET OutDesc=@text;
		 CALL `proc_error_log`('proc_create_service_node',@errno,@text);
	END;
	 CALL `proc_error_log`('proc_create_service_node',101,"procedure correct");	
	
	
	SELECT  `parent_service_id` INTO v_parent_service_id FROM `tbl_service_master` WHERE `service_id`=in_service_id LIMIT 1;
  
	IF v_parent_service_id = 0 THEN
	 	SELECT edit_flag,creator_id INTO v_edit_flag,v_login_id FROM tbl_edit_service_history
		WHERE service_id =in_service_id AND edit_flag =1 LIMIT 1;
	 ELSE
	 	SELECT edit_flag,creator_id INTO v_edit_flag,v_login_id FROM tbl_edit_service_history
		WHERE service_id =v_parent_service_id AND edit_flag =1 LIMIT 1;
	 END IF;
	
	CALL `proc_error_log`('proc_create_service_node',102,"procedure correct");
	IF v_edit_flag<>1
	THEN
		CALL `proc_error_log`('proc_create_service_node',103,"procedure correct");
		SET OutResponseCode = 1;
		SET OutStatus = 'F';
		SET OutDesc = 'Service is not in Edit mode';
		LEAVE proc;
	ELSEIF v_login_id <> in_login_id THEN
		CALL `proc_error_log`('proc_create_service_node',104,"procedure correct");
		SET OutResponseCode = 1;
		SET OutStatus = 'F';
		SET OutDesc = 'You are not autherised as other user is working on this service';
		LEAVE proc;
	END IF; 
	CALL `proc_error_log`('proc_create_service_node',105,"procedure correct");
	
	
	
	SELECT service_code INTO in_service_code FROM tbl_service_master 
	WHERE `service_id` = in_service_id LIMIT 1;
	
	IF in_node_type = 5 THEN
		SELECT service_code INTO in_switch_service_code FROM tbl_service_master 
		WHERE `service_id` = in_switch_service_id LIMIT 1;
	END IF;
	
	CALL `proc_error_log`('proc_create_service_node',123,"procedure correct");
			
			INSERT IGNORE INTO tbl_service_nodes_temp
			(
			
			parent_id,
			STATUS,
			service_id,
			parent_service_id,
			service_code,
			
			response_text,
			regex,
			invalid_response_text,
			invalid_menu_flag,
			node_type,
			is_header,
			is_footer,
			is_list_element,
			preference,
			menu_flag,
			dcs,
			application_id,
			variable_name, 
			variable_value,
			switch_service_id,
			switch_service_code,
			circle_id,
			operator_id,
			if_clause,
			if_value_clause,
			created_on
			)	
		
			VALUES 
			(
			in_parent_id,
			in_status,
			in_service_id,
			v_parent_service_id,
			in_service_code,
			
			in_response_text,
			in_regex,
			in_invalid_response_text,
			in_invalid_menu_flag,
			in_node_type,
			IFNULL(in_is_header,0),
			IFNULL(in_is_footer,0),
			IFNULL(in_is_list_element,0),
			IFNULL(in_preference,0),
			in_menu_flag,
			IFNULL(in_dcs,0),
			in_application_id,
			in_variable_name, 
			in_variable_value,
			in_switch_service_id,
			in_switch_service_code,
			in_circle_id,
			in_operator_id,
			in_if_clause,
			in_if_value_clause,
			NOW()
			);	
		
		SELECT LAST_INSERT_ID() AS node_id INTO v_node_id ;
		
IF in_node_type=4 THEN
	
		DROP TEMPORARY TABLE IF EXISTS temp;
		CREATE TEMPORARY TABLE temp( val CHAR(255) );
		SET @sql = CONCAT("insert into temp (val) values ('", REPLACE(( SELECT GROUP_CONCAT(DISTINCT app_response) AS DATA FROM tbl_application_master WHERE app_id=in_application_id), "|", "'),('"),"');");
		PREPARE stmt1 FROM @sql;
		EXECUTE stmt1;
	
	OPEN c_txn_summary;	
	read_loop: LOOP
	SET done = FALSE;
	FETCH c_txn_summary INTO  v_result;
	
	IF done THEN
		  LEAVE read_loop;
		END IF;
		
		INSERT IGNORE INTO tbl_service_nodes_temp
			(
			
			parent_id,
			STATUS,
			service_id,
			parent_service_id,
			service_code,
			request_text,
			response_text,
			regex,
			invalid_response_text,
			invalid_menu_flag,
			node_type,
			is_header,
			is_footer,
			is_list_element,
			preference,
			menu_flag,
			dcs,
			application_id,
			variable_name, 
			variable_value,
			switch_service_id,
			switch_service_code,
			circle_id,
			operator_id,
			if_clause,
			if_value_clause,
			created_on,
			is_application_node
			)	
		
			VALUES 
			(
			v_node_id,
			in_status,
			in_service_id,
			v_parent_service_id,
			in_service_code,
			v_result,
			'',
			'',
			'',
			0,
			1,
			0,
			0,
			0,
			0,
			0,
			0,
			0,
			NULL, 
			NULL,
			NULL,
			NULL,
			NULL,
			NULL,
			NULL,
			NULL,
			NOW(),
			1
			);
		
		
	
          
           	
	END LOOP;
	CLOSE c_txn_summary;
ELSEIF in_node_type=6
THEN
		DROP TEMPORARY TABLE IF EXISTS temp;
		CREATE TEMPORARY TABLE temp( val CHAR(255) );
		SET @sql = CONCAT("insert into temp (val) values ('", REPLACE(in_if_value_clause, "|", "'),('"),"');");
		PREPARE stmt1 FROM @sql;
		EXECUTE stmt1;
	
	OPEN c_txn_summary;	
	read_loop: LOOP
	SET done = FALSE;
	FETCH c_txn_summary INTO  v_result;
	
	IF done THEN
		  LEAVE read_loop;
		END IF;
		
		INSERT IGNORE INTO tbl_service_nodes_temp
			(
			
			parent_id,
			STATUS,
			service_id,
			parent_service_id,
			service_code,
			request_text,
			response_text,
			regex,
			invalid_response_text,
			invalid_menu_flag,
			node_type,
			is_header,
			is_footer,
			is_list_element,
			preference,
			menu_flag,
			dcs,
			application_id,
			variable_name, 
			variable_value,
			switch_service_id,
			switch_service_code,
			circle_id,
			operator_id,
			if_clause,
			if_value_clause,
			created_on,
			is_application_node
			)	
		
			VALUES 
			(
			v_node_id,
			in_status,
			in_service_id,
			v_parent_service_id,
			in_service_code,
			'',
			'',
			'',
			'',
			0,
			2,
			0,
			0,
			0,
			0,
			0,
			0,
			0,
			NULL, 
			NULL,
			NULL,
			NULL,
			NULL,
			NULL,
			NULL,
			v_result,
			NOW(),
			2
			);
		
     
           	
	END LOOP;
	CLOSE c_txn_summary;
		
	
END IF;	
			
			SELECT v_node_id AS node_id;
			SET OutResponseCode=0;
			SET OutStatus = 'success';
			SET OutDesc = 'success';
	
		
		UPDATE 	tbl_edit_service_history 
		SET `last_modified` = NOW()
		WHERE service_id =in_service_id AND edit_flag =1;
	
   COMMIT;
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `proc_create_service_request` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_create_service_request`(
							IN InSRId	INT,
							IN InName  VARCHAR(100),
							IN InDesc  VARCHAR(250),
							IN InTitle VARCHAR(100),
							IN InAssignee VARCHAR(100),	
							IN InTargetDate VARCHAR(100),
							IN InStatus INT,
							IN InLoginId INT,
							OUT OutStatus VARCHAR(100),
							OUT OutResponseCode INT,
							OUT OutDesc VARCHAR(2000)
							)
CreateSR: BEGIN
	DECLARE vSRId  INT;
	declare v_service_name ,v_service_code,v_login_userName, v_msg varchar(100);
	
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		GET DIAGNOSTICS CONDITION 1 @sqlstate = RETURNED_SQLSTATE,  @errno = MYSQL_ERRNO, @text = MESSAGE_TEXT;
		SET OutResponseCode = @errno;
		SET OutStatus='F';
		SET OutDesc=@text;
		 CALL `proc_error_log`('proc_create_service_request',@errno,@text);
	END;
	
	select `service_name`,`service_code` 
	into v_service_name ,v_service_code
	from `tbl_service_master` where `service_id`=InName;
	
	SELECT username INTO v_login_userName FROM tbl_users_master WHERE user_id = InLoginId;
	
	IF ifnull(InSRId,0)=0  THEN
		INSERT INTO `tbl_service_request`
			(
			`service_id`,
			`service_code`,
			`name`,
			`desc`,
			`title`,
			`assignee`,
			`target_date`,
			`status`,
			`created_date`,
			 created_by,
			 `modified_date`
			 
			)
			VALUES 
			(
			InName,
			v_service_code,
			v_service_name,
			InDesc,
			InTitle,
			InAssignee,
			InTargetDate,
			1,
			now(),
			InLoginId,
			now()
			);
			
		
			
		INSERT INTO `tbl_service_request_hist`
			(
			`sr_id`,
			`assignee`,
			`status`,
			`created_date`,
			 created_by
			)
			VALUES 
			(
			vSRId,
			InAssignee,
			1,
			NOW(),
			InLoginId
			);
			
			
		SET v_msg=CONCAT(' SR Request Assigned to you -  ',InTitle,' - By - ',v_login_userName);
		
			CALL `proc_create_notification`(InAssignee,v_msg,0);
		
		
		SET OutResponseCode=0;
		SET OutStatus = 'success';
		SET OutDesc = 'Service request created successfully !!';
	ELSE 
		if InStatus=4
		then
		
				
					
			delete from `tbl_service_request_hist` where sr_id=InSRId;
			
			delete from tbl_service_request	WHERE id=InSRId;
			
			SET OutResponseCode=0;
			SET OutStatus = 'success';
			SET OutDesc = 'Deleted  Successfully !!';
			
			
		else
					UPDATE tbl_service_request
						SET `name`=IFNULL(InName,`name`),
							`desc`=IFNULL(InDesc,`desc`),
							`title`=IFNULL(InTitle,title),
							`assignee`=IFNULL(InAssignee,assignee),
							`target_date`=IFNULL(InTargetDate,target_date),
							`status`=IFNULL(InStatus,`status`),
							`modified_date`=NOW(),
							`modified_by`=InLoginId
						WHERE id=InSRId;
			
							
			SET v_msg=CONCAT(' SR Request change to  -  ',InAssignee,' - By - ',v_login_userName,' for service ',v_service_name);
			
			if InAssignee is not null then
			
				CALL `proc_create_notification`(InAssignee,v_msg,0);
			
				CALL `proc_create_notification`(InLoginId,v_msg,0);
			
			end if;			
						
						
						
						
						
						
						INSERT INTO `tbl_service_request_hist`
							(
							`sr_id`,
							`assignee`,
							`status`,
							`created_date`,
							created_by
							)
							VALUES 
							(
							InSRId,
							InAssignee,
							InStatus,
							NOW(),
							InLoginId
							);
							
				
							
						SET OutResponseCode=0;
						SET OutStatus = 'success';
						SET OutDesc = 'Service Request Updated Successfully.';
		end if;		
	END IF;	
   END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `proc_cut_paste_node` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_cut_paste_node`( 
								IN in_login_id INT, 
								IN in_source_service_id INT,
								IN in_source_node_id INT,
								IN in_dest_service_id INT,
								IN in_dest_node_id INT, 
								OUT OutStatus VARCHAR(100), 
								OUT OutResponseCode INT, 
								OUT OutDesc VARCHAR(200) 
							      )
proc:BEGIN
DECLARE v_source_node_type,v_destination_node_type,v_is_src_application_node,v_is_dest_application_node,v_new_service_id,v_new_parent_service_id INT;
DECLARE v_node_id,v_parent_id, v_status, v_service_id, v_invalid_menu_flag, v_node_type, v_is_header, v_is_footer, v_is_list_element, v_last_last_insert_id INT;
DECLARE v_preference, v_menu_flag, v_dcs, v_application_id, v_variable_name, v_switch_service_id,v_circle_id, v_operator_id, v_if_clause, v_is_application_node,vPreference  INT;
DECLARE v_service_code, v_request_text, v_response_text, v_regex, v_invalid_response_text, v_variable_value, v_switch_service_code, v_if_value_clause,v_new_service_code VARCHAR(250);
DECLARE v_edit_flag,v_login_id,v_parent_service_id INT;
declare v_dest_parent_serive_id int;
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		GET DIAGNOSTICS CONDITION 1 @sqlstate = RETURNED_SQLSTATE,  @errno = MYSQL_ERRNO, @text = MESSAGE_TEXT;
		SET OutResponseCode = @errno;
		SET OutStatus='F';
		SET OutDesc=IFNULL(OutDesc,'Internal Error');
		 CALL `proc_error_log`('proc_cut_paste_node',@errno,@text);
		
        END;
			start transaction;
	
SELECT  `parent_service_id` INTO v_parent_service_id FROM `tbl_service_master` WHERE `service_id`=in_source_service_id LIMIT 1;
	
	
	IF v_parent_service_id = 0 THEN
	 	SELECT edit_flag,creator_id INTO v_edit_flag,v_login_id FROM tbl_edit_service_history
		WHERE service_id =in_source_service_id AND edit_flag =1 LIMIT 1;
		
		UPDATE `tbl_edit_service_history`
		SET`last_modified`=NOW()
		WHERE service_id = in_source_service_id AND `edit_flag`=1;
	 ELSE
	 	SELECT edit_flag,creator_id INTO v_edit_flag,v_login_id FROM tbl_edit_service_history
		WHERE service_id =v_parent_service_id AND edit_flag =1 LIMIT 1;
		
		UPDATE `tbl_edit_service_history`
		SET`last_modified`=NOW()
		WHERE service_id = v_parent_service_id AND `edit_flag`=1;
	 END IF;
	
		
		IF v_edit_flag<>1 
		THEN
			SET OutResponseCode = 1;
			SET OutStatus = 'F';
			SET OutDesc = 'Service is not in Edit mode';
			rollback;
			LEAVE proc;
		ELSEIF v_login_id <> in_login_id THEN
			SET OutResponseCode = 1;
			SET OutStatus = 'F';
			SET OutDesc = 'You are not autherised as other user is working on this service';
			ROLLBACK;
			LEAVE proc;
		END IF;
		 
	IF in_source_node_id = 0 THEN
			SET OutResponseCode=-1;
			SET OutStatus = 'Failure';
			SET OutDesc = 'Cannot cut a root node of a tree. Not Allowed';
			ROLLBACK;
			LEAVE proc;
	END IF;
	
	IF NOT EXISTS (SELECT 1 FROM `tbl_service_nodes_temp` WHERE service_id = in_source_service_id AND node_id=in_source_node_id) THEN
			SET OutResponseCode=-1;
			SET OutStatus = 'Failure';
			SET OutDesc = 'Invalid source node';
			ROLLBACK;
			LEAVE proc;
	END IF;
		
	IF in_dest_node_id <> 0 THEN
		IF NOT EXISTS(SELECT 1 FROM `tbl_service_nodes_temp` WHERE service_id = in_dest_service_id AND node_id=in_dest_node_id) THEN
			SET OutResponseCode=-1;
			SET OutStatus = 'Failure';
			SET OutDesc = 'Invalid destination node';
			ROLLBACK;
			LEAVE proc;
		END IF;
	END IF;
		
		
	
	CALL find_child_service_wise(in_source_node_id,in_source_service_id);
	IF EXISTS (SELECT 1 FROM _tbl_find_child_service_wise where node_id = in_dest_node_id and service_id=in_dest_service_id) THEN
 			SET OutResponseCode=-1;
			SET OutStatus = 'Failure';
			SET OutDesc = 'Cannot cut parent/grand parent node and paste it to a child/grand child node. It will make a loop with no parent and nodes will be lost.';
			ROLLBACK;
			LEAVE proc;
 	END IF;
		
		SELECT node_type, is_application_node INTO v_source_node_type, v_is_src_application_node 
	    	FROM `tbl_service_nodes_temp` 
	    	WHERE service_id = in_source_service_id 
		AND node_id=in_source_node_id LIMIT 1;
		
		SELECT IFNULL(node_type,0), IFNULL(is_application_node,0) INTO v_destination_node_type, v_is_dest_application_node 
	    	FROM `tbl_service_nodes_temp` 
	    	WHERE service_id = in_dest_service_id 
	    	AND parent_id=in_dest_node_id LIMIT 1;
	    	
        IF v_is_src_application_node = 1 THEN
					SET OutResponseCode=-1;
					SET OutStatus = 'Failure';
					SET OutDesc = 'Cannot cut application nodes as they are auto generated.';
					ROLLBACK;
					LEAVE proc;	
		ELSEIF v_is_src_application_node = 2 THEN
					SET OutResponseCode=-1;
					SET OutStatus = 'Failure';
					SET OutDesc = 'Cannot cut logical nodes as they are auto generated.';
					ROLLBACK;
					LEAVE proc;
	        END IF;
	    		
		SELECT service_id,service_code,parent_service_id INTO v_new_service_id,v_new_service_code,v_new_parent_service_id
		FROM tbl_service_master WHERE service_id=in_dest_service_id;
		
		
		
		IF NOT EXISTS (SELECT 1 FROM `tbl_service_nodes_temp` WHERE service_id = in_dest_service_id AND parent_id=in_dest_node_id)
		 THEN
	
	    	IF v_source_node_type = 1 THEN
	    		INSERT INTO `tbl_service_nodes_temp`( parent_id, STATUS,service_id,`parent_service_id`, service_code, request_text, response_text, regex, invalid_response_text, invalid_menu_flag, node_type, is_header, is_footer, is_list_element, preference, menu_flag, dcs, application_id, variable_name, variable_value, switch_service_id, switch_service_code, circle_id, operator_id, if_clause, if_value_clause, is_application_node, sequence_no)  
	    		(SELECT in_dest_node_id,STATUS,v_new_service_id,v_new_parent_service_id,v_new_service_code, '', '', '', NULL, NULL, 1, 1, 0, 0, 0, menu_flag, 0, 0, 0, NULL, 0, 'NA', '', NULL, NULL, NULL, 0, sequence_no FROM `tbl_service_nodes_temp` WHERE service_id = in_source_service_id AND node_id=in_source_node_id);
	    		
	    		INSERT INTO `tbl_service_nodes_temp`( parent_id, STATUS,service_id,`parent_service_id`, service_code, request_text, response_text, regex, invalid_response_text, invalid_menu_flag, node_type, is_header, is_footer, is_list_element, preference, menu_flag, dcs, application_id, variable_name, variable_value, switch_service_id, switch_service_code, circle_id, operator_id, if_clause, if_value_clause, is_application_node,sequence_no)  
	    		(SELECT in_dest_node_id,STATUS,v_new_service_id,v_new_parent_service_id,v_new_service_code, '', '', '', NULL, NULL, 1, 0, 1, 0, 0, menu_flag, 0, 0, 0, NULL, 0, 'NA', '', NULL, NULL, NULL, 0, sequence_no FROM `tbl_service_nodes_temp` WHERE service_id = in_source_service_id AND node_id=in_source_node_id);
	 
	    	END IF;
	    	
	    	update tbl_service_nodes_temp
			set parent_id=in_dest_node_id
			,service_id=v_new_service_id
			,service_code=v_new_service_code
			,parent_service_id=v_new_parent_service_id
			where node_id=in_source_node_id and service_id=in_source_service_id;
			
			update tbl_service_nodes_temp
			set service_id=v_new_service_id
			,service_code=v_new_service_code
			,parent_service_id=v_new_parent_service_id
			where service_id=in_source_service_id AND node_id IN (SELECT node_id from _tbl_find_child_service_wise);
			
			
     ELSE
	    		
		    	IF v_destination_node_type=1 AND v_source_node_type=1 THEN
		    		SELECT preference INTO vPreference FROM `tbl_service_nodes_temp`
		    		WHERE service_id = in_dest_service_id
					AND parent_id=in_dest_node_id AND preference <> 99 ORDER BY preference DESC LIMIT 1;
		    	
		    		SET vPreference=IFNULL(vPreference,0)+1;
				
					update tbl_service_nodes_temp
					set parent_id=in_dest_node_id
					,service_id=v_new_service_id
					,service_code=v_new_service_code
					,parent_service_id=v_new_parent_service_id
					,preference=vPreference
					where node_id=in_source_node_id and service_id=in_source_service_id;
					
					update tbl_service_nodes_temp
					set service_id=v_new_service_id
					,service_code=v_new_service_code
					,parent_service_id=v_new_parent_service_id
					where service_id=in_source_service_id AND node_id IN (SELECT node_id from _tbl_find_child_service_wise);
					
	    		ELSE
	    				    			
					SET OutResponseCode=-1;
					SET OutStatus = 'Failure';
					SET OutDesc = 'Cannot cut node as the destination node is not empty and the node being copied is a different node type.';
					ROLLBACK;
					LEAVE proc;
	    	
	    		END IF;
	    	
	END IF;
		
	
	SET OutResponseCode=0;
	SET OutStatus = 'success';
	SET OutDesc = 'Cut and Paste operation successful!!';
	commit;
		
		
			
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `proc_delete_node` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_delete_node`(
								IN in_login_id INT,
								IN in_service_id INT,
								IN in_node_id int,
								OUT OutStatus VARCHAR(100),
								OUT OutResponseCode INT,
								OUT OutDesc VARCHAR(200)	
								)
proc:BEGIN
declare v_node_id ,v_edit_flag,v_parent_service_id,v_login_id int;
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		GET DIAGNOSTICS CONDITION 1 @sqlstate = RETURNED_SQLSTATE,  @errno = MYSQL_ERRNO, @text = MESSAGE_TEXT;
		SET OutResponseCode = @errno;
		SET OutStatus='F';
		SET OutDesc=@text;
		 CALL `proc_error_log`('proc_delete_node',@errno,@text);
	END;
	SELECT  `parent_service_id` INTO v_parent_service_id FROM `tbl_service_master` WHERE `service_id`=in_service_id LIMIT 1;
  
	IF v_parent_service_id = 0 THEN
	 	SELECT edit_flag,creator_id INTO v_edit_flag,v_login_id FROM tbl_edit_service_history
		WHERE service_id =in_service_id AND edit_flag =1 LIMIT 1;
		
		UPDATE `tbl_edit_service_history`
			SET`last_modified`=NOW()
			WHERE service_id =in_service_id AND `edit_flag`=1;
	 ELSE
	 	SELECT edit_flag,creator_id INTO v_edit_flag,v_login_id FROM tbl_edit_service_history
		WHERE service_id =v_parent_service_id AND edit_flag =1 LIMIT 1;
		
		UPDATE `tbl_edit_service_history`
			SET`last_modified`=NOW()
			WHERE service_id =v_parent_service_id AND `edit_flag`=1;
	 END IF;
	
	
	IF v_edit_flag<>1
	THEN
		SET OutResponseCode = 1;
		SET OutStatus = 'F';
		SET OutDesc = 'Service is not in Edit mode';
		LEAVE proc;
	ELSEIF v_login_id <> in_login_id THEN
		SET OutResponseCode = 1;
		SET OutStatus = 'F';
		SET OutDesc = 'You are not autherised as other user is working on this service';
		LEAVE proc;
	END IF; 
	
	
	
	select `node_id` into v_node_id from `tbl_service_nodes_temp`
	where `parent_id`=in_node_id and service_id = in_service_id limit 1;
	
	
if in_node_id is null
			
			then
				SET OutResponseCode=-1;
				SET OutStatus = 'F';
				SET OutDesc = 'Invalid Node Id';	
		else 		
			call `find_parts`(in_node_id);
			
				
			
			
			DELETE FROM tbl_service_nodes_temp WHERE service_id = in_service_id and node_id IN( SELECT * FROM _result where node <> in_node_id);
		end if;		
	
			
		SET OutResponseCode=0;
		SET OutStatus = 'success';
		SET OutDesc = 'success';
		
			
	
   
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `proc_delete_node_from_tree` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_delete_node_from_tree`(
								IN in_login_id INT,
								IN in_service_id INT,
								IN in_node_id int,
								OUT OutStatus VARCHAR(100),
								OUT OutResponseCode INT,
								OUT OutDesc VARCHAR(200)	
								)
proc:BEGIN
declare v_node_id,v_edit_flag,v_parent_service_id,v_login_id int;
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		GET DIAGNOSTICS CONDITION 1 @sqlstate = RETURNED_SQLSTATE,  @errno = MYSQL_ERRNO, @text = MESSAGE_TEXT;
		SET OutResponseCode = @errno;
		SET OutStatus='F';
		SET OutDesc=@text;
		 CALL `proc_error_log`('proc_delete_node_from_tree',@errno,@text);
	END;
		
		
	SELECT  `parent_service_id` INTO v_parent_service_id FROM `tbl_service_master` WHERE `service_id`=in_service_id LIMIT 1;
  
	IF v_parent_service_id = 0 THEN
	 	SELECT edit_flag,creator_id INTO v_edit_flag,v_login_id FROM tbl_edit_service_history
		WHERE service_id =in_service_id AND edit_flag =1 LIMIT 1;
		
		UPDATE 	tbl_edit_service_history 
		SET `last_modified` = NOW()
		WHERE service_id =in_service_id AND edit_flag =1;
	 ELSE
	 	SELECT edit_flag,creator_id INTO v_edit_flag,v_login_id FROM tbl_edit_service_history
		WHERE service_id =v_parent_service_id AND edit_flag =1 LIMIT 1;
		
		UPDATE 	tbl_edit_service_history 
		SET `last_modified` = NOW()
		WHERE service_id =v_parent_service_id AND edit_flag =1;
	 END IF;
	
	
	IF v_edit_flag<>1
	THEN
		SET OutResponseCode = 1;
		SET OutStatus = 'F';
		SET OutDesc = 'Service is not in Edit mode';
		LEAVE proc;
	ELSEIF v_login_id <> in_login_id THEN
		SET OutResponseCode = 1;
		SET OutStatus = 'F';
		SET OutDesc = 'You are not autherised as other user is working on this service';
		LEAVE proc;
	END IF; 
	
	select `node_id` into v_node_id from `tbl_service_nodes_temp`
	where `parent_id`=in_node_id and service_id = in_service_id limit 1;
	
if in_node_id is null
	
	then
		SET OutResponseCode=-1;
		SET OutStatus = 'F';
		SET OutDesc = 'Invalid Node Id';	
else 		
	call `find_parts`(in_node_id);
	
	
	
	DELETE FROM tbl_service_nodes_temp WHERE service_id = in_service_id and node_id IN( SELECT * FROM _result);
end if;		
	
		
		SET OutResponseCode=0;
		SET OutStatus = 'success';
		SET OutDesc = 'success';
	
		
   
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `proc_edit_service` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_edit_service`( 
						IN in_login_id INT,
						IN in_service_id INT,
						OUT OutStatus VARCHAR(100),
						OUT OutResponseCode INT,
						OUT OutDesc VARCHAR(200)
						)
proc:BEGIN
  
  
  
  DECLARE v_key VARCHAR(1000);
  DECLARE v_edit_flag ,v_parent_service_id , v_old_login_id ,vRes INT;
  DECLARE v_last_modified timestamp;
  declare test varchar(100);
  declare rr int;
  
  DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		GET DIAGNOSTICS CONDITION 1 @sqlstate = RETURNED_SQLSTATE,  @errno = MYSQL_ERRNO, @text = MESSAGE_TEXT;
		SET OutResponseCode = @errno;
		SET OutStatus='F';
		SET OutDesc=@text;
		 CALL `proc_error_log`('proc_edit_service',@errno,@text);
	END;

  SELECT  `parent_service_id` INTO v_parent_service_id FROM `tbl_service_master` WHERE `service_id`=in_service_id;
		
          
 IF v_parent_service_id=0
	THEN	
	
		  SELECT edit_flag ,`last_modified`,`creator_id` INTO v_edit_flag ,v_last_modified , v_old_login_id FROM tbl_edit_service_history
		  WHERE (service_id=in_service_id OR parent_service_id=in_service_id) AND edit_flag =1 order by last_modified desc LIMIT 1;
	     
	     
		
		SET v_edit_flag=IFNULL(v_edit_flag,0);

		
		
		IF v_edit_flag=1 
		THEN
			
				SELECT 1 into vRes FROM DUAL WHERE v_last_modified < NOW() - INTERVAL 60 SECOND;
				if vRes=1
				then
					CALL `proc_cancel_edit_service`(v_old_login_id,in_service_id,@a,@b,@c);
				ELSE
					SET OutResponseCode = -1;
					SET OutStatus = 'F';
					SET OutDesc = 'Service is already Editing';
					LEAVE proc;
				END IF;
		END IF;
				
	
			
	INSERT INTO tbl_edit_service_history(`service_id`,`service_name`,`service_code`,`creator_id`,`parent_service_id`,`status`,`modified_by`,`created_on`,`edit_flag`,`current_version_major`,`current_version_minor`)
	SELECT `service_id`,`service_name`,`service_code`,in_login_id,`parent_service_id`,`status`,in_login_id,CURRENT_TIMESTAMP,1,`version_major`,`version_minor` FROM tbl_service_master WHERE service_id=in_service_id; 
	
	
	DELETE FROM tbl_service_nodes_temp WHERE service_id=in_service_id OR parent_service_id=in_service_id;
	set rr = ROW_COUNT();
	set test = concat('rows deleted from tbl_service_nodes_temp for service_id:',in_service_id," and rowcount is:", rr); 
				
		INSERT ignore INTO `tbl_service_nodes_temp`(
						`node_id`,
						`parent_id`,
						`status`,
					
						`service_id`,		
						`parent_service_id`,
						`service_code`,
						`request_text`,
						`response_text`,
						`regex`,		
						`invalid_response_text`,	
						`invalid_menu_flag`,
						`node_type`,
						`is_header`,
						`is_footer`,		
						`is_list_element`,
						`is_application_node`,
						`preference`,
						`menu_flag`,
						`dcs`,			
						`application_id`,
						`variable_name`,
						`variable_value`,	
						`switch_service_id`,	
						`switch_service_code`,
						`circle_id`,	
						`operator_id`,
						`if_clause`,		
						`if_value_clause`,
						`version_major`,
						`version_minor`,
						`created_on`,	
						`last_modified`,
						`sequence_no`
						)
						SELECT
						`node_id`,
						`parent_id`,
						`status`,
					
						`service_id`,		
						`parent_service_id`,
						`service_code`,
						`request_text`,
						`response_text`,
						`regex`,		
						`invalid_response_text`,	
						`invalid_menu_flag`,
						`node_type`,
						`is_header`,
						`is_footer`,		
						`is_list_element`,
						`is_application_node`,
						`preference`,
						`menu_flag`,
						`dcs`,			
						`application_id`,
						`variable_name`,
						`variable_value`,	
						`switch_service_id`,	
						`switch_service_code`,
						`circle_id`,	
						`operator_id`,
						`if_clause`,		
						`if_value_clause`,
						`version_major`,
						`version_minor`,
						`created_on`,	
						`last_modified`,
						`sequence_no`
					 FROM tbl_service_nodes
					 WHERE (service_id=in_service_id
					OR parent_service_id=in_service_id) ;
						
	set rr = ROW_COUNT();
	set test = concat('fresh rows inserted into tbl_service_nodes_temp for service_id:',in_service_id," and rowcount is:", rr);
	insert into log values(now(), test); 

	SELECT count(1) into @var FROM tbl_service_nodes WHERE (service_id=in_service_id OR parent_service_id=in_service_id) ;
	set test = concat('actual rows to be inserted for:',in_service_id," is:", @var);
	insert into log values(now(), test); 

					
						SET OutResponseCode = 0;
						SET OutStatus = 'Success';
						SET OutDesc = 'Success';	
				
ELSE
		
		  
		 SELECT edit_flag ,`last_modified`,`creator_id` INTO v_edit_flag ,v_last_modified , v_old_login_id FROM tbl_edit_service_history
		  WHERE (service_id=in_service_id OR parent_service_id=v_parent_service_id) AND edit_flag =1 order by last_modified desc LIMIT 1;
	     
	    
		
		SET v_edit_flag=IFNULL(v_edit_flag,0);
		
		
		IF v_edit_flag=1 
		THEN
			
				SELECT 1 into vRes FROM DUAL WHERE v_last_modified < NOW() - INTERVAL 60 SECOND;
				if vRes=1
				then
					CALL `proc_cancel_edit_service`(in_login_id,in_service_id,@a,@b,@c);
				ELSE
					SET OutResponseCode = -1;
					SET OutStatus = 'F';
					SET OutDesc = 'Service is already Editing';
					LEAVE proc;
				END IF;
		END IF;
							
			INSERT INTO tbl_edit_service_history(`service_id`,`service_name`,`service_code`,`creator_id`,`parent_service_id`,`status`,`modified_by`,`created_on`,`edit_flag`,`current_version_major`,`current_version_minor`)	
			SELECT `service_id`,`service_name`,`service_code`,in_login_id,`parent_service_id`,`status`,in_login_id,CURRENT_TIMESTAMP,1,`version_major`,`version_minor` FROM tbl_service_master WHERE service_id=v_parent_service_id; 
			
			DELETE FROM tbl_service_nodes_temp WHERE service_id=v_parent_service_id OR parent_service_id=v_parent_service_id;
		
				
						INSERT ignore INTO `tbl_service_nodes_temp`(
						`node_id`,
						`parent_id`,
						`status`,
						
						`service_id`,	
						`parent_service_id`,
						`service_code`,
						`request_text`,
						`response_text`,
						`regex`,		
						`invalid_response_text`,	
						`invalid_menu_flag`,
						`node_type`,
						`is_header`,
						`is_footer`,		
						`is_list_element`,
						`is_application_node`,
						`preference`,
						`menu_flag`,
						`dcs`,			
						`application_id`,
						`variable_name`,
						`variable_value`,	
						`switch_service_id`,	
						`switch_service_code`,
						`circle_id`,	
						`operator_id`,
						`if_clause`,		
						`if_value_clause`,
						`version_major`,
						`version_minor`,
						`created_on`,	
						`last_modified`,
						`sequence_no`
						)
						SELECT
						`node_id`,
						`parent_id`,
						`status`,
					
						`service_id`,		
						`parent_service_id`,
						`service_code`,
						`request_text`,
						`response_text`,
						`regex`,		
						`invalid_response_text`,	
						`invalid_menu_flag`,
						`node_type`,
						`is_header`,
						`is_footer`,		
						`is_list_element`,
						`is_application_node`,
						`preference`,
						`menu_flag`,
						`dcs`,			
						`application_id`,
						`variable_name`,
						`variable_value`,	
						`switch_service_id`,	
						`switch_service_code`,
						`circle_id`,	
						`operator_id`,
						`if_clause`,		
						`if_value_clause`,
						`version_major`,
						`version_minor`,
						`created_on`,	
						`last_modified`,
						`sequence_no`
						FROM tbl_service_nodes
						WHERE (service_id=v_parent_service_id
						OR parent_service_id=v_parent_service_id);
						
					
						SET OutResponseCode = 0;
						SET OutStatus = 'Success';
						SET OutDesc = 'Success';
										
						
						
END IF;	
				UPDATE `tbl_edit_service_history`
				SET`last_modified`=NOW()
				WHERE service_id = in_service_id AND `edit_flag`=1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `proc_error_log` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_error_log`( in in_proc_name varchar(4000),
							   in in_errno double,
							   in in_text varchar(4000)
							  )
begin
 
 
 insert into `tbl_error_log`(proc_name,error_code,error_desc,error_date)
 
 values (in_proc_name,in_errno,in_text,NOW());
 commit;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `proc_fetch_service_detail` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_fetch_service_detail`( 	
								IN in_login_id INT,
								IN in_service_id INT,
								OUT OutStatus VARCHAR(100),
								OUT OutResponseCode INT,
								OUT OutDesc VARCHAR(200)
								)
proc:BEGIN
  
  DECLARE v_key VARCHAR(1000);
  DECLARE v_edit_flag ,v_parent_service_id INT;
  
  DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		GET DIAGNOSTICS CONDITION 1 @sqlstate = RETURNED_SQLSTATE,  @errno = MYSQL_ERRNO, @text = MESSAGE_TEXT;
		SET OutResponseCode = @errno;
		SET OutStatus='F';
		SET OutDesc=@text;
		 CALL `proc_error_log`('proc_fetch_service_detail',@errno,@text);
	END;
  
 select `service_id`,`service_name`,`service_code`,`creator_id`,`parent_service_id`,`scope`,`dcs`,
	`circle`,`status`,`operator`,`subscriber_type`,`description`,`created_on`,`last_modify_by`,`last_modified`
	from`tbl_service_master` 
	where `service_id`=in_service_id;
	
	
			SET OutResponseCode = 1;
			SET OutStatus = 'Success';
			SET OutDesc = 'Success';
  
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `proc_get_module_detail` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_get_module_detail`(	
								)
BEGIN
declare total_active_user,total_active_service,total_api int;
SELECT COUNT(1) into total_active_service FROM  tbl_users_master WHERE STATUS=1 and user_type <> 0;
SELECT COUNT(1) into total_active_user FROM  `tbl_service_master` WHERE STATUS=1 and parent_service_id = 0;
SELECT COUNT(1) into total_api FROM `tbl_application_master` WHERE STATUS=1;
select total_active_user,total_active_service,total_api;
	 
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `proc_get_service_list` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_get_service_list`( IN in_login_id INT,
								in in_parent_id int)
begin
declare v_parent_service_id int;
if in_parent_id=-1
then	
		
		 SELECT service_id, service_name, service_code, (SELECT username FROM tbl_users_master WHERE user_id=tb2.creator_id)creator_id, parent_service_id, scope, dcs, circle, 
		 STATUS, operator, subscriber_type, description, created_on, last_modified ,
		 `version_major`,
		 `version_minor`,
		 CONCAT(version_major,'.',version_minor) AS `version`
		 FROM tbl_service_master tb2
		 ORDER BY service_id ASC  ;
		
else
		IF in_parent_id <> 0
			THEN
			
				SELECT `parent_service_id` INTO v_parent_service_id FROM
				`tbl_service_master` 
				WHERE `service_id`=in_parent_id;
				IF v_parent_service_id <> 0 THEN
					SET in_parent_id=v_parent_service_id;
				END IF;
			
			END IF;
		 SELECT service_id, service_name, service_code, (SELECT username FROM tbl_users_master WHERE user_id=tb2.creator_id)creator_id, parent_service_id, scope, dcs, circle, 
		 STATUS, operator, subscriber_type, description, created_on, last_modified ,
		 `version_major`,
		 `version_minor`,
		 CONCAT(version_major,'.',version_minor) AS `version`
		 FROM tbl_service_master tb2
		 WHERE tb2.parent_service_id in (in_parent_id,0) and tb2.service_id!=in_parent_id ORDER BY service_id ASC;
end if; 
	
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `proc_get_service_node` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_get_service_node`( in in_service_id int
								  
								  )
begin
		 select node_id,
			parent_id,
			STATUS,
			service_id,
			service_code,
			request_text,
			response_text,
			regex,
			invalid_response_text,
			invalid_menu_flag,
			node_type,
			is_header,
			is_footer,
			is_list_element,
			preference,
			menu_flag,
			dcs,
			application_id,
			variable_name, 
			variable_value,
			switch_service_id,
			switch_service_code,
			circle_id,
			operator_id,
			if_clause,
			if_value_clause,
			created_on,
			last_modified
		from tbl_service_nodes_temp
		where service_id=in_service_id ORDER BY parent_id,preference;
			
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `proc_get_service_nodes` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_get_service_nodes`( 
									in in_service_id int
							       )
begin
		 select tbnode.node_id,
			tbnode.parent_id,
			CASE WHEN tbnode.is_application_node = 1 THEN
			CONCAT(tbnode.request_text,' - ',tbnode.response_text)
			WHEN tbnode.application_id <> 0 THEN 
			CONCAT('To APP - ',(SELECT am.app_name FROM `tbl_application_master` am WHERE am.app_id = tbnode.application_id LIMIT 1))
			WHEN tbnode.node_type=5 THEN
			CONCAT('Switch to - ',tbnode.`switch_service_code`)
			ELSE 
			tbnode.response_text
			END AS response_text
		from tbl_service_nodes tbnode
		where service_id=in_service_id AND is_header = 0 AND is_footer = 0 ORDER BY parent_id,preference;
			
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `proc_get_service_nodes_download` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_get_service_nodes_download`( 
									in in_service_id int
							       )
begin
		 select tbnode.node_id,
			tbnode.parent_id,
			CASE WHEN tbnode.is_application_node = 1 THEN
			CONCAT(tbnode.request_text,' - ',tbnode.response_text)
			WHEN tbnode.is_application_node = 2 THEN
			CONCAT('= ',tbnode.`if_value_clause`)
			WHEN tbnode.application_id <> 0 AND tbnode.menu_flag <> 30 THEN 
			CONCAT('To API - ',(SELECT am.app_name FROM `tbl_application_master` am WHERE am.app_id = tbnode.application_id LIMIT 1))
			WHEN tbnode.menu_flag = 30 THEN
			CONCAT(tbnode.response_text,'|To the App - ',(SELECT am.app_name FROM `tbl_application_master` am WHERE am.app_id = tbnode.application_id LIMIT 1))
			WHEN tbnode.node_type=5 THEN
			CONCAT('Switch to - ',tbnode.`switch_service_code`)
			WHEN tbnode.node_type=6 THEN
			CONCAT('IF ',(SELECT vm.variable_name FROM `tbl_variable_master` vm WHERE vm.`variable_id`=tbnode.`if_clause` LIMIT 1))
			WHEN tbnode.node_type=3 THEN
			CONCAT('Notify - ',tbnode.`response_text`)
                        WHEN tbnode.node_type=7 and tbnode.menu_flag=7 THEN
                        'Back Menu - '
                        WHEN tbnode.node_type=7 and tbnode.menu_flag=8 THEN
                        'Main Menu - '
			ELSE 
			tbnode.response_text
			END AS response_text,
			CASE WHEN tbnode.node_type IN (3,4,5,6,7) THEN
			0 
			ELSE
			1
			END AS editable,
			CASE WHEN tbnode.node_type=5 THEN
			tbnode.`switch_service_id`
			ELSE
			0
			END AS switch_service_id,
			
			CASE WHEN tbnode.`is_application_node` <> 0 THEN
			0
			ELSE
			1
			END AS copy,
			CASE WHEN tbnode.`is_application_node` <> 0 THEN
			0
			ELSE
			1
			END AS `delete`,
			tbnode.status,
			1 as change_status
		from tbl_service_nodes tbnode
		where service_id=in_service_id AND is_header = 0 AND is_footer = 0 ORDER BY parent_id,preference;
			
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `proc_get_service_nodes_new` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_get_service_nodes_new`(
                                    in in_service_id int
                                   )
begin
DECLARE v_parent_service_id INT;
SELECT parent_service_id INTO v_parent_service_id FROM tbl_service_master WHERE service_id=in_service_id;
IF v_parent_service_id = 0 THEN
    SET v_parent_service_id=in_service_id;
END IF;
         select tbnode.node_id,
            tbnode.parent_id,
            CASE WHEN tbnode.is_application_node = 1 THEN
            CONCAT(tbnode.request_text,' - ',IFNULL(tbnode.response_text,''))
            WHEN tbnode.is_application_node = 2 THEN
            CONCAT('= ',tbnode.`if_value_clause`)
            WHEN tbnode.application_id <> 0 AND tbnode.menu_flag <> 30 THEN
            CONCAT('To API - ',(SELECT am.app_name FROM `tbl_application_master` am WHERE am.app_id = tbnode.application_id LIMIT 1))
            WHEN tbnode.menu_flag = 30 THEN
            CONCAT(tbnode.response_text,'|To the App - ',(SELECT am.app_name FROM `tbl_application_master` am WHERE am.app_id = tbnode.application_id LIMIT 1))
            WHEN tbnode.node_type=5 THEN
            CONCAT('Switch to - ',tbnode.`switch_service_code`)
            WHEN tbnode.node_type=6 THEN
            CONCAT('IF ',(SELECT vm.variable_name FROM `tbl_variable_master` vm WHERE vm.`variable_id`=tbnode.`if_clause` LIMIT 1))
            WHEN tbnode.node_type=3 THEN
            CONCAT('Notify - ',tbnode.`response_text`)
            WHEN tbnode.node_type=7 and tbnode.menu_flag=7 THEN
            'Back Menu - '
            WHEN tbnode.node_type=7 and tbnode.menu_flag=8 THEN
            'Main Menu - '
            ELSE
            tbnode.response_text
            END AS response_text,
            CASE WHEN tbnode.node_type IN (3,4,5,6,7) THEN
            0
            ELSE
            1
            END AS editable,
            CASE WHEN tbnode.node_type=5 AND EXISTS (SELECT 1 from tbl_service_master WHERE service_id = switch_service_id AND parent_service_id=v_parent_service_id) THEN
            tbnode.`switch_service_id`
            ELSE
            0
            END AS switch_service_id,
           
            CASE WHEN tbnode.`is_application_node` <> 0 THEN
            0
            ELSE
            1
            END AS copy,
            CASE WHEN tbnode.`is_application_node` <> 0 THEN
            0
            ELSE
            1
            END AS `delete`,
            tbnode.status,
            1 as change_status
        from tbl_service_nodes_temp tbnode
        where service_id=in_service_id AND is_header = 0 AND is_footer = 0 ORDER BY parent_id,preference;
           
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `proc_get_service_node_menu_mapping` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_get_service_node_menu_mapping`(
	IN `in_service_id` INT,
	IN `in_parent_id` INT,
	IN `in_set_parent_id` VARCHAR(100),
	IN `in_level` int,
	IN `in_node_id_raw` varchar(500),
	IN `in_app_node_prefix` VARCHAR(50)
)
begin
	DECLARE v_service_id,v_parent_service_id,v_parent_id,v_node_id,v_node_type,v_switch_service_id,v_is_app_node,v_menu_flag,v_preference INT;
	DECLARE v_request_text,v_menu,v_service_code,v_parent_menu_id, v_menu_id, vNodeIdRaw VARCHAR(500);
	DECLARE vParentHash,vNodeHash BIGINT;
	DECLARE done INT DEFAULT FALSE;
	DECLARE c1 CURSOR FOR 
		SELECT parent_id,node_id,request_text,response_text,node_type,switch_service_id,parent_service_id,service_id,service_code,is_application_node,menu_flag,preference from tbl_service_nodes where
		status =1 AND is_header =0 AND is_footer = 0 AND service_id=in_service_id and parent_id =  in_parent_id;
		
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
	
	SET @@SESSION.max_sp_recursion_depth=100;
	
	IF in_level = 0 THEN
	
		DROP TEMPORARY TABLE IF EXISTS _tbl_menu_nodes_mapping;
		create temporary table _tbl_menu_nodes_mapping(level INT,parent_menu_id VARCHAR(100),menu_id VARCHAR(100),menu VARCHAR(1000),`preference` INT,`parent_service_id` INT,`service_id` INT,`service_code` VARCHAR(50),`parent_node_id_raw` varchar(1000),`node_id_raw` varchar(1000),`parent_node_hash` BIGINT,`node_hash` BIGINT,`node_md5` varchar(100));
	
	END IF;
	
	 
	
	SET in_level=in_level+1;	
	OPEN c1;	
			read_loop: LOOP
				SET done = FALSE;
				FETCH c1 INTO v_parent_id,v_node_id,v_request_text,v_menu,v_node_type,v_switch_service_id,v_parent_service_id,v_service_id, v_service_code,v_is_app_node,v_menu_flag,v_preference;
				
				
				
				IF done THEN
					LEAVE read_loop;
				END IF;
				
				SET vNodeIdRaw=in_node_id_raw;
				
				SET v_menu=REPLACE(v_menu,'\r\n','^');
    			SET v_menu=REPLACE(v_menu,'\r','^');
				SET v_menu=REPLACE(v_menu,'\n','^');
				
				
				IF in_app_node_prefix IS NOT NULL 
				THEN
					IF v_menu_flag IN (40,41,30)
					THEN
						SET v_menu=CONCAT(in_app_node_prefix," - ",v_menu);
					END IF;
				END IF;
				
				
				IF v_parent_id= 0 THEN
					SET v_parent_menu_id = CONCAT('MENU0_',in_service_id);
					SET v_parent_menu_id = '0';
				ELSE
					SET v_parent_menu_id = CONCAT('',v_parent_id);
				END IF;
				
				SET v_menu_id=CONCAT('',v_node_id);
				
				IF in_set_parent_id IS NOT NULL THEN
					SET v_parent_menu_id=in_set_parent_id;
				END IF;
				
				
				IF v_node_type in (1,2) THEN
					
					IF v_is_app_node  = 0 THEN
						SET vNodeIdRaw=CONCAT(in_node_id_raw,'|',v_node_id);
						
						IF in_node_id_raw = '0' THEN
							SET vParentHash=0;
						ELSE
							SET vParentHash=crc32(in_node_id_raw);
						END IF;
						SET vNodeHash=crc32(vNodeIdRaw);
						
						INSERT INTO _tbl_menu_nodes_mapping VALUES(in_level,v_parent_menu_id,v_menu_id,v_menu,IFNULL(v_preference,0),v_parent_service_id,v_service_id,v_service_code,in_node_id_raw,vNodeIdRaw,vParentHash,vNodeHash,md5(vNodeIdRaw));
						CALL proc_get_service_node_menu_mapping(in_service_id,v_node_id,NULL,in_level,vNodeIdRaw,NULL);
					ELSE
						CALL proc_get_service_node_menu_mapping(in_service_id,v_node_id,v_parent_menu_id,in_level,vNodeIdRaw,v_request_text);
					END IF;
				ELSEIF v_node_type in (4,6) THEN
					CALL proc_get_service_node_menu_mapping(in_service_id,v_node_id,v_parent_menu_id,in_level,vNodeIdRaw,NULL);
				ELSEIF v_node_type = 3 or v_node_type = 7 THEN
					SET vNodeIdRaw=CONCAT(in_node_id_raw,'|',v_node_id);
					
					IF in_node_id_raw = '0' THEN
							SET vParentHash=0;
					ELSE
							SET vParentHash=crc32(in_node_id_raw);
					END IF;
					SET vNodeHash=crc32(vNodeIdRaw);
						
					INSERT INTO _tbl_menu_nodes_mapping VALUES(in_level,v_parent_menu_id,v_menu_id,v_menu,IFNULL(v_preference,0),v_parent_service_id,v_service_id,v_service_code,in_node_id_raw,vNodeIdRaw,vParentHash,vNodeHash,md5(vNodeIdRaw));
				ELSEIF v_node_type = 5 THEN
					CALL proc_get_service_node_menu_mapping(v_switch_service_id,0,v_parent_menu_id,in_level,vNodeIdRaw,NULL);
				END IF;		
	
	
			END LOOP;
	CLOSE c1;
	
	
	
	IF in_level =1 THEN
		SELECT * FROM _tbl_menu_nodes_mapping;
	END IF;
		
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `proc_get_single_service_node` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_get_single_service_node`( in in_parent_id int,
								       in in_service_id int 
								  )
begin
		 select node_id,
			parent_id,
			STATUS,
			service_id,
			service_code,
			request_text,
			response_text,
			regex,
			invalid_response_text,
			invalid_menu_flag,
			node_type,
			is_header,
			is_footer,
			is_list_element,
			preference,
			menu_flag,
			dcs,
			application_id,
			variable_name, 
			variable_value,
			switch_service_id,
			switch_service_code,
			circle_id,
			operator_id,
			if_clause,
			if_value_clause,
			created_on,
			last_modified,
			sequence_no
		from tbl_service_nodes_temp
		where parent_id=in_parent_id 
		and service_id=in_service_id
		ORDER BY preference;
			
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `proc_get_sr_list` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_get_sr_list`(
				
								in in_login_id int,
								in in_srid int
								)
BEGIN
if in_srid=0 then
	SELECT `id`,`name`,`desc`,`title`,`assignee`,`target_date`,`status`,
	( SELECT tbtwo.username FROM tbl_users_master tbtwo WHERE tbtwo.user_id = tbone.`created_by`) AS created_by,
	tbone.`assignee` as assignee_id,
	( SELECT tbtwo.username FROM tbl_users_master tbtwo WHERE tbtwo.user_id = tbone.`assignee`) AS asignee_name,
	(SELECT tbtwo.user_type FROM tbl_users_master tbtwo WHERE tbtwo.user_id = tbone.`assignee`) AS assignee_usertype,
	UNIX_TIMESTAMP(`created_date`)*1000 AS `created_date` ,`modified_by`,UNIX_TIMESTAMP(`modified_date`)*1000 AS `modified_date`
	FROM tbl_service_request tbone order by tbone.created_date desc ;
else
	select `id`,`name`,`desc`,`title`,`assignee`,`target_date`,`status`,
	( SELECT tbtwo.username FROM tbl_users_master tbtwo WHERE tbtwo.user_id = tbone.`created_by`) AS created_by,
	tbone.`assignee` AS assignee_id,
	( SELECT tbtwo.username FROM tbl_users_master tbtwo WHERE tbtwo.user_id = tbone.`assignee`) AS asignee_name,
	(SELECT tbtwo.user_type FROM tbl_users_master tbtwo WHERE tbtwo.user_id = tbone.`assignee`) AS assignee_usertype,
	UNIX_TIMESTAMP(`created_date`)*1000 as `created_date` ,`modified_by`,UNIX_TIMESTAMP(`modified_date`)*1000 as `modified_date`
	from tbl_service_request tbone
	where id=in_srid 
	ORDER BY tbone.created_date DESC;
end if;	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `proc_get_user_detail` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_get_user_detail`(
								
								)
BEGIN
select `created_by`,`username`,`msisdn`,`user_ip`,`status`,email,`user_mngt_permission`,`service_mngt_permission`,user_master_id,`created_date`,`modified_date`
	from `tbl_users_master` order by created_date desc ;	
   
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `proc_get_view_user` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_get_view_user`(	in in_login_id int,
								in in_usertype int
								)
BEGIN
	if in_usertype=0
	then
	
		select `user_id`,`user_type`,`username`,`msisdn`,`email`,`status`,`um_permission`,`sc_permission`,
		( select tbtwo.username FROM tbl_users_master tbtwo WHERE tbtwo.user_id = tbone.`created_by`) as created_by,
		UNIX_TIMESTAMP(`created_date`)*1000 as created_date ,UNIX_TIMESTAMP(`last_modified`)*1000 as modified_date
		from `tbl_users_master` tbone where user_type <>0 order by tbone.created_date desc ;
	else	
		select `user_id`,`user_type`,`username`,`msisdn`,`email`,`status`,`um_permission`,`sc_permission`,
		( select tbtwo.username FROM tbl_users_master tbtwo WHERE tbtwo.user_id = tbone.`created_by`) as created_by,
		UNIX_TIMESTAMP(`created_date`)*1000 AS created_date ,UNIX_TIMESTAMP(`last_modified`)*1000 AS modified_date
		from `tbl_users_master` tbone WHERE `user_type`=in_usertype ORDER BY tbone.created_date DESC;
	end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `proc_insert_urlhandler` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`ussddev`@`%` PROCEDURE `proc_insert_urlhandler`(in url varchar(1000),In original_data text,IN timeout varchar(50),out rowcount integer)
BEGIN
	declare v_deployment_date varchar(200);
	insert into tbl_url_mapping(url,original_data,timeout)values(url,original_data,timeout);
	select row_count() into rowcount;
	set v_deployment_date=now();
	call proc_trigger_add(1,0,0,'URLS',v_deployment_date);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `proc_menu_file_create` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_menu_file_create`( in in_service_id INT )
begin
	DECLARE vServiceCode VARCHAR(100);
	SELECT service_code INTO  vServiceCode	FROM tbl_service_master
	WHERE service_id=in_service_id AND `status` = 1;
	IF vServiceCode IS NOT NULL 
	THEN
		 
		SET vServiceCode=CONCAT('*',vServiceCode,'#');
		CALL create_menu_file_new(0,0,'MENU',in_service_id,vServiceCode,NULL);
		
	END IF;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `proc_menu_file_create_node_wise` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_menu_file_create_node_wise`( in in_service_id INT )
begin
	DECLARE vServiceCode VARCHAR(100);
	SELECT service_code INTO  vServiceCode	FROM tbl_service_master
	WHERE service_id=in_service_id AND `status` = 1;
	IF vServiceCode IS NOT NULL 
	THEN
		 
		SET vServiceCode=CONCAT('*',vServiceCode,'#');
		CALL create_menu_file_node_wise(0,0,'MENU',in_service_id,vServiceCode,NULL,0,'185');
		
	END IF;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `proc_menu_file_create_single` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_menu_file_create_single`( in in_service_id INT )
begin
	DECLARE vServiceCode VARCHAR(100);
	SELECT service_code INTO  vServiceCode	FROM tbl_service_master
	WHERE service_id=in_service_id AND `status` = 1;

	IF vServiceCode IS NOT NULL 
	THEN
		 
		SET vServiceCode=CONCAT('*',vServiceCode,'#');
		CALL create_menu_file_single(0,0,'MENU',in_service_id,vServiceCode,NULL,0,'185');
		
	END IF;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `proc_menu_file_get_list` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_menu_file_get_list`( IN in_parent_service_id INT)
begin
		 SELECT service_id,service_code FROM tbl_service_master WHERE status = 1 and (service_id = in_parent_service_id OR parent_service_id = in_parent_service_id);
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `proc_modify_urlhandler` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`ussddev`@`%` PROCEDURE `proc_modify_urlhandler`(IN urlId bigint,IN url VARCHAR(1000),IN original_data TEXT,IN timeout varchar(50),OUT rowcount INTEGER)
BEGIN
	declare v_deployment_date varchar(200);
	update  tbl_url_mapping set url = url,original_data = original_data,timeout = timeout where url_id = urlId;
	SELECT ROW_COUNT() INTO rowcount;
 
	set v_deployment_date=now();
	call proc_trigger_add(1,0,0,'URLS',v_deployment_date);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Proc_reset_password` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Proc_reset_password`(
						  IN Inlogin_id INT,
						  IN in_user_id INT,	
						  IN InPassword VARCHAR(200),		
						  OUT OutStatus VARCHAR(100),
						  OUT OutResponseCode INT,
						  OUT OutDesc VARCHAR(200)
							)
BEGIN
	IF NOT EXISTS(SELECT 1 FROM `tbl_users_master` WHERE `user_id`=in_user_id AND `user_type`<> 0)
	THEN 
		SET OutResponseCode=0;
		SET OutStatus = 'F';
		SET OutDesc = 'Invalid User  !!';
	ELSE
	
	
		UPDATE `tbl_users_master`
		SET `password`=InPassword,
		    `modified_by`=Inlogin_id
		WHERE `user_id`=in_user_id;
		
		
		SET OutResponseCode=0;
		SET OutStatus = 'success';
		SET OutDesc = 'Password Reset Successfully !!';
	
	END IF;	
		
	
	
   
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `proc_revoke_revision_service` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_revoke_revision_service`(
				
								IN in_login_id INT,
								IN in_service_id INT,
								IN in_version_major INT,
								IN in_version_minor INT,
								IN in_remarks VARCHAR(100),
								OUT OutStatus VARCHAR(100),
								OUT OutResponseCode INT,
								OUT OutDesc VARCHAR(2000)
								)
proc:BEGIN
DECLARE v_count,v1,v2,v_new_version_major,v_new_version_minor INT;	
DECLARE version_major_new,version_minor_new INT;
DECLARE v_service_names,v_service_codes VARCHAR(200);
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		GET DIAGNOSTICS CONDITION 1 @sqlstate = RETURNED_SQLSTATE,  @errno = MYSQL_ERRNO, @text = MESSAGE_TEXT;
		SET OutResponseCode = @errno;
		SET OutStatus='F';
		SET OutDesc=@text;
		ROLLBACK;
		 CALL `proc_error_log`('proc_revoke_revision_service',@errno,@text);
	END;
		START TRANSACTION;
         
         CALL proc_error_log('proc_revoke_revision_service',909090,CONCAT('login_id',in_login_id,'|','service_id',in_service_id,'|','Major',in_version_major,'|','Minor',in_version_minor));
	
	
	SELECT COUNT(1) INTO v_count FROM `tbl_revision_history` WHERE`service_id` =in_service_id;
IF v_count=0
THEN
	SET OutResponseCode = -1;
	SET OutStatus = 'F';
	SET OutDesc = 'Invalid Revision';
	ROLLBACK;
	LEAVE proc;
ELSE
	IF NOT EXISTS(SELECT 1 FROM `tbl_service_master` WHERE`service_id`=in_service_id)
	THEN
		SET OutResponseCode = -1;
		SET OutStatus = 'F';
		SET OutDesc = 'Service already Deleted OR Invalid Service. Please contact backend team!';
		ROLLBACK;
	LEAVE proc;
	END IF;		
	
	
	
	SELECT `version_major`,`version_minor`
	INTO  v_new_version_major,v_new_version_minor
	FROM `tbl_service_master`
	WHERE `service_id` =in_service_id LIMIT 1; 
	
	IF v_new_version_major = in_version_major AND v_new_version_minor = in_version_minor 
	THEN
		SET OutResponseCode = -1;
		SET OutStatus = 'F';
		SET OutDesc = 'This revision is already live. Cannot revoke the same version';
		ROLLBACK;
		LEAVE proc;
		
	END IF;
	
	
	SET version_major_new=v_new_version_major+1;
	SET version_minor_new=0;
	
	SELECT 1 FROM DUAL;
    
	
	INSERT INTO `tbl_service_nodes_temp`(
					`node_id`,
					`parent_id`,
					`status`,
					`service_id`,		
					`parent_service_id`,
					`service_code`,
					`request_text`,
					`response_text`,
					`regex`,		
					`invalid_response_text`,	
					`invalid_menu_flag`,
					`node_type`,
					`is_header`,
					`is_footer`,		
					`is_list_element`,
					`is_application_node`,
					`preference`,
					`menu_flag`,
					`dcs`,			
					`application_id`,
					`variable_name`,
					`variable_value`,	
					`switch_service_id`,	
					`switch_service_code`,
					`circle_id`,	
					`operator_id`,
					`if_clause`,		
					`if_value_clause`,
					`version_major`,
					`version_minor`,
					`created_on`,	
					`last_modified`,
					`sequence_no`
					)
					SELECT
					`node_id`,
					`parent_id`,
					`status`,
					`service_id`,		
					`parent_service_id`,
					`service_code`,
					`request_text`,
					`response_text`,
					`regex`,		
					`invalid_response_text`,	
					`invalid_menu_flag`,
					`node_type`,
					`is_header`,
					`is_footer`,		
					`is_list_element`,
					`is_application_node`,
					`preference`,
					`menu_flag`,
					`dcs`,			
					`application_id`,
					`variable_name`,
					`variable_value`,	
					`switch_service_id`,	
					`switch_service_code`,
					`circle_id`,	
					`operator_id`,
					`if_clause`,		
					`if_value_clause`,
					 version_major_new,
					 version_minor_new,
					`created_on`,	
					`last_modified`,
					`sequence_no`		
				FROM `tbl_service_nodes_revision`
				WHERE (service_id=in_service_id
				OR parent_service_id = in_service_id)
				AND version_major=in_version_major
				AND version_minor=in_version_minor;
                
		
	SELECT `service_name`,`service_code` 
	INTO v_service_names,v_service_codes 
	FROM `tbl_service_master` 
	WHERE `service_id`=in_service_id;
	
		
	INSERT INTO `tbl_revision_history`(`service_id`,`service_name`,`service_code`,`modified_by`,`old_version_major`,`old_version_minor`,
			`new_version_major`,`new_version_minor`,`remarks`,`created_on`) 
	VALUES (in_service_id,v_service_names,v_service_codes,in_login_id,v_new_version_major,v_new_version_minor,version_major_new,version_minor_new,
	CONCAT(in_remarks,' ( Revoked from version - ',in_version_major,'.',in_version_minor,')'),NOW());
	
	
	
	
	UPDATE `tbl_service_master`
	SET `version_major`=version_major_new,
	     `version_minor`= version_minor_new
	 WHERE (service_id=in_service_id OR`parent_service_id`=in_service_id);     
	
	
	INSERT INTO `tbl_service_nodes_revision`(
						`node_id`,
						`parent_id`,
						`status`,
						`service_id`,		
						`parent_service_id`,
						`service_code`,
						`request_text`,
						`response_text`,
						`regex`,		
						`invalid_response_text`,	
						`invalid_menu_flag`,
						`node_type`,
						`is_header`,
						`is_footer`,		
						`is_list_element`,
						`is_application_node`,
						`preference`,
						`menu_flag`,
						`dcs`,			
						`application_id`,
						`variable_name`,
						`variable_value`,	
						`switch_service_id`,	
						`switch_service_code`,
						`circle_id`,	
						`operator_id`,
						`if_clause`,		
						`if_value_clause`,
						`version_major`,
						`version_minor`,
						`created_on`,	
						`last_modified`,
						`sequence_no`
						)
						SELECT	
						`node_id`,
						`parent_id`,
						`status`,
						`service_id`,		
						`parent_service_id`,
						`service_code`,
						`request_text`,
						`response_text`,
						`regex`,		
						`invalid_response_text`,	
						`invalid_menu_flag`,
						`node_type`,
						`is_header`,
						`is_footer`,		
						`is_list_element`,
						`is_application_node`,
						`preference`,
						`menu_flag`,
						`dcs`,			
						`application_id`,
						`variable_name`,
						`variable_value`,	
						`switch_service_id`,	
						`switch_service_code`,
						`circle_id`,	
						`operator_id`,
						`if_clause`,		
						`if_value_clause`,
						`version_major`,
						`version_minor`,
						`created_on`,	
						`last_modified`,
						`sequence_no`	
					FROM `tbl_service_nodes`
					WHERE service_id=in_service_id
					OR parent_service_id = in_service_id;
 	
					DELETE FROM `tbl_service_nodes`
					WHERE service_id=in_service_id
					OR parent_service_id = in_service_id;
		
		SELECT 2 FROM DUAL;
		
			INSERT INTO `tbl_service_nodes`(
					`node_id`,
					`parent_id`,
					`status`,
					`service_id`,		
					`parent_service_id`,
					`service_code`,
					`request_text`,
					`response_text`,
					`regex`,		
					`invalid_response_text`,	
					`invalid_menu_flag`,
					`node_type`,
					`is_header`,
					`is_footer`,		
					`is_list_element`,
					`is_application_node`,
					`preference`,
					`menu_flag`,
					`dcs`,			
					`application_id`,
					`variable_name`,
					`variable_value`,	
					`switch_service_id`,	
					`switch_service_code`,
					`circle_id`,	
					`operator_id`,
					`if_clause`,		
					`if_value_clause`,
					`version_major`,
					`version_minor`,
					`created_on`,	
					`last_modified`,
					`sequence_no`
					)
					SELECT
					`node_id`,
					`parent_id`,
					`status`,
					`service_id`,		
					`parent_service_id`,
					`service_code`,
					`request_text`,
					`response_text`,
					`regex`,		
					`invalid_response_text`,	
					`invalid_menu_flag`,
					`node_type`,
					`is_header`,
					`is_footer`,		
					`is_list_element`,
					`is_application_node`,
					`preference`,
					`menu_flag`,
					`dcs`,			
					`application_id`,
					`variable_name`,
					`variable_value`,	
					`switch_service_id`,	
					`switch_service_code`,
					`circle_id`,	
					`operator_id`,
					`if_clause`,		
					`if_value_clause`,
					`version_major`,
					`version_minor`,
					`created_on`,	
					`last_modified`,
					`sequence_no`
				FROM `tbl_service_nodes_temp`
				WHERE service_id=in_service_id
				OR parent_service_id = in_service_id;
				
				DELETE FROM `tbl_service_nodes_temp`
				WHERE service_id=in_service_id
				OR parent_service_id = in_service_id;
				
				COMMIT;
				SET OutResponseCode = 0;
				SET OutStatus = 'Success';
				SET OutDesc = 'Success';
			
END IF;
	
	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `proc_service_deploy_live` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_service_deploy_live`(
							IN in_login_id INT,
							in in_service_id int,
							in in_deployment_date varchar(100),
							OUT OutStatus VARCHAR(100),
							OUT OutResponseCode INT,
							OUT OutDesc VARCHAR(2000)
							)
proc:BEGIN
		
declare v_service_name,v_service_code varchar(100);
declare v_version_major,v_version_minor int;
declare v_deployment_id int;
declare v_msg varchar(200);
declare v_assignee int;
		
		DECLARE EXIT HANDLER FOR SQLEXCEPTION
		BEGIN
		GET DIAGNOSTICS CONDITION 1 @sqlstate = RETURNED_SQLSTATE,  @errno = MYSQL_ERRNO, @text = MESSAGE_TEXT;
		SET OutResponseCode = @errno;
		SET OutStatus='F';
		SET OutDesc=@text;
		 CALL `proc_error_log`('proc_service_deploy_live',@errno,@text);
		END;
			
			start transaction;
		
		
		IF in_deployment_date IS NULL 
		THEN
		SET in_deployment_date=NOW();
		END IF;
		
		
		
		IF  EXISTS (SELECT 1 FROM `tbl_service_deploy_logs` WHERE service_id=in_service_id AND STATUS=1 AND deployment_type = 'LIVE') 
	THEN
		SET OutResponseCode = -1;
		SET OutStatus = 'Failure';
		SET OutDesc = 'Service Deployment already in Pending Mode!!';
		ROLLBACK;
		LEAVE proc;
	END IF;	
	
		
		select service_name,service_code,`version_major`,`version_minor`
		into v_service_name,v_service_code,v_version_major,v_version_minor
		from tbl_service_master where service_id=in_service_id;
		
		
		select assignee into v_assignee 
		from tbl_service_request 
		where service_id=in_service_id limit 1;
		
	
		
		INSERT INTO tbl_service_deploy_logs
			(
			service_id,
			service_name,
			service_code,
			version_major,
			version_minor,
			deployment_type,
			deployment_time,
			login_id,
			log_date,
			status
			
			)
			VALUES 
			(
			in_service_id,
			v_service_name,
			v_service_code,
			v_version_major,
			v_version_minor, 
			'LIVE',
			in_deployment_date,
			in_login_id,
			NOW(),
			1 
			);
		
		
		SELECT LAST_INSERT_ID() INTO v_deployment_id ;
		
		
		CALL `proc_trigger_add`(in_login_id,in_service_id,v_deployment_id,'LIVE',in_deployment_date);
		 
		
			
		
		
		
		
		
		commit;
		
		SET OutResponseCode=0;
		SET OutStatus = 'success';
		SET OutDesc = 'Deployment Request taken Successfully !! Please wait for a few minutes for the system to load the new configuration.';
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `proc_service_deploy_uat` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_service_deploy_uat`(
							IN in_login_id INT,
							IN in_service_id INT,
							IN in_deployment_date VARCHAR(200),
							OUT OutStatus VARCHAR(100),
							OUT OutResponseCode INT,
							OUT OutDesc VARCHAR(2000)
							)
proc:BEGIN
	DECLARE v_service_name,v_service_code VARCHAR(200);
	DECLARE v_version_major,v_version_minor INT;
	DECLARE v_deployment_id INT;
	declare v_msg varchar(200);
	declare v_assignee int;
		
		DECLARE EXIT HANDLER FOR SQLEXCEPTION
		BEGIN
		GET DIAGNOSTICS CONDITION 1 @sqlstate = RETURNED_SQLSTATE,  @errno = MYSQL_ERRNO, @text = MESSAGE_TEXT;
		SET OutResponseCode = @errno;
		SET OutStatus='F';
		SET OutDesc=@text;
		 CALL `proc_error_log`('proc_service_deploy_uat',@errno,@text);
		END;
		
		START TRANSACTION;
		
		SELECT service_name,service_code,version_major,version_minor
		INTO v_service_name,v_service_code,v_version_major,v_version_minor
		FROM tbl_service_master 
		WHERE service_id=in_service_id;
		
		
		SELECT assignee INTO v_assignee 
		FROM tbl_service_request 
		WHERE service_id=in_service_id LIMIT 1;
		
		
		
		IF in_deployment_date IS NULL 
		THEN
		SET in_deployment_date=NOW();
		END IF;
		
		IF  EXISTS (SELECT 1 FROM `tbl_service_deploy_logs` WHERE service_id=in_service_id AND STATUS=1 AND deployment_type = 'UAT') 
	THEN
		SET OutResponseCode = -1;
		SET OutStatus = 'Failure';
		SET OutDesc = 'Service Deployment already in Pending Mode!!';
		ROLLBACK;
		LEAVE proc;
	END IF;
	
		
		
		INSERT INTO tbl_service_deploy_logs
			(
			service_id,
			service_name,
			service_code,
			version_major,
			version_minor,
			deployment_type,
			deployment_time,
			login_id,
			log_date,
			STATUS
			)
			VALUES 
			(
			in_service_id,
			v_service_name,
			v_service_code,
			v_version_major,
			v_version_minor,
			'UAT',
			in_deployment_date,
			in_login_id,
			NOW(),
			1 
			);
		
		SELECT LAST_INSERT_ID() INTO v_deployment_id ;
		
		CALL `proc_trigger_add`(in_login_id,in_service_id,v_deployment_id,'UAT',in_deployment_date);
		
		 
		
		
		
		
		
			
			COMMIT;
			SET OutResponseCode=0;
			SET OutStatus = 'success';
			SET OutDesc = 'Deployment Request taken Successfully !! Please wait for a few minutes for the system to load the new configuration.';
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `proc_service_deploy_view_logs` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_service_deploy_view_logs`(
							IN in_login_id INT,
							IN in_deployment_type VARCHAR(100),
							IN from_date DATE,
							IN to_date DATE
							)
proc:BEGIN
	
	
SET from_date= IFNULL(from_date,0);		
	
	
IF in_deployment_type='ALL' 
THEN
	IF from_date=0 THEN
	
		SELECT `id`,
		 `service_code` AS service_id,
		 `service_name`  AS service_name,
		 CONCAT(`version_major`,'.',`version_minor`) AS `version`,
		`deployment_type`,
		 deployment_time,
		(SELECT username FROM tbl_users_master WHERE user_id=tb2.login_id) AS Username,
		`log_date`,
		status
		FROM `tbl_service_deploy_logs` tb2 
		ORDER BY log_date DESC;
	ELSE
	
	SELECT `id`,
		 `service_code` AS service_id,
		 `service_name`  AS service_name,
		  CONCAT(`version_major`,'.',`version_minor`) AS `version`,
		`deployment_type`,
		 deployment_time,
		(SELECT username FROM tbl_users_master WHERE user_id=tb2.login_id) AS Username,
		`log_date`,
		STATUS
		FROM `tbl_service_deploy_logs` tb2 
		WHERE DATE(log_date) BETWEEN from_date AND to_date
		ORDER BY log_date DESC;
	END IF;	
	
ELSE		
		SELECT `id`,
		 `service_code` AS service_id,
		 `service_name`  AS service_name,
		   CONCAT(`version_major`,'.',`version_minor`) AS `version`,
		`deployment_type`,
		 deployment_time,
		(SELECT username FROM tbl_users_master WHERE user_id=tb2.login_id) AS Username,
		`log_date`,
		STATUS
		FROM `tbl_service_deploy_logs` tb2 
		WHERE DATE(log_date) BETWEEN from_date AND to_date AND `deployment_type`= in_deployment_type
		ORDER BY log_date DESC;	
END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `proc_service_keep_alive` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`ussddev`@`%` PROCEDURE `proc_service_keep_alive`(IN in_login_id INT,
						IN in_service_id INT,
						OUT OutStatus VARCHAR(100),
						OUT OutResponseCode INT,
						OUT OutDesc VARCHAR(200))
BEGIN
	 
  DECLARE v_last_modified timestamp;
  DECLARE vRes int;
  DECLARE EXIT HANDLER FOR SQLEXCEPTION
	
	BEGIN
		GET DIAGNOSTICS CONDITION 1 @sqlstate = RETURNED_SQLSTATE,  @errno = MYSQL_ERRNO, @text = MESSAGE_TEXT;
		SET OutResponseCode = @errno;
		SET OutStatus='F';
		SET OutDesc=@text;
		 CALL `proc_error_log`('proc_edit_service',@errno,@text);
	END;
	select last_modified into v_last_modified from tbl_edit_service_history where service_id = in_service_id and creator_id = in_login_id and edit_flag = 1;

	if v_last_modified is null or v_last_modified = '' then
		SET OutResponseCode = -1;
		SET OutStatus = 'F';
		SET OutDesc = 'Failed';
	else
		SELECT 1 into vRes FROM DUAL WHERE v_last_modified < NOW() - INTERVAL 60 SECOND;
		if vRes = 1 then
			SET OutResponseCode = -1;
			SET OutStatus = 'F';
			SET OutDesc = 'Failed';
		
		else
			UPDATE `tbl_edit_service_history`
			SET`last_modified`=NOW()
			WHERE service_id = in_service_id 
			AND creator_id = in_login_id
			AND `edit_flag`=1;
			SET OutResponseCode = 0;
			SET OutStatus = 'Success';
			SET OutDesc = 'Success';
		end if;
	end if;
  
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `proc_set_bucket_preference` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`ussddev`@`%` PROCEDURE `proc_set_bucket_preference`(IN in_bucket_id int(11),
						IN in_preference int(11),
						OUT OutStatus VARCHAR(100),
						OUT OutResponseCode INT(11),
						OUT OutDesc VARCHAR(2000))
BEGIN
 DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		GET DIAGNOSTICS CONDITION 1 @sqlstate = RETURNED_SQLSTATE,  @errno = MYSQL_ERRNO, @text = MESSAGE_TEXT;
		SET OutResponseCode = 0;
		SET OutStatus='Failure';
		SET OutDesc='db error';
		CALL `proc_error_log`('proc_set_bucket_preference',@errno,@text);
	END;
	
	UPDATE tbl_service_class_mapping SET preference = in_preference WHERE bucket_id = in_bucket_id;

	SET OutStatus = 'success';
	SET OutResponseCode = 1;
	SET OutDesc = 'success';
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `proc_set_bucket_preference_main` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`ussddev`@`%` PROCEDURE `proc_set_bucket_preference_main`(IN in_main_rule_id int(11),
						IN in_preference int(11),
						OUT OutStatus VARCHAR(100),
						OUT OutResponseCode INT(11),
						OUT OutDesc VARCHAR(2000))
BEGIN
 DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		GET DIAGNOSTICS CONDITION 1 @sqlstate = RETURNED_SQLSTATE,  @errno = MYSQL_ERRNO, @text = MESSAGE_TEXT;
		SET OutResponseCode = 0;
		SET OutStatus='Failure';
		SET OutDesc='db error';
		CALL `proc_error_log`('proc_set_bucket_preference_main',@errno,@text);
	END;
	
	UPDATE tbl_main_rules_mapping SET preference = in_preference WHERE main_rule_id = in_main_rule_id;

	SET OutStatus = 'success';
	SET OutResponseCode = 1;
	SET OutDesc = 'success';
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `proc_sr_comment_view` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_sr_comment_view`(
							in in_login_id int,
							in in_service_req_id int
							)
BEGIN
		select `id`,
			`login_id`,
			(SELECT tb2.`username` FROM `tbl_users_master`tb2 WHERE tb2.`user_id`= tb1.login_id) AS Username,
			`service_req_id`,
			(SELECT tb3.`title` FROM `tbl_service_request`tb3 WHERE tb3.`id`= tb1.service_req_id) AS Title,
			`comment`,
			`created_date`,
			`last_modified`
		from `tbl_service_request_comment` tb1
		where `service_req_id`=in_service_req_id;	
				
 END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `proc_sr_create_comment` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_sr_create_comment`(
							in in_login_id int,
							in in_service_req_id int,
							in in_comment longtext,
							OUT OutStatus VARCHAR(100),
							OUT OutResponseCode INT,
							OUT OutDesc VARCHAR(1000)
							)
Createcomment: BEGIN
	
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		GET DIAGNOSTICS CONDITION 1 @sqlstate = RETURNED_SQLSTATE,  @errno = MYSQL_ERRNO, @text = MESSAGE_TEXT;
		SET OutResponseCode = @errno;
		SET OutStatus='F';
		SET OutDesc=@text;
		 CALL `proc_error_log`('proc_sr_create_comment',@errno,@text);
	END;
		
	
		insert into`tbl_service_request_comment`
		(
		`login_id`,
		`service_req_id`,
		`status`,
		`comment`,
		`created_date`,
		`last_modified`
		)
		values
		(
		in_login_id,
		in_service_req_id,
		1,
		in_comment,
		now(),
		now()
		);
			SET OutResponseCode=0;
			SET OutStatus = 'success';
			SET OutDesc = 'Comment Added Successfully !!';	
	
		
				
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `proc_sr_edit_comment` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_sr_edit_comment`(
							in in_id int,
							in in_login_id int,
							in in_status int,
							in in_comment varchar(2000),
							OUT OutStatus VARCHAR(100),
							OUT OutResponseCode INT,
							OUT OutDesc VARCHAR(1000)
							)
Createcomment: BEGIN
	
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		GET DIAGNOSTICS CONDITION 1 @sqlstate = RETURNED_SQLSTATE,  @errno = MYSQL_ERRNO, @text = MESSAGE_TEXT;
		SET OutResponseCode = @errno;
		SET OutStatus='F';
		SET OutDesc=@text;
		 CALL `proc_error_log`('proc_sr_edit_comment',@errno,@text);
	END;
		
		
	if not exists(select 1 from `tbl_service_request_comment` where id=in_id)
	then
		SET OutResponseCode=-1;
		SET OutStatus = 'F';
		SET OutDesc = 'Invalid Id !!';
	else
		if in_status=4
		then
			insert into tbl_service_request_comment_archive
			SELECT * FROM tbl_service_request_comment 
			WHERE `id`=in_id;	
			
			delete from tbl_service_request_comment where `id`=in_id;
			
			SET OutResponseCode=0;
			SET OutStatus = 'success';
			SET OutDesc = 'Deleted Successfully !!';
		
		else
		
					update tbl_service_request_comment
					set `comment`=in_comment,
					     `last_modified`=now()
					where `id`=in_id;
					
					SET OutResponseCode=0;
					SET OutStatus = 'success';
					SET OutDesc = 'Comment Added Successfully !!';
		END IF;		
	end if;		
		
				
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `proc_test` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`ussddev`@`%` PROCEDURE `proc_test`(IN in_parent_id INT(11),
				IN in_service_id INT(11),
				IN in_service_code  VARCHAR(100),
				IN in_response_text VARCHAR(1000))
BEGIN  
	insert into tbl_service_nodes_t (parent_id, service_id, service_code, response_text) values (in_parent_id,in_service_id,in_service_code,in_response_text);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `proc_test_msisdn_add` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_test_msisdn_add`(
							IN in_msisdn VARCHAR(30),
							IN in_service_id INT,
							IN in_login_id INT,
							OUT OutStatus VARCHAR(100),
							OUT OutResponseCode INT,
							OUT OutDesc VARCHAR(2000)
							)
test_msisdn: BEGIN
		DECLARE v_service_code ,v_deployment_date VARCHAR(200);
		DECLARE EXIT HANDLER FOR SQLEXCEPTION
		BEGIN
		GET DIAGNOSTICS CONDITION 1 @sqlstate = RETURNED_SQLSTATE,  @errno = MYSQL_ERRNO, @text = MESSAGE_TEXT;
		
		IF @errno=1062
		THEN
			SET OutResponseCode = -1;
			SET OutStatus = 'F';
			SET OutDesc = 'Duplicate Msisdn !!';
		ELSE
			SET OutResponseCode = @errno;
			SET OutStatus = 'F';
			SET OutDesc = @text;
		END IF; 
		ROLLBACK;
		 CALL `proc_error_log`('proc_test_msisdn_add',@errno,@text);
		END;
		START TRANSACTION;
	
	set v_deployment_date=now();	
		
	IF NOT EXISTS (SELECT 1 FROM tbl_service_master WHERE `service_id` = in_service_id) 
	THEN
		SET OutResponseCode = 0;
		SET OutStatus = 'Failure';
		SET OutDesc = 'Invalid Service Id !!';
		ROLLBACK;
		LEAVE test_msisdn;
	END IF;
	
	
	SELECT `service_code` INTO v_service_code FROM `tbl_service_master` WHERE `service_id`=in_service_id AND `parent_service_id`=0;
	IF v_service_code IS NULL
	THEN 
		
		SET OutResponseCode = 0;
		SET OutStatus = 'Failure';
		SET OutDesc = 'Invalid Service Code !!';
		ROLLBACK;
		LEAVE test_msisdn;	
	
	ELSE
		
		INSERT INTO `tbl_msisdn_test`
		(
		`msisdn`,
		`service_code`,
		`service_id`,
		`creator_id`,
		`creation_on`	
		)
		VALUES
		(
		in_msisdn,
		v_service_code,
		in_service_id,
		in_login_id,
		NOW()
		);
		
		
		CALL `proc_trigger_add`(in_login_id, 0,0,'TEST',v_deployment_date);
		
		SET OutResponseCode=0;
		SET OutStatus = 'success';
		SET OutDesc = 'success';
		COMMIT;	
	END IF;
   END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `proc_test_msisdn_delete` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_test_msisdn_delete`(
								in in_msisdn varchar(30),
								in in_login_id int,
								OUT OutStatus VARCHAR(100),
								OUT OutResponseCode INT,
								OUT OutDesc VARCHAR(2000)
							)
update_msisdn: BEGIN
DECLARE v_service_code,v_deployment_date VARCHAR(200);
		
		DECLARE EXIT HANDLER FOR SQLEXCEPTION
		BEGIN
		GET DIAGNOSTICS CONDITION 1 @sqlstate = RETURNED_SQLSTATE,  @errno = MYSQL_ERRNO, @text = MESSAGE_TEXT;
		SET OutResponseCode = @errno;
		SET OutStatus='F';
		SET OutDesc=@text;
		 CALL `proc_error_log`('proc_test_msisdn_delete',@errno,@text);
		END;

SET v_deployment_date=NOW();	
	
	IF NOT EXISTS (SELECT 1 FROM `tbl_msisdn_test` WHERE `msisdn` = in_msisdn) 
	THEN
		SET OutResponseCode = 0;
		SET OutStatus = 'Failure';
		SET OutDesc = 'Invalid Msisdn !!';
		LEAVE update_msisdn;
	END IF;
	
	
	insert into `tbl_msisdn_test_archive`(select * from `tbl_msisdn_test` where `msisdn`=in_msisdn);
	
	delete from tbl_msisdn_test WHERE `msisdn`=in_msisdn;
	
	
	CALL `proc_trigger_add`(in_login_id,0,0,'TEST',v_deployment_date);
		SET OutResponseCode=0;
		SET OutStatus = 'success';
		SET OutDesc = 'Deleted Successfully !!';
	
   END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `proc_test_msisdn_update` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_test_msisdn_update`(
								in in_msisdn varchar(30),
								in in_service_id int,	
								in in_login_id int,
								OUT OutStatus VARCHAR(100),
								OUT OutResponseCode INT,
								OUT OutDesc VARCHAR(2000)
							)
update_msisdn: BEGIN
DECLARE v_service_code,v_deployment_date VARCHAR(200);
		
		DECLARE EXIT HANDLER FOR SQLEXCEPTION
		BEGIN
		GET DIAGNOSTICS CONDITION 1 @sqlstate = RETURNED_SQLSTATE,  @errno = MYSQL_ERRNO, @text = MESSAGE_TEXT;
		SET OutResponseCode = @errno;
		SET OutStatus='F';
		SET OutDesc=@text;
		 CALL `proc_error_log`('proc_test_msisdn_update',@errno,@text);
		END;
		

set v_deployment_date=now();
	
	IF NOT EXISTS (SELECT 1 FROM `tbl_msisdn_test` WHERE `msisdn` = in_msisdn) 
	THEN
		SET OutResponseCode = 0;
		SET OutStatus = 'Failure';
		SET OutDesc = 'Invalid Msisdn !!';
		LEAVE update_msisdn;
	END IF;
	
	
	IF not EXISTS (SELECT 1 FROM `tbl_service_master` WHERE `service_id` = in_service_id) 
	THEN
		SET OutResponseCode = 0;
		SET OutStatus = 'Failure';
		SET OutDesc = 'Invalid Service Id !!';
		LEAVE update_msisdn;
	END IF;
	
	
	SELECT `service_code` INTO v_service_code 
	FROM `tbl_service_master` WHERE `service_id`=in_service_id AND `parent_service_id`=0;
	
	update `tbl_msisdn_test`
	set `service_code`=v_service_code,
	     `service_id`=in_service_id	
	where msisdn=in_msisdn;
	
	CALL `proc_trigger_add`(in_login_id,0,0,'TEST',v_deployment_date);
	
		SET OutResponseCode=0;
		SET OutStatus = 'success';
		SET OutDesc = 'Updated Successfully !!';
	
   END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `proc_test_msisdn_view` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_test_msisdn_view`(
								in in_login_id int
								)
BEGIN
		
	SELECT `id`,`msisdn`,`service_code`,`service_id`,
	(SELECT username FROM tbl_users_master WHERE user_id=tb2.creator_id) AS creator_name,
	UNIX_TIMESTAMP(`creation_on`)*1000 as `creation_on`
	FROM tbl_msisdn_test tb2 ;
   END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `proc_transactions4` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`ussddev`@`%` PROCEDURE `proc_transactions4`(in in_dt date, in in_hour int(11), in in_shortcode varchar(50), in in_concatreqtext varchar(100), in in_gw varchar(50), in in_salesareaid varchar(100), in in_lac varchar(100), in in_profile varchar(200))
begin

declare where_clause varchar(1000);
declare gw_error_types varchar(200);
declare table_name varchar(200);

declare out_success int(10);
declare out_error55 int(10);
declare out_error2561 int(10);
declare out_error517 int(10);
declare out_error518 int(10);
declare out_error513 int(10);

set where_clause = "";
if in_dt is not null then
	set table_name = concat("tbl_transactions", date_format(in_dt, '%Y%m%d'));
	
end if;
if in_hour is not null then
	set where_clause = concat(where_clause, " and hour = " , in_hour, " ");
end if;
if in_shortcode is not null then
	set where_clause = concat(where_clause, " and shortcode = '" , in_shortcode, "' ");
end if;
if in_gw is not null then
	set where_clause = concat(where_clause, " and gw = '" , in_gw, "' ");
end if;
if in_salesareaid is not null then
	set where_clause = concat(where_clause, " and salesareaid = '" , in_salesareaid, "' ");
end if;
if in_lac is not null then
	set where_clause = concat(where_clause, " and lac = '" , in_lac, "' ");
end if;
if in_profile is not null then
	set where_clause = concat(where_clause, " and profile = '" , in_profile, "' ");
end if;
if in_concatreqtext is not null then
	set where_clause = concat(where_clause, " and (concatreqtext = '" , in_concatreqtext, "' or concatreqtext like '", in_concatreqtext, "|%')");
end if;



set gw_error_types = "(errorcode = 0 and errortype) = 0 or (errorcode = 3 and errortype = 55) or (errorcode = 5 and errortype = 55) or (errorcode = 136 and errortype = 88) or (errorcode = 34 and errortype = 33)";
set @s = concat('select sum(transactions) into @val from ', table_name, ' where (', gw_error_types, ') ', where_clause);
prepare stmt from @s;
execute stmt;
deallocate prepare stmt;
set out_success = ifnull(@val, 0);


set gw_error_types = "errorcode = 55 and errortype = 0";
set @s = concat('select sum(transactions) into @val from ', table_name, ' where (', gw_error_types, ') ', where_clause);
prepare stmt from @s;
execute stmt;
deallocate prepare stmt;
set out_error55 = ifnull(@val, 0);


set gw_error_types = "errorcode = 145 and errortype = 91";
set @s = concat('select sum(transactions) into @val from ', table_name, ' where (', gw_error_types, ') ', where_clause);
prepare stmt from @s;
execute stmt;
deallocate prepare stmt;
set out_error2561 = ifnull(@val, 0);


set gw_error_types = "(errorcode = 1001 and errortype = 0) or (errorcode = 1003 and errortype = 0) or (errorcode = 1004 and errortype = 0) or (errorcode = 1006 and errortype = 0)";
set @s = concat('select sum(transactions) into @val from ', table_name, ' where (', gw_error_types, ') ', where_clause);
prepare stmt from @s;
execute stmt;
deallocate prepare stmt;
set out_error517 = ifnull(@val, 0);


set gw_error_types = "(errorcode = 1002 and errortype = 0) or (errorcode = 1005 and errortype = 0)";
set @s = concat('select sum(transactions) into @val from ', table_name, ' where (', gw_error_types, ') ', where_clause);
prepare stmt from @s;
execute stmt;
deallocate prepare stmt;
set out_error518 = ifnull(@val, 0);


set gw_error_types = "errorcode = -1 and errortype = 0";
set @s = concat('select sum(transactions) into @val from ', table_name, ' where (', gw_error_types, ') ', where_clause);
prepare stmt from @s;
execute stmt;
deallocate prepare stmt;
set out_error513 = ifnull(@val, 0);


select out_success, out_error55, out_error2561, out_error517, out_error518, out_error513;

end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `proc_traverse` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`ussddev`@`%` PROCEDURE `proc_traverse`(in in_root_id int(11), in in_service_id int(20), in in_numbering int(20))
begin
DECLARE done INT DEFAULT 0;
declare v_numbering int(20);
declare v_node_type, v_is_list_element, v_menu_flag, v_node_id int(11);
declare c1 cursor for
select node_id, node_type, is_list_element, menu_flag from tbl_service_nodes where service_id = in_service_id and parent_id = in_root_id;
DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

SET @@SESSION.max_sp_recursion_depth=100;


if in_root_id <> 0 then
	update tbl_service_nodes set sequence_no = in_numbering where node_id = in_root_id and node_type = 1 and is_list_element = 1 and menu_flag in (0, 1) and is_header = 0 and is_footer = 0;
end if;

set done = false;
set v_numbering = 0;

open c1;
	loop_1: loop
		fetch c1 into v_node_id, v_node_type, v_is_list_element, v_menu_flag;
		if done = 1 then
			leave loop_1;
		end if;
		set v_numbering = v_numbering + 1;
		insert into logs values(v_node_id);
		call proc_traverse(v_node_id, in_service_id, v_numbering);
		
	end loop loop_1;
close c1;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `proc_trigger_add` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_trigger_add`(in in_login_id INT, 
							  in in_service_id int,
							  in in_deployment_id int,
							  in in_deployment_type VARCHAR(10),
							  in in_deployment_date varchar (200)
							  )
begin
		
		 
		IF in_deployment_date IS NULL 
		THEN
		SET in_deployment_date=NOW();
		END IF;
		
		 
		 IF NOT EXISTS (SELECT 1 FROM tbl_trigger WHERE service_id=in_service_id AND deployment_type = in_deployment_type AND status =1) THEN
		 	INSERT INTO tbl_trigger(service_id,deployment_id,deployment_type,deployment_date,status,login_id) VALUES(in_service_id,in_deployment_id,in_deployment_type,in_deployment_date,1,in_login_id);
		 END IF;			
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `proc_trigger_add_pref` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_trigger_add_pref`(in in_login_id INT, 
							  in in_service_id int,
							  in in_deployment_id int,
							  in in_deployment_date varchar (200),
							  in in_bucket_id int
							  )
begin
		
		 
		IF in_deployment_date IS NULL 
		THEN
		SET in_deployment_date=NOW();
		END IF;
	
		select criteria into @criteria from tbl_service_class_mapping where bucket_id = in_bucket_id;
		 
		 IF NOT EXISTS (SELECT 1 FROM tbl_trigger WHERE service_id=in_service_id AND deployment_type = @criteria AND status =1) THEN
		 	INSERT INTO tbl_trigger(service_id,deployment_id,deployment_type,deployment_date,status,login_id) VALUES(in_service_id,in_deployment_id,@criteria,in_deployment_date,1,in_login_id);
		 END IF;			
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `proc_trigger_add_pref_main` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_trigger_add_pref_main`(in in_login_id INT, 
							  in in_service_id int,
							  in in_deployment_id int,
							  in in_deployment_date varchar (200),
							  in in_deployment_type varchar(200)
							  )
begin
		
		 
		IF in_deployment_date IS NULL 
		THEN
		SET in_deployment_date=NOW();
		END IF;
	
		 IF NOT EXISTS (SELECT 1 FROM tbl_trigger WHERE service_id=in_service_id AND deployment_type = in_deployment_type AND status =1) THEN
		 	INSERT INTO tbl_trigger(service_id,deployment_id,deployment_type,deployment_date,status,login_id) VALUES(in_service_id,in_deployment_id,in_deployment_type,in_deployment_date,1,in_login_id);
		 END IF;			
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `proc_trigger_get` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_trigger_get`( in in_deployment_type VARCHAR(100))
begin
		 SELECT trigger_id,service_id,login_id,(SELECT `service_code` FROM tbl_service_master tsm WHERE tsm.service_id = tgr.service_id) FROM tbl_trigger tgr WHERE status = 1 AND deployment_type = in_deployment_type AND deployment_date < NOW();
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `proc_trigger_update` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_trigger_update`( in in_trigger_id int,in in_status INT)
begin
declare v_deployment_id int;
declare v_user_id int;
declare  v_service_name , v_deployment_type ,v_msg varchar(200);
declare v_assignee int;
declare v_service_id int;
	
	
	
	select `deployment_id` into v_deployment_id 
	from `tbl_trigger` 
	where `trigger_id`=in_trigger_id;
	
	
	UPDATE tbl_trigger
	SET status = in_status
	WHERE trigger_id=in_trigger_id;
	
	
	
	SELECT login_id,service_name ,deployment_type ,service_id INTO v_user_id , v_service_name ,v_deployment_type ,v_service_id
	FROM tbl_service_deploy_logs where `id`=v_deployment_id limit 1;
	
	SELECT assignee INTO v_assignee 
	FROM tbl_service_request 
	WHERE service_id=v_service_id LIMIT 1;
	
	
		
		if in_status=0
		then 
			update`tbl_service_deploy_logs`
			set status=0
			where id=v_deployment_id;
		
		
			SET v_msg=CONCAT(v_deployment_type,' - Successfully Deployed Service - ',v_service_name);
		
			CALL `proc_create_notification`(v_user_id,v_msg,0); 
			CALL `proc_create_notification`(v_assignee,v_msg,0);
			
		end if;
		
		
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `proc_umb_report1` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`ussddev`@`%` PROCEDURE `proc_umb_report1`(
					   IN IN_START_DATE DATE,
					   IN IN_END_DATE DATE,
					   IN IN_HOURS varchar(10),
					   IN IN_TYPE INT,
					   IN IN_REPORT_TYPE VARCHAR (50),
					   OUT OUT_STRING VARCHAR(100)
					   )
BEGIN
DECLARE vString VARCHAR(2000) DEFAULT '';
DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		GET DIAGNOSTICS CONDITION 1 @sqlstate = RETURNED_SQLSTATE,  @errno = MYSQL_ERRNO, @text = MESSAGE_TEXT;
		
		CALL `proc_error_log`('proc_umb_report_dynamic',@errno,@text);
		
		SET OUT_STRING="ERROR";
	END;  

 
SET vString = CONCAT(vString," (`dt` BETWEEN '",IN_START_DATE,"' AND  '",IN_END_DATE,"')");
IF (UPPER(CAST(IN_HOURS AS CHAR)) != 'ALL')  THEN
	SET vString = CONCAT(vString," AND a.hour =",IN_HOURS);		
END IF;
IF (UPPER(IN_REPORT_TYPE) = 'DASHBOARD') THEN
 
	SET @t1 =CONCAT("SELECT COUNT(DISTINCT msisdn) FROM tbl_uniq_msisdns");
	
	SET @t1 =CONCAT("SELECT SUM(transactions) FROM tbl_transactions2");
ELSEIF (UPPER(IN_REPORT_TYPE) = 'TRANSACTION') THEN
	 	
	IF IN_TYPE = '1' THEN 
	
		SET @t1 =CONCAT("SELECT a.shortcode as shortcode,SUM(transactions) AS transactions   FROM tbl_transactions2 a
		
		WHERE",vString," GROUP BY a.shortcode");
		
	ELSEIF IN_TYPE = '2' THEN 
	
		SET @t1 =CONCAT("SELECT a.gw as gw,SUM(transactions) AS transactions  
		
		FROM tbl_transactions2 a WHERE",vString," GROUP BY a.gw");
		
	ELSEIF IN_TYPE = '3'  THEN 
	
		SET @t1 =CONCAT("SELECT a.salesareaid as salesareaid,SUM(transactions) AS transactions  
		
		FROM tbl_transactions2 a WHERE",vString," GROUP BY a.salesareaid");
		
	ELSEIF IN_TYPE = '4'  THEN 
	
		SET @t1 =CONCAT("SELECT a.lac as lac,SUM(transactions) AS transactions  
		
		FROM tbl_transactions2 a WHERE",vString," GROUP BY a.lac");	
							
	ELSEIF (UPPER(IN_TYPE) = '5')  THEN  
	
		SET @t1 =CONCAT("SELECT a.profile as profile,SUM(transactions) AS transactions FROM tbl_transactions2 a WHERE",vString," GROUP a.profile");
	END IF;
	
ELSEIF (UPPER(IN_REPORT_TYPE) = 'RESPONCE_TIME') THEN
	IF  IN_TYPE = '1' THEN  
	
		SET @t1 =CONCAT("select a.shortcode, sum(a.count_resptime0), sum(a.count_resptime1), sum(a.count_resptime2), sum(a.count_resptime3) from tbl_resptime a where",vString,"GROUP by a.shortcode");
		
	ELSEIF IN_TYPE = '2' THEN 
	
		SET @t1 =CONCAT("select a.gw, sum(a.count_resptime0), sum(a.count_resptime1), sum(a.count_resptime2), sum(a.count_resptime3) from tbl_resptime a where",vString,"GROUP by a.gw");
		
	END IF;
	
ELSEIF  (UPPER(IN_REPORT_TYPE) = 'TPS') THEN
	 
	IF  IN_TYPE = '1' THEN    
		SET @t1 =CONCAT("select a.shortcode, a.peak_tps, a.avg_tps, a.min_tps from tbl_tps_shortcode_daily a where",vString);
		
		IF (UPPER(CAST(IN_HOURS AS CHAR)) != 'ALL')  THEN  
			
			SET @t1 =CONCAT("select a.shortcode, a.peak_tps, a.avg_tps, a.min_tps from tbl_tps_shortcode a where",vString);
		
		END IF;	
	
	ELSEIF IN_TYPE = '2' THEN   
		
		SET @t1 =CONCAT("select a.gw, a.peak_tps, a.avg_tps, a.min_tps from tbl_tps_gw_daily a where",vString);
		
		IF (UPPER(CAST(IN_HOURS AS CHAR)) != 'ALL')  THEN 
		
			SET @t1 =CONCAT("select a.gw, a.peak_tps, a.avg_tps, a.min_tps from tbl_tps_gw a where",vString);
		END IF;
		
	ELSEIF IN_TYPE = '3'  THEN  
	 
		SET @t1 =CONCAT("select a.peak_tps, a.avg_tps, a.min_tps from tbl_tps_overall_daily a where",vString);
		
		IF (UPPER(CAST(IN_HOURS AS CHAR)) != 'ALL')  THEN
		
			SET @t1 =CONCAT("select  a.peak_tps, a.avg_tps, a.min_tps from tbl_tps_overall a where",vString);
			
		END IF;
		
	END IF;
	
ELSEIF  (UPPER(IN_REPORT_TYPE) = 'MSISDN') THEN
	IF IN_TYPE = '1' THEN   
	
		SET @t1 =CONCAT("select count(distinct a.msisdn) as msisdn_count from tbl_uniq_msisdns a where",vString);
		
	ELSEIF IN_TYPE = '2' THEN  
	
		
		SET @t1 =CONCAT("select attr as shortcode, dt, unique_msisdns as msisdn_count from tbl_unique_msisdns_summary where",vString," and reporttype = 'shortcode'");
	
	ELSEIF IN_TYPE = '3' THEN 
	
	        
		SET @t1 =CONCAT("select attr as salesareaid, dt, unique_msisdns as msisdn_count from tbl_unique_msisdns_summary where",vString," and reporttype = 'salesarea'");
	ELSEIF IN_TYPE = '4' THEN 
	
		 
		SET @t1 =CONCAT("select attr as profile, dt, unique_msisdns as msisdn_count from tbl_unique_msisdns_summary where",vString," and reporttype = 'profile'");
        ELSEIF IN_TYPE = '5' THEN  
        
		set @table_name = concat("tbl_transactions", date_format(IN_START_DATE, '%Y%m%d'));
		SET @t1 = CONCAT("select count(1) from ", @table_name);
			
        END IF;
        
END IF;	 
 PREPARE stmt FROM @t1;
 
 EXECUTE stmt;
 
 DEALLOCATE PREPARE stmt;
 
 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `proc_update_node_status` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_update_node_status`(   IN in_login_id INT,
								    IN in_service_id INT,
								    IN in_node_id INT,
								    IN in_status INT,
							            OUT OutStatus VARCHAR(100),
							            OUT OutResponseCode INT,
							            OUT OutDesc VARCHAR(200)	
								)
proc:BEGIN
DECLARE v_count,v_edit_flag,v_parent_service_id,v_login_id INT;	
DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		GET DIAGNOSTICS CONDITION 1 @sqlstate = RETURNED_SQLSTATE,  @errno = MYSQL_ERRNO, @text = MESSAGE_TEXT;
		SET OutResponseCode = @errno;
		SET OutStatus='F';
		SET OutDesc=@text;
		 CALL `proc_error_log`('proc_update_node_status',@errno,@text);
	END;	
	
	SELECT  `parent_service_id` INTO v_parent_service_id FROM `tbl_service_master` WHERE `service_id`=in_service_id LIMIT 1;
  
	IF v_parent_service_id = 0 THEN
	 	SELECT edit_flag,creator_id INTO v_edit_flag,v_login_id FROM tbl_edit_service_history
		WHERE service_id =in_service_id AND edit_flag =1 LIMIT 1;
	 ELSE
	 	SELECT edit_flag,creator_id INTO v_edit_flag,v_login_id FROM tbl_edit_service_history
		WHERE service_id =v_parent_service_id AND edit_flag =1 LIMIT 1;
	 END IF;
	
	
	IF v_edit_flag<>1
	THEN
		SET OutResponseCode = 1;
		SET OutStatus = 'F';
		SET OutDesc = 'Service is not in Edit mode';
		LEAVE proc;
	ELSEIF v_login_id <> in_login_id THEN
		SET OutResponseCode = 1;
		SET OutStatus = 'F';
		SET OutDesc = 'You are not autherised as other user is working on this service';
		LEAVE proc;
	END IF; 
	
		
SELECT COUNT(1) INTO v_count 
FROM `tbl_service_nodes_temp` 
WHERE `node_id`=in_node_id AND `service_id`=in_service_id;
	
IF v_count=0 
THEN
	SET OutResponseCode=-1;
	SET OutStatus = 'F';
	SET OutDesc = 'Invalid Node Id';
ELSE
		
		UPDATE `tbl_service_nodes_temp`
		SET STATUS =in_status
		WHERE `node_id`=in_node_id 
		AND `service_id`=in_service_id;
	
	
	
		SET OutResponseCode=0;
		SET OutStatus = 'success';
		SET OutDesc = 'Status  Changed Successfully.';
		
		UPDATE 	tbl_edit_service_history 
		SET `last_modified` = NOW()
		WHERE service_id =in_service_id AND edit_flag =1;
	
END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `proc_update_read_notification` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_update_read_notification`(
							in in_user_id int,
							IN in_notification_id INT,
							OUT OutStatus VARCHAR(100),
							OUT OutResponseCode INT,
							OUT OutDesc VARCHAR(2000)
							)
proc:BEGIN
DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		GET DIAGNOSTICS CONDITION 1 @sqlstate = RETURNED_SQLSTATE,  @errno = MYSQL_ERRNO, @text = MESSAGE_TEXT;
		SET OutResponseCode = @errno;
		SET OutStatus='F';
		SET OutDesc=@text;
		 CALL `proc_error_log`('proc_update_read_notification',@errno,@text);
	END;
if not exists (select 1 from `tbl_notification` where `user_id`=in_user_id and status=0)
then
		SET OutResponseCode=0;
		SET OutStatus = 'F';
		SET OutDesc = 'Invalid request.';
		leave proc;
end if;
	
	update tbl_notification
	set status=1,
	read_date=now()
	where notification_id=in_notification_id;
	
		SET OutResponseCode=0;
		SET OutStatus = 'success';
		SET OutDesc = 'success';
	
	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `proc_update_service_detail` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_update_service_detail`(	
						in in_login_id int,
						in in_service_id int,
						IN in_service_name VARCHAR(100),
						IN in_status INT,
						IN in_description VARCHAR(1000),
						OUT OutStatus VARCHAR(100),
						OUT OutResponseCode INT,
						OUT OutDesc VARCHAR(200)
							)
BEGIN
	
declare vcount int;
	
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		GET DIAGNOSTICS CONDITION 1 @sqlstate = RETURNED_SQLSTATE,  @errno = MYSQL_ERRNO, @text = MESSAGE_TEXT;
		SET OutResponseCode = @errno;
		SET OutStatus='F';
		SET OutDesc=@text;
		 CALL `proc_error_log`('proc_update_service_detail',@errno,@text);
	END;
		 
SELECT COUNT(1) INTO vcount from tbl_service_master  WHERE `service_id`=in_service_id;
if vcount=0
then
	  SET OutResponseCode=-1;
	  SET OutStatus = 'F';
	  SET OutDesc = 'Invalid Service Id !!';
else
		
		update `tbl_service_master`
		set `service_name`=in_service_name,
		     `status`=in_status,
		     `description`=in_description,
		     `last_modified`=now(),
		     `last_modify_by`=in_login_id
		 where `service_id`=in_service_id;	
			
			SET OutResponseCode = 0;
			SET OutStatus = 'Success';
			SET OutDesc = 'Updated Successfully';
end if;		
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `proc_update_service_node` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_update_service_node`(	
						IN in_login_id INT(11),
						in in_node_id int ,
						IN in_parent_id INT(11),
						IN in_status INT(11),
						IN in_service_id INT(11),
						IN in_service_code  VARCHAR(100),
						IN in_request_text VARCHAR(250),
						IN in_response_text VARCHAR(1000),
						IN in_regex VARCHAR(1000),
						IN in_invalid_response_text VARCHAR(1000),
						IN in_invalid_menu_flag INT(11),
						IN in_node_type INT(11),
						IN in_is_header VARCHAR(250),
						IN in_is_footer VARCHAR(250),
						IN in_is_list_element VARCHAR(250),
						in in_preference int,
						IN in_menu_flag INT(11),
						IN in_dcs INT(11),
						IN in_application_id INT(11),
						IN in_variable_name INT(11), 
						IN in_variable_value VARCHAR(250),
						IN in_switch_service_id INT(11),
						IN in_switch_service_code VARCHAR(250),
						IN in_circle_id  VARCHAR(250),
						IN in_operator_id  VARCHAR(250),
						IN in_if_clause  INT(11),
						IN in_if_value_clause  VARCHAR(250),
						IN in_sequence_no varchar(100),
						OUT OutStatus VARCHAR(100),
						OUT OutResponseCode INT,
						OUT OutDesc VARCHAR(2000)
							)
proc:BEGIN
	DECLARE v_current_node_type,v_node_id ,v_edit_flag, v_parent_service_id, v_login_id INT;
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		GET DIAGNOSTICS CONDITION 1 @sqlstate = RETURNED_SQLSTATE,  @errno = MYSQL_ERRNO, @text = MESSAGE_TEXT;
		SET OutResponseCode = @errno;
		SET OutStatus='F';
		SET OutDesc=@text;
		 CALL `proc_error_log`('proc_update_service_node',@errno,@text);
	END;
	
	SELECT  `parent_service_id` INTO v_parent_service_id FROM `tbl_service_master` WHERE `service_id`=in_service_id LIMIT 1;
  
	IF v_parent_service_id = 0 THEN
	 	SELECT edit_flag,creator_id INTO v_edit_flag,v_login_id FROM tbl_edit_service_history
		WHERE service_id =in_service_id AND edit_flag =1 LIMIT 1;
	 ELSE
	 	SELECT edit_flag,creator_id INTO v_edit_flag,v_login_id FROM tbl_edit_service_history
		WHERE service_id =v_parent_service_id AND edit_flag =1 LIMIT 1;
	 END IF;
	
	
	IF v_edit_flag<>1
	THEN
		SET OutResponseCode = 1;
		SET OutStatus = 'F';
		SET OutDesc = 'Service is not in Edit mode';
		LEAVE proc;
	ELSEIF v_login_id <> in_login_id THEN
		SET OutResponseCode = 1;
		SET OutStatus = 'F';
		SET OutDesc = 'You are not autherised as other user is working on this service';
		LEAVE proc;
	END IF; 
	
		 
	SELECT service_code INTO in_service_code FROM tbl_service_master 
	WHERE `service_id` = in_service_id LIMIT 1;
	
	
	
	IF in_node_id IS NULL THEN
		CALL proc_create_service_node(in_login_id,in_parent_id, in_status, in_service_id, in_service_code, in_request_text, in_response_text, in_regex, in_invalid_response_text, in_invalid_menu_flag, in_node_type, in_is_header, in_is_footer, in_is_list_element, in_preference, in_menu_flag, in_dcs, in_application_id, in_variable_name, in_variable_value, in_switch_service_id, in_switch_service_code, in_circle_id, in_operator_id, in_if_clause, in_if_value_clause,in_sequence_no,@a,@b,@c);
		SELECT @a,@b,@c INTO OutStatus,OutResponseCode,OutDesc;
		LEAVE proc;
	
	END IF;
	
	
	SELECT node_type ,node_id into v_current_node_type ,v_node_id FROM tbl_service_nodes_temp
	WHERE node_id=in_node_id;
	
if v_node_id is null then
	
	SET OutResponseCode=-1;
	SET OutStatus = 'F';
	SET OutDesc = 'Invalid Node Id';
	
	
	
	else
	
	
	 	 UPDATE tbl_service_nodes_temp
		 set 	 parent_id =in_parent_id,
			 STATUS =in_status,
			 service_id=in_service_id,
			 `parent_service_id`=v_parent_service_id,
			 service_code=in_service_code,
			 request_text=in_request_text,
			 response_text=in_response_text,
			 regex=in_regex,
			 invalid_response_text=in_invalid_response_text,
			 invalid_menu_flag=in_invalid_menu_flag,
			 node_type=in_node_type,
			 is_header=in_is_header,
			 is_footer=in_is_footer,
			 is_list_element=in_is_list_element,
			 preference=in_preference,
			 menu_flag=in_menu_flag,
			 dcs=in_dcs,
			 application_id=in_application_id,
			 variable_name=in_variable_name, 
			 variable_value=in_variable_value,
			 switch_service_id=in_switch_service_id,
			 switch_service_code=in_switch_service_code,
			 circle_id=in_circle_id,
			 operator_id=in_operator_id,
			 if_clause=in_if_clause,
			 if_value_clause=in_if_value_clause,
			 sequence_no=in_sequence_no
		WHERE node_id=in_node_id and service_id=in_service_id;
		
		UPDATE 	tbl_edit_service_history 
		SET `last_modified` = NOW()
		WHERE service_id =in_service_id AND edit_flag =1;
	
	
			
			SET OutResponseCode=0;
			SET OutStatus = 'success';
			SET OutDesc = 'success';
	
	end if;
   
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `proc_update_service_status` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_update_service_status`(IN in_service_id INT,
								    IN in_status INT,
							            OUT OutStatus VARCHAR(100),
							            OUT OutResponseCode INT,
							            OUT OutDesc VARCHAR(200)	
								)
proc:BEGIN
DECLARE v_service_id INT;	
DECLARE v_edit_flag INT;
DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		GET DIAGNOSTICS CONDITION 1 @sqlstate = RETURNED_SQLSTATE,  @errno = MYSQL_ERRNO, @text = MESSAGE_TEXT;
		SET OutResponseCode = @errno;
		SET OutStatus='F';
		SET OutDesc=@text;
		 CALL `proc_error_log`('proc_update_service_status',@errno,@text);
	END;	
	
	
		
	SELECT service_id INTO v_service_id  
	FROM `tbl_service_master` 
	WHERE service_id=in_service_id;
	
	
	
	
	
IF v_service_id IS NULL 
THEN
	SET OutResponseCode=-1;
	SET OutStatus = 'F';
	SET OutDesc = 'Invalid Service Id ';
ELSE
	
	
	 IF in_status=4
	 
	 THEN
		SELECT edit_flag INTO v_edit_flag FROM tbl_edit_service_history
		WHERE service_id =in_service_id AND edit_flag =1 LIMIT 1;
			
		IF v_edit_flag<>1
			THEN
				SET OutResponseCode = 1;
				SET OutStatus = 'F';
				SET OutDesc = 'Service is not in Edit mode';
				LEAVE proc;
			
		END IF;
			     
			DELETE FROM tbl_service_master WHERE (service_id=v_service_id OR parent_service_id=v_service_id) ;
			
			DELETE FROM `tbl_service_nodes` WHERE (service_id=v_service_id OR parent_service_id=v_service_id) ;
			
			
			SET OutResponseCode=0;
			SET OutStatus = 'success';
			SET OutDesc = 'Service Deleted Successfully.';
	
	ELSE
	
		UPDATE tbl_service_master
		SET STATUS =in_status,
		`last_modified`=NOW()
		WHERE service_id=v_service_id;
	
		SET OutResponseCode=0;
		SET OutStatus = 'success';
		SET OutDesc = 'Status  Changed Successfully.';
	
	END IF;
	  
		
END IF;
	 
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `proc_update_user_account` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_update_user_account`(
							IN InUserId INT,	
							IN InUserType INT,	
							IN InUserName VARCHAR(100),
							IN InPassword VARCHAR(100),	
							IN InEmail VARCHAR(100),
							IN InMsisdn VARCHAR(15),
							IN In_user_mngt_permission INT,
							IN In_service_mngt_permission INT,	
							IN InLoginId INT,
							OUT OutStatus VARCHAR(100),
							OUT OutResponseCode INT,
							OUT OutDesc VARCHAR(1000)
		
							)
CreateUser: BEGIN
	DECLARE vGrandParentId,vUserTypeParent, vAccountType,vChargingMode,vAccManagerId,vBucketFlag,v_count INT;
	DECLARE vCreationMode,vIdentifier, vSapId,vGraphId  VARCHAR(100);
	DECLARE vVIPFlag,vGraphFlag VARCHAR(1);
	
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		GET DIAGNOSTICS CONDITION 1 @sqlstate = RETURNED_SQLSTATE,  @errno = MYSQL_ERRNO, @text = MESSAGE_TEXT;
		SET OutResponseCode = @errno;
		SET OutStatus='F';
		SET OutDesc=@text;
		 CALL `proc_error_log`('proc_create_user_account',@errno,@text);
	END;
		
	CALL `proc_error_log`('proc_create_user_account inputs',120,CONCAT(InUserId,'|',InUserType,'|',InUserName,'|',InPassword,'|',InEmail,'|',In_user_mngt_permission,'|',In_service_mngt_permission,'|',InLoginId));
		
	IF ifNUll(InUserId,0)=0  THEN	 
		IF NOT EXISTS(SELECT 1 FROM tbl_users_master WHERE UPPER(username) = UPPER(InUserName))  THEN
		 
		if InUserType=1 or InUserType=2
		then
		set In_user_mngt_permission=0;
		set In_service_mngt_permission=1;
		else
		SET In_user_mngt_permission=0;
		SET In_service_mngt_permission=0;
		end if; 
		   
			INSERT INTO `tbl_users_master`
				(
				`username`,
				`password`,
				`msisdn`,
				`email`,
				`status`,
				user_type,
				`um_permission`,
				`sc_permission`,
				`created_date`,
				created_by,
				`last_modified`
				
				)
				VALUES 
				(
				InUserName,
				InPassword,
				InMsisdn,
				InEmail,
				1,
				InUserType,
				In_user_mngt_permission,
				In_service_mngt_permission,
				NOW(),
				InLoginId,
				now()
				);
			
			select LAST_INSERT_ID() as OutUserMasterId ;
			 	
			
					
			SET OutResponseCode=0;
			SET OutStatus = 'success';
			SET OutDesc = 'User created successfully !!';
	
		ELSE
			SET OutResponseCode = 1;
			SET OutStatus = 'F';
			SET OutDesc = 'User already exist..!!';
		END IF;				       
	ELSE
		SELECT COUNT(1) INTO v_count  
		FROM tbl_users_master 
		WHERE user_id=InUserId;
		IF  v_count=0
		THEN
			SET OutResponseCode=-1;
			SET OutStatus = 'F';
			SET OutDesc = 'Invalid User ';
		ELSE
			
			UPDATE tbl_users_master
			SET `msisdn`=IFNULL(InMsisdn,msisdn),
				 `email`=IFNULL(InEmail,email),
			
			
				 `last_modified`=NOW(),
				 `modified_by`=InLoginId
			WHERE user_id=InUserId;
			
			select InUserId as OutUserMasterId ;
				
				SET OutResponseCode=0;
				SET OutStatus = 'success';
				SET OutDesc = 'User Updated Successfully.';
		END IF;	
	END IF;			
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `proc_update_user_status` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_update_user_status`(IN in_username VARCHAR(100),
								 IN in_status int,
								 IN In_user_mngt_permission INT,
								 IN In_service_mngt_permission INT,
							         OUT OutStatus VARCHAR(100),
							         OUT OutResponseCode INT,
							         OUT OutDesc VARCHAR(200)	
								)
BEGIN
declare v_count int ;	
DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		GET DIAGNOSTICS CONDITION 1 @sqlstate = RETURNED_SQLSTATE,  @errno = MYSQL_ERRNO, @text = MESSAGE_TEXT;
		SET OutResponseCode = @errno;
		SET OutStatus='F';
		SET OutDesc=@text;
		 CALL `proc_error_log`('proc_update_user_status',@errno,@text);
	END;	
	
	
		
	select count(1) into v_count  
	from tbl_users_master 
	where upper(username)=Upper(in_username);
IF  v_count=0
then
	SET OutResponseCode=-1;
	SET OutStatus = 'F';
	SET OutDesc = 'Invalid Username ';
else
	
	 if in_status=4
	 then
			 
			
		
				 
			delete from tbl_users_master WHERE UPPER(username)=UPPER(in_username);
			SET OutResponseCode=0;
			SET OutStatus = 'success';
			SET OutDesc = 'User Deleted Successfully.';
	
	ELSE
	
	
				update tbl_users_master
				set status =in_status,
				`um_permission`=In_user_mngt_permission,
				`sc_permission`=In_service_mngt_permission
				where username=in_username;
				
				SET OutResponseCode=0;
				SET OutStatus = 'success';
				SET OutDesc = 'Status  Changed Successfully.';
	
	  END IF;
		
end if;
	 
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `proc_user_authenticate` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_user_authenticate`(IN InUserName VARCHAR(100),
						  IN InEnPassword VARCHAR(200),		
						  OUT OutStatus VARCHAR(100),
						  OUT OutResponseCode INT,
						  OUT OutDesc VARCHAR(200),
						  out outid int
							)
BEGIN
	DECLARE  vPasswordLimit, vPasswordCount,RespCode,vMasterUserFlag,vUserId,vSMPP_Count,vBucketFlag  INT;
	DECLARE  vStatusDesc,vGraphId VARCHAR(100);
	DECLARE FinalStatus  VARCHAR(1);
        DECLARE vSMPP_Flag, vGraphFlag VARCHAR(1);
	DECLARE FinalDesc VARCHAR(200);
	declare v_status int;
	
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		GET DIAGNOSTICS CONDITION 1 @sqlstate = RETURNED_SQLSTATE,  @errno = MYSQL_ERRNO, @text = MESSAGE_TEXT;
		SET OutResponseCode = @errno;
		SET OutStatus='F';
		SET OutDesc=IFNULL(OutDesc,'Internal Error');
		 CALL `proc_error_log`('proc_user_authenticate',@errno,@text);
		
        END;
       
	
	SET RespCode=0;
	
	IF EXISTS(SELECT 1 FROM `tbl_users_master` 
			WHERE UPPER(`username`) = UPPER(InUserName)
			AND `status` <> 4) THEN
		
		UPDATE tbl_users_master 
		SET `status` = 1,
		blocked_datetime = NULL,
		`password_retry_count`=0
		WHERE  UPPER(`username`) = UPPER(InUserName)
		AND `status` = 5
		AND ADDDATE(blocked_datetime, INTERVAL 30 MINUTE) < NOW();
						
		IF EXISTS(SELECT 1 FROM `tbl_users_master` 
			WHERE UPPER(`username`) = UPPER(InUserName)
			 AND `password` = InEnPassword 
			 AND STATUS = 1) THEN			
							
				
			SELECT user_id INTO vUserId 
			FROM `tbl_users_master` 
			WHERE UPPER(`username`) = UPPER(InUserName);
					
			SELECT m.`user_id` as user_master_id ,m.`user_type`,m.`um_permission` as user_mngt_permission,
			m.`sc_permission` as service_mngt_permission ,IFNULL(m.`last_login_date`,NOW()) last_login_date
			FROM `tbl_users_master`  m
			WHERE  m.`user_id` = vUserId;
			
			UPDATE tbl_users_master SET `password_retry_count` = 0, `last_login_date`=NOW()
							WHERE  `user_id` = vUserId;
			
			SET OutResponseCode=0;
			SET OutStatus = 'success';
			SET OutDesc = 'Login successfully !!';
			set outid=vUserId ;
			
		ELSE						
			SELECT password_retry_count, password_retry_limit,status
			INTO vPasswordCount, vPasswordLimit,v_status
			FROM tbl_users_master
			WHERE UPPER(`username`) = UPPER(InUserName);
		
			IF vPasswordCount = (vPasswordLimit - 1) THEN
				
				UPDATE tbl_users_master SET `password_retry_count` =  `password_retry_count` + 1
				WHERE  UPPER(`username`) = UPPER(InUserName);
				
				SET OutResponseCode=12;
				SET OutStatus = 'Failure';
				SET OutDesc = 'Incorrect Password, this is your last attempt. Your account will be blocked.';
				
			ELSEIF  vPasswordCount <  vPasswordLimit THEN
			
				UPDATE tbl_users_master SET `password_retry_count` =  `password_retry_count` + 1
				WHERE  UPPER(`username`) = UPPER(InUserName);
				
				IF  v_status=5
						THEN	
				
						SET OutResponseCode=12;
						SET OutStatus = 'Failure';
						SET OutDesc = 'Your Account is blocked!!';	
				ELSEIF v_status=0
				THEN
						SET OutResponseCode=12;
						SET OutStatus = 'Failure';
						SET OutDesc = 'User Inactive !! ';	
							
				ELSE
						SET OutResponseCode=12;
						SET OutStatus = 'Failure';
						SET OutDesc = 'Incorrect Password ';	
					
					END IF;				
				
			ELSE
				UPDATE tbl_users_master 
				SET `status` = 5,
				blocked_datetime = NOW()
				WHERE  UPPER(`username`) = UPPER(InUserName);
				
				SET OutResponseCode=12;
				SET OutStatus = 'Failure';
				SET OutDesc = 'Your account has been Blocked. Please contact customer care !!';
			END IF;
								
		END IF;
	
	ELSE				
		SET OutResponseCode=11;
		SET OutStatus = 'Failure';
		SET OutDesc = 'User not registered !!';
	END IF;
	
   
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `proc_view_edit_service_history` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_view_edit_service_history`(
				
								in in_login_id int
								)
BEGIN
select `edit_id`,`service_id`,`service_name`,`service_code`,`creator_id`,`parent_service_id`,
(SELECT tbtwo.username FROM tbl_users_master tbtwo WHERE tbtwo.user_id = tbone.`creator_id`) AS modified_by,
IFNULL(`current_version_major`,0) AS `current_version_major`,
IFNULL(`current_version_minor`,0) AS `current_version_minor`,
IFNULL(`new_version_major`,0) AS `new_version_major`,
IFNULL(`new_version_minor`,0) AS `new_version_minor`,
CONCAT(ifnull(current_version_major,0),'.',ifnull(current_version_minor,0)) AS `version_old`,
CONCAT(IFNULL(new_version_major,0),'.',IFNULL(new_version_minor,0)) AS `version_new`, 
`remarks`,`edit_flag` as status,
UNIX_TIMESTAMP(`created_on`)*1000 as created_on ,UNIX_TIMESTAMP(`last_modified`)*1000 as last_modified
from `tbl_edit_service_history` tbone
order by  last_modified desc;	
	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `proc_view_notification` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_view_notification`(
							in in_user_id int,
							in in_flag varchar(30),
							in in_status int,
							OUT OutStatus VARCHAR(100),
							OUT OutResponseCode INT,
							OUT OutDesc VARCHAR(2000),
							out outcount int
							)
proc:BEGIN
declare vcount int;
DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		GET DIAGNOSTICS CONDITION 1 @sqlstate = RETURNED_SQLSTATE,  @errno = MYSQL_ERRNO, @text = MESSAGE_TEXT;
		SET OutResponseCode = @errno;
		SET OutStatus='success';
		SET OutDesc=@text;
		 CALL `proc_error_log`('proc_view_notification',@errno,@text);
	END;
start transaction;
		
if not exists (select 1 from `tbl_notification` where `user_id`=in_user_id and status <> 3)
then
		SET OutResponseCode=0;
		SET OutStatus = 'S';
		SET OutDesc = 'No Notifications found.';
		leave proc;
end if;
if in_flag='ALL'
then
	
	if in_status=1 
	then
				
	SELECT COUNT(1) INTO vcount 
	FROM  tbl_notification 
	WHERE `user_id`=in_user_id AND STATUS=0;
	
	set outcount=vcount;
	
		UPDATE tbl_notification
		SET STATUS=1,
		read_date=NOW()
		WHERE `user_id`=in_user_id
		and status =0;
	
	
	else
	
		SELECT COUNT(1) INTO vcount 
		FROM  tbl_notification 
		WHERE `user_id`=in_user_id AND STATUS=0;
	
		
		SET outcount=vcount;
	end if;
	
	select notification_id,user_id,notification_msg,STATUS,read_date,insert_date
	from tbl_notification WHERE `user_id`=in_user_id and status in (1,0) order by notification_id DESC;	
		
		commit;
		SET OutResponseCode=0;
		SET OutStatus = 'success';
		SET OutDesc = 'success';
		set outcount=vcount;
else
	SELECT notification_id,user_id,notification_msg,STATUS,read_date,insert_date
	FROM tbl_notification WHERE `user_id`=in_user_id and status=0 order by notification_id DESC;	
		
		SET OutResponseCode=0;
		SET OutStatus = 'success';
		SET OutDesc = 'success';
		SET outcount=vcount;
		commit;
end if;
		
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `proc_view_service_revision_history` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_view_service_revision_history`(
				
								IN in_login_id INT
								)
BEGIN
	SELECT `revision_id`,`service_id`,
	`service_name` AS service_name,
	`service_code` AS service_code,
	( SELECT tbtwo.username FROM tbl_users_master tbtwo WHERE tbtwo.user_id = tbone.`modified_by`) AS modified_by,
	`new_version_major`,
	`new_version_minor`,
	concat(new_version_major,'.',new_version_minor) as `version`,
	`remarks`,
	UNIX_TIMESTAMP(`created_on`)*1000 as `created_on`
	 FROM `tbl_revision_history` tbone 
	 ORDER BY created_on DESC ;	
	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `service_deploy_view_logs` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `service_deploy_view_logs`(
							IN in_login_id INT,
							in in_deployment_type varchar(100),
							in from_date date,
							in to_date date
							)
BEGIN
	
		
	
	
if in_deployment_type='ALL'
THEN
		SELECT `id`,
		`service_id`,
		(SELECT `service_name` FROM `tbl_service_master` WHERE `service_id`=tb2.service_id) AS service_name,
		`deployment_type`,
		(SELECT username FROM tbl_users_master WHERE user_id=tb2.login_id) AS Username,
		`log_date`
		FROM `tbl_service_deploy_logs` tb2;
ELSE		
		SELECT `id`,
		`service_id`,
		(SELECT `service_name` FROM `tbl_service_master` WHERE `service_id`=tb2.service_id) AS service_name,
		`deployment_type`,
		(SELECT username FROM tbl_users_master WHERE user_id=tb2.login_id) AS Username,
		`log_date`
		FROM `tbl_service_deploy_logs` tb2 
		where `log_date` between from_date and to_date and `deployment_type`= in_deployment_type;	
END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-06-18 10:15:56
