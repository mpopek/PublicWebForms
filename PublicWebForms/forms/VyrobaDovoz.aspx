<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="VyrobaDovoz.aspx.cs" Inherits="PublicWebForms.forms.VyrobaDovoz" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>VÝROBA, DOVOZ A PŘIJÍMÁNÍ NENAHRANÝCH NOSIČŮ A PŘÍSTROJŮ K ROZMNOŽOVÁNÍ</title>
    <link href="../styles/registrace.css" rel="stylesheet" type="text/css" />
    <link href="../styles/uploader.css" rel="stylesheet" type="text/css" />

        <link href="../styles/jquery-ui.css" rel="stylesheet" type="text/css" />

    <script src="../scripts/jquery-1.4.2.min.js" type="text/javascript"></script>

    <script src="../scripts/jquery-ui-1.8.6.min.js" type="text/javascript"></script>

    <script src="../scripts/main.js" type="text/javascript"></script>

    <script src="../scripts/maskinput.js" type="text/javascript"></script>

    <script language="javascript" type="text/javascript" src="../scripts/checkbox.js"></script>

    <script src="../modules/uploader/swfobject.js" type="text/javascript"></script>

    <script src="../modules/uploader/uploader.js" type="text/javascript" charset="windows-1250"></script>

</head>
<body runat="server" id="body">
    <form id="form" runat="server">
    <asp:ScriptManager runat="server" ID="scriptManager">
        <Services>
            <asp:ServiceReference Path="~/modules/uploader/uploader.asmx" />
        </Services>
    </asp:ScriptManager>
    <div id="page">
        <asp:MultiView runat="server" ID="mvForm" ActiveViewIndex="0">
            <asp:View runat="server" ID="viewForm">
                <div class="header">
                    <h1>
                        VÝROBA, DOVOZ A PŘIJÍMÁNÍ NENAHRANÝCH NOSIČŮ A PŘÍSTROJŮ K ROZMNOŽOVÁNÍ</h1>
                </div>
                <div class="page">
                    <div class="splitter10">
                    </div>
                    <p>
                        Povinné položky formuláře jsou odlišeny <strong class="blue">modrým písmem</strong>.</p>
                    <h2>
                        Údaje o subjektu:</h2>
                    <table cellspacing="0">
                        <tr>
                            <th>
                                <label class="required">
                                    Název subjektu:</label>
                            </th>
                            <td colspan="3">
                                <asp:OsaTextBox runat="server" ID="tbNazevSubjektu" CssClass="text" Width="360" MaxLength="100"
                                    DataType="String" IsRequired="true" ValidationGroup="formLicencniSmlova" ErrorMessage="Musíte zadat název subjektu!"></asp:OsaTextBox>
                            </td>
                        </tr>
                        <tr>
                            <th>
                                <label class="required">
                                    Sídlo:</label>
                            </th>
                            <td colspan="3">
                                <asp:OsaTextBox runat="server" ID="tbSidlo" CssClass="text" Width="360" MaxLength="300"
                                    TextMode="MultiLine" Height="80" DataType="String" IsRequired="true" ValidationGroup="formLicencniSmlova"
                                    ErrorMessage="Musíte zadat sídlo!"></asp:OsaTextBox>
                            </td>
                        </tr>
                        <tr>
                            <th>
                                <label class="required">
                                    IČ:</label>
                            </th>
                            <td colspan="3">
                                <asp:OsaTextBox runat="server" ID="tbIC" CssClass="text numeric" Width="360" MaxLength="8"
                                    MinLength="8" DataType="Int64" IsRequired="true" ValidationGroup="formLicencniSmlova"
                                    ErrorMessage="Musíte zadat IČ!"></asp:OsaTextBox>
                            </td>
                        </tr>
                        <tr>
                            <th>
                                <label>
                                    DIČ:</label>
                            </th>
                            <td colspan="3">
                                <asp:OsaTextBox runat="server" ID="tbDIC" CssClass="text" Width="360" MaxLength="15"
                                    DataType="String" IsRequired="false" ValidationGroup="formLicencniSmlova" ErrorMessage="Musíte zadat DIČ!"></asp:OsaTextBox>
                            </td>
                        </tr>
                        <tr>
                            <th>
                                <label class="required">
                                    Zastupující osoba, funkce:</label>
                            </th>
                            <td colspan="3">
                                <asp:OsaTextBox runat="server" ID="tbZastupujiciOsoba" CssClass="text" Width="360"
                                    MaxLength="100" DataType="String" IsRequired="true" ValidationGroup="formLicencniSmlova"
                                    ErrorMessage="Musíte zadat zastupuící osobu a její funkci!"></asp:OsaTextBox>
                            </td>
                        </tr>
                        <tr>
                            <th>
                                <label>
                                    Zápis v rejstříku:</label>
                            </th>
                            <td colspan="3">
                                <asp:OsaTextBox runat="server" ID="tbZapisVRejstriku" CssClass="text" Width="360"
                                    MaxLength="100" DataType="String" IsRequired="false" ValidationGroup="formLicencniSmlova"
                                    ErrorMessage="Musíte zadat zápis v rejstříku!"></asp:OsaTextBox>
                            </td>
                        </tr>
                        <tr>
                            <th>
                                <label class="required">
                                    Kontaktní osoba:</label>
                            </th>
                            <td colspan="3">
                                <asp:OsaTextBox runat="server" ID="tbKontaktniOsoba" CssClass="text" Width="360"
                                    MaxLength="100" DataType="String" IsRequired="true" ValidationGroup="formLicencniSmlova"
                                    ErrorMessage="Musíte zadat kontaktní osobu!"></asp:OsaTextBox>
                            </td>
                        </tr>
                        <tr>
                            <th>
                                <label class="required">
                                    Telefon:</label>
                            </th>
                            <td colspan="3">
                                <asp:OsaTextBox runat="server" ID="tbTelefon" CssClass="text phone" Width="360" MaxLength="13"
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
                                    Fax:</label>
                            </th>
                            <td colspan="3">
                                <asp:OsaTextBox runat="server" ID="tbFax" CssClass="text" Width="360" MaxLength="100"
                                    DataType="String" IsRequired="false" ValidationGroup="formLicencniSmlova" ErrorMessage="Musíte zadat fax!"></asp:OsaTextBox>
                            </td>
                        </tr>
                        <tr>
                            <th>
                                <label class="required">
                                    Kontaktní adresa:</label>
                            </th>
                            <td colspan="3">
                                <asp:OsaTextBox runat="server" ID="tbKontaktniAdresa" CssClass="text" Width="360"
                                    MaxLength="300" TextMode="MultiLine" Height="80" DataType="String" IsRequired="true"
                                    ValidationGroup="formLicencniSmlova" ErrorMessage="Musíte zadat kontaktní adresu!"></asp:OsaTextBox>
                            </td>
                        </tr>
                    </table>
                    <p>
                        Fyzické osoby - nepodnikatelé vyplní jméno a příjmení ("Název subjektu"), adresu
                        trvalého bydliště ("Sídlo"), datum narození ("IČO") a kontaktní údaje ("Telefon",
                        "E-mail").</p>
                    <div class="splitter30">
                    </div>
                    <h2>
                        Údaje o nosičích</h2>
                    <table cellspacing="0">
                        <tr>
                            <td colspan="2">
                                <p>
                                    Součástí tohoto formuláře je soubor
                                    <asp:HyperLink runat="server" ID="download" Target="_blank" Font-Bold="true" NavigateUrl="~/data/formular_hlaseni_o_dovozu.doc">přehled o dovozech či výrobě >>></asp:HyperLink>
                                </p>
                                <table class="file" cellspacing="0">
                                    <tr>
                                        <td>
                                            stáhněte si ho na svůj disk, vyplňte a přiložte k formuláři&nbsp;
                                        </td>
                                        <td>
                                            <module:Uploader runat="server" ID="uploader" UploadFlashPath="~/modules/uploader/uploader.swf"
                                                FolderForSave="temp" MultipleUploads="false" ChooseImageButtonPath="~/images/btnUpload.png"
                                                QueueUncompletePanelId="queueUncomplete" QueueCompletePanelId="queueComplete"
                                                FileExtensionsDescription="Seznam" FileExtensions="doc,rtf,txt,xls,jpg,gif,pdf" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2">
                                            <div id="queueComplete">
                                            </div>
                                            <div id="queueUncomplete">
                                            </div>
                                        </td>
                                    </tr>
                                </table>
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
                        <asp:LinkButton ID="LinkButton2" runat="server" OnClick="GoHome">Zpět</asp:LinkButton>
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
                        <asp:LinkButton ID="LinkButton1" runat="server" OnClick="GoHome">Zpět</asp:LinkButton>
                    </center>
                </div>
            </asp:View>
        </asp:MultiView>
    </div>
    </form>
</body>
</html>
