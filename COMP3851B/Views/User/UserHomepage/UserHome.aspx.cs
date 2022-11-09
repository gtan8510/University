using COMP3851B.BBL;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.ModelBinding;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace COMP3851B.Views.User.UserHomepage
{
    public partial class UserHome : System.Web.UI.Page
    {
        //SqlConnection con = new SqlConnection("Data Source=LAPTOP-V9KLQ4QE\\SQLEXPRESS01;Initial Catalog=FunUniversity;Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {
            loadQuote();
            loadCampus();
            loadFacility();
            loadFeedback();
        }

      void loadQuote()
        {
            //displaying the quote in the userdisplay
            string DbConnect = ConfigurationManager.ConnectionStrings["FunUniversityConnectionString"].ConnectionString;
            SqlConnection con = new SqlConnection(DbConnect);

            con.Open();
            SqlCommand cmd = con.CreateCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "Select top (3) [quote], [quotePerson] from [quotes]";
            cmd.ExecuteNonQuery();
            DataTable dt = new DataTable();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
            LVQuotes.DataSource = dt;
            LVQuotes.DataBind();
            con.Close();
        }

       void loadFeedback()
        {
            //disppkay the feedback in the homepage
            string DbConnect = ConfigurationManager.ConnectionStrings["FunUniversityConnectionString"].ConnectionString;
            SqlConnection con = new SqlConnection(DbConnect);

            con.Open();
            SqlCommand cmd = con.CreateCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "Select top (2) [studentFeedback], [studentName] from [studentFeedback]";
            cmd.ExecuteNonQuery();
            DataTable dt = new DataTable();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
            LVTestimonial.DataSource = dt;
            LVTestimonial.DataBind();
            con.Close();
        }

        void loadFacility()
        {
            //disppkay the facility in the homepage
            string DbConnect = ConfigurationManager.ConnectionStrings["FunUniversityConnectionString"].ConnectionString;
            SqlConnection con = new SqlConnection(DbConnect);

            con.Open();
            SqlCommand cmd = con.CreateCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "Select top (3) [FacilityName], [FacilityDesc], [FacilityPict] from [campusFacility]";
            cmd.ExecuteNonQuery();
            DataTable dt = new DataTable();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
            LVFacility.DataSource = dt;
            LVFacility.DataBind();
            con.Close();
        }

        void loadCampus()
        {
            //disppkay the campus in the homepage
            string DbConnect = ConfigurationManager.ConnectionStrings["FunUniversityConnectionString"].ConnectionString;
            SqlConnection con = new SqlConnection(DbConnect);

            con.Open();
            SqlCommand cmd = con.CreateCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "Select top (3) [campusLoc], [campusImg] from [Campus]";
            cmd.ExecuteNonQuery();
            DataTable dt = new DataTable();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
            LVCampus.DataSource = dt;
            LVCampus.DataBind();
            con.Close();
        }
    }
}
