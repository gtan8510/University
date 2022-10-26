using COMP3851B.BBL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace COMP3851B.Views.Admin.AdminLoginAndRegister
{
    public partial class AdminRegister : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnAdminHome_Click(object sender, EventArgs e)
        {
            Response.Redirect("../AdminHome/AdminHome.aspx");
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            //Check text validation
            if (txtEmail.Text == "" && txtPass.Text == "" && txtName.Text == "" && Convert.ToString(txtAge.Text) == "")
            {
                lblErrorRegister.Text = "Please enter your username, email and password";
                lblErrorRegister.ForeColor = System.Drawing.Color.Red;
            }
            else if (txtName.Text == "")
            {
                lblErrorRegister.Text = "Please enter your username";
                lblErrorRegister.ForeColor = System.Drawing.Color.Red;
            }
            else if (txtEmail.Text == "")
            {
                lblErrorRegister.Text = "Please enter your email";
                lblErrorRegister.ForeColor = System.Drawing.Color.Red;
            }

            else if (txtPass.Text == "")
            {
                lblErrorRegister.Text = "Please enter your password";
                lblErrorRegister.ForeColor = System.Drawing.Color.Red;
            }
            else if(Convert.ToString(txtAge.Text) == "")
            {
                lblErrorRegister.Text = "Please enter your age";
                lblErrorRegister.ForeColor = System.Drawing.Color.Red;

            }
            else
            {
                try
                {
                    //Create new account
                    string newEmail = txtEmail.Text;
                    string newPwd = txtPass.Text;
                    string newUName = txtName.Text;
                    string age = Convert.ToString(txtAge.Text);

                    Account chkacnt = new Account();
                    chkacnt = chkacnt.RetrieveOne(newEmail);

                    if (chkacnt == null)
                    {
                        Account acnt = new Account(newEmail, newPwd, newUName);
                        int result = acnt.AddAccount();

                        if (result == 1)
                        {
                            lblErrorRegister.Text = "Registration complete, please sign in:";
                            lblErrorRegister.ForeColor = System.Drawing.Color.Green;
                            namevalidator.Visible = false;
                            passvalidator.Visible = false;
                            emailVaidator.Visible = false;
                            ageValidator.Visible = false;

                            txtEmail.Text = "";
                            txtPass.Text = "";
                            txtName.Text = "";
                            txtAge.Text = "";                        }
                        else
                        {
                            lblErrorRegister.Text = "An error occured while registering user, please try again.";
                            lblErrorRegister.ForeColor = System.Drawing.Color.Red;
                            emailVaidator.Visible = false;
                        }
                    }
                    else
                    {
                        lblErrorRegister.Text = "This email account has already been registered.";
                        lblErrorRegister.ForeColor = System.Drawing.Color.Red;
                        emailVaidator.Visible = false;
                    }
                }
                catch
                {
                    lblErrorRegister.Text = "An error has occured while logging in. Please contact the developers to fix this issue.";
                    lblErrorRegister.ForeColor = System.Drawing.Color.Red;
                    emailVaidator.Visible = false;
                }
            }
        }
    }
    }
