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
                if (delivery.SelectedValue == "1")
                {
                    String address;
                    con.Open();
                    query = "select shipping_address, city, state, zipcode from CUSTOMER where customerID = " + customerID.Text;
                    cmd = new SqlCommand(query, con);
                    rd = cmd.ExecuteReader();

                    if (rd.HasRows)
                    {
                        rd.Read();
                        address = rd[0] + ", " + rd[1] + ", " + rd[2] + " " + rd[3];
                        labelAddress.Text = address;
                        con.Close();

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

                        MultiView1.SetActiveView(AddItem);
                    }
                    else
                    {
                        con.Close();
                        Response.Write("NO SHIPPING INFORMATION AVAILABLE FOR THIS CUSTOMER!");
                    }
                }

                else
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

                    MultiView1.SetActiveView(AddItem);
                }

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

            //confirm valid quantity
            con.Open();
            query = "select quantity from PRODUCT where productID = " + productList.SelectedValue.ToString();
            cmd = new SqlCommand(query, con);
            int quant = (int)cmd.ExecuteScalar();
            con.Close();
            if (quant >= Convert.ToInt32(quantity.Text))
            {
                //check if this brings stock below 25
                if(quant - Convert.ToInt32(quantity.Text) < 26)
                {
                    Response.Write("NOTICE! There are only " + Convert.ToString(quant - Convert.ToInt32(quantity.Text)) + " of " + productList.SelectedItem.Text + " remaining in stock!");
                }

                //Retrieve the Invoice ID we're working on
                con.Open();
                query = "SELECT invoiceID FROM INVOICE WHERE emp_ID = " + Session["user"] + " ORDER BY invoiceID DESC";
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

                //update salesList
                SoldSoFar.Text += "$" + string.Format("{0:0.00}", Convert.ToDouble(quantity.Text) * price) + " " + productList.SelectedItem.Text + " x" + quantity.Text + Environment.NewLine;
                listSales.Text += "$" + string.Format("{0:0.00}", Convert.ToDouble(quantity.Text) * price) + " " + productList.SelectedItem.Text + " x" + quantity.Text + Environment.NewLine;

                //set SalesSoFar
                con.Open();
                query = "select totalSales from INVOICE where invoiceID = " + invoiceID.ToString();
                cmd = new SqlCommand(query, con);
                double total = Convert.ToDouble(cmd.ExecuteScalar());
                SalesSoFar.Text = "$" + string.Format("{0:0.00}", total);
                con.Close();

                //empty boxes to prep for new items to be added
                quantity.Text = string.Empty;
                productList.SelectedIndex = 0;
            }
            else
            {
                Response.Write("INVALID QUANTITY! THERE ARE ONLY " + quant + " OF THIS ITEM IN STOCK!");
            }

        }

        protected void finalize_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(
            WebConfigurationManager.ConnectionStrings["myConnectionString"].ConnectionString);
            SqlCommand cmd;
            String query;

            //confirm valid quantity
            con.Open();
            query = "select quantity from PRODUCT where productID = " + productList.SelectedValue.ToString();
            cmd = new SqlCommand(query, con);
            int quant = (int)cmd.ExecuteScalar();
            con.Close();
            if (quant >= Convert.ToInt32(quantity.Text))
            {
                //Retrieve the Invoice ID we're working on
                con.Open();
                query = "SELECT invoiceID FROM INVOICE WHERE emp_ID = " + Session["user"] + " ORDER BY invoiceID DESC";
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

                //update salesList
                listSales.Text += "$" + string.Format("{0:0.00}", Convert.ToDouble(quantity.Text) * price) + " " + productList.SelectedItem.Text + " x" + quantity.Text;

                //set labelInvoice
                labelInvoice.Text = invoiceID.ToString();

                //set labelTotal
                con.Open();
                query = "select totalSales from INVOICE where invoiceID = " + invoiceID.ToString();
                cmd = new SqlCommand(query, con);
                double total = Convert.ToDouble(cmd.ExecuteScalar());
                labelTotal.Text = "$" + string.Format("{0:0.00}", total);
                con.Close();


                //refresh page since this invoice is finalized
                MultiView1.SetActiveView(Summary);

                //check if this brings stock below 25
                if (quant - Convert.ToInt32(quantity.Text) < 26)
                {
                    Response.Write("NOTICE! There are only " + Convert.ToString(quant - Convert.ToInt32(quantity.Text)) + " of " + productList.SelectedItem.Text + " remaining in stock!");
                }
            }
            else
            {
                Response.Write("INVALID QUANTITY! THERE ARE ONLY " + quant + " OF THIS ITEM IN STOCK!");
            }

        }

        protected void newInvoice_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/createInvoice.aspx");
        }

    }
}