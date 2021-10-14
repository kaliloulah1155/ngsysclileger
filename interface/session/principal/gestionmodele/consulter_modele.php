<?php
/*
 * Affichage d'un modèle pour macro word
 * 
 * PL : 19/12/2008
 */
session_start();
include ("../include/connexion.inc.php");
include ("../include/debug.inc.php");
include ("../include/fonction_util.inc.php");
include ("../../../../configuration_w/constantesPHP.conf.php");
include ("../../../../configuration/url.conf.php");
include ("../../../../configuration/label_".$_SESSION["sess_langue"].".conf");
include ("../include/posdav.inc.php");

$fileOriginal = CST_REP_MODELES."\\".$_REQUEST["POS_NOM_MODELE"];
 	
if (file_exists($fileOriginal))
{
	// utilisation de webdav
	if(strcmp($_REQUEST["MODE"], "MODIFICATION") == 0 && ($_REQUEST["B_WEBDAV"] >= 1))
	{
        $cheminRepdav = getRepDavSession(session_id());
        $urlDav = getUrlDavSession(session_id());
        
        $fileNameExt = $_REQUEST["POS_NOM_MODELE"];
        copy($fileOriginal, $cheminRepdav.$fileNameExt); 	
    
        if (CST_UTIL_POS_DAV_POINT_POW == 2)
		{
            include ("../include/template.inc.php");
            $t = new template(REP_TEMPLATE_APPLICATIF."fichier");
            
            if (strcmp($_SERVER["SERVER_PORT"], "80") == 0) 
                $szServeurEtPort = $_SERVER["SERVER_NAME"];
            else
                $szServeurEtPort = $_SERVER["SERVER_NAME"].":".$_SERVER["SERVER_PORT"];
                
            $iTypeLancementAppl = getTypeLancementAppl();  
            if ($iTypeLancementAppl == 0) {
                $t->set_File("applet", "applet.tpl");
                $t->set_var("URL_JAR", URL_APPLET_JAR);
            }
            else {
                if ($iTypeLancementAppl == TYPE_LANCEMENT_APPL_JWS_SIMPLE) {
                    header("Content-Type: application/x-java-jnlp-file");
                    $t->set_File("applet", "jnlp.tpl");
                    $t->set_block("applet", "INC_JAR_SIGNATURE", "inc_jar_signature");
                    $sProtocol = (isset($_SERVER['HTTPS']) && strcmp($_SERVER['HTTPS'],'on') == 0) ? 'https://' : 'http://';
                    $t->set_var("URL_JAR", $sProtocol.$szServeurEtPort.URL_APPLET_JAR);
                    $t->set_var("URL_SERVEUR_ET_PORT", $sProtocol.$szServeurEtPort);
                    $t->set_var("inc_jar_signature", "");
                }
                $t->set_var("TYPE_LANCEMENT_APPL", $iTypeLancementAppl); 
            }

            $t->set_var("LIBELLE_TITRE_PAGE", ($iTypeLancementAppl == TYPE_LANCEMENT_APPL_JWS_SIMPLE) ? utf8_encode(CST_LIBELLE_FENETRE_FICHIER_APPLET): CST_LIBELLE_FENETRE_FICHIER_APPLET);
            $t->set_var("LIBELLE_MESSAGE_1", ($iTypeLancementAppl == TYPE_LANCEMENT_APPL_JWS_SIMPLE) ? utf8_encode(CST_LIBELLE_FENETRE_FICHIER_MESS_1):CST_LIBELLE_FENETRE_FICHIER_MESS_1);
            $t->set_var("LIBELLE_MESSAGE_2", ($iTypeLancementAppl == TYPE_LANCEMENT_APPL_JWS_SIMPLE) ? utf8_encode(CST_LIBELLE_FENETRE_FICHIER_MESS_2):CST_LIBELLE_FENETRE_FICHIER_MESS_2);
            
            $t->set_var("POS_PATHNAME", $urlDav.$fileNameExt);
            $t->set_var("POS_NOM_FICHIER_ORIG", ($iTypeLancementAppl == TYPE_LANCEMENT_APPL_JWS_SIMPLE) ? utf8_encode($fileNameExt) : $fileNameExt);
            $t->set_var("ICONE_FICHIER", "document");
            $t->set_var("PATHSAUVER", "");
            $t->set_var("PATHANNULER", sprintf(URL_PARAM_SUPP_MODELE,session_id(),$_REQUEST["POS_NOM_MODELE"]));

            $t->set_var("PHPSESSID", session_id());
			$t->set_var("PATHSAUVER_FICHIER_POST", URL_SAUVER_MODELE_POSTFICHIER);
            $t->set_var("MODE", "MODIFICATION");
            $t->set_var("B_WEBDAV", $_REQUEST["B_WEBDAV"]);
                    
			$t->set_var("USE_SUN_HTTP_METHOD", "0");
            $t->set_var("USE_FORM_HTTP_METHOD",  "1");
            
			$t->set_var("PARAM_LIB_ANNULER",  CST_LIBELLE_ANNULER);
			$t->set_var("PARAM_LIB_FERMER",  CST_LIBELLE_FERMER);
			$t->set_var("PARAM_LIB_SAUVER",  CST_LIBELLE_ENREGISTRER);
            $t->set_var("CST_MSG_FICHIER_FERMER_AVANT_ENREG",  CST_MSG_FICHIER_FERMER_AVANT_ENREG);
            $t->set_var("CST_MSG_FICHIER_FERMER_AVANT_ANNUL",  CST_MSG_FICHIER_FERMER_AVANT_ANNUL);
            $t->set_var("CST_MSG_FICHIER_SESSION_EXPIRE_BIENTOT",  CST_MSG_FICHIER_SESSION_EXPIRE_BIENTOT);

            if ($iTypeLancementAppl == TYPE_LANCEMENT_APPL_JWS_SIMPLE || 
                        ($iTypeLancementAppl == TYPE_LANCEMENT_APPL_JWS_JS && isset($_REQUEST["OPEN_JNLP"]) && $_REQUEST["OPEN_JNLP"] == "1")) {
                
                // creation d'un fichier à la volée dans le repertoire "posdav" car
                // pour éviter les alertes de sécurité, le jar doit contenir le jnlp ou un template du jnlp
                // ou le jnlp doit contenir son url d'origine et il sera alors rechargé  	
                $jnlpFile = "jnlp_modele.jnlp";
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
	}
	else
	{
        $pos = strrpos($fileOriginal, ".");
        if ($pos !== false) {
            $szExtension = substr($fileOriginal, $pos + 1);        
        }
        $szTypeMime = "";
		//on récupère le fichier contenant la liste des types mime du serveur
		$mimeFile = "../gestionfichier/mime.types";
		
		//affectation du fichier dans un tableau 1 ligne=1 case du tableau
		$array = file ($mimeFile);
		//on traite chaque ligne pour extraire les types mimes et les extensions
		while (list($line_num, $line) = each ($array))
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
				if (strcmp(strtolower(trim($str)),strtolower($szExtension)) == 0)
				{
					$szTypeMime = $arrayLine[0];
					break;
				}
			}
		}
        
        // on l'ouvre en lecture
		$fp = fopen($fileOriginal, "rb");
		header("Cache-Control: ");// leave blank to avoid IE errors
		header("Pragma: ");// leave blank to avoid IE errors
        header("Content-Type: ".$szTypeMime);
		header("Content-Length: ".filesize($fileOriginal));
        header("Content-Disposition: attachment; filename=".$_REQUEST["POS_NOM_MODELE"].";");
		    
		//affichage du fichier, on passe l'ID du fichier
		fpassthru($fp);
		flush();

		// fermeture du fichier
		fclose($fp);
	}
}
?>
