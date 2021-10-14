<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<HTML>
<head>
<TITLE>Gestion de fichier</TITLE>
<link REL="stylesheet" TYPE="text/css" HREF="/{NOM_APPLICATION}/include/style/style.css"/>
<SCRIPT language="javascript" SRC="../../../../include/script/jquery/jquery-1.11.1.min.js"></SCRIPT>
<SCRIPT type="text/javascript" SRC="/{NOM_APPLICATION}/include/script/attente_fichier.js"> </script>
<SCRIPT type="text/javascript" SRC="/{NOM_APPLICATION}/include/script/vocabulaire.js"> </script>
<SCRIPT type="text/javascript" SRC="/{NOM_APPLICATION}/include/script/action_fichier.js"></SCRIPT>
<SCRIPT LANGUAGE="JavaScript" type="text/javascript">
function getFenetreConsultation()
{
	return parent;
}

function initEcranFichier() {
    ferme_attente();
    window.focus();
}

function ferme_attente()
{
	getFenetreConsultation().ferme_attente_opener();
}

var plustop = new Image();
plustop.src="/{NOM_APPLICATION}/images/menu/win/plustop.gif";
var plusbottom = new Image();
plusbottom.src="/{NOM_APPLICATION}/images/menu/win/plusbottom.gif";
var plus = new Image();
plus.src="/{NOM_APPLICATION}/images/menu/win/plus.gif";
var plusonly = new Image();
plusonly.src="/{NOM_APPLICATION}/images/menu/win/plusonly.gif";

var minustop = new Image();
minustop.src="/{NOM_APPLICATION}/images/menu/win/minustop.gif";
var minusbottom = new Image();
minusbottom.src="/{NOM_APPLICATION}/images/menu/win/minusbottom.gif";
var minus = new Image();
minus.src="/{NOM_APPLICATION}/images/menu/win/minus.gif";
var minusonly = new Image();
minusonly.src="/{NOM_APPLICATION}/images/menu/win/minusonly.gif";

var blank = new Image();
blank.src="/{NOM_APPLICATION}/images/menu/win/blank.gif";

function afficherSsPage(iNumPage, posIcone)
{
    var nbSsPage = eval("document.principal.NB_SS_PAGE_"+iNumPage+".value")
    for(var i=1;i<=nbSsPage;i++)
    {
        var obj1 = document.getElementById("SSPAGE1_" + iNumPage + "_" + i).style;
        var obj2 = document.getElementById("SSPAGE2_" + iNumPage + "_" + i).style;

        var image = eval("window.document.images['plus_"+iNumPage+"']");
        var img;

        if (obj2.display=="none")
        {
            if(iNumPage != (document.principal.NB_FIN_DE_PAGE.value-1))
                obj1.display = "";
            obj2.display = "";
            
            if(posIcone == "plustop")
                img = eval("minustop");
            else if(posIcone == "plusbottom")
                img = eval("minusbottom");
            else if(posIcone == "plus")
                img = eval("minus");
            else if(posIcone == "plusonly")
                img = eval("minusonly");
            else
                img = eval("blank");
        }
        else
        {
            obj1.display = "none";
            obj2.display = "none";
            
            if(posIcone == "plustop")
                img = eval("plustop");
            else if(posIcone == "plusbottom")
                img = eval("plusbottom");
            else if(posIcone == "plus")
                img = eval("plus");
            else if(posIcone == "plusonly")
                img = eval("plusonly");
            else
                img = eval("blank");
        }

	    image.src = img.src;
	}
}

var tabInfosConfPage = new Array();
<!-- BEGIN BLOC_INFO_CONF_PAGE -->
tabInfosConfPage["{NUM_PAGE_SOUS_PAGE}"] = "{INFO_CONF_PAGE}";
<!-- END BLOC_INFO_CONF_PAGE -->

// Liste des boutons
var sitems=new Array();
var sitemlinks=new Array();
var sitems_SSPAGE=new Array();
var sitemlinks_SSPAGE=new Array();

