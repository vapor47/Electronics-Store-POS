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
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void submitCustomer_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(
            WebConfigurationManager.ConnectionStrings["myConnectionString"].ConnectionString);
            con.Open();

            String query = "";
            if (state.SelectedValue.ToString() == "-1")
            {
                query = "insert into CUSTOMER (first_name, last_name, shipping_address, city, zipcode, customer_email, phone_no) values ('" + Fname.Text + "','" + Lname.Text + "','" + street.Text + "','" + city.Text + "','" + zip.Text + "','" + email.Text + "','" + phone.Text + "')";
            }
            else
            { 
                query = "insert into CUSTOMER (first_name, last_name, shipping_address, city, zipcode, state, customer_email, phone_no) values ('" + Fname.Text + "','" + Lname.Text + "','" + street.Text + "','" + city.Text + "','" + zip.Text + "','" + state.SelectedValue.ToString() + "','" + email.Text + "','" + phone.Text + "')";
            }
            SqlCommand cmd = new SqlCommand(query, con);
            cmd.ExecuteNonQuery();
            con.Close();

            //return to addCustomer
            Response.Redirect("~/addCustomer.aspx");
        }

    }
}