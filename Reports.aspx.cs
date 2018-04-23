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
        protected void TotalSales_Click(object sender, EventArgs e)
        {
            startDate = TextBox6.Text;
            endDate = TextBox7.Text + " 23:59:59:999";
            Label20.Text = string.Empty;

            SqlDataSource1.SelectParameters.Clear();
            SqlDataSource1.SelectParameters.Add("startDate", startDate);
            SqlDataSource1.SelectParameters.Add("endDate", endDate);
            SqlDataSource1.SelectCommand = "SELECT * from INVOICE WHERE date_time BETWEEN CONVERT(datetime, @startDate) AND CONVERT(datetime, @endDate)";
            //SqlDataSource1.SelectCommand = "SELECT * from INVOICE WHERE(@startDate IS NULL OR COALESCE(date_time, '') like '%' + @startDate + '%')" +
            //    "AND(@endDate IS NULL OR COALESCE(date_time, '') like '%' + @endDate + '%')";
               // "AND(@productName IS NULL OR COALESCE(Name, '') like '%' + @productName + '%')";
            SqlDataSource1.CancelSelectOnNullParameter = false;
            if(startDate == "" || endDate == "")
            {
                Label20.Text = "Please enter a valid date range.";
            }
            else
            {
                GridView4.DataSource = SqlDataSource1;
                GridView4.DataBind();
                if(GridView4.Rows.Count == 0){
                    Label20.Text = "No matching results found.";
                }
            }
        }

        protected void Customer_Click(object sender, EventArgs e)
        {
            customerID = TextBox1.Text;
            customer_email = TextBox2.Text;

            Label7.Text = string.Empty;
            Label8.Text = string.Empty;
            Label25.Text = string.Empty;

            SqlDataSource1.SelectParameters.Clear();
            SqlDataSource1.SelectParameters.Add("customerID", customerID);
            SqlDataSource1.SelectParameters.Add("customer_email", customer_email);
            SqlDataSource1.SelectCommand = "SELECT * from Customer WHERE(@customerID IS NULL OR COALESCE(customerID, '') = @customerID)" +
                "AND(@customer_email IS NULL OR COALESCE(customer_email, '') = @customer_email)";
                //"AND(@field3 IS NULL OR COALESCE(field3, '') like '%' + @field3 + '%')";
            SqlDataSource1.CancelSelectOnNullParameter = false;

            GridView2.DataSource = SqlDataSource1;
            GridView2.DataBind();
            if (GridView2.Rows.Count == 0)
            {
                Label7.Text = "No matching results found.";
                Label8.Text = string.Empty;

                GridView3.DataSource = null;
                GridView3.DataBind();
            }
            else
            {
                Label8.Text = "Past Transactions:";
                SqlDataSource1.SelectCommand = "SELECT invoiceID, date_time ,totalSales, payment_method from invoice WHERE(@customerID IS NULL OR COALESCE(cust_ID, '') = @customerID)";
                GridView3.DataSource = SqlDataSource1;
                GridView3.DataBind();
                if (GridView3.Rows.Count == 0)
                {
                    Label25.Text = "No transactions found.";
                }
            }
        }

        protected void SqlDataSource1_Selected(object sender, SqlDataSourceStatusEventArgs e)
        {
            if (e.AffectedRows < 1)
            {
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

        protected void Inventory_Click(object sender, EventArgs e)
        {
            productID = TextBox3.Text;
            brand = TextBox4.Text;
            string quantity = TextBox11.Text;
            Label16.Text = string.Empty;
            SqlDataSource1.SelectParameters.Clear();
            SqlDataSource1.SelectParameters.Add("productID", productID);
            SqlDataSource1.SelectParameters.Add("brand", brand);
            SqlDataSource1.SelectParameters.Add("productName", productName);
            SqlDataSource1.SelectParameters.Add("quantity", quantity);
            SqlDataSource1.SelectCommand = "SELECT * from PRODUCT WHERE(@productID IS NULL OR COALESCE(productID, '') = @productID)" +
                "AND(@brand IS NULL OR COALESCE(brand, '') = @brand)" +
                "AND(@productName IS NULL OR COALESCE(Name, '') like '%' + @productName + '%')" +
                "AND(@quantity IS NULL OR COALESCE(quantity, '') < @quantity)";
            SqlDataSource1.CancelSelectOnNullParameter = false;

            GridView1.DataSource = SqlDataSource1;
            GridView1.DataBind();
            if (GridView1.Rows.Count == 0)
            {
                Label16.Text = "No matching results found.";
            }
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
        
        protected void Employee_Click(object sender, EventArgs e)
        {
            employeeID= TextBox8.Text;
            firstName = TextBox9.Text;
            lastName = TextBox10.Text;

            Label22.Text = string.Empty;
            Label23.Text = string.Empty;
            Label26.Text = string.Empty;

            SqlDataSource1.SelectParameters.Clear();
            SqlDataSource1.SelectParameters.Add("employeeID", employeeID);
            SqlDataSource1.SelectParameters.Add("firstName", firstName);
            SqlDataSource1.SelectParameters.Add("lastName", lastName);
            SqlDataSource1.SelectCommand = "SELECT Fname, Mname, Lname, employeeID, CASE WHEN privilege = 1 THEN 'Manager' ELSE 'Regular' END AS privilege from employee WHERE(@employeeID IS NULL OR COALESCE(employeeID, '') = @employeeID)" +
                "AND(@firstName IS NULL OR COALESCE(Fname, '') = @firstName)" +
                "AND(@lastName IS NULL OR COALESCE(Lname, '') = @lastName)";
            SqlDataSource1.CancelSelectOnNullParameter = false;
            GridView5.DataSource = SqlDataSource1;
            GridView5.DataBind();
            if (GridView5.Rows.Count == 0)
            {
                Label26.Text = "No matching results found.";
                GridView6.DataSource = null;
                GridView6.DataBind();
            }
            else
            {
                
                Label22.Text = "Transactions Handled:";
                SqlDataSource1.SelectCommand = "SELECT invoiceID, date_time ,totalSales, payment_method from invoice WHERE(@employeeID IS NULL OR COALESCE(emp_ID, '') = @employeeID)";
                GridView6.DataSource = SqlDataSource1;
                GridView6.DataBind();
                if (GridView6.Rows.Count == 0)
                {
                    Label23.Text = "No transactions found.";
                }
            }
        }
        string employeeID;
        protected void TextBox8_TextChanged(object sender, EventArgs e)
        {
            employeeID = TextBox8.Text;
        }

        string firstName;
        protected void TextBox9_TextChanged(object sender, EventArgs e)
        {
            firstName = TextBox9.Text;
        }
        string lastName;
        protected void TextBox10_TextChanged(object sender, EventArgs e)
        {
            lastName = TextBox10.Text;
        }

        protected void TextBox11_TextChanged(object sender, EventArgs e)
        {

        }

        protected void Restock_Click(object sender, EventArgs e)
        {
            startDate = TextBox12.Text;
            endDate = TextBox13.Text + " 23:59:59:999";
            Label29.Text = string.Empty;

            SqlDataSource1.SelectParameters.Clear();
            SqlDataSource1.SelectParameters.Add("startDate", startDate);
            SqlDataSource1.SelectParameters.Add("endDate", endDate);
            SqlDataSource1.SelectCommand = "SELECT restock.productID, name, stock_date, stock_quantity, stock_price, company_name from RESTOCK, SUPPLIER, PRODUCT WHERE stock_date BETWEEN CONVERT(datetime, @startDate) " +
                "AND CONVERT(datetime, @endDate) AND RESTOCK.companyID = SUPPLIER.companyID AND PRODUCT.productID = RESTOCK.productID";
            SqlDataSource1.CancelSelectOnNullParameter = false;
            if (startDate == "" || endDate == "")
            {
                Label29.Text = "Please enter a valid date range.";
            }
            else
            {
                GridView7.DataSource = SqlDataSource1;
                GridView7.DataBind();
                if (GridView7.Rows.Count == 0)
                {
                    Label29.Text = "No matching results found.";
                }
            }
        }

        protected void PurchaseHistory_Click(object sender, EventArgs e)
        {
            startDate = TextBox14.Text;
            endDate = TextBox15.Text + " 23:59:59:999";
            customerID = TextBox16.Text;

            Label35.Text = string.Empty;

            SqlDataSource1.SelectParameters.Clear();
            SqlDataSource1.SelectParameters.Add("startDate", startDate);
            SqlDataSource1.SelectParameters.Add("endDate", endDate);
            SqlDataSource1.SelectParameters.Add("customerID", customerID);
            SqlDataSource1.SelectCommand = "SELECT * from INVOICE WHERE date_time BETWEEN CONVERT(datetime, @startDate) AND CONVERT(datetime, @endDate) AND cust_ID = @customerID";
            SqlDataSource1.CancelSelectOnNullParameter = false;
            if (startDate == "" || endDate == "" || customerID == "")
            {
                Label35.Text = "Please fill in all fields.";
            }
            else
            {
                GridView8.DataSource = SqlDataSource1;
                GridView8.DataBind();
                if (GridView8.Rows.Count == 0)
                {
                    Label35.Text = "No matching results found.";
                }
            }
        }

        protected void TransactionDetails_Click(object sender, EventArgs e)
        {
            string invoiceID = TextBox17.Text;

            Label41.Text = string.Empty;
            Label42.Text = string.Empty;

            SqlDataSource1.SelectParameters.Clear();
            SqlDataSource1.SelectParameters.Add("invoiceID", invoiceID);
            SqlDataSource1.SelectCommand = "SELECT date_time, totalSales, payment_method, CASE WHEN home_delivery = 1 THEN 'Yes' ELSE 'No' END AS home_delivery from INVOICE WHERE(@invoiceID IS NULL OR COALESCE(invoiceID, '') = @invoiceID)";
            SqlDataSource1.CancelSelectOnNullParameter = false;
            if (invoiceID == "")
            {
                Label41.Text = "Please enter a Transaction ID.";
            }
            else
            {
                GridView9.DataSource = SqlDataSource1;
                GridView9.DataBind();
                if (GridView9.Rows.Count == 0)
                {
                    Label41.Text = "Transaction not found.";
                    Label42.Text = string.Empty;

                    GridView10.DataSource = null;
                    GridView10.DataBind();
                }
                else
                {
                    Label42.Text = "Products Sold:";
                    SqlDataSource1.SelectCommand = "SELECT pro_ID, invoiceDetail.quantity, priceSold, name from invoiceDetail, Product WHERE(@InvoiceID IS NULL OR COALESCE(Inv_ID, '') = @invoiceID) AND product.productID = invoiceDetail.Pro_ID";
                    GridView10.DataSource = SqlDataSource1;
                    GridView10.DataBind();
                }
            }
        }

        protected void TextBox17_TextChanged(object sender, EventArgs e)
        {

        }
    }
}