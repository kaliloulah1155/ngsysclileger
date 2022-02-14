<HTML>
<HEAD>
<TITLE>...</TITLE>
<LINK REL="stylesheet" TYPE="text/css" HREF="/{NOM_APPLICATION}/include/style/style.css">
<CENTER><IMG src="/{NOM_APPLICATION}/images/icons/attente.gif"></CENTER>
<SCRIPT LANGUAGE="JavaScript">
var bRetour = {RETOUR_AJOUT};

// retour OK
// affichage du dossier cible et fermeture de la fenetre
// retour KO
// affichage d'un message d'erreur
if({RETOUR_AJOUT})
	opener.parent.AfficheDossier('{POS_NUM_DOSSIER_PERE}', '{POS_TITRE_DOSSIER_PERE}', '{POS_INDICE_DOSSIER_PERE}');
else
	alert("{POS_ERREUR}");
window.close();
</SCRIPT>
</HTML>

