<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:str="http://exslt.org/strings"
                xmlns:func="http://exslt.org/functions"
                xmlns:exsl="http://exslt.org/common"
                xmlns:date="http://exslt.org/dates-and-times"
                xmlns:format="http://www.sesin.com/"
                extension-element-prefixes="str exsl date func format">

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
  
<func:function name="format:date">
	<xsl:param name="valeur-rubrique"/>
    <xsl:param name="date-format"/>
	<xsl:variable name="day-in-month" select="substring-before($valeur-rubrique, '/' )"/>
    <xsl:variable name="month-in-year" select="substring-before( substring-after($valeur-rubrique, '/' ), '/' )"/>
    <xsl:variable name="year" select="substring-after( substring-after( $valeur-rubrique, '/' ), '/' )"/>
    <xsl:variable name="date1" select="str:replace($date-format, '%d', $day-in-month)"/>
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
    <func:result select="$date5" />
</func:function>
</xsl:stylesheet>
