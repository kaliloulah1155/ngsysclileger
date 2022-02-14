<?php
/*
 * DESCRIPTION : Module d'affichage des fiches liees
 *
 * AUTEUR : Gabrielle Guy, Sébastien Fleury
 * DATE de CREATION : 02/07/2001
 * MODIFICATION  : 12/11/2002 Frédéric Tramarin
 *
 * Donnees en entree : 
 * POS_TYPEDOC : type du document
 * POS_VALEUR_RUB : code de la rubrique liee
 * POS_CODERUB : valeur de la rubrique liee
 * POS_ASSOCIATION : type d'assoctiontion souhaitée QUESTION ou FILS
 * POS_NUM_DOC 
 *
 * 18/07/2012 : suppression association fils : géré comme une question
 * sur base SQL 
 */

session_start();
include ("../include/locution.inc.php");
include ("../include/connexion.inc.php");
include ("../include/debug.inc.php");
include ("../include/liste_resumee.inc.php");
include ("../include/form_values.inc.php");
include ("../include/template.inc.php");
include ("../include/get_infoparam.php");
include ("../../../../configuration_w/constantesPHP.conf.php");
include ("../../../../configuration/label_".$_SESSION["sess_langue"].".conf");
include ("../../../../configuration/url.conf.php");
include ("afficher_index_lie.inc.php");

$retour = connexion($jeton);

