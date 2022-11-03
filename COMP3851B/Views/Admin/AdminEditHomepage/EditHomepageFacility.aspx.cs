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
                string fileName = Path.GetFileName(FuFacilityImg.PostedFile.FileName);
                string contenType = FuFacilityImg.PostedFile.ContentType;
                using (Stream fs = FuFacilityImg.PostedFile.InputStream)
                {
                    using (BinaryReader br = new BinaryReader(fs))
                    {
                        byte[] bytes = br.ReadBytes((Int32)fs.Length);
                        string constr = ConfigurationManager.ConnectionStrings["FunUniversityConnectionString"].ConnectionString;
                        using (SqlConnection con = new SqlConnection(constr))
                        {
                            string query = "Insert into campusFacility values ('" + txtFacilityName.Text + "', '" + txtFacilityDesc.Text + "', '" + FuFacilityImg.FileName + "')";
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
}
