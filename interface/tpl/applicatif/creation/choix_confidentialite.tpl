<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<HTML>
<HEAD>
<title>{TITRE_PAGE}</title>
<LINK rel="STYLESHEET" type="text/css" href="/{NOM_APPLICATION}/include/style/style.css">
<SCRIPT language='javascript' src='../../../../include/script/fermeture.js'></SCRIPT>
<SCRIPT>
	function reportLibelleConf() 
	{
		document.principal.POS_CONF_LIBELLE_HAB.value = document.principal.POS_CONF_HAB.options[document.principal.POS_CONF_HAB.selectedIndex].text;
	}
    function initEcranChoixConf() 
    {
        parent.setTitle();
        document.principal.POS_CONF_HAB.focus();
    }
    function validateNiveauConf(evenement, objInput)
    {
    	var touche = window.event ? evenement.keyCode : evenement.which;
      	if ((touche == 0 || touche == 8 || touche == 9 || touche == 46) || (touche >= '0'.charCodeAt() && touche <= '9'.charCodeAt() && objInput.value.length <= 2))
            return true;
        else
            return false;
    }
    
    function validateCloisonnement(evenement, objInput)
    {
    	if (objInput.value.length <= 2)
    	   return true;
        else
            return false;
    } 

</SCRIPT>
</HEAD>
<BODY onLoad="initEcranChoixConf();">
<FORM name=principal method="post" action="{CODE_ACTION}" onSubmit="reportLibelleConf();return true;">
<INPUT type=hidden name="POS_TYPEDOC" value="{POS_TYPEDOC}">
<INPUT type=hidden name="POS_CONF_LIBELLE_HAB" value="">

<H1 align = "center">{TITRE_PAGE}</h1>
<center>
<TABLE role='presentation'>
<TR>
	<TD CLASS="labelChamp">
		<label for='pos_conf_hab'>{LIBELLE_INDICE_HABITATION}</label>
	</TD>
	<TD CLASS="labelChamp">
		<SELECT class="inputChamp" name="POS_CONF_HAB" id='pos_conf_hab'>
		<!-- BEGIN LISTE_NIV_CONF -->
		<OPTION value="{POS_CODE_CONF_HAB}">{POS_LIBELLE_CONF_HAB}</OPTION>
		<!-- END LISTE_NIV_CONF -->
		</SELECT>
	</TD>
</TR>
<TR>
	<TD CLASS="labelChamp">
		<label for='pos_conf_niv'>{LIBELLE_NIVEAU_HABITATION} </label>
	</TD>
	<TD CLASS="labelChamp">
		<INPUT type="text" class="inputChamp" name="POS_CONF_NIV" id='pos_conf_niv' size="3" value="0" onKeyPress="return validateNiveauConf(event, this)">
	</TD>
</TR>
<TR>
	<TD CLASS="labelChamp">
		<label for='pos_cloison'>{LIBELLE_CLOISONNEMENT} </label>
	</TD>
	<TD CLASS="labelChamp">
		<INPUT type="text" class="inputChamp" name="POS_CLOISON" id='pos_cloison' size="3" value="" onKeyPress="return validateCloisonnement(event, this)">
	</TD>
</TR>
</TABLE>
</center>
<div style="margin:auto;width: 30%;text-align:center;">
	<INPUT TYPE="submit" class="bouton_sub" VALUE="{LIBELLE_ACTION}">
	<INPUT TYPE='button' class="bouton" VALUE="{LIBELLE_FERMER}" onClick='fermeture();' class="bouton">
</div>
</FORM>
</BODY>
</HTML>