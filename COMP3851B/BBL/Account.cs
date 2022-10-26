using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using COMP3851B.DAL;

namespace COMP3851B.BBL
{
    public class Account
    {

        public string AdminEmail { get; set; }
        public string AdminPassword { get; set; }
        public string AdminUsername { get; set; }
        public int AdminAge { get; set; }
        public string IsDisabled { get; set; }
        public string IsAdmin { get; set; }


        public Account()
        {


        }

        public Account(string name)
        {
            this.AdminUsername = name;
        }

        public Account(string uemail, string upwd, string uname)
        {
            this.AdminEmail = uemail;
            this.AdminPassword = upwd;
            this.AdminUsername = uname;
        }

        public Account(string uname, string pwd, int age)
        {
            this.AdminUsername = uname;
            this.AdminPassword = pwd;
            this.AdminAge = age;
        }

        public Account(string uname, string pwd, string isadmin, string isdisabled)
        {
            this.AdminUsername = uname;
            this.AdminPassword = pwd;
            this.IsAdmin = isadmin;
            this.IsDisabled = isdisabled;
        }
        public Account(string uname, string email, string isDisabled, string pwd, string isadmin)
        {
            this.AdminEmail = email;
            this.AdminUsername = uname;
            this.IsAdmin = isadmin;
            this.AdminPassword = pwd;
            this.IsDisabled = isDisabled;
        }
        public Account(string uname, string email, string password, int age)
        {
            this.AdminUsername = uname;
            this.AdminEmail = email;
            this.AdminPassword = password;
            this.AdminAge = age;
        }

        //add new account
        public int AddAccount()
        {
            AccountDAO dao = new AccountDAO();
            return dao.Insert(this);
        }

        //get account by email
        public Account RetrieveAccount(string email)
        {
            AccountDAO dao = new AccountDAO();
            return dao.RetrieveAccount(email);

        }

        //get account profile by email
        public Account RetrieveProfile(string email)
        {
            AccountDAO dao = new AccountDAO();
            return dao.RetrieveProfile(email);
        }

        //check if account ecist by retrieving one
        public Account RetrieveOne(string email)
        {
            AccountDAO dao = new AccountDAO();
            return dao.RetrieveOne(email);
        }

        //updating account profile
        public int UpdateProfile()
        {
            AccountDAO dao = new AccountDAO();
            return dao.updateProfile(this);
        }

    }
}
