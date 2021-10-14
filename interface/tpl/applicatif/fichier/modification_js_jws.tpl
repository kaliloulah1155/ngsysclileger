<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
<title>{LIB_EXPORT_EXCEL}</title>
<link REL="stylesheet" TYPE="text/css" href="/{NOM_APPLICATION}/include/style/style.css">
<SCRIPT language='JavaScript' SRC='/{NOM_APPLICATION}/include/script/jquery/jquery-1.11.1.min.js'></SCRIPT>
<script>

var dataFileName = "";
var BASE_URL_SERVEUR_LOCAL = "http://localhost:{LOCAL_HTTP_PORT}/jws-modification-fichier/";
function saveFile() {
    $.post(BASE_URL_SERVEUR_LOCAL + "enreg-modif-file", 
            {"file_name": dataFileName},
            function( datalocal ) {
                if (datalocal.code_retour == 0) {
                         $.post("../ajax/put_file.php", 
                            {"POS_NUM_DOC": document.principal.POS_NUM_DOC.value,
                            "POS_NUM_PAGE": document.principal.POS_NUM_PAGE.value,
                            "POS_NUM_SSPAGE": document.principal.POS_NUM_SSPAGE.value,
                            "file_content": datalocal.file_content},
                            function( data ) {
                                if (data.code_retour == 1) {
                                    alert("fichier sauvegardé");
                                    parent.closeFileModif();
                                    
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

function cancelFile() {
    
    if (confirm("Etes-vous sur de vouloir abandonner les modifications sur ce fichier ?")) {
        $.post(BASE_URL_SERVEUR_LOCAL + "cancel-modif-file", 
            {"file_name": dataFileName},
                function( datalocal ) {
                    if (datalocal.code_retour == 0) {
                        parent.closeFileModif();
                    }
                    else
                        afficheErreur(datalocal.msg_erreur); 
                    }, 'json').
                fail(function(err) {
                    afficheErreur(getErreurPostData(err));
                });
    }
}

function initEcran() {
    document.principal.submit();
    // temps minimal pour le chargement du jnlp, ouverture de l'application JWS,
    // lancement du serveur http.
    setTimeout("openFileInJws()", 1000);
}

var NB_ESSAI_MAX = 10;
var nbEssai = 0;
function openFileInJws() {

    // teste la présence du serveur http local
    afficheStatut("Test de connexion au serveur local");
    $.post(BASE_URL_SERVEUR_LOCAL + "test", 
        {},
        function( datalocal ) {
            if (datalocal.code_retour == 0) {
                // recuperation du fichier dans la base
                $.getJSON( "../ajax/get_file.php", {
                            "POS_NUM_DOC": document.principal.POS_NUM_DOC.value,
                            "POS_NUM_PAGE": document.principal.POS_NUM_PAGE.value,
                            "POS_NUM_SSPAGE": document.principal.POS_NUM_SSPAGE.value
                         }, 
                        function( data ) {
                            if (data.code_retour == 1) {
                                dataFileName = data.file.name;
                                trace(dataFileName);
                                
                                $.post(BASE_URL_SERVEUR_LOCAL + "open-file", 
                                        {"file_name": data.file.name,
                                         "file_content": data.file.content},
                                        function( datalocal ) {
                                            if (datalocal.code_retour != 0) 
                                                afficheErreur(datalocal.msg_erreur); 
                                        },
                                  'json')
                                    .fail(function(err) {
                                        afficheErreur(getErreurPostData(err));
                                        afficheErreur("Erreur de connexion à l'application locale.")
                                    });
                            }
                            else
                                afficheErreur(data.msg_erreur); 
                    }).fail(function(err) {
                        afficheErreur(getErreurPostData(err));
                });
            } 
        },
        'json')
        .fail(function(err) {
                afficheErreur(getErreurPostData(err));
                if (nbEssai < NB_ESSAI_MAX) {
                    afficheStatut("Tentative de connexion au serveur local n°:" + nbEssai);
                    nbEssai++;
                    setTimeout("openFileInJws()", 1000);
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
function afficheStatut(s) {
    document.getElementById('statut').innerHTML = s;
}
</script>
</head>
<BODY onLoad='javascript:initEcran();'>
<FORM NAME="principal" id="form_principal" target="jnlp" ACTION="../../../../interface/session/principal/gestionfichier/consulter_fichier.php">
<input type="hidden" name="POS_NUM_DOC" value="{POS_NUM_DOC}">
<input type="hidden" name="POS_NUM_PAGE" value="{POS_NUM_PAGE}">
<input type="hidden" name="POS_NUM_SSPAGE" value="{POS_NUM_SSPAGE}">
<input type="hidden" name="MODE" value="{MODE}">
<input type="hidden" name="B_WEBDAV" value="{B_WEBDAV}">
<input type="hidden" name="OPEN_JNLP" value="1">
<center>
<table>
<tr>
<td>
<HR>
<b>{LIBELLE_MESSAGE_1}</b>
<BR>
{LIBELLE_MESSAGE_2}
<BR>
<HR>
<BR>
<span id='statut'></span>
<HR>
<BR>
<BR>
<BR>
</td>
</tr>
<tr>
<td style='text-align: center'><input type="BUTTON" class="bouton" VALUE="Sauver" onClick="javascript:saveFile();">
&nbsp;<input type="BUTTON" class="bouton" VALUE="Annuler" onClick="javascript:cancelFile();"></td>
</tr>
</table>
</center>
</form>
<iframe style="display:none;" name="jnlp"></iframe>
</body>
</html>