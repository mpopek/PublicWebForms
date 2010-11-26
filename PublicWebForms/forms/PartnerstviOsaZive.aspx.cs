using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;
using System.Xml;
using System.IO;
using System.Configuration;

namespace PublicWebForms.forms
{
    public partial class PartnerstviOsaZive : System.Web.UI.Page
    {
        public void GoHome(object sender, EventArgs e)
        {
            Response.Redirect("~/");
        }

        private int smlouvaID = 0;
        private string smlouvaTyp = "PARTNERSTVÍ OSA – ON-LINE ŽÁDOST (OSA ŽIVĚ)";
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

            #region Regenerate PDF
            if (Request["PDF"] == "regenerate" && ConfigurationManager.AppSettings["ActivateRegeneratePDF"] == "true")
            {
                using (dbDataContext db = new dbDataContext())
                {
                    List<OSATBL_PWF_Zadost> list = (from a in db.OSATBL_PWF_PartnerstviOsaZives
                                                    join b in db.OSATBL_PWF_Zadosts on a.guid equals b.formGuid
                                                    where b.pdf == null
                                                    select b).ToList();
                    if (list != null && list.Count() > 0)
                    {
                        StringWriter sw = new StringWriter();
                        Server.Execute(Page.Request.Path + "?pdfid=" + list.FirstOrDefault().id.ToString(), sw);
                        string htmlCodeToConvert = sw.GetStringBuilder().ToString();
                        Common.GeneratePDF(htmlCodeToConvert, list.FirstOrDefault().id);
                        Response.Redirect(Page.ResolveClientUrl("~/forms/PartnerstviOsaZive.aspx?PDF=regenerate"));
                    }
                }
            }
            if (Request["pdfid"] != null && Request["pdfid"].Length > 0 && ConfigurationManager.AppSettings["ActivateRegeneratePDF"] == "true")
            {
                using (dbDataContext db = new dbDataContext())
                {
                    OSATBL_PWF_PartnerstviOsaZive smlouva = (from a in db.OSATBL_PWF_Zadosts
                                                             join b in db.OSATBL_PWF_PartnerstviOsaZives on a.formGuid equals b.guid
                                                             where a.id.ToString() == Request["pdfid"]
                                                             select b).FirstOrDefault();
                    if (smlouva != null)
                    {
                        rbZadostTrue.Checked = smlouva.prvniZadost;
                        tbZadostNe.Text = smlouva.zadostNeHodnota;
                        rbUspokTrue.Checked = smlouva.zadostiUspokojeny;
                        smlouva.nazevProjektu = tbNazevProjektu.Text;
                        smlouva.nazevOsoby = tbNazevOsoby.Text;
                        tbICRC.Text = smlouva.ICRC;
                        tbDIC.Text = smlouva.DIC;
                        tbStatutZast.Text = smlouva.statutarniZastupce;
                        tbFunkce.Text = smlouva.funkce;
                        tbPravniForma.Text = smlouva.pravniForma;
                        tbRegistrace.Text = smlouva.registrace;
                        tbBankSpoj.Text = smlouva.bankovniSpojeni;
                        tbNazevBanky.Text = smlouva.nazevBanky;
                        tbCisloUctu.Text = smlouva.cisloUctu;
                        tbKraj.Text = smlouva.kraj;
                        tbMesto.Text = smlouva.mesto;
                        tbPSC.Text = smlouva.psc;
                        tbTelefon.Text = smlouva.tel;
                        tbEmail.Text = smlouva.email;
                        tbWWW.Text = smlouva.www;
                        tbKontaktOsoba.Text = smlouva.kontaktniOsoba;
                        tbTelefonKontakt.Text = smlouva.kontaktTel;
                        tbEmailKontakt.Text = smlouva.kontaktEmail;
                        tbCinnost.Text = smlouva.vaseCinnost;
                        tbDelkaPusobeni.Text = smlouva.delkaPusobeni;
                        tbReference.Text = smlouva.reference;
                        tbPredpoklady.Text = smlouva.predpoklady;
                        tbPopisCileProjektu.Text = smlouva.popisCileProjektu;
                        tbSeznamVykonnych.Text = smlouva.seznamVykonnych;
                        tbMistoRealizace.Text = smlouva.mistoRealizace;
                        tbCasovyPrubeh.Text = smlouva.casovyPrubeh;
                        tbOdhadPocNavs.Text = smlouva.odhadovanyPocetNavstevniku;
                        tbKategorieVstupneho.Text = smlouva.kategorieVstupneho;
                        tbSponzori.Text = smlouva.sponzori;
                        tbRozpocet.Text = smlouva.rozpocet;
                        tbVlastniZdroje.Text = smlouva.vlastniZdroje;
                        tbZCelkRozp.Text = smlouva.vCelkRozp;
                        tbZiskaneProstredky.Text = smlouva.ziskaneProstredky;
                        tbNaProjZJinZdr.Text = smlouva.naProjZJinZdroj;
                        tbCelkNaklNaProj.Text = smlouva.celkoveNakladyNaProj;
                        tbCelkNaklNaVyk.Text = smlouva.celkoveNakladyNaVyk;
                        tbZTohoNaklNaCest.Text = smlouva.zTohoNaCestovne;

                        cbZmineniJakoPartnera.Checked = smlouva.zmineniBool;
                        tbZmineniJakoPartnera.Text = smlouva.zmineni;
                        cbUmisteniPrezentace.Checked = smlouva.umisteniLogaNaPrezentaceBool;
                        tbUmisteniPrezentace.Text = smlouva.umisteniLogaNaPrezentace;
                        cbUmisteniTisk.Checked = smlouva.umisteniLogaTiskovBool;
                        tbUmisteniTisk.Text = smlouva.umisteniLogaTiskov;
                        cbPodekovani.Checked = smlouva.podekovaniBool;
                        tbPodekovani.Text = smlouva.podekovani;
                        cbUmisteniProgram.Checked = smlouva.umisteniLogaProgramBool;
                        tbUmisteniProgram.Text = smlouva.umisteniLogaProgram;
                        cbPrezentaceVMiste.Checked = smlouva.prezentaceBool;
                        tbPrezentaceVMiste.Text = smlouva.prezentace;
                        cbRozdavaniPropMat.Checked = smlouva.rozdavaniPropMatBool;
                        tbRozdavaniPropMat.Text = smlouva.rozdavaniPropMat;
                        cbUmisteniWeb.Checked = smlouva.umisteniLogaWebBool;
                        tbNabidkaDalsihoPlneni.Text = smlouva.nabidkaPlneni;

                        tbProhlaseniKontaktOsoba.Text = smlouva.prohlaseniJmeno;
                        tbProhlaseniKontaktFunkce.Text = smlouva.prohlaseniFunkce;
                        tbProhlaseniDatum.Text = smlouva.prohlaseniDatum;
                    }
                }
            }
            #endregion
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
            OSATBL_PWF_PartnerstviOsaZive smlouva = new OSATBL_PWF_PartnerstviOsaZive();
            smlouva.guid = Guid.NewGuid().ToString();
            smlouva.createDate = smlouvaCreateDate;

