<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
	version="1.0">
	<xsl:output method="xml" indent="yes"/>

	<xsl:template match="/collection">
		<xsl:for-each select="record">
			<xsl:apply-templates select="."/>	
		</xsl:for-each>
	</xsl:template>
	
	<xsl:template match="record">
		<record>
			<identifier>
				<xsl:value-of select="controlfield[@tag='001']/text()"/>
			</identifier>
			<language>
				<xsl:value-of select="datafield[@tag='101']/subfield[@code='a']/text()"/>
			</language>
			<xsl:if test="datafield[@tag='210']/subfield[@code='d']">
				<date>
					<xsl:value-of select="datafield[@tag='210']/subfield[@code='d']/text()"/>
				</date>
			</xsl:if>
			<type>
				<xsl:variable name="type_of_record">
					<xsl:value-of select="substring(leader/text(), 7, 1)"/>
				</xsl:variable>
				<xsl:choose>
					<xsl:when test="$type_of_record='a'">
						<xsl:text>Language materials (Printed)</xsl:text>
					</xsl:when>
					<xsl:when test="$type_of_record='b'">
						<xsl:text>Language materials (Manuscript)</xsl:text>
					</xsl:when>
					<xsl:when test="$type_of_record='c'">
						<xsl:text>Music scores (Printed)</xsl:text>
					</xsl:when>
					<xsl:when test="$type_of_record='d'">
						<xsl:text>Music scores (Manuscript)</xsl:text>
					</xsl:when>
					<xsl:when test="$type_of_record='e'">
						<xsl:text>Cartographic materials(Printed)</xsl:text>
					</xsl:when>
					<xsl:when test="$type_of_record='f'">
						<xsl:text>Cartographic materials (Manuscript)</xsl:text>
					</xsl:when>
					<xsl:when test="$type_of_record='g'">
						<xsl:text>Projected and video material</xsl:text>
					</xsl:when>
					<xsl:when test="$type_of_record='i'">
						<xsl:text>Sound recordings, nonmusical performance</xsl:text>
					</xsl:when>
					<xsl:when test="$type_of_record='j'">
						<xsl:text>Sound recordings, musical performance</xsl:text>
					</xsl:when>
					<xsl:when test="$type_of_record='k'">
						<xsl:text>Two dimensional graphics</xsl:text>
					</xsl:when>
					<xsl:when test="$type_of_record='l'">
						<xsl:text>Electronic resources</xsl:text>
					</xsl:when>
					<xsl:when test="$type_of_record='m'">
						<xsl:text>Multimedia</xsl:text>
					</xsl:when>
					<xsl:when test="$type_of_record='r'">
						<xsl:text>Three dimensional artefacts and realia</xsl:text>
					</xsl:when>
				</xsl:choose>
			</type>
			<level>
				<xsl:variable name="bib_level">
					<xsl:value-of select="substring(leader/text(), 8, 1)"/>
				</xsl:variable>
				<xsl:choose>
					<xsl:when test="$bib_level='a'">
						<xsl:text>Analytic</xsl:text>
					</xsl:when>
					<xsl:when test="$bib_level='m'">
						<xsl:text>Monographic</xsl:text>
					</xsl:when>
					<xsl:when test="$bib_level='s'">
						<xsl:text>Serial</xsl:text>
					</xsl:when>
					<xsl:when test="$bib_level='c'">
						<xsl:text>Collection</xsl:text>
					</xsl:when>
				</xsl:choose>
			</level>
			<xsl:for-each select="datafield[@tag!='911']">
				<xsl:variable name="isbdtext">
					<xsl:call-template name="isbd"/>
				</xsl:variable>
				<xsl:if test="string-length($isbdtext) &gt; 0">
					<field>
						<xsl:attribute name="code"><xsl:value-of select="@tag"/></xsl:attribute>
						<xsl:value-of select="$isbdtext"></xsl:value-of>
					</field>
				</xsl:if>
			</xsl:for-each>
		</record>
	</xsl:template>
	
	<xsl:template name="isbd">
		<xsl:choose>
			<xsl:when test="@tag='010'or 
				@tag='011'"><xsl:apply-templates select="."/></xsl:when>
			
			<xsl:when test="@tag='200'or 
				@tag='205' or 
				@tag='207' or 
				@tag='205' or 
				@tag='208' or 
				@tag='210' or 
				@tag='215' or 
				@tag='225'"><xsl:apply-templates select="."/></xsl:when>
			
			<xsl:when test="@tag='300' or 
				@tag='301' or 
				@tag='302' or 
				@tag='303' or 
				@tag='304' or 
				@tag='305' or 
				@tag='306' or 
				@tag='307' or
				@tag='308' or 
				@tag='310' or 
				@tag='311' or 
				@tag='312' or 
				@tag='313' or 
				@tag='314' or 
				@tag='315' or 
				@tag='316' or
				@tag='317' or 
				@tag='318' or 
				@tag='320' or 
				@tag='321' or 
				@tag='322' or 
				@tag='323' or 
				@tag='324' or 
				@tag='325' or
				@tag='326' or 
				@tag='327' or 
				@tag='328' or 
				@tag='330' or 
				@tag='332' or 
				@tag='333' or 
				@tag='336' or 
				@tag='337' or
				@tag='345'"><xsl:apply-templates select="."/></xsl:when>					
			
			<xsl:when test="@tag='410' or 
				@tag='411' or 
				@tag='421' or 
				@tag='422' or 
				@tag='423' or 
				@tag='430' or 
				@tag='431' or 
				@tag='432' or
				@tag='433' or 
				@tag='434' or 
				@tag='435' or 
				@tag='436' or 
				@tag='437' or 
				@tag='440' or 
				@tag='441' or 
				@tag='442' or
				@tag='443' or 
				@tag='444' or 
				@tag='445' or 
				@tag='446' or 
				@tag='447' or 
				@tag='448' or 
				@tag='451' or
				@tag='452' or 
				@tag='453' or 
				@tag='454' or
				@tag='455' or 
				@tag='456' or 
				@tag='461' or 
				@tag='462' or 
				@tag='463' or 
				@tag='464' or
				@tag='470' or 
				@tag='481' or 
				@tag='482' or
				@tag='488'"><xsl:apply-templates select="."/></xsl:when>
			
			<xsl:when test="@tag='500'"><xsl:call-template name="uniform_title"/></xsl:when>
			
			<xsl:when test="@tag='510' or 
				@tag='512' or 
				@tag='513' or 
				@tag='514' or 
				@tag='515' or 
				@tag='516' or 
				@tag='517' or 
				@tag='518'"><xsl:call-template name="variant_titles"/></xsl:when>
			
			<xsl:when test="@tag='520' or
				@tag='530' or 
				@tag='531' or 
				@tag='532' or 
				@tag='540' or
				@tag='541'"><xsl:apply-templates select="."/></xsl:when>
			
			<xsl:when test="@tag='545'"><xsl:call-template name="variant_titles"/></xsl:when>
			
			<xsl:when test="@tag='600'"><xsl:call-template name="personal_name"/></xsl:when>
			
			<xsl:when test="@tag='601'"><xsl:call-template name="corporate_body_name"/></xsl:when>
			
			<xsl:when test="@tag='602'"><xsl:call-template name="family_name"/></xsl:when>
			
			<xsl:when test="@tag='605'"><xsl:call-template name="uniform_title"/></xsl:when>
			
			<xsl:when test="@tag='606' or
				@tag='607'"><xsl:call-template name="subject_geo_name"/></xsl:when>
			
			<xsl:when test="@tag='675' or 
				@tag='676' or 
				@tag='680' or 
				@tag='686'"><xsl:apply-templates select="."/></xsl:when>
			
			<xsl:when test="@tag='700' or
				@tag='701' or 
				@tag='702'"><xsl:call-template name="personal_name"/></xsl:when>
			
			<xsl:when test="@tag='710' or
				@tag='711' or 
				@tag='712'"><xsl:call-template name="corporate_body_name"/></xsl:when>
			
			<xsl:when test="@tag='720' or
				@tag='721' or 
				@tag='722'"><xsl:call-template name="family_name"/></xsl:when>
			
			<xsl:when test="@tag='856'"><xsl:apply-templates select="."/></xsl:when>
			
		</xsl:choose>	
	</xsl:template>
	
	<xsl:template match="text()"/>
	
	<xsl:include href="isbd0xx.xsl"/>
	<xsl:include href="isbd2xx.xsl"/>
	<xsl:include href="isbd3xx.xsl"/>
	<!--xsl:include href="isbd4xx.xsl"/-->
	<xsl:include href="isbdfunctions.xsl"/>
	<xsl:include href="isbd5xx.xsl"/>
	<xsl:include href="isbd6xx.xsl"/>
	<xsl:include href="isbd8xx.xsl"/>
</xsl:stylesheet>
