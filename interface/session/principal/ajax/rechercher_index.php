<?php
/*************************************************************************
* DESCRIPTION : Recherche fiches d'index
* 
* AUTEUR: GG
* DATE DE CREATION: 23/11/2011
* Données en entrées 
*  $_REQUEST["locutions"] : les locutions
*  ou locution simplifiée 
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
include ("../include/liste_resumee.inc.php");

writeHeadersNoCache();
$json = new Services_JSON();
$objRetour = array();
$objRetour["code_retour"] = 1;
$objRetour["msg_erreur"] = "";
$objRetour["tabindex"] = array();
$objRetour["tablr"] = array();
$objRetour["obj_profil_lr"] = array();
//connexion à poseidon
$retour = connexion($jeton);
if ($retour)
{
    $tabLoc = array();
    $iCptLoc = 0;
    if (isset($_REQUEST["locutions"])) 
    {
        $tabLocTmp = $json->decode(stripslashes($_REQUEST["locutions"]));
        //error_log(print_r($tabLocTmp, TRUE));
        for($i=0;$i<count($tabLocTmp);$i++) 
        {
            $tabLoc[$iCptLoc] = new Locution($tabLocTmp[$i]->lien, $tabLocTmp[$i]->typedoc,
                          $tabLocTmp[$i]->coderub, $tabLocTmp[$i]->operateur, trim(utf8_decode($tabLocTmp[$i]->valeur1)), 
                          $tabLocTmp[$i]->par_ouv, $tabLocTmp[$i]->par_fer);
            $tabLoc[$iCptLoc]->valeur2 = trim($tabLocTmp[$i]->valeur2);
            $tabLoc[$iCptLoc]->szCodeTypeLie = $tabLocTmp[$i]->typeLie;
            $tabLoc[$iCptLoc]->szCodeRubLie = $tabLocTmp[$i]->rubLiee;
            $iCptLoc++;
        }
    }
    // recherche simple
    else 
    {
        $szCodeTypeDoc = $_REQUEST["typedoc"];
        $szCodeRub = $_REQUEST["coderub"];
        $szValeur = $_REQUEST["valeur"];
        $szValeur = stripslashes($szValeur);
    
        if (strlen($szValeur) > 0)
        {
            $tabLoc[$iCptLoc] = new Locution (1, $szCodeTypeDoc, $szCodeRub, "=", $szValeur, 0, 0);
        }
    }

    if (count($tabLoc) == 0) 
    {
        $objRetour["code_retour"] = 0;
        $objRetour["msg_erreur"] = "Informations insuffisantes pour effectuer la recherche.";
    }
    else
    {
        $retour = pos_searchdoc($jeton, count($tabLoc), $tabLoc, /*pref*/$iNbReponses, /*pref*/$iAdrPremiereReponse);
        if ($retour)
        {
            if ($iNbReponses > 0) {
            
                if (isset($_REQUEST["lr"])&& $_REQUEST["lr"] == "1") {
                    $iTypeTri = isset($_REQUEST["typetri"]) ? $_REQUEST["typetri"] : "1";
                    $iColTri = isset($_REQUEST["coltri"]) ? $_REQUEST["coltri"] : "1";
                    $sProfilLr = isset($_REQUEST["pos_profil_lr"]) ? stripslashes($_REQUEST["pos_profil_lr"]) : "";
                    $retour = pos_getreponseslrd($jeton, $iAdrPremiereReponse, $iNbReponses, $iNbReponses, 
    					           $iColTri, $iTypeTri, /*pref*/$sProfilLr, /*pref*/$tabRepLR);
                    if ($retour)
                    {
                        $retour = pos_gestplr($jeton, $sProfilLr, /*pref*/$objLR, /*pref*/$tabZoneLR);
                        $objRetour["obj_profil_lr"]["objLR"] = $objLR;
                        $objRetour["obj_profil_lr"]["tabZoneLR"] = $tabZoneLR;
                        for($i=0;$i<count($tabRepLR);$i++) 
                        {
                            $tabChamps = extraireChampsLR($tabRepLR[$i]->lr, "\x02");
                            $objRetour["tablr"][$i]["numdoc"] = $tabRepLR[$i]->numdoc;
                            $objRetour["tablr"][$i]["champs"] = $tabChamps;
                        }
                    }
    
                }
                else {
                    $tabNumDoc = array();
                    if ($iNbReponses != 0)
                        $retour = pos_getreponsestabnumdoc($jeton, $iAdrPremiereReponse, $iNbReponses, /*pref*/$tabNumDoc);
                    
                    if ($retour)
                    {
                        for($i=0;$i<count($tabNumDoc);$i++) 
                        {
                            $retour = pos_getallindexdoc($jeton, $tabNumDoc[$i], /*pref*/$codevalrub);
                            $codevalrub["N D"] = $tabNumDoc[$i];
                            $objRetour["tabindex"][$i] = $codevalrub;
                        }
                    }
                }
            }
        }
        if (!$retour) {
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