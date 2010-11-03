<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" omit-xml-declaration="yes" encoding="utf-8" />

<!-- FIXME: arg, don't hardcode path! -->
<!-- <xsl:include href="file://{$xsl_path}/load-metadata-variables.xsl"/> -->
<xsl:include href="file:///media/debian/home/seb/anglemort/hypermonk/resources/xslt/load-metadata-variables.xsl"/>

<!-- identity transformation -->
<xsl:template match="node()|@*">
  <xsl:copy>
    <xsl:apply-templates select="@*"/>
    <xsl:apply-templates/>
  </xsl:copy>
</xsl:template>

<xsl:template match="html">
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="head">
  <xsl:text>&#xa;</xsl:text>
  <xsl:apply-templates select="title"/>
  <xsl:text>&#xa;</xsl:text>
  <xsl:apply-templates select="meta[@name='author']"/>
  <xsl:text>&#xa;&#xa;</xsl:text>
</xsl:template>

<!-- hide random meta elements -->
<xsl:template match="head/meta"></xsl:template>

<xsl:template match="head/title">
  <xsl:text>Title: </xsl:text>
  <xsl:apply-templates/>
</xsl:template>
<xsl:template match="head/meta[@name='author']">
  <xsl:text>Author: </xsl:text>
  <xsl:value-of select="@content"/>
</xsl:template>
<xsl:template match="head/meta[@name='translator']">
  <xsl:text>Translator: </xsl:text>
  <xsl:value-of select="@content"/>
</xsl:template>
<xsl:template match="head/meta[@name='DC.date']">
  <xsl:text>Publication date: </xsl:text>
  <xsl:value-of select="@content"/>
</xsl:template>

<!-- hide <p></p> if no attribute, separate with a blank line -->
<xsl:template match="body/p">
  <xsl:choose>
    <xsl:when test="not(@*)">
      <xsl:apply-templates/>
    </xsl:when>
    <xsl:otherwise>
      <xsl:copy>
        <xsl:apply-templates select="@*|node()"/>
      </xsl:copy>
    </xsl:otherwise>
  </xsl:choose>
  <xsl:text>&#xa;&#xa;</xsl:text>
</xsl:template>

<!-- by default, separate all children of body with a blank line -->
<xsl:template match="body/*">
  <xsl:copy>
    <xsl:apply-templates select="@*"/>
    <xsl:apply-templates/>
  </xsl:copy>
  <xsl:text>&#xa;&#xa;</xsl:text>
</xsl:template>

<!-- body with footnotes (if any) -->
<xsl:template match="body">
  <xsl:apply-templates select="*"/>

  <!-- end of fiction -->
  <xsl:if test="$publication_type = 'fiction'">
    <p class="end">&#9632;</p>
  </xsl:if>

  <xsl:if test="count(//span[@class='footnote']) > 0">
  <ol class="footnotes">
  <xsl:for-each select="//span[@class='footnote']">
    <xsl:variable name="n" select="position()"/>
    <li id="footnote-{$n}">
      <a href="#footnote-ref-{$n}" class="footnote-backref"><xsl:value-of select="$n"/></a>
      <span class="footnote-text"><xsl:apply-templates select="." mode="bottom"/></span>
    </li>
  </xsl:for-each>
  </ol>
  </xsl:if>
</xsl:template>

<xsl:template match="span[@class='footnote']">
  <xsl:variable name="n"><xsl:number level="any"/></xsl:variable>
  <a href="#footnote-{$n}" id="footnote-ref-{$n}" class="footnote-ref"><xsl:value-of select="$n"/></a>
</xsl:template>

</xsl:stylesheet>
