﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Configuration;
using System.Data.SqlClient;

public partial class ManagerView : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(
           WebConfigurationManager.ConnectionStrings["myConnectionString"].ConnectionString);
        con.Open();
        if (Session["user"] == null)
        {
            Response.Redirect("~/Login.aspx");
        }
        else
        {
            string query = "select privilege from EMPLOYEE where employeeID = " + Session["user"];
            SqlCommand cmd = new SqlCommand(query, con);
            if (Convert.ToInt32(cmd.ExecuteScalar()) == 1)
            {

                query = "select Fname from EMPLOYEE where employeeID = " + Session["user"].ToString();
                cmd = new SqlCommand(query, con);

                WelcomeLabel.Text = "Welcome, " + cmd.ExecuteScalar().ToString() + ".";
            }
            else
                Response.Redirect("~/EmployeeView.aspx");
        }
    }

    protected void LogoutBtn_Click(object sender, EventArgs e)
    {
        Session.Clear();
        Response.Redirect("~/Login.aspx");
    }



    protected void CheckBtn_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/CheckStock.aspx");
    }

    protected void RestockBtn_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Restock.aspx");
    }

    protected void newBtn_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/NewProduct.aspx");
    }

    protected void EditBtn_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/EditProduct.aspx");
    }

    protected void Button5_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Allproduct.aspx");
    }

    protected void Button6_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/EditPrice.aspx");
    }
}