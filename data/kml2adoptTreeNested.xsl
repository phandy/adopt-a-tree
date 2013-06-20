<?xml version="1.0" encoding="UTF-8"?>
<!--
Transform Ottawa doc.kml to Postgres database format, for Tree Ottawa project
Author: Ken Webb (for Ecology Ottawa)
Date:   November 16, 2012
File:   kml2adoptTreeNested.xsl

Example of output:
Thing.create({lng: -75.74096329999999,lat: 45.38854140,city_id: 100011,tree_attributes: {ward_id: 15,addnum: 143,addstr: 'Buell',ltlocation_id: 0,rdlocation_id: 0,ownership_id: 0,park: false,species_id: 13,dbh: 21,treatment_id: 0,treatment_tagnum: 0,edible: false}})

To run using xsltproc on linux:
  xsltproc -o seedsTest.rb kml2adoptTreeNested.xsl docSed.kml
  xsltproc kml2adoptTreeNested.xsl sedOut.kml
  xsltproc -o seedsTest.rb kml2adoptTreeNested.xsl temp.kml
  xsltproc -o seedsTestE1.rb kml2adoptTreeNested.xsl temp.kml
  
To run with sed pre-processor (doesn't work):
  sed -f kml2adoptTree.sed odata0327/doc.kml | xsltproc -o seedsTest.rb kml2adoptTreeNested.xsl
Notes:
  The "kml" element in the input file must NOT contain any attributes.
  The "head" element must NOT contain unterminated "meta" elements.
-->

<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:output method="text" omit-xml-declaration="yes" indent="no"/>

<xsl:template match="kml">
  <xsl:apply-templates select="Document/Folder"/>
</xsl:template>

<xsl:template match="Folder">
  <xsl:text># Data from http://ottawa.ca/en/city_hall/statisticsdata/opendata/info/tree_inventory/index.htm&#10;&#10;</xsl:text>
  <xsl:apply-templates select="Placemark"/>
</xsl:template>

<xsl:template match="Placemark">
  <xsl:text>Thing.create({</xsl:text>
  <xsl:text>lng: </xsl:text>
  <xsl:value-of select="Point/lng"/>
  <xsl:text>,lat: </xsl:text>
  <xsl:value-of select="Point/lat"/>
  <xsl:text>,city_id: </xsl:text>
  <xsl:apply-templates select="description"/>
  <xsl:text>})&#10;</xsl:text>
</xsl:template>

<xsl:template match="description">
  <xsl:apply-templates select="html/body/table/tr/td/table"/>
</xsl:template>

<xsl:template match="table">
  <xsl:param name="ltlocation" select="tr[5]/td[2]"/>
  <xsl:param name="rdlocation" select="tr[6]/td[2]"/>
  <xsl:param name="ownership" select="tr[7]/td[2]"/>
  <xsl:param name="park" select="tr[8]/td[2]"/>
  <xsl:param name="treatment" select="tr[11]/td[2]"/>
  
  <xsl:value-of select="tr[1]/td[2]"/> <!-- FID -->
  <xsl:text>,tree_attributes: {</xsl:text>
  <xsl:text>ward_id: </xsl:text> <!-- WARD -->
  <xsl:value-of select="tr[2]/td[2]"/>
  <xsl:text>,addnum: </xsl:text> <!-- ADDNUM -->
  <xsl:value-of select="tr[3]/td[2]"/>
  <xsl:text>,addstr: "</xsl:text> <!-- ADDSTR -->
  <xsl:value-of select="tr[4]/td[2]"/>
  <xsl:text>"</xsl:text> <!-- ADDSTR -->
  
  <!-- LTLOCATION Front=1 Side=2 Oppos=3 Rear=4 N/A=0 -->
  <xsl:text>,ltlocation_id: </xsl:text>
  <xsl:choose>
    <xsl:when test="$ltlocation='Front'">1</xsl:when>
    <xsl:when test="$ltlocation='Side'">2</xsl:when>
    <xsl:when test="$ltlocation='Oppos'">3</xsl:when>
    <xsl:when test="$ltlocation='Rear'">4</xsl:when>
    <xsl:otherwise>0</xsl:otherwise>
  </xsl:choose>
  
  <!-- RDLOCATION Median=1 Boulevard=2 N/A=0 -->
  <xsl:text>,rdlocation_id: </xsl:text>
  <xsl:choose>
    <xsl:when test="$rdlocation='Median'">1</xsl:when>
    <xsl:when test="$rdlocation='Boulevard'">2</xsl:when>
    <xsl:otherwise>0</xsl:otherwise>
  </xsl:choose>
  
  <!-- OWNERSHIP City=1 Joint=2 -->
  <xsl:text>,ownership_id: </xsl:text>
  <xsl:choose>
    <xsl:when test="$ownership='City'">1</xsl:when>
    <xsl:when test="$ownership='Joint'">2</xsl:when>
    <xsl:otherwise>0</xsl:otherwise>
  </xsl:choose>
  
  <!-- PARK 0=false -1=true  ??? -->
  <xsl:text>,park: </xsl:text>
  <xsl:choose>
    <xsl:when test="$park='0'">false</xsl:when>
    <xsl:when test="$park='-1'">true</xsl:when>
    <xsl:otherwise>false</xsl:otherwise>
  </xsl:choose>
  
  <!-- SPECIES will be post-processed to convert species name into id -->
  <xsl:text>,species_id: </xsl:text>
  <xsl:value-of select="tr[9]/td[2]"/>
  
  <!-- DBH -->
  <xsl:text>,dbh: </xsl:text>
  <xsl:value-of select="tr[10]/td[2]"/>
  
  <!-- TREATMENT EAB=1 DED=2 -->
  <xsl:text>,treatment_id: </xsl:text>
  <xsl:choose>
    <xsl:when test="$treatment='EAB'">
      <xsl:text>1,treatment_tagnum: </xsl:text>
      <xsl:value-of select="tr[12]/td[2]"/>
    </xsl:when>
    <xsl:when test="$treatment='DED1'">
      <xsl:text>2,treatment_tagnum: </xsl:text>
      <xsl:value-of select="tr[13]/td[2]"/>
    </xsl:when>
    <xsl:otherwise>0</xsl:otherwise>
  </xsl:choose>
  
  <xsl:text>}</xsl:text>
</xsl:template>

</xsl:stylesheet>
