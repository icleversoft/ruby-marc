<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
		
	<xsl:template match="datafield[@tag='856']">
		<xsl:for-each select="subfield">
			<xsl:choose>
				<xsl:when test="contains('abcdefghijklmnopqrstuvwyz', @code)">
					<xsl:if test="position() &gt; 1">
						<xsl:text>.&#x20;</xsl:text>
					</xsl:if>
					<xsl:value-of select="text()"/>	
				</xsl:when>
				<xsl:otherwise/>
			</xsl:choose>
		</xsl:for-each>
	</xsl:template>
	
</xsl:stylesheet>
