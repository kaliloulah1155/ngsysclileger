<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<HTML>
<HEAD>
    <TITLE>{TITRE_PAGE}</TITLE>
    <LINK REL="stylesheet" TYPE="text/css" HREF="/{NOM_APPLICATION}/include/style/style.css">
    <SCRIPT language="javascript">
	var SEPARATEUR_CHAMPS_LR = "{SEPARATEUR_CHAMPS_LR}";
	function getCheckedValue(radiogroup)
    {
    	var valeur;
    	if(!radiogroup.length)
    	{
    		valeur=radiogroup.value;
    	}
    	else
    		for (i=0;i<radiogroup.length;i++)
    		if (radiogroup[i].checked)
    		{
    			valeur=radiogroup[i].value;
    			break;
    		}
    	return valeur;
    }
	
	function enregModif()
	{
	    with(document.principal)
	    {
	        szInfoValue = "{SZ_TYPE}"+SEPARATEUR_CHAMPS_LR;
            szInfoValue+= (SZ_TITRE.value)+ SEPARATEUR_CHAMPS_LR;
            szInfoValue+= getCheckedValue(document.principal.SZ_ALIGN)+ SEPARATEUR_CHAMPS_LR; //align
            szInfoValue+= SZ_TAILLE.value+ SEPARATEUR_CHAMPS_LR; // largeur
            szInfoValue+= "{SZ_CODE_RUB}";

            parent.center.updateInfoChamp(SZ_TITRE.value,szInfoValue,{OPTION_SELECT});
            parent.parent.closeFileModif();
        }
	}
	
	</SCRIPT>
</HEAD>
<BODY>

<FORM NAME="principal">
<table role='presentation'>
<TR>
    <TD>{LIBELLE_NOM_RUB}</TD>
    <TD><INPUT TYPE=text NAME="SZ_NOM_RUB" VALUE="{SZ_NOM_RUB}" SIZE=50 READONLY CLASS=NonModif></TD>
</TR>
<TR>
    <TD>{LIBELLE_TITRE}</TD>
    <TD><INPUT TYPE=text NAME="SZ_TITRE" VALUE="{SZ_TITRE}" SIZE=50 class="inputChamp"></TD>
</TR>
<TR>
    <TD>{LIBELLE_TAILLE}</TD>
    <TD><INPUT TYPE=text NAME="SZ_TAILLE" VALUE="{SZ_TAILLE}" SIZE=10 class="inputChamp"> pixels</TD>
</TR>
<TR>
    <TD colspan=2>
        {LIBELLE_GAUCHE}<INPUT TYPE=RADIO NAME=SZ_ALIGN VALUE="2" {SELECTED_GAUCHE}>&nbsp; &nbsp;
        {LIBELLE_CENTRE}<INPUT TYPE=RADIO NAME=SZ_ALIGN VALUE="1" {SELECTED_CENTRE}>&nbsp;&nbsp;
        {LIBELLE_DROIT}<INPUT TYPE=RADIO NAME=SZ_ALIGN VALUE="3" {SELECTED_DROITE}>
    </TD>
</TR>
</TABLE>
<br>
<div style="margin:auto;width: 70%;text-align:center;">
    <input class="bouton_sub" type="BUTTON"  VALUE="{LIBELLE_VALIDER}" onClick="enregModif();">
    <input class="bouton" type="BUTTON"  VALUE="{LIBELLE_ANNULER}" onClick='parent.parent.closeFileModif();'>
</div>
</FORM>
</BODY>
</HTML>
