<?php
/*
 * DESCRIPTION : Mise à jour en rafale
 * AUTEUR : Gabrielle Guy
 * DATE de CREATION : 04/11/2011
 *
 */
include ("../include/locution.inc.php");
session_start();
include ("../include/connexion.inc.php");
include ("../include/debug.inc.php");
$retour = connexion($jeton);
if ($retour)
{
    $szValeurInitiale = $_REQUEST["VALEUR_INITIALE"];
	$szValeurFinale = $_REQUEST["VALEUR_FINALE"];
	$szCodeRub = $_REQUEST["CODE_RUBRIQUE"];
	$bValeurInitiale = (strlen($szValeurInitiale) == 0) ? 0 : 1;
    $isQuestion = false;
    $isDossier = false;
    $iNumDossier = 0;
    $dwNbDocsModifies = 0;
    if (isset($_REQUEST["INUMQUEST"]) && strlen($_REQUEST["INUMQUEST"]) > 0)
	{
        $isQuestion = true;
		// recuperation des locutions de la question posée 
		$tabLoc = array_slice($_SESSION["sess_tabHistQuest"][0][$_REQUEST["INUMQUEST"]], 0, count($_SESSION["sess_tabHistQuest"][0][$_REQUEST["INUMQUEST"]]));
		$retour = pos_searchdoc($jeton,count($tabLoc), $tabLoc, /*pref*/$iNbReponses, /*pref*/$iAdrPremiereReponse);
	} // cas du resultat d'une question
	else
	{
		if (isset($_REQUEST["INUMDOS"]) && $_REQUEST["INUMDOS"] >= 0)
	       $isDossier = true;
    }
	
    // cas d'une question
    if ($isQuestion && strcmp($_REQUEST["SELECTION_REPONSE"], "toutes") == 0) 
    {
        if ($iNbReponses != 0)
            $retour = pos_majrafalettsrep($jeton, $iAdrPremiereReponse, $iNbReponses, $szCodeRub, $szValeurInitiale,
				 $szValeurFinale, $bValeurInitiale, /*pref*/$dwNbDocsModifies);
    } // fin cas du resultat d'une question
    else 
    {
        // cas d'un dossier
		$tabNumDoc = array();
        if ($isDossier && strcmp($_REQUEST["SELECTION_REPONSE"], "toutes") == 0)  
        {
	        $retour = pos_dosinfocontenu($jeton, $_REQUEST["INUMDOS"], /*pref*/$tabFils);
	        //print_r($tabFils);
            for ($i=0; $i < count($tabFils); $i++)
                $tabNumDoc[$i] = $tabFils[$i]->doc_numero;
	    }
	    else 
        {
	    	$listeTabNumDoc = $_REQUEST["LISTE_NUMDOC"];
	        if (isset($_REQUEST["LISTE_NUMDOC"]) && strlen($_REQUEST["LISTE_NUMDOC"]) > 0) 
            {
	        	// suppression du dernier ;
	        	$listeTabNumDoc = substr($_REQUEST["LISTE_NUMDOC"], 0, strlen($_REQUEST["LISTE_NUMDOC"]) - 1);
	        	$tabNumDoc = explode (";", $listeTabNumDoc);
	        }
	    }
	    $retour = pos_majrafale($jeton, $tabNumDoc, $szCodeRub, $szValeurInitiale,
				 $szValeurFinale, $bValeurInitiale, /*pref*/$dwNbDocsModifies);
	}

    $tabInfoDebug = array();
    $tabInfoDebug[0] = "$dwNbDocsModifies document(s) ont été modifiés.";
    debug_code($tabInfoDebug);
    
    echo("<script>");
    echo("parent.center.actualiser();");
    echo("parent.parent.closeFileModif();");
    echo("</script>");
	pos_disconnect($jeton);	
}
else
{
	debug($jeton);
	echec_connexion();
}

?>
