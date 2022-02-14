<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
<title>{LIB_EXPORT_EXCEL}</title>
<link REL="stylesheet" TYPE="text/css" href="/{NOM_APPLICATION}/include/style/style.css">
<SCRIPT language='JavaScript' SRC='/{NOM_APPLICATION}/include/script/jquery/jquery-1.11.1.min.js'></SCRIPT>
<script>

var dataFileName = "";
var BASE_URL_SERVEUR_LOCAL = "http://localhost:{LOCAL_HTTP_PORT}/jws-scan/";
function scan() {
    $.post(BASE_URL_SERVEUR_LOCAL + "scan", 
        {"source":  $('#selectSource').val()},
        
        function( datalocal ) {
            if (datalocal.code_retour == 0) {
                     $.post("../ajax/add_file.php", 
                        {"POS_NUM_DOC": document.principal.POS_NUM_DOC.value,
                        "POS_NUM_PAGE": 1,
                        "POS_NUM_SSPAGE": 0,
                        "file_content": datalocal.file_content},
                        function( data ) {
                            if (data.code_retour == 1) {
                                
                            }
                            else
                                afficheErreur(data.msg_erreur); 
                        },
                  'json')
                    .fail(function(err) {
                        afficheErreur(getErreurPostData(err));
                        afficheErreur("Erreur connexion à l'application locale.")
                    });
            }
            else
                afficheErreur(datalocal.msg_erreur); 
            }, 'json').
        fail(function(err) {
            afficheErreur(getErreurPostData(err));
});
}

function cancel() {
    parent.closeFileModif();
}

function initEcran() {
    //document.principal.submit();
    // temps minimal pour le chargement du jnlp, ouverture de l'application JWS,
    // lancement du serveur http.
    setTimeout("launchJws()", 1000);
}

var NB_ESSAI_MAX = 10;
var nbEssai = 0;
function launchJws() {

    // teste la présence du serveur http local
    $.post(BASE_URL_SERVEUR_LOCAL + "test", 
        {},
        function( datalocal ) {
            if (datalocal.code_retour == 0) {
                
                $.post(BASE_URL_SERVEUR_LOCAL + "get-sources", 
                    {},
                    function( datalocalsrc ) {
                        if (datalocalsrc.code_retour == 0) {
                                $.each(datalocalsrc.liste_source, function(indice) {
                                    $('#selectSource').append($('<option>', { 
                                        value: datalocalsrc.liste_source[indice].source,
                                        text : datalocalsrc.liste_source[indice].source
                                    }));
                                });
                        }
                        else 
                            afficheErreur(datalocal.msg_erreur); 
                    },
                  'json').fail(function(err) {
                        afficheErreur(getErreurPostData(err));
                    });
            }
            else
                afficheErreur(data.msg_erreur); 
        },
        'json').fail(function(err) {
            afficheErreur(getErreurPostData(err));
            if (nbEssai < NB_ESSAI_MAX) {
                nbEssai++
                setTimeout("launchJws()", 1000);
            }
            else {
                afficheErreur("Erreur au lancement du programme.");    
            }
    });
}

function getErreurPostData(err) {
    var sErreur = "";
    if (err.statusText != null)
        sErreur += "statusText:" + err.statusText;
    if (err.status != null)
        sErreur += "status :" + err.status;
    if (err.responseText != null)
        sErreur += "responseText:" + err.responseText;
    if (err.readyState != null)
        sErreur += "readyState:" + err.readyState;
    return sErreur;
}

function trace(s) {
    console.log(s);
}
function afficheErreur(s) {
    alert(s);
}
</script>
</head>
<body onLoad='javascript:initEcran();'>
<FORM NAME="principal" id="form_principal" target="jnlp" ACTION="../../../../interface/session/principal/numerisation/afficher_numerisation.php">
<input type="hidden" name="POS_NUM_DOC" value="{POS_NUM_DOC}">
<input type="hidden" name="POS_NUM_PAGE" value="{POS_NUM_PAGE}">
<input type="hidden" name="POS_NUM_SSPAGE" value="{POS_NUM_SSPAGE}">
<input type="hidden" name="MODE" value="{MODE}">
<input type="hidden" name="OPEN_JNLP" value="1">
<center>
<table>
<tr colspan='2'>
<td>
<select id="selectSource"></select>
</td>
</tr>
<tr>
<td><input type="BUTTON" class="bouton" VALUE="Numériser" onClick="javascript:scan();"></td>
<td><input type="BUTTON" class="bouton" VALUE="Annuler" onClick="javascript:cancel();"></td>
</tr>
</table>
</center>
</form>
<iframe style="display:;" name="jnlp"></iframe>
</body>
</html>