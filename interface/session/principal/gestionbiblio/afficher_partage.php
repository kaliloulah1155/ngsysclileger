<?php
/*
 * DESCRIPTION : Affichage des partages d'une question de la bibliothèque
 * AUTEUR: GG
 * DATE DE CREATION: 19/02/2007
 *
 * Données en entrée
 * POS_QUEST_NOM : nom de la question
 */ 
session_start();
include ("../include/locution.inc.php");
include ("../include/question.inc.php");
include ("../include/connexion.inc.php");
include ("../include/template.inc.php");
include ("../include/debug.inc.php");
include ("../include/form_values.inc.php");

include ("../../../../configuration_w/constantesPHP.conf.php");
include ("../../../../configuration/label_".$_SESSION["sess_langue"].".conf");
include ("../../../../configuration/url.conf.php");

define("TYPE_QUESTION_BIB_NON_PARTAGEE",0);
define("TYPE_QUESTION_BIB_PROFIL",1);
define("TYPE_QUESTION_BIB_FONCTION",2);
define("TYPE_QUESTION_BIB_SERVICE",3);
define("TYPE_QUESTION_BIB_UTILISATEUR",4);
define("TYPE_QUESTION_BIB_PUBLIC",5);

$tabLibelleTypeProprietaire = array();
$tabLibelleTypeProprietaire[TYPE_QUESTION_BIB_NON_PARTAGEE] = CST_LIBELLE_NON_PARTAGE;
$tabLibelleTypeProprietaire[TYPE_QUESTION_BIB_PROFIL] = CST_LIBELLE_BIB_PARTAGE_PROFIL;
$tabLibelleTypeProprietaire[TYPE_QUESTION_BIB_FONCTION] = CST_LIBELLE_BIB_PARTAGE_FONCTION;
$tabLibelleTypeProprietaire[TYPE_QUESTION_BIB_SERVICE] = CST_LIBELLE_BIB_PARTAGE_SERVICE;
$tabLibelleTypeProprietaire[TYPE_QUESTION_BIB_UTILISATEUR] = CST_LIBELLE_BIB_PARTAGE_UTIL;
$tabLibelleTypeProprietaire[TYPE_QUESTION_BIB_PUBLIC] = CST_LIBELLE_BIB_PARTAGE_PUBLIC;


if (isset($_REQUEST["POS_QUEST_NOM"]))
	$szNomQuestion = stripslashes(urldecode($_REQUEST["POS_QUEST_NOM"]));
else {
    afficheMsg(out, "Le nom de la question n'a pas ete retrouve.");
    return;
}

