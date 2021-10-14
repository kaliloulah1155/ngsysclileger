<?php
/* 
 * Gestion des types de document
 *
 * Patrick Legaigneur 16/06/2011
 *
 */
if (!isset($_SESSION))
    session_start();
include ("../include/connexion.inc.php");
include ("../include/debug.inc.php");
include ("../include/template.inc.php");
include ("../../../../configuration_w/constantesPHP.conf.php");
include ("../../../../configuration/label_".$_SESSION["sess_langue"].".conf");
include ("../../../../configuration/label_admin_".$_SESSION["sess_langue"].".conf");
include ("../../../../configuration/url.conf.php");


function makeTriTypeDoc($szTri, $tabAffiche)
{
	$tabTmp=array();
	$tabTmpFinal=array();
    for($i=0; $i<count($tabAffiche); $i++)
	{
		if(strcmp($szTri,"CODE_TYPEDOC")==0)
			$tabTmp[$i]=$tabAffiche[$i]->szTypeDoc;
		elseif(strcmp($szTri,"LIBELLE_TYPEDOC")==0)
			$tabTmp[$i]=$tabAffiche[$i]->szNomTypeDoc;
		elseif(strcmp($szTri,"THESAURUS_TYPEDOC")==0)
			$tabTmp[$i]=$tabAffiche[$i]->bThesaurus;
		elseif(strcmp($szTri,"DOSSIER_TYPEDOC")==0)
			$tabTmp[$i]=$tabAffiche[$i]->wTypeDos;
		elseif(strcmp($szTri,"KH_TYPEDOC")==0)
			$tabTmp[$i]=$tabAffiche[$i]->wHierarchie;	
		elseif(strcmp($szTri,"FULLTEXT_TYPEDOC")==0)
			$tabTmp[$i]=$tabAffiche[$i]->wFullTexte;	
		elseif(strcmp($szTri,"VISIBILITE_TYPEDOC")==0)
			$tabTmp[$i]=$tabAffiche[$i]->bInvisible;
		elseif(strcmp($szTri,"FICHE_PARAM_TYPEDOC")==0)
			$tabTmp[$i]=$tabAffiche[$i]->bFicheParam;
 		elseif(strcmp($szTri,"GESTION_VERSION_TYPEDOC")==0)
			$tabTmp[$i]=$tabAffiche[$i]->wGestVersions;
		elseif(strcmp($szTri,"SPOOL_TYPEDOC")==0)
			$tabTmp[$i]=$tabAffiche[$i]->bSpool;
		elseif(strcmp($szTri,"RESTRICTION_ACCES_TYPEDOC")==0)
			$tabTmp[$i]=$tabAffiche[$i]->wRestrictionAcces;
	}

	asort($tabTmp);
    // on reconstruit le tableau dans l'ordre.
	while (list($key, $val) = each($tabTmp))
	{
		$tabTmpFinal[]=$tabAffiche[$key];
	}
	return $tabTmpFinal;
}

