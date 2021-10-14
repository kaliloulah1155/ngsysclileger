<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<HTML>
<HEAD>
<title>{TITRE_RECHERCHE} </title>
	<LINK REL='stylesheet' TYPE='text/css' HREF='/{NOM_APPLICATION}/include/style/style.css'>
    <SCRIPT language="javascript" SRC="/{NOM_APPLICATION}/include/script/saisie.js"></SCRIPT>
    <script>
    function initEcranRechNum()
    {
        parent.setTitle();
        document.principal.POS_NUM_DOC.select();
        document.principal.POS_NUM_DOC.focus();
    }
	 
    function resetEcranRechNum()
    {
        document.principal.POS_NUM_DOC.value = "";
        document.principal.POS_NUM_DOC.select();
        document.principal.POS_NUM_DOC.focus();
    }
    </script>
</HEAD>
<BODY onLoad="javascript:initEcranRechNum();">
<h1 align="center">{TITRE_RECHERCHE} </h1>
<form id="formSearchNumDoc" NAME='principal' action="{URL_ATTENTE}">
<INPUT TYPE='hidden' NAME="URL" VALUE="{URL_ACTION_FORM}">
<INPUT TYPE='hidden' NAME="TYPE_RECHERCHE" VALUE="RECHERCHE_POS_NUM_DOC">
<TABLE class="texteaide" align=center CELLPADDING=5>
<TR>
	<TD class="texteaide">
    <SCRIPT language="javascript">
    if("{LANGUE}" == "fr")
    {
    	szText = "<b>Recherche par numéro de document : </b><br>";
    	szText+= "&nbsp;&nbsp;&nbsp;&nbsp;- Renseignez le champ avec le numéro de document que vous souhaitez rechercher.<br>";
    	szText+= "&nbsp;&nbsp;&nbsp;&nbsp;- Lancer la recherche en cliquant sur \"{LIBELLE_RECHERCHER}\"<br>";
        szText+= "&nbsp;&nbsp;&nbsp;&nbsp;- Vider le contenu du champ en cliquant sur \"{LIBELLE_EFFACER}\".<br>";
    }
    else
    {
    	szText = "<b>Search by document number: </b><br>";
    	szText+= "&nbsp;&nbsp;&nbsp;&nbsp;- Enter the number of the document you are searching for.<br>";
        szText+= "&nbsp;&nbsp;&nbsp;&nbsp;- Launch the search clicking on \"{LIBELLE_RECHERCHER}\".<br>";
        szText+= "&nbsp;&nbsp;&nbsp;&nbsp;- Click on the \"{LIBELLE_EFFACER}\" button to empty the field.";
    }
    document.write(szText);
    </SCRIPT>
	</TD>
</TR>
</TABLE>

<DIV ALIGN="CENTER">
<BR><BR>
<FONT class="labelChamp"> {LIBELLE_NUM_DOC} </FONT>
<INPUT id="inputNumDoc" class="inputChamp" type="text" NAME="POS_NUM_DOC" VALUE="{POS_NUM_DOC}" SIZE=10 onkeypress="return validateIsNumber(event)">
<BR><BR><BR>
<INPUT id="btnSubmitSearchNumDoc" TYPE='submit' class='bouton_sub' VALUE="{LIBELLE_RECHERCHER}">&nbsp;
<INPUT TYPE='button' class='bouton' VALUE="{LIBELLE_EFFACER}" onClick="resetEcranRechNum();">
</DIV>

</form>
</BODY>
</HTML>
