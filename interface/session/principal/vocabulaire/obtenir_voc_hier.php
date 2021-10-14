<?php
/*
 *	Remplissage automatique des rubriques filles d'une lsite hierarchique
 *	Seb : 24/06/2002
 */
session_start();
require("../ajax/JSON.php");
include ("../include/util_headers.php");
include ("../include/connexion.inc.php");
include ("../include/liste_vocab.inc.php");

writeHeadersNoCache();

$json = new Services_JSON();
$objRetour = array();
$objRetour["code_retour"] = 1;
$objRetour["msg_erreur"] = "";
$objRetour["tablistefille"] = array();
$retour = connexion($jeton);
if ($retour)
{
	//recherche de la rubrique fille : dans la liste des rubriques, recherche la rubrique en cours
	$szCodeRubFille = "";
	$tabRubriqueListes = explode('|', $_REQUEST["POS_SZLISTRUB"]);
	$iPosRubriqueFille = count($tabRubriqueListes);
	for ($i = 0; $i<count($tabRubriqueListes);$i++)
	{
		if (strcmp($tabRubriqueListes[$i], $_REQUEST["POS_CODERUB"]) == 0)
		{
		    $iPosRubriqueFille = $i + 1;
			break;
		}
	}
	
	// a partir de la premiere rubrique fille et pour toute les rubrique fille tant qu'il n'y a qu'une valeur
	$iCptRubARenseigner = 0;
	$szDebutMot = stripslashes(urldecode($_REQUEST["POS_DEBUTMOT"]));
	for ($i=$iPosRubriqueFille;$i<count($tabRubriqueListes);$i++)
	{
	    $iNbLu = 0;
	    $szVocab = "";
	    $retour = pos_listevocab($jeton, $_REQUEST["POS_TYPEDOC"], $tabRubriqueListes[$i], POS_VOCAB_HIE_CODE, $szDebutMot, 0, 2, /*pref*/$iNbLu, /*pref*/$szVocab);
	   	
        // si une seule valeur en reponse
	    if($iNbLu == 1)
    	{
    	    $valeurMot = strtok($szVocab, SEPARATEUR);
    	    $objRetour["tablistefille"][$iCptRubARenseigner]["code"] = $tabRubriqueListes[$i];
    	    $objRetour["tablistefille"][$iCptRubARenseigner]["valeur"] = $valeurMot;
    	    $iCptRubARenseigner++;
    	    // initialisation pour la boucle suivante
    	    $szDebutMot .= $valeurMot.chr(0x02);
    	}
    	else
    	   break;
    }
    //header("Content-Type: text/html; charset=ISO-8859-1");
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