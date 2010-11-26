using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text.RegularExpressions;
using System.Configuration;

namespace PublicWebForms
{
    [ToolboxData("<{0}:OsaTextBox runat=server></{0}:OsaTextBox>")]
    public class OsaTextBox : System.Web.UI.WebControls.TextBox, IValidator
    {
        public delegate bool OsaTextBoxEventHandler();
        public event OsaTextBoxEventHandler CaptchaValidate;

        private string errorStyle = "border-left: 2px solid red;";

        public MyTextBoxBaseValidator BaseValidator;

        // datovy typ, ktery textbox prijima
        private DataType _DataType;
        private int _MinLength;
        private string _RegExp;
        private bool _IsRequired;
        private bool _Captcha;
        private string _DDL_MustBeForRequire_ControlId;
        private int _DDL_MustBeForRequire_Index = -999;
        private string _DDL_MustBeForRequire_Value;
        private string _CB_MustBeForRequire_ControlId;
        private string _RB_MustBeForRequire_ControlId;


        public DataType DataType
        {
            get { return _DataType; }
            set { _DataType = value; }
        }
        public int MinLength
        {
            get { return _MinLength; }
            set { _MinLength = value; }
        }
        public string RegExp
        {
            get { return _RegExp; }
            set { _RegExp = value; }
        }
        public bool IsRequired
        {
            get { return _IsRequired; }
            set { _IsRequired = value; }
        }
        public bool Captcha
        {
            get { return _Captcha; }
            set { _Captcha = value; }
        }
        public string DDL_MustBeForRequire_ControlId
        {
            get { return _DDL_MustBeForRequire_ControlId; }
            set { _DDL_MustBeForRequire_ControlId = value; }
        }
        public int DDL_MustBeForRequire_Index
        {
            get { return _DDL_MustBeForRequire_Index; }
            set { _DDL_MustBeForRequire_Index = value; }
        }
        public string DDL_MustBeForRequire_Value
        {
            get { return _DDL_MustBeForRequire_Value; }
            set { _DDL_MustBeForRequire_Value = value; }
        }
        public string CB_MustBeForRequire_ControlId
        {
            get { return _CB_MustBeForRequire_ControlId; }
            set { _CB_MustBeForRequire_ControlId = value; }
        }
        public string RB_MustBeForRequire_ControlId
        {
            get { return _RB_MustBeForRequire_ControlId; }
            set { _RB_MustBeForRequire_ControlId = value; }
        }


        private Regex RE;

