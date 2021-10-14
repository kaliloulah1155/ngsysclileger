<HTML>
<head>
<title>
<?php
if (!isset($_SESSION))
session_start();
include ("../../../../configuration/label_".$_SESSION["sess_langue"].".conf");
echo CST_LIBELLE_TOOLBAR_RECH_CLE;
?>
</title>
</head>
<frameset rows="290,*" border=0>
	  <FRAME SRC="../recherche/afficher_recherche_cle.php?<?php echo "POS_TYPEDOC={$_REQUEST["POS_TYPEDOC"]}".(isset($_REQUEST["INUMQUEST"]) ? "&INUMQUEST=".$_REQUEST["INUMQUEST"] : "")?>" name="recherche" scrolling=no scrollbars=no resize=no marginwidth=10 marginheight=0>
	  <frame src="../vocabulaire/afficher_cle_db.php" name="frame_vocabulaire" scrolling=no scrollbars=no resize=no marginwidth=10 marginheight=0>
</frameset>
</HTML>
