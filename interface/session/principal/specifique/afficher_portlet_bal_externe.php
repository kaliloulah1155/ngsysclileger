<?php
/**
 * Affichage des boîtes aux lettres d'une autre application de la même base
 * 
 * Pas facilement intégrable en standard pour les raisons suivantes
 * - Il y a peu de client qui ont plusieurs applications Poseidon
 * - Les applications doivent etre sur la meme base ou partager une base d'utilisateur/mot de passe commune
 * - L'url à préciser pour l'ouverture de la question dépend du paramétrage de la page d'index de l'application externe
 * - Le chargement peut être long
 * - Intéressant quand on est en mode SSO, moins si l'utilisateur doit saisir son mdp sur chaque nouvelle application
 * - pas de gestion des profils, seul le profil par defaut est charge.
 * On pourrait charger tous les profils mais ce serait long et il faudrait gerer la connexion sur la nouvelle application
 * en prenant en compte un profil passe en argument de l'Url ce qui n'existe pas pour le moment.
 * On pourrait aussi spécifier le profil dans les parametres de la portlet mais cela rendrait difficile un parametrage generique par
 * l'administrateur.
 */
include_once ("../include/bal.inc.php");
session_start();
session_write_close();
include ("../include/template.inc.php");
include ("../include/json/JSON.php");
include ("../include/util_headers.php");
include ("../../../../configuration_w/constantesPHP.conf.php");
include ("../../../../configuration/url.conf.php");
include ("../include/connexion.inc.php");
include ("../include/liste_resumee.inc.php");
include ("../include/locution.inc.php");
include ("../include/form_values.inc.php");
include ("../include/fonction_util.inc.php");
include ("../../../../configuration/label_".$_SESSION["sess_langue"].".conf");

writeHeadersNoCache();
$json = new Services_JSON();
$objRetour = array();
$objRetour["code_retour"] = 1;
$objRetour["msg_erreur"] = "";
$objRetour["contenu"] = "";

