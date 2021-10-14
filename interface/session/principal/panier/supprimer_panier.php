<?php

session_start();
include ("../../../../configuration_w/constantesPHP.conf.php");
include ("../../../../configuration/label_".$_SESSION["sess_langue"].".conf");
include ("../../../../configuration/url.conf.php");
include ("../panier/fct_panier.inc.php");

$tabTypNumDoc = explode(" ",trim($_REQUEST["SZ_POS_TYPNUMDOC"]));
$iNbElementPanier = 0;
if (defined('GESTION_PANIER_DOSSIER') && GESTION_PANIER_DOSSIER == 1)
{
    include ("../include/locution.inc.php");
    include ("../include/connexion.inc.php");
    include ("../include/debug.inc.php");
    $retour = connexion($jeton);
    if ($retour)
    {
        // recherche du dossier PANIER
        $iNumDossierPanier = getNumDocPanier($jeton);
        if ($iNumDossierPanier == 0)
            debug($jeton);
        else
        {
            for($i=0;$i<count($tabTypNumDoc);$i++)
            {
                list ($iNumDoc, $szTypeDoc) = explode("|", $tabTypNumDoc[$i]);
	            $retour = pos_dosretirefils($jeton, $iNumDossierPanier, $iNumDoc, /*pref*/$objdos);
	            if (!$retour)
                    debug($jeton);
            }
            $tabFils = array();
            $retour = pos_dosinfocontenu($jeton, $iNumDossierPanier, /*pref*/$tabFils);
            $iNbElementPanier = count($tabFils);
        }
    	pos_disconnect($jeton);	
    }
    else
    {
    	debug($jeton);
    	echec_connexion();
    }
}
else
{
    $tabTmp = array_diff($_SESSION["sess_tabPanier"],$tabTypNumDoc);
    // pour bien indexer le tableau car array_diff conserve les cles
    $tabTmp2 = array();
    foreach($tabTmp as $key => $val)
        $tabTmp2[] = $val;
    $_SESSION["sess_tabPanier"] = $tabTmp2;
    $iNbElementPanier = count($_SESSION["sess_tabPanier"]);
}

echo "<HTML><HEAD>";
echo "<TITLE>".CST_LIBELLE_ATTENTE_SUPP_PANIER."</TITLE>";
echo "<LINK REL=\"stylesheet\" TYPE=\"text/css\" HREF=\"".URL_SITE."/include/style/style.css\">";
echo "</HEAD><BODY>";
echo "<DIV CLASS=labelChamp align=center><BR>".CST_LIBELLE_ATTENTE_SUPP_PANIER."<BR><BR>";
echo "<IMG src=\"".URL_SITE."/images/icons/panier.gif\"></DIV>";
echo "<SCRIPT>";
echo "opener.parent.centerbal.document.getElementById('panier').innerHTML = \"(".$iNbElementPanier.")\";\n";
echo "opener.location.href='".URL_ATTENTE."?URL=".URL_PANIER."';\n";
echo "window.close();";
echo "</SCRIPT>";
echo "</BODY></HTML>";

?>
