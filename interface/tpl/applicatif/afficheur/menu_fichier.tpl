<HTML>
<HEAD>
    <LINK REL="stylesheet" TYPE="text/css" HREF="../../../../include/style/style.css">
    <LINK REL="stylesheet" TYPE="text/css" HREF="../../../../include/style/annotation.css">
  	<SCRIPT language="JavaScript" SRC="../../../../include/script/attente_fichier.js"> </SCRIPT>
  	<SCRIPT language="JavaScript" type="text/javascript">
  	// le numero de document courant ! {POS_NUM_DOC} dans le cas ou l'on parcout les fichiers de fiches liées
    var iNumDocEnCours = {POS_NUM_DOC_EN_COURS};
    var iNbFichiers = {NB_FICHIERS};
    var iNumFichierEnCours = {POS_NUM_FICHIER_INIT};
    var iNbPagesFichier = {NB_PAGES_FICHIER};
    var iNumPageEnCours = 1;
    
    // change l'image affichée
    function changeContenu(iNumDoc, iNumFichier, iNumSsFichier) 
    {
        // si changement de fichier, reaffichage la page html
        if (iNumFichier != iNumFichierEnCours)
            document.location.href = "../afficheur/afficher_menu_fichier.php?CACHE_INDEX_LIE=1&POS_NUM_DOC={POS_NUM_DOC}&POS_AFF_DOC_LIE={POS_AFF_DOC_LIE}&CODE_RUB_SOURCE={CODE_RUB_SOURCE}&CODE_TYPE_CIBLE={CODE_TYPE_CIBLE}&CODE_RUB_CIBLE={CODE_RUB_CIBLE}&PROFIL_LR={PROFIL_LR}&POS_NUM_FICHIER=" + iNumFichier;
    }
    
    function navigation(sTypeNavivation) 
    {
        var bErreur = false;
        var iNumFichier = iNumFichierEnCours;
        var iNumPage = 1;
        
        if (sTypeNavivation == "FICHIER_PREMIER")
            iNumFichier = 1;
        else if (sTypeNavivation == "FICHIER_PRECEDENT"){
            if (iNumFichier > 1)
                iNumFichier = iNumFichierEnCours - 1;
            else{
                alert("Début du document");
                bErreur = true;
            }
        }
        else if (sTypeNavivation == "FICHIER_SUIVANT"){
            if (iNumFichier < iNbFichiers)
                iNumFichier = iNumFichierEnCours + 1;
            else {
                alert("Fin du document");
                bErreur = true;
            }
        }
        else if (sTypeNavivation == "FICHIER_DERNIER")
        {
            iNumFichier = iNbFichiers;
        }
        
        if (!bErreur)
            changeContenu(iNumDocEnCours, iNumFichier, 0);
    }
    function initEcran()
    {
        if (iNbFichiers != 0)
        document.getElementById('select_fichier').value = iNumFichierEnCours;
        else
        {
            var ficheIndex = parent.document.getElementById('td_fiche_index');
            ficheIndex.style.display = "";
        }
    }
    
    function actualiser()
    {
        document.location.href = "../afficheur/afficher_menu_fichier.php?POS_NUM_DOC={POS_NUM_DOC}&POS_AFF_DOC_LIE={POS_AFF_DOC_LIE}&CODE_RUB_SOURCE={CODE_RUB_SOURCE}&CODE_TYPE_CIBLE={CODE_TYPE_CIBLE}&CODE_RUB_CIBLE={CODE_RUB_CIBLE}&PROFIL_LR={PROFIL_LR}&POS_NUM_FICHIER=" + iNumFichierEnCours;
    }
    
    function fermerFiche()
    {
        parent.document.principal.FERMER.click();
    }
    
	function afficheMasqueIndex()
    {
        var ficheIndex = parent.document.getElementById('td_fiche_index');
        if (ficheIndex.style.display == "none")
            ficheIndex.style.display = "";
        else
            ficheIndex.style.display = "none";
    }
    
    </SCRIPT>
</HEAD>

<BODY style="margin-top: 2px;margin-right: 1px;margin-left: 1px;" onLoad="javascript:initEcran();">
<!-- BEGIN BLOC_AVEC_FICHIERS -->
    <center>
    <a href="javascript:actualiser();" title="Rafraîchir" onMouseOver="document.getElementById('img_refresh').src='../../../../images/afficheur/refresh_roll.gif';" onMouseOut="document.getElementById('img_refresh').src='../../../../images/afficheur/refresh.gif'"><img id="img_refresh" style="vertical-align: bottom;" src="../../../../images/afficheur/refresh.gif" border='0'></a>
    <select id='select_fichier' onChange="javascript:changeContenu(iNumDocEnCours, document.getElementById('select_fichier').value, 0);">
    <!-- BEGIN BLOC_PAGES -->
        <option value="{NUM_FICHIER}" {SELECT_FICHIER}>{NOM_FICHIER}</option>
    <!-- END BLOC_PAGES -->
    </select>
