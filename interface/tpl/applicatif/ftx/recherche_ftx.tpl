<!DOCTYPE html>
<HTML>
<HEAD>
	<TITLE>{TITRE_PAGE}</TITLE>
	<LINK REL="stylesheet" TYPE="text/css" HREF="/{NOM_APPLICATION}/include/style/style.css">
	<script type="text/javascript" src="/{NOM_APPLICATION}/include/script/fermeture.js"></script>
	<script type="text/javascript">
	function selectAllType()
    {
        var tabElement = document.principal.elements;
        var bACocher = false;
        
        if (document.principal.CHECK_TOUS_TYPES.checked)
            bACocher = true;
            
        for (i=0; i<tabElement.length; i++)
        {
            type = tabElement[i].type;
            if (tabElement[i].type == "checkbox" && tabElement[i].name &&
                tabElement[i].name.indexOf("POS_CHOIX_LIB") != -1) {
                if (bACocher)
                    tabElement[i].checked = true;
                else
                    tabElement[i].checked = false;
            }
        }
    }
    
    function initEcran() 
    {
        document.principal.POS_QUESTION.focus();
        parent.setTitle();
    }
    </script>
</HEAD>

<BODY onLoad="javascript:initEcran();">
<h1>{TITRE_PAGE}</h1>
<div class="texteaide" style='margin-bottom: 10px;width: 90%;'>
<SCRIPT type="text/javascript">
if("{LANGUE}" == "fr")
{
	szText = "Saisissez un ou plusieurs plusieurs termes dans la zone \"{LIB_MOT_A_RECHERCHER}\" et sélectionner les types de documents dans lesquels vous souhaitez effectuer votre recherche.<br>";
}
else
{
	szText = "Enter one or several words in the field  \"{LIB_MOT_A_RECHERCHER}\" and select the Librairie(s) in which you want to search.<br>";
}
document.write(szText);
</SCRIPT>
</div>
<FORM NAME=principal ACTION="{URL_ATTENTE}" METHOD="GET">
<div style='border: 1px solid #959799;width: 90%;margin: auto;'>
<INPUT TYPE=HIDDEN NAME=URL VALUE="{URL_RECHERCHE}">
<div style='background-color: #eee;height: 30px;width: 100%;border-top: 1px solid #eee;text-align:center;'> 
	<h2 class="sous-titre">{LIB_CRITERES_RECH_FTX}</h2>
</div>
<div style='vertical-align: top;width: 100%;padding: 3px;'>
    <table role='presentation' style='vertical-align: top;width: 100%;'>
    <tr>
    	<TD class="tdnormal" style='vertical-align: top;'>
    	    <br>
    		<table role='presentation' >
    		<TR>
                <TD class="labelChamp">
                <label for='id_question_ftx' class='labelObligatoire'>{LIB_MOT_A_RECHERCHER}&nbsp;</label>
                <INPUT class="inputChamp" id='id_question_ftx' TYPE=TEXT NAME="POS_QUESTION" VALUE="{POS_QUESTION}" SIZE=60>
                
                </TD>
    		</TR>
    		<TR>
                <TD class="labelChamp" style="width: 200px;">{LIB_TITRE_CHOIX_INDEX_FICHIER} 
                    <INPUT TYPE="radio" NAME="TYPE_CHOIX_RUB" VALUE="0" id='ID_CHOIX_FICHIER' {CHECKED_CHOIX_RUB_FIC}><label for='ID_CHOIX_FICHIER'>{LIB_CHOIX_FICHIER} </label>
                    <INPUT TYPE="radio" NAME="TYPE_CHOIX_RUB" VALUE="RUB_ET_FIC" id='ID_CHOIX_INDEX_FICHIER' {CHECKED_CHOIX_RUB_FIC_RUB}><label for='ID_CHOIX_INDEX_FICHIER'>{LIB_CHOIX_INDEX_FICHIER}</label>
                </TD>
               <TD width="25%"></TD>
    		</TR>
    		</table>
        </TD>
    	<TD class="tdnormal">
            <TABLE role='presentation'>
    	        <TR>
    	       		<TD>{LIB_LIBRAIRIE}</TD>
    			</TR>
                <tr>
        	    <td>
                    <INPUT name="CHECK_TOUS_TYPES" type="checkbox" {LIB_TOUS_TYPES_CHECKED} onclick="selectAllType();" >
                    &nbsp;{LIB_TOUS_TYPES}
                    </td>
        	    </tr>
                <!-- BEGIN BLOC_TYPE_DOC -->
        		<TR>
        		    <TD class="labelChamp"><INPUT name="POS_CHOIX_LIB[]" type="checkbox" value="{CODE_TYPE_DOC}" {LIB_CHECKED}>
            		<span class="labelChamp">&nbsp;{LIB_TYPE_DOC}</span>
                    </TD>
        		</TR>
    		<!-- END BLOC_TYPE_DOC -->
    		</TABLE>
        </TD>
    </TR>
    </table>
</div>
<div style='background-color: #eee;height: 30px;width: 100%;border-top: 1px solid #eee;text-align:center;'>
<h2 class="sous-titre">{LIB_AFFICHAGE_REPONSES}</h2>
</div>
<div style='padding: 3px;'>
	    <TABLE role='presentation' style='width: 100%;border-spacing : 0;border-collapse : collapse; margin: auto;'>
        <TR>
            <TD class="labelChamp">
            	<label class='labelChamp'>{LIB_TRI}</label>
                <INPUT TYPE="radio" NAME="POS_TRI" VALUE="0" id='POS_TRI_PERTINENCE' {CHECKED_TRI_PERTINENCE}>
                <label for='POS_TRI_PERTINENCE'>{LIB_TRI_PERTINENCE}</label>
                <INPUT TYPE="radio" NAME="POS_TRI" VALUE="1" id='POS_TRI_OCCURRENCE' {CHECKED_TRI_OCCURRENCE}>
                <label for='POS_TRI_OCCURRENCE'>{LIB_TRI_OCCURRENCE}</label>
            </TD>
            <TD width="25%"></TD>
            <TD>
            <label for='POS_NB_REP' class='labelChamp'>{LIB_NB_REP}</label>
            <INPUT TYPE=TEXT NAME="POS_NB_REP" id='POS_NB_REP' VALUE="{POS_NB_REP}" SIZE=3 class="inputChamp">
            </TD>
        </TR>
	    </TABLE>
</div>
</div>
<div style='width: 50%;margin: auto;margin-top:10px;text-align:center;'>
	<INPUT TYPE=submit class="bouton_sub" VALUE="{LIBELLE_RECHERCHER}">
	<INPUT TYPE=reset class="bouton" VALUE="{LIBELLE_EFFACER}">
</div>
</FORM>
</BODY>
</HTML>