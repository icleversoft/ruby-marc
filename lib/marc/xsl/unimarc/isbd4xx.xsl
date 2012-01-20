<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
		
	<xsl:template match="datafield[substring(@tag, 1, 1)='4']">
		<xsl:variable name="subfield_separator">
			<xsl:choose>
				<xsl:when test="@tag='327'">&#x20;--&#x20;</xsl:when>
				<xsl:otherwise>.&#x20;</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:for-each select="subfield">
			<xsl:if test="not (self::node() = ../subfield[1])">
				<xsl:value-of select="$subfield_separator"/>
			</xsl:if>
			<xsl:value-of select="text()"/>
		</xsl:for-each>
	</xsl:template>
	
</xsl:stylesheet>