&nbsp;
<a href="javascript:AfficherFichierLR({POS_NUM_DOC_EN_COURS},{POS_NUM_FICHIER_POSEIDON},{POS_NUM_SSFICHIER},'{PHPSESSID}','CONSULTATION','',true);" title="Ouvrir dans l'application d'origine" onMouseOver="document.getElementById('img_open_app').src='../../../../images/afficheur/open_app_roll.gif';" onMouseOut="document.getElementById('img_open_app').src='../../../../images/afficheur/open_app.gif'"><img id="img_open_app" style="vertical-align: bottom;" src="../../../../images/afficheur/open_app.gif" border='0'></a>
&nbsp;
    <a href="javascript:navigation('FICHIER_PRECEDENT');" title="Fichier précédent" onMouseOver="document.getElementById('fic_img_prec').src='../../../../images/afficheur/fic_precedent_roll.gif';" onMouseOut="document.getElementById('fic_img_prec').src='../../../../images/afficheur/fic_precedent.gif'"><img id="fic_img_prec" style="vertical-align: bottom;" src="../../../../images/afficheur/fic_precedent.gif" border='0'></a>
    &nbsp;
    <a href="javascript:navigation('FICHIER_SUIVANT');" title="Fichier suivant" onMouseOver="document.getElementById('fic_img_suiv').src='../../../../images/afficheur/fic_suivant_roll.gif';" onMouseOut="document.getElementById('fic_img_suiv').src='../../../../images/afficheur/fic_suivant.gif'"><img id="fic_img_suiv" style="vertical-align: bottom;" src="../../../../images/afficheur/fic_suivant.gif" border='0'></a>
    &nbsp;&nbsp;
    <a href="javascript:afficheMasqueIndex();" title="Afficher/Masquer les index" onMouseOver="document.getElementById('img_index').src='../../../../images/afficheur/index_roll.gif';" onMouseOut="document.getElementById('img_index').src='../../../../images/afficheur/index.gif'"><img id="img_index" style="vertical-align: bottom;" src="../../../../images/afficheur/index.gif" border='0'></a>
    &nbsp;
    <a href="javascript:fermerFiche();" title="Retour à la liste" onMouseOver="document.getElementById('img_retourliste').src='../../../../images/afficheur/retourliste_roll.gif';" onMouseOut="document.getElementById('img_retourliste').src='../../../../images/afficheur/retourliste.gif'"><img id="img_retourliste" style="vertical-align: bottom;" src="../../../../images/afficheur/retourliste.gif" border='0'></a>
    </center>				
    	<div id="div_frm_img_fic_en_cours" style="margin-top: 4px;">
			<iframe id="frm_img_fic_en_cours" src="../afficheur/voir_page.php?POS_NUM_DOC={POS_NUM_DOC_EN_COURS}&POS_NUM_FICHIER={POS_NUM_FICHIER_POSEIDON}&POS_NUM_SSFICHIER={POS_NUM_SSFICHIER}&PAGE=0&NB_PAGES={NB_PAGES_FICHIER}" width='100%' height='95%' scrolling='auto' frameborder='3'>
			</iframe>
		</div>
<!-- END BLOC_AVEC_FICHIERS -->

<!-- BEGIN BLOC_SANS_FICHIERS -->
    Il n'y a pas de fichier attaché à ce document. 
    &nbsp;&nbsp;&nbsp;&nbsp;
    <a href="javascript:actualiser();" title="Rafraichir" onMouseOver="document.getElementById('img_refresh').src='../../../../images/afficheur/refresh_roll.gif';" onMouseOut="document.getElementById('img_refresh').src='../../../../images/afficheur/refresh.gif'"><img id="img_refresh" style="vertical-align: bottom;" src="../../../../images/afficheur/refresh.gif" border='0'></a>
    &nbsp;
    <a href="javascript:afficheMasqueIndex();" title="Afficher/Masquer les index" onMouseOver="document.getElementById('img_index').src='../../../../images/afficheur/index_roll.gif';" onMouseOut="document.getElementById('img_index').src='../../../../images/afficheur/index.gif'"><img id="img_index" style="vertical-align: bottom;" src="../../../../images/afficheur/index.gif" border='0'></a>
    &nbsp;
    <a href="javascript:fermerFiche();" title="Retour à la liste" onMouseOver="document.getElementById('img_retourliste').src='../../../../images/afficheur/retourliste_roll.gif';" onMouseOut="document.getElementById('img_retourliste').src='../../../../images/afficheur/retourliste.gif'"><img id="img_retourliste" style="vertical-align: bottom;" src="../../../../images/afficheur/retourliste.gif" border='0'></a>
<!-- END BLOC_SANS_FICHIERS -->
</BODY>
</HTML>
