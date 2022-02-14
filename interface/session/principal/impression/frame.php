<?php session_start(); ?>
<HTML>
<HEAD>
<HTML>
<HEAD>
	<LINK rel="STYLESHEET" type="text/css" href="../../../../include/style/style.css">
<TITLE>
<?php
include ("../../../../configuration_w/constantesPHP.conf.php");
include ("../../../../configuration/label_".$_SESSION["sess_langue"].".conf");
echo CST_LIBELLE_FENETRE_IMP_LR; 
?>
</TITLE>
<SCRIPT language="javascript">
function printFrame(id) {
    var frm = document.getElementById(id).contentWindow;
    frm.focus();// focus on contentWindow is needed on some ie versions
    frm.print();
    return false;
}
function imprimer()
{
    printFrame('impression');
}
</SCRIPT>

</HEAD>
<BODY>
<FORM>
<INPUT TYPE=BUTTON class="bouton" VALUE="<?php echo CST_LIBELLE_IMPRIMER?>" onClick="javascript:imprimer()">
<INPUT TYPE=BUTTON class="bouton" VALUE="<?php echo CST_LIBELLE_FERMER?>" onClick="parent.parent.closeFileModif();">
</FORM>
<iframe name='impression' id='impression' src='<?php echo URL_SITE; ?>/interface/session/principal/impression/afficher_impression.php?<?php echo $_SERVER["QUERY_STRING"]?>' allowTransparency="true" style='height: 80%;width: 100%;' frameborder='0' ></iframe>
</BODY>
</HTML>