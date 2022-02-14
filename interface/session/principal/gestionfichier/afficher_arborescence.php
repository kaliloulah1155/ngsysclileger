<?php
/*
 * DESCRIPTION : Affiche l'arborescence des fichiers associés.
 * 
 * AUTEUR : Sébastien COSTANZO
 * DATE de CREATION : 20/03/2002
 *
 * MODIFICATION :
 *		Seb le 31/01/2003 utilisation de la fct pos_getlisteinfopage
 *
 * Donnees en entree : 
 * POS_NUM_DOC : numero poseidon du document
 * MODE : 
 * 17.02.2004 GG correction pour affichage des noms de fichiers avec des apostrophes
 *
 */
if (!isset($_SESSION))
session_start();
include ("../include/connexion.inc.php");
include ("../include/debug.inc.php");
include ("../include/template.inc.php");
include ("../include/fonction_fichiers.inc.php");
include ("../../../../configuration_w/constantesPHP.conf.php");
include ("../../../../configuration/label_".$_SESSION["sess_langue"].".conf");
include ("../../../../configuration/url.conf.php");
include ("../../../../configuration_w/natures.conf");

$TAB_EXT_AVEC_ICONE = array("DOC", "DOCX", "PDF", "XLS", "XLSX", "TXT", "PPT", "JPG", "PS", "TIF");
if(!isset($_REQUEST["POS_NUM_DOC"]))
{
	echo "<h1>".CST_LIBELLE_ACTION_AFFICHE_ARBO."</h1>";
	exit;
}

$retour = connexion($jeton);

