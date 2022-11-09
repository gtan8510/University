using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace COMP3851B.Views.Admin.AdminEditHomepage
{
    public partial class AddQuote : System.Web.UI.Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {
           
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            if (txtQuote.Text == "")
            {
                lblNotice.Text = " Please enter the quote";
            }
            else if (txtQuotePerson.Text == "")
            {
                lblNotice.Text = "Please enter the speaker of the quote";
            }
            else if (txtQuote.Text == "" && txtQuotePerson.Text == "")
            {
                lblNotice.Text = "Please enter the details of the quote";
            }
            else
            {
                string DbConnect = ConfigurationManager.ConnectionStrings["FunUniversityConnectionString"].ConnectionString;
                SqlConnection con = new SqlConnection(DbConnect);
                //inserting the register data to database
                string ins = "Insert into quotes values ('" + txtQuote.Text + "', '" + txtQuotePerson.Text + "')";
                SqlCommand com = new SqlCommand(ins, con);
                con.Open();
                com.ExecuteNonQuery();
                con.Close();

                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Record Inserted Successfully')", true);
            }
        }
        protected void btnSearch_Click(object sender, EventArgs e)
        {
            string DbConnect = ConfigurationManager.ConnectionStrings["FunUniversityConnectionString"].ConnectionString;
            SqlConnection con = new SqlConnection(DbConnect);
            string ins = "Select * from quotes where (quote like '%' +@quote + '%' or quoteperson like '%' +@quoteperson + '%')";
            SqlCommand cmd = new SqlCommand(ins, con);
            cmd.Parameters.Add("@quote", SqlDbType.NVarChar).Value = txtSearch.Text;
            cmd.Parameters.Add("@quoteperson", SqlDbType.NVarChar).Value = txtSearch.Text;
            con.Open();
            cmd.ExecuteNonQuery();

            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = cmd;
            DataSet ds = new DataSet();
            da.Fill(ds, "quote");
            da.Fill(ds, "quoteperson");

            GridView1.DataSourceID = null;
            GridView1.DataSource = ds;
            GridView1.DataBind();
            con.Close();
            lblNotice.Text = "Data has been selected";

        }
    }
}