-- phpMyAdmin SQL Dump
-- version 4.0.4.1
-- http://www.phpmyadmin.net
--
-- Client: 127.0.0.1
-- Généré le: Lun 17 Février 2014 à 23:44
-- Version du serveur: 5.5.32
-- Version de PHP: 5.4.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données: `seekjob`
--
CREATE DATABASE IF NOT EXISTS `seekjob` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `seekjob`;

DELIMITER $$
--
-- Procédures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `info_candidat`(IN `pUserId` INT UNSIGNED)
    NO SQL
SELECT * 
FROM user u
JOIN candidat ON user_id = pUserId
WHERE u.type = 0$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `selectAllTagByOffreId`(IN `pOffreId` INT UNSIGNED)
    NO SQL
SELECT ot.offre_id, ot.tag_id, tag.titre 
FROM offre_has_tag ot
JOIN tag ON ot.tag_id = tag.id
WHERE ot.offre_id = pOffreId
ORDER BY ot.offre_id, ot.tag_id$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `selectOffreById`(IN `pId_offre` INT UNSIGNED)
    NO SQL
SELECT s.id, s.denomination,o.id,o.societe_id, o.description, o.titre, o.cp, o.ville, o.date_creation, o.type
FROM offre o
JOIN societe s ON o.societe_id = s.user_id
WHERE o.id = pId_offre$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `select_all_offre`()
    NO SQL
SELECT s.id, s.denomination,o.id, o.titre, o.cp, o.ville, o.date_creation, ot.tag_id, t.titre
FROM offre o
JOIN societe s ON o.societe_id = s.user_id
JOIN offre_has_tag ot ON o.id = ot.offre_id
JOIN tag t ON ot.tag_id = t.id
WHERE o.id = ot.offre_id
ORDER BY o.date_creation DESC$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `select_all_societe`()
    NO SQL
SELECT * 
FROM user u
JOIN societe s ON u.id = s.user_id
WHERE u.type = 1$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `select_offre_homePage`()
    NO SQL
SELECT s.id, s.denomination,o.id,o.societe_id, o.description, o.titre, o.cp, o.ville, o.date_creation, o.type
FROM offre o
JOIN societe s ON o.societe_id = s.user_id
ORDER BY o.date_creation DESC
LIMIT 0,5
-- Il faut trouver le moyen pour recuperer sur un ligne toutes les titres de compentences$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `select_one_societe`(IN `pUID` INT UNSIGNED)
    NO SQL
SELECT * 
FROM user u
JOIN societe s ON u.id = s.user_id AND u.type = 1
JOIN offre o ON societe_id = u.id
WHERE u.id = pUID$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Structure de la table `candidat`
--

