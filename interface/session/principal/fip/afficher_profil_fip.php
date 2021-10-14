<?php
/* 
 * Affichage des profils de fiches paramétrées
 * 
 *
 * Patrick Legaigneur 08/12/2012
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
		// Profil fiche d'index											
		$retour = pos_gestprofil($jeton, PHP_VULCAIN_GET, PHP_VULCAIN_PROFIL_FIP, /*pref*/$iNbProfils, /*pref*/$szListeProfilIndex);
		if ($retour)
		{	
			$iNbProfils = 0;
			if ($iNbProfils > 0)
			{
				$tabTousProfilsIndex = explode("\x02", trim($szListeProfilIndex, "\x02"));
				array_unshift($tabTousProfilsIndex, "");
				for($j=0; $j<count($tabTousProfilsIndex); $j++)
				{
					echo $tabTousProfilsIndex[$j]."<br>";
	// 				$t->set_var("PROFIL_INDEX", $tabTousProfilsIndex[$j]);
	// 				if (isset($tabInfoProfil[0]->szProfilFIP) && (strcmp($tabTousProfilsIndex[$j], trim($tabInfoProfil[0]->szProfilFIP)) == 0))
	// 				{								
	// 					$t->set_var("TOUS_PROFIL_INDEX_SELECTED", "selected");
	// 				}
	// 				else
	// 					$t->set_var("TOUS_PROFIL_INDEX_SELECTED", "");
	// 					
	// 				$t->parse("bloc_tous_profils_index", "BLOC_TOUS_PROFILS_INDEX",true);
				}
			}
			else
			{
				include("./afficher_modif_fip.php");
			}
		}
		else
			debug($jeton);
			
// 			// Affichage
// 		$t = new Template(".");
// 	
// 		$t->set_File("fip", REP_TEMPLATE_APPLICATIF."fip/fip.tpl");
// 		$t->set_var("LIBELLE_VALIDER", CST_LIBELLE_VALIDER);
// 	    
// 				
// 		$t->set_block("fip", "BLOC_RUB_FIP", "bloc_rub_fip");
// 		
// 		$t->set_var("POS_CODE_TYPEDOC", $_REQUEST['POS_CODE_TYPEDOC']);
// 		
// 		$tabToutesRubriques = array();
// 		$retour = pos_getrubriquetype($jeton, $_REQUEST['POS_CODE_TYPEDOC'], /*pref*/$tabRubriqueInType);
// 		if (!$retour)	
// 			debug($jeton);
// 					  
// 	  $t->pparse("MyOutput", "fip");
						
	}			
	pos_disconnect($jeton);

}
else
{
	debug($jeton);
	echec_connexion();
}
?>
