<?php
/*
 * DESCRIPTION : Module de d'affichage des types de document de l'application
 * DATE de CREATION : 02/07/2001
 * 
 * $_REQUEST['ACTION'] : type d'action RECHERCHE_CLE ou CREATION
 * 
 * 27.11.2002 : GG : prise en compte des documents indexables
 * 01.04.2003 : GG : ajout constantes
 */
if (!isset($_SESSION))
    session_start();
include ("../include/connexion.inc.php");
include ("../include/debug.inc.php");
include ("../include/template.inc.php");
include ("../include/get_template.inc.php");
include ("../../../../configuration_w/constantesPHP.conf.php");
include ("../../../../configuration/label_".$_SESSION["sess_langue"].".conf");
include ("../../../../configuration/url.conf.php");


$retour = true;
// DEBUT liste des types de documents
if (!isset($_SESSION["tabTypeDoc"]) && $_REQUEST['ACTION'] != "RECHERCHE_CLE")
{
	// connexion a poseidon
	$retour = connexion($jeton);

	if ($retour)
	{
	// Récupération de la liste des types de document
        $tabTypeDoc = array();
		$retour=pos_getlistalltypesrmc($jeton, /*pref*/$tabTypeDoc);
        $_SESSION["tabTypeDoc"] = $tabTypeDoc;
	
		if (!$retour)
		{
			debug($jeton);
		}
		pos_disconnect($jeton);
	}
	else
	{
		debug($jeton);
		echec_connexion();
	}
}
elseif(!isset($tabInfoType) && $_REQUEST['ACTION'] == "RECHERCHE_CLE")
{
	// connexion a poseidon
	$retour = connexion($jeton);
	
	if ($retour)
	{
		// Consultation des informations relatives aux types de document	
		// pour tester gestion_kh > 0 
		$retour=pos_getinfoalltypes($jeton, "999", /*pref*/$tabInfoType, /*pref*/$tabInfoZonesKeys);
			
		if (!$retour)
		{
			debug($jeton);
		}
		pos_disconnect($jeton);
	}
	else
	{
		debug($jeton);
		echec_connexion();
	}
}

// affichage par le template correspondant 

