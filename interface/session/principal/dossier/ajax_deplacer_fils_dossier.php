<?php
/*-------------------------------------------------------------------
 * DESCRIPTION : Ajout dans un dossier
 * 
 * AUTEUR: GG
 * DATE DE CREATION: 27/11/2017
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

$retour = connexion($jeton);
if ($retour)
{
    if (isset($_REQUEST["POS_LISTE_NUM_DOC"]) && strlen(trim($_REQUEST["POS_LISTE_NUM_DOC"])) > 0)
    {
        $tabNumDoc = explode(";",trim($_REQUEST["POS_LISTE_NUM_DOC"]));
        $sAction = $_REQUEST["ACTION"];
        // insertion dans le dossier
    	for($i=0;$i<count($tabNumDoc);$i++)
    	{
            if (strlen($tabNumDoc[$i]) > 0 && $retour)
            {
                if ($sAction == "AJOUTER") 
                {
                    $retour = pos_dosajouterfilsdossier($jeton, $_REQUEST["POS_NUM_DOSSIER_PERE"], $tabNumDoc[$i],/*pref*/$objdos);
                } 
                else if ($sAction == "RETIRER")  
                {
                    $retour = pos_dosretirefils($jeton, $_REQUEST["POS_NUM_DOSSIER_PERE"], $tabNumDoc[$i],/*pref*/$objdos);
                    if ($retour) {
                        $objRetour["numdoc"] = $tabNumDoc[$i];
                        $objRetour["numdos"] = $_REQUEST["POS_NUM_DOSSIER_PERE"];
                    }
                }
            }
        }
        if (!$retour) 
        {
        	$objRetour["code_retour"] = 0;
        	$objRetour["msg_erreur"] = get_erreur_poseidon($jeton);
        }
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