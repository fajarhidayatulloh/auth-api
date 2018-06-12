-- --------------------------------------------------------
-- Host:                         localhost
-- Versi server:                 5.7.19 - MySQL Community Server (GPL)
-- OS Server:                    Win64
-- HeidiSQL Versi:               9.4.0.5125
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Membuang struktur basisdata untuk auth_api
CREATE DATABASE IF NOT EXISTS `auth_api` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `auth_api`;

-- membuang struktur untuk table auth_api.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Membuang data untuk tabel auth_api.migrations: ~7 rows (lebih kurang)
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(1, '2014_10_12_000000_create_users_table', 1),
	(2, '2014_10_12_100000_create_password_resets_table', 1),
	(3, '2016_06_01_000001_create_oauth_auth_codes_table', 1),
	(4, '2016_06_01_000002_create_oauth_access_tokens_table', 1),
	(5, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1),
	(6, '2016_06_01_000004_create_oauth_clients_table', 1),
	(7, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;

-- membuang struktur untuk table auth_api.oauth_access_tokens
CREATE TABLE IF NOT EXISTS `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `client_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_access_tokens_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Membuang data untuk tabel auth_api.oauth_access_tokens: ~4 rows (lebih kurang)
/*!40000 ALTER TABLE `oauth_access_tokens` DISABLE KEYS */;
INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
	('1da9d4ac5c39783fd4304cbbf0485ab831bf4454edbb3f0bab2d3832ce3d22bb48fe6e836f08a34d', 2, 5, NULL, '["*"]', 0, '2018-06-12 05:00:28', '2018-06-12 05:00:28', '2019-06-12 05:00:28'),
	('29342b25a688272a6cc1ea7e3ff2739cec727c525ad61e724e4b5d4b58b8776dc7ab983214b48b0c', 2, 5, NULL, '["*"]', 0, '2018-06-12 04:27:23', '2018-06-12 04:27:23', '2019-06-12 04:27:23'),
	('8f0008b60b074b135757067151ed31cab7f3acca4508296492da07f396faa8039011cfbb43dcd1ca', 2, 5, NULL, '["*"]', 0, '2018-06-12 04:25:46', '2018-06-12 04:25:46', '2019-06-12 04:25:46'),
	('a13c8f8c687f4225deae0e45ceb2a2416f17b60121190e3e1008f748c61355c8bffdcb4305df9c9d', 2, 5, NULL, '["*"]', 0, '2018-06-12 04:52:57', '2018-06-12 04:52:57', '2019-06-12 04:52:57');
/*!40000 ALTER TABLE `oauth_access_tokens` ENABLE KEYS */;

-- membuang struktur untuk table auth_api.oauth_auth_codes
CREATE TABLE IF NOT EXISTS `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Membuang data untuk tabel auth_api.oauth_auth_codes: ~0 rows (lebih kurang)
/*!40000 ALTER TABLE `oauth_auth_codes` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_auth_codes` ENABLE KEYS */;

-- membuang struktur untuk table auth_api.oauth_clients
CREATE TABLE IF NOT EXISTS `oauth_clients` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_clients_user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Membuang data untuk tabel auth_api.oauth_clients: ~5 rows (lebih kurang)
/*!40000 ALTER TABLE `oauth_clients` DISABLE KEYS */;
INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
	(1, NULL, 'Laravel Personal Access Client', 'Q9egaszt09kjFGqH4gn270Ast3NorIiR5RLZHQJ0', 'http://localhost', 1, 0, 0, '2018-06-12 02:50:19', '2018-06-12 02:50:19'),
	(2, NULL, 'Laravel Password Grant Client', 'HyKfOTIWiGsDD7eiwPYAQOulQXUIWtwfuKF7lqD3', 'http://localhost', 0, 1, 0, '2018-06-12 02:50:19', '2018-06-12 02:50:19'),
	(3, NULL, 'auth_password', '9f6WI6yA1YENXiLdYJjS0ysUnmy9psYTrVbzhQo4', 'http://localhost', 0, 1, 0, '2018-06-12 02:59:09', '2018-06-12 02:59:09'),
	(4, 4, 'auth_password', 'Ug3b2tlacpvHScMvqfHogOGnuJdvTA1ivEwXqBvy', 'http://localhost/auth/callback', 0, 0, 0, '2018-06-12 03:27:37', '2018-06-12 03:27:37'),
	(5, NULL, 'password', 'uTgO6COI3XmB1zr2tr3VWgjP5nJlLShG0iDJwY0H', 'http://localhost', 0, 1, 0, '2018-06-12 03:28:29', '2018-06-12 03:28:29');
/*!40000 ALTER TABLE `oauth_clients` ENABLE KEYS */;

-- membuang struktur untuk table auth_api.oauth_personal_access_clients
CREATE TABLE IF NOT EXISTS `oauth_personal_access_clients` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `client_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_personal_access_clients_client_id_index` (`client_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Membuang data untuk tabel auth_api.oauth_personal_access_clients: ~1 rows (lebih kurang)
/*!40000 ALTER TABLE `oauth_personal_access_clients` DISABLE KEYS */;
INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
	(1, 1, '2018-06-12 02:50:19', '2018-06-12 02:50:19');
/*!40000 ALTER TABLE `oauth_personal_access_clients` ENABLE KEYS */;

-- membuang struktur untuk table auth_api.oauth_refresh_tokens
CREATE TABLE IF NOT EXISTS `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Membuang data untuk tabel auth_api.oauth_refresh_tokens: ~4 rows (lebih kurang)
/*!40000 ALTER TABLE `oauth_refresh_tokens` DISABLE KEYS */;
INSERT INTO `oauth_refresh_tokens` (`id`, `access_token_id`, `revoked`, `expires_at`) VALUES
	('17b539e052ac2a440891cd643cf881d585e3119f39108f9ef6c796d3d36d1abb636ad876f4df4a9e', '8f0008b60b074b135757067151ed31cab7f3acca4508296492da07f396faa8039011cfbb43dcd1ca', 0, '2019-06-12 04:25:46'),
	('4973e890d67e6c29f1b1f4c67e063b5f2b929713fa58f225e07c1cbd91745da356aae05308f5e0cc', '1da9d4ac5c39783fd4304cbbf0485ab831bf4454edbb3f0bab2d3832ce3d22bb48fe6e836f08a34d', 0, '2019-06-12 05:00:28'),
	('c20c80896ba46fd9caa61079cefd95fc199536ef0af4abd74f964199442186c20328de747a93a790', '29342b25a688272a6cc1ea7e3ff2739cec727c525ad61e724e4b5d4b58b8776dc7ab983214b48b0c', 0, '2019-06-12 04:27:23'),
	('e2dc3bf971a12e7f34d97f77278fe6e8dca08f752fb632d1030f004a480d06190e188acef78cd242', 'a13c8f8c687f4225deae0e45ceb2a2416f17b60121190e3e1008f748c61355c8bffdcb4305df9c9d', 0, '2019-06-12 04:52:57');
/*!40000 ALTER TABLE `oauth_refresh_tokens` ENABLE KEYS */;

-- membuang struktur untuk table auth_api.password_resets
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Membuang data untuk tabel auth_api.password_resets: ~0 rows (lebih kurang)
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;

-- membuang struktur untuk table auth_api.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Membuang data untuk tabel auth_api.users: ~3 rows (lebih kurang)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `name`, `email`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
	(1, 'Test Auth', 'fajar@bareksa.com', '12345678', NULL, NULL, NULL),
	(2, 'fajar', 'fajarrhid@gmail.com', '$2y$10$iO/QDEoOMRl2feePxTaysuoThzW7y0OErnxPZF3JsNtiYG8fvuvPe', NULL, '2018-06-12 04:25:20', '2018-06-12 04:25:20'),
	(3, 'sdsddsd', 'test15@gmail.com', '$2y$10$6gdLKKCxa6jLCZe60K33euGwx2iufbnhwg8WRgb9WI9zvDEozQlqy', NULL, '2018-06-12 06:09:47', '2018-06-12 14:20:21');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
