<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
		
	<xsl:template match="datafield[@tag='675']">
		<xsl:for-each select="subfield">
			<xsl:choose>
				<xsl:when test="@code='a'">
					<xsl:value-of select="text()"/>	
				</xsl:when>
				<xsl:when test="@code='v'">
					<xsl:text>&#x20;(</xsl:text>	
					<xsl:value-of select="text()"/>	
				</xsl:when>
				<xsl:when test="@code='z'">
					<xsl:choose>
						<xsl:when test="preceding-sibling::subfield[1][@code='v']">
							<xsl:text>,&#x20;</xsl:text>
						</xsl:when>
						<xsl:otherwise>
							<xsl:text>(&#x20;</xsl:text>	
						</xsl:otherwise>
					</xsl:choose>
					<xsl:value-of select="text()"/>	
				</xsl:when>
			</xsl:choose>
			<xsl:if test="(@code='v' and position()=last()) or @code='z'">
				<xsl:text>)</xsl:text>	
			</xsl:if>
		</xsl:for-each>
	</xsl:template>
	
	<xsl:template match="datafield[@tag='676']">
		<xsl:for-each select="subfield">
			<xsl:choose>
				<xsl:when test="@code='a'">
					<xsl:value-of select="text()"/>	
				</xsl:when>
				<xsl:when test="@code='v'">
					<xsl:text>&#x20;(</xsl:text>	
					<xsl:value-of select="text()"/>	
				</xsl:when>
			</xsl:choose>
			<xsl:if test="@code='v'">
				<xsl:text>)</xsl:text>	
			</xsl:if>
		</xsl:for-each>
	</xsl:template>
	
	<xsl:template match="datafield[@tag='680']">
		<xsl:for-each select="subfield">
			<xsl:choose>
				<xsl:when test="@code='a'">
					<xsl:value-of select="text()"/>	
				</xsl:when>
				<xsl:when test="@code='b'">
					<!--xsl:text>&#x20;</xsl:text-->	
					<xsl:value-of select="text()"/>	
				</xsl:when>
			</xsl:choose>
		</xsl:for-each>
	</xsl:template>
	
	<xsl:template match="datafield[@tag='686']">
		<xsl:for-each select="subfield">
			<xsl:choose>
				<xsl:when test="@code='a'">
					<xsl:if test="preceding-sibling::subfield[@code='a' or @code='b' or @code='c']">
						<xsl:text>&#x20;</xsl:text>
					</xsl:if>
					<xsl:value-of select="text()"/>	
				</xsl:when>
				<xsl:when test="@code='b'">	
					<xsl:value-of select="text()"/>	
				</xsl:when>
				<xsl:when test="@code='c'">
					<xsl:text>.&#x20;</xsl:text>	
					<xsl:value-of select="text()"/>	
				</xsl:when>
			</xsl:choose>
		</xsl:for-each>
	</xsl:template>
	
</xsl:stylesheet>
