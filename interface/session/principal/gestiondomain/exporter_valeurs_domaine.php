<?php
/*
 * DESCRIPTION : Exportation de la liste des valeur d'un domaine fermé au format excel
 * AUTEUR : Gabrielle Guy
 * DATE de CREATION : 13/08/2010
 * Donnees en entree : 
 * POS_CODE_RUB : code de la rubrique
 * MODIFICATIONS
 */
session_start();
include ("../include/connexion.inc.php");
include ("../include/debug.inc.php");
include ("../include/template.inc.php");
include ("../include/liste_vocab.inc.php");
include ("../include/fonction_util.inc.php");
include ("../../../../configuration_w/constantesPHP.conf.php");
include ("../../../../configuration/label_".$_SESSION["sess_langue"].".conf");

$retour = connexion($jeton);
if($retour) 
{
	$file_export = tempnam(getRepTmpSession(session_id()), "POS_");
    $retour = pos_getinforub($jeton, $_REQUEST['POS_CODE_RUB'], /*pref*/$tabInfoOneRub);
	$retour = getListeTousMotDf($jeton, $_REQUEST['POS_CODE_RUB'], POS_CODE_DF, 
                            $tabInfoOneRub->typerub, /*pref*/$liste_mots);
	if (!$retour)
	   debug($jeton);
	//On déconnecte ici car si le téléchargement du fichier est annulé cela fait un exit
	//et la connexion au serveur reste persistante
	pos_disconnect($jeton);
	if($retour)
	{
        $handle = fopen($file_export, 'w');	
		if ($tabInfoOneRub->typerub == POS_RUB_ALPHA) {
            //la cle est le libelle, le code la valeur !
    		foreach($liste_mots as $codeterme => $libelleterme)
    		    fwrite($handle, $codeterme.";".$libelleterme."\n");
        }
        else {
            foreach($liste_mots as $codeterme => $libelleterme)
    		    fwrite($handle, $libelleterme."\n");
        }
        
		fclose($handle);
        
        if (file_exists($file_export))
		{
			// on l'ouvre en lecture
			$fp= fopen($file_export,"rb");

            header("Cache-Control: ");// leave blank to avoid IE errors
			header("Pragma: ");// leave blank to avoid IE errors
			//definition du type MIME du fichier si excel, rien si XML
			header("Content-Type: text/csv");
			header("Content-Length: " . filesize($file_export));
			header("Content-Disposition: attachment; filename=export_".$_REQUEST['POS_CODE_RUB'].".csv;");
			//affichage du fichier, on passe l'ID du fichier
			fpassthru($fp);
			flush();
			// fermeture du fichier
			fclose($fp);
			//suppression du fichier
			unlink($file_export);
		}		
	}
}
else
{
	debug($jeton);
	echec_connexion();
}
?>
