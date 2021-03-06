<?xml version="1.0"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="//include">
   <h1>MAVLink Include Files</h1>
   <p><strong><em>Including files: </em><xsl:value-of select="." /></strong></p>
</xsl:template>

<xsl:template match="//enums">
   <h1>MAVLink Type Enumerations</h1>
   <xsl:apply-templates />
</xsl:template>

<xsl:template match="//messages">
   <h1>MAVLink Messages</h1>
   <xsl:apply-templates />
</xsl:template>

<xsl:template match="//message">
  
  <h2>
    <xsl:attribute name="class">mavlink_message_name</xsl:attribute>
    <xsl:attribute name="id"><xsl:value-of select="@name"/></xsl:attribute>
    <xsl:attribute name="name"><xsl:value-of select="@name"/></xsl:attribute>
  <xsl:value-of select="@name" /> (
   <a>
    <xsl:attribute name="href">
      #<xsl:value-of select="@name"/>
    </xsl:attribute>
   #<xsl:value-of select="@id" />
   </a>
   )</h2>  
  
   <p class="description"><xsl:value-of select="description" /></p>
   <table class="sortable">
   <thead>
   <tr>
     <th class="mavlink_field_header">Field Name</th>
     <th class="mavlink_field_header">Type</th>
     <th class="mavlink_field_header">Description</th>
   </tr>
   </thead>
   <tbody>
   <xsl:apply-templates select="field | extensions" />
  </tbody>
  </table>
</xsl:template>

<xsl:template match="//field | //extensions">
   <tr class="mavlink_field">
   <xsl:choose>
     <xsl:when test="not(@name)">
       <td class="mavlink_name_ext" valign="top">EXTENSIONS</td>
     </xsl:when>
     <xsl:otherwise>
       <td class="mavlink_name" valign="top"><xsl:value-of select="@name" /></td>
     </xsl:otherwise>
   </xsl:choose>
   <xsl:choose>
     <xsl:when test="not(@type)">
       <td class="mavlink_type" valign="top">-</td>
     </xsl:when>
     <xsl:otherwise>
       <td class="mavlink_type" valign="top"><xsl:value-of select="@type" /></td>
     </xsl:otherwise>
   </xsl:choose>

   <td class="mavlink_comment"><xsl:value-of select="." /></td>

   </tr>
</xsl:template>

<xsl:template match="//version">
   <h1>MAVLink Protocol Version</h1>
   <p>This file has protocol version: <xsl:value-of select="." />. The version numbers range from 1-255.</p>
</xsl:template>

<xsl:template match="//enum">
   <h2>
    <xsl:attribute name="name">ENUM_<xsl:value-of select="@name"/></xsl:attribute>
    <xsl:attribute name="id"><xsl:value-of select="@name"/></xsl:attribute>
    <xsl:attribute name="class">mavlink_message_name</xsl:attribute>
    <xsl:value-of select="@name" />
   </h2>

   <p class="description"><xsl:value-of select="description" /></p>
   <table class="sortable">
   <thead>
   <tr>
     <th class="mavlink_field_header">CMD ID</th>
     <th class="mavlink_field_header">Field Name</th>
     <th class="mavlink_field_header">Description</th>
   </tr>
   </thead>
   <tbody>
   <xsl:apply-templates select="entry" />
  </tbody>
  </table>
</xsl:template>

<xsl:template match="//entry">
   <tr class="mavlink_field" id="{@name}">
   <td class="mavlink_type" valign="top"><xsl:value-of select="@value" /></td>
   <td class="mavlink_name" valign="top"><xsl:value-of select="@name" /></td>
   <td class="mavlink_comment"><xsl:value-of select="description" /></td>
   </tr>   
</xsl:template>

<xsl:template match="//param">
   <tr>
   <td></td>
   <td class="mavlink_mission_param" valign="top">Mission Param #<xsl:value-of select="@index" /></td>
   <td class="mavlink_comment"><xsl:value-of select="." /></td>
   </tr>
</xsl:template>


</xsl:stylesheet>
