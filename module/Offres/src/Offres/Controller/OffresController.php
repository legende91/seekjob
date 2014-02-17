<?php

namespace Offres\Controller;

use Zend\Mvc\Controller\AbstractActionController;
use Zend\View\Model\ViewModel;
use Offres\Model\OffreGateway;

class OffresController extends AbstractActionController {

	/**
	 * 
	 * @var \Zend\Http\Request
	 */
	protected $request;

	//TODO recuperer toutes les offres
	/**
	 * 
	 * @return \Zend\View\Model\ViewModel
	 */
	public function indexAction() {
		$g = new OffreGateway();

		$allOffres = $g->selectAllOffre();
		//var_dump($allOffres);
		return new ViewModel(array('allOffres' => $allOffres));
	}

	//TODO recuperer les offres selons les criteres selectionnees
	/**
	 * 
	 * @return \Zend\View\Model\ViewModel
	 */
	public function rechercheAction() {
		return new ViewModel();
	}

	//TODO recuperer le detail de l'offre choisi
	/**
	 * 
	 * @return \Zend\View\Model\ViewModel
	 */
	public function detailAction() {
	//TODO trouver comment utilizer plutot les forms de ZEND	
	//$form = new \Offres\Form\CandidatureForm();
		
		$g = new OffreGateway();

		$id = $this->params("id");
		//var_dump($this->params());

		$offreDetail = $g->selectOffreById($id);
//		var_dump($offreDetail);
//		die();
		return new ViewModel(array('offre' => $offreDetail, 'userID' => 1,'form' => $form));
	}

	//TODO Creer formulaire d'inscription
	/**
	 * 
	 * @return \Zend\View\Model\ViewModel
	 */
	public function inscriptionAction() {
		return new ViewModel();
	}

	//TODO afficher le formulaire d'ajout d'une offre
	/**
	 * 
	 * @return \Zend\View\Model\ViewModel
	 */
	public function ajouterAction() {



		return new ViewModel();
	}

	//TODO afficher le formulaire de modification d'une offre
	/**
	 * 
	 * @return \Zend\View\Model\ViewModel
	 */
	public function modifierAction() {
		return new ViewModel();
	}

	//TODO suppresion d'une offre
	//TODO penser à securiser l'appel de cette page afin 'eviter la suppression en masse
	public function supprimerAction() {
		return new ViewModel();
	}

}
