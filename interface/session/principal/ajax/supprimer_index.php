<?php
/*************************************************************************
* DESCRIPTION : Suppression fiches d'index
* AUTEUR: GG
* DATE DE CREATION: 18/03/2013
* Données en entrées 
*  $_REQUEST["numdoc"] : le numéro de document à supprimer
* ----------------------------------------------------------------------------
*************************************************************************/
session_start();
include ("../include/json/JSON.php");
include ("../include/util_headers.php");
include ("../include/connexion.inc.php");

writeHeadersNoCache();
$json = new Services_JSON();
$objRetour = array();
$objRetour["code_retour"] = 1;
$objRetour["msg_erreur"] = "";

$retour = connexion($jeton);
if ($retour)
{
    if ((isset($_REQUEST["numdoc"]) && strlen($_REQUEST["numdoc"]) != 0) ||
        (isset($_REQUEST["POS_NUM_DOC"]) && strlen($_REQUEST["POS_NUM_DOC"]) != 0)) 
    {
        $numDoc = (isset($_REQUEST["numdoc"]) && strlen($_REQUEST["numdoc"]) != 0) ? $_REQUEST["numdoc"] : $_REQUEST["POS_NUM_DOC"];   
        $retour = pos_deldoc($jeton, $numDoc);
	    if (!$retour)
	    {
	        pos_geterreur($jeton, /*pref*/$tabErreur);
            $objRetour["code_retour"] = 0;
	        $objRetour["msg_erreur"] = $tabErreur["msg2"];
        }
        else {
            $objRetour["numdoc"] = $numDoc;
        }
    }
    else if (isset($_REQUEST["POS_LISTE_NUM_DOC"]) && strlen(trim($_REQUEST["POS_LISTE_NUM_DOC"])) > 0)
    {
        $tabNumDoc = explode(";",trim($_REQUEST["POS_LISTE_NUM_DOC"]));
        $objRetour["tabnumdoc"] = array();
        for($i=0;$i<count($tabNumDoc);$i++)
    	{
    	   if (strlen($tabNumDoc[$i]) > 0 && $retour)
    	   {
                $retour = pos_deldoc($jeton, $tabNumDoc[$i]);
                if ($retour)
                    $objRetour["tabnumdoc"][] = $tabNumDoc[$i];
            }
        }
        if (!$retour) {
        	$objRetour["code_retour"] = 0;
        	$objRetour["msg_erreur"] = get_erreur_poseidon($jeton);
        }
    }
    else 
    {
        $objRetour["code_retour"] = 0;
        $objRetour["msg_erreur"] = "Numéro de document non spécifié.";
    }
    pos_disconnect($jeton);
}
else
{
	pos_geterreur($jeton, /*pref*/$tabErreur);
	$objRetour["code_retour"] = 0;
	$objRetour["msg_erreur"] = $tabErreur["msg2"];
}
$output = $json->encode($objRetour);
print($output);
?>
