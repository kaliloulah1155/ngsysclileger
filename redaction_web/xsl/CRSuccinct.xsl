<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xs="http://www.w3.org/2001/XMLSchema"
  xmlns:pos="http://www.sesin.com/"
  xmlns:format="http://www.sesin.com/"
  xmlns:xhtml="http://www.w3.org/1999/xhtml"
  xmlns:exsl="http://exslt.org/common"
  xmlns:str="http://exslt.org/strings"
  xmlns:date="http://exslt.org/dates-and-times"
  xmlns:func="http://exslt.org/functions"
  extension-element-prefixes="exsl str func format"
  version="1.0">

  <!-- Import d'une fonction pour le traitement des chaines de caractères -->
  <xsl:import href="str.replace.function.xsl"/>
  <xsl:import href="format.function.xsl"/>

  <xsl:output method="html" indent="yes" encoding="ISO-8859-1"/>
  
  <xsl:param name="modele" select="'recueil'"/>
  <xsl:param name="repertoire_fichiers_xml" select="''"/>

<xsl:template match="/">
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:pos="http://www.sesin.com/">
<head>
	<style type="text/css">
	@page { size: 21cm 29.7cm }
	.tdexcuses {margin-bottom: 0.1cm;font-family: arial;font-size: 10pt;}
	.tdpour {margin-bottom: 0.1cm;font-family: arial;font-size: 10pt;}
	.p0 {margin-bottom: 0.1cm;font-family: arial;font-size: 10pt;}
	.pcenter {margin-bottom: 0.1cm;font-family: arial;text-align:center;font-size: 10pt;}
	</style>
