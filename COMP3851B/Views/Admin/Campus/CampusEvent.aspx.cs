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
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadRecord();
            }
        }
        SqlConnection con = new SqlConnection("Data Source=DESKTOP-ANLBS8M\\SQLEXPRESS;Initial Catalog=COMP3851B;Integrated Security=True");


        void LoadRecord()
        {
            SqlCommand comm = new SqlCommand("select * from campusEvent", con);
            SqlDataAdapter d = new SqlDataAdapter(comm);
            DataTable dt = new DataTable();
            d.Fill(dt);
            gridView.DataSource = dt;
            gridView.DataBind();
        }

        protected void btnAdd_Click1(object sender, EventArgs e)
        {
            string fileName = Path.GetFileName(fuEventImage.PostedFile.FileName);
            string contentType = fuEventImage.PostedFile.ContentType;
            using (Stream fs = fuEventImage.PostedFile.InputStream)
            {
                using (BinaryReader br = new BinaryReader(fs))
                {
                    byte[] bytes = br.ReadBytes((Int32)fs.Length);
                    string constr = ConfigurationManager.ConnectionStrings["FunUniversityConnectionString"].ConnectionString;
                    using (SqlConnection con = new SqlConnection(constr))
                    {
                        string query = "Insert into campusEvent values ('" + txtEventName.Text + "', '" + fuEventImage.FileName + "')";
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

        
    }
}