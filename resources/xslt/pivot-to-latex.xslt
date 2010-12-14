<?xml version="1.0"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="text" omit-xml-declaration="yes" disable-output-escaping="yes" />

<!-- FIXME: arg, don't hardcode path! -->
<!-- <xsl:include href="file://{$xsl_path}/load-metadata-variables.xsl"/> -->
<xsl:include href="file:///media/debian/home/seb/anglemort/hypermonk/resources/xslt/load-metadata-variables.xsl"/>

<xsl:template match="html">
<xsl:text>
% autogenerated LaTeX
\documentclass[a4paper]{article}

%\usepackage{ucs}
%\usepackage[utf8x]{inputenc}
\usepackage[utf8]{inputenc}
\usepackage[francais]{babel}
\usepackage{aeguill}
\usepackage{amssymb} % for blacksquare
\usepackage{url}
%\usepackage{eurosans} 
\usepackage{eurosym} 

% epigraphs
\usepackage{epigraph}
\setlength{\epigraphrule}{0pt}
\setlength{\epigraphwidth}{3.5in}


% strike
\usepackage{ulem}

% disable hyphenation
%\usepackage[none]{hyphenat}

\usepackage{graphicx}

% font
\usepackage[T1]{fontenc}
\usepackage{lmodern}
\usepackage{garamond}
%\usepackage{times}

% % line numbering
% \usepackage{lineno}
% %\linenumbers
% \pagewiselinenumbers
% \modulolinenumbers[5]

% line spacing
\usepackage{setspace}
%\doublespacing
%\onehalfspacing
\renewcommand{\baselinestretch}{1.8}

% horizontal margins
%% \oddsidemargin 0.9in 
%% \textwidth 4.7in
\oddsidemargin 0.6in 
\textwidth 5.1in

% vertical margins
\topmargin +0.2in
\headsep 0.4in
\textheight 8.7in 
</xsl:text>
<xsl:apply-templates select="head"/>
<xsl:text>
\title{\huge \thetitle}
\date{} % no date, if any, write after the text
</xsl:text>
<xsl:if test="$publication_type = 'fiction'">
<xsl:text>
\author{\theauthor}
</xsl:text>
</xsl:if>
<xsl:text>


% Headers
\usepackage{fancyhdr}
</xsl:text>
<xsl:if test="$publication_type = 'fiction'">
<xsl:text>
\lhead{\thetitle\ / \theauthor}
</xsl:text>
</xsl:if>
<xsl:if test="$publication_type != 'fiction'">
<xsl:text>
\lhead{\thetitle}
</xsl:text>
</xsl:if>
<xsl:text>
%% \rhead{Angle Mort}
% trick for better vertical alignment
\rhead{\begin{minipage}[c]{0.7in}\
    \includegraphics[scale=0.06]{anglemort.pdf}\
  \end{minipage}}

% PDF infos
\usepackage[pdfborder={0 0 0}, pdftitle={\thetitle}, pdfauthor={\theauthor}]{hyperref} 

\lfoot{}
\cfoot{\thepage\ /\pageref{LastPage}}
\rfoot{}
\pagestyle{fancy}

%% \renewcommand{\headrulewidth}{0pt}


\newcommand{\ellip}{\begin{center}%
$\ast\ast\ast$%
\end{center}}

% or \cdots, \times
\newcommand{\missing}{\textbf{$\gg$}}

% end square: \hfill$\square$
% ulem package?
% or FIN, END

\usepackage{setspace}
\newcommand{\theend}{\begin{flushright}$\blacksquare$\end{flushright}}
</xsl:text>

<xsl:apply-templates select="body"/>
</xsl:template>


<xsl:template match="head">
\newcommand{\thetitle}{<xsl:apply-templates select="title"/>}
\newcommand{\theauthor}{<xsl:apply-templates select="meta[@name='author']/@content"/>}
<!-- \newcommand{\theauthor}{<xsl:for-each select="meta[@name='author'][1]"> -->
<!--    <\!-- all this madness for comma/ampersand separated authors -\-> -->
<!--    <xsl:value-of select="@content"/> -->
<!--    <xsl:for-each select="following-sibling::*"> -->
<!--      <xsl:if test="position() != last()"> -->
<!--        <xsl:value-of select="concat(', ', @content)"/> -->
<!--      </xsl:if> -->
<!--      <xsl:if test="position() = last()"> -->
<!--        <xsl:value-of select="concat(' \&amp; ', @content)"/> -->
<!--      </xsl:if> -->
<!--    </xsl:for-each> -->
<!-- </xsl:for-each>} -->
</xsl:template>

