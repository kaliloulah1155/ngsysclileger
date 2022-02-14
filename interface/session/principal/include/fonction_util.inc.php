<?php
if (!defined("FONCTION_UTIL"))
{
    define("FONCTION_UTIL",1);
	include ("../../../../configuration_w/constantesPHP.conf.php");
    
    function getRepTmp()
    {
    	$szRepTmp = REP_TMP_SESSION;
    	return $szRepTmp;
    }

   function getRepTmpSession($sessId)
   {
	 	$szRepTmp = getRepTmp();
		$szRepTmp .= "d".$sessId;
		$szRepTmp .= "/";
		if (!file_exists($szRepTmp))
		{
			mkdir($szRepTmp);
		}
		 
		return $szRepTmp;
	}

	function delRepTmpSession($sessId)
	{
		$szRepTmp = getRepTmpSession($sessId);
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
	
	function _exec($cmd, &$messageError) 
    { 
        try {
           $WshShell = new COM("WScript.Shell");
           // true : attend la fin de l'exécution
           $oExec = $WshShell->Run($cmd, 0, true); 
           return $oExec == 0 ? true : false; 
        } catch (Exception $e) {
            $messageError = 'Exception reçue : '.$e->getMessage();
            return false; 
        }
    }

	function delRepRecursif($szRepDossier)
	{
		$dir_iterator = new RecursiveDirectoryIterator($szRepDossier);
		$iterator = new RecursiveIteratorIterator($dir_iterator, RecursiveIteratorIterator::CHILD_FIRST);

		// On supprime chaque dossier et chaque fichier	du dossier cible
		foreach($iterator as $fichier){

			if (substr($fichier, -1, 1) != ".")
				$fichier->isDir() ? rmdir($fichier) : unlink($fichier);
		}

		// On supprime le dossier cible
		rmdir($szRepDossier);
	}
}
?>