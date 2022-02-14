<?php
/*
* DESCRIPTION : suppression des profils de liste résumée
* 
* AUTEUR: Sébastien Costanzo
*
* DATE DE CREATION: 20.11.03
*
*/ 

include ("../include/connexion.inc.php");
include ("../include/debug.inc.php");
session_start();
//connexion à poseidon
$retour = connexion($jeton);
if ($retour)
{
    $retour = pos_delplr($jeton, urldecode(stripslashes($_REQUEST["SZ_PROFIL"])));
    if (!$retour)
    	debug($jeton);
    include("../gestionprofillr/afficher_gestion_profils.php");
    
    // deconnexion
    pos_disconnect($jeton);
}
else
{
	debug($jeton);
	echec_connexion();
}
?>