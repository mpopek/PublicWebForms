using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;

namespace PublicWebForms
{
    public partial class regenerate : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (ConfigurationManager.AppSettings["ActivateRegenerate"].ToLower() == "false")
                Response.Redirect("~/");
        }

        protected void Regenerate_Click(object sender, EventArgs e)
        {
            int check = -1;

            using (dbDataContext db = new dbDataContext())
            {
                foreach (OSATBL_PWF_Zadost zadost in db.OSATBL_PWF_Zadosts)
                {
                    string xml = zadost.xml;
                    xml = xml.Replace("Email", "EMail");

                    if (!xml.Contains("<?xml version=\"1.0\" encoding=\"utf-8\" ?>"))
                    {
                        xml = "<?xml version=\"1.0\" encoding=\"utf-8\" ?>\r\n" + xml;
                    }

                    foreach (string node in xml.Split(new string[] { "\r\n" }, StringSplitOptions.RemoveEmptyEntries))
                    {
                        if (node.Contains("<Cena>"))
                        {
                            string nodeText = node.Trim().Replace("<Cena>", string.Empty).Replace("</Cena>", string.Empty);
                            if (nodeText.Length > 6)
                            {
                                string newNodeText = nodeText.Remove(6);
                                xml = xml.Replace(node, node.Replace(nodeText, newNodeText));
                            }

                        }
                        if (node.Contains("<Registrace>"))
                        {
                            check = 2;

                        }
                        if (check >= 0)
                        {
                            if (check == 0)
                            {
                                xml = xml.Replace(node, node.Replace("EMail", "Email"));

                            }
                            check--;
                        }
                    }

                    zadost.xml = xml;
                    try
                    {
                        db.SubmitChanges();
                    }
                    catch
                    {
                        ErrorStatus();
                        return;
                    }
                }
            }

            SuccessStatus();
        }

        private void SuccessStatus()
        {
            Status.Text = "Regenerate is complete";
        }
        private void ErrorStatus()
        {
            Status.Text = "Regenerate is failed";
        }
    }
}
