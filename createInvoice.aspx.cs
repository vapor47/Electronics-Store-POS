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
    public partial class createInvoice : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                MultiView1.ActiveViewIndex = 0;
                SqlConnection con = new SqlConnection(
                      WebConfigurationManager.ConnectionStrings["myConnectionString"].ConnectionString);

                //Load in Customers to Customer List
                con.Open();
                string query = "SELECT customerID  FROM CUSTOMER";
                SqlCommand cmd = new SqlCommand(query, con);
                customerList.DataSource = cmd.ExecuteReader();
                customerList.DataBind();
                ListItem defaultCust = new ListItem("Select Customer", "-1");
                customerList.Items.Insert(0, defaultCust);
                con.Close();

                //Load in Products to Product List
                con.Open();
                query = "SELECT name, productID  FROM PRODUCT";
                cmd = new SqlCommand(query, con);
                productList.DataSource = cmd.ExecuteReader();
                customerList.DataBind();
                ListItem defaultProd = new ListItem("Select Product", "-1");
                customerList.Items.Insert(0, defaultCust);
                con.Close();
            }

        }

        protected void startInvoice_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(
            WebConfigurationManager.ConnectionStrings["myConnectionString"].ConnectionString);

            //Create Invoice
            con.Open();
            String query = "INSERT INTO INVOICE (cust_ID, emp_ID, totalSales, payment_method, home_delivery, date_time) VALUES (" + customerList.SelectedValue + "," + Session["user"] + ",0," + payment.SelectedValue.ToString() + ","+delivery.SelectedValue.ToString() + ", DATEADD (hour, -5, GETDATE()))";
            SqlCommand cmd = new SqlCommand(query, con);
            cmd.ExecuteNonQuery();
            con.Close();

            MultiView1.ActiveViewIndex = 1;
        }

        protected void MultiView1_ActiveViewChanged(object sender, EventArgs e)
        {

        }

        protected void anotherItem_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(
            WebConfigurationManager.ConnectionStrings["myConnectionString"].ConnectionString);
            SqlCommand cmd;
            String query;

            //Retrieve the Invoice ID we're working on
            con.Open();
            query = "SELECT invoiceID FROM INVOICE WHERE emp_ID ="+Session["user"]+" ORDER BY invoiceID DESC";
            cmd = new SqlCommand(query, con);
            int invoiceID = (int)cmd.ExecuteScalar();
            con.Close();

            //Retrieve the most recent price for the product
            con.Open();
            query = "SELECT store_price FROM STORE_PRICE_RECORD WHERE productID = " + productList.SelectedValue.ToString() + " ORDER BY start_date DESC";
            cmd = new SqlCommand(query, con);
            double price = (double)cmd.ExecuteScalar();
            con.Close();

            //Update the total sales on the invoice
            con.Open();
            query = "UPDATE INVOICE SET totalSales = totaleSales + " + price.ToString() + " * " + quantity.Text + " WHERE invoiceID = " + invoiceID.ToString();
            cmd = new SqlCommand(query, con);
            cmd.ExecuteNonQuery();
            con.Close();

            //Update product to remove items from inventory
            con.Open();
            query = "UPDATE PRODUCT SET quantity = quantity - " + quantity.Text + " WHERE productID = " + productList.SelectedValue.ToString();
            cmd = new SqlCommand(query, con);
            cmd.ExecuteNonQuery();
            con.Close();

            //Create INVOICE_DETAIL entree
            con.Open();
            query = "INSERT INTO INVOICE_DETAIL (Inv_ID, Pro_ID, quantity, priceSold) VALUES (" + invoiceID.ToString() + ", " + productList.SelectedValue.ToString() + "," + quantity.Text.ToString() + "," + price.ToString() +")";
            cmd = new SqlCommand(query, con);
            cmd.ExecuteNonQuery();
            con.Close();

            //empty boxes to prep for new items to be added
            quantity.Text = string.Empty;
            productList.SelectedIndex = 0;

        }

        protected void finalize_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(
            WebConfigurationManager.ConnectionStrings["myConnectionString"].ConnectionString);
            SqlCommand cmd;
            String query;

            //Retrieve the Invoice ID we're working on
            con.Open();
            query = "SELECT invoiceID FROM INVOICE WHERE emp_ID =" + Session["user"] + " ORDER BY invoiceID DESC";
            cmd = new SqlCommand(query, con);
            int invoiceID = (int)cmd.ExecuteScalar();
            con.Close();

            //Retrieve the most recent price for the product
            con.Open();
            query = "SELECT store_price FROM STORE_PRICE_RECORD WHERE productID = " + productList.SelectedValue.ToString() + " ORDER BY start_date DESC";
            cmd = new SqlCommand(query, con);
            double price = (double)cmd.ExecuteScalar();
            con.Close();

            //Update the total sales on the invoice
            con.Open();
            query = "UPDATE INVOICE SET totalSales = totaleSales+" + price.ToString() + " * " + quantity.Text + " WHERE invoiceID = " + invoiceID.ToString();
            cmd = new SqlCommand(query, con);
            cmd.ExecuteNonQuery();
            con.Close();

            //Update product to remove items from inventory
            con.Open();
            query = "UPDATE PRODUCT SET quantity = quantity - " + quantity.Text + " WHERE productID = " + productList.SelectedValue.ToString();
            cmd = new SqlCommand(query, con);
            cmd.ExecuteNonQuery();
            con.Close();

            //Create INVOICE_DETAIL entree
            con.Open();
            query = "INSERT INTO INVOICE_DETAIL (Inv_ID, Pro_ID, quantity, priceSold) VALUES (" + invoiceID.ToString() + ", " + productList.SelectedValue.ToString() + "," + quantity.Text.ToString() + " * " + price.ToString() + ")";
            cmd = new SqlCommand(query, con);
            cmd.ExecuteNonQuery();
            con.Close();

            //refresh page since this invoice is finalized
            Response.Redirect("~/createInvoice.aspx");
            
        }


    }
}