<?php
/*
* DESCRIPTION : Gestion des Profils de LR (choix du type de doc)
* 
* AUTEUR: Sébastien Costanzo
*
* DATE DE CREATION: 20.11.03
*
*/ 

include ("../include/connexion.inc.php");
include ("../include/template.inc.php");
include ("../include/debug.inc.php");
session_start();
include ("../../../../configuration_w/constantesPHP.conf.php");
include ("../../../../configuration/label_".$_SESSION["sess_langue"].".conf");
include ("../../../../configuration/url.conf.php");

//connexion à poseidon
$retour = connexion($jeton);
if ($retour)
{
    //on récupère les types de documents
    $retour = pos_getlistalltypes($jeton, /*pref*/$tabLstTypDoc);
    if (!$retour)
    	debug($jeton);
    else
    {
        //echo "<br><b>tabLstTypDoc : </b>";
        //print_r($tabLstTypDoc);
        
		// on definit le template utilisé  
		$t = new template(REP_TEMPLATE_APPLICATIF."profillr");
		$t->set_file("type", "select_type.tpl");
		$t->set_block("type","BLOC_TYPE","bloc_type");

		$t->set_var("ACTION", URL_AFFICHE_MODIF_PROFIL_LR);
		$t->set_var("URL_ANNULER", URL_AFFICHE_GEST_PROFIL_LR);
		
		$t->set_var("LIBELLE_ANNULER", CST_LIBELLE_ANNULER);
		$t->set_var("LIBELLE_VALIDER", CST_LIBELLE_VALIDER_PROFIL);
		
		$t->set_var("LIBELLE_CHOIX", CST_LIBELLE_CHOIX_TYPE);
		$t->set_var("LIBELLE_TOUS_TYPES", CST_LIBELLE_TOUS_TYPES);
		
		asort($tabLstTypDoc);
		while (list($key, $val) = each($tabLstTypDoc))
		{
			$t->set_var("POS_CODE_TYPE", $key);
			$t->set_var("POS_LIBELLE_TYPE", $val);
			
			$t->parse("bloc_type","BLOC_TYPE",true);
		}
	 
		// affichage du template
		$t->pparse("Output", "type");
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