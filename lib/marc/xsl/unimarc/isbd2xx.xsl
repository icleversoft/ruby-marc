<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	
	<xsl:template match="datafield[@tag='200']">
		<xsl:for-each select="subfield">
			<xsl:choose>
				<xsl:when test="@code='a'">
					<xsl:if test="not (self::node() = ../subfield[@code='a'][1])">
						<xsl:text>&#x20;;&#x20;</xsl:text>	
					</xsl:if>
					<xsl:value-of select="text()"/>	
				</xsl:when>
				<xsl:when test="@code='b'">
					<xsl:choose>
						<xsl:when test="not(preceding-sibling::subfield[1][@code='b'])">
							<xsl:text>&#x20;[</xsl:text>
						</xsl:when>
						<xsl:when test="substring(text(),1,1) = string('=')">
							<xsl:text>&#x20;</xsl:text>	
						</xsl:when>
						<xsl:otherwise>
							<xsl:text>,&#x20;</xsl:text>	
						</xsl:otherwise>
					</xsl:choose>
					<xsl:value-of select="text()"/>	
				</xsl:when>
				<xsl:when test="contains('cdefh', @code)">
					<xsl:choose>
						<xsl:when test="substring(text(),1,1) = string('=')">
							<xsl:text>&#x20;</xsl:text>	
						</xsl:when>
						<xsl:otherwise>
							<xsl:choose>
								<xsl:when test="@code='c'">
									<xsl:text>.&#x20;</xsl:text>
								</xsl:when>
								<xsl:when test="@code='d'">
									<xsl:text>&#x20;=&#x20;</xsl:text>
								</xsl:when>
								<xsl:when test="@code='e'">
									<xsl:text>&#x20;:&#x20;</xsl:text>
								</xsl:when>
								<xsl:when test="@code='f'">
									<xsl:text>&#x20;/&#x20;</xsl:text>
								</xsl:when>
								<xsl:when test="@code='h'">
									<xsl:text>.&#x20;</xsl:text>
								</xsl:when>
							</xsl:choose>	
						</xsl:otherwise>
					</xsl:choose>
					<xsl:value-of select="text()"/>	
				</xsl:when>
				<xsl:when test="@code='g'">
					<xsl:choose>
						<xsl:when test="preceding-sibling::subfield[1][@code='f'] or preceding-sibling::subfield[1][@code='g']">
							<xsl:choose>
								<xsl:when test="substring(text(),1,1) = string('=')">
									<xsl:text>&#x20;</xsl:text>
								</xsl:when>
								<xsl:otherwise>
									<xsl:text>&#x20;;&#x20;</xsl:text>
								</xsl:otherwise>
							</xsl:choose>	
						</xsl:when>
						<xsl:otherwise>
							<xsl:text>&#x20;/&#x20;</xsl:text>
						</xsl:otherwise>
					</xsl:choose>
					<xsl:value-of select="text()"/>	
				</xsl:when>
				<xsl:when test="@code='i'">
					<xsl:choose>
						<xsl:when test="preceding-sibling::subfield[1][@code='h']">
							<xsl:text>,&#x20;</xsl:text>	
						</xsl:when>
						<xsl:otherwise>
							<xsl:choose>
								<xsl:when test="substring(text(),1,1) = string('=')">
									<xsl:text>&#x20;</xsl:text>
								</xsl:when>
								<xsl:otherwise>
									<xsl:text>.&#x20;</xsl:text>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:otherwise>
					</xsl:choose>
					<xsl:value-of select="text()"/>	
				</xsl:when>
				<xsl:when test="@code='v'">
					<xsl:text>.&#x20;</xsl:text>	
					<xsl:value-of select="text()"/>	
				</xsl:when>
				<xsl:otherwise/>
			</xsl:choose>
			<xsl:if test="(@code='b') and (not(following-sibling::subfield[1][@code='b']))">
				<xsl:text>]</xsl:text>	
			</xsl:if>
		</xsl:for-each>
	</xsl:template>
	
	<xsl:template match="datafield[@tag='205']">
		<xsl:for-each select="subfield">
			<xsl:choose>
				<xsl:when test="@code='a'">
					<xsl:value-of select="text()"/>	
				</xsl:when>
				<xsl:when test="contains('bdf', @code)">
					<xsl:choose>
						<xsl:when test="substring(text(),1,1) = string('=')">
							<xsl:text>&#x20;</xsl:text>	
						</xsl:when>
						<xsl:otherwise>
							<xsl:choose>
								<xsl:when test="@code='b'">
									<xsl:text>,&#x20;</xsl:text>
								</xsl:when>
								<xsl:when test="@code='d'">
									<xsl:text>&#x20;=&#x20;</xsl:text>
								</xsl:when>
								<xsl:when test="@code='f'">
									<xsl:text>&#x20;/&#x20;</xsl:text>
								</xsl:when>
							</xsl:choose>	
						</xsl:otherwise>
					</xsl:choose>
					<xsl:value-of select="text()"/>	
				</xsl:when>
				<xsl:when test="@code='g'">
					<xsl:choose>
						<xsl:when test="preceding-sibling::subfield[1][@code='f'] or preceding-sibling::subfield[1][@code='g']">
							<xsl:choose>
								<xsl:when test="substring(text(),1,1) = string('=')">
									<xsl:text>&#x20;</xsl:text>
								</xsl:when>
								<xsl:otherwise>
									<xsl:text>&#x20;;&#x20;</xsl:text>
								</xsl:otherwise>
							</xsl:choose>	
						</xsl:when>
						<xsl:otherwise>
							<xsl:text>&#x20;/&#x20;</xsl:text>
						</xsl:otherwise>
					</xsl:choose>
					<xsl:value-of select="text()"/>	
				</xsl:when>
				<xsl:otherwise/>
			</xsl:choose>
		</xsl:for-each>
	</xsl:template>
	
	<xsl:template match="datafield[@tag='207']">
		<xsl:for-each select="subfield">
			<xsl:choose>
				<xsl:when test="@code='a'">
					<xsl:if test="not (self::node() = ../subfield[@code='a'][1])">
						<xsl:text>&#x20;;&#x20;</xsl:text>	
					</xsl:if>
					<xsl:value-of select="text()"/>	
				</xsl:when>
				<xsl:when test="@code='z'">
					<xsl:text>.&#x20;</xsl:text>	
					<xsl:value-of select="text()"/>	
				</xsl:when>
				<xsl:otherwise/>
			</xsl:choose>
		</xsl:for-each>
	</xsl:template>
	
	<xsl:template match="datafield[@tag='208']">
		<xsl:for-each select="subfield">
			<xsl:choose>
				<xsl:when test="@code='a'">
					<xsl:value-of select="text()"/>	
				</xsl:when>
				<xsl:when test="@code='d'">
					<xsl:choose>
						<xsl:when test="substring(text(),1,1) = string('=')">
							<xsl:text>&#x20;</xsl:text>	
						</xsl:when>
						<xsl:otherwise>
							<xsl:text>&#x20;=&#x20;</xsl:text>
						</xsl:otherwise>
					</xsl:choose>
					<xsl:value-of select="text()"/>	
				</xsl:when>
				<xsl:otherwise/>
			</xsl:choose>
		</xsl:for-each>
	</xsl:template>
	
	<xsl:template match="datafield[@tag='210']">
		<xsl:for-each select="subfield">
			<xsl:if test="contains('abcdefgh', @code)">
				<xsl:choose>
					<xsl:when test="substring(text(),1,1) = string('=')">
						<xsl:text>&#x20;</xsl:text>	
					</xsl:when>
					<xsl:otherwise>
						<xsl:choose>
							<xsl:when test="@code='a'">
								<xsl:if test="not (self::node() = ../subfield[1])">
									<xsl:text>&#x20;;&#x20;</xsl:text>	
								</xsl:if>
							</xsl:when>
							<xsl:when test="@code='b'">
								<xsl:text>&#x20;</xsl:text>
							</xsl:when>
							<xsl:when test="@code='c'">
								<xsl:text>&#x20;:&#x20;</xsl:text>
							</xsl:when>
							<xsl:when test="@code='d'">
								<xsl:text>,&#x20;</xsl:text>
							</xsl:when>
							<xsl:when test="@code='e'">
								<xsl:if test="not (self::node() = ../subfield[1])">
									<xsl:text>&#x20;;&#x20;</xsl:text>	
								</xsl:if>
							</xsl:when>
							<xsl:when test="@code='f'">
								<xsl:text>&#x20;</xsl:text>
							</xsl:when>
							<xsl:when test="@code='g'">
								<xsl:text>&#x20;:&#x20;</xsl:text>
							</xsl:when>
							<xsl:when test="@code='h'">
								<xsl:text>,&#x20;</xsl:text>
							</xsl:when>
							<xsl:otherwise/>
						</xsl:choose>	
					</xsl:otherwise>
				</xsl:choose>
				<xsl:value-of select="text()"/>
			</xsl:if>
		</xsl:for-each>
	</xsl:template>
	
	<xsl:template match="datafield[@tag='215']">
		<xsl:for-each select="subfield">
			<xsl:if test="contains('acde', @code)">
				<xsl:choose>
					<xsl:when test="@code='a'">
						<xsl:if test="not (self::node() = ../subfield[1])">
							<xsl:text>&#x20;+&#x20;</xsl:text>	
						</xsl:if>
					</xsl:when>
					<xsl:when test="@code='c'">
						<xsl:text>&#x20;:&#x20;</xsl:text>
					</xsl:when>
					<xsl:when test="@code='d'">
						<xsl:text>&#x20;;&#x20;</xsl:text>
					</xsl:when>
					<xsl:when test="@code='e'">
						<xsl:text>&#x20;+&#x20;</xsl:text>	
					</xsl:when>
				</xsl:choose>
				<xsl:value-of select="text()"/>
			</xsl:if>
		</xsl:for-each>
	</xsl:template>
	
	<xsl:template match="datafield[@tag='225']">
		<xsl:if test="subfield">
			<xsl:text>(</xsl:text>
			<xsl:for-each select="subfield">
				<xsl:choose>
					<xsl:when test="@code='a'">
						<xsl:value-of select="text()"/>	
					</xsl:when>
					<xsl:when test="contains('cdefhv', @code)">
						<xsl:choose>
							<xsl:when test="substring(text(),1,1) = string('=')">
								<xsl:text>&#x20;</xsl:text>	
							</xsl:when>
							<xsl:otherwise>
								<xsl:choose>
									<xsl:when test="@code='c'">
										<xsl:text>.&#x20;</xsl:text>
									</xsl:when>
									<xsl:when test="@code='d'">
										<xsl:text>&#x20;=&#x20;</xsl:text>
									</xsl:when>
									<xsl:when test="@code='e'">
										<xsl:text>&#x20;:&#x20;</xsl:text>
									</xsl:when>
									<xsl:when test="@code='f'">
										<xsl:text>&#x20;/&#x20;</xsl:text>
									</xsl:when>
									<xsl:when test="@code='h'">
										<xsl:text>.&#x20;</xsl:text>
									</xsl:when>
									<xsl:when test="@code='v'">
										<xsl:text>&#x20;;&#x20;</xsl:text>
									</xsl:when>
								</xsl:choose>	
							</xsl:otherwise>
						</xsl:choose>
						<xsl:value-of select="text()"/>	
					</xsl:when>
					<xsl:when test="@code='i'">
						<xsl:choose>
							<xsl:when test="preceding-sibling::subfield[1][@code='h']">
								<xsl:text>,&#x20;</xsl:text>	
							</xsl:when>
							<xsl:otherwise>
								<xsl:choose>
									<xsl:when test="substring(text(),1,1) = string('=')">
										<xsl:text>&#x20;</xsl:text>
									</xsl:when>
									<xsl:otherwise>
										<xsl:text>.&#x20;</xsl:text>
									</xsl:otherwise>
								</xsl:choose>
							</xsl:otherwise>
						</xsl:choose>
						<xsl:value-of select="text()"/>	
					</xsl:when>
					<xsl:when test="@code='x'">
						<xsl:text>,&#x20;ISSN&#x20;</xsl:text>	
						<xsl:value-of select="text()"/>	
					</xsl:when>
					<xsl:otherwise/>
				</xsl:choose>
			</xsl:for-each>
			<xsl:text>)</xsl:text>
		</xsl:if>
	</xsl:template>
	
</xsl:stylesheet>