if($retour)
{
	$t = new Template(REP_TEMPLATE_APPLICATIF."fichier/");
	$t->set_File("arborescence", "arborescence.tpl");
	
	$t->set_var("LIBELLE_TITRE_ARBO", CST_LIBELLE_TITRE_ARBO);
	
	$t->set_var("POS_NUM_DOC", $_REQUEST["POS_NUM_DOC"]);
	$t->set_var("POS_TYPEDOC", $_REQUEST["POS_TYPEDOC"]);
	$t->set_var("URL_CONSULTER_FICHIER", URL_CONSULTER_FICHIER);
	$t->set_var("URL_AFFICHER_ACTION", URL_AFFICHER_ACTION_FICHIER);
	$t->set_var("MODE", $_REQUEST["MODE"]);
	$t->set_var("LANGUE", $_SESSION["sess_langue"]);
	$t->set_var("DROIT_MODIF", $_REQUEST["DROIT_MODIF"]);
	$t->set_var("DROIT_SUPP", $_REQUEST["DROIT_SUPP"]);
	$t->set_var("MODE_FICHIER", ($_REQUEST["DROIT_MODIF"])? "MODIFICATION" : "CONSULTATION");
    $t->set_var("post_max_size_bytes", return_bytes(ini_get('post_max_size')));
    $t->set_var("upload_max_filesize_bytes", return_bytes(ini_get('upload_max_filesize')));
    $t->set_var("post_max_size", ini_get('post_max_size'));
    $t->set_var("upload_max_filesize", ini_get('upload_max_filesize'));
    $t->set_var("MSG_TAILLE_MAX_AVANT_NOM_FICHIER", CST_MSG_TAILLE_MAX_AVANT_NOM_FICHIER);
    $t->set_var("MSG_TAILLE_MAX_AVANT_TAILLE_FICHIER", CST_MSG_TAILLE_MAX_AVANT_TAILLE_FICHIER);
    $t->set_var("MSG_TAILLE_MAX_FIN", CST_MSG_TAILLE_MAX_FIN);
    $t->set_var("MSG_TAILLE_TOTALE_MAX_AVANT_TAILLE", CST_MSG_TAILLE_TOTALE_MAX_AVANT_TAILLE);
    $t->set_var("MSG_TAILLE_TOTALE_MAX_FIN", CST_MSG_TAILLE_TOTALE_MAX_FIN);    
    $t->set_var("LIBELLE_SELECT_ONE_FILE", CST_LIBELLE_SELECT_ONE_FILE);
    $t->set_var("LIBELLE_SELECT_MANY_FILES", CST_LIBELLE_SELECT_MANY_FILES);
    $t->set_var("LIBELLE_MSG_DND_FILES_OU_CHOIX", CST_LIBELLE_MSG_DND_FILES_OU_CHOIX);
    $t->set_var("LIBELLE_CONFIRM_AJOUT_FICHIER", CST_LIBELLE_CONFIRM_AJOUT_FICHIER);
    $t->set_var("LIBELLE_CONFIRM_FERMETURE_FICHIERS", CST_LIBELLE_CONFIRM_FERMETURE_FICHIERS);
    $t->set_var("LIBELLE_TITRE_CONF_FICHIERS", CST_LIBELLE_TITRE_CONF_FICHIERS);

	$mode_Fichier = ($_REQUEST["DROIT_MODIF"])? "MODIFICATION" : "CONSULTATION";
	
	$retour = pos_getlisteinfopage($jeton, $_REQUEST["POS_NUM_DOC"], 0, /*pref*/$tabStruListePage);
	
	if(!$retour)
		 debug($jeton);
	
	// gestion des boutons.
	$cpt = 0;
	$cptSsPage = 0;
    $t->set_block("arborescence", "BLOC_INFO_CONF_PAGE", "bloc_info_conf_page");
	$t->set_block("arborescence", "OPTION_PAGE", "option_page");
	$t->set_block("arborescence", "OPTION_SS_PAGE", "option_ss_page");
    $t->set_block("arborescence", "LISTE_NIV_CONF", "liste_niv_conf");
	
	afficherFonction($cpt++, "onConsulter()", CST_LIBELLE_CONSULT, "option_page", /*pref*/$t);
	afficherFonction($cptSsPage++, "onConsulter()", CST_LIBELLE_CONSULT, "option_ss_page", /*pref*/$t);
	
	if($_REQUEST["DROIT_MODIF"] && CST_UTIL_POS_DAV_POINT_POW)
	{
	    afficherFonction($cpt++, "onModifier()", CST_LIBELLE_MODIF, "option_page", /*pref*/$t);
    	afficherFonction($cptSsPage++, "onModifier()", CST_LIBELLE_MODIF, "option_ss_page", /*pref*/$t);
    }
	
	afficherFonction($cpt++, "onTelecharger()", CST_LIBELLE_TELECHARGER, "option_page", /*pref*/$t);
	afficherFonction($cptSsPage++, "onTelecharger()", CST_LIBELLE_TELECHARGER, "option_ss_page", /*pref*/$t);
	
	if($_REQUEST["DROIT_SUPP"])
	{
	    afficherFonction($cpt++, "onSupprimer()", CST_LIBELLE_SUPP, "option_page", /*pref*/$t);
	    afficherFonction($cptSsPage++, "onSupprimer()", CST_LIBELLE_SUPP, "option_ss_page", /*pref*/$t);
    }
	
	if($_REQUEST["DROIT_MODIF"])
	{
	    afficherFonction($cpt++, "", "<HR>", "option_page", /*pref*/$t);
	    afficherFonction($cptSsPage++, "", "<HR>", "option_ss_page", /*pref*/$t);

	    afficherFonction($cpt++, "onAjouteAvant()", CST_LIBELLE_INSERER_AVANT, "option_page", /*pref*/$t);
	    afficherFonction($cptSsPage++, "onAjouteAvantSsPage()", CST_LIBELLE_INSERER_AVANT_SSPAGE, "option_ss_page", /*pref*/$t);

	    afficherFonction($cpt++, "onAjouteFinDePage()", CST_LIBELLE_AJOUTER_FIN_PAGE, "option_page", /*pref*/$t);
	    afficherFonction($cptSsPage++, "onAjouteFinDeSsPage()", CST_LIBELLE_AJOUTER_FIN_SSPAGE, "option_ss_page", /*pref*/$t);
    	
    	afficherFonction($cpt++, "", "<HR>", "option_page", /*pref*/$t);
    	afficherFonction($cpt++, "onAjouteFinDeSsPage()", CST_LIBELLE_AJOUTER_FIN_SS_PAGE, "option_page", /*pref*/$t);
        
        if($_SESSION["sess_droitAdministration"])
        {
    	    afficherFonction($cpt++, "onProprietesFichier()", CST_LIBELLE_PROPRIETE_FICHIER, "option_page", /*pref*/$t);
    	    afficherFonction($cptSsPage++, "onProprietesFichier()", CST_LIBELLE_PROPRIETE_FICHIER, "option_ss_page", /*pref*/$t);
        }
    }
  	
	$t->set_block("arborescence", "LISTE_SOUS_PAGE", "liste_sous_page");
	$t->set_block("arborescence", "LISTE_PAGE", "liste_page");
	$t->set_block("arborescence", "FIN_DE_PAGE", "fin_de_page");
	
	if($_REQUEST["DROIT_MODIF"])
	{
        $t->set_var("LIBELLE_FIN_DE_PAGE", CST_LIBELLE_FIN_DE_PAGE);
	   $t->set_var("LIBELLE_AJOUTER_FICHIER", CST_LIBELLE_AJOUTER_FICHIER);
	}
	else
	{
		$t->set_var("LIBELLE_FIN_DE_PAGE", CST_LIBELLE_PAS_DE_FICHIER);
		$t->set_var("LIBELLE_AJOUTER_FICHIER", CST_LIBELLE_PAS_DE_FICHIER);
	}
	
	$t->set_var("LIBELLE_VISUALISER_FICHIER", CST_LIBELLE_VISUALISER_FICHIER);
	$t->set_var("MESSAGE_SUPP_FIC", CST_LIBELLE_MESSAGE_SUPPRIME_FICHIER);
	$t->set_var("LIBELLE_INDICE_HABITATION", CST_LIBELLE_INDICE_HABITATION);
	$t->set_var("LIBELLE_NIVEAU_HABITATION", CST_LIBELLE_NIVEAU_HABITATION);
	$t->set_var("LIBELLE_CLOISONNEMENT", CST_LIBELLE_CLOISONNEMENT);

	$t->set_var("PHPSESSID", session_id());
	
	$t->set_var("NB_FIN_DE_PAGE", count($tabStruListePage)+1);
	
	// si il n'y a pas de page on affiche juste la fin de page
	if(count($tabStruListePage) == 0)
	    $t->parse("fin_de_page", "FIN_DE_PAGE", true);
	else
	    $t->set_var("fin_de_page", "");
	
	// on boucle sur le nombre de pages et de sous pages pour récupérer les infos.
	for($a=0; $a<count($tabStruListePage);$a++)
	{
		$t->set_var("page", "page_".$tabStruListePage[$a]->wNumPage);
		
		if($tabStruListePage[$a]->wNumPage == 1 && $tabStruListePage[$a]->wNbSousPage > 0 && $tabStruListePage[$a]->wNumPage != count($tabStruListePage))
		    $t->set_var("posIcone", "plustop");
		else if($tabStruListePage[$a]->wNumPage == 1 && $tabStruListePage[$a]->wNbSousPage > 0 && $tabStruListePage[$a]->wNumPage == count($tabStruListePage))
		    $t->set_var("posIcone", "plusonly");
		else if($tabStruListePage[$a]->wNumPage == count($tabStruListePage) && $tabStruListePage[$a]->wNbSousPage > 0)
		    $t->set_var("posIcone", "plusbottom");
		else if($tabStruListePage[$a]->wNbSousPage > 0)
		    $t->set_var("posIcone", "plus");
		else if($tabStruListePage[$a]->wNumPage == 1 && $tabStruListePage[$a]->wNbSousPage == 0 && $tabStruListePage[$a]->wNumPage != count($tabStruListePage))
		    $t->set_var("posIcone", "jointop");
		else if($tabStruListePage[$a]->wNumPage == 1 && $tabStruListePage[$a]->wNbSousPage == 0 && $tabStruListePage[$a]->wNumPage == count($tabStruListePage))
		    $t->set_var("posIcone", "blank");
		else if($tabStruListePage[$a]->wNumPage == count($tabStruListePage) && $tabStruListePage[$a]->wNbSousPage == 0)
		    $t->set_var("posIcone", "joinbottom");
		else if($tabStruListePage[$a]->wNbSousPage == 0)
		    $t->set_var("posIcone", "join");
		
		// Pour l'affichage d'une icone suivant l'extension.
		$t->set_var("ICONE_PAGE", in_array($tabStruListePage[$a]->szExtension, $TAB_EXT_AVEC_ICONE) ? strtolower($tabStruListePage[$a]->szExtension) : "document"); 
		$t->set_var("POS_NUM_PAGE", $tabStruListePage[$a]->wNumPage);
		$t->set_var("NOM_FICHIER", "".$tabStruListePage[$a]->wNumPage." - ".$tabStruListePage[$a]->szNomFichierOriginal."");
		$t->set_var("EXTENSION_PAGE", $tabStruListePage[$a]->szExtension);
	    $t->set_var("NB_SS_PAGE", $tabStruListePage[$a]->wNbSousPage);
	    $t->set_var("SZ_INFO_PAGE", $_REQUEST["POS_NUM_DOC"]."|".$tabStruListePage[$a]->wNumPage."|0|".session_id()."|".$mode_Fichier."|".$tabStruListePage[$a]->szExtension);
	
		$t->set_var("liste_sous_page", "");
		if($tabStruListePage[$a]->wNbSousPage > 0)
		{
			$retour = pos_getlisteinfopage($jeton, $_REQUEST["POS_NUM_DOC"], $tabStruListePage[$a]->wNumPage, /*pref*/$tabStruListeSsPage);
			if (!$retour)
				debug ($jeton);	
		
			// pour chaque sous page on va appliquer le meme principe.
			for($b=0; $b<$tabStruListePage[$a]->wNbSousPage; $b++)
			{
        		if($tabStruListeSsPage[$b]->wNumSousPage == $tabStruListePage[$a]->wNbSousPage )
        		    $t->set_var("posIconeSsFic", "joinbottom");
        		else
        		    $t->set_var("posIconeSsFic", "join");
		    
				$t->set_var("ss_page", "ss_page_".$tabStruListePage[$a]->wNumPage."_".$tabStruListeSsPage[$b]->wNumSousPage);
			
				$t->set_var("POS_NUM_PAGE", $tabStruListePage[$a]->wNumPage);
				$t->set_var("POS_NUM_SS_PAGE", $tabStruListeSsPage[$b]->wNumSousPage);
				$t->set_var("NOM_SOUS_FICHIER", "".$tabStruListePage[$a]->wNumPage.".".$tabStruListeSsPage[$b]->wNumSousPage." - ".$tabStruListeSsPage[$b]->szNomFichierOriginal."");
			    $t->set_var("ICONE", in_array($tabStruListeSsPage[$b]->szExtension, $TAB_EXT_AVEC_ICONE) ? strtolower($tabStruListeSsPage[$b]->szExtension) : "document");
                $t->set_var("EXTENSION_SS_PAGE", $tabStruListeSsPage[$b]->szExtension);
			    $t->set_var("SZ_INFO_SS_PAGE", $_REQUEST["POS_NUM_DOC"]."|".$tabStruListePage[$a]->wNumPage."|".$tabStruListeSsPage[$b]->wNumSousPage."|".session_id()."|".$mode_Fichier."|".$tabStruListeSsPage[$b]->szExtension);
			
				$t->parse("liste_sous_page", "LISTE_SOUS_PAGE", true);
                
                $t->set_var("NUM_PAGE_SOUS_PAGE", $tabStruListePage[$a]->wNumPage."_".$tabStruListeSsPage[$b]->wNumSousPage);
		        $t->set_var("INFO_CONF_PAGE", $tabStruListeSsPage[$b]->wIndConf."|".$tabStruListeSsPage[$b]->wNivConf."|".$tabStruListeSsPage[$b]->szCloison);

                $t->parse("bloc_info_conf_page", "BLOC_INFO_CONF_PAGE", true);
			}
		}
	
		$t->parse("liste_page", "LISTE_PAGE", true);
        
        $t->set_var("NUM_PAGE_SOUS_PAGE", $tabStruListePage[$a]->wNumPage."_".$tabStruListePage[$a]->wNumSousPage);
		$t->set_var("INFO_CONF_PAGE", $tabStruListePage[$a]->wIndConf."|".$tabStruListePage[$a]->wNivConf."|".$tabStruListePage[$a]->szCloison);
        $t->parse("bloc_info_conf_page", "BLOC_INFO_CONF_PAGE", true);
	}
	$t->set_var("POS_NUM_PAGE", count($tabStruListePage)+1);
	
	
    $t->set_var("LIBELLE_FERMER", CST_LIBELLE_FERMER);
    $t->set_var("LIBELLE_AJOUTER", CST_LIBELLE_AJOUT_FICHIER);
    $t->set_var("LIBELLE_VALIDER", CST_LIBELLE_VALIDER);
    $t->set_var("LIBELLE_POSITION", CST_LIBELLE_POSITION);
    $t->set_var("DEFAULT_NATURE", CST_LIBELLE_NATURE_PAR_DEFAUT);
    $t->set_var("MESSAGE_NO_AFFECTE_NATURE", CST_LIBELLE_MESSAGE_NO_AFFECTE_NATURE);
    
    $t->set_var("ACTION", URL_ACTION_FICHIER."?POS_NUM_DOC=".$_REQUEST["POS_NUM_DOC"]."&MODE=".$_REQUEST["MODE"]."&POS_TYPEDOC=".$_REQUEST["POS_TYPEDOC"]);
    	
    $t->set_block("arborescence", "NATURE_EXTENSION", "nature_extension");
    $t->set_block("arborescence", "LISTE_NATURE", "liste_nature");
    $t->set_block("arborescence", "BLOC_ACTION", "bloc_action");
    	
    if($_REQUEST["MODE"] == "MODIFICATION")
    {
        $cpt = 0;
        foreach($tabNatures as $key => $value)
        {
            for($i=0; $i< count($value); $i++)
            {
                $t->set_var("EXTENSION", $value[$i]);
                $t->set_var("NATURE", $key);
                $t->set_var("CPT", $cpt++);
                $t->parse("nature_extension", "NATURE_EXTENSION", true);
            }
        }
        // cas ou l'utilisateur peut supprimer (le mode n'est pas CONSULTATION)
        // mais pas modifier.
        $t->set_var("DEB_COM_VALIDER", ($_REQUEST["DROIT_MODIF"])? "":"<!--");
        $t->set_var("FIN_COM_VALIDER", ($_REQUEST["DROIT_MODIF"])? "":"-->");

		// récupération de la liste des natures de page et affichage dans une combo.
		$retour = pos_getlistnatures($jeton, /*pref*/$tabLstNat);
		
		// on tri le tableau pour proposer les natures dans l'ordre alpha.
		asort($tabLstNat);
		if ($retour)
		{
			$keys = array_keys($tabLstNat);
			for ($i=0; $i<count ($tabLstNat); $i++)
			{
				$t->set_var("POS_CODE_NATURE", $keys[$i]);
				$t->set_var("POS_LIBELLE_NATURE", $tabLstNat[$keys[$i]]);
				$t->parse("liste_nature", "LISTE_NATURE", true);
			}
			
		}
		else
			debug ($jeton);
        
        // affichage des niveaux de confidentialité
        $tabLstNivConf = array();
    	$retour = pos_getlistnivconf($jeton, /*pref*/$tabLstNivConf);
        if ($retour)
    	{
    		$keys = array_keys($tabLstNivConf);
    		for ($i=0; $i<count ($tabLstNivConf); $i++)
    		{
                //echo "i : $i";
    			$t->set_var("POS_CODE_CONF_HAB", $i);
    			$t->set_var("POS_LIBELLE_CONF_HAB", $tabLstNivConf[$keys[$i]]);
                $t->parse("liste_niv_conf", "LISTE_NIV_CONF", true);
    		}
    	}
    	else
    		debug ($jeton);
        $t->parse("bloc_action", "BLOC_ACTION", true);
	}
		
	$t->parse("MyOutput", "arborescence");
	$t->p("MyOutput");
	
	pos_disconnect($jeton);
}	
else
{
	debug($jeton);
	echec_connexion();
}

function afficherFonction($iCompteur, $szFonction, $szLibelle, $szBlocLowerCase, &$t)
{
    $t->set_var("CPT", $iCompteur);
    $t->set_var("FONCTION", $szFonction);
    $t->set_var("LIBELLE_FONCTION", $szLibelle);
    $t->parse($szBlocLowerCase, strtoupper($szBlocLowerCase), true);
}
?>
