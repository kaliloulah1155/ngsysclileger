<?php

if (!defined("GET_KH"))
{
    define("GET_KH",1);
    
    function get_valeur_kh($jeton, $szTypeDoc, $szValInitKH, &$szValFinKH)
    {
        $szValFinKH = "";
    	// Recherche du paramétrage de la K H.
    	//$retour = pos_getinfotype($jeton, $szTypeDoc, /*pref*/$objInfoType, /*pref*/$tabInfoZonesKeys);
        $retour = get_infotypecache($jeton, $szTypeDoc, /*pref*/$objInfoType, /*pref*/$tabInfoZonesKeys);	

    	if($retour)
    	{
    		for($i=0;$i<$objInfoType->kh_nbzones;$i++)
    		{
    			$tabLgZoneKH[$i]=$tabInfoZonesKeys[$szTypeDoc][$i]->kh_zone_lg;
    		}
    	
    		$debZone=0;
    		for($i=0;$i<count($tabLgZoneKH);$i++)
    		{
    			if($i != 0)
    				$debZone += $tabLgZoneKH[$i-1];
    
    			if($i == count($tabLgZoneKH)-1)
    				$szValFinKH.=substr($szValInitKH,$debZone,$tabLgZoneKH[$i]);
    			else
    				$szValFinKH.=substr($szValInitKH,$debZone,$tabLgZoneKH[$i]).SEPARATEUR_KH;
    		}
    	}
    	else
    		debug($jeton);
    		
    	return $retour;
    }
    
    function get_infotypecache($jeton, $szTypeDoc, &$objInfoType, &$tabInfoZonesKeys)
    {
        $retour = true;
    	// Recherche du paramétrage de la K H.
    	if (isset($_SESSION["sess_tabInfoType"][$szTypeDoc]))
    	{
    	   $objInfoType = $_SESSION["sess_tabInfoType"][$szTypeDoc];
    	   $tabInfoZonesKeys = $_SESSION["sess_tabInfoTypeKH"][$szTypeDoc];
        }
        else
        {
        	$retour = pos_getinfotype($jeton, $szTypeDoc, /*pref*/$objInfoType, /*pref*/$tabInfoZonesKeys);	
        	if($retour)
        	{
                $_SESSION["sess_tabInfoType"][$szTypeDoc] = $objInfoType;
                $_SESSION["sess_tabInfoTypeKH"][$szTypeDoc] = $tabInfoZonesKeys;
        	}
        	else
        		debug($jeton);
        }
    	return $retour;
    }
}

?>