//connexion à poseidon
$retour = connexion($jeton);
if ($retour)
{
	$isAdmin = $_SESSION["sess_droitAdministration"] ? true : false;
    if($isAdmin)
    {
            
		// on definit le template utilisé  
		$t = new template(REP_TEMPLATE_APPLICATIF."bibliotheque");
		$t->set_file("bib", "partage_question_bib.tpl");

        $t->set_block("bib", "BLOC_USER", "bloc_user");
        $t->set_block("bib", "BLOC_PROFIL", "bloc_profil");
        $t->set_block("bib", "BLOC_FONCTION", "bloc_fonction");
        $t->set_block("bib", "BLOC_SERVICE", "bloc_service");
        $t->set_block("bib", "BLOC_AFFICHE_PARTAGE", "bloc_affiche_partage");
        
		// par défaut on ne fait pas cette action car le champ n'existe pas.
		$t->set_var("TITRE_PAGE", CST_TITRE_PAGE_PARTAGE_BIB);
		$t->set_var("LIBELLE_TITRE_QUEST_BIB", CST_LIBELLE_TITRE_QUEST);
		$t->set_var("LIBELLE_BIB_PARTAGE", CST_LIBELLE_BIB_PARTAGE);
		$t->set_var("LIBELLE_BIB_CACHEE", CST_LIBELLE_BIB_CACHEE);
		$t->set_var("LIBELLE_ENREGISTRER", CST_LIBELLE_ENREGISTRER);
        $t->set_var("POS_QUEST_NOM", $szNomQuestion);
        $t->set_var("POS_QUEST_NOM_HTML", htmlentities_currentcharset($szNomQuestion, null));

        // Affichage
        $t->set_var("POS_ADMIN", $isAdmin ? 1  : 0);

        $t->set_var("LIB_PROFIL", CST_LIBELLE_BIB_PARTAGE_PROFIL);
        $t->set_var("LIB_FONCTION", CST_LIBELLE_BIB_PARTAGE_FONCTION);
        $t->set_var("LIB_PUBLIC", CST_LIBELLE_BIB_PARTAGE_PUBLIC);
        $t->set_var("LIB_SERVICE", CST_LIBELLE_BIB_PARTAGE_SERVICE);
        $t->set_var("LIB_UTIL", CST_LIBELLE_BIB_PARTAGE_UTIL);

        $t->set_var("TYPE_QUESTION_BIB_PROFIL", TYPE_QUESTION_BIB_PROFIL);
        $t->set_var("TYPE_QUESTION_BIB_FONCTION", TYPE_QUESTION_BIB_FONCTION);
        $t->set_var("TYPE_QUESTION_BIB_SERVICE", TYPE_QUESTION_BIB_SERVICE);
        $t->set_var("TYPE_QUESTION_BIB_UTILISATEUR", TYPE_QUESTION_BIB_UTILISATEUR);
        $t->set_var("TYPE_QUESTION_BIB_PUBLIC", TYPE_QUESTION_BIB_PUBLIC);
        
        $t->set_var("LIBELLE_TYPE_PARTAGE", CST_LIBELLE_BIB_TYPE_PARTAGE);
        $t->set_var("LIBELLE_VALEUR_PARTAGE", CST_LIBELLE_BIB_VALEUR_PARTAGE);
        $t->set_var("LIBELLE_BIB_PARTAGEABLE", CST_LIBELLE_BIB_PARTAGEABLE);
        
        $t->set_var("URL_PARTAGER_QUEST_BIB", URL_PARTAGER_QUEST_BIB);
		

        // Recherche des différents composants pour le partage
        // Utilisateur et profil
        // suppression cause pbs sur certains LDAP, semble preferable d'utiliser pos_gestutilisateur
        //$retour = pos_getallutilprofil($jeton, /*pref*/$tabStUtil, /*pref*/$tabStProfil);
        $retour = pos_gestutilisateur($jeton, "", PHP_VULCAIN_UTIL_GET_ALL_UTIL, /*pref*/$tabStUtil);
        $szTousProfils = "";
		$objInfoTousProfilsMaj = array();
		$tabInfoTousProfils = array();

		if ($retour) {
			$retour = pos_gestprofilutil($jeton, $szTousProfils, PHP_VULCAIN_UTIL_GET_ALL_PROFIL, 
										$objInfoTousProfilsMaj, /*pref*/$tabInfoTousProfils);
        }
        
        $tabUser = array();
        $tabProfil = array();
        $tabFonction = array();
        if (!$retour)
            debug($jeton);
        for($i=0; $i<count($tabStUtil); $i++)
		{
			$tabUser[] = trim($tabStUtil[$i]->szUtilisateur);
		}
        for($i=0; $i<count($tabInfoTousProfils); $i++)
		{
			$tabProfil[] = trim($tabInfoTousProfils[$i]->szProfil);
			if (strlen(trim($tabInfoTousProfils[$i]->szFonction)) > 0 )
				$tabFonction[] = trim($tabInfoTousProfils[$i]->szFonction);
		}
		$tabProfil = array_unique($tabProfil);
		$tabFonction = array_unique($tabFonction);
        $tabUser = array_unique($tabUser);
        
		sort($tabUser);
		for($i=0; $i<count($tabUser); $i++)
		{
			$t->set_var("POS_CODE_UTIL", htmlspecialchars_currentcharset($tabUser[$i]));
			$t->parse("bloc_user", "BLOC_USER",true);
		} 
		sort($tabProfil);
		for($i=0; $i<count($tabProfil); $i++)
		{
			$t->set_var("POS_PROFIL_UTIL", htmlspecialchars_currentcharset($tabProfil[$i]));
			$t->parse("bloc_profil", "BLOC_PROFIL",true);
		}

		sort($tabFonction);
		for($i=0; $i<count($tabFonction); $i++)
		{
			$t->set_var("POS_FONCTION", htmlspecialchars_currentcharset($tabFonction[$i]));
			$t->parse("bloc_fonction", "BLOC_FONCTION",true);
		}
		
		// GET_LISTE_SERVICES == 3
		$retour = pos_getlisteinfo($jeton, 3, /*pref*/$tabListeInfo);
		foreach($tabListeInfo as $key => $val)
		{
			$t->set_var("POS_SERVICE", $key);
            $t->parse("bloc_service", "BLOC_SERVICE",true);
		}            

        $tabStQuest = array();
		$retour = pos_bib_getassopartage($jeton, $szNomQuestion, /*pref*/$tabStQuest);
        
        $iNbPartage = 0;
		for ($i=0;$i<count($tabStQuest);$i++) {
        	
			$struQUEST = $tabStQuest[$i];
            $szLibTypePartage = "";
            switch ($struQUEST->wTypeProprietaire) {

                case TYPE_QUESTION_BIB_PROFIL :
                    $szLibTypePartage = CST_LIBELLE_BIB_PARTAGE_PROFIL;
                    break;
                case TYPE_QUESTION_BIB_FONCTION :
                    $szLibTypePartage = CST_LIBELLE_BIB_PARTAGE_FONCTION;
                    break;
                case TYPE_QUESTION_BIB_SERVICE :
                    $szLibTypePartage = CST_LIBELLE_BIB_PARTAGE_SERVICE;
                    break;
                case TYPE_QUESTION_BIB_UTILISATEUR :
                    $szLibTypePartage = CST_LIBELLE_BIB_PARTAGE_UTIL;
                    break;
                case TYPE_QUESTION_BIB_PUBLIC :
                    $szLibTypePartage = CST_LIBELLE_BIB_PARTAGE_PUBLIC;
                    break;
            }
            if (strlen($szLibTypePartage) > 0)
            {
            	$iNbPartage++;
	            $t->set_var("PARTAGE_TYPE", $szLibTypePartage);
	            $t->set_var("PARTAGE_VALEUR", $struQUEST->szProprietaire);
	            $t->set_var("PARTAGE_CACHE", $struQUEST->bCache ? CST_LIBELLE_OUI : CST_LIBELLE_NON);
	            $t->parse("bloc_affiche_partage", "BLOC_AFFICHE_PARTAGE",true);
            }
        }
    	if ($iNbPartage == 0)
        	$t->set_var("bloc_affiche_partage", "");
				 
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