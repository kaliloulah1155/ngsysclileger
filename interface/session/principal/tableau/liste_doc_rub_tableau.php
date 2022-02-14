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
include ("../include/json/JSON.php");
include ("../include/util_headers.php");
include ("../../../../configuration/url.conf.php");


header("Content-Type: text/html; charset=ISO-8859-1");    
writeHeadersNoCache();
$json = new Services_JSON();
$objRetour = array();
$objRetour["code_retour"] = 1;
$objRetour["msg_erreur"] = "";
$objRetour["contenu_tableau"] = "";

if(!isset($_REQUEST["POS_NUM_FICHE"])) 
    $_REQUEST["POS_NUM_FICHE"]=0;
	
$t = new Template(".");
$file_tpl = REP_TEMPLATE_APPLICATIF."tableau/consultation_rub_tab.tpl";
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
				$bModifiable = $tabRubInTypeAsso[$j]->b_modifiable;
				break;
			}
		}
		if (strlen($szCodeTypeLie) != 0 && strlen($szCodeRubLiee) != 0)
		{
            $bDroitSuppression = 0;
		    if(strcmp($szMode, "MODIFICATION") == 0  || strcmp($szMode, "CREATION") == 0)
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
			if($retour)
			{
				$t->set_block("consultation", "ENTETE", "entete");
				$t->set_block("consultation", "LR_REPONSE", "lr_reponse");
				$t->set_block("consultation", "LISTE_REPONSES", "liste_reponses");
				$t->set_var("NB_REPONSE", $dwNbReponsesAsso);
				if(strlen($szValeurRubTableau) != 0 &&  $dwNbReponsesAsso != 0)
				{
					$szProfilLR = "";
					$tabReponseLR = "";
					// recuperation de l'ensemble des listes resumees
					$retour = pos_getreponseslrd($jeton, $dwAdrPremiereReponseAsso, 
						$dwNbReponsesAsso, $dwNbReponsesAsso, 1, 1, /*pref*/$szProfilLR, /*pref*/$tabReponseLR);

					if ($retour)
					{	
						// profil de la liste resumee
						$retour = afficheEntete($jeton, $szProfilLR, /*pref*/$t, /*pref*/$iNbCol, /*pref*/$tabZoneLR);
						
						if ($retour)
						{		
							$t->set_var("liste_reponses", "");
							for ($i=0; $i<count($tabReponseLR); $i++) 
							{
								$t->set_var("lr_reponse", "");
								$champs = extraireChampsLR($tabReponseLR[$i]->lr, "\x02");
								for ($j=0; $j<count($champs); $j++)
								{
								    $szAlign = "left";
    								switch($tabZoneLR[$j]->zone_align_col)
                            		{
                            			case 1 : $szAlign = "center";  break;
                            			case 2 : $szAlign = "left";    break;
                            			case 3 : $szAlign = "right";   break;
                            		}
    								$t->set_var("ZONE_ALIGN_LR", $szAlign);
								
									if($champs[$j] != "")
									{
									    $t->set_var("ZONE_LR", str_replace("\n", "<br>", $champs[$j]));
										
										//if(strlen($champs[$j]) > 40)
										//	$t->set_var("ZONE_LR", substr($champs[$j],0,36)." ...");
										//else
										//	$t->set_var("ZONE_LR", $champs[$j]);
									}
									else
										$t->set_var("ZONE_LR", "&nbsp;");
									
									$t->parse("lr_reponse", "LR_REPONSE", true);
								}
								
								$szInfoLiee = "POS_NUM_DOC=".$tabReponseLR[$i]->numdoc."&POS_TYPEDOC=".$szCodeTypeLie."&POS_VALEUR_TAB_RUB=$szValeurRubTableau&POS_TYPEDOC_PERE=$szTypeDocPere&POS_CODE_RUB=".$szCodeRubTableau."&POS_CODE_RUB_LIE=".$szCodeRubLiee."&POS_VALEUR_RUB_LIE=".$szValeurRubTableau."&MODE_PRINCIPAL=".$szMode;
								$t->set_var("POS_INFO_DOC_LIE", $szInfoLiee);
								$t->set_var("POS_NUM_DOC", $tabReponseLR[$i]->numdoc);
								
								getListeAction(/*pref*/$t, $i, $szMode, $szCodeTypeLie, $szInfoLiee, $szCodeRubTableau, false, 
                                        $bDroitSuppression, $bDroitHermes, $bModifiable);
								$t->parse("liste_reponses", "LISTE_REPONSES", true);
							}
						}
					}
					else
						debug($jeton);
				} // au moins une reponse
				else
				{
					// on récupère le profil de la liste résumée
					// GET_CUSTOM_DEFAULT:8, GET_DEFAULT:9, INIT_CUSTOM_DEFAULT:10
					// INIT_DEFAULT        11, DEL_CUSTOM_DEFAULT  12, DEL_DEFAULT         13
					$szTypeService = 9;
					$retour = pos_gestassoplr($jeton, $szTypeService, $szCodeTypeLie, /*pref*/$szProfilLR);
					if(!$retour)
						debug($jeton);
					if (strlen($szProfilLR) > 0)
					 	$retour = afficheEntete($jeton, $szProfilLR, /*pref*/$t, /*pref*/$iNbCol, /*pref*/$tabZoneLR);
					
					//creation d'une ligne vide
					$t->set_var("lr_reponse", "");
					for ($j=0; $j<$iNbCol; $j++)
					{
						$t->set_var("ZONE_LR", "&nbsp;");
						$t->parse("lr_reponse", "LR_REPONSE", true);
					}
					$szInfoLiee = "POS_TYPEDOC=".$szCodeTypeLie."&POS_VALEUR_TAB_RUB=$szValeurRubTableau&POS_TYPEDOC_PERE=$szTypeDocPere&POS_CODE_RUB=".$szCodeRubTableau."&POS_CODE_RUB_LIE=".$szCodeRubLiee."&POS_VALEUR_RUB_LIE=".$szValeurRubTableau."&MODE_PRINCIPAL=".$szMode;
					$t->set_var("POS_INFO_DOC_LIE", $szInfoLiee);
					getListeAction(/*pref*/$t, 0, $szMode, $szCodeTypeLie, $szInfoLiee, $szCodeRubTableau, true, 0, 
                                            $bDroitHermes, $bModifiable);
					$t->parse("liste_reponses", "LISTE_REPONSES", true);
							
//sitems[i]="{LIBELLE_AJOUTER_AVEC_ENCHAINEMENT}";
//sitemlinks[i++]="onCreerEnchaine()";
				}
			} // retour possearchdoc OK
		}// lien multiple
		
		pos_disconnect($jeton);
	}
	else
		debug($jeton);

    //&& $bModifiable
	$t->set_var("POS_B_BLOQUE_MODIF", (strcmp($szMode,"MODIFICATION") == 0  || strcmp($szMode, "CREATION") == 0) ? "1" : "0");
	$t->set_var("MESSAGE_SUPP_DOC", CST_LIBELLE_SUPP_DOC);
	$t->set_var("LIBELLE_AJOUTER_AVEC_ENCHAINEMENT", CST_LIBELLE_AJOUTER_AVEC_ENCHAINEMENT);
	$t->set_var("LIBELLE_NB_LIGNE_RUB_TAB", CST_LIBELLE_NB_LIGNE_RUB_TAB);
	$t->set_var("POS_CODE_RUB", $_REQUEST["POS_CODE_RUB"]);

    $t->parse("MyOutput", "consultation");
    $objRetour["contenu_tableau"] = $t->get("MyOutput");
    
    $output = $json->encode($objRetour);
    print($output);
}
	
