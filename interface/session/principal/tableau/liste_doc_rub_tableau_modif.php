<?php
/*
 * DESCRIPTION : Module d'affichage des rub tableaux
 *
 * AUTEUR : Sebastien Costanzo
 * DATE de CREATION : 07/03/2003
 *
 * Donnees en entree : 
 * POS_VALEUR_TAB_RUB : numero informatique du document
 * POS_TYPEDOC_PERE : type du document
 * MODE : Consultation / Modification
 * POS_CODE_RUB : Code de la rub liée
 *
 * Modification : on ne récupère plus le droit de modification de la rubrique tableau
 *                pour déterminer si l'utilisateur a le droit de modifier, ajouter les documents
 *
 */
session_start();

include ("../include/connexion.inc.php");
include ("../include/template.inc.php");
include ("../include/debug.inc.php");
include ("../include/pos_dmdmodifdoc.inc.php");
include ("../../../../configuration_w/constantesPHP.conf.php");
include ("../../../../configuration/label_".$_SESSION["sess_langue"].".conf");
include ("../include/locution.inc.php");
include ("../include/liste_resumee.inc.php");
include ("../tableau/fonction_tableau.php");
include ("../include/get_infoparam.php");
include ("../../../../configuration/url.conf.php");

if(!isset($_REQUEST["POS_NUM_FICHE"])) 
    $_REQUEST["POS_NUM_FICHE"]=0;
	
$t = new Template(".");
$file_tpl = REP_TEMPLATE_APPLICATIF."tableau/modification_rub_tab.tpl";
$t->set_File("consultation", $file_tpl);

