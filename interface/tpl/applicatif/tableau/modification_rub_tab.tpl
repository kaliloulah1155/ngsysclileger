<HTML>
<HEAD>
	<LINK REL="stylesheet" TYPE="text/css" HREF="../../../../include/style/style.css">
	<SCRIPT language="javascript" SRC="../../../../include/script/action_tableau.js"></SCRIPT>
	<script>
	function ajouterLigneTableau(objHref) 
    {
        var table = document.getElementById('tableau_element');
        var iNbRows = table.rows.length;
        // le numero d'element s'incremente toujours independamment de l'ordre d'affichage 
        var iNumElement = iNbRows - 1;
        
        var pos = iNbRows;
        // recherche de la position d'insertion
        var idRowClick = objHref.parentNode.parentNode.id;
        // recherche identifiant de la ligne
        for (var i=0;i<table.rows.length;i++)
        {
            if (table.rows[i].id == idRowClick)
            {
                pos = i + 1;
                break;
            }
        }
        // creation nouvelle ligne et insertion sous la ligne cliquee
        var newTr = table.insertRow(pos);
        newTr.id = "ligne_" + iNumElement;
        
        // copie les elements a partir de la premiere ligne differente de l'entete
        for (i in table.rows[1].childNodes)
        {
            if (table.rows[1].childNodes[i].tagName == "TD")
            {
                var element = table.rows[1].childNodes[i].cloneNode(true);
                for (j in element.childNodes)
                {
                    if (element.childNodes[j].id && element.childNodes[j].id.indexOf("input_cell_") == 0)
                    {
                        var szCodeRub = element.childNodes[j].id.substring(element.childNodes[j].id.lastIndexOf("_") + 1);
                        element.childNodes[j].id = "input_cell_" + iNumElement + "_" + szCodeRub;
                        element.childNodes[j].value = "";
                    }
                }
                newTr.appendChild(element);
            }
        }
    }
    
    function supprimerLigneTableau(objHref) 
    {
        var table = document.getElementById('tableau_element');
        var pos = -1;
        // recherche de la position d'insertion
        var idRowClick = objHref.parentNode.parentNode.id;
        // recherche identifiant de la ligne
        for (var i=0;i<table.rows.length;i++)
        {
            if (table.rows[i].id == idRowClick)
            {
                pos = i;
                break;
            }
        }
        
        if (pos != -1)
        {
            table.deleteRow(pos);
        }
    }
    
    var CST_FIN_LIGNE = "<FIN>";
    function enregistrerTableau() 
    {
        var table = document.getElementById('tableau_element');
        var iNbLignes = table.rows.length;
        
        var listeNum = "";
        // premier indice a 1 pour sauter la ligne d'entete
        for (var i=1;i<iNbLignes;i++)
        {
            var tr = table.rows[i];
            
            var iNumElement = table.rows[i].id.substring("ligne_".length);
            if (document.getElementById("POS_NUM_DOC_LIGNE_" + iNumElement))
                listeNum += document.getElementById("POS_NUM_DOC_LIGNE_" + iNumElement).value + CST_FIN_LIGNE;
            else
                listeNum += "0" + CST_FIN_LIGNE;
            
            var tabListeRub = document.principal.LISTE_CODE_RUB.value.split(';');
            for(var j=0;j<tabListeRub.length - 1;j++)
            {
                var idCellule = "input_cell_" + iNumElement + "_" + tabListeRub[j];
                eval("document.principal.POS_TBL_VAL_RUB_" + tabListeRub[j]).value += document.getElementById(idCellule).value + CST_FIN_LIGNE;
            }
            //sClient += 
        }
        document.principal.NEW_LISTE_NUM_DOC_LIGNE.value = listeNum;
	//document.principal.submit();
	document.principal.V.click();
    }
    
    /*
     * Mise a jour de la taille de toutes les rubriques multi-criteres d'une meme ligne
     */     
    function updateTableRowSize(nomRowParent) 
    {
        var freres = document.getElementById(nomRowParent).getElementsByTagName("textarea");
        var nbMax = 0, tmpNb = 0;
        
        for (var i = 0; i < freres.length; i++) {
            tmpNb = calculeNbLignes(freres[i]);
            
            if (tmpNb > nbMax)
            nbMax = tmpNb;
        }
        
        for (var i = 0; i < freres.length; i++)
        freres[i].rows = nbMax;
    }
    
    function textarea_OnKeyup(event, objTextArea) {
        // Calcul du nb de lignes de la textarea
        if (objTextArea == null)
        return;
        
        updateTableRowSize(objTextArea.parentNode.parentNode.id);
    }
    
    function calculeNbLignes(oElement) 
    {
        if (oElement == null)
        return 0;
        
        var texte = oElement.value.split("\n");
        var nbLigne = texte.length;
        var tmp = 0;
        
        for (var i = 0; i < texte.length; i++) {
        tmp = parseInt("" + (texte[i].length / oElement.cols));
        
        if (tmp != 0 && tmp * oElement.cols == texte[i].length)
            nbLigne = nbLigne + tmp - 1;
        else
            nbLigne = nbLigne + tmp;
        }
        
        return nbLigne;
    }
    
    function annulerSaisie() 
    {
        document.location.href= "./../../../interface/vide.htm";
        afficherLienListeTableau('../tableau/liste_doc_rub_tableau.php?POS_TYPEDOC_PERE={POS_TYPEDOC_PERE}&POS_VALEUR_TAB_RUB={POS_VALEUR_TAB_RUB}&MODE={MODE}&POS_CODE_RUB={CODE_RUB_TABLEAU}&HERM_DROITS={HERM_DROITS}', '{CODE_RUB_TABLEAU}');
    }

    function initEcran() 
    {
        // augmentation de toutes les tailles des textarea 
        var table = document.getElementById('tableau_element');
        var iNbLignes = table.rows.length;
        // premier indice a 1 pour sauter la ligne d'entete
        for (var i=1;i<iNbLignes;i++)
        {
            updateTableRowSize(table.rows[i].id);
        }
    }
    </script>