if ($retour)
{
	$t = new template(REP_TEMPLATE_APPLICATIF."type");
	$t->set_file("choix_type", "choix_type_recherche.tpl");
	$t->set_block("choix_type", "LISTE_TYPES", "liste_types");
	$t->set_block("choix_type", "TOUS_TYPES", "tous_types");
	if($_REQUEST['ACTION'] != "RECHERCHE_CLE")
	{
		if($_REQUEST['ACTION'] == "RECHERCHE")
		{
			$t->set_var("ACTION", URL_RECHERCHE_SIMPLE);
			$t->set_var("TITRE_RECHERCHE", CST_LIBELLE_TOOLBAR_RECH_SIM);
			$t->set_var("ICONE_TYPE", "recher.gif");
			$t->set_var("tous_types", "");
			
			// trie le tableau; conservation des associations codes/libelles 
    		asort($_SESSION["tabTypeDoc"]);
    		foreach($_SESSION["tabTypeDoc"] as $key => $val)
    		{
    			if (strpos($_SESSION["sess_liste_doc_recherchables"], ";".$key.";") !== false ||
                    strpos($_SESSION["sess_liste_doc_recherchables"], $key.";") === 0 || 
                    strlen($_SESSION["sess_liste_doc_recherchables"]) == 0)
    			{
    				if (isset($_REQUEST['POS_TYPEDOC']) && $_REQUEST['POS_TYPEDOC'] == $key)
    					$t->set_var("POS_CODE_TYPE", $key." selected");
    				else
    					$t->set_var("POS_CODE_TYPE", $key);
    				$t->set_var("POS_LIBELLE_TYPE", $val);
    			
                    $szFileTpl = "";
                    if (get_file_tpl("recherche", $key, 0, /*pref*/$szFileTpl))
    					$t->parse("liste_types", "LISTE_TYPES", true);
    			}
    		}
		}
		else if($_REQUEST['ACTION'] == "RECHERCHE_ELA")
		{
			$t->set_var("ACTION", URL_RECHERCHE_ELABOREE);
			$t->set_var("TITRE_RECHERCHE", CST_LIBELLE_TOOLBAR_RECH_ELA);
			$t->set_var("ICONE_TYPE", "multi.gif");
			$t->parse("tous_types", "TOUS_TYPES", false);
			
			// trie le tableau; conservation des associations codes/libelles 
    		asort($_SESSION["tabTypeDoc"]);
    		foreach($_SESSION["tabTypeDoc"] as $key => $val)
    		{
    			if (strpos($_SESSION["sess_liste_doc_recherchables"], ";".$key.";") !== false ||
                    strpos($_SESSION["sess_liste_doc_recherchables"], $key.";") === 0 || 
                    strlen($_SESSION["sess_liste_doc_recherchables"]) == 0)
    			{
    				if (isset($_REQUEST['POS_TYPEDOC']) && $_REQUEST['POS_TYPEDOC'] == $key)
    					$t->set_var("POS_CODE_TYPE", $key." selected");
    				else
    					$t->set_var("POS_CODE_TYPE", $key);
    				$t->set_var("POS_LIBELLE_TYPE", $val);
    			
    				$t->parse("liste_types", "LISTE_TYPES", true);
    			}
    		}
		}
		else if($_REQUEST['ACTION'] == "CREATION")
		{
			$t->set_var("ACTION", URL_CREATION);	
            $t->set_var("TITRE_RECHERCHE", CST_LIBELLE_TOOLBAR_CREATION);	
			$t->set_var("ICONE_TYPE", "fiche.gif");
			$t->set_var("tous_types", "");
			
    		// trie le tableau; conservation des associations codes/libelles 
    		asort($_SESSION["tabTypeDoc"]);
    		foreach($_SESSION["tabTypeDoc"] as $key => $val)
    		{
    			if (strpos($_SESSION["sess_liste_doc_indexables"], ";".$key.";") !== false ||
                    strpos($_SESSION["sess_liste_doc_indexables"], $key.";") === 0 || 
                    strlen($_SESSION["sess_liste_doc_indexables"]) == 0)
    			{
    				if (isset($_REQUEST['POS_TYPEDOC']) && $_REQUEST['POS_TYPEDOC'] == $key)
    					$t->set_var("POS_CODE_TYPE", $key." selected");
    				else
    					$t->set_var("POS_CODE_TYPE", $key);
    				$t->set_var("POS_LIBELLE_TYPE", $val);
                    
                    $szFileTpl = "";
                    if (get_file_tpl("creation", $key, 0, /*pref*/$szFileTpl))
                        $t->parse("liste_types", "LISTE_TYPES", true);
    			}
    		}
		}
	}
	else
	{
		$t->set_var("ACTION", URL_AFF_RECH_CLE_HIER_FRM1);
		$t->set_var("TITRE_RECHERCHE", CST_LIBELLE_TOOLBAR_RECH_CLE);
		$t->set_var("ICONE_TYPE", "cle.gif");
		$t->set_var("tous_types", "");

		$tabTmp = array();
				
		for($i=0; $i<count($tabInfoType); $i++)
		{
			if($tabInfoType[$i]->gestion_kh > 0
                && $tabInfoType[$i]->b_invisible != 1 
                && (stristr($_SESSION["sess_liste_doc_recherchables"], $tabInfoType[$i]->code) || strlen($_SESSION["sess_liste_doc_recherchables"]) == 0))
			{
				$tabTmp[$tabInfoType[$i]->code]=$tabInfoType[$i]->libelle;
			}
		}

		asort($tabTmp);
		foreach($tabTmp as $key => $val)
		{
			if (isset($_REQUEST['POS_TYPEDOC']) && $_REQUEST['POS_TYPEDOC'] == $key)
				$t->set_var("POS_CODE_TYPE", $key." selected");
			else
				$t->set_var("POS_CODE_TYPE", $key);
			
			$t->set_var("POS_LIBELLE_TYPE", $val);
			$t->parse("liste_types", "LISTE_TYPES", true);
		}
	}
	$t->set_var("LIBELLE_ENT_TYPE_DOC", CST_LIBELLE_ENT_TYPE_DOC);
	$t->set_var("LIBELLE_RECH_000", CST_LIBELLE_RECH_000);
	$t->set_var("LANGUE", $_SESSION["sess_langue"]);
	
	$t->parse("Output", "choix_type");
	$t->p("Output");
}
?>
