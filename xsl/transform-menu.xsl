<?xml version="1.0" encoding="ISO-8859-1"?>
<!DOCTYPE xsl:stylesheet [ <!ENTITY nbsp "&#160;"> ]>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" indent="yes" encoding="ISO-8859-1"/>

<xsl:param name="VAR_1" select="''"/>
<xsl:param name="VAR_2" select="''"/>

<xsl:variable name="espace">
<xsl:text>&#160;</xsl:text>
</xsl:variable>

<xsl:template match="/">
    <xsl:value-of select="$CR"/>
    <xsl:value-of select="$tab"/>
    <ul role="menubar" tabindex='0'>
        <xsl:for-each select="/menu/menu-entete">
            <xsl:value-of select="$CR"/>
            <xsl:value-of select="$tab"/><xsl:value-of select="$tab"/>
            <li role="menuitem" aria-haspopup="true">
                <!-- affichage de l'en-tête : ce qui est visible dans la barre de menu -->
                <xsl:variable name="icone"><xsl:value-of select="icone"/></xsl:variable>
                <xsl:variable name="onclickxml"><xsl:value-of select="onclick"/></xsl:variable>
                <xsl:variable name="onclick">
                    <xsl:if test="not(string-length($onclickxml) = 0)"><xsl:value-of select="$onclickxml"/>;return false;</xsl:if>
                    <xsl:if test="string-length($onclickxml) = 0">return false;</xsl:if>
                </xsl:variable>
                <xsl:value-of select="$CR"/>
                <xsl:value-of select="$tab"/><xsl:value-of select="$tab"/>
                    <a id="entete-{position()}" href="javascript:void(0);" onClick="{$onclick}">
                    <img src="../../../../{$icone}" style="cursor: pointer;"/>
                    <xsl:call-template name="nbsp"/><xsl:call-template name="nbsp"/><span class='libelle-menu-entete'> <xsl:value-of select="libelle"/></span><xsl:call-template name="nbsp"/><xsl:call-template name="nbsp"/>
                </a>
              
                <!-- affichage des sous-menus avec un ou deux niveau -->
                <!-- 1er niveau : titre -->
                <xsl:if test="count(menu-item) != 0">
                    <xsl:value-of select="$CR"/>
                    <xsl:value-of select="$tab"/><xsl:value-of select="$tab"/>
                    <ul role="menu" aria-label="submenu">
                    <xsl:for-each select="menu-item">
                        <xsl:variable name="last-menu-item">
                            <xsl:if test="position()=last()">1</xsl:if>
                        </xsl:variable>
                        <!-- 2 niveaux : titre + sous-item-->
                        <xsl:if test="@type = 'titre'">
                            <xsl:value-of select="$CR"/>
                            <xsl:value-of select="$tab"/><xsl:value-of select="$tab"/><xsl:value-of select="$tab"/>
                            <li role="menuitem" class="menusoustitre">
                                <xsl:value-of select="$CR"/>
                                <xsl:value-of select="$tab"/><xsl:value-of select="$tab"/><xsl:value-of select="$tab"/><xsl:value-of select="$tab"/>
                                <a class="menusoustitre" href="javascript:void(0);" onClick="return false;"><xsl:value-of select="libelle"/></a>
                            <xsl:value-of select="$CR"/>
                            <xsl:value-of select="$tab"/><xsl:value-of select="$tab"/><xsl:value-of select="$tab"/>
                            </li>
                                <xsl:for-each select="menu-item">
                                    <xsl:call-template name="affiche-menu-item"> 
                		                <xsl:with-param name="menu-item" select="."/> 
                		                <xsl:with-param name="niveau">2</xsl:with-param>
                		                <xsl:with-param name="dernierelement">
                                            <xsl:if test="$last-menu-item = 1 and position()=last()">1</xsl:if>
                                        </xsl:with-param>
             		                 </xsl:call-template>
                                </xsl:for-each>
                        </xsl:if>
                        <!-- 1 niveau : sous-item directement sous l'en-tete -->
                        <xsl:if test="not(@type = 'titre')">
                            <xsl:call-template name="affiche-menu-item"> 
    		                  <xsl:with-param name="menu-item" select="."/> 
    		                  <xsl:with-param name="niveau">1</xsl:with-param>
    		                  <xsl:with-param name="dernierelement" select="$last-menu-item" />
    	                     </xsl:call-template>
                    </xsl:if>
                        
                    </xsl:for-each>
                    <xsl:value-of select="$CR"/>
                    <xsl:value-of select="$tab"/><xsl:value-of select="$tab"/>
                    </ul>
                </xsl:if>
                <xsl:value-of select="$CR"/>
                <xsl:value-of select="$tab"/><xsl:value-of select="$tab"/>
                </li>
        </xsl:for-each>
        <xsl:value-of select="$CR"/>
    </ul>
    <xsl:value-of select="$CR"/>
</xsl:template>

<xsl:variable name="CR">
    <xsl:text>
</xsl:text></xsl:variable>
<xsl:variable name="tab">
    <xsl:text>  </xsl:text></xsl:variable>

<xsl:template name="affiche-menu-item">
<xsl:param name="menu-item"/> 
<xsl:param name="niveau"/>
<xsl:param name="dernierelement"/> 
<xsl:variable name="url-sous-menu"><xsl:value-of select="$menu-item/url"/></xsl:variable>
<xsl:variable name="text-dernierelement">
    <xsl:choose>
      <xsl:when test="$dernierelement = '1'">dernierelement</xsl:when>
      <xsl:otherwise></xsl:otherwise>
    </xsl:choose>
</xsl:variable>
<xsl:value-of select="$CR"/>
<xsl:value-of select="$tab"/><xsl:value-of select="$tab"/><xsl:value-of select="$tab"/>
<xsl:if test="$niveau = '2'"><xsl:value-of select="$tab"/></xsl:if>
<li>
    <xsl:value-of select="$CR"/>
    <xsl:value-of select="$tab"/><xsl:value-of select="$tab"/><xsl:value-of select="$tab"/><xsl:value-of select="$tab"/>
    <xsl:choose>
        <xsl:when test="contains($url-sous-menu, 'javascript')">
            <a class="{$text-dernierelement}" href="javascript:void(0);" onClick="{$url-sous-menu};">
            <xsl:call-template name="nbsp"/><xsl:call-template name="nbsp"/><xsl:call-template name="nbsp"/><xsl:value-of select="$menu-item/libelle"/>
            </a>
        </xsl:when>
        <xsl:otherwise>
            <a class="{$text-dernierelement}" href="javascript:void(0);" onClick="javascript:return affichePageToolbar(this, 'lien_1','{$url-sous-menu}');">
            <xsl:call-template name="nbsp"/><xsl:call-template name="nbsp"/><xsl:call-template name="nbsp"/><xsl:value-of select="$menu-item/libelle"/>
            </a>
        </xsl:otherwise>
    </xsl:choose>
<xsl:value-of select="$CR"/>
<xsl:value-of select="$tab"/><xsl:value-of select="$tab"/><xsl:value-of select="$tab"/>
<xsl:if test="$niveau = '2'"><xsl:value-of select="$tab"/></xsl:if>
</li>
</xsl:template>

<xsl:template name="nbsp">
   <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
</xsl:template>
</xsl:stylesheet>
