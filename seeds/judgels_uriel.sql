-- phpMyAdmin SQL Dump
-- version 4.7.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Aug 05, 2018 at 07:30 PM
-- Server version: 5.7.19
-- PHP Version: 5.6.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `judgels_uriel`
--

--
-- Dumping data for table `uriel_contest`
--

INSERT INTO `uriel_contest` (`jid`, `slug`, `name`, `style`, `description`, `beginTime`, `duration`, `createdAt`, `createdBy`, `createdIp`, `updatedAt`, `updatedBy`, `updatedIp`, `locked`) VALUES
('JIDCONTYsWkzwPy8wCF3maJfxqN', 'joc-1', 'Judgels Open Contest #1', 'ICPC', '<p>Welcome to the first Judgels open contest!</p>\r\n', '2018-08-01 12:00:00.000', 18000000000, '2018-08-05 17:30:35.297', 'JIDUSERGBsbuD2EJ9jYMlGclISJ', '127.0.0.1', '2018-08-05 18:24:26.259', 'JIDUSERGBsbuD2EJ9jYMlGclISJ', '127.0.0.1', b'0'),
('JIDCONT89YMatMq7GqaPQCyyUHU', 'joc-old', 'Judgels Old Contest', 'IOI', '<p>This is an old contest.</p>\r\n', '2018-01-01 00:00:00.000', 18000000, '2018-08-05 18:11:40.024', 'JIDUSERGBsbuD2EJ9jYMlGclISJ', '127.0.0.1', '2018-08-05 18:12:03.575', 'JIDUSERGBsbuD2EJ9jYMlGclISJ', '127.0.0.1', b'0');

--
-- Dumping data for table `uriel_contest_announcement`
--

INSERT INTO `uriel_contest_announcement` (`jid`, `contestJid`, `title`, `content`, `status`, `createdAt`, `createdBy`, `createdIp`, `updatedAt`, `updatedBy`, `updatedIp`) VALUES
('JIDCOANOtLvAkjKzbAw3vWaZI3t', 'JIDCONTYsWkzwPy8wCF3maJfxqN', 'Good luck', '<p>And have fun!</p>\r\n', 'PUBLISHED', '2018-08-05 17:39:58.816', 'JIDUSERGBsbuD2EJ9jYMlGclISJ', '127.0.0.1', '2018-08-05 17:39:58.816', 'JIDUSERGBsbuD2EJ9jYMlGclISJ', '127.0.0.1');

--
-- Dumping data for table `uriel_contest_clarification`
--

INSERT INTO `uriel_contest_clarification` (`jid`, `contestJid`, `topicJid`, `title`, `question`, `answer`, `status`, `createdAt`, `createdBy`, `createdIp`, `updatedAt`, `updatedBy`, `updatedIp`) VALUES
('JIDCOCLskqUDQZdvWIRbKgNDFFP', 'JIDCONTYsWkzwPy8wCF3maJfxqN', 'JIDCONTYsWkzwPy8wCF3maJfxqN', 'Lunch', 'Will lunch be provided?', 'Yes.', 'ANSWERED', '2018-08-05 18:24:04.866', 'JIDUSER7uMucIkm1exJTu7sJvxR', '127.0.0.1', '2018-08-05 18:24:26.258', 'JIDUSERGBsbuD2EJ9jYMlGclISJ', '127.0.0.1');

--
-- Dumping data for table `uriel_contest_contestant`
--

INSERT INTO `uriel_contest_contestant` (`contestJid`, `userJid`, `contestStartTime`, `status`, `createdAt`, `createdBy`, `createdIp`, `updatedAt`, `updatedBy`, `updatedIp`) VALUES
('JIDCONTYsWkzwPy8wCF3maJfxqN', 'JIDUSERVfszUmquMh0Ae2laygDp', NULL, 'APPROVED', '2018-08-05 17:32:08.186', 'JIDUSERVfszUmquMh0Ae2laygDp', '127.0.0.1', '2018-08-05 17:32:08.186', 'JIDUSERVfszUmquMh0Ae2laygDp', '127.0.0.1'),
('JIDCONTYsWkzwPy8wCF3maJfxqN', 'JIDUSERDMZOs8UHqjsw9DGbB31z', NULL, 'APPROVED', '2018-08-05 17:32:25.052', 'JIDUSERDMZOs8UHqjsw9DGbB31z', '127.0.0.1', '2018-08-05 17:32:25.052', 'JIDUSERDMZOs8UHqjsw9DGbB31z', '127.0.0.1'),
('JIDCONTYsWkzwPy8wCF3maJfxqN', 'JIDUSER7uMucIkm1exJTu7sJvxR', NULL, 'APPROVED', '2018-08-05 17:32:38.079', 'JIDUSER7uMucIkm1exJTu7sJvxR', '127.0.0.1', '2018-08-05 17:32:38.079', 'JIDUSER7uMucIkm1exJTu7sJvxR', '127.0.0.1');

--
-- Dumping data for table `uriel_contest_module`
--

