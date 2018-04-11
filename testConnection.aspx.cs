using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Configuration;
using System.Data.SqlClient;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        ConnectDB();
    }

    public void ConnectDB()
    {
        SqlConnection con = new SqlConnection(
            WebConfigurationManager.ConnectionStrings["PosDb"].ConnectionString);
        con.Open();
        if (con.State == System.Data.ConnectionState.Open)
        {
            DisplayMessage(this, "Successful Connection");
        }
     
    }
    public static void DisplayMessage(Control page, String msg)
    {
        string myScript = String.Format("alert('{0}')", msg);
        ScriptManager.RegisterStartupScript(page, page.GetType(), "MyScript", myScript, true);
    }
}