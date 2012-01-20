<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
		
	<xsl:template match="datafield[@tag='010'] | datafield[@tag='011']">
		<xsl:for-each select="subfield">
			<xsl:choose>
				<xsl:when test="@code='a'">
					<xsl:value-of select="text()"/>	
				</xsl:when>
				<xsl:when test="@code='b'">
					<xsl:text>&#x20;</xsl:text><xsl:value-of select="text()"/>	
				</xsl:when>
				<xsl:when test="@code='d'">
					<xsl:text>&#x20;:&#x20;</xsl:text><xsl:value-of select="text()"/>	
				</xsl:when>
				<xsl:when test="@code='y'">
					<xsl:text>&#x20;;&#x20;</xsl:text><xsl:value-of select="text()"/>	
				</xsl:when>
				<xsl:when test="@code='z'">
					<xsl:text>&#x20;;&#x20;</xsl:text><xsl:value-of select="text()"/>	
				</xsl:when>
				<xsl:otherwise/>
			</xsl:choose>
		</xsl:for-each>
	</xsl:template>

</xsl:stylesheet>
