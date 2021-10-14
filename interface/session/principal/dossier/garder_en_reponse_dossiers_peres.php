<?php
/*
 * DESCRIPTION : Affiche l'arborescence des dossier référentiels.
 * 
 *
 * AUTEUR : Gabrielle Guy
 * DATE de CREATION : 30/10/2009
 *
 * Donnees en entree : 
 * NUM_DOS_ADDHISTO : le numéro à conserver dans l'historique 
 * POS_NUM_DOC : le numéro de document en cours pour réaffichage de l'historique 
 * TYPE_HISTO : HISTO_DOC ou HISTO_QUEST
 */
include ("../include/locution.inc.php");
session_start();
include ("../include/connexion.inc.php");
include ("../include/debug.inc.php");
include ("../include/template.inc.php");
include ("../include/question.inc.php");

include ("../../../../configuration_w/constantesPHP.conf.php");
include ("../../../../configuration/url.conf.php");
include ("../../../../configuration/label_".$_SESSION["sess_langue"].".conf");

$retour = connexion($jeton);

if($retour)
{
    if (strcmp($_REQUEST["TYPE_HISTO"], "HISTO_DOC") == 0)
    {
        $retour = pos_getinfonumdoc($jeton, $_REQUEST["NUM_DOS_ADDHISTO"], /*pref*/$objInfoNumDoc);
    	$szTypeDoc = $objInfoNumDoc->type_doc;
    	
    	if(!in_array($_REQUEST["NUM_DOS_ADDHISTO"]."|".$szTypeDoc, $_SESSION["sess_tab_doc_historique"]))
    	{
    		$_SESSION["sess_tab_doc_historique"][] = $_REQUEST["NUM_DOS_ADDHISTO"]."|".$szTypeDoc;
    	}
    }
    else
    {
        $tabLoc = array();
        $tabLoc[0] = new Locution(1, "000", "N D", "=", $_REQUEST["NUM_DOS_ADDHISTO"]);
    	if(isset($_SESSION["sess_tabHistQuest"][0]) )
    		$iNumQuest = count ($_SESSION["sess_tabHistQuest"][0]);
    	else
    		$iNumQuest = 0;
        
        // la question n'était pas dans l'historique -> on la rentre
    	$_SESSION["sess_tabHistQuest"][0][$iNumQuest] = array_slice($tabLoc, 0, count($tabLoc));
    
    	// conservation du nombre de réponses et de la date
    	$_SESSION["sess_tabHistQuest"][1][$iNumQuest] = 1; 
    	$_SESSION["sess_tabHistQuest"][2][$iNumQuest] = date("d/m/y  H:i"); 
    	$_SESSION["sess_tabHistQuest"][3][$iNumQuest] = "RECHERCHE_ELABOREE";
    
        $szTitreQuest = affiche_une_locution($jeton, 0, 1, $iNumQuest, 0, $_SESSION["sess_tabLibTypeDoc"]);
        echo "<script>";
        echo "parent.parent.updateMenuAddQuestion('".preg_replace('/\'/', '@', $szTitreQuest)."', '".$iNumQuest."', '1', 'RECHERCHE_ELABOREE');";
        echo "</script>";
    }
    include("../dossier/afficher_dossiers_peres.php");
    pos_disconnect($jeton);
}	
else
{
	debug($jeton);
	echec_connexion();
}

?>
