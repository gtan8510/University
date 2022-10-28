using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace COMP3851B.Views.User.CareerNew
{
    public partial class CareerSeminar : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //LoadRecord();
            }
        }

        //SqlConnection con = new SqlConnection("Data Source=LAPTOP-CKIA7PUJ\\SQLEXPRESS;Initial Catalog=COMP3851B;Integrated Security=True");

        /*void LoadRecord()
        {
            con.Open();
            SqlCommand comm = new SqlCommand("select * from seminar", con);
            SqlDataAdapter d = new SqlDataAdapter(comm);
            DataTable dt = new DataTable();
            d.Fill(dt);

            SqlDataReader r = comm.ExecuteReader();
            if (r.HasRows)
            {
                while (r.Read())
                {
                    Label2.Text = r.GetValue(2).ToString(); //Date
                    Label1.Text = r.GetValue(3).ToString(); //Name
                    Label3.Text = r.GetValue(4).ToString(); //Description
                    Label4.Text = r.GetValue(5).ToString(); //Location
                    Label5.Text = r.GetValue(6).ToString(); //Start Time
                    Label6.Text = r.GetValue(7).ToString(); //End Time
                    Label7.Text = r.GetValue(8).ToString(); //Open To
                }
            }
            r.Close();
        }*/
    }
}