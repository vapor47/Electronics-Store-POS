using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Configuration;
using System.Data.SqlClient;
using System.Web.Security;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }

    protected void LoginBtn_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(
           WebConfigurationManager.ConnectionStrings["PosDb"].ConnectionString);
        con.Open();

        if (txtID.Text.All(char.IsDigit))   

        {
            string query = "select COUNT(1) from LogIn where ID = " + txtID.Text + " and password = '"
                + FormsAuthentication.HashPasswordForStoringInConfigFile(txtPass.Text, "MD5")
                + "'";
            SqlCommand cmd = new SqlCommand(query, con);
            int output = Convert.ToInt32(cmd.ExecuteScalar());
            if (output == 1)
            {
                query = "select privilege from EMPLOYEE where employeeID = " + txtID.Text;
                cmd = new SqlCommand(query, con);
                Session["user"] = txtID.Text;
                if (Convert.ToInt32(cmd.ExecuteScalar()) == 1)
                    Response.Redirect("~/ManagerView.aspx");
                else
                    Response.Redirect("~/EmployeeView.aspx");

            }
            else
                // Response.Write("Incorrect User Credentials");
                Label.Text = "Incorrect User Credentials";
        }
        else
            Label.Text = "Incorrect User Credentials";
    }

   
}