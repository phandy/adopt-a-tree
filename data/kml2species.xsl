<?xml version="1.0" encoding="UTF-8"?>
<!--
Transform Ottawa doc.kml to list of species, for Tree Ottawa project,
for seeding of species table 
Author: Ken Webb (for Ecology Ottawa)
Date:   November 6, 2012
File:   kml2species.xsl
Example of output:
  Species.create(:name => '', :edible => false)
To run using xsltproc on linux:
  xsltproc -o species.rb kml2species.xsl temp.kml
Then, to get a sorted unique list, do:
  sort -u species.rb > uspecies.rb
-->

<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:output method="text" omit-xml-declaration="yes" indent="no"/>

<xsl:template match="kml">
    <xsl:apply-templates select="Document/Folder"/>
</xsl:template>

<xsl:template match="Folder">
    <xsl:apply-templates select="Placemark"/>
</xsl:template>

<xsl:template match="Placemark">
    <xsl:text>Species.create(</xsl:text>
    <xsl:text>:name => '</xsl:text>
	<xsl:apply-templates select="description"/>
	<xsl:text>', :edible => false)&#10;</xsl:text>
</xsl:template>

<xsl:template match="description">
    <xsl:apply-templates select="html/body/table/tr/td/table"/>
</xsl:template>

<xsl:template match="table">
    <xsl:value-of select="tr[9]/td[2]"/> <!-- SPECIES -->
</xsl:template>

</xsl:stylesheet>
