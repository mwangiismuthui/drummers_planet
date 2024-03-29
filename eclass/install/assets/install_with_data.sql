-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Feb 27, 2017 at 11:03 AM
-- Server version: 5.7.17-0ubuntu0.16.04.1
-- PHP Version: 7.0.15-0ubuntu0.16.04.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `menorah-tutor-sellingcourses`
--

-- --------------------------------------------------------

--
-- Table structure for table `pre_admin_money_transactions`
--

CREATE TABLE `pre_admin_money_transactions` (
  `id` int(25) NOT NULL,
  `user_id` int(25) NOT NULL,
  `booking_id` bigint(20) NOT NULL COMMENT 'if user_type=tutor, booking_id can be referred from booking table ,,, if user_type=institute, booking_id can be referred from inst_enrolled_students with enroll_id',
  `user_type` enum('tutor','institute') DEFAULT NULL,
  `user_name` varchar(512) NOT NULL,
  `user_paypal_email` varchar(512) NOT NULL,
  `no_of_credits_to_be_converted` int(25) NOT NULL,
  `admin_commission_val` float NOT NULL DEFAULT '0' COMMENT 'in credits',
  `per_credit_cost` decimal(10,2) NOT NULL,
  `total_amount` decimal(10,2) NOT NULL,
  `status_of_payment` enum('Pending','Done') NOT NULL DEFAULT 'Pending',
  `user_bank_ac_details` text NOT NULL,
  `payment_mode` varchar(512) DEFAULT NULL,
  `transaction_details` varchar(1000) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `updated_by` varchar(512) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pre_admin_money_transactions`
--

INSERT INTO `pre_admin_money_transactions` (`id`, `user_id`, `booking_id`, `user_type`, `user_name`, `user_paypal_email`, `no_of_credits_to_be_converted`, `admin_commission_val`, `per_credit_cost`, `total_amount`, `status_of_payment`, `user_bank_ac_details`, `payment_mode`, `transaction_details`, `created_at`, `updated_at`, `updated_by`) VALUES
(1, 7, 7, 'tutor', 'Behati Corinn', 'bellaadwerd123@gmail.com', 45, 5, '2.00', '90.00', 'Done', 'Bank code (Bankleitzahl): 20811008\r\ndomestic account number: 1039531801 \r\nIBAN: AL90208110080000001039531801', NULL, 'Done Transaction No: 5632140', '2016-11-11 12:53:43', '2016-11-11 12:55:23', '1'),
(2, 7, 28, 'tutor', 'Behati Corinn', 'bellaadwerd123@gmail.com', 4, 1, '2.00', '8.00', 'Done', 'Bank code (Bankleitzahl): 20811008\r\ndomestic account number: 1039531801 \r\nIBAN: AL90208110080000001039531801', NULL, 'done', '2016-11-11 12:54:04', '2016-11-23 15:11:46', '1'),
(3, 7, 8, 'tutor', 'Behati Corinn', 'bellaadwerd123@gmail.com', 135, 15, '2.00', '270.00', 'Pending', 'Bank code (Bankleitzahl): 20811008\r\ndomestic account number: 1039531801 \r\nIBAN: AL90208110080000001039531801', NULL, NULL, '2016-11-11 12:54:56', '2016-11-11 12:54:56', '7'),
(4, 13, 5, 'institute', 'Bebe Esmie', 'bebe34@gma.com', 1008, 112, '2.00', '2016.00', 'Done', 'Bank code (Bankleitzahl): 20811008\r\ndomestic account number: 1039531801\r\nIBAN: AL90208110080000001039531801 ', NULL, 'Done TXN : 56321452', '2016-11-14 15:25:20', '2016-11-14 15:30:59', '1'),
(5, 13, 4, 'institute', 'Bebe Esmie', 'bebe34@gma.com', 1548, 172, '2.00', '3096.00', 'Pending', 'Bank code (Bankleitzahl): 20811008\r\ndomestic account number: 1039531801\r\nIBAN: AL90208110080000001039531801 ', NULL, NULL, '2016-11-14 15:27:41', '2016-11-14 15:27:41', '13'),
(6, 13, 36, 'institute', 'Bebe Esmie', 'bebe34@gma.com', 540, 60, '2.00', '1080.00', 'Pending', 'Bank code (Bankleitzahl): 20811008\r\ndomestic account number: 1039531801\r\nIBAN: AL90208110080000001039531801 ', NULL, NULL, '2016-11-15 10:26:49', '2016-11-15 10:26:49', '13'),
(7, 7, 19, 'tutor', 'Behati Corinn', 'bellaadwerd123@gmail.com', 135, 15, '2.00', '270.00', 'Pending', 'Bank code (Bankleitzahl): 20811008\r\ndomestic account number: 1039531801 \r\nIBAN: AL90208110080000001039531801', NULL, NULL, '2016-11-24 09:59:36', '2016-11-24 09:59:36', '7');

-- --------------------------------------------------------

--
-- Table structure for table `pre_bookings`
--

CREATE TABLE `pre_bookings` (
  `booking_id` bigint(20) NOT NULL,
  `student_id` int(11) NOT NULL,
  `tutor_id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  `content` text CHARACTER SET utf8 COMMENT 'course content',
  `duration_value` tinyint(5) NOT NULL,
  `duration_type` enum('hours','days','months','years') CHARACTER SET utf8 NOT NULL DEFAULT 'days',
  `fee` float NOT NULL COMMENT 'in credits',
  `per_credit_value` float NOT NULL DEFAULT '1',
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `time_slot` varchar(1000) CHARACTER SET utf8 NOT NULL,
  `days_off` varchar(512) CHARACTER SET utf8 DEFAULT NULL,
  `preferred_location` varchar(55) CHARACTER SET utf8 NOT NULL,
  `message` varchar(1000) CHARACTER SET utf8 DEFAULT NULL,
  `admin_commission` float NOT NULL DEFAULT '0' COMMENT 'admin commission in percentage with the fee in credits. result will be in round value of credits',
  `admin_commission_val` float NOT NULL DEFAULT '0' COMMENT 'admin commision value in credits',
  `prev_status` varchar(512) CHARACTER SET utf8 NOT NULL DEFAULT 'pending',
  `status` enum('pending','approved','cancelled_before_course_started','cancelled_when_course_running','cancelled_after_course_completed','session_initiated','running','completed','called_for_admin_intervention','closed') CHARACTER SET utf8 NOT NULL DEFAULT 'pending' COMMENT 'pending->when student makes booking, approved->when tutor approves student''s booking, cancelled->when tutor cancels the student''s booking request, session_initiated->when tutor starts the course session, running-when student joins the session, completed->when student confirms the tutor''s course completion, called_for_admin_intervention->when student not satisfied with the course can call for admin intervention, which may cost some credits, and if nothing wrong with student amt will be refunded to student with intervention charges and that intervention charges will be deducted from tutors account, if nothing is wrong with Tutor, course credits will be credited to that Tutor, closed->course training is closed for that booking.',
  `status_desc` varchar(1000) CHARACTER SET utf8 DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) NOT NULL COMMENT 'record updated user id'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pre_bookings`
--

INSERT INTO `pre_bookings` (`booking_id`, `student_id`, `tutor_id`, `course_id`, `content`, `duration_value`, `duration_type`, `fee`, `per_credit_value`, `start_date`, `end_date`, `time_slot`, `days_off`, `preferred_location`, `message`, `admin_commission`, `admin_commission_val`, `prev_status`, `status`, `status_desc`, `created_at`, `updated_at`, `updated_by`) VALUES
(1, 2, 9, 17, '<p>\r\n	<b style="font-family: arial, sans-serif; font-size: 16px;">MySQL</b><span style="font-family: arial, sans-serif; font-size: 16px;">, pronounced either &quot;</span><b style="font-family: arial, sans-serif; font-size: 16px;">My S-Q-L</b><span style="font-family: arial, sans-serif; font-size: 16px;">&quot; or &quot;</span><b style="font-family: arial, sans-serif; font-size: 16px;">My</b><span style="font-family: arial, sans-serif; font-size: 16px;">&nbsp;Sequel,&quot; is an open source relational database management system. It is based on the structure query language (</span><b style="font-family: arial, sans-serif; font-size: 16px;">SQL</b><span style="font-family: arial, sans-serif; font-size: 16px;">), which is used for adding, removing, and modifying information in the database.</span></p>\r\n', 90, 'days', 50, 2, '2016-11-23', '2017-02-20', '7-9', 'SUN', 'online', 'Hello Tutor', 10, 5, 'approved', 'called_for_admin_intervention', '', '2016-11-09 10:31:01', '2016-11-10 09:55:13', 2),
(2, 2, 10, 151, '<p>\r\n	<span style="font-family: arial, sans-serif; font-size: 16px;">The&nbsp;</span><b style="font-family: arial, sans-serif; font-size: 16px;">IBPS</b><span style="font-family: arial, sans-serif; font-size: 16px;">&nbsp;clerk exam is universally adapted by nationalized banks across India to induct fresh graduates into various clerical posts.&nbsp;</span><b style="font-family: arial, sans-serif; font-size: 16px;">IBPS</b><span style="font-family: arial, sans-serif; font-size: 16px;">also conducts exams for recruitment to the post of probationary officer (PO) and specialist officer (SO)</span></p>\r\n', 90, 'days', 150, 2, '2016-11-16', '2017-02-13', '10-12', 'SUN', 'Columbus', 'Hello Tutor', 10, 15, 'approved', 'cancelled_before_course_started', 'gig', '2016-11-09 10:31:48', '2016-11-23 15:46:00', 2),
(3, 3, 7, 27, '<p>\r\n	<span style="font-family: arial, sans-serif; font-size: 16px;">&nbsp;consists of a means of monitoring the&nbsp;</span><b style="font-family: arial, sans-serif; font-size: 16px;">software</b><span style="font-family: arial, sans-serif; font-size: 16px;">engineering processes and methods used to ensure quality. The methods by which this is accomplished are many and varied, and may include ensuring conformance to one or more standards, such as ISO 9000 or a model such as CMMI.</span></p>\r\n', 5, 'months', 250, 2, '2016-11-10', '2017-04-09', '10-12', 'SUN', 'Chicago', 'Hi Tutor  . .............', 10, 25, 'approved', 'session_initiated', '', '2016-11-09 18:14:24', '2016-11-10 09:48:50', 7),
(4, 3, 9, 18, '<p>\r\n	<span style="font-family: arial, sans-serif; font-size: 16px;">Adobe&nbsp;</span><b style="font-family: arial, sans-serif; font-size: 16px;">Dreamweaver</b><span style="font-family: arial, sans-serif; font-size: 16px;">&nbsp;is a proprietary web development tool developed by Adobe Systems.&nbsp;</span><b style="font-family: arial, sans-serif; font-size: 16px;">Dreamweaver</b><span style="font-family: arial, sans-serif; font-size: 16px;">&nbsp;was created by Macromedia in 1997, and was maintained by them until Macromedia was acquired by Adobe Systems in 2005.</span></p>\r\n', 90, 'days', 120, 2, '2016-11-10', '2017-02-07', '7-9', 'SUN', 'online', 'Hello My name is ...................', 10, 12, 'pending', 'cancelled_before_course_started', '', '2016-11-09 18:15:18', '2016-11-10 09:51:25', 9),
(5, 4, 10, 151, '<p>\r\n	<span style="font-family: arial, sans-serif; font-size: 16px;">The&nbsp;</span><b style="font-family: arial, sans-serif; font-size: 16px;">IBPS</b><span style="font-family: arial, sans-serif; font-size: 16px;">&nbsp;clerk exam is universally adapted by nationalized banks across India to induct fresh graduates into various clerical posts.&nbsp;</span><b style="font-family: arial, sans-serif; font-size: 16px;">IBPS</b><span style="font-family: arial, sans-serif; font-size: 16px;">also conducts exams for recruitment to the post of probationary officer (PO) and specialist officer (SO)</span></p>\r\n', 90, 'days', 150, 2, '2016-11-09', '2017-02-06', '7-9', 'SUN', 'Fort Worth', 'Hi Hello MY name is ............................', 10, 15, 'pending', 'approved', '', '2016-11-09 18:17:14', '2016-11-10 09:52:24', 10),
(6, 3, 7, 27, '<p>\r\n	<span style="font-family: arial, sans-serif; font-size: 16px;">&nbsp;consists of a means of monitoring the&nbsp;</span><b style="font-family: arial, sans-serif; font-size: 16px;">software</b><span style="font-family: arial, sans-serif; font-size: 16px;">engineering processes and methods used to ensure quality. The methods by which this is accomplished are many and varied, and may include ensuring conformance to one or more standards, such as ISO 9000 or a model such as CMMI.</span></p>\r\n', 5, 'months', 250, 2, '2016-11-22', '2017-04-21', '7-9', 'SUN', 'home', 'Need to cover all manual topics', 10, 25, 'approved', 'cancelled_before_course_started', 'Approved', '2016-11-11 09:58:00', '2016-11-16 14:17:34', 7),
(7, 3, 7, 21, '<p>\r\n	<b style="font-family: arial, sans-serif; font-size: 16px;">JavaScript</b><span style="font-family: arial, sans-serif; font-size: 16px;">&nbsp;is a lightweight, interpreted, object-oriented language with first-class functions, and is best known as the scripting language for Web pages, but it&#39;s used in many non-browser environments as well.</span></p>\r\n', 30, 'days', 50, 2, '2016-11-11', '2016-12-10', '10-12', 'SUN', 'online', 'To cover All topics', 10, 5, 'completed', 'closed', 'Course Complted and Closed', '2016-11-11 10:02:48', '2016-11-11 10:10:24', 3),
(8, 3, 7, 26, '<p>\r\n	<b style="font-family: arial, sans-serif; font-size: 16px;">PHP</b><span style="font-family: arial, sans-serif; font-size: 16px;">&nbsp;is a server-side scripting language designed primarily for web development but also used as a general-purpose&nbsp;</span><b style="font-family: arial, sans-serif; font-size: 16px;">programming&nbsp;</b><span style="font-family: arial, sans-serif; font-size: 16px;">language. </span><span style="font-family: arial, sans-serif; font-size: 16px;">&nbsp;</span></p>\r\n', 90, 'days', 150, 2, '2016-11-11', '2017-02-08', '10-12', 'SAT', 'Chicago', 'Hi Behati Corinn please start ASAP ', 10, 15, 'completed', 'closed', 'Ok Done', '2016-11-11 10:18:05', '2016-11-11 10:20:36', 3),
(9, 3, 68, 27, '<p>\r\n	<span class="_Tgc"><b>Software Testing</b> is evaluation of the <b>software</b> against requirements gathered from users and system specifications. <b>Testing</b> is conducted at the phase level in <b>software</b> development life cycle or at module level in program code. <b>Software testing</b> comprises of Validation and Verification.</span></p>\r\n', 3, 'months', 600, 2, '2016-11-11', '2017-02-10', '11-13', 'SUN', 'home', 'Automation testing--Selenium', 10, 60, 'completed', 'closed', 'Ok course is Done', '2016-11-11 10:29:33', '2016-11-11 10:33:51', 3),
(10, 3, 68, 27, '<p>\r\n	<span class="_Tgc"><b>Software Testing</b> is evaluation of the <b>software</b> against requirements gathered from users and system specifications. <b>Testing</b> is conducted at the phase level in <b>software</b> development life cycle or at module level in program code. <b>Software testing</b> comprises of Validation and Verification.</span></p>\r\n', 3, 'months', 600, 2, '2016-11-11', '2017-02-10', '11-13', 'SUN', 'Colorado Springs', 'Testing', 10, 60, 'completed', 'called_for_admin_intervention', 'Course is not complted but tutor as updated complete. Please Revert back me', '2016-11-11 10:44:26', '2016-11-11 10:46:39', 3),
(11, 3, 8, 40, '<p>\r\n	<span style="font-family: arial, sans-serif; font-size: 16px;">The science of life and of living organisms, including their structure, function, growth, origin, evolution, and distribution. It includes botany and zoology and all their subdivisions. The life processes or characteristic phenomena of a group or category of living organisms: the&nbsp;</span><b style="font-family: arial, sans-serif; font-size: 16px;">biology</b><span style="font-family: arial, sans-serif; font-size: 16px;">&nbsp;of fungi.</span></p>\r\n', 3, 'months', 8, 2, '2016-11-11', '2017-02-10', '10-12', 'SUN', 'home', 'Biology', 10, 1, 'called_for_admin_intervention', 'closed', 'Student is not updated his status', '2016-11-11 10:51:51', '2016-11-11 12:52:05', 1),
(12, 3, 53, 13, '<p>\r\n	<span class="_Tgc"><b>C++</b> is a middle-level programming language developed by Bjarne Stroustrup starting in 1979 at Bell Labs. <b>C++</b> runs on a variety of platforms, such as Windows, Mac OS, and the various versions of UNIX.</span></p>\r\n', 1, 'months', 250, 2, '2016-11-25', '2016-12-24', '9-11', 'SUN', 'Hartford', 'Hello i am danny', 10, 25, 'pending', 'approved', 'Congratulations', '2016-11-11 10:59:14', '2016-11-11 11:07:36', 53),
(13, 3, 7, 61, '<p>\r\n	<b style="font-family: arial, sans-serif; font-size: 16px;">Mathematics</b><span style="font-family: arial, sans-serif; font-size: 16px;">&nbsp;(from Greek &mu;ά&theta;&eta;&mu;&alpha; m&aacute;thēma, &ldquo;knowledge, study, learning&rdquo;) is the study of topics such as quantity (numbers), structure, space, and change. There is a range of views among&nbsp;</span><b style="font-family: arial, sans-serif; font-size: 16px;">mathematicians</b><span style="font-family: arial, sans-serif; font-size: 16px;">&nbsp;and philosophers as to the exact scope and&nbsp;</span><b style="font-family: arial, sans-serif; font-size: 16px;">definition</b><span style="font-family: arial, sans-serif; font-size: 16px;">&nbsp;of&nbsp;</span><b style="font-family: arial, sans-serif; font-size: 16px;">mathematics</b><span style="font-family: arial, sans-serif; font-size: 16px;">.</span></p>\r\n', 6, 'months', 70, 2, '2016-11-11', '2017-05-10', '11-15', 'SUN', 'Chicago', 'Maths', 10, 7, 'completed', 'called_for_admin_intervention', 'Calim for Admin', '2016-11-11 11:11:04', '2016-11-11 12:50:47', 3),
(14, 3, 7, 26, '<p>\r\n	<b style="font-family: arial, sans-serif; font-size: 16px;">PHP</b><span style="font-family: arial, sans-serif; font-size: 16px;">&nbsp;is a server-side scripting language designed primarily for web development but also used as a general-purpose&nbsp;</span><b style="font-family: arial, sans-serif; font-size: 16px;">programming&nbsp;</b><span style="font-family: arial, sans-serif; font-size: 16px;">language. </span><span style="font-family: arial, sans-serif; font-size: 16px;">&nbsp;</span></p>\r\n', 90, 'days', 150, 2, '2016-11-11', '2017-02-08', '10-12', 'SAT', 'home', 'php', 10, 15, 'running', 'completed', 'Completed', '2016-11-11 11:13:48', '2016-11-11 12:49:47', 7),
(15, 3, 7, 29, '<p>\r\n	<b style="font-family: arial, sans-serif; font-size: 16px;">Oracle</b><span style="font-family: arial, sans-serif; font-size: 16px;">&nbsp;database (</span><b style="font-family: arial, sans-serif; font-size: 16px;">Oracle</b><span style="font-family: arial, sans-serif; font-size: 16px;">&nbsp;DB) is a relational database management system (RDBMS) from the&nbsp;</span><b style="font-family: arial, sans-serif; font-size: 16px;">Oracle</b><span style="font-family: arial, sans-serif; font-size: 16px;">&nbsp;Corporation. Originally developed in 1977 by Lawrence Ellison and other developers,&nbsp;</span><b style="font-family: arial, sans-serif; font-size: 16px;">Oracle</b><span style="font-family: arial, sans-serif; font-size: 16px;">&nbsp;DB is one of the most trusted and widely-used relational database engines.</span></p>\r\n', 2, 'months', 300, 2, '2016-11-11', '2017-01-10', '11-13', 'SUN', 'online', 'Oracle', 10, 30, 'session_initiated', 'running', 'Started', '2016-11-11 11:15:32', '2016-11-11 11:16:22', 3),
(16, 3, 7, 16, '<p>\r\n	<b style="font-family: arial, sans-serif; font-size: 16px;">C#</b><span style="font-family: arial, sans-serif; font-size: 16px;">&nbsp;(pronounced &quot;</span><b style="font-family: arial, sans-serif; font-size: 16px;">C</b><span style="font-family: arial, sans-serif; font-size: 16px;">-</span><b style="font-family: arial, sans-serif; font-size: 16px;">sharp</b><span style="font-family: arial, sans-serif; font-size: 16px;">&quot;) is an object-oriented programming language from Microsoft that aims to combine the computing power of&nbsp;</span><b style="font-family: arial, sans-serif; font-size: 16px;">C</b><span style="font-family: arial, sans-serif; font-size: 16px;">++ with the programming ease of Visual Basic.&nbsp;</span><b style="font-family: arial, sans-serif; font-size: 16px;">C#</b><span style="font-family: arial, sans-serif; font-size: 16px;">&nbsp;is based on C++ and contains features similar to those of Java.</span></p>\r\n', 2, 'months', 40, 2, '2016-11-11', '2017-01-10', '10-12', 'SUN', 'Naperville', 'C', 10, 4, 'running', 'completed', 'Completed', '2016-11-11 11:17:40', '2016-11-11 12:50:04', 7),
(17, 3, 7, 22, '<p>\r\n	<b style="font-family: arial, sans-serif; font-size: 16px;">MATLAB</b><span style="font-family: arial, sans-serif; font-size: 16px;">&nbsp;is a high-performance language for technical computing. It integrates computation, visualization, and programming in an easy-to-use environment where problems and solutions are expressed in familiar mathematical notation. Typical uses include: Math and computation.</span></p>\r\n', 2, 'months', 130, 2, '2016-11-11', '2017-01-10', '10-12', 'SUN', 'home', 'MAT Lab excises', 10, 13, 'session_initiated', 'running', 'Start', '2016-11-11 11:19:52', '2016-11-11 11:20:41', 3),
(18, 3, 7, 24, '<p>\r\n	<b style="font-family: arial, sans-serif; font-size: 16px;">Microsoft Office</b><span style="font-family: arial, sans-serif; font-size: 16px;">. Suite of products developed by&nbsp;</span><b style="font-family: arial, sans-serif; font-size: 16px;">Microsoft</b><span style="font-family: arial, sans-serif; font-size: 16px;">&nbsp;Corporation that includes&nbsp;</span><b style="font-family: arial, sans-serif; font-size: 16px;">Microsoft</b><span style="font-family: arial, sans-serif; font-size: 16px;">&nbsp;Word, Excel, Access, Publisher, PowerPoint, and Outlook. Each program serves a different purpose and is compatible with other programs included in the package.</span></p>\r\n', 1, 'months', 50, 2, '2016-11-11', '2016-12-10', '10-12', 'SUN', 'online', 'Microsoft Office.', 10, 5, 'session_initiated', 'running', 'Start', '2016-11-11 11:22:00', '2016-11-11 11:22:49', 3),
(19, 3, 7, 14, '<p style="font-family: verdana, helvetica, arial, sans-serif; font-size: 13px; text-align: justify;">\r\n	Java is a&nbsp;programming language&nbsp;and a&nbsp;platform.</p>\r\n<p style="font-family: verdana, helvetica, arial, sans-serif; font-size: 13px; text-align: justify;">\r\n	Java is a high level, robust, secured and object-oriented programming language.</p>\r\n', 6, 'months', 150, 2, '2016-11-11', '2017-05-10', '10-12', 'SUN', 'home', 'Java', 10, 15, 'completed', 'closed', 'Close', '2016-11-11 11:23:39', '2016-11-11 12:54:15', 3),
(20, 3, 7, 16, '<p>\r\n	<b style="font-family: arial, sans-serif; font-size: 16px;">C#</b><span style="font-family: arial, sans-serif; font-size: 16px;">&nbsp;(pronounced &quot;</span><b style="font-family: arial, sans-serif; font-size: 16px;">C</b><span style="font-family: arial, sans-serif; font-size: 16px;">-</span><b style="font-family: arial, sans-serif; font-size: 16px;">sharp</b><span style="font-family: arial, sans-serif; font-size: 16px;">&quot;) is an object-oriented programming language from Microsoft that aims to combine the computing power of&nbsp;</span><b style="font-family: arial, sans-serif; font-size: 16px;">C</b><span style="font-family: arial, sans-serif; font-size: 16px;">++ with the programming ease of Visual Basic.&nbsp;</span><b style="font-family: arial, sans-serif; font-size: 16px;">C#</b><span style="font-family: arial, sans-serif; font-size: 16px;">&nbsp;is based on C++ and contains features similar to those of Java.</span></p>\r\n', 2, 'months', 40, 2, '2016-11-11', '2017-01-10', '7-9', 'SUN', 'San Francisco', 'C#', 10, 4, 'pending', 'approved', 'Approved', '2016-11-11 11:25:36', '2016-11-11 11:25:42', 7),
(21, 3, 7, 37, '<p>\r\n	<b style="font-family: arial, sans-serif; font-size: 16px;">Trigonometry</b><span style="font-family: arial, sans-serif; font-size: 16px;">&nbsp;(from Greek trigōnon, &quot;triangle&quot; and metron, &quot;measure&quot;) is a branch of mathematics that studies relationships involving lengths and angles of triangles.</span></p>\r\n', 6, 'months', 600, 2, '2016-11-24', '2017-05-23', '8-10', 'SUN', 'online', 'Hi i am jack', 10, 60, 'pending', 'approved', 'Congrates will meet you in soon', '2016-11-11 11:36:02', '2016-11-11 12:27:47', 7),
(22, 3, 7, 24, '<p>\r\n	<b style="font-family: arial, sans-serif; font-size: 16px;">Microsoft Office</b><span style="font-family: arial, sans-serif; font-size: 16px;">. Suite of products developed by&nbsp;</span><b style="font-family: arial, sans-serif; font-size: 16px;">Microsoft</b><span style="font-family: arial, sans-serif; font-size: 16px;">&nbsp;Corporation that includes&nbsp;</span><b style="font-family: arial, sans-serif; font-size: 16px;">Microsoft</b><span style="font-family: arial, sans-serif; font-size: 16px;">&nbsp;Word, Excel, Access, Publisher, PowerPoint, and Outlook. Each program serves a different purpose and is compatible with other programs included in the package.</span></p>\r\n', 1, 'months', 50, 2, '2016-11-19', '2016-12-18', '8-9', 'SUN', 'home', 'Hi i am james', 10, 5, 'pending', 'approved', 'Your Approved', '2016-11-11 11:36:27', '2016-11-11 12:28:17', 7),
(23, 3, 7, 19, '<p>\r\n	<span style="font-weight: bold; color: rgb(106, 106, 106); font-family: arial, sans-serif; font-size: small;">Adobe Flash Player</span><span style="color: rgb(84, 84, 84); font-family: arial, sans-serif; font-size: small;">&nbsp;is the high performance, lightweight, highly expressive client runtime that delivers powerful and consistent user experiences across major.</span></p>\r\n', 2, 'months', 30, 2, '2016-11-11', '2017-01-10', '9-11', 'SUN', 'online', 'Flash', 10, 3, 'pending', 'approved', 'Approved', '2016-11-11 11:38:43', '2016-11-11 11:38:57', 7),
(24, 3, 7, 19, '<p>\r\n	<span style="font-weight: bold; color: rgb(106, 106, 106); font-family: arial, sans-serif; font-size: small;">Adobe Flash Player</span><span style="color: rgb(84, 84, 84); font-family: arial, sans-serif; font-size: small;">&nbsp;is the high performance, lightweight, highly expressive client runtime that delivers powerful and consistent user experiences across major.</span></p>\r\n', 2, 'months', 30, 2, '2016-11-11', '2017-01-10', '12-1', 'SUN', 'Chicago', 'Adobe Flash ', 10, 3, 'pending', 'approved', 'Approved', '2016-11-11 11:40:04', '2016-11-11 11:40:16', 7),
(25, 3, 8, 39, '<p>\r\n	<span style="font-family: verdana; font-size: small;">Chemistry is the science of matter at or near the atomic scale. (Matter is the substance of which all physical objects are made.)</span></p>\r\n<p style="font-family: verdana; font-size: small;">\r\n	Chemistry deals with the properties of matter, and the transformation and interactions of matter and energy. Central to chemistry is the interaction of one substance with another, such as in a chemical reaction, where a substance or substances are transformed into another. Chemistry primarily studies atoms and collections of atoms such as molecules, crystals or metals that make up ordinary matter. According to modern chemistry it is the structure of matter at the atomic scale that determines the nature of a material.</p>\r\n', 2, 'months', 200, 2, '2016-11-11', '2017-01-10', '7-9', 'SUN', 'home', 'Chemistry', 10, 20, 'pending', 'called_for_admin_intervention', 'I Don\'t have communication with tutor ', '2016-11-11 11:45:36', '2016-11-11 12:30:47', 3),
(26, 3, 8, 39, '<p>\r\n	<span style="font-family: verdana; font-size: small;">Chemistry is the science of matter at or near the atomic scale. (Matter is the substance of which all physical objects are made.)</span></p>\r\n<p style="font-family: verdana; font-size: small;">\r\n	Chemistry deals with the properties of matter, and the transformation and interactions of matter and energy. Central to chemistry is the interaction of one substance with another, such as in a chemical reaction, where a substance or substances are transformed into another. Chemistry primarily studies atoms and collections of atoms such as molecules, crystals or metals that make up ordinary matter. According to modern chemistry it is the structure of matter at the atomic scale that determines the nature of a material.</p>\r\n', 2, 'months', 200, 2, '2016-11-11', '2017-01-10', '10-12', 'SUN', 'home', 'Chemistry', 10, 20, 'approved', 'cancelled_before_course_started', 'Approved', '2016-11-11 11:47:00', '2016-11-23 16:18:48', 8),
(27, 3, 7, 22, '<p>\r\n	<b style="font-family: arial, sans-serif; font-size: 16px;">MATLAB</b><span style="font-family: arial, sans-serif; font-size: 16px;">&nbsp;is a high-performance language for technical computing. It integrates computation, visualization, and programming in an easy-to-use environment where problems and solutions are expressed in familiar mathematical notation. Typical uses include: Math and computation.</span></p>\r\n', 2, 'months', 130, 2, '2016-11-11', '2017-01-10', '7-9', 'SUN', 'Augusta', 'Hi i am james', 10, 13, 'pending', 'cancelled_before_course_started', 'Your Cancelled', '2016-11-11 11:51:36', '2016-11-11 12:28:36', 7),
(28, 3, 7, 92, '<p>\r\n	<span style="font-family: arial, sans-serif; font-size: 16px;">A logic&nbsp;</span><b style="font-family: arial, sans-serif; font-size: 16px;">gate</b><span style="font-family: arial, sans-serif; font-size: 16px;">&nbsp;is an elementary building block of a digital circuit. Most logic&nbsp;</span><b style="font-family: arial, sans-serif; font-size: 16px;">gates</b><span style="font-family: arial, sans-serif; font-size: 16px;">&nbsp;have two inputs and one output. At any given moment, every terminal is in one of the two binary conditions low (0) or high (1), represented by different voltage levels</span></p>\r\n', 1, 'years', 5, 2, '2016-11-24', '2017-11-23', '8-10', 'SUN', 'Pueblo', 'i am james , i need gate training', 10, 1, 'called_for_admin_intervention', 'closed', 'I Don\'t want this course what to do now', '2016-11-11 11:52:04', '2016-11-11 12:52:30', 1),
(29, 3, 7, 45, '<p>\r\n	<span style="font-family: arial, sans-serif; font-size: 16px;">It&#39;s the most commonly required admission test for grad school. ... Much like the SAT and ACT, the&nbsp;</span><b style="font-family: arial, sans-serif; font-size: 16px;">GRE</b><span style="font-family: arial, sans-serif; font-size: 16px;">&nbsp;exam is a broad assessment of your critical thinking, analytical writing, verbal reasoning, and quantitative reasoning skills &mdash; all skills developed over the course of many years</span></p>\r\n', 1, 'years', 1500, 2, '2016-11-23', '2017-11-22', '11-15', 'SUN', 'online', 'Hello i am danny ', 10, 150, 'pending', 'called_for_admin_intervention', 'i need credites', '2016-11-11 11:52:27', '2016-11-11 12:32:19', 3),
(30, 3, 7, 29, '<p>\r\n	<b style="font-family: arial, sans-serif; font-size: 16px;">Oracle</b><span style="font-family: arial, sans-serif; font-size: 16px;">&nbsp;database (</span><b style="font-family: arial, sans-serif; font-size: 16px;">Oracle</b><span style="font-family: arial, sans-serif; font-size: 16px;">&nbsp;DB) is a relational database management system (RDBMS) from the&nbsp;</span><b style="font-family: arial, sans-serif; font-size: 16px;">Oracle</b><span style="font-family: arial, sans-serif; font-size: 16px;">&nbsp;Corporation. Originally developed in 1977 by Lawrence Ellison and other developers,&nbsp;</span><b style="font-family: arial, sans-serif; font-size: 16px;">Oracle</b><span style="font-family: arial, sans-serif; font-size: 16px;">&nbsp;DB is one of the most trusted and widely-used relational database engines.</span></p>\r\n', 2, 'months', 300, 2, '2016-11-25', '2017-01-24', '8-10', 'SUN', 'home', 'Hello i need oracle', 10, 30, 'pending', 'pending', NULL, '2016-11-11 11:52:55', '2016-11-11 11:52:55', 3),
(31, 3, 7, 27, '<p>\r\n	<span style="font-family: arial, sans-serif; font-size: 16px;">&nbsp;consists of a means of monitoring the&nbsp;</span><b style="font-family: arial, sans-serif; font-size: 16px;">software</b><span style="font-family: arial, sans-serif; font-size: 16px;">engineering processes and methods used to ensure quality. The methods by which this is accomplished are many and varied, and may include ensuring conformance to one or more standards, such as ISO 9000 or a model such as CMMI.</span></p>\r\n', 5, 'months', 60, 2, '2016-11-18', '2017-04-17', '4-6', 'SUN', 'Austin', 'Hello i am james , i need QA training', 10, 6, 'pending', 'pending', NULL, '2016-11-11 11:53:35', '2016-11-11 11:53:35', 3),
(32, 3, 7, 30, '<p>\r\n	<b style="font-family: arial, sans-serif; font-size: 16px;">Algebra</b><span style="font-family: arial, sans-serif; font-size: 16px;">&nbsp;I provides a formal development of the&nbsp;</span><b style="font-family: arial, sans-serif; font-size: 16px;">algebraic</b><span style="font-family: arial, sans-serif; font-size: 16px;">&nbsp;skills and concepts necessary for students to succeed in advanced courses. ... Topics include: (1) operations with real numbers, (2) linear equations and inequalities, (3) relations and functions, (4) polynomials, (5)&nbsp;</span><b style="font-family: arial, sans-serif; font-size: 16px;">algebraic</b><span style="font-family: arial, sans-serif; font-size: 16px;">&nbsp;fractions, and (6) nonlinear equations.</span></p>\r\n', 3, 'months', 170, 2, '2016-11-25', '2017-02-24', '17-20', 'SUN', 'home', 'Hello i am so and so i need mathes ', 10, 17, 'pending', 'pending', NULL, '2016-11-11 11:54:10', '2016-11-11 11:54:10', 3),
(33, 3, 7, 61, '<p>\r\n	<b style="font-family: arial, sans-serif; font-size: 16px;">Mathematics</b><span style="font-family: arial, sans-serif; font-size: 16px;">&nbsp;(from Greek &mu;ά&theta;&eta;&mu;&alpha; m&aacute;thēma, &ldquo;knowledge, study, learning&rdquo;) is the study of topics such as quantity (numbers), structure, space, and change. There is a range of views among&nbsp;</span><b style="font-family: arial, sans-serif; font-size: 16px;">mathematicians</b><span style="font-family: arial, sans-serif; font-size: 16px;">&nbsp;and philosophers as to the exact scope and&nbsp;</span><b style="font-family: arial, sans-serif; font-size: 16px;">definition</b><span style="font-family: arial, sans-serif; font-size: 16px;">&nbsp;of&nbsp;</span><b style="font-family: arial, sans-serif; font-size: 16px;">mathematics</b><span style="font-family: arial, sans-serif; font-size: 16px;">.</span></p>\r\n', 6, 'months', 70, 2, '2016-11-17', '2017-05-16', '8-12', 'SUN', 'home', 'Hellow i am james i need mathes', 10, 7, 'pending', 'approved', 'Your Approved', '2016-11-11 11:56:28', '2016-11-11 12:28:51', 7),
(34, 3, 7, 40, '<p>\r\n	<span style="font-family: arial, sans-serif; font-size: 16px;">The science of life and of living organisms, including their structure, function, growth, origin, evolution, and distribution. It includes botany and zoology and all their subdivisions. 2. The life processes or characteristic phenomena of a group or category of living organisms: the&nbsp;</span><b style="font-family: arial, sans-serif; font-size: 16px;">biology</b><span style="font-family: arial, sans-serif; font-size: 16px;">&nbsp;of fungi.</span></p>\r\n', 4, 'months', 60, 2, '2016-11-18', '2017-03-17', '7-9', 'SUN', 'Centennial', 'Hello i am i wait for your course start', 10, 6, 'pending', 'pending', NULL, '2016-11-11 11:57:49', '2016-11-11 11:57:49', 3),
(35, 3, 7, 19, '<p>\r\n	<span style="font-weight: bold; color: rgb(106, 106, 106); font-family: arial, sans-serif; font-size: small;">Adobe Flash Player</span><span style="color: rgb(84, 84, 84); font-family: arial, sans-serif; font-size: small;">&nbsp;is the high performance, lightweight, highly expressive client runtime that delivers powerful and consistent user experiences across major.</span></p>\r\n', 2, 'months', 30, 2, '2016-11-19', '2017-01-18', '12-13', 'SUN', 'home', 'Hello i am wait for course to start', 10, 3, 'pending', 'pending', NULL, '2016-11-11 11:58:22', '2016-11-11 11:58:22', 3),
(36, 32, 9, 27, '<p>\r\n	<span style="font-family: arial, sans-serif; font-size: 16px;">System&nbsp;</span><b style="font-family: arial, sans-serif; font-size: 16px;">testing</b><span style="font-family: arial, sans-serif; font-size: 16px;">&nbsp;of software or hardware is&nbsp;</span><b style="font-family: arial, sans-serif; font-size: 16px;">testing</b><span style="font-family: arial, sans-serif; font-size: 16px;">&nbsp;conducted on a complete, integrated system to evaluate the system&#39;s compliance with its specified requirements</span></p>\r\n', 90, 'days', 200, 2, '2016-11-22', '2017-02-19', '10-12', 'SUN', 'online', 'Need Testing lession', 10, 20, 'completed', 'closed', 'Closed', '2016-11-22 10:18:09', '2016-11-22 10:19:53', 32),
(37, 104, 105, 13, '<p>\r\n	hfghdhdgfhdgfghdf</p>\r\n', 20, 'days', 20, 2, '2017-02-03', '2017-02-23', '2-4', 'SUN', 'online-bbb', 'gdfggdsgs', 10, 2, 'pending', 'approved', 'Approved online', '2017-02-03 15:47:37', '2017-02-03 15:48:01', 105),
(38, 3, 7, 16, '<p>\r\n	<b style="font-family: arial, sans-serif; font-size: 16px;">C#</b><span style="font-family: arial, sans-serif; font-size: 16px;">&nbsp;(pronounced &quot;</span><b style="font-family: arial, sans-serif; font-size: 16px;">C</b><span style="font-family: arial, sans-serif; font-size: 16px;">-</span><b style="font-family: arial, sans-serif; font-size: 16px;">sharp</b><span style="font-family: arial, sans-serif; font-size: 16px;">&quot;) is an object-oriented programming language from Microsoft that aims to combine the computing power of&nbsp;</span><b style="font-family: arial, sans-serif; font-size: 16px;">C</b><span style="font-family: arial, sans-serif; font-size: 16px;">++ with the programming ease of Visual Basic.&nbsp;</span><b style="font-family: arial, sans-serif; font-size: 16px;">C#</b><span style="font-family: arial, sans-serif; font-size: 16px;">&nbsp;is based on C++ and contains features similar to those of Java.</span></p>\r\n', 2, 'months', 40, 2, '2017-02-23', '2017-04-22', '7-9', 'SUN', 'online', 'Hi Admin and Tutor', 10, 4, 'pending', 'approved', '', '2017-02-16 18:33:48', '2017-02-16 18:40:46', 7);

-- --------------------------------------------------------

--
-- Table structure for table `pre_calendar_timezones`
--

CREATE TABLE `pre_calendar_timezones` (
  `CountryCode` char(2) NOT NULL,
  `Coordinates` char(15) NOT NULL,
  `TimeZone` char(32) NOT NULL,
  `Comments` varchar(85) NOT NULL,
  `UTC offset` char(8) NOT NULL,
  `UTC DST offset` char(8) NOT NULL,
  `Notes` varchar(79) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pre_calendar_timezones`
--

INSERT INTO `pre_calendar_timezones` (`CountryCode`, `Coordinates`, `TimeZone`, `Comments`, `UTC offset`, `UTC DST offset`, `Notes`) VALUES
('CI', '+0519-00402', 'Africa/Abidjan', '', '+00:00', '+00:00', ''),
('GH', '+0533-00013', 'Africa/Accra', '', '+00:00', '+00:00', ''),
('ET', '+0902+03842', 'Africa/Addis_Ababa', '', '+03:00', '+03:00', ''),
('DZ', '+3647+00303', 'Africa/Algiers', '', '+01:00', '+01:00', ''),
('ER', '+1520+03853', 'Africa/Asmara', '', '+03:00', '+03:00', ''),
('', '', 'Africa/Asmera', '', '+03:00', '+03:00', 'Link to Africa/Asmara'),
('ML', '+1239-00800', 'Africa/Bamako', '', '+00:00', '+00:00', ''),
('CF', '+0422+01835', 'Africa/Bangui', '', '+01:00', '+01:00', ''),
('GM', '+1328-01639', 'Africa/Banjul', '', '+00:00', '+00:00', ''),
('GW', '+1151-01535', 'Africa/Bissau', '', '+00:00', '+00:00', ''),
('MW', '-1547+03500', 'Africa/Blantyre', '', '+02:00', '+02:00', ''),
('CG', '-0416+01517', 'Africa/Brazzaville', '', '+01:00', '+01:00', ''),
('BI', '-0323+02922', 'Africa/Bujumbura', '', '+02:00', '+02:00', ''),
('EG', '+3003+03115', 'Africa/Cairo', '', '+02:00', '+02:00', 'DST has been canceled since 2011'),
('MA', '+3339-00735', 'Africa/Casablanca', '', '+00:00', '+01:00', ''),
('ES', '+3553-00519', 'Africa/Ceuta', 'Ceuta & Melilla', '+01:00', '+02:00', ''),
('GN', '+0931-01343', 'Africa/Conakry', '', '+00:00', '+00:00', ''),
('SN', '+1440-01726', 'Africa/Dakar', '', '+00:00', '+00:00', ''),
('TZ', '-0648+03917', 'Africa/Dar_es_Salaam', '', '+03:00', '+03:00', ''),
('DJ', '+1136+04309', 'Africa/Djibouti', '', '+03:00', '+03:00', ''),
('CM', '+0403+00942', 'Africa/Douala', '', '+01:00', '+01:00', ''),
('EH', '+2709-01312', 'Africa/El_Aaiun', '', '+00:00', '+00:00', ''),
('SL', '+0830-01315', 'Africa/Freetown', '', '+00:00', '+00:00', ''),
('BW', '-2439+02555', 'Africa/Gaborone', '', '+02:00', '+02:00', ''),
('ZW', '-1750+03103', 'Africa/Harare', '', '+02:00', '+02:00', ''),
('ZA', '-2615+02800', 'Africa/Johannesburg', '', '+02:00', '+02:00', ''),
('SS', '+0451+03136', 'Africa/Juba', '', '+03:00', '+03:00', ''),
('UG', '+0019+03225', 'Africa/Kampala', '', '+03:00', '+03:00', ''),
('SD', '+1536+03232', 'Africa/Khartoum', '', '+03:00', '+03:00', ''),
('RW', '-0157+03004', 'Africa/Kigali', '', '+02:00', '+02:00', ''),
('CD', '-0418+01518', 'Africa/Kinshasa', 'west Dem. Rep. of Congo', '+01:00', '+01:00', ''),
('NG', '+0627+00324', 'Africa/Lagos', '', '+01:00', '+01:00', ''),
('GA', '+0023+00927', 'Africa/Libreville', '', '+01:00', '+01:00', ''),
('TG', '+0608+00113', 'Africa/Lome', '', '+00:00', '+00:00', ''),
('AO', '-0848+01314', 'Africa/Luanda', '', '+01:00', '+01:00', ''),
('CD', '-1140+02728', 'Africa/Lubumbashi', 'east Dem. Rep. of Congo', '+02:00', '+02:00', ''),
('ZM', '-1525+02817', 'Africa/Lusaka', '', '+02:00', '+02:00', ''),
('GQ', '+0345+00847', 'Africa/Malabo', '', '+01:00', '+01:00', ''),
('MZ', '-2558+03235', 'Africa/Maputo', '', '+02:00', '+02:00', ''),
('LS', '-2928+02730', 'Africa/Maseru', '', '+02:00', '+02:00', ''),
('SZ', '-2618+03106', 'Africa/Mbabane', '', '+02:00', '+02:00', ''),
('SO', '+0204+04522', 'Africa/Mogadishu', '', '+03:00', '+03:00', ''),
('LR', '+0618-01047', 'Africa/Monrovia', '', '+00:00', '+00:00', ''),
('KE', '-0117+03649', 'Africa/Nairobi', '', '+03:00', '+03:00', ''),
('TD', '+1207+01503', 'Africa/Ndjamena', '', '+01:00', '+01:00', ''),
('NE', '+1331+00207', 'Africa/Niamey', '', '+01:00', '+01:00', ''),
('MR', '+1806-01557', 'Africa/Nouakchott', '', '+00:00', '+00:00', ''),
('BF', '+1222-00131', 'Africa/Ouagadougou', '', '+00:00', '+00:00', ''),
('BJ', '+0629+00237', 'Africa/Porto-Novo', '', '+01:00', '+01:00', ''),
('ST', '+0020+00644', 'Africa/Sao_Tome', '', '+00:00', '+00:00', ''),
('', '', 'Africa/Timbuktu', '', '+00:00', '+00:00', 'Link to Africa/Bamako'),
('LY', '+3254+01311', 'Africa/Tripoli', '', '+01:00', '+02:00', ''),
('TN', '+3648+01011', 'Africa/Tunis', '', '+01:00', '+01:00', ''),
('NA', '-2234+01706', 'Africa/Windhoek', '', '+01:00', '+02:00', ''),
('', '', 'AKST9AKDT', '', '−09:00', '−08:00', 'Link to America/Anchorage'),
('US', '+515248-1763929', 'America/Adak', 'Aleutian Islands', '−10:00', '−09:00', ''),
('US', '+611305-1495401', 'America/Anchorage', 'Alaska Time', '−09:00', '−08:00', ''),
('AI', '+1812-06304', 'America/Anguilla', '', '−04:00', '−04:00', ''),
('AG', '+1703-06148', 'America/Antigua', '', '−04:00', '−04:00', ''),
('BR', '-0712-04812', 'America/Araguaina', 'Tocantins', '−03:00', '−03:00', ''),
('AR', '-3436-05827', 'America/Argentina/Buenos_Aires', 'Buenos Aires (BA, CF)', '−03:00', '−03:00', ''),
('AR', '-2828-06547', 'America/Argentina/Catamarca', 'Catamarca (CT), Chubut (CH)', '−03:00', '−03:00', ''),
('', '', 'America/Argentina/ComodRivadavia', '', '−03:00', '−03:00', 'Link to America/Argentina/Catamarca'),
('AR', '-3124-06411', 'America/Argentina/Cordoba', 'most locations (CB, CC, CN, ER, FM, MN, SE, SF)', '−03:00', '−03:00', ''),
('AR', '-2411-06518', 'America/Argentina/Jujuy', 'Jujuy (JY)', '−03:00', '−03:00', ''),
('AR', '-2926-06651', 'America/Argentina/La_Rioja', 'La Rioja (LR)', '−03:00', '−03:00', ''),
('AR', '-3253-06849', 'America/Argentina/Mendoza', 'Mendoza (MZ)', '−03:00', '−03:00', ''),
('AR', '-5138-06913', 'America/Argentina/Rio_Gallegos', 'Santa Cruz (SC)', '−03:00', '−03:00', ''),
('AR', '-2447-06525', 'America/Argentina/Salta', '(SA, LP, NQ, RN)', '−03:00', '−03:00', ''),
('AR', '-3132-06831', 'America/Argentina/San_Juan', 'San Juan (SJ)', '−03:00', '−03:00', ''),
('AR', '-3319-06621', 'America/Argentina/San_Luis', 'San Luis (SL)', '−03:00', '−03:00', ''),
('AR', '-2649-06513', 'America/Argentina/Tucuman', 'Tucuman (TM)', '−03:00', '−03:00', ''),
('AR', '-5448-06818', 'America/Argentina/Ushuaia', 'Tierra del Fuego (TF)', '−03:00', '−03:00', ''),
('AW', '+1230-06958', 'America/Aruba', '', '−04:00', '−04:00', ''),
('PY', '-2516-05740', 'America/Asuncion', '', '−04:00', '−03:00', ''),
('CA', '+484531-0913718', 'America/Atikokan', 'Eastern Standard Time - Atikokan, Ontario and Southampton I, Nunavut', '−05:00', '−05:00', ''),
('', '', 'America/Atka', '', '−10:00', '−09:00', 'Link to America/Adak'),
('BR', '-1259-03831', 'America/Bahia', 'Bahia', '−03:00', '−03:00', ''),
('MX', '+2048-10515', 'America/Bahia_Banderas', 'Mexican Central Time - Bahia de Banderas', '−06:00', '−05:00', ''),
('BB', '+1306-05937', 'America/Barbados', '', '−04:00', '−04:00', ''),
('BR', '-0127-04829', 'America/Belem', 'Amapa, E Para', '−03:00', '−03:00', ''),
('BZ', '+1730-08812', 'America/Belize', '', '−06:00', '−06:00', ''),
('CA', '+5125-05707', 'America/Blanc-Sablon', 'Atlantic Standard Time - Quebec - Lower North Shore', '−04:00', '−04:00', ''),
('BR', '+0249-06040', 'America/Boa_Vista', 'Roraima', '−04:00', '−04:00', ''),
('CO', '+0436-07405', 'America/Bogota', '', '−05:00', '−05:00', ''),
('US', '+433649-1161209', 'America/Boise', 'Mountain Time - south Idaho & east Oregon', '−07:00', '−06:00', ''),
('', '', 'America/Buenos_Aires', '', '−03:00', '−03:00', 'Link to America/Argentina/Buenos_Aires'),
('CA', '+690650-1050310', 'America/Cambridge_Bay', 'Mountain Time - west Nunavut', '−07:00', '−06:00', ''),
('BR', '-2027-05437', 'America/Campo_Grande', 'Mato Grosso do Sul', '−04:00', '−03:00', ''),
('MX', '+2105-08646', 'America/Cancun', 'Central Time - Quintana Roo', '−06:00', '−05:00', ''),
('VE', '+1030-06656', 'America/Caracas', '', '−04:30', '−04:30', ''),
('', '', 'America/Catamarca', '', '−03:00', '−03:00', 'Link to America/Argentina/Catamarca'),
('GF', '+0456-05220', 'America/Cayenne', '', '−03:00', '−03:00', ''),
('KY', '+1918-08123', 'America/Cayman', '', '−05:00', '−05:00', ''),
('US', '+415100-0873900', 'America/Chicago', 'Central Time', '−06:00', '−05:00', ''),
('MX', '+2838-10605', 'America/Chihuahua', 'Mexican Mountain Time - Chihuahua away from US border', '−07:00', '−06:00', ''),
('', '', 'America/Coral_Harbour', '', '−05:00', '−05:00', 'Link to America/Atikokan'),
('', '', 'America/Cordoba', '', '−03:00', '−03:00', 'Link to America/Argentina/Cordoba'),
('CR', '+0956-08405', 'America/Costa_Rica', '', '−06:00', '−06:00', ''),
('CA', '+4906-11631', 'America/Creston', 'Mountain Standard Time - Creston, British Columbia', '−07:00', '−07:00', ''),
('BR', '-1535-05605', 'America/Cuiaba', 'Mato Grosso', '−04:00', '−03:00', ''),
('CW', '+1211-06900', 'America/Curacao', '', '−04:00', '−04:00', ''),
('GL', '+7646-01840', 'America/Danmarkshavn', 'east coast, north of Scoresbysund', '+00:00', '+00:00', ''),
('CA', '+6404-13925', 'America/Dawson', 'Pacific Time - north Yukon', '−08:00', '−07:00', ''),
('CA', '+5946-12014', 'America/Dawson_Creek', 'Mountain Standard Time - Dawson Creek & Fort Saint John, British Columbia', '−07:00', '−07:00', ''),
('US', '+394421-1045903', 'America/Denver', 'Mountain Time', '−07:00', '−06:00', ''),
('US', '+421953-0830245', 'America/Detroit', 'Eastern Time - Michigan - most locations', '−05:00', '−04:00', ''),
('DM', '+1518-06124', 'America/Dominica', '', '−04:00', '−04:00', ''),
('CA', '+5333-11328', 'America/Edmonton', 'Mountain Time - Alberta, east British Columbia & west Saskatchewan', '−07:00', '−06:00', ''),
('BR', '-0640-06952', 'America/Eirunepe', 'W Amazonas', '−04:00', '−04:00', ''),
('SV', '+1342-08912', 'America/El_Salvador', '', '−06:00', '−06:00', ''),
('', '', 'America/Ensenada', '', '−08:00', '−07:00', 'Link to America/Tijuana'),
('BR', '-0343-03830', 'America/Fortaleza', 'NE Brazil (MA, PI, CE, RN, PB)', '−03:00', '−03:00', ''),
('', '', 'America/Fort_Wayne', '', '−05:00', '−04:00', 'Link to America/Indiana/Indianapolis'),
('CA', '+4612-05957', 'America/Glace_Bay', 'Atlantic Time - Nova Scotia - places that did not observe DST 1966-1971', '−04:00', '−03:00', ''),
('GL', '+6411-05144', 'America/Godthab', 'most locations', '−03:00', '−02:00', ''),
('CA', '+5320-06025', 'America/Goose_Bay', 'Atlantic Time - Labrador - most locations', '−04:00', '−03:00', ''),
('TC', '+2128-07108', 'America/Grand_Turk', '', '−05:00', '−04:00', ''),
('GD', '+1203-06145', 'America/Grenada', '', '−04:00', '−04:00', ''),
('GP', '+1614-06132', 'America/Guadeloupe', '', '−04:00', '−04:00', ''),
('GT', '+1438-09031', 'America/Guatemala', '', '−06:00', '−06:00', ''),
('EC', '-0210-07950', 'America/Guayaquil', 'mainland', '−05:00', '−05:00', ''),
('GY', '+0648-05810', 'America/Guyana', '', '−04:00', '−04:00', ''),
('CA', '+4439-06336', 'America/Halifax', 'Atlantic Time - Nova Scotia (most places), PEI', '−04:00', '−03:00', ''),
('CU', '+2308-08222', 'America/Havana', '', '−05:00', '−04:00', ''),
('MX', '+2904-11058', 'America/Hermosillo', 'Mountain Standard Time - Sonora', '−07:00', '−07:00', ''),
('US', '+394606-0860929', 'America/Indiana/Indianapolis', 'Eastern Time - Indiana - most locations', '−05:00', '−04:00', ''),
('US', '+411745-0863730', 'America/Indiana/Knox', 'Central Time - Indiana - Starke County', '−06:00', '−05:00', ''),
('US', '+382232-0862041', 'America/Indiana/Marengo', 'Eastern Time - Indiana - Crawford County', '−05:00', '−04:00', ''),
('US', '+382931-0871643', 'America/Indiana/Petersburg', 'Eastern Time - Indiana - Pike County', '−05:00', '−04:00', ''),
('US', '+375711-0864541', 'America/Indiana/Tell_City', 'Central Time - Indiana - Perry County', '−06:00', '−05:00', ''),
('US', '+384452-0850402', 'America/Indiana/Vevay', 'Eastern Time - Indiana - Switzerland County', '−05:00', '−04:00', ''),
('US', '+384038-0873143', 'America/Indiana/Vincennes', 'Eastern Time - Indiana - Daviess, Dubois, Knox & Martin Counties', '−05:00', '−04:00', ''),
('US', '+410305-0863611', 'America/Indiana/Winamac', 'Eastern Time - Indiana - Pulaski County', '−05:00', '−04:00', ''),
('', '', 'America/Indianapolis', '', '−05:00', '−04:00', 'Link to America/Indiana/Indianapolis'),
('CA', '+682059-1334300', 'America/Inuvik', 'Mountain Time - west Northwest Territories', '−07:00', '−06:00', ''),
('CA', '+6344-06828', 'America/Iqaluit', 'Eastern Time - east Nunavut - most locations', '−05:00', '−04:00', ''),
('JM', '+1800-07648', 'America/Jamaica', '', '−05:00', '−05:00', ''),
('', '', 'America/Jujuy', '', '−03:00', '−03:00', 'Link to America/Argentina/Jujuy'),
('US', '+581807-1342511', 'America/Juneau', 'Alaska Time - Alaska panhandle', '−09:00', '−08:00', ''),
('US', '+381515-0854534', 'America/Kentucky/Louisville', 'Eastern Time - Kentucky - Louisville area', '−05:00', '−04:00', ''),
('US', '+364947-0845057', 'America/Kentucky/Monticello', 'Eastern Time - Kentucky - Wayne County', '−05:00', '−04:00', ''),
('', '', 'America/Knox_IN', '', '−06:00', '−05:00', 'Link to America/Indiana/Knox'),
('BQ', '+120903-0681636', 'America/Kralendijk', '', '−04:00', '−04:00', 'Link to America/Curacao'),
('BO', '-1630-06809', 'America/La_Paz', '', '−04:00', '−04:00', ''),
('PE', '-1203-07703', 'America/Lima', '', '−05:00', '−05:00', ''),
('US', '+340308-1181434', 'America/Los_Angeles', 'Pacific Time', '−08:00', '−07:00', ''),
('', '', 'America/Louisville', '', '−05:00', '−04:00', 'Link to America/Kentucky/Louisville'),
('SX', '+180305-0630250', 'America/Lower_Princes', '', '−04:00', '−04:00', 'Link to America/Curacao'),
('BR', '-0940-03543', 'America/Maceio', 'Alagoas, Sergipe', '−03:00', '−03:00', ''),
('NI', '+1209-08617', 'America/Managua', '', '−06:00', '−06:00', ''),
('BR', '-0308-06001', 'America/Manaus', 'E Amazonas', '−04:00', '−04:00', ''),
('MF', '+1804-06305', 'America/Marigot', '', '−04:00', '−04:00', 'Link to America/Guadeloupe'),
('MQ', '+1436-06105', 'America/Martinique', '', '−04:00', '−04:00', ''),
('MX', '+2550-09730', 'America/Matamoros', 'US Central Time - Coahuila, Durango, Nuevo León, Tamaulipas near US border', '−06:00', '−05:00', ''),
('MX', '+2313-10625', 'America/Mazatlan', 'Mountain Time - S Baja, Nayarit, Sinaloa', '−07:00', '−06:00', ''),
('', '', 'America/Mendoza', '', '−03:00', '−03:00', 'Link to America/Argentina/Mendoza'),
('US', '+450628-0873651', 'America/Menominee', 'Central Time - Michigan - Dickinson, Gogebic, Iron & Menominee Counties', '−06:00', '−05:00', ''),
('MX', '+2058-08937', 'America/Merida', 'Central Time - Campeche, Yucatán', '−06:00', '−05:00', ''),
('US', '+550737-1313435', 'America/Metlakatla', 'Metlakatla Time - Annette Island', '−08:00', '−08:00', ''),
('MX', '+1924-09909', 'America/Mexico_City', 'Central Time - most locations', '−06:00', '−05:00', ''),
('PM', '+4703-05620', 'America/Miquelon', '', '−03:00', '−02:00', ''),
('CA', '+4606-06447', 'America/Moncton', 'Atlantic Time - New Brunswick', '−04:00', '−03:00', ''),
('MX', '+2540-10019', 'America/Monterrey', 'Mexican Central Time - Coahuila, Durango, Nuevo León, Tamaulipas away from US border', '−06:00', '−05:00', ''),
('UY', '-3453-05611', 'America/Montevideo', '', '−03:00', '−02:00', ''),
('CA', '+4531-07334', 'America/Montreal', 'Eastern Time - Quebec - most locations', '−05:00', '−04:00', ''),
('MS', '+1643-06213', 'America/Montserrat', '', '−04:00', '−04:00', ''),
('BS', '+2505-07721', 'America/Nassau', '', '−05:00', '−04:00', ''),
('US', '+404251-0740023', 'America/New_York', 'Eastern Time', '−05:00', '−04:00', ''),
('CA', '+4901-08816', 'America/Nipigon', 'Eastern Time - Ontario & Quebec - places that did not observe DST 1967-1973', '−05:00', '−04:00', ''),
('US', '+643004-1652423', 'America/Nome', 'Alaska Time - west Alaska', '−09:00', '−08:00', ''),
('BR', '-0351-03225', 'America/Noronha', 'Atlantic islands', '−02:00', '−02:00', ''),
('US', '+471551-1014640', 'America/North_Dakota/Beulah', 'Central Time - North Dakota - Mercer County', '−06:00', '−05:00', ''),
('US', '+470659-1011757', 'America/North_Dakota/Center', 'Central Time - North Dakota - Oliver County', '−06:00', '−05:00', ''),
('US', '+465042-1012439', 'America/North_Dakota/New_Salem', 'Central Time - North Dakota - Morton County (except Mandan area)', '−06:00', '−05:00', ''),
('MX', '+2934-10425', 'America/Ojinaga', 'US Mountain Time - Chihuahua near US border', '−07:00', '−06:00', ''),
('PA', '+0858-07932', 'America/Panama', '', '−05:00', '−05:00', ''),
('CA', '+6608-06544', 'America/Pangnirtung', 'Eastern Time - Pangnirtung, Nunavut', '−05:00', '−04:00', ''),
('SR', '+0550-05510', 'America/Paramaribo', '', '−03:00', '−03:00', ''),
('US', '+332654-1120424', 'America/Phoenix', 'Mountain Standard Time - Arizona', '−07:00', '−07:00', ''),
('HT', '+1832-07220', 'America/Port-au-Prince', '', '−05:00', '−04:00', ''),
('', '', 'America/Porto_Acre', '', '−04:00', '−04:00', 'Link to America/Rio_Branco'),
('BR', '-0846-06354', 'America/Porto_Velho', 'Rondonia', '−04:00', '−04:00', ''),
('TT', '+1039-06131', 'America/Port_of_Spain', '', '−04:00', '−04:00', ''),
('PR', '+182806-0660622', 'America/Puerto_Rico', '', '−04:00', '−04:00', ''),
('CA', '+4843-09434', 'America/Rainy_River', 'Central Time - Rainy River & Fort Frances, Ontario', '−06:00', '−05:00', ''),
('CA', '+624900-0920459', 'America/Rankin_Inlet', 'Central Time - central Nunavut', '−06:00', '−05:00', ''),
('BR', '-0803-03454', 'America/Recife', 'Pernambuco', '−03:00', '−03:00', ''),
('CA', '+5024-10439', 'America/Regina', 'Central Standard Time - Saskatchewan - most locations', '−06:00', '−06:00', ''),
('CA', '+744144-0944945', 'America/Resolute', 'Central Standard Time - Resolute, Nunavut', '−06:00', '−05:00', ''),
('BR', '-0958-06748', 'America/Rio_Branco', 'Acre', '−04:00', '−04:00', ''),
('', '', 'America/Rosario', '', '−03:00', '−03:00', 'Link to America/Argentina/Cordoba'),
('BR', '-0226-05452', 'America/Santarem', 'W Para', '−03:00', '−03:00', ''),
('MX', '+3018-11452', 'America/Santa_Isabel', 'Mexican Pacific Time - Baja California away from US border', '−08:00', '−07:00', ''),
('CL', '-3327-07040', 'America/Santiago', 'most locations', '−04:00', '−03:00', ''),
('DO', '+1828-06954', 'America/Santo_Domingo', '', '−04:00', '−04:00', ''),
('BR', '-2332-04637', 'America/Sao_Paulo', 'S & SE Brazil (GO, DF, MG, ES, RJ, SP, PR, SC, RS)', '−03:00', '−02:00', ''),
('GL', '+7029-02158', 'America/Scoresbysund', 'Scoresbysund / Ittoqqortoormiit', '−01:00', '+00:00', ''),
('US', '+364708-1084111', 'America/Shiprock', 'Mountain Time - Navajo', '−07:00', '−06:00', 'Link to America/Denver'),
('US', '+571035-1351807', 'America/Sitka', 'Alaska Time - southeast Alaska panhandle', '−09:00', '−08:00', ''),
('BL', '+1753-06251', 'America/St_Barthelemy', '', '−04:00', '−04:00', 'Link to America/Guadeloupe'),
('CA', '+4734-05243', 'America/St_Johns', 'Newfoundland Time, including SE Labrador', '−03:30', '−02:30', ''),
('KN', '+1718-06243', 'America/St_Kitts', '', '−04:00', '−04:00', ''),
('LC', '+1401-06100', 'America/St_Lucia', '', '−04:00', '−04:00', ''),
('VI', '+1821-06456', 'America/St_Thomas', '', '−04:00', '−04:00', ''),
('VC', '+1309-06114', 'America/St_Vincent', '', '−04:00', '−04:00', ''),
('CA', '+5017-10750', 'America/Swift_Current', 'Central Standard Time - Saskatchewan - midwest', '−06:00', '−06:00', ''),
('HN', '+1406-08713', 'America/Tegucigalpa', '', '−06:00', '−06:00', ''),
('GL', '+7634-06847', 'America/Thule', 'Thule / Pituffik', '−04:00', '−03:00', ''),
('CA', '+4823-08915', 'America/Thunder_Bay', 'Eastern Time - Thunder Bay, Ontario', '−05:00', '−04:00', ''),
('MX', '+3232-11701', 'America/Tijuana', 'US Pacific Time - Baja California near US border', '−08:00', '−07:00', ''),
('CA', '+4339-07923', 'America/Toronto', 'Eastern Time - Ontario - most locations', '−05:00', '−04:00', ''),
('VG', '+1827-06437', 'America/Tortola', '', '−04:00', '−04:00', ''),
('CA', '+4916-12307', 'America/Vancouver', 'Pacific Time - west British Columbia', '−08:00', '−07:00', ''),
('', '', 'America/Virgin', '', '−04:00', '−04:00', 'Link to America/St_Thomas'),
('CA', '+6043-13503', 'America/Whitehorse', 'Pacific Time - south Yukon', '−08:00', '−07:00', ''),
('CA', '+4953-09709', 'America/Winnipeg', 'Central Time - Manitoba & west Ontario', '−06:00', '−05:00', ''),
('US', '+593249-1394338', 'America/Yakutat', 'Alaska Time - Alaska panhandle neck', '−09:00', '−08:00', ''),
('CA', '+6227-11421', 'America/Yellowknife', 'Mountain Time - central Northwest Territories', '−07:00', '−06:00', ''),
('AQ', '-6617+11031', 'Antarctica/Casey', 'Casey Station, Bailey Peninsula', '+11:00', '+08:00', ''),
('AQ', '-6835+07758', 'Antarctica/Davis', 'Davis Station, Vestfold Hills', '+05:00', '+07:00', ''),
('AQ', '-6640+14001', 'Antarctica/DumontDUrville', 'Dumont-d\'Urville Station, Terre Adelie', '+10:00', '+10:00', ''),
('AQ', '-5430+15857', 'Antarctica/Macquarie', 'Macquarie Island Station, Macquarie Island', '+11:00', '+11:00', ''),
('AQ', '-6736+06253', 'Antarctica/Mawson', 'Mawson Station, Holme Bay', '+05:00', '+05:00', ''),
('AQ', '-7750+16636', 'Antarctica/McMurdo', 'McMurdo Station, Ross Island', '+12:00', '+13:00', ''),
('AQ', '-6448-06406', 'Antarctica/Palmer', 'Palmer Station, Anvers Island', '−04:00', '−03:00', ''),
('AQ', '-6734-06808', 'Antarctica/Rothera', 'Rothera Station, Adelaide Island', '−03:00', '−03:00', ''),
('AQ', '-9000+00000', 'Antarctica/South_Pole', 'Amundsen-Scott Station, South Pole', '+12:00', '+13:00', 'Link to Antarctica/McMurdo'),
('AQ', '-690022+0393524', 'Antarctica/Syowa', 'Syowa Station, E Ongul I', '+03:00', '+03:00', ''),
('AQ', '-7824+10654', 'Antarctica/Vostok', 'Vostok Station, Lake Vostok', '+06:00', '+06:00', ''),
('SJ', '+7800+01600', 'Arctic/Longyearbyen', '', '+01:00', '+02:00', 'Link to Europe/Oslo'),
('YE', '+1245+04512', 'Asia/Aden', '', '+03:00', '+03:00', ''),
('KZ', '+4315+07657', 'Asia/Almaty', 'most locations', '+06:00', '+06:00', ''),
('JO', '+3157+03556', 'Asia/Amman', '', '+03:00', '+03:00', ''),
('RU', '+6445+17729', 'Asia/Anadyr', 'Moscow+08 - Bering Sea', '+12:00', '+12:00', ''),
('KZ', '+4431+05016', 'Asia/Aqtau', 'Atyrau (Atirau, Gur\'yev), Mangghystau (Mankistau)', '+05:00', '+05:00', ''),
('KZ', '+5017+05710', 'Asia/Aqtobe', 'Aqtobe (Aktobe)', '+05:00', '+05:00', ''),
('TM', '+3757+05823', 'Asia/Ashgabat', '', '+05:00', '+05:00', ''),
('', '', 'Asia/Ashkhabad', '', '+05:00', '+05:00', 'Link to Asia/Ashgabat'),
('IQ', '+3321+04425', 'Asia/Baghdad', '', '+03:00', '+03:00', ''),
('BH', '+2623+05035', 'Asia/Bahrain', '', '+03:00', '+03:00', ''),
('AZ', '+4023+04951', 'Asia/Baku', '', '+04:00', '+05:00', ''),
('TH', '+1345+10031', 'Asia/Bangkok', '', '+07:00', '+07:00', ''),
('LB', '+3353+03530', 'Asia/Beirut', '', '+02:00', '+03:00', ''),
('KG', '+4254+07436', 'Asia/Bishkek', '', '+06:00', '+06:00', ''),
('BN', '+0456+11455', 'Asia/Brunei', '', '+08:00', '+08:00', ''),
('', '', 'Asia/Calcutta', '', '+05:30', '+05:30', 'Link to Asia/Kolkata'),
('MN', '+4804+11430', 'Asia/Choibalsan', 'Dornod, Sukhbaatar', '+08:00', '+08:00', ''),
('CN', '+2934+10635', 'Asia/Chongqing', 'central China - Sichuan, Yunnan, Guangxi, Shaanxi, Guizhou, etc.', '+08:00', '+08:00', 'Covering historic Kansu-Szechuan time zone.'),
('', '', 'Asia/Chungking', '', '+08:00', '+08:00', 'Link to Asia/Chongqing'),
('LK', '+0656+07951', 'Asia/Colombo', '', '+05:30', '+05:30', ''),
('', '', 'Asia/Dacca', '', '+06:00', '+06:00', 'Link to Asia/Dhaka'),
('SY', '+3330+03618', 'Asia/Damascus', '', '+02:00', '+03:00', ''),
('BD', '+2343+09025', 'Asia/Dhaka', '', '+06:00', '+06:00', ''),
('TL', '-0833+12535', 'Asia/Dili', '', '+09:00', '+09:00', ''),
('AE', '+2518+05518', 'Asia/Dubai', '', '+04:00', '+04:00', ''),
('TJ', '+3835+06848', 'Asia/Dushanbe', '', '+05:00', '+05:00', ''),
('PS', '+3130+03428', 'Asia/Gaza', 'Gaza Strip', '+02:00', '+03:00', ''),
('CN', '+4545+12641', 'Asia/Harbin', 'Heilongjiang (except Mohe), Jilin', '+08:00', '+08:00', 'Covering historic Changpai time zone.'),
('PS', '+313200+0350542', 'Asia/Hebron', 'West Bank', '+02:00', '+03:00', ''),
('HK', '+2217+11409', 'Asia/Hong_Kong', '', '+08:00', '+08:00', ''),
('MN', '+4801+09139', 'Asia/Hovd', 'Bayan-Olgiy, Govi-Altai, Hovd, Uvs, Zavkhan', '+07:00', '+07:00', ''),
('VN', '+1045+10640', 'Asia/Ho_Chi_Minh', '', '+07:00', '+07:00', ''),
('RU', '+5216+10420', 'Asia/Irkutsk', 'Moscow+05 - Lake Baikal', '+09:00', '+09:00', ''),
('', '', 'Asia/Istanbul', '', '+02:00', '+03:00', 'Link to Europe/Istanbul'),
('ID', '-0610+10648', 'Asia/Jakarta', 'Java & Sumatra', '+07:00', '+07:00', ''),
('ID', '-0232+14042', 'Asia/Jayapura', 'west New Guinea (Irian Jaya) & Malukus (Moluccas)', '+09:00', '+09:00', ''),
('IL', '+3146+03514', 'Asia/Jerusalem', '', '+02:00', '+03:00', ''),
('AF', '+3431+06912', 'Asia/Kabul', '', '+04:30', '+04:30', ''),
('RU', '+5301+15839', 'Asia/Kamchatka', 'Moscow+08 - Kamchatka', '+12:00', '+12:00', ''),
('PK', '+2452+06703', 'Asia/Karachi', '', '+05:00', '+05:00', ''),
('CN', '+3929+07559', 'Asia/Kashgar', 'west Tibet & Xinjiang', '+08:00', '+08:00', 'Covering historic Kunlun time zone.'),
('NP', '+2743+08519', 'Asia/Kathmandu', '', '+05:45', '+05:45', ''),
('', '', 'Asia/Katmandu', '', '+05:45', '+05:45', 'Link to Asia/Kathmandu'),
('IN', '+2232+08822', 'Asia/Kolkata', '', '+05:30', '+05:30', 'Note: Different zones in history, see Time in India.'),
('RU', '+5601+09250', 'Asia/Krasnoyarsk', 'Moscow+04 - Yenisei River', '+08:00', '+08:00', ''),
('MY', '+0310+10142', 'Asia/Kuala_Lumpur', 'peninsular Malaysia', '+08:00', '+08:00', ''),
('MY', '+0133+11020', 'Asia/Kuching', 'Sabah & Sarawak', '+08:00', '+08:00', ''),
('KW', '+2920+04759', 'Asia/Kuwait', '', '+03:00', '+03:00', ''),
('', '', 'Asia/Macao', '', '+08:00', '+08:00', 'Link to Asia/Macau'),
('MO', '+2214+11335', 'Asia/Macau', '', '+08:00', '+08:00', ''),
('RU', '+5934+15048', 'Asia/Magadan', 'Moscow+08 - Magadan', '+12:00', '+12:00', ''),
('ID', '-0507+11924', 'Asia/Makassar', 'east & south Borneo, Sulawesi (Celebes), Bali, Nusa Tenggara, west Timor', '+08:00', '+08:00', ''),
('PH', '+1435+12100', 'Asia/Manila', '', '+08:00', '+08:00', ''),
('OM', '+2336+05835', 'Asia/Muscat', '', '+04:00', '+04:00', ''),
('CY', '+3510+03322', 'Asia/Nicosia', '', '+02:00', '+03:00', ''),
('RU', '+5345+08707', 'Asia/Novokuznetsk', 'Moscow+03 - Novokuznetsk', '+07:00', '+07:00', ''),
('RU', '+5502+08255', 'Asia/Novosibirsk', 'Moscow+03 - Novosibirsk', '+07:00', '+07:00', ''),
('RU', '+5500+07324', 'Asia/Omsk', 'Moscow+03 - west Siberia', '+07:00', '+07:00', ''),
('KZ', '+5113+05121', 'Asia/Oral', 'West Kazakhstan', '+05:00', '+05:00', ''),
('KH', '+1133+10455', 'Asia/Phnom_Penh', '', '+07:00', '+07:00', ''),
('ID', '-0002+10920', 'Asia/Pontianak', 'west & central Borneo', '+07:00', '+07:00', ''),
('KP', '+3901+12545', 'Asia/Pyongyang', '', '+09:00', '+09:00', ''),
('QA', '+2517+05132', 'Asia/Qatar', '', '+03:00', '+03:00', ''),
('KZ', '+4448+06528', 'Asia/Qyzylorda', 'Qyzylorda (Kyzylorda, Kzyl-Orda)', '+06:00', '+06:00', ''),
('MM', '+1647+09610', 'Asia/Rangoon', '', '+06:30', '+06:30', ''),
('SA', '+2438+04643', 'Asia/Riyadh', '', '+03:00', '+03:00', ''),
('', '', 'Asia/Saigon', '', '+07:00', '+07:00', 'Link to Asia/Ho_Chi_Minh'),
('RU', '+4658+14242', 'Asia/Sakhalin', 'Moscow+07 - Sakhalin Island', '+11:00', '+11:00', ''),
('UZ', '+3940+06648', 'Asia/Samarkand', 'west Uzbekistan', '+05:00', '+05:00', ''),
('KR', '+3733+12658', 'Asia/Seoul', '', '+09:00', '+09:00', ''),
('CN', '+3114+12128', 'Asia/Shanghai', 'east China - Beijing, Guangdong, Shanghai, etc.', '+08:00', '+08:00', 'Covering historic Chungyuan time zone.'),
('SG', '+0117+10351', 'Asia/Singapore', '', '+08:00', '+08:00', ''),
('TW', '+2503+12130', 'Asia/Taipei', '', '+08:00', '+08:00', ''),
('UZ', '+4120+06918', 'Asia/Tashkent', 'east Uzbekistan', '+05:00', '+05:00', ''),
('GE', '+4143+04449', 'Asia/Tbilisi', '', '+04:00', '+04:00', ''),
('IR', '+3540+05126', 'Asia/Tehran', '', '+03:30', '+04:30', ''),
('', '', 'Asia/Tel_Aviv', '', '+02:00', '+03:00', 'Link to Asia/Jerusalem'),
('', '', 'Asia/Thimbu', '', '+06:00', '+06:00', 'Link to Asia/Thimphu'),
('BT', '+2728+08939', 'Asia/Thimphu', '', '+06:00', '+06:00', ''),
('JP', '+353916+1394441', 'Asia/Tokyo', '', '+09:00', '+09:00', ''),
('', '', 'Asia/Ujung_Pandang', '', '+08:00', '+08:00', 'Link to Asia/Makassar'),
('MN', '+4755+10653', 'Asia/Ulaanbaatar', 'most locations', '+08:00', '+08:00', ''),
('', '', 'Asia/Ulan_Bator', '', '+08:00', '+08:00', 'Link to Asia/Ulaanbaatar'),
('CN', '+4348+08735', 'Asia/Urumqi', 'most of Tibet & Xinjiang', '+08:00', '+08:00', 'Covering historic Sinkiang-Tibet time zone.'),
('LA', '+1758+10236', 'Asia/Vientiane', '', '+07:00', '+07:00', ''),
('RU', '+4310+13156', 'Asia/Vladivostok', 'Moscow+07 - Amur River', '+11:00', '+11:00', ''),
('RU', '+6200+12940', 'Asia/Yakutsk', 'Moscow+06 - Lena River', '+10:00', '+10:00', ''),
('RU', '+5651+06036', 'Asia/Yekaterinburg', 'Moscow+02 - Urals', '+06:00', '+06:00', ''),
('AM', '+4011+04430', 'Asia/Yerevan', '', '+04:00', '+04:00', ''),
('PT', '+3744-02540', 'Atlantic/Azores', 'Azores', '−01:00', '+00:00', ''),
('BM', '+3217-06446', 'Atlantic/Bermuda', '', '−04:00', '−03:00', ''),
('ES', '+2806-01524', 'Atlantic/Canary', 'Canary Islands', '+00:00', '+01:00', ''),
('CV', '+1455-02331', 'Atlantic/Cape_Verde', '', '−01:00', '−01:00', ''),
('', '', 'Atlantic/Faeroe', '', '+00:00', '+01:00', 'Link to Atlantic/Faroe'),
('FO', '+6201-00646', 'Atlantic/Faroe', '', '+00:00', '+01:00', ''),
('', '', 'Atlantic/Jan_Mayen', '', '+01:00', '+02:00', 'Link to Europe/Oslo'),
('PT', '+3238-01654', 'Atlantic/Madeira', 'Madeira Islands', '+00:00', '+01:00', ''),
('IS', '+6409-02151', 'Atlantic/Reykjavik', '', '+00:00', '+00:00', ''),
('GS', '-5416-03632', 'Atlantic/South_Georgia', '', '−02:00', '−02:00', ''),
('FK', '-5142-05751', 'Atlantic/Stanley', '', '−03:00', '−03:00', ''),
('SH', '-1555-00542', 'Atlantic/St_Helena', '', '+00:00', '+00:00', ''),
('', '', 'Australia/ACT', '', '+10:00', '+11:00', 'Link to Australia/Sydney'),
('AU', '-3455+13835', 'Australia/Adelaide', 'South Australia', '+09:30', '+10:30', ''),
('AU', '-2728+15302', 'Australia/Brisbane', 'Queensland - most locations', '+10:00', '+10:00', ''),
('AU', '-3157+14127', 'Australia/Broken_Hill', 'New South Wales - Yancowinna', '+09:30', '+10:30', ''),
('', '', 'Australia/Canberra', '', '+10:00', '+11:00', 'Link to Australia/Sydney'),
('AU', '-3956+14352', 'Australia/Currie', 'Tasmania - King Island', '+10:00', '+11:00', ''),
('AU', '-1228+13050', 'Australia/Darwin', 'Northern Territory', '+09:30', '+09:30', ''),
('AU', '-3143+12852', 'Australia/Eucla', 'Western Australia - Eucla area', '+08:45', '+08:45', ''),
('AU', '-4253+14719', 'Australia/Hobart', 'Tasmania - most locations', '+10:00', '+11:00', ''),
('', '', 'Australia/LHI', '', '+10:30', '+11:00', 'Link to Australia/Lord_Howe'),
('AU', '-2016+14900', 'Australia/Lindeman', 'Queensland - Holiday Islands', '+10:00', '+10:00', ''),
('AU', '-3133+15905', 'Australia/Lord_Howe', 'Lord Howe Island', '+10:30', '+11:00', ''),
('AU', '-3749+14458', 'Australia/Melbourne', 'Victoria', '+10:00', '+11:00', ''),
('', '', 'Australia/North', '', '+09:30', '+09:30', 'Link to Australia/Darwin'),
('', '', 'Australia/NSW', '', '+10:00', '+11:00', 'Link to Australia/Sydney'),
('AU', '-3157+11551', 'Australia/Perth', 'Western Australia - most locations', '+08:00', '+08:00', ''),
('', '', 'Australia/Queensland', '', '+10:00', '+10:00', 'Link to Australia/Brisbane'),
('', '', 'Australia/South', '', '+09:30', '+10:30', 'Link to Australia/Adelaide'),
('AU', '-3352+15113', 'Australia/Sydney', 'New South Wales - most locations', '+10:00', '+11:00', ''),
('', '', 'Australia/Tasmania', '', '+10:00', '+11:00', 'Link to Australia/Hobart'),
('', '', 'Australia/Victoria', '', '+10:00', '+11:00', 'Link to Australia/Melbourne'),
('', '', 'Australia/West', '', '+08:00', '+08:00', 'Link to Australia/Perth'),
('', '', 'Australia/Yancowinna', '', '+09:30', '+10:30', 'Link to Australia/Broken_Hill'),
('', '', 'Brazil/Acre', '', '−04:00', '−04:00', 'Link to America/Rio_Branco'),
('', '', 'Brazil/DeNoronha', '', '−02:00', '−02:00', 'Link to America/Noronha'),
('', '', 'Brazil/East', '', '−03:00', '−02:00', 'Link to America/Sao_Paulo'),
('', '', 'Brazil/West', '', '−04:00', '−04:00', 'Link to America/Manaus'),
('', '', 'Canada/Atlantic', '', '−04:00', '−03:00', 'Link to America/Halifax'),
('', '', 'Canada/Central', '', '−06:00', '−05:00', 'Link to America/Winnipeg'),
('', '', 'Canada/East-Saskatchewan', '', '−06:00', '−06:00', 'Link to America/Regina'),
('', '', 'Canada/Eastern', '', '−05:00', '−04:00', 'Link to America/Toronto'),
('', '', 'Canada/Mountain', '', '−07:00', '−06:00', 'Link to America/Edmonton'),
('', '', 'Canada/Newfoundland', '', '−03:30', '−02:30', 'Link to America/St_Johns'),
('', '', 'Canada/Pacific', '', '−08:00', '−07:00', 'Link to America/Vancouver'),
('', '', 'Canada/Saskatchewan', '', '−06:00', '−06:00', 'Link to America/Regina'),
('', '', 'Canada/Yukon', '', '−08:00', '−07:00', 'Link to America/Whitehorse'),
('', '', 'CET', '', '+01:00', '+02:00', ''),
('', '', 'Chile/Continental', '', '−04:00', '−03:00', 'Link to America/Santiago'),
('', '', 'Chile/EasterIsland', '', '−06:00', '−05:00', 'Link to Pacific/Easter'),
('', '', 'CST6CDT', '', '−06:00', '−05:00', ''),
('', '', 'Cuba', '', '−05:00', '−04:00', 'Link to America/Havana'),
('', '', 'EET', '', '+02:00', '+03:00', ''),
('', '', 'Egypt', '', '+02:00', '+02:00', 'Link to Africa/Cairo'),
('', '', 'Eire', '', '+00:00', '+01:00', 'Link to Europe/Dublin'),
('', '', 'EST', '', '−05:00', '−05:00', ''),
('', '', 'EST5EDT', '', '−05:00', '−04:00', ''),
('', '', 'Etc./GMT', '', '+00:00', '+00:00', 'Link to UTC'),
('', '', 'Etc./GMT+0', '', '+00:00', '+00:00', 'Link to UTC'),
('', '', 'Etc./UCT', '', '+00:00', '+00:00', 'Link to UTC'),
('', '', 'Etc./Universal', '', '+00:00', '+00:00', 'Link to UTC'),
('', '', 'Etc./UTC', '', '+00:00', '+00:00', 'Link to UTC'),
('', '', 'Etc./Zulu', '', '+00:00', '+00:00', 'Link to UTC'),
('NL', '+5222+00454', 'Europe/Amsterdam', '', '+01:00', '+02:00', ''),
('AD', '+4230+00131', 'Europe/Andorra', '', '+01:00', '+02:00', ''),
('GR', '+3758+02343', 'Europe/Athens', '', '+02:00', '+03:00', ''),
('', '', 'Europe/Belfast', '', '+00:00', '+01:00', 'Link to Europe/London'),
('RS', '+4450+02030', 'Europe/Belgrade', '', '+01:00', '+02:00', ''),
('DE', '+5230+01322', 'Europe/Berlin', '', '+01:00', '+02:00', 'In 1945, the Trizone did not follow Berlin\'s switch to DST, see Time in Germany'),
('SK', '+4809+01707', 'Europe/Bratislava', '', '+01:00', '+02:00', 'Link to Europe/Prague'),
('BE', '+5050+00420', 'Europe/Brussels', '', '+01:00', '+02:00', ''),
('RO', '+4426+02606', 'Europe/Bucharest', '', '+02:00', '+03:00', ''),
('HU', '+4730+01905', 'Europe/Budapest', '', '+01:00', '+02:00', ''),
('MD', '+4700+02850', 'Europe/Chisinau', '', '+02:00', '+03:00', ''),
('DK', '+5540+01235', 'Europe/Copenhagen', '', '+01:00', '+02:00', ''),
('IE', '+5320-00615', 'Europe/Dublin', '', '+00:00', '+01:00', ''),
('GI', '+3608-00521', 'Europe/Gibraltar', '', '+01:00', '+02:00', ''),
('GG', '+4927-00232', 'Europe/Guernsey', '', '+00:00', '+01:00', 'Link to Europe/London'),
('FI', '+6010+02458', 'Europe/Helsinki', '', '+02:00', '+03:00', ''),
('IM', '+5409-00428', 'Europe/Isle_of_Man', '', '+00:00', '+01:00', 'Link to Europe/London'),
('TR', '+4101+02858', 'Europe/Istanbul', '', '+02:00', '+03:00', ''),
('JE', '+4912-00207', 'Europe/Jersey', '', '+00:00', '+01:00', 'Link to Europe/London'),
('RU', '+5443+02030', 'Europe/Kaliningrad', 'Moscow-01 - Kaliningrad', '+03:00', '+03:00', ''),
('UA', '+5026+03031', 'Europe/Kiev', 'most locations', '+02:00', '+03:00', ''),
('PT', '+3843-00908', 'Europe/Lisbon', 'mainland', '+00:00', '+01:00', ''),
('SI', '+4603+01431', 'Europe/Ljubljana', '', '+01:00', '+02:00', 'Link to Europe/Belgrade'),
('GB', '+513030-0000731', 'Europe/London', '', '+00:00', '+01:00', ''),
('LU', '+4936+00609', 'Europe/Luxembourg', '', '+01:00', '+02:00', ''),
('ES', '+4024-00341', 'Europe/Madrid', 'mainland', '+01:00', '+02:00', ''),
('MT', '+3554+01431', 'Europe/Malta', '', '+01:00', '+02:00', ''),
('AX', '+6006+01957', 'Europe/Mariehamn', '', '+02:00', '+03:00', 'Link to Europe/Helsinki'),
('BY', '+5354+02734', 'Europe/Minsk', '', '+03:00', '+03:00', ''),
('MC', '+4342+00723', 'Europe/Monaco', '', '+01:00', '+02:00', ''),
('RU', '+5545+03735', 'Europe/Moscow', 'Moscow+00 - west Russia', '+04:00', '+04:00', ''),
('', '', 'Europe/Nicosia', '', '+02:00', '+03:00', 'Link to Asia/Nicosia'),
('NO', '+5955+01045', 'Europe/Oslo', '', '+01:00', '+02:00', ''),
('FR', '+4852+00220', 'Europe/Paris', '', '+01:00', '+02:00', ''),
('ME', '+4226+01916', 'Europe/Podgorica', '', '+01:00', '+02:00', 'Link to Europe/Belgrade'),
('CZ', '+5005+01426', 'Europe/Prague', '', '+01:00', '+02:00', ''),
('LV', '+5657+02406', 'Europe/Riga', '', '+02:00', '+03:00', ''),
('IT', '+4154+01229', 'Europe/Rome', '', '+01:00', '+02:00', ''),
('RU', '+5312+05009', 'Europe/Samara', 'Moscow+00 - Samara, Udmurtia', '+04:00', '+04:00', ''),
('SM', '+4355+01228', 'Europe/San_Marino', '', '+01:00', '+02:00', 'Link to Europe/Rome'),
('BA', '+4352+01825', 'Europe/Sarajevo', '', '+01:00', '+02:00', 'Link to Europe/Belgrade'),
('UA', '+4457+03406', 'Europe/Simferopol', 'central Crimea', '+02:00', '+03:00', ''),
('MK', '+4159+02126', 'Europe/Skopje', '', '+01:00', '+02:00', 'Link to Europe/Belgrade'),
('BG', '+4241+02319', 'Europe/Sofia', '', '+02:00', '+03:00', ''),
('SE', '+5920+01803', 'Europe/Stockholm', '', '+01:00', '+02:00', ''),
('EE', '+5925+02445', 'Europe/Tallinn', '', '+02:00', '+03:00', ''),
('AL', '+4120+01950', 'Europe/Tirane', '', '+01:00', '+02:00', ''),
('', '', 'Europe/Tiraspol', '', '+02:00', '+03:00', 'Link to Europe/Chisinau'),
('UA', '+4837+02218', 'Europe/Uzhgorod', 'Ruthenia', '+02:00', '+03:00', ''),
('LI', '+4709+00931', 'Europe/Vaduz', '', '+01:00', '+02:00', ''),
('VA', '+415408+0122711', 'Europe/Vatican', '', '+01:00', '+02:00', 'Link to Europe/Rome'),
('AT', '+4813+01620', 'Europe/Vienna', '', '+01:00', '+02:00', ''),
('LT', '+5441+02519', 'Europe/Vilnius', '', '+02:00', '+03:00', ''),
('RU', '+4844+04425', 'Europe/Volgograd', 'Moscow+00 - Caspian Sea', '+04:00', '+04:00', ''),
('PL', '+5215+02100', 'Europe/Warsaw', '', '+01:00', '+02:00', ''),
('HR', '+4548+01558', 'Europe/Zagreb', '', '+01:00', '+02:00', 'Link to Europe/Belgrade'),
('UA', '+4750+03510', 'Europe/Zaporozhye', 'Zaporozh\'ye, E Lugansk / Zaporizhia, E Luhansk', '+02:00', '+03:00', ''),
('CH', '+4723+00832', 'Europe/Zurich', '', '+01:00', '+02:00', ''),
('', '', 'GB', '', '+00:00', '+01:00', 'Link to Europe/London'),
('', '', 'GB-Eire', '', '+00:00', '+01:00', 'Link to Europe/London'),
('', '', 'GMT', '', '+00:00', '+00:00', 'Link to UTC'),
('', '', 'GMT+0', '', '+00:00', '+00:00', 'Link to UTC'),
('', '', 'GMT-0', '', '+00:00', '+00:00', 'Link to UTC'),
('', '', 'GMT0', '', '+00:00', '+00:00', 'Link to UTC'),
('', '', 'Greenwich', '', '+00:00', '+00:00', 'Link to UTC'),
('', '', 'Hong Kong', '', '+08:00', '+08:00', 'Link to Asia/Hong_Kong'),
('', '', 'HST', '', '−10:00', '−10:00', ''),
('', '', 'Iceland', '', '+00:00', '+00:00', 'Link to Atlantic/Reykjavik'),
('MG', '-1855+04731', 'Indian/Antananarivo', '', '+03:00', '+03:00', ''),
('IO', '-0720+07225', 'Indian/Chagos', '', '+06:00', '+06:00', ''),
('CX', '-1025+10543', 'Indian/Christmas', '', '+07:00', '+07:00', ''),
('CC', '-1210+09655', 'Indian/Cocos', '', '+06:30', '+06:30', ''),
('KM', '-1141+04316', 'Indian/Comoro', '', '+03:00', '+03:00', ''),
('TF', '-492110+0701303', 'Indian/Kerguelen', '', '+05:00', '+05:00', ''),
('SC', '-0440+05528', 'Indian/Mahe', '', '+04:00', '+04:00', ''),
('MV', '+0410+07330', 'Indian/Maldives', '', '+05:00', '+05:00', ''),
('MU', '-2010+05730', 'Indian/Mauritius', '', '+04:00', '+04:00', ''),
('YT', '-1247+04514', 'Indian/Mayotte', '', '+03:00', '+03:00', ''),
('RE', '-2052+05528', 'Indian/Reunion', '', '+04:00', '+04:00', ''),
('', '', 'Iran', '', '+03:30', '+04:30', 'Link to Asia/Tehran'),
('', '', 'Israel', '', '+02:00', '+03:00', 'Link to Asia/Jerusalem'),
('', '', 'Jamaica', '', '−05:00', '−05:00', 'Link to America/Jamaica'),
('', '', 'Japan', '', '+09:00', '+09:00', 'Link to Asia/Tokyo'),
('', '', 'JST-9', '', '+09:00', '+09:00', 'Link to Asia/Tokyo'),
('', '', 'Kwajalein', '', '+12:00', '+12:00', 'Link to Pacific/Kwajalein'),
('', '', 'Libya', '', '+02:00', '+02:00', 'Link to Africa/Tripoli'),
('', '', 'MET', '', '+01:00', '+02:00', ''),
('', '', 'Mexico/BajaNorte', '', '−08:00', '−07:00', 'Link to America/Tijuana'),
('', '', 'Mexico/BajaSur', '', '−07:00', '−06:00', 'Link to America/Mazatlan'),
('', '', 'Mexico/General', '', '−06:00', '−05:00', 'Link to America/Mexico_City'),
('', '', 'MST', '', '−07:00', '−07:00', ''),
('', '', 'MST7MDT', '', '−07:00', '−06:00', ''),
('', '', 'Navajo', '', '−07:00', '−06:00', 'Link to America/Denver'),
('', '', 'NZ', '', '+12:00', '+13:00', 'Link to Pacific/Auckland'),
('', '', 'NZ-CHAT', '', '+12:45', '+13:45', 'Link to Pacific/Chatham'),
('WS', '-1350-17144', 'Pacific/Apia', '', '+13:00', '+14:00', ''),
('NZ', '-3652+17446', 'Pacific/Auckland', 'most locations', '+12:00', '+13:00', ''),
('NZ', '-4357-17633', 'Pacific/Chatham', 'Chatham Islands', '+12:45', '+13:45', ''),
('FM', '+0725+15147', 'Pacific/Chuuk', 'Chuuk (Truk) and Yap', '+10:00', '+10:00', ''),
('CL', '-2709-10926', 'Pacific/Easter', 'Easter Island & Sala y Gomez', '−06:00', '−05:00', ''),
('VU', '-1740+16825', 'Pacific/Efate', '', '+11:00', '+11:00', ''),
('KI', '-0308-17105', 'Pacific/Enderbury', 'Phoenix Islands', '+13:00', '+13:00', ''),
('TK', '-0922-17114', 'Pacific/Fakaofo', '', '+13:00', '+13:00', ''),
('FJ', '-1808+17825', 'Pacific/Fiji', '', '+12:00', '+13:00', ''),
('TV', '-0831+17913', 'Pacific/Funafuti', '', '+12:00', '+12:00', ''),
('EC', '-0054-08936', 'Pacific/Galapagos', 'Galapagos Islands', '−06:00', '−06:00', ''),
('PF', '-2308-13457', 'Pacific/Gambier', 'Gambier Islands', '−09:00', '−09:00', ''),
('SB', '-0932+16012', 'Pacific/Guadalcanal', '', '+11:00', '+11:00', ''),
('GU', '+1328+14445', 'Pacific/Guam', '', '+10:00', '+10:00', ''),
('US', '+211825-1575130', 'Pacific/Honolulu', 'Hawaii', '−10:00', '−10:00', ''),
('UM', '+1645-16931', 'Pacific/Johnston', 'Johnston Atoll', '−10:00', '−10:00', ''),
('KI', '+0152-15720', 'Pacific/Kiritimati', 'Line Islands', '+14:00', '+14:00', ''),
('FM', '+0519+16259', 'Pacific/Kosrae', 'Kosrae', '+11:00', '+11:00', ''),
('MH', '+0905+16720', 'Pacific/Kwajalein', 'Kwajalein', '+12:00', '+12:00', ''),
('MH', '+0709+17112', 'Pacific/Majuro', 'most locations', '+12:00', '+12:00', ''),
('PF', '-0900-13930', 'Pacific/Marquesas', 'Marquesas Islands', '−09:30', '−09:30', ''),
('UM', '+2813-17722', 'Pacific/Midway', 'Midway Islands', '−11:00', '−11:00', ''),
('NR', '-0031+16655', 'Pacific/Nauru', '', '+12:00', '+12:00', ''),
('NU', '-1901-16955', 'Pacific/Niue', '', '−11:00', '−11:00', ''),
('NF', '-2903+16758', 'Pacific/Norfolk', '', '+11:30', '+11:30', ''),
('NC', '-2216+16627', 'Pacific/Noumea', '', '+11:00', '+11:00', ''),
('AS', '-1416-17042', 'Pacific/Pago_Pago', '', '−11:00', '−11:00', ''),
('PW', '+0720+13429', 'Pacific/Palau', '', '+09:00', '+09:00', ''),
('PN', '-2504-13005', 'Pacific/Pitcairn', '', '−08:00', '−08:00', ''),
('FM', '+0658+15813', 'Pacific/Pohnpei', 'Pohnpei (Ponape)', '+11:00', '+11:00', ''),
('', '', 'Pacific/Ponape', '', '+11:00', '+11:00', 'Link to Pacific/Pohnpei'),
('PG', '-0930+14710', 'Pacific/Port_Moresby', '', '+10:00', '+10:00', ''),
('CK', '-2114-15946', 'Pacific/Rarotonga', '', '−10:00', '−10:00', ''),
('MP', '+1512+14545', 'Pacific/Saipan', '', '+10:00', '+10:00', ''),
('', '', 'Pacific/Samoa', '', '−11:00', '−11:00', 'Link to Pacific/Pago_Pago'),
('PF', '-1732-14934', 'Pacific/Tahiti', 'Society Islands', '−10:00', '−10:00', ''),
('KI', '+0125+17300', 'Pacific/Tarawa', 'Gilbert Islands', '+12:00', '+12:00', ''),
('TO', '-2110-17510', 'Pacific/Tongatapu', '', '+13:00', '+13:00', ''),
('', '', 'Pacific/Truk', '', '+10:00', '+10:00', 'Link to Pacific/Chuuk'),
('UM', '+1917+16637', 'Pacific/Wake', 'Wake Island', '+12:00', '+12:00', ''),
('WF', '-1318-17610', 'Pacific/Wallis', '', '+12:00', '+12:00', ''),
('', '', 'Pacific/Yap', '', '+10:00', '+10:00', 'Link to Pacific/Chuuk'),
('', '', 'Poland', '', '+01:00', '+02:00', 'Link to Europe/Warsaw'),
('', '', 'Portugal', '', '+00:00', '+01:00', 'Link to Europe/Lisbon'),
('', '', 'PRC', '', '+08:00', '+08:00', 'Link to Asia/Shanghai'),
('', '', 'PST8PDT', '', '−08:00', '−07:00', ''),
('', '', 'ROC', '', '+08:00', '+08:00', 'Link to Asia/Taipei'),
('', '', 'ROK', '', '+09:00', '+09:00', 'Link to Asia/Seoul'),
('', '', 'Singapore', '', '+08:00', '+08:00', 'Link to Asia/Singapore'),
('', '', 'Turkey', '', '+02:00', '+03:00', 'Link to Europe/Istanbul'),
('', '', 'UCT', '', '+00:00', '+00:00', 'Link to UTC'),
('', '', 'Universal', '', '+00:00', '+00:00', 'Link to UTC'),
('', '', 'US/Alaska', '', '−09:00', '−08:00', 'Link to America/Anchorage'),
('', '', 'US/Aleutian', '', '−10:00', '−09:00', 'Link to America/Adak'),
('', '', 'US/Arizona', '', '−07:00', '−07:00', 'Link to America/Phoenix'),
('', '', 'US/Central', '', '−06:00', '−05:00', 'Link to America/Chicago'),
('', '', 'US/East-Indiana', '', '−05:00', '−04:00', 'Link to America/Indiana/Indianapolis'),
('', '', 'US/Eastern', '', '−05:00', '−04:00', 'Link to America/New_York'),
('', '', 'US/Hawaii', '', '−10:00', '−10:00', 'Link to Pacific/Honolulu'),
('', '', 'US/Indiana-Starke', '', '−06:00', '−05:00', 'Link to America/Indiana/Knox'),
('', '', 'US/Michigan', '', '−05:00', '−04:00', 'Link to America/Detroit'),
('', '', 'US/Mountain', '', '−07:00', '−06:00', 'Link to America/Denver'),
('', '', 'US/Pacific', '', '−08:00', '−07:00', 'Link to America/Los_Angeles'),
('', '', 'US/Pacific-New', '', '−08:00', '−07:00', 'Link to America/Los_Angeles'),
('', '', 'US/Samoa', '', '−11:00', '−11:00', 'Link to Pacific/Pago_Pago'),
('', '', 'UTC', '', '+00:00', '+00:00', ''),
('', '', 'W-SU', '', '+04:00', '+04:00', 'Link to Europe/Moscow'),
('', '', 'WET', '', '+00:00', '+01:00', ''),
('', '', 'Zulu', '', '+00:00', '+00:00', 'Link to UTC');

-- --------------------------------------------------------

--
-- Table structure for table `pre_categories`
--

CREATE TABLE `pre_categories` (
  `id` int(11) UNSIGNED NOT NULL,
  `is_parent` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1-category, 0-course',
  `name` varchar(256) NOT NULL,
  `description` varchar(512) DEFAULT NULL,
  `code` varchar(8) NOT NULL,
  `image` varchar(512) DEFAULT NULL,
  `is_popular` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1-yes, 0-no',
  `slug` varchar(512) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1-active, 0-inactive',
  `sort_order` int(11) NOT NULL DEFAULT '0' COMMENT 'records display order',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `categories` varchar(512) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pre_categories`
--

INSERT INTO `pre_categories` (`id`, `is_parent`, `name`, `description`, `code`, `image`, `is_popular`, `slug`, `status`, `sort_order`, `created_at`, `updated_at`, `categories`) VALUES
(1, 1, 'Computer Science', 'Programing Languages', 'CS', NULL, 1, 'cscience', 1, 0, NULL, NULL, NULL),
(2, 1, 'Maths', ' It is Math Subject', 'MT', NULL, 1, 'math', 1, 0, NULL, NULL, NULL),
(3, 1, 'Science', 'It is  Science Category', 'SC', NULL, 1, 'science', 1, 0, NULL, NULL, NULL),
(4, 1, 'Study in Abroad', 'Courses for study in abroad', 'STA', NULL, 1, 'study-in-abroad', 1, 0, NULL, NULL, NULL),
(5, 1, 'Engineering Subjects', 'Engineering Subjects Courses', 'ES', NULL, 1, 'engg-subjects', 1, 0, NULL, NULL, NULL),
(6, 1, 'Law Subjects', 'law subjects Courses', 'LAW', NULL, 1, 'lsub', 1, 0, NULL, NULL, NULL),
(7, 1, 'Distance Educations', 'Distance Educations Related Courses', 'DE', NULL, 1, 'distance-educations', 1, 0, NULL, NULL, NULL),
(8, 1, 'Engineering Entrance & IITJEE', 'Engineering Entrance tests', 'EE', NULL, 1, 'engg-enterance', 1, 0, NULL, NULL, NULL),
(9, 1, 'Dance', 'Dance related Courses', 'DN', NULL, 1, 'dance', 1, 0, NULL, NULL, NULL),
(10, 1, 'Music', 'Music related Courses', 'MUS', NULL, 1, 'music', 1, 0, NULL, NULL, NULL),
(11, 1, 'Hobby Classes', 'Hobby Classes related Courses', 'HC', NULL, 1, 'hobby-classes', 0, 0, NULL, NULL, NULL),
(12, 1, 'Competitive Exams', 'Competitive Exam related courses', 'CE', NULL, 0, 'competitive-exams', 1, 1, NULL, NULL, NULL),
(13, 0, 'C++ Programming', 'C++ Programming Course', 'C++', 'c684c-c-programming.jpg', 1, 'c-programming', 1, 0, '2016-11-07 16:37:10', '2016-11-23 10:55:27', '1'),
(14, 0, 'Java Programming', 'Java Programming Course', 'java', '1f676-java-programming.jpg', 1, 'java-programming', 1, 0, '2016-11-07 16:37:41', '2016-11-23 10:55:11', '1'),
(15, 0, 'Adobe Photoshop', 'Adobe Photoshop Course', 'APC', 'c3fa2-adobe-photoshop.jpg', 0, 'adobe-photoshop', 1, 0, '2016-11-07 16:38:12', '2016-11-23 11:06:07', '1'),
(16, 0, 'C#(Sharp)', 'C#(Sharp) Course', 'C#', 'c991b-c-sharp-.jpg', 1, 'c-sharp', 1, 1, '2016-11-07 16:38:53', '2016-11-23 10:54:14', '1'),
(17, 0, 'MySQL', 'MySQL Course', 'mysql', '6ec84-mysql.jpg', 1, 'mysql', 0, 1, '2016-11-07 16:39:25', '2016-11-23 10:54:01', '1'),
(18, 0, 'Dreamweaver', 'Dreamweaver Course', 'DC', '13dd1-dreamweaver.jpg', 1, 'dreamweaver', 0, 0, '2016-11-07 16:39:50', '2016-11-23 10:53:37', '1'),
(19, 0, 'Flash', 'Flash Course', 'fc', 'c4712-flash.jpg', 1, 'flash', 0, 0, '2016-11-07 16:40:16', '2016-11-23 10:53:22', '1'),
(20, 0, 'HTML', 'HTML  Course', 'html', 'b0c79-html.jpg', 1, 'html', 1, 0, '2016-11-07 16:40:45', '2016-11-23 10:53:09', '1'),
(21, 0, 'Javascript', 'Javascript Course...', 'JS', 'ca9fe-javascript.jpg', 1, 'javascript', 1, 0, '2016-11-07 17:06:21', '2016-11-23 10:52:57', '1'),
(22, 0, 'Matlab', 'Matlab Course', 'ML', 'b773b-matlab.jpg', 1, 'matlab', 0, 0, '2016-11-07 17:06:52', '2016-11-23 10:52:40', '1'),
(23, 0, 'Microsoft Access', 'Microsoft Access Course', 'MA', '7f182-microsoft-access.jpg', 1, 'microsoft-access', 1, 0, '2016-11-07 17:07:13', '2016-11-23 10:51:34', '1'),
(24, 0, 'Microsoft Excel', 'Microsoft Excel Course ..', 'ME', 'b5f70-microsoft-excel.jpg', 1, 'microsoft-excel', 1, 0, '2016-11-07 17:07:37', '2016-11-23 10:51:22', '1'),
(25, 0, 'Microsoft Power Point', 'Microsoft Power Point Course', 'MPP', '5730c-microsoft-power-point.jpg', 1, 'microsoft-power-point', 1, 0, '2016-11-07 17:08:07', '2016-11-23 10:51:05', '1'),
(26, 0, 'PHP', 'PHP Course ..', 'PHP', 'a4cb2-php.jpg', 1, 'php', 1, 0, '2016-11-07 17:08:31', '2016-11-23 10:50:48', '1'),
(27, 0, 'Software Quality&Testing', 'Software Quality&Testing Course ...', 'QA', 'ea66e-software-quality-testing.jpg', 1, 'software-quality-testing', 1, 0, '2016-11-07 17:08:53', '2016-11-23 10:50:32', '1'),
(28, 0, 'MS SQL', 'MS SQL Course', 'MSS', 'd7f3c-ms-sql.jpg', 1, 'ms-sql', 1, 0, '2016-11-07 17:09:23', '2016-11-23 10:50:08', '1'),
(29, 0, 'Oracle', 'Oracle Course...', 'ORACLE', 'dc91a-oracle.jpg', 1, 'oracle', 1, 0, '2016-11-07 17:10:12', '2016-11-23 10:49:56', '1'),
(30, 0, 'Algebra', 'Algebra Math\'s Course', 'AL', 'f279d-algebra.jpg', 1, 'algebra', 1, 0, '2016-11-07 17:10:53', '2016-11-23 10:49:44', '2'),
(31, 0, 'Pre-Algebra', 'Pre-Algebra  Math\'s Course', 'PA', '98d39-pre-algebra.jpg', 1, 'pre-algebra', 1, 0, '2016-11-07 17:11:19', '2016-11-23 10:49:25', '2'),
(32, 0, 'Basic Math', 'Basic Math Course', 'BM', '37065-basic-math.jpg', 1, 'basic-math', 1, 0, '2016-11-07 17:11:55', '2016-11-23 10:49:10', '2'),
(33, 0, 'Calculus', 'Calculus Course', 'CA', 'b5278-calculus.jpg', 1, 'calculus', 1, 0, '2016-11-07 17:12:51', '2016-11-23 10:48:50', '2'),
(34, 0, 'Probability', 'Probability Course', 'PR', '8bde3-probability.jpg', 1, 'probability', 1, 0, '2016-11-07 17:14:35', '2016-11-23 10:48:37', '2'),
(35, 0, 'Statistics', 'Statistics Course', 'ST', '198a5-statistics.jpg', 1, 'statistics', 1, 0, '2016-11-07 17:17:49', '2016-11-23 10:48:18', '2'),
(36, 0, 'Geometry', 'Geometry Course', 'GE', '2abdf-geometry.jpg', 1, 'geometry', 1, 0, '2016-11-07 17:18:20', '2016-11-23 10:48:07', '2'),
(37, 0, 'Trigonometry', 'Trigonometry Course', 'TRI', '2339f-trigonometry.jpg', 1, 'trigonometry', 1, 0, '2016-11-07 17:18:40', '2016-11-23 10:47:55', '2'),
(38, 0, 'Physics', 'Physics Course', 'PS', '29e23-physics.jpg', 1, 'physics', 1, 0, '2016-11-07 17:19:07', '2016-11-23 13:04:05', '3'),
(39, 0, 'Chemistry', 'Chemistry Course', 'CH', 'acf52-chemistry.jpg', 1, 'chemistry', 1, 0, '2016-11-07 17:19:29', '2016-11-23 10:46:32', '3'),
(40, 0, 'Biology', 'Biology Course', 'BG', '7c274-biology.jpg', 1, 'biology', 1, 0, '2016-11-07 17:19:51', '2016-11-23 10:46:14', '3'),
(41, 0, 'Engineering', 'Engineering Course', 'engg', '04c84-engineering.jpg', 1, 'engineering', 1, 0, '2016-11-07 17:20:12', '2016-11-23 10:46:02', '3'),
(42, 0, 'ACT Exam', 'ACT Exam Course', 'ACT', 'a2672-act-exam.jpg', 1, 'act-exam', 1, 0, '2016-11-07 17:20:56', '2016-11-23 10:45:49', '4'),
(43, 0, 'FMS', 'FMS Course', 'FMS', '6fb18-fms.jpg', 1, 'fms', 1, 0, '2016-11-07 17:21:13', '2016-11-23 10:45:31', '4'),
(44, 0, 'GMAT', 'GMAT Course', 'GMAT', '01000-gmat.jpg', 1, 'gmat', 1, 0, '2016-11-07 17:21:30', '2016-11-23 10:45:18', '4'),
(45, 0, 'GRE', 'GRE Course', 'GRE', '8888e-gre.jpg', 1, 'gre', 1, 0, '2016-11-07 17:22:24', '2016-11-23 10:45:05', '4'),
(46, 0, 'IELTS', 'IELTS Course', 'IELTS', '3bbda-ielts.jpg', 1, 'ielts', 1, 0, '2016-11-07 17:22:40', '2016-11-23 10:44:53', '4'),
(47, 0, 'NBDE', 'NBDE Course', 'NBDE', '3fab1-nbde.jpg', 1, 'nbde', 1, 0, '2016-11-07 17:22:56', '2016-11-23 10:44:39', '4'),
(48, 0, 'NCLEX', 'NCLEX Course', 'NCLEX', 'e9fe2-nclex.jpg', 1, 'nclex', 1, 0, '2016-11-07 17:23:13', '2016-11-23 10:44:22', '4'),
(49, 0, 'NMSQT', 'NMSQT Course', 'NMSQT', '29f5e-nmsqt.jpg', 1, 'nmsqt', 1, 0, '2016-11-07 17:23:28', '2016-11-23 10:44:07', '4'),
(50, 0, 'OET', 'OET Course', 'OET', '29687-oet.jpg', 1, 'oet', 1, 0, '2016-11-07 17:23:45', '2016-11-23 10:43:53', '4'),
(51, 0, 'TOEFL', 'TOEFL Course', 'TOEFL', '4c8ef-toefl.jpg', 1, 'toefl', 1, 0, '2016-11-07 17:24:01', '2016-11-23 10:43:39', '4'),
(52, 0, 'USMLE', 'USMLE Course', 'USMLE', '71850-usmle.jpg', 1, 'usmle', 1, 0, '2016-11-07 17:24:20', '2016-11-23 10:43:20', '4'),
(53, 0, 'Chemical', 'Chemical', 'CHE', '9debf-chemical.jpg', 1, 'chemical', 1, 0, '2016-11-07 17:24:48', '2016-11-23 10:43:04', '5'),
(54, 0, 'Civil', 'Civil Course', 'CV', 'c81b8-civil.jpg', 1, 'civil', 1, 0, '2016-11-07 17:25:16', '2016-11-23 10:42:47', '5'),
(55, 0, 'Computer', 'Computer Course', 'CP', 'de114-computer.jpg', 1, 'computer', 1, 0, '2016-11-07 17:26:18', '2016-11-23 10:42:28', '5'),
(56, 0, 'Drawing', 'Drawing Course', 'DR', '55363-drawing.jpg', 1, 'drawing', 1, 0, '2016-11-07 17:26:42', '2016-11-23 10:42:10', '5'),
(57, 0, 'Electrical', 'Electrical Course', 'EL', 'cea82-electrical.jpg', 1, 'electrical', 1, 0, '2016-11-07 17:27:08', '2016-11-23 10:41:46', '5'),
(58, 0, 'Electronics', 'Electronics Course', 'EC', 'a0a0c-electronics.jpg', 1, 'electronics', 1, 0, '2016-11-07 17:27:27', '2016-11-23 10:41:24', '5'),
(59, 0, 'Instrumentation', 'Instrumentation Course', 'IE', 'f2bbc-instrumentation.jpg', 1, 'instrumentation', 1, 0, '2016-11-07 17:27:50', '2016-11-23 10:41:03', '5'),
(60, 0, 'IT', 'IT Course', 'IT', 'ee7b9-it.jpg', 1, 'it', 1, 0, '2016-11-07 17:28:06', '2016-11-23 10:40:35', '5'),
(61, 0, 'Mathematics', 'Mathematics', 'MATH', '95cbd-mathematics.jpg', 1, 'mathematics', 1, 0, '2016-11-07 17:28:33', '2016-11-23 10:40:14', '5'),
(62, 0, 'Production', 'Production Course', 'PRO', '9bcd1-production.jpg', 1, 'production', 1, 0, '2016-11-07 17:29:10', '2016-11-23 10:39:48', '5'),
(63, 0, 'Administrative Laws', 'Administrative Laws Course', 'ALS', '98523-administrative-laws.jpg', 1, 'administrative-laws', 1, 0, '2016-11-07 17:29:33', '2016-11-23 10:39:21', '6'),
(64, 0, 'Civil Laws', 'Civil Laws Course', 'CLS', '05c69-civil-laws.jpg', 1, 'civil-laws', 1, 0, '2016-11-07 17:29:55', '2016-11-23 10:39:03', '6'),
(65, 0, 'CLAT', 'CLAT Course', 'CLAT', '9b17c-clat.jpg', 1, 'clat', 1, 0, '2016-11-07 17:30:20', '2016-11-23 10:38:45', '6'),
(66, 0, 'Company Laws', 'Company Laws Course', 'CMLS', 'a49e0-company-laws.jpg', 1, 'company-laws', 1, 0, '2016-11-07 17:31:06', '2016-11-23 10:38:27', '6'),
(67, 0, 'Contract Act Laws', 'Contract Act Laws Course', 'CALS', '0ab3d-contract-act-laws.jpg', 1, 'contract-act-laws', 1, 0, '2016-11-07 17:31:30', '2016-11-23 10:38:11', '6'),
(68, 0, 'Criminal Laws', 'Criminal Laws Course', 'CRLS', 'b1d12-criminal-laws.jpg', 1, 'criminal-laws', 1, 0, '2016-11-07 17:31:52', '2016-11-23 10:36:59', '6'),
(69, 0, 'Jurisprudence', 'Jurisprudence Course', 'JPLS', 'ad191-jurisprudence.jpg', 1, 'jurisprudence', 1, 0, '2016-11-07 17:32:15', '2016-11-23 10:36:14', '6'),
(70, 0, 'Law Entrance', 'Law Entrance Course', 'LE', '9a210-law-entrance.jpg', 1, 'law-entrance', 1, 0, '2016-11-07 17:32:36', '2016-11-23 10:35:57', '6'),
(71, 0, 'LLB', 'LLB Course', 'LLB', 'f1970-llb.jpg', 1, 'llb', 1, 0, '2016-11-07 17:32:55', '2016-11-23 10:35:41', '6'),
(72, 0, 'Tax Laws', 'Tax Laws Course', 'TALS', 'aacfc-tax-laws.jpg', 1, 'tax-laws', 1, 0, '2016-11-07 17:33:18', '2016-11-23 10:35:22', '6'),
(73, 0, 'LLM', 'LLM Course', 'LLM', '5e748-llm.jpg', 1, 'llm', 1, 0, '2016-11-07 17:33:36', '2016-11-23 10:35:01', '6'),
(74, 0, 'BBA', 'BBA  Course', 'BBA', 'd640b-bba.jpg', 1, 'bba', 1, 0, '2016-11-07 17:33:59', '2016-11-23 10:34:39', '7'),
(75, 0, 'BCA', 'BCA Course', 'BCA', '9c5b6-bca.jpg', 1, 'bca', 1, 0, '2016-11-07 17:34:16', '2016-11-23 10:37:27', '7'),
(76, 0, 'MBA', 'MBA Course', 'MBA', '3e6d5-mba.jpg', 1, 'mba', 1, 0, '2016-11-07 17:34:37', '2016-11-23 10:33:26', '7'),
(77, 0, 'MCA', 'MCA Course', 'MCA', 'd8926-mca.jpg', 1, 'mca', 1, 0, '2016-11-07 17:34:59', '2016-11-23 10:33:04', '7'),
(78, 0, 'PG Diploma', 'PG Diploma Course', 'PG Diplo', '3e501-pg-diploma.jpg', 1, 'pg-diploma', 1, 0, '2016-11-07 17:35:20', '2016-11-23 10:26:06', '7'),
(79, 0, 'B.Ed', 'B.Ed Course', 'B.Ed', '46938-b.ed.jpg', 1, 'b-ed', 1, 0, '2016-11-07 17:35:40', '2016-11-22 19:04:57', '7'),
(80, 0, 'B.Tech', 'B.Tech Course', 'B.Tech', 'e583d-b.tech.jpg', 1, 'b-tech', 1, 0, '2016-11-07 17:36:22', '2016-11-22 19:04:47', '7'),
(81, 0, 'M.Tech ', 'M.Tech  Course', 'M.Tech ', 'b8e3f-m.tech.jpg', 1, 'm-tech', 1, 0, '2016-11-07 17:36:40', '2016-11-22 19:04:36', '7'),
(82, 0, 'M.Sc ', 'M.Sc  Course', 'M.Sc ', '0e698-m.sc.jpg', 1, 'm-sc', 1, 0, '2016-11-07 17:36:55', '2016-11-22 19:04:23', '7'),
(83, 0, 'Ph.D', 'Phd Course', 'Phd', '4aca6-phd-2.jpg', 1, 'phd', 1, 0, '2016-11-07 17:37:13', '2016-11-23 13:03:42', '7'),
(84, 0, 'BA', 'BA Course', 'BA', 'db619-ba.jpg', 1, 'ba', 1, 0, '2016-11-07 17:37:34', '2016-11-22 19:02:22', '7'),
(85, 0, 'B.Com', 'B.Com Course', 'B.Com', '53b02-bcom.jpg', 1, 'b-com', 1, 0, '2016-11-07 17:37:51', '2016-11-22 19:02:10', '7'),
(86, 0, 'AIEEE', 'AIEEE Course', 'AIEEE', '80892-aieee.jpg', 1, 'aieee', 1, 0, '2016-11-07 17:54:17', '2016-11-22 19:01:53', '8'),
(87, 0, 'AMIE', 'AMIE Course', 'AMIE', 'e53be-amie.jpg', 1, 'amie', 1, 0, '2016-11-07 17:54:39', '2016-11-22 19:01:41', '8'),
(88, 0, 'AMITE', 'AMITE Course', 'AMITE', '59e1a-amite.jpg', 1, 'amite', 1, 0, '2016-11-07 17:54:58', '2016-11-22 19:01:04', '8'),
(89, 0, 'Architecture', 'Architecture Course', 'ARCH', '59a10-architecture.jpg', 1, 'architecture', 1, 0, '2016-11-07 17:55:23', '2016-11-22 19:00:04', '8'),
(90, 0, 'BCA Entrance', 'BCA Entrance Course', 'BCAE', 'a76ba-bca-entrance.jpg', 1, 'bca-entrance', 1, 0, '2016-11-07 17:55:58', '2016-11-22 18:59:42', '8'),
(91, 0, 'BITSAT', 'BITSAT Course', 'BITSAT', 'aa36c-bitsat.jpg', 1, 'bitsat', 1, 0, '2016-11-07 17:56:14', '2016-11-22 18:58:43', '8'),
(92, 0, 'GATE Exam', 'GATE Exam Course', 'GATE', '0049d-gate-exam.jpg', 1, 'gate-exam', 1, 0, '2016-11-07 17:56:36', '2016-11-22 18:58:20', NULL),
(93, 0, 'IIT JAM', 'IIT JAM Course', 'IIT JAM', 'bcaff-iit-jam.jpg', 1, 'iit-jam', 1, 0, '2016-11-07 17:56:56', '2016-11-23 13:03:02', '8'),
(94, 0, 'IIT JEE Advanced', 'IIT JEE Advanced Course', 'IITJEEAD', '06b9c-iit-jee-advanced.jpg', 1, 'iit-jee-advanced', 1, 0, '2016-11-07 17:57:42', '2016-11-22 18:57:06', '8'),
(95, 0, 'WBJEE', 'WBJEE Course', 'WBJEE', '4d728-wbjee.jpg', 1, 'wbjee', 1, 0, '2016-11-07 17:58:13', '2016-11-22 18:56:48', '8'),
(96, 0, 'CET', 'CET Course', 'CET', '0fa46-cet.jpg', 1, 'cet', 1, 0, '2016-11-07 17:58:47', '2016-11-22 18:56:33', '8'),
(97, 0, 'JECA Exam', 'JECA Exam Course', 'JECAE', 'b2852-jeca-exam.jpg', 1, 'jeca-exam', 1, 0, '2016-11-07 17:59:21', '2016-11-22 18:56:19', '8'),
(98, 0, 'MCA Entrance', 'MCA Entrance', 'MCAE', 'adad2-mca-entrance.jpg', 1, 'mca-entrance', 1, 0, '2016-11-07 17:59:38', '2016-11-22 18:55:54', '8'),
(99, 0, 'Polytechnic Entrance', 'Polytechnic Entrance Course', 'CEEP', '9d0de-polytechnic-entrance.jpg', 1, 'polytechnic-entrance', 1, 0, '2016-11-07 18:00:31', '2016-11-22 18:55:35', '8'),
(100, 0, 'IIT JEE Mains', 'IIT JEE Mains Course', 'IITJEEM', '54282-iit-jee-mains.jpg', 1, 'iit-jee-mains', 1, 0, '2016-11-07 18:00:56', '2016-11-22 18:55:17', '8'),
(101, 0, 'JEXPO', 'JEXPO Course', 'JEXPO', '89b6a-jexpo.jpg', 1, 'jexpo', 1, 0, '2016-11-07 18:01:17', '2016-11-22 18:54:52', '8'),
(102, 0, 'Acrobatic', 'Acrobatic Course', 'ACR', '6e7f8-acrobatic.jpg', 1, 'acrobatic', 1, 0, '2016-11-07 18:01:43', '2016-11-22 18:54:35', '9'),
(103, 0, 'Ballet', 'Ballet Course', 'BALT', 'c5d06-ballet.jpg', 1, 'ballet', 1, 0, '2016-11-07 18:02:12', '2016-11-22 18:53:48', '9'),
(104, 0, 'Ballroom Dance', 'Ballroom Dance Course', 'BARD', '8d6da-ballroom-dance.jpg', 1, 'ballroom-dance', 1, 0, '2016-11-07 18:02:40', '2016-11-22 18:53:05', '9'),
(105, 0, 'Belly', 'Belly Course', 'BEY', '416d5-belly.jpg', 1, 'belly', 1, 0, '2016-11-07 18:03:07', '2016-11-22 18:51:58', '9'),
(106, 0, 'Bharat Natyam', 'Bharat Natyam Course', 'BHN', '8c2af-bharat-natyam.jpg', 1, 'bharat-natyam', 1, 0, '2016-11-07 18:03:30', '2016-11-22 18:51:22', '9'),
(107, 0, 'Bollywood', 'Bollywood Dance Course', 'BWD', 'ed2fb-bollywood.jpg', 1, 'bollywood', 1, 0, '2016-11-07 18:03:53', '2016-11-22 18:51:02', '9'),
(108, 0, 'Break Dance', 'Break Dance Course', 'BKD', '93668-break-dance.jpg', 1, 'break-dance', 1, 0, '2016-11-07 18:04:18', '2016-11-22 18:50:39', '9'),
(109, 0, 'Cha Cha', 'Cha Cha Course', 'CHA', '0ed06-cha-cha.jpg', 1, 'cha-cha', 1, 0, '2016-11-07 18:04:45', '2016-11-22 18:50:15', '9'),
(110, 0, 'Choreography Classes', 'Choreography Classes Course', 'CHCL', '9c05b-choreography-classes.jpg', 1, 'choreography-classes', 1, 0, '2016-11-07 18:06:49', '2016-11-22 18:50:01', '9'),
(111, 0, 'Contemporary', 'Contemporary Course', 'CNPY', 'a9a34-contemporary.jpg', 1, 'contemporary', 1, 0, '2016-11-07 18:07:13', '2016-11-22 18:49:40', '9'),
(112, 0, 'Creative dance', 'Creative dance Course', 'CTD', '208c4-creative-dance.jpg', 1, 'creative-dance', 1, 0, '2016-11-07 18:07:42', '2016-11-22 18:49:19', '9'),
(113, 0, 'Zumba', 'Zumba Course', 'ZA', '9ab89-zumba.jpg', 1, 'zumba', 1, 0, '2016-11-07 18:08:11', '2016-11-22 18:48:54', '9'),
(114, 0, 'Garba', 'Garba Course', 'GA', '96192-garba.jpg', 1, 'garba', 1, 0, '2016-11-07 18:08:31', '2016-11-22 18:48:33', '9'),
(115, 0, 'Drums', 'Drums Course', 'DS', 'ed619-drums.jpg', 1, 'drums', 1, 0, '2016-11-07 18:08:57', '2016-11-22 18:48:15', '10'),
(116, 0, 'Flute', 'Flute Course', 'FL', '136fb-flute.jpg', 1, 'flute', 1, 0, '2016-11-07 18:09:19', '2016-11-22 18:48:01', '10'),
(117, 0, 'Guitar', 'Guitar Course', 'GU', '8a823-guitar.jpg', 1, 'guitar', 1, 0, '2016-11-07 18:09:42', '2016-11-22 18:47:42', '10'),
(118, 0, 'Indian Classical Music', 'Indian Classical Music', 'ICM', '42994-indian-classical-music.jpg', 1, 'indian-classical-music', 1, 0, '2016-11-07 18:09:59', '2016-11-22 16:14:09', '10'),
(119, 0, 'Keyboard', 'Keyboard Course', 'KEY', '5191b-keyboard.jpg', 1, 'keyboard', 1, 0, '2016-11-07 18:10:27', '2016-11-22 16:15:22', '10'),
(120, 0, 'Modern Songs', 'Modern Songs Course', 'MDS', 'd70c0-modern-songs.jpg', 1, 'modern-songs', 1, 0, '2016-11-07 18:10:50', '2016-11-22 16:16:23', '10'),
(121, 0, 'Piano', 'Piano Course', 'PIA', '30ae7-piano.jpg', 1, 'piano', 1, 0, '2016-11-07 18:11:10', '2016-11-22 16:17:34', '10'),
(122, 0, 'Singing', 'Singing Course', 'SG', 'f36bd-singing.jpg', 1, 'singing', 1, 0, '2016-11-07 18:11:32', '2016-11-22 16:18:03', '10'),
(123, 0, 'Sitar', 'Sitar Course', 'STR', '9823c-sitar.jpg', 1, 'sitar', 1, 0, '2016-11-07 18:11:57', '2016-11-22 16:18:18', '10'),
(124, 0, 'Western Classical Music', 'Western Classical Music', 'WCM', 'c46be-western-classical-music.jpg', 1, 'western-classical-music-course', 1, 0, '2016-11-07 18:12:22', '2016-11-22 16:44:58', '10'),
(125, 0, 'Violin', 'Violin Course', 'VIO', '34c7c-violin.jpg', 1, 'violin', 1, 0, '2016-11-07 18:12:46', '2016-11-22 16:18:44', '10'),
(126, 0, 'Acting & Drama', 'Acting & Drama Course', 'ACT&DRA', '8074c-acting-drama.jpg', 1, 'acting-drama', 1, 0, '2016-11-07 18:13:15', '2016-11-22 16:05:03', NULL),
(127, 0, 'Adventure Camps', 'Adventure Camps Course', 'ADCAS', 'd914d-adventure-camps.jpg', 1, 'adventure-camps', 1, 0, '2016-11-07 18:13:46', '2016-11-22 16:05:39', NULL),
(128, 0, 'Aero Modelling', 'Aero Modelling Course', 'AEROMD', 'da483-aero-modelling.jpg', 1, 'aero-modelling', 1, 0, '2016-11-07 18:14:12', '2016-11-22 16:05:59', NULL),
(129, 0, 'Arts & Crafts', 'Arts & Crafts Course', 'Arts&Cft', '51195-arts-crafts.jpg', 1, 'arts-crafts', 1, 0, '2016-11-07 18:14:41', '2016-11-22 16:07:06', NULL),
(130, 0, 'Astrology', 'Astrology Course', 'ASTRGY', 'bd2b8-astrology.jpg', 1, 'astrology', 1, 0, '2016-11-07 18:15:08', '2016-11-22 16:07:36', NULL),
(131, 0, 'Candle Making', 'Candle Making Course', 'CAMK', '631e5-candle-making.jpg', 1, 'candle-making', 1, 0, '2016-11-07 18:15:38', '2016-11-22 16:08:35', NULL),
(132, 0, 'Cooking & Baking', 'Cooking & Baking Course', 'CK&BK', 'c6bea-cooking-baking.jpg', 1, 'cooking-baking', 1, 0, '2016-11-07 18:16:05', '2016-11-22 16:08:59', NULL),
(133, 0, 'Drawing & Painting', 'Drawing & Painting Course', 'DR&PA', '5fe61-drawing-painting.jpg', 1, 'drawing-painting', 1, 0, '2016-11-07 18:16:25', '2016-11-22 16:11:28', NULL),
(134, 0, 'Fashion Designing', 'Fashion Designing Course', 'FSDS', '77f11-fashion-designing.jpg', 1, 'fashion-designing', 1, 0, '2016-11-07 18:16:58', '2016-11-22 16:12:27', NULL),
(135, 0, 'Horticulture', 'Horticulture Course', 'HRCL', 'd2a0c-horticulture.jpg', 1, 'horticulture', 1, 0, '2016-11-07 18:17:23', '2016-11-22 16:13:08', NULL),
(136, 0, 'Magic', 'Magic Course', 'MAGIC', 'd9e5b-magic.jpg', 1, 'magic', 1, 0, '2016-11-07 18:17:47', '2016-11-22 16:16:03', NULL),
(137, 0, 'Sculpture Making', 'Sculpture Making Course', 'SCUM', '7d6da-sculpture-making.jpg', 1, 'sculpture-making', 1, 0, '2016-11-07 18:18:09', '2016-11-22 16:17:49', NULL),
(138, 0, 'Summer Camps', 'Summer Camps Course', 'SUMCA', 'e3b3f-summer-camps.jpg', 1, 'summer-camps', 0, 0, '2016-11-07 18:18:34', '2016-11-22 16:18:31', NULL),
(139, 0, 'Jewellery Design', 'Jewellery Design Course', 'JEWDS', '6f102-jewellery-design.jpg', 1, 'jewellery-design', 1, 0, '2016-11-07 18:19:40', '2016-11-22 16:14:59', NULL),
(140, 0, 'ACET', 'ACET Course', 'ACET', 'a9b29-acet.jpg', 1, 'acet', 1, 0, '2016-11-07 18:26:31', '2016-11-22 16:03:34', '12'),
(141, 0, 'AFCAT', 'AFCAT Course', 'AFCAT', '1e14d-afcat.jpg', 1, 'afcat', 1, 0, '2016-11-07 18:26:46', '2016-11-22 16:06:13', '12'),
(142, 0, 'AMAESI', 'AMAESI Course', 'AMAESI', '27cce-amaesi.jpg', 1, 'amaesi', 0, 0, '2016-11-07 18:27:02', '2016-11-22 16:06:37', '12'),
(143, 0, 'Bank Clerical', 'Bank Clerical', 'BANKC', '518b4-bank-clerical.jpg', 1, 'bank-clerical', 1, 0, '2016-11-07 18:27:22', '2016-11-22 16:07:52', '12'),
(144, 0, 'Bank PO', 'Bank PO Course', 'BKPO', 'ec305-bank-po.jpg', 1, 'bank-po', 1, 0, '2016-11-07 18:27:55', '2016-11-22 16:08:05', '12'),
(145, 0, 'CSAT', 'CSAT Course', 'CSAT', '24106-csat.jpg', 1, 'csat', 1, 0, '2016-11-07 18:28:10', '2016-11-22 16:09:20', '12'),
(146, 0, 'CTET', 'CTET Course', 'CTET', 'd1887-image.jpg', 1, 'ctet', 1, 0, '2016-11-07 18:28:27', '2016-11-22 16:13:49', '12'),
(147, 0, 'CWE Coaching', 'CWE Coaching Course', 'CWE', 'ed7ad-cwe-coaching.jpg', 1, 'cwe-coaching', 0, 0, '2016-11-07 18:28:51', '2016-11-22 16:10:00', '12'),
(148, 0, 'Defence Exams', 'Defence Exams Course', 'DFEA', '47005-defence-exams.jpg', 1, 'defence-exams', 0, 0, '2016-11-07 18:29:16', '2016-11-22 16:10:31', '12'),
(149, 0, 'Forest Department Exam', 'Forest Department Exam Course', 'FDEA', 'bb304-forest-department-exam.jpg', 1, 'forest-department-exam', 0, 0, '2016-11-07 18:29:40', '2016-11-22 16:12:44', '12'),
(150, 0, 'DSSB', 'DSSB Course', 'DSSB', '1928d-dssb.jpg', 1, 'dssb', 0, 0, '2016-11-07 18:29:55', '2016-11-22 16:11:48', '12'),
(151, 0, 'IBPS', 'IBPS Course', 'IBPS', '8f702-ibps.jpg', 1, 'ibps', 1, 0, '2016-11-07 18:30:13', '2016-11-22 16:13:26', '12'),
(152, 0, 'IES Exam', 'IES Exam Course', 'IES', '908dd-ies-exam.jpg', 1, 'ies-exam', 1, 0, '2016-11-07 18:30:33', '2016-11-23 13:02:39', '12'),
(153, 0, 'Insurance Exams', 'Insurance Exams Course', 'ISEX', 'e7b25-insurance-exams.jpg', 1, 'insurance-exams', 0, 0, '2016-11-07 18:30:58', '2016-11-22 16:14:32', '12'),
(154, 0, 'KVPY Exam', 'KVPY Exam Course', 'KVPY ', '58330-kvpy-exam.jpg', 1, 'kvpy-exam', 0, 0, '2016-11-07 18:31:33', '2016-11-22 16:15:40', '12'),
(155, 0, 'MPPSC', 'MPPSC Course', 'MPPSC', '5abb2-mppsc.jpg', 1, 'mppsc', 0, 0, '2016-11-07 18:31:48', '2016-11-22 16:16:40', '12'),
(156, 0, 'EAMCET', 'EAMCET Course', 'EAMCET', '86c07-eamcet.jpg', 1, 'eamcet', 1, 0, '2016-11-07 18:32:06', '2016-11-22 16:12:08', '12'),
(157, 0, 'DMRC Entrance', 'DMRC Entrance Course', 'DMRC', '35cd9-dmrc-entrance.jpg', 1, 'dmrc-entrance', 0, 0, '2016-11-07 18:32:26', '2016-11-22 16:11:00', '12');

-- --------------------------------------------------------

--
-- Table structure for table `pre_certificates`
--

CREATE TABLE `pre_certificates` (
  `certificate_id` int(11) NOT NULL,
  `title` varchar(256) DEFAULT NULL,
  `description` text,
  `required` enum('Yes','No') DEFAULT 'No',
  `allowed_formats` varchar(256) DEFAULT 'jpg,gif,png,jpeg',
  `certificate_for` enum('tutors','institutes','students') DEFAULT NULL,
  `status` enum('Active','In-Active') DEFAULT 'Active',
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pre_certificates`
--

INSERT INTO `pre_certificates` (`certificate_id`, `title`, `description`, `required`, `allowed_formats`, `certificate_for`, `status`, `created`, `updated`) VALUES
(1, 'ID Card', '<p>\r\n	Your Proof</p>\r\n', 'Yes', 'jpg,gif,png,jpeg', 'tutors', 'Active', '2016-11-07 10:57:23', NULL),
(2, 'ID', '<p>\r\n	your id</p>\r\n', 'Yes', 'jpg,gif,png,jpeg', 'institutes', 'Active', '2016-11-07 11:13:38', NULL),
(3, 'ID Proof', '<p>\r\n	Proof</p>\r\n', 'Yes', 'jpg,gif,png,jpeg', 'students', 'Active', '2016-11-07 11:15:59', NULL),
(4, 'Exp Certificate', '<p>\r\n	exp</p>\r\n', 'No', 'jpg,gif,png,jpeg', 'tutors', 'Active', '2016-11-07 11:16:28', NULL),
(5, 'Higher Degree Certificate', '<p>\r\n	Certificate</p>\r\n', 'Yes', 'jpg,gif,png,jpeg', 'tutors', 'Active', '2016-11-07 11:16:58', NULL),
(6, 'Legal Cedrtificate', '<p>\r\n	Certificate</p>\r\n', 'Yes', 'jpg,gif,png,jpeg', 'institutes', 'Active', '2016-11-07 11:17:31', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `pre_country`
--

CREATE TABLE `pre_country` (
  `id` int(11) NOT NULL,
  `iso` char(2) NOT NULL,
  `name` varchar(80) NOT NULL,
  `nicename` varchar(80) NOT NULL,
  `iso3` char(3) DEFAULT NULL,
  `numcode` smallint(6) DEFAULT NULL,
  `phonecode` int(5) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pre_country`
--

INSERT INTO `pre_country` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES
(1, 'AF', 'AFGHANISTAN', 'Afghanistan', 'AFG', 4, 93),
(2, 'AL', 'ALBANIA', 'Albania', 'ALB', 8, 355),
(3, 'DZ', 'ALGERIA', 'Algeria', 'DZA', 12, 213),
(4, 'AS', 'AMERICAN SAMOA', 'American Samoa', 'ASM', 16, 1684),
(5, 'AD', 'ANDORRA', 'Andorra', 'AND', 20, 376),
(6, 'AO', 'ANGOLA', 'Angola', 'AGO', 24, 244),
(7, 'AI', 'ANGUILLA', 'Anguilla', 'AIA', 660, 1264),
(8, 'AQ', 'ANTARCTICA', 'Antarctica', NULL, NULL, 0),
(9, 'AG', 'ANTIGUA AND BARBUDA', 'Antigua and Barbuda', 'ATG', 28, 1268),
(10, 'AR', 'ARGENTINA', 'Argentina', 'ARG', 32, 54),
(11, 'AM', 'ARMENIA', 'Armenia', 'ARM', 51, 374),
(12, 'AW', 'ARUBA', 'Aruba', 'ABW', 533, 297),
(13, 'AU', 'AUSTRALIA', 'Australia', 'AUS', 36, 61),
(14, 'AT', 'AUSTRIA', 'Austria', 'AUT', 40, 43),
(15, 'AZ', 'AZERBAIJAN', 'Azerbaijan', 'AZE', 31, 994),
(16, 'BS', 'BAHAMAS', 'Bahamas', 'BHS', 44, 1242),
(17, 'BH', 'BAHRAIN', 'Bahrain', 'BHR', 48, 973),
(18, 'BD', 'BANGLADESH', 'Bangladesh', 'BGD', 50, 880),
(19, 'BB', 'BARBADOS', 'Barbados', 'BRB', 52, 1246),
(20, 'BY', 'BELARUS', 'Belarus', 'BLR', 112, 375),
(21, 'BE', 'BELGIUM', 'Belgium', 'BEL', 56, 32),
(22, 'BZ', 'BELIZE', 'Belize', 'BLZ', 84, 501),
(23, 'BJ', 'BENIN', 'Benin', 'BEN', 204, 229),
(24, 'BM', 'BERMUDA', 'Bermuda', 'BMU', 60, 1441),
(25, 'BT', 'BHUTAN', 'Bhutan', 'BTN', 64, 975),
(26, 'BO', 'BOLIVIA', 'Bolivia', 'BOL', 68, 591),
(27, 'BA', 'BOSNIA AND HERZEGOVINA', 'Bosnia and Herzegovina', 'BIH', 70, 387),
(28, 'BW', 'BOTSWANA', 'Botswana', 'BWA', 72, 267),
(29, 'BV', 'BOUVET ISLAND', 'Bouvet Island', NULL, NULL, 0),
(30, 'BR', 'BRAZIL', 'Brazil', 'BRA', 76, 55),
(31, 'IO', 'BRITISH INDIAN OCEAN TERRITORY', 'British Indian Ocean Territory', NULL, NULL, 246),
(32, 'BN', 'BRUNEI DARUSSALAM', 'Brunei Darussalam', 'BRN', 96, 673),
(33, 'BG', 'BULGARIA', 'Bulgaria', 'BGR', 100, 359),
(34, 'BF', 'BURKINA FASO', 'Burkina Faso', 'BFA', 854, 226),
(35, 'BI', 'BURUNDI', 'Burundi', 'BDI', 108, 257),
(36, 'KH', 'CAMBODIA', 'Cambodia', 'KHM', 116, 855),
(37, 'CM', 'CAMEROON', 'Cameroon', 'CMR', 120, 237),
(38, 'CA', 'CANADA', 'Canada', 'CAN', 124, 1),
(39, 'CV', 'CAPE VERDE', 'Cape Verde', 'CPV', 132, 238),
(40, 'KY', 'CAYMAN ISLANDS', 'Cayman Islands', 'CYM', 136, 1345),
(41, 'CF', 'CENTRAL AFRICAN REPUBLIC', 'Central African Republic', 'CAF', 140, 236),
(42, 'TD', 'CHAD', 'Chad', 'TCD', 148, 235),
(43, 'CL', 'CHILE', 'Chile', 'CHL', 152, 56),
(44, 'CN', 'CHINA', 'China', 'CHN', 156, 86),
(45, 'CX', 'CHRISTMAS ISLAND', 'Christmas Island', NULL, NULL, 61),
(46, 'CC', 'COCOS (KEELING) ISLANDS', 'Cocos (Keeling) Islands', NULL, NULL, 672),
(47, 'CO', 'COLOMBIA', 'Colombia', 'COL', 170, 57),
(48, 'KM', 'COMOROS', 'Comoros', 'COM', 174, 269),
(49, 'CG', 'CONGO', 'Congo', 'COG', 178, 242),
(50, 'CD', 'CONGO, THE DEMOCRATIC REPUBLIC OF THE', 'Congo, the Democratic Republic of the', 'COD', 180, 242),
(51, 'CK', 'COOK ISLANDS', 'Cook Islands', 'COK', 184, 682),
(52, 'CR', 'COSTA RICA', 'Costa Rica', 'CRI', 188, 506),
(53, 'CI', 'COTE D\'IVOIRE', 'Cote D\'Ivoire', 'CIV', 384, 225),
(54, 'HR', 'CROATIA', 'Croatia', 'HRV', 191, 385),
(55, 'CU', 'CUBA', 'Cuba', 'CUB', 192, 53),
(56, 'CY', 'CYPRUS', 'Cyprus', 'CYP', 196, 357),
(57, 'CZ', 'CZECH REPUBLIC', 'Czech Republic', 'CZE', 203, 420),
(58, 'DK', 'DENMARK', 'Denmark', 'DNK', 208, 45),
(59, 'DJ', 'DJIBOUTI', 'Djibouti', 'DJI', 262, 253),
(60, 'DM', 'DOMINICA', 'Dominica', 'DMA', 212, 1767),
(61, 'DO', 'DOMINICAN REPUBLIC', 'Dominican Republic', 'DOM', 214, 1809),
(62, 'EC', 'ECUADOR', 'Ecuador', 'ECU', 218, 593),
(63, 'EG', 'EGYPT', 'Egypt', 'EGY', 818, 20),
(64, 'SV', 'EL SALVADOR', 'El Salvador', 'SLV', 222, 503),
(65, 'GQ', 'EQUATORIAL GUINEA', 'Equatorial Guinea', 'GNQ', 226, 240),
(66, 'ER', 'ERITREA', 'Eritrea', 'ERI', 232, 291),
(67, 'EE', 'ESTONIA', 'Estonia', 'EST', 233, 372),
(68, 'ET', 'ETHIOPIA', 'Ethiopia', 'ETH', 231, 251),
(69, 'FK', 'FALKLAND ISLANDS (MALVINAS)', 'Falkland Islands (Malvinas)', 'FLK', 238, 500),
(70, 'FO', 'FAROE ISLANDS', 'Faroe Islands', 'FRO', 234, 298),
(71, 'FJ', 'FIJI', 'Fiji', 'FJI', 242, 679),
(72, 'FI', 'FINLAND', 'Finland', 'FIN', 246, 358),
(73, 'FR', 'FRANCE', 'France', 'FRA', 250, 33),
(74, 'GF', 'FRENCH GUIANA', 'French Guiana', 'GUF', 254, 594),
(75, 'PF', 'FRENCH POLYNESIA', 'French Polynesia', 'PYF', 258, 689),
(76, 'TF', 'FRENCH SOUTHERN TERRITORIES', 'French Southern Territories', NULL, NULL, 0),
(77, 'GA', 'GABON', 'Gabon', 'GAB', 266, 241),
(78, 'GM', 'GAMBIA', 'Gambia', 'GMB', 270, 220),
(79, 'GE', 'GEORGIA', 'Georgia', 'GEO', 268, 995),
(80, 'DE', 'GERMANY', 'Germany', 'DEU', 276, 49),
(81, 'GH', 'GHANA', 'Ghana', 'GHA', 288, 233),
(82, 'GI', 'GIBRALTAR', 'Gibraltar', 'GIB', 292, 350),
(83, 'GR', 'GREECE', 'Greece', 'GRC', 300, 30),
(84, 'GL', 'GREENLAND', 'Greenland', 'GRL', 304, 299),
(85, 'GD', 'GRENADA', 'Grenada', 'GRD', 308, 1473),
(86, 'GP', 'GUADELOUPE', 'Guadeloupe', 'GLP', 312, 590),
(87, 'GU', 'GUAM', 'Guam', 'GUM', 316, 1671),
(88, 'GT', 'GUATEMALA', 'Guatemala', 'GTM', 320, 502),
(89, 'GN', 'GUINEA', 'Guinea', 'GIN', 324, 224),
(90, 'GW', 'GUINEA-BISSAU', 'Guinea-Bissau', 'GNB', 624, 245),
(91, 'GY', 'GUYANA', 'Guyana', 'GUY', 328, 592),
(92, 'HT', 'HAITI', 'Haiti', 'HTI', 332, 509),
(93, 'HM', 'HEARD ISLAND AND MCDONALD ISLANDS', 'Heard Island and Mcdonald Islands', NULL, NULL, 0),
(94, 'VA', 'HOLY SEE (VATICAN CITY STATE)', 'Holy See (Vatican City State)', 'VAT', 336, 39),
(95, 'HN', 'HONDURAS', 'Honduras', 'HND', 340, 504),
(96, 'HK', 'HONG KONG', 'Hong Kong', 'HKG', 344, 852),
(97, 'HU', 'HUNGARY', 'Hungary', 'HUN', 348, 36),
(98, 'IS', 'ICELAND', 'Iceland', 'ISL', 352, 354),
(99, 'IN', 'INDIA', 'India', 'IND', 356, 91),
(100, 'ID', 'INDONESIA', 'Indonesia', 'IDN', 360, 62),
(101, 'IR', 'IRAN, ISLAMIC REPUBLIC OF', 'Iran, Islamic Republic of', 'IRN', 364, 98),
(102, 'IQ', 'IRAQ', 'Iraq', 'IRQ', 368, 964),
(103, 'IE', 'IRELAND', 'Ireland', 'IRL', 372, 353),
(104, 'IL', 'ISRAEL', 'Israel', 'ISR', 376, 972),
(105, 'IT', 'ITALY', 'Italy', 'ITA', 380, 39),
(106, 'JM', 'JAMAICA', 'Jamaica', 'JAM', 388, 1876),
(107, 'JP', 'JAPAN', 'Japan', 'JPN', 392, 81),
(108, 'JO', 'JORDAN', 'Jordan', 'JOR', 400, 962),
(109, 'KZ', 'KAZAKHSTAN', 'Kazakhstan', 'KAZ', 398, 7),
(110, 'KE', 'KENYA', 'Kenya', 'KEN', 404, 254),
(111, 'KI', 'KIRIBATI', 'Kiribati', 'KIR', 296, 686),
(112, 'KP', 'KOREA, DEMOCRATIC PEOPLE\'S REPUBLIC OF', 'Korea, Democratic People\'s Republic of', 'PRK', 408, 850),
(113, 'KR', 'KOREA, REPUBLIC OF', 'Korea, Republic of', 'KOR', 410, 82),
(114, 'KW', 'KUWAIT', 'Kuwait', 'KWT', 414, 965),
(115, 'KG', 'KYRGYZSTAN', 'Kyrgyzstan', 'KGZ', 417, 996),
(116, 'LA', 'LAO PEOPLE\'S DEMOCRATIC REPUBLIC', 'Lao People\'s Democratic Republic', 'LAO', 418, 856),
(117, 'LV', 'LATVIA', 'Latvia', 'LVA', 428, 371),
(118, 'LB', 'LEBANON', 'Lebanon', 'LBN', 422, 961),
(119, 'LS', 'LESOTHO', 'Lesotho', 'LSO', 426, 266),
(120, 'LR', 'LIBERIA', 'Liberia', 'LBR', 430, 231),
(121, 'LY', 'LIBYAN ARAB JAMAHIRIYA', 'Libyan Arab Jamahiriya', 'LBY', 434, 218),
(122, 'LI', 'LIECHTENSTEIN', 'Liechtenstein', 'LIE', 438, 423),
(123, 'LT', 'LITHUANIA', 'Lithuania', 'LTU', 440, 370),
(124, 'LU', 'LUXEMBOURG', 'Luxembourg', 'LUX', 442, 352),
(125, 'MO', 'MACAO', 'Macao', 'MAC', 446, 853),
(126, 'MK', 'MACEDONIA, THE FORMER YUGOSLAV REPUBLIC OF', 'Macedonia, the Former Yugoslav Republic of', 'MKD', 807, 389),
(127, 'MG', 'MADAGASCAR', 'Madagascar', 'MDG', 450, 261),
(128, 'MW', 'MALAWI', 'Malawi', 'MWI', 454, 265),
(129, 'MY', 'MALAYSIA', 'Malaysia', 'MYS', 458, 60),
(130, 'MV', 'MALDIVES', 'Maldives', 'MDV', 462, 960),
(131, 'ML', 'MALI', 'Mali', 'MLI', 466, 223),
(132, 'MT', 'MALTA', 'Malta', 'MLT', 470, 356),
(133, 'MH', 'MARSHALL ISLANDS', 'Marshall Islands', 'MHL', 584, 692),
(134, 'MQ', 'MARTINIQUE', 'Martinique', 'MTQ', 474, 596),
(135, 'MR', 'MAURITANIA', 'Mauritania', 'MRT', 478, 222),
(136, 'MU', 'MAURITIUS', 'Mauritius', 'MUS', 480, 230),
(137, 'YT', 'MAYOTTE', 'Mayotte', NULL, NULL, 269),
(138, 'MX', 'MEXICO', 'Mexico', 'MEX', 484, 52),
(139, 'FM', 'MICRONESIA, FEDERATED STATES OF', 'Micronesia, Federated States of', 'FSM', 583, 691),
(140, 'MD', 'MOLDOVA, REPUBLIC OF', 'Moldova, Republic of', 'MDA', 498, 373),
(141, 'MC', 'MONACO', 'Monaco', 'MCO', 492, 377),
(142, 'MN', 'MONGOLIA', 'Mongolia', 'MNG', 496, 976),
(143, 'MS', 'MONTSERRAT', 'Montserrat', 'MSR', 500, 1664),
(144, 'MA', 'MOROCCO', 'Morocco', 'MAR', 504, 212),
(145, 'MZ', 'MOZAMBIQUE', 'Mozambique', 'MOZ', 508, 258),
(146, 'MM', 'MYANMAR', 'Myanmar', 'MMR', 104, 95),
(147, 'NA', 'NAMIBIA', 'Namibia', 'NAM', 516, 264),
(148, 'NR', 'NAURU', 'Nauru', 'NRU', 520, 674),
(149, 'NP', 'NEPAL', 'Nepal', 'NPL', 524, 977),
(150, 'NL', 'NETHERLANDS', 'Netherlands', 'NLD', 528, 31),
(151, 'AN', 'NETHERLANDS ANTILLES', 'Netherlands Antilles', 'ANT', 530, 599),
(152, 'NC', 'NEW CALEDONIA', 'New Caledonia', 'NCL', 540, 687),
(153, 'NZ', 'NEW ZEALAND', 'New Zealand', 'NZL', 554, 64),
(154, 'NI', 'NICARAGUA', 'Nicaragua', 'NIC', 558, 505),
(155, 'NE', 'NIGER', 'Niger', 'NER', 562, 227),
(156, 'NG', 'NIGERIA', 'Nigeria', 'NGA', 566, 234),
(157, 'NU', 'NIUE', 'Niue', 'NIU', 570, 683),
(158, 'NF', 'NORFOLK ISLAND', 'Norfolk Island', 'NFK', 574, 672),
(159, 'MP', 'NORTHERN MARIANA ISLANDS', 'Northern Mariana Islands', 'MNP', 580, 1670),
(160, 'NO', 'NORWAY', 'Norway', 'NOR', 578, 47),
(161, 'OM', 'OMAN', 'Oman', 'OMN', 512, 968),
(162, 'PK', 'PAKISTAN', 'Pakistan', 'PAK', 586, 92),
(163, 'PW', 'PALAU', 'Palau', 'PLW', 585, 680),
(164, 'PS', 'PALESTINIAN TERRITORY, OCCUPIED', 'Palestinian Territory, Occupied', NULL, NULL, 970),
(165, 'PA', 'PANAMA', 'Panama', 'PAN', 591, 507),
(166, 'PG', 'PAPUA NEW GUINEA', 'Papua New Guinea', 'PNG', 598, 675),
(167, 'PY', 'PARAGUAY', 'Paraguay', 'PRY', 600, 595),
(168, 'PE', 'PERU', 'Peru', 'PER', 604, 51),
(169, 'PH', 'PHILIPPINES', 'Philippines', 'PHL', 608, 63),
(170, 'PN', 'PITCAIRN', 'Pitcairn', 'PCN', 612, 0),
(171, 'PL', 'POLAND', 'Poland', 'POL', 616, 48),
(172, 'PT', 'PORTUGAL', 'Portugal', 'PRT', 620, 351),
(173, 'PR', 'PUERTO RICO', 'Puerto Rico', 'PRI', 630, 1787),
(174, 'QA', 'QATAR', 'Qatar', 'QAT', 634, 974),
(175, 'RE', 'REUNION', 'Reunion', 'REU', 638, 262),
(176, 'RO', 'ROMANIA', 'Romania', 'ROM', 642, 40),
(177, 'RU', 'RUSSIAN FEDERATION', 'Russian Federation', 'RUS', 643, 70),
(178, 'RW', 'RWANDA', 'Rwanda', 'RWA', 646, 250),
(179, 'SH', 'SAINT HELENA', 'Saint Helena', 'SHN', 654, 290),
(180, 'KN', 'SAINT KITTS AND NEVIS', 'Saint Kitts and Nevis', 'KNA', 659, 1869),
(181, 'LC', 'SAINT LUCIA', 'Saint Lucia', 'LCA', 662, 1758),
(182, 'PM', 'SAINT PIERRE AND MIQUELON', 'Saint Pierre and Miquelon', 'SPM', 666, 508),
(183, 'VC', 'SAINT VINCENT AND THE GRENADINES', 'Saint Vincent and the Grenadines', 'VCT', 670, 1784),
(184, 'WS', 'SAMOA', 'Samoa', 'WSM', 882, 684),
(185, 'SM', 'SAN MARINO', 'San Marino', 'SMR', 674, 378),
(186, 'ST', 'SAO TOME AND PRINCIPE', 'Sao Tome and Principe', 'STP', 678, 239),
(187, 'SA', 'SAUDI ARABIA', 'Saudi Arabia', 'SAU', 682, 966),
(188, 'SN', 'SENEGAL', 'Senegal', 'SEN', 686, 221),
(189, 'CS', 'SERBIA AND MONTENEGRO', 'Serbia and Montenegro', NULL, NULL, 381),
(190, 'SC', 'SEYCHELLES', 'Seychelles', 'SYC', 690, 248),
(191, 'SL', 'SIERRA LEONE', 'Sierra Leone', 'SLE', 694, 232),
(192, 'SG', 'SINGAPORE', 'Singapore', 'SGP', 702, 65),
(193, 'SK', 'SLOVAKIA', 'Slovakia', 'SVK', 703, 421),
(194, 'SI', 'SLOVENIA', 'Slovenia', 'SVN', 705, 386),
(195, 'SB', 'SOLOMON ISLANDS', 'Solomon Islands', 'SLB', 90, 677),
(196, 'SO', 'SOMALIA', 'Somalia', 'SOM', 706, 252),
(197, 'ZA', 'SOUTH AFRICA', 'South Africa', 'ZAF', 710, 27),
(198, 'GS', 'SOUTH GEORGIA AND THE SOUTH SANDWICH ISLANDS', 'South Georgia and the South Sandwich Islands', NULL, NULL, 0),
(199, 'ES', 'SPAIN', 'Spain', 'ESP', 724, 34),
(200, 'LK', 'SRI LANKA', 'Sri Lanka', 'LKA', 144, 94),
(201, 'SD', 'SUDAN', 'Sudan', 'SDN', 736, 249),
(202, 'SR', 'SURINAME', 'Suriname', 'SUR', 740, 597),
(203, 'SJ', 'SVALBARD AND JAN MAYEN', 'Svalbard and Jan Mayen', 'SJM', 744, 47),
(204, 'SZ', 'SWAZILAND', 'Swaziland', 'SWZ', 748, 268),
(205, 'SE', 'SWEDEN', 'Sweden', 'SWE', 752, 46),
(206, 'CH', 'SWITZERLAND', 'Switzerland', 'CHE', 756, 41),
(207, 'SY', 'SYRIAN ARAB REPUBLIC', 'Syrian Arab Republic', 'SYR', 760, 963),
(208, 'TW', 'TAIWAN, PROVINCE OF CHINA', 'Taiwan, Province of China', 'TWN', 158, 886),
(209, 'TJ', 'TAJIKISTAN', 'Tajikistan', 'TJK', 762, 992),
(210, 'TZ', 'TANZANIA, UNITED REPUBLIC OF', 'Tanzania, United Republic of', 'TZA', 834, 255),
(211, 'TH', 'THAILAND', 'Thailand', 'THA', 764, 66),
(212, 'TL', 'TIMOR-LESTE', 'Timor-Leste', NULL, NULL, 670),
(213, 'TG', 'TOGO', 'Togo', 'TGO', 768, 228),
(214, 'TK', 'TOKELAU', 'Tokelau', 'TKL', 772, 690),
(215, 'TO', 'TONGA', 'Tonga', 'TON', 776, 676),
(216, 'TT', 'TRINIDAD AND TOBAGO', 'Trinidad and Tobago', 'TTO', 780, 1868),
(217, 'TN', 'TUNISIA', 'Tunisia', 'TUN', 788, 216),
(218, 'TR', 'TURKEY', 'Turkey', 'TUR', 792, 90),
(219, 'TM', 'TURKMENISTAN', 'Turkmenistan', 'TKM', 795, 7370),
(220, 'TC', 'TURKS AND CAICOS ISLANDS', 'Turks and Caicos Islands', 'TCA', 796, 1649),
(221, 'TV', 'TUVALU', 'Tuvalu', 'TUV', 798, 688),
(222, 'UG', 'UGANDA', 'Uganda', 'UGA', 800, 256),
(223, 'UA', 'UKRAINE', 'Ukraine', 'UKR', 804, 380),
(224, 'AE', 'UNITED ARAB EMIRATES', 'United Arab Emirates', 'ARE', 784, 971),
(225, 'GB', 'UNITED KINGDOM', 'United Kingdom', 'GBR', 826, 44),
(226, 'US', 'UNITED STATES', 'United States', 'USA', 840, 1),
(227, 'UM', 'UNITED STATES MINOR OUTLYING ISLANDS', 'United States Minor Outlying Islands', NULL, NULL, 1),
(228, 'UY', 'URUGUAY', 'Uruguay', 'URY', 858, 598),
(229, 'UZ', 'UZBEKISTAN', 'Uzbekistan', 'UZB', 860, 998),
(230, 'VU', 'VANUATU', 'Vanuatu', 'VUT', 548, 678),
(231, 'VE', 'VENEZUELA', 'Venezuela', 'VEN', 862, 58),
(232, 'VN', 'VIET NAM', 'Viet Nam', 'VNM', 704, 84),
(233, 'VG', 'VIRGIN ISLANDS, BRITISH', 'Virgin Islands, British', 'VGB', 92, 1284),
(234, 'VI', 'VIRGIN ISLANDS, U.S.', 'Virgin Islands, U.s.', 'VIR', 850, 1340),
(235, 'WF', 'WALLIS AND FUTUNA', 'Wallis and Futuna', 'WLF', 876, 681),
(236, 'EH', 'WESTERN SAHARA', 'Western Sahara', 'ESH', 732, 212),
(237, 'YE', 'YEMEN', 'Yemen', 'YEM', 887, 967),
(238, 'ZM', 'ZAMBIA', 'Zambia', 'ZMB', 894, 260),
(239, 'ZW', 'ZIMBABWE', 'Zimbabwe', 'ZWE', 716, 263),
(240, 'RS', 'SERBIA', 'Serbia', 'SRB', 688, 381),
(241, 'AP', 'ASIA PACIFIC REGION', 'Asia / Pacific Region', '0', 0, 0),
(242, 'ME', 'MONTENEGRO', 'Montenegro', 'MNE', 499, 382),
(243, 'AX', 'ALAND ISLANDS', 'Aland Islands', 'ALA', 248, 358),
(244, 'BQ', 'BONAIRE, SINT EUSTATIUS AND SABA', 'Bonaire, Sint Eustatius and Saba', 'BES', 535, 599),
(245, 'CW', 'CURACAO', 'Curacao', 'CUW', 531, 599),
(246, 'GG', 'GUERNSEY', 'Guernsey', 'GGY', 831, 44),
(247, 'IM', 'ISLE OF MAN', 'Isle of Man', 'IMN', 833, 44),
(248, 'JE', 'JERSEY', 'Jersey', 'JEY', 832, 44),
(249, 'XK', 'KOSOVO', 'Kosovo', '---', 0, 381),
(250, 'BL', 'SAINT BARTHELEMY', 'Saint Barthelemy', 'BLM', 652, 590),
(251, 'MF', 'SAINT MARTIN', 'Saint Martin', 'MAF', 663, 590),
(252, 'SX', 'SINT MAARTEN', 'Sint Maarten', 'SXM', 534, 1),
(253, 'SS', 'SOUTH SUDAN', 'South Sudan', 'SSD', 728, 211);

-- --------------------------------------------------------

--
-- Table structure for table `pre_course_categories`
--

CREATE TABLE `pre_course_categories` (
  `id` int(11) UNSIGNED NOT NULL,
  `course_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='For course_id and category_id, refer pre_categories tbl(is_parent=0 mean course)';

--
-- Dumping data for table `pre_course_categories`
--

INSERT INTO `pre_course_categories` (`id`, `course_id`, `category_id`) VALUES
(170, 140, 12),
(171, 141, 12),
(172, 142, 12),
(173, 143, 12),
(174, 144, 12),
(175, 145, 12),
(177, 147, 12),
(178, 148, 12),
(179, 157, 12),
(180, 150, 12),
(181, 156, 12),
(182, 149, 12),
(183, 151, 12),
(184, 146, 12),
(185, 118, 10),
(186, 153, 12),
(187, 119, 10),
(188, 154, 12),
(189, 120, 10),
(190, 155, 12),
(191, 121, 10),
(192, 122, 10),
(193, 123, 10),
(194, 125, 10),
(195, 124, 10),
(196, 117, 10),
(197, 116, 10),
(198, 115, 10),
(199, 114, 9),
(200, 113, 9),
(201, 112, 9),
(202, 111, 9),
(203, 110, 9),
(204, 109, 9),
(205, 108, 9),
(206, 107, 9),
(207, 106, 9),
(208, 105, 9),
(209, 104, 9),
(210, 103, 9),
(211, 102, 9),
(212, 101, 8),
(213, 100, 8),
(214, 99, 8),
(215, 98, 8),
(216, 97, 8),
(217, 96, 8),
(218, 95, 8),
(219, 94, 8),
(220, 91, 8),
(221, 90, 8),
(222, 89, 8),
(223, 88, 8),
(224, 87, 8),
(225, 86, 8),
(226, 85, 7),
(227, 84, 7),
(229, 82, 7),
(230, 81, 7),
(231, 80, 7),
(232, 79, 7),
(234, 78, 7),
(235, 77, 7),
(236, 76, 7),
(238, 74, 7),
(239, 73, 6),
(240, 72, 6),
(241, 71, 6),
(242, 70, 6),
(243, 69, 6),
(244, 68, 6),
(245, 75, 7),
(246, 67, 6),
(247, 66, 6),
(248, 65, 6),
(249, 64, 6),
(250, 63, 6),
(251, 62, 5),
(252, 61, 5),
(253, 60, 5),
(255, 59, 5),
(256, 58, 5),
(257, 57, 5),
(258, 56, 5),
(259, 55, 5),
(260, 54, 5),
(261, 53, 5),
(262, 52, 4),
(263, 51, 4),
(264, 50, 4),
(265, 49, 4),
(266, 48, 4),
(267, 47, 4),
(268, 46, 4),
(269, 45, 4),
(270, 44, 4),
(271, 43, 4),
(272, 42, 4),
(273, 41, 3),
(274, 40, 3),
(275, 39, 3),
(277, 37, 2),
(278, 36, 2),
(279, 35, 2),
(280, 34, 2),
(281, 33, 2),
(282, 32, 2),
(283, 31, 2),
(284, 30, 2),
(285, 29, 1),
(286, 28, 1),
(287, 27, 1),
(288, 26, 1),
(289, 25, 1),
(290, 24, 1),
(291, 23, 1),
(292, 22, 1),
(293, 21, 1),
(294, 20, 1),
(295, 19, 1),
(296, 18, 1),
(297, 17, 1),
(298, 16, 1),
(299, 14, 1),
(300, 13, 1),
(301, 15, 1),
(303, 152, 12),
(304, 93, 8),
(305, 83, 7),
(306, 38, 3);

-- --------------------------------------------------------

--
-- Table structure for table `pre_course_downloads`
--

CREATE TABLE `pre_course_downloads` (
  `cd_id` bigint(20) NOT NULL,
  `purchase_id` bigint(20) NOT NULL,
  `sc_id` int(11) NOT NULL,
  `tutor_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `ip_address` varchar(25) NOT NULL,
  `browser` varchar(50) NOT NULL,
  `browser_version` varchar(25) NOT NULL,
  `platform` varchar(50) NOT NULL,
  `mobile_device` varchar(50) NOT NULL,
  `robot` varchar(512) NOT NULL,
  `is_download_success` enum('Yes','No') NOT NULL DEFAULT 'Yes',
  `downloaded_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pre_course_downloads`
--

INSERT INTO `pre_course_downloads` (`cd_id`, `purchase_id`, `sc_id`, `tutor_id`, `user_id`, `ip_address`, `browser`, `browser_version`, `platform`, `mobile_device`, `robot`, `is_download_success`, `downloaded_date`) VALUES
(1, 1, 17, 7, 3, '10.0.0.16', 'Firefox', '51.0', 'Linux', '', '', 'Yes', '2017-02-24 17:39:08'),
(2, 1, 17, 7, 3, '10.0.0.16', 'Firefox', '51.0', 'Linux', '', '', 'Yes', '2017-02-24 17:39:29'),
(3, 1, 17, 7, 3, '10.0.0.16', 'Firefox', '51.0', 'Linux', '', '', 'Yes', '2017-02-24 17:39:49'),
(4, 1, 17, 7, 3, '10.0.0.16', 'Firefox', '51.0', 'Linux', '', '', 'Yes', '2017-02-24 17:40:00'),
(5, 2, 2, 7, 3, '10.0.0.16', 'Firefox', '51.0', 'Linux', '', '', 'Yes', '2017-02-24 17:42:53'),
(6, 2, 2, 7, 3, '10.0.0.16', 'Firefox', '51.0', 'Linux', '', '', 'Yes', '2017-02-24 17:44:47'),
(7, 4, 15, 7, 3, '10.0.0.16', 'Firefox', '51.0', 'Linux', '', '', 'Yes', '2017-02-24 17:47:49'),
(8, 3, 8, 7, 3, '10.0.0.16', 'Firefox', '51.0', 'Linux', '', '', 'Yes', '2017-02-24 17:47:57'),
(9, 3, 8, 7, 3, '10.0.0.16', 'Firefox', '51.0', 'Linux', '', '', 'Yes', '2017-02-24 17:48:01'),
(10, 6, 13, 7, 2, '10.0.0.16', 'Firefox', '51.0', 'Linux', '', '', 'Yes', '2017-02-24 17:54:30'),
(11, 5, 9, 7, 2, '10.0.0.16', 'Firefox', '51.0', 'Linux', '', '', 'Yes', '2017-02-24 17:54:33'),
(12, 7, 20, 7, 2, '10.0.0.16', 'Firefox', '51.0', 'Linux', '', '', 'Yes', '2017-02-24 17:54:36'),
(13, 8, 19, 7, 2, '10.0.0.16', 'Firefox', '51.0', 'Linux', '', '', 'Yes', '2017-02-24 17:54:38'),
(14, 5, 9, 7, 2, '10.0.0.16', 'Firefox', '51.0', 'Linux', '', '', 'Yes', '2017-02-24 17:54:42'),
(15, 8, 19, 7, 2, '10.0.0.16', 'Firefox', '51.0', 'Linux', '', '', 'Yes', '2017-02-24 17:54:46'),
(16, 6, 13, 7, 2, '10.0.0.16', 'Firefox', '51.0', 'Linux', '', '', 'Yes', '2017-02-24 17:54:48');

-- --------------------------------------------------------

--
-- Table structure for table `pre_course_purchases`
--

CREATE TABLE `pre_course_purchases` (
  `purchase_id` bigint(20) NOT NULL,
  `sc_id` int(11) NOT NULL,
  `tutor_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `total_amount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `admin_commission_percentage` decimal(10,2) NOT NULL DEFAULT '0.00',
  `admin_commission_val` decimal(10,2) NOT NULL DEFAULT '0.00',
  `max_downloads` int(11) NOT NULL,
  `total_downloads` int(11) NOT NULL DEFAULT '0',
  `payment_gateway_id` int(11) NOT NULL,
  `paid_date` varchar(50) DEFAULT NULL,
  `paid_amount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `transaction_id` varchar(100) DEFAULT NULL,
  `payer_id` varchar(50) DEFAULT NULL,
  `payer_email` varchar(50) DEFAULT NULL,
  `payer_name` varchar(50) DEFAULT NULL,
  `payment_status` varchar(50) DEFAULT NULL,
  `status_of_payment_to_tutor` enum('Pending','Completed','Cancelled') NOT NULL DEFAULT 'Pending',
  `tutor_payment_details` varchar(1000) DEFAULT NULL,
  `last_modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pre_course_purchases`
--

INSERT INTO `pre_course_purchases` (`purchase_id`, `sc_id`, `tutor_id`, `user_id`, `total_amount`, `admin_commission_percentage`, `admin_commission_val`, `max_downloads`, `total_downloads`, `payment_gateway_id`, `paid_date`, `paid_amount`, `transaction_id`, `payer_id`, `payer_email`, `payer_name`, `payment_status`, `status_of_payment_to_tutor`, `tutor_payment_details`, `last_modified`) VALUES
(1, 17, 7, 3, '25.00', '10.00', '2.50', 4, 4, 28, '04:08:39 Feb 24, 2017 PST', '25.00', '0KX89230LA045973G', 'F2TMN4DXTNFZS', 'conqtech7-buyer@gmail.com', 'test buyer', 'Completed', 'Pending', NULL, '2017-02-24 17:38:01'),
(2, 2, 7, 3, '15.00', '10.00', '1.50', 10, 2, 28, '04:12:31 Feb 24, 2017 PST', '15.00', '6E12148838069451H', 'F2TMN4DXTNFZS', 'conqtech7-buyer@gmail.com', 'test buyer', 'Completed', 'Pending', NULL, '2017-02-24 17:42:05'),
(3, 8, 7, 3, '15.00', '10.00', '1.50', 6, 2, 28, '2017-02-24T12:15:56Z', '15.00', '6P911968PM9146541', 'F2TMN4DXTNFZS', 'conqtech7-buyer@gmail.com', 'test buyer', 'Completed', 'Pending', NULL, '2017-02-24 17:45:19'),
(4, 15, 7, 3, '20.00', '10.00', '2.00', 6, 1, 28, '2017-02-24T12:17:25Z', '20.00', '2NS35169P7055024G', 'F2TMN4DXTNFZS', 'conqtech7-buyer@gmail.com', 'test buyer', 'Completed', 'Pending', NULL, '2017-02-24 17:47:10'),
(5, 9, 7, 2, '15.00', '10.00', '1.50', 4, 2, 28, '2017-02-24T12:21:04Z', '15.00', '9FM24408HC572594Y', 'F2TMN4DXTNFZS', 'conqtech7-buyer@gmail.com', 'test buyer', 'Completed', 'Pending', NULL, '2017-02-24 17:50:49'),
(6, 13, 7, 2, '25.00', '10.00', '2.50', 4, 2, 28, '04:22:01 Feb 24, 2017 PST', '25.00', '1LX86264MN739704V', 'F2TMN4DXTNFZS', 'conqtech7-buyer@gmail.com', 'test buyer', 'Completed', 'Pending', NULL, '2017-02-24 17:51:29'),
(7, 20, 7, 2, '20.00', '10.00', '2.00', 5, 1, 28, '2017-02-24T12:22:59Z', '20.00', '7WK575170M917494L', 'F2TMN4DXTNFZS', 'conqtech7-buyer@gmail.com', 'test buyer', 'Completed', 'Pending', NULL, '2017-02-24 17:52:40'),
(8, 19, 7, 2, '30.00', '10.00', '3.00', 6, 2, 28, '04:23:55 Feb 24, 2017 PST', '30.00', '4UH765620V595141Y', 'F2TMN4DXTNFZS', 'conqtech7-buyer@gmail.com', 'test buyer', 'Completed', 'Pending', NULL, '2017-02-24 17:53:34'),
(9, 9, 7, 2, '15.00', '10.00', '1.50', 4, 0, 28, '05:01:19 Feb 24, 2017 PST', '15.00', '35V21737VY228311L', 'F2TMN4DXTNFZS', 'conqtech7-buyer@gmail.com', 'test buyer', 'Completed', 'Pending', NULL, '2017-02-24 18:30:59'),
(10, 28, 7, 2, '20.00', '10.00', '2.00', 5, 0, 28, '2017-02-24T13:02:35Z', '20.00', '7ED04426J9469825V', 'F2TMN4DXTNFZS', 'conqtech7-buyer@gmail.com', 'test buyer', 'Completed', 'Pending', NULL, '2017-02-24 18:32:05');

-- --------------------------------------------------------

--
-- Table structure for table `pre_email_templates`
--

CREATE TABLE `pre_email_templates` (
  `email_template_id` int(11) NOT NULL,
  `template_key` varbinary(256) NOT NULL,
  `template_subject` varchar(512) DEFAULT NULL,
  `template_content` longtext NOT NULL,
  `template_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `template_updated` date DEFAULT NULL,
  `template_status` enum('Active','In-Active') DEFAULT NULL,
  `template_variables` text,
  `from_email` varchar(126) DEFAULT NULL,
  `from_name` varchar(256) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pre_email_templates`
--

INSERT INTO `pre_email_templates` (`email_template_id`, `template_key`, `template_subject`, `template_content`, `template_created`, `template_updated`, `template_status`, `template_variables`, `from_email`, `from_name`) VALUES
(1, 0x526567697374726174696f6e, NULL, '__SITETITLE__\n\n__FIRST_NAME__\n\n__LAST_NAME__\n\n__ACTIVATELINK__\n\nMail footer content here', '2016-09-26 13:40:11', NULL, 'Active', '__SITETITLE__\n\n__FIRST_NAME__\n\n__LAST_NAME__\n\n__LOGO__\n\n__CONTACTUS__\n\n__ACTIVATELINK__\n\n__URL__\n\n__COPYRIGHTS__\n\n__EMAIL__\n\n__PASSWORD__', NULL, NULL),
(3, 0x466f72676f742050617373776f7264, NULL, '<p>\r\n	__SITE_TITLE__</p>\r\n<p>\r\n	&nbsp;</p>\r\n<p>\r\n	__FIRST_NAME__</p>\r\n<p>\r\n	&nbsp;</p>\r\n<p>\r\n	__LAST_NAME__</p>\r\n<p>\r\n	&nbsp;</p>\r\n<p>\r\n	__LINK__</p>\r\n', '2016-08-20 07:49:41', NULL, 'Active', '<p>\r\n	__SITE_TITLE__</p>\r\n<p>\r\n	&nbsp;</p>\r\n<p>\r\n	__FIRST_NAME__</p>\r\n<p>\r\n	&nbsp;</p>\r\n<p>\r\n	__LAST_NAME__</p>\r\n<p>\r\n	&nbsp;</p>\r\n<p>\r\n	__LINK__</p>', NULL, NULL),
(4, 0x41707020537562736372696265204c696e6b, 'Your App Links', '<p>\n	__ANDROID_LINK__</p>\n<p>\n	&nbsp;</p>\n<p>\n	__IOS_LINK__</p>\n', '2016-09-26 13:39:50', NULL, 'Active', '<p>\n	__ANDROID_LINK__</p>\n<p>\n	&nbsp;</p>\n<p>\n	__IOS_LINK__</p>\n', 'adiyya@gmail.com', 'Adiyya Tadikamalla'),
(5, 0x5475746f7220426f6f6b696e67205375636365737320456d61696c, 'Booking Request From Student', '<p>\r\n	Hello ___TUTOR_NAME___,</p>\r\n<p>\r\n	Student &quot;___STUDENT_NAME___&quot; booked you for the course &quot;___COURSE_NAME___&quot;</p>\r\n<p>\r\n	for the time-slot &quot;___DATE_TIME___&quot; and &quot; ___LOCATION___&quot; as preferred location for sessions.</p>\r\n<p>\r\n	Please ___LOGINLINK___ to view the booking details.</p>\r\n<p>\r\n	&nbsp;</p>\r\n<p>\r\n	Footer content goes here</p>\r\n', '2016-09-27 05:35:31', NULL, 'Active', '__TUTOR_NAME__\n\n__STUDENT_NAME__\n\n__COURSE_NAME__\n\n__DATE_TIME__\n\n__LOCATION__\n\n__LOGIN_HERE__', NULL, NULL),
(6, 0x53656e642053747564656e742773204164647265737320456d61696c, 'Student\'s Address For Tutoring', '<p>\r\n	Hello ___TUTOR_NAME___,</p>\r\n<p>\r\n	You approved Student &quot;___STUDENT_NAME___&quot;&#39;s booking for the course &quot;___COURSE_NAME___&quot;</p>\r\n<p>\r\n	for the time-slot &quot;___DATE_TIME___&quot; and &quot; ___LOCATION___&quot; as preferred location for sessions.</p>\r\n<p>\r\n	Below is the address of the Student</p>\r\n<p>\r\n	___STUDENT_ADDRESS___</p>\r\n<p>\r\n	&nbsp;</p>\r\n<p>\r\n	Footer content goes here</p>\r\n', '2016-10-05 12:48:05', NULL, 'Active', '__TUTOR_NAME__\n\n__STUDENT_NAME__\n\n__COURSE_NAME__\n\n__DATE_TIME__\n\n__LOCATION__\n\n__STUDENT_ADDRESS__\n\n__LOGIN_HERE__', NULL, NULL),
(7, 0x53656e642053747564656e74277320536b797065204964, 'Send Student\'s Skype Id', '<p>\r\n	Hello ___TUTOR_NAME___,</p>\r\n<p>\r\n	Student &quot;___STUDENT_NAME___&quot; started the course &quot;___COURSE_NAME___&quot;</p>\r\n<p>\r\n	for the time-slot &quot;___DATE_TIME___&quot; and &quot; ___LOCATION___&quot; as preferred location for sessions.</p>\r\n<p>\r\n	Below is the Skype Id of the Student. Please add the Student&#39;s Skype id and start online tutoring.</p>\r\n<p>\r\n	___STUDENT_ADDRESS___</p>\r\n<p>\r\n	&nbsp;</p>\r\n<p>\r\n	Footer content goes here</p>\r\n', '2016-10-07 11:46:00', NULL, 'Active', NULL, NULL, NULL),
(8, 0x496e7374697475746520456e726f6c6c205375636365737320456d61696c, 'Enrollment Request From Student', '<p>\r\n	Hi,</p>\r\n<p>\r\n	Student &quot;___STUDENT_NAME___&quot; enrolled in the batch &quot;___BATCH_NAME___&quot; for the course &quot;___COURSE_NAME___&quot;</p>\r\n<p>\r\n	Offered by institute &quot;___INSTITUTE_NAME___&quot;.</p>\r\n<p>\r\n	Please ___LOGINLINK___ to view the enrollment details.</p>\r\n<p>\r\n	&nbsp;</p>\r\n<p>\r\n	Footer content goes here</p>\r\n', '2016-10-24 07:26:31', NULL, 'Active', NULL, NULL, NULL),
(9, 0x436c61696d2042792053747564656e7420456d61696c, 'Claim By Student', '<p>\r\n	Hi,</p>\r\n<p>\r\n	Student &quot;___STUDENT_NAME___&quot; claimed for your intervention for the ___BOOKING_ID___.</p>\r\n<p>\r\n	Please ___LOGINLINK___ to view the details.</p>\r\n<p>\r\n	&nbsp;</p>\r\n<p>\r\n	Footer content goes here</p>\r\n', '2016-10-20 10:04:49', NULL, 'Active', NULL, NULL, NULL),
(10, 0x436c61696d204279205475746f7220456d61696c, 'Claim By Tutor', '<p>\r\n	Hi,</p>\r\n<p>\r\n	Student &quot;___STUDENT_NAME___&quot; claimed for your intervention for the booking &quot;___BOOKING_ID___&quot;.</p>\r\n<p>\r\n	Please ___LOGINLINK___ to view the details.</p>\r\n<p>\r\n	&nbsp;</p>\r\n<p>\r\n	Footer content goes here</p>\r\n', '2016-10-14 08:51:25', NULL, 'Active', NULL, NULL, NULL),
(11, 0x53657373696f6e20496e6974696174656420456d61696c, 'Session Initiated By Tutor', '<p>\r\n	Hello ___STUDENT_NAME___,</p>\r\n<p>\r\n	Tutor &quot;___TUTOR_NAME___&quot; has initiated the session for the course &quot;___COURSE_NAME___&quot;</p>\r\n<p>\r\n	for the time-slot &quot;___DATE_TIME___&quot; and &quot; ___LOCATION___&quot; as preferred location for sessions.</p>\r\n<p>\r\n	Please ___LOGINLINK___ to view the details and update status to &quot;Start Course&quot;.</p>\r\n<p>\r\n	&nbsp;</p>\r\n<p>\r\n	Footer content goes here</p>\r\n', '2016-10-14 13:19:24', NULL, 'Active', NULL, NULL, NULL),
(12, 0x417070726f76656d656e7420537461747573204368616e67656420456d61696c, 'Approvement Status Changed', '<p>\r\n	Hello ___USER_NAME___,</p>\r\n<p>\r\n	Admin&nbsp; &quot;___APPROVEMENT_STATUS___&quot; you.</p>\r\n<p>\r\n	___LOGINLINK___ to upload required certificates.</p>\r\n<p>\r\n	&nbsp;</p>\r\n<p>\r\n	Footer content goes here</p>\r\n', '2016-10-15 10:15:32', NULL, 'Active', NULL, NULL, NULL),
(13, 0x426174636820417070726f76656420416c65727420546f205475746f7220456d61696c, 'Batch Approved', '<p>\r\n	Hello ___TUTOR_NAME___,</p>\r\n<p>\r\n	Institute &quot;___INSTITUTE_NAME___&quot; approved the batch &quot;___BATCH_NAME___&quot;.</p>\r\n<p>\r\n	Please login and initiate the session.</p>\r\n<p>\r\n	Initiate Session option will be enable ___MINS___ before the start time of the session.</p>\r\n<p>\r\n	Please ___LOGINLINK___ to view the details.</p>\r\n<p>\r\n	&nbsp;</p>\r\n<p>\r\n	Footer content goes here</p>\r\n', '2016-10-19 08:56:24', NULL, 'Active', NULL, NULL, NULL),
(14, 0x42617463682053657373696f6e20496e6974696174656420416c65727420546f2053747564656e747320456d61696c, 'Batch Session Initiated', '<p>\r\n	Hello ___STUDENT_NAME___,</p>\r\n<p>\r\n	Tutor &quot;___TUTOR_NAME___&quot; has initiated the session for the batch &quot;___BATCH_NAME___&quot;.</p>\r\n<p>\r\n	Please attend and continue the session.</p>\r\n<p>\r\n	Please ___LOGINLINK___ to view the details.</p>\r\n<p>\r\n	&nbsp;</p>\r\n<p>\r\n	Footer content goes here</p>\r\n', '2016-10-19 12:36:39', NULL, 'Active', NULL, NULL, NULL),
(15, 0x436f7572736520436f6d706c6574656420666f722074686520426174636820416c65727420546f2053747564656e747320456d61696c, 'Course Completed for the Batch', '<p>\r\n	Hello ___STUDENT_NAME___,</p>\r\n<p>\r\n	Tutor &quot;___TUTOR_NAME___&quot; has completed the course of the batch &quot;___BATCH_NAME___&quot;.</p>\r\n<p>\r\n	If you are not satisfied with the session, you can claim to the Admin.</p>\r\n<p>\r\n	Please ___LOGINLINK___ to view the details.</p>\r\n<p>\r\n	&nbsp;</p>\r\n<p>\r\n	Footer content goes here</p>\r\n', '2016-10-19 14:08:54', NULL, 'Active', NULL, NULL, NULL),
(16, 0x436f6e6174637420517565727920456d61696c, 'Conatct Query Received', '<p>\r\n	Hello&nbsp; Admin,</p>\r\n<p>\r\n	You got contact query. Below are the details.</p>\r\n<p>\r\n	<strong>First Name: </strong>___FIRST_NAME___</p>\r\n<p>\r\n	<strong>Last Name: </strong>___LAST_NAME___</p>\r\n<p>\r\n	<strong>Email: </strong>___EMAIL___</p>\r\n<p>\r\n	<strong>Subject: </strong>___SUBJECT___</p>\r\n<p>\r\n	<strong>Message: </strong>___MESSAGE___</p>\r\n<p>\r\n	&nbsp;</p>\r\n<p>\r\n	Footer content goes here</p>\r\n', '2016-10-21 13:24:28', NULL, 'Active', NULL, NULL, NULL),
(17, 0x53656e64204d65737361676520456d61696c, 'Message Received From', '<p>\n	Hi ___TO_NAME___,</p>\n<p>\n	You got a message from ___USER_TYPE___. Below are the details.</p>\n<p>\n	<strong>Name: </strong>___NAME___</p>\n<p>\n	<strong>Email: </strong>___EMAIL___</p>\n<p>\n	<strong>Phone: </strong>___PHONE___</p>\n<p>\n	<strong>Course Seeking: </strong>___COURSE___</p>\n<p>\n	<strong>Message: </strong>___MESSAGE___</p>\n<p>\n	&nbsp;</p>\n<p>\n	Footer content goes here</p>\n', '2016-10-24 09:23:34', NULL, 'Active', NULL, NULL, NULL),
(18, 0x53656e642041707020446f776e6c6f6164204c696e6b20456d61696c, 'Tutor App Download Link', '<p>\r\n	Hi,</p>\r\n<p>\r\n	Please click on the below link to download Tutors App.</p>\r\n<p>\r\n	App link goes here.</p>\r\n<p>\r\n	&nbsp;</p>\r\n<p>\r\n	Footer content goes here</p>\r\n', '2016-10-28 05:26:14', NULL, 'Active', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `pre_faqs`
--

CREATE TABLE `pre_faqs` (
  `id` int(11) NOT NULL,
  `question` varchar(500) NOT NULL,
  `answer` varchar(500) NOT NULL,
  `status` enum('Active','Inactive','','') NOT NULL DEFAULT 'Active',
  `created_at` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pre_faqs`
--

INSERT INTO `pre_faqs` (`id`, `question`, `answer`, `status`, `created_at`) VALUES
(1, ' How much do you charge for lessons?', 'Depends upon course and time we will charge for lessions', 'Active', '2016-11-14 10:00:00'),
(2, 'How do I start learning? ', 'To start learning with Tutors, follow these simple steps:  Pick your user name and create a FREE account!  Find a tutor. You can do this by searching for a keyword e.g. "Java" or browsing through categories. Schedule a lesson. Check the schedule of the tutor you have selected and send a "request for lesson" message. In it you will specify the date, time and conditions for the lesson. Check the price offered by the tutor and book the lesson. ', 'Active', '2016-11-22 10:05:00'),
(3, 'How do I pay for a lesson? ', 'You can pay for a lesson at the time of booking or top up your balance earlier and the book a lesson.  You always pay in advance, but a tutor can withdraw money only after a lesson is finished. Of course if your tutor doesn\'t show up for a lesson, you won\'t be charged.', 'Active', '2016-11-22 10:30:10'),
(4, 'How can I contact my students? ', 'You can simply send a private message from the lead details page. tutors will let you know as soon as your Student sends you an answer. All the messages sent between you and your Student will be available in your mail Box.', 'Active', '2016-11-22 18:06:07');

-- --------------------------------------------------------

--
-- Table structure for table `pre_gallery`
--

CREATE TABLE `pre_gallery` (
  `image_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `image_title` varchar(256) DEFAULT NULL,
  `image_name` varchar(256) DEFAULT NULL,
  `image_order` int(11) DEFAULT '0',
  `image_status` enum('Active','In-Active') DEFAULT 'Active',
  `image_created` datetime DEFAULT NULL,
  `image_updated` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pre_gallery`
--

INSERT INTO `pre_gallery` (`image_id`, `user_id`, `image_title`, `image_name`, `image_order`, `image_status`, `image_created`, `image_updated`) VALUES
(3, 3, '', 'a2f73-guarantee.png', 0, 'Active', NULL, NULL),
(4, 13, NULL, 'b04bb-Bebe-Esmie.jpg', 0, 'Active', NULL, NULL),
(6, 7, NULL, '76b45-calculator-1432526_1280.png', 0, 'Active', NULL, NULL),
(7, 7, NULL, '3a32b-chemistry-148044_1280.png', 0, 'Active', NULL, NULL),
(8, 7, NULL, 'ef02f-calculator-983900_1280.jpg', 0, 'Active', NULL, NULL),
(9, 7, NULL, '3896b-adrenaline-872346_1280.png', 0, 'Active', NULL, NULL),
(10, 7, NULL, '22290-satellite-67718_1280.jpg', 0, 'Active', NULL, NULL),
(11, 68, NULL, '030b0-calculator-1432526_1280.png', 0, 'Active', NULL, NULL),
(12, 68, NULL, '36b07-calculator-983900_1280.jpg', 0, 'Active', NULL, NULL),
(13, 68, NULL, '95bf7-chemistry-148044_1280.png', 0, 'Active', NULL, NULL),
(14, 68, NULL, '028e5-satellite-67718_1280.jpg', 0, 'Active', NULL, NULL),
(15, 68, NULL, '6bb3c-adrenaline-872346_1280.png', 0, 'Active', NULL, NULL),
(16, 9, NULL, 'ddf8e-calculator-983900_1280.jpg', 0, 'Active', NULL, NULL),
(17, 9, NULL, '2142d-adrenaline-872346_1280.png', 0, 'Active', NULL, NULL),
(18, 9, NULL, '74e28-satellite-67718_1280.jpg', 0, 'Active', NULL, NULL),
(19, 9, NULL, 'a343f-chemistry-148044_1280.png', 0, 'Active', NULL, NULL),
(20, 35, NULL, '10236-calculator-983900_1280.jpg', 0, 'Active', NULL, NULL),
(21, 35, NULL, '8978a-adrenaline-872346_1280.png', 0, 'Active', NULL, NULL),
(22, 35, NULL, 'b94de-chemistry-148044_1280.png', 0, 'Active', NULL, NULL),
(23, 35, NULL, '31340-satellite-67718_1280.jpg', 0, 'Active', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `pre_groups`
--

CREATE TABLE `pre_groups` (
  `id` mediumint(8) NOT NULL,
  `name` varchar(20) NOT NULL,
  `description` varchar(100) NOT NULL,
  `group_status` enum('Active','In-Active') DEFAULT 'Active',
  `created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `modules` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pre_groups`
--

INSERT INTO `pre_groups` (`id`, `name`, `description`, `group_status`, `created`, `modules`) VALUES
(1, 'admin', 'Administrator', 'Active', '2015-11-08 21:40:49', '2,3,1,4,5,6,7,8,9'),
(2, 'student', 'Registered Students', 'Active', '2015-11-08 21:40:49', '4,6'),
(3, 'tutor', 'Registered Tutors', 'Active', '2016-08-01 09:38:26', NULL),
(4, 'institute', 'Registered Institutes', 'Active', '2016-08-01 09:38:41', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `pre_inst_batches`
--

CREATE TABLE `pre_inst_batches` (
  `batch_id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  `inst_id` int(11) NOT NULL,
  `tutor_id` int(11) NOT NULL COMMENT 'tutor assigned for this batch',
  `batch_code` varchar(55) NOT NULL,
  `batch_name` varchar(512) NOT NULL,
  `time_slot` varchar(15) NOT NULL,
  `course_offering_location` varchar(512) NOT NULL DEFAULT 'Online',
  `duration_value` tinyint(5) NOT NULL,
  `duration_type` enum('hours','days','months','years') NOT NULL DEFAULT 'days',
  `batch_start_date` date NOT NULL,
  `batch_end_date` date NOT NULL,
  `batch_max_strength` tinyint(5) NOT NULL,
  `fee` float NOT NULL,
  `per_credit_value` float NOT NULL,
  `course_content` text NOT NULL,
  `days_off` varchar(155) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `sort_order` tinyint(5) NOT NULL DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pre_inst_batches`
--

INSERT INTO `pre_inst_batches` (`batch_id`, `course_id`, `inst_id`, `tutor_id`, `batch_code`, `batch_name`, `time_slot`, `course_offering_location`, `duration_value`, `duration_type`, `batch_start_date`, `batch_end_date`, `batch_max_strength`, `fee`, `per_credit_value`, `course_content`, `days_off`, `status`, `sort_order`, `created_at`, `updated_at`) VALUES
(1, 55, 12, 17, 'MSMB', 'MS OFFICE', '9-11', 'Westminster', 1, 'months', '2016-11-10', '2016-12-09', 50, 300, 2, '<p>\r\n	<b style="font-family: arial, sans-serif; font-size: 16px;">Microsoft Office</b><span style="font-family: arial, sans-serif; font-size: 16px;">. Suite of products developed by&nbsp;</span><b style="font-family: arial, sans-serif; font-size: 16px;">Microsoft</b><span style="font-family: arial, sans-serif; font-size: 16px;">&nbsp;Corporation that includes&nbsp;</span><b style="font-family: arial, sans-serif; font-size: 16px;">Microsoft</b><span style="font-family: arial, sans-serif; font-size: 16px;">&nbsp;Word, Excel, Access, Publisher, PowerPoint, and Outlook. Each program serves a different purpose and is compatible with other programs included in the package.</span></p>\r\n', 'SUN,SAT', 1, 0, '2016-11-08 17:52:20', '2016-11-08 17:52:20'),
(2, 18, 12, 17, 'DR', 'DREMWEAVER', '17-19', 'San Francisco', 2, 'months', '2016-11-16', '2017-01-15', 40, 400, 2, '<p>\r\n	<span style="font-family: arial, sans-serif; font-size: 16px;">Adobe&nbsp;</span><b style="font-family: arial, sans-serif; font-size: 16px;">Dreamweaver</b><span style="font-family: arial, sans-serif; font-size: 16px;">&nbsp;is an application used by web designers and developers to create websites and applications for use across multiple targets. Including browsers, devices, and tablets. Web designers use&nbsp;</span><b style="font-family: arial, sans-serif; font-size: 16px;">Dreamweaver</b><span style="font-family: arial, sans-serif; font-size: 16px;">&nbsp;for creating website prototypes using web-friendly artwork.</span></p>\r\n', 'SUN', 1, 0, '2016-11-09 11:12:49', '2016-11-09 11:16:34'),
(3, 21, 12, 18, 'JS', 'Javascript', '10-12', 'Pueblo', 2, 'months', '2016-11-09', '2017-01-08', 50, 400, 2, '<p>\r\n	<b style="font-family: arial, sans-serif; font-size: 16px;">JavaScript</b><span style="font-family: arial, sans-serif; font-size: 16px;">&nbsp;(&quot;JS&quot; for short) is a full-fledged dynamic programming language that, when applied to an HTML document, can provide dynamic interactivity on websites. It was invented by Brendan Eich, co-founder of the Mozilla project, the Mozilla Foundation, and the Mozilla Corporation.</span></p>\r\n', 'SUN', 1, 0, '2016-11-09 11:16:54', '2016-11-09 11:16:54'),
(4, 27, 13, 20, 'QA', 'QA', '8-10', 'Tallahassee', 2, 'days', '2018-11-06', '2018-11-07', 10, 430, 2, '<p>\r\n	<span class="_Tgc"><b>Software testing</b> is a process of executing a program or application with the intent of finding the <b>software</b> bugs. It can also be stated as the process of validating and verifying that a <b>software</b> program or application or product: Meets the business and technical requirements that guided it&#39;s design and development.</span></p>\r\n', 'SUN', 1, 0, '2016-11-09 11:42:39', '2016-11-14 11:54:19'),
(5, 144, 13, 20, 'bank', 'Bank', '11-13', 'Pueblo', 1, 'days', '2017-11-15', '2017-11-15', 25, 280, 2, '<p>\r\n	<span class="_Tgc">The IBPS clerk exam is universally adapted by nationalized <b>banks</b> across India to induct fresh graduates into various clerical posts. ... IBPS also conducts exams for recruitment to the post of probationary officer (<b>PO</b>) and specialist officer (SO).</span></p>\r\n', 'SUN', 1, 0, '2016-11-09 12:02:37', '2016-11-14 11:57:12'),
(6, 16, 14, 21, 'DNET', 'DotNet', '12-14', 'Lakewood', 2, 'months', '2016-11-10', '2017-01-09', 15, 300, 2, '<p>\r\n	<b style="font-family: arial, sans-serif; font-size: 16px;">C#</b><span style="font-family: arial, sans-serif; font-size: 16px;">&nbsp;</span><sup style="font-family: arial, sans-serif;">[</sup><sup style="font-family: arial, sans-serif;">note</sup><span style="font-family: arial, sans-serif; font-size: 16px;">&nbsp;</span><sup style="font-family: arial, sans-serif;">2</sup><sup style="font-family: arial, sans-serif;">]</sup><span style="font-family: arial, sans-serif; font-size: 16px;">&nbsp;(pronounced as see sharp) is a multi-paradigm programming language encompassing strong typing, imperative, declarative, functional, generic, object-oriented (class-based), and component-oriented programming disciplines.</span></p>\r\n', 'SUN', 1, 0, '2016-11-09 12:19:27', '2016-11-09 12:19:27'),
(7, 24, 14, 22, 'MS', 'Msoffice', '09-11', 'Lakewood', 1, 'months', '2016-11-09', '2016-12-08', 10, 200, 2, '<p>\r\n	<b style="font-family: arial, sans-serif; font-size: 16px;">Microsoft Office</b><span style="font-family: arial, sans-serif; font-size: 16px;">&nbsp;is a set of interrelated desktop applications, servers and services, collectively referred to as an&nbsp;</span><b style="font-family: arial, sans-serif; font-size: 16px;">office</b><span style="font-family: arial, sans-serif; font-size: 16px;">&nbsp;suite, for the&nbsp;</span><b style="font-family: arial, sans-serif; font-size: 16px;">Microsoft</b><span style="font-family: arial, sans-serif; font-size: 16px;">&nbsp;Windows and Mac OS X operating systems. This list contains all the programs that are, or have been, in&nbsp;</span><b style="font-family: arial, sans-serif; font-size: 16px;">Microsoft Office</b><span style="font-family: arial, sans-serif; font-size: 16px;">&nbsp;since it began and are in alphabetical order.</span></p>\r\n', 'SUN', 1, 0, '2016-11-09 12:22:04', '2016-11-09 12:22:04'),
(8, 23, 15, 24, 'MA', 'Microsoft Access', '14-16', 'Long Beach', 5, 'months', '2016-11-10', '2017-04-09', 10, 450, 2, '<p>\r\n	<b style="font-family: arial, sans-serif; font-size: 16px;">Microsoft Access</b><span style="font-family: arial, sans-serif; font-size: 16px;">, also known as&nbsp;</span><b style="font-family: arial, sans-serif; font-size: 16px;">Microsoft</b><span style="font-family: arial, sans-serif; font-size: 16px;">&nbsp;Office&nbsp;</span><b style="font-family: arial, sans-serif; font-size: 16px;">Access</b><span style="font-family: arial, sans-serif; font-size: 16px;">, is a database management system from&nbsp;</span><b style="font-family: arial, sans-serif; font-size: 16px;">Microsoft</b><span style="font-family: arial, sans-serif; font-size: 16px;">&nbsp;that combines the relational&nbsp;</span><b style="font-family: arial, sans-serif; font-size: 16px;">Microsoft</b><span style="font-family: arial, sans-serif; font-size: 16px;">&nbsp;Jet Database Engine with a graphical user interface and software-development tools.</span></p>\r\n', 'SUN', 1, 0, '2016-11-09 12:41:37', '2016-11-09 12:41:37'),
(9, 26, 16, 25, 'php', 'PHP Batch', '9-11', 'Denver', 2, 'months', '2016-11-10', '2017-01-09', 15, 350, 2, '<p>\r\n	<b style="font-family: arial, sans-serif; font-size: 16px;">PHP</b><span style="font-family: arial, sans-serif; font-size: 16px;">&nbsp;is a server-side scripting language designed primarily for web development but also used as a general-purpose programming language. Originally created by Rasmus Lerdorf in 1994, the&nbsp;</span><b style="font-family: arial, sans-serif; font-size: 16px;">PHP</b><span style="font-family: arial, sans-serif; font-size: 16px;">&nbsp;reference implementation is now produced by The&nbsp;</span><b style="font-family: arial, sans-serif; font-size: 16px;">PHP</b><span style="font-family: arial, sans-serif; font-size: 16px;">&nbsp;Development Team.</span></p>\r\n', 'SUN', 1, 0, '2016-11-09 12:49:45', '2016-11-22 17:43:26'),
(10, 37, 42, 52, 'TM', 'Trigo Batch', '9-11', 'San Diego', 60, 'days', '2017-02-14', '2017-04-14', 30, 380, 2, '<p>\r\n	<span class="st">Learn the basics of trigonometry: What are sine, cosine, and tangent? ... Start solving simple problems that involve<br />\r\n	this new definition of the trigonometric functions. ... Learn how to solve trigonometric equations and how to use<br />\r\n	trigonometric identities to solve various problems.</span></p>\r\n', 'SUN', 1, 0, '2016-11-10 11:03:44', '2016-11-10 11:03:44'),
(11, 34, 42, 52, 'PB', 'Pro Batch', '16-17', 'online', 3, 'months', '2017-01-18', '2017-04-17', 10, 400, 2, '<p>\r\n	The probability of an event is the measure of the chance that the event will occur as a result of an experiment.<br />\r\n	The probability of an event A is the number of ways event A can occur divided by the total number of possible outcomes.</p>\r\n', 'SAT', 1, 0, '2016-11-10 11:07:15', '2016-11-10 11:07:15'),
(12, 72, 43, 67, 'TL', '1St Batch', '17-18', 'Denver', 6, 'months', '2016-12-28', '2017-06-27', 20, 600, 2, '<p>\r\n	<span class="st" data-hveid="66" data-ved="0ahUKEwjbz4_HwZ3QAhWFro8KHXoAAcwQ4EUIQjAJ">The Internal Revenue Code is the primary statutory basis of federal <em>tax law</em> in the United States. The Code of Federal Regulations is the Treasury Department&#39;s regulatory interpretation of the federal <em>tax laws</em> passed by Congress, which carry the weight of <em>law</em> if the interpretation is reasonable.</span></p>\r\n', 'WED', 1, 0, '2016-11-10 11:30:10', '2016-11-10 11:30:10'),
(13, 63, 43, 67, 'AL', 'Law Batch', '7-9', 'Aurora', 1, 'months', '2017-07-06', '2017-08-05', 30, 250, 2, '<p>\r\n	<span class="st" data-hveid="39" data-ved="0ahUKEwjgutDLwp3QAhWJKo8KHaIOCQAQ4EUIJzAC"><em>Administrative law</em> is the body of <em>law</em> that governs the activities of <em>administrative</em> agencies of government. Government agency action can include rulemaking, adjudication, or the enforcement of a specific regulatory agenda. <em>Administrative law</em> is considered a branch of public <em>law</em>.</span></p>\r\n', 'TUE', 1, 0, '2016-11-10 11:35:07', '2016-11-10 11:35:07'),
(14, 115, 44, 78, 'DB', 'Drums Batch', '10-12', 'Columbia', 2, 'months', '2016-11-29', '2017-01-28', 10, 350, 2, '<p>\r\n	<span class="st">The <em>drum</em> is a member of the percussion group of musical instruments. In the Hornbostel-Sachs classification system, it is a membranophone. <span class="st">A <em>drum</em> set (primarily American), <em>drum</em> kit (primarily British/Australian), trap set, or just <em>drums</em> is a collection of <em>drums</em> and other percussion instruments</span></span></p>\r\n', 'SUN', 1, 0, '2016-11-10 12:13:32', '2016-11-10 12:13:32'),
(15, 116, 44, 78, 'FL', 'Flute Batch', '18-20', 'online', 1, 'months', '2017-02-08', '2017-03-07', 5, 100, 2, '<p>\r\n	<span class="st">The <em>flute</em> is a family of musical instruments in the woodwind group. Unlike woodwind instruments with reeds, a <em>flute</em> is an aerophone or reedless wind instrument. <span class="st">The Western concert <em>flute</em> is a transverse (side-blown) woodwind instrument made of metal or wood.</span></span></p>\r\n', 'SUN', 1, 0, '2016-11-10 12:15:56', '2016-11-10 12:15:56'),
(16, 105, 45, 79, 'BLY', '1St Batch', '6-8', 'Houston', 3, 'months', '2016-11-23', '2017-02-22', 50, 2000, 2, '<p>\r\n	<span class="st"><em>Belly Dance</em> Show provide Beautiful <em>Belly Dancers</em> for Events &amp; Shows like Wedding, Corporate, Parties etc. <span class="st"><em>Belly dance</em> is an expressive dance which emphasizes complex movements of the torso. Originally a Middle Eastern folk dance</span></span></p>\r\n', 'SUN', 1, 0, '2016-11-10 12:38:39', '2016-11-10 12:38:39'),
(17, 108, 45, 79, 'BD', '2nd Batch', '15-18', 'Dallas', 1, 'months', '2017-04-13', '2017-05-12', 10, 300, 2, '<p>\r\n	<span class="st">B-boying or <em>breaking</em>, also called breakdancing, is a style of street <em>dance</em> that originated primarily among Puerto Rican and African American youth.</span></p>\r\n', 'SUN', 1, 0, '2016-11-10 12:41:10', '2016-11-10 12:41:10'),
(18, 39, 46, 80, 'CHE', 'Chemisty Batch1', '9-11', 'Phoenix', 1, 'months', '2016-11-24', '2016-12-23', 50, 150, 2, '<p>\r\n	<span class="st" data-hveid="58" data-ved="0ahUKEwiwhKmd2J3QAhWMKo8KHWa7ASkQ4EUIOjAD"><em>Chemistry</em> is the study of matter, and all matter is made up of atoms. We will learn about elements, atomic number and mass, isotopes, moles (<em>chemistry</em> moles, not the animal), and compounds. Introduction to the atom. Compounds and ions.</span></p>\r\n', 'SUN', 1, 0, '2016-11-10 13:11:40', '2016-11-10 13:11:40'),
(19, 38, 46, 80, 'PHY', 'Physics Batch', '17-19', 'Tucson', 2, 'months', '2017-02-27', '2017-04-26', 30, 500, 2, '<p>\r\n	<span class="st" data-hveid="87" data-ved="0ahUKEwjM9p3D2J3QAhVFtI8KHRmwAOwQ4EUIVzAI"><em>Physics</em> is the study of the basic principles that govern the physical world around us. We&#39;ll start by looking at motion itself. Then, we&#39;ll learn about forces, momentum, energy, and other concepts in lots of different physical situations.</span></p>\r\n', 'SAT', 1, 0, '2016-11-10 13:13:34', '2016-11-10 13:13:34'),
(20, 86, 47, 81, 'AIEE', 'AIEEE Batch', '9-11', 'Des Moines', 2, 'months', '2016-12-28', '2017-02-27', 50, 4000, 2, '<p>\r\n	<span class="st"><em>AIEEE means</em> All India Engineering Entrance Examination and IIT <em>means</em> Indian Institue of Technology.<wbr /> IIT is a group of institutions and <em>AIEEE</em> is an examination system conducted for various engineering</span></p>\r\n', 'SUN', 1, 0, '2016-11-10 14:33:37', '2016-11-10 14:33:37'),
(21, 28, 48, 82, 'SQL', 'SQL batch', '18-19', 'Denver', 15, 'days', '2016-11-24', '2016-12-08', 30, 30, 2, '<p>\r\n	<span class="st"><em>MySQL</em> is a database system used on the web; <em>MySQL</em> is a database system that runs on a server; <em>MySQL</em> is ideal for both small and large applications</span></p>\r\n', 'SUN', 1, 0, '2016-11-10 14:49:14', '2016-11-10 14:49:14'),
(22, 29, 48, 82, 'OR', 'Oracle Batch', '8-10', 'Aurora', 2, 'months', '2017-01-10', '2017-03-09', 40, 450, 2, '<p>\r\n	<span class="st"><em>Oracle</em> Database is an object-relational database management system produced and marketed by <em>Oracle</em> Corporation.<span class="st"><em>Oracle</em> Corporation is an American multinational computer technology corporation, headquartered in Redwood Shores, California.</span></span></p>\r\n', 'SUN', 1, 0, '2016-11-10 14:50:58', '2016-11-10 14:50:58'),
(23, 40, 49, 83, 'BIO', 'EL 1st Batch', '8-10', 'Davenport', 2, 'months', '2016-11-30', '2017-01-29', 30, 150, 2, '<p>\r\n	<span class="st" data-hveid="46" data-ved="0ahUKEwjW2fzJ-Z3QAhUKt48KHXLmBpoQ4EUILjAB"><em>Biology</em> is a natural science concerned with the study of life and living organisms, including their structure, function, growth, evolution, distribution, identification and taxonomy. Modern <em>biology</em> is a vast and eclectic field, composed of many branches and subdisciplines</span></p>\r\n', 'SUN,SAT', 1, 0, '2016-11-10 15:40:34', '2016-11-10 15:40:34'),
(24, 38, 49, 83, 'PHY', 'El 2nd Batch', '19-20', 'online', 1, 'months', '2017-02-08', '2017-03-07', 5, 50, 2, '<p>\r\n	<span>The branch of science concerned with the nature and properties of matter and energy. The subject matter of physics includes mechanics, heat, light and other radiation, sound, electricity, magnetism, and the structure of atoms</span></p>\r\n', 'SUN', 1, 0, '2016-11-10 15:42:22', '2016-11-10 15:42:22'),
(25, 20, 50, 84, 'HTML', 'HTML Batch', '10-12', 'online', 30, 'days', '2016-11-26', '2016-12-25', 10, 55, 2, '<p>\r\n	<span class="st" data-hveid="49" data-ved="0ahUKEwjU_9vT_J3QAhUfSo8KHWCGDScQ4EUIMTAE"><em>HTML</em> stands for Hyper Text Markup Language, which is the most widely used language on Web to develop web pages.<span class="st">Every webpage you look at is written in a language called <em>HTML</em>. You can think of <em>HTML</em> as the skeleton that gives every webpage structure.</span></span></p>\r\n', 'SUN', 1, 0, '2016-11-10 15:54:48', '2016-11-10 15:54:48'),
(26, 14, 50, 84, 'JAVA', 'Java Batch', '15-17', 'Detroit', 60, 'days', '2017-01-26', '2017-03-26', 40, 150, 2, '<p>\r\n	<span class="st"><em>Java</em> is a set of computer software and specifications developed by Sun Microsystems, which was later acquired by the Oracle Corporation, <span class="st">Learn how <em>Java</em> powers the innovation behind our digital world. Harness this potential with <em>Java</em> resources for student coders, hobbyists, developers</span></span></p>\r\n', 'THU', 1, 0, '2016-11-10 15:56:44', '2016-11-10 15:56:44'),
(27, 26, 51, 85, 'PHP', '1st Batch', '9-10', 'online', 1, 'months', '2016-11-30', '2016-12-29', 10, 80, 2, '<p>\r\n	<span class="st" data-hveid="51" data-ved="0ahUKEwjd2ZX3hJ7QAhUXTY8KHY71D50Q4EUIMzAE">The <em>PHP</em> Hypertext Preprocessor (<em>PHP</em>) is a programming language that allows web developers to create dynamic content that interacts with databases. <em>PHP</em> is basically used for developing web based software applications.</span></p>\r\n', 'SUN', 1, 0, '2016-11-10 16:31:46', '2016-11-10 16:31:46'),
(28, 24, 51, 85, 'MSEL', 'Excel Batch1', '19-20', 'Augusta', 2, 'months', '2017-01-18', '2017-03-17', 30, 140, 2, '<p>\r\n	<span class="st"><em>Microsoft Excel</em> is a spreadsheet developed by Microsoft for Windows, macOS, Android and iOS. It features calculation, graphing tools, pivot tables,</span></p>\r\n', 'SUN', 1, 0, '2016-11-10 16:33:13', '2016-11-10 16:33:13'),
(29, 13, 86, 101, 'C++', 'C++', '18-20', 'Long Beach', 2, 'months', '2016-11-11', '2017-01-10', 30, 300, 2, '<p>\r\n	<span class="_Tgc"><b>C++</b> is an object oriented programming (OOP) language, developed by Bjarne Stroustrup, and is an extension of C language. It is therefore possible to code <b>C++</b> in a &quot;C style&quot; or &quot;object-oriented style.&quot; In certain scenarios, it can be coded in either way and is thus an effective example of a hybrid language</span></p>\r\n', 'SUN', 1, 0, '2016-11-10 18:33:50', '2016-11-10 18:33:50'),
(30, 55, 87, 102, 'MS OFFICE', 'MS OFFICE', '7-9', 'Aurora', 3, 'months', '2016-11-18', '2017-02-17', 50, 350, 2, '<p>\r\n	<b style="font-family: arial, sans-serif; font-size: 16px;">Microsoft Office</b><span style="font-family: arial, sans-serif; font-size: 16px;">&nbsp;is a set of interrelated desktop applications, servers and services, collectively referred to as an&nbsp;</span><b style="font-family: arial, sans-serif; font-size: 16px;">office</b><span style="font-family: arial, sans-serif; font-size: 16px;">&nbsp;suite, for the&nbsp;</span><b style="font-family: arial, sans-serif; font-size: 16px;">Microsoft</b><span style="font-family: arial, sans-serif; font-size: 16px;">&nbsp;Windows and Mac OS X operating systems. This list contains all the programs that are, or have been, in&nbsp;</span><b style="font-family: arial, sans-serif; font-size: 16px;">Microsoft Office</b><span style="font-family: arial, sans-serif; font-size: 16px;">&nbsp;since it began and are in alphabetical order.</span></p>\r\n', 'SUN', 1, 0, '2016-11-11 09:55:44', '2016-11-11 09:55:44'),
(31, 16, 88, 103, 'C#', 'C#', '9-11', 'Fort Collins', 2, 'months', '2016-11-18', '2017-01-17', 10, 400, 2, '<p>\r\n	<span style="font-family: arial, sans-serif; font-size: 16px;">.</span><b style="font-family: arial, sans-serif; font-size: 16px;">NET</b><span style="font-family: arial, sans-serif; font-size: 16px;">&nbsp;Framework (pronounced dot&nbsp;</span><b style="font-family: arial, sans-serif; font-size: 16px;">net</b><span style="font-family: arial, sans-serif; font-size: 16px;">) is a software framework developed by Microsoft that runs primarily on Microsoft Windows. ... (As such, computer code written using .</span><b style="font-family: arial, sans-serif; font-size: 16px;">NET</b><span style="font-family: arial, sans-serif; font-size: 16px;">&nbsp;Framework is called &quot;managed code&quot;.)</span></p>\r\n', 'SUN', 1, 0, '2016-11-11 10:07:02', '2016-11-11 10:07:02'),
(32, 16, 13, 20, '.Net', '.Net', '11-13', 'San Francisco', 2, 'months', '2016-11-12', '2017-01-11', 20, 250, 2, '<p>\r\n	<span style="font-family: arial, sans-serif; font-size: 16px;">.</span><b style="font-family: arial, sans-serif; font-size: 16px;">NET</b><span style="font-family: arial, sans-serif; font-size: 16px;">&nbsp;Framework (pronounced dot&nbsp;</span><b style="font-family: arial, sans-serif; font-size: 16px;">net</b><span style="font-family: arial, sans-serif; font-size: 16px;">) is a software framework developed by Microsoft that runs primarily on Microsoft Windows. ... (As such, computer code written using .</span><b style="font-family: arial, sans-serif; font-size: 16px;">NET</b><span style="font-family: arial, sans-serif; font-size: 16px;">&nbsp;Framework is called &quot;managed code&quot;.)</span></p>\r\n', 'SUN', 1, 0, '2016-11-11 10:44:54', '2016-11-11 10:44:54'),
(33, 55, 13, 20, 'MS OFFICE', 'MS OFFICE', '8-10', 'Fresno', 3, 'months', '2016-11-17', '2017-02-16', 20, 400, 2, '<p>\r\n	<b style="font-family: arial, sans-serif; font-size: 16px;">Microsoft Office</b><span style="font-family: arial, sans-serif; font-size: 16px;">. Suite of products developed by&nbsp;</span><b style="font-family: arial, sans-serif; font-size: 16px;">Microsoft</b><span style="font-family: arial, sans-serif; font-size: 16px;">&nbsp;Corporation that includes&nbsp;</span><b style="font-family: arial, sans-serif; font-size: 16px;">Microsoft</b><span style="font-family: arial, sans-serif; font-size: 16px;">&nbsp;Word, Excel, Access, Publisher, PowerPoint, and Outlook. Each program serves a different purpose and is compatible with other programs included in the package.</span></p>\r\n', 'SUN', 1, 0, '2016-11-11 10:46:29', '2016-11-11 10:46:29'),
(34, 66, 13, 20, 'CPL', 'Company Law', '13-19', 'Sacramento', 5, 'months', '2016-11-23', '2017-04-22', 50, 1000, 2, '<p>\r\n	<b style="font-family: arial, sans-serif; font-size: 16px;">Company law</b><span style="font-family: arial, sans-serif; font-size: 16px;">&nbsp;(or the&nbsp;</span><b style="font-family: arial, sans-serif; font-size: 16px;">law</b><span style="font-family: arial, sans-serif; font-size: 16px;">&nbsp;of&nbsp;</span><b style="font-family: arial, sans-serif; font-size: 16px;">business</b><span style="font-family: arial, sans-serif; font-size: 16px;">&nbsp;associations) is the field of&nbsp;</span><b style="font-family: arial, sans-serif; font-size: 16px;">law</b><span style="font-family: arial, sans-serif; font-size: 16px;">&nbsp;concerning&nbsp;</span><b style="font-family: arial, sans-serif; font-size: 16px;">companies</b><span style="font-family: arial, sans-serif; font-size: 16px;">&nbsp;and other&nbsp;</span><b style="font-family: arial, sans-serif; font-size: 16px;">business</b><span style="font-family: arial, sans-serif; font-size: 16px;">&nbsp;organizations. This includes corporations, partnerships and other associations which usually carry on some form of economic or charitable activity. ... Corporation.</span></p>\r\n', 'SUN', 1, 0, '2016-11-11 10:47:36', '2016-11-11 10:47:36'),
(35, 40, 13, 20, 'BGY', 'Biology', '12-13', 'El Paso', 4, 'months', '2017-06-23', '2017-10-22', 40, 500, 2, '<p>\r\n	<span style="font-family: arial, sans-serif; font-size: 16px;">The science of life and of living organisms, including their structure, function, growth, origin, evolution, and distribution. It includes botany and zoology and all their subdivisions. 2. The life processes or characteristic phenomena of a group or category of living organisms: the&nbsp;</span><b style="font-family: arial, sans-serif; font-size: 16px;">biology</b><span style="font-family: arial, sans-serif; font-size: 16px;">&nbsp;of fungi.</span></p>\r\n', 'SUN', 1, 0, '2016-11-11 10:48:47', '2016-11-11 10:52:22'),
(36, 42, 13, 20, 'CE', 'Competitive Exam', '7-8', 'Columbus', 1, 'hours', '2016-11-14', '2016-11-13', 25, 600, 2, '<p>\r\n	<span style="font-family: arial, sans-serif; font-size: 16px;">The required portion of the&nbsp;</span><b style="font-family: arial, sans-serif; font-size: 16px;">ACT</b><span style="font-family: arial, sans-serif; font-size: 16px;">&nbsp;is divided into four multiple choice subject&nbsp;</span><b style="font-family: arial, sans-serif; font-size: 16px;">tests</b><span style="font-family: arial, sans-serif; font-size: 16px;">: English, mathematics, reading, and science reasoning. Subject&nbsp;</span><b style="font-family: arial, sans-serif; font-size: 16px;">test</b><span style="font-family: arial, sans-serif; font-size: 16px;">&nbsp;scores range from 1 to 36; all scores are integers. The English, mathematics, and reading&nbsp;</span><b style="font-family: arial, sans-serif; font-size: 16px;">tests</b><span style="font-family: arial, sans-serif; font-size: 16px;">&nbsp;also have subscores ranging from 1 to 18.</span></p>\r\n', 'MON', 1, 0, '2016-11-11 10:50:29', '2016-11-14 13:09:03'),
(37, 20, 12, 17, 'HTML1', 'HTML Batch1', '16-18', 'San Diego', 30, 'days', '2017-01-18', '2017-02-16', 30, 120, 2, '<p>\r\n	<span class="_Tgc"><b>HTML</b> is the standard markup language for creating Web pages. <b>HTML</b> stands for Hyper Text Markup Language. <b>HTML</b> describes the structure of Web pages using markup. <b>HTML</b> elements are the building blocks of <b>HTML</b> pages. <b>HTML</b> elements are represented by tags</span></p>\r\n', 'SUN', 1, 0, '2016-11-21 12:53:13', '2016-11-21 12:53:13'),
(38, 13, 14, 21, 'CB', 'C Btach', '18-20', 'San Jose', 2, 'months', '2016-12-30', '2017-03-01', 20, 200, 2, '<p>\r\n	<span class="st">This course teaches you the powerful, fast and popular <em>C++</em> programming language from scratch, assuming only basic computer knowledge</span></p>\r\n', 'SUN', 1, 0, '2016-11-21 14:21:17', '2016-11-21 14:25:00'),
(39, 13, 14, 22, 'CB4', 'C Btach4', '14-16', 'Fresno', 3, 'months', '2016-12-29', '2017-03-28', 20, 240, 2, '<p>\r\n	<span class="st">This course teaches you the powerful, fast and popular <em>C++</em> programming language from scratch, assuming only basic computer knowledge</span></p>\r\n', 'SUN', 1, 0, '2016-11-21 14:44:24', '2016-11-21 14:44:24'),
(40, 13, 14, 22, 'CB3', 'C Btach3', '8-10', 'San Francisco', 1, 'months', '2017-01-18', '2017-02-17', 30, 250, 2, '<p>\r\n	<span class="st">This course teaches you the powerful, fast and popular <em>C++</em> programming language from scratch, assuming only basic computer knowledge</span></p>\r\n', 'SUN', 1, 0, '2016-11-21 14:42:30', '2016-11-21 14:42:30'),
(41, 13, 14, 21, 'CB2', 'C Btach2', '10-12', 'San Diego', 45, 'days', '2017-01-27', '2017-03-12', 10, 200, 2, '<p>\r\n	<span class="st">This course teaches you the powerful, fast and popular <em>C++</em> programming language from scratch, assuming only basic computer knowledge</span></p>\r\n', 'MON', 1, 0, '2016-11-21 14:42:29', '2016-11-21 14:42:29'),
(42, 13, 14, 22, 'CB1', 'C Btach1', '15-17', 'Los Angeles', 2, 'months', '2017-02-22', '2017-04-21', 15, 150, 2, '<p>\r\n	<span class="st">This course teaches you the powerful, fast and popular <em>C++</em> programming language from scratch, assuming only basic computer knowledge</span></p>\r\n', 'SUN', 1, 0, '2016-11-21 14:39:31', '2016-11-21 14:39:31'),
(43, 13, 14, 21, 'CB4', 'CB Batch4', '7-9', 'online', 2, 'months', '2017-01-19', '2017-03-18', 20, 220, 2, '<p>\r\n	<span class="st">This course teaches you the powerful, fast and popular <em>C++</em> programming language from scratch, assuming only basic computer knowledge</span></p>\r\n', 'SUN', 1, 0, '2016-11-21 14:49:04', '2016-11-21 14:49:04'),
(44, 13, 15, 23, 'C', 'C Batch', '15-17', 'Los Angeles', 2, 'months', '2016-12-22', '2017-02-21', 10, 150, 2, '<p>\r\n	<span class="st">This course teaches you the powerful, fast and popular <em>C++</em> programming language from scratch, assuming only basic computer knowledge</span></p>\r\n', 'SUN', 1, 0, '2016-11-21 15:04:17', '2016-11-21 15:04:17'),
(45, 21, 14, 22, 'JB', 'JavaScript Batch', '10-12', 'Los Angeles', 30, 'days', '2016-12-31', '2017-01-29', 30, 100, 2, '<p>\r\n	<span class="st" data-hveid="81" data-ved="0ahUKEwiVrcaAr7nQAhWJsI8KHZVdDrMQ4EUIUTAM"><em>JavaScript</em> is the programming language of HTML and the Web. <em>JavaScript</em> is easy to learn. This tutorial will teach you <em>JavaScript</em> from basic to advanced.</span></p>\r\n', 'FRI', 1, 0, '2016-11-21 15:11:55', '2016-11-21 15:11:55'),
(46, 14, 16, 25, 'JAVB', 'Java Batch', '8-10', 'Los Angeles', 3, 'months', '2017-01-19', '2017-04-18', 15, 300, 2, '<p>\r\n	<span class="st"><em>Java</em> is a set of computer software and specifications developed by Sun Microsystems, which was later acquired by the Oracle Corporation</span></p>\r\n', 'SUN', 1, 0, '2016-11-21 15:24:20', '2016-11-21 15:24:20'),
(47, 13, 12, 18, 'CBT', 'C++ Batch', '15-17', 'San Jose', 2, 'months', '2017-01-26', '2017-03-25', 10, 150, 2, '<p>\r\n	<b style="font-family: arial, sans-serif; font-size: 16px;">C++</b><span style="font-family: arial, sans-serif; font-size: 16px;">&nbsp;is a middle-level programming language developed by Bjarne Stroustrup starting in 1979 at Bell Labs.&nbsp;</span><b style="font-family: arial, sans-serif; font-size: 16px;">C++</b><span style="font-family: arial, sans-serif; font-size: 16px;">&nbsp;runs on a variety of platforms, such as Windows, Mac OS, and the various versions of UNIX.</span></p>\r\n', 'MON', 1, 0, '2016-11-22 17:02:05', '2016-11-22 17:02:05'),
(48, 14, 12, 17, 'JB1', 'Java Batch', '8-10', 'San Diego', 4, 'months', '2016-12-29', '2017-04-28', 25, 250, 2, '<p>\r\n	<span style="font-weight: bold; color: rgb(106, 106, 106); font-family: arial, sans-serif; font-size: small;">Java</span><span style="color: rgb(84, 84, 84); font-family: arial, sans-serif; font-size: small;">&nbsp;is a set of computer software and specifications developed by Sun Microsystems, which was later acquired by the Oracle Corporation,</span></p>\r\n', 'SUN', 1, 0, '2016-11-22 17:03:48', '2016-11-22 17:03:48'),
(49, 14, 14, 21, 'MRNG1', 'Java Batch', '6-8', 'San Francisco', 2, 'months', '2016-12-30', '2017-03-01', 10, 150, 2, '<p>\r\n	<span style="font-weight: bold; color: rgb(106, 106, 106); font-family: arial, sans-serif; font-size: small;">Java</span><span style="color: rgb(84, 84, 84); font-family: arial, sans-serif; font-size: small;">&nbsp;is a set of computer software and specifications developed by Sun Microsystems, which was later acquired by the Oracle Corporation,</span></p>\r\n', 'SUN', 1, 0, '2016-11-22 17:07:12', '2016-11-22 17:07:12'),
(50, 20, 14, 22, 'HTMLB1', 'HTML Batch', '10-11', 'Sacramento', 3, 'months', '2017-01-28', '2017-04-27', 10, 200, 2, '<p>\r\n	<span style="color: rgb(84, 84, 84); font-family: arial, sans-serif; font-size: small;">The&nbsp;</span><span style="font-weight: bold; color: rgb(106, 106, 106); font-family: arial, sans-serif; font-size: small;">HTML</span><span style="color: rgb(84, 84, 84); font-family: arial, sans-serif; font-size: small;">&nbsp;Certificate documents your knowledge of&nbsp;</span><span style="font-weight: bold; color: rgb(106, 106, 106); font-family: arial, sans-serif; font-size: small;">HTML</span><span style="color: rgb(84, 84, 84); font-family: arial, sans-serif; font-size: small;">. The CSS Certificate documents your knowledge of advanced CSS. The JavaScript Certificate documents your knowledge of JavaScript and&nbsp;</span><span style="font-weight: bold; color: rgb(106, 106, 106); font-family: arial, sans-serif; font-size: small;">HTML</span><span style="color: rgb(84, 84, 84); font-family: arial, sans-serif; font-size: small;">&nbsp;DOM.</span></p>\r\n', 'SUN', 1, 0, '2016-11-22 17:10:05', '2016-11-22 17:10:05'),
(51, 14, 15, 23, 'JBS', 'Java Batch', '16-18', 'Los Angeles', 3, 'months', '2016-12-21', '2017-03-20', 10, 300, 2, '<p>\r\n	<span style="font-weight: bold; color: rgb(106, 106, 106); font-family: arial, sans-serif; font-size: small;">Java</span><span style="color: rgb(84, 84, 84); font-family: arial, sans-serif; font-size: small;">&nbsp;is a set of computer software and specifications developed by Sun Microsystems, which was later acquired by the Oracle Corporation,</span></p>\r\n', 'SUN', 1, 0, '2016-11-22 17:14:03', '2016-11-22 17:14:03'),
(52, 20, 15, 24, 'html1', 'HTML Batch', '8-10', 'Fresno', 30, 'days', '2017-01-31', '2017-03-01', 30, 90, 2, '<p>\r\n	<span style="color: rgb(84, 84, 84); font-family: arial, sans-serif; font-size: small;">The&nbsp;</span><span style="font-weight: bold; color: rgb(106, 106, 106); font-family: arial, sans-serif; font-size: small;">HTML</span><span style="color: rgb(84, 84, 84); font-family: arial, sans-serif; font-size: small;">&nbsp;Certificate documents your knowledge of&nbsp;</span><span style="font-weight: bold; color: rgb(106, 106, 106); font-family: arial, sans-serif; font-size: small;">HTML</span><span style="color: rgb(84, 84, 84); font-family: arial, sans-serif; font-size: small;">. The CSS Certificate documents your knowledge of advanced CSS. The JavaScript Certificate documents your knowledge of JavaScript and&nbsp;</span><span style="font-weight: bold; color: rgb(106, 106, 106); font-family: arial, sans-serif; font-size: small;">HTML</span><span style="color: rgb(84, 84, 84); font-family: arial, sans-serif; font-size: small;">&nbsp;DOM.</span></p>\r\n', 'SUN', 1, 0, '2016-11-22 17:15:03', '2016-11-22 17:15:03'),
(53, 15, 13, 19, 'ADB', 'Adobe Batch', '11-13', 'Los Angeles', 3, 'months', '2017-01-18', '2017-04-17', 10, 240, 2, '<p>\r\n	<span style="font-weight: bold; color: rgb(106, 106, 106); font-family: arial, sans-serif; font-size: small;">Photoshop</span><span style="color: rgb(84, 84, 84); font-family: arial, sans-serif; font-size: small;">&nbsp;CC.</span><wbr style="color: rgb(84, 84, 84); font-family: arial, sans-serif; font-size: small;" /><span style="color: rgb(84, 84, 84); font-family: arial, sans-serif; font-size: small;">&nbsp;Create incredible images using the world&#39;s best digital imaging software.</span><wbr style="color: rgb(84, 84, 84); font-family: arial, sans-serif; font-size: small;" /><span style="color: rgb(84, 84, 84); font-family: arial, sans-serif; font-size: small;">&nbsp;... Popular searches: Photo editor, Photo editing, Edit photos, Photo editing software, Image resizer</span></p>\r\n', 'SUN', 1, 0, '2016-11-22 17:19:41', '2016-11-22 17:19:41'),
(54, 15, 15, 24, 'AB1', 'Adobe Batch', '18-20', 'Long Beach', 2, 'months', '2017-01-31', '2017-03-30', 10, 300, 2, '<p>\r\n	<span style="font-weight: bold; color: rgb(106, 106, 106); font-family: arial, sans-serif; font-size: small;">Photoshop</span><span style="color: rgb(84, 84, 84); font-family: arial, sans-serif; font-size: small;">&nbsp;CC.</span><wbr style="color: rgb(84, 84, 84); font-family: arial, sans-serif; font-size: small;" /><span style="color: rgb(84, 84, 84); font-family: arial, sans-serif; font-size: small;">&nbsp;Create incredible images using the world&#39;s best digital imaging software.</span><wbr style="color: rgb(84, 84, 84); font-family: arial, sans-serif; font-size: small;" /><span style="color: rgb(84, 84, 84); font-family: arial, sans-serif; font-size: small;">&nbsp;... Popular searches: Photo editor, Photo editing, Edit photos, Photo editing software, Image resizer</span></p>\r\n', 'SUN', 1, 0, '2016-11-22 17:20:56', '2016-11-22 17:20:56'),
(55, 15, 12, 18, 'ABD2', 'Adobe Batch', '12-14', 'San Diego', 4, 'months', '2017-02-22', '2017-06-21', 25, 400, 2, '<p>\r\n	<span style="font-weight: bold; color: rgb(106, 106, 106); font-family: arial, sans-serif; font-size: small;">Photoshop</span><span style="color: rgb(84, 84, 84); font-family: arial, sans-serif; font-size: small;">&nbsp;CC.</span><wbr style="color: rgb(84, 84, 84); font-family: arial, sans-serif; font-size: small;" /><span style="color: rgb(84, 84, 84); font-family: arial, sans-serif; font-size: small;">&nbsp;Create incredible images using the world&#39;s best digital imaging software.</span><wbr style="color: rgb(84, 84, 84); font-family: arial, sans-serif; font-size: small;" /><span style="color: rgb(84, 84, 84); font-family: arial, sans-serif; font-size: small;">&nbsp;... Popular searches: Photo editor, Photo editing, Edit photos, Photo editing software, Image resizer</span></p>\r\n', 'SUN', 1, 0, '2016-11-22 17:23:21', '2016-11-22 17:23:21'),
(56, 15, 16, 26, 'ADB12', 'Adobe Batch', '8-10', 'San Francisco', 3, 'months', '2017-01-31', '2017-04-30', 10, 260, 2, '<p>\r\n	<span style="font-weight: bold; color: rgb(106, 106, 106); font-family: arial, sans-serif; font-size: small;">Photoshop</span><span style="color: rgb(84, 84, 84); font-family: arial, sans-serif; font-size: small;">&nbsp;CC.</span><wbr style="color: rgb(84, 84, 84); font-family: arial, sans-serif; font-size: small;" /><span style="color: rgb(84, 84, 84); font-family: arial, sans-serif; font-size: small;">&nbsp;Create incredible images using the world&#39;s best digital imaging software.</span><wbr style="color: rgb(84, 84, 84); font-family: arial, sans-serif; font-size: small;" /><span style="color: rgb(84, 84, 84); font-family: arial, sans-serif; font-size: small;">&nbsp;... Popular searches: Photo editor, Photo editing, Edit photos, Photo editing software, Image resizer</span></p>\r\n', 'SUN', 1, 0, '2016-11-22 17:40:25', '2016-11-22 17:40:25'),
(57, 20, 16, 26, 'html1', 'HTML Batch', '16-18', 'San Diego', 2, 'months', '2017-01-09', '2017-03-08', 25, 160, 2, '<p>\r\n	<span style="color: rgb(84, 84, 84); font-family: arial, sans-serif; font-size: small;">The&nbsp;</span><span style="font-weight: bold; color: rgb(106, 106, 106); font-family: arial, sans-serif; font-size: small;">HTML</span><span style="color: rgb(84, 84, 84); font-family: arial, sans-serif; font-size: small;">&nbsp;Certificate documents your knowledge of&nbsp;</span><span style="font-weight: bold; color: rgb(106, 106, 106); font-family: arial, sans-serif; font-size: small;">HTML</span><span style="color: rgb(84, 84, 84); font-family: arial, sans-serif; font-size: small;">. The CSS Certificate documents your knowledge of advanced CSS. The JavaScript Certificate documents your knowledge of JavaScript and&nbsp;</span><span style="font-weight: bold; color: rgb(106, 106, 106); font-family: arial, sans-serif; font-size: small;">HTML</span><span style="color: rgb(84, 84, 84); font-family: arial, sans-serif; font-size: small;">&nbsp;DOM.</span></p>\r\n', 'SUN', 1, 0, '2016-11-22 17:41:49', '2016-11-22 17:41:49'),
(58, 13, 13, 20, 'cb1', 'C++ Batch', '17-19', 'Los Angeles', 2, 'months', '2017-01-18', '2017-03-17', 10, 80, 2, '<p>\r\n	<b style="font-family: arial, sans-serif; font-size: 16px;">C++</b><span style="font-family: arial, sans-serif; font-size: 16px;">&nbsp;is a middle-level programming language developed by Bjarne Stroustrup starting in 1979 at Bell Labs.&nbsp;</span><b style="font-family: arial, sans-serif; font-size: 16px;">C++</b><span style="font-family: arial, sans-serif; font-size: 16px;">&nbsp;runs on a variety of platforms, such as Windows, Mac OS, and the various versions of UNIX.</span></p>\r\n', 'SUN', 1, 0, '2016-11-22 17:48:58', '2016-11-22 17:48:58'),
(59, 14, 13, 19, 'JB11', 'Java Batch', '14-16', 'San Francisco', 3, 'months', '2017-01-01', '2017-03-31', 20, 170, 2, '<p>\r\n	<span style="font-weight: bold; color: rgb(106, 106, 106); font-family: arial, sans-serif; font-size: small;">Java</span><span style="color: rgb(84, 84, 84); font-family: arial, sans-serif; font-size: small;">&nbsp;is a set of computer software and specifications developed by Sun Microsystems, which was later acquired by the Oracle Corporation,</span></p>\r\n', 'SUN', 1, 0, '2016-11-22 17:51:40', '2016-11-22 17:51:40'),
(60, 20, 13, 20, 'HTML1', 'HTML Batch', '6-8', 'San Jose', 30, 'days', '2016-12-29', '2017-01-27', 10, 70, 2, '<p>\r\n	<span style="color: rgb(84, 84, 84); font-family: arial, sans-serif; font-size: small;">The&nbsp;</span><span style="font-weight: bold; color: rgb(106, 106, 106); font-family: arial, sans-serif; font-size: small;">HTML</span><span style="color: rgb(84, 84, 84); font-family: arial, sans-serif; font-size: small;">&nbsp;Certificate documents your knowledge of&nbsp;</span><span style="font-weight: bold; color: rgb(106, 106, 106); font-family: arial, sans-serif; font-size: small;">HTML</span><span style="color: rgb(84, 84, 84); font-family: arial, sans-serif; font-size: small;">. The CSS Certificate documents your knowledge of advanced CSS. The JavaScript Certificate documents your knowledge of JavaScript and&nbsp;</span><span style="font-weight: bold; color: rgb(106, 106, 106); font-family: arial, sans-serif; font-size: small;">HTML</span><span style="color: rgb(84, 84, 84); font-family: arial, sans-serif; font-size: small;">&nbsp;DOM.</span></p>\r\n', 'SUN', 1, 0, '2016-11-22 17:52:45', '2016-11-22 17:52:45'),
(61, 21, 13, 19, 'JB', 'Javascript Batch', '13-15', 'Los Angeles', 3, 'months', '2017-03-22', '2017-06-21', 15, 250, 2, '<p>\r\n	<span style="font-weight: bold; color: rgb(106, 106, 106); font-family: arial, sans-serif; font-size: small;">JavaScript</span><span style="color: rgb(84, 84, 84); font-family: arial, sans-serif; font-size: small;">&nbsp;is a lightweight, interpreted programming language.</span><wbr style="color: rgb(84, 84, 84); font-family: arial, sans-serif; font-size: small;" /><span style="color: rgb(84, 84, 84); font-family: arial, sans-serif; font-size: small;">&nbsp;... This tutorial has been prepared for&nbsp;</span><span style="font-weight: bold; color: rgb(106, 106, 106); font-family: arial, sans-serif; font-size: small;">JavaScript</span><span style="color: rgb(84, 84, 84); font-family: arial, sans-serif; font-size: small;">&nbsp;beginners to help them understand the basic functionality of&nbsp;</span><span style="font-weight: bold; color: rgb(106, 106, 106); font-family: arial, sans-serif; font-size: small;">JavaScript</span><span style="color: rgb(84, 84, 84); font-family: arial, sans-serif; font-size: small;">&nbsp;to build dynamic web pages and web applications</span></p>\r\n', 'SUN,SAT', 1, 0, '2016-11-22 17:55:12', '2016-11-22 17:55:12'),
(62, 15, 14, 21, 'BB1', 'Adobe Batch', '14-16', 'San Jose', 3, 'months', '2017-01-11', '2017-04-10', 10, 340, 2, '<p>\r\n	<span style="font-weight: bold; color: rgb(106, 106, 106); font-family: arial, sans-serif; font-size: small;">Photoshop</span><span style="color: rgb(84, 84, 84); font-family: arial, sans-serif; font-size: small;">&nbsp;CC.</span><wbr style="color: rgb(84, 84, 84); font-family: arial, sans-serif; font-size: small;" /><span style="color: rgb(84, 84, 84); font-family: arial, sans-serif; font-size: small;">&nbsp;Create incredible images using the world&#39;s best digital imaging software.</span><wbr style="color: rgb(84, 84, 84); font-family: arial, sans-serif; font-size: small;" /><span style="color: rgb(84, 84, 84); font-family: arial, sans-serif; font-size: small;">&nbsp;... Popular searches: Photo editor, Photo editing, Edit photos, Photo editing software, Image resizer</span></p>\r\n', 'SUN', 1, 0, '2016-11-22 18:00:49', '2016-11-22 18:00:49');

-- --------------------------------------------------------

--
-- Table structure for table `pre_inst_enrolled_students`
--

CREATE TABLE `pre_inst_enrolled_students` (
  `enroll_id` bigint(20) NOT NULL,
  `student_id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  `batch_id` int(11) NOT NULL,
  `inst_id` int(11) NOT NULL,
  `tutor_id` int(11) NOT NULL,
  `batch_code` varchar(55) CHARACTER SET utf8 NOT NULL,
  `batch_name` varchar(512) CHARACTER SET utf8 NOT NULL,
  `time_slot` varchar(15) CHARACTER SET utf8 NOT NULL,
  `course_offering_location` varchar(512) CHARACTER SET utf8 NOT NULL,
  `duration_value` tinyint(5) NOT NULL,
  `duration_type` enum('hours','days','months','years') CHARACTER SET utf8 NOT NULL DEFAULT 'days',
  `batch_start_date` date NOT NULL,
  `batch_end_date` date NOT NULL,
  `fee` float NOT NULL,
  `per_credit_value` float NOT NULL DEFAULT '1',
  `course_content` text CHARACTER SET utf8,
  `days_off` varchar(155) CHARACTER SET utf8 DEFAULT NULL,
  `message` varchar(1000) CHARACTER SET utf8 DEFAULT NULL,
  `admin_commission` float NOT NULL DEFAULT '0' COMMENT 'admin commission in percentage with the fee in credits. result will be in round value of credits',
  `admin_commission_val` float NOT NULL DEFAULT '0' COMMENT 'admin commision value in credits',
  `prev_status` varchar(512) CHARACTER SET utf8 NOT NULL DEFAULT 'pending',
  `status` enum('pending','approved','session_initiated','running','completed','called_for_admin_intervention','closed','cancelled_before_course_started') CHARACTER SET utf8 NOT NULL DEFAULT 'pending',
  `status_desc` varchar(1000) CHARACTER SET utf8 DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pre_inst_enrolled_students`
--

INSERT INTO `pre_inst_enrolled_students` (`enroll_id`, `student_id`, `course_id`, `batch_id`, `inst_id`, `tutor_id`, `batch_code`, `batch_name`, `time_slot`, `course_offering_location`, `duration_value`, `duration_type`, `batch_start_date`, `batch_end_date`, `fee`, `per_credit_value`, `course_content`, `days_off`, `message`, `admin_commission`, `admin_commission_val`, `prev_status`, `status`, `status_desc`, `created_at`, `updated_at`, `updated_by`) VALUES
(1, 4, 18, 2, 12, 17, 'DR', 'DREMWEAVER', '17-19', 'San Francisco', 2, 'months', '2016-11-16', '2017-01-15', 400, 2, '<p>\r\n	<span style="font-family: arial, sans-serif; font-size: 16px;">Adobe&nbsp;</span><b style="font-family: arial, sans-serif; font-size: 16px;">Dreamweaver</b><span style="font-family: arial, sans-serif; font-size: 16px;">&nbsp;is an application used by web designers and developers to create websites and applications for use across multiple targets. Including browsers, devices, and tablets. Web designers use&nbsp;</span><b style="font-family: arial, sans-serif; font-size: 16px;">Dreamweaver</b><span style="font-family: arial, sans-serif; font-size: 16px;">&nbsp;for creating website prototypes using web-friendly artwork.</span></p>\r\n', 'SUN', 'Hello i am ...........', 10, 40, 'closed', 'closed', 'xsd', '2016-11-09 18:17:38', '2016-11-23 15:07:37', 1),
(2, 5, 24, 7, 14, 22, 'MS', 'Msoffice', '09-11', 'Lakewood', 1, 'months', '2016-11-09', '2016-12-08', 200, 2, '<p>\r\n	<b style="font-family: arial, sans-serif; font-size: 16px;">Microsoft Office</b><span style="font-family: arial, sans-serif; font-size: 16px;">&nbsp;is a set of interrelated desktop applications, servers and services, collectively referred to as an&nbsp;</span><b style="font-family: arial, sans-serif; font-size: 16px;">office</b><span style="font-family: arial, sans-serif; font-size: 16px;">&nbsp;suite, for the&nbsp;</span><b style="font-family: arial, sans-serif; font-size: 16px;">Microsoft</b><span style="font-family: arial, sans-serif; font-size: 16px;">&nbsp;Windows and Mac OS X operating systems. This list contains all the programs that are, or have been, in&nbsp;</span><b style="font-family: arial, sans-serif; font-size: 16px;">Microsoft Office</b><span style="font-family: arial, sans-serif; font-size: 16px;">&nbsp;since it began and are in alphabetical order.</span></p>\r\n', 'SUN', 'Hello I am james', 10, 20, 'pending', 'pending', NULL, '2016-11-09 18:20:56', '2016-11-09 18:20:56', 5),
(3, 6, 16, 6, 14, 21, 'DNET', 'DotNet', '12-14', 'Lakewood', 2, 'months', '2016-11-10', '2017-01-09', 300, 2, '<p>\r\n	<b style="font-family: arial, sans-serif; font-size: 16px;">C#</b><span style="font-family: arial, sans-serif; font-size: 16px;">&nbsp;</span><sup style="font-family: arial, sans-serif;">[</sup><sup style="font-family: arial, sans-serif;">note</sup><span style="font-family: arial, sans-serif; font-size: 16px;">&nbsp;</span><sup style="font-family: arial, sans-serif;">2</sup><sup style="font-family: arial, sans-serif;">]</sup><span style="font-family: arial, sans-serif; font-size: 16px;">&nbsp;(pronounced as see sharp) is a multi-paradigm programming language encompassing strong typing, imperative, declarative, functional, generic, object-oriented (class-based), and component-oriented programming disciplines.</span></p>\r\n', 'SUN', 'Hello I AM James ', 10, 30, 'pending', 'pending', NULL, '2016-11-09 18:23:03', '2016-11-09 18:23:03', 6),
(4, 3, 16, 32, 13, 20, '.Net', '.Net', '11-13', 'San Francisco', 2, 'months', '2016-11-12', '2017-01-11', 250, 2, '<p>\r\n	<span style="font-family: arial, sans-serif; font-size: 16px;">.</span><b style="font-family: arial, sans-serif; font-size: 16px;">NET</b><span style="font-family: arial, sans-serif; font-size: 16px;">&nbsp;Framework (pronounced dot&nbsp;</span><b style="font-family: arial, sans-serif; font-size: 16px;">net</b><span style="font-family: arial, sans-serif; font-size: 16px;">) is a software framework developed by Microsoft that runs primarily on Microsoft Windows. ... (As such, computer code written using .</span><b style="font-family: arial, sans-serif; font-size: 16px;">NET</b><span style="font-family: arial, sans-serif; font-size: 16px;">&nbsp;Framework is called &quot;managed code&quot;.)</span></p>\r\n', 'SUN', 'Hello i am so and so i  need this course', 10, 25, 'approved', 'called_for_admin_intervention', 'Congrates father details will update you in soon', '2016-11-11 12:05:09', '2016-11-14 13:02:58', 3),
(5, 3, 27, 4, 13, 20, 'QA', 'QA', '8-10', 'Tallahassee', 2, 'days', '2016-11-11', '2016-11-12', 430, 2, '<p>\r\n	<span class="_Tgc"><b>Software testing</b> is a process of executing a program or application with the intent of finding the <b>software</b> bugs. It can also be stated as the process of validating and verifying that a <b>software</b> program or application or product: Meets the business and technical requirements that guided it&#39;s design and development.</span></p>\r\n', 'SUN', 'Hello i am james i need this course', 10, 43, 'closed', 'closed', 'Congrates father details will update you in soon', '2016-11-11 12:05:47', '2016-11-23 15:22:13', 1),
(6, 3, 40, 35, 13, 20, 'BGY', 'Biology', '12-13', 'El Paso', 4, 'months', '2017-06-23', '2017-10-22', 500, 2, '<p>\r\n	<span style="font-family: arial, sans-serif; font-size: 16px;">The science of life and of living organisms, including their structure, function, growth, origin, evolution, and distribution. It includes botany and zoology and all their subdivisions. 2. The life processes or characteristic phenomena of a group or category of living organisms: the&nbsp;</span><b style="font-family: arial, sans-serif; font-size: 16px;">biology</b><span style="font-family: arial, sans-serif; font-size: 16px;">&nbsp;of fungi.</span></p>\r\n', 'SUN', 'Hello i am so and so  i need  this course', 10, 50, 'session_initiated', 'closed', '', '2016-11-11 12:08:10', '2016-11-11 12:25:12', 13),
(7, 3, 42, 36, 13, 20, 'CE', 'Competitive Exam', '7-8', 'Columbus', 6, 'days', '2018-01-18', '2018-01-23', 600, 2, '<p>\r\n	<span style="font-family: arial, sans-serif; font-size: 16px;">The required portion of the&nbsp;</span><b style="font-family: arial, sans-serif; font-size: 16px;">ACT</b><span style="font-family: arial, sans-serif; font-size: 16px;">&nbsp;is divided into four multiple choice subject&nbsp;</span><b style="font-family: arial, sans-serif; font-size: 16px;">tests</b><span style="font-family: arial, sans-serif; font-size: 16px;">: English, mathematics, reading, and science reasoning. Subject&nbsp;</span><b style="font-family: arial, sans-serif; font-size: 16px;">test</b><span style="font-family: arial, sans-serif; font-size: 16px;">&nbsp;scores range from 1 to 36; all scores are integers. The English, mathematics, and reading&nbsp;</span><b style="font-family: arial, sans-serif; font-size: 16px;">tests</b><span style="font-family: arial, sans-serif; font-size: 16px;">&nbsp;also have subscores ranging from 1 to 18.</span></p>\r\n', 'MON', 'Hello i am jack , i need act exam training please provide', 10, 60, 'session_initiated', 'closed', 'congrates farther details will let u know in soon', '2016-11-11 12:08:55', '2016-11-24 13:22:38', 13),
(8, 3, 66, 34, 13, 20, 'CPL', 'Company Law', '13-19', 'Sacramento', 5, 'months', '2016-11-23', '2017-04-22', 1000, 2, '<p>\r\n	<b style="font-family: arial, sans-serif; font-size: 16px;">Company law</b><span style="font-family: arial, sans-serif; font-size: 16px;">&nbsp;(or the&nbsp;</span><b style="font-family: arial, sans-serif; font-size: 16px;">law</b><span style="font-family: arial, sans-serif; font-size: 16px;">&nbsp;of&nbsp;</span><b style="font-family: arial, sans-serif; font-size: 16px;">business</b><span style="font-family: arial, sans-serif; font-size: 16px;">&nbsp;associations) is the field of&nbsp;</span><b style="font-family: arial, sans-serif; font-size: 16px;">law</b><span style="font-family: arial, sans-serif; font-size: 16px;">&nbsp;concerning&nbsp;</span><b style="font-family: arial, sans-serif; font-size: 16px;">companies</b><span style="font-family: arial, sans-serif; font-size: 16px;">&nbsp;and other&nbsp;</span><b style="font-family: arial, sans-serif; font-size: 16px;">business</b><span style="font-family: arial, sans-serif; font-size: 16px;">&nbsp;organizations. This includes corporations, partnerships and other associations which usually carry on some form of economic or charitable activity. ... Corporation.</span></p>\r\n', 'SUN', 'Hello i am david i need this Course . let me know details ', 10, 100, 'session_initiated', 'closed', 'Congrates father details will update you in soon', '2016-11-11 12:09:51', '2016-11-11 12:20:00', 13),
(9, 3, 55, 33, 13, 20, 'MS OFFICE', 'MS OFFICE', '8-10', 'Fresno', 3, 'months', '2016-11-17', '2017-02-16', 400, 2, '<p>\r\n	<b style="font-family: arial, sans-serif; font-size: 16px;">Microsoft Office</b><span style="font-family: arial, sans-serif; font-size: 16px;">. Suite of products developed by&nbsp;</span><b style="font-family: arial, sans-serif; font-size: 16px;">Microsoft</b><span style="font-family: arial, sans-serif; font-size: 16px;">&nbsp;Corporation that includes&nbsp;</span><b style="font-family: arial, sans-serif; font-size: 16px;">Microsoft</b><span style="font-family: arial, sans-serif; font-size: 16px;">&nbsp;Word, Excel, Access, Publisher, PowerPoint, and Outlook. Each program serves a different purpose and is compatible with other programs included in the package.</span></p>\r\n', 'SUN', 'Hello i want learn ms office . let me know when will it start', 10, 40, 'session_initiated', 'closed', 'Congrates father details will update you in soon', '2016-11-11 12:10:57', '2016-11-14 13:05:17', 13),
(10, 32, 27, 4, 13, 20, 'QA', 'QA', '8-10', 'Tallahassee', 2, 'days', '2018-11-06', '2018-11-07', 430, 2, '<p>\r\n	<span class="_Tgc"><b>Software testing</b> is a process of executing a program or application with the intent of finding the <b>software</b> bugs. It can also be stated as the process of validating and verifying that a <b>software</b> program or application or product: Meets the business and technical requirements that guided it&#39;s design and development.</span></p>\r\n', 'SUN', 'Hi i am denny', 10, 43, 'session_initiated', 'closed', NULL, '2016-11-14 11:56:36', '2016-11-13 11:56:36', 32),
(11, 32, 144, 5, 13, 20, 'bank', 'Bank', '11-13', 'Pueblo', 1, 'days', '2017-11-15', '2017-11-15', 280, 2, '<p>\r\n	<span class="_Tgc">The IBPS clerk exam is universally adapted by nationalized <b>banks</b> across India to induct fresh graduates into various clerical posts. ... IBPS also conducts exams for recruitment to the post of probationary officer (<b>PO</b>) and specialist officer (SO).</span></p>\r\n', 'SUN', 'Hi i am denny', 10, 28, 'session_initiated', 'closed', 'approve', '2016-11-14 11:57:41', '2016-11-13 12:51:59', 13),
(12, 33, 27, 4, 13, 20, 'QA', 'QA', '8-10', 'Tallahassee', 2, 'days', '2018-11-06', '2018-11-07', 430, 2, '<p>\r\n	<span class="_Tgc"><b>Software testing</b> is a process of executing a program or application with the intent of finding the <b>software</b> bugs. It can also be stated as the process of validating and verifying that a <b>software</b> program or application or product: Meets the business and technical requirements that guided it&#39;s design and development.</span></p>\r\n', 'SUN', 'Hi i am Jack.....................', 10, 43, 'session_initiated', 'closed', NULL, '2016-11-14 12:05:00', '2016-11-13 12:05:00', 33),
(13, 33, 144, 5, 13, 20, 'bank', 'Bank', '11-13', 'Pueblo', 1, 'days', '2017-11-15', '2017-11-15', 280, 2, '<p>\r\n	<span class="_Tgc">The IBPS clerk exam is universally adapted by nationalized <b>banks</b> across India to induct fresh graduates into various clerical posts. ... IBPS also conducts exams for recruitment to the post of probationary officer (<b>PO</b>) and specialist officer (SO).</span></p>\r\n', 'SUN', 'Hi i am Jack................', 10, 28, 'session_initiated', 'closed', 'approve', '2016-11-14 12:05:47', '2016-11-13 12:52:10', 13),
(14, 34, 27, 4, 13, 20, 'QA', 'QA', '8-10', 'Tallahassee', 2, 'days', '2018-11-06', '2018-11-07', 430, 2, '<p>\r\n	<span class="_Tgc"><b>Software testing</b> is a process of executing a program or application with the intent of finding the <b>software</b> bugs. It can also be stated as the process of validating and verifying that a <b>software</b> program or application or product: Meets the business and technical requirements that guided it&#39;s design and development.</span></p>\r\n', 'SUN', 'Hi I am john...........', 10, 43, 'session_initiated', 'closed', NULL, '2016-11-14 12:10:56', '2016-11-13 12:10:56', 34),
(15, 34, 144, 5, 13, 20, 'bank', 'Bank', '11-13', 'Pueblo', 1, 'days', '2017-11-15', '2017-11-15', 280, 2, '<p>\r\n	<span class="_Tgc">The IBPS clerk exam is universally adapted by nationalized <b>banks</b> across India to induct fresh graduates into various clerical posts. ... IBPS also conducts exams for recruitment to the post of probationary officer (<b>PO</b>) and specialist officer (SO).</span></p>\r\n', 'SUN', 'Hello i am Mahelet Dalasia....................................... ', 10, 28, 'session_initiated', 'closed', 'approve', '2016-11-14 12:11:53', '2016-11-13 12:52:21', 13),
(16, 3, 144, 5, 13, 20, 'bank', 'Bank', '11-13', 'Pueblo', 1, 'days', '2017-11-15', '2017-11-15', 280, 2, '<p>\r\n	<span class="_Tgc">The IBPS clerk exam is universally adapted by nationalized <b>banks</b> across India to induct fresh graduates into various clerical posts. ... IBPS also conducts exams for recruitment to the post of probationary officer (<b>PO</b>) and specialist officer (SO).</span></p>\r\n', 'SUN', 'Hello i am Azalya Abia...........................', 10, 28, 'session_initiated', 'closed', 'approve', '2016-11-14 12:14:34', '2016-11-13 12:52:30', 13);

-- --------------------------------------------------------

--
-- Table structure for table `pre_inst_locations`
--

CREATE TABLE `pre_inst_locations` (
  `id` int(11) NOT NULL,
  `inst_id` int(11) NOT NULL,
  `location_id` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `sort_order` tinyint(5) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pre_inst_locations`
--

INSERT INTO `pre_inst_locations` (`id`, `inst_id`, `location_id`, `status`, `sort_order`, `created_at`, `updated_at`) VALUES
(234, 12, 13, 1, 0, '2016-11-21 11:49:49', '2016-11-21 11:49:49'),
(235, 12, 14, 1, 0, '2016-11-21 11:49:49', '2016-11-21 11:49:49'),
(236, 12, 15, 1, 0, '2016-11-21 11:49:49', '2016-11-21 11:49:49'),
(237, 12, 16, 1, 0, '2016-11-21 11:49:49', '2016-11-21 11:49:49'),
(238, 12, 17, 1, 0, '2016-11-21 11:49:49', '2016-11-21 11:49:49'),
(239, 12, 18, 1, 0, '2016-11-21 11:49:49', '2016-11-21 11:49:49'),
(240, 12, 19, 1, 0, '2016-11-21 11:49:49', '2016-11-21 11:49:49'),
(241, 12, 20, 1, 0, '2016-11-21 11:49:49', '2016-11-21 11:49:49'),
(242, 12, 21, 1, 0, '2016-11-21 11:49:49', '2016-11-21 11:49:49'),
(243, 12, 22, 1, 0, '2016-11-21 11:49:49', '2016-11-21 11:49:49'),
(244, 12, 3, 1, 0, '2016-11-21 11:49:49', '2016-11-21 11:49:49'),
(245, 12, 4, 1, 0, '2016-11-21 11:49:49', '2016-11-21 11:49:49'),
(246, 12, 5, 1, 0, '2016-11-21 11:49:49', '2016-11-21 11:49:49'),
(247, 12, 6, 1, 0, '2016-11-21 11:49:49', '2016-11-21 11:49:49'),
(248, 12, 7, 1, 0, '2016-11-21 11:49:49', '2016-11-21 11:49:49'),
(249, 12, 8, 1, 0, '2016-11-21 11:49:49', '2016-11-21 11:49:49'),
(250, 12, 9, 1, 0, '2016-11-21 11:49:49', '2016-11-21 11:49:49'),
(251, 12, 10, 1, 0, '2016-11-21 11:49:49', '2016-11-21 11:49:49'),
(252, 12, 11, 1, 0, '2016-11-21 11:49:49', '2016-11-21 11:49:49'),
(253, 12, 12, 1, 0, '2016-11-21 11:49:49', '2016-11-21 11:49:49'),
(254, 12, 24, 1, 0, '2016-11-21 11:49:49', '2016-11-21 11:49:49'),
(255, 12, 25, 1, 0, '2016-11-21 11:49:49', '2016-11-21 11:49:49'),
(256, 12, 26, 1, 0, '2016-11-21 11:49:49', '2016-11-21 11:49:49'),
(257, 12, 27, 1, 0, '2016-11-21 11:49:49', '2016-11-21 11:49:49'),
(258, 12, 28, 1, 0, '2016-11-21 11:49:49', '2016-11-21 11:49:49'),
(259, 12, 29, 1, 0, '2016-11-21 11:49:49', '2016-11-21 11:49:49'),
(260, 12, 30, 1, 0, '2016-11-21 11:49:49', '2016-11-21 11:49:49'),
(261, 12, 31, 1, 0, '2016-11-21 11:49:49', '2016-11-21 11:49:49'),
(262, 12, 32, 1, 0, '2016-11-21 11:49:49', '2016-11-21 11:49:49'),
(263, 12, 33, 1, 0, '2016-11-21 11:49:49', '2016-11-21 11:49:49'),
(264, 12, 36, 1, 0, '2016-11-21 11:49:49', '2016-11-21 11:49:49'),
(265, 12, 37, 1, 0, '2016-11-21 11:49:49', '2016-11-21 11:49:49'),
(266, 12, 38, 1, 0, '2016-11-21 11:49:49', '2016-11-21 11:49:49'),
(267, 12, 40, 1, 0, '2016-11-21 11:49:49', '2016-11-21 11:49:49'),
(268, 12, 41, 1, 0, '2016-11-21 11:49:49', '2016-11-21 11:49:49'),
(269, 12, 43, 1, 0, '2016-11-21 11:49:49', '2016-11-21 11:49:49'),
(270, 12, 45, 1, 0, '2016-11-21 11:49:49', '2016-11-21 11:49:49'),
(271, 12, 50, 1, 0, '2016-11-21 11:49:49', '2016-11-21 11:49:49'),
(272, 12, 52, 1, 0, '2016-11-21 11:49:49', '2016-11-21 11:49:49'),
(273, 12, 53, 1, 0, '2016-11-21 11:49:49', '2016-11-21 11:49:49'),
(274, 12, 54, 1, 0, '2016-11-21 11:49:49', '2016-11-21 11:49:49'),
(275, 12, 55, 1, 0, '2016-11-21 11:49:49', '2016-11-21 11:49:49'),
(276, 12, 56, 1, 0, '2016-11-21 11:49:49', '2016-11-21 11:49:49'),
(277, 12, 58, 1, 0, '2016-11-21 11:49:49', '2016-11-21 11:49:49'),
(278, 12, 59, 1, 0, '2016-11-21 11:49:49', '2016-11-21 11:49:49'),
(279, 12, 60, 1, 0, '2016-11-21 11:49:49', '2016-11-21 11:49:49'),
(280, 12, 61, 1, 0, '2016-11-21 11:49:49', '2016-11-21 11:49:49'),
(281, 12, 62, 1, 0, '2016-11-21 11:49:49', '2016-11-21 11:49:49'),
(282, 12, 63, 1, 0, '2016-11-21 11:49:49', '2016-11-21 11:49:49'),
(283, 12, 71, 1, 0, '2016-11-21 11:49:49', '2016-11-21 11:49:49'),
(284, 12, 72, 1, 0, '2016-11-21 11:49:49', '2016-11-21 11:49:49'),
(285, 12, 73, 1, 0, '2016-11-21 11:49:49', '2016-11-21 11:49:49'),
(286, 12, 74, 1, 0, '2016-11-21 11:49:49', '2016-11-21 11:49:49'),
(287, 12, 77, 1, 0, '2016-11-21 11:49:49', '2016-11-21 11:49:49'),
(288, 12, 78, 1, 0, '2016-11-21 11:49:49', '2016-11-21 11:49:49'),
(289, 12, 79, 1, 0, '2016-11-21 11:49:49', '2016-11-21 11:49:49'),
(290, 12, 80, 1, 0, '2016-11-21 11:49:49', '2016-11-21 11:49:49'),
(291, 12, 86, 1, 0, '2016-11-21 11:49:49', '2016-11-21 11:49:49'),
(292, 12, 88, 1, 0, '2016-11-21 11:49:49', '2016-11-21 11:49:49'),
(293, 12, 89, 1, 0, '2016-11-21 11:49:49', '2016-11-21 11:49:49'),
(294, 12, 110, 1, 0, '2016-11-21 11:49:49', '2016-11-21 11:49:49'),
(295, 12, 111, 1, 0, '2016-11-21 11:49:49', '2016-11-21 11:49:49'),
(296, 13, 13, 1, 0, '2016-11-21 11:51:48', '2016-11-21 11:51:48'),
(297, 13, 14, 1, 0, '2016-11-21 11:51:48', '2016-11-21 11:51:48'),
(298, 13, 15, 1, 0, '2016-11-21 11:51:48', '2016-11-21 11:51:48'),
(299, 13, 16, 1, 0, '2016-11-21 11:51:48', '2016-11-21 11:51:48'),
(300, 13, 17, 1, 0, '2016-11-21 11:51:48', '2016-11-21 11:51:48'),
(301, 13, 19, 1, 0, '2016-11-21 11:51:48', '2016-11-21 11:51:48'),
(302, 13, 20, 1, 0, '2016-11-21 11:51:48', '2016-11-21 11:51:48'),
(303, 13, 21, 1, 0, '2016-11-21 11:51:48', '2016-11-21 11:51:48'),
(304, 13, 22, 1, 0, '2016-11-21 11:51:48', '2016-11-21 11:51:48'),
(305, 13, 3, 1, 0, '2016-11-21 11:51:48', '2016-11-21 11:51:48'),
(306, 13, 4, 1, 0, '2016-11-21 11:51:48', '2016-11-21 11:51:48'),
(307, 13, 5, 1, 0, '2016-11-21 11:51:48', '2016-11-21 11:51:48'),
(308, 13, 6, 1, 0, '2016-11-21 11:51:48', '2016-11-21 11:51:48'),
(309, 13, 7, 1, 0, '2016-11-21 11:51:48', '2016-11-21 11:51:48'),
(310, 13, 8, 1, 0, '2016-11-21 11:51:48', '2016-11-21 11:51:48'),
(311, 13, 9, 1, 0, '2016-11-21 11:51:48', '2016-11-21 11:51:48'),
(312, 13, 10, 1, 0, '2016-11-21 11:51:48', '2016-11-21 11:51:48'),
(313, 13, 11, 1, 0, '2016-11-21 11:51:48', '2016-11-21 11:51:48'),
(314, 13, 12, 1, 0, '2016-11-21 11:51:48', '2016-11-21 11:51:48'),
(315, 13, 24, 1, 0, '2016-11-21 11:51:48', '2016-11-21 11:51:48'),
(316, 13, 25, 1, 0, '2016-11-21 11:51:48', '2016-11-21 11:51:48'),
(317, 13, 27, 1, 0, '2016-11-21 11:51:48', '2016-11-21 11:51:48'),
(318, 13, 28, 1, 0, '2016-11-21 11:51:48', '2016-11-21 11:51:48'),
(319, 13, 29, 1, 0, '2016-11-21 11:51:48', '2016-11-21 11:51:48'),
(320, 13, 30, 1, 0, '2016-11-21 11:51:48', '2016-11-21 11:51:48'),
(321, 13, 31, 1, 0, '2016-11-21 11:51:48', '2016-11-21 11:51:48'),
(322, 13, 32, 1, 0, '2016-11-21 11:51:48', '2016-11-21 11:51:48'),
(323, 13, 33, 1, 0, '2016-11-21 11:51:48', '2016-11-21 11:51:48'),
(324, 13, 37, 1, 0, '2016-11-21 11:51:48', '2016-11-21 11:51:48'),
(325, 13, 40, 1, 0, '2016-11-21 11:51:48', '2016-11-21 11:51:48'),
(326, 13, 41, 1, 0, '2016-11-21 11:51:48', '2016-11-21 11:51:48'),
(327, 13, 42, 1, 0, '2016-11-21 11:51:48', '2016-11-21 11:51:48'),
(328, 13, 43, 1, 0, '2016-11-21 11:51:48', '2016-11-21 11:51:48'),
(329, 13, 44, 1, 0, '2016-11-21 11:51:48', '2016-11-21 11:51:48'),
(330, 13, 45, 1, 0, '2016-11-21 11:51:48', '2016-11-21 11:51:48'),
(331, 13, 48, 1, 0, '2016-11-21 11:51:48', '2016-11-21 11:51:48'),
(332, 13, 50, 1, 0, '2016-11-21 11:51:48', '2016-11-21 11:51:48'),
(333, 13, 52, 1, 0, '2016-11-21 11:51:48', '2016-11-21 11:51:48'),
(334, 13, 53, 1, 0, '2016-11-21 11:51:48', '2016-11-21 11:51:48'),
(335, 13, 54, 1, 0, '2016-11-21 11:51:48', '2016-11-21 11:51:48'),
(336, 13, 55, 1, 0, '2016-11-21 11:51:48', '2016-11-21 11:51:48'),
(337, 13, 56, 1, 0, '2016-11-21 11:51:48', '2016-11-21 11:51:48'),
(338, 13, 59, 1, 0, '2016-11-21 11:51:48', '2016-11-21 11:51:48'),
(339, 13, 61, 1, 0, '2016-11-21 11:51:48', '2016-11-21 11:51:48'),
(340, 13, 62, 1, 0, '2016-11-21 11:51:48', '2016-11-21 11:51:48'),
(341, 13, 63, 1, 0, '2016-11-21 11:51:48', '2016-11-21 11:51:48'),
(342, 13, 71, 1, 0, '2016-11-21 11:51:48', '2016-11-21 11:51:48'),
(343, 13, 72, 1, 0, '2016-11-21 11:51:48', '2016-11-21 11:51:48'),
(344, 13, 73, 1, 0, '2016-11-21 11:51:48', '2016-11-21 11:51:48'),
(345, 13, 74, 1, 0, '2016-11-21 11:51:48', '2016-11-21 11:51:48'),
(346, 13, 77, 1, 0, '2016-11-21 11:51:48', '2016-11-21 11:51:48'),
(347, 13, 78, 1, 0, '2016-11-21 11:51:48', '2016-11-21 11:51:48'),
(348, 13, 79, 1, 0, '2016-11-21 11:51:48', '2016-11-21 11:51:48'),
(349, 13, 80, 1, 0, '2016-11-21 11:51:48', '2016-11-21 11:51:48'),
(350, 13, 86, 1, 0, '2016-11-21 11:51:48', '2016-11-21 11:51:48'),
(351, 13, 87, 1, 0, '2016-11-21 11:51:48', '2016-11-21 11:51:48'),
(352, 13, 88, 1, 0, '2016-11-21 11:51:48', '2016-11-21 11:51:48'),
(353, 13, 92, 1, 0, '2016-11-21 11:51:48', '2016-11-21 11:51:48'),
(354, 13, 93, 1, 0, '2016-11-21 11:51:48', '2016-11-21 11:51:48'),
(355, 13, 97, 1, 0, '2016-11-21 11:51:48', '2016-11-21 11:51:48'),
(356, 13, 98, 1, 0, '2016-11-21 11:51:48', '2016-11-21 11:51:48'),
(357, 13, 102, 1, 0, '2016-11-21 11:51:48', '2016-11-21 11:51:48'),
(358, 13, 103, 1, 0, '2016-11-21 11:51:48', '2016-11-21 11:51:48'),
(359, 13, 105, 1, 0, '2016-11-21 11:51:48', '2016-11-21 11:51:48'),
(360, 13, 108, 1, 0, '2016-11-21 11:51:48', '2016-11-21 11:51:48'),
(361, 13, 110, 1, 0, '2016-11-21 11:51:48', '2016-11-21 11:51:48'),
(362, 13, 111, 1, 0, '2016-11-21 11:51:48', '2016-11-21 11:51:48'),
(363, 14, 13, 1, 0, '2016-11-21 11:53:06', '2016-11-21 11:53:06'),
(364, 14, 14, 1, 0, '2016-11-21 11:53:06', '2016-11-21 11:53:06'),
(365, 14, 15, 1, 0, '2016-11-21 11:53:06', '2016-11-21 11:53:06'),
(366, 14, 17, 1, 0, '2016-11-21 11:53:06', '2016-11-21 11:53:06'),
(367, 14, 18, 1, 0, '2016-11-21 11:53:06', '2016-11-21 11:53:06'),
(368, 14, 19, 1, 0, '2016-11-21 11:53:06', '2016-11-21 11:53:06'),
(369, 14, 20, 1, 0, '2016-11-21 11:53:06', '2016-11-21 11:53:06'),
(370, 14, 21, 1, 0, '2016-11-21 11:53:06', '2016-11-21 11:53:06'),
(371, 14, 3, 1, 0, '2016-11-21 11:53:06', '2016-11-21 11:53:06'),
(372, 14, 4, 1, 0, '2016-11-21 11:53:06', '2016-11-21 11:53:06'),
(373, 14, 5, 1, 0, '2016-11-21 11:53:06', '2016-11-21 11:53:06'),
(374, 14, 6, 1, 0, '2016-11-21 11:53:06', '2016-11-21 11:53:06'),
(375, 14, 7, 1, 0, '2016-11-21 11:53:06', '2016-11-21 11:53:06'),
(376, 14, 8, 1, 0, '2016-11-21 11:53:06', '2016-11-21 11:53:06'),
(377, 14, 9, 1, 0, '2016-11-21 11:53:06', '2016-11-21 11:53:06'),
(378, 14, 10, 1, 0, '2016-11-21 11:53:06', '2016-11-21 11:53:06'),
(379, 14, 11, 1, 0, '2016-11-21 11:53:06', '2016-11-21 11:53:06'),
(380, 14, 12, 1, 0, '2016-11-21 11:53:06', '2016-11-21 11:53:06'),
(381, 14, 24, 1, 0, '2016-11-21 11:53:06', '2016-11-21 11:53:06'),
(382, 14, 25, 1, 0, '2016-11-21 11:53:06', '2016-11-21 11:53:06'),
(383, 14, 26, 1, 0, '2016-11-21 11:53:06', '2016-11-21 11:53:06'),
(384, 14, 27, 1, 0, '2016-11-21 11:53:06', '2016-11-21 11:53:06'),
(385, 14, 28, 1, 0, '2016-11-21 11:53:06', '2016-11-21 11:53:06'),
(386, 14, 29, 1, 0, '2016-11-21 11:53:06', '2016-11-21 11:53:06'),
(387, 14, 30, 1, 0, '2016-11-21 11:53:06', '2016-11-21 11:53:06'),
(388, 14, 31, 1, 0, '2016-11-21 11:53:06', '2016-11-21 11:53:06'),
(389, 14, 32, 1, 0, '2016-11-21 11:53:06', '2016-11-21 11:53:06'),
(390, 14, 33, 1, 0, '2016-11-21 11:53:06', '2016-11-21 11:53:06'),
(391, 15, 13, 1, 0, '2016-11-21 11:54:05', '2016-11-21 11:54:05'),
(392, 15, 14, 1, 0, '2016-11-21 11:54:05', '2016-11-21 11:54:05'),
(393, 15, 15, 1, 0, '2016-11-21 11:54:05', '2016-11-21 11:54:05'),
(394, 15, 16, 1, 0, '2016-11-21 11:54:05', '2016-11-21 11:54:05'),
(395, 15, 17, 1, 0, '2016-11-21 11:54:05', '2016-11-21 11:54:05'),
(396, 15, 18, 1, 0, '2016-11-21 11:54:05', '2016-11-21 11:54:05'),
(397, 15, 19, 1, 0, '2016-11-21 11:54:05', '2016-11-21 11:54:05'),
(398, 15, 20, 1, 0, '2016-11-21 11:54:05', '2016-11-21 11:54:05'),
(399, 15, 21, 1, 0, '2016-11-21 11:54:05', '2016-11-21 11:54:05'),
(400, 15, 22, 1, 0, '2016-11-21 11:54:05', '2016-11-21 11:54:05'),
(401, 15, 3, 1, 0, '2016-11-21 11:54:05', '2016-11-21 11:54:05'),
(402, 15, 4, 1, 0, '2016-11-21 11:54:05', '2016-11-21 11:54:05'),
(403, 15, 5, 1, 0, '2016-11-21 11:54:05', '2016-11-21 11:54:05'),
(404, 15, 6, 1, 0, '2016-11-21 11:54:05', '2016-11-21 11:54:05'),
(405, 15, 7, 1, 0, '2016-11-21 11:54:05', '2016-11-21 11:54:05'),
(406, 15, 8, 1, 0, '2016-11-21 11:54:05', '2016-11-21 11:54:05'),
(407, 15, 9, 1, 0, '2016-11-21 11:54:05', '2016-11-21 11:54:05'),
(408, 15, 10, 1, 0, '2016-11-21 11:54:05', '2016-11-21 11:54:05'),
(409, 15, 11, 1, 0, '2016-11-21 11:54:05', '2016-11-21 11:54:05'),
(410, 15, 12, 1, 0, '2016-11-21 11:54:05', '2016-11-21 11:54:05'),
(411, 15, 24, 1, 0, '2016-11-21 11:54:05', '2016-11-21 11:54:05'),
(412, 15, 25, 1, 0, '2016-11-21 11:54:05', '2016-11-21 11:54:05'),
(413, 15, 26, 1, 0, '2016-11-21 11:54:05', '2016-11-21 11:54:05'),
(414, 15, 27, 1, 0, '2016-11-21 11:54:05', '2016-11-21 11:54:05'),
(415, 15, 28, 1, 0, '2016-11-21 11:54:05', '2016-11-21 11:54:05'),
(416, 15, 29, 1, 0, '2016-11-21 11:54:05', '2016-11-21 11:54:05'),
(417, 15, 30, 1, 0, '2016-11-21 11:54:05', '2016-11-21 11:54:05'),
(418, 15, 31, 1, 0, '2016-11-21 11:54:05', '2016-11-21 11:54:05'),
(419, 15, 32, 1, 0, '2016-11-21 11:54:05', '2016-11-21 11:54:05'),
(420, 15, 33, 1, 0, '2016-11-21 11:54:05', '2016-11-21 11:54:05'),
(421, 15, 38, 1, 0, '2016-11-21 11:54:05', '2016-11-21 11:54:05'),
(422, 15, 43, 1, 0, '2016-11-21 11:54:05', '2016-11-21 11:54:05'),
(423, 15, 44, 1, 0, '2016-11-21 11:54:05', '2016-11-21 11:54:05'),
(424, 15, 48, 1, 0, '2016-11-21 11:54:05', '2016-11-21 11:54:05'),
(425, 15, 50, 1, 0, '2016-11-21 11:54:05', '2016-11-21 11:54:05'),
(426, 15, 55, 1, 0, '2016-11-21 11:54:05', '2016-11-21 11:54:05'),
(427, 15, 56, 1, 0, '2016-11-21 11:54:05', '2016-11-21 11:54:05'),
(428, 15, 58, 1, 0, '2016-11-21 11:54:05', '2016-11-21 11:54:05'),
(429, 15, 59, 1, 0, '2016-11-21 11:54:05', '2016-11-21 11:54:05'),
(430, 15, 60, 1, 0, '2016-11-21 11:54:05', '2016-11-21 11:54:05'),
(466, 42, 13, 1, 0, '2016-11-21 11:56:01', '2016-11-21 11:56:01'),
(467, 42, 14, 1, 0, '2016-11-21 11:56:01', '2016-11-21 11:56:01'),
(468, 42, 15, 1, 0, '2016-11-21 11:56:01', '2016-11-21 11:56:01'),
(469, 42, 16, 1, 0, '2016-11-21 11:56:01', '2016-11-21 11:56:01'),
(470, 42, 17, 1, 0, '2016-11-21 11:56:01', '2016-11-21 11:56:01'),
(471, 42, 18, 1, 0, '2016-11-21 11:56:01', '2016-11-21 11:56:01'),
(472, 42, 19, 1, 0, '2016-11-21 11:56:01', '2016-11-21 11:56:01'),
(473, 42, 20, 1, 0, '2016-11-21 11:56:01', '2016-11-21 11:56:01'),
(474, 42, 21, 1, 0, '2016-11-21 11:56:01', '2016-11-21 11:56:01'),
(475, 42, 22, 1, 0, '2016-11-21 11:56:01', '2016-11-21 11:56:01'),
(476, 42, 3, 1, 0, '2016-11-21 11:56:01', '2016-11-21 11:56:01'),
(477, 42, 4, 1, 0, '2016-11-21 11:56:01', '2016-11-21 11:56:01'),
(478, 42, 5, 1, 0, '2016-11-21 11:56:01', '2016-11-21 11:56:01'),
(479, 42, 6, 1, 0, '2016-11-21 11:56:01', '2016-11-21 11:56:01'),
(480, 42, 7, 1, 0, '2016-11-21 11:56:01', '2016-11-21 11:56:01'),
(481, 42, 8, 1, 0, '2016-11-21 11:56:01', '2016-11-21 11:56:01'),
(482, 42, 9, 1, 0, '2016-11-21 11:56:01', '2016-11-21 11:56:01'),
(483, 42, 10, 1, 0, '2016-11-21 11:56:01', '2016-11-21 11:56:01'),
(484, 42, 11, 1, 0, '2016-11-21 11:56:01', '2016-11-21 11:56:01'),
(485, 42, 12, 1, 0, '2016-11-21 11:56:01', '2016-11-21 11:56:01'),
(486, 42, 24, 1, 0, '2016-11-21 11:56:01', '2016-11-21 11:56:01'),
(487, 42, 25, 1, 0, '2016-11-21 11:56:01', '2016-11-21 11:56:01'),
(488, 42, 26, 1, 0, '2016-11-21 11:56:01', '2016-11-21 11:56:01'),
(489, 42, 27, 1, 0, '2016-11-21 11:56:01', '2016-11-21 11:56:01'),
(490, 42, 28, 1, 0, '2016-11-21 11:56:01', '2016-11-21 11:56:01'),
(491, 42, 29, 1, 0, '2016-11-21 11:56:01', '2016-11-21 11:56:01'),
(492, 42, 30, 1, 0, '2016-11-21 11:56:01', '2016-11-21 11:56:01'),
(493, 42, 31, 1, 0, '2016-11-21 11:56:01', '2016-11-21 11:56:01'),
(494, 42, 32, 1, 0, '2016-11-21 11:56:01', '2016-11-21 11:56:01'),
(495, 42, 33, 1, 0, '2016-11-21 11:56:01', '2016-11-21 11:56:01'),
(496, 43, 13, 1, 0, '2016-11-21 11:57:08', '2016-11-21 11:57:08'),
(497, 43, 14, 1, 0, '2016-11-21 11:57:08', '2016-11-21 11:57:08'),
(498, 43, 15, 1, 0, '2016-11-21 11:57:08', '2016-11-21 11:57:08'),
(499, 43, 16, 1, 0, '2016-11-21 11:57:08', '2016-11-21 11:57:08'),
(500, 43, 17, 1, 0, '2016-11-21 11:57:08', '2016-11-21 11:57:08'),
(501, 43, 18, 1, 0, '2016-11-21 11:57:08', '2016-11-21 11:57:08'),
(502, 43, 19, 1, 0, '2016-11-21 11:57:08', '2016-11-21 11:57:08'),
(503, 43, 20, 1, 0, '2016-11-21 11:57:08', '2016-11-21 11:57:08'),
(504, 43, 21, 1, 0, '2016-11-21 11:57:08', '2016-11-21 11:57:08'),
(505, 43, 22, 1, 0, '2016-11-21 11:57:08', '2016-11-21 11:57:08'),
(506, 43, 3, 1, 0, '2016-11-21 11:57:08', '2016-11-21 11:57:08'),
(507, 43, 4, 1, 0, '2016-11-21 11:57:08', '2016-11-21 11:57:08'),
(508, 43, 5, 1, 0, '2016-11-21 11:57:08', '2016-11-21 11:57:08'),
(509, 43, 6, 1, 0, '2016-11-21 11:57:08', '2016-11-21 11:57:08'),
(510, 43, 7, 1, 0, '2016-11-21 11:57:08', '2016-11-21 11:57:08'),
(511, 43, 8, 1, 0, '2016-11-21 11:57:08', '2016-11-21 11:57:08'),
(512, 43, 9, 1, 0, '2016-11-21 11:57:08', '2016-11-21 11:57:08'),
(513, 43, 10, 1, 0, '2016-11-21 11:57:08', '2016-11-21 11:57:08'),
(514, 43, 11, 1, 0, '2016-11-21 11:57:08', '2016-11-21 11:57:08'),
(515, 43, 12, 1, 0, '2016-11-21 11:57:08', '2016-11-21 11:57:08'),
(516, 43, 24, 1, 0, '2016-11-21 11:57:08', '2016-11-21 11:57:08'),
(517, 43, 25, 1, 0, '2016-11-21 11:57:08', '2016-11-21 11:57:08'),
(518, 43, 26, 1, 0, '2016-11-21 11:57:08', '2016-11-21 11:57:08'),
(519, 43, 27, 1, 0, '2016-11-21 11:57:08', '2016-11-21 11:57:08'),
(520, 43, 28, 1, 0, '2016-11-21 11:57:08', '2016-11-21 11:57:08'),
(521, 43, 29, 1, 0, '2016-11-21 11:57:08', '2016-11-21 11:57:08'),
(522, 43, 30, 1, 0, '2016-11-21 11:57:08', '2016-11-21 11:57:08'),
(523, 43, 31, 1, 0, '2016-11-21 11:57:08', '2016-11-21 11:57:08'),
(524, 43, 32, 1, 0, '2016-11-21 11:57:08', '2016-11-21 11:57:08'),
(525, 43, 33, 1, 0, '2016-11-21 11:57:08', '2016-11-21 11:57:08'),
(526, 44, 13, 1, 0, '2016-11-21 11:58:15', '2016-11-21 11:58:15'),
(527, 44, 14, 1, 0, '2016-11-21 11:58:15', '2016-11-21 11:58:15'),
(528, 44, 15, 1, 0, '2016-11-21 11:58:15', '2016-11-21 11:58:15'),
(529, 44, 16, 1, 0, '2016-11-21 11:58:15', '2016-11-21 11:58:15'),
(530, 44, 17, 1, 0, '2016-11-21 11:58:15', '2016-11-21 11:58:15'),
(531, 44, 18, 1, 0, '2016-11-21 11:58:15', '2016-11-21 11:58:15'),
(532, 44, 19, 1, 0, '2016-11-21 11:58:15', '2016-11-21 11:58:15'),
(533, 44, 20, 1, 0, '2016-11-21 11:58:15', '2016-11-21 11:58:15'),
(534, 44, 21, 1, 0, '2016-11-21 11:58:15', '2016-11-21 11:58:15'),
(535, 44, 3, 1, 0, '2016-11-21 11:58:15', '2016-11-21 11:58:15'),
(536, 44, 4, 1, 0, '2016-11-21 11:58:15', '2016-11-21 11:58:15'),
(537, 44, 5, 1, 0, '2016-11-21 11:58:15', '2016-11-21 11:58:15'),
(538, 44, 6, 1, 0, '2016-11-21 11:58:15', '2016-11-21 11:58:15'),
(539, 44, 7, 1, 0, '2016-11-21 11:58:15', '2016-11-21 11:58:15'),
(540, 44, 8, 1, 0, '2016-11-21 11:58:15', '2016-11-21 11:58:15'),
(541, 44, 9, 1, 0, '2016-11-21 11:58:15', '2016-11-21 11:58:15'),
(542, 44, 10, 1, 0, '2016-11-21 11:58:15', '2016-11-21 11:58:15'),
(543, 44, 11, 1, 0, '2016-11-21 11:58:15', '2016-11-21 11:58:15'),
(544, 44, 12, 1, 0, '2016-11-21 11:58:15', '2016-11-21 11:58:15'),
(545, 44, 24, 1, 0, '2016-11-21 11:58:15', '2016-11-21 11:58:15'),
(546, 44, 25, 1, 0, '2016-11-21 11:58:15', '2016-11-21 11:58:15'),
(547, 44, 26, 1, 0, '2016-11-21 11:58:15', '2016-11-21 11:58:15'),
(548, 44, 27, 1, 0, '2016-11-21 11:58:15', '2016-11-21 11:58:15'),
(549, 44, 28, 1, 0, '2016-11-21 11:58:15', '2016-11-21 11:58:15'),
(550, 44, 29, 1, 0, '2016-11-21 11:58:15', '2016-11-21 11:58:15'),
(551, 44, 30, 1, 0, '2016-11-21 11:58:15', '2016-11-21 11:58:15'),
(552, 44, 31, 1, 0, '2016-11-21 11:58:15', '2016-11-21 11:58:15'),
(553, 44, 32, 1, 0, '2016-11-21 11:58:15', '2016-11-21 11:58:15'),
(554, 44, 33, 1, 0, '2016-11-21 11:58:15', '2016-11-21 11:58:15'),
(555, 44, 111, 1, 0, '2016-11-21 11:58:15', '2016-11-21 11:58:15'),
(556, 45, 13, 1, 0, '2016-11-21 11:59:12', '2016-11-21 11:59:12'),
(557, 45, 14, 1, 0, '2016-11-21 11:59:12', '2016-11-21 11:59:12'),
(558, 45, 15, 1, 0, '2016-11-21 11:59:12', '2016-11-21 11:59:12'),
(559, 45, 16, 1, 0, '2016-11-21 11:59:12', '2016-11-21 11:59:12'),
(560, 45, 18, 1, 0, '2016-11-21 11:59:12', '2016-11-21 11:59:12'),
(561, 45, 19, 1, 0, '2016-11-21 11:59:12', '2016-11-21 11:59:12'),
(562, 45, 20, 1, 0, '2016-11-21 11:59:12', '2016-11-21 11:59:12'),
(563, 45, 21, 1, 0, '2016-11-21 11:59:12', '2016-11-21 11:59:12'),
(564, 45, 22, 1, 0, '2016-11-21 11:59:12', '2016-11-21 11:59:12'),
(565, 45, 3, 1, 0, '2016-11-21 11:59:12', '2016-11-21 11:59:12'),
(566, 45, 4, 1, 0, '2016-11-21 11:59:12', '2016-11-21 11:59:12'),
(567, 45, 5, 1, 0, '2016-11-21 11:59:12', '2016-11-21 11:59:12'),
(568, 45, 6, 1, 0, '2016-11-21 11:59:12', '2016-11-21 11:59:12'),
(569, 45, 7, 1, 0, '2016-11-21 11:59:12', '2016-11-21 11:59:12'),
(570, 45, 8, 1, 0, '2016-11-21 11:59:12', '2016-11-21 11:59:12'),
(571, 45, 9, 1, 0, '2016-11-21 11:59:12', '2016-11-21 11:59:12'),
(572, 45, 10, 1, 0, '2016-11-21 11:59:12', '2016-11-21 11:59:12'),
(573, 45, 11, 1, 0, '2016-11-21 11:59:12', '2016-11-21 11:59:12'),
(574, 45, 12, 1, 0, '2016-11-21 11:59:12', '2016-11-21 11:59:12'),
(575, 45, 24, 1, 0, '2016-11-21 11:59:12', '2016-11-21 11:59:12'),
(576, 45, 25, 1, 0, '2016-11-21 11:59:12', '2016-11-21 11:59:12'),
(577, 45, 26, 1, 0, '2016-11-21 11:59:12', '2016-11-21 11:59:12'),
(578, 45, 27, 1, 0, '2016-11-21 11:59:12', '2016-11-21 11:59:12'),
(579, 45, 28, 1, 0, '2016-11-21 11:59:12', '2016-11-21 11:59:12'),
(580, 45, 30, 1, 0, '2016-11-21 11:59:12', '2016-11-21 11:59:12'),
(581, 45, 31, 1, 0, '2016-11-21 11:59:12', '2016-11-21 11:59:12'),
(582, 45, 32, 1, 0, '2016-11-21 11:59:12', '2016-11-21 11:59:12'),
(583, 45, 33, 1, 0, '2016-11-21 11:59:12', '2016-11-21 11:59:12'),
(584, 45, 35, 1, 0, '2016-11-21 11:59:12', '2016-11-21 11:59:12'),
(585, 45, 37, 1, 0, '2016-11-21 11:59:12', '2016-11-21 11:59:12'),
(586, 46, 13, 1, 0, '2016-11-21 12:01:14', '2016-11-21 12:01:14'),
(587, 46, 14, 1, 0, '2016-11-21 12:01:14', '2016-11-21 12:01:14'),
(588, 46, 15, 1, 0, '2016-11-21 12:01:14', '2016-11-21 12:01:14'),
(589, 46, 17, 1, 0, '2016-11-21 12:01:14', '2016-11-21 12:01:14'),
(590, 46, 18, 1, 0, '2016-11-21 12:01:14', '2016-11-21 12:01:14'),
(591, 46, 19, 1, 0, '2016-11-21 12:01:14', '2016-11-21 12:01:14'),
(592, 46, 21, 1, 0, '2016-11-21 12:01:14', '2016-11-21 12:01:14'),
(593, 46, 3, 1, 0, '2016-11-21 12:01:14', '2016-11-21 12:01:14'),
(594, 46, 4, 1, 0, '2016-11-21 12:01:14', '2016-11-21 12:01:14'),
(595, 46, 5, 1, 0, '2016-11-21 12:01:14', '2016-11-21 12:01:14'),
(596, 46, 6, 1, 0, '2016-11-21 12:01:14', '2016-11-21 12:01:14'),
(597, 46, 7, 1, 0, '2016-11-21 12:01:14', '2016-11-21 12:01:14'),
(598, 46, 8, 1, 0, '2016-11-21 12:01:14', '2016-11-21 12:01:14'),
(599, 46, 9, 1, 0, '2016-11-21 12:01:14', '2016-11-21 12:01:14'),
(600, 46, 10, 1, 0, '2016-11-21 12:01:14', '2016-11-21 12:01:14'),
(601, 46, 11, 1, 0, '2016-11-21 12:01:14', '2016-11-21 12:01:14'),
(602, 46, 12, 1, 0, '2016-11-21 12:01:14', '2016-11-21 12:01:14'),
(603, 46, 24, 1, 0, '2016-11-21 12:01:14', '2016-11-21 12:01:14'),
(604, 46, 25, 1, 0, '2016-11-21 12:01:14', '2016-11-21 12:01:14'),
(605, 46, 26, 1, 0, '2016-11-21 12:01:14', '2016-11-21 12:01:14'),
(606, 46, 27, 1, 0, '2016-11-21 12:01:14', '2016-11-21 12:01:14'),
(607, 46, 28, 1, 0, '2016-11-21 12:01:14', '2016-11-21 12:01:14'),
(608, 46, 29, 1, 0, '2016-11-21 12:01:14', '2016-11-21 12:01:14'),
(609, 46, 30, 1, 0, '2016-11-21 12:01:14', '2016-11-21 12:01:14'),
(610, 46, 31, 1, 0, '2016-11-21 12:01:14', '2016-11-21 12:01:14'),
(611, 46, 32, 1, 0, '2016-11-21 12:01:14', '2016-11-21 12:01:14'),
(612, 46, 47, 1, 0, '2016-11-21 12:01:14', '2016-11-21 12:01:14'),
(613, 46, 48, 1, 0, '2016-11-21 12:01:14', '2016-11-21 12:01:14'),
(614, 47, 13, 1, 0, '2016-11-21 12:04:24', '2016-11-21 12:04:24'),
(615, 47, 14, 1, 0, '2016-11-21 12:04:24', '2016-11-21 12:04:24'),
(616, 47, 15, 1, 0, '2016-11-21 12:04:24', '2016-11-21 12:04:24'),
(617, 47, 16, 1, 0, '2016-11-21 12:04:24', '2016-11-21 12:04:24'),
(618, 47, 17, 1, 0, '2016-11-21 12:04:24', '2016-11-21 12:04:24'),
(619, 47, 18, 1, 0, '2016-11-21 12:04:24', '2016-11-21 12:04:24'),
(620, 47, 19, 1, 0, '2016-11-21 12:04:24', '2016-11-21 12:04:24'),
(621, 47, 20, 1, 0, '2016-11-21 12:04:24', '2016-11-21 12:04:24'),
(622, 47, 21, 1, 0, '2016-11-21 12:04:24', '2016-11-21 12:04:24'),
(623, 47, 22, 1, 0, '2016-11-21 12:04:24', '2016-11-21 12:04:24'),
(624, 47, 3, 1, 0, '2016-11-21 12:04:24', '2016-11-21 12:04:24'),
(625, 47, 4, 1, 0, '2016-11-21 12:04:24', '2016-11-21 12:04:24'),
(626, 47, 5, 1, 0, '2016-11-21 12:04:24', '2016-11-21 12:04:24'),
(627, 47, 6, 1, 0, '2016-11-21 12:04:24', '2016-11-21 12:04:24'),
(628, 47, 7, 1, 0, '2016-11-21 12:04:24', '2016-11-21 12:04:24'),
(629, 47, 8, 1, 0, '2016-11-21 12:04:24', '2016-11-21 12:04:24'),
(630, 47, 9, 1, 0, '2016-11-21 12:04:24', '2016-11-21 12:04:24'),
(631, 47, 10, 1, 0, '2016-11-21 12:04:24', '2016-11-21 12:04:24'),
(632, 47, 11, 1, 0, '2016-11-21 12:04:24', '2016-11-21 12:04:24'),
(633, 47, 12, 1, 0, '2016-11-21 12:04:24', '2016-11-21 12:04:24'),
(634, 47, 24, 1, 0, '2016-11-21 12:04:24', '2016-11-21 12:04:24'),
(635, 47, 25, 1, 0, '2016-11-21 12:04:24', '2016-11-21 12:04:24'),
(636, 47, 26, 1, 0, '2016-11-21 12:04:24', '2016-11-21 12:04:24'),
(637, 47, 27, 1, 0, '2016-11-21 12:04:24', '2016-11-21 12:04:24'),
(638, 47, 28, 1, 0, '2016-11-21 12:04:24', '2016-11-21 12:04:24'),
(639, 47, 29, 1, 0, '2016-11-21 12:04:24', '2016-11-21 12:04:24'),
(640, 47, 30, 1, 0, '2016-11-21 12:04:24', '2016-11-21 12:04:24'),
(641, 47, 31, 1, 0, '2016-11-21 12:04:24', '2016-11-21 12:04:24'),
(642, 47, 32, 1, 0, '2016-11-21 12:04:24', '2016-11-21 12:04:24'),
(643, 47, 33, 1, 0, '2016-11-21 12:04:24', '2016-11-21 12:04:24'),
(644, 48, 13, 1, 0, '2016-11-21 12:05:26', '2016-11-21 12:05:26'),
(645, 48, 14, 1, 0, '2016-11-21 12:05:26', '2016-11-21 12:05:26'),
(646, 48, 15, 1, 0, '2016-11-21 12:05:26', '2016-11-21 12:05:26'),
(647, 48, 16, 1, 0, '2016-11-21 12:05:26', '2016-11-21 12:05:26'),
(648, 48, 17, 1, 0, '2016-11-21 12:05:26', '2016-11-21 12:05:26'),
(649, 48, 18, 1, 0, '2016-11-21 12:05:26', '2016-11-21 12:05:26'),
(650, 48, 19, 1, 0, '2016-11-21 12:05:26', '2016-11-21 12:05:26'),
(651, 48, 20, 1, 0, '2016-11-21 12:05:26', '2016-11-21 12:05:26'),
(652, 48, 21, 1, 0, '2016-11-21 12:05:26', '2016-11-21 12:05:26'),
(653, 48, 22, 1, 0, '2016-11-21 12:05:26', '2016-11-21 12:05:26'),
(654, 48, 3, 1, 0, '2016-11-21 12:05:26', '2016-11-21 12:05:26'),
(655, 48, 4, 1, 0, '2016-11-21 12:05:26', '2016-11-21 12:05:26'),
(656, 48, 5, 1, 0, '2016-11-21 12:05:26', '2016-11-21 12:05:26'),
(657, 48, 6, 1, 0, '2016-11-21 12:05:26', '2016-11-21 12:05:26'),
(658, 48, 7, 1, 0, '2016-11-21 12:05:26', '2016-11-21 12:05:26'),
(659, 48, 8, 1, 0, '2016-11-21 12:05:26', '2016-11-21 12:05:26'),
(660, 48, 9, 1, 0, '2016-11-21 12:05:26', '2016-11-21 12:05:26'),
(661, 48, 10, 1, 0, '2016-11-21 12:05:26', '2016-11-21 12:05:26'),
(662, 48, 11, 1, 0, '2016-11-21 12:05:26', '2016-11-21 12:05:26'),
(663, 48, 12, 1, 0, '2016-11-21 12:05:26', '2016-11-21 12:05:26'),
(664, 48, 24, 1, 0, '2016-11-21 12:05:26', '2016-11-21 12:05:26'),
(665, 48, 26, 1, 0, '2016-11-21 12:05:26', '2016-11-21 12:05:26'),
(666, 48, 27, 1, 0, '2016-11-21 12:05:26', '2016-11-21 12:05:26'),
(667, 48, 28, 1, 0, '2016-11-21 12:05:26', '2016-11-21 12:05:26'),
(668, 48, 29, 1, 0, '2016-11-21 12:05:26', '2016-11-21 12:05:26'),
(669, 48, 30, 1, 0, '2016-11-21 12:05:26', '2016-11-21 12:05:26'),
(670, 48, 31, 1, 0, '2016-11-21 12:05:26', '2016-11-21 12:05:26'),
(671, 48, 32, 1, 0, '2016-11-21 12:05:26', '2016-11-21 12:05:26'),
(672, 48, 33, 1, 0, '2016-11-21 12:05:26', '2016-11-21 12:05:26'),
(673, 49, 13, 1, 0, '2016-11-21 12:06:36', '2016-11-21 12:06:36'),
(674, 49, 14, 1, 0, '2016-11-21 12:06:36', '2016-11-21 12:06:36'),
(675, 49, 15, 1, 0, '2016-11-21 12:06:36', '2016-11-21 12:06:36'),
(676, 49, 16, 1, 0, '2016-11-21 12:06:36', '2016-11-21 12:06:36'),
(677, 49, 17, 1, 0, '2016-11-21 12:06:36', '2016-11-21 12:06:36'),
(678, 49, 18, 1, 0, '2016-11-21 12:06:36', '2016-11-21 12:06:36'),
(679, 49, 19, 1, 0, '2016-11-21 12:06:36', '2016-11-21 12:06:36'),
(680, 49, 20, 1, 0, '2016-11-21 12:06:36', '2016-11-21 12:06:36'),
(681, 49, 21, 1, 0, '2016-11-21 12:06:36', '2016-11-21 12:06:36'),
(682, 49, 22, 1, 0, '2016-11-21 12:06:36', '2016-11-21 12:06:36'),
(683, 49, 3, 1, 0, '2016-11-21 12:06:36', '2016-11-21 12:06:36'),
(684, 49, 4, 1, 0, '2016-11-21 12:06:36', '2016-11-21 12:06:36'),
(685, 49, 5, 1, 0, '2016-11-21 12:06:36', '2016-11-21 12:06:36'),
(686, 49, 6, 1, 0, '2016-11-21 12:06:36', '2016-11-21 12:06:36'),
(687, 49, 7, 1, 0, '2016-11-21 12:06:36', '2016-11-21 12:06:36'),
(688, 49, 8, 1, 0, '2016-11-21 12:06:36', '2016-11-21 12:06:36'),
(689, 49, 9, 1, 0, '2016-11-21 12:06:36', '2016-11-21 12:06:36'),
(690, 49, 10, 1, 0, '2016-11-21 12:06:36', '2016-11-21 12:06:36'),
(691, 49, 11, 1, 0, '2016-11-21 12:06:36', '2016-11-21 12:06:36'),
(692, 49, 12, 1, 0, '2016-11-21 12:06:36', '2016-11-21 12:06:36'),
(693, 49, 24, 1, 0, '2016-11-21 12:06:36', '2016-11-21 12:06:36'),
(694, 49, 25, 1, 0, '2016-11-21 12:06:36', '2016-11-21 12:06:36'),
(695, 49, 26, 1, 0, '2016-11-21 12:06:36', '2016-11-21 12:06:36'),
(696, 49, 27, 1, 0, '2016-11-21 12:06:36', '2016-11-21 12:06:36'),
(697, 49, 28, 1, 0, '2016-11-21 12:06:36', '2016-11-21 12:06:36'),
(698, 49, 29, 1, 0, '2016-11-21 12:06:36', '2016-11-21 12:06:36'),
(699, 49, 30, 1, 0, '2016-11-21 12:06:36', '2016-11-21 12:06:36'),
(700, 49, 31, 1, 0, '2016-11-21 12:06:36', '2016-11-21 12:06:36'),
(701, 49, 33, 1, 0, '2016-11-21 12:06:36', '2016-11-21 12:06:36'),
(702, 50, 13, 1, 0, '2016-11-21 12:07:32', '2016-11-21 12:07:32'),
(703, 50, 14, 1, 0, '2016-11-21 12:07:32', '2016-11-21 12:07:32'),
(704, 50, 15, 1, 0, '2016-11-21 12:07:32', '2016-11-21 12:07:32'),
(705, 50, 16, 1, 0, '2016-11-21 12:07:32', '2016-11-21 12:07:32'),
(706, 50, 17, 1, 0, '2016-11-21 12:07:32', '2016-11-21 12:07:32'),
(707, 50, 18, 1, 0, '2016-11-21 12:07:32', '2016-11-21 12:07:32'),
(708, 50, 19, 1, 0, '2016-11-21 12:07:32', '2016-11-21 12:07:32'),
(709, 50, 20, 1, 0, '2016-11-21 12:07:32', '2016-11-21 12:07:32'),
(710, 50, 22, 1, 0, '2016-11-21 12:07:32', '2016-11-21 12:07:32'),
(711, 50, 3, 1, 0, '2016-11-21 12:07:32', '2016-11-21 12:07:32'),
(712, 50, 4, 1, 0, '2016-11-21 12:07:32', '2016-11-21 12:07:32'),
(713, 50, 5, 1, 0, '2016-11-21 12:07:32', '2016-11-21 12:07:32'),
(714, 50, 6, 1, 0, '2016-11-21 12:07:32', '2016-11-21 12:07:32'),
(715, 50, 7, 1, 0, '2016-11-21 12:07:32', '2016-11-21 12:07:32'),
(716, 50, 8, 1, 0, '2016-11-21 12:07:32', '2016-11-21 12:07:32'),
(717, 50, 9, 1, 0, '2016-11-21 12:07:32', '2016-11-21 12:07:32'),
(718, 50, 10, 1, 0, '2016-11-21 12:07:32', '2016-11-21 12:07:32'),
(719, 50, 11, 1, 0, '2016-11-21 12:07:32', '2016-11-21 12:07:32'),
(720, 50, 24, 1, 0, '2016-11-21 12:07:32', '2016-11-21 12:07:32'),
(721, 50, 25, 1, 0, '2016-11-21 12:07:32', '2016-11-21 12:07:32'),
(722, 50, 26, 1, 0, '2016-11-21 12:07:32', '2016-11-21 12:07:32'),
(723, 50, 27, 1, 0, '2016-11-21 12:07:32', '2016-11-21 12:07:32'),
(724, 50, 28, 1, 0, '2016-11-21 12:07:32', '2016-11-21 12:07:32'),
(725, 50, 29, 1, 0, '2016-11-21 12:07:32', '2016-11-21 12:07:32'),
(726, 50, 30, 1, 0, '2016-11-21 12:07:32', '2016-11-21 12:07:32'),
(727, 50, 31, 1, 0, '2016-11-21 12:07:32', '2016-11-21 12:07:32'),
(728, 50, 32, 1, 0, '2016-11-21 12:07:32', '2016-11-21 12:07:32'),
(729, 50, 33, 1, 0, '2016-11-21 12:07:32', '2016-11-21 12:07:32'),
(730, 50, 102, 1, 0, '2016-11-21 12:07:32', '2016-11-21 12:07:32'),
(731, 50, 104, 1, 0, '2016-11-21 12:07:32', '2016-11-21 12:07:32'),
(732, 51, 13, 1, 0, '2016-11-21 12:08:47', '2016-11-21 12:08:47'),
(733, 51, 14, 1, 0, '2016-11-21 12:08:47', '2016-11-21 12:08:47'),
(734, 51, 15, 1, 0, '2016-11-21 12:08:47', '2016-11-21 12:08:47'),
(735, 51, 16, 1, 0, '2016-11-21 12:08:47', '2016-11-21 12:08:47'),
(736, 51, 17, 1, 0, '2016-11-21 12:08:47', '2016-11-21 12:08:47'),
(737, 51, 18, 1, 0, '2016-11-21 12:08:47', '2016-11-21 12:08:47'),
(738, 51, 19, 1, 0, '2016-11-21 12:08:47', '2016-11-21 12:08:47'),
(739, 51, 22, 1, 0, '2016-11-21 12:08:47', '2016-11-21 12:08:47'),
(740, 51, 3, 1, 0, '2016-11-21 12:08:47', '2016-11-21 12:08:47'),
(741, 51, 4, 1, 0, '2016-11-21 12:08:47', '2016-11-21 12:08:47'),
(742, 51, 5, 1, 0, '2016-11-21 12:08:47', '2016-11-21 12:08:47'),
(743, 51, 6, 1, 0, '2016-11-21 12:08:47', '2016-11-21 12:08:47'),
(744, 51, 7, 1, 0, '2016-11-21 12:08:47', '2016-11-21 12:08:47'),
(745, 51, 8, 1, 0, '2016-11-21 12:08:47', '2016-11-21 12:08:47'),
(746, 51, 9, 1, 0, '2016-11-21 12:08:47', '2016-11-21 12:08:47'),
(747, 51, 10, 1, 0, '2016-11-21 12:08:47', '2016-11-21 12:08:47'),
(748, 51, 11, 1, 0, '2016-11-21 12:08:47', '2016-11-21 12:08:47'),
(749, 51, 12, 1, 0, '2016-11-21 12:08:47', '2016-11-21 12:08:47'),
(750, 51, 24, 1, 0, '2016-11-21 12:08:47', '2016-11-21 12:08:47'),
(751, 51, 25, 1, 0, '2016-11-21 12:08:47', '2016-11-21 12:08:47'),
(752, 51, 26, 1, 0, '2016-11-21 12:08:47', '2016-11-21 12:08:47'),
(753, 51, 27, 1, 0, '2016-11-21 12:08:47', '2016-11-21 12:08:47'),
(754, 51, 28, 1, 0, '2016-11-21 12:08:47', '2016-11-21 12:08:47'),
(755, 51, 29, 1, 0, '2016-11-21 12:08:47', '2016-11-21 12:08:47'),
(756, 51, 30, 1, 0, '2016-11-21 12:08:47', '2016-11-21 12:08:47'),
(757, 51, 31, 1, 0, '2016-11-21 12:08:47', '2016-11-21 12:08:47'),
(758, 51, 32, 1, 0, '2016-11-21 12:08:47', '2016-11-21 12:08:47'),
(759, 51, 33, 1, 0, '2016-11-21 12:08:47', '2016-11-21 12:08:47'),
(760, 51, 71, 1, 0, '2016-11-21 12:08:47', '2016-11-21 12:08:47'),
(761, 51, 73, 1, 0, '2016-11-21 12:08:47', '2016-11-21 12:08:47'),
(762, 86, 13, 1, 0, '2016-11-21 12:11:46', '2016-11-21 12:11:46'),
(763, 86, 14, 1, 0, '2016-11-21 12:11:46', '2016-11-21 12:11:46'),
(764, 86, 15, 1, 0, '2016-11-21 12:11:46', '2016-11-21 12:11:46'),
(765, 86, 16, 1, 0, '2016-11-21 12:11:46', '2016-11-21 12:11:46'),
(766, 86, 17, 1, 0, '2016-11-21 12:11:46', '2016-11-21 12:11:46'),
(767, 86, 18, 1, 0, '2016-11-21 12:11:46', '2016-11-21 12:11:46'),
(768, 86, 19, 1, 0, '2016-11-21 12:11:46', '2016-11-21 12:11:46'),
(769, 86, 20, 1, 0, '2016-11-21 12:11:46', '2016-11-21 12:11:46'),
(770, 86, 22, 1, 0, '2016-11-21 12:11:46', '2016-11-21 12:11:46'),
(771, 86, 3, 1, 0, '2016-11-21 12:11:46', '2016-11-21 12:11:46'),
(772, 86, 4, 1, 0, '2016-11-21 12:11:46', '2016-11-21 12:11:46'),
(773, 86, 5, 1, 0, '2016-11-21 12:11:46', '2016-11-21 12:11:46'),
(774, 86, 6, 1, 0, '2016-11-21 12:11:46', '2016-11-21 12:11:46'),
(775, 86, 7, 1, 0, '2016-11-21 12:11:46', '2016-11-21 12:11:46'),
(776, 86, 8, 1, 0, '2016-11-21 12:11:46', '2016-11-21 12:11:46'),
(777, 86, 9, 1, 0, '2016-11-21 12:11:46', '2016-11-21 12:11:46'),
(778, 86, 10, 1, 0, '2016-11-21 12:11:46', '2016-11-21 12:11:46'),
(779, 86, 11, 1, 0, '2016-11-21 12:11:46', '2016-11-21 12:11:46'),
(780, 86, 12, 1, 0, '2016-11-21 12:11:46', '2016-11-21 12:11:46'),
(781, 86, 24, 1, 0, '2016-11-21 12:11:46', '2016-11-21 12:11:46'),
(782, 86, 25, 1, 0, '2016-11-21 12:11:46', '2016-11-21 12:11:46'),
(783, 86, 26, 1, 0, '2016-11-21 12:11:46', '2016-11-21 12:11:46'),
(784, 86, 27, 1, 0, '2016-11-21 12:11:46', '2016-11-21 12:11:46'),
(785, 86, 28, 1, 0, '2016-11-21 12:11:46', '2016-11-21 12:11:46'),
(786, 86, 29, 1, 0, '2016-11-21 12:11:46', '2016-11-21 12:11:46'),
(787, 86, 30, 1, 0, '2016-11-21 12:11:46', '2016-11-21 12:11:46'),
(788, 86, 31, 1, 0, '2016-11-21 12:11:46', '2016-11-21 12:11:46'),
(789, 86, 32, 1, 0, '2016-11-21 12:11:46', '2016-11-21 12:11:46'),
(790, 86, 35, 1, 0, '2016-11-21 12:11:46', '2016-11-21 12:11:46'),
(791, 86, 36, 1, 0, '2016-11-21 12:11:46', '2016-11-21 12:11:46'),
(792, 86, 41, 1, 0, '2016-11-21 12:11:46', '2016-11-21 12:11:46'),
(793, 86, 42, 1, 0, '2016-11-21 12:11:46', '2016-11-21 12:11:46'),
(794, 87, 13, 1, 0, '2016-11-21 12:12:35', '2016-11-21 12:12:35'),
(795, 87, 14, 1, 0, '2016-11-21 12:12:35', '2016-11-21 12:12:35'),
(796, 87, 15, 1, 0, '2016-11-21 12:12:35', '2016-11-21 12:12:35'),
(797, 87, 16, 1, 0, '2016-11-21 12:12:35', '2016-11-21 12:12:35'),
(798, 87, 17, 1, 0, '2016-11-21 12:12:35', '2016-11-21 12:12:35'),
(799, 87, 18, 1, 0, '2016-11-21 12:12:35', '2016-11-21 12:12:35'),
(800, 87, 19, 1, 0, '2016-11-21 12:12:35', '2016-11-21 12:12:35'),
(801, 87, 21, 1, 0, '2016-11-21 12:12:35', '2016-11-21 12:12:35'),
(802, 87, 22, 1, 0, '2016-11-21 12:12:35', '2016-11-21 12:12:35'),
(803, 87, 3, 1, 0, '2016-11-21 12:12:35', '2016-11-21 12:12:35'),
(804, 87, 4, 1, 0, '2016-11-21 12:12:35', '2016-11-21 12:12:35'),
(805, 87, 5, 1, 0, '2016-11-21 12:12:35', '2016-11-21 12:12:35'),
(806, 87, 6, 1, 0, '2016-11-21 12:12:35', '2016-11-21 12:12:35'),
(807, 87, 7, 1, 0, '2016-11-21 12:12:35', '2016-11-21 12:12:35'),
(808, 87, 8, 1, 0, '2016-11-21 12:12:35', '2016-11-21 12:12:35'),
(809, 87, 9, 1, 0, '2016-11-21 12:12:35', '2016-11-21 12:12:35'),
(810, 87, 11, 1, 0, '2016-11-21 12:12:35', '2016-11-21 12:12:35'),
(811, 87, 12, 1, 0, '2016-11-21 12:12:35', '2016-11-21 12:12:35'),
(812, 87, 24, 1, 0, '2016-11-21 12:12:35', '2016-11-21 12:12:35'),
(813, 87, 25, 1, 0, '2016-11-21 12:12:35', '2016-11-21 12:12:35'),
(814, 87, 26, 1, 0, '2016-11-21 12:12:35', '2016-11-21 12:12:35'),
(815, 87, 27, 1, 0, '2016-11-21 12:12:35', '2016-11-21 12:12:35'),
(816, 87, 28, 1, 0, '2016-11-21 12:12:35', '2016-11-21 12:12:35'),
(817, 87, 29, 1, 0, '2016-11-21 12:12:35', '2016-11-21 12:12:35'),
(818, 87, 30, 1, 0, '2016-11-21 12:12:35', '2016-11-21 12:12:35'),
(819, 87, 31, 1, 0, '2016-11-21 12:12:35', '2016-11-21 12:12:35'),
(820, 87, 32, 1, 0, '2016-11-21 12:12:35', '2016-11-21 12:12:35'),
(821, 87, 33, 1, 0, '2016-11-21 12:12:35', '2016-11-21 12:12:35'),
(822, 87, 41, 1, 0, '2016-11-21 12:12:35', '2016-11-21 12:12:35'),
(823, 87, 42, 1, 0, '2016-11-21 12:12:35', '2016-11-21 12:12:35'),
(824, 87, 53, 1, 0, '2016-11-21 12:12:35', '2016-11-21 12:12:35'),
(825, 87, 54, 1, 0, '2016-11-21 12:12:35', '2016-11-21 12:12:35'),
(826, 88, 13, 1, 0, '2016-11-21 12:14:32', '2016-11-21 12:14:32'),
(827, 88, 14, 1, 0, '2016-11-21 12:14:32', '2016-11-21 12:14:32'),
(828, 88, 15, 1, 0, '2016-11-21 12:14:32', '2016-11-21 12:14:32'),
(829, 88, 16, 1, 0, '2016-11-21 12:14:32', '2016-11-21 12:14:32'),
(830, 88, 17, 1, 0, '2016-11-21 12:14:32', '2016-11-21 12:14:32'),
(831, 88, 18, 1, 0, '2016-11-21 12:14:32', '2016-11-21 12:14:32'),
(832, 88, 19, 1, 0, '2016-11-21 12:14:32', '2016-11-21 12:14:32'),
(833, 88, 20, 1, 0, '2016-11-21 12:14:32', '2016-11-21 12:14:32'),
(834, 88, 21, 1, 0, '2016-11-21 12:14:32', '2016-11-21 12:14:32'),
(835, 88, 22, 1, 0, '2016-11-21 12:14:32', '2016-11-21 12:14:32'),
(836, 88, 3, 1, 0, '2016-11-21 12:14:32', '2016-11-21 12:14:32'),
(837, 88, 4, 1, 0, '2016-11-21 12:14:32', '2016-11-21 12:14:32'),
(838, 88, 5, 1, 0, '2016-11-21 12:14:32', '2016-11-21 12:14:32'),
(839, 88, 6, 1, 0, '2016-11-21 12:14:32', '2016-11-21 12:14:32'),
(840, 88, 7, 1, 0, '2016-11-21 12:14:32', '2016-11-21 12:14:32'),
(841, 88, 8, 1, 0, '2016-11-21 12:14:32', '2016-11-21 12:14:32'),
(842, 88, 9, 1, 0, '2016-11-21 12:14:32', '2016-11-21 12:14:32'),
(843, 88, 10, 1, 0, '2016-11-21 12:14:32', '2016-11-21 12:14:32'),
(844, 88, 11, 1, 0, '2016-11-21 12:14:32', '2016-11-21 12:14:32'),
(845, 88, 12, 1, 0, '2016-11-21 12:14:32', '2016-11-21 12:14:32'),
(846, 88, 24, 1, 0, '2016-11-21 12:14:32', '2016-11-21 12:14:32'),
(847, 88, 25, 1, 0, '2016-11-21 12:14:32', '2016-11-21 12:14:32'),
(848, 88, 26, 1, 0, '2016-11-21 12:14:32', '2016-11-21 12:14:32'),
(849, 88, 27, 1, 0, '2016-11-21 12:14:32', '2016-11-21 12:14:32'),
(850, 88, 28, 1, 0, '2016-11-21 12:14:32', '2016-11-21 12:14:32'),
(851, 88, 29, 1, 0, '2016-11-21 12:14:32', '2016-11-21 12:14:32'),
(852, 88, 30, 1, 0, '2016-11-21 12:14:32', '2016-11-21 12:14:32'),
(853, 88, 31, 1, 0, '2016-11-21 12:14:32', '2016-11-21 12:14:32'),
(854, 88, 33, 1, 0, '2016-11-21 12:14:32', '2016-11-21 12:14:32'),
(855, 88, 36, 1, 0, '2016-11-21 12:14:32', '2016-11-21 12:14:32'),
(856, 88, 41, 1, 0, '2016-11-21 12:14:32', '2016-11-21 12:14:32'),
(857, 88, 42, 1, 0, '2016-11-21 12:14:32', '2016-11-21 12:14:32'),
(858, 88, 48, 1, 0, '2016-11-21 12:14:32', '2016-11-21 12:14:32'),
(859, 88, 50, 1, 0, '2016-11-21 12:14:32', '2016-11-21 12:14:32'),
(860, 88, 53, 1, 0, '2016-11-21 12:14:32', '2016-11-21 12:14:32'),
(861, 88, 58, 1, 0, '2016-11-21 12:14:32', '2016-11-21 12:14:32'),
(862, 88, 59, 1, 0, '2016-11-21 12:14:32', '2016-11-21 12:14:32'),
(863, 88, 71, 1, 0, '2016-11-21 12:14:32', '2016-11-21 12:14:32'),
(864, 88, 72, 1, 0, '2016-11-21 12:14:32', '2016-11-21 12:14:32'),
(865, 88, 77, 1, 0, '2016-11-21 12:14:32', '2016-11-21 12:14:32'),
(866, 88, 78, 1, 0, '2016-11-21 12:14:32', '2016-11-21 12:14:32'),
(867, 16, 13, 1, 0, '2016-11-21 15:23:27', '2016-11-21 15:23:27'),
(868, 16, 14, 1, 0, '2016-11-21 15:23:27', '2016-11-21 15:23:27'),
(869, 16, 15, 1, 0, '2016-11-21 15:23:27', '2016-11-21 15:23:27'),
(870, 16, 16, 1, 0, '2016-11-21 15:23:27', '2016-11-21 15:23:27'),
(871, 16, 17, 1, 0, '2016-11-21 15:23:27', '2016-11-21 15:23:27'),
(872, 16, 18, 1, 0, '2016-11-21 15:23:27', '2016-11-21 15:23:27'),
(873, 16, 19, 1, 0, '2016-11-21 15:23:27', '2016-11-21 15:23:27'),
(874, 16, 20, 1, 0, '2016-11-21 15:23:27', '2016-11-21 15:23:27'),
(875, 16, 21, 1, 0, '2016-11-21 15:23:27', '2016-11-21 15:23:27'),
(876, 16, 3, 1, 0, '2016-11-21 15:23:27', '2016-11-21 15:23:27'),
(877, 16, 4, 1, 0, '2016-11-21 15:23:27', '2016-11-21 15:23:27'),
(878, 16, 5, 1, 0, '2016-11-21 15:23:27', '2016-11-21 15:23:27'),
(879, 16, 6, 1, 0, '2016-11-21 15:23:27', '2016-11-21 15:23:27'),
(880, 16, 7, 1, 0, '2016-11-21 15:23:27', '2016-11-21 15:23:27'),
(881, 16, 8, 1, 0, '2016-11-21 15:23:27', '2016-11-21 15:23:27'),
(882, 16, 9, 1, 0, '2016-11-21 15:23:27', '2016-11-21 15:23:27'),
(883, 16, 10, 1, 0, '2016-11-21 15:23:27', '2016-11-21 15:23:27'),
(884, 16, 11, 1, 0, '2016-11-21 15:23:27', '2016-11-21 15:23:27'),
(885, 16, 12, 1, 0, '2016-11-21 15:23:27', '2016-11-21 15:23:27'),
(886, 16, 24, 1, 0, '2016-11-21 15:23:27', '2016-11-21 15:23:27'),
(887, 16, 25, 1, 0, '2016-11-21 15:23:27', '2016-11-21 15:23:27'),
(888, 16, 26, 1, 0, '2016-11-21 15:23:27', '2016-11-21 15:23:27'),
(889, 16, 27, 1, 0, '2016-11-21 15:23:27', '2016-11-21 15:23:27'),
(890, 16, 28, 1, 0, '2016-11-21 15:23:27', '2016-11-21 15:23:27'),
(891, 16, 29, 1, 0, '2016-11-21 15:23:27', '2016-11-21 15:23:27'),
(892, 16, 30, 1, 0, '2016-11-21 15:23:27', '2016-11-21 15:23:27'),
(893, 16, 31, 1, 0, '2016-11-21 15:23:27', '2016-11-21 15:23:27'),
(894, 16, 32, 1, 0, '2016-11-21 15:23:27', '2016-11-21 15:23:27'),
(895, 16, 33, 1, 0, '2016-11-21 15:23:27', '2016-11-21 15:23:27'),
(896, 16, 36, 1, 0, '2016-11-21 15:23:27', '2016-11-21 15:23:27'),
(897, 16, 38, 1, 0, '2016-11-21 15:23:27', '2016-11-21 15:23:27'),
(898, 16, 41, 1, 0, '2016-11-21 15:23:27', '2016-11-21 15:23:27'),
(899, 16, 42, 1, 0, '2016-11-21 15:23:27', '2016-11-21 15:23:27'),
(900, 16, 43, 1, 0, '2016-11-21 15:23:27', '2016-11-21 15:23:27'),
(901, 16, 44, 1, 0, '2016-11-21 15:23:27', '2016-11-21 15:23:27'),
(902, 16, 45, 1, 0, '2016-11-21 15:23:27', '2016-11-21 15:23:27');

-- --------------------------------------------------------

--
-- Table structure for table `pre_inst_offered_courses`
--

CREATE TABLE `pre_inst_offered_courses` (
  `id` int(11) NOT NULL,
  `inst_id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `sort_order` tinyint(5) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pre_inst_offered_courses`
--

INSERT INTO `pre_inst_offered_courses` (`id`, `inst_id`, `course_id`, `status`, `sort_order`, `created_at`, `updated_at`) VALUES
(962, 42, 13, 1, 0, '2016-11-21 19:02:19', '2016-11-21 19:02:19'),
(963, 42, 21, 1, 0, '2016-11-21 19:02:19', '2016-11-21 19:02:19'),
(964, 42, 15, 1, 0, '2016-11-21 19:02:19', '2016-11-21 19:02:19'),
(965, 42, 20, 1, 0, '2016-11-21 19:02:19', '2016-11-21 19:02:19'),
(966, 42, 14, 1, 0, '2016-11-21 19:02:19', '2016-11-21 19:02:19'),
(967, 42, 35, 1, 0, '2016-11-21 19:02:19', '2016-11-21 19:02:19'),
(968, 42, 37, 1, 0, '2016-11-21 19:02:19', '2016-11-21 19:02:19'),
(969, 42, 34, 1, 0, '2016-11-21 19:02:19', '2016-11-21 19:02:19'),
(970, 42, 31, 1, 0, '2016-11-21 19:02:19', '2016-11-21 19:02:19'),
(971, 42, 151, 1, 0, '2016-11-21 19:02:19', '2016-11-21 19:02:19'),
(972, 43, 13, 1, 0, '2016-11-21 19:02:57', '2016-11-21 19:02:57'),
(973, 43, 21, 1, 0, '2016-11-21 19:02:57', '2016-11-21 19:02:57'),
(974, 43, 15, 1, 0, '2016-11-21 19:02:57', '2016-11-21 19:02:57'),
(975, 43, 27, 1, 0, '2016-11-21 19:02:57', '2016-11-21 19:02:57'),
(976, 43, 20, 1, 0, '2016-11-21 19:02:57', '2016-11-21 19:02:57'),
(977, 43, 14, 1, 0, '2016-11-21 19:02:57', '2016-11-21 19:02:57'),
(978, 43, 63, 1, 0, '2016-11-21 19:02:57', '2016-11-21 19:02:57'),
(979, 43, 68, 1, 0, '2016-11-21 19:02:57', '2016-11-21 19:02:57'),
(980, 43, 72, 1, 0, '2016-11-21 19:02:57', '2016-11-21 19:02:57'),
(981, 44, 13, 1, 0, '2016-11-21 19:03:38', '2016-11-21 19:03:38'),
(982, 44, 21, 1, 0, '2016-11-21 19:03:38', '2016-11-21 19:03:38'),
(983, 44, 15, 1, 0, '2016-11-21 19:03:38', '2016-11-21 19:03:38'),
(984, 44, 20, 1, 0, '2016-11-21 19:03:38', '2016-11-21 19:03:38'),
(985, 44, 14, 1, 0, '2016-11-21 19:03:38', '2016-11-21 19:03:38'),
(986, 44, 115, 1, 0, '2016-11-21 19:03:38', '2016-11-21 19:03:38'),
(987, 44, 116, 1, 0, '2016-11-21 19:03:38', '2016-11-21 19:03:38'),
(988, 45, 13, 1, 0, '2016-11-21 19:04:44', '2016-11-21 19:04:44'),
(989, 45, 21, 1, 0, '2016-11-21 19:04:44', '2016-11-21 19:04:44'),
(990, 45, 15, 1, 0, '2016-11-21 19:04:44', '2016-11-21 19:04:44'),
(991, 45, 20, 1, 0, '2016-11-21 19:04:44', '2016-11-21 19:04:44'),
(992, 45, 14, 1, 0, '2016-11-21 19:04:44', '2016-11-21 19:04:44'),
(993, 45, 108, 1, 0, '2016-11-21 19:04:44', '2016-11-21 19:04:44'),
(994, 45, 105, 1, 0, '2016-11-21 19:04:44', '2016-11-21 19:04:44'),
(995, 46, 13, 1, 0, '2016-11-21 19:05:04', '2016-11-21 19:05:04'),
(996, 46, 21, 1, 0, '2016-11-21 19:05:04', '2016-11-21 19:05:04'),
(997, 46, 15, 1, 0, '2016-11-21 19:05:04', '2016-11-21 19:05:04'),
(998, 46, 27, 1, 0, '2016-11-21 19:05:04', '2016-11-21 19:05:04'),
(999, 46, 20, 1, 0, '2016-11-21 19:05:04', '2016-11-21 19:05:04'),
(1000, 46, 38, 1, 0, '2016-11-21 19:05:04', '2016-11-21 19:05:04'),
(1001, 46, 39, 1, 0, '2016-11-21 19:05:04', '2016-11-21 19:05:04'),
(1002, 88, 21, 1, 0, '2016-11-22 09:43:14', '2016-11-22 09:43:14'),
(1003, 88, 15, 1, 0, '2016-11-22 09:43:14', '2016-11-22 09:43:14'),
(1004, 88, 27, 1, 0, '2016-11-22 09:43:14', '2016-11-22 09:43:14'),
(1005, 88, 14, 1, 0, '2016-11-22 09:43:14', '2016-11-22 09:43:14'),
(1006, 88, 13, 1, 0, '2016-11-22 09:43:14', '2016-11-22 09:43:14'),
(1007, 88, 16, 1, 0, '2016-11-22 09:43:14', '2016-11-22 09:43:14'),
(1008, 51, 21, 1, 0, '2016-11-22 09:43:48', '2016-11-22 09:43:48'),
(1009, 51, 15, 1, 0, '2016-11-22 09:43:48', '2016-11-22 09:43:48'),
(1010, 51, 24, 1, 0, '2016-11-22 09:43:48', '2016-11-22 09:43:48'),
(1011, 51, 20, 1, 0, '2016-11-22 09:43:48', '2016-11-22 09:43:48'),
(1012, 51, 26, 1, 0, '2016-11-22 09:43:48', '2016-11-22 09:43:48'),
(1013, 51, 13, 1, 0, '2016-11-22 09:43:48', '2016-11-22 09:43:48'),
(1018, 50, 21, 1, 0, '2016-11-22 09:44:13', '2016-11-22 09:44:13'),
(1019, 50, 15, 1, 0, '2016-11-22 09:44:13', '2016-11-22 09:44:13'),
(1020, 50, 20, 1, 0, '2016-11-22 09:44:13', '2016-11-22 09:44:13'),
(1021, 50, 14, 1, 0, '2016-11-22 09:44:13', '2016-11-22 09:44:13'),
(1022, 50, 13, 1, 0, '2016-11-22 09:44:13', '2016-11-22 09:44:13'),
(1023, 49, 21, 1, 0, '2016-11-22 09:44:37', '2016-11-22 09:44:37'),
(1024, 49, 15, 1, 0, '2016-11-22 09:44:37', '2016-11-22 09:44:37'),
(1025, 49, 20, 1, 0, '2016-11-22 09:44:37', '2016-11-22 09:44:37'),
(1026, 49, 14, 1, 0, '2016-11-22 09:44:37', '2016-11-22 09:44:37'),
(1027, 49, 13, 1, 0, '2016-11-22 09:44:37', '2016-11-22 09:44:37'),
(1028, 49, 40, 1, 0, '2016-11-22 09:44:37', '2016-11-22 09:44:37'),
(1029, 49, 38, 1, 0, '2016-11-22 09:44:37', '2016-11-22 09:44:37'),
(1030, 48, 21, 1, 0, '2016-11-22 09:45:02', '2016-11-22 09:45:02'),
(1031, 48, 15, 1, 0, '2016-11-22 09:45:02', '2016-11-22 09:45:02'),
(1032, 48, 20, 1, 0, '2016-11-22 09:45:02', '2016-11-22 09:45:02'),
(1033, 48, 29, 1, 0, '2016-11-22 09:45:02', '2016-11-22 09:45:02'),
(1034, 48, 14, 1, 0, '2016-11-22 09:45:02', '2016-11-22 09:45:02'),
(1035, 48, 28, 1, 0, '2016-11-22 09:45:02', '2016-11-22 09:45:02'),
(1036, 48, 13, 1, 0, '2016-11-22 09:45:02', '2016-11-22 09:45:02'),
(1037, 47, 21, 1, 0, '2016-11-22 09:45:47', '2016-11-22 09:45:47'),
(1038, 47, 15, 1, 0, '2016-11-22 09:45:47', '2016-11-22 09:45:47'),
(1039, 47, 20, 1, 0, '2016-11-22 09:45:47', '2016-11-22 09:45:47'),
(1040, 47, 14, 1, 0, '2016-11-22 09:45:47', '2016-11-22 09:45:47'),
(1041, 47, 13, 1, 0, '2016-11-22 09:45:47', '2016-11-22 09:45:47'),
(1042, 47, 88, 1, 0, '2016-11-22 09:45:47', '2016-11-22 09:45:47'),
(1043, 47, 86, 1, 0, '2016-11-22 09:45:47', '2016-11-22 09:45:47'),
(1044, 87, 21, 1, 0, '2016-11-22 09:47:21', '2016-11-22 09:47:21'),
(1045, 87, 15, 1, 0, '2016-11-22 09:47:21', '2016-11-22 09:47:21'),
(1046, 87, 27, 1, 0, '2016-11-22 09:47:21', '2016-11-22 09:47:21'),
(1047, 87, 20, 1, 0, '2016-11-22 09:47:21', '2016-11-22 09:47:21'),
(1048, 87, 29, 1, 0, '2016-11-22 09:47:21', '2016-11-22 09:47:21'),
(1049, 87, 26, 1, 0, '2016-11-22 09:47:21', '2016-11-22 09:47:21'),
(1050, 87, 14, 1, 0, '2016-11-22 09:47:21', '2016-11-22 09:47:21'),
(1051, 87, 23, 1, 0, '2016-11-22 09:47:21', '2016-11-22 09:47:21'),
(1052, 87, 13, 1, 0, '2016-11-22 09:47:21', '2016-11-22 09:47:21'),
(1080, 86, 21, 1, 0, '2016-11-22 09:48:27', '2016-11-22 09:48:27'),
(1081, 86, 15, 1, 0, '2016-11-22 09:48:27', '2016-11-22 09:48:27'),
(1082, 86, 20, 1, 0, '2016-11-22 09:48:27', '2016-11-22 09:48:27'),
(1083, 86, 26, 1, 0, '2016-11-22 09:48:27', '2016-11-22 09:48:27'),
(1084, 86, 14, 1, 0, '2016-11-22 09:48:27', '2016-11-22 09:48:27'),
(1085, 86, 13, 1, 0, '2016-11-22 09:48:27', '2016-11-22 09:48:27'),
(1123, 12, 14, 1, 0, '2016-11-22 17:18:14', '2016-11-22 17:18:14'),
(1124, 12, 21, 1, 0, '2016-11-22 17:18:14', '2016-11-22 17:18:14'),
(1125, 12, 15, 1, 0, '2016-11-22 17:18:14', '2016-11-22 17:18:14'),
(1126, 12, 20, 1, 0, '2016-11-22 17:18:14', '2016-11-22 17:18:14'),
(1127, 12, 13, 1, 0, '2016-11-22 17:18:14', '2016-11-22 17:18:14'),
(1128, 12, 55, 1, 0, '2016-11-22 17:18:14', '2016-11-22 17:18:14'),
(1136, 15, 14, 1, 0, '2016-11-22 17:20:51', '2016-11-22 17:20:51'),
(1137, 15, 15, 1, 0, '2016-11-22 17:20:51', '2016-11-22 17:20:51'),
(1138, 15, 23, 1, 0, '2016-11-22 17:20:51', '2016-11-22 17:20:51'),
(1139, 15, 20, 1, 0, '2016-11-22 17:20:51', '2016-11-22 17:20:51'),
(1140, 15, 13, 1, 0, '2016-11-22 17:20:51', '2016-11-22 17:20:51'),
(1145, 16, 21, 1, 0, '2016-11-22 17:45:31', '2016-11-22 17:45:31'),
(1146, 16, 26, 1, 0, '2016-11-22 17:45:31', '2016-11-22 17:45:31'),
(1147, 16, 14, 1, 0, '2016-11-22 17:45:31', '2016-11-22 17:45:31'),
(1148, 16, 15, 1, 0, '2016-11-22 17:45:31', '2016-11-22 17:45:31'),
(1149, 16, 20, 1, 0, '2016-11-22 17:45:31', '2016-11-22 17:45:31'),
(1168, 13, 21, 1, 0, '2016-11-22 17:54:58', '2016-11-22 17:54:58'),
(1169, 13, 14, 1, 0, '2016-11-22 17:54:58', '2016-11-22 17:54:58'),
(1170, 13, 15, 1, 0, '2016-11-22 17:54:58', '2016-11-22 17:54:58'),
(1171, 13, 27, 1, 0, '2016-11-22 17:54:58', '2016-11-22 17:54:58'),
(1172, 13, 20, 1, 0, '2016-11-22 17:54:58', '2016-11-22 17:54:58'),
(1173, 13, 13, 1, 0, '2016-11-22 17:54:58', '2016-11-22 17:54:58'),
(1174, 13, 16, 1, 0, '2016-11-22 17:54:58', '2016-11-22 17:54:58'),
(1175, 13, 40, 1, 0, '2016-11-22 17:54:58', '2016-11-22 17:54:58'),
(1176, 13, 55, 1, 0, '2016-11-22 17:54:58', '2016-11-22 17:54:58'),
(1177, 13, 66, 1, 0, '2016-11-22 17:54:58', '2016-11-22 17:54:58'),
(1178, 13, 144, 1, 0, '2016-11-22 17:54:58', '2016-11-22 17:54:58'),
(1179, 14, 21, 1, 0, '2016-11-22 18:00:41', '2016-11-22 18:00:41'),
(1180, 14, 14, 1, 0, '2016-11-22 18:00:41', '2016-11-22 18:00:41'),
(1181, 14, 15, 1, 0, '2016-11-22 18:00:41', '2016-11-22 18:00:41'),
(1182, 14, 24, 1, 0, '2016-11-22 18:00:41', '2016-11-22 18:00:41'),
(1183, 14, 20, 1, 0, '2016-11-22 18:00:41', '2016-11-22 18:00:41'),
(1184, 14, 13, 1, 0, '2016-11-22 18:00:41', '2016-11-22 18:00:41'),
(1185, 14, 16, 1, 0, '2016-11-22 18:00:41', '2016-11-22 18:00:41');

-- --------------------------------------------------------

--
-- Table structure for table `pre_inst_teaching_types`
--

CREATE TABLE `pre_inst_teaching_types` (
  `id` int(11) NOT NULL,
  `inst_id` int(11) NOT NULL,
  `teaching_type_id` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `sort_order` tinyint(5) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pre_inst_teaching_types`
--

INSERT INTO `pre_inst_teaching_types` (`id`, `inst_id`, `teaching_type_id`, `status`, `sort_order`, `created_at`, `updated_at`) VALUES
(1, 15, 2, 1, 0, '2016-11-08 12:46:54', '2016-11-08 12:46:54'),
(2, 15, 3, 1, 0, '2016-11-08 12:46:54', '2016-11-08 12:46:54'),
(3, 12, 2, 1, 0, '2016-11-08 17:48:47', '2016-11-08 17:48:47'),
(4, 12, 3, 1, 0, '2016-11-08 17:48:47', '2016-11-08 17:48:47'),
(5, 13, 2, 1, 0, '2016-11-09 11:36:59', '2016-11-09 11:36:59'),
(6, 13, 3, 1, 0, '2016-11-09 11:36:59', '2016-11-09 11:36:59'),
(9, 14, 3, 1, 0, '2016-11-09 12:21:43', '2016-11-09 12:21:43'),
(10, 16, 2, 1, 0, '2016-11-09 12:49:26', '2016-11-09 12:49:26'),
(11, 16, 3, 1, 0, '2016-11-09 12:49:26', '2016-11-09 12:49:26'),
(12, 42, 2, 1, 0, '2016-11-10 11:01:48', '2016-11-10 11:01:48'),
(13, 42, 3, 1, 0, '2016-11-10 11:01:48', '2016-11-10 11:01:48'),
(14, 44, 2, 1, 0, '2016-11-10 12:05:34', '2016-11-10 12:05:34'),
(15, 44, 3, 1, 0, '2016-11-10 12:05:34', '2016-11-10 12:05:34'),
(16, 43, 2, 1, 0, '2016-11-10 12:11:00', '2016-11-10 12:11:00'),
(17, 43, 3, 1, 0, '2016-11-10 12:11:00', '2016-11-10 12:11:00'),
(18, 45, 2, 1, 0, '2016-11-10 12:36:15', '2016-11-10 12:36:15'),
(19, 45, 3, 1, 0, '2016-11-10 12:36:15', '2016-11-10 12:36:15'),
(20, 46, 2, 1, 0, '2016-11-10 13:10:30', '2016-11-10 13:10:30'),
(21, 47, 2, 1, 0, '2016-11-10 14:31:51', '2016-11-10 14:31:51'),
(22, 47, 3, 1, 0, '2016-11-10 14:31:51', '2016-11-10 14:31:51'),
(24, 49, 2, 1, 0, '2016-11-10 15:39:29', '2016-11-10 15:39:29'),
(25, 49, 3, 1, 0, '2016-11-10 15:39:29', '2016-11-10 15:39:29'),
(26, 50, 2, 1, 0, '2016-11-10 15:53:39', '2016-11-10 15:53:39'),
(27, 50, 3, 1, 0, '2016-11-10 15:53:39', '2016-11-10 15:53:39'),
(28, 51, 2, 1, 0, '2016-11-10 16:27:07', '2016-11-10 16:27:07'),
(29, 51, 3, 1, 0, '2016-11-10 16:27:07', '2016-11-10 16:27:07'),
(30, 86, 2, 1, 0, '2016-11-10 18:32:07', '2016-11-10 18:32:07'),
(31, 86, 3, 1, 0, '2016-11-10 18:32:07', '2016-11-10 18:32:07'),
(32, 87, 2, 1, 0, '2016-11-11 09:41:41', '2016-11-11 09:41:41'),
(33, 87, 3, 1, 0, '2016-11-11 09:41:41', '2016-11-11 09:41:41'),
(34, 88, 2, 1, 0, '2016-11-11 10:05:32', '2016-11-11 10:05:32'),
(35, 88, 3, 1, 0, '2016-11-11 10:05:32', '2016-11-11 10:05:32'),
(36, 48, 2, 1, 0, '2016-11-21 12:05:31', '2016-11-21 12:05:31'),
(37, 48, 3, 1, 0, '2016-11-21 12:05:31', '2016-11-21 12:05:31');

-- --------------------------------------------------------

--
-- Table structure for table `pre_languages`
--

CREATE TABLE `pre_languages` (
  `id` int(11) NOT NULL,
  `name` varchar(512) NOT NULL DEFAULT '',
  `status` enum('Active','Inactive') NOT NULL DEFAULT 'Active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pre_languages`
--

INSERT INTO `pre_languages` (`id`, `name`, `status`) VALUES
(2, 'English', 'Active'),
(3, 'French', 'Active'),
(4, 'Hindi', 'Active'),
(5, 'Arabic', 'Active'),
(7, 'Urdu', 'Active'),
(8, 'Dutch', 'Active'),
(10, 'Japanese', 'Inactive'),
(11, 'German', 'Active'),
(12, 'Chinese', 'Active'),
(13, 'Danish', 'Active'),
(14, 'Czech', 'Active'),
(15, 'Greek', 'Active'),
(16, 'Hebrew', 'Active'),
(17, 'Italian', 'Active'),
(18, 'Latin', 'Active'),
(19, 'portuguese', 'Active'),
(20, 'Nepali', 'Active'),
(21, 'spanish', 'Active'),
(22, 'Indonesian', 'Active'),
(23, 'Irish', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `pre_languagewords`
--

CREATE TABLE `pre_languagewords` (
  `lang_id` bigint(22) NOT NULL,
  `lang_key` varchar(256) DEFAULT NULL,
  `english` longtext,
  `spanish` longtext,
  `bengali` longtext,
  `french` longtext,
  `japanese` longtext,
  `hindi` longtext,
  `russian` longtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pre_languagewords`
--

INSERT INTO `pre_languagewords` (`lang_id`, `lang_key`, `english`, `spanish`, `bengali`, `french`, `japanese`, `hindi`, `russian`) VALUES
(1, 'select_location', 'Select Location', ' Seleccionar ubicación', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', ' Выбрать Расположение'),
(2, 'type_of_course', 'Type Of Course', ' El tipo de curso', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Тип курса'),
(3, 'Tutors : Find Tutors Now', 'Tutors : Find Tutors Now', ' Tutores: encontrar profesor Ahora', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', NULL),
(4, 'My Dashboard', 'My Dashboard', ' Mi tablero', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Мой Dashboard'),
(5, 'our_popular_courses', 'Our Popular Courses', 'Nuestros Cursos populares', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Наши популярные курсы'),
(6, 'see_all', 'See All', ' Ver todo', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Увидеть все'),
(7, 'check_all_courses', 'Check All Courses', ' Compruebe todos los cursos', NULL, NULL, NULL, 'सभी पाठ्यक्रमों की जाँच करें', ' Проверить все курсы'),
(8, 'User Login', 'User Login', 'Inicio de sesión de usuario', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', ' Логин пользователя'),
(9, 'Dashboard', 'Dashboard', ' Tablero', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Панель приборов'),
(10, 'Manage', 'Manage', 'Gestionar', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'управлять'),
(11, 'Subjects', 'Subjects', ' Asignaturas', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Предметы'),
(12, 'Locations', 'Locations', ' Ubicaciones', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Место проживания'),
(13, 'Teaching Type', 'Teaching Type', ' Tipo de la enseñanza', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Обучение Тип'),
(14, 'Packages', 'Packages', ' paquetes', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'пакеты'),
(15, 'List Packages', 'List Packages', ' Paquetes lista', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Список пакетов'),
(16, 'Personnel Information', 'Personnel Information', ' Información del personal', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Личная информация'),
(17, 'Profile Information', 'Profile Information', ' información del perfil', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'информация профиля'),
(18, 'Education', 'Education', ' Educación', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'образование'),
(19, 'Contact Information', 'Contact Information', ' Información del contacto', NULL, NULL, NULL, 'संपर्क जानकारी', 'Контактная информация'),
(20, 'Gallery', 'Gallery', ' Galería', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Галерея'),
(21, 'Change Password', 'Change Password', 'Cambia la contraseña', NULL, NULL, NULL, 'पासवर्ड बदलें', 'Изменить пароль'),
(22, 'Package Name', 'Package Name', ' Nombre del paquete', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Имя пакета'),
(23, 'Validity Type', 'Validity Type', ' Tipo de validez', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Срок действия Тип'),
(24, 'Package Cost', 'Package Cost', ' Costo del paquete', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Стоимость пакета'),
(25, 'Buy Now', 'Buy Now', 'Compra ahora', NULL, NULL, NULL, 'अभी खरीदें', 'купить сейчас'),
(26, 'MSG_NO_ENTRY', 'MSG NO ENTRY', 'MSG NO ENTRADA', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'не Msg никаких записей'),
(27, 'info', 'Info', 'información', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Информация'),
(28, 'package', 'Package', ' Paquete', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', ' пакет'),
(29, 'Payment gateway', 'Payment Gateway', ' Puerta de pago', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Платежный шлюз'),
(30, 'error', 'Error', ' Error', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'ошибка'),
(31, 'emailusername', 'Emailusername', 'Emailusername', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', ' E-mail имя пользователя'),
(32, 'password', 'Password', 'Contraseña', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'пароль'),
(33, 'select', 'Select', 'Seleccionar', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', ' Выбрать'),
(34, 'load_more', 'Load More', ' Carga más', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Загрузи больше'),
(35, 'loading', 'Loading', ' Cargando', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'загрузка'),
(36, 'You have reached end of the list', 'You Have Reached End Of The List.', '', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', ' Вы достигли конца списка'),
(37, 'You dont have permission to access this page', 'You Dont Have Permission To Access This Page', ' Usted no tiene permiso para acceder a esta página', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Вы не имеете прав доступа к этой странице'),
(38, 'find_student_leads', 'Find Student Leads', ' Encuentra Ventas Estudiante', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', ' Найти Student потенциальных'),
(39, 'logged_in_successfully', 'Logged In Successfully', 'Conectado con éxito', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', ' При успешном входе'),
(40, 'success', 'Success', 'Éxito', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'успех'),
(41, 'profile', 'Profile', ' Perfil', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Профиль'),
(42, 'Sign out', 'Sign Out', ' Desconectar', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Выход'),
(43, 'Users', 'Users', 'usuarios', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'пользователей'),
(44, 'view_users', 'View Users', ' Ver todos los usuarios', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Просмотр пользователей'),
(45, 'students', 'Students', ' Los estudiantes', NULL, NULL, NULL, 'अभी बुक करें', 'Студенты'),
(46, 'tutors', 'Tutors', ' Los tutores', NULL, NULL, NULL, 'अभी बुक करें', 'Репетиторы'),
(47, 'institutes', 'Institutes', ' institutos', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Институты'),
(48, 'create', 'Create', ' Crear', NULL, NULL, NULL, 'सर्जन करना', 'Создайте'),
(49, 'leads', 'Leads', ' plomos', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Ведет'),
(50, 'all_leads', 'All Leads', 'todos los potenciales', NULL, NULL, NULL, ' सभी सुराग', 'Все Ведет'),
(51, 'premium_leads', 'Premium Leads', ' Ventas de primera calidad', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', ' Премиум Ведет'),
(52, 'free_leads', 'Free Leads', 'Ventas libres', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Бесплатные Ведет'),
(53, 'open_leads', 'Open Leads', ' potenciales abiertos', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', ' открытые Ведет'),
(54, 'closed_leads', 'Closed Leads', ' Ventas cerradas', NULL, NULL, NULL, 'बंद सुराग', 'Закрытые Ведет'),
(55, 'unregistered_leads', 'Unregistered Leads', 'Ventas no registrados', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', ' Незарегистрированные Ведет'),
(56, 'messages', 'Messages', 'mensajes', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Сообщения'),
(57, 'tutor_messages', 'Tutor Messages', ' Los mensajes de tutor', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Репетитор сообщения'),
(58, 'student_messages', 'Student Messages', ' Los mensajes de los estudiantes', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Студенческие сообщения'),
(59, 'sent', 'Sent', 'Expedido', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Отправлено'),
(60, 'categories', 'Categories', ' Categorías', NULL, NULL, NULL, ' श्रेणियाँ', 'категории'),
(61, 'list_categories', 'List Categories', ' Lista de categorías', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Список категорий'),
(62, 'add_category', 'Add Category', 'añadir categoría', NULL, NULL, NULL, ' श्रेणी जोड़ना', 'Добавить категорию'),
(63, 'list_courses', 'List Courses', ' Cursos de lista', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Список курсов'),
(64, 'add_course', 'Add Course', ' Agregar curso', NULL, NULL, NULL, ' कोर्स जोड़े', 'Добавить курс'),
(65, 'options', 'Options', ' opciones', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', ' Опции'),
(66, 'list_degrees', 'List Degrees', ' Grados de la lista', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Список ученых степеней'),
(67, 'add_location', 'Add Location', ' Agregar Direccion', NULL, NULL, NULL, 'स्थान बताईए', 'Добавить местоположение'),
(68, 'list_locations', 'List Locations', ' Localizaciones', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Список Местоположение'),
(69, 'list_packages', 'List Packages', ' Paquetes lista', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Список пакетов'),
(70, 'add_package', 'Add Package', 'Agregar paquete', NULL, NULL, NULL, ' पैकेज जोड़ें', 'Добавить пакет'),
(71, 'testimonials', 'Testimonials', 'Testimonios', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्सलेनदेन इतिहास क्रेडिट्स', 'Отзывы'),
(72, 'all', 'All', ' Todas', NULL, NULL, NULL, ' सब', 'Все'),
(73, 'tutors', 'Tutor\'s', '', NULL, NULL, NULL, 'अभी बुक करें', 'Репетиторы'),
(74, 'students', 'Student\'s', '', NULL, NULL, NULL, 'अभी बुक करें', 'Студенты'),
(75, 'pages', 'Pages', 'páginas', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'страницы'),
(76, 'about_us', 'About Us', 'Sobre nosotros', NULL, NULL, NULL, 'हमारे बारे में', 'О нас'),
(77, 'how_it_works', 'How It Works', ' Cómo funciona', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Как это работает'),
(78, 'terms_and_conditions', 'Terms And Conditions', ' Términos y Condiciones', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Условия и положения'),
(79, 'privacy_policy', 'Privacy Policy', ' Política de privacidad', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'политика конфиденциальности'),
(80, 'dynamic_pages', 'Dynamic Pages', ' Las páginas dinámicas', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Динамические страницы'),
(81, 'faqs', 'FAQ\'s', NULL, NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Кинофильмы'),
(82, 'settings', 'Settings', ' ajustes', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'настройки'),
(83, 'email_templates', 'Email Templates', 'Plantillas de correo electrónico', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', ' Шаблоны электронных сообщений'),
(84, 'sitetestimonials', 'Sitetestimonials', ' Sitetestimonials', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Отзывы по сайту'),
(85, 'list_testimonials', 'List Testimonials', ' lista Testimonios', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', ' Список Отзывы'),
(86, 'add_testimonial', 'Add Testimonial', 'Añadir un testimonio', NULL, NULL, NULL, ' प्रशंसापत्र जोड़ें', 'Add Testimonial'),
(87, 'language_settings', 'Language Settings', ' Ajustes de idioma', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', ' Языковые настройки'),
(88, 'view_languages', 'View Languages', ' Ver Idiomas', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', ' Просмотреть Языки'),
(89, 'add_language', 'Add Language', 'Agregar idioma', NULL, NULL, NULL, ' भाषा जोड़े', 'Добавить язык'),
(90, 'view_phrases', 'View Phrases', ' Ver Frases', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', ' Посмотреть Фразы'),
(91, 'view_tutor_languages', 'View Tutor Languages', 'Ver Tutor Idiomas', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', ' Просмотр Tutor Языки'),
(92, 'reports', 'Reports', ' Informes', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', ' Отчеты'),
(93, 'premium_users', 'Premium Users', 'Los usuarios premium', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Премиум пользователи'),
(94, 'my_profile', 'My Profile', 'Mi perfil', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Мой профайл'),
(95, 'change_password', 'Change Password', ' Cambia la contraseña', NULL, NULL, NULL, 'पासवर्ड बदलें', 'Изменить пароль'),
(96, 'home', 'Home', ' Casa', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Главная'),
(97, 'View', 'View', 'Ver', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Посмотреть'),
(98, 'Types for ', 'Types For ', 'Para tipos', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Типы Для'),
(99, 'add_setting_field', 'Add Setting Field', 'Añadir configuración Campo', NULL, NULL, NULL, ' फील्ड सेटिंग जोड़ें', 'Добавить параметр Field'),
(100, 'Paypal_Email', 'Paypal Email', 'e-mail de Paypal', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Paypal Электронная почта'),
(101, 'Currency_Code', 'Currency Code', 'Código de moneda', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Код валюты'),
(102, 'Account_TypeProductionSandbox', 'Account TypeProductionSandbox', 'TypeProductionSandbox cuenta', NULL, NULL, NULL, 'खाते का प्रकार उत्पादन सैंडबॉक्स', 'Тип счета Sandbox Производство'),
(103, 'Header_Logo', 'Header Logo', ' El logotipo de cabecera', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Логотип заголовка'),
(104, 'Status', 'Status', ' Estado', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Положение дел'),
(105, 'submit', 'Submit', ' Enviar', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Отправить'),
(106, 'cancel', 'Cancel', 'Cancelar', NULL, NULL, NULL, 'रद्द करना', 'Отмена'),
(107, 'MSG_RECORD_UPDATED', 'MSG RECORD UPDATED', 'MSG registro actualizado', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'MSG запись обновляется'),
(108, 'Profile Image', 'Profile Image', ' Imagen de perfil', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Изображение профиля'),
(109, 'Describe your Experience and Services', 'Describe Your Experience And Services', ' Describe su experiencia y Servicios', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Опишите Ваш опыт и услуги'),
(110, 'experience', 'Experience', ' Experiencia', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Опыт'),
(111, 'Profile Page Title', 'Profile Page Title', 'Perfil Título', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', ' Профиль Название страницы'),
(112, 'How far are you willing to travel in Km', 'How Far Are You Willing To Travel? (in Km)', '', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Как далеко вы готовы путешествовать? (В км)'),
(113, 'willing_to_travel', 'Willing To Travel', 'Dispuesto a viajar', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', ' Желание путешествовать'),
(114, 'Do you have your own vehicle to travel', 'Do You Have Your Own Vehicle To Travel?', '', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', ' Есть ли у вас собственный автомобиль путешествовать?'),
(115, 'Yes', 'Yes', ' Sí', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्सलेनदेन इतिहास क्रेडिट्स', 'да'),
(116, 'No', 'No', ' No', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Нет'),
(117, 'SAVE', 'SAVE', ' SALVAR', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', ' СПАСТИ'),
(118, 'Payment success Transaction Id ', 'Payment Success. Transaction Id ', '', NULL, NULL, NULL, 'अभी बुक करें', 'Оплата успеха. ID транзакции'),
(119, 'Credits', 'Credits', ' créditos', NULL, NULL, NULL, 'क्रेडिट्स', 'кредиты'),
(120, 'package_for', 'Package For', 'Por paquete', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', ' Пакет для'),
(121, 'edit', 'Edit', ' Editar', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'редактировать'),
(122, 'course', 'Course', 'Curso', NULL, NULL, NULL, 'कोर्स', 'Курс'),
(123, 'sort_order', 'Sort Order', ' Orden de Clasificación', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Порядок сортировки'),
(124, 'courses', 'Courses', ' cursos', NULL, NULL, NULL, 'पाठ्यक्रम', 'курсы'),
(125, 'add', 'Add', 'Añadir', NULL, NULL, NULL, 'जोड़ना', 'Добавить'),
(126, 'category', 'Category', ' Categoría', NULL, NULL, NULL, 'वर्ग', 'категория'),
(127, 'degree', 'Degree', 'La licenciatura', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'степень'),
(128, 'degrees', 'Degrees', ' grados', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'степени'),
(129, 'location', 'Location', ' Ubicación', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Место нахождения'),
(130, 'locaitons', 'Locaitons', ' Locaitons', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Место проживания'),
(131, 'user', 'User', ' Usuario', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'пользователь'),
(132, 'institute', 'Institute', ' Instituto', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'институт'),
(133, 'tutor', 'Tutor', ' Tutor', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', ' репетитор'),
(134, 'First Name', 'First Name', ' Nombre de pila', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Имя'),
(135, 'first_name', 'First Name', ' Nombre de pila', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Имя'),
(136, 'Last Name', 'Last Name', ' Apellido', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Фамилия'),
(137, 'last_name', 'Last Name', ' Apellido', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Фамилия'),
(138, 'E-mail Address', 'E-mail Address', 'Dirección de correo electrónico', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Адрес электронной почты'),
(139, 'email', 'Email', 'Email', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', ' Эл. адрес'),
(140, 'Phone', 'Phone', 'Teléfono', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Телефон'),
(141, 'code', 'Code', 'Código', NULL, NULL, NULL, 'कोड', 'Код'),
(142, 'Gender', 'Gender', ' Género', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Пол'),
(143, 'Male', 'Male', 'Masculino', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'мужчина'),
(144, 'Female', 'Female', 'Hembra', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'женский'),
(145, 'Languages Known', 'Languages Known', ' Idiomas Conocido', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Языки Известные'),
(146, 'Year of Birth', 'Year Of Birth', ' Año de nacimiento', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Год рождения'),
(147, 'date_of_birth', 'Date Of Birth', ' Fecha de nacimiento', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Дата рождения'),
(148, 'Blog/Website', 'Blog/Website', ' Blog / Sitio Web', NULL, NULL, NULL, 'ब्लॉग / वेबसाइट', ' Блог / Сайт'),
(149, 'Facebook Profile', 'Facebook Profile', 'Perfil de Facebook', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'facebook профиля'),
(150, 'Facebook', 'Facebook', 'Facebook', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'facebook'),
(151, 'Twitter Profile', 'Twitter Profile', 'Twitter Perfil', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', ' Twitter Профиль'),
(152, 'Twitter', 'Twitter', ' Gorjeo', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'щебетать'),
(153, 'Linkedin Profile', 'Linkedin Profile', ' Perfil de Linkedin', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Linkedin Профиль'),
(154, 'Linkedin', 'Linkedin', ' Linkedin', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Linkedin'),
(155, 'UPDATE', 'UPDATE', 'ACTUALIZAR', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'ОБНОВИТЬ'),
(156, 'You have cancelled your transaction', 'You Have Cancelled Your Transaction', ' Usted ha cancelado su transacción', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Вы отменили мою Сделка'),
(157, 'Live_Merchant_Key', 'Live Merchant Key', ' Clave de comerciante en directo', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Живой Ключ Торговец'),
(158, 'Live_Salt', 'Live Salt', ' sal vivo', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Живая соль'),
(159, 'Live_URL', 'Live URL', 'URL en vivo', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Живой URL'),
(160, 'Sandbox_Merchant_Key', 'Sandbox Merchant Key', ' Zona de pruebas clave de comerciante', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', ' Sandbox Ключ продавца'),
(161, 'Sandbox_Salt', 'Sandbox Salt', ' sal caja de arena', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Песочница Соль'),
(162, 'Test_URL', 'Test URL', ' URL de prueba', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Тестирование URL'),
(163, 'Account_TypeLIveSandbox', 'Account TypeLIveSandbox', 'TypeLIveSandbox cuenta', NULL, NULL, NULL, ' खाते का प्रकार रहते सैंडबॉक्स', 'TypeLIveSandbox Счет'),
(164, 'subscriptions', 'Subscriptions', 'Suscripciones', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Подписки'),
(165, 'My Subscriptions', 'My Subscriptions', ' mis Suscripciónes', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Мои подписки'),
(166, 'Privacy', 'Privacy', ' Intimidad', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Конфиденциальность'),
(167, 'all_courses', 'All Courses', 'todos los cursos', NULL, NULL, NULL, 'सभी पाठ्यक्रम', 'Все курсы'),
(168, 'courses_in', 'Courses In', 'En cursos', NULL, NULL, NULL, 'एक शिक्षक के रूप में', 'Курсы В'),
(169, 'Free Demo', 'Free Demo', ' Prueba gratis', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Бесплатный Демо'),
(170, 'Visibility in Search', 'Visibility In Search', ' Visibilidad En busca', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Видимость В поисках'),
(171, 'Set Privacy', 'Set Privacy', ' conjunto de privacidad', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Набор конфиденциальности'),
(172, 'Show All', 'Show All', ' Mostrar todo', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', ' Показать все'),
(173, 'Show Email', 'Show Email', ' Ver el email', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Показать E-mail'),
(174, 'Show Mobile', 'Show Mobile', ' Mostrar Mobile', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', ' Показать Мобильный'),
(176, 'Availability', 'Availability', 'Disponibilidad', NULL, NULL, NULL, 'उपलब्धता', 'Доступность'),
(177, 'other', 'Other', ' Otro', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Другие'),
(178, 'Add More', 'Add More', ' Añadir más', NULL, NULL, NULL, 'अधिक जोड़ें', 'Добавить больше'),
(179, 'University', 'University', ' Universidad', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Университет'),
(180, 'Address', 'Address', 'Dirección', NULL, NULL, NULL, ' पता', 'Адрес'),
(181, 'Year', 'Year', ' Año', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Год'),
(182, 'are you sure', 'Are You Sure?', '', NULL, NULL, NULL, ' छात्र', 'Ты уверен?'),
(183, 'delete', 'Delete', 'Borrar', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Удалить'),
(184, 'privacy updated successfully', 'Privacy Updated Successfully', ' Privacidad Actualizado con éxito', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', ' Конфиденциальность успешно обновлен'),
(185, 'Manage Privacy', 'Manage Privacy', 'Manejo de privacidad', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Управление уровнем конфиденциальности'),
(186, 'My Gallery', 'My Gallery', 'Mi galería', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Моя галерея'),
(187, 'no_fields_yet_added', 'No Fields Yet Added', ' Sin embargo Añadido campos', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Нет Поля Еще Добавлено'),
(188, 'Site_Title', 'Site Title', ' Título del sitio', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Название сайта'),
(189, 'City', 'City', ' Ciudad', NULL, NULL, NULL, 'शहर', ' город'),
(190, 'State', 'State', ' Estado', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'состояние'),
(191, 'Country', 'Country', ' País', NULL, NULL, NULL, 'देश', 'Страна'),
(192, 'Zipcode', 'Zipcode', ' Código postal', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', NULL),
(193, 'Rights_Reserved_by', 'Rights Reserved By', 'Por los derechos reservados', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Права защищены'),
(194, 'Land_Line', 'Land Line', ' Línea de tierra', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'стационарный'),
(195, 'Fax', 'Fax', ' Fax', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'факс'),
(196, 'Portal_Email', 'Portal Email', ' portal de correo electrónico', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', ' Портал E-mail'),
(197, 'Designed_By', 'Designed By', 'Diseñada por', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', ' Разработано'),
(198, 'URL', 'URL', 'URL', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', ' URL'),
(199, 'Logo', 'Logo', ' Logo', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'логотип'),
(200, 'Country_code', 'Country Code', 'Código de país', NULL, NULL, NULL, 'देश कोड', 'Код страны'),
(201, 'Default_Language', 'Default Language', ' Idioma predeterminado', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Язык по умолчанию'),
(202, 'System_Type', 'System Type', ' Tipo de sistema', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Тип системы'),
(203, 'Site_Slogan', 'Site Slogan', ' lema del sitio', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Слоган сайта'),
(204, 'Google_Adsense_Header', 'Google Adsense Header', ' Cabecera Google Adsense', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', ' Google Adsense Заголовок'),
(205, 'Google_Adsense_Block', 'Google Adsense Block', ' Google Adsense Bloque', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Google Adsense Блок'),
(206, 'adsense_home1', 'Adsense Home1', 'Adsense Home1', NULL, NULL, NULL, ' ऐडसेंस होम 1', 'Adsense home1'),
(207, 'adsense_home2', 'Adsense Home2', ' Adsense Home2', NULL, NULL, NULL, ' ऐडसेंस होम 2', 'Adsense Home2'),
(208, 'adsense_home3', 'Adsense Home3', ' Adsense Home3', NULL, NULL, NULL, ' ऐडसेंस होम 3', 'Adsense home3'),
(209, 'Logout', 'Logout', ' Cerrar sesión', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Выйти'),
(210, 'About Us', 'About Us', ' Sobre nosotros', NULL, NULL, NULL, ' हमारे बारे में', 'О нас'),
(211, 'Find Your Course', 'Find Your Course', ' Encuentra tu curso', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Найди свой курс'),
(212, 'Feel free to call us anytime', 'Feel Free To Call Us Anytime', 'Llame a uno de nosotros en cualquier momento', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Не стесняйтесь звонить нам в любое время'),
(213, 'Find Leads', 'Find Leads', ' Encuentra Ventas', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Найти потенциальных'),
(214, 'Find Courses', 'Find Courses', ' Busca el curso', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Найти курсы'),
(215, 'View All', 'View All', ' Ver todo', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Посмотреть все'),
(216, 'Our Blog', 'Our Blog', ' Nuestro blog', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Наш блог'),
(217, 'Blog', 'Blog', 'Blog', NULL, NULL, NULL, 'ब्लॉग', 'Блог'),
(218, 'Blog Post', 'Blog Post', 'Entrada en el blog', NULL, NULL, NULL, 'ब्लॉग पोस्ट', 'Сообщение блога'),
(219, 'Contact Us', 'Contact Us', 'Contáctenos', NULL, NULL, NULL, 'हमसे संपर्क करें', 'Свяжитесь с нами'),
(220, 'Login', 'Login', ' Iniciar sesión', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Авторизоваться'),
(221, 'Call', 'Call', ' Llamada', NULL, NULL, NULL, 'पु का र ना', 'Вызов'),
(222, 'Find Tutor', 'Find Tutor', ' Encuentra tutor', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Найти Tutor'),
(223, 'Or', 'Or', 'O', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'или'),
(224, 'Register', 'Register', 'Registro', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', ' регистр'),
(225, 'Need help finding a tutor', 'Need Help Finding A Tutor?', '', NULL, NULL, NULL, 'अभी बुक करें', 'Нужна помощь в поиске репетитора?'),
(226, 'Post Your Requirement', 'Post Your Requirement', ' Publique su requisito', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', ' Сообщение ваше требование'),
(227, 'Get to Know Us', 'Get To Know Us', ' Conocernos', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Узнайте о нас'),
(228, 'Search for a Tutor', 'Search For A Tutor', ' Para buscar un tutor', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', ' Поиск репетитора'),
(229, 'Search for a Student', 'Search For A Student', ' Búsqueda de un Estudiante', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', ' Выполните поиск Student'),
(230, 'Become a Tutor', 'Become A Tutor', ' Convertirse en un tutor', NULL, NULL, NULL, 'एक अध्यापक बनें', 'Стать репетитором'),
(231, 'tutors by location', 'Tutors By Location', ' Los tutores Por país de residencia', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Репетиторы По местонахождению'),
(232, 'tutors by course', 'Tutors By Course', ' Por tutores del curso', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', ' Репетиторы по курсу'),
(233, 'meet the team', 'Meet The Team', 'Conocer al equipo', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Встретить команду'),
(234, 'Fields for ', 'Fields For ', 'Para campos', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Поля для'),
(235, 'Fields', 'Fields', 'Campos', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'поля'),
(236, 'insert_validation', 'Insert Validation', ' Insertar Validación', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', ' Вставить проверку'),
(237, 'insert', 'Insert', 'Insertar', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Вставить'),
(238, 'ajax_list_info', 'Ajax List Info', 'Ajax Información de la lista', NULL, NULL, NULL, ' अजाक्स सूची जानकारी', 'Ajax Список информация'),
(239, 'ajax_list', 'Ajax List', 'Lista Ajax', NULL, NULL, NULL, 'अजाक्स सूची', 'Список Ajax'),
(240, 'Androd_App', 'Androd App', 'Androd App', NULL, NULL, NULL, 'एंड्रॉयड ऐप', 'Android App'),
(241, 'iOS_App', 'IOS App', ' IOS App', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', ' приложение IOS'),
(242, 'update_validation', 'Update Validation', ' actualización de Validación', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', ' Обновление проверки'),
(243, 'Need help finding a student', 'Need Help Finding A Student?', '', NULL, NULL, NULL, 'अभी बुक करें', 'Нужна помощь в поиске студент?'),
(244, 'Find Student Leads', 'Find Student Leads', ' Encuentra Ventas Estudiante', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Найти Student потенциальных'),
(245, 'Google Play', 'Google Play', 'Google Play', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Гугл игры'),
(246, 'Find a tutor fast', 'Find A Tutor Fast', 'Encontrar un tutor rápida', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', ' Найти репетитор быстро'),
(247, 'Get our app', 'Get Our App', ' Obtener Nuestra App', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Получить наше приложение'),
(248, 'Send a download link to your mail', 'Send A Download Link To Your Mail', ' Enviar un Enlace de descarga a su correo', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Отправить ссылку для загрузки на Ваш почтовый'),
(249, 'MailType_WebmailMandrill', 'MailType WebmailMandrill', ' MailType WebmailMandrill', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Почта Тип Почтовый веб-Mandrill'),
(250, 'SMTP_Host', 'SMTP Host', ' Host SMTP', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'SMTP хост'),
(251, 'SMTP_User', 'SMTP User', ' usuario SMTP', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'SMTP Пользователь'),
(252, 'SMTP_Password', 'SMTP Password', ' Contraseña SMTP', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Пароль SMTP'),
(253, 'SMTP_Port', 'SMTP Port', 'Puerto SMTP', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Порт SMTP'),
(254, 'Mandrill_API_Key', 'Mandrill API Key', ' Mandril clave de API', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'мандрил ключ апи'),
(255, 'settings_no_aloowed', 'Settings No Aloowed', ' Sin ajustes Aloowed', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Настройки не разрешены'),
(256, 'sheekay', 'Sheekay', 'Sheekay', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Sheekay'),
(257, 'sheeka', 'Sheeka', ' Sheeka', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Sheeka'),
(258, 'template', 'Template', ' Modelo', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'шаблон'),
(259, 'Make Default', 'Make Default', ' Hacer por defecto', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Использовать по умолчанию'),
(260, 'View Values', 'View Values', 'Ver Valores', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Просмотр значений'),
(261, 'View Fields', 'View Fields', 'Ver más campos', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', ' Просмотр поля'),
(262, 'Host', 'Host', 'Anfitrión', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'хозяин'),
(263, 'Port', 'Port', ' Puerto', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', ' порт'),
(264, 'User_Name', 'User Name', ' Nombre de usuario', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Имя пользователя'),
(265, 'Mandril_API_Key', 'Mandril API Key', ' Mandril clave de API', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'мандрил ключ апи'),
(266, 'We have already sent link', 'We Have Already Sent Link', ' Tenemos ya ha sido enviada Enlace', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Мы уже отправили ссылку'),
(267, 'Your links for our app', 'Your Links For Our App', ' Sus Enlaces Para nuestra aplicación', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Ваши ссылки для нашего приложения'),
(268, 'We have sent email link to given address', 'We Have Sent Email Link To Given Address', ' Hemos mandado Correo Enlace con la dirección Dada', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Мы отправили Отправить ссылку на данный адрес'),
(269, 'Team', 'Team', ' Equipo', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'команда'),
(270, 'add_team', 'Add Team', ' Añadir equipo', NULL, NULL, NULL, ' टीम जोड़े', 'Добавить команду'),
(271, 'list_team', 'List Team', ' lista de equipo', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Список команд'),
(272, 'Sign In', 'Sign In', ' Registrarse', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', ' Войти в систему'),
(273, 'With Your Account', 'With Your Account', ' Con su cuenta', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'С Вашего счета'),
(274, 'Username / Email address', 'Username / Email Address', 'Nombre de usuario / Dirección de correo electrónico', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', ' Имя пользователя / E-mail адрес'),
(275, 'Forgot your password', 'Forgot Your Password?', '', NULL, NULL, NULL, 'अभी बुक करें', 'Забыли пароль?'),
(276, 'Remember Me', 'Remember Me', 'Recuérdame', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', ' Запомни меня'),
(277, 'Sign in with', 'Sign In With', ' Inicia sesión con', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', ' Войти в систему с'),
(278, 'Faceook', 'Faceook', 'faceook', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'facebook'),
(279, 'With Tutors', 'With Tutors', 'con tutores', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', ' с репетиторами'),
(280, 'must be at least', 'Must Be At Least', ' Al menos debe ser', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Должен быть не менее'),
(281, 'characters', 'Characters', ' Caracteres', NULL, NULL, NULL, 'वर्ण', 'Персонажи'),
(282, 'pin_code', 'Pin Code', 'Código PIN', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', ' Пин-код'),
(283, 'Phone Number', 'Phone Number', ' Número de teléfono', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', ' Номер телефона'),
(284, 'Create an Account', 'Create An Account', 'Crea una cuenta', NULL, NULL, NULL, ' खाता बनाएं', 'Завести аккаунт'),
(285, 'Confirm Password', 'Confirm Password', ' Confirmar contraseña', NULL, NULL, NULL, 'पासवर्ड की पुष्टि कीजिये', ' Подтвердите Пароль'),
(286, 'confirm_password', 'Confirm Password', ' Confirmar contraseña', NULL, NULL, NULL, 'पासवर्ड की पुष्टि कीजिये', ' Подтвердите Пароль'),
(287, 'first_name', 'First  Name', '', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Имя'),
(288, 'registration_completed_successfully_activation_email_sent', 'Registration Completed Successfully Activation Email Sent', ' Registro completado con éxito la activación Correo electrónico enviado', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Регистрация успешно завершена Активация E-mail Отправлено'),
(289, 'Register As', 'Register As', 'Como registro', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Регистрация Как'),
(290, 'Please select group', 'Please Select Group', 'Por favor seleccione Grupo', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', ' Выберите группу'),
(291, 'Group', 'Group', ' Grupo', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'группа'),
(292, 'your_account_activated_successfully_please_login', 'Your Account Activated Successfully Please Login', ' Su cuenta activado con éxito favor Ingresa', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', NULL),
(293, 'unable_to_login_please_try_again', 'Unable To Login Please Try Again', ' No es posible entrar Inténtelo de nuevo más', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', ' Не могу войти Пожалуйста, попробуйте еще раз'),
(294, 'Made with', 'Made With', ' Hecho con', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Сделано с'),
(295, 'certificates', 'Certificates', ' certificados', NULL, NULL, NULL, 'प्रमाण पत्र', 'Сертификаты'),
(296, 'list_certificates', 'List Certificates', ' Certificados de la lista', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Список сертификатов'),
(297, 'add_certificate', 'Add Certificate', ' Agregar certificado', NULL, NULL, NULL, ' प्रमाणपत्र जोड़ें', ' Добавить сертификат'),
(298, 'Show_Team', 'Show Team', 'Mostrar Equipo', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Показать команды'),
(299, 'Need_admin_approval_for_tutor', 'Need Admin Approval For Tutor', 'Necesidad de aprobación de administrador Para tutor', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Необходимость одобрения администратором Для воспитателя'),
(300, 'Please upload following certificates to procede', 'Please Upload Following Certificates To Procede', 'Por favor Sube Certificados siguiente para el Procede', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Пожалуйста, Вы можете добавить следующие сертификаты Чтобы продолжить'),
(301, 'please select country', 'Please Select Country', ' Por favor seleccione su país', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Пожалуйста, выберите страну'),
(302, 'Landmark', 'Landmark', ' Punto de referencia', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'веха'),
(303, 'Pincode', 'Pincode', ' Código PIN', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Пин-код'),
(304, 'Type of Classes', 'Type Of Classes', ' Tipo de las clases', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Тип классов'),
(305, 'Academic', 'Academic', 'Académico', NULL, NULL, NULL, 'एकेडमिक', 'академический'),
(306, 'Non-academic', 'Non-academic', 'No docente', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', ' Неакадемический'),
(307, 'Share my phone number with customers who are looking for classes I conduct', 'Share My Phone Number With Customers Who Are Looking For Classes I Conduct', ' Comparte Mi número de teléfono con los clientes que están en busca de las clases I Conducta', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Доля мой номер телефона с клиентами, которые ищут классов I поведения'),
(308, 'no_details_available', 'No Details Available', ' No hay datos disponibles', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', ' Нет Подробности Доступные'),
(309, 'Teaching Types', 'Teaching Types', ' Tipos de enseñanza', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', ' Виды обучения'),
(310, 'Certificates uploaded successfully', 'Certificates Uploaded Successfully', ' Certificados cargado correctamente', NULL, NULL, NULL, 'प्रमाण पत्र सफलतापूर्वक अपलोड', ' Сертификаты Загружено Успешно'),
(311, 'online_now', 'Online Now', ' En línea ahora', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Сейчас в сети'),
(312, 'offline_now', 'Offline Now', ' Ahora Desconectado', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Сейчас на форуме'),
(313, 'qualification', 'Qualification', ' Calificación', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Квалификация'),
(314, 'language_of_teaching', 'Language Of Teaching', ' Lengua docente', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Язык преподавания'),
(315, 'years', 'Years', ' Años', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', ' лет'),
(316, 'more_about_me', 'More About Me', ' Más sobre mí', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Больше обо мне'),
(317, 'tutoring_courses', 'Tutoring Courses', ' Cursos de tutoría', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Обучение и курсы'),
(318, 'tutoring_locations', 'Tutoring Locations', ' Ubicaciones de tutoría', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', ' Репетиторство Местоположение'),
(319, 'career_experience', 'Career Experience', ' carrera Experiencia', NULL, NULL, NULL, ' कैरियर के अनुभव', ' Трудовая деятельность'),
(320, 'i_love_tutoring_because', 'I Love Tutoring Because', ' Amo Tutoría Debido', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'I Love Репетиторство Потому что'),
(321, 'other_interests', 'Other Interests', ' otros intereses', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Другие интересы'),
(322, 'my_experience', 'My Experience', ' Mi experiencia', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Мой опыт'),
(323, 'reserve_your_spot', 'Reserve Your Spot', ' Reserve su lugar', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', ' Забронировать место'),
(324, 'start_date', 'Start Date', ' Fecha de inicio', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Дата начала'),
(325, 'no_slots_available', 'No Slots Available.', '', NULL, NULL, NULL, 'अभी बुक करें', 'Нет доступных слотов.'),
(326, 'send_me_your_message', 'Send Me Your Message', ' Enviarme Su Mensaje', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Пришлите мне Ваше сообщение'),
(327, 'request_this_tutor', 'Request This Tutor', ' Este solicitar tutor', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Запрос этот репетитор'),
(328, 'student', 'Student', ' Estudiante', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Студент'),
(329, 'please_select_location', 'Please Select Location', ' Por favor seleccione la ubicación', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', ' Выберите Расположение'),
(330, 'please_select_course', 'Please Select Course', ' Por favor seleccione de golf', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Выберите курс'),
(331, 'click_here_to_send_me_your_message', 'Click Here To Send Me Your Message', ' Haga clic aquí para enviar su mensaje de mí', NULL, NULL, NULL, 'यहाँ क्लिक करें मुझे अपने संदेश भेजने के लिए', ' Нажмите здесь, чтобы послать мне Ваше сообщение'),
(332, 'course_content', 'Course Content', ' Contenido del curso', NULL, NULL, NULL, 'अध्य्यन विषयवस्तु', 'Содержание курса'),
(333, 'invalid_request', 'Invalid Request', ' Solicitud no válida', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'неверный запрос'),
(334, 'please_login_to_book_tutor', 'Please Login To Book Tutor', 'Inicia sesión para reservar tutor', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', ' Пожалуйста, войдите забронировать репетитор'),
(335, 'select_a_course', 'Select A Course', ' Seleccione un curso', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', ' Выберите трассу'),
(336, 'select_preferred_location', 'Select Preferred Location', ' Seleccione Favorito', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', ' Выберите Предпочтительная местность'),
(337, 'select_date', 'Select Date', ' Seleccione fecha', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', ' Выберите дату'),
(338, 'select_time-slot', 'Select Time-slot', ' Elija un intervalo de tiempo', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', ' Выбор временного интервала'),
(339, 'please_select_course_first', 'Please Select Course First', ' Por favor seleccione Primer Curso', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Выберите курс Первый'),
(340, 'write_your_message', 'Write Your Message', ' Escribe tu mensaje', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Написать Ваше сообщение'),
(341, 'please_select_date_on_which_you_want_to_start_the_course', 'Please Select Date,on Which You Want To Start The Course', '', NULL, NULL, NULL, 'अभी बुक करें', 'Пожалуйста, выберите дату, на котором вы хотите, чтобы начать курс'),
(342, 'please_select_time_slot', 'Please Select Time Slot', ' Por favor seleccione Time Slot', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Пожалуйста, выберите временной интервал'),
(343, 'Sub Location for ', 'Sub Location For ', 'Sub Lugar Para', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', ' Расположение к югу Для'),
(344, 'read', 'Read', ' Leer', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Читать'),
(345, 'testimonial', 'Testimonial', ' Testimonial', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'свидетельский'),
(346, 'please_login_to_purchase', 'Please Login To Purchase', ' Inicia sesión para Compra', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', ' Пожалуйста, войдите, чтобы купить'),
(347, 'print', 'Print', ' Impresión', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', ' Распечатать'),
(348, 'please_select_course_and_date_first', 'Please Select Course And Date First', ' Por favor seleccione curso y la fecha Primero', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Выберите курс и даты первых'),
(349, 'your_slot_with_the_tutor_booked_successfully', 'Your Slot With The Tutor Booked Successfully', ' Su ranura con el tutor de reserva con éxito', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', NULL),
(350, 'time_slot_not_available', 'Time Slot Not Available', ' El intervalo de tiempo no disponible', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Время Слот Не Доступный'),
(351, 'Current Password', 'Current Password', ' contraseña actual', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'текущий пароль'),
(352, 'New Password', 'New Password', ' nueva contraseña', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'новый пароль'),
(353, 'please_become_premium_member_to_book_tutor', 'Please Become Premium Member To Book Tutor', 'Por favor Hágase Miembro Premium Para tutor libro', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Пожалуйста Стать Премиум Участник Чтобы забронировать самостоятельно'),
(354, 'experience_desc', 'Experience Desc', ' experiencia descripción', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', ' Опыт Описание изделия'),
(355, 'profile_page_title', 'Profile Page Title', 'Perfil Título', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Профиль Название страницы'),
(356, 'profile updated successfully', 'Profile Updated Successfully', ' Perfil actualizado con éxito', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Профиль успешно обновлен'),
(357, 'phone_code', 'Phone Code', ' Código de teléfono', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Телефонный код'),
(358, 'land_mark', 'Land Mark', ' Punto de referencia', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'веха'),
(359, 'record updated successfully', 'Record Updated Successfully', ' Registro actualizado con éxito', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', ' Запись успешно обновлена'),
(360, 'My Address', 'My Address', ' Mi dirección', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Мой адрес'),
(361, 'password_changed_successfully', 'Password Changed Successfully', ' Contraseña cambiada con éxito', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Пароль успешно изменен'),
(362, 'old_password_is_wrong', 'Old Password Is Wrong', ' Vieja contraseña es incorrecta', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Старый неверный пароль'),
(363, 'Skype Profile', 'Skype Profile', ' Perfil de Skype', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'скайп Профиль'),
(364, 'Skype', 'Skype', 'Skype', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', ' скайп'),
(365, 'send_message', 'Send Message', ' Enviar mensaje', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Отправить сообщение'),
(366, 'Personal Information', 'Personal Information', ' Informacion personal', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Личная информация'),
(369, 'record added successfully', 'Record Added Successfully', ' Registro añadido correctamente', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', ' Запись Успешно добавлен'),
(370, 'record deleted successfully', 'Record Deleted Successfully', ' Registro eliminado con éxito', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Запись успешно удалена'),
(371, 'Prefferd Teaching Type', 'Prefferd Teaching Type', ' Prefferd Tipo Enseñanza', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Предпочтительный тип преподавания'),
(372, 'updated_successfully', 'Updated Successfully', ' Actualizado correctamente', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Успешно Обновлено'),
(373, 'you_have_not_done_any_changes', 'You Have Not Done Any Changes', ' No lo ha hecho ningún Cambios', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', NULL),
(374, 'updated successfully', 'Updated Successfully', ' Actualizado correctamente', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Успешно Обновлено'),
(375, 'Preffered Teaching Type', 'Preffered Teaching Type', ' Preffered Tipo Enseñanza', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Предпочтительный тип преподавания'),
(376, 'Welcome back', 'Welcome Back', ' Dar una buena acogida', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', ' Добро пожаловать назад'),
(377, 'Student Leads', 'Student Leads', 'Ventas de estudiantes', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Студенческие снабжении'),
(378, 'student_leads', 'Student Leads', 'Ventas de estudiantes', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', ' Студенческие снабжении'),
(379, 'Post Requirement', 'Post Requirement', ' Requisito de post', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'сообщение Требование'),
(380, 'please select locaton', 'Please Select Locaton', ' Por favor seleccione Locaton', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', ' Выберите Расположение'),
(381, 'please select location', 'Please Select Location', ' Por favor seleccione la ubicación', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', ' Выберите Расположение'),
(382, 'Tutoring Courses', 'Tutoring Courses', ' Cursos de tutoría', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Обучение и курсы'),
(383, 'Present Status of you', 'Present Status Of You', ' Estado actual de usted', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', ' Современное состояние Вас'),
(384, 'present_status', 'Present Status', ' Estado actual', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', ' Современное состояние'),
(385, 'Priority of Requirement', 'Priority Of Requirement', ' Prioridad de las necesidades', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', ' Приоритет потребности'),
(386, 'Immediately', 'Immediately', ' Inmediatamente', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Немедленно'),
(387, 'After a Week', 'After A Week', ' Despues de una semana', NULL, NULL, NULL, ' एक हफ्ते के बाद', 'После недели'),
(388, 'After A Month', 'After A Month', ' Despues de un mes', NULL, NULL, NULL, 'एक महीने के बाद', 'Через месяц'),
(389, 'Course you want to complete in', 'Course You Want To Complete In', 'Por supuesto que desea completar En', NULL, NULL, NULL, 'बेशक आप में प्रतिस्पर्धा करना चाहता हूँ', 'Конечно, вы хотите, чтобы конкурировать в'),
(390, 'duration_needed', 'Duration Needed', ' duración necesaria', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Продолжительность Необходимое'),
(391, 'Amount You can pay', 'Amount You Can Pay', ' Cantidad que usted puede pagar', NULL, NULL, NULL, ' राशि है जो आप भुगतान कर सकते हैं', 'Сумма Вы можете оплатить'),
(392, 'budget', 'Budget', ' Presupuesto', NULL, NULL, NULL, 'बजट', 'бюджет'),
(393, 'Payment Type', 'Payment Type', ' Tipo de pago', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Способ оплаты'),
(394, 'One Time', 'One Time', ' Una vez', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Один раз'),
(395, 'Hourly', 'Hourly', ' Cada hora', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', ' почасовой'),
(396, 'Month', 'Month', 'Mes', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Месяц'),
(397, 'Requirement Details', 'Requirement Details', ' requisito detalles', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Требование подробности'),
(398, 'requirement_details', 'Requirement Details', ' requisito detalles', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', ' Требование подробности'),
(399, 'You Need Tutor of Course', 'You Need Tutor Of Course', ' Que necesita tutor del Curso', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Вам нужен репетитор для гольфа'),
(400, 'title_of_requirement', 'Title Of Requirement', ' De la exigencia del título', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Название потребности');
INSERT INTO `pre_languagewords` (`lang_id`, `lang_key`, `english`, `spanish`, `bengali`, `french`, `japanese`, `hindi`, `russian`) VALUES
(401, 'present_status_ex:student or employee', 'Present Status Ex:student Or Employee', 'Estado actual Ej: estudiante o empleado', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', ' Современное состояние Ex: студент или сотрудник'),
(402, 'duration_needed_to_complete_course', 'Duration Needed To Complete Course', ' Duración del curso necesario para completar', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Продолжительность, необходимое для завершения курса'),
(403, 'Monthly', 'Monthly', 'Mensual', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'ежемесячно'),
(404, 'location_id', 'Location Id', 'Ubicación Id', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', ' Расположение Id'),
(405, 'course_id', 'Course Id', ' Id curso', NULL, NULL, NULL, 'पाठ्यक्रम आईडी', 'Id курс'),
(406, 'teaching_type_id', 'Teaching Type Id', ' ID del tipo de la enseñanza', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Обучение Идентификатор типа'),
(407, 'priority_of_requirement', 'Priority Of Requirement', ' Prioridad de las necesidades', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', ' Приоритет потребности'),
(408, 'teaching_type', 'Teaching Type', ' Tipo de la enseñanza', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Обучение Тип'),
(409, 'tutory type', 'Tutory Type', ' Tipo Tutory', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'учебник Тип'),
(410, 'view_language', 'View Language', ' Ver idioma', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Просмотр Язык:'),
(411, 'language', 'Language', ' Idioma', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'язык'),
(412, 'operations', 'Operations', 'operaciones', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'операции'),
(413, 'Add Language Words', 'Add Language Words', ' Añadir palabras de la lengua', NULL, NULL, NULL, 'भाषा के शब्दों को जोड़े', 'Добавить слов языка'),
(414, 'add_phrases', 'Add Phrases', ' Añadir frases', NULL, NULL, NULL, 'वाक्यांश जोड़', 'Добавить фразы'),
(415, 'phrase', 'Phrase', ' Frase', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', ' Фраза'),
(416, 'Total Leads', 'Total Leads', ' Ventas totales', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Всего Ведет'),
(417, 'Manage Tutoring Courses', 'Manage Tutoring Courses', ' Manejo de cursos de clases particulares', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', ' Управление Репетиторство Курсы'),
(418, 'Premium Leads', 'Premium Leads', ' Ventas de primera calidad', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', ' Премиум Ведет'),
(419, 'Status closed Leads', 'Status Closed Leads', ' Ventas Estado cerrado', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Статус Закрыто Ведет'),
(420, 'Status Opened Leads', 'Status Opened Leads', ' Ventas de estado abierto', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Статус Открыт Ведет'),
(421, 'Reviews', 'Reviews', 'opiniones', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', ' Отзывы'),
(422, 'select_course', 'Select Course', ' Seleccionar Curso', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Выберите курс'),
(423, 'student_reviews', 'Student Reviews', ' Comentarios de Estudiantes', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', ' Студенческие Отзывы'),
(424, 'net_credits', 'Net Credits', ' Los créditos netos', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Чистые кредиты'),
(425, 'my_subscriptions', 'My Subscriptions', ' mis Suscripciónes', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Мои подписки'),
(426, 'course_fee_in_credits', 'Course Fee In Credits', 'Costo del curso En Créditos', NULL, NULL, NULL, 'क्रेडिट्स में पाठ्यक्रम शुल्क', ' Стоимость курсов в кредитах'),
(427, 'course_name', 'Course Name', 'Nombre del curso', NULL, NULL, NULL, 'कोर्स का नाम', ' Название курса'),
(429, 'fee', 'Fee', 'Cuota', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'плата'),
(430, 'please_select_atleast_one_preferred_location', 'Please Select Atleast One Preferred Location', 'Por favor seleccione Al menos uno Favorito', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', ' Пожалуйста, выберите Atleast Один предпочтительный Расположение'),
(431, 'please_select_atleast_one_preferred_course', 'Please Select Atleast One Preferred Course', 'Por favor seleccione Al menos una vía preferida', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', ' Выберите Atleast Один предпочтительный курс'),
(432, 'not_authorized', 'Not Authorized', 'No autorizado', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Не авторизован'),
(433, 'per_credit_value', 'Per Credit Value', ' Por valor de crédito', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', ' За значение кредита'),
(436, 'Wrong operation', 'Wrong Operation', ' Funcionamiento incorrecto', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Неправильный Операция'),
(437, 'please_login_to_access_this_page', 'Please Login To Access This Page', 'Por favor regístrate para acceder a la página', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Пожалуйста, войдите Для доступа к этой странице'),
(438, 'Batches', 'Batches', ' lotes', NULL, NULL, NULL, 'बैचों', 'Порции'),
(439, 'institue_courses', 'Institue Courses', ' Cursos Institue', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Курсы Институт'),
(440, 'student_enquiries', 'Student Enquiries', ' Las consultas estudiante', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', ' Студенческие запросы'),
(441, 'You have not done any changes', 'You Have Not Done Any Changes', ' No lo ha hecho ningún Cambios', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'вы еще не сделали каких-либо изменений'),
(442, 'institute_batches', 'Institute Batches', ' Instituto lotes', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Институт Порции'),
(443, 'select_tutors', 'Select Tutors', ' Seleccione tutores', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', ' Выберите репетиторы'),
(444, 'student_name', 'Student Name', ' Nombre del estudiante', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Имя ученика'),
(445, 'preferred_commence_date', 'Preferred Commence Date', ' Comenzar preferido Fecha', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Предпочтительные Commence Дата'),
(446, 'course_seeking', 'Course Seeking', ' Buscando por supuesto', NULL, NULL, NULL, 'कोर्स की मांग', 'Знакомлюсь курс'),
(447, 'admin_commission_percentage', 'Admin Commission Percentage  (in Credits)', ' Porcentaje Comisión de administración (en créditos)', NULL, NULL, NULL, ' व्यवस्थापक आयोग प्रतिशत (क्रेडिट्स में)', ' Комиссия администратора в процентах (в кредитах)'),
(449, 'pending', 'Pending', 'Pendiente', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'в ожидании'),
(450, 'update_status_as', 'Update Status As', 'Actualización del estado de Como', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', ' Состояние обновления Как'),
(451, 'the_batch_you_are_trying_to_add_is_already_exists', 'The Batch You Are Trying To Add Is Already Exists', ' El lote que está tratando de añadir es ya existe', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Пакетная Вы пытаетесь добавить уже Exists'),
(452, 'Enrolled_students_list', 'Enrolled Students List', ' Lista de los estudiantes matriculados', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Поступил Список студентов'),
(453, 'inst_enrolled_students', 'Inst Enrolled Students', ' Inst Matriculados Estudiantes', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Inst зачисленных студентов'),
(454, 'Enrolled Students List', 'Enrolled Students List', 'Lista de los estudiantes matriculados', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', ' Поступил Список студентов'),
(455, 'course_duration', 'Course Duration', ' Duración del curso', NULL, NULL, NULL, 'पाठ्यक्रम की अवधि', 'Длительность курса'),
(456, 'tutor_name', 'Tutor Name', 'Nombre tutor', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', ' Репетитор Имя'),
(457, 'Students List', 'Students List', ' Lista de los estudiantes', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', ' Студенты Список'),
(458, 'students_list', 'Students List', ' Lista de los estudiantes', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Студенты Список'),
(459, 'Sbumit', 'Sbumit', ' Sbumit', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Отправить'),
(460, 'initiate_session', 'Initiate Session', 'iniciar Sesión', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Начать сеанс'),
(461, 'change_status', 'Change Status', ' Cambiar Estado', NULL, NULL, NULL, 'अवस्था बदलो', 'Изменить статус'),
(462, 'approve', 'Approve', ' Aprobar', NULL, NULL, NULL, 'मंजूर', 'Одобрить'),
(463, 'duration', 'Duration', ' Duración', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'продолжительность'),
(464, 'select_batch', 'Select Batch', 'Seleccione lote', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Выберите Пакетное'),
(465, 'no_batches_available', 'No Batches Available', 'No hay lotes disponibles', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Нет Порции Доступные'),
(466, 'enrolled_students', 'Enrolled Students', ' Los estudiantes inscritos', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'зачисленных студентов'),
(467, 'my_batches', 'My Batches', ' Mis lotes', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Мои Порции'),
(468, 'batches_list', 'Batches List', ' Lista de lotes', NULL, NULL, NULL, 'बैचों सूची', 'Список Порции'),
(469, 'select_course_offering_location', 'Select Course Offering Location', ' Seleccionar Curso de Oferta Ubicación', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', ' Выберите предложение курса Расположение'),
(470, 'Need_admin_approval_for_tutor_certificates', 'Need Admin Approval For Tutor Certificates', ' Necesidad de aprobación de administrador para los certificados de los tutores', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Необходимость одобрения администратором Для преподавателем сертификации'),
(471, 'Admin_Commission_For_A_Booking_', 'Admin Commission For A Booking ', ' Comisión de administración para una reserva', NULL, NULL, NULL, ' आरक्षण के लिए व्यवस्थापक आयोग', 'Администратор Комиссия при бронировании'),
(472, 'Admin_Intervention_Charges_in_credits', 'Admin Intervention Charges In Credits', ' Cargos de la intervención del administrador de creditos', NULL, NULL, NULL, ' व्यवस्थापक हस्तक्षेप प्रभार क्रेडिट्स में', 'Действия администратора Вмешательство Обвинения в кредитах'),
(473, 'Minimum_Credits_for_Premium_Tutor', 'Minimum Credits For Premium Tutor', ' Créditos mínimos Paid tutor', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Минимальные кредиты для премиум самостоятельно'),
(474, 'Minimum_Credits_for_Premium_Student', 'Minimum Credits For Premium Student', 'Créditos mínimos para el estudiante de primera calidad', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', ' Минимальные кредиты для премиум студента'),
(475, 'Credits_for_viewing_message', 'Credits For Viewing Message', 'Créditos para la visualización de mensajes', NULL, NULL, NULL, 'देखने के लिए क्रेडिट संदेश', ' Кредиты за просмотр сообщение'),
(476, 'Currency_Symbol', 'Currency Symbol', ' Símbolo de moneda', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Символ валюты'),
(477, 'tutor_batchs_list', 'Tutor Batchs List', ' Lista batchs tutor', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्सलेनदेन इतिहास क्रेडिट्स', 'Список Tutor партии'),
(478, 'view_batches', 'View Batches', 'Ver los lotes', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', ' Просмотр Порции'),
(479, 'tutor_batch_student_list', 'Tutor Batch Student List', 'Lista de lotes tutor del estudiante', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Репетитор список партии студент'),
(480, 'approve_tutor', 'Approve Tutor', ' aprobar tutor', NULL, NULL, NULL, 'अध्यापक स्वीकृत', 'Утвердить Tutor'),
(481, 'tutor_approved_successfully', 'Tutor Approved Successfully', ' Aprobado tutor con éxito', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Репетитор Approved успешно'),
(482, 'is_approved', 'Is Approved', ' Esta aprobado', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Одобрено'),
(483, 'you_have_already_posted_the_same_requirement', 'You Have Already Posted The Same Requirement', ' Usted ya ha Publicada el mismo requisito', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', NULL),
(484, 'cancel_approvement', 'Cancel Approvement', ' Cancelar approvement', NULL, NULL, NULL, 'रद्द ', 'Отменить утверждении'),
(485, 'approvement_status_changed_successfully', 'Approvement Status Changed Successfully', ' Approvement ha cambiado de estado con éxito', NULL, NULL, NULL, ' स्थिति सफलतापूर्वक परिवर्तित', ' Статус изменен утверждении Успешно'),
(486, 'last_updated', 'Last Updated', ' Última actualización', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Последнее обновление'),
(487, 'location_name', 'Location Name', 'Nombre del lugar', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Название местоположения'),
(488, 'users_information', 'Users Information', ' Información de los usuarios', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Пользователи информация'),
(489, 'user_type', 'User Type', ' Tipo de usuario', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Тип пользователя'),
(490, 'all_users_list', 'All Users List', ' Listado de todos los usuarios', NULL, NULL, NULL, 'सभी सदस्यों की सूची', 'Все Список пользователей'),
(491, 'phone_number', 'Phone Number', 'Número de teléfono', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', ' Номер телефона'),
(492, 'approved', 'Approved', ' Aprobado', NULL, NULL, NULL, 'मंजूर की', 'утвержденный'),
(493, 'session_initiated', 'Session Initiated', ' sesión Iniciada', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'сессия Начатое'),
(494, 'running', 'Running', ' Corriendo', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Бег'),
(495, 'completed', 'Completed', ' Terminado', NULL, NULL, NULL, 'पूरा कर लिया है', 'Завершенный'),
(496, 'claim_for_admin_intervention', 'Claim For Admin Intervention', ' Reclamación por la intervención del administrador', NULL, NULL, NULL, 'दावा व्यवस्थापक हस्तक्षेप के लिए', 'Заявление для администратора вмешательства'),
(497, 'closed', 'Closed', 'Cerrado', NULL, NULL, NULL, 'बन्द है', 'Закрыто'),
(498, 'enquiries', 'Enquiries', 'Consultas', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'запросы'),
(499, 'course_booked', 'Course Booked', ' curso Reservados', NULL, NULL, NULL, 'कोर्स बुक', 'Курсы В...'),
(500, 'student_leads_details', 'Student Leads Details', ' Estudiante Conductores de detalles', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Студент ведет Подробнее'),
(501, 'name', 'Name', ' Nombre', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'имя'),
(502, 'description', 'Description', 'Descripción', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Описание'),
(503, 'preffered_teaching_type', 'Preffered Teaching Type', ' Preffered Tipo Enseñanza', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Предпочтительный тип преподавания'),
(504, 'please_login_to_see_lead_details', 'Please Login To See Lead Details', ' Por favor, regístrate para ver los detalles de plomo', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', ' Пожалуйста, войдите, чтобы увидеть детализирует'),
(505, 'package_cost', 'Package Cost', 'Costo del paquete', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Стоимость пакета'),
(506, 'information', 'Information', ' Información', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Информация'),
(507, 'you_will_be_charged', 'You will be charged\r\n', ' se te cobrará', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', NULL),
(509, 'total_subscribe', 'Total Subscribe', ' total Suscribirse', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', ' Итого Подписка'),
(510, 'age', 'Age', ' Años', NULL, NULL, NULL, ' आयु', 'Возраст'),
(514, 'called_for_admin_intervention', 'Called for admin intervention', ' Llamado para la intervención del administrador', NULL, NULL, NULL, 'व्यवस्थापक हस्तक्षेप का आह्वान', 'Вызывается для вмешательства администратора'),
(515, 'not_yet_verified', 'Not yet verified', ' Todavía no se ha verificado', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Пока не подтверждено'),
(516, 'last_verified:', 'Last verified:', ' Última verificado:', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', NULL),
(517, 'your_profile_description', 'Your profile description', ' Su descripción de perfil', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', NULL),
(518, 'profile_description', 'Profile description', ' Descripción del perfil', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Профиль описание'),
(519, 'experience_description', 'Experience description', ' DESCRIPCIÓN DE LA eXPERIENCIA', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'описание Опыт работы'),
(520, 'frequently_asked_questions', 'Frequently asked questions', ' Preguntas frecuentes', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Часто задаваемые вопросы'),
(521, 'FAQs', 'FAQs', 'Preguntas frecuentes', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Кинофильмы'),
(522, 'please', 'Please', 'Por favor', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'пожалуйста'),
(523, 'as_tutor_to_view_the_details', 'As tutor to view the details', ' Como tutor para ver los detalles', NULL, NULL, NULL, 'शिक्षक के रूप में विवरण देखने के लिए।', 'в качестве наставника для просмотра деталей.'),
(524, 'page_title', 'Page title', 'Título de la página', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', ' Заголовок страницы'),
(525, '_as_tutor_to_view_the_details', ' as tutor to view the details', ' como tutor para ver los detalles', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', NULL),
(526, 'as_tutor_to_view_the_details', ' as tutor to view the details.', '', NULL, NULL, NULL, 'शिक्षक के रूप में विवरण देखने के लिए।', 'в качестве наставника для просмотра деталей.'),
(528, 'premium_user', 'Premium user', ' usuario premium', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', ' Премиум пользователь'),
(529, 'preferred_location', 'Preferred location', 'Ubicación preferida', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Предпочтительное Местоположение'),
(530, 'students_present_status', 'Student\'s present status', '', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Нынешний статус студента'),
(531, 'budget_type', 'Budget type', ' tipo de presupuesto', NULL, NULL, NULL, 'बजट प्रकार', 'Тип бюджета'),
(532, 'Meta_Keyword', 'Meta Keyword', ' meta de palabras clave', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'мета ключевых слов'),
(533, 'Meta_Description', 'Meta Description', ' Metadescripción', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'метаописание'),
(534, 'Site_Description', 'Site Description', 'descripción del lugar', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', ' описание сайта'),
(535, 'Google_Analytics', 'Google Analytics', ' Google analitico', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Гугл Аналитика'),
(536, 'tutors_system', 'Tutors system', 'sistema de tutores', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'система репетиторы'),
(538, 'credits_required_to_become_premium_member: ', 'Credits required to become premium member: ', ' Créditos necesarios para convertirse en miembro de la prima:', NULL, NULL, NULL, ' क्रेडिट प्रीमियम सदस्य बनने के लिए आवश्यक:', 'Кредиты должны стать премиум-членом:'),
(544, 'export', 'Export', ' Exportar', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'экспорт'),
(545, 'no_tutors_available', 'No tutors available', ' No Institutos de ayuda disponibles', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Нет в наличии наставники'),
(546, 'Find Institute', 'Find Institute', ' Encuentra Instituto', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Найти институт'),
(547, 'Minimum_Credits_for_Premium_Institute', 'Minimum Credits for Premium Institute', ' Créditos mínimos para Instituto de primera calidad', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Минимальные кредиты для премиум института'),
(548, 'Time_Zone', 'Time Zone', 'Zona horaria', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Часовой пояс'),
(549, 'Credits_for_viewing_lead_details', 'Credits for viewing lead details', ' Créditos para la visualización de detalles de plomo', NULL, NULL, NULL, 'नेतृत्व विवरण देखने के लिए क्रेडिट', 'Кредиты для просмотра сведений о счете'),
(550, 'Please upload following certificates to proceed', 'Please upload following certificates to proceed', ' Por favor, sube después de los certificados de proceder', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Пожалуйста, Вы можете добавить следующие сертификаты Чтобы продолжить'),
(551, 'Experiance Duration', 'Experiance Duration', ' Duración experiance', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Опыт Продолжительность'),
(552, 'experiance_duration', 'Experiance duration', ' duración experiance', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'продолжительность опыта'),
(553, 'Duration Type', 'Duration Type', ' Tipo duración', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Тип Продолжительность'),
(554, 'Establishment Year', 'Establishment Year', ' establecimiento Año', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Создание года'),
(555, 'experiance_duration Ex: 4 ', 'Experiance duration Ex: 4 ', ' duración Experiance Ex: 4', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Продолжительность опыта Пример: 4'),
(556, 'present_status:', 'Present status:', ' Estado actual:', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', ' Современное состояние:'),
(557, 'qualification:', 'Qualification:', ' Calificación:', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Квалификация:'),
(558, 'view_details', 'View details', 'Ver detalles', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', ' Посмотреть детали'),
(559, 'experience:', 'Experience:', 'Experiencia:', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Опыт:'),
(560, 'view_profile', 'View profile', 'Ver perfil', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', ' Просмотреть профиль'),
(561, 'institutes_not_available', 'Institute(s) not available.', '', NULL, NULL, NULL, 'अभी बुक करें', 'Институт (ы) не доступен.'),
(562, 'account_information_successfully_updated', 'Account information successfully updated', ' La información de cuenta actualizado correctamente', NULL, NULL, NULL, ' खाता जानकारी सफलतापूर्वक अद्यतन', 'Информация об учетной записи успешно обновлен'),
(563, 'established', 'Established', ' Establecido', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'установленный'),
(564, 'website', 'Website', 'Sitio web', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Веб-сайт'),
(565, 'year_of_establishment', 'Year of establishment', ' Año de establecimiento', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Год основания'),
(566, 'free_demo:', 'Free demo:', ' Prueba gratis:', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Бесплатный Демо:'),
(567, 'you_do_not_have_enough_credits_to_view_the_lead_details', 'You don\'t have enough credits to view the lead details.', '', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', NULL),
(568, 'get_credits_here', 'Get credits here.', '', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', ' получить кредиты здесь.'),
(569, 'get_credits_here', ' get credits here.', '', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', ' получить кредиты здесь.'),
(570, 'student_enrolled_courses', 'Student enrolled courses', ' cursos de estudiantes matriculados', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', ' Студенческие курсы зачислены'),
(571, 'institute_name', 'Institute name', 'Nombre del Instituto', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Название института'),
(572, 'tutors_not_available', 'Tutor(s) not available.', '', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Тьютор (ы) не имеется.'),
(573, 'more_details', 'More details', ' Más detalles', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Подробнее'),
(574, 'institute_offered_courses', 'Institute offered courses', ' Instituto ofreció cursos', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Институт предложил курсы'),
(575, 'institute_tutoring_locations', 'Institute tutoring locations', 'ubicaciones de tutoría Institute', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Места репетиторство институт'),
(576, 'reserve_your_slot', 'Reserve your slot', ' Reserve su ranura', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Забронируйте свой слот'),
(577, 'select_course_first', 'Select course first', ' Seleccione curso de primeros', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Выберите курс первой'),
(578, 'username', 'Username', ' Nombre de usuario', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', ' Имя пользователя'),
(579, 'time_slot', 'Time slot', 'El intervalo de tiempo', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Временной интервал'),
(580, 'course_offering_location', 'Course offering location', ' ubicación oferta de cursos', NULL, NULL, NULL, 'पाठ्यक्रम की पेशकश स्थान', 'месте и предлагает курс'),
(581, 'batch_start_date', 'Batch start date', 'Lotes fecha de inicio', NULL, NULL, NULL, 'बैच शुरू करने की तारीख', 'Пакетная дата начала'),
(582, 'batch_end_date', 'Batch end date', ' Lotes fecha de finalización', NULL, NULL, NULL, 'बैच के अंत की तारीख', 'Пакетная дата окончания'),
(583, 'days_off', 'Days off', ' Días de descanso', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Выходные дни'),
(584, 'batch_max_strength', 'Batch max strength', ' Lotes fuerza máxima', NULL, NULL, NULL, 'बैच अधिकतम शक्ति', 'Пакетная максимальная прочность'),
(585, 'the_user_name_is_not_available', 'The user name is not available', ' El nombre de usuario no está disponible', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', ' Имя пользователя не доступен'),
(586, 'batch_code', 'Batch code', ' Código de lote', NULL, NULL, NULL, 'बैच कोड', 'Код партии'),
(587, 'Bookings', 'Bookings', ' reservas', NULL, NULL, NULL, 'बुकिंग', 'Бронирование'),
(588, 'student_bookings', 'Student bookings', ' las reservas de los estudiantes', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', ' бронирование Student'),
(589, 'certificate_type', 'Certificate type', 'Tipo de certificado', NULL, NULL, NULL, 'प्रमाणपत्र का प्रकार', 'Тип сертификата'),
(590, 'view_certificates', 'View certificates', 'Ver certificados', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Просмотр сертификатов'),
(591, 'institute_offering_courses', 'Institute offering courses', ' que ofrece cursos de instituto', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Институт предлагают курсы'),
(592, 'tutoring_locations_of_institute', 'Tutoring locations of institute', ' Tutoría lugares de instituto', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Репетиторы расположения института'),
(593, 'Need_admin_approval_for_institute', 'Need admin approval for institute', ' Necesitará la aprobación del administrador para el instituto', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Необходимость одобрения администратором для института'),
(594, 'paypal_email_id', 'Paypal email id', 'Paypal correo electrónico de identificación', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'PayPal электронный идентификатор'),
(595, 'bank_account_details', 'Bank account details', 'detalles de cuenta bancaria', NULL, NULL, NULL, 'बैंक खाता विवरण', 'детали банковского счета'),
(596, 'bank_ac_details', 'Bank ac details', 'Datos bancarios ac', NULL, NULL, NULL, 'बैंक एसी विवरण', 'Банковские реквизиты переменного тока'),
(597, 'money_conversion_request_from_tutor', 'Money conversion request from tutor', ' solicitud de conversión dinero de tutor', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Конвертация денежных средств Форма запроса Репетитор'),
(598, 'close', 'Close', ' Cerca', NULL, NULL, NULL, 'बंद करे', 'Закрыть'),
(599, 'money_conversion_request_from_institute', 'Money conversion request from institute', ' solicitud de conversión dinero de instituto', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', ' Запрос Конвертация средств из института'),
(600, 'tutor_money_request', 'Tutor money request', 'solicitud de dinero tutor', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Запрос Tutor деньги'),
(601, 'institute_money_request', 'Institute money request', ' solicitud de dinero Instituto', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Запрос Институт денег'),
(602, 'moneyconversion-for-tutor', 'Moneyconversion-for-tutor', ' Moneyconversion-para-tutor', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Деньги Конверсия-для-воспитателя'),
(603, 'moneyconversion-for-tutor-pending', 'Moneyconversion-for-tutor-pending', ' Moneyconversion-para-tutor en trámite', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Деньги Конверсия-для-репетитор находящейся на рассмотрении'),
(604, 'moneyconversion_for_institute_done', 'Moneyconversion for institute done', ' Moneyconversion de instituto de hecho', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Деньги для преобразования института сделал'),
(605, 'moneyconversion_for_institute_pending', 'Moneyconversion for institute pending', ' Moneyconversion de instituto pendiente', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Деньги для преобразования института неурегулированных'),
(606, 'moneyconversion_for_institute_completed', 'Moneyconversion for institute completed', ' Moneyconversion de instituto completó', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Деньги для преобразования института завершен'),
(607, 'moneyconversion_for_tutor_pending', 'Moneyconversion for tutor pending', ' Moneyconversion de tutor pendiente', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Деньги для преобразования Репетитор неурегулированных'),
(608, 'moneyconversion_for_tutor_completed', 'Moneyconversion for tutor completed', ' Moneyconversion de tutor completó', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Деньги преобразования для воспитателя завершен'),
(609, 'add_options', 'Add options', ' Añadir opciones', NULL, NULL, NULL, ' विकल्प जोड़ें', ' Добавление параметров'),
(610, 'add_degree', 'Add degree', 'Añadir grado', NULL, NULL, NULL, ' डिग्री जोड़े', 'Добавить степень'),
(611, 'Email_Activation_YesNo', 'Email Activation YesNo', ' Correo electrónico de activación YesNo', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'E-mail Активация Да Нет'),
(612, 'Track_Login_IP_Address_YesNo', 'Track Login IP Address YesNo', 'YesNo dirección de pista de sesión IP', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Трек Войти IP-адрес Да Нет'),
(613, 'Max_Login_Attempts', 'Max Login Attempts', 'Max intentos de conexión', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Макс Вход Попытки'),
(614, 'Lockout_Time_milliseconds', 'Lockout Time milliseconds', ' milisegundos de tiempo de bloqueo', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Время блокировки миллисекунды'),
(615, 'bttle', 'Bttle', ' bttle', NULL, NULL, NULL, 'लड़ाई', 'Боевой'),
(616, 'update_status', 'Update status', ' Estado de actualización', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Обновить состояние'),
(617, 'booking_status', 'Booking status', ' Estado de la reservación', NULL, NULL, NULL, 'बुकिंग स्थिति', ' статус бронирования'),
(618, 'Google', 'Google', 'google', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Google'),
(619, 'Instagram', 'Instagram', ' Instagram', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Instagram'),
(620, 'Youtube', 'Youtube', 'Youtube', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', NULL),
(621, 'Sharethis_Header', 'Sharethis Header', ' Cabecera sharethis', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Доля этого заголовка'),
(622, 'Sharethis_Links', 'Sharethis Links', ' Enlaces sharethis', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Поделись Ссылки'),
(623, 'From_No', 'From No', ' De n', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'От Нет'),
(624, 'API_Id', 'API Id', ' API Id', NULL, NULL, NULL, 'एपीआई आईडी', 'Идентификатор API'),
(625, 'Account_SID', 'Account SID', 'cuenta SID', NULL, NULL, NULL, ' खाता ', 'Счет SID'),
(626, 'Auth_Token', 'Auth Token', ' auth Token', NULL, NULL, NULL, 'प्रमाणीकरण टोकन', 'Auth Токен'),
(627, 'API_Version', 'API Version', ' La versión de la API', NULL, NULL, NULL, 'एपीआई संस्करण', 'Версия API'),
(628, 'Twilio_Phone_Number', 'Twilio Phone Number', ' Twilio número de teléfono', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Twilio Номер телефона'),
(629, 'view_batche_list', 'View batche list', ' Ver la lista batche', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Просмотреть список партии'),
(630, 'no_leads_available', 'No lead(s) available.', '', NULL, NULL, NULL, 'अभी बुक करें', 'Нет новых потенциальных клиентов) доступны.'),
(631, 'no_course_details_found', 'No course details found', 'No se encontraron detalles del curso', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', ' Нет курсов детали не найдено'),
(632, 'teaches', 'Teaches', ' enseña', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Преподает'),
(633, 'teaches:', 'Teaches:', ' enseña:', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Преподает:'),
(634, 'Institute Name', 'Institute Name', ' nombre del Instituto', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Название института'),
(635, 'book_now', 'Book now', ' Reservar ahora', NULL, NULL, NULL, 'अभी बुक करें', 'Забронируйте сейчас'),
(636, 'View Profile', 'View Profile', 'Ver perfil', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Просмотреть профиль'),
(637, 'Book Now', 'Book Now', ' Reservar ahora', NULL, NULL, NULL, 'अभी बुक करें', 'Забронируйте сейчас'),
(638, 'Start_Course', 'Start Course', ' Inicio del curso', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Начало курса'),
(639, 'Login Here', 'Login Here', ' Entre aquí', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Авторизация'),
(640, 'invalid location', 'Invalid location', 'Locación invalida', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Неверное расположение'),
(641, 'admin_commission_percentage_with_credits', 'Admin commission percentage  (with credits)', '', NULL, NULL, NULL, 'व्यवस्थापक आयोग प्रतिशत (क्रेडिट्स में)', 'комиссия администратора процент (кредиты)'),
(642, 'from_email', 'From email', ' Desde el e-mail', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'От электронной почты'),
(643, 'course_completed', 'Course completed', ' curso completado', NULL, NULL, NULL, 'कोर्स पूरा', 'курс завершен'),
(644, 'please_update_profile', 'Please update profile', ' Por favor, actualice el perfil', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Необходимо обновить профиль'),
(645, 'enroll_Now', 'Enroll Now', 'Enlístate ahora', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Запишитесь сейчас'),
(646, 'please_update_your_profile_by_adding_tutoring_courses_and_preferred_teaching_types_to_avail_for_students', 'Please update your profile by adding tutoring courses and preferred teaching types to avail for students', ' Por favor, actualice su perfil añadiendo cursos de clases particulares y preferidas enseñanza de tipos para hacer uso de los estudiantes', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Пожалуйста, обновите свой профиль, добавляя репетиторство курсы и предпочитали учить типы пользоваться для студентов'),
(647, 'please_update_your_profile_by_adding_preferred_courses_and_preferred_teaching_types_to_get_tutors', 'Please update your profile by adding preferred courses and preferred teaching types to get tutors', 'Por favor, actualice su perfil añadiendo cursos preferidos y tipos de enseñanza preferidas para conseguir tutores', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Пожалуйста, обновите свой профиль, добавляя предпочтительные курсы и предпочтительные виды обучения, чтобы получить репетиторов'),
(648, 'teaching_experience', 'Teaching experience', ' Experiencia en la enseñanza', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Опыт преподавания'),
(649, 'certificates_of', 'Certificates of "', '', NULL, NULL, NULL, 'एक शिक्षक के रूप में', 'Сертификаты'),
(650, 'view_institute_tutors', 'View institute tutors', ' Ver tutores instituto', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Просмотр института наставники'),
(651, 'institute_tutors_of', 'Institute tutors of"', '', NULL, NULL, NULL, 'अभी बुक करें', 'Институт наставники "'),
(652, 'scroll_News', 'Scroll News', 'Noticias de desplazamiento', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', ' Свиток Новости'),
(653, 'terms_And_Conditons', 'Terms And Conditons', ' Términos y condiciones', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Условия и положения'),
(654, 'student_name : Phone_Num', 'Student name : Phone Num', ' Nombre del Estudiante: Teléfono Num', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', NULL),
(655, 'tutor_name : Phone_Num', 'Tutor name : Phone Num', 'Nombre del tutor: Teléfono Num', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', NULL),
(656, 'student_name - Phone_Num', 'Student name - Phone Num', ' El nombre del estudiante - Teléfono Num', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', ' Имя Student - Телефон Num'),
(657, 'tutor_name - Phone_Num', 'Tutor name - Phone Num', ' Nombre del tutor - Teléfono Num', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', NULL),
(658, 'course_Subscribed', 'Course Subscribed', ' curso suscrito', NULL, NULL, NULL, 'कोर्स सदस्यता लिया', 'курс подпиской'),
(659, 'enroll_to_this_batch', 'Enroll to this batch', ' Inscribirse a este lote', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Запишитесь к этой партии'),
(660, 'You do not have permission to access this page', 'You don\'t have permission to access this page', '', NULL, NULL, NULL, 'अभी बुक करें', 'У вас нет разрешения на доступ к этой странице'),
(661, 'list', 'List', ' Lista', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Список'),
(662, 'packages_Subscribe_Details', 'Packages Subscribe Details', ' Paquetes Suscribirse detalles', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Пакеты Подписаться Подробности'),
(663, 'of_packages_Subscribe_Details', 'Of packages Subscribe Details', 'De paquetes Suscribirse detalles', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Пакетов Подписаться Подробности'),
(664, 'tutor_System', 'Tutor System', 'Sistema tutor', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Репетитор системы'),
(665, 'Preferred Location', 'Preferred Location', ' ubicación preferida', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Предпочтительное Местоположение'),
(666, 'Course Seeking', 'Course Seeking', 'Buscando por supuesto', NULL, NULL, NULL, 'कोर्स की मांग', 'Знакомлюсь курс'),
(667, 'Preferred Teaching type', 'Preferred Teaching type', 'Tipo de Enseñanza preferido', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Предпочтительный тип преподавания'),
(668, 'Your Present Status', 'Your Present Status', 'Su Presente Estado', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', NULL),
(669, 'manage-courses', 'Manage-courses', ' Administrar-cursos', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', ' Управление-курсы'),
(670, 'sublocations', 'Sublocations', ' Sublocaitons', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Суб места'),
(672, 'sub_locations', 'Sub locations', 'ubicaciones sub', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्सलेनदेन इतिहास क्रेडिट्स', 'Суб места'),
(674, 'package_cost_after_discount', 'Package cost after discount', ' costo del paquete después del descuento', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Стоимость пакета после скидки'),
(675, 'enroll_in_this_batch', 'Enroll in this batch', ' Inscribirse en este lote', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Запишитесь в этом пакете'),
(676, 'please_select_batch', 'Please select batch', ' Por favor, seleccione por lotes', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Пожалуйста, выберите партию'),
(677, 'send_us_your_message', 'Send us your message', ' Envíenos su mensaje', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Отправить нам сообщение'),
(678, 'General_Inquiries', 'General Inquiries', ' Consultas generales', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Общие запросы'),
(679, 'Media_Requests', 'Media Requests', ' Las solicitudes de los medios', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Медиа-запросы'),
(680, 'Offline_Support', 'Offline Support', ' Soporte en línea', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Поддержка в автономном режиме'),
(681, 'Account_Type', 'Account Type', ' Tipo de cuenta', NULL, NULL, NULL, ' खाते का प्रकार', 'тип аккаунта'),
(682, 'credits_Transactions_History', 'Credits Transactions History', ' Créditos Transacciones Historia', NULL, NULL, NULL, 'क्रेडिट लेनदेन इतिहास', ' Кредиты Сделки История'),
(683, 'user_credit_transactions', 'User credit transactions', ' operaciones de crédito del usuario', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', ' кредитные операции пользователя'),
(684, 'credits_Transaction_History', 'Credits Transaction History', ' Créditos historial de transacciones', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', ' Кредиты История транзакций'),
(685, 'Ratings', 'Ratings', ' calificaciones', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Рейтинг'),
(686, 'your_seo_keywords_description', 'Your seo keywords description', 'Su descripción palabras clave de SEO', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', NULL),
(687, 'seo_keywords_description', 'Seo keywords description', ' Descripción palabras clave Seo', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', ' Описание Seo ключевые слова'),
(688, 'meta_keywords_description', 'Meta keywords description', ' Descripción Meta palabras clave', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Описание Мета ключевые слова'),
(689, 'no_courses_available', 'No courses available', ' No hay cursos disponibles', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', ' Нет доступных курсов'),
(690, 'you_do not_have_enough_credits_to_enroll_in_the_institute_Please_get_required_credits_here', 'You don\'t have enough credits to enroll in the institute. Please get required credits here', '', NULL, NULL, NULL, NULL, NULL),
(691, 'your_slot_with_booked_successfully_Once_isntitute_approved_your_booking and_tutor_initiated_the_session_you_can_start_the_course_on_course_starting_date', 'Your slot with booked successfully. Once isntitute approved your booking and tutor initiated the session, you can start the course on course starting date.', '', NULL, NULL, NULL, 'अभी बुक करें', NULL),
(692, 'duration_needed_to_complete_course_in', 'Duration needed to complete course in', ' Duración necesario para completar curso de', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Продолжительность, необходимое для завершения курса в'),
(694, 'Credits You can pay', 'Credits You can pay', ' Puede pagar créditos', NULL, NULL, NULL, 'क्रेडिट आप भुगतान कर सकते हैं', ' Кредиты Вы можете оплатить'),
(695, 'your requirement posted successfully', 'Your requirement posted successfully', 'Su requisito se ha publicado correctamente', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', NULL),
(697, 'please_become_premium_member_to_enroll_in_institute', 'Please become premium member to enroll in institute', ' Por favor, convertido en miembro de la prima para inscribirse en el instituto', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', ' Пожалуйста, стать членом премиум, чтобы поступить в институт'),
(698, 'slot_not_available_in_the_batch._Please_select_other_batch', 'Slot not available in the batch. Please select other batch', '', NULL, NULL, NULL, NULL, NULL),
(699, 'non_premium_user', 'Non premium user', ' usuario no premium', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Номера для пользователя премиум'),
(700, 'your_meta_seo_keywords', 'Your meta seo keywords', ' Sus meta palabras clave de SEO', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', NULL),
(701, 'meta_seo_keywords', 'Meta seo keywords', ' palabras clave de SEO Meta', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Мета ключевые слова поисковая оптимизация'),
(702, 'refund_credits_to_student', 'Refund credits to student', ' créditos de reembolso a los estudiantes', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', ' Возврат кредитов студента'),
(703, 'refund_credits_to_tutor', 'Refund credits to tutor', ' Restitución acredita para dar clases', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Возврат кредитов к репетитору'),
(704, 'please_login_to_enroll_in_institute', 'Please login to enroll in institute', ' Inicia sesión para inscribirse en el instituto', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Пожалуйста, войдите, чтобы поступить в институт'),
(705, 'tranfer_credits_to_tutor', 'Tranfer credits to tutor', ' Tranfer acredita para dar clases', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Передача кредитов куратору'),
(706, 'send_credit_conversion_request', 'Send credit conversion request', 'Enviar solicitud de conversión de crédito', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Отправить запрос кредитной конверсии'),
(708, 'send_credits_conversion_request', 'Send credits conversion request', ' Enviar solicitud de conversión créditos', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Отправить запрос КРЕДИТЫ преобразования'),
(709, 'please_select_atleast_one_preferred_teaching_type', 'Please select atleast one preferred teaching type', 'Por favor, seleccione al menos un tipo de enseñanza preferida', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', ' Пожалуйста, выберите один по крайней мере предпочтительный тип преподавания'),
(710, 'please login to access this page', 'Please login to access this page', ' Por favor regístrate para acceder a la página', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', ' Пожалуйста, войдите, чтобы открыть эту страницу'),
(711, 'Update Booking status', 'Update Booking status', 'Actualizar el estado de reserva', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', ' Обновить статус бронирования'),
(712, 'View Booking details', 'View Booking details', 'Ver detalles de la reservación', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', ' Просмотреть детали Бронирование'),
(713, 'Please complete your course to send credit conversion request', 'Please complete your course to send credit conversion request', ' Por favor, complete su curso para enviar solicitud de conversión del crédito', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', ' Заполните, пожалуйста, свой курс, чтобы отправить запрос кредитной конверсии'),
(714, 'Invalid request', 'Invalid request', ' Solicitud no válida', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Неверный запрос'),
(715, 'Money Conversion Request', 'Money Conversion Request', ' Solicitud de conversión de dinero', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', ' Деньги преобразования Запрос'),
(716, 'Done', 'Done', ' Hecho', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Готово'),
(718, 'moneyconversion_for_institute \\"pending\\"', 'Moneyconversion for institute \\"pending\\"', '', NULL, NULL, NULL, NULL, NULL),
(720, 'moneyconversion_for_institute pending', 'Moneyconversion for institute pending', ' Moneyconversion de instituto pendiente', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Деньги для преобразования института неурегулированных'),
(721, 'Credits to Money conversion request sent successfully', 'Credits to Money conversion request sent successfully', ' Créditos a solicitud de conversión dinero enviado con éxito', NULL, NULL, NULL, 'मनी रूपांतरण अनुरोध करने के लिए क्रेडिट सफलतापूर्वक भेजा', 'Кредиты на запрос конвертации денег успешно отправлено'),
(722, 'you_don\'t_have_enough_credits_to_book_the_tutor._Please_get_required_credits_here', 'You don\'t have enough credits to book the tutor. Please get required credits here', '', NULL, NULL, NULL, NULL, NULL),
(723, 'credit_conversion_requests', 'Credit conversion requests', ' las solicitudes de conversión de crédito', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Запросы кредитной конверсии'),
(724, 'total_Amount', 'Total Amount', ' Cantidad total', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Итого'),
(725, 'Please verify and upload required certificates.', 'Please verify and upload required certificates.', '', NULL, NULL, NULL, NULL, NULL),
(726, 'credits_History', 'Credits History', ' créditos Historia', NULL, NULL, NULL, 'क्रेडिट हिस्ट्री', 'Кредиты История'),
(727, 'credits_Transactions', 'Credits Transactions', 'créditos Transacciones', NULL, NULL, NULL, 'क्रेडिट लेनदेन', 'Кредиты Сделки'),
(728, 'Already sent the request And status of the payment is', 'Already sent the request. And status of the payment is ', '', NULL, NULL, NULL, 'अभी बुक करें', ' Уже послал запрос. И статус платежа'),
(730, 'fancybox', 'Fancybox', 'Caja lujosa', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', ' Необычные коробки'),
(731, 'Please select a type', 'Please select a type', 'Por favor seleccione un tipo de', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Пожалуйста, выберите тип'),
(732, 'view_Batch_list', 'View Batch list', ' Ver la lista de lotes', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Просмотреть список партии'),
(733, 'student_list', 'Student list', ' lista de alumnos', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', ' список студент'),
(734, 'Course Name', 'Course Name', ' Nombre del curso', NULL, NULL, NULL, 'कोर्स का नाम', 'Название курса'),
(735, 'Student Name', 'Student Name', ' Nombre del estudiante', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Имя ученика'),
(736, 'Enable_Initiate_Session_Option_Before_Minutes', 'Enable Initiate Session Option Before Minutes', ' Habilitar la opción Iniciar Sesión Antes Minutos', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Enable Инициировать Session Option перед минутами'),
(737, 'Enable_Course_Completed_Option_Before_Minutes', 'Enable Course Completed Option Before Minutes', ' Habilitar la opción Curso Completo Antes Minutos', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Включение завершения курса вариант перед минутами'),
(738, 'view_students_list', 'View students list', ' Ir al listado de estudiantes', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Просмотр списка студентов'),
(739, 'tutor_batches_list', 'Tutor batches list', ' Lista de lotes tutor', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Список Tutor партии'),
(740, 'view_enrolled_students', 'View enrolled students', ' Ver inscrito estudiantes', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Просмотр зачисленных студентов'),
(741, 'enrolled_student', 'Enrolled student', ' estudiante inscrito', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', ' Поступил студент'),
(742, 'History', 'History', ' Historia', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'история'),
(743, 'credits_Transaction', 'Credits Transaction', ' créditos Transacción', NULL, NULL, NULL, 'क्रेडिट लेनदेन', 'Кредиты сделки'),
(744, 'Money_Conversion', 'Money Conversion', ' Conversión de dinero', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'деньги Преобразование'),
(745, 'Request', 'Request', 'Solicitud', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', ' Запрос'),
(746, 'credit_Conversion', 'Credit Conversion', ' Conversión de crédito', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', ' Кредитные преобразования'),
(747, 'Courses Offered', 'Courses Offered', ' Los cursos ofrecidos', NULL, NULL, NULL, 'पाठ्यक्रम की पेशकश की', 'Предлагаемые курсы'),
(748, 'Net Credits', 'Net Credits', ' Los créditos netos', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Чистые кредиты'),
(749, 'Total Tutors', 'Total Tutors', ' Los tutores totales', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Всего репетиторы');
INSERT INTO `pre_languagewords` (`lang_id`, `lang_key`, `english`, `spanish`, `bengali`, `french`, `japanese`, `hindi`, `russian`) VALUES
(750, 'Total Batches', 'Total Batches', ' Los lotes totales', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', ' Всего Порции'),
(751, 'Approve Batch Students', 'Approve Batch Students', ' Aprobar lotes Estudiantes', NULL, NULL, NULL, 'बैच के छात्रों को मंजूरी', ' Утвердить Batch студентов'),
(752, 'View Enrolled Students', 'View Enrolled Students', ' Ver Estudiantes Matriculados', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', ' Просмотр зачисленных студентов'),
(753, 'batch_status', 'Batch status', ' estado del lote', NULL, NULL, NULL, 'बैच का दर्जा', 'статус пакетного'),
(754, 'Apple Store', 'Apple Store', ' tienda Apple', NULL, NULL, NULL, 'एप्पल स्टोर', 'Apple Store'),
(755, 'Write any information to batch', 'Write any information to batch', ' Escribe cualquier información a lote', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Написать какую-либо информацию партии'),
(756, 'Approve Batch', 'Approve Batch', ' aprobar por lotes', NULL, NULL, NULL, 'बैच स्वीकृत', 'Утвердить Batch'),
(757, 'Batch approved successfully', 'Batch approved successfully', ' Lote aprobado con éxito', NULL, NULL, NULL, 'बैच सफलतापूर्वक को मंजूरी दी', ' Пакетная утвержден успешно'),
(758, 'Batch already approved', 'Batch already approved', ' Ya aprobado por lotes', NULL, NULL, NULL, 'बैच पहले ही मंजूरी दे दी है', 'Пакетная уже утвержден'),
(760, 'other_title', 'Other title', ' otro título', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Другое название'),
(761, 'Show None', 'Show None', ' Mostrar Ninguno', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्सलेनदेन इतिहास क्रेडिट्स', ' Показать ни'),
(762, 'Tutor Name', 'Tutor Name', 'Nombre tutor', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्सलेनदेन इतिहास क्रेडिट्स', 'Репетитор Имя'),
(763, 'This Tutor Is Not Available Now', 'This Tutor Is Not Available Now', ' Este tutor no está disponible ahora', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Этот учебник не доступен сейчас'),
(764, 'Initiate Session For Batch Students', 'Initiate Session For Batch Students', ' Iniciar Sesión Para el lote Estudiantes', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Начать сеанс для пакетного студентов'),
(765, 'Institute:', 'Institute:', ' Instituto:', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', NULL),
(766, 'Coures:', 'Coures:', 'coures:', NULL, NULL, NULL, 'पाठ्यक्रम:', 'Курсы:'),
(767, 'No of Batches Tutoring', 'No of Batches Tutoring', ' Sin lotes de Tutoría', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Нет батчей Репетиторство'),
(768, 'Initiate Session for the Batch', 'Initiate Session for the Batch', ' Iniciar Sesión para el lote', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Инициировать сеанс для пакетной'),
(769, 'Write any information to students like if session is oline, provide any link/URL details', 'Write any information to students like if session is oline, provide any link/URL details', '', NULL, NULL, NULL, NULL, NULL),
(770, 'Initiate Session', 'Initiate Session', 'iniciar Sesión', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Начать сеанс'),
(771, 'Batch Session Initiated successfully', 'Batch Session Initiated successfully', ' Sesión lotes iniciado con éxito', NULL, NULL, NULL, 'बैच सत्र सफलतापूर्वक शुरू की', 'Пакетная Session Начатое успешно'),
(772, 'Batch Session already initiated', 'Batch Session already initiated', ' Sesión lotes ya iniciado', NULL, NULL, NULL, 'बैच सत्र पहले ही शुरू', 'Пакетная сессия уже инициировала'),
(773, 'Update as Course Completed For Batch', 'Update as Course Completed For Batch', ' Actualizar como Curso Completo Para el Lote', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Дополнение курса Завершенный для пакетного'),
(774, 'Update as Course Completed for the Batch', 'Update as Course Completed for the Batch', 'Update como Curso Completo para el lote', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Дополнение курса Завершенный для пакетного'),
(775, 'Update As Course Completed', 'Update As Course Completed', 'Como actualizar Curso Completo', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', ' Дополнение курса Завершенный'),
(776, 'Course completed for the Batch successfully', 'Course completed for the Batch successfully', 'Curso completó con éxito para el lote', NULL, NULL, NULL, 'कोर्स बैच के लिए सफलतापूर्वक पूरा कर लिया', 'Курс завершен для партии успешно'),
(777, 'Invalid Transaction. Please try again', 'Invalid Transaction. Please try again', '', NULL, NULL, NULL, NULL, NULL),
(778, 'Information updated successfully', 'Information updated successfully', ' Información actualizada correctamente', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Информация об успешном обновлении'),
(779, 'enter_only_one_time-slot_for_one_batch', 'Enter only one time-slot for one batch', 'Ingrese sólo un intervalo de tiempo de un lote', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Введите только один тайм-слот для одной партии'),
(781, 'No of Batches', 'No of Batches', 'No de lotes', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', ' Нет батчей'),
(782, 'Tutoring', 'Tutoring', ' tutoría', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'репетиторство'),
(783, 'inst_batches', 'Inst batches', ' lotes Inst', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Inst партии'),
(784, 'send_credits_conversion_request_for_this_batch', 'Send credits conversion request for this batch', ' Enviar solicitud de conversión de créditos para este lote', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Отправить запрос конвертации кредитов для этой партии'),
(785, 'Batch Id', 'Batch Id', ' Número de identificación del lote', NULL, NULL, NULL, 'बैच क्रमांक', ' Пакетная Id'),
(786, 'Favicon', 'Favicon', ' favicon', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Favicon'),
(787, 'Invalid request Or Batch not yet completed/closed.', 'Invalid request Or Batch not yet completed/closed.', '', NULL, NULL, NULL, NULL, NULL),
(788, 'assigned_Tutor', 'Assigned Tutor', ' tutor asignado', NULL, NULL, NULL, 'सौंपा ट्यूटर', 'Назначено Tutor'),
(789, 'seo_keywords', 'Seo keywords', ' palabras clave Seo', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Seo ключевые слова'),
(790, 'student_enrollment_details', 'Student enrollment details', ' detalles de inscripción del estudiante', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', ' Детали набора студентов для обучения'),
(791, 'Teaching_class_types', 'Teaching class types', ' tipos de clases de la enseñanza', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Типы Учебный класс'),
(792, 'Non_Academic', 'Non Academic', ' no académico', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', ' Неакадемический'),
(793, 'institute_money_requests', 'Institute money requests', ' solicitudes de dinero Institute', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', ' денежные запросы Институт'),
(794, 'money_conversion_requests_from_isntitute', 'Money conversion requests from isntitute', ' las solicitudes de conversión de dinero isntitute', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Запросы Конвертация средств из института'),
(795, 'per_credit_cost', 'Per credit cost', ' Por coste de crédito', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'За стоимость кредита'),
(796, 'tutor_money_requests', 'Tutor money requests', ' solicitudes de dinero tutor', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', ' Репетитор денежные запросы'),
(797, 'money_conversion_requests_from_tutor', 'Money conversion requests from tutor', ' las solicitudes de conversión de dinero tutor', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Запросы Конвертация денежных средств от воспитателя'),
(798, 'No Details Found', 'No Details Found', ' No hay detalles que se encuentran', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Нет Детали не найдены'),
(799, 'batch', 'Batch', ' Lote', NULL, NULL, NULL, 'जत्था', 'партия'),
(800, 'credits_acquired', 'Credits acquired', ' créditos adquiridos', NULL, NULL, NULL, 'क्रेडिट का अधिग्रहण', 'Кредиты приобрели'),
(801, 'online', 'Online', ' En línea', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', ' В сети'),
(802, 'select_Country', 'Select Country', 'Seleccionar país', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Выберите страну'),
(803, 'select_Phone_Code', 'Select Phone Code', ' Seleccione Código de teléfono', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Выберите код телефона'),
(804, 'contact_us', 'Contact us', ' Contáctenos', NULL, NULL, NULL, 'हमसे संपर्क करें', 'Свяжитесь с нами'),
(805, 'Subject', 'Subject', 'Tema', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Предмет'),
(806, 'Message', 'Message', ' Mensaje', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Сообщение'),
(807, 'Send Message', 'Send Message', ' Enviar mensaje', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', ' Отправить сообщение'),
(808, 'please_enter_first_name', 'Please enter first name', ' Por favor, introduzca primero nombre', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', ' Пожалуйста, введите имя'),
(809, 'please_enter_last_name', 'Please enter last name', ' Por favor, ingrese el apellido', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Пожалуйста, введите фамилию'),
(810, 'please_enter_email_id', 'Please enter email id', ' Por favor, introduzca correo electrónico de identificación', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', ' Пожалуйста, введите электронный идентификатор'),
(811, 'please_enter_subject', 'Please enter subject', ' Por favor, introduzca sujeto', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Пожалуйста, введите тему'),
(812, 'Contact Query Received', 'Contact Query Received', 'Contacto Consulta recibida', NULL, NULL, NULL, 'संपर्क क्वेरी प्राप्त', 'Как связаться с запросом, полученных'),
(813, 'Hello Admin, ', 'Hello Admin, ', '', NULL, NULL, NULL, NULL, NULL),
(814, 'You got contact query. Below are the details.', 'You got contact query. Below are the details.', '', NULL, NULL, NULL, NULL, NULL),
(815, 'Thank you', 'Thank you', 'Gracias', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'спасибо'),
(816, 'Your contact request sent successfully', 'Your contact request sent successfully', 'Su solicitud de contacto enviado con éxito', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Ваш контакт успешно отправлен запрос'),
(817, 'Number of credits required for sending message: ', 'Number of credits required for sending message: ', ' Número de créditos requeridos para enviar el mensaje:', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', NULL),
(818, 'Credits required for sending message: ', 'Credits required for sending message: ', 'Créditos necesarios para enviar el mensaje:', NULL, NULL, NULL, 'संदेश भेजने के लिए आवश्यक क्रेडिट:', 'Кредиты, необходимые для отправки сообщения'),
(819, 'Select Course *', 'Select Course *', '', NULL, NULL, NULL, NULL, NULL),
(820, 'please_enter_name', 'Please enter name', ' Por favor, introduzca el nombre', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Пожалуйста, введите имя'),
(821, 'please_enter_phone', 'Please enter phone', ' Por favor, introduzca el teléfono', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', ' Пожалуйста, введите телефон'),
(822, 'please_enter_your_message', 'Please enter your message', ' Por favor ingrese su mensaje', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Пожалуйста, введите ваше сообщение'),
(823, 'Message Received From Student', 'Message Received From Student', 'Mensaje recibido del Estudiante', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', ' Сообщение получено от студента'),
(824, 'Hi ', 'Hi ', ' Hola', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Здравствуй'),
(826, ' Student', ' Student', ' Estudiante', NULL, NULL, NULL, ' छात्र', 'Студент'),
(827, 'Your message sent to Tutor successfully', 'Your message sent to Tutor successfully', ' Su mensaje enviado con éxito con el Tutor', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्सलेनदेन इतिहास क्रेडिट्स', NULL),
(828, 'Student_type', 'Student type', ' tipo de estudiante', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Тип студента'),
(829, 'Credits_for_sending_message', 'Credits for sending message', ' Créditos para enviar el mensaje de', NULL, NULL, NULL, 'संदेश भेजने के लिए क्रेडिट', 'Кредиты для отправки сообщения'),
(830, 'Your message not sent due to some technical issue. Please send message after some time. Thankyou.', 'Your message not sent due to some technical issue. Please send message after some time. Thankyou.', '', NULL, NULL, NULL, NULL, NULL),
(831, 'Your message sent to Institute successfully', 'Your message sent to Institute successfully', ' Su mensaje enviado al Instituto éxito', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्सलेनदेन इतिहास क्रेडिट्स', NULL),
(832, 'please_become_premium_member_to_send_message_to_student', 'Please become premium member to send message to student', ' Por favor hágase miembro premium para enviar un mensaje a un estudiante', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Пожалуйста, стать членом премиум, чтобы отправить сообщение студенту'),
(833, 'Message Received From ', 'Message Received From ', ' El mensaje recibido del', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Полученное сообщение'),
(834, 'You got a message from Tutor. Below are the details.', 'You got a message from Tutor. Below are the details.', '', NULL, NULL, NULL, NULL, NULL),
(835, 'Your message sent to Student successfully', 'Your message sent to Student successfully', 'Su mensaje enviado al éxito del estudiante', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', NULL),
(836, 'You got a message from . Below are the details.', 'You got a message from . Below are the details.', '', NULL, NULL, NULL, NULL, NULL),
(837, 'You got a message from Institute. Below are the details.', 'You got a message from Institute. Below are the details.', '', NULL, NULL, NULL, NULL, NULL),
(838, 'update_contact_information', 'Update contact information', ' actualizar información de contactos', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Обновление контактной информации'),
(839, 'please select phone code', 'Please select phone code', ' Por favor, seleccione el código de teléfono', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Пожалуйста, выберите телефонный код'),
(840, 'Please send your request after 24 hours of the Batch closed time. Thank you.', 'Please send your request after 24 hours of the Batch closed time. Thank you.', '', NULL, NULL, NULL, NULL, NULL),
(841, 'please_become_premium_member_to_send_message_to_institute', 'Please become premium member to send message to institute', ' Por favor hágase miembro premium para enviar el mensaje a instituir', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', ' Пожалуйста, стать членом премиум, чтобы отправить сообщение возбуждать'),
(842, 'rate_this_tutor', 'Rate this tutor', 'Valorar este tutor', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', ' Оценить этот репетитор'),
(843, 'rate_tutor', 'Rate tutor', 'tasa tutor', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', ' Оценить Репетитор'),
(844, 'Rate Tutor', 'Rate Tutor', ' tasa tutor', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Оценить Репетитор'),
(845, 'Comments', 'Comments', ' comentarios', NULL, NULL, NULL, 'टिप्पणियाँ', 'Комментарии'),
(846, 'fee_(in_credits)', 'Fee (in credits)', '', NULL, NULL, NULL, NULL, NULL),
(847, 'Your review successfully sent to the Tutor.', 'Your review successfully sent to the Tutor.', '', NULL, NULL, NULL, NULL, NULL),
(848, 'Thanks for rating the tutor. Your review successfully sent to the Tutor.', 'Thanks for rating the tutor. Your review successfully sent to the Tutor.', '', NULL, NULL, NULL, NULL, NULL),
(849, 'Manage Teaching Types', 'Manage Teaching Types', ' Administrar tipos de enseñanza', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', ' Управление типами Преподавание'),
(850, 'Thanks for rating the tutor. Your review successfully updated to the Tutor.', 'Thanks for rating the tutor. Your review successfully updated to the Tutor.', '', NULL, NULL, NULL, NULL, NULL),
(851, 'rating_(out_of_5)', 'Rating (out of 5)', '', NULL, NULL, NULL, NULL, NULL),
(852, 'Opened Leads', 'Opened Leads', ' Ventas abiertas', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'открытые Ведет'),
(853, 'closed Leads', 'Closed Leads', ' Ventas cerradas', NULL, NULL, NULL, 'बंद सुराग', 'Закрытые Ведет'),
(854, 'E-Templates', 'E-Templates', 'E-Plantillas', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Электронные шаблоны'),
(855, 'money_conversion_requests', 'Money conversion requests', 'las solicitudes de conversión de dinero', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', ' Запросы Конвертация денежных средств'),
(856, 'manage_courses', 'Manage courses', ' gestión de cursos', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Управление курсы'),
(857, 'manage_locations', 'Manage locations', 'administrar las ubicaciones', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्सलेनदेन इतिहास क्रेडिट्स', 'Управление местоположениями'),
(858, 'personal_information', 'Personal information', ' Informacion personal', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Личная информация'),
(859, 'For viewing lead ', 'For viewing lead ', ' Para la visualización de plomo', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Для просмотра свинца'),
(860, 'of Student', 'Of Student', ' del Estudiante', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', ' студенческих'),
(861, 'profile_information', 'Profile information', 'Información del perfil', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', ' Информация профиля'),
(862, 'Explore - Enrich - Excel', 'Explore - Enrich - Excel', ' Explora - Enriquecer - Excel', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', ' Исследуйте - Пополните - первенствует'),
(863, 'Everything you need in order to find the', 'Everything you need in order to find the', ' Todo lo que necesita con el fin de encontrar la', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Все, что нужно для того, чтобы найти'),
(864, 'right', 'Right', ' Derecha', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Правильно'),
(866, 'Videos & Images', 'Videos & Images', '', NULL, NULL, NULL, NULL, NULL),
(868, 'Quality Scores', 'Quality Scores', ' Niveles de calidad', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'показатели качества'),
(869, 'We have rated teachers for safety and convenience as we know how important this is for you.', 'We have rated teachers for safety and convenience as we know how important this is for you.', '', NULL, NULL, NULL, NULL, NULL),
(870, 'Reviews & Ratings', 'Reviews & Ratings', '', NULL, NULL, NULL, NULL, NULL),
(871, 'No more emails calls or messaging friends for recommendations  get acces to real reviews in seconds', 'No more emails, calls or messaging friends for recommendations - get acces to real reviews in seconds.', '', NULL, NULL, NULL, NULL, 'Нет больше писем, звонков или друзей по обмену сообщениями для рекомендаций - получить доступ к реальным отзывы в секундах.'),
(872, 'FEATURED ON:', 'FEATURED ON:', ' PRESENTADO EN:', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'размещённые на:'),
(873, 'Recent Added', 'Recent Added', 'Agregado reciente', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Недавно добавленный'),
(874, 'How Does This', 'How Does This', ' ¿Cómo hace este', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Как это'),
(875, 'Work', 'Work', 'Trabajo', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Работа'),
(876, 'Start Your Search', 'Start Your Search', 'Realice su búsqueda', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Начать поиск'),
(877, 'Search for online tutoring. Need help with your search? Request a tutor and we’ll have tutors contact you very soon!', 'Search for online tutoring. Need help with your search? Request a tutor and we’ll have tutors contact you very soon!', '', NULL, NULL, NULL, NULL, NULL),
(878, 'Review', 'Review', 'revisión', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', ' Обзор'),
(879, 'Read feedback and ratings from parents and students. Detailed tutor profiles also include photos more.', 'Read feedback and ratings from parents and students. Detailed tutor profiles also include photos more.', '', NULL, NULL, NULL, NULL, NULL),
(880, 'Schedule', 'Schedule', ' Programar', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', ' График'),
(881, 'Communicate directly with tutors to find a time that works for you Whether you need a single lesson', 'Communicate directly with tutors to find a time that works for you. Whether you need a single lesson.', '', NULL, NULL, NULL, NULL, 'Общайтесь с репетиторами, чтобы найти время, которое работает для вас. Вам нужно ли одного урока.'),
(882, 'Start Learning', 'Start Learning', ' Comienza a aprender', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', ' Начало обучения'),
(883, 'One-on-one instruction is the most effective way to learn. Let us handle payments and administrative details.', 'One-on-one instruction is the most effective way to learn. Let us handle payments and administrative details.', '', NULL, NULL, NULL, NULL, NULL),
(884, 'Why Students', 'Why Students', ' ¿Por qué los estudiantes', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Почему студенты'),
(885, 'Love Us', 'Love Us', ' Amarnos', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Люби нас'),
(886, 'Are you a', 'Are you a', ' Eres un', NULL, NULL, NULL, 'क्या तुम एक', 'Вы'),
(887, 'Teacher', 'Teacher', ' Profesor', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'учитель'),
(888, 'Looking for a better way to reach your target audience? We can help - just list with us', 'Looking for a better way to reach your target audience? We can help - just list with us', '', NULL, NULL, NULL, NULL, NULL),
(889, 'for free', 'For free', 'Gratis', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Бесплатно'),
(890, 'Boost your sales and scale up all of your classes', 'Boost your sales and scale up all of your classes.', '', NULL, NULL, NULL, 'अभी बुक करें', 'Повышение продаж и расширение масштабов всех ваших классов.'),
(891, 'Get a lot of exposure and brand recognition from everyone', 'Get a lot of exposure & brand recognition from everyone.', '', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Получите много экспозиции и бренд признания от всех.'),
(892, 'Participate in various events and school programs whenever you want', 'Participate in various events and school programs whenever you want.', '', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Примите участие в различных мероприятиях и школьных программ, когда вы хотите.'),
(893, 'site_Testimonials', 'Site Testimonials', ' sitio Testimonios', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', ' Отзывы по сайту'),
(894, 'as a Teacher', 'As a Teacher', 'Como maestro', NULL, NULL, NULL, 'एक शिक्षक के रूप में', 'Как учитель'),
(895, 'view_tutoring_languages', 'View tutoring languages', ' Ver idiomas de tutoría', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', ' Языки Просмотр репетиторство'),
(896, 'Tutoring_Languages', 'Tutoring Languages', ' tutoría Idiomas', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Репетиторство Языки'),
(897, 'success_phrases_updated_successfuly', 'Success phrases updated successfuly', ' frases de éxito actualizados con exito', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Фразы успеха успешно обновлен'),
(899, 'manage_certificates', 'Manage certificates', ' gestionar certificados', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Управление сертификатами'),
(900, 'Please select a subject', 'Please select a subject', 'Por favor, seleccione un tema', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Пожалуйста, выберите тему'),
(901, 'View_Fields', 'View Fields', ' Ver más campos', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Просмотр поля'),
(902, 'Edit_Values', 'Edit Values', ' Editar valores', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Изменить значения'),
(903, 'enter_new_password', 'Enter new password', ' Introduzca nueva contraseña', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Введите новый пароль'),
(904, 'confirm_new_password', 'Confirm new password', ' Confirmar nueva contraseña', NULL, NULL, NULL, 'नए पासवर्ड की पुष्टि करें', ' Подтвердите новый пароль'),
(905, 'Make_Default', 'Make Default', 'Hacer por defecto', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Использовать по умолчанию'),
(906, 'password_and_confirm_passwords_should_match', 'Password and confirm passwords should match', ' Contraseña y confirme las contraseñas deben coincidir', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Пароль и подтверждение пароля должны совпадать'),
(907, 'please_enter_new_password', 'Please enter new password', ' Por favor, introduzca una nueva contraseña', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', ' Пожалуйста, введите новый пароль'),
(908, 'please_confirm_new_password', 'Please confirm new password', ' Por favor, confirme la nueva contraseña', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', ' Пожалуйста, подтвердите новый пароль'),
(909, 'opened_Leads', 'Opened Leads', 'Opened Leads', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'открытые Ведет'),
(910, 'select_Payment_Gateway', 'Select Payment Gateway', 'Select Payment Gateway', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Выберите Платежный шлюз'),
(911, 'personal_info', 'Personal info', 'Personal info', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Личная информация'),
(912, 'preffered_teaching_types', 'Preffered teaching types', 'Preffered teaching types', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Предпочтительный тип преподавания'),
(913, 'enrolled_courses', 'Enrolled courses', 'Enrolled courses', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Зарегистрировавшиеся курсы'),
(915, 'How far are you willing to travel', 'How far are you willing to travel', 'How far are you willing to travel', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Как далеко вы готовы путешествовать'),
(916, 'Key', 'Key', 'Key', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'ключ'),
(917, 'Sender', 'Sender', 'Sender', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'отправитель'),
(918, 'API_URL', 'API URL', 'API URL', NULL, NULL, NULL, 'एपीआई यूआरएल', 'API URL'),
(919, 'Admin_Commission_For_A_Booking_In_Percentage', 'Admin Commission For A Booking In Percentage', 'Admin Commission For A Booking ', NULL, NULL, NULL, ' एक बुकिंग में प्रतिशत के लिए व्यवस्थापक आयोग', 'Администратор комиссия за бронирование в процентах'),
(920, 'active', 'Active', 'Active', NULL, NULL, NULL, 'सक्रिय', 'активный'),
(921, 'inactive', 'Inactive', ' Inactive', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Неактивный'),
(922, 'your_Email', 'Your Email', 'Your Email', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', NULL),
(923, 'App not sent due to some technical issue Please try after some time Thankyou', 'App not sent due to some technical issue. Please try after some time. Thankyou.', NULL, NULL, NULL, NULL, 'अनुप्रयोग नहीं कुछ तकनीकी समस्या के कारण भेजा है। कृपया कुछ देर बाद प्रयास करें। धन्यवाद।', 'App не отправляется из-за какой-то технической проблемы. Пожалуйста, попробуйте через некоторое время. Спасибо.'),
(924, 'App not sent due to some technical issue Please enter valid email Thankyou', 'App not sent due to some technical issue. Please enter valid email. Thankyou.', NULL, NULL, NULL, NULL, 'अनुप्रयोग नहीं कुछ तकनीकी समस्या के कारण भेजा है। कृपया मान्य ईमेल को दर्ज करें। धन्यवाद।', 'App не отправляется из-за какой-то технической проблемы. Пожалуйста, введите действительный адрес электронной почты. Спасибо.'),
(925, 'Tutor_App_Download_Link_sent_to_your_email_successfully', 'Tutor App Download Link sent to your email successfully.', NULL, NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', ' Репетитор App Скачать Ссылка отправлен на ваш адрес электронной почты успешно.'),
(926, 'booking', 'Booking', 'Booking ', NULL, NULL, NULL, 'बुकिंग', 'бронирование'),
(928, 'manage_tutors', 'Manage tutors', 'Manage tutors', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Управление репетиторов'),
(929, 'Called for admin intervention', 'Called for admin intervention', 'Called for admin intervention', NULL, NULL, NULL, 'व्यवस्थापक हस्तक्षेप का आह्वान', 'Вызывается для вмешательства администратора'),
(930, 'Manage Tutors', 'Manage Tutors', 'Manage Tutors', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Управление Репетиторы'),
(931, 'mysubscriptions', 'Mysubscriptions', 'Mysubscriptions', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Мои подписки'),
(932, 'Session Initiated', 'Session Initiated', 'Session Initiated', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'сессия Начатое'),
(933, 'update_contact_info', 'Update contact info', 'Update contact info', NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', ' Обновление контактные данные'),
(934, 'URL_For_Designed_By', 'URL For Designed By', NULL, NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'URL для Дизайн'),
(935, 'Account Successfully Created', 'Account Successfully Created', NULL, NULL, NULL, NULL, ' खाता सफलतापूर्वक बनाया गया', 'Счет успешно создан'),
(936, 'Activation Email Sent', 'Activation Email Sent', NULL, NULL, NULL, NULL, 'सक्रियण ईमेल भेजा', 'Активация Email Sent'),
(937, 'Account Successfully Created and Activation Email Sent', 'Account Successfully Created and Activation Email Sent', NULL, NULL, NULL, NULL, ' खाता सफलतापूर्वक बनाया और सक्रियण ईमेल भेजा', 'Аккаунт успешно создан активации электронной почты, отправляемой'),
(938, 'student Bookings', 'Student Bookings', NULL, NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Студенческие Бронирование'),
(939, 'Institute Batches', 'Institute Batches', NULL, NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', ' Институт Порции'),
(940, 'Boost your sales and scale up all of your classes', 'Boost your sales and scale up all of your classes.', NULL, NULL, NULL, NULL, 'अभी बुक करें', 'Повышение продаж и расширение масштабов всех ваших классов.'),
(943, 'You have reached end of the list', 'You have reached end of the list', NULL, NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', ' Вы достигли конца списка'),
(944, 'credits_for_viewing_the_lead_Are_you_sure_to_continue', 'Credits for viewing the lead Are you sure to continue', NULL, NULL, NULL, NULL, 'नेतृत्व को देखने के लिए आप क्रेडिट जारी रखने के लिए निश्चित हैं', 'Кредиты для просмотра свинца Вы уверены, чтобы продолжить'),
(945, 'to_view_the_lead_details', 'To view the lead details', NULL, NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', ' Для просмотра информации свинцовые'),
(947, 'free_demo', 'Free demo', NULL, NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Бесплатный Демо'),
(948, 'hello_I_am', 'Hello I am', NULL, NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Здравствуйте, я'),
(949, 'Explore', 'Explore', NULL, NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Исследовать'),
(950, 'Enrich', 'Enrich', NULL, NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'обогащать'),
(951, 'Excel', 'Excel', NULL, NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'превосходить'),
(952, 'class for you', 'Class for you', NULL, NULL, NULL, NULL, 'आप के लिए कक्षा', 'Класс для Вас'),
(953, 'Videos', 'Videos', NULL, NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', ' Видео'),
(954, 'Images', 'Images', NULL, NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Изображений'),
(955, 'Listen to our teachers speeches and see our video testimonials before you take any decisions', 'Listen to our teachers speeches and see our video testimonials before you take any decisions', NULL, NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Слушайте наши учителя речи и посмотреть наши видео свидетельства, прежде чем принимать какие-либо решения'),
(956, 'We have rated teachers for safety and convenience as we know how important this is for you', 'We have rated teachers for safety and convenience as we know how important this is for you', NULL, NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Мы дали оценку учителей для безопасности и удобства, как мы знаем, насколько это важно для вас'),
(957, 'No more emails', 'No more emails', NULL, NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', ' Нет больше писем'),
(958, 'calls or messaging friends for recommendations', 'Calls or messaging friends for recommendations', NULL, NULL, NULL, NULL, 'कॉल या संदेश भेजने मित्र सिफारिशों के लिए', ' Звонки или друзей по обмену сообщениями для рекомендаций'),
(959, 'get acces to real reviews in seconds', 'Get acces to real reviews in seconds', NULL, NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Получите доступ к реальным отзывы в секундах'),
(960, 'fee_ (in_credits)', 'Fee  (in credits)', NULL, NULL, NULL, NULL, NULL, NULL),
(961, 'FEATURED ON', 'FEATURED ON', NULL, NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'размещённые на'),
(962, 'There are', 'There are', NULL, NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Есть'),
(963, 'lessons taught already', 'Lessons taught already', NULL, NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Уроки учат уже'),
(964, 'weekly_top', 'Weekly top', NULL, NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', ' еженедельное'),
(965, 'Looking for a better way to reach your target audience', 'Looking for a better way to reach your target audience', NULL, NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', ' Ищете лучший способ добраться до вашей целевой аудитории'),
(966, 'We can help', 'We can help', NULL, NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', ' Мы можем помочь'),
(967, 'just list with us', 'Just list with us', NULL, NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Просто список с нами'),
(968, 'Feel_free_to_call_us_anytime_on', 'Feel free to call us anytime on', NULL, NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Не стесняйтесь, звоните нам в любое время на'),
(970, 'please_become_premium_member_to_avail_additional_features_like', 'Please become premium member to avail additional features like', NULL, NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', ' Пожалуйста, стать членом премиум воспользоваться дополнительные функции, такие как'),
(971, 'booking_tutors', 'Booking tutors', NULL, NULL, NULL, NULL, 'बुकिंग ट्यूटर्स', 'Бронирование отелей наставники'),
(972, 'and', 'And', NULL, NULL, NULL, NULL, ' तथा', 'А также'),
(973, 'sending_messages', 'Sending messages', NULL, NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Отправка сообщения'),
(974, 'credits_required_to_become_premium_member ', 'Credits required to become premium member ', NULL, NULL, NULL, NULL, 'क्रेडिट प्रीमियम सदस्य बनने के लिए आवश्यक', 'Кредиты должны стать премиум-членом'),
(975, 'in_credits', 'In credits', NULL, NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'В кредитах'),
(976, 'admin_commission_val', 'Admin commission val', NULL, NULL, NULL, NULL, ' व्यवस्थापक आयोग वैल', ' Администратор комиссии Вэл'),
(977, 'with_credits', 'With credits', NULL, NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'С помощью кредитов'),
(978, '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(979, 'slots_available', 'Slots available', NULL, NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Свободные слоты'),
(980, 'your_slot_with_the_tutor_booked_successfully_Once_tutor_approved_your_booking and_initiated_the_session_you_can_start_the_course_on_the_booked_date', 'Your slot with the tutor booked successfully Once tutor approved your booking and initiated the session you can start the course on the booked date', NULL, NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', NULL),
(982, 'your_slot_booked_successfully_Once_isntitute_approved_your_booking and_tutor_initiated_the_session_you_can_start_the_course_on_course_starting_date', 'Your slot booked successfully Once isntitute approved your booking and tutor initiated the session you can start the course on course starting date', NULL, NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', NULL),
(983, 'enter_only_one_timeslot_for_one_batch', 'Enter only one timeslot for one batch', NULL, NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Введите только один временной интервал для одной партии'),
(984, 'tutor(s)_not_available.', 'Tutor(s) not available.', NULL, NULL, NULL, NULL, NULL, NULL),
(985, 'Phone_Num', 'Phone Num', NULL, NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', ' Телефон Num'),
(986, 'rating', 'Rating', NULL, NULL, NULL, NULL, 'अभी बुक करें', 'Рейтинг'),
(987, 'out_of', 'Out of', NULL, NULL, NULL, NULL, 'अभी बुक करें', ' Снаружи'),
(991, 'No Student enrolled in this batch', 'No Student enrolled in this batch', NULL, NULL, NULL, NULL, 'अभी बुक करें', 'Нет Студент поступил в этой партии'),
(992, 'Invalid request Or Batch not yet completed', 'Invalid request Or Batch not yet completed', NULL, NULL, NULL, NULL, 'अभी बुक करें', ' Неверный запрос или пакетным еще не завершена'),
(993, 'You dont have permission to perform this action', 'You dont have permission to perform this action', NULL, NULL, NULL, NULL, 'अभी बुक करें', 'Вы не имеете прав доступа к этой странице'),
(994, 'you_already_enrolled_in_this_batch_and_your_course_not_yet_completed', 'You already enrolled in this batch and your course not yet completed', NULL, NULL, NULL, NULL, NULL, NULL),
(995, 'student_present_status', 'Student present status', NULL, NULL, NULL, NULL, 'अभी बुक करें', 'Студент Современное состояние'),
(996, 'certificates_of', 'Certificates of', NULL, NULL, NULL, NULL, 'एक शिक्षक के रूप में', 'Сертификаты'),
(997, 'Frequently', 'Frequently', NULL, NULL, NULL, NULL, 'अभी बुक करें', 'Часто'),
(998, 'Asked_Questions', 'Asked Questions', NULL, NULL, NULL, NULL, 'एक शिक्षक के रूप में', 'задаваемые вопросы'),
(999, 'See_our_frequently_asked_questions', 'See our frequently asked questions', NULL, NULL, NULL, NULL, 'अभी बुक करें', 'Смотрите наши часто задаваемые вопросы'),
(1000, 'Total Bookings', 'Total Bookings', NULL, NULL, NULL, NULL, 'अभी बुक करें', ' Всего Бронирование'),
(1001, 'Bookings Pending', 'Bookings Pending', NULL, NULL, NULL, NULL, 'एक शिक्षक के रूप में', 'Заказы ожидающие'),
(1002, 'Bookings Completd', 'Bookings Completd', NULL, NULL, NULL, NULL, 'एक शिक्षक के रूप में', 'Бронирование завершено'),
(1003, 'Bookings Approved', 'Bookings Approved', NULL, NULL, NULL, NULL, 'एक शिक्षक के रूप में', 'Заказы утвержден'),
(1004, 'Open Leads', 'Open Leads', NULL, NULL, NULL, NULL, 'अभी बुक करें', ' открытые Ведет'),
(1005, 'Institue Enrolled Courses', 'Institue Enrolled Courses', NULL, NULL, NULL, NULL, 'अभी बुक करें', 'Институт зачислен Курсы'),
(1006, 'Booking Completd', 'Booking Completd', NULL, NULL, NULL, NULL, 'एक शिक्षक के रूप में', 'Бронирование полная'),
(1007, 'Booking Running', 'Booking Running', NULL, NULL, NULL, NULL, 'एक शिक्षक के रूप में', 'Бронирование работает'),
(1008, 'Total Tutoring Courses', 'Total Tutoring Courses', NULL, NULL, NULL, NULL, 'अभी बुक करें', ' Всего курсы Репетиторство'),
(1009, 'admin_commission_percentage_in_credits', 'Admin commission percentage in credits', NULL, NULL, NULL, NULL, 'व्यवस्थापक आयोग प्रतिशत (क्रेडिट्स में)', 'Администратор комиссии процент по кредитам'),
(1018, 'Account', 'Account', NULL, NULL, NULL, NULL, 'एकेडमिक', 'Счет'),
(1024, 'Total_Payments', 'Total Payments', NULL, NULL, NULL, NULL, 'भाषा जोड़े', 'Общая сумма выплат'),
(1025, 'Users Information', 'Users Information', NULL, NULL, NULL, NULL, 'अभी बुक करें', 'Пользователи информация'),
(1026, 'Package Subscriptions', 'Package Subscriptions', NULL, NULL, NULL, NULL, 'अभी बुक करें', 'Пакет подписки'),
(1027, 'Enrolled Courses', 'Enrolled Courses', NULL, NULL, NULL, NULL, 'अभी बुक करें', 'Зарегистрировавшиеся Курсы'),
(1028, 'My Leads', 'My Leads', NULL, NULL, NULL, NULL, 'अभी बुक करें', 'Мои Ведет'),
(1030, 'please_select_date,on_which_you_want_to_start_the_course', 'Please select date,on which you want to start the course', NULL, NULL, NULL, NULL, NULL, NULL),
(1032, 'viewing_student_posted_leads', 'Viewing student posted leads', NULL, NULL, NULL, NULL, 'अभी बुक करें', ' Просмотр студентов размещены потенциальных клиентов'),
(1033, 'Discount:', 'Discount:', NULL, NULL, NULL, NULL, 'अभी बुक करें', 'скидка:'),
(1034, 'View Public Profile', 'View Public Profile', NULL, NULL, NULL, NULL, 'अभी बुक करें', 'Посмотреть профиль'),
(1035, 'Update Info', 'Update Info', NULL, NULL, NULL, NULL, 'अभी बुक करें', 'Обновить данные'),
(1036, 'Mobile', 'Mobile', NULL, NULL, NULL, NULL, 'अभी बुक करें', 'мобильный'),
(1037, 'EX: 15 days or 2 months or ..', 'EX: 15 days or 2 months or ..', NULL, NULL, NULL, NULL, NULL, NULL),
(1038, 'Discount', 'Discount', NULL, NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'скидка'),
(1039, 'Do you have nnn your own vehicle to travel', 'Do you have nnn your own vehicle to travel', NULL, NULL, NULL, NULL, NULL, ' Showing translation for Do you have on your own vehicle to travel Translate instead Do you have nnn your own vehicle to travel Есть ли у вас на вашем собственном автомобиле путешествовать'),
(1040, 'in Km', 'In Km', NULL, NULL, NULL, NULL, 'क्रेडिट्स', 'В Km'),
(1042, 'View_Public_Profile', 'View Public Profile', NULL, NULL, NULL, NULL, NULL, ' Посмотреть профиль'),
(1043, 'credits_transaction_history', 'Credits Transaction History', NULL, NULL, NULL, NULL, NULL, ' Кредиты История транзакций'),
(1044, 'approved', 'Approved', NULL, NULL, NULL, NULL, NULL, 'утвержденный'),
(1045, 'completed', 'Completed', NULL, NULL, NULL, NULL, NULL, 'Завершенный'),
(1046, 'claim_for_admin_intervention', 'Claim for admin intervention', NULL, NULL, NULL, NULL, NULL, 'Заявление для администратора вмешательства'),
(1047, 'closed', 'Closed', NULL, NULL, NULL, NULL, NULL, 'Закрыто'),
(1048, 'SSC certificate of Student', 'SSC certificate of Student', NULL, NULL, NULL, NULL, NULL, 'ССК сертификат студента'),
(1049, 'Select Package', 'Select Package', NULL, NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Выберите пакет'),
(1051, 'Search Your Teacher', 'Search Your Teacher', NULL, NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Поиск своего учителя'),
(1052, 'Contact Details', 'Contact Details', NULL, NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Контактная информация'),
(1053, 'General Inquiries', 'General Inquiries', NULL, NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Общие запросы'),
(1054, 'Media Requests', 'Media Requests', NULL, NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Медиа-запросы'),
(1055, 'Offline Support', 'Offline Support', NULL, NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', ' Поддержка в автономном режиме'),
(1056, 'follow us', 'Follow us', NULL, NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Подписывайтесь на нас'),
(1057, 'Google Plus', 'Google Plus', NULL, NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Гугл плюс'),
(1058, 'Contact Form', 'Contact Form', NULL, NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Форма обратной связи'),
(1059, 'Select Course', 'Select Course', NULL, NULL, NULL, NULL, 'अभी बुक करें', 'Выберите курс'),
(1061, 'We will never sell or rent your private info', 'We will never sell or rent your private info', NULL, NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', ' Мы никогда не будем продавать или сдавать в аренду вашу личную информацию'),
(1062, 'Credits required for sending message', 'Credits required for sending message', NULL, NULL, NULL, NULL, 'क्रेडिट्स', 'Кредиты, необходимые для отправки сообщения'),
(1063, 'My Reviews', 'My Reviews', NULL, NULL, NULL, NULL, 'अभी बुक करें', 'Мои отзывы'),
(1064, 'Hello My name is Diana and', 'Hello My name is Diana and', NULL, NULL, NULL, NULL, 'लेनदेन इतिहास क्रेडिट्स', 'Здравствуйте! Меня зовут Диана и'),
(1065, 'My message is', 'My message is', NULL, NULL, NULL, NULL, 'अभी बुक करें', ' Мое сообщение'),
(1066, 'institute(s)_not_available.', 'Institute(s) not available.', NULL, NULL, NULL, NULL, NULL, NULL),
(1067, 'mobile_number', 'Mobile number', NULL, NULL, NULL, NULL, NULL, 'Мобильный номер'),
(1068, 'profile_pic', 'Profile pic', NULL, NULL, NULL, NULL, NULL, ' Картинка профиля'),
(1070, 'you_don\'t_have_enough_credits_to_view_the_lead_details. Please', 'You don\'t have enough credits to view the lead details. Please', NULL, NULL, NULL, NULL, NULL, NULL),
(1071, '_get_credits_here', ' get credits here.', NULL, NULL, NULL, NULL, NULL, NULL),
(1072, 'example_format', 'Example format', NULL, NULL, NULL, NULL, NULL, 'Пример формата'),
(1073, 'cancelled_before_course_started', 'Cancelled before course started', NULL, NULL, NULL, NULL, 'रद्द करना', 'Отменено до начала курс'),
(1074, 'cancelled_when_course_running', 'Cancelled when course running', NULL, NULL, NULL, NULL, 'रद्द करना', 'Отменено, когда курс работает'),
(1075, 'cancelled_after_course_completed', 'Cancelled after course completed', NULL, NULL, NULL, NULL, 'रद्द करना', ' Отменено после курса завершены'),
(1077, 'no_slots_available.', 'No slots available.', NULL, NULL, NULL, NULL, NULL, NULL),
(1079, 'please_become_premium_member_to_send_message_to_tutor', 'Please become premium member to send message to tutor', NULL, NULL, NULL, NULL, NULL, ' Пожалуйста, стать членом премиум, чтобы отправить сообщение репетитору'),
(1080, 'please_login_to_continue', 'Please login to continue', NULL, NULL, NULL, NULL, NULL, 'Пожалуйста, войдите, чтобы продолжить'),
(1081, 'please_login_to_send_message', 'Please login to send message', NULL, NULL, NULL, NULL, NULL, 'Пожалуйста, войдите, чтобы отправить сообщение'),
(1082, 'Need help finding a tutor?', 'Need help finding a tutor?', NULL, NULL, NULL, NULL, NULL, NULL),
(1083, 'MSG_LANGUAGE_ADDED', 'MSG LANGUAGE ADDED', NULL, NULL, NULL, NULL, NULL, 'MSG Добавленный язык'),
(1084, 'You got a message from Student Below are the details', 'You got a message from Student Below are the details', NULL, NULL, NULL, NULL, NULL, 'Вы получили сообщение от студента Ниже приведены подробные сведения'),
(1087, 'avail_in_students_course_search_results', 'Avail top in students course search results', NULL, NULL, NULL, NULL, NULL, 'Свободна в результатах поиска студентов курса'),
(1088, '_get_credits_here.', ' get credits here.', NULL, NULL, NULL, NULL, NULL, NULL),
(1089, '2', '2', NULL, NULL, NULL, NULL, NULL, NULL),
(1090, 'You got a message from Tutor Below are the details', 'You got a message from Tutor Below are the details', NULL, NULL, NULL, NULL, NULL, 'Вы получили сообщение от Tutor Ниже приведены подробные сведения'),
(1091, 'You have reached end of the list.', 'You have reached end of the list.', NULL, NULL, NULL, NULL, NULL, NULL),
(1092, 'You got a message from Institute Below are the details', 'You got a message from Institute Below are the details', NULL, NULL, NULL, NULL, NULL, 'Вы получили сообщение из Института Ниже приведены подробные сведения'),
(1093, 'not_yet_started', 'Not yet started', NULL, NULL, NULL, NULL, NULL, NULL),
(1094, 'you_do_not_have_enough_credits_to_book_the_tutor_Please_get_required_credits_here', 'You do not have enough credits to book the tutor Please get required credits here', NULL, NULL, NULL, NULL, NULL, NULL),
(1095, 'No Student enrolled in this batch.', 'No Student enrolled in this batch.', NULL, NULL, NULL, NULL, NULL, NULL),
(1096, 'no_categories_available', 'No categories available', NULL, NULL, NULL, NULL, NULL, NULL),
(1097, 'sub_Locaitons', 'Sub Locaitons', NULL, NULL, NULL, NULL, NULL, NULL),
(1098, 'you_do_not_have_enough_credits_to_enroll_in_the_institute_Please_get_required_credits_here', 'You do not have enough credits to enroll in the institute Please get required credits here', NULL, NULL, NULL, NULL, NULL, NULL),
(1099, 'you_already_booked_this_tutor_and_your_course_not_yet_completed', 'You already booked this tutor and your course not yet completed', NULL, NULL, NULL, NULL, NULL, NULL),
(1100, 'minutes', 'Minutes', NULL, NULL, NULL, NULL, NULL, 'минут'),
(1101, 'Thanks for rating the tutor Your review successfully sent to the Tutor', 'Thanks for rating the tutor Your review successfully sent to the Tutor', NULL, NULL, NULL, NULL, NULL, NULL),
(1102, 'Company_Name', 'Company Name', NULL, NULL, NULL, NULL, NULL, 'название компании'),
(1103, 'role', 'Role', NULL, NULL, NULL, NULL, NULL, NULL),
(1104, 'From', 'From', NULL, NULL, NULL, NULL, NULL, 'Из'),
(1105, 'To', 'To', NULL, NULL, NULL, NULL, NULL, NULL),
(1106, 'Forgot your password?', 'Forgot your password?', NULL, NULL, NULL, NULL, NULL, NULL),
(1107, 'are you sure?', 'Are you sure?', NULL, NULL, NULL, NULL, NULL, NULL),
(1108, 'Please send your request after twenty four hours of the Batch closed time Thank you', 'Please send your request after twenty four hours of the Batch closed time Thank you', NULL, NULL, NULL, NULL, NULL, NULL),
(1109, 'continue_course', 'Continue course', NULL, NULL, NULL, NULL, NULL, NULL),
(1110, 'Show_Available_Records_Count_in_Search_Filters', 'Show Available Records Count in Search Filters', NULL, NULL, NULL, NULL, NULL, NULL),
(1111, 'Advantages_Section', 'Advantages Section', NULL, NULL, NULL, NULL, NULL, NULL),
(1112, 'Featured_on_Section', 'Featured on Section', NULL, NULL, NULL, NULL, NULL, NULL),
(1113, 'Are_You_A_Teacher_Section', 'Are You A Teacher Section', NULL, NULL, NULL, NULL, NULL, NULL),
(1114, 'Footer_Section', 'Footer Section', NULL, NULL, NULL, NULL, NULL, NULL),
(1115, 'Get_Our_App_Section', 'Get Our App Section', NULL, NULL, NULL, NULL, NULL, NULL),
(1116, 'Primary_Footer_Section', 'Primary Footer Section', NULL, NULL, NULL, NULL, NULL, NULL),
(1117, 'Bottom_Section', 'Bottom Section', NULL, NULL, NULL, NULL, NULL, NULL),
(1118, 'Top_Most_Section', 'Top Most Section', NULL, NULL, NULL, NULL, NULL, NULL),
(1119, 'CRUD_opeartions_disabled_in_Demo_version', 'CRUD opeartions disabled in Demo version', NULL, NULL, NULL, NULL, NULL, NULL),
(1120, 'Please_do_not_delete_first_4_rows_as_they_are_deafult_pages_in_the_system', 'Please do not delete first 4 rows as they are deafult pages in the system', NULL, NULL, NULL, NULL, NULL, NULL),
(1121, 'Payment failed : ', 'Payment failed : ', NULL, NULL, NULL, NULL, NULL, NULL),
(1122, 'Seller_Id', 'Seller Id', NULL, NULL, NULL, NULL, NULL, NULL),
(1123, 'Secret_Word', 'Secret Word', NULL, NULL, NULL, NULL, NULL, NULL),
(1124, 'Is_Demo', 'Is Demo', NULL, NULL, NULL, NULL, NULL, NULL),
(1125, 'manual_payment_status', 'Manual payment status', NULL, NULL, NULL, NULL, NULL, NULL),
(1126, 'Enter you comments / Enter your transaction details so that admin can respond', 'Enter you comments / Enter your transaction details so that admin can respond', NULL, NULL, NULL, NULL, NULL, NULL),
(1127, 'Admin Response', 'Admin Response', NULL, NULL, NULL, NULL, NULL, NULL),
(1128, 'Subscription Date', 'Subscription Date', NULL, NULL, NULL, NULL, NULL, NULL),
(1129, 'Amount Paid', 'Amount Paid', NULL, NULL, NULL, NULL, NULL, NULL),
(1130, 'Enter you comments', 'Enter you comments', NULL, NULL, NULL, NULL, NULL, NULL),
(1131, 'payments', 'Payments', NULL, NULL, NULL, NULL, NULL, NULL),
(1132, 'Enter your comments so that user can respond', 'Enter your comments so that user can respond', NULL, NULL, NULL, NULL, NULL, NULL),
(1133, 'User Response', 'User Response', NULL, NULL, NULL, NULL, NULL, NULL),
(1134, 'Please select', 'Please select', NULL, NULL, NULL, NULL, NULL, NULL),
(1135, 'Payment Received?', 'Payment Received?', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pre_languagewords` (`lang_id`, `lang_key`, `english`, `spanish`, `bengali`, `french`, `japanese`, `hindi`, `russian`) VALUES
(1136, 'Reference No', 'Reference No', NULL, NULL, NULL, NULL, NULL, NULL),
(1137, 'pending payments', 'Pending payments', NULL, NULL, NULL, NULL, NULL, NULL),
(1138, 'Payment success', 'Payment success', NULL, NULL, NULL, NULL, NULL, NULL),
(1139, 'OnlineOffline_gateway', 'OnlineOffline gateway', NULL, NULL, NULL, NULL, NULL, NULL),
(1140, 'Purse_WMZ', 'Purse WMZ', NULL, NULL, NULL, NULL, NULL, NULL),
(1141, 'Secret_key_for_WMZ', 'Secret key for WMZ', NULL, NULL, NULL, NULL, NULL, NULL),
(1142, 'Purse_WME', 'Purse WME', NULL, NULL, NULL, NULL, NULL, NULL),
(1143, 'Secret_key_for_WME', 'Secret key for WME', NULL, NULL, NULL, NULL, NULL, NULL),
(1144, 'Purse_WMR', 'Purse WMR', NULL, NULL, NULL, NULL, NULL, NULL),
(1145, 'Secret_key_for_WMR', 'Secret key for WMR', NULL, NULL, NULL, NULL, NULL, NULL),
(1146, 'Purse_WMU', 'Purse WMU', NULL, NULL, NULL, NULL, NULL, NULL),
(1147, 'Secret_key_for_WMU', 'Secret key for WMU', NULL, NULL, NULL, NULL, NULL, NULL),
(1148, 'Instructions', 'Instructions', NULL, NULL, NULL, NULL, NULL, NULL),
(1149, 'Payment_Gateway', 'Payment Gateway', NULL, NULL, NULL, NULL, NULL, NULL),
(1150, 'Title : ', 'Title : ', NULL, NULL, NULL, NULL, NULL, NULL),
(1151, 'buy_courses', 'Buy courses', NULL, NULL, NULL, NULL, NULL, NULL),
(1152, 'join', 'Join', NULL, NULL, NULL, NULL, NULL, NULL),
(1153, 'Initiate Meeting : ', 'Initiate Meeting : ', NULL, NULL, NULL, NULL, NULL, NULL),
(1154, 'with_meeting_id', 'With meeting id', NULL, NULL, NULL, NULL, NULL, NULL),
(1155, 'join_now', 'Join now', NULL, NULL, NULL, NULL, NULL, NULL),
(1156, 'Invalid Meeting Details', 'Invalid Meeting Details', NULL, NULL, NULL, NULL, NULL, NULL),
(1157, 'checkout', 'Checkout', NULL, NULL, NULL, NULL, NULL, NULL),
(1158, 'Sell_Courses_Online', 'Sell Courses Online', NULL, NULL, NULL, NULL, NULL, NULL),
(1159, 'Course_Title', 'Course Title', NULL, NULL, NULL, NULL, NULL, NULL),
(1160, 'About_the_Course', 'About the Course', NULL, NULL, NULL, NULL, NULL, NULL),
(1161, 'Skill_Level', 'Skill Level', NULL, NULL, NULL, NULL, NULL, NULL),
(1162, 'Languages', 'Languages', NULL, NULL, NULL, NULL, NULL, NULL),
(1163, 'Preview_File', 'Preview File', NULL, NULL, NULL, NULL, NULL, NULL),
(1164, 'Course_Price', 'Course Price', NULL, NULL, NULL, NULL, NULL, NULL),
(1165, 'Maximum_number_of_Downloads', 'Maximum number of Downloads', NULL, NULL, NULL, NULL, NULL, NULL),
(1166, 'max_downloads', 'Max downloads', NULL, NULL, NULL, NULL, NULL, NULL),
(1167, 'Curriculum', 'Curriculum', NULL, NULL, NULL, NULL, NULL, NULL),
(1168, 'Curriculum_Titles', 'Curriculum Titles', NULL, NULL, NULL, NULL, NULL, NULL),
(1169, 'Curriculum_Files', 'Curriculum Files', NULL, NULL, NULL, NULL, NULL, NULL),
(1170, 'Please upload files only with allowed formats', 'Please upload files only with allowed formats', NULL, NULL, NULL, NULL, NULL, NULL),
(1171, 'Allowed File Foramts are', 'Allowed File Foramts are', NULL, NULL, NULL, NULL, NULL, NULL),
(1172, 'publish', 'Publish', NULL, NULL, NULL, NULL, NULL, NULL),
(1173, 'List_Selling_Courses', 'List Selling Courses', NULL, NULL, NULL, NULL, NULL, NULL),
(1174, 'file', 'File', NULL, NULL, NULL, NULL, NULL, NULL),
(1175, 'Curriculum_Source', 'Curriculum Source', NULL, NULL, NULL, NULL, NULL, NULL),
(1176, 'Your course has been published successfully', 'Your course has been published successfully', NULL, NULL, NULL, NULL, NULL, NULL),
(1177, 'Published_Courses', 'Published Courses', NULL, NULL, NULL, NULL, NULL, NULL),
(1178, 'My_Selling_Courses_List', 'My Selling Courses List', NULL, NULL, NULL, NULL, NULL, NULL),
(1179, 'title', 'Title', NULL, NULL, NULL, NULL, NULL, NULL),
(1180, 'price', 'Price', NULL, NULL, NULL, NULL, NULL, NULL),
(1181, 'Your course not published due to invalid input data', 'Your course not published due to invalid input data', NULL, NULL, NULL, NULL, NULL, NULL),
(1182, 'My_Selling_Courses', 'My Selling Courses', NULL, NULL, NULL, NULL, NULL, NULL),
(1183, 'Are you sure that you want to delete this record?', 'Are you sure that you want to delete this record?', NULL, NULL, NULL, NULL, NULL, NULL),
(1184, 'Record_Deleted_Successfully', 'Record Deleted Successfully', NULL, NULL, NULL, NULL, NULL, NULL),
(1185, 'View_Curriculum', 'View Curriculum', NULL, NULL, NULL, NULL, NULL, NULL),
(1186, 'Selling_Course_Curriculum', 'Selling Course Curriculum', NULL, NULL, NULL, NULL, NULL, NULL),
(1187, 'Selling_Course_Information', 'Selling Course Information', NULL, NULL, NULL, NULL, NULL, NULL),
(1188, 'Admin_Approved', 'Admin Approved', NULL, NULL, NULL, NULL, NULL, NULL),
(1189, 'Created_At', 'Created At', NULL, NULL, NULL, NULL, NULL, NULL),
(1190, 'Updated_At', 'Updated At', NULL, NULL, NULL, NULL, NULL, NULL),
(1191, 'File_Size', 'File Size', NULL, NULL, NULL, NULL, NULL, NULL),
(1192, 'back', 'Back', NULL, NULL, NULL, NULL, NULL, NULL),
(1193, 'Note1', 'Note1', NULL, NULL, NULL, NULL, NULL, NULL),
(1194, 'Admin_Commission_Percentage_On_Each_Purchase', 'Admin Commission Percentage On Each Purchase', NULL, NULL, NULL, NULL, NULL, NULL),
(1195, 'Note2', 'Note2', NULL, NULL, NULL, NULL, NULL, NULL),
(1196, 'Published_By', 'Published By', NULL, NULL, NULL, NULL, NULL, NULL),
(1197, 'Tutor_Selling_Courses', 'Tutor Selling Courses', NULL, NULL, NULL, NULL, NULL, NULL),
(1198, 'selling_courses', 'Selling courses', NULL, NULL, NULL, NULL, NULL, NULL),
(1199, 'buy_course', 'Buy course', NULL, NULL, NULL, NULL, NULL, NULL),
(1200, 'Buy_This_Course', 'Buy This Course', NULL, NULL, NULL, NULL, NULL, NULL),
(1201, 'lectures', 'Lectures', NULL, NULL, NULL, NULL, NULL, NULL),
(1202, 'Maximum_Downloads', 'Maximum Downloads', NULL, NULL, NULL, NULL, NULL, NULL),
(1203, 'attachments', 'Attachments', NULL, NULL, NULL, NULL, NULL, NULL),
(1204, 'add_more', 'Add more', NULL, NULL, NULL, NULL, NULL, NULL),
(1205, 'remove_this', 'Remove this', NULL, NULL, NULL, NULL, NULL, NULL),
(1206, 'Preview_Image', 'Preview Image', NULL, NULL, NULL, NULL, NULL, NULL),
(1207, 'are_allowed_formats_for_preview_image', 'Are allowed formats for preview image', NULL, NULL, NULL, NULL, NULL, NULL),
(1208, '_are_allowed_formats_for_preview_image', ' are allowed formats for preview image', NULL, NULL, NULL, NULL, NULL, NULL),
(1209, 'Your course has been updated successfully', 'Your course has been updated successfully', NULL, NULL, NULL, NULL, NULL, NULL),
(1210, 'Course_Image', 'Course Image', NULL, NULL, NULL, NULL, NULL, NULL),
(1211, '_are_allowed_formats_for_course_image', ' are allowed formats for course image', NULL, NULL, NULL, NULL, NULL, NULL),
(1212, 'Click_to_view', 'Click to view', NULL, NULL, NULL, NULL, NULL, NULL),
(1213, 'pay', 'Pay', NULL, NULL, NULL, NULL, NULL, NULL),
(1214, 'By placing the order You have read and agreed to our', 'By placing the order You have read and agreed to our', NULL, NULL, NULL, NULL, NULL, NULL),
(1215, 'Terms of Use and Privacy Policy', 'Terms of Use and Privacy Policy', NULL, NULL, NULL, NULL, NULL, NULL),
(1216, 'Choose_Payment_Method', 'Choose Payment Method', NULL, NULL, NULL, NULL, NULL, NULL),
(1217, 'Please_select_payment_gateway', 'Please select payment gateway', NULL, NULL, NULL, NULL, NULL, NULL),
(1218, 'Total Amount', 'Total Amount', NULL, NULL, NULL, NULL, NULL, NULL),
(1219, 'Download', 'Download', NULL, NULL, NULL, NULL, NULL, NULL),
(1220, 'My_Course_Purchases', 'My Course Purchases', NULL, NULL, NULL, NULL, NULL, NULL),
(1221, 'Purchased_On', 'Purchased On', NULL, NULL, NULL, NULL, NULL, NULL),
(1222, 'Download_Course_Curriculum', 'Download Course Curriculum', NULL, NULL, NULL, NULL, NULL, NULL),
(1223, 'You_have_reached_maximum_limit_of_downloads_Please_purchase_the_course_again_to_download_the_fiels_Thank_you', 'You have reached maximum limit of downloads Please purchase the course again to download the fiels Thank you', NULL, NULL, NULL, NULL, NULL, NULL),
(1224, 'Course_Curriculum_could_not_be_downloaded_due_to_some_technical_issue_Please_download_after_some_time', 'Course Curriculum could not be downloaded due to some technical issue Please download after some time', NULL, NULL, NULL, NULL, NULL, NULL),
(1225, 'Purchased_Courses', 'Purchased Courses', NULL, NULL, NULL, NULL, NULL, NULL),
(1226, 'Payment_from_Admin', 'Payment from Admin', NULL, NULL, NULL, NULL, NULL, NULL),
(1227, 'View_Download_History', 'View Download History', NULL, NULL, NULL, NULL, NULL, NULL),
(1228, 'Course_Download_History', 'Course Download History', NULL, NULL, NULL, NULL, NULL, NULL),
(1229, 'View_Purchased_Courses', 'View Purchased Courses', NULL, NULL, NULL, NULL, NULL, NULL),
(1230, 'sections', 'Sections', NULL, NULL, NULL, NULL, NULL, NULL),
(1231, 'list_sections', 'List sections', NULL, NULL, NULL, NULL, NULL, NULL),
(1232, 'section_name', 'Section name', NULL, NULL, NULL, NULL, NULL, NULL),
(1233, 'Get_This_Course', 'Get This Course', NULL, NULL, NULL, NULL, NULL, NULL),
(1234, 'import', 'Import', NULL, NULL, NULL, NULL, NULL, NULL),
(1235, 'file import', 'File import', NULL, NULL, NULL, NULL, NULL, NULL),
(1236, 'file to import', 'File to import', NULL, NULL, NULL, NULL, NULL, NULL),
(1237, '_are_allowed_formats_for_preview_file', ' are allowed formats for preview file', NULL, NULL, NULL, NULL, NULL, NULL),
(1238, 'maximum_allowed_file_size_is_20_MB_for_each_file', 'Maximum allowed file size is 20 MB for each file', NULL, NULL, NULL, NULL, NULL, NULL),
(1239, 'view_uploaded_curriculum', 'View uploaded curriculum', NULL, NULL, NULL, NULL, NULL, NULL),
(1240, 'action', 'Action', NULL, NULL, NULL, NULL, NULL, NULL),
(1241, 'No_Details_Found', 'No Details Found', NULL, NULL, NULL, NULL, NULL, NULL),
(1242, 'No_Curriculum_added', 'No Curriculum added', NULL, NULL, NULL, NULL, NULL, NULL),
(1243, 'checkout_with_Razorpay', 'Checkout with Razorpay', NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `pre_locations`
--

CREATE TABLE `pre_locations` (
  `id` int(11) NOT NULL,
  `location_name` varchar(512) NOT NULL DEFAULT '',
  `parent_location_id` int(11) NOT NULL DEFAULT '0',
  `code` char(8) DEFAULT NULL,
  `slug` varchar(256) DEFAULT NULL,
  `sort_order` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `status` enum('Active','Inactive') NOT NULL DEFAULT 'Active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pre_locations`
--

INSERT INTO `pre_locations` (`id`, `location_name`, `parent_location_id`, `code`, `slug`, `sort_order`, `created_at`, `updated_at`, `status`) VALUES
(1, 'Colorado', 0, 'CLD', 'colorado', NULL, '2016-11-08 09:49:01', '2016-11-21 10:17:02', 'Active'),
(2, 'California', 0, 'CAL', 'california', NULL, '2016-11-08 09:47:04', '2016-11-17 18:35:55', 'Active'),
(3, 'Los Angeles', 2, 'LAS', 'los-angeles', NULL, '2016-11-08 09:58:10', NULL, 'Active'),
(4, 'San Diego', 2, 'SAD', 'san-diego', NULL, '2016-11-08 09:58:45', NULL, 'Active'),
(5, 'San Jose', 2, 'SAJ', 'san-jose', NULL, '2016-11-08 09:59:05', NULL, 'Active'),
(6, 'San Francisco', 2, 'SAF', 'san-francisco', NULL, '2016-11-08 09:59:42', NULL, 'Active'),
(7, 'Fresno', 2, 'FRN', 'fresno', NULL, '2016-11-08 09:59:57', NULL, 'Active'),
(8, 'Sacramento', 2, 'SAN', 'sacramento', NULL, '2016-11-08 10:00:20', NULL, 'Active'),
(9, 'Long Beach', 2, 'LNGB', 'long-beach', NULL, '2016-11-08 10:00:37', NULL, 'Active'),
(10, 'Oakland', 2, 'OAK', 'oakland', NULL, '2016-11-08 10:00:55', NULL, 'Active'),
(11, 'Bakersfield', 2, 'BKF', 'bakersfield', NULL, '2016-11-08 10:01:15', NULL, 'Active'),
(12, 'Anaheim', 2, 'AMA', 'anaheim', NULL, '2016-11-08 10:01:37', NULL, 'Active'),
(13, 'Denver', 1, 'DN', 'denver', NULL, '2016-11-08 10:02:43', NULL, 'Active'),
(14, 'Colorado Springs', 1, 'CLS', 'colorado-springs', NULL, '2016-11-08 10:02:54', NULL, 'Active'),
(15, 'Aurora', 1, 'AR', 'aurora', NULL, '2016-11-08 10:03:08', NULL, 'Active'),
(16, 'Fort Collins', 1, 'FTCS', 'fort-collins', NULL, '2016-11-08 10:03:19', NULL, 'Active'),
(17, 'Lakewood', 1, 'LKD', 'lakewood', NULL, '2016-11-08 10:03:31', NULL, 'Active'),
(18, 'Thornton', 1, 'TRT', 'thornton', NULL, '2016-11-08 10:03:44', NULL, 'Active'),
(19, 'Arvada', 1, 'AV', 'arvada', NULL, '2016-11-08 10:03:57', NULL, 'Active'),
(20, 'Westminster', 1, 'WSM', 'westminster', NULL, '2016-11-08 10:04:11', NULL, 'Active'),
(21, 'Pueblo', 1, 'PU', 'pueblo', NULL, '2016-11-08 10:04:28', NULL, 'Active'),
(22, 'Centennial', 1, 'CNL', 'centennial', NULL, '2016-11-08 10:04:37', NULL, 'Active'),
(23, 'Florida', 0, 'FLA', 'florida', NULL, '2016-11-08 10:04:56', '2016-11-08 10:05:17', 'Active'),
(24, 'Jacksonville', 23, 'JS', 'jacksonville', NULL, '2016-11-08 10:05:40', NULL, 'Active'),
(25, 'Miami', 23, 'MA', 'miami', NULL, '2016-11-08 10:05:56', NULL, 'Active'),
(26, 'Tampa', 23, 'TP', 'tampa', NULL, '2016-11-08 10:05:56', NULL, 'Active'),
(27, 'Orlando', 23, 'OL', 'orlando', NULL, '2016-11-08 10:06:37', NULL, 'Active'),
(28, 'Hialeah', 23, 'HIA', 'hialeah', NULL, '2016-11-08 10:06:37', NULL, 'Active'),
(29, 'Tallahassee', 23, 'THS', 'tallahassee', NULL, '2016-11-08 10:06:37', NULL, 'Active'),
(30, 'Fort Lauderdale', 23, 'FLD', 'fort-lauderdale', NULL, '2016-11-08 10:09:02', NULL, 'Active'),
(31, 'Pembroke Pines', 23, 'PP', 'pembroke-pines', NULL, '2016-11-08 10:09:22', NULL, 'Active'),
(32, 'Hollywood', 23, 'HW', 'hollywood', NULL, '2016-11-08 10:09:32', NULL, 'Active'),
(33, 'Miramar', 23, 'MM', 'miramar', NULL, '2016-11-08 10:09:41', NULL, 'Active'),
(34, 'Texas', 0, 'TX', 'texas', NULL, '2016-11-08 10:09:58', NULL, 'Active'),
(35, 'Houston', 34, 'HU', 'houston', NULL, '2016-11-08 10:11:02', NULL, 'Active'),
(36, 'San Antonio', 34, 'SNA', 'san-antonio', NULL, '2016-11-08 10:11:17', NULL, 'Active'),
(37, 'Dallas', 34, 'DAS', 'dallas', NULL, '2016-11-08 10:11:31', NULL, 'Active'),
(38, 'Austin', 34, 'AUS', 'austin', NULL, '2016-11-08 10:11:42', NULL, 'Active'),
(39, 'Fort Worth', 34, 'FW', 'fort-worth', NULL, '2016-11-08 10:11:54', NULL, 'Active'),
(40, 'El Paso', 34, 'EP', 'el-paso', NULL, '2016-11-08 10:12:06', NULL, 'Active'),
(41, 'Arlington', 34, 'ALG', 'arlington', NULL, '2016-11-08 10:12:16', NULL, 'Active'),
(42, 'Corpus Christi', 34, 'CC', 'corpus-christi', NULL, '2016-11-08 10:12:29', NULL, 'Active'),
(43, 'Plano', 34, 'PA', 'plano', NULL, '2016-11-08 10:12:41', NULL, 'Active'),
(44, 'Laredo', 34, 'LAR', 'laredo', NULL, '2016-11-08 10:12:56', NULL, 'Active'),
(45, 'Garland', 34, 'GAR', 'garland', NULL, '2016-11-08 10:13:10', NULL, 'Active'),
(46, 'Arizona', 0, 'ARI', 'arizona', NULL, '2016-11-08 10:13:56', NULL, 'Active'),
(47, 'Phoenix', 46, 'PHO', 'phoenix', NULL, '2016-11-08 10:14:10', NULL, 'Active'),
(48, 'Tucson', 46, 'TUC', 'tucson', NULL, '2016-11-08 10:14:27', NULL, 'Active'),
(49, 'Mesa', 46, 'MES', 'mesa', NULL, '2016-11-08 10:14:40', NULL, 'Active'),
(50, 'Chandler', 46, 'CHD', 'chandler', NULL, '2016-11-08 10:14:51', NULL, 'Active'),
(51, 'Glendale', 46, 'GLE', 'glendale', NULL, '2016-11-08 10:15:09', NULL, 'Active'),
(52, 'Scottsdale', 46, 'SCS', 'scottsdale', NULL, '2016-11-08 10:15:20', NULL, 'Active'),
(53, 'Gilbert', 46, 'GLB', 'gilbert', NULL, '2016-11-08 10:15:33', NULL, 'Active'),
(54, 'Tempe', 46, 'TM', 'tempe', NULL, '2016-11-08 10:15:47', NULL, 'Active'),
(55, 'Peoria', 46, 'PEO', 'peoria', NULL, '2016-11-08 10:16:01', NULL, 'Active'),
(56, 'Surprise', 46, 'SPE', 'surprise', NULL, '2016-11-08 10:16:13', NULL, 'Active'),
(57, 'Illinois', 0, 'LLI', 'illinois', NULL, '2016-11-08 10:17:04', NULL, 'Active'),
(58, 'Chicago', 57, 'CHIC', 'chicago', NULL, '2016-11-08 10:17:21', NULL, 'Active'),
(59, 'Rockford', 57, 'RF', 'rockford', NULL, '2016-11-08 10:17:46', NULL, 'Active'),
(60, 'Joliet', 57, 'JEL', 'joliet', NULL, '2016-11-08 10:18:25', NULL, 'Active'),
(61, 'Naperville', 57, 'NPV', 'naperville', NULL, '2016-11-08 10:18:39', NULL, 'Active'),
(62, 'Springfield', 57, 'SPF', 'springfield', NULL, '2016-11-08 10:18:52', NULL, 'Active'),
(63, 'Elgin', 57, 'EL', 'elgin', NULL, '2016-11-08 10:19:05', NULL, 'Active'),
(64, 'Connecticut', 0, 'CNT', 'connecticut', NULL, '2016-11-08 10:36:32', '2016-11-21 11:12:12', 'Inactive'),
(65, 'Bridgeport', 64, 'BRD', 'bridgeport', NULL, '2016-11-08 10:36:56', NULL, 'Inactive'),
(66, 'New Haven', 64, 'NH', 'new-haven', NULL, '2016-11-08 10:37:09', NULL, 'Inactive'),
(67, 'Stamford', 64, 'SF', 'stamford', NULL, '2016-11-08 10:38:52', NULL, 'Inactive'),
(68, 'Hartford', 64, 'HF', 'hartford', NULL, '2016-11-08 10:39:04', NULL, 'Inactive'),
(69, 'Waterbury', 64, 'WA', 'waterbury', NULL, '2016-11-08 10:41:24', NULL, 'Inactive'),
(70, 'Georgia', 0, 'GEO', 'georgia', NULL, '2016-11-08 10:41:44', '2016-11-22 14:07:11', 'Inactive'),
(71, 'Atlanta', 70, 'ATL', 'atlanta', NULL, '2016-11-08 10:42:03', NULL, 'Inactive'),
(72, 'Columbus', 70, 'COL', 'columbus', NULL, '2016-11-08 10:42:14', NULL, 'Inactive'),
(73, 'Augusta', 70, 'AUGU', 'augusta', NULL, '2016-11-08 10:42:23', NULL, 'Inactive'),
(74, 'Savannah', 70, 'SAV', 'savannah', NULL, '2016-11-08 10:42:37', NULL, 'Inactive'),
(75, 'Athens', 70, 'ATH', 'athens', NULL, '2016-11-08 10:42:48', NULL, 'Inactive'),
(76, 'Indiana', 0, 'INDI', 'indiana', NULL, '2016-11-08 10:43:07', '2016-11-22 12:59:30', 'Inactive'),
(77, 'Indianapolis', 76, 'INDA', 'indianapolis', NULL, '2016-11-08 10:43:19', NULL, 'Inactive'),
(78, 'Fort Wayne', 76, 'FWA', 'fort-wayne', NULL, '2016-11-08 10:43:36', NULL, 'Inactive'),
(79, 'Evansville', 76, 'EVA', 'evansville', NULL, '2016-11-08 10:43:55', NULL, 'Inactive'),
(80, 'South Bend', 76, 'SB', 'south-bend', NULL, '2016-11-08 10:44:11', NULL, 'Inactive'),
(81, 'Iowa', 0, 'LA', 'iowa', NULL, '2016-11-08 10:44:25', '2016-11-21 11:09:38', 'Inactive'),
(82, 'Des Moines', 81, 'DM', 'des-moines', NULL, '2016-11-08 10:44:46', NULL, 'Inactive'),
(83, 'Cedar Rapids', 81, 'CRS', 'cedar-rapids', NULL, '2016-11-08 10:45:00', NULL, 'Inactive'),
(84, 'Davenport', 81, 'DAV', 'davenport', NULL, '2016-11-08 10:45:12', NULL, 'Inactive'),
(85, 'Kansas', 0, 'KAN', 'kansas', NULL, '2016-11-08 10:45:25', '2016-11-22 13:00:16', 'Inactive'),
(86, 'Wichita', 85, 'WIC', 'wichita', NULL, '2016-11-08 10:45:44', NULL, 'Inactive'),
(87, 'Overland Park', 85, 'OPK', 'overland-park', NULL, '2016-11-08 10:46:01', NULL, 'Inactive'),
(88, 'Kansas City', 85, 'KNC', 'kansas-city', NULL, '2016-11-08 10:46:30', NULL, 'Inactive'),
(89, 'Olathe', 85, 'OLE', 'olathe', NULL, '2016-11-08 10:46:44', NULL, 'Inactive'),
(90, 'Topeka', 85, 'TPA', 'topeka', NULL, '2016-11-08 10:46:55', NULL, 'Inactive'),
(91, 'Louisiana', 0, 'LUA', 'louisiana', NULL, '2016-11-08 10:47:23', '2016-11-22 13:00:51', 'Inactive'),
(92, 'New Orleans', 91, 'NOR', 'new-orleans', NULL, '2016-11-08 10:47:40', NULL, 'Inactive'),
(93, 'Baton Rouge', 91, 'BR', 'baton-rouge', NULL, '2016-11-08 10:47:54', NULL, 'Inactive'),
(94, 'Shreveport', 91, 'SV', 'shreveport', NULL, '2016-11-08 10:48:02', NULL, 'Inactive'),
(95, 'Lafayette', 91, 'LY', 'lafayette', NULL, '2016-11-08 10:48:17', NULL, 'Inactive'),
(96, 'Massachusetts', 0, 'MASS', 'massachusetts', NULL, '2016-11-08 10:48:41', '2016-11-22 13:01:00', 'Inactive'),
(97, 'Boston', 96, 'BOS', 'boston', NULL, '2016-11-08 10:48:55', NULL, 'Inactive'),
(98, 'Worcester', 96, 'WRC', 'worcester', NULL, '2016-11-08 10:49:05', NULL, 'Inactive'),
(99, 'Lowell', 96, 'LW', 'lowell', NULL, '2016-11-08 10:49:16', NULL, 'Inactive'),
(100, 'Cambridge', 96, 'CAM', 'cambridge', NULL, '2016-11-08 10:49:43', NULL, 'Inactive'),
(101, 'Michigan', 0, 'MIC', 'michigan', NULL, '2016-11-08 10:49:56', '2016-11-22 13:01:12', 'Inactive'),
(102, 'Detroit', 101, 'DET', 'detroit', NULL, '2016-11-08 10:50:10', NULL, 'Inactive'),
(103, 'Grand Rapids', 101, 'GRA', 'grand-rapids', NULL, '2016-11-08 10:50:21', NULL, 'Inactive'),
(104, 'Warren', 101, 'WAR', 'warren', NULL, '2016-11-08 10:50:35', NULL, 'Inactive'),
(105, 'Sterling Heights', 101, 'SH', 'sterling-heights', NULL, '2016-11-08 10:50:46', NULL, 'Inactive'),
(106, 'Ann Arbor', 101, 'AA', 'ann-arbor', NULL, '2016-11-08 10:50:58', NULL, 'Inactive'),
(107, 'Lansing', 101, 'LSG', 'lansing', NULL, '2016-11-08 10:51:06', NULL, 'Inactive'),
(108, 'Flint', 101, 'FT', 'flint', NULL, '2016-11-08 10:51:18', NULL, 'Inactive'),
(109, 'Missouri', 0, 'MISI', 'missouri', NULL, '2016-11-08 10:51:41', NULL, 'Active'),
(110, 'Independence', 109, 'INDE', 'independence', NULL, '2016-11-08 10:52:26', NULL, 'Active'),
(111, 'Columbia', 109, 'COLU', 'columbia', NULL, '2016-11-08 10:53:01', NULL, 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `pre_login_attempts`
--

CREATE TABLE `pre_login_attempts` (
  `id` int(11) UNSIGNED NOT NULL,
  `ip_address` varchar(15) NOT NULL,
  `login` varchar(100) NOT NULL,
  `time` int(11) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pre_messages`
--

CREATE TABLE `pre_messages` (
  `message_id` bigint(20) NOT NULL,
  `from_user_id` int(11) NOT NULL,
  `to_user_id` int(11) NOT NULL,
  `name` varchar(512) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(30) NOT NULL,
  `course_slug` varchar(512) DEFAULT NULL,
  `message` varchar(1000) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pre_messages`
--

INSERT INTO `pre_messages` (`message_id`, `from_user_id`, `to_user_id`, `name`, `email`, `phone`, `course_slug`, `message`, `created_at`, `updated_at`) VALUES
(1, 2, 9, 'Ayzlee Rayhanna', 'raju72314@gmail.com', '7207757581', 'Oracle', 'dd', '2017-02-24 18:27:41', '2017-02-24 18:27:41');

-- --------------------------------------------------------

--
-- Table structure for table `pre_newsletter_subscriptions`
--

CREATE TABLE `pre_newsletter_subscriptions` (
  `subscription_id` int(11) NOT NULL,
  `email_address` varchar(256) DEFAULT NULL,
  `created` datetime NOT NULL,
  `ipaddress` varchar(20) NOT NULL,
  `browser` varchar(512) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pre_packages`
--

CREATE TABLE `pre_packages` (
  `id` int(11) NOT NULL,
  `package_name` varchar(512) NOT NULL DEFAULT '',
  `package_for` enum('Student','Tutor','Institute','All') NOT NULL,
  `description` text NOT NULL,
  `image` varchar(50) NOT NULL DEFAULT '',
  `credits` int(11) NOT NULL DEFAULT '0',
  `discount_type` enum('Value','Percent') NOT NULL DEFAULT 'Percent',
  `discount` int(11) NOT NULL DEFAULT '0',
  `package_cost` varchar(512) NOT NULL DEFAULT '',
  `status` enum('Active','In-Active') NOT NULL DEFAULT 'Active',
  `date_updated` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pre_packages`
--

INSERT INTO `pre_packages` (`id`, `package_name`, `package_for`, `description`, `image`, `credits`, `discount_type`, `discount`, `package_cost`, `status`, `date_updated`) VALUES
(1, 'Gold-Student', 'Student', '<p>\r\n	Good</p>\r\n', '', 3000, 'Percent', 20, '500', 'Active', NULL),
(2, 'Gold-Tutor', 'Tutor', '<p>\r\n	Good</p>\r\n', '', 1000, 'Percent', 20, '500', 'Active', NULL),
(3, 'Gold-Inst', 'Institute', '<p>\r\n	Good</p>\r\n', '', 1000, 'Percent', 20, '500', 'Active', NULL),
(4, 'Premium-Student', 'Student', '<p>\r\n	Good</p>\r\n', '', 500, 'Value', 50, '250', 'Active', NULL),
(5, 'Premium-Tutor', 'Tutor', '<p>\r\n	Good</p>\r\n', '', 500, 'Value', 50, '250', 'Active', NULL),
(6, 'Premium-Inst', 'Institute', '<p>\r\n	Good</p>\r\n', '', 500, 'Value', 50, '250', 'Active', NULL),
(7, 'Silver-Student', 'Student', '<p>\r\n	Good</p>\r\n', '', 100, 'Percent', 10, '100', 'Active', NULL),
(8, 'Silver-Tutor', 'Tutor', '<p>\r\n	Good</p>\r\n', '', 100, 'Percent', 10, '100', 'Active', NULL),
(9, 'Silver-Inst', 'Institute', '<p>\r\n	Good</p>\r\n', '', 100, 'Percent', 10, '100', 'Active', NULL),
(10, 'General Package', 'All', '<p>\r\n	Good</p>\r\n', '', 600, 'Percent', 25, '400', 'Active', NULL),
(11, 'Basic Package', 'All', '<p>\r\n	Good</p>\r\n', '', 300, 'Value', 30, '200', 'Active', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `pre_pages`
--

CREATE TABLE `pre_pages` (
  `id` int(11) NOT NULL,
  `name` varchar(512) NOT NULL,
  `slug` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `meta_tag` varchar(512) NOT NULL,
  `meta_description` varchar(512) NOT NULL,
  `seo_keywords` varchar(512) NOT NULL,
  `status` enum('Active','Inactive') NOT NULL DEFAULT 'Active'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pre_pages`
--

INSERT INTO `pre_pages` (`id`, `name`, `slug`, `description`, `meta_tag`, `meta_description`, `seo_keywords`, `status`) VALUES
(1, 'About Us', 'about-us', '<div class="container">\r\n	<div class="row row-top">\r\n		<div class="col-sm-12">\r\n			<h2 class="heading-line">\r\n				Why Choose Us</h2>\r\n		</div>\r\n		<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">\r\n			<div class="about-block">\r\n				<div class="media-left">\r\n					&nbsp;</div>\r\n				<div class="media-body">\r\n					<h4>\r\n						Exceptional tutors.</h4>\r\n					<p>\r\n						We only accept the best from thousands of applicants, so you can choose from the widest range of qualified experts.</p>\r\n				</div>\r\n			</div>\r\n			<div class="about-block">\r\n				<div class="media-left">\r\n					&nbsp;</div>\r\n				<div class="media-body">\r\n					<h4>\r\n						24/7 Access</h4>\r\n					<p>\r\n						School is tough. Getting a tutor is easy. Get a real tutor anytime, anywhere in our online classroom.</p>\r\n				</div>\r\n			</div>\r\n			<div class="about-block">\r\n				<div class="media-left">\r\n					&nbsp;</div>\r\n				<div class="media-body">\r\n					<h4>\r\n						Variety of Subjects</h4>\r\n					<p>\r\n						From Algebra, Calculus and Statistics to English, Chemistry and Physics. Test prep and AP, too.</p>\r\n				</div>\r\n			</div>\r\n		</div>\r\n		<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">\r\n			<img alt="" class="img-responsive" src="http://dev.mindsworthy.com/tutorsci/assets/front/images/why-choose.png" /></div>\r\n	</div>\r\n</div>\r\n<p>\r\n	&nbsp;</p>\r\n', 'aboutus - tutors', 'about us', 'about us, tutors about, about tutors', 'Active'),
(2, 'How It Works', 'how-it-works', '<section class="how-it-works">\r\n	<div class="container">\r\n		<div class="row row-margin">\r\n			<div class="col-sm-12 ">\r\n				<h2 class="heading">\r\n					How Does This <span>Work</span></h2>\r\n			</div>\r\n			<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">\r\n				<div class="step-block center-block">\r\n					<div class="step-img">\r\n						<img alt="" src="http://dev.mindsworthy.com/tutorsci/assets/front/images/step1.png" />\r\n						<div class="step-icon">\r\n							1</div>\r\n					</div>\r\n					<h4>\r\n						Start Your Search</h4>\r\n					<p>\r\n						Search for online tutoring. Need help with your search? Request a tutor and we&rsquo;ll have tutors contact you very soon!</p>\r\n				</div>\r\n			</div>\r\n			<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">\r\n				<div class="step-block center-block">\r\n					<div class="step-img">\r\n						<img alt="" src="http://dev.mindsworthy.com/tutorsci/assets/front/images/step2.png" />\r\n						<div class="step-icon">\r\n							2</div>\r\n					</div>\r\n					<h4>\r\n						Review</h4>\r\n					<p>\r\n						Read feedback and ratings from parents and students. Detailed tutor profiles also include photos more.</p>\r\n				</div>\r\n			</div>\r\n			<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">\r\n				<div class="step-block center-block">\r\n					<div class="step-img">\r\n						<img alt="" src="http://dev.mindsworthy.com/tutorsci/assets/front/images/step3.png" />\r\n						<div class="step-icon">\r\n							3</div>\r\n					</div>\r\n					<h4>\r\n						Schedule</h4>\r\n					<p>\r\n						Communicate directly with tutors to find a time that works for you. Whether you need a single lesson.</p>\r\n				</div>\r\n			</div>\r\n			<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">\r\n				<div class="step-block center-block">\r\n					<div class="step-img">\r\n						<img alt="" src="http://dev.mindsworthy.com/tutorsci/assets/front/images/step4.png" />\r\n						<div class="step-icon">\r\n							4</div>\r\n					</div>\r\n					<h4>\r\n						Start Learning</h4>\r\n					<p>\r\n						One-on-one instruction is the most effective way to learn. Let us handle payments and administrative details.</p>\r\n				</div>\r\n			</div>\r\n		</div>\r\n	</div>\r\n</section>\r\n<p>\r\n	&nbsp;</p>\r\n', '', '', '', 'Active'),
(3, 'Terms and Conditions', 'terms-and-conditions', '<p>\r\n	<strong>Terms and Conditions</strong></p>\r\n<p>\r\n	These are the terms and condition</p>\r\n<p>\r\n	&nbsp;</p>\r\n', '', '', '', 'Active'),
(4, 'Privacy and Policy', 'privacy-and-policy', '<p>\r\n	Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum</p>\r\n', '', '', '', 'Active'),
(5, 'Test Page', 'test-page', '<p>\r\n	Test Page content goes here</p>\r\n', '', '', '', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `pre_payments_data`
--

CREATE TABLE `pre_payments_data` (
  `id` bigint(20) NOT NULL,
  `gateway` varchar(50) DEFAULT NULL,
  `data` text,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ip_address` varchar(50) DEFAULT NULL,
  `browser` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pre_payments_data`
--

INSERT INTO `pre_payments_data` (`id`, `gateway`, `data`, `created`, `ip_address`, `browser`) VALUES
(1, '49', '{"shopping_order_id":"21","razorpay_payment_id":"pay_7BmgIPApnwUf43"}', '2017-01-31 13:40:58', '10.0.0.18', 'Firefox'),
(2, '49', '{"shopping_order_id":"21","razorpay_payment_id":"pay_7BnWBDMv3fOlo1"}', '2017-01-31 13:42:19', '10.0.0.18', 'Firefox'),
(3, '49', '{"shopping_order_id":"21","razorpay_payment_id":"pay_7BnWBDMv3fOlo1"}', '2017-01-31 13:43:59', '10.0.0.18', 'Firefox'),
(4, '49', '{"shopping_order_id":"21","razorpay_payment_id":"pay_7BnWBDMv3fOlo1"}', '2017-01-31 13:44:23', '10.0.0.18', 'Firefox'),
(5, '49', '{"shopping_order_id":"21","razorpay_payment_id":"pay_7BnWBDMv3fOlo1"}', '2017-01-31 13:45:04', '10.0.0.18', 'Firefox'),
(6, '49', '{"shopping_order_id":"21","razorpay_payment_id":"pay_7BnWBDMv3fOlo1"}', '2017-01-31 13:46:44', '10.0.0.18', 'Firefox'),
(7, '49', '{"shopping_order_id":"21","razorpay_payment_id":"pay_7BnWBDMv3fOlo1"}', '2017-01-31 13:47:25', '10.0.0.18', 'Firefox'),
(8, '49', '{"shopping_order_id":"21","razorpay_payment_id":"pay_7BnWBDMv3fOlo1"}', '2017-01-31 13:48:02', '10.0.0.18', 'Firefox'),
(9, '49', '{"shopping_order_id":"21","razorpay_payment_id":"pay_7BnWBDMv3fOlo1"}', '2017-01-31 13:49:21', '10.0.0.18', 'Firefox'),
(10, '49', '{"shopping_order_id":"21","razorpay_payment_id":"pay_7BnWBDMv3fOlo1"}', '2017-01-31 13:50:33', '10.0.0.18', 'Firefox'),
(11, '49', '{"shopping_order_id":"21","razorpay_payment_id":"pay_7BnWBDMv3fOlo1"}', '2017-01-31 13:51:09', '10.0.0.18', 'Firefox'),
(12, '49', '{"shopping_order_id":"21","razorpay_payment_id":"pay_7BnWBDMv3fOlo1"}', '2017-01-31 13:51:40', '10.0.0.18', 'Firefox'),
(13, '49', '{"shopping_order_id":"21","razorpay_payment_id":"pay_7BnWBDMv3fOlo1"}', '2017-01-31 13:53:55', '10.0.0.18', 'Firefox'),
(14, '49', '{"shopping_order_id":"21","razorpay_payment_id":"pay_7BnWBDMv3fOlo1"}', '2017-01-31 13:54:14', '10.0.0.18', 'Firefox'),
(15, '49', '{"shopping_order_id":"21","razorpay_payment_id":"pay_7BnyYblB19Gkl1"}', '2017-01-31 14:09:11', '10.0.0.18', 'Firefox'),
(16, '49', '{"shopping_order_id":"21","razorpay_payment_id":"pay_7BnyYblB19Gkl1"}', '2017-01-31 14:12:24', '10.0.0.18', 'Firefox'),
(17, '49', '{"shopping_order_id":"21","razorpay_payment_id":"pay_7BnyYblB19Gkl1"}', '2017-01-31 14:12:57', '10.0.0.18', 'Firefox'),
(18, '49', '{"shopping_order_id":"21","razorpay_payment_id":"pay_7BnyYblB19Gkl1"}', '2017-01-31 14:13:48', '10.0.0.18', 'Firefox'),
(19, '49', '{"shopping_order_id":"21","razorpay_payment_id":"pay_7BnyYblB19Gkl1"}', '2017-01-31 14:14:19', '10.0.0.18', 'Firefox'),
(20, '49', '{"shopping_order_id":"21","razorpay_payment_id":"pay_7BnyYblB19Gkl1"}', '2017-01-31 14:15:07', '10.0.0.18', 'Firefox'),
(21, '49', '{"shopping_order_id":"21","razorpay_payment_id":"pay_7BnyYblB19Gkl1"}', '2017-01-31 14:15:29', '10.0.0.18', 'Firefox'),
(22, '49', '{"shopping_order_id":"21","razorpay_payment_id":"pay_7BnyYblB19Gkl1"}', '2017-01-31 14:15:46', '10.0.0.18', 'Firefox'),
(23, '49', '{"shopping_order_id":"21","razorpay_payment_id":"pay_7BnyYblB19Gkl1"}', '2017-01-31 14:15:59', '10.0.0.18', 'Firefox'),
(24, '49', '{"shopping_order_id":"21","razorpay_payment_id":"pay_7BnyYblB19Gkl1"}', '2017-01-31 14:20:11', '10.0.0.18', 'Firefox'),
(25, '49', '{"shopping_order_id":"21","razorpay_payment_id":"pay_7BnyYblB19Gkl1"}', '2017-01-31 14:20:46', '10.0.0.18', 'Firefox'),
(26, '49', '{"shopping_order_id":"21","razorpay_payment_id":"pay_7BnyYblB19Gkl1"}', '2017-01-31 14:21:35', '10.0.0.18', 'Firefox'),
(27, '49', '{"shopping_order_id":"21","razorpay_payment_id":"pay_7BnyYblB19Gkl1"}', '2017-01-31 14:22:58', '10.0.0.18', 'Firefox'),
(28, '49', '{"shopping_order_id":"21","razorpay_payment_id":"pay_7BnyYblB19Gkl1"}', '2017-01-31 14:24:21', '10.0.0.18', 'Firefox'),
(29, '49', '{"shopping_order_id":"21","razorpay_payment_id":"pay_7BnyYblB19Gkl1"}', '2017-01-31 14:24:36', '10.0.0.18', 'Firefox'),
(30, '49', '{"shopping_order_id":"21","razorpay_payment_id":"pay_7BnyYblB19Gkl1"}', '2017-01-31 14:26:53', '10.0.0.18', 'Firefox'),
(31, '49', '{"shopping_order_id":"21","razorpay_payment_id":"pay_7IToELX3ZjxCCB"}', '2017-02-17 10:58:43', '10.0.0.27', 'Chrome'),
(32, '49', '{"shopping_order_id":"21","razorpay_payment_id":"pay_7IUWvcWh0CfvD3"}', '2017-02-17 11:40:51', '10.0.0.27', 'Chrome');

-- --------------------------------------------------------

--
-- Table structure for table `pre_scroll_news`
--

CREATE TABLE `pre_scroll_news` (
  `id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `url` varchar(100) NOT NULL,
  `status` enum('Active','Inactive') NOT NULL DEFAULT 'Active',
  `cereated_at` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pre_scroll_news`
--

INSERT INTO `pre_scroll_news` (`id`, `title`, `url`, `status`, `cereated_at`) VALUES
(1, 'Latest Google News', 'https://news.google.co.in/', 'Active', '2016-11-10 17:16:18'),
(2, 'Yahoo News', 'https://in.yahoo.com/', 'Active', '2016-11-10 15:16:20'),
(4, 'Test News', 'http://site.com', 'Active', '2016-11-23 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `pre_sections`
--

CREATE TABLE `pre_sections` (
  `section_id` int(11) NOT NULL,
  `name` varchar(512) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pre_sections`
--

INSERT INTO `pre_sections` (`section_id`, `name`, `description`) VALUES
(1, 'Advantages_Section', '<section>\r\n        <div class="container">\r\n            <div class="row row-margin">\r\n                <div class="col-md-4 col-sm-4 col-xs-12">\r\n                    <div class="advantage">\r\n                        <div class="media-left">\r\n                            <img src="http://10.0.0.14/menorah-tutor-sellingcourses/assets/front/images/icn-video.png" alt="..">\r\n                        </div>\r\n                        <div class="media-body">\r\n                            <h4><a href="">Videos &amp; Images</a></h4>\r\n                            <p>Listen to our teachers speeches and see our video testimonials before you take any decisions</p>\r\n                        </div>\r\n                    </div>\r\n                </div>\r\n                <div class="col-md-4 col-sm-4 col-xs-12">\r\n                    <div class="advantage">\r\n                        <div class="media-left">\r\n                            <img src="http://10.0.0.14/menorah-tutor-sellingcourses/assets/front/images/icn-score.png" alt="..">\r\n                        </div>\r\n                        <div class="media-body">\r\n                            <h4><a href="">Quality Scores</a></h4>\r\n                            <p>We have rated teachers for safety and convenience as we know how important this is for you</p>\r\n                        </div>\r\n                    </div>\r\n                </div>\r\n                <div class="col-md-4 col-sm-4 col-xs-12">\r\n                    <div class="advantage">\r\n                        <div class="media-left">\r\n                            <img src="http://10.0.0.14/menorah-tutor-sellingcourses/assets/front/images/icn-calendar.png" alt="..">\r\n                        </div>\r\n                        <div class="media-body">\r\n                            <h4><a href="">Reviews &amp; Ratings</a></h4>\r\n                            <p>No more emails, Calls or messaging friends for recommendations - Get acces to real reviews in seconds</p>\r\n                        </div>\r\n                    </div>\r\n                </div>\r\n            </div>\r\n        </div>\r\n    </section>'),
(2, 'Are_You_A_Teacher_Section', '<section>\r\n<div class="container">\r\n        <div class="row row-margin">\r\n            <div class="col-md-12">\r\n                <h2 class="heading">Are you a <span>Teacher</span></h2>\r\n                <p class="heading-tag">Looking for a better way to reach your target audience? We can help - Just list with us <strong>For free</strong>.</p>\r\n            </div>\r\n            <div class="col-md-4 col-sm-4 col-sm-12">\r\n                <div class="choose-block center-block">\r\n                    <div class="icon">\r\n                        <img src="http://10.0.0.14/menorah-tutor-sellingcourses/assets/front/images/icn-cal.png" alt="">\r\n                        <i class="sub-icon fa fa-check"></i>\r\n                    </div>\r\n                    <p>Boost your sales and scale up all of your classes.</p>\r\n                </div>\r\n            </div>\r\n            <div class="col-md-4 col-sm-4 col-sm-12">\r\n                <div class="choose-block center-block">\r\n                    <div class="icon">\r\n                        <img src="http://10.0.0.14/menorah-tutor-sellingcourses/assets/front/images/icn-group.png" alt="">\r\n                        <i class="sub-icon fa fa-check"></i>\r\n                    </div>\r\n                    <p>Get a lot of exposure &amp; brand recognition from everyone.</p>\r\n                </div>\r\n            </div>\r\n            <div class="col-md-4 col-sm-4 col-sm-12">\r\n                <div class="choose-block center-block">\r\n                    <div class="icon">\r\n                        <img src="http://10.0.0.14/menorah-tutor-sellingcourses/assets/front/images/icn-graph.png" alt="">\r\n                        <i class="sub-icon fa fa-check"></i>\r\n                    </div>\r\n                    <p>Participate in various events and school programs whenever you want.</p>\r\n                </div>\r\n            </div>\r\n                    </div>\r\n    </div>\r\n</section>'),
(3, 'Featured_On_Section', '<section class="featured-on">\r\n        <div class="container">\r\n            <div class="row">\r\n                <div class="col-lg-2 col-md-3 col-sm-3 col-xs-12">\r\n                    <h4>FEATURED ON</h4>\r\n                </div>\r\n                <div class="col-lg-10 col-md-9 col-sm-9 col-xs-12">\r\n                    <ul>\r\n                        <li>\r\n                            <a href="#"><img src="http://10.0.0.14/menorah-tutor-sellingcourses/assets/front/images/1.png" alt=""></a>\r\n                        </li>\r\n                        <li>\r\n                            <a href="#"><img src="http://10.0.0.14/menorah-tutor-sellingcourses/assets/front/images/2.png" alt=""></a>\r\n                        </li>\r\n                        <li>\r\n                            <a href="#"><img src="http://10.0.0.14/menorah-tutor-sellingcourses/assets/front/images/3.png" alt=""></a>\r\n                        </li>\r\n                        <li>\r\n                            <a href="#"><img src="http://10.0.0.14/menorah-tutor-sellingcourses/assets/front/images/4.png" alt=""></a>\r\n                        </li>\r\n                        <li>\r\n                            <a href="#"><img src="http://10.0.0.14/menorah-tutor-sellingcourses/assets/front/images/5.png" alt=""></a>\r\n                        </li>\r\n                        <li>\r\n                            <a href="#"><img src="http://10.0.0.14/menorah-tutor-sellingcourses/assets/front/images/6.png" alt=""></a>\r\n                        </li>\r\n                    </ul>\r\n                </div>\r\n            </div>\r\n        </div>\r\n    </section>');

-- --------------------------------------------------------

--
-- Table structure for table `pre_seosettings`
--

CREATE TABLE `pre_seosettings` (
  `id` int(11) NOT NULL,
  `type` varchar(50) DEFAULT NULL,
  `allowed_variables` text,
  `seo_title` text,
  `seo_description` text,
  `seo_keywords` text,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pre_seosettings`
--

INSERT INTO `pre_seosettings` (`id`, `type`, `allowed_variables`, `seo_title`, `seo_description`, `seo_keywords`, `created`, `updated`) VALUES
(1, 'courses_single', '__COURSE_NAME__\r\n\r\n__COURSES__\r\n__CATEGORIES__\r\n__LOCATIONS__\r\n__TEACHING_TYPES__', '__COURSE_NAME__ TItle ######################### __CATEGORIES__', 'gsdfgsd', 'gsgfsdgfsdgsfd', '2017-02-06 09:14:46', NULL),
(3, 'location', '__COURSES__\r\n__CATEGORIES__\r\n__LOCATIONS__\r\n__TEACHING_TYPES__', 'Location SEO title', 'Location Seo description', 'Location Seo keywords', '2017-02-06 09:14:52', NULL),
(4, 'teaching_type', '__COURSES__\r\n__CATEGORIES__\r\n__LOCATIONS__\r\n__TEACHING_TYPES__', 'Teaching Type Seo title', 'Teaching Type Seo description', 'Teaching Type Seo keywords', '2017-02-06 09:14:57', NULL),
(5, 'homepage', '__COURSES__\r\n__CATEGORIES__\r\n__LOCATIONS__\r\n__TEACHING_TYPES__', 'Home Page SEO __COURSE_NAME__ TItle', 'Home Page Seo description', 'Home Page Seo keywords', '2017-02-06 09:15:02', NULL),
(6, 'findtutor', '__COURSES__\r\n__CATEGORIES__\r\n__LOCATIONS__\r\n__TEACHING_TYPES__', 'Find Tutor SEO __COURSES__ TItle', 'Find Tutor Seo description', 'Find Tutor Seo keywords ', '2017-02-06 09:15:06', NULL),
(7, 'findleads', '__COURSES__\r\n__CATEGORIES__\r\n__LOCATIONS__\r\n__TEACHING_TYPES__', 'FInd LEads Seo title', 'FInd LEads Seo description', 'FInd LEads Seo keywords', '2017-02-06 09:15:10', NULL),
(8, 'findinstitute', '__COURSES__\r\n__CATEGORIES__\r\n__LOCATIONS__\r\n__TEACHING_TYPES__', 'Find Institute SEO TItle __COURSE_NAME__ __ADIYYA__', 'Find Institute Seo description', 'Find Institute Seo keywords', '2017-02-06 09:15:15', NULL),
(9, 'categories', '__COURSES__\r\n__CATEGORIES__\r\n__LOCATIONS__\r\n__TEACHING_TYPES__', 'Categories Seo title', 'Categories Seo description ', 'Categories Seo keywords ', '2017-02-06 08:34:13', NULL),
(10, 'courses', '__COURSES__\r\n__CATEGORIES__\r\n__LOCATIONS__\r\n__TEACHING_TYPES__', 'Courses Seo title __CATEGORIES__ ################################ __COURSES__', 'Courses Seo description ', 'Courses Seo keywords ', '2017-02-06 08:34:25', NULL),
(11, 'tutor_single', '__TUTOR_NAME__\r\n__COURSES__\r\n__LOCATIONS__', 'Single Tutor SEO Title', 'Single Tutor SEO description ', 'Single Tutor SEO keywords ', '2017-02-06 07:41:45', NULL),
(12,'dynamicpage','__COURSES__\r\n__LOCATIONS__\r\n__TEACHING_TYPES__',NULL,NULL,NULL,'2017-02-06 14:04:30',NULL),
(13, 'institute_single', '__INSTITUTE_NAME__\r\n\r\n__COURSES__\r\n__LOCATIONS__\r\n__TEACHING_TYPES__', NULL, NULL, NULL, '2017-02-06 08:34:36', NULL),
(15, 'student_single', '__COURSES__\r\n__LOCATIONS__\r\n__TEACHING_TYPES__', NULL, NULL, NULL, '2017-02-06 08:34:40', NULL),
(17, 'categories_single', '__COURSES__\r\n__LOCATIONS__\r\n__TEACHING_TYPES__', NULL, NULL, NULL, '2017-02-06 08:34:48', NULL),
(18, 'about_us', '__COURSES__\r\n__LOCATIONS__\r\n__TEACHING_TYPES__', NULL, NULL, NULL, '2017-02-06 08:33:13', NULL),
(19, 'contact_us', '__COURSES__\r\n__LOCATIONS__\r\n__TEACHING_TYPES__', NULL, NULL, NULL, '2017-02-06 08:33:08', NULL),
(20, 'faqs', '__COURSES__\r\n__LOCATIONS__\r\n__TEACHING_TYPES__', NULL, NULL, NULL, '2017-02-06 08:33:03', NULL),
(21, 'login', '__COURSES__\r\n__LOCATIONS__\r\n__TEACHING_TYPES__', '__COURSES__ TItle', NULL, NULL, '2017-02-06 08:32:38', NULL),
(22, 'courses_single', '__COURSES__\r\n__CATEGORIES__\r\n__LOCATIONS__\r\n__TEACHING_TYPES__\r\n__COURSE_NAME__', 'Courses Seo title __CATEGORIES__ ################################ __COURSES__', 'Courses Seo description ', 'Courses Seo keywords ', '2017-02-06 08:34:25', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `pre_sessions`
--

CREATE TABLE `pre_sessions` (
  `id` varchar(40) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `timestamp` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `data` blob NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- --------------------------------------------------------

--
-- Table structure for table `pre_sitetestimonials`
--

CREATE TABLE `pre_sitetestimonials` (
  `id` int(11) NOT NULL,
  `name` varchar(256) DEFAULT NULL,
  `position` varbinary(256) DEFAULT NULL,
  `comments` text,
  `image` varchar(256) DEFAULT NULL,
  `status` enum('Active','In-Active') DEFAULT 'Active',
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pre_sitetestimonials`
--

INSERT INTO `pre_sitetestimonials` (`id`, `name`, `position`, `comments`, `image`, `status`, `created`, `updated`) VALUES
(1, 'John', 0x53747564656e74, '<div>\r\n	&quot;Tutors Listing&quot; teachers have helped me clear my concepts and the system has made learning much easier and fun.</div>\r\n', '52e4e-62.jpg', 'Active', '2016-11-10 16:41:53', '2016-11-22 10:11:01'),
(2, 'Sahaana', 0x53747564656e74, '<div>\r\n	This site is great to find tutors and the responses are all so prompt. I recommend tutors site heartfully. Thank you so much</div>\r\n', '3ae11-31.jpg', 'Active', '2016-11-10 16:56:53', '2016-11-22 12:48:58'),
(3, 'Mackinlee', 0x506172656e74, '<p>\r\n	She is very good tutor he explains things very well and make everything easy to undertsand.</p>\r\n', '3cb68-48.jpg', 'Active', '2016-11-10 16:59:04', '2016-11-22 12:56:27'),
(4, 'Domanic', 0x456d706c6f796572, '<div>\r\n	This was great! i highly recommend her to anybody! very nice and patient and straight to&nbsp;</div>\r\n<div>\r\n	the point!</div>\r\n', 'f0b8b-86.jpg', 'Active', '2016-11-22 10:08:53', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `pre_student_leads`
--

CREATE TABLE `pre_student_leads` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `location_id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  `teaching_type_id` int(11) NOT NULL,
  `present_status` varchar(512) NOT NULL COMMENT 'student''s present status like student or employed etc.',
  `priority_of_requirement` enum('immediately','after_a_week','after_a_month') NOT NULL,
  `duration_needed` varchar(55) NOT NULL,
  `budget` varchar(512) NOT NULL,
  `budget_type` enum('one_time','hourly','monthly') NOT NULL,
  `title_of_requirement` varchar(512) NOT NULL,
  `requirement_details` varchar(1000) NOT NULL,
  `no_of_views` int(11) NOT NULL DEFAULT '0',
  `status` enum('Opened','Closed') NOT NULL DEFAULT 'Opened',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='student posted requirements';


--
-- Dumping data for table `pre_student_leads`
--

INSERT INTO `pre_student_leads` (`id`, `user_id`, `location_id`, `course_id`, `teaching_type_id`, `present_status`, `priority_of_requirement`, `duration_needed`, `budget`, `budget_type`, `title_of_requirement`, `requirement_details`, `no_of_views`, `status`, `created_at`, `updated_at`) VALUES
(1, 2, 4, 13, 1, 'Student', 'immediately', '1 month', '100', 'monthly', 'looking for a tutor in C++', 'I wish to learn C++ to get a Job in IT field  as a Software Developer', 0, 'Opened', '2016-11-08 12:13:19', '2016-11-08 12:13:19'),
(2, 2, 4, 14, 2, 'Student', 'after_a_week', '2 month', '120', 'hourly', 'looking for a tutor Java Programming', ' I wish to learn Java to get a Job in IT field  as a Software Developer', 0, 'Opened', '2016-11-08 12:17:45', '2016-11-08 12:17:45'),
(3, 2, 7, 15, 3, 'Student', 'after_a_week', '20 days', '70', 'hourly', 'looking for a tutor Adobe Photoshop', 'I wish to learn C++ to get a Job in IT field  as a Software Developer', 0, 'Opened', '2016-11-08 12:19:46', '2016-11-08 12:19:46'),
(4, 3, 3, 37, 3, 'Student', 'immediately', '2 months', '100', 'hourly', 'looking for a tutor in Trigonometry', 'I wish to learn Trigonometry ', 0, 'Closed', '2016-11-08 12:26:04', '2016-11-11 16:11:50'),
(5, 3, 19, 28, 1, 'Student', 'immediately', '2 Months', '100', 'hourly', 'looking for a tutor in MS SQL', ' I Wish to learn MS SQL to get a job in IT field.', 0, 'Opened', '2016-11-08 12:29:41', '2016-11-23 16:33:44'),
(6, 3, 68, 31, 3, 'Student', 'immediately', '2 Months', '90', 'hourly', 'looking for a tutor in Pre-Algebra', ' I Wish to learn Pre-Algebra ', 0, 'Opened', '2016-11-08 12:34:43', '2016-11-08 12:34:43'),
(7, 4, 100, 45, 2, 'Student', 'immediately', '2 Months', '70', 'hourly', 'looking for a tutor in GRE', 'I Wish to learn GRE ', 0, 'Opened', '2016-11-08 12:40:28', '2016-11-08 12:40:28'),
(8, 4, 97, 115, 1, 'Student', 'after_a_week', '1 Month', '80', 'hourly', 'looking for a tutor in Drums', 'I wish to learn Drums', 0, 'Closed', '2016-11-08 12:42:52', '2016-11-21 13:20:17'),
(9, 4, 108, 143, 2, 'Student', 'immediately', '3 Months', '200', 'monthly', 'looking for a tutor in Bank Clerical', 'I Wish to learn all Subjects in Bank Clerical to get a  job in Bank', 0, 'Opened', '2016-11-08 12:48:40', '2016-11-08 12:48:40'),
(10, 5, 47, 71, 2, 'Student', 'immediately', '6 Months', '150', 'monthly', 'looking for a tutor in LLB', 'I Wish to learn  LLB to become layer', 0, 'Opened', '2016-11-08 12:55:35', '2016-11-08 12:55:35'),
(11, 5, 58, 38, 1, 'Student', 'immediately', '2 Months', '150', 'monthly', 'looking for a tutor in Physics', 'I wish to learn Physics .', 0, 'Opened', '2016-11-08 12:59:15', '2016-11-23 19:00:43'),
(12, 5, 52, 56, 1, 'Student', 'immediately', '2 Months', '60', 'monthly', 'looking for a tutor in Drawing.', 'I wish to learn Drawing to become Artist', 0, 'Opened', '2016-11-08 13:03:29', '2016-11-08 13:03:29'),
(13, 6, 37, 148, 1, 'Student', 'immediately', '4 Months', '300', 'monthly', 'looking for a tutor in Defence Exams', ' I wish to learn  Defence all subjects to become a pilot', 0, 'Opened', '2016-11-08 13:12:40', '2016-11-08 13:12:40'),
(14, 6, 58, 149, 1, 'Student', 'immediately', '3 Months', '120', 'monthly', 'looking for a tutor in Forest Department Exam.', 'I wish to learn Forest Department Exam all subjects to become a Forest Ranger', 0, 'Closed', '2016-11-08 13:19:01', '2016-11-14 15:32:45'),
(15, 6, 33, 39, 1, 'Student', 'immediately', '3 Months', '130', 'hourly', 'looking for a tutor in Chemistry', 'I wish to learn Chemistry.', 1, 'Opened', '2016-11-08 13:21:51', '2016-11-08 13:21:51'),
(16, 4, 6, 14, 3, 'Searching for Job', 'after_a_week', '2 months', '150', 'monthly', 'Need Java Tutor with Excellent knowledge on java concepts', 'Need good tutor for have. must and should cover all java basic concepts. OOPs Concepts, Functions, Frame Work, Structs, Hibernet etc', 2, 'Opened', '2016-11-08 16:29:54', '2016-11-21 13:20:03'),
(17, 33, 6, 20, 1, 'Employee', 'after_a_week', '30 Days', '50', 'one_time', 'Need HTML Tutor', 'Good knowledge on HTML all topics. like html5, Tags, CSS etc', 0, 'Opened', '2016-11-21 12:25:33', '2016-11-21 12:25:33'),
(18, 29, 7, 14, 3, 'Student', 'after_a_month', '3 Months', '100', 'monthly', 'Looking for Java Tutor', 'Tutor have real time exp and need to cover all java basic concepts', 0, 'Opened', '2016-11-21 12:30:51', '2016-11-21 12:30:51'),
(19, 29, 3, 14, 1, 'Student', 'after_a_week', '3 Months', '150', 'monthly', 'Looking for Java Tutor', 'Tutor have real time exp and need to cover all java concepts ', 0, 'Opened', '2016-11-21 12:36:40', '2016-11-21 12:36:40'),
(20, 3, 7, 20, 2, 'Student', 'immediately', '20 Months', '50', 'monthly', 'Looking for HTML Tutor', 'Should have real time exp and cover to all concepts', 0, 'Opened', '2016-11-21 13:14:31', '2016-11-21 13:14:31'),
(21, 3, 3, 13, 3, 'Student', 'immediately', '3 Months', '180', 'monthly', 'Need C++ tutor', 'This course teaches you the powerful, fast and popular C++ programming language from scratch, assuming only basic computer knowledge', 0, 'Opened', '2016-11-21 13:17:40', '2016-11-21 13:17:40'),
(22, 4, 4, 21, 2, 'Employee', 'after_a_week', '30 Days', '100', 'one_time', 'Looking for  JavaScript Tutor', 'JavaScript is the programming language of HTML and the Web. JavaScript is easy to learn. This tutorial will teach you JavaScript from basic to advanced.', 0, 'Opened', '2016-11-21 13:23:12', '2016-11-21 13:23:12'),
(23, 5, 3, 20, 1, 'Student', 'after_a_month', '1 Month', '80', 'one_time', 'Looking for HTML Tutor', 'Good knowledge on HTML Concepts', 0, 'Opened', '2016-11-21 13:27:16', '2016-11-21 13:27:16'),
(24, 4, 6, 13, 3, 'Employer', 'after_a_week', '2 Months', '100', 'monthly', 'Need C++ Tutor', 'Fast and popular C++ programming language from scratch, assuming only basic computer knowledge', 0, 'Opened', '2016-11-21 13:29:27', '2016-11-21 13:29:27'),
(25, 5, 7, 13, 1, 'Student', 'immediately', '2 Months', '60', 'hourly', 'Looking for C++ Tutor', 'Good knowledge on C++ Concepts and need to cover all topics', 0, 'Opened', '2016-11-21 13:32:45', '2016-11-21 13:32:45'),
(26, 3, 6, 14, 2, 'Student', 'after_a_month', '2 Months', '60', 'monthly', 'Looking for Java Tutor', 'Java is a set of computer software and specifications developed by Sun Micro systems, which was later acquired by the Oracle Corporation', 0, 'Opened', '2016-11-21 15:44:42', '2016-11-21 15:44:42'),
(27, 36, 3, 21, 2, 'Student', 'after_a_week', '1 Month', '80', 'one_time', 'Looking for JavaScript Tutor', 'Good knowledge on JavaScript concepts', 0, 'Opened', '2016-11-21 15:53:38', '2016-11-21 15:53:38'),
(28, 36, 4, 15, 3, 'Student', 'immediately', '3 Months', '60', 'monthly', 'Need Adobe Photoshop Tutor', 'Good Knowledge on create and enhance your photos, images, 3D artwork, and more with Adobe Photoshop CC, the world\'s best imaging and photo editing software ', 0, 'Opened', '2016-11-21 15:55:41', '2016-11-21 15:55:41'),
(29, 35, 3, 15, 2, 'Student', 'after_a_week', '4 Months', '100', 'monthly', 'Looking for Adobe Photoshop Tutor', 'Should have real time exp on create and enhance your photos, images, 3D artwork, and more with Adobe Photoshop CC, the world\'s best imaging and photo editing software', 0, 'Opened', '2016-11-21 16:00:07', '2016-11-21 16:00:07'),
(30, 35, 5, 14, 3, 'Student', 'after_a_week', '4 Months', '120', 'hourly', 'Need Java Tutor', 'Good knowledge on java concepts.should cover all topics.', 0, 'Opened', '2016-11-21 16:01:41', '2016-11-21 16:01:41'),
(31, 35, 5, 13, 1, 'Student', 'after_a_month', '2 Months', '60', 'monthly', 'Need C++ Tutor', 'This course teaches you the powerful, fast and popular C++ programming language from scratch, assuming only basic computer knowledge', 0, 'Opened', '2016-11-21 16:03:50', '2016-11-21 16:03:50'),
(32, 32, 7, 13, 2, 'Student', 'immediately', '2 Months', '80', 'hourly', 'Looking for C++ Tutor', 'Should cover all C++ concepts', 0, 'Opened', '2016-11-21 16:09:28', '2016-11-21 16:09:28'),
(33, 32, 7, 21, 2, 'Employee', 'after_a_month', '3 Months', '150', 'monthly', 'Looking for JavaScript Tutor', 'Need to Cover JavaScript from basic to advanced concepts.', 0, 'Opened', '2016-11-21 16:12:30', '2016-11-21 16:12:30'),
(34, 32, 5, 15, 1, 'Student', 'immediately', '3 Months', '130', 'hourly', 'Need Adobe Photoshop Tutor', 'Need to cover all Create and enhance your photos, images, 3D artwork, and more with Adobe Photoshop CC, the world\'s best imaging and photo editing software', 0, 'Opened', '2016-11-21 16:14:59', '2016-11-21 16:14:59'),
(35, 32, 4, 20, 2, 'Student', 'immediately', '2 Months', '100', 'monthly', 'Looking for HTML Tutor', 'Good knowledge on HTML5 all topics. like html5, Div,Tags, CSS etc ', 0, 'Opened', '2016-11-21 16:19:12', '2016-11-21 16:19:12'),
(36, 30, 6, 15, 2, 'Student', 'after_a_week', '3 Months', '100', 'hourly', 'Looking for Adobe Photoshop Tutor', 'Good knowledge on Photoshop and dream viewer concepts ', 0, 'Opened', '2016-11-21 16:25:51', '2016-11-21 16:25:51'),
(37, 30, 5, 20, 1, 'Student', 'after_a_month', '1 Month', '40', 'one_time', 'Need HTML Tutor', 'Should explain to all basic concepts', 0, 'Opened', '2016-11-21 16:29:30', '2016-11-21 16:29:30'),
(38, 30, 5, 21, 1, 'Student', 'immediately', '3 Months', '80', 'monthly', 'Need JavaScript Tutor', 'Good knowledge on Javascript all concepts', 0, 'Opened', '2016-11-21 16:52:01', '2016-11-21 16:52:01'),
(39, 30, 5, 14, 1, 'Employee', 'after_a_week', '3 Months', '130', 'monthly', 'Looking for Java Tutor', 'Should have  real time exp and need to cover all concepts.', 0, 'Opened', '2016-11-21 16:55:35', '2016-11-21 16:55:35'),
(40, 30, 3, 13, 2, 'Student', 'after_a_week', '1 Month', '100', 'one_time', 'Looking for C++ Tutor', 'Good Knowledge on C and C++ all concepts', 0, 'Opened', '2016-11-21 17:00:58', '2016-11-21 17:00:58'),
(41, 31, 3, 15, 1, 'Employee', 'immediately', '4 Months', '150', 'monthly', 'Need Adobe Photoshop Tutor', 'Should have exp on Create and enhance your photos, images, 3D artwork, and more with Adobe Photoshop CC, the world\'s best imaging and photo editing software', 0, 'Opened', '2016-11-21 17:05:16', '2016-11-21 17:05:16'),
(42, 31, 3, 21, 1, 'Student', 'immediately', '2 Months', '80', 'hourly', 'Need JavaScript Tutor', 'JavaScript is the programming language of HTML and the Web. JavaScript is easy to learn. This tutorial will teach you JavaScript from basic to advanced.', 0, 'Opened', '2016-11-21 17:07:04', '2016-11-21 17:07:04'),
(43, 31, 3, 13, 1, 'Student', 'after_a_month', '2 Months', '60', 'one_time', 'Need C++ Tutor with real time experience', 'Should have real time experience  and cover all concepts', 0, 'Opened', '2016-11-21 17:11:01', '2016-11-21 17:11:01'),
(44, 31, 3, 14, 2, 'Student', 'after_a_month', '3 Months', '150', 'monthly', 'Need Java Tutor', 'Should be cover Core Java and Advance Java Concepts', 0, 'Opened', '2016-11-21 17:14:36', '2016-11-21 17:14:36'),
(45, 31, 3, 20, 2, 'Student', 'after_a_month', '2 Months', '130', 'monthly', 'Looking for HTML Tutor', 'HTML is the standard markup language for creating Web pages. HTML stands for Hyper Text Markup Language. HTML describes the structure of Web pages using markup like should cover all concepts', 0, 'Opened', '2016-11-21 17:23:47', '2016-11-21 17:23:47'),
(46, 34, 3, 14, 3, 'Employee', 'immediately', '30 days', '150', 'one_time', 'Looking for Java Tutor', 'Should cover real time scenarios and cover to all core and advance java concepts also.', 0, 'Opened', '2016-11-21 17:28:48', '2016-11-21 17:28:48'),
(47, 34, 3, 15, 3, 'Employee', 'after_a_week', '6 Months', '200', 'monthly', 'Looking for Adobe Photoshop Tutor', 'Should be explain basic to advanced concepts with dream viewer concepts', 0, 'Opened', '2016-11-21 17:31:32', '2016-11-21 17:31:32'),
(48, 34, 3, 20, 3, 'Student', 'immediately', '1 Month', '80', 'one_time', 'Need HTML Tutor', 'Should be cover basic and advance concepts HTML and CSS etc ', 0, 'Opened', '2016-11-21 17:34:45', '2016-11-21 17:34:45'),
(49, 34, 3, 21, 3, 'Student', 'after_a_week', '3 Months', '130', 'monthly', 'Looking for JavaScript Tutor', 'Tutor Need to cover JavaScript from basic to advanced all concepts.', 0, 'Opened', '2016-11-21 17:37:39', '2016-11-21 17:37:39'),
(50, 28, 5, 24, 1, 'Student', 'after_a_week', '30 days', '30', 'one_time', 'Need Microsoft Excel Tutor', 'Need to cover all excel operations with formulas', 0, 'Opened', '2016-11-22 11:00:28', '2016-11-22 11:00:28'),
(51, 28, 6, 23, 3, 'Student', 'immediately', '30 Days', '25', 'hourly', 'Looking for Microsoft Access Tutor', 'Good knowledge on Microsoft Access with all versions like 2003, 2007, 2010', 0, 'Opened', '2016-11-22 11:02:55', '2016-11-22 11:02:55'),
(52, 35, 9, 26, 1, 'Student', 'immediately', '2 Months', '100', 'monthly', 'Looking for PHP Tutor', 'Should have real time experience and should explain minimum 2 Frame works like CodeIgniter, Laravel, Slim etc ', 3, 'Opened', '2016-11-22 15:19:32', '2016-11-22 15:19:32');

-- --------------------------------------------------------

--
-- Table structure for table `pre_student_locations`
--

CREATE TABLE `pre_student_locations` (
  `id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `location_id` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `sort_order` tinyint(5) DEFAULT '0',
  `created_at` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pre_student_locations`
--

INSERT INTO `pre_student_locations` (`id`, `student_id`, `location_id`, `status`, `sort_order`, `created_at`) VALUES
(1, 2, 13, 1, 0, '2016-11-08 12:07:05'),
(2, 2, 14, 1, 0, '2016-11-08 12:07:05'),
(3, 2, 15, 1, 0, '2016-11-08 12:07:05'),
(4, 2, 16, 1, 0, '2016-11-08 12:07:05'),
(188, 5, 8, 1, 0, '2016-11-21 13:33:29'),
(187, 5, 7, 1, 0, '2016-11-21 13:33:29'),
(186, 5, 6, 1, 0, '2016-11-21 13:33:29'),
(185, 5, 5, 1, 0, '2016-11-21 13:33:29'),
(184, 5, 4, 1, 0, '2016-11-21 13:33:29'),
(183, 5, 3, 1, 0, '2016-11-21 13:33:29'),
(182, 5, 20, 1, 0, '2016-11-21 13:33:29'),
(181, 5, 19, 1, 0, '2016-11-21 13:33:29'),
(180, 5, 18, 1, 0, '2016-11-21 13:33:29'),
(179, 5, 16, 1, 0, '2016-11-21 13:33:29'),
(178, 5, 15, 1, 0, '2016-11-21 13:33:29'),
(16, 6, 71, 1, 0, '2016-11-08 13:06:04'),
(17, 6, 72, 1, 0, '2016-11-08 13:06:04'),
(18, 6, 75, 1, 0, '2016-11-08 13:06:04'),
(19, 6, 92, 1, 0, '2016-11-08 13:06:04'),
(20, 6, 93, 1, 0, '2016-11-08 13:06:04'),
(21, 27, 13, 1, 0, '2016-11-14 10:53:00'),
(22, 27, 14, 1, 0, '2016-11-14 10:53:00'),
(23, 27, 19, 1, 0, '2016-11-14 10:53:00'),
(24, 27, 9, 1, 0, '2016-11-14 10:53:00'),
(25, 27, 10, 1, 0, '2016-11-14 10:53:00'),
(26, 27, 11, 1, 0, '2016-11-14 10:53:00'),
(27, 27, 12, 1, 0, '2016-11-14 10:53:00'),
(28, 27, 30, 1, 0, '2016-11-14 10:53:00'),
(29, 27, 31, 1, 0, '2016-11-14 10:53:00'),
(30, 27, 32, 1, 0, '2016-11-14 10:53:00'),
(31, 27, 43, 1, 0, '2016-11-14 10:53:00'),
(32, 27, 44, 1, 0, '2016-11-14 10:53:00'),
(33, 27, 53, 1, 0, '2016-11-14 10:53:00'),
(34, 27, 55, 1, 0, '2016-11-14 10:53:00'),
(35, 27, 58, 1, 0, '2016-11-14 10:53:00'),
(36, 27, 59, 1, 0, '2016-11-14 10:53:00'),
(37, 27, 65, 1, 0, '2016-11-14 10:53:00'),
(38, 27, 66, 1, 0, '2016-11-14 10:53:00'),
(39, 27, 71, 1, 0, '2016-11-14 10:53:00'),
(40, 27, 72, 1, 0, '2016-11-14 10:53:00'),
(41, 28, 14, 1, 0, '2016-11-14 11:06:37'),
(42, 28, 16, 1, 0, '2016-11-14 11:06:37'),
(43, 28, 19, 1, 0, '2016-11-14 11:06:37'),
(44, 28, 20, 1, 0, '2016-11-14 11:06:37'),
(45, 28, 21, 1, 0, '2016-11-14 11:06:37'),
(46, 28, 3, 1, 0, '2016-11-14 11:06:37'),
(47, 28, 4, 1, 0, '2016-11-14 11:06:37'),
(48, 28, 6, 1, 0, '2016-11-14 11:06:37'),
(49, 28, 9, 1, 0, '2016-11-14 11:06:37'),
(50, 28, 11, 1, 0, '2016-11-14 11:06:37'),
(51, 28, 30, 1, 0, '2016-11-14 11:06:37'),
(52, 28, 31, 1, 0, '2016-11-14 11:06:37'),
(53, 28, 41, 1, 0, '2016-11-14 11:06:37'),
(54, 28, 42, 1, 0, '2016-11-14 11:06:37'),
(55, 28, 53, 1, 0, '2016-11-14 11:06:37'),
(56, 28, 54, 1, 0, '2016-11-14 11:06:37'),
(57, 28, 58, 1, 0, '2016-11-14 11:06:37'),
(58, 28, 59, 1, 0, '2016-11-14 11:06:37'),
(59, 28, 65, 1, 0, '2016-11-14 11:06:37'),
(60, 28, 66, 1, 0, '2016-11-14 11:06:37'),
(157, 29, 22, 1, 0, '2016-11-21 12:41:21'),
(156, 29, 21, 1, 0, '2016-11-21 12:41:21'),
(155, 29, 20, 1, 0, '2016-11-21 12:41:21'),
(154, 29, 17, 1, 0, '2016-11-21 12:41:21'),
(153, 29, 16, 1, 0, '2016-11-21 12:41:21'),
(152, 29, 15, 1, 0, '2016-11-21 12:41:21'),
(151, 29, 14, 1, 0, '2016-11-21 12:41:21'),
(150, 29, 13, 1, 0, '2016-11-21 12:41:21'),
(297, 30, 3, 1, 0, '2016-11-21 16:23:26'),
(296, 30, 22, 1, 0, '2016-11-21 16:23:26'),
(295, 30, 21, 1, 0, '2016-11-21 16:23:26'),
(294, 30, 20, 1, 0, '2016-11-21 16:23:26'),
(293, 30, 19, 1, 0, '2016-11-21 16:23:26'),
(292, 30, 18, 1, 0, '2016-11-21 16:23:26'),
(291, 30, 17, 1, 0, '2016-11-21 16:23:26'),
(290, 30, 16, 1, 0, '2016-11-21 16:23:26'),
(289, 30, 15, 1, 0, '2016-11-21 16:23:26'),
(288, 30, 14, 1, 0, '2016-11-21 16:23:26'),
(287, 30, 13, 1, 0, '2016-11-21 16:23:26'),
(322, 31, 20, 1, 0, '2016-11-21 17:03:06'),
(321, 31, 18, 1, 0, '2016-11-21 17:03:06'),
(320, 31, 17, 1, 0, '2016-11-21 17:03:06'),
(319, 31, 16, 1, 0, '2016-11-21 17:03:06'),
(318, 31, 15, 1, 0, '2016-11-21 17:03:06'),
(317, 31, 14, 1, 0, '2016-11-21 17:03:06'),
(316, 31, 13, 1, 0, '2016-11-21 17:03:06'),
(269, 32, 5, 1, 0, '2016-11-21 16:10:25'),
(268, 32, 4, 1, 0, '2016-11-21 16:10:25'),
(267, 32, 3, 1, 0, '2016-11-21 16:10:25'),
(266, 32, 22, 1, 0, '2016-11-21 16:10:25'),
(265, 32, 21, 1, 0, '2016-11-21 16:10:25'),
(264, 32, 20, 1, 0, '2016-11-21 16:10:25'),
(263, 32, 19, 1, 0, '2016-11-21 16:10:25'),
(262, 32, 18, 1, 0, '2016-11-21 16:10:25'),
(261, 32, 17, 1, 0, '2016-11-21 16:10:25'),
(260, 32, 16, 1, 0, '2016-11-21 16:10:25'),
(259, 32, 15, 1, 0, '2016-11-21 16:10:25'),
(258, 32, 14, 1, 0, '2016-11-21 16:10:25'),
(257, 32, 13, 1, 0, '2016-11-21 16:10:25'),
(100, 33, 13, 1, 0, '2016-11-14 11:23:48'),
(101, 33, 14, 1, 0, '2016-11-14 11:23:48'),
(102, 33, 15, 1, 0, '2016-11-14 11:23:48'),
(103, 33, 16, 1, 0, '2016-11-14 11:23:48'),
(104, 33, 17, 1, 0, '2016-11-14 11:23:48'),
(105, 33, 18, 1, 0, '2016-11-14 11:23:48'),
(106, 33, 21, 1, 0, '2016-11-14 11:23:48'),
(107, 33, 25, 1, 0, '2016-11-14 11:23:48'),
(108, 33, 27, 1, 0, '2016-11-14 11:23:48'),
(109, 33, 29, 1, 0, '2016-11-14 11:23:48'),
(110, 33, 30, 1, 0, '2016-11-14 11:23:48'),
(111, 33, 31, 1, 0, '2016-11-14 11:23:48'),
(112, 33, 32, 1, 0, '2016-11-14 11:23:48'),
(113, 33, 33, 1, 0, '2016-11-14 11:23:48'),
(114, 33, 35, 1, 0, '2016-11-14 11:23:48'),
(115, 33, 37, 1, 0, '2016-11-14 11:23:48'),
(116, 33, 39, 1, 0, '2016-11-14 11:23:48'),
(117, 33, 40, 1, 0, '2016-11-14 11:23:48'),
(118, 33, 43, 1, 0, '2016-11-14 11:23:48'),
(119, 33, 44, 1, 0, '2016-11-14 11:23:48'),
(120, 33, 45, 1, 0, '2016-11-14 11:23:48'),
(355, 34, 20, 1, 0, '2016-11-21 17:26:00'),
(354, 34, 19, 1, 0, '2016-11-21 17:26:00'),
(353, 34, 18, 1, 0, '2016-11-21 17:26:00'),
(352, 34, 17, 1, 0, '2016-11-21 17:26:00'),
(351, 34, 16, 1, 0, '2016-11-21 17:26:00'),
(350, 34, 15, 1, 0, '2016-11-21 17:26:00'),
(349, 34, 14, 1, 0, '2016-11-21 17:26:00'),
(348, 34, 13, 1, 0, '2016-11-21 17:26:00'),
(406, 35, 42, 1, 0, '2016-11-22 15:15:42'),
(405, 35, 41, 1, 0, '2016-11-22 15:15:42'),
(404, 35, 32, 1, 0, '2016-11-22 15:15:42'),
(403, 35, 31, 1, 0, '2016-11-22 15:15:42'),
(402, 35, 30, 1, 0, '2016-11-22 15:15:42'),
(401, 35, 29, 1, 0, '2016-11-22 15:15:42'),
(400, 35, 28, 1, 0, '2016-11-22 15:15:42'),
(399, 35, 27, 1, 0, '2016-11-22 15:15:42'),
(398, 35, 26, 1, 0, '2016-11-22 15:15:42'),
(397, 35, 25, 1, 0, '2016-11-22 15:15:42'),
(396, 35, 24, 1, 0, '2016-11-22 15:15:42'),
(395, 35, 12, 1, 0, '2016-11-22 15:15:42'),
(394, 35, 11, 1, 0, '2016-11-22 15:15:42'),
(393, 35, 10, 1, 0, '2016-11-22 15:15:42'),
(392, 35, 9, 1, 0, '2016-11-22 15:15:42'),
(204, 36, 19, 1, 0, '2016-11-21 15:51:09'),
(203, 36, 18, 1, 0, '2016-11-21 15:51:09'),
(202, 36, 17, 1, 0, '2016-11-21 15:51:09'),
(201, 36, 16, 1, 0, '2016-11-21 15:51:09'),
(200, 36, 15, 1, 0, '2016-11-21 15:51:09'),
(199, 36, 13, 1, 0, '2016-11-21 15:51:09'),
(158, 29, 3, 1, 0, '2016-11-21 12:41:21'),
(159, 29, 4, 1, 0, '2016-11-21 12:41:21'),
(160, 29, 5, 1, 0, '2016-11-21 12:41:21'),
(161, 29, 6, 1, 0, '2016-11-21 12:41:21'),
(162, 29, 7, 1, 0, '2016-11-21 12:41:21'),
(163, 29, 8, 1, 0, '2016-11-21 12:41:21'),
(164, 29, 9, 1, 0, '2016-11-21 12:41:21'),
(165, 29, 10, 1, 0, '2016-11-21 12:41:21'),
(166, 29, 11, 1, 0, '2016-11-21 12:41:21'),
(167, 29, 12, 1, 0, '2016-11-21 12:41:21'),
(168, 29, 24, 1, 0, '2016-11-21 12:41:21'),
(169, 29, 25, 1, 0, '2016-11-21 12:41:21'),
(170, 29, 26, 1, 0, '2016-11-21 12:41:21'),
(171, 29, 27, 1, 0, '2016-11-21 12:41:21'),
(172, 29, 28, 1, 0, '2016-11-21 12:41:21'),
(173, 29, 29, 1, 0, '2016-11-21 12:41:21'),
(174, 29, 30, 1, 0, '2016-11-21 12:41:21'),
(175, 29, 31, 1, 0, '2016-11-21 12:41:21'),
(176, 29, 32, 1, 0, '2016-11-21 12:41:21'),
(177, 29, 33, 1, 0, '2016-11-21 12:41:21'),
(189, 5, 9, 1, 0, '2016-11-21 13:33:29'),
(190, 5, 10, 1, 0, '2016-11-21 13:33:29'),
(191, 5, 11, 1, 0, '2016-11-21 13:33:29'),
(192, 5, 12, 1, 0, '2016-11-21 13:33:29'),
(193, 5, 92, 1, 0, '2016-11-21 13:33:29'),
(194, 5, 94, 1, 0, '2016-11-21 13:33:29'),
(195, 5, 95, 1, 0, '2016-11-21 13:33:29'),
(196, 5, 98, 1, 0, '2016-11-21 13:33:29'),
(197, 5, 99, 1, 0, '2016-11-21 13:33:29'),
(198, 5, 100, 1, 0, '2016-11-21 13:33:29'),
(205, 36, 20, 1, 0, '2016-11-21 15:51:09'),
(206, 36, 21, 1, 0, '2016-11-21 15:51:09'),
(207, 36, 3, 1, 0, '2016-11-21 15:51:09'),
(208, 36, 4, 1, 0, '2016-11-21 15:51:09'),
(209, 36, 5, 1, 0, '2016-11-21 15:51:09'),
(210, 36, 6, 1, 0, '2016-11-21 15:51:09'),
(211, 36, 7, 1, 0, '2016-11-21 15:51:09'),
(212, 36, 8, 1, 0, '2016-11-21 15:51:09'),
(213, 36, 9, 1, 0, '2016-11-21 15:51:09'),
(214, 36, 10, 1, 0, '2016-11-21 15:51:09'),
(215, 36, 11, 1, 0, '2016-11-21 15:51:09'),
(216, 36, 12, 1, 0, '2016-11-21 15:51:09'),
(217, 36, 24, 1, 0, '2016-11-21 15:51:09'),
(218, 36, 25, 1, 0, '2016-11-21 15:51:09'),
(219, 36, 26, 1, 0, '2016-11-21 15:51:09'),
(220, 36, 27, 1, 0, '2016-11-21 15:51:09'),
(221, 36, 28, 1, 0, '2016-11-21 15:51:09'),
(222, 36, 29, 1, 0, '2016-11-21 15:51:09'),
(223, 36, 30, 1, 0, '2016-11-21 15:51:09'),
(224, 36, 31, 1, 0, '2016-11-21 15:51:09'),
(225, 36, 32, 1, 0, '2016-11-21 15:51:09'),
(226, 36, 33, 1, 0, '2016-11-21 15:51:09'),
(391, 35, 8, 1, 0, '2016-11-22 15:15:42'),
(390, 35, 7, 1, 0, '2016-11-22 15:15:42'),
(389, 35, 6, 1, 0, '2016-11-22 15:15:42'),
(388, 35, 5, 1, 0, '2016-11-22 15:15:42'),
(387, 35, 4, 1, 0, '2016-11-22 15:15:42'),
(386, 35, 3, 1, 0, '2016-11-22 15:15:42'),
(385, 35, 22, 1, 0, '2016-11-22 15:15:42'),
(384, 35, 20, 1, 0, '2016-11-22 15:15:42'),
(383, 35, 19, 1, 0, '2016-11-22 15:15:42'),
(382, 35, 18, 1, 0, '2016-11-22 15:15:42'),
(381, 35, 17, 1, 0, '2016-11-22 15:15:42'),
(380, 35, 16, 1, 0, '2016-11-22 15:15:42'),
(379, 35, 15, 1, 0, '2016-11-22 15:15:42'),
(378, 35, 14, 1, 0, '2016-11-22 15:15:42'),
(377, 35, 13, 1, 0, '2016-11-22 15:15:42'),
(270, 32, 6, 1, 0, '2016-11-21 16:10:25'),
(271, 32, 7, 1, 0, '2016-11-21 16:10:25'),
(272, 32, 8, 1, 0, '2016-11-21 16:10:25'),
(273, 32, 9, 1, 0, '2016-11-21 16:10:25'),
(274, 32, 10, 1, 0, '2016-11-21 16:10:25'),
(275, 32, 11, 1, 0, '2016-11-21 16:10:25'),
(276, 32, 12, 1, 0, '2016-11-21 16:10:25'),
(277, 32, 24, 1, 0, '2016-11-21 16:10:25'),
(278, 32, 25, 1, 0, '2016-11-21 16:10:25'),
(279, 32, 26, 1, 0, '2016-11-21 16:10:25'),
(280, 32, 27, 1, 0, '2016-11-21 16:10:25'),
(281, 32, 28, 1, 0, '2016-11-21 16:10:25'),
(282, 32, 29, 1, 0, '2016-11-21 16:10:25'),
(283, 32, 30, 1, 0, '2016-11-21 16:10:25'),
(284, 32, 31, 1, 0, '2016-11-21 16:10:25'),
(285, 32, 32, 1, 0, '2016-11-21 16:10:25'),
(286, 32, 33, 1, 0, '2016-11-21 16:10:25'),
(298, 30, 4, 1, 0, '2016-11-21 16:23:26'),
(299, 30, 5, 1, 0, '2016-11-21 16:23:26'),
(300, 30, 6, 1, 0, '2016-11-21 16:23:26'),
(301, 30, 7, 1, 0, '2016-11-21 16:23:26'),
(302, 30, 8, 1, 0, '2016-11-21 16:23:26'),
(303, 30, 9, 1, 0, '2016-11-21 16:23:26'),
(304, 30, 10, 1, 0, '2016-11-21 16:23:26'),
(305, 30, 11, 1, 0, '2016-11-21 16:23:26'),
(306, 30, 12, 1, 0, '2016-11-21 16:23:26'),
(307, 30, 24, 1, 0, '2016-11-21 16:23:26'),
(308, 30, 25, 1, 0, '2016-11-21 16:23:26'),
(309, 30, 27, 1, 0, '2016-11-21 16:23:26'),
(310, 30, 28, 1, 0, '2016-11-21 16:23:26'),
(311, 30, 29, 1, 0, '2016-11-21 16:23:26'),
(312, 30, 30, 1, 0, '2016-11-21 16:23:26'),
(313, 30, 31, 1, 0, '2016-11-21 16:23:26'),
(314, 30, 32, 1, 0, '2016-11-21 16:23:26'),
(315, 30, 33, 1, 0, '2016-11-21 16:23:26'),
(323, 31, 21, 1, 0, '2016-11-21 17:03:06'),
(324, 31, 22, 1, 0, '2016-11-21 17:03:06'),
(325, 31, 3, 1, 0, '2016-11-21 17:03:06'),
(326, 31, 4, 1, 0, '2016-11-21 17:03:06'),
(327, 31, 5, 1, 0, '2016-11-21 17:03:06'),
(328, 31, 6, 1, 0, '2016-11-21 17:03:06'),
(329, 31, 7, 1, 0, '2016-11-21 17:03:06'),
(330, 31, 8, 1, 0, '2016-11-21 17:03:06'),
(331, 31, 9, 1, 0, '2016-11-21 17:03:06'),
(332, 31, 10, 1, 0, '2016-11-21 17:03:06'),
(333, 31, 11, 1, 0, '2016-11-21 17:03:06'),
(334, 31, 12, 1, 0, '2016-11-21 17:03:06'),
(335, 31, 24, 1, 0, '2016-11-21 17:03:06'),
(336, 31, 25, 1, 0, '2016-11-21 17:03:06'),
(337, 31, 26, 1, 0, '2016-11-21 17:03:06'),
(338, 31, 27, 1, 0, '2016-11-21 17:03:06'),
(339, 31, 28, 1, 0, '2016-11-21 17:03:06'),
(340, 31, 29, 1, 0, '2016-11-21 17:03:06'),
(341, 31, 30, 1, 0, '2016-11-21 17:03:06'),
(342, 31, 31, 1, 0, '2016-11-21 17:03:06'),
(343, 31, 32, 1, 0, '2016-11-21 17:03:06'),
(344, 31, 33, 1, 0, '2016-11-21 17:03:06'),
(345, 31, 71, 1, 0, '2016-11-21 17:03:06'),
(346, 31, 72, 1, 0, '2016-11-21 17:03:06'),
(347, 31, 74, 1, 0, '2016-11-21 17:03:06'),
(356, 34, 21, 1, 0, '2016-11-21 17:26:00'),
(357, 34, 22, 1, 0, '2016-11-21 17:26:00'),
(358, 34, 3, 1, 0, '2016-11-21 17:26:00'),
(359, 34, 4, 1, 0, '2016-11-21 17:26:00'),
(360, 34, 5, 1, 0, '2016-11-21 17:26:00'),
(361, 34, 6, 1, 0, '2016-11-21 17:26:00'),
(362, 34, 7, 1, 0, '2016-11-21 17:26:00'),
(363, 34, 8, 1, 0, '2016-11-21 17:26:00'),
(364, 34, 9, 1, 0, '2016-11-21 17:26:00'),
(365, 34, 10, 1, 0, '2016-11-21 17:26:00'),
(366, 34, 12, 1, 0, '2016-11-21 17:26:00'),
(367, 34, 24, 1, 0, '2016-11-21 17:26:00'),
(368, 34, 25, 1, 0, '2016-11-21 17:26:00'),
(369, 34, 26, 1, 0, '2016-11-21 17:26:00'),
(370, 34, 27, 1, 0, '2016-11-21 17:26:00'),
(371, 34, 28, 1, 0, '2016-11-21 17:26:00'),
(372, 34, 29, 1, 0, '2016-11-21 17:26:00'),
(373, 34, 30, 1, 0, '2016-11-21 17:26:00'),
(374, 34, 31, 1, 0, '2016-11-21 17:26:00'),
(375, 34, 32, 1, 0, '2016-11-21 17:26:00'),
(376, 34, 33, 1, 0, '2016-11-21 17:26:00'),
(407, 35, 110, 1, 0, '2016-11-22 15:15:42'),
(408, 35, 111, 1, 0, '2016-11-22 15:15:42');

-- --------------------------------------------------------

--
-- Table structure for table `pre_student_prefferd_teaching_types`
--

CREATE TABLE `pre_student_prefferd_teaching_types` (
  `id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `teaching_type_id` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `sort_order` int(11) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pre_student_prefferd_teaching_types`
--

INSERT INTO `pre_student_prefferd_teaching_types` (`id`, `student_id`, `teaching_type_id`, `status`, `sort_order`, `created_at`) VALUES
(1, 2, 1, 1, 0, '2016-11-08 12:06:28'),
(2, 2, 3, 1, 0, '2016-11-08 12:06:28'),
(3, 3, 3, 1, 0, '2016-11-08 12:22:37'),
(4, 4, 2, 1, 0, '2016-11-08 12:37:06'),
(40, 5, 2, 1, 0, '2016-11-21 14:47:30'),
(39, 5, 1, 1, 0, '2016-11-21 14:47:30'),
(7, 6, 1, 1, 0, '2016-11-08 13:06:16'),
(8, 6, 2, 1, 0, '2016-11-08 13:06:16'),
(9, 27, 1, 1, 0, '2016-11-14 10:53:07'),
(10, 27, 2, 1, 0, '2016-11-14 10:53:07'),
(11, 27, 3, 1, 0, '2016-11-14 10:53:07'),
(12, 28, 1, 1, 0, '2016-11-14 11:06:45'),
(13, 28, 2, 1, 0, '2016-11-14 11:06:45'),
(14, 28, 3, 1, 0, '2016-11-14 11:06:45'),
(15, 29, 1, 1, 0, '2016-11-14 11:11:26'),
(16, 29, 2, 1, 0, '2016-11-14 11:11:26'),
(17, 29, 3, 1, 0, '2016-11-14 11:11:26'),
(18, 30, 1, 1, 0, '2016-11-14 11:15:16'),
(19, 30, 2, 1, 0, '2016-11-14 11:15:16'),
(20, 30, 3, 1, 0, '2016-11-14 11:15:16'),
(21, 31, 1, 1, 0, '2016-11-14 11:17:45'),
(22, 31, 2, 1, 0, '2016-11-14 11:17:45'),
(23, 31, 3, 1, 0, '2016-11-14 11:17:45'),
(24, 32, 1, 1, 0, '2016-11-14 11:20:53'),
(25, 32, 2, 1, 0, '2016-11-14 11:20:53'),
(26, 32, 3, 1, 0, '2016-11-14 11:20:53'),
(27, 33, 1, 1, 0, '2016-11-14 11:24:05'),
(28, 33, 2, 1, 0, '2016-11-14 11:24:05'),
(29, 33, 3, 1, 0, '2016-11-14 11:24:05'),
(30, 34, 1, 1, 0, '2016-11-14 11:27:27'),
(31, 34, 2, 1, 0, '2016-11-14 11:27:27'),
(32, 34, 3, 1, 0, '2016-11-14 11:27:27'),
(33, 35, 1, 1, 0, '2016-11-14 11:30:38'),
(34, 35, 2, 1, 0, '2016-11-14 11:30:38'),
(35, 35, 3, 1, 0, '2016-11-14 11:30:38'),
(36, 36, 1, 1, 0, '2016-11-14 11:36:35'),
(37, 36, 2, 1, 0, '2016-11-14 11:36:35'),
(38, 36, 3, 1, 0, '2016-11-14 11:36:35'),
(41, 5, 3, 1, 0, '2016-11-21 14:47:30');

-- --------------------------------------------------------

--
-- Table structure for table `pre_student_preffered_courses`
--

CREATE TABLE `pre_student_preffered_courses` (
  `id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pre_student_preffered_courses`
--

INSERT INTO `pre_student_preffered_courses` (`id`, `student_id`, `course_id`, `status`, `created_at`) VALUES
(1, 2, 23, 1, '2016-11-08 12:06:52'),
(2, 2, 20, 1, '2016-11-08 12:06:52'),
(3, 2, 25, 1, '2016-11-08 12:06:52'),
(4, 2, 13, 1, '2016-11-08 12:06:52'),
(338, 5, 68, 1, '2016-11-21 13:33:07'),
(300, 3, 30, 1, '2016-11-21 13:18:57'),
(299, 3, 37, 1, '2016-11-21 13:18:57'),
(298, 3, 13, 1, '2016-11-21 13:18:57'),
(297, 3, 28, 1, '2016-11-21 13:18:57'),
(296, 3, 20, 1, '2016-11-21 13:18:57'),
(337, 5, 71, 1, '2016-11-21 13:33:07'),
(329, 4, 123, 1, '2016-11-21 13:28:01'),
(328, 4, 116, 1, '2016-11-21 13:28:01'),
(327, 4, 50, 1, '2016-11-21 13:28:01'),
(326, 4, 44, 1, '2016-11-21 13:28:01'),
(325, 4, 51, 1, '2016-11-21 13:28:01'),
(324, 4, 13, 1, '2016-11-21 13:28:01'),
(323, 4, 21, 1, '2016-11-21 13:28:01'),
(336, 5, 66, 1, '2016-11-21 13:33:07'),
(335, 5, 38, 1, '2016-11-21 13:33:07'),
(334, 5, 39, 1, '2016-11-21 13:33:07'),
(333, 5, 13, 1, '2016-11-21 13:33:07'),
(332, 5, 20, 1, '2016-11-21 13:33:07'),
(24, 6, 39, 1, '2016-11-08 13:05:29'),
(25, 6, 149, 1, '2016-11-08 13:05:29'),
(26, 6, 148, 1, '2016-11-08 13:05:29'),
(27, 27, 29, 1, '2016-11-14 10:52:31'),
(28, 27, 26, 1, '2016-11-14 10:52:31'),
(29, 27, 18, 1, '2016-11-14 10:52:31'),
(30, 27, 14, 1, '2016-11-14 10:52:31'),
(31, 27, 23, 1, '2016-11-14 10:52:31'),
(32, 27, 25, 1, '2016-11-14 10:52:31'),
(33, 27, 13, 1, '2016-11-14 10:52:31'),
(34, 27, 19, 1, '2016-11-14 10:52:31'),
(35, 27, 24, 1, '2016-11-14 10:52:31'),
(36, 27, 17, 1, '2016-11-14 10:52:31'),
(37, 27, 16, 1, '2016-11-14 10:52:31'),
(38, 27, 31, 1, '2016-11-14 10:52:31'),
(39, 27, 36, 1, '2016-11-14 10:52:31'),
(40, 27, 35, 1, '2016-11-14 10:52:31'),
(41, 27, 32, 1, '2016-11-14 10:52:31'),
(42, 27, 41, 1, '2016-11-14 10:52:31'),
(43, 27, 40, 1, '2016-11-14 10:52:31'),
(44, 27, 49, 1, '2016-11-14 10:52:31'),
(45, 27, 46, 1, '2016-11-14 10:52:31'),
(46, 27, 44, 1, '2016-11-14 10:52:31'),
(47, 27, 51, 1, '2016-11-14 10:52:31'),
(48, 27, 57, 1, '2016-11-14 10:52:31'),
(49, 27, 53, 1, '2016-11-14 10:52:31'),
(50, 27, 61, 1, '2016-11-14 10:52:31'),
(51, 27, 63, 1, '2016-11-14 10:52:31'),
(52, 27, 71, 1, '2016-11-14 10:52:31'),
(53, 27, 78, 1, '2016-11-14 10:52:31'),
(54, 27, 85, 1, '2016-11-14 10:52:31'),
(55, 27, 74, 1, '2016-11-14 10:52:31'),
(56, 27, 93, 1, '2016-11-14 10:52:31'),
(57, 27, 89, 1, '2016-11-14 10:52:31'),
(58, 27, 91, 1, '2016-11-14 10:52:31'),
(59, 27, 88, 1, '2016-11-14 10:52:31'),
(60, 27, 114, 1, '2016-11-14 10:52:31'),
(61, 27, 105, 1, '2016-11-14 10:52:31'),
(62, 27, 113, 1, '2016-11-14 10:52:31'),
(63, 27, 119, 1, '2016-11-14 10:52:31'),
(64, 27, 120, 1, '2016-11-14 10:52:31'),
(65, 27, 117, 1, '2016-11-14 10:52:31'),
(66, 28, 29, 1, '2016-11-14 11:03:52'),
(67, 28, 21, 1, '2016-11-14 11:03:52'),
(68, 28, 26, 1, '2016-11-14 11:03:52'),
(69, 28, 18, 1, '2016-11-14 11:03:52'),
(70, 28, 25, 1, '2016-11-14 11:03:52'),
(71, 28, 13, 1, '2016-11-14 11:03:52'),
(72, 28, 19, 1, '2016-11-14 11:03:52'),
(73, 28, 24, 1, '2016-11-14 11:03:52'),
(74, 28, 17, 1, '2016-11-14 11:03:52'),
(75, 28, 37, 1, '2016-11-14 11:03:52'),
(76, 28, 34, 1, '2016-11-14 11:03:52'),
(77, 28, 36, 1, '2016-11-14 11:03:52'),
(78, 28, 35, 1, '2016-11-14 11:03:52'),
(79, 28, 40, 1, '2016-11-14 11:03:52'),
(80, 28, 51, 1, '2016-11-14 11:03:52'),
(81, 28, 43, 1, '2016-11-14 11:03:52'),
(82, 28, 57, 1, '2016-11-14 11:03:52'),
(83, 28, 53, 1, '2016-11-14 11:03:52'),
(84, 28, 55, 1, '2016-11-14 11:03:52'),
(85, 28, 67, 1, '2016-11-14 11:03:52'),
(86, 28, 64, 1, '2016-11-14 11:03:52'),
(87, 28, 72, 1, '2016-11-14 11:03:52'),
(88, 28, 63, 1, '2016-11-14 11:03:52'),
(89, 28, 78, 1, '2016-11-14 11:03:52'),
(90, 28, 85, 1, '2016-11-14 11:03:52'),
(91, 28, 99, 1, '2016-11-14 11:03:52'),
(92, 28, 93, 1, '2016-11-14 11:03:52'),
(93, 28, 89, 1, '2016-11-14 11:03:52'),
(94, 28, 105, 1, '2016-11-14 11:03:52'),
(95, 28, 113, 1, '2016-11-14 11:03:52'),
(272, 29, 43, 1, '2016-11-21 12:40:32'),
(271, 29, 50, 1, '2016-11-21 12:40:32'),
(270, 29, 46, 1, '2016-11-21 12:40:32'),
(269, 29, 42, 1, '2016-11-21 12:40:32'),
(268, 29, 39, 1, '2016-11-21 12:40:32'),
(267, 29, 40, 1, '2016-11-21 12:40:32'),
(266, 29, 35, 1, '2016-11-21 12:40:32'),
(265, 29, 30, 1, '2016-11-21 12:40:32'),
(264, 29, 36, 1, '2016-11-21 12:40:32'),
(263, 29, 34, 1, '2016-11-21 12:40:32'),
(262, 29, 13, 1, '2016-11-21 12:40:32'),
(261, 29, 23, 1, '2016-11-21 12:40:32'),
(260, 29, 14, 1, '2016-11-21 12:40:32'),
(259, 29, 26, 1, '2016-11-21 12:40:32'),
(258, 29, 29, 1, '2016-11-21 12:40:32'),
(257, 29, 21, 1, '2016-11-21 12:40:32'),
(387, 30, 122, 1, '2016-11-21 16:23:59'),
(386, 30, 120, 1, '2016-11-21 16:23:59'),
(385, 30, 119, 1, '2016-11-21 16:23:59'),
(384, 30, 105, 1, '2016-11-21 16:23:59'),
(383, 30, 113, 1, '2016-11-21 16:23:59'),
(382, 30, 114, 1, '2016-11-21 16:23:59'),
(381, 30, 86, 1, '2016-11-21 16:23:59'),
(380, 30, 89, 1, '2016-11-21 16:23:59'),
(379, 30, 79, 1, '2016-11-21 16:23:59'),
(378, 30, 85, 1, '2016-11-21 16:23:59'),
(377, 30, 78, 1, '2016-11-21 16:23:59'),
(376, 30, 65, 1, '2016-11-21 16:23:59'),
(375, 30, 68, 1, '2016-11-21 16:23:59'),
(374, 30, 71, 1, '2016-11-21 16:23:59'),
(373, 30, 15, 1, '2016-11-21 16:23:59'),
(372, 30, 21, 1, '2016-11-21 16:23:59'),
(371, 30, 13, 1, '2016-11-21 16:23:59'),
(370, 30, 14, 1, '2016-11-21 16:23:59'),
(369, 30, 20, 1, '2016-11-21 16:23:59'),
(396, 31, 40, 1, '2016-11-21 17:02:35'),
(395, 31, 38, 1, '2016-11-21 17:02:35'),
(394, 31, 41, 1, '2016-11-21 17:02:35'),
(393, 31, 39, 1, '2016-11-21 17:02:35'),
(392, 31, 15, 1, '2016-11-21 17:02:35'),
(391, 31, 21, 1, '2016-11-21 17:02:35'),
(390, 31, 13, 1, '2016-11-21 17:02:35'),
(389, 31, 14, 1, '2016-11-21 17:02:35'),
(388, 31, 20, 1, '2016-11-21 17:02:35'),
(368, 32, 58, 1, '2016-11-21 16:10:03'),
(367, 32, 59, 1, '2016-11-21 16:10:03'),
(366, 32, 54, 1, '2016-11-21 16:10:03'),
(365, 32, 62, 1, '2016-11-21 16:10:03'),
(364, 32, 49, 1, '2016-11-21 16:10:03'),
(363, 32, 47, 1, '2016-11-21 16:10:03'),
(362, 32, 44, 1, '2016-11-21 16:10:03'),
(361, 32, 51, 1, '2016-11-21 16:10:03'),
(360, 32, 40, 1, '2016-11-21 16:10:03'),
(359, 32, 41, 1, '2016-11-21 16:10:03'),
(358, 32, 39, 1, '2016-11-21 16:10:03'),
(357, 32, 34, 1, '2016-11-21 16:10:03'),
(356, 32, 37, 1, '2016-11-21 16:10:03'),
(355, 32, 30, 1, '2016-11-21 16:10:03'),
(354, 32, 36, 1, '2016-11-21 16:10:03'),
(353, 32, 20, 1, '2016-11-21 16:10:03'),
(352, 32, 15, 1, '2016-11-21 16:10:03'),
(351, 32, 21, 1, '2016-11-21 16:10:03'),
(350, 32, 13, 1, '2016-11-21 16:10:03'),
(349, 32, 14, 1, '2016-11-21 16:10:03'),
(184, 33, 29, 1, '2016-11-14 11:23:18'),
(185, 33, 21, 1, '2016-11-14 11:23:18'),
(186, 33, 26, 1, '2016-11-14 11:23:18'),
(187, 33, 18, 1, '2016-11-14 11:23:18'),
(188, 33, 14, 1, '2016-11-14 11:23:18'),
(189, 33, 23, 1, '2016-11-14 11:23:18'),
(190, 33, 28, 1, '2016-11-14 11:23:18'),
(191, 33, 25, 1, '2016-11-14 11:23:18'),
(192, 33, 39, 1, '2016-11-14 11:23:18'),
(193, 33, 41, 1, '2016-11-14 11:23:18'),
(194, 33, 38, 1, '2016-11-14 11:23:18'),
(195, 33, 40, 1, '2016-11-14 11:23:18'),
(196, 33, 49, 1, '2016-11-14 11:23:18'),
(197, 33, 46, 1, '2016-11-14 11:23:18'),
(198, 33, 44, 1, '2016-11-14 11:23:18'),
(199, 33, 51, 1, '2016-11-14 11:23:18'),
(200, 33, 43, 1, '2016-11-14 11:23:18'),
(420, 35, 15, 1, '2016-11-22 15:15:19'),
(414, 34, 45, 1, '2016-11-21 17:25:37'),
(413, 34, 48, 1, '2016-11-21 17:25:37'),
(412, 34, 44, 1, '2016-11-21 17:25:37'),
(411, 34, 51, 1, '2016-11-21 17:25:37'),
(410, 34, 49, 1, '2016-11-21 17:25:37'),
(409, 34, 41, 1, '2016-11-21 17:25:37'),
(408, 34, 39, 1, '2016-11-21 17:25:37'),
(407, 34, 40, 1, '2016-11-21 17:25:37'),
(406, 34, 33, 1, '2016-11-21 17:25:37'),
(405, 34, 36, 1, '2016-11-21 17:25:37'),
(404, 34, 31, 1, '2016-11-21 17:25:37'),
(403, 34, 37, 1, '2016-11-21 17:25:37'),
(402, 34, 30, 1, '2016-11-21 17:25:37'),
(401, 34, 14, 1, '2016-11-21 17:25:37'),
(400, 34, 20, 1, '2016-11-21 17:25:37'),
(399, 34, 15, 1, '2016-11-21 17:25:37'),
(398, 34, 21, 1, '2016-11-21 17:25:37'),
(397, 34, 13, 1, '2016-11-21 17:25:37'),
(419, 35, 21, 1, '2016-11-22 15:15:19'),
(418, 35, 13, 1, '2016-11-22 15:15:19'),
(417, 35, 14, 1, '2016-11-22 15:15:19'),
(416, 35, 20, 1, '2016-11-22 15:15:19'),
(415, 35, 24, 1, '2016-11-22 15:15:19'),
(343, 36, 33, 1, '2016-11-21 15:51:44'),
(342, 36, 21, 1, '2016-11-21 15:51:44'),
(341, 36, 13, 1, '2016-11-21 15:51:44'),
(340, 36, 14, 1, '2016-11-21 15:51:44'),
(339, 36, 20, 1, '2016-11-21 15:51:44'),
(295, 3, 14, 1, '2016-11-21 13:18:57'),
(331, 5, 14, 1, '2016-11-21 13:33:07'),
(330, 4, 115, 1, '2016-11-21 13:28:01'),
(421, 104, 26, 1, '2017-01-17 10:28:17'),
(422, 104, 20, 1, '2017-01-17 10:28:17'),
(423, 104, 28, 1, '2017-01-17 10:28:17');

-- --------------------------------------------------------

--
-- Table structure for table `pre_subscriptions`
--

CREATE TABLE `pre_subscriptions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `user_name` varchar(512) NOT NULL DEFAULT '',
  `user_type` enum('Tutor','Student','Institute') NOT NULL,
  `package_id` int(11) NOT NULL DEFAULT '0',
  `package_name` varchar(512) NOT NULL DEFAULT '',
  `package_cost` decimal(10,2) NOT NULL,
  `amount_paid` decimal(10,2) DEFAULT NULL,
  `credits` int(11) NOT NULL,
  `payment_type` varchar(512) NOT NULL,
  `transaction_no` varchar(512) NOT NULL,
  `payment_received` int(11) NOT NULL DEFAULT '0',
  `payer_id` varchar(512) DEFAULT NULL,
  `payer_email` varchar(512) NOT NULL DEFAULT '',
  `payer_name` varchar(512) DEFAULT '',
  `subscribe_date` datetime NOT NULL,
  `user_group_id` int(11) DEFAULT NULL,
  `discount_type` enum('Value','Percent') DEFAULT 'Percent',
  `discount_value` decimal(10,2) DEFAULT NULL,
  `discount_amount` decimal(10,2) DEFAULT NULL,
  `payment_updated_user` enum('yes','no','settled') DEFAULT 'no',
  `payment_updated_user_date` timestamp NULL DEFAULT NULL,
  `payment_updated_user_message` text,
  `payment_updated_admin` enum('yes','no','settled') DEFAULT 'no',
  `payment_updated_admin_time` timestamp NULL DEFAULT NULL,
  `payment_updated_admin_message` text,
  `remarks` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pre_subscriptions`
--

INSERT INTO `pre_subscriptions` (`id`, `user_id`, `user_name`, `user_type`, `package_id`, `package_name`, `package_cost`, `amount_paid`, `credits`, `payment_type`, `transaction_no`, `payment_received`, `payer_id`, `payer_email`, `payer_name`, `subscribe_date`, `user_group_id`, `discount_type`, `discount_value`, `discount_amount`, `payment_updated_user`, `payment_updated_user_date`, `payment_updated_user_message`, `payment_updated_admin`, `payment_updated_admin_time`, `payment_updated_admin_message`, `remarks`) VALUES
(1, 2, 'Ayzlee Rayhanna', 'Student', 4, 'Premium-Student', '250.00', '200.00', 500, 'paypal', '21K402382U8535517', 1, 'F2TMN4DXTNFZS', 'conqtech7-buyer@gmail.com', 'test buyer', '2016-11-09 10:24:39', 2, 'Value', '50.00', '50.00', 'no', NULL, NULL, 'no', NULL, NULL, NULL),
(2, 2, 'Ayzlee Rayhanna', 'Student', 4, 'Premium-Student', '250.00', '200.00', 500, 'paypal', '1V338340YY472823Y', 1, 'F2TMN4DXTNFZS', 'conqtech7-buyer@gmail.com', 'test buyer', '2016-11-09 18:10:58', 2, 'Value', '50.00', '50.00', 'no', NULL, NULL, 'no', NULL, NULL, NULL),
(3, 3, 'Azalya Abia', 'Student', 4, 'Premium-Student', '250.00', '200.00', 500, 'paypal', '4V718323JN811142S', 1, 'F2TMN4DXTNFZS', 'conqtech7-buyer@gmail.com', 'test buyer', '2016-11-09 18:13:05', 2, 'Value', '50.00', '50.00', 'no', NULL, NULL, 'no', NULL, NULL, NULL),
(4, 4, 'Azani Nathalya', 'Student', 10, 'General Package', '400.00', '300.00', 600, 'paypal', '7WP86557G9989052S', 1, 'F2TMN4DXTNFZS', 'conqtech7-buyer@gmail.com', 'test buyer', '2016-11-09 18:16:33', 2, 'Percent', '25.00', '0.16', 'no', NULL, NULL, 'no', NULL, NULL, NULL),
(5, 5, 'Bae Mirage', 'Student', 10, 'General Package', '400.00', '300.00', 600, 'paypal', '8LL287302V358745B', 1, 'F2TMN4DXTNFZS', 'conqtech7-buyer@gmail.com', 'test buyer', '2016-11-09 18:20:14', 2, 'Percent', '25.00', '0.16', 'no', NULL, NULL, 'no', NULL, NULL, NULL),
(6, 6, 'Baeleigh Elmina', 'Student', 10, 'General Package', '400.00', '300.00', 600, 'paypal', '30M88992015694421', 1, 'F2TMN4DXTNFZS', 'conqtech7-buyer@gmail.com', 'test buyer', '2016-11-09 18:22:32', 2, 'Percent', '25.00', '0.16', 'no', NULL, NULL, 'no', NULL, NULL, NULL),
(7, 6, 'Baeleigh Elmina', 'Student', 10, 'General Package', '400.00', '300.00', 600, 'paypal', '808074201K323703C', 1, 'F2TMN4DXTNFZS', 'conqtech7-buyer@gmail.com', 'test buyer', '2016-11-09 18:24:25', 2, 'Percent', '25.00', '0.16', 'no', NULL, NULL, 'no', NULL, NULL, NULL),
(8, 68, 'Augustine Alondra', 'Tutor', 2, 'Gold-Tutor', '500.00', '400.00', 1000, 'paypal', '5Y791014FM513844T', 1, 'F2TMN4DXTNFZS', 'conqtech7-buyer@gmail.com', 'test buyer', '2016-11-10 16:00:21', 3, 'Percent', '20.00', '0.25', 'no', NULL, NULL, 'no', NULL, NULL, NULL),
(9, 3, 'Azalya Abia', 'Student', 1, 'Gold-Student', '500.00', '400.00', 1000, 'paypal', '6A613030LY069860G', 1, 'F2TMN4DXTNFZS', 'conqtech7-buyer@gmail.com', 'test buyer', '2016-11-11 09:56:32', 2, 'Percent', '20.00', '0.25', 'no', NULL, NULL, 'no', NULL, NULL, NULL),
(10, 7, 'Behati Corinn', 'Tutor', 2, 'Gold-Tutor', '500.00', '400.00', 1000, 'paypal', '5BS17548SU5785238', 1, 'F2TMN4DXTNFZS', 'conqtech7-buyer@gmail.com', 'test buyer', '2016-11-11 10:26:49', 3, 'Percent', '20.00', '0.25', 'no', NULL, NULL, 'no', NULL, NULL, NULL),
(11, 7, 'Behati Corinn', 'Tutor', 2, 'Gold-Tutor', '500.00', '400.00', 1000, 'paypal', '1MV39455DX619380M', 1, 'F2TMN4DXTNFZS', 'conqtech7-buyer@gmail.com', 'test buyer', '2016-11-11 10:27:56', 3, 'Percent', '20.00', '0.25', 'no', NULL, NULL, 'no', NULL, NULL, NULL),
(12, 68, 'Augustine Alondra', 'Tutor', 10, 'General Package', '400.00', '300.00', 600, 'paypal', '792051284F7017312', 1, 'F2TMN4DXTNFZS', 'conqtech7-buyer@gmail.com', 'test buyer', '2016-11-11 10:41:17', 3, 'Percent', '25.00', '0.16', 'no', NULL, NULL, 'no', NULL, NULL, NULL),
(13, 3, 'Azalya Abia', 'Student', 10, 'General Package', '400.00', '300.00', 600, 'paypal', '32F79929LT764201V', 1, 'F2TMN4DXTNFZS', 'conqtech7-buyer@gmail.com', 'test buyer', '2016-11-11 10:43:48', 2, 'Percent', '25.00', '0.16', 'no', NULL, NULL, 'no', NULL, NULL, NULL),
(14, 13, 'Bebe Esmie', 'Institute', 3, 'Gold-Inst', '500.00', '400.00', 1000, 'paypal', '1R158414TP429642A', 1, 'F2TMN4DXTNFZS', 'conqtech7-buyer@gmail.com', 'test buyer', '2016-11-11 10:54:51', 4, 'Percent', '20.00', '0.25', 'no', NULL, NULL, 'no', NULL, NULL, NULL),
(15, 13, 'Bebe Esmie', 'Institute', 3, 'Gold-Inst', '500.00', '400.00', 1000, 'paypal', '00W599051E6952700', 1, 'F2TMN4DXTNFZS', 'conqtech7-buyer@gmail.com', 'test buyer', '2016-11-11 10:55:32', 4, 'Percent', '20.00', '0.25', 'no', NULL, NULL, 'no', NULL, NULL, NULL),
(16, 3, 'Azalya Abia', 'Student', 1, 'Gold-Student', '500.00', '400.00', 1000, 'paypal', '0CD25117SU193104N', 1, 'F2TMN4DXTNFZS', 'conqtech7-buyer@gmail.com', 'test buyer', '2016-11-11 10:57:21', 2, 'Percent', '20.00', '0.25', 'no', NULL, NULL, 'no', NULL, NULL, NULL),
(17, 3, 'Azalya Abia', 'Student', 1, 'Gold-Student', '500.00', '400.00', 1000, 'paypal', '5K7073630V866371S', 1, 'F2TMN4DXTNFZS', 'conqtech7-buyer@gmail.com', 'test buyer', '2016-11-11 10:58:11', 2, 'Percent', '20.00', '0.25', 'no', NULL, NULL, 'no', NULL, NULL, NULL),
(18, 3, 'Azalya Abia', 'Student', 1, 'Gold-Student', '500.00', '400.00', 1000, 'paypal', '70375747MN851504T', 1, 'F2TMN4DXTNFZS', 'conqtech7-buyer@gmail.com', 'test buyer', '2016-11-11 11:37:44', 2, 'Percent', '20.00', '0.25', 'no', NULL, NULL, 'no', NULL, NULL, NULL),
(19, 3, 'Azalya Abia', 'Student', 1, 'Gold-Student', '500.00', '400.00', 1000, 'paypal', '7S719111NG8182002', 1, 'F2TMN4DXTNFZS', 'conqtech7-buyer@gmail.com', 'test buyer', '2016-11-11 11:38:42', 2, 'Percent', '20.00', '0.25', 'no', NULL, NULL, 'no', NULL, NULL, NULL),
(20, 7, 'Behati Corinn', 'Tutor', 2, 'Gold-Tutor', '500.00', '400.00', 3000, 'paypal', '50U231977C2843428', 1, 'F2TMN4DXTNFZS', 'conqtech7-buyer@gmail.com', 'test buyer', '2016-11-11 11:43:35', 3, 'Percent', '20.00', '0.25', 'no', NULL, NULL, 'no', NULL, NULL, NULL),
(21, 3, 'Azalya Abia', 'Student', 1, 'Gold-Student', '500.00', '400.00', 3000, 'paypal', '0MY33677VD420915M', 1, 'F2TMN4DXTNFZS', 'conqtech7-buyer@gmail.com', 'test buyer', '2016-11-11 11:46:13', 2, 'Percent', '20.00', '0.25', 'no', NULL, NULL, 'no', NULL, NULL, NULL),
(22, 3, 'Azalya Abia', 'Student', 1, 'Gold-Student', '500.00', '400.00', 3000, 'paypal', '69L05456YA8300416', 1, 'F2TMN4DXTNFZS', 'conqtech7-buyer@gmail.com', 'test buyer', '2016-11-11 11:46:54', 2, 'Percent', '20.00', '0.25', 'no', NULL, NULL, 'no', NULL, NULL, NULL),
(23, 32, 'Mahaila Fortune', 'Student', 1, 'Gold-Student', '500.00', '400.00', 3000, 'paypal', '67K07783T4331553B', 1, 'F2TMN4DXTNFZS', 'conqtech7-buyer@gmail.com', 'test buyer', '2016-11-14 11:56:00', 2, 'Percent', '20.00', '0.25', 'no', NULL, NULL, 'no', NULL, NULL, NULL),
(24, 33, 'Mahati Harliee', 'Student', 1, 'Gold-Student', '500.00', '400.00', 3000, 'paypal', '5CD45298DH208503U', 1, 'F2TMN4DXTNFZS', 'conqtech7-buyer@gmail.com', 'test buyer', '2016-11-14 12:04:16', 2, 'Percent', '20.00', '0.25', 'no', NULL, NULL, 'no', NULL, NULL, NULL),
(25, 34, 'Mahelet Dalasia', 'Student', 1, 'Gold-Student', '500.00', '400.00', 3000, 'paypal', '3JP79634TV347883S', 1, 'F2TMN4DXTNFZS', 'conqtech7-buyer@gmail.com', 'test buyer', '2016-11-14 12:09:54', 2, 'Percent', '20.00', '0.25', 'no', NULL, NULL, 'no', NULL, NULL, NULL),
(26, 29, 'Maesa Karthika', 'Student', 10, 'General Package', '400.00', '300.00', 600, 'paypal', '9GX40556X47317447', 1, 'F2TMN4DXTNFZS', 'conqtech7-buyer@gmail.com', 'test buyer', '2016-11-21 12:35:07', 2, 'Percent', '25.00', '0.16', 'no', NULL, NULL, 'no', NULL, NULL, NULL),
(27, 104, 'Adiyya T', 'Student', 4, 'Premium-Student', '250.00', '250.00', 500, 'stripe', 'tok_9wqHfD7l5xr4bD', 1, NULL, 'adiyya@gmail.com', '', '2017-01-17 19:16:33', 2, 'Value', '50.00', '50.00', 'no', NULL, NULL, 'no', NULL, NULL, NULL),
(28, 104, 'Adiyya T', 'Student', 10, 'General Package', '400.00', '400.00', 600, 'stripe', 'tok_9x5BzldEy47opm', 1, NULL, 'adiyya@gmail.com', '', '2017-01-18 10:04:02', 2, 'Percent', '25.00', '0.16', 'no', NULL, NULL, 'no', NULL, NULL, NULL),
(29, 104, 'Adiyya T', 'Student', 7, 'Silver-Student', '100.00', '100.00', 100, 'stripe', 'tok_9x5PnVb6mWDpr3', 1, NULL, 'adiyya@gmail.com', '', '2017-01-18 10:10:08', 2, 'Percent', '10.00', '0.10', 'no', NULL, NULL, 'no', NULL, NULL, NULL),
(30, 104, 'Adiyya T', 'Student', 7, 'Silver-Student', '100.00', '100.00', 100, 'stripe', 'tok_9x5PnVb6mWDpr3', 1, NULL, 'adiyya@gmail.com', '', '2017-01-18 10:10:31', 2, 'Percent', '10.00', '0.10', 'no', NULL, NULL, 'no', NULL, NULL, NULL),
(31, 104, 'Adiyya T', 'Student', 7, 'Silver-Student', '100.00', '100.00', 100, 'stripe', 'tok_9x5dd01Bu5q6aL', 1, 'cus_9x5d58yTGAY0xQ', 'adiyya@gmail.com', '', '2017-01-18 10:24:10', 2, 'Percent', '10.00', '0.10', 'no', NULL, NULL, 'no', NULL, NULL, NULL),
(32, 104, 'Adiyya T', 'Student', 7, 'Silver-Student', '100.00', '100.00', 100, 'manual', 'fsdfsfsdfsd', 1, '', 'adiyya@gmail.com', '', '2017-01-18 16:44:58', 2, 'Percent', '10.00', '0.10', 'yes', '2017-01-18 12:21:22', 'test', 'settled', '2017-01-18 13:37:40', 'I will check it', NULL),
(33, 104, 'Adiyya T', 'Student', 11, 'Basic Package', '200.00', '0.00', 300, 'tpay', '', 0, '', 'adiyya@gmail.com', '', '2017-01-19 15:45:22', 2, 'Value', '30.00', '30.00', 'no', NULL, NULL, 'no', NULL, NULL, NULL),
(34, 104, 'Adiyya T', 'Student', 7, 'Silver-Student', '100.00', '100.00', 100, 'pagseguro', '', 1, '', 'adiyya@gmail.com', '', '2017-01-19 19:42:58', 2, 'Percent', '10.00', '0.10', 'no', NULL, NULL, 'no', NULL, NULL, NULL),
(35, 104, 'Adiyya T', 'Student', 7, 'Silver-Student', '100.00', '100.00', 100, 'pagseguro', '', 1, '', 'adiyya@gmail.com', '', '2017-01-19 19:44:52', 2, 'Percent', '10.00', '0.10', 'no', NULL, NULL, 'no', NULL, NULL, NULL),
(36, 104, 'Adiyya T', 'Student', 7, 'Silver-Student', '100.00', '100.00', 100, 'pagseguro', '', 1, '', 'adiyya@gmail.com', '', '2017-01-19 19:45:45', 2, 'Percent', '10.00', '0.10', 'no', NULL, NULL, 'no', NULL, NULL, NULL),
(37, 104, 'Adiyya T', 'Student', 7, 'Silver-Student', '100.00', '100.00', 100, 'pagseguro', '', 1, '', 'adiyya@gmail.com', '', '2017-01-19 19:46:35', 2, 'Percent', '10.00', '0.10', 'no', NULL, NULL, 'no', NULL, NULL, NULL),
(38, 104, 'Adiyya T', 'Student', 7, 'Silver-Student', '100.00', '100.00', 100, 'pagseguro', '', 1, '', 'adiyya@gmail.com', '', '2017-01-19 19:47:03', 2, 'Percent', '10.00', '0.10', 'no', NULL, NULL, 'no', NULL, NULL, NULL),
(39, 104, 'Adiyya T', 'Student', 7, 'Silver-Student', '100.00', '100.00', 100, 'pagseguro', '', 1, '', 'adiyya@gmail.com', '', '2017-01-19 19:47:35', 2, 'Percent', '10.00', '0.10', 'no', NULL, NULL, 'no', NULL, NULL, NULL),
(40, 104, 'Adiyya T', 'Student', 7, 'Silver-Student', '100.00', '90.00', 100, 'razorpay', 'pay_7BnyYblB19Gkl1', 1, '', 'adiyya@gmail.com', '', '2017-01-31 19:50:12', 2, 'Percent', '10.00', '0.10', 'no', NULL, NULL, 'no', NULL, NULL, NULL),
(41, 104, 'Adiyya T', 'Student', 7, 'Silver-Student', '100.00', '90.00', 100, 'razorpay', 'pay_7BnyYblB19Gkl1', 1, '', 'adiyya@gmail.com', '', '2017-01-31 19:51:36', 2, 'Percent', '10.00', '0.10', 'no', NULL, NULL, 'no', NULL, NULL, NULL),
(42, 104, 'Adiyya T', 'Student', 7, 'Silver-Student', '100.00', '90.00', 100, 'razorpay', 'pay_7BnyYblB19Gkl1', 1, '', 'adiyya@gmail.com', '', '2017-01-31 19:54:22', 2, 'Percent', '10.00', '0.10', 'no', NULL, NULL, 'no', NULL, NULL, NULL),
(43, 104, 'Adiyya T', 'Student', 7, 'Silver-Student', '100.00', '90.00', 100, 'razorpay', 'pay_7BnyYblB19Gkl1', 1, '', 'adiyya@gmail.com', '', '2017-01-31 19:54:37', 2, 'Percent', '10.00', '0.10', 'no', NULL, NULL, 'no', NULL, NULL, NULL),
(44, 104, 'Adiyya T', 'Student', 7, 'Silver-Student', '100.00', '90.00', 100, 'razorpay', 'pay_7BnyYblB19Gkl1', 1, '', 'adiyya@gmail.com', '', '2017-01-31 19:56:54', 2, 'Percent', '10.00', '0.10', 'no', NULL, NULL, 'no', NULL, NULL, NULL),
(45, 7, 'Behati Corinn', 'Tutor', 11, 'Basic Package', '200.00', '0.00', 300, 'manual', 'manual', 0, '', 'bellaadwerd123@gmail.com', '', '2017-02-03 14:02:35', 3, 'Value', '30.00', '30.00', 'no', NULL, NULL, 'no', NULL, NULL, NULL),
(46, 3, 'Azalya Abia', 'Student', 1, 'Gold-Student', '500.00', '0.00', 3000, 'manual', 'manual', 1, '', 'micheljohn930@gmail.com', '', '2017-02-17 16:26:40', 2, 'Percent', '20.00', '0.25', 'no', NULL, NULL, 'settled', '2017-02-17 11:04:31', 'yess', NULL),
(47, 3, 'Azalya Abia', 'Student', 10, 'General Package', '400.00', '300.00', 600, 'razorpay', 'pay_7IToELX3ZjxCCB', 1, '', 'micheljohn930@gmail.com', '', '2017-02-17 16:28:44', 2, 'Percent', '25.00', '0.16', 'no', NULL, NULL, 'no', NULL, NULL, NULL),
(48, 3, 'Azalya Abia', 'Student', 4, 'Premium-Student', '250.00', '0.00', 500, 'manual', 'manual', 1, '', 'micheljohn930@gmail.com', '', '2017-02-17 16:35:35', 2, 'Value', '50.00', '50.00', 'yes', '2017-02-17 11:06:43', 'yesno', 'settled', '2017-02-17 11:07:44', 'nooo', NULL),
(49, 3, 'Azalya Abia', 'Student', 11, 'Basic Package', '200.00', '0.00', 300, 'manual', 'manual', 1, '', 'micheljohn930@gmail.com', '', '2017-02-17 16:41:02', 2, 'Value', '30.00', '30.00', 'no', NULL, NULL, 'settled', '2017-02-17 11:14:29', 'sdfasdfasdfsdf asf asd', NULL),
(50, 3, 'Azalya Abia', 'Student', 10, 'General Package', '400.00', '400.00', 600, 'stripe', 'tok_A8QgYKYNQqI3wi', 1, 'cus_A8QgbQrkDz8i95', 'micheljohn930@gmail.com', '', '2017-02-17 16:53:20', 2, 'Percent', '25.00', '0.16', 'no', NULL, NULL, 'no', NULL, NULL, NULL),
(51, 3, 'Azalya Abia', 'Student', 4, 'Premium-Student', '250.00', '0.00', 500, 'tpay', '', 0, '', 'micheljohn930@gmail.com', '', '2017-02-17 17:00:16', 2, 'Value', '50.00', '50.00', 'no', NULL, NULL, 'no', NULL, NULL, NULL),
(52, 3, 'Azalya Abia', 'Student', 4, 'Premium-Student', '250.00', '250.00', 500, 'pagseguro', '', 1, '', 'micheljohn930@gmail.com', '', '2017-02-17 17:03:06', 2, 'Value', '50.00', '50.00', 'no', NULL, NULL, 'no', NULL, NULL, NULL),
(53, 3, 'Azalya Abia', 'Student', 4, 'Premium-Student', '250.00', '250.00', 500, 'pagseguro', '', 1, '', 'micheljohn930@gmail.com', '', '2017-02-17 17:03:13', 2, 'Value', '50.00', '50.00', 'no', NULL, NULL, 'no', NULL, NULL, NULL),
(54, 3, 'Azalya Abia', 'Student', 4, 'Premium-Student', '250.00', '250.00', 500, 'pagseguro', '', 1, '', 'micheljohn930@gmail.com', '', '2017-02-17 17:03:16', 2, 'Value', '50.00', '50.00', 'no', NULL, NULL, 'no', NULL, NULL, NULL),
(55, 3, 'Azalya Abia', 'Student', 4, 'Premium-Student', '250.00', '250.00', 500, 'pagseguro', '', 1, '', 'micheljohn930@gmail.com', '', '2017-02-17 17:04:08', 2, 'Value', '50.00', '50.00', 'no', NULL, NULL, 'no', NULL, NULL, NULL),
(56, 7, 'Behati Corinn', 'Tutor', 10, 'General Package', '400.00', '0.00', 600, 'manual', 'manual', 0, '', 'bellaadwerd123@gmail.com', '', '2017-02-17 17:09:10', 3, 'Percent', '25.00', '0.16', 'no', NULL, NULL, 'no', NULL, NULL, NULL),
(57, 7, 'Behati Corinn', 'Tutor', 2, 'Gold-Tutor', '500.00', '0.00', 1000, 'manual', 'manual', 0, '', 'bellaadwerd123@gmail.com', '', '2017-02-17 17:09:28', 3, 'Percent', '20.00', '0.25', 'no', NULL, NULL, 'no', NULL, NULL, NULL),
(58, 7, 'Behati Corinn', 'Tutor', 2, 'Gold-Tutor', '500.00', '400.00', 1000, 'razorpay', 'pay_7IUWvcWh0CfvD3', 1, '', 'bellaadwerd123@gmail.com', '', '2017-02-17 17:10:51', 3, 'Percent', '20.00', '0.25', 'no', NULL, NULL, 'no', NULL, NULL, NULL),
(59, 7, 'Behati Corinn', 'Tutor', 10, 'General Package', '400.00', '400.00', 600, 'pagseguro', '', 1, '', 'bellaadwerd123@gmail.com', '', '2017-02-17 17:13:54', 3, 'Percent', '25.00', '0.16', 'no', NULL, NULL, 'no', NULL, NULL, NULL),
(60, 3, 'Azalya Abia', 'Student', 11, 'Basic Package', '200.00', '170.00', 300, 'paypal', '89U63146CB8770037', 1, 'SGB3CVXM96CFG', 'gjpeter@gmail.com', 'John peter', '2017-02-21 13:07:50', 2, 'Value', '30.00', '30.00', 'no', NULL, NULL, 'no', NULL, NULL, NULL),
(61, 3, 'Azalya Abia', 'Student', 7, 'Silver-Student', '100.00', '0.00', 100, 'tpay', '', 0, '', 'micheljohn930@gmail.com', '', '2017-02-21 17:24:04', 2, 'Percent', '10.00', '0.10', 'no', NULL, NULL, 'no', NULL, NULL, NULL),
(62, 3, 'Azalya Abia', 'Student', 7, 'Silver-Student', '100.00', '0.00', 100, 'tpay', '', 0, '', 'micheljohn930@gmail.com', '', '2017-02-21 17:28:07', 2, 'Percent', '10.00', '0.10', 'no', NULL, NULL, 'no', NULL, NULL, NULL),
(63, 3, 'Azalya Abia', 'Student', 7, 'Silver-Student', '100.00', '100.00', 100, 'pagseguro', '', 1, '', 'micheljohn930@gmail.com', '', '2017-02-23 15:33:52', 2, 'Percent', '10.00', '0.10', 'no', NULL, NULL, 'no', NULL, NULL, NULL),
(64, 3, 'Azalya Abia', 'Student', 7, 'Silver-Student', '100.00', '0.00', 100, 'tpay', '', 0, '', 'micheljohn930@gmail.com', '', '2017-02-23 15:35:26', 2, 'Percent', '10.00', '0.10', 'no', NULL, NULL, 'no', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `pre_system_settings_fields`
--

CREATE TABLE `pre_system_settings_fields` (
  `field_id` int(11) NOT NULL,
  `type_id` int(11) DEFAULT NULL,
  `field_name` varchar(256) CHARACTER SET latin1 DEFAULT NULL,
  `field_key` varchar(256) CHARACTER SET latin1 DEFAULT NULL,
  `is_required` enum('Yes','No') CHARACTER SET latin1 DEFAULT 'No',
  `field_order` int(10) DEFAULT '0',
  `field_type` enum('select','file','email','text','textarea','checkbox') DEFAULT 'text',
  `field_type_values` text,
  `field_output_value` text,
  `field_type_slug` varchar(20) DEFAULT NULL,
  `created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pre_system_settings_fields`
--

INSERT INTO `pre_system_settings_fields` (`field_id`, `type_id`, `field_name`, `field_key`, `is_required`, `field_order`, `field_type`, `field_type_values`, `field_output_value`, `field_type_slug`, `created`, `updated`) VALUES
(9, 16, 'Account SID', 'Account_SID', 'No', 0, 'text', '', '343', NULL, '2015-11-09 12:17:24', NULL),
(10, 16, 'Auth Token', 'Auth_Token', 'No', 0, 'text', '', '23232', NULL, '2015-11-09 12:18:21', NULL),
(14, 13, 'Meta Keyword', 'Meta_Keyword', 'No', 0, 'text', NULL, 'Test Meta Keyword Value ', 'SEO_SETTINGS', '2015-11-09 13:20:57', '2016-11-23 14:43:20'),
(15, 13, 'Meta Description', 'Meta_Description', 'No', 0, 'text', NULL, 'Test Meta Description Value', 'SEO_SETTINGS', '2015-11-09 13:21:15', '2016-11-23 14:43:20'),
(22, 1, 'Site Title', 'Site_Title', 'Yes', 0, 'text', '', 'Tutors Menorah', 'SYSTEM_SETTINGS', '2015-11-24 09:43:37', '2017-02-14 18:43:26'),
(23, 1, 'Address', 'Address', 'Yes', 0, 'textarea', '', 'Silicon Valley, Hitech City , Digital Vidhya', 'SYSTEM_SETTINGS', '2015-11-24 09:46:55', '2017-02-14 18:43:26'),
(24, 1, 'City', 'City', 'Yes', 0, 'text', NULL, 'Hyderabad', 'SYSTEM_SETTINGS', '2015-11-24 09:48:43', '2017-02-14 18:43:26'),
(25, 1, 'State', 'State', 'Yes', 0, 'text', '', 'Telangana', 'SYSTEM_SETTINGS', '2015-11-24 09:49:16', '2017-02-14 18:43:26'),
(26, 1, 'Country', 'Country', 'Yes', 0, 'text', '', 'India', 'SYSTEM_SETTINGS', '2015-11-24 09:52:57', '2017-02-14 18:43:26'),
(27, 1, 'Zipcode', 'Zipcode', 'Yes', 0, 'text', '', '500081', 'SYSTEM_SETTINGS', '2015-11-24 09:53:20', '2017-02-14 18:43:26'),
(28, 1, 'Rights Reserved by', 'Rights_Reserved_by', 'No', 0, 'text', NULL, 'Copyright &copy; 2016  All rights reserved', 'SYSTEM_SETTINGS', '2015-11-24 09:53:45', '2017-02-14 18:43:26'),
(29, 1, 'Phone', 'Phone', 'Yes', 0, 'text', '', '+91 9988776666', 'SYSTEM_SETTINGS', '2015-11-24 09:54:11', '2017-02-14 18:43:26'),
(30, 1, 'Land Line', 'Land_Line', 'No', 0, 'text', '', '+91 40-44556666', 'SYSTEM_SETTINGS', '2015-11-24 09:54:31', '2017-02-14 18:43:26'),
(31, 1, 'Fax', 'Fax', 'No', 0, 'text', '', '1523', 'SYSTEM_SETTINGS', '2015-11-24 09:54:52', '2017-02-14 18:43:26'),
(32, 1, 'Portal Email', 'Portal_Email', 'Yes', 0, 'text', '', 'micheljohn930@gmail.com', 'SYSTEM_SETTINGS', '2015-11-24 09:55:30', '2017-02-14 18:43:26'),
(33, 1, 'Designed By', 'Designed_By', 'No', 0, 'text', NULL, 'Digital Vidhya', 'SYSTEM_SETTINGS', '2015-11-24 09:56:03', '2017-02-14 18:43:26'),
(35, 1, 'Logo', 'Logo', 'No', 0, 'file', '', 'setting_35.png', 'SYSTEM_SETTINGS', '2015-11-24 10:00:58', NULL),
(40, 13, 'Site Description', 'Site_Description', 'Yes', 0, '', '', 'Very useful site for all users', 'SEO_SETTINGS', '2015-11-24 10:16:41', '2016-11-23 14:43:20'),
(49, 13, 'Google Analytics', 'Google_Analytics', 'No', 0, 'text', '', 'Google Analytics', 'SEO_SETTINGS', '2015-11-24 10:37:12', '2016-11-23 14:43:20'),
(50, 23, 'Facebook', 'Facebook', 'Yes', 0, 'text', '', 'https://www.facebook.com', 'SOCIAL_SETTINGS', '2015-11-24 10:41:34', '2016-10-25 14:24:30'),
(51, 23, 'Twitter', 'Twitter', 'No', 0, 'text', '', 'https://twitter.com/', 'SOCIAL_SETTINGS', '2015-11-24 10:42:04', '2016-10-25 14:24:30'),
(52, 23, 'Linkedin', 'Linkedin', 'No', 0, 'text', '', 'https://www.linkedin.com/', 'SOCIAL_SETTINGS', '2015-11-24 10:42:38', '2016-10-25 14:24:30'),
(53, 23, 'Google+', 'Google', 'No', 0, 'text', '', 'https://www.google.co.in/?gfe_rd=cr&ei=FV8EWKenFOOK8Qf4kbmQCg&gws_rd=ssl', 'SOCIAL_SETTINGS', '2015-11-24 10:43:03', '2016-10-25 14:24:30'),
(54, 23, 'Instagram', 'Instagram', 'No', 0, 'text', '', 'https://www.instagram.com/?hl=en', 'SOCIAL_SETTINGS', '2015-11-24 10:43:37', '2016-10-25 14:24:30'),
(55, 23, 'Youtube', 'Youtube', 'No', 0, 'text', '', 'https://www.youtube.com/?hl=en-GB&gl=IN', 'SOCIAL_SETTINGS', '2015-11-24 10:44:16', '2016-10-25 14:24:30'),
(56, 24, 'Email Activation (Yes/No)', 'email_activation', 'Yes', 0, 'select', 'TRUE,FALSE', 'TRUE', 'REGISTRATION_SETTING', '2015-11-24 10:47:00', '2016-11-04 11:52:49'),
(57, 24, 'Track Login IP Address (Yes/No)', 'track_login_ip_address', 'Yes', 0, 'select', 'TRUE,FALSE', 'TRUE', 'REGISTRATION_SETTING', '2015-11-24 10:47:54', '2016-11-04 11:52:49'),
(58, 24, 'Max. Login Attempts', 'maximum_login_attempts', 'Yes', 0, 'text', '', '5', 'REGISTRATION_SETTING', '2015-11-24 10:48:22', '2016-11-04 11:52:49'),
(59, 24, 'Lockout Time (milliseconds)', 'lockout_time', 'Yes', 0, 'text', '', '200', 'REGISTRATION_SETTING', '2015-11-24 10:49:56', '2016-11-04 11:52:49'),
(60, 27, 'Live Merchant Key', 'Live_Merchant_Key', 'Yes', 0, 'text', '', 'Merchant Key', NULL, '2015-11-24 10:55:20', '2016-11-02 19:38:43'),
(61, 27, 'Live Salt', 'Live_Salt', 'Yes', 0, 'text', '', 'Salt', NULL, '2015-11-24 10:55:54', '2016-11-02 19:38:43'),
(62, 27, 'Live URL', 'Live_URL', 'No', 0, 'text', '', 'https://secure.payu.in/_payment', NULL, '2015-11-24 11:02:48', '2016-11-02 19:38:43'),
(63, 27, 'Sandbox Merchant Key', 'Sandbox_Merchant_Key', 'No', 0, 'text', '', 'fnlZps', NULL, '2015-11-24 11:04:04', '2016-11-02 19:38:43'),
(64, 27, 'Sandbox Salt', 'Sandbox_Salt', 'No', 0, 'text', '', 'dY3ExaGJ', NULL, '2015-11-24 11:04:35', '2016-11-02 19:38:43'),
(65, 27, 'Test URL', 'Test_URL', 'No', 0, 'text', '', 'https://test.payu.in/_payment', NULL, '2015-11-24 11:05:04', '2016-11-02 19:38:43'),
(66, 27, 'Account Type(LIve/Sandbox)', 'Account_TypeLIveSandbox', 'No', 0, 'select', 'Sandbox,Live', 'Sandbox', NULL, '2015-11-24 11:05:59', '2016-11-02 19:38:43'),
(67, 28, 'Paypal Email', 'Paypal_Email', 'No', 0, 'text', '', 'digionlineexam@gmail.com', 'PAYPAL_SETTINGS', '2015-11-24 11:07:34', '2016-11-02 19:44:58'),
(68, 28, 'Currency Code', 'Currency_Code', 'No', 0, 'text', '', 'USD', 'SYSTEM_SETTINGS', '2015-11-24 11:08:29', '2016-11-02 19:44:58'),
(69, 28, 'Account Type(Production/Sandbox)', 'Account_TypeProductionSandbox', 'No', 0, 'text', '', 'Sandbox', 'PAYPAL_SETTINGS', '2015-11-24 11:09:17', '2016-11-02 19:44:58'),
(70, 28, 'Header Logo', 'Header_Logo', 'No', 0, 'file', '', 'setting_70.jpg', 'PAYPAL_SETTINGS', '2015-11-24 11:10:22', NULL),
(71, 1, 'Country code', 'Country_code', 'Yes', 0, 'text', '', 'IN', 'SYSTEM_SETTINGS', '2015-11-26 17:36:03', '2017-02-14 18:43:26'),
(73, 1, 'Default Language', 'Default_Language', 'No', 0, 'select', 'english,spanish,bengali,french,japanese,hindi,russian', 'english', 'SYSTEM_SETTINGS', '2015-11-29 17:38:06', '2017-02-14 18:43:26'),
(75, 23, 'Sharethis Header', 'sharethis_header', 'No', 0, 'text', NULL, '<script type="text/javascript">var switchTo5x=true;</script><script type="text/javascript" src="http://w.sharethis.com/button/buttons.js"></script><script type="text/javascript">stLight.options({publisher: "65e5d610-c749-4c89-b1f3-44950db3ff9d", doNotHash: false, doNotCopy: false, hashAddressBar: false});</script>        ', 'SOCIAL_SETTINGS', '2016-01-18 22:28:20', '2016-10-25 14:24:30'),
(76, 23, 'Sharethis Links', 'sharethis_links', 'No', 0, 'text', NULL, '<span class=\'st_sharethis\' displayText=\'\'></span><span class=\'st_facebook\' displayText=\'\'></span><span class=\'st_twitter\' displayText=\'\'></span><span class=\'st_linkedin\' displayText=\'\'></span><span class=\'st_pinterest\' displayText=\'\'></span><span class=\'st_email\' displayText=\'\'></span>        ', 'SOCIAL_SETTINGS', '2016-01-18 22:28:20', '2016-10-25 14:24:30'),
(79, 29, 'API SECRET', 'API_SECRET', 'Yes', 0, 'text', '', '7d132b33', NULL, '2016-02-11 20:05:36', '2016-02-12 07:06:40'),
(80, 29, 'API KEY', 'API_KEY', 'Yes', 0, 'text', '', '8bbf4318', NULL, '2016-02-11 20:06:04', '2016-02-12 07:06:40'),
(81, 9, 'API SECRET', 'API_SECRET', 'Yes', 0, 'text', '', '7d132b33', NULL, '2016-02-11 20:10:25', NULL),
(82, 9, 'API KEY', 'API_KEY', 'Yes', 0, 'text', '', '8bbf4318', NULL, '2016-02-11 20:10:44', NULL),
(83, 30, 'Password', 'Password', 'Yes', 0, 'text', '', 'YPXNDbFMFbYKRB', NULL, '2016-02-11 20:30:23', '2016-10-27 11:59:56'),
(84, 30, 'User Name', 'User_Name', 'Yes', 0, 'text', '', 'conquerors', NULL, '2016-02-11 20:30:43', '2016-10-27 11:59:56'),
(85, 30, 'From No', 'From_No', 'Yes', 0, 'text', '', 'CodeIgniter', NULL, '2016-02-11 20:31:02', '2016-10-27 11:59:56'),
(86, 30, 'API Id', 'API_Id', 'Yes', 0, 'text', '', '3608283', NULL, '2016-02-11 20:31:23', '2016-10-27 11:59:56'),
(87, 31, 'API KEY', 'API_KEY', 'Yes', 0, 'text', '', '06261775', NULL, '2016-02-11 20:31:54', '2016-06-18 06:00:49'),
(88, 31, 'API SECRET', 'API_SECRET', 'Yes', 0, 'text', '', '2fb13425a2e546c0', NULL, '2016-02-11 20:32:14', '2016-06-18 06:00:49'),
(89, 32, 'AUTH ID', 'AUTH_ID', 'Yes', 0, 'text', '', 'MAZGIZYJI5MGE3N2JIMD', NULL, '2016-02-11 20:32:54', '2016-06-18 06:37:28'),
(90, 32, 'AUTH TOKEN', 'AUTH_TOKEN', 'Yes', 0, 'text', '', 'NmNmMzQ5ZTBiM2IxODRhMzc3OTllNjY0ZDM5ZGEx', NULL, '2016-02-11 20:33:11', '2016-06-18 06:37:28'),
(91, 32, 'API VERSION', 'API_VERSION', 'Yes', 0, 'text', '', 'v1', NULL, '2016-02-11 20:33:29', '2016-06-18 06:37:28'),
(92, 32, 'END POINT', 'END_POINT', 'Yes', 0, 'text', '', 'https://api.plivo.com', NULL, '2016-02-11 20:33:46', '2016-06-18 06:37:28'),
(93, 33, 'Key', 'Key', 'Yes', 0, 'text', '', 'A03b780b9662f5cc19f5541a6e3858478', NULL, '2016-02-11 20:34:14', '2016-02-29 14:14:19'),
(94, 33, 'Sender', 'Sender', 'Yes', 0, 'text', '', 'SIDEMO', NULL, '2016-02-11 20:34:35', '2016-02-29 14:14:19'),
(95, 33, 'API URL', 'API_URL', 'Yes', 0, 'text', '', 'http://alerts.solutionsinfini.com/', NULL, '2016-02-11 20:34:51', '2016-02-29 14:14:19'),
(96, 34, 'Account SID', 'Account_SID', 'Yes', 0, 'text', '', 'ACd36d992497f42532824a07ec3a9337fd', NULL, '2016-02-11 20:35:20', NULL),
(97, 34, 'Auth Token', 'Auth_Token', 'Yes', 0, 'text', '', 'afa33e8e1241f421278567db3a04ee30', NULL, '2016-02-11 20:35:44', NULL),
(98, 34, 'API Version', 'API_Version', 'Yes', 0, 'text', '', '2010-04-01', NULL, '2016-02-11 20:36:05', NULL),
(99, 34, 'Twilio Phone Number', 'Twilio_Phone_Number', 'Yes', 0, 'text', '', '+15005550006', NULL, '2016-02-11 20:36:25', NULL),
(100, 1, 'Site Slogan', 'Site_Slogan', 'No', 0, 'text', '', 'This is my Site Slogan ', NULL, '2016-03-01 21:11:29', '2017-02-14 18:43:26'),
(109, 35, 'myname', 'myname', 'Yes', 0, '', '', 'my wish', NULL, '2016-03-03 03:07:38', NULL),
(121, 27, 'Status', 'status', 'Yes', 0, 'select', 'Active,In-Active', 'Active', NULL, '2016-06-17 23:56:55', '2016-11-02 19:38:43'),
(123, 28, 'Account Type', 'Account_Type', 'Yes', 0, 'select', 'live,sandbox', 'sandbox', NULL, '2016-08-18 10:54:24', '2016-11-02 19:44:58'),
(124, 1, 'Androd App', 'Androd_App', 'No', 0, 'text', NULL, 'https://play.google.com/store?hl=en', 'Androd App', '2016-08-20 06:55:35', '2017-02-14 18:43:26'),
(125, 1, 'iOS App', 'iOS_App', 'No', 0, 'text', NULL, 'https://itunes.apple.com/in/genre/ios/id36?mt=8', 'iOS App', '2016-08-20 06:57:30', '2017-02-14 18:43:26'),
(126, 36, 'Host', 'Host', 'No', 0, 'text', '', 'server host', NULL, '2016-08-20 10:18:38', '2016-10-28 12:28:28'),
(127, 36, 'Port', 'Port', 'No', 0, 'text', '', 'smtp port', NULL, '2016-08-20 10:18:50', '2016-10-28 12:28:28'),
(128, 36, 'User Name', 'User Name', 'No', 0, 'text', '', 'smtp username', NULL, '2016-08-20 10:19:10', '2016-10-28 12:28:28'),
(129, 36, 'Password', 'Password', 'No', 0, 'text', '', 'smtp password', NULL, '2016-08-20 10:19:24', '2016-10-28 12:28:28'),
(130, 39, 'Mandril API Key', 'Mandril API Key', 'No', 0, 'text', NULL, NULL, NULL, '2016-08-20 10:19:46', NULL),
(131, 1, 'Show Team', 'Show_Team', 'No', 0, 'select', 'Yes,No', 'Yes', NULL, '2016-08-22 05:26:58', '2017-02-14 18:43:26'),
(132, 1, 'Need admin approval for tutor', 'need_admin_for_tutor', 'No', 0, 'select', 'Yes,No', 'No', NULL, '2016-08-22 11:29:30', '2017-02-14 18:43:26'),
(133, 1, 'Admin Commission For A Booking (In Percentage)', 'admin_commission_for_a_booking', 'No', 0, 'text', NULL, '10', 'SYSTEM_SETTINGS', '2016-08-31 10:42:16', '2017-02-14 18:43:26'),
(135, 1, 'Per Credit Value', 'per_credit_value', 'Yes', 0, 'text', NULL, '2', 'SYSTEM_SETTINGS', '2016-08-31 10:42:16', '2017-02-14 18:43:26'),
(137, 1, 'Minimum Credits for Premium Tutor', 'min_credits_for_premium_tutor', 'Yes', 0, 'text', NULL, '50', 'SYSTEM_SETTINGS', '2016-08-31 10:42:16', '2017-02-14 18:43:26'),
(138, 1, 'Minimum Credits for Premium Student', 'min_credits_for_premium_student', 'Yes', 0, 'text', NULL, '25', 'SYSTEM_SETTINGS', '2016-08-31 10:42:16', '2017-02-14 18:43:26'),
(139, 1, 'Credits for sending message', 'credits_for_sending_message', 'Yes', 0, 'text', NULL, '1', 'SYSTEM_SETTINGS', '2016-08-31 10:42:16', '2017-02-14 18:43:26'),
(140, 1, 'Currency Symbol', 'currency_symbol', 'Yes', 0, 'text', NULL, '$', 'SYSTEM_SETTINGS', '2016-08-31 10:42:16', '2017-02-14 18:43:26'),
(141, 1, 'Minimum Credits for Premium Institute', 'min_credits_for_premium_institute', 'Yes', 0, 'text', NULL, '100', 'SYSTEM_SETTINGS', '2016-08-31 10:42:16', '2017-02-14 18:43:26'),
(142, 1, 'Time Zone', 'time_zone', 'Yes', 0, 'select', 'Africa/Abidjan,Africa/Accra,Africa/Addis_Ababa,Africa/Algiers,Africa/Asmara,Africa/Asmera,Africa/Bamako,Africa/Bangui,Africa/Banjul,Africa/Bissau,Africa/Blantyre,Africa/Brazzaville,Africa/Bujumbura,Africa/Cairo,Africa/Casablanca,Africa/Ceuta,Africa/Conakry,Africa/Dakar,Africa/Dar_es_Salaam,Africa/Djibouti,Africa/Douala,Africa/El_Aaiun,Africa/Freetown,Africa/Gaborone,Africa/Harare,Africa/Johannesburg,Africa/Juba,Africa/Kampala,Africa/Khartoum,Africa/Kigali,Africa/Kinshasa,Africa/Lagos,Africa/Libreville,Africa/Lome,Africa/Luanda,Africa/Lubumbashi,Africa/Lusaka,Africa/Malabo,Africa/Maputo,Africa/Maseru,Africa/Mbabane,Africa/Mogadishu,Africa/Monrovia,Africa/Nairobi,Africa/Ndjamena,Africa/Niamey,Africa/Nouakchott,Africa/Ouagadougou,Africa/Porto-Novo,Africa/Sao_Tome,Africa/Timbuktu,Africa/Tripoli,Africa/Tunis,Africa/Windhoek,AKST9AKDT,America/Adak,America/Anchorage,America/Anguilla,America/Antigua,America/Araguaina,America/Argentina/Buenos_Aires,America/Argentina/Catamarca,America/Argentina/ComodRivadavia,America/Argentina/Cordoba,America/Argentina/Jujuy,America/Argentina/La_Rioja,America/Argentina/Mendoza,America/Argentina/Rio_Gallegos,America/Argentina/Salta,America/Argentina/San_Juan,America/Argentina/San_Luis,America/Argentina/Tucuman,America/Argentina/Ushuaia,America/Aruba,America/Asuncion,America/Atikokan,America/Atka,America/Bahia,America/Bahia_Banderas,America/Barbados,America/Belem,America/Belize,America/Blanc-Sablon,America/Boa_Vista,America/Bogota,America/Boise,America/Buenos_Aires,America/Cambridge_Bay,America/Campo_Grande,America/Cancun,America/Caracas,America/Catamarca,America/Cayenne,America/Cayman,America/Chicago,America/Chihuahua,America/Coral_Harbour,America/Cordoba,America/Costa_Rica,America/Creston,America/Cuiaba,America/Curacao,America/Danmarkshavn,America/Dawson,America/Dawson_Creek,America/Denver,America/Detroit,America/Dominica,America/Edmonton,America/Eirunepe,America/El_Salvador,America/Ensenada,America/Fortaleza,America/Fort_Wayne,America/Glace_Bay,America/Godthab,America/Goose_Bay,America/Grand_Turk,America/Grenada,America/Guadeloupe,America/Guatemala,America/Guayaquil,America/Guyana,America/Halifax,America/Havana,America/Hermosillo,America/Indiana/Indianapolis,America/Indiana/Knox,America/Indiana/Marengo,America/Indiana/Petersburg,America/Indiana/Tell_City,America/Indiana/Vevay,America/Indiana/Vincennes,America/Indiana/Winamac,America/Indianapolis,America/Inuvik,America/Iqaluit,America/Jamaica,America/Jujuy,America/Juneau,America/Kentucky/Louisville,America/Kentucky/Monticello,America/Knox_IN,America/Kralendijk,America/La_Paz,America/Lima,America/Los_Angeles,America/Louisville,America/Lower_Princes,America/Maceio,America/Managua,America/Manaus,America/Marigot,America/Martinique,America/Matamoros,America/Mazatlan,America/Mendoza,America/Menominee,America/Merida,America/Metlakatla,America/Mexico_City,America/Miquelon,America/Moncton,America/Monterrey,America/Montevideo,America/Montreal,America/Montserrat,America/Nassau,America/New_York,America/Nipigon,America/Nome,America/Noronha,America/North_Dakota/Beulah,America/North_Dakota/Center,America/North_Dakota/New_Salem,America/Ojinaga,America/Panama,America/Pangnirtung,America/Paramaribo,America/Phoenix,America/Port-au-Prince,America/Porto_Acre,America/Porto_Velho,America/Port_of_Spain,America/Puerto_Rico,America/Rainy_River,America/Rankin_Inlet,America/Recife,America/Regina,America/Resolute,America/Rio_Branco,America/Rosario,America/Santarem,America/Santa_Isabel,America/Santiago,America/Santo_Domingo,America/Sao_Paulo,America/Scoresbysund,America/Shiprock,America/Sitka,America/St_Barthelemy,America/St_Johns,America/St_Kitts,America/St_Lucia,America/St_Thomas,America/St_Vincent,America/Swift_Current,America/Tegucigalpa,America/Thule,America/Thunder_Bay,America/Tijuana,America/Toronto,America/Tortola,America/Vancouver,America/Virgin,America/Whitehorse,America/Winnipeg,America/Yakutat,America/Yellowknife,Antarctica/Casey,Antarctica/Davis,Antarctica/DumontDUrville,Antarctica/Macquarie,Antarctica/Mawson,Antarctica/McMurdo,Antarctica/Palmer,Antarctica/Rothera,Antarctica/South_Pole,Antarctica/Syowa,Antarctica/Vostok,Arctic/Longyearbyen,Asia/Aden,Asia/Almaty,Asia/Amman,Asia/Anadyr,Asia/Aqtau,Asia/Aqtobe,Asia/Ashgabat,Asia/Ashkhabad,Asia/Baghdad,Asia/Bahrain,Asia/Baku,Asia/Bangkok,Asia/Beirut,Asia/Bishkek,Asia/Brunei,Asia/Calcutta,Asia/Choibalsan,Asia/Chongqing,Asia/Chungking,Asia/Colombo,Asia/Dacca,Asia/Damascus,Asia/Dhaka,Asia/Dili,Asia/Dubai,Asia/Dushanbe,Asia/Gaza,Asia/Harbin,Asia/Hebron,Asia/Hong_Kong,Asia/Hovd,Asia/Ho_Chi_Minh,Asia/Irkutsk,Asia/Istanbul,Asia/Jakarta,Asia/Jayapura,Asia/Jerusalem,Asia/Kabul,Asia/Kamchatka,Asia/Karachi,Asia/Kashgar,Asia/Kathmandu,Asia/Katmandu,Asia/Kolkata,Asia/Krasnoyarsk,Asia/Kuala_Lumpur,Asia/Kuching,Asia/Kuwait,Asia/Macao,Asia/Macau,Asia/Magadan,Asia/Makassar,Asia/Manila,Asia/Muscat,Asia/Nicosia,Asia/Novokuznetsk,Asia/Novosibirsk,Asia/Omsk,Asia/Oral,Asia/Phnom_Penh,Asia/Pontianak,Asia/Pyongyang,Asia/Qatar,Asia/Qyzylorda,Asia/Rangoon,Asia/Riyadh,Asia/Saigon,Asia/Sakhalin,Asia/Samarkand,Asia/Seoul,Asia/Shanghai,Asia/Singapore,Asia/Taipei,Asia/Tashkent,Asia/Tbilisi,Asia/Tehran,Asia/Tel_Aviv,Asia/Thimbu,Asia/Thimphu,Asia/Tokyo,Asia/Ujung_Pandang,Asia/Ulaanbaatar,Asia/Ulan_Bator,Asia/Urumqi,Asia/Vientiane,Asia/Vladivostok,Asia/Yakutsk,Asia/Yekaterinburg,Asia/Yerevan,Atlantic/Azores,Atlantic/Bermuda,Atlantic/Canary,Atlantic/Cape_Verde,Atlantic/Faeroe,Atlantic/Faroe,Atlantic/Jan_Mayen,Atlantic/Madeira,Atlantic/Reykjavik,Atlantic/South_Georgia,Atlantic/Stanley,Atlantic/St_Helena,Australia/ACT,Australia/Adelaide,Australia/Brisbane,Australia/Broken_Hill,Australia/Canberra,Australia/Currie,Australia/Darwin,Australia/Eucla,Australia/Hobart,Australia/LHI,Australia/Lindeman,Australia/Lord_Howe,Australia/Melbourne,Australia/North,Australia/NSW,Australia/Perth,Australia/Queensland,Australia/South,Australia/Sydney,Australia/Tasmania,Australia/Victoria,Australia/West,Australia/Yancowinna,Brazil/Acre,Brazil/DeNoronha,Brazil/East,Brazil/West,Canada/Atlantic,Canada/Central,Canada/East-Saskatchewan,Canada/Eastern,Canada/Mountain,Canada/Newfoundland,Canada/Pacific,Canada/Saskatchewan,Canada/Yukon,CET,Chile/Continental,Chile/EasterIsland,CST6CDT,Cuba,EET,Egypt,Eire,EST,EST5EDT,Etc./GMT,Etc./GMT+0,Etc./UCT,Etc./Universal,Etc./UTC,Etc./Zulu,Europe/Amsterdam,Europe/Andorra,Europe/Athens,Europe/Belfast,Europe/Belgrade,Europe/Berlin,Europe/Bratislava,Europe/Brussels,Europe/Bucharest,Europe/Budapest,Europe/Chisinau,Europe/Copenhagen,Europe/Dublin,Europe/Gibraltar,Europe/Guernsey,Europe/Helsinki,Europe/Isle_of_Man,Europe/Istanbul,Europe/Jersey,Europe/Kaliningrad,Europe/Kiev,Europe/Lisbon,Europe/Ljubljana,Europe/London,Europe/Luxembourg,Europe/Madrid,Europe/Malta,Europe/Mariehamn,Europe/Minsk,Europe/Monaco,Europe/Moscow,Europe/Nicosia,Europe/Oslo,Europe/Paris,Europe/Podgorica,Europe/Prague,Europe/Riga,Europe/Rome,Europe/Samara,Europe/San_Marino,Europe/Sarajevo,Europe/Simferopol,Europe/Skopje,Europe/Sofia,Europe/Stockholm,Europe/Tallinn,Europe/Tirane,Europe/Tiraspol,Europe/Uzhgorod,Europe/Vaduz,Europe/Vatican,Europe/Vienna,Europe/Vilnius,Europe/Volgograd,Europe/Warsaw,Europe/Zagreb,Europe/Zaporozhye,Europe/Zurich,GB,GB-Eire,GMT,GMT+0,GMT-0,GMT0,Greenwich,Hong Kong,HST,Iceland,Indian/Antananarivo,Indian/Chagos,Indian/Christmas,Indian/Cocos,Indian/Comoro,Indian/Kerguelen,Indian/Mahe,Indian/Maldives,Indian/Mauritius,Indian/Mayotte,Indian/Reunion,Iran,Israel,Jamaica,Japan,JST-9,Kwajalein,Libya,MET,Mexico/BajaNorte,Mexico/BajaSur,Mexico/General,MST,MST7MDT,Navajo,NZ,NZ-CHAT,Pacific/Apia,Pacific/Auckland,Pacific/Chatham,Pacific/Chuuk,Pacific/Easter,Pacific/Efate,Pacific/Enderbury,Pacific/Fakaofo,Pacific/Fiji,Pacific/Funafuti,Pacific/Galapagos,Pacific/Gambier,Pacific/Guadalcanal,Pacific/Guam,Pacific/Honolulu,Pacific/Johnston,Pacific/Kiritimati,Pacific/Kosrae,Pacific/Kwajalein,Pacific/Majuro,Pacific/Marquesas,Pacific/Midway,Pacific/Nauru,Pacific/Niue,Pacific/Norfolk,Pacific/Noumea,Pacific/Pago_Pago,Pacific/Palau,Pacific/Pitcairn,Pacific/Pohnpei,Pacific/Ponape,Pacific/Port_Moresby,Pacific/Rarotonga,Pacific/Saipan,Pacific/Samoa,Pacific/Tahiti,Pacific/Tarawa,Pacific/Tongatapu,Pacific/Truk,Pacific/Wake,Pacific/Wallis,Pacific/Yap,Poland,Portugal,PRC,PST8PDT,ROC,ROK,Singapore,Turkey,UCT,Universal,US/Alaska,US/Aleutian,US/Arizona,US/Central,US/East-Indiana,US/Eastern,US/Hawaii,US/Indiana-Starke,US/Michigan,US/Mountain,US/Pacific,US/Pacific-New,US/Samoa,UTC,W-SU,WET,Zulu', 'Asia/Kolkata', 'SYSTEM_SETTINGS', '2015-11-26 17:36:03', '2017-02-14 18:43:26'),
(143, 1, 'Credits for viewing lead details', 'credits_for_viewing_lead', 'Yes', 0, 'text', NULL, '5', 'SYSTEM_SETTINGS', '2016-08-31 10:42:16', '2017-02-14 18:43:26'),
(144, 1, 'Need admin approval for institute', 'need_admin_for_inst', 'No', 0, 'select', 'Yes,No', 'No', NULL, '2016-08-22 11:29:30', '2017-02-14 18:43:26'),
(145, 41, 'Secret Key', 'secret_key', 'Yes', 0, 'text', '<p>\r\n	<span style="color: rgb(0, 0, 0); font-family: monospace; font-size: 13px;">sk_test_FHxf1NsgaWbAFAGny5zJELqU</span></p>\r\n', '<p>\r\n	<span style="color: rgb(0, 0, 0); font-family: monospace; font-size: 13px;">sk_test_FHxf1NsgaWbAFAGny5zJELqU</span></p>\r\n', 'Secret Key', '2016-10-05 13:32:00', '2017-01-17 10:48:38'),
(147, 40, 'General Inquiries', 'General_Inquiries', 'Yes', 0, 'text', NULL, '<p>	<span style="color: rgb(83, 64, 81); font-family: Lato, sans-serif; font-size: 15px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: normal; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253); display: inline !important; float: none;">contact@tutors-listings.org</span></p>', 'CONTACT_SETTINGS', '2016-10-07 16:05:52', '2016-10-19 16:53:24'),
(148, 40, 'Media Requests', 'Media_Requests', NULL, 0, NULL, NULL, '<p>	<span style="color: rgb(83, 64, 81); font-family: Lato, sans-serif; font-size: 15px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: normal; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253); display: inline !important; float: none;">support@tutors-listings.org</span></p>', 'CONTACT_SETTINGS', '2016-10-07 16:05:52', '2016-10-19 16:53:24'),
(149, 40, 'Offline Support', 'Offline_Support', NULL, 0, NULL, NULL, '<p>	<span style="color: rgb(83, 64, 81); font-family: Lato, sans-serif; font-size: 15px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: normal; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253); display: inline !important; float: none;">offline@tutors-listings.org</span></p>', 'CONTACT_SETTINGS', '2016-10-07 16:05:52', '2016-10-19 16:53:24'),
(150, 1, 'Enable Initiate Session Option Before Minutes', 'enable_initiate_session_option_before_mins', 'Yes', 0, 'text', NULL, '30', NULL, '2016-10-18 10:10:19', '2017-02-14 18:43:26'),
(151, 1, 'Enable Course Completed Option Before Minutes', 'enable_course_completed_option_before_mins', 'Yes', 0, 'text', NULL, '15', NULL, '2016-10-18 10:37:32', '2017-02-14 18:43:26'),
(152, 1, 'Favicon', 'favicon', 'No', 0, 'file', NULL, 'setting_152.png', ' SYSTEM_SETTINGS', '2016-10-21 10:18:58', NULL),
(153, 1, 'URL For Designed By', 'url_designed_by', 'No', 0, 'text', NULL, 'http://www.digitalvidhya.com/', 'SYSTEM_SETTINGS', '2015-11-24 09:56:03', '2017-02-14 18:43:26'),
(154, 1, 'Show Available Records Count in Search Filters', 'show_records_count_in_search_filters', 'Yes', 0, 'select', 'Yes,No', 'Yes', ' SYSTEM_SETTINGS', '2016-11-22 14:58:41', '2017-02-14 18:43:26'),
(155, 1, 'Advantages Section', 'advantages_section', 'Yes', 0, 'select', 'On,Off', 'On', ' SYSTEM_SETTINGS', '2016-11-22 18:53:43', '2017-02-14 18:43:26'),
(156, 1, 'Featured on Section', 'featured_on_section', 'Yes', 0, 'select', 'On,Off', 'On', ' SYSTEM_SETTINGS', '2016-11-22 18:53:43', '2017-02-14 18:43:26'),
(157, 1, 'Are You A Teacher Section', 'are_you_teacher_section', 'Yes', 0, 'select', 'On,Off', 'On', ' SYSTEM_SETTINGS', '2016-11-22 18:53:43', '2017-02-14 18:43:26'),
(158, 1, 'Footer Section', 'footer_section', 'Yes', 0, 'select', 'On,Off', 'On', ' SYSTEM_SETTINGS', '2016-11-22 18:53:43', '2017-02-14 18:43:27'),
(159, 1, 'Get Our App Section', 'get_app_section', 'Yes', 0, 'select', 'On,Off', 'On', ' SYSTEM_SETTINGS', '2016-11-22 18:53:43', '2017-02-14 18:43:27'),
(160, 1, 'Primary Footer Section', 'primary_footer_section', 'Yes', 0, 'select', 'On,Off', 'On', ' SYSTEM_SETTINGS', '2016-11-22 18:53:43', '2017-02-14 18:43:27'),
(161, 1, 'Bottom Section', 'bottom_section', 'Yes', 0, 'select', '<p>\r\n	On,Off</p>\r\n', '<p>\r\n	On', ' SYSTEM_SETTINGS', '2016-11-22 18:53:43', '2017-02-14 18:43:27'),
(162, 1, 'Top Most Section', 'top_most_section', 'Yes', 0, 'select', 'On,Off', 'On', ' SYSTEM_SETTINGS', '2016-11-22 18:53:43', '2017-02-14 18:43:27'),
(163, 41, 'Test Secret Key', 'stripe_key_test_secret', 'Yes', 2, 'text', 'sk_test_FHxf1NsgaWbAFAGny5zJELqU', 'sk_test_FHxf1NsgaWbAFAGny5zJELqU', 'Publishable Key', '2017-01-17 05:16:57', NULL),
(164, 41, 'Mode', 'stripe_test_mode', 'Yes', 3, 'select', '<p>yes,no</p>\r\n', '<p>yes</p>\r\n', 'Mode', '2017-01-17 05:26:32', NULL),
(165, 41, 'Test Publishable Key:', 'stripe_key_test_publishable', 'Yes', 0, 'text', 'pk_test_H8R3tFH4RiyF0VGzTcXwl8NF', 'pk_test_H8R3tFH4RiyF0VGzTcXwl8NF', NULL, '2017-01-17 13:17:30', NULL),
(166, 41, 'Live Secret Key:', 'stripe_key_live_secret', 'Yes', 0, 'text', 'sk_live_hoU7qpgZtg0gwTxu2My7KAcZ', 'sk_live_hoU7qpgZtg0gwTxu2My7KAcZ', NULL, '2017-01-17 13:18:20', NULL),
(167, 41, 'Live Publishable Key:', 'stripe_key_live_publishable', 'Yes', 0, 'text', 'pk_live_wPo6I0iKgXrs9mrk08cfwzc4', 'pk_live_wPo6I0iKgXrs9mrk08cfwzc4', NULL, '2017-01-17 13:19:27', NULL),
(168, 47, 'Instructions', 'manual_instructions', 'No', 0, 'text', 'Acc NO. - 50100043054861\r\nName : ADIYYA TADIKAMALLA\r\nBank : HDFC\r\nBranch - BEGUMPET\r\nIFSC : HDFC0000621\r\n\r\nSend your details after made a transaction.', 'Acc NO. - 50100043054861\r\nName : ADIYYA TADIKAMALLA\r\nBank : HDFC\r\nBranch - BEGUMPET\r\nIFSC : HDFC0000621\r\n\r\nSend your details after made a transaction.', NULL, '2017-01-18 08:17:09', NULL),
(169, 48, 'Seller Id', '2check_seller_id', 'Yes', 0, 'text', '901337661', '901337661', NULL, '2017-01-18 09:07:43', NULL),
(170, 48, 'Secret Word', '2check_secret_word', 'Yes', 0, 'text', 'ZDg3MzVkZTAtYzIzZi00ZGNhLTg2MzctYWU0MDJhYzVmZjQ4', 'ZDg3MzVkZTAtYzIzZi00ZGNhLTg2MzctYWU0MDJhYzVmZjQ4', NULL, '2017-01-18 09:08:45', NULL),
(171, 48, 'Is Demo', '2check_is_demo', 'Yes', 0, 'select', 'yes,no', 'yes', NULL, '2017-01-18 09:09:00', NULL),
(172, 42, 'ID Sprzedawcy', 'transferuj_merchantid', 'Yes', 0, 'text', '1010', '1010', NULL, '2017-01-19 05:11:32', NULL),
(173, 42, 'Secrete Key', 'transferuj_secretpass', 'Yes', 0, 'text', 'demo', 'demo', NULL, '2017-01-19 05:22:19', NULL),
(174, 43, 'PagSeguro Sandbox Email', 'pagseguro_sandbox_email', 'No', 0, 'text', 'adiyya@gmail.com', 'adiyya@gmail.com', NULL, '2017-01-19 12:51:43', NULL),
(175, 43, 'PagSeguro Sandbox Token', 'pagseguro_sandbox_token', 'No', 0, 'text', '2E3BDB1A45D745C5AB3B54EC45093A95', '2E3BDB1A45D745C5AB3B54EC45093A95', NULL, '2017-01-19 12:52:37', NULL),
(176, 43, 'PagSeguro Email', 'pagseguro_email', 'Yes', 0, 'text', 'adiyya@gmail.com', 'adiyya@gmail.com', NULL, '2017-01-19 12:53:01', NULL),
(177, 43, 'PagSeguro Token', 'pagseguro_token', 'Yes', 0, 'text', '2E3BDB1A45D745C5AB3B54EC45093A95', '2E3BDB1A45D745C5AB3B54EC45093A95', NULL, '2017-01-19 12:53:58', NULL),
(178, 43, 'PagSeguro Mode', 'pagseguro_mode', 'Yes', 0, 'select', 'sandbox,live', 'sandbox', NULL, '2017-01-19 13:54:43', NULL),
(179, 44, 'Online/Offline gateway', 'is_test', 'Yes', 0, 'select', 'yes,no', 'yes', NULL, '2017-01-20 05:49:49', '2017-01-27 11:42:32'),
(180, 44, 'Purse WMZ', 'purse_wmz', 'Yes', 0, 'text', 'Z', 'Z', NULL, '2017-01-20 05:50:49', '2017-01-27 11:42:32'),
(181, 44, 'Secret key for WMZ', 'purse_wmz_secret', 'Yes', 0, 'text', NULL, 'Z145179295679', NULL, '2017-01-20 05:51:17', '2017-01-27 11:42:32'),
(182, 44, 'Purse WME', 'purse_wme', 'Yes', 0, 'text', NULL, 'E', NULL, '2017-01-20 05:51:48', '2017-01-27 11:42:32'),
(183, 44, 'Secret key for WME', 'purse_wme_secret', 'Yes', 0, 'text', NULL, 'test', NULL, '2017-01-20 05:52:42', '2017-01-27 11:42:32'),
(184, 44, 'Purse WMR', 'purse_wmr', 'Yes', 0, 'text', NULL, 'R', NULL, '2017-01-20 05:53:26', '2017-01-27 11:42:32'),
(185, 44, 'Secret key for WMR', 'purse_wmr_secret', 'Yes', 0, 'text', NULL, 'R397656178472', NULL, '2017-01-20 05:53:51', '2017-01-27 11:42:32'),
(186, 44, 'Purse WMU', 'purse_wmu', 'Yes', 0, 'text', NULL, 'U', NULL, '2017-01-20 05:54:20', '2017-01-27 11:42:32'),
(187, 44, 'Secret key for WMU', 'purse_wmu_secret', 'Yes', 0, 'text', NULL, 'test', NULL, '2017-01-20 05:54:42', '2017-01-27 11:42:32'),
(188, 45, 'Shop ID', 'ym_ShopID', 'Yes', 0, 'text', '151', '151', NULL, '2017-01-30 06:59:51', NULL),
(189, 45, 'Number Store Front', 'ym_Scid', 'Yes', 0, 'text', '363', '363', NULL, '2017-01-30 07:01:14', NULL),
(190, 45, 'Payment Types', 'ym_payment_types', 'Yes', 0, 'checkbox', 'Yandex Purse, Credit Card,Cash desk and terminals', 'Yandex Purse, Credit Card,Cash desk and terminals', NULL, '2017-01-30 07:26:20', NULL),
(191, 45, 'Mode', 'ym_mode', 'Yes', 0, 'select', 'sandbox,live', 'sandbox', NULL, '2017-01-30 10:12:32', NULL),
(192, 46, 'Merchant ID', 'payza_email', 'Yes', 0, 'text', NULL, 'adiyya@gmail.com', NULL, '2017-01-30 11:54:01', NULL),
(193, 46, 'Mode', 'payza_mode', 'Yes', 0, 'select', 'sandbox,live', 'sandbox', NULL, '2017-01-30 12:19:08', NULL),
(194, 49, 'Key ID', 'razorpay_key_id', 'Yes', 0, 'text', NULL, 'rzp_test_tjwMzd8bqhZkMr', NULL, '2017-01-30 12:19:26', NULL),
(195, 49, 'Key Secret', 'razorpay_key_secret', 'Yes', 0, 'text', NULL, 'EWI9VQiMH43p6LDCbpsgvvHZ', NULL, '2017-01-31 04:58:16', NULL),
(196, 49, 'Payment Action', 'razorpay_payment_action', 'Yes', 0, 'select', 'authorize,capture', 'capture', NULL, '2017-01-31 04:58:58', NULL),
(197, 49, 'Mode', 'razorpay_mode', 'Yes', 0, 'select', 'sandbox,live', 'sandbox', NULL, '2017-01-31 05:00:35', NULL),
(198, 1, 'Admin Commission Percentage On Each Purchase', 'admin_commission_on_course_purchase', 'Yes', 0, 'text', NULL, '10', 'SYSTEM_SETTINGS', '2016-08-31 10:42:16', '2017-02-14 18:43:27'),
(199, 50, 'Bigbluebutton Security Salt', 'bbb_security_salt', 'Yes', 0, 'text', NULL, '8cd8ef52e8e101574e400365b55e11a6', 'bigbluebutton', '2016-08-31 10:42:16', '2017-02-14 18:43:27'),
(200, 50, 'Bigbluebutton Server URL', 'bbb_base_server_url', 'Yes', 0, 'text', NULL, 'http://test-install.blindsidenetworks.com/bigbluebutton/', 'bigbluebutton', '2016-08-31 10:42:16', '2017-02-14 18:43:27'),
(201, 50, 'Enable Live Classes', 'bbb_enable', 'Yes', 0, 'select', 'yes,no', 'yes', 'bigbluebutton', '2016-08-31 10:42:16', '2017-02-14 18:43:27');

-- --------------------------------------------------------

--
-- Table structure for table `pre_system_settings_types`
--

CREATE TABLE `pre_system_settings_types` (
  `type_id` int(11) NOT NULL,
  `type_title` varchar(512) CHARACTER SET latin1 DEFAULT NULL,
  `parent_id` int(11) DEFAULT '0',
  `type_slug` varchar(50) NOT NULL,
  `created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` datetime DEFAULT NULL,
  `is_default` enum('Yes','No') NOT NULL DEFAULT 'No',
  `status` enum('Active','In-Active') NOT NULL DEFAULT 'Active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pre_system_settings_types`
--

INSERT INTO `pre_system_settings_types` (`type_id`, `type_title`, `parent_id`, `type_slug`, `created`, `updated`, `is_default`, `status`) VALUES
(1, 'System Settings', 0, 'SYSTEM_SETTINGS', '2015-11-08 21:45:41', NULL, 'Yes', 'Active'),
(9, 'SMS Settings', 0, 'SMS_SETTINGS', '2015-11-09 14:46:57', NULL, 'No', 'Active'),
(13, 'Global SEO Settings', 0, 'SEO_SETTINGS', '2015-11-09 14:48:24', NULL, 'No', 'Active'),
(14, 'Email Settings', 0, 'EMAIL_SETTINGS', '2015-11-09 14:48:33', NULL, 'No', 'Active'),
(23, 'Social Network Settings', 0, 'SOCIAL_SETTINGS', '2015-11-24 16:11:00', NULL, 'No', 'Active'),
(24, 'Registration Settings', 0, 'REGISTRATION_SETTINGS', '2015-11-24 16:15:24', NULL, 'No', 'Active'),
(27, 'Payu', 35, 'PAYU_SETTINGS', '2015-11-24 16:24:00', '2016-10-28 18:55:08', 'Yes', 'Active'),
(28, 'Paypal', 35, 'PAYPAL_SETTINGS', '2015-11-24 16:36:50', '2016-10-28 18:54:28', 'No', 'Active'),
(30, 'Cliakatell', 9, 'Cliakatell slug', '2016-02-11 20:24:18', '2016-10-27 12:00:05', 'No', 'Active'),
(31, 'Nexmo', 9, '', '2016-02-11 20:24:29', NULL, 'No', 'Active'),
(32, 'Plivo', 9, '', '2016-02-11 20:24:38', NULL, 'Yes', 'Active'),
(33, 'Solutionsinfini', 9, '', '2016-02-11 20:24:47', NULL, 'No', 'Active'),
(34, 'Twilio', 9, '', '2016-02-11 20:24:58', NULL, 'No', 'Active'),
(35, 'Payment Settings', 0, 'PAYMENT_SETTINGS', '2016-08-17 07:14:01', NULL, 'No', 'Active'),
(36, 'Webmail', 14, '', '2016-08-20 09:21:43', NULL, 'No', 'Active'),
(37, 'Default CI', 14, '', '2016-08-20 09:44:05', NULL, 'No', 'Active'),
(38, 'default PHP', 14, '', '2016-08-20 09:44:23', NULL, 'Yes', 'Active'),
(39, 'Mandril', 14, '', '2016-08-20 09:44:44', NULL, 'No', 'Active'),
(40, 'Contact Details Settings', 0, 'CONTACT_SETTINGS', '2015-11-24 16:11:00', NULL, 'No', 'Active'),
(41, 'Stripe', 35, 'Stripe', '2017-01-17 05:03:37', NULL, 'No', 'Active'),
(42, 'tpay.com', 35, 'tpay.com', '2017-01-17 05:06:04', NULL, 'No', 'Active'),
(43, 'PagSeguro', 35, 'PagSeguro', '2017-01-17 05:08:28', NULL, 'No', 'Active'),
(44, 'Web money', 35, 'Web money', '2017-01-17 05:08:38', NULL, 'No', 'Active'),
(45, 'Yandex', 35, 'Yandex', '2017-01-17 05:08:59', NULL, 'No', 'Active'),
(46, 'Payza', 35, 'Payza', '2017-01-17 05:09:09', NULL, 'No', 'Active'),
(47, 'Manual Transfer', 35, 'Manual Transfer', '2017-01-17 05:19:54', NULL, 'No', 'Active'),
(48, '2Checkout', 35, '2Checkout', '2017-01-18 09:05:33', NULL, 'No', 'Active'),
(49, 'Razorpay', 35, 'Razorpay', '2017-01-31 04:27:04', NULL, 'No', 'Active'),
(50, 'Bigbluebutton', 0, 'bigbluebutton', '2017-02-03 13:19:13', NULL, 'No', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `pre_teaching_types`
--

CREATE TABLE `pre_teaching_types` (
  `id` int(11) NOT NULL,
  `teaching_type` varchar(128) CHARACTER SET utf8 NOT NULL,
  `description` varchar(512) CHARACTER SET utf8 NOT NULL,
  `slug` varchar(512) CHARACTER SET utf8 NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `sort_order` int(11) NOT NULL DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pre_teaching_types`
--

INSERT INTO `pre_teaching_types` (`id`, `teaching_type`, `description`, `slug`, `status`, `sort_order`, `created_at`, `updated_at`) VALUES
(1, 'Home', 'Your Home', 'home', 1, 1, '2016-08-09 17:16:22', '2016-08-09 17:16:22'),
(2, 'Willing to Travel', 'Willing to Travel', 'willing-to-travel', 1, 2, '2016-08-09 17:17:22', '2016-08-09 17:17:22'),
(3, 'Online', 'Online Teaching', 'online', 1, 3, '2016-08-09 17:18:22', '2016-08-09 17:18:22'),
(4, 'Online BBB', 'Online Bigbluebutton', 'online-bbb', 1, 4, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `pre_team`
--

CREATE TABLE `pre_team` (
  `id` int(11) NOT NULL,
  `name` varchar(256) DEFAULT NULL,
  `position` varbinary(256) DEFAULT NULL,
  `description` text,
  `image` varchar(256) DEFAULT NULL,
  `status` enum('Active','In-Active') DEFAULT 'Active',
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pre_team`
--

INSERT INTO `pre_team` (`id`, `name`, `position`, `description`, `image`, `status`, `created`, `updated`) VALUES
(1, 'Kadelyn', 0x43454f, '<p>\r\n	Good</p>\r\n', '262fb-85.jpg', 'Active', '2016-11-10 17:05:08', '2016-11-22 10:23:27'),
(2, 'Sofiana', 0x4d44, '<p>\r\n	Good</p>\r\n', '1eca7-39.jpg', 'Active', '2016-11-10 17:06:06', '2016-11-22 10:24:16'),
(3, 'Eshana', 0x4d616e61676572, '<p>\r\n	Good</p>\r\n', '0e83d-45.jpg', 'Active', '2016-11-10 17:06:40', '2016-11-22 10:24:42');

-- --------------------------------------------------------

--
-- Table structure for table `pre_terms_data`
--

CREATE TABLE `pre_terms_data` (
  `term_id` bigint(11) NOT NULL,
  `parent_id` bigint(11) DEFAULT '0',
  `term_title` varchar(512) CHARACTER SET latin1 NOT NULL,
  `term_content` longtext,
  `term_slug` varchar(512) CHARACTER SET latin1 DEFAULT NULL,
  `term_image` varchar(256) CHARACTER SET latin1 DEFAULT NULL,
  `term_status` enum('Active','In-Active') CHARACTER SET latin1 DEFAULT 'Active',
  `term_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `term_updated` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `term_type` varchar(50) CHARACTER SET latin1 DEFAULT NULL COMMENT 'This may be ''Categories'',''Departments'',''Specialities'' etc'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pre_terms_data`
--

INSERT INTO `pre_terms_data` (`term_id`, `parent_id`, `term_title`, `term_content`, `term_slug`, `term_image`, `term_status`, `term_created`, `term_updated`, `term_type`) VALUES
(1, 0, 'B.Tech', '<p>\r\n	<style type="text/css">\r\n<!--td {border: 1px solid #ccc;}br {mso-data-placement:same-cell;}-->	</style>\r\n	<span data-sheets-userformat="{&quot;2&quot;:1063489,&quot;3&quot;:{&quot;1&quot;:0},&quot;9&quot;:0,&quot;12&quot;:0,&quot;14&quot;:{&quot;1&quot;:2,&quot;2&quot;:4342338},&quot;15&quot;:&quot;Arial&quot;,&quot;16&quot;:10,&quot;23&quot;:2}" data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;B.Tech&quot;}" style="font-size:100%;font-family:Arial;color:#424242;text-align:left;">B.Tech</span></p>\r\n', 'b.tech', NULL, 'Active', '2016-11-08 04:03:10', '0000-00-00 00:00:00', 'degree'),
(2, 0, 'B.Ed', '<p>\r\n	<style type="text/css">\r\n<!--td {border: 1px solid #ccc;}br {mso-data-placement:same-cell;}-->	</style>\r\n	<span data-sheets-userformat="{&quot;2&quot;:1063489,&quot;3&quot;:{&quot;1&quot;:0},&quot;9&quot;:0,&quot;12&quot;:0,&quot;14&quot;:{&quot;1&quot;:2,&quot;2&quot;:4342338},&quot;15&quot;:&quot;Arial&quot;,&quot;16&quot;:10,&quot;23&quot;:2}" data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;B.Ed&quot;}" style="font-size:100%;font-family:Arial;color:#424242;text-align:left;">B.Ed</span></p>\r\n', 'b.ed', NULL, 'Active', '2016-11-08 04:03:24', '0000-00-00 00:00:00', 'degree'),
(3, 0, 'M.Tech ', '<p>\r\n	<style type="text/css">\r\n<!--td {border: 1px solid #ccc;}br {mso-data-placement:same-cell;}-->	</style>\r\n	<span data-sheets-userformat="{&quot;2&quot;:1063489,&quot;3&quot;:{&quot;1&quot;:0},&quot;9&quot;:0,&quot;12&quot;:0,&quot;14&quot;:{&quot;1&quot;:2,&quot;2&quot;:4342338},&quot;15&quot;:&quot;Arial&quot;,&quot;16&quot;:10,&quot;23&quot;:2}" data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;M.Tech &quot;}" style="font-size:100%;font-family:Arial;color:#424242;text-align:left;">M.Tech </span></p>\r\n', 'm.tech', NULL, 'Active', '2016-11-08 04:03:36', '0000-00-00 00:00:00', 'degree'),
(4, 0, 'BBA', '<p>\r\n	<style type="text/css">\r\n<!--td {border: 1px solid #ccc;}br {mso-data-placement:same-cell;}-->	</style>\r\n	<span data-sheets-userformat="{&quot;2&quot;:1063489,&quot;3&quot;:{&quot;1&quot;:0},&quot;9&quot;:0,&quot;12&quot;:0,&quot;14&quot;:{&quot;1&quot;:2,&quot;2&quot;:4342338},&quot;15&quot;:&quot;Arial&quot;,&quot;16&quot;:10,&quot;23&quot;:2}" data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;BBA&quot;}" style="font-size:100%;font-family:Arial;color:#424242;text-align:left;">BBA</span></p>\r\n', 'bba', NULL, 'Active', '2016-11-08 04:03:46', '0000-00-00 00:00:00', 'degree'),
(5, 0, 'BCA', '<p>\r\n	<style type="text/css">\r\n<!--td {border: 1px solid #ccc;}br {mso-data-placement:same-cell;}-->	</style>\r\n	<span data-sheets-userformat="{&quot;2&quot;:1063489,&quot;3&quot;:{&quot;1&quot;:0},&quot;9&quot;:0,&quot;12&quot;:0,&quot;14&quot;:{&quot;1&quot;:2,&quot;2&quot;:4342338},&quot;15&quot;:&quot;Arial&quot;,&quot;16&quot;:10,&quot;23&quot;:2}" data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;BCA&quot;}" style="font-size:100%;font-family:Arial;color:#424242;text-align:left;">BCA</span></p>\r\n', 'bca', NULL, 'Active', '2016-11-08 04:03:54', '0000-00-00 00:00:00', 'degree'),
(6, 0, 'MBA', '<p>\r\n	<style type="text/css">\r\n<!--td {border: 1px solid #ccc;}br {mso-data-placement:same-cell;}-->	</style>\r\n	<span data-sheets-userformat="{&quot;2&quot;:1063489,&quot;3&quot;:{&quot;1&quot;:0},&quot;9&quot;:0,&quot;12&quot;:0,&quot;14&quot;:{&quot;1&quot;:2,&quot;2&quot;:4342338},&quot;15&quot;:&quot;Arial&quot;,&quot;16&quot;:10,&quot;23&quot;:2}" data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;MBA&quot;}" style="font-size:100%;font-family:Arial;color:#424242;text-align:left;">MBA</span></p>\r\n', 'mba', NULL, 'Active', '2016-11-08 04:04:02', '0000-00-00 00:00:00', 'degree'),
(7, 0, 'MCA', '<p>\r\n	<style type="text/css">\r\n<!--td {border: 1px solid #ccc;}br {mso-data-placement:same-cell;}-->	</style>\r\n	<span data-sheets-userformat="{&quot;2&quot;:1063489,&quot;3&quot;:{&quot;1&quot;:0},&quot;9&quot;:0,&quot;12&quot;:0,&quot;14&quot;:{&quot;1&quot;:2,&quot;2&quot;:4342338},&quot;15&quot;:&quot;Arial&quot;,&quot;16&quot;:10,&quot;23&quot;:2}" data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;MCA&quot;}" style="font-size:100%;font-family:Arial;color:#424242;text-align:left;">MCA</span></p>\r\n', 'mca', NULL, 'Active', '2016-11-08 04:04:13', '0000-00-00 00:00:00', 'degree'),
(8, 0, 'M.Sc ', '<p>\r\n	<style type="text/css">\r\n<!--td {border: 1px solid #ccc;}br {mso-data-placement:same-cell;}-->	</style>\r\n	<span data-sheets-userformat="{&quot;2&quot;:1063489,&quot;3&quot;:{&quot;1&quot;:0},&quot;9&quot;:0,&quot;12&quot;:0,&quot;14&quot;:{&quot;1&quot;:2,&quot;2&quot;:4342338},&quot;15&quot;:&quot;Arial&quot;,&quot;16&quot;:10,&quot;23&quot;:2}" data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;M.Sc &quot;}" style="font-size:100%;font-family:Arial;color:#424242;text-align:left;">M.Sc </span></p>\r\n', 'm.sc', NULL, 'Active', '2016-11-08 04:04:26', '0000-00-00 00:00:00', 'degree'),
(9, 0, 'B.com', '<p>\r\n	<style type="text/css">\r\n<!--td {border: 1px solid #ccc;}br {mso-data-placement:same-cell;}-->	</style>\r\n	<span data-sheets-userformat="{&quot;2&quot;:1061377,&quot;3&quot;:{&quot;1&quot;:0},&quot;12&quot;:0,&quot;15&quot;:&quot;Arial&quot;,&quot;16&quot;:10,&quot;23&quot;:2}" data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;B.com&quot;}" style="font-size:100%;font-family:Arial;">B.com</span></p>\r\n', 'b.com', NULL, 'Active', '2016-11-08 04:04:35', '0000-00-00 00:00:00', 'degree'),
(10, 0, 'BA', '<p>\r\n	<style type="text/css">\r\n<!--td {border: 1px solid #ccc;}br {mso-data-placement:same-cell;}-->	</style>\r\n	<span data-sheets-userformat="{&quot;2&quot;:1061377,&quot;3&quot;:{&quot;1&quot;:0},&quot;12&quot;:0,&quot;15&quot;:&quot;Arial&quot;,&quot;16&quot;:10,&quot;23&quot;:2}" data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;BA&quot;}" style="font-size:100%;font-family:Arial;">BA</span></p>\r\n', 'ba', NULL, 'Active', '2016-11-08 04:04:44', '0000-00-00 00:00:00', 'degree'),
(11, 0, 'Phd', '<p>\r\n	<style type="text/css">\r\n<!--td {border: 1px solid #ccc;}br {mso-data-placement:same-cell;}-->	</style>\r\n	<span data-sheets-userformat="{&quot;2&quot;:1061377,&quot;3&quot;:{&quot;1&quot;:0},&quot;12&quot;:0,&quot;15&quot;:&quot;Arial&quot;,&quot;16&quot;:10,&quot;23&quot;:2}" data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;Phd&quot;}" style="font-size:100%;font-family:Arial;">Phd</span></p>\r\n', 'phd', NULL, 'Active', '2016-11-08 04:04:52', '0000-00-00 00:00:00', 'degree'),
(12, 0, 'Diploma', '<p>\r\n	Diploma</p>\r\n', 'diploma', NULL, 'Active', '2016-11-08 04:05:16', '0000-00-00 00:00:00', 'degree'),
(13, 0, 'BE', '<p>\r\n	BE</p>\r\n', 'be', NULL, 'Active', '2016-11-08 04:05:28', '0000-00-00 00:00:00', 'degree'),
(14, 0, 'MBBS', '<p>\r\n	MBBS</p>\r\n', 'mbbs', NULL, 'Active', '2016-11-08 04:06:12', '0000-00-00 00:00:00', 'degree'),
(15, 0, 'Intermediate', '<p>\r\n	Intermediate</p>\r\n', 'intermediate', NULL, 'Active', '2016-11-08 04:06:37', '0000-00-00 00:00:00', 'degree');

-- --------------------------------------------------------

--
-- Table structure for table `pre_testimonials`
--

CREATE TABLE `pre_testimonials` (
  `testimony_id` int(25) NOT NULL,
  `user_id` int(25) NOT NULL,
  `user_group_id` int(25) NOT NULL,
  `content` varchar(512) COLLATE utf8_unicode_ci NOT NULL,
  `rating_value` float NOT NULL,
  `date_posted` varchar(512) COLLATE utf8_unicode_ci NOT NULL,
  `status` enum('Pending','Approved','Blocked') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Pending'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pre_tpay_data`
--

CREATE TABLE `pre_tpay_data` (
  `id` int(11) NOT NULL,
  `data` text,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pre_tutor_courses`
--

CREATE TABLE `pre_tutor_courses` (
  `id` int(11) NOT NULL,
  `tutor_id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  `duration_value` tinyint(5) NOT NULL,
  `duration_type` enum('hours','days','months','years') NOT NULL DEFAULT 'days',
  `fee` float NOT NULL COMMENT 'in credits',
  `per_credit_value` float NOT NULL DEFAULT '1' COMMENT 'per credit value already set by Admin',
  `content` text COMMENT 'course content that is covered by tutor',
  `time_slots` varchar(1000) DEFAULT NULL COMMENT 'time slots in which tutor is avail for teaching for particular course',
  `days_off` varchar(512) NOT NULL DEFAULT 'SUN',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1-active, 0-inactive',
  `sort_order` int(11) NOT NULL DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='are the courses teached by tutors';

--
-- Dumping data for table `pre_tutor_courses`
--

INSERT INTO `pre_tutor_courses` (`id`, `tutor_id`, `course_id`, `duration_value`, `duration_type`, `fee`, `per_credit_value`, `content`, `time_slots`, `days_off`, `status`, `sort_order`, `created_at`, `updated_at`) VALUES
(1, 7, 27, 5, 'months', 60, 2, '<p>\r\n	<span style="font-family: arial, sans-serif; font-size: 16px;">&nbsp;consists of a means of monitoring the&nbsp;</span><b style="font-family: arial, sans-serif; font-size: 16px;">software</b><span style="font-family: arial, sans-serif; font-size: 16px;">engineering processes and methods used to ensure quality. The methods by which this is accomplished are many and varied, and may include ensuring conformance to one or more standards, such as ISO 9000 or a model such as CMMI.</span></p>\r\n', '7-9,10-12,4-6', 'SUN', 1, 0, '2016-11-08 14:34:05', '2016-11-11 10:56:11'),
(2, 7, 21, 30, 'days', 50, 2, '<p>\r\n	<b style="font-family: arial, sans-serif; font-size: 16px;">JavaScript</b><span style="font-family: arial, sans-serif; font-size: 16px;">&nbsp;is a lightweight, interpreted, object-oriented language with first-class functions, and is best known as the scripting language for Web pages, but it&#39;s used in many non-browser environments as well.</span></p>\r\n', '7-9,10-12,4-6', 'SUN', 1, 0, '2016-11-08 14:39:47', '2016-11-08 14:39:47'),
(3, 7, 22, 2, 'months', 130, 2, '<p>\r\n	<b style="font-family: arial, sans-serif; font-size: 16px;">MATLAB</b><span style="font-family: arial, sans-serif; font-size: 16px;">&nbsp;is a high-performance language for technical computing. It integrates computation, visualization, and programming in an easy-to-use environment where problems and solutions are expressed in familiar mathematical notation. Typical uses include: Math and computation.</span></p>\r\n', '7-9,10-12,4-6', 'SUN', 1, 0, '2016-11-08 14:43:42', '2016-11-08 14:43:42'),
(4, 7, 14, 6, 'months', 150, 2, '<p style="font-family: verdana, helvetica, arial, sans-serif; font-size: 13px; text-align: justify;">\r\n	Java is a&nbsp;programming language&nbsp;and a&nbsp;platform.</p>\r\n<p style="font-family: verdana, helvetica, arial, sans-serif; font-size: 13px; text-align: justify;">\r\n	Java is a high level, robust, secured and object-oriented programming language.</p>\r\n', '7-9,10-12,4-6,8-10', 'SUN', 1, 0, '2016-11-08 14:46:19', '2016-11-11 10:56:44'),
(5, 7, 26, 90, 'days', 150, 2, '<p>\r\n	<b style="font-family: arial, sans-serif; font-size: 16px;">PHP</b><span style="font-family: arial, sans-serif; font-size: 16px;">&nbsp;is a server-side scripting language designed primarily for web development but also used as a general-purpose&nbsp;</span><b style="font-family: arial, sans-serif; font-size: 16px;">programming&nbsp;</b><span style="font-family: arial, sans-serif; font-size: 16px;">language. </span><span style="font-family: arial, sans-serif; font-size: 16px;">&nbsp;</span></p>\r\n', '7-9,10-12,4-6', 'SAT', 1, 0, '2016-11-08 14:49:02', '2016-11-08 14:49:02'),
(6, 8, 39, 2, 'months', 200, 2, '<p>\r\n	<span style="font-family: verdana; font-size: small;">Chemistry is the science of matter at or near the atomic scale. (Matter is the substance of which all physical objects are made.)</span></p>\r\n<p style="font-family: verdana; font-size: small;">\r\n	Chemistry deals with the properties of matter, and the transformation and interactions of matter and energy. Central to chemistry is the interaction of one substance with another, such as in a chemical reaction, where a substance or substances are transformed into another. Chemistry primarily studies atoms and collections of atoms such as molecules, crystals or metals that make up ordinary matter. According to modern chemistry it is the structure of matter at the atomic scale that determines the nature of a material.</p>\r\n', '7-9,10-12,4-6', 'SUN', 1, 0, '2016-11-08 14:54:57', '2016-11-08 14:54:57'),
(7, 8, 38, 3, 'months', 250, 2, '<p>\r\n	<b style="font-family: arial, sans-serif; font-size: 16px;">Physics</b><span style="font-family: arial, sans-serif; font-size: 16px;">&nbsp;is the study of the natural world. It deals with the fundamental particles of which the universe is made, and the interactions between those particles, the objects composed of them (nuclei, atoms, molecules, etc) and energy.&nbsp;</span><b style="font-family: arial, sans-serif; font-size: 16px;">Physics</b><span style="font-family: arial, sans-serif; font-size: 16px;">&nbsp;is the science of Nature - of matter and energy in space and time.</span></p>\r\n', '7-9,10-12,4-6', 'SUN,SAT', 1, 0, '2016-11-08 15:02:39', '2016-11-08 15:02:39'),
(8, 8, 40, 3, 'months', 200, 2, '<p>\r\n	<span style="font-family: arial, sans-serif; font-size: 16px;">The science of life and of living organisms, including their structure, function, growth, origin, evolution, and distribution. It includes botany and zoology and all their subdivisions. The life processes or characteristic phenomena of a group or category of living organisms: the&nbsp;</span><b style="font-family: arial, sans-serif; font-size: 16px;">biology</b><span style="font-family: arial, sans-serif; font-size: 16px;">&nbsp;of fungi.</span></p>\r\n', '7-9,10-12,4-6', 'SUN', 1, 0, '2016-11-08 15:04:54', '2016-11-11 10:50:46'),
(9, 8, 61, 3, 'months', 250, 2, '<p>\r\n	<b style="font-family: arial, sans-serif; font-size: 16px;">Mathematics</b><span style="font-family: arial, sans-serif; font-size: 16px;">&nbsp;is the study of topics such as quantity (numbers), structure, space, and change. There is a range of views among&nbsp;</span><b style="font-family: arial, sans-serif; font-size: 16px;">mathematicians&nbsp;</b><span style="font-family: arial, sans-serif; font-size: 16px;">and philosophers as to the exact scope and&nbsp;</span><b style="font-family: arial, sans-serif; font-size: 16px;">definition</b><span style="font-family: arial, sans-serif; font-size: 16px;">&nbsp;of&nbsp;</span><b style="font-family: arial, sans-serif; font-size: 16px;">mathematic</b><b style="font-family: arial, sans-serif; font-size: 16px;">s</b><span style="font-family: arial, sans-serif; font-size: 16px;">.</span></p>\r\n', '7-9,10-12,4-6', 'SAT', 1, 0, '2016-11-08 15:07:00', '2016-11-08 15:07:00'),
(10, 8, 37, 45, 'days', 50, 2, '<p>\r\n	<span style="color: rgb(91, 91, 91); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 16px;">Trigonometry is a branch of mathematics that studies relationships between the sides and angles of triangles. Trigonometry is found all throughout geometry, as every straight-sided shape may be broken into as a collection of triangles. Further still, trigonometry has astoundingly intricate relationships to other branches of mathematics, in particular complex numbers, infinite series, logarithms and calculus.&nbsp;</span></p>\r\n', '7-9,10-12,2-4,6-8', 'SUN', 1, 0, '2016-11-08 15:14:20', '2016-11-08 15:14:20'),
(11, 9, 17, 90, 'days', 50, 2, '<p>\r\n	<b style="font-family: arial, sans-serif; font-size: 16px;">MySQL</b><span style="font-family: arial, sans-serif; font-size: 16px;">, pronounced either &quot;</span><b style="font-family: arial, sans-serif; font-size: 16px;">My S-Q-L</b><span style="font-family: arial, sans-serif; font-size: 16px;">&quot; or &quot;</span><b style="font-family: arial, sans-serif; font-size: 16px;">My</b><span style="font-family: arial, sans-serif; font-size: 16px;">&nbsp;Sequel,&quot; is an open source relational database management system. It is based on the structure query language (</span><b style="font-family: arial, sans-serif; font-size: 16px;">SQL</b><span style="font-family: arial, sans-serif; font-size: 16px;">), which is used for adding, removing, and modifying information in the database.</span></p>\r\n', '7-9,10-12,2-4,6-8', 'SUN', 1, 0, '2016-11-08 16:22:00', '2016-11-08 16:22:00'),
(12, 9, 29, 2, 'months', 200, 2, '<p>\r\n	<b style="font-family: arial, sans-serif; font-size: 16px;">Oracle</b><span style="font-family: arial, sans-serif; font-size: 16px;">&nbsp;database (</span><b style="font-family: arial, sans-serif; font-size: 16px;">Oracle</b><span style="font-family: arial, sans-serif; font-size: 16px;">&nbsp;DB) is a relational database management system (RDBMS) from the&nbsp;</span><b style="font-family: arial, sans-serif; font-size: 16px;">Oracle</b><span style="font-family: arial, sans-serif; font-size: 16px;">&nbsp;Corporation. Originally developed in 1977 by Lawrence Ellison and other developers,&nbsp;</span><b style="font-family: arial, sans-serif; font-size: 16px;">Oracle</b><span style="font-family: arial, sans-serif; font-size: 16px;">&nbsp;DB is one of the most trusted and widely-used relational database engines.</span></p>\r\n', '7-9,10-12,2-4,6-8', 'SAT', 1, 0, '2016-11-08 16:25:35', '2016-11-08 16:25:35'),
(13, 9, 27, 90, 'days', 200, 2, '<p>\r\n	<span style="font-family: arial, sans-serif; font-size: 16px;">System&nbsp;</span><b style="font-family: arial, sans-serif; font-size: 16px;">testing</b><span style="font-family: arial, sans-serif; font-size: 16px;">&nbsp;of software or hardware is&nbsp;</span><b style="font-family: arial, sans-serif; font-size: 16px;">testing</b><span style="font-family: arial, sans-serif; font-size: 16px;">&nbsp;conducted on a complete, integrated system to evaluate the system&#39;s compliance with its specified requirements</span></p>\r\n', '7-9,10-12,2-4,6-8', 'SUN', 1, 0, '2016-11-08 16:27:08', '2016-11-08 16:27:08'),
(14, 9, 15, 60, 'days', 100, 2, '<p>\r\n	<span style="font-family: arial, sans-serif; font-size: 16px;">An image editing software developed and manufactured by&nbsp;</span><b style="font-family: arial, sans-serif; font-size: 16px;">Adobe</b><span style="font-family: arial, sans-serif; font-size: 16px;">Systems Inc.&nbsp;</span><b style="font-family: arial, sans-serif; font-size: 16px;">Photoshop</b><span style="font-family: arial, sans-serif; font-size: 16px;">&nbsp;is considered one of the leaders in photo editing software. The software allows users to manipulate, crop, resize, and correct color on digital photos.</span></p>\r\n', '7-9,10-12,2-4,6-8', 'SUN', 1, 0, '2016-11-08 16:28:52', '2016-11-08 16:28:52'),
(15, 9, 18, 90, 'days', 120, 2, '<p>\r\n	<span style="font-family: arial, sans-serif; font-size: 16px;">Adobe&nbsp;</span><b style="font-family: arial, sans-serif; font-size: 16px;">Dreamweaver</b><span style="font-family: arial, sans-serif; font-size: 16px;">&nbsp;is a proprietary web development tool developed by Adobe Systems.&nbsp;</span><b style="font-family: arial, sans-serif; font-size: 16px;">Dreamweaver</b><span style="font-family: arial, sans-serif; font-size: 16px;">&nbsp;was created by Macromedia in 1997, and was maintained by them until Macromedia was acquired by Adobe Systems in 2005.</span></p>\r\n', '7-9,10-12,2-4,6-8', 'SUN', 1, 0, '2016-11-08 16:30:09', '2016-11-08 16:30:09'),
(16, 10, 151, 90, 'days', 150, 2, '<p>\r\n	<span style="font-family: arial, sans-serif; font-size: 16px;">The&nbsp;</span><b style="font-family: arial, sans-serif; font-size: 16px;">IBPS</b><span style="font-family: arial, sans-serif; font-size: 16px;">&nbsp;clerk exam is universally adapted by nationalized banks across India to induct fresh graduates into various clerical posts.&nbsp;</span><b style="font-family: arial, sans-serif; font-size: 16px;">IBPS</b><span style="font-family: arial, sans-serif; font-size: 16px;">also conducts exams for recruitment to the post of probationary officer (PO) and specialist officer (SO)</span></p>\r\n', '7-9,10-12,2-4,6-8', 'SUN', 1, 0, '2016-11-08 16:54:55', '2016-11-08 16:54:55'),
(17, 10, 149, 90, 'days', 130, 2, '<p>\r\n	<span style="color: rgb(17, 17, 17); font-family: Raleway, Arial, Tahoma; font-size: 15.2015px;">The duty of the Forest Guard that he protects all forest produce and other government property, which is in his charge. He should be so vigilant that there is no fear of theft of forest produce, thorny wire and other government property. If any theft takes place in his beat he should make all possible efforts to trap the culprit.</span></p>\r\n', '7-9,10-12,2-4,6-8', 'SUN', 1, 0, '2016-11-08 16:56:44', '2016-11-08 16:56:44'),
(18, 10, 144, 90, 'days', 150, 2, '<p>\r\n	<span style="color: rgb(48, 48, 48); font-family: Arimo, sans-serif; font-size: 15.008px; text-align: justify;">Bank PO is the Officer Post of Probationary Officer In Banks. It is the starting level appointment of the bank officer.&nbsp;</span></p>\r\n', '7-9,10-12,2-4,6-8', 'SUN', 1, 0, '2016-11-08 16:58:48', '2016-11-08 16:58:48'),
(19, 10, 153, 90, 'days', 150, 2, '<p>\r\n	<span style="font-family: arial, sans-serif; font-size: 16px;">An&nbsp;</span><b style="font-family: arial, sans-serif; font-size: 16px;">i</b><b style="font-family: arial, sans-serif; font-size: 16px;">nsurance</b><span style="font-family: arial, sans-serif; font-size: 16px;">&nbsp;sales agent contacts customers to sell particular types of&nbsp;</span><b style="font-family: arial, sans-serif; font-size: 16px;">insurance</b><span style="font-family: arial, sans-serif; font-size: 16px;">. They help customers select a policy, explain policies and maintain each client&#39;s&nbsp;</span><b style="font-family: arial, sans-serif; font-size: 16px;">insurance</b><span style="font-family: arial, sans-serif; font-size: 16px;">&nbsp;records. Most&nbsp;</span><b style="font-family: arial, sans-serif; font-size: 16px;">insurance</b><span style="font-family: arial, sans-serif; font-size: 16px;">&nbsp;sales agents&nbsp;</span><b style="font-family: arial, sans-serif; font-size: 16px;">work</b><span style="font-family: arial, sans-serif; font-size: 16px;">&nbsp;for&nbsp;</span><b style="font-family: arial, sans-serif; font-size: 16px;">insurance</b><span style="font-family: arial, sans-serif; font-size: 16px;">&nbsp;agencies and brokerages, although other agents&nbsp;</span><b style="font-family: arial, sans-serif; font-size: 16px;">work</b><span style="font-family: arial, sans-serif; font-size: 16px;">&nbsp;with a particular&nbsp;</span><b style="font-family: arial, sans-serif; font-size: 16px;">insurance</b><span style="font-family: arial, sans-serif; font-size: 16px;">company.</span></p>\r\n', '7-9,10-12,2-4,4-6', 'SUN', 1, 0, '2016-11-08 17:03:24', '2016-11-08 17:03:24'),
(20, 11, 39, 6, 'months', 400, 2, '<p>\r\n	<span style="font-family: arial, sans-serif-light, sans-serif; font-size: small;">the branch of science concerned with the substances of which matter is composed, the investigation of their properties and reactions, and the use of such reactions to form new substances.</span></p>\r\n', '8-10,11-13,17-19', 'SUN', 1, 0, '2016-11-08 17:15:33', '2016-11-08 17:15:33'),
(21, 10, 148, 90, 'days', 150, 2, '<p>\r\n	<span style="color: rgb(37, 37, 37); font-family: sans-serif; font-size: 14px;">The&nbsp;</span><b style="color: rgb(37, 37, 37); font-family: sans-serif; font-size: 14px;">National Defence Academy</b><span style="color: rgb(37, 37, 37); font-family: sans-serif; font-size: 14px;">&nbsp;(</span><b style="color: rgb(37, 37, 37); font-family: sans-serif; font-size: 14px;">NDA</b><span style="color: rgb(37, 37, 37); font-family: sans-serif; font-size: 14px;">) is the Joint Services academy of the&nbsp;</span><span style="color: rgb(37, 37, 37); font-family: sans-serif; font-size: 14px;">&nbsp;indian armed Forces where cadets of the three services, the&nbsp;</span><a href="https://en.wikipedia.org/wiki/Indian_Army" style="text-decoration: none; color: rgb(11, 0, 128); background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; font-family: sans-serif; font-size: 14px;" title="Indian Army">Army</a><span style="color: rgb(37, 37, 37); font-family: sans-serif; font-size: 14px;">, the&nbsp;</span><a href="https://en.wikipedia.org/wiki/Indian_Navy" style="text-decoration: none; color: rgb(11, 0, 128); background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; font-family: sans-serif; font-size: 14px;" title="Indian Navy">Navy</a><span style="color: rgb(37, 37, 37); font-family: sans-serif; font-size: 14px;">&nbsp;and the&nbsp;</span><a href="https://en.wikipedia.org/wiki/Indian_Air_Force" style="text-decoration: none; color: rgb(11, 0, 128); background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; font-family: sans-serif; font-size: 14px;" title="Indian Air Force">Air Force</a><span style="color: rgb(37, 37, 37); font-family: sans-serif; font-size: 14px;">&nbsp;train together before they go on to pre-commissioning training in their respective service academies.&nbsp;</span></p>\r\n', '7-9,10-12,2-4,6-8', 'SUN', 1, 0, '2016-11-08 17:09:20', '2016-11-08 17:09:20'),
(22, 11, 61, 4, 'months', 350, 2, '<p>\r\n	<span style="font-family: arial, sans-serif; font-size: 16px;">is the study of topics such as quantity (numbers), structure, space, and change. There is a range of views among&nbsp;</span><b style="font-family: arial, sans-serif; font-size: 16px;">mathematicians</b><span style="font-family: arial, sans-serif; font-size: 16px;">&nbsp;and philosophers as to the exact scope and&nbsp;</span><b style="font-family: arial, sans-serif; font-size: 16px;">definition</b><span style="font-family: arial, sans-serif; font-size: 16px;">&nbsp;of&nbsp;</span><b style="font-family: arial, sans-serif; font-size: 16px;">mathematics</b><span style="font-family: arial, sans-serif; font-size: 16px;">.</span></p>\r\n', '9-12,17-20', 'SUN', 1, 0, '2016-11-08 17:17:28', '2016-11-08 17:17:28'),
(23, 11, 38, 3, 'months', 350, 2, '<p>\r\n	<b style="font-family: arial, sans-serif; font-size: 16px;">Physics</b><span style="font-family: arial, sans-serif; font-size: 16px;">&nbsp;is the study of the natural world. It deals with the fundamental particles of which the universe is made, and the interactions between those particles, the objects composed of them (nuclei, atoms, molecules, etc) and energy.&nbsp;</span><b style="font-family: arial, sans-serif; font-size: 16px;">Physics</b><span style="font-family: arial, sans-serif; font-size: 16px;">&nbsp;is the science of Nature - of matter and energy in space and time.</span></p>\r\n', '12-15,17-21', 'SUN', 1, 0, '2016-11-08 17:19:03', '2016-11-08 17:19:03'),
(24, 53, 20, 1, 'months', 200, 2, '<p>\r\n	<span class="_Tgc">The &lt;meta&gt; tag provides metadata about the <b>HTML</b> document. ... Meta elements are typically used to specify page <b>description</b>, keywords, author of the document, last modified, and other metadata. The metadata can be used by browsers (how to display content or reload page), search engines (keywords), or other web services.</span></p>\r\n', '10-12,15-17,18-20', 'SUN', 1, 0, '2016-11-10 12:17:44', '2016-11-10 12:17:44'),
(25, 53, 13, 1, 'months', 250, 2, '<p>\r\n	<span class="_Tgc"><b>C++</b> is a middle-level programming language developed by Bjarne Stroustrup starting in 1979 at Bell Labs. <b>C++</b> runs on a variety of platforms, such as Windows, Mac OS, and the various versions of UNIX.</span></p>\r\n', '9-11,12-14,18-20', 'SUN', 1, 0, '2016-11-10 12:19:03', '2016-11-10 12:19:03'),
(26, 54, 21, 2, 'months', 300, 2, '<p>\r\n	<span class="_Tgc"><b>JavaScript</b> (&quot;JS&quot; for short) is a full-fledged dynamic programming language that, when applied to an HTML document, can provide dynamic interactivity on websites. It was invented by Brendan Eich, co-founder of the Mozilla project, the Mozilla Foundation, and the Mozilla Corporation</span></p>\r\n', '7-9,11-13,17-19', 'SUN', 1, 0, '2016-11-10 12:26:32', '2016-11-10 12:26:32'),
(27, 56, 15, 3, 'months', 400, 2, '<p>\r\n	<span class="_Tgc">An image editing software developed and manufactured by <b>Adobe</b> Systems Inc. <b>Photoshop</b> is considered one of the leaders in photo editing software. The software allows users to manipulate, crop, resize, and correct color on digital photos.</span></p>\r\n', '7-9,10-12,17-19', 'SUN', 1, 0, '2016-11-10 12:33:46', '2016-11-10 12:33:46'),
(28, 57, 18, 2, 'months', 350, 2, '<p>\r\n	<span class="_Tgc">Adobe <b>Dreamweaver</b>. ... Adobe <b>Dreamweaver</b> is a proprietary web development tool developed by Adobe Systems. <b>Dreamweaver</b> was created by Macromedia in 1997, and was maintained by them until Macromedia was acquired by Adobe Systems in 2005.</span></p>\r\n', '9-11,12-14,17-19', 'SUN', 1, 0, '2016-11-10 12:40:24', '2016-11-10 12:40:24'),
(29, 57, 15, 2, 'months', 360, 2, '<p>\r\n	<span class="_Tgc">An image editing software developed and manufactured by <b>Adobe</b> Systems Inc. <b>Photoshop</b> is considered one of the leaders in photo editing software. The software allows users to manipulate, crop, resize, and correct color on digital photos.</span></p>\r\n', '10-12,13-16', 'SUN', 1, 0, '2016-11-10 12:42:23', '2016-11-10 12:42:23'),
(30, 57, 20, 1, 'months', 200, 2, '<p>\r\n	<span class="_Tgc">The &lt;meta&gt; tag provides metadata about the <b>HTML</b> document. ... Meta elements are typically used to specify page <b>description</b>, keywords, author of the document, last modified, and other metadata. The metadata can be used by browsers (how to display content or reload page), search engines (keywords), or other web services.</span></p>\r\n', '7-9,10-12', 'SUN', 1, 0, '2016-11-10 12:43:27', '2016-11-10 12:43:27'),
(31, 58, 26, 2, 'months', 300, 2, '<p>\r\n	<span class="_Tgc"><b>PHP</b> (recursive acronym for <b>PHP</b>: Hypertext Preprocessor) is a widely-used open source general-purpose scripting language that is especially suited for web development and can be embedded into HTML</span></p>\r\n', '8-10,11-13,17-19', 'SUN', 1, 0, '2016-11-10 12:49:09', '2016-11-10 12:49:09'),
(32, 58, 14, 3, 'months', 400, 2, '<p>\r\n	<span class="_Tgc"><b>Java</b> is a general-purpose computer programming language that is concurrent, class-based, object-oriented, and specifically designed to have as few implementation dependencies as possible.</span></p>\r\n', '7-9,10-12,17-19', 'SUN', 1, 0, '2016-11-10 12:50:01', '2016-11-10 12:50:01'),
(33, 58, 21, 1, 'months', 150, 2, '<p>\r\n	<span class="Tgc"><b>JavaScript</b><sup>&reg;</sup> (often shortened to JS) is a lightweight, interpreted, object-oriented language with first-class functions, and is best known as the scripting language for Web pages, but it&#39;s used in many non-browser environments as well.</span></p>\r\n', '8-10,11-13,17-19', 'SUN', 1, 0, '2016-11-10 12:50:44', '2016-11-10 13:30:26'),
(34, 59, 29, 2, 'months', 300, 2, '<p>\r\n	<span class="_Tgc"><b>Oracle</b> database (<b>Oracle</b> DB) is a relational database management system (RDBMS) from the <b>Oracle</b> Corporation. Originally developed in 1977 by Lawrence Ellison and other developers, <b>Oracle</b> DB is one of the most trusted and widely-used relational database engines.</span></p>\r\n', '8-10,12-14,17-19', 'SUN', 1, 0, '2016-11-10 13:00:02', '2016-11-10 13:00:02'),
(35, 59, 28, 2, 'months', 250, 2, '<p>\r\n	<span class="_Tgc">MERGE is used to combine the data of multiple tables. It combines the INSERT and UPDATE elements. It is defined in the <b>SQL</b>:2003 standard; prior to that, some databases provided similar functionality via different syntax, sometimes called &quot;upsert&quot;</span></p>\r\n', '8-10,11-13,18-20', 'SUN', 1, 0, '2016-11-10 13:01:35', '2016-11-10 13:01:35'),
(36, 59, 23, 2, 'months', 350, 2, '<p>\r\n	<span class="_Tgc"><b>Microsoft Access</b> is a database management system (DBMS) from <b>Microsoft</b> that combines the relational <b>Microsoft</b> Jet Database Engine with a graphical user interface and software-development tools.</span></p>\r\n', '9-11,13-15,17-19', 'SUN', 1, 0, '2016-11-10 13:02:11', '2016-11-10 13:02:11'),
(37, 60, 24, 2, 'days', 250, 2, '<p>\r\n	<strong><span class="_Tgc"><b>Microsoft Office</b>. Suite of products developed by <b>Microsoft</b> Corporation that includes <b>Microsoft</b> Word, Excel, Access, Publisher, PowerPoint, and Outlook. Each program serves a different purpose and is compatible with other programs included in the package.</span></strong></p>\r\n', '10-12,17-19', 'SUN', 1, 0, '2016-11-10 13:05:18', '2016-11-10 13:11:53'),
(38, 60, 26, 2, 'months', 350, 2, '<p>\r\n	<span class="_Tgc"><b>PHP</b> (recursive acronym for <b>PHP</b>: Hypertext Preprocessor) is a widely-used open source general-purpose scripting language that is especially suited for web development and can be embedded into HTML.</span></p>\r\n', '8-10,11-13,17-19', 'SUN', 1, 0, '2016-11-10 13:12:35', '2016-11-10 13:12:35'),
(39, 60, 21, 1, 'months', 200, 2, '<p>\r\n	<span class="_Tgc"><b>JavaScript</b><sup>&reg;</sup> (often shortened to JS) is a lightweight, interpreted, object-oriented language with first-class functions, and is best known as the scripting language for Web pages, but it&#39;s used in many non-browser environments as well</span></p>\r\n', '10-12,13-15,18-20', 'SUN', 1, 0, '2016-11-10 13:13:22', '2016-11-10 13:13:22'),
(40, 61, 61, 3, 'months', 300, 2, '<p>\r\n	<span class="_Tgc"><b>Mathematics</b> (from Greek &mu;ά&theta;&eta;&mu;&alpha; m&aacute;thēma, &ldquo;knowledge, study, learning&rdquo;) is the study of topics such as quantity (numbers), structure, space, and change. There is a range of views among <b>mathematicians</b> and philosophers as to the exact scope and <b>definition</b> of <b>mathematics</b>.</span></p>\r\n', '10-12,17-20', 'SUN', 1, 0, '2016-11-10 14:30:26', '2016-11-10 14:30:26'),
(41, 61, 34, 4, 'months', 400, 2, '<p>\r\n	<span class="_Tgc"><b>Mathematics</b> (from Greek &mu;ά&theta;&eta;&mu;&alpha; m&aacute;thēma, &ldquo;knowledge, study, learning&rdquo;) is the study of topics such as quantity (numbers), structure, space, and change. There is a range of views among <b>mathematicians</b> and philosophers as to the exact scope and <b>definition</b> of <b>mathematics</b>.</span></p>\r\n', '7-9,17-20', 'SUN', 1, 0, '2016-11-10 14:31:39', '2016-11-10 14:31:39'),
(42, 61, 32, 2, 'months', 350, 2, '<p>\r\n	<span class="_Tgc"><b>Mathematics</b> (from Greek &mu;ά&theta;&eta;&mu;&alpha; m&aacute;thēma, &ldquo;knowledge, study, learning&rdquo;) is the study of topics such as quantity (numbers), structure, space, and change. There is a range of views among <b>mathematicians</b> and philosophers as to the exact scope and <b>definition</b> of <b>mathematics</b>.</span></p>\r\n', '9-12,17-20', 'SUN', 1, 0, '2016-11-10 14:32:16', '2016-11-10 14:32:16'),
(43, 62, 37, 1, 'months', 150, 2, '<p>\r\n	<span class="_Tgc"><b>Mathematics</b> (from Greek &mu;ά&theta;&eta;&mu;&alpha; m&aacute;thēma, &ldquo;knowledge, study, learning&rdquo;) is the study of topics such as quantity (numbers), structure, space, and change. There is a range of views among <b>mathematicians</b> and philosophers as to the exact scope and <b>definition</b> of <b>mathematics</b>.</span></p>\r\n', '7-8,9-10,17-20', 'SUN', 1, 0, '2016-11-10 14:37:14', '2016-11-10 14:37:14'),
(44, 62, 36, 2, 'days', 200, 2, '<p>\r\n	<span class="_Tgc"><b>Mathematics</b> (from Greek &mu;ά&theta;&eta;&mu;&alpha; m&aacute;thēma, &ldquo;knowledge, study, learning&rdquo;) is the study of topics such as quantity (numbers), structure, space, and change. There is a range of views among <b>mathematicians</b> and philosophers as to the exact scope and <b>definition</b> of <b>mathematics</b>.</span></p>\r\n', '8-9,10-12', 'SUN', 1, 0, '2016-11-10 14:37:55', '2016-11-10 14:37:55'),
(45, 62, 31, 1, 'days', 200, 2, '<p>\r\n	<span class="_Tgc"><b>Mathematics</b> (from Greek &mu;ά&theta;&eta;&mu;&alpha; m&aacute;thēma, &ldquo;knowledge, study, learning&rdquo;) is the study of topics such as quantity (numbers), structure, space, and change. There is a range of views among <b>mathematicians</b> and philosophers as to the exact scope and <b>definition</b> of <b>mathematics</b>.</span></p>\r\n', '9-10,11-13', 'SUN', 1, 0, '2016-11-10 14:41:03', '2016-11-10 14:41:03'),
(46, 62, 33, 1, 'months', 200, 2, '<p>\r\n	<span class="_Tgc"><b>Mathematics</b> (from Greek &mu;ά&theta;&eta;&mu;&alpha; m&aacute;thēma, &ldquo;knowledge, study, learning&rdquo;) is the study of topics such as quantity (numbers), structure, space, and change. There is a range of views among <b>mathematicians</b> and philosophers as to the exact scope and <b>definition</b> of <b>mathematics</b>.</span></p>\r\n', '10-12,17-20', 'SUN', 1, 0, '2016-11-10 14:41:52', '2016-11-10 14:41:52'),
(47, 63, 42, 6, 'months', 600, 2, '<p>\r\n	<span class="_Tgc">The required portion of the <b>ACT</b> is divided into four multiple choice subject <b>tests</b>: English, mathematics, reading, and science reasoning. Subject <b>test</b> scores range from 1 to 36; all scores are integers. The English, mathematics, and reading <b>tests</b> also have subscores ranging from 1 to 18.</span></p>\r\n', '8-13,17-21', 'SUN', 1, 0, '2016-11-10 14:55:12', '2016-11-10 14:55:12'),
(48, 63, 45, 6, 'days', 600, 2, '<p>\r\n	<span class="_Tgc">The required portion of the GRE is divided into four multiple choice subject <b>tests</b>: English, mathematics, reading, and science reasoning. Subject <b>test</b> scores range from 1 to 36; all scores are integers. The English, mathematics, and reading <b>tests</b> also have subscores ranging from 1 to 18.</span></p>\r\n', '7-11,15-20', 'SUN', 1, 0, '2016-11-10 14:56:21', '2016-11-10 14:56:21'),
(49, 63, 51, 6, 'months', 500, 2, '<p>\r\n	<span class="_Tgc">The required portion of the TOEFL is divided into four multiple choice subject <b>tests</b>: English, mathematics, reading, and science reasoning. Subject <b>test</b> scores range from 1 to 36; all scores are integers. The English, mathematics, and reading <b>tests</b> also have subscores ranging from 1 to 18.</span></p>\r\n', '8-11,13-20', 'SUN', 1, 0, '2016-11-10 14:57:04', '2016-11-10 14:57:04'),
(50, 64, 46, 5, 'months', 400, 2, '<p>\r\n	<span class="_Tgc">The required portion of the IELTS is divided into four multiple choice subject <b>tests</b>: English, mathematics, reading, and science reasoning. Subject <b>test</b> scores range from 1 to 36; all scores are integers. The English, mathematics, and reading <b>tests</b> also have subscores ranging from 1 to 18.</span></p>\r\n', '8-12,14-20', 'SUN', 1, 0, '2016-11-10 15:00:59', '2016-11-10 15:00:59'),
(51, 64, 44, 5, 'months', 500, 2, '<p>\r\n	<span class="_Tgc">The required portion of the GMAT is divided into four multiple choice subject <b>tests</b>: English, mathematics, reading, and science reasoning. Subject <b>test</b> scores range from 1 to 36; all scores are integers. The English, mathematics, and reading <b>tests</b> also have subscores ranging from 1 to 18.</span></p>\r\n', '8-11,12-19', 'SUN', 1, 0, '2016-11-10 15:01:52', '2016-11-10 15:01:52'),
(52, 64, 50, 5, 'months', 500, 2, '<p>\r\n	<span class="_Tgc">The required portion of the OET is divided into four multiple choice subject <b>tests</b>: English, mathematics, reading, and science reasoning. Subject <b>test</b> scores range from 1 to 36; all scores are integers. The English, mathematics, and reading <b>tests</b> also have subscores ranging from 1 to 18.</span></p>\r\n', '8-12,14-20', 'SUN', 1, 0, '2016-11-10 15:02:32', '2016-11-10 15:02:32'),
(53, 64, 52, 5, 'months', 500, 2, '<p>\r\n	<span class="_Tgc">The required portion of the USMLE is divided into four multiple choice subject <b>tests</b>: English, mathematics, reading, and science reasoning. Subject <b>test</b> scores range from 1 to 36; all scores are integers. The English, mathematics, and reading <b>tests</b> also have subscores ranging from 1 to 18.</span></p>\r\n', '8-12,14-20', 'SUN', 1, 0, '2016-11-10 15:03:20', '2016-11-10 15:03:20'),
(54, 65, 48, 5, 'months', 500, 2, '<p>\r\n	<span class="_Tgc">The required portion of the NCLEX is divided into four multiple choice subject <b>tests</b>: English, mathematics, reading, and science reasoning. Subject <b>test</b> scores range from 1 to 36; all scores are integers. The English, mathematics, and reading <b>tests</b> also have subscores ranging from 1 to 18.</span></p>\r\n', '7-11,15-20', 'SUN', 1, 0, '2016-11-10 15:32:44', '2016-11-10 15:32:44'),
(55, 65, 51, 2, 'months', 500, 2, '<p>\r\n	<span class="_Tgc">The required portion of the TOEFL is divided into four multiple choice subject <b>tests</b>: English, mathematics, reading, and science reasoning. Subject <b>test</b> scores range from 1 to 36; all scores are integers. The English, mathematics, and reading <b>tests</b> also have subscores ranging from 1 to 18.</span></p>\r\n', '09-11,13-17', 'SUN', 1, 0, '2016-11-10 15:33:45', '2016-11-10 15:33:45'),
(56, 66, 48, 6, 'months', 400, 2, '<p>\r\n	<span class="_Tgc">The required portion of the NCLEX is divided into four multiple choice subject <b>tests</b>: English, mathematics, reading, and science reasoning. Subject <b>test</b> scores range from 1 to 36; all scores are integers. The English, mathematics, and reading <b>tests</b> also have subscores ranging from 1 to 18.</span></p>\r\n', '8-11,12-17', 'SUN', 1, 0, '2016-11-10 15:44:55', '2016-11-10 15:44:55'),
(57, 66, 45, 5, 'days', 500, 2, '<p>\r\n	<span class="_Tgc">The required portion of the GRE is divided into four multiple choice subject <b>tests</b>: English, mathematics, reading, and science reasoning. Subject <b>test</b> scores range from 1 to 36; all scores are integers. The English, mathematics, and reading <b>tests</b> also have subscores ranging from 1 to 18.</span></p>\r\n', '8-12,14-20', 'SUN', 1, 0, '2016-11-10 15:45:39', '2016-11-10 15:45:39'),
(58, 66, 50, 8, 'months', 700, 2, '<p>\r\n	<span class="_Tgc">The required portion of the OET is divided into four multiple choice subject <b>tests</b>: English, mathematics, reading, and science reasoning. Subject <b>test</b> scores range from 1 to 36; all scores are integers. The English, mathematics, and reading <b>tests</b> also have subscores ranging from 1 to 18.</span></p>\r\n', '7-11,13-20', 'SUN', 1, 0, '2016-11-10 15:46:20', '2016-11-10 15:46:20'),
(59, 66, 44, 6, 'months', 600, 2, '<p>\r\n	<span class="_Tgc">The required portion of the GMAT is divided into four multiple choice subject <b>tests</b>: English, mathematics, reading, and science reasoning. Subject <b>test</b> scores range from 1 to 36; all scores are integers. The English, mathematics, and reading <b>tests</b> also have subscores ranging from 1 to 18.</span></p>\r\n', '8-12,13-19', 'SUN', 1, 0, '2016-11-10 15:46:57', '2016-11-10 15:46:57'),
(60, 68, 92, 8, 'months', 700, 2, '<p>\r\n	<span class="_Tgc _y9e"><b>GATE</b> is conducted jointly by the Indian Institute of Science and seven IITs (IIT Bombay, IIT Delhi, IIT Guwahati, IIT Kanpur, IIT Kharagpur, IIT Madras and IIT Roorkee) on behalf of the National Coordination Board &ndash; <b>GATE</b>, Department of Higher Education, Ministry of Human Resource Development (MHRD), and Government of ...</span></p>\r\n', '8-13,14-21', 'SUN', 1, 0, '2016-11-10 15:48:49', '2016-11-10 15:48:49'),
(61, 68, 87, 1, 'years', 1000, 2, '<p>\r\n	<span>The Institution of Engineers is the national organization of engineers in India. The Institution of Engineers (India) has more than one million members in it&#39;s 15 engineering disciplines in 125 centers</span></p>\r\n', '7-12,13-20', 'SUN', 1, 0, '2016-11-10 15:51:07', '2016-11-10 15:51:07'),
(62, 68, 27, 3, 'months', 600, 2, '<p>\r\n	<span class="_Tgc"><b>Software Testing</b> is evaluation of the <b>software</b> against requirements gathered from users and system specifications. <b>Testing</b> is conducted at the phase level in <b>software</b> development life cycle or at module level in program code. <b>Software testing</b> comprises of Validation and Verification.</span></p>\r\n', '8-10,11-13,18-20', 'SUN', 1, 0, '2016-11-10 15:53:03', '2016-11-10 15:53:03'),
(63, 69, 21, 1, 'months', 250, 2, '<p>\r\n	<span class="_Tgc"><b>JavaScript</b><sup>&reg;</sup> (often shortened to JS) is a lightweight, interpreted, object-oriented language with first-class functions, and is best known as the scripting language for Web pages, but it&#39;s used in many non-browser environments as well.</span></p>\r\n', '8-10,11-13,15-17', 'SUN', 1, 0, '2016-11-10 17:00:34', '2016-11-10 17:00:34'),
(64, 69, 13, 2, 'months', 300, 2, '<p>\r\n	<span class="_Tgc"><b>C++</b> is an object oriented programming (OOP) language, developed by Bjarne Stroustrup, and is an extension of C language. It is therefore possible to code <b>C++</b> in a &quot;C style&quot; or &quot;object-oriented style.&quot; In certain scenarios, it can be coded in either way and is thus an effective example of a hybrid language.</span></p>\r\n', '8-10,11-13', 'SUN', 1, 0, '2016-11-10 17:01:22', '2016-11-10 17:01:22'),
(65, 70, 14, 2, 'days', 350, 2, '<p>\r\n	<span class="_Tgc"><b>Java</b> is a general-purpose computer programming language that is concurrent, class-based, object-oriented, and specifically designed to have as few implementation dependencies as possible.</span></p>\r\n', '8-10,11-13,18-20', 'SUN', 1, 0, '2016-11-10 17:05:24', '2016-11-10 17:05:24'),
(66, 70, 15, 3, 'months', 350, 2, '<p>\r\n	<span class="_Tgc">An image editing software developed and manufactured by <b>Adobe</b> Systems Inc. <b>Photoshop</b> is considered one of the leaders in photo editing software. The software allows users to manipulate, crop, resize, and correct color on digital photos.</span></p>\r\n', '8-10,11-13,15-17', 'SUN', 1, 0, '2016-11-10 17:06:07', '2016-11-10 17:06:07'),
(67, 71, 26, 2, 'months', 300, 2, '<p>\r\n	<span class="_Tgc"><b>PHP</b> (recursive acronym for <b>PHP</b>: Hypertext Preprocessor) is a widely-used open source general-purpose scripting language that is especially suited for web development and can be embedded into HTML.</span></p>\r\n', '8-10,11-13,15-17', 'SUN', 1, 0, '2016-11-10 17:07:43', '2016-11-10 17:07:43'),
(68, 71, 27, 2, 'months', 400, 2, '<p>\r\n	<span class="_Tgc"><b>QA</b> engineer responsibilities include estimating, planning, and coordinating testing activities. You will also ensure that quality issues and defects are appropriately identified, documented, tracked, and resolved in our defect tracking system.</span></p>\r\n', '7-9,10-12,15-17', 'SUN', 1, 0, '2016-11-10 17:08:22', '2016-11-10 17:08:22'),
(69, 72, 13, 2, 'months', 250, 2, '<p>\r\n	<span class="_Tgc"><b>C++</b> is an object oriented programming (OOP) language, developed by Bjarne Stroustrup, and is an extension of C language. It is therefore possible to code <b>C++</b> in a &quot;C style&quot; or &quot;object-oriented style.&quot; In certain scenarios, it can be coded in either way and is thus an effective example of a hybrid language.</span></p>\r\n', '8-10,11-13,15-19', 'SUN', 1, 0, '2016-11-10 17:15:46', '2016-11-10 17:15:46'),
(70, 72, 14, 3, 'months', 300, 2, '<p>\r\n	<span class="_Tgc"><b>Java</b> is a general-purpose computer programming language that is concurrent, class-based, object-oriented, and specifically designed to have as few implementation dependencies as possible.</span></p>\r\n', '8-10,11-13,18-20', 'SUN', 1, 0, '2016-11-10 17:16:49', '2016-11-10 17:16:49'),
(71, 72, 21, 2, 'months', 250, 2, '<p>\r\n	<span class="_Tgc"><b>JavaScript</b><sup>&reg;</sup> (often shortened to JS) is a lightweight, interpreted, object-oriented language with first-class functions, and is best known as the scripting language for Web pages, but it&#39;s used in many non-browser environments as well.</span></p>\r\n', '8-10,11-13,15-17,19-21', 'SUN', 1, 0, '2016-11-10 17:17:33', '2016-11-10 17:17:33'),
(72, 7, 14, 3, 'months', 400, 2, '<p>\r\n	<b style="font-family: arial, sans-serif; font-size: 16px;">Java</b><span style="font-family: arial, sans-serif; font-size: 16px;">&nbsp;is a general-purpose computer programming language that is concurrent, class-based, object-oriented, and specifically designed to have as few implementation dependencies as possible.</span></p>\r\n', '8-10,12-14', 'SUN', 1, 0, '2016-11-11 10:29:30', '2016-11-11 10:29:30'),
(73, 7, 30, 3, 'months', 170, 2, '<p>\r\n	<b style="font-family: arial, sans-serif; font-size: 16px;">Algebra</b><span style="font-family: arial, sans-serif; font-size: 16px;">&nbsp;I provides a formal development of the&nbsp;</span><b style="font-family: arial, sans-serif; font-size: 16px;">algebraic</b><span style="font-family: arial, sans-serif; font-size: 16px;">&nbsp;skills and concepts necessary for students to succeed in advanced courses. ... Topics include: (1) operations with real numbers, (2) linear equations and inequalities, (3) relations and functions, (4) polynomials, (5)&nbsp;</span><b style="font-family: arial, sans-serif; font-size: 16px;">algebraic</b><span style="font-family: arial, sans-serif; font-size: 16px;">&nbsp;fractions, and (6) nonlinear equations.</span></p>\r\n', '8-10,17-20', 'SUN', 1, 0, '2016-11-11 10:30:16', '2016-11-11 10:56:58'),
(74, 7, 40, 4, 'months', 60, 2, '<p>\r\n	<span style="font-family: arial, sans-serif; font-size: 16px;">The science of life and of living organisms, including their structure, function, growth, origin, evolution, and distribution. It includes botany and zoology and all their subdivisions. 2. The life processes or characteristic phenomena of a group or category of living organisms: the&nbsp;</span><b style="font-family: arial, sans-serif; font-size: 16px;">biology</b><span style="font-family: arial, sans-serif; font-size: 16px;">&nbsp;of fungi.</span></p>\r\n', '7-9,10-12,17-20', 'SUN', 1, 0, '2016-11-11 10:31:08', '2016-11-11 10:57:20'),
(75, 7, 29, 2, 'months', 300, 2, '<p>\r\n	<b style="font-family: arial, sans-serif; font-size: 16px;">Oracle</b><span style="font-family: arial, sans-serif; font-size: 16px;">&nbsp;database (</span><b style="font-family: arial, sans-serif; font-size: 16px;">Oracle</b><span style="font-family: arial, sans-serif; font-size: 16px;">&nbsp;DB) is a relational database management system (RDBMS) from the&nbsp;</span><b style="font-family: arial, sans-serif; font-size: 16px;">Oracle</b><span style="font-family: arial, sans-serif; font-size: 16px;">&nbsp;Corporation. Originally developed in 1977 by Lawrence Ellison and other developers,&nbsp;</span><b style="font-family: arial, sans-serif; font-size: 16px;">Oracle</b><span style="font-family: arial, sans-serif; font-size: 16px;">&nbsp;DB is one of the most trusted and widely-used relational database engines.</span></p>\r\n', '8-10,11-13', 'SUN', 1, 0, '2016-11-11 10:31:55', '2016-11-11 10:31:55'),
(76, 7, 45, 1, 'years', 1500, 2, '<p>\r\n	<span style="font-family: arial, sans-serif; font-size: 16px;">It&#39;s the most commonly required admission test for grad school. ... Much like the SAT and ACT, the&nbsp;</span><b style="font-family: arial, sans-serif; font-size: 16px;">GRE</b><span style="font-family: arial, sans-serif; font-size: 16px;">&nbsp;exam is a broad assessment of your critical thinking, analytical writing, verbal reasoning, and quantitative reasoning skills &mdash; all skills developed over the course of many years</span></p>\r\n', '8-10,11-15', 'SUN', 1, 0, '2016-11-11 10:32:42', '2016-11-11 10:32:42'),
(77, 7, 61, 6, 'months', 70, 2, '<p>\r\n	<b style="font-family: arial, sans-serif; font-size: 16px;">Mathematics</b><span style="font-family: arial, sans-serif; font-size: 16px;">&nbsp;(from Greek &mu;ά&theta;&eta;&mu;&alpha; m&aacute;thēma, &ldquo;knowledge, study, learning&rdquo;) is the study of topics such as quantity (numbers), structure, space, and change. There is a range of views among&nbsp;</span><b style="font-family: arial, sans-serif; font-size: 16px;">mathematicians</b><span style="font-family: arial, sans-serif; font-size: 16px;">&nbsp;and philosophers as to the exact scope and&nbsp;</span><b style="font-family: arial, sans-serif; font-size: 16px;">definition</b><span style="font-family: arial, sans-serif; font-size: 16px;">&nbsp;of&nbsp;</span><b style="font-family: arial, sans-serif; font-size: 16px;">mathematics</b><span style="font-family: arial, sans-serif; font-size: 16px;">.</span></p>\r\n', '8-12,11-15,17-21', 'SUN', 1, 0, '2016-11-11 10:33:39', '2016-11-11 11:10:00'),
(78, 7, 92, 1, 'years', 1500, 2, '<p>\r\n	<span style="font-family: arial, sans-serif; font-size: 16px;">A logic&nbsp;</span><b style="font-family: arial, sans-serif; font-size: 16px;">gate</b><span style="font-family: arial, sans-serif; font-size: 16px;">&nbsp;is an elementary building block of a digital circuit. Most logic&nbsp;</span><b style="font-family: arial, sans-serif; font-size: 16px;">gates</b><span style="font-family: arial, sans-serif; font-size: 16px;">&nbsp;have two inputs and one output. At any given moment, every terminal is in one of the two binary conditions low (0) or high (1), represented by different voltage levels</span></p>\r\n', '8-10,11-17', 'SUN', 1, 0, '2016-11-11 10:34:35', '2016-11-11 10:34:35'),
(79, 7, 24, 1, 'months', 50, 2, '<p>\r\n	<b style="font-family: arial, sans-serif; font-size: 16px;">Microsoft Office</b><span style="font-family: arial, sans-serif; font-size: 16px;">. Suite of products developed by&nbsp;</span><b style="font-family: arial, sans-serif; font-size: 16px;">Microsoft</b><span style="font-family: arial, sans-serif; font-size: 16px;">&nbsp;Corporation that includes&nbsp;</span><b style="font-family: arial, sans-serif; font-size: 16px;">Microsoft</b><span style="font-family: arial, sans-serif; font-size: 16px;">&nbsp;Word, Excel, Access, Publisher, PowerPoint, and Outlook. Each program serves a different purpose and is compatible with other programs included in the package.</span></p>\r\n', '8-9,10-12', 'SUN', 1, 0, '2016-11-11 10:35:35', '2016-11-11 11:21:25'),
(80, 7, 37, 6, 'months', 600, 2, '<p>\r\n	<b style="font-family: arial, sans-serif; font-size: 16px;">Trigonometry</b><span style="font-family: arial, sans-serif; font-size: 16px;">&nbsp;(from Greek trigōnon, &quot;triangle&quot; and metron, &quot;measure&quot;) is a branch of mathematics that studies relationships involving lengths and angles of triangles.</span></p>\r\n', '8-10,17-20', 'SUN', 1, 0, '2016-11-11 10:36:23', '2016-11-11 10:36:23'),
(81, 7, 16, 2, 'months', 40, 2, '<p>\r\n	<b style="font-family: arial, sans-serif; font-size: 16px;">C#</b><span style="font-family: arial, sans-serif; font-size: 16px;">&nbsp;(pronounced &quot;</span><b style="font-family: arial, sans-serif; font-size: 16px;">C</b><span style="font-family: arial, sans-serif; font-size: 16px;">-</span><b style="font-family: arial, sans-serif; font-size: 16px;">sharp</b><span style="font-family: arial, sans-serif; font-size: 16px;">&quot;) is an object-oriented programming language from Microsoft that aims to combine the computing power of&nbsp;</span><b style="font-family: arial, sans-serif; font-size: 16px;">C</b><span style="font-family: arial, sans-serif; font-size: 16px;">++ with the programming ease of Visual Basic.&nbsp;</span><b style="font-family: arial, sans-serif; font-size: 16px;">C#</b><span style="font-family: arial, sans-serif; font-size: 16px;">&nbsp;is based on C++ and contains features similar to those of Java.</span></p>\r\n', '7-9,10-12,17-20', 'SUN', 1, 0, '2016-11-11 10:37:09', '2016-11-11 11:17:06'),
(82, 7, 19, 2, 'months', 30, 2, '<p>\r\n	<span style="font-weight: bold; color: rgb(106, 106, 106); font-family: arial, sans-serif; font-size: small;">Adobe Flash Player</span><span style="color: rgb(84, 84, 84); font-family: arial, sans-serif; font-size: small;">&nbsp;is the high performance, lightweight, highly expressive client runtime that delivers powerful and consistent user experiences across major.</span></p>\r\n', '9-11,12-13', 'SUN', 1, 0, '2016-11-11 11:35:16', '2016-11-11 11:40:56'),
(83, 64, 13, 2, 'months', 100, 2, '<p>\r\n	<span class="st"><em>C++</em> For C Programmers, Part A from University of California, Santa Cruz. This <em>course</em> is for experienced C programmers who want to program in <em>C++</em></span></p>\r\n', '9-10,15-17,18-19', 'SUN', 1, 0, '2016-11-21 11:08:53', '2016-11-21 11:08:53'),
(84, 65, 13, 3, 'months', 150, 2, '<p>\r\n	<span class="st"><em>C++</em> For C Programmers, Part A from University of California, Santa Cruz. This <em>course</em> is for experienced C programmers who want to program in <em>C++</em></span></p>\r\n', '10-11,13-14,16-18', 'SUN', 1, 0, '2016-11-21 11:14:50', '2016-11-21 11:14:50'),
(85, 66, 14, 4, 'months', 350, 2, '<p>\r\n	<span class="st"><em>Java</em> is a set of computer software and specifications developed by Sun Microsystems, which was later acquired by the Oracle Corporation</span></p>\r\n', '8-9,10-11,16-18', 'SUN', 1, 0, '2016-11-21 11:20:02', '2016-11-21 11:20:02'),
(86, 68, 15, 6, 'months', 500, 2, '<p>\r\n	<span class="st"><em>Adobe Photoshop</em> is a raster graphics editor developed and published by Adobe Systems for macOS and Windows. Photoshop was created in 1988 by Thomas</span></p>\r\n', '10-12,16-18,19-20', 'SUN', 1, 0, '2016-11-21 11:24:01', '2016-11-21 11:24:01'),
(87, 69, 15, 4, 'months', 300, 2, '<p>\r\n	<span class="st"><em>Adobe Photoshop</em> is a raster graphics editor developed and published by Adobe Systems for macOS and Windows. Photoshop was created in 1988 by Thomas</span></p>\r\n', '8-10,12-14,16-18', 'SUN', 1, 0, '2016-11-21 11:25:50', '2016-11-21 11:25:50'),
(88, 69, 20, 2, 'months', 150, 2, '<p>\r\n	<span class="_Tgc"><b>HTML</b> is the standard markup language for creating Web pages. <b>HTML</b> stands for Hyper Text Markup Language. <b>HTML</b> describes the structure of Web pages using markup. <b>HTML</b> elements are the building blocks of <b>HTML</b> pages. <b>HTML</b> elements are represented by tags</span></p>\r\n', '7-8,9-10,15-16,17-18', 'SUN', 1, 0, '2016-11-21 11:33:34', '2016-11-21 11:33:34');
INSERT INTO `pre_tutor_courses` (`id`, `tutor_id`, `course_id`, `duration_value`, `duration_type`, `fee`, `per_credit_value`, `content`, `time_slots`, `days_off`, `status`, `sort_order`, `created_at`, `updated_at`) VALUES
(89, 70, 20, 30, 'days', 100, 2, '<p>\r\n	<span class="_Tgc"><b>HTML</b> is the standard markup language for creating Web pages. <b>HTML</b> stands for Hyper Text Markup Language. <b>HTML</b> describes the structure of Web pages using markup. <b>HTML</b> elements are the building blocks of <b>HTML</b> pages. <b>HTML</b> elements are represented by tags</span></p>\r\n', '10-12,16-18', 'SUN', 1, 0, '2016-11-21 11:35:05', '2016-11-21 11:35:05'),
(90, 72, 20, 3, 'months', 150, 2, '<p>\r\n	<span class="_Tgc"><b>HTML</b> is the standard markup language for creating Web pages. <b>HTML</b> stands for Hyper Text Markup Language. <b>HTML</b> describes the structure of Web pages using markup. <b>HTML</b> elements are the building blocks of <b>HTML</b> pages. <b>HTML</b> elements are represented by tags</span></p>\r\n', '8-9,10-11,15-16,17-18', 'TUE', 1, 0, '2016-11-21 11:36:59', '2016-11-21 11:36:59'),
(91, 72, 15, 4, 'months', 250, 2, '<p>\r\n	<span class="st">Create and enhance your photos, images, 3D artwork, and more with <em>Adobe Photoshop</em> CC, the world&#39;s best imaging and photo editing software</span></p>\r\n', '8-10,15-17,18-20', 'SUN', 1, 0, '2016-11-21 11:38:56', '2016-11-21 11:38:56'),
(92, 64, 23, 1, 'months', 30, 2, '<p>\r\n	<span class="st"><em>Microsoft Access</em> is a unique tool released by Microsoft that provides both the functionality of a database and the programming capabilities to create end-user</span></p>\r\n', '10-12,16-18', 'SUN', 1, 0, '2016-11-22 11:09:04', '2016-11-22 11:09:04'),
(93, 64, 24, 30, 'days', 30, 2, '<p>\r\n	<span class="st"><em>Microsoft Excel</em> is a spreadsheet developed by Microsoft for Windows, macOS, Android and iOS. It features calculation, graphing tools, pivot tables</span></p>\r\n', '8-10,15-17', 'SUN', 1, 0, '2016-11-22 11:12:27', '2016-11-22 11:12:27'),
(94, 63, 24, 20, 'days', 15, 2, '<p>\r\n	<span class="st"><em>Microsoft Excel</em> is a spreadsheet developed by Microsoft for Windows, macOS, Android and iOS. It features calculation, graphing tools, pivot tables</span></p>\r\n', '10-12', 'SUN', 1, 0, '2016-11-22 11:15:23', '2016-11-22 11:15:23'),
(95, 63, 23, 25, 'days', 20, 2, '<p>\r\n	<span class="st"><em>Microsoft Access</em> is a database management system (DBMS) from Microsoft that combines the relational Microsoft Jet Database Engine with a graphical user</span></p>\r\n', '16-18', 'SUN', 1, 0, '2016-11-22 11:16:15', '2016-11-22 11:16:15'),
(96, 63, 25, 2, 'months', 90, 2, '<p>\r\n	<span class="st"><em>Microsoft PowerPoint</em> is a slide show presentation program currently developed by Microsoft, for use on both Microsoft and Apple Macintosh operating systems</span></p>\r\n', '9-11,18-20', 'SUN', 1, 0, '2016-11-22 15:22:44', '2016-11-22 15:22:44'),
(97, 8, 15, 3, 'months', 140, 2, '<p>\r\n	<span style="font-weight: bold; color: rgb(106, 106, 106); font-family: arial, sans-serif; font-size: small;">Photoshop</span><span style="color: rgb(84, 84, 84); font-family: arial, sans-serif; font-size: small;">&nbsp;CC.</span><wbr style="color: rgb(84, 84, 84); font-family: arial, sans-serif; font-size: small;" /><span style="color: rgb(84, 84, 84); font-family: arial, sans-serif; font-size: small;">&nbsp;Create incredible images using the world&#39;s best digital imaging software.</span><wbr style="color: rgb(84, 84, 84); font-family: arial, sans-serif; font-size: small;" /><span style="color: rgb(84, 84, 84); font-family: arial, sans-serif; font-size: small;">&nbsp;... Popular searches: Photo editor, Photo editing, Edit photos, Photo editing software, Image resizer</span></p>\r\n', '10-12', 'SUN', 1, 0, '2016-11-22 17:37:51', '2016-11-22 17:37:51'),
(98, 7, 28, 2, 'months', 150, 2, '<p>\r\n	<span style="font-weight: bold; color: rgb(106, 106, 106); font-family: arial, sans-serif;">MySQL</span><span style="color: rgb(84, 84, 84); font-family: arial, sans-serif; font-size: small;">&nbsp;is the most popular Open Source Relational SQL database management system.&nbsp;</span><span style="font-weight: bold; color: rgb(106, 106, 106); font-family: arial, sans-serif;">MySQL</span><span style="color: rgb(84, 84, 84); font-family: arial, sans-serif; font-size: small;">&nbsp;is one of the best RDBMS being used for developing&nbsp;</span></p>\r\n', '10-12', 'SUN', 1, 0, '2016-11-23 16:58:05', '2016-11-23 16:58:05'),
(99, 105, 13, 20, 'days', 20, 2, '<p>\r\n	hfghdhdgfhdgfghdf</p>\r\n', '2-4,5-6,7-9', 'SUN', 1, 0, '2017-02-03 15:44:33', '2017-02-03 15:44:33');

-- --------------------------------------------------------

--
-- Table structure for table `pre_tutor_locations`
--

CREATE TABLE `pre_tutor_locations` (
  `id` int(11) NOT NULL,
  `tutor_id` int(11) NOT NULL,
  `location_id` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1-active, 0-inactive',
  `sort_order` int(11) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='locations in which tutor willing to provide his services';

--
-- Dumping data for table `pre_tutor_locations`
--

INSERT INTO `pre_tutor_locations` (`id`, `tutor_id`, `location_id`, `status`, `sort_order`, `created_at`) VALUES
(175, 55, 14, 1, 0, '2016-11-10 12:28:39'),
(176, 55, 16, 1, 0, '2016-11-10 12:28:39'),
(177, 55, 19, 1, 0, '2016-11-10 12:28:39'),
(178, 55, 21, 1, 0, '2016-11-10 12:28:39'),
(179, 55, 4, 1, 0, '2016-11-10 12:28:39'),
(180, 55, 9, 1, 0, '2016-11-10 12:28:39'),
(181, 55, 30, 1, 0, '2016-11-10 12:28:39'),
(182, 55, 32, 1, 0, '2016-11-10 12:28:39'),
(183, 55, 53, 1, 0, '2016-11-10 12:28:39'),
(184, 55, 54, 1, 0, '2016-11-10 12:28:39'),
(185, 55, 55, 1, 0, '2016-11-10 12:28:39'),
(186, 55, 60, 1, 0, '2016-11-10 12:28:39'),
(187, 55, 61, 1, 0, '2016-11-10 12:28:39'),
(188, 55, 65, 1, 0, '2016-11-10 12:28:39'),
(189, 55, 66, 1, 0, '2016-11-10 12:28:39'),
(190, 55, 72, 1, 0, '2016-11-10 12:28:39'),
(191, 55, 110, 1, 0, '2016-11-10 12:28:39'),
(192, 55, 111, 1, 0, '2016-11-10 12:28:39'),
(514, 7, 13, 1, 0, '2016-11-21 10:45:53'),
(515, 7, 14, 1, 0, '2016-11-21 10:45:53'),
(516, 7, 15, 1, 0, '2016-11-21 10:45:53'),
(517, 7, 16, 1, 0, '2016-11-21 10:45:53'),
(518, 7, 17, 1, 0, '2016-11-21 10:45:53'),
(519, 7, 18, 1, 0, '2016-11-21 10:45:53'),
(520, 7, 19, 1, 0, '2016-11-21 10:45:53'),
(521, 7, 20, 1, 0, '2016-11-21 10:45:53'),
(522, 7, 21, 1, 0, '2016-11-21 10:45:53'),
(523, 7, 22, 1, 0, '2016-11-21 10:45:53'),
(524, 7, 3, 1, 0, '2016-11-21 10:45:53'),
(525, 7, 4, 1, 0, '2016-11-21 10:45:53'),
(526, 7, 5, 1, 0, '2016-11-21 10:45:53'),
(527, 7, 6, 1, 0, '2016-11-21 10:45:53'),
(528, 7, 7, 1, 0, '2016-11-21 10:45:53'),
(529, 7, 8, 1, 0, '2016-11-21 10:45:53'),
(530, 7, 9, 1, 0, '2016-11-21 10:45:53'),
(531, 7, 10, 1, 0, '2016-11-21 10:45:53'),
(532, 7, 11, 1, 0, '2016-11-21 10:45:53'),
(533, 7, 12, 1, 0, '2016-11-21 10:45:53'),
(534, 7, 24, 1, 0, '2016-11-21 10:45:53'),
(535, 7, 25, 1, 0, '2016-11-21 10:45:53'),
(536, 7, 26, 1, 0, '2016-11-21 10:45:53'),
(537, 7, 27, 1, 0, '2016-11-21 10:45:53'),
(538, 7, 29, 1, 0, '2016-11-21 10:45:53'),
(539, 7, 30, 1, 0, '2016-11-21 10:45:53'),
(540, 7, 31, 1, 0, '2016-11-21 10:45:53'),
(541, 7, 32, 1, 0, '2016-11-21 10:45:53'),
(542, 7, 33, 1, 0, '2016-11-21 10:45:53'),
(543, 7, 47, 1, 0, '2016-11-21 10:45:53'),
(544, 7, 58, 1, 0, '2016-11-21 10:45:53'),
(545, 7, 60, 1, 0, '2016-11-21 10:45:53'),
(546, 7, 61, 1, 0, '2016-11-21 10:45:53'),
(547, 7, 73, 1, 0, '2016-11-21 10:45:53'),
(548, 7, 74, 1, 0, '2016-11-21 10:45:53'),
(549, 7, 79, 1, 0, '2016-11-21 10:45:53'),
(550, 7, 80, 1, 0, '2016-11-21 10:45:53'),
(551, 8, 13, 1, 0, '2016-11-21 10:47:16'),
(552, 8, 14, 1, 0, '2016-11-21 10:47:16'),
(553, 8, 15, 1, 0, '2016-11-21 10:47:16'),
(554, 8, 16, 1, 0, '2016-11-21 10:47:16'),
(555, 8, 17, 1, 0, '2016-11-21 10:47:16'),
(556, 8, 18, 1, 0, '2016-11-21 10:47:16'),
(557, 8, 19, 1, 0, '2016-11-21 10:47:16'),
(558, 8, 20, 1, 0, '2016-11-21 10:47:16'),
(559, 8, 21, 1, 0, '2016-11-21 10:47:16'),
(560, 8, 22, 1, 0, '2016-11-21 10:47:16'),
(561, 8, 3, 1, 0, '2016-11-21 10:47:16'),
(562, 8, 4, 1, 0, '2016-11-21 10:47:16'),
(563, 8, 5, 1, 0, '2016-11-21 10:47:16'),
(564, 8, 6, 1, 0, '2016-11-21 10:47:16'),
(565, 8, 7, 1, 0, '2016-11-21 10:47:16'),
(566, 8, 8, 1, 0, '2016-11-21 10:47:16'),
(567, 8, 9, 1, 0, '2016-11-21 10:47:16'),
(568, 8, 10, 1, 0, '2016-11-21 10:47:16'),
(569, 8, 11, 1, 0, '2016-11-21 10:47:16'),
(570, 8, 12, 1, 0, '2016-11-21 10:47:16'),
(571, 8, 24, 1, 0, '2016-11-21 10:47:16'),
(572, 8, 25, 1, 0, '2016-11-21 10:47:16'),
(573, 8, 26, 1, 0, '2016-11-21 10:47:16'),
(574, 8, 27, 1, 0, '2016-11-21 10:47:16'),
(575, 8, 28, 1, 0, '2016-11-21 10:47:16'),
(576, 8, 29, 1, 0, '2016-11-21 10:47:16'),
(577, 8, 30, 1, 0, '2016-11-21 10:47:16'),
(578, 8, 31, 1, 0, '2016-11-21 10:47:16'),
(579, 8, 32, 1, 0, '2016-11-21 10:47:16'),
(580, 8, 33, 1, 0, '2016-11-21 10:47:16'),
(581, 8, 36, 1, 0, '2016-11-21 10:47:16'),
(582, 8, 38, 1, 0, '2016-11-21 10:47:16'),
(583, 8, 39, 1, 0, '2016-11-21 10:47:16'),
(584, 9, 13, 1, 0, '2016-11-21 10:48:19'),
(585, 9, 14, 1, 0, '2016-11-21 10:48:19'),
(586, 9, 15, 1, 0, '2016-11-21 10:48:19'),
(587, 9, 16, 1, 0, '2016-11-21 10:48:19'),
(588, 9, 17, 1, 0, '2016-11-21 10:48:19'),
(589, 9, 18, 1, 0, '2016-11-21 10:48:19'),
(590, 9, 19, 1, 0, '2016-11-21 10:48:19'),
(591, 9, 20, 1, 0, '2016-11-21 10:48:19'),
(592, 9, 21, 1, 0, '2016-11-21 10:48:19'),
(593, 9, 22, 1, 0, '2016-11-21 10:48:19'),
(594, 9, 3, 1, 0, '2016-11-21 10:48:19'),
(595, 9, 4, 1, 0, '2016-11-21 10:48:19'),
(596, 9, 5, 1, 0, '2016-11-21 10:48:19'),
(597, 9, 6, 1, 0, '2016-11-21 10:48:19'),
(598, 9, 7, 1, 0, '2016-11-21 10:48:19'),
(599, 9, 8, 1, 0, '2016-11-21 10:48:19'),
(600, 9, 9, 1, 0, '2016-11-21 10:48:19'),
(601, 9, 10, 1, 0, '2016-11-21 10:48:19'),
(602, 9, 11, 1, 0, '2016-11-21 10:48:19'),
(603, 9, 12, 1, 0, '2016-11-21 10:48:19'),
(604, 9, 24, 1, 0, '2016-11-21 10:48:19'),
(605, 9, 25, 1, 0, '2016-11-21 10:48:19'),
(606, 9, 26, 1, 0, '2016-11-21 10:48:19'),
(607, 9, 27, 1, 0, '2016-11-21 10:48:19'),
(608, 9, 28, 1, 0, '2016-11-21 10:48:19'),
(609, 9, 29, 1, 0, '2016-11-21 10:48:19'),
(610, 9, 30, 1, 0, '2016-11-21 10:48:19'),
(611, 9, 31, 1, 0, '2016-11-21 10:48:19'),
(612, 9, 32, 1, 0, '2016-11-21 10:48:19'),
(613, 9, 33, 1, 0, '2016-11-21 10:48:19'),
(614, 9, 71, 1, 0, '2016-11-21 10:48:19'),
(615, 9, 72, 1, 0, '2016-11-21 10:48:19'),
(616, 9, 110, 1, 0, '2016-11-21 10:48:19'),
(617, 9, 111, 1, 0, '2016-11-21 10:48:19'),
(618, 10, 13, 1, 0, '2016-11-21 10:49:05'),
(619, 10, 14, 1, 0, '2016-11-21 10:49:05'),
(620, 10, 15, 1, 0, '2016-11-21 10:49:05'),
(621, 10, 16, 1, 0, '2016-11-21 10:49:05'),
(622, 10, 17, 1, 0, '2016-11-21 10:49:05'),
(623, 10, 18, 1, 0, '2016-11-21 10:49:05'),
(624, 10, 19, 1, 0, '2016-11-21 10:49:05'),
(625, 10, 20, 1, 0, '2016-11-21 10:49:05'),
(626, 10, 21, 1, 0, '2016-11-21 10:49:05'),
(627, 10, 22, 1, 0, '2016-11-21 10:49:05'),
(628, 10, 3, 1, 0, '2016-11-21 10:49:05'),
(629, 10, 4, 1, 0, '2016-11-21 10:49:05'),
(630, 10, 5, 1, 0, '2016-11-21 10:49:05'),
(631, 10, 6, 1, 0, '2016-11-21 10:49:05'),
(632, 10, 7, 1, 0, '2016-11-21 10:49:05'),
(633, 10, 8, 1, 0, '2016-11-21 10:49:05'),
(634, 10, 9, 1, 0, '2016-11-21 10:49:05'),
(635, 10, 10, 1, 0, '2016-11-21 10:49:05'),
(636, 10, 11, 1, 0, '2016-11-21 10:49:05'),
(637, 10, 12, 1, 0, '2016-11-21 10:49:05'),
(638, 10, 24, 1, 0, '2016-11-21 10:49:05'),
(639, 10, 25, 1, 0, '2016-11-21 10:49:05'),
(640, 10, 26, 1, 0, '2016-11-21 10:49:05'),
(641, 10, 27, 1, 0, '2016-11-21 10:49:05'),
(642, 10, 28, 1, 0, '2016-11-21 10:49:05'),
(643, 10, 29, 1, 0, '2016-11-21 10:49:05'),
(644, 10, 30, 1, 0, '2016-11-21 10:49:05'),
(645, 10, 31, 1, 0, '2016-11-21 10:49:05'),
(646, 10, 32, 1, 0, '2016-11-21 10:49:05'),
(647, 10, 33, 1, 0, '2016-11-21 10:49:05'),
(648, 10, 38, 1, 0, '2016-11-21 10:49:05'),
(649, 10, 39, 1, 0, '2016-11-21 10:49:05'),
(650, 10, 71, 1, 0, '2016-11-21 10:49:05'),
(651, 10, 72, 1, 0, '2016-11-21 10:49:05'),
(652, 10, 73, 1, 0, '2016-11-21 10:49:05'),
(653, 10, 74, 1, 0, '2016-11-21 10:49:05'),
(654, 10, 75, 1, 0, '2016-11-21 10:49:05'),
(655, 11, 13, 1, 0, '2016-11-21 10:49:43'),
(656, 11, 14, 1, 0, '2016-11-21 10:49:43'),
(657, 11, 15, 1, 0, '2016-11-21 10:49:43'),
(658, 11, 16, 1, 0, '2016-11-21 10:49:43'),
(659, 11, 17, 1, 0, '2016-11-21 10:49:43'),
(660, 11, 18, 1, 0, '2016-11-21 10:49:43'),
(661, 11, 19, 1, 0, '2016-11-21 10:49:43'),
(662, 11, 20, 1, 0, '2016-11-21 10:49:43'),
(663, 11, 21, 1, 0, '2016-11-21 10:49:43'),
(664, 11, 22, 1, 0, '2016-11-21 10:49:43'),
(665, 11, 3, 1, 0, '2016-11-21 10:49:43'),
(666, 11, 4, 1, 0, '2016-11-21 10:49:43'),
(667, 11, 5, 1, 0, '2016-11-21 10:49:43'),
(668, 11, 6, 1, 0, '2016-11-21 10:49:43'),
(669, 11, 7, 1, 0, '2016-11-21 10:49:43'),
(670, 11, 8, 1, 0, '2016-11-21 10:49:43'),
(671, 11, 9, 1, 0, '2016-11-21 10:49:43'),
(672, 11, 10, 1, 0, '2016-11-21 10:49:43'),
(673, 11, 11, 1, 0, '2016-11-21 10:49:43'),
(674, 11, 12, 1, 0, '2016-11-21 10:49:43'),
(675, 11, 24, 1, 0, '2016-11-21 10:49:43'),
(676, 11, 25, 1, 0, '2016-11-21 10:49:43'),
(677, 11, 26, 1, 0, '2016-11-21 10:49:43'),
(678, 11, 27, 1, 0, '2016-11-21 10:49:43'),
(679, 11, 28, 1, 0, '2016-11-21 10:49:43'),
(680, 11, 29, 1, 0, '2016-11-21 10:49:43'),
(681, 11, 30, 1, 0, '2016-11-21 10:49:43'),
(682, 11, 31, 1, 0, '2016-11-21 10:49:43'),
(683, 11, 32, 1, 0, '2016-11-21 10:49:43'),
(684, 11, 33, 1, 0, '2016-11-21 10:49:43'),
(685, 11, 58, 1, 0, '2016-11-21 10:49:43'),
(686, 11, 59, 1, 0, '2016-11-21 10:49:43'),
(687, 11, 60, 1, 0, '2016-11-21 10:49:43'),
(688, 11, 61, 1, 0, '2016-11-21 10:49:43'),
(689, 11, 71, 1, 0, '2016-11-21 10:49:43'),
(690, 11, 72, 1, 0, '2016-11-21 10:49:43'),
(691, 11, 74, 1, 0, '2016-11-21 10:49:43'),
(692, 11, 77, 1, 0, '2016-11-21 10:49:43'),
(693, 11, 78, 1, 0, '2016-11-21 10:49:43'),
(694, 11, 79, 1, 0, '2016-11-21 10:49:43'),
(695, 11, 80, 1, 0, '2016-11-21 10:49:43'),
(696, 11, 92, 1, 0, '2016-11-21 10:49:43'),
(697, 11, 93, 1, 0, '2016-11-21 10:49:43'),
(698, 11, 94, 1, 0, '2016-11-21 10:49:43'),
(699, 11, 95, 1, 0, '2016-11-21 10:49:43'),
(700, 11, 97, 1, 0, '2016-11-21 10:49:43'),
(701, 53, 13, 1, 0, '2016-11-21 10:59:35'),
(702, 53, 14, 1, 0, '2016-11-21 10:59:35'),
(703, 53, 15, 1, 0, '2016-11-21 10:59:35'),
(704, 53, 16, 1, 0, '2016-11-21 10:59:35'),
(705, 53, 17, 1, 0, '2016-11-21 10:59:35'),
(706, 53, 18, 1, 0, '2016-11-21 10:59:35'),
(707, 53, 19, 1, 0, '2016-11-21 10:59:35'),
(708, 53, 20, 1, 0, '2016-11-21 10:59:35'),
(709, 53, 21, 1, 0, '2016-11-21 10:59:35'),
(710, 53, 22, 1, 0, '2016-11-21 10:59:35'),
(711, 53, 3, 1, 0, '2016-11-21 10:59:35'),
(712, 53, 4, 1, 0, '2016-11-21 10:59:35'),
(713, 53, 5, 1, 0, '2016-11-21 10:59:35'),
(714, 53, 6, 1, 0, '2016-11-21 10:59:35'),
(715, 53, 7, 1, 0, '2016-11-21 10:59:35'),
(716, 53, 8, 1, 0, '2016-11-21 10:59:35'),
(717, 53, 9, 1, 0, '2016-11-21 10:59:35'),
(718, 53, 10, 1, 0, '2016-11-21 10:59:35'),
(719, 53, 11, 1, 0, '2016-11-21 10:59:35'),
(720, 53, 12, 1, 0, '2016-11-21 10:59:35'),
(721, 53, 24, 1, 0, '2016-11-21 10:59:35'),
(722, 53, 25, 1, 0, '2016-11-21 10:59:35'),
(723, 53, 26, 1, 0, '2016-11-21 10:59:35'),
(724, 53, 27, 1, 0, '2016-11-21 10:59:35'),
(725, 53, 28, 1, 0, '2016-11-21 10:59:35'),
(726, 53, 29, 1, 0, '2016-11-21 10:59:35'),
(727, 53, 30, 1, 0, '2016-11-21 10:59:35'),
(728, 53, 31, 1, 0, '2016-11-21 10:59:35'),
(729, 53, 32, 1, 0, '2016-11-21 10:59:35'),
(730, 53, 33, 1, 0, '2016-11-21 10:59:35'),
(731, 53, 35, 1, 0, '2016-11-21 10:59:35'),
(732, 53, 36, 1, 0, '2016-11-21 10:59:35'),
(733, 53, 37, 1, 0, '2016-11-21 10:59:35'),
(734, 53, 38, 1, 0, '2016-11-21 10:59:35'),
(735, 53, 41, 1, 0, '2016-11-21 10:59:35'),
(736, 53, 43, 1, 0, '2016-11-21 10:59:35'),
(737, 53, 45, 1, 0, '2016-11-21 10:59:35'),
(738, 53, 49, 1, 0, '2016-11-21 10:59:35'),
(739, 53, 50, 1, 0, '2016-11-21 10:59:35'),
(740, 53, 51, 1, 0, '2016-11-21 10:59:35'),
(741, 53, 52, 1, 0, '2016-11-21 10:59:35'),
(742, 53, 53, 1, 0, '2016-11-21 10:59:35'),
(743, 53, 54, 1, 0, '2016-11-21 10:59:35'),
(744, 53, 55, 1, 0, '2016-11-21 10:59:35'),
(745, 53, 56, 1, 0, '2016-11-21 10:59:35'),
(746, 53, 58, 1, 0, '2016-11-21 10:59:35'),
(747, 53, 59, 1, 0, '2016-11-21 10:59:35'),
(748, 53, 61, 1, 0, '2016-11-21 10:59:35'),
(749, 53, 65, 1, 0, '2016-11-21 10:59:35'),
(750, 53, 66, 1, 0, '2016-11-21 10:59:35'),
(751, 53, 67, 1, 0, '2016-11-21 10:59:35'),
(752, 53, 68, 1, 0, '2016-11-21 10:59:35'),
(753, 53, 69, 1, 0, '2016-11-21 10:59:35'),
(754, 53, 72, 1, 0, '2016-11-21 10:59:35'),
(755, 53, 73, 1, 0, '2016-11-21 10:59:35'),
(756, 53, 75, 1, 0, '2016-11-21 10:59:35'),
(757, 53, 77, 1, 0, '2016-11-21 10:59:35'),
(758, 53, 78, 1, 0, '2016-11-21 10:59:35'),
(759, 54, 13, 1, 0, '2016-11-21 11:00:19'),
(760, 54, 14, 1, 0, '2016-11-21 11:00:19'),
(761, 54, 15, 1, 0, '2016-11-21 11:00:19'),
(762, 54, 16, 1, 0, '2016-11-21 11:00:19'),
(763, 54, 17, 1, 0, '2016-11-21 11:00:19'),
(764, 54, 18, 1, 0, '2016-11-21 11:00:19'),
(765, 54, 19, 1, 0, '2016-11-21 11:00:19'),
(766, 54, 20, 1, 0, '2016-11-21 11:00:19'),
(767, 54, 21, 1, 0, '2016-11-21 11:00:19'),
(768, 54, 22, 1, 0, '2016-11-21 11:00:19'),
(769, 54, 3, 1, 0, '2016-11-21 11:00:19'),
(770, 54, 4, 1, 0, '2016-11-21 11:00:19'),
(771, 54, 5, 1, 0, '2016-11-21 11:00:19'),
(772, 54, 6, 1, 0, '2016-11-21 11:00:19'),
(773, 54, 7, 1, 0, '2016-11-21 11:00:19'),
(774, 54, 8, 1, 0, '2016-11-21 11:00:19'),
(775, 54, 9, 1, 0, '2016-11-21 11:00:19'),
(776, 54, 10, 1, 0, '2016-11-21 11:00:19'),
(777, 54, 11, 1, 0, '2016-11-21 11:00:19'),
(778, 54, 12, 1, 0, '2016-11-21 11:00:19'),
(779, 54, 24, 1, 0, '2016-11-21 11:00:19'),
(780, 54, 25, 1, 0, '2016-11-21 11:00:19'),
(781, 54, 26, 1, 0, '2016-11-21 11:00:19'),
(782, 54, 27, 1, 0, '2016-11-21 11:00:19'),
(783, 54, 28, 1, 0, '2016-11-21 11:00:19'),
(784, 54, 29, 1, 0, '2016-11-21 11:00:19'),
(785, 54, 30, 1, 0, '2016-11-21 11:00:19'),
(786, 54, 31, 1, 0, '2016-11-21 11:00:19'),
(787, 54, 32, 1, 0, '2016-11-21 11:00:19'),
(788, 54, 33, 1, 0, '2016-11-21 11:00:19'),
(789, 54, 41, 1, 0, '2016-11-21 11:00:19'),
(790, 54, 42, 1, 0, '2016-11-21 11:00:19'),
(791, 54, 58, 1, 0, '2016-11-21 11:00:19'),
(792, 54, 59, 1, 0, '2016-11-21 11:00:19'),
(793, 54, 65, 1, 0, '2016-11-21 11:00:19'),
(794, 54, 66, 1, 0, '2016-11-21 11:00:19'),
(795, 54, 71, 1, 0, '2016-11-21 11:00:19'),
(796, 54, 72, 1, 0, '2016-11-21 11:00:19'),
(797, 54, 92, 1, 0, '2016-11-21 11:00:19'),
(798, 54, 93, 1, 0, '2016-11-21 11:00:19'),
(799, 54, 110, 1, 0, '2016-11-21 11:00:19'),
(800, 54, 111, 1, 0, '2016-11-21 11:00:19'),
(801, 57, 13, 1, 0, '2016-11-21 11:01:24'),
(802, 57, 14, 1, 0, '2016-11-21 11:01:24'),
(803, 57, 15, 1, 0, '2016-11-21 11:01:24'),
(804, 57, 16, 1, 0, '2016-11-21 11:01:24'),
(805, 57, 17, 1, 0, '2016-11-21 11:01:24'),
(806, 57, 18, 1, 0, '2016-11-21 11:01:24'),
(807, 57, 19, 1, 0, '2016-11-21 11:01:24'),
(808, 57, 20, 1, 0, '2016-11-21 11:01:24'),
(809, 57, 21, 1, 0, '2016-11-21 11:01:24'),
(810, 57, 22, 1, 0, '2016-11-21 11:01:24'),
(811, 57, 3, 1, 0, '2016-11-21 11:01:24'),
(812, 57, 4, 1, 0, '2016-11-21 11:01:24'),
(813, 57, 5, 1, 0, '2016-11-21 11:01:24'),
(814, 57, 6, 1, 0, '2016-11-21 11:01:24'),
(815, 57, 7, 1, 0, '2016-11-21 11:01:24'),
(816, 57, 8, 1, 0, '2016-11-21 11:01:24'),
(817, 57, 9, 1, 0, '2016-11-21 11:01:24'),
(818, 57, 10, 1, 0, '2016-11-21 11:01:24'),
(819, 57, 11, 1, 0, '2016-11-21 11:01:24'),
(820, 57, 12, 1, 0, '2016-11-21 11:01:24'),
(821, 57, 24, 1, 0, '2016-11-21 11:01:24'),
(822, 57, 25, 1, 0, '2016-11-21 11:01:24'),
(823, 57, 26, 1, 0, '2016-11-21 11:01:24'),
(824, 57, 27, 1, 0, '2016-11-21 11:01:24'),
(825, 57, 28, 1, 0, '2016-11-21 11:01:24'),
(826, 57, 29, 1, 0, '2016-11-21 11:01:24'),
(827, 57, 30, 1, 0, '2016-11-21 11:01:24'),
(828, 57, 31, 1, 0, '2016-11-21 11:01:24'),
(829, 57, 32, 1, 0, '2016-11-21 11:01:24'),
(830, 57, 33, 1, 0, '2016-11-21 11:01:24'),
(831, 57, 38, 1, 0, '2016-11-21 11:01:24'),
(832, 57, 41, 1, 0, '2016-11-21 11:01:24'),
(833, 57, 42, 1, 0, '2016-11-21 11:01:24'),
(834, 57, 43, 1, 0, '2016-11-21 11:01:24'),
(835, 57, 47, 1, 0, '2016-11-21 11:01:24'),
(836, 57, 49, 1, 0, '2016-11-21 11:01:24'),
(837, 57, 50, 1, 0, '2016-11-21 11:01:24'),
(838, 57, 54, 1, 0, '2016-11-21 11:01:24'),
(839, 57, 58, 1, 0, '2016-11-21 11:01:24'),
(840, 57, 59, 1, 0, '2016-11-21 11:01:24'),
(841, 57, 60, 1, 0, '2016-11-21 11:01:24'),
(842, 57, 61, 1, 0, '2016-11-21 11:01:24'),
(843, 57, 65, 1, 0, '2016-11-21 11:01:24'),
(844, 57, 66, 1, 0, '2016-11-21 11:01:24'),
(845, 57, 67, 1, 0, '2016-11-21 11:01:24'),
(846, 57, 71, 1, 0, '2016-11-21 11:01:24'),
(847, 57, 72, 1, 0, '2016-11-21 11:01:24'),
(848, 57, 77, 1, 0, '2016-11-21 11:01:24'),
(849, 57, 78, 1, 0, '2016-11-21 11:01:24'),
(850, 57, 87, 1, 0, '2016-11-21 11:01:24'),
(851, 57, 88, 1, 0, '2016-11-21 11:01:24'),
(852, 57, 93, 1, 0, '2016-11-21 11:01:24'),
(853, 57, 94, 1, 0, '2016-11-21 11:01:24'),
(854, 58, 13, 1, 0, '2016-11-21 11:02:11'),
(855, 58, 14, 1, 0, '2016-11-21 11:02:11'),
(856, 58, 15, 1, 0, '2016-11-21 11:02:11'),
(857, 58, 16, 1, 0, '2016-11-21 11:02:11'),
(858, 58, 17, 1, 0, '2016-11-21 11:02:11'),
(859, 58, 18, 1, 0, '2016-11-21 11:02:11'),
(860, 58, 19, 1, 0, '2016-11-21 11:02:11'),
(861, 58, 20, 1, 0, '2016-11-21 11:02:11'),
(862, 58, 21, 1, 0, '2016-11-21 11:02:11'),
(863, 58, 22, 1, 0, '2016-11-21 11:02:11'),
(864, 58, 3, 1, 0, '2016-11-21 11:02:11'),
(865, 58, 4, 1, 0, '2016-11-21 11:02:11'),
(866, 58, 5, 1, 0, '2016-11-21 11:02:11'),
(867, 58, 6, 1, 0, '2016-11-21 11:02:11'),
(868, 58, 7, 1, 0, '2016-11-21 11:02:11'),
(869, 58, 8, 1, 0, '2016-11-21 11:02:11'),
(870, 58, 9, 1, 0, '2016-11-21 11:02:11'),
(871, 58, 10, 1, 0, '2016-11-21 11:02:11'),
(872, 58, 11, 1, 0, '2016-11-21 11:02:11'),
(873, 58, 12, 1, 0, '2016-11-21 11:02:11'),
(874, 58, 24, 1, 0, '2016-11-21 11:02:11'),
(875, 58, 25, 1, 0, '2016-11-21 11:02:11'),
(876, 58, 26, 1, 0, '2016-11-21 11:02:11'),
(877, 58, 27, 1, 0, '2016-11-21 11:02:11'),
(878, 58, 28, 1, 0, '2016-11-21 11:02:11'),
(879, 58, 29, 1, 0, '2016-11-21 11:02:11'),
(880, 58, 30, 1, 0, '2016-11-21 11:02:11'),
(881, 58, 31, 1, 0, '2016-11-21 11:02:11'),
(882, 58, 32, 1, 0, '2016-11-21 11:02:11'),
(883, 58, 33, 1, 0, '2016-11-21 11:02:11'),
(884, 58, 41, 1, 0, '2016-11-21 11:02:11'),
(885, 58, 42, 1, 0, '2016-11-21 11:02:11'),
(886, 58, 53, 1, 0, '2016-11-21 11:02:11'),
(887, 58, 54, 1, 0, '2016-11-21 11:02:11'),
(888, 58, 58, 1, 0, '2016-11-21 11:02:11'),
(889, 58, 59, 1, 0, '2016-11-21 11:02:11'),
(890, 58, 65, 1, 0, '2016-11-21 11:02:11'),
(891, 58, 66, 1, 0, '2016-11-21 11:02:11'),
(892, 58, 71, 1, 0, '2016-11-21 11:02:11'),
(893, 58, 72, 1, 0, '2016-11-21 11:02:11'),
(894, 58, 77, 1, 0, '2016-11-21 11:02:11'),
(895, 58, 78, 1, 0, '2016-11-21 11:02:11'),
(896, 58, 86, 1, 0, '2016-11-21 11:02:11'),
(897, 58, 87, 1, 0, '2016-11-21 11:02:11'),
(898, 58, 93, 1, 0, '2016-11-21 11:02:11'),
(899, 58, 95, 1, 0, '2016-11-21 11:02:11'),
(900, 58, 98, 1, 0, '2016-11-21 11:02:11'),
(901, 59, 13, 1, 0, '2016-11-21 11:03:31'),
(902, 59, 14, 1, 0, '2016-11-21 11:03:31'),
(903, 59, 15, 1, 0, '2016-11-21 11:03:31'),
(904, 59, 16, 1, 0, '2016-11-21 11:03:31'),
(905, 59, 17, 1, 0, '2016-11-21 11:03:31'),
(906, 59, 18, 1, 0, '2016-11-21 11:03:31'),
(907, 59, 19, 1, 0, '2016-11-21 11:03:31'),
(908, 59, 20, 1, 0, '2016-11-21 11:03:31'),
(909, 59, 21, 1, 0, '2016-11-21 11:03:31'),
(910, 59, 22, 1, 0, '2016-11-21 11:03:31'),
(911, 59, 3, 1, 0, '2016-11-21 11:03:31'),
(912, 59, 4, 1, 0, '2016-11-21 11:03:31'),
(913, 59, 5, 1, 0, '2016-11-21 11:03:31'),
(914, 59, 6, 1, 0, '2016-11-21 11:03:31'),
(915, 59, 7, 1, 0, '2016-11-21 11:03:31'),
(916, 59, 8, 1, 0, '2016-11-21 11:03:31'),
(917, 59, 9, 1, 0, '2016-11-21 11:03:31'),
(918, 59, 10, 1, 0, '2016-11-21 11:03:31'),
(919, 59, 11, 1, 0, '2016-11-21 11:03:31'),
(920, 59, 12, 1, 0, '2016-11-21 11:03:31'),
(921, 59, 24, 1, 0, '2016-11-21 11:03:31'),
(922, 59, 25, 1, 0, '2016-11-21 11:03:31'),
(923, 59, 26, 1, 0, '2016-11-21 11:03:31'),
(924, 59, 27, 1, 0, '2016-11-21 11:03:31'),
(925, 59, 28, 1, 0, '2016-11-21 11:03:31'),
(926, 59, 29, 1, 0, '2016-11-21 11:03:31'),
(927, 59, 30, 1, 0, '2016-11-21 11:03:31'),
(928, 59, 31, 1, 0, '2016-11-21 11:03:31'),
(929, 59, 32, 1, 0, '2016-11-21 11:03:31'),
(930, 59, 33, 1, 0, '2016-11-21 11:03:31'),
(931, 59, 41, 1, 0, '2016-11-21 11:03:31'),
(932, 59, 42, 1, 0, '2016-11-21 11:03:31'),
(933, 59, 43, 1, 0, '2016-11-21 11:03:31'),
(934, 59, 53, 1, 0, '2016-11-21 11:03:31'),
(935, 59, 54, 1, 0, '2016-11-21 11:03:31'),
(936, 59, 58, 1, 0, '2016-11-21 11:03:31'),
(937, 59, 59, 1, 0, '2016-11-21 11:03:31'),
(938, 59, 65, 1, 0, '2016-11-21 11:03:31'),
(939, 59, 66, 1, 0, '2016-11-21 11:03:31'),
(940, 59, 72, 1, 0, '2016-11-21 11:03:31'),
(941, 59, 73, 1, 0, '2016-11-21 11:03:31'),
(942, 59, 74, 1, 0, '2016-11-21 11:03:31'),
(943, 59, 77, 1, 0, '2016-11-21 11:03:31'),
(944, 59, 78, 1, 0, '2016-11-21 11:03:31'),
(945, 60, 13, 1, 0, '2016-11-21 11:04:21'),
(946, 60, 14, 1, 0, '2016-11-21 11:04:21'),
(947, 60, 15, 1, 0, '2016-11-21 11:04:21'),
(948, 60, 16, 1, 0, '2016-11-21 11:04:21'),
(949, 60, 17, 1, 0, '2016-11-21 11:04:21'),
(950, 60, 18, 1, 0, '2016-11-21 11:04:21'),
(951, 60, 19, 1, 0, '2016-11-21 11:04:21'),
(952, 60, 20, 1, 0, '2016-11-21 11:04:21'),
(953, 60, 21, 1, 0, '2016-11-21 11:04:21'),
(954, 60, 22, 1, 0, '2016-11-21 11:04:21'),
(955, 60, 3, 1, 0, '2016-11-21 11:04:21'),
(956, 60, 4, 1, 0, '2016-11-21 11:04:21'),
(957, 60, 5, 1, 0, '2016-11-21 11:04:21'),
(958, 60, 6, 1, 0, '2016-11-21 11:04:21'),
(959, 60, 7, 1, 0, '2016-11-21 11:04:21'),
(960, 60, 8, 1, 0, '2016-11-21 11:04:21'),
(961, 60, 9, 1, 0, '2016-11-21 11:04:21'),
(962, 60, 10, 1, 0, '2016-11-21 11:04:21'),
(963, 60, 11, 1, 0, '2016-11-21 11:04:21'),
(964, 60, 12, 1, 0, '2016-11-21 11:04:21'),
(965, 60, 24, 1, 0, '2016-11-21 11:04:21'),
(966, 60, 25, 1, 0, '2016-11-21 11:04:21'),
(967, 60, 26, 1, 0, '2016-11-21 11:04:21'),
(968, 60, 27, 1, 0, '2016-11-21 11:04:21'),
(969, 60, 28, 1, 0, '2016-11-21 11:04:21'),
(970, 60, 29, 1, 0, '2016-11-21 11:04:21'),
(971, 60, 30, 1, 0, '2016-11-21 11:04:21'),
(972, 60, 31, 1, 0, '2016-11-21 11:04:21'),
(973, 60, 33, 1, 0, '2016-11-21 11:04:21'),
(974, 60, 41, 1, 0, '2016-11-21 11:04:21'),
(975, 60, 42, 1, 0, '2016-11-21 11:04:21'),
(976, 60, 53, 1, 0, '2016-11-21 11:04:21'),
(977, 60, 54, 1, 0, '2016-11-21 11:04:21'),
(978, 60, 65, 1, 0, '2016-11-21 11:04:21'),
(979, 60, 66, 1, 0, '2016-11-21 11:04:21'),
(980, 60, 110, 1, 0, '2016-11-21 11:04:21'),
(981, 60, 111, 1, 0, '2016-11-21 11:04:21'),
(982, 61, 13, 1, 0, '2016-11-21 11:05:09'),
(983, 61, 14, 1, 0, '2016-11-21 11:05:09'),
(984, 61, 15, 1, 0, '2016-11-21 11:05:09'),
(985, 61, 16, 1, 0, '2016-11-21 11:05:09'),
(986, 61, 17, 1, 0, '2016-11-21 11:05:09'),
(987, 61, 18, 1, 0, '2016-11-21 11:05:09'),
(988, 61, 19, 1, 0, '2016-11-21 11:05:09'),
(989, 61, 20, 1, 0, '2016-11-21 11:05:09'),
(990, 61, 21, 1, 0, '2016-11-21 11:05:09'),
(991, 61, 22, 1, 0, '2016-11-21 11:05:09'),
(992, 61, 3, 1, 0, '2016-11-21 11:05:09'),
(993, 61, 4, 1, 0, '2016-11-21 11:05:09'),
(994, 61, 5, 1, 0, '2016-11-21 11:05:09'),
(995, 61, 6, 1, 0, '2016-11-21 11:05:09'),
(996, 61, 7, 1, 0, '2016-11-21 11:05:09'),
(997, 61, 8, 1, 0, '2016-11-21 11:05:09'),
(998, 61, 9, 1, 0, '2016-11-21 11:05:09'),
(999, 61, 10, 1, 0, '2016-11-21 11:05:09'),
(1000, 61, 11, 1, 0, '2016-11-21 11:05:09'),
(1001, 61, 12, 1, 0, '2016-11-21 11:05:09'),
(1002, 61, 24, 1, 0, '2016-11-21 11:05:09'),
(1003, 61, 25, 1, 0, '2016-11-21 11:05:09'),
(1004, 61, 26, 1, 0, '2016-11-21 11:05:09'),
(1005, 61, 27, 1, 0, '2016-11-21 11:05:09'),
(1006, 61, 28, 1, 0, '2016-11-21 11:05:09'),
(1007, 61, 29, 1, 0, '2016-11-21 11:05:09'),
(1008, 61, 30, 1, 0, '2016-11-21 11:05:09'),
(1009, 61, 31, 1, 0, '2016-11-21 11:05:09'),
(1010, 61, 32, 1, 0, '2016-11-21 11:05:09'),
(1011, 61, 33, 1, 0, '2016-11-21 11:05:09'),
(1012, 61, 41, 1, 0, '2016-11-21 11:05:09'),
(1013, 61, 42, 1, 0, '2016-11-21 11:05:09'),
(1014, 61, 54, 1, 0, '2016-11-21 11:05:09'),
(1015, 61, 55, 1, 0, '2016-11-21 11:05:09'),
(1016, 61, 59, 1, 0, '2016-11-21 11:05:09'),
(1017, 61, 61, 1, 0, '2016-11-21 11:05:09'),
(1018, 61, 65, 1, 0, '2016-11-21 11:05:09'),
(1019, 61, 66, 1, 0, '2016-11-21 11:05:09'),
(1020, 61, 71, 1, 0, '2016-11-21 11:05:09'),
(1021, 61, 72, 1, 0, '2016-11-21 11:05:09'),
(1022, 61, 77, 1, 0, '2016-11-21 11:05:09'),
(1023, 61, 78, 1, 0, '2016-11-21 11:05:09'),
(1024, 61, 86, 1, 0, '2016-11-21 11:05:09'),
(1025, 61, 87, 1, 0, '2016-11-21 11:05:09'),
(1026, 61, 92, 1, 0, '2016-11-21 11:05:09'),
(1027, 61, 93, 1, 0, '2016-11-21 11:05:09'),
(1028, 61, 97, 1, 0, '2016-11-21 11:05:09'),
(1029, 61, 98, 1, 0, '2016-11-21 11:05:09'),
(1030, 61, 103, 1, 0, '2016-11-21 11:05:09'),
(1031, 61, 105, 1, 0, '2016-11-21 11:05:09'),
(1032, 62, 13, 1, 0, '2016-11-21 11:06:06'),
(1033, 62, 14, 1, 0, '2016-11-21 11:06:06'),
(1034, 62, 15, 1, 0, '2016-11-21 11:06:06'),
(1035, 62, 16, 1, 0, '2016-11-21 11:06:06'),
(1036, 62, 17, 1, 0, '2016-11-21 11:06:06'),
(1037, 62, 18, 1, 0, '2016-11-21 11:06:06'),
(1038, 62, 19, 1, 0, '2016-11-21 11:06:06'),
(1039, 62, 20, 1, 0, '2016-11-21 11:06:06'),
(1040, 62, 21, 1, 0, '2016-11-21 11:06:06'),
(1041, 62, 22, 1, 0, '2016-11-21 11:06:06'),
(1042, 62, 3, 1, 0, '2016-11-21 11:06:06'),
(1043, 62, 4, 1, 0, '2016-11-21 11:06:06'),
(1044, 62, 5, 1, 0, '2016-11-21 11:06:06'),
(1045, 62, 6, 1, 0, '2016-11-21 11:06:06'),
(1046, 62, 7, 1, 0, '2016-11-21 11:06:06'),
(1047, 62, 8, 1, 0, '2016-11-21 11:06:06'),
(1048, 62, 10, 1, 0, '2016-11-21 11:06:06'),
(1049, 62, 11, 1, 0, '2016-11-21 11:06:06'),
(1050, 62, 12, 1, 0, '2016-11-21 11:06:06'),
(1051, 62, 24, 1, 0, '2016-11-21 11:06:06'),
(1052, 62, 25, 1, 0, '2016-11-21 11:06:06'),
(1053, 62, 26, 1, 0, '2016-11-21 11:06:06'),
(1054, 62, 27, 1, 0, '2016-11-21 11:06:06'),
(1055, 62, 29, 1, 0, '2016-11-21 11:06:06'),
(1056, 62, 30, 1, 0, '2016-11-21 11:06:06'),
(1057, 62, 31, 1, 0, '2016-11-21 11:06:06'),
(1058, 62, 33, 1, 0, '2016-11-21 11:06:06'),
(1059, 62, 53, 1, 0, '2016-11-21 11:06:06'),
(1060, 62, 54, 1, 0, '2016-11-21 11:06:06'),
(1061, 62, 56, 1, 0, '2016-11-21 11:06:06'),
(1062, 62, 65, 1, 0, '2016-11-21 11:06:06'),
(1063, 62, 66, 1, 0, '2016-11-21 11:06:06'),
(1064, 62, 68, 1, 0, '2016-11-21 11:06:06'),
(1065, 62, 71, 1, 0, '2016-11-21 11:06:06'),
(1066, 62, 72, 1, 0, '2016-11-21 11:06:06'),
(1067, 62, 77, 1, 0, '2016-11-21 11:06:06'),
(1068, 62, 78, 1, 0, '2016-11-21 11:06:06'),
(1069, 62, 86, 1, 0, '2016-11-21 11:06:06'),
(1070, 62, 87, 1, 0, '2016-11-21 11:06:06'),
(1071, 63, 13, 1, 0, '2016-11-21 11:06:58'),
(1072, 63, 14, 1, 0, '2016-11-21 11:06:58'),
(1073, 63, 15, 1, 0, '2016-11-21 11:06:58'),
(1074, 63, 16, 1, 0, '2016-11-21 11:06:58'),
(1075, 63, 17, 1, 0, '2016-11-21 11:06:58'),
(1076, 63, 18, 1, 0, '2016-11-21 11:06:58'),
(1077, 63, 19, 1, 0, '2016-11-21 11:06:58'),
(1078, 63, 20, 1, 0, '2016-11-21 11:06:58'),
(1079, 63, 21, 1, 0, '2016-11-21 11:06:58'),
(1080, 63, 22, 1, 0, '2016-11-21 11:06:58'),
(1081, 63, 3, 1, 0, '2016-11-21 11:06:58'),
(1082, 63, 4, 1, 0, '2016-11-21 11:06:58'),
(1083, 63, 5, 1, 0, '2016-11-21 11:06:58'),
(1084, 63, 6, 1, 0, '2016-11-21 11:06:58'),
(1085, 63, 7, 1, 0, '2016-11-21 11:06:58'),
(1086, 63, 8, 1, 0, '2016-11-21 11:06:58'),
(1087, 63, 9, 1, 0, '2016-11-21 11:06:58'),
(1088, 63, 10, 1, 0, '2016-11-21 11:06:58'),
(1089, 63, 11, 1, 0, '2016-11-21 11:06:58'),
(1090, 63, 24, 1, 0, '2016-11-21 11:06:58'),
(1091, 63, 25, 1, 0, '2016-11-21 11:06:58'),
(1092, 63, 26, 1, 0, '2016-11-21 11:06:58'),
(1093, 63, 27, 1, 0, '2016-11-21 11:06:58'),
(1094, 63, 28, 1, 0, '2016-11-21 11:06:58'),
(1095, 63, 29, 1, 0, '2016-11-21 11:06:58'),
(1096, 63, 31, 1, 0, '2016-11-21 11:06:58'),
(1097, 63, 32, 1, 0, '2016-11-21 11:06:58'),
(1098, 63, 33, 1, 0, '2016-11-21 11:06:58'),
(1099, 63, 36, 1, 0, '2016-11-21 11:06:58'),
(1100, 63, 38, 1, 0, '2016-11-21 11:06:58'),
(1101, 63, 43, 1, 0, '2016-11-21 11:06:58'),
(1102, 63, 53, 1, 0, '2016-11-21 11:06:58'),
(1103, 63, 54, 1, 0, '2016-11-21 11:06:58'),
(1104, 63, 55, 1, 0, '2016-11-21 11:06:58'),
(1105, 63, 59, 1, 0, '2016-11-21 11:06:58'),
(1106, 63, 61, 1, 0, '2016-11-21 11:06:58'),
(1107, 63, 66, 1, 0, '2016-11-21 11:06:58'),
(1108, 63, 67, 1, 0, '2016-11-21 11:06:58'),
(1109, 64, 13, 1, 0, '2016-11-21 11:07:45'),
(1110, 64, 14, 1, 0, '2016-11-21 11:07:45'),
(1111, 64, 15, 1, 0, '2016-11-21 11:07:45'),
(1112, 64, 16, 1, 0, '2016-11-21 11:07:45'),
(1113, 64, 17, 1, 0, '2016-11-21 11:07:45'),
(1114, 64, 18, 1, 0, '2016-11-21 11:07:45'),
(1115, 64, 19, 1, 0, '2016-11-21 11:07:45'),
(1116, 64, 20, 1, 0, '2016-11-21 11:07:45'),
(1117, 64, 21, 1, 0, '2016-11-21 11:07:45'),
(1118, 64, 22, 1, 0, '2016-11-21 11:07:45'),
(1119, 64, 3, 1, 0, '2016-11-21 11:07:45'),
(1120, 64, 4, 1, 0, '2016-11-21 11:07:45'),
(1121, 64, 5, 1, 0, '2016-11-21 11:07:45'),
(1122, 64, 6, 1, 0, '2016-11-21 11:07:45'),
(1123, 64, 7, 1, 0, '2016-11-21 11:07:45'),
(1124, 64, 8, 1, 0, '2016-11-21 11:07:45'),
(1125, 64, 9, 1, 0, '2016-11-21 11:07:45'),
(1126, 64, 10, 1, 0, '2016-11-21 11:07:45'),
(1127, 64, 11, 1, 0, '2016-11-21 11:07:45'),
(1128, 64, 12, 1, 0, '2016-11-21 11:07:45'),
(1129, 64, 24, 1, 0, '2016-11-21 11:07:45'),
(1130, 64, 25, 1, 0, '2016-11-21 11:07:45'),
(1131, 64, 26, 1, 0, '2016-11-21 11:07:45'),
(1132, 64, 27, 1, 0, '2016-11-21 11:07:45'),
(1133, 64, 28, 1, 0, '2016-11-21 11:07:45'),
(1134, 64, 29, 1, 0, '2016-11-21 11:07:45'),
(1135, 64, 30, 1, 0, '2016-11-21 11:07:45'),
(1136, 64, 31, 1, 0, '2016-11-21 11:07:45'),
(1137, 64, 32, 1, 0, '2016-11-21 11:07:45'),
(1138, 64, 33, 1, 0, '2016-11-21 11:07:45'),
(1139, 64, 42, 1, 0, '2016-11-21 11:07:45'),
(1140, 64, 44, 1, 0, '2016-11-21 11:07:45'),
(1141, 64, 59, 1, 0, '2016-11-21 11:07:45'),
(1142, 64, 61, 1, 0, '2016-11-21 11:07:45'),
(1143, 64, 78, 1, 0, '2016-11-21 11:07:45'),
(1144, 64, 79, 1, 0, '2016-11-21 11:07:45'),
(1145, 64, 86, 1, 0, '2016-11-21 11:07:45'),
(1146, 64, 87, 1, 0, '2016-11-21 11:07:45'),
(1147, 64, 98, 1, 0, '2016-11-21 11:07:45'),
(1148, 64, 100, 1, 0, '2016-11-21 11:07:45'),
(1149, 64, 102, 1, 0, '2016-11-21 11:07:45'),
(1150, 64, 103, 1, 0, '2016-11-21 11:07:45'),
(1151, 64, 104, 1, 0, '2016-11-21 11:07:45'),
(1152, 64, 105, 1, 0, '2016-11-21 11:07:45'),
(1153, 64, 110, 1, 0, '2016-11-21 11:07:45'),
(1154, 64, 111, 1, 0, '2016-11-21 11:07:45'),
(1155, 65, 13, 1, 0, '2016-11-21 11:14:43'),
(1156, 65, 14, 1, 0, '2016-11-21 11:14:43'),
(1157, 65, 15, 1, 0, '2016-11-21 11:14:43'),
(1158, 65, 16, 1, 0, '2016-11-21 11:14:43'),
(1159, 65, 17, 1, 0, '2016-11-21 11:14:43'),
(1160, 65, 19, 1, 0, '2016-11-21 11:14:43'),
(1161, 65, 21, 1, 0, '2016-11-21 11:14:43'),
(1162, 65, 22, 1, 0, '2016-11-21 11:14:43'),
(1163, 65, 3, 1, 0, '2016-11-21 11:14:43'),
(1164, 65, 4, 1, 0, '2016-11-21 11:14:43'),
(1165, 65, 5, 1, 0, '2016-11-21 11:14:43'),
(1166, 65, 6, 1, 0, '2016-11-21 11:14:43'),
(1167, 65, 7, 1, 0, '2016-11-21 11:14:43'),
(1168, 65, 9, 1, 0, '2016-11-21 11:14:43'),
(1169, 65, 10, 1, 0, '2016-11-21 11:14:43'),
(1170, 65, 11, 1, 0, '2016-11-21 11:14:43'),
(1171, 65, 24, 1, 0, '2016-11-21 11:14:43'),
(1172, 65, 25, 1, 0, '2016-11-21 11:14:43'),
(1173, 65, 26, 1, 0, '2016-11-21 11:14:43'),
(1174, 65, 27, 1, 0, '2016-11-21 11:14:43'),
(1175, 65, 30, 1, 0, '2016-11-21 11:14:43'),
(1176, 65, 31, 1, 0, '2016-11-21 11:14:43'),
(1177, 65, 32, 1, 0, '2016-11-21 11:14:43'),
(1178, 65, 36, 1, 0, '2016-11-21 11:14:43'),
(1179, 65, 41, 1, 0, '2016-11-21 11:14:43'),
(1180, 65, 43, 1, 0, '2016-11-21 11:14:43'),
(1181, 65, 48, 1, 0, '2016-11-21 11:14:43'),
(1182, 65, 50, 1, 0, '2016-11-21 11:14:43'),
(1183, 65, 53, 1, 0, '2016-11-21 11:14:43'),
(1184, 65, 59, 1, 0, '2016-11-21 11:14:43'),
(1185, 65, 61, 1, 0, '2016-11-21 11:14:43'),
(1186, 66, 13, 1, 0, '2016-11-21 11:19:46'),
(1187, 66, 14, 1, 0, '2016-11-21 11:19:46'),
(1188, 66, 15, 1, 0, '2016-11-21 11:19:46'),
(1189, 66, 16, 1, 0, '2016-11-21 11:19:46'),
(1190, 66, 17, 1, 0, '2016-11-21 11:19:46'),
(1191, 66, 18, 1, 0, '2016-11-21 11:19:46'),
(1192, 66, 19, 1, 0, '2016-11-21 11:19:46'),
(1193, 66, 20, 1, 0, '2016-11-21 11:19:46'),
(1194, 66, 21, 1, 0, '2016-11-21 11:19:46'),
(1195, 66, 22, 1, 0, '2016-11-21 11:19:46'),
(1196, 66, 3, 1, 0, '2016-11-21 11:19:46'),
(1197, 66, 4, 1, 0, '2016-11-21 11:19:46'),
(1198, 66, 5, 1, 0, '2016-11-21 11:19:46'),
(1199, 66, 6, 1, 0, '2016-11-21 11:19:46'),
(1200, 66, 7, 1, 0, '2016-11-21 11:19:46'),
(1201, 66, 8, 1, 0, '2016-11-21 11:19:46'),
(1202, 66, 9, 1, 0, '2016-11-21 11:19:46'),
(1203, 66, 10, 1, 0, '2016-11-21 11:19:46'),
(1204, 66, 11, 1, 0, '2016-11-21 11:19:46'),
(1205, 66, 12, 1, 0, '2016-11-21 11:19:46'),
(1206, 66, 24, 1, 0, '2016-11-21 11:19:46'),
(1207, 66, 25, 1, 0, '2016-11-21 11:19:46'),
(1208, 66, 26, 1, 0, '2016-11-21 11:19:46'),
(1209, 66, 27, 1, 0, '2016-11-21 11:19:46'),
(1210, 66, 29, 1, 0, '2016-11-21 11:19:46'),
(1211, 66, 30, 1, 0, '2016-11-21 11:19:46'),
(1212, 66, 31, 1, 0, '2016-11-21 11:19:46'),
(1213, 66, 32, 1, 0, '2016-11-21 11:19:46'),
(1214, 66, 33, 1, 0, '2016-11-21 11:19:46'),
(1215, 66, 43, 1, 0, '2016-11-21 11:19:46'),
(1216, 66, 44, 1, 0, '2016-11-21 11:19:46'),
(1217, 66, 53, 1, 0, '2016-11-21 11:19:46'),
(1218, 66, 54, 1, 0, '2016-11-21 11:19:46'),
(1219, 66, 56, 1, 0, '2016-11-21 11:19:46'),
(1220, 66, 60, 1, 0, '2016-11-21 11:19:46'),
(1221, 66, 61, 1, 0, '2016-11-21 11:19:46'),
(1222, 66, 110, 1, 0, '2016-11-21 11:19:46'),
(1223, 66, 111, 1, 0, '2016-11-21 11:19:46'),
(1224, 68, 13, 1, 0, '2016-11-21 11:23:52'),
(1225, 68, 14, 1, 0, '2016-11-21 11:23:52'),
(1226, 68, 15, 1, 0, '2016-11-21 11:23:52'),
(1227, 68, 16, 1, 0, '2016-11-21 11:23:52'),
(1228, 68, 18, 1, 0, '2016-11-21 11:23:52'),
(1229, 68, 19, 1, 0, '2016-11-21 11:23:52'),
(1230, 68, 21, 1, 0, '2016-11-21 11:23:52'),
(1231, 68, 22, 1, 0, '2016-11-21 11:23:52'),
(1232, 68, 3, 1, 0, '2016-11-21 11:23:52'),
(1233, 68, 4, 1, 0, '2016-11-21 11:23:52'),
(1234, 68, 5, 1, 0, '2016-11-21 11:23:52'),
(1235, 68, 6, 1, 0, '2016-11-21 11:23:52'),
(1236, 68, 7, 1, 0, '2016-11-21 11:23:52'),
(1237, 68, 8, 1, 0, '2016-11-21 11:23:52'),
(1238, 68, 9, 1, 0, '2016-11-21 11:23:52'),
(1239, 68, 10, 1, 0, '2016-11-21 11:23:52'),
(1240, 68, 11, 1, 0, '2016-11-21 11:23:52'),
(1241, 68, 12, 1, 0, '2016-11-21 11:23:52'),
(1242, 68, 24, 1, 0, '2016-11-21 11:23:52'),
(1243, 68, 25, 1, 0, '2016-11-21 11:23:52'),
(1244, 68, 26, 1, 0, '2016-11-21 11:23:52'),
(1245, 68, 28, 1, 0, '2016-11-21 11:23:52'),
(1246, 68, 29, 1, 0, '2016-11-21 11:23:52'),
(1247, 68, 30, 1, 0, '2016-11-21 11:23:52'),
(1248, 68, 31, 1, 0, '2016-11-21 11:23:52'),
(1249, 68, 32, 1, 0, '2016-11-21 11:23:52'),
(1250, 68, 33, 1, 0, '2016-11-21 11:23:52'),
(1251, 69, 13, 1, 0, '2016-11-21 11:25:44'),
(1252, 69, 14, 1, 0, '2016-11-21 11:25:44'),
(1253, 69, 15, 1, 0, '2016-11-21 11:25:44'),
(1254, 69, 16, 1, 0, '2016-11-21 11:25:44'),
(1255, 69, 20, 1, 0, '2016-11-21 11:25:44'),
(1256, 69, 21, 1, 0, '2016-11-21 11:25:44'),
(1257, 69, 22, 1, 0, '2016-11-21 11:25:44'),
(1258, 69, 3, 1, 0, '2016-11-21 11:25:44'),
(1259, 69, 4, 1, 0, '2016-11-21 11:25:44'),
(1260, 69, 5, 1, 0, '2016-11-21 11:25:44'),
(1261, 69, 6, 1, 0, '2016-11-21 11:25:44'),
(1262, 69, 7, 1, 0, '2016-11-21 11:25:44'),
(1263, 69, 8, 1, 0, '2016-11-21 11:25:44'),
(1264, 69, 9, 1, 0, '2016-11-21 11:25:44'),
(1265, 69, 10, 1, 0, '2016-11-21 11:25:44'),
(1266, 69, 11, 1, 0, '2016-11-21 11:25:44'),
(1267, 69, 12, 1, 0, '2016-11-21 11:25:44'),
(1268, 69, 24, 1, 0, '2016-11-21 11:25:44'),
(1269, 69, 26, 1, 0, '2016-11-21 11:25:44'),
(1270, 69, 27, 1, 0, '2016-11-21 11:25:44'),
(1271, 69, 28, 1, 0, '2016-11-21 11:25:44'),
(1272, 69, 30, 1, 0, '2016-11-21 11:25:44'),
(1273, 69, 31, 1, 0, '2016-11-21 11:25:44'),
(1274, 69, 33, 1, 0, '2016-11-21 11:25:44'),
(1275, 69, 41, 1, 0, '2016-11-21 11:25:44'),
(1276, 69, 42, 1, 0, '2016-11-21 11:25:44'),
(1277, 69, 43, 1, 0, '2016-11-21 11:25:44'),
(1278, 69, 48, 1, 0, '2016-11-21 11:25:44'),
(1279, 69, 53, 1, 0, '2016-11-21 11:25:44'),
(1280, 69, 55, 1, 0, '2016-11-21 11:25:44'),
(1281, 70, 13, 1, 0, '2016-11-21 11:34:59'),
(1282, 70, 14, 1, 0, '2016-11-21 11:34:59'),
(1283, 70, 15, 1, 0, '2016-11-21 11:34:59'),
(1284, 70, 16, 1, 0, '2016-11-21 11:34:59'),
(1285, 70, 17, 1, 0, '2016-11-21 11:34:59'),
(1286, 70, 19, 1, 0, '2016-11-21 11:34:59'),
(1287, 70, 20, 1, 0, '2016-11-21 11:34:59'),
(1288, 70, 21, 1, 0, '2016-11-21 11:34:59'),
(1289, 70, 22, 1, 0, '2016-11-21 11:34:59'),
(1290, 70, 3, 1, 0, '2016-11-21 11:34:59'),
(1291, 70, 4, 1, 0, '2016-11-21 11:34:59'),
(1292, 70, 5, 1, 0, '2016-11-21 11:34:59'),
(1293, 70, 6, 1, 0, '2016-11-21 11:34:59'),
(1294, 70, 7, 1, 0, '2016-11-21 11:34:59'),
(1295, 70, 8, 1, 0, '2016-11-21 11:34:59'),
(1296, 70, 9, 1, 0, '2016-11-21 11:34:59'),
(1297, 70, 10, 1, 0, '2016-11-21 11:34:59'),
(1298, 70, 11, 1, 0, '2016-11-21 11:34:59'),
(1299, 70, 12, 1, 0, '2016-11-21 11:34:59'),
(1300, 70, 24, 1, 0, '2016-11-21 11:34:59'),
(1301, 70, 25, 1, 0, '2016-11-21 11:34:59'),
(1302, 70, 26, 1, 0, '2016-11-21 11:34:59'),
(1303, 70, 27, 1, 0, '2016-11-21 11:34:59'),
(1304, 70, 29, 1, 0, '2016-11-21 11:34:59'),
(1305, 70, 30, 1, 0, '2016-11-21 11:34:59'),
(1306, 70, 31, 1, 0, '2016-11-21 11:34:59'),
(1307, 70, 32, 1, 0, '2016-11-21 11:34:59'),
(1308, 70, 33, 1, 0, '2016-11-21 11:34:59'),
(1309, 70, 41, 1, 0, '2016-11-21 11:34:59'),
(1310, 70, 42, 1, 0, '2016-11-21 11:34:59'),
(1311, 70, 43, 1, 0, '2016-11-21 11:34:59'),
(1312, 70, 102, 1, 0, '2016-11-21 11:34:59'),
(1313, 70, 104, 1, 0, '2016-11-21 11:34:59'),
(1314, 70, 110, 1, 0, '2016-11-21 11:34:59'),
(1315, 70, 111, 1, 0, '2016-11-21 11:34:59'),
(1316, 72, 13, 1, 0, '2016-11-21 11:36:49'),
(1317, 72, 14, 1, 0, '2016-11-21 11:36:49'),
(1318, 72, 15, 1, 0, '2016-11-21 11:36:49'),
(1319, 72, 17, 1, 0, '2016-11-21 11:36:49'),
(1320, 72, 18, 1, 0, '2016-11-21 11:36:49'),
(1321, 72, 19, 1, 0, '2016-11-21 11:36:49'),
(1322, 72, 21, 1, 0, '2016-11-21 11:36:49'),
(1323, 72, 22, 1, 0, '2016-11-21 11:36:49'),
(1324, 72, 3, 1, 0, '2016-11-21 11:36:49'),
(1325, 72, 4, 1, 0, '2016-11-21 11:36:49'),
(1326, 72, 5, 1, 0, '2016-11-21 11:36:49'),
(1327, 72, 6, 1, 0, '2016-11-21 11:36:49'),
(1328, 72, 7, 1, 0, '2016-11-21 11:36:49'),
(1329, 72, 8, 1, 0, '2016-11-21 11:36:49'),
(1330, 72, 9, 1, 0, '2016-11-21 11:36:49'),
(1331, 72, 10, 1, 0, '2016-11-21 11:36:49'),
(1332, 72, 11, 1, 0, '2016-11-21 11:36:49'),
(1333, 72, 12, 1, 0, '2016-11-21 11:36:49'),
(1334, 72, 24, 1, 0, '2016-11-21 11:36:49'),
(1335, 72, 25, 1, 0, '2016-11-21 11:36:49'),
(1336, 72, 26, 1, 0, '2016-11-21 11:36:49'),
(1337, 72, 28, 1, 0, '2016-11-21 11:36:49'),
(1338, 72, 29, 1, 0, '2016-11-21 11:36:49'),
(1339, 72, 30, 1, 0, '2016-11-21 11:36:49'),
(1340, 72, 31, 1, 0, '2016-11-21 11:36:49'),
(1341, 72, 32, 1, 0, '2016-11-21 11:36:49'),
(1342, 72, 41, 1, 0, '2016-11-21 11:36:49'),
(1343, 72, 43, 1, 0, '2016-11-21 11:36:49'),
(1344, 72, 54, 1, 0, '2016-11-21 11:36:49'),
(1345, 72, 55, 1, 0, '2016-11-21 11:36:49'),
(1346, 72, 110, 1, 0, '2016-11-21 11:36:49'),
(1347, 72, 111, 1, 0, '2016-11-21 11:36:49'),
(1348, 105, 13, 1, 0, '2017-02-03 15:44:26'),
(1349, 105, 15, 1, 0, '2017-02-03 15:44:26'),
(1350, 105, 16, 1, 0, '2017-02-03 15:44:26');

-- --------------------------------------------------------

--
-- Table structure for table `pre_tutor_reviews`
--

CREATE TABLE `pre_tutor_reviews` (
  `id` int(11) NOT NULL,
  `booking_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `tutor_id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  `rating` float NOT NULL,
  `comments` varchar(512) CHARACTER SET utf8 NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `status` enum('Pending','Approved','Rejected') CHARACTER SET utf8 NOT NULL DEFAULT 'Pending'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pre_tutor_reviews`
--

INSERT INTO `pre_tutor_reviews` (`id`, `booking_id`, `student_id`, `tutor_id`, `course_id`, `rating`, `comments`, `created_at`, `updated_at`, `status`) VALUES
(1, 7, 3, 7, 21, 5, 'He is a very very good tutor, he always has websites on hand to help you further, and he puts everything.', '2016-11-11 12:59:24', '2016-11-11 12:59:24', 'Approved'),
(2, 9, 3, 68, 27, 5, 'Thank you! dedicated time to me and was not distracted or impatient. Very good knowledgeable. ', '2016-11-11 13:00:56', '2016-11-11 13:00:56', 'Approved'),
(3, 28, 3, 7, 92, 5, 'Thank you so much for help with this assignment. I am actually going to request another assignment similar to this and would like to request you to help with that one as well if possible. Thank you', '2016-11-11 13:02:07', '2016-11-11 13:02:07', 'Approved'),
(4, 11, 3, 8, 40, 4, 'This teacher is very nice. Her java programming knowledge is fantastic.', '2016-11-11 13:07:18', '2016-11-11 13:07:18', 'Approved'),
(5, 36, 32, 9, 27, 3.5, 'This was great! i highly recommend her to anybody! very nice and patient and straight to the point!', '2016-11-22 10:22:09', '2016-11-22 10:22:09', 'Approved');

-- --------------------------------------------------------

--
-- Table structure for table `pre_tutor_selected_types`
--

CREATE TABLE `pre_tutor_selected_types` (
  `id` int(222) NOT NULL,
  `user_id` int(222) NOT NULL,
  `tutor_type_id` int(222) NOT NULL,
  `status` enum('Active','Inactive') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Active'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pre_tutor_selling_courses`
--

CREATE TABLE `pre_tutor_selling_courses` (
  `sc_id` int(11) NOT NULL,
  `tutor_id` int(11) NOT NULL,
  `course_name` varchar(512) NOT NULL,
  `slug` varchar(512) NOT NULL,
  `course_title` varchar(512) NOT NULL,
  `description` text NOT NULL,
  `image` varchar(512) DEFAULT NULL,
  `skill_level` varchar(256) DEFAULT NULL,
  `languages` varchar(1000) DEFAULT NULL,
  `preview_image` varchar(512) DEFAULT NULL,
  `preview_file` varchar(512) DEFAULT NULL,
  `course_price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `admin_commission_percentage` decimal(10,2) NOT NULL DEFAULT '0.00',
  `max_downloads` tinyint(5) NOT NULL,
  `status` enum('Active','Inactive') NOT NULL DEFAULT 'Active',
  `admin_approved` enum('Yes','No') NOT NULL DEFAULT 'No',
  `total_purchases` int(11) DEFAULT '0' COMMENT 'overall purchases',
  `total_downloads` int(11) DEFAULT '0' COMMENT 'overall downloads',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pre_tutor_selling_courses`
--

INSERT INTO `pre_tutor_selling_courses` (`sc_id`, `tutor_id`, `course_name`, `slug`, `course_title`, `description`, `image`, `skill_level`, `languages`, `preview_image`, `preview_file`, `course_price`, `admin_commission_percentage`, `max_downloads`, `status`, `admin_approved`, `total_purchases`, `total_downloads`, `created_at`, `updated_at`) VALUES
(1, 7, 'PHP', 'php', 'PHP for Beginners', '<p>\r\n This is a complete and free PHP programming course for beginners. It&#39;s assumed that you already have some HTML skills. But you don&#39;t need to be a guru, by any means. If you need a refresher on HTML, then click the link for the Web Design course on the left of this page. Everything you need to get started with this PHP course is set out in section one below. Good luck!</p>', 'a4cb2-php_2017022401181912571886.jpg', 'Beginners Level', 'English', 'PHP-Tutorial-for-Beginners-How-to-Get-Started-with-PHP1_20170224011819944909548.jpeg', '392520036_201702240118192072880938.mp4', '10.00', '10.00', 5, 'Active', 'Yes', 0, 0, '2017-02-24 13:18:19', '2017-02-24 13:18:19'),
(2, 7, 'Javascript', 'javascript', 'JavaScript for Geeks', '<h2>\r\n About the Course</h2>\r\n<p>\r\n JavaScript is a cross-platform, object-oriented scripting language. It is a small and lightweight language. Inside a host environment (for example, a web browser), JavaScript can be connected to the objects of its environment to provide programmatic control over them.</p>', 'Javascript_20170224012856544056998.jpeg', 'Beginners Level', 'English', 'Javascript_201702240128561826486567.jpeg', '36_1_201702240128561621981106.pdf', '15.00', '10.00', 10, 'Active', 'Yes', 1, 2, '2017-02-24 13:28:56', '2017-02-24 13:28:56'),
(3, 7, 'ASP.NET', 'aspnet', 'ASP.NET Advanced', '<p>\r\n <span class="_Tgc"><b>ASP</b>.<b>NET</b> is an open-source server-side web application framework designed for web development to produce dynamic web pages. It was developed by Microsoft to allow programmers to build dynamic web sites, web applications and web services</span></p>', 'images_201702240243151551643217.png', 'High', 'English', 'index_20170224024315323368095.png', 'index_201702240243152056525191.jpeg', '20.00', '10.00', 4, 'Active', 'Yes', 0, 0, '2017-02-24 14:42:12', '2017-02-24 14:43:15'),
(4, 7, 'VB. NET', 'vb-net', 'VB. NET for Begineers', '<p>\r\n <span class="_Tgc"><b>Visual Basic</b> .<b>NET</b> (<b>VB</b>.<b>NET</b>) is a multi-paradigm, object-oriented programming language, implemented on the .<b>NET</b> Framework. Microsoft launched <b>VB</b>.<b>NET</b> in 2002 as the successor to its original <b>Visual Basic</b> language.</span></p>', 'vb_net_201702240253251938029824.jpeg', 'Beginners', 'English', 'vb_net1_20170224025325699625896.jpeg', NULL, '21.00', '10.00', 5, 'Active', 'Yes', 0, 0, '2017-02-24 14:53:25', '2017-02-24 14:53:25'),
(5, 7, 'VB. NET Advanced', 'vb-net-advanced', 'VB.Net for Advanced', '<p>\r\n <span class="_Tgc"><b>Visual Basic</b> .<b>NET</b> (<b>VB</b>.<b>NET</b>) is a multi-paradigm, object-oriented programming language, implemented on the .<b>NET</b> Framework. Microsoft launched <b>VB</b>.<b>NET</b> in 2002 as the successor to its original <b>Visual Basic</b> language.</span></p>', 'vb_net1_20170224025701675944812.jpeg', 'Advanced Level', 'English', 'vb_net_20170224025701878697088.jpeg', NULL, '10.00', '10.00', 5, 'Active', 'Yes', 0, 0, '2017-02-24 14:57:01', '2017-02-24 14:57:01'),
(6, 7, 'Java', 'java', 'Core Java', '<p>\r\n <span class="_Tgc">"<b>Core Java</b>" is Sun&#39;s term, used to refer to <b>Java</b> SE, the standard edition and a set of related technologies, like the <b>Java</b> VM, CORBA, et cetera. This is mostly to differentiate from, say, <b>Java</b> ME or <b>Java</b> EE. Also note that they&#39;re talking about a set of libraries rather than the programming language.</span></p>', 'Core Java2_20170224030248445198418.jpeg', 'Basice Java', 'English', 'Core Java1_20170224030248264139.jpeg', 'Core Java_201702240302481521566904.jpeg', '25.00', '10.00', 6, 'Active', 'Yes', 0, 0, '2017-02-24 15:02:48', '2017-02-24 15:02:48'),
(7, 7, 'Java', 'java-1', 'Advanced Java', '<p>\r\n Java is based on the C and C++ programming languages, but differs from these languages is some important ways. The main difference between C/C++ and Java is that in Java all development is done with objects and classes. This main difference provides distinct advantages for programs written in Java, such as multiple threads of control and dynamic loading.</p>', 'advanced java2_201702240309031469962645.png', 'Advance Java', 'English', 'advanced java1_2017022403090385193016.jpeg', 'advanced java_2017022403090329320370.png', '30.00', '10.00', 5, 'Active', 'Yes', 0, 0, '2017-02-24 15:09:03', '2017-02-24 15:09:03'),
(8, 7, 'J2EE', 'j2ee', 'J2EE', '<p>\r\n <span class="_Tgc"><b>J2EE</b> is a platform-independent, Java-centric environment from Sun for developing, building and deploying Web-based enterprise applications online. The <b>J2EE</b> platform consists of a set of services, APIs, and protocols that provide the functionality for developing multitiered, Web-based applications.</span></p>', 'J2EE2_20170224031502990018658.png', 'High', 'English', 'J2EE1_20170224031502133378315.png', NULL, '15.00', '10.00', 6, 'Active', 'Yes', 1, 2, '2017-02-24 15:15:02', '2017-02-24 15:15:02'),
(9, 7, 'Adobe Photoshop', 'adobe-photoshop', 'Adobe Photoshop', '<p>\r\n <span class="_Tgc">An image editing software developed and manufactured by <b>Adobe</b> Systems Inc. <b>Photoshop</b> is considered one of the leaders in photo editing software. The software allows users to manipulate, crop, resize, and correct color on digital photos.</span></p>', 'photoshop2_201702240320381627573671.jpeg', 'Beginners', 'English', 'photoshop1_201702240320381422715363.jpeg', 'photoshop_201702240320381800689921.jpeg', '15.00', '10.00', 4, 'Active', 'Yes', 2, 2, '2017-02-24 15:20:38', '2017-02-24 15:20:38'),
(10, 7, 'Adobe Illustrator', 'adobe-illustrator', 'Adobe Illustrator', '<p>\r\n <span class="_Tgc"><b>Adobe Illustrator</b> is a program used by both artists and graphic designers to create vector images. These images will then be used for company logos, promotional uses or even personal work, both in print and digital form.</span></p>', 'adobe illustrator2_201702240330361372652499.jpeg', 'Beginners', 'English', 'adobe illustrator1_201702240330361793679065.png', NULL, '20.00', '10.00', 6, 'Active', 'Yes', 0, 0, '2017-02-24 15:30:36', '2017-02-24 15:30:36'),
(11, 7, 'Adobe In design', 'adobe-in-design', 'Adobe In design', '<p>\r\n <span class="_Tgc"><b>Adobe</b> InDesign is a desktop publishing software application produced by <b>Adobe</b> Systems. It can be used to create works such as posters, flyers, brochures, magazines, newspapers, and books.</span></p>', 'adobe indesign2_201702240336221911544902.jpeg', 'High', 'English', 'adobe indesign1_201702240336221912178825.png', 'adobe indesign_201702240336221979300358.jpeg', '15.00', '10.00', 6, 'Active', 'Yes', 0, 0, '2017-02-24 15:36:22', '2017-02-24 15:36:22'),
(12, 7, 'Adobe Premier', 'adobe-premier', 'Adobe Premier', '<p>\r\n <span class="_Tgc"><b>Adobe Premiere</b> Pro. <b>Adobe Premiere</b> Pro is a timeline-based video editing software application. It is part of the <b>Adobe</b> Creative Cloud, which includes video editing, graphic design, and web development programs</span></p>', 'Adobe Premier3_201702240344282128690777.jpeg', 'High', 'English', 'Adobe Premier2_20170224034428149495172.jpeg', 'premiere_pro_reference_2017022403442851340063.pdf', '30.00', '10.00', 5, 'Active', 'Yes', 0, 0, '2017-02-24 15:44:28', '2017-02-24 15:44:28'),
(13, 7, 'AutoCAD', 'autocad', 'AutoCAD', '<p>\r\n <span class="_Tgc"><b>AutoCAD</b> is a computer-aided design (CAD) program used for 2-D and 3-D design and drafting. <b>AutoCAD</b> is developed and marketed by Autodesk Inc. and was one of the first CAD programs that could be executed on personal computers.</span></p>', 'AutoCAD_20170224034846573698015.jpeg', 'Beginners', 'English', 'AutoCAD1_201702240348461988087761.jpeg', 'AutoCAD2_201702240348461704529751.jpeg', '25.00', '10.00', 4, 'Active', 'Yes', 1, 2, '2017-02-24 15:48:46', '2017-02-24 15:48:46'),
(14, 7, 'Unix', 'unix', 'Unix Basics', '<p>\r\n <span class="_Tgc"><b>Unix</b> (often spelled "<b>UNIX</b>," especially as an official trademark) is an operating system that originated at Bell Labs in 1969 as an interactive time-sharing system. Ken Thompson and Dennis Ritchie are considered the inventors of <b>Unix</b></span></p>', 'unix2_20170224035318878882697.jpeg', 'Beginners', 'English', 'unix1_201702240353182039825312.jpeg', NULL, '14.00', '10.00', 5, 'Active', 'Yes', 0, 0, '2017-02-24 15:53:18', '2017-02-24 15:53:18'),
(15, 7, 'Linux', 'linux', 'Linux Basics', '<p>\r\n <span class="_Tgc">The <b>Linux</b> open source operating system, or <b>Linux</b> OS, is a freely distributable, cross-platform operating system based on Unix that can be installed on PCs, laptops, netbooks, mobile and tablet devices, video game consoles, servers, supercomputers and more.</span></p>', 'Linux2_20170224035839237218605.png', 'High', 'English', 'Linux1_20170224035839227036979.png', NULL, '20.00', '10.00', 6, 'Active', 'Yes', 1, 1, '2017-02-24 15:58:39', '2017-02-24 15:58:39'),
(16, 7, 'C  Language', 'c-language', 'C  Language', '<p>\r\n <span class="_Tgc"><b>C</b> is a high-level and general-purpose <b>programming language</b> that is ideal for developing firmware or portable applications. Originally intended for writing system software, <b>C</b> was developed at Bell Labs by Dennis Ritchie for the Unix Operating System &#40;OS&#41; in the early 1970s.</span></p>', 'C  Language2_2017022404032627491715.jpeg', 'High', 'English', 'C  Language1_20170224040326941524782.jpeg', 'C  Language_201702240403261567994348.jpeg', '15.00', '10.00', 5, 'Active', 'Yes', 0, 0, '2017-02-24 16:03:26', '2017-02-24 16:03:26'),
(17, 7, 'C ++ Language', 'c-language', 'C ++ Language', '<p>\r\n <span class="_Tgc _y9e"><b>C++</b> is an object oriented programming (OOP) language, developed by Bjarne Stroustrup, and is an extension of C language. It is therefore possible to code <b>C++</b> in a "C style" or "object-oriented style." In certain scenarios, it can be coded in either way and is thus an effective example of a hybrid language.</span></p>', 'C ++ Language2_201702240410171109926245.png', 'Beginners', 'English', 'C ++ Language1_201702240410171739703513.png', NULL, '25.00', '10.00', 4, 'Active', 'Yes', 1, 4, '2017-02-24 16:10:17', '2017-02-24 16:10:17'),
(18, 7, 'Oracle', 'oracle', 'Oracle', '<p>\r\n <span class="_Tgc"><b>Oracle</b> database (<b>Oracle</b> DB) is a relational database management system &#40;RDBMS&#41; from the <b>Oracle</b> Corporation. Originally developed in 1977 by Lawrence Ellison and other developers, <b>Oracle</b> DB is one of the most trusted and widely-used relational database engines.</span></p>', 'Oracle2_20170224041440463807118.jpeg', 'High', 'English', 'Oracle1_201702240414401766992673.png', 'e40540_201702240414401748840799.pdf', '30.00', '10.00', 6, 'Active', 'Yes', 0, 0, '2017-02-24 16:14:40', '2017-02-24 16:14:40'),
(19, 7, 'SQL Server', 'sql-server', 'SQL Server', '<p>\r\n <span class="_Tgc"><b>SQL Server</b> is Microsoft&#39;s relational database management system &#40;RDBMS&#41;. It is a full-featured database primarily designed to compete against competitors Oracle Database (DB) and MySQL. ... <b>SQL Server</b> is sometimes referred to as MSSQL and Microsoft <b>SQL Server</b>.</span></p>', 'SQL Server2_20170224043420682067685.png', 'Beginners', 'English', 'SQL Server1_201702240434201188815766.jpeg', 'SQL Server_201702240434201100359368.png', '30.00', '10.00', 6, 'Active', 'Yes', 1, 2, '2017-02-24 16:34:20', '2017-02-24 16:34:20'),
(20, 7, 'Selenium Testing', 'selenium-testing', 'Selenium Tool', '<p>\r\n <span class="_Tgc _y9e"><b>Selenium</b> provides a record/playback tool for authoring <b>tests</b> without learning a <b>test</b> scripting language (<b>Selenium</b> IDE). It also provides a <b>test</b> domain-specific language (Selenese) to write <b>tests</b> in a number of popular programming languages, including C#, Groovy, Java, Perl, PHP, Python, Ruby and Scala.</span></p>', 'selenium2_20170224043731541211946.jpeg', 'High', 'English', 'selenium1_20170224043731459491976.jpeg', 'selenium_201702240437311001158441.jpeg', '20.00', '10.00', 5, 'Active', 'Yes', 1, 1, '2017-02-24 16:37:31', '2017-02-24 16:37:31'),
(21, 7, 'Web Services Testing', 'web-services-testing', 'Web Services Testing', '<p>\r\n <span class="_Tgc _y9e">Software Applications communicate and exchange data with each other using a WebService. ... REST support XML, Json or exchange of data in simple URL. WSDL is XML based language which will be used to describe the <b>services</b> offered by a <b>web service</b>. SOAP is defined using WSDL. To <b>test</b> WebService you </span></p>', 'Web Services Testing2_201702240441071201868206.png', 'Beginners', 'English', 'Web Services Testing1_201702240441071763285221.png', 'e40540_201702240441071675875030.pdf', '30.00', '10.00', 6, 'Active', 'Yes', 0, 0, '2017-02-24 16:41:07', '2017-02-24 16:41:07'),
(22, 7, 'LoadRunner Tool', 'loadrunner-tool', 'LoadRunner', '<p>\r\n <span class="_Tgc">HPE <b>LoadRunner</b> is a software testing tool from Hewlett Packard Enterprise. In Sept 2016, HPE announced it is selling its software business, including Mercury products, to Micro Focus.</span></p>', 'LoadRunner2_201702240444481146325704.png', 'Advance Java', 'English', 'LoadRunner1_201702240444481040556274.png', 'LoadRunner_201702240444481124724910.png', '15.00', '10.00', 6, 'Active', 'Yes', 0, 0, '2017-02-24 16:44:48', '2017-02-24 16:44:48'),
(23, 7, 'Database Testing', 'database-testing', 'Database Testing Tool', '<p>\r\n Database Testing is one of the major test requirements in case of backend testing. Testing data residing in database requires specific skill set to test properly.</p>', 'Database Testing2_20170224044847253432281.jpeg', 'Beginners', 'English', 'Database Testing1_20170224044847496411544.jpeg', 'Database Testing_201702240448471365649851.jpeg', '15.00', '10.00', 5, 'Active', 'Yes', 0, 0, '2017-02-24 16:48:47', '2017-02-24 16:48:47'),
(24, 7, 'SAP Testing', 'sap-testing', 'SAP Testing', '<p>\r\n SAP is the heartbeat of the global economy. SAP R/3 is an ERP software package implementation designed to coordinate all the key elements required to complete the business process. SAP designed into different functional modules covering the typical functions of an organization.</p>', 'SAP Testing2_20170224045321584377851.jpeg', 'Beginners', 'English', 'SAP Testing1_201702240453211277197380.jpeg', 'sap_testing_tutorial_2017022404532173778901.pdf', '30.00', '10.00', 5, 'Active', 'Yes', 0, 0, '2017-02-24 16:53:21', '2017-02-24 16:53:21'),
(25, 7, 'Mobile Testing', 'mobile-testing', 'Mobile Testing', '<p>\r\n <span class="_Tgc"><b>Mobile</b> application <b>testing</b> is a process by which application software developed for hand held <b>mobile</b> devices is <b>tested</b> for its functionality, usability and consistency. <b>Mobile</b> application <b>testing</b> can be automated or manual type of <b>testing</b>.</span></p>', 'Mobile Testing2_20170224045713742422287.jpeg', 'Beginners', 'English', 'Mobile Testing1_20170224045713391603537.jpeg', 'Mobile Testing_20170224045713972064372.jpeg', '30.00', '10.00', 6, 'Active', 'Yes', 0, 0, '2017-02-24 16:57:13', '2017-02-24 16:57:13'),
(26, 7, 'Spring in java', 'spring-in-java', 'Spring', '<p>\r\n <span class="_Tgc _y9e">The <b>Spring</b> Framework is an application framework and inversion of control container for the <b>Java</b> platform. The framework&#39;s core features can be used by any <b>Java</b> application, but there are extensions for building web applications on top of the <b>Java</b> EE platform.</span></p>', 'Springs2_201702240502451208036135.jpeg', 'Beginners', 'English', 'Springs1_20170224050245371079052.jpeg', 'Springs_201702240502451498790748.jpeg', '20.00', '10.00', 5, 'Active', 'Yes', 0, 0, '2017-02-24 17:02:45', '2017-02-24 17:02:45'),
(27, 7, 'GRE Course', 'gre-course', 'GRE Course', '<p>\r\n <span class="_Tgc _y9e">Much like the SAT and ACT, the <b>GRE</b> exam is a broad assessment of your critical thinking, analytical writing, verbal reasoning, and quantitative reasoning skills — all skills developed over the course of many years. Some schools may also require you to take one or more <b>GRE</b> Subject Tests</span></p>', 'GRE Course2_201702240508351996320414.png', 'Beginners', 'English', 'GRE Course1_20170224050835964841420.jpeg', 'GRE Course_201702240508351559045890.jpeg', '20.00', '10.00', 5, 'Active', 'Yes', 0, 0, '2017-02-24 17:08:35', '2017-02-24 17:08:35'),
(28, 7, 'Struts in java', 'struts-in-java', 'Struts', '<p>\r\n <span class="_Tgc"><b>Struts</b> is an open source framework that extends the <b>Java</b> Servlet API and employs a Model, View, Controller (MVC) architecture. It enables you to create maintainable, extensible, and flexible web </span></p>', 'Struts2_201702240513141851245046.jpeg', 'Beginners', 'English', 'Struts1_2017022405131483947441.jpeg', 'Struts_2017022405131454081050.png', '20.00', '10.00', 5, 'Active', 'Yes', 1, 0, '2017-02-24 17:13:14', '2017-02-24 17:13:14'),
(29, 7, 'Salesforce', 'salesforce', 'Salesforce', '<p>\r\n <span class="_Tgc _y9e"><b>Salesforce</b> is the leader in cloud computing, offering applications for all aspects of your business, including CRM, sales, ERP, customer service, marketing automation, business analytics, mobile application building, and much more.</span></p>', 'Salesforce2_201702240520311698111364.jpeg', 'Beginners', 'English', 'Salesforce1_20170224052031721176448.jpeg', NULL, '20.00', '10.00', 6, 'Active', 'Yes', 0, 0, '2017-02-24 17:20:31', '2017-02-24 17:20:31'),
(30, 7, 'JQuery', 'jquery', 'JQuery', '<p>\r\n <span class="_Tgc"><b>jQuery</b> is a concise and fast JavaScript library that can be used to simplify event handling, HTML document traversing, Ajax interactions and animation for speedy website development. <b>jQuery</b> simplifies the HTML&#39;s client-side scripting, thus simplifying Web 2.0 applications development.</span></p>', 'JQuery2_20170224052527417619731.png', 'Beginners', 'English', 'JQuery1_201702240525271041510943.png', 'jquery_tutorial_201702240525271361816430.pdf', '30.00', '10.00', 6, 'Active', 'Yes', 0, 0, '2017-02-24 17:25:27', '2017-02-24 17:25:27');

-- --------------------------------------------------------

--
-- Table structure for table `pre_tutor_selling_courses_curriculum`
--

CREATE TABLE `pre_tutor_selling_courses_curriculum` (
  `file_id` bigint(20) NOT NULL,
  `sc_id` int(11) NOT NULL,
  `title` varchar(512) NOT NULL,
  `source_type` enum('url','file') NOT NULL,
  `file_name` varchar(512) NOT NULL,
  `file_ext` varchar(10) DEFAULT NULL,
  `file_size` varchar(128) DEFAULT NULL COMMENT 'In Bytes. When displaying convert as needed'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pre_tutor_selling_courses_curriculum`
--

INSERT INTO `pre_tutor_selling_courses_curriculum` (`file_id`, `sc_id`, `title`, `source_type`, `file_name`, `file_ext`, `file_size`) VALUES
(1, 1, 'Introduction to PHP', 'file', '1_1_201702240118192137827355.mp4', 'mp4', '8819935'),
(2, 1, 'Conditionals and Control Flow', 'url', 'https://www.codecademy.com/courses/web-beginner-en-StaFQ/0/1?curriculum_id=5124ef4c78d510dd89003eb8', NULL, NULL),
(3, 2, 'Introduction to JS', 'url', 'https://www.w3schools.com/js/js_intro.asp', NULL, NULL),
(4, 2, 'vaScript Syntax', 'url', 'https://www.w3schools.com/js/js_syntax.asp', NULL, NULL),
(5, 2, 'JavaScript Statements', 'url', 'https://www.w3schools.com/js/js_statements.asp', NULL, NULL),
(6, 3, 'Asp.Net Course', 'url', 'https://www.youtube.com/watch?v=wQZRC7vXT08', NULL, NULL),
(7, 3, 'Asp.Net Course', 'url', 'https://www.youtube.com/watch?v=wQZRC7vXT08', NULL, NULL),
(8, 4, 'VB.Net Curriculum', 'url', 'https://www.youtube.com/watch?v=4iMS3Y0yei8', NULL, NULL),
(9, 5, 'VB.NET Advanced Course', 'url', 'https://www.youtube.com/watch?v=4iMS3Y0yei8', NULL, NULL),
(10, 6, 'Core Java Curriculum', 'file', '6_1_201702240302481429849223.pdf', 'pdf', '4478613'),
(11, 7, 'Advanced Java Course', 'file', '7_1_201702240309031544630272.pdf', 'pdf', '4478613'),
(12, 8, 'J2EE', 'url', 'https://www.youtube.com/watch?v=H9VT8S9yIh4', NULL, NULL),
(13, 9, 'Adobe Photoshop', 'url', 'https://www.youtube.com/watch?v=pFyOznL9UvA', NULL, NULL),
(14, 10, 'Adobe illustrator', 'file', '10_1_201702240330362023307460.pdf', 'pdf', '20006876'),
(15, 11, 'Adobe indesign', 'file', '11_1_201702240336221839383101.pdf', 'pdf', '20006876'),
(16, 12, 'Adobe premiere', 'url', 'https://www.youtube.com/watch?v=Hls3Tp7JS8E', NULL, NULL),
(17, 13, 'AutoCAD Curriculum ', 'file', '13_1_20170224034846356440815.pdf', 'pdf', '6244949'),
(18, 14, 'Unix', 'file', '14_1_201702240353181933035479.jpeg', 'jpeg', '4416'),
(19, 15, 'Linux Curriculum', 'url', 'https://www.youtube.com/watch?v=HIXzJ3Rz9po', NULL, NULL),
(20, 16, 'C Language', 'file', '16_1_201702240403272010145415.pdf', 'pdf', '1614974'),
(21, 17, 'C ++ Language', 'url', 'https://www.youtube.com/watch?v=-CpG3oATGIs', NULL, NULL),
(22, 18, 'Oracle Curriculum', 'url', 'https://www.youtube.com/watch?v=Kk6MuZegDNs', NULL, NULL),
(23, 19, 'SQL Server Curriculum', 'url', 'https://www.youtube.com/watch?v=ZanGRT1MsHM', NULL, NULL),
(24, 20, 'Selenium Testing ', 'url', 'https://www.youtube.com/watch?v=eNCzuCxuEXM', NULL, NULL),
(25, 21, 'Web Services Testing', 'url', 'https://www.youtube.com/watch?v=ijMT1HIO9tg', NULL, NULL),
(26, 22, 'LoadRunner Tool Curriculum', 'file', '22_1_20170224044448397078478.pdf', 'pdf', '6717800'),
(27, 23, 'Database Testing Curriculum', 'url', 'https://www.youtube.com/watch?v=sRaPFn9ZQDs', NULL, NULL),
(28, 24, 'SAP Testing Curriculum', 'url', 'https://www.youtube.com/watch?v=jBNUiWFtfVM', NULL, NULL),
(29, 25, 'Mobile Testing Curriculum', 'url', 'https://www.youtube.com/watch?v=mTIdoDEuXrM', NULL, NULL),
(30, 26, 'Spring Curriculum', 'url', 'https://www.youtube.com/watch?v=-weKK-oNuhA', NULL, NULL),
(31, 27, 'GRE Course Curriculum', 'url', 'https://www.youtube.com/watch?v=9kcmT1_lz3g', NULL, NULL),
(32, 28, 'Struts in java Curriculum', 'url', 'https://www.youtube.com/watch?v=28AfOA2I6LE', NULL, NULL),
(33, 29, 'Salesforce', 'url', 'https://www.youtube.com/watch?v=9Gsmiff27do', NULL, NULL),
(34, 30, 'JQuery Curriculum', 'file', '30_1_201702240525271569144267.pdf', 'pdf', '2424486');

-- --------------------------------------------------------

--
-- Table structure for table `pre_tutor_teaching_types`
--

CREATE TABLE `pre_tutor_teaching_types` (
  `id` int(11) NOT NULL,
  `tutor_id` int(11) NOT NULL,
  `teaching_type_id` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1-active, 0-inactive',
  `sort_order` int(11) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pre_tutor_teaching_types`
--

INSERT INTO `pre_tutor_teaching_types` (`id`, `tutor_id`, `teaching_type_id`, `status`, `sort_order`, `created_at`) VALUES
(1, 7, 1, 1, 0, '2016-11-08 14:37:39'),
(2, 7, 2, 1, 0, '2016-11-08 14:37:39'),
(3, 7, 3, 1, 0, '2016-11-08 14:37:39'),
(4, 8, 1, 1, 0, '2016-11-08 15:20:14'),
(5, 9, 3, 1, 0, '2016-11-08 16:32:40'),
(6, 10, 2, 1, 0, '2016-11-08 17:19:08'),
(7, 11, 1, 1, 0, '2016-11-08 17:20:35'),
(8, 11, 2, 1, 0, '2016-11-08 17:20:35'),
(9, 11, 3, 1, 0, '2016-11-08 17:20:35'),
(10, 53, 1, 1, 0, '2016-11-10 12:11:47'),
(11, 53, 2, 1, 0, '2016-11-10 12:11:47'),
(12, 53, 3, 1, 0, '2016-11-10 12:11:47'),
(13, 54, 1, 1, 0, '2016-11-10 12:21:55'),
(14, 54, 2, 1, 0, '2016-11-10 12:21:55'),
(15, 54, 3, 1, 0, '2016-11-10 12:21:55'),
(16, 55, 1, 1, 0, '2016-11-10 12:28:46'),
(17, 55, 2, 1, 0, '2016-11-10 12:28:46'),
(18, 55, 3, 1, 0, '2016-11-10 12:28:46'),
(19, 57, 1, 1, 0, '2016-11-10 12:36:16'),
(20, 57, 2, 1, 0, '2016-11-10 12:36:16'),
(21, 57, 3, 1, 0, '2016-11-10 12:36:16'),
(22, 58, 1, 1, 0, '2016-11-10 12:46:09'),
(23, 58, 2, 1, 0, '2016-11-10 12:46:09'),
(24, 58, 3, 1, 0, '2016-11-10 12:46:09'),
(25, 59, 1, 1, 0, '2016-11-10 12:56:47'),
(26, 59, 2, 1, 0, '2016-11-10 12:56:47'),
(27, 59, 3, 1, 0, '2016-11-10 12:56:47'),
(28, 60, 1, 1, 0, '2016-11-10 13:04:51'),
(29, 60, 2, 1, 0, '2016-11-10 13:04:51'),
(30, 60, 3, 1, 0, '2016-11-10 13:04:51'),
(31, 61, 1, 1, 0, '2016-11-10 13:17:32'),
(32, 61, 2, 1, 0, '2016-11-10 13:17:32'),
(33, 61, 3, 1, 0, '2016-11-10 13:17:32'),
(34, 62, 1, 1, 0, '2016-11-10 14:33:55'),
(35, 62, 2, 1, 0, '2016-11-10 14:33:55'),
(36, 62, 3, 1, 0, '2016-11-10 14:33:55'),
(37, 63, 1, 1, 0, '2016-11-10 14:51:03'),
(38, 63, 2, 1, 0, '2016-11-10 14:51:03'),
(39, 63, 3, 1, 0, '2016-11-10 14:51:03'),
(40, 64, 1, 1, 0, '2016-11-10 14:59:49'),
(41, 64, 2, 1, 0, '2016-11-10 14:59:49'),
(42, 64, 3, 1, 0, '2016-11-10 14:59:49'),
(43, 65, 1, 1, 0, '2016-11-10 15:09:21'),
(44, 65, 2, 1, 0, '2016-11-10 15:09:21'),
(45, 65, 3, 1, 0, '2016-11-10 15:09:21'),
(46, 66, 1, 1, 0, '2016-11-10 15:38:44'),
(47, 66, 2, 1, 0, '2016-11-10 15:38:44'),
(48, 66, 3, 1, 0, '2016-11-10 15:38:44'),
(49, 68, 1, 1, 0, '2016-11-10 16:10:04'),
(50, 68, 2, 1, 0, '2016-11-10 16:10:04'),
(51, 68, 3, 1, 0, '2016-11-10 16:10:04'),
(52, 69, 1, 1, 0, '2016-11-10 16:57:19'),
(53, 69, 2, 1, 0, '2016-11-10 16:57:19'),
(54, 69, 3, 1, 0, '2016-11-10 16:57:19'),
(55, 70, 1, 1, 0, '2016-11-10 17:02:57'),
(56, 70, 2, 1, 0, '2016-11-10 17:02:57'),
(57, 70, 3, 1, 0, '2016-11-10 17:02:57'),
(58, 72, 1, 1, 0, '2016-11-10 17:13:06'),
(59, 72, 2, 1, 0, '2016-11-10 17:13:06'),
(60, 72, 3, 1, 0, '2016-11-10 17:13:06'),
(61, 105, 1, 1, 0, '2017-02-03 15:43:18'),
(62, 105, 2, 1, 0, '2017-02-03 15:43:18'),
(63, 105, 3, 1, 0, '2017-02-03 15:43:18'),
(64, 105, 4, 1, 0, '2017-02-03 15:43:18');

-- --------------------------------------------------------

--
-- Table structure for table `pre_users`
--

CREATE TABLE `pre_users` (
  `id` int(11) NOT NULL,
  `ip_address` varchar(15) NOT NULL DEFAULT '127.0.0.1',
  `username` varchar(100) NOT NULL,
  `slug` varchar(512) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `salt` varchar(255) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `activation_code` varchar(40) DEFAULT NULL,
  `forgotten_password_code` varchar(40) DEFAULT NULL,
  `forgotten_password_time` int(11) UNSIGNED DEFAULT NULL,
  `remember_code` varchar(40) DEFAULT NULL,
  `created_on` int(11) UNSIGNED NOT NULL,
  `last_login` int(11) UNSIGNED DEFAULT NULL,
  `active` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `gender` enum('Male','Female') NOT NULL DEFAULT 'Male',
  `company` varchar(100) DEFAULT NULL,
  `phone_code` varchar(5) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `seo_keywords` varchar(1000) DEFAULT NULL,
  `meta_desc` varchar(1000) DEFAULT NULL,
  `photo` varchar(512) DEFAULT '',
  `location_id` int(11) DEFAULT '0',
  `language_of_teaching` varchar(512) DEFAULT '',
  `teaching_experience` int(11) DEFAULT '0',
  `duration_of_experience` enum('Months','Years') DEFAULT 'Months',
  `experience_desc` longtext,
  `video_profile_url` varchar(512) DEFAULT '',
  `show_contact` enum('All','Email','Mobile','None') DEFAULT 'None',
  `visibility_in_search` enum('0','1') DEFAULT '1',
  `availability_status` enum('0','1') DEFAULT '1',
  `profile` varchar(512) DEFAULT '',
  `no_of_profile_views` int(11) DEFAULT '0',
  `qualification` varchar(512) DEFAULT '',
  `tutor_rating` int(5) DEFAULT '0',
  `is_profile_update` tinyint(1) NOT NULL DEFAULT '0',
  `facebook` varchar(512) DEFAULT '',
  `twitter` varchar(512) DEFAULT '',
  `linkedin` varchar(512) DEFAULT '',
  `skype` varchar(512) DEFAULT '',
  `isTestimonyGiven` enum('0','1') DEFAULT '0',
  `is_social_login` enum('yes','no') DEFAULT 'no',
  `website` varchar(256) DEFAULT NULL,
  `profile_page_title` varchar(512) DEFAULT '',
  `willing_to_travel` decimal(10,2) DEFAULT '0.00',
  `own_vehicle` enum('yes','no') DEFAULT 'no',
  `land_mark` varchar(512) DEFAULT NULL,
  `country` varchar(256) DEFAULT NULL,
  `pin_code` char(10) DEFAULT NULL,
  `paypal_email` varchar(100) DEFAULT NULL,
  `bank_ac_details` varchar(512) DEFAULT NULL,
  `academic_class` enum('yes','no') DEFAULT 'yes',
  `non_academic_class` enum('yes','no') DEFAULT 'yes',
  `share_phone_number` enum('yes','no') DEFAULT 'no',
  `is_online` enum('yes','no') DEFAULT 'no',
  `city` varchar(256) DEFAULT NULL,
  `user_belongs_group` int(11) DEFAULT NULL,
  `subscription_id` int(11) DEFAULT NULL,
  `free_demo` enum('Yes','No') DEFAULT 'No',
  `admin_approved` enum('Yes','No') DEFAULT 'No' COMMENT 'If admin enables to approve tutors by admin',
  `admin_approved_date` datetime DEFAULT NULL,
  `i_love_tutoring_because` varchar(1000) DEFAULT NULL,
  `other_interests` varchar(1000) DEFAULT NULL,
  `net_credits` int(25) NOT NULL DEFAULT '0',
  `parent_id` int(11) NOT NULL DEFAULT '0' COMMENT 'it will be the id of institute id if institute added this tutor',
  `last_updated` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pre_users`
--

INSERT INTO `pre_users` (`id`, `ip_address`, `username`, `slug`, `password`, `salt`, `email`, `activation_code`, `forgotten_password_code`, `forgotten_password_time`, `remember_code`, `created_on`, `last_login`, `active`, `first_name`, `last_name`, `dob`, `gender`, `company`, `phone_code`, `phone`, `seo_keywords`, `meta_desc`, `photo`, `location_id`, `language_of_teaching`, `teaching_experience`, `duration_of_experience`, `experience_desc`, `video_profile_url`, `show_contact`, `visibility_in_search`, `availability_status`, `profile`, `no_of_profile_views`, `qualification`, `tutor_rating`, `is_profile_update`, `facebook`, `twitter`, `linkedin`, `skype`, `isTestimonyGiven`, `is_social_login`, `website`, `profile_page_title`, `willing_to_travel`, `own_vehicle`, `land_mark`, `country`, `pin_code`, `paypal_email`, `bank_ac_details`, `academic_class`, `non_academic_class`, `share_phone_number`, `is_online`, `city`, `user_belongs_group`, `subscription_id`, `free_demo`, `admin_approved`, `admin_approved_date`, `i_love_tutoring_because`, `other_interests`, `net_credits`, `parent_id`, `last_updated`) VALUES
(1, '127.0.0.1', 'administrator', 'administrator', '$2y$08$3fjJSaWH/Zp7vHKKpOfN..MDF7AtSlKexWDAel3xtTx3VRVJkJO0G', '', 'admin@admin.com', '', NULL, NULL, NULL, 1268889823, 1487937476, 1, 'Admin', 'istrator', '0000-00-00', 'Male', 'ADMIN', NULL, '1234567890', NULL, NULL, '', 2, '', 0, 'Months', '', '', 'All', '1', '1', '', 0, '', 0, 1, '', '', '', '', '0', 'no', NULL, '', '2.00', 'no', NULL, NULL, NULL, '', '', 'yes', 'yes', 'no', 'yes', NULL, 1, NULL, 'No', 'No', NULL, NULL, NULL, 2147483647, 0, NULL),
(2, '::1', 'Ayzlee Rayhanna', 'ayzlee-rayhanna', '$2y$08$e.RfRKrbtPbYTxQzyKHIwuHiUZGT/AyZIhkvui8xAo3Q4889jjcRq', NULL, 'raju72314@gmail.com', '677ee0755f6053e7893e8765cd17de6f4f0b3ac9', NULL, NULL, NULL, 1478585457, 1487938833, 1, 'Ayzlee', 'Rayhanna', '1990-08-08', 'Male', NULL, '1', '7207757581', '', '', '2.jpg', 0, 'English,French,Hindi', 0, 'Months', NULL, '', 'All', '1', '1', 'I Completed B.Tech and looking for a tutor who can help in M.Tech .', 0, 'B.Tech', 0, 1, 'facebook.com', 'twitter.com', 'linkedin.com', 'ayzlee12 @ gmail.com', '0', 'no', '', 'Ayzlee Rayhanna', '5.00', 'yes', 'white house', 'United States', '417147', NULL, NULL, 'yes', 'yes', 'no', 'yes', 'New York', 2, 2, 'Yes', 'No', NULL, NULL, NULL, 949, 0, '2017-02-24 18:27:41'),
(3, '::1', 'Azalya Abia', 'azalya-abia', '$2y$08$IK16bEIjBaRRtB659BZzdOlda1SzlN.aNkzu8d5Hd16OCro0O/ODq', NULL, 'micheljohn930@gmail.com', '8312c72caa857b3533ba3848f14a2f9413b7f08d', NULL, NULL, NULL, 1478585514, 1488173023, 1, 'Azalya', 'Abia', '1995-11-10', 'Male', NULL, '1684', '7207757581', '', '', '3.jpg', 0, 'English,Arabic,Dutch', 0, 'Months', NULL, '', 'Email', '1', '1', 'Hi i am Azalya . I Completed  My Graduation . I am looking for Good Tutors to learn things', 0, 'B.Tech', 0, 1, '', '', '', 'micheljohn930@gmail.com', '0', 'no', '', 'Azalya Abia', '6.00', 'yes', 'white house', 'United States', '417147', NULL, NULL, 'yes', 'yes', 'no', 'no', 'New York', 2, 64, 'No', 'No', NULL, NULL, NULL, 9185, 0, '2017-02-23 15:35:26'),
(4, '::1', 'Azani Nathalya', 'azani-nathalya', '$2y$08$xgEuUpWm/gnJkSe6iYUyy.1jKbSnLqzvKqTaIYx4AFkO.EnmZ/2MW', NULL, 'maryfernadas@gmail.com', 'c8aec712e4febf0b558f7c2d8f1a46c2c59553ff', NULL, NULL, NULL, 1478585559, 1479905576, 1, 'Azani', 'Nathalya', NULL, 'Male', NULL, '1684', '7207757581', '', '', '4.jpg', 0, '', 0, 'Months', NULL, '', 'None', '1', '1', 'Hi i am  Azani Nathalya . Now i studying B.Tech  Second Year . i need a tutor who can help in B.Tech ECE Second year subjects', 0, 'B.Sc', 0, 1, '', '', '', '', '0', 'no', NULL, 'Azani Nathalya', '5.00', 'no', 'white house', 'United States', '412146', NULL, NULL, 'yes', 'yes', 'no', 'yes', 'New York', 2, 4, 'No', 'No', NULL, NULL, NULL, 50, 0, '2016-11-09 18:17:38'),
(5, '::1', 'Bae Mirage', 'bae-mirage', '$2y$08$BwLx99dRWL8nTHkZ63T4qum7S84DN0miykD8eojZ.rg2ypZ/k1L6K', NULL, 'mikemichel532@gmail.com', 'fab71013f6ca0b67d950ef2d53fa1cce656e7f5a', NULL, NULL, NULL, 1478585695, 1479962733, 1, 'Bae', 'Mirage', '1995-10-17', 'Male', NULL, '376', '7207757581', '', '', '5.jpg', 0, 'English,French,Hindi,Dutch', 0, 'Months', NULL, '', 'All', '1', '1', 'i am  Bae Mirage . Now i studying B.Tech  Second Year . i need a tutor who can help in B.Tech ECE  subjects', 0, 'BA', 0, 1, '', '', '', 'mikemichel532@gmail.com', '0', 'no', '', 'Bae Mirage', '6.00', 'no', 'white house', 'United States', '417147', NULL, NULL, 'yes', 'yes', 'no', 'no', 'New Yourk', 2, 5, 'Yes', 'No', NULL, NULL, NULL, 400, 0, '2016-11-09 18:20:56'),
(6, '::1', 'Baeleigh Elmina', 'baeleigh-elmina', '$2y$08$fOWchSstgAf/ABTP73Zb6uEePhtgYL16WbpJUu6Ni6uePJ6CjEjeO', NULL, 'rahulsanith@gmail.com', '73373d6b8e27d6d524ee7206fe5709fa5e21d1c9', NULL, NULL, NULL, 1478585747, 1479732414, 1, 'Baeleigh', 'Elmina', '1996-09-18', 'Male', NULL, '1684', '7207757581', '', '', '6.jpg', 0, 'English,French,Arabic', 0, 'Months', NULL, '', 'None', '1', '1', 'Hi i am  Baeleigh Elmina . Now i studying B.sc  Second Year . i need a tutor who can help in B.sc Second year subjects', 0, 'B.Sc', 0, 1, '', '', '', 'rahulsanith@gmail.com', '0', 'no', '', 'Baeleigh Elmina', '8.00', 'yes', 'white house', 'Angola', '417147', NULL, NULL, 'yes', 'yes', 'no', 'no', 'New York', 2, 7, 'No', 'No', NULL, NULL, NULL, 900, 0, '2016-11-09 18:24:26'),
(7, '::1', 'Behati Corinn', 'behati-corinn', '$2y$08$DjEduugrgIENEZZ53RoUVeqWwnyaEhImgsnnwLvCc/Kejf/6/P4HS', NULL, 'bellaadwerd123@gmail.com', '3616d2cb71fd0026519baa2428a6a265edf73685', NULL, NULL, NULL, 1478585801, 1487926761, 1, 'Behati', 'Corinn', '1985-11-12', 'Male', NULL, '1', '7207757581', 'Online tutors', 'Online tutors', '7.jpg', 0, 'English', 10, 'Years', 'Experienced Tutor For C, C++, DBMS, Data Structures, Java And Javascript With 10 Years Of Teaching Experienc', '', 'All', '1', '1', 'I try to make teaching interactive as I know now a days students also are aware about their studies and surroundings which will keep me updated.', 0, 'B.Tech', 0, 1, 'facebook.com', 'twitter.com', 'linkedin.com', '', '0', 'no', '', 'Behati Corinn', '1.00', 'no', 'Phoenix City Hall', 'United States', '85003', 'bellaadwerd123@gmail.com', 'Bank code (Bankleitzahl): 20811008\r\ndomestic account number: 1039531801 \r\nIBAN: AL90208110080000001039531801', 'yes', 'yes', 'no', 'no', 'Phoenix', 3, 59, 'Yes', 'No', NULL, NULL, NULL, 6856, 0, '2017-02-17 17:13:55'),
(8, '::1', 'Berit Jaleiah', 'berit-jaleiah', '$2y$08$XzEGYvrtpPhJtmnQBVnE8.YrgsIWQlScTKVbHe.Br7pQ27uAeQ8.C', NULL, 'suryampurnam123@gmail.com', 'f555423e4255fffa8c49c5aa3283b43fe0c84fa2', NULL, NULL, NULL, 1478585846, 1479898115, 1, 'Berit', 'Jaleiah', '1980-11-06', 'Male', NULL, '1684', '7207757581', '', '', '8.jpg', 0, 'English', 4, 'Years', 'Having 4 years of real-time and 3 year of teaching experience in Chemistry , Maths, Physics.', '', 'Mobile', '1', '1', 'Able to connect with children, understand their level and proceed accordingly. Patient, Flexible, Professional in classroom, Good Knowledge of Subject.', 0, 'M.Sc', 0, 1, 'facebook.com', 'twitter.com', 'linkedin.com', '', '0', 'no', '', 'Berit Jalel', '30.00', 'yes', 'West Ave', 'United States', '78218', 'suryampurnam123@gmail.com', 'Bank code (Bankleitzahl): 20503\r\ndomestic account number: 2101023600\r\nIBAN: AT022050302101023600', 'yes', 'yes', 'no', 'no', 'San Antonio', 3, NULL, 'Yes', 'No', NULL, NULL, NULL, 3, 0, '2016-11-11 14:14:08'),
(9, '::1', 'Bhavya Ezmay', 'bhavya-ezmay', '$2y$08$jEKnPnzkDk1NUaaA2eoWn.s9vaAtJSEbx6jun4oAex9aF/wK/zPJe', NULL, 'prasadraodami@gmail.com', '31a35c92c0cc05bec62385d30ca4d8537dcf942e', NULL, NULL, NULL, 1478585894, 1479977712, 1, 'Bhavya', 'Ezmay', '1985-11-01', 'Female', NULL, '93', '7207757581', '', '', '9.jpg', 0, 'English', 4, 'Years', 'Having 4 years of teaching experience in my sql,oracle,Testing,Dreamweaver,adobe photoshop.', '', 'All', '1', '1', 'I take pride in making complex concept look very easy to understand and master. I believe in educating and not just teaching my student', 0, 'M.Sc', 0, 1, 'facebook.com', 'twitter.com', 'linkedin.com', '', '0', 'no', '', 'BhavyaEz', '40.00', 'no', 'Noland Rd', 'United States', '64057', 'prasadraodami@gmail.com', ' Bank code (Bankleitzahl): 20504\r\ndomestic account number: 2101023620\r\nIBAN: AT022050302101023601', 'yes', 'yes', 'no', 'no', 'independence', 3, NULL, 'Yes', 'No', NULL, NULL, NULL, 175, 0, '2016-11-24 14:25:51'),
(10, '::1', 'Bijou Kaybrie', 'bijou-kaybrie', '$2y$08$fZ53wxWrkCgr7PVRRLSHIe1RAZWOk9kB7IQk5fU3KtGDEnHX8FgHW', NULL, 'balajireddydami@gmail.com', 'ac34e3ce699801698ee4fdee35c00546b674a2ca', NULL, NULL, NULL, 1478585981, 1479733197, 1, 'Bijou', 'Kaybrie', '1986-09-03', 'Male', NULL, '1684', '7207757581', '', '', '10.jpg', 0, '', 8, 'Years', 'Hi, This is Bijou. I have 8 years of experience of tutoring in the field of education. I have done MCA and currently working with a reputed school. I am open to teach one-to-one or group classes.I own a conveyance and can teach at mentioned locations.', '', 'All', '1', '1', 'Hi, This is Bijou. I have 8 years of experience of tutoring in the field of education. I have done MCA and currently working with a reputed school. I am open to teach one-to-one or group classes.I own a conveyance and can teach at mentioned locations.', 0, 'MCA', 0, 1, '', '', '', '', '0', 'no', '', 'Bijou', '20.00', 'yes', 'Bellevue', 'United States', '30002', 'balajireddydami@gmail.com', ' Bank code (Bankleitzahl): 20564\r\ndomestic account number: 2101023656\r\nIBAN: AT022050302101023690', 'yes', 'yes', 'no', 'no', 'atlanta', 3, NULL, 'Yes', 'No', NULL, NULL, NULL, 0, 0, '2016-11-08 12:30:34'),
(11, '::1', 'Brenae Allivia', 'brenae-allivia', '$2y$08$GDGwi9WLfSRy1VTzZsT0t.zT2stFBeftJ2waOtqx8VF0JCZKqqDoe', NULL, 'rajeshkumardami@gmail.com', 'fad5c6d2aafa3ea7e0df2ab9560eaca8255582e6', NULL, NULL, NULL, 1478586031, 1479733266, 1, 'Brenae', 'Allivia', '1993-11-08', 'Male', NULL, '1684', '7207757581', '', '', '11.jpg', 0, 'English', 6, 'Years', '6 years teaching experience in Maths and Physics.', '', 'None', '1', '1', 'I am a Post Graduate with Engineering background with more than 6 years teaching experience in Maths and Physics. I am having expert command over the subjects from CBSE/ICSE/State/International syllabi.', 0, 'B.Tech', 0, 1, '', '', '', '', '0', 'no', '', 'Brenae Allivia', '20.00', 'yes', 'Glessner House', 'United States', '60601', 'rajeshkumardami@gmail.com', 'Bank code (Bankleitzahl): 20811008\r\ndomestic account number: 1039531801 \r\nIBAN: AL90208110080000001039531801', 'yes', 'yes', 'no', 'no', 'Chicago', 3, NULL, 'No', 'No', NULL, NULL, NULL, 0, 0, '2016-11-08 12:30:43'),
(12, '::1', 'Bayler Liera', 'bayler-liera', '$2y$08$ZI/ih5DKNdoP.23l37dpkeSXzacGpCxe59lAwpIynYcRM9cA.Jhqm', NULL, 'pavanconqeurors@gmail.com', 'b17d62f161f7530c10d909cfb3bb384a804943f1', NULL, NULL, NULL, 1478588054, 1479979396, 1, 'Bayler', 'Liera', '1980-11-06', 'Male', NULL, '1684', '7207757581', '', '', '12.jpg', 0, 'English,French,Hindi,Arabic', 2010, 'Months', '10 Years of Experience , in Software Courses', '', 'None', '1', '1', 'We provide comprehensive and rigorous coaching for the Software jobs. Our student-centered guidance focuses on the strengths and weaknesses of each student. This has enabled us to achieve a proven track record of Job Holders in Big MNC Companies from our institute.', 0, '', 0, 1, '', '', '', '', '0', 'no', '', 'Bayler Liera', '0.00', 'no', NULL, NULL, NULL, 'pavanconqeurors@gmail.com', 'Bank code (Bankleitzahl): 20811008\r\ndomestic account number: 1039531801\r\nIBAN: AL90208110080000001039531801 ', 'yes', 'yes', 'no', 'no', NULL, 4, NULL, 'No', 'No', NULL, NULL, NULL, 0, 0, '2016-11-08 12:30:59'),
(13, '::1', 'Bebe Esmie', 'bebe-esmie', '$2y$08$iBUxjGlcTePbSKL4T3pUteqa/5mpPTWBPHZI4HRVWhjopoEe5Ot2K', NULL, 'bebe34@gma.com', 'b56536c7830e5642d3e89fe2dfc9c35375cf7405', NULL, NULL, NULL, 1478588237, 1479973101, 1, 'Bebe', 'Esmie', '2005-11-02', 'Male', NULL, '1', '7207757581', 'bebe esmie, online course institutes', 'bebe esmie, online course institutes', '13.jpg', 0, 'English,French,Hindi,Dutch,portuguese', 2005, 'Months', '10+ Years of Experience  , Our student-centered guidance focuses on the strengths and weaknesses of each student.', '', 'All', '1', '1', 'Bebe Esmie was established in the year 2005 with a prime motto of imparting quality Software Engineers in various software fields   From a small coaching centre with just a handful of students in the year 2005, the institute has grown by leaps and bounds and established itself as one of the leading institutions in India', 0, '', 0, 1, 'https://www.facebook.com/', 'https://twitter.com/', 'https://www.linkedin.com/', '', '0', 'no', '', 'Bebe Esmie', '0.00', 'no', 'Opps Hotel', 'United States', '4151421', 'bebe34@gma.com', 'Bank code (Bankleitzahl): 20811008\r\ndomestic account number: 1039531801\r\nIBAN: AL90208110080000001039531801 ', 'yes', 'yes', 'no', 'no', 'New Yourk', 4, 15, 'Yes', 'No', NULL, NULL, NULL, 987, 0, '2016-11-24 10:11:40'),
(14, '::1', 'Behati Corinn', 'behati-corinn-1', '$2y$08$bG.ALNl7YnnrDVsCsoW2zOHRNoSgDGm61Vr7ZIdRaIQKtT3lFtBfS', NULL, 'behati70@gma.com', '6c1a7a273ce7b1aec377b8f6ea86415c19cedaad', NULL, NULL, NULL, 1478588280, 1479886723, 1, 'Behati', 'Corinn', '2000-10-03', 'Male', NULL, '1684', '7207757581', '', '', '14.jpg', 0, 'English,French,Hindi,Dutch', 2000, 'Months', '16 Years of Experience in Building Software Engineers', '', 'Email', '1', '1', 'Our core objective is to progress exponentially with focus on quality deliveries, spread across key IT cities thus gaining wide recognition as one of the most competent entities in the field and to aim at being a public trading company listed on major bourses.\r\nWe are here for the long run and continue to grow our business by exploiting our competitive edge achieved through unwavering focus and the can-do spirit of our people.', 0, '', 0, 1, '', '', '', '', '0', 'no', '', 'Behati Corinn', '0.00', 'no', NULL, NULL, NULL, 'behati70@gma.com', 'Bank code (Bankleitzahl): 20811008\r\ndomestic account number: 1039531801\r\nIBAN: AL90208110080000001039531801 ', 'yes', 'yes', 'no', 'no', NULL, 4, NULL, 'Yes', 'No', NULL, NULL, NULL, 0, 0, '2016-11-08 12:31:20'),
(15, '::1', 'Beily Raegin', 'beily-raegin', '$2y$08$ShccUs38FXClpMijpyQYWuTuvdMWq14Fep41HVl5poK7g9rLdBiYe', NULL, 'beily72@gma.com', '0328cb78a68fe561927c40f72eb16d0600f38657', NULL, NULL, NULL, 1478588313, 1479886828, 1, 'Beily', 'Raegin', '1990-11-02', 'Male', NULL, '1684', '7207757581', '', '', '15.jpg', 0, 'English,French,Arabic,Urdu,Dutch', 2007, 'Months', '9 Years of  Experience in Building Software Engineers and Placed in Big MNC Companies', '', 'None', '1', '1', 'Beily Raegin is not just the one stop solution for your Training requirements, but it is also a well managed organization, with passionate, experienced, and committed clan of young and innovative minds. We see to mark innovation at every walk of our path. We intended to provide the best Training services as per your Structural & organizational requirements. Beily Raegin  is just the right place for every company, who wants to keep itself well equipped with the changing technology.', 0, '', 0, 1, '', '', '', '', '0', 'no', '', 'Beily Raegin', '0.00', 'no', 'White House', 'American Samoa', '612435', 'beily72@gma.com', 'Bank code (Bankleitzahl): 20811008\r\ndomestic account number: 1039531801\r\nIBAN: AL90208110080000001039531801 ', 'yes', 'yes', 'no', 'no', 'Chicago', 4, NULL, 'No', 'No', NULL, NULL, NULL, 0, 0, '2016-11-08 12:31:29'),
(16, '::1', 'Berit Jaleiah', 'berit-jaleiah-1', '$2y$08$Jeau/caUc4EQiWj8PlrnfOQMuUvZE.0.riyVV2EcstSVxz0QQm9mO', NULL, 'berit96@gma.com', '5798e6d73016e8cb050dd6e4d1b21ffc753dc71d', NULL, NULL, NULL, 1478588353, 1479886949, 1, 'Berit', 'Jaleiah', '2003-10-07', 'Male', NULL, '1684', '7207757581', '', '', '16.jpg', 0, 'English,French,Hindi,Urdu,Dutch', 2003, 'Months', '13 Years of Experience in Making and Placing Software Engineers in Big MNC\'s , Our achievement is  80000+ Students were placed in Big Companies', '', 'Email', '1', '1', 'The vision of  Quality Software Programmers is to involve its students in never-ending Engineering Research and make them excel in Quality Education. In the years to come its vision is to keep its students in the forefront in Engineering and Technological Education. Moreover it should remain forever a world class institution for technological education and scientific research for public good.', 0, '', 0, 1, '', '', '', '', '0', 'no', '', 'Berit Jaleiah', '0.00', 'no', 'white house', 'American Samoa', '512326', 'berit96@gma.com', 'Bank code (Bankleitzahl): 20811008\r\ndomestic account number: 1039531801\r\nIBAN: AL90208110080000001039531801 ', 'yes', 'yes', 'no', 'no', 'washing town dc', 4, NULL, 'Yes', 'No', NULL, NULL, NULL, 0, 0, '2016-11-08 12:31:37'),
(17, '::1', 'Bhavya Ezmay', 'bhavya-ezmay-1', '$2y$08$j1dJv5LKyIhEcor75p.eO.0R6TOr3WzO/AEBYikdKSgWOiKrAyJjK', NULL, 'bhavya8@gma.com', 'af6d083c92f7676b6edda423a0b56482d81c8e3c', NULL, NULL, NULL, 1478588671, 1479800390, 1, 'Bhavya', 'Ezmay', '1990-10-17', 'Male', NULL, '1', '7207757581', '', '', '', 0, 'English, French, Urdu, Dutch', 6, 'Years', 'Having 6 years of teaching experience in C, C++, DBMS, Java, MS-Office and JDBC. \r\nDeveloped 8 applications of different category which include services like chat, travel and lifestyle.', '', 'None', '1', '1', 'Having 3 years of real-time and 3 years of teaching experience in Android. Currently working as Android developer. Excellent written and verbal communication skills. Completed Bachelor of Technology', 0, 'B.Tech', 0, 0, '', '', '', '', '0', 'no', '', 'Bhavya Ezmay Bhavya Ezmay', '10.00', 'yes', 'station road', 'United States', '514746', 'bhavya8@gma.com', 'Bank code (Bankleitzahl): 20811008\r\ndomestic account number: 1039531801\r\nIBAN: AL90208110080000001039531801 ', 'yes', 'yes', 'no', 'no', 'Washingtown dc', 3, NULL, 'No', 'No', NULL, NULL, NULL, 0, 12, '2016-11-08 17:52:01'),
(18, '::1', 'Bijou Kaybrie', 'bijou-kaybrie-1', '$2y$08$V66zzTNxgARnstnQq1eqvOO6Euf77bnI7ahZyhhslR02HMKxa.XKi', NULL, 'bijou56@gma.com', 'c3332aa900b6b4cba5407f9d571581b0a8d7b3b8', NULL, NULL, NULL, 1478588709, 1478671024, 1, 'Bijou', 'Kaybrie', '1991-08-15', 'Male', NULL, '1684', '7207757581', '', '', '', 0, 'English, Hindi, Urdu, Dutch', 4, 'Years', 'Having 4 years of experience in C, C++, Data Structures, HTML5, Hibernate, Java, Javascript, Spring, Struts, Hadoop and Bigdata. Having experience in Training, Development and Technical writing.', '', 'None', '1', '1', 'I Can teach  C, C++, Data Structures, HTML5, Hibernate, Java, Javascript, Spring, Struts, Hadoop and Bigdata. Having experience in Training, Development and Technical writing. Completed Bachelor of Technology in Computer Science in 2011.', 0, 'B.Tech', 0, 0, '', '', '', '', '0', 'no', '', 'Bijou Kaybrie', '5.00', 'yes', 'shoping mall', 'American Samoa', '5874216', 'bijou56@gma.com', 'Bank code (Bankleitzahl): 20811008\r\ndomestic account number: 1039531801\r\nIBAN: AL90208110080000001039531801 ', 'yes', 'yes', 'no', 'no', 'New Yourk', 3, NULL, 'No', 'No', NULL, NULL, NULL, 0, 12, '2016-11-08 17:52:12'),
(19, '::1', 'Lilyani Blaikley', 'lilyani-blaikley', '$2y$08$sjp.44InpY0kucm5VjBW1.Vu8jfgT3Xq3j0/fx.L2DlKjGvMl4QFW', NULL, 'blaikley50@gma.com', 'f5f74d0fd435d63c58152950d08099d4006537d7', NULL, NULL, NULL, 1478588804, 1478673844, 1, 'Lilyani', 'Blaikley', '1989-11-16', 'Male', NULL, '1684', '7207757581', '', '', '', 0, 'English, French, Hindi, Urdu, Dutch', 10, 'Years', 'I am  having 10 years of strong experience in Software QA & Test', '', 'None', '1', '1', 'Hi, I am  having 10 years of strong experience in Software QA & Test Consulting with proficient skills in Project management, Data Warehouse – ETL and Database Testing, BI Testing (Cognos/Web Focus/Siebel Analytics), Data Visualization testing (Qlikview), Functional Automation Testing (QTP / SOAtest / Informatica DVO), Mobile Application Testing, Middle ware testing, Software Test Management and Quality Assurance.', 0, 'M.Tech', 0, 0, '', '', '', '', '0', 'no', '', 'Lilyani Blaikley Lilyani Blaikley', '2.00', 'yes', 'over bridge', 'United Kingdom', '418745', 'blaikley50@gma.com', 'Bank code (Bankleitzahl): 20811008\r\ndomestic account number: 1039531801\r\nIBAN: AL90208110080000001039531801 ', 'yes', 'no', 'no', 'no', 'londan', 3, NULL, 'No', 'No', NULL, NULL, NULL, 0, 13, '2016-11-09 11:38:31'),
(20, '::1', 'Blimi Melora', 'blimi-melora', '$2y$08$dWv2weSyG1MH7JJSooGHeuYZRcdRoppDXqmxNjc9exIwxPOpREfqK', NULL, 'blimi33@gma.com', 'fdf919ac70ba3c63c6c96fb8b6492939208ed7c1', NULL, NULL, NULL, 1478588837, 1479970585, 1, 'Blimi', 'Melora', '1985-11-06', 'Male', NULL, '1684', '7207757581', NULL, NULL, '', 0, 'English', 0, 'Months', NULL, '', 'None', '1', '1', '', 0, '', 0, 0, 'facebook.com', 'twitter.com', '', '', '0', 'no', '', '', '0.00', 'no', 'Overbridge', 'United Kingdom', '514789', 'blimi33@gma.com', 'Bank code (Bankleitzahl): 20811008\r\ndomestic account number: 1039531801\r\nIBAN: AL90208110080000001039531801 ', 'yes', 'yes', 'no', 'no', 'londan', 3, NULL, 'No', 'No', NULL, NULL, NULL, 0, 13, '2016-11-09 11:38:49'),
(21, '::1', 'Blu Raye', 'blu-raye', '$2y$08$7fyUwGsoC24cFOikXwOYEe4kD8925e93G0Ny4Pjay7bmZUzAVc8c.', NULL, 'blu58@gma.com', '97b23dfdef529977ac7d82533686c2d19ce412bc', NULL, NULL, NULL, 1478588943, 1478674578, 1, 'Blu', 'Raye', '1987-11-04', 'Male', NULL, '1684', '7207757581', '', '', '', 0, 'English, French, Hindi, Urdu', 7, 'Years', 'Having 5+ years of experience in software industry. I have worked in top MNC like TCS ,ORACLE. I have been involved in complete life cycle of software development.', '', 'None', '1', '1', 'Having 5+ years of experience in software industry. I have worked in top MNC like TCS ,ORACLE. I have been involved in complete life cycle of software development. I Passionate about Teaching, Deep interest in Microsoft Technology such as C#, Vb.net ,Asp.net,AJAX,Javascript,JSON,Jquery,WCF,WPF,LINQ,SQL Server.', 0, 'B.Tech', 0, 0, '', '', '', '', '0', 'no', '', 'Blu Raye Blu Raye', '5.00', 'yes', 'denmark', 'Denmark', '412789', 'blu58@gma.com', 'Bank code (Bankleitzahl): 20811008\r\ndomestic account number: 1039531801\r\nIBAN: AL90208110080000001039531801 ', 'yes', 'yes', 'no', 'no', 'denmark', 3, NULL, 'No', 'No', NULL, NULL, NULL, 0, 14, '2016-11-09 12:19:00'),
(22, '::1', 'Blyss Aabha', 'blyss-aabha', '$2y$08$7U.gyJAE4hmG1V4glnoNF.623o5VneLdUmphOphGyGitabm.0/.U2', NULL, 'blyss62@gma.com', '0e9d117aa4c7759f06e5734ade31ff7e60b68645', NULL, NULL, NULL, 1478588975, 1478674928, 1, 'Blyss', 'Aabha', '1988-11-10', 'Male', NULL, '1684', '7207757581', '', '', '', 0, 'English, French, Hindi, Urdu', 7, 'Years', 'Having  7years of teaching experience in C, C++, DBMS, Java, MS-Office and JDBC.', '', 'None', '1', '1', 'Having  7years of teaching experience in C, C++, DBMS, Java, MS-Office and JDBC. Proficient in dBase and Foxpro. Good knowledge in Arrays, Functions, Pointers, Strings and Object oriented programming system principles. Completed Master of Computer Applications.', 0, 'M.Tech', 0, 0, '', '', '', '', '0', 'no', '', 'Blyss Aabha Blyss Aabha', '5.00', 'yes', 'belg', 'Belgium', '415745', 'blyss62@gma.com', 'Bank code (Bankleitzahl): 20811008\r\ndomestic account number: 1039531801\r\nIBAN: AL90208110080000001039531801 ', 'yes', 'yes', 'no', 'no', 'belgium', 3, NULL, 'No', 'No', NULL, NULL, NULL, 0, 14, '2016-11-09 12:19:13'),
(23, '::1', 'Braelin Idalynn', 'braelin-idalynn', '$2y$08$nuSLeZ5XeOYn6PyAxLQKieWcFs2G8SDuhaXbf8MiQR..UtQnkdkK6', NULL, 'braelin42@gma.com', '4d2ab1e24204428681876dab47f07da0a29a9d15', NULL, NULL, NULL, 1478589033, 1478675657, 1, 'Braelin', 'Idalynn', '1990-11-15', 'Male', NULL, '1684', '7207757581', '', '', '', 0, 'English, Hindi, Arabic', 8, 'Years', 'Having IT experience of 8 yrs in training Industry and the rest in Project consultancy.', '', 'None', '1', '1', 'Having IT experience of 8 yrs in training Industry and the rest in Project consultancy. I have a flair for learning new technologies and is skilled in the area of RDBMS with Oracle 10/MS SQL SERVER. I have efficiently conducted training on Microsoft Project Management and Oracle 10g/11g and application development on VB.net/ASP.net/Java based Technologies with a feedback score of 4 and above on a scale of 5. Other core technologies where I have expertise include Databases (Oracle),Application', 0, 'B.Tech', 0, 0, '', '', '', '', '0', 'no', '', 'Braelin Idalynn', '4.00', 'yes', 'airport', 'American Samoa', '417845', 'braelin42@gma.com', 'Bank code (Bankleitzahl): 20811008\r\ndomestic account number: 1039531801\r\nIBAN: AL90208110080000001039531801 ', 'yes', 'yes', 'no', 'no', 'calfornia', 3, NULL, 'No', 'No', NULL, NULL, NULL, 0, 15, '2016-11-08 12:44:57'),
(24, '::1', 'Braileigh Ben', 'braileigh-ben', '$2y$08$x4m88WDNwavtxx0qAMgVH.M43e96QMdDqPO5bjsixiH2JTju9KpXq', NULL, 'braileigh28@gma.com', '56d63729cd107077404b7ca47bc3d596ea4fd8b9', NULL, NULL, NULL, 1478589068, NULL, 1, 'Braileigh', 'Ben', NULL, 'Male', NULL, NULL, '7207757581', NULL, NULL, '', 0, '', 0, 'Months', NULL, '', 'None', '1', '1', '', 0, '', 0, 0, '', '', '', '', '0', 'no', NULL, '', '0.00', 'no', NULL, NULL, NULL, NULL, NULL, 'yes', 'yes', 'no', 'no', NULL, 3, NULL, 'No', 'No', NULL, NULL, NULL, 0, 15, '2016-11-08 12:45:08'),
(25, '::1', 'Breeana Zenab', 'breeana-zenab', '$2y$08$/LFZE4mX0s.XFlaDpypiu.LO2bK9T3CN1BccPmjrVT2QMe0m5gpRu', NULL, 'breeana61@gma.com', '2fd70dbba604c895da9368bdb14457f030f5bf28', NULL, NULL, NULL, 1478589149, 1478676063, 1, 'Breeana', 'Zenab', '1987-11-11', 'Male', NULL, '1684', '7207757581', '', '', '', 0, 'English, French, Arabic, Urdu, Dutch', 10, 'Years', 'I have 10 years of long experience teaching programming languages and providing software training to students and developers.', '', 'None', '1', '1', 'I have 10 years of long experience teaching programming languages and providing software training to students and developers. I have the expertise in teaching computer subjects like C, C++, Data structures, DBMS, Networking,PHP, MYSQL,LINUX etc. I am interested to share my knowledge with everyone.', 0, 'B.Tech', 0, 0, '', '', '', '', '0', 'no', '', 'Breeana Zenab', '6.00', 'yes', 'Den', 'Andorra', '417895', 'breeana61@gma.com', 'Bank code (Bankleitzahl): 20811008\r\ndomestic account number: 1039531801\r\nIBAN: AL90208110080000001039531801 ', 'yes', 'yes', 'no', 'yes', 'Londan', 3, NULL, 'No', 'No', NULL, NULL, NULL, 0, 16, '2016-11-08 12:43:52'),
(26, '::1', 'Breella  kareem', 'breella-kareem', '$2y$08$uWHJJcuM/tlHEK.UVCRiiOJkpQHdifHUtHO4CJ4YOpxY./3yRLmuK', NULL, 'breella65@gma.com', 'dc68b83320bec81b23a4c6752647d6f6287874eb', NULL, NULL, NULL, 1478589216, NULL, 1, 'Breella', ' kareem', NULL, 'Female', NULL, NULL, '7207757581', NULL, NULL, '', 0, '', 0, 'Months', NULL, '', 'None', '1', '1', '', 0, '', 0, 0, '', '', '', '', '0', 'no', NULL, '', '0.00', 'no', NULL, NULL, NULL, NULL, NULL, 'yes', 'yes', 'no', 'no', NULL, 3, NULL, 'No', 'No', NULL, NULL, NULL, 0, 16, '2016-11-08 12:44:02'),
(27, '10.0.0.13', 'Maelah Pietra', 'maelah-pietra', '$2y$08$EUa17qfKXVcpE2MSo172keM3xLgP/x55tkRIYvHLbsJihakoYQX/q', NULL, 'maelah93@gma.com', 'db83cd4156d890474df6ffd802f74bf01c13ef7f', NULL, NULL, NULL, 1478670854, 1479732451, 1, 'Maelah', 'Pietra', '1995-10-10', 'Male', NULL, '213', '1234561063', '', '', '27.jpg', 0, 'English,French,Hindi,Urdu', 0, 'Months', NULL, '', 'All', '0', '1', 'Hi i am  Maelah Pietra . Now i studying Diploma first year . i need a tutor who can help in Diploma Mathe\'s Subject', 0, 'Diploma', 0, 1, '', '', '', 'maelah93@gma.com', '0', 'no', '', 'Maelah Pietra', '6.00', 'no', 'white house', 'Andorra', '3840', NULL, NULL, 'yes', 'yes', 'no', 'no', 'New York', 2, NULL, 'Yes', 'No', NULL, NULL, NULL, 0, 0, '2016-11-14 10:49:07'),
(28, '10.0.0.13', 'Maeryn Joleena', 'maeryn-joleena', '$2y$08$OobLeO162ZSHwBjNi4jorucLhtKYm.2cKzVzmcHNr.JBFEZr5BNGe', NULL, 'maeryn61@gma.com', 'b8327d8b4ac28ae1b4679c941f8ca25b449e7707', NULL, NULL, NULL, 1478670893, 1479792482, 1, 'Maeryn', 'Joleena', '1991-10-07', 'Male', NULL, '1684', '1234561064', '', '', '28.jpg', 0, 'English,French,Arabic,Dutch', 0, 'Months', NULL, '', 'None', '1', '1', 'Hi i am Maeryn Joleena . Now i studying M.Tech  Second Year . i need a tutor who can help in M.Tech ECE Second year subjects', 0, 'M.Tech', 0, 1, '', '', '', 'maeryn61@gma.com', '0', 'no', '', 'Maeryn Joleena', '5.00', 'no', 'white house', 'American Samoa', '3841', NULL, NULL, 'yes', 'yes', 'no', 'no', 'New York', 2, NULL, 'No', 'No', NULL, NULL, NULL, 0, 0, '2016-11-14 10:49:16'),
(29, '10.0.0.13', 'Maesa Karthika', 'maesa-karthika', '$2y$08$OnddRMSxK5Au.gRyhLs9NOOqWol/gNnJUijtSUEl66KGL7p43IuV2', NULL, 'maesa8@gma.com', '965be53bef8718a0578dfc86dd5e89fe6fe20709', NULL, NULL, NULL, 1478670929, 1479732543, 1, 'Maesa', 'Karthika', '1994-09-19', 'Female', NULL, '93', '1234561065', '', '', '29.jpg', 0, 'English,Hindi,Dutch', 0, 'Months', NULL, '', 'All', '1', '1', 'Hi i am  Maesa Karthika . Now i studying B.Tech  Second Year . i need a tutor who can help in B.Tech ECE Second year subjects', 0, 'B.Tech', 0, 1, 'facebook.com', '', '', 'maesa8@gma.com', '0', 'no', '', 'Maesa Karthika', '6.00', 'no', 'over bridge', 'United States', '417842', NULL, NULL, 'yes', 'yes', 'no', 'no', 'New York', 2, 26, 'Yes', 'No', NULL, NULL, NULL, 600, 0, '2016-11-21 12:35:07'),
(30, '10.0.0.13', 'Magdelene Makylee', 'magdelene-makylee', '$2y$08$Ba30iyViQAytLL57Lxx6gOFyG9T2bocBt5uI/WOAyrBTZwPMhN/Pu', NULL, 'magdelene7@gma.com', '7b127cc6b4758c014b18c7b3ad8dd63668b9ca49', NULL, NULL, NULL, 1478670981, 1479732639, 1, 'Magdelene', 'Makylee', '1991-11-11', 'Male', NULL, '1684', '1234561066', '', '', '30.jpg', 0, 'English,Hindi,Urdu', 0, 'Months', NULL, '', 'None', '1', '1', 'Hi i am Magdelene Makylee . Now i studying B.Tech  Second Year . i need a tutor who can help in B.Tech ECE Second year subjects', 0, 'B.Tech', 0, 1, '', '', '', 'magdelene7@gma.com', '0', 'no', '', 'Magdelene Makylee', '1.00', 'no', 'white house', 'Andorra', '714215', NULL, NULL, 'yes', 'yes', 'no', 'no', 'New York', 2, NULL, 'No', 'No', NULL, NULL, NULL, 0, 0, '2016-11-14 10:49:33'),
(31, '10.0.0.13', 'Mahaela Hitha', 'mahaela-hitha', '$2y$08$wiJTPKVNgZrsJfl7x/teXevlqrdVP44bJ7.jZLGoW34AWDO4LyGO6', NULL, 'mahaela91@gma.com', 'e8baeece9fbd1a75bd25955d831456fcc07e8bb6', NULL, NULL, NULL, 1478671015, 1479732673, 1, 'Mahaela', 'Hitha', '2000-10-10', 'Male', NULL, '93', '1234561067', '', '', '31.jpg', 0, 'English,Hindi,Urdu', 0, 'Months', NULL, '', 'All', '1', '1', 'Hi i am  Mahaela Hitha . Now i studying B.Tech  Second Year . i need a tutor who can help in B.Tech ECE Second year subjects', 0, 'B.Tech', 0, 1, '', '', '', 'Mahaela Hitha', '0', 'no', '', 'Mahaela Hitha', '5.00', 'yes', NULL, NULL, '3844', NULL, NULL, 'yes', 'yes', 'no', 'no', NULL, 2, NULL, 'Yes', 'No', NULL, NULL, NULL, 0, 0, '2016-11-14 10:49:40'),
(32, '10.0.0.13', 'Mahaila Fortune', 'mahaila-fortune', '$2y$08$HjjTEZK8ermeV8NBlkY5Me.XKSicd3pxsJQhrwoj1x0Uw/v8RsYp6', NULL, 'mahaila31@gma.com', '42830b624ed99d5e9b73e9be7d3699998b948f3d', NULL, NULL, NULL, 1478671101, 1479790008, 1, 'Mahaila', 'Fortune', '1990-11-14', 'Male', NULL, '1684', '1234561068', '', '', '32.jpg', 0, 'English,Hindi,Dutch', 0, 'Months', NULL, '', 'Mobile', '1', '1', 'Hi i am  Mahaila Fortune . Now i studying B.Tech  Second Year . i need a tutor who can help in B.Tech ECE Second year subjects', 0, 'B.Tech', 0, 1, '', '', '', 'mahaila31@gma.com', '0', 'no', '', 'Mahaila Fortune', '7.00', 'yes', 'white house', 'American Samoa', '412146', NULL, NULL, 'yes', 'yes', 'no', 'no', 'New York', 2, 23, 'Yes', 'No', NULL, NULL, NULL, 2090, 0, '2016-11-22 10:18:09'),
(33, '10.0.0.13', 'Mahati Harliee', 'mahati-harliee', '$2y$08$u6MKWBl9HG7pAEP540qOeehE3NolV3o7HcGmJW/pVy1yzMzUZ6hDS', NULL, 'mahati4@gma.com', 'd4ec9c1b64269c20240e7e8693ec1b843c2038ba', NULL, NULL, NULL, 1478671136, 1479732761, 1, 'Mahati', 'Harliee', '1992-10-07', 'Female', NULL, '213', '1234561069', '', '', '33.jpg', 0, 'English,French,Arabic,Urdu', 0, 'Months', NULL, '', 'All', '1', '1', 'Hi i am Mahati Harliee . Now i studying B.Tech  Second Year . i need a tutor who can help in B.Tech ECE Second year subjects', 0, 'B.Tech', 0, 1, '', '', '', 'mahati4@gma.com', '0', 'no', '', 'Mahati Harliee', '5.00', 'yes', 'white house', 'United States', '417147', NULL, NULL, 'yes', 'yes', 'no', 'no', 'New York', 2, 24, 'Yes', 'No', NULL, NULL, NULL, 2290, 0, '2016-11-14 12:05:47'),
(34, '10.0.0.13', 'Mahelet Dalasia', 'mahelet-dalasia', '$2y$08$E.TQr8fpSZ09iTsh38i61.bKxmf69kclRu8YYOqJ/5EVKuOxC7npa', NULL, 'mahelet71@gma.com', '976366bddbb5babee30d9095bc260c08f9a4f991', NULL, NULL, NULL, 1478671172, 1479807357, 1, 'Mahelet', 'Dalasia', '1995-09-12', 'Male', NULL, '213', '1234561070', '', '', '34.jpg', 0, 'English,Hindi,Urdu', 0, 'Months', NULL, '', 'Email', '1', '1', 'Hi i am  Mahelet Dalasia . Now i studying B.Tech  Second Year . i need a tutor who can help in B.Tech ECE Second year subjects', 0, 'B.Tech', 0, 1, '', '', '', 'mahelet71@gma.com', '0', 'no', '', 'Mahelet Dalasia', '5.00', 'no', 'white house', 'American Samoa', '417147', NULL, NULL, 'yes', 'yes', 'no', 'no', 'New York', 2, 25, 'Yes', 'No', NULL, NULL, NULL, 2290, 0, '2016-11-14 12:11:53'),
(35, '10.0.0.13', 'Mahia Cayslee', 'mahia-cayslee', '$2y$08$bwG0cSn0XK.YQ/7zzy6KHOT91vbuT/sW0pyB5.26elqH9ItZXnZIK', NULL, 'mahia54@gma.com', '82d82dc275d74a17070047974b17a8c177847c36', NULL, NULL, NULL, 1478671213, 1479977796, 1, 'Mahia', 'Cayslee', '1994-10-04', 'Male', NULL, '1684', '1234561071', '', '', '35.jpg', 0, 'English,French,Arabic', 0, 'Months', NULL, '', 'All', '1', '1', 'Hi i am  Mahia Cayslee . Now i am studying B.Tech  Second Year . i need a tutor who can help in B.Tech ECE Second year subjects', 0, 'B.Tech', 0, 1, '', '', '', 'mahia54@gma.com', '0', 'no', '', 'Mahia Cayslee', '5.00', 'yes', 'white house', 'American Samoa', '417147', NULL, NULL, 'yes', 'yes', 'no', 'no', 'New York', 2, NULL, 'Yes', 'No', NULL, NULL, NULL, 0, 0, '2016-11-14 10:50:15'),
(36, '10.0.0.13', 'Mahiyah Karry', 'mahiyah-karry', '$2y$08$LpejZ8FFs5zMT8WQiaRO4u5i3P.QAjbXv1ojrZhEk1j.PIQxQIY9K', NULL, 'mahiyah10@gma.com', '02382e9f004f8350827e7451a26096b98cd89d42', NULL, NULL, NULL, 1478671247, 1479732885, 1, 'Mahiyah', 'Karry', '1996-10-08', 'Male', NULL, '1684', '1234561072', '', '', '36.jpg', 0, 'English,French,Arabic', 0, 'Months', NULL, '', 'All', '1', '1', 'Hi i am Mahiyah Karry . Now i studying M.Tech  Second Year . i need a tutor who can help in M.Tech ECE Second year subjects', 0, 'B.Tech', 0, 1, '', '', '', 'mahiyah10@gma.com', '0', 'no', '', 'Mahiyah Karry', '8.00', 'yes', 'white house', 'American Samoa', '412146', NULL, NULL, 'yes', 'yes', 'no', 'no', 'New York', 2, NULL, 'Yes', 'No', NULL, NULL, NULL, 0, 0, '2016-11-14 10:50:22'),
(37, '10.0.0.13', 'Nahiomy Leeonna', 'nahiomy-leeonna', '$2y$08$561WUIpARBbs2kgIFHiu8O/y26FYUCHPsl1sYxVkU7meH1ix1Nuce', NULL, 'nahiomy69@gma.com', 'e5582bb129fb2d65c4aa8dc5f22a44c10e558366', NULL, NULL, NULL, 1478695540, 1478751849, 1, 'Nahiomy', 'Leeonna', NULL, 'Male', NULL, '213', '6547891230', NULL, NULL, '', 0, '', 0, 'Months', NULL, '', 'None', '1', '1', '', 0, '', 0, 0, '', '', '', '', '0', 'no', NULL, '', '0.00', 'no', NULL, NULL, '654123', NULL, NULL, 'yes', 'yes', 'no', 'no', NULL, 3, NULL, 'No', 'No', NULL, NULL, NULL, 0, 0, '2016-11-09 18:21:29'),
(38, '10.0.0.13', 'Nahyeli Persephany', 'nahyeli-persephany', '$2y$08$jOZjqUzNoNB0.JiV7EseQuf.ewmnnGNdOO2piMnTpGH83T8j0J2Vq', NULL, 'nahyeli42@gma.com', 'ed0f081b05fdc3024558cca57d3e50db114e6039', NULL, NULL, NULL, 1478695577, NULL, 1, 'Nahyeli', 'Persephany', NULL, 'Male', NULL, '973', '6541239870', NULL, NULL, '', 0, '', 0, 'Months', NULL, '', 'None', '1', '1', '', 0, '', 0, 0, '', '', '', '', '0', 'no', NULL, '', '0.00', 'no', NULL, NULL, '789654', NULL, NULL, 'yes', 'yes', 'no', 'no', NULL, 3, NULL, 'No', 'No', NULL, NULL, NULL, 0, 0, '2016-11-10 11:40:50'),
(39, '10.0.0.13', 'Naihla Akyah', 'naihla-akyah', '$2y$08$RwKF84CcTnuILiGZfZ.PuencYXRbXcfpo3FdkGnMOGD/IAOFfywAu', NULL, 'naihla99@gma.com', '9fcccc30f86b14f4a672847e585100f5bf4f7334', NULL, NULL, NULL, 1478695616, 1479792967, 1, 'Naihla', 'Akyah', NULL, 'Male', NULL, '1246', '7896541230', NULL, NULL, '', 0, '', 0, 'Months', NULL, '', 'None', '1', '1', '', 0, '', 0, 0, '', '', '', '', '0', 'no', NULL, '', '0.00', 'no', NULL, NULL, '879456', NULL, NULL, 'yes', 'yes', 'no', 'no', NULL, 3, NULL, 'No', 'No', NULL, NULL, NULL, 0, 0, '2016-11-10 11:40:59'),
(40, '10.0.0.13', 'Oriel Damian', 'oriel-damian', '$2y$08$l5aK.WNcU403zq7z/k.UDOVWRx0RI7EQ1FDJs02aOuQsODJbguBAS', NULL, 'oriel60@gma.com', '6a9a48c85ce8b13334f07aef40333b1c5e5668ab', NULL, NULL, NULL, 1478695653, NULL, 1, 'Oriel', 'Damian', NULL, 'Male', NULL, '86', '3214568700', NULL, NULL, '', 0, '', 0, 'Months', NULL, '', 'None', '1', '1', '', 0, '', 0, 0, '', '', '', '', '0', 'no', NULL, '', '0.00', 'no', NULL, NULL, '798546', NULL, NULL, 'yes', 'yes', 'no', 'no', NULL, 3, NULL, 'No', 'No', NULL, NULL, NULL, 0, 0, '2016-11-10 11:41:08'),
(41, '10.0.0.13', 'Parina Bentlie', 'parina-bentlie', '$2y$08$8Y/YdRlxxCbABTcHXsOW7.MuIdruvCiBRGTBlCJsKoACycSD0EO7G', NULL, 'parina64@gma.com', '10b7863344d132be0928e1c5f58a7bbc36f52246', NULL, NULL, NULL, 1478695692, NULL, 1, 'Parina', 'Bentlie', NULL, 'Male', NULL, '385', '9874563210', NULL, NULL, '', 0, '', 0, 'Months', NULL, '', 'None', '1', '1', '', 0, '', 0, 0, '', '', '', '', '0', 'no', NULL, '', '0.00', 'no', NULL, NULL, '123654', NULL, NULL, 'yes', 'yes', 'no', 'no', NULL, 3, NULL, 'No', 'No', NULL, NULL, NULL, 0, 0, '2016-11-10 11:41:17'),
(42, '10.0.0.13', 'Payshance Inst ', 'payshance-inst-', '$2y$08$rJ/HcAly0cn7VsRWxIZ34ulssbNEYfo8aIb3eCwLwf2Nxn/yUhdtq', NULL, 'payshance55@gma.com', '5ec17229af8492962e505c64837f3b96c03456d3', NULL, NULL, NULL, 1478695742, 1479886994, 1, 'Payshance inst', '', '1992-08-04', 'Male', NULL, '225', '5879641320', '', '', '42.jpg', 0, 'English,French', 2002, 'Months', 'Our core objective is to progress exponentially with focus on quality deliveries, spread across key IT cities thus gaining wide recognition as one of the most competent entities in the field and to aim at being a public trading company listed on major bourses.', '', 'None', '1', '1', 'Payshance inst  is a one stop shop for IT services, Third party testing services, Recruitment services & Training services. Payshance inst  concentrates on its vision of building up strong customer and business partnerships. To this end, Payshance inst  offers an unmatched flexibility with its custom built solutions. Payshance  service method is comprehensive in maximizing efficiency. Most importantly, our methodology is practical and designed according to our clients\' needs and requirements.', 0, '', 0, 1, 'facebook.com', 'twitter.com', 'linkedin.in', '', '0', 'no', '', 'Payshance inst', '0.00', 'no', '2 Ave Street', 'United States', '7895445', 'mytest@paypal.com', 'Name: Payshance inst\r\nA/C No: 4567892154\r\n', 'yes', 'no', 'no', 'no', 'Los Angeles', 4, NULL, 'No', 'No', NULL, NULL, NULL, 0, 0, '2016-11-10 11:00:31'),
(43, '10.0.0.13', 'Annastacia Consultancy ', 'annastacia-consultancy-', '$2y$08$01vkwXFDJy6wmqn1qc1zIudzXP1cQ.WOiFVqzvnJJqLVmq0DeWECm', NULL, 'ravleen82@gma.com', 'eb60f5cf1c33c4d1e3db0564cb523203443a83e5', NULL, NULL, NULL, 1478695840, 1479887199, 1, 'Annastacia consultancy', '', '1987-11-12', 'Male', NULL, '53', '658974120', '', '', '43.jpg', 0, 'English,French,Greek', 1998, 'Months', 'We are the students most preferred Training Institute in Colorado\r\n    Recognized as Best Testing Tools Training Institute in Colorado\r\n    Placements with best in the Training Industry\r\n    Industrial Experience Faculty\r\n    We are Providing Training with Live Projects\r\n    12hrs Lab services for each student\r\n    UP-TO-DATE Curriculum, To review curriculum by Experts\r\n    We will conduct Assignments and Mock Interviews With in Course period', '', 'Mobile', '1', '1', 'Annastacia  is the only institute where you can get each & every penny you paid for them in the form of knowledge. You didn’t know the importance of Annastacia  before joining, which you came to know during the course. Annastacia consultancy is the gateway for your bright future. This is the one and only institute where the faculty are more interested to deliver as much info as they can to the students. We always maintain our ascendance by being the first to introduce brand new products', 0, '', 0, 1, 'facebook.com', 'twitter.com', 'linkedin.in', '', '0', 'no', '', 'Annastacia consultancy', '0.00', 'no', '1st Street', 'United States', '897465', 'testpay@paypal.com', '', 'yes', 'yes', 'no', 'no', 'Denver', 4, NULL, 'Yes', 'No', NULL, NULL, NULL, 0, 0, '2016-11-10 11:28:03'),
(44, '10.0.0.15', 'Makenzly Organization ', 'makenzly-organization-', '$2y$08$KlNzkMQ7XkQLqIz9hTKidOExA.DKyWXbeHBvlA87/ciKH9IIPn.nW', NULL, 'makenzly62@gma.com', '3572fb7b44e5aa3184f65acae2d8e769d1f6175e', NULL, NULL, NULL, 1478754981, 1479887242, 1, 'Makenzly organization', '', '1994-11-17', 'Male', NULL, '975', '9875641230', '', '', '44.jpg', 0, 'English,Hindi,Dutch,Chinese', 2010, 'Months', 'Today  we have  developed into a broad system and "an examination Center / Studio for  the  prestigious exams of International Music Exam Boards"  with many students  and  teachers  at  various  locations in the  cities  thousands of students have acquired qualifications from the school.', '', 'Email', '1', '1', 'Makenzly organization, with its mission statement just wishes to create a dynamic and sustainable setup of new age teaching methodology where the students is guided to use modern day technical support but with the  traditional approach of teaching.', 0, '', 0, 1, 'facebook.com', 'twitter.com', 'linkedin.in', '', '0', 'no', '', 'Makenzly organization', '0.00', 'no', 'Near to 1st Ave', 'United States', '456321', 'makenzly@paypal.com', '', 'yes', 'yes', 'no', 'no', 'Missouri', 4, NULL, 'Yes', 'No', NULL, NULL, NULL, 0, 0, '2016-11-10 12:04:02'),
(45, '10.0.0.15', 'Mariyanna ', 'mariyanna-', '$2y$08$TLx0OLa5sJZLVKdGbzE6nOMqZ8SQfChXMN4PJIR1iju8IztMTqfii', NULL, 'mariyanna86@gma.com', 'c4183681848eed24b424baef1d35019a2ef885af', NULL, NULL, NULL, 1478755030, 1479887282, 1, 'Mariyanna', '', '1991-11-12', 'Male', NULL, '255', '3698521470', '', '', '45.jpg', 0, 'English,French,Greek', 2010, 'Months', 'Break dancing, also known as b-boying or breaking, is an athletic style of street dancing most often performed to hip-hop music. A very acrobatic form of dance, break dancing involves fast footwork that utilizes a dancer\'s entire body, synchronizing flips, spins, and poses to music. Classes are usually open to teenagers and adults, and participants should be physically fit in order to engage in highly active dancing. However, most classes start slowly and build to the more show-stopping moves.', '', 'None', '1', '1', 'Beginning classes in break dancing start students with basic preparatory movements or toprock, letting the dancer move and find their rhythm to the music. Lessons progress to footwork, such as the 4-step or 6-step, teaching dancers balance and dexterity. As students gain confidence and build strength, they can learn more advanced steps, including freezes and power moves, such as the windmill, developing a personal style or routine.', 0, '', 0, 1, 'facebook.com', 'twitter.com', 'linkedin.in', '', '0', 'no', '', 'Mariyanna', '0.00', 'no', '2 Ave Street', 'United States', '987456', 'mariyana@paypal.com', '', 'no', 'yes', 'no', 'no', 'Dallas', 4, NULL, 'No', 'No', NULL, NULL, NULL, 0, 0, '2016-11-10 12:11:37'),
(46, '10.0.0.15', 'Vincenzo Inst ', 'vincenzo-inst-', '$2y$08$83LylN1ild7i89Lb9TLDx.hNwxUB2vkjQz5XoeJ6OxHDUWFcmZZqO', NULL, 'meliana96@gma.com', 'f303e47d328fbb21b01ba4dd7583437e3d95e5db', NULL, NULL, NULL, 1478755075, 1479887313, 1, 'Vincenzo inst', '', '1989-11-30', 'Male', NULL, '971', '6547893200', '', '', '46.jpg', 0, 'English,Dutch,Greek', 2006, 'Months', 'Over the past 10 years Vincenzo inst  has trained around 1600 students and other members, through various short duration training programs.', '', 'None', '1', '1', 'The Department proposes to carry out research in the areas of Condensed Matter Physics and High Energy Physics.  In condensed matter Physics, magnetism, semiconductors and methods for band structure studies are some of the areas of interest.', 0, '', 0, 1, 'facebook.com', 'twitter.com', 'linkedin.in', '', '0', 'no', '', 'Vincenzo inst', '0.00', 'no', '1st Street', 'United States', '65489', 'vincy@paypal.com', '', 'no', 'yes', 'no', 'no', 'Phoenix', 4, NULL, 'No', 'No', NULL, NULL, NULL, 0, 0, '2016-11-10 12:11:49'),
(47, '10.0.0.15', 'Claribelle Technologies ', 'claribelle-technologies-', '$2y$08$8Q5eX4.PsYSt8brzjKNGQeGVSsO5iPwNyju/b2WyqPYB/6oV05.dW', NULL, 'menah21@gma.com', '3b4f52f2c1b82054b451da91522a51512fd88742', NULL, NULL, NULL, 1478755152, 1479887342, 1, 'Claribelle technologies', '', '1991-10-06', 'Male', NULL, '237', '6547893211', '', '', '47.jpg', 0, 'English,French', 2005, 'Months', 'We see to mark innovation at every walk of our path. We intended to provide the best Training services as per your Structural & organizational requirements. Claribelle technologies  is just the right place for every company, who wants to keep itself well equipped with the changing technology.', '', 'Mobile', '1', '1', 'Claribelle technologies  is not just the one stop solution for your Training requirements, but it is also a well managed organization, with passionate, experienced, and committed clan of young and innovative minds. We see to mark innovation at every walk of our path. We intended to provide the best Training services as per your Structural & organizational requirements. Claribelle techn is just the right place for every company, who wants to keep itself well equipped with the changing technology.', 0, '', 0, 1, 'facebook.com', 'twitter.com', 'linkedin.in', '', '0', 'no', '', 'Claribelle technologies', '0.00', 'no', 'Near to 1st Ave', 'United States', '456897', 'clari@paypal.com', '', 'no', 'yes', 'no', 'no', 'Des Moines', 4, NULL, 'Yes', 'No', NULL, NULL, NULL, 0, 0, '2016-11-10 14:29:26'),
(48, '10.0.0.15', 'Lilymarie ', 'lilymarie--1', '$2y$08$jSHxPhNZrjBcvniyl4eIv.V9XJVMfVfZhwvfHpiTOnACskTvNzKyK', NULL, 'mokshitha62@gma.com', '98f31785561313abf500da37555dc5eb92ddb9c3', NULL, NULL, NULL, 1478755393, 1479887374, 1, 'Lilymarie', '', '1984-11-08', 'Male', NULL, '591', '5823697410', '', '', '48.jpg', 0, 'English,French,Latin', 2004, 'Months', 'Lilymarie has been doing a great job in keeping abreast with the latest versions, updates in various technologies and current market strategies, strengths, requirements and trends. With this determined attitude of providing best services Lilymarie ventured into all the latest technologies.', '', 'None', '1', '1', 'Lilymarie  is established in 2004 and started its services in the field of education. A journey that began as an Educational Academy has transformed over a period of time into software training provider and the training institute has been started in Colorado.', 0, '', 0, 1, 'facebook.com', 'twitter.com', 'linkedin.in', '', '0', 'no', '', 'Lilymarie', '0.00', 'no', '1st Street', 'United States', '654123', 'Lilymarie@paypal.com', '', 'no', 'yes', 'no', 'no', 'Colorado', 4, NULL, 'No', 'No', NULL, NULL, NULL, 0, 0, '2016-11-10 14:47:15'),
(49, '10.0.0.15', 'Ellabelle Organization ', 'ellabelle-organization-', '$2y$08$lXU8KPUlrLAA/FKv6gduze1AxZCDM7U9xtNrwiY9t1894.qZ./qs2', NULL, 'naamah60@gma.com', 'bc93d5b834b0988c09bf8525691044de979c7641', NULL, NULL, NULL, 1478755465, 1479887403, 1, 'Ellabelle organization', '', '2010-11-10', 'Male', NULL, '55', '6542319870', '', '', '49.jpg', 0, '', 2006, 'Months', 'Our mission is to help students and Parents around US by providing curated quality tutors/teachers/trainers and help teachers to connect with students who need their help in subject matters.', '', 'All', '1', '1', 'Ellabelle organization  is an online platform for tuition services that connects the students and teachers/tutors/trainers on various subjects. It will match best tutors in the fields of math, science, programming, Engineering, social studies and languages like English,Frensh ,German ,Spanish.', 0, '', 0, 1, 'facebook.com', 'twitter.com', 'linkedin.in', '', '0', 'no', '', 'Ellabelle organization', '0.00', 'no', '2 Ave Street', 'United States', '6542631', 'Ellabelle@paypal.com', '', 'yes', 'yes', 'no', 'no', 'Davenport', 4, NULL, 'Yes', 'No', NULL, NULL, NULL, 0, 0, '2016-11-10 15:38:15'),
(50, '10.0.0.15', 'Anastasija Inst ', 'anastasija-inst-', '$2y$08$4.lyGAP9rG2/UsibY1zsF.4dZeY4Ss/Im/1o7OIkt5hipe5hChx92', NULL, 'nadyne77@gma.com', '1d36a5adb3e799add3fa2168725850234acab0d5', NULL, NULL, NULL, 1478755506, 1479887430, 1, 'Anastasija inst', '', '1995-08-14', 'Male', NULL, '229', '9863521477', '', '', '50.jpg', 0, 'English,French,Dutch', 2008, 'Months', 'Anastasija inst was established in 2008 by the group of professionals with great experience in education sector and is based in Iowa, USA.', '', 'None', '1', '1', 'Anastasija inst  solves the discovery, matching, scheduling, and payment inefficiencies in the domestic market by over 800+ active tutors with technology that connects students and tutors.', 0, '', 0, 1, 'facebook.com', 'twitter.com', 'linkedin.in', '', '0', 'no', '', 'Anastasija inst', '0.00', 'no', 'Opposite to 2Ave lane', 'United States', '569874', 'anastasija@paypal.com', '', 'yes', 'yes', 'no', 'no', 'Iowa', 4, NULL, 'No', 'No', NULL, NULL, NULL, 0, 0, '2016-11-10 15:52:38');
INSERT INTO `pre_users` (`id`, `ip_address`, `username`, `slug`, `password`, `salt`, `email`, `activation_code`, `forgotten_password_code`, `forgotten_password_time`, `remember_code`, `created_on`, `last_login`, `active`, `first_name`, `last_name`, `dob`, `gender`, `company`, `phone_code`, `phone`, `seo_keywords`, `meta_desc`, `photo`, `location_id`, `language_of_teaching`, `teaching_experience`, `duration_of_experience`, `experience_desc`, `video_profile_url`, `show_contact`, `visibility_in_search`, `availability_status`, `profile`, `no_of_profile_views`, `qualification`, `tutor_rating`, `is_profile_update`, `facebook`, `twitter`, `linkedin`, `skype`, `isTestimonyGiven`, `is_social_login`, `website`, `profile_page_title`, `willing_to_travel`, `own_vehicle`, `land_mark`, `country`, `pin_code`, `paypal_email`, `bank_ac_details`, `academic_class`, `non_academic_class`, `share_phone_number`, `is_online`, `city`, `user_belongs_group`, `subscription_id`, `free_demo`, `admin_approved`, `admin_approved_date`, `i_love_tutoring_because`, `other_interests`, `net_credits`, `parent_id`, `last_updated`) VALUES
(51, '10.0.0.15', 'Pragya Technologies ', 'pragya-technologies-', '$2y$08$kJOuNMLpm0OQvzE3h8mICuTAwyAfQ4BZjhdpvOiw21Pv1r3psBej.', NULL, 'nairoby51@gma.com', 'dafd48ce782e42307796e388e44f57df52890b57', NULL, NULL, NULL, 1478755558, 1479887462, 1, 'Pragya technologies', '', '1993-11-07', 'Male', NULL, '297', '4569871300', '', '', '51.jpg', 0, 'English', 2010, 'Months', 'Online tutoring is not only more affordable than traditional face-to-face tutoring; it’s better: you get access to a broader skill set through a vast network of possible tutors; you can arrange lessons around you at a time that suits and with no need to travel; You only pay for what you use and don’t find yourself filling an hour just because you’ve paid for it.', '', 'Email', '1', '1', 'Pragya technologies  online service began in 2010 and since then we’ve helped thousands of students to find the specialist help they need, whether that’s a one-off response to a specific problem or ongoing support around a challenging subject.', 0, '', 0, 1, 'facebook.com', 'twitter.com', 'linkedin.in', '', '0', 'no', '', 'Pragya technologies', '0.00', 'no', 'Near to 1st Ave', 'United States', '12145', 'pragya@paypal.com', '', 'yes', 'yes', 'no', 'no', 'Atlanta', 4, NULL, 'Yes', 'No', NULL, NULL, NULL, 0, 0, '2016-11-10 16:08:44'),
(52, '10.0.0.15', 'Nanaakua Sidrah', 'nanaakua-sidrah', '$2y$08$05q3GOlzyKUZA8AxBextxu0L1.SO.1y1Y35qVBHNKJThekklSJcWC', NULL, 'nanaakua31@gma.com', 'fae12589d80af6dac570659f1992d9c718da8910', NULL, NULL, NULL, 1478755995, NULL, 1, 'Nanaakua', 'Sidrah', NULL, 'Male', NULL, NULL, '2587419365', NULL, NULL, '', 0, '', 0, 'Months', NULL, '', 'None', '1', '1', '', 0, '', 0, 0, '', '', '', '', '0', 'no', NULL, '', '0.00', 'no', NULL, NULL, NULL, NULL, NULL, 'yes', 'yes', 'no', 'no', NULL, 3, NULL, 'No', 'No', NULL, NULL, NULL, 0, 42, '2016-11-10 11:03:35'),
(53, '::1', 'Gordon Nooh', 'gordon-nooh', '$2y$08$vt/m5KRUpcPXxLchm2l7f.X.0qAt4QYS8FybBMU/Mkl9c202eWi9e', NULL, 'gordonn50@gma.com', '3cfe75726f4c05e6a54f79795bfc41d4196f3544', NULL, NULL, NULL, 1478757029, 1479733574, 1, 'Gordon', 'Nooh', '1990-09-11', 'Male', NULL, '1684', '7207757571', '', '', '53.jpg', 0, 'English, French, Arabic, Urdu, Dutch', 2, 'Years', 'Having 2 years of real-time and teaching experience in AJAX, Bootstrap, Codeigniter, Drupal, HTML/CSS, HTML5, MongoDB, MySQL, PHP and WordPress.', '', 'All', '1', '1', 'Having 2 years of real-time and teaching experience in AJAX, Bootstrap, Codeigniter, Drupal, HTML/CSS, HTML5, MongoDB, MySQL, PHP and WordPress. Good knowledge in Object oriented programming system. Possess excellent presentation skills. Completed Master of Computer Applications.', 0, 'B.Tech', 0, 1, '', '', '', '', '0', 'no', '', 'Gordon Nooh', '5.00', 'yes', 'white house', 'United States', '714215', 'gordonn50@gma.com', 'Bank code (Bankleitzahl): 20503\r\ndomestic account number: 2101023600\r\nIBAN: AT022050302101023600 ', 'yes', 'yes', 'no', 'no', 'New Yourk', 3, NULL, 'No', 'No', NULL, NULL, NULL, 0, 0, '2016-11-10 11:41:35'),
(54, '::1', 'Harlan Azzam', 'harlan-azzam', '$2y$08$2P6M1gQupTb5DdNhrsVI2.FWuxH9r2ivQIZhaiNoN80uTF5/aOXje', NULL, 'harlana39@gma.com', 'd05118b3bf41a4d8d6dea4d2ee98ae30c6400fd2', NULL, NULL, NULL, 1478757069, 1479733616, 1, 'Harlan', 'Azzam', '1989-11-09', 'Female', NULL, '1684', '7207758581', '', '', '54.jpg', 0, 'English, French, Hindi, Arabic', 5, 'Years', 'Having 5 years of teaching experience in C, C++, DBMS, Data Structures, Java and Javascript.', '', 'All', '1', '1', 'Having 5 years of teaching experience in C, C++, DBMS, Data Structures, Java and Javascript. Good knowledge in Digital systems and Computer architecture. Currently working as assistant professor in New yourk', 0, 'B.Tech', 0, 1, '', '', '', '', '0', 'no', '', 'Harlan Azzam', '5.00', 'yes', 'over bridge', 'United Kingdom', '412146', 'harlana39@gma.com', 'Bank code (Bankleitzahl): 20503\r\ndomestic account number: 2101023600\r\nIBAN: AT022050302101023600 ', 'yes', 'yes', 'no', 'no', 'parase', 3, NULL, 'Yes', 'No', NULL, NULL, NULL, 0, 0, '2016-11-10 11:41:46'),
(55, '::1', 'Turner Zaidan', 'turner-zaidan', '$2y$08$3A6NjLg83GLWy6npG519ruumnRLcSsb6j/BhEEi7eVZFvNqbuMzNy', NULL, 'turnerz13@gma.com', '70dbe839f85db4625fa485b27b844a8f3b3fe3fe', NULL, NULL, NULL, 1478757120, 1478761073, 1, 'Turner', 'Zaidan', '1998-11-12', 'Male', NULL, '213', '7205777581', '', '', '', 0, 'English, French, Hindi, Arabic', 5, 'Years', 'Having 5 years of teaching experience in Ethical Hacking, Photoshop, Computer Forensics, Reverse Engineering, Game Development, Pentesting, Web Development, Programming, Designing Rootkits, Botnets, Ransomware, Spyware and Wireshark.', '', 'None', '1', '1', 'Having 5 years of teaching experience in Ethical Hacking, Photoshop, Computer Forensics, Reverse Engineering, Game Development, Pentesting, Web Development, Programming, Designing Rootkits, Botnets, Ransomware, Spyware and Wireshark. Good knowledge in Network analysis, Graphic designing and UI designing. Completed Bachelor of Technology in Information Technology.', 0, 'B.Tech', 0, 0, '', '', '', '', '0', 'no', '', 'Turner Zaidan', '7.00', 'yes', 'white house', 'United States', '417147', 'turnerz13@gma.com', 'Bank code (Bankleitzahl): 20503\r\ndomestic account number: 2101023600\r\nIBAN: AT022050302101023600 ', 'yes', 'yes', 'no', 'no', 'New Yourk', 3, NULL, 'No', 'No', NULL, NULL, NULL, 0, 0, '2016-11-10 11:41:55'),
(56, '::1', 'Vaughn Avaneesh', 'vaughn-avaneesh', '$2y$08$DrE286w7oOgMU0yd7RujQe1yyPXwM1z4piDSjf6.Jkq46sMKJ3UhO', NULL, 'vaughna39@gma.com', '3de8e6ba1d0d72f244d4412c04381890669f0d0d', NULL, NULL, NULL, 1478757160, 1478761378, 1, 'Vaughn', 'Avaneesh', NULL, 'Female', NULL, NULL, '7207757582', NULL, NULL, '', 0, '', 0, 'Months', NULL, '', 'None', '1', '1', '', 0, '', 0, 0, '', '', '', '', '0', 'no', NULL, '', '0.00', 'no', NULL, NULL, NULL, NULL, NULL, 'yes', 'yes', 'no', 'no', NULL, 3, NULL, 'No', 'No', NULL, NULL, NULL, 0, 0, '2016-11-10 11:42:05'),
(57, '::1', 'Vivaan Hattan', 'vivaan-hattan', '$2y$08$dt71vDK94u2S8wkQ.Cobie/xioOkWA1HVh7E9TJIs/pXSonGzUajC', NULL, 'vivaanh32@gma.com', '21fb003eb7af70fa07b0926e3c6ce55cfb0af20e', NULL, NULL, NULL, 1478757193, 1479733667, 1, 'Vivaan', 'Hattan', '1991-10-14', 'Male', NULL, '1684', '7207757581', '', '', '57.jpg', 0, 'English, French, Hindi, Urdu', 2, 'Years', 'Having 1 year of teaching experience in Dreamweaver,  C, Computer fundamentals, English Grammar, HTML/CSS, HTML5, PHP and Mathematics', '', 'All', '1', '1', 'Having  2 year of teaching experience in Dreamweaver,  C, Computer fundamentals, English Grammar, HTML/CSS, HTML5, PHP and Mathematics. Good knowledge in Data types, Keywords, For, While, Do while, Nested for, Operators, Arrays, Functions and Pointers. Completed Bachelor of Technology in CSE.', 0, 'B.Tech', 0, 1, '', '', '', '', '0', 'no', '', 'Vivaan Hattan', '6.00', 'yes', 'white house', 'United States', '417147', 'vivaanh32@gma.com', 'Bank code (Bankleitzahl): 20503\r\ndomestic account number: 2101023600\r\nIBAN: AT022050302101023600 ', 'yes', 'yes', 'no', 'no', 'New Yourk', 3, NULL, 'Yes', 'No', NULL, NULL, NULL, 0, 0, '2016-11-10 11:42:15'),
(58, '::1', 'Ameer Imani', 'ameer-imani', '$2y$08$00Y3iEJvG7JyCfvk5JbhfuN4c/OG40Vrmzj0KbyaLIISqJMJElqUG', NULL, 'ameeri26@gma.com', '5a87bc5df9a82eee86e1911ac4aaac76c1f41352', NULL, NULL, NULL, 1478757228, 1479733714, 1, 'Ameer', 'Imani', '1980-10-15', 'Male', NULL, '213', '7207757589', '', '', '58.jpg', 0, 'English, French, Hindi, Arabic', 3, 'Years', 'Having 3  years of real-time Experience', '', 'Mobile', '1', '1', 'Having 3  years of real-time and 1 year of teaching experience in Bootstrap, Codeigniter, Django, HTML/CSS, HTML5, Javascript, Jquery, MySQL, PHP and Python. Currently working as developer in an MNC. Proficient in designing and development of web applications. Completed Bachelor of Engineering', 0, 'B.Tech', 0, 1, '', '', '', '', '0', 'no', '', 'Ameer Imani', '5.00', 'yes', 'white house', 'Andorra', '417842', 'ameeri26@gma.com', 'Bank code (Bankleitzahl): 20503\r\ndomestic account number: 2101023600\r\nIBAN: AT022050302101023600 ', 'yes', 'yes', 'no', 'no', 'New Yourk', 3, NULL, 'Yes', 'No', NULL, NULL, NULL, 0, 0, '2016-11-10 11:42:25'),
(59, '::1', 'Gavyn Shrenik', 'gavyn-shrenik', '$2y$08$qa9nm/qHkKEPRxUCLP2dNOIeyC.Eu6JHaezuXaUs7sjkO43t5QBFO', NULL, 'gavyns53@gma.com', 'cab691855805b98d33aa135e993caf1a0d9ea25d', NULL, NULL, NULL, 1478757283, 1479733760, 1, 'Gavyn', 'Shrenik', '1991-10-07', 'Female', NULL, '213', '9963759817', '', '', '59.jpg', 0, 'English, French, Hindi, Urdu', 11, 'Years', 'I having 10+ years experience in Oracle SQL PL/SQL design development and performance tuning.', '', 'None', '1', '1', 'I having 10+ years experience in Oracle SQL PL/SQL design development and performance tuning. Good knowledge on SQL Performance tuning, Experience in design and development of Oracle database.', 0, 'B.Tech', 0, 1, '', '', '', '', '0', 'no', '', 'Gavyn Shrenik', '5.00', 'yes', 'white house', 'Algeria', '412146', 'gavyns53@gma.com', 'Bank code (Bankleitzahl): 20503\r\ndomestic account number: 2101023600\r\nIBAN: AT022050302101023600 ', 'yes', 'yes', 'no', 'no', 'New Yourk', 3, NULL, 'No', 'No', NULL, NULL, NULL, 0, 0, '2016-11-10 11:42:34'),
(60, '::1', 'Gino Samarion', 'gino-samarion', '$2y$08$4BstQHoFDsBRYm9aInZZMuiPH3Q5r6kfE5BAUSsNSq49vwpfB3uzO', NULL, 'ginos20@gma.com', 'cbe371cd7836fb787f72b77c5e7ff10d0f922cb4', NULL, NULL, NULL, 1478757313, 1479733799, 1, 'Gino', 'Samarion', NULL, 'Male', NULL, NULL, '7207757581', '', '', '60.jpg', 0, '', 3, 'Years', 'Having 3 years of teaching experience in ASP.Net, Android, Angular JS, C, C#, C++, Computer, MS Office', '', 'None', '1', '1', 'Having 3 years of teaching experience in ASP.Net, Android, Angular JS, C, C#, C++, Computer, MS Office Fundamentals, DBMS, HTML/CSS, HTML5, Java, Javascript, Jquery, Microsoft.Net, MySQL, Node JS, Oracle, PHP, PL/SQL, Web Services, Visual Basic and Web Designinng. Currently working as Project Manager in MNC. Completed Master of Technology in Computer Science.', 0, 'B.Tech', 0, 1, '', '', '', '', '0', 'no', NULL, 'Gino Samarion', '5.00', 'yes', NULL, NULL, NULL, NULL, NULL, 'yes', 'yes', 'no', 'no', NULL, 3, NULL, 'No', 'No', NULL, NULL, NULL, 0, 0, '2016-11-10 11:42:43'),
(61, '::1', 'Jovanni Nihal', 'jovanni-nihal', '$2y$08$xWSufedfFCqo8WCoUpBqK.mg87aZRgBrZLwRwup10CV/byNmbNSH6', NULL, 'jovannin75@gma.com', '6065c4704dea51735c76554c3518f272036ca933', NULL, NULL, NULL, 1478757346, 1479733837, 1, 'Jovanni', 'Nihal', '1991-10-16', 'Male', NULL, '355', '7207757588', '', '', '61.jpg', 0, 'English, French, Hindi, Dutch', 2, 'Years', 'Having 2 year of real-time and teaching experience Mathematics.', '', 'None', '1', '1', 'Having 2 year of real-time and teaching experience in Automation Testing, C, Java, TestNG, NUnit and Mathematics. Currently working as selenium automation test engineer in an MNC. Completed Bachelor of Technology in Information Technology', 0, 'B.Tech', 0, 1, '', '', '', '', '0', 'no', '', 'Jovanni Nihal', '5.00', 'no', 'white house', 'Angola', '417147', 'bentonr92@gma.com', 'Bank code (Bankleitzahl): 20503\r\ndomestic account number: 2101023600\r\nIBAN: AT022050302101023600 ', 'yes', 'yes', 'no', 'no', 'parase', 3, NULL, 'No', 'No', NULL, NULL, NULL, 0, 0, '2016-11-10 11:42:55'),
(62, '::1', 'Benton Rivaan', 'benton-rivaan', '$2y$08$o/Mth27.WQeQt9c2W2.ezupEeuYdQ1Fmv04vd.7xIQJYZjEiUF3Ru', NULL, 'bentonr92@gma.com', '5a7cfc470106571ba952ee8feb556a7fa8da1929', NULL, NULL, NULL, 1478757379, 1479733877, 1, 'Benton', 'Rivaan', '1990-10-08', 'Male', NULL, '1684', '7207757521', '', '', '62.jpg', 0, 'English, French, Hindi, Arabic', 5, 'Years', 'Having  5  year of real-time and teaching experience in Mathematics.', '', 'None', '1', '1', 'Having  5  year of real-time and teaching experience in Automation Testing, C, Java, TestNG, NUnit and Mathematics. Currently working as selenium automation test engineer in an MNC. Completed Bachelor of Technology in Information Technology', 0, 'B.Tech', 0, 1, '', '', '', '', '0', 'no', '', 'Benton Rivaan', '5.00', 'no', 'white house', 'British Indian Ocean Territory', '417147', 'bentonr92@gma.com', 'Bank code (Bankleitzahl): 20503\r\ndomestic account number: 2101023600\r\nIBAN: AT022050302101023600 ', 'yes', 'yes', 'no', 'no', 'New Yourk', 3, NULL, 'No', 'No', NULL, NULL, NULL, 0, 0, '2016-11-10 11:43:05'),
(63, '::1', 'Rodolfo Japheth', 'rodolfo-japheth', '$2y$08$Ic/3urcow7MPk/JpvC//HeTY16E5yGpIsMwQvTd1XGzDsLfc3xz2.', NULL, 'rodolfoj43@gma.com', '9bf20a187e628b4f7a4ec803b9ce3885a191fe68', NULL, NULL, NULL, 1478757419, 1479793514, 1, 'Rodolfo', 'Japheth', '2000-11-07', 'Male', NULL, '355', '7207757584', '', '', '63.jpg', 0, 'English, French, German, Czech', 5, 'Years', 'Having 5 years of real-time and teaching experience in  Competitive Exams.', '', 'None', '1', '1', 'Having 5 years of real-time and teaching experience in  Competitive Exams.  Good knowledge in Object oriented programming system. Possess excellent presentation skills. Completed Master of Computer Applications.', 0, 'M.Tech', 0, 1, '', '', '', '', '0', 'no', '', 'Rodolfo Japheth', '8.00', 'no', 'white house', 'United States', '417147', 'rodolfoj43@gma.com', 'Bank code (Bankleitzahl): 20503\r\ndomestic account number: 2101023600\r\nIBAN: AT022050302101023600 ', 'yes', 'yes', 'no', 'yes', 'New Yourk', 3, NULL, 'Yes', 'No', NULL, NULL, NULL, 0, 0, '2016-11-10 11:43:18'),
(64, '::1', 'Dominique Benjiman', 'dominique-benjiman', '$2y$08$2vncAxVZZ6IxaCnOhqWjGedjPmWQX1n5vS6EqOrk3PNEpj4N4Lky6', NULL, 'dominiqueb67@gma.com', 'b9071b7d3e0b500db442a71b5488275c99e17d25', NULL, NULL, NULL, 1478757451, 1479793133, 1, 'Dominique', 'Benjiman', '1990-10-08', 'Male', NULL, '1684', '7207757584', '', '', '64.jpg', 0, 'English, French, Hindi, Arabic', 8, 'Years', 'Having 8 years of real-time and teaching experience in study in abroad.', '', 'None', '1', '1', 'Having 8 years of real-time and teaching experience in study in abroad. Good knowledge in Object oriented programming system. Possess excellent presentation skills. Completed Master of Computer Applications.', 0, 'M.Tech', 0, 1, '', '', '', '', '0', 'no', '', 'Dominique Benjiman', '5.00', 'no', 'white house', 'United States', '412146', 'dominiqueb67@gma.com', 'Bank code (Bankleitzahl): 20503\r\ndomestic account number: 2101023600\r\nIBAN: AT022050302101023600 ', 'yes', 'yes', 'no', 'no', 'New Yourk', 3, NULL, 'Yes', 'No', NULL, NULL, NULL, 0, 0, '2016-11-10 11:43:25'),
(65, '::1', 'Jaycob Azariel', 'jaycob-azariel', '$2y$08$18sPpvffxlt7USoeXJenqOa0vHQy5G8HsD0U1leR7vyCX5gK.BCC2', NULL, 'jaycoba55@gma.com', 'a942cfc9d568b70d3ac2e5c21db6294a50eacc0f', NULL, NULL, NULL, 1478757500, 1479733998, 1, 'Jaycob', 'Azariel', '1994-10-10', 'Male', NULL, '1684', '7207757531', '', '', '65.jpg', 0, 'English, French, Hindi', 6, 'Years', 'Having 6 years of real-time and teaching experience in  Study in abroad Competitive Exams.', '', 'None', '1', '1', 'Having 6 years of real-time and teaching experience in  Study in abroad Competitive Exams. Good knowledge in Object oriented programming system. Possess excellent presentation skills. Completed Master of Computer Applications.', 0, 'B.Tech', 0, 1, '', '', '', '', '0', 'no', '', 'Jaycob Azariel', '5.00', 'no', 'over bridge', 'China', '412146', 'jaycoba55@gma.com', 'Bank code (Bankleitzahl): 20503\r\ndomestic account number: 2101023600\r\nIBAN: AT022050302101023600 ', 'yes', 'yes', 'no', 'no', 'parase', 3, NULL, 'Yes', 'No', NULL, NULL, NULL, 0, 0, '2016-11-10 11:43:35'),
(66, '::1', 'Jericho Oseas', 'jericho-oseas', '$2y$08$3bsqQGTTmUcl.8epYSMo6.0zLAhVxuwI.QDs/a5jqi.iUZ3eYTN8W', NULL, 'jerichoo16@gma.com', '17edb9c2cefdc2b5a405bdf5ddf653548b2386f0', NULL, NULL, NULL, 1478757561, 1479734029, 1, 'Jericho', 'Oseas', '1991-08-06', 'Male', NULL, '1684', '7207757584', '', '', '66.jpg', 0, 'English, Hindi, Urdu, Dutch', 6, 'Years', 'Having 6 years of real-time and teaching experience in Study in abroad  competitive exams', '', 'None', '1', '1', 'Having 6 years of real-time and teaching experience in Study in abroad  competitive exams. Good knowledge in Object oriented programming system. Possess excellent presentation skills. Completed Master of Computer Applications.', 0, 'M.Tech', 0, 1, '', '', '', '', '0', 'no', '', 'Jericho Oseas', '5.00', 'yes', 'white house', 'United States', '417147', 'jerichoo16@gma.com', 'Bank code (Bankleitzahl): 20503\r\ndomestic account number: 2101023600\r\nIBAN: AT022050302101023600 ', 'yes', 'yes', 'no', 'no', 'New Yourk', 3, NULL, 'Yes', 'No', NULL, NULL, NULL, 0, 0, '2016-11-10 11:43:45'),
(67, '10.0.0.15', 'Detzani ', 'detzani-naraya28gmacom', '$2y$08$Mg/P6Jnh9GeBtKINvwuHXucM.BIzolAP7QQAgjr46kpbmRqsVV3kW', NULL, 'naraya', 'eda0a1222d2046c6f0055718c606d96a0016af47', NULL, NULL, NULL, 1478757586, NULL, 1, 'Detzani', 'Naraya28@gma.com', NULL, 'Male', NULL, NULL, '45698712360', NULL, NULL, '', 0, '', 0, 'Months', NULL, '', 'None', '1', '1', '', 0, '', 0, 0, '', '', '', '', '0', 'no', NULL, '', '0.00', 'no', NULL, NULL, NULL, NULL, NULL, 'yes', 'yes', 'no', 'no', NULL, 3, NULL, 'No', 'No', NULL, NULL, NULL, 0, 43, '2016-11-10 11:29:59'),
(68, '::1', 'Augustine Alondra', 'augustine-alondra', '$2y$08$MeD0zTyUhZNiT/.sH207IOb75zjlih3pDymsf5oYpsqmE9nzk9e1m', NULL, 'augustinea57@gma.com', '6537320c3c526d9d71a22c90fec9cfbab0483ed3', NULL, NULL, NULL, 1478757628, 1479977642, 1, 'Augustine', 'Alondra', '1989-10-18', 'Male', NULL, '1684', '7207757584', '', '', '68.jpg', 0, 'English, French, Urdu, Dutch', 10, 'Years', 'Having 10 years of real-time and teaching experience in  Gate Exam', '', 'All', '1', '1', 'Having 10 years of real-time and teaching experience in  Gate Exam , AJAX, Bootstrap, Codeigniter, Drupal, HTML/CSS, HTML5, MongoDB, MySQL, PHP and WordPress. Good knowledge in Object oriented programming system. Possess excellent presentation skills. Completed Master of Computer Applications.', 0, 'M.Tech', 0, 1, '', '', '', '', '0', 'no', '', 'Augustine Alondra', '5.00', 'yes', NULL, NULL, NULL, 'augustinea57@gma.com', 'Bank code (Bankleitzahl): 20503\r\ndomestic account number: 2101023600\r\nIBAN: AT022050302101023600 ', 'yes', 'yes', 'no', 'no', NULL, 3, 12, 'Yes', 'No', NULL, NULL, NULL, 2140, 0, '2016-11-11 10:41:17'),
(69, '::1', 'Coleman Keishawn', 'coleman-keishawn', '$2y$08$YGtt/hPE/p/9oYNmeakoC.jDrvX6OVUXE99N1STGruoI62nS6jvS2', NULL, 'colemank58@gma.com', '53be192fc36c8cf00d7c27ecb1bfc52b3746cee3', NULL, NULL, NULL, 1478757668, 1479734113, 1, 'Coleman', 'Keishawn', '1990-10-08', 'Male', NULL, '1684', '7207757584', '', '', '69.jpg', 0, 'English, French, Hindi', 5, 'Years', 'Having 5years of real-time and teaching experience in AJAX, Bootstrap, Codeigniter, Drupal, HTML/CSS, HTML5, MongoDB, MySQL, PHP and WordPress.', '', 'None', '1', '1', 'Having 5years of real-time and teaching experience in AJAX, Bootstrap, Codeigniter, Drupal, HTML/CSS, HTML5, MongoDB, MySQL, PHP and WordPress. Good knowledge in Object oriented programming system. Possess excellent presentation skills. Completed Master of Computer Applications.', 0, 'M.Tech', 0, 1, '', '', '', '', '0', 'no', '', 'Coleman Keishawn', '6.00', 'no', 'white house', 'Brazil', '417842', 'colemank58@gma.com', 'Bank code (Bankleitzahl): 20503\r\ndomestic account number: 2101023600\r\nIBAN: AT022050302101023600 ', 'yes', 'yes', 'no', 'no', 'New York', 3, NULL, 'Yes', 'No', NULL, NULL, NULL, 0, 0, '2016-11-10 11:44:03'),
(70, '::1', 'Dash Zamire', 'dash-zamire', '$2y$08$n6xJHuUu4vDl9NJE2FHWd./i/UOZxlZ6hXFzBtAf1rywFe7h97vP.', NULL, 'dashz46@gma.com', '215805db9f67ee4ca64a47f75effd8733c2e59b6', NULL, NULL, NULL, 1478757702, 1479734141, 1, 'Dash', 'Zamire', '1992-08-03', 'Male', NULL, '213', '7207757584', '', '', '70.jpg', 0, 'English, French, Arabic', 7, 'Years', 'Having7 years of real-time and teaching experience in AJAX, Bootstrap, Codeigniter, Drupal, HTML/CSS, HTML5, MongoDB, MySQL, PHP and WordPress.', '', 'None', '1', '1', 'Having7 years of real-time and teaching experience in AJAX, Bootstrap, Codeigniter, Drupal, HTML/CSS, HTML5, MongoDB, MySQL, PHP and WordPress. Good knowledge in Object oriented programming system. Possess excellent presentation skills. Completed Master of Computer Applications.', 0, 'M.Tech', 0, 1, '', '', '', '', '0', 'no', '', 'Dash Zamire', '5.00', 'yes', 'white house', 'United States', '417147', 'dashz46@gma.com', 'Bank code (Bankleitzahl): 20503\r\ndomestic account number: 2101023600\r\nIBAN: AT022050302101023600 ', 'yes', 'yes', 'no', 'no', 'New York', 3, NULL, 'Yes', 'No', NULL, NULL, NULL, 0, 0, '2016-11-10 11:44:12'),
(71, '::1', 'Eliseo Nain', 'eliseo-nain', '$2y$08$DOPgVn2AGcSuQAf0bp.aJeG3JdSstwiXAURAUDe8rUz8lTxmeKjx.', NULL, 'eliseon68@gma.com', '697523bf5eb52310d3dd10ec3adb0002ee5e3c84', NULL, NULL, NULL, 1478757733, 1478777991, 1, 'Eliseo', 'Nain', '1995-08-23', 'Male', NULL, '1684', '7207757584', '', '', '', 0, 'English, Hindi, Urdu, Dutch', 5, 'Years', 'Having 5 years of real-time and teaching experience in AJAX, Bootstrap, Codeigniter, Drupal, HTML/CSS, HTML5, MongoDB, MySQL, PHP and WordPress.', '', 'None', '1', '1', 'Having 5 years of real-time and teaching experience in AJAX, Bootstrap, Codeigniter, Drupal, HTML/CSS, HTML5, MongoDB, MySQL, PHP and WordPress. Good knowledge in Object oriented programming system. Possess excellent presentation skills. Completed Master of Computer Applications.', 0, 'M.Tech', 0, 0, '', '', '', '', '0', 'no', '', 'Eliseo Nain', '5.00', 'yes', 'white house', 'United States', '417147', 'eliseon68@gma.com', 'Bank code (Bankleitzahl): 20503\r\ndomestic account number: 2101023600\r\nIBAN: AT022050302101023600 ', 'yes', 'yes', 'no', 'no', 'New York', 3, NULL, 'Yes', 'No', NULL, NULL, NULL, 0, 0, '2016-11-10 11:44:21'),
(72, '::1', 'Khalid Arona', 'khalid-arona', '$2y$08$I5AosceNy92ENAOuMw9eguVNSWbwewrY0sgk2iMdyIbJkVz5pSF9G', NULL, 'khalida70@gma.com', 'ef4edfb008f5351ef99bbdef65c3b8cf86e892aa', NULL, NULL, NULL, 1478757767, 1479734187, 1, 'Khalid', 'Arona', '1990-09-03', 'Female', NULL, '1684', '7207757584', '', '', '72.jpg', 0, 'English, French, Hindi, Urdu', 6, 'Years', 'Having 6 year of real-time and teaching experience in Automation Testing, C, Java, TestNG, NUnit and Mathematics.', '', 'None', '1', '1', 'Having 6 year of real-time and teaching experience in Automation Testing, C, Java, TestNG, NUnit and Mathematics. Currently working as selenium automation test engineer in an MNC. Completed Bachelor of Technology in Information Technology', 0, 'B.Tech', 0, 1, '', '', '', '', '0', 'no', '', 'Khalid Arona', '5.00', 'yes', NULL, NULL, NULL, 'khalida70@gma.com', 'Bank code (Bankleitzahl): 20503\r\ndomestic account number: 2101023600\r\nIBAN: AT022050302101023600 ', 'yes', 'yes', 'no', 'no', NULL, 3, NULL, 'Yes', 'No', NULL, NULL, NULL, 0, 0, '2016-11-10 11:44:29'),
(73, '::1', 'Quintin Saheim', 'quintin-saheim', '$2y$08$SEWBqohdnofpryD4S38F.OaTe.nIPeaKbk408BSuLtQKNAQsWaK5K', NULL, 'quintins67@gma.com', 'b980cf5783e925ebe973efdd08f9f433e096c551', NULL, NULL, NULL, 1478757803, NULL, 1, 'Quintin', 'Saheim', NULL, 'Female', NULL, NULL, '7207757584', NULL, NULL, '', 0, '', 0, 'Months', NULL, '', 'None', '1', '1', '', 0, '', 0, 0, '', '', '', '', '0', 'no', NULL, '', '0.00', 'no', NULL, NULL, NULL, NULL, NULL, 'yes', 'yes', 'no', 'no', NULL, 3, NULL, 'No', 'No', NULL, NULL, NULL, 0, 0, '2016-11-10 11:44:39'),
(74, '::1', 'Makhi Whitfield', 'makhi-whitfield', '$2y$08$ILRMAZZ.iEOfFM/JRrR9ZueC.tghlWLSTYKaLY7Oov6oCEbegTALC', NULL, 'makhiw25@gma.com', '759206afc1eeb0fbd4a0398786d81ee2f1235999', NULL, NULL, NULL, 1478757838, NULL, 1, 'Makhi', 'Whitfield', NULL, 'Male', NULL, NULL, '7207757582', NULL, NULL, '', 0, '', 0, 'Months', NULL, '', 'None', '1', '1', '', 0, '', 0, 0, '', '', '', '', '0', 'no', NULL, '', '0.00', 'no', NULL, NULL, NULL, NULL, NULL, 'yes', 'yes', 'no', 'no', NULL, 3, NULL, 'No', 'No', NULL, NULL, NULL, 0, 0, '2016-11-10 11:45:00'),
(75, '::1', 'Zaid Roscoe', 'zaid-roscoe', '$2y$08$Aoo9apY7/DJ7wAT7Ugz2N.3jZ.7aqoovpmGUpXDlsQuNIbbksD8Z6', NULL, 'zaidr27@gma.com', '9b518acd8ce681e134eb009dafdabfade960fdb0', NULL, NULL, NULL, 1478757870, NULL, 1, 'Zaid', 'Roscoe', NULL, 'Male', NULL, NULL, '7207757584', NULL, NULL, '', 0, '', 0, 'Months', NULL, '', 'None', '1', '1', '', 0, '', 0, 0, '', '', '', '', '0', 'no', NULL, '', '0.00', 'no', NULL, NULL, NULL, NULL, NULL, 'yes', 'yes', 'no', 'no', NULL, 3, NULL, 'No', 'No', NULL, NULL, NULL, 0, 0, '2016-11-10 11:45:10'),
(76, '::1', 'Anakin Raycen', 'anakin-raycen', '$2y$08$MMLnZfejcjtCBirmIxfXOOowdQgdFLH/VNVGgfhYY/Fab8W.Gv6GS', NULL, 'anakinr57@gma.com', '9becd148115f84b3314dd30ed5fd222f02f1ab2c', NULL, NULL, NULL, 1478757902, NULL, 1, 'Anakin', 'Raycen', NULL, 'Male', NULL, NULL, '7207757584', NULL, NULL, '', 0, '', 0, 'Months', NULL, '', 'None', '1', '1', '', 0, '', 0, 0, '', '', '', '', '0', 'no', NULL, '', '0.00', 'no', NULL, NULL, NULL, NULL, NULL, 'yes', 'yes', 'no', 'no', NULL, 3, NULL, 'No', 'No', NULL, NULL, NULL, 0, 0, '2016-11-10 11:45:25'),
(77, '::1', 'Baylor Halen', 'baylor-halen', '$2y$08$TV9WzAYwuajJ.u5p7H9CjOVjdt4dBCnUMfl55c2LsfGwi7XJ9KPFu', NULL, 'baylorh69@gma.com', '5ee470c5d3e3e3f7e4640d4a027b30d74337b6d6', NULL, NULL, NULL, 1478757940, NULL, 1, 'Baylor', 'Halen', NULL, 'Male', NULL, NULL, '7207757584', NULL, NULL, '', 0, '', 0, 'Months', NULL, '', 'None', '1', '1', '', 0, '', 0, 0, '', '', '', '', '0', 'no', NULL, '', '0.00', 'no', NULL, NULL, NULL, NULL, NULL, 'yes', 'yes', 'no', 'no', NULL, 3, NULL, 'No', 'No', NULL, NULL, NULL, 0, 0, '2016-11-10 11:45:37'),
(78, '10.0.0.15', 'Neida Meeyah', 'neida-meeyah', '$2y$08$hcT8JEG8TWvPUbtvcOELaePomGvobkkPZOhOZz5BIGZFSuXoskyZq', NULL, 'neida11@gma.com', 'ddfcaa5cdc4ae76d0547c38d528d4d6a43ade7c8', NULL, NULL, NULL, 1478760188, NULL, 1, 'Neida', 'Meeyah', NULL, 'Male', NULL, NULL, '4564564560', NULL, NULL, '', 0, '', 0, 'Months', NULL, '', 'None', '1', '1', '', 0, '', 0, 0, '', '', '', '', '0', 'no', NULL, '', '0.00', 'no', NULL, NULL, NULL, NULL, NULL, 'yes', 'yes', 'no', 'no', NULL, 3, NULL, 'No', 'No', NULL, NULL, NULL, 0, 44, '2016-11-10 12:13:21'),
(79, '10.0.0.15', 'Nikiya Makinze', 'nikiya-makinze', '$2y$08$aVg3O8ajdltVGf8nObLMXurY2jT2qBNawMaScuG.yxlI8SBAtXdQu', NULL, 'nikiya24@gma.com', '549e7ee0b2e1a4355ee9917c78c5eaca10faa49e', NULL, NULL, NULL, 1478761651, NULL, 1, 'Nikiya', 'Makinze', NULL, 'Female', NULL, NULL, '1234567890', NULL, NULL, '', 0, '', 0, 'Months', NULL, '', 'None', '1', '1', '', 0, '', 0, 0, '', '', '', '', '0', 'no', NULL, '', '0.00', 'no', NULL, NULL, NULL, NULL, NULL, 'yes', 'yes', 'no', 'no', NULL, 3, NULL, 'No', 'No', NULL, NULL, NULL, 0, 45, '2016-11-10 12:38:34'),
(80, '10.0.0.15', 'Olesya Taleia', 'olesya-taleia', '$2y$08$robdqH2I.cD/J7hz0Wh.uO2fPjUy8VSzI.ljoGqipIAGl5VvOMPJ6', NULL, 'olesya57@gma.com', 'd005e7240a76fdbcc23ceea16d0d70bac5527895', NULL, NULL, NULL, 1478763681, NULL, 1, 'Olesya', 'Taleia', NULL, 'Male', NULL, NULL, '546321021', NULL, NULL, '', 0, '', 0, 'Months', NULL, '', 'None', '1', '1', '', 0, '', 0, 0, '', '', '', '', '0', 'no', NULL, '', '0.00', 'no', NULL, NULL, NULL, NULL, NULL, 'yes', 'yes', 'no', 'no', NULL, 3, NULL, 'No', 'No', NULL, NULL, NULL, 0, 46, '2016-11-10 13:11:35'),
(81, '10.0.0.18', 'Panagiota Tranise', 'panagiota-tranise', '$2y$08$AW8tlfGlyfTm/zx3D.dfpe9ShLA5jbNgcdGFf3wwibcWVcEHUEene', NULL, 'panagiota46@gma.com', '7363b2adde8ab7d596a7194c7a2532eaac1b4eb2', NULL, NULL, NULL, 1478768559, NULL, 1, 'Panagiota', 'Tranise', NULL, 'Male', NULL, NULL, '9632587410', NULL, NULL, '', 0, '', 0, 'Months', NULL, '', 'None', '1', '1', '', 0, '', 0, 0, '', '', '', '', '0', 'no', NULL, '', '0.00', 'no', NULL, NULL, NULL, NULL, NULL, 'yes', 'yes', 'no', 'no', NULL, 3, NULL, 'No', 'No', NULL, NULL, NULL, 0, 47, '2016-11-10 14:33:29'),
(82, '10.0.0.18', 'Priyal Averylynn', 'priyal-averylynn', '$2y$08$kRjeW3zp1MBcebop5Eul1u8Owtsbi2LoNzFmxxvvSyMBPcSywKa/y', NULL, 'priyal38@gma.com', '514cdb90f874cccf2c17c1f35468abebb6f5da3d', NULL, NULL, NULL, 1478769538, NULL, 1, 'Priyal', 'Averylynn', NULL, 'Female', NULL, NULL, '1234561065', NULL, NULL, '', 0, '', 0, 'Months', NULL, '', 'None', '1', '1', '', 0, '', 0, 0, '', '', '', '', '0', 'no', NULL, '', '0.00', 'no', NULL, NULL, NULL, NULL, NULL, 'yes', 'yes', 'no', 'no', NULL, 3, NULL, 'No', 'No', NULL, NULL, NULL, 0, 48, '2016-11-10 14:49:09'),
(83, '10.0.0.18', 'Raegin Shree', 'raegin-shree', '$2y$08$5ofbZeVK935XE0L/ecmj3.xqup4ygn0n.4CEAqKXSNyR96ebfd35y', NULL, 'raegin40@gma.com', '349db92ac2746d4de5a3a6f7e41ed58f88ff8693', NULL, NULL, NULL, 1478772615, NULL, 1, 'Raegin', 'Shree', NULL, 'Female', NULL, NULL, '1234561065', NULL, NULL, '', 0, '', 0, 'Months', NULL, '', 'None', '1', '1', '', 0, '', 0, 0, '', '', '', '', '0', 'no', NULL, '', '0.00', 'no', NULL, NULL, NULL, NULL, NULL, 'yes', 'yes', 'no', 'no', NULL, 3, NULL, 'No', 'No', NULL, NULL, NULL, 0, 49, '2016-11-10 15:40:29'),
(84, '10.0.0.18', 'Raye Johna', 'raye-johna', '$2y$08$XiBgayBtffT49aanur.ENuWot00DcV/DOOjcx71A3G/RYM77.NuLy', NULL, 'raye73@gma.com', '29dd3e52e5d2da8a87e463708724e1fa0f6353d5', NULL, NULL, NULL, 1478773467, NULL, 1, 'Raye', 'Johna', NULL, 'Female', NULL, NULL, '1234561065', NULL, NULL, '', 0, '', 0, 'Months', NULL, '', 'None', '1', '1', '', 0, '', 0, 0, '', '', '', '', '0', 'no', NULL, '', '0.00', 'no', NULL, NULL, NULL, NULL, NULL, 'yes', 'yes', 'no', 'no', NULL, 3, NULL, 'No', 'No', NULL, NULL, NULL, 0, 50, '2016-11-10 15:54:40'),
(85, '10.0.0.18', 'Renezmay Jaydelynn', 'renezmay-jaydelynn', '$2y$08$Zy1gq1y4zDrpnhotZaNjFOdbA.CaS8VIhr4Bh7u9cYYlN0P4XRlLu', NULL, 'renezmay64@gma.com', 'cb138d283f07ec7e0c1188337e6116b1c69da8ac', NULL, NULL, NULL, 1478775690, NULL, 1, 'Renezmay', 'Jaydelynn', NULL, 'Male', NULL, NULL, '1234561066', NULL, NULL, '', 0, '', 0, 'Months', NULL, '', 'None', '1', '1', '', 0, '', 0, 0, '', '', '', '', '0', 'no', NULL, '', '0.00', 'no', NULL, NULL, NULL, NULL, NULL, 'yes', 'yes', 'no', 'no', NULL, 3, NULL, 'No', 'No', NULL, NULL, NULL, 0, 51, '2016-11-10 16:31:41'),
(86, '::1', 'Krish Fedor', 'krish-fedor', '$2y$08$ba/VrNEq5a5Zw2.rroEaeuMzmKfS/ctrBClK.21rp.PKR4bYTl4ku', NULL, 'krishf20@gma.com', '5553cf4249b987a299a15200ee68b94471c9288f', NULL, NULL, NULL, 1478781696, 1479887499, 1, 'Krish', 'Fedor', '2006-11-07', 'Male', NULL, '213', '7207757584', '', '', '86.jpg', 0, 'English,French,Arabic,Urdu', 2002, 'Months', '10 years of experience in training softwares', '', 'None', '1', '1', 'Aptech  software Computer Education is a premier IT\r\neducation Institute. Established in 2006, Aptech software  is a\r\npioneer in IT software & hardware training.\r\n\r\nThe institute has trained 68 lakh (6.8 million)\r\nstudents through a wide network of education\r\ncentres located in over 40 countries.', 0, '', 0, 1, '', '', '', '', '0', 'no', '', 'Krish Fedor', '0.00', 'no', 'white house', 'United States', '417147', 'krishf20@gma.com', 'Bank code (Bankleitzahl): 20503\r\ndomestic account number: 2101023600\r\nIBAN: AT022050302101023600 ', 'yes', 'yes', 'no', 'no', 'New York', 4, NULL, 'No', 'No', NULL, NULL, NULL, 0, 0, '2016-11-10 18:28:07'),
(87, '::1', 'Boone Edrei', 'boone-edrei', '$2y$08$08wo9S8UMDrCRXN4pFAeUuUGdMnCdlXQgSGdnDcYycXiziemUJS6q', NULL, 'boonee2@gma.com', 'adf3006533a306c48cfe84cb71e27da6e531b7ef', NULL, NULL, NULL, 1478781740, 1479887531, 1, 'Boone', 'Edrei', '1991-10-10', 'Male', NULL, '1684', '7207757584', '', '', '87.jpg', 0, 'English,French,Hindi', 1990, 'Months', 'NET have 16 Years experience', '', 'Email', '1', '1', 'About NET\r\nNET is a leading Skills and Talent Development Corporation that is building a manpower pool for global industry requirements. The company, which was set up in 1990 to help the nascent IT industry overcome its human resource challenges, today ranks among the world’s leading training companies owing to its vast, yet comprehensive array of talent development programs. With a footprint across 40 nations, NET  offers training and development solutions to Individuals, Enterprises and Inst', 0, '', 0, 1, '', '', '', '', '0', 'no', '', 'Boone Edrei', '0.00', 'no', 'white house', 'United States', '412147', 'boonee2@gma.com', 'Bank code (Bankleitzahl): 20811008\r\ndomestic account number: 1039531801 \r\nIBAN: AL90208110080000001039531801', 'yes', 'yes', 'no', 'no', 'New York', 4, NULL, 'Yes', 'No', NULL, NULL, NULL, 0, 0, '2016-11-10 18:27:59'),
(88, '::1', 'Merrick Juvenal', 'merrick-juvenal', '$2y$08$MOyQROrZylvDRoFCV2SHauLlwvCxiN6C1RAAbbK99lvVFy/3qqqGq', NULL, 'merrickj47@gma.com', 'eaa331fbc4740125e218b85437a25f04040167d2', NULL, NULL, NULL, 1478781941, 1479887559, 1, 'Merrick', 'Juvenal', '1991-09-16', 'Male', NULL, '213', '7207757584', '', '', '88.jpg', 0, 'English,Hindi,Urdu,Dutch', 1991, 'Months', '15 Years of Experience in training software engineers', '', 'None', '1', '1', 'PEERS  is a leading Skills and Talent Development Corporation that is building a manpower pool for global industry requirements. The company, which was set up in 1991 to help the nascent IT industry overcome its human resource challenges, today ranks among the world’s leading training companies owing to its vast, yet comprehensive array of talent development programs. With a footprint across 40 nations, PEERS offers training and development solutions to Individuals, Enterprises and Institutions.', 0, '', 0, 1, '', '', '', '', '0', 'no', '', 'Merrick Juvenal', '0.00', 'no', 'white house', 'United States', '412147', 'merrickj47@gma.com', 'Bank code (Bankleitzahl): 20811008\r\ndomestic account number: 1039531801 \r\nIBAN: AL90208110080000001039531801', 'yes', 'yes', 'no', 'no', 'New York', 4, NULL, 'No', 'No', NULL, NULL, NULL, 0, 0, '2016-11-10 18:27:50'),
(89, '::1', 'Ralph Trevon', 'ralph-trevon', '$2y$08$IlcjTEG0DOGfjbK8brmQtuWYL0dUckNy/BYDrUx2C0xojiHlthw8u', NULL, 'ralpht88@gma.com', '86886d6ed3b7f387a753e74b54452ad66196404e', NULL, NULL, NULL, 1478781974, 1479887595, 1, 'Ralph', 'Trevon', NULL, 'Male', NULL, NULL, '7207757584', NULL, NULL, '', 0, '', 0, 'Months', NULL, '', 'None', '1', '1', '', 0, '', 0, 0, '', '', '', '', '0', 'no', NULL, '', '0.00', 'no', NULL, NULL, NULL, NULL, NULL, 'yes', 'yes', 'no', 'no', NULL, 4, NULL, 'No', 'No', NULL, NULL, NULL, 0, 0, '2016-11-10 18:27:40'),
(90, '::1', 'Antoine Lenox', 'antoine-lenox', '$2y$08$x.Zlqa/lWID38i/LfHHAKeQ0yuK3ZDvPLdhSTs29056fNU0cjufjm', NULL, 'antoinel31@gma.com', 'ce5d0a79bef8b7ea44d62960118cc0e054b8d2b3', NULL, NULL, NULL, 1478782010, 1479887651, 1, 'Antoine', 'Lenox', NULL, 'Female', NULL, NULL, '7207757584', NULL, NULL, '', 0, '', 0, 'Months', NULL, '', 'None', '1', '1', '', 0, '', 0, 0, '', '', '', '', '0', 'no', NULL, '', '0.00', 'no', NULL, NULL, NULL, NULL, NULL, 'yes', 'yes', 'no', 'no', NULL, 4, NULL, 'No', 'No', NULL, NULL, NULL, 0, 0, '2016-11-10 18:27:31'),
(91, '::1', 'Jorden Parks', 'jorden-parks', '$2y$08$IucQSNrJtW8zrv0b78ybouQsXfRvU9l7.Qa91TTCVzNx.UJ3BLNUe', NULL, 'jordenp26@gma.com', '116e1a32ded52247bb7266f8cfb8f52400381f51', NULL, NULL, NULL, 1478782039, NULL, 1, 'Jorden', 'Parks', NULL, 'Male', NULL, NULL, '7207757584', NULL, NULL, '', 0, '', 0, 'Months', NULL, '', 'None', '1', '1', '', 0, '', 0, 0, '', '', '', '', '0', 'no', NULL, '', '0.00', 'no', NULL, NULL, NULL, NULL, NULL, 'yes', 'yes', 'no', 'no', NULL, 4, NULL, 'No', 'No', NULL, NULL, NULL, 0, 0, '2016-11-10 18:27:18'),
(92, '::1', 'Octavio Kentrell', 'octavio-kentrell', '$2y$08$WVxTmC2UsdoElWjiLobHyuUB1BJZPnXBkadhWHqrcbjuSAQz.YNHu', NULL, 'octaviok45@gma.com', '68c677f02bdf9114170e8ceb1033a973244af866', NULL, NULL, NULL, 1478782078, NULL, 1, 'Octavio', 'Kentrell', NULL, 'Female', NULL, NULL, '7207757584', NULL, NULL, '', 0, '', 0, 'Months', NULL, '', 'None', '1', '1', '', 0, '', 0, 0, '', '', '', '', '0', 'no', NULL, '', '0.00', 'no', NULL, NULL, NULL, NULL, NULL, 'yes', 'yes', 'no', 'no', NULL, 4, NULL, 'No', 'No', NULL, NULL, NULL, 0, 0, '2016-11-10 18:27:10'),
(93, '::1', 'Eliot Zackaria', 'eliot-zackaria', '$2y$08$T0E6G4kBLqTL9nCBsiuRp.yqOKmJRNyWY7Q7HewuFLbvvY9zQxaoG', NULL, 'eliotz59@gma.com', '012286eba7b7295559ee2c27db2031bb0074508b', NULL, NULL, NULL, 1478782109, NULL, 1, 'Eliot', 'Zackaria', NULL, 'Male', NULL, NULL, '7207757584', NULL, NULL, '', 0, '', 0, 'Months', NULL, '', 'None', '1', '1', '', 0, '', 0, 0, '', '', '', '', '0', 'no', NULL, '', '0.00', 'no', NULL, NULL, NULL, NULL, NULL, 'yes', 'yes', 'no', 'no', NULL, 4, NULL, 'No', 'No', NULL, NULL, NULL, 0, 0, '2016-11-10 18:27:00'),
(94, '::1', 'Jarrett Souleymane', 'jarrett-souleymane', '$2y$08$Cc6BnQG.YkFyIo03ZQYAHen7F9PB5QfGQBSquN.MKTDm/ZVDaXk3m', NULL, 'jarretts11@gma.com', '9ccafffd2efa8ec1c386f4f5fb6b12732eebde66', NULL, NULL, NULL, 1478782138, NULL, 1, 'Jarrett', 'Souleymane', NULL, 'Male', NULL, NULL, '7207757584', NULL, NULL, '', 0, '', 0, 'Months', NULL, '', 'None', '1', '1', '', 0, '', 0, 0, '', '', '', '', '0', 'no', NULL, '', '0.00', 'no', NULL, NULL, NULL, NULL, NULL, 'yes', 'yes', 'no', 'no', NULL, 4, NULL, 'No', 'No', NULL, NULL, NULL, 0, 0, '2016-11-10 18:26:52'),
(95, '::1', 'Tristin Xhaiden', 'tristin-xhaiden', '$2y$08$82mVARyfxJK3qBxumnqd1unkoUdKCabuyM6Bl.l0h0ng5P4WGqks2', NULL, 'tristinx87@gma.com', '75e1b009d75c20554dcd1d6de4619b0f9d734042', NULL, NULL, NULL, 1478782170, NULL, 1, 'Tristin', 'Xhaiden', NULL, 'Male', NULL, NULL, '7207757584', NULL, NULL, '', 0, '', 0, 'Months', NULL, '', 'None', '1', '1', '', 0, '', 0, 0, '', '', '', '', '0', 'no', NULL, '', '0.00', 'no', NULL, NULL, NULL, NULL, NULL, 'yes', 'yes', 'no', 'no', NULL, 4, NULL, 'No', 'No', NULL, NULL, NULL, 0, 0, '2016-11-10 18:26:43'),
(96, '::1', 'Derick Kendre', 'derick-kendre', '$2y$08$9mQ3vQ3ICfas5.YS1MuCAO44wx/JNww18QeQ3WNvnWurO1MImkINy', NULL, 'derickk99@gma.com', '5a38569fce3176d659c4f83aa1b5ccb23a8ddee8', NULL, NULL, NULL, 1478782201, NULL, 1, 'Derick', 'Kendre', NULL, 'Female', NULL, NULL, '7207757584', NULL, NULL, '', 0, '', 0, 'Months', NULL, '', 'None', '1', '1', '', 0, '', 0, 0, '', '', '', '', '0', 'no', NULL, '', '0.00', 'no', NULL, NULL, NULL, NULL, NULL, 'yes', 'yes', 'no', 'no', NULL, 4, NULL, 'No', 'No', NULL, NULL, NULL, 0, 0, '2016-11-10 18:26:35'),
(97, '::1', 'Bishop Becket', 'bishop-becket', '$2y$08$AiMZqTjv9q3PVZiOVcbsQuZJ3ltS0XtOovLAUhqu8ULOD8yJ7Peky', NULL, 'bishopb55@gma.com', 'b7db279ca875bb67a6d9d982c246d5beb3e4b98c', NULL, NULL, NULL, 1478782271, NULL, 1, 'Bishop', 'Becket', NULL, 'Female', NULL, NULL, '7207757584', NULL, NULL, '', 0, '', 0, 'Months', NULL, '', 'None', '1', '1', '', 0, '', 0, 0, '', '', '', '', '0', 'no', NULL, '', '0.00', 'no', NULL, NULL, NULL, NULL, NULL, 'yes', 'yes', 'no', 'no', NULL, 4, NULL, 'No', 'No', NULL, NULL, NULL, 0, 0, '2016-11-10 18:26:24'),
(98, '::1', 'Kaidyn Kota', 'kaidyn-kota', '$2y$08$GHu6KxcFstGQVa8FqKvHtOCe3iXWq3iHPiq3ED7RA4wKrCN3uOldq', NULL, 'kaidynk33@gma.com', 'ff30cbe0fcb5ef8ae6e193009fa17abaaa2e7973', NULL, NULL, NULL, 1478782306, NULL, 1, 'Kaidyn', 'Kota', NULL, 'Male', NULL, NULL, '7207757584', NULL, NULL, '', 0, '', 0, 'Months', NULL, '', 'None', '1', '1', '', 0, '', 0, 0, '', '', '', '', '0', 'no', NULL, '', '0.00', 'no', NULL, NULL, NULL, NULL, NULL, 'yes', 'yes', 'no', 'no', NULL, 4, NULL, 'No', 'No', NULL, NULL, NULL, 0, 0, '2016-11-10 18:26:14'),
(99, '::1', 'Aayden Juanpablo', 'aayden-juanpablo', '$2y$08$rDig6h0/nahStiOSWxruP.CuP.GM8zdrQV83LSeiK1vXQ2DNnVxoa', NULL, 'aaydenj60@gma.com', '012a2a4785056f8006d254945bea895101cb3191', NULL, NULL, NULL, 1478782341, NULL, 1, 'Aayden', 'Juanpablo', NULL, 'Male', NULL, NULL, '7207757584', NULL, NULL, '', 0, '', 0, 'Months', NULL, '', 'None', '1', '1', '', 0, '', 0, 0, '', '', '', '', '0', 'no', NULL, '', '0.00', 'no', NULL, NULL, NULL, NULL, NULL, 'yes', 'yes', 'no', 'no', NULL, 4, NULL, 'No', 'No', NULL, NULL, NULL, 0, 0, '2016-11-10 18:26:04'),
(100, '::1', 'Aditya Artemio', 'aditya-artemio', '$2y$08$Ajyjvbu/ebtQ1fIM2z0GnO9GVV/rJa38YRVwiCd2sIKEPVw9JprTe', NULL, 'adityaa83@gma.com', '9f83d479690e1662ed442b095525f93c32dc5e2a', NULL, NULL, NULL, 1478782378, NULL, 1, 'Aditya', 'Artemio', NULL, 'Male', NULL, NULL, '7207757584', NULL, NULL, '', 0, '', 0, 'Months', NULL, '', 'None', '1', '1', '', 0, '', 0, 0, '', '', '', '', '0', 'no', NULL, '', '0.00', 'no', NULL, NULL, NULL, NULL, NULL, 'yes', 'yes', 'no', 'no', NULL, 4, NULL, 'No', 'No', NULL, NULL, NULL, 0, 0, '2016-11-10 18:25:54'),
(101, '::1', 'Shiloh Presley', 'shiloh-presley', '$2y$08$cA2PlJEvSlN46xMiuSEhC.kOwZyfEQegDcjFBx5cOkihUZhtkX3Zm', NULL, 'shilohp20@gma.com', '1be05022a807d3cb7d7ac088eadcadd8bbe1d691', NULL, NULL, NULL, 1478782970, NULL, 1, 'Shiloh', 'Presley', NULL, 'Male', NULL, NULL, '7207757584', NULL, NULL, '', 0, '', 0, 'Months', NULL, '', 'None', '1', '1', '', 0, '', 0, 0, '', '', '', '', '0', 'no', NULL, '', '0.00', 'no', NULL, NULL, NULL, NULL, NULL, 'yes', 'yes', 'no', 'no', NULL, 3, NULL, 'No', 'No', NULL, NULL, NULL, 0, 86, '2016-11-10 18:33:44'),
(102, '::1', 'Denver Cyncere', 'denver-cyncere', '$2y$08$0O.8MZX3sYfDoffuiI030.PMPOFTGVpEjZg0b2lLuuHYnUL8zIcBa', NULL, 'denverc73@gma.com', 'ed1c49861f121b1224e166d95cd6da1971cb2366', NULL, NULL, NULL, 1478837607, NULL, 1, 'Denver', 'Cyncere', NULL, 'Male', NULL, NULL, '7207757587', NULL, NULL, '', 0, '', 0, 'Months', NULL, '', 'None', '1', '1', '', 0, '', 0, 0, '', '', '', '', '0', 'no', NULL, '', '0.00', 'no', NULL, NULL, NULL, NULL, NULL, 'yes', 'yes', 'no', 'no', NULL, 3, NULL, 'No', 'No', NULL, NULL, NULL, 0, 87, '2016-11-11 09:44:06'),
(103, '::1', 'Kamren Kalon', 'kamren-kalon', '$2y$08$xhCwJoddRcsdNmYlreFdr./s6EPnCU70zxvDGwLUkPNSE/uKa1iCy', NULL, 'kamrenk18@gma.com', '03733515cca268ad8ad8a049046cba6bdc042aca', NULL, NULL, NULL, 1478838982, NULL, 1, 'Kamren', 'Kalon', NULL, 'Male', NULL, NULL, '7207757584', NULL, NULL, '', 0, '', 0, 'Months', NULL, '', 'None', '1', '1', '', 0, '', 0, 0, '', '', '', '', '0', 'no', NULL, '', '0.00', 'no', NULL, NULL, NULL, NULL, NULL, 'yes', 'yes', 'no', 'no', NULL, 3, NULL, 'No', 'No', NULL, NULL, NULL, 0, 88, '2016-11-11 10:06:55'),
(104, '10.0.0.15', 'Adiyya T', 'adiyya-t', '$2y$08$0vsTtxYUI3z.3uZtx6XO6epbRS3amfvboNFH4ky1oRisz8o35M17W', NULL, 'adiyya@gmail.com', 'd2286141cab63d10c0272082d91627e6aff42ee9', NULL, NULL, NULL, 1484628964, 1487566907, 1, 'Adiyya', 'T', NULL, 'Male', NULL, '91', '9866211858', NULL, NULL, '', 0, '', 0, 'Months', NULL, '', 'None', '1', '1', '', 0, '', 0, 0, '', '', '', '', '0', 'no', NULL, '', '0.00', 'no', NULL, NULL, '500045', NULL, NULL, 'yes', 'yes', 'no', 'yes', NULL, 2, 44, 'No', 'No', NULL, NULL, NULL, 2780, 0, '2017-02-03 15:47:38'),
(105, '10.0.0.18', 'Adiyya Tutor', 'adiyya-tutor', '$2y$08$Tnwt/31QKE.ES4leZp3hsOEncxRyME4PqFi/04aj1pBpg/LhYp81S', NULL, 'adiyyat@gmail.com', '75aeb2a38699e0dbdbe7fded9e972313efc30b31', NULL, NULL, NULL, 1486115635, 1486115689, 1, 'Adiyya', 'Tutor', NULL, 'Male', NULL, '91', '9866211858', NULL, NULL, '', 0, '', 0, 'Months', NULL, '', 'None', '1', '1', '', 0, '', 0, 1, '', '', '', '', '0', 'no', NULL, '', '0.00', 'no', NULL, NULL, '123654', NULL, NULL, 'yes', 'yes', 'no', 'yes', NULL, 3, NULL, 'No', 'No', NULL, NULL, NULL, 0, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `pre_users_certificates`
--

CREATE TABLE `pre_users_certificates` (
  `user_certificate_id` int(11) NOT NULL,
  `admin_certificate_id` varchar(20) NOT NULL,
  `user_id` varchar(11) NOT NULL,
  `admin_status` enum('Pending','Approved','Rejected') NOT NULL DEFAULT 'Pending',
  `certificate_type` enum('admin','other') DEFAULT NULL,
  `certificate_name` varchar(100) NOT NULL,
  `admin_naming_convention` varchar(100) NOT NULL DEFAULT '',
  `file_type` char(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pre_users_certificates`
--

INSERT INTO `pre_users_certificates` (`user_certificate_id`, `admin_certificate_id`, `user_id`, `admin_status`, `certificate_type`, `certificate_name`, `admin_naming_convention`, `file_type`) VALUES
(1, '3', '2', 'Approved', 'admin', '2_3.png', '', 'png'),
(2, '0', '2', 'Approved', 'other', '2_349085718_certificate-1275635_640.jpg', '', 'jpg'),
(3, '1', '7', 'Approved', 'admin', '7_1.png', '', 'png'),
(4, '4', '7', 'Approved', 'admin', '7_4.png', '', 'png'),
(5, '5', '7', 'Approved', 'admin', '7_5.png', '', 'png'),
(6, '2', '12', 'Approved', 'admin', '12_2.png', '', 'png'),
(7, '6', '12', 'Approved', 'admin', '12_6.png', '', 'png');

-- --------------------------------------------------------

--
-- Table structure for table `pre_users_education`
--

CREATE TABLE `pre_users_education` (
  `record_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `education_id` int(11) DEFAULT '0' COMMENT 'foreign key for ''term_id'' in ''pre_terms_data'' otehrwise ''0''',
  `other_title` varchar(256) DEFAULT NULL,
  `education_institute` varchar(512) DEFAULT NULL COMMENT 'It may be ''Institute'' or ''College'' or Univarsity',
  `education_address` varchar(512) DEFAULT NULL,
  `education_year` char(6) DEFAULT NULL,
  `record_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pre_users_experience`
--

CREATE TABLE `pre_users_experience` (
  `record_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `company` varchar(55) NOT NULL,
  `role` varchar(25) NOT NULL,
  `description` varchar(650) NOT NULL,
  `from_date` varchar(15) NOT NULL,
  `to_date` varchar(15) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pre_users_experience`
--

INSERT INTO `pre_users_experience` (`record_id`, `user_id`, `company`, `role`, `description`, `from_date`, `to_date`, `created_at`, `updated_at`) VALUES
(4, 68, 'Gowtham Engineering College', 'Lecturer', 'i have 10 years experience in teaching of software subjects', 'January 2006', 'April 2016', '2016-11-14 14:21:58', '2016-11-14 14:51:42'),
(5, 8, 'Infotech soft', 'developer', 'i have  4 years of experience in developing software applications', 'April 2012', 'May 2016', '2016-11-14 14:31:15', '2016-11-14 14:31:28'),
(6, 9, 'keshave reddy engineering college', 'Lecturer', 'Having 4 years of teaching experience in my sql,oracle,Testing,Dreamweaver,adobe photoshop.', 'February 2012', 'Present  ', '2016-11-14 14:33:21', '2016-11-14 14:33:21'),
(7, 10, 'Srinivas Engineering College', 'Lecturer', 'Hi, This is Bijou. I have 8 years of experience of tutoring in the field of education. I have done MCA and currently working with a reputed school. I am open to teach one-to-one or group classes.I own a conveyance and can teach at mentioned locations', 'January 2008', 'Present  ', '2016-11-14 14:38:01', '2016-11-14 14:38:01'),
(8, 11, 'Reddy\'s Engineering College', 'Lecturer', 'I am a Post Graduate with Engineering background with more than 6 years teaching experience in Maths and Physics. I am having expert command over the subjects from CBSE/ICSE/State/International syllabi.', 'Present 2016', 'January 2010', '2016-11-14 14:40:01', '2016-11-14 14:40:01'),
(9, 53, 'St John Engineering College', 'Lecturer', 'Having 2 years of real-time and teaching experience in AJAX, Bootstrap, Codeigniter, Drupal, HTML/CSS, HTML5, MongoDB, MySQL, PHP and WordPress. Good knowledge in Object oriented programming system. Possess excellent presentation skills. Completed Ma', 'Present 2016', 'August 2013', '2016-11-14 14:42:23', '2016-11-14 14:42:23'),
(10, 54, 'St John Engineering College', 'Assistant Professor', 'Having 5 years of teaching experience in C, C++, DBMS, Data Structures, Java and Javascript. Good knowledge in Digital systems and Computer architecture. Currently working as assistant professor in New yourk', 'Present 2016', 'October 2011', '2016-11-14 14:44:51', '2016-11-14 14:44:51'),
(11, 57, 'CBIT Engineering College', 'Lecturer', 'Having  2 year of teaching experience in Dreamweaver,  C, Computer fundamentals, English Grammar, HTML/CSS, HTML5, PHP and Mathematics. Good knowledge in Data types, Keywords, For, While, Do while, Nested for, Operators, Arrays, Functions and Pointer', 'Present 2016', 'March 2014', '2016-11-14 14:47:12', '2016-11-14 14:47:12'),
(12, 58, 'Software solutions', 'developer', 'aving 3  years of real-time and 1 year of teaching experience in Bootstrap, Codeigniter, Django, HTML/CSS, HTML5, Javascript, Jquery, MySQL, PHP and Python. Currently working as developer in an MNC. Proficient in designing and development of web appl', 'Present 2016', 'April 2013', '2016-11-14 14:50:04', '2016-11-14 14:50:04'),
(13, 7, 'CTS', 'Software Developer', 'I\'m working as a C++ and java developer. I have good knowledge on real time concepts.', 'March 2013', 'April 2016', '2016-11-24 13:26:50', '2016-11-24 13:33:34');

-- --------------------------------------------------------

--
-- Table structure for table `pre_users_groups`
--

CREATE TABLE `pre_users_groups` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` mediumint(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pre_users_groups`
--

INSERT INTO `pre_users_groups` (`id`, `user_id`, `group_id`) VALUES
(1, 1, 1),
(12, 2, 2),
(13, 3, 2),
(14, 4, 2),
(15, 5, 2),
(16, 6, 2),
(22, 7, 3),
(23, 8, 3),
(24, 9, 3),
(25, 10, 3),
(26, 11, 3),
(27, 12, 4),
(28, 13, 4),
(29, 14, 4),
(30, 15, 4),
(31, 16, 4),
(42, 25, 3),
(43, 26, 3),
(44, 23, 3),
(45, 24, 3),
(46, 17, 3),
(47, 18, 3),
(58, 19, 3),
(59, 20, 3),
(60, 21, 3),
(61, 22, 3),
(69, 37, 3),
(78, 42, 4),
(80, 52, 3),
(93, 43, 4),
(97, 67, 3),
(108, 38, 3),
(109, 39, 3),
(110, 40, 3),
(111, 41, 3),
(112, 53, 3),
(113, 54, 3),
(114, 55, 3),
(115, 56, 3),
(116, 57, 3),
(117, 58, 3),
(118, 59, 3),
(119, 60, 3),
(120, 61, 3),
(121, 62, 3),
(122, 63, 3),
(123, 64, 3),
(124, 65, 3),
(125, 66, 3),
(126, 68, 3),
(127, 69, 3),
(128, 70, 3),
(129, 71, 3),
(130, 72, 3),
(131, 73, 3),
(132, 74, 3),
(133, 75, 3),
(134, 76, 3),
(135, 77, 3),
(136, 44, 4),
(137, 45, 4),
(138, 46, 4),
(140, 78, 3),
(142, 79, 3),
(144, 80, 3),
(145, 47, 4),
(147, 81, 3),
(148, 48, 4),
(150, 82, 3),
(151, 49, 4),
(153, 83, 3),
(154, 50, 4),
(156, 84, 3),
(157, 51, 4),
(159, 85, 3),
(175, 100, 4),
(176, 99, 4),
(177, 98, 4),
(178, 97, 4),
(179, 96, 4),
(180, 95, 4),
(181, 94, 4),
(182, 93, 4),
(183, 92, 4),
(184, 91, 4),
(185, 90, 4),
(186, 89, 4),
(187, 88, 4),
(188, 87, 4),
(189, 86, 4),
(191, 101, 3),
(193, 102, 3),
(195, 103, 3),
(196, 27, 2),
(197, 28, 2),
(198, 29, 2),
(199, 30, 2),
(200, 31, 2),
(201, 32, 2),
(202, 33, 2),
(203, 34, 2),
(204, 35, 2),
(205, 36, 2),
(206, 104, 2),
(207, 105, 3);

-- --------------------------------------------------------

--
-- Table structure for table `pre_users_reviews`
--

CREATE TABLE `pre_users_reviews` (
  `review_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `reviewer_id` int(11) DEFAULT NULL,
  `reviewer_comments` text,
  `rating` tinyint(2) DEFAULT NULL,
  `appraval_status` enum('Pending','Approved','Rejected') DEFAULT 'Pending',
  `record_created` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pre_user_credit_transactions`
--

CREATE TABLE `pre_user_credit_transactions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `credits` int(11) NOT NULL,
  `per_credit_value` float NOT NULL DEFAULT '1',
  `action` enum('credited','debited') CHARACTER SET latin1 NOT NULL,
  `purpose` text NOT NULL,
  `date_of_action` datetime DEFAULT NULL,
  `reference_table` char(50) CHARACTER SET latin1 DEFAULT NULL,
  `reference_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pre_user_credit_transactions`
--

INSERT INTO `pre_user_credit_transactions` (`id`, `user_id`, `credits`, `per_credit_value`, `action`, `purpose`, `date_of_action`, `reference_table`, `reference_id`) VALUES
(1, 2, 500, 2, 'credited', 'Package "Premium-Student" subscription', '2016-11-09 10:24:39', 'subscriptions', 1),
(2, 2, 50, 2, 'debited', 'Slot booked with the Tutor "bhavya-ezmay" and Booking Id is 1', '2016-11-09 10:31:01', 'bookings', 1),
(3, 2, 150, 2, 'debited', 'Slot booked with the Tutor "bijou-kaybrie" and Booking Id is 2', '2016-11-09 10:31:48', 'bookings', 2),
(4, 2, 500, 2, 'credited', 'Package "Premium-Student" subscription', '2016-11-09 18:10:58', 'subscriptions', 2),
(5, 3, 500, 2, 'credited', 'Package "Premium-Student" subscription', '2016-11-09 18:13:05', 'subscriptions', 3),
(6, 3, 250, 2, 'debited', 'Slot booked with the Tutor "behati-corinn" and Booking Id is 3', '2016-11-09 18:14:24', 'bookings', 3),
(7, 3, 120, 2, 'debited', 'Slot booked with the Tutor "bhavya-ezmay" and Booking Id is 4', '2016-11-09 18:15:18', 'bookings', 4),
(8, 4, 600, 2, 'credited', 'Package "General Package" subscription', '2016-11-09 18:16:33', 'subscriptions', 4),
(9, 4, 150, 2, 'debited', 'Slot booked with the Tutor "bijou-kaybrie" and Booking Id is 5', '2016-11-09 18:17:14', 'bookings', 5),
(10, 4, 400, 2, 'debited', 'Enrolled in the batch "DREMWEAVER - DR" for the course "Dreamweaver" offered by the isntitute "bayler-liera"', '2016-11-09 18:17:38', 'inst_enrolled_students', 1),
(11, 5, 600, 2, 'credited', 'Package "General Package" subscription', '2016-11-09 18:20:14', 'subscriptions', 5),
(12, 5, 200, 2, 'debited', 'Enrolled in the batch "Msoffice - MS" for the course "Microsoft Excel" offered by the isntitute "behati-corinn-1"', '2016-11-09 18:20:56', 'inst_enrolled_students', 2),
(13, 6, 600, 2, 'credited', 'Package "General Package" subscription', '2016-11-09 18:22:33', 'subscriptions', 6),
(14, 6, 300, 2, 'debited', 'Enrolled in the batch "DotNet - DNET" for the course "C#(Sharp)" offered by the isntitute "behati-corinn-1"', '2016-11-09 18:23:03', 'inst_enrolled_students', 3),
(15, 6, 600, 2, 'credited', 'Package "General Package" subscription', '2016-11-09 18:24:25', 'subscriptions', 7),
(16, 3, 120, 2, 'credited', 'Slot booked with the Tutor "Bhavya Ezmay" has cancelled before course started', '2016-11-10 09:51:29', 'bookings', 4),
(17, 2, 150, 2, 'credited', 'Slot booked with the Tutor "Bijou Kaybrie" has cancelled before course started', '2016-11-10 09:55:52', 'bookings', 2),
(18, 68, 1000, 2, 'credited', 'Package "Gold-Tutor" subscription', '2016-11-10 16:00:21', 'subscriptions', 8),
(19, 3, 1000, 2, 'credited', 'Package "Gold-Student" subscription', '2016-11-11 09:56:33', 'subscriptions', 9),
(20, 3, 250, 2, 'debited', 'Slot booked with the Tutor "behati-corinn" and Booking Id is 6', '2016-11-11 09:58:00', 'bookings', 6),
(21, 3, 50, 2, 'debited', 'Slot booked with the Tutor "behati-corinn" and Booking Id is 7', '2016-11-11 10:02:48', 'bookings', 7),
(22, 7, 45, 2, 'credited', 'Credits added for the booking "7" ', '2016-11-11 10:10:42', 'bookings', 7),
(23, 3, 150, 2, 'debited', 'Slot booked with the Tutor "behati-corinn" and Booking Id is 8', '2016-11-11 10:18:05', 'bookings', 8),
(24, 7, 135, 2, 'credited', 'Credits added for the booking "8" ', '2016-11-11 10:20:49', 'bookings', 8),
(25, 7, 1000, 2, 'credited', 'Package "Gold-Tutor" subscription', '2016-11-11 10:26:49', 'subscriptions', 10),
(26, 7, 1000, 2, 'credited', 'Package "Gold-Tutor" subscription', '2016-11-11 10:27:56', 'subscriptions', 11),
(27, 3, 600, 2, 'debited', 'Slot booked with the Tutor "augustine-alondra" and Booking Id is 9', '2016-11-11 10:29:33', 'bookings', 9),
(28, 68, 540, 2, 'credited', 'Credits added for the booking "9" ', '2016-11-11 10:34:30', 'bookings', 9),
(29, 68, 600, 2, 'credited', 'Package "General Package" subscription', '2016-11-11 10:41:17', 'subscriptions', 12),
(30, 3, 600, 2, 'credited', 'Package "General Package" subscription', '2016-11-11 10:43:48', 'subscriptions', 13),
(31, 3, 600, 2, 'debited', 'Slot booked with the Tutor "augustine-alondra" and Booking Id is 10', '2016-11-11 10:44:26', 'bookings', 10),
(32, 3, 200, 2, 'debited', 'Slot booked with the Tutor "berit-jaleiah" and Booking Id is 11', '2016-11-11 10:51:51', 'bookings', 11),
(33, 13, 1000, 2, 'credited', 'Package "Gold-Inst" subscription', '2016-11-11 10:54:51', 'subscriptions', 14),
(34, 13, 1000, 2, 'credited', 'Package "Gold-Inst" subscription', '2016-11-11 10:55:32', 'subscriptions', 15),
(35, 3, 1000, 2, 'credited', 'Package "Gold-Student" subscription', '2016-11-11 10:57:21', 'subscriptions', 16),
(36, 3, 1000, 2, 'credited', 'Package "Gold-Student" subscription', '2016-11-11 10:58:11', 'subscriptions', 17),
(37, 3, 250, 2, 'debited', 'Slot booked with the Tutor "gordon-nooh" and Booking Id is 12', '2016-11-11 10:59:14', 'bookings', 12),
(38, 3, 70, 2, 'debited', 'Slot booked with the Tutor "behati-corinn" and Booking Id is 13', '2016-11-11 11:11:04', 'bookings', 13),
(39, 3, 150, 2, 'debited', 'Slot booked with the Tutor "behati-corinn" and Booking Id is 14', '2016-11-11 11:13:48', 'bookings', 14),
(40, 3, 300, 2, 'debited', 'Slot booked with the Tutor "behati-corinn" and Booking Id is 15', '2016-11-11 11:15:32', 'bookings', 15),
(41, 3, 40, 2, 'debited', 'Slot booked with the Tutor "behati-corinn" and Booking Id is 16', '2016-11-11 11:17:40', 'bookings', 16),
(42, 3, 130, 2, 'debited', 'Slot booked with the Tutor "behati-corinn" and Booking Id is 17', '2016-11-11 11:19:52', 'bookings', 17),
(43, 3, 50, 2, 'debited', 'Slot booked with the Tutor "behati-corinn" and Booking Id is 18', '2016-11-11 11:22:00', 'bookings', 18),
(44, 3, 150, 2, 'debited', 'Slot booked with the Tutor "behati-corinn" and Booking Id is 19', '2016-11-11 11:23:39', 'bookings', 19),
(45, 3, 40, 2, 'debited', 'Slot booked with the Tutor "behati-corinn" and Booking Id is 20', '2016-11-11 11:25:36', 'bookings', 20),
(46, 3, 600, 2, 'debited', 'Slot booked with the Tutor "behati-corinn" and Booking Id is 21', '2016-11-11 11:36:02', 'bookings', 21),
(47, 3, 50, 2, 'debited', 'Slot booked with the Tutor "behati-corinn" and Booking Id is 22', '2016-11-11 11:36:27', 'bookings', 22),
(48, 3, 1000, 2, 'credited', 'Package "Gold-Student" subscription', '2016-11-11 11:37:44', 'subscriptions', 18),
(49, 3, 1000, 2, 'credited', 'Package "Gold-Student" subscription', '2016-11-11 11:38:42', 'subscriptions', 19),
(50, 3, 30, 2, 'debited', 'Slot booked with the Tutor "behati-corinn" and Booking Id is 23', '2016-11-11 11:38:43', 'bookings', 23),
(51, 3, 30, 2, 'debited', 'Slot booked with the Tutor "behati-corinn" and Booking Id is 24', '2016-11-11 11:40:04', 'bookings', 24),
(52, 7, 3000, 2, 'credited', 'Package "Gold-Tutor" subscription', '2016-11-11 11:43:35', 'subscriptions', 20),
(53, 3, 200, 2, 'debited', 'Slot booked with the Tutor "berit-jaleiah" and Booking Id is 25', '2016-11-11 11:45:36', 'bookings', 25),
(54, 3, 3000, 2, 'credited', 'Package "Gold-Student" subscription', '2016-11-11 11:46:13', 'subscriptions', 21),
(55, 3, 3000, 2, 'credited', 'Package "Gold-Student" subscription', '2016-11-11 11:46:54', 'subscriptions', 22),
(56, 3, 200, 2, 'debited', 'Slot booked with the Tutor "berit-jaleiah" and Booking Id is 26', '2016-11-11 11:47:00', 'bookings', 26),
(57, 3, 130, 2, 'debited', 'Slot booked with the Tutor "behati-corinn" and Booking Id is 27', '2016-11-11 11:51:36', 'bookings', 27),
(58, 3, 1500, 2, 'debited', 'Slot booked with the Tutor "behati-corinn" and Booking Id is 28', '2016-11-11 11:52:05', 'bookings', 28),
(59, 3, 1500, 2, 'debited', 'Slot booked with the Tutor "behati-corinn" and Booking Id is 29', '2016-11-11 11:52:27', 'bookings', 29),
(60, 3, 300, 2, 'debited', 'Slot booked with the Tutor "behati-corinn" and Booking Id is 30', '2016-11-11 11:52:55', 'bookings', 30),
(61, 3, 60, 2, 'debited', 'Slot booked with the Tutor "behati-corinn" and Booking Id is 31', '2016-11-11 11:53:35', 'bookings', 31),
(62, 3, 170, 2, 'debited', 'Slot booked with the Tutor "behati-corinn" and Booking Id is 32', '2016-11-11 11:54:10', 'bookings', 32),
(63, 3, 70, 2, 'debited', 'Slot booked with the Tutor "behati-corinn" and Booking Id is 33', '2016-11-11 11:56:28', 'bookings', 33),
(64, 3, 60, 2, 'debited', 'Slot booked with the Tutor "behati-corinn" and Booking Id is 34', '2016-11-11 11:57:49', 'bookings', 34),
(65, 3, 30, 2, 'debited', 'Slot booked with the Tutor "behati-corinn" and Booking Id is 35', '2016-11-11 11:58:22', 'bookings', 35),
(66, 3, 250, 2, 'debited', 'Enrolled in the batch ".Net - .Net" for the course "C#(Sharp)" offered by the isntitute "bebe-esmie"', '2016-11-11 12:05:09', 'inst_enrolled_students', 4),
(67, 3, 430, 2, 'debited', 'Enrolled in the batch "QA - QA" for the course "Software Quality&Testing" offered by the isntitute "bebe-esmie"', '2016-11-11 12:05:47', 'inst_enrolled_students', 5),
(68, 3, 500, 2, 'debited', 'Enrolled in the batch "Biology - BGY" for the course "Biology" offered by the isntitute "bebe-esmie"', '2016-11-11 12:08:10', 'inst_enrolled_students', 6),
(69, 3, 600, 2, 'debited', 'Enrolled in the batch "Competitive Exam - CE" for the course "ACT Exam" offered by the isntitute "bebe-esmie"', '2016-11-11 12:08:56', 'inst_enrolled_students', 7),
(70, 3, 1000, 2, 'debited', 'Enrolled in the batch "Company Law - CPL" for the course "Company Laws" offered by the isntitute "bebe-esmie"', '2016-11-11 12:09:51', 'inst_enrolled_students', 8),
(71, 3, 400, 2, 'debited', 'Enrolled in the batch "MS OFFICE - MS OFFICE" for the course "Computer" offered by the isntitute "bebe-esmie"', '2016-11-11 12:10:57', 'inst_enrolled_students', 9),
(72, 3, 250, 2, 'credited', 'Slot booked with the Tutor "Behati Corinn" has cancelled before course started', '2016-11-11 12:26:57', 'bookings', 6),
(73, 3, 130, 2, 'credited', 'Slot booked with the Tutor "Behati Corinn" has cancelled before course started', '2016-11-11 12:28:45', 'bookings', 27),
(74, 7, 5, 2, 'debited', 'For viewing lead  "Need Java Tutor with Excellent knowledge on java concepts" Of Student "Azani Nathalya"', '2016-11-11 12:39:03', 'student_leads', 16),
(75, 3, 10, 2, 'credited', 'Credits refunded by Admin for the booking id "11" ', '2016-11-11 12:52:21', 'bookings', 11),
(76, 8, 8, 2, 'credited', 'Credits refunded by Admin for the booking id "11" ', '2016-11-11 12:52:21', 'bookings', 11),
(77, 3, 5, 2, 'credited', 'Credits refunded by Admin for the booking id "28" ', '2016-11-11 12:52:38', 'bookings', 28),
(78, 7, 5, 2, 'credited', 'Credits refunded by Admin for the booking id "28" ', '2016-11-11 12:52:38', 'bookings', 28),
(79, 7, 135, 2, 'credited', 'Credits added for the booking "19" ', '2016-11-11 12:54:24', 'bookings', 19),
(80, 7, 45, 2, 'debited', 'For Credits to Money Conversion with status "Done" ', '2016-11-11 12:55:53', 'admin_money_transactions', 1),
(81, 8, 5, 2, 'debited', 'For viewing lead  "Need Java Tutor with Excellent knowledge on java concepts" Of Student "Azani Nathalya"', '2016-11-11 14:14:08', 'student_leads', 16),
(82, 7, 5, 2, 'debited', 'For viewing lead  "looking for a tutor in Chemistry" Of Student "Baeleigh Elmina"', '2016-11-11 18:19:55', 'student_leads', 15),
(83, 32, 3000, 2, 'credited', 'Package "Gold-Student" subscription', '2016-11-14 11:56:00', 'subscriptions', 23),
(84, 32, 430, 2, 'debited', 'Enrolled in the batch "QA - QA" for the course "Software Quality&Testing" offered by the isntitute "bebe-esmie"', '2016-11-14 11:56:36', 'inst_enrolled_students', 10),
(85, 32, 280, 2, 'debited', 'Enrolled in the batch "Bank - bank" for the course "Bank PO" offered by the isntitute "bebe-esmie"', '2016-11-14 11:57:41', 'inst_enrolled_students', 11),
(86, 33, 3000, 2, 'credited', 'Package "Gold-Student" subscription', '2016-11-14 12:04:16', 'subscriptions', 24),
(87, 33, 430, 2, 'debited', 'Enrolled in the batch "QA - QA" for the course "Software Quality&Testing" offered by the isntitute "bebe-esmie"', '2016-11-14 12:05:00', 'inst_enrolled_students', 12),
(88, 33, 280, 2, 'debited', 'Enrolled in the batch "Bank - bank" for the course "Bank PO" offered by the isntitute "bebe-esmie"', '2016-11-14 12:05:47', 'inst_enrolled_students', 13),
(89, 34, 3000, 2, 'credited', 'Package "Gold-Student" subscription', '2016-11-14 12:09:54', 'subscriptions', 25),
(90, 34, 430, 2, 'debited', 'Enrolled in the batch "QA - QA" for the course "Software Quality&Testing" offered by the isntitute "bebe-esmie"', '2016-11-14 12:10:56', 'inst_enrolled_students', 14),
(91, 34, 280, 2, 'debited', 'Enrolled in the batch "Bank - bank" for the course "Bank PO" offered by the isntitute "bebe-esmie"', '2016-11-14 12:11:53', 'inst_enrolled_students', 15),
(92, 3, 280, 2, 'debited', 'Enrolled in the batch "Bank - bank" for the course "Bank PO" offered by the isntitute "bebe-esmie"', '2016-11-14 12:14:34', 'inst_enrolled_students', 16),
(93, 13, 1008, 2, 'debited', 'For Credits to Money Conversion with status "Done" ', '2016-11-14 15:31:27', 'admin_money_transactions', 4),
(94, 29, 600, 2, 'credited', 'Package "General Package" subscription', '2016-11-21 12:35:07', 'subscriptions', 26),
(95, 32, 200, 2, 'debited', 'Slot booked with the Tutor "bhavya-ezmay" and Booking Id is 36', '2016-11-22 10:18:09', 'bookings', 36),
(96, 9, 180, 2, 'credited', 'Credits added for the booking "36" ', '2016-11-22 10:20:01', 'bookings', 36),
(97, 7, 4, 2, 'debited', 'For Credits to Money Conversion with status "Done" ', '2016-11-23 15:11:56', 'admin_money_transactions', 2),
(98, 3, 200, 2, 'credited', 'Slot booked with the Tutor "Berit Jaleiah" has cancelled before course started', '2016-11-23 16:18:55', 'bookings', 26),
(99, 7, 5, 2, 'debited', 'For viewing lead  "Looking for PHP Tutor" Of Student "Mahia Cayslee"', '2016-11-24 10:05:11', 'student_leads', 52),
(100, 13, 5, 2, 'debited', 'For viewing lead  "Looking for PHP Tutor" Of Student "Mahia Cayslee"', '2016-11-24 10:11:40', 'student_leads', 52),
(101, 9, 5, 2, 'debited', 'For viewing lead  "Looking for PHP Tutor" Of Student "Mahia Cayslee"', '2016-11-24 14:25:51', 'student_leads', 52),
(102, 104, 500, 2, 'credited', 'Package "Premium-Student" subscription', '2017-01-17 19:16:33', 'subscriptions', 27),
(103, 104, 600, 2, 'credited', 'Package "General Package" subscription', '2017-01-18 10:04:02', 'subscriptions', 28),
(104, 104, 100, 2, 'credited', 'Package "Silver-Student" subscription', '2017-01-18 10:10:08', 'subscriptions', 29),
(105, 104, 100, 2, 'credited', 'Package "Silver-Student" subscription', '2017-01-18 10:10:32', 'subscriptions', 30),
(106, 104, 100, 2, 'credited', 'Package "Silver-Student" subscription', '2017-01-18 10:24:10', 'subscriptions', 31),
(107, 104, 300, 2, 'credited', 'Package "Basic Package" subscription', '2017-01-19 15:45:22', 'subscriptions', 33),
(108, 104, 100, 2, 'credited', 'Package "Silver-Student" subscription', '2017-01-19 19:42:58', 'subscriptions', 34),
(109, 104, 100, 2, 'credited', 'Package "Silver-Student" subscription', '2017-01-19 19:44:52', 'subscriptions', 35),
(110, 104, 100, 2, 'credited', 'Package "Silver-Student" subscription', '2017-01-19 19:45:45', 'subscriptions', 36),
(111, 104, 100, 2, 'credited', 'Package "Silver-Student" subscription', '2017-01-19 19:46:35', 'subscriptions', 37),
(112, 104, 100, 2, 'credited', 'Package "Silver-Student" subscription', '2017-01-19 19:47:03', 'subscriptions', 38),
(113, 104, 100, 2, 'credited', 'Package "Silver-Student" subscription', '2017-01-19 19:47:35', 'subscriptions', 39),
(114, 104, 100, 2, 'credited', 'Package "Silver-Student" subscription', '2017-01-31 19:50:12', 'subscriptions', 40),
(115, 104, 100, 2, 'credited', 'Package "Silver-Student" subscription', '2017-01-31 19:51:36', 'subscriptions', 41),
(116, 104, 100, 2, 'credited', 'Package "Silver-Student" subscription', '2017-01-31 19:54:22', 'subscriptions', 42),
(117, 104, 100, 2, 'credited', 'Package "Silver-Student" subscription', '2017-01-31 19:54:37', 'subscriptions', 43),
(118, 104, 100, 2, 'credited', 'Package "Silver-Student" subscription', '2017-01-31 19:56:54', 'subscriptions', 44),
(119, 104, 20, 2, 'debited', 'Slot booked with the Tutor "adiyya-tutor" and Booking Id is 37', '2017-02-03 15:47:38', 'bookings', 37),
(120, 3, 40, 2, 'debited', 'Slot booked with the Tutor "behati-corinn" and Booking Id is 38', '2017-02-16 18:33:48', 'bookings', 38),
(121, 3, 600, 2, 'credited', 'Package "General Package" subscription', '2017-02-17 16:28:44', 'subscriptions', 47),
(122, 3, 3000, 2, 'credited', 'Package "Gold-Student" subscription', '2017-02-17 16:34:31', 'subscriptions', 46),
(123, 3, 500, 2, 'credited', 'Package "Premium-Student" subscription', '2017-02-17 16:37:44', 'subscriptions', 48),
(124, 3, 300, 2, 'credited', 'Package "Basic Package" subscription', '2017-02-17 16:44:29', 'subscriptions', 49),
(125, 3, 600, 2, 'credited', 'Package "General Package" subscription', '2017-02-17 16:53:20', 'subscriptions', 50),
(126, 3, 500, 2, 'credited', 'Package "Premium-Student" subscription', '2017-02-17 17:00:17', 'subscriptions', 51),
(127, 3, 500, 2, 'credited', 'Package "Premium-Student" subscription', '2017-02-17 17:03:06', 'subscriptions', 52),
(128, 3, 500, 2, 'credited', 'Package "Premium-Student" subscription', '2017-02-17 17:03:13', 'subscriptions', 53),
(129, 3, 500, 2, 'credited', 'Package "Premium-Student" subscription', '2017-02-17 17:03:16', 'subscriptions', 54),
(130, 3, 500, 2, 'credited', 'Package "Premium-Student" subscription', '2017-02-17 17:04:08', 'subscriptions', 55),
(131, 7, 1000, 2, 'credited', 'Package "Gold-Tutor" subscription', '2017-02-17 17:10:52', 'subscriptions', 58),
(132, 7, 600, 2, 'credited', 'Package "General Package" subscription', '2017-02-17 17:13:55', 'subscriptions', 59),
(133, 3, 300, 2, 'credited', 'Package "Basic Package" subscription', '2017-02-21 13:07:50', 'subscriptions', 60),
(134, 3, 100, 2, 'credited', 'Package "Silver-Student" subscription', '2017-02-21 17:24:04', 'subscriptions', 61),
(135, 3, 100, 2, 'credited', 'Package "Silver-Student" subscription', '2017-02-21 17:28:07', 'subscriptions', 62),
(136, 3, 100, 2, 'credited', 'Package "Silver-Student" subscription', '2017-02-23 15:33:52', 'subscriptions', 63),
(137, 3, 100, 2, 'credited', 'Package "Silver-Student" subscription', '2017-02-23 15:35:26', 'subscriptions', 64),
(138, 2, 1, 2, 'debited', 'For Sending Message To Tutor "bhavya-ezmay" ', '2017-02-24 18:27:41', 'messages', 1);

-- --------------------------------------------------------

--
-- Table structure for table `pre_user_status_texts`
--

CREATE TABLE `pre_user_status_texts` (
  `value` tinyint(1) NOT NULL,
  `text` varchar(25) CHARACTER SET utf8 NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pre_webmoney_data`
--

CREATE TABLE `pre_webmoney_data` (
  `id` int(11) NOT NULL,
  `data` text,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pre_yesno_status_texts`
--

CREATE TABLE `pre_yesno_status_texts` (
  `value` tinyint(1) NOT NULL,
  `text` varchar(20) CHARACTER SET utf8 NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `pre_admin_money_transactions`
--
ALTER TABLE `pre_admin_money_transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pre_bookings`
--
ALTER TABLE `pre_bookings`
  ADD PRIMARY KEY (`booking_id`);

--
-- Indexes for table `pre_categories`
--
ALTER TABLE `pre_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pre_certificates`
--
ALTER TABLE `pre_certificates`
  ADD PRIMARY KEY (`certificate_id`),
  ADD UNIQUE KEY `title` (`title`);

--
-- Indexes for table `pre_country`
--
ALTER TABLE `pre_country`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pre_course_categories`
--
ALTER TABLE `pre_course_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pre_course_downloads`
--
ALTER TABLE `pre_course_downloads`
  ADD PRIMARY KEY (`cd_id`);

--
-- Indexes for table `pre_course_purchases`
--
ALTER TABLE `pre_course_purchases`
  ADD PRIMARY KEY (`purchase_id`);

--
-- Indexes for table `pre_email_templates`
--
ALTER TABLE `pre_email_templates`
  ADD PRIMARY KEY (`email_template_id`);

--
-- Indexes for table `pre_faqs`
--
ALTER TABLE `pre_faqs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pre_gallery`
--
ALTER TABLE `pre_gallery`
  ADD PRIMARY KEY (`image_id`);

--
-- Indexes for table `pre_groups`
--
ALTER TABLE `pre_groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pre_inst_batches`
--
ALTER TABLE `pre_inst_batches`
  ADD PRIMARY KEY (`batch_id`);

--
-- Indexes for table `pre_inst_enrolled_students`
--
ALTER TABLE `pre_inst_enrolled_students`
  ADD PRIMARY KEY (`enroll_id`);

--
-- Indexes for table `pre_inst_locations`
--
ALTER TABLE `pre_inst_locations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pre_inst_offered_courses`
--
ALTER TABLE `pre_inst_offered_courses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pre_inst_teaching_types`
--
ALTER TABLE `pre_inst_teaching_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pre_languages`
--
ALTER TABLE `pre_languages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pre_languagewords`
--
ALTER TABLE `pre_languagewords`
  ADD PRIMARY KEY (`lang_id`);

--
-- Indexes for table `pre_locations`
--
ALTER TABLE `pre_locations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pre_login_attempts`
--
ALTER TABLE `pre_login_attempts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pre_messages`
--
ALTER TABLE `pre_messages`
  ADD PRIMARY KEY (`message_id`);

--
-- Indexes for table `pre_newsletter_subscriptions`
--
ALTER TABLE `pre_newsletter_subscriptions`
  ADD PRIMARY KEY (`subscription_id`);

--
-- Indexes for table `pre_packages`
--
ALTER TABLE `pre_packages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pre_pages`
--
ALTER TABLE `pre_pages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pre_payments_data`
--
ALTER TABLE `pre_payments_data`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pre_scroll_news`
--
ALTER TABLE `pre_scroll_news`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pre_sections`
--
ALTER TABLE `pre_sections`
  ADD PRIMARY KEY (`section_id`);

--
-- Indexes for table `pre_seosettings`
--
ALTER TABLE `pre_seosettings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pre_sessions`
--
ALTER TABLE `pre_sessions`
  ADD KEY `ci_sessions_timestamp` (`timestamp`);

--
-- Indexes for table `pre_sitetestimonials`
--
ALTER TABLE `pre_sitetestimonials`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pre_student_leads`
--
ALTER TABLE `pre_student_leads`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pre_student_locations`
--
ALTER TABLE `pre_student_locations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pre_student_prefferd_teaching_types`
--
ALTER TABLE `pre_student_prefferd_teaching_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pre_student_preffered_courses`
--
ALTER TABLE `pre_student_preffered_courses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pre_subscriptions`
--
ALTER TABLE `pre_subscriptions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pre_system_settings_fields`
--
ALTER TABLE `pre_system_settings_fields`
  ADD PRIMARY KEY (`field_id`);

--
-- Indexes for table `pre_system_settings_types`
--
ALTER TABLE `pre_system_settings_types`
  ADD PRIMARY KEY (`type_id`);

--
-- Indexes for table `pre_teaching_types`
--
ALTER TABLE `pre_teaching_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pre_team`
--
ALTER TABLE `pre_team`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pre_terms_data`
--
ALTER TABLE `pre_terms_data`
  ADD PRIMARY KEY (`term_id`);

--
-- Indexes for table `pre_testimonials`
--
ALTER TABLE `pre_testimonials`
  ADD PRIMARY KEY (`testimony_id`);

--
-- Indexes for table `pre_tpay_data`
--
ALTER TABLE `pre_tpay_data`
  ADD KEY `id` (`id`);

--
-- Indexes for table `pre_tutor_courses`
--
ALTER TABLE `pre_tutor_courses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pre_tutor_locations`
--
ALTER TABLE `pre_tutor_locations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pre_tutor_reviews`
--
ALTER TABLE `pre_tutor_reviews`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pre_tutor_selected_types`
--
ALTER TABLE `pre_tutor_selected_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pre_tutor_selling_courses`
--
ALTER TABLE `pre_tutor_selling_courses`
  ADD PRIMARY KEY (`sc_id`);

--
-- Indexes for table `pre_tutor_selling_courses_curriculum`
--
ALTER TABLE `pre_tutor_selling_courses_curriculum`
  ADD PRIMARY KEY (`file_id`);

--
-- Indexes for table `pre_tutor_teaching_types`
--
ALTER TABLE `pre_tutor_teaching_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pre_users`
--
ALTER TABLE `pre_users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pre_users_certificates`
--
ALTER TABLE `pre_users_certificates`
  ADD PRIMARY KEY (`user_certificate_id`);

--
-- Indexes for table `pre_users_education`
--
ALTER TABLE `pre_users_education`
  ADD PRIMARY KEY (`record_id`);

--
-- Indexes for table `pre_users_experience`
--
ALTER TABLE `pre_users_experience`
  ADD PRIMARY KEY (`record_id`);

--
-- Indexes for table `pre_users_groups`
--
ALTER TABLE `pre_users_groups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_user_id` (`user_id`),
  ADD KEY `fk_group_id` (`group_id`);

--
-- Indexes for table `pre_users_reviews`
--
ALTER TABLE `pre_users_reviews`
  ADD PRIMARY KEY (`review_id`);

--
-- Indexes for table `pre_user_credit_transactions`
--
ALTER TABLE `pre_user_credit_transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pre_user_status_texts`
--
ALTER TABLE `pre_user_status_texts`
  ADD PRIMARY KEY (`value`);

--
-- Indexes for table `pre_webmoney_data`
--
ALTER TABLE `pre_webmoney_data`
  ADD KEY `id` (`id`);

--
-- Indexes for table `pre_yesno_status_texts`
--
ALTER TABLE `pre_yesno_status_texts`
  ADD PRIMARY KEY (`value`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `pre_admin_money_transactions`
--
ALTER TABLE `pre_admin_money_transactions`
  MODIFY `id` int(25) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `pre_bookings`
--
ALTER TABLE `pre_bookings`
  MODIFY `booking_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;
--
-- AUTO_INCREMENT for table `pre_categories`
--
ALTER TABLE `pre_categories`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=158;
--
-- AUTO_INCREMENT for table `pre_certificates`
--
ALTER TABLE `pre_certificates`
  MODIFY `certificate_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `pre_country`
--
ALTER TABLE `pre_country`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=254;
--
-- AUTO_INCREMENT for table `pre_course_categories`
--
ALTER TABLE `pre_course_categories`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=307;
--
-- AUTO_INCREMENT for table `pre_course_downloads`
--
ALTER TABLE `pre_course_downloads`
  MODIFY `cd_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT for table `pre_course_purchases`
--
ALTER TABLE `pre_course_purchases`
  MODIFY `purchase_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `pre_email_templates`
--
ALTER TABLE `pre_email_templates`
  MODIFY `email_template_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT for table `pre_faqs`
--
ALTER TABLE `pre_faqs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `pre_gallery`
--
ALTER TABLE `pre_gallery`
  MODIFY `image_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
--
-- AUTO_INCREMENT for table `pre_groups`
--
ALTER TABLE `pre_groups`
  MODIFY `id` mediumint(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `pre_inst_batches`
--
ALTER TABLE `pre_inst_batches`
  MODIFY `batch_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;
--
-- AUTO_INCREMENT for table `pre_inst_enrolled_students`
--
ALTER TABLE `pre_inst_enrolled_students`
  MODIFY `enroll_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT for table `pre_inst_locations`
--
ALTER TABLE `pre_inst_locations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=903;
--
-- AUTO_INCREMENT for table `pre_inst_offered_courses`
--
ALTER TABLE `pre_inst_offered_courses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1186;
--
-- AUTO_INCREMENT for table `pre_inst_teaching_types`
--
ALTER TABLE `pre_inst_teaching_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;
--
-- AUTO_INCREMENT for table `pre_languages`
--
ALTER TABLE `pre_languages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
--
-- AUTO_INCREMENT for table `pre_languagewords`
--
ALTER TABLE `pre_languagewords`
  MODIFY `lang_id` bigint(22) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1244;
--
-- AUTO_INCREMENT for table `pre_locations`
--
ALTER TABLE `pre_locations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=112;
--
-- AUTO_INCREMENT for table `pre_login_attempts`
--
ALTER TABLE `pre_login_attempts`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `pre_messages`
--
ALTER TABLE `pre_messages`
  MODIFY `message_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `pre_newsletter_subscriptions`
--
ALTER TABLE `pre_newsletter_subscriptions`
  MODIFY `subscription_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pre_packages`
--
ALTER TABLE `pre_packages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `pre_pages`
--
ALTER TABLE `pre_pages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `pre_payments_data`
--
ALTER TABLE `pre_payments_data`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;
--
-- AUTO_INCREMENT for table `pre_scroll_news`
--
ALTER TABLE `pre_scroll_news`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `pre_sections`
--
ALTER TABLE `pre_sections`
  MODIFY `section_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `pre_seosettings`
--
ALTER TABLE `pre_seosettings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
--
-- AUTO_INCREMENT for table `pre_sitetestimonials`
--
ALTER TABLE `pre_sitetestimonials`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `pre_student_leads`
--
ALTER TABLE `pre_student_leads`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;
--
-- AUTO_INCREMENT for table `pre_student_locations`
--
ALTER TABLE `pre_student_locations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=409;
--
-- AUTO_INCREMENT for table `pre_student_prefferd_teaching_types`
--
ALTER TABLE `pre_student_prefferd_teaching_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;
--
-- AUTO_INCREMENT for table `pre_student_preffered_courses`
--
ALTER TABLE `pre_student_preffered_courses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=424;
--
-- AUTO_INCREMENT for table `pre_subscriptions`
--
ALTER TABLE `pre_subscriptions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;
--
-- AUTO_INCREMENT for table `pre_system_settings_fields`
--
ALTER TABLE `pre_system_settings_fields`
  MODIFY `field_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=199;
--
-- AUTO_INCREMENT for table `pre_system_settings_types`
--
ALTER TABLE `pre_system_settings_types`
  MODIFY `type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;
--
-- AUTO_INCREMENT for table `pre_teaching_types`
--
ALTER TABLE `pre_teaching_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `pre_team`
--
ALTER TABLE `pre_team`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `pre_terms_data`
--
ALTER TABLE `pre_terms_data`
  MODIFY `term_id` bigint(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `pre_testimonials`
--
ALTER TABLE `pre_testimonials`
  MODIFY `testimony_id` int(25) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pre_tpay_data`
--
ALTER TABLE `pre_tpay_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pre_tutor_courses`
--
ALTER TABLE `pre_tutor_courses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=100;
--
-- AUTO_INCREMENT for table `pre_tutor_locations`
--
ALTER TABLE `pre_tutor_locations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1351;
--
-- AUTO_INCREMENT for table `pre_tutor_reviews`
--
ALTER TABLE `pre_tutor_reviews`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `pre_tutor_selected_types`
--
ALTER TABLE `pre_tutor_selected_types`
  MODIFY `id` int(222) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pre_tutor_selling_courses`
--
ALTER TABLE `pre_tutor_selling_courses`
  MODIFY `sc_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;
--
-- AUTO_INCREMENT for table `pre_tutor_selling_courses_curriculum`
--
ALTER TABLE `pre_tutor_selling_courses_curriculum`
  MODIFY `file_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;
--
-- AUTO_INCREMENT for table `pre_tutor_teaching_types`
--
ALTER TABLE `pre_tutor_teaching_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;
--
-- AUTO_INCREMENT for table `pre_users`
--
ALTER TABLE `pre_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=106;
--
-- AUTO_INCREMENT for table `pre_users_certificates`
--
ALTER TABLE `pre_users_certificates`
  MODIFY `user_certificate_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `pre_users_education`
--
ALTER TABLE `pre_users_education`
  MODIFY `record_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pre_users_experience`
--
ALTER TABLE `pre_users_experience`
  MODIFY `record_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `pre_users_groups`
--
ALTER TABLE `pre_users_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=208;
--
-- AUTO_INCREMENT for table `pre_users_reviews`
--
ALTER TABLE `pre_users_reviews`
  MODIFY `review_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pre_user_credit_transactions`
--
ALTER TABLE `pre_user_credit_transactions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=139;
--
-- AUTO_INCREMENT for table `pre_webmoney_data`
--
ALTER TABLE `pre_webmoney_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `pre_users_groups`
--
ALTER TABLE `pre_users_groups`
  ADD CONSTRAINT `fk_group_id` FOREIGN KEY (`group_id`) REFERENCES `pre_groups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `pre_users` (`id`) ON DELETE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
