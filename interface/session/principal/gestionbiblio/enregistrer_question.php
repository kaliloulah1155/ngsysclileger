<?php
/*
 * DESCRIPTION : Enregistrement d'une question de la bibliothèque
 * AUTEUR: Sébastien Costanzo
 * DATE DE CREATION: 20.06.03
 *
 * 21.01.2008 PL les variables issues de GET et POST sont recuperees par $_REQUEST 
 */ 
include ("../include/locution.inc.php");
include ("../include/connexion.inc.php");
include ("../include/debug.inc.php");

session_start();

//connexion à poseidon
$retour = connexion($jeton);
if ($retour)
{
	// les locutions ont été enregistrees dans le tableau de session
	if(count($_SESSION["sess_tab_enreg_quest_bib"])>0)
	{
	    $sNomQuest = trim(stripslashes($_REQUEST['POS_NOM_QUEST']));
        if (isset($_REQUEST['POS_QUEST_EXISTE_DEJA']) && strcmp($_REQUEST['POS_QUEST_EXISTE_DEJA'], "1") == 0)
	    {
	       $retour = pos_bib_suppquest($jeton, $sNomQuest, $_REQUEST['POS_QUEST_PUBLIC']);
	    }
        if ($retour)
        {
    	    $bPartageable = (isset($_REQUEST['POS_QUEST_PARTAGEABLE']) && strcmp($_REQUEST['POS_QUEST_PARTAGEABLE'], "1") == 0)? 1:0;
    		$retour = pos_bib_enregquest($jeton, $sNomQuest, $bPartageable, $_SESSION["sess_tab_enreg_quest_bib"]);
    		if ($retour)
    		{
                if  (!$bPartageable)
        		  $B_AJOUTE_QUESTION_BIB=true;
        	}
    		else
    			debug($jeton);
        }
        else
            debug($jeton);
    		
    	$_SESSION["sess_tab_enreg_quest_bib"] = array();
	}
	else 
	{
		$tabMsg = array();
		$tabMsg[0] = "Erreur lors de la recuperation des locutions"; 
		debug_code($tabMsg);
	}
	
	include("afficher_question_bib.php");
	
    // deconnexion
    pos_disconnect($jeton);
}
else
{
	debug($jeton);
	echec_connexion();
}
?>