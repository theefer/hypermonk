<?xml version="1.0"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="xml" indent="yes" encoding="utf-8"
    doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"
    doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" />

<!-- FIXME: arg, don't hardcode path! -->
<!-- <xsl:include href="file://{$xsl_path}/load-metadata-variables.xsl"/> -->
<xsl:include href="file:///media/debian/home/seb/anglemort/hypermonk/resources/xslt/load-metadata-variables.xsl"/>

<xsl:template match="/">
  <xsl:apply-templates select="html"/>
</xsl:template>

<xsl:template match="html">
<html>
  <xsl:apply-templates select="head"/>
  <body class="title">
    <xsl:if test="$publication_type != 'interview'">
      <h1><xsl:apply-templates select="$title"/></h1>
    </xsl:if>
    <xsl:if test="$publication_type = 'interview'">
      <h1>Interview&#xa0;:<br/><xsl:apply-templates select="$subject"/></h1>
    </xsl:if>

    <xsl:if test="$publication_type = 'fiction'">
      <h2><xsl:apply-templates select="$author"/></h2>
    </xsl:if>

    <xsl:if test="$standalone = '1'">
      <p class="logo"><img src="images/anglemort.jpg" alt="Angle Mort"/></p>
    </xsl:if>
  </body>
</html>
</xsl:template>

<xsl:template match="head">
<head>
  <!-- copy all headers -->
  <xsl:copy-of select="*"/>

  <link href="style/angle.css" type="text/css" rel="stylesheet" />
</head>
</xsl:template>

</xsl:stylesheet>
