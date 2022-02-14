<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
<title>{LIB_EXPORT_EXCEL}</title>
<link REL="stylesheet" TYPE="text/css" href="/{NOM_APPLICATION}/include/style/style.css">
<SCRIPT type='text/javascript' SRC='/{NOM_APPLICATION}/include/script/jquery/jquery-1.11.1.min.js'></SCRIPT>
<script type='text/javascript'>
function initEcran()
{
    if (document.principal.LISTE_NUMDOC.value.length == 0)
    {
        document.getElementById('id_selection_reponse_rep_sel').disabled = true;
        document.getElementById('id_selection_reponse_toutes').checked = true;
    }
    
    if (document.principal.INUMQUEST.value.length == 0 || document.principal.INUMQUEST.value == "-1") {
        $('#id_selection_xml').attr("disabled", "disabled");
        $("label[for^='id_selection_xml']").addClass("verrouille");
    }
    
    changeSelectionReponse();    
}

function changeSelectionReponse() {
    
    var valRadioSelectionReponse = $("input[name='SELECTION_REPONSE']:checked", '#form_principal').val();
    var valRadioSelectionExport = $("input[name='SELECTION']:checked", '#form_principal').val();
    var valRadioSelectionFichier = $("input[name='EXPORT_FICHIER']:checked", '#form_principal').val();
    
    if (valRadioSelectionReponse == "toutes") {
        
        if (valRadioSelectionFichier != "AUCUN") {
            alert("{LIB_EXPORT_INFO_EXPORT_FICHIERS}");
            $('#id_selection_fichier_aucun').prop('checked', true);
        }
        $("input[name='EXPORT_FICHIER']").attr("disabled", "disabled");
        $("label[for^='id_selection_fichier_']").addClass("verrouille");
        
        if (document.principal.INUMQUEST.value.length != 0 && document.principal.INUMQUEST.value != "-1") {
            $('#id_selection_xml').removeAttr("disabled");
            $("label[for^='id_selection_xml']").removeClass("verrouille");
        }
    }
    else {
        $("input[name='EXPORT_FICHIER']").removeAttr("disabled");
        $("label[for^='id_selection_fichier_']").removeClass("verrouille");
        
        if (valRadioSelectionExport == "XML") {
            alert("{LIB_EXPORT_INFO_EXPORT_XML}");
            $('#id_selection_profil').prop('checked', true);
        }
        $('#id_selection_xml').attr("disabled", "disabled");
        $("label[for^='id_selection_xml']").addClass("verrouille");
    }
}

$(function() {

    $( "#id_selection_reponse_toutes" ).on( "click", changeSelectionReponse );
    $( "#id_selection_reponse_rep_sel" ).on( "click", changeSelectionReponse );
    
    
});
</script>
</head>
<BODY onLoad='javascript:initEcran();'>
<FORM NAME="principal" id="form_principal" ACTION="{URL_EXPORT}" TARGET="NEW">
<div>
<input type="hidden" name="INUMQUEST" value="{INUMQUEST}">
<input type="hidden" name="INUMDOS" value="{INUMDOS}">
<input type="hidden" name="LISTE_NUMDOC" value="{LISTE_NUMDOC}">
<input type="hidden" name="PHPSESSID" value="{PHPSESSID}"> 
</div>
<div class='box'>
    <div class='title'>
        <span>{LIB_EXPORT_SELECTION_REPONSE}</span>
    </div>
    <div class='content'>
    		<input id='id_selection_reponse_toutes' type='radio' name="SELECTION_REPONSE" value="toutes">{LIB_EXPORT_SELECTION_REPONSE_TOUTES}&nbsp;&nbsp;&nbsp;
            <input id='id_selection_reponse_rep_sel' type='radio' name="SELECTION_REPONSE" value="selection" checked>{LIB_EXPORT_SELECTION_REPONSE_REP_SEL}
    </div>
</div>

<div class='box'>
    <div class='title'><span>{LIB_EXPORT_DOC}</span></div>
    <div class='content'>
            {LIB_EXPORT_CARACT_SEP} <INPUT TYPE="RADIO" name="CAR_SEP" VALUE=";" SIZE="10" CHECKED>{LIB_EXPORT_POINT_VIRGULE}<INPUT TYPE="RADIO" name="CAR_SEP" VALUE="tabulation" SIZE="10">{LIB_EXPORT_TAB}
        	<input type='radio' name="CAR_SEP" VALUE="other" SIZE="10">{LIB_EXPORT_OTHER_VALUE}
        	<input name="SEPARATEUR" TYPE="TEXT" SIZE="10" class="inputChamp">
    </div>
</div>
<div class='box'>
    <div class='title'><span>{LIB_FORMAT_EXPORT_RUB}</span></div>
    <div class='content'>
		<input id="id_selection_profil" type='radio' name="SELECTION" VALUE="PROFIL" CHECKED>
		 <label for="id_selection_profil" class='labelChamp'>{LIB_EXPORT_PROFIL}</label>
				<select NAME="PROFIL_LR" class="inputChamp" SIZE="1">
				<!-- BEGIN OPTIONS -->
            <option VALUE="{VALUE_OPTION}" {SELECTED} > {TITRE_OPTION} </option>
				<!-- END OPTIONS -->
		</select>
		<br>
        <input id="id_selection_toutes_rubriques" type='radio' name="SELECTION" VALUE="TOUTES_RUBRIQUES">
		<label for="id_selection_toutes_rubriques" class='labelChamp'>{LIB_EXPORT_ALL_RUB}</label>
        <br>
        <input id="id_selection_xml" TYPE="RADIO" name="SELECTION" VALUE="XML">
        <label for="id_selection_xml" class='labelChamp'>{LIB_EXPORT_XML} </label>
    </div>
</div>

<div class='box'>
    <div class='title'><span>{LIB_EXPORT_FICHIERS}</span></div>
    <div class='content'>
    	    {LIB_EXPORT_INFO_EXPORT_FICHIERS}
    	    <br>
    	<input id='id_selection_fichier_aucun' type='radio' {DISABLED_EXPORT_FICHIERS_AUCUN} name="EXPORT_FICHIER" value="AUCUN" checked><label for="id_selection_fichier_aucun" class='labelChamp'> {LIB_EXPORT_FICHIERS_AUCUN}&nbsp;&nbsp;&nbsp; </label>
    	<input id='id_selection_fichier_fichiers' type='radio' {DISABLED_EXPORT_FICHIERS_FICHIERS} name="EXPORT_FICHIER" value="FICHIERS"><label for="id_selection_fichier_fichiers" class='labelChamp'>{LIB_EXPORT_FICHIERS_FICHIER}&nbsp;&nbsp;&nbsp; </label>
        <input id='id_selection_fichier_fichiers_sous_fichiers' {DISABLED_EXPORT_FICHIERS_SOUS_FICHIERS} type='radio' name="EXPORT_FICHIER" value="FICHIER_SOUS_FICHIERS" ><label for="id_selection_fichier_fichiers_sous_fichiers" class='labelChamp'>{LIB_EXPORT_FICHIERS_FICHIER_SOUS_FICHIERS} </label>
    </div>
</div>
<div style="margin:auto;width: 30%;text-align:center;">
    <input type="SUBMIT" class="bouton_sub" VALUE="{LIB_EXPORT_VALID}">
    <input type="BUTTON" class="bouton" VALUE="{LIB_EXPORT_CANCEL}" onClick='parent.parent.closeFileModif();'>
</div>
</form>
</body>
</html>
