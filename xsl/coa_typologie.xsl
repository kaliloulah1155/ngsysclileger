<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html"/>

<xsl:param name="VAR_1" select="''"/>
<xsl:param name="VAR_2" select="''"/>

<xsl:variable name="espace">
<xsl:text>&#160;</xsl:text>
</xsl:variable>
<xsl:key name="group-by-typologie" match="ROOT/INDEX" use="TPL" />
<xsl:key name="group-by-instructeur" match="ROOT/INDEX" use="SAT" />
<xsl:variable name="vocabulaire_df" select="document('vocabulaire_df.xml', /)"/>

<xsl:template match="/">
<HTML>
<HEAD>
<style>
* {
	font-family: Arial, Helvetica, sans-serif; 
	font-size: 11px; 
}

.std {
    border-right: 1px solid #808080;
    border-top: 1px solid #808080;
    border-bottom: 1px solid #808080;
}

.std_titre {
    border-right: 1px solid #808080;
    border-top: 1px solid #808080;
    border-bottom: 1px solid #808080;
    font-weight: bold;
}
.std_pair {
    border-right: 1px solid #808080;
    border-top: 1px solid #808080;
    border-bottom: 1px solid #808080;
}

.std_impair {
    background-color:#eeeeee;
    border-right: 1px solid #808080;
    border-top: 1px solid #808080;
    border-bottom: 1px solid #808080;
}

.table_mois {
    border: 1px solid #808080;
    border-spacing:0;
    border-collapse:collapse;
    text-align: center;
}
</style>
</HEAD>
<BODY>
<table class='table_mois' width='100%'>
<tr>
    <td class='std'>Compte-rendu d'exploitation du <xsl:value-of select="$VAR_1" /> au <xsl:value-of select="$VAR_2" /></td>
</tr>
</table>
<br/>
<xsl:for-each select="/ROOT/INDEX[generate-id() = generate-id(key('group-by-typologie', TPL)[1])]">
<xsl:sort select="TPL" />
<xsl:variable name="VARTPL" select="TPL"/>
<xsl:variable name="VARLIBTPL" select="$vocabulaire_df/ROOT/rub[@code = 'TPL']/mot[@code = $VARTPL]/@libelle"/>
<table class='table_mois' width='100%'>
<tr>
    <td class='std_titre' colspan='10'>Typologie : <xsl:value-of select="$VARLIBTPL" /></td>
</tr>
<tr>
    <td class='std_titre' style='width: 15%;'>Clé</td>
    <td class='std_titre' style='width: 5%;'>Etat</td>
    <td class='std_titre' style='width: 15%;'>Nom</td>
    <td class='std_titre' style='width: 15%;'>Prénom</td>
    <td class='std_titre' style='width: 10%;'>Adresse</td>
    <td class='std_titre' style='width: 20%;'>Objet</td>
</tr>

<xsl:for-each select="/ROOT/INDEX[TPL=$VARTPL]">
<xsl:sort select="CKH" />
<xsl:variable name="CLASSNAME">
    <xsl:if test="position() mod 2 = 0">std_pair</xsl:if>
    <xsl:if test="position() mod 2 != 0">std_impair</xsl:if>
</xsl:variable>

    <tr>
        <td class='{$CLASSNAME}'>
                <xsl:value-of select="CKH" />
        </td>
        <td class='{$CLASSNAME}'>
                <xsl:value-of select="ETA" />
        </td>
        <td class='{$CLASSNAME}'>
                <xsl:value-of select="NOM" />
        </td>
        <td class='{$CLASSNAME}'>
            <xsl:value-of select="PRE" />
        </td>
        <td class='{$CLASSNAME}'>
                <xsl:call-template name="replace_retour_chariot">
                <xsl:with-param name="text" select="ADR"/> 
                </xsl:call-template> 
        </td>
        <td class='{$CLASSNAME}'><xsl:value-of select="OBJ" /></td>
    </tr>
    </xsl:for-each>
    <tr>
        <td class='std' colspan='10'></td>
    </tr>
</table>
<br/>
</xsl:for-each>
</BODY>
</HTML>
</xsl:template>

<xsl:variable name="CR">
    <xsl:text>
</xsl:text></xsl:variable>

<xsl:template name="replace_retour_chariot"> 
<xsl:param name="text"/> 

<xsl:choose> 
  <xsl:when test="contains( $text, $CR)"> 
    <xsl:value-of select="substring-before( $text, $CR)"/> 
    <!-- substitue gReplace occurence with <BR /> string --> 
    <xsl:element name="br"/> 
    <xsl:call-template name="replace_retour_chariot"><!-- recurse --> 
      <xsl:with-param name="text" select="substring-after( $text, $CR)"/> 
    </xsl:call-template> 
  </xsl:when> 
  <xsl:otherwise> 
    <xsl:value-of select="$text"/> 
  </xsl:otherwise> 
</xsl:choose> 
</xsl:template>
</xsl:stylesheet>
