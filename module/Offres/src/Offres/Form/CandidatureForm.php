<?php

/**
 * Description of CandidatureForm
 *
 * @author esteban
 */

namespace Offres\Form;

class CandidatureForm extends \Zend\Form\Form {

	function __construct($name = null, $options = array()) {
		parent::__construct("candidature");
		//TODO AJOUTER LES CHAMPS SUIVANTS	
		//idUser
		//Nom 
		//Prénom 
		//Email 
		//Votre message : 
		//Envoyer votre CV 
		//Formats .pdf, .odt, .doc, poids max 10M

		/**
		 * @var \Zend\Form\Element  $element
		 * @description  element input hidden pour garder l'info idUser
		 */
//		$element = \Zend\Form\Element\Hidden("idUser");
//		$this->add($element);
//
//		$element = new \Zend\Form\Element\Text("nom");
//		$element->setLabel("Nom")
//				->setAttribute("placeholder", "Nom");
//		$this->add($element);
//
//		$element = new \Zend\Form\Element\Text("prenom");
//		$element->setLabel("Prénom")
//				->setAttribute("placeholder", "Prénom");
//		$this->add($element);
//
//		$element = new \Zend\Form\Element\Email("email");
//		$element->setLabel("Email")
//				->setAttribute("placeholder", "ex .votreMail@domain.fr");
//		$this->add($element);
//
//		$element = new \Zend\Form\Element\Textarea("messageMotivation");
//		$element->setLabel("Votre message de motivation :")
//				->setAttribute("placeholder", "ex .votreMail@domain.fr");
//		$this->add($element);
//
//		$element = new \Zend\Form\Element\File("messageMotivation");
//		$element->setLabel("Votre message de motivation :")
//				->setAttribute("placeholder", "ex .votreMail@domain.fr");
//		$this->add($element);
//
//		$element = new \Zend\Form\Element\File("cv");
//		$element->setLabel("Veuillez joindre votre cv");
//		$this->add($element);
//
//		$element = new \Zend\Form\Element\Submit("submit");
//		$element->setValue("Valider");
//		$this->add($element);
	}

}