$sAppl = $_REQUEST['POS_NOM_APPLI_EXTERNE'];
if (!defined('APPLI_EXTERNE_BAL') || !isset(APPLI_EXTERNE_BAL[$sAppl])) {
    $objRetour["code_retour"] = 0;
    $objRetour["msg_erreur"] = "L'application externe n'est pas paramétrée sur cette application.";
}
else {
    $sUrlExterne = APPLI_EXTERNE_BAL[$sAppl]["URL"];
    $sServeur = APPLI_EXTERNE_BAL[$sAppl]["SERVEUR"];
    $sPort = APPLI_EXTERNE_BAL[$sAppl]["PORT"];
    //error_log("sUrlExterne:$sUrlExterne, sServeur:$sServeur, sPort:$sPort");
     
    $retour = pos_dllstartup(/*pref*/$jeton);
    if ($retour)
    {     
        $idConnexion = 0;
        $sProfil = "";
        
        if ($_SESSION["sess_askmodesso"])
		{
			$bModeDeconnecte = 0;
            $sCodeUtil = "";
            $retour = pos_loginsso($jeton, $_SESSION["sess_user_name"], 
                    $sAppl, $sServeur, $sPort, 
                    $bModeDeconnecte, $_SESSION["sess_profil"], /*pref*/$sessIdConnexion);
            //error_log("pos_loginsso");
		}
		else
		{  
			$retour = pos_login($jeton, $_SESSION["sess_user_name"], decrypt_text($_SESSION["sess_passwd"], $_SESSION["sess_crypt_key"]), 
    		              $sAppl, $sServeur, $sPort, false, $sProfil, 
                            $_SERVER["REMOTE_ADDR"],
                            0,  // isNvMdp
                            "", // nvMdp
                        /*pref*/$idConnexion);
            //error_log("pos_login");
        }
    }
    
    if ($retour)
    {
    	if(defined('CST_CHARGEMENT_BAL_XML') && strcmp(CST_CHARGEMENT_BAL_XML, "1") == 0)
    	{
            // --------------------------------
            // chargement des bals en XML
            // --------------------------------
            // Utilisateur et profil par défaut
            $szUtilisateur = $_SESSION["sess_user_name"];
            $ficBal = getRepTmpSession(session_id())."bal.xml";
            $szNomFichier = "";
            $sProfil = "";
            
            $retour = pos_getutilgetalllien($jeton, $szUtilisateur, /*pref*/$tabAllProfilUtil);
    
            if ($retour) {
    	        for($i=0;$i<count($tabAllProfilUtil);$i++) {
                    if (strcmp(trim($tabAllProfilUtil[$i]->szApplication), $sAppl) == 0
                        && $tabAllProfilUtil[$i]->dwParDefaut == 1) {
        		      $sProfil = trim($tabAllProfilUtil[$i]->szProfil);
        		      break;
                    }
        		}
    	    }
            
            $retour = pos_getficbalxml($jeton, $szUtilisateur, $sProfil, $ficBal, /*pref*/$szNomFichier);
            if ($retour) {
                //$ficBal = "../../../../configuration/bal_".$_SESSION["sess_application"].".xml";
                $tabBalNiveau1 = array();
                // On vérifie que le fichier existe
                if($retour && file_exists($ficBal) && filesize($ficBal) > 0)
                {
                    $ficBalXml = simplexml_load_file($ficBal);
                    $tabFilsNiveau1 = $ficBalXml->children();
                    $iNbBal = 0;
                    // parcourt les fils principaux
                    for($i=0;$i<count($tabFilsNiveau1);$i++)
                    {
                        $isOpen = sprintf("%s", $tabFilsNiveau1[$i]->open);
                        $isOpen = (strcmp($isOpen, "1") == 0 || strcmp($isOpen, "OUI") == 0) ? 1 : 0;
                        $szLibrairie = sprintf("%s", utf8_decode($tabFilsNiveau1[$i]->librairie));
                        $szBal = sprintf("%s", utf8_decode($tabFilsNiveau1[$i]->bal));
                        $szLibelle = sprintf("%s", utf8_decode($tabFilsNiveau1[$i]->libelle));
                        $szProfil = sprintf("%s", utf8_decode($tabFilsNiveau1[$i]->profil));
                        $szIcone = sprintf("%s", utf8_decode($tabFilsNiveau1[$i]->icone));
                        $szStyleBal = sprintf("%s", utf8_decode($tabFilsNiveau1[$i]->style));
                        
                        if (strcmp($tabFilsNiveau1[$i]->attributes()->type, "titre") == 0)
                        {
                            $tab_bal[$iNbBal] = new Bal11(TYPE_TITRE, $isOpen, 
                                    $szLibrairie, $szBal,
                                    $szLibelle, $szProfil, $szIcone, $szStyleBal);
                            
                            $tabFilsNiveau2 = $tabFilsNiveau1[$i]->listefils->children();
                            $tabBalNiveau2 = array();
                            $iNbSousBal = 0;
                            for($j=0;$j<count($tabFilsNiveau2);$j++)
                            {
                                // un titre <regroupement>
                                $isOpen = sprintf("%s", $tabFilsNiveau2[$j]->open);
                                $isOpen = (strcmp($isOpen, "1") == 0 || strcmp($isOpen, "OUI") == 0) ? 1 : 0;
                                $szLibrairie = sprintf("%s", utf8_decode($tabFilsNiveau2[$j]->librairie));
                                $szBal = sprintf("%s", utf8_decode($tabFilsNiveau2[$j]->bal));
                                $szLibelle = sprintf("%s", utf8_decode($tabFilsNiveau2[$j]->libelle));
                                $szProfil = sprintf("%s", utf8_decode($tabFilsNiveau2[$j]->profil));
                                $szIcone = sprintf("%s", utf8_decode($tabFilsNiveau2[$j]->icone));
                                $szStyleSsBal = sprintf("%s", utf8_decode($tabFilsNiveau2[$j]->style));
                                
                                if (strcmp($tabFilsNiveau2[$j]->attributes()->type, "bal") == 0)
                                {
                                    $tabBalNiveau2[$iNbSousBal++] = new Bal11(TYPE_BAL, $isOpen, 
                                            $szLibrairie, $szBal,
                                            $szLibelle, $szProfil, $szIcone, $szStyleSsBal);
                                    $tab_bal_assoc_libelle[$szLibrairie] = $szBal;
                                }
                            }
                            $tab_bal[$iNbBal]->tabListeFils = $tabBalNiveau2;
                            $iNbBal++;
                        }
                        else if (strcmp($tabFilsNiveau1[$i]->attributes()->type, "bal") == 0)
                        {
                            $tab_bal[$iNbBal++] = new Bal11(TYPE_BAL, $isOpen, 
                                $szLibrairie, $szBal,
                                $szLibelle, $szProfil, $szIcone, $szStyleBal);
                        
                            $tab_bal_assoc_libelle[$szLibrairie] = $szBal;
                        }
                    }
                }
            }
    
        }
        else
        {
        	$retour = pos_bib_getlistequestionsbal($jeton, /*pref*/$tabBAL);
    	    if ($retour)
    	    {
                for($i=0;$i<count($tabBAL);$i++)
                {
                	$tab_bal[$i] = new Bal($tabBAL[$i]);
                	$tab_bal_assoc_libelle[$tab_bal[$i]->szCode] = $tab_bal[$i]->szLibelle;
        			// pas de recherche sur les resolutions de variables : peut prendre du temps
                }
            }
        }
    }
    
    if (!$retour) {
        $objRetour["code_retour"] = 0;
        $objRetour["msg_erreur"] = get_erreur_poseidon($jeton);
    }
    if ($objRetour["code_retour"] > 0)
    {
    	if (count($tab_bal) == 0) {
            $t = new template(REP_TEMPLATE_APPLICATIF."portail");
    		$t->set_file ("portlet", "portlet_empty.tpl");
    		$t->set_var("TITLE", "");
            $szContent = $t->parse("Output", "portlet");
    	} else {
            $t = new template(REP_TEMPLATE_APPLICATIF."specifique");
    		$t->set_file("question", "portlet_bal.tpl");
            afficherListeBal($jeton, $tab_bal, /*pref*/$t);
            $szContent = $t->parse("Output", "question");
    	}
    	  
    	$objRetour["contenu"] = $szContent;
    }
    $retour = pos_logout($jeton, 1);
    pos_dllcleanup($jeton);
}

