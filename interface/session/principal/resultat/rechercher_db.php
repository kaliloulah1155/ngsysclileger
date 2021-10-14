<?php
/*
 * DESCRIPTION : Module d'affichage des resultats 
 * 
 * Recherche des reponses � la question posee (get_reponses.php)
 * Si type dossier
 * 	Affichage de la gestion des pages
 *	Affichage de la liste resum�e normale
 *
 * AUTEUR : Sebastien Fleury / Gabrielle Guy
 * DATE de CREATION : 19/06/2001
 *
 * Donnees en entree : 
 * POS_TYPEDOC : type du document
 * POS_VAL_RUB_RUX ou RUX correspond au code d'une rubrique du type de document
 * POS_NUMLOC nombre de locutions de la recherche �labor�e
 *
 * MODIFICATIONS
 * 24/08/2001 - Fleury s�bastien - encodage des questions de la bib dans l'url
 * 07.09.2001 - Gaby - s�lection par ligne
 * 03.10.2001 - Gaby - modification gestion des variables
 * 14.11.2001 - Gaby - constante pour l'affichage par page
 * 14.02.2002 - Marc - refonte du fichier pour affichage commun des dossiers et des documents
 * 
 */

include ("../include/locution.inc.php");
include_once ("../include/bal.inc.php");
if (!isset($_SESSION))
session_start();

include ("../include/connexion.inc.php");
include ("../include/liste_resumee.inc.php");
include ("../include/debug.inc.php");
include ("../include/template.inc.php");
include ("../include/profil.inc.php");
include ("../include/get_infoparam.php");
include ("../include/form_values.inc.php");
include ("../../../../configuration_w/constantesPHP.conf.php");
include ("../../../../configuration/url.conf.php");
include ("../../../../configuration/label_".$_SESSION["sess_langue"].".conf");
include ("../resultat/utils_recherche.inc.php");


$time_start = getmicrotime();

$szTypeRecherche = isset($_REQUEST['TYPE_RECHERCHE']) ? $_REQUEST['TYPE_RECHERCHE'] : "";
if (isset($_REQUEST['INUMQUEST']) && strlen($_REQUEST["INUMQUEST"]) != 0)
    $iNumQuest = $_REQUEST['INUMQUEST'];

