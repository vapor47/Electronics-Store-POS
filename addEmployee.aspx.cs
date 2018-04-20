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
            if (!IsPostBack)
            {
                MultiView1.SetActiveView(EntreeForm);
            }

        }

        protected void submitEmployee_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(
            WebConfigurationManager.ConnectionStrings["myConnectionString"].ConnectionString);

            //add employee
            con.Open();
            String query = "insert into EMPLOYEE (Fname, Mname, Lname, privilege) values ('" + Fname.Text + "','" + Mname.Text + "','" + Lname.Text + "','" + privilege.SelectedValue.ToString() + "')";
            SqlCommand cmd = new SqlCommand(query, con);
            cmd.ExecuteNonQuery();
            con.Close();

            //set labels
            labelFname.Text = Fname.Text;
            labelMname.Text = Mname.Text;
            labelLname.Text = Lname.Text;
            labelPrivilege.Text = privilege.SelectedItem.Text;

            MultiView1.SetActiveView(Summary);
        }

        protected void anotherEmployee_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/addEmployee.aspx");
        }
    }
}