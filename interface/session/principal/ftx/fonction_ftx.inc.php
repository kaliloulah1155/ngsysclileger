<?php
/***********************************
 * Fonctions communes aux fichiers FTX 
 */ 
define("FTX_TRI_DISTANCE", 0);
define("FTX_TRI_OCCURRENCE", 1);
function getTypesDoc(&$tabLib, &$sTypesDoc) {
    
    $sTypesDoc = "";
    $tabLib = array();
    if (is_string($_REQUEST["POS_CHOIX_LIB"]) == true)
    {
        $sChoixLib = $_REQUEST["POS_CHOIX_LIB"]; 
        if (substr($sChoixLib, -strlen(";")) === ";")
            $sChoixLib = substr($sChoixLib, 0, strlen($sChoixLib) - 1);

        $tabLib = explode(";", $sChoixLib);
        $sTypesDoc = $sChoixLib;
    }
	else
    {
        $tabLib = $POS_CHOIX_LIB;
       	// Construction de la chaine concaténant les librairies choisies
    	// pour le lien sur les numéros de page	
        for($i=0; $i<count($tabLib);$i++)
        {
            if($i == 0)
                $sTypesDoc .= $tabLib[$i];
            else
                $sTypesDoc .= ";".$tabLib[$i];
        }
    }
}

function getCodesRub($tabLib, &$tabCodeRub) {

	$tabCodeRub = array();
	// recherche dans toutes les rubriques plein-texte + fichiers 
	if (isset($_REQUEST["TYPE_CHOIX_RUB"]) && strcmp($_REQUEST["TYPE_CHOIX_RUB"], "RUB_ET_FIC") == 0)
	{
	   // laisse le tableau des rubriques vides
    }
    else {
        for($i=0;$i<count($tabLib);$i++)
        {
        	$tabCodeRub[$i] = "F X";
    	}
    }
}

?>