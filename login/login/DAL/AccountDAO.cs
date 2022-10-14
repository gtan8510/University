using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using login.BBL;


namespace login.DAL
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
    }
}