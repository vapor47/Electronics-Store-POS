using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Configuration;
using System.Data.SqlClient;


public partial class NewProduct : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(
        WebConfigurationManager.ConnectionStrings["myConnectionString"].ConnectionString);
        con.Open();
       // if (Session["user"] == null)
       // {
           // Response.Redirect("~/Login.aspx");
       // }
        con.Close();
    }

        protected void CreateBtn_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            SqlConnection con = new SqlConnection(
        WebConfigurationManager.ConnectionStrings["myConnectionString"].ConnectionString);
            con.Open();
            string query = "insert into PRODUCT (model, quantity, brand, name, dept_no, color, size) values ('" + ModelTxt.Text + "',0,'" + BrandTxt.Text
                  + "','" + DescriptionTxt.Text + "','" + DepartmentList.SelectedValue + "','" + ColorTxt.Text + "','" + SizeTxt.Text + "')";
            SqlCommand cmd = new SqlCommand(query, con);
            cmd.ExecuteNonQuery();
            con.Close();
            Response.Redirect("~/ManagerView.aspx");
        }
     
    }
}