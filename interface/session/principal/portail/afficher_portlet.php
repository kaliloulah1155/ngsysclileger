<?php

session_start();
session_write_close();
include ("../include/template.inc.php");
include ("../include/json/JSON.php");
include ("../include/util_headers.php");
include ("../../../../configuration_w/constantesPHP.conf.php");
include ("../../../../configuration/url.conf.php");
include ("../include/connexion.inc.php");
include ("../include/liste_resumee.inc.php");
include ("../include/locution.inc.php");
include ("../include/form_values.inc.php");
include ("../../../../configuration/label_".$_SESSION["sess_langue"].".conf");


writeHeadersNoCache();
$json = new Services_JSON();
$objRetour = array();
$objRetour["code_retour"] = 1;
$objRetour["msg_erreur"] = "";
// le contenu du bloc au format html
$objRetour["contenu"] = "";

class CodeLibelle {
    
    var $code;
    var $libelleMarque;
    var $libelle;
    var $url;

    function __construct($code, $libelle, $url) {
        $this->code = $code;
        $this->libelle = $libelle;
        $this->url = $url;
    }
}

function posConvertUtf8($inText)
{
    // gere aussi les apostrophes arrondies (chr(146))
    if (function_exists('iconv')) 
        return iconv("UTF-8", "ISO-8859-1//TRANSLIT", $inText);
    else
        return utf8_decode($inText);
}

$portletType = $_REQUEST['PORTLET_TYPE'];

if ($portletType == 'histodocs' || $portletType == 'dossier' || $portletType == 'question')
    $retour = connexion($jeton);

