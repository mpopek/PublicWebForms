<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Hlaseni.aspx.cs" Inherits="PublicWebForms.forms.Hlaseni" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>FORMULÁŘ PRO HLÁŠENÍ</title>
    <link href="../styles/registrace.css" rel="stylesheet" type="text/css" />
    <link href="../styles/uploader.css" rel="stylesheet" type="text/css" />
    <link href="../styles/jquery-ui.css" rel="stylesheet" type="text/css" />

    <script src="../scripts/jquery-1.4.2.min.js" type="text/javascript"></script>

    <script src="../scripts/jquery-ui-1.8.6.min.js" type="text/javascript"></script>

    <script language="javascript" type="text/javascript" src="../scripts/checkbox.js"></script>

    <script src="../scripts/maskinput.js" type="text/javascript"></script>

    <script src="../scripts/main.js" type="text/javascript"></script>

</head>
<body runat="server" id="body">
    <form id="form" runat="server">
    <asp:ScriptManager runat="server" ID="scriptManager">
    </asp:ScriptManager>
    <div id="page">
        <asp:MultiView runat="server" ID="mvForm" ActiveViewIndex="0">
            <asp:View runat="server" ID="viewForm">
                <div class="header">
                    <h1>
                        FORMULÁŘ PRO HLÁŠENÍ
                    </h1>
                </div>
                <div class="page">
                    <div class="splitter10">
                    </div>
                    <p>
                        Povinné položky formuláře jsou odlišeny <strong class="blue">modrým písmem</strong>.</p>
                    <table cellspacing="0">
                        <tr>
                            <th>
                                <label class="required">
                                    Název provozovatele/pořadatele:</label>
                            </th>
                            <td colspan="3">
                                <asp:OsaTextBox runat="server" ID="Nazev" CssClass="text" Width="360" MaxLength="100"
                                    IsRequired="true" DataType="String" ValidationGroup="formZadost"></asp:OsaTextBox>
                            </td>
                        </tr>
                        <tr>
                            <th>
                                <label class="required">
                                    Adresa:</label>
                            </th>
                            <td colspan="3">
                                <asp:OsaTextBox runat="server" ID="Adresa" CssClass="text" Width="360" MaxLength="100"
                                    IsRequired="true" Height="80" TextMode="MultiLine" DataType="String" ValidationGroup="formZadost"></asp:OsaTextBox>
                            </td>
                        </tr>
                        <tr>
                            <th>
                                <label class="required">
                                    Kontaktní osoba pro poskytnutí hlášení:</label>
                            </th>
                            <td colspan="3">
                                <asp:OsaTextBox runat="server" ID="KontektniOsoba" CssClass="text" Width="360" MaxLength="100"
                                    IsRequired="true" DataType="String" ValidationGroup="formZadost"></asp:OsaTextBox>
                            </td>
                        </tr>
                        <tr>
                            <th>
                                <label class="required">
                                    Telefon:</label>
                            </th>
                            <td colspan="3">
                                <asp:OsaTextBox runat="server" ID="Telefon" CssClass="text phone" Width="360" MaxLength="13"
                                    IsRequired="true" DataType="RegExp" RegExp="^(\+420)? ?[0-9]{3} ?[0-9]{3} ?[0-9]{3}$"
                                    ValidationGroup="formZadost"></asp:OsaTextBox>
                            </td>
                        </tr>
                        <tr>
                            <th>
                                <label class="required">
                                    E-mail:</label>
                            </th>
                            <td colspan="3">
                                <asp:OsaTextBox runat="server" ID="Email" CssClass="text" Width="360" MaxLength="100"
                                    IsRequired="true" DataType="RegExp" ValidationGroup="formZadost" RegExp="^[a-zA-Z][\w\.-]*[a-zA-Z0-9]@[a-zA-Z0-9][\w\.-]*[a-zA-Z0-9]\.[a-zA-Z][a-zA-Z\.]*[a-zA-Z]$"></asp:OsaTextBox>
                            </td>
                        </tr>
                        <tr>
                            <th>
                                <label class="required">
                                    Období, za které je podáváno hlášení:</label>
                            </th>
                            <td colspan="3">
                                <asp:OsaTextBox runat="server" ID="Obdobi" CssClass="text" Width="360" MaxLength="100"
                                    IsRequired="true" DataType="String" ValidationGroup="formZadost"></asp:OsaTextBox>
                            </td>
                        </tr>
                    </table>
                    <div class="splitter30">
                    </div>
                    <h2>
                        Filmové projekce se vstupným (nezahrnuje filmové festivaly)</h2>
                    <table cellspacing="1" class="grid">
                        <tr>
                            <th>
                                Číslo kina
                            </th>
                            <th>
                                Název
                            </th>
                            <th>
                                Adresa
                            </th>
                            <th>
                                Hrubé příjmy *
                            </th>
                        </tr>
                        <tr>
                            <td>
                                <asp:OsaTextBox runat="server" ID="FP_CisloKina1" CssClass="text numeric" Width="60"
                                    MaxLength="8" DataType="Int64"></asp:OsaTextBox>
                            </td>
                            <td>
                                <asp:TextBox runat="server" ID="FP_Nazev1" CssClass="text" Width="160" MaxLength="100"></asp:TextBox>
                            </td>
                            <td>
                                <asp:TextBox runat="server" ID="FP_Adresa1" CssClass="text" Width="220" MaxLength="100"></asp:TextBox>
                            </td>
                            <td>
                                <asp:TextBox runat="server" ID="FP_HrubePrijmy1" CssClass="text" Width="90" MaxLength="100"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:OsaTextBox runat="server" ID="FP_CisloKina2" CssClass="text numeric" Width="60"
                                    MaxLength="8" DataType="Int64"></asp:OsaTextBox>
                            </td>
                            <td>
                                <asp:TextBox runat="server" ID="FP_Nazev2" CssClass="text" Width="160" MaxLength="100"></asp:TextBox>
                            </td>
                            <td>
                                <asp:TextBox runat="server" ID="FP_Adresa2" CssClass="text" Width="220" MaxLength="100"></asp:TextBox>
                            </td>
                            <td>
                                <asp:TextBox runat="server" ID="FP_HrubePrijmy2" CssClass="text" Width="90" MaxLength="100"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:OsaTextBox runat="server" ID="FP_CisloKina3" CssClass="text numeric" Width="60"
                                    MaxLength="8" DataType="Int64"></asp:OsaTextBox>
                            </td>
                            <td>
                                <asp:TextBox runat="server" ID="FP_Nazev3" CssClass="text" Width="160" MaxLength="100"></asp:TextBox>
                            </td>
                            <td>
                                <asp:TextBox runat="server" ID="FP_Adresa3" CssClass="text" Width="220" MaxLength="100"></asp:TextBox>
                            </td>
                            <td>
                                <asp:TextBox runat="server" ID="FP_HrubePrijmy3" CssClass="text" Width="90" MaxLength="100"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:OsaTextBox runat="server" ID="FP_CisloKina4" CssClass="text numeric" Width="60"
                                    MaxLength="8" DataType="Int64"></asp:OsaTextBox>
                            </td>
                            <td>
                                <asp:TextBox runat="server" ID="FP_Nazev4" CssClass="text" Width="160" MaxLength="100"></asp:TextBox>
                            </td>
                            <td>
                                <asp:TextBox runat="server" ID="FP_Adresa4" CssClass="text" Width="220" MaxLength="100"></asp:TextBox>
                            </td>
                            <td>
                                <asp:TextBox runat="server" ID="FP_HrubePrijmy4" CssClass="text" Width="90" MaxLength="100"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:OsaTextBox runat="server" ID="FP_CisloKina5" CssClass="text numeric" Width="60"
                                    MaxLength="8" DataType="Int64"></asp:OsaTextBox>
                            </td>
                            <td>
                                <asp:TextBox runat="server" ID="FP_Nazev5" CssClass="text" Width="160" MaxLength="100"></asp:TextBox>
                            </td>
                            <td>
                                <asp:TextBox runat="server" ID="FP_Adresa5" CssClass="text" Width="220" MaxLength="100"></asp:TextBox>
                            </td>
                            <td>
                                <asp:TextBox runat="server" ID="FP_HrubePrijmy5" CssClass="text" Width="90" MaxLength="100"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:OsaTextBox runat="server" ID="FP_CisloKina6" CssClass="text numeric" Width="60"
                                    MaxLength="8" DataType="Int64"></asp:OsaTextBox>
                            </td>
                            <td>
                                <asp:TextBox runat="server" ID="FP_Nazev6" CssClass="text" Width="160" MaxLength="100"></asp:TextBox>
                            </td>
                            <td>
                                <asp:TextBox runat="server" ID="FP_Adresa6" CssClass="text" Width="220" MaxLength="100"></asp:TextBox>
                            </td>
                            <td>
                                <asp:TextBox runat="server" ID="FP_HrubePrijmy6" CssClass="text" Width="90" MaxLength="100"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:OsaTextBox runat="server" ID="FP_CisloKina7" CssClass="text numeric" Width="60"
                                    MaxLength="8" DataType="Int64"></asp:OsaTextBox>
                            </td>
                            <td>
                                <asp:TextBox runat="server" ID="FP_Nazev7" CssClass="text" Width="160" MaxLength="100"></asp:TextBox>
                            </td>
                            <td>
                                <asp:TextBox runat="server" ID="FP_Adresa7" CssClass="text" Width="220" MaxLength="100"></asp:TextBox>
                            </td>
                            <td>
                                <asp:TextBox runat="server" ID="FP_HrubePrijmy7" CssClass="text" Width="90" MaxLength="100"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:OsaTextBox runat="server" ID="FP_CisloKina8" CssClass="text numeric" Width="60"
                                    MaxLength="8" DataType="Int64"></asp:OsaTextBox>
                            </td>
                            <td>
                                <asp:TextBox runat="server" ID="FP_Nazev8" CssClass="text" Width="160" MaxLength="100"></asp:TextBox>
                            </td>
                            <td>
                                <asp:TextBox runat="server" ID="FP_Adresa8" CssClass="text" Width="220" MaxLength="100"></asp:TextBox>
                            </td>
                            <td>
                                <asp:TextBox runat="server" ID="FP_HrubePrijmy8" CssClass="text" Width="90" MaxLength="100"></asp:TextBox>
                            </td>
                        </tr>
                    </table>
                    <p>
                        * Po odečtení poplatku do Státního fondu pro podporu a rozvoj české kinematografie,
                        příp. příslušných místních poplatků a po odečtení DPH, pokud je provozovatel plátcem
                        DPH.</p>
                    <div class="splitter30">
                    </div>
                    <h2>
                        Filmové projekce bez vstupného (nezahrnuje filmové festivaly)</h2>
                    <table cellspacing="1" class="grid">
                        <tr>
                            <th>
                                Číslo kina
                            </th>
                            <th>
                                Název
                            </th>
                            <th>
                                Adresa
                            </th>
                            <th>
                                Celková<br />
                                návštěvnost **
                            </th>
                        </tr>
                        <tr>
                            <td>
                                <asp:OsaTextBox runat="server" ID="FPWO_CisloKina1" CssClass="text numeric" Width="60"
                                    MaxLength="8" DataType="Int64"></asp:OsaTextBox>
                            </td>
                            <td>
                                <asp:TextBox runat="server" ID="FPWO_Nazev1" CssClass="text" Width="160" MaxLength="100"></asp:TextBox>
                            </td>
                            <td>
                                <asp:TextBox runat="server" ID="FPWO_Adresa1" CssClass="text" Width="220" MaxLength="100"></asp:TextBox>
                            </td>
                            <td>
                                <asp:TextBox runat="server" ID="FPWO_CelkovaNavstevnost1" CssClass="text" Width="90"
                                    MaxLength="100"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:OsaTextBox runat="server" ID="FPWO_CisloKina2" CssClass="text numeric" Width="60"
                                    MaxLength="8" DataType="Int64"></asp:OsaTextBox>
                            </td>
                            <td>
                                <asp:TextBox runat="server" ID="FPWO_Nazev2" CssClass="text" Width="160" MaxLength="100"></asp:TextBox>
                            </td>
                            <td>
                                <asp:TextBox runat="server" ID="FPWO_Adresa2" CssClass="text" Width="220" MaxLength="100"></asp:TextBox>
                            </td>
                            <td>
                                <asp:TextBox runat="server" ID="FPWO_CelkovaNavstevnost2" CssClass="text" Width="90"
                                    MaxLength="100"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:OsaTextBox runat="server" ID="FPWO_CisloKina3" CssClass="text numeric" Width="60"
                                    MaxLength="8" DataType="Int64"></asp:OsaTextBox>
                            </td>
                            <td>
                                <asp:TextBox runat="server" ID="FPWO_Nazev3" CssClass="text" Width="160" MaxLength="100"></asp:TextBox>
                            </td>
                            <td>
                                <asp:TextBox runat="server" ID="FPWO_Adresa3" CssClass="text" Width="220" MaxLength="100"></asp:TextBox>
                            </td>
                            <td>
                                <asp:TextBox runat="server" ID="FPWO_CelkovaNavstevnost3" CssClass="text" Width="90"
                                    MaxLength="100"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:OsaTextBox runat="server" ID="FPWO_CisloKina4" CssClass="text numeric" Width="60"
                                    MaxLength="8" DataType="Int64"></asp:OsaTextBox>
                            </td>
                            <td>
                                <asp:TextBox runat="server" ID="FPWO_Nazev4" CssClass="text" Width="160" MaxLength="100"></asp:TextBox>
                            </td>
                            <td>
                                <asp:TextBox runat="server" ID="FPWO_Adresa4" CssClass="text" Width="220" MaxLength="100"></asp:TextBox>
                            </td>
                            <td>
                                <asp:TextBox runat="server" ID="FPWO_CelkovaNavstevnost4" CssClass="text" Width="90"
                                    MaxLength="100"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:OsaTextBox runat="server" ID="FPWO_CisloKina5" CssClass="text numeric" Width="60"
                                    MaxLength="8" DataType="Int64"></asp:OsaTextBox>
                            </td>
                            <td>
                                <asp:TextBox runat="server" ID="FPWO_Nazev5" CssClass="text" Width="160" MaxLength="100"></asp:TextBox>
                            </td>
                            <td>
                                <asp:TextBox runat="server" ID="FPWO_Adresa5" CssClass="text" Width="220" MaxLength="100"></asp:TextBox>
                            </td>
                            <td>
                                <asp:TextBox runat="server" ID="FPWO_CelkovaNavstevnost5" CssClass="text" Width="90"
                                    MaxLength="100"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:OsaTextBox runat="server" ID="FPWO_CisloKina6" CssClass="text numeric" Width="60"
                                    MaxLength="8" DataType="Int64"></asp:OsaTextBox>
                            </td>
                            <td>
                                <asp:TextBox runat="server" ID="FPWO_Nazev6" CssClass="text" Width="160" MaxLength="100"></asp:TextBox>
                            </td>
                            <td>
                                <asp:TextBox runat="server" ID="FPWO_Adresa6" CssClass="text" Width="220" MaxLength="100"></asp:TextBox>
                            </td>
                            <td>
                                <asp:TextBox runat="server" ID="FPWO_CelkovaNavstevnost6" CssClass="text" Width="90"
                                    MaxLength="100"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:OsaTextBox runat="server" ID="FPWO_CisloKina7" CssClass="text numeric" Width="60"
                                    MaxLength="8" DataType="Int64"></asp:OsaTextBox>
                            </td>
                            <td>
                                <asp:TextBox runat="server" ID="FPWO_Nazev7" CssClass="text" Width="160" MaxLength="100"></asp:TextBox>
                            </td>
                            <td>
                                <asp:TextBox runat="server" ID="FPWO_Adresa7" CssClass="text" Width="220" MaxLength="100"></asp:TextBox>
                            </td>
                            <td>
                                <asp:TextBox runat="server" ID="FPWO_CelkovaNavstevnost7" CssClass="text" Width="90"
                                    MaxLength="100"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:OsaTextBox runat="server" ID="FPWO_CisloKina8" CssClass="text numeric" Width="60"
                                    MaxLength="8" DataType="Int64"></asp:OsaTextBox>
                            </td>
                            <td>
                                <asp:TextBox runat="server" ID="FPWO_Nazev8" CssClass="text" Width="160" MaxLength="100"></asp:TextBox>
                            </td>
                            <td>
                                <asp:TextBox runat="server" ID="FPWO_Adresa8" CssClass="text" Width="220" MaxLength="100"></asp:TextBox>
                            </td>
                            <td>
                                <asp:TextBox runat="server" ID="FPWO_CelkovaNavstevnost8" CssClass="text" Width="90"
                                    MaxLength="100"></asp:TextBox>
                            </td>
                        </tr>
                    </table>
                    <p>
                        ** počet představení x maximální kapacita místa promítání</p>
                    <div class="splitter30">
                    </div>
                    <h2>
                        Filmový festival</h2>
                    <table cellspacing="1" class="grid">
                        <tr>
                            <th>
                                Název festivalu
                            </th>
                            <th>
                                Místo konání
                            </th>
                        </tr>
                        <tr>
                            <td>
                                <asp:TextBox runat="server" ID="NazevFestivalu1" CssClass="text" Width="280"></asp:TextBox>
                            </td>
                            <td>
                                <asp:TextBox runat="server" ID="MistoKonani1" CssClass="text" Width="280"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:TextBox runat="server" ID="NazevFestivalu2" CssClass="text" Width="280"></asp:TextBox>
                            </td>
                            <td>
                                <asp:TextBox runat="server" ID="MistoKonani2" CssClass="text" Width="280"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:TextBox runat="server" ID="NazevFestivalu3" CssClass="text" Width="280"></asp:TextBox>
                            </td>
                            <td>
                                <asp:TextBox runat="server" ID="MistoKonani3" CssClass="text" Width="280"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:TextBox runat="server" ID="NazevFestivalu4" CssClass="text" Width="280"></asp:TextBox>
                            </td>
                            <td>
                                <asp:TextBox runat="server" ID="MistoKonani4" CssClass="text" Width="280"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <table cellspacing="0">
                                    <tr>
                                        <td class="noline">
                                            filmové projekce <strong>se vstupným</strong> - Hrubé příjmy *
                                        </td>
                                        <td class="noline">
                                            <asp:TextBox runat="server" ID="FilmovaProjekceSeVstupnym" Width="180" CssClass="text"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="noline">
                                            filmové projekce <strong>bez vstupného</strong> - Celková návštěvnost ***
                                        </td>
                                        <td class="noline">
                                            <asp:TextBox runat="server" ID="FilmovaProjekceBezVstupnym" Width="180" CssClass="text"></asp:TextBox>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                    <p>
                        * Po odečtení poplatku do Státního fondu pro podporu a rozvoj české kinematografie,
                        příp. příslušných místních poplatků a po odečtení DPH, pokud je provozovatel plátcem
                        DPH.</p>
                    <p>
                        *** neprodejně šířené vstupenky</p>
                    <div class="splitter30">
                    </div>
                    <h2>
                        Ověření</h2>
                    <table cellspacing="0">
                        <tr>
                            <th>
                                (Klikněte na obrázek,<br />
                                pokud není čitelný)
                            </th>
                            <td>
                                <center>
                                    <asp:UpdatePanel runat="server" ID="upCaptcha" UpdateMode="Conditional">
                                        <ContentTemplate>
                                            <asp:LinkButton runat="server" ID="LinkButton3">
                                                <module:CaptchaControl runat="server" ID="captcha" CaptchaBackgroundNoise="None"
                                                    CaptchaLength="5" CaptchaHeight="60" CaptchaWidth="200" CaptchaLineNoise="None"
                                                    CaptchaMinTimeout="0" CaptchaMaxTimeout="3600" />
                                            </asp:LinkButton>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </center>
                            </td>
                        </tr>
                        <tr>
                            <th>
                                Opište prosím<br />
                                kontrolní kód zleva
                            </th>
                            <td>
                                <asp:OsaTextBox runat="server" ID="tbCaptcha" CssClass="text" Width="360" MaxLength="5"
                                    DataType="String" IsRequired="true" ValidationGroup="formZadost" ErrorMessage="Musíte opsat ověřovací kód!"
                                    Captcha="true"></asp:OsaTextBox>
                            </td>
                        </tr>
                    </table>
                    <p class="center blue">
                        <strong>
                            <asp:LinkButton runat="server" ID="LinkButton4" Text="registrovat" OnClick="Save"
                                ValidationGroup="formZadost"></asp:LinkButton>
                        </strong>
                    </p>
                    <div class="splitter30">
                    </div>
                    <p class="copyright">
                        OSA - Ochranný svaz autorský pro práva k dílům hudebním, o.s.<br />
                        Čs. armády 20, 160 56 Praha 6 &bull; T: +420 220 315 111 &bull; <a href="mailto:osa@osa.cz">
                            osa@osa.cz</a> &bull; <a href="http://www.osa.cz">www.osa.cz</a></p>
                </div>
            </asp:View>
            <asp:View runat="server" ID="viewComplete">
                <div class="header">
                    <h1>
                        FORMULÁŘ PRO HLÁŠENÍ</h1>
                </div>
                <div class="page">
                    <center>
                        BYLA ÚSPĚŠNĚ ODESLÁNA
                        <br />
                        <br />
                        <br />
                        <asp:LinkButton ID="LinkButton2" runat="server" OnClick="GoHome">Zpět</asp:LinkButton>
                    </center>
                </div>
            </asp:View>
            <asp:View runat="server" ID="viewError">
                <div class="header">
                    <h1>
                        FORMULÁŘ PRO HLÁŠENÍ</h1>
                </div>
                <div class="page">
                    <center>
                        NEBYLA BOHUŽEL Z TECHNICKÝCH DŮVODŮ ODESLÁNA. ZKUSTE TO PROSÍM POZDĚJI A NEBO SE
                        OBRAŤTE NA JEDNU Z INFOLINEK. OMLOUVÁME SE A DĚKUJEME ZA POCHOPENÍ.<br />
                        <br />
                        Infolinka: 220 315 200, 220 315 226 nebo 220 315 256
                        <br />
                        <br />
                        <br />
                        <asp:LinkButton ID="LinkButton1" runat="server" OnClick="GoHome">Zpět</asp:LinkButton>
                    </center>
                </div>
            </asp:View>
        </asp:MultiView>
    </div>
    </form>
</body>
</html>
