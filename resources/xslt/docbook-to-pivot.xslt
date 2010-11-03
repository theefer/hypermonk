<?xml version="1.0"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="xml" indent="yes" encoding="utf-8"
    doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"
    doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" />

<xsl:template match="book">
  <html>
    <xsl:apply-templates/>
  </html>
</xsl:template>

<xsl:template match="bookinfo">
  <head>
    <title><xsl:value-of select="$title"/></title>
    <meta name="author" content="{$author}" />
    <meta name="translator" content="{$translator}" />
    <meta name="publisher" content="{$publisher}" />
    <meta name="DC.date" scheme="DCTERMS.W3CDTF" content="{$publication_date}" />
    <meta name="DC.identifier" scheme="DCTERMS.URI" content="{$identifier}" />
  </head>
</xsl:template>

<!-- Ignore document title -->
<xsl:template match="/book/title"></xsl:template>

<xsl:template match="chapter">
  <body>
    <xsl:apply-templates/>
  </body>
</xsl:template>

<xsl:template match="para">
  <p><xsl:apply-templates/></p>
</xsl:template>

<xsl:template match="emphasis">
  <em><xsl:apply-templates/></em>
</xsl:template>

</xsl:stylesheet>
