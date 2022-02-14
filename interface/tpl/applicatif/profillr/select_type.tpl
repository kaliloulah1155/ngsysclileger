<!DOCTYPE HTML>
<HTML>
<HEAD>
<LINK REL='stylesheet' TYPE='text/css' HREF='/{NOM_APPLICATION}/include/style/style.css'>
</HEAD>
<BODY>
<h1>{LIBELLE_CHOIX} </h1>
<FORM NAME="principal" ACTION="{ACTION}">
<INPUT TYPE="HIDDEN" NAME="B_CREATION" VALUE=1>
<div style="margin:auto;width: 50%;text-align:center;">
    <SELECT NAME=SZ_TYPEDOC class="inputChamp"  style="width: 100%;" size=20 ondblclick="submit();">
        <OPTION VALUE="000"> {LIBELLE_TOUS_TYPES} </OPTION>
        <!-- BEGIN BLOC_TYPE -->
        <OPTION VALUE={POS_CODE_TYPE}> {POS_LIBELLE_TYPE}</OPTION>
        <!-- END BLOC_TYPE -->
        </SELECT>
</div>
<br>
<div style="margin:auto;width: 70%;text-align:center;">
        <INPUT class=bouton_sub TYPE=SUBMIT VALUE="{LIBELLE_VALIDER}">
        <INPUT class=bouton TYPE=BUTTON VALUE="{LIBELLE_ANNULER}" onClick="location.href='{URL_ANNULER}'">
</div>
</FORM>
</BODY>
</HTML>
