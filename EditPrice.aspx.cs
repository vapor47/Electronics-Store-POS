using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Configuration;
using System.Data.SqlClient;

public partial class EditPrice : System.Web.UI.Page
{
    
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
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

    }

    protected void DepartmentList_SelectedIndexChanged(object sender, EventArgs e)
    {
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
        SqlConnection con = new SqlConnection(
                WebConfigurationManager.ConnectionStrings["myConnectionString"].ConnectionString);
        con.Open();
        int quantity;
        string query = "select quantity from PRODUCT where productID = " + ProductList.SelectedValue;   //get current quantity
        SqlCommand cmd = new SqlCommand(query, con);
        quantity = Convert.ToInt32(cmd.ExecuteScalar());
        quantityLabel.Text = quantity.ToString() + " unit(s)";
        con.Close();

        con.Open();

        query = "select store_price from store_price_record where productID = " + ProductList.SelectedValue + " ORDER BY start_date DESC";   //get current quantity
        cmd = new SqlCommand(query, con);

        decimal price = Convert.ToDecimal(cmd.ExecuteScalar());
        PriceLabel.Text = "$" + price.ToString();
    }

    protected void ApplyBtn_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            decimal new_price = decimal.Parse(PriceTxt.Text);
            string query;
            SqlCommand cmd;
            SqlConnection con = new SqlConnection(
                  WebConfigurationManager.ConnectionStrings["myConnectionString"].ConnectionString);
            con.Open();


            query = "insert into store_price_record values (" + ProductList.SelectedValue + ", DATEADD (hour, -5, GETDATE()), "
               + new_price + ")";     //set new price
            cmd = new SqlCommand(query, con);
            cmd.ExecuteNonQuery();
            con.Close();


            Response.Write("<script>  alert('New price has been set successfully');location.href=location.href;</script>");
        }
    }


}
