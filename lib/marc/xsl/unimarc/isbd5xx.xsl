<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
		
	<xsl:template match="datafield[@tag='520']">
		<xsl:for-each select="subfield">
			<xsl:choose>
				<xsl:when test="@code='a'">
					<xsl:value-of select="text()"/>	
				</xsl:when>
				<xsl:when test="@code='e'">
					<xsl:text>&#x20;:&#x20;</xsl:text>
					<xsl:value-of select="text()"/>	
				</xsl:when>
				<xsl:when test="@code='i'">
					<xsl:choose>
						<xsl:when test="preceding-sibling::subfield[1][@code='h']">
							<xsl:text>,&#x20;</xsl:text>	
						</xsl:when>
						<xsl:otherwise>
							<xsl:text>.&#x20;</xsl:text>
						</xsl:otherwise>
					</xsl:choose>
					<xsl:value-of select="text()"/>	
				</xsl:when>
				<xsl:when test="@code='j' or @code='n'">
					<xsl:text>.&#x20;</xsl:text>
					<xsl:value-of select="text()"/>	
				</xsl:when>
				<xsl:when test="@code='x'">
					<xsl:text>,&#x20;ISSN&#x20;</xsl:text>
					<xsl:value-of select="text()"/>	
				</xsl:when>
			</xsl:choose>
		</xsl:for-each>
	</xsl:template>
	
	<xsl:template match="datafield[@tag='530']">
		<xsl:for-each select="subfield">
			<xsl:choose>
				<xsl:when test="@code='a'">
					<xsl:value-of select="text()"/>	
				</xsl:when>
				<xsl:when test="@code='b'">
					<xsl:text>&#x20;</xsl:text>
					<xsl:value-of select="text()"/>	
				</xsl:when>
				<xsl:when test="@code='j'">
					<xsl:text>.&#x20;</xsl:text>
					<xsl:value-of select="text()"/>	
				</xsl:when>
			</xsl:choose>
		</xsl:for-each>
	</xsl:template>
	
	<xsl:template match="datafield[@tag='531']">
		<xsl:for-each select="subfield">
			<xsl:choose>
				<xsl:when test="@code='a'">
					<xsl:value-of select="text()"/>	
				</xsl:when>
				<xsl:when test="@code='b'">
					<xsl:text>&#x20;</xsl:text>
					<xsl:value-of select="text()"/>	
				</xsl:when>
			</xsl:choose>
		</xsl:for-each>
	</xsl:template>
	
	<xsl:template match="datafield[@tag='532']">
		<xsl:for-each select="subfield">
			<xsl:choose>
				<xsl:when test="@code='a'">
					<xsl:value-of select="text()"/>	
				</xsl:when>
			</xsl:choose>
		</xsl:for-each>
	</xsl:template>
	
	<xsl:template match="datafield[@tag='540']">
		<xsl:for-each select="subfield">
			<xsl:choose>
				<xsl:when test="@code='a'">
					<xsl:value-of select="text()"/>	
				</xsl:when>
			</xsl:choose>
		</xsl:for-each>
	</xsl:template>
	
	<xsl:template match="datafield[@tag='541']">
		<xsl:for-each select="subfield">
			<xsl:choose>
				<xsl:when test="@code='a'">
					<xsl:value-of select="text()"/>	
				</xsl:when>
				<xsl:when test="@code='e'">
					<xsl:text>&#x20;:&#x20;</xsl:text>
					<xsl:value-of select="text()"/>	
				</xsl:when>
				<xsl:when test="@code='i'">
					<xsl:choose>
						<xsl:when test="preceding-sibling::subfield[1][@code='h']">
							<xsl:text>,&#x20;</xsl:text>	
						</xsl:when>
						<xsl:otherwise>
							<xsl:text>.&#x20;</xsl:text>
						</xsl:otherwise>
					</xsl:choose>
					<xsl:value-of select="text()"/>	
				</xsl:when>
			</xsl:choose>
		</xsl:for-each>
	</xsl:template>
	
</xsl:stylesheet>
