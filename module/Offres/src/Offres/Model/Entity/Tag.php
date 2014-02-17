<?php

/**
 * Description of Tag
 *
 * @author esteban
 */
namespace Offres\Model\Entity ;
class Tag {

	protected $id;
	protected $titre;

	function __construct($id, $titre) {
		$this->id = $id;
		$this->titre = $titre;
	}

	public function getId() {
		return $this->id;
	}

	public function getTitre() {
		return $this->titre;
	}

	public function setId($id) {
		$this->id = $id;
		return $this;
	}

	public function setTitre($titre) {
		$this->titre = $titre;
		return $this;
	}

}
