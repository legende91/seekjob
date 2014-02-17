-- phpMyAdmin SQL Dump
-- version 4.0.4.1
-- http://www.phpmyadmin.net
--
-- Client: 127.0.0.1
-- Généré le: Jeu 13 Février 2014 à 15:16
-- Version du serveur: 5.5.32
-- Version de PHP: 5.4.19

SET FOREIGN_KEY_CHECKS=0;
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données: `job`
--
CREATE DATABASE IF NOT EXISTS `job` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `job`;

-- --------------------------------------------------------

--
-- Structure de la table `categorie`
--

DROP TABLE IF EXISTS `categorie`;
CREATE TABLE IF NOT EXISTS `categorie` (
  `id` int(32) unsigned NOT NULL AUTO_INCREMENT,
  `categorie` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `membre`
--

DROP TABLE IF EXISTS `membre`;
CREATE TABLE IF NOT EXISTS `membre` (
  `id` int(32) unsigned NOT NULL AUTO_INCREMENT,
  `type` int(1) NOT NULL,
  `nom` varchar(50) CHARACTER SET utf8 NOT NULL,
  `prenom` varchar(50) CHARACTER SET utf8 NOT NULL,
  `age` int(3) NOT NULL,
  `cv` varchar(255) CHARACTER SET utf8 NOT NULL,
  `lettre` varchar(255) CHARACTER SET utf8 NOT NULL,
  `tel` varchar(20) CHARACTER SET utf8 NOT NULL,
  `numero` int(20) NOT NULL,
  `rue` varchar(255) CHARACTER SET utf8 NOT NULL,
  `ville` varchar(40) CHARACTER SET utf8 NOT NULL,
  `cp` int(5) NOT NULL,
  `pays` varchar(50) CHARACTER SET utf8 NOT NULL,
  `date_inscription` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `password` varchar(255) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `membre_offre`
--

DROP TABLE IF EXISTS `membre_offre`;
CREATE TABLE IF NOT EXISTS `membre_offre` (
  `id` int(32) unsigned NOT NULL AUTO_INCREMENT,
  `id_membre` int(32) unsigned NOT NULL,
  `id_offre` int(32) NOT NULL,
  `date_post` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `id_membre` (`id_membre`),
  KEY `id_offre` (`id_offre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `offre`
--

DROP TABLE IF EXISTS `offre`;
CREATE TABLE IF NOT EXISTS `offre` (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `id_membre_createur` int(32) unsigned NOT NULL,
  `titre` varchar(255) NOT NULL,
  `description` varchar(1000) NOT NULL,
  `cp` int(5) NOT NULL,
  `pays` varchar(50) NOT NULL,
  `date_creation` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `id_membre_createur` (`id_membre_createur`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `offre_categorie`
--

DROP TABLE IF EXISTS `offre_categorie`;
CREATE TABLE IF NOT EXISTS `offre_categorie` (
  `id` int(32) unsigned NOT NULL AUTO_INCREMENT,
  `id_offre` int(32) NOT NULL,
  `id_categorie` int(32) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_offre` (`id_offre`),
  KEY `id_categorie` (`id_categorie`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `membre_offre`
--
ALTER TABLE `membre_offre`
  ADD CONSTRAINT `membre_offre_ibfk_2` FOREIGN KEY (`id_offre`) REFERENCES `offre` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `membre_offre_ibfk_1` FOREIGN KEY (`id_membre`) REFERENCES `membre` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `offre`
--
ALTER TABLE `offre`
  ADD CONSTRAINT `offre_ibfk_1` FOREIGN KEY (`id_membre_createur`) REFERENCES `membre` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `offre_categorie`
--
ALTER TABLE `offre_categorie`
  ADD CONSTRAINT `offre_categorie_ibfk_2` FOREIGN KEY (`id_categorie`) REFERENCES `categorie` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `offre_categorie_ibfk_1` FOREIGN KEY (`id_offre`) REFERENCES `offre` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
SET FOREIGN_KEY_CHECKS=1;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
