﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text.RegularExpressions;
using System.Configuration;
using System.IO;

namespace PublicWebForms
{
    [ToolboxData("<{0}:OsaTextBox runat=server></{0}:OsaTextBox>")]
    public class OsaCheckBox : System.Web.UI.WebControls.CheckBox, IValidator
    {
        private string errorStyle = "border-top: 1px solid white; border-left: 2px solid red; border-bottom: 1px solid white; border-right: 1px solid white;";

        // datovy typ, ktery textbox prijima
        public MyCheckBoxBaseValidator BaseValidator;

        // priznak, zda je vyzadovana nejaka hodnota
        private bool _IsRequired;

        public bool IsRequired
        {
            get { return _IsRequired; }
            set { _IsRequired = value; }
        }

        protected override void OnInit(EventArgs e)
        {
            // zavalome inicializaci ze zakladni tridy
            base.OnInit(e);

            this.IsValid = true;

            // pridame implementovane rozhrani Ivalidator mezi validovane elementy stranky
            if (!String.IsNullOrEmpty(this.ValidationGroup))
            {
                BaseValidator = new MyCheckBoxBaseValidator(this, this.ValidationGroup);
                Page.Validators.Add(this.BaseValidator);
            }
            else
            {
                Page.Validators.Add(this);
            }
            // kontorola nastavenych vlastnosti (MaxLenght, DataType, IsRequired)
            #region test nastavenych vlastnosti
            try
            {

            }
            catch (Exception ex)
            {
                throw new Exception("Textbox nemá nastavenou vlastnost " + ex.Message);
            }
            #endregion
        }


        protected override void OnUnload(EventArgs e)
        {
            // je potreba explicitne odebrat nas prvek z kontorolovanych prvku
            if (Page != null)
            {
                if (!String.IsNullOrEmpty(this.ValidationGroup))
                    Page.Validators.Remove(this.BaseValidator);
                else
                    Page.Validators.Remove(this);
            }
            base.OnUnload(e);
        }

        protected override void Render(HtmlTextWriter writer)
        {
            if (this.IsValid)
                this.Attributes.Remove("style");
            else
            {
                if (!string.IsNullOrEmpty(ConfigurationManager.AppSettings["errorStyleCheckBox"].ToString()))
                    errorStyle = ConfigurationManager.AppSettings["errorStyleCheckBox"].ToString();
                this.Attributes.Add("style", errorStyle);
            }
            base.Render(writer);



        }

        #region IValidator Members

        public string ErrorMessage
        {
            get
            {
                return "TextBox is not valid!";
            }
            set
            {
                //ErrorMessage = value;
            }
        }

        private bool _Isvalid;

        public bool IsValid
        {
            get
            { return _Isvalid; }
            set
            { _Isvalid = value; }
        }

        public void Validate()
        {
            this.IsValid = true;

            if (this.Checked == false)
            {
                this.IsValid = false;
            }
        }

        #endregion
    }
    public class MyCheckBoxBaseValidator : BaseValidator, IValidator
    {

        public OsaCheckBox tb;

        public MyCheckBoxBaseValidator(OsaCheckBox checkBox, string ValidationGroup)
        {
            tb = checkBox;
            this.ControlToValidate = tb.ID;
            this.ValidationGroup = ValidationGroup;
        }

        protected override bool EvaluateIsValid()
        {
            return true;
        }


        #region IValidator Members

        public new string ErrorMessage
        {
            get
            { return tb.ErrorMessage; }
            set
            { tb.ErrorMessage = value; }
        }

        public new bool IsValid
        {
            get
            { return tb.IsValid; }
            set
            { tb.IsValid = value; }
        }

        public new void Validate()
        {
            tb.Validate();
        }

        #endregion
    }
}