<?php
/* 
 * Modification ou création d'une fiche d'index paramétrée
 * 
 *
 * Patrick Legaigneur 01/12/2011
 *

 */  
//header('Content-type: text/html; charset=UTF-8');
session_start();                                                                                        
include ("../include/connexion.inc.php");
include ("../include/debug.inc.php");
include ("../include/fonction_util.inc.php");
include ("../../../../configuration_w/constantesPHP.conf.php");
include ("../../../../configuration/label_".$_SESSION["sess_langue"].".conf");
include ("../../../../configuration/label_admin_".$_SESSION["sess_langue"].".conf");
if ($_SESSION["sess_droitAdministration"] == false)
{	
	afficheMsg(CST_LIBELLE_NO_ADMINISTRATION);
}
else
{
    $retour = connexion($jeton);
    
    if ($retour)
    {
    	// Rubrique : si isaffiche == true, récupérer l'onglet
    	// Regroupement : si isaffiche == false, le regroupement n'existe pas.
        $szCodeTypeDoc = stripslashes(urldecode($_REQUEST['POS_CODE_TYPEDOC']));
        //error_log("Chaine JSON". $_REQUEST["POS_TAB_TOUS_OBJETS_JSON_STRING"]);
        $tabParamFiche = json_decode(utf8_encode(stripslashes($_REQUEST["POS_TAB_TOUS_OBJETS_JSON_STRING"])), true);
        
        for($i=0;$i<count($tabParamFiche); $i++)
        {
        	$tabParamFiche[$i]['szLibelle'] = str_replace('@@@', '"', utf8_decode($tabParamFiche[$i]['szLibelle']));
        }
        // error_log(print_r($tabParamFiche, true));
        if (!isset($_REQUEST["GENERER_TEMPLATE_ONLY"]))
        {
        	$retour = pos_setparamindex($jeton, $_REQUEST['POS_CODE_TYPEDOC'], "",$tabParamFiche);
        	if($retour)
        	{
        		if (strcmp($_REQUEST['MODE_AFFICHE_FICHE_PARAM'], "CREATION") == 0)
        		{
        			// récupération dparamétrage du type de document
        			$retour = pos_gettype($jeton, $_REQUEST['POS_CODE_TYPEDOC'], /*pref*/$tabLstDoc);
                	$objType = $tabLstDoc[0];
                	// actualisation de l'information d'existence de fiche paramétrée
                	$objType->bFicheParam = 1;
                	$retour = pos_settype($jeton, $objType);
                    if(!$retour)
                        debug($jeton);
        		}
        	}
        	else
        		debug($jeton);
        }
        		
    	include("../gestiontypedoc/liste_typedoc.php");
    	  
    	pos_disconnect($jeton);
    }
    else
    {
    	debug($jeton);
    	echec_connexion();
    } 
    
    if (isset($_REQUEST["GENERER_TEMPLATE"]) || isset($_REQUEST["GENERER_TEMPLATE_ONLY"]))
    {
        // chemin repertoire template
        $ficInfo = (isset($_SERVER["PATH_TRANSLATED"])) ? $_SERVER["PATH_TRANSLATED"] : $_SERVER["ORIG_PATH_TRANSLATED"];
        $ficCode = preg_split("/".NOM_APPLICATION."/i", $ficInfo);
    	$szCheminSite = $ficCode[0].NOM_APPLICATION;
    	$szDateCourante = date("Ymd_Hi", time());
    				
    	$szCheminTpl = $szCheminSite."/interface/tpl/".$_SESSION["sess_application"]."/";
    	$szRepertoireGeneration = $szCheminTpl.$_REQUEST['POS_CODE_TYPEDOC'];
    	$szRepertoireSauvegarde = $szRepertoireGeneration.".$szDateCourante";
        
        $retour = true;
        // sauvegarde
    	if (file_exists($szRepertoireGeneration))
    	{
    	   $retour = rename($szRepertoireGeneration, $szRepertoireSauvegarde);
           if (!$retour)
            {
                $tabError[] = "Erreur d'écriture dans le répertoire des templates";
                debug_code($tabError);
            }
        }
        
        if ($retour)
        {
            $sSeparateurClasspath =  (strncasecmp(PHP_OS, 'WIN', 3) == 0) ? ";" : ":";
            
            $szCheminJar = $szCheminSite.DIRECTORY_SEPARATOR."outils".DIRECTORY_SEPARATOR."teditor".DIRECTORY_SEPARATOR;
            $szCommandLine = "java ";
            $szCommandLine .= "-classpath \"";
            $szCommandLine .= $szCheminJar."teditorbox.jar".$sSeparateurClasspath;
            $szCommandLine .= $szCheminJar."jvulcain_11_0_00_002.jar".$sSeparateurClasspath;
            $szCommandLine .= $szCheminJar."JSAP-2.1.jar\"";
            $szCommandLine .= " com.sesin.teditor.commandline.MainGenerateTemplate";
            //$szCommandLine .= "  -V \"EEM,PRP,MOF,MOT,SEM\" -a ".$_SESSION["sess_application"]." -s ".$_SESSION["sess_serveur"]." -p ".$_SESSION["sess_port"]." -U ".$_SESSION["sess_user_name"]." -P \"".decrypt_text($_SESSION["sess_passwd"], $_SESSION["sess_crypt_key"])."\" -l \"".$_REQUEST['POS_CODE_TYPEDOC']."\" -r \"$szCheminTpl\"";
            $szCommandLine .= "  -a ".$_SESSION["sess_application"]." -s ".$_SESSION["sess_serveur"]." -p ".$_SESSION["sess_port"]." -U ".$_SESSION["sess_user_name"]." -P \"".decrypt_text($_SESSION["sess_passwd"], $_SESSION["sess_crypt_key"])."\" -l \"".$_REQUEST['POS_CODE_TYPEDOC']."\" -r \"$szCheminTpl\"";
            
            if(defined('MODE_GENERATION_FIP_EXEC_COM') && strcmp(MODE_GENERATION_FIP_EXEC_COM, "1") == 0)
            {       
                $retourExec = _exec($szCommandLine, $messageErreur);
        		if (!$retourExec)
        		{
                    $tabError[] = $messageErreur;
        			debug_code($tabError);
        			// en cas d'erreur remet dans l'état initial
        			rename($szRepertoireSauvegarde, $szRepertoireGeneration);
        		}
            } else {

                $output = array();
                $return_var = 1;
                exec($szCommandLine, /*pref*/$output, /*pref*/$return_var);
                $error = error_get_last();
                if ($error['type'] != E_DEPRECATED)
                    print_r($error);
                //print_r($output);
                if ($return_var != 0)
                {
                    debug_code($output);
                    // en cas d'erreur remet dans l'état initial
                    rename($szRepertoireSauvegarde, $szRepertoireGeneration);
                }
            }
        }   
    }
}
?>
