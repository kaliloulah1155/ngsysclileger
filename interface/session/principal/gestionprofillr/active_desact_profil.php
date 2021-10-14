<?php
/*
* DESCRIPTION : Gestion de l'activation/desactivation d'un profil
* 
* AUTEUR: Sébastien Costanzo
*
* DATE DE CREATION: 19.11.03
*
*/ 
include ("../include/connexion.inc.php");
include ("../include/debug.inc.php");

session_start();

//connexion à poseidon
$retour = connexion($jeton);
if ($retour)
{
    $typeService = ($_REQUEST["B_ACTIF"] == 0)? 10 : 12;
    // Pour info
    //define GET_CUSTOM_DEFAULT  8
    //define GET_DEFAULT         9
    //define INIT_CUSTOM_DEFAULT 10
    //define INIT_DEFAULT        11
    //define DEL_CUSTOM_DEFAULT  12
    //define DEL_DEFAULT         13
    $sProfil = urldecode(stripslashes($_REQUEST["SZ_PROFIL"]));
	$retour = pos_gestassoplr($jeton, $typeService, urldecode($_REQUEST["SZ_TYPEDOC"]), /*pref*/$sProfil);

	if (!$retour)
		debug($jeton);
	
	include("afficher_gestion_profils.php");
	
    // deconnexion
    pos_disconnect($jeton);
}
else
{
	debug($jeton);
	echec_connexion();
}

?>