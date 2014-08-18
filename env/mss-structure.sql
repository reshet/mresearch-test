-- phpMyAdmin SQL Dump
-- version 3.5.8.1deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Aug 18, 2014 at 11:53 AM
-- Server version: 5.5.34-0ubuntu0.13.04.1-log
-- PHP Version: 5.4.9-4ubuntu2.4

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `mss`
--

-- --------------------------------------------------------

--
-- Table structure for table `corp`
--

CREATE TABLE IF NOT EXISTS `corp` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) CHARACTER SET cp1251 NOT NULL,
  `Region` varchar(50) CHARACTER SET cp1251 NOT NULL,
  `City` varchar(50) CHARACTER SET cp1251 NOT NULL,
  `District` varchar(50) CHARACTER SET cp1251 NOT NULL,
  `Street` varchar(50) CHARACTER SET cp1251 NOT NULL,
  `Number` varchar(20) CHARACTER SET cp1251 NOT NULL,
  `Tel` int(20) NOT NULL,
  `Fax` int(20) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='Заклади' AUTO_INCREMENT=3 ;

-- --------------------------------------------------------

--
-- Table structure for table `groups`
--

CREATE TABLE IF NOT EXISTS `groups` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) NOT NULL,
  `Desc` varchar(200) CHARACTER SET utf8 NOT NULL,
  `IDcorp` int(11) NOT NULL,
  `IDCreator` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM  DEFAULT CHARSET=cp1251 COMMENT='Групи з тестувань' AUTO_INCREMENT=100574 ;

-- --------------------------------------------------------

--
-- Table structure for table `gr_rels`
--

CREATE TABLE IF NOT EXISTS `gr_rels` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `IDSuperGroup` int(11) NOT NULL,
  `IDGroup` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=146 ;

-- --------------------------------------------------------

--
-- Table structure for table `membership`
--

CREATE TABLE IF NOT EXISTS `membership` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `IDgroup` int(11) NOT NULL,
  `IDuser` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=605 ;

-- --------------------------------------------------------

--
-- Table structure for table `rds_cards`
--

