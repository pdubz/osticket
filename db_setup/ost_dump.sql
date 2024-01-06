-- MySQL dump 10.13  Distrib 8.0.35, for Linux (x86_64)
--
-- Database: osTicket
-- ------------------------------------------------------
-- Server version	5.5.64-MariaDB-1~trusty

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
-- Table structure for table `ost_api_key`
--

DROP TABLE IF EXISTS `ost_api_key`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ost_api_key` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `isactive` tinyint(1) NOT NULL DEFAULT '1',
  `ipaddr` varchar(16) NOT NULL,
  `apikey` varchar(255) NOT NULL,
  `updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ipaddr` (`ipaddr`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ost_config`
--

DROP TABLE IF EXISTS `ost_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ost_config` (
  `id` tinyint(1) unsigned NOT NULL AUTO_INCREMENT,
  `isonline` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `timezone_offset` float(3,1) NOT NULL DEFAULT '0.0',
  `enable_daylight_saving` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `staff_ip_binding` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `staff_max_logins` tinyint(3) unsigned NOT NULL DEFAULT '4',
  `staff_login_timeout` int(10) unsigned NOT NULL DEFAULT '2',
  `staff_session_timeout` int(10) unsigned NOT NULL DEFAULT '30',
  `client_max_logins` tinyint(3) unsigned NOT NULL DEFAULT '4',
  `client_login_timeout` int(10) unsigned NOT NULL DEFAULT '2',
  `client_session_timeout` int(10) unsigned NOT NULL DEFAULT '30',
  `max_page_size` tinyint(3) unsigned NOT NULL DEFAULT '25',
  `max_open_tickets` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `max_file_size` int(11) unsigned NOT NULL DEFAULT '1048576',
  `autolock_minutes` tinyint(3) unsigned NOT NULL DEFAULT '3',
  `overdue_grace_period` int(10) unsigned NOT NULL DEFAULT '0',
  `alert_email_id` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `default_email_id` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `default_dept_id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `default_priority_id` tinyint(2) unsigned NOT NULL DEFAULT '2',
  `default_template_id` tinyint(4) unsigned NOT NULL DEFAULT '1',
  `default_smtp_id` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `spoof_default_smtp` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `clickable_urls` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `allow_priority_change` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `use_email_priority` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `enable_captcha` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `enable_auto_cron` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `enable_mail_fetch` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `enable_email_piping` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `send_sql_errors` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `send_mailparse_errors` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `send_login_errors` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `save_email_headers` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `strip_quoted_reply` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `log_ticket_activity` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `ticket_autoresponder` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `message_autoresponder` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ticket_notice_active` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ticket_alert_active` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ticket_alert_admin` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `ticket_alert_dept_manager` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `ticket_alert_dept_members` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `message_alert_active` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `message_alert_laststaff` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `message_alert_assigned` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `message_alert_dept_manager` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `note_alert_active` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `note_alert_laststaff` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `note_alert_assigned` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `note_alert_dept_manager` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `overdue_alert_active` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `overdue_alert_assigned` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `overdue_alert_dept_manager` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `overdue_alert_dept_members` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `auto_assign_reopened_tickets` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `show_assigned_tickets` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `show_answered_tickets` tinyint(1) NOT NULL DEFAULT '0',
  `hide_staff_name` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `overlimit_notice_active` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `email_attachments` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `allow_attachments` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `allow_email_attachments` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `allow_online_attachments` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `allow_online_attachments_onlogin` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `random_ticket_ids` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `log_level` tinyint(1) unsigned NOT NULL DEFAULT '2',
  `log_graceperiod` int(10) unsigned NOT NULL DEFAULT '12',
  `upload_dir` varchar(255) NOT NULL DEFAULT '',
  `allowed_filetypes` varchar(255) NOT NULL DEFAULT '.doc, .pdf',
  `time_format` varchar(32) NOT NULL DEFAULT ' h:i A',
  `date_format` varchar(32) NOT NULL DEFAULT 'm/d/Y',
  `datetime_format` varchar(60) NOT NULL DEFAULT 'm/d/Y g:i a',
  `daydatetime_format` varchar(60) NOT NULL DEFAULT 'D, M j Y g:ia',
  `reply_separator` varchar(60) NOT NULL DEFAULT '-- do not edit --',
  `admin_email` varchar(125) NOT NULL DEFAULT '',
  `helpdesk_title` varchar(255) NOT NULL DEFAULT 'osTicket Support Ticket System',
  `helpdesk_url` varchar(255) NOT NULL DEFAULT '',
  `api_passphrase` varchar(125) NOT NULL DEFAULT '',
  `ostversion` varchar(16) NOT NULL DEFAULT '',
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `isoffline` (`isonline`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ost_department`
--

DROP TABLE IF EXISTS `ost_department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ost_department` (
  `dept_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `tpl_id` int(10) unsigned NOT NULL DEFAULT '0',
  `email_id` int(10) unsigned NOT NULL DEFAULT '0',
  `autoresp_email_id` int(10) unsigned NOT NULL DEFAULT '0',
  `manager_id` int(10) unsigned NOT NULL DEFAULT '0',
  `dept_name` varchar(32) NOT NULL DEFAULT '',
  `dept_signature` tinytext NOT NULL,
  `ispublic` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `ticket_auto_response` tinyint(1) NOT NULL DEFAULT '1',
  `message_auto_response` tinyint(1) NOT NULL DEFAULT '0',
  `can_append_signature` tinyint(1) NOT NULL DEFAULT '1',
  `updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`dept_id`),
  UNIQUE KEY `dept_name` (`dept_name`),
  KEY `manager_id` (`manager_id`),
  KEY `autoresp_email_id` (`autoresp_email_id`),
  KEY `tpl_id` (`tpl_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ost_email`
--

DROP TABLE IF EXISTS `ost_email`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ost_email` (
  `email_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `noautoresp` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `priority_id` tinyint(3) unsigned NOT NULL DEFAULT '2',
  `dept_id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `email` varchar(125) NOT NULL DEFAULT '',
  `name` varchar(32) NOT NULL DEFAULT '',
  `userid` varchar(125) NOT NULL,
  `userpass` varchar(125) NOT NULL,
  `mail_active` tinyint(1) NOT NULL DEFAULT '0',
  `mail_host` varchar(125) NOT NULL,
  `mail_protocol` enum('POP','IMAP') NOT NULL DEFAULT 'POP',
  `mail_encryption` enum('NONE','SSL') NOT NULL,
  `mail_port` int(6) DEFAULT NULL,
  `mail_fetchfreq` tinyint(3) NOT NULL DEFAULT '5',
  `mail_fetchmax` tinyint(4) NOT NULL DEFAULT '30',
  `mail_delete` tinyint(1) NOT NULL DEFAULT '0',
  `mail_errors` tinyint(3) NOT NULL DEFAULT '0',
  `mail_lasterror` datetime DEFAULT NULL,
  `mail_lastfetch` datetime DEFAULT NULL,
  `smtp_active` tinyint(1) DEFAULT '0',
  `smtp_host` varchar(125) NOT NULL,
  `smtp_port` int(6) DEFAULT NULL,
  `smtp_secure` tinyint(1) NOT NULL DEFAULT '1',
  `smtp_auth` tinyint(1) NOT NULL DEFAULT '1',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`email_id`),
  UNIQUE KEY `email` (`email`),
  KEY `priority_id` (`priority_id`),
  KEY `dept_id` (`dept_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ost_email_banlist`
--

DROP TABLE IF EXISTS `ost_email_banlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ost_email_banlist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL DEFAULT '',
  `submitter` varchar(126) NOT NULL DEFAULT '',
  `added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ost_email_template`
--

DROP TABLE IF EXISTS `ost_email_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ost_email_template` (
  `tpl_id` int(11) NOT NULL AUTO_INCREMENT,
  `cfg_id` int(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(32) NOT NULL DEFAULT '',
  `notes` text,
  `ticket_autoresp_subj` varchar(255) NOT NULL DEFAULT '',
  `ticket_autoresp_body` text NOT NULL,
  `ticket_notice_subj` varchar(255) NOT NULL,
  `ticket_notice_body` text NOT NULL,
  `ticket_alert_subj` varchar(255) NOT NULL DEFAULT '',
  `ticket_alert_body` text NOT NULL,
  `message_autoresp_subj` varchar(255) NOT NULL DEFAULT '',
  `message_autoresp_body` text NOT NULL,
  `message_alert_subj` varchar(255) NOT NULL DEFAULT '',
  `message_alert_body` text NOT NULL,
  `note_alert_subj` varchar(255) NOT NULL,
  `note_alert_body` text NOT NULL,
  `assigned_alert_subj` varchar(255) NOT NULL DEFAULT '',
  `assigned_alert_body` text NOT NULL,
  `ticket_overdue_subj` varchar(255) NOT NULL DEFAULT '',
  `ticket_overdue_body` text NOT NULL,
  `ticket_overlimit_subj` varchar(255) NOT NULL DEFAULT '',
  `ticket_overlimit_body` text NOT NULL,
  `ticket_reply_subj` varchar(255) NOT NULL DEFAULT '',
  `ticket_reply_body` text NOT NULL,
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`tpl_id`),
  KEY `cfg_id` (`cfg_id`),
  FULLTEXT KEY `message_subj` (`ticket_reply_subj`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ost_groups`
--

DROP TABLE IF EXISTS `ost_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ost_groups` (
  `group_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `group_enabled` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `group_name` varchar(50) NOT NULL DEFAULT '',
  `dept_access` varchar(255) NOT NULL DEFAULT '',
  `can_create_tickets` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `can_edit_tickets` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `can_delete_tickets` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `can_close_tickets` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `can_transfer_tickets` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `can_ban_emails` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `can_manage_kb` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`group_id`),
  KEY `group_active` (`group_enabled`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ost_help_topic`
--

DROP TABLE IF EXISTS `ost_help_topic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ost_help_topic` (
  `topic_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `isactive` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `noautoresp` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `priority_id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `dept_id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `topic` varchar(32) NOT NULL DEFAULT '',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`topic_id`),
  UNIQUE KEY `topic` (`topic`),
  KEY `priority_id` (`priority_id`),
  KEY `dept_id` (`dept_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ost_kb_premade`
--

DROP TABLE IF EXISTS `ost_kb_premade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ost_kb_premade` (
  `premade_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `dept_id` int(10) unsigned NOT NULL DEFAULT '0',
  `isenabled` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `title` varchar(125) NOT NULL DEFAULT '',
  `answer` text NOT NULL,
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`premade_id`),
  UNIQUE KEY `title_2` (`title`),
  KEY `dept_id` (`dept_id`),
  KEY `active` (`isenabled`),
  FULLTEXT KEY `title` (`title`,`answer`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ost_staff`
--

DROP TABLE IF EXISTS `ost_staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ost_staff` (
  `staff_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `group_id` int(10) unsigned NOT NULL DEFAULT '0',
  `dept_id` int(10) unsigned NOT NULL DEFAULT '0',
  `username` varchar(32) NOT NULL DEFAULT '',
  `firstname` varchar(32) DEFAULT NULL,
  `lastname` varchar(32) DEFAULT NULL,
  `passwd` varchar(128) DEFAULT NULL,
  `email` varchar(128) DEFAULT NULL,
  `phone` varchar(24) NOT NULL DEFAULT '',
  `phone_ext` varchar(6) DEFAULT NULL,
  `mobile` varchar(24) NOT NULL DEFAULT '',
  `signature` tinytext NOT NULL,
  `isactive` tinyint(1) NOT NULL DEFAULT '1',
  `isadmin` tinyint(1) NOT NULL DEFAULT '0',
  `isvisible` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `onvacation` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `daylight_saving` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `append_signature` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `change_passwd` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `timezone_offset` float(3,1) NOT NULL DEFAULT '0.0',
  `max_page_size` int(11) unsigned NOT NULL DEFAULT '0',
  `auto_refresh_rate` int(10) unsigned NOT NULL DEFAULT '0',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `lastlogin` datetime DEFAULT NULL,
  `updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`staff_id`),
  UNIQUE KEY `username` (`username`),
  KEY `dept_id` (`dept_id`),
  KEY `issuperuser` (`isadmin`),
  KEY `group_id` (`group_id`,`staff_id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ost_staff_api`
--

DROP TABLE IF EXISTS `ost_staff_api`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ost_staff_api` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `staff_id` int(11) NOT NULL,
  `api_key` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `status` int(1) NOT NULL DEFAULT '1',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `staff_id` (`staff_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ost_syslog`
--

DROP TABLE IF EXISTS `ost_syslog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ost_syslog` (
  `log_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `log_type` enum('Debug','Warning','Error') NOT NULL,
  `title` varchar(255) NOT NULL,
  `log` text NOT NULL,
  `logger` varchar(64) NOT NULL,
  `ip_address` varchar(16) NOT NULL,
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`log_id`),
  KEY `log_type` (`log_type`)
) ENGINE=MyISAM AUTO_INCREMENT=87 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ost_ticket`
--

DROP TABLE IF EXISTS `ost_ticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ost_ticket` (
  `ticket_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ticketID` int(11) unsigned NOT NULL DEFAULT '0',
  `dept_id` int(10) unsigned NOT NULL DEFAULT '1',
  `priority_id` int(10) unsigned NOT NULL DEFAULT '2',
  `topic_id` int(10) unsigned NOT NULL DEFAULT '0',
  `staff_id` int(10) unsigned NOT NULL DEFAULT '0',
  `email` varchar(120) NOT NULL DEFAULT '',
  `name` varchar(32) NOT NULL DEFAULT '',
  `subject` varchar(64) NOT NULL DEFAULT '[no subject]',
  `helptopic` varchar(255) DEFAULT NULL,
  `phone` varchar(16) DEFAULT NULL,
  `phone_ext` varchar(8) DEFAULT NULL,
  `ip_address` varchar(16) NOT NULL DEFAULT '',
  `status` enum('open','closed') NOT NULL DEFAULT 'open',
  `source` enum('Web','Email','Phone','Other') NOT NULL DEFAULT 'Other',
  `isoverdue` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `isanswered` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `duedate` datetime DEFAULT NULL,
  `reopened` datetime DEFAULT NULL,
  `closed` datetime DEFAULT NULL,
  `lastmessage` datetime DEFAULT NULL,
  `lastresponse` datetime DEFAULT NULL,
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `siteName` varchar(50) DEFAULT NULL,
  `siteAddress` varchar(100) DEFAULT NULL,
  `csz` varchar(100) DEFAULT NULL,
  `contactName` varchar(75) DEFAULT NULL,
  `contactPhone` varchar(75) DEFAULT NULL,
  `contactEmail` varchar(100) DEFAULT NULL,
  `sow` varchar(1000) DEFAULT NULL,
  `travel` varchar(100) DEFAULT NULL,
  `travelrate` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ticket_id`),
  UNIQUE KEY `email_extid` (`ticketID`,`email`),
  KEY `dept_id` (`dept_id`),
  KEY `staff_id` (`staff_id`),
  KEY `status` (`status`),
  KEY `priority_id` (`priority_id`),
  KEY `created` (`created`),
  KEY `closed` (`closed`),
  KEY `duedate` (`duedate`),
  KEY `topic_id` (`topic_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4396 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ost_ticket_attachment`
--

DROP TABLE IF EXISTS `ost_ticket_attachment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ost_ticket_attachment` (
  `attach_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ticket_id` int(11) unsigned NOT NULL DEFAULT '0',
  `ref_id` int(11) unsigned NOT NULL DEFAULT '0',
  `ref_type` enum('M','R') NOT NULL DEFAULT 'M',
  `file_size` varchar(32) NOT NULL DEFAULT '',
  `file_name` varchar(128) NOT NULL DEFAULT '',
  `file_key` varchar(128) NOT NULL DEFAULT '',
  `deleted` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated` datetime DEFAULT NULL,
  PRIMARY KEY (`attach_id`),
  KEY `ticket_id` (`ticket_id`),
  KEY `ref_type` (`ref_type`),
  KEY `ref_id` (`ref_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4842 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ost_ticket_lock`
--

DROP TABLE IF EXISTS `ost_ticket_lock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ost_ticket_lock` (
  `lock_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ticket_id` int(11) unsigned NOT NULL DEFAULT '0',
  `staff_id` int(10) unsigned NOT NULL DEFAULT '0',
  `expire` datetime DEFAULT NULL,
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`lock_id`),
  UNIQUE KEY `ticket_id` (`ticket_id`),
  KEY `staff_id` (`staff_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ost_ticket_message`
--

DROP TABLE IF EXISTS `ost_ticket_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ost_ticket_message` (
  `msg_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ticket_id` int(11) unsigned NOT NULL DEFAULT '0',
  `messageId` varchar(255) DEFAULT NULL,
  `message` text NOT NULL,
  `headers` text,
  `source` varchar(16) DEFAULT NULL,
  `ip_address` varchar(16) DEFAULT NULL,
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated` datetime DEFAULT NULL,
  PRIMARY KEY (`msg_id`),
  KEY `ticket_id` (`ticket_id`),
  KEY `msgId` (`messageId`),
  FULLTEXT KEY `message` (`message`)
) ENGINE=MyISAM AUTO_INCREMENT=3399 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ost_ticket_note`
--

DROP TABLE IF EXISTS `ost_ticket_note`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ost_ticket_note` (
  `note_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ticket_id` int(11) unsigned NOT NULL DEFAULT '0',
  `staff_id` int(10) unsigned NOT NULL DEFAULT '0',
  `source` varchar(32) NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL DEFAULT 'Generic Intermal Notes',
  `note` text NOT NULL,
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`note_id`),
  KEY `ticket_id` (`ticket_id`),
  KEY `staff_id` (`staff_id`),
  FULLTEXT KEY `note` (`note`)
) ENGINE=MyISAM AUTO_INCREMENT=15133 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ost_ticket_priority`
--

DROP TABLE IF EXISTS `ost_ticket_priority`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ost_ticket_priority` (
  `priority_id` tinyint(4) NOT NULL AUTO_INCREMENT,
  `priority` varchar(60) NOT NULL DEFAULT '',
  `priority_desc` varchar(30) NOT NULL DEFAULT '',
  `priority_color` varchar(7) NOT NULL DEFAULT '',
  `priority_urgency` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ispublic` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`priority_id`),
  UNIQUE KEY `priority` (`priority`),
  KEY `priority_urgency` (`priority_urgency`),
  KEY `ispublic` (`ispublic`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ost_ticket_response`
--

DROP TABLE IF EXISTS `ost_ticket_response`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ost_ticket_response` (
  `response_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `msg_id` int(11) unsigned NOT NULL DEFAULT '0',
  `ticket_id` int(11) unsigned NOT NULL DEFAULT '0',
  `staff_id` int(11) unsigned NOT NULL DEFAULT '0',
  `staff_name` varchar(32) NOT NULL DEFAULT '',
  `response` text NOT NULL,
  `ip_address` varchar(16) NOT NULL DEFAULT '',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`response_id`),
  KEY `ticket_id` (`ticket_id`),
  KEY `msg_id` (`msg_id`),
  KEY `staff_id` (`staff_id`),
  FULLTEXT KEY `response` (`response`)
) ENGINE=MyISAM AUTO_INCREMENT=12892 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ost_timezone`
--

DROP TABLE IF EXISTS `ost_timezone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ost_timezone` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `offset` float(3,1) NOT NULL DEFAULT '0.0',
  `timezone` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-01-05 23:41:25
