<?xml version="1.0" encoding="ISO-8859-1"?>
<!-- $Id: poseidon.edition.xsl 36 2007-04-30 15:48:18Z herve $ -->

<xsl:stylesheet
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:pos="http://www.sesin.com/"
  xmlns:xhtml="http://www.w3.org/1999/xhtml"
  xmlns:exsl="http://exslt.org/common"
  version="1.0">

  <!-- Import du stylesheet qui genère l'aperçu -->
  <xsl:import href="poseidon.apercu.xsl"/>


  <xsl:output method="xml" indent="yes" encoding="ISO-8859-1"/>


  <!-- ===================================================================== -->
  <!-- Paramètres du stylesheet -->
  <!-- ===================================================================== -->

  <!-- Nom du modele html, utilise dans le formulaire -->
  <xsl:param name="modele_html" select="'modele.html'"/>

  <!-- ===================================================================== -->
  <!-- Variables -->
  <!-- ===================================================================== -->

  <!-- La liste des champs de texte riche references dans le modèle -->
  <xsl:variable name="liste-texte">
    <xsl:for-each select="//pos:text">
      <xsl:if test="position() != 1">
        <xsl:text>,</xsl:text>
      </xsl:if>
      <xsl:value-of select="@id"/>
    </xsl:for-each>
  </xsl:variable>


  <!-- ===================================================================== -->
  <!-- Templates -->
  <!-- ===================================================================== -->

  <xsl:template match="xhtml:head">
    <xsl:copy>
      <xsl:copy-of select="@*"/>

      <script xmlns="http://www.w3.org/1999/xhtml" language="javascript" type="text/javascript" src="../../../../include/script/tiny_mce/tiny_mce.js">
        <xsl:text> </xsl:text>
      </script>
      <script xmlns="http://www.w3.org/1999/xhtml" type="text/javascript">
        tinyMCE.init({
          mode : "exact",
          theme : "advanced",
          language : "fr",
          elements : "<xsl:value-of select="$liste-texte"/>",
          plugins : "advhr,advimage,advlink,contextmenu,directionality,emotions,iespell,inlinepopups,insertdatetime,fullscreen,layer,noneditable,paste,print,save,searchreplace,table,sesin,spellchecker",
          theme_advanced_buttons1 : "print,separator,undo,redo,separator,cut,copy,pastetext,pasteword,separator,search,replace,separator,charmap,separator,fullscreen,separator,help",
          theme_advanced_buttons2 : "bold,italic,underline,strikethrough,separator,justifyleft,justifycenter,justifyright,justifyfull,separator,forecolor,backcolor",
          theme_advanced_buttons3 : "bullist,numlist,separator,outdent,indent,separator,tablecontrols,separator,separator,image,separator,hr,separator,cleanup,separator,inserttime,pagebreak,spellchecker",
          theme_advanced_layout_manager : "SimpleLayout",
          theme_advanced_toolbar_align : "left",
          theme_advanced_toolbar_location : "top",
          theme_advanced_statusbar_location : "none",
          theme_advanced_path : true,
          theme_advanced_fonts : "Arial=arial,helvetica,sans-serif;Times New Roman=times new roman,serif;Courier New=courier new,courier,monospace",
          apply_source_formatting : true,
          convert_on_click : false,
          entity_encoding : "raw",
          entities : "39,#39,34,quot,38,amp,60,lt,62,gt,338,#338,339,#339",
          paste_auto_cleanup_on_paste : true,
          //paste_replace_list : '\u2122,<sup>TM</sup>,\u2026,...,\u201c|\u201d,",\u2019,\',\u2013|\u2014|\u2015|\u2212,-,\u0153,\u0153,339,#339',
          force_br_newlines : true,
          spellchecker_languages : "+Francais=fr"
        });
      </script>
      <style>
            p {
                margin-bottom: 0;
            }
     </style>
      <script xmlns="http://www.w3.org/1999/xhtml" language="javascript" type="text/javascript" src="../../../../include/script/redaction_web/edition.js">
        <xsl:text> </xsl:text>
      </script>
    </xsl:copy>
  </xsl:template>

  <!-- ===================================================================== -->

  <xsl:template match="xhtml:body">

    <xsl:copy>
      <xsl:copy-of select="@*"/>
      <xsl:attribute name = "onLoad">loadEdition()</xsl:attribute>

      <!-- Affichage des blocs d'en-tête -->
      <xsl:apply-templates select="/xhtml:html/xhtml:head/pos:header" mode="make-header-footer"/>

      <form xmlns="http://www.w3.org/1999/xhtml" name="principal" method="POST">
        <xsl:text>&#xA;</xsl:text>

        <input xmlns="http://www.w3.org/1999/xhtml" type="hidden" name="POS_NUM_DOC">
          <xsl:attribute name="value">
            <xsl:value-of select="$fiche_index/ROOT/INDEX/@NUMINFO"/>
          </xsl:attribute>
        </input>
        <xsl:text>&#xA;</xsl:text>
        <input xmlns="http://www.w3.org/1999/xhtml" type="hidden" name="MODELE_HTML">
          <xsl:attribute name="value">
            <xsl:value-of select="$modele_html"/>
          </xsl:attribute>
        </input>
        <input xmlns="http://www.w3.org/1999/xhtml" type="hidden" name="URL">
        </input>
        <xsl:apply-templates>
        	<xsl:with-param name="index-en-cours" select="exsl:node-set($fiche_index/ROOT/INDEX[@NUMINFO = $default-numinfo])"/>
          <xsl:with-param name="numinfo" select="$default-numinfo"/>
        </xsl:apply-templates>
      </form>

      <!-- Affichage des blocs de pied-de-page -->
      <xsl:apply-templates select="/xhtml:html/xhtml:head/pos:footer" mode="make-header-footer"/>

    </xsl:copy>
  </xsl:template>

  <!-- ===================================================================== -->
  <xsl:template match="xhtml:page_footer">
    <xsl:text>&#xA;</xsl:text>
  </xsl:template>

  <!-- Template pour produire les champs de texte riche editables -->
  <xsl:template match="pos:text">

    <!-- Numero de la fiche d'index concernee -->
    <xsl:param name="numinfo"/>

    <xsl:variable name="id" select="@id"/>
    <xsl:variable name="apercu-width">
        <xsl:choose>
            <xsl:when test="@apercu-width != ''">
                <xsl:value-of select="@apercu-width"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:text>579px;</xsl:text>
           </xsl:otherwise>
          </xsl:choose>
    </xsl:variable>
    <xsl:variable name="apercu-height">
        <xsl:choose>
            <xsl:when test="@apercu-height != ''">
                <xsl:value-of select="@apercu-height"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:text>auto</xsl:text>
           </xsl:otherwise>
          </xsl:choose>
    </xsl:variable>
    <xsl:variable name="edit-rows">
        <xsl:choose>
            <xsl:when test="@edit-rows != ''">
                <xsl:value-of select="@edit-rows"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:text>20</xsl:text>
           </xsl:otherwise>
          </xsl:choose>
    </xsl:variable>
    <xsl:variable name="edit-cols">
        <xsl:choose>
            <xsl:when test="@edit-cols != ''">
                <xsl:value-of select="@edit-cols"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:text>90</xsl:text>
           </xsl:otherwise>
          </xsl:choose>
    </xsl:variable>

    <xsl:variable name="texte_section">
      <xsl:copy-of select="pos:get-rich-text($numinfo, $id)"/>
    </xsl:variable>

    <xsl:text>&#xA;</xsl:text>
    <img xmlns="http://www.w3.org/1999/xhtml">
      <xsl:attribute name="src">../../../../images/redaction_web/edition.gif</xsl:attribute>
      <xsl:attribute name="border">0</xsl:attribute>
      <xsl:attribute name="style">display:none</xsl:attribute>
      <xsl:attribute name="id"><xsl:text>img_</xsl:text><xsl:value-of select="$id"/></xsl:attribute>
      <xsl:attribute name="onClick">javascript:changerVisuEdition(this)</xsl:attribute>
    </img>
    <xsl:text>&#xA;</xsl:text>
    <!-- Affichage du contenu de la section dans le corps de la page HTML -->
    <!-- Si la section est vide, affichage du texte par defaut s'il existe sinon
         de "..." pour ne pas laisser vide l'element div -->
    <div xmlns="http://www.w3.org/1999/xhtml">
      <xsl:attribute name="style">display:block;border:1px outset white;cursor:pointer;font-family:Arial;font-size:10pt;width:<xsl:value-of select="$apercu-width"/>;height:<xsl:value-of select="$apercu-height"/>;</xsl:attribute>
      <xsl:attribute name="id"><xsl:text>visu_</xsl:text><xsl:value-of select="$id"/></xsl:attribute>
      <xsl:attribute name="onClick">javascript:changerVisuEditionDiv(this)</xsl:attribute>

      <xsl:choose>
        <!-- Si la section de texte riche existe... -->
        <xsl:when test="pos:exists-rich-text($numinfo, $id) = 'true'">
          <!-- ...on la copie -->
          <xsl:choose>
	          <xsl:when test="string-length($texte_section) > 2">
          <xsl:copy-of select="$texte_section"/>
	          </xsl:when> 
	          <xsl:otherwise>
	          	 <!-- ...on met des points de suspension -->
	             <xsl:text>...</xsl:text>
	          </xsl:otherwise>
          </xsl:choose>
        </xsl:when>
        <!-- Sinon, si une valeur par defaut est specifiee... -->
        <xsl:when test="string-length(text()) > 0">
          <!-- ...on met la valeur par defaut -->
          <xsl:copy-of select="node()"/>
        </xsl:when>
        <!-- En dernier recours... -->
        <xsl:otherwise>
          <!-- ...on met des points de suspension -->
          <xsl:text>...</xsl:text>
        </xsl:otherwise>
      </xsl:choose>
      <xsl:text> </xsl:text>
    </div>
    <xsl:text>&#xA;</xsl:text>
    <!-- Ecriture de l'objet pour editer le contenu de la section div + textarea type tinyMCE -->
    <!-- Cet objet est masque lors de l'affichage en modifiant l'attribut style.display de la balise div associee. -->
    <div xmlns="http://www.w3.org/1999/xhtml">
      <xsl:attribute name="id"><xsl:text>div_textarea_</xsl:text><xsl:value-of select="$id"/></xsl:attribute>
      <xsl:attribute name="style">display:block</xsl:attribute>
      <xsl:text>&#xA;</xsl:text>
      <textarea xmlns="http://www.w3.org/1999/xhtml">
        <xsl:attribute name="rows"><xsl:value-of select="$edit-rows"/></xsl:attribute>
        <xsl:attribute name="cols"><xsl:value-of select="$edit-cols"/></xsl:attribute>
        <xsl:attribute name="id"><xsl:text>textarea_</xsl:text><xsl:value-of select="$id"/></xsl:attribute>
        <xsl:attribute name="name">
          <xsl:value-of select="$id"/>
        </xsl:attribute>
        <xsl:attribute name="title">
          <xsl:value-of select="@fichier"/>
        </xsl:attribute>

        <xsl:choose>
          <!-- Si la section de texte riche existe... -->
          <xsl:when test="pos:exists-rich-text($numinfo, $id) = 'true'">
            <!-- ...on la copie -->
            <xsl:copy-of select="$texte_section"/>
          </xsl:when>
          <!-- Sinon... -->
          <xsl:otherwise>
            <!-- ...on copie la valeur par defaut (si elle est presente) -->
            <xsl:message><xsl:value-of select="$id"/> : valeur par défaut</xsl:message>
            <xsl:copy-of select="node()"/>
          </xsl:otherwise>
        </xsl:choose>
      </textarea>

      <xsl:text>&#xA;</xsl:text>
    </div>
    <xsl:text>&#xA;</xsl:text>
  </xsl:template>

  <!-- ===================================================================== -->

  <!-- Template pour la production des en-têtes et pieds-de-page dans le mode edition -->
  <xsl:template match="pos:header | pos:footer" mode="make-header-footer">
    <xsl:text>&#xA;</xsl:text>
  </xsl:template>

</xsl:stylesheet>
