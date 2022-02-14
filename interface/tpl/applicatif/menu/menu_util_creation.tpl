<HTML>
<HEAD>
<TITLE>Menu recherche</TITLE>
<link href="../../../../include/style/style.css" type="text/css" rel="STYLESHEET"/>
<SCRIPT SRC="../../../../configuration/constantes.js" language="JavaScript"></SCRIPT>
<SCRIPT language='JavaScript' SRC='../../../../include/script/menu_util.js'></SCRIPT>
</HEAD>
<BODY onLoad="initialise_img();" class="fond_menu">
<br>
<TABLE width="95%" align="center">
<TR>
<TD class="blocmenu">
<TABLE cellspacing="0" cellpadding="0" width="100%" class="blocmenu">
<TR>
<TD>
<TABLE cellspacing="0" width="100%">
<TR>
<TH class="titremenucolonne">Types de document</TH>
</TR>
<!-- BEGIN LISTE_TYPES -->
<TR>
<TD class="tdmenu">
<a href="javascript:void(0)" onClick="javascript:affichePage('lien_creation','{URL_CREATION}?POS_TYPEDOC={POS_CODE_TYPE}')" onMouseOver="roll_img('Creation_{COMPT}')" onMouseOut="normal_img('Creation_{COMPT}');" onMouseDown="initialise_img('Creation_{COMPT}');">
<IMG name="Creation_{COMPT}" border="0">&nbsp;{POS_LIBELLE_TYPE}</a>
</TD>
</TR>
<!-- END LISTE_TYPES -->
</TABLE>
</BODY>
</HTML>
