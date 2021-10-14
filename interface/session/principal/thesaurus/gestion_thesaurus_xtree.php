<?php
/* 
 * Gestion et consultation des thésaurus 
 *
 * PL 21/05/2008
 *
 * Données en entrée :
 *  
 *
 */
session_start();
require("../ajax/JSON.php");
include ("../include/util_headers.php");
include ("../include/connexion.inc.php");
include ("../include/debug.inc.php");
include ("../include//thesaurus.inc.php");
include ("../include/form_values.inc.php");
include ("../include/locution.inc.php");
define("CREER_FICHE_THE",999);
define("MODIF_FICHE_THE",888);
define("SUPP_FICHE_THE",777);

writeHeadersNoCache();

$json = new Services_JSON();
$objRetour = array();
$objRetour["debug"] = "test";
$objRetour["code_retour"] = 1;
$objRetour["msg_erreur"] = "";
$objRetour["ispere"] = array();
$objRetour["thesaurus"] = array();
$objRetour["note"] = "";
$objRetour["employe"] = "";
$objRetour["histo"] = "";
$objRetour["associe"] = "";

$retour = connexion($jeton);
if ($retour)
{
	$needrecherche = false;
	
	$suffixe_num = isset($_REQUEST['POS_SUFFIXE_RUB_NUM']) ? $_REQUEST['POS_SUFFIXE_RUB_NUM'] : "";
	
	if (strstr($_REQUEST['POS_ACTION'], "ajout") == true) 
    {
        $objRetour["debug"] = "ajout";
		$type_ajout = explode("_",$_REQUEST['POS_ACTION']);
		if (strcmp($type_ajout[1], "recherche") == 0)
			$needrecherche = true;
				
		$tab = get_form_values_with_prefix("POS_VAL_RUB_", true);
		
		//$tabCodeRubToCreate[$_REQUEST['POS_TYPETHE']] = stripslashes($_REQUEST['DESCRIPTEUR']);
		while (list($key, $val) = each($tab)) {
			$tabCodeRubToCreate[$key.$suffixe_num] = $val;
			//$key = $key.$suffixe_num;
		}
		// assignation de la valeur de la nature du descripteur
		// on ne créé pas de fiche d'index au niveau supérieur
 		$nature = "N".$suffixe_num;
		$tabCodeRubToCreate[$nature] = "EM";
		$tabCodeRubToCreate[$_REQUEST['POS_TYPETHE']] = stripslashes($_REQUEST['POS_VAL_NEW_DESCRIPTEUR']);
		$pere = "P".$suffixe_num;
		$tabCodeRubToCreate[$pere] = stripslashes($_REQUEST['POS_DESCRIPTEUR_PERE']);
		
		// creation du document
        $iNumDoc = 0;
		$retour = pos_gestthesaurus($jeton, $_REQUEST['POS_TYPETHE'], $iNumDoc, CREER_FICHE_THE,count($tabCodeRubToCreate), $tabCodeRubToCreate, /*pref*/$wBadRub);
		
		if (!$retour)
		{
			$objRetour["code_retour"] = 0;
			$objRetour["msg_erreur"] = get_erreur_poseidon($jeton);
		}
		else {
			if($needrecherche == false)
				$objRetour["thesaurus"][0] = stripslashes(urldecode($_REQUEST['POS_VAL_NEW_DESCRIPTEUR']));
		}			
	}	
	
	if ((strcmp($_REQUEST['POS_ACTION'], "recherche") == 0 || $needrecherche == true) || (strcmp($_REQUEST['POS_ACTION'], "consultation") == 0)) 
    {
		$objRetour["debug"] = "recherche";
		$sztypeThesaurus = $_REQUEST['POS_TYPETHE'];
	
		$szDescripteur = stripslashes(urldecode($_REQUEST['POS_DESCRIPTEUR']));
	   
		// récupération des fils
		$retour = pos_getfilsthesaurus($jeton, $sztypeThesaurus, $szDescripteur, /*pref*/$dwNumInfo, /*pref*/$szListeFils);
	
		if (strcmp($_REQUEST['POS_ACTION'], "consultation") != 0) 
        {
    		if($retour)
    		{
    			$tabFils = array();
    			$i=0;
    			extraireFils($szListeFils, /*pref*/$tabFils);
    			while (list($descripteur, $isPere) = each($tabFils))
    			{
    			//echo "pere : $isPere";
    			    $objRetour["ispere"][$i] = trim($isPere);
    				$objRetour["thesaurus"][$i] = $descripteur;
    				$i++;	
    			}		
    		}
    		else
            {
    			$objRetour["code_retour"] = 0;
    			$objRetour["msg_erreur"] = get_erreur_poseidon($jeton);
            }
		}
		else { 
			$objRetour["debug"] = "consultation";
			// récupération des valeurs de rubriques du thésaurus
			if (strlen($_REQUEST['POS_DESCRIPTEUR']) != 0) {
				$tabLoc[0] = new Locution(1, $_REQUEST['POS_TYPETHE'], $_REQUEST['POS_TYPETHE'], "=", $szDescripteur);
				$dwNbVoulu = 1;
				$retour = pos_searchdocidx($jeton, count($tabLoc), $tabLoc, $dwNbVoulu, /*pref*/$dwNbRepReelles, /*pref*/$wNbRub, /*pref*/$tabLstCodeLibRub);
				$b_descripteur = false;
				if ($retour)
				{   
					$codevalrub = array();
    				for($i=0;$i<count($tabLstCodeLibRub);$i+=2)
    				{
    				    $codevalrub[trim($tabLstCodeLibRub[$i])] = trim($tabLstCodeLibRub[$i + 1]);
    				}
				
					$nature = "N".$suffixe_num;
					$note = "D".$suffixe_num;
					$employe = "S".$suffixe_num;
					$associe = "A".$suffixe_num;
					$histo	= "H".$suffixe_num;
					$pere_des	= "P".$suffixe_num;
					$noteVal = ""; $employeVal = ""; $associeVal= ""; $histoVal = "";$pereVal = "";
					while (list($key, $val) = each($codevalrub)) {
					
						if (strcmp($key, $note) == 0)
							$noteVal = $val;
						if (strcmp($key, $employe) == 0)
							$employeVal= $val;
						if (strcmp($key, $associe) == 0)
							$associeVal = $val;
						if (strcmp($key, $histo) == 0)
							$histoVal = $val;
						if (strcmp($key, $pere_des) == 0)
							$pereVal = $val;
						if (strcmp($key, $nature) == 0) {
							if (strcmp($val,"EM") == 0)
								$b_descripteur = true;
						}
					}
					
					if ($b_descripteur == true) {
						$objRetour["note"] = $noteVal;
						$objRetour["employe"] = $employeVal;
						$objRetour["histo"] = $histoVal;
						$objRetour["associe"] = $associeVal;
						$objRetour["pere"] = $pereVal;
						$objRetour["thesaurus"][0] = $szDescripteur;
					}
						
				}	
        		else
                {
        			$objRetour["code_retour"] = 0;
        			$objRetour["msg_erreur"] = get_erreur_poseidon($jeton);
                }
			}
		}
	}	
	else if (strcmp($_REQUEST['POS_ACTION'], "modification") == 0) 
    {
        $szDescripteur = stripslashes(urldecode($_REQUEST['POS_DESCRIPTEUR']));
		$tabLoc[0] = new Locution(1, $_REQUEST['POS_TYPETHE'], $_REQUEST['POS_TYPETHE'], "=", $szDescripteur);
		// Récupération des réponses.
		$retour = pos_searchdoc($jeton,count($tabLoc),$tabLoc, /*pref*/$dwNbReponsesAsso, /*pref*/$dwAdrPremiereReponseAsso);
		$retour = pos_getreponsestabnumdoc($jeton, $dwAdrPremiereReponseAsso, $dwNbReponsesAsso, /*pref*/$tabNumDoc);	
		
		if ($retour) {
			$nature = "N".$suffixe_num;
			$note = "D".$suffixe_num;
			$employe = "S".$suffixe_num;
			$associe = "A".$suffixe_num;
			$histo	= "H".$suffixe_num;
						
			// Modification du descripteur
			$tab = get_form_values_with_prefix("POS_CURRENT_VAL_RUB_", true);
		
			//$tabCodeRubToCreate[$_REQUEST['POS_TYPETHE']] = stripslashes($_REQUEST['DESCRIPTEUR']);
			while (list($key, $val) = each($tab)) {
				$tabCodeRubToModify[$key.$suffixe_num] = $val;
			//$key = $key.$suffixe_num;
			}
			
			$retour = pos_gestthesaurus($jeton, $_REQUEST['POS_TYPETHE'],$tabNumDoc[0] , MODIF_FICHE_THE,count($tabCodeRubToModify), $tabCodeRubToModify, /*pref*/$wBadRub);
			
			$objRetour["thesaurus"][0] = $szDescripteur;
			if (!$retour)
			{
				$objRetour["code_retour"] = 0;
				$objRetour["msg_erreur"] = get_erreur_poseidon($jeton);
			}
		}
        else
        {
			$objRetour["code_retour"] = 0;
			$objRetour["msg_erreur"] = get_erreur_poseidon($jeton);
        }
	}
	else if (strcmp($_REQUEST['POS_ACTION'], "suppression") == 0) {
    
        $szDescripteur = stripslashes(urldecode($_REQUEST['POS_DESCRIPTEUR']));
		$objRetour["debug"] = "suppression";
		//il faut d'abord récupérer le numDoc à supprimer
        $tabLoc[0] = new Locution(1,$_REQUEST['POS_TYPETHE'], $_REQUEST['POS_TYPETHE'], "=", $szDescripteur);
	    $retour = pos_searchdoc($jeton,count($tabLoc),$tabLoc, /*pref*/$dwNbReponsesAsso, /*pref*/$dwAdrPremiereReponseAsso);
		$retour = pos_getreponsestabnumdoc($jeton, $dwAdrPremiereReponseAsso, $dwNbReponsesAsso, /*pref*/$tabNumDoc);	
		
		if ($retour && count($tabNumDoc) == 1)
        {
    		// suppression du descripteur
    		$tabCodeRubToSuppress = array();
    		$retour = pos_gestthesaurus($jeton, $_REQUEST['POS_TYPETHE'], $tabNumDoc[0], SUPP_FICHE_THE, count($tabCodeRubToSuppress), $tabCodeRubToSuppress, /*pref*/$wBadRub);
        } 		
		if (!$retour)
		{
			$objRetour["code_retour"] = 0;
			$objRetour["msg_erreur"] = get_erreur_poseidon($jeton);
		}
	}
}
else
{
	debug($jeton);
	echec_connexion();
}

$retour = pos_disconnect($jeton);
$output = $json->encode($objRetour);
print($output);
?>

