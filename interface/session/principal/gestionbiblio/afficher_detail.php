<?php
/*
* DESCRIPTION : Gestion des questions de la bibliothèque
* 
* AUTEUR: Sébastien Costanzo
*
* DATE DE CREATION: 18.06.03
*
* 21.01.2008 PL les variables issues de GET et POST sont recuperees par $_REQUEST
*/ 
session_start();
include ("../include/locution.inc.php");
include ("../include/question.inc.php");
include ("../include/connexion.inc.php");
include ("../include/template.inc.php");
include ("../include/debug.inc.php");
include ("../include/form_values.inc.php");
include ("../include/libelle_operateur.inc.php");
include ("../../../../configuration_w/constantesPHP.conf.php");
include ("../../../../configuration/label_".$_SESSION["sess_langue"].".conf");
include ("../../../../configuration/url.conf.php");

function get_libelle_parenthese_deb($nbpar_deb)
{
	$szChaine = "";
	for($i=1;$i<=$nbpar_deb;$i++)
	{
		$szChaine .= "(";
	}
	
	return $szChaine;
}

function get_libelle_parenthese_fin($nbpar_fin)
{
	$szChaine = "";
	for($i=1;$i<=$nbpar_fin;$i++)
	{
		$szChaine .= ")";
	}
	
	return $szChaine;
}

function get_libelle_lien($lien)
{
	switch($lien)
	{
		case 1:
			return CST_LIBELLE_LIEN_OU;
		
		case 2:
			return CST_LIBELLE_LIEN_ET;
		
		case 3:
			return CST_LIBELLE_LIEN_SAUF;
        
        default:
            return CST_LIBELLE_LIEN_ET;
	}
}

function get_libelle_lie($b_lier)
{
	if($b_lier)
		return "Oui";
	else
		return "";
}

function get_thesaurus($code,$profondeur)
{
    if($code != 0)
    {
        switch($code)
        {
            case 0 : $szChaine = ""; break; 
            case 1 : $szChaine = "P"; break; 
            case 2 : $szChaine = "F"; break; 
            case 4 : $szChaine = "TA"; break; 
            case 10: $szChaine = "S"; break; 
            case 11: $szChaine = "S-P"; break; 
            case 12: $szChaine = "S-F"; break; 
            case 14: $szChaine = "S-TA"; break; 
            default: $szChaine = ""; break;    
        }
        
        $szChaine .= ($profondeur > 0)? "-".$profondeur : "";
        
        return $szChaine;
    }
    else
        return "";
}

