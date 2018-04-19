using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Configuration;
using System.Data.SqlClient;

namespace electronicspos.com
{
    public partial class addEmployee : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            

        }

        protected void submitEmployee_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(
            WebConfigurationManager.ConnectionStrings["myConnectionString"].ConnectionString);

            con.Open();
            String query = "insert into EMPLOYEE (Fname, Mname, Lname, privilege) values ('" + Fname.Text + "','" + Mname.Text + "','" + Lname.Text + "','" + privilege.SelectedValue.ToString() + "')";
            SqlCommand cmd = new SqlCommand(query, con);

            cmd.ExecuteNonQuery();
            con.Close();

            //return to addEmployee
            Response.Redirect("~/addEmployee.aspx");
        }

    }
}