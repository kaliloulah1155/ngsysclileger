<?php
/*
 * DESCRIPTION : Affiche l'arborescence du dossier passer en paramètres.
 * 
 * AUTEUR : Sébastien COSTANZO
 * DATE de CREATION : 10/02/2004
 * 13/10/2017 Reprise suite utilisation nouvelle arborescence 
 *
 * Modification :
 */

include_once ("../include/bal.inc.php");
include ("../include/template.inc.php");
include ("../include/form_values.inc.php");
include ("../../../../configuration/url.conf.php");

function writeTemplateArborescence(&$t) {
    
    $t->set_block("arborescence", "PLAN_CLASSEMENT_LISTE_DOSSIER", "plan_classement_liste_dossier");
    $t->set_block("arborescence", "LIGNE_PLAN_CLASSEMENT_FERME", "ligne_plan_classement_ferme");
    $t->set_block("arborescence", "LIGNE_PLAN_CLASSEMENT_OUVERT", "ligne_plan_classement_ouvert");
    $t->set_block("arborescence", "PLAN_CLASSEMENT", "plan_classement");
    
    $t->set_block("arborescence", "BIBLIO_PUB", "biblio_pub");
    $t->set_block("arborescence", "BIBLIO_PRIV", "biblio_priv");
    $t->set_block("arborescence", "BAL", "bal");
    $t->set_block("arborescence", "BAL_IN_GROUP", "bal_in_group");
    $t->set_block("arborescence", "TITRE_GROUPE", "titre_groupe");
    $t->set_block("arborescence", "BAL_OU_GROUPE", "bal_ou_groupe");
    $t->set_block("arborescence", "DOSSIER_BAL", "dossier_bal");
    
    // attention, il faut le mettre à 1 car il y a deja un element 0 "en dur" dans le menu.
    $cptNumPlan = 1;
    for($i=0;$i<count($_SESSION["sess_tab_plan_classement"]);$i++)
    {
        afficherPlanClassement($_SESSION["sess_tab_plan_classement"][$i]["titre_plan"],
                            // le code de la question pour les plan fermé 
                            $_SESSION["sess_tab_plan_classement"][$i]["code_question_plan"], 
                            // le tableau des reponses
                            $_SESSION["sess_tab_rep_".$_SESSION["sess_tab_plan_classement"][$i]["code_plan"]], 
                            "plan_classement_liste_dossier", $cptNumPlan, 
                            $_SESSION["sess_tab_plan_classement"][$i]["open"], /*pref*/$t);
        $cptNumPlan++;
    }
    
    if(count($_SESSION["sess_tab_bal"]) > 0)
    {
        $t->set_var("CST_LIBELLE_DOSS_BAL", CST_LIBELLE_DOSS_BAL);
      	for($i=0;$i<count($_SESSION["sess_tab_bal"]);$i++)
		{
            if ($_SESSION["sess_tab_bal"][$i]->iType == TYPE_BAL)
            {
                $t->set_var("ICONE_GROUPE", (strlen($_SESSION["sess_tab_bal"][$i]->szIcone) == 0) ? "BalVide" : $_SESSION["sess_tab_bal"][$i]->szIcone);
                $t->set_var("STYLE_BAL", $_SESSION["sess_tab_bal"][$i]->szStyle);
           	
                // cas des bals : il peut y avoir des caracteres html, de plus les questions sont stockés sur le serveur,
                // peu de risque d'un code mal intentionne
               	$t->set_var("TITRE_DOSSIER", addslashes($_SESSION["sess_tab_bal"][$i]->szLibelle));
                $t->set_var("TITRE_DOSSIER_SSQUOTE_NOENT", $_SESSION["sess_tab_bal"][$i]->szCode);
                $t->parse("bal", "BAL", true);
            }
            else
            {
                $t->set_var("ICONE_GROUPE", (strlen($_SESSION["sess_tab_bal"][$i]->szIcone) == 0) ? "GroupBal" : $_SESSION["sess_tab_bal"][$i]->szIcone);
                $t->set_var("POS_BAL_TITRE_GROUPE", $_SESSION["sess_tab_bal"][$i]->szLibelleComment);
                $t->set_var("TITRE", addslashes($_SESSION["sess_tab_bal"][$i]->szLibelleComment));
        	    $t->set_var("bal_in_group", "");
        	    for($j=0;$j<count($_SESSION["sess_tab_bal"][$i]->tabListeFils);$j++)
                {
                    $t->set_var("ICONE_GROUPE", (strlen($_SESSION["sess_tab_bal"][$i]->tabListeFils[$j]->szIcone) == 0) ? "BalVide" : $_SESSION["sess_tab_bal"][$i]->tabListeFils[$j]->szIcone);
                    $t->set_var("STYLE_BAL", $_SESSION["sess_tab_bal"][$i]->tabListeFils[$j]->szStyle);
                    
                    // cas des bals : il peut y avoir des caracteres html, de plus les questions sont stockés sur le serveur,
                    // peu de risque d'un code mal intentionne
                    $t->set_var("TITRE_DOSSIER", addslashes($_SESSION["sess_tab_bal"][$i]->tabListeFils[$j]->szLibelle));
            		$t->set_var("TITRE_DOSSIER_SSQUOTE_NOENT", $_SESSION["sess_tab_bal"][$i]->tabListeFils[$j]->szCode);
                    $t->parse("bal_in_group", "BAL_IN_GROUP", true);
            	}
                $t->parse("bal_ou_groupe", "BAL_OU_GROUPE", true);
            }
        }//else listequestionsbal
        $t->parse("dossier_bal", "DOSSIER_BAL", false);
	}
    else
        $t->set_var("dossier_bal", "");

	
	// Recherche des BIB
    // indice pere à -1 pour pouvoir créer une entrée dans le menu.
    $t->set_var("CST_LIBELLE_DOSS_BIBLIOTHEQUE", CST_LIBELLE_DOSS_BIBLIOTHEQUE);
    $t->set_var("CST_LIBELLE_DOSS_BIBLIOTHEQUE_PUB", CST_LIBELLE_DOSS_BIBLIOTHEQUE_PUB);
    $t->set_var("CST_LIBELLE_DOSS_BIBLIOTHEQUE_PRIV", CST_LIBELLE_DOSS_BIBLIOTHEQUE_PRIV);
    $t->set_var("CST_LIBELLE_DOSS_QUESTION", CST_LIBELLE_DOSS_QUESTION);
    $t->set_var("CST_LIBELLE_DOSS_HISTORIQUE", CST_LIBELLE_DOSS_HISTORIQUE);
    for($i=0;$i<count($_SESSION["sess_tabQuestBibPub"]);$i++)
	{
		$t->set_var("TITRE_DOSSIER", htmlentities_currentcharset($_SESSION["sess_tabQuestBibPub"][$i], ENT_QUOTES));
        $t->set_var("TITRE_DOSSIER_SSQUOTE_NOENT", addcslashes($_SESSION["sess_tabQuestBibPub"][$i], '"'));
        $t->parse("biblio_pub", "BIBLIO_PUB", true);
  	}
	
	for($i=0;$i<count($_SESSION["sess_tabQuestBibPriv"]);$i++)
	{
        $t->set_var("TITRE_DOSSIER", htmlentities_currentcharset($_SESSION["sess_tabQuestBibPriv"][$i], ENT_QUOTES));
        $t->set_var("TITRE_DOSSIER_SSQUOTE_NOENT", addcslashes($_SESSION["sess_tabQuestBibPriv"][$i], '"'));
        $t->parse("biblio_priv", "BIBLIO_PRIV", true);
	}
}

