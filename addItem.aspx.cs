using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace electronicspos.com
{
    public partial class addItem : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@""); //not sure on the connection name
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void addItem_Click(object sender, EventArgs e)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand():
            cmd.CommandType = System.Data.CommandType.Text;

            //Retrieve the Invoice ID we're working on
            cmd.CommandText = "SELECT TOP 1 invoiceID, FROM INVOICE, ORDER BY invoiceID DESC";
            String invoiceID = (String)cmd.ExecuteScalar();

            //Retrieve the most recent price for the product
            cmd.CommandText = "SELECT TOP 1 store_price, FROM STORE_PRICE_RECORD, WHERE productID = '" + product.Text + "', ORDER BY start_date DESC";
            int price = (int)cmd.ExecuteScalar();

            //Update the total sales on the invoice
            cmd.CommandText = "UPDATE INVOICE, SET totalSales = totaleSales+'" + price + "'*'" + quantity.Text + "', WHERE invoiceID = '" + invoiceID + "'";
            cmd.ExecuteNonQuery();

            //Update product to remove items from inventory
            cmd.CommandText = "UPDATE PRODUCT, SET quantity = quantity - '" + quantity.Text + "', WHERE productID = '" + product.Text + "'";
            cmd.ExecuteNonQuery();

            //Create INVOICE_DETAIL entree
            cmd.CommandText = "INSERT INTO INVOICE_DETAIL (Inv_ID, Pro_ID, quantity, priceSold) VALUES ('"+invoiceID+"', '"+product.Text+"','"+quantity+"'*'"+price+"')";

            //return to addItem page
            Response.Redirect("addItem.aspx");
        }

        protected void finalizeInvoice_Click(object sender, EventArgs e)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand():
            cmd.CommandType = System.Data.CommandType.Text;

            //Retrieve the Invoice ID we're working on
            cmd.CommandText = "SELECT TOP 1 invoiceID, FROM INVOICE, ORDER BY invoiceID DESC";
            String invoiceID = (String)cmd.ExecuteScalar();

            //Retrieve the most recent price for the product
            cmd.CommandText = "SELECT TOP 1 store_price, FROM STORE_PRICE_RECORD, WHERE productID = '" + product.Text + "', ORDER BY start_date DESC";
            int price = (int)cmd.ExecuteScalar();

            //Update the total sales on the invoice
            cmd.CommandText = "UPDATE INVOICE, SET totalSales = totaleSales+'" + price + "'*'" + quantity.Text + "', WHERE invoiceID = '" + invoiceID + "'";
            cmd.ExecuteNonQuery();

            //Update product to remove items from inventory
            cmd.CommandText = "UPDATE PRODUCT, SET quantity = quantity - '" + quantity.Text + "', WHERE productID = '" + product.Text + "'";
            cmd.ExecuteNonQuery();

            //Create INVOICE_DETAIL entree
            cmd.CommandText = "INSERT INTO INVOICE_DETAIL (Inv_ID, Pro_ID, quantity, priceSold) VALUES ('" + invoiceID + "', '" + product.Text + "','" + quantity + "'*'" + price + "')";

            //return to add Invoice page
            Response.Redirect("createInvoice.aspx");

        }
    }
}