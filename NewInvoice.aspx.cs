using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Configuration;
using System.Data.SqlClient;
using System.Text;

public partial class NewInvoice : System.Web.UI.Page
{
    static  List<TableRow> TableRows = new List<TableRow>();
    static DataTable table1 = new DataTable("Invoice");
    static DataSet set = new DataSet("office");
    StringBuilder table = new StringBuilder();


    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            TableRows.Clear();
            SqlConnection con = new SqlConnection(
                  WebConfigurationManager.ConnectionStrings["myConnectionString"].ConnectionString);
            con.Open();
            string query = "select Dept_number, Dept_name  from DEPARTMENT";
            SqlCommand cmd = new SqlCommand(query, con);
            DepartmentList.DataSource = cmd.ExecuteReader();
            DepartmentList.DataBind();
            ListItem defaultDept = new ListItem("Select department", "-1");
            DepartmentList.Items.Insert(0, defaultDept);
            con.Close();


        }
        //EmployeeLbl.Text = Session["user"].ToString();
        //CustomerLbl.Text = ;
        //InvLbl.Text =;
        StockTxt.ReadOnly = true;
        StockTxt.BackColor = System.Drawing.SystemColors.Window;

        TableRow tRow = new TableRow();
        Table1.Rows.Add(tRow);
        

            TableCell tCell0 = new TableCell();
        tCell0.Text = "Product_ID";
        tRow.Cells.Add(tCell0);
        TableCell tCell1 = new TableCell();
        tCell1.Text = "Item name";
            tRow.Cells.Add(tCell1);
        TableCell tCell2 = new TableCell();
        tCell2.Text = "Unit Price";
        tRow.Cells.Add(tCell2);
        TableCell tCell3 = new TableCell();
        tCell3.Text = "Quantity";
        tRow.Cells.Add(tCell3);
        TableCell tCell4 = new TableCell();
        tCell4.Text = "Sub-Total";
        tRow.Cells.Add(tCell4);




    }



    protected void Button1_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            decimal currentSale = 0;

            SqlConnection con = new SqlConnection(
               WebConfigurationManager.ConnectionStrings["myConnectionString"].ConnectionString);
            con.Open();
            String name;
            string query = "select name from PRODUCT where productID = " + ProductList.SelectedValue;   
            SqlCommand cmd = new SqlCommand(query, con);
            name = cmd.ExecuteScalar().ToString();
            
            con.Close();

            TableRow tRow1 = new TableRow();


            TableCell tCell0 = new TableCell();
            tCell0.Text = ProductList.SelectedValue;
            tRow1.Cells.Add(tCell0);
            TableCell tCell1 = new TableCell();
            tCell1.Text = name;
            tRow1.Cells.Add(tCell1);
            TableCell tCell2 = new TableCell();
            tCell2.Text = PriceLabel.Text;
            tRow1.Cells.Add(tCell2);
            TableCell tCell3 = new TableCell();
            tCell3.Text = QuantityTxt.Text;
            tRow1.Cells.Add(tCell3);

            decimal subtotal = Convert.ToDecimal(PriceLabel.Text) * Convert.ToDecimal(QuantityTxt.Text);
            TableCell tCell4 = new TableCell();
            tCell4.Text = subtotal.ToString();
            tRow1.Cells.Add(tCell4);

            
            TableRows.Add(tRow1);
            QuantityTxt.Text = "0";
            StockTxt.Text = "0";

            foreach (TableRow row in TableRows)
            {
                Table1.Rows.Add(row);
                currentSale += Convert.ToDecimal(row.Cells[4].Text);

            }
            DepartmentList.ClearSelection();
            ProductList.SelectedIndex = 0;
            String currentTotal = currentSale.ToString();
            TotalLbl.Text = currentTotal;
        }
    }

    protected void DepartmentList_SelectedIndexChanged(object sender, EventArgs e)
    {
        foreach (TableRow row in TableRows)
        {
            Table1.Rows.Add(row);
        }
        if (DepartmentList.SelectedIndex == 0)
        {

            ProductList.Enabled = false;
        }
        else
        {
            ProductList.Enabled = true;
            SqlConnection con = new SqlConnection(
                 WebConfigurationManager.ConnectionStrings["myConnectionString"].ConnectionString);
            con.Open();
            string query = "select productID, name from PRODUCT where dept_no = " + DepartmentList.SelectedValue + "ORDER BY name";
            SqlCommand cmd = new SqlCommand(query, con);
            ProductList.DataSource = cmd.ExecuteReader();
            ProductList.DataBind();
            ListItem defaultProduct = new ListItem("Select product", "-1");
            ProductList.Items.Insert(0, defaultProduct);
            con.Close();
        }
    }

    protected void ProductList_SelectedIndexChanged(object sender, EventArgs e)
    {
        foreach (TableRow row in TableRows)
        {
            Table1.Rows.Add(row);
        }
        SqlConnection con = new SqlConnection(
                WebConfigurationManager.ConnectionStrings["myConnectionString"].ConnectionString);
        con.Open();
        int quantity;
        string query = "select quantity from PRODUCT where productID = " + ProductList.SelectedValue;   //get current quantity
        SqlCommand cmd = new SqlCommand(query, con);
        quantity = Convert.ToInt32(cmd.ExecuteScalar());
        StockTxt.Text =quantity.ToString() ;
        con.Close();

        con.Open();

        query = "select store_price from store_price_record where productID = " + ProductList.SelectedValue + " ORDER BY start_date DESC";   //get current quantity
        cmd = new SqlCommand(query, con);

        decimal price = Convert.ToDecimal(cmd.ExecuteScalar());
        PriceLabel.Text =price.ToString();
    }

    protected void Button2_Click(object sender, EventArgs e)
    {

        foreach (TableRow row in TableRows)
        {
            Table1.Rows.Add(row);
        }
        table.Append("<table border = '0'>");
        table.Append("<tr><th>ID</th><th>Name</th><th>price</th><th>quanitty</th><th>subtotal</th></tr>");



        decimal totalSale = 0;
      
        foreach (TableRow row in TableRows)
        {
            table.Append("<tr>");
            table.Append("<td> " + "haha" + "</td>");
            table.Append("<td> " + row.Cells[1].Text + "</td>");
            table.Append("<td> " + row.Cells[2].Text + "</td>");
            table.Append("<td> " + row.Cells[3].Text + "</td>");
            table.Append("<td> " + row.Cells[4].Text + "</td>");
            totalSale += Convert.ToDecimal(row.Cells[4].Text);
            table.Append("</tr>");

        }
        table.Append("<tr><td> " + totalSale.ToString() + "</td></tr>");
        table.Append("</table");
        PlaceHolder1.Controls.Add(new Literal { Text = table.ToString() });
    }
}