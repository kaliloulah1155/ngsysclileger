<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<HTML>
<HEAD>
<title>{TITRE_RECHERCHE}</title>
<LINK REL="stylesheet" TYPE="text/css" HREF="/{NOM_APPLICATION}/include/style/style.css">
<SCRIPT type='text/javascript' src='../../../../include/script/fermeture.js'></SCRIPT>
	<SCRIPT>
	function submitForm(szCodeType)
	{
        document.principal.POS_TYPEDOC.value = szCodeType;
        document.principal.submit();
	}
	
	function initEcranChoixType()
    {
        parent.setTitle();
        window.focus();
    }
	</SCRIPT>
</HEAD>

<BODY onLoad="javascript:initEcranChoixType();">
<h1 align="center">{TITRE_RECHERCHE} </h1>
<FORM NAME="principal" ACTION="{ACTION}" method="get">
<input type="hidden" name="POS_TYPEDOC" value="">
</FORM>
<br>
<div class="titretexteaide"  style="margin:auto;width: 50%;text-align: center;"> 
<SCRIPT language="javascript">
if("{LANGUE}" == "fr")
{
	szText = "";
	szText+= "Veuillez choisir un type de document dans la liste ci-dessous.";
}
else
{
	szText = "";
	szText+= "Choose a document type in the list below.";
}
document.write(szText);
</SCRIPT>
</div>
<br>
<div style="margin:auto;width: 50%;">
<ul class="table-liste">
<!-- BEGIN TOUS_TYPES -->
<li>
    <a href="javascript:submitForm('000');">{LIBELLE_RECH_000}</a>
</li>
<!-- END TOUS_TYPES -->
<!-- BEGIN LISTE_TYPES -->
<li>
    <a href="javascript:submitForm('{POS_CODE_TYPE}');">{POS_LIBELLE_TYPE}</a>
</li>
<!-- END LISTE_TYPES -->
</ul>
</div>
</BODY>
</HTML>
