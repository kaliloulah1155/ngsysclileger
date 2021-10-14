<?php
/*
 * Affichage d'un fichier
 */
session_start();
include ("../../../../configuration_w/constantesPHP.conf.php");
include ("../../../../configuration/url.conf.php");
include ("../include/fonction_util.inc.php");
$szNomFichier = $_REQUEST["file"];
$szNomFichierComplet = getRepTmpSession(session_id()).$szNomFichier;

//on récupère le fichier contenant la liste des types mime du serveur
$mimeFile = "mime.types";

//affectation du fichier dans un tableau 1 ligne=1 case du tableau
$array = file ($mimeFile);

$szExtension = strrchr($szNomFichierComplet, ".");
$szExtension = strtolower(substr($szExtension, 1));

//on traite chaque ligne pour extraire les types mimes et les extensions
while (list($line_num, $line) = each ($array))
{
	//suppression des tabulations et du surplus d'espace
	$array[$line_num] = preg_replace("/ +/", " ", $array[$line_num]);
	$array[$line_num] = preg_replace("/\t+/", " ", $array[$line_num]);
	//on extrait dans un tableau la ligne en cours avec pour separateur l'espace
	$arrayLine = explode (" ", $array[$line_num]);

	//l'indice 0 correspond au type MIME, les autres, aux différentsextensions associées
	for ($i=1;$i<count ($arrayLine);$i++)
	{
		$str = $arrayLine[$i];
		//si l'extensions est la meme que celle de notre fichier, on récupère le type MIME
		if (strcmp(strtolower(trim($str)), $szExtension) == 0)
		{
    		$szTypeMime = $arrayLine[0];
    		break;
		}
	}
}	
if (file_exists($szNomFichierComplet))
{
    // on l'ouvre en lecture
    $fp = fopen($szNomFichierComplet,"rb");
    
    //définition du type MIME du fichier
    header("Content-Type: ".$szTypeMime."");
	header("Cache-Control: ");// leave blank to avoid IE errors
	header("Pragma: ");// leave blank to avoid IE errors
	header("Content-Length: ".filesize($szNomFichierComplet)."");
    if(endsWith($szNomFichier, ".docx") ||
        endsWith($szNomFichier, ".xlsx") ||
        endsWith($szNomFichier, ".pptx") ||
        endsWith($szNomFichier, ".rtf"))
		header("Content-Disposition: attachment; filename=\"".$szNomFichier."\";");
	else
	    header("Content-Disposition: inline; filename=\"".$szNomFichier."\";");
    
    //header("Content-Disposition: attachment; filename=downloaded.".$szNaturePage);
    //affichage du fichier, on passe l'ID du fichier
    fpassthru($fp);
    flush();
    
    // fermeture du fichier
    fclose($fp);
    
    //suppression du fichier
    //unlink($szNomFichierComplet);
    /* Pour faire la fermeture de la page blanche automatiquement
pas en standart car pb si consultation du word en interne
$szLoadUrl = URL_CONSULTER_FICHIER2."?POS_FILE=".$szNomFichierComplet."&POS_MIME=".$szTypeMime;
    
    // construction de la page HTML
	echo "<HTML>\n";
	echo "<HEAD>\n";
	echo "<LINK REL=\"stylesheet\" TYPE=\"text/css\" HREF=\"".URL_SITE."/include/style/style.css\">\n";
	echo "<SCRIPT language=\"javascript\">\n";
	echo "function ouvrirFichier() \n{ \n\twindow.location.href='$szLoadUrl';\n}\n";
	echo "</SCRIPT>\n";
	echo "</HEAD><BODY onLoad='ouvrirFichier()'><FONT class=labelChamp>\n";
						
	echo "Chargement en cours...";
		
	echo "</FONT><CENTER>\n";
	echo "</CENTER><script language='javascript'> setTimeout('self.close();',10000)</script></BODY>\n</HTML>\n";
    */
}
else
{
	echo "Le fichier $szNomFichierComplet n'existe pas";
}

function endsWith($haystack, $needle) {
    // search forward starting from end minus needle length characters
    return $needle === "" || (($temp = strlen($haystack) - strlen($needle)) >= 0 && strpos($haystack, $needle, $temp) !== FALSE);
}
?>
