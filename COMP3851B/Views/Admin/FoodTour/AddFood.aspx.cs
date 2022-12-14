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

namespace COMP3851B.Views.Admin.FoodTour
{
    public partial class AddFood : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            /*if (Session["uname"].ToString() != "admin")
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(),"alert","alert('This page is only accessible to Admins');window.location ='UserHome.aspx';",true);
            }
            else
            {*/
                LoadRecord();
            /*}*/
        }

        SqlConnection conn = new SqlConnection("Data Source=LAPTOP-CKIA7PUJ\\SQLEXPRESS;Initial Catalog=COMP3851B;Integrated Security=True");

        /*Add button*/
        protected void btnAdd_Click(object sender, EventArgs e)
        {
            //Create folder and file paths
            var folder = Server.MapPath("~/uploads/");
            string fileName = Path.GetFileName(FileUpload2.PostedFile.FileName);
            string filePath = "~/images/" + fileName;

            //create new directory for images
            if (!Directory.Exists(folder))
            {
                Directory.CreateDirectory(folder);
                //click 'Show All Files' to find folder

            }
            FileUpload2.PostedFile.SaveAs(Server.MapPath(filePath));

            //string filename = Path.GetFileName(FileUpload2.PostedFile.FileName);
            string contentType = FileUpload2.PostedFile.ContentType;
            using (Stream fs = FileUpload2.PostedFile.InputStream)
            {
                using (BinaryReader br = new BinaryReader(fs))
                {
                    byte[] bytes = br.ReadBytes((Int32)fs.Length);
                    string constr = ConfigurationManager.ConnectionStrings["My3851BConnectionString"].ConnectionString;
                    using (SqlConnection con = new SqlConnection(constr))
                    {
                        string query = "Insert into localFood values('" + TextBox9.Text + "','" + FileUpload2.FileName + "','" + TextBox11.Text + "','" + TextBox12.Text + "','" + TextBox13.Text + "','" + TextBox10.Text + "')";
                        using (SqlCommand cmd = new SqlCommand(query))
                        {
                            cmd.Connection = con;
                            con.Open();
                            cmd.ExecuteNonQuery();
                            con.Close();
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Successfully inserted');", true);
                            LoadRecord();
                        }
                    }
                }
            }
        }

        void LoadRecord()
        {
            SqlCommand comm = new SqlCommand("select * from localFood", conn);
            SqlDataAdapter d = new SqlDataAdapter(comm);
            DataTable dt = new DataTable();
            d.Fill(dt);
            GridView2.DataSource = dt;
            GridView2.DataBind();
        }
    }
}