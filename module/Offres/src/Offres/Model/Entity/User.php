<?php

/**
 * Description of User
 *
 * @author esteban
 */
class User {

	protected $cp;
	protected $date_inscription;
	protected $id;
	protected $mail;
	protected $nom;
	protected $password;
	protected $prenom;
	protected $tel;
	protected $type;
	protected $ville;

	function __construct($cp = null, $date_inscription= null, $id= null, $mail=null, $nom = null, $password = null, $prenom = null, $tel = null, $type = null, $ville = null) {
		$this->cp = $cp;
		$this->date_inscription = $date_inscription;
		$this->id = $id;
		$this->mail = $mail;
		$this->nom = $nom;
		$this->password = $password;
		$this->prenom = $prenom;
		$this->tel = $tel;
		$this->type = $type;
		$this->ville = $ville;
	}

	public function getCp() {
		return $this->cp;
	}

	public function getDate_inscription() {
		return $this->date_inscription;
	}

	public function getId() {
		return $this->id;
	}

	public function getMail() {
		return $this->mail;
	}

	public function getNom() {
		return $this->nom;
	}

	public function getPassword() {
		return $this->password;
	}

	public function getPrenom() {
		return $this->prenom;
	}

	public function getTel() {
		return $this->tel;
	}

	public function getType() {
		return $this->type;
	}

	public function getVille() {
		return $this->ville;
	}

	public function setCp($cp) {
		$this->cp = $cp;
		return $this;
	}

	public function setDate_inscription($date_inscription) {
		$this->date_inscription = $date_inscription;
		return $this;
	}

	public function setId($id) {
		$this->id = $id;
		return $this;
	}

	public function setMail($mail) {
		$this->mail = $mail;
		return $this;
	}

	public function setNom($nom) {
		$this->nom = $nom;
		return $this;
	}

	public function setPassword($password) {
		$this->password = $password;
		return $this;
	}

	public function setPrenom($prenom) {
		$this->prenom = $prenom;
		return $this;
	}

	public function setTel($tel) {
		$this->tel = $tel;
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

}
