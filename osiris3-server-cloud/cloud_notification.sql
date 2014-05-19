-- MySQL dump 10.10
--
-- Host: localhost    Database: cloud_notification
-- ------------------------------------------------------
-- Server version	5.0.27-community-nt

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
-- Current Database: `cloud_notification`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `cloud_notification` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `cloud_notification`;

--
-- Table structure for table `api_account`
--

DROP TABLE IF EXISTS `api_account`;
CREATE TABLE `api_account` (
  `name` varchar(50) NOT NULL,
  `description` varchar(255) default NULL,
  `dtcreated` datetime default NULL,
  `createdby` varchar(50) default NULL,
  `state` smallint(6) default '1' COMMENT '1-Active, 0-Deactivated',
  `dtsuspended` datetime default NULL,
  `suspendedby` varchar(50) default NULL,
  `suspendremarks` varchar(255) default NULL,
  PRIMARY KEY  (`name`),
  KEY `ix_dtcreated` (`dtcreated`),
  KEY `ix_createdby` (`createdby`),
  KEY `ix_dtsuspended` (`dtsuspended`),
  KEY `ix_suspendedby` (`suspendedby`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `api_account`
--

LOCK TABLES `api_account` WRITE;
/*!40000 ALTER TABLE `api_account` DISABLE KEYS */;
INSERT INTO `api_account` VALUES ('rameses','Rameses Test Account','2014-05-15 23:05:09','sa',1,NULL,NULL,NULL),('system','System','2014-05-15 22:09:17','sa',1,NULL,NULL,NULL),('test','Test Account','2014-05-15 23:29:02','sa',1,NULL,NULL,NULL);
/*!40000 ALTER TABLE `api_account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_account_channel`
--

DROP TABLE IF EXISTS `api_account_channel`;
CREATE TABLE `api_account_channel` (
  `objid` varchar(50) NOT NULL,
  `accountid` varchar(50) default NULL,
  `channel` varchar(50) default NULL,
  `group` varchar(50) default NULL,
  `state` smallint(6) default '1' COMMENT '1-Active, 0-Deactivated',
  PRIMARY KEY  (`objid`),
  UNIQUE KEY `uix_account_channel_group` (`accountid`,`channel`,`group`),
  KEY `ix_channel` (`channel`),
  KEY `ix_group` (`group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `api_account_channel`
--

LOCK TABLES `api_account_channel` WRITE;
/*!40000 ALTER TABLE `api_account_channel` DISABLE KEYS */;
INSERT INTO `api_account_channel` VALUES ('rameses-c1','rameses','etracs','etracs',1),('system-c1','system','etracs','etracs',1),('test-c1','test','etracs','etracs',1);
/*!40000 ALTER TABLE `api_account_channel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_account_key`
--

DROP TABLE IF EXISTS `api_account_key`;
CREATE TABLE `api_account_key` (
  `objid` varchar(50) NOT NULL,
  `accountid` varchar(50) default NULL,
  `apikey` varchar(150) default NULL,
  `dtissued` datetime default NULL,
  `dtexpiry` datetime default NULL,
  `features` varchar(255) default NULL,
  PRIMARY KEY  (`objid`),
  KEY `ix_accountid` (`accountid`),
  KEY `ix_apikey` (`apikey`),
  KEY `ix_dtissued` (`dtissued`),
  KEY `ix_dtexpiry` (`dtexpiry`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `api_account_key`
--

LOCK TABLES `api_account_key` WRITE;
/*!40000 ALTER TABLE `api_account_key` DISABLE KEYS */;
INSERT INTO `api_account_key` VALUES ('rameses-k1','rameses','0307f66a714ec8f64b3f752593ba18cf','2014-05-15 23:06:00','2015-05-15 23:06:04',NULL),('system-k1','system','57128f70ed791bfc78cdec46e54aa77d','2014-05-15 22:09:45','2015-05-15 22:09:48',NULL),('test-k1','test','f86c571984a7f2af91e9e5353fa97bbe','2014-05-15 23:30:11','2015-05-15 23:30:14',NULL);
/*!40000 ALTER TABLE `api_account_key` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;


--
-- Table structure for table `channel`
--

DROP TABLE IF EXISTS `channel`;
CREATE TABLE `channel` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(25) default NULL COMMENT 'ACTIVE,DISABLED',
  `description` varchar(255) default NULL,
  `type` varchar(25) default NULL,
  PRIMARY KEY  (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `channel`
--

LOCK TABLES `channel` WRITE;
/*!40000 ALTER TABLE `channel` DISABLE KEYS */;
INSERT INTO `channel` VALUES ('etracs','ACTIVE','ETRACS Channel','topic');
/*!40000 ALTER TABLE `channel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `channel_active`
--

DROP TABLE IF EXISTS `channel_active`;
CREATE TABLE `channel_active` (
  `objid` varchar(50) NOT NULL,
  PRIMARY KEY  (`objid`),
  CONSTRAINT `fk_channel_objid_objid` FOREIGN KEY (`objid`) REFERENCES `channel` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `channel_active`
--

LOCK TABLES `channel_active` WRITE;
/*!40000 ALTER TABLE `channel_active` DISABLE KEYS */;
INSERT INTO `channel_active` VALUES ('etracs');
/*!40000 ALTER TABLE `channel_active` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cloud_notification`
--

DROP TABLE IF EXISTS `cloud_notification`;
CREATE TABLE `cloud_notification` (
  `objid` varchar(50) character set latin1 NOT NULL,
  `dtfiled` datetime default NULL,
  `sender` varchar(160) default NULL,
  `senderid` varchar(50) character set latin1 default NULL,
  `groupid` varchar(32) character set latin1 default NULL,
  `message` varchar(255) character set latin1 default NULL,
  `filetype` varchar(50) character set latin1 default NULL,
  `channel` varchar(50) default NULL,
  `channelgroup` varchar(50) default NULL,
  `origin` varchar(50) default NULL,
  `data` longtext,
  `attachmentcount` smallint(6) default '0',
  PRIMARY KEY  (`objid`),
  KEY `ix_dtfiled` (`dtfiled`),
  KEY `ix_groupid` (`groupid`),
  KEY `ix_senderid` (`senderid`),
  KEY `ix_objid` (`objid`),
  KEY `ix_origin` (`origin`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cloud_notification`
--

LOCK TABLES `cloud_notification` WRITE;
/*!40000 ALTER TABLE `cloud_notification` DISABLE KEYS */;
/*!40000 ALTER TABLE `cloud_notification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cloud_notification_attachment`
--

DROP TABLE IF EXISTS `cloud_notification_attachment`;
CREATE TABLE `cloud_notification_attachment` (
  `objid` varchar(50) NOT NULL,
  `parentid` varchar(50) NOT NULL,
  `dtfiled` datetime default NULL,
  `indexno` smallint(6) default NULL,
  `name` varchar(50) default NULL,
  `type` varchar(50) default NULL,
  `description` varchar(255) default NULL,
  `fileid` varchar(50) default NULL,
  PRIMARY KEY  (`objid`),
  KEY `ix_parentid` (`parentid`),
  KEY `ix_dtfiled` (`dtfiled`),
  KEY `ix_name` (`name`),
  KEY `ix_fileid` (`fileid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cloud_notification_attachment`
--

LOCK TABLES `cloud_notification_attachment` WRITE;
/*!40000 ALTER TABLE `cloud_notification_attachment` DISABLE KEYS */;
/*!40000 ALTER TABLE `cloud_notification_attachment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cloud_notification_delivered`
--

DROP TABLE IF EXISTS `cloud_notification_delivered`;
CREATE TABLE `cloud_notification_delivered` (
  `objid` varchar(50) character set latin1 NOT NULL,
  `dtfiled` datetime default NULL,
  `traceid` varchar(50) default NULL,
  `tracetime` datetime default NULL,
  PRIMARY KEY  (`objid`),
  KEY `ix_dtfiled` (`dtfiled`),
  KEY `ix_traceid` (`traceid`),
  KEY `ix_tracetime` (`tracetime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cloud_notification_delivered`
--

LOCK TABLES `cloud_notification_delivered` WRITE;
/*!40000 ALTER TABLE `cloud_notification_delivered` DISABLE KEYS */;
/*!40000 ALTER TABLE `cloud_notification_delivered` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cloud_notification_failed`
--

DROP TABLE IF EXISTS `cloud_notification_failed`;
CREATE TABLE `cloud_notification_failed` (
  `objid` varchar(50) character set latin1 NOT NULL,
  `dtfiled` datetime default NULL,
  `refid` varchar(50) default NULL,
  `reftype` varchar(25) default NULL,
  `errormessage` text,
  PRIMARY KEY  (`objid`),
  KEY `ix_dtfiled` (`dtfiled`),
  KEY `ix_refid` (`refid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cloud_notification_failed`
--

LOCK TABLES `cloud_notification_failed` WRITE;
/*!40000 ALTER TABLE `cloud_notification_failed` DISABLE KEYS */;
/*!40000 ALTER TABLE `cloud_notification_failed` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cloud_notification_pending`
--

DROP TABLE IF EXISTS `cloud_notification_pending`;
CREATE TABLE `cloud_notification_pending` (
  `objid` varchar(50) NOT NULL,
  `dtfiled` datetime default NULL,
  `dtexpiry` datetime default NULL,
  `dtretry` datetime default NULL,
  `type` varchar(25) default NULL COMMENT 'HEADER,ATTACHMENT',
  PRIMARY KEY  (`objid`),
  KEY `ix_dtexpiry` (`dtexpiry`),
  KEY `ix_dtretry` (`dtretry`),
  KEY `ix_dtfiled` (`dtfiled`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cloud_notification_pending`
--

LOCK TABLES `cloud_notification_pending` WRITE;
/*!40000 ALTER TABLE `cloud_notification_pending` DISABLE KEYS */;
/*!40000 ALTER TABLE `cloud_notification_pending` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cloud_notification_received`
--

DROP TABLE IF EXISTS `cloud_notification_received`;
CREATE TABLE `cloud_notification_received` (
  `objid` varchar(50) character set latin1 NOT NULL,
  `dtfiled` datetime default NULL,
  `traceid` varchar(50) default NULL,
  `tracetime` datetime default NULL,
  PRIMARY KEY  (`objid`),
  KEY `ix_dtfiled` (`dtfiled`),
  KEY `ix_traceid` (`traceid`),
  KEY `ix_tracetime` (`tracetime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cloud_notification_received`
--

LOCK TABLES `cloud_notification_received` WRITE;
/*!40000 ALTER TABLE `cloud_notification_received` DISABLE KEYS */;
/*!40000 ALTER TABLE `cloud_notification_received` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-05-19  2:33:19