$tabElement = array();
switch ($portletType) {
	case 'bal' : 
	   break;
	case 'qprivees' :
	   	for($i=0;$i<count($_SESSION["sess_tabQuestBibPriv"]);$i++)
        {
        	$urlBib = sprintf(URL_PARAM_QUESTION_RESULTAT, "RECHERCHE_BIB", urlencode(addslashes($_SESSION["sess_tabQuestBibPriv"][$i])), 0);
        	//$urlBibAttente = URL_ATTENTE."?URL=".$urlBib;
        	$tabElement[] = new CodeLibelle(htmlentities_currentcharset($_SESSION["sess_tabQuestBibPriv"][$i], null), htmlentities_currentcharset($_SESSION["sess_tabQuestBibPriv"][$i], null), $urlBib);
        }
		break;
		
	case 'qpubliques' :
	    for($i=0;$i<count($_SESSION["sess_tabQuestBibPub"]);$i++)
        {
        	$urlBib = sprintf(URL_PARAM_QUESTION_RESULTAT, "RECHERCHE_BIB", urlencode(addslashes($_SESSION["sess_tabQuestBibPub"][$i])), 1);
        	//$urlBibAttente = URL_ATTENTE."?URL=".$urlBib;
        	$tabElement[] = new CodeLibelle(htmlentities_currentcharset($_SESSION["sess_tabQuestBibPub"][$i], null), htmlentities_currentcharset($_SESSION["sess_tabQuestBibPub"][$i], null), $urlBib);
        }
		break;
		
	case 'dossier' :
		$numDos = $_REQUEST['NUMDOS'];
		$profilLR = $_REQUEST['PROFILLR'];
		$iMax = $_REQUEST['NB_MAX'];
        
        //error_log("Num�ro de dossier ".$numDos);
		$retour = pos_constlrdavecattributs($jeton, $numDos, $iMax, 1, 1, /*pref*/$profilLR, /*pref*/$tabREP_LR, /*pref*/$tabZoneLR);
		if ($retour)
		{
    		for ($i = 0; $i<count($tabREP_LR); $i++)
    	    {
    	        $szLigneLr = "";
                $tabChamps = extraireChampsLR($tabREP_LR[$i]->lr, "\x02");
        		for ($j = 0; $j<count($tabChamps); $j++)
        		{
        			$szLigneLr .= "-".htmlentities_currentcharset($tabChamps[$j], null);
        		}
        		$szUrl = sprintf(URL_PARAM_CONSULTER_INDEX , "CONSULTATION", $tabREP_LR[$i]->numdoc, $tabREP_LR[$i]->typedoc, "0");
                $tabElement[] = new CodeLibelle($tabREP_LR[$i]->numdoc, $szLigneLr, $szUrl);
    	    }
        }
        else
        {
            pos_geterreur($jeton, /*pref*/$tabErreur);
            $objRetour["code_retour"] = 0;
            $objRetour["msg_erreur"] = $tabErreur["msg2"];
        }
		break;
		
	case 'rssfeed' :
		if (!isset($_REQUEST['URL']) || $_REQUEST['URL'] == "") {
			$objRetour["code_retour"] = 0;
			$objRetour["msg_erreur"] = CST_SPECIFIER_URL;
		} else {
			$url = $_REQUEST['URL'];
			$iMax = isset ($_REQUEST['NB_MAX']) ? $_REQUEST['NB_MAX'] : 0;
			$infoUrl = parse_url($url);
			// tentative pr�alable d'ouvrir l'url car l'appel � file_get_contents est bloquant
            $fp = fsockopen($infoUrl['host'], isset($infoUrl['port']) ? $infoUrl['port'] : 80, $errno, $errstr, 10);
            if (!$fp) {
                $objRetour["code_retour"] = 0;
        	    $objRetour["msg_erreur"] = "$errstr ($errno)";
            }
            else {
    			$rssContent = file_get_contents($url);
    			if ($rssContent != false)
    			{
    				$xmlDoc = simplexml_load_string($rssContent);
        			$channels = $xmlDoc->children();
        			$i = 0;
        			foreach($channels[0]->children() as $child) {
        				if (strcmp($child->getName(), 'title') == 0) {
        					$rssTitle = posConvertUtf8($child);
        				} else if (strcmp($child->getName(), 'pubDate') == 0) {
        					$time = strtotime(posConvertUtf8($child));
        					$rssPubDate = "";
                            if (strlen($time) != 0)	
        					   $rssPubDate = date ('d/m H:i', $time);
        				} else if (strcmp($child->getName(), 'item') == 0) {
        					if ($iMax != 0 && ++$i > $iMax) break;
        					$time = strtotime(sprintf("%s", posConvertUtf8($child->pubDate)));
        					$rssItemPubDate = "";
                            if (strlen($time) != 0)	
        					   $rssItemPubDate = date ('d/m H:i', $time);
        					$tabElement[] = new CodeLibelle($rssItemPubDate, htmlentities_currentcharset(posConvertUtf8($child->title), null), htmlentities_currentcharset(utf8_decode($child->link), null));
        				} 
        			}
                }
                else
                {
                    $objRetour["code_retour"] = 0;
        	        $objRetour["msg_erreur"] = "Erreur d'acc�s � l'adresse : ".$url;
                }
    		}
		}
		break;

	case 'histodocs' :
	    $typeDocsConsultes = array("EEM", "MOF", "MOT", "PRP", "SEF", "SEM");
		//$objRetour["msg_erreur"] = CST_FONCTIONALITE_NON_DISPONIBLE;
		$iNbJoursAnte = 30;
		$szDateDebut = date("d/m/Y", mktime(0,0,0,date("m"),date("d")-$iNbJoursAnte, date("Y")));
		$szDateFin = date("d/m/Y", mktime(0,0,0,date("m"),date("d")+1, date("Y")));
		
		$szRequete = "select iNumInfo, count(*),max(dTimeStamp) from stat_pos_tab_ym where vctypeaction = 'CONSULTATION'";
        $szRequete .= "and vclogin='".$_SESSION["sess_user_name"]."'";
     	$szRequete .= "and dTimeStamp > '$szDateDebut' and dTimeStamp < '$szDateFin'";
     	$szRequete .= "group by iNuminfo order by 3 desc;";
        $dwNbVoulu = 90;
        $dwNbLu = 0;
        $retour = pos_sqlselectmulti($jeton, $szRequete, $dwNbVoulu, /*pref*/$dwNbLu, /*pref*/$szBufferRetourReq);
        if ($retour)
     	{
     	    $tab = explode (chr(0x02), trim($szBufferRetourReq));
     	    $tabNumDoc = array();
     	    for($i=0;$i<count($tab);$i++)
     	    {
     	        if ($i % 3 == 0 && strlen($tab[$i]) != 0)
     	            $tabNumDoc[] = $tab[$i];
            }
            $tabREP_LR = array();
            $szProfilLR = "";
            
            $tabLoc = array();
            for($i=0;$i<count($tabNumDoc);$i++)
            {
                // Cr�ation de la locution.
			    $tabLoc[$i] = new Locution(1, "000", "N D", "=", $tabNumDoc[$i]);
            }
            
            //error_log(print_r($tabLoc, true));
            if (count($tabNumDoc) > 0)
            {
                $retour = pos_searchdoc($jeton, count($tabLoc), $tabLoc, /*pref*/$iNbReponses, /*pref*/$iAdrPremiereReponse);
                if ($retour && $iNbReponses > 0)
                    $retour = pos_getreponseslrd($jeton, $iAdrPremiereReponse, $iNbReponses, $iNbReponses, 
					1, 1, /*pref*/$szProfilLR, /*pref*/$tabREP_LR);
                //$retour = pos_constnumlrd($jeton, $tabNumDoc, count($tabNumDoc), 1, 1, /*pref*/$szProfilLR, /*pref*/$tabREP_LR);
            }
            if ($retour)
			{
	    		for ($i = 0; $i<count($tabREP_LR); $i++)
	    	    {
	    	        if (in_array($tabREP_LR[$i]->typedoc, $typeDocsConsultes))
	    	        {
    	    	        $szLigneLr = "";
    	                $tabChamps = extraireChampsLR($tabREP_LR[$i]->lr, "\x02");
    	        		for ($j = 0; $j<count($tabChamps); $j++)
    	        		{
    	        			$szLigneLr .= ":".htmlentities_currentcharset($tabChamps[$j], null);
    	        		}
    	        		$szUrl = sprintf(URL_PARAM_CONSULTER_INDEX , "CONSULTATION", $tabREP_LR[$i]->numdoc, $tabREP_LR[$i]->typedoc, "0");
    	                $element = new CodeLibelle($tabREP_LR[$i]->numdoc, $szLigneLr, $szUrl);
    	                $element->libelleMarque = $tabREP_LR[$i]->numdoc;
    	                $tabElement[] = $element;
                    }
	    	    }
	    	}
     	}


	    if (!$retour)
    	{
    		pos_geterreur($jeton, /*pref*/$tabMsgErr);
		    $objRetour["code_retour"] = 0;
	        $objRetour["msg_erreur"] = $tabMsgErr["msg2"];
    	}
     	
		break;
		
	case 'question' :
		if (!isset($_REQUEST['POS_QUEST_NOM']) || $_REQUEST['POS_QUEST_NOM'] == "" || !isset($_REQUEST['POS_QUEST_PUBLIC'])) {
			$objRetour["code_retour"] = 0;
			$objRetour["msg_erreur"] = CST_PARAMETRES_NECESSAIRES;			
		} else {
			$nomQuestion = utf8_decode($_REQUEST['POS_QUEST_NOM']);
			$partagee = $_REQUEST['POS_QUEST_PUBLIC'] ? 1 : 0;
			$profilLR = isset($_REQUEST['PROFILLR']) ? $_REQUEST['PROFILLR'] : '';
			$iMax = isset($_REQUEST['NB_MAX']) ? $_REQUEST['NB_MAX'] : 0; //TODO 0 renvoie vraiment 0 reponses :(
			$variables = isset($_REQUEST['VARIABLES']) ? $_REQUEST['VARIABLES'] : '';
            $iTypeTri = isset($_REQUEST['POS_QUEST_TYPE_TRI']) ? $_REQUEST['POS_QUEST_TYPE_TRI'] : 1;
            $iNumColTri = isset($_REQUEST['POS_QUEST_COLONNE_TRI']) ? $_REQUEST['POS_QUEST_COLONNE_TRI'] : 1;
            $bAffLienLr = isset($_REQUEST['POS_AFF_LIEN_LR']) ? ($_REQUEST['POS_AFF_LIEN_LR'] == "true" ? 1 : 0) : 1;
			$tabLocBib = array();
			$tabLoc = array();
			$retour = pos_bib_getlocutionsquest($jeton, $nomQuestion, $partagee, /*pref*/$tabLocBib);
			if ($retour) {
				for($i=0;$i<count($tabLocBib);$i++)
				{
					copyLocutionBibToLocutionPhp($tabLocBib[$i], /*pref*/$tabLoc[$i]);
				}
				// cas o� pas de r�ponses ?? TODO (template � part?)
				$retour = pos_searchdoc($jeton, count($tabLoc), $tabLoc, /*pref*/$iNbReponses, /*pref*/$iAdrPremiereReponse);
			}
            $tabREP_LR = array();		
			if ($retour)
			{
			    if ($iNbReponses > 0)
	               $retour = pos_getreponseslrd($jeton, $iAdrPremiereReponse, $iNbReponses, $iMax, 
						$iNumColTri, $iTypeTri, /*pref*/$profilLR, /*pref*/$tabREP_LR);
	        }
	        if ($retour)
			{
                if ($iNbReponses > 0 && $bAffLienLr == 1) {
                    $urlBib = sprintf(URL_PARAM_QUESTION_RESULTAT, "RECHERCHE_BIB", 
                                urlencode(addslashes($nomQuestion)), $partagee);
                    $tabElement[] = new CodeLibelle($nomQuestion, "<span class='portletlienlr'>&gt;&gt;&gt;".CST_LIBELLE_BASCULER_LISTE_RESULTAT."</span>", $urlBib);
                }

	    		for ($i = 0; $i<count($tabREP_LR); $i++)
	    	    {
	    	        $szLigneLr = "";
	                $tabChamps = extraireChampsLR($tabREP_LR[$i]->lr, "\x02");
	        		for ($j = 0; $j<count($tabChamps); $j++)
	        		{
	        			$szLigneLr .= "&nbsp;".htmlentities_currentcharset($tabChamps[$j], null);
	        		}
	        		$szUrl = sprintf(URL_PARAM_CONSULTER_INDEX , "CONSULTATION", $tabREP_LR[$i]->numdoc, $tabREP_LR[$i]->typedoc, "0");
	                $tabElement[] = new CodeLibelle($tabREP_LR[$i]->numdoc, $szLigneLr, $szUrl);
	    	    }
	    	}
			else
	        {
	            pos_geterreur($jeton, /*pref*/$tabErreur);
	            $objRetour["code_retour"] = 0;
	            $objRetour["msg_erreur"] = $tabErreur["msg2"];
	        }
		}
		
		break;
}

