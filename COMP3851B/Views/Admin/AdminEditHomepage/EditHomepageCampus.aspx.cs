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
    public partial class EditHomepageCampus : System.Web.UI.Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {
         
        }

       
             protected void btnAdd_Click(object sender, EventArgs e)
        {

            string fileName = Path.GetFileName(CampusImg.PostedFile.FileName);
            string contenType = CampusImg.PostedFile.ContentType;
            using (Stream fs = CampusImg.PostedFile.InputStream)
            {
                using (BinaryReader br = new BinaryReader(fs))
                {
                    byte[] bytes = br.ReadBytes((Int32)fs.Length);
                    string constr = ConfigurationManager.ConnectionStrings["FunUniversityConnectionString"].ConnectionString;
                    using(SqlConnection con = new SqlConnection(constr))
                    {
                        string query = "Insert into Campus values ('" + CampusImg.FileName + "', '" + txtCampusName.Text + "')";
                        using (SqlCommand cmd = new SqlCommand(query))
                        {
                            cmd.Connection = con;
                            con.Open();
                            cmd.ExecuteNonQuery();
                            con.Close();
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Successfully inserted');", true);
                        }
                    }
                }
         

        }


    }
    
       protected void btnSearch_Click(object sender, EventArgs e)
        {

        }
        void loadRecord()
        {
            SqlCommand comm = new SqlCommand("Select Top 3 from Campus", con);
            SqlDataAdapter d = new SqlDataAdapter(comm);
            DataTable dt = new DataTable();
            d.Fill(dt);
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }
}
}
    
