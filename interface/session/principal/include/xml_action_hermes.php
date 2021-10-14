<?php

if (!defined("XML_ACTION_HERMES"))
{
	define("XML_ACTION_HERMES",1);
    
	class ActionHermesLr {

		var $szLibelle;
	 	var $tabRubrique;
	
		// Constructeur 
		function __construct($szLibelle, $tabRubrique) 
		{
			$this->szLibelle = $szLibelle;
			$this->tabRubrique = $tabRubrique;
		}
	}
	
    function getListeActionsFromXml($szFileName, $szBalEnCours, $szTypeEnCours, $szProfilEnCours, $szFonctionEnCours) 
    {
        $tabListeActions = array();
        $iNbActions = 0;
        $dom = new DOMDocument('1.0', 'iso-8859-1');
        
        // load the html into the object 
        $dom->loadXML(file_get_contents($szFileName)); 
        
        // discard white space 
        $dom->preserveWhiteSpace = false; 
        
        // la liste des actions 
        $actions = $dom->getElementsByTagName('action'); 
        
        // boucle sur els actions 
        for($i=0;$i<$actions->length;$i++) 
        { 
            $actionNode = $actions->item($i);
            
            if ($actionNode->nodeType == XML_ELEMENT_NODE)
            {
            	$bAfficheAction = true;
            	$actionLibelle = $actionNode->getElementsByTagName('action-libelle');
            	$szActionLibelle = utf8_decode($actionLibelle->item(0)->nodeValue);
            	
            	if (strlen($szActionLibelle) == 0)
            		$bAfficheAction = false;
            	
            	if ($bAfficheAction && $actionNode->getElementsByTagName('action-liste-filtre')->length > 0) {
            		
            		$listeFiltreNodeListe = $actionNode->getElementsByTagName('action-liste-filtre')->item(0)->childNodes;
            		// pour toutes les filtre de l'action
            		for($j=0;$j<$listeFiltreNodeListe->length;$j++) 
            		{
            		    $filtreNode = $listeFiltreNodeListe->item($j);
            		    if ($filtreNode->nodeType == XML_ELEMENT_NODE) {
                            
                            // rappel : ecriture d'un filtre
                            //<filtre-bal>
                            //    <element>Courriers arrivés à traiter</element>
                            //    <element>Courriers arrivés (FRA)</element>
                            //</filtre-bal>
                        	if ($bAfficheAction && strcmp($filtreNode->nodeName, "filtre-bal") == 0) {
            					
            					$bAfficheAction = checkFiltre($filtreNode, $szBalEnCours);
            				}
            				if ($bAfficheAction && strcmp($filtreNode->nodeName, "filtre-typedoc") == 0) {
            					
            					$bAfficheAction = checkFiltre($filtreNode, $szTypeEnCours);
            				}
            				if ($bAfficheAction && strcmp($filtreNode->nodeName, "filtre-profil-utilisateur") == 0) {
            					$bAfficheAction = checkFiltre($filtreNode, $szProfilEnCours);
            				}
                            if ($bAfficheAction && strcmp($filtreNode->nodeName, "filtre-fonction-utilisateur") == 0) {
            					$bAfficheAction = checkFiltre($filtreNode, $szFonctionEnCours);
            				}
            			}
            		}
            	}
            	
            	$iNbRubrique = 0;
            	if ($bAfficheAction)
            	{
            	    $tabInfoAction = array();
            	    $tabRubrique = getListeRubriquesActionHermesByNode($actionNode);
            	    $tabInfoAction['libelle'] = $szActionLibelle;
            	    $tabInfoAction['tabRubrique'] = $tabRubrique;
            	    
                	$tabListeActions[$iNbActions] = $tabInfoAction;
                	$iNbActions++;
                }
            }
        }
        return $tabListeActions;
    }
    
    
    function getListeRubriquesActionHermes($szFileName, $szActionParam) 
    {
        $tabRubrique = array();
        $dom = new DOMDocument('1.0', 'iso-8859-1');
        
        // load the html into the object 
        $dom->loadXML(file_get_contents($szFileName)); 
        
        // discard white space 
        $dom->preserveWhiteSpace = false; 
        
        // la liste des actions 
        $actions = $dom->getElementsByTagName('action'); 
        
        // boucle sur els actions 
        for($i=0;$i<$actions->length;$i++) 
        { 
            $actionNode = $actions->item($i);
            
            if ($actionNode->nodeType == XML_ELEMENT_NODE)
            {
            	$actionLibelle = $actionNode->getElementsByTagName('action-libelle');
            	$szActionLibelle = utf8_decode($actionLibelle->item(0)->nodeValue);
            	
            	if (strcmp($szActionLibelle, $szActionParam) == 0)
            	{
                    $tabRubrique = getListeRubriquesActionHermesByNode($actionNode);
                }
            }
        }
        return $tabRubrique;
    }
    
    function getTypeDocActionHermes($szFileName, $szActionParam) 
    {
        $szCodeTypeDoc = "000";
        $dom = new DOMDocument('1.0', 'iso-8859-1');
        
        // load the html into the object 
        $dom->loadXML(file_get_contents($szFileName)); 
        
        // discard white space 
        $dom->preserveWhiteSpace = false; 
        
        // la liste des actions 
        $actions = $dom->getElementsByTagName('action'); 
        
        // boucle sur les actions 
        for($i=0;$i<$actions->length;$i++) 
        { 
            $actionNode = $actions->item($i);
            
            if ($actionNode->nodeType == XML_ELEMENT_NODE)
            {
            	$actionLibelle = $actionNode->getElementsByTagName('action-libelle');
            	$szActionLibelle = utf8_decode($actionLibelle->item(0)->nodeValue);
            	
            	if (strcmp($szActionLibelle, $szActionParam) == 0)
            	{
            	    if ($actionNode->getElementsByTagName('action-liste-filtre')->length > 0) 
                    {
                		$listeFiltreNodeListe = $actionNode->getElementsByTagName('action-liste-filtre')->item(0)->childNodes;
                		// pour toutes les filtre de l'action
                		for($j=0;$j<$listeFiltreNodeListe->length;$j++) 
                		{
                		    $filtreNode = $listeFiltreNodeListe->item($j);
                		    if ($filtreNode->nodeType == XML_ELEMENT_NODE) 
                            {
                				if (strcmp($filtreNode->nodeName, "filtre-typedoc") == 0) 
                                {
                					$szCodeTypeTmp = "";
                                	$nlList = $filtreNode->childNodes;
                                	for ($k = 0; $k < $nlList->length; $k++) 
                                    {
                                		if ($nlList->item($k)->nodeType == XML_ELEMENT_NODE) 
                                        {
                                			$eElementBal = $nlList->item($k);
                                			if (strlen($szCodeTypeTmp) == 0)
                                			     $szCodeTypeTmp = utf8_decode($eElementBal->nodeValue);
                                			if (strcmp(utf8_decode($eElementBal->nodeValue), $szCodeTypeTmp) != 0)
                                			     $szCodeTypeTmp = "000";
                            		    }
                            		}
                            		$szCodeTypeDoc = $szCodeTypeTmp;
                			     }
                		    }
                	   }
    		      }
    	       }
    	    }
    	}
    	return $szCodeTypeDoc;
    }
    
    function getListeRubriquesActionHermesByNode($actionNode)
    {
        $tabRubrique = array();
        $iNbRubrique = 0;
        // recherche des rubriques à afficher 
	    if ($actionNode->getElementsByTagName('action-liste-rubrique')->length > 0) 
        {
            $listeRubriqueNodeListe = $actionNode->getElementsByTagName('action-liste-rubrique')->item(0)->childNodes;
            
    		// pour toutes les filtre de l'action
    		for($j=0;$j<$listeRubriqueNodeListe->length;$j++) 
    		{
    		    $rubriqueNode = $listeRubriqueNodeListe->item($j);
    		    if ($rubriqueNode->nodeType == XML_ELEMENT_NODE) {
                
                    $objUneRubrique = array();
                    $nlList = $rubriqueNode->childNodes;
                    	
                    // les informations d'une rubrique
                    for ($k = 0; $k < $nlList->length; $k++) {
                        if ($nlList->item($k)->nodeType == XML_ELEMENT_NODE) {
                            
                    		$objUneRubrique[$nlList->item($k)->nodeName] = utf8_decode($nlList->item($k)->nodeValue);
                        }
                    }
                    if (count($objUneRubrique) > 0)
                        $tabRubrique[$iNbRubrique++] = $objUneRubrique;
    			}
    		}
        }
        return $tabRubrique;
    }
    
    function checkFiltre($eElement, $sValue)
    {
    	$bCheckBal = false;
    	$nlList = $eElement->childNodes;
    	for ($k = 0; $k < $nlList->length; $k++) {
    		if ($nlList->item($k)->nodeType == XML_ELEMENT_NODE) {
    			$eElementBal = $nlList->item($k);
    			if (strcmp(utf8_decode($eElementBal->nodeValue), $sValue) == 0) {
    				$bCheckBal = true;
    				break;
    			}
    		}
    	}
    	return $bCheckBal;
    }
}
?>