$output = $json->encode($objRetour);
print($output);

function afficherListeBal($jeton, $tabBal, &$t)
{
    $t->set_block("question","BAL","bal");
    $t->set_block("question", "TITRE_BAL_GROUPE", "titre_bal_groupe");
    $t->set_block("question", "TITRE_ONLY_GROUPE", "titre_only_groupe");
    $t->set_block("question", "TITRE_GROUPE", "titre_groupe");
    $t->set_block("question", "GROUPE_BAL", "groupe_bal");
    // affichage de la liste des objet : groupe de bal et bal
    // si la bal est de type groupe, affichage des fils
    $iCptBal = 0;
    $iCptGroup = 0;
    for($i=0;$i<count($tabBal);$i++)
    {
        $t->set_var("bal", "");
        if ($tabBal[$i]->iType == TYPE_BAL)
        {
            $t->set_var("POS_BAL_TITRE_GROUPE", "");
            $t->set_var("GROUP_ON", "n");
            $t->set_var("ICPTGROUP", "no");
            $t->set_var("DISPLAY_GROUPE_OUVERT", "");
            $t->set_var("titre_groupe", "");
                                                         
            afficheBalPortletTpl($jeton, $tabBal[$i], $iCptGroup, "BAL", /*pref*/$iCptBal, /*pref*/$t);
    	}
    	else
    	{
            $t->set_var("ICPTGROUP", "ext_".$iCptGroup);
            if (strlen($tabBal[$i]->szIcone) > 0)
                $t->set_var("ICONE_GROUPE", "<img src='".URL_SITE."/images/menu/win/".$tabBal[$i]->szIcone.".gif'>");
    		else
                $t->set_var("ICONE_GROUPE", "");
            $t->set_var("STYLE_BAL", $tabBal[$i]->szStyle);
            $t->set_var("POS_BAL_TITRE_GROUPE", $tabBal[$i]->szLibelleComment);
            $t->set_var("GROUP_ON", "o");
            if ($tabBal[$i]->bOpen)
            {
                $t->set_var("DISPLAY_GROUPE_OUVERT", "");
                $t->set_var("ICONE_ARBRE_PLUS_MOINS", "moins");
            }
            else
            {
                $t->set_var("DISPLAY_GROUPE_OUVERT", "none");
                $t->set_var("ICONE_ARBRE_PLUS_MOINS", "plus");
            }
            
            if (strlen($tabBal[$i]->szCode) == 0)
            {
                $t->parse("titre_only_groupe", "TITRE_ONLY_GROUPE", false);
                $t->set_var("titre_bal_groupe", "");
            }
            else
            {
                afficheBalPortletTpl($jeton, $tabBal[$i], $iCptGroup, "TITRE_BAL_GROUPE", /*pref*/$iCptBal, /*pref*/$t);
                //$t->parse("titre_bal_groupe", "TITRE_BAL_GROUPE", false);
                $t->set_var("titre_only_groupe", "");
            }
            
           	for($j=0;$j<count($tabBal[$i]->tabListeFils);$j++)
            {
                afficheBalPortletTpl($jeton, $tabBal[$i]->tabListeFils[$j], $iCptGroup, "BAL", /*pref*/$iCptBal, /*pref*/$t);
            }
        	$t->parse("titre_groupe", "TITRE_GROUPE", false);
        	$iCptGroup++;
    	}
        $t->parse("groupe_bal", "GROUPE_BAL", true);
    }
}

