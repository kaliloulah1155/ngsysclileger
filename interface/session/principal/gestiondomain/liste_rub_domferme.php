<?php
/* 
 * Gestion des domaines fermés normaux 
 *
 * Patrick 13/08/2007
 *
 * Données en entrée :
 *
 * PL 04/2011  
 * Modification pour domaines fermés non alphanumériques   
 *
 */
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
	if ($_SESSION["sess_droitGestDomainFerme"] == false && $_SESSION["sess_droitAdministration"] == false)
	{	
		echo CST_LIBELLE_NO_ADMIN_DOMFERME;
	}
	else
	{
		$retour = pos_getrubrique($jeton, "", /*pref*/$tabInfoRub);
	
		if($retour)
		{
			// Affichage
			$t = new Template(".");
			$iDroitAdminDomFerme = 0;
			if ($_SESSION["sess_droitAdministration"] || $_SESSION["sess_droitGestDomainFerme"])
				$iDroitAdminDomFerme = 1;
			$t->set_File("rub_domferme", REP_TEMPLATE_APPLICATIF."gestiondomain/liste_rub_domferme.tpl");
			$t->set_var("TITRE_PAGE", CST_LIBELLE_TOOLBAR_GEST_DOMAIN);
			$t->set_var("DROIT_ADMIN_DOMFERME", $iDroitAdminDomFerme);
			$t->set_var("LIBELLE_NO_ADMIN_USER", CST_LIBELLE_NO_ADMIN_DOMFERME); 
			$t->set_var("MESSAGE_SELECT_RUB", CST_LIBELLE_SELECT_RUB);
			$t->set_var("LIBELLE_CODE_RUB", CST_LIBELLE_CODE_RUB);
			$t->set_var("LIBELLE_LIBELLE_RUB", CST_LIBELLE_LIBELLE_RUB);
			$t->set_var("LIBELLE_MODIFIER", CST_LIBELLE_MODIF);
			
			$t->set_block("rub_domferme", "BLOC_RUB_DOMFERME", "bloc_rub_domferme");
			$k = 0;
			for($i=0;$i<count($tabInfoRub);$i++) {
				// 1 : Domaine fermé normal, 3:Requête LDAP, 4:Profil utilisateur
				//if($tabInfoRub[$i]->domferme == 1 || $tabInfoRub[$i]->domferme == 3 || $tabInfoRub[$i]->domferme == 4)
				if($tabInfoRub[$i]->wDomFerme == 1)
				{
					// pour les rubriques de type entier (wTypeRub = 1), date (wTypeRub = 2), décimal (wTypeRub= 4)
					// seule le libelle du domaine fermé que l'on renommera "Valeur finie" est visible et modifiable.
					// Un code est associée à la valeur. C'est un compteur. A chahe ajout/suppression de valeur, les valeurs sont triées et 
					// le code compteur réassocié
					if($tabInfoRub[$i]->wTypeRub == 1 || $tabInfoRub[$i]->wTypeRub == 2 || $tabInfoRub[$i]->wTypeRub == 4)	
						$iDomfermeNonAlphanum = $tabInfoRub[$i]->wTypeRub;										
					else					
						$iDomfermeNonAlphanum = "0";
									
					$szIdentRub = "POS_CODE_RUB=".urlencode(addslashes(trim($tabInfoRub[$i]->szRubrique)));
					$szIdentRub .= "&POS_LIBELLE_RUB=".urlencode(addslashes(trim($tabInfoRub[$i]->szNomRub)));
					$szIdentRub .= "&POS_DOMFERME_NON_ALPHANUM=".$iDomfermeNonAlphanum;
					
					$t->set_var("POS_IDENT_RUB",$szIdentRub);
					$t->set_var("POS_CODE_RUB", $tabInfoRub[$i]->szRubrique);
					$t->set_var("POS_LIBELLE_RUB", $tabInfoRub[$i]->szNomRub);
                    $t->set_var("PAIR_OU_IMPAIR", (($k % 2) == 0) ? "pair" : "impair");
					$t->parse("bloc_rub_domferme", "BLOC_RUB_DOMFERME",true);
					$k++;
				}
            }
			$t->pparse("MyOutput", "rub_domferme");
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