// Array ( [0] => stdClass Object ( 
// [szTypeDoc] => TTT [szNomTypeDoc] => test [bInvisible] => 0 [wHierarchie] => 1 [bThesaurus] => 0 [bIndexAuto] => 0 [wArchiver] => 3 [wHierNbZone] => 1
// [stKeyHier] => stdClass Object ( [wIndZoneCpt] => 0 [wIndZoneRupture] => 0 [wLgZone] => Array ( [0] => 1 [1] => 1 [2] => 0 [3] => 0 [4] => 0 [5] => 0 [6] => 0 [7] => 0 [8] => 0 [9] => 0 [10] => 0 [11] => 0 [12] => 0 [13] => 0 [14] => 0 [15] => 0 [16] => 0 [17] => 0 [18] => 0 [19] => 0 )
//    [szLibelleZone] => Array ( [0] => 1 [1] => 2 [2] => [3] => [4] => [5] => [6] => [7] => [8] => [9] => [10] => [11] => [12] => [13] => [14] => [15] => [16] => [17] => [18] => [19] => )
//     [bZoneOblig] => Array ( [0] => 0 [1] => 0 [2] => 0 [3] => 0 [4] => 0 [5] => 0 [6] => 0 [7] => 0 [8] => 0 [9] => 0 [10] => 0 [11] => 0 [12] => 0 [13] => 0 [14] => 0 [15] => 0 [16] => 0 [17] => 0 [18] => 0 [19] => 0 )
// 	  [wNumZoneComp] => Array ( [0] => 0 [1] => 0 [2] => 0 [3] => 0 [4] => 0 [5] => 0 [6] => 0 [7] => 0 [8] => 0 [9] => 0 [10] => 0 [11] => 0 [12] => 0 [13] => 0 [14] => 0 [15] => 0 [16] => 0 [17] => 0 [18] => 0 [19] => 0 )
// 	   [szCodeRubLien] => Array ( [0] => [1] => [2] => [3] => [4] => [5] => [6] => [7] => [8] => [9] => [10] => [11] => [12] => [13] => [14] => [15] => [16] => [17] => [18] => [19] => )
// 	    [wPosHier] => Array ( [0] => 0 [1] => 0 [2] => 0 [3] => 0 [4] => 0 [5] => 0 [6] => 0 [7] => 0 [8] => 0 [9] => 0 [10] => 0 [11] => 0 [12] => 0 [13] => 0 [14] => 0 [15] => 0 [16] => 0 [17] => 0 [18] => 0 [19] => 0 ) )
// [bSpool] => 1 [wRubCloison] => 0 [wRubIndConf] => 0 [bFicheParam] => 0 [szFondPage] => [bXML] => 0 [wRubNivConf] => 0 [bLierArr] => 0 [wNbJourSurDM] => 0 [wLigFdPg] => 0 [wColFdPg] => 0
// [wTypeDos] => 0 [szRubTitreDos] => [wInsererAutoDos] => 0 [nMaxPages] => 0 [szTypeDosRangement] => [szRubSelectDos] => [szRubSelectDosFils] => [szNomQuestion] => [wFullTexte] => 0
// [stArchive] => stdClass Object ( [bArchiveSiModifIndex] => 1 [bArchiveSiModifPage] => 1 [szTypeDocArchive] => ARR [szRubArchiveNumVersion] => AMF [szRubArchiveDateModif] => AMO
// 	 [szRubArchiveNomUtil] => ASS [szRubArchiveObservation] => ASU [szRubArchiveRaisonModif] => AVU [bArchivePage] => 1 )
// [wTypeRubConsultIndex] => 2 [wTypeRubConsultFichiers] => 0 [wTypeRubModifIndex] => 2 [wTypeRubModifFichiers] => 2 [wTypeRubSupprIndex] => 2 [wTypeRubSupprFichiers] => 2
//  [szCodeRubConsultIndex] => AA1 [szCodeRubConsultFichiers] => [szCodeRubModifIndex] => AA2 [szCodeRubModifFichiers] => AA5 [szCodeRubSupprIndex] => AA3 [szCodeRubSupprFichiers] => AA6
//   [szQuestionRestriction] => BAL_AR_ASS_A_TRAITER [dwTypeConfDef] => 1 [wIndConfDef] => 1 [wNivConfDef] => 2 [szCloisonDef] => AND
// ) ) 

$retour = connexion($jeton);

