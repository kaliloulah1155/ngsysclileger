<?php
/* 
 * Gestion listes hiérarchiques 
 *
 * Patrick 2/01/2008
 *
 * Données en entrée :
 *
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
	if ($_SESSION["sess_droitGestListHier"] == false && $_SESSION["sess_droitAdministration"] == false)
	{	
		echo CST_LIBELLE_NO_ADMIN_LISTHIER;
	}
	else
	{
		// Requête de récupération des listes hiérarchiques
		$retour = pos_getlisteinfo($jeton, 26, /*pref*/$tabLstHier);
		if($retour)
		{
			// Affichage
			$t = new Template(".");
	
			$t->set_File("listhier", REP_TEMPLATE_APPLICATIF."gestionlisthier/liste_listhier.tpl");
			$t->set_var("TITRE_PAGE", CST_LIBELLE_TOOLBAR_GEST_LISTHIER);
			
			$iDroitListHier = 0;
			if ($_SESSION["sess_droitAdministration"] || $_SESSION["sess_droitGestListHier"])
				$iDroitListHier = 1;
			$t->set_var("DROIT_ADMIN_LISTHIER", $iDroitListHier);
			$t->set_var("LIBELLE_NO_ADMIN_LISTHIER", CST_LIBELLE_NO_ADMIN_LISTHIER); 
			$t->set_var("MESSAGE_SELECT_LISTHIER", CST_LIBELLE_SELECT_LISTHIER);
			$t->set_var("LIBELLE_CODE_LISTHIER", CST_LIBELLE_CODE_LISTHIER);
			$t->set_var("LIBELLE_LIBELLE_LISTHIER", CST_LIBELLE_LIBELLE_LISTHIER);
			$t->set_var("LIBELLE_MODIFIER", CST_LIBELLE_MODIF);
			$t->set_var("LIBELLE_AJOUTER", CST_LIBELLE_AJOUTER);
			$t->set_var("LIBELLE_SUPPRIMER", CST_LIBELLE_SUPP);
			$t->set_var("LIBELLE_ANNULER", CST_LIBELLE_ANNULER);
			$t->set_var("LIBELLE_VALIDER", CST_LIBELLE_VALIDER);
			$t->set_var("LIBELLE_NOUVELLE_LISTEHIER", CST_NOUVELLE_LISTHIER);
			$t->set_var("LIBELLE_CODE_NEW_LISTEHIER", CST_LIBELLE_CODE_LISTHIER);
			$t->set_var("LIBELLE_LIBELLE_NEW_LISTEHIER", CST_LIBELLE_LIBELLE_LISTHIER);
			$t->set_var("CST_MSG_SELECT_NODE_LISTHIER", CST_MSG_SELECT_NODE_LISTHIER);
			$t->set_var("CST_MSG_SAISIR_LIBELLE_NOEUD", CST_MSG_SAISIR_LIBELLE_NOEUD);
			$t->set_var("CST_MSG_ERR_MODIFIER_NOM_LISTE", CST_MSG_ERR_MODIFIER_NOM_LISTE);
			$t->set_var("CST_MSG_NOEUD_FILS_EXIST", CST_MSG_NOEUD_FILS_EXIST);
            $t->set_var("CST_MESSAGE_SUPP_LISTEHIER", CST_MESSAGE_SUPP_LISTEHIER);
			$t->set_block("listhier", "BLOC_LISTHIER", "bloc_listhier");
			$i=0;
			foreach ($tabLstHier as $key => $value) {
				$szIdentListhier = "POS_CODE_LISTHIER=".urlencode(addslashes(trim($key)));
				$szIdentListhier .= "&POS_LIBELLE_LISTHIER=".urlencode(addslashes(trim($value)));
					
				$t->set_var("POS_IDENT_LISTHIER",$szIdentListhier);
				$t->set_var("POS_CODE_LISTHIER", $key);
				$t->set_var("POS_LIBELLE_LISTHIER", $value);
                $t->set_var("PAIR_OU_IMPAIR", (($i++ % 2) == 0) ? "pair" : "impair");	
				$t->parse("bloc_listhier", "BLOC_LISTHIER",true);
			}
		
			$t->pparse("MyOutput", "listhier");
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
