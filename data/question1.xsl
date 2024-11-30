<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" encoding="UTF-8" indent="yes"/>

    <xsl:template match="/">
        <html>
            <head>
                <meta charset="UTF-8"/>
                <style>
          table {
            border-collapse: collapse;
            width: 100%;
            margin: 20px 0;
          }
          th, td {
            border: 1px solid #ddd;
            padding: 12px;
            text-align: left;
            font-size: 14px;
          }
          th {
            background-color: #4CAF50;
            color: white;
            position: sticky;
            top: 0;
            z-index: 10;
          }
          tr:nth-child(even) {
            background-color: #f2f2f2;
          }
          tr:hover {
            background-color: #ddd;
          }
                </style>
            </head>
            <body>

                <div class="table-container">
                    <table>
                        <thead>
                            <tr>
                                <th>VIN (1-10)</th>
                                <th>County</th>
                                <th>City</th>
                                <th>State</th>
                                <th>Postal Code</th>
                                <th>Model Year</th>
                                <th>Make</th>
                                <th>Model</th>
                                <th>EV Type</th>
                                <th>CAFV Type</th>
                                <th>Electric Range</th>
                                <th>Base MSRP</th>
                                <th>Legislative District</th>
                                <th>DOL Vehicle ID</th>
                                <th>Vehicle Location</th>
                                <th>Electric Utility</th>
                                <th>Census Tract</th>
                            </tr>
                        </thead>
                        <tbody>
                            <xsl:for-each select="response/row/row[position() &lt;= 50]">
                                <tr>
                                    <td>
                                        <xsl:value-of select="vin_1_10"/>
                                    </td>
                                    <td>
                                        <xsl:value-of select="county"/>
                                    </td>
                                    <td>
                                        <xsl:value-of select="city"/>
                                    </td>
                                    <td>
                                        <xsl:value-of select="state"/>
                                    </td>
                                    <td>
                                        <xsl:value-of select="zip_code"/>
                                    </td>
                                    <td>
                                        <xsl:value-of select="model_year"/>
                                    </td>
                                    <td>
                                        <xsl:value-of select="make"/>
                                    </td>
                                    <td>
                                        <xsl:value-of select="model"/>
                                    </td>
                                    <td>
                                        <xsl:value-of select="ev_type"/>
                                    </td>
                                    <td>
                                        <xsl:value-of select="cafv_type"/>
                                    </td>
                                    <td>
                                        <xsl:value-of select="electric_range"/>
                                    </td>
                                    <td>
                                        <xsl:value-of select="base_msrp"/>
                                    </td>
                                    <td>
                                        <xsl:value-of select="legislative_district"/>
                                    </td>
                                    <td>
                                        <xsl:value-of select="dol_vehicle_id"/>
                                    </td>
                                    <td>
                                        <xsl:value-of select="geocoded_column"/>
                                    </td>
                                    <td>
                                        <xsl:value-of select="electric_utility"/>
                                    </td>
                                    <td>
                                        <xsl:value-of select="_2020_census_tract"/>
                                    </td>
                                </tr>
                            </xsl:for-each>
                        </tbody>
                    </table>
                </div>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>