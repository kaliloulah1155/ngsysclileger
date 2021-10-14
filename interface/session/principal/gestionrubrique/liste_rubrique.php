<?php
/* 
 * Gestion des rubriques
 *
 * Patrick Legaigneur 16/05/2011
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

$tabTypeRubrique = array (
	"0" => CST_LIBELLE_TYPE_RUBRIQUE_ALPHA,
	"1" => CST_LIBELLE_TYPE_RUBRIQUE_ENTIER,
	"2" => CST_LIBELLE_TYPE_RUBRIQUE_DATE,
	"3" => CST_LIBELLE_TYPE_RUBRIQUE_TABLEAU,
	"4" => CST_LIBELLE_TYPE_RUBRIQUE_DECIMAL
);

function makeTriRubrique($szTri, $tabAffiche)
{
	$tabTmp=array();
	$tabTmpFinal=array();
	for($i=0; $i<count($tabAffiche); $i++)
	{
		if(strcmp($szTri,"CODE_RUBRIQUE")==0)
			$tabTmp[$i]=$tabAffiche[$i]->szRubrique;
		elseif(strcmp($szTri,"LIBELLE_RUBRIQUE")==0)
			$tabTmp[$i]=$tabAffiche[$i]->szNomRub;
		elseif(strcmp($szTri,"TYPE_RUBRIQUE")==0)
			$tabTmp[$i]=$tabAffiche[$i]->wTypeRub;
		elseif(strcmp($szTri,"NB_CAR_RUBRIQUE")==0)
			$tabTmp[$i]=$tabAffiche[$i]->wNbCharMot;
		elseif(strcmp($szTri,"VISIBILITE_RUBRIQUE")==0)
			$tabTmp[$i]=$tabAffiche[$i]->bInvisible;
		elseif(strcmp($szTri,"MONO_RUBRIQUE")==0)
			$tabTmp[$i]=$tabAffiche[$i]->bMonoCritere;
		elseif(strcmp($szTri,"CRITERE_SECONDAIRE_RUBRIQUE")==0)
			$tabTmp[$i]=$tabAffiche[$i]->bSecondaire;
		elseif(strcmp($szTri,"DOMFERME_RUBRIQUE")==0)
			$tabTmp[$i]=$tabAffiche[$i]->wDomFerme;
		elseif(strcmp($szTri,"CODE_THESAURUS_RUBRIQUE")==0)
			$tabTmp[$i]=$tabAffiche[$i]->szCodeThesaurus;
	}

	asort($tabTmp);
	// on reconstruit le tableau dans l'ordre.
	while (list($key, $val) = each($tabTmp))
	{
		$tabTmpFinal[]=$tabAffiche[$key];
	}
	
	return $tabTmpFinal;
}

//
$retour = connexion($jeton);

if ($retour)
{	
	if ($_SESSION["sess_droitAdministration"] == false)
	{	
		afficheMsg(CST_LIBELLE_NO_ADMINISTRATION);
	}
	else
	{
		// Requête de récupération des rubriques
		$retour = pos_getrubrique($jeton, "", /*pref*/$tabLstRub);
			
		if ($retour)
		{
			if(isset($_REQUEST['POS_TRI_COL']))
				{
					if(strcmp($_REQUEST['POS_TRI_COL'],"CODE_RUBRIQUE") != 0)
						$triprofil = 0;
					else 
						$triprofil = 1;
					
					$cletri = $_REQUEST['POS_TRI_COL'];
				}
			else
				{
					$triprofil = 0;
					$cletri = "CODE_RUBRIQUE";
				}
			$triOrdre="1"; // le tri inverse ne fonctionne pas
			$szObjImg = "<IMG SRC='".URL_SITE."/images/icons/tri_lr_$triOrdre.png' border=0 align=center>";
			
			// Affichage
			$t = new Template(".");	
			$t->set_File("rubrique", REP_TEMPLATE_APPLICATIF."gestionrubrique/liste_rubrique.tpl");	
			$t->set_var("TITRE_PAGE", CST_LIBELLE_TOOLBAR_GEST_RUBRIQUE);			
			$t->set_block("rubrique", "BLOC_RUBRIQUE", "bloc_rubrique");
						
			// affichage de l'icone indiquant la clé du tri
			$t->set_var("LIBELLE_CODE_RUBRIQUE", CST_LIBELLE_CODE_RUBRIQUE.(strcmp($cletri, "CODE_RUBRIQUE") == 0 ? "&nbsp;".$szObjImg : ""));
			$t->set_var("LIBELLE_LIBELLE_RUBRIQUE", CST_LIBELLE_LIBELLE_RUBRIQUE.(strcmp($cletri, "LIBELLE_RUBRIQUE") == 0 ? "&nbsp;".$szObjImg : ""));	
			$t->set_var("LIBELLE_TYPE_RUBRIQUE", CST_LIBELLE_TYPE_RUBRIQUE.(strcmp($cletri, "TYPE_RUBRIQUE") == 0 ? "&nbsp;".$szObjImg : ""));
			$t->set_var("LIBELLE_NB_CAR_RUBRIQUE", CST_LIBELLE_NB_CAR_RUBRIQUE.(strcmp($cletri, "NB_CAR_RUBRIQUE") == 0 ? "&nbsp;".$szObjImg : ""));
			$t->set_var("LIBELLE_VISIBILITE_RUBRIQUE", CST_LIBELLE_VISIBILITE_RUBRIQUE.(strcmp($cletri, "VISIBILITE_RUBRIQUE") == 0 ? "&nbsp;".$szObjImg : ""));
			$t->set_var("LIBELLE_MONO_RUBRIQUE", CST_LIBELLE_MONO_RUBRIQUE.(strcmp($cletri, "MONO_RUBRIQUE") == 0 ? "&nbsp;".$szObjImg : ""));
			$t->set_var("LIBELLE_CRITERE_SECONDAIRE_RUBRIQUE", CST_LIBELLE_CRITERE_SECONDAIRE_RUBRIQUE.(strcmp($cletri, "CRITERE_SECONDAIRE_RUBRIQUE") == 0 ? "&nbsp;".$szObjImg : ""));
			$t->set_var("LIBELLE_DOMFERME_RUBRIQUE", CST_LIBELLE_DOMFERME_RUBRIQUE.(strcmp($cletri, "DOMFERME_RUBRIQUE") == 0 ? "&nbsp;".$szObjImg : ""));
			$t->set_var("LIBELLE_CODE_THESAURUS_RUBRIQUE", CST_LIBELLE_CODE_THESAURUS_RUBRIQUE.(strcmp($cletri, "CODE_THESAURUS_RUBRIQUE") == 0 ? "&nbsp;".$szObjImg : ""));		
			$t->set_var("LIBELLE_MODIFIER", CST_LIBELLE_MODIF);
			$t->set_var("LIBELLE_AJOUTER", CST_LIBELLE_AJOUTER);
			$t->set_var("LIBELLE_SUPPRIMER", CST_LIBELLE_SUPP);	 
			$t->set_var("DROIT_ADMINISTRATION", ($_SESSION["sess_droitAdministration"])?1:0);
			$t->set_var("MESSAGE_NO_ADMINISTRATION", CST_LIBELLE_NO_ADMINISTRATION);		
			$t->set_var("MESSAGE_SELECT_RUBRIQUE", CST_LIBELLE_SELECT_RUBRIQUE);
			$t->set_var("MESSAGE_SUPP_RUBRIQUE", CST_MESSAGE_LIBELLE_SUPPRIMER_RUBRIQUE);
			$t->set_var("LIEN_ACTUALISATION", URL_LIST_RUBRIQUE);
			
		    $tabLigne = array();
			for($i=0; $i<count($tabLstRub);$i++)
    		{
                $tabLigne[$i] = (object) array();
                $tabLigne[$i]->szRubrique = $tabLstRub[$i]->szRubrique;
                $tabLigne[$i]->szNomRub = $tabLstRub[$i]->szNomRub;
                $tabLigne[$i]->wTypeRub = $tabLstRub[$i]->wTypeRub;
                $tabLigne[$i]->wNbCharMot = $tabLstRub[$i]->wNbCharMot;
                $tabLigne[$i]->bInvisible = $tabLstRub[$i]->bInvisible;
                $tabLigne[$i]->bMonoCritere = $tabLstRub[$i]->bMonoCritere;
                $tabLigne[$i]->bSecondaire = $tabLstRub[$i]->bSecondaire;
                $tabLigne[$i]->wDomFerme = $tabLstRub[$i]->wDomFerme;
                $tabLigne[$i]->wControleDomFerme = $tabLstRub[$i]->wControleDomFerme;
                $tabLigne[$i]->szCodeThesaurus = $tabLstRub[$i]->szCodeThesaurus;
				$tabLigne[$i]->bThesaurus = $tabLstRub[$i]->bThesaurus;			    
			}
			
			// Tri
			$tabLigne = makeTriRubrique($cletri, $tabLigne);
		
			for ($i=0; $i<count($tabLigne); $i++)
			{	
				$szInfoRubrique = "POS_CODE_RUBRIQUE=".urlencode(addslashes(trim($tabLigne[$i]->szRubrique)))."&POS_LIBELLE_RUBRIQUE=".urlencode(addslashes(trim($tabLigne[$i]->szNomRub)));
				$szInfoRubrique .= "&POS_TYPE_RUBRIQUE=".trim($tabLigne[$i]->wTypeRub);
					
				$t->set_var("POS_INFO_RUBRIQUE", $szInfoRubrique);
				$t->set_var("POS_CODE_RUBRIQUE",$tabLigne[$i]->szRubrique);
				$t->set_var("POS_LIBELLE_RUBRIQUE", $tabLigne[$i]->szNomRub);
				// type : 0:Alpha", 1:Entier, 2:Date, 3:Tableau, 4:Décimal
				$t->set_var("POS_TYPE_RUBRIQUE", $tabTypeRubrique[$tabLigne[$i]->wTypeRub]);
				$t->set_var("POS_NB_CAR_RUBRIQUE", $tabLigne[$i]->wNbCharMot);
				$t->set_var("POS_VISIBILITE_RUBRIQUE", ($tabLigne[$i]->bInvisible== 1) ? "X": "");
				$t->set_var("POS_MONO_RUBRIQUE", ($tabLigne[$i]->bMonoCritere == 1) ? "X": "" );
				$t->set_var("POS_CRITERE_SECONDAIRE_RUBRIQUE", ($tabLigne[$i]->bSecondaire == 1) ? "X": "" );
				
				//	Domaine fermé 0:Aucun, 1:Domaine fermé normal, 2:Liste des utilisateurs 
				$szDomFerme="";
				if($tabLigne[$i]->wDomFerme == 1 || $tabLigne[$i]->wDomFerme == 2)
					$szDomFerme="X";
				$t->set_var("POS_DOMFERME_RUBRIQUE", $szDomFerme);
				// Contrôle Domaine fermé 1:Vérification d'appartenance, 2:Aucun, 3:Vérification de non appartenance
				
				$t->set_var("POS_CODE_THESAURUS_RUBRIQUE", $tabLigne[$i]->szCodeThesaurus);
				$t->set_var("PAIR_OU_IMPAIR", (($i % 2) == 0) ? "pair" : "impair");				
				$t->parse("bloc_rubrique", "BLOC_RUBRIQUE", true);
			}
			
		
			
			$t->pparse("MyOutput", "rubrique");
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
