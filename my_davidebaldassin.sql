-- phpMyAdmin SQL Dump
-- version 4.1.7
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Mag 24, 2022 alle 08:19
-- Versione del server: 8.0.26
-- PHP Version: 5.6.40

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `my_davidebaldassin`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `avwp_commentmeta`
--

CREATE TABLE IF NOT EXISTS `avwp_commentmeta` (
  `meta_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `comment_id` bigint unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_520_ci,
  PRIMARY KEY (`meta_id`),
  KEY `comment_id` (`comment_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struttura della tabella `avwp_comments`
--

CREATE TABLE IF NOT EXISTS `avwp_comments` (
  `comment_ID` bigint unsigned NOT NULL AUTO_INCREMENT,
  `comment_post_ID` bigint unsigned NOT NULL DEFAULT '0',
  `comment_author` tinytext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `comment_author_email` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_author_url` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_author_IP` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_content` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `comment_karma` int NOT NULL DEFAULT '0',
  `comment_approved` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '1',
  `comment_agent` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_type` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'comment',
  `comment_parent` bigint unsigned NOT NULL DEFAULT '0',
  `user_id` bigint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`comment_ID`),
  KEY `comment_post_ID` (`comment_post_ID`),
  KEY `comment_approved_date_gmt` (`comment_approved`,`comment_date_gmt`),
  KEY `comment_date_gmt` (`comment_date_gmt`),
  KEY `comment_parent` (`comment_parent`),
  KEY `comment_author_email` (`comment_author_email`(10))
) ENGINE=MyISAM  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci AUTO_INCREMENT=2 ;

--
-- Dump dei dati per la tabella `avwp_comments`
--

INSERT INTO `avwp_comments` (`comment_ID`, `comment_post_ID`, `comment_author`, `comment_author_email`, `comment_author_url`, `comment_author_IP`, `comment_date`, `comment_date_gmt`, `comment_content`, `comment_karma`, `comment_approved`, `comment_agent`, `comment_type`, `comment_parent`, `user_id`) VALUES
(1, 1, 'Altervista', '', '', '', '2022-05-03 09:51:27', '2022-05-03 07:51:27', 'Ciao, questo è un commento.<br/>Per cancellare un commento fai il login e vai su "Commenti". Li troverai tutti i commenti e gli stumenti per moderarli.', 0, '1', '', 'comment', 0, 0);

-- --------------------------------------------------------

--
-- Struttura della tabella `avwp_links`
--

