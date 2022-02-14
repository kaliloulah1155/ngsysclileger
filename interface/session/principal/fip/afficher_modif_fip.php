<?php

if (!isset($_SESSION))
    session_start();
include ("../include/connexion.inc.php");
include ("../include/debug.inc.php");
include ("../include/template.inc.php");
include ("../../../../configuration_w/constantesPHP.conf.php");
include ("../../../../configuration/label_".$_SESSION["sess_langue"].".conf");
include ("../../../../configuration/label_admin_".$_SESSION["sess_langue"].".conf");
include ("../../../../configuration/url.conf.php");

//Array ( [0] => stdClass Object ( [wNumPage] => 0 [wTypeVal] => 100 [wX] => 206 [wY] => 94 [wDX] => 202 [wDY] => 20 [dwStyle] => 0 [dwCouleurFond] => 16777215 [dwCouleurTexte] => 0 [szLibelle] => PIN )
function cmpParamFip($a, $b)
{
    if ($a->wNumPage != $b->wNumPage)
        return ($a->wNumPage < $b->wNumPage) ? -1 : 1;
    else if ($a->wTypeVal != $b->wTypeVal)
        return ($a->wTypeVal < $b->wTypeVal) ? -1 : 1;
    else
        return ($a->szLibelle < $b->szLibelle) ? -1 : 1;
}

$retour = connexion($jeton);

