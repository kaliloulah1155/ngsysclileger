<HTML>

<HEAD>
<TITLE>{LIBELLE_LANCEMENT_ACTION_HERMES} : {POS_HERM_LIBACT}</TITLE>
<LINK REL="stylesheet" TYPE="text/css" HREF="/{NOM_APPLICATION}/include/style/style.css">
<SCRIPT language="javascript" SRC="/{NOM_APPLICATION}/include/script/vocabulaire.js"></SCRIPT>
<SCRIPT language='javascript' src='/{NOM_APPLICATION}/include/script/ajax_search.js'></SCRIPT>
<SCRIPT language="javascript" SRC="/{NOM_APPLICATION}/include/script/calendrier.js"></SCRIPT>
<SCRIPT language="javascript">
		
function verifierAvantEnvoi()
{
    return true;
}

function auChargement()
{
}
function charger_vocabulaire_hermes(typedoc, codeRubrique, nomChamp)
{
    //charger_vocabulaire_rech_elabore('000', szCodeRubrique, nomChamp);
    // on reecrit le lancement du vocabulaire pour reduire la taille de la fenêtre
    var ref= get_url("URL_VOCAB");
	ref+="POS_CODERUB=";
	ref+=escape(codeRubrique);
	ref+="&POS_TYPEDOC=";
    ref+=escape(typedoc);
	ref+="&POS_CHAMP=";
	ref+= "document.principal."+ nomChamp;
	ref+="&POS_VOC_LIE=0";
	ref+="&FORCE_MONOCRITERE=1";
	openFenetreVoc(ref, 'Vocabulaire', 450, 320, 10, 10);
}
window.focus();
</SCRIPT>
</HEAD>

<BODY onLoad="javascript:auChargement();">
<br><br>
<CENTER>
<H3>{LIBELLE_LANCEMENT_ACTION_HERMES} : {POS_HERM_LIBACT}</H3>
</CENTER>
<FORM NAME="principal" ACTION="{URL_ATTENTE}" onSubmit="javascript:return verifierAvantEnvoi();">
<input type='hidden' name='URL' value='{URL_ACTION}'>
<input type='hidden' name='POS_HERM_CODEACT' value='ACTION_GEN'>
<input type='hidden' name='POS_SZ_NUMDOC' value='{POS_SZ_NUMDOC}'>
<input type='hidden' name='POS_HERM_LIBACT' value='{POS_HERM_LIBACT}'>

<br><br>
<CENTER>
<table align="center" border="0">
<!-- BEGIN LISTE_RUBRIQUES -->
<TR>
<TD class="labelchamp">
	<label for="POS_HERM_ACTION_GEN_{CODE_RUBRIQUE}">{POS_LIBELLE_RUB}</label>
</TD>
<TD>
&nbsp;&nbsp;&nbsp;
</TD>
<TD>
	<INPUT class="inputChamp" ID="POS_HERM_ACTION_GEN_{CODE_RUBRIQUE}" NAME="POS_HERM_ACTION_GEN_{CODE_RUBRIQUE}" SIZE="60">
    <a href="javascript:charger_vocabulaire_hermes('{POS_TYPEDOC}','{CODE_RUBRIQUE}','POS_HERM_ACTION_GEN_{CODE_RUBRIQUE}')">
	<div class='iconvocmono' id='img_voc' title='Vocabulaire'></div></a>
    <span style="display: {DISPLAY_CALENDRIER};">
    <A href="javascript:void ouvrir_calendrier('document.principal.POS_HERM_ACTION_GEN_{CODE_RUBRIQUE}');">
	<div class='iconcalendrier' title="Voir le calendrier"></div></a>
    </span>
</TD>
</TR>
<!-- END LISTE_RUBRIQUES -->
</table>
<br>
<div style="margin:auto;width: 30%;text-align:center;">
    <input type='submit' class='bouton_sub' value='{LIBELLE_VALIDER}'>
    &nbsp;&nbsp;&nbsp;
    <input type='button' class='bouton' value='{LIBELLE_BOUTON_FERMER}' onClick='parent.parent.closeFileModif();'>
</div>
</center>
</form>
</body>
</html>
