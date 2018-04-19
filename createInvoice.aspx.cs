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
                string query;
                SqlCommand cmd;
                MultiView1.SetActiveView(View1);
                SqlConnection con = new SqlConnection(
                      WebConfigurationManager.ConnectionStrings["myConnectionString"].ConnectionString);

                //Load in Products to Product List
                con.Open();
                query = "SELECT name, productID  FROM PRODUCT";
                cmd = new SqlCommand(query, con);
                productList.DataSource = cmd.ExecuteReader();
                productList.DataBind();
                ListItem defaultProd = new ListItem("Select Product", "-1");
                productList.Items.Insert(0, defaultProd);
                con.Close();
            }

        }

        protected void startInvoice_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(
            WebConfigurationManager.ConnectionStrings["myConnectionString"].ConnectionString);
            String query;
            SqlCommand cmd;

            //confirm Customer ID
            con.Open();
            bool validID = false;
            query = "select customerID from CUSTOMER";
            cmd = new SqlCommand(query, con);
            SqlDataReader rd = cmd.ExecuteReader();
            while (rd.Read())
            {
                if (rd[0].ToString() == customerID.Text)
                {
                    validID = true;
                    break;
                }
            }
            con.Close();

            if (validID)
            {
                //Create Invoice
                con.Open();
                query = "insert into INVOICE (cust_ID, emp_ID, totalSales, payment_method, home_delivery, date_time) values ('" + customerID.Text + "','" + Session["user"] + "',0,'" + payment.SelectedValue.ToString() + "','" + delivery.SelectedValue.ToString() + "', DATEADD (hour, -5, GETDATE()))";
                cmd = new SqlCommand(query, con);
                cmd.ExecuteNonQuery();
                con.Close();

                MultiView1.SetActiveView(View2);
            }

            else
            {
                Response.Write("INVALID! ENTERED CUSTOMER ID DOES NOT EXIST!");
            }
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
            query = "SELECT invoiceID FROM INVOICE WHERE emp_ID = "+Session["user"]+" ORDER BY invoiceID DESC";
            cmd = new SqlCommand(query, con);
            int invoiceID = (int)cmd.ExecuteScalar();
            con.Close();

            //Retrieve the most recent price for the product
            con.Open();
            query = "SELECT store_price FROM store_price_record WHERE productID = " + productList.SelectedValue.ToString() + " ORDER BY start_date DESC";
            cmd = new SqlCommand(query, con);
            double price = Convert.ToDouble(cmd.ExecuteScalar());
            con.Close();

            //Update the total sales on the invoice
            con.Open();
            query = "UPDATE INVOICE SET totalSales = totalSales + " + price.ToString() + " * " + quantity.Text + " WHERE invoiceID = " + invoiceID.ToString();
            cmd = new SqlCommand(query, con);
            cmd.ExecuteNonQuery();
            con.Close();

            //Update product to remove items from inventory
            con.Open();
            query = "UPDATE PRODUCT SET quantity = quantity - " + quantity.Text + " WHERE productID = " + productList.SelectedValue.ToString();
            cmd = new SqlCommand(query, con);
            cmd.ExecuteNonQuery();
            con.Close();

            //Check if item has already been added to the InvoiceDetail
            con.Open();
            bool isExisting = false;
            query = "select Pro_ID from InvoiceDetail";
            cmd = new SqlCommand(query, con);
            SqlDataReader rd = cmd.ExecuteReader();
            while (rd.Read())
            {
                if (rd[0].ToString() == productList.SelectedValue.ToString())
                {
                    isExisting = true;
                    break;
                }
            }
            con.Close();
            if (isExisting)
            {
                //Update InvoiceDetail
                con.Open();
                query = "UPDATE InvoiceDetail SET quantity = quantity + " + quantity.Text + " WHERE Inv_ID = " + invoiceID.ToString() + " AND Pro_ID = " + productList.SelectedValue;
                cmd = new SqlCommand(query, con);
                cmd.ExecuteNonQuery();
                con.Close();
            }   
            else
            {
                //Create InvoiceDetail entree
                con.Open();
                query = "INSERT INTO InvoiceDetail (Inv_ID, Pro_ID, quantity, priceSold) VALUES ('" + invoiceID.ToString() + "','" + productList.SelectedValue.ToString() + "','" + quantity.Text.ToString() + "','" + price.ToString() + "')";
                cmd = new SqlCommand(query, con);
                cmd.ExecuteNonQuery();
                con.Close();

            }

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
            query = "SELECT invoiceID FROM INVOICE WHERE emp_ID = "+Session["user"]+" ORDER BY invoiceID DESC";
            cmd = new SqlCommand(query, con);
            int invoiceID = (int)cmd.ExecuteScalar();
            con.Close();

            //Retrieve the most recent price for the product
            con.Open();
            query = "SELECT store_price FROM store_price_record WHERE productID = " + productList.SelectedValue.ToString() + " ORDER BY start_date DESC";
            cmd = new SqlCommand(query, con);
            double price = Convert.ToDouble(cmd.ExecuteScalar());
            con.Close();

            //Update the total sales on the invoice
            con.Open();
            query = "UPDATE INVOICE SET totalSales = totalSales + " + price.ToString() + " * " + quantity.Text + " WHERE invoiceID = " + invoiceID.ToString();
            cmd = new SqlCommand(query, con);
            cmd.ExecuteNonQuery();
            con.Close();

            //Update product to remove items from inventory
            con.Open();
            query = "UPDATE PRODUCT SET quantity = quantity - " + quantity.Text + " WHERE productID = " + productList.SelectedValue.ToString();
            cmd = new SqlCommand(query, con);
            cmd.ExecuteNonQuery();
            con.Close();

            //Check if item has already been added to the InvoiceDetail
            con.Open();
            bool isExisting = false;
            query = "select Pro_ID from InvoiceDetail";
            cmd = new SqlCommand(query, con);
            SqlDataReader rd = cmd.ExecuteReader();
            while (rd.Read())
            {
                if (rd[0].ToString() == productList.SelectedValue.ToString())
                {
                    isExisting = true;
                    break;
                }
            }
            con.Close();
            if (isExisting)
            {
                //Update InvoiceDetail
                con.Open();
                query = "UPDATE InvoiceDetail SET quantity = quantity + " + quantity.Text + " WHERE Inv_ID = " + invoiceID.ToString() + " AND Pro_ID = " + productList.SelectedValue;
                cmd = new SqlCommand(query, con);
                cmd.ExecuteNonQuery();
                con.Close();
            }
            else
            {
                //Create InvoiceDetail entree
                con.Open();
                query = "INSERT INTO InvoiceDetail (Inv_ID, Pro_ID, quantity, priceSold) VALUES ('" + invoiceID.ToString() + "','" + productList.SelectedValue.ToString() + "','" + quantity.Text.ToString() + "','" + price.ToString() + "')";
                cmd = new SqlCommand(query, con);
                cmd.ExecuteNonQuery();
                con.Close();

            }

            //refresh page since this invoice is finalized
            Response.Redirect("~/createInvoice.aspx");
            
        }


    }
}