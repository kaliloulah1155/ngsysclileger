<?php
/*
 * Affichage d'un fichier de l'application
 * POS_NUM_DOC : numero de document Poseidon
 * POS_NUM_PAGE : numero de fichier
 * POS_NUM_SSPAGE : numero du sous-fichier
 * 
 * Modifications
 * 20.03.2003 GG deconnexion avant l'envoi du fichier
 * 19.12.2003 GG ajout envoi de la taille avant d'envoyer le fichier
 * 29.01.2004 GG utilisation des fichiers pow (en commentaire)
 * 13.12.2004 GG : passage v 10.0.03.001.001
 */
if (!isset($_SESSION))
session_start();
include ("../include/connexion.inc.php");
include ("../include/debug.inc.php");
include ("../include/fonction_util.inc.php");
include ("../../../../configuration_w/constantesPHP.conf.php");
include ("../../../../configuration/url.conf.php");
include ("../../../../configuration/label_".$_SESSION["sess_langue"].".conf");
include ("../include/posdav.inc.php");
$TAB_EXT_AVEC_ICONE = array("DOC", "DOCX", "PDF", "XLS", "XLSX", "TXT", "PPT", "JPG", "PPTX", "TIF");

$retour = connexion($jeton);  
if ($retour)
{
    if(!isset($_REQUEST["POS_NUM_PAGE"]) || strcmp($_REQUEST["POS_NUM_PAGE"], "0") == 0)
    {
    	$retour = pos_getlisteinfopage($jeton, $_REQUEST["POS_NUM_DOC"], 0, /*pref*/$tabStruListePage);
    	if(count($tabStruListePage) == 0)
    	{
    		afficheMsg("Pas de fichier");
    		pos_disconnect($jeton);
    		exit;
    	}
    	
    	if($retour)
    		$_REQUEST["POS_NUM_PAGE"] = count($tabStruListePage);
    }	
    
    if (!isset($_REQUEST["POS_NUM_SSPAGE"]))
        $_REQUEST["POS_NUM_SSPAGE"] = 0;
}

// cas d'erreur avec sortie immediate
$iTypeLancementAppl = getTypeLancementAppl();
// pour le moment inactif car peut provoquer des blocages 
// si l'utilisateur clique sur le jnlp mais ne lance pas le pgm JavaWebStart
/*
if(strcmp($_REQUEST["MODE"], "MODIFICATION") == 0 && ($_REQUEST["B_WEBDAV"] >= 1) &&
        $iTypeLancementAppl == TYPE_LANCEMENT_APPL_JWS_SIMPLE) {
        
    $jnlpFile = getFileNameJnlp($_REQUEST["POS_NUM_DOC"], $_REQUEST["POS_NUM_PAGE"], $_REQUEST["POS_NUM_SSPAGE"]);
    $jnlpFilePath = getRepDavSession(session_id()).$jnlpFile;
    if (file_exists($jnlpFilePath)) {
        debug_code(array(CST_MSG_FICHIER_OUVERT));
        pos_disconnect($jeton);
        exit;
    }                    
}
*/

