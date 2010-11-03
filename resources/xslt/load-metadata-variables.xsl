<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<!-- FIXME: what if multiple values, or comma separated? -->
<xsl:variable name="title" select="/html/head/title"/>
<xsl:variable name="author" select="/html/head/meta[@name='author']/@content"/>
<xsl:variable name="translator" select="/html/head/meta[@name='translator']/@content"/>
<xsl:variable name="subject" select="/html/head/meta[@name='subject']/@content"/>
<xsl:variable name="identifier" select="/html/head/meta[@name='DC.identifier']/@content"/>
<xsl:variable name="publication_type" select="/html/head/meta[@name='type']/@content"/>
<xsl:variable name="publication_date" select="/html/head/meta[@name='DC.date']/@content"/>
<xsl:variable name="publication_year" select="substring($publication_date, 0, 5)"/>

</xsl:stylesheet>
