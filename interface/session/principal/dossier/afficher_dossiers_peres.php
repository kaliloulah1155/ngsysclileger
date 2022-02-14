<?php
/*
 * DESCRIPTION : Affiche l'arborescence des dossier référentiels.
 * 
 *
 * AUTEUR : Sébastien COSTANZO
 * DATE de CREATION : 21/07/2003
 *
 * Donnees en entree : 
 * POS_NUM_DOC 
 *
 */
if (!isset($_SESSION))
session_start();
include ("../include/connexion.inc.php");
include ("../include/debug.inc.php");
include ("../include/template.inc.php");
include ("../include/form_values.inc.php");
include ("../../../../configuration_w/constantesPHP.conf.php");
include ("../../../../configuration/url.conf.php");
include ("../../../../configuration/label_".$_SESSION["sess_langue"].".conf");

$retour = connexion($jeton);

if($retour)
{
	$retour = pos_dosinfocontenant($jeton, $_REQUEST["POS_NUM_DOC"], /*pref*/$tabPere);
	
	if($retour)
	{
		// Affichage
		$t = new Template(REP_TEMPLATE_APPLICATIF."arborescence/");
		$t->set_File("arborescence", "affichage_dossiers_peres.tpl");

		$t->set_var("LIBELLE_DOSSIER_PERES", CST_LIBELLE_DOSSIER_PERES);
		$t->set_var("LIBELLE_FERMER", CST_LIBELLE_FERMER);
		$t->set_block("arborescence", "BLOC_REPRODUIT_INV_NUM_NIVEAU", "bloc_reproduit_inv_num_niveau");
		$t->set_block("arborescence", "LISTE_DOSSIER_CHEMIN", "liste_dossier_chemin");
		$t->set_block("arborescence", "LISTE_CHEMIN", "liste_chemin");
        $t->set_var("MESS_PAS_DE_DOSSIER", (count($tabPere) == 0) ? CST_LIBELLE_NO_DOSS_PERE : "");
        $t->set_var("LIBELLE_GARDER_EN_REPONSE_HISTO_DOC", CST_LIBELLE_GARDER_EN_REPONSE_HISTO_DOC);
        $t->set_var("LIBELLE_GARDER_EN_REPONSE_HISTO_QUEST", CST_LIBELLE_GARDER_EN_REPONSE_HISTO_QUEST);
        $t->set_var("POS_NUM_DOC", $_REQUEST["POS_NUM_DOC"]);
        
        //print_r($tabPere);
        $tabListeLigneArborescence = array();
        for($cpt=0;$cpt<count($tabPere);$cpt++)
		{	
		    $iNumDoc = $tabPere[$cpt]->doc_numero;
		    $tabLigneArboEnCours = array();
		    $tabLigneArboEnCours[0] = new Dossier($iNumDoc, $tabPere[$cpt]->noeud_libelle);
		    getInfoContenant($jeton, $iNumDoc, $tabLigneArboEnCours, /*pref*/$tabListeLigneArborescence);
		}
		
		for($i=0;$i<count($tabListeLigneArborescence);$i++)
		{	
		    $t->set_var("liste_dossier_chemin", "");
		    
		    for($j=count($tabListeLigneArborescence[$i]) - 1;$j >= 0;$j--)
    		{	
    		    $t->set_var("bloc_reproduit_inv_num_niveau", "");
    		    $iNumNiveau = count($tabListeLigneArborescence[$i]) - $j;
    		    $t->set_var("NUM_NIVEAU", $iNumNiveau);
    		    $t->set_var("INV_NUM_NIVEAU", ($j + 1));
    		    for($k=0;$k <$iNumNiveau-1;$k++)
    		    {
    		      $t->parse("bloc_reproduit_inv_num_niveau", "BLOC_REPRODUIT_INV_NUM_NIVEAU", true);
                }
    		    $t->set_var("NOM_DOSSIER", htmlentities_currentcharset($tabListeLigneArborescence[$i][$j]->szLibelle, null));
    		    $t->set_var("NUM_DOSSIER", $tabListeLigneArborescence[$i][$j]->iNumDoc);
                $t->parse("liste_dossier_chemin", "LISTE_DOSSIER_CHEMIN", true);
    		}
            $t->parse("liste_chemin", "LISTE_CHEMIN", true);
		}
		
		$t->parse("MyOutput", "arborescence");
		$t->p("MyOutput");
	}
	else
		debug($jeton);
	
	pos_disconnect($jeton);
}	
else
{
	debug($jeton);
	echec_connexion();
}

class Dossier {    
    
    var $iNumDoc;
    var $szLibelle;
    function Dossier($iNumDoc, $szLibelle) 
    {
        $this->iNumDoc = $iNumDoc;
        $this->szLibelle = $szLibelle;
    }
}


function getInfoContenant($jeton, $iNumDoc, $tabLigneArboEnCours, &$tabListeLigneArborescence)
{
    $retour = pos_dosinfocontenant($jeton, $iNumDoc, /*pref*/$tabPere);
	if($retour)
	{
        //print_r($tabPere);
        if (count($tabPere) == 0)
        {
            $tabListeLigneArborescence[count($tabListeLigneArborescence)] = $tabLigneArboEnCours;
        }
        for($cpt=0;$cpt<count($tabPere);$cpt++)
		{	
		    $tabLigneArboEnCoursTmp = $tabLigneArboEnCours;
		    $tabLigneArboEnCoursTmp[count($tabLigneArboEnCoursTmp)] = new Dossier($tabPere[$cpt]->doc_numero, $tabPere[$cpt]->noeud_libelle);
		    getInfoContenant($jeton, $tabPere[$cpt]->doc_numero, $tabLigneArboEnCoursTmp, /*pref*/$tabListeLigneArborescence);
		}
	}
	else
		debug($jeton);
}
?>
