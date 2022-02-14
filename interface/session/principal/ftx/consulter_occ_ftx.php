<?php
/****************************************
 * Affichage occurence recherche FullText
 *
 * AUTEUR : Sébastien COSTANZO
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
        // Consultation des occurrences
        // on traite le fichier en reponse pour marquer les occurrences
        $retour = pos_highlightftx($jeton, $iAdrPremRep, $_REQUEST['POS_NUM_REP'], /*pref*/$tabOffset, /*pref*/$szBuffer);
        if (!$retour)
        	debug($jeton);
        else
        {
            $position1=0;
            $position2=0;
            echo "<HTML>\n";
            echo "<HEAD>\n";
            echo "<LINK REL='stylesheet' TYPE='text/css' HREF='".URL_SITE."/include/style/style.css'>\n";
            echo "<LINK REL='stylesheet' TYPE='text/css' HREF='".URL_SITE."/include/style/exboccurence.css'>\n";
            echo "<SCRIPT language='JavaScript' SRC='".URL_SITE."/include/script/excalibur.js'></SCRIPT>\n";
            echo "<TITLE>\n";
            echo "Occurence '".$_REQUEST["POS_QUESTION"]."'\n";
            echo "</TITLE>\n";
            echo "</HEAD>\n";
            echo "<BODY>\n";
            $szInfoOcc = sprintf(LIBELLE_OCCURRENCE_FTX , count($tabOffset)/2);
            echo "<H3>".$szInfoOcc."</H3>\n";
           
			// remplacement tabulation et retour chariot 
            $trans = array("\r"=> "", "\n" => "<br>", "\t" => "&nbsp;&nbsp;&nbsp;&nbsp;");
			sort($tabOffset);

            // on boucle sur chaque debut d'occurrence
			$szAffichage = "";
            for ($i=0;$i < count($tabOffset);$i=$i+2)
            {
                $position2 = $tabOffset[$i];
                // avant le mot
                $szAffichage .= substr($szBuffer, $position1, $position2-$position1);
                
                $j = $i+2;              
                if($j < count($tabOffset))
                	$szAffichage .= "<A name=\"mot$i\" class='F3' href=\"javascript:suivant('mot$j','mot$i');\">&nbsp;";	
                else
                	$szAffichage .= "<A name=\"mot$i\" class='F3' href=\"javascript:suivant('mot0','mot$i');\">&nbsp;";
                
                $position1 = $position2;
                $position2 = $tabOffset[$i+1];
                
                // le mot
                $szAffichage .= substr($szBuffer, $position1, $position2-$position1);
               	$szAffichage .= "&nbsp;</A>";
                
                $position1 = $position2;
            }
            // fin du buffer
            $szAffichage .= substr($szBuffer, $position1);
			$szAffichage = strtr($szAffichage, $trans);
			echo $szAffichage;

            echo "</BODY>\n";
            echo "</HTML>\n";
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