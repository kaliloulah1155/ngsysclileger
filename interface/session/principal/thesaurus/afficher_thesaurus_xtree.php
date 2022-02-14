<?php
/*************************************************************************
* DESCRIPTION : Affichage du thésaurus et utilisation pour récupérer
* 				un vocabulaire thésaurus
* 				Version avec appel de template affichant un xTree
* 
* AUTEUR: Patrick Legaigneur
*
* DATE DE CREATION: 21/05/2008
*
*************************************************************************/ 
session_start();

include ("../include/connexion.inc.php");
include ("../include/debug.inc.php");
include ("../include/template.inc.php");
include ("../include/thesaurus.inc.php");
include ("../../../../configuration_w/constantesPHP.conf.php");
include ("../../../../configuration/label_".$_SESSION["sess_langue"].".conf");
include ("../../../../configuration/url.conf.php");

//connexion à poseidon
$retour = connexion($jeton);

$time_start = getmicrotime();
if ($retour)
{
	// Affichage
	$t = new Template(".");
	$t->set_File("arbo_thesaurus", REP_TEMPLATE_APPLICATIF."thesaurus/afficher_thesaurus_xtree.tpl");
	$t->set_var("TITRE_PAGE", CST_TITRE_PAGE_ARBO_LISTHIER);
	$szCodeTypeThe = stripslashes(urldecode($_REQUEST['POS_TYPETHE']));
    $t->set_var("POS_TYPETHE", $szCodeTypeThe);
	$t->set_var("POS_LIBELLETHE", $_SESSION["sess_tabLibTypeDoc"][$szCodeTypeThe]);
	
	$t->set_var("POS_ETAT", $_REQUEST['POS_ETAT']);
	$t->set_var("LIBELLE_AJOUTER", CST_LIBELLE_AJOUTER);
	$t->set_var("LIBELLE_CONSULTER", CST_LIBELLE_CONSULT);
	$t->set_var("LIBELLE_MODIFIER", CST_LIBELLE_MODIF);
	$t->set_var("LIBELLE_SUPPRIMER", CST_LIBELLE_SUPP);
	$t->set_var("LIBELLE_FERMER", CST_LIBELLE_FERMER);
	$t->set_var("URL_FERMER", URL_LIST_THESAURUS);
    $t->set_var("POS_CODERUB", isset($_REQUEST['POS_CODERUB']) ? $_REQUEST['POS_CODERUB'] : "");
    
    
	if (isset($_REQUEST["CHAMP"]) && strlen($_REQUEST["CHAMP"]) > 0)
        $t->set_var("OBJ_CHAMP", "parent.opener.".$_REQUEST["CHAMP"]);
    else
    {
        if (isset($_REQUEST['POS_CODERUB']))
            $t->set_var("OBJ_CHAMP", "parent.opener.document.principal.POS_VAL_RUB_".$_REQUEST['POS_CODERUB']);
    }
    
    $szSeparateur = " ";
    if (isset($_REQUEST['POS_CODERUB']))
    {
	    $retour = pos_getseparateurs($jeton, $_REQUEST['POS_CODERUB'], /*pref*/$objSeparateurs);
	    if($retour)
	    {
	    	if($objSeparateurs->bSepPropre)
	    		if(strcmp($objSeparateurs->szTabSeparateur{0},"\"")==0)
	    			$szSeparateur = " ";
	    		else
	    			$szSeparateur = $objSeparateurs->szTabSeparateur{0};
	    }
	    else
	    	debug($jeton);
    }
    $t->set_var("POS_SEPARATEUR", $szSeparateur);
	
	// on cherche le suffixe numérique terminant les code du thesaurus
	$retour=pos_getinforubintype($jeton, $szCodeTypeThe, "", 20, /*pref*/$tabRubInType);
	if ($retour) {
		for ($i=0;$i<count($tabRubInType);$i++)
		{
			if (strcmp($tabRubInType[$i]->libelle, "PERE") == 0)
			{
				$szCodePere = $tabRubInType[$i]->code;
				$suffixe_num = substr($szCodePere,1);
				break;
			}
		}
	}
	else 
		debug ($jeton);
	
	$t->set_var("POS_SUFFIXE_RUB_NUM", $suffixe_num);		
	$t->pparse("MyOutput", "arbo_thesaurus");
}
else 
{
	debug ($jeton);
	pos_disconnect($jeton);	
}
?>