<?php

/**
 * Description of Offre
 *
 * @author esteban
 */

namespace Offres\Model\Entity;

class Offre {

	protected $cp;
	protected $date_creation;
	protected $description;
	protected $id;
	protected $societe_id;
	protected $denomination;
	protected $titre;
	protected $type;
	protected $ville;
	protected $offre_has_tag = array();

	function __construct(
	$cp = null, $date_creation = null, $description = null, $id = null, $societe_id = null,$denomination = null,$titre = null, $type = null, $ville = null, $tabCompetences = null
	) {
		$this->cp = $cp;
		$this->date_creation = $date_creation;
		$this->description = $description;
		$this->id = $id;
		$this->societe_id = $societe_id;
		$this->denomination = $denomination;
		$this->titre = $titre;
		$this->type = $type;
		$this->ville = $ville;
		$this->offre_has_tag = $tabCompetences;
	}

	public function getCp() {
		return $this->cp;
	}

	public function getDate_creation() {
		return $this->date_creation;
	}

	public function getDescription() {
		return $this->description;
	}

	public function getId() {
		return $this->id;
	}

	public function getSociete_id() {
		return $this->societe_id;
	}

	public function getTitre() {
		return $this->titre;
	}

	public function getType() {
		return $this->type;
	}

	public function getVille() {
		return $this->ville;
	}

	public function getTabCompetences() {
		return $this->offre_has_tag;
	}

	public function setCp($cp) {
		$this->cp = $cp;
		return $this;
	}

	public function setDate_creation($date_creation) {
		$this->date_creation = $date_creation;
		return $this;
	}

	public function setDescription($description) {
		$this->description = $description;
		return $this;
	}

	public function setId($id) {
		$this->id = $id;
		return $this;
	}

	public function setSociete_id($societe_id) {
		$this->societe_id = $societe_id;
		return $this;
	}
	public function getDenomination() {
		return $this->denomination;
	}

	public function setDenomination($denomination) {
		$this->denomination = $denomination;
		return $this;
	}

		public function setTitre($titre) {
		$this->titre = $titre;
		return $this;
	}

	public function setType($type) {
		$this->type = $type;
		return $this;
	}

	public function setVille($ville) {
		$this->ville = $ville;
		return $this;
	}

	public function setTabCompetences(Tag $tag) {
		$this->offre_has_tag[] = $tag;
		return $this;
	}

}
