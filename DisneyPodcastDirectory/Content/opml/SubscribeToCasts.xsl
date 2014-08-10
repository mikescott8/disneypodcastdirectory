<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output omit-xml-declaration="yes"/>
	
<xsl:template match="/">
	<!--
    <html>
    <body>
        This is an XSLT template file. Fill in this area with the
        XSL elements which will transform your XML to XHTML.
    -->
		<table border="1" cellpadding="1" cellspacing="0" width="95%">
			<tr>
				<th>Podcast Name</th>
				<!--<th>Player<br/>Page</th>-->
				<th>RSS</th>
				<th>iTunes 1-Click</th>
				<th>Zune 1-Click</th>
				<th>Odeo</th>
			</tr>
		<xsl:apply-templates select="//outline[@type='rss']"> 
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
			<xsl:when test="@type='rss'">
				<tr>
					<td align="left">
						<xsl:value-of select="@text" disable-output-escaping="yes"/>
					</td>
<!--
					<td>
						<a>
							<xsl:attribute name="href">
								/Player.aspx?URL=<xsl:value-of select="@xmlUrl" disable-output-escaping="yes"/>
							</xsl:attribute>
							<img src="/images/playhere.gif" alt="Play Here" border="0"/>
						</a>
					</td>
-->
					<td>
						<a target="_blank">
							<xsl:attribute name="href">
								<xsl:value-of select="@xmlUrl" disable-output-escaping="yes"/>
							</xsl:attribute>
							<img src="/images/rss2.png" alt="RSS subscribe logo" border="0"/>
						</a>
					</td>
					<td>
						<a target="_blank">
							<xsl:attribute name="href">
								itpc<xsl:value-of select="substring(@xmlUrl,5)" disable-output-escaping="yes"/>
							</xsl:attribute>
							<img src="/images/rss-pod.png" alt="iTunes subscribe logo" border="0"/>
						</a>
					</td>
					<td>
						<a target="_blank">
							<xsl:attribute name="href">
								zune://subscribe/?<xsl:value-of select="@text" disable-output-escaping="yes"/>=<xsl:value-of select="@xmlUrl" disable-output-escaping="yes"/>
							</xsl:attribute>
							<img src="/images/zune_1click.gif" alt="Zune subscribe logo" border="0"/>
						</a>
					</td>
					<td>
						<a target="_blank">
							<xsl:attribute name="href">
								http://odeo.com/listen/subscribe?feed=<xsl:value-of select="@xmlUrl" disable-output-escaping="yes"/>
							</xsl:attribute>
							<img src="/images/odeoicon.gif" alt="Odeo subscribe logo" border="0"/>
						</a>
					</td>
				</tr>
			</xsl:when>
		</xsl:choose>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet> 

