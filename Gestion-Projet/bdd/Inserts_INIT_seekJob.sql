INSERT INTO `seekjob`.`user` (`id`,`type`,`mail`,`password`,`nom`,`prenom`,`tel`,`ville`,`cp`,`date_inscription`) 
VALUES (NULL,'0','esteban@do-web.Fr','toto','rios','esteban','0667127189','coubron','93470',CURRENT_TIMESTAMP);

INSERT INTO `seekjob`.`user` (`id`,`type`,`mail`,`password`,`nom`,`prenom`,`tel`,`ville`,`cp`,`date_inscription`) 
VALUES (
	NULL,'1','rh@priceminister.com','toto','contact','rh','0667127189','paris','75002',CURRENT_TIMESTAMP);
	
	
	INSERT INTO `seekjob`.`societe` (`id`, `denomination`, `logo`, `user_id`) VALUES (NULL, 'Priceminister', 'priceminister.jpg', '2');
	
	INSERT INTO `seekjob`.`tag` (`id`, `titre`) VALUES (NULL, 'html'), (NULL, 'sql');
	INSERT INTO `seekjob`.`tag` (`id`, `titre`) VALUES (NULL, 'java'), (NULL, 'perl');
	INSERT INTO `seekjob`.`tag` (`id`, `titre`) VALUES (NULL, 'zendFramework'), (NULL, 'symphony');
	INSERT INTO `seekjob`.`tag` (`id`, `titre`) VALUES (NULL, 'twig'), (NULL, 'poo');
	
	INSERT INTO `seekjob`.`offre` (`id`, `titre`, `description`, `cp`, `ville`, `date_creation`, `societe_id`, `type`) VALUES (NULL, 'Integrateur html', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris felis dui, tincidunt in urna ac, lacinia venenatis nunc. Vivamus convallis mollis neque, a consequat est rhoncus ut. Donec enim mauris, facilisis sit amet leo in, aliquet luctus massa. Nunc convallis dolor at pellentesque ullamcorper.', '75002', 'Paris', CURRENT_TIMESTAMP, '2', '0'), (NULL, 'Développeur Java', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris felis dui, tincidunt in urna ac, lacinia venenatis nunc. Vivamus convallis mollis neque, a consequat est rhoncus ut', '75002', 'Paris', '2014-02-04 00:00:00', '2', '1');
	
	INSERT INTO `seekjob`.`offre_has_tag` (`offre_id`, `tag_id`) VALUES ('1', '1'), ('1', '2'), ('1', '3'), ('1', '4'), ('2', '5'), ('2', '6'), ('2', '7'), ('2', '8');
	
	
	
	==========================================================================
CREER USERS
INSERT INTO `user` (`id`, `type`, `mail`, `password`, `nom`, `prenom`, `tel`, `ville`, `cp`, `date_inscription`) VALUES
(null, 0, 'toto@do-web.Fr', 'toto', 'toto', 'titi', '9967127189', 'Le blanc-mesnil', 93150, '2014-10-15 18:37:36'),
(null, 1, 'rh@amazon.com', 'toto', 'amazonContac', 'rh', '7767127189', 'paris', 75002, '2014-09-15 18:44:15');

NOUVELLE SOCIETE
INSERT INTO `societe` (`id`, `denomination`, `logo`, `user_id`) VALUES
(1, 'Priceminister', 'priceminister.jpg', 2);

NOUVEAU CANDIDAT
INSERT INTO `candidat` (`id`, `cv`, `lettre_motivation`, `user_id`) VALUES
(1, 'cv_esteban.pdf', NULL, 1);

NOUVELLE OFFRE 
INSERT INTO `offre` (`id`, `titre`, `description`, `cp`, `ville`, `date_creation`, `societe_id`, `type`) VALUES
(
null,
'Graphiste', 
'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris felis dui, tincidunt in urna ac, 
lacinia venenatis nunc. Vivamus convallis mollis neque, a consequat est rhoncus ut. Donec enim mauris, 
facilisis sit amet leo in, aliquet luctus massa. Nunc convallis dolor at pellentesque ullamcorper.', 
75010, 
'Paris', 
'2014-02-15 18:52:08', 
4, 
'0'
),
(
null, 
'chef de projet', 
'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris felis dui, tincidunt in urna ac, lacinia venenatis nunc. Vivamus convallis mollis neque, a consequat est rhoncus ut', 
75010, 
'Paris', 
'2014-02-03 23:00:00', 
4,
'1'
);

NOUVELLE COMPETENCES POUR L OFFRE
INSERT INTO `offre_has_tag` (`offre_id`, `tag_id`) VALUES
(5, 1),
(5, 2),
(5, 3),
(5, 4),
(6, 9),
(6, 5),
(6, 4),
(6, 7);