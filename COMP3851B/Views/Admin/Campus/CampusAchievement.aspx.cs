using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace COMP3851B.Views.Admin
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        string a;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadRecord();
            }
        }
        SqlConnection con = new SqlConnection("Data Source=DESKTOP-ANLBS8M\\SQLEXPRESS;Initial Catalog=COMP3851B;Integrated Security=True");

        protected void btnAdd_Click1(object sender, EventArgs e)
        {
            string fileName = Path.GetFileName(fuAchievementImage.PostedFile.FileName);
            string contentType = fuAchievementImage.PostedFile.ContentType;
            using (Stream fs = fuAchievementImage.PostedFile.InputStream)
            {
                string DbConnect = ConfigurationManager.ConnectionStrings["FunUniversityConnectionString"].ConnectionString;
                SqlConnection con = new SqlConnection(DbConnect);
                fuAchievementImage.SaveAs(Request.PhysicalApplicationPath + "./Images/" + fuAchievementImage.FileName.ToString());
                a = "Images/" + a + fuAchievementImage.FileName.ToString();

                string ins = "insert into campusAchievement (achievementName, achievementImage) values('" + txtAchievementName.Text + "', '" + a.ToString() + "')";
                SqlCommand com = new SqlCommand(ins, con);
                con.Open();
                com.ExecuteNonQuery();
                con.Close();
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Record Inserted Successfully')", true);
            }
        }
        void LoadRecord()
        {
            SqlCommand comm = new SqlCommand("select * from campusAchievement", con);
            SqlDataAdapter d = new SqlDataAdapter(comm);
            DataTable dt = new DataTable();
            d.Fill(dt);
            gridView.DataSource = dt;
            gridView.DataBind();
        }

        
    }   
}