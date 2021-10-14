<?php
if (!defined("FONCTION_TABLEAU"))
{
	define("FONCTION_TABLEAU", 1);
	include ("../../../../configuration/url.conf.php");
	function scriptListeTableauCodeHtml($szCodeTypeDoc, $szValRub, $szMode, $szCodeRub, $szDroitHermes, $bModif)
	{
		echo "<html>";
		echo "<head>";
		echo "<SCRIPT language=\"javascript\" SRC=\"".URL_JS_TABLEAU."\"></SCRIPT>";
		echo "</head>";
		echo "<script>";
		echo scriptListeTableau($szCodeTypeDoc, $szValRub, $szMode, $szCodeRub, $szDroitHermes, $bModif);
		echo "</script>";
		echo "</html>";	
	}
	
	function scriptListeTableau($szCodeTypeDoc, $szValRub, $szMode, $szCodeRub, $szDroitHermes, $bModif)
	{
		$str  = "";
		$str .= "afficherLienListeTableau('".URL_AFFICHER_LISTE_TABLEAU."?";
        $str .= $bModif ? "ISMODIF=1&" : "";
		$str .= "POS_TYPEDOC_PERE=$szCodeTypeDoc&POS_VALEUR_TAB_RUB=$szValRub&MODE=$szMode&POS_CODE_RUB=$szCodeRub&HERM_DROITS=$szDroitHermes', '$szCodeRub')";
		return $str;
	}
	
	function afficheEntete($jeton, $szProfilLR, &$t, &$iNbCol, &$tabZoneLR)
    {
    	$tabZoneLR = array();
    	// profil de la liste resumee
    	$retour = pos_gestplr($jeton, $szProfilLR, /*pref*/$objLR, /*pref*/$tabZoneLR);
    	
    	if ($retour)
    	{	
    		$iNbCol = count($tabZoneLR);	
    		for ($i=0;$i<count($tabZoneLR);$i++) 
    		{
    			$t->set_var("TITRE_COLONNE", $tabZoneLR[$i]->zone_titre_col);
    			$t->set_var("CODE_RUB", $tabZoneLR[$i]->zone_code_rub_ref);
    			$t->parse("entete", "ENTETE", true);
    		}
    	}
    	return $retour;
    }
}
?>
