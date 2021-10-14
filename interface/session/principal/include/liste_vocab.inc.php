<?php

if (!defined("LISTE_VOCAB"))
{
	define("LISTE_VOCAB",1);
    // type de rubrique
    define ("POS_RUB_ALPHA", 0);
    
    // type de vocabulaire possible
    define ("POS_VOCAB_USED", 1);
    define ("POS_CODE_DF", 2);
    define ("POS_LIBELLE_DF", 3);
    define ("POS_VOCAB_THE", 4);
    define ("POS_VOCAB_RUB_LIEE", 5);
    define ("POS_VOCAB_HIE_CODE", 6);
    define ("POS_VOCAB_HIE_LIBELLE", 7);
    
    if (!defined("SEPARATEUR"))
        define ("SEPARATEUR", "\x02");
    define("CST_MAX_VOCAB_RECUP", 30);
    
    /******************************************************************
     * Description : Extraction de la liste du vocabulaire d'une rubrique 
     * Donnees en entree :
     * $szListe -> Liste vocabulaire
     * $iTypeVoc -> type de vocabulaire (cf en-tete fichier pour la liste)
     * return : mots extraits de la liste du vocabulaire
     * 
     * Si c'est un domaine fermé d'une rubrique alphanumerique, retourne
     * un tableau associatif avec les codes en cle et les libelles en valeur.
     * Si c'est un domaine fermé d'une rubrique non alphanumerique, retourne
     * un tableau associatif avec, pour chaque element, une cle et une valeur
     * identique egale a une valeur finie du DF
     * Sinon retourne un tableau indexé contenant les mots de vocabulaire
    /******************************************************************/
    function extraireVocab($szListe, $iTypeVoc, $iTypeRub)
    {
    	$tok = strtok($szListe, SEPARATEUR);
    	$nbMots = 0;
    	$mots = array();
        // w: deplace le test sur token vide à l'interieur du while (pas d'arrêt)
    	while($tok != null/* && strlen(trim($tok))*/)
    	{
    	    if (strlen (trim ($tok))) {
        		if ( (($iTypeVoc == POS_CODE_DF || $iTypeVoc == POS_LIBELLE_DF) && $iTypeRub == POS_RUB_ALPHA)
        			|| $iTypeVoc == POS_VOCAB_HIE_CODE || $iTypeVoc == POS_VOCAB_HIE_LIBELLE )
        		{
        			// 09/12/2010 : inversion le code est toujours l'index du tableau
    				$code = $tok;
    				$libelle = strtok(SEPARATEUR);
        			$mots[$code] = $libelle;
        		}
        		else
        		{
        			$mots[$nbMots]=$tok;
        		}
        		$nbMots ++;
    	    }
    		$tok = strtok(SEPARATEUR);
    	}
    
    	return $mots;
    }
    
    function extraireVocabHierarchique($szListe, $iTypeVoc, $iTypeRub)
    {
    	$tok = strtok($szListe, SEPARATEUR);
    	$nbMots=0;
    	$mots = array();
    
    	while($tok != null && strlen(trim($tok)))
    	{
    		
    		$libelle=$tok;
    		$code=strtok(SEPARATEUR);
    		
    		if(strlen(trim($code))>0)
    			$mots[$code]=$code;
    		if(strlen(trim($libelle))>0)
    	   		$mots[$libelle]=$libelle;
    		$nbMots ++;
    		$tok=strtok(SEPARATEUR);
    	}
    
    	
    	return $mots;
    }
    
    function getListeTousMotDf($jeton, $szCodeRub, $iTypeVocab, $iTypeRub, &$liste_mots)
    {
        $liste_mots = array();
        $szListeCompleteVocab = "";
        $iNbMotsDemandes = 100*2;
        $szDebutMot = "";
        $bNextVal = 1;
        $icpt = 0;
        do 
        {
            $szVocab = "";
            $retour = pos_listevocab($jeton, "000", $szCodeRub, $iTypeVocab, 
                							$szDebutMot, $bNextVal, $iNbMotsDemandes, /*pref*/$iNbLu, /*pref*/$szVocab);
            $szVocab = trim($szVocab);
            if (strlen($szVocab) > 0)
            {
                // recherche par la fin : dernière occ : fin de chaine, avant-dernière : le libellé (ou code), 
                // avant-avant-dernière : le code (ou libelle : la zone de tri)
                $pos0 = strrpos($szVocab, SEPARATEUR);
                if ($pos0 !== false)
                    $pos1 = strrpos($szVocab, SEPARATEUR, -(strlen($szVocab) - $pos0 + 1));
                
                if ($pos0 !== false && $pos1 !== false)
                    $pos2 = strrpos($szVocab, SEPARATEUR, -(strlen($szVocab) - $pos1 + 1));
                // le code du dernier terme de la liste
                if ($pos0 !== false && $pos1 !== false && $pos2 !== false)
                {
                    if ($iTypeVocab == POS_CODE_DF || $iTypeVocab == POS_VOCAB_HIE_CODE)
                        $szDebutMot = substr($szVocab, $pos2 + 1, ($pos1 - $pos2) - 1);
                    else
                        $szDebutMot = substr($szVocab, $pos1 + 1, ($pos0 - $pos1) - 1);
                }
                //echo "szDebutMot : $szDebutMot<br>/n";
            }
            $szListeCompleteVocab .= $szVocab;
            $icpt++;
        }
        while ($iNbLu >= $iNbMotsDemandes && strlen($szDebutMot) > 0);
                        
        if($retour)
        {	
            $liste_mots = extraireVocab($szListeCompleteVocab, POS_CODE_DF, $iTypeRub);
        }
        return $retour;
    }
    //END FONCTION
    //*************************************************************************
    //*************************************************************************
}
?>
