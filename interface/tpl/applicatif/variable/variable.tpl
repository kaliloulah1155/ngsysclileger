<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<HTML>
<HEAD>
<TITLE>{POS_QUEST_NOM} </TITLE>
<LINK REL="stylesheet" TYPE="text/css" HREF="/{NOM_APPLICATION}/include/style/style.css">
<SCRIPT language="javascript" SRC="/{NOM_APPLICATION}/include/script/vocabulaire.js"></SCRIPT>
<SCRIPT language="javascript" SRC="/{NOM_APPLICATION}/include/script/fermeture.js"></SCRIPT>
<SCRIPT language='javascript' src='/{NOM_APPLICATION}/include/script/ajax_search.js'></SCRIPT>
<SCRIPT language="javascript" SRC="/{NOM_APPLICATION}/include/script/calendrier.js"></SCRIPT>
<SCRIPT language="javascript">
function associe_valeur(nom,valeur)
{
	with(document.principal)
	{	
	   // affectation de la valeur saisie a la variable de recherche cachee
	   // (les seules reellement utilisees lors du transfert du formulaire)
		num_var = nom.substr(5,1);
		document.getElementById("POS_VAR_RECH_"+num_var).value = valeur;

        // parcourt des variables affichees pour affecter la meme valeur a toutes les variables de meme numero		
        var exp = "/VAL[0-9]+_"+num_var+"/";
	    var reg = eval(exp);
	    for (var i=0; i<elements.length; i++)
	    {	    	
	    	if(reg.test(elements[i].name) && elements[i].name != nom)
	    	{
	    		elements[i].value = valeur;
	       	}
	    }
	}
}
		
function verifierAvantEnvoi()
{
    with(document.principal)
    {
       // parcourt des variables affichees pour affecter la meme valeur a toutes les variables de meme numero		
        var exp = "/VAL[0-9]+_/";
        var reg = eval(exp);
        for (var i=0; i<elements.length; i++)
        {	    	
        	if(reg.test(elements[i].name) && elements[i].value.length == 0)
        	{
                parent.posMessageBoxWarning(document.principal.LIBELLE_MSG_VARIABLES_NON_VIDE.value);
                return false;
           	}
        }
    }
    return true;
}

function auChargement()
{
    with(document.principal)
    {
       // parcourt des variables affichees pour affecter la meme valeur a toutes les variables de meme numero		
        var exp = "/VAL[0-9]+_/";
        var reg = eval(exp);
        for (var i=0; i<elements.length; i++)
	    {	    	
        	if(reg.test(elements[i].name) && elements[i].value.length == 0)
	    	{
        	   elements[i].focus();
                break;
	       	}
	    }
	}
    parent.setTitle();
}
</SCRIPT>
</HEAD>

<BODY onLoad="javascript:auChargement();">
<CENTER>
<h1>{TITRE_RESOLUTION} : {POS_QUEST_NOM} </h1>
</CENTER>
<FORM NAME="principal" ACTION="{URL_ATTENTE}" METHOD="POST" onSubmit="javascript:return verifierAvantEnvoi();">
<INPUT TYPE=HIDDEN NAME=URL VALUE="{POS_ACTION}">
<INPUT TYPE=HIDDEN NAME=POS_QUEST_NOM VALUE="{POS_QUEST_NOM}">
<INPUT TYPE=HIDDEN NAME=POS_QUEST_PUBLIC VALUE="{POS_QUEST_PUBLIC}">
<INPUT TYPE=HIDDEN NAME=POS_QUEST_RES_VAR VALUE="{POS_QUEST_RES_VAR}">
<INPUT TYPE=HIDDEN NAME=POS_QUEST_NB_VAR VALUE="{POS_QUEST_NB_VAR}">
<INPUT TYPE=HIDDEN NAME=TYPE_RECHERCHE VALUE="RECHERCHE_BIB">
<INPUT TYPE=HIDDEN NAME=POS_PROFIL_LR VALUE="{POS_PROFIL_LR}">
<INPUT TYPE=HIDDEN NAME=LIBELLE_MSG_VARIABLES_NON_VIDE VALUE="{LIBELLE_MSG_VARIABLES_NON_VIDE}">

<!-- Inputs mis a jour par la fct js pour renseigner les variables de recherches -->	
<INPUT TYPE=HIDDEN NAME="POS_VAR_RECH_1" id="POS_VAR_RECH_1" VALUE="">
<INPUT TYPE=HIDDEN NAME="POS_VAR_RECH_2" id="POS_VAR_RECH_2" VALUE="">
<INPUT TYPE=HIDDEN NAME="POS_VAR_RECH_3" id="POS_VAR_RECH_3" VALUE="">
<INPUT TYPE=HIDDEN NAME="POS_VAR_RECH_4" id="POS_VAR_RECH_4" VALUE="">
<INPUT TYPE=HIDDEN NAME="POS_VAR_RECH_5" id="POS_VAR_RECH_5" VALUE="">
<INPUT TYPE=HIDDEN NAME="POS_VAR_RECH_6" id="POS_VAR_RECH_6" VALUE="">
<INPUT TYPE=HIDDEN NAME="POS_VAR_RECH_7" id="POS_VAR_RECH_7" VALUE="">
<INPUT TYPE=HIDDEN NAME="POS_VAR_RECH_8" id="POS_VAR_RECH_8" VALUE="">
<INPUT TYPE=HIDDEN NAME="POS_VAR_RECH_9" id="POS_VAR_RECH_9" VALUE="">
<!-- Fin des Inputs -->
<br><br>
<CENTER>
<table role='presentation' align="center" border="0">
<!-- BEGIN LISTE_VARIABLES -->
<TR>
<TD class="labelchamp">
	<label for="VAL{POS_NUM_LIGNE}_{POS_NUM_VARIABLE}">{POS_LIBELLE_RUB}</label>
</TD>
<TD>
&nbsp;&nbsp;&nbsp;
</TD>
<TD class="labelchamp">
    <label for="VAL{POS_NUM_LIGNE}_{POS_NUM_VARIABLE}">{POS_LIBELLE_OPE}</label>
</TD>
<TD>
	<INPUT class="inputChamp" ID="VAL{POS_NUM_LIGNE}_{POS_NUM_VARIABLE}" NAME="VAL{POS_NUM_LIGNE}_{POS_NUM_VARIABLE}" SIZE="60" onKeyUp="associe_valeur(this.name,this.value)" onBlur="associe_valeur(this.name,this.value)" onFocus="associe_valeur(this.name,this.value)">
    <a href="javascript:charger_vocabulaire_rech_elabore('{POS_CODE_TYP}','{POS_CODE_RUB}','VAL{POS_NUM_LIGNE}_{POS_NUM_VARIABLE}')">
	<div class='iconvocmono' id='img_voc_DAD' title='Vocabulaire'></div></a>
    <span style="display: {DISPLAY_CALENDRIER};">
    <A href="javascript:void ouvrir_calendrier('document.principal.VAL{POS_NUM_LIGNE}_{POS_NUM_VARIABLE}');">
	<div class='iconcalendrier' title="Voir le calendrier"></div></a>
    </span>
</TD>
</TR>
<!-- END LISTE_VARIABLES -->
</TABLE>
<br>
<table role='presentation' border=0>
<TR>
<TD><input type='submit' class='bouton_sub' value="{LIBELLE_BOUTON_RECHERCHER}"></TD>
<TD><input type='button' class='bouton' value="{LIBELLE_BOUTON_FERMER}" onClick="fermeture()"> </TD>
</TR>
</TABLE>
</CENTER>

</FORM>
</BODY>
</HTML>
