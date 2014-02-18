<?php

/**
 * Description of Candidature
 *
 * @author esteban
 */

namespace Offres\Model\Entity;

class Candidature {

	protected $candidat_id;
	protected $offre_id;
	protected $message_motivation;

	function __construct($candidat_id = null, $offre_id = null, $message_motivation = null) {
		$this->candidat_id = $candidat_id;
		$this->offre_id = $offre_id;
		$this->message_motivation = $message_motivation;
	}

	public function getCandidat_id() {
		return $this->candidat_id;
	}

	public function getOffre_id() {
		return $this->offre_id;
	}

	public function getMessage_motivation() {
		return $this->message_motivation;
	}

	public function setCandidat_id($candidat_id) {
		$this->candidat_id = $candidat_id;
		return $this;
	}

	public function setOffre_id($offre_id) {
		$this->offre_id = $offre_id;
		return $this;
	}

	public function setMessage_motivation($message_motivation) {
		$this->message_motivation = $message_motivation;
		return $this;
	}

	//candidat_id
	//date_candidature
	//message_motivation
	//offre_id
}
