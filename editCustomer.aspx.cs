using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Configuration;
using System.Data.SqlClient;

namespace ElectronicsPOS
{
    public partial class editCustomer : System.Web.UI.Page
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

            if (!IsPostBack)
            {
            }

        }
        
        protected override void OnPreInit(EventArgs e)
        {
            base.OnPreInit(e);
            SqlConnection con = new SqlConnection(
            WebConfigurationManager.ConnectionStrings["myConnectionString"].ConnectionString);
            con.Open();
            string query = "select privilege from EMPLOYEE where employeeID = " + Session["user"];
            SqlCommand cmd = new SqlCommand(query, con);
            int output = Convert.ToInt32(cmd.ExecuteScalar());
            if (output == 1)
                MasterPageFile = "pos.master";
            else
                MasterPageFile = "basic.master";
        }
        protected void ApplyBtn_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                SqlConnection con = new SqlConnection(
                        WebConfigurationManager.ConnectionStrings["myConnectionString"].ConnectionString);
                con.Open();
                string query;
                SqlCommand cmd;

                query = "update CUSTOMER set first_name = '" + fnameTxt.Text + "', last_name = '" + lnameTxt.Text + "', customer_email = '" + emailTxt.Text
                  + "', phone_no = '" + phoneTxt.Text + "', shipping_address = '" + addressTxt.Text + "', city = '" + cityTxt.Text + "', state = '" + stateTxt.Text + "', zipcode = '" + zipTxt.Text + "' where customerID = " + CustomerID.Text;
                cmd = new SqlCommand(query, con);
                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>  alert('New information has been stored successfully');location.href=location.href;</script>");
            }
        }

        protected void CustomerID_TextChanged(object sender, EventArgs e)
        {
            string query;
            SqlCommand cmd;
            SqlConnection con = new SqlConnection(
                    WebConfigurationManager.ConnectionStrings["myConnectionString"].ConnectionString);
            con.Open();

            query = "select * from CUSTOMER where customerID = " + CustomerID.Text;   //get current quantity
            cmd = new SqlCommand(query, con);

            SqlDataReader rd = cmd.ExecuteReader();
            if (rd.HasRows)
            {
                while (rd.Read())
                {
                    fnameTxt.Text = rd[4].ToString();
                    lnameTxt.Text = rd[5].ToString();
                    emailTxt.Text = rd[2].ToString();
                    phoneTxt.Text = rd[3].ToString();
                    addressTxt.Text = rd[1].ToString();
                    cityTxt.Text = rd[7].ToString();
                    stateTxt.Text = rd[8].ToString();
                    zipTxt.Text = rd[6].ToString();

                }
            }

            rd.Close();
            con.Close();
        }
    }
}
