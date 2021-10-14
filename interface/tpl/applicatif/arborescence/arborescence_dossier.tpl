[
<!-- BEGIN PLAN_CLASSEMENT -->
<!-- BEGIN LIGNE_PLAN_CLASSEMENT_OUVERT -->
    {"text" : "{TITRE_PLAN_CLASSEMENT}", "type" : "QuestBib", "state" : {"opened": true}, "data" : { "action" : "QuestBib", "TitreQuestion": "{TITRE_QUESTION}", "publique" : "1"}, "children" : [
    <!-- BEGIN PLAN_CLASSEMENT_LISTE_DOSSIER -->
    {"text" : "{TITRE_DOSSIER}", "type" : "Folder", "data" : { "action" : "Folder", "numdos" : "{POS_NUM_DOS}"}, "children" : true},
    <!-- END PLAN_CLASSEMENT_LISTE_DOSSIER -->
    ]},
<!-- END LIGNE_PLAN_CLASSEMENT_OUVERT -->
<!-- BEGIN LIGNE_PLAN_CLASSEMENT_FERME -->
{"text" : "{TITRE_PLAN_CLASSEMENT}", "type" : "QuestBib", "data" : { "action" : "QuestBib", "TitreQuestion": "{TITRE_QUESTION}", "publique" : "1"}, "children" : false},
<!-- END LIGNE_PLAN_CLASSEMENT_FERME -->
<!-- END PLAN_CLASSEMENT -->

<!-- BEGIN DOSSIER_BAL -->
{"text" : "{CST_LIBELLE_DOSS_BAL}", "type" : "BalGenerale", "data" : { "action" : "BalGenerale"}, "state": {"opened": "TRUE"}, "children" : [
<!-- BEGIN BAL_OU_GROUPE -->
{"text" : "<span class=\'groupbal\'>{POS_BAL_TITRE_GROUPE}</span>", "type" : "DossierBal", "data" : { "action" : "GroupBal"}, 
                                        "state": {"opened": "TRUE"}, "children" : [
<!-- BEGIN BAL_IN_GROUP -->
{"text" : "(...) <span style=\'{STYLE_BAL}\'>{TITRE_DOSSIER}</span>", "type" : "{ICONE_GROUPE}", 
                                        "data" : { "action" : "Bal", "CodeBal": "{TITRE_DOSSIER_SSQUOTE_NOENT}", "LibelleBal": "{TITRE_DOSSIER}", "publique" : "1"}, "children" : false},
<!-- END BAL_IN_GROUP -->
]},
<!-- END BAL_OU_GROUPE -->
<!-- BEGIN BAL -->
{"text" : "(...) <span style=\'{STYLE_BAL}\'>{TITRE_DOSSIER}</span>", "type" : "{ICONE_GROUPE}", "data" : 
                            { "action" : "Bal", "CodeBal": "{TITRE_DOSSIER_SSQUOTE_NOENT}", "LibelleBal": "{TITRE_DOSSIER}", "publique" : "1"}, "children" : false},
<!-- END BAL -->
]},
<!-- END DOSSIER_BAL -->

{"text" : "{CST_LIBELLE_DOSS_BIBLIOTHEQUE}", "type" : "Bibliotheque", "data" : { "action" : "Bibliotheque"}, "children" : [
    {"text" : "{CST_LIBELLE_DOSS_BIBLIOTHEQUE_PUB}", "type" : "Bibliotheque_PUB", "data" : { "action" : "Bibliotheque_PUB"}, "children" : [
    <!-- BEGIN BIBLIO_PUB -->
    {"text" : "{TITRE_DOSSIER}", "type" : "QuestBib", "data" : { "action" : "QuestBib", "TitreQuestion": "{TITRE_DOSSIER_SSQUOTE_NOENT}", "publique" : "1"}, "children" : false},
    <!-- END BIBLIO_PUB -->
    ]},
    {"text" : "{CST_LIBELLE_DOSS_BIBLIOTHEQUE_PRIV}", "type" : "Bibliotheque_PRIV", "data" : { "action" : "Bibliotheque_PRIV"}, "children" : [
    <!-- BEGIN BIBLIO_PRIV -->
    {"text" : "{TITRE_DOSSIER}", "type" : "QuestBib", "data" : { "action" : "QuestBib", "TitreQuestion": "{TITRE_DOSSIER_SSQUOTE_NOENT}", "publique" : "0"}, "children" : false},
    <!-- END BIBLIO_PRIV -->
    ]}
]},
{"text" : "{CST_LIBELLE_DOSS_QUESTION}", "type" : "Question", "data" : { "action" : "Question"}, "children" : false},
{"text" : "{CST_LIBELLE_DOSS_HISTORIQUE}", "type" : "Question", "data" : { "action" : "RechHIS"}, "children" : false}
];