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
    public class eSportDAO
    {
        //insert e-sports desc
        public int Insert(eSport esport)
        {
            string DBConnect = ConfigurationManager.ConnectionStrings["FunUniversityConnectionString"].ConnectionString;
            SqlConnection conn = new SqlConnection(DBConnect);

            string sqlStmt = "INSERT INTO eSport (gameName, gameDate, gameDesc) VALUES (@paraSName, @paraGDate,  @paraGDesc)";
            int iResult = 0;
            SqlCommand cmd = new SqlCommand(sqlStmt, conn);

            cmd.Parameters.AddWithValue("@paragName", esport.gameName);
            cmd.Parameters.AddWithValue("@paraGDate", esport.gameDate);
            cmd.Parameters.AddWithValue("@paraGDesc", esport.gameDesc);

            conn.Open();
            iResult = cmd.ExecuteNonQuery();
            conn.Close();

            return iResult;

        }

        //get list of all e-sports
        public List<eSport> GetAll()
        {
            string DBConnect = ConfigurationManager.ConnectionStrings["FunUniversityConnectionString"].ConnectionString;
            SqlConnection conn = new SqlConnection(DBConnect);

            string sqlStmt = "SELECT  eSportID,  gameName, gameDate, gameDesc FROM sport";

            SqlDataAdapter da = new SqlDataAdapter(sqlStmt, conn);

            DataSet ds = new DataSet();
            da.Fill(ds);

            List<eSport> recList = new List<eSport>();

            int rec_cnt = ds.Tables[0].Rows.Count;
            if (rec_cnt == 0)
            {
                recList = null;
            }
            else
            {
                foreach (DataRow row in ds.Tables[0].Rows)
                {
                    int esid = Convert.ToInt32(row["eSportID"]);
                    string gname = Convert.ToString(row["gameName"]);
                    string gamedate = Convert.ToString(row["gameDate"]);
                    string gamedesc = Convert.ToString(row["gameDesc"]);

                    eSport newESport = new eSport(esid, gname, gamedate, gamedesc);
                    recList.Add(newESport);
                }
            }
            return recList;
        }

        //get one E-Sports match by id
        public eSport RetrieveOne(int id)
        {
            string DBConnect = ConfigurationManager.ConnectionStrings["FunUniversityConnectionString"].ConnectionString;
            SqlConnection conn = new SqlConnection(DBConnect);

            string sqlstmt = "SELECT gameName, gameDate, gameDesc from eSport where eSportID = @paraESId";
            SqlDataAdapter da = new SqlDataAdapter(sqlstmt, conn);

            da.SelectCommand.Parameters.AddWithValue("@paraESId", id);

            DataSet ds = new DataSet();
            da.Fill(ds);

            eSport newESport = null;
            int rec_cnt = ds.Tables[0].Rows.Count;
            if (rec_cnt == 1)
            {
                DataRow row = ds.Tables[0].Rows[0];
                int esid = Convert.ToInt32(row["eSportID"]);
                string gname = Convert.ToString(row["gameName"]);
                string gdate = Convert.ToString(row["gameDate"]);
                string gdesc = Convert.ToString(row["gameDesc"]);

                newESport = new eSport(esid, gname, gdate, gdesc);
                
            }
            return newESport;
        }

        //Delete one E-sport by id
        public int DeleteOne(int id)
        {
            string DBConnect = ConfigurationManager.ConnectionStrings["FunUniversityConnectionString"].ConnectionString;
            SqlConnection conn = new SqlConnection(DBConnect);

            string sqlstmt = "Delete eSport where eSportID = @paraESId";
            int iResult = 0;
            SqlCommand cmd = new SqlCommand(sqlstmt, conn);
            cmd.Parameters.AddWithValue("@paraESId", id);

            conn.Open();
            iResult = cmd.ExecuteNonQuery();
            conn.Close();

            return iResult;
        }

        //update one e-sport
        public int UpdateESports(eSport newESports)
        {
            string DBConnect = ConfigurationManager.ConnectionStrings["FunUniversityConnectionString"].ConnectionString;
            SqlConnection conn = new SqlConnection(DBConnect);

            string sqlstmt = "UPDATE eSport set gameName = @paraGName, gameDate = @paraGDate, gameDesc = @paraGDesc where eSportID = @paraESId";

            int iResult = 0;
            SqlCommand cmd = new SqlCommand(sqlstmt, conn);

            cmd = new SqlCommand(sqlstmt.ToString(), conn);

            cmd.Parameters.AddWithValue("@paraGName", newESports.gameName);
            cmd.Parameters.AddWithValue("@paraGDate", newESports.gameDate);
            cmd.Parameters.AddWithValue("@paraGDesc", newESports.gameDesc);
            cmd.Parameters.AddWithValue("@paraESId", newESports.eSportID);

            conn.Open();
            iResult = cmd.ExecuteNonQuery();

            conn.Close();
            return iResult;

        }

        //get top 3 course in db
        public List<eSport> GetTop3()
        {
            string DBConnect = ConfigurationManager.ConnectionStrings["FunUniversityConnectionString"].ConnectionString;
            SqlConnection conn = new SqlConnection(DBConnect);

            string sqlstmt = "Select TOP 3 * from eSport";

            SqlDataAdapter da = new SqlDataAdapter(sqlstmt, conn);

            DataSet ds = new DataSet();
            da.Fill(ds);

            List<eSport> recList = new List<eSport>();

            int rec_cnt = ds.Tables[0].Rows.Count;
            if (rec_cnt == 0)
            {
                recList = null;
            }
            else
            {
                foreach (DataRow row in ds.Tables[0].Rows)
                {
                    int esid = Convert.ToInt32(row["eSportID"]);
                    string gname = Convert.ToString(row["gameName"]);
                    string gdate = Convert.ToString(row["gameDate"]);
                    string gdesc = Convert.ToString(row["gameDesc"]);

                    eSport newESport = new eSport(esid, gname, gdate, gdesc);
                    recList.Add(newESport);
                }
            }
            return recList;
        }
        //searching e-sport
        public List<eSport> SearchFor(string search)
        {
            string DbConnect = ConfigurationManager.ConnectionStrings["FunUniversityConnectionString"].ConnectionString;
            SqlConnection conn = new SqlConnection(DbConnect);
            string sqlstmt = "Select * from eSport where gameName LIKE @query or gameDesc LIKE @query or gameDate LIKE @query";

            SqlDataAdapter da = new SqlDataAdapter(sqlstmt, conn);

            da.SelectCommand.Parameters.AddWithValue("@query", "%" + search + "%");

            DataSet ds = new DataSet();
            da.Fill(ds);

            List<eSport> recList = new List<eSport>();

            int rec_cnt = ds.Tables[0].Rows.Count;
            if (rec_cnt == 0)
            {
                recList = null;
            }
            else
            {
                foreach (DataRow row in ds.Tables[0].Rows)
                {
                    int esid = Convert.ToInt32(row["eSportID"]);
                    string gname = Convert.ToString(row["gameName"]);
                    string gdate = Convert.ToString(row["gameDate"]);
                    string gdesc = Convert.ToString(row["gameDesc"]);

                    eSport newESport = new eSport(esid, gname, gdate, gdesc);
                    recList.Add(newESport);

                }
            }
            return recList;
        }
    }

}