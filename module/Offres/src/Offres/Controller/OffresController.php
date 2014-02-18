<?php

namespace Offres\Controller;

use Offres\Model\CandidatureGateway;
use Offres\Model\Entity\Candidature;
use Offres\Model\OffreGateway;
use Zend\Http\Request;
use Zend\Mvc\Controller\AbstractActionController;
use Zend\View\Model\ViewModel;

class OffresController extends AbstractActionController {

	/**
	 * 
	 * @var Request
	 */
	protected $request;

	//TODO recuperer toutes les offres
	/**
	 * 
	 * @return ViewModel
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
	 * @return ViewModel
	 */
	public function rechercheAction() {
		return new ViewModel();
	}

	//TODO recuperer le detail de l'offre choisi
	/**
	 * 
	 * @return ViewModel
	 */
	public function detailAction() {

		//TODO variables a recuperer si POST pour soumettre candidature
		//	'user_id' => string '1' (length=1)
		//  'offre_id' => string '5' (length=1)
		//  'nom' => string 'totot' (length=5)
		//  'prenom' => string 'ioherherohg' (length=11)
		//  'mail' => string 'mail@mail.com' (length=13)
		//  'messageMotiv' => string 'zjkeflkzjvblkzjvblzjhvblze' (length=26)
		//  'cv' => string 'Créez votre premier site web - De la conception à la réalisation.html' (length=72)

		if ($this->request->isPost()) {
			//TODO verifier si le candidat a un cv et lettre de motivation donc n'est pas afficher 
			//le formulaire juste une notifif
			//TODO Gestion d'envois du ficher
			//TODO recuperer les infos soumis par l user et le sauver dans la base
			// et le fichier le sauver dans un dossier avec le nomprenom_userID/cv

			$data = $this->request->getPost();

			$g = new CandidatureGateway();
			$retour = $g->saveCandidature(new Candidature($data->user_id, $data->offre_id, $data->message_motivation));

			return $this->redirect()->toRoute("home");
		}

		//CAS lorsqu'on arrive de la page offres
		$g = new OffreGateway();
		$offre_id = $this->params("id");
		$offreDetail = $g->selectOffreById($offre_id);
		return new ViewModel(array('offre' => $offreDetail, 'userID' => 2, 'offre_id' => $offre_id));
	}

	//TODO Creer formulaire d'inscription
	/**
	 * 
	 * @return ViewModel
	 */
	public function inscriptionAction() {
		return new ViewModel();
	}

	//TODO afficher le formulaire d'ajout d'une offre
	/**
	 * 
	 * @return ViewModel
	 */
	public function ajouterAction() {



		return new ViewModel();
	}

	//TODO afficher le formulaire de modification d'une offre
	/**
	 * 
	 * @return ViewModel
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
