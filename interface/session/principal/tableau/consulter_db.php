<?php
/*
 * DESCRIPTION : Module de consultation/modification d'une ligne des rub tableaux
 *
 * AUTEUR : Sebastien Costanzo
 * DATE de CREATION : 07/03/2003
 *
 * Donnees en entree : 
 * Données du document principal :
 * POS_VALEUR_TAB_RUB : valeur de la rubrique
 * POS_TYPEDOC_PERE : type du document
 * POS_CODE_RUB : Code de la rub liée
 *
 * Données du nouveau document :
 * POS_TYPEDOC : Type du document
 * POS_CODE_RUB_LIE : Code de la rub liée (rub numérique)
 * POS_VALEUR_RUB_LIE : Valeur de la rub liée 
 * POS_NUM_DOC : Numero du doc 
 *
 * MODE : Modification / consultation
 * Si MODE = CONSULTATION -> bBloqueModif pour placer ou non le bouton de passage 
 * en modification (soit rub non modifiable, soit fiche principale en consultation)
 *
 */
define("SEPARATEUR", "###");	
session_start();
include ("../include/connexion.inc.php");
include ("../include/template.inc.php");
include ("../include/debug.inc.php");
include ("../include/pos_dmdmodifdoc.inc.php");
include ("../include/get_template.inc.php");
include ("../include/form_values.inc.php");
include ("../../../../configuration_w/constantesPHP.conf.php");
include ("../../../../configuration/label_".$_SESSION["sess_langue"].".conf");
include ("../../../../configuration/url.conf.php");
include ("../tableau/fonction_tableau.php");

// Si il n'y a pas de numero de document, on ne fait rien.

