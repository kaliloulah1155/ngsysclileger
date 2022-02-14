<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
<title>{TITRE_PAGE}</title>
<link REL="stylesheet" TYPE="text/css" href="/{NOM_APPLICATION}/include/style/style.css">
<SCRIPT language='javascript' src='../../../../include/script/calendrier.js'></SCRIPT>
<SCRIPT language='javascript' src='../../../../include/script/fermeture.js'></SCRIPT>
<script>
function initEcran()
{
    parent.setTitle(); 
}

function verifForm()
{
    /*
    if (document.getElementById('DATE_DEBUT').value.length == 0 ||
        document.getElementById('DATE_FIN').value.length == 0) {
        alert(document.getElementById('MSG_DATES_NON_RENSEIGNEES').value);
        
        if (document.getElementById('DATE_DEBUT').value.length == 0)
            document.getElementById('DATE_DEBUT').focus();
        else
            document.getElementById('DATE_FIN').focus();
        return false;
    }
    */
    return true;
        
}
</script>
</head>
<BODY onLoad='javascript:initEcran();'>
<FORM NAME="principal" ACTION="{URL_GENERER_STATS_ADMIN}" onSubmit="return verifForm();">
<input type="hidden" name="PHPSESSID" value="{PHPSESSID}">
<input type="hidden" id="MSG_DATES_NON_RENSEIGNEES" value="{MSG_DATES_NON_RENSEIGNEES}">
<input type="hidden" name="TYPE_SORTIE" VALUE="CSV"> 
<h1 style='text-align: center'>{TITRE_PAGE} </h1>
<div style='width: 100%;margin: 0 auto;width:500px;'> 
&nbsp;
<table cellpadding="1" cellspacing="1" class="tdfond">
    <tr>
        <td class='tableau' nowrap>{LIB_STAT_ADMIN_BLOC_PARAM}</td>
    </tr>
    <tr class='trnormal'>
    	<td class='tdnormal'>
        <label for="MOIS_DEBUT" class='labelChamp'>{LIB_DATE_DEBUT} </label>
        	<select class='inputChamp' id='MOIS_DEBUT' name='MOIS_DEBUT'>
    		<!-- BEGIN MOIS_DEBUT -->
    		<option VALUE="{NUM_MOIS}" {SELECTED}> {LIB_MOIS}</option>
    		<!-- END MOIS_DEBUT -->
    		</select>&nbsp;
        <input type="text" class="inputChamp" name="ANNEE_DEBUT" id='ANNEE_DEBUT' value="{ANNEE_DEBUT}" SIZE="4">

        &nbsp;&nbsp;&nbsp;
        <label for="MOIS_FIN" class='labelChamp'>{LIB_DATE_FIN} </label>
        	<select class='inputChamp' id='MOIS_FIN' name='MOIS_FIN'>
    		<!-- BEGIN MOIS_FIN -->
    		<option VALUE="{NUM_MOIS}"  {SELECTED}> {LIB_MOIS}</option>
    		<!-- END MOIS_FIN -->
    		</select>&nbsp;
        <input type="text" class="inputChamp" name="ANNEE_FIN" id='ANNEE_FIN' value="{ANNEE_FIN}" SIZE="4">

        </td>
    </tr>
    <tr class='trnormal'>
    	<td class='tdnormal'>
    	<br>
            {LIB_EXPORT_CARACT_SEP} <input type="RADIO" name="CAR_SEP" VALUE=";" CHECKED>{LIB_EXPORT_POINT_VIRGULE}<INPUT TYPE="RADIO" name="CAR_SEP" VALUE="tabulation" SIZE="10">{LIB_EXPORT_TAB}
        	<input type='radio' name="CAR_SEP" VALUE="other" SIZE="10">{LIB_EXPORT_OTHER_VALUE}
        	<input name="SEPARATEUR" TYPE="TEXT" SIZE="10" class="inputChamp">
    	</td>
    </tr>
</table>
<br>
<br>
<table align='center'>
<tr>
    <td><input type="SUBMIT" class="bouton_sub" VALUE="{LIB_VALIDER}"></td>
    <td><input type="BUTTON" class="bouton" VALUE="{LIB_ANNULER}" onClick='fermeture();'></td>
</tr>
</table>
</div>
</form>
</body>
</html>