            smlouva.prvniZadost = rbZadostTrue.Checked;
            smlouva.zadostNeHodnota = tbZadostNe.Text;
            smlouva.zadostiUspokojeny = rbUspokTrue.Checked;
            smlouva.nazevProjektu = tbNazevProjektu.Text;
            smlouva.nazevOsoby = tbNazevOsoby.Text;
            smlouva.ICRC = tbICRC.Text;
            smlouva.DIC = tbDIC.Text;
            smlouva.statutarniZastupce = tbStatutZast.Text;
            smlouva.funkce = tbFunkce.Text;
            smlouva.pravniForma = tbPravniForma.Text;
            smlouva.registrace = tbRegistrace.Text;
            smlouva.bankovniSpojeni = tbBankSpoj.Text;
            smlouva.nazevBanky = tbNazevBanky.Text;
            smlouva.cisloUctu = tbCisloUctu.Text;
            smlouva.kraj = tbKraj.Text;
            smlouva.mesto = tbMesto.Text;
            smlouva.psc = tbPSC.Text.Replace(" ", string.Empty);
            smlouva.tel = tbTelefon.Text;
            smlouva.email = tbEmail.Text;
            smlouva.www = tbWWW.Text;
            smlouva.kontaktniOsoba = tbKontaktOsoba.Text;
            smlouva.kontaktTel = tbTelefonKontakt.Text;
            smlouva.kontaktEmail = tbEmailKontakt.Text;
            smlouva.vaseCinnost = tbCinnost.Text;
            smlouva.delkaPusobeni = tbDelkaPusobeni.Text;
            smlouva.reference = tbReference.Text;
            smlouva.predpoklady = tbPredpoklady.Text;
            smlouva.popisCileProjektu = tbPopisCileProjektu.Text;
            smlouva.seznamVykonnych = tbSeznamVykonnych.Text;
            smlouva.mistoRealizace = tbMistoRealizace.Text;
            smlouva.casovyPrubeh = tbCasovyPrubeh.Text;
            smlouva.odhadovanyPocetNavstevniku = tbOdhadPocNavs.Text;
            smlouva.kategorieVstupneho = tbKategorieVstupneho.Text;
            smlouva.sponzori = tbSponzori.Text;
            smlouva.rozpocet = tbRozpocet.Text;
            smlouva.vlastniZdroje = tbVlastniZdroje.Text;
            smlouva.vCelkRozp = tbZCelkRozp.Text;
            smlouva.ziskaneProstredky = tbZiskaneProstredky.Text;
            smlouva.naProjZJinZdroj = tbNaProjZJinZdr.Text;
            smlouva.celkoveNakladyNaProj = tbCelkNaklNaProj.Text;
            smlouva.celkoveNakladyNaVyk = tbCelkNaklNaVyk.Text;
            smlouva.zTohoNaCestovne = tbZTohoNaklNaCest.Text;

