<?xml version="1.0" encoding="ISO-8859-1"?>
<!-- $Id: poseidon.apercu.xsl 60 2007-05-30 16:22:10Z herve $ -->

<xsl:stylesheet
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xs="http://www.w3.org/2001/XMLSchema"
  xmlns:pos="http://www.sesin.com/"
  xmlns:xhtml="http://www.w3.org/1999/xhtml"
  xmlns:exsl="http://exslt.org/common"
  xmlns:str="http://exslt.org/strings"
  xmlns:date="http://exslt.org/dates-and-times"
  xmlns:func="http://exslt.org/functions"
  extension-element-prefixes="exsl str date func"
  version="1.0">

  <!-- Import d'une fonction pour le traitement des chaines de caracteres -->
  <xsl:import href="str.replace.function.xsl"/>

  <xsl:output method="xml" indent="yes" encoding="ISO-8859-1"/>

  <!-- ===================================================================== -->
  <!-- Parametres du stylesheet -->
  <!-- ===================================================================== -->

  <!-- Nom de l'outil utilise pour produire le fichier PDF. -->
  <!-- Valeur par defaut: 'dompdf' -->
  <xsl:param name="pdf-tool" select="'dompdf'"/>

  <!-- Nom de fichier pour le document XML contenant la fiche d'index -->
  <!-- Valeur par defaut : 'fiche_index.xml' -->
  <xsl:param name="fichier_fiche_index" select="'fiche_index.xml'"/>

  <!-- Nom de fichier pour le document XML contenant les sections de texte riche -->
  <!-- Valeur par defaut : 'document_texte-riche.xml' -->
  <xsl:param name="fichier_texte_riche" select="'document.texte-riche.xml'"/>

  <!-- Repertoire pour les documents XML en entree (fiches d'index et texte riche) -->
  <!-- Valeur par defaut : '' (vide) -->
  <xsl:param name="repertoire_fichiers_xml" select="''"/>

  <!-- Nom du serveur pour l'url des images par exemple -->
  <xsl:param name="server-name" select="''"/>

  <!-- Chemin vers l'url des images -->
  <xsl:param name="chemin_image" select="''"/>
  
  <!-- ===================================================================== -->
  <!-- Elements utilises pour la gestion du format de date -->
  <!-- ===================================================================== -->

  <date:months>
    <date:month>janvier</date:month>
    <date:month>février</date:month>
    <date:month>mars</date:month>
    <date:month>avril</date:month>
    <date:month>mai</date:month>
    <date:month>juin</date:month>
    <date:month>juillet</date:month>
    <date:month>août</date:month>
    <date:month>septembre</date:month>
    <date:month>octobre</date:month>
    <date:month>novembre</date:month>
    <date:month>décembre</date:month>
  </date:months>


  <!-- ===================================================================== -->
  <!-- Variables -->
  <!-- ===================================================================== -->

  <!-- La fiche d'index -->
  <xsl:variable name="fiche_index" select="document($fichier_fiche_index, /)"/>

  <!-- Le document XML contenant les sections de texte riche -->
  <xsl:variable name="texte_riche" select="document($fichier_texte_riche, /)"/>

  <!-- Numero de document par defaut (utilisable uniquement lorsqu'il n'y a
  qu'une seule fiche en entree -->
  <xsl:variable name="default-numinfo" select="$fiche_index/ROOT/INDEX[position() = 1]/@NUMINFO"/>

  <!-- ===================================================================== -->
  <!-- Templates -->
  <!-- ===================================================================== -->

  <xsl:template match="node()">
    <!-- Numero de la fiche d'index concernee -->
    <xsl:param name="index-en-cours"/>
    <xsl:param name="numinfo"/>
	<xsl:param name="group-of-index"/>
	<xsl:param name="group-order-by"/>

    <xsl:copy>
      <xsl:copy-of select="@*"/>
      <!-- gg :19/04/2007 : ajout du text suite pb de remplacement des balises sans contenu -->
      <!-- par des balises "auto-fermees" ex : <b></b> devient <b/> => bug IE sur cette balise (=<b>)-->
      <!-- pose des problemes sur la balise br : on supprime completement -->
      <!-- a  remettre si besoin avec condition != br) -->
      <!-- <xsl:text> </xsl:text>-->
      <xsl:text> </xsl:text>

      <xsl:apply-templates>
        <xsl:with-param name="index-en-cours" select="$index-en-cours"/>
        <xsl:with-param name="numinfo" select="$numinfo"/>
		<xsl:with-param name="group-of-index" select="$group-of-index"/>
		<xsl:with-param name="group-order-by" select="$group-order-by"/>
      </xsl:apply-templates>

    </xsl:copy>

  </xsl:template>

  <!-- ===================================================================== -->

<!--
  <xsl:template match="xhtml:head">
    <xsl:copy>
      <xsl:copy-of select="@*"/>
      <xsl:apply-templates/>
    </xsl:copy>
    <xsl:message>xhtml:head</xsl:message>
  </xsl:template>
-->
  <!-- ===================================================================== -->

  <xsl:template match="xhtml:script[@type='text/php']">
    <xsl:copy>
      <xsl:copy-of select="@*"/>
      <xsl:value-of select="." disable-output-escaping="yes"/>
    </xsl:copy>
  </xsl:template>

  <!-- ===================================================================== -->

  <xsl:template match="/">
    <xsl:copy>
      <xsl:copy-of select="@*"/>
      <xsl:text disable-output-escaping="yes">&lt;!-- &amp;euro; --&gt;&#xA;</xsl:text>
      <xsl:apply-templates>
        <xsl:with-param name="index-en-cours" select="exsl:node-set($fiche_index/ROOT/INDEX[@NUMINFO = $default-numinfo])"/>
        <xsl:with-param name="numinfo" select="$default-numinfo"/>
      </xsl:apply-templates>
    </xsl:copy>
  </xsl:template>

<!-- ===================================================================== -->

  <!-- ===================================================================== -->
    <xsl:template match="pos:tag-field">
    <xsl:param name="index-en-cours"/>
    <xsl:param name="numinfo"/>
    <xsl:variable name="valeur-index">
        <xsl:call-template name="valeur-rubrique">
            <xsl:with-param name="index-en-cours" select="$index-en-cours"/>
	        <xsl:with-param name="numinfo" select="$numinfo"/>
        </xsl:call-template>
    </xsl:variable>
    <xsl:element name="{@tag}">
    <xsl:copy-of select="@*"/>
    <xsl:attribute name="value"><xsl:value-of select="$valeur-index"/></xsl:attribute>
    <xsl:attribute name="label"><xsl:value-of select="$valeur-index"/></xsl:attribute>
    </xsl:element>
    </xsl:template>

  <!-- Template pour les elements de type rubrique -->
  <xsl:template match="pos:field" name="valeur-rubrique">
    <!-- Numero de la fiche d'index concernee -->
    <xsl:param name="index-en-cours"/>
    <xsl:param name="numinfo"/>

    <xsl:variable name="key" select="@key"/>

    <!-- Valeur de la rubrique -->
	<xsl:variable name="valeur-rubrique">
		<xsl:choose>
	    	<!-- Cas boucle for-each et acces a une rubrique du document principal -->
			<xsl:when test="@linked = 'yes'">
			    <xsl:variable name="rubrique-lien" select="@rubrique-lien"/>
    			<xsl:value-of select="pos:get-linked-field-value($index-en-cours, $numinfo, $key, $rubrique-lien)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:choose>
    				<xsl:when test="@linked = 'double'">
    				    <xsl:variable name="rubrique-lien" select="@rubrique-lien"/>
    				    <xsl:variable name="rubrique-liee" select="@rubrique-liee"/>
    				    <xsl:variable name="rubrique-lien-cible" select="@rubrique-lien-cible"/>
    				    <xsl:variable name="rubrique-valeur-cible" select="@rubrique-valeur-cible"/>
    				    <xsl:value-of select="pos:get-double-linked-field-value($index-en-cours, $numinfo, $key, $rubrique-lien, $rubrique-liee, $rubrique-lien-cible, $rubrique-valeur-cible)"/>
    				</xsl:when>
    				<!-- cas "normal" -->
    				<xsl:otherwise>				
        				<xsl:choose>
			    	<!-- Cas boucle for-each et acces a une rubrique du document principal -->
					<xsl:when test="@type-index = 'principal'">
						<xsl:value-of select="pos:get-field-value-index-principal($default-numinfo, $key)"/>
					</xsl:when>
					<!-- cas "normal" -->
					<xsl:otherwise>
						<xsl:value-of select="pos:get-field-value($index-en-cours, $numinfo, $key)"/>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:otherwise>
		</xsl:choose>
			</xsl:otherwise>
		</xsl:choose>

	</xsl:variable>

	  <!-- Formatage de la rubrique -->
	  <xsl:choose>
		<xsl:when test="@format != ''">
			<xsl:if test="@format = 'texte'">
		   		<xsl:call-template name="str:replace_retour_chariot"> 
		   			<xsl:with-param name="text" select="$valeur-rubrique"/> 
		   		</xsl:call-template>
		   	</xsl:if>
            <xsl:if test="@format = 'decimal'">
		   		<xsl:value-of select="pos:decimal-format($valeur-rubrique)"/>
		   	</xsl:if>
		   	<xsl:if test="@format = 'upper'">
		   		<xsl:value-of select="str:toupper($valeur-rubrique)"/>
		   	</xsl:if>
		   	
		   	<xsl:if test="@format = 'date'">
		   		<xsl:variable name="day-in-month" select="substring-before($valeur-rubrique, '/' )"/>
			    <xsl:variable name="month-in-year" select="substring-before( substring-after($valeur-rubrique, '/' ), '/' )"/>
			    <xsl:variable name="year" select="substring-after( substring-after( $valeur-rubrique, '/' ), '/' )"/>
    <xsl:variable name="date1" select="str:replace(@date-format, '%d', $day-in-month)"/>
    <xsl:variable name="date2" select="str:replace($date1, '%m', $month-in-year)"/>
    <xsl:variable name="date3" select="str:replace($date2, '%Y', $year)"/>
    <xsl:variable name="date4" select="str:replace($date3, '%B', string(document('')/*/date:months/date:month[number($month-in-year)]) )"/>
    <xsl:variable name="date5">
      <xsl:choose>
        <xsl:when test="starts-with($day-in-month, '0')">
          <xsl:value-of select="str:replace($date4, '%e', substring-after($day-in-month, '0'))"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="str:replace($date4, '%e', $day-in-month)"/>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
			    <xsl:value-of select="$date5"/>
		   	</xsl:if>
		</xsl:when>

		<!-- pas de format, affichage de la valeur -->
		<xsl:otherwise>
			<xsl:value-of select="$valeur-rubrique"/>
		</xsl:otherwise>
	</xsl:choose>
  </xsl:template>
  

  <xsl:variable name="pos:commentaire-need">
    <![CDATA[
    <!-- NEED %%nb-lignes%% -->
    ]]>
  </xsl:variable>

  <xsl:template name="pos:need">
    <xsl:param name="nb-lignes"/>
    <xsl:text>&#xA;</xsl:text>
    <xsl:text disable-output-escaping="yes">&lt;!-- NEED </xsl:text>
    <xsl:value-of select="$nb-lignes" />
	<xsl:text disable-output-escaping="yes"> --&gt;</xsl:text>
    <xsl:text>&#xA;</xsl:text>
	<!-- <xsl:variable name="commentaire-need1" select="str:replace($pos:commentaire-need, '%%nb-lignes%%', $nb-lignes)"/> -->
   	
  </xsl:template>
  
  <xsl:template match="pos:need">
  <xsl:variable name="nb-lignes" select="@nb-lignes"/>
  <xsl:call-template name="pos:need">
  	<xsl:with-param name="nb-lignes" select="$nb-lignes"/>
  </xsl:call-template>
  </xsl:template>
  
  <xsl:template name="pos:need-tr">
    <xsl:param name="nb-lignes"/>
    <xsl:text disable-output-escaping="yes">&#xA;&lt;!-- BLOCK </xsl:text>
    <xsl:value-of select="$nb-lignes" />
	<xsl:text disable-output-escaping="yes"> --&gt;&#xA;</xsl:text>
  </xsl:template>
  
  <xsl:template match="pos:need-tr">
  <xsl:variable name="nb-lignes" select="@nb-lignes"/>
  <xsl:call-template name="pos:need-tr">
  	<xsl:with-param name="nb-lignes" select="$nb-lignes"/>
  </xsl:call-template>
  </xsl:template>
  
  <xsl:template name="pos:need-tr-all">
    <xsl:text disable-output-escaping="yes">&#xA; &lt;!-- K_BLK_ALL --&gt; &#xA;</xsl:text>
  </xsl:template>
  
  <xsl:template match="pos:need-tr-all">
  <xsl:call-template name="pos:need-tr-all"/>
  </xsl:template>
  
  <!-- ===================================================================== -->

  <!-- Template pour les elements de type TextArea (section de texte riche) -->
  <xsl:template match="pos:text">

    <!-- Numero de la fiche d'index concernee -->
    <xsl:param name="numinfo"/>

    <xsl:choose>
    <!-- pas d'affichage sur l'apercu -->
    <xsl:when test="@visible = 'non'">
	</xsl:when>
	<xsl:otherwise>
    <xsl:call-template name="pos:rich-text-section">
      <xsl:with-param name="id" select="@id"/>
      <xsl:with-param name="numinfo" select="$numinfo"/>
    </xsl:call-template>
	</xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <!-- ===================================================================== -->
  <!-- Template pour les elements de type Table (rubriques tableau) -->
  <xsl:template match="pos:table | pos:fils">

    <!-- Numero de la fiche d'index concernee -->
    <xsl:param name="numinfo"/>

    <xsl:variable name="key" select="@key"/>

    <!-- Le format du tableau (description des colonnes) -->
    <xsl:variable name="table-format" select="."/>

	<!--<xsl:variable name="table-entries" select="$fiche_index/ROOT/INDEX[@NUMINFO = $numinfo]/node()[local-name() = 'LISTE_FILS']"/>-->
	<xsl:variable name="table-entries-tmp">
	    <xsl:if test="local-name() = 'table'">
	    	<xsl:copy-of select="$fiche_index/ROOT/INDEX[@NUMINFO = $numinfo]/node()[local-name() = concat('TABLEAU_', $key)]/*"/>
		</xsl:if>
		<xsl:if test="local-name() = 'fils'">
	    	<xsl:copy-of select="$fiche_index/ROOT/INDEX[@NUMINFO = $numinfo]/node()[local-name() = 'LISTE_FILS']/*"/>
		</xsl:if>
	</xsl:variable>
	<xsl:variable name="table-entries" select="exsl:node-set($table-entries-tmp)"/>

    <!-- Le style des lignes -->
    <xsl:variable name="row-style" select="@row-style"/>

    <xsl:choose>
    	<!-- cas avec regroupement -->
	    <xsl:when test="@group-by-key != ''">
	    	<xsl:variable name="group-by-key" select="string(@group-by-key)"/>
	    	
			<!-- le tri global -->
	    	<xsl:variable name="global-order-by">
    	      <xsl:choose>
		        <xsl:when test="@global-order-by != ''">
		          <xsl:value-of select="@global-order-by"/>
		        </xsl:when>
		        <xsl:otherwise>
		          <xsl:value-of select="$group-by-key"/>
		        </xsl:otherwise>
		      </xsl:choose>
	    	</xsl:variable>
	    	
			<!-- le tri par groupe -->
			<xsl:variable name="group-order-by">
			    <xsl:choose>
		        <xsl:when test="@group-order-by != ''">
		          <xsl:value-of select="@group-order-by"/>
		        </xsl:when>
		        <xsl:otherwise>
		          <xsl:value-of select="$group-by-key"/>
		        </xsl:otherwise>
		      </xsl:choose>
	    	</xsl:variable>
	    	
	    	<xsl:variable name="string-counter"> 
			    <xsl:call-template name="counter">
		          <xsl:with-param name="counter" select="1"/>
		     	</xsl:call-template>
	    	</xsl:variable>
	    	<xsl:value-of select="$string-counter"/>
	    	<!-- Pour chaque groupe -->
	    	<xsl:for-each select="$table-entries/INDEX">
	    		<xsl:sort select="*[name(.)=$global-order-by]" />
	    		<!--<xsl:variable name="current-key-group" select="RUB" />-->
				<xsl:variable name="current-key-group" select="./*[name()=$group-by-key]" />
	    		<!--<xsl:if test="not(preceding-sibling::INDEX[RUB=$current-key-group])">-->
	    		<xsl:if test="not(preceding-sibling::INDEX/*[name()=$group-by-key]=$current-key-group)">
				<!-- Pour chaque entree du tableau... -->
		    		<!-- <xsl:variable name="group-of-index" select="$table-entries/INDEX[RUB = $current-key-group]"/>-->
					<xsl:variable name="group-of-index" select="$table-entries/INDEX/*[name()=$group-by-key and . = $current-key-group]/.."/>
    		     
				 <xsl:apply-templates select="$table-format/child::node()">
	            	<xsl:with-param name="index-en-cours" select="$group-of-index[position() = 1]"/>
					<xsl:with-param name="numinfo" select="1"/>
			        <xsl:with-param name="position" select="1"/>
    		          <xsl:with-param name="group-of-index" select="$group-of-index"/>
	    		          <xsl:with-param name="group-order-by" select="$group-order-by"/>
			      </xsl:apply-templates>
			    </xsl:if>
		      		</xsl:for-each>
	    </xsl:when>
	    <!-- cas sans regroupement -->
	    <xsl:otherwise>
    	</xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template match="pos:ligne">

    <!-- Numero de la fiche d'index concernee -->
    <xsl:param name="index-en-cours"/>
	<xsl:param name="numinfo"/>
    <xsl:param name="position"/>
    <xsl:param name="group-of-index"/>
    <xsl:param name="group-order-by"/>
	  <xsl:variable name="current-dom-node" select="."/>
  	
	  <xsl:for-each select="exsl:node-set($group-of-index)">
	           	  <xsl:sort select="NGP" data-type="number"/>
	              <xsl:variable name="index-en-cours" select="."/>
      <xsl:variable name="this-numinfo" select="@NUMINFO"/>
      <xsl:apply-templates select="exsl:node-set($current-dom-node)/child::node()">
    		          <xsl:with-param name="index-en-cours" select="$index-en-cours"/>
		<xsl:with-param name="numinfo" select="$this-numinfo"/>
        <xsl:with-param name="position" select="position()"/>
      </xsl:apply-templates>
        </xsl:for-each>
  </xsl:template>


	<xsl:template name="counter">
	  <xsl:param name="counter" />
	  <xsl:if test="$counter &lt; 30">
	  <!--><xsl:value-of select="$counter" />-->
	    <xsl:text> </xsl:text>
	    <xsl:call-template name="counter">
	      <xsl:with-param name="counter" select="$counter + 1" />
    		          </xsl:call-template>
    	        		</xsl:if>
  </xsl:template>

  <!-- ===================================================================== -->

  <!-- ===================================================================== -->

  <xsl:template match="pos:header | pos:footer">

	<xsl:param name="index-en-cours"/>
	<xsl:param name="numinfo"/>
    <xsl:variable name="text" select="text()"/>
    <xsl:variable name="header-or-footer" select="string(local-name())"/>

    <xsl:text disable-output-escaping="yes">&lt;!-- </xsl:text>
    <xsl:if test="$header-or-footer='header'">
    	<xsl:text>HEADER </xsl:text> 
    </xsl:if>
    <xsl:if test="$header-or-footer='footer'">
    	<xsl:text>FOOTER </xsl:text> 
    </xsl:if>
	<xsl:value-of select="@align" />
	<xsl:text> "</xsl:text>
	
<!-- 
    <xsl:variable name="context">
      <xsl:copy-of select="child::node()"/>
    </xsl:variable>

    <xsl:apply-templates select="exsl:node-set($context)/child::node()">
       <xsl:with-param name="numinfo" select="$numinfo"/>
       <xsl:with-param name="index-en-cours" select="."/>
    </xsl:apply-templates>
    -->   
    
    <xsl:value-of select="." />
    <xsl:for-each select="./*">
        <xsl:if test="name() = 'pos:field'">
	    	<xsl:variable name="key" select="@key"/>
			<xsl:value-of select="pos:get-field-value($index-en-cours, $numinfo, $key)"/>
    	</xsl:if>
    </xsl:for-each>
  
    
    <xsl:text disable-output-escaping="yes">" --&gt;</xsl:text>
  </xsl:template>

  <!-- ===================================================================== -->
  <xsl:template match="pos:media">

	<xsl:param name="index-en-cours"/>
	<xsl:param name="numinfo"/>
    
    <!-- Format paysage -->
    <xsl:if test="@orientation = 'landscape'">
    	<xsl:text>&#xA;</xsl:text>
    	<xsl:text disable-output-escaping="yes">&lt;!-- </xsl:text>
    	<xsl:text>MEDIA LANDSCAPE ON </xsl:text>
		<xsl:text disable-output-escaping="yes"> --&gt;</xsl:text>
    </xsl:if>
    
    <!-- Taille de la zone d'impression -->
    <xsl:if test="@size != ''">
    	<xsl:text>&#xA;</xsl:text>
    	<xsl:text disable-output-escaping="yes">&lt;!-- </xsl:text>
    	<xsl:text>MEDIA SIZE </xsl:text>
    	<xsl:value-of select="@size"/>
		<xsl:text disable-output-escaping="yes"> --&gt;</xsl:text>
    </xsl:if>
    
    <!-- Marge a gauche en point -->
    <xsl:if test="@margin-left != ''">
    	<xsl:text>&#xA;</xsl:text>
    	<xsl:text disable-output-escaping="yes">&lt;!-- </xsl:text>
    	<xsl:text>MEDIA LEFT </xsl:text>
    	<xsl:value-of select="@margin-left"/>
		<xsl:text disable-output-escaping="yes"> --&gt;</xsl:text>
    </xsl:if>
  </xsl:template>

  <!-- ===================================================================== -->

  <!-- Template pour la creation d'un saut de page via dompdf -->
  <xsl:template name="pos:dompdf-new-page">
    <p xmlns="http://www.w3.org/1999/xhtml" style="page-break-before:always;"/>
  </xsl:template>

  <!-- ===================================================================== -->

  <!-- Template qui produit la section de texte riche d'apres son nom et qui
  pratique les substitutions relatives au mode (apercu ou edition) et en
  fonction de l'outil PDF utilise -->
  <xsl:template name="pos:rich-text-section">

    <!-- Numero de la fiche d'index concernee -->
    <xsl:param name="numinfo"/>

    <!-- id de la section a produire -->
    <xsl:param name="id"/>

    <xsl:variable name="rich-text">
      <xsl:copy-of select="pos:get-rich-text($numinfo, $id)"/>
    </xsl:variable>

    <xsl:apply-templates select="exsl:node-set($rich-text)" mode="rich-text-preview"/>

  </xsl:template>

  <!-- ===================================================================== -->

  <!-- Template pour la copie des elements par defaut en mode rich-text-preview -->
  <xsl:template match="node()" mode="rich-text-preview">
    <xsl:copy>
      <xsl:copy-of select="@*"/>
      <xsl:apply-templates mode="rich-text-preview"/>
    </xsl:copy>
  </xsl:template>

  <!-- ===================================================================== -->
  <!--
  <xsl:template match="xhtml:br" mode="rich-text-preview">
    <div><br/></div>
  </xsl:template>
-->
  <!-- Gestion des saut de page via l'element <hr/> -->
  <xsl:template match="xhtml:hr[@style = 'page-break-before: always']" mode="rich-text-preview">
    <xsl:choose>
      <xsl:when test="$pdf-tool = 'dompdf'">
        <xsl:call-template name="pos:dompdf-new-page"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:copy/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <!-- Template pour la gestion de plusieurs documents en entree -->
  <xsl:template match="pos:for-each-value-field">

    <!-- Numero de la fiche d'index concernee -->
    <xsl:param name="numinfo"/>
    
    <xsl:variable name="key" select="@key"/>
    <xsl:variable name="path-link" select="@path-link"/>
    <xsl:variable name="key-link" select="@key-link"/>
    <xsl:variable name="septmp" select="@separator" />
    
    <xsl:variable name="separator">
      <xsl:choose>
        <xsl:when test="$septmp = 'CR'">
          <xsl:value-of select="$CR" />
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="$septmp" />
        </xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    
    <!-- Sauvegarde du contexte -->
    <xsl:variable name="context">
      <xsl:copy-of select="child::node()"/>
    </xsl:variable>

    <xsl:for-each select="str:split($fiche_index/ROOT/INDEX/node()[local-name() = $key], $separator)">
        <xsl:variable name="key-value" select="."/>
        <xsl:variable name="index-en-cours" select="$fiche_index/ROOT/INDEX/node()[local-name() = $path-link]/INDEX/*[name()=$key-link and . = $key-value]/.."/>
        <!-- ...on applique les templates de maniere recursive -->
        <xsl:apply-templates select="exsl:node-set($context)/child::node()">
          <xsl:with-param name="numinfo" select="1"/>
          <xsl:with-param name="index-en-cours" select="$index-en-cours"/>
          <xsl:with-param name="position" select="position()"/>
        </xsl:apply-templates>
       
    </xsl:for-each>
  </xsl:template>
  <!-- ===================================================================== -->

  <!-- Template pour la gestion de plusieurs documents en entree -->
  <xsl:template match="pos:if">

	<xsl:param name="index-en-cours"/>
	<xsl:param name="numinfo"/>
    <!-- Numero de la fiche d'index concernee -->

    <xsl:variable name="test-rub" select="@test-rub"/>
    <xsl:variable name="test-op" select="@test-op"/>
    <xsl:variable name="test-valeur" select="@test-valeur"/>

    <!-- Sauvegarde du contexte -->
    <xsl:variable name="context">
      <xsl:copy-of select="child::node()"/>
    </xsl:variable>
    
	<xsl:variable name="valeur-rubrique">
	<xsl:choose>
    	<xsl:when test="@test-rub = 'mode-edition'">
	       <xsl:value-of select="$mode_edition"/>
		</xsl:when>
		<xsl:otherwise>
	        <xsl:value-of select="pos:get-field-value($index-en-cours, $numinfo, $test-rub)"/>
			
	       	<xsl:choose>
	    	<!-- Cas boucle for-each et acces a une rubrique du document principal -->
				<xsl:when test="@linked = 'yes'">
			    <xsl:variable name="rubrique-lien" select="@rubrique-lien"/>
	            <xsl:value-of select="pos:get-linked-field-value($index-en-cours, $numinfo, $test-rub, $rubrique-lien)"/>
			</xsl:when>
			<xsl:otherwise>
	            <xsl:value-of select="pos:get-field-value($index-en-cours, $numinfo, $test-rub)"/>
			</xsl:otherwise>
		</xsl:choose>
        </xsl:otherwise>
    </xsl:choose>
	
    </xsl:variable>

    <xsl:if test="($test-op = 'egal' and $valeur-rubrique = $test-valeur) or ($test-op = 'different' and $valeur-rubrique != $test-valeur)">
      <!-- ...on applique les templates de maniere recursive -->
      <xsl:apply-templates select="exsl:node-set($context)/child::node()">
        <xsl:with-param name="numinfo" select="$numinfo"/>
        <xsl:with-param name="index-en-cours" select="$index-en-cours"/>
        <xsl:with-param name="position" select="position()"/>
      </xsl:apply-templates>

    </xsl:if>

  </xsl:template>

  <!-- Template pour la gestion de plusieurs index -->
  <xsl:template match="pos:for-each">

    <!-- Numero de la fiche d'index concernee -->
    <xsl:param name="numinfo"/>

    <xsl:variable name="fils-index" select="@fils-index"/>
    <xsl:variable name="sort" select="@sort"/>
    <xsl:variable name="data-type" select="@data-type"/>
    <xsl:variable name="affichage" select="@affichage"/>

    <!-- Sauvegarde du contexte -->
    <xsl:variable name="context">
      <xsl:copy-of select="child::node()"/>
    </xsl:variable>
<xsl:if test="($affichage != 'apercu-only') or ($mode_edition != 'yes')">
    <!-- Pour chaque numero de fiche d'index en entree... -->
    <xsl:for-each select="$fiche_index/ROOT/INDEX/node()[local-name() = $fils-index]/INDEX">
      <xsl:sort select="*[name()=$sort]" case-order = "lower-first" data-type="number" />
      <xsl:variable name="this-numinfo" select="@NUMINFO"/>

      <!-- ...on applique les templates de maniere recursive -->
      <xsl:apply-templates select="exsl:node-set($context)/child::node()">
        <xsl:with-param name="numinfo" select="$this-numinfo"/>
        <xsl:with-param name="index-en-cours" select="."/>
        <xsl:with-param name="position" select="position()"/>
      </xsl:apply-templates>

    </xsl:for-each>
    </xsl:if>

  </xsl:template>

  <xsl:template match="pos:for-each-depends-pos">
    <xsl:param name="numinfo"/>
    <xsl:param name="index-en-cours"/>
    <xsl:param name="position"/>
    
    <xsl:variable name="is-condition-verified">
      <xsl:if test="@operator = 'different'">
	    <xsl:if test="@position  != $position">
	      <xsl:value-of select="1"/>
	    </xsl:if>
	  </xsl:if>
	  <xsl:if test="@operator = 'egal'">
	    <xsl:if test="@position  = $position">
	      <xsl:value-of select="1"/>
	    </xsl:if>
	  </xsl:if>
    </xsl:variable>
    
    <xsl:if test="$is-condition-verified = '1'">
        <!-- Sauvegarde du contexte -->
        <xsl:variable name="context">
          <xsl:copy-of select="child::node()"/>
        </xsl:variable>
        <!-- ...on applique les templates de maniere recursive -->
        <xsl:apply-templates select="exsl:node-set($context)/child::node()">
            <xsl:with-param name="numinfo" select="$numinfo"/>
            <xsl:with-param name="index-en-cours" select="$index-en-cours"/>
            <xsl:with-param name="position" select="$position"/>
        </xsl:apply-templates>
    </xsl:if>
  </xsl:template>

  <xsl:template match="pos:for-each-root-index">

    <!-- Numero de la fiche d'index concernee -->
    <xsl:param name="numinfo"/>

    <!-- Sauvegarde du contexte -->
    <xsl:variable name="context">
      <xsl:copy-of select="child::node()"/>
    </xsl:variable>
      
    <!-- Pour chaque numero de fiche d'index en entree... -->
    <xsl:for-each select="$fiche_index/ROOT/INDEX">

      <xsl:variable name="this-numinfo" select="@NUMINFO"/>

      <!-- ...on applique les templates de maniere recursive -->
      <xsl:apply-templates select="exsl:node-set($context)/child::node()">
        <xsl:with-param name="numinfo" select="$this-numinfo"/>
        <xsl:with-param name="index-en-cours" select="."/>
      </xsl:apply-templates>

    </xsl:for-each>

  </xsl:template>

  
  <!-- Template pour les affichage generaux  -->
  <xsl:template match="pos:general">
    <xsl:choose>
	   <xsl:when test="@key = 'server-name'">
        <xsl:value-of select="$server-name"/>
       </xsl:when>
		<xsl:otherwise>
		</xsl:otherwise>
	</xsl:choose>
  </xsl:template>
  
  <xsl:template match="pos:image">
    <img xmlns="http://www.w3.org/1999/xhtml">
      <xsl:attribute name="src">http://<xsl:value-of select="$server-name"/><xsl:value-of select="@chemin"/></xsl:attribute>
      <xsl:attribute name="border"><xsl:value-of select="@border"/></xsl:attribute>
    </img>
  </xsl:template>
  

  <!-- ===================================================================== -->
  <!-- Fonctions -->
  <!-- ===================================================================== -->

  <!-- Recupere la valeur d'une rubrique dans l'export XML des fiches d'index -->
  <func:function name="pos:get-field-value">

    <!-- Index du document -->
    <xsl:param name="index-en-cours"/>
    
	<xsl:param name="numinfo"/>
	<!-- Identifiant de la rubrique -->
    <xsl:param name="key"/>
	
    <func:result>
      <xsl:copy-of select="$index-en-cours/node()[local-name() = $key]"/>
    </func:result>

  </func:function>
  
  <!-- Recupere la valeur d'une rubrique dans l'export XML des fiches d'index -->
  <func:function name="pos:get-field-value-index-principal">

    <!-- Numero de document -->
    <xsl:param name="numinfo"/>
    <!-- Identifiant de la rubrique -->
    <xsl:param name="key"/>

    <func:result>
      <xsl:copy-of select="$fiche_index/ROOT/INDEX[@NUMINFO = $numinfo]/node()[local-name() = $key]"/>
    </func:result>

  </func:function>
  <!-- ===================================================================== -->
  
  <!-- Recupere la valeur d'une rubrique liee dans l'export XML des fiches d'index -->
  <func:function name="pos:get-linked-field-value">

    <!-- Index du document -->
    <xsl:param name="index-en-cours"/>
    
    <!-- Numero de document -->
    <xsl:param name="numinfo"/>

    <!-- Identifiant de la rubrique -->
    <xsl:param name="key"/>

	<xsl:param name="rubrique-lien"/>
	<func:result>
      <xsl:copy-of select="$index-en-cours/node()[local-name() = concat('RUB_LIEE_', $rubrique-lien)]/INDEX/node()[local-name() = $key]"/>
    </func:result>

  </func:function>
  <!-- ===================================================================== -->

  <!-- Recupere la valeur d'une rubrique liee dans l'export XML des fiches d'index -->
  <func:function name="pos:get-double-linked-field-value">

    <!-- Index du document -->
    <xsl:param name="index-en-cours"/>
    
    <!-- Numero de document -->
    <xsl:param name="numinfo"/>

    <!-- Identifiant de la rubrique -->
    <xsl:param name="key"/>
    <xsl:param name="rubrique-lien"/>
    
	<xsl:param name="rubrique-liee"/>
	<xsl:param name="rubrique-lien-cible"/>
	<xsl:param name="rubrique-valeur-cible"/>
	<xsl:variable  name="valeur-rubrique">
	   <xsl:value-of select="$index-en-cours/node()[local-name() = concat('RUB_LIEE_', $rubrique-lien)]/INDEX/node()[local-name() = $key]"/>
	</xsl:variable>
	
	
    <func:result>
        <xsl:copy-of select="$index-en-cours/node()[local-name() = concat('RUB_LIEE_', $rubrique-liee)]/*/*[name()=$rubrique-lien-cible and . = $valeur-rubrique]/../*[name()= $rubrique-valeur-cible]"/>
    </func:result>

  </func:function>
  <!-- ===================================================================== -->
  
  <!-- Recupere une section de texte riche depuis un fichier -->
  <func:function name="pos:get-rich-text">

    <!-- Numero de document -->
    <xsl:param name="numinfo"/>

    <!-- Identifiant de la section de texte riche dans le fichier -->
    <xsl:param name="id"/>

    <func:result>
      <xsl:copy-of select="document(pos:get-rich-text-filename($numinfo))/document/xhtml:section[@id = $id]/child::node()"/>
    </func:result>

  </func:function>

  <!-- ===================================================================== -->

  <!-- Teste si une section de texte riche existe dans un fichier -->
  <func:function name="pos:exists-rich-text">

    <!-- Numero de document -->
    <xsl:param name="numinfo"/>

    <!-- Identifiant de la section de texte riche dans le fichier -->
    <xsl:param name="id"/>

    <func:result>
      <xsl:choose>
        <xsl:when test="document(pos:get-rich-text-filename($numinfo))/document/xhtml:section[@id = $id]">
          <xsl:text>true</xsl:text>
        </xsl:when>
        <xsl:otherwise>
          <xsl:text>false</xsl:text>
        </xsl:otherwise>
      </xsl:choose>
    </func:result>

  </func:function>

  <!-- ===================================================================== -->

  <!-- Determine le chemin du fichier contenant les sections de texte riche -->
  <func:function name="pos:get-rich-text-filename">

    <!-- Numero de document -->
    <xsl:param name="numinfo"/>

    <xsl:variable name="rich-text-filename">
      <xsl:choose>
        <xsl:when test="count ($fiche_index/ROOT/INDEX) &gt; 1">
          <xsl:value-of select="concat( $numinfo, '.xml' )"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="$fichier_texte_riche"/>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:variable>

    <func:result>
      <!-- Si un repertoire a ete specifie pour les fichiers XML... -->
      <xsl:if test="$repertoire_fichiers_xml != ''">
        <!-- ...on ajoute le chemin avant le nom du fichier -->
        <xsl:value-of select="$repertoire_fichiers_xml"/>

        <!-- Si le chemin ne finit pas par '/'... -->
        <xsl:if test="substring ($repertoire_fichiers_xml, string-length($repertoire_fichiers_xml)) != '/'">
          <!-- ...on ajoute '/' -->
          <xsl:text>/</xsl:text>
        </xsl:if>
      </xsl:if>

      <!-- On ajoute le nom du fichier -->
      <xsl:value-of select="$rich-text-filename"/>
    </func:result>

  </func:function>
  
  <xsl:decimal-format name="euro" decimal-separator="," grouping-separator="."/>
  <func:function name="pos:decimal-format">
    <xsl:param name="number-value" select="''" />
    <func:result>
        <xsl:value-of select="format-number($number-value, '#,00', 'euro')"/>
    </func:result>
  </func:function>
  
</xsl:stylesheet>
