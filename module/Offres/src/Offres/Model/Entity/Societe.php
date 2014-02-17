<?php

/**
 * Description of Societe
 *
 * @author esteban
 */

namespace Offres\Model\Entity;

use User;

class Societe extends User {

	protected $denomination,
			$logo,
			$user_id;

	public function getDenomination() {
		return $this->denomination;
	}

	public function getLogo() {
		return $this->logo;
	}

	public function getUser_id() {
		return $this->user_id;
	}

	public function setDenomination($denomination) {
		$this->denomination = $denomination;
		return $this;
	}

	public function setLogo($logo) {
		$this->logo = $logo;
		return $this;
	}

	public function setUser_id($user_id) {
		$this->user_id = $user_id;
		return $this;
	}

}
