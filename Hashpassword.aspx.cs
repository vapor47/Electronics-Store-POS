using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

public partial class Hashpassword : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        string hashResult = FormsAuthentication.HashPasswordForStoringInConfigFile(password.Text,"MD5");
        Label1.Text = "Your hash result is: " + hashResult;

    }
}