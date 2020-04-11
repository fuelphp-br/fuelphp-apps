-- Adminer 4.7.5 MySQL dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

DROP TABLE IF EXISTS `clientes`;
CREATE TABLE `clientes` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `idade` int(11) NOT NULL,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `clientes` (`id`, `nome`, `email`, `idade`, `created_at`, `updated_at`) VALUES
(3,	'Ribamar FS',	'ribafs@gmail.com',	63,	1586597964,	1586597964);

DROP TABLE IF EXISTS `migration`;
CREATE TABLE `migration` (
  `type` varchar(25) NOT NULL,
  `name` varchar(50) NOT NULL,
  `migration` varchar(100) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `migration` (`type`, `name`, `migration`) VALUES
('app',	'default',	'001_create_clientes'),
('app',	'default',	'002_create_vendedors'),
('package',	'auth',	'001_auth_create_usertables'),
('package',	'auth',	'002_auth_create_grouptables'),
('package',	'auth',	'003_auth_create_roletables'),
('package',	'auth',	'004_auth_create_permissiontables'),
('package',	'auth',	'005_auth_create_authdefaults'),
('package',	'auth',	'006_auth_add_authactions'),
('package',	'auth',	'007_auth_add_permissionsfilter'),
('package',	'auth',	'008_auth_create_providers'),
('package',	'auth',	'009_auth_create_oauth2tables'),
('package',	'auth',	'010_auth_fix_jointables'),
('package',	'auth',	'011_auth_group_optional');

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `group_id` int(11) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `last_login` varchar(25) NOT NULL,
  `previous_login` varchar(25) NOT NULL DEFAULT '0',
  `login_hash` varchar(255) NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `created_at` int(11) NOT NULL DEFAULT 0,
  `updated_at` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`,`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `users` (`id`, `username`, `password`, `group_id`, `email`, `last_login`, `previous_login`, `login_hash`, `user_id`, `created_at`, `updated_at`) VALUES
(0,	'guest',	'YOU CAN NOT USE THIS TO LOGIN',	2,	'',	'0',	'0',	'',	0,	1586596655,	0),
(1,	'admin',	'rV997tOL4oBm/LE9z6Glgxc7zBVWzWRsO0YY7hFO4lg=',	6,	'admin@example.org',	'1586596708',	'0',	'73c3849cfcd0adb27b90970d343296a4a6aada86',	1,	1586596655,	1586596708);

DROP TABLE IF EXISTS `users_clients`;
CREATE TABLE `users_clients` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL DEFAULT '',
  `client_id` varchar(32) NOT NULL DEFAULT '',
  `client_secret` varchar(32) NOT NULL DEFAULT '',
  `redirect_uri` varchar(255) NOT NULL DEFAULT '',
  `auto_approve` tinyint(1) NOT NULL DEFAULT 0,
  `autonomous` tinyint(1) NOT NULL DEFAULT 0,
  `status` enum('development','pending','approved','rejected') NOT NULL DEFAULT 'development',
  `suspended` tinyint(1) NOT NULL DEFAULT 0,
  `notes` tinytext NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `client_id` (`client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `users_groups`;
CREATE TABLE `users_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `created_at` int(11) NOT NULL DEFAULT 0,
  `updated_at` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `users_groups` (`id`, `name`, `user_id`, `created_at`, `updated_at`) VALUES
(1,	'Banned',	0,	0,	0),
(2,	'Guests',	0,	0,	0),
(3,	'Users',	0,	0,	0),
(4,	'Moderators',	0,	0,	0),
(5,	'Administrators',	0,	0,	0),
(6,	'Super Admins',	0,	0,	0);

DROP TABLE IF EXISTS `users_group_permissions`;
CREATE TABLE `users_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `perms_id` int(11) NOT NULL,
  `actions` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `users_group_roles`;
CREATE TABLE `users_group_roles` (
  `group_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  PRIMARY KEY (`group_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `users_group_roles` (`group_id`, `role_id`) VALUES
(1,	1),
(2,	2),
(3,	3),
(4,	3),
(4,	4),
(5,	3),
(5,	4),
(5,	5),
(6,	6);

DROP TABLE IF EXISTS `users_metadata`;
CREATE TABLE `users_metadata` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL DEFAULT 0,
  `key` varchar(20) NOT NULL,
  `value` varchar(100) NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `created_at` int(11) NOT NULL DEFAULT 0,
  `updated_at` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `users_metadata` (`id`, `parent_id`, `key`, `value`, `user_id`, `created_at`, `updated_at`) VALUES
(1,	1,	'fullname',	'System administrator',	0,	1586596655,	0),
(2,	0,	'fullname',	'Guest',	0,	0,	0);

DROP TABLE IF EXISTS `users_permissions`;
CREATE TABLE `users_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `area` varchar(25) NOT NULL,
  `permission` varchar(25) NOT NULL,
  `description` varchar(255) NOT NULL,
  `actions` text DEFAULT NULL,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `created_at` int(11) NOT NULL DEFAULT 0,
  `updated_at` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `permission` (`area`,`permission`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `users_providers`;
CREATE TABLE `users_providers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL DEFAULT 0,
  `provider` varchar(50) NOT NULL,
  `uid` varchar(255) NOT NULL,
  `secret` varchar(255) DEFAULT NULL,
  `access_token` varchar(255) DEFAULT NULL,
  `expires` int(12) DEFAULT 0,
  `refresh_token` varchar(255) DEFAULT NULL,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `created_at` int(11) NOT NULL DEFAULT 0,
  `updated_at` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `users_roles`;
CREATE TABLE `users_roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `filter` enum('','A','D','R') NOT NULL DEFAULT '',
  `user_id` int(11) NOT NULL DEFAULT 0,
  `created_at` int(11) NOT NULL DEFAULT 0,
  `updated_at` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `users_roles` (`id`, `name`, `filter`, `user_id`, `created_at`, `updated_at`) VALUES
(1,	'banned',	'D',	0,	0,	0),
(2,	'public',	'',	0,	0,	0),
(3,	'user',	'',	0,	0,	0),
(4,	'moderator',	'',	0,	0,	0),
(5,	'administrator',	'',	0,	0,	0),
(6,	'superadmin',	'A',	0,	0,	0);

DROP TABLE IF EXISTS `users_role_permissions`;
CREATE TABLE `users_role_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL,
  `perms_id` int(11) NOT NULL,
  `actions` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `users_scopes`;
CREATE TABLE `users_scopes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `scope` varchar(64) NOT NULL DEFAULT '',
  `name` varchar(64) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `scope` (`scope`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `users_sessions`;
CREATE TABLE `users_sessions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `client_id` varchar(32) NOT NULL DEFAULT '',
  `redirect_uri` varchar(255) NOT NULL DEFAULT '',
  `type_id` varchar(64) NOT NULL,
  `type` enum('user','auto') NOT NULL DEFAULT 'user',
  `code` text NOT NULL,
  `access_token` varchar(50) NOT NULL DEFAULT '',
  `stage` enum('request','granted') NOT NULL DEFAULT 'request',
  `first_requested` int(11) NOT NULL,
  `last_updated` int(11) NOT NULL,
  `limited_access` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `oauth_sessions_ibfk_1` (`client_id`),
  CONSTRAINT `oauth_sessions_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `users_clients` (`client_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `users_sessionscopes`;
CREATE TABLE `users_sessionscopes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `session_id` int(11) NOT NULL,
  `access_token` varchar(50) NOT NULL DEFAULT '',
  `scope` varchar(64) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `session_id` (`session_id`),
  KEY `access_token` (`access_token`),
  KEY `scope` (`scope`),
  CONSTRAINT `oauth_sessionscopes_ibfk_1` FOREIGN KEY (`scope`) REFERENCES `users_scopes` (`scope`),
  CONSTRAINT `oauth_sessionscopes_ibfk_2` FOREIGN KEY (`session_id`) REFERENCES `users_sessions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `users_user_permissions`;
CREATE TABLE `users_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `perms_id` int(11) NOT NULL,
  `actions` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `users_user_roles`;
CREATE TABLE `users_user_roles` (
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `vendedors`;
CREATE TABLE `vendedors` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `cpf` varchar(12) NOT NULL,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- 2020-04-11 09:51:02

