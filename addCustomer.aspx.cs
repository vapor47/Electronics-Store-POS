﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Configuration;
using System.Data.SqlClient;

namespace electronicspos.com
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                MultiView1.SetActiveView(EntreeForm);
            }
        }

        protected void submitCustomer_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(
            WebConfigurationManager.ConnectionStrings["myConnectionString"].ConnectionString);
            con.Open();

            //add entree
            String query = "";
            if (state.SelectedValue.ToString() == "-1")
            {
                query = "insert into CUSTOMER (first_name, last_name, shipping_address, city, zipcode, customer_email, phone_no) values ('" + Fname.Text + "','" + Lname.Text + "','" + street.Text + "','" + city.Text + "','" + zip.Text + "','" + email.Text + "','" + phone.Text + "')";
            }
            else
            { 
                query = "insert into CUSTOMER (first_name, last_name, shipping_address, city, zipcode, state, customer_email, phone_no) values ('" + Fname.Text + "','" + Lname.Text + "','" + street.Text + "','" + city.Text + "','" + zip.Text + "','" + state.SelectedValue.ToString() + "','" + email.Text + "','" + phone.Text + "')";
            }
            SqlCommand cmd = new SqlCommand(query, con);
            cmd.ExecuteNonQuery();
            con.Close();

            /* When I test this it claims the names I entered aren't in the database so it doesn't return anything.
            //retrieve Customer ID
            con.Open();
            query = "select customerID from CUSTOMER where first_name = " + Fname.Text + " and last_name = " + Lname.Text + " order by customerID desc";
            cmd = new SqlCommand(query, con);
            String customerID = cmd.ExecuteScalar().ToString();
            con.Close();*/

            //set labels
            //labelID.Text = customerID;
            labelFname.Text = Fname.Text;
            labelLname.Text = Lname.Text;
            labelEmail.Text = email.Text;
            labelPhone.Text = phone.Text;
            labelStreet.Text = street.Text;
            labelCity.Text = city.Text;
            labelState.Text = state.SelectedValue;
            labelZip.Text = zip.Text;

            //return to addCustomer
            MultiView1.SetActiveView(Summary);
        }

        protected void anotherCustomer_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/addCustomer.aspx");
        }
    }
}