<?php

/*
 * DESCRIPTION : Affichage de l'ecran d'exportation de la liste des réponses 
 * 	au format excel
 * 
 * AUTEUR : Frédéric Tramarin
 * DATE de CREATION : 05/02/2003
 *
 * Donnees en entree : 
 * INUMQUEST -> numéro de la question
 * INUMDOS -> numéro du dossier 
 * LISTE_NUMDOC -> liste de numéro infos 
 *
 * MODIFICATIONS
 * 
 */
 
session_start();

include ("../include/connexion.inc.php");
include ("../include/locution.inc.php");
include ("../include/debug.inc.php");
include ("../include/template.inc.php");
include ("../include/profil.inc.php");
include ("../../../../configuration_w/constantesPHP.conf.php");
include ("../../../../configuration/label_".$_SESSION["sess_langue"].".conf");
include ("../../../../configuration/url.conf.php");

$retour = connexion($jeton);

if($retour) {

	$t = new template(REP_TEMPLATE_APPLICATIF."export");
	$t->set_file("export", "export.tpl");
	
	$t->set_var("PHPSESSID", session_id());
	
	$t->set_var("LIB_EXPORT_EXCEL", CST_EXPORT_EXCEL);
	$t->set_var("LIB_EXPORT_DOC", CST_EXPORT_DOC);
	$t->set_var("LIB_EXPORT_CARACT_SEP", CST_EXPORT_CARACT_SEP);
	$t->set_var("LIB_EXPORT_TAB", CST_EXPORT_TAB);
    $t->set_var("LIB_EXPORT_POINT_VIRGULE", CST_EXPORT_POINT_VIRGULE);
    $t->set_var("LIB_EXPORT_OTHER_VALUE", CST_EXPORT_OTHER_VALUE);
	$t->set_var("LIB_FORMAT_EXPORT_RUB", CST_FORMAT_EXPORT_RUB);
	$t->set_var("LIB_EXPORT_PROFIL", CST_EXPORT_PROFIL);
	$t->set_var("LIB_EXPORT_ALL_RUB", CST_EXPORT_ALL_RUB);
	$t->set_var("LIB_EXPORT_VALID", CST_LIBELLE_VALIDER);
	$t->set_var("LIB_EXPORT_CANCEL", CST_LIBELLE_ANNULER);
	$t->set_var("LIB_EXPORT_XML", CST_EXPORT_XML);
	
	$t->set_var("LIB_EXPORT_XML_RUB_TAG", CST_EXPORT_XML_RUB_TAG);
	$t->set_var("LIB_EXPORT_XML_RUB_ATTRIBUT", CST_EXPORT_XML_RUB_ATTRIBUT);
	$t->set_var("LIB_EXPORT_XML_LIE_OUI", CST_EXPORT_XML_LIE_OUI);
	$t->set_var("LIB_EXPORT_XML_LIE_NON", CST_EXPORT_XML_LIE_NON);

	$t->set_var("LIB_EXPORT_SELECTION_REPONSE", CST_EXPORT_SELECTION_REPONSE);
	$t->set_var("LIB_EXPORT_SELECTION_REPONSE_REP_SEL", CST_EXPORT_SELECTION_REPONSE_REP_SEL);
	$t->set_var("LIB_EXPORT_SELECTION_REPONSE_TOUTES", CST_EXPORT_SELECTION_REPONSE_TOUTES);
	
	$t->set_var("LIB_EXPORT_FICHIERS", CST_EXPORT_FICHIERS);
	$t->set_var("LIB_EXPORT_FICHIERS_AUCUN", CST_EXPORT_FICHIERS_AUCUN);
	$t->set_var("LIB_EXPORT_FICHIERS_FICHIER", CST_EXPORT_FICHIERS_FICHIER);
	$t->set_var("LIB_EXPORT_FICHIERS_FICHIER_SOUS_FICHIERS", CST_EXPORT_FICHIERS_FICHIER_SOUS_FICHIERS);
	$t->set_var("LIB_EXPORT_INFO_EXPORT_FICHIERS", CST_EXPORT_INFO_EXPORT_FICHIERS);
		
	$t->set_var("DISABLED_EXPORT_FICHIERS_AUCUN", (strlen($_REQUEST["LISTE_NUMDOC"]) == 0) ? "disabled" : "");
	$t->set_var("DISABLED_EXPORT_FICHIERS_FICHIERS", (strlen($_REQUEST["LISTE_NUMDOC"]) == 0) ? "disabled" : "");
	$t->set_var("DISABLED_EXPORT_FICHIERS_SOUS_FICHIERS", (strlen($_REQUEST["LISTE_NUMDOC"]) == 0) ? "disabled" : "");
    
    $t->set_var("LIB_EXPORT_INFO_EXPORT_FICHIERS", CST_EXPORT_INFO_EXPORT_FICHIERS);
    $t->set_var("LIB_EXPORT_INFO_EXPORT_XML", CST_EXPORT_INFO_EXPORT_XML);
    
	$t->set_var("INUMQUEST", $_REQUEST["INUMQUEST"]);
    $t->set_var("INUMDOS", $_REQUEST["POS_NUMDOS"]);
    $t->set_var("LISTE_NUMDOC", $_REQUEST["LISTE_NUMDOC"]);
            
	$t->set_var("URL_EXPORT", URL_EXPORTATION_EXCEL);	
	
	//On récupères les profils de listes résumés public et privés		
	$tabStruCodeLibAllLrd = getall_profils($jeton, 1);

	$t->set_block("export", "OPTIONS", "options");
	
	$szProfilLR = stripslashes($_REQUEST["PROFIL_LR"]);
	
	for($i=0;$i<count($tabStruCodeLibAllLrd);$i++) 
	{
		if(strcmp($tabStruCodeLibAllLrd[$i]->szLibelle,$szProfilLR) == 0) 
			$t->set_var("SELECTED","SELECTED");
		else 
			$t->set_var("SELECTED","");

		$t->set_var("VALUE_OPTION",$tabStruCodeLibAllLrd[$i]->szLibelle);
		$t->set_var("TITRE_OPTION",$tabStruCodeLibAllLrd[$i]->szLibelle);
		$t->parse("options", "OPTIONS", true);
	}  
	
	$t->parse("Output", "export");  
	$t->p("Output");             

	pos_disconnect($jeton);
}
else
{
	debug($jeton);
	echec_connexion();
}
?>