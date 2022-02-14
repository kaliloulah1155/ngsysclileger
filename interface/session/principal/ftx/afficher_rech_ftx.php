<?php
/***********************************
 * Affichage recherche FullText
 *
 * AUTEUR : Sébastien COSTANZO
 *
 * DATE DE CREATION: 09/05/2006
 * 
 */ 
if (!isset($_SESSION))
session_start();
include ("../include/connexion.inc.php");
include ("../include/template.inc.php");
include ("../include/debug.inc.php");
include ("../include/form_values.inc.php");
include ("../../../../configuration_w/constantesPHP.conf.php");
include ("../../../../configuration/label_".$_SESSION["sess_langue"].".conf");
include ("../../../../configuration/url.conf.php");

if (!defined("FTX_TRI_DISTANCE"))
{
    define("FTX_TRI_DISTANCE", 0);
    define("FTX_TRI_OCCURRENCE", 1);
}

//connexion à poseidon
$retour = connexion($jeton);
if ($retour)
{
    // on definit le template utilisé  
    $t = new template(REP_TEMPLATE_APPLICATIF."ftx");
    $t->set_file("ftx", "recherche_ftx.tpl");
    $t->set_block("ftx","BLOC_TYPE_DOC","bloc_type_doc");
    
    $t->set_var("TITRE_PAGE", CST_TITRE_PAGE_RECH_FTX);
    
    $t->set_var("URL_RECHERCHE", URL_RECHERCHE_FTX);
    $t->set_var("URL_ATTENTE", URL_ATTENTE);
	
    $t->set_var("LIBELLE_FERMER", CST_LIBELLE_FERMER);
	$t->set_var("LIBELLE_RECHERCHER", CST_LIBELLE_RECHERCHER);
    $t->set_var("LIBELLE_EFFACER", CST_LIBELLE_EFFA);
	
	$t->set_var("LIB_MOT_A_RECHERCHER", CST_LIB_MOT_A_RECHERCHER_FTX);
	$t->set_var("LIB_LIBRAIRIE", CST_LIB_LIBRAIRIE_FTX);
	$t->set_var("LIB_AFFICHAGE_REPONSES", CST_LIB_AFFICHAGE_REPONSES_FTX);
    $t->set_var("LIB_CRITERES_RECH_FTX", CST_LIB_CRITERES_RECH_FTX);
	$t->set_var("LIB_TRI_PERTINENCE", CST_LIB_TRI_PERTINENCE_FTX);
	$t->set_var("LIB_TRI_OCCURRENCE", CST_LIB_TRI_OCCURRENCE_FTX);
	$t->set_var("LIB_TRI", CST_LIB_TRI_FTX);
	$t->set_var("LIB_NB_REP", CST_LIB_NB_REP_FTX);

	$t->set_var("LIB_TITRE_CHOIX_INDEX_FICHIER", CST_LIB_TITRE_CHOIX_INDEX_FICHIER);
	$t->set_var("LIB_CHOIX_FICHIER", CST_LIB_CHOIX_FICHIER);
	$t->set_var("LIB_CHOIX_INDEX_FICHIER", CST_LIB_CHOIX_INDEX_FICHIER);
	$t->set_var("LIB_TOUS_TYPES", CST_LIB_TOUS_TYPES);
	$t->set_var("LANGUE", $_SESSION["sess_langue"]);
	$t->set_var("POS_NB_REP", isset($_REQUEST["POS_NB_REP"]) ? $_REQUEST["POS_NB_REP"] : "20");

    $retour=pos_getinfoalltypes($jeton, "999", /*pref*/$tabInfoType, /*pref*/$tabInfoZonesKeys);

    if(!$retour)
        debug($jeton);
    
    $tabTypeDocFtx = array();    
    for($i=0; $i<count($tabInfoType); $i++)
    {
        if($tabInfoType[$i]->wFullTexte)
            $tabTypeDocFtx[$tabInfoType[$i]->code]=$tabInfoType[$i]->libelle;
    }
    
    // rappel des critères de recherche
    if(isset($_REQUEST["POS_QUESTION_NEW"]))
        $szQuestion = $_REQUEST["POS_QUESTION_NEW"];
    else
        $szQuestion = isset($_REQUEST["POS_QUESTION"]) ? $_REQUEST["POS_QUESTION"] : "";
    $szQuestion = preg_replace('/%u[[:alnum:]]{4}/', " ", stripslashes(urldecode($szQuestion)));
    
    $tabLib = array();
    if (isset($_REQUEST["POS_CHOIX_LIB"]) && is_string($_REQUEST["POS_CHOIX_LIB"]) == true)
        $tabLib = explode(";", $_REQUEST["POS_CHOIX_LIB"]);
	else
	    if (isset($_REQUEST["POS_CHOIX_LIB"]))
            $tabLib = $_REQUEST["POS_CHOIX_LIB"];
    
    $t->set_var("POS_QUESTION", htmlspecialchars_currentcharset($szQuestion));        
    $t->set_var("LIB_TOUS_TYPES_CHECKED", (count($tabLib) == 0) ? "checked" : "");

    foreach($tabTypeDocFtx as $code => $libelle)
    {
        $t->set_var("CODE_TYPE_DOC", $code);
        $t->set_var("LIB_TYPE_DOC", $libelle);

		// pour cocher au moins un type
		if (count($tabLib) == 0)
            $t->set_var("LIB_CHECKED", "checked");
        else
            $t->set_var("LIB_CHECKED", in_array($code, $tabLib) ? "checked" : "");
        $t->parse("bloc_type_doc","BLOC_TYPE_DOC",true);
    }
	
    if (isset($_REQUEST["TYPE_CHOIX_RUB"]) && strcmp($_REQUEST["TYPE_CHOIX_RUB"], "0") == 0)
	{
	   $t->set_var("CHECKED_CHOIX_RUB_FIC", "checked");
	   $t->set_var("CHECKED_CHOIX_RUB_FIC_RUB", "");
    }
    else
	{
	   $t->set_var("CHECKED_CHOIX_RUB_FIC", "");
	   $t->set_var("CHECKED_CHOIX_RUB_FIC_RUB", "checked");
    }
    
    if(isset($_REQUEST["POS_TRI"]) && $_REQUEST["POS_TRI"] == FTX_TRI_OCCURRENCE)
    {
        $t->set_var("CHECKED_TRI_PERTINENCE", "");
        $t->set_var("CHECKED_TRI_OCCURRENCE", "checked");
    }
    else
    {
        $t->set_var("CHECKED_TRI_PERTINENCE", "checked");
        $t->set_var("CHECKED_TRI_OCCURRENCE", "");
    }
    
    // affichage du template
    $t->parse("Output", "ftx");
    $t->p("Output");
    
    // deconnexion
    pos_disconnect($jeton);
}
else
{
	debug($jeton);
	echec_connexion();
}
?>