using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace COMP3851B.Views.Admin.Career
{
    public partial class EditSeminar : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadRecord();
            }
        }

        SqlConnection con = new SqlConnection("Data Source=LAPTOP-CKIA7PUJ\\SQLEXPRESS;Initial Catalog=COMP3851B;Integrated Security=True");

        /*Load all database record*/
        void LoadRecord()
        {
            SqlCommand comm = new SqlCommand("select * from seminar", con);
            SqlDataAdapter d = new SqlDataAdapter(comm);
            DataTable dt = new DataTable();
            d.Fill(dt);
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }

        /*Update button*/
        protected void Button2_Click(object sender, EventArgs e)
        {
            con.Open();
            SqlCommand comm = new SqlCommand("Update seminar set seminarImage = '" + FileUpload1.FileName + "', seminarDate = '" + TextBox8.Text + "', seminarName = '" + TextBox2.Text + "', seminarDesc = '" + TextBox3.Text + "', seminarLoc = '" + TextBox4.Text + "', seminarStartTime = '" + TextBox5.Text + "', seminarEndTime = '" + TextBox6.Text + "', seminarOpenTo = '" + TextBox7.Text + "' where seminarID = '" + TextBox1.Text + "'", con);
            comm.ExecuteNonQuery();
            con.Close();
            ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Successfully updated');", true);
            LoadRecord();
        }

        /*Delete button*/
        protected void Button3_Click(object sender, EventArgs e)
        {
            con.Open();
            SqlCommand comm = new SqlCommand("Delete seminar where seminarID = '" + TextBox1.Text + "'", con);
            comm.ExecuteNonQuery();
            con.Close();
            ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Successfully deleted');", true);
            LoadRecord();
        }

        /*Retrieve details button*/
        protected void Button5_Click(object sender, EventArgs e)
        {
            con.Open();
            SqlCommand comm = new SqlCommand("select * from seminar where seminarID = '" + TextBox1.Text + "'", con);
            SqlDataReader r = comm.ExecuteReader();
            while (r.Read())
            {
                TextBox8.Text = r.GetDateTime(2).ToString("yyyy-MM-dd"); //Date
                TextBox2.Text = r.GetValue(3).ToString(); //Name
                TextBox3.Text = r.GetValue(4).ToString(); //Description
                TextBox4.Text = r.GetValue(5).ToString(); //Location
                TextBox5.Text = r.GetValue(6).ToString(); //Start Time
                TextBox6.Text = r.GetValue(7).ToString(); //End Time
                TextBox7.Text = r.GetValue(8).ToString(); //Open To
            }
        }
    }
}