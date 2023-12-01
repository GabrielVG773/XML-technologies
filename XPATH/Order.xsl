<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/">
		<html>
			<body>
				<h1>Order Information:</h1>
				<xsl:apply-templates />
				<br/><br/>
				<b>Total Number of items in the order: <xsl:value-of select="count(/Order/Item)"/></b>
				<b>Total price of the order:<xsl:value-of select="sum(/Order/Item/Price)"/></b>
			</body>
		</html>
	</xsl:template>

	<xsl:template match="/Order/CustomerName">
		<b>
			Customer Name:
			<xsl:value-of select="." />
		</b>
	</xsl:template>
	<xsl:template match="Item">
		<br />
		Order Id:
		<xsl:value-of select="../@id" />
		<br />
		Item Name:
		<xsl:value-of select="./ItemName" />
		<br />
		Price:
		<xsl:value-of select="./Price" />
		<xsl:if test="Price &gt; 100">
			(Eligible for free shipping)
		</xsl:if>
		<xsl:if test="Price &lt; 100">
			(Should be purchased with an item whose price is greater than 100 for
			free shipping)
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>