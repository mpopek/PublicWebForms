<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PartnerstviOsaZive.aspx.cs"
    Inherits="PublicWebForms.forms.PartnerstviOsaZive" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>PARTNERSTVÍ OSA – ON-LINE ŽÁDOST (OSA ŽIVĚ)</title>
    <link href="../styles/registrace.css" rel="stylesheet" type="text/css" />
    <link href="../styles/uploader.css" rel="stylesheet" type="text/css" />

        <link href="../styles/jquery-ui.css" rel="stylesheet" type="text/css" />

    <script src="../scripts/jquery-1.4.2.min.js" type="text/javascript"></script>

    <script src="../scripts/jquery-ui-1.8.6.min.js" type="text/javascript"></script>

    <script src="../scripts/maskinput.js" type="text/javascript"></script>

    <script src="../scripts/main.js" type="text/javascript"></script>

    <script language="javascript" type="text/javascript" src="../scripts/checkbox.js"></script>

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
                        PARTNERSTVÍ OSA – ON-LINE ŽÁDOST<br />
                        <strong>OSA ŽIVĚ</strong></h1>
                </div>
                <div class="page">
                    <div class="splitter10">
                    </div>
                    <h2 class="blue">
                        vyplní Žadatel</h2>
                    <table cellspacing="0">
                        <tr>
                            <th>
                                <label>
                                    žádáte o Partnerství OSA poprvé?</label>
                            </th>
                            <td colspan="3">
                                <table cellspacing="0" class="file">
                                    <tr>
                                        <td>
                                            <asp:RadioButton runat="server" ID="rbZadostTrue" Checked="true" Text="Ano" GroupName="zadost" />
                                        </td>
                                        <td>
                                            <asp:RadioButton runat="server" ID="rbZadostFalse" Checked="false" Text="Ne" GroupName="zadost" />
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <th>
                                <label>
                                    Pokud ne, tak v jaké hodnotě</label>
                            </th>
                            <td colspan="3">
                                <asp:OsaTextBox runat="server" ID="tbZadostNe" IsRequired="False" ValidationGroup="formZadost"
                                    ErrorMessage="Musíte zadat hodnotu!" Width="360" CssClass="text" RB_MustBeForRequire_ControlId="rbZadostFalse"
                                    MaxLength="300" DataType="String"></asp:OsaTextBox>
                            </td>
                        </tr>
                        <tr>
                            <th>
                                <label>
                                    Byly žádosti uspokojovány?</label>
                            </th>
                            <td colspan="3">
                                <table cellspacing="0" class="file">
                                    <tr>
                                        <td>
                                            <asp:RadioButton runat="server" ID="rbUspokTrue" Checked="true" Text="Ano" GroupName="uspok" />
                                        </td>
                                        <td>
                                            <asp:RadioButton runat="server" ID="rbUspokFalse" Checked="false" Text="Ne" GroupName="uspok" />
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <th>
                                <label>
                                    Název projektu</label>
                            </th>
                            <td colspan="3">
                                <asp:OsaTextBox runat="server" ID="tbNazevProjektu" IsRequired="False" ValidationGroup="formZadost"
                                    ErrorMessage="Musíte zadat název projektu!" Width="360" CssClass="text" MaxLength="300"
                                    DataType="String"></asp:OsaTextBox>
                            </td>
                        </tr>
                        <tr>
                            <th>
                                <label>
                                    Název právnické osoby/jméno fyzické osoby</label>
                            </th>
                            <td colspan="3">
                                <asp:OsaTextBox runat="server" ID="tbNazevOsoby" IsRequired="False" ValidationGroup="formZadost"
                                    ErrorMessage="Musíte zadat název osoby!" Width="360" CssClass="text" MaxLength="300"
                                    DataType="String"></asp:OsaTextBox>
                            </td>
                        </tr>
                        <tr>
                            <th>
                                <label>
                                    IČ/RČ</label>
                            </th>
                            <td colspan="3">
                                <asp:OsaTextBox runat="server" ID="tbICRC" IsRequired="False" ValidationGroup="formZadost"
                                    ErrorMessage="Musíte zadat IČ nebo RČ!" Width="360" CssClass="text numeric" MaxLength="10"
                                    MinLength="8" DataType="Int64"></asp:OsaTextBox>
                            </td>
                        </tr>
                        <tr>
                            <th>
                                <label>
                                    DIČ</label>
                            </th>
                            <td colspan="3">
                                <asp:OsaTextBox runat="server" ID="tbDIC" IsRequired="False" ValidationGroup="formZadost"
                                    ErrorMessage="Musíte zadat DIČ!" Width="360" CssClass="text" MaxLength="15" DataType="String"></asp:OsaTextBox>
                            </td>
                        </tr>
                        <tr>
                            <th>
                                <label>
                                    Statutární zástupce</label>
                            </th>
                            <td colspan="3">
                                <asp:OsaTextBox runat="server" ID="tbStatutZast" IsRequired="False" ValidationGroup="formZadost"
                                    ErrorMessage="Musíte zadat statutárního zástupce!" Width="360" CssClass="text"
                                    MaxLength="100" DataType="String"></asp:OsaTextBox>
                            </td>
                        </tr>
                        <tr>
                            <th>
                                <label>
                                    Funkce</label>
                            </th>
                            <td colspan="3">
                                <asp:OsaTextBox runat="server" ID="tbFunkce" IsRequired="False" ValidationGroup="formZadost"
                                    ErrorMessage="Musíte zadat funkci statutárního zástupce!" Width="360" CssClass="text"
                                    MaxLength="100" DataType="String"></asp:OsaTextBox>
                            </td>
                        </tr>
                        <tr>
                            <th>
                                <label>
                                    Právní forma</label>
                            </th>
                            <td colspan="3">
                                <asp:OsaTextBox runat="server" ID="tbPravniForma" IsRequired="False" ValidationGroup="formZadost"
                                    ErrorMessage="Musíte zadat právní formu!" Width="360" CssClass="text" MaxLength="200"
                                    DataType="String"></asp:OsaTextBox>
                            </td>
                        </tr>
                        <tr>
                            <th>
                                <label>
                                    Registrace (číslo a datum)</label>
                            </th>
                            <td colspan="3">
                                <asp:OsaTextBox runat="server" ID="tbRegistrace" IsRequired="False" ValidationGroup="formZadost"
                                    ErrorMessage="Musíte zadat registraci!" Width="360" CssClass="text" MaxLength="200"
                                    DataType="String"></asp:OsaTextBox>
                            </td>
                        </tr>
                        <tr>
                            <th>
                                <label>
                                    Bankovní spojení</label>
                            </th>
                            <td colspan="3">
                                <asp:OsaTextBox runat="server" ID="tbBankSpoj" IsRequired="False" ValidationGroup="formZadost"
                                    ErrorMessage="Musíte zadat bankovní spojení!" Width="360" CssClass="text" MaxLength="100"
                                    DataType="String"></asp:OsaTextBox>
                            </td>
                        </tr>
                        <tr>
                            <th>
                                <label>
                                    Název banky</label>
                            </th>
                            <td colspan="3">
                                <asp:OsaTextBox runat="server" ID="tbNazevBanky" IsRequired="False" ValidationGroup="formZadost"
                                    ErrorMessage="Musíte zadat název banky!" Width="360" CssClass="text" MaxLength="100"
                                    DataType="String"></asp:OsaTextBox>
                            </td>
                        </tr>
                        <tr>
                            <th>
                                <label>
                                    Číslo účtu</label>
                            </th>
                            <td colspan="3">
                                <asp:OsaTextBox runat="server" ID="tbCisloUctu" IsRequired="False" ValidationGroup="formZadost"
                                    ErrorMessage="Musíte zadat číslo účtu!" Width="360" CssClass="text" MaxLength="100"
                                    DataType="String"></asp:OsaTextBox>
                            </td>
                        </tr>
                        <tr>
                            <th>
                                <label>
                                    Kraj</label>
                            </th>
                            <td colspan="3">
                                <asp:OsaTextBox runat="server" ID="tbKraj" IsRequired="False" ValidationGroup="formZadost"
                                    ErrorMessage="Musíte zadat kraj!" Width="360" CssClass="text" MaxLength="100"
                                    DataType="String"></asp:OsaTextBox>
                            </td>
                        </tr>
                        <tr>
                            <th>
                                <label>
                                    Město:</label>
                            </th>
                            <td>
                                <asp:OsaTextBox runat="server" ID="tbMesto" IsRequired="False" ValidationGroup="formZadost"
                                    ErrorMessage="Musíte zadat město!" Width="200" CssClass="text" MaxLength="100"
                                    DataType="String"></asp:OsaTextBox>
                            </td>
                            <td>
                                <label>
                                    PSČ:</label>
                            </td>
                            <td>
                                <asp:OsaTextBox runat="server" ID="tbPSC" IsRequired="False" ValidationGroup="formZadost"
                                    ErrorMessage="Musíte zadat PSČ!" Width="80" CssClass="text psc" MaxLength="5" DataType="Int32"></asp:OsaTextBox>
                            </td>
                        </tr>
                        <tr>
                            <th>
                                <label>
                                    Tel.</label>
                            </th>
                            <td colspan="3">
                                <asp:OsaTextBox runat="server" ID="tbTelefon" CssClass="text phone" Width="360" MaxLength="13"
                                    DataType="RegExp" IsRequired="false" ValidationGroup="formZadost" ErrorMessage="Musíte zadat telefonní číslo!"
                                    RegExp="^(\+420)? ?[0-9]{3} ?[0-9]{3} ?[0-9]{3}$"></asp:OsaTextBox>
                            </td>
                        </tr>
                        <tr>
                            <th>
                                <label>
                                    E-mail</label>
                            </th>
                            <td colspan="3">
                                <asp:OsaTextBox runat="server" ID="tbEmail" CssClass="text" Width="360" MaxLength="200"
                                    DataType="RegExp" IsRequired="false" ValidationGroup="formZadost" ErrorMessage="Musíte zadat email!"
                                    RegExp="^[a-zA-Z][\w\.-]*[a-zA-Z0-9]@[a-zA-Z0-9][\w\.-]*[a-zA-Z0-9]\.[a-zA-Z][a-zA-Z\.]*[a-zA-Z]$"></asp:OsaTextBox>
                            </td>
                        </tr>
                        <tr>
                            <th>
                                <label>
                                    WWW</label>
                            </th>
                            <td colspan="3">
                                <asp:OsaTextBox runat="server" ID="tbWWW" IsRequired="False" ValidationGroup="formZadost"
                                    ErrorMessage="Musíte zadat WWW!" Width="360" CssClass="text" MaxLength="200"
                                    DataType="String"></asp:OsaTextBox>
                            </td>
                        </tr>
                        <tr>
                            <th>
                                <label>
                                    Kontaktní osoba</label>
                            </th>
                            <td colspan="3">
                                <asp:OsaTextBox runat="server" ID="tbKontaktOsoba" IsRequired="False" ValidationGroup="formZadost"
                                    ErrorMessage="Musíte zadat kontaktní osobu!" Width="360" CssClass="text" MaxLength="200"
                                    DataType="String"></asp:OsaTextBox>
                            </td>
                        </tr>
                        <tr>
                            <th>
                                <label>
                                    Tel.</label>
                            </th>
                            <td colspan="3">
                                <asp:OsaTextBox runat="server" ID="tbTelefonKontakt" CssClass="text phone" Width="360"
                                    MaxLength="13" DataType="RegExp" IsRequired="false" ValidationGroup="formZadost"
                                    ErrorMessage="Musíte zadat telefonní číslo kontaktní osoby!" RegExp="^(\+420)? ?[0-9]{3} ?[0-9]{3} ?[0-9]{3}$"></asp:OsaTextBox>
                            </td>
                        </tr>
                        <tr>
                            <th>
                                <label>
                                    E-mail</label>
                            </th>
                            <td colspan="3">
                                <asp:OsaTextBox runat="server" ID="tbEmailKontakt" CssClass="text" Width="360" MaxLength="200"
                                    DataType="RegExp" IsRequired="false" ValidationGroup="formZadost" ErrorMessage="Musíte zadat email kontaktní osoby!"
                                    RegExp="^[a-zA-Z][\w\.-]*[a-zA-Z0-9]@[a-zA-Z0-9][\w\.-]*[a-zA-Z0-9]\.[a-zA-Z][a-zA-Z\.]*[a-zA-Z]$"></asp:OsaTextBox>
                            </td>
                        </tr>
                        <tr>
                            <th>
                                <label>
                                    Popište Vaši činnost a zkušenosti</label>
                            </th>
                            <td colspan="3">
                                <asp:OsaTextBox runat="server" ID="tbCinnost" IsRequired="False" ValidationGroup="formZadost"
                                    ErrorMessage="Musíte zadat popis Vaší činnosti!" Width="360" Height="80" TextMode="MultiLine"
                                    CssClass="text" MaxLength="300" DataType="String"></asp:OsaTextBox>
                            </td>
                        </tr>
                        <tr>
                            <th>
                                <label>
                                    Délka působení v dané oblasti</label>
                            </th>
                            <td colspan="3">
                                <asp:OsaTextBox runat="server" ID="tbDelkaPusobeni" IsRequired="False" ValidationGroup="formZadost"
                                    ErrorMessage="Musíte zadat délku působení!" Width="360" CssClass="text" MaxLength="100"
                                    DataType="String"></asp:OsaTextBox>
                            </td>
                        </tr>
                        <tr>
                            <th>
                                <label>
                                    Reference</label>
                            </th>
                            <td colspan="3">
                                <asp:OsaTextBox runat="server" ID="tbReference" IsRequired="False" ValidationGroup="formZadost"
                                    ErrorMessage="Musíte zadat reference!" Width="360" Height="80" TextMode="MultiLine"
                                    CssClass="text" MaxLength="300" DataType="String"></asp:OsaTextBox>
                            </td>
                        </tr>
                        <tr>
                            <th>
                                <label>
                                    Předpoklady pro úspěšnou realizaci projektu</label>
                            </th>
                            <td colspan="3">
                                <asp:OsaTextBox runat="server" ID="tbPredpoklady" IsRequired="False" ValidationGroup="formZadost"
                                    ErrorMessage="Musíte zadat předpoklady!" Width="360" Height="80" TextMode="MultiLine"
                                    CssClass="text" MaxLength="300" DataType="String"></asp:OsaTextBox>
                            </td>
                        </tr>
                        <tr>
                            <th>
                                <label>
                                    Popis a cíle projektu</label>
                            </th>
                            <td colspan="3">
                                <asp:OsaTextBox runat="server" ID="tbPopisCileProjektu" IsRequired="False" ValidationGroup="formZadost"
                                    ErrorMessage="Musíte zadat popis Vašeho cíle projektu!" Width="360" Height="80"
                                    TextMode="MultiLine" CssClass="text" MaxLength="300" DataType="String"></asp:OsaTextBox>
                            </td>
                        </tr>
                        <tr>
                            <th>
                                <label>
                                    Seznam výkonných<br />
                                    umělců / interpretů</label>
                            </th>
                            <td colspan="3">
                                <asp:OsaTextBox runat="server" ID="tbSeznamVykonnych" IsRequired="False" ValidationGroup="formZadost"
                                    ErrorMessage="Musíte zadat seznam výkonných umělcu nebo interpretů!" Width="360"
                                    Height="80" TextMode="MultiLine" CssClass="text" MaxLength="300" DataType="String"></asp:OsaTextBox>
                            </td>
                        </tr>
                        <tr>
                            <th>
                                <label>
                                    Místo realizace projektu</label>
                            </th>
                            <td colspan="3">
                                <asp:OsaTextBox runat="server" ID="tbMistoRealizace" IsRequired="False" ValidationGroup="formZadost"
                                    ErrorMessage="Musíte zadat místo realizace projektu!" Width="360" CssClass="text"
                                    MaxLength="100" DataType="String"></asp:OsaTextBox>
                            </td>
                        </tr>
                        <tr>
                            <th>
                                <label>
                                    Období realizace projektu</label>
                            </th>
                            <td colspan="3">
                                <asp:OsaTextBox runat="server" ID="tbCasovyPrubeh" IsRequired="False" ValidationGroup="formZadost"
                                    ErrorMessage="Musíte zadat časový průběh projektu!" Width="360" CssClass="text"
                                    MaxLength="100" DataType="String"></asp:OsaTextBox>
                            </td>
                        </tr>
                        <tr>
                            <th>
                                <label>
                                    Odhadovaný počet návštěvníků</label>
                            </th>
                            <td colspan="3">
                                <asp:OsaTextBox runat="server" ID="tbOdhadPocNavs" IsRequired="False" ValidationGroup="formZadost"
                                    ErrorMessage="Musíte zadat odhadovaný počet návštěvníků!" Width="360" CssClass="text"
                                    MaxLength="100" DataType="String"></asp:OsaTextBox>
                            </td>
                        </tr>
                        <tr>
                            <th>
                                <label>
                                    Kategorie vstupného</label>
                            </th>
                            <td colspan="3">
                                <asp:OsaTextBox runat="server" ID="tbKategorieVstupneho" IsRequired="False" ValidationGroup="formZadost"
                                    ErrorMessage="Musíte zadat kategorie vstupného!" Width="360" CssClass="text"
                                    MaxLength="100" DataType="String"></asp:OsaTextBox>
                            </td>
                        </tr>
                        <tr>
                            <th>
                                <label>
                                    Sponzoři a mediální partneři</label>
                            </th>
                            <td colspan="3">
                                <asp:OsaTextBox runat="server" ID="tbSponzori" IsRequired="False" ValidationGroup="formZadost"
                                    ErrorMessage="Musíte zadat sponzory!" Width="360" Height="80" TextMode="MultiLine"
                                    CssClass="text" MaxLength="300" DataType="String"></asp:OsaTextBox>
                            </td>
                        </tr>
                        <tr>
                            <th>
                                <label>
                                    Rozpočet projektu</label>
                            </th>
                            <td colspan="3">
                                <asp:OsaTextBox runat="server" ID="tbRozpocet" IsRequired="False" ValidationGroup="formZadost"
                                    ErrorMessage="Musíte zadat rozpocet!" Width="360" CssClass="text" MaxLength="100"
                                    DataType="String"></asp:OsaTextBox>
                            </td>
                        </tr>
                        <tr>
                            <th>
                                <label>
                                    Vlastní zdroje</label>
                            </th>
                            <td colspan="3">
                                <asp:OsaTextBox runat="server" ID="tbVlastniZdroje" IsRequired="False" ValidationGroup="formZadost"
                                    ErrorMessage="Musíte zadat vlastni zdroje!" Width="360" CssClass="text" MaxLength="100"
                                    DataType="String"></asp:OsaTextBox>
                            </td>
                        </tr>
                        <tr>
                            <th>
                                <label>
                                    % z celkového rozpočtu</label>
                            </th>
                            <td colspan="3">
                                <asp:OsaTextBox runat="server" ID="tbZCelkRozp" IsRequired="False" ValidationGroup="formZadost"
                                    ErrorMessage="Musíte zadat kolik to je z celkového rozpočtu!" Width="360" CssClass="text"
                                    MaxLength="100" DataType="String"></asp:OsaTextBox>
                            </td>
                        </tr>
                        <tr>
                            <th>
                                <label>
                                    Získané prostředky na projekt z jiných zdrojů</label>
                            </th>
                            <td colspan="3">
                                <asp:OsaTextBox runat="server" ID="tbZiskaneProstredky" IsRequired="False" ValidationGroup="formZadost"
                                    ErrorMessage="Musíte zadat získané prostředky!" Width="360" CssClass="text" MaxLength="100"
                                    DataType="String"></asp:OsaTextBox>
                            </td>
                        </tr>
                        <tr>
                            <th>
                                <label>
                                    Na projekt z jiných zdrojů</label>
                            </th>
                            <td colspan="3">
                                <asp:OsaTextBox runat="server" ID="tbNaProjZJinZdr" IsRequired="False" ValidationGroup="formZadost"
                                    ErrorMessage="Musíte zadat kolik peněz jde z jiných zdrojů!" Width="360" CssClass="text"
                                    MaxLength="100" DataType="String"></asp:OsaTextBox>
                            </td>
                        </tr>
                        <tr>
                            <th>
                                <label>
                                    Celkové náklady na projekt</label>
                            </th>
                            <td colspan="3">
                                <asp:OsaTextBox runat="server" ID="tbCelkNaklNaProj" IsRequired="False" ValidationGroup="formZadost"
                                    ErrorMessage="Musíte zadat celkové náklady na projekt!" Width="360" CssClass="text"
                                    MaxLength="100" DataType="String"></asp:OsaTextBox>
                            </td>
                        </tr>
                        <tr>
                            <th>
                                <label>
                                    Celkové náklady na výkonné umělce / interprety</label>
                            </th>
                            <td colspan="3">
                                <asp:OsaTextBox runat="server" ID="tbCelkNaklNaVyk" IsRequired="False" ValidationGroup="formZadost"
                                    ErrorMessage="Musíte zadat celkové náklady na výkonné umělce / interprety!" Width="360"
                                    CssClass="text" MaxLength="100" DataType="String"></asp:OsaTextBox>
                            </td>
                        </tr>
                        <tr>
                            <th>
                                <label>
                                    Z toho náklady na cestovné</label>
                            </th>
                            <td colspan="3">
                                <asp:OsaTextBox runat="server" ID="tbZTohoNaklNaCest" IsRequired="False" ValidationGroup="formZadost"
                                    ErrorMessage="Musíte zadat kolik jde na cestovné!" Width="360" CssClass="text"
                                    MaxLength="100" DataType="String"></asp:OsaTextBox>
                            </td>
                        </tr>
                    </table>
                    <div class="splitter30">
                    </div>
                    <h2 class="blue">
                        Nabídka plnění (zaškrtněte)</h2>
                    <table cellspacing="0">
                        <tr>
                            <td class="noline">
                                <label>
                                    Zmínění OSA jako partnera v rámci rozhlasových nebo televizních spotů</label>
                            </td>
                            <td class="noline" nowrap="nowrap">
                                <asp:OsaCheckBox runat="server" ID="cbZmineniJakoPartnera" Text="blíže specifikujte" />
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <asp:OsaTextBox runat="server" ID="tbZmineniJakoPartnera" IsRequired="False" ValidationGroup="formZadost"
                                    ErrorMessage="Musíte zadat specifikaci!" Width="460" CssClass="text" MaxLength="100"
                                    DataType="String"></asp:OsaTextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="noline">
                                <label>
                                    Umístění loga a prezentace v tiskových zprávách</label>
                            </td>
                            <td class="noline" nowrap="nowrap">
                                <asp:OsaCheckBox runat="server" ID="cbUmisteniPrezentace" Text="blíže specifikujte" />
                            </td>
                        </tr>
                        <tr>
                            <td colspan="3">
                                <asp:OsaTextBox runat="server" ID="tbUmisteniPrezentace" IsRequired="False" ValidationGroup="formZadost"
                                    ErrorMessage="Musíte zadat specifikaci!" Width="460" CssClass="text" MaxLength="100"
                                    DataType="String"></asp:OsaTextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="noline">
                                <label>
                                    Umístění loga na veškerých tiskových a elektronických materiálech</label>
                            </td>
                            <td class="noline" nowrap="nowrap">
                                <asp:OsaCheckBox runat="server" ID="cbUmisteniTisk" Text="blíže specifikujte" />
                            </td>
                        </tr>
                        <tr>
                            <td colspan="3">
                                <asp:OsaTextBox runat="server" ID="tbUmisteniTisk" IsRequired="False" ValidationGroup="formZadost"
                                    ErrorMessage="Musíte zadat specifikaci!" Width="460" CssClass="text" MaxLength="100"
                                    DataType="String"></asp:OsaTextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="noline">
                                <label>
                                    Poděkování OSA z úst moderátora akce</label>
                            </td>
                            <td class="noline" nowrap="nowrap">
                                <asp:OsaCheckBox runat="server" ID="cbPodekovani" Text="blíže specifikujte" />
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <asp:OsaTextBox runat="server" ID="tbPodekovani" IsRequired="False" ValidationGroup="formZadost"
                                    ErrorMessage="Musíte zadat specifikaci!" Width="460" CssClass="text" MaxLength="100"
                                    DataType="String"></asp:OsaTextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="noline">
                                <label>
                                    Umístění loga OSA do programu a na vstupenkách připravované akce</label>
                            </td>
                            <td class="noline" nowrap="nowrap">
                                <asp:OsaCheckBox runat="server" ID="cbUmisteniProgram" Text="blíže specifikujte" />
                            </td>
                        </tr>
                        <tr>
                            <td colspan="3">
                                <asp:OsaTextBox runat="server" ID="tbUmisteniProgram" IsRequired="False" ValidationGroup="formZadost"
                                    ErrorMessage="Musíte zadat specifikaci!" Width="460" CssClass="text" MaxLength="100"
                                    DataType="String"></asp:OsaTextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="noline">
                                <label>
                                    Prezentace přímo v místě konání akce</label>
                            </td>
                            <td class="noline" nowrap="nowrap">
                                <asp:OsaCheckBox runat="server" ID="cbPrezentaceVMiste" Text="blíže specifikujte" />
                            </td>
                        </tr>
                        <tr>
                            <td colspan="3">
                                <asp:OsaTextBox runat="server" ID="tbPrezentaceVMiste" IsRequired="False" ValidationGroup="formZadost"
                                    ErrorMessage="Musíte zadat specifikaci!" Width="460" CssClass="text" MaxLength="100"
                                    DataType="String"></asp:OsaTextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="noline">
                                <label>
                                    Rozdávání propagačních materiálů OSA v místě konání</label>
                            </td>
                            <td class="noline" nowrap="nowrap">
                                <asp:OsaCheckBox runat="server" ID="cbRozdavaniPropMat" Text="blíže specifikujte" />
                            </td>
                        </tr>
                        <tr>
                            <td colspan="3">
                                <asp:OsaTextBox runat="server" ID="tbRozdavaniPropMat" IsRequired="False" ValidationGroup="formZadost"
                                    ErrorMessage="Musíte zadat specifikaci!" Width="460" CssClass="text" MaxLength="100"
                                    DataType="String"></asp:OsaTextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="noline">
                                <label>
                                    Umístění loga na webové stránky</label>
                            </td>
                            <td class="noline" nowrap="nowrap">
                                <asp:OsaCheckBox runat="server" ID="cbUmisteniWeb" Text="blíže specifikujte" />
                            </td>
                        </tr>
                        <tr>
                            <td colspan="3">
                                <asp:OsaTextBox runat="server" ID="tbUmisteniWeb" IsRequired="False" ValidationGroup="formZadost"
                                    ErrorMessage="Musíte zadat specifikaci!" Width="460" CssClass="text" MaxLength="100"
                                    DataType="String"></asp:OsaTextBox>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" class="nopadding">
                                <table>
                                    <tr>
                                        <td class="label">
                                            <label>
                                                Nabídka dalšího plnění:</label>
                                        </td>
                                        <td class="noline">
                                            <asp:OsaTextBox runat="server" ID="tbNabidkaDalsihoPlneni" IsRequired="False" ValidationGroup="formZadost"
                                                ErrorMessage="Musíte zadat nabídku dalšího plnění!" Width="360" Height="80" TextMode="MultiLine"
                                                CssClass="text" MaxLength="300" DataType="String"></asp:OsaTextBox>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                    <div class="splitter30">
                    </div>
                    <h2 class="blue">
                        Souhlas se zveřejněním projektu</h2>
                    <table cellspacing="0">
                        <tr>
                            <td>
                                Souhlasím s poskytnutím veškerých informací (vyjma osobních dat) týkajících se této<br />
                                Žádosti o příspěvek od OSA.
                            </td>
                            <td nowrap="nowrap">
                                <asp:OsaCheckBox runat="server" ID="cbSouhlasZverejneni" IsRequired="true" ValidationGroup="formZadost"
                                    ErrorMessage="Musíte souhlasit se zveřejněním projektu!" Text="Souhlasím" />
                            </td>
                        </tr>
                    </table>
                    <div class="splitter30">
                    </div>
                    <h2 class="blue">
                        Souhlas s poskytnutím osobních údajů</h2>
                    <table cellspacing="0">
                        <tr>
                            <td>
                                Souhlasím s poskytnutím osobních údajů uvedených v této Žádosti o příspěvek OSA
                                za účelem o zařazení do databáze OSA.<br />
                                Veškerá osobní data budou chráněna v souladu se zněním zákona č. 101/2000Sb. o ochraně
                                osobních údajů.
                            </td>
                            <td nowrap="nowrap">
                                <asp:OsaCheckBox runat="server" ID="cbSouhlasOsUd" IsRequired="true" ValidationGroup="formZadost"
                                    ErrorMessage="Musíte souhlasit s poskytnutím osobních údajů!" Text="Souhlasím" />
                            </td>
                        </tr>
                    </table>
                    <div class="splitter30">
                    </div>
                    <h2 class="blue">
                        Prohlášení</h2>
                    <table cellspacing="0">
                        <tr>
                            <td colspan="2">
                                <p>
                                    Svým prohlášením potvrzuji, že veškeré údaje této žádosti jsou pravdivé a odpovídají
                                    skutečnosti.<br />
                                    Souhlasím s podmínkami, jež jsou uvedeny ve statutu projektu Partnerství OSA.</p>
                            </td>
                        </tr>
                        <tr>
                            <th>
                                <label>
                                    Jméno a příjmení kontaktní osoby</label>
                            </th>
                            <td>
                                <asp:OsaTextBox runat="server" ID="tbProhlaseniKontaktOsoba" IsRequired="False" ValidationGroup="formZadost"
                                    ErrorMessage="Musíte zadat jméno a příjmení kontaktní osobu!" Width="360" CssClass="text"
                                    MaxLength="100" DataType="String"></asp:OsaTextBox>
                            </td>
                        </tr>
                        <tr>
                            <th>
                                <label>
                                    Funkce v organizaci</label>
                            </th>
                            <td>
                                <asp:OsaTextBox runat="server" ID="tbProhlaseniKontaktFunkce" IsRequired="False"
                                    ValidationGroup="formZadost" ErrorMessage="Musíte zadat funkci v organizaci!"
                                    Width="360" CssClass="text" MaxLength="100" DataType="String"></asp:OsaTextBox>
                            </td>
                        </tr>
                        <tr>
                            <th>
                                <label>
                                    Datum</label>
                            </th>
                            <td>
                                <asp:OsaTextBox runat="server" ID="tbProhlaseniDatum" IsRequired="False" ValidationGroup="formZadost"
                                    ErrorMessage="Musíte zadat datum!" Width="360" CssClass="text" MaxLength="100"
                                    DataType="String"></asp:OsaTextBox>
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
                            <asp:LinkButton runat="server" ID="lbSave" Text="registrovat" OnClick="Save" ValidationGroup="formZadost"></asp:LinkButton>
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