if ($portletType == 'histodocs' || $portletType == 'dossier' || $portletType == 'question')
    pos_disconnect($jeton);

if (strcmp($portletType, 'bal') != 0 && $objRetour["code_retour"] > 0)
{
	$t = new template(REP_TEMPLATE_APPLICATIF."portail");
	
	if (count($tabElement) == 0) {
		$t->set_file ("portlet", "portlet_empty.tpl");
		//$t->set_var("TITLE", "no answer");
		$t->set_var("TITLE", "");
	} else if (strcmp($portletType, 'rssfeed') == 0) {
		$t->set_file("portlet", "portlet_rss.tpl");
		$t->set_var("TITLE", /*$rssPubDate .' - ' . */$rssTitle);
	} else {
		$t->set_file("portlet", "portlet.tpl");
	}
	$t->set_block("portlet", "BLOC_ELEMENT", "bloc_element");
	
	for($i=0;$i<count($tabElement);$i++) 
	{
		$t->set_var("CODE", $tabElement[$i]->code);
		$t->set_var("LIBELLE", $tabElement[$i]->libelle == "" ? "(vide)" : $tabElement[$i]->libelle);
		$t->set_var("LIBELLE_MARQUE", $tabElement[$i]->libelleMarque == "" ? "" : $tabElement[$i]->libelleMarque);
		$t->set_var("URL_ELEMENT", $tabElement[$i]->url);
		$t->set_var("PORTLET_TYPE", $_REQUEST['PORTLET_TYPE']);
		$t->parse("bloc_element", "BLOC_ELEMENT", true);
	}  
	
	$szContent = $t->parse("Output", "portlet");  
	$objRetour["contenu"] = $szContent;
}
$output = $json->encode($objRetour);
print($output);
?>
