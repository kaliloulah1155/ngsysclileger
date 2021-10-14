<?php
/*************************************************************************
* DESCRIPTION : liste le vocabulaire de la rubrique selectionnée dans la question
* 
* AUTEUR: Gabrielle Guy 
*
* DATE DE CREATION: 03/08/2001
* ----------------------------------------------------------------------------
* MODIFIATIONS :
* Gaby 03/08/2001 utilisation de liste_vocab.inc
* Sebastien 10/10/2001 ajout du choix du vocabulaire
* Gaby 05/12/2001 gestion du vocabulaire tous types
* Marc 12/02/2002 gestion du vocabulaire thesaurus
* Gaby 29/05/2002 correction problème si premier mot = 0
* Gaby 10/04/2003 utilisation de constantes
*************************************************************************/ 
session_start();

include ("../include/connexion.inc.php");
include ("../include/liste_vocab.inc.php");
include ("../include/debug.inc.php");
include ("../include/template.inc.php");
include ("../../../../configuration_w/constantesPHP.conf.php");
include ("../../../../configuration/label_".$_SESSION["sess_langue"].".conf");
include ("../../../../configuration/url.conf.php");

define("CODE_TOUS_TYPES", "000");

//connexion à poseidon
$retour = connexion($jeton);

if ($retour)
{
	$szSeparateur = " ";
	// a priori inutile, juste pour laisser la possibilité derevenir à l'ancienne méthode 
    // où la fenêtre complète est rechargée lors d'un chargement de vocabulaire
	if (isset($_REQUEST["POS_TYPERUB"]) && strlen($_REQUEST["POS_TYPERUB"]) > 0)
	{
		$wTypeRub = $_REQUEST['POS_TYPERUB'];
		$szSeparateur = $_REQUEST['POS_SEPARATEUR'];
		$iTypeVocab = $_REQUEST['POS_TYPE_VOCAB'];
		$wTypeDf = $_REQUEST['POS_TYPEDF'];
	}
	else
	{
	    // on recupere les info sur la rubrique passee...
		$retour = pos_getinforub($jeton, $_REQUEST['POS_CODERUB'], /*pref*/$stInfoRub);
		$wTypeRub = $stInfoRub->typerub;
		$wTypeDf = $stInfoRub->domferme;
	
	    // choix du type de vocabulaire
    	// si le type est passée en parametre -> ce type est appliqué
    	// sinon
    	// si vocabulaire lié -> vocabulaire lié
    	// si vocabulaire à domaine fermé -> domaine fermé par libellé
    	// sinon vocabulaire utilisé
    	if (!isset($_REQUEST['POS_TYPE_VOCAB']) || ($_REQUEST['POS_TYPE_VOCAB'] <= 0) )
    	{
            if (strcmp($_REQUEST['POS_TYPEDOC'], CODE_TOUS_TYPES) != 0 && $_REQUEST['POS_VOC_LIE'])
    		{
                $retour = pos_getinforubintype($jeton, $_REQUEST['POS_TYPEDOC'], "", 50, /*pref*/$stInfoRubInType);
    			if ($retour)
    			{
                    // on cherche la rubrique
    				for ($ii = 0; $ii < count($stInfoRubInType); $ii++)
    				    if ($stInfoRubInType[$ii]->code == $_REQUEST['POS_CODERUB']) 
                            break;
    			}
    		}
    			
            if ( $_REQUEST['POS_TYPEDOC'] != CODE_TOUS_TYPES && $_REQUEST['POS_VOC_LIE'] && $stInfoRubInType[$ii]->b_lierdep)
                $iTypeVocab = POS_VOCAB_RUB_LIEE;
            else
    		{
    			if ($stInfoRub->b_thesaurus)
    			    $iTypeVocab = POS_VOCAB_THE;
    			elseif ($stInfoRub->domferme > 0)
			         // si la rubrique est alpha (pas de libellé DF sur les dates ou les numériques).
			        $iTypeVocab = ($wTypeRub == POS_RUB_ALPHA) ? POS_LIBELLE_DF : POS_CODE_DF;
        	    else
        			$iTypeVocab = POS_VOCAB_USED;
    		}
    	}
    	else
    	   $iTypeVocab = $_REQUEST['POS_TYPE_VOCAB'];
	
    	// Recherche du separateur sur la rubrique.
		$szSeparateur = " ";
		if(!$stInfoRub->b_monocritere) 
    	{
    	    if( $stInfoRub->domferme > 0  || strcmp($iTypeVocab, POS_VOCAB_RUB_LIEE) == 0)
    	       $szSeparateur = "\\n";
            else
            {
        		$retour = pos_getseparateurs($jeton, $_REQUEST['POS_CODERUB'], /*pref*/$objSeparateurs);
        		if($retour)
        		{
    				if($objSeparateurs->bSepPropre && strcmp($objSeparateurs->szTabSeparateur{0}, "\"") != 0)
    				    $szSeparateur = $objSeparateurs->szTabSeparateur{0};
        		}
        		else
        		  debug($jeton);
            }
    	}   
    }
	pos_disconnect($jeton);
}
else
{
	debug($jeton);
	echec_connexion();
}

