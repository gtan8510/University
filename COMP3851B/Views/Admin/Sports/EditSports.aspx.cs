using COMP3851B.BBL;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace COMP3851B.Views.Admin.Sports
{
    public partial class EditSports : System.Web.UI.Page
    {
        public List<sport> Sports;
        protected void Page_Load(object sender, EventArgs e)
        {
            /*
            if (Session["uname"].ToString() != "admin")
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(),
                  "alert",
               "alert('This page is only accessible to Admins');window.location ='UserHome.aspx';",
               true);

            }
            else
            {
                if (IsPostBack == false)
                {
                    txtSportsClubName.Text = "";
                    txtSportsClubDesc.Text = "";



                }
            }*/
        }

        protected void btnCreate_Click(object sender, EventArgs e)
        {
            try
            {
                //Get text fields and add new course
                string textESportsClubName = txtSportsClubName.Text;
                string textESportsClubDesc = txtSportsClubDesc.Text;


                //Create folder and file paths
                var folder = Server.MapPath("~/uploadsCourse/");
                string fileName = Path.GetFileName(SportsClubImg.PostedFile.FileName);
                string filePath = "~/uploads/" + fileName;

                lblSportsClubImage.Text = fileName.ToString();

                //create new directory for product images
                if (!Directory.Exists(folder))
                {
                    Directory.CreateDirectory(folder);
                    //click 'Show All Files' to find folder

                }
                SportsClubImg.PostedFile.SaveAs(Server.MapPath(filePath));

                //Initialise new Product object and add to db
                eSport esport = new eSport(textESportsClubName, textESportsClubDesc, filePath);
                int result = esport.AddeSport();


                if (result == 1) //add successful
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(),
                        "alert",
                        "alert('New product added successfully!');window.location ='ListItem.aspx';",
                        true);
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(),
                        "alert",
                        "alert('An error occured while adding product, please try again');window.location ='ListItem.aspx';",
                        true);
                }
            }
            catch
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(),
                    "alert",
                    "alert('An error has occured. Please contact the developers to fix this issue.');window.location ='AddItem.aspx';",
                    true);
            }






        }
    }
    }
