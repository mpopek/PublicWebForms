using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;
using System.Net.Mail;
using System.IO;
using System.Xml;

namespace PublicWebForms.forms
{
    public partial class LicencniSmlouva : System.Web.UI.Page
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
            OSATBL_PWF_LicSml smlouva = new OSATBL_PWF_LicSml();
            smlouva.guid = Guid.NewGuid().ToString();
            smlouva.createDate = smlouvaCreateDate;

            smlouva.nazev = tbNazev.Text;
            smlouva.ulice = tbUlice.Text;
            smlouva.mesto = tbMesto.Text;
            smlouva.psc = tbPsc.Text;
            smlouva.pravniForma = ddlPravniForma.SelectedItem.Text + " (" + ddlPravniForma.SelectedValue + ")";
            smlouva.pravniFormaJina = tbJinaPravniForma.Text;
            smlouva.ic = tbIco.Text;
            smlouva.dic = tbDic.Text;
            smlouva.telefon = tbTelefon.Text;
            smlouva.email = tbEmail.Text;
            smlouva.zastupovany = tbZastoupeny.Text;
            smlouva.funkce = tbFunkce.Text;

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
                    db.OSATBL_PWF_LicSmls.InsertOnSubmit(smlouva);
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
                              new XElement("Cislo", ""),
                              new XElement("Email", "")),
                        new XElement("Adresa",
                            new XElement("Mesto", tbMesto.Text),
                            new XElement("Ulice", tbUlice.Text),
                            new XElement("PSC", tbPsc.Text)),
                        new XElement("PravniForma",
                            new XElement("Kod", ddlPravniForma.SelectedValue),
                            new XElement("Jina", tbJinaPravniForma.Text)),
                        new XElement("IC", tbIco.Text),
                        new XElement("DIC", tbDic.Text),
                        new XElement("Telefon", tbTelefon.Text),
                        new XElement("Email", tbEmail.Text),
                        new XElement("Zastoupeny",
                            new XElement("Jmeno", tbZastoupeny.Text),
                            new XElement("Funkce", tbFunkce.Text)))));
            return xml;
        }
    }
}
