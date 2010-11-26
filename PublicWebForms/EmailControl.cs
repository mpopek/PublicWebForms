using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.IO;
using System.Xml;
using System.Net.Mail;
using System.Xml.Linq;
using System.Configuration;

namespace PublicWebForms
{
    public static class EmailControl
    {
        public static bool SendEmail(string subject, XDocument xml, string xmlName)
        {
            return SendEmail(new MailAddress(ConfigurationManager.AppSettings["SmtpDefaultReceiverEmail"]), subject, xml, xmlName);
        }

        public static bool SendEmail(MailAddress receiveEmail, string subject, XDocument xml, string xmlName)
        {
            if (string.IsNullOrEmpty(ConfigurationManager.AppSettings["SmtpSenderEmail"]))
                throw new Exception("SmtpSenderEmail must be defined");
            if (string.IsNullOrEmpty(ConfigurationManager.AppSettings["SmtpSenderName"]))
                throw new Exception("SmtpSenderName must be defined");

            MemoryStream ms = new MemoryStream();
            XmlWriterSettings xws = new XmlWriterSettings();
            xws.OmitXmlDeclaration = true;
            xws.Indent = true;
            using (XmlWriter xw = XmlWriter.Create(ms, xws))
            {
                xml.WriteTo(xw);

                MailMessage message = new MailMessage();
                message.From = new MailAddress(ConfigurationManager.AppSettings["SmtpSenderEmail"], ConfigurationManager.AppSettings["SmtpSenderName"]);
                message.To.Add(receiveEmail);
                message.Subject = subject;
                message.Body = xml.ToString();
                message.Attachments.Add(new Attachment(ms, xmlName + ".xml"));

                SmtpClient smtpClient = new SmtpClient();
                smtpClient.DeliveryMethod = SmtpDeliveryMethod.Network;
                smtpClient.Host = ConfigurationManager.AppSettings["SmtpHost"];
                if (ConfigurationManager.AppSettings["SmtpPort"] != null &&
                    !string.IsNullOrEmpty(ConfigurationManager.AppSettings["SmtpPort"]))
                    smtpClient.Port = int.Parse(ConfigurationManager.AppSettings["SmtpPort"]);

                try
                {
                    smtpClient.Send(message);
                    return true;
                }
                catch (Exception)
                {
                    return false;
                }
            }
        }

        public static bool SendEmail(List<MailAddress> receiveEmails, string subject, XDocument xml, string xmlName)
        {
            foreach (MailAddress mail in receiveEmails)
            {
                if (!SendEmail(mail, subject, xml, xmlName))
                    return false;
            }
            return true;
        }
    }
}
