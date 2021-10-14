<?php
/*************************************************************************
* DESCRIPTION : Lancer une actions Hermès pour un document
* 
* AUTEUR: GG
* DATE DE CREATION: 28/05/2009
* Données en entrées 
*  $_REQUEST["POS_NUM_DOC"] : le numéro de document
*  $_REQUEST["POS_HERM_CODEACT"] : le code de l'action à lancer
*  ///$_REQUEST["POS_HERM_LIBACT"] : le libellé de l'action à lancer
* ----------------------------------------------------------------------------
* MODIFICATIONS :
*************************************************************************/
session_start();
include ("../include/json/JSON.php");
include ("../include/util_headers.php");
include ("../include/connexion.inc.php");
include ("../include/fonction_util.inc.php");
include ("../specifique/fonctions_specifiques.php");

writeHeadersNoCache();
$json = new Services_JSON();
$objRetour = array();
$objRetour["code_retour"] = 1;
$objRetour["msg_erreur"] = "";

$iNumDoc = $_REQUEST["POS_NUM_DOC"];
$szCodeActionHermes = $_REQUEST["POS_HERM_CODEACT"];

//connexion à poseidon
$retour = connexion($jeton);

if ($retour)
{
    $tabActionHermes = array();
    $retour = pos_hermes_rempliraction($jeton, $iNumDoc, /*pref*/$tabActionHermes);
}
else
{
	$objRetour["code_retour"] = 0;
	$objRetour["msg_erreur"] = get_erreur_poseidon($jeton);
}

if ($retour)
{
    // recherche si l'action est disponible pour ce document
    $bTrouve = false;
	for ($i=0;$i<count($tabActionHermes); $i++)
	{
		if (strcmp($szCodeActionHermes, $tabActionHermes[$i]->action_code) == 0)
		{
            $bTrouve = true;
            break;
        }
	}
	
    if ($bTrouve)
	{
		$szNomFichier = getRepTmpSession(session_id());
		$szNomFichier .= "exportationHermes_$iNumDoc.txt";
		$tabCodeRubModif = array();

        // lancement de l'action est disponible pour ce document		
		$retour = pos_hermes_lanceraction($jeton, $iNumDoc, $szCodeActionHermes, 
			$tabCodeRubModif, $szNomFichier, /*pref*/$dwAfficheDoc, /*pref*/$dwNumDocAff, /*pref*/$szInfo);
		if(!$retour)
		{
			$objRetour["code_retour"] = 0;
			$objRetour["msg_erreur"] = "Erreur au lancement de l'action pour le document $iNumDoc :";
			$objRetour["msg_erreur"] .="\n".get_erreur_poseidon($jeton);
		}
		else
		{
			if (strcmp($szCodeActionHermes, "ACT_DUP_DOS") == 0)
			{
			    $retour = copierDossier($jeton, $iNumDoc);
			    if(!$retour)
			    {
    	        	$objRetour["code_retour"] = 0;
    	        	$objRetour["msg_erreur"] = get_erreur_poseidon($jeton);
                }
	     	}
        }
	}
	else
	{
	   $objRetour["code_retour"] = 0;
	   $objRetour["msg_erreur"] = "L'action n'est pas disponible pour le document $iNumDoc.";
	}
	
	pos_disconnect($jeton);
}
else
{
	$objRetour["code_retour"] = 0;
	$objRetour["msg_erreur"] = get_erreur_poseidon($jeton);
}

$output = $json->encode($objRetour);
print($output);
?>
