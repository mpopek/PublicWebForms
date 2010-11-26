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
    public partial class VydavaniNosicu : System.Web.UI.Page
    {
        public void GoHome(object sender, EventArgs e)
        {
            Response.Redirect("~/");
        }

        private int smlouvaID = 0;
        private string smlouvaTyp = "VYDÁVÁNÍ ZVUKOVÝCH A HUDEBNÍCH ZVUKOVĚ OBRAZOVÝCH NOSIČŮ A MULTIMÉDIÍ";
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
                if (this.SaveDataToDB()/* && this.SendXmlByEmail(this.GenerateXML())*/)
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
            OSATBL_PWF_VydavaniNosicu smlouva = new OSATBL_PWF_VydavaniNosicu();
            smlouva.guid = Guid.NewGuid().ToString();
            smlouva.createDate = smlouvaCreateDate;

            smlouva.nazevSubjektu = tbNazevSubjektu.Text;
            smlouva.sidlo = tbSidlo.Text;
            smlouva.ic = tbIC.Text;
            smlouva.dic = tbDIC.Text;
            smlouva.zastupujiciOsoba = tbZastupujiciOsoba.Text;
            smlouva.zapisVRejstriku = tbZapisVRejstriku.Text;
            smlouva.kontaktniOsoba = tbKontaktniOsoba.Text;
            smlouva.telefon = tbTelefon.Text;
            smlouva.email = tbEmail.Text;
            smlouva.fax = tbFax.Text;
            smlouva.kontaktniAdresa = tbKontaktniAdresa.Text;

            smlouva.nosic1_nazev = tbNosic1_nazev.Text;
            smlouva.nosic1_typ = tbNosic1_typ.Text;
            smlouva.nosic1_naklad = tbNosic1_naklad.Text;
            smlouva.nosic1_neprodejne = tbNosic1_neprodejne.Text;
            smlouva.nosic1_poznamka = tbNosic1_poznamka.Text;
            smlouva.nosic1_souborNazev = uploaderNosic1.Files.Count > 0 ? uploaderNosic1.Files.FirstOrDefault().FileName : string.Empty;
            smlouva.nosic1_soubor = uploaderNosic1.Files.Count > 0 ? new System.Data.Linq.Binary(uploaderNosic1.Files.FirstOrDefault().FileBytes) : null;

            smlouva.nosic2_nazev = tbNosic2_nazev.Text;
            smlouva.nosic2_typ = tbNosic2_typ.Text;
            smlouva.nosic2_naklad = tbNosic2_naklad.Text;
            smlouva.nosic2_neprodejne = tbNosic2_neprodejne.Text;
            smlouva.nosic2_poznamka = tbNosic2_poznamka.Text;
            smlouva.nosic2_souborNazev = uploaderNosic2.Files.Count > 0 ? uploaderNosic2.Files.FirstOrDefault().FileName : string.Empty;
            smlouva.nosic2_soubor = uploaderNosic2.Files.Count > 0 ? new System.Data.Linq.Binary(uploaderNosic2.Files.FirstOrDefault().FileBytes) : null;

            OSATBL_PWF_Zadost zadost = new OSATBL_PWF_Zadost();
            zadost.formGuid = smlouva.guid;
            zadost.xml = Common.SetUpXML(this.GenerateXML());
            zadost.emailForSend = System.Configuration.ConfigurationManager.AppSettings["SmtpEmail_ZadostHudebniProdukce"];

            using (dbDataContext db = new dbDataContext())
            {
                try
                {
                    db.OSATBL_PWF_Zadosts.InsertOnSubmit(zadost);
                    db.SubmitChanges();
                    smlouva.requestId = zadost.id;
                    db.OSATBL_PWF_VydavaniNosicus.InsertOnSubmit(smlouva);
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
                    new XElement("Vydavatel",
                        new XElement("NazevSubjektu", tbNazevSubjektu.Text),
                        new XElement("Sidlo", tbSidlo.Text),
                        new XElement("IC", tbIC.Text),
                        new XElement("DIC", tbDIC.Text),
                        new XElement("ZastupujiciOsoba", tbZastupujiciOsoba.Text),
                        new XElement("ZapisVRejstriku", tbZapisVRejstriku.Text),
                        new XElement("KontaktniOsoba", tbKontaktniOsoba.Text),
                        new XElement("Telefon", tbTelefon.Text),
                        new XElement("Email", tbEmail.Text),
                        new XElement("Fax", tbFax.Text),
                        new XElement("KontaktniAdresa", tbKontaktniAdresa.Text)),
                    new XElement("Nosic1",
                        new XAttribute("PrilozenySoubor", uploaderNosic1.Files.Count > 0 ?uploaderNosic1.Files.FirstOrDefault().FileName : string.Empty),
                        new XElement("Nazev", tbNosic1_nazev.Text),
                        new XElement("Typ", tbNosic1_typ.Text),
                        new XElement("Naklad", tbNosic1_naklad.Text),
                        new XElement("ZTohoNeprodejne", tbNosic1_neprodejne.Text),
                        new XElement("Poznamka", tbNosic1_poznamka.Text)),
                    new XElement("Nosic2",
                        new XAttribute("PrilozenySoubor", uploaderNosic2.Files.Count > 0 ? uploaderNosic2.Files.FirstOrDefault().FileName : string.Empty),
                        new XElement("Nazev", tbNosic2_nazev.Text),
                        new XElement("Typ", tbNosic2_typ.Text),
                        new XElement("Naklad", tbNosic2_naklad.Text),
                        new XElement("ZTohoNeprodejne", tbNosic2_neprodejne.Text),
                        new XElement("Poznamka", tbNosic2_poznamka.Text))));
            return xml;
        }
    }
}
