SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";



CREATE TABLE `messages` (
  `id` int(11) NOT NULL,
  `messages` longtext COLLATE utf8_unicode_ci NOT NULL,
  `date` datetime DEFAULT NULL,
  `user_id_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `messages` (`id`, `messages`, `date`, `user_id_id`) VALUES
(1, 'tesetsets', '2013-01-01 00:00:00', NULL),
(2, 'sgsdgsdgdsgsdhshssdhhsdhsdh', '2013-01-01 00:00:00', NULL),
(3, 'erteryeryeryeryhefhfhfdhfdhdfhdfhhdhdhd', NULL, NULL),
(4, 'zetergfgdfgd', NULL, NULL),
(5, 'rija', NULL, 5),
(6, 'fdfdsfsdfsfsfgsdgsgsd', NULL, NULL),
(7, 'fhgjfgjfjfgjfjfj', NULL, NULL),
(8, 'qfsdfsdfsdfdd', NULL, NULL),
(9, 'tytjituk', NULL, NULL),
(10, 'sdfdgsgsd', NULL, NULL),
(11, 'sdgfsdgsdgsg', NULL, NULL),
(12, 'sdgdsgsgsdgsgsdg', NULL, 5),
(13, 'zsefgedfgsdg', NULL, NULL);

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(180) COLLATE utf8_unicode_ci NOT NULL,
  `username_canonical` varchar(180) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(180) COLLATE utf8_unicode_ci NOT NULL,
  `email_canonical` varchar(180) COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `salt` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `confirmation_token` varchar(180) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password_requested_at` datetime DEFAULT NULL,
  `roles` longtext COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:array)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `user` (`id`, `username`, `username_canonical`, `email`, `email_canonical`, `enabled`, `salt`, `password`, `last_login`, `confirmation_token`, `password_requested_at`, `roles`) VALUES
(1, 'rija', 'rija', 'michrija@gmail.com', 'michrija@gmail.com', 1, NULL, '$2y$13$FF.ByN9Hf529gK7ItvcfHerZCAOR5AjjAjYpvSDGJtYhFBryv8eia', '2018-05-30 10:12:45', NULL, NULL, 'a:0:{}'),
(2, 'rijamich', 'rijamich', 'miche@gmail.com', 'miche@gmail.com', 1, NULL, '$2y$13$.EMROtnetczB66qAQEv9CuAEWFsGIspL0Ufd1dkrEKSkV85Ge9aBq', '2018-05-30 10:39:54', NULL, NULL, 'a:1:{i:0;s:10:\"ROLE_ADMIN\";}'),
(3, 'testeset', 'testeset', 'test@gmail.vom', 'test@gmail.vom', 1, NULL, '$2y$13$Tacj7nVjytNYBs.OoWZdyuUGSAcqikRGTac3DFAKfM.qSOn66/49a', '2018-05-30 10:43:16', NULL, NULL, 'a:1:{i:0;s:10:\"ROLE_ADMIN\";}'),
(4, 'teset', 'teset', 'test1@gmail.com', 'test1@gmail.com', 1, NULL, '$2y$13$HTY3kBheicFIpjGEwTlDdeu.1fOnTDE2DRyVTKhW5FlvmSfKGTNsm', '2018-05-30 11:29:00', NULL, NULL, 'a:1:{i:0;s:10:\"ROLE_ADMIN\";}'),
(5, 'sylow', 'sylow', 'test12@gmail.vom', 'test12@gmail.vom', 1, NULL, '$2y$13$fnY/vDaomK4uDMsoIwbGeeI/EHujdkt7a1qmGLIgPiBouI4wZlKw.', '2018-05-30 12:40:29', NULL, NULL, 'a:1:{i:0;s:10:\"ROLE_ADMIN\";}');


ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_DB021E969D86650F` (`user_id_id`);

ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_8D93D64992FC23A8` (`username_canonical`),
  ADD UNIQUE KEY `UNIQ_8D93D649A0D96FBF` (`email_canonical`),
  ADD UNIQUE KEY `UNIQ_8D93D649C05FB297` (`confirmation_token`);


ALTER TABLE `messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;


ALTER TABLE `messages`
  ADD CONSTRAINT `FK_DB021E969D86650F` FOREIGN KEY (`user_id_id`) REFERENCES `user` (`id`);
COMMIT;