        protected override void OnInit(EventArgs e)
        {
            // zavalome inicializaci ze zakladni tridy
            base.OnInit(e);

            this.IsValid = true;

            // pridame implementovane rozhrani Ivalidator mezi validovane elementy stranky
            if (!String.IsNullOrEmpty(this.ValidationGroup))
            {
                BaseValidator = new MyTextBoxBaseValidator(this, this.ValidationGroup);
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
                if (MaxLength == 0)
                {
                    throw new Exception("MaxLength");
                }

                if (_DataType == DataType.Null)
                {
                    throw new Exception("DataType");
                }
                if (_DataType == DataType.RegExp)
                {
                    if (_RegExp == null)
                    {
                        throw new Exception("RegExp");
                    }
                    else
                    {
                        RE = new Regex(_RegExp);
                    }
                }
                else
                {
                    switch (_DataType)
                    {
                        //case DataType.Int16: this.ToolTip = " Vložte prosím celé číslo "; break;
                        //case DataType.Int32: this.ToolTip = " Vložte prosím celé číslo "; break;
                        //case DataType.Int64: this.ToolTip = " Vložte prosím celé číslo "; break;
                        //case DataType.Double: this.ToolTip = " Vložte prosím celé nebo desetiné číslo "; break;
                        //case DataType.String: this.ToolTip = " Vložte prosím řeťezec o maximální délce " + this.MaxLength; break;
                    }
                }
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
                if (!string.IsNullOrEmpty(ConfigurationManager.AppSettings["errorStyle"].ToString()))
                    errorStyle = ConfigurationManager.AppSettings["errorStyle"].ToString();
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

            if (!_IsRequired)
            {
                if (!string.IsNullOrEmpty(DDL_MustBeForRequire_ControlId))
                {
                    DropDownList ddl = Page.FindControl(DDL_MustBeForRequire_ControlId) as DropDownList;
                    if (ddl == null)
                        throw new Exception("You must set good DropDownList Control Id");
                    else
                    {
                        if (ddl.SelectedIndex == DDL_MustBeForRequire_Index || ddl.SelectedValue == DDL_MustBeForRequire_Value)
                        {
                            this._IsRequired = true;
                        }
                    }
                }
                if (!string.IsNullOrEmpty(CB_MustBeForRequire_ControlId))
                {
                    CheckBox cb = Page.FindControl(CB_MustBeForRequire_ControlId) as CheckBox;
                    if (cb == null)
                        throw new Exception("You must set good CheckBox Control Id");
                    else
                    {
                        if (!cb.Checked)
                            this._IsRequired = true;
                    }
                }
                if (!string.IsNullOrEmpty(RB_MustBeForRequire_ControlId))
                {
                    RadioButton rb = Page.FindControl(RB_MustBeForRequire_ControlId) as RadioButton;
                    if (rb == null)
                        throw new Exception("You must set good CheckBox Control Id");
                    else
                    {
                        if (rb.Checked)
                            this._IsRequired = true;
                    }
                }
            }



            if (this.Visible)
            {
                if (_IsRequired)
                {
                    if (this.Text.Trim() == String.Empty)
                    {
                        this.IsValid = false;
                    }
                }


                if (this.Text.Trim() != String.Empty)
                {
                    switch (_DataType)
                    {
                        case DataType.Int16:
                            {
                                Int16 Int16Value = 0;
                                if (!Int16.TryParse(this.Text.Replace(" ", string.Empty), out Int16Value))
                                {
                                    this.IsValid = false;
                                }
                                break;
                            }
                        case DataType.Int32:
                            {
                                Int32 Int32Value = 0;
                                if (!Int32.TryParse(this.Text.Replace(" ", string.Empty), out Int32Value))
                                {
                                    this.IsValid = false;
                                }
                                break;
                            }
                        case DataType.Int64:
                            {
                                Int64 Int64Value = 0;
                                if (!Int64.TryParse(this.Text.Replace(" ",string.Empty), out Int64Value))
                                {
                                    this.IsValid = false;
                                }
                                break;
                            }
                        case DataType.Double:
                            {
                                double DoubleValue = 0;
                                if (!double.TryParse(this.Text.Replace(" ", string.Empty), out DoubleValue))
                                {
                                    this.IsValid = false;
                                }
                                break;
                            }
                        case DataType.String:
                            {
                                if (this.Text.Length > this.MaxLength)
                                {
                                    this.IsValid = false;
                                }
                                break;
                            }
                        case DataType.RegExp:
                            {
                                if (!RE.IsMatch(this.Text))
                                {
                                    this.IsValid = false;
                                }
                                break;
                            }
                    }

                    if (this.IsValid == true)
                    {
                        if (this.Text.Trim().Length < MinLength)
                        {
                            this.IsValid = false;
                        }
                    }

                    if (this.IsValid == true)
                    {
                        if (this.Captcha)
                        {
                            if (this.CaptchaValidate != null)
                                this.IsValid = CaptchaValidate();
                            this.Text = string.Empty;
                        }
                    }

                }
            }
        }

        #endregion
    }

    public enum DataType
    {
        Null = 0,
        String = 1,
        Int16 = 3,
        Int32 = 4,
        Int64 = 5,
        Double = 6,
        RegExp = 7
    };


    public class MyTextBoxBaseValidator : BaseValidator, IValidator
    {

        public OsaTextBox tb;

        public MyTextBoxBaseValidator(OsaTextBox textbox, string ValidationGroup)
        {
            tb = textbox;
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
