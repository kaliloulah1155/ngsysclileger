<HTML>

<HEAD>
	<TITLE>Consultation d'un document</TITLE>
	<LINK REL="stylesheet" TYPE="text/css" HREF="/{NOM_APPLICATION}/include/style/style.css">
    <SCRIPT language="javascript" SRC="../../../../include/script/fermeture.js"></SCRIPT>
	<base target="_self">
</HEAD>
<BODY topmargin="0">
<!--necessaire pour fermeture onglet -->
<form name='principal'>
<input type='hidden' name='POS_NUM_DOC' value='{POS_NUM_DOC}'>
<input type='hidden' name='MODE' value='CONSULTATION'>
</form>
<br>
<center>
<!-- Tableau general-->
<TABLE CELLSPACING="1" WIDTH="95%" style="border: 1px solid #3f7fc6;">
 <TR>
 	<TD CLASS=titrePage>DOCUMENT n°{POS_NUM_DOC}</TD>
 </TR>
 <TR>
	 <TD>
	<TABLE>
			<!-- BEGIN LISTE_RUBRIQUES -->
			<TR>
			<TD class="labelChamp">{LIBELLE_RUBRIQUE}</TD>
			<TD>{VALEUR_RUBRIQUE}</TD>
			</TR>
			<!-- END LISTE_RUBRIQUES -->
	</TABLE>
	</TD>
</TR>

</TABLE>
<FORM>
<INPUT TYPE="BUTTON" class=bouton VALUE="{LIBELLE_IMPRIMER}" onClick='javascript:print()'>
<INPUT TYPE="BUTTON" class=bouton VALUE="{LIBELLE_FERMER}"  onClick="document.location.href='{URL_CONSULTER_INDEX}?POS_NUM_DOC={POS_NUM_DOC}'">
</FORM>
</center>
<br>
</BODY>
</HTML>
