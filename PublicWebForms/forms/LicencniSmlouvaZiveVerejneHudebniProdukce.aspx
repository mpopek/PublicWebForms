<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LicencniSmlouvaZiveVerejneHudebniProdukce.aspx.cs"
    Inherits="PublicWebForms.forms.LicencniSmlouvaZiveVerejneHudebniProdukce" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>ŽIVÉ VEŘEJNÉ HUDEBNÍ PRODUKCE – ON-LINE ŽÁDOST </title>
    <link href="../styles/registrace.css" rel="stylesheet" type="text/css" />
    <link href="../styles/uploader.css" rel="stylesheet" type="text/css" />
    <link href="../styles/jquery-ui.css" rel="stylesheet" type="text/css" />

    <script src="../scripts/jquery-1.4.2.min.js" type="text/javascript"></script>

    <script src="../scripts/jquery-ui-1.8.6.min.js" type="text/javascript"></script>

    <script src="../scripts/maskinput.js" type="text/javascript"></script>

    <script src="../scripts/main.js" type="text/javascript"></script>

    <script src="../scripts/checkbox.js" type="text/javascript"></script>

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
                        ŽIVÉ VEŘEJNÉ HUDEBNÍ PRODUKCE – ON-LINE ŽÁDOST</h1>
                </div>
                <div class="page">
                    <div class="splitter10">
                    </div>
                    <p>
                        Povinné položky formuláře jsou odlišeny <strong class="blue">modrým písmem</strong>.</p>
                    <p>
                        <strong>Návrh na uzavření licenční smlouvy podle § 46 a 101 autorského zákona č. 121/2000
                            Sb. v platném znění - ŽÁDOST o svolení k užití hudebních děl s textem nebo bez textu
                            autorů zastupovaných OSA.</strong></p>
                    <h2 class="blue">
                        A) Provozovatel (pořadatel)</h2>
                    <table cellspacing="0">
                        <tr>
                            <th>
                                <label class="required">
                                    Název, jméno:</label>
                            </th>
                            <td colspan="3">
                                <asp:OsaTextBox runat="server" ID="tbNazev" CssClass="text" Width="360" MaxLength="120"
                                    DataType="String" IsRequired="true" ValidationGroup="formLicencniSmlova" ErrorMessage="Musíte zadat název nebo jméno!"></asp:OsaTextBox>
                            </td>
                        </tr>
                        <tr>
                            <th>
                                <label class="required">
                                    Ulice:</label>
                            </th>
                            <td colspan="3">
                                <asp:OsaTextBox runat="server" ID="tbUlice" CssClass="text" Width="360" MaxLength="40"
                                    DataType="String" IsRequired="true" ValidationGroup="formLicencniSmlova" ErrorMessage="Musíte zadat ulici!"></asp:OsaTextBox>
                            </td>
                        </tr>
                        <tr>
                            <th>
                                <label class="required">
                                    Město:</label>
                            </th>
                            <td>
                                <asp:OsaTextBox runat="server" ID="tbMesto" CssClass="text" Width="200" MaxLength="30"
                                    DataType="String" IsRequired="true" ValidationGroup="formLicencniSmlova" ErrorMessage="Musíte zadat město!"></asp:OsaTextBox>
                            </td>
                            <td>
                                <label class="required">
                                    PSČ:</label>
                            </td>
                            <td>
                                <asp:OsaTextBox runat="server" ID="tbPsc" CssClass="text psc" Width="80" MaxLength="6"
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
                                    MaxLength="100" DataType="String" IsRequired="false" ValidationGroup="formLicencniSmlova"
                                    ErrorMessage="Musíte specifikovat jinou právní formu!" DDL_MustBeForRequire_ControlId="ddlPravniForma"
                                    DDL_MustBeForRequire_Value="000"></asp:OsaTextBox>
                            </td>
                        </tr>
                        <tr>
                            <th>
                                <label class="required">
                                    IČ:</label>
                            </th>
                            <td colspan="3">
                                <asp:OsaTextBox runat="server" ID="tbIco" CssClass="text numeric" Width="360" MinLength="8"
                                    MaxLength="8" DataType="Int32" IsRequired="true" ValidationGroup="formLicencniSmlova"
                                    ErrorMessage="Musíte zadat IČ!"></asp:OsaTextBox>
                            </td>
                        </tr>
                        <tr>
                            <th>
                                <label>
                                    DIČ:</label>
                            </th>
                            <td colspan="3">
                                <asp:TextBox runat="server" ID="tbDic" CssClass="text" Width="360" MaxLength="13"></asp:TextBox>
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
                                <asp:OsaTextBox runat="server" ID="tbEmail" CssClass="text" Width="360" MaxLength="40"
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
                                <asp:OsaTextBox runat="server" ID="tbZastoupeny" CssClass="text" Width="360" MaxLength="45"
                                    DataType="String" IsRequired="false" ValidationGroup="formLicencniSmlova" ErrorMessage="Musíte zadat jméno zastupujícího!"></asp:OsaTextBox>
                            </td>
                        </tr>
                        <tr>
                            <th>
                                <label>
                                    Funkce:</label>
                            </th>
                            <td colspan="3">
                                <asp:TextBox runat="server" ID="tbFunkce" CssClass="text" Width="360" MaxLength="60"></asp:TextBox>
                            </td>
                        </tr>
                    </table>
                    <p>
                        Žádám o svolení k užití hudebních děl s textem nebo bez textu z repertoáru OSA při
                        hudebních produkcích za níže uvedených podmínek.</p>
                    <div class="splitter30">
                    </div>
                    <h2 class="blue">
                        B) Místo konání hudební produkce</h2>
                    <table cellspacing="0">
                        <tr>
                            <th>
                                <label class="required">
                                    Název provozovny / místa konání*:</label>
                            </th>
                            <td>
                                <asp:OsaTextBox runat="server" ID="tbNazevProvozovny" CssClass="text" Width="360"
                                    MaxLength="60" DataType="String" IsRequired="true" ValidationGroup="formLicencniSmlova"
                                    ErrorMessage="Musíte zadat název provozovny!"></asp:OsaTextBox>
                            </td>
                        </tr>
                        <tr>
                            <th>
                                <label class="required">
                                    Město provozovny:</label>
                            </th>
                            <td>
                                <asp:OsaTextBox runat="server" ID="tbMestoProvozovny" CssClass="text" Width="360"
                                    MaxLength="100" DataType="String" IsRequired="true" ValidationGroup="formLicencniSmlova"
                                    ErrorMessage="Musíte zadat město provozovny!"></asp:OsaTextBox>
                            </td>
                        </tr>
                        <tr>
                            <th>
                                Ulice provozovny:
                            </th>
                            <td>
                                <asp:OsaTextBox runat="server" ID="tbUliceProvozovny" CssClass="text" Width="360"
                                    MaxLength="40" DataType="String" IsRequired="false" ValidationGroup="formLicencniSmlova"
                                    ErrorMessage="Musíte zadat ulici provozovny!"></asp:OsaTextBox>
                            </td>
                        </tr>
                        <tr>
                            <th>
                                <label class="required">
                                    PSČ provozovny:</label>
                            </th>
                            <td>
                                <asp:OsaTextBox runat="server" ID="tbPSCProvozovny" CssClass="text psc" Width="360"
                                    MinLength="5" MaxLength="6" DataType="Int32" IsRequired="true" ValidationGroup="formLicencniSmlova"
                                    ErrorMessage="Musíte zadat PSČ provozovny!"></asp:OsaTextBox>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <p>
                                    pokud se produkce neopakují pravidelně nebo se konají na různých místech, přiložte
                                    prosím seznam obsahující podrobné informace</p>
                                <table class="file" cellspacing="0" style="width: 100%;">
                                    <tr>
                                        <td>
                                            Vložit seznam<br />
                                            <span class="small">(pouze soubory typu doc, rtf, txt, xls, jpg, gif, pdf):</span>
                                        </td>
                                        <td>
                                            <module:Uploader runat="server" ID="uploaderProdukce" UploadFlashPath="~/modules/uploader/uploader.swf"
                                                FolderForSave="temp" MultipleUploads="false" ChooseImageButtonPath="~/images/btnUpload.png"
                                                QueueUncompletePanelId="queueUncompleteB" QueueCompletePanelId="queueCompleteB"
                                                FileExtensionsDescription="Seznam" FileExtensions="doc,rtf,txt,xls,jpg,gif,pdf" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2">
                                            <div id="queueCompleteB">
                                            </div>
                                            <div id="queueUncompleteB">
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                    <div class="splitter30">
                    </div>
                    <h2 class="blue">
                        C) Údaje o produkci</h2>
                    <table cellspacing="0">
                        <tr>
                            <th>
                                <label class="required">
                                    Datum konání od - do:</label>
                            </th>
                            <td>
                                <asp:OsaTextBox runat="server" ID="tbDatumKonaniOd" CssClass="text date" Width="175"
                                    MaxLength="100" DataType="String" IsRequired="true" ValidationGroup="formLicencniSmlova"
                                    ErrorMessage="Musíte zadat počáteční datum konání!"></asp:OsaTextBox>
                                <asp:OsaTextBox runat="server" ID="tbDatumKonaniDo" CssClass="text date" Width="175"
                                    MaxLength="100" DataType="String" IsRequired="true" ValidationGroup="formLicencniSmlova"
                                    ErrorMessage="Musíte zadat koncové datum konání!"></asp:OsaTextBox>
                            </td>
                        </tr>
                        <tr>
                            <th>
                                Produkce bude opakována<br />
                                ve dnech *:
                            </th>
                            <td>
                                <table cellspacing="0" class="file">
                                    <tr>
                                        <td>
                                            <asp:OsaCheckBox runat="server" ID="cbMonday" Text="Po" />
                                        </td>
                                        <td>
                                            <asp:OsaCheckBox runat="server" ID="cbTuesday" Text="Út" />
                                        </td>
                                        <td>
                                            <asp:OsaCheckBox runat="server" ID="cbWednesday" Text="St" />
                                        </td>
                                        <td>
                                            <asp:OsaCheckBox runat="server" ID="cbThusday" Text="Čt" />
                                        </td>
                                        <td>
                                            <asp:OsaCheckBox runat="server" ID="cbFriday" Text="Pá" />
                                        </td>
                                        <td>
                                            <asp:OsaCheckBox runat="server" ID="cbSaturday" Text="So" />
                                        </td>
                                        <td>
                                            <asp:OsaCheckBox runat="server" ID="cbSunday" Text="Ne" />
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <th>
                                <label class="required">
                                    Hodina od - do:</label>
                            </th>
                            <td>
                                <asp:OsaTextBox runat="server" ID="tbHodinaOd" CssClass="text hour" MaxLength="5"
                                    Width="175" DataType="String" IsRequired="true" ValidationGroup="formLicencniSmlova"
                                    ErrorMessage="Musíte zadat počáteční hodinu!"></asp:OsaTextBox>
                                <asp:OsaTextBox runat="server" ID="tbHodinaDo" CssClass="text hour" MaxLength="5"
                                    Width="175" DataType="String" IsRequired="true" ValidationGroup="formLicencniSmlova"
                                    ErrorMessage="Musíte zadat koncovou hodinu!"></asp:OsaTextBox>
                            </td>
                        </tr>
                        <tr>
                            <th>
                                <label class="required">
                                    Kapacita místa konání:</label>
                            </th>
                            <td>
                                <asp:OsaTextBox runat="server" ID="tbKapacitaMistaKonani" CssClass="text numeric"
                                    Width="360" MaxLength="6" DataType="String" IsRequired="true" ValidationGroup="formLicencniSmlova"
                                    ErrorMessage="Musíte zadat kapacitu místa konání!"></asp:OsaTextBox>
                            </td>
                        </tr>
                        <tr>
                            <th>
                                <label class="required">
                                    Název produkce:</label>
                            </th>
                            <td>
                                <asp:OsaTextBox runat="server" ID="tbNazevProdukce" CssClass="text" Width="360" MaxLength="255"
                                    DataType="String" IsRequired="true" ValidationGroup="formLicencniSmlova" ErrorMessage="Musíte zadat název produkce!"></asp:OsaTextBox>
                            </td>
                        </tr>
                        <tr>
                            <th>
                                <label class="required">
                                    Ceny všech druhů vstupného (včetně DPH):</label>
                            </th>
                            <td>
                                <asp:OsaTextBox runat="server" ID="tbCenaVstup1" CssClass="text numeric" Width="50"
                                    MaxLength="6" DataType="String" IsRequired="true" ValidationGroup="formLicencniSmlova"
                                    ErrorMessage="Musíte zadat název provozovny!"></asp:OsaTextBox>
                                <asp:OsaTextBox runat="server" ID="tbCenaVstup2" CssClass="text numeric" Width="50"
                                    MaxLength="6" DataType="String" IsRequired="false" ValidationGroup="formLicencniSmlova"
                                    ErrorMessage="Musíte zadat název provozovny!"></asp:OsaTextBox>
                                <asp:OsaTextBox runat="server" ID="tbCenaVstup3" CssClass="text numeric" Width="50"
                                    MaxLength="6" DataType="String" IsRequired="false" ValidationGroup="formLicencniSmlova"
                                    ErrorMessage="Musíte zadat název provozovny!"></asp:OsaTextBox>
                                <asp:OsaTextBox runat="server" ID="tbCenaVstup4" CssClass="text numeric" Width="50"
                                    MaxLength="6" DataType="String" IsRequired="false" ValidationGroup="formLicencniSmlova"
                                    ErrorMessage="Musíte zadat název provozovny!"></asp:OsaTextBox>
                                <asp:OsaTextBox runat="server" ID="tbCenaVstup5" CssClass="text numeric" Width="50"
                                    MaxLength="6" DataType="String" IsRequired="false" ValidationGroup="formLicencniSmlova"
                                    ErrorMessage="Musíte zadat název provozovny!"></asp:OsaTextBox>
                                <asp:OsaTextBox runat="server" ID="tbCenaVstup6" CssClass="text numeric" Width="50"
                                    MaxLength="6" DataType="String" IsRequired="false" ValidationGroup="formLicencniSmlova"
                                    ErrorMessage="Musíte zadat název provozovny!"></asp:OsaTextBox>
                            </td>
                        </tr>
                        <tr>
                            <th>
                                <label class="required">
                                    Počet produkcí celkem:</label>
                            </th>
                            <td>
                                <asp:OsaTextBox runat="server" ID="tbPocetProdukciCelkem" CssClass="text numeric"
                                    Width="360" MaxLength="4" DataType="Int32" IsRequired="true" ValidationGroup="formLicencniSmlova"
                                    ErrorMessage="Musíte zadat počet produkcí celkem!"></asp:OsaTextBox>
                            </td>
                        </tr>
                    </table>
                    <div class="splitter30">
                    </div>
                    <h2 class="blue">
                        D) Účinkující</h2>
                    <table cellspacing="0">
                        <tr>
                            <th>
                                <label class="required">
                                    Jméno interpreta,<br />
                                    název souboru:</label>
                            </th>
                            <td>
                                <asp:OsaTextBox runat="server" ID="tbJmenoInterpreta" CssClass="text" Width="360"
                                    MaxLength="255" DataType="String" IsRequired="true" ValidationGroup="formLicencniSmlova"
                                    ErrorMessage="Musíte zadat jméno interpreta!"></asp:OsaTextBox>
                            </td>
                        </tr>
                        <tr>
                            <th>
                                <label>
                                    Počet účinkujících<br />
                                    (pouze u koncertů vážné hudby):</label>
                            </th>
                            <td>
                                <asp:OsaTextBox runat="server" ID="tbPocetUcinkujicich" CssClass="text numeric" Width="360"
                                    MaxLength="4" DataType="String" IsRequired="false" ValidationGroup="formLicencniSmlova"
                                    ErrorMessage="Musíte zadat počet účinkujících!"></asp:OsaTextBox>
                            </td>
                        </tr>
                    </table>
                    <div class="splitter30">
                    </div>
                    <h2 class="blue">
                        E) Druh produkce:</h2>
                    <table cellspacing="0">
                        <tr>
                            <th>
                                <label class="required">
                                    vyberte prosím ze seznamu:</label>
                            </th>
                            <td>
                                <asp:OsaDropDownList runat="server" ID="ddlDruhProdukce" Width="365" IsRequired="true"
                                    ValidationGroup="formLicencniSmlova" InvalidIndex="0">
                                    <asp:ListItem>--Vyberte--</asp:ListItem>
                                    <asp:ListItem Value="1">Koncert - pop., rock., vážná hudba, jazz a jiný</asp:ListItem>
                                    <asp:ListItem Value="2">Festival - pop., rock., vážná hudba, jazz a jiný</asp:ListItem>
                                    <asp:ListItem Value="3">Koncert - promenádní</asp:ListItem>
                                    <asp:ListItem Value="4">Hudba k poslechu v hostinských prostorech</asp:ListItem>
                                    <asp:ListItem Value="5">Taneční zábava, ples atd.</asp:ListItem>
                                    <asp:ListItem Value="6">Firemní či jiná společenská setkání</asp:ListItem>
                                    <asp:ListItem Value="7">Sportovní akce</asp:ListItem>
                                    <asp:ListItem Value="8">Přehlídky - módní, kadeřnické a jiné</asp:ListItem>
                                    <asp:ListItem Value="9">Slavnosti na veřejném prostranství</asp:ListItem>
                                    <asp:ListItem Value="10">Hudba s dalšími složkami představení - mluvené slovo, vizuální efekty, taneční prvky apod.</asp:ListItem>
                                    <asp:ListItem Value="11">Pouliční hudební produkce</asp:ListItem>
                                    <asp:ListItem Value="12">Produkce s výkonným umělcem - Dj ( netýká se diskoték )</asp:ListItem>
                                    <asp:ListItem Value="13">Kurzy tance</asp:ListItem>
                                    <asp:ListItem Value="14">Kurzy tance ( prodloužené, věnečky a jiné )</asp:ListItem>
                                    <asp:ListItem Value="15">Výstava, vernisáž apod.</asp:ListItem>
                                    <asp:ListItem Value="16">Propagační, reklamní nebo prodejní</asp:ListItem>
                                    <asp:ListItem Value="17">Soutěž apod.</asp:ListItem>
                                    <asp:ListItem Value="18">Kabaretní, varietní, erotické  a jiné představení</asp:ListItem>
                                    <asp:ListItem Value="19">Karaoke</asp:ListItem>
                                    <asp:ListItem Value="20">Školní představení</asp:ListItem>
                                    <asp:ListItem Value="21">Občanský obřad</asp:ListItem>
                                    <asp:ListItem Value="22">Pochod, průvod apod.</asp:ListItem>
                                    <asp:ListItem Value="24">Konference, školení, beseda apod.</asp:ListItem>
                                    <asp:ListItem Value="25">Cirkusové představení</asp:ListItem>
                                    <asp:ListItem Value="26">...jiné , prosíme vypište</asp:ListItem>
                                </asp:OsaDropDownList>
                            </td>
                        </tr>
                        <tr>
                            <th>
                                ostatní typy produkce - vypište:
                            </th>
                            <td>
                                <asp:OsaTextBox runat="server" ID="tbOstatniTypyProdukce" CssClass="text" Width="360"
                                    MaxLength="100" DataType="String" IsRequired="false" DDL_MustBeForRequire_ControlId="ddlDruhProdukce"
                                    DDL_MustBeForRequire_Value="26" ValidationGroup="formLicencniSmlova" ErrorMessage="Musíte specifikovat typ produkce!"></asp:OsaTextBox>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <p>
                                    údaje o lekcích kursů tance vyplňte, prosím, na zvláštním tiskopise v samostatné
                                    příloze</p>
                                <table class="file" cellspacing="0" style="width: 100%;">
                                    <tr>
                                        <td>
                                            Vložit seznam<br />
                                            <span class="small">(pouze soubory typu doc, rtf, txt, xls, jpg, gif, pdf):</span>
                                        </td>
                                        <td>
                                            <module:Uploader runat="server" ID="uploaderKursy" UploadFlashPath="../modules/uploader/uploader.swf"
                                                FolderForSave="temp" MultipleUploads="false" ChooseImageButtonPath="../images/btnUpload.png"
                                                QueueUncompletePanelId="queueUncompleteE" QueueCompletePanelId="queueCompleteE"
                                                FileExtensionsDescription="Seznam" FileExtensions="doc,rtf,txt,xls,jpg,gif,pdf" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2">
                                            <div id="queueCompleteE">
                                            </div>
                                            <div id="queueUncompleteE">
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                    <ul class="list">
                        <li>Zavazuji se, že hudební díla budou provozována v souladu s autorským zákonem a poskytnutou
                            licencí.</li>
                        <li>Zavazuji se, že uhradím autorskou odměnu podle podmínek platných sazebníků OSA,
                            se kterými jsem se seznámil.</li>
                        <li>Repertoárový list - program produkce s uvedením jmen autorů a názvů skladeb je povinnou
                            součástí této žádosti. Beru na vědomí, že nedodáním programu ztrácím nárok na poskytnutí
                            slev závisejících na jeho předložení.</li>
                        <li>Prohlašuji, že údaje uvedené v této žádosti jsou pravdivé a žádost nebyla sepsána
                            pod nátlakem.</li>
                    </ul>
                    <table cellspacing="0">
                        <tr>
                            <th>
                                <asp:OsaCheckBox runat="server" ID="test" Text="Souhlasím s těmito podmínkami" IsRequired="true"
                                    ValidationGroup="formLicencniSmlova" />
                                <%--<label for="checkbox-x" runat="server" id="cbPodminky">
                                    Souhlasím s těmito podmínkami</label>
                                <input type="checkbox" name="checkbox-x" id="checkbox-x" />--%>
                            </th>
                        </tr>
                    </table>
                    <div class="splitter30">
                    </div>
                    <h2 class="blue">
                        Repertoárový list - program produkce</h2>
                    <table cellspacing="0">
                        <tr>
                            <td colspan="2">
                                <p>
                                    Seznam skladeb, které budou při produkci užity</p>
                                <p>
                                    V případě, že účinkující poskytli seznam hudebních děl, která budou užita při produkci,
                                    potvrzený vedoucím hudebního souboru, popřípadě jinou odpovědnou osobou, je možné
                                    tento seznam přiložit k žádosti (není nutné vyplňovat seznam skladeb na tiskopise).
                                    V souladu s ustanovením § 100 odst. 5 autorského zákona č.121/2000 Sb. je nutné
                                    uvést seznam skladeb i v případě, že budou užita díla autorů nezastupovaných OSA.</p>
                                <table class="file" cellspacing="0" style="width: 100%;">
                                    <tr>
                                        <td>
                                            Vložit seznam<br />
                                            <span class="small">(pouze soubory typu doc, rtf, txt, xls, jpg, gif, pdf):</span>
                                        </td>
                                        <td>
                                            <module:Uploader runat="server" ID="uploaderRL" UploadFlashPath="../modules/uploader/uploader.swf"
                                                FolderForSave="temp" MultipleUploads="false" ChooseImageButtonPath="../images/btnUpload.png"
                                                QueueUncompletePanelId="queueUncompleteRL" QueueCompletePanelId="queueCompleteRL"
                                                FileExtensionsDescription="Seznam" FileExtensions="doc,rtf,txt,xls,jpg,gif,pdf" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2">
                                            <div id="queueCompleteRL">
                                            </div>
                                            <div id="queueUncompleteRL">
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
                                                <module:CaptchaControl ID="captcha" runat="server" CaptchaBackgroundNoise="none"
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
                    <p class="center blue">
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
                        <asp:LinkButton runat="server" OnClick="GoHome">Zpět</asp:LinkButton>
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