CREATE TABLE IF NOT EXISTS `candidat` (
  `id` int(32) unsigned NOT NULL AUTO_INCREMENT,
  `cv` varchar(100) NOT NULL,
  `lettre_motivation` varchar(100) DEFAULT NULL,
  `user_id` int(32) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_candidat_user1_idx` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Contenu de la table `candidat`
--

INSERT INTO `candidat` (`id`, `cv`, `lettre_motivation`, `user_id`) VALUES
(1, 'cv_esteban.pdf', NULL, 1),
(2, 'totocv.pdf', NULL, 3);

-- --------------------------------------------------------

--
-- Structure de la table `candidature`
--

CREATE TABLE IF NOT EXISTS `candidature` (
  `candidat_id` int(32) unsigned NOT NULL,
  `offre_id` int(32) unsigned NOT NULL,
  `date_candidature` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `message_motivation` text,
  PRIMARY KEY (`candidat_id`,`offre_id`),
  KEY `fk_candidat_has_offre_offre1_idx` (`offre_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `offre`
--

CREATE TABLE IF NOT EXISTS `offre` (
  `id` int(32) unsigned NOT NULL AUTO_INCREMENT,
  `titre` varchar(255) NOT NULL,
  `description` text,
  `cp` int(5) DEFAULT NULL,
  `ville` varchar(50) DEFAULT NULL,
  `date_creation` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `societe_id` int(32) unsigned NOT NULL,
  `type` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_offre_societe1_idx` (`societe_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='	' AUTO_INCREMENT=7 ;

--
-- Contenu de la table `offre`
--

INSERT INTO `offre` (`id`, `titre`, `description`, `cp`, `ville`, `date_creation`, `societe_id`, `type`) VALUES
(1, 'Integrateur html', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris felis dui, tincidunt in urna ac, lacinia venenatis nunc. Vivamus convallis mollis neque, a consequat est rhoncus ut. Donec enim mauris, facilisis sit amet leo in, aliquet luctus massa. Nunc convallis dolor at pellentesque ullamcorper.', 75002, 'Paris', '2014-02-16 20:18:39', 2, 'Stage'),
(2, 'Développeur Java', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris felis dui, tincidunt in urna ac, lacinia venenatis nunc. Vivamus convallis mollis neque, a consequat est rhoncus ut', 75002, 'Paris', '2014-02-16 20:19:06', 2, 'CDI'),
(5, 'Graphiste', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris felis dui, tincidunt in urna ac, \r\nlacinia venenatis nunc. Vivamus convallis mollis neque, a consequat est rhoncus ut. Donec enim mauris, \r\nfacilisis sit amet leo in, aliquet luctus massa. Nunc convallis dolor at pellentesque ullamcorper.', 75010, 'Paris', '2014-02-16 20:19:22', 4, 'CDD'),
(6, 'chef de projet', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris felis dui, tincidunt in urna ac, lacinia venenatis nunc. Vivamus convallis mollis neque, a consequat est rhoncus ut', 75010, 'Paris', '2014-02-16 20:19:42', 4, 'FREELANCE');

-- --------------------------------------------------------

--
-- Structure de la table `offre_has_tag`
--

CREATE TABLE IF NOT EXISTS `offre_has_tag` (
  `offre_id` int(32) unsigned NOT NULL,
  `tag_id` int(32) unsigned NOT NULL,
  PRIMARY KEY (`offre_id`,`tag_id`),
  KEY `fk_offre_has_tag_tag1_idx` (`tag_id`),
  KEY `fk_offre_has_tag_offre1_idx` (`offre_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `offre_has_tag`
--

INSERT INTO `offre_has_tag` (`offre_id`, `tag_id`) VALUES
(1, 1),
(5, 1),
(1, 2),
(5, 2),
(1, 3),
(5, 3),
(1, 4),
(5, 4),
(6, 4),
(2, 5),
(6, 5),
(2, 6),
(2, 7),
(6, 7),
(2, 8),
(6, 9);

-- --------------------------------------------------------

--
-- Structure de la table `societe`
--

CREATE TABLE IF NOT EXISTS `societe` (
  `id` int(32) unsigned NOT NULL AUTO_INCREMENT,
  `denomination` varchar(50) NOT NULL,
  `logo` varchar(50) DEFAULT NULL,
  `user_id` int(32) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_societe_user1_idx` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Contenu de la table `societe`
--

INSERT INTO `societe` (`id`, `denomination`, `logo`, `user_id`) VALUES
(1, 'Priceminister', 'priceminister.jpg', 2),
(2, 'Amazon', 'amazon.jpg', 4);

-- --------------------------------------------------------

--
-- Structure de la table `tag`
--

CREATE TABLE IF NOT EXISTS `tag` (
  `id` int(32) unsigned NOT NULL AUTO_INCREMENT,
  `titre` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=19 ;

--
-- Contenu de la table `tag`
--

INSERT INTO `tag` (`id`, `titre`) VALUES
(1, 'php'),
(2, 'javascript'),
(3, 'html'),
(4, 'sql'),
(5, 'java'),
(6, 'perl'),
(7, 'zendFramework'),
(8, 'symphony'),
(9, 'twig'),
(10, 'poo'),
(11, 'html'),
(12, 'sql'),
(13, 'java'),
(14, 'perl'),
(15, 'zendFramework'),
(16, 'symphony'),
(17, 'twig'),
(18, 'poo');

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `id` int(32) unsigned NOT NULL AUTO_INCREMENT,
  `type` int(3) NOT NULL,
  `mail` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `nom` varchar(50) NOT NULL,
  `prenom` varchar(50) NOT NULL,
  `tel` varchar(20) DEFAULT NULL,
  `ville` varchar(50) DEFAULT NULL,
  `cp` int(5) unsigned DEFAULT NULL,
  `date_inscription` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Contenu de la table `user`
--

INSERT INTO `user` (`id`, `type`, `mail`, `password`, `nom`, `prenom`, `tel`, `ville`, `cp`, `date_inscription`) VALUES
(1, 0, 'esteban@do-web.Fr', 'toto', 'rios', 'esteban', '0667127189', 'coubron', 93470, '2014-02-15 18:37:36'),
(2, 1, 'rh@priceminister.com', 'toto', 'contact', 'rh', '0667127189', 'paris', 75002, '2014-02-15 18:44:15'),
(3, 0, 'toto@do-web.Fr', 'toto', 'toto', 'titi', '9967127189', 'Le blanc-mesnil', 93150, '2014-10-15 16:37:36'),
(4, 1, 'rh@amazon.com', 'toto', 'amazonContac', 'rh', '7767127189', 'paris', 75002, '2014-09-15 16:44:15');

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `candidat`
--
ALTER TABLE `candidat`
  ADD CONSTRAINT `fk_candidat_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `candidature`
--
ALTER TABLE `candidature`
  ADD CONSTRAINT `fk_candidat_has_offre_candidat1` FOREIGN KEY (`candidat_id`) REFERENCES `candidat` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_candidat_has_offre_offre1` FOREIGN KEY (`offre_id`) REFERENCES `offre` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `offre`
--
ALTER TABLE `offre`
  ADD CONSTRAINT `fk_offre_societe1` FOREIGN KEY (`societe_id`) REFERENCES `societe` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `offre_has_tag`
--
ALTER TABLE `offre_has_tag`
  ADD CONSTRAINT `fk_offre_has_tag_offre1` FOREIGN KEY (`offre_id`) REFERENCES `offre` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_offre_has_tag_tag1` FOREIGN KEY (`tag_id`) REFERENCES `tag` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `societe`
--
ALTER TABLE `societe`
  ADD CONSTRAINT `fk_societe_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
