<?php
/*
 */
session_start();
include ("../../../../configuration_w/constantesPHP.conf.php");
include ("../../../../configuration/label_".$_SESSION["sess_langue"].".conf");

if (isset($_REQUEST["ACTION_HERMES"]))
{
	$_REQUEST["POS_ACTION_HERMES"] = $_REQUEST["ACTION_HERMES"];
	$_REQUEST["TYPE_ACTION"] = CST_LIBELLE_ACTION;
	include("../consultation/modifier_index.php");
}
?>