<!-- BEGIN OPTION_PAGE -->
sitems[{CPT}]="{LIBELLE_FONCTION}";
sitemlinks[{CPT}]="{FONCTION}";
<!-- END OPTION_PAGE -->

<!-- BEGIN OPTION_SS_PAGE -->
sitems_SSPAGE[{CPT}]="{LIBELLE_FONCTION}";
sitemlinks_SSPAGE[{CPT}]="{FONCTION}";
<!-- END OPTION_SS_PAGE -->

var tabExtension=new Array();
var tabNature=new Array();
var i=0;
<!-- BEGIN NATURE_EXTENSION -->
tabExtension[{CPT}]="{EXTENSION}";
tabNature[{CPT}]="{NATURE}";
<!-- END NATURE_EXTENSION -->

function fermerFenetre()
{
    if (document.getElementById("uploadBtn") == null || $("#uploadBtn").prop("disabled") || $("#uploadBtn").html() != ""  || 
        confirm("{LIBELLE_CONFIRM_FERMETURE_FICHIERS}"))
	   getFenetreConsultation().closeFenetre();
}

function actualiserArboFichier()
{
    if(parent.fichier != null)
        parent.fichier.actualiser();
        
    var sUrl = "../gestionfichier/afficher_arborescence.php?";
    sUrl += "POS_TYPEDOC={POS_TYPEDOC}"; 
    sUrl += "&POS_NUM_DOC={POS_NUM_DOC}"; 
    sUrl += "&MODE={MODE}"; 
    sUrl += "&DROIT_MODIF={DROIT_MODIF}"; 
    sUrl += "&DROIT_SUPP={DROIT_SUPP}";
    document.location.href = sUrl;  
}


function valider()
{
    if(document.form_fichier.naturetmp.options[document.form_fichier.naturetmp.selectedIndex].value != "DEFAULT")
        document.form_fichier.nature.value = document.form_fichier.naturetmp.options[document.form_fichier.naturetmp.selectedIndex].value;
}

function validateNiveauConf(evenement, objInput)
{
	var touche = window.event ? evenement.keyCode : evenement.which;
  	if ((touche == 0 || touche == 8 || touche == 9 || touche == 46) || (touche >= '0'.charCodeAt() && touche <= '9'.charCodeAt() && objInput.value.length <= 2))
        return true;
    else
        return false;
}

function validateCloisonnement(evenement, objInput)
{
	if (objInput.value.length <= 2)
	   return true;
    else
        return false;
}
</SCRIPT>
</head>
<BODY onLoad="initEcranFichier();">

<B><U>{LIBELLE_TITRE_ARBO} </U></B><br><br>                                          
<FORM name="principal">
<INPUT type='hidden' name='POS_TYPEDOC' value="{POS_TYPEDOC}">
<INPUT type='hidden' name='NB_FIN_DE_PAGE' value="{NB_FIN_DE_PAGE}">
<INPUT type='hidden' name='URL_AFFICHER_ACTION' value="{URL_AFFICHER_ACTION}">
<INPUT type='hidden' name='MODE' value="{MODE}">
<INPUT type='hidden' name='DROIT_MODIF' value="{DROIT_MODIF}">
<INPUT type='hidden' name='DROIT_SUPP' value="{DROIT_SUPP}">
<INPUT type='hidden' name='MESSAGE_SUPP_FIC' value="{MESSAGE_SUPP_FIC}">

<input type="hidden" id="upload_max_filesize_bytes" value="{upload_max_filesize_bytes}">
<input type="hidden" id="post_max_size_bytes" value="{post_max_size_bytes}">
<input type="hidden" id="upload_max_filesize" value="{upload_max_filesize}">
<input type="hidden" id="post_max_size" value="{post_max_size}">

