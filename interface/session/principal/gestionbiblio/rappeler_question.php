<?php
/*
* DESCRIPTION : Rappel des questions de la biblioth�que
* 
* AUTEUR: S�bastien Costanzo
*
* DATE DE CREATION: 18.02.04
*
* 21.01.2008 PL les variables issues de GET et POST sont recuperees par $_REQUEST
*/ 
include ("../include/locution.inc.php");
include ("../include/connexion.inc.php");
include ("../include/template.inc.php");
include ("../include/debug.inc.php");
session_start();
include ("../../../../configuration_w/constantesPHP.conf.php");
include ("../../../../configuration/label_".$_SESSION["sess_langue"].".conf");
include ("../../../../configuration/url.conf.php");

//connexion � poseidon
$retour = connexion($jeton);
if ($retour)
{
    //on r�cup�re les locutions de la questions de la bib
    $retour = pos_bib_getlocutionsquest($jeton, stripslashes(urldecode($_REQUEST['POS_QUEST_NOM'])), $_REQUEST['POS_QUEST_PUBLIC'], /*pref*/$tabLocBib);
    if($retour)
    {
        $bPosTypeDocOk = true;
        // on boucle sur le nombre de locutions
        for($i=0;$i<count($tabLocBib);$i++)
        {
            if((!isset($_REQUEST['POS_TYPEDOC']) || strcmp($_REQUEST['POS_TYPEDOC'],$tabLocBib[$i]->code_typ) == 0) 
                && strcmp($tabLocBib[$i]->code_typlie, "000") != 0)
            {
                $_REQUEST['POS_TYPEDOC'] = $tabLocBib[$i]->code_typ;
                copyLocutionBibToLocutionPhp($tabLocBib[$i], /*pref*/$tabLoc[$i]);
            }
            else
            {
                $bPosTypeDocOk = false;
                break;
            }
        }
    }
    else 
    {
    	$bPosTypeDocOk = false;
        debug($jeton);
    }
        
    if($bPosTypeDocOk)
    {    
        if(isset($_SESSION["sess_tabHistQuest"][0]) )
        	$iNumQuest = count ($_SESSION["sess_tabHistQuest"][0]);
        else
        	$iNumQuest = 0;
        
        // la question n'�tait pas dans l'historique -> on la rentre
        $_SESSION["sess_tabHistQuest"][0][$iNumQuest] = array_slice($tabLoc, 0, count($tabLoc));
        $_SESSION["sess_tabHistQuest"][3][$iNumQuest] = "RECHERCHE_BIB";
        $_REQUEST["INUMQUEST"] = $iNumQuest;
        include("../recherche/afficher_recherche_elaboree.php");
    }
    else
    {
        $tabMsg = array();
        $tabMsg[0] = CST_MESSAGE_NO_AFFICHE_QUESTION_BIB;
        debug_code($tabMsg);
		include("afficher_question_bib.php");
    }

    // deconnexion
    pos_disconnect($jeton);
}
else
{
	debug($jeton);
	echec_connexion();
}

?>