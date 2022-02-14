<?php
/*************************************************************************
* DESCRIPTION : Association automatique dans le cas ou il n'y a qu'un index lie
* 
* AUTEUR: GG
* DATE DE CREATION: 08/12/2016
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
$objRetour["nbrep"] = 0;
$objRetour["tabindex"] = array();

//connexion à poseidon
$retour = connexion($jeton);
if ($retour)
{
    $tabLoc = array();
    $iCptLoc = 0;
    $szCodeTypeDoc = $_REQUEST["typedoc"];
    $szCodeRub = $_REQUEST["coderub"];
    $szValeur = isset($_REQUEST["valeur"]) ? stripslashes($_REQUEST["valeur"]) : "";
    $inumdoc = isset($_REQUEST["inumdoc"]) ? $_REQUEST["inumdoc"] : 0;
    
    if (strlen($szValeur) > 0 || $inumdoc != 0) {
        
        $iNbReponses = 0;
        if (strlen($szValeur) > 0)
            $retour = pos_getfichesliees($jeton, $szCodeTypeDoc, $szCodeRub, stripslashes($szValeur), 
                                /*pref*/$iAdrPremiereReponse, /*pref*/$iNbReponses);
        
        if ($retour) {

        	$objRetour["nbrep"] = $iNbReponses;
            if ($iNbReponses >= 1 || $inumdoc != 0) {
            
                if ($inumdoc == 0) {

                    $tabNumDoc = array();
                    $retour = pos_getreponsestabnumdoc($jeton, $iAdrPremiereReponse, $iNbReponses, /*pref*/$tabNumDoc);
                    if (count($tabNumDoc) > 0) {
                        $inumdoc = $tabNumDoc[0];
                    }
                }
                
                if ($retour) {
                
                    if ($inumdoc != 0) {
                        $retour = pos_getassociationspardoc($jeton, $szCodeTypeDoc, $szCodeRub, $inumdoc, /*pref*/$tabCodeValeurAssociee);
                        while (list($key, $val) = each($tabCodeValeurAssociee))
            			     $objRetour["tabindex"][$key] = $val;
                    }
                }
            }
            else {
                $retour = pos_getassociation($jeton, $szCodeTypeDoc, $szCodeRub, /*pref*/$tabStruAsso);
                for ($i=0;$i<count($tabStruAsso);$i++) 
                    $objRetour["tabindex"][$tabStruAsso[$i]->szRubInit] = ""; 
            }    
        }
        
        if (!$retour){
        	$objRetour["code_retour"] = 0;
        	$objRetour["msg_erreur"] = get_erreur_poseidon($jeton);
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
