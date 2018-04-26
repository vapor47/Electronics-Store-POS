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
        if (Session["user"] == null)
        {
            Response.Redirect("~/Login.aspx");
        }
        SqlConnection con = new SqlConnection(
          WebConfigurationManager.ConnectionStrings["myConnectionString"].ConnectionString);
        con.Open();
        string query = "select privilege from EMPLOYEE where employeeID = " + Session["user"];
        SqlCommand cmd = new SqlCommand(query, con);
        if (Convert.ToInt32(cmd.ExecuteScalar()) == 0)
        {
            Response.Redirect("~/Login.aspx");
        }
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
            try
            {
                // Write your data access code here 
                cmd.ExecuteNonQuery();
            }
            catch (SqlException sqle)
            {
                string errorMessage = sqle.Message;
                int errorCode = sqle.ErrorCode;
                con.Close();
                Response.Write("<script>  alert('Duplicated model number. Cannot add product');location.href=location.href;</script>");
            }
           
            finally
            {
                con.Close();
                Response.Write("<script>  alert('New product is successfully added.');location.href=location.href;</script>");
            }
            
        }
     
    }
}