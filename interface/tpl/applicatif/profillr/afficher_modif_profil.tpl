<!DOCTYPE HTML>
<HTML>
<HEAD>
<LINK REL="stylesheet" TYPE="text/css" HREF="/{NOM_APPLICATION}/include/style/style.css">
	
	<SCRIPT language="javascript">
    var SEPARATEUR_CHAMPS_LR = "{SEPARATEUR_CHAMPS_LR}";	
	function AjouterRub()
	{
	    var valeur_select = document.principal.SZ_RUB.options.selectedIndex;
		if(valeur_select >= 0) 
		{
			var positionArrive = (document.principal.INFO_LISTE.options.selectedIndex >= 0) ? document.principal.INFO_LISTE.options.selectedIndex : document.principal.INFO_LISTE.options.length;
            var szInfoValue = "1"+SEPARATEUR_CHAMPS_LR;
            szInfoValue += (document.principal.SZ_RUB.options[valeur_select].text) + SEPARATEUR_CHAMPS_LR;
            szInfoValue+= "2" + SEPARATEUR_CHAMPS_LR; //align gauche
            szInfoValue+= "100" + SEPARATEUR_CHAMPS_LR; // largeur
            szInfoValue+= document.principal.SZ_RUB.options[valeur_select].value;
            var opt = new Option(document.principal.SZ_RUB.options[valeur_select].text, szInfoValue);
            document.principal.INFO_LISTE.add(opt, positionArrive);
	    }
	}
	
	function AjouterChampSpe()
	{
	    var valeur_select = document.principal.CHAMP_SPE.options.selectedIndex;
		if(valeur_select >= 0) 
		{
			var positionArrive = (document.principal.INFO_LISTE.options.selectedIndex >= 0) ? document.principal.INFO_LISTE.options.selectedIndex : document.principal.INFO_LISTE.options.length;
            var szInfoValue = document.principal.CHAMP_SPE.options[valeur_select].value+ SEPARATEUR_CHAMPS_LR;
            szInfoValue += (document.principal.CHAMP_SPE.options[valeur_select].text) + SEPARATEUR_CHAMPS_LR;
            szInfoValue+= "2" + SEPARATEUR_CHAMPS_LR; //align gauche
            szInfoValue+= "100" + SEPARATEUR_CHAMPS_LR; // largeur
			var opt = new Option(document.principal.CHAMP_SPE.options[valeur_select].text, szInfoValue);
            document.principal.INFO_LISTE.add(opt, positionArrive);
	    }
	}
	
	function ModifierValListe(list)
	{
	    if (list.options.selectedIndex >= 0)
	    {
	        var valeur_select = list.options.selectedIndex;
            var url = document.principal.URL_AFF_VALEUR_CHAMP_PROFIL_LR.value;
            url+= escape(list.options[valeur_select].value);
            url+= "&OPTION_SELECT="+valeur_select;
            return parent.modelesswinyui(url, list.options[valeur_select].text, {width: 520, height: 250, left: 300, top: 200});
	    }
	}
	
	function SupprimerValListe(list)
	{
		if (list.options.selectedIndex >= 0)
	    	list.remove(list.selectedIndex);
        // provoque erreur js : à revoir 
        //w: boucle pour toute la selection
		//while (list.selectedOptions.length) {
		//	list.removeChild (list.selectedOptions[0]);
		//} 
	}
	
	function ValidForm()
	{
        document.principal.NB_ZONE.value = document.principal.INFO_LISTE.options.length;
        
        if(document.principal.NB_ZONE.value != 0 && document.principal.SZ_PROFIL.value != "")
        {
            // on interdit les " et les # dans le nom du profil.
            reg = /["xxx]/;
            /*
            if(reg.test(SZ_PROFIL.value))
            {
                parent.posMessageBoxWarning(document.principal.MESSAGE_IMPO_CREER_PROFIL_AVEC_CARAC_SPE.value);
                return false;
            }
            */
	        document.principal.SZ_ZONE.value = "";
	        for(i=0;i<document.principal.INFO_LISTE.options.length-1;i++)
                document.principal.SZ_ZONE.value += document.principal.INFO_LISTE.options[i].value+"|-|";
	            
	        document.principal.SZ_ZONE.value += document.principal.INFO_LISTE.options[document.principal.INFO_LISTE.options.length-1].value;
        }
        else
        {
            if(document.principal.NB_ZONE.value == 0 && document.principal.SZ_PROFIL.value == "")
                parent.posMessageBoxWarning(document.principal.MESSAGE_IMPO_CREER_PROFIL_VIDE.value);
            else if(document.principal.NB_ZONE.value == 0)
                parent.posMessageBoxWarning(document.principal.MESSAGE_IMPO_CREER_PROFIL_SANS_RUB.value);
            else
                parent.posMessageBoxWarning(document.principal.MESSAGE_IMPO_CREER_PROFIL_SANS_TITRE.value);
                
            return false;
        }
	}
	
	function updateInfoChamp(texte, valeur, indexOption)
	{
	        valOption = new Option(texte,valeur);
	        document.principal.INFO_LISTE.options[indexOption] = valOption;
	}
    function initEcranProfilLr() {
        if (document.principal.SZ_PROFIL.value.length == 0)
            document.principal.SZ_PROFIL.focus();
    }
    
	</SCRIPT>
</HEAD>

<BODY onLoad="initEcranProfilLr();">
<FORM NAME="principal" ACTION="{ACTION}" method="POST" onSubmit="return ValidForm()">
<INPUT TYPE="HIDDEN" NAME="SZ_TYPEDOC" VALUE="{SZ_TYPEDOC}">
<INPUT TYPE="HIDDEN" NAME="NB_ZONE">
<INPUT TYPE="HIDDEN" NAME="SZ_ZONE">
<INPUT TYPE="HIDDEN" NAME="MESSAGE_IMPO_CREER_PROFIL_VIDE" VALUE="{MESSAGE_IMPO_CREER_PROFIL_VIDE}">
<INPUT TYPE="HIDDEN" NAME="MESSAGE_IMPO_CREER_PROFIL_SANS_RUB" VALUE="{MESSAGE_IMPO_CREER_PROFIL_SANS_RUB}">
<INPUT TYPE="HIDDEN" NAME="MESSAGE_IMPO_CREER_PROFIL_SANS_TITRE" VALUE="{MESSAGE_IMPO_CREER_PROFIL_SANS_TITRE}">
<INPUT TYPE="HIDDEN" NAME="MESSAGE_IMPO_CREER_PROFIL_AVEC_CARAC_SPE" VALUE="{MESSAGE_IMPO_CREER_PROFIL_AVEC_CARAC_SPE}">
<INPUT TYPE="HIDDEN" NAME="URL_AFF_VALEUR_CHAMP_PROFIL_LR" VALUE="{URL_AFF_VALEUR_CHAMP_PROFIL_LR}">
<h1>{LIBELLE_CREA_OU_MODIF_PROFIL}</h1>

<div style='width:95%;padding:10px;margin:auto;border: 1px solid #ddd;'>
{LIBELLE_TITRE}&nbsp;
<INPUT TYPE=text NAME="SZ_PROFIL" VALUE="{SZ_PROFIL}" SIZE=90 MAXLENGTH=63 {CLASS_READONLY}>
<!-- BEGIN BLOC_ADMIN -->
<INPUT type=checkbox name=B_PUBLIC value=1 {CHECK}>{LIBELLE_PROFIL_PUBLIC}
<!-- END BLOC_ADMIN -->
<br>
<br>
<div style='width:100%;' >
<div style='width:45%;display: inline-block;margin:auto;vertical-align: top;'>
    <div>
        <div style='width:80%;display: inline-block;vertical-align: middle;'>
        {LIBELLE_LISTE_RUB}<BR>
        <SELECT style='width: 100%'  NAME=SZ_RUB class="inputChamp" size=10 ondblclick="AjouterRub()">
        <!-- BEGIN BLOC_RUB -->
        <OPTION VALUE="{POS_CODE_RUB}"> {POS_LIBELLE_RUB}</OPTION>
        <!-- END BLOC_RUB -->
        </SELECT>
        </div>
        <p style='display: inline-block; vertical-align: middle;'>
            <INPUT class=bouton TYPE=BUTTON VALUE=">>" onClick="AjouterRub()">
        </p>
    </div>
    <br>
    <br>
   <div>
        <div style='width:80%;display: inline-block;vertical-align: middle;'>
            {LIBELLE_LISTE_CHAMP_SPE}<BR>
            <SELECT style='width: 100%' NAME=CHAMP_SPE class="inputChamp" size=10 ondblclick="AjouterChampSpe()">
                <OPTION VALUE="2"> {CHAMP_SPE_TYP_DOC} </OPTION>
                <OPTION VALUE="3"> {CHAMP_SPE_KH} </OPTION>
                <OPTION VALUE="5"> {CHAMP_SPE_CONF} </OPTION>
                <OPTION VALUE="6"> {CHAMP_SPE_CLOI} </OPTION>
                <OPTION VALUE="9"> {CHAMP_SPE_NUM_DOC} </OPTION>
                <OPTION VALUE="10"> {CHAMP_SPE_NB_FICHIERS} </OPTION>
                <OPTION VALUE="11"> {CHAMP_SPE_DOC_ACCES} </OPTION>
                <OPTION VALUE="12"> {CHAMP_SPE_LIB_TYP_DOC} </OPTION>
                <!-- BEGIN BLOC_CHAMP_SPE_LISTE_FICHIERS -->
                <OPTION VALUE="19"> {CHAMP_SPE_LISTE_FICHIERS}</OPTION>
                <!-- END BLOC_CHAMP_SPE_LISTE_FICHIERS -->
            </SELECT>
        </div>
        <p style='display: inline-block; vertical-align: middle;'>
            <INPUT class="bouton" TYPE=BUTTON VALUE=">>" onClick="AjouterChampSpe()">
        </p>
    </div>
</div>        
<div style='width:45%;display: inline-block;margin:auto;'>
    <div>
        {LIBELLE_VISU_PROFIL_LR}<BR>
        <SELECT style='width: 100%' NAME=INFO_LISTE class="inputChamp" size=21 multiple ondblclick="ModifierValListe(this)">
        <!-- BEGIN BLOC_PROFIL -->
        <OPTION VALUE="{POS_CODE_PROFIL}"> {POS_LIBELLE_PROFIL}</OPTION>
        <!-- END BLOC_PROFIL -->
        </SELECT>
    </div>
    <br>
    <div style="margin:auto;width: 60%;text-align:center;">
        <INPUT class=bouton TYPE=BUTTON VALUE="{LIBELLE_SUPPRIMER}" onClick="SupprimerValListe(document.principal.INFO_LISTE)">
        <INPUT class=bouton TYPE=BUTTON VALUE="{LIBELLE_MODIFIER}" onClick="ModifierValListe(document.principal.INFO_LISTE)">
    </div>
</div>
</div>
</div>
<br><br>
<div style="margin:auto;width: 30%;text-align:center;">
    <INPUT class=bouton_sub TYPE=SUBMIT VALUE="{LIBELLE_VALIDER}">
    <INPUT class=bouton TYPE=BUTTON VALUE="{LIBELLE_ANNULER}" onClick="location.href='{URL_ANNULER}'">
</div>
</FORM>
</BODY>
</HTML>
