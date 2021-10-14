<?php
/* 
 * Modifications et/ou ajout de valeurs de domaines fermès normaux 
 *
 * PL 16/08/2007
 *
 * Données en entrée :
 *    POS_CODE_RUB : Code de la rubrique
 *    POS_LIBELLE_RUB : Libelle de la rubrique
 *
 * PL 04/2011  
 * Modification pour domaines fermés non alphanumériques  
 *
 */
if (!isset($_SESSION))
    session_start();
include ("../include/connexion.inc.php");
include ("../include/debug.inc.php");
include ("../include/liste_vocab.inc.php");
include ("../include/template.inc.php");
include ("../../../../configuration_w/constantesPHP.conf.php");
include ("../../../../configuration/label_".$_SESSION["sess_langue"].".conf");
include ("../../../../configuration/url.conf.php");
if ($_SESSION["sess_droitGestDomainFerme"] == false && $_SESSION["sess_droitAdministration"] == false)
{	
	echo CST_LIBELLE_NO_ADMIN_DOMFERME;
}
else
{
    $retour = connexion($jeton);
    if($retour)
    {
    	// Affichage
    	$t = new Template(".");
    	$t->set_File("val_domferme", REP_TEMPLATE_APPLICATIF."gestiondomain/consulter_rub_domferme.tpl");
    	$t->set_var("TITRE_PAGE", CST_TITRE_PAGE_GEST_DOMFERME);
    	$t->set_var("MESSAGE_SELECT_DOMFERME", CST_LIBELLE_SELECT_DOMFERME);
    	$t->set_var("MESSAGE_SUPP_DOMFERME", CST_LIBELLE_SUPP_DOMFERME);
    	$iDroitAdminDomFerme = 0;
    	if ($_SESSION["sess_droitAdministration"] || $_SESSION["sess_droitGestDomainFerme"])
    		$iDroitAdminDomFerme = 1;
        $t->set_var("DROIT_ADMIN_DOMFERME", $iDroitAdminDomFerme);
        $t->set_var("LIBELLE_RUB", CST_LIBELLE_RUBRIQUE);
    	$t->set_var("POS_LIBELLE_RUB", stripslashes(urldecode($_REQUEST['POS_LIBELLE_RUB'])));
    	$t->set_var("POS_CODE_RUB", $_REQUEST['POS_CODE_RUB']);
    	$t->set_var("LIBELLE_CODE_DOMFERME", CST_LIBELLE_CODE_DOMFERME);
    	$t->set_var("LIBELLE_LIBELLE_DOMFERME", CST_LIBELLE_LIBELLE_DOMFERME);
    	$t->set_var("LIBELLE_FERMER", CST_LIBELLE_FERMER);
    	$t->set_var("CLASS_READONLY", "CLASS='inputChamp'");
    	$t->set_var("LIBELLE_ENREG_VAL_DOMFERME", CST_LIBELLE_ENREG_VAL_DOMFERME);
    	$t->set_var("LIBELLE_VALIDER", CST_LIBELLE_VALIDER_MODIF_DOMFERME);
    	$t->set_var("LIBELLE_ANNULER", CST_LIBELLE_ANNULER_MODIF_DOMFERME);
    	$t->set_var("URL_ATTENTE", URL_ATTENTE);
    	$t->set_var("CODE_ACTION", URL_MODIFIE_DOMFERME);
    	$t->set_var("MESSAGE_VERIF_CODE_DOMFERME", CST_VERIF_CODE_DOMFERME);
    	
    	$t->set_var("URL_FERMER", URL_LIST_RUB_DOMFERME);
    	$t->set_var("URL_CONSULTER_RUB_DOMFERME", URL_CONSULTER_RUB_DOMFERME);
    	$t->set_block("val_domferme", "BLOC_TAB_TOUS_CODES_OU_VALEURS", "bloc_tab_tous_codes_ou_valeurs");
    	$t->set_block("val_domferme", "BLOC_MENU_DOMFERME_ALPHANUM", "bloc_menu_domferme_alphanum");
    	$t->set_block("val_domferme", "BLOC_MENU_DOMFERME_NON_ALPHANUM", "bloc_menu_domferme_non_alphanum");
    	$t->set_block("val_domferme", "BLOC_DICO", "bloc_dico");
    	
    	
    	$t->set_var("PHPSESSID", session_id());
    	
    	// alphanum : 
    	// date : onBlur="javascript:if(ValidateForm(this))maximum(this,'10')"
    	// entier : onBlur="javascript:if(isANumber(this))maximum(this,'10')"
    	// décimal onBlur="javascript:if(validateDecimal(this))maximum(this,'20')"
    	$ctrl_saisie = "";
    	if(strcmp($_REQUEST['POS_DOMFERME_NON_ALPHANUM'], "0") ==0)
    	{	
    		$t->parse("bloc_menu_domferme_alphanum", "BLOC_MENU_DOMFERME_ALPHANUM",true);	
    		$t->set_var("bloc_menu_domferme_non_alphanum", "");				
    		//$t->set_var("LIBELLE_LIBELLE_DOMFERME", CST_LIBELLE_LIBELLE_DOMFERME);
    		$t->set_var("MESSAGE_VERIF_LIBELLE_DOMFERME", CST_VERIF_LIBELLE_DOMFERME);
    		$t->set_var("DISPLAY_CODE", "");
    		$ctrl_saisie = "";
    	}
    	else
    	{
    		$t->parse("bloc_menu_domferme_non_alphanum", "BLOC_MENU_DOMFERME_NON_ALPHANUM",true);	
    		$t->set_var("bloc_menu_domferme_alphanum", "");	
    		$t->set_var("LIBELLE_LIBELLE_DOMFERME", CST_LIBELLE_VALEUR_FINIE);
    		$t->set_var("MESSAGE_VERIF_LIBELLE_DOMFERME", CST_VERIF_VALEUR_DOMFERME);
    		$t->set_var("DISPLAY_CODE", "none");
    		
    		switch ($_REQUEST['POS_DOMFERME_NON_ALPHANUM'])
    		{
    			case "1" :	// entier			
    				$ctrl_saisie = "onBlur=\"javascript:if(isANumber(this))maximum(this,'10');\"";
    				break;
    				
    			case "2" :	// date
    				$ctrl_saisie =  "onBlur=\"javascript:if(ValidateForm(this))maximum(this,'10');\"";
    				break;
    				
    			case "4" :	//décimal
    				$ctrl_saisie = "onBlur=\"javascript:if(validateDecimal(this))maximum(this,'20');\"";
    				break;
    		}
    	}
    		
    	$t->set_var("MESSAGE_CODE_DOMFERME_EXISTANT", CST_MESSAGE_CODE_DOMFERME_EXISTANT);
    	$t->set_var("MESSAGE_VALEUR_DOMFERME_EXISTANT", CST_MESSAGE_VALEUR_DOMFERME_EXISTANT);
    		
    	$t->set_var("DOMFERME_NON_ALPHANUM", $_REQUEST['POS_DOMFERME_NON_ALPHANUM']);
    	$t->set_var("CTRL_SAISIE", $ctrl_saisie);
    	
    	$t->set_var("LIBELLE_AJOUTER", CST_LIBELLE_AJOUTER );
    	$t->set_var("LIBELLE_MODIFIER", CST_LIBELLE_MODIF);
    	$t->set_var("LIBELLE_SUPPRIMER", CST_LIBELLE_SUPP);
    	$t->set_var("LIBELLE_EXPORTER", CST_EXPORT_EXPORT);
    		
    	// non implémenté pour le moment
    	$iTri = POS_CODE_DF;
    	if (isset($_REQUEST['POS_TRI']) && strcmp($_REQUEST['POS_TRI'], "LIBELLE") == 0)
    	   $iTri = POS_LIBELLE_DF;
        $retour = pos_getinforub($jeton, $_REQUEST['POS_CODE_RUB'], /*pref*/$tabInfoOneRub);
        $retour = getListeTousMotDf($jeton, $_REQUEST['POS_CODE_RUB'], $iTri, 
                            $tabInfoOneRub->typerub, /*pref*/$liste_mots);
    	
    	if($retour)
    	{	
    		$j=0;
    		// $liste_mots : tableau indexé si DF non alphanumérique
    		// $liste_mots : tableau associatif code/valeur si DF alphanumérique  
    		foreach($liste_mots as $key => $value)
    		{
    		  	$szInfoVocabRub = "POS_CODE_DOMFERME=".urlencode(addslashes($key));
    		  	$szInfoVocabRub.= "&POS_LIBELLE_DOMFERME=".urlencode(addslashes($value));	
    			$szInfoVocabRub.= "&POS_DOMFERME_NON_ALPHANUM=".$_REQUEST['POS_DOMFERME_NON_ALPHANUM'];	
    				
    		  	$t->set_var("POS_VOCAB_RUB", $szInfoVocabRub);
    			$t->set_var("POS_CODE_DOMFERME", $key);	
    			$t->set_var("POS_LIBELLE_DOMFERME", $value);
    			$t->parse("bloc_dico", "BLOC_DICO",true);
    			
    			// construction du tableau qui permettra de vérifier la pré-existence du mot saisi
    			// on met le code du mot ($key ou $value selon type de tableau)
    			if(strcmp($_REQUEST['POS_DOMFERME_NON_ALPHANUM'], "0") ==0)
    				$t->set_var("CODES_OU_VALEURS", addslashes($key));
    			else
    				$t->set_var("CODES_OU_VALEURS", addslashes($value));
    			$t->set_var("CPT_CODES_OU_VALEURS", $j);
                $t->set_var("PAIR_OU_IMPAIR", (($j % 2) == 0) ? "pair" : "impair");
    			$j++;					
    			$t->parse("bloc_tab_tous_codes_ou_valeurs", "BLOC_TAB_TOUS_CODES_OU_VALEURS",true);
    		}
    		$t->pparse("MyOutput", "val_domferme");			
    	}
    	else
    		debug($jeton);	
    
    			
    	pos_disconnect($jeton);		
    }
    else
    {
    	debug($jeton);
    	echec_connexion();
    }
}
?>
