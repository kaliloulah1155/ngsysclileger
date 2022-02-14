<?xml version="1.0" encoding="UTF-8"?>
<jnlp spec="1.0+"
    codebase="{URL_SERVEUR_ET_PORT}/{NOM_APPLICATION}/"
    href="{URL_DAV_SESSION}/{JNLP_FILE_NAME}">
    <information>
        <title>Application de numérisation</title>
        <vendor>Sesin</vendor>
        <offline-allowed/>
        <homepage href="http://www.sesin.com/" /> 
        <icon href="http://localhost:8083/apollon_11.0.00.002.009-tab/images/grille.gif"/>
    </information>
    <resources>
        <!-- Application Resources -->
        <!--<j2se version="1.5+" java-vm-args="-d32" href="http://java.sun.com/products/autodl/j2se"/>-->
        <j2se version="1.5+" href="http://java.sun.com/products/autodl/j2se"/>
        <jar href="interface/tpl/applicatif/fichier/posutilposte.jar" main="true" />
        <jar href="interface/tpl/applicatif/fichier/lib/JSAP-2.1.jar"/>
        <jar href="interface/tpl/applicatif/fichier/lib/json_simple.jar"/>
    </resources>
    <security>
        <all-permissions/>
    </security>
    <application-desc name="Application de numérisation"
         main-class="numerisation.PosMainTwain" width="200" height="50">
         <argument>--URL_SERVEUR_ET_PORT={URL_SERVEUR_ET_PORT}</argument>
         <argument>--PATH_URLSAUVER=<![CDATA[{PATH_URLSAUVER}]]></argument>
         <argument>--POS_NUM_DOC={POS_NUM_DOC}</argument>
         <argument>--POS_NUM_PAGE={POS_NUM_PAGE}</argument>
         <argument>--POS_NUM_SSPAGE={POS_NUM_SSPAGE}</argument>
         <argument>--TYPE_PJ={TYPE_PJ}</argument>
         <argument>--BGCOLOR={BGCOLOR}</argument>
         <argument>--XRESOLUTION=200</argument>
         <argument>--YRESOLUTION=200</argument>
         <argument>--PHPSESSID={PHPSESSID}</argument>
         <argument>--COOKIE_SESS_NAME={COOKIE_SESS_NAME}</argument>
         <argument>--DEBUG={DEBUG}</argument>
         <argument>--TYPE_LANCEMENT_APPL={TYPE_LANCEMENT_APPL}</argument>
         <argument>--LOCAL_HTTP_PORT={LOCAL_HTTP_PORT}</argument>
        <argument>--PATH_DOWNLOAD_URL_DLL={PATH_URL_DOWNLOAD_DLL_NUM_JAR}</argument>
         <argument>--SCANNERS_CHOCOLATE=FUJITSU fi-6110dj</argument>
     </application-desc>
     <update check="background"/>
</jnlp>