<div style="overflow: auto;vertical-align: top; height:240px;">
<table border='0' cellspacing='0' cellpadding='0'>
<!-- BEGIN LISTE_PAGE -->
<INPUT type=hidden name="NB_SS_PAGE_{POS_NUM_PAGE}" value="{NB_SS_PAGE}">
<TR onclick='selectLigne(event, this, "{SZ_INFO_PAGE}");'>
    <TD data-menu="no" onclick="afficherSsPage('{POS_NUM_PAGE}','{posIcone}')" width="16">
        <IMG data-menu="no" SRC="/{NOM_APPLICATION}/images/menu/win/{posIcone}.gif" NAME="plus_{POS_NUM_PAGE}">
    </TD>
    <TD NOWRAP STYLE="cursor:default">
        <A HREF="javascript:void AfficherFichier('{POS_NUM_DOC}','{POS_NUM_PAGE}','0','{PHPSESSID}','{MODE_FICHIER}','{EXTENSION_PAGE}')" TITLE="{LIBELLE_VISUALISER_FICHIER}">
            <IMG data-menu="no" SRC="/{NOM_APPLICATION}/images/menu/win/{ICONE_PAGE}.gif" border=0></A> <B>{NOM_FICHIER}</B> 
	</TD>
</TR>
<!-- BEGIN LISTE_SOUS_PAGE -->
<TR onclick='selectLigne(event, this, "{SZ_INFO_SS_PAGE}");'>
    <TD data-menu="no" width=16>
            <span data-menu="no" id="SSPAGE1_{POS_NUM_PAGE}_{POS_NUM_SS_PAGE}" style="display:none">
        <IMG data-menu="no" SRC="/{NOM_APPLICATION}/images/menu/win/line.gif">
        </span>
    </TD>
    <TD NOWRAP STYLE="cursor:default">
            <span id="SSPAGE2_{POS_NUM_PAGE}_{POS_NUM_SS_PAGE}" style="display:none">
        <IMG  data-menu="no" SRC="/{NOM_APPLICATION}/images/menu/win/{posIconeSsFic}.gif"><A HREF="javascript:void AfficherFichier('{POS_NUM_DOC}','{POS_NUM_PAGE}','{POS_NUM_SS_PAGE}','{PHPSESSID}','{MODE_FICHIER}','{EXTENSION_SS_PAGE}')" TITLE="{LIBELLE_VISUALISER_FICHIER}"><IMG data-menu="no" SRC="/{NOM_APPLICATION}/images/menu/win/{ICONE}.gif" border=0></A> {NOM_SOUS_FICHIER} 
        </span>
</TD>
</TR>
<!-- END LISTE_SOUS_PAGE -->
<!-- END LISTE_PAGE -->
<!-- BEGIN FIN_DE_PAGE -->
<TR>
    <TD data-menu="no" width=16><IMG SRC="/{NOM_APPLICATION}/images/menu/win/blank.gif"></TD>
    <TD data-menu="no" NOWRAP STYLE="cursor:default"><IMG SRC="/{NOM_APPLICATION}/images/menu/win/suiv2.gif"><A onClick="onAjouteFinDePage('{POS_NUM_DOC}')" HREF="javascript:void(0)" title="{LIBELLE_AJOUTER_FICHIER}">{LIBELLE_FIN_DE_PAGE}</A></TD>
</TR>
<!-- END FIN_DE_PAGE -->
</table>
</div>
</FORM>

