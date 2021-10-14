<?php
/*************************************************************************
* DESCRIPTION : Liste des pages d'un document
* 
* AUTEUR: GG
* DATE DE CREATION: 26/02/2020
* Données en entrées 
*  $_REQUEST["typedoc"] : typedoc
*  $_REQUEST["coderub"] : coderub
*  $_REQUEST["valeur"] : valeur
* ----------------------------------------------------------------------------
* MODIFICATIONS :
*************************************************************************/
session_start();
include ("../include/json/JSON.php");
include ("../include/util_headers.php");
include ("../include/connexion.inc.php");
include ("../include/fonction_util.inc.php");
include ("../include/locution.inc.php");
include ("../../../../configuration_w/constantesPHP.conf.php");
include ("../../../../configuration/label_".$_SESSION["sess_langue"].".conf");

writeHeadersNoCache();
$json = new Services_JSON();
$objRetour = array();
$objRetour["code_retour"] = 1;
$objRetour["msg_erreur"] = "";
$objRetour["tabfichiers"] = array();

//connexion à poseidon
$retour = connexion($jeton);
if ($retour)
{
    $tabLoc = array();
    $iCptLoc = 0;
    $numdoc = isset($_REQUEST["numdoc"]) ? $_REQUEST["numdoc"] : "";
    
    if ($numdoc != "") {
        
        /*$tabNumDoc = $json->decode(stripslashes($_REQUEST["numdoc"]));
        for($i=0;$i<count($tabNumDoc);$i++) {
            $retour = pos_getlisteinfopage($jeton, $inumdoc, 0, $tabStruListePage);
        }*/    
        $retour = pos_getlisteinfopage($jeton, $numdoc, 0, $tabStruListePage);
        if (!$retour){
        	$objRetour["code_retour"] = 0;
        	$objRetour["msg_erreur"] = get_erreur_poseidon($jeton);
        }
        else {
            $objRetour["tabfichiers"] = $tabStruListePage;
        }                                
    }
    else {
        $objRetour["code_retour"] = 0;
        $objRetour["msg_erreur"] = CST_JS_VALEUR_RECH_VIDE;
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