            smlouva.zmineniBool = cbZmineniJakoPartnera.Checked;
            smlouva.zmineni = tbZmineniJakoPartnera.Text;
            smlouva.umisteniLogaNaPrezentaceBool = cbUmisteniPrezentace.Checked;
            smlouva.umisteniLogaNaPrezentace = tbUmisteniPrezentace.Text;
            smlouva.umisteniLogaTiskovBool = cbUmisteniTisk.Checked;
            smlouva.umisteniLogaTiskov = tbUmisteniTisk.Text;
            smlouva.podekovaniBool = cbPodekovani.Checked;
            smlouva.podekovani = tbPodekovani.Text;
            smlouva.umisteniLogaProgramBool = cbUmisteniProgram.Checked;
            smlouva.umisteniLogaProgram = tbUmisteniProgram.Text;
            smlouva.prezentaceBool = cbPrezentaceVMiste.Checked;
            smlouva.prezentace = tbPrezentaceVMiste.Text;
            smlouva.rozdavaniPropMatBool = cbRozdavaniPropMat.Checked;
            smlouva.rozdavaniPropMat = tbRozdavaniPropMat.Text;
            smlouva.umisteniLogaWebBool = cbUmisteniWeb.Checked;
            smlouva.nabidkaPlneni = tbNabidkaDalsihoPlneni.Text;