$retour = connexion($jeton);
if($retour)
{
	$iNombreReponse = 0;
	// variable commune : initialisation des options de tri de la LR
	$iNumColTri = isset($_REQUEST["POS_LR_TRI_NUMCOL"]) ? $_REQUEST["POS_LR_TRI_NUMCOL"] : 1;
	$iTypeTri = isset($_REQUEST["POS_LR_TRI_TYPE"]) ? $_REQUEST["POS_LR_TRI_TYPE"] : CST_TYPE_TRI;
				
	// ...et fixe le profil de la liste r�sum�e.
	$szProfilLR = isset($_REQUEST["POS_PROFIL_LR"]) ? stripslashes($_REQUEST["POS_PROFIL_LR"]) : "";	

	// boolean pour l'aafichage du bouton voir les attributs.
	$bAfficheAttribut = 0;

	if(isset($_REQUEST["POS_NUMDOS"]) && strlen($_REQUEST["POS_NUMDOS"]) != 0 && 
                !(isset($_REQUEST["FILTRE"]) && strcmp($_REQUEST["FILTRE"], "1") == 0))
    {
   		// Pour ne pas avoir l'ouverture automatique sur la consultation d'un dossier.
   		$POS_FIRSTLOAD = 0;
		
		// affichage par plage, on r�cup�re le nombre total de fils du dossier
		if (defined('DOSSIER_REPONSES_PAR_PAGE') && DOSSIER_REPONSES_PAR_PAGE == 1)
		{
		    if ($_SESSION["sess_obj_infos_appli"]->dwTypeBDD == PHP_VULCAIN_TYPE_BDD_DISAM)
			{
                $retour = pos_dosinfocontenu($jeton, $_REQUEST["POS_NUMDOS"], /*pref*/$tabFils);
                $iNombreReponse = count($tabFils);
            }
            else {
                $tabLoc = array();
                $tabLoc[0] = new Locution(1, "000", "NuP", "=", $_REQUEST["POS_NUMDOS"]);
                $retour = pos_searchdoc($jeton, count($tabLoc), $tabLoc, /*pref*/$iNbReponses, /*pref*/$iAdrPremiereReponse);
                $iNombreReponse = $iNbReponses;
			}
            
            if (!isset($_REQUEST["POS_NUMPAGE"]) || strlen($_REQUEST["POS_NUMPAGE"]) == 0 || 
                    NB_REPONSES_PAR_PAGE*($_REQUEST["POS_NUMPAGE"]-1) >= $iNombreReponse)
                $_REQUEST["POS_NUMPAGE"] = 1;
            $dwNbRepVoulu = $_REQUEST["POS_NUMPAGE"] * NB_REPONSES_PAR_PAGE;
		}
		else    
        {
            $_REQUEST["POS_NUMPAGE"] = 1;
            $dwNbRepVoulu = 0;
		}
		//--------------------------------------
		// Consultation du contenu d'un dossier
		//--------------------------------------
		$retour = pos_constlrdavecattributs($jeton, $_REQUEST["POS_NUMDOS"], $dwNbRepVoulu, $iNumColTri, $iTypeTri, 
				/*pref*/$szProfilLR, /*pref*/$tabRepLR, /*pref*/$tabZoneLR);
		
		if (defined('DOSSIER_REPONSES_PAR_PAGE') && DOSSIER_REPONSES_PAR_PAGE == 1)
		  $tabREP_LR = array_slice($tabRepLR, NB_REPONSES_PAR_PAGE*($_REQUEST["POS_NUMPAGE"]-1));
		else
		{
		  $iNombreReponse = count($tabRepLR);
          $tabREP_LR = $tabRepLR;
        }
		
	}
	else
    {
		//------------------------------------------------------
		// Consultation de la liste des r�ponses d'une question
		//------------------------------------------------------
		// r�cuperation des r�ponses
		// --> toutes les variables re�ues en entr�es
		// <-- iNbReponses 
		// <-- iAdrPremReponses
		// <-- bResoVariable
		$bResoVariable = false;
		
		// pour ne pas avoir la page trop de r�ponses.
		if(isset($iNumQuest))
			$bPasseNbMax = 1;
			
		include("get_reponses.php");

		// gestion de la page trop de r�ponses.
		// si la question n'a pas deja �t� enregistr�e 
		if(isset($iNbReponses) && $iNbReponses > NB_REPONSES_MAX_LR && !isset($bPasseNbMax))
		{
			$t = new template(".");
			$szTplName = REP_TEMPLATE_APPLICATIF."resultat/demande_si_trop_reponse.tpl";
			$t->set_file("max_rep", $szTplName);
			
			$t->set_var("LIBELLE_TROP_REP", sprintf(CST_LIBELLE_TROP_REP, NB_REPONSES_MAX_LR, $iNbReponses));
			
			$t->set_var("LIBELLE_OUI", CST_LIBELLE_OUI);
			$t->set_var("LIBELLE_NON", CST_LIBELLE_NON);
			$t->set_var("LIBELLE_ANNULER", CST_LIBELLE_ANNULER);
            $t->set_var("TITRE_MAX_REP", CST_TITRE_MAX_REP);
			
			$t->set_var("URL_CONFIRM_TRI", URL_ATTENTE."?URL=".URL_RESULTAT."&".$_SERVER['QUERY_STRING']."&INUMQUEST=".$iNumQuest."&POS_NEW_QUESTION=1");
			$t->set_var("URL_PAS_DE_TRI", URL_ATTENTE."?URL=".URL_RESULTAT."&".$_SERVER['QUERY_STRING']."&INUMQUEST=".$iNumQuest."&POS_LR_TRI_TYPE=0&POS_NEW_QUESTION=1");
			
			include("../include/rappel_historique.inc.php");
 			$linkHis = getLienHistorique($iNumQuest, /*pref*/$bModif);
			
			if($bModif == true)
				$t->set_var("URL_RAPPEL", "<A HREF=\"".$linkHis."\">[".CST_LIBELLE_RAPPEL."]</A>");
			else
				$t->set_var("URL_RAPPEL", "");
			
			// affichage du template
			$t->parse("Output", "max_rep");  
			$t->p("Output");
			
			pos_disconnect($jeton);
			exit;
		}

		// si il existe au moins une r�ponse...
		if($iSearch && isset($iNbReponses) && $iNbReponses > 0 && !$bResoVariable)
        {
			// Si necessaire, on initialise le num�ro de page des r�sultats
			// sur la premi�re page
			if (!isset($_REQUEST["POS_NUMPAGE"]) || strlen($_REQUEST["POS_NUMPAGE"]) == 0 || NB_REPONSES_PAR_PAGE*($_REQUEST["POS_NUMPAGE"]-1) >= $iNbReponses)
				$_REQUEST["POS_NUMPAGE"] = 1;
									
			// R�cup�ration de la LR et du tab des r�ponses trouv�es :
			// on fixe le nb de r�ponses d�sir�es
			$dwNbRepVoulu = $_REQUEST["POS_NUMPAGE"] * NB_REPONSES_PAR_PAGE;			
			
			$retour = pos_getreponseslrd($jeton, $iAdrPremiereReponse, $iNbReponses, $dwNbRepVoulu, 
					$iNumColTri, $iTypeTri, /*pref*/$szProfilLR, /*pref*/$tabRepLR);
			if(!$retour)
			 debug($jeton);		
			$iNombreReponse = $iNbReponses;
				
			//on ne garde que des r�ponses comprises dans la page � afficher
			$tabREP_LR = array_slice($tabRepLR, NB_REPONSES_PAR_PAGE*($_REQUEST["POS_NUMPAGE"]-1));
		}
		// si le retour n'est pas bon et que l'on est sur une recherche simple
		// on n'a pas saisie de crit�re de recherche donc on revient sur la recherche.
		elseif (strcmp($szTypeRecherche, "RECHERCHE_SIMPLE") == 0 && count($tabLoc) == 0)
		{
			// on gere le message retour pour une recherche "simple" sans r�ponse
			$tabInfoDebug[0] = CST_LIBELLE_SEARCH_NO_CRITERE;
			debug_code($tabInfoDebug);

			// l'include est fait plus bas
			// include("../recherche/afficher_recherche_fiche.php");
		}
	}

	// A partir des variables szProfilLR && tabREP_LR obtenues, on g�re l'affichage.
	if(!$retour)
	{
			afficheMsg(CST_LIBELLE_SEARCH_NO_PROFIL);
	}
	else
	{
		//------------------------------------------------------------
		// si contenu d'un dossier il faut afficher l'ecran pour avoir
		// acces a l'arborescence
		//------------------------------------------------------------
   		if ($iNombreReponse > 0 || (isset($_REQUEST["POS_NUMDOS"]) && strlen($_REQUEST["POS_NUMDOS"]) != 0) )
   		{
			// ...et inclusion du fichier d'affichage
			include ("afficher_reponses.php");
		}
		//-------------------------
		// Recherches sans r�ponse
		//-------------------------
		else
		{
			if(!$bResoVariable)
			{
			    if (isset($_REQUEST["POS_QUEST_RES_VAR"]) && $_REQUEST["POS_QUEST_RES_VAR"]==1)
			    {
			         $tabInfoDebug[0] = CST_LIBELLE_SEARCH_NO_REPONSE_SIMPLE;
                    if(isset($_SESSION["tabQuestVar"]))
        	         $tabInfoDebug[1] = CST_LIBELLE_SEARCH_FORM_REPONSE;
        	         debug_code($tabInfoDebug);
                    if(isset($_SESSION["tabQuestVar"]))
                        include("../resultat/afficher_resolution_variable.php");
                    // cas de la question a la connexion ou l'on a pas enregistre le tableau de variable.
                    else {
                        echo "<SCRIPT>";
    				    echo "parent.basculerEcran('centerbal');";
                        echo "parent.closeOnglet(window.frameElement.id);";
                        echo "</SCRIPT>";
                    }
                }
                else if (strcmp($szTypeRecherche, "RECHERCHE_SIMPLE") == 0)
                {
				    if($iSearch)
				    {
    					// on gere le message retour pour une recherche "simple" sans r�ponse
    					$tabInfoDebug[0] = CST_LIBELLE_SEARCH_NO_REPONSE_SIMPLE;
    					$tabInfoDebug[1] = CST_LIBELLE_SEARCH_FORM_REPONSE;
    					debug_code($tabInfoDebug);
    				}

					if(isset($_SESSION["sess_tabHistQuest"][0][$iNumQuest][0]->szCodeType))
					$_REQUEST["POS_TYPEDOC"] = $_SESSION["sess_tabHistQuest"][0][$iNumQuest][0]->szCodeType;
                    $_REQUEST["INUMQUEST"] = $iNumQuest;
					// attention pour que cela fonctionne les fichiers doivent �tre
					// m�me niveau dans l'arborescence
					include("../recherche/afficher_recherche_fiche.php");
				}
				elseif(strcmp($szTypeRecherche, "RECHERCHE_ELABOREE") == 0)
				{
				    if($iSearch)
				    {
				        $tabInfoDebug[0] = CST_LIBELLE_SEARCH_NO_REPONSE;
					    debug_code($tabInfoDebug);
					}

					$_REQUEST["POS_TYPEDOC"] = $_SESSION["sess_tabHistQuest"][0][$iNumQuest][0]->szCodeType;
					$_REQUEST["INUMQUEST"] = $iNumQuest;
                    include("../recherche/afficher_recherche_elaboree.php");
				}
				else if (strcmp($szTypeRecherche, "RECHERCHE_PANIER") == 0)
				{
				    afficheMsg(CST_LIBELLE_PANIER_VIDE);    
				}
				else if (strcmp($szTypeRecherche, "RECHERCHE_BAL") == 0 || strcmp($szTypeRecherche, "RECHERCHE_BIB") == 0)
				{
					if (strcmp($szTypeRecherche, "RECHERCHE_BAL") == 0)
                        $tabInfoDebug[0] = CST_LIBELLE_SEARCH_PLUS_REPONSE_BAL;
                    else
                        $tabInfoDebug[0] = CST_LIBELLE_SEARCH_PLUS_REPONSE;
					debug_code($tabInfoDebug);
				    //include("../question/afficher_question.php");
				    echo "<SCRIPT>";
				    if(strcmp($szTypeRecherche, "RECHERCHE_BAL") == 0)
	    				echo "parent.centerbal.majBal('".addslashes($_SESSION["sess_tabHistQuest"][4][$iNumQuest])."','0');";
					echo "parent.basculerEcran('centerbal');";
                    echo "parent.closeOnglet(window.frameElement.id);";
                    echo "</SCRIPT>";
				}
				else if (strcmp($szTypeRecherche, "RECHERCHE_CLE") == 0)
				{
				    if($iSearch)
				    {
				        $tabInfoDebug[0] = CST_LIBELLE_SEARCH_NO_REPONSE;
					    debug_code($tabInfoDebug);
					}
                    $_REQUEST["POS_TYPEDOC"] = $_SESSION["sess_tabHistQuest"][0][$iNumQuest][0]->szCodeType;
					$_REQUEST["INUMQUEST"] = $iNumQuest;
                    include("../recherche/frame1_afficher_recherche_cle.php");
				}
				else if (strcmp($szTypeRecherche, "RECHERCHE_POS_NUM_DOC") == 0)
				{
				    if($iSearch)
				    {
				        $tabInfoDebug[0] = CST_LIBELLE_SEARCH_NO_REPONSE;
					    debug_code($tabInfoDebug);
					}
                    include("../recherche/afficher_recherche_num_doc.php");
				}
				else if (strcmp($szTypeRecherche, "RECHERCHE_FTX_LOC") == 0)
				{
				    if($iSearch)
				    {
				        $tabInfoDebug[0] = CST_LIBELLE_SEARCH_NO_REPONSE;
					    debug_code($tabInfoDebug);
					}
					$_REQUEST["INUMQUEST"] = $iNumQuest;
                    include("../ftx/afficher_rech_ftx.php");
				}
				else 
				{
					afficheMsg(CST_LIBELLE_SEARCH_NO_REPONSE);
				}
                // la recherche est affichee dans l'arborescence meme si pas de reponse
				if ($bNewQuestion && (strcmp($szTypeRecherche, "RECHERCHE_CLE") == 0 || 
					strcmp($szTypeRecherche, "RECHERCHE_POS_NUM_DOC") == 0 ||
					strcmp($szTypeRecherche, "RECHERCHE_ELABOREE") == 0 || strcmp($szTypeRecherche, "RECHERCHE_SIMPLE") == 0))
				{
    		    	include ("../include/question.inc.php");
                    $szTitreQuest = affiche_une_locution($jeton, 0, 1, $iNumQuest, 0, $_SESSION["sess_tabLibTypeDoc"]);
		        	$szTitreQuest = preg_replace('/\'/', '@', $szTitreQuest);
					echo "<script>";
					echo "parent.updateMenuAddQuestion(' (0)&nbsp;$szTitreQuest', '$iNumQuest', '0', '$szTypeRecherche');";
					echo "</script>";
				}
			    
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
?>
