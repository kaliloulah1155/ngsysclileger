<?php

if (!defined("URL"))
{
define("URL", 1);

# url pour recherche elaboree
define("URL_RECHERCHE_ELABOREE", URL_SITE."/interface/session/principal/recherche/afficher_recherche_elaboree.php");
define("URL_PARAM_RECHERCHE_ELABOREE", URL_SITE."/interface/session/principal/recherche/afficher_recherche_elaboree.php?INUMQUEST=%d&POS_TYPEDOC=%s");

# enregistrement question bib
define("URL_RECHERCHE_ELABOREE_ENREG_QUEST", URL_SITE."/interface/session/principal/gestionbiblio/afficher_question_bib.php");
define("URL_ENREG_QUEST", URL_SITE."/interface/session/principal/gestionbiblio/enregistrer_question.php");
	

# url pour recherche la question simple par ibson
define("URL_QUESTION_SIMPLE", URL_SITE."/interface/session/principal/recherche/recherchesimple.php");

# url pour recherche simple
define("URL_FRAME_RECHERCHE_SIMPLE", URL_SITE."/interface/session/principal/recherche/frame.php");
define("URL_RECHERCHE_SIMPLE", URL_SITE."/interface/session/principal/recherche/afficher_recherche_fiche.php");
define("URL_PARAM_RECHERCHE_SIMPLE", URL_SITE."/interface/session/principal/recherche/afficher_recherche_fiche.php?INUMQUEST=%d&POS_TYPEDOC=%s");
define("URL_PARAM_RECHERCHE_SIMPLE_NUM_FICHE", URL_SITE."/interface/session/principal/recherche/afficher_recherche_fiche.php?INUMQUEST=%d&POS_TYPEDOC=%s&POS_NUM_FICHE=%d");

define("URL_RECHERCHE_POS_NUM_DOC", URL_SITE."/interface/session/principal/recherche/afficher_recherche_num_doc.php");
define("URL_PARAM_RECHERCHE_POS_NUM_DOC", URL_SITE."/interface/session/principal/recherche/afficher_recherche_num_doc.php?POS_NUM_DOC=%s");

# url pour recherche par cle hierarchique
define("URL_PARAM_RECHERCHE_CLE_2", URL_SITE."/interface/session/principal/recherche/frame1_afficher_recherche_cle.php?INUMQUEST=%d&POS_TYPEDOC=%s");
define("URL_AFF_RECH_CLE_HIER", URL_SITE."/interface/session/principal/recherche/afficher_recherche_cle.php");
define("URL_AFF_RECH_CLE_HIER_FRM1", URL_SITE."/interface/session/principal/recherche/frame1_afficher_recherche_cle.php");

# url pour recherche d'affichage des resultats 
define("URL_RESULTAT", URL_SITE."/interface/session/principal/resultat/rechercher_db.php");
define("URL_RESULTAT_SIMPLE", URL_SITE."/interface/session/principal/resultat/rechercher_db.php?TYPE_RECHERCHE=RECHERCHE_SIMPLE");
define("URL_PARAM_QUESTION_RESULTAT", URL_SITE."/interface/session/principal/resultat/rechercher_db.php?TYPE_RECHERCHE=%s&POS_QUEST_NOM=%s&POS_QUEST_PUBLIC=%d");
define("URL_PARAM_QUESTION_PROFIL_RESULTAT", URL_SITE."/interface/session/principal/resultat/rechercher_db.php?TYPE_RECHERCHE=%s&POS_QUEST_NOM=%s&POS_QUEST_TYPE=%s&POS_QUEST_PARTAGE=%d&POS_PROFIL_LR=%s");
define("URL_OBTENIR_NB_REP", URL_SITE."/interface/session/principal/question/obtenir_nbreponses_multi.php");

define("URL_PARAM_QUESTION_RESULTAT_AVEC_ATTENTE", URL_SITE."/interface/session/principal/resultat/rechercher_db.php&TYPE_RECHERCHE=%s&POS_QUEST_NOM=%s&POS_QUEST_PUBLIC=%d");
define("URL_PARAM_QUESTION_PROFIL_RESULTAT_AVEC_ATTENTE", URL_SITE."/interface/session/principal/resultat/rechercher_db.php&TYPE_RECHERCHE=%s&POS_QUEST_NOM=%s&POS_QUEST_PUBLIC=%d&POS_PROFIL_LR=%s");

# url pour la création de fiche d'index
define("URL_CREATION", URL_SITE."/interface/session/principal/creation/afficher_creation.php");
define("URL_CREER", URL_SITE."/interface/session/principal/creation/creer_index.php");

# Vocabulaire
define("URL_AFFICHER_VOCAB", URL_SITE."/interface/session/principal/vocabulaire/afficher_db.php");
define("URL_AFFICHER_VOCAB_HIER", URL_SITE."/interface/session/principal/vocabulaire/afficher_vocab_hier.php");
define("URL_AFFICHER_VOCAB_KH", URL_SITE."/interface/session/principal/vocabulaire/afficher_cle_db.php");

# Consultation d'un index
define("URL_CONSULTER_INDEX", URL_SITE."/interface/session/principal/consultation/consulter_index.php");
define("URL_PARAM_CONSULTER_INDEX", URL_SITE."/interface/session/principal/consultation/consulter_index.php?MODE=%s&POS_NUM_DOC=%d&POS_TYPEDOC=%s&POS_NUM_FICHE=%d");

# Modification d'un index
define("URL_MODIFIER_INDEX", URL_SITE."/interface/session/principal/consultation/modifier_index.php");

define("URL_FERMER_INDEX", URL_SITE."/interface/session/principal/consultation/fermer_index.php");
define("URL_PARAM_FERMER_INDEX", URL_SITE."/interface/session/principal/consultation/fermer_index.php?MODE=%s&POS_NUM_DOC=%d");
define("URL_PARAM_UNLOAD_INDEX", "if (opener) LibereDocument('%s','%d')");

# Impression d'un index
define("URL_IMPRIMER_INDEX", URL_SITE."/interface/session/principal/consultation/imprimer_index.php");

# Association d'un index
define("URL_ASSOCIER_INDEX", URL_SITE."/interface/session/principal/association/associer_index.php");

# Exportation des resultats
define("URL_EXPORTATION_EXCEL", URL_SITE."/interface/session/principal/export/exporter_resultat.php");

# Exportation des resultats
define("URL_AFFICHER_QUESTION", URL_SITE."/interface/session/principal/question/afficher_question.php");

# Affichage des fichiers
define("URL_AFFICHER_ACTION_FICHIER", URL_SITE."/interface/session/principal/gestionfichier/afficher_liste_action.php");
define("URL_CONSULTER_FICHIER", URL_SITE."/interface/session/principal/gestionfichier/consulter_fichier.php");
define("URL_CONSULTER_FICHIER2", URL_SITE."/interface/session/principal/gestionfichier/consulter_fichier2.php");
define("URL_AFFICHER_LISTE_FICHIER", URL_SITE."/interface/session/principal/gestionfichier/frame.php");
define("URL_AFFICHER_ARBO_FICHIER", URL_SITE."/interface/session/principal/gestionfichier/afficher_arborescence.php");
define("URL_ACTION_FICHIER", URL_SITE."/interface/session/principal/gestionfichier/action_fichier.php");
define("URL_SAUVER_FICHIER", URL_SITE."/interface/session/principal/gestionfichier/sauver_fichier.php");
define("URL_SAUVER_FICHIER_POSTFICHIER", URL_SITE."/interface/session/principal/gestionfichier/sauver_fichier_postfichier.php");
define("URL_PARAM_SAUVER_FICHIER", URL_SITE."/interface/session/principal/gestionfichier/sauver_fichier.php?POS_NUM_DOC=%s&POS_NUM_PAGE=%s&POS_NUM_SSPAGE=%s&PHPSESSID=%s&POS_NOMFICHIER=%s");
define("URL_SUPP_FICHIER", URL_SITE."/interface/session/principal/gestionfichier/supprimer_fichier_dav.php");
define("URL_PARAM_SUPP_FICHIER", URL_SITE."/interface/session/principal/gestionfichier/supprimer_fichier_dav.php?POS_NUM_DOC=%s&POS_NUM_PAGE=%s&POS_NUM_SSPAGE=%s&PHPSESSID=%s");
define("URL_APPLET_JAR", URL_SITE."/interface/tpl/applicatif/fichier/");

# excalibur
define("URL_AFFICHER_RECHERCHE_EXB", URL_SITE."/interface/session/principal/excalibur/afficher_excalibur.php");
define("URL_RECHERCHE_EXB", URL_SITE."/interface/session/principal/excalibur/rechercher.php");
define("URL_CONSULTER_EXB", URL_SITE."/interface/session/principal/excalibur/consulter_fichier.php");
define("URL_AFFICHER_MODE_EXPERT_EXB", URL_SITE."/interface/session/principal/excalibur/afficher_mode_expert.php");

# ftx
define("URL_AFFICHER_RECHERCHE_FTX", URL_SITE."/interface/session/principal/ftx/afficher_rech_ftx.php");
define("URL_RECHERCHE_FTX", URL_SITE."/interface/session/principal/ftx/recherche_ftx.php");
define("URL_CONSULT_OCC_FTX", URL_SITE."/interface/session/principal/ftx/consulter_occ_ftx.php");
define("URL_CONSULT_OCC_PDF_FTX", URL_SITE."/interface/session/principal/ftx/consulter_occ_pdf_ftx.php");
define("URL_CONSULT_NATIF", URL_SITE."/interface/session/principal/gestionfichier/consulter_fichier.php");

define("URL_PARAM_AFFICHER_RECHERCHE_FTX_LOC", URL_SITE."/interface/session/principal/ftx/afficher_rech_ftx.php?INUMQUEST=%d");
define("URL_AFFICHER_RECHERCHE_FTX_LOC", URL_SITE."/interface/session/principal/ftx/afficher_rech_ftx.php");

# Attente
define("URL_ATTENTE", URL_SITE."/interface/session/principal/attente/attente.php");
define("URL_ATTENTE_RECHERCHE", URL_SITE."/interface/session/principal/attente/attente.php");
# define("URL_ATTENTE_RECHERCHE", URL_SITE."/interface/session/principal/attente/attente_recherche.php");

# Affichage des questions de la bibliothèque
define("URL_AFFICHE_QUEST_BIB", URL_SITE."/interface/session/principal/gestionbiblio/afficher_question_bib.php");
define("URL_PARTAGER_QUEST_BIB", URL_SITE."/interface/session/principal/gestionbiblio/partager_question_bib.php");

# Affichage des profils de liste résumée
define("URL_AFFICHE_GEST_PROFIL_LR", URL_SITE."/interface/session/principal/gestionprofillr/afficher_gestion_profils.php");
define("URL_AFFICHE_MODIF_PROFIL_LR", URL_SITE."/interface/session/principal/gestionprofillr/afficher_modif_profil.php");
define("URL_VALIDE_MODIF_PROFIL_LR", URL_SITE."/interface/session/principal/gestionprofillr/enregistrer_profil.php");
define("URL_AFF_VALEUR_CHAMP_PROFIL_LR", URL_SITE."/interface/session/principal/gestionprofillr/afficher_info_champ_profil.php?SZ_INFO_CHAMP=");

define("URL_VERSION", URL_SITE."/interface/session/principal/version/version.php");

# Gestion des dossiers
define("URL_AFFICHE_GESTION_DOSSIER", URL_SITE."/interface/session/principal/dossier/arborescence_dossier.php");

# Gestion du thésaurus
define("URL_THESAURUS", URL_SITE."/interface/session/principal/thesaurus/afficher_thesaurus.php");
define("URL_THESAURUS_CREATION", URL_SITE."/interface/session/principal/thesaurus/creer_index.php");
define("URL_THESAURUS_DESCRIPTEUR", URL_SITE."/interface/session/principal/thesaurus/get_info_descripteur.php");
define("URL_THESAURUS_DELETE", URL_SITE."/interface/session/principal/thesaurus/supprimer_index.php");
define("URL_THESAURUS_AFF_MODIFICATION", URL_SITE."/interface/session/principal/thesaurus/afficher_modification.php");
define("URL_THESAURUS_AFF_CREATION", URL_SITE."/interface/session/principal/thesaurus/afficher_creation.php");
define("URL_THESAURUS_MODIFICATION", URL_SITE."/interface/session/principal/thesaurus/modifier_index.php");
define("URL_THESAURUS_RECHERCHE", URL_SITE."/interface/session/principal/thesaurus/afficher_recherche.php");

# Gestion des utilisateurs
define("URL_AFFICHE_UTILISATEUR", URL_SITE."/interface/session/principal/gestionutil/consulter_util.php");
define("URL_MODIFIE_UTILISATEUR", URL_SITE."/interface/session/principal/gestionutil/modifier_util.php");
define("URL_AFFICHE_MODIF_UTILISATEUR", URL_SITE."/interface/session/principal/gestionutil/afficher_modif_user.php");
define("URL_SUPPRIME_UTILISATEUR", URL_SITE."/interface/session/principal/gestionutil/afficher_modif_user.php");

# Gestion des profils utilisateurs
define("URL_AFFICHE_PROFIL_UTILISATEUR", URL_SITE."/interface/session/principal/gestionprofilutil/liste_profil_util.php");
define("URL_MODIFIE_PROFIL_UTILISATEUR", URL_SITE."/interface/session/principal/gestionprofilutil/modifier_profil_util.php");

# Gestion des domaines Fermés
define("URL_LIST_RUB_DOMFERME", URL_SITE."/interface/session/principal/gestiondomain/liste_rub_domferme.php");
define("URL_MODIFIE_DOMFERME", URL_SITE."/interface/session/principal/gestiondomain/modifier_val_domferme.php");
define("URL_CONSULTER_RUB_DOMFERME", URL_SITE."/interface/session/principal/gestiondomain/consulter_rub_domferme.php");

# Gestion des listes hiérarchiques
define("URL_LIST_LISTHIER", URL_SITE."/interface/session/principal/gestionlisthier/liste_listhier.php");

# Gestion des profils hiérarchiques
define("URL_AFFICHE_LIST_PROFILHIER", URL_SITE."/interface/session/principal/gestionprofilhier/liste_profilhier.php");

# Gestion des natures
define("URL_LIST_NATURE", URL_SITE."/interface/session/principal/gestionnature/liste_nature.php");
define("URL_MODIFIE_NATURE", URL_SITE."/interface/session/principal/gestionnature/modifier_nature.php");

# Gestion des rubriques
define("URL_LIST_RUBRIQUE", URL_SITE."/interface/session/principal/gestionrubrique/liste_rubrique.php");
define("URL_MODIFIE_RUBRIQUE", URL_SITE."/interface/session/principal/gestionrubrique/modifier_rubrique.php");

# Gestion des types de document
define("URL_LIST_TYPEDOC", URL_SITE."/interface/session/principal/gestiontypedoc/liste_typedoc.php");
define("URL_MODIFIE_TYPEDOC", URL_SITE."/interface/session/principal/gestiontypedoc/modifier_typedoc.php");

# Gestion des fiches d'index paramétrées
define("URL_MODIFIE_FIP", URL_SITE."/interface/session/principal/fip/modifier_fip.php");

# Gestion de l'historique des document consultés
define("URL_AFFICHE_HISTORIQUE", URL_SITE."/interface/session/principal/resultat/rechercher_db.php?TYPE_RECHERCHE=RECHERCHE_HISTORIQUE");

# Gestion de l'historique des question posées
define("URL_AFFICHE_HIST_QUESTION", URL_SITE."/interface/session/principal/recherche/historique.php");

# Gestion des connexions 
define("URL_AFFICHE_CONNEXION", URL_SITE."/interface/session/principal/lposte/lposte.php");

# Gestion des documents en modification
define("URL_AFFICHE_DOC_EN_MODIFICATION", URL_SITE."/interface/session/principal/lposte/lposte_document.php");

# url combiner question
define("URL_COMBINER_QUESTION", URL_SITE."/interface/session/principal/question/combiner_question.php");

# url pour les parametres de combiner question
define("URL_PARAM_COMBINER_QUESTION", URL_SITE."/interface/session/principal/question/aff_param_comb_quest.php");

# Page de de résultats des associations
define("URL_AFFICHE_LIEN_ASSO", URL_SITE."/interface/session/principal/association/afficher_index_lie.php");
define("URL_BOUTON_ASSOCIATION", URL_SITE."/interface/session/principal/association/bouton.php");
define("URL_AFFICHER_INDEX_LIE", URL_SITE."/interface/session/principal/association/afficher_index_lie.php");

# url dossier pere
define("URL_AFFICHER_PERES", URL_SITE."/interface/session/principal/dossier/afficher_dossiers_peres.php");

# url hermes
define("URL_RECHERCHER_ACT_HERMES", URL_SITE."/interface/session/principal/hermes/rech_action_hermes_db.php");
define("URL_LANCER_NACTIONS", URL_SITE."/interface/session/principal/hermes/lancer_nactions.php");

define("URL_LANCER_SRV_IMP", URL_SITE."/interface/session/principal/impression/lancer_srv_imp_db.php");

# notes
define("URL_AJOUTER_NOTE", URL_SITE."/interface/session/principal/note/ajouter_note.php");
define("URL_SUPPRIMER_NOTE", URL_SITE."/interface/session/principal/note/supprimer_note.php");
define("URL_AFFICHER_AJOUTER_NOTE", URL_SITE."/interface/session/principal/note/afficher_ajout_note.php");

# tableau
define("URL_CONSULTER_TABLEAU", URL_SITE."/interface/session/principal/tableau/consulter_db.php");
define("URL_CREER_TABLEAU", URL_SITE."/interface/session/principal/tableau/creer_db.php");
define("URL_AFFICHER_LISTE_TABLEAU", URL_SITE."/interface/session/principal/tableau/liste_doc_rub_tableau.php");
define("URL_MODIFIER_TABLEAU", URL_SITE."/interface/session/principal/tableau/modifier_db.php");
define("URL_JS_TABLEAU", URL_SITE."/include/script/action_tableau.js");

define("URL_TOOLBAR", URL_SITE."/interface/session/principal/toolbar/afficher_toolbar.php");
define("URL_VIDE", URL_SITE."/interface/vide.htm");
define("URL_LANCER_ACTION_HERMES", URL_SITE."/interface/session/principal/consultation/lancer_action_hermes.php");

define("URL_CONNECTER_PROFIL", URL_SITE."/interface/session/principal/connexion/connecter_profil.php");

define("URL_PANIER", URL_SITE."/interface/session/principal/resultat/rechercher_db.php&TYPE_RECHERCHE=RECHERCHE_PANIER");

define("URL_ACCUEIL", URL_SITE."/index.php");

define("URL_CHOIX_TYPE", URL_SITE."/interface/session/principal/type/afficher_type.php");
define("URL_LIST_THESAURUS", URL_SITE."/interface/session/principal/thesaurus/liste_thesaurus_xtree.php");
define("URL_AFFICHER_CHANGER_PWD", URL_SITE."/interface/session/principal/parametrage/afficher_changer_pwd.php");
define("URL_FERMER_APPLICATION", URL_SITE."/interface/session/principal/connexion/close.php");


define("URL_CONSULTER_TOUS_FICHIERS_ZIP", URL_SITE."/interface/session/principal/gestionfichier/consulter_fichier_tous_fichiers_zip.php");
define("URL_LANCER_NACTIONS_HERMES", URL_SITE."/interface/session/principal/hermes/lancer_nactions.php");

define("URL_CONSULTER_MODELE", URL_SITE."/interface/session/principal/gestionmodele/consulter_modele.php");
define("URL_PARAM_SUPP_MODELE", URL_SITE."/interface/session/principal/gestionmodele/supprimer_modele_dav.php?PHPSESSID=%s&POS_NOMFICHIER=%s");
define("URL_SAUVER_MODELE_POSTFICHIER", URL_SITE."/interface/session/principal/gestionmodele/sauver_modele_postfichier.php");

define("REP_TEMPLATE_APPLICATIF", "../../../tpl/applicatif/");
define("URL_VOCAB_AJAX", URL_SITE."/interface/session/principal/vocabulaire/get_vocabulaire.php");

define("URL_AFFICHER_MENU", URL_SITE."/interface/session/principal/menu/afficher_menu.php");
define("URL_METTREAJOURRAFALE", URL_SITE."/interface/session/principal/majrafale/mettre_a_jour_rafale.php");
define("URL_GARDER_EN_REPONSE", URL_SITE."/interface/session/principal/association/garder_en_reponse.php");
define("URL_CHANGER_PROFIL", URL_SITE."/interface/session/principal/connexion/changer_profil.php");
define("URL_AFFICHER_STATS_ADMIN", URL_SITE."/interface/session/principal/statistiques/afficher_statistiques_admin.php");
define("URL_GENERER_STATS_ADMIN", URL_SITE."/interface/session/principal/statistiques/generer_statistiques_admin.php");

define("URL_DECONNECT", URL_SITE."/interface/session/principal/connexion/close_deconnect.php");
}
?>
