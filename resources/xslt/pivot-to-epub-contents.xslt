<?xml version="1.0"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="xml" indent="yes" encoding="utf-8"
    doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"
    doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" />

<!-- FIXME: arg, don't hardcode path! -->
<!-- <xsl:include href="file://{$xsl_path}/load-metadata-variables.xsl"/> -->
<xsl:include href="file:///media/debian/home/seb/anglemort/hypermonk/resources/xslt/load-metadata-variables.xsl"/>


<!-- FIXME: exact copy of pivot? -->   
<xsl:template match="html">
<html>
  <xsl:apply-templates/>
</html>
</xsl:template>

<xsl:template match="head">
<head>
  <!-- copy all headers -->
  <xsl:copy-of select="*"/>
  <link href="style/angle.css" type="text/css" rel="stylesheet" />
</head>
</xsl:template>


<!-- identity transformation -->
<xsl:template match="/html/body//@*|/html/body//node()">
   <xsl:copy>
      <xsl:apply-templates select="@*|node()"/>
   </xsl:copy>
</xsl:template>


<xsl:template match="body">
<body>
  <xsl:apply-templates select="*"/>

  <!-- end of fiction -->
  <xsl:if test="$publication_type = 'fiction'">
    <p class="end">FIN</p>
  </xsl:if>

  <xsl:apply-templates select="div[contains(@class, 'meta') and contains(@class, 'post-text')]" mode="meta-post-text"/>

  <xsl:if test="$publication_type = 'editorial'">
    <p class="authors"><xsl:apply-templates select="$author"/></p>
  </xsl:if>

  <div class="publication_metadata">
    <xsl:if test="$publication_type = 'interview'">
      <p>Interview réalisée par <xsl:apply-templates select="$author"/></p>
    </xsl:if>
    <xsl:if test="$translator">
      <p>Traduction&nbsp;: <xsl:apply-templates select="$translator"/></p>
    </xsl:if>

    <xsl:if test="$publication_type = 'fiction' and $standalone = '1'">
      <xsl:if test="$publication_date_formatted">
        <p>Publication&nbsp;: <xsl:value-of select="$publication_date_formatted"/></p>
      </xsl:if>
      <xsl:if test="$license_type = 'cc_by_nc_nd_2'">
        <p>Distribué sous les termes de la licence <xsl:value-of select="$license"/></p>
        <p>URL&nbsp;: <a href="{$identifier}"><xsl:apply-templates select="$identifier"/></a></p>
        <p class="copyright">&#169; Copyright <xsl:value-of select="$publication_year"/><xsl:text>, </xsl:text><xsl:apply-templates select="$author"/></p>
      </xsl:if>
    </xsl:if>
  </div>



  <xsl:if test="count(//span[@class='footnote']) > 0">
  <ol class="footnotes">
  <xsl:for-each select="//span[@class='footnote']">
    <xsl:variable name="n" select="position()"/>
    <li id="footnote-{$n}">
      <a href="#footnote-ref-{$n}" class="footnote-backref"><xsl:value-of select="$n"/></a>
      <span class="footnote-text"><xsl:apply-templates /></span>
    </li>
  </xsl:for-each>
  </ol>
  </xsl:if>
</body>
</xsl:template>

<xsl:template match="span[@class='footnote']">
  <xsl:variable name="n"><xsl:number level="any"/></xsl:variable>
  <a href="#footnote-{$n}" id="footnote-ref-{$n}" class="footnote-ref"><xsl:value-of select="$n"/></a>
</xsl:template>

<!-- hide "meta" divs by default -->
<!-- FIXME: substring matches meta? -->
<xsl:template match="div[contains(@class, 'meta')]"></xsl:template>

<xsl:template match="div[contains(@class, 'meta') and contains(@class, 'post-text')]" mode="meta-post-text">
  <!-- FIXME: copy ?? -->
  <div class="post-text meta">
    <xsl:apply-templates/>
  </div>
</xsl:template>

<xsl:template match="div[contains(@class, 'meta') and contains(@class, 'post-text')]/div[@class = 'buy']/p[@class = 'issue']">
  <xsl:if test="$standalone = '1'">
    <!-- FIXME: copy ?? -->
    <p class="issue"><xsl:apply-templates/></p>
  </xsl:if>
</xsl:template>


</xsl:stylesheet>