function afficherPlanClassement($szTitrePlanClassement, $szTitreQuestion, $tabRepPlanClassement, $szNomBloc, $iCptNumPlan, $isOpen, &$tpl)
{
    $tpl->set_var("plan_classement_liste_dossier", "");
    $tpl->set_var("TITRE_PLAN_CLASSEMENT", $szTitrePlanClassement);
    $tpl->set_var("TITRE_QUESTION", $szTitreQuestion);
    if (!$isOpen)
    {
        $tpl->set_var("ligne_plan_classement_ouvert", "");
        $tpl->parse("ligne_plan_classement_ferme", "LIGNE_PLAN_CLASSEMENT_FERME", false);
    }
    else
    {
        // affichage du premier niveau de plan de classement
        for($i=0;$i<count($tabRepPlanClassement);$i++)
    	{
    	    $pos1 = strpos($tabRepPlanClassement[$i], ":");
    	    $iNumDossier = substr($tabRepPlanClassement[$i], 0, $pos1);
    	    $szNomDossier = substr($tabRepPlanClassement[$i], $pos1 + 1);
    	    $tpl->set_var("POS_NUM_DOS", $iNumDossier);
        	$tpl->set_var("TITRE_DOSSIER", htmlentities_currentcharset($szNomDossier, ENT_QUOTES));
            $tpl->set_var("TITRE_DOSSIER_SSQUOTE_NOENT", $szNomDossier);
            $tpl->parse("plan_classement_liste_dossier", "PLAN_CLASSEMENT_LISTE_DOSSIER", true);
    	}
        $tpl->set_var("ligne_plan_classement_ferme", "");
    	$tpl->parse("ligne_plan_classement_ouvert", "LIGNE_PLAN_CLASSEMENT_OUVERT", false);
    }
    // le bloc englobant permet d'analyser les plans 1 par 1 et de conserver l'ordre
    $tpl->parse("plan_classement", "PLAN_CLASSEMENT", true);
}
?>