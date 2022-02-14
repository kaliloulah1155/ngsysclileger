<?php
/*-------------------------------------------------------------------
 * DESCRIPTION : Récupération des fils d'un dossier
 * 
 * AUTEUR: GG
 * DATE DE CREATION: 13/10/2011
 * LISTE DE FONCTIONS: 
 * DESCRIPTION : 
 * -------------------------------------------------------------------
 */
 session_start();
include ("../include/json/JSON.php");
include ("../include/util_headers.php");
include ("../include/connexion.inc.php");

writeHeadersNoCache();
$json = new Services_JSON();
$objRetour = array();
$objRetour["code_retour"] = 1;
$objRetour["msg_erreur"] = "";
$objRetour["liste_fils"] = array();

$iNumDoc = $_REQUEST["POS_NUMDOS"];

//connexion à poseidon
$retour = connexion($jeton);

if ($retour)
{
    $tabFils = array();
    $retour = pos_dosinfocontenu($jeton, $_REQUEST["POS_NUMDOS"], /*pref*/$tabFils);
    pos_disconnect($jeton);
}
else
{
	$objRetour["code_retour"] = 0;
	$objRetour["msg_erreur"] = get_erreur_poseidon($jeton);
}
if ($retour)
{
    $tabListeFils = array();
    $compt = 0;
	for ($i=0; $i<count($tabFils); $i++)
	{
	   if (strlen($tabFils[$i]->noeud_libelle) != 0)
	   {
    	   $tabListeFils[$compt]['num'] = $tabFils[$i]->doc_numero;
    	   $tabListeFils[$compt++]['libelle'] = $tabFils[$i]->noeud_libelle;
	   }
	}
	$objRetour["liste_fils"] = $tabListeFils;
	
}
else
{
	$objRetour["code_retour"] = 0;
	$objRetour["msg_erreur"] = get_erreur_poseidon($jeton);
}
$output = $json->encode($objRetour);
print($output);
?>