<div style="vertical-align: bottom;">
&nbsp;
<div id="div_form_fichier" style="display: none">
    <FORM name="form_fichier" id="form_file_upload" method="post" enctype="multipart/form-data">
    <INPUT type=hidden name=MAX_FILE_SIZE value="15000000">
    <INPUT type=hidden name=choix value="">
    <INPUT type=hidden name=nature value="">
    <INPUT type=hidden name=choixFichier value="{CHOIX_FICHIER}">
    
    <INPUT type=hidden name=DROIT_MODIF value="{DROIT_MODIF}">
    <INPUT type=hidden name=DROIT_SUPP value="{DROIT_SUPP}">
    <INPUT type=hidden name=POS_TYPEDOC value="{POS_TYPEDOC}">
    <INPUT type=hidden name=POS_NUM_DOC value="{POS_NUM_DOC}">
    
    <INPUT type=hidden name=MODE value="{MODE}">

    <!-- BEGIN BLOC_ACTION -->
    <div style='float:left;'>
    <table role='presentation'>
    <tr>
    	<td colspan='2'><SELECT style='width: 100%;' class="inputChamp" name=naturetmp>
    	    <OPTION value="DEFAULT">{DEFAULT_NATURE}
    		<!-- BEGIN LISTE_NATURE -->
    		<OPTION value="{POS_CODE_NATURE}">{POS_LIBELLE_NATURE}
    		<!-- END LISTE_NATURE -->
    		</SELECT>
    	</td>
    </tr> 
    <tr>
        <td colspan='2'>
        <fieldset style='display:; border: 1px solid gray;'>
        <legend><b>{LIBELLE_TITRE_CONF_FICHIERS}</b></legend>
        <table role='presentation'>
        <tr>
        	<td CLASS="labelChampType">
        		<span id="libIndiceHab"> {LIBELLE_INDICE_HABITATION} </span>
            </td>
            <td>
        		<SELECT class="inputChampType" name="POS_CONF_HAB">
        		<!-- BEGIN LISTE_NIV_CONF -->
        		<OPTION value="{POS_CODE_CONF_HAB}">{POS_LIBELLE_CONF_HAB}
        		<!-- END LISTE_NIV_CONF -->
        		</SELECT>
        	</td>
    	</tr>
    	<tr>
        	<td CLASS="labelChampType">
        		<span id="libNiveauHab"> {LIBELLE_NIVEAU_HABITATION} </span>
            </td>
            <td>
        		<INPUT type="text" class="inputChamp" name="POS_CONF_NIV" size="3" value="0" onKeyPress="return validateNiveauConf(event, this)">
        	</td>
        </tr>
        <tr>
        	<td CLASS="labelChampType">
        		<span id="libClois"> {LIBELLE_CLOISONNEMENT} </span>
            </td>
            <td>
        	   	<INPUT type="text" class="inputChamp" name="POS_CLOISON" size="3" value="" style='text-transform:uppercase;' onChange="this.value=this.value.toUpperCase();" onKeyPress="return validateCloisonnement(event, this)">
        	</td>
    	</tr>
        </table>
        </fieldset>
    </td>
    </tr>
    </table>
    </div>
    <div style='float:right; padding: 10px 10px 10px 10px;'>
    	
<style>
.fileinput-button {
  position: relative;
  overflow: hidden;
}

.filelink{
    word-wrap: break-word;
}
/*
 * Permet de masquer le bouton classique "Parcourir" mais si ça prends trop de place
 * cela peut masquer la zone de drop 
 */ 
.fileinput-button input {
  position: absolute;
  top: 0;
  right: 0;
  margin: 0;
  opacity: 0;
  -ms-filter: 'alpha(opacity=0)';
  width: 225px;
  height: 20px;
  direction: ltr;
  cursor: pointer;
}