CREATE TABLE IF NOT EXISTS `avwp_links` (
  `link_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `link_url` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_name` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_image` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_target` varchar(25) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_description` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_visible` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'Y',
  `link_owner` bigint unsigned NOT NULL DEFAULT '1',
  `link_rating` int NOT NULL DEFAULT '0',
  `link_updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `link_rel` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_notes` mediumtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `link_rss` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`link_id`),
  KEY `link_visible` (`link_visible`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struttura della tabella `avwp_messages`
--

CREATE TABLE IF NOT EXISTS `avwp_messages` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `message_altervista_id` int unsigned NOT NULL,
  `message_type` set('0','1','2','3','4','5','6','7','8','9','10','11','12') COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `message_date` int unsigned NOT NULL DEFAULT '0',
  `no_delete` set('0','1') COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '0',
  `message_title` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `message_text` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `delay` int unsigned DEFAULT '0',
  `sync_operation` set('read','delete') COLLATE utf8mb4_unicode_520_ci DEFAULT '',
  `last_sync` int unsigned NOT NULL DEFAULT '0',
  `message_read_time` int unsigned NOT NULL DEFAULT '0',
  `metadata` text COLLATE utf8mb4_unicode_520_ci,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struttura della tabella `avwp_options`
--

CREATE TABLE IF NOT EXISTS `avwp_options` (
  `option_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `option_name` varchar(191) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `option_value` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `autoload` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'yes',
  PRIMARY KEY (`option_id`),
  UNIQUE KEY `option_name` (`option_name`),
  KEY `autoload` (`autoload`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci AUTO_INCREMENT=257 ;

--
-- Dump dei dati per la tabella `avwp_options`
--

INSERT INTO `avwp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(1, 'avopt_oauth_options', 'a:6:{s:12:"redirect_uri";s:38:"http://davidebaldassin.altervista.org/";s:12:"access_token";s:32:"6f6ad7217b82fc6cb11003f6d3bfe7d7";s:9:"client_id";s:25:"davidebaldassin_wordpress";s:11:"client_name";s:9:"wordpress";s:6:"secret";s:32:"ldlVzuc4NiXugm1NnmS4l5PHfcyCB5sM";s:13:"refresh_token";s:32:"e2ff108dbdecbb369e7f8e36a9af9c25";}', 'yes'),
(2, 'siteurl', 'https://davidebaldassin.altervista.org', 'yes'),
(3, 'home', 'https://davidebaldassin.altervista.org', 'yes'),
(4, 'blogname', 'Blog di davidebaldassin', 'yes'),
(5, 'blogdescription', 'Un nuovo sito targato WordPress', 'yes'),
(6, 'users_can_register', '0', 'yes'),
(7, 'admin_email', 'info.davidebaldassin@gmail.com', 'yes'),
(8, 'start_of_week', '1', 'yes'),
(9, 'use_balanceTags', '0', 'yes'),
(10, 'use_smilies', '1', 'yes'),
(11, 'require_name_email', '0', 'yes'),
(12, 'comments_notify', '0', 'yes'),
(13, 'posts_per_rss', '10', 'yes'),
(14, 'rss_use_excerpt', '0', 'yes'),
(15, 'mailserver_url', 'mail.example.com', 'yes'),
(16, 'mailserver_login', 'login@example.com', 'yes'),
(17, 'mailserver_pass', 'password', 'yes'),
(18, 'mailserver_port', '110', 'yes'),
(19, 'default_category', '1', 'yes'),
(20, 'default_comment_status', 'closed', 'yes'),
(21, 'default_ping_status', 'closed', 'yes'),
(22, 'default_pingback_flag', '0', 'yes'),
(23, 'posts_per_page', '10', 'yes'),
(24, 'date_format', 'j F Y', 'yes'),
(25, 'time_format', 'G:i', 'yes'),
(26, 'links_updated_date_format', 'j F Y G:i', 'yes'),
(27, 'comment_moderation', '0', 'yes'),
(28, 'moderation_notify', '0', 'yes'),
(29, 'permalink_structure', '/%postname%/', 'yes'),
(30, 'rewrite_rules', 'a:95:{s:11:"^wp-json/?$";s:22:"index.php?rest_route=/";s:14:"^wp-json/(.*)?";s:33:"index.php?rest_route=/$matches[1]";s:21:"^index.php/wp-json/?$";s:22:"index.php?rest_route=/";s:24:"^index.php/wp-json/(.*)?";s:33:"index.php?rest_route=/$matches[1]";s:17:"^wp-sitemap\\.xml$";s:23:"index.php?sitemap=index";s:17:"^wp-sitemap\\.xsl$";s:36:"index.php?sitemap-stylesheet=sitemap";s:23:"^wp-sitemap-index\\.xsl$";s:34:"index.php?sitemap-stylesheet=index";s:48:"^wp-sitemap-([a-z]+?)-([a-z\\d_-]+?)-(\\d+?)\\.xml$";s:75:"index.php?sitemap=$matches[1]&sitemap-subtype=$matches[2]&paged=$matches[3]";s:34:"^wp-sitemap-([a-z]+?)-(\\d+?)\\.xml$";s:47:"index.php?sitemap=$matches[1]&paged=$matches[2]";s:47:"category/(.+?)/feed/(feed|rdf|rss|rss2|atom)/?$";s:52:"index.php?category_name=$matches[1]&feed=$matches[2]";s:42:"category/(.+?)/(feed|rdf|rss|rss2|atom)/?$";s:52:"index.php?category_name=$matches[1]&feed=$matches[2]";s:23:"category/(.+?)/embed/?$";s:46:"index.php?category_name=$matches[1]&embed=true";s:35:"category/(.+?)/page/?([0-9]{1,})/?$";s:53:"index.php?category_name=$matches[1]&paged=$matches[2]";s:17:"category/(.+?)/?$";s:35:"index.php?category_name=$matches[1]";s:44:"tag/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:42:"index.php?tag=$matches[1]&feed=$matches[2]";s:39:"tag/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:42:"index.php?tag=$matches[1]&feed=$matches[2]";s:20:"tag/([^/]+)/embed/?$";s:36:"index.php?tag=$matches[1]&embed=true";s:32:"tag/([^/]+)/page/?([0-9]{1,})/?$";s:43:"index.php?tag=$matches[1]&paged=$matches[2]";s:14:"tag/([^/]+)/?$";s:25:"index.php?tag=$matches[1]";s:45:"type/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?post_format=$matches[1]&feed=$matches[2]";s:40:"type/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?post_format=$matches[1]&feed=$matches[2]";s:21:"type/([^/]+)/embed/?$";s:44:"index.php?post_format=$matches[1]&embed=true";s:33:"type/([^/]+)/page/?([0-9]{1,})/?$";s:51:"index.php?post_format=$matches[1]&paged=$matches[2]";s:15:"type/([^/]+)/?$";s:33:"index.php?post_format=$matches[1]";s:12:"robots\\.txt$";s:18:"index.php?robots=1";s:13:"favicon\\.ico$";s:19:"index.php?favicon=1";s:48:".*wp-(atom|rdf|rss|rss2|feed|commentsrss2)\\.php$";s:18:"index.php?feed=old";s:20:".*wp-app\\.php(/.*)?$";s:19:"index.php?error=403";s:18:".*wp-register.php$";s:23:"index.php?register=true";s:32:"feed/(feed|rdf|rss|rss2|atom)/?$";s:27:"index.php?&feed=$matches[1]";s:27:"(feed|rdf|rss|rss2|atom)/?$";s:27:"index.php?&feed=$matches[1]";s:8:"embed/?$";s:21:"index.php?&embed=true";s:20:"page/?([0-9]{1,})/?$";s:28:"index.php?&paged=$matches[1]";s:41:"comments/feed/(feed|rdf|rss|rss2|atom)/?$";s:42:"index.php?&feed=$matches[1]&withcomments=1";s:36:"comments/(feed|rdf|rss|rss2|atom)/?$";s:42:"index.php?&feed=$matches[1]&withcomments=1";s:17:"comments/embed/?$";s:21:"index.php?&embed=true";s:44:"search/(.+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:40:"index.php?s=$matches[1]&feed=$matches[2]";s:39:"search/(.+)/(feed|rdf|rss|rss2|atom)/?$";s:40:"index.php?s=$matches[1]&feed=$matches[2]";s:20:"search/(.+)/embed/?$";s:34:"index.php?s=$matches[1]&embed=true";s:32:"search/(.+)/page/?([0-9]{1,})/?$";s:41:"index.php?s=$matches[1]&paged=$matches[2]";s:14:"search/(.+)/?$";s:23:"index.php?s=$matches[1]";s:47:"author/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?author_name=$matches[1]&feed=$matches[2]";s:42:"author/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?author_name=$matches[1]&feed=$matches[2]";s:23:"author/([^/]+)/embed/?$";s:44:"index.php?author_name=$matches[1]&embed=true";s:35:"author/([^/]+)/page/?([0-9]{1,})/?$";s:51:"index.php?author_name=$matches[1]&paged=$matches[2]";s:17:"author/([^/]+)/?$";s:33:"index.php?author_name=$matches[1]";s:69:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$";s:80:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]";s:64:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$";s:80:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]";s:45:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/embed/?$";s:74:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&embed=true";s:57:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/page/?([0-9]{1,})/?$";s:81:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&paged=$matches[4]";s:39:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/?$";s:63:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]";s:56:"([0-9]{4})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$";s:64:"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]";s:51:"([0-9]{4})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$";s:64:"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]";s:32:"([0-9]{4})/([0-9]{1,2})/embed/?$";s:58:"index.php?year=$matches[1]&monthnum=$matches[2]&embed=true";s:44:"([0-9]{4})/([0-9]{1,2})/page/?([0-9]{1,})/?$";s:65:"index.php?year=$matches[1]&monthnum=$matches[2]&paged=$matches[3]";s:26:"([0-9]{4})/([0-9]{1,2})/?$";s:47:"index.php?year=$matches[1]&monthnum=$matches[2]";s:43:"([0-9]{4})/feed/(feed|rdf|rss|rss2|atom)/?$";s:43:"index.php?year=$matches[1]&feed=$matches[2]";s:38:"([0-9]{4})/(feed|rdf|rss|rss2|atom)/?$";s:43:"index.php?year=$matches[1]&feed=$matches[2]";s:19:"([0-9]{4})/embed/?$";s:37:"index.php?year=$matches[1]&embed=true";s:31:"([0-9]{4})/page/?([0-9]{1,})/?$";s:44:"index.php?year=$matches[1]&paged=$matches[2]";s:13:"([0-9]{4})/?$";s:26:"index.php?year=$matches[1]";s:27:".?.+?/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:37:".?.+?/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:57:".?.+?/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:52:".?.+?/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:52:".?.+?/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:33:".?.+?/attachment/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:16:"(.?.+?)/embed/?$";s:41:"index.php?pagename=$matches[1]&embed=true";s:20:"(.?.+?)/trackback/?$";s:35:"index.php?pagename=$matches[1]&tb=1";s:40:"(.?.+?)/feed/(feed|rdf|rss|rss2|atom)/?$";s:47:"index.php?pagename=$matches[1]&feed=$matches[2]";s:35:"(.?.+?)/(feed|rdf|rss|rss2|atom)/?$";s:47:"index.php?pagename=$matches[1]&feed=$matches[2]";s:28:"(.?.+?)/page/?([0-9]{1,})/?$";s:48:"index.php?pagename=$matches[1]&paged=$matches[2]";s:35:"(.?.+?)/comment-page-([0-9]{1,})/?$";s:48:"index.php?pagename=$matches[1]&cpage=$matches[2]";s:24:"(.?.+?)(?:/([0-9]+))?/?$";s:47:"index.php?pagename=$matches[1]&page=$matches[2]";s:27:"[^/]+/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:37:"[^/]+/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:57:"[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:52:"[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:52:"[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:33:"[^/]+/attachment/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:16:"([^/]+)/embed/?$";s:37:"index.php?name=$matches[1]&embed=true";s:20:"([^/]+)/trackback/?$";s:31:"index.php?name=$matches[1]&tb=1";s:40:"([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:43:"index.php?name=$matches[1]&feed=$matches[2]";s:35:"([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:43:"index.php?name=$matches[1]&feed=$matches[2]";s:28:"([^/]+)/page/?([0-9]{1,})/?$";s:44:"index.php?name=$matches[1]&paged=$matches[2]";s:35:"([^/]+)/comment-page-([0-9]{1,})/?$";s:44:"index.php?name=$matches[1]&cpage=$matches[2]";s:24:"([^/]+)/av_rl(/(.*))?/?$";s:44:"index.php?name=$matches[1]&av_rl=$matches[3]";s:22:"([^/]+)/amp(/(.*))?/?$";s:42:"index.php?name=$matches[1]&amp=$matches[3]";s:24:"([^/]+)(?:/([0-9]+))?/?$";s:43:"index.php?name=$matches[1]&page=$matches[2]";s:16:"[^/]+/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:26:"[^/]+/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:46:"[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:41:"[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:41:"[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:22:"[^/]+/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";}', 'yes'),
(31, 'hack_file', '0', 'yes'),
(32, 'blog_charset', 'UTF-8', 'yes'),
(33, 'moderation_keys', '', 'no'),
(34, 'active_plugins', 'a:2:{i:0;s:19:"akismet/akismet.php";i:1;s:24:"wordpress-seo/wp-seo.php";}', 'yes'),
(35, 'category_base', '', 'yes'),
(36, 'ping_sites', '', 'yes'),
(37, 'comment_max_links', '2', 'yes'),
(38, 'gmt_offset', '0', 'yes'),
(39, 'default_email_category', '1', 'yes'),
(40, 'recently_edited', '', 'no'),
(41, 'template', 'av-seamless-rene', 'yes'),
(42, 'stylesheet', 'av-seamless-rene', 'yes'),
(43, 'comment_registration', '0', 'yes'),
(44, 'html_type', 'text/html', 'yes'),
(45, 'use_trackback', '0', 'yes'),
(46, 'default_role', 'subscriber', 'yes'),
(47, 'db_version', '51917', 'yes'),
(48, 'uploads_use_yearmonth_folders', '1', 'yes'),
(49, 'upload_path', '', 'yes'),
(50, 'blog_public', '1', 'yes'),
(51, 'default_link_category', '2', 'yes'),
(52, 'show_on_front', 'posts', 'yes'),
(53, 'tag_base', '', 'yes'),
(54, 'show_avatars', '1', 'yes'),
(55, 'avatar_rating', 'G', 'yes'),
(56, 'upload_url_path', '', 'yes'),
(57, 'thumbnail_size_w', '150', 'yes'),
(58, 'thumbnail_size_h', '150', 'yes'),
(59, 'thumbnail_crop', '1', 'yes'),
(60, 'medium_size_w', '320', 'yes'),
(61, 'medium_size_h', '480', 'yes'),
(62, 'avatar_default', 'mystery', 'yes'),
(63, 'large_size_w', '960', 'yes'),
(64, 'large_size_h', '1440', 'yes'),
(65, 'image_default_link_type', 'none', 'yes'),
(66, 'image_default_size', '', 'yes'),
(67, 'image_default_align', '', 'yes'),
(68, 'close_comments_for_old_posts', '1', 'yes'),
(69, 'close_comments_days_old', '30', 'yes'),
(70, 'thread_comments', '1', 'yes'),
(71, 'thread_comments_depth', '5', 'yes'),
(72, 'page_comments', '0', 'yes'),
(73, 'comments_per_page', '50', 'yes'),
(74, 'default_comments_page', 'newest', 'yes'),
(75, 'comment_order', 'asc', 'yes'),
(76, 'sticky_posts', 'a:0:{}', 'yes'),
(77, 'widget_categories', 'a:0:{}', 'yes'),
(78, 'widget_text', 'a:0:{}', 'yes'),
(79, 'widget_rss', 'a:0:{}', 'yes'),
(80, 'uninstall_plugins', 'a:0:{}', 'no'),
(81, 'timezone_string', 'Europe/Rome', 'yes'),
(82, 'page_for_posts', '0', 'yes'),
(83, 'page_on_front', '0', 'yes'),
(84, 'default_post_format', '0', 'yes'),
(85, 'link_manager_enabled', '0', 'yes'),
(86, 'finished_splitting_shared_terms', '1', 'yes'),
(87, 'site_icon', '0', 'yes'),
(88, 'medium_large_size_w', '768', 'yes'),
(89, 'medium_large_size_h', '0', 'yes'),
(90, 'wp_page_for_privacy_policy', '0', 'yes'),
(91, 'show_comments_cookies_opt_in', '0', 'yes'),
(92, 'admin_email_lifespan', '1667116286', 'yes'),
(93, 'disallowed_keys', '', 'no'),
(94, 'comment_previously_approved', '1', 'yes'),
(95, 'auto_plugin_theme_update_emails', 'a:0:{}', 'no'),
(96, 'auto_update_core_dev', 'enabled', 'yes'),
(97, 'auto_update_core_minor', 'enabled', 'yes'),
(98, 'auto_update_core_major', 'enabled', 'yes'),
(99, 'wp_force_deactivated_plugins', 'a:0:{}', 'yes'),
(100, 'initial_db_version', '51917', 'yes'),
(101, 'WPLANG', 'it_IT', 'yes'),
(102, 'av_toolbar_enabled', '1', 'yes'),
(103, 'av_main_admin_login', 'davidebaldassin', 'yes'),
(104, 'avwp_user_roles', 'a:5:{s:13:"administrator";a:2:{s:4:"name";s:13:"Administrator";s:12:"capabilities";a:61:{s:13:"switch_themes";b:1;s:11:"edit_themes";b:1;s:16:"activate_plugins";b:1;s:12:"edit_plugins";b:1;s:10:"edit_users";b:1;s:10:"edit_files";b:1;s:14:"manage_options";b:1;s:17:"moderate_comments";b:1;s:17:"manage_categories";b:1;s:12:"manage_links";b:1;s:12:"upload_files";b:1;s:6:"import";b:1;s:15:"unfiltered_html";b:1;s:10:"edit_posts";b:1;s:17:"edit_others_posts";b:1;s:20:"edit_published_posts";b:1;s:13:"publish_posts";b:1;s:10:"edit_pages";b:1;s:4:"read";b:1;s:8:"level_10";b:1;s:7:"level_9";b:1;s:7:"level_8";b:1;s:7:"level_7";b:1;s:7:"level_6";b:1;s:7:"level_5";b:1;s:7:"level_4";b:1;s:7:"level_3";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:17:"edit_others_pages";b:1;s:20:"edit_published_pages";b:1;s:13:"publish_pages";b:1;s:12:"delete_pages";b:1;s:19:"delete_others_pages";b:1;s:22:"delete_published_pages";b:1;s:12:"delete_posts";b:1;s:19:"delete_others_posts";b:1;s:22:"delete_published_posts";b:1;s:20:"delete_private_posts";b:1;s:18:"edit_private_posts";b:1;s:18:"read_private_posts";b:1;s:20:"delete_private_pages";b:1;s:18:"edit_private_pages";b:1;s:18:"read_private_pages";b:1;s:12:"delete_users";b:1;s:12:"create_users";b:1;s:17:"unfiltered_upload";b:1;s:14:"edit_dashboard";b:1;s:14:"update_plugins";b:1;s:14:"delete_plugins";b:1;s:15:"install_plugins";b:1;s:13:"update_themes";b:1;s:14:"install_themes";b:1;s:11:"update_core";b:1;s:10:"list_users";b:1;s:12:"remove_users";b:1;s:13:"promote_users";b:1;s:18:"edit_theme_options";b:1;s:13:"delete_themes";b:1;s:6:"export";b:1;}}s:6:"editor";a:2:{s:4:"name";s:6:"Editor";s:12:"capabilities";a:34:{s:17:"moderate_comments";b:1;s:17:"manage_categories";b:1;s:12:"manage_links";b:1;s:12:"upload_files";b:1;s:15:"unfiltered_html";b:1;s:10:"edit_posts";b:1;s:17:"edit_others_posts";b:1;s:20:"edit_published_posts";b:1;s:13:"publish_posts";b:1;s:10:"edit_pages";b:1;s:4:"read";b:1;s:7:"level_7";b:1;s:7:"level_6";b:1;s:7:"level_5";b:1;s:7:"level_4";b:1;s:7:"level_3";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:17:"edit_others_pages";b:1;s:20:"edit_published_pages";b:1;s:13:"publish_pages";b:1;s:12:"delete_pages";b:1;s:19:"delete_others_pages";b:1;s:22:"delete_published_pages";b:1;s:12:"delete_posts";b:1;s:19:"delete_others_posts";b:1;s:22:"delete_published_posts";b:1;s:20:"delete_private_posts";b:1;s:18:"edit_private_posts";b:1;s:18:"read_private_posts";b:1;s:20:"delete_private_pages";b:1;s:18:"edit_private_pages";b:1;s:18:"read_private_pages";b:1;}}s:6:"author";a:2:{s:4:"name";s:6:"Author";s:12:"capabilities";a:10:{s:12:"upload_files";b:1;s:10:"edit_posts";b:1;s:20:"edit_published_posts";b:1;s:13:"publish_posts";b:1;s:4:"read";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:12:"delete_posts";b:1;s:22:"delete_published_posts";b:1;}}s:11:"contributor";a:2:{s:4:"name";s:11:"Contributor";s:12:"capabilities";a:5:{s:10:"edit_posts";b:1;s:4:"read";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:12:"delete_posts";b:1;}}s:10:"subscriber";a:2:{s:4:"name";s:10:"Subscriber";s:12:"capabilities";a:2:{s:4:"read";b:1;s:7:"level_0";b:1;}}}', 'yes'),
(105, 'av_has_example_content', '1', 'yes'),
(106, 'wp_calendar_block_has_published_posts', '1', 'yes'),
(107, 'fresh_site', '0', 'yes'),
(108, 'sidebars_widgets', 'a:2:{s:13:"array_version";i:3;s:9:"sidebar-1";a:2:{i:0;s:24:"av_latest_posts_widget-2";i:1;s:23:"av_random_post_widget-2";}}', 'yes'),
(109, 'widget_av_latest_posts_widget', 'a:2:{s:12:"_multiwidget";i:1;i:2;a:3:{s:12:"widget_title";s:22:"I miei ultimi articoli";s:16:"post_number_view";i:4;s:14:"show_thumbnail";s:5:"large";}}', 'yes'),
(110, 'widget_av_random_post_widget', 'a:2:{s:12:"_multiwidget";i:1;i:2;a:3:{s:12:"widget_title";s:0:"";s:9:"post_type";s:10:"title_text";s:14:"show_thumbnail";s:2:"on";}}', 'yes'),
(111, 'category_children', 'a:0:{}', 'yes'),
(112, 'av_htaccess_needs_rebuild', '', 'yes'),
(113, 'widget_pages', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(114, 'widget_calendar', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(115, 'widget_archives', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(116, 'widget_media_audio', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(117, 'widget_media_image', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(118, 'widget_media_gallery', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(119, 'widget_media_video', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(120, 'widget_meta', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(121, 'widget_search', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(122, 'widget_tag_cloud', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(123, 'widget_nav_menu', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(124, 'widget_custom_html', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(125, 'widget_block', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(126, 'av_debug_log_htaccess_1651564288.0111', 'a:7:{s:21:"start_1651564288.0111";N;s:22:"locked_1651564288.0111";N;s:20:"read_1651564288.0111";s:1835:"# BEGIN AV_HTTPS\n###### ###### ###### ###### ##  DO NOT EDIT!\n###### ###### ###### ###### ##\n##       ##   ##  ## ##  ## ##  This is an automatically generated file,\n##       ##   ##  ## ##  ## ##  any manual change will be lost.\n######   ##   ##  ## ###### ##\n######   ##   ##  ## ###### ##  NON MODIFICARE!\n    ##   ##   ##  ## ##     ##\n    ##   ##   ##  ## ##         Questo è un file generato automaticamente,\n######   ##   ###### ##     ##  qualsiasi modifica manuale verrà persa.\n######   ##   ###### ##     ##\n\n# If you think you need to edit this file, please open a new thread in our\n# support forum (http://forum.en.altervista.org/cms/) explaining what you are\n# trying to do.\n\n# Se pensi di aver bisogno di modificare questo file, apri una nuova discussione\n# sul nostro forum di supporto (http://forum.it.altervista.org/wordpress/)\n# spiegando cosa stai cercando di fare.\n\nAddHandler av-php73 .php\nRewriteCond %{HTTP_HOST} !=davidebaldassin.altervista.org\nRewriteCond %{HTTP:X-Forwarded-Host} !=davidebaldassin.altervista.org\nRewriteRule ^ https://davidebaldassin.altervista.org%{REQUEST_URI} [L,R=301]\nRewriteCond %{HTTP:X-Forwarded-Proto} !=https\nRewriteCond %{HTTPS} =off\nRewriteRule ^ https://davidebaldassin.altervista.org%{REQUEST_URI} [L,R=301]\nSetEnv AV_TOOLBAR 0\n\n# END AV_HTTPS\n\n\n# BEGIN WordPress\n# Le direttive (linee) tra `BEGIN WordPress` e `END WordPress` sono\n# generate dinamicamente, e dovrebbero essere modificate solo tramite i filtri di WordPress.\n# Ogni modifica alle direttive tra questi marcatori verrà sovrascritta.\n<IfModule mod_rewrite.c>\nRewriteEngine On\nRewriteRule .* - [E=HTTP_AUTHORIZATION:%{HTTP:Authorization}]\nRewriteBase /\nRewriteRule ^index\\.php$ - [L]\nRewriteCond %{REQUEST_FILENAME} !-f\nRewriteCond %{REQUEST_FILENAME} !-d\nRewriteRule . /index.php [L]\n</IfModule>\n\n# END WordPress";s:30:"legacy_removed_1651564288.0111";s:1810:"# BEGIN AV_HTTPS\n###### ###### ###### ###### ##  DO NOT EDIT!\n###### ###### ###### ###### ##\n##       ##   ##  ## ##  ## ##  This is an automatically generated file,\n##       ##   ##  ## ##  ## ##  any manual change will be lost.\n######   ##   ##  ## ###### ##\n######   ##   ##  ## ###### ##  NON MODIFICARE!\n    ##   ##   ##  ## ##     ##\n    ##   ##   ##  ## ##         Questo è un file generato automaticamente,\n######   ##   ###### ##     ##  qualsiasi modifica manuale verrà persa.\n######   ##   ###### ##     ##\n\n# If you think you need to edit this file, please open a new thread in our\n# support forum (http://forum.en.altervista.org/cms/) explaining what you are\n# trying to do.\n\n# Se pensi di aver bisogno di modificare questo file, apri una nuova discussione\n# sul nostro forum di supporto (http://forum.it.altervista.org/wordpress/)\n# spiegando cosa stai cercando di fare.\n\nRewriteCond %{HTTP_HOST} !=davidebaldassin.altervista.org\nRewriteCond %{HTTP:X-Forwarded-Host} !=davidebaldassin.altervista.org\nRewriteRule ^ https://davidebaldassin.altervista.org%{REQUEST_URI} [L,R=301]\nRewriteCond %{HTTP:X-Forwarded-Proto} !=https\nRewriteCond %{HTTPS} =off\nRewriteRule ^ https://davidebaldassin.altervista.org%{REQUEST_URI} [L,R=301]\nSetEnv AV_TOOLBAR 0\n\n# END AV_HTTPS\n\n\n# BEGIN WordPress\n# Le direttive (linee) tra `BEGIN WordPress` e `END WordPress` sono\n# generate dinamicamente, e dovrebbero essere modificate solo tramite i filtri di WordPress.\n# Ogni modifica alle direttive tra questi marcatori verrà sovrascritta.\n<IfModule mod_rewrite.c>\nRewriteEngine On\nRewriteRule .* - [E=HTTP_AUTHORIZATION:%{HTTP:Authorization}]\nRewriteBase /\nRewriteRule ^index\\.php$ - [L]\nRewriteCond %{REQUEST_FILENAME} !-f\nRewriteCond %{REQUEST_FILENAME} !-d\nRewriteRule . /index.php [L]\n</IfModule>\n\n# END WordPress";s:25:"new rules_1651564288.0115";s:1250:"###### ###### ###### ###### ##  DO NOT EDIT!\n###### ###### ###### ###### ##\n##       ##   ##  ## ##  ## ##  This is an automatically generated file,\n##       ##   ##  ## ##  ## ##  any manual change will be lost.\n######   ##   ##  ## ###### ##\n######   ##   ##  ## ###### ##  NON MODIFICARE!\n    ##   ##   ##  ## ##     ##\n    ##   ##   ##  ## ##         Questo è un file generato automaticamente,\n######   ##   ###### ##     ##  qualsiasi modifica manuale verrà persa.\n######   ##   ###### ##     ##\n\n# If you think you need to edit this file, please open a new thread in our\n# support forum (http://forum.en.altervista.org/cms/) explaining what you are\n# trying to do.\n\n# Se pensi di aver bisogno di modificare questo file, apri una nuova discussione\n# sul nostro forum di supporto (http://forum.it.altervista.org/wordpress/)\n# spiegando cosa stai cercando di fare.\n\nRewriteCond %{HTTP_HOST} !=davidebaldassin.altervista.org\nRewriteCond %{HTTP:X-Forwarded-Host} !=davidebaldassin.altervista.org\nRewriteRule ^ https://davidebaldassin.altervista.org%{REQUEST_URI} [L,R=301]\nRewriteCond %{HTTP:X-Forwarded-Proto} !=https\nRewriteCond %{HTTPS} =off\nRewriteRule ^ https://davidebaldassin.altervista.org%{REQUEST_URI} [L,R=301]\nAddHandler av-php73 .php\n";s:22:"rename_1651564288.0206";b:1;s:19:"end_1651564288.0206";N;}', 'no'),
(127, 'cron', 'a:5:{i:1653314858;a:1:{s:34:"wp_privacy_delete_old_export_files";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:6:"hourly";s:4:"args";a:0:{}s:8:"interval";i:3600;}}}i:1653336458;a:5:{s:18:"wp_https_detection";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}s:16:"wp_version_check";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}s:17:"wp_update_plugins";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}s:16:"wp_update_themes";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}s:12:"av_cron_jobs";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}}i:1653379658;a:1:{s:32:"recovery_mode_clean_expired_keys";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}}i:1653466058;a:1:{s:30:"wp_site_health_scheduled_check";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:6:"weekly";s:4:"args";a:0:{}s:8:"interval";i:604800;}}}s:7:"version";i:2;}', 'yes'),
(128, 'av_database_version', '1.1.8', 'yes'),
(129, 'avopt_account_info', 'a:20:{s:10:"adsense_id";N;s:14:"varnish_active";s:0:"";s:7:"adv_tag";N;s:14:"adsense_pub_id";N;s:18:"native_ssl_domains";a:1:{i:0;a:4:{s:17:"LastUpdateMinutes";i:49770;s:10:"LastUpdate";i:1650328572;s:6:"Status";s:6:"issued";s:6:"Domain";s:30:"davidebaldassin.altervista.org";}}s:5:"email";s:30:"info.davidebaldassin@gmail.com";s:4:"name";s:15:"davidebaldassin";s:10:"adspecials";i:0;s:15:"adspecials_list";a:0:{}s:19:"adsense_impressions";i:0;s:7:"adsense";N;s:11:"main_domain";s:30:"davidebaldassin.altervista.org";s:16:"adsense_approval";N;s:10:"group_host";N;s:4:"type";s:7:"hosting";s:14:"manage_domains";i:1;s:6:"is_dev";i:0;s:20:"adsense_account_type";s:10:"associated";s:9:"adv_group";s:9:"AllSilver";s:5:"group";N;}', 'yes'),
(130, 'av_social_ring_options', 'a:17:{s:11:"button_type";s:9:"icon_text";s:12:"button_style";s:8:"original";s:27:"social_visible_buttons_list";s:66:"social_facebook_button|social_twitter_button|social_pin_it_button|";s:29:"social_available_buttons_list";s:93:"social_linkedin_button|social_print_button|social_create_pdf_button|social_send_email_button|";s:10:"share_text";s:0:"";s:15:"social_on_pages";i:0;s:15:"social_on_posts";i:1;s:21:"social_before_content";i:1;s:20:"social_after_content";i:0;s:11:"fanbox_tabs";s:0:"";s:14:"button_counter";i:1;s:13:"fanbox_active";i:0;s:10:"fanbox_url";s:0:"";s:19:"fanbox_small_header";i:0;s:17:"fanbox_show_faces";i:1;s:17:"fanbox_hide_cover";i:0;i:0;b:0;}', 'yes'),
(131, 'av_facebook_domain_verification', '', 'yes'),
(132, 'av_footer_text', '', 'yes'),
(133, 'av_branch', '', 'yes'),
(134, 'av_previous_urls', 'a:0:{}', 'yes'),
(135, 'auth_salt', '<gI`jfiRxkK|cRyqUz~PGXPmsiyHGlmtsH:p(F-F.Ju#yu -nOl^G|*0f11JD+MJ', 'no'),
(136, 'secure_auth_salt', 'z$lk?f|[MHSEZPryT<(,8P QU%.$q/7P}^l^<;>HN&<2tl8PTf#5)+fm#un<#=VC', 'no'),
(137, 'logged_in_salt', 'Z4Mq?)k/t,qpMQ1Y8W^Yndid?-.A(l/PH~6&(`ZhpH|C?S^4^(w(HeXT c*,8L8;', 'no'),
(138, 'nonce_salt', '#3CfWH7]H~XxmWHOtbMW]$?P%J$O~7wjV1P,zJLjVEPY>7Is3m$/d<V<?*nwft$2', 'no'),
(139, 'theme_mods_av-seamless-rene', 'a:33:{s:14:"av_logo_mobile";i:0;s:22:"av_social_facebook_url";s:24:"https://www.facebook.com";s:23:"av_social_instagram_url";s:25:"https://www.instagram.com";s:23:"av_social_pinterest_url";s:24:"https://www.pinterest.it";s:21:"av_social_twitter_url";s:0:"";s:22:"av_social_linkedin_url";s:0:"";s:21:"av_social_youtube_url";s:0:"";s:22:"av_advanced_pagination";s:7:"numeric";s:31:"av_advanced_show_post_thumbnail";b:0;s:25:"av_advanced_show_category";b:1;s:23:"av_advanced_use_courses";b:0;s:21:"av_advanced_show_date";b:1;s:23:"av_advanced_show_author";b:1;s:27:"av_advanced_show_author_bio";b:1;s:25:"av_advanced_show_cat_desc";b:0;s:31:"av_advanced_enable_reading_list";b:1;s:15:"av_header_style";s:11:"logo-center";s:28:"av_homepage_carousel_enabled";b:0;s:29:"av_homepage_carousel_autoplay";b:1;s:29:"av_homepage_carousel_category";i:0;s:28:"av_homepage_featured_enabled";b:1;s:29:"av_homepage_featured_category";i:0;s:26:"av_homepage_featured_title";s:0:"";s:29:"av_homepage_featured_subtitle";s:0:"";s:17:"av_colors_primary";s:7:"#CE5C5C";s:20:"av_colors_site_title";s:7:"#CE5C5C";s:17:"av_colors_tagline";s:7:"#787878";s:24:"av_typography_site_title";s:10:"Lilita One";s:27:"av_typography_article_title";s:4:"Lora";s:18:"av_typography_text";s:4:"Krub";s:21:"av_typography_justify";b:0;s:24:"av_social_show_in_header";b:1;s:24:"av_social_show_in_footer";b:1;}', 'yes'),
(140, 'widget_altervista_googleadsense', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(141, 'widget_av_social_url', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(142, 'widget_av_profile_widget', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(143, 'widget_av_image_widget', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(144, 'widget_av_facebook_fanbox_widget', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(145, 'widget_av_twitter_widget', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(146, 'av_cached_endpoints', 'a:2:{i:0;a:3:{i:0;i:1;i:1;s:5:"av_rl";i:2;s:5:"av_rl";}i:1;a:3:{i:0;i:1;i:1;s:3:"amp";i:2;s:3:"amp";}}', 'yes'),
(255, '_site_transient_timeout_available_translations', '1653325620', 'no');
INSERT INTO `avwp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(256, '_site_transient_available_translations', 'a:128:{s:2:"af";a:8:{s:8:"language";s:2:"af";s:7:"version";s:8:"5.8-beta";s:7:"updated";s:19:"2021-05-13 15:59:22";s:12:"english_name";s:9:"Afrikaans";s:11:"native_name";s:9:"Afrikaans";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/5.8-beta/af.zip";s:3:"iso";a:2:{i:1;s:2:"af";i:2;s:3:"afr";}s:7:"strings";a:1:{s:8:"continue";s:10:"Gaan voort";}}s:2:"am";a:8:{s:8:"language";s:2:"am";s:7:"version";s:3:"5.9";s:7:"updated";s:19:"2022-02-18 21:35:31";s:12:"english_name";s:7:"Amharic";s:11:"native_name";s:12:"አማርኛ";s:7:"package";s:59:"https://downloads.wordpress.org/translation/core/5.9/am.zip";s:3:"iso";a:2:{i:1;s:2:"am";i:2;s:3:"amh";}s:7:"strings";a:1:{s:8:"continue";s:9:"ቀጥል";}}s:2:"ar";a:8:{s:8:"language";s:2:"ar";s:7:"version";s:3:"5.9";s:7:"updated";s:19:"2022-02-13 09:26:26";s:12:"english_name";s:6:"Arabic";s:11:"native_name";s:14:"العربية";s:7:"package";s:59:"https://downloads.wordpress.org/translation/core/5.9/ar.zip";s:3:"iso";a:2:{i:1;s:2:"ar";i:2;s:3:"ara";}s:7:"strings";a:1:{s:8:"continue";s:16:"المتابعة";}}s:3:"ary";a:8:{s:8:"language";s:3:"ary";s:7:"version";s:6:"4.8.19";s:7:"updated";s:19:"2017-01-26 15:42:35";s:12:"english_name";s:15:"Moroccan Arabic";s:11:"native_name";s:31:"العربية المغربية";s:7:"package";s:63:"https://downloads.wordpress.org/translation/core/4.8.19/ary.zip";s:3:"iso";a:2:{i:1;s:2:"ar";i:3;s:3:"ary";}s:7:"strings";a:1:{s:8:"continue";s:16:"المتابعة";}}s:2:"as";a:8:{s:8:"language";s:2:"as";s:7:"version";s:5:"5.8.4";s:7:"updated";s:19:"2021-09-08 17:57:56";s:12:"english_name";s:8:"Assamese";s:11:"native_name";s:21:"অসমীয়া";s:7:"package";s:61:"https://downloads.wordpress.org/translation/core/5.8.4/as.zip";s:3:"iso";a:3:{i:1;s:2:"as";i:2;s:3:"asm";i:3;s:3:"asm";}s:7:"strings";a:1:{s:8:"continue";s:8:"Continue";}}s:3:"azb";a:8:{s:8:"language";s:3:"azb";s:7:"version";s:5:"4.7.2";s:7:"updated";s:19:"2016-09-12 20:34:31";s:12:"english_name";s:17:"South Azerbaijani";s:11:"native_name";s:29:"گؤنئی آذربایجان";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/4.7.2/azb.zip";s:3:"iso";a:2:{i:1;s:2:"az";i:3;s:3:"azb";}s:7:"strings";a:1:{s:8:"continue";s:8:"Continue";}}s:2:"az";a:8:{s:8:"language";s:2:"az";s:7:"version";s:5:"4.7.2";s:7:"updated";s:19:"2016-11-06 00:09:27";s:12:"english_name";s:11:"Azerbaijani";s:11:"native_name";s:16:"Azərbaycan dili";s:7:"package";s:61:"https://downloads.wordpress.org/translation/core/4.7.2/az.zip";s:3:"iso";a:2:{i:1;s:2:"az";i:2;s:3:"aze";}s:7:"strings";a:1:{s:8:"continue";s:5:"Davam";}}s:3:"bel";a:8:{s:8:"language";s:3:"bel";s:7:"version";s:6:"4.9.20";s:7:"updated";s:19:"2019-10-29 07:54:22";s:12:"english_name";s:10:"Belarusian";s:11:"native_name";s:29:"Беларуская мова";s:7:"package";s:63:"https://downloads.wordpress.org/translation/core/4.9.20/bel.zip";s:3:"iso";a:2:{i:1;s:2:"be";i:2;s:3:"bel";}s:7:"strings";a:1:{s:8:"continue";s:20:"Працягнуць";}}s:5:"bg_BG";a:8:{s:8:"language";s:5:"bg_BG";s:7:"version";s:5:"5.8.4";s:7:"updated";s:19:"2021-12-01 15:31:45";s:12:"english_name";s:9:"Bulgarian";s:11:"native_name";s:18:"Български";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/5.8.4/bg_BG.zip";s:3:"iso";a:2:{i:1;s:2:"bg";i:2;s:3:"bul";}s:7:"strings";a:1:{s:8:"continue";s:12:"Напред";}}s:5:"bn_BD";a:8:{s:8:"language";s:5:"bn_BD";s:7:"version";s:6:"5.4.10";s:7:"updated";s:19:"2020-10-31 08:48:37";s:12:"english_name";s:20:"Bengali (Bangladesh)";s:11:"native_name";s:15:"বাংলা";s:7:"package";s:65:"https://downloads.wordpress.org/translation/core/5.4.10/bn_BD.zip";s:3:"iso";a:1:{i:1;s:2:"bn";}s:7:"strings";a:1:{s:8:"continue";s:23:"এগিয়ে চল.";}}s:2:"bo";a:8:{s:8:"language";s:2:"bo";s:7:"version";s:8:"5.8-beta";s:7:"updated";s:19:"2020-10-30 03:24:38";s:12:"english_name";s:7:"Tibetan";s:11:"native_name";s:21:"བོད་ཡིག";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/5.8-beta/bo.zip";s:3:"iso";a:2:{i:1;s:2:"bo";i:2;s:3:"tib";}s:7:"strings";a:1:{s:8:"continue";s:33:"མུ་མཐུད་དུ།";}}s:5:"bs_BA";a:8:{s:8:"language";s:5:"bs_BA";s:7:"version";s:3:"5.9";s:7:"updated";s:19:"2022-01-26 00:32:49";s:12:"english_name";s:7:"Bosnian";s:11:"native_name";s:8:"Bosanski";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/5.9/bs_BA.zip";s:3:"iso";a:2:{i:1;s:2:"bs";i:2;s:3:"bos";}s:7:"strings";a:1:{s:8:"continue";s:7:"Nastavi";}}s:2:"ca";a:8:{s:8:"language";s:2:"ca";s:7:"version";s:3:"5.9";s:7:"updated";s:19:"2022-01-23 08:02:22";s:12:"english_name";s:7:"Catalan";s:11:"native_name";s:7:"Català";s:7:"package";s:59:"https://downloads.wordpress.org/translation/core/5.9/ca.zip";s:3:"iso";a:2:{i:1;s:2:"ca";i:2;s:3:"cat";}s:7:"strings";a:1:{s:8:"continue";s:8:"Continua";}}s:3:"ceb";a:8:{s:8:"language";s:3:"ceb";s:7:"version";s:5:"4.7.2";s:7:"updated";s:19:"2016-03-02 17:25:51";s:12:"english_name";s:7:"Cebuano";s:11:"native_name";s:7:"Cebuano";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/4.7.2/ceb.zip";s:3:"iso";a:2:{i:2;s:3:"ceb";i:3;s:3:"ceb";}s:7:"strings";a:1:{s:8:"continue";s:7:"Padayun";}}s:5:"cs_CZ";a:8:{s:8:"language";s:5:"cs_CZ";s:7:"version";s:3:"5.9";s:7:"updated";s:19:"2022-02-18 07:44:53";s:12:"english_name";s:5:"Czech";s:11:"native_name";s:9:"Čeština";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/5.9/cs_CZ.zip";s:3:"iso";a:2:{i:1;s:2:"cs";i:2;s:3:"ces";}s:7:"strings";a:1:{s:8:"continue";s:11:"Pokračovat";}}s:2:"cy";a:8:{s:8:"language";s:2:"cy";s:7:"version";s:3:"5.9";s:7:"updated";s:19:"2022-02-18 16:29:19";s:12:"english_name";s:5:"Welsh";s:11:"native_name";s:7:"Cymraeg";s:7:"package";s:59:"https://downloads.wordpress.org/translation/core/5.9/cy.zip";s:3:"iso";a:2:{i:1;s:2:"cy";i:2;s:3:"cym";}s:7:"strings";a:1:{s:8:"continue";s:6:"Parhau";}}s:5:"da_DK";a:8:{s:8:"language";s:5:"da_DK";s:7:"version";s:3:"5.9";s:7:"updated";s:19:"2022-01-31 16:48:08";s:12:"english_name";s:6:"Danish";s:11:"native_name";s:5:"Dansk";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/5.9/da_DK.zip";s:3:"iso";a:2:{i:1;s:2:"da";i:2;s:3:"dan";}s:7:"strings";a:1:{s:8:"continue";s:8:"Fortsæt";}}s:12:"de_DE_formal";a:8:{s:8:"language";s:12:"de_DE_formal";s:7:"version";s:3:"5.9";s:7:"updated";s:19:"2022-02-17 21:14:01";s:12:"english_name";s:15:"German (Formal)";s:11:"native_name";s:13:"Deutsch (Sie)";s:7:"package";s:69:"https://downloads.wordpress.org/translation/core/5.9/de_DE_formal.zip";s:3:"iso";a:1:{i:1;s:2:"de";}s:7:"strings";a:1:{s:8:"continue";s:6:"Weiter";}}s:5:"de_AT";a:8:{s:8:"language";s:5:"de_AT";s:7:"version";s:3:"5.9";s:7:"updated";s:19:"2022-01-23 19:42:08";s:12:"english_name";s:16:"German (Austria)";s:11:"native_name";s:21:"Deutsch (Österreich)";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/5.9/de_AT.zip";s:3:"iso";a:1:{i:1;s:2:"de";}s:7:"strings";a:1:{s:8:"continue";s:6:"Weiter";}}s:5:"de_CH";a:8:{s:8:"language";s:5:"de_CH";s:7:"version";s:3:"5.9";s:7:"updated";s:19:"2022-01-24 12:26:13";s:12:"english_name";s:20:"German (Switzerland)";s:11:"native_name";s:17:"Deutsch (Schweiz)";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/5.9/de_CH.zip";s:3:"iso";a:1:{i:1;s:2:"de";}s:7:"strings";a:1:{s:8:"continue";s:6:"Weiter";}}s:5:"de_DE";a:8:{s:8:"language";s:5:"de_DE";s:7:"version";s:3:"5.9";s:7:"updated";s:19:"2022-02-17 21:11:00";s:12:"english_name";s:6:"German";s:11:"native_name";s:7:"Deutsch";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/5.9/de_DE.zip";s:3:"iso";a:1:{i:1;s:2:"de";}s:7:"strings";a:1:{s:8:"continue";s:6:"Weiter";}}s:14:"de_CH_informal";a:8:{s:8:"language";s:14:"de_CH_informal";s:7:"version";s:3:"5.9";s:7:"updated";s:19:"2022-01-24 12:22:31";s:12:"english_name";s:30:"German (Switzerland, Informal)";s:11:"native_name";s:21:"Deutsch (Schweiz, Du)";s:7:"package";s:71:"https://downloads.wordpress.org/translation/core/5.9/de_CH_informal.zip";s:3:"iso";a:1:{i:1;s:2:"de";}s:7:"strings";a:1:{s:8:"continue";s:6:"Weiter";}}s:3:"dsb";a:8:{s:8:"language";s:3:"dsb";s:7:"version";s:3:"5.9";s:7:"updated";s:19:"2022-02-18 15:26:10";s:12:"english_name";s:13:"Lower Sorbian";s:11:"native_name";s:16:"Dolnoserbšćina";s:7:"package";s:60:"https://downloads.wordpress.org/translation/core/5.9/dsb.zip";s:3:"iso";a:2:{i:2;s:3:"dsb";i:3;s:3:"dsb";}s:7:"strings";a:1:{s:8:"continue";s:5:"Dalej";}}s:3:"dzo";a:8:{s:8:"language";s:3:"dzo";s:7:"version";s:5:"4.7.2";s:7:"updated";s:19:"2016-06-29 08:59:03";s:12:"english_name";s:8:"Dzongkha";s:11:"native_name";s:18:"རྫོང་ཁ";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/4.7.2/dzo.zip";s:3:"iso";a:2:{i:1;s:2:"dz";i:2;s:3:"dzo";}s:7:"strings";a:1:{s:8:"continue";s:8:"Continue";}}s:2:"el";a:8:{s:8:"language";s:2:"el";s:7:"version";s:3:"5.9";s:7:"updated";s:19:"2022-02-21 16:41:01";s:12:"english_name";s:5:"Greek";s:11:"native_name";s:16:"Ελληνικά";s:7:"package";s:59:"https://downloads.wordpress.org/translation/core/5.9/el.zip";s:3:"iso";a:2:{i:1;s:2:"el";i:2;s:3:"ell";}s:7:"strings";a:1:{s:8:"continue";s:16:"Συνέχεια";}}s:5:"en_GB";a:8:{s:8:"language";s:5:"en_GB";s:7:"version";s:3:"5.9";s:7:"updated";s:19:"2022-02-18 08:36:22";s:12:"english_name";s:12:"English (UK)";s:11:"native_name";s:12:"English (UK)";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/5.9/en_GB.zip";s:3:"iso";a:3:{i:1;s:2:"en";i:2;s:3:"eng";i:3;s:3:"eng";}s:7:"strings";a:1:{s:8:"continue";s:8:"Continue";}}s:5:"en_CA";a:8:{s:8:"language";s:5:"en_CA";s:7:"version";s:3:"5.9";s:7:"updated";s:19:"2022-02-11 01:23:43";s:12:"english_name";s:16:"English (Canada)";s:11:"native_name";s:16:"English (Canada)";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/5.9/en_CA.zip";s:3:"iso";a:3:{i:1;s:2:"en";i:2;s:3:"eng";i:3;s:3:"eng";}s:7:"strings";a:1:{s:8:"continue";s:8:"Continue";}}s:5:"en_AU";a:8:{s:8:"language";s:5:"en_AU";s:7:"version";s:3:"5.9";s:7:"updated";s:19:"2022-01-18 05:55:29";s:12:"english_name";s:19:"English (Australia)";s:11:"native_name";s:19:"English (Australia)";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/5.9/en_AU.zip";s:3:"iso";a:3:{i:1;s:2:"en";i:2;s:3:"eng";i:3;s:3:"eng";}s:7:"strings";a:1:{s:8:"continue";s:8:"Continue";}}s:5:"en_NZ";a:8:{s:8:"language";s:5:"en_NZ";s:7:"version";s:3:"5.9";s:7:"updated";s:19:"2022-01-18 22:20:21";s:12:"english_name";s:21:"English (New Zealand)";s:11:"native_name";s:21:"English (New Zealand)";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/5.9/en_NZ.zip";s:3:"iso";a:3:{i:1;s:2:"en";i:2;s:3:"eng";i:3;s:3:"eng";}s:7:"strings";a:1:{s:8:"continue";s:8:"Continue";}}s:5:"en_ZA";a:8:{s:8:"language";s:5:"en_ZA";s:7:"version";s:3:"5.9";s:7:"updated";s:19:"2021-12-24 12:36:39";s:12:"english_name";s:22:"English (South Africa)";s:11:"native_name";s:22:"English (South Africa)";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/5.9/en_ZA.zip";s:3:"iso";a:3:{i:1;s:2:"en";i:2;s:3:"eng";i:3;s:3:"eng";}s:7:"strings";a:1:{s:8:"continue";s:8:"Continue";}}s:2:"eo";a:8:{s:8:"language";s:2:"eo";s:7:"version";s:3:"5.9";s:7:"updated";s:19:"2022-01-24 13:28:57";s:12:"english_name";s:9:"Esperanto";s:11:"native_name";s:9:"Esperanto";s:7:"package";s:59:"https://downloads.wordpress.org/translation/core/5.9/eo.zip";s:3:"iso";a:2:{i:1;s:2:"eo";i:2;s:3:"epo";}s:7:"strings";a:1:{s:8:"continue";s:8:"Daŭrigi";}}s:5:"es_VE";a:8:{s:8:"language";s:5:"es_VE";s:7:"version";s:3:"5.9";s:7:"updated";s:19:"2022-02-18 05:01:05";s:12:"english_name";s:19:"Spanish (Venezuela)";s:11:"native_name";s:21:"Español de Venezuela";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/5.9/es_VE.zip";s:3:"iso";a:3:{i:1;s:2:"es";i:2;s:3:"spa";i:3;s:3:"spa";}s:7:"strings";a:1:{s:8:"continue";s:9:"Continuar";}}s:5:"es_EC";a:8:{s:8:"language";s:5:"es_EC";s:7:"version";s:3:"5.9";s:7:"updated";s:19:"2022-02-18 05:01:53";s:12:"english_name";s:17:"Spanish (Ecuador)";s:11:"native_name";s:19:"Español de Ecuador";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/5.9/es_EC.zip";s:3:"iso";a:3:{i:1;s:2:"es";i:2;s:3:"spa";i:3;s:3:"spa";}s:7:"strings";a:1:{s:8:"continue";s:9:"Continuar";}}s:5:"es_AR";a:8:{s:8:"language";s:5:"es_AR";s:7:"version";s:3:"5.9";s:7:"updated";s:19:"2022-01-12 15:14:43";s:12:"english_name";s:19:"Spanish (Argentina)";s:11:"native_name";s:21:"Español de Argentina";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/5.9/es_AR.zip";s:3:"iso";a:3:{i:1;s:2:"es";i:2;s:3:"spa";i:3;s:3:"spa";}s:7:"strings";a:1:{s:8:"continue";s:9:"Continuar";}}s:5:"es_MX";a:8:{s:8:"language";s:5:"es_MX";s:7:"version";s:3:"5.9";s:7:"updated";s:19:"2022-01-18 14:17:30";s:12:"english_name";s:16:"Spanish (Mexico)";s:11:"native_name";s:19:"Español de México";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/5.9/es_MX.zip";s:3:"iso";a:3:{i:1;s:2:"es";i:2;s:3:"spa";i:3;s:3:"spa";}s:7:"strings";a:1:{s:8:"continue";s:9:"Continuar";}}s:5:"es_CO";a:8:{s:8:"language";s:5:"es_CO";s:7:"version";s:3:"5.9";s:7:"updated";s:19:"2022-02-18 05:01:34";s:12:"english_name";s:18:"Spanish (Colombia)";s:11:"native_name";s:20:"Español de Colombia";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/5.9/es_CO.zip";s:3:"iso";a:3:{i:1;s:2:"es";i:2;s:3:"spa";i:3;s:3:"spa";}s:7:"strings";a:1:{s:8:"continue";s:9:"Continuar";}}s:5:"es_DO";a:8:{s:8:"language";s:5:"es_DO";s:7:"version";s:5:"5.8.4";s:7:"updated";s:19:"2021-10-08 14:32:50";s:12:"english_name";s:28:"Spanish (Dominican Republic)";s:11:"native_name";s:33:"Español de República Dominicana";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/5.8.4/es_DO.zip";s:3:"iso";a:3:{i:1;s:2:"es";i:2;s:3:"spa";i:3;s:3:"spa";}s:7:"strings";a:1:{s:8:"continue";s:9:"Continuar";}}s:5:"es_PE";a:8:{s:8:"language";s:5:"es_PE";s:7:"version";s:5:"5.8.4";s:7:"updated";s:19:"2021-10-04 20:53:18";s:12:"english_name";s:14:"Spanish (Peru)";s:11:"native_name";s:17:"Español de Perú";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/5.8.4/es_PE.zip";s:3:"iso";a:3:{i:1;s:2:"es";i:2;s:3:"spa";i:3;s:3:"spa";}s:7:"strings";a:1:{s:8:"continue";s:9:"Continuar";}}s:5:"es_CR";a:8:{s:8:"language";s:5:"es_CR";s:7:"version";s:5:"5.8.4";s:7:"updated";s:19:"2021-07-30 00:35:05";s:12:"english_name";s:20:"Spanish (Costa Rica)";s:11:"native_name";s:22:"Español de Costa Rica";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/5.8.4/es_CR.zip";s:3:"iso";a:3:{i:1;s:2:"es";i:2;s:3:"spa";i:3;s:3:"spa";}s:7:"strings";a:1:{s:8:"continue";s:9:"Continuar";}}s:5:"es_CL";a:8:{s:8:"language";s:5:"es_CL";s:7:"version";s:8:"5.8-beta";s:7:"updated";s:19:"2021-06-14 16:02:22";s:12:"english_name";s:15:"Spanish (Chile)";s:11:"native_name";s:17:"Español de Chile";s:7:"package";s:67:"https://downloads.wordpress.org/translation/core/5.8-beta/es_CL.zip";s:3:"iso";a:3:{i:1;s:2:"es";i:2;s:3:"spa";i:3;s:3:"spa";}s:7:"strings";a:1:{s:8:"continue";s:9:"Continuar";}}s:5:"es_UY";a:8:{s:8:"language";s:5:"es_UY";s:7:"version";s:8:"5.8-beta";s:7:"updated";s:19:"2021-03-31 18:33:26";s:12:"english_name";s:17:"Spanish (Uruguay)";s:11:"native_name";s:19:"Español de Uruguay";s:7:"package";s:67:"https://downloads.wordpress.org/translation/core/5.8-beta/es_UY.zip";s:3:"iso";a:3:{i:1;s:2:"es";i:2;s:3:"spa";i:3;s:3:"spa";}s:7:"strings";a:1:{s:8:"continue";s:9:"Continuar";}}s:5:"es_PR";a:8:{s:8:"language";s:5:"es_PR";s:7:"version";s:6:"5.4.10";s:7:"updated";s:19:"2020-04-29 15:36:59";s:12:"english_name";s:21:"Spanish (Puerto Rico)";s:11:"native_name";s:23:"Español de Puerto Rico";s:7:"package";s:65:"https://downloads.wordpress.org/translation/core/5.4.10/es_PR.zip";s:3:"iso";a:3:{i:1;s:2:"es";i:2;s:3:"spa";i:3;s:3:"spa";}s:7:"strings";a:1:{s:8:"continue";s:9:"Continuar";}}s:5:"es_GT";a:8:{s:8:"language";s:5:"es_GT";s:7:"version";s:6:"5.2.15";s:7:"updated";s:19:"2019-03-02 06:35:01";s:12:"english_name";s:19:"Spanish (Guatemala)";s:11:"native_name";s:21:"Español de Guatemala";s:7:"package";s:65:"https://downloads.wordpress.org/translation/core/5.2.15/es_GT.zip";s:3:"iso";a:3:{i:1;s:2:"es";i:2;s:3:"spa";i:3;s:3:"spa";}s:7:"strings";a:1:{s:8:"continue";s:9:"Continuar";}}s:5:"es_ES";a:8:{s:8:"language";s:5:"es_ES";s:7:"version";s:3:"5.9";s:7:"updated";s:19:"2022-02-22 09:13:24";s:12:"english_name";s:15:"Spanish (Spain)";s:11:"native_name";s:8:"Español";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/5.9/es_ES.zip";s:3:"iso";a:3:{i:1;s:2:"es";i:2;s:3:"spa";i:3;s:3:"spa";}s:7:"strings";a:1:{s:8:"continue";s:9:"Continuar";}}s:2:"et";a:8:{s:8:"language";s:2:"et";s:7:"version";s:8:"5.8-beta";s:7:"updated";s:19:"2020-08-12 08:38:59";s:12:"english_name";s:8:"Estonian";s:11:"native_name";s:5:"Eesti";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/5.8-beta/et.zip";s:3:"iso";a:2:{i:1;s:2:"et";i:2;s:3:"est";}s:7:"strings";a:1:{s:8:"continue";s:6:"Jätka";}}s:2:"eu";a:8:{s:8:"language";s:2:"eu";s:7:"version";s:5:"5.8.4";s:7:"updated";s:19:"2022-04-26 17:45:44";s:12:"english_name";s:6:"Basque";s:11:"native_name";s:7:"Euskara";s:7:"package";s:61:"https://downloads.wordpress.org/translation/core/5.8.4/eu.zip";s:3:"iso";a:2:{i:1;s:2:"eu";i:2;s:3:"eus";}s:7:"strings";a:1:{s:8:"continue";s:8:"Jarraitu";}}s:5:"fa_IR";a:8:{s:8:"language";s:5:"fa_IR";s:7:"version";s:3:"5.9";s:7:"updated";s:19:"2022-02-20 15:30:05";s:12:"english_name";s:7:"Persian";s:11:"native_name";s:10:"فارسی";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/5.9/fa_IR.zip";s:3:"iso";a:2:{i:1;s:2:"fa";i:2;s:3:"fas";}s:7:"strings";a:1:{s:8:"continue";s:10:"ادامه";}}s:5:"fa_AF";a:8:{s:8:"language";s:5:"fa_AF";s:7:"version";s:5:"5.8.4";s:7:"updated";s:19:"2021-11-20 16:34:11";s:12:"english_name";s:21:"Persian (Afghanistan)";s:11:"native_name";s:31:"(فارسی (افغانستان";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/5.8.4/fa_AF.zip";s:3:"iso";a:2:{i:1;s:2:"fa";i:2;s:3:"fas";}s:7:"strings";a:1:{s:8:"continue";s:10:"ادامه";}}s:2:"fi";a:8:{s:8:"language";s:2:"fi";s:7:"version";s:3:"5.9";s:7:"updated";s:19:"2022-01-22 11:12:02";s:12:"english_name";s:7:"Finnish";s:11:"native_name";s:5:"Suomi";s:7:"package";s:59:"https://downloads.wordpress.org/translation/core/5.9/fi.zip";s:3:"iso";a:2:{i:1;s:2:"fi";i:2;s:3:"fin";}s:7:"strings";a:1:{s:8:"continue";s:5:"Jatka";}}s:5:"fr_FR";a:8:{s:8:"language";s:5:"fr_FR";s:7:"version";s:3:"5.9";s:7:"updated";s:19:"2022-02-20 07:35:01";s:12:"english_name";s:15:"French (France)";s:11:"native_name";s:9:"Français";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/5.9/fr_FR.zip";s:3:"iso";a:1:{i:1;s:2:"fr";}s:7:"strings";a:1:{s:8:"continue";s:9:"Continuer";}}s:5:"fr_CA";a:8:{s:8:"language";s:5:"fr_CA";s:7:"version";s:3:"5.9";s:7:"updated";s:19:"2022-01-21 16:52:21";s:12:"english_name";s:15:"French (Canada)";s:11:"native_name";s:19:"Français du Canada";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/5.9/fr_CA.zip";s:3:"iso";a:2:{i:1;s:2:"fr";i:2;s:3:"fra";}s:7:"strings";a:1:{s:8:"continue";s:9:"Continuer";}}s:5:"fr_BE";a:8:{s:8:"language";s:5:"fr_BE";s:7:"version";s:8:"5.8-beta";s:7:"updated";s:19:"2021-02-22 13:54:46";s:12:"english_name";s:16:"French (Belgium)";s:11:"native_name";s:21:"Français de Belgique";s:7:"package";s:67:"https://downloads.wordpress.org/translation/core/5.8-beta/fr_BE.zip";s:3:"iso";a:2:{i:1;s:2:"fr";i:2;s:3:"fra";}s:7:"strings";a:1:{s:8:"continue";s:9:"Continuer";}}s:3:"fur";a:8:{s:8:"language";s:3:"fur";s:7:"version";s:6:"4.8.19";s:7:"updated";s:19:"2018-01-29 17:32:35";s:12:"english_name";s:8:"Friulian";s:11:"native_name";s:8:"Friulian";s:7:"package";s:63:"https://downloads.wordpress.org/translation/core/4.8.19/fur.zip";s:3:"iso";a:2:{i:2;s:3:"fur";i:3;s:3:"fur";}s:7:"strings";a:1:{s:8:"continue";s:8:"Continue";}}s:2:"gd";a:8:{s:8:"language";s:2:"gd";s:7:"version";s:5:"4.7.2";s:7:"updated";s:19:"2016-08-23 17:41:37";s:12:"english_name";s:15:"Scottish Gaelic";s:11:"native_name";s:9:"Gàidhlig";s:7:"package";s:61:"https://downloads.wordpress.org/translation/core/4.7.2/gd.zip";s:3:"iso";a:3:{i:1;s:2:"gd";i:2;s:3:"gla";i:3;s:3:"gla";}s:7:"strings";a:1:{s:8:"continue";s:15:"Lean air adhart";}}s:5:"gl_ES";a:8:{s:8:"language";s:5:"gl_ES";s:7:"version";s:3:"5.9";s:7:"updated";s:19:"2022-02-18 10:40:42";s:12:"english_name";s:8:"Galician";s:11:"native_name";s:6:"Galego";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/5.9/gl_ES.zip";s:3:"iso";a:2:{i:1;s:2:"gl";i:2;s:3:"glg";}s:7:"strings";a:1:{s:8:"continue";s:9:"Continuar";}}s:2:"gu";a:8:{s:8:"language";s:2:"gu";s:7:"version";s:6:"4.9.20";s:7:"updated";s:19:"2018-09-14 12:33:48";s:12:"english_name";s:8:"Gujarati";s:11:"native_name";s:21:"ગુજરાતી";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/4.9.20/gu.zip";s:3:"iso";a:2:{i:1;s:2:"gu";i:2;s:3:"guj";}s:7:"strings";a:1:{s:8:"continue";s:31:"ચાલુ રાખવું";}}s:3:"haz";a:8:{s:8:"language";s:3:"haz";s:7:"version";s:6:"4.4.27";s:7:"updated";s:19:"2015-12-05 00:59:09";s:12:"english_name";s:8:"Hazaragi";s:11:"native_name";s:15:"هزاره گی";s:7:"package";s:63:"https://downloads.wordpress.org/translation/core/4.4.27/haz.zip";s:3:"iso";a:1:{i:3;s:3:"haz";}s:7:"strings";a:1:{s:8:"continue";s:10:"ادامه";}}s:5:"he_IL";a:8:{s:8:"language";s:5:"he_IL";s:7:"version";s:3:"5.9";s:7:"updated";s:19:"2022-02-14 22:20:29";s:12:"english_name";s:6:"Hebrew";s:11:"native_name";s:16:"עִבְרִית";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/5.9/he_IL.zip";s:3:"iso";a:1:{i:1;s:2:"he";}s:7:"strings";a:1:{s:8:"continue";s:8:"המשך";}}s:5:"hi_IN";a:8:{s:8:"language";s:5:"hi_IN";s:7:"version";s:6:"5.4.10";s:7:"updated";s:19:"2020-11-06 12:34:38";s:12:"english_name";s:5:"Hindi";s:11:"native_name";s:18:"हिन्दी";s:7:"package";s:65:"https://downloads.wordpress.org/translation/core/5.4.10/hi_IN.zip";s:3:"iso";a:2:{i:1;s:2:"hi";i:2;s:3:"hin";}s:7:"strings";a:1:{s:8:"continue";s:25:"जारी रखें";}}s:2:"hr";a:8:{s:8:"language";s:2:"hr";s:7:"version";s:3:"5.9";s:7:"updated";s:19:"2022-02-19 12:13:00";s:12:"english_name";s:8:"Croatian";s:11:"native_name";s:8:"Hrvatski";s:7:"package";s:59:"https://downloads.wordpress.org/translation/core/5.9/hr.zip";s:3:"iso";a:2:{i:1;s:2:"hr";i:2;s:3:"hrv";}s:7:"strings";a:1:{s:8:"continue";s:7:"Nastavi";}}s:3:"hsb";a:8:{s:8:"language";s:3:"hsb";s:7:"version";s:3:"5.9";s:7:"updated";s:19:"2022-02-18 15:32:05";s:12:"english_name";s:13:"Upper Sorbian";s:11:"native_name";s:17:"Hornjoserbšćina";s:7:"package";s:60:"https://downloads.wordpress.org/translation/core/5.9/hsb.zip";s:3:"iso";a:2:{i:2;s:3:"hsb";i:3;s:3:"hsb";}s:7:"strings";a:1:{s:8:"continue";s:4:"Dale";}}s:5:"hu_HU";a:8:{s:8:"language";s:5:"hu_HU";s:7:"version";s:3:"5.9";s:7:"updated";s:19:"2022-02-10 12:33:31";s:12:"english_name";s:9:"Hungarian";s:11:"native_name";s:6:"Magyar";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/5.9/hu_HU.zip";s:3:"iso";a:2:{i:1;s:2:"hu";i:2;s:3:"hun";}s:7:"strings";a:1:{s:8:"continue";s:10:"Folytatás";}}s:2:"hy";a:8:{s:8:"language";s:2:"hy";s:7:"version";s:5:"4.7.2";s:7:"updated";s:19:"2016-12-03 16:21:10";s:12:"english_name";s:8:"Armenian";s:11:"native_name";s:14:"Հայերեն";s:7:"package";s:61:"https://downloads.wordpress.org/translation/core/4.7.2/hy.zip";s:3:"iso";a:2:{i:1;s:2:"hy";i:2;s:3:"hye";}s:7:"strings";a:1:{s:8:"continue";s:20:"Շարունակել";}}s:5:"id_ID";a:8:{s:8:"language";s:5:"id_ID";s:7:"version";s:3:"5.9";s:7:"updated";s:19:"2022-02-22 09:07:27";s:12:"english_name";s:10:"Indonesian";s:11:"native_name";s:16:"Bahasa Indonesia";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/5.9/id_ID.zip";s:3:"iso";a:2:{i:1;s:2:"id";i:2;s:3:"ind";}s:7:"strings";a:1:{s:8:"continue";s:9:"Lanjutkan";}}s:5:"is_IS";a:8:{s:8:"language";s:5:"is_IS";s:7:"version";s:6:"4.9.20";s:7:"updated";s:19:"2018-12-11 10:40:02";s:12:"english_name";s:9:"Icelandic";s:11:"native_name";s:9:"Íslenska";s:7:"package";s:65:"https://downloads.wordpress.org/translation/core/4.9.20/is_IS.zip";s:3:"iso";a:2:{i:1;s:2:"is";i:2;s:3:"isl";}s:7:"strings";a:1:{s:8:"continue";s:6:"Áfram";}}s:5:"it_IT";a:8:{s:8:"language";s:5:"it_IT";s:7:"version";s:3:"5.9";s:7:"updated";s:19:"2022-02-17 21:11:54";s:12:"english_name";s:7:"Italian";s:11:"native_name";s:8:"Italiano";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/5.9/it_IT.zip";s:3:"iso";a:2:{i:1;s:2:"it";i:2;s:3:"ita";}s:7:"strings";a:1:{s:8:"continue";s:8:"Continua";}}s:2:"ja";a:8:{s:8:"language";s:2:"ja";s:7:"version";s:3:"5.9";s:7:"updated";s:19:"2022-02-18 13:43:33";s:12:"english_name";s:8:"Japanese";s:11:"native_name";s:9:"日本語";s:7:"package";s:59:"https://downloads.wordpress.org/translation/core/5.9/ja.zip";s:3:"iso";a:1:{i:1;s:2:"ja";}s:7:"strings";a:1:{s:8:"continue";s:6:"次へ";}}s:5:"jv_ID";a:8:{s:8:"language";s:5:"jv_ID";s:7:"version";s:6:"4.9.20";s:7:"updated";s:19:"2019-02-16 23:58:56";s:12:"english_name";s:8:"Javanese";s:11:"native_name";s:9:"Basa Jawa";s:7:"package";s:65:"https://downloads.wordpress.org/translation/core/4.9.20/jv_ID.zip";s:3:"iso";a:2:{i:1;s:2:"jv";i:2;s:3:"jav";}s:7:"strings";a:1:{s:8:"continue";s:9:"Nerusaké";}}s:5:"ka_GE";a:8:{s:8:"language";s:5:"ka_GE";s:7:"version";s:3:"5.9";s:7:"updated";s:19:"2022-01-24 08:56:29";s:12:"english_name";s:8:"Georgian";s:11:"native_name";s:21:"ქართული";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/5.9/ka_GE.zip";s:3:"iso";a:2:{i:1;s:2:"ka";i:2;s:3:"kat";}s:7:"strings";a:1:{s:8:"continue";s:30:"გაგრძელება";}}s:3:"kab";a:8:{s:8:"language";s:3:"kab";s:7:"version";s:3:"5.9";s:7:"updated";s:19:"2022-02-12 10:34:12";s:12:"english_name";s:6:"Kabyle";s:11:"native_name";s:9:"Taqbaylit";s:7:"package";s:60:"https://downloads.wordpress.org/translation/core/5.9/kab.zip";s:3:"iso";a:2:{i:2;s:3:"kab";i:3;s:3:"kab";}s:7:"strings";a:1:{s:8:"continue";s:6:"Kemmel";}}s:2:"kk";a:8:{s:8:"language";s:2:"kk";s:7:"version";s:6:"4.9.20";s:7:"updated";s:19:"2018-07-10 11:35:44";s:12:"english_name";s:6:"Kazakh";s:11:"native_name";s:19:"Қазақ тілі";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/4.9.20/kk.zip";s:3:"iso";a:2:{i:1;s:2:"kk";i:2;s:3:"kaz";}s:7:"strings";a:1:{s:8:"continue";s:20:"Жалғастыру";}}s:2:"km";a:8:{s:8:"language";s:2:"km";s:7:"version";s:6:"5.2.15";s:7:"updated";s:19:"2019-06-10 16:18:28";s:12:"english_name";s:5:"Khmer";s:11:"native_name";s:27:"ភាសាខ្មែរ";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/5.2.15/km.zip";s:3:"iso";a:2:{i:1;s:2:"km";i:2;s:3:"khm";}s:7:"strings";a:1:{s:8:"continue";s:12:"បន្ត";}}s:2:"kn";a:8:{s:8:"language";s:2:"kn";s:7:"version";s:3:"5.9";s:7:"updated";s:19:"2022-01-26 16:57:20";s:12:"english_name";s:7:"Kannada";s:11:"native_name";s:15:"ಕನ್ನಡ";s:7:"package";s:59:"https://downloads.wordpress.org/translation/core/5.9/kn.zip";s:3:"iso";a:2:{i:1;s:2:"kn";i:2;s:3:"kan";}s:7:"strings";a:1:{s:8:"continue";s:30:"ಮುಂದುವರಿಸು";}}s:5:"ko_KR";a:8:{s:8:"language";s:5:"ko_KR";s:7:"version";s:3:"5.9";s:7:"updated";s:19:"2022-01-26 09:01:56";s:12:"english_name";s:6:"Korean";s:11:"native_name";s:9:"한국어";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/5.9/ko_KR.zip";s:3:"iso";a:2:{i:1;s:2:"ko";i:2;s:3:"kor";}s:7:"strings";a:1:{s:8:"continue";s:6:"계속";}}s:3:"ckb";a:8:{s:8:"language";s:3:"ckb";s:7:"version";s:5:"5.8.4";s:7:"updated";s:19:"2021-12-07 16:32:30";s:12:"english_name";s:16:"Kurdish (Sorani)";s:11:"native_name";s:13:"كوردی‎";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/5.8.4/ckb.zip";s:3:"iso";a:2:{i:1;s:2:"ku";i:3;s:3:"ckb";}s:7:"strings";a:1:{s:8:"continue";s:30:"به‌رده‌وام به‌";}}s:2:"lo";a:8:{s:8:"language";s:2:"lo";s:7:"version";s:5:"4.7.2";s:7:"updated";s:19:"2016-11-12 09:59:23";s:12:"english_name";s:3:"Lao";s:11:"native_name";s:21:"ພາສາລາວ";s:7:"package";s:61:"https://downloads.wordpress.org/translation/core/4.7.2/lo.zip";s:3:"iso";a:2:{i:1;s:2:"lo";i:2;s:3:"lao";}s:7:"strings";a:1:{s:8:"continue";s:18:"ຕໍ່​ໄປ";}}s:5:"lt_LT";a:8:{s:8:"language";s:5:"lt_LT";s:7:"version";s:8:"5.8-beta";s:7:"updated";s:19:"2021-03-23 12:35:40";s:12:"english_name";s:10:"Lithuanian";s:11:"native_name";s:15:"Lietuvių kalba";s:7:"package";s:67:"https://downloads.wordpress.org/translation/core/5.8-beta/lt_LT.zip";s:3:"iso";a:2:{i:1;s:2:"lt";i:2;s:3:"lit";}s:7:"strings";a:1:{s:8:"continue";s:6:"Tęsti";}}s:2:"lv";a:8:{s:8:"language";s:2:"lv";s:7:"version";s:3:"5.9";s:7:"updated";s:19:"2022-02-13 16:36:31";s:12:"english_name";s:7:"Latvian";s:11:"native_name";s:16:"Latviešu valoda";s:7:"package";s:59:"https://downloads.wordpress.org/translation/core/5.9/lv.zip";s:3:"iso";a:2:{i:1;s:2:"lv";i:2;s:3:"lav";}s:7:"strings";a:1:{s:8:"continue";s:9:"Turpināt";}}s:5:"mk_MK";a:8:{s:8:"language";s:5:"mk_MK";s:7:"version";s:6:"5.4.10";s:7:"updated";s:19:"2020-07-01 09:16:57";s:12:"english_name";s:10:"Macedonian";s:11:"native_name";s:31:"Македонски јазик";s:7:"package";s:65:"https://downloads.wordpress.org/translation/core/5.4.10/mk_MK.zip";s:3:"iso";a:2:{i:1;s:2:"mk";i:2;s:3:"mkd";}s:7:"strings";a:1:{s:8:"continue";s:16:"Продолжи";}}s:5:"ml_IN";a:8:{s:8:"language";s:5:"ml_IN";s:7:"version";s:5:"4.7.2";s:7:"updated";s:19:"2017-01-27 03:43:32";s:12:"english_name";s:9:"Malayalam";s:11:"native_name";s:18:"മലയാളം";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.7.2/ml_IN.zip";s:3:"iso";a:2:{i:1;s:2:"ml";i:2;s:3:"mal";}s:7:"strings";a:1:{s:8:"continue";s:18:"തുടരുക";}}s:2:"mn";a:8:{s:8:"language";s:2:"mn";s:7:"version";s:5:"4.7.2";s:7:"updated";s:19:"2017-01-12 07:29:35";s:12:"english_name";s:9:"Mongolian";s:11:"native_name";s:12:"Монгол";s:7:"package";s:61:"https://downloads.wordpress.org/translation/core/4.7.2/mn.zip";s:3:"iso";a:2:{i:1;s:2:"mn";i:2;s:3:"mon";}s:7:"strings";a:1:{s:8:"continue";s:24:"Үргэлжлүүлэх";}}s:2:"mr";a:8:{s:8:"language";s:2:"mr";s:7:"version";s:6:"4.9.20";s:7:"updated";s:19:"2019-11-22 15:32:08";s:12:"english_name";s:7:"Marathi";s:11:"native_name";s:15:"मराठी";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/4.9.20/mr.zip";s:3:"iso";a:2:{i:1;s:2:"mr";i:2;s:3:"mar";}s:7:"strings";a:1:{s:8:"continue";s:25:"सुरु ठेवा";}}s:5:"ms_MY";a:8:{s:8:"language";s:5:"ms_MY";s:7:"version";s:5:"5.5.9";s:7:"updated";s:19:"2022-03-11 13:52:22";s:12:"english_name";s:5:"Malay";s:11:"native_name";s:13:"Bahasa Melayu";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/5.5.9/ms_MY.zip";s:3:"iso";a:2:{i:1;s:2:"ms";i:2;s:3:"msa";}s:7:"strings";a:1:{s:8:"continue";s:8:"Teruskan";}}s:5:"my_MM";a:8:{s:8:"language";s:5:"my_MM";s:7:"version";s:6:"4.2.32";s:7:"updated";s:19:"2017-12-26 11:57:10";s:12:"english_name";s:17:"Myanmar (Burmese)";s:11:"native_name";s:15:"ဗမာစာ";s:7:"package";s:65:"https://downloads.wordpress.org/translation/core/4.2.32/my_MM.zip";s:3:"iso";a:2:{i:1;s:2:"my";i:2;s:3:"mya";}s:7:"strings";a:1:{s:8:"continue";s:54:"ဆက်လက်လုပ်ဆောင်ပါ။";}}s:5:"nb_NO";a:8:{s:8:"language";s:5:"nb_NO";s:7:"version";s:3:"5.9";s:7:"updated";s:19:"2022-01-25 07:32:23";s:12:"english_name";s:19:"Norwegian (Bokmål)";s:11:"native_name";s:13:"Norsk bokmål";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/5.9/nb_NO.zip";s:3:"iso";a:2:{i:1;s:2:"nb";i:2;s:3:"nob";}s:7:"strings";a:1:{s:8:"continue";s:8:"Fortsett";}}s:5:"ne_NP";a:8:{s:8:"language";s:5:"ne_NP";s:7:"version";s:3:"5.9";s:7:"updated";s:19:"2022-02-22 14:59:53";s:12:"english_name";s:6:"Nepali";s:11:"native_name";s:18:"नेपाली";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/5.9/ne_NP.zip";s:3:"iso";a:2:{i:1;s:2:"ne";i:2;s:3:"nep";}s:7:"strings";a:1:{s:8:"continue";s:43:"जारी राख्नुहोस्";}}s:5:"nl_BE";a:8:{s:8:"language";s:5:"nl_BE";s:7:"version";s:3:"5.9";s:7:"updated";s:19:"2022-02-18 14:37:14";s:12:"english_name";s:15:"Dutch (Belgium)";s:11:"native_name";s:20:"Nederlands (België)";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/5.9/nl_BE.zip";s:3:"iso";a:2:{i:1;s:2:"nl";i:2;s:3:"nld";}s:7:"strings";a:1:{s:8:"continue";s:8:"Doorgaan";}}s:12:"nl_NL_formal";a:8:{s:8:"language";s:12:"nl_NL_formal";s:7:"version";s:3:"5.9";s:7:"updated";s:19:"2022-01-25 09:29:37";s:12:"english_name";s:14:"Dutch (Formal)";s:11:"native_name";s:20:"Nederlands (Formeel)";s:7:"package";s:69:"https://downloads.wordpress.org/translation/core/5.9/nl_NL_formal.zip";s:3:"iso";a:2:{i:1;s:2:"nl";i:2;s:3:"nld";}s:7:"strings";a:1:{s:8:"continue";s:8:"Doorgaan";}}s:5:"nl_NL";a:8:{s:8:"language";s:5:"nl_NL";s:7:"version";s:3:"5.9";s:7:"updated";s:19:"2022-02-21 13:16:58";s:12:"english_name";s:5:"Dutch";s:11:"native_name";s:10:"Nederlands";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/5.9/nl_NL.zip";s:3:"iso";a:2:{i:1;s:2:"nl";i:2;s:3:"nld";}s:7:"strings";a:1:{s:8:"continue";s:8:"Doorgaan";}}s:5:"nn_NO";a:8:{s:8:"language";s:5:"nn_NO";s:7:"version";s:8:"5.8-beta";s:7:"updated";s:19:"2021-03-18 10:59:16";s:12:"english_name";s:19:"Norwegian (Nynorsk)";s:11:"native_name";s:13:"Norsk nynorsk";s:7:"package";s:67:"https://downloads.wordpress.org/translation/core/5.8-beta/nn_NO.zip";s:3:"iso";a:2:{i:1;s:2:"nn";i:2;s:3:"nno";}s:7:"strings";a:1:{s:8:"continue";s:9:"Hald fram";}}s:3:"oci";a:8:{s:8:"language";s:3:"oci";s:7:"version";s:6:"4.8.19";s:7:"updated";s:19:"2017-08-25 10:03:08";s:12:"english_name";s:7:"Occitan";s:11:"native_name";s:7:"Occitan";s:7:"package";s:63:"https://downloads.wordpress.org/translation/core/4.8.19/oci.zip";s:3:"iso";a:2:{i:1;s:2:"oc";i:2;s:3:"oci";}s:7:"strings";a:1:{s:8:"continue";s:9:"Contunhar";}}s:5:"pa_IN";a:8:{s:8:"language";s:5:"pa_IN";s:7:"version";s:5:"4.7.2";s:7:"updated";s:19:"2017-01-16 05:19:43";s:12:"english_name";s:7:"Punjabi";s:11:"native_name";s:18:"ਪੰਜਾਬੀ";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.7.2/pa_IN.zip";s:3:"iso";a:2:{i:1;s:2:"pa";i:2;s:3:"pan";}s:7:"strings";a:1:{s:8:"continue";s:25:"ਜਾਰੀ ਰੱਖੋ";}}s:5:"pl_PL";a:8:{s:8:"language";s:5:"pl_PL";s:7:"version";s:3:"5.9";s:7:"updated";s:19:"2022-02-22 07:36:05";s:12:"english_name";s:6:"Polish";s:11:"native_name";s:6:"Polski";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/5.9/pl_PL.zip";s:3:"iso";a:2:{i:1;s:2:"pl";i:2;s:3:"pol";}s:7:"strings";a:1:{s:8:"continue";s:9:"Kontynuuj";}}s:2:"ps";a:8:{s:8:"language";s:2:"ps";s:7:"version";s:6:"4.3.28";s:7:"updated";s:19:"2015-12-02 21:41:29";s:12:"english_name";s:6:"Pashto";s:11:"native_name";s:8:"پښتو";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/4.3.28/ps.zip";s:3:"iso";a:2:{i:1;s:2:"ps";i:2;s:3:"pus";}s:7:"strings";a:1:{s:8:"continue";s:19:"دوام ورکړه";}}s:5:"pt_PT";a:8:{s:8:"language";s:5:"pt_PT";s:7:"version";s:3:"5.9";s:7:"updated";s:19:"2022-02-21 15:57:46";s:12:"english_name";s:21:"Portuguese (Portugal)";s:11:"native_name";s:10:"Português";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/5.9/pt_PT.zip";s:3:"iso";a:1:{i:1;s:2:"pt";}s:7:"strings";a:1:{s:8:"continue";s:9:"Continuar";}}s:5:"pt_BR";a:8:{s:8:"language";s:5:"pt_BR";s:7:"version";s:3:"5.9";s:7:"updated";s:19:"2022-01-25 17:29:54";s:12:"english_name";s:19:"Portuguese (Brazil)";s:11:"native_name";s:20:"Português do Brasil";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/5.9/pt_BR.zip";s:3:"iso";a:2:{i:1;s:2:"pt";i:2;s:3:"por";}s:7:"strings";a:1:{s:8:"continue";s:9:"Continuar";}}s:10:"pt_PT_ao90";a:8:{s:8:"language";s:10:"pt_PT_ao90";s:7:"version";s:5:"5.8.4";s:7:"updated";s:19:"2021-09-09 21:40:55";s:12:"english_name";s:27:"Portuguese (Portugal, AO90)";s:11:"native_name";s:17:"Português (AO90)";s:7:"package";s:69:"https://downloads.wordpress.org/translation/core/5.8.4/pt_PT_ao90.zip";s:3:"iso";a:1:{i:1;s:2:"pt";}s:7:"strings";a:1:{s:8:"continue";s:9:"Continuar";}}s:5:"pt_AO";a:8:{s:8:"language";s:5:"pt_AO";s:7:"version";s:5:"5.8.4";s:7:"updated";s:19:"2021-11-27 16:28:47";s:12:"english_name";s:19:"Portuguese (Angola)";s:11:"native_name";s:20:"Português de Angola";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/5.8.4/pt_AO.zip";s:3:"iso";a:1:{i:1;s:2:"pt";}s:7:"strings";a:1:{s:8:"continue";s:9:"Continuar";}}s:3:"rhg";a:8:{s:8:"language";s:3:"rhg";s:7:"version";s:5:"4.7.2";s:7:"updated";s:19:"2016-03-16 13:03:18";s:12:"english_name";s:8:"Rohingya";s:11:"native_name";s:8:"Ruáinga";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/4.7.2/rhg.zip";s:3:"iso";a:1:{i:3;s:3:"rhg";}s:7:"strings";a:1:{s:8:"continue";s:8:"Continue";}}s:5:"ro_RO";a:8:{s:8:"language";s:5:"ro_RO";s:7:"version";s:3:"5.9";s:7:"updated";s:19:"2022-02-21 12:28:45";s:12:"english_name";s:8:"Romanian";s:11:"native_name";s:8:"Română";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/5.9/ro_RO.zip";s:3:"iso";a:2:{i:1;s:2:"ro";i:2;s:3:"ron";}s:7:"strings";a:1:{s:8:"continue";s:9:"Continuă";}}s:5:"ru_RU";a:8:{s:8:"language";s:5:"ru_RU";s:7:"version";s:3:"5.9";s:7:"updated";s:19:"2022-02-17 21:26:10";s:12:"english_name";s:7:"Russian";s:11:"native_name";s:14:"Русский";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/5.9/ru_RU.zip";s:3:"iso";a:2:{i:1;s:2:"ru";i:2;s:3:"rus";}s:7:"strings";a:1:{s:8:"continue";s:20:"Продолжить";}}s:3:"sah";a:8:{s:8:"language";s:3:"sah";s:7:"version";s:5:"4.7.2";s:7:"updated";s:19:"2017-01-21 02:06:41";s:12:"english_name";s:5:"Sakha";s:11:"native_name";s:14:"Сахалыы";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/4.7.2/sah.zip";s:3:"iso";a:2:{i:2;s:3:"sah";i:3;s:3:"sah";}s:7:"strings";a:1:{s:8:"continue";s:12:"Салҕаа";}}s:3:"snd";a:8:{s:8:"language";s:3:"snd";s:7:"version";s:6:"5.4.10";s:7:"updated";s:19:"2020-07-07 01:53:37";s:12:"english_name";s:6:"Sindhi";s:11:"native_name";s:8:"سنڌي";s:7:"package";s:63:"https://downloads.wordpress.org/translation/core/5.4.10/snd.zip";s:3:"iso";a:3:{i:1;s:2:"sd";i:2;s:3:"snd";i:3;s:3:"snd";}s:7:"strings";a:1:{s:8:"continue";s:15:"اڳتي هلو";}}s:5:"si_LK";a:8:{s:8:"language";s:5:"si_LK";s:7:"version";s:5:"4.7.2";s:7:"updated";s:19:"2016-11-12 06:00:52";s:12:"english_name";s:7:"Sinhala";s:11:"native_name";s:15:"සිංහල";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.7.2/si_LK.zip";s:3:"iso";a:2:{i:1;s:2:"si";i:2;s:3:"sin";}s:7:"strings";a:1:{s:8:"continue";s:44:"දිගටම කරගෙන යන්න";}}s:5:"sk_SK";a:8:{s:8:"language";s:5:"sk_SK";s:7:"version";s:3:"5.9";s:7:"updated";s:19:"2022-02-18 12:15:44";s:12:"english_name";s:6:"Slovak";s:11:"native_name";s:11:"Slovenčina";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/5.9/sk_SK.zip";s:3:"iso";a:2:{i:1;s:2:"sk";i:2;s:3:"slk";}s:7:"strings";a:1:{s:8:"continue";s:12:"Pokračovať";}}s:3:"skr";a:8:{s:8:"language";s:3:"skr";s:7:"version";s:3:"5.9";s:7:"updated";s:19:"2022-01-24 13:37:43";s:12:"english_name";s:7:"Saraiki";s:11:"native_name";s:14:"سرائیکی";s:7:"package";s:60:"https://downloads.wordpress.org/translation/core/5.9/skr.zip";s:3:"iso";a:1:{i:3;s:3:"skr";}s:7:"strings";a:1:{s:8:"continue";s:17:"جاری رکھو";}}s:5:"sl_SI";a:8:{s:8:"language";s:5:"sl_SI";s:7:"version";s:3:"5.9";s:7:"updated";s:19:"2022-02-01 10:20:40";s:12:"english_name";s:9:"Slovenian";s:11:"native_name";s:13:"Slovenščina";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/5.9/sl_SI.zip";s:3:"iso";a:2:{i:1;s:2:"sl";i:2;s:3:"slv";}s:7:"strings";a:1:{s:8:"continue";s:8:"Nadaljuj";}}s:2:"sq";a:8:{s:8:"language";s:2:"sq";s:7:"version";s:3:"5.9";s:7:"updated";s:19:"2022-02-18 10:26:09";s:12:"english_name";s:8:"Albanian";s:11:"native_name";s:5:"Shqip";s:7:"package";s:59:"https://downloads.wordpress.org/translation/core/5.9/sq.zip";s:3:"iso";a:2:{i:1;s:2:"sq";i:2;s:3:"sqi";}s:7:"strings";a:1:{s:8:"continue";s:6:"Vazhdo";}}s:5:"sr_RS";a:8:{s:8:"language";s:5:"sr_RS";s:7:"version";s:5:"5.8.4";s:7:"updated";s:19:"2021-08-01 21:21:06";s:12:"english_name";s:7:"Serbian";s:11:"native_name";s:23:"Српски језик";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/5.8.4/sr_RS.zip";s:3:"iso";a:2:{i:1;s:2:"sr";i:2;s:3:"srp";}s:7:"strings";a:1:{s:8:"continue";s:14:"Настави";}}s:5:"sv_SE";a:8:{s:8:"language";s:5:"sv_SE";s:7:"version";s:3:"5.9";s:7:"updated";s:19:"2022-02-21 19:23:12";s:12:"english_name";s:7:"Swedish";s:11:"native_name";s:7:"Svenska";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/5.9/sv_SE.zip";s:3:"iso";a:2:{i:1;s:2:"sv";i:2;s:3:"swe";}s:7:"strings";a:1:{s:8:"continue";s:9:"Fortsätt";}}s:2:"sw";a:8:{s:8:"language";s:2:"sw";s:7:"version";s:6:"5.3.12";s:7:"updated";s:19:"2019-10-13 15:35:35";s:12:"english_name";s:7:"Swahili";s:11:"native_name";s:9:"Kiswahili";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/5.3.12/sw.zip";s:3:"iso";a:2:{i:1;s:2:"sw";i:2;s:3:"swa";}s:7:"strings";a:1:{s:8:"continue";s:7:"Endelea";}}s:3:"szl";a:8:{s:8:"language";s:3:"szl";s:7:"version";s:5:"4.7.2";s:7:"updated";s:19:"2016-09-24 19:58:14";s:12:"english_name";s:8:"Silesian";s:11:"native_name";s:17:"Ślōnskŏ gŏdka";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/4.7.2/szl.zip";s:3:"iso";a:1:{i:3;s:3:"szl";}s:7:"strings";a:1:{s:8:"continue";s:13:"Kōntynuować";}}s:5:"ta_IN";a:8:{s:8:"language";s:5:"ta_IN";s:7:"version";s:5:"4.7.2";s:7:"updated";s:19:"2017-01-27 03:22:47";s:12:"english_name";s:5:"Tamil";s:11:"native_name";s:15:"தமிழ்";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.7.2/ta_IN.zip";s:3:"iso";a:2:{i:1;s:2:"ta";i:2;s:3:"tam";}s:7:"strings";a:1:{s:8:"continue";s:24:"தொடரவும்";}}s:5:"ta_LK";a:8:{s:8:"language";s:5:"ta_LK";s:7:"version";s:6:"4.2.32";s:7:"updated";s:19:"2015-12-03 01:07:44";s:12:"english_name";s:17:"Tamil (Sri Lanka)";s:11:"native_name";s:15:"தமிழ்";s:7:"package";s:65:"https://downloads.wordpress.org/translation/core/4.2.32/ta_LK.zip";s:3:"iso";a:2:{i:1;s:2:"ta";i:2;s:3:"tam";}s:7:"strings";a:1:{s:8:"continue";s:18:"தொடர்க";}}s:2:"te";a:8:{s:8:"language";s:2:"te";s:7:"version";s:5:"4.7.2";s:7:"updated";s:19:"2017-01-26 15:47:39";s:12:"english_name";s:6:"Telugu";s:11:"native_name";s:18:"తెలుగు";s:7:"package";s:61:"https://downloads.wordpress.org/translation/core/4.7.2/te.zip";s:3:"iso";a:2:{i:1;s:2:"te";i:2;s:3:"tel";}s:7:"strings";a:1:{s:8:"continue";s:30:"కొనసాగించు";}}s:2:"th";a:8:{s:8:"language";s:2:"th";s:7:"version";s:5:"5.8.4";s:7:"updated";s:19:"2021-12-28 02:58:38";s:12:"english_name";s:4:"Thai";s:11:"native_name";s:9:"ไทย";s:7:"package";s:61:"https://downloads.wordpress.org/translation/core/5.8.4/th.zip";s:3:"iso";a:2:{i:1;s:2:"th";i:2;s:3:"tha";}s:7:"strings";a:1:{s:8:"continue";s:15:"ต่อไป";}}s:2:"tl";a:8:{s:8:"language";s:2:"tl";s:7:"version";s:6:"4.8.19";s:7:"updated";s:19:"2017-09-30 09:04:29";s:12:"english_name";s:7:"Tagalog";s:11:"native_name";s:7:"Tagalog";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/4.8.19/tl.zip";s:3:"iso";a:2:{i:1;s:2:"tl";i:2;s:3:"tgl";}s:7:"strings";a:1:{s:8:"continue";s:10:"Magpatuloy";}}s:5:"tr_TR";a:8:{s:8:"language";s:5:"tr_TR";s:7:"version";s:3:"5.9";s:7:"updated";s:19:"2022-01-25 01:31:24";s:12:"english_name";s:7:"Turkish";s:11:"native_name";s:8:"Türkçe";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/5.9/tr_TR.zip";s:3:"iso";a:2:{i:1;s:2:"tr";i:2;s:3:"tur";}s:7:"strings";a:1:{s:8:"continue";s:5:"Devam";}}s:5:"tt_RU";a:8:{s:8:"language";s:5:"tt_RU";s:7:"version";s:5:"4.7.2";s:7:"updated";s:19:"2016-11-20 20:20:50";s:12:"english_name";s:5:"Tatar";s:11:"native_name";s:19:"Татар теле";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.7.2/tt_RU.zip";s:3:"iso";a:2:{i:1;s:2:"tt";i:2;s:3:"tat";}s:7:"strings";a:1:{s:8:"continue";s:17:"дәвам итү";}}s:3:"tah";a:8:{s:8:"language";s:3:"tah";s:7:"version";s:5:"4.7.2";s:7:"updated";s:19:"2016-03-06 18:39:39";s:12:"english_name";s:8:"Tahitian";s:11:"native_name";s:10:"Reo Tahiti";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/4.7.2/tah.zip";s:3:"iso";a:3:{i:1;s:2:"ty";i:2;s:3:"tah";i:3;s:3:"tah";}s:7:"strings";a:1:{s:8:"continue";s:8:"Continue";}}s:5:"ug_CN";a:8:{s:8:"language";s:5:"ug_CN";s:7:"version";s:6:"4.9.20";s:7:"updated";s:19:"2021-07-03 18:41:33";s:12:"english_name";s:6:"Uighur";s:11:"native_name";s:16:"ئۇيغۇرچە";s:7:"package";s:65:"https://downloads.wordpress.org/translation/core/4.9.20/ug_CN.zip";s:3:"iso";a:2:{i:1;s:2:"ug";i:2;s:3:"uig";}s:7:"strings";a:1:{s:8:"continue";s:26:"داۋاملاشتۇرۇش";}}s:2:"uk";a:8:{s:8:"language";s:2:"uk";s:7:"version";s:5:"5.8.4";s:7:"updated";s:19:"2022-03-06 15:05:20";s:12:"english_name";s:9:"Ukrainian";s:11:"native_name";s:20:"Українська";s:7:"package";s:61:"https://downloads.wordpress.org/translation/core/5.8.4/uk.zip";s:3:"iso";a:2:{i:1;s:2:"uk";i:2;s:3:"ukr";}s:7:"strings";a:1:{s:8:"continue";s:20:"Продовжити";}}s:2:"ur";a:8:{s:8:"language";s:2:"ur";s:7:"version";s:6:"5.4.10";s:7:"updated";s:19:"2020-04-09 11:17:33";s:12:"english_name";s:4:"Urdu";s:11:"native_name";s:8:"اردو";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/5.4.10/ur.zip";s:3:"iso";a:2:{i:1;s:2:"ur";i:2;s:3:"urd";}s:7:"strings";a:1:{s:8:"continue";s:19:"جاری رکھیں";}}s:5:"uz_UZ";a:8:{s:8:"language";s:5:"uz_UZ";s:7:"version";s:8:"5.8-beta";s:7:"updated";s:19:"2021-02-28 12:02:22";s:12:"english_name";s:5:"Uzbek";s:11:"native_name";s:11:"O‘zbekcha";s:7:"package";s:67:"https://downloads.wordpress.org/translation/core/5.8-beta/uz_UZ.zip";s:3:"iso";a:2:{i:1;s:2:"uz";i:2;s:3:"uzb";}s:7:"strings";a:1:{s:8:"continue";s:11:"Davom etish";}}s:2:"vi";a:8:{s:8:"language";s:2:"vi";s:7:"version";s:5:"5.8.4";s:7:"updated";s:19:"2021-11-16 07:16:28";s:12:"english_name";s:10:"Vietnamese";s:11:"native_name";s:14:"Tiếng Việt";s:7:"package";s:61:"https://downloads.wordpress.org/translation/core/5.8.4/vi.zip";s:3:"iso";a:2:{i:1;s:2:"vi";i:2;s:3:"vie";}s:7:"strings";a:1:{s:8:"continue";s:12:"Tiếp tục";}}s:5:"zh_TW";a:8:{s:8:"language";s:5:"zh_TW";s:7:"version";s:3:"5.9";s:7:"updated";s:19:"2022-02-22 09:18:42";s:12:"english_name";s:16:"Chinese (Taiwan)";s:11:"native_name";s:12:"繁體中文";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/5.9/zh_TW.zip";s:3:"iso";a:2:{i:1;s:2:"zh";i:2;s:3:"zho";}s:7:"strings";a:1:{s:8:"continue";s:6:"繼續";}}s:5:"zh_HK";a:8:{s:8:"language";s:5:"zh_HK";s:7:"version";s:3:"5.9";s:7:"updated";s:19:"2022-02-18 15:24:27";s:12:"english_name";s:19:"Chinese (Hong Kong)";s:11:"native_name";s:16:"香港中文版	";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/5.9/zh_HK.zip";s:3:"iso";a:2:{i:1;s:2:"zh";i:2;s:3:"zho";}s:7:"strings";a:1:{s:8:"continue";s:6:"繼續";}}s:5:"zh_CN";a:8:{s:8:"language";s:5:"zh_CN";s:7:"version";s:3:"5.9";s:7:"updated";s:19:"2022-02-21 08:03:32";s:12:"english_name";s:15:"Chinese (China)";s:11:"native_name";s:12:"简体中文";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/5.9/zh_CN.zip";s:3:"iso";a:2:{i:1;s:2:"zh";i:2;s:3:"zho";}s:7:"strings";a:1:{s:8:"continue";s:6:"继续";}}}', 'no'),
(202, 'av_last_core_cleanup', '5.9', 'yes'),
(154, 'recovery_keys', 'a:0:{}', 'yes'),
(156, 'av_cron_lock', '1653350819', 'yes'),
(155, 'av_cron_last', '1653314819', 'yes'),
(157, 'https_detection_errors', 'a:1:{s:20:"https_request_failed";a:1:{i:0;s:24:"Richiesta HTTPS fallita.";}}', 'yes');
INSERT INTO `avwp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(158, '_site_transient_update_core', 'O:8:"stdClass":4:{s:7:"updates";a:4:{i:0;O:8:"stdClass":10:{s:8:"response";s:7:"upgrade";s:8:"download";s:65:"https://downloads.wordpress.org/release/it_IT/wordpress-5.9.3.zip";s:6:"locale";s:5:"it_IT";s:8:"packages";O:8:"stdClass":5:{s:4:"full";s:65:"https://downloads.wordpress.org/release/it_IT/wordpress-5.9.3.zip";s:10:"no_content";s:0:"";s:11:"new_bundled";s:0:"";s:7:"partial";s:0:"";s:8:"rollback";s:0:"";}s:7:"current";s:5:"5.9.3";s:7:"version";s:5:"5.9.3";s:11:"php_version";s:6:"5.6.20";s:13:"mysql_version";s:3:"5.0";s:11:"new_bundled";s:3:"5.9";s:15:"partial_version";s:0:"";}i:1;O:8:"stdClass":10:{s:8:"response";s:7:"upgrade";s:8:"download";s:59:"https://downloads.wordpress.org/release/wordpress-5.9.3.zip";s:6:"locale";s:5:"en_US";s:8:"packages";O:8:"stdClass":5:{s:4:"full";s:59:"https://downloads.wordpress.org/release/wordpress-5.9.3.zip";s:10:"no_content";s:70:"https://downloads.wordpress.org/release/wordpress-5.9.3-no-content.zip";s:11:"new_bundled";s:71:"https://downloads.wordpress.org/release/wordpress-5.9.3-new-bundled.zip";s:7:"partial";s:69:"https://downloads.wordpress.org/release/wordpress-5.9.3-partial-0.zip";s:8:"rollback";s:0:"";}s:7:"current";s:5:"5.9.3";s:7:"version";s:5:"5.9.3";s:11:"php_version";s:6:"5.6.20";s:13:"mysql_version";s:3:"5.0";s:11:"new_bundled";s:3:"5.9";s:15:"partial_version";s:3:"5.9";}i:2;O:8:"stdClass":11:{s:8:"response";s:10:"autoupdate";s:8:"download";s:59:"https://downloads.wordpress.org/release/wordpress-5.9.3.zip";s:6:"locale";s:5:"en_US";s:8:"packages";O:8:"stdClass":5:{s:4:"full";s:59:"https://downloads.wordpress.org/release/wordpress-5.9.3.zip";s:10:"no_content";s:70:"https://downloads.wordpress.org/release/wordpress-5.9.3-no-content.zip";s:11:"new_bundled";s:71:"https://downloads.wordpress.org/release/wordpress-5.9.3-new-bundled.zip";s:7:"partial";s:69:"https://downloads.wordpress.org/release/wordpress-5.9.3-partial-0.zip";s:8:"rollback";s:70:"https://downloads.wordpress.org/release/wordpress-5.9.3-rollback-0.zip";}s:7:"current";s:5:"5.9.3";s:7:"version";s:5:"5.9.3";s:11:"php_version";s:6:"5.6.20";s:13:"mysql_version";s:3:"5.0";s:11:"new_bundled";s:3:"5.9";s:15:"partial_version";s:3:"5.9";s:9:"new_files";s:0:"";}i:3;O:8:"stdClass":11:{s:8:"response";s:10:"autoupdate";s:8:"download";s:59:"https://downloads.wordpress.org/release/wordpress-5.9.2.zip";s:6:"locale";s:5:"en_US";s:8:"packages";O:8:"stdClass":5:{s:4:"full";s:59:"https://downloads.wordpress.org/release/wordpress-5.9.2.zip";s:10:"no_content";s:70:"https://downloads.wordpress.org/release/wordpress-5.9.2-no-content.zip";s:11:"new_bundled";s:71:"https://downloads.wordpress.org/release/wordpress-5.9.2-new-bundled.zip";s:7:"partial";s:69:"https://downloads.wordpress.org/release/wordpress-5.9.2-partial-0.zip";s:8:"rollback";s:70:"https://downloads.wordpress.org/release/wordpress-5.9.2-rollback-0.zip";}s:7:"current";s:5:"5.9.2";s:7:"version";s:5:"5.9.2";s:11:"php_version";s:6:"5.6.20";s:13:"mysql_version";s:3:"5.0";s:11:"new_bundled";s:3:"5.9";s:15:"partial_version";s:3:"5.9";s:9:"new_files";s:0:"";}}s:12:"last_checked";i:1653314818;s:15:"version_checked";s:3:"5.9";s:12:"translations";a:1:{i:0;a:7:{s:4:"type";s:4:"core";s:4:"slug";s:7:"default";s:8:"language";s:5:"it_IT";s:7:"version";s:3:"5.9";s:7:"updated";s:19:"2022-02-17 21:11:54";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/5.9/it_IT.zip";s:10:"autoupdate";b:1;}}}', 'no'),
(159, '_site_transient_update_plugins', 'O:8:"stdClass":4:{s:12:"last_checked";i:1653314818;s:8:"response";a:0:{}s:12:"translations";a:0:{}s:9:"no_update";a:0:{}}', 'no'),
(253, '_site_transient_timeout_theme_roots', '1653316619', 'no'),
(254, '_site_transient_theme_roots', 'a:11:{s:24:"av-seamless-buonericette";s:49:"/membri/.dummy/_av_share/master/wp_themes/desktop";s:26:"av-seamless-cooking-flavor";s:49:"/membri/.dummy/_av_share/master/wp_themes/desktop";s:17:"av-seamless-frida";s:49:"/membri/.dummy/_av_share/master/wp_themes/desktop";s:23:"av-seamless-just-pretty";s:49:"/membri/.dummy/_av_share/master/wp_themes/desktop";s:17:"av-seamless-keith";s:49:"/membri/.dummy/_av_share/master/wp_themes/desktop";s:15:"av-seamless-mag";s:49:"/membri/.dummy/_av_share/master/wp_themes/desktop";s:16:"av-seamless-news";s:49:"/membri/.dummy/_av_share/master/wp_themes/desktop";s:20:"av-seamless-primrose";s:49:"/membri/.dummy/_av_share/master/wp_themes/desktop";s:16:"av-seamless-rene";s:49:"/membri/.dummy/_av_share/master/wp_themes/desktop";s:23:"av-seamless-starry-food";s:49:"/membri/.dummy/_av_share/master/wp_themes/desktop";s:5:"keith";s:7:"/themes";}', 'no'),
(232, '_site_transient_timeout_php_check_5eeb014a565a9828e793356024c4607d', '1653495858', 'no'),
(233, '_site_transient_php_check_5eeb014a565a9828e793356024c4607d', 'a:5:{s:19:"recommended_version";s:3:"7.4";s:15:"minimum_version";s:6:"5.6.20";s:12:"is_supported";b:0;s:9:"is_secure";b:1;s:13:"is_acceptable";b:1;}', 'no'),
(164, '_transient_health-check-site-status-result', '{"good":14,"recommended":3,"critical":2}', 'yes');

-- --------------------------------------------------------

--
-- Struttura della tabella `avwp_postmeta`
--

CREATE TABLE IF NOT EXISTS `avwp_postmeta` (
  `meta_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `post_id` bigint unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_520_ci,
  PRIMARY KEY (`meta_id`),
  KEY `post_id` (`post_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=MyISAM  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci AUTO_INCREMENT=26 ;

--
-- Dump dei dati per la tabella `avwp_postmeta`
--

INSERT INTO `avwp_postmeta` (`meta_id`, `post_id`, `meta_key`, `meta_value`) VALUES
(1, 2, '_wp_attached_file', '2022/05/primo-articolo.jpg'),
(2, 2, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:2119;s:6:"height";i:1414;s:4:"file";s:26:"2022/05/primo-articolo.jpg";s:5:"sizes";a:6:{s:6:"medium";a:4:{s:4:"file";s:26:"primo-articolo-300x200.jpg";s:5:"width";i:300;s:6:"height";i:200;s:9:"mime-type";s:10:"image/jpeg";}s:5:"large";a:4:{s:4:"file";s:27:"primo-articolo-1024x683.jpg";s:5:"width";i:1024;s:6:"height";i:683;s:9:"mime-type";s:10:"image/jpeg";}s:9:"thumbnail";a:4:{s:4:"file";s:26:"primo-articolo-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:12:"medium_large";a:4:{s:4:"file";s:26:"primo-articolo-768x512.jpg";s:5:"width";i:768;s:6:"height";i:512;s:9:"mime-type";s:10:"image/jpeg";}s:9:"1536x1536";a:4:{s:4:"file";s:28:"primo-articolo-1536x1025.jpg";s:5:"width";i:1536;s:6:"height";i:1025;s:9:"mime-type";s:10:"image/jpeg";}s:9:"2048x2048";a:4:{s:4:"file";s:28:"primo-articolo-2048x1367.jpg";s:5:"width";i:2048;s:6:"height";i:1367;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:12:{s:8:"aperture";s:3:"1.4";s:6:"credit";s:12:"Getty Images";s:6:"camera";s:10:"NIKON D810";s:7:"caption";s:88:"Little boy aged 8 is looking out of the car window.  Sunny summer day in Tuscany, Italy.";s:17:"created_timestamp";s:10:"1498845162";s:9:"copyright";s:0:"";s:12:"focal_length";s:2:"24";s:3:"iso";s:2:"64";s:13:"shutter_speed";s:6:"0.0002";s:5:"title";s:35:"Happy little boy enjoying road trip";s:11:"orientation";s:1:"1";s:8:"keywords";a:1:{i:0;s:30:"creativecontentbrief,693597351";}}}'),
(3, 1, '_thumbnail_id', '2'),
(4, 1, '_av_example_content', '1'),
(5, 2, '_av_example_content', '1'),
(6, 4, '_wp_attached_file', '2022/05/secondo-articolo.jpg'),
(7, 4, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:1697;s:6:"height";i:1132;s:4:"file";s:28:"2022/05/secondo-articolo.jpg";s:5:"sizes";a:5:{s:6:"medium";a:4:{s:4:"file";s:28:"secondo-articolo-300x200.jpg";s:5:"width";i:300;s:6:"height";i:200;s:9:"mime-type";s:10:"image/jpeg";}s:5:"large";a:4:{s:4:"file";s:29:"secondo-articolo-1024x683.jpg";s:5:"width";i:1024;s:6:"height";i:683;s:9:"mime-type";s:10:"image/jpeg";}s:9:"thumbnail";a:4:{s:4:"file";s:28:"secondo-articolo-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:12:"medium_large";a:4:{s:4:"file";s:28:"secondo-articolo-768x512.jpg";s:5:"width";i:768;s:6:"height";i:512;s:9:"mime-type";s:10:"image/jpeg";}s:9:"1536x1536";a:4:{s:4:"file";s:30:"secondo-articolo-1536x1025.jpg";s:5:"width";i:1536;s:6:"height";i:1025;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:12:"Getty Images";s:6:"camera";s:0:"";s:7:"caption";s:72:"Rice Terraces and farming village in Longsheng, Guangxi province, China.";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:6:"KingWu";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:13:"Rice Terraces";s:11:"orientation";s:1:"1";s:8:"keywords";a:1:{i:0;s:64:"Longsheng,Longji Tetian,Non-Urban Scene,Photography,Beauty In Na";}}}'),
(8, 3, '_thumbnail_id', '4'),
(9, 3, '_av_example_content', '1'),
(10, 4, '_av_example_content', '1'),
(11, 6, '_wp_attached_file', '2022/05/terzo-articolo.jpg'),
(12, 6, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:2012;s:6:"height";i:1490;s:4:"file";s:26:"2022/05/terzo-articolo.jpg";s:5:"sizes";a:5:{s:6:"medium";a:4:{s:4:"file";s:26:"terzo-articolo-300x222.jpg";s:5:"width";i:300;s:6:"height";i:222;s:9:"mime-type";s:10:"image/jpeg";}s:5:"large";a:4:{s:4:"file";s:27:"terzo-articolo-1024x758.jpg";s:5:"width";i:1024;s:6:"height";i:758;s:9:"mime-type";s:10:"image/jpeg";}s:9:"thumbnail";a:4:{s:4:"file";s:26:"terzo-articolo-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:12:"medium_large";a:4:{s:4:"file";s:26:"terzo-articolo-768x569.jpg";s:5:"width";i:768;s:6:"height";i:569;s:9:"mime-type";s:10:"image/jpeg";}s:9:"1536x1536";a:4:{s:4:"file";s:28:"terzo-articolo-1536x1137.jpg";s:5:"width";i:1536;s:6:"height";i:1137;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:12:{s:8:"aperture";s:3:"5.6";s:6:"credit";s:12:"Getty Images";s:6:"camera";s:20:"Canon EOS 5D Mark II";s:7:"caption";s:47:"Beautiful girl eating pizza in a modern kitchen";s:17:"created_timestamp";s:10:"1516892927";s:9:"copyright";s:0:"";s:12:"focal_length";s:2:"24";s:3:"iso";s:3:"400";s:13:"shutter_speed";s:4:"0.02";s:5:"title";s:47:"Beautiful girl eating pizza in a modern kitchen";s:11:"orientation";s:1:"1";s:8:"keywords";a:1:{i:0;s:11:"pizza kebab";}}}'),
(13, 5, '_thumbnail_id', '6'),
(14, 5, '_av_example_content', '1'),
(15, 6, '_av_example_content', '1'),
(16, 8, '_wp_attached_file', '2022/05/quarto-articolo.jpg'),
(17, 8, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:2121;s:6:"height";i:1414;s:4:"file";s:27:"2022/05/quarto-articolo.jpg";s:5:"sizes";a:6:{s:6:"medium";a:4:{s:4:"file";s:27:"quarto-articolo-300x200.jpg";s:5:"width";i:300;s:6:"height";i:200;s:9:"mime-type";s:10:"image/jpeg";}s:5:"large";a:4:{s:4:"file";s:28:"quarto-articolo-1024x683.jpg";s:5:"width";i:1024;s:6:"height";i:683;s:9:"mime-type";s:10:"image/jpeg";}s:9:"thumbnail";a:4:{s:4:"file";s:27:"quarto-articolo-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:12:"medium_large";a:4:{s:4:"file";s:27:"quarto-articolo-768x512.jpg";s:5:"width";i:768;s:6:"height";i:512;s:9:"mime-type";s:10:"image/jpeg";}s:9:"1536x1536";a:4:{s:4:"file";s:29:"quarto-articolo-1536x1024.jpg";s:5:"width";i:1536;s:6:"height";i:1024;s:9:"mime-type";s:10:"image/jpeg";}s:9:"2048x2048";a:4:{s:4:"file";s:29:"quarto-articolo-2048x1365.jpg";s:5:"width";i:2048;s:6:"height";i:1365;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"2";s:6:"credit";s:24:"Getty Images/iStockphoto";s:6:"camera";s:22:"Canon EOS-1Ds Mark III";s:7:"caption";s:52:"Couple  Eating Lunch with Fresh Salad and Appetizers";s:17:"created_timestamp";s:10:"1269955887";s:9:"copyright";s:0:"";s:12:"focal_length";s:2:"50";s:3:"iso";s:3:"100";s:13:"shutter_speed";s:7:"0.00025";s:5:"title";s:52:"Couple  Eating Lunch with Fresh Salad and Appetizers";s:11:"orientation";s:1:"1";s:8:"keywords";a:1:{i:0;s:4:"rak?";}}}'),
(18, 7, '_thumbnail_id', '8'),
(19, 7, '_av_example_content', '1'),
(20, 8, '_av_example_content', '1'),
(21, 10, '_wp_attached_file', '2022/05/quinto-articolo.jpg'),
(22, 10, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:1530;s:6:"height";i:1959;s:4:"file";s:27:"2022/05/quinto-articolo.jpg";s:5:"sizes";a:5:{s:6:"medium";a:4:{s:4:"file";s:27:"quinto-articolo-234x300.jpg";s:5:"width";i:234;s:6:"height";i:300;s:9:"mime-type";s:10:"image/jpeg";}s:5:"large";a:4:{s:4:"file";s:28:"quinto-articolo-800x1024.jpg";s:5:"width";i:800;s:6:"height";i:1024;s:9:"mime-type";s:10:"image/jpeg";}s:9:"thumbnail";a:4:{s:4:"file";s:27:"quinto-articolo-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:12:"medium_large";a:4:{s:4:"file";s:27:"quinto-articolo-768x983.jpg";s:5:"width";i:768;s:6:"height";i:983;s:9:"mime-type";s:10:"image/jpeg";}s:9:"1536x1536";a:4:{s:4:"file";s:29:"quinto-articolo-1200x1536.jpg";s:5:"width";i:1200;s:6:"height";i:1536;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"8";s:6:"credit";s:24:"Getty Images/iStockphoto";s:6:"camera";s:13:"Canon EOS 5DS";s:7:"caption";s:72:"Pumpkin and carrot soup with cream and parsley on dark wooden background";s:17:"created_timestamp";s:9:"946687438";s:9:"copyright";s:17:"Anna Pustynnikova";s:12:"focal_length";s:3:"100";s:3:"iso";s:3:"160";s:13:"shutter_speed";s:4:"0.01";s:5:"title";s:46:"Pumpkin and carrot soup with cream and parsley";s:11:"orientation";s:1:"1";s:8:"keywords";a:1:{i:0;s:64:"Mashed,Healthy Eating,Dieting,Curry Powder,Meal,Vegetarian Food,";}}}'),
(23, 9, '_thumbnail_id', '10'),
(24, 9, '_av_example_content', '1'),
(25, 10, '_av_example_content', '1');

-- --------------------------------------------------------

--
-- Struttura della tabella `avwp_posts`
--

CREATE TABLE IF NOT EXISTS `avwp_posts` (
  `ID` bigint unsigned NOT NULL AUTO_INCREMENT,
  `post_author` bigint unsigned NOT NULL DEFAULT '0',
  `post_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_title` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_excerpt` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_status` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'publish',
  `comment_status` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'open',
  `ping_status` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'open',
  `post_password` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `post_name` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `to_ping` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `pinged` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_modified_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content_filtered` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_parent` bigint unsigned NOT NULL DEFAULT '0',
  `guid` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `menu_order` int NOT NULL DEFAULT '0',
  `post_type` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'post',
  `post_mime_type` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_count` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `post_name` (`post_name`(191)),
  KEY `type_status_date` (`post_type`,`post_status`,`post_date`,`ID`),
  KEY `post_parent` (`post_parent`),
  KEY `post_author` (`post_author`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci AUTO_INCREMENT=11 ;

--
-- Dump dei dati per la tabella `avwp_posts`
--

INSERT INTO `avwp_posts` (`ID`, `post_author`, `post_date`, `post_date_gmt`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `ping_status`, `post_password`, `post_name`, `to_ping`, `pinged`, `post_modified`, `post_modified_gmt`, `post_content_filtered`, `post_parent`, `guid`, `menu_order`, `post_type`, `post_mime_type`, `comment_count`) VALUES
(1, 1, '2022-05-03 09:51:26', '2022-05-03 07:51:26', '<!-- wp:paragraph -->\n<p>Ciao,<br>questo è il tuo sito.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Scrivi, carica le immagini, racconta quello che è importante per te.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Ricorda di attivare la <strong>Privacy e Cookie Policy</strong> (menu <em>Impostazioni</em>), è gratis.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Se vuoi guadagnare con i tuoi contenuti attiva il <strong>Pilota automatico</strong> (<em>Guadagna</em>). Altervista è l''unica piattaforma di blog e siti web che ti offre strumenti professionali gratis.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:image {"id":2} -->\n<figure class="wp-block-image"><img src="https://davidebaldassin.altervista.org/wp-content/uploads/2022/05/primo-articolo.jpg" alt="" class="wp-image-2" /><figcaption>Questo è un esempio di immagine che puoi inserire nel tuo articolo</figcaption></figure>\n<!-- /wp:image -->\n\n<!-- wp:paragraph -->\n<p>Se vuoi un consiglio o ti serve <strong>aiuto</strong>, scrivi sul <a rel="noreferrer noopener" aria-label=" (si apre in una nuova scheda)" href="https://www.facebook.com/groups/altervistago/" target="_blank"><strong>gruppo Facebook</strong></a> dei blogger di Altervista.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p><strong>Buon viaggio</strong> con il tuo nuovo blog su Altervista.</p>\n<!-- /wp:paragraph -->\n\n', 'Il primo articolo', '', 'publish', 'closed', 'closed', '', 'il-primo-articolo', '', '', '2022-05-03 09:51:27', '2022-05-03 07:51:27', '', 0, 'https://davidebaldassin.altervista.org/?p=1', 0, 'post', '', 1),
(2, 0, '2022-05-03 09:51:27', '2022-05-03 07:51:27', '', 'Primo allegato', '', 'inherit', 'closed', 'closed', '', 'primo-allegato', '', '', '2022-05-03 09:51:27', '2022-05-03 07:51:27', '', 1, 'https://davidebaldassin.altervista.org/wp-content/uploads/2022/05/primo-articolo.jpg', 0, 'attachment', 'image/jpeg', 0),
(3, 1, '2022-05-03 09:51:25', '2022-05-03 07:51:25', '<!-- wp:paragraph -->\n<p>Questo è un articolo riempitivo di esempio, è qua solo per mostrare come si presenta il blog con del contenuto. Puoi eliminare questo articolo e cominciare a creare i tuoi contenuti.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus. Vivamus elementum semper nisi. Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim. Aliquam lorem ante, dapibus in, viverra quis, feugiat a, tellus. Phasellus viverra nulla ut metus varius laoreet. Quisque rutrum.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading -->\n<h2>Aenean imperdiet. Etiam ultricies nisi vel augue</h2>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>Curabitur ullamcorper ultricies nisi. Nam eget dui. Etiam rhoncus. Maecenas tempus, tellus eget condimentum rhoncus, sem quam semper libero, sit amet adipiscing sem neque sed ipsum. Nam quam nunc, blandit vel, luctus pulvinar, hendrerit id, lorem. Maecenas nec odio et ante tincidunt tempus. Donec vitae sapien ut libero venenatis faucibus. Nullam quis ante. Etiam sit amet orci eget eros faucibus tincidunt. Duis leo. Sed fringilla mauris sit amet nibh. Donec sodales sagittis magna. Sed consequat, leo eget bibendum sodales, augue velit cursus nunc, quis gravida magna mi a libero. Fusce vulputate eleifend sapien. Vestibulum purus quam, scelerisque ut, mollis sed, nonummy id, metus. Nullam accumsan lorem in dui.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Cras ultricies mi eu turpis hendrerit fringilla. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; In ac dui quis mi consectetuer lacinia. Nam pretium turpis et arcu. Duis arcu tortor, suscipit eget, imperdiet nec, imperdiet iaculis, ipsum. Sed aliquam ultrices mauris. Integer ante arcu, accumsan a, consectetuer eget, posuere ut, mauris. Praesent adipiscing. Phasellus ullamcorper ipsum rutrum nunc. Nunc nonummy metus. Vestibulum volutpat pretium libero. Cras id dui. Aenean ut eros et nisl sagittis vestibulum.</p>\n<!-- /wp:paragraph -->\n\n', 'Il secondo articolo', '', 'publish', 'closed', 'closed', '', 'il-secondo-articolo', '', '', '2022-05-03 09:51:27', '2022-05-03 07:51:27', '', 0, 'https://davidebaldassin.altervista.org/?p=3', 0, 'post', '', 0),
(4, 0, '2022-05-03 09:51:27', '2022-05-03 07:51:27', '', 'Secondo allegato', '', 'inherit', 'closed', 'closed', '', 'secondo-allegato', '', '', '2022-05-03 09:51:27', '2022-05-03 07:51:27', '', 3, 'https://davidebaldassin.altervista.org/wp-content/uploads/2022/05/secondo-articolo.jpg', 0, 'attachment', 'image/jpeg', 0),
(5, 1, '2022-05-03 09:51:24', '2022-05-03 07:51:24', '<!-- wp:paragraph -->\n<p>Questo è un articolo riempitivo di esempio, è qua solo per mostrare come si presenta il blog con del contenuto. Puoi eliminare questo articolo e cominciare a creare i tuoi contenuti.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus. Vivamus elementum semper nisi. Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim. Aliquam lorem ante, dapibus in, viverra quis, feugiat a, tellus. Phasellus viverra nulla ut metus varius laoreet. Quisque rutrum.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading -->\n<h2>Aenean imperdiet. Etiam ultricies nisi vel augue</h2>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>Curabitur ullamcorper ultricies nisi. Nam eget dui. Etiam rhoncus. Maecenas tempus, tellus eget condimentum rhoncus, sem quam semper libero, sit amet adipiscing sem neque sed ipsum. Nam quam nunc, blandit vel, luctus pulvinar, hendrerit id, lorem. Maecenas nec odio et ante tincidunt tempus. Donec vitae sapien ut libero venenatis faucibus. Nullam quis ante. Etiam sit amet orci eget eros faucibus tincidunt. Duis leo. Sed fringilla mauris sit amet nibh. Donec sodales sagittis magna. Sed consequat, leo eget bibendum sodales, augue velit cursus nunc, quis gravida magna mi a libero. Fusce vulputate eleifend sapien. Vestibulum purus quam, scelerisque ut, mollis sed, nonummy id, metus. Nullam accumsan lorem in dui.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Cras ultricies mi eu turpis hendrerit fringilla. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; In ac dui quis mi consectetuer lacinia. Nam pretium turpis et arcu. Duis arcu tortor, suscipit eget, imperdiet nec, imperdiet iaculis, ipsum. Sed aliquam ultrices mauris. Integer ante arcu, accumsan a, consectetuer eget, posuere ut, mauris. Praesent adipiscing. Phasellus ullamcorper ipsum rutrum nunc. Nunc nonummy metus. Vestibulum volutpat pretium libero. Cras id dui. Aenean ut eros et nisl sagittis vestibulum.</p>\n<!-- /wp:paragraph -->\n\n', 'Il terzo articolo', '', 'publish', 'closed', 'closed', '', 'il-terzo-articolo', '', '', '2022-05-03 09:51:27', '2022-05-03 07:51:27', '', 0, 'https://davidebaldassin.altervista.org/?p=5', 0, 'post', '', 0),
(6, 0, '2022-05-03 09:51:27', '2022-05-03 07:51:27', '', 'Terzo allegato', '', 'inherit', 'closed', 'closed', '', 'terzo-allegato', '', '', '2022-05-03 09:51:27', '2022-05-03 07:51:27', '', 5, 'https://davidebaldassin.altervista.org/wp-content/uploads/2022/05/terzo-articolo.jpg', 0, 'attachment', 'image/jpeg', 0),
(7, 1, '2022-05-03 09:51:23', '2022-05-03 07:51:23', '<!-- wp:paragraph -->\n<p>Questo è un articolo riempitivo di esempio, è qua solo per mostrare come si presenta il blog con del contenuto. Puoi eliminare questo articolo e cominciare a creare i tuoi contenuti.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus. Vivamus elementum semper nisi. Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim. Aliquam lorem ante, dapibus in, viverra quis, feugiat a, tellus. Phasellus viverra nulla ut metus varius laoreet. Quisque rutrum.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading -->\n<h2>Aenean imperdiet. Etiam ultricies nisi vel augue</h2>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>Curabitur ullamcorper ultricies nisi. Nam eget dui. Etiam rhoncus. Maecenas tempus, tellus eget condimentum rhoncus, sem quam semper libero, sit amet adipiscing sem neque sed ipsum. Nam quam nunc, blandit vel, luctus pulvinar, hendrerit id, lorem. Maecenas nec odio et ante tincidunt tempus. Donec vitae sapien ut libero venenatis faucibus. Nullam quis ante. Etiam sit amet orci eget eros faucibus tincidunt. Duis leo. Sed fringilla mauris sit amet nibh. Donec sodales sagittis magna. Sed consequat, leo eget bibendum sodales, augue velit cursus nunc, quis gravida magna mi a libero. Fusce vulputate eleifend sapien. Vestibulum purus quam, scelerisque ut, mollis sed, nonummy id, metus. Nullam accumsan lorem in dui.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Cras ultricies mi eu turpis hendrerit fringilla. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; In ac dui quis mi consectetuer lacinia. Nam pretium turpis et arcu. Duis arcu tortor, suscipit eget, imperdiet nec, imperdiet iaculis, ipsum. Sed aliquam ultrices mauris. Integer ante arcu, accumsan a, consectetuer eget, posuere ut, mauris. Praesent adipiscing. Phasellus ullamcorper ipsum rutrum nunc. Nunc nonummy metus. Vestibulum volutpat pretium libero. Cras id dui. Aenean ut eros et nisl sagittis vestibulum.</p>\n<!-- /wp:paragraph -->\n\n', 'Il quarto articolo', '', 'publish', 'closed', 'closed', '', 'il-quarto-articolo', '', '', '2022-05-03 09:51:27', '2022-05-03 07:51:27', '', 0, 'https://davidebaldassin.altervista.org/?p=7', 0, 'post', '', 0),
(8, 0, '2022-05-03 09:51:27', '2022-05-03 07:51:27', '', 'Quarto allegato', '', 'inherit', 'closed', 'closed', '', 'quarto-allegato', '', '', '2022-05-03 09:51:27', '2022-05-03 07:51:27', '', 7, 'https://davidebaldassin.altervista.org/wp-content/uploads/2022/05/quarto-articolo.jpg', 0, 'attachment', 'image/jpeg', 0),
(9, 1, '2022-05-03 09:51:22', '2022-05-03 07:51:22', '<!-- wp:paragraph -->\n<p>Questo è un articolo riempitivo di esempio, è qua solo per mostrare come si presenta il blog con del contenuto. Puoi eliminare questo articolo e cominciare a creare i tuoi contenuti.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus. Vivamus elementum semper nisi. Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim. Aliquam lorem ante, dapibus in, viverra quis, feugiat a, tellus. Phasellus viverra nulla ut metus varius laoreet. Quisque rutrum.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading -->\n<h2>Aenean imperdiet. Etiam ultricies nisi vel augue</h2>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>Curabitur ullamcorper ultricies nisi. Nam eget dui. Etiam rhoncus. Maecenas tempus, tellus eget condimentum rhoncus, sem quam semper libero, sit amet adipiscing sem neque sed ipsum. Nam quam nunc, blandit vel, luctus pulvinar, hendrerit id, lorem. Maecenas nec odio et ante tincidunt tempus. Donec vitae sapien ut libero venenatis faucibus. Nullam quis ante. Etiam sit amet orci eget eros faucibus tincidunt. Duis leo. Sed fringilla mauris sit amet nibh. Donec sodales sagittis magna. Sed consequat, leo eget bibendum sodales, augue velit cursus nunc, quis gravida magna mi a libero. Fusce vulputate eleifend sapien. Vestibulum purus quam, scelerisque ut, mollis sed, nonummy id, metus. Nullam accumsan lorem in dui.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Cras ultricies mi eu turpis hendrerit fringilla. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; In ac dui quis mi consectetuer lacinia. Nam pretium turpis et arcu. Duis arcu tortor, suscipit eget, imperdiet nec, imperdiet iaculis, ipsum. Sed aliquam ultrices mauris. Integer ante arcu, accumsan a, consectetuer eget, posuere ut, mauris. Praesent adipiscing. Phasellus ullamcorper ipsum rutrum nunc. Nunc nonummy metus. Vestibulum volutpat pretium libero. Cras id dui. Aenean ut eros et nisl sagittis vestibulum.</p>\n<!-- /wp:paragraph -->\n\n', 'Il quinto articolo', '', 'publish', 'closed', 'closed', '', 'il-quinto-articolo', '', '', '2022-05-03 09:51:27', '2022-05-03 07:51:27', '', 0, 'https://davidebaldassin.altervista.org/?p=9', 0, 'post', '', 0),
(10, 0, '2022-05-03 09:51:27', '2022-05-03 07:51:27', '', 'Quinto allegato', '', 'inherit', 'closed', 'closed', '', 'quinto-allegato', '', '', '2022-05-03 09:51:27', '2022-05-03 07:51:27', '', 9, 'https://davidebaldassin.altervista.org/wp-content/uploads/2022/05/quinto-articolo.jpg', 0, 'attachment', 'image/jpeg', 0);

-- --------------------------------------------------------

--
-- Struttura della tabella `avwp_termmeta`
--

CREATE TABLE IF NOT EXISTS `avwp_termmeta` (
  `meta_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `term_id` bigint unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_520_ci,
  PRIMARY KEY (`meta_id`),
  KEY `term_id` (`term_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struttura della tabella `avwp_terms`
--

CREATE TABLE IF NOT EXISTS `avwp_terms` (
  `term_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `slug` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `term_group` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`term_id`),
  KEY `slug` (`slug`(191)),
  KEY `name` (`name`(191))
) ENGINE=MyISAM  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci AUTO_INCREMENT=2 ;

--
-- Dump dei dati per la tabella `avwp_terms`
--

INSERT INTO `avwp_terms` (`term_id`, `name`, `slug`, `term_group`) VALUES
(1, 'Senza categoria', 'senza-categoria', 0);

-- --------------------------------------------------------

--
-- Struttura della tabella `avwp_term_relationships`
--

CREATE TABLE IF NOT EXISTS `avwp_term_relationships` (
  `object_id` bigint unsigned NOT NULL DEFAULT '0',
  `term_taxonomy_id` bigint unsigned NOT NULL DEFAULT '0',
  `term_order` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`object_id`,`term_taxonomy_id`),
  KEY `term_taxonomy_id` (`term_taxonomy_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struttura della tabella `avwp_term_taxonomy`
--

CREATE TABLE IF NOT EXISTS `avwp_term_taxonomy` (
  `term_taxonomy_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `term_id` bigint unsigned NOT NULL DEFAULT '0',
  `taxonomy` varchar(32) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `description` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `parent` bigint unsigned NOT NULL DEFAULT '0',
  `count` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`term_taxonomy_id`),
  UNIQUE KEY `term_id_taxonomy` (`term_id`,`taxonomy`),
  KEY `taxonomy` (`taxonomy`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci AUTO_INCREMENT=2 ;

--
-- Dump dei dati per la tabella `avwp_term_taxonomy`
--

INSERT INTO `avwp_term_taxonomy` (`term_taxonomy_id`, `term_id`, `taxonomy`, `description`, `parent`, `count`) VALUES
(1, 1, 'category', '', 0, 0);

-- --------------------------------------------------------

--
-- Struttura della tabella `avwp_usermeta`
--

CREATE TABLE IF NOT EXISTS `avwp_usermeta` (
  `umeta_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_520_ci,
  PRIMARY KEY (`umeta_id`),
  KEY `user_id` (`user_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=MyISAM  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci AUTO_INCREMENT=15 ;

--
-- Dump dei dati per la tabella `avwp_usermeta`
--

INSERT INTO `avwp_usermeta` (`umeta_id`, `user_id`, `meta_key`, `meta_value`) VALUES
(1, 1, 'nickname', 'davidebaldassin'),
(2, 1, 'first_name', ''),
(3, 1, 'last_name', ''),
(4, 1, 'description', ''),
(5, 1, 'rich_editing', 'true'),
(6, 1, 'syntax_highlighting', 'true'),
(7, 1, 'comment_shortcuts', 'false'),
(8, 1, 'admin_color', 'fresh'),
(9, 1, 'use_ssl', '0'),
(10, 1, 'show_admin_bar_front', 'true'),
(11, 1, 'locale', ''),
(12, 1, 'avwp_capabilities', 'a:2:{s:10:"subscriber";b:1;s:13:"administrator";b:1;}'),
(13, 1, 'avwp_user_level', '10'),
(14, 1, 'dismissed_wp_pointers', '');

-- --------------------------------------------------------

--
-- Struttura della tabella `avwp_users`
--

CREATE TABLE IF NOT EXISTS `avwp_users` (
  `ID` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_login` varchar(60) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_pass` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_nicename` varchar(50) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_email` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_url` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_registered` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_activation_key` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_status` int NOT NULL DEFAULT '0',
  `display_name` varchar(250) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`),
  KEY `user_login_key` (`user_login`),
  KEY `user_nicename` (`user_nicename`),
  KEY `user_email` (`user_email`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci AUTO_INCREMENT=2 ;

--
-- Dump dei dati per la tabella `avwp_users`
--

INSERT INTO `avwp_users` (`ID`, `user_login`, `user_pass`, `user_nicename`, `user_email`, `user_url`, `user_registered`, `user_activation_key`, `user_status`, `display_name`) VALUES
(1, 'davidebaldassin', '$P$BjgNenuf7Czzl6gnH19o90EwLURMUx.', 'davidebaldassin', 'info.davidebaldassin@gmail.com', '', '2022-05-03 07:51:26', '', 0, 'davidebaldassin');

-- --------------------------------------------------------

--
-- Struttura della tabella `cart`
--

CREATE TABLE IF NOT EXISTS `cart` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `price` float NOT NULL,
  `creation_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_ID` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `user_ID` (`user_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci AUTO_INCREMENT=68 ;

--
-- Dump dei dati per la tabella `cart`
--

INSERT INTO `cart` (`ID`, `price`, `creation_date`, `user_ID`) VALUES
(21, 0, '2022-04-06 10:54:32', 1),
(27, 0, '2022-04-12 08:02:08', 5),
(28, 0, '2022-04-22 11:47:18', 6),
(29, 0, '2022-04-26 06:19:06', 6),
(30, 0, '2022-04-26 06:19:43', 1),
(31, 0, '2022-04-26 06:20:45', 6),
(32, 0, '2022-04-26 06:30:34', 6),
(33, 0, '2022-04-27 10:38:16', 6),
(34, 0, '2022-05-03 06:14:24', 6),
(35, 0, '2022-05-03 06:43:33', 5),
(36, 0, '2022-05-03 06:45:03', 6),
(37, 0, '2022-05-03 07:12:18', 6),
(38, 0, '2022-05-03 07:23:21', 6),
(39, 0, '2022-05-03 07:46:52', 6),
(40, 0, '2022-05-03 13:21:11', 5),
(41, 0, '2022-05-03 19:34:41', 6),
(42, 0, '2022-05-03 19:35:34', 7),
(43, 0, '2022-05-04 10:56:03', 6),
(44, 0, '2022-05-04 20:03:29', 6),
(45, 0, '2022-05-04 20:57:59', 6),
(46, 0, '2022-05-06 05:40:51', 6),
(47, 0, '2022-05-09 16:20:17', 6),
(48, 0, '2022-05-18 09:35:30', 6),
(49, 0, '2022-05-18 09:35:46', 6),
(50, 0, '2022-05-18 10:31:41', 1),
(51, 0, '2022-05-18 10:36:19', 6),
(52, 0, '2022-05-18 10:36:29', 8),
(53, 0, '2022-05-18 10:38:04', 6),
(54, 0, '2022-05-18 10:40:36', 9),
(55, 0, '2022-05-18 10:45:05', 6),
(56, 0, '2022-05-20 15:22:24', 1),
(57, 0, '2022-05-20 15:23:03', 6),
(58, 0, '2022-05-20 15:23:06', 6),
(59, 0, '2022-05-20 15:23:07', 6),
(60, 0, '2022-05-23 13:19:53', 6),
(61, 0, '2022-05-23 13:20:11', 6),
(62, 0, '2022-05-23 17:41:42', 6),
(63, 0, '2022-05-23 17:47:01', 6),
(64, 0, '2022-05-23 18:34:30', 6),
(65, 0, '2022-05-23 18:34:30', 6),
(66, 0, '2022-05-23 18:34:31', 6),
(67, 0, '2022-05-24 06:06:44', 6);

-- --------------------------------------------------------

--
-- Struttura della tabella `category`
--

CREATE TABLE IF NOT EXISTS `category` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `description` varchar(254) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci AUTO_INCREMENT=4 ;

--
-- Dump dei dati per la tabella `category`
--

INSERT INTO `category` (`ID`, `name`, `description`) VALUES
(1, 'Libri', 'Categoria contenente libri di ogni genere, illustrati e non.'),
(2, 'Vestiti', 'Vestiti di ogni tipo'),
(3, 'Oggetti', 'Oggetti per ogni utilizzo');

-- --------------------------------------------------------

--
-- Struttura della tabella `contains`
--

CREATE TABLE IF NOT EXISTS `contains` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `cart_ID` int NOT NULL,
  `item_ID` int NOT NULL,
  `amount` int NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `cart-contains` (`cart_ID`),
  KEY `item-contains` (`item_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=24 ;

--
-- Dump dei dati per la tabella `contains`
--

INSERT INTO `contains` (`ID`, `cart_ID`, `item_ID`, `amount`) VALUES
(1, 34, 2, 4),
(2, 34, 2, 2),
(3, 27, 2, 3),
(4, 27, 3, 5),
(8, 40, 2, 3),
(11, 44, 2, 3),
(12, 44, 3, 2),
(14, 50, 3, 1),
(15, 51, 4, 1),
(16, 52, 9, 1),
(19, 56, 3, 3),
(21, 52, 5, 1),
(22, 54, 2, 1),
(23, 54, 4, 1);

-- --------------------------------------------------------

--
-- Struttura della tabella `item`
--

CREATE TABLE IF NOT EXISTS `item` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `description` varchar(254) NOT NULL,
  `price` float NOT NULL,
  `stock_amount` int NOT NULL,
  `image` varchar(254) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT 'default_image.jpg',
  `category_ID` int NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `category_ID` (`category_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci AUTO_INCREMENT=11 ;

--
-- Dump dei dati per la tabella `item`
--

INSERT INTO `item` (`ID`, `name`, `description`, `price`, `stock_amount`, `image`, `category_ID`) VALUES
(2, 'Libro Geronimo Stilton', 'Libro illustrato del famosissimo scrittore topo Geronimo Stilton', 19.99, 10, 'libro-geronimo-stilton.jpg', 1),
(3, 'Libro Piccoli Brividi', 'Libro abbastanza spaventoso', 18.99, 15, 'libro-piccoli-brividi.jpg', 1),
(4, 'Vestito per gatti', 'che belo', 30, 5, 'vestito-per-gatti.jpg', 1),
(5, 'Illumina water', 'wow che bruto', 50, 5, 'illumina-water.jpg', 3),
(7, 'Item Provaasdasd', 'Description provaadas', 22, 23, 'default_image.jpg', 2),
(9, 'try', 'try', 22, 231, 'default_image.jpg', 2);

-- --------------------------------------------------------

--
-- Struttura della tabella `review`
--

CREATE TABLE IF NOT EXISTS `review` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `text` varchar(254) NOT NULL,
  `stars` int NOT NULL,
  `user_ID` int NOT NULL,
  `item_ID` int NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `review_user_ID` (`user_ID`),
  KEY `review_item_ID` (`item_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struttura della tabella `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `username` varchar(32) NOT NULL,
  `password` varchar(32) NOT NULL,
  `email` varchar(254) NOT NULL,
  `name` varchar(32) NOT NULL,
  `surname` varchar(32) NOT NULL,
  `birth_date` date NOT NULL,
  `isAdmin` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci AUTO_INCREMENT=10 ;

--
-- Dump dei dati per la tabella `user`
--

INSERT INTO `user` (`ID`, `username`, `password`, `email`, `name`, `surname`, `birth_date`, `isAdmin`) VALUES
(1, 'bobo', '5f4dcc3b5aa765d61d8327deb882cf99', 'info.davidebaldassin@gmail.com', 'Davide', 'Baldassin', '2003-05-18', NULL),
(5, 'bobo2', '5f4dcc3b5aa765d61d8327deb882cf99', 'info.davidebaldassin2@gmail.com', 'Davide', 'Baldassin', '2003-05-19', NULL),
(6, 'guest', 'guest', 'guest@guest.com', 'guest', 'guest', '1999-01-01', NULL),
(7, 'bobo3', '5f4dcc3b5aa765d61d8327deb882cf99', 'email@gmail.com', 'Davide', 'Baldassin', '2022-05-02', 1),
(8, 'admin', '21232f297a57a5a743894a0e4a801fc3', 'admin@admin.ad', 'admin', 'admin', '2022-05-02', 1),
(9, 'guest', '084e0343a0486ff05530df6c705c8bb4', 'guest@guest.gu', 'guest', 'guest', '2022-05-02', NULL);

-- --------------------------------------------------------

--
-- Struttura della tabella `user_order`
--

CREATE TABLE IF NOT EXISTS `user_order` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `delivery_type` enum('standard','fast') NOT NULL,
  `total_price` float NOT NULL,
  `order_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `cart_ID` int NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `order_cart_ID` (`cart_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci AUTO_INCREMENT=6 ;

--
-- Dump dei dati per la tabella `user_order`
--

INSERT INTO `user_order` (`ID`, `delivery_type`, `total_price`, `order_date`, `cart_ID`) VALUES
(2, 'standard', 22, '2022-05-18 10:37:01', 52),
(3, 'standard', 86, '2022-05-18 10:40:44', 54),
(4, 'standard', 72, '2022-05-20 15:24:06', 52),
(5, 'standard', 49, '2022-05-23 17:47:04', 54);

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `user_ID` FOREIGN KEY (`user_ID`) REFERENCES `user` (`ID`);

--
-- Limiti per la tabella `contains`
--
ALTER TABLE `contains`
  ADD CONSTRAINT `cart-contains` FOREIGN KEY (`cart_ID`) REFERENCES `cart` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `item-contains` FOREIGN KEY (`item_ID`) REFERENCES `item` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limiti per la tabella `item`
--
ALTER TABLE `item`
  ADD CONSTRAINT `category_ID` FOREIGN KEY (`category_ID`) REFERENCES `category` (`ID`);

--
-- Limiti per la tabella `review`
--
ALTER TABLE `review`
  ADD CONSTRAINT `review_item_ID` FOREIGN KEY (`item_ID`) REFERENCES `item` (`ID`),
  ADD CONSTRAINT `review_user_ID` FOREIGN KEY (`user_ID`) REFERENCES `user` (`ID`);

--
-- Limiti per la tabella `user_order`
--
ALTER TABLE `user_order`
  ADD CONSTRAINT `order_cart_ID` FOREIGN KEY (`cart_ID`) REFERENCES `cart` (`ID`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
