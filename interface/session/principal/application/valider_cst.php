<?php
session_start();
include ("../include/debug.inc.php");
include ("../include/template.inc.php");
$szFilePath = "../../../../configuration/";
$szFileNamePhpCst = $szFilePath . "constantesPHP.conf";
$szFileNameJsCst = $szFilePath . "constantes.js";

$bOk = false;
if (is_writable($szFilePath))
{
    $handle = @fopen($szFileNamePhpCst, 'w');
    if (!$handle)
    {
        $error = error_get_last();
        $tabMessage[0] = "Erreur de création du fichier de configuration :";
        $tabMessage[1] = $error['message'];
        debug_code($tabMessage);
    }
    else
    {
        $bOk = true;
        print_r($_REQUEST);
        $t = new template("../../../../configuration/");
        $t->set_file("constantes", "constantesPHP.conf.default");
        $t->set_var("POS_SERVEUR", $_REQUEST["POS_SERVEUR"]);
        $t->set_var("POS_PORT", $_REQUEST["POS_PORT"]);
        $t->set_var("NOM_APPLICATION_WEB", $_REQUEST["NOM_APPLICATION"]);
        $t->set_var("POS_APPLICATION", $_REQUEST["POS_APPLICATION"]);
        
        $sContenu = $t->parse("MyOutput", "constantes");
        fwrite($handle, $sContenu);
        fclose($handle);
        //echo "<script>";
        //echo "document.location.href = '../../../../index.php';\n";
        //echo "</script>";
    }
    
    $handle = @fopen($szFileNameJsCst, 'w');
    if (!$handle)
    {
        $error = error_get_last();
        $tabMessage[0] = "Erreur de création du fichier de configuration :";
        $tabMessage[1] = $error['message'];
        debug_code($tabMessage);
    }
    else
    {
        $bOk = true;
        print_r($_REQUEST);
        $t = new template("../../../../configuration/");
        $t->set_file("constantes", "constantes.js.default");
        $t->set_var("POS_SERVEUR", $_REQUEST["POS_SERVEUR"]);
        $t->set_var("POS_PORT", $_REQUEST["POS_PORT"]);
        $t->set_var("NOM_APPLICATION_WEB", $_REQUEST["NOM_APPLICATION"]);
        $t->set_var("POS_APPLICATION", $_REQUEST["POS_APPLICATION"]);
        
        $sContenu = $t->parse("MyOutput", "constantes");
        fwrite($handle, $sContenu);
        fclose($handle);
        //echo "<script>";
        //echo "document.location.href = '../../../../index.php';\n";
        //echo "</script>";
    }
}
else
{
    $tabMessage[0] = "Le fichier de configuration n\'a pas pu être mis à jour : erreur d'accès aux fichiers";
    debug_code($tabMessage);
}

if (!$bOk)
    $szUrl = "../application/initialisation.php";
else
    $szUrl = "../../../../index.php";
?>
