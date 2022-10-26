using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using COMP3851B.BBL;


namespace COMP3851B.DAL
{
    public class AccountDAO
    {
        //insert new account
        public int Insert(Account accnt)
        {
            string DBConnect = ConfigurationManager.ConnectionStrings["FunUniversityConnectionString"].ConnectionString;
            SqlConnection conn = new SqlConnection(DBConnect);
            string sqlstmt = "INSERT INTO AdminData(AdminEmail, AdminPassword, AdminName, AdminAge) VALUES(@paraUEmail, @paraUPwd, @paraUName, @paraAge)";

            //Execute nonQuerty retuen an integer value

            int iResult = 0;
            SqlCommand cmd = new SqlCommand(sqlstmt, conn);

            cmd.Parameters.AddWithValue("@paraUEmail", accnt.AdminEmail);
            cmd.Parameters.AddWithValue("@paraUPwd", accnt.AdminPassword);
            cmd.Parameters.AddWithValue("@paraUName", accnt.AdminUsername);
            cmd.Parameters.AddWithValue("@paraAge", accnt.AdminAge);

            conn.Open();
            iResult = cmd.ExecuteNonQuery();
            conn.Close();
            return iResult;

        }


        //Retrieve profile by email
        public Account RetrieveProfile(string email)
        {
            string DBConnect = ConfigurationManager.ConnectionStrings["FunUniversityConnectionString"].ConnectionString;
            SqlConnection myConn = new SqlConnection(DBConnect);

            string sqlstmt = "SELECT AdminEmail, AdminPassword, AdminName, AdminAge From AdminData WHERE AdminEmail = @paraEmail";
            SqlDataAdapter da = new SqlDataAdapter(sqlstmt, myConn);

            da.SelectCommand.Parameters.AddWithValue("@paraEmail", email );

            DataSet ds = new DataSet();
            da.Fill(ds);

            Account acnt = null;
            int rec_cnt = ds.Tables[0].Rows.Count;
            if (rec_cnt == 1)
            {
                DataRow row = ds.Tables[0].Rows[0];
                string adminEmail = row["AdminEmail"].ToString();
                string uname = row["AdminName"].ToString();
                string pass = row["AdminPassword"].ToString();
                int age = Convert.ToInt32(row["AdminAge"]);
              

                acnt = new Account(adminEmail, uname, pass, age );

            }
            return acnt;
        }
        //retrieve account by email
        public Account RetrieveAccount(string email)
        {
            string DBConnect = ConfigurationManager.ConnectionStrings["FunUniversityConnectionString"].ConnectionString;
            SqlConnection myConn = new SqlConnection(DBConnect);

            string sqlstmt = "SELECT  AdminPassword, AdminName, AdminAge From AdminData WHERE AdminEmail = @paraEmail";
            SqlDataAdapter da = new SqlDataAdapter(sqlstmt, myConn);

            da.SelectCommand.Parameters.AddWithValue("@paraEmail", email);

            DataSet ds = new DataSet();
            da.Fill(ds);

            Account acnt = null;
            int rec_cnt = ds.Tables[0].Rows.Count;
            if (rec_cnt == 1)
            {
                DataRow row = ds.Tables[0].Rows[0];
               
                string uname = row["AdminName"].ToString();
                string pass = row["AdminPassword"].ToString();
                int age = Convert.ToInt32(row["AdminAge"]);


                acnt = new Account( uname, pass, age);

            }
            return acnt;
        }


        //Check if account exists
        public Account RetrieveOne(string email)
        {
            string DBConnect = ConfigurationManager.ConnectionStrings["FunUniversityConnectionString"].ConnectionString;
            SqlConnection myConn = new SqlConnection(DBConnect);

            string sqlstmt = "SELECT AdminName From Account WHERE AdminEmail = @paraAEmail";
            SqlDataAdapter da = new SqlDataAdapter(sqlstmt, myConn);

            da.SelectCommand.Parameters.AddWithValue("@paraAEmail", email);

            DataSet ds = new DataSet();
            da.Fill(ds);

            Account acnt = null;
            int rec_cnt = ds.Tables[0].Rows.Count;
            if (rec_cnt == 1)
            {
                DataRow row = ds.Tables[0].Rows[0];
                string uname = row["AdminName"].ToString();

                acnt = new Account(uname);

            }
            return acnt;
        }

        //update account
        public int updateProfile(Account accnt)
        {
            string DBConnect = ConfigurationManager.ConnectionStrings["FunUniversityConnectionString"].ConnectionString;
            SqlConnection conn = new SqlConnection(DBConnect);
            string sqlstmt = "UPDATE AdminData SET AdminName = @paraUname, AdminPassword = @ParaUPwd, AdminEmail = @paraUEmail, AdminAge = @ParaAge";
            int iResult = 0;
            SqlCommand cmd = new SqlCommand(sqlstmt.ToString(), conn);

            cmd.Parameters.AddWithValue("@paraUEmail", accnt.AdminEmail);
            cmd.Parameters.AddWithValue("@paraUPwd", accnt.AdminPassword);
            cmd.Parameters.AddWithValue("@paraUName", accnt.AdminUsername);
            cmd.Parameters.AddWithValue("@paraAge", accnt.AdminAge);

            conn.Open();
            iResult = cmd.ExecuteNonQuery();
            conn.Close();
            return iResult;
        }
    }
}
