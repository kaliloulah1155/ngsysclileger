<?php
/* 
 * Gestion des natures
 * 
 *	PL : 30/03/2011
 */
if (!isset($_SESSION))
    session_start();                                                                                  
include ("../include/connexion.inc.php");
include ("../include/debug.inc.php");
include ("../include/template.inc.php");
include ("../../../../configuration_w/constantesPHP.conf.php");
include ("../../../../configuration/label_".$_SESSION["sess_langue"].".conf");
include ("../../../../configuration/label_admin_".$_SESSION["sess_langue"].".conf");
include ("../../../../configuration/url.conf.php");

$tabTypeFichier = array (
	"0" => "IMAGE",
	"1" => "TEXTE",
	"2" => "SPOOL",
	"3" => "AUTRE",
	"4" => "ARCHIVE"
);
if ($_SESSION["sess_droitAdministration"] == false)
{	
	afficheMsg(CST_LIBELLE_NO_ADMINISTRATION);
}
else
{
    $retour = connexion($jeton);
    
    if ($retour)
    {
    	$t = new Template(".");
        $t->set_File("modif_nature", REP_TEMPLATE_APPLICATIF."gestionnature/modif_nature.tpl");
    	$t->set_block("modif_nature", "BLOC_TOUS_TYPES_FICHIER", "bloc_tous_types_fichier");
    	$t->set_block("modif_nature", "BLOC_TOUTES_NATURES", "bloc_toutes_natures");
    	
    	// en creation, on envoi la liste des natures existantes pour éviter
    	// la création d'un nature ave un code identique
    	if (strcmp($_REQUEST['MODE'], "CREATION") == 0)
    	{
        	$retour = pos_getlistnatures($jeton, /*pref*/$tabLstNat);
        	if ($retour)
        	{
        		foreach($tabLstNat as $codeNature=> $libelleNature)
        		{
                    $t->set_var("CODE_NATURE", $codeNature);
                    $t->parse("bloc_toutes_natures", "BLOC_TOUTES_NATURES", true);
        		}
        	}
        }
    	
        $t->set_var("MESSAGE_CODE_NATURE_OBLIGATOIRE", CST_MESSAGE_CODE_NATURE_OBLIGATOIRE);
    	$t->set_var("MESSAGE_LIBELLE_NATURE_OBLIGATOIRE", CST_MESSAGE_LIBELLE_NATURE_OBLIGATOIRE);
    	$t->set_var("MESSAGE_EXT_NATURE_OBLIGATOIRE", CST_MESSAGE_EXT_NATURE_OBLIGATOIRE);
    	$t->set_var("MESSAGE_TYPE_FICHIER_OBLIGATOIRE", CST_MESSAGE_TYPE_FICHIER_NATURE_OBLIGATOIRE);
    	$t->set_var("LIBELLE_SUPPRIMER", CST_LIBELLE_SUPP);
        $t->set_var("LIBELLE_VALIDER", CST_LIBELLE_VALIDER);
        $t->set_var("LIBELLE_ANNULER", CST_LIBELLE_ANNULER);
    	$t->set_var("URL_ATTENTE", URL_ATTENTE);
        $t->set_var("CODE_ACTION", URL_MODIFIE_NATURE);
        $t->set_var("URL_ANNULER", URL_LIST_NATURE);
        $t->set_var("MODE", $_REQUEST['MODE']);
        
        $t->set_var("ENTETE_LIBELLE_NATURE", CST_ENTETE_LIBELLE_NATURE);
    	$t->set_var("LIBELLE_CHAMP_CODE_NATURE", CST_LIBELLE_CHAMP_CODE_NATURE);
    	$t->set_var("LIBELLE_CHAMP_LIBELLE_NATURE", CST_LIBELLE_CHAMP_LIBELLE_NATURE);
    	$t->set_var("LIBELLE_CHAMP_EXTENSION_NATURE", CST_LIBELLE_CHAMP_EXTENSION_NATURE);
    	$t->set_var("LIBELLE_CHAMP_TYPE_FICHIER_NATURE", CST_LIBELLE_CHAMP_TYPE_FICHIER_NATURE);
    	$t->set_var("LIBELLE_CHAMP_UTILISABLE_APPLI_WEB_NATURE", CST_LIBELLE_CHAMP_UTILISABLE_APPLI_WEB_NATURE);
    	$t->set_var("LIBELLE_CHAMP_AUTRES_EXTENSIONS_NATURE", CST_LIBELLE_CHAMP_AUTRES_EXTENSIONS_NATURE);
    	$t->set_var("LIBELLE_CHAMP_AVEC_FORMATAGE_NATURE", CST_LIBELLE_CHAMP_AVEC_FORMATAGE_NATURE);
    	$t->set_var("LIBELLE_CHAMP_OUTIL_FORMATAGE_NATURE", CST_LIBELLE_CHAMP_OUTIL_FORMATAGE_NATURE);
    	$t->set_var("LIBELLE_CHAMP_OUTIL_SUPPRESSION_FORMAT_NATURE", CST_LIBELLE_CHAMP_OUTIL_SUPPRESSION_FORMAT_NATURE);
    	$t->set_var("LIBELLE_CHAMP_TYPE_MIME", CST_LIBELLE_CHAMP_TYPE_MIME);
    	$t->set_var("LIBELLE_CHAMP_CHARSET", CST_LIBELLE_CHAMP_CHARSET);
    	$t->set_var("MESSAGE_VERIF_FORME_ALPHANUM", CST_MESSAGE_VERIF_FORME_ALPHANUM);
    	$t->set_var("MESSAGE_VERIF_FORME_LIBELLE", CST_MESSAGE_VERIF_FORME_LIBELLE_1);
    	$t->set_var("MESSAGE_CODE_NATURE_EXISTANT", CST_MESSAGE_CODE_NATURE_EXISTANT);
        	
    	$t->set_var("TITRE_PAGE", (strcmp($_REQUEST['MODE'], "CREATION") == 0) ? CST_LIBELLE_PAGE_CREATE_NATURE : CST_LIBELLE_PAGE_MODIF_NATURE);
    	$t->set_var("CLASS_CODE_NATURE", (strcmp($_REQUEST['MODE'], "CREATION") == 0) ? "inputChamp" : "verrouille");
    	$t->set_var("READONLY_CODE_NATURE", (strcmp($_REQUEST['MODE'], "CREATION") == 0) ? "" : "readonly");
    	$t->set_var("LIBELLE_CODE_NATURE", (strcmp($_REQUEST['MODE'], "CREATION") == 0) ? "" : CST_LIBELLE_CODE_NATURE);
    	
        // vide dans le cas d'une creation
        $szCodeNature = isset($_REQUEST['POS_CODE_NATURE']) ? stripslashes(urldecode($_REQUEST['POS_CODE_NATURE'])) : "";
        $szLibelleNature = isset($_REQUEST['POS_LIBELLE_NATURE']) ? stripslashes(urldecode($_REQUEST['POS_LIBELLE_NATURE'])) : "";
        
        $t->set_var("CODE_NATURE", $szCodeNature);
        $t->set_var("LIBELLE_NATURE", $szLibelleNature);
        
        if (strlen($szCodeNature))
    	   $retour = pos_getnature($jeton, $szCodeNature, /*pref*/$objNature);
    	
    	//print_r($objNature);
    	
        $t->set_var("EXT_NATURE", isset($objNature) ? $objNature->szExtension : "");
        $t->set_var("POS_TYPE_MIME", isset($objNature) ? $objNature->szTypeMIME : "");
        $t->set_var("POS_CHARSET", isset($objNature) ? $objNature->szCharset : "");
        
        // gestion du bloc "Avec formatage"
        $bFormatter = isset($objNature) && $objNature->bFormatter == 1;
    	$t->set_var("NATURE_FORMATAGE_CHECKED", $bFormatter ? "checked" : "");	
    	$t->set_var("OUTIL_FORMATAGE", $bFormatter ? $objNature->szCmdFormat : "");
        $t->set_var("OUTIL_SUPP_FORMATAGE", $bFormatter ? $objNature->szCmdSuppFormat : "");
        
        
    	// gestion des types de fichiers
    	foreach($tabTypeFichier as $codeTypeFichier=> $libelleTypeFichier)
        {
            $t->set_var("TYPE_FICHIER", $codeTypeFichier);
            $t->set_var("LIBELLE_TYPE_FICHIER", $libelleTypeFichier);
            // par defaut : autre
            $t->set_var("TYPE_FICHIER_SELECTED", ((isset($objNature) && $codeTypeFichier == $objNature->wTypeFic) || (!isset($objNature)  && $codeTypeFichier == "3")) ? "selected" : "");
    		$t->parse("bloc_tous_types_fichier", "BLOC_TOUS_TYPES_FICHIER",true);
    	}
        	
    	// tableau des natures : 
    	// en client léger, un code peut être associé à plusieurs extensions.
        // dans ce cas, le template de consultation spécifie que la nature est "Utilisable par application web"
    	// les extensions associées se retrouvent dans le textarea visible si la checkbox correspondante est cochée 
        $szConfFileNatures = "../../../../configuration_w/natures.conf";
    	$szMultiExtNature = "";
    	if (file_exists($szConfFileNatures))
    	{		
    		include ($szConfFileNatures);
    		//print_r($tabNatures);
    		if (array_key_exists($szCodeNature, $tabNatures))
    		{	
    			// la première valeur est renseignée dans le champ input de l'extension principal
    			for($i=1;$i<count($tabNatures[$szCodeNature]);$i++)
    			{
    				$szMultiExtNature=$szMultiExtNature.$tabNatures[$szCodeNature][$i]."\n";					
    			}					
    		}
    	}
    	$t->set_var("MULTI_EXT_NATURE", $szMultiExtNature);
    	$t->pparse("MyOutput", "modif_nature");
    
    	pos_disconnect($jeton);
    }
    else
    {
    	debug($jeton);
    	echec_connexion();
    }
}
?>