if ($retour)
{
   //---------------
   //   AFFICHAGE
   //---------------
   $sFileTpl = (defined('VOC_DF_CODE_LIBELLE') && strcmp(VOC_DF_CODE_LIBELLE, "1") == 0) ? "vocabulaire_code_lib.tpl" : "vocabulaire.tpl";
	$t = new template(REP_TEMPLATE_APPLICATIF."vocabulaire");
	$t->set_file("vocabulaire", $sFileTpl);
	$t->set_var("POS_TYPEDOC", $_REQUEST['POS_TYPEDOC']);
	$t->set_var("POS_CODERUB", $_REQUEST['POS_CODERUB']);
	$t->set_var("POS_DEBUTMOT", (isset($_REQUEST['POS_DEBUTMOT'])) ? strtoupper($_REQUEST['POS_DEBUTMOT']) : "");
	$t->set_var("POS_LIBELLERUB", $stInfoRub->libelle);
	$t->set_var("POS_TYPEDF", $wTypeDf);
	$t->set_var("POS_TYPERUB", $wTypeRub);
	$t->set_var("ACTION_AFFICHER_VOCAB", URL_AFFICHER_VOCAB);
	$t->set_var("URL_VOCAB_AJAX", URL_VOCAB_AJAX);
	$t->set_var("LIBELLE_VOCABULAIRE", CST_LIBELLE_VOCABULAIRE);
	$t->set_var("LIBELLE_CHAMP", CST_LIBELLE_VOCAB_DU_CHAMP);
	$t->set_var("LIBELLE_VISUALISATION_VOC", CST_LIBELLE_VISUALISATION_VOC);
	$t->set_var("LIBELLE_DEBUT_MOT_VOC", CST_LIBELLE_DEBUT_MOT_VOC);
	$t->set_var("LIBELLE_FERMER", CST_LIBELLE_FERMER);
	$t->set_var("LIBELLE_AJOUTER", CST_LIBELLE_AJOUTER);
	$t->set_var("NB_MAX_MOTS", CST_MAX_VOCAB_RECUP);
	$t->set_var("PHPSESSID", session_id());
	$t->set_var("LIBELLE_VOCAB_SUIVANT", CST_LIBELLE_VOCAB_SUIVANT);
    $t->set_var("POS_SEPARATEUR", $szSeparateur);
	$t->set_var("POS_VISU", (isset($_REQUEST['POS_VISU']))? stripslashes($_REQUEST['POS_VISU']): "");
    $t->set_var("LIBELLE_VOCAB_DF_CODE", CST_LIBELLE_VOCAB_CODE);
    $t->set_var("LIBELLE_VOCAB_DF_LIBELLE", CST_LIBELLE_VOCAB_LIBELLE);
    
    $t->set_var("DISPLAY_SI_EXST_LIB", ($stInfoRub->domferme > 0 && $wTypeRub == POS_RUB_ALPHA) ? "" : "none");
	$t->set_var("LIBELLE_EXPORT_DF_EXCEL", CST_LIBELLE_EXPORT_DF_EXCEL);
    $isExportVocExcel = ($stInfoRub->domferme > 0 && defined('DISPLAY_EXPORT_EXCEL_VOC') && DISPLAY_EXPORT_EXCEL_VOC == "1");
    $t->set_var("DISPLAY_EXPORT_VOC", $isExportVocExcel ? "" : "none");
	
    // bloc pour les différents vocabulaires.
	$t->set_block("vocabulaire", "DOMAINE", "domaine");
	if( $stInfoRub->domferme > 0)
	{
	    afficherTypeVocabulaire($iTypeVocab, POS_CODE_DF, CST_LIBELLE_VOCAB_CODE_DF, /*pref*/$t);
		// si la rubrique est alpha (pas de libellé DF sur les dates ou les numériques).
		if($wTypeRub == POS_RUB_ALPHA)
		    afficherTypeVocabulaire($iTypeVocab, POS_LIBELLE_DF, CST_LIBELLE_VOCAB_LIBELLE_DF, /*pref*/$t);
	}
	// ajout du vocabulaire utilisé dans tous les cas
	afficherTypeVocabulaire($iTypeVocab, POS_VOCAB_USED, CST_LIBELLE_VOCAB_USED, /*pref*/$t);

	if (strcmp($_REQUEST['POS_TYPEDOC'], CODE_TOUS_TYPES) != 0 && $_REQUEST['POS_VOC_LIE'] 
        && $stInfoRubInType[$ii]->b_lierdep)
	{
	    afficherTypeVocabulaire($iTypeVocab, POS_VOCAB_RUB_LIEE, CST_LIBELLE_VOCAB_RUB_LIEE, /*pref*/$t);
	}
	
	if ($stInfoRub->b_thesaurus)
	   afficherTypeVocabulaire($iTypeVocab, POS_VOCAB_THE, CST_LIBELLE_VOCAB_THE, /*pref*/$t);
	
	// La rubrique est monocritère ou si l'on force le comportement en monocritere (cas de la recherche elaborée) : 
    // on ne peut sélectionner qu'une valeur
	if (defined('VOC_DF_CODE_LIBELLE') && strcmp(VOC_DF_CODE_LIBELLE, "1") == 0) 
		$t->set_var("MODE_SELECT", ($stInfoRub->b_monocritere || $_REQUEST['FORCE_MONOCRITERE'] == 1) ? "onClick=select_mot(this.id)" : "onClick=remplisVisu(this.id)");
	else
		$t->set_var("MODE_SELECT", ($stInfoRub->b_monocritere || $_REQUEST['FORCE_MONOCRITERE'] == 1) ? "onClick=select_mot()" : "onClick=remplisVisu(this.selectedIndex)");
    $t->set_var("DISPLAY_SI_MULTICRITERE", ($stInfoRub->b_monocritere || $_REQUEST['FORCE_MONOCRITERE'] == 1) ? "none" : "");
	$t->set_var("FONCTION_SELECT", ($stInfoRub->b_monocritere || $_REQUEST['FORCE_MONOCRITERE'] == 1) ? "select_mot" : "remplisVisu");	
	$t->set_var("FORCE_MONOCRITERE", $_REQUEST['FORCE_MONOCRITERE']);
	$t->set_var("POS_CHAMP", $_REQUEST['POS_CHAMP']);
	$t->set_var("POS_VOC_LIE", $_REQUEST['POS_VOC_LIE']);
    $t->parse("Output", "vocabulaire");
	$t->p("Output");
}
else 
{
	debug ($jeton);
}

function afficherTypeVocabulaire($iTypeVocabSelected, $iCodeDomaine, $szLibelleDomaine, &$t)
{
	$t->set_var("CODE_DOM", $iCodeDomaine);
	$t->set_var("VALEUR_DOM", $szLibelleDomaine);
	$t->set_var("SELECTED", ($iTypeVocabSelected == $iCodeDomaine) ? "SELECTED" : "");
	$t->parse("domaine", "DOMAINE", true);
}

?>
