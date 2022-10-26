using COMP3851B.BBL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace COMP3851B.Views.Admin.AdminLoginAndRegister
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            //Check field validation
            if (txtEmail.Text == "" && txtPass.Text == "")
            {
                lblErrorLogin.Text = "Please enter your email and password";
                lblErrorLogin.ForeColor = System.Drawing.Color.Red;
            }
            else if (txtEmail.Text == "")
            {
                lblErrorLogin.Text = "Please enter your email";
                lblErrorLogin.ForeColor = System.Drawing.Color.Red;
            }
            else if (txtPass.Text == "")
            {
                lblErrorLogin.Text = "Please enter your password";
                lblErrorLogin.ForeColor = System.Drawing.Color.Red;
            }
            else
            {
                try
                {
                    //Check account validation for login
                    string email = txtEmail.Text;
                    string pwd = txtPass.Text;

                    Account acnt = new Account();
                    acnt = acnt.RetrieveAccount(email);

                    if (acnt == null)
                    {
                        lblErrorLogin.Text = "This email has not been registered to an account. Please register your account.";
                        lblErrorLogin.ForeColor = System.Drawing.Color.Red;
                    }
                    else if (acnt.IsDisabled.ToUpper() == "D")
                    {
                        lblErrorLogin.Text = "Your account has been disabled. Please contact the admin for help.";
                        lblErrorLogin.ForeColor = System.Drawing.Color.Red;
                    }
                    else if (acnt.IsAdmin == "Y" && acnt.AdminPassword == pwd)
                    {
                        Session["uname"] = "admin";
                        Response.Redirect("../Views/Admin/AdminHome.aspx");
                    }
                    else if (acnt.IsAdmin == "N" && acnt.AdminPassword == pwd)
                    {
                        Session["uname"] = acnt.AdminUsername;
                        Session["uemail"] = email;
                        Response.Redirect("HomePage.aspx");
                    }
                    else
                    {
                        lblErrorLogin.Text = "Password Incorrect. Please try again";
                        lblErrorLogin.ForeColor = System.Drawing.Color.Red;
                    }
                }
                catch
                {
                    lblErrorLogin.Text = "An error has occured while logging in. Please contact the developers to fix this issue.";
                    lblErrorLogin.ForeColor = System.Drawing.Color.Red;
                }
            }
        }
    }
}