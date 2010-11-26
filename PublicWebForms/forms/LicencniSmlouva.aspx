<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LicencniSmlouva.aspx.cs"
    Inherits="PublicWebForms.forms.LicencniSmlouva" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>REGISTRACE PROVOZOVATELE / POŘADATELE</title>
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
                        REGISTRACE PROVOZOVATELE / POŘADATELE</h1>
                </div>
                <div class="page">
                    <div class="splitter10">
                    </div>
                    <p>
                        Povinné položky formuláře jsou odlišeny <strong class="blue">modrým písmem</strong>.</p>
                    <h2 class="blue">
                        A) Provozovatel (pořadatel)</h2>
                    <table cellspacing="0">
                        <tr>
                            <th>
                                <label class="required">
                                    Název, jméno:</label>
                            </th>
                            <td colspan="3">
                                <asp:OsaTextBox runat="server" ID="tbNazev" CssClass="text" Width="360" MaxLength="300"
                                    DataType="String" IsRequired="true" ValidationGroup="formLicencniSmlova" ErrorMessage="Musíte zadat název nebo jméno!"></asp:OsaTextBox>
                            </td>
                        </tr>
                        <tr>
                            <th>
                                <label class="required">
                                    Ulice:</label>
                            </th>
                            <td colspan="3">
                                <asp:OsaTextBox runat="server" ID="tbUlice" CssClass="text" Width="360" MaxLength="300"
                                    DataType="String" IsRequired="true" ValidationGroup="formLicencniSmlova" ErrorMessage="Musíte zadat ulici!"></asp:OsaTextBox>
                            </td>
                        </tr>
                        <tr>
                            <th>
                                <label class="required">
                                    Město:</label>
                            </th>
                            <td>
                                <asp:OsaTextBox runat="server" ID="tbMesto" CssClass="text" Width="200" MaxLength="100"
                                    DataType="String" IsRequired="true" ValidationGroup="formLicencniSmlova" ErrorMessage="Musíte zadat město!"></asp:OsaTextBox>
                            </td>
                            <td>
                                <label class="required">
                                    PSČ:</label>
                            </td>
                            <td>
                                <asp:OsaTextBox runat="server" ID="tbPsc" CssClass="text" Width="80" MaxLength="5"
                                    DataType="Int32" MinLength="5" IsRequired="true" ValidationGroup="formLicencniSmlova"
                                    ErrorMessage="Musíte zadat PSČ!"></asp:OsaTextBox>
                            </td>
                        </tr>
                        <tr>
                            <th>
                                <label class="required">
                                    Právní forma:</label>
                            </th>
                            <td colspan="3">
                                <asp:OsaDropDownList runat="server" ID="ddlPravniForma" Width="365" ValidationGroup="formLicencniSmlova"
                                    ErrorMessage="Musíte vybrat právní formu!">
                                    <asp:ListItem>--Vyberte--</asp:ListItem>
                                    <asp:ListItem Value="101">Fyzická osoba</asp:ListItem>
                                    <asp:ListItem Value="112">Společnost s ručením omezeným</asp:ListItem>
                                    <asp:ListItem Value="117">Nadace a nadační fond</asp:ListItem>
                                    <asp:ListItem Value="121">Akciová společnost</asp:ListItem>
                                    <asp:ListItem Value="141">Obecně prospěšná společnost</asp:ListItem>
                                    <asp:ListItem Value="331">Příspěvková a rozpočtová organizace</asp:ListItem>
                                    <asp:ListItem Value="421">Zahraniční osoba</asp:ListItem>
                                    <asp:ListItem Value="601">Škola</asp:ListItem>
                                    <asp:ListItem Value="701">Sdružení</asp:ListItem>
                                    <asp:ListItem Value="711">Politická strana, politické hnutí</asp:ListItem>
                                    <asp:ListItem Value="807">Obec, obecní úřad</asp:ListItem>
                                    <asp:ListItem Value="111">Veřejná obchodní společnost</asp:ListItem>
                                    <asp:ListItem Value="205">Družstvo</asp:ListItem>
                                    <asp:ListItem Value="303">Státní podnik</asp:ListItem>
                                    <asp:ListItem Value="721">Církevní organizace</asp:ListItem>
                                    <asp:ListItem Value="000">Jiná</asp:ListItem>
                                </asp:OsaDropDownList>
                            </td>
                        </tr>
                        <tr>
                            <th>
                                <label>
                                    Jiná právní forma (jiná):</label>
                            </th>
                            <td colspan="3">
                                <asp:OsaTextBox runat="server" ID="tbJinaPravniForma" CssClass="text" Width="360"
                                    MaxLength="500" DataType="String" IsRequired="false" ValidationGroup="formLicencniSmlova"
                                    ErrorMessage="Musíte specifikovat jinou právní formu!" DDL_MustBeForRequire_ControlId="ddlPravniForma"
                                    DDL_MustBeForRequire_value="000"></asp:OsaTextBox>
                            </td>
                        </tr>
                        <tr>
                            <th>
                                <label class="required">
                                    IČ:</label>
                            </th>
                            <td colspan="3">
                                <asp:OsaTextBox runat="server" ID="tbIco" CssClass="text" Width="360" MinLength="8"
                                    MaxLength="15" DataType="Int32" IsRequired="true" ValidationGroup="formLicencniSmlova"
                                    ErrorMessage="Musíte zadat IČ!"></asp:OsaTextBox>
                            </td>
                        </tr>
                        <tr>
                            <th>
                                <label>
                                    DIČ:</label>
                            </th>
                            <td colspan="3">
                                <asp:TextBox runat="server" ID="tbDic" CssClass="text" Width="360" MaxLength="15"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <th>
                                <label class="required">
                                    Telefon:</label>
                            </th>
                            <td colspan="3">
                                <asp:OsaTextBox runat="server" ID="tbTelefon" CssClass="text" Width="360" MaxLength="13"
                                    DataType="RegExp" IsRequired="true" ValidationGroup="formLicencniSmlova" ErrorMessage="Musíte zadat telefonní číslo!"
                                    RegExp="^(\+420)? ?[0-9]{3} ?[0-9]{3} ?[0-9]{3}$"></asp:OsaTextBox>
                            </td>
                        </tr>
                        <tr>
                            <th>
                                <label class="required">
                                    E-mail:</label>
                            </th>
                            <td colspan="3">
                                <asp:OsaTextBox runat="server" ID="tbEmail" CssClass="text" Width="360" MaxLength="200"
                                    DataType="RegExp" IsRequired="true" ValidationGroup="formLicencniSmlova" ErrorMessage="Musíte zadat email!"
                                    RegExp="^[a-zA-Z][\w\.-]*[a-zA-Z0-9]@[a-zA-Z0-9][\w\.-]*[a-zA-Z0-9]\.[a-zA-Z][a-zA-Z\.]*[a-zA-Z]$"></asp:OsaTextBox>
                            </td>
                        </tr>
                        <tr>
                            <th>
                                <label>
                                    Zastoupený:<br />
                                    (u právnických osob)</label>
                            </th>
                            <td colspan="3">
                                <asp:OsaTextBox runat="server" ID="tbZastoupeny" CssClass="text" Width="360" MaxLength="300"
                                    DataType="String" IsRequired="false" ValidationGroup="formLicencniSmlova" ErrorMessage="Musíte zadat jméno zastupujícího!"></asp:OsaTextBox>
                            </td>
                        </tr>
                        <tr>
                            <th>
                                <label>
                                    Funkce:</label>
                            </th>
                            <td colspan="3">
                                <asp:TextBox runat="server" ID="tbFunkce" CssClass="text" Width="360" MaxLength="300"></asp:TextBox>
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
