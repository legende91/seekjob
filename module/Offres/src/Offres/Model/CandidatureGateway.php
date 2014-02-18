<?php

/**
 * Description of CandidatureGateway
 *
 * @author esteban
 */

namespace Offres\Model;

use Offres\Model\Entity\Candidature;
use Offres\Model\Entity\Offre;
use PDO;
use PDOException;
use Zend\Code\Generator\DocBlock\Tag;

class CandidatureGateway {

	public function selectAllOffre() {
		$tabOffres = array();
		$dsn = "mysql:host=localhost;dbname=seekjob;charset=UTF8";
		$pdo = new PDO($dsn, "root", "");
		$sql = "CALL select_offre_homePage()";
		$ret = $pdo->query($sql);

		while ($o = $ret->fetch(PDO::FETCH_ASSOC)) {
//die();
			$offre = new Offre(
					$cp = $o['cp'], $date_creation = $o['date_creation'], $description = $o['description'], $id = $o['id'], $societe_id = $o['societe_id'], $denomination = $o['denomination'], $titre = $o['titre'], $type = $o['type'], $ville = $o['ville']);
//			var_dump($offre);
//			die();
//echo $o['id'] . '<br />';
//Recuperer toutes les competences de chaque offre
			$pdo2 = new PDO($dsn, "root", "");
			$allTags = "CALL selectAllTagByOffreId(" . $o['id'] . ")";
			$ret2 = $pdo2->query($allTags);
			while ($tag = $ret2->fetch()) {
//				var_dump($tag);
//				$tagIn = new Tag($tag['tag_id'], $tag['titre']);
				$offre->setTabCompetences(new Tag($tag['tag_id'], $tag['titre']));
			}
//var_dump($offre->getTabCompetences());
			$tabOffres[] = $offre;
		}
		return $tabOffres;
	}

	public function saveCandidature(Candidature $candidature) {

		$dsn = "mysql:host=localhost;dbname=seekjob;charset=UTF8";

		$pdo = new PDO($dsn, "root", "");
		$stmt = $pdo->prepare("CALL addCandidature(?,?,?)");

		$stmt->bindValue(1, $candidature->getCandidat_id());
		$stmt->bindValue(2, $candidature->getOffre_id());
		$stmt->bindValue(3, $candidature->getMessage_motivation());
		$stmt->execute();

		$retour = $stmt->closeCursor();
		return $retour;
	}

	public function deleteCandidature(Candidature $candidature) {
		
	}

}
