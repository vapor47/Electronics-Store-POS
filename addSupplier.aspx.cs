﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace electronicspos.com
{
    public partial class addSupplier : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@""); //not sure on the connection name
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void addSupplier_Click(object sender, EventArgs e)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand():
            cmd.CommandType = System.Data.CommandType.Text;
            cmd.CommandText = "INSERT INTO SUPPLIER (company_name, company_type) VALUES ('" + name.Text + "','" + companyType.DataValueField + "')";
            cmd.ExecuteNonQuery();

            //direct to addSupplier page
            Response.Redirect("addSupplier.aspx");
        }

        protected void returnHome_Click(object sender, EventArgs e)
        {
            Response.Redirect("homePage.aspx"); //not sure on homepage name
        }
    }
}