-- MySQL dump 10.10
--
-- Host: localhost    Database: notification_lgu
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
-- Current Database: `notification_lgu`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `notification_lgu` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `notification_lgu`;

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
-- Table structure for table `sms_inbox`
--

DROP TABLE IF EXISTS `sms_inbox`;
CREATE TABLE `sms_inbox` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(25) default NULL,
  `dtfiled` datetime default NULL,
  `channel` varchar(25) default NULL,
  `keyword` varchar(50) default NULL,
  `phoneno` varchar(15) default NULL,
  `message` varchar(160) default NULL,
  PRIMARY KEY  (`objid`),
  KEY `ix_dtfiled` (`dtfiled`),
  KEY `ix_phoneno` (`phoneno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `sms_inbox_pending`
--

DROP TABLE IF EXISTS `sms_inbox_pending`;
CREATE TABLE `sms_inbox_pending` (
  `objid` varchar(50) NOT NULL,
  `dtexpiry` datetime default NULL,
  `dtretry` datetime default NULL,
  `retrycount` smallint(6) default '0',
  PRIMARY KEY  (`objid`),
  KEY `ix_dtexpiry` (`dtexpiry`),
  KEY `ix_dtretry` (`dtretry`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `sms_outbox`
--

DROP TABLE IF EXISTS `sms_outbox`;
CREATE TABLE `sms_outbox` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(25) default NULL,
  `dtfiled` datetime default NULL,
  `refid` varchar(50) default NULL,
  `phoneno` varchar(15) default NULL,
  `message` text,
  `creditcount` smallint(6) default '0',
  `remarks` varchar(160) default NULL,
  `dtsend` datetime default NULL,
  `traceid` varchar(50) default NULL,
  PRIMARY KEY  (`objid`),
  KEY `ix_dtfiled` (`dtfiled`),
  KEY `ix_phoneno` (`phoneno`),
  KEY `ix_dtsend` (`dtsend`),
  KEY `ix_refid` (`refid`),
  KEY `ix_traceid` (`traceid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `sys_notification_group`
--

DROP TABLE IF EXISTS `sys_notification_group`;
CREATE TABLE `sys_notification_group` (
  `notificationid` varchar(50) NOT NULL,
  `objid` varchar(50) character set latin1 default NULL,
  `dtfiled` datetime default NULL,
  `sender` varchar(160) default NULL,
  `senderid` varchar(50) character set latin1 default NULL,
  `groupid` varchar(32) character set latin1 default NULL,
  `message` varchar(255) character set latin1 default NULL,
  `filetype` varchar(50) character set latin1 default NULL,
  `data` longtext,
  PRIMARY KEY  (`notificationid`),
  KEY `ix_dtfiled` (`dtfiled`),
  KEY `ix_groupid` (`groupid`),
  KEY `ix_senderid` (`senderid`),
  KEY `ix_objid` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `sys_notification_user`
--

DROP TABLE IF EXISTS `sys_notification_user`;
CREATE TABLE `sys_notification_user` (
  `notificationid` varchar(50) NOT NULL,
  `objid` varchar(50) character set latin1 default NULL,
  `dtfiled` datetime default NULL,
  `sender` varchar(160) default NULL,
  `senderid` varchar(50) character set latin1 default NULL,
  `recipientid` varchar(50) character set latin1 default NULL,
  `message` varchar(255) character set latin1 default NULL,
  `filetype` varchar(50) character set latin1 default NULL,
  `data` longtext,
  PRIMARY KEY  (`notificationid`),
  KEY `ix_dtfiled` (`dtfiled`),
  KEY `ix_recipientid` (`recipientid`),
  KEY `ix_senderid` (`senderid`),
  KEY `ix_objid` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-05-16  5:58:52
