using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Xml;
using System.Xml.Linq;
using Uploader;
using System.Net.Mail;
using System.Configuration;
using ExpertPdf.HtmlToPdf;
using System.Drawing;
using System.Text.RegularExpressions;
using System.Text;

namespace PublicWebForms.forms
{
    public partial class LicencniSmlouvaZiveVerejneHudebniProdukce : System.Web.UI.Page
    {
        public void GoHome(object sender, EventArgs e)
        {
            Response.Redirect("~/");
        }

        private int smlouvaID = 0;
        private string smlouvaTyp = "ŽIVÉ VEŘEJNÉ HUDEBNÍ PRODUKCE – ON-LINE ŽÁDOST";
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
                if (this.SaveDataToDB() /*&& this.SendXmlByEmail(this.GenerateXML())*/)
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
        //    return EmailControl.SendEmail(new MailAddress(ConfigurationManager.AppSettings["SmtpEmail_ZadostHudebniProdukce"]), this.smlouvaTyp, xml, "zadost" + this.smlouvaID.ToString());
        //}
        private bool SaveDataToDB()
        {
            OSATBL_PWF_LicSmlZivVerHudPro smlouva = new OSATBL_PWF_LicSmlZivVerHudPro();
            smlouva.guid = Guid.NewGuid().ToString();
            smlouva.createDate = smlouvaCreateDate;

            smlouva.nazev = tbNazev.Text;
            smlouva.ulice = tbUlice.Text;
            smlouva.mesto = tbMesto.Text;
            smlouva.psc = tbPsc.Text.Replace(" ", string.Empty);
            smlouva.pravniForma = ddlPravniForma.SelectedItem.Text + " (" + ddlPravniForma.SelectedValue + ")";
            smlouva.pravniFormaJina = tbJinaPravniForma.Text;
            smlouva.ic = tbIco.Text;
            smlouva.dic = tbDic.Text;
            smlouva.telefon = tbTelefon.Text;
            smlouva.email = tbEmail.Text;
            smlouva.zastupovany = tbZastoupeny.Text;
            smlouva.funkce = tbFunkce.Text;
            smlouva.nazevMistaKonani = tbNazevProvozovny.Text;
            smlouva.mestoKonani = tbMestoProvozovny.Text;
            smlouva.uliceKonani = tbUliceProvozovny.Text;
            smlouva.pscKonani = tbPSCProvozovny.Text.Replace(" ", string.Empty);

            if (uploaderKursy.HasFile)
            {
                Uploader.File fileKonani = uploaderKursy.Files.FirstOrDefault();
                smlouva.seznamKonani = fileKonani.FileName;
                smlouva.seznamKonaniFile = new System.Data.Linq.Binary(fileKonani.FileBytes);
            }

            smlouva.datumKonani = tbDatumKonaniOd.Text + " | " + tbDatumKonaniDo.Text;
            smlouva.produkceOpakDny_Po = cbMonday.Checked ? true : false;
            smlouva.produkceOpakDny_Ut = cbTuesday.Checked ? true : false;
            smlouva.produkceOpakDny_St = cbWednesday.Checked ? true : false;
            smlouva.produkceOpakDny_Ct = cbThusday.Checked ? true : false;
            smlouva.produkceOpakDny_Pa = cbFriday.Checked ? true : false;
            smlouva.produkceOpakDny_So = cbSaturday.Checked ? true : false;
            smlouva.produkceOpakDny_Ne = cbSunday.Checked ? true : false;
            smlouva.hodinaOdDo = tbHodinaOd.Text + " | " + tbHodinaDo.Text;
            smlouva.kapacitaMistaKonani = tbKapacitaMistaKonani.Text;
            smlouva.nazevProdukce = tbNazevProdukce.Text;
            smlouva.cenyVsechDruhuVstupneho = tbCenaVstup1.Text + " | "
                + tbCenaVstup2.Text + " | "
                + tbCenaVstup3.Text + " | "
                + tbCenaVstup4.Text + " | "
                + tbCenaVstup5.Text + " | "
                + tbCenaVstup6.Text;
            smlouva.pocetProdukciCelkem = tbPocetProdukciCelkem.Text;
            smlouva.jmenoInterpreta = tbJmenoInterpreta.Text;
            smlouva.pocetUcinkujicich = tbPocetUcinkujicich.Text;
            smlouva.druhProdukce = ddlDruhProdukce.SelectedItem.Text;
            smlouva.ostatniTypyProdukce = tbOstatniTypyProdukce.Text;

            if (uploaderProdukce.HasFile)
            {
                Uploader.File fileProd = uploaderProdukce.Files.FirstOrDefault();
                smlouva.seznamProdukce = fileProd.FileName;
                smlouva.seznamProdukceFile = new System.Data.Linq.Binary(fileProd.FileBytes);
            }

            if (uploaderRL.HasFile)
            {
                Uploader.File fileRepList = uploaderRL.Files.FirstOrDefault();
                smlouva.seznamRepList = fileRepList.FileName;
                smlouva.seznamRepListFile = new System.Data.Linq.Binary(fileRepList.FileBytes);
            }

            OSATBL_PWF_Zadost zadost = new OSATBL_PWF_Zadost();
            zadost.formGuid = smlouva.guid;
            zadost.xml = Common.SetUpXML(this.GenerateXML());
            zadost.emailForSend = ConfigurationManager.AppSettings["SmtpEmail_ZadostHudebniProdukce"];

            using (dbDataContext db = new dbDataContext())
            {
                try
                {
                    db.OSATBL_PWF_Zadosts.InsertOnSubmit(zadost);
                    db.SubmitChanges();
                    smlouva.requestId = zadost.id;
                    db.OSATBL_PWF_LicSmlZivVerHudPros.InsertOnSubmit(smlouva);
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
                    new XElement("Poradatel",
                        new XElement("Nazev", tbNazev.Text),
                        new XElement("Registrace",
                              new XElement("Cislo", string.Empty),
                              new XElement("Email", string.Empty)),
                        new XElement("Adresa",
                            new XElement("Mesto", tbMesto.Text),
                            new XElement("Ulice", tbUlice.Text),
                            new XElement("PSC", tbPsc.Text.Replace(" ", string.Empty))),
                        new XElement("PravniForma",
                            new XElement("Kod", ddlPravniForma.SelectedValue),
                            new XElement("Jina", tbJinaPravniForma.Text)),
                        new XElement("IC", tbIco.Text),
                        new XElement("DIC", tbDic.Text),
                        new XElement("Telefon", tbTelefon.Text),
                        new XElement("EMail", tbEmail.Text),
                        new XElement("Zastoupeny",
                            new XElement("Jmeno", tbZastoupeny.Text),
                            new XElement("Funkce", tbFunkce.Text))),
                        new XElement("Produkce",
                            new XAttribute("PrilozenyDokument", uploaderKursy.Count > 0 ? uploaderKursy.Files.FirstOrDefault().FileName : string.Empty),
                            new XElement("Misto",
                                new XElement("Nazev", tbNazevProvozovny.Text),
                                new XElement("Mesto", tbMestoProvozovny.Text),
                                new XElement("Ulice", tbUliceProvozovny.Text),
                                new XElement("PSC", tbPSCProvozovny.Text.Replace(" ", string.Empty))),
                            new XElement("Datum",
                                new XElement("Od", tbDatumKonaniOd.Text),
                                new XElement("Do", tbDatumKonaniDo.Text)),
                            new XElement("OpakovaniVeDnech",
                                new XElement("Pondeli", cbMonday.Checked ? "ano" : "ne"),
                                new XElement("Utery", cbTuesday.Checked ? "ano" : "ne"),
                                new XElement("Streda", cbWednesday.Checked ? "ano" : "ne"),
                                new XElement("Ctvrtek", cbThusday.Checked ? "ano" : "ne"),
                                new XElement("Patek", cbFriday.Checked ? "ano" : "ne"),
                                new XElement("Sobota", cbSaturday.Checked ? "ano" : "ne"),
                                new XElement("Nedele", cbSunday.Checked ? "ano" : "ne")),
                            new XElement("Cas",
                                new XElement("Od", tbHodinaOd.Text),
                                new XElement("Do", tbHodinaDo.Text)),
                            new XElement("Kapacita", tbKapacitaMistaKonani.Text),
                            new XElement("Nazev", tbNazevProdukce.Text),
                            new XElement("Vstupne",
                                new XAttribute("DecimalPoint", "."),
                                new XElement("Cena", tbCenaVstup1.Text),
                                new XElement("Cena", tbCenaVstup2.Text),
                                new XElement("Cena", tbCenaVstup3.Text),
                                new XElement("Cena", tbCenaVstup4.Text),
                                new XElement("Cena", tbCenaVstup5.Text),
                                new XElement("Cena", tbCenaVstup6.Text)),
                            new XElement("PocetProdukci", tbPocetProdukciCelkem.Text),
                            new XElement("Ucinkujici",
                                new XElement("Nazev", tbJmenoInterpreta.Text),
                                new XElement("Pocet", tbPocetUcinkujicich.Text)),
                            new XElement("DruhProdukce",
                                new XAttribute("PrilozenyDokument", uploaderProdukce.Count > 0 ? uploaderProdukce.Files.FirstOrDefault().FileName : string.Empty),
                                new XElement("Druh", ddlDruhProdukce.SelectedValue),
                                new XElement("Ostatni", tbOstatniTypyProdukce.Text))),
                        new XElement("Souhlas", "ano"),
                        new XElement("Repertoar",
                            new XAttribute("PrilozenyDokument", uploaderRL.Count > 0 ? uploaderRL.Files.FirstOrDefault().FileName : string.Empty))));

            //xml.Save("test.xml");
            return xml;
        }
    }
}
