<?php
/*
 * DESCRIPTION : Affichage des utilisateurs connectes
 * AUTEUR : Gabrielle Guy
 * DATE de CREATION : 27/03/2006
 *
 * 
 * 
 * DATE DE MODIFICATION : 21/01/2011 
 * DESCRIPTION : tri par entête de colonne
 * Donnees en entree : POS_TRI_COL 
 * AUTEUR : Patrick Legaigneur
 */
if (!isset($_SESSION)) 
session_start();

include ("../include/connexion.inc.php");
include ("../include/debug.inc.php");
include ("../include/liste_resumee.inc.php");
include ("../include/template.inc.php");
include ("../../../../configuration_w/constantesPHP.conf.php");
include ("../../../../configuration/label_".$_SESSION["sess_langue"].".conf");
include ("../../../../configuration/url.conf.php");

function makeTri_lposte($szTri, $tabAffiche)
{
	$tabTmp=array();
	$tabTmpFinal=array();
	for($i=0; $i<count($tabAffiche); $i++)
	{
		if(strcmp($szTri,CST_LIBELLE_TYPE_CONNEXION)==0)
			$tabTmp[$i]=$tabAffiche[$i]->szType;
		elseif(strcmp($szTri,CST_LIBELLE_PROCESSUS)==0)
			$tabTmp[$i]=$tabAffiche[$i]->iNumProcess;
		elseif(strcmp($szTri,CST_LIBELLE_NUMERO_SESSION)==0)
			$tabTmp[$i]=$tabAffiche[$i]->iNumSession;
		elseif(strcmp($szTri,CST_LIBELLE_NOM_APPLICATION)==0)
			$tabTmp[$i]=$tabAffiche[$i]->szApplication;
		elseif(strcmp($szTri,CST_LIBELLE_CODE_UTILISATEUR)==0)
			$tabTmp[$i]=$tabAffiche[$i]->szCodeUtilisateur;
		elseif(strcmp($szTri,CST_LIBELLE_ADRESSE_IP)==0)
			$tabTmp[$i]=$tabAffiche[$i]->szAdresseIP;
		elseif(strcmp($szTri,CST_LIBELLE_POSTE_CLIENT)==0)
			$tabTmp[$i]=$tabAffiche[$i]->szPosteClient;
		elseif(strcmp($szTri,CST_LIBELLE_DATE_HEURE)==0)
			$tabTmp[$i]=$tabAffiche[$i]->szDateHeure;
	}

	asort($tabTmp);
	
	// on reconstruit le tableau dans l'ordre.
	while (list($key, $val) = each($tabTmp))
	{
		$tabTmpFinal[]=$tabAffiche[$key];
	}
	
	return $tabTmpFinal;
}

class Connexion 
{
	var $szType;
	var $iNumProcess;
	var $iNumSession;
	var $szApplication;
	var $szCodeUtilisateur;
	var $szAdresseIP;
	var $szPosteClient;
	var $szDateHeure;
	
	function __construct($szType, $iNumProcess, $iNumSession, $szApplication, $szCodeUtilisateur, $szAdresseIP, $szPosteClient, $szDateHeure)
	{
		$this->szType=$szType;
		$this->iNumProcess=$iNumProcess;
		$this->iNumSession=$iNumSession;
		$this->szApplication=$szApplication;
		$this->szCodeUtilisateur=$szCodeUtilisateur;
		$this->szAdresseIP=$szAdresseIP;
		$this->szPosteClient=$szPosteClient;
		$this->szDateHeure=$szDateHeure;
	}
}


