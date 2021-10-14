<?php

session_start();

include ("../include/connexion.inc.php");
include ("../include/debug.inc.php");
include ("../include/template.inc.php");
include ("../../../../configuration_w/constantesPHP.conf.php");
include ("../../../../configuration/label_".$_SESSION["sess_langue"].".conf");
include ("../../../../configuration/url.conf.php");

if (!isset($_REQUEST["POS_TYPEDOC"]) || strlen($_REQUEST["POS_TYPEDOC"]) == 0)
{
	afficheMsg("<BR>");
	exit;
}

//connexion à poseidon
$retour = connexion($jeton);

if ($retour)
{
	$retour = pos_getclehvocab($jeton, $_REQUEST["POS_TYPEDOC"], $_REQUEST["POS_VAL_RUB_K_H"], $_REQUEST["LONGUEUR_ZONE"], /*pref*/$tabVocab);
	
	if($retour && count($tabVocab) != 0)
	{
		$file_tpl = REP_TEMPLATE_APPLICATIF."vocabulaire/vocabulaire_cle.tpl";
		
		$t = new Template(".");
		$t->set_File("vocabulaire", $file_tpl);
		$t->set_block("vocabulaire", "BLOC_VOCABULAIRE", "bloc_vocabulaire");
		
		$t->set_var("ZONE_RETOUR", $_REQUEST["ZONE_RETOUR"]);
		$t->set_var("LONGUEUR_ZONE", $_REQUEST["LONGUEUR_ZONE"]);
		$t->set_var("LIBELLE_VOCABULAIRE", CST_LIBELLE_VOCABULAIRE);
		for($i=0;$i<count($tabVocab);$i++)
		{
			$t->set_var("VOCAB", $tabVocab[$i]);
			$t->parse("bloc_vocabulaire", "BLOC_VOCABULAIRE", true);
		}
		$t->pparse("MyOutput", "vocabulaire");
	}
	else
	{
		afficheMsg(CST_LIBELLE_VOCAB_NO_VOC);
	}
	pos_disconnect($jeton);
}
else 
{
	debug ($jeton);
	echec_connexion();
}


?>
