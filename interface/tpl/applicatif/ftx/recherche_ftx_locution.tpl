<HTML>
<HEAD>
	<TITLE>{TITRE_PAGE}</TITLE>
	<LINK REL="stylesheet" TYPE="text/css" HREF="/{NOM_APPLICATION}/include/style/style.css">
	<LINK REL="stylesheet" TYPE="text/css" HREF="/{NOM_APPLICATION}/include/style/gestionbib.css">
	<SCRIPT language="javascript" SRC="/{NOM_APPLICATION}/include/script/fermeture.js"></SCRIPT>
	<SCRIPT>
	var tabCritere = new Array();
	<!-- BEGIN BLOC_TAB_CRITERES -->
	tabCritere["{CODE_CRITERE}"] = "{LIBELLE_CRITERE}"; 
	<!-- END BLOC_TAB_CRITERES -->
	
	
	var tabTypes = new Array();
	<!-- BEGIN BLOC_TYPE_DOC_CRITERES -->
	tabTypes["{CODE_TYPE_DOC}"] = "{LISTE_CRITERE}"; 
	<!-- END BLOC_TYPE_DOC_CRITERES -->
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
    
    function changeSelectDate(objSelect)
    {
        if (objSelect.value == ":")
            POS_CHAMP_DATE.style.display = "";
        else
            POS_CHAMP_DATE.style.display = "none";
    }
    
    // Affiche les critères en fonction des types de document sélectionné
    function afficherCriteres()
    {
        for (var codeCritere in tabCritere)
        {
            var bTrouve = true;
            for(var codeType in tabTypes)
            {
                if (document.getElementById("checktype_" + codeType).checked)
                {
                    if (tabTypes[codeType].indexOf(codeCritere + ",") == -1)
                    {
                        bTrouve = false;
                    }
                }
            }
            var idCritere = "tr_critere_" + codeCritere;
            if (!bTrouve)
                document.getElementById(idCritere).style.display = "none";
            else
                document.getElementById(idCritere).style.display = "";
        }
    }
    
    function initEcran() 
    {
        document.principal.POS_QUESTION.focus();
        var szTypeRecherche = getValueRadio(document.principal.POS_TYPE_RECHERCHE);
        activeBlocTypeRecherche("LOCUTION", (szTypeRecherche == "LOCUTION") ? true : false);
        activeBlocTypeRecherche("FTX", (szTypeRecherche == "FTX") ? true : false);
        initValeursCriteres();
        afficherCriteres();
        parent.setTitle();
    }
    
    function initValeursCriteres() 
    {
        // pour chaque critere
        for (var codeCritere in tabCritere)
        {
            // s'il s'agit d'un critere date
            if (eval("document.principal.POS_DATE_SELECT_" + codeCritere))
            {
                if (eval("document.principal.CRITERE_OP_" + codeCritere).value.length != 0)
                {
                    if (eval("document.principal.CRITERE_OP_" + codeCritere).value == ">")
                    {
                        var szVal1 = eval("document.principal.CRITERE_VAL1_" + codeCritere).value;
                        var pos = szVal1.indexOf("$[DATE_SYSTEME");
                        if (pos >= 0)
                        {
                            eval("document.principal.POS_DATE_SELECT_" + codeCritere).value = szVal1.substring("$[DATE_SYSTEME-".length, szVal1.length - 1);
                        }
                    }
                }
            }
        }
    }
    
    function completeForm()
    {
        if (document.principal.POS_QUESTION.value.length == 0)
        {
            alert("Vous n'avez pas saisi de critères de recherche.");
            document.principal.POS_QUESTION.focus();
            return false;
        }
        else
        {
            var szTypeRecherche = getValueRadio(document.principal.POS_TYPE_RECHERCHE);
            if (szTypeRecherche == "LOCUTION")
            {
                document.principal.URL.value = document.principal.URL_RECHERCHE_FTX_LOCUTION.value;
                // pour chaque critere
                for (var codeCritere in tabCritere)
                {
                    // s'il s'agit d'un critere date
                    if (eval("document.principal.POS_DATE_SELECT_" + codeCritere))
                    {
                        var valSelect = eval("document.principal.POS_DATE_SELECT_" + codeCritere).value;
                        if (isNumeric(valSelect))
                        {
                            eval("document.principal.CRITERE_OP_" + codeCritere).value = ">";
                            eval("document.principal.CRITERE_VAL1_" + codeCritere).value = "$[DATE_SYSTEME-" + valSelect + "]";
                        }
                        else
                        {
                            if (valSelect.length == 0)
                            {
                                eval("document.principal.CRITERE_OP_" + codeCritere).value = "";
                                eval("document.principal.CRITERE_VAL1_" + codeCritere).value = "";
                            }
                            else
                            {
                                eval("document.principal.CRITERE_OP_" + codeCritere).value = valSelect;
                                eval("document.principal.CRITERE_VAL1_" + codeCritere).value = eval("document.principal.AFF_CRITERE_VAL1_" + codeCritere).value;
                            }
                        }
                    }
                }
            }
            else
            {
                document.principal.URL.value = document.principal.URL_RECHERCHE_FTX.value;
            }
        }
    }
    
    function changeTypeRecherche(objRadio)
    {
        if (objRadio.value == "FTX")
        {
            activeBlocTypeRecherche("FTX", true);
            activeBlocTypeRecherche("LOCUTION", false);
        }
        else
        {
            activeBlocTypeRecherche("FTX", false);
            activeBlocTypeRecherche("LOCUTION", true);
        }
    }
    
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
    
    function activeBlocTypeRecherche(typeRecherche, bActif)
    {
        if (typeRecherche == "FTX")
        {
            document.principal.POS_NB_REP.className = (bActif) ? "inputChamp" : "verrouille";
            document.getElementById('bloc_type_recherche_ftx').style.backgroundColor = (bActif) ? "#ffffff" : "#dddddd";
            document.principal.POS_TRI[0].disabled = !bActif;
            document.principal.POS_TRI[1].disabled = !bActif;
        }
        else if (typeRecherche == "LOCUTION")
        {
            document.getElementById('bloc_type_recherche_locution').style.backgroundColor = (bActif) ? "#ffffff" : "#dddddd";
            for (var codeCritere in tabCritere)
            {
                // s'il s'agit d'un critere date
                if (eval("document.principal.POS_DATE_SELECT_" + codeCritere))
                {
                    eval("document.principal.POS_DATE_SELECT_" + codeCritere).disabled = !bActif;
                }
                else
                    eval("document.principal.CRITERE_VAL1_" + codeCritere).disabled = !bActif;
            }
        }
    }
    
    function isNumeric(input) 
    {     
        return (input - 0) == input && input.length > 0; 
    } 
    </SCRIPT>