$retour = connexion($jeton);
if ($retour)
{	
	$tabLigneConnexion = array();
	$retour = pos_getlposteconnexion($jeton,/*pref*/$tabLigneConnexion);
	if (!$retour)
		debug($jeton);
	else 
	{
		$szTplName = REP_TEMPLATE_APPLICATIF."lposte/lposte.tpl";
		$t = new template(".");
		$t->set_file("lr", $szTplName);
		$t->set_block("lr", "ENTETE", "entete");
		$t->set_block("lr", "LISTE_REPONSES", "listereponses");
		$t->set_block("lr", "BOUTON", "bouton");
		$t->set_var("TITRE_PAGE", CST_TITRE_SESSION_UTILISATEUR);
		$t->set_var("LIEN_ACTUALISATION", URL_AFFICHE_CONNEXION);
		$t->set_var("MESSAGE_SELECT_SESSION", CST_LIBELLE_SELECT_SESSION);
		
			// tri des objets connexions
		if(isset($_REQUEST['POS_TRI_COL']))
		{
			$cletri = $_REQUEST['POS_TRI_COL'];
		}		
		else
			$cletri = CST_LIBELLE_TYPE_CONNEXION;
		$szObjImg = "<IMG SRC='".URL_SITE."/images/icons/tri_lr_1.png' border=0 align=center>";
		
		for($i=0;$i<8;$i++) {
			$szCleColonne = "";
			$szTitreColonne= "";
			switch ($i) {
				case 0:
					$szCleColonne = CST_LIBELLE_TYPE_CONNEXION;break;
				case 1:
					$szCleColonne = CST_LIBELLE_PROCESSUS;break;
				case 2:
					$szCleColonne = CST_LIBELLE_NUMERO_SESSION;break;
				case 3:
					$szCleColonne = CST_LIBELLE_NOM_APPLICATION;break;
				case 4:
					$szCleColonne = CST_LIBELLE_CODE_UTILISATEUR;break;
				case 5:
					$szCleColonne = CST_LIBELLE_ADRESSE_IP;break;
				case 6:
					$szCleColonne = CST_LIBELLE_POSTE_CLIENT;break;
				case 7:
					$szCleColonne = CST_LIBELLE_DATE_HEURE;break;
			}
			if (strcmp($cletri,$szCleColonne) == 0)
				$szTitreColonne=$szCleColonne."&nbsp;".$szObjImg;
			else 
				$szTitreColonne=$szCleColonne;
			$t->set_var("CLE_COLONNE", $szCleColonne);
			$t->set_var("LIBELLE_TITRE_COLONNE", $szTitreColonne);
			$t->parse("entete", "ENTETE", true);
		}

		// Création des objets connexions
		$tabObjectConnexion = array();
		for ($i=0;$i<count($tabLigneConnexion);$i++)
		{
			$tabChamps = extraireChampsLR($tabLigneConnexion[$i], "\x02");
			
			if(strcmp($tabChamps[3], $_SESSION["sess_application"]) == 0)	
			{	
				for ($j = 0; $j<count($tabChamps); $j++)
				{
					if ($j == 0)
					{
						$szTypeClient = "";
						switch($tabChamps[0])
						{
							case 0:
								$szTypeClient = CST_LIBELLE_CLENT_WIN;break;
							case 1:
								$szTypeClient = CST_LIBELLE_CLENT_ADMIN;break;
							case 2:
								$szTypeClient = CST_LIBELLE_CLENT_PHP;break;
						}
					}					
				}
				$tabObjectConnexion[] = new Connexion($szTypeClient, $tabChamps[1], $tabChamps[2], $tabChamps[3], $tabChamps[4], $tabChamps[5], $tabChamps[6], $tabChamps[7]);
			}
		}
			
		$tabObjectConnexion = makeTri_lposte($cletri, $tabObjectConnexion);
		
		for ($i=0; $i<count($tabObjectConnexion); $i++)
		{
			$t->set_var("TYPE", $tabObjectConnexion[$i]->szType);
			$t->set_var("NUM_PROCESS", $tabObjectConnexion[$i]->iNumProcess);
			$t->set_var("NUM_SESSION", $tabObjectConnexion[$i]->iNumSession);
			$t->set_var("APPLICATION", $tabObjectConnexion[$i]->szApplication);
			$t->set_var("CODE_UTILISATEUR", $tabObjectConnexion[$i]->szCodeUtilisateur);
			$t->set_var("ADRESSE_IP", $tabObjectConnexion[$i]->szAdresseIP);
			$t->set_var("POSTE_CLIENT", $tabObjectConnexion[$i]->szPosteClient);
			$t->set_var("DATE_HEURE", $tabObjectConnexion[$i]->szDateHeure);
			$t->set_var("VALUE_RADIO_SESSION", $tabObjectConnexion[$i]->iNumSession);
			$t->set_var("PAIR_OU_IMPAIR", (($i % 2) == 0) ? "pair" : "impair");
			$t->parse("listereponses", "LISTE_REPONSES", true);
		}
			
		$cpt = 0;
		$t->set_var("CPT", $cpt++);
		$t->set_var("FONCTION", "onSupprimerConnexion()");
		$t->set_var("LIBELLE_FONCTION", CST_LIBELLE_SUPPRIMER_CONNEXION);
		$t->parse("bouton", "BOUTON", true);

	}
	// affichage du template
	$t->parse("Output", "lr");  
	$t->p("Output");

	pos_disconnect($jeton);	
}
else
{
	debug($jeton);
	echec_connexion();
}
?>