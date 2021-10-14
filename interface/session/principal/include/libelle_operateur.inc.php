<?php
if (!defined("LIBELLE_OPERATEUR_INC"))
{
    define("LIBELLE_OPERATEUR_INC",1);
/*
 * DESCRIPTION: Fournit le libellé d'un opérateur.
 *
 * AUTEUR: SABONNADIERE Marc
 *
 * VALEURS EN ENTREE: 
 *          typeRub: 	le type de rubrique (numérique, date, alpha multi ou mono)
 *			bMono: 		1 si rub alphanumérique monocritère, 0 sinon
 *          codeOpe: 	le code de l'operateur
 *
 * VALEURS EN SORTIE:
 *          aucune
 *
 * RETOUR: 
 *			libelleOpe: libellé de l'opérateur
 */
//*************************************************************************
//*************************************************************************

function get_libelle_operateur($ope, $jeton = -1, $sCodeRub = "")
{
    $type = "";
    if ($jeton != -1 && strlen($sCodeRub) != 0)
    {
        $retour = pos_getrubrique($jeton, $sCodeRub, /*pref*/$tabStInfoRub);
        if ($tabStInfoRub[0]->bMonoCritere != 1)
            $type = "MULTI_";
        else if ($tabStInfoRub[0]->wTypeRub == RUB_DATE)
            $type = "DATE_";
    }
    $tabDefine = get_defined_constants(true);
	if(strcmp($ope, "=") == 0)
		return isset($tabDefine['user']['CST_LIBELLE_OPE_'.$type.'EGAL']) ? $tabDefine['user']['CST_LIBELLE_OPE_'.$type.'EGAL'] : $tabDefine['user']['CST_LIBELLE_OPE_EGAL'];	
	else if(strcmp($ope, ":") == 0)
		return isset($tabDefine['user']['CST_LIBELLE_OPE_'.$type.'COMMENCE']) ? $tabDefine['user']['CST_LIBELLE_OPE_'.$type.'COMMENCE'] : $tabDefine['user']['CST_LIBELLE_OPE_COMMENCE'];	
	else if(strcmp($ope, ">") == 0)
		return isset($tabDefine['user']['CST_LIBELLE_OPE_'.$type.'SUP_EGAL']) ? $tabDefine['user']['CST_LIBELLE_OPE_'.$type.'SUP_EGAL'] : $tabDefine['user']['CST_LIBELLE_OPE_SUP_EGAL'];
	else if(strcmp($ope, "<") == 0)
		return isset($tabDefine['user']['CST_LIBELLE_OPE_'.$type.'INF_EGAL']) ? $tabDefine['user']['CST_LIBELLE_OPE_'.$type.'INF_EGAL'] : $tabDefine['user']['CST_LIBELLE_OPE_INF_EGAL'];
	else if(strcmp($ope, "*") == 0)
		return isset($tabDefine['user']['CST_LIBELLE_OPE_'.$type.'RESPECTE']) ? $tabDefine['user']['CST_LIBELLE_OPE_'.$type.'RESPECTE'] : $tabDefine['user']['CST_LIBELLE_OPE_RESPECTE'];
	else if(strcmp($ope, ")") == 0)
		return isset($tabDefine['user']['CST_LIBELLE_OPE_'.$type.'SUPERIEUR']) ? $tabDefine['user']['CST_LIBELLE_OPE_'.$type.'SUPERIEUR'] : $tabDefine['user']['CST_LIBELLE_OPE_SUPERIEUR'];
	else if(strcmp($ope,"(") == 0)
		return isset($tabDefine['user']['CST_LIBELLE_OPE_'.$type.'INFERIEUR']) ? $tabDefine['user']['CST_LIBELLE_OPE_'.$type.'INFERIEUR'] : $tabDefine['user']['CST_LIBELLE_OPE_INFERIEUR'];
	else if(strcmp($ope,"!") == 0)
		return isset($tabDefine['user']['CST_LIBELLE_OPE_'.$type.'DIFFERENT']) ? $tabDefine['user']['CST_LIBELLE_OPE_'.$type.'DIFFERENT'] : $tabDefine['user']['CST_LIBELLE_OPE_DIFFERENT'];
	else if(strcmp($ope,"/") == 0)
		return isset($tabDefine['user']['CST_LIBELLE_OPE_'.$type.'COMPRIS']) ? $tabDefine['user']['CST_LIBELLE_OPE_'.$type.'COMPRIS'] : $tabDefine['user']['CST_LIBELLE_OPE_COMPRIS'];	
    else if(strcmp($ope,"X") == 0)
		return isset($tabDefine['user']['CST_LIBELLE_OPE_'.$type.'SEMANTIQUE']) ? $tabDefine['user']['CST_LIBELLE_OPE_'.$type.'SEMANTIQUE'] : $tabDefine['user']['CST_LIBELLE_OPE_SEMANTIQUE'];	
    else if(strcmp($ope,"#") == 0)
		return isset($tabDefine['user']['CST_LIBELLE_OPE_'.$type.'NVIDE']) ? $tabDefine['user']['CST_LIBELLE_OPE_'.$type.'NVIDE'] : $tabDefine['user']['CST_LIBELLE_OPE_NVIDE'];	
    else if(strcmp($ope,"0") == 0)
		return isset($tabDefine['user']['CST_LIBELLE_OPE_'.$type.'VIDE']) ? $tabDefine['user']['CST_LIBELLE_OPE_'.$type.'VIDE'] : $tabDefine['user']['CST_LIBELLE_OPE_VIDE'];	
    else if(strcmp($ope,"%") == 0)
		return isset($tabDefine['user']['CST_LIBELLE_OPE_'.$type.'FORMAT']) ? $tabDefine['user']['CST_LIBELLE_OPE_'.$type.'FORMAT'] : $tabDefine['user']['CST_LIBELLE_OPE_FORMAT'];
    else if(strcmp($ope,"~") == 0)
		return isset($tabDefine['user']['CST_LIBELLE_OPE_'.$type.'NOT_FORMAT']) ? $tabDefine['user']['CST_LIBELLE_OPE_'.$type.'NOT_FORMAT'] : $tabDefine['user']['CST_LIBELLE_OPE_NOT_FORMAT'];	
}



function getLibelleChampsSpeciaux($code)
{
    $szLibelle = "";
    switch($code)
    {
        case "N D": 
            $szLibelle = CST_LIBELLE_RUB_RECH_NUMDOC;
        break;
        case "K H": 
            $szLibelle = CST_CHAMP_SPE_KH;
        break;
        case "N P": 
            $szLibelle = CST_LIBELLE_RUB_RECH_NBFIC;
        break;
        case "F X": 
            $szLibelle = CST_LIBELLE_RUB_RECH_FICHIERS;
        break;
        case "FtX": 
            $szLibelle = CST_LIBELLE_RUB_RECH_FTX_FICHIERS_ET_INDEX;
        break;
        case "FrX": 
            $szLibelle = CST_LIBELLE_RUB_RECH_FTX_INDEX;
        break;
        case "N R": 
            $szLibelle = CST_LIBELLE_RUB_RECH_NBPERES;
        break;
        case "NuP": 
            $szLibelle = CST_LIBELLE_RUB_RECH_NUMPERES;
        break;
    }
    return $szLibelle;
}
}
?>