if ($retour)
{	
	$file = tempnam(getRepTmpSession(session_id()), "POS_");
	$retour = pos_dmdpagenumdoc($jeton, $_REQUEST["POS_NUM_DOC"], $_REQUEST["POS_NUM_PAGE"], $_REQUEST["POS_NUM_SSPAGE"], $file, /*pref*/$objInfoPage);
	if (!$retour)
		debug($jeton);
			
	pos_disconnect($jeton);

	if ($retour)
	{
		$szNaturePage = $objInfoPage->szExtension;
        $szTypeMime = "";
		//on récupère le fichier contenant la liste des types mime du serveur
		$mimeFile = "../gestionfichier/mime.types";
		
		//affectation du fichier dans un tableau 1 ligne=1 case du tableau
		$array = file ($mimeFile);
		
		//on traite chaque ligne pour extraire les types mimes et les extensions
		foreach($array as $line_num => $line)
		{
			//suppression des tabulations et du surplus d'espace
			$array[$line_num] = preg_replace("/ +/", " ", $array[$line_num]);
			$array[$line_num] = preg_replace("/\t+/", " ", $array[$line_num]);
			//on extrait dans un tableau la ligne en cours avec pour separateur l'espace
			$arrayLine = explode (" ", $array[$line_num]);
			
			//l'indice 0 correspond au type MIME, les autres, aux différentes extensions associées
			for ($i=1;$i<count ($arrayLine);$i++)
			{
				$str = $arrayLine[$i];
				//si l'extensions est la meme que celle de notre fichier, on récupère le type MIME
				if (strcmp(strtolower(trim($str)),strtolower("$szNaturePage")) == 0)
				{
					$szTypeMime = $arrayLine[0];
					break;
				}
			}
		}	
			
		//vérification de l'existence du fichier
		if (file_exists($file))
		{
            $szNomFichierOrigine = $objInfoPage->szNomFichierOriginal;
			if(strlen($szNomFichierOrigine) == 0)
				$szNomFichierOrigine = "document.".$objInfoPage->szExtension;
			if(strpos($szNomFichierOrigine, ".") === false)
			    $szNomFichierOrigine = $szNomFichierOrigine.".".$objInfoPage->szExtension;
 	
			// utilisation de webdav
			if(strcmp($_REQUEST["MODE"], "MODIFICATION") == 0 && ($_REQUEST["B_WEBDAV"] >= 1))
			{
				$cheminRepdav = getRepDavSession(session_id());
				$urlDav = getUrlDavSession(session_id());
				
				$fileNameExt = "POS".$_REQUEST["POS_NUM_DOC"]."_".$_REQUEST["POS_NUM_PAGE"]."_".$_REQUEST["POS_NUM_SSPAGE"].".".$szNaturePage;
				copy($file, $cheminRepdav.$fileNameExt);
				
				if (CST_UTIL_POS_DAV_POINT_POW == 2)
				{
					include ("../include/template.inc.php");
                    $t = new Template(REP_TEMPLATE_APPLICATIF."fichier/");
                    
                    if (strcmp($_SERVER["SERVER_PORT"], "80") == 0) 
						$szServeurEtPort = $_SERVER["SERVER_NAME"];
					else
						$szServeurEtPort = $_SERVER["SERVER_NAME"].":".$_SERVER["SERVER_PORT"];
					$sProtocol = (isset($_SERVER['HTTPS']) && strcmp($_SERVER['HTTPS'],'on') == 0) ? 'https://' : 'http://';

                    if ($iTypeLancementAppl == TYPE_LANCEMENT_APPL_APPLET) {
                        $t->set_File("applet", "applet.tpl");
                        $t->set_var("URL_JAR", URL_APPLET_JAR);
                    }
                    else {
                        if ($iTypeLancementAppl == TYPE_LANCEMENT_APPL_JWS_SIMPLE || 
                                ($iTypeLancementAppl == TYPE_LANCEMENT_APPL_JWS_JS && isset($_REQUEST["OPEN_JNLP"]) && $_REQUEST["OPEN_JNLP"] == "1")) {
                            header("Content-Type: application/x-java-jnlp-file");
                            $t->set_File("applet", "jnlp.tpl");
                            $t->set_block("applet", "INC_JAR_SIGNATURE", "inc_jar_signature");
                            $t->set_var("URL_SERVEUR_ET_PORT", $sProtocol.$szServeurEtPort);
                            if(strcmp($_REQUEST["MODE_SIGNATURE"], "1") == 0) {
                                $t->set_var("MODE_SIGNATURE", "1");
                                $t->set_var("TIMESTAMP_URL", defined('TIMESTAMP_URL') ? TIMESTAMP_URL : "");
                                $t->parse("inc_jar_signature", "INC_JAR_SIGNATURE", true);
                            }
                        	else {
                                $t->set_var("MODE_SIGNATURE", "0");
                                $t->set_var("inc_jar_signature", "");
                            }
                        }
                        else {
                            $t->set_File("applet", "modification_js_jws.tpl");
                        }
                        $t->set_var("TYPE_LANCEMENT_APPL", $iTypeLancementAppl);
                        $t->set_var("LOCAL_HTTP_PORT", ($iTypeLancementAppl == TYPE_LANCEMENT_APPL_JWS_JS) ? LOCAL_HTTP_PORT : 0); 
                    }
                    
					$t->set_var("LIBELLE_TITRE_PAGE", ($iTypeLancementAppl == TYPE_LANCEMENT_APPL_JWS_SIMPLE) ? utf8_encode(CST_LIBELLE_FENETRE_FICHIER_APPLET): CST_LIBELLE_FENETRE_FICHIER_APPLET);
                    if(strcmp($_REQUEST["MODE_SIGNATURE"], "1") == 0) {
    					$t->set_var("LIBELLE_MESSAGE_1", ($iTypeLancementAppl == TYPE_LANCEMENT_APPL_JWS_SIMPLE) ? utf8_encode(CST_LIBELLE_FENETRE_FICHIER_SIGN_MESS_1):CST_LIBELLE_FENETRE_FICHIER_SIGN_MESS_1);
    					$t->set_var("LIBELLE_MESSAGE_2", ($iTypeLancementAppl == TYPE_LANCEMENT_APPL_JWS_SIMPLE) ? utf8_encode(CST_LIBELLE_FENETRE_FICHIER_SIGN_MESS_2):CST_LIBELLE_FENETRE_FICHIER_SIGN_MESS_2);
                    }
                    else {
    					$t->set_var("LIBELLE_MESSAGE_1", ($iTypeLancementAppl == TYPE_LANCEMENT_APPL_JWS_SIMPLE) ? utf8_encode(CST_LIBELLE_FENETRE_FICHIER_MESS_1):CST_LIBELLE_FENETRE_FICHIER_MESS_1);
    					$t->set_var("LIBELLE_MESSAGE_2", ($iTypeLancementAppl == TYPE_LANCEMENT_APPL_JWS_SIMPLE) ? utf8_encode(CST_LIBELLE_FENETRE_FICHIER_MESS_2):CST_LIBELLE_FENETRE_FICHIER_MESS_2);
                    }
                    $t->set_var("POS_PATHNAME", $urlDav.$fileNameExt);
                    $t->set_var("POS_NOM_FICHIER_ORIG", ($iTypeLancementAppl == TYPE_LANCEMENT_APPL_JWS_SIMPLE) ? utf8_encode($szNomFichierOrigine) : $szNomFichierOrigine);
                    $t->set_var("ICONE_FICHIER", in_array($objInfoPage->szExtension, $TAB_EXT_AVEC_ICONE) ? strtolower($objInfoPage->szExtension) : "document");
                    
					$szUrlSauverFic = sprintf(URL_PARAM_SAUVER_FICHIER, $_REQUEST["POS_NUM_DOC"], $_REQUEST["POS_NUM_PAGE"], $_REQUEST["POS_NUM_SSPAGE"], session_id(), $fileNameExt);
                    $t->set_var("PATHSAUVER", $szUrlSauverFic);
                    
                    $szUrlSuppFic = sprintf(URL_PARAM_SUPP_FICHIER, $_REQUEST["POS_NUM_DOC"], $_REQUEST["POS_NUM_PAGE"], $_REQUEST["POS_NUM_SSPAGE"], session_id());
                    if(strcmp($_REQUEST["MODE_SIGNATURE"], "1") == 0) {
                        $szUrlSuppFic .= "&MODE_SIGNATURE=1";
                        storeStateSignFile($_REQUEST["POS_NUM_DOC"], $_REQUEST["POS_NUM_PAGE"], $_REQUEST["POS_NUM_SSPAGE"], -1);
                    }
                    
                    $t->set_var("PATHANNULER", $szUrlSuppFic);
					
					$t->set_var("POS_NUM_DOC",  $_REQUEST["POS_NUM_DOC"]);
					$t->set_var("POS_NUM_PAGE", $_REQUEST["POS_NUM_PAGE"]);
					$t->set_var("POS_NUM_SSPAGE", $_REQUEST["POS_NUM_SSPAGE"]);
					$t->set_var("PHPSESSID", session_id());
                    $t->set_var("COOKIE_SESS_NAME", "PHPSESSID");
                    $t->set_var("PATHSAUVER_FICHIER_POST", URL_SAUVER_FICHIER_POSTFICHIER);
                    $t->set_var("MODE", $_REQUEST["MODE"]);
                    $t->set_var("B_WEBDAV", $_REQUEST["B_WEBDAV"]);
                    $t->set_var("LANG", $_SESSION["sess_langue"]);
                    
					$szUseFormMethod = "0";
					$szUseHttpMethod = "0";
					if(defined('TYPE_MODIFICATION_FICHIER'))
					{
					   if (TYPE_MODIFICATION_FICHIER == 1)
                           $szUseHttpMethod = "1";
                       else if (TYPE_MODIFICATION_FICHIER == 2)
                            $szUseFormMethod = "1";
                    }
                    $t->set_var("USE_SUN_HTTP_METHOD", $szUseHttpMethod);
                    $t->set_var("USE_FORM_HTTP_METHOD", $szUseFormMethod);
					$t->set_var("PARAM_LIB_ANNULER",  CST_LIBELLE_ANNULER);
					$t->set_var("PARAM_LIB_FERMER",  CST_LIBELLE_FERMER);
					$t->set_var("PARAM_LIB_SAUVER",  CST_LIBELLE_ENREGISTRER);
                    $t->set_var("CST_MSG_FICHIER_FERMER_AVANT_ENREG",  CST_MSG_FICHIER_FERMER_AVANT_ENREG);
                    $t->set_var("CST_MSG_FICHIER_FERMER_AVANT_ANNUL",  CST_MSG_FICHIER_FERMER_AVANT_ANNUL);
                    $t->set_var("CST_MSG_FICHIER_SESSION_EXPIRE_BIENTOT",  CST_MSG_FICHIER_SESSION_EXPIRE_BIENTOT);
					$t->set_var("PARAM_MSG_SAUV_FERMER_FICHIER",  CST_PARAM_MSG_SAUV_FERMER_FICHIER);
					$t->set_var("PARAM_MSG_ANN_FERMER_FICHIER",  CST_PARAM_MSG_ANN_FERMER_FICHIER);
					$t->set_var("PARAM_TITLE_ERREUR_SAUVEGARDE",  CST_PARAM_TITLE_ERREUR_SAUVEGARDE);
					$t->set_var("PARAM_MSG_FERMER_CROIX",  CST_PARAM_MSG_FERMER_CROIX);

                    if ($iTypeLancementAppl == TYPE_LANCEMENT_APPL_JWS_SIMPLE || 
                                ($iTypeLancementAppl == TYPE_LANCEMENT_APPL_JWS_JS && isset($_REQUEST["OPEN_JNLP"]) && $_REQUEST["OPEN_JNLP"] == "1")) {
                        
                        // creation d'un fichier à la volée dans le repertoire "posdav" car
                        // pour éviter les alertes de sécurité, le jar doit contenir le jnlp ou un template du jnlp
                        // ou le jnlp doit contenir son url d'origine et il sera alors rechargé  	
                        $jnlpFile = getFileNameJnlp($_REQUEST["POS_NUM_DOC"], $_REQUEST["POS_NUM_PAGE"], $_REQUEST["POS_NUM_SSPAGE"]);
                        $jnlpFilePath = getRepDavSession(session_id()).$jnlpFile;
                        $t->set_var("URL_DAV_SESSION", getUrlDavSession(session_id()));
                        $t->set_var("JNLP_FILE_NAME", $jnlpFile);
                        $t->parse("MyOutput", "applet");
                        $t->write("MyOutput", $jnlpFilePath);
                        $t->p("MyOutput");    
                    }
                    else {
    					$t->parse("MyOutput", "applet");
    					$t->p("MyOutput");
                    }
				}
				else
				{
				
					echo "<HTML>";
					echo "<HEAD>";
					echo "<LINK REL=\"stylesheet\" TYPE=\"text/css\" HREF=\"".URL_SITE."/include/style/style.css\">";
					echo "<SCRIPT language=\"javascript\">";
					echo "function ouvrirFichier() \n{ \n\twindow.location.href='$urlDav$fileNameExt';\n}\n";
					echo "</SCRIPT>";
					echo "</HEAD><BODY onLoad='ouvrirFichier()'><FONT class=labelChamp>";
					echo CST_LIBELLE_PAGE_FICHIER_A_FERMER;
					echo "</FONT><FORM><CENTER><INPUT type=button value=".CST_LIBELLE_FERMER." onClick='window.close();'>";
					echo "</CENTER></FORM></BODY></HTML>";
				}
			}
			else
			{
				// on l'ouvre en lecture
				$fp= fopen($file,"rb");
				//définition du type MIME du fichier
				header("Cache-Control: ");// leave blank to avoid IE errors
				header("Pragma: ");// leave blank to avoid IE errors
                if (isset($szTypeMime) && strlen($szTypeMime) != 0)
				header("Content-Type: ".$szTypeMime."");
				header("Content-Length: ".filesize($file)."");
					
				if(isset($_REQUEST["B_DOWNLOAD"]) || 
                    endsWith($szNomFichierOrigine, ".docx") ||
                    endsWith($szNomFichierOrigine, ".xlsx") ||
                    endsWith($szNomFichierOrigine, ".pptx"))
				    header("Content-Disposition: attachment; filename=\"".$szNomFichierOrigine."\";");
				else
					header("Content-Disposition: inline; filename=\"".$szNomFichierOrigine."\";");
				    
				//affichage du fichier, on passe l'ID du fichier
				fpassthru($fp);
				flush();

				// fermeture du fichier
				fclose($fp);
			}
		}
	}
    else {
        if(strcmp($_REQUEST["MODE"], "MODIFICATION") == 0 && ($_REQUEST["B_WEBDAV"] >= 1))
		{
            include ("../include/template.inc.php");
            $t = new Template(REP_TEMPLATE_APPLICATIF."fichier/");
        	$t->set_File("ferme", "ferme.tpl");
        	$t->set_var("URL_SITE", URL_SITE);
        	$t->parse("MyOutput", "ferme");
        	$t->p("MyOutput");
        }
    }

	//suppression du fichier
	unlink($file);

	// deconnexion avant l'envoi du fichier
	// sinon on peut perdre la connexion si l'utilisateur annule le telechargement
	
}
else
{
	debug($jeton);
	echec_connexion();
} 

function endsWith($haystack, $needle) {
    // search forward starting from end minus needle length characters
    return $needle === "" || (($temp = strlen($haystack) - strlen($needle)) >= 0 && strpos($haystack, $needle, $temp) !== FALSE);
}
?>
