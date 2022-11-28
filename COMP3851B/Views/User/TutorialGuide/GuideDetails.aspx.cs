using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using COMP3851B.BBL;

namespace COMP3851B.Views.User.TutorialGuide
{
    public partial class GuideDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lblTitle.Text = "";
            lblDesc.Text = "";
            jumbo.Attributes.Remove("background-image");

            int id = Convert.ToInt32(Session["GdeID2Details"]);
            Guide gde = new Guide();
            gde = gde.GetOneGuide(id);
            lblTitle.Text = gde.gdeTitle;
            lblDesc.Text = gde.gdeDesc;
            jumbo.Attributes.Add("background-image", gde.gdeThumbnail);
        }
    }
}