            smlouva.prohlaseniJmeno = tbProhlaseniKontaktOsoba.Text;
            smlouva.prohlaseniFunkce = tbProhlaseniKontaktFunkce.Text;
            smlouva.prohlaseniDatum = tbProhlaseniDatum.Text;

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
                    db.OSATBL_PWF_PartnerstviOsaZives.InsertOnSubmit(smlouva);
                    db.SubmitChanges();
                    this.smlouvaID = zadost.id;
                }
                catch (Exception) { return false; }
            }
            return true;
        }
        private XDocument GenerateXML()
        {
            XDocument xml = new XDocument(
                new XDeclaration("1.0", "windows-1250", "true"),
                new XElement("Zadost",
                    new XAttribute("Verze", "01"),
                    new XAttribute("Kod", this.smlouvaID),
                    new XAttribute("Typ", "Z"),
                    new XAttribute("Timestamp", this.smlouvaCreateDate.ToString()),
                    new XElement("Zadatel",
                        new XElement("ZadateOPartnerstviPoprve", rbZadostTrue.Checked ? "ano" : "ne"),
                        new XElement("PokudNeTakVJakeHodnote", tbZadostNe.Text),
                        new XElement("BylyZadostiUspokojeny", rbUspokTrue.Checked ? "ano" : "ne"),
                        new XElement("NazevProjektu", tbNazevProjektu.Text),
                        new XElement("NazevOsoby", tbNazevOsoby.Text),
                        new XElement("ICRC", tbICRC.Text),
                        new XElement("DIC", tbDIC.Text),
                        new XElement("StatutarniZastupce", tbStatutZast.Text),
                        new XElement("Funkce", tbFunkce.Text),
                        new XElement("PravniForma", tbPravniForma.Text),
                        new XElement("Registrace", tbRegistrace.Text),
                        new XElement("BankovniSpojeni", tbBankSpoj.Text),
                        new XElement("NazevBanky", tbNazevBanky.Text),
                        new XElement("CisloUctu", tbCisloUctu.Text),
                        new XElement("Kraj", tbKraj.Text),
                        new XElement("Mesto", tbMesto.Text),
                        new XElement("PSC", tbPSC.Text.Replace(" ", string.Empty)),
                        new XElement("Telefon", tbTelefon.Text),
                        new XElement("Email", tbEmail.Text),
                        new XElement("WWW", tbWWW.Text),
                        new XElement("KontaktniOsoba", tbKontaktOsoba.Text),
                        new XElement("KontaktniTelefon", tbTelefonKontakt.Text),
                        new XElement("KontaktniEmail", tbEmailKontakt.Text),
                        new XElement("CinnostAZkusenosti", tbCinnost.Text),
                        new XElement("DelkaPusobeniVOblasti", tbDelkaPusobeni.Text),
                        new XElement("Reference", tbReference.Text),
                        new XElement("PredpokladyProRealizaci", tbPredpoklady.Text),
                        new XElement("PopisACile", tbPopisCileProjektu.Text),
                        new XElement("SeznamVykonnych", tbSeznamVykonnych.Text),
                        new XElement("MistoRealizace", tbMistoRealizace.Text),
                        new XElement("CasovyPrubeh", tbCasovyPrubeh.Text),
                        new XElement("OdhadovanyPocetNavstevniku", tbOdhadPocNavs.Text),
                        new XElement("KategorieVstupneho", tbKategorieVstupneho.Text),
                        new XElement("SponzoriAMedialniPartneri", tbSponzori.Text),
                        new XElement("Rozpocet", tbRozpocet.Text),
                        new XElement("VlastniZdroje", tbVlastniZdroje.Text),
                        new XElement("ZCelkovehoRozpoctuProcenta", tbZCelkRozp.Text),
                        new XElement("ZiskaneProstredky", tbZiskaneProstredky.Text),
                        new XElement("NaProjektZJinychZdroju", tbNaProjZJinZdr.Text),
                        new XElement("CelkoveNakladyNaProjekt", tbCelkNaklNaProj.Text),
                        new XElement("CelkoveNakladyNaVykonne", tbCelkNaklNaVyk.Text),
                        new XElement("NakladyNaCestovne", tbZTohoNaklNaCest.Text)),
                    new XElement("NabidkaPlneni",
                        new XElement("ZmineniJakoPartnera",
                            new XElement("Zvoleno", cbZmineniJakoPartnera.Checked ? "ano" : "ne"),
                            new XElement("Specifikace", tbZmineniJakoPartnera.Text)),
                        new XElement("UmisteniLogaAPrezentaceVTiskovychZpravach",
                            new XElement("Zvoleno", cbUmisteniPrezentace.Checked ? "ano" : "ne"),
                            new XElement("Specifikace", tbUmisteniPrezentace.Text)),
                        new XElement("UmisteniLogaNaTiskovychAElektronickychMaterialech",
                            new XElement("Zvoleno", cbUmisteniTisk.Checked ? "ano" : "ne"),
                            new XElement("Specifikace", tbUmisteniTisk.Text)),
                        new XElement("PodekovaniZUstModeratora",
                            new XElement("Zvoleno", cbPodekovani.Checked ? "ano" : "ne"),
                            new XElement("Specifikace", tbPodekovani.Text)),
                        new XElement("UmisteniLogaDoProgramuANaVstupenkach",
                            new XElement("Zvoleno", cbUmisteniProgram.Checked ? "ano" : "ne"),
                            new XElement("Specifikace", tbUmisteniProgram.Text)),
                        new XElement("PrezentacePrimoVMisteKonani",
                            new XElement("Zvoleno", cbPrezentaceVMiste.Checked ? "ano" : "ne"),
                            new XElement("Specifikace", tbPrezentaceVMiste.Text)),
                        new XElement("RozdavaniPropagacnichMaterialuOSA",
                            new XElement("Zvoleno", cbRozdavaniPropMat.Checked ? "ano" : "ne"),
                            new XElement("Specifikace", tbRozdavaniPropMat.Text)),
                        new XElement("UmisteniLogaNaWebovychStrankach",
                            new XElement("Zvoleno", cbUmisteniWeb.Checked ? "ano" : "ne"),
                            new XElement("Specifikace", tbUmisteniWeb.Text)),
                        new XElement("NabidkaDalsihoPlneni", tbNabidkaDalsihoPlneni.Text)),
                    new XElement("SouhlasSeZverejnenimProjektu", "ano"),
                    new XElement("SouhlasSPoskytnutimOsobnichUdaju", "ano"),
                    new XElement("Prohlaseni",
                        new XElement("JmenoAPrijmeniKontaktniOsoby", tbProhlaseniKontaktOsoba.Text),
                        new XElement("FunkceVOrganizaci", tbProhlaseniKontaktFunkce.Text),
                        new XElement("Datum", tbProhlaseniDatum.Text))));
            return xml;
        }
    }
}
