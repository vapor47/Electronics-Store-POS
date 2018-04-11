using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Configuration;
using System.Data.SqlClient;

public partial class ManagerView : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(
           WebConfigurationManager.ConnectionStrings["PosDb"].ConnectionString);
        con.Open();
        if (Session["user"] == null)
        {
            Response.Redirect("~/Login.aspx");
        }
        else
        {
            string query = "select Fname from EMPLOYEE where employeeID = " + Session["user"].ToString();
            SqlCommand cmd = new SqlCommand(query, con);
            
            WelcomeLabel.Text = "Welcome, " + cmd.ExecuteScalar().ToString() + "."; 
        }
    }

    protected void LogoutBtn_Click(object sender, EventArgs e)
    {
        Session.Clear();
        Response.Redirect("~/Login.aspx");
    }
}