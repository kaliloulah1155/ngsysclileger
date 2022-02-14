<?php
/*
* DESCRIPTION : suppression des questions de la bibliothèque
* 
* AUTEUR: Sébastien Costanzo
*
* DATE DE CREATION: 19.06.03
* 11.03.2005 : SCO-GG : réaffichage de l'écran de gestion des questions
* 21.01.2008 PL les variables issues de GET et POST sont recuperees par $_REQUEST
*/ 

include ("../include/connexion.inc.php");
include ("../include/debug.inc.php");

session_start();

//connexion à poseidon
$retour = connexion($jeton);
if ($retour)
{
    //on récupère les questions de la bib                       
    $retour = pos_bib_suppquest($jeton, stripslashes(urldecode($_REQUEST['POS_QUEST_NOM'])), $_REQUEST['POS_QUEST_PUBLIC']); 
    
    if (!$retour)
    	debug($jeton);
	else {
        $_REQUEST["POS_NOM_QUEST"] = urldecode($_REQUEST['POS_QUEST_NOM']); 
        $B_SUPP_QUESTION_BIB=true;
    }
    	
    include("../gestionbiblio/afficher_question_bib.php");
    
    // deconnexion
    pos_disconnect($jeton);
}
else
{
	debug($jeton);
	echec_connexion();
}
?>