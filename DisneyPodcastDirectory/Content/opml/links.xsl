<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:dpd="http://www.disneypodcastdirectory.net">
	<xsl:output omit-xml-declaration="yes"/>

	<xsl:template match="/">
	<!--
    <html>
    <body>
        This is an XSLT template file. Fill in this area with the
        XSL elements which will transform your XML to XHTML.
    -->
		<table border="1" cellpadding="1" cellspacing="0"   width="95%">
			<tr>
				<th>Site Name</th>
				<th>Link</th>
			</tr>
		<xsl:apply-templates select="//outline[@type='link']"> 
			<xsl:sort select="@sortname" case-order="lower-first" data-type="text" order="ascending"/>
		</xsl:apply-templates> 
		</table>
	<!--
	</body>
    </html>
	-->
</xsl:template>

	<xsl:template match="outline">
		<xsl:if test="@sortname!=''">
		<xsl:choose>
			<xsl:when test="@type='link'">
				<tr>
					<td align="left">
						<xsl:value-of select="@text" disable-output-escaping="yes"/>
					</td>
					<td>
						<a target="_blank">
							<xsl:attribute name="href">
								<xsl:value-of select="@htmlUrl" disable-output-escaping="yes"/>
							</xsl:attribute>
							<xsl:value-of select="@htmlUrl" disable-output-escaping="yes"/>
						</a>
					</td>
				</tr>
			</xsl:when>
		</xsl:choose>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet> 

