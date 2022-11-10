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
        string a;
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
            string DbConnect = ConfigurationManager.ConnectionStrings["FunUniversityConnectionString"].ConnectionString;
            SqlConnection con = new SqlConnection(DbConnect);
            fuEventImage.SaveAs(Request.PhysicalApplicationPath + "./Images/" + fuEventImage.FileName.ToString());
            a = "Images/" + a + fuEventImage.FileName.ToString();

            string ins = "insert into campusEvent (eventName, eventImage) values('" + txtEventName.Text + "', '" + a.ToString() + "')";
            SqlCommand com = new SqlCommand(ins, con);
            con.Open();
            com.ExecuteNonQuery();
            con.Close();
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Record Inserted Successfully')", true);
        }

        
    }
}