<?php

include ("../include/locution.inc.php");
if (!isset($_SESSION))
session_start();
include ("../include/connexion.inc.php");
include ("../include/template.inc.php");
include ("../include/debug.inc.php");
include ("../include/get_infoparam.php");
include ("../../../../configuration_w/constantesPHP.conf.php");
include ("../../../../configuration/label_".$_SESSION["sess_langue"].".conf");
include ("../../../../configuration/url.conf.php");

if (!isset($_REQUEST["POS_TYPEDOC"]))
{
	afficheMsg(CST_LIBELLE_SEARCH_CLE_CHOOSE_DOC);
	exit;
}

//connexion à poseidon
$retour = connexion($jeton);
if ($retour)
{   
	$file_tpl = REP_TEMPLATE_APPLICATIF."recherche/recherche_cle.tpl";
	
	$sTypeDoc = $_REQUEST["POS_TYPEDOC"];
	$t = new Template(".");
	$t->set_File("recherche", $file_tpl);
	
	$t->set_var("POS_TYPEDOC", $sTypeDoc);
	$t->set_var("URL_RECH_VOCAB_CLE", URL_AFFICHER_VOCAB_KH);
    $t->set_var("URL_AFF_RECH_CLE_HIER_FRM1", URL_AFF_RECH_CLE_HIER_FRM1);
    $t->set_var("URL_ACTION_FORM", URL_RESULTAT);
	$t->set_var("URL_ATTENTE", URL_ATTENTE_RECHERCHE);
	
	// Définition des blocs.
	$t->set_block("recherche", "BLOC_ZONES", "bloc_zones");
	$t->set_block("recherche", "LIBELLES_ZONES", "libelles_zones");
	
	$t->set_var("LIBELLE_RECHERCHER", CST_LIBELLE_RECHERCHER);
	$t->set_var("LIBELLE_EFFACER", CST_LIBELLE_EFFA);
	$t->set_var("LIBELLE_KH", CST_LIBELLE_KH);
	$t->set_var("LIBELLE_FERMER", CST_LIBELLE_FERMER);
	$t->set_var("TITRE_RECHERCHE", CST_LIBELLE_TOOLBAR_RECH_CLE);
    $t->set_var("MSG_KH_ZONES_DS_ORDRE", CST_MSG_KH_ZONES_DS_ORDRE);
    $t->set_var("MSG_KH_AU_MOINS1ZONE", CST_MSG_KH_AU_MOINS1ZONE);
    
	$t->set_var("LANGUE", $_SESSION["sess_langue"]);
	
	// Recherche du paramétrage de la K H.
	$retour = get_infotypecache($jeton, $_REQUEST["POS_TYPEDOC"], /*pref*/$objInfoType, /*pref*/$tabInfoZonesKeys);	
	
	// Nombre de zone.
	$t->set_var("NB_ZONE_TT", $objInfoType->kh_nbzones);
	
	if ($retour)
	{
		// Initialisation de variable.
		$decalage="";

		if (isset($_REQUEST["INUMQUEST"]))
			$varTmpSzValCle = isset($_SESSION["sess_tabHistQuest"][0][$_REQUEST["INUMQUEST"]][0]->szValeur1) ? $_SESSION["sess_tabHistQuest"][0][$_REQUEST["INUMQUEST"]][0]->szValeur1 : "";
		else
			$varTmpSzValCle = "";
		
		for($i=0;$i<$objInfoType->kh_nbzones;$i++)
		{
			// Nom de la zone.
			$t->set_var("ZONE", "ZONE_".$i);

			if($i==0)
				$t->set_var("SEPARATEUR", "");
			else
			{
				// Affichage du separateur entre les zones.
				$t->set_var("SEPARATEUR", " / ");
			}


			// Recherche du type de la rub lié.
			if($tabInfoZonesKeys[$sTypeDoc][$i]->kh_zone_coderublien)
			{
				$retour=pos_getinforub($jeton, $tabInfoZonesKeys[$sTypeDoc][$i]->kh_zone_coderublien, /*pref*/$objInfoOneRub);
				if($retour)
				{
					$t->set_var("TYPE", $objInfoOneRub->typerub);
				}
				else
					debug($jeton);
			}
			
			$t->set_var("LONGUEUR", $tabInfoZonesKeys[$sTypeDoc][$i]->kh_zone_lg);
			$t->set_var("LIBELLE", $tabInfoZonesKeys[$sTypeDoc][$i]->kh_zone_libelle);
			$t->set_var("POS_VALEUR_ZONE", substr($varTmpSzValCle,0,$tabInfoZonesKeys[$sTypeDoc][$i]->kh_zone_lg));
            $varTmpSzValCle = substr($varTmpSzValCle,$tabInfoZonesKeys[$sTypeDoc][$i]->kh_zone_lg,strlen($varTmpSzValCle));
			$t->parse("libelles_zones", "LIBELLES_ZONES", true);	
			$t->parse("bloc_zones", "BLOC_ZONES", true);
		}
	}
	else
		debug($jeton);
		
	$t->pparse("MyOutput", "recherche");
	
	// Déconnexion poseidon.
	pos_disconnect($jeton);
}
else
{
	debug($jeton);
	echec_connexion();
}

?>