using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace electronicspos.com
{
    public partial class createInvoice : System.Web.UI.Page
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
            cmd.CommandText = "INSERT INTO INVOICE (cust_ID, emp_ID, totalSales, payment_method, home_delivery) VALUES ('" + customerID.Text + "','" + employeeeID.Text + "','" + Lname.Text + "',0,'"+payment.Text+"','"+delivery.DataValueField+"')";
            cmd.ExecuteNonQuery();

            //direct to addItem page
            Response.Redirect("addItem.aspx");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("homePage.aspx"); //not sure on homepage name
        }
    }
}