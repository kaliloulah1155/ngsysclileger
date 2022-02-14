<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html" encoding="ISO-8859-1"/>
	
	<!-- Formatage des nombres -->
	<xsl:decimal-format name="us" decimal-separator='.' grouping-separator=',' />
	<xsl:decimal-format name="european" decimal-separator=',' grouping-separator='.' />
	<xsl:decimal-format name="example" decimal-separator="." grouping-separator=","
		infinity="INFINITY" minus-sign="-" NaN="Not a Number" percent="%"
		per-mille="m" zero-digit="0" digit="#" pattern-separator=";" /> 
	
	<xsl:template match="/">
		<HTML>
			<HEAD>
				<STYLE>
					H2 {font-family: Arial;font-size: 10pt }
					td{font-size: 8pt}
				</STYLE>
				
			</HEAD>
			<BODY style="font-size: 8px" topmargin="0">
				<!-- n° page/nombre de page en pied de page -->
				<xsl:text disable-output-escaping="yes">&lt;!-- </xsl:text>
				<xsl:text>FOOTER RIGHT "$PAGE/$PAGES" </xsl:text>
				<xsl:text disable-output-escaping="yes"> --&gt;</xsl:text>
				<xsl:text>&#xA;</xsl:text>
				<br/>
				<br/>
				<br/>
				<table border ="0" width= "100%" >
					<tr>
						<td width= "100%"  >
							<img height="70" width="200"><xsl:attribute name="src"><xsl:value-of select="document('entetengser.xml')//logo"/></xsl:attribute></img><br/> 
						</td>
					</tr>
				</table>
				<br/>
				<table border ="0" width= "100%" align="center">
					<tr>
						<td width= "100%"  align="center">
							<table border ="1" width= "100%" >
								<tr>
									<td width= "100%" align="center">
										<span style="font-weight:bold; font-size:15px;">AUTORISATION D'ABSENCE</span>
									</td>
								</tr>
							</table>
						</td>
					</tr>
				</table>
				<br/>
				<table  border='0' align="center" width="100%"  >
					<tr>
						<td>
							<table border='0' align="center" width="100%"  >
								<tr>
									<td  style="font-size:15pt;">
										Autorisation :
									</td>
									<td style="font-size:14pt;">
										<xsl:if test="/ROOT/INDEX/AUN!=''">
											<xsl:value-of select="/ROOT/INDEX/AUN" />
										</xsl:if>
										<xsl:if test="/ROOT/INDEX/AUN=''">
											<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
										</xsl:if>
									</td>
								</tr>
								<tr  align="center">
									<td>
										<br/>
									</td>
								</tr>
								<tr>
									<td colspan="1" style="font-size:12pt;">
										NOM :
									</td>
									<td style="font-size:12pt;" >
										<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
										<xsl:if test="/ROOT/INDEX/NOM!=''">
											<xsl:value-of select="/ROOT/INDEX/NOM" />
										</xsl:if>
										<xsl:if test="/ROOT/INDEX/NOM=''">
											<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
										</xsl:if>
									</td>
								</tr>
								<tr  align="center">
									<td>
										<br/>
									</td>
								</tr>
								<tr>
									<td colspan="1" style="font-size:12pt;">
										PRENOMS :
									</td>
									<td  style="font-size:12pt;" >
										<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
										<xsl:if test="/ROOT/INDEX/PRE!=''">
											<xsl:value-of select="/ROOT/INDEX/PRE" />
										</xsl:if>
										<xsl:if test="/ROOT/INDEX/PRE=''">
											<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
										</xsl:if>
									</td>
								</tr>
								<tr  align="center">
									<td>
										<br/>
									</td>
								</tr>
								<tr>
									<td colspan="1" style="font-size:12pt;">
										DEPARTEMENT :
									</td>
									<td  style="font-size:12pt;" >
										<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
										<xsl:if test="/ROOT/INDEX/DPT!=''">
											<xsl:value-of select="/ROOT/INDEX/DPT" />
										</xsl:if>
										<xsl:if test="/ROOT/INDEX/DPT=''">
											<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
										</xsl:if>
									</td>
								</tr>
								<tr  align="center">
									<td>
										<br/>
									</td>
								</tr>
								<tr>
									<td colspan="1" style="font-size:12pt;">
										DUR&#201;E :
									</td>
									<td  style="font-size:12pt;" >
										<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
										<xsl:if test="/ROOT/INDEX/NBR!=''">
											<xsl:value-of select="/ROOT/INDEX/NBR" />
										</xsl:if>
										<xsl:if test="/ROOT/INDEX/NBR=''">
											<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
										</xsl:if>
										Jours 
										
										<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
										<xsl:if test="/ROOT/INDEX/HRA!=''">
											<xsl:value-of select="/ROOT/INDEX/HRA" />
										</xsl:if>
										<xsl:if test="/ROOT/INDEX/HRA=''">
											<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
											0
										</xsl:if>
										Heures
									</td>
								</tr>
								<tr  align="center">
									<td>
										<br/>
									</td>
								</tr>
								<tr>
									<td colspan="1" style="font-size:12pt;">
										DATE DE D&#201;PART :
									</td>
									<td style="font-size:12pt;">
										 
										<xsl:if test="/ROOT/INDEX/A1!=''">
											<xsl:value-of select="/ROOT/INDEX/A1" />
										</xsl:if>
										<xsl:if test="/ROOT/INDEX/A1=''">
											<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
										</xsl:if> 
										&#160;&#160;&#160;&#160;&#160;&#160;
									</td>
									 
									<td></td>
									<td></td>
									<td></td>
								</tr>
								<tr  align="center">
									<td>
										<br/>
									</td>
								</tr>
								<tr>
									<td colspan="1" style="font-size:12pt;">
										DATE DE RETOUR :
									</td>
									<td style="font-size:12pt;">
										 
										<xsl:if test="/ROOT/INDEX/DRU!=''">
											<xsl:value-of select="/ROOT/INDEX/DRU" />
										</xsl:if>
										<xsl:if test="/ROOT/INDEX/DRU=''">
											<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
										</xsl:if>
									</td>
									<td></td>
									<td></td>
									<td></td>
								</tr>
								<tr  align="center">
									<td>
										<br/>
									</td>
								</tr>
								<tr>
									<td colspan="1" style="font-size:12pt;">
										MOTIF :
									</td>
									<td  style="font-size:12pt;" >
										<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
										<xsl:if test="/ROOT/INDEX/COM!=''">
											<xsl:value-of select="/ROOT/INDEX/COM" />
										</xsl:if>
										<xsl:if test="/ROOT/INDEX/COM=''">
											<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
										</xsl:if>
									</td>
								</tr>
								<tr  align="center">
									<td>
										<br/>
									</td>
								</tr>
								<tr>
									<td colspan="1" style="font-size:12pt;">
										INTERIMAIRE :
									</td>
									<td  style="font-size:12pt;" >
										<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
										<xsl:if test="/ROOT/INDEX/INT!=''">
											<xsl:value-of select="/ROOT/INDEX/INT" />
										</xsl:if>
										<xsl:if test="/ROOT/INDEX/INT=''">
											<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
										</xsl:if>
									</td>
								</tr>
								<tr  align="center">
									<td>
										<br/>
									</td>
								</tr>
								<tr>
									<td colspan="1" style="font-size:12pt;">
										DOSSIER EN COURS :
									</td>
									<td  style="font-size:12pt;" >
										<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
										<xsl:if test="/ROOT/INDEX/DOS!=''">
											<xsl:value-of select="/ROOT/INDEX/DOS" />
										</xsl:if>
										<xsl:if test="/ROOT/INDEX/DOS=''">
											<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
										</xsl:if>
									</td>
								</tr>
								<tr  align="center">
									<td>
										<br/>
									</td>
								</tr>
								 
							</table>
						</td>
					</tr>
				</table>
				<table  align="center" width="100%">
					<tr>
						<td style="font-size:12pt;">
							<u> SIGNATURE DE L'INTERESSE(E) </u>
						</td>
						<td>
							<br/>
						</td>
						<td style="font-size:12pt;">
							<u> SIGNATURE DU RESPONSABLE </u>
						</td>
					</tr>
					<tr>
						<td></td>
						<td></td>
						<td style="font-size:11.5pt;" >
							 Fait à Abidjan, le <xsl:value-of select="/ROOT/INDEX/DCR" /> 
						</td>
					</tr>
				</table>
				<br/>
				<br/>
				<br/>
				<table  align="center" width="100%">
					<tr>
						<td style="font-size:12pt;">
							<u> AVIS DE LA DIRECTION </u>
						</td>
						<td>
							<br/>
						</td>
					</tr>
					<tr>
						<td style="font-size:12pt;">
							<table border="0">
								<tr>
									<td>
										<table border="1">
											<tr>
												<td>
													<xsl:if test="/ROOT/INDEX/AUS='AUTORISATION ACCORDE AVEC TRAITEMENT'">
														<span>X</span>
													</xsl:if>
													<xsl:if test="/ROOT/INDEX/AUS!='AUTORISATION ACCORDE AVEC TRAITEMENT'">
														<span><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text></span>
													</xsl:if>
												</td>
											</tr>
											 
										</table>
									</td>
									<td>
										AUTORISATION ACCORDE AVEC TRAITEMENT
									</td>
								</tr>
							</table>
						</td>
					</tr>
					<tr>
						<td style="font-size:12pt;">
							<table border="0">
								<tr>
									<td>
										<table border="1">
											<tr>
												<td>
													<xsl:if test="/ROOT/INDEX/AUS='AUTORISATION ACCORDE AVEC RETENUE'">
														<span>X</span>
													</xsl:if>
													<xsl:if test="/ROOT/INDEX/AUS!='AUTORISATION ACCORDE AVEC RETENUE'">
														<span><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text></span>
													</xsl:if>
												</td>
											</tr>
											
										</table>
									</td>
									<td>
										AUTORISATION ACCORDE AVEC RETENUE
									</td>
								</tr>
							</table>
						</td>
					</tr>
					<tr>
						<td style="font-size:12pt;">
							<table border="0">
								<tr>
									<td>
										<table border="1">
											<tr>
												<td>
													<xsl:if test="/ROOT/INDEX/AUS='AUTORISATION REFUSEE'">
														<span>X</span>
													</xsl:if>
													<xsl:if test="/ROOT/INDEX/AUS!='AUTORISATION REFUSEE'">
														<span><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text></span>
													</xsl:if>
												</td>
											</tr>
											
										</table>
									</td>
									<td>
										AUTORISATION REFUSEE
									</td>
								</tr>
							</table>
						</td>
					</tr>
					<tr>
						<td>
							<br/>
						</td>
					</tr>
					<tr>
						<td>
							<br/>
						</td>
					</tr>
					<tr>
						<td colspan="1" style="font-size:12pt;">
							<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>MOTIF DU REFUS : 
						</td>
						<td>
							<br/>
						</td>
						<td>
							<br/>
						</td>
					</tr>
					<tr>
						<td colspan="5" style="font-size:12pt;">
							<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
							<xsl:if test="/ROOT/INDEX/DEP!=''">
								<xsl:value-of select="/ROOT/INDEX/DEP" />
							</xsl:if>
							<xsl:if test="/ROOT/INDEX/DEP=''">
								<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
							</xsl:if>
							
						</td>
					</tr>
					<tr>
						<td>
							<br/>
						</td>
					</tr>
				</table>
				<br/>
				<table  align="center" width="100%">
					<tr>
						<td style="font-size:12pt;">
							Fait à Abidjan, le <xsl:value-of select="/ROOT/INDEX/DCR" /> 
						</td>
						<td>
							<br/>
						</td>
						<td style="font-size:12pt;font-weight:bold">
							<u> LA DIRECTION G&#201;N&#201;RALE </u>
						</td>
					</tr>
					 
				</table>
				 
				 
				 
				 
				<!--Pour chaque noeud produit on génère un ID unique. Cet ID unique doit être égal à l’ID unique du premier noeud retourné par la clef. 
De cette manière nous aurons chaque catégorie une fois seulement.
Maintenant, nous allons sélectionner les produits pour chaque catégorie.-->
				
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
