using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Xml.Linq;
using System.Text;
using System.IO;
using ExpertPdf.HtmlToPdf;

namespace PublicWebForms
{
    public static class Common
    {
        public static string SetUpXML(XDocument xml)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("<?xml version=\"1.0\" encoding=\"UTF-8\" ?>");
            sb.Append(Environment.NewLine);
            sb.Append(xml.ToString());

            return sb.ToString();
        }

        public static bool GeneratePDF(string html, int id)
        {
            using (dbDataContext db = new dbDataContext())
            {
                OSATBL_PWF_Zadost zadost = db.OSATBL_PWF_Zadosts.Where(a => a.id == id).FirstOrDefault();
                if (zadost != null && zadost.pdf == null)
                {
                    PdfConverter pdfConverter = new PdfConverter();
                    byte[] pdf = pdfConverter.GetPdfBytesFromHtmlString(html);
                    zadost.pdf = new System.Data.Linq.Binary(pdf);

                    //try
                    //{
                    //    FileStream fs = new FileStream(@"C:\Shared\" + id.ToString() + ".pdf", FileMode.OpenOrCreate, FileAccess.ReadWrite);
                    //    fs.Write(pdf, 0, pdf.Length);
                    //}
                    //catch (Exception) { }

                    try
                    {
                        db.SubmitChanges();
                        return true;
                    }
                    catch (Exception) { }
                }
                return false;
            }
        }
    }
}
