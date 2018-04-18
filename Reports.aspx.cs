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
                MultiView1.SetActiveView(TotalSalesReport);
                SqlDataSource SqlDataSource1 = new SqlDataSource();
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
            startDate = TextBox6.Text;
            endDate = TextBox7.Text;

            SqlDataSource1.SelectParameters.Clear();
            SqlDataSource1.SelectParameters.Add("startDate", startDate);
            SqlDataSource1.SelectParameters.Add("endDate", endDate);
            //SqlDataSource1.SelectParameters.Add("productName", productName);
            SqlDataSource1.SelectCommand = "SELECT * from PRODUCT WHERE(@startDate IS NULL OR COALESCE(date_time, '') >= like '%' + @startDate + '%')" +
                "AND(@endDate IS NULL OR COALESCE(date_time, '') < like '%' + @endDate + '%')";
               // "AND(@productName IS NULL OR COALESCE(Name, '') like '%' + @productName + '%')";
            SqlDataSource1.CancelSelectOnNullParameter = false;

            GridView4.DataSource = SqlDataSource1;
            GridView4.DataBind();
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
            SqlDataSource1.SelectCommand = "SELECT invoiceID, date_time ,totalSales, payment_method from invoice WHERE(@customerID IS NULL OR COALESCE(cust_ID, '') = @customerID)";
            GridView3.DataSource = SqlDataSource1;
            GridView3.DataBind();
        }

        protected void SqlDataSource1_Selected(object sender, SqlDataSourceStatusEventArgs e)
        {
            if (e.AffectedRows < 1)
            {
                Label7.Text = "No results found.";
            }
        }
        

        string customerID;
        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {
            customerID = TextBox1.Text;
        }
        string customer_email;
        protected void TextBox2_TextChanged(object sender, EventArgs e)
        {
            customer_email = TextBox2.Text;
        }
        string productID;
        protected void TextBox3_TextChanged(object sender, EventArgs e)
        {
            productID = TextBox3.Text;
        }
        string brand;
        protected void TextBox4_TextChanged(object sender, EventArgs e)
        {
            brand = TextBox4.Text;
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            productID = TextBox3.Text;
            brand = TextBox4.Text;

            SqlDataSource1.SelectParameters.Clear();
            SqlDataSource1.SelectParameters.Add("productID", productID);
            SqlDataSource1.SelectParameters.Add("brand", brand);
            SqlDataSource1.SelectParameters.Add("productName", productName);
            SqlDataSource1.SelectCommand = "SELECT * from PRODUCT WHERE(@productID IS NULL OR COALESCE(productID, '') = @productID)" +
                "AND(@brand IS NULL OR COALESCE(brand, '') = @brand)" +
                "AND(@productName IS NULL OR COALESCE(Name, '') like '%' + @productName + '%')";
            SqlDataSource1.CancelSelectOnNullParameter = false;

            GridView1.DataSource = SqlDataSource1;
            GridView1.DataBind();
            /*
            SqlDataSource1.SelectCommand = "SELECT invoiceID, date_time ,totalSales, payment_method from invoice WHERE(@customerID IS NULL OR COALESCE(cust_ID, '') = @customerID)";
            GridView3.DataSource = SqlDataSource1;
            GridView3.DataBind();
            */
        }
        string productName;
        protected void TextBox5_TextChanged(object sender, EventArgs e)
        {
            productName = TextBox5.Text;
        }
        string startDate;
        protected void TextBox6_TextChanged(object sender, EventArgs e)
        {
            startDate = TextBox6.Text;
        }
        string endDate;
        protected void TextBox7_TextChanged(object sender, EventArgs e)
        {
            endDate = TextBox7.Text;
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            employeeID= TextBox8.Text;
            //customer_email = TextBox2.Text;

            SqlDataSource1.SelectParameters.Clear();
            SqlDataSource1.SelectParameters.Add("employeeID", employeeID);
            //SqlDataSource1.SelectParameters.Add("customer_email", customer_email);
            SqlDataSource1.SelectCommand = "SELECT * from employee WHERE(@employeeID IS NULL OR COALESCE(employeeID, '') = @employeeID)";
            //    "AND(@customer_email IS NULL OR COALESCE(customer_email, '') = @customer_email)";
            //"AND(@field3 IS NULL OR COALESCE(field3, '') like '%' + @field3 + '%')";
            SqlDataSource1.CancelSelectOnNullParameter = false;

            GridView5.DataSource = SqlDataSource1;
            GridView5.DataBind();
            SqlDataSource1.SelectCommand = "SELECT invoiceID, date_time ,totalSales, payment_method from invoice WHERE(@employeeID IS NULL OR COALESCE(emp_ID, '') = @employeeID)";
            GridView6.DataSource = SqlDataSource1;
            GridView6.DataBind();
        }
        string employeeID;
        protected void TextBox8_TextChanged(object sender, EventArgs e)
        {
            employeeID = TextBox8.Text;
        }
    }
}