function getListeAction($t, $numelement, $szMode, $szCodeTypeLie, $szInfoLiee, 
        $szCodeRubTableau, $isLigneVide, $bDroitSuppression, $bDroitHermes, $bModifiable)
{
   $t->set_var("INFO_LIEE", $szInfoLiee);
   $t->set_var("CODE_RUB_TABLEAU", $szCodeRubTableau);
   $t->set_var("NUM_ELEMENT", $numelement);
   
   $t->set_var("CST_LIBELLE_CONSULT", CST_LIBELLE_CONSULT);
   $t->set_var("CST_LIBELLE_MODIF", CST_LIBELLE_MODIF);
   $t->set_var("CST_LIBELLE_SUPP", CST_LIBELLE_SUPP);
   $t->set_var("CST_LIBELLE_AJOUTER", CST_LIBELLE_AJOUTER);
   
   if ((stristr($_SESSION["sess_liste_doc_indexables"], $szCodeTypeLie.";") == FALSE && 
    				strlen($_SESSION["sess_liste_doc_indexables"]) > 1))
        $bDroitsCreer = 0;
    else
        $bDroitsCreer = 1;
    
   $t->set_var("DROIT_CRE", $bDroitsCreer);
   $t->set_var("DROIT_SUP", $bDroitSuppression);
   $t->set_var("DROIT_MODIF", "1");
   $t->set_var("HERM_DROITS", $bDroitHermes);
   

	if ($isLigneVide) 
	{	
	   $t->set_var("DISPLAY_CONSULTER", "none");
	   $t->set_var("DISPLAY_MODIFIER", "none");
	   $t->set_var("DISPLAY_SUPPRIMER", "none");
	}
	else
	{
	   $t->set_var("DISPLAY_CONSULTER", "");
	   
		if(strcmp($szMode, "MODIFICATION") == 0 || strcmp($szMode, "CREATION") == 0) //&& $bModifiable
		{
    	   $t->set_var("DISPLAY_MODIFIER", ($bDroitHermes == 1  || strcmp($szMode, "CREATION") == 0 /*|| $bModifiable == 1*/) ? "" : "none");
    	   $t->set_var("DISPLAY_SUPPRIMER", ($bDroitSuppression == 1 && ($bDroitHermes == 1 /*|| $bModifiable == 1*/)) ? "" : "none");
 		}
 		else
 		{
 		     $t->set_var("DISPLAY_MODIFIER", "none");
 		     $t->set_var("DISPLAY_SUPPRIMER", "none");
		}
	}
	
	if(strcmp($szMode, "MODIFICATION") == 0  || strcmp($szMode, "CREATION") == 0)
        $t->set_var("DISPLAY_CREER", ($bDroitsCreer == 1 && ($bDroitHermes == 1 || strcmp($szMode, "CREATION") == 0/*|| $bModifiable == 1*/)) ? "" : "none");
    else
        $t->set_var("DISPLAY_CREER", "none");
}

?>