<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HudebniSestava.aspx.cs"
    Inherits="PublicWebForms.forms.HudebniSestava" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>OZNÁMENÍ O SKLADBÁCH UŽITÝCH NA ZVUKOVÉM ČI ZVUKOVĚ-OBRAZOVÉM NOSIČI</title>
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
                        OZNÁMENÍ O SKLADBÁCH UŽITÝCH NA ZVUKOVÉM ČI ZVUKOVĚ-OBRAZOVÉM NOSIČI
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
                                    Vyrobce:</label>
                            </th>
                            <td colspan="3">
                                <asp:OsaTextBox runat="server" ID="Vyrobce" CssClass="text" Width="360" IsRequired="true"
                                    MaxLength="100" DataType="String" ValidationGroup="formZadost"></asp:OsaTextBox>
                            </td>
                        </tr>
                        <tr>
                            <th>
                                <label class="required">
                                    Název AV díla:</label>
                            </th>
                            <td colspan="3">
                                <asp:OsaTextBox runat="server" ID="NazevNosice" CssClass="text" Width="360" IsRequired="true"
                                    MaxLength="100" DataType="String" ValidationGroup="formZadost"></asp:OsaTextBox>
                            </td>
                        </tr>
                        <tr>
                            <th>
                                <label class="required">
                                    Režisér:</label>
                            </th>
                            <td colspan="3">
                                <asp:OsaTextBox runat="server" ID="Reziser" CssClass="text" Width="360" IsRequired="true"
                                    MaxLength="100" DataType="String" ValidationGroup="formZadost"></asp:OsaTextBox>
                            </td>
                        </tr>
                        <tr>
                            <th>
                                <label class="required">
                                    Druh nosiče:</label>
                            </th>
                            <td colspan="3">
                                <asp:OsaTextBox runat="server" ID="DruhNosice" CssClass="text" Width="360" IsRequired="true"
                                    MaxLength="100" DataType="String" ValidationGroup="formZadost"></asp:OsaTextBox>
                            </td>
                        </tr>
                        <tr>
                            <th>
                                <label class="required">
                                    Celková stopáž nosiče:</label>
                            </th>
                            <td colspan="3">
                                <asp:OsaTextBox runat="server" ID="CelkovaStopaz" CssClass="text" Width="360" IsRequired="true"
                                    MaxLength="15" DataType="String" ValidationGroup="formZadost"></asp:OsaTextBox>
                            </td>
                        </tr>
                    </table>
                    <div class="splitter30">
                    </div>
                    <h2>
                        Položky</h2>
                    <table cellspacing="0">
                        <tr>
                            <th>
                                <label>
                                    Číslo skladby:</label>
                            </th>
                            <td colspan="3">
                                <asp:TextBox runat="server" ID="CisloSkladby1" CssClass="text numeric" Width="360"
                                    MaxLength="10"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <th>
                                <label>
                                    Název skladby:<br />
                                    <span class="small">(originál název, popř. překlad)</span></label>
                            </th>
                            <td colspan="3">
                                <asp:TextBox runat="server" ID="NazevSkladby1" CssClass="text" Width="360" MaxLength="100"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <th>
                                <label>
                                    Stopáž:</label>
                            </th>
                            <td colspan="3">
                                <asp:TextBox runat="server" ID="MinutazSkladby1" CssClass="text" Width="360" MaxLength="15"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <th>
                                <label>
                                    Autor hudby:<br />
                                    <span class="small">(celé jméno)</span></label>
                            </th>
                            <td colspan="3">
                                <asp:TextBox runat="server" ID="AutorHudby1" CssClass="text" Width="360" MaxLength="100"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <th>
                                <label>
                                    Autor textu:<br />
                                    <span class="small">(celé jméno)</span></label>
                            </th>
                            <td colspan="3">
                                <asp:TextBox runat="server" ID="AutorTextu1" CssClass="text" Width="360" MaxLength="100"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <th>
                                <label>
                                    Autor úprav:</label>
                            </th>
                            <td colspan="3">
                                <asp:TextBox runat="server" ID="AutorUprav1" CssClass="text" Width="360" MaxLength="100"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <th>
                                <label>
                                    Interpret:</label>
                            </th>
                            <td colspan="3">
                                <asp:TextBox runat="server" ID="Interpret1" CssClass="text" Width="360" MaxLength="100"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <th>
                                <label>
                                    Název a rok vydání alba:</label>
                            </th>
                            <td colspan="3">
                                <asp:TextBox runat="server" ID="NazevARok1" CssClass="text" Width="360" MaxLength="100"></asp:TextBox>
                            </td>
                        </tr>
                    </table>
                    <div class="splitter10">
                    </div>
                    <table cellspacing="0">
                        <tr>
                            <th>
                                <label>
                                    Číslo skladby:</label>
                            </th>
                            <td colspan="3">
                                <asp:TextBox runat="server" ID="CisloSkladby2" CssClass="text numeric" Width="360"
                                    MaxLength="10"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <th>
                                <label>
                                    Název skladby:<br />
                                    <span class="small">(originál název, popř. překlad)</span></label>
                            </th>
                            <td colspan="3">
                                <asp:TextBox runat="server" ID="NazevSkladby2" CssClass="text" Width="360" MaxLength="100"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <th>
                                <label>
                                    Stopáž:</label>
                            </th>
                            <td colspan="3">
                                <asp:TextBox runat="server" ID="MinutazSkladby2" CssClass="text" Width="360" MaxLength="15"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <th>
                                <label>
                                    Autor hudby:<br />
                                    <span class="small">(celé jméno)</span></label>
                            </th>
                            <td colspan="3">
                                <asp:TextBox runat="server" ID="AutorHudby2" CssClass="text" Width="360" MaxLength="100"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <th>
                                <label>
                                    Autor textu:<br />
                                    <span class="small">(celé jméno)</span></label>
                            </th>
                            <td colspan="3">
                                <asp:TextBox runat="server" ID="AutorTextu2" CssClass="text" Width="360" MaxLength="100"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <th>
                                <label>
                                    Autor úprav:</label>
                            </th>
                            <td colspan="3">
                                <asp:TextBox runat="server" ID="AutorUprav2" CssClass="text" Width="360" MaxLength="100"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <th>
                                <label>
                                    Interpret:</label>
                            </th>
                            <td colspan="3">
                                <asp:TextBox runat="server" ID="Interpret2" CssClass="text" Width="360" MaxLength="100"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <th>
                                <label>
                                    Název a rok vydání alba:</label>
                            </th>
                            <td colspan="3">
                                <asp:TextBox runat="server" ID="NazevARok2" CssClass="text" Width="360" MaxLength="100"></asp:TextBox>
                            </td>
                        </tr>
                    </table>
                    <div class="splitter10">
                    </div>
                    <table cellspacing="0">
                        <tr>
                            <th>
                                <label>
                                    Číslo skladby:</label>
                            </th>
                            <td colspan="3">
                                <asp:TextBox runat="server" ID="CisloSkladby3" CssClass="text numeric" Width="360"
                                    MaxLength="10"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <th>
                                <label>
                                    Název skladby:<br />
                                    <span class="small">(originál název, popř. překlad)</span></label>
                            </th>
                            <td colspan="3">
                                <asp:TextBox runat="server" ID="NazevSkladby3" CssClass="text" Width="360" MaxLength="100"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <th>
                                <label>
                                    Stopáž:</label>
                            </th>
                            <td colspan="3">
                                <asp:TextBox runat="server" ID="MinutazSkladby3" CssClass="text" Width="360" MaxLength="15"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <th>
                                <label>
                                    Autor hudby:<br />
                                    <span class="small">(celé jméno)</span></label>
                            </th>
                            <td colspan="3">
                                <asp:TextBox runat="server" ID="AutorHudby3" CssClass="text" Width="360" MaxLength="100"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <th>
                                <label>
                                    Autor textu:<br />
                                    <span class="small">(celé jméno)</span></label>
                            </th>
                            <td colspan="3">
                                <asp:TextBox runat="server" ID="AutorTextu3" CssClass="text" Width="360" MaxLength="100"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <th>
                                <label>
                                    Autor úprav:</label>
                            </th>
                            <td colspan="3">
                                <asp:TextBox runat="server" ID="AutorUprav3" CssClass="text" Width="360" MaxLength="100"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <th>
                                <label>
                                    Interpret:</label>
                            </th>
                            <td colspan="3">
                                <asp:TextBox runat="server" ID="Interpret3" CssClass="text" Width="360" MaxLength="100"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <th>
                                <label>
                                    Název a rok vydání alba:</label>
                            </th>
                            <td colspan="3">
                                <asp:TextBox runat="server" ID="NazevARok3" CssClass="text" Width="360" MaxLength="100"></asp:TextBox>
                            </td>
                        </tr>
                    </table>
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
                        OZNÁMENÍ O SKLADBÁCH UŽITÝCH NA ZVUKOVÉM ČI ZVUKOVĚ-OBRAZOVÉM NOSIČI</h1>
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
                        OZNÁMENÍ O SKLADBÁCH UŽITÝCH NA ZVUKOVÉM ČI ZVUKOVĚ-OBRAZOVÉM NOSIČI</h1>
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