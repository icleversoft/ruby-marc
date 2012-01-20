<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
		
	<xsl:template name="uniform_title">
		<xsl:for-each select="subfield">
			<xsl:choose>
				<xsl:when test="@code='a'">
					<xsl:value-of select="text()"/>	
				</xsl:when>
				<xsl:when test="@code='b'">
					<xsl:choose>
						<xsl:when test="not(preceding-sibling::subfield[1][@code='b'])">
							<xsl:text>&#x20;[</xsl:text>
						</xsl:when>
						<xsl:otherwise>
							<xsl:text>,&#x20;</xsl:text>	
						</xsl:otherwise>
					</xsl:choose>
					<xsl:value-of select="text()"/>	
				</xsl:when>
				<xsl:when test="@code='h'">
					<xsl:text>.&#x20;</xsl:text>	
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
				<xsl:when test="@code='x' or @code='y' or @code='z'">
					<xsl:text>--</xsl:text>	
					<xsl:value-of select="text()"/>	
				</xsl:when>
				<xsl:otherwise/>
			</xsl:choose>
			<xsl:if test="(@code='b') and (not(following-sibling::subfield[1][@code='b']))">
				<xsl:text>]</xsl:text>	
			</xsl:if>
		</xsl:for-each>
	</xsl:template>
	
	<xsl:template name="variant_titles">
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
			</xsl:choose>
		</xsl:for-each>
	</xsl:template>
	
	<xsl:template name="relator_codes">
		<xsl:variable name="codelist" select="document('codelist.xml')"/>
		<xsl:variable name="relatorcodes">
			<xsl:for-each select="subfield[@code='4']">
				<xsl:if test="position() &gt; 1">
					<xsl:text> ; </xsl:text>
				</xsl:if>
				<xsl:variable name="txt">
					<xsl:value-of select="text()"/>
				</xsl:variable>
				<!--xsl:text>@</xsl:text-->
				<xsl:text> (</xsl:text>
				<!--xsl:value-of select="text()"/-->
				<xsl:value-of select="$codelist/codelist/code[@no=$txt]/text()"/>
				<xsl:text>)</xsl:text>
			</xsl:for-each>	
		</xsl:variable>
		<xsl:value-of select="$relatorcodes"/>
	</xsl:template>
	
	<xsl:template name="personal_name">
		<xsl:for-each select="subfield">
			<xsl:choose>
				<xsl:when test="@code='a'">
					<xsl:value-of select="text()"/>	
				</xsl:when>
				<xsl:when test="@code='b'">
					<xsl:choose>
						<xsl:when test="../@ind2 = '1'">,&#x20;</xsl:when>
						<xsl:otherwise>&#x20;</xsl:otherwise>
					</xsl:choose>
					<xsl:value-of select="text()"/>	
				</xsl:when>
				<xsl:when test="@code='c' or @code='f'">
					<xsl:text>,&#x20;</xsl:text>
					<xsl:value-of select="text()"/>	
				</xsl:when>
				<xsl:when test="@code='d' or @code='g'">
					<xsl:text>&#x20;</xsl:text>
					<xsl:value-of select="text()"/>	
				</xsl:when>
				<xsl:when test="@code='x' or @code='y' or @code='z'">
					<xsl:text>--</xsl:text>	
					<xsl:value-of select="text()"/>	
				</xsl:when>
			</xsl:choose>
		</xsl:for-each>
		<xsl:call-template name="relator_codes"/>
	</xsl:template>
	
	<xsl:template name="corporate_body_name">
		<xsl:for-each select="subfield">
			<xsl:choose>
				<xsl:when test="@code='a'">
					<xsl:value-of select="text()"/>	
				</xsl:when>
				<xsl:when test="@code='b' or @code='h'">
					<xsl:text>.&#x20;</xsl:text>
					<xsl:value-of select="text()"/>	
				</xsl:when>
				<xsl:when test="@code='c' or @code='d'">
					<xsl:text>&#x20;</xsl:text>
					<xsl:value-of select="text()"/>	
				</xsl:when>
				<xsl:when test="@code='e' or @code='f'">
					<xsl:text>&#x20;:&#x20;</xsl:text>
					<xsl:value-of select="text()"/>	
				</xsl:when>
				<xsl:when test="@code='g'">
					<xsl:text>,&#x20;</xsl:text>
					<xsl:value-of select="text()"/>	
				</xsl:when>
				<xsl:when test="@code='x' or @code='y' or @code='z'">
					<xsl:text>--</xsl:text>	
					<xsl:value-of select="text()"/>	
				</xsl:when>
			</xsl:choose>
		</xsl:for-each>
		<xsl:call-template name="relator_codes"/>
	</xsl:template>
	
	<xsl:template name="family_name">
		<xsl:for-each select="subfield">
			<xsl:choose>
				<xsl:when test="@code='a'">
					<xsl:value-of select="text()"/>	
				</xsl:when>
				<xsl:when test="@code='f'">
					<xsl:text>,&#x20;</xsl:text>
					<xsl:value-of select="text()"/>	
				</xsl:when>
				<xsl:when test="@code='x' or @code='y' or @code='z'">
					<xsl:text>--</xsl:text>	
					<xsl:value-of select="text()"/>	
				</xsl:when>
			</xsl:choose>
		</xsl:for-each>
		<xsl:call-template name="relator_codes"/>
	</xsl:template>
	
	<xsl:template name="subject_geo_name">
		<xsl:for-each select="subfield">
			<xsl:choose>
				<xsl:when test="@code='a'">
					<xsl:value-of select="text()"/>	
				</xsl:when>
				<xsl:when test="@code='x' or @code='y' or @code='z'">
					<xsl:text>--</xsl:text>	
					<xsl:value-of select="text()"/>	
				</xsl:when>
			</xsl:choose>
		</xsl:for-each>
	</xsl:template>
	
</xsl:stylesheet>
