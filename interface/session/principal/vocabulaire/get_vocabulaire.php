<?php
/*************************************************************************
* DESCRIPTION : récuperer le vocabulaire suivant
* 
* AUTEUR: Gabrielle Guy 
*
* DATE DE CREATION: 05/02/2008
* ----------------------------------------------------------------------------
* MODIFICATIONS :
*************************************************************************/
session_start();
include ("../include/json/JSON.php");
include ("../include/util_headers.php");
include ("../include/connexion.inc.php");
include ("../include/liste_vocab.inc.php");
include ("../include/debug.inc.php");
include ("../include/template.inc.php");
include ("../../../../configuration_w/constantesPHP.conf.php");
include ("../../../../configuration/label_".$_SESSION["sess_langue"].".conf");
include ("../../../../configuration/url.conf.php");

define("CODE_TOUS_TYPES", "000");

writeHeadersNoCache();

$json = new Services_JSON();
$objRetour = array();
$objRetour["code_retour"] = 1;
$objRetour["msg_erreur"] = "";
$objRetour["is_code_valeur"] = 0;
$objRetour["is_affiche_valeur"] = 0;
$objRetour["tabmots"] = array();

$szDebutMot = (isset($_REQUEST["POS_DEBUTMOT"])) ? stripslashes($_REQUEST["POS_DEBUTMOT"]) : "";
if (!isset($_REQUEST["POS_TYPEDF"]) || $_REQUEST["POS_TYPEDF"]  <= 1)
    $szDebutMot = strtoupper($szDebutMot);

$szTypeDoc = $_REQUEST["POS_TYPEDOC"];
$szCodeRub = $_REQUEST["POS_CODERUB"];
$iTypeVocab = $_REQUEST["POS_TYPE_VOCAB"];
$wTypeRub = $_REQUEST["POS_TYPERUB"];
// POS_NEXT_VAL : 0 current val, 1 next val, 2 vocabulaire inverse
$bNextVal = (isset($_REQUEST["POS_NEXT_VAL"])) ? $_REQUEST["POS_NEXT_VAL"] : 0;
$wNbVoulu = (isset($_REQUEST["POS_NBVOULU"])) ? $_REQUEST["POS_NBVOULU"] : CST_MAX_VOCAB_RECUP;

//connexion à poseidon
$retour = connexion($jeton);

if ($retour)
{
	$retour = pos_listevocab($jeton, $szTypeDoc, $szCodeRub, $iTypeVocab, 
			$szDebutMot, $bNextVal, $wNbVoulu, /*pref*/$iNbLu, /*pref*/$szVocab);
}
else
{
	$objRetour["code_retour"] = 0;
	$objRetour["msg_erreur"] = get_erreur_poseidon($jeton);
}
if ($retour)
{
	$liste_mots = extraireVocab($szVocab, $iTypeVocab, $wTypeRub);
}
else
{
	$objRetour["code_retour"] = 0;
	$objRetour["msg_erreur"] = get_erreur_poseidon($jeton);
}

pos_disconnect($jeton);

if ($retour)
{
	$tabMots = array();
	if (($iTypeVocab == POS_LIBELLE_DF || $iTypeVocab == POS_CODE_DF || $iTypeVocab == POS_VOCAB_HIE_CODE || $iTypeVocab == POS_VOCAB_HIE_LIBELLE) 
            && $wTypeRub == POS_RUB_ALPHA) 
	{
		$objRetour["is_code_valeur"] = 1;
        if($iTypeVocab == POS_LIBELLE_DF || $iTypeVocab == POS_VOCAB_HIE_LIBELLE)
            $objRetour["is_affiche_valeur"] = 1;

        $i = 0;
		while (list($cle, $valeur) = each($liste_mots))
		{
		    $tabMots[$i]['code'] = $cle;
			$tabMots[$i]['valeur'] = $valeur;
			$i++;
		}
	}
	else
	{
		for ($i=0; $i<count($liste_mots); $i++)
		{
			$tabMots[$i]['code'] = $liste_mots[$i];
			$tabMots[$i]['valeur'] = $liste_mots[$i];
		}
	}
	$objRetour["tabmots"] = $tabMots;
}
$output = $json->encode($objRetour);
print($output);
?>
