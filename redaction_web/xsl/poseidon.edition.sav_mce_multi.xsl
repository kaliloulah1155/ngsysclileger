<?xml version="1.0" encoding="ISO-8859-1"?>
<!-- $Id: poseidon.edition.xsl 36 2007-04-30 15:48:18Z herve $ -->

<xsl:stylesheet
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:pos="http://www.sesin.com/"
  xmlns:xhtml="http://www.w3.org/1999/xhtml"
  version="1.0">

  <!-- Import du stylesheet qui génère l'aperçu -->
  <xsl:import href="poseidon.apercu.xsl"/>


  <xsl:output method="xml" indent="yes" encoding="ISO-8859-1"/>


  <!-- ===================================================================== -->
  <!-- Paramètres du stylesheet -->
  <!-- ===================================================================== -->

  <!-- Nom du modele html, utilisé dans le formulaire -->
  <xsl:param name="modele_html" select="'modele.html'"/>


  <!-- ===================================================================== -->
  <!-- Variables -->
  <!-- ===================================================================== -->

  <!-- La liste des champs de texte riche référencés dans le modèle -->
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

      <script xmlns="http://www.w3.org/1999/xhtml" language="javascript" type="text/javascript" src="tiny_mce/tiny_mce.js">
        <xsl:text> </xsl:text>
      </script>
      <script xmlns="http://www.w3.org/1999/xhtml" type="text/javascript">
        tinyMCE.init({
          mode : "exact",
          theme : "advanced",
          language : "fr",
          elements : "<xsl:value-of select="$liste-texte"/>",
          plugins : "advhr,advimage,advlink,contextmenu,directionality,emotions,iespell,inlinepopups,insertdatetime,fullscreen,layer,noneditable,paste,print,save,searchreplace,table,sesin",
          theme_advanced_buttons1 : "newdocument,print,separator,undo,redo,separator,cut,copy,paste,pastetext,pasteword,separator,search,replace,separator,iespell,charmap,separator,fullscreen,separator,help",
          theme_advanced_buttons2 : "bold,italic,underline,strikethrough,separator,justifyleft,justifycenter,justifyright,justifyfull,separator,formatselect,fontselect,fontsizeselect,separator,forecolor,backcolor",
          theme_advanced_buttons3 : "bullist,numlist,separator,outdent,indent,separator,tablecontrols,separator,separator,image,separator,hr,separator,cleanup,separator,inserttime,pagebreak",
          theme_advanced_layout_manager : "SimpleLayout",
          theme_advanced_toolbar_align : "left",
          theme_advanced_toolbar_location : "top",
          theme_advanced_statusbar_location : "none",
          theme_advanced_path : true,
          theme_advanced_fonts : "Arial=arial,helvetica,sans-serif;Times New Roman=times new roman,serif;Courier New=courier new,courier,monospace",
          apply_source_formatting : true,
          convert_on_click : false,
          entity_encoding : "raw"
        });
      </script>
      <script xmlns="http://www.w3.org/1999/xhtml" language="javascript" type="text/javascript" src="script/edition.js">
        <xsl:text> </xsl:text>
      </script>
    </xsl:copy>
  </xsl:template>

  <!-- ===================================================================== -->

  <!-- On supprime tous les scripts PHP -->
  <xsl:template match="xhtml:script[@type='text/php']">
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
          <xsl:with-param name="numinfo" select="$default-numinfo"/>
        </xsl:apply-templates>
      </form>

      <!-- Affichage des blocs de pied-de-page -->
      <xsl:apply-templates select="/xhtml:html/xhtml:head/pos:footer" mode="make-header-footer"/>

    </xsl:copy>
  </xsl:template>

  <!-- ===================================================================== -->

  <!-- Template pour produire les champs de texte riche éditables -->
  <xsl:template match="pos:text">

    <!-- Numéro de la fiche d'index concernée -->
    <xsl:param name="numinfo"/>

    <xsl:variable name="id" select="@id"/>

    <xsl:variable name="texte_section">
      <xsl:copy-of select="pos:get-rich-text($numinfo, $id)"/>
    </xsl:variable>

    <xsl:text>&#xA;</xsl:text>
    <img xmlns="http://www.w3.org/1999/xhtml">
      <xsl:attribute name="src">images/edition.gif</xsl:attribute>
      <xsl:attribute name="border">0</xsl:attribute>
      <xsl:attribute name="style">display:none</xsl:attribute>
      <xsl:attribute name="id"><xsl:text>img_</xsl:text><xsl:value-of select="$id"/></xsl:attribute>
      <xsl:attribute name="onClick">javascript:changerVisuEdition(this)</xsl:attribute>
    </img>
    <xsl:text>&#xA;</xsl:text>
    <!-- Affichage du contenu de la section dans le corps de la page HTML -->
    <!-- Si la section est vide, affichage du texte par défaut s'il existe sinon
         de "..." pour ne pas laisser vide l'élément div -->
    <div xmlns="http://www.w3.org/1999/xhtml">
      <xsl:attribute name="style">display:block;border:1px outset white;;cursor:pointer;</xsl:attribute>
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
        <!-- Sinon, si une valeur par défaut est spécifiée... -->
        <xsl:when test="string-length(text()) > 0">
          <!-- ...on met la valeur par défaut -->
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
    <!-- Ecriture de l'objet pour éditer le contenu de la section div + textarea type tinyMCE -->
    <!-- Cet objet est masqué lors de l'affichage en modifiant l'attribut style.display de la balise div associée. -->
    <div xmlns="http://www.w3.org/1999/xhtml">
      <xsl:attribute name="id"><xsl:text>div_textarea_</xsl:text><xsl:value-of select="$id"/></xsl:attribute>
      <xsl:attribute name="style">display:block</xsl:attribute>
      <xsl:text>&#xA;</xsl:text>
      <textarea xmlns="http://www.w3.org/1999/xhtml">
        <xsl:attribute name="rows">20</xsl:attribute>
        <xsl:attribute name="cols">90</xsl:attribute>
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
            <!-- ...on copie la valeur par défaut (si elle est présente) -->
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
    <div xmlns="http://www.w3.org/1999/xhtml">

      <!-- Définition du style -->
      <xsl:attribute name="style">
        <xsl:text>width: 100% ; text-align: </xsl:text>
        <xsl:choose>
          <!-- Si on trouve l'attibut @position, on l'utilise pour l'alignement -->
          <xsl:when test="@position = 'center' or @position = 'left' or @position = 'right'">
            <xsl:value-of select="@position"/>
          </xsl:when>
          <!-- Sinon, on aligne au centre et on affiche un message d'avertissement -->
          <xsl:otherwise>
            <xsl:message>
              <xsl:text>WARNING: pos:</xsl:text>
              <xsl:value-of select="local-name()"/>
              <xsl:text>/@position = "</xsl:text>
              <xsl:value-of select="@position"/>
              <xsl:text>"</xsl:text>
            </xsl:message>
            <xsl:text>center</xsl:text>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:attribute>

      <!-- On dessine une ligne avant le bloc si on est dans le premier bloc de
      pied-de-page et si au moins un des blocs de pied-de-page possède un
      attribut @draw-line = 'yes' -->
      <xsl:if test="local-name() = 'footer' and //pos:footer[@draw-line = 'yes'] and not (preceding::pos:footer)">
        <hr xmlns="http://www.w3.org/1999/xhtml"/>
      </xsl:if>

      <!-- On affiche le texte ou l'image -->
      <p xmlns="http://www.w3.org/1999/xhtml">
        <xsl:choose>
          <!-- Si le bloc contient une image... -->
          <xsl:when test="@type = 'image'">
            <img xmlns="http://www.w3.org/1999/xhtml">
              <xsl:attribute name="src">
                <xsl:value-of select="@image-url"/>
              </xsl:attribute>
            </img>
          </xsl:when>
          <!-- Si le bloc contient du texte... -->
          <xsl:when test="@type = 'texte'">
            <xsl:value-of select="text()"/>
          </xsl:when>
          <!-- Sinon, il y a une erreur fatale -->
          <xsl:otherwise>
            <xsl:message terminate="yes">
              <xsl:text>ERROR: pos:</xsl:text>
              <xsl:value-of select="local-name()"/>
              <xsl:text>/@type = "</xsl:text>
              <xsl:value-of select="@type"/>
              <xsl:text>"</xsl:text>
            </xsl:message>
          </xsl:otherwise>
        </xsl:choose>
      </p>

      <!-- On dessine une ligne après le bloc si on est dans le dernier bloc
      d'en-tête et si au moins un des blocs d'en-tête possède un attribut
      @draw-line = 'yes' -->
      <xsl:if test="local-name() = 'header' and //pos:header[@draw-line = 'yes'] and not (following::pos:header)">
        <hr xmlns="http://www.w3.org/1999/xhtml"/>
      </xsl:if>

    </div>

  </xsl:template>

</xsl:stylesheet>
