<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="PublicWebForms.Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Online žádosti OSA</title>
    <link href="styles/registrace.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form" runat="server">
    <div id="page">
        <div class="header">
            <h1>
                Online žádosti OSA
            </h1>
        </div>
        <div class="page">
            <h2>
                1. ČÁST</h2>
            <ul class="list">
                <%--<li><a href="forms/LicencniSmlouva.aspx">REGISTRACE PROVOZOVATELE / POŘADATELE</a></li>--%>
                <li><a href="forms/LicencniSmlouvaZiveVerejneHudebniProdukce.aspx">ŽIVÉ VEŘEJNÉ HUDEBNÍ
                    PRODUKCE – ON-LINE ŽÁDOST</a></li>
                <%--<li><a href="forms/ZadostOPartnerstvi.aspx">PARTNERSTVÍ OSA – ON-LINE ŽÁDOST</a></li>--%>
                <li><a href="forms/VydavaniNosicu.aspx">VYDÁVÁNÍ ZVUKOVÝCH A HUDEBNÍCH ZVUKOVĚ OBRAZOVÝCH
                    NOSIČŮ A MULTIMÉDIÍ</a></li>
                <li><a href="forms/VyrobaDovoz.aspx">VÝROBA, DOVOZ A PŘIJÍMÁNÍ NENAHRANÝCH NOSIČŮ A
                    PŘÍSTROJŮ K ROZMNOŽOVÁNÍ</a></li>
                <li><a href="forms/Pronajimani.aspx">PRONAJÍMÁNÍ ZVUKOVĚ OBRAZOVÝCH ZÁZNAMŮ / PROVOZOVÁNÍ
                    VIDEO / DVD PŮJČOVEN</a></li>
                <li><a href="forms/VyrobaVydavani.aspx">VÝROBA AUDIOVIZUÁLNÍCH DĚL, VYDÁVÁNÍ FILMOVÝCH
                    ZVUKOVĚ OBRAZOVÝCH NOSIČŮ A MULTIMEDIÍ</a></li>
                <li><a href="forms/VyrobaReklamy.aspx">VÝROBA REKLAMNÍCH SPOTŮ</a></li>
            </ul>
            <br />
            <br />
            <h2>
                2. ČÁST</h2>
            <ul class="list">
                <li><a href="forms/PartnerstviOsaPomaha.aspx">PARTNERSTVÍ OSA – ON-LINE ŽÁDOST (OSA
                    POMÁHÁ)</a></li>
                <li><a href="forms/PartnerstviVyrobenoSOsa.aspx">PARTNERSTVÍ OSA – ON-LINE ŽÁDOST (VYROBENO
                    S OSA)</a></li>
                <li><a href="forms/PartnerstviOsaZive.aspx">PARTNERSTVÍ OSA – ON-LINE ŽÁDOST (OSA ŽIVĚ)</a></li>
                <li><a href="forms/PartnerstviOsaTalent.aspx">PARTNERSTVÍ OSA – ON-LINE ŽÁDOST (OSA
                    TALENT)</a></li>
                <li><a href="forms/PartnerstviPremieryOsa.aspx">PARTNERSTVÍ OSA – ON-LINE ŽÁDOST (PREMIÉRY
                    OSA)</a></li>
            </ul>
            <br />
            <br />
            <h2>
                3. ČÁST</h2>
            <ul class="list">
                <li><a href="forms/OznameniOUdeleniSouhlasu.aspx">OZNÁMENÍ O UDĚLENÍ SOUHLASU K SYNCHRONIZACI</a></li>
            </ul>
            <br />
            <br />
            <h2>
                4. ČÁST</h2>
            <ul class="list">
                <li><a href="forms/Hlaseni.aspx">FORMULÁŘ PRO HLÁŠENÍ</a></li>
            </ul>
            <br />
            <br />
            <h2>
                5. ČÁST</h2>
            <ul class="list">
                <li><a href="forms/OznameniOSkladbach.aspx">OZNÁMENÍ O SKLADBÁCH UŽITÝCH NA ZVUKOVÉM ČI ZVUKOVĚ-OBRAZOVÉM NOSIČI</a></li>
                <li><a href="forms/HudebniSestava.aspx">HUDEBNÍ SESTAVA SKLADEB UŽITÝCH PŘI VÝROBĚ AUDIOVIZUÁLNÍHO DÍLA</a></li>
            </ul>
        </div>
    </div>
    </form>
</body>
</html>
