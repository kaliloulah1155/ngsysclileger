<?php
/****************************************
 * Affichage occurence dans un fichier PDF
 *
 * AUTEUR : Gabrielle Guy
 *
 * DATE DE CREATION: 10/05/2006
 *   
 */ 
session_start();
include ("../include/connexion.inc.php");
include ("../include/debug.inc.php");
include ("../../../../configuration_w/constantesPHP.conf.php");
include ("../../../../configuration/label_".$_SESSION["sess_langue"].".conf");
include_once ("fonction_ftx.inc.php");

//connexion à poseidon
$retour = connexion($jeton);
if ($retour)
{
    getTypesDoc($tabLib, $szTypeDocs);
    getCodesRub($tabLib, /*pref*/$tabCodeRub);

    // si modification de la reherche
	if(isset($_REQUEST["POS_QUESTION_NEW"]))
        $_REQUEST["POS_QUESTION"] = $_REQUEST["POS_QUESTION_NEW"];
        
    $_REQUEST["POS_QUESTION"] = stripslashes(urldecode($_REQUEST["POS_QUESTION"]));
    $retour = pos_searchdocftx($jeton, $_REQUEST["POS_QUESTION"], $tabLib, $tabCodeRub, $_REQUEST['POS_TRI'], $_REQUEST['POS_NB_REP'], /*pref*/$iNbRep, /*pref*/$iAdrPremRep);
    if ($retour)
    {
        $retour = pos_highlightftxpdf($jeton, $iAdrPremRep, $_REQUEST['POS_NUM_REP'], /*pref*/$szUrl);

        if (!$retour)
        	debug($jeton);
        else
        {
				echo "<HTML>";
				echo "<HEAD>";
				echo "<TITLE>Affichage des occurrences</TITLE>";
				echo "<LINK REL=\"stylesheet\" TYPE=\"text/css\" HREF=\"".URL_SITE."/include/style/style.css\">";
				echo "<SCRIPT language=\"javascript\">";
		      echo "function ouvrirFichier() \n{ \n\twindow.location.href='$szUrl';\n}\n";   
				echo "</SCRIPT>";
				echo "</HEAD><BODY onLoad='ouvrirFichier()'><FONT class=labelChamp><CENTER>";
				//echo "</HEAD><BODY> FONT class=labelChamp><CENTER>";
				echo "<BR><IMG src=\"".URL_SITE."/images/icons/attente.gif\">&nbsp;&nbsp;<br><br><b>".CST_LIBELLE_ATTENTE."</b>";
				echo "</FONT>";
				echo "</CENTER></BODY></HTML>";
         }
    }
    else
    	debug($jeton);
        
    // deconnexion
    pos_disconnect($jeton);
}
else
{
	debug($jeton);
	echec_connexion();
}
?>