using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using COMP3851B.BBL;

namespace COMP3851B.DAL
{
    public class SportsDAO
    {
        //insert sports desc
        public int Insert(sport sport)
        {
            string DBConnect = ConfigurationManager.ConnectionStrings["FunUniversityConnectionString"].ConnectionString;
            SqlConnection conn = new SqlConnection(DBConnect);

            string sqlStmt = "INSERT INTO sport (sportName, gameDate, gameDesc) VALUES (@paraSName, @paraGDate,  @paraGDesc)";
            int iResult = 0;
            SqlCommand cmd = new SqlCommand(sqlStmt, conn);

            cmd.Parameters.AddWithValue("@paraSName", sport.sportName);
            cmd.Parameters.AddWithValue("@paraGDate", sport.gameDate);
            cmd.Parameters.AddWithValue("@paraGDesc", sport.gameDesc);

            conn.Open();
            iResult = cmd.ExecuteNonQuery();
            conn.Close();

            return iResult;

        }

        //get list of all sports
        public List<sport> GetAll()
        {
            string DBConnect = ConfigurationManager.ConnectionStrings["FunUniversityConnectionString"].ConnectionString;
            SqlConnection conn = new SqlConnection(DBConnect);

            string sqlStmt = "SELECT  sportID,  sportName, gameDate, gameDesc FROM sport";

            SqlDataAdapter da = new SqlDataAdapter(sqlStmt, conn);

            DataSet ds = new DataSet();
            da.Fill(ds);

            List<sport> recList = new List<sport>();

            int rec_cnt = ds.Tables[0].Rows.Count;
            if (rec_cnt == 0)
            {
                recList = null;
            }
            else
            {
                foreach (DataRow row in ds.Tables[0].Rows)
                {
                    int sid = Convert.ToInt32(row["sportID"]);
                    string sname = Convert.ToString(row["sportName"]);
                    string gamedate = Convert.ToString(row["gameDate"]);
                    string gamedesc = Convert.ToString(row["gameDesc"]);

                    sport newSport = new sport(sid, sname, gamedate, gamedesc);
                    recList.Add(newSport);
                }
            }
            return recList;
        }

        //get one Sports match by id
        public sport RetrieveOne(int id)
        {
            string DBConnect = ConfigurationManager.ConnectionStrings["FunUniversityConnectionString"].ConnectionString;
            SqlConnection conn = new SqlConnection(DBConnect);

            string sqlstmt = "SELECT sportName, gameDate, gameDesc from Sport where sportID = @paraSId";
            SqlDataAdapter da = new SqlDataAdapter(sqlstmt, conn);

            da.SelectCommand.Parameters.AddWithValue("@paraSId", id);

            DataSet ds = new DataSet();
            da.Fill(ds);

            sport newSport= null;
            int rec_cnt = ds.Tables[0].Rows.Count;
            if (rec_cnt == 1)
            {
                DataRow row = ds.Tables[0].Rows[0];
                int sid = Convert.ToInt32(row["sportID"]);
                string sname = Convert.ToString(row["sportName"]);
                string gdate = Convert.ToString(row["gameDate"]);//game date
                string gdesc = Convert.ToString(row["gameDesc"]);//game desx

                newSport = new sport(sid, sname, gdate, gdesc);
            }
            return newSport;
        }

        //Delete one sport by id
        public int DeleteOne(int id)
        {
            string DBConnect = ConfigurationManager.ConnectionStrings["FunUniversityConnectionString"].ConnectionString;
            SqlConnection conn = new SqlConnection(DBConnect);

            string sqlstmt = "Delete sport where sportID = @paraSId";
            int iResult = 0;
            SqlCommand cmd = new SqlCommand(sqlstmt, conn);
            cmd.Parameters.AddWithValue("@paraSId", id);

            conn.Open();
            iResult = cmd.ExecuteNonQuery();
            conn.Close();

            return iResult;
        }

        //update one sport
        public int UpdateSports(sport newSports)
        {
            string DBConnect = ConfigurationManager.ConnectionStrings["FunUniversityConnectionString"].ConnectionString;
            SqlConnection conn = new SqlConnection(DBConnect);

            string sqlstmt = "UPDATE sport set sportName = @paraSName, gameDate = @paraGDate, gameDesc = @paraGDesc where sportID = @paraSId";

            int iResult = 0;
            SqlCommand cmd = new SqlCommand(sqlstmt, conn);

            cmd = new SqlCommand(sqlstmt.ToString(), conn);

            cmd.Parameters.AddWithValue("@paraSName", newSports.sportName);
            cmd.Parameters.AddWithValue("@paraGDate", newSports.gameDate);
            cmd.Parameters.AddWithValue("@paraGDesc", newSports.gameDesc);
            cmd.Parameters.AddWithValue("@paraSId", newSports.sportID);

            conn.Open();
            iResult = cmd.ExecuteNonQuery();

            conn.Close();
            return iResult;

        }

        //get top 3 sport in db
        public List<sport> GetTop3()
        {
            string DBConnect = ConfigurationManager.ConnectionStrings["FunUniversityConnectionString"].ConnectionString;
            SqlConnection conn = new SqlConnection(DBConnect);

            string sqlstmt = "Select TOP 3 * from sport";

            SqlDataAdapter da = new SqlDataAdapter(sqlstmt, conn);

            DataSet ds = new DataSet();
            da.Fill(ds);

            List<sport> recList = new List<sport>();

            int rec_cnt = ds.Tables[0].Rows.Count;
            if (rec_cnt == 0)
            {
                recList = null;
            }
            else
            {
                foreach (DataRow row in ds.Tables[0].Rows)
                {
                    int sid = Convert.ToInt32(row["sportID"]);
                    string sname = Convert.ToString(row["sportName"]);
                    string gdate = Convert.ToString(row["gameDate"]);
                    string gdesc = Convert.ToString(row["gameDesc"]);

                    sport newSport = new sport(sid, sname, gdate, gdesc);
                    recList.Add(newSport);
                }
            }
            return recList;
        }
        //searching sport
        public List<sport> SearchFor(string search)
        {
            string DbConnect = ConfigurationManager.ConnectionStrings["FunUniversityConnectionString"].ConnectionString;
            SqlConnection conn = new SqlConnection(DbConnect);
            string sqlstmt = "Select * from sport where sportName LIKE @query or gameDesc LIKE @query or gameDate LIKE @query";

            SqlDataAdapter da = new SqlDataAdapter(sqlstmt, conn);

            da.SelectCommand.Parameters.AddWithValue("@query", "%" + search + "%");

            DataSet ds = new DataSet();
            da.Fill(ds);

            List<sport> recList = new List<sport>();

            int rec_cnt = ds.Tables[0].Rows.Count;
            if (rec_cnt == 0)
            {
                recList = null;
            }
            else
            {
                foreach (DataRow row in ds.Tables[0].Rows)
                {
                    int sid = Convert.ToInt32(row["sportID"]);
                    string sname = Convert.ToString(row["sportName"]);
                    string gdate = Convert.ToString(row["gameDate"]);
                    string gdesc = Convert.ToString(row["gameDesc"]);

                    sport newSport = new sport(sid, sname, gdate, gdesc);
                    recList.Add(newSport);

                }
            }
            return recList;
        }
    }
}