//connexion à poseidon
$retour = connexion($jeton);
if ($retour)
{
    //on récupère les locutions de la questions de la bib
    $retour = pos_bib_getlocutionsquest($jeton, stripslashes(urldecode($_REQUEST['POS_QUEST_NOM'])), $_REQUEST['POS_QUEST_PUBLIC'], /*pref*/$tabLocBib);
    if (!$retour)
    	debug($jeton);
    else
    {
		$retour = pos_getlistallrubrmc($jeton, /*pref*/$tabLibRub);
		if (!$retour)
    		debug($jeton);

		$retour = pos_getlistalltypes($jeton, /*pref*/$tabLstTypTous);
		
		$tabLstTypTous["000"] = CST_LIBELLE_TOUS_TYPES;
		
		if (!$retour)
    		debug($jeton);
    	
		// on definit le template utilisé  
		$t = new template(REP_TEMPLATE_APPLICATIF."bibliotheque");
		$t->set_file("bib", "detail_question_bib.tpl");
		
		$t->set_block("bib","LOCUTION","locution");

		$t->set_var("CST_LIBELLE_FENETRE_DETAIL_QUEST_BIB", CST_LIBELLE_FENETRE_DETAIL_QUEST_BIB);
		$t->set_var("LIBELLE_FERMER", CST_LIBELLE_FERMER);
		$t->set_var("LIBELLE_QUESTION", htmlentities_currentcharset(stripslashes(urldecode($_REQUEST['POS_QUEST_NOM'])), null));
	
		$t->set_var("POS_LIB_ENTETE_LIEN", CST_LIBELLE_ENTETE_COL_LIEN);
		$t->set_var("POS_LIB_ENTETE_TYPE", CST_LIBELLE_ENTETE_COL_TYPE);
		$t->set_var("POS_LIB_ENTETE_RUBRIQUE", CST_LIBELLE_ENTETE_COL_RUBRIQUE);
		$t->set_var("POS_LIB_ENTETE_COLONNE", CST_LIBELLE_ENTETE_COL_COLONNE);
		$t->set_var("POS_LIB_ENTETE_OPERATEUR", CST_LIBELLE_ENTETE_COL_OPERATEUR);
		$t->set_var("POS_LIB_ENTETE_VALEUR1", CST_LIBELLE_ENTETE_COL_VALEUR1);
		$t->set_var("POS_LIB_ENTETE_VALEUR2", CST_LIBELLE_ENTETE_COL_VALEUR2);
		$t->set_var("POS_LIB_ENTETE_THESAURUS", CST_LIBELLE_ENTETE_COL_THESAURUS);
		$t->set_var("POS_LIB_ENTETE_LIE", CST_LIBELLE_ENTETE_COL_LIE);
        $t->set_var("POS_LIB_ENTETE_LIEN_MULTI", CST_LIBELLE_ENTETE_COL_LIEN_MULTI);
        $t->set_var("POS_LIB_NB_LOCUTIONS", sprintf(CST_LIBELLE_NB_LOCUTION, count($tabLocBib)));
        

		for($i=0;$i<count($tabLocBib);$i++)
		{
			$t->set_var("POS_BIB_PAR_OUV", get_libelle_parenthese_deb($tabLocBib[$i]->nbpar_deb));
			$t->set_var("POS_BIB_LIEN", get_libelle_lien($tabLocBib[$i]->lien));
			$t->set_var("POS_BIB_TYPE", $tabLstTypTous[$tabLocBib[$i]->code_typ]);
			// si le code rubrique est un champs special
    	    $szLibelleRub = getLibelleChampsSpeciaux($tabLocBib[$i]->code_rub);
    		if (strlen($szLibelleRub) == 0)
    		  $szLibelleRub = $tabLibRub[$tabLocBib[$i]->code_rub];
			$t->set_var("POS_BIB_RUB", $szLibelleRub);
			
			if( isset($tabLibRub[$tabLocBib[$i]->code_rublie]))
			$t->set_var("POS_BIB_COL", $tabLibRub[$tabLocBib[$i]->code_rublie]);
			else
				$t->set_var("POS_BIB_COL", "");
			
            $CodeRubOpe = (strlen($tabLocBib[$i]->code_rublie) != 0) ? $tabLocBib[$i]->code_rublie : $tabLocBib[$i]->code_rub;
            $t->set_var("POS_BIB_OPE", get_libelle_operateur($tabLocBib[$i]->code_ope, $jeton, $CodeRubOpe));
			$t->set_var("POS_BIB_VAL1", $tabLocBib[$i]->valeur1);
			$t->set_var("POS_BIB_VAL2", $tabLocBib[$i]->valeur2);
			$t->set_var("POS_BIB_PAR_FER", get_libelle_parenthese_fin($tabLocBib[$i]->nbpar_fin));
			$t->set_var("POS_BIB_THE", get_thesaurus($tabLocBib[$i]->thes_code,$tabLocBib[$i]->thes_prof));
			$t->set_var("POS_BIB_LIE", get_libelle_lie($tabLocBib[$i]->b_lier));
            $t->set_var("POS_BIB_LIEN_MULTI", get_libelle_lien($tabLocBib[$i]->wTypeLienMulti));
            
			
			$t->parse("locution","LOCUTION",true);
		}
	 
		// affichage du template
		$t->pparse("Output", "bib");
		
	}
    
    // deconnexion
    pos_disconnect($jeton);
}
else
{
	debug($jeton);
	echec_connexion();
}

?>