</head>
  <body>
	<div style="font-family:Arial;margin: 10em 3em 3em 3em;" >

	<!-- si CRSuccinct : affichage en-tete  CRSuccinct -->
	<xsl:if test="$modele = 'CRSuccinct'">
		<table border='1' width='90%' style="margin-left:-4;border-collapse: collapse;">
		<tr>
			<td valign='top' width='30%'><p style="text-align:center"></p>
				<img src="http://localhost/apollon/images/logo/logo_client_50.gif" border="0"/>
				<p style="font-family: Arial;font-size: 12pt;font-weight: bold;text-align: center;">Département du Var </p>
				<p style="font-family: Arial;font-size: 12pt;font-weight: bold;text-align: center;"> </p>
				<p style="font-family: Arial;font-size: 12pt;font-weight: bold;text-align: center;">ARRONDISSEMENT DE TOULON </p>
				<p style="font-family: Arial;font-size: 12pt;font-weight: bold;text-align: center;"></p>
			</td>
			<td valign='top' width='70%'><p style="text-align:center;margin-bottom:6pt;font-size:10pt;"><b>REPUBLIQUE FRANÇAISE</b> </p>
				<p style="font-family: Arial;font-size: 16pt;font-weight: bold;text-align: center;">Mairie de La Seyne-sur-Mer<br/> </p>
				<p style="font-family: Arial;font-size: 16pt;font-weight: bold;text-align: center;">
				COMPTE RENDU DE LA SEANCE PUBLIQUE DU CONSEIL MUNICIPAL DU 
					<xsl:variable name="valeur-date" select="/ROOT/INDEX[@TYPE='DEL']/RUB_LIEE_DCM/INDEX/DCM"/>
					<xsl:value-of select="format:date($valeur-date, '%d %B %Y')"/>
				<br/></p>
			</td>
		</tr>
		</table>
	</xsl:if>
	
	<!-- si recueil : affichage du sommaire des délibérations -->
	<xsl:if test="$modele = 'recueil'">
		<p style="text-align:center;font-family: Arial;font-size:10pt;font-weight:bold;">DIRECTION GENERALE DES SERVICES
		</p>
		<p class="p0"><br/><br/><br/></p>
		<hr/>
		<p style="text-align:center;font-family: Arial;font-size:18pt;font-weight:bold;">Ville de La Seyne-sur-Mer<br/> </p>
		<hr/>
		<p class="p0"><br/><br/><br/></p>
		<p style="text-align:center;font-family: Arial;font-size:36pt;font-weight:bold;">RECUEIL DES ACTES <br/>ADMINISTRATIFS<br/> </p>
		<br/><br/>
		<p style="text-align:center;font-family: Arial;font-size:10pt;font-weight:bold;">MIS A DISPOSITION DU PUBLIC LE : <br/> 
		(conformément à l'article R.2121-10 du Code Général des Collectivités Territoriales)
		</p>
		
		<xsl:variable name="valeur-date" select="/ROOT/INDEX[@TYPE='DEL']/RUB_LIEE_DCM/INDEX/DCM"/>
		<p class="p0"/><p class="p0"/><p class="p0"/><p class="p0"/>
		<p class="p0"/><p class="p0"/><p class="p0"/><p class="p0"/>
		<p class="p0"/><p class="p0"/><p class="p0"/><p class="p0"/>
		<p class="p0"/><p class="p0"/><p class="p0"/><p class="p0"/>
		<p class="p0"/><p class="p0"/><p class="p0"/><p class="p0"/>
		<p class="margin-bottom: 0.1cm;font-family: arial;font-size: 10pt;font-weight: bold;">
                RAA du <xsl:value-of select="format:date($valeur-date, '%d %B %Y')"/>
        </p>
		<p style="page-break-before: always;"></p>
	</xsl:if>
	
	<!-- Tri des délibérations selon l'ordre des clé hierarchique -->
	<xsl:variable name="liste-del-order">
		<xsl:for-each select="/ROOT/INDEX[@TYPE='DEL']">
    	<xsl:sort select="K_H" />
            <xsl:copy-of select="."/>
        </xsl:for-each>
	</xsl:variable>
	
	<!-- si recueil : affichage du sommaire des délibérations -->
	<xsl:if test="$modele = 'recueil'">
		<xsl:call-template name="sommaire-deliberation"> 
    		<xsl:with-param name="liste-del-order" select="exsl:node-set($liste-del-order)"/> 
 		</xsl:call-template>
	</xsl:if>
	
	<br/><br/>
	<p class="p0">Nombre de CONSEILLERS</p>
	<p class="p0">en exercice : 49</p>
	<p class="p0">
	<xsl:value-of select="/ROOT/INDEX[@TYPE='DEL']/RUB_LIEE_DCM/INDEX/LD2"/>, à <xsl:value-of select="/ROOT/INDEX[@TYPE='DEL']/RUB_LIEE_DCM/INDEX/HCM"/>, le Conseil Municipal, convoqué en date du TODO, s'est assemblé en Séance Publique en l'Hôtel de Ville,  
	sous la présidence de 
	<!-- Affichage du president = president de la séance, prénom récupéré dans la liste des presents de la première délibération -->
	<xsl:variable name="president" select="/ROOT/INDEX[@TYPE='DEL']/RUB_LIEE_DCM/INDEX/PRS"/> 
	<xsl:value-of select="exsl:node-set($liste-del-order)/INDEX[1]/RUB_LIEE_PRE/*/*[name()='NOM' and . = $president]/../PRN"/>
		&#160;<xsl:value-of select="$president"/>, <xsl:value-of select="exsl:node-set($liste-del-order)/INDEX[1]/RUB_LIEE_PRE/*/*[name()='NOM' and . = $president]/../FON"/>.</p>
	
	<!-- Affichage de la composition du CM = composition de la première délibération de la liste -->
	<p class="p0"><br/></p>
	<xsl:call-template name="composition-deliberation"> 
    	<xsl:with-param name="index-en-cours" select="exsl:node-set($liste-del-order)/INDEX[1]"/> 
 	</xsl:call-template>
 	<br/><br/>
 	
 	<!-- Affichage du secretaire = secretaire de la séance, prénom récupéré dans la liste des presents de la première délibération -->
 	<p style="font-family: Arial;font-size:10pt;text-align:right;">
	 	<xsl:variable name="secretaire" select="/ROOT/INDEX[@TYPE='DEL']/RUB_LIEE_DCM/INDEX/SEC"/> 
		<xsl:value-of select="exsl:node-set($liste-del-order)/INDEX[1]/RUB_LIEE_PRE/*/*[name()='NOM' and . = $secretaire]/../PRN"/>
		&#160;<xsl:value-of select="$secretaire"/>
		 a été désigné pour remplir les fonctions de secrétaire.<br/>
	    LE CONSEIL AINSI CONSTITUE,<br/>
		.../...<br/>
	</p>
	<p style="page-break-before: always;"></p>
	
	<xsl:for-each select="exsl:node-set($liste-del-order)/INDEX">
	<xsl:sort select="*[name(.)='K_H']" />
    	<xsl:variable name="position-globale" select="position()"/>
		<xsl:variable name="current-key-group" select="./*[name()='RUB']" />
		<xsl:if test="not(preceding-sibling::INDEX/*[name()='RUB']=$current-key-group)">
		
            <xsl:variable name="preceding-pre" select="preceding-sibling::INDEX[position()=1]/PRE" />
            <xsl:variable name="preceding-abs" select="preceding-sibling::INDEX[position()=1]/ABS" />
            <xsl:variable name="group-of-index" select="exsl:node-set($liste-del-order)/INDEX/*[name()='RUB' and . = $current-key-group]/.."/>
            <xsl:call-template name="table-del-rubrique">
                <xsl:with-param name="group-of-index" select="$group-of-index"/>
                <xsl:with-param name="preceding-pre" select="$preceding-pre"/>
                <xsl:with-param name="preceding-abs" select="$preceding-abs"/>
                <xsl:with-param name="position-globale" select="$position-globale"/>
            </xsl:call-template>
	    </xsl:if>
	</xsl:for-each>
	
	<xsl:if test="$modele = 'CRSuccinct'">
    	<pos:need nb-lignes='15' />
    	<p style="text-align:center;"><br/><br/></p>
    	<p style="text-align:justify;font-family: Arial;font-size:10pt;margin-bottom:12pt">Monsieur le Maire rend compte des Décisions prises en application de l'article L. 2122-22 du code général des collectivités territoriales (DEC07149 à DEC07170) dont la liste est jointe au présent compte rendu. </p>
    	<p style="text-align:justify;font-family: Arial;font-size:10pt;margin-bottom:12pt">L'ordre du jour étant épuisé, la séance est levée.</p>
    	<p style="text-align:justify;font-family: Arial;font-size:10pt;margin-bottom:12pt">Il est <xsl:value-of select="/ROOT/INDEX[@TYPE='DEL']/RUB_LIEE_DCM/INDEX/HFC"/>.</p>
    	<p style="text-align:justify;font-family: Arial;font-size:10pt;margin-bottom:12pt">La Seyne-sur-Mer, le <xsl:value-of select="/ROOT/INDEX[@TYPE='DEL']/RUB_LIEE_DCM/INDEX/DCM"/>.</p>
    	<p style="text-align:center;font-family: Arial;font-size:10pt;text-indent:56pt"><b>
            <xsl:call-template name="str:replace_retour_chariot"> 
    		    <xsl:with-param name="text" select="/ROOT/INDEX[@TYPE='DEL']/RUB_LIEE_DCM/INDEX/PVS"/> 
    	     </xsl:call-template></b> </p>
    	<br/>
        <br/>
        <br/>
        <br/>
    </xsl:if>
    
    <p style="page-break-before: always;"></p>
	<!-- Affichage du sommaire des décisions -->
	<xsl:if test="$modele = 'CRSuccinct'">
    	<p style="text-align:center;font-family: Arial;font-size:16pt;font-weight:bold;"><u>COMPTE-RENDU DES DECISIONS DU MAIRE</u></p>
    	<p style="text-align:center;font-family: Arial;font-size:10pt;font-weight:bold;">
    	(prises en application de l’article L.2122-22 du <br/>Code Général des Collectivités Territoriales)</p>
        <br/>
        <br/>
    </xsl:if>
    <xsl:if test="$modele = 'recueil'">
        <xsl:variable name="valeur-date" select="/ROOT/INDEX[@TYPE='DEL']/RUB_LIEE_DCM/INDEX/DCM"/>
        <table border='1' width='90%' border-style='solid' cellspacing='0' cellpadding='0'>
            <tr>
                <td style="margin-bottom: 0.1cm;font-family: Arial;font-size:10pt;text-align:justify;">
                    <p style="text-align:center;font-family: Arial;font-size:16pt;font-weight:bold;">DECISIONS DU MAIRE<br/> </p>
                    <p style="text-align:center;font-family: Arial;font-size:16pt;font-weight:bold;">SEANCE DU 
                	<xsl:value-of select="format:date($valeur-date, '%d %B %Y')"/>
                    </p>
                </td>
        	</tr>
        </table>
		
		<p class="p0"/><p class="p0"/><p class="p0"/><p class="p0"/>
		<p class="p0"/><p class="p0"/><p class="p0"/><p class="p0"/>
		<p class="p0"/><p class="p0"/><p class="p0"/><p class="p0"/>
		<p class="p0"/><p class="p0"/><p class="p0"/><p class="p0"/>
		<p class="p0"/><p class="p0"/><p class="p0"/><p class="p0"/>
		<p class="p0"/><p class="p0"/><p class="p0"/><p class="p0"/>
		<p class="p0"/><p class="p0"/><p class="p0"/><p class="p0"/>
		<p class="p0"/><p class="p0"/><p class="p0"/><p class="p0"/>
		<p class="p0"/><p class="p0"/><p class="p0"/><p class="p0"/>
		<p class="margin-bottom: 0.1cm;font-family: arial;font-size: 10pt;font-weight: bold;">
                RAA du <xsl:value-of select="format:date($valeur-date, '%d %B %Y')"/>
        </p>
		<p style="page-break-before: always;"></p>
	</xsl:if>
    <xsl:call-template name="sommaire-decision" />
	<!-- FIN : Affichage du sommaire des décisions -->
	
	<!-- si recueil : affichage de la liste des décisions -->
	<xsl:if test="$modele = 'recueil'">
		<p style="text-align:center;font-family: Arial;font-size:16pt;font-weight:bold;">RECUEIL DES DECISIONS
		PRESENTEES AU CONSEIL MUNICIPAL DU <br/>
		<xsl:value-of select="/ROOT/INDEX[@TYPE='DEL']/RUB_LIEE_DCM/INDEX/LD1"/></p>
		<p style="text-align:center;font-family: Arial;font-size:10pt;font-weight:bold;">
		(en application de l'article L2122-23 du code Général des Collectivités Territoriales)
		</p>
		<xsl:call-template name="liste-decision" />
	</xsl:if>
	
	</div>
  </body>
</html>
</xsl:template>

<xsl:template name="table-del-rubrique">
    <xsl:param name="group-of-index"/>
    <xsl:param name="preceding-pre"/>
    <xsl:param name="preceding-abs"/>
    <xsl:param name="position-globale"/>
    
    <xsl:for-each select="$group-of-index">
    <xsl:sort select="K_H" />
    	<xsl:variable name="index-en-cours" select="."/>
    	<xsl:variable name="preceding-present">
            <xsl:choose>
    			<xsl:when test="position() = 1">
    			    <xsl:value-of select="$preceding-pre"/>
    			</xsl:when>
    			<xsl:otherwise>
                    <xsl:value-of select="preceding-sibling::INDEX[position()=1]/PRE"/>
    			</xsl:otherwise>
    		</xsl:choose>
        </xsl:variable>
        
        <xsl:variable name="preceding-absent">
            <xsl:choose>
    			<xsl:when test="position() = 1">
    			    <xsl:value-of select="$preceding-abs"/>
    			</xsl:when>
    			<xsl:otherwise>
                    <xsl:value-of select="preceding-sibling::INDEX[position()=1]/ABS"/>
    			</xsl:otherwise>
    		</xsl:choose>
        </xsl:variable>

        <!-- Affichage modification composition de l'assemblee si besoin -->
        <xsl:if test="normalize-space(PRE) != normalize-space($preceding-present) or  normalize-space(ABS) != normalize-space($preceding-absent)">
        
        <!-- debug 
		PRE1 : <xsl:value-of select="$preceding-present"/><br/>
        PRE2 : <xsl:value-of select="PRE"/><br/>
        ABS1 : <xsl:value-of select="$preceding-absent"/><br/>
        ABS2 : <xsl:value-of select="ABS"/><br/>
        position-globale : <xsl:value-of select="$position-globale"/><br/>
        position : <xsl:value-of select="position()"/><br/>
        -->
        	<xsl:if test="not($position-globale = '1' and position() = 1)">

				<p style="text-align:left;font-family: Arial;font-size:10pt;">
				La composition de l'assemblée est modifiée ainsi qu'il suit :
				</p>
				<xsl:call-template name="composition-deliberation"> 
			    	<xsl:with-param name="index-en-cours" select="$index-en-cours"/> 
		     	</xsl:call-template>
			    <p class="p0"><br/></p>
		    </xsl:if>
	    </xsl:if>
	    <!-- FIN : Affichage modification composition de l'assemblee si besoin -->

		<!-- Affichage titre de la rubrique pour la première du groupe -->
        <xsl:if test="position() = 1">
        <br/>
            <p style="font-family: Arial;font-size:12pt;font-weight:bold;"><u><xsl:value-of select="RUB"/></u></p>
        </xsl:if>
        
        <!-- Affichage de la deliberation -->
	  	<table width='90%' cellspacing='0' cellpadding='0' border='1'>
	  	<tr>
			<td width='20%' valign='top' style="font-family: Arial;font-size: 10pt;font-weight: bold;"><xsl:value-of select="K_H"/></td>
            <td width='70%' style="font-family: Arial;font-size: 10pt;font-weight: bold;"><xsl:value-of select="OBJ"/></td>
		</tr>
		</table>
		<p class="p0"><br/></p>
		<p class="pcenter">
			Rapporteur : <xsl:value-of select="RUB_LIEE_RAP/INDEX/PRN"/>&#160;<xsl:value-of select="RUB_LIEE_RAP/INDEX/NOM"/>,&#160;<xsl:value-of select="RUB_LIEE_RAP/INDEX/FON"/>
		</p>
        <p class="p0"><br/></p>

        <!-- Si recueil : Affichage texte de la déliberation -->
        <xsl:if test="$modele = 'recueil'">
	        <xsl:if test="@NBPAGE != '0'">
		        <xsl:variable name="numinfo" select="@NUMINFO"/>
		        <!-- <br /> -->
		        <xsl:variable name="nom-fichier" select="concat($repertoire_fichiers_xml, $numinfo, '.1.0')"/>
		        <!-- <xsl:variable name="contenu-fichier">-->
		        <xsl:call-template name="toto"> 
		          <xsl:with-param name="text" select="exsl:node-set(document($nom-fichier)/document/xhtml:section[@id = 'postext1'])"/>
		          <!--
                  <xsl:copy-of select="document($nom-fichier)/document/xhtml:section[@id = 'postext1']/child::node()">
                      <xsl:copy-of select="@*"/>
                    </xsl:copy-of>
                    -->
                </xsl:call-template>
                  <!--   <xsl:call-template name="str:replace_retour_chariot"> 
		        
		        </xsl:variable>
		        <xsl:message><xsl:copy-of select="$contenu-fichier" /></xsl:message>
		        <xsl:value-of select="str:replace($contenu-fichier, '&lt;br /&gt;', '&lt;p&gt; &lt;br /&gt; &lt;/p&gt;')" /> 
		        <xsl:copy-of select="str:replace($contenu-fichier, '&lt;br /&gt;', 'abcdef')" />-->
		    </xsl:if>
		</xsl:if>
		<!-- FIN : Affichage texte de la déliberation -->

        <!-- Affichage detail du vote si différent de L'UNANIMITE -->
		<xsl:variable name="unanimite">LA DELIBERATION EST ADOPTEE A L'UNANIMITE</xsl:variable>
		<xsl:if test="REV != $unanimite">
			<table border='0' width='90%' border-style='solid' cellspacing='0' cellpadding='0'>
		        <tr>
		            <td valign='top' width='25%' class="tdpour">POUR&#160;:</td>
		            <td valign='top' text-align="center" width='10%' class="tdpour"><xsl:value-of select="NPO"/></td>
		            <td valign='top' width='65%' class="tdpour">&#160;</td>
		        </tr>
		        <xsl:if test="NCT > 0">
			        <tr>
			            <td valign='top' width='25%' class="tdpour">CONTRE&#160;:</td>
			            <td valign='top' text-align="center" width='10%' class="tdpour"><xsl:value-of select="NCT"/></td>
			            <td valign='top' width='65%' class="tdpour">
						<xsl:for-each select="str:split(CTR, $CR)">
		                    <xsl:variable name="key-value" select="."/>
		                    <xsl:variable name="index-lie" select="$index-en-cours/RUB_LIEE_CTR/*/*[name()='NOM' and . = $key-value]/.."/>
		                    <xsl:if test="position() != 1"><xsl-text>, </xsl-text></xsl:if><xsl:value-of select="$index-lie/node()[local-name() = 'PRN']"/>&#160;<xsl:value-of select="$index-lie/NOM"/>
		                </xsl:for-each>
						</td>
			        </tr>
		        </xsl:if>
		        <xsl:if test="NAT > 0">
			        <tr>
					    <xsl:if test="NAT > 1">
				            <td valign='top' width='25%' class="tdpour">ABSTENTIONS&#160;:</td>
					    </xsl:if>
					    <xsl:if test="NAT = 1">
				            <td valign='top' width='25%' class="tdpour">ABSTENTION&#160;:</td>
					    </xsl:if>
			            <td valign='top' text-align="center" width='10%' class="tdpour"><xsl:value-of select="NAT"/></td>
			            <td valign='top' width='65%' class="tdpour">
						<xsl:for-each select="str:split(ABT, $CR)">
		                    <xsl:variable name="key-value" select="."/>
		                    <xsl:variable name="index-lie" select="$index-en-cours/RUB_LIEE_ABT/*/*[name()='NOM' and . = $key-value]/.."/>
		                    <xsl:if test="position() != 1"><xsl-text>, </xsl-text></xsl:if><xsl:value-of select="$index-lie/node()[local-name() = 'PRN']"/>&#160;<xsl:value-of select="$index-lie/NOM"/>
		                </xsl:for-each>
						</td>
			        </tr>
		        </xsl:if>
		        <xsl:if test="NNV > 0">
			        <tr>
					    <xsl:if test="NNV > 1">
				            <td valign='top' width='25%' class="tdpour">NE PARTICIPENT PAS AU VOTE&#160;:</td>
					    </xsl:if>
					    <xsl:if test="NNV = 1">
				            <td valign='top' width='25%' class="tdpour">NE PARTICIPE PAS AU VOTE&#160;:</td>
					    </xsl:if>
			            <td valign='top' text-align="center" width='10%' class="tdpour"><xsl:value-of select="NNV"/></td>
			            <td valign='top' width='65%' class="tdpour">
						<xsl:for-each select="str:split(NPV, $CR)">
		                    <xsl:variable name="key-value" select="."/>
		                    <xsl:variable name="index-lie" select="$index-en-cours/RUB_LIEE_NPV/*/*[name()='NOM' and . = $key-value]/.."/>
		                    <xsl:if test="position() != 1"><xsl-text>, </xsl-text></xsl:if><xsl:value-of select="$index-lie/node()[local-name() = 'PRN']"/>&#160;<xsl:value-of select="$index-lie/NOM"/>
		                </xsl:for-each>
						</td>
			        </tr>
		        </xsl:if>
	        </table>
            <p class="p0"><br/></p>
        </xsl:if>
        <!-- FIN : Affichage detail du vote si différent de L'UNANIMITE -->
        
        <!-- Affichage résultat du vote -->
        <p class="pcenter" style="font-weight: bold;"><xsl:value-of select="REV"/></p>

		<!-- Si recueil : Affichage texte de la déliberation -->
        <xsl:if test="$modele = 'recueil'">
        	<p style="font-family: Arial;font-size:10pt;">Acte transmis en Préfecture du Var le : <xsl:value-of select="DTP"/></p>
		</xsl:if>
		<!-- FIN : Affichage texte de la déliberation -->        
    
        <p class="p0"><br/><br/></p>
    </xsl:for-each>

  </xsl:template>
  
  <xsl:template name="composition-deliberation">
    <xsl:param name="index-en-cours"/>
    
	<xsl:if test="$index-en-cours/PRE != ''">
	<p class="p0"><b><u>ETAIENT PRESENTS</u></b><br/>
	   <table border='0' width='98%' border-style='solid' cellspacing='0' cellpadding='0'>
            <tr>
                <td style="margin-bottom: 0.1cm;font-family: Arial;font-size:10pt;text-align:justify;">
        	        <!-- Pour chaque numéro de fiche d'index en entrée... -->
        	        <xsl:for-each select="$index-en-cours/RUB_LIEE_PRE/INDEX">
        	          <xsl:sort select="$index-en-cours/ORD" case-order = "lower-first" data-type="number" />
        	          <xsl:if test="position() != 1"><xsl-text>, </xsl-text></xsl:if><xsl:value-of select="PRN"/>&#160;<xsl:value-of select="NOM"/>
        	        </xsl:for-each>
        	    </td>
        	</tr>
        </table>
        <p class="p0"><br/></p>
    </p>
	</xsl:if>

    <xsl:if test="$index-en-cours/ABE != ''">
		<xsl:variable name="liste-procuration" select="str:split($index-en-cours/PRO, $CR)"/>
    	<span style="font-family: Arial;font-size:10pt;font-weight: bold;"><u>ETAIENT EXCUSES</u></span><br/>
        <table border='0' width='98%' border-style='solid' cellspacing='0' cellpadding='0'>
            <xsl:for-each select="str:split($index-en-cours/ABE, $CR)">
            <tr>
                <xsl:variable name="key-value" select="."/>
                <xsl:variable name="pos-abe" select="position()"/>
                <xsl:variable name="index-lie-abs" select="$index-en-cours/RUB_LIEE_ABE/*/*[name()='NOM' and . = $key-value]/.."/>
                <xsl:variable name="key-value-pro" select="exsl:node-set($liste-procuration)[position()=$pos-abe]"/>
                <xsl:variable name="index-lie-pro" select="$index-en-cours/RUB_LIEE_PRO/*/*[name()='NOM' and . = $key-value-pro]/.."/>
               	<td nowrap="yes" width='25%' class='tdexcuses'>
                	<xsl:value-of select="$index-lie-abs/node()[local-name() = 'PRN']"/>&#160;<xsl:value-of select="$index-lie-abs/NOM"/>
                </td>
               	<td nowrap="yes" width='30%' class='tdexcuses'>
					...&#160;donne&#160;procuration&#160;à&#160;..
                </td>
                <td width='30%' class='tdexcuses'>
                	<xsl:value-of select="$index-lie-pro/node()[local-name() = 'PRN']"/>&#160;<xsl:value-of select="$index-lie-pro/NOM"/>
                </td>
            </tr>
            </xsl:for-each>
        </table>
        <p class="p0"><br/></p>
    </xsl:if>
	        
    <xsl:if test="$index-en-cours/ABS != ''">
    	<p class="p0"><b><u>ABSENTS</u></b><br/>
        <table border='0' width='98%' border-style='solid' cellspacing='0' cellpadding='0'>
            <tr>
                <td style="margin-bottom: 0.1cm;font-family: Arial;font-size:10pt;text-align:justify;">
                    <xsl:for-each select="$index-en-cours/RUB_LIEE_ABS/INDEX">
                      <xsl:sort select="$index-en-cours/ORD" case-order = "lower-first" data-type="number" />
                      <xsl:if test="position() != 1"><xsl-text>, </xsl-text></xsl:if><xsl:value-of select="PRN"/>&#160;<xsl:value-of select="NOM"/>
                    </xsl:for-each>
                </td>
        	</tr>
        </table>
        </p>
    </xsl:if>
  </xsl:template>
  
  <!-- template d'affichage : sommaire des déliberations -->
  <xsl:template name="sommaire-deliberation">
    <xsl:param name="liste-del-order"/>
    
    <xsl:variable name="valeur-date" select="/ROOT/INDEX[@TYPE='DEL']/RUB_LIEE_DCM/INDEX/DCM"/>
    <table border='1' width='90%' border-style='solid' cellspacing='0' cellpadding='0'>
        <tr>
            <td style="margin-bottom: 0.1cm;font-family: Arial;font-size:10pt;text-align:justify;">
                <p style="text-align:center;font-family: Arial;font-size:16pt;font-weight:bold;">DELIBERATIONS DU CONSEIL MUNICIPAL<br/> </p>
                <p style="text-align:center;font-family: Arial;font-size:16pt;font-weight:bold;">SEANCE DU 
            	<xsl:value-of select="format:date($valeur-date, '%d %B %Y')"/>
                </p>
            </td>
    	</tr>
    </table>
    
	<p class="p0"><br/></p><p class="p0"><br/></p><p class="p0"><br/></p><p class="p0"><br/></p>
	<p class="p0"><br/></p><p class="p0"><br/></p><p class="p0"><br/></p><p class="p0"><br/></p>
	<p class="p0"><br/></p><p class="p0"><br/></p><p class="p0"><br/></p><p class="p0"><br/></p>
	<p class="p0"><br/></p><p class="p0"><br/></p><p class="p0"><br/></p><p class="p0"><br/></p>
	<p class="p0"><br/></p><p class="p0"><br/></p><p class="p0"><br/></p><p class="p0"><br/></p>
	<p class="p0"><br/></p><p class="p0"><br/></p><p class="p0"><br/></p><p class="p0"><br/></p>
	<p class="p0"><br/></p><p class="p0"><br/></p><p class="p0"><br/></p><p class="p0"><br/></p>
	<p class="p0"><br/></p><p class="p0"><br/></p><p class="p0"><br/></p><p class="p0"><br/></p>

	<p class="margin-bottom: 0.1cm;font-family: arial;font-size: 10pt;font-weight: bold;">RAA du <xsl:value-of select="format:date($valeur-date, '%d %B %Y')"/></p>
    <p style="page-break-before: always;"></p>
	
    <xsl:for-each select="$liste-del-order/INDEX">
    	<xsl:variable name="current-key-group" select="RUB" />
    		<xsl:if test="not(preceding-sibling::INDEX[position()=1]/RUB = $current-key-group)">
    			<p style="font-family: Arial;font-size:12pt;font-weight:bold;"><br/><u><xsl:value-of select="RUB" /></u></p>
    		</xsl:if>
    		<!--
    		    		<p style="margin-bottom: 0cm">
    		<span style="float: left; width: 2.43cm; height: 0.61cm; border: none; padding: 0cm;">
    		  <p style="margin-bottom: 0cm"><b><xsl:value-of select="K_H"/>&#160;&#160;&#160;&#160;</b></p>
    	   </span>
    	   	<span style="float: left; width: 15.43cm; height: 0.61cm; border: none; padding: 0cm;">
    		  <p style="margin-bottom: 0cm"><b><xsl:value-of select="OBJ"/></b></p>
    	   </span>
    	   </p>
    	   -->
    		<table border='0' border-style='solid' cellspacing='0' cellpadding='0' width='90%' >
            <tr>
				<td valign='top' width='20%' style="font-family: Arial;font-size:10pt;font-weight:bold;"><xsl:value-of select="K_H"/>&#160;&#160;&#160;&#160;</td>
				<td style="font-family: Arial;font-size:10pt;text-align:justify;"><xsl:value-of select="OBJ"/></td>
			</tr>
            </table>
    </xsl:for-each>
    <p style="page-break-before: always;"></p>
    <table border='1' width='90%' style="margin-left:-4;border-collapse: collapse;">
		<tr>
			<td valign='top' width='30%'><p style="text-align:center"></p>
				<img src="http://localhost/apollon/images/logo/logo_client_50.gif" border="0"/>
				<p style="font-family: Arial;font-size: 12pt;font-weight: bold;text-align: center;">Département du Var </p>
				<p style="font-family: Arial;font-size: 12pt;font-weight: bold;text-align: center;"> </p>
				<p style="font-family: Arial;font-size: 12pt;font-weight: bold;text-align: center;">ARRONDISSEMENT DE TOULON </p>
				<p style="font-family: Arial;font-size: 12pt;font-weight: bold;text-align: center;"></p>
			</td>
			<td valign='top' width='70%'><p style="text-align:center;margin-bottom:6pt;font-size:10pt;"><b>REPUBLIQUE FRANÇAISE</b> </p>
				<p style="font-family: Arial;font-size: 16pt;font-weight: bold;text-align: center;">Mairie de La Seyne-sur-Mer<br/> </p>
				<p style="font-family: Arial;font-size: 16pt;font-weight: bold;text-align: center;">
				RECUEIL DES DELIBERATIONS DE LA SEANCE PUBLIQUE DU CONSEIL MUNICIPAL DU 
					<xsl:value-of select="format:date($valeur-date, '%d %B %Y')"/>
				<br/></p>
			</td>
		</tr>
	</table>
  </xsl:template>
  
  <!-- template d'affichage : sommaire des décisions -->
  <xsl:template name="sommaire-decision">
	<table border='0' border-style='solid' cellspacing='0' cellpadding='0' width='95%' >
		<xsl:for-each select="/ROOT/INDEX[@TYPE='DEC']">
    	<xsl:sort select="K_H" />
            <tr>
				<td valign='top' width='16%' style="font-family: Arial;font-size:10pt;font-weight:bold;text-align:center;">
				<xsl:value-of select="K_H"/>&#160;&#160;&#160;&#160;</td>
				<td style="font-family: Arial;font-size:10pt;font-weight:bold;text-align:justify;"><xsl:value-of select="OBJ"/></td></tr>
        </xsl:for-each>
	</table>
	<p style="page-break-before: always;"></p>
  </xsl:template>
  
  <!-- template d'affichage : liste des décisions -->
  <xsl:template name="liste-decision">
		<xsl:for-each select="/ROOT/INDEX[@TYPE='DEC']">
    	<xsl:sort select="K_H" />
        <b><xsl:value-of select="K_H"/>&#160;&#160;&#160;&#160;<xsl:value-of select="OBJ"/></b><br/>
    	<xsl:if test="@NBPAGE != '0'">
	        <xsl:variable name="numinfo" select="@NUMINFO"/>
	        <xsl:variable name="nom-fichier" select="concat($repertoire_fichiers_xml, $numinfo, '.1.0')"/>
	        <xsl:copy-of select="document($nom-fichier)/document/xhtml:section[@id = 'postext1']/child::node()"/>
	    </xsl:if>
		<br/><p style="font-family: Arial;font-size:10pt;">Acte transmis en Préfecture du Var le : <xsl:value-of select="DTP"/></p>
        </xsl:for-each>
  </xsl:template>

  <xsl:template name="toto">
    <xsl:param name="text"/>
    <xsl:for-each select="$text/child::node()">
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:text>abcdef</xsl:text>
            <xsl:copy-of select="./*"/>
        </xsl:copy>
    </xsl:for-each>
    </xsl:template>
</xsl:stylesheet>