<xsl:template match="body">
<xsl:text>
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Body
\begin{document}
\garamond
\fontsize{14pt}{14pt}
\selectfont

\maketitle
</xsl:text>

<xsl:apply-templates/>

<xsl:if test="$publication_type = 'fiction'">
<xsl:text>

\theend

</xsl:text>
</xsl:if>

<xsl:apply-templates select="div[contains(@class, 'meta') and contains(@class, 'post-text')]" mode="meta-post-text"/>

<!-- FIXME: ugly, but don't want to add a vspace unless there is something coming -->
<xsl:if test="$publication_type = 'interview' or $publication_type = 'editorial' or $translator or ($publication_type = 'fiction' and $standalone = '1' and ($publication_date_formatted or $license_type = 'cc_by_nc_nd_2'))">
\vspace{2em}
\begin{flushleft}
<xsl:if test="$standalone = '1'"> <!-- else preserve size -->
\small
</xsl:if>
<xsl:if test="$publication_type = 'interview'">
Interview réalisée par <xsl:apply-templates select="$author"/>\\
</xsl:if>
<xsl:if test="$publication_type = 'editorial'">
\begin{flushright}
<xsl:apply-templates select="$author"/>\\
\end{flushright}
</xsl:if>
<xsl:if test="$translator">
Traduction~: <xsl:apply-templates select="$translator"/>\\
</xsl:if>
<xsl:if test="$publication_type = 'fiction' and $standalone = '1'">
<xsl:if test="$publication_date_formatted">
Publication~: <xsl:value-of select="$publication_date_formatted"/>\\
</xsl:if>
<xsl:if test="$license_type = 'cc_by_nc_nd_2'">
Distribué sous les termes de la licence \textit{<xsl:value-of select="$license"/>}\\
URL~: \url{<xsl:apply-templates select="$identifier"/>}
\newline

\copyright~Copyright <xsl:value-of select="$publication_year"/>, <xsl:apply-templates select="$author"/>\\
</xsl:if>
</xsl:if>
\end{flushleft}
</xsl:if>
<xsl:text>

\label{LastPage}
\end{document}
</xsl:text>
</xsl:template>

<xsl:template match="blockquote">
\begin{quote}
<xsl:apply-templates/>
\end{quote}
<xsl:text>

</xsl:text>
</xsl:template>

<!-- FIXME: or global ? -->
<xsl:template match="p">
<xsl:apply-templates disable-output-escaping="yes"/>
<xsl:text>

</xsl:text>
</xsl:template>


<xsl:template match="p[@class='question']">
<xsl:if test="preceding-sibling::*">
<!-- FIXME: can use \newline instead? -->
\vspace{1em}
</xsl:if>
\textbf{<xsl:apply-templates disable-output-escaping="yes"/>}
<xsl:text>

</xsl:text>
</xsl:template>

<xsl:template match="div[@class='epigraph']">
\epigraph{<xsl:apply-templates select="blockquote/p/text()"/>}%
         {<xsl:apply-templates select="p/text()"/>}
<xsl:text>

</xsl:text>
</xsl:template>


<!-- hide "meta" divs by default -->
<!-- FIXME: substring matches meta? -->
<xsl:template match="div[contains(@class, 'meta')]"></xsl:template>

<xsl:template match="div[contains(@class, 'meta') and contains(@class, 'post-text')]" mode="meta-post-text">
  <xsl:apply-templates/>
  \vspace{1em}
</xsl:template>


<xsl:template match="br"><xsl:text>\\</xsl:text></xsl:template>

<xsl:template match="hr">
<xsl:text>
\ellip

</xsl:text>
</xsl:template>

<xsl:template match="span[@class='footnote']">
\footnote{<xsl:apply-templates disable-output-escaping="yes"/>}
</xsl:template>

<!-- <xsl:template match="em">\emph{<xsl:apply-templates/>}</xsl:template> -->
<xsl:template match="em">\textit{<xsl:apply-templates/>}</xsl:template>

<xsl:template match="strong">\textbf{<xsl:apply-templates/>}</xsl:template>

<xsl:template match="a">\href{<xsl:value-of select="@href"/>}{<xsl:apply-templates/>}</xsl:template>

</xsl:stylesheet>
