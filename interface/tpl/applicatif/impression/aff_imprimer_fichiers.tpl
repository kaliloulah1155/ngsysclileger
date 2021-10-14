<HTML>

<HEAD>
	<TITLE>Impression</TITLE>
	<LINK REL="stylesheet" TYPE="text/css" HREF="/{NOM_APPLICATION}/include/style/style.css">
	<base target="_self">
	<script>
	function getValueRadio(groupRadioObj)
    {
        var valueRadio = "";
        for (var i = 0; i < groupRadioObj.length; i++)
        {
            if (groupRadioObj[i].checked)
            {
                valueRadio = groupRadioObj[i].value;
                break;
            }   
        }
        return valueRadio;
    }

	function verifForm()
	{
	    if(getValueRadio(document.principal.choiximp).length == 0)
	    {
	       alert("Veuillez sélectionner un type d'impression.")
	       return false;
        }
        return true;
    }
	</script>
</HEAD>
<BODY topmargin="20">
<FORM NAME="principal" ACTION="{URL_ATTENTE}" METHOD="post" onSubmit="return verifForm();">
<INPUT TYPE=HIDDEN NAME="URL" VALUE="{URL_IMPRIMER_FICHIERS}">
<INPUT TYPE=HIDDEN NAME="SZ_POS_NUMDOC" VALUE="{SZ_POS_NUMDOC}">
         
<!-- Tableau general-->
<TABLE CELLSPACING="0" CELLPADDING="3" WIDTH="90%" border="1" align=center>
<TR>
<TD CLASS=titrePage>Impression</TD>
</TR>
	<TR>
		<TD class="libelleChamp">
			<br><U>Souhaitez-vous imprimer : </U><br><br>
			<INPUT TYPE="radio" NAME="choiximp" VALUE="DEL">Les actes<br><br>
			<INPUT TYPE="radio" NAME="choiximp" VALUE="DEL_ANN">Les actes et les annexes<br><br>
		</TD>
	</TR>
</TABLE>
<BR>
<CENTER>
<FORM>
<INPUT TYPE="submit" class=bouton_sub VALUE="Imprimer"> 
<INPUT TYPE="BUTTON" class=bouton VALUE="Annuler" onClick='javascript:window.close()'>
</FORM>
</CENTER>
</BODY>
</HTML>
