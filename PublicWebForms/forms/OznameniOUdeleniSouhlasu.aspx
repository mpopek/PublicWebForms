<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OznameniOUdeleniSouhlasu.aspx.cs"
    Inherits="PublicWebForms.forms.OznameniOUdeleniSouhlasu" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head" runat="server">
    <title>OZNÁMENÍ O UDĚLENÍ SOUHLASU K SYNCHRONIZACI</title>
    <link href="../styles/registrace.css" rel="stylesheet" type="text/css" />
        <link href="../styles/jquery-ui.css" rel="stylesheet" type="text/css" />

    <script src="../scripts/jquery-1.4.2.min.js" type="text/javascript"></script>

    <script src="../scripts/jquery-ui-1.8.6.min.js" type="text/javascript"></script>
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
                        OZNÁMENÍ O UDĚLENÍ SOUHLASU K SYNCHRONIZACI</h1>
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
                                    Název filmu, reklamního spotu, videa apod.:</label>
                            </th>
                            <td colspan="3">
                                <asp:OsaTextBox runat="server" ID="tbNazevFilmu" CssClass="text" Width="360" MaxLength="100"
                                    DataType="String" IsRequired="true" ValidationGroup="formLicencniSmlova" ErrorMessage="Musíte zadat název filmu, reklamního spotu, videa apod.!"></asp:OsaTextBox>
                            </td>
                        </tr>
                        <tr>
                            <th>
                                <label class="required">
                                    Název skladby:</label>
                            </th>
                            <td colspan="3">
                                <asp:OsaTextBox runat="server" ID="tbNazevSkladby" CssClass="text" Width="360" MaxLength="100"
                                    DataType="String" IsRequired="true" ValidationGroup="formLicencniSmlova" ErrorMessage="Musíte zadat název skladby!"></asp:OsaTextBox>
                            </td>
                        </tr>
                        <tr>
                            <th>
                                <label class="required">
                                    Autor/ři hudby:</label>
                            </th>
                            <td colspan="3">
                                <asp:OsaTextBox runat="server" ID="tbAutoriHudby" CssClass="text" Width="360" MaxLength="100"
                                    DataType="String" IsRequired="true" ValidationGroup="formLicencniSmlova" ErrorMessage="Musíte zadat autor/ry hudby!"></asp:OsaTextBox>
                            </td>
                        </tr>
                        <tr>
                            <th>
                                <label class="required">
                                    Autor/ři textu:</label>
                            </th>
                            <td colspan="3">
                                <asp:OsaTextBox runat="server" ID="tbAutoriTextu" CssClass="text" Width="360" MaxLength="100"
                                    DataType="String" IsRequired="true" ValidationGroup="formLicencniSmlova" ErrorMessage="Musíte zadat autor/ry textu!"></asp:OsaTextBox>
                            </td>
                        </tr>
                        <tr>
                            <th>
                                <label class="required">
                                    Nakladatel:</label>
                            </th>
                            <td colspan="3">
                                <asp:OsaTextBox runat="server" ID="tbNakladatel" CssClass="text" Width="360" MaxLength="100"
                                    DataType="String" IsRequired="true" ValidationGroup="formLicencniSmlova" ErrorMessage="Musíte zadat nakladatele!"></asp:OsaTextBox>
                            </td>
                        </tr>
                        <tr>
                            <th>
                                <label>
                                    Label / Číslo CD / Číslo tracku:</label>
                            </th>
                            <td colspan="3">
                                <asp:OsaTextBox runat="server" ID="tbLabel" CssClass="text" Width="360" MaxLength="100"
                                    DataType="String" IsRequired="false" ValidationGroup="formLicencniSmlova" ErrorMessage="Musíte zadat label / číslo CD / číslo tracku!"></asp:OsaTextBox>
                            </td>
                        </tr>
                        <tr>
                            <th>
                                <label>
                                    Zpracovatel hudby:</label>
                            </th>
                            <td colspan="3">
                                <asp:OsaTextBox runat="server" ID="tbZpracovatelHudby" CssClass="text" Width="360"
                                    MaxLength="100" DataType="String" IsRequired="false" ValidationGroup="formLicencniSmlova"
                                    ErrorMessage="Musíte zadat zpracovatele hudby!"></asp:OsaTextBox>
                            </td>
                        </tr>
                        <tr>
                            <th>
                                <label>
                                    Subtextař:</label>
                            </th>
                            <td colspan="3">
                                <asp:OsaTextBox runat="server" ID="tbSubtextar" CssClass="text" Width="360" MaxLength="100"
                                    DataType="String" IsRequired="false" ValidationGroup="formLicencniSmlova" ErrorMessage="Musíte zadat subtextare!"></asp:OsaTextBox>
                            </td>
                        </tr>
                        <tr>
                            <th>
                                <label class="required">
                                    Výrobce reklamního spotu<br />
                                    (nabyvatel licence)</label>
                            </th>
                            <td colspan="3">
                                <asp:OsaTextBox runat="server" ID="tbVyrobceReklamy" CssClass="text" Width="360"
                                    MaxLength="100" DataType="String" IsRequired="true" ValidationGroup="formLicencniSmlova"
                                    ErrorMessage="Musíte zadat výrobce reklamního spotu!"></asp:OsaTextBox>
                            </td>
                        </tr>
                        <tr>
                            <th>
                                <label class="required">
                                    Zadavatel (klient):</label>
                            </th>
                            <td colspan="3">
                                <asp:OsaTextBox runat="server" ID="tbZadavatel" CssClass="text" Width="360" MaxLength="100"
                                    DataType="String" IsRequired="true" ValidationGroup="formLicencniSmlova" ErrorMessage="Musíte zadat zadavatele!"></asp:OsaTextBox>
                            </td>
                        </tr>
                        <tr>
                            <th>
                                <label>
                                    Hudební stopáž:</label>
                            </th>
                            <td colspan="3">
                                <asp:OsaTextBox runat="server" ID="tbHudebniStopaz" CssClass="text" Width="360" MaxLength="100"
                                    DataType="String" IsRequired="false" ValidationGroup="formLicencniSmlova" ErrorMessage="Musíte zadat hudební stopáž!"></asp:OsaTextBox>
                            </td>
                        </tr>
                        <tr>
                            <th>
                                <label class="required">
                                    Druh užití:<br />
                                    film, reklama, video, jiné:</label>
                            </th>
                            <td colspan="3">
                                <asp:OsaTextBox runat="server" ID="tbDruhUziti" CssClass="text" Width="360" MaxLength="100"
                                    DataType="String" IsRequired="true" ValidationGroup="formLicencniSmlova" ErrorMessage="Musíte zadat druh užití!"></asp:OsaTextBox>
                            </td>
                        </tr>
                        <tr>
                            <th>
                                <label>
                                    Způsob užití:<br />
                                    rozhlas, televize, kina, jiné:</label>
                            </th>
                            <td colspan="3">
                                <asp:OsaTextBox runat="server" ID="tbZpusobUziti" CssClass="text" Width="360" MaxLength="100"
                                    DataType="String" IsRequired="false" ValidationGroup="formLicencniSmlova" ErrorMessage="Musíte zadat způsob užití!"></asp:OsaTextBox>
                            </td>
                        </tr>
                        <tr>
                            <th>
                                <label class="required">
                                    Souhlas udělil:</label>
                            </th>
                            <td colspan="3">
                                <asp:OsaTextBox runat="server" ID="tbSouhlasUdelil" CssClass="text" Width="360" MaxLength="100"
                                    DataType="String" IsRequired="true" ValidationGroup="formLicencniSmlova" ErrorMessage="Musíte zadat kdo udělil souhlas!"></asp:OsaTextBox>
                            </td>
                        </tr>
                        <tr>
                            <th>
                                <label>
                                    Doba trvání licence:</label>
                            </th>
                            <td colspan="3">
                                <asp:OsaTextBox runat="server" ID="tbDobaTrvaniLicence" CssClass="text" Width="360"
                                    MaxLength="100" DataType="String" IsRequired="false" ValidationGroup="formLicencniSmlova"
                                    ErrorMessage="Musíte zadat dobu trvání licence!"></asp:OsaTextBox>
                            </td>
                        </tr>
                        <tr>
                            <th>
                                <label>
                                    Poznámky:</label>
                            </th>
                            <td colspan="3">
                                <asp:OsaTextBox runat="server" ID="tbPoznamka" CssClass="text" Width="360" MaxLength="300"
                                    DataType="String" IsRequired="false" ValidationGroup="formLicencniSmlova" ErrorMessage="Musíte zadat poznámku!"></asp:OsaTextBox>
                            </td>
                        </tr>
                        <tr>
                            <th>
                                <label>
                                    E-mail pro potvrzení:</label>
                            </th>
                            <td colspan="3">
                                <asp:OsaTextBox runat="server" ID="tbEmailProPotvrzeni" CssClass="text" Width="360"
                                    MaxLength="100" DataType="RegExp" IsRequired="false" ValidationGroup="formLicencniSmlova"
                                    ErrorMessage="Musíte zadat email!" RegExp="^[a-zA-Z][\w\.-]*[a-zA-Z0-9]@[a-zA-Z0-9][\w\.-]*[a-zA-Z0-9]\.[a-zA-Z][a-zA-Z\.]*[a-zA-Z]$"></asp:OsaTextBox>
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
                                    <asp:UpdatePanel runat="server" ID="upForm" UpdateMode="Conditional">
                                        <ContentTemplate>
                                            <asp:LinkButton runat="server" ID="lbCaptcha">
                                                <module:CaptchaControl ID="captcha" runat="server" CaptchaBackgroundNoise="None"
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
                                    DataType="String" IsRequired="true" ValidationGroup="formLicencniSmlova" ErrorMessage="Musíte opsat ověřovací kód!"
                                    Captcha="true"></asp:OsaTextBox>
                            </td>
                        </tr>
                    </table>
                    <p class="center">
                        <strong>
                            <asp:LinkButton runat="server" ID="lbSave" Text="registrovat" OnClick="Save" ValidationGroup="formLicencniSmlova"></asp:LinkButton>
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
                        ON-LINE ŽÁDOST OSA NA UZAVŘENÍ LICENČNÍ SMLOUVY</h1>
                </div>
                <div class="page">
                    <center>
                        BYLA ÚSPĚŠNĚ ODESLÁNA
                        <br />
                        <br />
                        <br />
                        <asp:LinkButton ID="LinkButton1" runat="server" OnClick="GoHome">Zpět</asp:LinkButton>
                    </center>
                </div>
            </asp:View>
            <asp:View runat="server" ID="viewError">
                <div class="header">
                    <h1>
                        ON-LINE ŽÁDOST OSA NA UZAVŘENÍ LICENČNÍ SMLOUVY</h1>
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
                        <asp:LinkButton ID="LinkButton2" runat="server" OnClick="GoHome">Zpět</asp:LinkButton>
                    </center>
                </div>
            </asp:View>
        </asp:MultiView>
    </div>
    </form>
</body>
</html>
