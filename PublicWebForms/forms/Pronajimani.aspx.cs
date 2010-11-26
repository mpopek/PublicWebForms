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
    public partial class Pronajimani : System.Web.UI.Page
    {
        public void GoHome(object sender, EventArgs e)
        {
            Response.Redirect("~/");
        }

        private int smlouvaID = 0;
        private string smlouvaTyp = "PRONAJÍMÁNÍ ZVUKOVĚ OBRAZOVÝCH ZÁZNAMŮ / PROVOZOVÁNÍ VIDEO / DVD PŮJČOVEN";
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
            OSATBL_PWF_Pronajimani smlouva = new OSATBL_PWF_Pronajimani();
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

            smlouva.souborNazev = uploader.Files.Count > 0 ? uploader.Files.FirstOrDefault().FileName : string.Empty;
            smlouva.soubor = uploader.Files.Count > 0 ? new System.Data.Linq.Binary(uploader.Files.FirstOrDefault().FileBytes) : null;
            smlouva.poznamka = tbPoznamka.Text;

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
                    db.OSATBL_PWF_Pronajimanis.InsertOnSubmit(smlouva);
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
                    new XElement("Provozovatel",
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
                    new XElement("PrilozenySoubor", uploader.Files.Count > 0 ? uploader.Files.FirstOrDefault().FileName : string.Empty),
                    new XElement("Poznamka", tbPoznamka.Text)));
            return xml;
        }
    }
}
