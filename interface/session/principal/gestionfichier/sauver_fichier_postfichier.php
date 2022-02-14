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

// activer si pb sur version Java
//if (isset($_REQUEST["PHPSESSID"]) && strlen($_REQUEST["PHPSESSID"]))
//    session_id($_REQUEST["PHPSESSID"]);
session_start();
include ("../include/connexion.inc.php");
include ("../include/debug.inc.php");
include ("../../../../configuration_w/constantesPHP.conf.php");
// le message principal est affiche sur perte de session, mieux vaut utiliser la langue de l'app 
include ("../../../../configuration/label_".CST_LANG.".conf");
include ("../include/posdav.inc.php");

$iNumDoc = $_REQUEST["POS_NUM_DOC"];
$iNumPage = $_REQUEST["POS_NUM_PAGE"];
$iNumSsPage = $_REQUEST["POS_NUM_SSPAGE"];
$szNomFichier = $_REQUEST["POS_NOMFICHIER"];
$szCheminRepdav = getRepDavSession($_REQUEST["PHPSESSID"]);

echo "Numéro poseidon : " . $iNumDoc . "\n";
echo "Numéro de page : " . $iNumPage . "\n";
echo "Numéro de sous-page : " . $iNumSsPage . "\n";
echo "Nom du fichier : " . $szNomFichier . "\n";
echo "Chemin repdav : " . $szCheminRepdav . "\n";

if ($iNumDoc == 0) 
{
    echo "<RetourPoseidon>0</RetourPoseidon>";
	echo "<ErreurPoseidon>Erreur lors de la récupération du numéro informatique Poseidon.</ErreurPoseidon>";
	exit;
}

$retour = connexion($jeton);
if ($retour)
{
    // recuperation des informations du fichier pour pouvoir reenregistrer
	$retour = pos_getinfopage($jeton, $iNumDoc, $iNumPage,  $iNumSsPage, /*pref*/$objPage);

	$fileNameExt = "POS".$iNumDoc."_".$iNumPage."_".$iNumSsPage.".".$objPage->szExtension;
	$fileNamePosDav = $szCheminRepdav.$fileNameExt;

    if(!isset($_FILES["POS_FICHIER"]) || strlen(trim($_FILES["POS_FICHIER"]["name"])) == 0 ||
        $_FILES["POS_FICHIER"]["size"] == 0)
    {
        echo "<RetourPoseidon>0</RetourPoseidon>";
        echo "\n<ErreurPoseidon>".CST_APPLET_ERR_FICHIER_NON_TRANSMIS."</ErreurPoseidon>";
    }
	else
	{
		if (file_exists($_FILES["POS_FICHIER"]["tmp_name"]) && filesize($_FILES["POS_FICHIER"]["tmp_name"]) > 0)
		{
			$retour = pos_remplacepagenumdoc($jeton, $iNumDoc, $iNumPage, $iNumSsPage, 
					$objPage->wIndConf, $objPage->wNivConf, $objPage->szCloison, 
					$objPage->szNature, $objPage->szFondPage,  
					$objPage->szNomFichierOriginal, 
					$_FILES["POS_FICHIER"]["tmp_name"]);
            if ($retour) {
                if (isset($_REQUEST["MODE_SIGNATURE"]) && $_REQUEST["MODE_SIGNATURE"] == "1") {
                    storeStateSignFile($iNumDoc, $iNumPage, $iNumSsPage, 1);
                }
            }
		}
	}
	//suppression du fichier dans le répertoire posdav
	unlink($fileNamePosDav);
    $iTypeLancementAppl = getTypeLancementAppl();
    if ($iTypeLancementAppl == TYPE_LANCEMENT_APPL_JWS_SIMPLE || 
                                $iTypeLancementAppl == TYPE_LANCEMENT_APPL_JWS_JS)
    {
        $jnlpFile = getFileNameJnlp($iNumDoc, $iNumPage, $iNumSsPage);
        unlink($szCheminRepdav.$jnlpFile);
    }
	if (!$retour)
	{
        $msg = get_erreur_poseidon($jeton);
        echo "<RetourPoseidon>0</RetourPoseidon>";
        echo "\n<ErreurPoseidon>".$msg."</ErreurPoseidon>";
    }
    else
    {
        echo "<RetourPoseidon>1</RetourPoseidon>";
    }
	pos_disconnect($jeton);
}
else
{
	if (strlen($szNomFichier) > 0)
	{
		$today = getdate();
		$szDateAffichee = sprintf("%d%02d%02d_%02d%02d", $today["year"],$today["mon"],$today["mday"], $today["hours"], $today["minutes"]);
		
		$szNewName = "sauv_".$szDateAffichee."_".$_SESSION["sess_user_name"]."_".$szNomFichier;
		$szNomCompletNvFichier = getRepDavSauvegarde().$szNewName;
		copy($_FILES["POS_FICHIER"]["tmp_name"], $szNomCompletNvFichier);
		
		$szMessage = "";
		//$szMessage .= "<html>Votre session a expiré : votre fichier ne peut pas être sauvegardé dans l'application.<BR>";
		$szMessage .= "<html>Une copie du fichier avec vos modifications est conservée sous le nom <b>$szNewName</b> <BR>";
		$szMessage .= "Veuillez contacter votre administrateur pour qu'il résolve ce problème.<BR>";
		//$szMessage .= "<br><br>Your session has expired : the could not be saved in application.<BR>";
		$szMessage .= "<br><br>A copy of the file with your modifications was recorded on the server under the name <b>$szNewName</b> <BR>";
		$szMessage .= "Please contact your administrator so he can resolve this issue.</html>";
		echo "<RetourPoseidon>0</RetourPoseidon>";
		echo "<ErreurPoseidon>".$szMessage."</ErreurPoseidon>";
	}
	else
	{
        $msg = get_erreur_poseidon($jeton);
		echo "<RetourPoseidon>0</RetourPoseidon>";
		echo "<ErreurPoseidon>".$msg."</ErreurPoseidon>";
	}
}
?>
