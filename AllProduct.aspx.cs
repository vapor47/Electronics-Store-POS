using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Configuration;
using System.Data.SqlClient;


public partial class AllProduct : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["user"] == null)
        {
            Response.Redirect("~/Login.aspx");
        }
        SqlConnection con = new SqlConnection(
          WebConfigurationManager.ConnectionStrings["myConnectionString"].ConnectionString);
        con.Open();
        string query = "select privilege from EMPLOYEE where employeeID = " + Session["user"];
        SqlCommand cmd = new SqlCommand(query, con);
        if (Convert.ToInt32(cmd.ExecuteScalar()) == 0)
        {
            Response.Redirect("~/Login.aspx");
        }
        con.Close();
    }
}