</HEAD>

<BODY topmargin="5" leftmargin="30" onLoad="javascript:initEcran();">
<h1 align = "center">{TITRE_PAGE}</h1>
<TABLE class="texteaide" align=center CELLPADDING=5>
<TR>
	<TD class="texteaide">
<SCRIPT language="javascript">

if("{LANGUE}" == "fr")
{
	szText = "Saisissez un ou plusieurs termes dans la zone \"{LIB_MOT_A_RECHERCHER}\" et sélectionner les types de documents dans lesquels vous souhaitez effectuer votre recherche.<br><br>";
	szText+= "Pour améliorer la pertinence de la recherche, appliquer ces conseils : <br>";
	szText+= "<li>entrer les mots à rechercher en minuscules accentuées<br>";
	szText+= "<li>privilégier des expressions \"en français\", par exemple: \"l'assainissement des petites collectivités\" au lieu de \"assainissement petites collectivités\" de manière à ce que l'analyse grammaticale fonctionne<br>";
}
else
{
	szText = "EN Saisissez un ou plusieurs termes dans la zone \"{LIB_MOT_A_RECHERCHER}\" et sélectionner les types de documents dans lesquels vous souhaitez effectuer votre recherche.<br><br>";
	szText+= "Pour améliorer la pertinence de la recherche, appliquer ces conseils : <br>";
	szText+= "<li>entrer les mots à rechercher en minuscules accentuées<br>";
	szText+= "<li>privilégier des expressions \"en français\", par exemple: \"l'assainissement des petites collectivités\" au lieu de \"assainissement petites collectivités\" de manière à ce que l'analyse grammaticale fonctionne<br>";
}
document.write(szText);

</SCRIPT>
	</TD>