if ($retour)
{
	// vérification du droit à gérer les TYPEDOCs de fichier
	if ($_SESSION["sess_droitAdministration"] == false)
	{	
		afficheMsg(CST_LIBELLE_NO_ADMINISTRATION);
	}
	else
	{     
		// Requête de récupération des TYPEDOCs de fichier	
		$retour = pos_gettype($jeton, "", /*pref*/$tabLstDoc);
				
		if ($retour)
		{
			if(isset($_REQUEST['POS_TRI_COL']))
				{
					if(strcmp($_REQUEST['POS_TRI_COL'],"CODE_TYPEDOC") != 0)
						$triprofil = 0;
					else 
						$triprofil = 1;
					
					$cletri = $_REQUEST['POS_TRI_COL'];
				}
			else
				{
					$triprofil = 0;
					$cletri = "CODE_TYPEDOC";
				}
			$triOrdre="1"; // le tri inverse ne fonctionne pas
			$szObjImg = "<IMG SRC='".URL_SITE."/images/icons/tri_lr_$triOrdre.png' border=0 align=center>";
			
			// Affichage
			$t = new Template(".");	
			$t->set_File("liste_typedoc", REP_TEMPLATE_APPLICATIF."gestiontypedoc/liste_typedoc.tpl");	
			$t->set_var("TITRE_PAGE", CST_LIBELLE_TOOLBAR_GEST_TYPEDOC);			
			$t->set_block("liste_typedoc", "BLOC_TYPEDOC", "bloc_typedoc");
						
			// affichage de l'icone indiquant la clé du tri
			$t->set_var("LIBELLE_CODE_TYPEDOC", CST_TDOC_LIBELLE_CODE_TYPEDOC.(strcmp($cletri, "CODE_TYPEDOC") == 0 ? "&nbsp;".$szObjImg : ""));
			$t->set_var("LIBELLE_LIBELLE_TYPEDOC", CST_TDOC_LIBELLE_LIBELLE_TYPEDOC.(strcmp($cletri, "LIBELLE_TYPEDOC") == 0 ? "&nbsp;".$szObjImg : ""));	
			$t->set_var("LIBELLE_THESAURUS_TYPEDOC", CST_TDOC_LIBELLE_THESAURUS_TYPEDOC.(strcmp($cletri, "THESAURUS_TYPEDOC") == 0 ? "&nbsp;".$szObjImg : ""));
			$t->set_var("LIBELLE_DOSSIER_TYPEDOC", CST_TDOC_LIBELLE_DOSSIER_TYPEDOC.(strcmp($cletri, "DOSSIER_TYPEDOC") == 0 ? "&nbsp;".$szObjImg : ""));
			$t->set_var("LIBELLE_K_H_TYPEDOC", CST_TDOC_LIBELLE_K_H_TYPEDOC.(strcmp($cletri, "KH_TYPEDOC") == 0 ? "&nbsp;".$szObjImg : ""));
			$t->set_var("LIBELLE_FULLTEXT_TYPEDOC", CST_TDOC_LIBELLE_TYPEDOC_FULLTEXT.(strcmp($cletri, "FULLTEXT_TYPEDOC") == 0 ? "&nbsp;".$szObjImg : ""));
			$t->set_var("LIBELLE_VISIBILITE_TYPEDOC", CST_TDOC_LIBELLE_VISIBILITE_TYPEDOC.(strcmp($cletri, "VISIBILITE_TYPEDOC") == 0 ? "&nbsp;".$szObjImg : ""));
			$t->set_var("LIBELLE_FICHE_PARAM_TYPEDOC", CST_TDOC_LIBELLE_FICHE_PARAM_TYPEDOC.(strcmp($cletri, "FICHE_PARAM_TYPEDOC") == 0 ? "&nbsp;".$szObjImg : ""));
			$t->set_var("LIBELLE_GESTION_VERSION_TYPEDOC", CST_TDOC_LIBELLE_GESTION_VERSION_TYPEDOC.(strcmp($cletri, "GESTION_VERSION_TYPEDOC") == 0 ? "&nbsp;".$szObjImg : ""));		
			$t->set_var("LIBELLE_SPOOL_TYPEDOC", CST_TDOC_LIBELLE_SPOOL_TYPEDOC.(strcmp($cletri, "SPOOL_TYPEDOC") == 0 ? "&nbsp;".$szObjImg : ""));
			$t->set_var("LIBELLE_RESTRICTION_ACCES_TYPEDOC", CST_TDOC_LIBELLE_RESTRICTION_ACCES_TYPEDOC.(strcmp($cletri, "RESTRICTION_ACCES_TYPEDOC") == 0 ? "&nbsp;".$szObjImg : ""));
			$t->set_var("LIBELLE_MODIFIER", CST_LIBELLE_MODIF);
			$t->set_var("LIBELLE_AJOUTER", CST_LIBELLE_AJOUTER);
			$t->set_var("LIBELLE_SUPPRIMER", CST_LIBELLE_SUPP);	 
			$t->set_var("DROIT_ADMINISTRATION", ($_SESSION["sess_droitAdministration"])?1:0);
			$t->set_var("MESSAGE_NO_ADMINISTRATION", CST_LIBELLE_NO_ADMINISTRATION);		
			$t->set_var("MESSAGE_SELECT_TYPEDOC", CST_TDOC_LIBELLE_SELECT_TYPEDOC);
			$t->set_var("MESSAGE_SUPP_TYPEDOC", CST_MESSAGE_LIBELLE_SUPPRIMER_TYPEDOC);
			$t->set_var("LIEN_ACTUALISATION", URL_LIST_TYPEDOC);
			$t->set_var("LIBELLE_FICHE_PARAMETREE", CST_TFIP_LIBELLE_FICHE_PARAMETREE);
			
		 	//print_r($tabLstDoc);
            $tabLigne = array();
			for($i=0; $i<count($tabLstDoc);$i++)
    		{
                $tabLigne[$i] = (object) array();
                $tabLigne[$i]->szTypeDoc = $tabLstDoc[$i]->szTypeDoc;
                $tabLigne[$i]->szNomTypeDoc = $tabLstDoc[$i]->szNomTypeDoc;
                $tabLigne[$i]->bThesaurus = $tabLstDoc[$i]->bThesaurus;
                $tabLigne[$i]->wTypeDos = $tabLstDoc[$i]->wTypeDos;
                $tabLigne[$i]->wHierarchie = $tabLstDoc[$i]->wHierarchie;
                $tabLigne[$i]->wFullTexte = $tabLstDoc[$i]->wFullTexte;
                $tabLigne[$i]->bInvisible = $tabLstDoc[$i]->bInvisible;
                $tabLigne[$i]->bFicheParam = $tabLstDoc[$i]->bFicheParam;
               
			    // Gestion des versions          	
                if ($tabLstDoc[$i]->stArchive->bArchiveSiModifIndex == 1 || $tabLstDoc[$i]->stArchive->bArchiveSiModifPage == 1)
                	$iGestVersions = 1;
                else 
                	$iGestVersions = 0;                	
                $tabLigne[$i]->wGestVersions = $iGestVersions;
                
                // Spool
                $tabLigne[$i]->bSpool = $tabLstDoc[$i]->bSpool;
				// Restriction d'accés				
				if($tabLstDoc[$i]->wTypeRubConsultIndex == 0 &&  $tabLstDoc[$i]->wTypeRubConsultFichiers == 0
					&& $tabLstDoc[$i]->wTypeRubModifIndex == 0	&& $tabLstDoc[$i]->wTypeRubModifFichiers == 0
					&& $tabLstDoc[$i]->wTypeRubSupprIndex == 0 &&  $tabLstDoc[$i]->szCodeRubSupprFichiers == 0
					&& strcmp($tabLstDoc[$i]->szQuestionRestriction, "") == 0)
					$iRestrictionAcces = 0;
				else 
					$iRestrictionAcces = 1;
				$tabLigne[$i]->wRestrictionAcces = $iRestrictionAcces;
			}
			
			// Tri
			$tabLigne = makeTriTypeDoc($cletri, $tabLigne);
			for ($i=0; $i<count($tabLigne); $i++)
			{
				$szInfoTYPEDOC = "POS_CODE_TYPEDOC=".urlencode(addslashes(trim($tabLigne[$i]->szTypeDoc)))."&POS_LIBELLE_TYPEDOC=".urlencode(addslashes(trim($tabLigne[$i]->szNomTypeDoc)))."&POS_BOOL_FICHE_PARAM=".trim($tabLigne[$i]->bFicheParam);
					
				$t->set_var("POS_INFO_TYPEDOC", $szInfoTYPEDOC);
				$t->set_var("POS_CODE_TYPEDOC",$tabLigne[$i]->szTypeDoc);
				$t->set_var("POS_LIBELLE_TYPEDOC", $tabLigne[$i]->szNomTypeDoc);
				$t->set_var("POS_THESAURUS_TYPEDOC", ($tabLigne[$i]->bThesaurus == 1) ? "X" : "");
				$t->set_var("POS_DOSSIER_TYPEDOC", ($tabLigne[$i]->wTypeDos >= 1) ? "X" : "");
				$t->set_var("POS_K_H_TYPEDOC", ($tabLigne[$i]->wHierarchie > 0) ? "X": "");
				$t->set_var("POS_FULLTEXT_TYPEDOC", ($tabLigne[$i]->wFullTexte == 1) ? "X": "" );
				$t->set_var("POS_VISIBILITE_TYPEDOC", ($tabLigne[$i]->bInvisible == 1) ? "X": "" );			
				$t->set_var("POS_FICHEPARAM_TYPEDOC", ($tabLigne[$i]->bFicheParam == 1) ? "X": "" );
				//$szInfoTYPEDOC .= "&MODE_FICHE_PARAM=".$szModeFicheParam;
				$t->set_var("POS_GESTION_VERSION_TYPEDOC", ($tabLigne[$i]->wGestVersions == 1) ? "X": "");
				$t->set_var("POS_SPOOL_TYPEDOC", ($tabLigne[$i]->bSpool == 1) ? "X": "" );
				$t->set_var("POS_RESTRICTION_ACCES_TYPEDOC", ($tabLigne[$i]->wRestrictionAcces == 1) ? "X": "");
				$t->set_var("PAIR_OU_IMPAIR", (($i % 2) == 0) ? "pair" : "impair");
								
				$t->parse("bloc_typedoc", "BLOC_TYPEDOC", true);
			}
			
			$t->pparse("MyOutput", "liste_typedoc");
		}
		else
			debug($jeton);
	}			
	pos_disconnect($jeton);

}
else
{
	debug($jeton);
	echec_connexion();
}
?>
