<HTML>
<HEAD>
<TITLE>{TITRE_PAGE}</TITLE>
<link rel='stylesheet' type='text/css' href='/{NOM_APPLICATION}/include/style/style.css'>
<SCRIPT LANGUAGE=javascript>

var xWin;
if (window.showModelessDialog)
	xWin=window.dialogArguments;
else
	xWin=opener;

function valider()
{
    if (document.principal.TITRE.value.length == 0) {
        alert("{LIBELLE_NO_NOM_QUEST_BIB}");
        return;
    }
    xWin.document.principal.POS_TITRE.value = document.principal.TITRE.value;
	for(var i=0; i<document.principal.OPERATEUR.length; i++)
	{
		if(document.principal.OPERATEUR[i].checked)
		{
			xWin.document.principal.POS_LIEN.value = document.principal.OPERATEUR[i].value;
			break;
		}
	}
	xWin.document.principal.submit();
	window.close();
}

</SCRIPT>
</HEAD>

<BODY topmargin=10 leftmargin=5 onLoad="document.principal.TITRE.focus();">

<FORM NAME=principal>

<TABLE border=0 cellpadding="0" cellspacing="4" width="100%" align="center"> 
<TR>
	<TD class="tdfond">
    	<TABLE cellpadding="3" cellspacing="0" class="tdfond" width=100% border=1>
		<TR>
			<TD class="tableau" nowrap>{POS_ENTETE_OPERATEUR}</TD>
			<TD class="tableau" nowrap>{POS_ENTETE_TITRE}</TD>
		</TR>
		<TR>
			<TD><INPUT TYPE=RADIO NAME=OPERATEUR VALUE=2 checked>{LIEN_ET}<BR>
				<INPUT TYPE=RADIO NAME=OPERATEUR VALUE=1>{LIEN_OU}</TD>
			<TD align=center><INPUT class="inputChamp" TYPE=text NAME=TITRE SIZE=70></TD>
		</TR>
		</TABLE>
   </TD>
</TR>
</TABLE>
<BR>
<TABLE align=center>			
<TR>
	<TD><INPUT type=button class=bouton name=COMBINER value="{LIBELLE_VALIDER}" onClick="valider()"></TD>
	<TD><INPUT type=button class=bouton value="{LIBELLE_ANNULER}" onClick="window.close();"></TD>
</TR>
</TABLE>

</FORM>

</BODY>
</HTML>