span.bouton {
    padding: 3px 3px 3px 3px; 
}
#dropzone {
    width:300px; 
    height: 85px;
    overflow: auto;
}
</style>
<script src="../../../../include/script/jquery/jquery-1.11.1.min.js"></script>
<!-- The jQuery UI widget factory, can be omitted if jQuery UI is already included -->
<script src="../../../../include/script/jquery/jquery.ui.widget.js"></script>
<!-- The Iframe Transport is required for browsers without support for XHR file uploads -->
<script src="../../../../include/script/jquery/jquery.iframe-transport.js"></script>
<script src="../../../../include/script/jquery/jquery.fileupload.js"></script>
<script>
$(function () {
    if (window.FileReader) {
        $('#dropzone').show();
    }

    $(document).bind('drop dragover', function (e) {
        e.preventDefault();
    });
    
	//https://github.com/blueimp/jQuery-File-Upload/wiki/Options
    $('#fileupload').fileupload({ 

        dataType: 'json',
        dropZone: $('#dropzone'),
		autoUpload: false,
        singleFileUploads: false,
        dragover: function (e, data) {
            $(this).fileupload('option', 'dropZone').addClass('hover');
            e.preventDefault(); // Prevents the default dragover action of the File Upload widget
        },
        
        formData : function () {
            document.form_fichier.action = "../gestionfichier/uploader_fichier.php";
            return $("#form_file_upload").serializeArray();
        },
        
        dragleave: function (e, data) {
            $(this).fileupload('option', 'dropZone').removeClass('hover');
            e.preventDefault(); // Prevents the default dragover action of the File Upload widget
        },
        
        done: function (e, data) {
            var sMsgErr= "";
            if (data.result.files)
            {
	            $.each(data.result.files, function (index, file) {
	                if (file.error) {
	                    sMsgErr += "Erreur :" + file.name + " : " + file.error + "\n"; 
	                }
	            });
            }
            else {
                if (data.result.errorThrown)
                    sMsgErr = data.result.errorThrown;
            }
            if (sMsgErr.length != 0)
                alert(sMsgErr);
            actualiserArboFichier();
        },
        
        fail: function (e, data) {
            var msgErr = "erreur"
            if (data.errorThrown)
                msgErr = data.errorThrown;
            alert(msgErr);
                
        },
        
        add:function (e, data) {
        
            var _dropZone = $(this).fileupload('option', 'dropZone').removeClass('hover');
            _dropZone.html("");
            var msgErr = "";
            var tailleTotale = 0;
            
            $.each(data.files, function (index, file) {
                $('<p/>').text(file.name).appendTo(_dropZone);
                tailleTotale += file.size;
                if (file.size > $("#upload_max_filesize_bytes")[0].value) 
                    msgErr = "{MSG_TAILLE_MAX_AVANT_NOM_FICHIER}" + file.name + "{MSG_TAILLE_MAX_AVANT_TAILLE_FICHIER}" +$("#upload_max_filesize")[0].value+"{MSG_TAILLE_MAX_FIN}";  
            });
            
            if (tailleTotale > $("#post_max_size_bytes")[0].value) {
                msgErr = "{MSG_TAILLE_TOTALE_MAX_AVANT_TAILLE}"+$("#post_max_size")[0].value+"{MSG_TAILLE_TOTALE_MAX_FIN}";
            }

            if (msgErr.length > 0) {
                parent.parent.posMessageBoxWarning(msgErr);
                _dropZone.html("");
            }
            else {
                $("#uploadBtn").prop( "disabled", false);
                $("#uploadBtn").off('click').on('click',function () {
                    _dropZone.css('cursor', 'wait');
                    data.submit();
                });
            }
        },
        
        progressall: function (e, data) {
            //var progress = parseInt(data.loaded / data.total * 100, 10);
            //$('#progress .progress-bar').css('width', progress + '%');
        }
    });
});
</script>
<span class="bouton fileinput-button">
    <!-- The file input field used as target for the file upload widget -->  
    <span>{LIBELLE_SELECT_MANY_FILES} </span>
    <input id="fileupload" type="file" name="files[]" data-url="../gestionfichier/uploader_fichier.php" multiple>
</span>
<br>
<br> 
    <div id="dropzone" class="dropzone" style="display: none;">{LIBELLE_MSG_DND_FILES_OU_CHOIX} </div>
<br>
<br>
</div>
<br style='clear:both;' />
<div>
{LIBELLE_POSITION} <span id="span_choixFichier"></span>&nbsp;&nbsp;
{DEB_COM_VALIDER}&nbsp;<INPUT TYPE="button" id='uploadBtn' class=bouton name="ajouter" value="{LIBELLE_VALIDER}" disabled="true" onClick="valider()">{FIN_COM_VALIDER}
    <!-- END BLOC_ACTION -->
    &nbsp;<INPUT TYPE="BUTTON" class=bouton value="{LIBELLE_FERMER}" onclick="javascript:fermerFenetre();">
    </div>
</FORM>
</div>
<div id="div_bloc_consultation">
<INPUT TYPE="BUTTON" class=bouton value="{LIBELLE_FERMER}" onclick="javascript:fermerFenetre();">
</div>
</div>
</BODY>
</HTML>

