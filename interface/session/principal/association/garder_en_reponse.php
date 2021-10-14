<?php
/*
 * DESCRIPTION : Conservation en réponses des résultats d'un lien
 *
 * AUTEUR : Gabrielle Guy
 * DATE de CREATION : 03/10/2011
 *
 * Donnees en entree : 
 * POS_TYPEDOC : type du document
 * POS_VALEUR_RUB : code de la rubrique liee
 * POS_CODERUB : valeur de la rubrique liee
 */
include ("../include/locution.inc.php");
session_start();
include ("../include/connexion.inc.php");
include ("../include/debug.inc.php");
include ("../include/question.inc.php");
include ("../../../../configuration_w/constantesPHP.conf.php");
include ("../../../../configuration/label_".$_SESSION["sess_langue"].".conf");
include ("../../../../configuration/url.conf.php");
include ("afficher_index_lie.inc.php");

if (!isset($_REQUEST["POS_TYPEDOC"]) || !isset($_REQUEST["POS_CODERUB"]) || 
    !isset($_REQUEST["POS_VALEUR_RUB"]) || strlen($_REQUEST["POS_VALEUR_RUB"]) == 0)
{
    $tabInfoDebug = array();
    $tabInfoDebug[0] = CST_LIBELLE_NOT_GARDER_EN_REPONSE;
    debug_code($tabInfoDebug);
    echo "<script>";
    echo "parent.closeAssocModif();";
    echo "</script>";
}
else
{
    $retour = connexion($jeton);
    
    if ($retour)
    {
        $retour = pos_getinforubintype($jeton, $_REQUEST["POS_TYPEDOC"], "", 200, /*pref*/$tabRubInType);
    	if ($retour)
    	{
    		// rechercher la structure correspondante a la rubrique
    		for ($i=0;$i<count($tabRubInType);$i++)
    		{
    			if (strcmp($tabRubInType[$i]->code, $_REQUEST["POS_CODERUB"]) == 0)
    			{
    				$szCodeTypeLie = $tabRubInType[$i]->code_typelie;
    				$szCodeRubLiee = $tabRubInType[$i]->code_rubliee;
    				break;
    			}
    		}
    	}
    	if (isset($szCodeTypeLie) && isset($szCodeRubLiee))
    	{
    	    $tabLoc = array();
    	    $sCodeRub = $szCodeRubLiee;
    	    if (isset($_REQUEST["POS_RUB_RECH"]) && strlen($_REQUEST["POS_RUB_RECH"])) {
                $sCodeRub = $_REQUEST["POS_RUB_RECH"];
                $tabLoc[0] = new Locution(1, $szCodeTypeLie, $sCodeRub, "=",  stripslashes($_REQUEST["POS_VALEUR_RUB"]));
            }
            else {
                $tabLoc = get_tabLocWithValeur(stripslashes($_REQUEST["POS_VALEUR_RUB"]), $szCodeRubLiee, $szCodeTypeLie);
            }
            
    	    if(isset($_SESSION["sess_tabHistQuest"][0]) )
        		$iNumQuest = count ($_SESSION["sess_tabHistQuest"][0]);
        	else
        		$iNumQuest = 0;
            
            // la question n'était pas dans l'historique -> on la rentre
        	$_SESSION["sess_tabHistQuest"][0][$iNumQuest] = array_slice($tabLoc, 0, count($tabLoc));
        
        	// conservation du nombre de réponses et de la date
        	$_SESSION["sess_tabHistQuest"][1][$iNumQuest] = 1; 
        	$_SESSION["sess_tabHistQuest"][2][$iNumQuest] = date("d/m/y  H:i"); 
        	$_SESSION["sess_tabHistQuest"][3][$iNumQuest] = "RECHERCHE_ELABOREE";
        
            $szTitreQuest = affiche_une_locution($jeton, 0, 1, $iNumQuest, 0, $_SESSION["sess_tabLibTypeDoc"]);
            echo "<script>";
            echo "parent.parent.updateMenuAddQuestion('".preg_replace('/\'/', '@', $szTitreQuest)."', '".$iNumQuest."', '1', 'RECHERCHE_ELABOREE');";
            echo "parent.closeAssocModif();";
            echo "</script>";
        }
        pos_disconnect($jeton);
    }
    else
    {
    	debug($jeton);
    	echec_connexion();
    }
}
?>