</TR>
</TABLE>
<br>
<FORM NAME=principal ACTION="{URL_ATTENTE}" METHOD="POST" onSubmit="return completeForm();">
<input type='hidden' name='URL' value=''>
<input type='hidden' name='URL_RECHERCHE_FTX' value='{URL_RECHERCHE_FTX}'>
<input type='hidden' name='URL_RECHERCHE_FTX_LOCUTION' value="{URL_RECHERCHE_FTX_LOCUTION}">


<table cellpadding="0" cellspacing="5" width="80%" border='0' align=center>
<TR>
    <TD class="tdfond">
    	<table cellpadding='0' cellspacing='0' style="border: 1px solid #959799;" width="100%">
		<tr>
			<TD class="tdnormal"  style="border-right: 1px solid #959799;" valign='top'>
			    <br>
				<table>
				<TR>
                    <TD class="labelObligatoireType">{LIB_MOT_A_RECHERCHER} : </TD>
					<TD><INPUT class="inputChamp" TYPE=TEXT NAME="POS_QUESTION" VALUE="{POS_QUESTION}" SIZE=70></TD>
        		</TR>
        		<TR>
                    <TD class="labelObligatoireType" style="width: 200px;">{LIB_TITRE_CHOIX_INDEX_FICHIER} : </TD>
	                <TD class="labelChamp">
                        <input TYPE="radio" style="vertical-align: -2px;" NAME="TYPE_CHOIX_RUB" VALUE="F X" {SELECTED_CHOIX_RUB_FIC}>{LIB_CHOIX_FICHIER}
                        <input TYPE="radio" style="vertical-align: -2px;" NAME="TYPE_CHOIX_RUB" VALUE="FtX" {SELECTED_CHOIX_RUB_FIC_INDEX}>{LIB_CHOIX_INDEX_FICHIER}
                        <!--<INPUT TYPE="radio" style="vertical-align: -2px;" NAME="TYPE_CHOIX_RUB" VALUE="FrX" {SELECTED_CHOIX_RUB_INDEX}>Index uniquement-->
                    </TD>
                   <TD width="25%"></TD>
				</TR>
				</table>
            </TD>
			<TD class="tdnormal">
                <table cellpadding='0' cellspacing='0' valign='top'>
    		        <TR>
    		       		<TD class="tableau" style="border-bottom: 1px solid #959799;" colspan='2'>{LIB_LIBRAIRIE}</TD>
    				</TR>
                    
                <!--
                <tr>
			    <td>
                        <INPUT align=right name="CHECK_TOUS_TYPES" type="checkbox" {LIB_TOUS_TYPES_CHECKED} onclick="selectAllType();" >
                </td>
                        <td class="labelChamp">{LIB_TOUS_TYPES}</td>
			    </tr>
			    -->
                <!-- BEGIN BLOC_TYPE_DOC -->
        		<TR>
        		    <TD><INPUT name="POS_CHOIX_LIB[]" id="checktype_{CODE_TYPE_DOC}" type="checkbox" value="{CODE_TYPE_DOC}" {LIB_CHECKED} onClick="javascript:afficherCriteres();"></TD> 
            		    <TD class="labelChamp"><span class="labelChamp">{LIB_TYPE_DOC}</span></TD>
        		</TR>
        		<!-- END BLOC_TYPE_DOC -->
        		</table>
            </td>
		</tr>
		</table>
    </td>
    </tr>
    
    <tr>
    <td>
        <TABLE align="left" cellpadding="2" cellspacing="0"  style="border: 1px solid #959799;" width="100%">
		<tr>
        	<TD class="tableau" colspan=2 style="border-bottom: 1px solid #959799;" width="100%">{LIB_AFFICHAGE_REPONSES}</TD>
		</tr>
		<tr>
        	<TD class="tableau" style="border-right: 1px solid #959799;border-bottom: 1px solid #959799;" ><input type="radio" onClick='javascript:changeTypeRecherche(this);' name="POS_TYPE_RECHERCHE" value="LOCUTION" {TYPE_RECHERCHE_LOCUTION_CHECKED}>Liste de documents</TD>
        	<TD class="tableau" style="border-bottom: 1px solid #959799;" ><input type="radio" onClick='javascript:changeTypeRecherche(this);' name="POS_TYPE_RECHERCHE" value="FTX" {TYPE_RECHERCHE_FTX_CHECKED}>Liste de fichiers</TD>
		</tr>
		<tr>
		  <td class="tdnormal" style="border-right: 1px solid #959799;" id='bloc_type_recherche_locution' width="50%">
		      <table cellpadding="2" cellspacing="0">
		      <tr>
		      <td>
		        <table cellpadding="2" cellspacing="0">
			    <!-- BEGIN BLOC_CRITERE_DATE -->
                <tr id='tr_critere_{CODE_CRITERE}'>
                    <td class="labelObligatoireType premierSurligne">{LIBELLE_CRITERE}</td>
                    <td class="labelchamp">
                        <select name="POS_DATE_SELECT_{CODE_CRITERE}" onChange="javascript:changeSelectDate(this);">
                        <option value="">---Date indiférente---</option>
                        <option value="365">Moins d'un an</option>
                        <option value="31">Moins d'un mois</option>
                        <option value="7">Moins d'une semaine</option>
                        <option value=":">Plage de date</option>
                        </select>
                        <span id='POS_CHAMP_DATE' style="display: none;">Comprise entre : <input type="text" name="AFF_CRITERE_VAL1_{CODE_CRITERE}" value="{CRITERE_VAL1}">&nbsp;et&nbsp;<input type="text" name="CRITERE_VAL2_{CODE_CRITERE}" value="{CRITERE_VAL2}"></span>
                        <input type="hidden" name="CRITERE_VAL1_{CODE_CRITERE}" value="{CRITERE_VAL1}">
                        <input type="hidden" name="CRITERE_OP_{CODE_CRITERE}" value="{CRITERE_OP}">
                    </td>
                </tr>
                <!-- END BLOC_CRITERE_DATE -->
                <!-- BEGIN BLOC_CRITERE_ALPHA -->
                <tr id='tr_critere_{CODE_CRITERE}'>
                    <td>{LIBELLE_CRITERE}</td>
                    <td align="left"><INPUT TYPE=TEXT NAME="CRITERE_VAL1_{CODE_CRITERE}" VALUE="{CRITERE_VAL1}" SIZE="15" class="inputChamp"></td>
                </tr>
                <!-- END BLOC_CRITERE_ALPHA -->
			    </table>
			    </td>
			    <td>
			    <img src="../../../../images/icons/pt_docs.gif" title="Affichage des index en colonnes, la liste peut être triée et filtrée." border='0'>
			    </td>
			    </tr>
			    </table>
			</TD>
			<TD class="tdnormal" colspan='1' id='bloc_type_recherche_ftx'>
			     <table cellpadding="2" cellspacing="0">
		      <tr>
		      <td>
			    <table align="center" cellpadding="2" cellspacing="0" width="100%">
                <TR>
                    <TD class="labelObligatoireType premierSurligne">{LIB_TRI} : </TD>
                    <TD class="labelChamp">
                        <INPUT TYPE="radio" style="vertical-align: -2px;" disabled NAME="POS_TRI" VALUE="0" {CHECKED_TRI_PERTINENCE}>{LIB_TRI_PERTINENCE}
                        <INPUT TYPE="radio" style="vertical-align: -2px;" disabled NAME="POS_TRI" VALUE="1" {CHECKED_TRI_OCCURRENCE} >{LIB_TRI_OCCURRENCE}
                    </TD>
                    <TD width="25%"></TD>
                </TR>
                <TR>
                    <TD class="labelObligatoireType">{LIB_NB_REP}</TD>
                    <TD align="left"><INPUT TYPE=TEXT NAME="POS_NB_REP" VALUE="{POS_NB_REP}" SIZE=3 class="verrouille"></TD>
                </TR>
			    </table>
			     </td>
			    <td>
			    <img src="../../../../images/icons/pt_fichiers.gif" title="Affichage des occurences du mot recherché." align='center' border='0'>
			    </td>
			    </tr>
			    </table>
			     
			</TD>
			
		</TR>
		</TABLE>
    </TD>
</TR>
<TR>
    <TD align=center>
		<INPUT TYPE=submit class="bouton_sub" VALUE="{LIBELLE_RECHERCHER}">
		<INPUT TYPE=button class="bouton" onClick="fermeture()" VALUE="{LIBELLE_FERMER}">
	</TD>
</TR>
</TABLE>

</FORM>
</BODY>
</HTML>
