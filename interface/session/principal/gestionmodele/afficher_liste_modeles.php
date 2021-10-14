<?php
/* 
 * Affichage de la liste des modèles pour les macros word
 * PL : 19/12/2008
 */ 
if (!isset($_SESSION))                                                                                                    
    session_start();                                                                                  
include ("../include/connexion.inc.php");
include ("../include/debug.inc.php");
include ("../include/template.inc.php");
include ("../../../../configuration_w/constantesPHP.conf.php");
include ("../../../../configuration/label_".$_SESSION["sess_langue"].".conf");
include ("../../../../configuration/url.conf.php");

$retour = connexion($jeton);

if ($retour)
{
    if ($_SESSION["sess_droitAdminUtilisateur"] == false)
	{
		echo CST_LIBELLE_NO_ADMIN_USER;
	}
	else
	{
		// Affichage
		$t = new template(REP_TEMPLATE_APPLICATIF."modele");
		$t->set_File("liste_modeles", "liste_modeles.tpl");
	
		$t->set_var("TITRE_PAGE", CST_TITRE_PAGE_GESTION_MODELE);
		$t->set_var("LIBELLE_MODELE", CST_LIBELLE_MODIF_MODELE);		
		$t->set_var("POS_PHPSESSID", session_id());
		$t->set_var("POS_MODE", "MODIFICATION");
        $t->set_var("LIBELLE_AJOUTER", CST_LIBELLE_AJOUTER);
        $t->set_var("LIBELLE_MODIFIER", CST_LIBELLE_MODIF);
        $t->set_var("LIBELLE_SUPPRIMER", CST_LIBELLE_SUPP);
        $t->set_var("LIBELLE_CONSULTER", CST_LIBELLE_CONSULT);
        $t->set_var("LIBELLE_FERMER", CST_LIBELLE_FERMER);
		$t->set_block("liste_modeles", "BLOC_MODELE", "bloc_modele");
        $t->set_block("liste_modeles", "BLOC_TAB_MODELE", "bloc_tab_modele");
		$i=0;				
		$szPath = CST_REP_MODELES;
		if ($handle = opendir($szPath)) {
	        while (false !== ($file = readdir($handle))) {
		     	$pos = strrpos($file, ".");
                if ($pos !== false) {
                    $extension = substr($file, $pos + 1);        
                }
                
		     	if ((strcmp($file,".") !=0) && (strcmp($file,"..") !=0)
				 	&& (strcasecmp($extension, "dot") == 0 || strcasecmp($extension, "rtf") == 0  || strcasecmp($extension, "docx") == 0)) {		     		
		     		$t->set_var("POS_EXTENSION", $extension);
					$t->set_var("POS_NOM_MODELE", $file);
                    $t->set_var("VALUE_RADIO_MODELE", "POS_NOM_MODELE=$file&PHPSESSID=".session_id()); 
                    $t->set_var("PAIR_OU_IMPAIR", (($i++ % 2) == 0) ? "pair" : "impair");	
		     		$t->parse("bloc_modele", "BLOC_MODELE",true);
                    $t->parse("bloc_tab_modele", "BLOC_TAB_MODELE",true);   
		     	}
		    }
            $t->pparse("MyOutput", "liste_modeles");
            closedir($handle);
        }
        else
        {
            $tabMsgError = error_get_last();
            $tabError = array();
            $tabError[] = $tabMsgError["message"];
            debug_code($tabError);
        }
	}
}
else
	{
	debug($jeton);
	echec_connexion();
	}	 
?>
