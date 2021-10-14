<?php
/* 
 * Modification de liste hiérarchique 
 *
 * PL 30/01/2008
 *
 * Données en entrée :
 *  
 * 08.03.2011 PL Modification pour affichage en fonction des profils hiérarchiques 
 */
session_start();
require("../ajax/JSON.php");
include ("../include/util_headers.php");
include ("../include/connexion.inc.php");
include ("../include/debug.inc.php");

define ("SEPARATEUR", "\x02");

function extraireValeurs($szListe)
{
	$tok = strtok($szListe, SEPARATEUR);
	$nbMots=0;
	$tabmots = array();

	while($tok != false && strlen(trim($tok)))
	{
		$mot=$tok;
		$tabmots[$nbMots]=$mot;
		$nbMots ++;
		$tok=strtok(SEPARATEUR);		
	}
	return $tabmots;
}

writeHeadersNoCache();

$json = new Services_JSON();
$objRetour = array();
$objRetour["code_retour"] = 1;
$objRetour["msg_erreur"] = "";
$objRetour["listhier"] = array();

$retour = connexion($jeton);
if (!$retour)
	{
 		$objRetour["code_retour"] = 0;
		$objRetour["msg_erreur"] = get_erreur_poseidon($jeton);
	}
else { //connexion a poseidon
	
	$szlisteName = $_REQUEST['POS_CODE_LISTHIER'];
	
	if (strlen($_REQUEST['POS_CHEMIN']) == 0)
		$szChemin = "";
	else
		$szChemin = stripslashes(urldecode($_REQUEST['POS_CHEMIN']));
		
	$szProfil = $_REQUEST['POS_PROFILHIER'];
	$szValeur = "";
	$needrecherche = false;
	
	if (strcmp($_REQUEST['POS_ACTION'], "ajout") == 0) {
        $needrecherche = true;
		$szCheminValeur = $szChemin.chr(2).stripslashes(urldecode($_REQUEST['POS_VAL_HIER']));
		$retour = pos_lsthierelm($jeton, 3, $szlisteName, $szCheminValeur, $szProfil, $szValeur);
	}	
	
	if (strcmp($_REQUEST['POS_ACTION'], "recherche") == 0 || $needrecherche == true) {
		$retour = pos_getlistehier($jeton, $szlisteName, $szChemin, $szProfil,/*pref*/$szValeur);	
		if ($retour)
		{
			$child = extraireValeurs($szValeur);
			for($i=0;$i<count($child);$i++)
				$objRetour["listhier"][$i] = $child[$i];
		}
	}
	else if (strcmp($_REQUEST['POS_ACTION'], "modification") == 0) {
		$szChemin = rtrim($szChemin,chr(2));
		$szValeur = stripslashes(urldecode($_REQUEST['POS_VAL_HIER']));
		$retour = pos_lsthierelm($jeton, 6, $szlisteName, $szChemin, $szProfil, $szValeur);
		if ($retour) {
			$objRetour["listhier"][0] = stripslashes(urldecode($_REQUEST['POS_VAL_HIER']));
		}		
	}
	else if (strcmp($_REQUEST['POS_ACTION'], "suppression") == 0) {
			$szChemin = rtrim($szChemin,chr(2));
		$retour = pos_lsthierelm($jeton, 5, $szlisteName, $szChemin, $szProfil, $szValeur);
	}
    if (!$retour)
    {
        $objRetour["code_retour"] = 0;
        $objRetour["msg_erreur"] = get_erreur_poseidon($jeton);
    }
    else {
        if (strcmp($_REQUEST['POS_ACTION'], "recherche") != 0 /*&& strlen($szChemin) == 0*/) {
            include("../gestiondomain/fct_ecrire_fichier.inc.php");
            ecrireValeursFichier($jeton, $_REQUEST['POS_CODE_LISTHIER'], true);
        }
    }
}

//$retour = pos_logout($jeton, 1);
$retour = pos_disconnect($jeton);
$output = $json->encode($objRetour);
print($output);
?>

