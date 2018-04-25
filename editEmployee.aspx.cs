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
    public partial class editEmployee : System.Web.UI.Page
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

        protected void ApplyBtn_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                SqlConnection con = new SqlConnection(
                        WebConfigurationManager.ConnectionStrings["myConnectionString"].ConnectionString);
                con.Open();
                string query;
                SqlCommand cmd;

                query = "update EMPLOYEE set Fname = '" + fnameTxt.Text + "', Lname = '" + lnameTxt.Text + "', Mname = '" + mnameTxt.Text
                  + "', privilege = '" + privilegeDrop.SelectedValue + "' where employeeID = " + employeeID.Text;
                cmd = new SqlCommand(query, con);
                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>  alert('New information has been stored successfully');location.href=location.href;</script>");
            }
        }

        protected void employeeID_TextChanged(object sender, EventArgs e)
        {
            string query;
            SqlCommand cmd;
            SqlConnection con = new SqlConnection(
                    WebConfigurationManager.ConnectionStrings["myConnectionString"].ConnectionString);
            con.Open();

            query = "select * from EMPLOYEE where employeeID = " + employeeID.Text;   //get current quantity
            cmd = new SqlCommand(query, con);

            SqlDataReader rd = cmd.ExecuteReader();
            if (rd.HasRows)
            {
                while (rd.Read())
                {
                    fnameTxt.Text = rd[0].ToString();
                    mnameTxt.Text = rd[1].ToString();
                    lnameTxt.Text = rd[2].ToString();
                    privilegeDrop.SelectedValue = rd[3].ToString();

                }
            }

            rd.Close();
            con.Close();
        }
    }
}