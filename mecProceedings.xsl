<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:ex="http://www.music-encoding.org/ns/mei/Examples"
  xmlns:mei="http://www.music-encoding.org/ns/mei" xmlns:xs="http://www.w3.org/2001/XMLSchema"
  exclude-result-prefixes="xs" version="1.0">

  <xsl:output method="html"/>

  <xsl:template match="/">
    <html xmlns="http://www.w3.org/1999/xhtml">
      <head>
        <title>
          <xsl:value-of select="mei:confSubmission/mei:title"/>
        </title>
        <meta charset="UTF-8"/>
        <style type="text/css">
          body{
            margin: 2em 4em 4em;
            font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif;
          }
          h1{
            font-size: 2.5em;
            font-weight: bold;
            margin: 0 0 1em 0;
            text-shadow: 0 .1em .3em rgba(0, 0, 0, 0.3);
          }
          h2{
            font-size: 1.4em;
            margin: 2em 0 .5em 0;
            text-transform: uppercase;
            color: #333333;
            text-shadow: 0 .1em .2em rgba(0, 0, 0, 0.2);
            font-weight: bold;
          }
          h3{
            font-size: 1.2em;
            margin: 2em 0 .5em 0;
            color: #333333;
            text-shadow: 0 .1em .2em rgba(0, 0, 0, 0.2);
            font-weight: bold;
          }
          h4{
            font-size: 1em;
            margin: 2em 0 .2em 1em;
            font-style: italic;
            color: #333333;
            text-shadow: 0 .1em .2em rgba(0, 0, 0, 0.2);
            font-weight: bold;
          }
          p{
            margin: .5em 0 .8em 1em;
          }
          .term{
            font-weight: bold;
            font-family: 'Courier New', Courier, monospace;
          }
          table{
            border: none;
            border-collapse: collapse;
            margin: 1em 0 0 0;
          }
          tr + tr td{
            border-top: .5px solid #999999;
          }
          td + td{
            border-left: .5px solid #999999;
          }
          td{
            padding: .5em;
            vertical-align: top;
          }
          .error{
            background-color: #ff4b4b;
            padding: 0 .2em;
          }
          span.bold{
            font-weight: bold;
          }
          span.underline{
            text-decoration: underline
          }
          span.italic{
            font-style: italic;
          }
          span.smcaps{
            font-variant: small-caps;
          }
          span.strike{
            text-decoration: line-through;
          }
          span.sub{
            font-size: .75em;
            line-height: 0;
            position: relative;
            vertical-align: baseline;
            bottom: -0.15em;
          }
          span.sup{
            font-size: .75em;
            line-height: 0;
            position: relative;
            vertical-align: baseline;
            top: -0.3em;
          }
          span.fixed-width,
          pre{
            font-family: 'Courier New', Courier, monospace;
          }
          .footnote-ref{
            font-size: .75em;
            line-height: 0;
            position: relative;
            vertical-align: baseline;
            top: -0.3em;
          }
          .footnote{
            position: relative;
            margin: 0 0 1em 4em;
          }
          .footnote-backref{
            position: absolute;
            top: 0;
            left: -2.5em;
            color: #000000;
            text-decoration: none;
            font-size: .75em;
            vertical-align: baseline;
            top: -0.3em;
          }
          pre{
            background-color: #f5f5f5;
            margin: 1em 0;
            border-radius: .5em;
            position: relative;
          }
          pre.valid:before{
            position: absolute;
            top: 0;
            left: 0;
            bottom: 0;
            width: 1em;
            background-color: #5dde5d;
            content: ' ';
            border-radius: .5em 0 0 .5em;
          }
          pre.invalid:before{
            position: absolute;
            top: 0;
            left: 0;
            bottom: 0;
            width: 1em;
            background-color: #de625d;
            content: ' ';
            border-radius: .5em 0 0 .5em;
          }
          pre.feasible:before{
            position: absolute;
            top: 0;
            left: 0;
            bottom: 0;
            width: 1em;
            background-color: #5db5de;
            content: ' ';
            border-radius: .5em 0 0 .5em;
          }
          .blockquote{
            margin: 1.5em 2em 2em;
            font-size: .9em;
          }
          .equation,
          .fig{
            margin: 1em 0 0 0;
          }
          img{
            max-width: 100%;
          }
          .caption{
            font-size: .9em;
            font-style: italic;
            margin: 0 0 1.5em 0;
          }
          li{
            margin: 0 0 .3em 0;
          }</style>
      </head>
      <xsl:apply-templates select="mei:confSubmission"/>
    </html>
  </xsl:template>

  <xsl:template match="mei:confSubmission">
    <body>
      <p
        style="margin: 0 0 1em 0; background-color: #e5e5e5; padding: 1em; border-radius: .5em; text-align: center;">
        <strong>Note:</strong> This page is a preview of a submission for the Music Encoding
        Conference Proceedings. It is not the final publication. </p>
      <h1>
        <xsl:apply-templates select="mei:title"/>
      </h1>
      <xsl:apply-templates select="mei:authorList"/>
      <xsl:apply-templates select="mei:abstract"/>
      <xsl:apply-templates select="mei:div"/>
      <div>
        <h2>Notes</h2>
        <xsl:choose>
          <xsl:when test="count(//mei:annot[not(ancestor::ex:egXML)]) &gt; 0">
            <xsl:apply-templates select="//mei:annot" mode="footnote"/>
          </xsl:when>
          <xsl:otherwise>
            <p>[Generated notes will go here.]</p>
          </xsl:otherwise>
        </xsl:choose>
      </div>
      <xsl:apply-templates select="mei:biblList"/>
    </body>
  </xsl:template>

  <xsl:template match="mei:authorList">
    <table width="100%">
      <tr>
        <xsl:for-each select="mei:authorData">
          <td>
            <strong><xsl:value-of select="mei:authorName/mei:famName"/>, <xsl:value-of
                select="mei:authorName/mei:foreName"/></strong>
            <br/>
            <span>
              <xsl:value-of select="mei:affiliation"/>
            </span>
            <br/>
            <a href="mailto:{mei:email}">
              <xsl:value-of select="mei:email"/>
            </a>
          </td>
        </xsl:for-each>
      </tr>
    </table>
  </xsl:template>

  <xsl:template match="mei:div | mei:abstract">
    <xsl:variable name="className">
      <xsl:choose>
        <xsl:when test="local-name() = 'abstract'">
          <xsl:value-of select="'abstract'"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="concat('div', (count(ancestor::mei:div) + 1))"/>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <div class="{$className}">
      <xsl:apply-templates/>
    </div>
  </xsl:template>

  <xsl:template match="mei:head">
    <xsl:choose>
      <xsl:when test="ancestor::mei:abstract">
        <h2>
          <xsl:apply-templates/>
        </h2>
      </xsl:when>
      <xsl:when test="count(ancestor::mei:div) >= 3">
        <h4>
          <xsl:apply-templates/>
        </h4>
      </xsl:when>
      <xsl:when test="count(ancestor::mei:div) = 2">
        <h3>
          <xsl:apply-templates/>
        </h3>
      </xsl:when>
      <xsl:when test="count(ancestor::mei:div) = 1">
        <h2>
          <xsl:apply-templates/>
        </h2>
      </xsl:when>
    </xsl:choose>
  </xsl:template>

  <xsl:template match="mei:p">
    <p>
      <xsl:apply-templates/>
    </p>
  </xsl:template>

  <xsl:template match="mei:ref">
    <xsl:variable name="target">
      <xsl:choose>
        <xsl:when test="@target">
          <xsl:value-of select="@target"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="text()"/>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <a href="{$target}">
      <xsl:apply-templates/>
    </a>
  </xsl:template>

  <xsl:template match="mei:rend">
    <span class="{@rend}">
      <xsl:choose>
        <xsl:when test="contains(@rend, 'quotedbl')">
          <xsl:text>"</xsl:text>
          <xsl:apply-templates/>
          <xsl:text>"</xsl:text>
        </xsl:when>
        <xsl:when test="contains(@rend, 'quote')">
          <xsl:text>'</xsl:text>
          <xsl:apply-templates/>
          <xsl:text>'</xsl:text>
        </xsl:when>
        <xsl:otherwise>
          <xsl:apply-templates/>
        </xsl:otherwise>
      </xsl:choose>
    </span>
  </xsl:template>

  <xsl:template match="mei:term">
    <span class="term">
      <xsl:apply-templates/>
    </span>
  </xsl:template>

  <xsl:template match="mei:annot">
    <xsl:variable name="number" select="count(preceding::mei:annot) + 1"/>
    <span class="footnote-ref">
      <a href="#footnote-{$number}" id="footnote-ref-{$number}">
        <xsl:value-of select="$number"/>
      </a>
      <xsl:if test="local-name(following-sibling::*[1]) = 'annot'">
        <xsl:text>, </xsl:text>
      </xsl:if>
    </span>
  </xsl:template>

  <xsl:template match="mei:annot" mode="footnote">
    <xsl:variable name="number" select="count(preceding::mei:annot) + 1"/>
    <div class="footnote" id="footnote-{$number}">
      <a class="footnote-backref" href="#footnote-ref-{$number}">
        <xsl:value-of select="$number"/>
      </a>
      <div class="footnote-content">
        <xsl:apply-templates/>
      </div>
    </div>
  </xsl:template>

  <xsl:template match="mei:biblList">
    <h2>Works Cited</h2>
    <xsl:apply-templates/>
  </xsl:template>

  <xsl:template match="mei:bibl">
    <span class="biblRef">
      <xsl:text>[</xsl:text>
      <xsl:choose>
        <xsl:when test="@target and @target = //mei:bibl/@xml:id">
          <a href="#{@target}">&#32; <xsl:value-of
              select="translate(@target, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ')"/>
            <xsl:choose>
              <xsl:when test="mei:biblScope[@from and @to]">
                <!-- range -->
                <xsl:value-of select="concat(',&#32;', mei:biblScope/@from, '-', mei:biblScope/@to)"
                />
              </xsl:when>
              <xsl:when test="mei:biblScope[@from]">
                <!-- single point  -->
                <xsl:value-of select="concat(',&#32;', mei:biblScope/@from)"/>
              </xsl:when>
              <xsl:when test="node() or text()">
                <!-- content of <bibl> instead of @from/@to -->
                <xsl:text>,&#32;</xsl:text>
                <xsl:apply-templates/>
              </xsl:when>
            </xsl:choose>
          </a>
        </xsl:when>
        <xsl:otherwise>
          <xsl:apply-templates/>
        </xsl:otherwise>
      </xsl:choose>
      <xsl:text>]</xsl:text>
    </span>
  </xsl:template>

  <xsl:template match="mei:biblList/mei:bibl">
    <div class="biblCite" id="{@xml:id}">
      <p>[<xsl:value-of
          select="translate(@xml:id, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ')"/>]
        <xsl:apply-templates/></p>
    </div>
  </xsl:template>

  <xsl:template match="mei:equation">
    <div class="equation">
      <xsl:apply-templates select="mei:graphic"/>
      <xsl:apply-templates select="mei:caption"/>
    </div>
  </xsl:template>

  <xsl:template match="mei:fig">
    <div class="fig">
      <xsl:apply-templates select="mei:graphic | ex:egXML"/>
      <xsl:apply-templates select="mei:caption"/>
    </div>
  </xsl:template>

  <xsl:template match="mei:graphic">
    <img src="{@target}"/>
  </xsl:template>

  <xsl:template match="mei:quote">
    <xsl:choose>
      <xsl:when test="parent::mei:div or @block = 'true'">
        <div class="blockquote">
          <xsl:apply-templates/>
        </div>
      </xsl:when>
      <xsl:otherwise>
        <xsl:apply-templates/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template match="mei:table">
    <table>
      <xsl:apply-templates/>
    </table>
  </xsl:template>

  <xsl:template match="mei:tr">
    <tr>
      <xsl:apply-templates/>
    </tr>
  </xsl:template>

  <xsl:template match="mei:th | mei:td">
    <xsl:element name="{local-name()}">
      <xsl:apply-templates/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="mei:caption">
    <xsl:variable name="counter">
      <xsl:choose>
        <xsl:when test="parent::mei:fig">
          <xsl:value-of select="concat('Figure ', count(preceding::mei:fig) + 1)"/>
        </xsl:when>
        <xsl:when test="parent::mei:equation">
          <xsl:value-of select="concat('Equation ', count(preceding::mei:fig) + 1)"/>
        </xsl:when>
        <xsl:when test="parent::mei:table">
          <xsl:value-of select="concat('Table ', count(preceding::mei:table) + 1)"/>
        </xsl:when>
      </xsl:choose>
    </xsl:variable>
    <xsl:choose>
      <xsl:when test="parent::mei:table">
        <caption>
          <xsl:value-of select="$counter"/>
          <xsl:if test="node() or text()">
            <xsl:text>: </xsl:text>
            <xsl:apply-templates/>
          </xsl:if>
        </caption>
      </xsl:when>
      <xsl:otherwise>
        <div class="caption">
          <xsl:value-of select="$counter"/>
          <xsl:if test="node() or text()">
            <xsl:text>: </xsl:text>
            <xsl:apply-templates/>
          </xsl:if>
        </div>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template match="mei:list">
    <xsl:choose>
      <xsl:when test="@form = 'ordered'">
        <ol>
          <xsl:apply-templates/>
        </ol>
      </xsl:when>
      <xsl:otherwise>
        <ul>
          <xsl:apply-templates/>
        </ul>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template match="mei:li">
    <li>
      <xsl:apply-templates/>
    </li>
  </xsl:template>

  <xsl:template match="mei:programCode">
    <pre><code><xsl:apply-templates/></code></pre>
  </xsl:template>

  <xsl:template match="ex:egXML">
    <xsl:variable name="class">
      <!--<xsl:choose>
        <xsl:when test="@valid = 'true'">
          <xsl:value-of select="'valid'"/>
        </xsl:when>
        <xsl:when test="@valid = 'false'">
          <xsl:value-of select="'invalid'"/>
        </xsl:when>
        <xsl:when test="@valid = 'feasible'">
          <xsl:value-of select="'feasible'"/>
        </xsl:when>
      </xsl:choose>-->
    </xsl:variable>
    <pre class="{$class}"><code><xsl:apply-templates mode="egXML"/></code></pre>
  </xsl:template>

  <xsl:template match="ex:egXML/ex:egXML" mode="egXML" priority="2">
    <xsl:variable name="attributes">
      <xsl:for-each select="@*">
        <xsl:call-template name="getAttribute"/>
      </xsl:for-each>
    </xsl:variable>
    <xsl:choose>
      <xsl:when test="child::node()">
        <xsl:value-of
          select="concat('&lt;', name(.), ' xmlns=&quot;http://www.music-encoding.org/ns/mei/Examples&quot;', $attributes, '&gt;')"/>
        <xsl:apply-templates mode="egXML"/>
        <xsl:value-of select="concat('&lt;/', name(.), '&gt;')"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of
          select="concat('&lt;', name(.), ' xmlns=&quot;http://www.music-encoding.org/ns/mei/Examples&quot;', $attributes, '/&gt;')"
        />
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template match="ex:programCode" mode="egXML">
    <xsl:text>&lt;programCode&gt;&#xA;</xsl:text>
    <xsl:variable name="content">
      <xsl:apply-templates mode="egXML"/>
    </xsl:variable>
    <xsl:value-of select="concat('&lt;![CDATA[', $content, ']]&gt;&#xA;')"/>
    <xsl:text>&lt;/programCode&gt;</xsl:text>
  </xsl:template>

  <xsl:template match="ex:*" mode="egXML">
    <xsl:variable name="attributes">
      <xsl:for-each select="@*">
        <xsl:call-template name="getAttribute"/>
      </xsl:for-each>
    </xsl:variable>
    <xsl:choose>
      <xsl:when test="child::node()">
        <xsl:value-of select="concat('&lt;', name(.), $attributes, '&gt;')"/>
        <xsl:apply-templates mode="egXML"/>
        <xsl:value-of select="concat('&lt;/', name(.), '&gt;')"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="concat('&lt;', name(.), $attributes, '/&gt;')"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template name="getAttribute">
    <xsl:value-of select="concat(' ', name(.), '=&quot;', string(.), '&quot;')"/>
  </xsl:template>

</xsl:stylesheet>
