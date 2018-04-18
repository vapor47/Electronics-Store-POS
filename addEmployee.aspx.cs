using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace electronicspos.com
{
    public partial class addEmployee : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@""); //not sure on the connection name
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand():
            cmd.CommandType = System.Data.CommandType.Text;
            cmd.CommandText = "INSERT INTO EMPLOYEE (Fname, Mname, Lname, privledge) VALUES ('" + Fname.Text + "','" + Mname.Text + "','" + Lname.Text + "','" + privledge.DataValueField + "')";
            cmd.ExecuteNonQuery();

            //return to addEmployee
            Response.Redirect("addEmployee.aspx");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("homePage.aspx"); //not sure on homepage name
        }
    }
}