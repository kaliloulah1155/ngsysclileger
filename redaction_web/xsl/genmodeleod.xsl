<?xml version='1.0' encoding="UTF-8"?>
<xsl:stylesheet
    xmlns:xsl='http://www.w3.org/1999/XSL/Transform'
    xmlns:text='urn:oasis:names:tc:opendocument:xmlns:text:1.0'
    xmlns:office='urn:oasis:names:tc:opendocument:xmlns:office:1.0'
    xmlns:func="http://exslt.org/functions"
    xmlns:dyn="http://exslt.org/dynamic"
    xmlns:exsl="http://exslt.org/common"
    xmlns:str="http://exslt.org/strings"
    xmlns:pos="http://www.sesin.com/"
    xmlns:table="urn:oasis:names:tc:opendocument:xmlns:table:1.0"
	extension-element-prefixes="str func exsl dyn"
    version='1.0'>
    <!--
    Modifications
    001 : version initiale
    002 : gestion des retours chariots dans les rubriques multi-critères
          remplacement par des elements "text:line-break"
          Necessite de remplacer le value-of existant par un copy-of
          Remplacement indent="yes" par "no" sinon espace aleatoire au milieu des mots.
    003 : Modification gestion des tableaux, avant si une section contenait un tableau elle etait consideree comme section tableau. 
          Dans cette version, il faut que la section soit prefixee par "POS_FOR_TAB_"
          Modification gestion des sections : avant, une seule section etait creee par boucle contenant toutes les copies de la boucle
          Dans cette version, une section est creee par iteration toujours prefixee par section-copy
          Modification protection des sections : les sections copiees ne sont plus protegees, elles heritent de la protection de la section copiee.
          Possibilite d'avoir des conditions dans des boucles : les valeurs prefixee par "XREL_" sont remplacees dans la condition 
    004  : 09/04/2020 Gestion des paragraphes contenant des bookmark : permet d'ajouter des valeurs de rubriques avec le remplacement des retours chariot 
          par la balise <text:line-break> ce qui evite le probleme des fins de lignes etendues quand le texte est justifie
    005  : 11/06/2020 Correctif version 004, si la valeur de rubrique vide, le fichier genere puis modifie par l'utilisateur, la bookmark n'etait plus remplacee
            lors de la generation suivante.       
    -->
    <!-- Import d'une fonction pour le traitement des chaines de caractères -->
    <xsl:import href="str.replace.function.xsl"/>
    
    <xsl:output method="xml" indent="no" encoding="UTF-8"/>
    <!-- definition du retour chariot -->
    <xsl:variable name="CR">
    <xsl:text>
