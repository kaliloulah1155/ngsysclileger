<HTML>
<HEAD>
<TITLE>{TITRE_MAX_REP}</TITLE>
<LINK rel="STYLESHEET" type="text/css" href="/{NOM_APPLICATION}/include/style/style.css">
<SCRIPT language="javascript" SRC="/{NOM_APPLICATION}/include/script/fermeture.js"></SCRIPT>
<SCRIPT>
function auChargement()
{
    parent.setTitle();
    document.getElementById('btn_oui').focus();
}
</SCRIPT>
</HEAD>

<BODY topmargin="20" leftmargin="20" onLoad="javascript:auChargement();">

<FORM NAME=principal>
{LIBELLE_TROP_REP}

<BR><BR>

<CENTER>
<input type='button' class='bouton' value="{LIBELLE_OUI}" id='btn_oui' onClick="location.href='{URL_CONFIRM_TRI}'">
<input type='button' class='bouton' value="{LIBELLE_NON}" onClick="location.href='{URL_PAS_DE_TRI}'">
<input type='button' class='bouton' value="{LIBELLE_ANNULER}" onClick="fermeture();">
</CENTER>
<BR>

{URL_RAPPEL}

</FORM>

</BODY>
</HTML>
