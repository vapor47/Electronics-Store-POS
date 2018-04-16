using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

namespace ElectronicsPOS
{
    public partial class Reports : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                MultiView1.SetActiveView(CustomerInfo);
                SqlDataSource SqlDataSource1 = new SqlDataSource();
                SqlDataSource1.ID = "SqlDataSource1";
                this.Page.Controls.Add(SqlDataSource1);
                SqlDataSource1.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["myConnectionString"].ConnectionString;
            }
        }

        protected void MultiView1_ActiveViewChanged(object sender, EventArgs e)
        {

        }

        protected void Menu1_MenuItemClick(object sender, MenuEventArgs e)
        {
            int index = Int32.Parse(e.Item.Value);
            MultiView1.ActiveViewIndex = index;
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlConnection myConnection = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["myConnectionString"].ConnectionString);

            try
            {
                myConnection.Open();
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.ToString());
            }

            TextBox startDateText = (TextBox)TotalSalesReport.FindControl("startDateText");
            TextBox endDateText = (TextBox)TotalSalesReport.FindControl("endDateText");
            string startDate = startDateText.Text;
            string endDate = endDateText.Text;

            string queryString = "SELECT *  FROM INVOICE  WHERE datetime LIKE @startDate";
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = queryString;
            cmd.Connection = myConnection;

            myConnection.Open();

            SqlDataReader reader = cmd.ExecuteReader();

            myConnection.Close();
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            customerID = TextBox1.Text;
            customer_email = TextBox2.Text;
            
            SqlDataSource1.SelectParameters.Clear();
            SqlDataSource1.SelectParameters.Add("customerID", customerID);
            SqlDataSource1.SelectParameters.Add("customer_email", customer_email);
            SqlDataSource1.SelectCommand = "SELECT * from Customer WHERE(@customerID IS NULL OR COALESCE(customerID, '') = @customerID)" +
                "AND(@customer_email IS NULL OR COALESCE(customer_email, '') = @customer_email)";
                //"AND(@field3 IS NULL OR COALESCE(field3, '') like '%' + @field3 + '%')";
            SqlDataSource1.CancelSelectOnNullParameter = false;

            GridView2.DataSource = SqlDataSource1;
            GridView2.DataBind();
        }

        protected void SqlDataSource1_Selected(object sender, SqlDataSourceStatusEventArgs e)
        {
            if (e.AffectedRows < 1)
            {
                Label7.Text = "No matching customer found.";
            }
        }

        protected void GridView1_SelectedIndexChanged1(object sender, EventArgs e)
        {

        }

<<<<<<< HEAD
        string customerID;
        protected void TextBox1_TextChanged(object sender, EventArgs e) => customerID = TextBox1.Text;

        string customer_email;
        protected void TextBox2_TextChanged(object sender, EventArgs e) => customer_email = TextBox2.Text;
=======
        protected void Menu1_MenuItemClick(object sender, MenuEventArgs e)
        {
            int index = Int32.Parse(e.Item.Value);
            MultiView1.ActiveViewIndex = index;
        }
>>>>>>> 73254b76f7a6e28d3f5a1751c54015389e644fe8
    }
}