CREATE TABLE IF NOT EXISTS `rds_cards` (
  `ID_Project` int(11) NOT NULL,
  `ID_Root` varchar(30) NOT NULL,
  `ID` int(11) NOT NULL,
  `Status` varchar(30) NOT NULL,
  `CreationDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ShareDate` timestamp NULL DEFAULT NULL,
  `AcceptDate` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`ID_Project`,`ID_Root`,`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `rds_projects`
--

CREATE TABLE IF NOT EXISTS `rds_projects` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) NOT NULL,
  `ID_Project_Anket` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- Table structure for table `s-ethalons`
--

CREATE TABLE IF NOT EXISTS `s-ethalons` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Service_pattern_code` blob NOT NULL,
  `Description` varchar(200) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='Runnable services created' AUTO_INCREMENT=4 ;

-- --------------------------------------------------------

--
-- Table structure for table `scope`
--

CREATE TABLE IF NOT EXISTS `scope` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `IDtask` int(11) NOT NULL,
  `IDgroup` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3134 ;

-- --------------------------------------------------------

--
-- Table structure for table `sms-user-bridge`
--

CREATE TABLE IF NOT EXISTS `sms-user-bridge` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `IDabonent` int(11) NOT NULL,
  `IDuser` int(11) NOT NULL,
  `user_pswd` varchar(50) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=57 ;

-- --------------------------------------------------------

--
-- Table structure for table `statistics`
--

CREATE TABLE IF NOT EXISTS `statistics` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `IDservice` int(11) NOT NULL,
  `IDuser` int(11) NOT NULL,
  `geathered` tinyint(1) NOT NULL,
  `Stat_obj` blob NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='Черга оновлень до об''єктів статистики користувачів' AUTO_INCREMENT=46035 ;

-- --------------------------------------------------------

--
-- Table structure for table `subscription`
--

CREATE TABLE IF NOT EXISTS `subscription` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `IDtask` int(11) NOT NULL,
  `IDuser` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5088 ;

-- --------------------------------------------------------

--
-- Table structure for table `tasks`
--

CREATE TABLE IF NOT EXISTS `tasks` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `IDowner` int(11) NOT NULL,
  `IDpattern` int(11) NOT NULL,
  `IDgr` int(11) NOT NULL,
  `Task_obj` longblob,
  `Subscribed` int(11) NOT NULL,
  `Accepted` int(11) NOT NULL,
  `Visability` tinyint(4) NOT NULL,
  `Aviability` int(11) NOT NULL,
  `Description` varchar(100) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Відкриті для проходження тести(сесії)' AUTO_INCREMENT=584 ;

-- --------------------------------------------------------

--
-- Table structure for table `triggers`
--

CREATE TABLE IF NOT EXISTS `triggers` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `object` blob NOT NULL,
  `auto` tinyint(1) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Personal_info_obj` blob NOT NULL,
  `Stat_own_obj` blob NOT NULL,
  `IDcorp` int(11) NOT NULL,
  `pswd` varchar(50) NOT NULL,
  `logged` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='MSS users' AUTO_INCREMENT=1000100168 ;

-- --------------------------------------------------------

--
-- Table structure for table `_files`
--

CREATE TABLE IF NOT EXISTS `_files` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(300) NOT NULL,
  `Desc` varchar(2500) NOT NULL,
  `Data` blob NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=542 ;

-- --------------------------------------------------------

--
-- Table structure for table `_logins`
--

CREATE TABLE IF NOT EXISTS `_logins` (
  `Login` varchar(50) NOT NULL,
  `IDuser` int(11) NOT NULL,
  PRIMARY KEY (`Login`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `_project`
--

CREATE TABLE IF NOT EXISTS `_project` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(250) NOT NULL,
  `Desc` varchar(2000) NOT NULL,
  `Status` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `_project_tasks`
--

CREATE TABLE IF NOT EXISTS `_project_tasks` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ID_project` int(11) NOT NULL,
  `ID_task` int(11) NOT NULL,
  `AgregationDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ActualityDate` timestamp NULL DEFAULT NULL,
  `Priority` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=325 ;

-- --------------------------------------------------------

--
-- Table structure for table `_research_data`
--

CREATE TABLE IF NOT EXISTS `_research_data` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ID_user` int(11) NOT NULL,
  `ID_project` int(11) NOT NULL,
  `ID_task` int(11) NOT NULL,
  `ID_var` int(11) NOT NULL,
  `Interview_ID` int(11) NOT NULL,
  `Value_Integer` int(11) DEFAULT NULL,
  `Value_Double` double DEFAULT NULL,
  `Value_String` varchar(500) DEFAULT NULL,
  `Value_Date` timestamp NULL DEFAULT NULL,
  `Value_Defined` int(11) DEFAULT NULL,
  `AchieveDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Version` int(11) NOT NULL,
  PRIMARY KEY (`ID`,`ID_user`,`ID_project`,`ID_task`,`ID_var`,`Interview_ID`),
  KEY `Interview_ID` (`Interview_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1597472 ;

-- --------------------------------------------------------

--
-- Table structure for table `_research_data_raw`
--

CREATE TABLE IF NOT EXISTS `_research_data_raw` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ID_user` int(11) NOT NULL,
  `ID_project` int(11) NOT NULL,
  `ID_task` int(11) NOT NULL,
  `Interview_ID` int(11) NOT NULL,
  `cortage` longtext NOT NULL,
  `hash` text NOT NULL,
  `AchieveDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Version` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `Interview_ID` (`Interview_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=17559 ;

-- --------------------------------------------------------

--
-- Table structure for table `_tags_file`
--

CREATE TABLE IF NOT EXISTS `_tags_file` (
  `ID_file` int(11) NOT NULL,
  `ID_tag` int(11) NOT NULL,
  PRIMARY KEY (`ID_file`,`ID_tag`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `_tags_task`
--

CREATE TABLE IF NOT EXISTS `_tags_task` (
  `ID_task` int(11) NOT NULL,
  `ID_tag` int(11) NOT NULL,
  PRIMARY KEY (`ID_task`,`ID_tag`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `_tags_var`
--

CREATE TABLE IF NOT EXISTS `_tags_var` (
  `ID_var` int(11) NOT NULL,
  `ID_tag` int(11) NOT NULL,
  PRIMARY KEY (`ID_var`,`ID_tag`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `_task`
--

CREATE TABLE IF NOT EXISTS `_task` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Algorythm` text NOT NULL,
  `CreationDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `Version` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=323 ;

-- --------------------------------------------------------

--
-- Table structure for table `_task_files`
--

CREATE TABLE IF NOT EXISTS `_task_files` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ID_task` int(11) NOT NULL,
  `ID_file` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `_task_vars`
--

CREATE TABLE IF NOT EXISTS `_task_vars` (
  `ID_task` int(11) NOT NULL,
  `ID_var` int(11) NOT NULL,
  PRIMARY KEY (`ID_task`,`ID_var`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `_vars`
--

CREATE TABLE IF NOT EXISTS `_vars` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) NOT NULL,
  `Desc` varchar(1000) NOT NULL,
  `Type` varchar(30) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=100856 ;

-- --------------------------------------------------------

--
-- Table structure for table `_var_value`
--

CREATE TABLE IF NOT EXISTS `_var_value` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Label` varchar(100) NOT NULL,
  `Value` varchar(1000) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=104480 ;

-- --------------------------------------------------------

--
-- Table structure for table `_var_values_set`
--

CREATE TABLE IF NOT EXISTS `_var_values_set` (
  `ID_var` int(11) NOT NULL,
  `ID_var_value` int(11) NOT NULL,
  PRIMARY KEY (`ID_var`,`ID_var_value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
