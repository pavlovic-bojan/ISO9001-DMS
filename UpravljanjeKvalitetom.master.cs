using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UpravljanjeKvalitetom : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void CustomValidatorpretraga_ServerValidate1(object source, ServerValidateEventArgs args)
    {
        if (args.Value == "1")
        {
            args.IsValid = false;
        }
        else
        {
            args.IsValid = true;
        }
    }
}
