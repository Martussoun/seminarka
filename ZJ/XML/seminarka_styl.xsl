<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/users">
        <html>
            <head>
                <title>Databáze uživatelů</title>
                <style>
					.jmeno {
						display: inline-flex;
						gap: 5px;
					}

                    .prijmeni {
						display: inline-flex;
						gap: 5px;
                        margin-left: 3px;  
                        padding-left: 3px;
					}

					.border-with-padding-user {
						border: 8px solid black;
						padding: 2px;
                        background-color:aliceblue;
					}

                    .border-with-padding {
						border: 2px solid blue;
						padding: 2px;
                        flex-basis: 2px;
                        align-content: space-around;
                        gap: 10px 30px;
                        background-color: lightblue;
					}
                    .border-with-padding-wishlist {
						border: 5px dashed royalblue;
						padding: 2px;
                        flex-basis: 2px;
                        align-content: space-around;
                        gap: 10px 30px;
                        background-color:lightskyblue;
					}

					.oblibene {
						margin-left: 2px;
                        padding-left: 2px;
					}

                    .button-oblibene{
                        color: gold;
                        background-color:black;
                    }

					.group-title {
						display: inline-flex;
						align-items: center;
						gap: 3px;
					}

                    .spacer { 
                        margin-left: 5px;  
                        padding-left: 5px;  
                    }
                    .button-zanr{
                        color: lightblue;
                        background-color:navy;
                    }



                </style>
            </head>
            <body style="background-color:lightsteelblue">
                <h1>Uživatelé</h1>
                <xsl:for-each select="user">
                    <div class="border-with-padding-user">
                        <div class="card">
                            <h1 class="name">
                                <span>
                                    <xsl:value-of select="jmeno" />
                                </span>
                                <span class="prijmeni">
                                    <xsl:value-of select="prijmeni" />
                                </span>
                            </h1>
                            <ul type="square">
                                <li>Uživatelské jméno: <xsl:value-of select="uzivatelske_jmeno" />
                                </li>
                                <li>E-mail: <xsl:value-of select="email" />
                                </li>
                                <li>Telefonní číslo: <xsl:value-of select="mobil" />
                                </li>
                                
                            </ul>
                        </div>
                        <xsl:for-each select="platformy">
                            <h2>Užívané platformy</h2>
                            <xsl:for-each select="platforma">
                                <div class="border-with-padding">
                                    <div class="platforma">
                                        <h3>
                                            <xsl:value-of select="nazev" />
                                        </h3>
												Webová stránka:
                                                <xsl:value-of select="stranka" />
                                    </div>
                                </div>
                            </xsl:for-each>
                        </xsl:for-each>
                        <xsl:for-each select="hry">
                            <h2>Vlastněné hry</h2>
                            <xsl:for-each select="hra">
                                <div class="border-with-padding">
                                    <h3>
                                        <xsl:value-of select="titul" />
                                        <xsl:if test="@oblibene='true'">
                                            <span class="oblibene">
                                                <button class="button-oblibene">
                                                    Oblíbené
                                                </button>
                                            </span>
                                        </xsl:if>
                                    </h3>
                                    <b>
                                    Žánr:
                                        <button class="button-zanr">
                                             <xsl:value-of select="zanr" />
                                        </button>
                                    </b>
                                    <ul type="circle">
                                        <li>
											ID: <xsl:value-of select="id" />
                                        </li>
                                        <li>
											Rok vydání: <xsl:value-of select="rok_vydani" />
                                        </li>
                                        <li>
											Popis: <xsl:value-of select="popis" />
                                        </li>
                                        <li>
											cena:
                                            <xsl:value-of select="cena" />
                                            <span class="spacer">
                                                <xsl:value-of select="mena" />
                                            </span>
                                        </li>
                                    </ul>
                                </div>
                            </xsl:for-each>
                        </xsl:for-each>
                        <xsl:for-each select="wishlists">
                            <h2>Seznamy přání</h2>
                            <xsl:for-each select="wishlist">
                                <xsl:sort select="datum_vytvoreni" />
                                <div class="border-with-padding-wishlist">
                                    <h3>
                                        <xsl:value-of select="nazev" />
                                    </h3>
                                    <ul type="square">
                                        <li>
											ID: <xsl:value-of select="id" /> 
                                        </li>
                                        <li>
											Seznam vytvořen:
                                            <xsl:value-of select="datum_vytvoreni" />
                                        </li>
                                        <li>
											Veřejnost seznamu:
                                            <xsl:choose>
                                                <xsl:when test="@verejny='true'">
                                                    <span>Veřejně přístupný</span>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                    <span>Soukromý</span>
                                                </xsl:otherwise>
                                            </xsl:choose>
                                        </li>
                                        <li>
											Stav:
                                            <xsl:choose>
                                                <xsl:when test="@aktivni='true'">
                                                    <span>Aktivní</span> 
                                                </xsl:when>
                                                <xsl:otherwise>
                                                    <span>Odstraněn</span> 
                                                </xsl:otherwise>
                                            </xsl:choose>
                                        </li>
                                    </ul>
                                    <div class="groups">
                                        <xsl:for-each select="groups">
                                            <h3>Obsah:</h3>
                                            <xsl:for-each select="group">
                                                <div class="border-with-padding">
                                                    <div class="group-title">
                                                        <h3>
                                                            <xsl:value-of select="hra/titul" />
                                                        </h3>
                                                        <div class="kontrola">
                                                            <xsl:choose>
                                                                <xsl:when test="@vlastnictvi='true'">
                                                                    <span class="spacer">
                                                                        <button>
																			Vlastněno
                                                                        </button>
                                                                    </span>
                                                                </xsl:when>
                                                                <xsl:otherwise>
                                                                    <span class="spacer">
                                                                        <button>
																			Dostupné
                                                                        </button>
                                                                    </span>
                                                                </xsl:otherwise>
                                                            </xsl:choose>
                                                        </div>
                                                    </div>
                                                    <ul type="circle">
                                                        <li>
															ID:
                                                            <xsl:value-of select="id" />
                                                        </li>
                                                        <li>
															Cena:
                                                            <xsl:value-of select="hra/cena" />
                                                            <span class="spacer">
                                                            <xsl:value-of select="hra/mena" />
                                                            </span>
                                                        </li>
                                                    </ul>
                                                </div>
                                            </xsl:for-each>
                                        </xsl:for-each>
                                    </div>
                                </div>
                            </xsl:for-each>
                        </xsl:for-each>
                    </div>
                </xsl:for-each>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>