using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Xml;
using System.Xml.Linq;

namespace PublicWebForms.forms
{
    public partial class OznameniOSkladbach : System.Web.UI.Page
    {
        public void GoHome(object sender, EventArgs e)
        {
            Response.Redirect("~/");
        }

        private int smlouvaID = 0;
        private string smlouvaTyp = "REGISTRACE PROVOZOVATELE / POŘADATELE";
        private DateTime smlouvaCreateDate;

        protected void Page_Preinit(object sender, EventArgs e)
        {
            if (Request.QueryString["action"] == "close")
                body.Attributes.Add("onload", "javascript:(window.close())");
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request["state"] == "complete")
                mvForm.ActiveViewIndex = 1;
            if (Request["state"] == "error")
                mvForm.ActiveViewIndex = 2;
            tbCaptcha.CaptchaValidate += new OsaTextBox.OsaTextBoxEventHandler(tbCaptcha_CaptchaValidate);
        }

        bool tbCaptcha_CaptchaValidate()
        {
            captcha.ValidateCaptcha(tbCaptcha.Text);
            if (captcha.UserValidated)
                return true;
            return false;
        }

        protected void Save(object sender, EventArgs e)
        {
            if (IsValid)
            {
                this.smlouvaCreateDate = DateTime.Now;
                StringWriter sw = new StringWriter();
                Server.Execute(Page.Request.Path, sw);
                string htmlCodeToConvert = sw.GetStringBuilder().ToString();
                if (this.SaveDataToDB() && Common.GeneratePDF(htmlCodeToConvert, smlouvaID)/* && this.SendXmlByEmail(this.GenerateXML())*/)
                {
                    Response.Redirect(Request.Url.AbsolutePath + "?state=complete");
                }
                else
                {
                    Response.Redirect(Request.Url.AbsolutePath + "?state=error");
                }
            }
        }

