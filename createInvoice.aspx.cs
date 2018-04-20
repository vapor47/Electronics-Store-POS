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
                MultiView1.SetActiveView(Create);
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
                //query = "insert into INVOICE (cust_ID, emp_ID, totalSales, payment_method, home_delivery, date_time) values ('" + customerID.Text + "',1,0,'" + payment.SelectedValue.ToString() + "','" + delivery.SelectedValue.ToString() + "', DATEADD (hour, -5, GETDATE()))"; //local testing
                cmd = new SqlCommand(query, con);
                cmd.ExecuteNonQuery();
                con.Close();

                //set labels
                labelEmployee.Text = Session["user"].ToString();
                //labelEmployee.Text = "1"; //local testing
                labelCustomer.Text = customerID.Text;
                labelPayment.Text = payment.SelectedValue;
                
                /*Need to first confirm if customer has shipping info
                if (delivery.SelectedValue == "1") 
                {
                    String address;
                    con.Open();
                    query = "select shipping_address, city, state, zipcode from CUSTOMER where customerID = " + customerID.Text;
                    cmd = new SqlCommand(query, con);
                    rd = cmd.ExecuteReader();
                    address = rd[0] + ", " + rd[1] + ", " + rd[2] + " " + rd[3];
                    labelAddress.Text = address;
                    con.Close();
                }
                */
                

                MultiView1.SetActiveView(AddItem);
            }

            else
            {
                Response.Write("INVALID! THE ENTERED CUSTOMER ID DOES NOT EXIST!");
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
            //query = "SELECT invoiceID FROM INVOICE WHERE emp_ID = 1 ORDER BY invoiceID DESC"; //local testing
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
            //query = "SELECT invoiceID FROM INVOICE WHERE emp_ID = 1 ORDER BY invoiceID DESC"; //local testing
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

            //set labelTotal
            con.Open();
            query = "select totalSales from INVOICE where invoiceID = " + invoiceID.ToString();
            cmd = new SqlCommand(query, con);
            String total = Convert.ToString(cmd.ExecuteScalar());
            labelTotal.Text = "$"+total;
            con.Close();

            //set labelList
            String salesList = "";
            con.Open();
            query = "select I.quantity, P.name, I.priceSold from InvoiceDetail as I, PRODUCT as P where I.Inv_ID = " + invoiceID.ToString() + " and I.Pro_ID = P.productID";
            cmd = new SqlCommand(query, con);
            rd = cmd.ExecuteReader();
            while (rd.Read())
            {
                salesList += rd[0].ToString() + "x " + rd[1].ToString() + " $" + Convert.ToDouble(rd[2]) * Convert.ToDouble(rd[0]) + "<br />";
            }
            labelList.Text = salesList;

            //refresh page since this invoice is finalized
            MultiView1.SetActiveView(Summary);
            
        }

        protected void newInvoice_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/createInvoice.aspx");
        }

    }
}