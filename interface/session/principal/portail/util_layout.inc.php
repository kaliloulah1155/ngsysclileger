<?php

function seo_string($str){
    $a = array('/(à|á|â|ã|ä|å|æ)/','/(è|é|ê|ë)/','/(ì|í|î|ï)/','/(ð|ò|ó|ô|õ|ö|ø)/','/(ù|ú|û|ü)/','/ç/','/þ/','/ñ/','/ß/','/(ý|ÿ)/','/ /', '/[^a-z0-9_-]/s');
	$b = array('a','e','i','o','u','c','d','n','s','y','_','-');
	return trim(preg_replace($a, $b, strtolower($str)),'-');
}

function getFileLayout($bSave)
{
    $fileName = "../../../../configuration_w/users/portail_layout_".seo_string($_SESSION["sess_user_name"]).".xml";
    // l'administrateur n'a pas de page personnelle
    if($_SESSION["sess_droitAdministration"] == 1 || (!file_exists($fileName) && !$bSave))
	   $fileName = "../../../../configuration_w/portail_layout.xml";
    return $fileName;
}

function getCurrentLayout(&$content, &$msgErr)
{
    $retour = true;
    $content = "";
    $msgErr = "";
    $fileName = getFileLayout(false);

	$content = file_get_contents("$fileName");
	if (! $content) {
		$retour = false;
		$msgErr = CST_ERREUR_LECTURE_FICHIER.":".$fileName;
	} else {
		$retour = true;
		$contentTmp = str_replace(array("\r\n", "\n", "\r", "\t"), "", $content);
        $contentTmp = preg_replace("/>\s*</", "><", $contentTmp);
        $content = utf8_decode($contentTmp); 
	}
	return $retour;
}
?>