</xsl:text></xsl:variable>
    <xsl:variable name="fiche_index" select="document($fichier_fiche_index, /)"/>
    <xsl:variable name="prefix_pos_for" select="POS_FOR_"/>

    <!-- copie a l'identique tous les noeuds sauf ... cf ci-dessous -->
    <!--<xsl:template match="/|@*|node()">-->
    <xsl:template match="/|node()">
    <xsl:param name="index-en-cours"/>
    <xsl:param name="chemin"/>
    <!--<xsl:message>chemin_identitity:<xsl:value-of select="$chemin" /></xsl:message>  -->
    <xsl:copy>
        <xsl:copy-of select="@*"/>
        <xsl:apply-templates>
            <xsl:with-param name="index-en-cours" select="$index-en-cours"/>
            <xsl:with-param name="chemin" select="$chemin"/>
	   </xsl:apply-templates>
    </xsl:copy>
    </xsl:template>

    <!--  ...les déclaration de champs utilisateurs et des variables dont la valeur doit etre remplacee -->
    <xsl:template match="//text:user-field-decl | //text:variable-set">
    
        <!-- le nom du champ utilisateur est une expression xpath dans laquelle les / sont remplaces par ds ___ -->
        <!-- exemple : ROOT___INDEX___AUT -->
        <xsl:variable name="name-att-open-document" select="@text:name"/>
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
                <xsl:copy-of select="@*"/>
                <xsl:apply-templates select="node()"/>
            </xsl:copy>
        </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <!-- Gestion des paragraphes contenant des bookmark : permet d'ajouter des valeurs de rubriques avec le remplacement des retours chariot -->
    <!-- par la balise <text:line-break> ce qui evite le probleme des fins de lignes etendues quand le texte est justifie -->
    <!-- Ce template remonte tout le contenu de la balise text:p qui contient la bookmark. Il serait preferable de ne ramener que le contenu entre -->
    <!-- les balises text:bookmark-start et text:bookmark-end mais le moyen n'a pas ete trouve -->
    <!-- Correction 005 : ajout d'un espace insecable si le contenu de la rubrique est vide -->
    <!-- http://xmlfr.org/documentations/faq/050203-0001 -->
    <xsl:template match="//text:p[./text:bookmark-start[substring(@text:name, 0, 9) = 'POS_BKM_']]/text() | //text:p[./text:bookmark-start[substring(@text:name, 0, 9) = 'POS_BKM_']]/*">
        <!--<xsl:message>Node name::<xsl:value-of select="name()" />-<xsl:value-of select="@text:name" />-<xsl:value-of select="text()" />-<xsl:value-of select="." /></xsl:message>-->
        <xsl:if test="name() = 'text:bookmark-start' or name() = 'text:bookmark-end'">
            <xsl:copy>
              <xsl:copy-of select="@*"/>
              <xsl:apply-templates select="node()"/>
            </xsl:copy>
        </xsl:if>
        <xsl:if test="name() = 'text:bookmark-start'">
            <xsl:variable name="bookmark-name" select="@text:name"/>
            <xsl:variable name="chemin-lie" select="//text:user-field-decl[@text:name = $bookmark-name]/@office:string-value"/>
            <xsl:variable name="xpath-relatif" select="str:replace($chemin-lie, '___', '/' )"/>
            <xsl:variable name="xpath-absolu" select="concat('$fiche_index/', $xpath-relatif)"/>
            <xsl:variable name="content" select="dyn:evaluate($xpath-absolu)"/> 
            <xsl:choose>
              <xsl:when test="$content != ''">
                <xsl:call-template name="str:replace_retour_chariot"> 
          		    <xsl:with-param name="text" select="dyn:evaluate($xpath-absolu)"/> 
                </xsl:call-template>
              </xsl:when>
              <xsl:otherwise>&#x00a0;</xsl:otherwise>
            </xsl:choose>
        </xsl:if>
    </xsl:template>
    <!-- Rattrapage correction 005 : si un fichier a ete genere avec une valeur vide puis modifie, la balise est devenu une balise simple text:bookmark 
        au lieu des 2 balises text:bookmark-start puis text:bookmark-end attendues -->
    <!-- Cela permet de recuperer les fichiers cree en 004 avec des valeurs vides mais devrait pouvoir etre supprime dans une prochaine version -->
    <xsl:template match="//text:bookmark[substring(@text:name, 0, 9) = 'POS_BKM_']">
        <xsl:variable name="bookmark-name" select="@text:name"/>
        <xsl:variable name="chemin-lie" select="//text:user-field-decl[@text:name = $bookmark-name]/@office:string-value"/>
        <xsl:variable name="xpath-relatif" select="str:replace($chemin-lie, '___', '/' )"/>
        <xsl:variable name="xpath-absolu" select="concat('$fiche_index/', $xpath-relatif)"/>
        <xsl:variable name="content" select="dyn:evaluate($xpath-absolu)"/>
        <xsl:element name="text:bookmark-start">
            <xsl:attribute name="text:name"><xsl:value-of select="$bookmark-name"/></xsl:attribute>
        </xsl:element>
        <xsl:choose>
          <xsl:when test="$content != ''">
            <xsl:call-template name="str:replace_retour_chariot"> 
      		    <xsl:with-param name="text" select="dyn:evaluate($xpath-absolu)"/> 
            </xsl:call-template>
          </xsl:when>
          <xsl:otherwise>&#x00a0;</xsl:otherwise>
        </xsl:choose>
        <xsl:element name="text:bookmark-end">
            <xsl:attribute name="text:name"><xsl:value-of select="$bookmark-name"/></xsl:attribute>
        </xsl:element>
    </xsl:template>
    
    <!-- 
        traitement des sections boucles
    -->
    <!-- traitement des sections issues d'une precedente copie-->
    <xsl:template match="//text:section[substring(@text:name, 0, 13) = 'section-copy']">
    <!-- rien à faire : on ne la conserve pas -->
    </xsl:template>
    
    <!-- le modele de boucle -->
    <xsl:template match="//text:section[substring(@text:name, 0, 9) = 'POS_FOR_']">
    
        <xsl:variable name="contenu-section" select="." />
        <xsl:variable name="section-name" select="@text:name"/>
        <xsl:variable name="chemin-lie" select="//text:user-field-decl[@text:name = $section-name]/@office:string-value"/>
        <xsl:variable name="xpath-relatif" select="str:replace($chemin-lie, '___', '/' )"/>
        <xsl:variable name="xpath-absolu" select="concat('$fiche_index/', $xpath-relatif)"/>
        <xsl:variable name="table-entries" select="exsl:node-set(dyn:evaluate($xpath-absolu))"/>
        
        <!-- la section qui sert de modele est recopiee masquee (text:display : none) -->
        <!-- pour pouvoir rejouer le modele -->
        <xsl:copy>
            <xsl:for-each select="@*">
                <xsl:if test="name() != 'text:display'">
                    <xsl:copy-of select="."/>
                </xsl:if>
            </xsl:for-each>
            <xsl:attribute name="text:display">none</xsl:attribute>
            <xsl:apply-templates select="node()" />
        </xsl:copy>
        <xsl:choose>
            <!-- La section est nommee POS_FOR_TAB_etc.., mode gestion des tableaux -->
            <!-- Modification car avant, la bascule en mode tableau se faisait si la section contenait un tableau -->
            <!--<xsl:when test="count(.//table:table) = 0">-->
            <!-- Probleme : les tableaux sont souvent utilise meme pour la mise en forme -->
            <xsl:when test="substring($section-name, 0, 13) = 'POS_FOR_TAB_'">
                <xsl:copy>
                    <!-- copie des attributs sauf name et display -->
                    <xsl:for-each select="@*">
                        <xsl:if test="name() != 'text:display' and name() != 'text:name'">
                            <xsl:copy-of select="."/>
                        </xsl:if>
                    </xsl:for-each>
                    <xsl:attribute name="text:name">section-copy-<xsl:value-of select="$section-name" /></xsl:attribute>
                    <xsl:attribute name="text:display"></xsl:attribute>
                    <xsl:attribute name="text:protected">true</xsl:attribute>
                    <xsl:for-each select=".//table:table">
                        <xsl:call-template name="table">
                            <xsl:with-param name="table-entries" select="$table-entries"/>
                        </xsl:call-template>
                    </xsl:for-each>
                </xsl:copy>
            </xsl:when>
            <xsl:otherwise>
                <xsl:for-each select="$table-entries">
                    <xsl:variable name="position-boucle" select="position()" />
                    <!-- copie de la section modele avec un nom unique section-copy-position() -->
                    <!-- pour pouvoir la supprimer à la prochaine iteration              -->
                    <!-- modification du display (si on vient d'un modele deja genere )        -->
                    <xsl:element name="{name($contenu-section)}">
                        <!-- copie des attributs sauf name et display -->
                        <xsl:for-each select="$contenu-section/@*">
                            <xsl:if test="name() != 'text:display' and name() != 'text:name'">
                                <xsl:attribute name="{name()}"><xsl:value-of select="." /></xsl:attribute>
                            </xsl:if>
                            <xsl:attribute name="text:name">section-copy-<xsl:value-of select="$section-name" /><xsl:value-of select="$position-boucle" /></xsl:attribute>
                            <!-- on ne force plus la protection de la section cree, elle est heritee de la section copiee-->
                            <!--<xsl:attribute name="text:protected"><xsl:value-of select="$protect_section" /></xsl:attribute>-->
                        </xsl:for-each>
                        <xsl:variable name="index-en-cours" select="."/>
                        <xsl:apply-templates select="$contenu-section/child::node()">
                            <xsl:with-param name="index-en-cours" select="$index-en-cours"/>
                            <xsl:with-param name="chemin">BOUCLE</xsl:with-param>
                            <xsl:with-param name="position-boucle"><xsl:value-of select="$position-boucle" /></xsl:with-param>
                        </xsl:apply-templates>
                    </xsl:element>
                </xsl:for-each>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <!-- traitement des tableau dans un boucle -->
    <xsl:template name="table">
        <xsl:param name="table-entries"/>
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:for-each select="./child::node()">
                <!--recherche de la 2ème ligne, la première contient les en-têtes -->
                <xsl:choose>
                <xsl:when test="name() = 'table:table-row' and count(preceding-sibling::table:table-row) &gt; 0">
                    <xsl:variable name="contenu-ligne" select="." />
                     <xsl:for-each select="$table-entries">
                        <xsl:variable name="index-en-cours" select="."/>
                        <xsl:element name="table:table-row">
                        <xsl:apply-templates select="$contenu-ligne/child::node()">
                            <xsl:with-param name="index-en-cours" select="$index-en-cours"/>
                            <xsl:with-param name="chemin">BOUCLE</xsl:with-param>
        				</xsl:apply-templates>
                        </xsl:element>
                    </xsl:for-each>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:copy>
                        <xsl:copy-of select="@*"/>
                        <xsl:apply-templates select="node()"/>
                    </xsl:copy>
                </xsl:otherwise>
                </xsl:choose>
            </xsl:for-each>
        </xsl:copy>
    </xsl:template>
    
    <!-- toutes les sections qui ne sont ni des modeles de boucle, ni des copies -->
    <xsl:template match="//text:section[substring(@text:name, 0, 9) != 'POS_FOR_' and substring(@text:name, 0, 13) != 'section-copy']">
        <xsl:param name="index-en-cours"/>
        <xsl:param name="chemin">default</xsl:param>
        <xsl:param name="position-boucle" />
        <xsl:copy>
            <xsl:for-each select="@*">
                <xsl:if test="name() != 'text:condition' and name() != 'text:name'">
                    <xsl:copy-of select="."/>
                </xsl:if>
            </xsl:for-each>
            <xsl:choose>
                <!-- cas d'une boucle, la section est renomme -->
                <xsl:when test="$chemin = 'BOUCLE'">
                    <xsl:attribute name="text:name"><xsl:value-of select="@text:name" /><xsl:value-of select="$position-boucle" /></xsl:attribute>
                    <xsl:choose>
                    <!-- cas d'une condition XREL, remplacement de la condition -->
                    <xsl:when test="contains(@text:condition, 'XREL_')">
                        <xsl:variable name="coderub">
                            <xsl:value-of select="substring-before(substring-after(@text:condition, 'XREL_'),' ')" />
                        </xsl:variable>
                        <xsl:variable name="valeurrub">"<xsl:copy-of select="pos:get-field-value($index-en-cours, $coderub)"/>"</xsl:variable>
                        <xsl:variable name="var-a-remplacer">
                            <xsl:value-of select="concat('XREL_', $coderub)" />
                        </xsl:variable>
                        <xsl:variable name="new-condition">
                            <xsl:value-of select="str:replace(@text:condition, $var-a-remplacer, $valeurrub)" />
                        </xsl:variable>
                        <!--<xsl:message>coderub::<xsl:value-of select="$coderub" />::<xsl:value-of select="$valeurrub" /></xsl:message>
                        <xsl:message>new-condition::<xsl:value-of select="$new-condition" /></xsl:message>-->
                        <xsl:attribute name="text:condition"><xsl:value-of select="$new-condition" /></xsl:attribute>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:attribute name="text:condition"><xsl:value-of select="@text:condition" /></xsl:attribute>
                    </xsl:otherwise>
                    </xsl:choose>
                </xsl:when>
                <!-- pas dans une boucle, le nom de la section est conservee -->
                <xsl:otherwise>
                    <xsl:attribute name="text:condition"><xsl:value-of select="@text:condition" /></xsl:attribute>
                    <xsl:attribute name="text:name"><xsl:value-of select="@text:name" /></xsl:attribute>
                </xsl:otherwise>
            </xsl:choose>
            <xsl:apply-templates select="./child::node()">
                <xsl:with-param name="index-en-cours" select="$index-en-cours"/>
                <xsl:with-param name="chemin"><xsl:value-of select="$chemin" /></xsl:with-param>
                <xsl:with-param name="position-boucle" select="$position-boucle"/>
    		</xsl:apply-templates>
        </xsl:copy>
    </xsl:template>
    
    <!-- traitement des affichages de champs dans les sections boucles -->
    <!-- NB attention à ne remplacer les valeurs des champs que dans les copies -->
    <!-- Sinon on va vider les section "modeles" et le fichier ne sera pas re-editable -->
    <!--<xsl:template match="text:section[@text:name = 'section-copy']//text:user-field-get[substring(@text:name, 0, 6) = 'XREL_']">-->
    <xsl:template match="text:user-field-get[substring(@text:name, 0, 6) = 'XREL_']">
    
        <!--A faire avec des chemins pour plus de flexibilité   -->
        <xsl:param name="index-en-cours"/>
        <xsl:param name="chemin">default</xsl:param>
        <xsl:choose>
            <xsl:when test="$chemin = 'BOUCLE'">
                <!-->
                <xsl:for-each select="ancestor-or-self::*">
                    <xsl:message>path:<xsl:value-of select="name()" /><xsl:value-of select="@text:name" /></xsl:message>
                </xsl:for-each>
                -->
                <xsl:variable name="coderub" select="str:replace(str:replace(@text:name, 'XREL_', ''), '___', '/' )"/>
                <xsl:copy-of select="pos:get-field-value($index-en-cours, $coderub)"/>
            </xsl:when>
            <xsl:otherwise> 
                <xsl:copy>
                    <xsl:copy-of select="@*"/>
                    <xsl:apply-templates select="node()"/>
                </xsl:copy>
            </xsl:otherwise>
        </xsl:choose>
        
    </xsl:template>

    <func:function name="pos:get-field-value">
        <!-- Index du document -->
        <xsl:param name="index-en-cours"/>
    	<!-- Identifiant de la rubrique -->
        <xsl:param name="coderub"/>    	
        <func:result>
            <xsl:call-template name="str:replace_retour_chariot"> 
    		  <xsl:with-param name="text" select="exsl:node-set($index-en-cours)/node()[local-name() = $coderub]"/> 
    		</xsl:call-template>
        </func:result>
  </func:function>
  
<xsl:template name="str:replace_retour_chariot"> 
<xsl:param name="text"/> 
<xsl:choose> 
  <xsl:when test="contains( $text, $CR)"> 
    <xsl:value-of select="substring-before( $text, $CR)"/>
    <!-- test fermeture puis reouverture de la balise : trop de risques, on ne sait pas ici dans quelle balise on se trouve -->
    <!--<xsl:text disable-output-escaping = "yes">&lt;/text:p&gt;</xsl:text>
    <xsl:text disable-output-escaping = "yes">&lt;text:p&gt;</xsl:text>-->
    <xsl:element name="text:line-break"/>    
   <xsl:call-template name="str:replace_retour_chariot">
      <xsl:with-param name="text" select="substring-after( $text, $CR)"/> 
    </xsl:call-template>
  </xsl:when> 
  <xsl:otherwise> 
    <xsl:value-of select="$text"/>
  </xsl:otherwise> 
</xsl:choose> 
</xsl:template>  
    
</xsl:stylesheet>