if ($retour)
{ 
	if ($_SESSION["sess_droitAdministration"] == false)
	{	
		echo CST_LIBELLE_NO_ADMINISTRATION;
	}
	else
	{
			// Affichage
		$t = new Template(".");
	
		$t->set_File("fip", REP_TEMPLATE_APPLICATIF."fip/fip.tpl");
		$t->set_var("LIBELLE_VALIDER", CST_LIBELLE_VALIDER);
	    $t->set_var("LIBELLE_ANNULER", CST_LIBELLE_ANNULER);
		$t->set_var("URL_ATTENTE", URL_ATTENTE);
	    $t->set_var("CODE_ACTION", URL_MODIFIE_FIP);
	    $t->set_var("MODE_AFFICHE_FICHE_PARAM", $_REQUEST['MODE_AFFICHE_FICHE_PARAM']);
		$t->set_var("URL_ANNULER", URL_LIST_TYPEDOC);
        
        $tabDefine = get_defined_constants(true);
        $prefixLibelle = "CST_TFIP_";
        $lenPrefixLibelle = strlen($prefixLibelle);
        foreach($tabDefine['user'] as $code => $valeur)
        {
            if(strpos($code, $prefixLibelle) === 0)
            {
                $t->set_var(substr($code, $lenPrefixLibelle), $valeur);
            }
        }
		$t->set_var("LIBELLE_SUPP",CST_LIBELLE_SUPP);
				
		$t->set_block("fip", "BLOC_RUB_FIP", "bloc_rub_fip");
		$t->set_block("fip", "BLOC_REGROUP_FIP", "bloc_regroup_fip");
		$t->set_block("fip", "BLOC_ONGLET_FIP", "bloc_onglet_fip");
		$t->set_block("fip", "BLOC_LIBELLE_FIP", "bloc_libelle_fip");
		$t->set_block("fip", "BLOC_LISTEFICHIERS_FIP", "bloc_listefichiers_fip");
		$t->set_block("fip", "BLOC_CLE_H", "bloc_cle_h");
				
		$t->set_var("POS_CODE_TYPEDOC", $_REQUEST['POS_CODE_TYPEDOC']);
        
        $retour = pos_gettype($jeton, $_REQUEST['POS_CODE_TYPEDOC'], /*pref*/$tabLstDoc);
        $t->set_var("IS_CLEHIER", ($tabLstDoc[0]->wHierarchie > 0) ? "true" : "false");
        
		$tabToutesRubriques = array();
		$retour = pos_getrubriquetype($jeton, $_REQUEST['POS_CODE_TYPEDOC'], /*pref*/$tabRubriqueInType);
		if (!$retour)	
			debug($jeton);
            
        // besoin de savoir si les rub sont tableaux ou pas
        $tabLstRub = array();
        $retour = pos_getrubrique($jeton, "", /*pref*/$tabLstRub);
		
		if(strcmp($_REQUEST['MODE_AFFICHE_FICHE_PARAM'], "MODIFICATION") == 0)
		{
			// MODE MODIFICATION
			$tabParamFiche = array();
			$retour = pos_getparamindex($jeton, $_REQUEST['POS_CODE_TYPEDOC'], "", $tabParamFiche);
			usort($tabParamFiche, "cmpParamFip");
			//error_log(print_r($tabParamFiche, true));
	 	    if ($retour)
			{ 
				 $tabRubInFip = array();
				 $iCptObj = 0;
				 if (count($tabParamFiche) >0 )
				 {					 	
				 for($i=0;$i<count($tabParamFiche); $i++)
				 {
				 	// wTypeVal
				 	// 100 champ de rubrique
				 	// 101 la fiche paramétrée : wX=0 wY=0 et wDX et wDY proportionnels à la taille de la fiche dans ConfApps
				 	// 102 regroupement
                    // 103 clé hierarchique
                    // 104 tableau
				 	// 105 libelle de rubrique
				 	// 106 onglet
				 	// 109 gestion des fichiers
				 	
				 	
					// Champ rubrique normale ou tableau
					if($tabParamFiche[$i]->wTypeVal == 100 || $tabParamFiche[$i]->wTypeVal == 104)
					{							
						$keyCodeInFip = $tabParamFiche[$i]->szLibelle;
						// pour le cas où la rubrique est sur plusieurs onglets, on affiche la première
						// pas certain que ce soit celle du 1er onglet
						if (!array_key_exists($keyCodeInFip, $tabToutesRubriques))
						{
                            $tabToutesRubriques[$keyCodeInFip] = array();
    						$tabToutesRubriques[$keyCodeInFip]['NUM_ONGLET'] = $tabParamFiche[$i]->wNumPage;
    						$tabToutesRubriques[$keyCodeInFip]['wX'] =  $tabParamFiche[$i]->wX;
    						$tabToutesRubriques[$keyCodeInFip]['wY'] = $tabParamFiche[$i]->wY;
    						$tabToutesRubriques[$keyCodeInFip]['wDX'] = $tabParamFiche[$i]->wDX;
    						$tabToutesRubriques[$keyCodeInFip]['wDY'] = $tabParamFiche[$i]->wDY;
                            $tabToutesRubriques[$keyCodeInFip]['dwCouleurFond'] = $tabParamFiche[$i]->dwCouleurFond;
                            $tabToutesRubriques[$keyCodeInFip]['dwCouleurTexte'] = $tabParamFiche[$i]->dwCouleurTexte;
                            $tabToutesRubriques[$keyCodeInFip]['wTypeVal'] = $tabParamFiche[$i]->wTypeVal;
                        }
					}
					// regroupement
					else if($tabParamFiche[$i]->wTypeVal == 102)
					{	
						$t->set_var("LIBELLE", $tabParamFiche[$i]->szLibelle);
						majObjFipTemplate(/*pref*/$t, $tabParamFiche[$i]);
					
						// le code sert d'id dans le template. Hors le libellé peut contenir des espaces
						$t->set_var("CODE", "groupe_".$iCptObj++); 
						$t->parse("bloc_regroup_fip", "BLOC_REGROUP_FIP",true);
					
					}
					// cle hier
					else if($tabParamFiche[$i]->wTypeVal == 103)
					{	
						$t->set_var("LIBELLE", $tabParamFiche[$i]->szLibelle);
						majObjFipTemplate(/*pref*/$t, $tabParamFiche[$i]);
					
						// le code sert d'id dans le template. Hors le libellé peut contenir des espaces
						$t->set_var("CODE", "cle_".$iCptObj++); 
						$t->parse("bloc_cle_h", "BLOC_CLE_H",true);
					
					}
                    // libellé
					else if($tabParamFiche[$i]->wTypeVal == 105)
					{	
						$t->set_var("LIBELLE", addslashes($tabParamFiche[$i]->szLibelle));
                        majObjFipTemplate(/*pref*/$t, $tabParamFiche[$i]);
					
						$t->set_var("CODE", "libelle_".$iCptObj++); 
						$t->parse("bloc_libelle_fip", "BLOC_LIBELLE_FIP",true);
				
					}
					// gestion de fichier
					else if($tabParamFiche[$i]->wTypeVal == 109)
					{								
						$t->set_var("LIBELLE", CST_TFIP_LIBELLE_LISTEFICHIERS);
                        majObjFipTemplate(/*pref*/$t, $tabParamFiche[$i]);
					
						// le code sert d'id dans le template. Hors le libellé peut contenir des espaces
						$t->set_var("CODE", "listefichiers_".$iCptObj++); 
						$t->parse("bloc_listefichiers_fip", "BLOC_LISTEFICHIERS_FIP",true);
				
					}
						// onglet
					else if($tabParamFiche[$i]->wTypeVal == 106)
					{
						$t->set_var("LIBELLE_ONGLET", $tabParamFiche[$i]->szLibelle);
						$t->set_var("CPT_ONGLET", 	$tabParamFiche[$i]->wNumPage);
                        // recherche la couleur de l'onglet
                        $dwCouleurFond = 0;
						for($k=0;$k<count($tabParamFiche); $k++)
				        {
                            if($tabParamFiche[$k]->wTypeVal == 107 && 
                                    $tabParamFiche[$k]->wNumPage == $tabParamFiche[$i]->wNumPage){
                                $dwCouleurFond = $tabParamFiche[$k]->dwCouleurFond;
                                break;
                            }
                        }
                        $t->set_var("dwCouleurFond", $dwCouleurFond);
						$t->parse("bloc_onglet_fip", "BLOC_ONGLET_FIP",true);
					}
						// fiche paramétrée
					else if($tabParamFiche[$i]->wTypeVal == 101)
					{
						$t->set_var("FIP_WIDTH_WIN", $tabParamFiche[$i]->wDX);
						$t->set_var("FIP_HEIGHT_WIN", $tabParamFiche[$i]->wDY);
					}
				 }
				}
				else
				// Aprés une création de type de document et check de la coche "fiche personnalisée"
				 	// sans ouverture et enregistrement de celle ci
				{
					$t->set_var("LIBELLE_ONGLET", "0");
					$t->set_var("CPT_ONGLET", 	"0");				
					$t->parse("bloc_onglet_fip", "BLOC_ONGLET_FIP",true);
			
					$t->set_var("bloc_regroup_fip", "");
					
 					$t->set_var("FIP_WIDTH_WIN", 0);
					$t->set_var("FIP_HEIGHT_WIN", 0);
				}
				
				$t->set_var("CPT_INIT_OBJ", $iCptObj);
			}
			else
				debug($jeton);
		}
		else
		{
			$t->set_var("FIP_WIDTH_WIN", 0);
			$t->set_var("FIP_HEIGHT_WIN", 0);
			$t->set_var("LIBELLE_ONGLET", "0");
			$t->set_var("CPT_ONGLET", 	"0");
            $t->set_var("CPT_INIT_OBJ", "0");
			$t->parse("bloc_onglet_fip", "BLOC_ONGLET_FIP",true);
		}
		
        // complete la liste des rubriques avec toutes les rubriques qui ne sont pas présentes sur la FI
		for($i=0;$i<count($tabRubriqueInType); $i++)
		{
			if(strcmp($_REQUEST['MODE_AFFICHE_FICHE_PARAM'], "MODIFICATION") == 0 && isset($tabRubInFip)) 
				$ind = array_key_exists($tabRubriqueInType[$i]->szRubrique, $tabToutesRubriques);
			else
				$ind = false;
			
			$keyCodeInType = $tabRubriqueInType[$i]->szRubrique;	
			if ($ind === false)
			{				
				$tabToutesRubriques[$keyCodeInType] = array();
				$tabToutesRubriques[$keyCodeInType]['NUM_ONGLET'] = -1;
				$tabToutesRubriques[$keyCodeInType]['wX'] =  0;
				$tabToutesRubriques[$keyCodeInType]['wY'] = 0;
				$tabToutesRubriques[$keyCodeInType]['wDX'] = 0;
				$tabToutesRubriques[$keyCodeInType]['wDY'] = 0;
                $tabToutesRubriques[$keyCodeInType]['dwCouleurFond'] = 16777215;
                $tabToutesRubriques[$keyCodeInType]['dwCouleurTexte'] = 0;
                for($k=0;$k<count($tabLstRub);$k++)
                {
                    // rubrique tableau ?
                    if($tabLstRub[$k]->szRubrique == $keyCodeInType)
                    {
                        $tabToutesRubriques[$keyCodeInType]['wTypeVal'] = ($tabLstRub[$k]->szRubrique == 3) ? "104" : "100";
                        break;
                    }
                }
			}
			$tabToutesRubriques[$keyCodeInType]['LIBELLE'] = $tabRubriqueInType[$i]->szNomRub;
		}
		ksort($tabToutesRubriques);
		foreach($tabToutesRubriques as $key => $value)
		{
			$t->set_var("CODE", $key);
			$t->set_var("LIBELLE", $key." - ".$tabToutesRubriques[$key]['LIBELLE']);
			$t->set_var("NUM_ONGLET", $tabToutesRubriques[$key]['NUM_ONGLET']);
			$t->set_var("wX", $tabToutesRubriques[$key]['wX']);
			$t->set_var("wY", $tabToutesRubriques[$key]['wY']);
			$t->set_var("wDX", $tabToutesRubriques[$key]['wDX']);
			$t->set_var("wDY", $tabToutesRubriques[$key]['wDY']);
		    $t->set_var("dwCouleurFond", $tabToutesRubriques[$key]['dwCouleurFond']);
            $t->set_var("dwCouleurTexte", $tabToutesRubriques[$key]['dwCouleurTexte']);
            
            $t->set_var("IS_TABLEAU", ($tabToutesRubriques[$key]['wTypeVal'] == "100") ? "false" : "true");
			
			$t->parse("bloc_rub_fip", "BLOC_RUB_FIP",true);		
		}
			  
	  $t->pparse("MyOutput", "fip");
	}			
	pos_disconnect($jeton);

}
else
{
	debug($jeton);
	echec_connexion();
}

function majObjFipTemplate(&$t, $objParamFiche)
{
    $t->set_var("NUM_ONGLET", $objParamFiche->wNumPage);
	$t->set_var("wX", $objParamFiche->wX);
	$t->set_var("wY", $objParamFiche->wY);
	$t->set_var("wDX", $objParamFiche->wDX);
	$t->set_var("wDY", $objParamFiche->wDY);
    $t->set_var("dwCouleurFond", $objParamFiche->dwCouleurFond);
    $t->set_var("dwCouleurTexte", $objParamFiche->dwCouleurTexte);
}
?>
