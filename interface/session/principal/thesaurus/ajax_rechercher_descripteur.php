<?php
/*************************************************************************
* DESCRIPTION : Recherche un descripteur et affiche les chemins
*************************************************************************/ 
session_start();
include ("../include/json/JSON.php");
include ("../include/util_headers.php");
include ("../include/connexion.inc.php");
include ("../include/fonction_util.inc.php");
include ("../include/debug.inc.php");
include ("../include/thesaurus.inc.php");
include ("../../../../configuration_w/constantesPHP.conf.php");
include ("../../../../configuration/label_".$_SESSION["sess_langue"].".conf");
include ("../../../../configuration/url.conf.php");

writeHeadersNoCache();
$json = new Services_JSON();
$objRetour = array();
$objRetour["code_retour"] = 1;
$objRetour["msg_erreur"] = "";
$objRetour["tabdescripteurs"] = array();
//error_log(print_r($_REQUEST, true));
if (isset($_REQUEST["RECH_DESC"]) && strlen($_REQUEST["RECH_DESC"])) {
    
    $retour = connexion($jeton);
    if ($retour)
    {
    	// recherche de l'existence du terme dans le thesaurus
    	// si c'est un synonyme, c'est le descripteur correspondant qui est retourne
    	if (isset($_REQUEST["TERME_EXACT"]) && strcmp($_REQUEST["TERME_EXACT"], "OUI") == 0)
    	   $szRechDescripteur = stripslashes($_REQUEST["RECH_DESC"]);
    	else
    	   $szRechDescripteur = "%".stripslashes($_REQUEST["RECH_DESC"])."%";
    	//error_log($szRechDescripteur);
        $retour = pos_getdescthesaurus($jeton, $_REQUEST["POS_TYPETHE"], $szRechDescripteur, /*pref*/$szListeDescripteur);
        
    	if($retour && strlen(trim($szListeDescripteur)) > 0)
    	{
		    $tabDescripteur = explode("\x02", $szListeDescripteur);
		    for($comptDes = 0; $comptDes<count($tabDescripteur); $comptDes++)
		    {
		        $szDescripteur = $tabDescripteur[$comptDes];
		        $retour = pos_getperesthesaurus($jeton, $_REQUEST["POS_TYPETHE"],$szDescripteur,/*pref*/$iNumInfo, 
    													/*pref*/$iNbChemin,/*pref*/$szlistePere);
                //echo($szDescripteur);
                //print_r($szlistePere);
                if($retour)
    			{
    				$peres = extrairePeres($szlistePere);
    				// Mise à jour du bloc chemin qui contient tous les éléments 
    				// de chaque chemin placé par index
    				$i=0;
                    // il peut exister plusieurs pères pour un thésaurus
                    $listeArgPeres = "";
    				for($i = 0; $i < count($peres); $i++) 
    				{
    				    // Mise à jour des liens vers la mise à jour du l'affichage du thésaurus
    					$chemin = "[".$_REQUEST["POS_TYPETHE"]."] ";
    					for($j = count($peres[$i])-1; $j>=0 ; $j--) {
    						$chemin.=$peres[$i][$j]." / ";
                            $listeArgPeres .= "'".addslashes($peres[$i][$j])."', ";
    					}
    					$chemin .= trim($szDescripteur);
                        $listeArgPeres .= "'".addslashes(trim($szDescripteur))."'";
                        
                        $objRetour["tabdescripteurs"][$comptDes] = array(); 
    					$objRetour["tabdescripteurs"][$comptDes]["arbo"] = $listeArgPeres;
                        $objRetour["tabdescripteurs"][$comptDes]["chemin_libelle"] = $chemin;
        			}
        		}
            }
    	}
        if (!$retour || strlen(trim($szListeDescripteur)) == 0) {
        	$objRetour["code_retour"] = 0;
            if (!$retour)
                $objRetour["msg_erreur"] = get_erreur_poseidon($jeton);
            else
                $objRetour["msg_erreur"] = "Ce descripteur n'a pas été retrouvé dans le thésaurus.";
        }   
     	pos_disconnect($jeton);       
    }
}
else {
	$objRetour["code_retour"] = 0;
	$objRetour["msg_erreur"] = "Le descripteur n'est pas valide.";
}
//error_log(print_r($objRetour, true));
$output = $json->encode($objRetour);
print($output);
?>