if (!isset($_REQUEST["POS_NUM_DOC"]) || $_REQUEST["POS_NUM_DOC"] <= 0)
{
	afficheMsg(CST_LIBELLE_CONSULTER_NUM_INIT); 
}
else
{
    $iNumDoc = $_REQUEST["POS_NUM_DOC"];
    $szTypeDoc = $_REQUEST["POS_TYPEDOC"];
	$retour = connexion($jeton);
	if ($retour)
	{	
		// si on n'a pas la variable MODE on la fixe en consultation
		if(!isset($_REQUEST["MODE"]) || strlen($_REQUEST["MODE"]) == 0) 
            $_REQUEST["MODE"] = "CONSULTATION";
		if(!isset($_REQUEST["POS_NUM_FICHE"])) 
            $_REQUEST["POS_NUM_FICHE"]=0;

		// Nom du template.
		$retour_file = get_file_tpl("CONSULTATION", $szTypeDoc, $_REQUEST["POS_NUM_FICHE"], /*pref*/$file_tpl);
		if (!file_exists($file_tpl))
		{
			afficheMsg(CST_LIBELLE_CONSULTER_RECHERCHE_EXIST);
			pos_disconnect($jeton);
			exit;
		}
		
		$retour = pos_getallindexdoc($jeton, $iNumDoc, /*pref*/$codevalrub);
				
		// filtre des caracteres speciaux a html
		while (list($key, $val) = each($codevalrub))
			$codevalrub[$key] = htmlspecialchars_currentcharset($val);
	    
	    // reaffichage des valeurs saisies
	    if (isset($_REQUEST["POS_REAFFICHAGE"]))
	    {
	    	$codevalrubReaffichage = get_form_values_with_prefix("POS_VAL_RUB_", true);
	    }
	}
	else
	{
		debug($jeton);
		echec_connexion();
	}

	// ------------------------------------------------
	//         DEBUT AFFICHAGE
	// ------------------------------------------------

	// lien pour la gestion du passage en modif.
	$szCodeActionModifier = "'window.location.href=\"".URL_CONSULTER_TABLEAU."?";
	$szCodeActionModifier.= "POS_VALEUR_TAB_RUB=".$_REQUEST["POS_VALEUR_TAB_RUB"]."&MODE=MODIFICATION&MODE_PRINCIPAL=".$_REQUEST["MODE_PRINCIPAL"];
	$szCodeActionModifier.= "&POS_NUM_DOC=$iNumDoc";
	$szCodeActionModifier.= "&POS_TYPEDOC=$szTypeDoc&POS_CODE_RUB=".$_REQUEST["POS_CODE_RUB"];
	$szCodeActionModifier.= "&POS_TYPEDOC_PERE=".$_REQUEST["POS_TYPEDOC_PERE"]."&POS_NUM_FICHE=".$_REQUEST["POS_NUM_FICHE"]."\"'";

    $szDroitHermes = "0";
	if ((isset($_REQUEST["HERM_DROITS"]) != null && strcmp($_REQUEST["HERM_DROITS"], "1") == 0) ||
					strcmp($_REQUEST["MODE"], "MODIFICATION") == 0)
        $szDroitHermes = "1";

	// lien pour la fermeture de la page.
	$szCodeActionFermer = scriptListeTableau($_REQUEST["POS_TYPEDOC_PERE"], $_REQUEST["POS_VALEUR_TAB_RUB"], 
                        $_REQUEST["MODE_PRINCIPAL"], $_REQUEST["POS_CODE_RUB"], $szDroitHermes, false);
	if ($retour)
	{
		$t = new Template(".");
        $file_entete_tpl =  REP_TEMPLATE_APPLICATIF."consultation/entete_tableau.tpl";
        $t->set_file(array("consultation"=>$file_tpl, "entete"=>$file_entete_tpl));
        $t->set_block("entete", "POS_LISTE_ACTIONS_HERMES", "liste_actions");
		$t->set_block("entete", "BLOC_HERMES", "bloc_hermes");
        $t->set_block("entete", "BLOC_MODIFICATION_HERMES", "bloc_modification_hermes");
		
        $t->set_var("POS_TYPEDOC", $szTypeDoc);
		$t->set_var("POS_VALEUR_TAB_RUB", $_REQUEST["POS_VALEUR_TAB_RUB"]);
		$t->set_var("POS_TYPEDOC_PERE", $_REQUEST["POS_TYPEDOC_PERE"]);
		$t->set_var("POS_NUM_DOC", $iNumDoc);
		$t->set_var("POS_CODE_RUB", $_REQUEST["POS_CODE_RUB"]);
		$t->set_var("POS_NUM_FICHE", $_REQUEST["POS_NUM_FICHE"]);

		$t->set_var("MODE", $_REQUEST["MODE"]);
		$t->set_var("MODE_PRINCIPAL", $_REQUEST["MODE_PRINCIPAL"]);
		
		$t->set_var("URL_ATTENTE", URL_ATTENTE);
		
		$t->set_var("VOCABULAIRE", CST_LIBELLE_VOCABULAIRE);
		
		//Pour griser les champs en consultation
		if(strcmp($_REQUEST["MODE"], "CONSULTATION") == 0 )
			$t->set_var("GRISE_CHAMP", "desactive_saisie_rubriques(\"TOUTES\");");
        else
            $t->set_var("GRISE_CHAMP", "");
		
		// definition des blocs
		$t->set_block("entete", "BLOC_OLD_VALUE", "bloc_old_value");
		$t->set_block("entete", "BLOC_CONSULTATION", "bloc_consultation");
		$t->set_block("entete", "BLOC_SUBMIT", "bloc_submit");
		
		$t->set_var("LIBELLE_MODIFICATION", CST_LIBELLE_PASSAGE_EN_MODIF);
		$t->set_var("LIBELLE_FERMER", CST_LIBELLE_FERMER);
		
		$t->set_var("CODE_ACTION_MODIFIER", $szCodeActionModifier);
		$t->set_var("CODE_ACTION_FERMER", $szCodeActionFermer);
        $t->set_var("URL_ATTENTE", URL_ATTENTE);
		$t->set_var("TITRE_ENTETE_PAGE", CST_LIBELLE_TITRE_TPL_CONSULTATION.$_SESSION["sess_tabLibTypeDoc"][$_REQUEST['POS_TYPEDOC']]." - ".$iNumDoc);
        $t->set_var("TITRE_FENETRE", CST_LIBELLE_TITRE_TPL_CONSULTATION.$_SESSION["sess_tabLibTypeDoc"][$_REQUEST['POS_TYPEDOC']]." - ".$iNumDoc);
		
		reset($codevalrub);
		while (list($key, $val) = each($codevalrub))
		{
		    if (!isset($_REQUEST["POS_REAFFICHAGE"]))
  	   		$t->set_var("POS_VAL_RUB_$key", $val);
	
			$t->set_var("NAME_OLD_RUB", "POS_OLD_VAL_RUB_".$key);
			$t->set_var("VALUE_OLD_RUB", $val);
			$t->parse("bloc_old_value", "BLOC_OLD_VALUE", true);
		}
		
    	// reaffichage des valeurs saisies
    	if (isset($_REQUEST["POS_REAFFICHAGE"]))
    	{
    	    reset($codevalrubReaffichage);
    	    while (list($key, $val) = each($codevalrubReaffichage))
    	 	{
    			$val = htmlentities_currentcharset($val,ENT_QUOTES);
    			$t->set_var("POS_VAL_RUB_".$key, $val);
    		}
    	}
		
		// mode consultation 
		if ($_REQUEST["MODE"] == "CONSULTATION")
		{
			// Si on est en consultation on fait afficher le bouton imprimer sur le submit
			// mais on lui rajoute une fct sur le onClick qui va gerer l'impression puis
			// on consomme l'evenement submit par le return false.
			$szLibelleAction = "\"".CST_LIBELLE_IMPRIMER."\" onClick='window.location.href=";
			$szLibelleAction.= URL_IMPRIMER_INDEX;
			$szLibelleAction.= "?POS_TYPEDOC=$szTypeDoc&POS_NUM_DOC=$iNumDoc\";return false;'";

			$t->set_var("LIBELLE_ACTION", $szLibelleAction);
			
			// Affichage du passage en mode modification si les droits st OK.
			if($_REQUEST["bBloqueModif"])
				$t->set_var("bloc_consultation", "");
			else
				$t->parse("bloc_consultation", "BLOC_CONSULTATION");
				
			$t->set_var("bloc_submit", "");
		}
		else if ($_REQUEST["MODE"] == "MODIFICATION")
		{
			$t->set_var("bloc_consultation", "");
			// modifier
			$t->set_var("LIBELLE_ACTION", CST_LIBELLE_ENREGISTRER);
			$t->set_var("CODE_ACTION", URL_MODIFIER_TABLEAU);
            
            $retour = pos_hermes_rempliraction($jeton, $_REQUEST["POS_NUM_DOC"], /*pref*/$tabActionHermes);

			$tabActionHermesAff = array();
			for ($i=0;$i<count($tabActionHermes); $i++)
			{
				if ($tabActionHermes[$i]->action_code[0] != 'X')
					$tabActionHermesAff[] = $tabActionHermes[$i];
			}
				
			if (count($tabActionHermesAff) > 0)
			{
				$t->set_var("LIBELLE_ACTION_HERMES", CST_LIBELLE_ACTION);
				asort($tabActionHermesAff);
					
				for ($i=0;$i<count($tabActionHermesAff); $i++)
				{
					// Rubriques à desactiver.
					if ($tabActionHermesAff[$i]->nb_rub_non_modif > 0)
					{
						$rub_non_modif="(";
						for($j=0;$j<$tabActionHermesAff[$i]->nb_rub_non_modif;$j++)
						{
							$cle = "codeRub_".$j;
							$rub_non_modif.="'".$tabActionHermesAff[$i]->$cle."',";
						}
						// On supprime la dernière virgule.
						$rub_non_modif=substr ($rub_non_modif, 0, strlen($rub_non_modif)-1);
						$rub_non_modif.=")";
					}
					else
						$rub_non_modif = "('AUCUNE')";
	
					// Construction du CODE_ACTION_HERMES.SEPARATEUR.RUB_NON_MODIF
					$sCodeActionHermes=$tabActionHermesAff[$i]->action_code;
					$sCodeActionHermes.=SEPARATEUR;
					$sCodeActionHermes.="desactive_saisie_rubriques";
					$sCodeActionHermes.=$rub_non_modif;
					
					$t->set_var("POS_CODE_ACTION_HERMES", $sCodeActionHermes);
					$t->set_var("POS_LIBELLE_ACTION_HERMES", $tabActionHermesAff[$i]->action_libelle);

					if(isset($_REQUEST["POS_ACTION_HERMES"]))
					{ 
					    // Séparation du CODE_ACTION du SEPARATEUR.CODE_RUB_NON_MODIF
					    // si on ne passe par le boutons enregistrer
					    if(strpos($_REQUEST["POS_ACTION_HERMES"], "###") !== false)
					    {
    					    $tabActionHermes = explode("###", $_REQUEST["POS_ACTION_HERMES"]);
    					    $sActionHermes = $tabActionHermes[0];
    					}
    					
					    if(strcmp($sActionHermes, $tabActionHermesAff[$i]->action_code) == 0)
                            $t->set_var("SELECTED_ACTION_HERMES", "selected");
                        else
                            $t->set_var("SELECTED_ACTION_HERMES", "");
				    }
				    else
				        $t->set_var("SELECTED_ACTION_HERMES", "");

					$t->parse("liste_actions", "POS_LISTE_ACTIONS_HERMES", true);
				}
				$t->parse("bloc_hermes", "BLOC_HERMES");
			}
			else
			     $t->set_var("bloc_hermes", "");
            $t->parse("bloc_modification_hermes", "BLOC_MODIFICATION_HERMES");
			
            $t->parse("bloc_submit", "BLOC_SUBMIT");
		}
		$t->parse("ENTETE", "entete", false);
		$t->pparse("MyOutput", "consultation");
	}
	else
	{
		debug($jeton);
	}
	pos_disconnect($jeton);
}
?>
