<?php
/*
 * DESCRIPTION : Affichage des questions posées durant la session 
 * AUTEUR: FLEURY Sébastien
 * DATE DE CREATION: 27/06/01
 * LISTE DE FONCTIONS: aucune
 * 
 * Gaby 29.11.2001 utilisation de template
 * Fred 24.12.2003 gestion de retour à la recherche par type de recherche
 */ 
 
include ("../include/locution.inc.php");
session_start();
include ("../include/question.inc.php");
include ("../include/connexion.inc.php");
include ("../include/template.inc.php");
include ("../include/debug.inc.php");
include ("../include/rappel_historique.inc.php");
include ("../../../../configuration_w/constantesPHP.conf.php");
include ("../../../../configuration/label_".$_SESSION["sess_langue"].".conf");
include ("../../../../configuration/url.conf.php");

$retour = connexion($jeton);

if ($retour)
{
	$t = new template(REP_TEMPLATE_APPLICATIF."question");
	$t->set_file("session", "session.tpl");
	$t->set_block("session", "QUESTIONS", "questions");
    $t->set_block("session", "NO_QUESTIONS", "no_questions");
    
	$t->set_var("POS_HIS_ENTETE", CST_LIBELLE_HIST_QUESTION);
	$t->set_var("LIBELLE_COMBINER", CST_LIBELLE_COMBINER_QUESTION);
	$t->set_var("MESSAGE_SELECT_QUESTION", CST_LIBELLE_MESS_SELECT_QUESTION);
    $t->set_var("TITRE_RECHERCHE", CST_LIBELLE_TOOLBAR_RECH_HIS_QUEST);
	$t->set_var("URL_COMBINER", URL_COMBINER_QUESTION);
	$t->set_var("URL_PARAM_COMBINER", URL_PARAM_COMBINER_QUESTION);
	
	if(count($_SESSION["sess_tabHistQuest"]) > 0 )
	{
		for ($a=0,$j=0; $a<count($_SESSION["sess_tabHistQuest"][0]); $a++)
		{
		    if($_SESSION["sess_tabHistQuest"][3][$a] != "RECHERCHE_PANIER" 
		        && $_SESSION["sess_tabHistQuest"][3][$a] != "RECHERCHE_BAL"
	        && $_SESSION["sess_tabHistQuest"][3][$a] != "RECHERCHE_HISTORIQUE"
				&& $_SESSION["sess_tabHistQuest"][3][$a] != "RECHERCHE_BIB")
	        {
	    		$t->set_var("PAIR_OU_IMPAIR", (($j % 2) == 0) ? "pair" : "impair");
                $t->set_var("POS_QST_LIEN_RAPPEL", URL_ATTENTE."?URL=".URL_RESULTAT."&INUMQUEST=$a");
                $t->set_var("POS_QST_NB_REP", $_SESSION["sess_tabHistQuest"][1][$a]);
                $t->set_var("POS_QST_HEURE", $_SESSION["sess_tabHistQuest"][2][$a]);
                $szCodeTypeDoc = $_SESSION["sess_tabHistQuest"][0][$a][0]->szCodeType;
                
                $linkHis = getLienHistorique($a, /*pref*/$bModif);
                
                $t->set_var("POS_QST_LIEN_MODIF", $linkHis);
                $t->set_var("INUMQUEST", $a);
                
                if($bModif == true)
                    $t->set_var("POS_IMG_MODIF", "<IMG SRC=\"".URL_SITE."/images/icons/modif_quest.gif\" border=0 title=\"".MODIFIER_QUESTION."\">");
                else
                    $t->set_var("POS_IMG_MODIF", "");
                
                if($_SESSION["sess_tabHistQuest"][3][$a] == "RECHERCHE_EXCALIBUR" || $_SESSION["sess_tabHistQuest"][3][$a] == "RECHERCHE_COMBINE")
                        $locutions = $_SESSION["sess_tabHistQuest"][4][$a];
                    else
                	    $locutions = affiche_locutions($jeton, 1, $a, $_SESSION["sess_tabLibTypeDoc"]);
                
                $t->set_var("POS_QST_DESCRIPTIF", $locutions);
                        
                // on traite le bloc
                $t->parse("questions", "QUESTIONS", true); 
	    	   
	    	   $j++;
	        }
		}
	}
	
	if ($j == 0) {
        $t->set_var("MESSAGE", AUCUNE_QUESTION_HISTO);
        $t->parse("no_questions", "NO_QUESTIONS", true);
    }
    else
        $t->set_var("no_questions", "");

	$t->pparse("Output", "session");
	pos_disconnect($jeton);
}
else
{
	debug($jeton);
	echec_connexion();
}
?>