        //private bool SendXmlByEmail(XDocument xml)
        //{
        //    return EmailControl.SendEmail(this.smlouvaTyp, xml, "zadost" + this.smlouvaID.ToString());
        //}
        private bool SaveDataToDB()
        {
            int tmp;

            OSATBL_PWF_OznameniOSkladbach smlouva = new OSATBL_PWF_OznameniOSkladbach();
            smlouva.guid = Guid.NewGuid().ToString();
            smlouva.createDate = smlouvaCreateDate;

            smlouva.vydavatel = Vydavatel.Text;
            smlouva.cisloNosice = CisloNosice.Text;
            smlouva.nazevNosice = NazevNosice.Text;
            smlouva.celkovaMinutaz = CelkovaMinutaz.Text;
            smlouva.lisovna = Lisovna.Text;

            OSATBL_PWF_OznameniOSkladbach_Polozky p1 = new OSATBL_PWF_OznameniOSkladbach_Polozky();
            OSATBL_PWF_OznameniOSkladbach_Polozky p2 = new OSATBL_PWF_OznameniOSkladbach_Polozky();
            OSATBL_PWF_OznameniOSkladbach_Polozky p3 = new OSATBL_PWF_OznameniOSkladbach_Polozky();

            p1.cisloSkladby = CisloSkladby1.Text;
            p2.cisloSkladby = CisloSkladby2.Text;
            p3.cisloSkladby = CisloSkladby3.Text;
            p1.nazevSkladby = NazevSkladby1.Text;
            p2.nazevSkladby = NazevSkladby2.Text;
            p3.nazevSkladby = NazevSkladby3.Text;
            p1.minutazSkladby = MinutazSkladby1.Text;
            p2.minutazSkladby = MinutazSkladby2.Text;
            p3.minutazSkladby = MinutazSkladby3.Text;
            p1.autorHudby = AutorHudby1.Text;
            p2.autorHudby = AutorHudby2.Text;
            p3.autorHudby = AutorHudby3.Text;
            p1.autorTextu = AutorTextu1.Text;
            p2.autorTextu = AutorTextu2.Text;
            p3.autorTextu = AutorTextu3.Text;
            p1.zpracovatel = Zpracovatel1.Text;
            p2.zpracovatel = Zpracovatel2.Text;
            p3.zpracovatel = Zpracovatel3.Text;
            p1.interpret = Interpret1.Text;
            p2.interpret = Interpret2.Text;
            p3.interpret = Interpret3.Text;
            p1.formGuid = smlouva.guid;
            p2.formGuid = smlouva.guid;
            p3.formGuid = smlouva.guid;

            OSATBL_PWF_Zadost zadost = new OSATBL_PWF_Zadost();
            zadost.formGuid = smlouva.guid;
            zadost.xml = Common.SetUpXML(this.GenerateXML());
            zadost.emailForSend = System.Configuration.ConfigurationManager.AppSettings["SmtpDefaultReceiverEmail"];

            using (dbDataContext db = new dbDataContext())
            {
                try
                {
                    db.OSATBL_PWF_Zadosts.InsertOnSubmit(zadost);
                    db.SubmitChanges();
                    smlouva.requestId = zadost.id;
                    db.OSATBL_PWF_OznameniOSkladbaches.InsertOnSubmit(smlouva);
                    db.SubmitChanges();
                    db.OSATBL_PWF_OznameniOSkladbach_Polozkies.InsertOnSubmit(p1);
                    db.OSATBL_PWF_OznameniOSkladbach_Polozkies.InsertOnSubmit(p2);
                    db.OSATBL_PWF_OznameniOSkladbach_Polozkies.InsertOnSubmit(p3);
                    db.SubmitChanges();

                    this.smlouvaID = zadost.id;
                }
                catch (Exception) { return false; }
            }
            return true;
        }
        private XDocument GenerateXML()
        {
            XDocument xml = new XDocument();
            //        new XDeclaration("1.0", "windows-1250", "true"),
            //        new XElement("Zadost",
            //            new XAttribute("Verze", "01"),
            //            new XAttribute("Kod", this.smlouvaID),
            //            new XAttribute("Typ", "Z"),
            //            new XAttribute("Timestamp", this.smlouvaCreateDate.ToString()),
            //            new XElement("Zadatel",
            //                new XElement("ZadateOPartnerstviPoprve", rbZadostTrue.Checked ? "ano" : "ne"),
            //                new XElement("PokudNeTakVJakeHodnote", tbZadostNe.Text),
            //                new XElement("BylyZadostiUspokojeny", rbUspokTrue.Checked ? "ano" : "ne"),
            //                new XElement("NazevProjektu", tbNazevProjektu.Text),
            //                new XElement("NazevOsoby", tbNazevOsoby.Text),
            //                new XElement("ICRC", tbICRC.Text),
            //                new XElement("DIC", tbDIC.Text),
            //                new XElement("StatutarniZastupce", tbStatutZast.Text),
            //                new XElement("Funkce", tbFunkce.Text),
            //                new XElement("PravniForma", tbPravniForma.Text),
            //                new XElement("Registrace", tbRegistrace.Text),
            //                new XElement("BankovniSpojeni", tbBankSpoj.Text),
            //                new XElement("NazevBanky", tbNazevBanky.Text),
            //                new XElement("CisloUctu", tbCisloUctu.Text),
            //                new XElement("Kraj", tbKraj.Text),
            //                new XElement("Mesto", tbMesto.Text),
            //                new XElement("PSC", tbPSC.Text),
            //                new XElement("Telefon", tbTelefon.Text),
            //                new XElement("Email", tbEmail.Text),
            //                new XElement("WWW", tbWWW.Text),
            //                new XElement("KontaktniOsoba", tbKontaktOsoba.Text),
            //                new XElement("KontaktniTelefon", tbTelefonKontakt.Text),
            //                new XElement("KontaktniEmail", tbEmailKontakt.Text),
            //                new XElement("CinnostAZkusenosti", tbCinnost.Text),
            //                new XElement("DelkaPusobeniVOblasti", tbDelkaPusobeni.Text),
            //                new XElement("Reference", tbReference.Text),
            //                new XElement("PredpokladyProRealizaci", tbPredpoklady.Text),
            //                new XElement("PopisACile", tbPopisCileProjektu.Text),
            //                new XElement("SeznamVykonnych", tbSeznamVykonnych.Text),
            //                new XElement("MistoRealizace", tbMistoRealizace.Text),
            //                new XElement("CasovyPrubeh", tbCasovyPrubeh.Text),
            //                new XElement("OdhadovanyPocetNavstevniku", tbOdhadPocNavs.Text),
            //                new XElement("KategorieVstupneho", tbKategorieVstupneho.Text),
            //                new XElement("SponzoriAMedialniPartneri", tbSponzori.Text),
            //                new XElement("Rozpocet", tbRozpocet.Text),
            //                new XElement("VlastniZdroje", tbVlastniZdroje.Text),
            //                new XElement("ZCelkovehoRozpoctuProcenta", tbZCelkRozp.Text),
            //                new XElement("ZiskaneProstredky", tbZiskaneProstredky.Text),
            //                new XElement("NaProjektZJinychZdroju", tbNaProjZJinZdr.Text),
            //                new XElement("CelkoveNakladyNaProjekt", tbCelkNaklNaProj.Text),
            //                new XElement("CelkoveNakladyNaVykonne", tbCelkNaklNaVyk.Text),
            //                new XElement("NakladyNaCestovne", tbZTohoNaklNaCest.Text)),
            //            new XElement("NabidkaPlneni",
            //                new XElement("ZmineniJakoPartnera",
            //                    new XElement("Zvoleno", cbZmineniJakoPartnera.Checked ? "ano" : "ne"),
            //                    new XElement("Specifikace", tbZmineniJakoPartnera.Text)),
            //                new XElement("UmisteniLogaAPrezentaceVTiskovychZpravach",
            //                    new XElement("Zvoleno", cbUmisteniPrezentace.Checked ? "ano" : "ne"),
            //                    new XElement("Specifikace", tbUmisteniPrezentace.Text)),
            //                new XElement("UmisteniLogaNaTiskovychAElektronickychMaterialech",
            //                    new XElement("Zvoleno", cbUmisteniTisk.Checked ? "ano" : "ne"),
            //                    new XElement("Specifikace", tbUmisteniTisk.Text)),
            //                new XElement("PodekovaniZUstModeratora",
            //                    new XElement("Zvoleno", cbPodekovani.Checked ? "ano" : "ne"),
            //                    new XElement("Specifikace", tbPodekovani.Text)),
            //                new XElement("UmisteniLogaDoProgramuANaVstupenkach",
            //                    new XElement("Zvoleno", cbUmisteniProgram.Checked ? "ano" : "ne"),
            //                    new XElement("Specifikace", tbUmisteniProgram.Text)),
            //                new XElement("PrezentacePrimoVMisteKonani",
            //                    new XElement("Zvoleno", cbPrezentaceVMiste.Checked ? "ano" : "ne"),
            //                    new XElement("Specifikace", tbPrezentaceVMiste.Text)),
            //                new XElement("RozdavaniPropagacnichMaterialuOSA",
            //                    new XElement("Zvoleno", cbRozdavaniPropMat.Checked ? "ano" : "ne"),
            //                    new XElement("Specifikace", tbRozdavaniPropMat.Text)),
            //                new XElement("UmisteniLogaNaWebovychStrankach",
            //                    new XElement("Zvoleno", cbUmisteniWeb.Checked ? "ano" : "ne"),
            //                    new XElement("Specifikace", tbUmisteniWeb.Text)),
            //                new XElement("NabidkaDalsihoPlneni", tbNabidkaDalsihoPlneni.Text)),
            //            new XElement("SouhlasSeZverejnenimProjektu", "ano"),
            //            new XElement("SouhlasSPoskytnutimOsobnichUdaju", "ano"),
            //            new XElement("Prohlaseni",
            //                new XElement("JmenoAPrijmeniKontaktniOsoby", tbProhlaseniKontaktOsoba.Text),
            //                new XElement("FunkceVOrganizaci", tbProhlaseniKontaktFunkce.Text),
            //                new XElement("Datum", tbProhlaseniDatum.Text))));
            return xml;
        }
    }
}
