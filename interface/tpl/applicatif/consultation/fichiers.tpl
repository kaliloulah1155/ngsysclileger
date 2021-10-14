<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<HTML>
<HEAD>
 
<TITLE>Fichiers de premier niveau - {POS_NUM_DOC}</TITLE>
	<LINK REL="stylesheet" TYPE="text/css" HREF="/{NOM_APPLICATION}/include/style/style.css">
	<SCRIPT language="javascript" SRC="/{NOM_APPLICATION}/configuration/constantes.js"></SCRIPT>
	<SCRIPT language="javascript" SRC="/{NOM_APPLICATION}/include/script/association.js"></SCRIPT>
	<SCRIPT language="javascript" SRC="/{NOM_APPLICATION}/include/script/vocabulaire.js"></SCRIPT>
	<SCRIPT language="javascript" SRC="/{NOM_APPLICATION}/include/script/fermeture.js"></SCRIPT>
	<SCRIPT language="javascript" SRC="/{NOM_APPLICATION}/include/script/saisie.js"></SCRIPT>
	<SCRIPT language="javascript" SRC="/{NOM_APPLICATION}/include/script/calendrier.js"></SCRIPT>
	<SCRIPT language="javascript" SRC="/{NOM_APPLICATION}/include/script/attente_fichier.js"></SCRIPT>
	<base target="_self">

<SCRIPT language='javascript'>

function actualiser() {

    if(parent.frm_affiche_fichier != null && parent.frm_affiche_fichier.actualiser) 
        parent.frm_affiche_fichier.actualiser();
	if(CST_TYPE_APPLI == 1)
		location.href="/{NOM_APPLICATION}/interface/session/principal/consultation/afficher_fichier.php?POS_TYPEDOC={POS_TYPEDOC}&POS_NUM_DOC={POS_NUM_DOC}&MODE={MODE}&MODE_FICHIER={MODE_FICHIER}";
	else
		location.href="../../../../servlet/interface/session/principal/consultation.AfficherFichier?POS_TYPEDOC={POS_TYPEDOC}&POS_NUM_DOC={POS_NUM_DOC}&MODE={MODE}&MODE_FICHIER={MODE_FICHIER}";
}

function closeFenetreFichier() {
    parent.closeFenetre();
}

function initEcranAfficherFichier() {
    var doc = document.documentElement;
    doc.setAttribute('data-useragent', navigator.userAgent);
}

function LancerAfficherFichier(objLink, numDoc, numFichier, numSsFichier, sessId, mode, extension) {
    
    var currentIcon = objLink.parentNode.querySelector("img").src;
    objLink.style.fontWeight = 'bold';
    objLink.parentNode.querySelector("img").src = "../../../../images/icons/attente_mini.gif"
    AfficherFichier(numDoc, numFichier, numSsFichier, sessId, mode, extension);
    setTimeout(function() {objLink.parentNode.querySelector("img").src = currentIcon;objLink.style.fontWeight = 'normal';}, 4000);
}

</SCRIPT>

</HEAD>

<BODY topmargin="0" leftmargin="0" onLoad="javascript:initEcranAfficherFichier();">
<div id="listefichier">
<!-- BEGIN BLOC_LISTE_FICHIERS -->
<TABLE CELLSPACING="0" CELLPADDING="5" WIDTH="100%" BORDER="0">
<!-- BEGIN LISTE_FICHIERS -->
<TR>
<!-- BEGIN CELLULE_FICHIERS -->
<TD ALIGN='left' CLASS='filelink'>
<img src="/{NOM_APPLICATION}/images/menu/win/{ICONE_PAGE}.gif" border='0'>&nbsp;<A class='filelink' href="javascript:void(0);" onClick="javascript:void LancerAfficherFichier(this, '{POS_NUM_DOC}', '{NUM_FICHIER}', '{NUM_SS_FICHIER}', '{PHPSESSID}', '{MODE_FICHIER}', '{EXTENSION_PAGE}')">{NOM_FICHIER}</A>&nbsp;</TD>
<!-- END CELLULE_FICHIERS -->
</TR>
<!-- END LISTE_FICHIERS -->
</TABLE>
<!-- END BLOC_LISTE_FICHIERS -->
</div>

<!-- BEGIN BLOC_AJOUT_FICHIERS -->
<!--[if gt IE 9]><!-->
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
  border: 1px solid green;
}

html[data-useragent*='MSIE 10.0'] .fileinput-button input {
    font-size: 200px;
}

span.bouton {
    padding: 3px 3px 3px 3px; 
}
</style>
<!--<![endif]-->

<style>
#dropzone {
    width:300px; 
    height:40px;
    overflow: auto;
}

#listefichier, #ajoutfichier {
    vertical-align: top;
}

#listefichier {
    left: 0px ;
    position: absolute;
    top: 3px;
    width: 500px;
}

#ajoutfichier {
    position: absolute;
    top: 3px;
    right: 1em;
    height: 60px;
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
            return $("#form-principal").serializeArray();
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
            window.actualiser();
            
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
                closeFenetreFichier();
                _dropZone.css('cursor', 'wait');
                data.submit();
            }
        },
        
        progressall: function (e, data) {
            //var progress = parseInt(data.loaded / data.total * 100, 10);
            //$('#progress .progress-bar').css('width', progress + '%');
        }
    });
});
</script>
<div id="ajoutfichier">
<form name="principal" id="form-principal" style="display: none;">
<input type="hidden" NAME="POS_NUM_DOC" value="{POS_NUM_DOC}">
<input type="hidden" id="upload_max_filesize_bytes" value="{upload_max_filesize_bytes}">
<input type="hidden" id="post_max_size_bytes" value="{post_max_size_bytes}">
<input type="hidden" id="upload_max_filesize" value="{upload_max_filesize}">
<input type="hidden" id="post_max_size" value="{post_max_size}">
</form> 
<br>
<!--[if gt IE 9]><!-->
<span class="bouton fileinput-button">
    <!-- The file input field used as target for the file upload widget -->  
    <span>{LIBELLE_SELECT_MANY_FILES} </span>
    <!--<![endif]--> 
    <!--[if lte IE 9]>
        <span>{LIBELLE_SELECT_ONE_FILE}</span>
    <![endif]-->
    <input id="fileupload" type="file" name="files[]" data-url="../gestionfichier/uploader_fichier.php" multiple>
    
<!--[if gt IE 9]><!-->
</span>
<!--<![endif]-->
<br>
<br> 
    <div id="dropzone" class="dropzone" style="display: none;">{LIBELLE_MSG_DND_FILES_OU_CHOIX} </div>
<br>
<br>
</div>
<!-- END BLOC_AJOUT_FICHIERS -->
</BODY>
</HTML>
