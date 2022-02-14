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
include ("../../../../configuration/label_".$_SESSION["sess_langue"].".conf");


writeHeadersNoCache();
$json = new Services_JSON();
$objRetour = array();
$objRetour["code_retour"] = 1;
$objRetour["msg_erreur"] = "";
// le contenu du bloc au format html
$objRetour["contenu"] = "";

class Input {
    
    var $label;
    var $type;
    var $id;

    function __construct($label, $type, $id) {
        $this->label = $label;
        $this->type = $type;
        $this->id = $id;
    }
}

$portletType = $_REQUEST['PORTLET_TYPE'];
$portletInstanceId = $_REQUEST['PORTLET_INSTANCE_ID'];

$tabInputs = array();

$inputsCount = $_REQUEST['INPUTS_COUNT'];

for ($i=1; $i <= $inputsCount; ++$i) {
	$tabInputs[$i - 1] = new Input($_REQUEST['ENTRY_' . $i . '_LABEL'], $_REQUEST['ENTRY_' . $i . '_TYPE'], $_REQUEST['ENTRY_' . $i . '_ID']);
}

$t = new template(REP_TEMPLATE_APPLICATIF."portail");

$t->set_file("portlet", "portlet_configure.tpl");
$t->set_block("portlet", "BLOC_INPUTS", "bloc_inputs");
$t->set_var("PORTLET_TYPE", $_REQUEST['PORTLET_TYPE']);
$t->set_var("PORTLET_INSTANCE_ID", $portletInstanceId);
$t->set_var("LABEL_ANNULER", CST_LIBELLE_ANNULER);
$t->set_var("LABEL_VALIDER", CST_LIBELLE_VALIDER);

for($i=0;$i<count($tabInputs);$i++) 
{
	$input = $tabInputs[$i];
	$t->set_var('ENTRY_LABEL', $input->label);
	$t->set_var('ENTRY_TYPE', $input->type);
	$t->set_var('ENTRY_ID', $input->id);
	$t->parse("bloc_inputs", "BLOC_INPUTS", true);
}

$szContent = $t->parse("Output", "portlet");  
$objRetour["contenu"] = $szContent;
$output = $json->encode($objRetour);
print($output);
?>
