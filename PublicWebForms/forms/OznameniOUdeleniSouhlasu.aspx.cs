using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;
using System.Configuration;

namespace PublicWebForms.forms
{
    public partial class OznameniOUdeleniSouhlasu : System.Web.UI.Page
    {
        public void GoHome(object sender, EventArgs e)
        {
            Response.Redirect("~/");
        }

        private int smlouvaID = 0;
        private string smlouvaTyp = "OZNÁMENÍ O UDĚLENÍ SOUHLASU K SYNCHRONIZACI";
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
            OSATBL_PWF_OznameniOUdeleniSouhlasu smlouva = new OSATBL_PWF_OznameniOUdeleniSouhlasu();
            smlouva.guid = Guid.NewGuid().ToString();
            smlouva.createDate = smlouvaCreateDate;

            smlouva.NazevFilmu = tbNazevFilmu.Text;
            smlouva.NazevSkladby = tbNazevSkladby.Text;
            smlouva.AutorHudby = tbAutoriHudby.Text;
            smlouva.AutorTextu = tbAutoriTextu.Text;
            smlouva.Nakladatel = tbNakladatel.Text;
            smlouva.Label = tbLabel.Text;
            smlouva.ZpracovatelHudby = tbZpracovatelHudby.Text;
            smlouva.Subtextar = tbSubtextar.Text;
            smlouva.VyrobceReklamy = tbVyrobceReklamy.Text;
            smlouva.Zadavatel = tbZadavatel.Text;
            smlouva.HudebniStopaz = tbHudebniStopaz.Text;
            smlouva.DruhUziti = tbDruhUziti.Text;
            smlouva.ZpusobUziti = tbZpusobUziti.Text;
            smlouva.SouhlasUdelil = tbSouhlasUdelil.Text;
            smlouva.DobaTrvaniLicence = tbDobaTrvaniLicence.Text;
            smlouva.Poznamky = tbPoznamka.Text;
            smlouva.EmailProPotvrzeni = tbEmailProPotvrzeni.Text;

            OSATBL_PWF_Zadost zadost = new OSATBL_PWF_Zadost();
            zadost.formGuid = smlouva.guid;
            zadost.xml = Common.SetUpXML(this.GenerateXML());
            zadost.emailForSend = ConfigurationManager.AppSettings["SmtpDefaultReceiverEmail"];

            using (dbDataContext db = new dbDataContext())
            {
                try
                {
                    db.OSATBL_PWF_Zadosts.InsertOnSubmit(zadost);
                    db.SubmitChanges();
                    smlouva.requestId = zadost.id;
                    db.OSATBL_PWF_OznameniOUdeleniSouhlasus.InsertOnSubmit(smlouva);
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
                    new XElement("NazevFilmu", tbNazevFilmu.Text),
                    new XElement("NazevSkladby", tbNazevSkladby.Text),
                    new XElement("AutoriHudby", tbAutoriHudby.Text),
                    new XElement("AutoriTextu", tbAutoriTextu.Text),
                    new XElement("Nakladatel", tbNakladatel.Text),
                    new XElement("Label", tbLabel.Text),
                    new XElement("ZpracovatelHudby", tbZpracovatelHudby.Text),
                    new XElement("Subtextar", tbSubtextar.Text),
                    new XElement("VyrobceReklamnihoSpotu", tbVyrobceReklamy.Text),
                    new XElement("Zadavatel", tbZadavatel.Text),
                    new XElement("HudebniStopaz", tbHudebniStopaz.Text),
                    new XElement("DruhUziti", tbDruhUziti.Text),
                    new XElement("ZpusobUziti", tbZpusobUziti.Text),
                    new XElement("SouhlasUdelil", tbSouhlasUdelil.Text),
                    new XElement("DobaTrvaniLicence", tbDobaTrvaniLicence.Text),
                    new XElement("Poznamky", tbPoznamka.Text),
                    new XElement("EmailProPotvrzeni", tbEmailProPotvrzeni.Text)
                            ));
            return xml;
        }
    }
}
