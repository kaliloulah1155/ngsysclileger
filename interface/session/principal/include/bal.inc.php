<?php

// Creation d'une classe contenant les informations d'une boîte aux lettres
// pour pouvoir stocker ces informations en session.

define("TYPE_TITRE", 1);
define("TYPE_BAL", 2);
 
class Bal {

    var $iType;
	var $szCode;
	var $szLibelle;
	var $szLibelleComment;
	var $szProfilLr;
	var $bOpen;
	var $bVariable;
	var $szIcone;
    var $szStyle;
	
	// Constructeur : en argument une structure issu de la structure retourné
	// par php_vulcain
	function __construct($stBalVulcain) 
	{
	    $this->iType = TYPE_BAL;
		$this->bOpen = $stBalVulcain->b_open;
		$this->szCode = $stBalVulcain->code;
		$this->szLibelle = $stBalVulcain->libelle;
		$this->szLibelleComment = $stBalVulcain->libelle_comment;
		$this->szProfilLr = $stBalVulcain->profil_lr;
		$this->bVariable = 0;
		$this->szIcone = "";
        $this->szStyle = "";
	}
	
	// Constructeur : en argument une structure issu de la structure retournée
	// par php_vulcain
	function InitBal($iType, $bOpen, $szCode, $szLibelle, $szLibelleComment, $szProfilLr) 
	{
	    $this->iType = $iType;
		$this->bOpen = $bOpen;
		$this->szCode = $szCode;
		$this->szLibelle = $szLibelle;
		$this->szLibelleComment = $szLibelleComment;
		$this->szProfilLr = $szProfilLr;
		
		$this->bVariable = 0;
	}

}

class Bal11 extends Bal
{
	var $tabListeFils;
	
    // Constructeur : en argument une structure issu de la structure retourné
	// par php_vulcain
	function __construct($iType, $bOpen, $szCode, $szLibelle, $szLibelleComment, $szProfilLr, $szIcone, $szStyle)
	{
		parent::InitBal($iType, $bOpen, $szCode, $szLibelle, $szLibelleComment, $szProfilLr);
		$this->szIcone = $szIcone;
        $this->szStyle = $szStyle;
		$tabListeFils = array();
	}
}

class Titre
{
	var $szIcone;
	var $tabListeFils;
    // Constructeur : en argument une structure issu de la structure retourné
	// par php_vulcain
	function Bal11()
	{
		$tabListeFils = array();
	}
}

?>