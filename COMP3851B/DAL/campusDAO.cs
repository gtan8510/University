using COMP3851B.BBL;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace COMP3851B.DAL
{
    public class campusDAO
    {
        //insert campus to db
        public int insert(Campus campus)
        {
            string DBConnect = ConfigurationManager.ConnectionStrings["FunUniversityConnectionString"].ConnectionString;
            SqlConnection conn = new SqlConnection(DBConnect);

            string sqlStmt = "INSERT INTO Campus (campusLoc studentImg) VALUES (@paraCampusLoc,  @paraCampusImg)";
            int iResult = 0;
            SqlCommand cmd = new SqlCommand(sqlStmt, conn);

            cmd.Parameters.AddWithValue("@paraCampusLoc", campus.campusLoc);
            cmd.Parameters.AddWithValue("@paraCampusImg", campus.campusImage);


            conn.Open();
            iResult = cmd.ExecuteNonQuery();
            conn.Close();

            return iResult;
        }

        //get list of all campus
        public List<Campus> GetAll()
        {
            string DBConnect = ConfigurationManager.ConnectionStrings["FunUniversityConnectionString"].ConnectionString;
            SqlConnection conn = new SqlConnection(DBConnect);

            string sqlStmt = "SELECT  campusID, CampusLoc, campusImg FROM Campus";

            SqlDataAdapter da = new SqlDataAdapter(sqlStmt, conn);

            DataSet ds = new DataSet();
            da.Fill(ds);

            List<Campus> recList = new List<Campus>();

            int rec_cnt = ds.Tables[0].Rows.Count;
            if (rec_cnt == 0)
            {
                recList = null;
            }
            else
            {
                foreach (DataRow row in ds.Tables[0].Rows)
                {
                    int campusid = Convert.ToInt32(row["campusID"]);
                    string campusloc = Convert.ToString(row["campusLoc"]);
                    string campusimg = Convert.ToString(row["campusImg"]);

                    Campus cCampus = new Campus(campusid, campusloc, campusimg);
                    recList.Add(cCampus);
                }
            }
            return recList;
        }


        //get one campus by id
        public Campus RetrieveOne(int id)
        {
            string DBConnect = ConfigurationManager.ConnectionStrings["FunUniversityConnectionString"].ConnectionString;
            SqlConnection conn = new SqlConnection(DBConnect);

            string sqlstmt = "SELECT campusLoc, campusImg from Campus where campusID = @paraCampusId";
            SqlDataAdapter da = new SqlDataAdapter(sqlstmt, conn);

            da.SelectCommand.Parameters.AddWithValue("@paraCampusId", id);

            DataSet ds = new DataSet();
            da.Fill(ds);

            Campus cCampus = null;
            int rec_cnt = ds.Tables[0].Rows.Count;
            if (rec_cnt == 1)
            {
                DataRow row = ds.Tables[0].Rows[0];

                int campusid = Convert.ToInt32(row["campusID"]);
                string campusloc = Convert.ToString(row["campusLoc"]);
                string campusimg = Convert.ToString(row["campusImg"]);

                cCampus = new Campus(campusid, campusloc, campusimg);
            }
            return cCampus;
        }

        //Delete one campus by id
        public int DeleteOne(int id)
        {
            string DBConnect = ConfigurationManager.ConnectionStrings["FunUniversityConnectionString"].ConnectionString;
            SqlConnection conn = new SqlConnection(DBConnect);

            string sqlstmt = "Delete Campus where campusID = @paraCampusId";
            int iResult = 0;
            SqlCommand cmd = new SqlCommand(sqlstmt, conn);
            cmd.Parameters.AddWithValue("@paraCampusId", id);

            conn.Open();
            iResult = cmd.ExecuteNonQuery();
            conn.Close();

            return iResult;
        }

        //update one campus
        public int UpdateCampus(Campus campus)
        {
            string DBConnect = ConfigurationManager.ConnectionStrings["FunUniversityConnectionString"].ConnectionString;
            SqlConnection conn = new SqlConnection(DBConnect);

            string sqlstmt = "UPDATE Campus set campusLoc = @paraCampusLoc, campusImg = @paraCampusImg where campusID = @paraCampusID";

            int iResult = 0;
            SqlCommand cmd = new SqlCommand(sqlstmt, conn);

            cmd = new SqlCommand(sqlstmt.ToString(), conn);
            
           
            cmd.Parameters.AddWithValue("@paraCampusLoc", campus.campusLoc);
            cmd.Parameters.AddWithValue("@paraCampusImg", campus.campusImage);
            cmd.Parameters.AddWithValue("@ParaCampusID", campus.campusID);

            conn.Open();
            iResult = cmd.ExecuteNonQuery();

            conn.Close();
            return iResult;

        }

        //get top 3 campus in db
        public List<Campus> GetTop3()
        {
            string DBConnect = ConfigurationManager.ConnectionStrings["FunUniversityConnectionString"].ConnectionString;
            SqlConnection conn = new SqlConnection(DBConnect);

            string sqlstmt = "Select TOP 3 * from studentFeedback";

            SqlDataAdapter da = new SqlDataAdapter(sqlstmt, conn);

            DataSet ds = new DataSet();
            da.Fill(ds);

            List<Campus> recList = new List<Campus>();

            int rec_cnt = ds.Tables[0].Rows.Count;
            if (rec_cnt == 0)
            {
                recList = null;
            }
            else
            {
                foreach (DataRow row in ds.Tables[0].Rows)
                {
                    int campusid = Convert.ToInt32(row["campusID"]);
                    string campusloc = Convert.ToString(row["campusLoc"]);
                    string campusimg = Convert.ToString(row["campusImg"]);

                    Campus cCampus = new Campus(campusid, campusloc, campusimg);
                    recList.Add(cCampus);
                }
            }
            return recList;
        }
        //searching course
        public List<Campus> SearchFor(string search)
        {
            string DbConnect = ConfigurationManager.ConnectionStrings["FunUniversityConnectionString"].ConnectionString;
            SqlConnection conn = new SqlConnection(DbConnect);
            string sqlstmt = "Select * from Campus where campusLoc LIKE @query";

            SqlDataAdapter da = new SqlDataAdapter(sqlstmt, conn);

            da.SelectCommand.Parameters.AddWithValue("@query", "%" + search + "%");

            DataSet ds = new DataSet();
            da.Fill(ds);

            List<Campus> recList = new List<Campus>();

            int rec_cnt = ds.Tables[0].Rows.Count;
            if (rec_cnt == 0)
            {
                recList = null;
            }
            else
            {
                foreach (DataRow row in ds.Tables[0].Rows)
                {
                    int campusid = Convert.ToInt32(row["campusID"]);
                    string campusloc = Convert.ToString(row["campusLoc"]);
                    string campusimg = Convert.ToString(row["campusImg"]);

                    Campus cCampus = new Campus(campusid, campusloc, campusimg);
                    recList.Add(cCampus);

                }
            }
            return recList;
        }
    }
}