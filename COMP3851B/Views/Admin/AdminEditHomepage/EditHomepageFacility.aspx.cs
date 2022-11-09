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
    public partial class EditHomepageFacility : System.Web.UI.Page
    {
       
        protected void Page_Load(object sender, EventArgs e)
        {
          
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
             if (txtFacilityName.Text == "")
            {
                lblNotice.Text = " Please enter the quote";
            }
            else if (txtFacilityDesc.Text == "")
            {
                lblNotice.Text = "Please enter the speaker of the quote";
            }
            else if (txtFacilityName.Text == "" && txtFacilityDesc.Text == "")
            {
                lblNotice.Text = "Please enter the details of the quote";
            }
            else
            {
                string DbConnect = ConfigurationManager.ConnectionStrings["FunUniversityConnectionString"].ConnectionString;
                SqlConnection con = new SqlConnection(DbConnect);
                FuFacilityImg.SaveAs(Request.PhysicalApplicationPath + "./Images/" + FuFacilityImg.FileName.ToString());
                a = "Images/" + a + FuFacilityImg.FileName.ToString();

                string ins = "insert into campusFacility (facilityName, facilityDesc, facilityPict) values('" + txtFacilityName.Text + "', '" + txtFacilityDesc.Text +"', '" + a.ToString() + "')";
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
            string ins = "Select * from campusFacility where (facilityName like '%' +@facilityName + '%' or facilityDesc like '%' +@facilityDesc + '%')";
            SqlCommand cmd = new SqlCommand(ins, con);
            cmd.Parameters.Add("@facilityName", SqlDbType.NVarChar).Value = txtSearch.Text;
            cmd.Parameters.Add("@facilityDesc", SqlDbType.NVarChar).Value = txtSearch.Text;
            con.Open();
            cmd.ExecuteNonQuery();

            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = cmd;
            DataSet ds = new DataSet();
            da.Fill(ds, "facilityName");
            da.Fill(ds, "facilityDesc");

            GridView1.DataSourceID = null;
            GridView1.DataSource = ds;
            GridView1.DataBind();
            con.Close();
            lblNotice.Text = "Data has been selected";
        }
}
}
