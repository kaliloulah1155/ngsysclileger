<?xml version='1.0' encoding="UTF-8"?>
<xsl:stylesheet
    xmlns:xsl='http://www.w3.org/1999/XSL/Transform'
    xmlns:text='urn:oasis:names:tc:opendocument:xmlns:text:1.0'
    xmlns:office='urn:oasis:names:tc:opendocument:xmlns:office:1.0'
    xmlns:func="http://exslt.org/functions"
    xmlns:dyn="http://exslt.org/dynamic"
    xmlns:exsl="http://exslt.org/common"
    xmlns:str="http://exslt.org/strings"
	extension-element-prefixes="str func exsl dyn"
    version='1.0'>
    
    <xsl:output method="xml" indent="yes" encoding="UTF-8"/>
    
    <xsl:param name="fichier_document_rapport" select="'document_rapport_hyperlink.xml'"/>
    <!-- le nom du fichier xml contenant le rapport -->
    <!-- est remplace a l'appel par le nom correct -->
    <xsl:variable name="document_rapport" select="document($fichier_document_rapport, /)"/>
    <xsl:variable name="fiche_index" select="document($fichier_fiche_index, /)"/>
    
    <xsl:variable name="CR">
    <xsl:text>
</xsl:text></xsl:variable>
<!--<xsl:variable name="CR"></xsl:variable>-->

  <!-- copie a l'identique tous les noeuds sauf ... cf ci-dessous -->
  <xsl:template match="/|@*|node()">
    <xsl:copy>
      <xsl:apply-templates select="@*|node()"/>
    </xsl:copy>
  </xsl:template>

    <!--  ...les champs utilisteurs dont la valeur doit etre remplacee -->
    <xsl:template match="//text:user-field-decl">
        
        <!-- le nom du champ utilisateur est une expression xpath dans laquelle les / sont remplaces par ds ___ -->
        <!-- exemple : ROOT___INDEX___AUT -->
        <xsl:variable name="name-att-open-document" select="@text:name"/>
        <xsl:variable name="test" select="substring($name-att-open-document, 0, 8)"/>
        <!--<xsl:message>test:<xsl:value-of select="$test" /></xsl:message>-->
        
        <xsl:choose>
        <!-- pourquoi 8 ? -->
        <xsl:when test="substring($name-att-open-document, 0, 8) = 'ROOT___'">
            <xsl:copy>
                <!-- copie du noeud -->
                <xsl:copy-of select="./*"/>
                
                <!-- copie des attributs mais il faut remplacer l'attribut string-value qui contient la valeur du champ  -->
                <xsl:for-each select="@*">
                  
                  <!-- creation de l'attribut  -->
                  <xsl:attribute name="{name()}">
                  
                  <xsl:choose>
                  <xsl:when test="local-name() = 'string-value'">
                    <!-- remplacement des 3 underscore "___" par un slash pour obtenir un chemin relatif xpath -->
                    <xsl:variable name="xpath-relatif" select="str:replace($name-att-open-document, '___', '/')"/>
                    <xsl:variable name="xpath-absolu" select="concat('$fiche_index/', $xpath-relatif)"/>
                    <!--<xsl:message>user-field-get-chemin:<xsl:value-of select="$xpath-absolu" /></xsl:message>-->
    
                    <xsl:value-of select="str:replace(dyn:evaluate($xpath-absolu), $CR, '&#x0a;')" />
                  </xsl:when>
                  <xsl:otherwise>
                      <xsl:value-of select="." />
                  </xsl:otherwise>
                  </xsl:choose>
                  </xsl:attribute>
                </xsl:for-each>
            </xsl:copy>
        </xsl:when>
        <xsl:otherwise>
            <xsl:copy>
              <xsl:apply-templates select="@*|node()"/>
            </xsl:copy>
        </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    

  <func:function name="str:replace">
	<xsl:param name="string" select="''" />
   <xsl:param name="search" select="/.." />
   <xsl:param name="replace" select="/.." />
   <xsl:choose>
      <xsl:when test="not($string)">
        <func:result select="/.." />
      </xsl:when>
      <xsl:when test="function-available('exsl:node-set')">
         <!-- this converts the search and replace arguments to node sets
              if they are one of the other XPath types -->
         <xsl:variable name="search-nodes-rtf">
           <xsl:copy-of select="$search" />
         </xsl:variable>
         <xsl:variable name="replace-nodes-rtf">
           <xsl:copy-of select="$replace" />
         </xsl:variable>
         <xsl:variable name="replacements-rtf">
            <xsl:for-each select="exsl:node-set($search-nodes-rtf)/node()">
               <xsl:variable name="pos" select="position()" />
               <replace search="{.}">
                  <xsl:copy-of select="exsl:node-set($replace-nodes-rtf)/node()[$pos]" />
               </replace>
            </xsl:for-each>
         </xsl:variable>
         <xsl:variable name="sorted-replacements-rtf">
            <xsl:for-each select="exsl:node-set($replacements-rtf)/replace">
               <xsl:sort select="string-length(@search)" data-type="number" order="descending" />
               <xsl:copy-of select="." />
            </xsl:for-each>
         </xsl:variable>
         <xsl:variable name="result">
           <xsl:choose>
              <xsl:when test="not($search)">
                <xsl:value-of select="$string" />
              </xsl:when>
             <xsl:otherwise>
               <xsl:call-template name="str:_replace">
                  <xsl:with-param name="string" select="$string" />
                  <xsl:with-param name="replacements" select="exsl:node-set($sorted-replacements-rtf)/replace" />
               </xsl:call-template>
             </xsl:otherwise>
           </xsl:choose>
         </xsl:variable>
         <func:result select="exsl:node-set($result)/node()" />
      </xsl:when>
      <xsl:otherwise>
         <xsl:message terminate="yes">
            ERROR: function implementation of str:replace() relies on exsl:node-set().
         </xsl:message>
      </xsl:otherwise>
   </xsl:choose>
</func:function>
<xsl:template name="str:_replace">
  <xsl:param name="string" select="''" />
  <xsl:param name="replacements" select="/.." />
  <xsl:choose>
    <xsl:when test="not($string)" />
    <xsl:when test="not($replacements)">
      <xsl:value-of select="$string" />
    </xsl:when>
    <xsl:otherwise>
      <xsl:variable name="replacement" select="$replacements[1]" />
      <xsl:variable name="search" select="$replacement/@search" />
      <xsl:choose>
        <xsl:when test="not(string($search))">
          <xsl:value-of select="substring($string, 1, 1)" />
          <xsl:copy-of select="$replacement/node()" />
          <xsl:call-template name="str:_replace">
            <xsl:with-param name="string" select="substring($string, 2)" />
            <xsl:with-param name="replacements" select="$replacements" />
          </xsl:call-template>
        </xsl:when>
        <xsl:when test="contains($string, $search)">
          <xsl:call-template name="str:_replace">
            <xsl:with-param name="string" select="substring-before($string, $search)" />
            <xsl:with-param name="replacements" select="$replacements[position() > 1]" />
          </xsl:call-template>      
          <xsl:copy-of select="$replacement/node()" />
          <xsl:call-template name="str:_replace">
            <xsl:with-param name="string" select="substring-after($string, $search)" />
            <xsl:with-param name="replacements" select="$replacements" />
          </xsl:call-template>
        </xsl:when>
        <xsl:otherwise>
          <xsl:call-template name="str:_replace">
            <xsl:with-param name="string" select="$string" />
            <xsl:with-param name="replacements" select="$replacements[position() > 1]" />
          </xsl:call-template>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

    
</xsl:stylesheet>
