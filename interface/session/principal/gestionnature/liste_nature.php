<?php
/* 
 * Gestion des natures
 *
 * Patrick Legaigneur 23/02/2011
 *
 */
if (!isset($_SESSION))
    session_start();
include ("../include/connexion.inc.php");
include ("../include/debug.inc.php");
include ("../include/template.inc.php");
include ("../../../../configuration_w/constantesPHP.conf.php");
include ("../../../../configuration/label_".$_SESSION["sess_langue"].".conf");
include ("../../../../configuration/label_admin_".$_SESSION["sess_langue"].".conf");
include ("../../../../configuration/url.conf.php");

$retour = connexion($jeton);
if ($retour)
{
	// vérification du droit à gérer les natures de fichier
	if ($_SESSION["sess_droitAdministration"] == false)
	{	
		afficheMsg(CST_LIBELLE_NO_ADMINISTRATION);
	}
	else
	{
		// Requête de récupération des natures de fichier
		$retour = pos_getlistnatures($jeton, /*pref*/$tabLstNat);
				
		if ($retour)
		{
		    $cletri = "CODE_NATURE";
			if(isset($_REQUEST['POS_TRI_COL']))
		      $cletri = $_REQUEST['POS_TRI_COL'];
			
			// tri par libelle
			if (strcmp($cletri, "LIBELLE_NATURE") == 0)
                asort ($tabLstNat);
            // tri sur les codes
            else
                ksort ($tabLstNat);
        
			// Affichage
			$t = new Template(".");	
			$t->set_File("nature", REP_TEMPLATE_APPLICATIF."gestionnature/liste_nature.tpl");	
			$t->set_var("TITRE_PAGE", CST_LIBELLE_TOOLBAR_GEST_NATURE);			
			$t->set_block("nature", "BLOC_NATURE", "bloc_nature");
						
			// affichage de l'icone indiquant la clé du tri
			$t->set_var("TRI_CODE", strcmp($cletri, "CODE_NATURE") == 0 ? "1" : "0");
			$t->set_var("TRI_LIBELLE", strcmp($cletri, "LIBELLE_NATURE") == 0 ? "1" : "0");
			$t->set_var("LIBELLE_CODE_NATURE", CST_LIBELLE_CODE_NATURE);
			$t->set_var("LIBELLE_LIBELLE_NATURE", CST_LIBELLE_LIBELLE_NATURE);			
			$t->set_var("LIBELLE_MODIFIER", CST_LIBELLE_MODIF);
			$t->set_var("LIBELLE_AJOUTER", CST_LIBELLE_AJOUTER);
			$t->set_var("LIBELLE_SUPPRIMER", CST_LIBELLE_SUPP);	 
			$t->set_var("DROIT_ADMINISTRATION", ($_SESSION["sess_droitAdministration"])?1:0);
			$t->set_var("MESSAGE_NO_ADMINISTRATION", CST_LIBELLE_NO_ADMINISTRATION);		
			$t->set_var("MESSAGE_SELECT_NATURE", CST_LIBELLE_SELECT_NATURE);
			$t->set_var("MESSAGE_SUPP_NATURE", CST_LIBELLE_SUPP_NATURE);
			
			$t->set_var("LIEN_ACTUALISATION", URL_LIST_NATURE);
			$i=0;
			foreach($tabLstNat as $codeNature=> $libelleNature)
    		{
				$szInfoNature = "POS_CODE_NATURE=".urlencode(addslashes(trim($codeNature)))."&POS_LIBELLE_NATURE=".urlencode(addslashes(trim($libelleNature)));
				$t->set_var("POS_INFO_NATURE", $szInfoNature);
				$t->set_var("POS_CODE_NATURE", $codeNature);
				$t->set_var("POS_LIBELLE_NATURE", $libelleNature);
                $t->set_var("PAIR_OU_IMPAIR", (($i++ % 2) == 0) ? "pair" : "impair");				
				$t->parse("bloc_nature", "BLOC_NATURE", true);
			}
			
			$t->pparse("MyOutput", "nature");
		}
		else
			debug($jeton);
	}			
	pos_disconnect($jeton);

}
else
{
	debug($jeton);
	echec_connexion();
}
?>