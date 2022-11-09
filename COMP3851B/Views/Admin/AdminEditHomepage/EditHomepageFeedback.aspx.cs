using COMP3851B.BBL;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace COMP3851B.Views.Admin.AdminEditHomepage
{
    
    public partial class EditHomepageFeedback : System.Web.UI.Page
    {
        public List<Feedback> feedback;
        protected void Page_Load(object sender, EventArgs e)
        {
            
            
        }
        
         protected void btnSearch_Click(object sender, EventArgs e)
        {
            string DbConnect = ConfigurationManager.ConnectionStrings["FunUniversityConnectionString"].ConnectionString;
            SqlConnection con = new SqlConnection(DbConnect);
            string ins = "Select * from studentFeedback where (studentName like '%' + @studentName + '%' or studentFeedback like '%' +@studentFeedback + '%')";
            SqlCommand cmd = new SqlCommand(ins, con);
            cmd.Parameters.Add("@studentName", SqlDbType.NVarChar).Value = txtSearch.Text;
            cmd.Parameters.Add("@studentFeedback", SqlDbType.NVarChar).Value = txtSearch.Text;
            con.Open();
            cmd.ExecuteNonQuery();

            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = cmd;
            DataSet ds = new DataSet();
            da.Fill(ds, "studentName");
            da.Fill(ds, "studentFeedback");
            GridViewStudentFeedback.DataSourceID = null;
            GridViewStudentFeedback.DataSource = ds;
            GridViewStudentFeedback.DataBind();
            con.Close();
            lblNotice.Text = "Data has been selected";
        }

       
    }
    }
