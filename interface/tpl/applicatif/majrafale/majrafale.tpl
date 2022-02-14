<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
<title>{CST_MAJRAF_TITRE_FENETRE}</title>
<link REL="stylesheet" TYPE="text/css" href="/{NOM_APPLICATION}/include/style/style.css">
<SCRIPT language="javascript" SRC="../../../../include/script/vocabulaire.js"></SCRIPT>
<script>
function initEcran()
{
    document.principal.CODE_RUBRIQUE.selectedIndex = 0;
    document.principal.CODE_RUBRIQUE.focus();
    if (document.principal.LISTE_NUMDOC.value.length == 0)
    {
        document.getElementById('id_selection_reponse_rep_sel').disabled = true;
        document.getElementById('id_selection_reponse_toutes').checked = true;
        alert("{CST_MAJRAF_MESSAGE_NO_SELECTION}");
    } 
}

function onChangeTypeValeurInitiale(objRadio)
{
    if (objRadio.value == "VALEUR_SAISIE")
    {
        document.principal.VALEUR_INITIALE.readOnly = false;
        document.principal.VALEUR_INITIALE.className = 'inputChamp';
    }
    else
    {
        document.principal.VALEUR_INITIALE.readOnly = true;
        document.principal.VALEUR_INITIALE.className = 'verrouille';
        document.principal.VALEUR_INITIALE.value = "";
    }
}

function charger_vocabulaire_maj_rafale(nomChamp)
{
    var szCodeRubrique = document.principal.CODE_RUBRIQUE.value;
    //charger_vocabulaire_rech_elabore('000', szCodeRubrique, nomChamp);
    // on reecrit le lancement du vocabulaire pour reduire la taille de la fenêtre
    var ref= get_url("URL_VOCAB");
	ref+="POS_CODERUB=";
	ref+=escape(szCodeRubrique);
	ref+="&POS_TYPEDOC=000";
	ref+="&POS_CHAMP=";
	ref+= "document.principal."+ nomChamp;
	ref+="&POS_VOC_LIE=0";
	ref+="&FORCE_MONOCRITERE=1";
	openFenetreVoc(ref, 'Vocabulaire', 450, 320, 20, 20);
}

</script>
</head>
<BODY onLoad='javascript:initEcran();'>
<FORM NAME="principal" ACTION="{URL_METTREAJOURRAFALE}">
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
    <div class='title'>
        <span>{CST_MAJRAF_TITRE_FENETRE}</span>
    </div>
    <div class='content'>
        <div style='display: flex; '>
                <div>
                <select name="CODE_RUBRIQUE" class="inputChamp" SIZE="15">
                <!-- BEGIN BLOC_RUB -->
                    <option VALUE="{CODE}">{LIBELLE}</option>
                <!-- END BLOC_RUB -->
                </select>
            </div>
            <div style='margin-left: 20px; '>
                <label class='labelObligatoire'>{CST_MAJRAF_VALEUR_INITIALE}</label><br> 
                <INPUT type='radio' id='id_type_valeur_initiale_toutes_valeurs' onClick='javascript:onChangeTypeValeurInitiale(this);' name="TYPE_VALEUR_INITIALE" value="TOUTES_VALEURS" SIZE="10" CHECKED>{CST_MAJRAF_TOUTES_VALEURS}<br>
            	<input type='radio' id='id_type_valeur_initiale_valeur_saisie'  onClick='javascript:onChangeTypeValeurInitiale(this);' name="TYPE_VALEUR_INITIALE" value="VALEUR_SAISIE" SIZE="10">{CST_MAJRAF_VALEUR_SAISIE}
            	<input name="VALEUR_INITIALE" TYPE="TEXT" SIZE="20" class="verrouille" readonly>
                <a href="javascript:charger_vocabulaire_maj_rafale('VALEUR_INITIALE')">
	             <div class='iconvocmono' id='img_voc_rafale' title='Vocabulaire'></div></a>
               	<br><br>
            	<label class='labelObligatoire'>{CST_MAJRAF_VALEUR_FINALE}</label><br> 
                <input name="VALEUR_FINALE" SIZE="20" class="inputChamp" style="width: 85%">
                <a href="javascript:charger_vocabulaire_maj_rafale('VALEUR_FINALE')">
	             <div class='iconvocmono' id='img_voc_rafale' title='Vocabulaire'></div></a>
            </div>
        </div>
    </div>
</div>
<div style="margin:auto;width: 30%;text-align:center;">
    <input type="SUBMIT" class="bouton_sub" VALUE="{LIB_EXPORT_VALID}">
    <input type="BUTTON" class="bouton" VALUE="{LIB_EXPORT_CANCEL}" onClick='parent.parent.closeFileModif();'>
</div>
</FORM>

</BODY>
</HTML>
