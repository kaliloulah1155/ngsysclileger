<?xml version="1.0" encoding="UTF-8"?>
<jnlp spec="1.0+"
    codebase="{URL_SERVEUR_ET_PORT}/{NOM_APPLICATION}/"
    href="{URL_DAV_SESSION}/{JNLP_FILE_NAME}">
    <information>
        <title>Application de modification de fichier</title>
        <vendor>Sesin</vendor>
        <offline-allowed/>
        <homepage href="http://www.sesin.com/" /> 
        <!--<icon href="http://localhost:8083/apollon_11.0.00.002.009-tab/images/grille.gif"/>-->
    </information>
    <resources>
        <!-- Application Resources -->
        <j2se version="1.5+" href="http://java.sun.com/products/autodl/j2se"/>
        <jar href="interface/tpl/applicatif/fichier/posutilposte.jar" main="true" />
        <jar href="interface/tpl/applicatif/fichier/lib/commons-httpclient-2.0.2.jar"/>
        <jar href="interface/tpl/applicatif/fichier/lib/commons-logging.jar"/>
        <jar href="interface/tpl/applicatif/fichier/lib/jdom-1.0.jar"/>
        <jar href="interface/tpl/applicatif/fichier/lib/json_simple.jar"/>
        <jar href="interface/tpl/applicatif/fichier/lib/JSAP-2.1.jar"/>
        <!-- BEGIN INC_JAR_SIGNATURE -->
        <jar href="interface/tpl/applicatif/fichier/lib/poslibsign-0.0.1-SNAPSHOT-with-deps.jar"/>
        <!-- END INC_JAR_SIGNATURE -->
    </resources>
    <security>
        <all-permissions/>
    </security>
    <application-desc name="Application de modification de fichiers"
         main-class="modificationfichier.PosMainModificationFichier" width="200" height="50">
         <argument>--URL_SERVEUR_ET_PORT={URL_SERVEUR_ET_PORT}</argument>
         <argument>--PATHNAME=<![CDATA[{POS_PATHNAME}]]></argument>
         <argument>--PATHSAUVER=<![CDATA[{PATHSAUVER}]]></argument>
         <argument>--PATHANNULER=<![CDATA[{PATHANNULER}]]></argument>
         <argument>--LIBELLE_TITRE_PAGE=<![CDATA[{LIBELLE_TITRE_PAGE}]]></argument>
         <argument>--LIBELLE_MESSAGE_1=<![CDATA[{LIBELLE_MESSAGE_1}]]></argument>
         <argument>--LIBELLE_MESSAGE_2=<![CDATA[{LIBELLE_MESSAGE_2}]]></argument>
         <argument>--POS_NOM_FICHIER_ORIG=<![CDATA[{POS_NOM_FICHIER_ORIG}]]></argument>
         <argument>--ICONE_FICHIER=<![CDATA[{ICONE_FICHIER}]]></argument>
         <argument>--POS_NUM_DOC={POS_NUM_DOC}</argument>
         <argument>--POS_NUM_PAGE={POS_NUM_PAGE}</argument>
         <argument>--POS_NUM_SSPAGE={POS_NUM_SSPAGE}</argument>
         <argument>--PHPSESSID={PHPSESSID}</argument>
         <argument>--COOKIE_SESS_NAME={COOKIE_SESS_NAME}</argument>
         <argument>--DEBUG={DEBUG}</argument>
         <argument>--TYPE_LANCEMENT_APPL={TYPE_LANCEMENT_APPL}</argument>
         <argument>--LOCAL_HTTP_PORT={LOCAL_HTTP_PORT}</argument>
         <argument>--PATHSAUVER_FICHIER_POST={PATHSAUVER_FICHIER_POST}?PHPSESSID={PHPSESSID}</argument>
         <argument>--MODE_SIGNATURE={MODE_SIGNATURE}</argument>
         <argument>--TIMESTAMP_URL={TIMESTAMP_URL}</argument>
         <argument>--PARAM_LIB_SAUVER={PARAM_LIB_SAUVER}</argument>
         <argument>--PARAM_LIB_ANNULER={PARAM_LIB_ANNULER}</argument>
         <argument>--PARAM_LIB_FERMER={PARAM_LIB_FERMER}</argument>
         <argument>--POS_NUM_PAGE_DANS_PDF={POS_NUM_PAGE_DANS_PDF}</argument>
         <argument>--MODE={MODE}</argument>
         <argument>--LANG={LANG}</argument>
         <argument>--PARAM_MSG_SAUV_FERMER_FICHIER={PARAM_MSG_SAUV_FERMER_FICHIER}</argument>
         <argument>--PARAM_MSG_ANN_FERMER_FICHIER={PARAM_MSG_ANN_FERMER_FICHIER}</argument>
         <argument>--PARAM_TITLE_ERREUR_SAUVEGARDE={PARAM_TITLE_ERREUR_SAUVEGARDE}</argument>
         <argument>--PARAM_MSG_FERMER_CROIX={PARAM_MSG_FERMER_CROIX}</argument>
     </application-desc>
     <update check="background"/>
</jnlp>