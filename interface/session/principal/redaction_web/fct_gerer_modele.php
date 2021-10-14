<?php
/*
 *
 */ 
function replaceContenuModeleHtmlToTiny_MCE($contenu)
{

    // ancien fonctionnement mais pb multi-lignes
    //$patterns[1] = '/<pos:text id="postext[0-9]+">(?!<\/pos:text>)(.*)<\/pos:text>/';
	//$replacements[1] = '[Zone de texte libre : \\1]';
			
    $newContenu = "";
    $patterns = array();
	$patterns[0] = '/<pos:field key="(\w+)"\/>/';
	$replacements[0] = '[rubrique [\\1][XXX\\1XXX]]';
	$newContenu =  preg_replace($patterns, $replacements, $contenu);

	$patternBeginPosText = '/<pos:text id="postext[0-9]+">/';
	$szEndPosText = '</pos:text>';
	$replacements[1] = '[Zone de texte libre : \\1]';
	$offsetEnCours = 0;
	$matches = array();
    while(true)
    {
        // recherche une occurence du pattern de debut
        if (preg_match($patternBeginPosText, $newContenu, $matches, 0, $offsetEnCours) == 1)
        {
            // recherche la position de la chaine trouvee
            $pos1 = strpos($newContenu, $matches[0]);
            
            // recherche le tag de fin
            $offsetEnCours = $pos1 + strlen($matches[0]);
            $pos2 = strpos($newContenu, $szEndPosText, $offsetEnCours);
            
            if ($pos2 !== false)
            {
                $offsetEnCours = $pos2 + strlen($szEndPosText);
                $tmp = substr($newContenu, 0, $pos1)
                            ."[Zone de texte libre : "
                            .substr($newContenu, ($pos1 + strlen($matches[0])), $pos2 - ($pos1 + strlen($matches[0])))
                            ."]";
                $len = strlen($tmp);
                
                $newContenu = $tmp.substr($newContenu, $offsetEnCours);
                $offsetEnCours = $len;
            }
            else
                break;
        }
        else
            break;
    }
    return $newContenu;
}
?>
