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
    public partial class Hlaseni : System.Web.UI.Page
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

            OSATBL_PWF_Hlaseni smlouva = new OSATBL_PWF_Hlaseni();
            smlouva.guid = Guid.NewGuid().ToString();
            smlouva.createDate = smlouvaCreateDate;

            smlouva.nazev = Nazev.Text;
            smlouva.adresa = Adresa.Text;
            smlouva.kontaktniOsoba = KontektniOsoba.Text;
            smlouva.telefon = Telefon.Text;
            smlouva.email = Email.Text;
            smlouva.obdobiHlaseni = Obdobi.Text;
            smlouva.hrubePrijmy = FilmovaProjekceSeVstupnym.Text;
            smlouva.celkovaNavstevnost = FilmovaProjekceBezVstupnym.Text;

            OSATBL_PWF_Hlaseni_FilmoveProjekce fp1 = new OSATBL_PWF_Hlaseni_FilmoveProjekce();
            if (int.TryParse(FP_CisloKina1.Text, out tmp))
                fp1.cisloKina = tmp;
            fp1.nazev = FP_Nazev1.Text;
            fp1.adresa = FP_Adresa1.Text;
            fp1.hrubePrijmy = FP_HrubePrijmy1.Text;
            OSATBL_PWF_Hlaseni_FilmoveProjekce fp2 = new OSATBL_PWF_Hlaseni_FilmoveProjekce();
            if (int.TryParse(FP_CisloKina2.Text, out tmp))
                fp2.cisloKina = tmp;
            fp2.nazev = FP_Nazev1.Text;
            fp2.adresa = FP_Adresa1.Text;
            fp2.hrubePrijmy = FP_HrubePrijmy1.Text;
            OSATBL_PWF_Hlaseni_FilmoveProjekce fp3 = new OSATBL_PWF_Hlaseni_FilmoveProjekce();
            if (int.TryParse(FP_CisloKina3.Text, out tmp))
                fp3.cisloKina = tmp;
            fp3.nazev = FP_Nazev1.Text;
            fp3.adresa = FP_Adresa1.Text;
            fp3.hrubePrijmy = FP_HrubePrijmy1.Text;
            OSATBL_PWF_Hlaseni_FilmoveProjekce fp4 = new OSATBL_PWF_Hlaseni_FilmoveProjekce();
            if (int.TryParse(FP_CisloKina4.Text, out tmp))
                fp4.cisloKina = tmp;
            fp4.nazev = FP_Nazev1.Text;
            fp4.adresa = FP_Adresa1.Text;
            fp4.hrubePrijmy = FP_HrubePrijmy1.Text;
            OSATBL_PWF_Hlaseni_FilmoveProjekce fp5 = new OSATBL_PWF_Hlaseni_FilmoveProjekce();
            if (int.TryParse(FP_CisloKina5.Text, out tmp))
                fp5.cisloKina = tmp;
            fp5.nazev = FP_Nazev1.Text;
            fp5.adresa = FP_Adresa1.Text;
            fp5.hrubePrijmy = FP_HrubePrijmy1.Text;
            OSATBL_PWF_Hlaseni_FilmoveProjekce fp6 = new OSATBL_PWF_Hlaseni_FilmoveProjekce();
            if (int.TryParse(FP_CisloKina6.Text, out tmp))
                fp6.cisloKina = tmp;
            fp6.nazev = FP_Nazev1.Text;
            fp6.adresa = FP_Adresa1.Text;
            fp6.hrubePrijmy = FP_HrubePrijmy1.Text;
            OSATBL_PWF_Hlaseni_FilmoveProjekce fp7 = new OSATBL_PWF_Hlaseni_FilmoveProjekce();
            if (int.TryParse(FP_CisloKina7.Text, out tmp))
                fp7.cisloKina = tmp;
            fp7.nazev = FP_Nazev1.Text;
            fp7.adresa = FP_Adresa1.Text;
            fp7.hrubePrijmy = FP_HrubePrijmy1.Text;
            OSATBL_PWF_Hlaseni_FilmoveProjekce fp8 = new OSATBL_PWF_Hlaseni_FilmoveProjekce();
            if (int.TryParse(FP_CisloKina8.Text, out tmp))
                fp8.cisloKina = tmp;
            fp8.nazev = FP_Nazev1.Text;
            fp8.adresa = FP_Adresa1.Text;
            fp8.hrubePrijmy = FP_HrubePrijmy1.Text;

            OSATBL_PWF_Hlaseni_FilmoveProjekce fpwo1 = new OSATBL_PWF_Hlaseni_FilmoveProjekce();
            if (int.TryParse(FPWO_CisloKina1.Text, out tmp))
                fpwo1.cisloKina = tmp;
            fpwo1.nazev = FPWO_Nazev1.Text;
            fpwo1.adresa = FPWO_Adresa1.Text;
            fpwo1.celkovaNavstevnost = FPWO_CelkovaNavstevnost1.Text;
            OSATBL_PWF_Hlaseni_FilmoveProjekce fpwo2 = new OSATBL_PWF_Hlaseni_FilmoveProjekce();
            if (int.TryParse(FPWO_CisloKina2.Text, out tmp))
                fpwo2.cisloKina = tmp;
            fpwo2.nazev = FPWO_Nazev2.Text;
            fpwo2.adresa = FPWO_Adresa2.Text;
            fpwo2.celkovaNavstevnost = FPWO_CelkovaNavstevnost2.Text;
            OSATBL_PWF_Hlaseni_FilmoveProjekce fpwo3 = new OSATBL_PWF_Hlaseni_FilmoveProjekce();
            if (int.TryParse(FPWO_CisloKina3.Text, out tmp))
                fpwo3.cisloKina = tmp;
            fpwo3.nazev = FPWO_Nazev3.Text;
            fpwo3.adresa = FPWO_Adresa3.Text;
            fpwo3.celkovaNavstevnost = FPWO_CelkovaNavstevnost3.Text;
            OSATBL_PWF_Hlaseni_FilmoveProjekce fpwo4 = new OSATBL_PWF_Hlaseni_FilmoveProjekce();
            if (int.TryParse(FPWO_CisloKina4.Text, out tmp))
                fpwo4.cisloKina = tmp;
            fpwo4.nazev = FPWO_Nazev4.Text;
            fpwo4.adresa = FPWO_Adresa4.Text;
            fpwo4.celkovaNavstevnost = FPWO_CelkovaNavstevnost4.Text;
            OSATBL_PWF_Hlaseni_FilmoveProjekce fpwo5 = new OSATBL_PWF_Hlaseni_FilmoveProjekce();
            if (int.TryParse(FPWO_CisloKina5.Text, out tmp))
                fpwo5.cisloKina = tmp;
            fpwo5.nazev = FPWO_Nazev5.Text;
            fpwo5.adresa = FPWO_Adresa5.Text;
            fpwo5.celkovaNavstevnost = FPWO_CelkovaNavstevnost5.Text;
            OSATBL_PWF_Hlaseni_FilmoveProjekce fpwo6 = new OSATBL_PWF_Hlaseni_FilmoveProjekce();
            if (int.TryParse(FPWO_CisloKina6.Text, out tmp))
                fpwo6.cisloKina = tmp;
            fpwo6.nazev = FPWO_Nazev6.Text;
            fpwo6.adresa = FPWO_Adresa6.Text;
            fpwo6.celkovaNavstevnost = FPWO_CelkovaNavstevnost6.Text;
            OSATBL_PWF_Hlaseni_FilmoveProjekce fpwo7 = new OSATBL_PWF_Hlaseni_FilmoveProjekce();
            if (int.TryParse(FPWO_CisloKina7.Text, out tmp))
                fpwo7.cisloKina = tmp;
            fpwo7.nazev = FPWO_Nazev7.Text;
            fpwo7.adresa = FPWO_Adresa7.Text;
            fpwo7.celkovaNavstevnost = FPWO_CelkovaNavstevnost7.Text;
            OSATBL_PWF_Hlaseni_FilmoveProjekce fpwo8 = new OSATBL_PWF_Hlaseni_FilmoveProjekce();
            if (int.TryParse(FPWO_CisloKina8.Text, out tmp))
                fpwo8.cisloKina = tmp;
            fpwo8.nazev = FPWO_Nazev8.Text;
            fpwo8.adresa = FPWO_Adresa8.Text;
            fpwo8.celkovaNavstevnost = FPWO_CelkovaNavstevnost8.Text;

            OSATBL_PWF_Hlaseni_FilmovyFestival ff1 = new OSATBL_PWF_Hlaseni_FilmovyFestival();
            OSATBL_PWF_Hlaseni_FilmovyFestival ff2 = new OSATBL_PWF_Hlaseni_FilmovyFestival();
            OSATBL_PWF_Hlaseni_FilmovyFestival ff3 = new OSATBL_PWF_Hlaseni_FilmovyFestival();
            OSATBL_PWF_Hlaseni_FilmovyFestival ff4 = new OSATBL_PWF_Hlaseni_FilmovyFestival();
            ff1.nazevFestivalu = NazevFestivalu1.Text;
            ff2.nazevFestivalu = NazevFestivalu2.Text;
            ff3.nazevFestivalu = NazevFestivalu3.Text;
            ff4.nazevFestivalu = NazevFestivalu4.Text;
            ff1.mistoKonani = MistoKonani1.Text;
            ff2.mistoKonani = MistoKonani2.Text;
            ff3.mistoKonani = MistoKonani3.Text;
            ff4.mistoKonani = MistoKonani4.Text;

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
                    db.OSATBL_PWF_Hlasenis.InsertOnSubmit(smlouva);
                    db.SubmitChanges();

                    fp1.formGuid = smlouva.guid; db.OSATBL_PWF_Hlaseni_FilmoveProjekces.InsertOnSubmit(fp1);
                    fp2.formGuid = smlouva.guid; db.OSATBL_PWF_Hlaseni_FilmoveProjekces.InsertOnSubmit(fp2);
                    fp3.formGuid = smlouva.guid; db.OSATBL_PWF_Hlaseni_FilmoveProjekces.InsertOnSubmit(fp3);
                    fp4.formGuid = smlouva.guid; db.OSATBL_PWF_Hlaseni_FilmoveProjekces.InsertOnSubmit(fp4);
                    fp5.formGuid = smlouva.guid; db.OSATBL_PWF_Hlaseni_FilmoveProjekces.InsertOnSubmit(fp5);
                    fp6.formGuid = smlouva.guid; db.OSATBL_PWF_Hlaseni_FilmoveProjekces.InsertOnSubmit(fp6);
                    fp7.formGuid = smlouva.guid; db.OSATBL_PWF_Hlaseni_FilmoveProjekces.InsertOnSubmit(fp7);
                    fp8.formGuid = smlouva.guid; db.OSATBL_PWF_Hlaseni_FilmoveProjekces.InsertOnSubmit(fp8);

                    fpwo1.formGuid = smlouva.guid; db.OSATBL_PWF_Hlaseni_FilmoveProjekces.InsertOnSubmit(fpwo1);
                    fpwo2.formGuid = smlouva.guid; db.OSATBL_PWF_Hlaseni_FilmoveProjekces.InsertOnSubmit(fpwo2);
                    fpwo3.formGuid = smlouva.guid; db.OSATBL_PWF_Hlaseni_FilmoveProjekces.InsertOnSubmit(fpwo3);
                    fpwo4.formGuid = smlouva.guid; db.OSATBL_PWF_Hlaseni_FilmoveProjekces.InsertOnSubmit(fpwo4);
                    fpwo5.formGuid = smlouva.guid; db.OSATBL_PWF_Hlaseni_FilmoveProjekces.InsertOnSubmit(fpwo5);
                    fpwo6.formGuid = smlouva.guid; db.OSATBL_PWF_Hlaseni_FilmoveProjekces.InsertOnSubmit(fpwo6);
                    fpwo7.formGuid = smlouva.guid; db.OSATBL_PWF_Hlaseni_FilmoveProjekces.InsertOnSubmit(fpwo7);
                    fpwo8.formGuid = smlouva.guid; db.OSATBL_PWF_Hlaseni_FilmoveProjekces.InsertOnSubmit(fpwo8);

                    ff1.formGuid = smlouva.guid; db.OSATBL_PWF_Hlaseni_FilmovyFestivals.InsertOnSubmit(ff1);
                    ff2.formGuid = smlouva.guid; db.OSATBL_PWF_Hlaseni_FilmovyFestivals.InsertOnSubmit(ff2);
                    ff3.formGuid = smlouva.guid; db.OSATBL_PWF_Hlaseni_FilmovyFestivals.InsertOnSubmit(ff3);
                    ff4.formGuid = smlouva.guid; db.OSATBL_PWF_Hlaseni_FilmovyFestivals.InsertOnSubmit(ff4);

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
