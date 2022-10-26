using COMP3851B.BBL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.IO;
using System.Web.UI.WebControls;
using System.Text.RegularExpressions;

namespace COMP3851B.Views.Admin.AdminEditHomepage
{

    public partial class EditHomepageCourse : System.Web.UI.Page
    {
        public List<Course> courses;//List for strong course data
       
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (!IsPostBack)
            {
                Course crs = new Course();
                txtCourseName.Text = "";
                txtCourseDesc.Text = "";
                lblID.Text = "Course ID: (No row selected)";
                uploadThumbnail.Attributes.Clear();
                

                courses = crs.GetAll();

                GvCourse.DataSource = courses;
                GvCourse.DataBind();
            }
           
            
        }

        protected void btnCreate_Click(object sender, EventArgs e)
        {
          





          }

        protected void GVCat_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                //get id of data row
                GridViewRow row = GvCourse.SelectedRow;
                int id = Convert.ToInt32(row.Cells[0].Text);

                //Retrieve data of selected data row using GuideID
                Course gde = new Course();
                gde = gde.RetrieveOne(id);

                //Display retrieved item
                txtCourseName.Text = gde.CName;
              
                txtCourseDesc.Text = gde.CDesc;
                ImgThumbnail.ImageUrl = gde.CPict;
                lblCourseName.Text = "Course ID: " + gde.CId.ToString();

                //Change Add/Search buttons to Save/Cancel for editing phase
                btnAdd.Text = "Save";
                btnSearch.Text = "Cancel";
            }
            catch //Internal code error
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('An error has occured while trying to select a row to edit. Please contact the developers about the issue.')", true);
            }
        }

        protected void GvCourse_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GvCourse.PageIndex = e.NewPageIndex;

            //Bind page data to gridview
            Course crs = new Course();
            courses = crs.GetAll();
            GvCourse.DataSource = courses;
            GvCourse.DataBind();
        }

        protected void GvCourse_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            //Get id of data row
            int id = Convert.ToInt32(GvCourse.DataKeys[e.RowIndex].Value);

            Course crs = new Course();
            try
            {
                //Delete selected row
                int result = crs.DeleteCourse(id);
                if(result == 1)//successful
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Item deleted successfully.')", true);
                    courses = crs.GetAll();

                    GvCourse.DataSource = courses;
                    GvCourse.DataBind();

                    txtCourseName.Text = "";
                    txtCourseDesc.Text = "";
                    uploadThumbnail.Attributes.Clear();
                }
                else
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Deletion unsuccessful. Please try again.')", true);
                }
            }
            catch //Internal code error
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('An error has occured when deleting item row. Please contact the developers about the issue.')", true);
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            string btnName = (sender as Button).Text;
            if (btnName == "Cancel")// Button name = "Cancel"
            {
                //empty data rows
                txtCourseName.Text = "";
                txtCourseDesc.Text = "";
                uploadThumbnail.Attributes.Clear();
                lblID.Text = "Guide ID: (No row selected)";

                //change add/search buttons to save/cancel for editing phase
                btnAdd.Text = "Save";
                btnSearch.Text = "Cancel";
            }//button name = "search"
            else
            {
                //get coursename field data
                string substring = txtCourseName.Text.Trim();
                Course crs = new Course();

                try
                {
                    //search database for searching substring
                    courses = crs.search(substring);
                    if (courses == null)
                    {

                        lblNotice.Text = "No matching data found. Showing all data";
                    }
                    else
                    {
                        lblNotice.Text = "";
                        GvCourse.DataSource = courses;
                        GvCourse.DataBind();
                    }
                }
                catch//internal code error
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('An error has occured while trying to search for a row. Please contact the developers about the issue.')", true);
                }
            }
            
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            string btnName = (sender as Button).Text; 

            if (btnName == "Add")//Button name = "Add"
            {
                //get all field data
                string name = txtCourseName.Text;
                string desc = txtCourseDesc.Text;

                //get thumbnail file and upload it to project folder
                var folder = Server.MapPath("~/uploads/");
                string fileName = Path.GetFileName(uploadThumbnail.PostedFile.FileName);
                if(fileName == "")
                {
                    fileName = "insertimage.png";
                }
                string filePath = "~/uploads/" + fileName;

                //create new directory for product images
                if (!Directory.Exists(folder))
                {
                    Directory.CreateDirectory(folder);
                    //click 'Show All Files' to find folder

                }
                uploadThumbnail.PostedFile.SaveAs(Server.MapPath(filePath));

           

                Course crs = new Course(name, desc, filePath);

                try
                {
                    //Add new course to database
                    int result = crs.AddCourse();

                    if(result == 1) //successful
                    {
                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Item added successfully.')", true);

                        txtCourseName.Text = "";
                        txtCourseDesc.Text = "";
                        uploadThumbnail.Attributes.Clear();
                        //txtSummorate.Text = "";
                        lblID.Text = "Course ID: (No row selected)";

                        //Rebind updated data
                        courses = crs.GetAll();
                        GvCourse.DataSource = courses;
                        GvCourse.DataBind();
                    }
                    else //unsuccessful
                    {
                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('A record for this  already exists. Please enter a different item.')", true);
                    }
                }
                catch //internal code error
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('An error has occured when adding new item. Please contact the developers about the issue.')", true);
                }
            }

            else //button name ="save"
            {
                //Get all field data
                string name = txtCourseName.Text;
                string desc = txtCourseDesc.Text;
                int id = Int32.Parse(Regex.Match(lblID.Text, @"\d+").Value);

                

                //Get filename, if no new file name retrieve current thumbnail file
                string fileName = Path.GetFileName(uploadThumbnail.PostedFile.FileName);
                if (fileName == "")
                {
                    fileName = ImgThumbnail.ImageUrl;
                }
                string filePath = "~/uploads/" + fileName;

                uploadThumbnail.PostedFile.SaveAs(Server.MapPath(filePath));

                Course crs = new Course(name, desc, filePath);

                try
                {
                    //update new data
                    int result = crs.UpdateCourse(id);
                    
                    if (result == 1)//successful
                    {
                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Item updated successfully.')", true);

                        txtCourseName.Text = "";
                        
                        uploadThumbnail.Attributes.Clear();
                        txtCourseDesc.Text = "";
                        lblID.Text = "Guide ID: (No row selected)";

                        //Rebind updated data
                        courses = crs.GetAll();
                        GvCourse.DataSource = courses;
                        GvCourse.DataBind();

                        btnAdd.Text = "Add";
                        btnSearch.Text = "Search";
                    }
                    else //unsuccessful
                    {
                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Unable to update item. Please try again.')", true);
                    }
                }
                catch //Internal code error
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('An error has occured when updating an item. Please contact the developers about the issue.')", true);

                }
            }
               
        }
    }
    }
    
    
  





           