<?php
/*************************************************************************
* DESCRIPTION : Créer une fiche d'index
* AUTEUR: GG
* DATE DE CREATION: 08/02/2017
* Données en entrées 
*  $_REQUEST["tabindex"] : les locutions
*  $_REQUEST["POS_TYPEDOC"] : typedoc
* ----------------------------------------------------------------------------
* MODIFICATIONS :
*************************************************************************/
session_start();
include ("../include/json/JSON.php");
include ("../include/util_headers.php");
include ("../include/connexion.inc.php");
include ("../include/fonction_util.inc.php");
include ("../include/locution.inc.php");

writeHeadersNoCache();
$json = new Services_JSON();
$objRetour = array();
$objRetour["code_retour"] = 1;
$objRetour["msg_erreur"] = "";
$objRetour["numdoc"] = 0;

//connexion à poseidon
$retour = connexion($jeton);
if ($retour)
{
    if (isset($_REQUEST["tabindex"]) && isset($_REQUEST["typedoc"])) 
    {
        $tabIndex = (array) $json->decode($_REQUEST["tabindex"]);
        $tabIndex = array_map("utf8_decode", $tabIndex); 
        $iIndConf = (isset($_REQUEST["POS_CONF_HAB"])) ? $_REQUEST["POS_CONF_HAB"] : "0";
	    $iNivConf = (isset($_REQUEST["POS_CONF_NIV"])) ? $_REQUEST["POS_CONF_NIV"] : "0";
	    $szCloison = (isset($_REQUEST["POS_CLOISON"])) ? $_REQUEST["POS_CLOISON"] : "";
        $szTypeDoc = $_REQUEST['typedoc'];

        $retour = pos_createidx($jeton, $iIndConf, $iNivConf, $szCloison, 
					$szTypeDoc, count($tabIndex), $tabIndex, /*pref*/$iNumDoc);
        if ($retour)
            $objRetour["numdoc"] = $iNumDoc;
        else
        {
        	$objRetour["code_retour"] = 0;
        	$objRetour["msg_erreur"] = get_erreur_poseidon($jeton);
        }                    
    }
    else
    {
        $objRetour["code_retour"] = 0;
        $objRetour["msg_erreur"] = "Informations insuffisantes pour creer le document.";
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
