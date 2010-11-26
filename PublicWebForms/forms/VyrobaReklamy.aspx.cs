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
    public partial class VyrobaReklamy : System.Web.UI.Page
    {
        public void GoHome(object sender, EventArgs e)
        {
            Response.Redirect("~/");
        }

        private int smlouvaID = 0;
        private string smlouvaTyp = "VÝROBA REKLAMNÍCH SPOTŮ";
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
            OSATBL_PWF_VyrobaReklamy smlouva = new OSATBL_PWF_VyrobaReklamy();
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

            smlouva.nazevSkladby = tbNazevSkladby.Text;
            smlouva.autorHudby = tbAutorHudby.Text;
            smlouva.autorTextu = tbAutorTextu.Text;
            smlouva.interpret = tbInterpret.Text;
            smlouva.datumNasazeni = tbDatumNasazeni.Text;

            smlouva.druhSpotu_TV = cbTV.Checked;
            smlouva.druhSpotu_rozhlas = cbRozhlas.Checked;
            smlouva.druhSpotu_kino = cbKino.Checked;
            smlouva.druhSpotu_internet = cbInternet.Checked;

            smlouva.pozadovanaDoba_1mesic = rb1Mesic.Checked;
            smlouva.pozadovanaDoba_3mesice = rb3Mesice.Checked;
            smlouva.pozadovanaDoba_6mesicu = rb6Mesicu.Checked;
            smlouva.pozadovanaDoba_12mesicu = rb12Mesicu.Checked;

            smlouva.sazebnik = tbSazebnik.Text;
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
                    db.OSATBL_PWF_VyrobaReklamies.InsertOnSubmit(smlouva);
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
                    new XElement("VyrobceVydavatel",
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
                    new XElement("ReklamniSpot",
                        new XElement("NazevSkladby", tbNazevSkladby.Text),
                        new XElement("AutorHudby", tbAutorHudby.Text),
                        new XElement("AutorTextu", tbAutorTextu.Text),
                        new XElement("Interpret", tbInterpret.Text),
                        new XElement("DatumNasazeni", tbDatumNasazeni.Text)),
                    new XElement("DruhSpotu",
                        new XElement("TV", cbTV.Checked ? "ano" : "ne"),
                        new XElement("rozhlas", cbRozhlas.Checked ? "ano" : "ne"),
                        new XElement("kino", cbKino.Checked ? "ano" : "ne"),
                        new XElement("internet", cbInternet.Checked ? "ano" : "ne")),
                    new XElement("PozadovanaDoba",
                        new XElement("JedenMesic", rb1Mesic.Checked ? "ano" : "ne"),
                        new XElement("TriMesice", rb3Mesice.Checked ? "ano" : "ne"),
                        new XElement("SestMesicu", rb6Mesicu.Checked ? "ano" : "ne"),
                        new XElement("DvanactMesicu", rb12Mesicu.Checked ? "ano" : "ne")),
                    new XElement("Region",
                        new XElement("Sazebnik", tbSazebnik.Text),
                        new XElement("Poznamka", tbPoznamka.Text))));
            return xml;
        }
    }
}
