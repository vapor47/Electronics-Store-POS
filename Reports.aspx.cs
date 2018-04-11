using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace ElectronicsPOS
{
    public partial class Reports : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                MultiView1.SetActiveView(TotalSalesReport);
            }
        }

        protected void MultiView1_ActiveViewChanged(object sender, EventArgs e)
        {

        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlConnection myConnection = new SqlConnection("user id=vapor47;" +
                                       "password=electronics123!;server=electronicspos.database.windows.net;" +
                                       "Trusted_Connection=yes;" +
                                       "database=POS; " +
                                       "connection timeout=30");
            
            try
            {
                myConnection.Open();
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.ToString());
            }

            TextBox startDateText = (TextBox)TotalSalesReport.FindControl("startDateText");
            TextBox endDateText = (TextBox)TotalSalesReport.FindControl("endDateText");
            string startDate = startDateText.Text;
            string endDate = endDateText.Text;

            string queryString = "SELECT *  FROM INVOICE  WHERE datetime LIKE @startDate";
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = queryString;
            cmd.Connection = myConnection;

            myConnection.Open();

            SqlDataReader reader = cmd.ExecuteReader();
            // Data is accessible through the DataReader object here.

            myConnection.Close();
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            SqlConnection myConnection = new SqlConnection("user id=vapor47;" +
                                       "password=electronics123!;server=electronicspos.database.windows.net;" +
                                       "Trusted_Connection=yes;" +
                                       "database=POS; " +
                                       "connection timeout=30");

            try
            {
                myConnection.Open();
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.ToString());
            }

            TextBox customerIDText = (TextBox)CustomerInfo.FindControl("customerIDText");
            if (customerIDText != null)
            {
                string customerID = customerIDText.Text;
                string queryString = "SELECT *  FROM CUSTOMER  WHERE customerID = @customerID";
                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = queryString;
                cmd.Connection = myConnection;

                myConnection.Open();

            SqlDataReader reader = cmd.ExecuteReader();
            // Data is accessible through the DataReader object here.

            myConnection.Close();
            }

            
        }
        protected void Button3_Click(object sender, EventArgs e)
        {
            //MVOrder.ActiveViewIndex = 1;
            MultiView1.SetActiveView(CustomerInfo);
        }
    }
}