using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace COMP3851B.Views.Admin.FoodTour
{
    public partial class EditFood : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            LoadRecord();
        }

        SqlConnection con = new SqlConnection("Data Source=LAPTOP-CKIA7PUJ\\SQLEXPRESS;Initial Catalog=COMP3851B;Integrated Security=True");

        void LoadRecord()
        {
            SqlCommand comm = new SqlCommand("select * from localFood", con);
            SqlDataAdapter d = new SqlDataAdapter(comm);
            DataTable dt = new DataTable();
            d.Fill(dt);
            GridView2.DataSource = dt;
            GridView2.DataBind();
        }

        /*Update button*/
        protected void Button2_Click(object sender, EventArgs e)
        {
            con.Open();
            SqlCommand comm = new SqlCommand("Update localFood set foodName = '" + TextBox9.Text + "', foodImage = '" + FileUpload2.FileName + "', foodLoc = '" + TextBox11.Text + "', foodRecLvl = '" + TextBox12.Text + "', foodPrice = '" + TextBox13.Text + "', foodDesc = '" + TextBox10.Text + "' where foodID = '" + TextBox1.Text + "'", con);
            comm.ExecuteNonQuery();
            con.Close();
            ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Successfully updated');", true);
            LoadRecord();
        }

        /*Delete button*/
        protected void Button3_Click(object sender, EventArgs e)
        {
            con.Open();
            SqlCommand comm = new SqlCommand("Delete localFood where foodID = '" + TextBox1.Text + "'", con);
            comm.ExecuteNonQuery();
            con.Close();
            ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Successfully deleted');", true);
            LoadRecord();
        }

        /*Retrieve button*/
        protected void Button5_Click(object sender, EventArgs e)
        {
            con.Open();
            SqlCommand comm = new SqlCommand("select * from localFood where foodID = '" + TextBox1.Text + "'", con);
            SqlDataReader r = comm.ExecuteReader();
            while (r.Read())
            {
                TextBox9.Text = r.GetValue(1).ToString(); //Name
                TextBox11.Text = r.GetValue(3).ToString(); //Location
                TextBox12.Text = r.GetValue(4).ToString(); //Recommendation Level
                TextBox13.Text = r.GetValue(5).ToString(); //Food Price
                TextBox10.Text = r.GetValue(6).ToString(); //Description
            }
        }
    }
}