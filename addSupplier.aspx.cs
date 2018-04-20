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
    public partial class addSupplier : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                MultiView1.SetActiveView(EntreeForm);
            }
        }

        protected void submitSupplier_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(
            WebConfigurationManager.ConnectionStrings["myConnectionString"].ConnectionString);

            //add Supplier
            con.Open();
            String query = "insert into SUPPLIER (company_name, company_type) values ('" + name.Text + "','" + compType.Text + "')";
            SqlCommand cmd = new SqlCommand(query,con);
            cmd.ExecuteNonQuery();
            con.Close();

            //set labels
            labelName.Text = name.Text;
            labelType.Text = compType.Text;

            MultiView1.SetActiveView(Summary);
        }

        protected void anotherSupplier_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/addSupplier.aspx");
        }
    }
}