function afficheBalPortletTpl($jeton, $objBal, $iCptGroup, $blocAParserUpper, &$iCptBal, &$tpl)
{
    global $sUrlExterne;
    $tpl->set_var("SZ_CODE_BAL", $objBal->szCode);
    $tpl->set_var("SZ_CODE_BAL_HTML_ENCODE", htmlentities_currentcharset($objBal->szCode, ENT_NOQUOTES));
    $tpl->set_var("BAL_OPEN", $objBal->bOpen);
    $tpl->set_var("ICONE_BAL", $objBal->szIcone);
    $tpl->set_var("ICPTBAL", $iCptBal++);
                                                     
	// la bal est ouverte
    if($objBal->bOpen && strlen($objBal->szCode)>0)
    {
		if($objBal->bVariable)
    		// si variable : marque d'un x le nombre de reponse
			$tpl->set_var("POS_BAL_NB_REP", "x");
		else
		{
           $tabValVar = array();
    	   $retour = pos_bib_getreponsesquest($jeton, $objBal->szCode, 0, 1, $tabValVar, 
    							/*pref*/$iNbReponses, /*pref*/$iAdrPremiereReponse);

			$tpl->set_var("POS_BAL_NB_REP", $iNbReponses);
        }
	}
	// la bal est fermée
	else
	{
    	// si fermé : marque d'un ? le nb de réponses
		$tpl->set_var("POS_BAL_NB_REP", "?");	
	}
	
	//test si un profil résumé
	//if (strlen($objBal->szProfilLr) == 0) 
    //$linkBal = sprintf(URL_PARAM_QUESTION_PROFIL_RESULTAT_AVEC_ATTENTE, "RECHERCHE_BAL", addslashes($objBal->szCode), 1, addslashes($objBal->szProfilLr));
    // NB : depend du paramétrage de la page d'index
	$linkBal =  $sUrlExterne."?question=".urlencode(addslashes($objBal->szCode));
    $tpl->set_var("POS_BAL_EXTERNE_LIEN", $linkBal);
    $tpl->set_var("POS_BAL_LIBELLE", $objBal->szLibelle);
    $tpl->set_var("POS_BAL_LIBELLE_COMMENT", $objBal->szLibelleComment);
    $tpl->set_var("STYLE_BAL", $objBal->szStyle);
	$tpl->parse(strtolower($blocAParserUpper), $blocAParserUpper, true);
}

?>
