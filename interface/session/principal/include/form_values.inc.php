<?php
//25.07.2007 PL les tableaux superglobaux sont nommés en conformité avec register_global=Off
if (!defined("FORM_VALUES"))
{
	define("FORM_VALUES",1);

// Recupere les valeurs du formulaire quelque soit la méthode d'envoi utilisée
	function get_form_values()
	{
		global $_POST, $_GET, $_SERVER;
	
		if($_SERVER["REQUEST_METHOD"] == "GET")
		{
			$form_values = $_GET;
		}
		else
		{
			if ($_SERVER["REQUEST_METHOD"] == "POST")
			{
				$form_values = $_POST;
			}
			else
			{
				$form_values = $GLOBALS;
			}
		}
		return $form_values;
	}
	
	/*
 	 * Recupere les valeurs du formulaire commençant prefixe par une
	 * valeur.
	 * $prefix : prefixe
 	 * $return_valeurs_vides : true si le tableau doit contenir aussi les valeurs vides,
	 * false sinon
	 *
	 */
	function get_form_values_with_prefix($prefix, $return_valeurs_vides)
	{
		$form_values = get_form_values();
		$form_values_with_prefix = array();
		reset($form_values);
		foreach($form_values as $key => $val)
		{
			// toutes les valeurs de rubriques sont ajoutees dans un tableau
			if (strcmp($prefix, substr($key, 0, strlen($prefix))) == 0)
			{
				if ($val != "" || ( $val == "" && $return_valeurs_vides))
				{
					$szCodeRub = substr($key, strlen($prefix));
					if ($szCodeRub == "K_H")
						$szCodeRub = "K H";
					$form_values_with_prefix[$szCodeRub] = $val;
				}
			}
		}
		
		return $form_values_with_prefix;
	}
    
    function calcValDefaut($szValeurRubDefaut)
	{
        if (strlen($szValeurRubDefaut) == 0)
            return $szValeurRubDefaut;
            
		// pas de gestion SYSTEM +- X, il faut utiliser $[DATE_SYSTEME+-X]
		if (strcmp($szValeurRubDefaut, "SYSTEM") == 0 || strcmp($szValeurRubDefaut, "$[SYSTEM]") == 0)
		{
		    $szValeurRubDefaut = date("d/m/Y", mktime(0,0,0,date("m"),date("d"), date("Y")));
		}
        elseif (strcmp($szValeurRubDefaut, "TIME") == 0)
		{
			$szValeurRubDefaut = date("H:i");
		}
		elseif (strcmp($szValeurRubDefaut, "DEPARTMENT") == 0)
		{
			$szValeurRubDefaut = $_SESSION["sess_service"];
		}
		elseif (strcmp($szValeurRubDefaut, "FUNCTION") == 0)
		{
			$szValeurRubDefaut = $_SESSION["sess_fonction"];
		}
		elseif (strcmp($szValeurRubDefaut, "UNITE") == 0)
		{
			$szValeurRubDefaut = $_SESSION["sess_unite"];
		}
		elseif (strcmp($szValeurRubDefaut, "ORGANISATION") == 0)
		{
			$szValeurRubDefaut = $_SESSION["sess_organisation"];
		} 
		
		if (strstr($szValeurRubDefaut, "$[DATE_SYSTEME]"))
		{
			$szValeurRubDefaut = str_replace("$[DATE_SYSTEME]", date("d/m/Y", mktime(0,0,0,date("m"),date("d"), date("Y"))), $szValeurRubDefaut);
		} 
		
		if (strstr($szValeurRubDefaut, '$[DATE_SYSTEME"%Y"]'))
		{
			// gestion Exercice
			$szValeurRubDefaut = str_replace('$[DATE_SYSTEME"%Y"]', date("Y"), $szValeurRubDefaut);
		} 
		
		// $[DATE_SYSTEME+-X]
		if (preg_match("/[$]\[DATE_SYSTEME([+-][0-9]*)\]/", $szValeurRubDefaut) > 0)
        {
            preg_match("/[$]\[DATE_SYSTEME([+-][0-9]*)\]/", $szValeurRubDefaut, $matches);
            $szValeurRubDefaut = str_replace($matches[0], date("d/m/Y", mktime(0,0,0,date("m"),date("d") + $matches[1], date("Y"))), $szValeurRubDefaut);
        } 
		if (strstr($szValeurRubDefaut, "$[TIME]"))
		{
			$szValeurRubDefaut = str_replace("$[TIME]", date("H:i"), $szValeurRubDefaut);
		}
		if (strstr($szValeurRubDefaut, "$[LIBUSER]"))
		{
			$szValeurRubDefaut = str_replace("$[LIBUSER]", $_SESSION["sess_libelle_nom_util"], $szValeurRubDefaut);
		}
        if (strstr($szValeurRubDefaut, "$[USER]"))
		{
		    $szValeurRubDefaut = str_replace("$[USER]", $_SESSION["sess_user_name"], $szValeurRubDefaut);
		}
		if (strstr($szValeurRubDefaut, "$[FUNCTION]"))
		{
			$szValeurRubDefaut = str_replace("$[FUNCTION]", $_SESSION["sess_fonction"], $szValeurRubDefaut);
		}
		if (strstr($szValeurRubDefaut, "$[DEPARTMENT]"))
		{
			$szValeurRubDefaut = str_replace("$[DEPARTMENT]", $_SESSION["sess_service"], $szValeurRubDefaut);
		}
		
        if (strstr($szValeurRubDefaut, "$[UNITE]"))
		{
			$szValeurRubDefaut = str_replace("$[UNITE]", $_SESSION["sess_unite"], $szValeurRubDefaut);
		}
		if (strstr($szValeurRubDefaut, "$[ORGANISATION]"))
		{
			$szValeurRubDefaut = str_replace("$[ORGANISATION]", $_SESSION["sess_organisation"], $szValeurRubDefaut);
		}
		if (strstr($szValeurRubDefaut, "$[HABILITATION]"))
		{
			$szValeurRubDefaut = str_replace("$[HABILITATION]", $_REQUEST["POS_CONF_LIBELLE_HAB"], $szValeurRubDefaut);
		}
		if (strstr($szValeurRubDefaut, "#MASQ"))
		{
			$szValeurRubDefaut = "";
		}
		
		return $szValeurRubDefaut;
	}
    
    /*
 	 * Remplace les codes des domaines fermés par les libellés
	 *
	 */
	function replaceLibelleCodeDf($jeton, $strSens, $strListeCodeRub, &$tabCodeValRub)
	{
	    $retour = true;
		$tabListeCodeRub = explode (",", $strListeCodeRub);
		$iCompt = 0;
		$tabLstRubTrt = array();
		for($i=0;$i<count($tabListeCodeRub);$i++)
		{
		    if (isset($tabCodeValRub[$tabListeCodeRub[$i]]) && strlen($tabCodeValRub[$tabListeCodeRub[$i]]))
		    {
                $tabLstRubTrt[$iCompt]["wTrt"] = 1;
        		$tabLstRubTrt[$iCompt]["szCodeRub"] = $tabListeCodeRub[$i];
        		$tabLstRubTrt[$iCompt]["pszValeurRub"] = $tabCodeValRub[$tabListeCodeRub[$i]];
        		$iCompt++;
    		}
        }
        //error_log(print_r($tabLstRubTrt, true));
        if (count($tabLstRubTrt) > 0)
        {
            // define ("POS_CODE_DF", 2); define ("POS_LIBELLE_DF", 3);
            $wSens = (strcmp($strSens, "LIB2CODE") == 0) ? 3 : 2;
            //error_log("wSens :: $wSens\n");
            $retour = pos_convrubdfcodelib($jeton, "000", $wSens, $tabLstRubTrt, $tabLstRubTrtOut);
            //error_log(print_r($tabLstRubTrtOut, true));
            if ($retour)
            {
                for($i=0;$i<count($tabLstRubTrtOut);$i++)
        		{
        		    if (isset($tabCodeValRub[$tabLstRubTrtOut[$i]->szCodeRub]))
        		    {
        		        // reaffecte la valeur associe au code
                        $tabCodeValRub[$tabLstRubTrtOut[$i]->szCodeRub] = $tabLstRubTrtOut[$i]->pszValeurRub;
            		}
                }
            }
        }
        //print_r($tabCodeValRub);
        return $retour;
	}

	function htmlentities_currentcharset($val, $gestionquote)
	{
        return htmlentities($val, $gestionquote, "ISO-8859-15");
    }
	
    function htmlspecialchars_currentcharset($val)
	{
        return htmlspecialchars($val, ENT_COMPAT,'ISO-8859-1', true);
    }
    
    function htmlspecialchars_currentcharset_cote($val, $gestionquote)
	{
        return htmlspecialchars($val, $gestionquote,'ISO-8859-1', true);
    }
}
?>
