<?php
session_start();
include ("../include/json/JSON.php");
include ("../include/util_headers.php");
include ("../portail/util_layout.inc.php");
include ("../../../../configuration/label_".$_SESSION["sess_langue"].".conf");

writeHeadersNoCache();
$json = new Services_JSON();

$actionLayout = $_REQUEST['ACTION_LAYOUT'];
$objRetour = array();

switch($actionLayout) {
    
    case 'get_current' : 
    	
    	if (getCurrentLayout($content, $msgErr)) {
            $objRetour["code_retour"] = 1;
    		$objRetour["msg_erreur"] = "";
    		$objRetour["contenu"] = $content; 
        }
        else {
            $objRetour["code_retour"] = 0;
    		$objRetour["msg_erreur"] = $msgErr;
    		$objRetour["contenu"] = ""; 
        }
    	$output = $json->encode($objRetour);
    	print($output);
    break;
    
    case 'save' : 
        $content = $_REQUEST['CONTENT'];
        $fileName = getFileLayout(true);
    	
    	if (!isset($fileName)) {
    		$objRetour["code_retour"] = 0;
    		$objRetour["msg_erreur"] = CST_SPECIFIER_NOM_FICHIER;
    		$objRetour["contenu"] = "";				
    	} else {
    		$retour = file_put_contents ($fileName, stripslashes($content));
    		if ($retour === false) {
                $objRetour["code_retour"] = 0;
                $objRetour["msg_erreur"] = "Erreur lors de la sauvegarde sur le serveur.";
    		    $objRetour["contenu"] = "";	
            }
            else {
                $objRetour["code_retour"] = 1;
    		    $objRetour["msg_erreur"] = "";
    	        $objRetour["contenu"] = "content saved"; 			
            }
    	}
    	$output = $json->encode($objRetour);
    	print($output);
    break;

    case 'get_availables' :  
    	// TODO
    	$objRetour["code_retour"] = 1;
    	$objRetour["msg_erreur"] = "";
    	$objRetour["nombre"] = 4;
    	$objRetour["nom0"] = "Vertical 1:1:1";
    	$objRetour["icone0"] = "1_1_1";
    	$objRetour["nom1"] = "Vertical 1:1";
    	$objRetour["icone1"] = "1_1";
    	$objRetour["nom2"] = "Vertical 2:1";
    	$objRetour["icone2"] = "2_1";
    	$objRetour["nom3"] = "Vertical 2:1:1";
    	$objRetour["icone3"] = "2_1_1";
    	$output = $json->encode($objRetour);
    	print($output);
	break;
	
	case 'get_by_index' : 
    	$layoutIndex = $_REQUEST['LAYOUT_INDEX'];
    	$fileName = '../../../../configuration_w/layouts/layout'.$layoutIndex.'.xml';
    	
    	if (!isset($layoutIndex) || ! file_exists($fileName)) {
    		$objRetour["code_retour"] = 0;
    		$objRetour["msg_erreur"] = CST_INDEX_INVALIDE;
    		$objRetour["contenu"] = "";		
    	} else {
    		$content = file_get_contents("$fileName");
    		if (! $content) {
    			$objRetour["code_retour"] = 0;
    			$objRetour["msg_erreur"] = CST_ERREUR_LECTURE_FICHIER.":".$fileName;
    			$objRetour["contenu"] = "";
    		} else {
    			$objRetour["code_retour"] = 1;
    			$objRetour["msg_erreur"] = "";
    		
    			$content = str_replace(array("\r\n", "\n", "\r", "\t"), "", $content);
    	
    	        $content = preg_replace("/>\s*</", "><", $content);
    	        $objRetour["contenu"] = utf8_decode($content); 
    		}
    	}
    	$output = $json->encode($objRetour);
    	print($output);
    break;
}

?>
