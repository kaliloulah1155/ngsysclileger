<?php

if (!defined("POS_DAV"))
{
    define("POS_DAV", 1);
	include ("../../../../configuration_w/constantesPHP.conf.php");

    function getRepDav()
    {
        $pattern = "/".NOM_APPLICATION."/i";
    	if(isset($_SERVER["PATH_TRANSLATED"]))
	    	$tabTmpRepServeurHttp = preg_split($pattern, $_SERVER["PATH_TRANSLATED"]);
	    else
		    $tabTmpRepServeurHttp = preg_split($pattern, $_SERVER["SCRIPT_FILENAME"]);
        $repServeurHttp = $tabTmpRepServeurHttp[0];
		$cheminRepdav = $repServeurHttp."posdav/";
    		
    	return $cheminRepdav;
    }
    
    function getUrlDav()
    {
        $urlRepdav = "/posdav/";
        
        return $urlRepdav;
    }

    function getRepDavSauvegarde()
    {
    	$szRepTmp = getRepDav();
		$szRepTmp .= "sauv_perte_session";
		$szRepTmp .= "/";
		if (!file_exists($szRepTmp))
		{
			mkdir($szRepTmp);
		}
        return $szRepTmp;
    }

   function getRepDavSession($sessId)
   {
	 	$szRepTmp = getRepDav();
		$szRepTmp .= "d".$sessId;
		$szRepTmp .= "/";
		if (!file_exists($szRepTmp))
		{
			mkdir($szRepTmp);
		}
		 
		return $szRepTmp;
	}

   function getUrlDavSession($sessId)
   {
   	$urlRepdav = getUrlDav();
		$urlRepdav .= "d".$sessId;
		$urlRepdav .= "/";
      return $urlRepdav;
   }

	function delRepDavSession($sessId)
	{
		$szRepTmp = getRepDavSession($sessId);
		if (file_exists($szRepTmp))
		{
			$hd = opendir($szRepTmp);
			if ($hd)
			{
				while (($f = readdir($hd)) !== false)
				{
					if ($f != "." && $f != "..")
						unlink($szRepTmp.$f);
				}
				closedir($hd);
			}
			rmdir($szRepTmp);
		}
	}
   
   define("TYPE_LANCEMENT_APPL_APPLET", 0);
   define("TYPE_LANCEMENT_APPL_JWS_SIMPLE", 1);
   define("TYPE_LANCEMENT_APPL_JWS_JS", 2); 
   function getTypeLancementAppl()
   {
        // TYPE_LANCEMENT_APPL : utilisation de JWS
        // TYPE_LANCEMENT_APPL : 1 : passage direct en jnlp / jws
        // TYPE_LANCEMENT_APPL : 2 : utilisation javascript + jnlp pour une meilleure intégration
        // => 2 temps : ouverture du template
        $iTypeLancementAppl = TYPE_LANCEMENT_APPL_APPLET;  
        if(defined('TYPE_LANCEMENT_APPL'))
		{
		   if (TYPE_LANCEMENT_APPL == "TYPE_LANCEMENT_APPL_JWS_SIMPLE")
               $iTypeLancementAppl = TYPE_LANCEMENT_APPL_JWS_SIMPLE;
           else if (TYPE_LANCEMENT_APPL == "TYPE_LANCEMENT_APPL_JWS_JS")
                $iTypeLancementAppl = TYPE_LANCEMENT_APPL_JWS_JS;
        }
        return $iTypeLancementAppl;
   }
    
    /**
     * state : 1 fichier signé
     *         0 fichier non signé
     *         -1 en cours de signature
     */
    function storeStateSignFile($numDoc, $numPage, $numSsPage, $state)
    {
        if (!isset($_SESSION["sess_state_sign_file"]))
            $_SESSION["sess_state_sign_file"] = array();
        $_SESSION["sess_state_sign_file"][$numDoc."-".$numPage."-".$numSsPage] = $state;             
    }
    
    /**
     * state : 1 fichier signé
     *         0 fichier non signé
     *         -1 en cours de signature
     *         -2 fichier inconnu
     */
    function getStateSignFile($numDoc, $numPage, $numSsPage)
    {
        if (isset($_SESSION["sess_state_sign_file"][$numDoc."-".$numPage."-".$numSsPage]))
            return $_SESSION["sess_state_sign_file"][$numDoc."-".$numPage."-".$numSsPage];
        return -2;             
    }

	function getFileNameJnlp($numDoc, $numPage, $numSsPage)
    {
        return sprintf("jnlp_%s_%s_%s.jnlp", $numDoc, $numPage, $numSsPage);             
    }
}

?>