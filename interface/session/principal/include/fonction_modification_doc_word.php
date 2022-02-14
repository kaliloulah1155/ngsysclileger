<?php
if (!defined("FONCTION_MODIFICATION_DOC_WORD"))
{
	define("FONCTION_MODIFICATION_DOC_WORD", 1);
    //define("URL_WEB_SERVICE_WSGEDPOSEIDON", "http://localhost:8896/WsPosOpenXml/ServiceMaj.asmx?WSDL");
    
    require_once('../nusoap/lib/nusoap.php');
    
    /*
    $fileName1 = "c:\\public\\openxml\\RAPPORT_CP.docx";
    $fileName2 = "c:\\public\\openxml\\DELIB_CP.docx";
    $fileNameResult = "c:\\temp\\DELIB_CP_NEW.docx";
    $retour = soapCallMacroMergeContent($fileName1, $fileName2, 'POUR_DELIB', 'RECUP_RAPPORT', $fileNameResult);
    */
    /*
    $fileNameWord = "c:\\public\\openxml\\DELIB_CP.docx";
    $fileNameXml = "c:\\public\\openxml\\export_poseidon.xml";
    $fileNameResult = "c:\\temp\\DELIB_CP_NEW.docx";
    $retour = soapCallMergeContentWithXML($fileNameWord, $fileNameXml, $fileNameResult);
    */
    
    //echo '<h2>Request</h2><pre>' . htmlspecialchars($nusoap_client->request, ENT_QUOTES) . '</pre>';
    //echo '<h2>Response</h2><pre>' . htmlspecialchars($nusoap_client->response, ENT_QUOTES) . '</pre>';
    //echo '<h2>Debug</h2><pre>' . htmlspecialchars($nusoap_client->debug_str, ENT_QUOTES) . '</pre>';
    
    function soapCallMergeContentWithXML($fileNameWord, $fileNameXml, $fileNameResult, &$msgErreur)
    {
        $contentFileWord = base64_encode(file_get_contents($fileNameWord));
        $contentFileXml = base64_encode(file_get_contents($fileNameXml));
        $tabParam = array(
        	'tabbyteFileWord'=>$contentFileWord,
        	'tabbyteFileXML'=>$contentFileXml
        );
        $retour = innerCallWsPosOpenXmlGetFile('MergeContentWithXML', $tabParam, $fileNameResult, $msgErreur);
        return $retour;
    }

    function soapCallMergeContentWithXMLInsertFile($fileNameWord, $fileNameXml, $baliseName, $fileNameToInsert, $fileNameResult, &$msgErreur)
    {
        $contentFileWord = base64_encode(file_get_contents($fileNameWord));
        $contentFileXml = base64_encode(file_get_contents($fileNameXml));
        $contentFileToInsert = base64_encode(file_get_contents($fileNameToInsert));
        $tabParam = array(
        	'tabbyteFileWord'=>$contentFileWord,
        	'tabbyteFileXML'=>$contentFileXml,
            'baliseName'=>$baliseName,
            'tabbyteFileToInsert'=>$contentFileToInsert
        );
        $retour = innerCallWsPosOpenXmlGetFile('MergeContentWithXMLInsertFile', $tabParam, $fileNameResult, $msgErreur);
        return $retour;
    }
    
    function soapCallMergeContentWithXMLSrvModel($nameModelWord, $fileNameXml, $fileNameResult, &$msgErreur)
    {
        $contentFileXml = base64_encode(file_get_contents($fileNameXml));
        $tabParam = array(
        	'modelName'=>$nameModelWord,
        	'tabbyteFileXML'=>$contentFileXml
        );
        $retour = innerCallWsPosOpenXmlGetFile('MergeContentWithXMLSrvModel', $tabParam, $fileNameResult, $msgErreur);
        return $retour;
    }
    
    function soapCallReplaceImage($fileNameWord, $fileNameImage, $titreImage, $fileNameResult, &$msgErreur)
    {
        $contentFileWord = base64_encode(file_get_contents($fileNameWord));
        $contentFileImage = base64_encode(file_get_contents($fileNameImage));
        $tabParam = array(
        	'tabbyteFileWord'=>$contentFileWord,
        	'tabbyteImage'=>$contentFileImage,
        	'titre'=>$titreImage
        );
        $retour = innerCallWsPosOpenXmlGetFile('ChangeImage', $tabParam, $fileNameResult, $msgErreur);
        return $retour;
    }
    
    function soapCallExternalGenerationMethod($signatureclasse, $modelName,
                        $fileNameWord, $fileNameXml, 
                        $fileNameResult, $jsonParameter,
                        &$msgErreur)
    {
        if (file_exists($fileNameWord))
                $contentFileWord = base64_encode(file_get_contents($fileNameWord));
        else
            $contentFileWord = "";
        $contentFileXml = base64_encode(file_get_contents($fileNameXml));
        // definition des paramètres
        $tabParam = array(
            'modelFileName'=>$modelName,
            'signatureClasse'=>$signatureclasse,
        	'tabbyteFileWord'=>$contentFileWord,
        	'tabbyteFileXML'=>$contentFileXml,
            'paramJson'=> $jsonParameter
        );
            
        $retour = innerCallWsPosOpenXmlGetFile('CallExternalGenerationMethod', $tabParam, $fileNameResult, $msgErreur);
        return $retour;
    }
    
    function soapCallMergeContentTag($fileBaliseSource, $fileBaliseDestination, $baliseNameSource, $baliseNameDestination, $fileNameResult, &$msgErreur)
    {
        $tabbyteFileBaliseSource = base64_encode(file_get_contents($fileBaliseSource));
        $tabbyteFileBaliseDestination = base64_encode(file_get_contents($fileBaliseDestination));
        $tabParam = array(
        	'tabbyteFileBaliseSource'=>$tabbyteFileBaliseSource,
            'tabbyteFileBaliseDestination'=>$tabbyteFileBaliseDestination,
        	'baliseNameSource'=>$baliseNameSource,
            'baliseNameDestination'=>$baliseNameDestination
        );
        $retour = innerCallWsPosOpenXmlGetFile('MergeContentTag', $tabParam, $fileNameResult, $msgErreur);
        return $retour;
    }
    
    
    function innerCallWsPosOpenXmlGetFile($methodName, $tabParam, $fileNameResult, &$msgErreur)
    {
        $retour = false;
        //$time_start = getmicrotime();
        $nusoap_client = new nusoap_client(URL_WEB_SERVICE_WSGEDPOSEIDON, 'wsdl');
        $nusoap_client->soap_defencoding = 'UTF-8';
        $err = $nusoap_client->getError();
        if ($err) {
        	$msgErreur = '<h2>Constructor error</h2><pre>' . $err . '</pre>';
        }
        else
        {
            $result = $nusoap_client->call($methodName, $tabParam, '', '', false, true);
            $retour = checkErreur($nusoap_client, $result, /*pref*/$MsgErreur);
            if (!$retour) {
            	$msgErreur = $MsgErreur;
            } else {
            	$retour = true;
                file_put_contents($fileNameResult, base64_decode($result[$methodName."Result"]));
            }
        }
        //$time = getmicrotime() - $time_start;
        // echo "Temps ecoule : ".$time;
        return $retour;
    }
        
    function checkErreur($nusoap_client, $result, &$MsgErreur)
    {
        $retour = false;
        //print_r($result);
        if ($nusoap_client->fault) {
            $MsgErreur = "<h2>Fault</h2><pre>".print_r($result, true)."</pre>";
        } else {
        	// Check for errors
        	$err = $nusoap_client->getError();
        	if ($err) {
        		$MsgErreur = "<h2>Error</h2><pre>".$err."</pre>";
        	} else {
        	    if (isset($result["p_oErreur"]) && strlen($result["p_oErreur"]["Erreur"]) > 0)
        	    {
                   $MsgErreur = $result["p_oErreur"]["Erreur"];
                }
                else    	     
        		  $retour = true;
        	}
        }
        return $retour;
    }
}
?>
