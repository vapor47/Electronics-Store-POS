using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Configuration;
using System.Data.SqlClient;

public partial class Restock : System.Web.UI.Page
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
            con.Open();
            query = "select companyID, company_name  from SUPPLIER ORDER BY company_name";
            cmd = new SqlCommand(query, con);
            SupplierList.DataSource = cmd.ExecuteReader();
            SupplierList.DataBind();
            ListItem defaultSupp = new ListItem("Select supplier", "-1");
            SupplierList.Items.Insert(0, defaultSupp);
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

    protected void Button1_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {

            SqlConnection con = new SqlConnection(
                     WebConfigurationManager.ConnectionStrings["myConnectionString"].ConnectionString);
            con.Open();
            int newquantity;
            string query = "select quantity from PRODUCT where productID = " + ProductList.SelectedValue;   //get current quantity
            SqlCommand cmd = new SqlCommand(query, con);
            newquantity = Convert.ToInt32(quantityTxt.Text) + Convert.ToInt32(cmd.ExecuteScalar());
            con.Close();

            con.Open();
            query = "update PRODUCT set quantity = " + newquantity + " where productID = " + ProductList.SelectedValue;     //update quantity
            cmd = new SqlCommand(query, con);
            cmd.ExecuteNonQuery();
            con.Close();




            decimal stock_price = decimal.Parse(PriceTxt.Text);
            con.Open();
            query = "insert into Restock values (" + ProductList.SelectedValue + ", " + SupplierList.SelectedValue
                + ", DATEADD (hour, -5, GETDATE()), " + Convert.ToInt32(quantityTxt.Text) + ", " + stock_price + ")";     //set new price
            cmd = new SqlCommand(query, con);
            cmd.ExecuteNonQuery();
            con.Close();


            Response.Write("<script>  alert('Successfully restock');location.href=location.href;</script>");
            
        }
    }

  
}