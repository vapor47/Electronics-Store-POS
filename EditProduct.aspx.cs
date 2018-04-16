using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Configuration;
using System.Data.SqlClient;

public partial class test : System.Web.UI.Page
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
        string query;
        SqlCommand cmd;
        SqlConnection con = new SqlConnection(
                WebConfigurationManager.ConnectionStrings["myConnectionString"].ConnectionString);
        con.Open();       

        query = "select * from PRODUCT where productID = " + ProductList.SelectedValue;   //get current quantity
        cmd = new SqlCommand(query, con);

        SqlDataReader rd = cmd.ExecuteReader();
        if (rd.HasRows)
        {
            while (rd.Read())
            {
                modelTxt.Text = rd[1].ToString();
                brandTxt.Text = rd[3].ToString();
                nameTxt.Text = rd[4].ToString();
                colorTxt.Text = rd[6].ToString();
                sizeTxt.Text = rd[7].ToString();

            }
        }
       
        rd.Close();
        con.Close();
    }

    protected void ApplyBtn_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(
                WebConfigurationManager.ConnectionStrings["myConnectionString"].ConnectionString);
        con.Open();
        string query;
        SqlCommand cmd;
        
        query = "update PRODUCT set model = '" + modelTxt.Text + "', brand = '" + brandTxt.Text + "', name = '" + nameTxt.Text
          + "', color = '" + colorTxt.Text + "', size = '" + sizeTxt.Text + "' where productID = " + ProductList.SelectedValue; 
        cmd = new SqlCommand(query, con);
        cmd.ExecuteNonQuery();
        con.Close();



        DisplayMessage(this, "New information is set successfully.");
    }

    public static void DisplayMessage(Control page, String msg)
    {
        string myScript = String.Format("alert('{0}')", msg);
        ScriptManager.RegisterStartupScript(page, page.GetType(), "MyScript", myScript, true);
    }
}
