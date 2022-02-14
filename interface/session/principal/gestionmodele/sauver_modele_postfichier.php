<?php
/*
 * DESCRIPTION : Récupération d'un fichier par formulaire
 * AUTEUR : GG
 * DATE de CREATION : 26/09/2011
 *
 * Donnees en entree : 
 * POS_NUM_DOC
 * POS_NUM_PAGE
 * POS_NUM_SSPAGE  
 * POS_NOM_FICHIER 
 * MODIFICATION :
 */

session_start();
include ("../include/connexion.inc.php");
include ("../include/debug.inc.php");
include ("../../../../configuration_w/constantesPHP.conf.php");
include ("../../../../configuration/label_".$_SESSION["sess_langue"].".conf");
include ("../include/posdav.inc.php");

$szCheminRepdav = getRepDavSession(session_id());
echo "Chemin repdav : " . $szCheminRepdav . "\n";
echo "POS_NOMFICHIER : " . $_REQUEST["POS_NOMFICHIER"] . "\n";

$fileName = $szCheminRepdav.$_REQUEST["POS_NOMFICHIER"];
$szNomCompletModifieFichier = CST_REP_MODELES."\\".$_REQUEST["POS_NOMFICHIER"];
echo "fileName : " . $fileName. "\n";

if(!isset($_FILES["POS_FICHIER"]) || strlen(trim($_FILES["POS_FICHIER"]["name"])) == 0 || $_FILES["POS_FICHIER"]["size"] == 0 ||
    !file_exists($_FILES["POS_FICHIER"]["tmp_name"]) || filesize($_FILES["POS_FICHIER"]["tmp_name"]) == 0)
{
    echo "<RetourPoseidon>0</RetourPoseidon>";
    echo "\n<ErreurPoseidon>Erreur de transmission du fichier.</ErreurPoseidon>";
}
else
{
	$today = getdate();
	$szNomCompletModifieFichierSauv = sprintf("%s_%d%02d%02d_%02d%02d", $szNomCompletModifieFichier, $today["year"],$today["mon"],$today["mday"], $today["hours"], $today["minutes"]);
    
    // sauvegarde du modele existant
    if (!copy($szNomCompletModifieFichier, $szNomCompletModifieFichierSauv)) 
    {
        $tabErreur = error_get_last();
        echo "<RetourPoseidon>0</RetourPoseidon>";
        echo "\n<ErreurPoseidon>La sauvegarde du modele existant a échoué.</ErreurPoseidon>";
    }
    else
    {  
        // remplacement du modele
        if (!copy($_FILES["POS_FICHIER"]["tmp_name"], $szNomCompletModifieFichier)) 
        {
            $tabErreur = error_get_last();
            echo "<RetourPoseidon>0</RetourPoseidon>";
            echo "\n<ErreurPoseidon>La sauvegarde du nouveau a échoué.</ErreurPoseidon>";
        }
        else
        {
            echo "<RetourPoseidon>1</RetourPoseidon>";
            
            //suppression du fichier
            if (!unlink($fileName))
            {
                $tabMsgError = error_get_last();
                $tabError = array();
                echo $tabMsgError["message"];
            }
            $iTypeLancementAppl = getTypeLancementAppl();
            if ($iTypeLancementAppl == TYPE_LANCEMENT_APPL_JWS_SIMPLE || 
                                        $iTypeLancementAppl == TYPE_LANCEMENT_APPL_JWS_JS)
            {
                $jnlpFile = "jnlp_modele.jnlp";
                unlink($szCheminRepdav.$jnlpFile);
            }
        }
    }
}
?>