if(strlen($_REQUEST["POS_CODE_RUB"]) > 0)
{
    $szTypeDocPere = $_REQUEST["POS_TYPEDOC_PERE"];
    $szValeurRubTableau = $_REQUEST["POS_VALEUR_TAB_RUB"];
    
    $szMode = $_REQUEST["MODE"];
	$szCodeRubTableau = $_REQUEST["POS_CODE_RUB"];
	$szCodeTypeLie = "";
	$bDroitHermes = (isset($_REQUEST["HERM_DROITS"])) ? $_REQUEST["HERM_DROITS"] : "0";
	$retour = connexion($jeton);
	
	if($retour)
		$retour = pos_getinforubintype($jeton, $szTypeDocPere, "", 200, /*pref*/$tabRubInTypeAsso);
	
	if($retour)
	{
		// Parcourt toutes les rubriques du type pour trouver le paramétrage de szCodeRubTableau
		for ($j=0;$j<count($tabRubInTypeAsso);$j++)
		{
			if (strcmp($tabRubInTypeAsso[$j]->code, $szCodeRubTableau) == 0)
			{
				$szCodeTypeLie = $tabRubInTypeAsso[$j]->code_typelie;
				$szCodeRubLiee = $tabRubInTypeAsso[$j]->code_rubliee;
				//$bModifiable = $tabRubInTypeAsso[$j]->b_modifiable;
				break;
			}
		}
		if (strlen($szCodeTypeLie) != 0 && strlen($szCodeRubLiee) != 0)
		{
            $bDroitSuppression = 0;
		    if(strcmp($szMode, "MODIFICATION") == 0 )
		    {
                $iRetour = get_infotypecache($jeton, $szCodeTypeLie, /*pref*/$objInfoType, /*pref*/$tabStruKEYHbyTyp);
                $bDroitSuppression = ($objInfoType->wTypeRubSupprIndex == 1) ? 0 : 1;
            }
    	    
			if (strlen($szValeurRubTableau) != 0)
			{
				// Création de la locution.
				$tabLocAsso[0] = new Locution(1,$szCodeTypeLie,$szCodeRubLiee,"=",
								$szValeurRubTableau);

				// Récupération des réponses.
				$retour = pos_searchdoc($jeton,count($tabLocAsso),$tabLocAsso,
									/*pref*/$dwNbReponsesAsso, /*pref*/$dwAdrPremiereReponseAsso);
			}
			else
				$retour = true;
				
			$retour = pos_getinforubintype($jeton, $_REQUEST['POS_TYPEDOC'], "", 999, /*pref*/$tabRubInType);
			
			if($retour)
			{
				$t->set_block("consultation", "ENTETE", "entete");
				$t->set_block("consultation", "FORM_RUB", "form_rub");
				
				$t->set_block("consultation", "LR_REPONSE_MULTICRITERE", "lr_reponse_multicritere");
				$t->set_block("consultation", "LR_REPONSE_MONOCRITERE", "lr_reponse_monocritere");
				$t->set_block("consultation", "LR_REPONSE", "lr_reponse");
				$t->set_block("consultation", "LISTE_REPONSES", "liste_reponses");
				$t->set_var("NB_REPONSE", $dwNbReponsesAsso);
				$t->set_var("POS_VALEUR_TAB_RUB", $szValeurRubTableau);
				$t->set_var("MODE", $szMode);
				$t->set_var("POS_TYPEDOC_PERE", $szTypeDocPere);
				$t->set_var("CODE_RUB_TABLEAU", $szCodeRubTableau);
				$t->set_var("HERM_DROITS", $bDroitHermes);
				$t->set_var("POS_CODE_RUB_LIE", $szCodeRubLiee);
				$t->set_var("POS_VALEUR_RUB_LIE", $szValeurRubTableau);
				$t->set_var("POS_TYPEDOC", $szCodeTypeLie);
				$t->set_var("CST_LIBELLE_SUPP", CST_LIBELLE_SUPP);
                $t->set_var("CST_LIBELLE_AJOUTER", CST_LIBELLE_AJOUTER);
				
				$szProfilLR = "";
				$tabReponseLR = array();
				if(strlen($szValeurRubTableau) != 0 &&  $dwNbReponsesAsso != 0)
				{
					// recuperation de l'ensemble des listes resumees
					$retour = pos_getreponseslrd($jeton, $dwAdrPremiereReponseAsso, 
						$dwNbReponsesAsso, $dwNbReponsesAsso, 1, 1, /*pref*/$szProfilLR, /*pref*/$tabReponseLR);
                }
                else
                {
                    // on récupère le profil de la liste résumée
					// GET_CUSTOM_DEFAULT:8, GET_DEFAULT:9, INIT_CUSTOM_DEFAULT:10
					// INIT_DEFAULT        11, DEL_CUSTOM_DEFAULT  12, DEL_DEFAULT         13
					$szTypeService = 9;
					$retour = pos_gestassoplr($jeton, $szTypeService, $szCodeTypeLie, /*pref*/$szProfilLR);
					
					// creation d'un objet vide pour obtenir un comportement équivalent qu'il y ait des réponses ou pas.
					$tabReponseLR[0] = (object) array('numdoc' => '0', 'lr' => '');
                }
				if ($retour)
				{	
					// profil de la liste resumee
					$retour = afficheEntete($jeton, $szProfilLR, /*pref*/$t, /*pref*/$iNbCol, /*pref*/$tabZoneLR);
					$tabRubEnteteMono = array();
					$szListeCodeRub = "";
					for ($j=0; $j<$iNbCol; $j++)
					{
                        $isMono = true;
						$iRetour = pos_getinforub($jeton, $tabZoneLR[$j]->zone_code_rub_ref, /*pref*/$objInfoRub);

					   $tabRubEnteteMono[$tabZoneLR[$j]->zone_code_rub_ref] = $objInfoRub->b_monocritere;
					   $szListeCodeRub .= $tabZoneLR[$j]->zone_code_rub_ref.";";
					   $t->set_var("CODE_RUB", $tabZoneLR[$j]->zone_code_rub_ref);
					   $t->parse("form_rub", "FORM_RUB", true);
                    }
					
					if ($retour)
					{		
						$t->set_var("liste_reponses", "");
						$t->set_var("LISTE_CODE_RUB", $szListeCodeRub);
						$szListeNumDoc = "";
						for ($i=0; $i<count($tabReponseLR); $i++) 
						{
							$t->set_var("lr_reponse", "");
							$t->set_var("NUM_ELEMENT", $i);
							if (strlen($tabReponseLR[$i]->lr) > 0)
                                $champs = extraireChampsLR($tabReponseLR[$i]->lr, "\x02");
							else
							{
						        $champs = array();
						        for ($j=0; $j<$iNbCol; $j++)
						            $champs[$j] = ""; 
                            }
														
							for ($j=0; $j<$iNbCol; $j++)
							{
								$t->set_var("SIZE_CELL_LR", round($tabZoneLR[$j]->zone_largeur_col/7));
								$t->set_var("CODE_RUB", $tabZoneLR[$j]->zone_code_rub_ref);
								
								$szAlign = "left";
								switch($tabZoneLR[$j]->zone_align_col)
                        		{
                        			case 1 : $szAlign = "center";  break;
                        			case 2 : $szAlign = "left";    break;
                        			case 3 : $szAlign = "right";   break;
                        		}
								$t->set_var("ZONE_ALIGN_LR", $szAlign);
								
								if($tabRubEnteteMono[$tabZoneLR[$j]->zone_code_rub_ref] == 1)
								{
								    $t->set_var("ZONE_LR", $champs[$j]);
                                    $t->parse("lr_reponse_monocritere", "LR_REPONSE_MONOCRITERE", false);
                                    $t->set_var("lr_reponse_multicritere", "");
                                }
								else
								{
								    if ($tabReponseLR[$i]->numdoc != 0)
								        $iRetour = pos_getrubdoc($jeton, $tabReponseLR[$i]->numdoc, $tabZoneLR[$j]->zone_code_rub_ref, /*pref*/$szValeur);
								    else
								        $szValeur = "";
				                    $t->set_var("ZONE_LR", $szValeur);
                                    $t->parse("lr_reponse_multicritere", "LR_REPONSE_MULTICRITERE", false);
                                    $t->set_var("lr_reponse_monocritere", "");
                                }
                                
                                $t->parse("lr_reponse", "LR_REPONSE", true);
							}
							
							$szInfoLiee = "POS_NUM_DOC=".$tabReponseLR[$i]->numdoc."&POS_TYPEDOC=".$szCodeTypeLie."&POS_VALEUR_TAB_RUB=$szValeurRubTableau&POS_TYPEDOC_PERE=$szTypeDocPere&POS_CODE_RUB=".$szCodeRubTableau."&POS_CODE_RUB_LIE=".$szCodeRubLiee."&POS_VALEUR_RUB_LIE=".$szValeurRubTableau."&MODE_PRINCIPAL=".$szMode;
							$t->set_var("POS_INFO_DOC_LIE", $szInfoLiee);
							$t->set_var("POS_NUM_DOC", $tabReponseLR[$i]->numdoc);
							if ($tabReponseLR[$i]->numdoc != 0)
							{
						        $szListeNumDoc .= $tabReponseLR[$i]->numdoc.";";
                            }
							
                            $t->parse("liste_reponses", "LISTE_REPONSES", true);
						}
						$t->set_var("OLD_LISTE_NUM_DOC_LIGNE", $szListeNumDoc);
					}
				}
				else
					debug($jeton);
			} // retour possearchdoc OK
		}// lien multiple
		
		pos_disconnect($jeton);
	}
	else
		debug($jeton);

    //&& $bModifiable
	$t->set_var("POS_B_BLOQUE_MODIF", (strcmp($szMode,"MODIFICATION") == 0) ? "1" : "0");
	$t->set_var("MESSAGE_SUPP_DOC", CST_LIBELLE_SUPP_DOC);
	$t->set_var("LIBELLE_AJOUTER_AVEC_ENCHAINEMENT", CST_LIBELLE_AJOUTER_AVEC_ENCHAINEMENT);
	$t->set_var("LIBELLE_NB_LIGNE_RUB_TAB", CST_LIBELLE_NB_LIGNE_RUB_TAB);
	$t->set_var("POS_CODE_RUB", $_REQUEST["POS_CODE_RUB"]);

	$t->pparse("MyOutput", "consultation");
}

?>
