<HTML>
<HEAD>
<title>{TITRE_PAGE}</title>
<LINK rel="STYLESHEET" type="text/css" href="/{NOM_APPLICATION}/include/style/style.css">
<SCRIPT LANGUAGE="JavaScript" SRC="/{NOM_APPLICATION}/include/script/fermeture.js"></SCRIPT>
<script src="/{NOM_APPLICATION}/include/script/md5.js"></script>
<script src="/{NOM_APPLICATION}/include/script/cryptor.js"></script>
<script>
function onValider()
{
    document.principal.POS_ANC_PWD.value = crypt_text(document.principal.POS_ANC_PWD.value,'{SESS_CRYPTKEY}');
    document.principal.POS_NV_PWD.value = crypt_text(document.principal.POS_NV_PWD.value,'{SESS_CRYPTKEY}');
    document.principal.POS_COPIE_NV_PWD.value = crypt_text(document.principal.POS_COPIE_NV_PWD.value,'{SESS_CRYPTKEY}');
    document.principal.submit();
    return false;
}
function initEcranMdp()
{
    parent.setTitle();
}
</script>
</HEAD>
<BODY onLoad="javascript:initEcranMdp();">
<h1 align = "center">{TITRE_PAGE}</h1>
<TABLE ALIGN=center>
<TR>
<TD>
<FORM name='principal' action="{ACTION}" method=post>
<TR>
<TD ALIGN=left CLASS=labelChamp>{CST_LIBELLE_OLD_PWD}</TD>
<TD><INPUT type=password class='inputChamp' name=POS_ANC_PWD size=20></TD>
</TR>
<TR>
<TD ALIGN=left CLASS=labelChamp>{CST_LIBELLE_NEW_PWD}</TD>
<TD><INPUT type=password class='inputChamp' name=POS_NV_PWD size=20></TD>
</TR>
<TR>
<TD ALIGN=left CLASS=labelChamp>{CST_LIBELLE_CONFIRM_NEW_PWD}</TD>
<TD><INPUT type=password class='inputChamp' name=POS_COPIE_NV_PWD size=20></TD>
</TR>
<TR>
<TD colspan=2 align=center><BR>
<INPUT TYPE='button' class='bouton' VALUE="{VALIDER}" onclick="javascript:onValider();">
<input type='button' class='bouton' value="{ANNULER}" onClick='javascript:fermeture();'>
</TD>
</TR>
</table>
</form>
</TD>
</TR>
</TABLE>
</BODY>
</HTML>
