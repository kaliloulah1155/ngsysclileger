<?php 

if (!defined("CONSTANTE"))
{

define("CONSTANTE", 1);

# Serveur et Port pour la connexion
define("POS_SERVEUR", "localhost");
define("POS_PORT", "9000");


# Nombres de réponses par page de résultats.
define("NB_REPONSES_PAR_PAGE", "20");
# Nombres de page de résultats à afficher avant le bouton page suivantes.

define("NB_PAGES_AFFICHEES", "20");
define("DOSSIER_REPONSES_PAR_PAGE", 1);

# Nombres de locutions pour la recherche élaborée.
define("CST_NB_LOC_RECH_ELA", "5");

# Type de tri : CROISSANT:1, DECROISSANT:2 et AUCUN:0.
define("CST_TYPE_TRI", "1");

# Ouverture automatique lorsqu'on a une seule réponse : 1(oui) et 0(non).
define("CST_OUVERTURE_AUTO", "0");

# Constantes concernant l'ouverture de la page des fichiers.
define("CST_TOP_FILE", "50");
define("CST_LEFT_FILE", "200");
define("CST_WIDTH_FILE", "600");
define("CST_HEIGHT_FILE", "520");

# Systeme 0 pour Windows , 1 pour UNIX
define("CST_UNIX", "0");

# Langage (fr -> francais, pt -> portugais, en -> anglais)
define("CST_LANG", "fr");

# Impression 
define("CST_IMPRIMER", "1");

# Affichage du choix des profils de liste résumée.
define("CST_AFFICHER_CHOIX_PROFIL", "0");

# Exportation 0 et 1 (exportation excel).
define("CST_EXPORTER", "0");

# Affichage du panier
define("CST_PANIER", "0");

# Nombre de réponse maximum pour afficher directement la liste résumée
define("NB_REPONSES_MAX_LR", "100");

# utilisation des macros ou des librairies RTF
#define("CST_MACRO_WORD", "0");
#Ligne ajouter par ibrahim
define("CST_MACRO_WORD", "officeopenxml");

# Utilisation de posdav.exe oui(1) ou de l'applet (2) ou aucune utilisation(0).
define("CST_UTIL_POS_DAV_POINT_POW", "2");

# Gestion des dossiers oui(1) ou non(0).
define("CST_GESTION_DOSSIER", "1");
# Affichage du bouton 'Dossiers pères' 0(non) ou 1(oui).
define("CST_DOSSIER_PERE", "0");

# Largeur de la frame du menu.
define("LARGEUR_FRM_MENU", "320");
# Confimation à la fermeture.
define("CST_CONFIRM_FERMETURE", "1");

#Ligne ajoutée par ibrahim
define("NATURE_POSEIDON_DOCX", "DCX");
define("EXTENSION_DOCX", ".docx");
define("URL_WEB_SERVICE_WSGEDPOSEIDON", "http://localhost:8080/WsPosOpenXml/ServiceMaj.asmx?WSDL");

#Ligne ajoutée par ibrahim
// Imagette 0(Fiches) et 1(Fiches+Fichiers).
define("CST_IMAGETTE", "1");
define("CST_NATURE_FICHIER_PDF", "002");
define("CST_NATURE_FICHIER_TIFF", "000");
define("CST_NATURE_FICHIER_JPG", "JPG"); 

# Nom et url de l'application.
#define("NOM_APPLICATION", "ariane-team-sh");
#define("URL_SITE", "/ariane-team-sh");

define("NOM_APPLICATION", "NGSYS");
define("URL_SITE", "/NGSYS");


# Gestion du multi-profil.
define("CST_AFFICHAGE_PROFIL_BAL", "1");

# Gestion du drag and drop.
define("DRAG_AND_DROP", "1");

# Gestion webdav.
define("URL_WEBDAV", "/webdav/");
define("REP_WEBDAV", "webdav");
define("CHEMIN_WEBDAV", "");

}
?>