</HEAD>
<BODY topmargin="5" leftmargin="5" onLoad="javascript:initEcran();">
<form name="principal" method="POST" action="../tableau/modifier_liste_doc_tableau.php" onSubmit="javascript:enregistrerTableau();">
<input type="hidden" name="NB_ELTS_TAB" VALUE="{NB_REPONSE}">
<input type="hidden" name="OLD_LISTE_NUM_DOC_LIGNE" VALUE="{OLD_LISTE_NUM_DOC_LIGNE}">
<input type="hidden" name="NEW_LISTE_NUM_DOC_LIGNE" VALUE="">
<input type="hidden" name="LISTE_CODE_RUB" VALUE="{LISTE_CODE_RUB}">
<input type="hidden" name="POS_CODE_RUB_LIE" VALUE="{POS_CODE_RUB_LIE}">
<input type="hidden" name="POS_VALEUR_RUB_LIE" VALUE="{POS_VALEUR_RUB_LIE}">

<input type="hidden" name="POS_TYPEDOC" VALUE="{POS_TYPEDOC}">
<input type="hidden" name="POS_TYPEDOC_PERE" VALUE="{POS_TYPEDOC_PERE}">
<input type="hidden" name="POS_VALEUR_TAB_RUB" VALUE="{POS_VALEUR_TAB_RUB}">
<input type="hidden" name="MODE" VALUE="{MODE}">
<input type="hidden" name="POS_CODE_RUB" VALUE="{CODE_RUB_TABLEAU}">
<input type="hidden" name="HERM_DROITS" VALUE="{HERM_DROITS}">
<input type="hidden" name="ECRAN_MODIF_EN_COURS" VALUE="1">

<!-- BEGIN FORM_RUB -->
<input type="hidden" name="POS_TBL_VAL_RUB_{CODE_RUB}" value="">
<!-- END FORM_RUB -->
	


<TABLE id="tableau_element" width="98%" class="rubriquetableau">
<TR>
	<th width="80px" class="rubriquetableau" style="vertical-align=top;">
	<a href="javascript:void(0);" onClick="javascript:annulerSaisie();">
	<img class="img_act_tableau" src="/{NOM_APPLICATION}/images/icons/tab_annuler16.gif"></a>
	<input type="submit" name="VALIDER" value="Valider">
    <!--
    <a href="javascript:void(0);" onClick="javascript:document.principal.submit();">
	<img class="img_act_tableau" src="/{NOM_APPLICATION}/images/icons/tab_enregistrer16.gif"></a>
	-->
    </th>
	<!-- BEGIN ENTETE -->
	<th class="rubriquetableau" nowrap>&nbsp;{TITRE_COLONNE}</th>
	<!-- END ENTETE -->
</TR>

<!-- BEGIN LISTE_REPONSES -->
<TR class="ligne" data-line="pair" id="ligne_{NUM_ELEMENT}">
    <input type="hidden" name="POS_NUM_DOC_LIGNE_{NUM_ELEMENT}" value="{POS_NUM_DOC}">
	<TD style="width: 80px;" class="rubriquetableau" style="vertical-align=top;">&nbsp;		
        <a href="javascript:void(0)" onClick="javascript:supprimerLigneTableau(this);" title="{CST_LIBELLE_SUPP}"><img class="img_act_tableau" src="/{NOM_APPLICATION}/images/icons/tab_supprimer.gif"></a>
        <a href="javascript:void(0)" onClick="javascript:ajouterLigneTableau(this);" title="{CST_LIBELLE_AJOUTER}"><img class="img_act_tableau" src="/{NOM_APPLICATION}/images/icons/tab_ajouter.gif"></a>
    </TD>
	<!-- BEGIN LR_REPONSE -->
	<!-- BEGIN LR_REPONSE_MULTICRITERE -->
	<TD class="rubriquetableau">&nbsp;
        <textarea rows="1" class="inputChamp" id="input_cell_{NUM_ELEMENT}_{CODE_RUB}" cols="{SIZE_CELL_LR}" wrap="virtual" 
        onkeyup="textarea_OnKeyup(event, this);">{ZONE_LR}</textarea>
    </TD>                                  
    <!-- END LR_REPONSE_MULTICRITERE -->
    
    <!-- BEGIN LR_REPONSE_MONOCRITERE -->
	<TD class="rubriquetableau" style="vertical-align=top;">&nbsp;<input type="text" class="inputChamp" id="input_cell_{NUM_ELEMENT}_{CODE_RUB}" style="text-align={ZONE_ALIGN_LR}" size="{SIZE_CELL_LR}" value="{ZONE_LR}"></TD>
	<!-- END LR_REPONSE_MONOCRITERE -->
    <!-- END LR_REPONSE -->
</TR>
<!-- END LISTE_REPONSES -->
</TABLE>
</form>
</BODY>
</HTML>