if ($retour)
{
	$sTypeDoc = $_REQUEST["POS_TYPEDOC"];
	$sCodeRub = $_REQUEST["POS_CODERUB"];
	$sValeurRub = isset($_REQUEST["POS_VALEUR_RUB"]) ? $_REQUEST["POS_VALEUR_RUB"] : "";
	$isAfficheAsso = $_REQUEST["B_AFF_BOUTON_VALIDER"];
	
	// recherche sur la fiche liee
	// il faut donc recuperer le paramétrage du type de document
	// recuperation du parametrage de toutes les rubriques du type
	$retour = pos_getinforubintype($jeton, $sTypeDoc, "", 200, /*pref*/$tabRubInType);
	if ($retour)
	{
		// rechercher la structure correspondante a la rubrique
		for ($i=0;$i<count($tabRubInType);$i++)
		{
			if (strcmp($tabRubInType[$i]->code, $sCodeRub) == 0)
			{
				$szCodeTypeLie = $tabRubInType[$i]->code_typelie;
				$szCodeRubLiee = $tabRubInType[$i]->code_rubliee;
				break;
			}
		}
	
		// cas d'une question de la bibliothèque
		if (isset($_REQUEST["POS_ASSOCIATION"]) && $_REQUEST["POS_ASSOCIATION"] == "QUESTION")
		{
			$retour = pos_bib_getlocutionsquest($jeton, $_REQUEST["POS_QUESTION"], 1, /*pref*/$tabLocBib);
				
			$tabcodevalrub = get_form_values_with_prefix("POS_VAL_RUB_", true);
			$tabLoc = get_tabLocQuestion($tabLocBib,$tabcodevalrub);
	
			// recherche des reponses
			$retour = pos_searchdoc($jeton, count($tabLoc), $tabLoc, /*pref*/$iNbReponses, /*pref*/$iAdrPremiereReponse);
		}
		else if (isset($_REQUEST["POS_ASSOCIATION"]) && $_REQUEST["POS_ASSOCIATION"] == "RECHERCHE")
		{
			$tabLoc = get_tabLocWithValeur($sValeurRub, $_REQUEST["POS_RUB_RECH"], $_REQUEST["POS_TYPEDOC_LIE"]);
			
			// recherche des reponses
			$retour = pos_searchdoc($jeton, count($tabLoc), $tabLoc, /*pref*/$iNbReponses, /*pref*/$iAdrPremiereReponse);
		}
		// cas des associations normales
		else
		{
		    // la valeur peut-être vide pour un passage en mode recherche
		    if (strlen($sValeurRub))
		    {
                if (strcmp($szCodeRubLiee, "K H") != 0)
    			{
    			    $tabLoc = get_tabLocWithValeur($sValeurRub, $szCodeRubLiee, $szCodeTypeLie);
    				$retour = pos_searchdoc($jeton, count($tabLoc), $tabLoc, /*pref*/$iNbReponses, /*pref*/$iAdrPremiereReponse);
    			}
    			else
    				$retour = pos_getfichesliees($jeton, $sTypeDoc, $sCodeRub, stripslashes($sValeurRub), /*pref*/$iAdrPremiereReponse, /*pref*/$iNbReponses);
            }
            else
                $iNbReponses = 0;
		}
		
		if ($isAfficheAsso)
		{
            if (strcmp($szCodeTypeLie, "000") != 0)
                $retour = pos_getlistrubintypermc($jeton, $szCodeTypeLie, /*pref*/$tabLibRubLiees);
            else
                $retour = pos_getlistallrubrmc($jeton, /*pref*/$tabLibRubLiees);
            asort($tabLibRubLiees);
        }
		
		if(!$retour)
		    debug ($jeton);
    }
	else
	    debug ($jeton);
	
	if ($retour)
	{
		// ------------------------------------------------
		//         DEBUT DE L'AFFICHAGE
		// ------------------------------------------------
    	$t = new template(REP_TEMPLATE_APPLICATIF."lien");
    	$t->set_file("lien", "lien.tpl");
    	
    	$t->set_block("lien", "ENTETE", "entete");
    	$t->set_block("lien", "LR_REPONSE", "lrreponse");
    	$t->set_block("lien", "LISTE_REPONSES", "listereponses");
    	$t->set_block("lien", "RUBRIQUES", "rubriques");
    	
    	$t->set_var("POS_TYPEDOC", $sTypeDoc);
    	if (strcmp($szCodeTypeLie, "000") != 0)
    	{
            $retour = get_infotypecache($jeton, $szCodeTypeLie, /*pref*/$objInfoType, /*pref*/$tabInfoZonesKeys);	
            if($retour)
        	   $t->set_var("LIBELLE_TYPEDOC", $objInfoType->libelle);
        }
        else
            $t->set_var("LIBELLE_TYPEDOC", CST_LIBELLE_TOUS_TYPES);
            
        $t->set_var("POS_CODERUB", $sCodeRub);
    	$t->set_var("POS_CODERUB_LIEE", $szCodeRubLiee);
    	$t->set_var("POS_TYPEDOC_LIE", $szCodeTypeLie);
    	$t->set_var("B_AFF_BOUTON_VALIDER", $isAfficheAsso);
    	$t->set_var("POS_VALEUR_RUB", stripslashes($sValeurRub));
    	$t->set_var("LIBELLE_NB_REPONSE", CST_LIBELLE_NB_REPONSE_FICHE_LIE);
   		$t->set_var("NB_REPONSES", $iNbReponses);
   		// affichage de la zone de recherche uniquement pour les associations
   		$t->set_var("DISPLAY_ZONE_RECHERCHE", $_REQUEST["B_AFF_BOUTON_VALIDER"] ? "" : "none");
   		$t->set_var("POS_ASSOCIATION", (isset($_REQUEST["POS_ASSOCIATION"])) ? $_REQUEST["POS_ASSOCIATION"] : "");
   		$t->set_var("POS_CREATION", $_REQUEST["POS_CREATION"]);
   		   		    	
        $t->set_var("URL_ASSOC", URL_ASSOCIER_INDEX);
    	$t->set_var("URL_CONSULT", URL_CONSULTER_INDEX);
    	$t->set_var("LIBELLE_CONSULT", CST_LIBELLE_CONSULT);
    	$t->set_var("LIBELLE_RECHERCHER", CST_LIBELLE_RECHERCHER);
    	$t->set_var("PHPSESSID", session_id());
        $t->set_var("URL_GARDER_EN_REPONSE", URL_GARDER_EN_REPONSE);
        $t->set_var("URL_CREATION", URL_CREATION);
        $t->set_var("URL_AFF_LIEN", URL_AFFICHE_LIEN_ASSO."?");
        $t->set_var("URL_ATTENTE", URL_ATTENTE);
        $t->set_var("PHPSESSID", session_id());
        $t->set_var("QUERY_STRING", $_SERVER['QUERY_STRING']);
        
        //$t->set_var("B_AFF_BOUTON_VALIDER", ($_REQUEST["B_AFF_BOUTON_VALIDER"] != "") ? $_REQUEST["B_AFF_BOUTON_VALIDER"]: "0");
        $t->set_var("LIBELLE_FERMER", CST_LIBELLE_FERMER);
        $t->set_var("LIBELLE_AFFICHER_LISTE", CST_LIBELLE_BOUTON_AFFICHER_LISTE_LIEN);
        $t->set_var("LIBELLE_GARDER_EN_REPONSE", CST_LIBELLE_GARDER_EN_REPONSE);
        $t->set_var("LIBELLE_VALIDER_ASSO", CST_LIBELLE_BOUTON_VALIDER_ASSO);
        $t->set_var("LIBELLE_BOUTON_CREER", CST_LIBELLE_BOUTON_CREER_LIEN);
		
        //Le bouton VALIDER n'apparait pas dans le cas d'exploration de répertoire
        $t->set_var("DISPLAY_VALIDER", ($_REQUEST["B_AFF_BOUTON_VALIDER"]) ? "" : "none");
        $t->set_var("DISPLAY_CREER", ($szCodeTypeLie != "000" && $_REQUEST["POS_CREATION"] == 1 && $_REQUEST["B_AFF_BOUTON_VALIDER"] == "1") ? "" : "none");
    	
    	if ($isAfficheAsso)
    	{
            $sSelectedRub = $szCodeRubLiee;
        	if (isset($_REQUEST["POS_RUB_RECH"]))
        	   $sSelectedRub = $_REQUEST["POS_RUB_RECH"];
        	
        	while (list($code, $libelle) = each($tabLibRubLiees))
    		{				
    			// Pour reaffichage d'une locution.
    			$t->set_var("SELECTED", strcmp($code, $sSelectedRub) == 0 ? "SELECTED" : "");
    			$t->set_var("CODE_RUB", $code);
                $t->set_var("LIBELLE_RUB", $libelle);
                $t->parse("rubriques", "RUBRIQUES", true);
    		}
        }
        else
            $t->set_var("rubriques", "");
        
        //Si un type de document unique est renvoyé par la recherche alors on
		//regarde s'il existe les droits de création sinon on affecte le type de document à la valeur tous types pour 
        // ne pas avoir accés à la création	
		if (strcmp($szCodeTypeLie,"000") != 0  && 
				(stristr($_SESSION["sess_liste_doc_indexables"], $szCodeTypeLie) == FALSE && 
								strlen($_SESSION["sess_liste_doc_indexables"]) > 1) )
			//Pour ne pas autoriser la création on place le code du document à 000	
			$szCodeTypeLie = "000";
        $t->set_var("POS_CODETYPE_LIEE", $szCodeTypeLie);

    	if($iNbReponses)
		{
		    $t->set_var("DISPLAY_TABLE_LR", "");
		    // recuperation de l'ensemble des listes resumees
			$retour = pos_getreponseslrd($jeton, $iAdrPremiereReponse, $iNbReponses, $iNbReponses, 1, 1, /*pref*/$szProfilLR, /*pref*/$tabReponseLR);
	
			if ($retour)
			{
				$retour = pos_gestplr($jeton, "$szProfilLR", /*pref*/$objLR, /*pref*/$tabZoneLR);
				if ($retour)
				{
                    $t->set_var("LIBELLE_COL_RADIO_BOUTON_FICHE_LIE", CST_LIBELLE_COL_RADIO_BOUTON_FICHE_LIE);
                    
                    $tabAlignCol = array();
                    for ($i=0;$i<count($tabZoneLR);$i++) 
                    {
                        $t->set_var("TITRE_COLONNE", $tabZoneLR[$i]->zone_titre_col);
                        switch($tabZoneLR[$i]->zone_align_col)
                        {
                            case 1 :
                            $tabAlignCol[$i] = "center"; break;
                            case 2 :
                            $tabAlignCol[$i] = "left"; break;
                            case 3 :
                            $tabAlignCol[$i] = "right"; break;
                            default :
                            $tabAlignCol[$i] = "left"; break;
                        }
                        $t->parse("entete", "ENTETE", true);
                    }
      	
                    for ($i=0; $i<count($tabReponseLR); $i++) 
                    {
                        $t->set_var("PAIR_OU_IMPAIR",  (($i % 2) == 0) ? "pair" : "impair");
                        $iNumDoc=$tabReponseLR[$i]->numdoc;
                        
                        //La premiere checkbox de la liste est cochee par defaut
                        if($_REQUEST["B_AFF_BOUTON_VALIDER"])
                        {
                            if($i == 0)
                                $t->set_var("SELECTION_RADIO","<INPUT TYPE=RADIO NAME=POS_NUM_DOC VALUE=$iNumDoc checked>");
                            else
                                $t->set_var("SELECTION_RADIO","<INPUT TYPE=RADIO NAME=POS_NUM_DOC VALUE=$iNumDoc >");
                        }
                        else
                            $t->set_var("SELECTION_RADIO","");
                            
                        $t->set_var("POS_NUMDOC", $iNumDoc);
                        $tabChamps = extraireChampsLR($tabReponseLR[$i]->lr, "\x02");
                        $t->set_var("lrreponse", "");
                        for ($j = 0; $j<count($tabChamps); $j++)
                        {
                            $t->set_var("ALIGN", $tabAlignCol[$j]);
                            $t->set_var("ZONE_LR", htmlentities_currentcharset($tabChamps[$j], null)."&nbsp;");
                            $t->parse("lrreponse", "LR_REPONSE", true);
                        }
                        $t->parse("listereponses", "LISTE_REPONSES", true);
                    }
                }
				else 
					debug ($jeton);
			}
			else 
                debug($jeton);
		}
		else 
		{	
		    $t->set_var("DISPLAY_TABLE_LR", "none");
			if (strcmp($szCodeTypeLie,"000") != 0  && 
							(stristr($_SESSION["sess_liste_doc_indexables"], $szCodeTypeLie) == FALSE && 
									strlen($_SESSION["sess_liste_doc_indexables"]) > 1) )
			{
                afficheMsg(CST_LIBELLE_AFFICHAGE_FICHES_LIEES);
			}
			else
			{
				$t->set_var("POS_CODERUB_LIEE", $szCodeRubLiee);
				$t->set_var("CHOIX","");
		    }
        }
        $t->parse("Output", "lien");  
        $t->p("Output");
    }
    pos_disconnect($jeton);
}
else
{
	debug($jeton);
	echec_connexion();
}
?>