INSERT INTO `uriel_contest_module` (`contestJid`, `name`, `config`, `enabled`, `createdAt`, `createdBy`, `createdIp`, `updatedAt`, `updatedBy`, `updatedIp`) VALUES
('JIDCONTYsWkzwPy8wCF3maJfxqN', 'CLARIFICATION', '{}', b'1', '2018-08-05 19:59:23.330', 'JIDUSERGBsbuD2EJ9jYMlGclISJ', '127.0.0.1', '2018-08-05 19:59:23.330', 'JIDUSERGBsbuD2EJ9jYMlGclISJ', '127.0.0.1'),
('JIDCONTYsWkzwPy8wCF3maJfxqN', 'SCOREBOARD', '{\"isIncognitoScoreboard\":false}', b'1', '2018-08-05 19:59:25.602', 'JIDUSERGBsbuD2EJ9jYMlGclISJ', '127.0.0.1', '2018-08-05 19:59:25.602', 'JIDUSERGBsbuD2EJ9jYMlGclISJ', '127.0.0.1'),
('JIDCONTYsWkzwPy8wCF3maJfxqN', 'SUPERVISOR', '{}', b'1', '2018-08-05 19:59:28.084', 'JIDUSERGBsbuD2EJ9jYMlGclISJ', '127.0.0.1', '2018-08-05 19:59:28.084', 'JIDUSERGBsbuD2EJ9jYMlGclISJ', '127.0.0.1'),
('JIDCONTYsWkzwPy8wCF3maJfxqN', 'REGISTRATION', '{\"registerStartTime\":1533473972812,\"manualApproval\":false,\"registerDuration\":432000000,\"maxRegistrants\":0}', b'1', '2018-08-05 19:59:32.812', 'JIDUSERGBsbuD2EJ9jYMlGclISJ', '127.0.0.1', '2018-08-05 19:59:32.812', 'JIDUSERGBsbuD2EJ9jYMlGclISJ', '127.0.0.1'),
('JIDCONT89YMatMq7GqaPQCyyUHU', 'CLARIFICATION', '{}', b'1', '2018-08-05 19:59:50.281', 'JIDUSERGBsbuD2EJ9jYMlGclISJ', '127.0.0.1', '2018-08-05 19:59:50.281', 'JIDUSERGBsbuD2EJ9jYMlGclISJ', '127.0.0.1'),
('JIDCONT89YMatMq7GqaPQCyyUHU', 'SUPERVISOR', '{}', b'1', '2018-08-05 19:59:52.148', 'JIDUSERGBsbuD2EJ9jYMlGclISJ', '127.0.0.1', '2018-08-05 19:59:52.148', 'JIDUSERGBsbuD2EJ9jYMlGclISJ', '127.0.0.1'),
('JIDCONT89YMatMq7GqaPQCyyUHU', 'SCOREBOARD', '{\"isIncognitoScoreboard\":false}', b'1', '2018-08-05 19:59:54.004', 'JIDUSERGBsbuD2EJ9jYMlGclISJ', '127.0.0.1', '2018-08-05 19:59:54.004', 'JIDUSERGBsbuD2EJ9jYMlGclISJ', '127.0.0.1'),
('JIDCONT89YMatMq7GqaPQCyyUHU', 'REGISTRATION', '{\"registerStartTime\":1533473997175,\"manualApproval\":false,\"registerDuration\":432000000,\"maxRegistrants\":0}', b'1', '2018-08-05 19:59:57.175', 'JIDUSERGBsbuD2EJ9jYMlGclISJ', '127.0.0.1', '2018-08-05 19:59:57.175', 'JIDUSERGBsbuD2EJ9jYMlGclISJ', '127.0.0.1');

--
-- Dumping data for table `uriel_contest_style`
--

INSERT INTO `uriel_contest_style` (`contestJid`, `config`, `createdAt`, `createdBy`, `createdIp`, `updatedAt`, `updatedBy`, `updatedIp`) VALUES
('JIDCONTYsWkzwPy8wCF3maJfxqN', '{\"wrongSubmissionPenalty\":20,\"languageRestriction\":{\"allowedLanguageNames\":[]}}', '2018-08-05 17:30:35.327', 'JIDUSERGBsbuD2EJ9jYMlGclISJ', '127.0.0.1', '2018-08-05 17:30:35.327', 'JIDUSERGBsbuD2EJ9jYMlGclISJ', '127.0.0.1'),
('JIDCONT89YMatMq7GqaPQCyyUHU', '{\"usingLastAffectingPenalty\":false,\"languageRestriction\":{\"allowedLanguageNames\":[]}}', '2018-08-05 18:11:40.037', 'JIDUSERGBsbuD2EJ9jYMlGclISJ', '127.0.0.1', '2018-08-05 18:11:40.037', 'JIDUSERGBsbuD2EJ9jYMlGclISJ', '127.0.0.1');

--
-- Dumping data for table `uriel_role_admin`
--

INSERT INTO `uriel_role_admin` (`userJid`, `createdAt`, `createdBy`, `createdIp`) VALUES
('JIDCONT89YMatMq7GqaPQCyyUHU', '2018-08-05 00:00:00.000', NULL, NULL);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
