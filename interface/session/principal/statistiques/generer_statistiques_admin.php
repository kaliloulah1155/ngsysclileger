<?php

/*
 * DESCRIPTION : Exportation de la liste des reponses au format excel
 * 
 * AUTEUR : Frederic Tramarin
 * DATE de CREATION : 05/02/2003
 *
 * Donnees en entree : 
 *
 * CAR_SEP : caractère separateur (tabulation ou separateur)
 * SEPARATEUR : separateur
 * PROFIL_LR : profil de liste résumee par défaut
 * INUMQUEST : Numero de la question
 * SELECTION : Selection du type d'export
 * INUMDOS : Numero de dossier
 * 
 *
 * MODIFICATIONS
 * 
 */

include ("../include/locution.inc.php");
session_start();

include ("../include/connexion.inc.php");
include ("../include/debug.inc.php");
include ("../include/template.inc.php");
include ("../include/fonction_util.inc.php");
include ("../include/liste_resumee.inc.php");
include ("../../../../configuration/url.conf.php");
include ("../../../../configuration_w/constantesPHP.conf.php");
include ("../../../../configuration/label_".$_SESSION["sess_langue"].".conf");
if ($_SESSION["sess_droitAdministration"] == false)
{	
	afficheMsg(CST_LIBELLE_NO_ADMINISTRATION);
}
else
{
    $retour = connexion($jeton);
    if($retour) 
    {
    	$fileStat = tempnam(getRepTmpSession(session_id()), "POS_");
    	$szSeparateur = (strcmp($_REQUEST["CAR_SEP"], "tabulation") == 0) ? "\t" : $_REQUEST["SEPARATEUR"];
    	if(strcmp($_REQUEST["CAR_SEP"], "tabulation") != 0 && strlen(trim($szSeparateur)) == 0)
    		$szSeparateur = ";";
    
        //$dDebut = date_create_from_format ("d/m/Y", $_REQUEST["DATE_DEBUT"]);
        //$dFin = date_create_from_format ("d/m/Y", $_REQUEST["DATE_FIN"]);
        $tabLigneConnexion = array();
        // le nom du fichier n'est pas utilise, 
        $retour = pos_statistique($jeton,
    					PHP_VULCAIN_FIC_STAT,
    					$szSeparateur,
    					$fileStat,
    					0,
    					$_REQUEST["MOIS_DEBUT"],
    					$_REQUEST["ANNEE_DEBUT"],
                        0,
    					$_REQUEST["MOIS_FIN"],
    					$_REQUEST["ANNEE_FIN"],
    					/*pref*/$tabLigneConnexion);
         if (!$retour)
    		debug($jeton);
        //print_r($tabLigneConnexion);
    	pos_disconnect($jeton);	
    
        if ($retour)
    	{
            $typeExport = $_REQUEST["TYPE_SORTIE"];
        	if ($typeExport == "HTML")
            //if (true) 
            {   	
        		$szTplName = REP_TEMPLATE_APPLICATIF."statistiques/stats_admin.tpl";
        		$t = new template(".");
        		$t->set_file("lr", $szTplName);
        		$t->set_block("lr", "ENTETE", "entete");
        		$t->set_block("lr", "LR_REPONSE", "lrreponse");
        		$t->set_block("lr", "LISTE_REPONSES", "listereponses");
        		$t->set_block("lr", "BOUTON", "bouton");
        		$t->set_var("TITRE_PAGE", CST_STAT_ADMIN_TITRE);
        		$tabChampsEntete = extraireChampsLR($tabLigneConnexion[0], $szSeparateur);
                $nbColumns = count($tabChampsEntete);
        		for ($i = 0; $i<$nbColumns; $i++)
        		{
        			$t->set_var("TITRE_COLONNE", $tabChampsEntete[$i]);
        			$t->parse("entete", "ENTETE", true);
        		}
        
        		for ($i=1;$i<count($tabLigneConnexion);$i++)
        		{
        			$tabChamps = extraireChampsLR($tabLigneConnexion[$i], $szSeparateur);
    				$t->set_var("lrreponse", "");
        			for ($j = 0; $j<$nbColumns; $j++)
        			{
        	        	$t->set_var("ZONE_LR", (isset($tabChamps[$j]) ? $tabChamps[$j] : "")."&nbsp;");
                        $t->parse("lrreponse", "LR_REPONSE", true);
        			}
                    $t->set_var("PAIR_OU_IMPAIR", ($i % 2 == 0) ? "pair" : "impair");
        	        	
        			$t->parse("listereponses", "LISTE_REPONSES", true);
        		}
        		$t->parse("Output", "lr"); 
        		$t->p("Output");
        	}
            else
    		{
    			header("Cache-Control: ");// leave blank to avoid IE errors
    			header("Pragma: ");// leave blank to avoid IE errors
    			header("Content-Type: text/csv");
                header("Content-Disposition: attachment; filename=export.csv;");
                //header("Content-Length: " . filesize($fileStat));
    			for ($i=0;$i<count($tabLigneConnexion);$i++) {
                    echo $tabLigneConnexion[$i]."\n";
                }
    			flush();
    		}
    	}
        else
            include("../statistiques/afficher_statistiques_admin.php");
    }
    else
    {
    	debug($jeton);
    	echec_connexion();
    }
}
?>