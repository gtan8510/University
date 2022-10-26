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
    public class FacilityDAO
    {
        //insert facilitty
        public int Insert(Facility facility)
        {
            string DBConnect = ConfigurationManager.ConnectionStrings["FunUniversityConnectionString"].ConnectionString;
            SqlConnection conn = new SqlConnection(DBConnect);

            string sqlStmt = "INSERT INTO campusFacility (facilityName, facilityDesc, facilityPict) VALUES (@paraFName, @paraFDesc,  @paraFPict)";
            int iResult = 0;
            SqlCommand cmd = new SqlCommand(sqlStmt, conn);

            cmd.Parameters.AddWithValue("@paraFName", facility.FName);
            cmd.Parameters.AddWithValue("@paraFDesc", facility.FDesc);
            cmd.Parameters.AddWithValue("@paraFPict", facility.FPict);

            conn.Open();
            iResult = cmd.ExecuteNonQuery();
            conn.Close();

            return iResult;

        }

        //get list of all facility
        public List<Facility> GetAll()
        {
            string DBConnect = ConfigurationManager.ConnectionStrings["FunUniversityConnectionString"].ConnectionString;
            SqlConnection conn = new SqlConnection(DBConnect);

            string sqlStmt = "SELECT facilityName,faciityDesc, facilityPict FROM campusFacility";

            SqlDataAdapter da = new SqlDataAdapter(sqlStmt, conn);

            DataSet ds = new DataSet();
            da.Fill(ds);

            List<Facility> recList = new List<Facility>();

            int rec_cnt = ds.Tables[0].Rows.Count;
            if (rec_cnt == 0)
            {
                recList = null;
            }
            else
            {
                foreach (DataRow row in ds.Tables[0].Rows)
                {
                    int fid = Convert.ToInt32(row["facilityID"]);
                    string fname = Convert.ToString(row["facilityName"]);
                    string fdesc = Convert.ToString(row["facilityDesc"]);
                    string fPict = Convert.ToString(row["facilityPict"]);

                    Facility uniFacility = new Facility(fid, fname, fdesc, fPict);
                    recList.Add(uniFacility);
                }
            }
            return recList;
        }

        //get one facility by id
        public Facility RetrieveOne(int id)
        {
            string DBConnect = ConfigurationManager.ConnectionStrings["FunUniversityConnectionString"].ConnectionString;
            SqlConnection conn = new SqlConnection(DBConnect);

            string sqlstmt = "SELECT facilityID, facilityName, facilityDesc, facilityPict from Course where facilityID = @paraFId";
            SqlDataAdapter da = new SqlDataAdapter(sqlstmt, conn);

            da.SelectCommand.Parameters.AddWithValue("@paraFId", id);

            DataSet ds = new DataSet();
            da.Fill(ds);

            Facility uniFacility = null;
            int rec_cnt = ds.Tables[0].Rows.Count;
            if (rec_cnt == 1)
            {
                DataRow row = ds.Tables[0].Rows[0];
                int fid = Convert.ToInt32(row["facilityID"]);
                string fname = Convert.ToString(row["facilityName"]);
                string fdesc = Convert.ToString(row["facilityDesc"]);
                string fPict = Convert.ToString(row["facilityPict"]);

                uniFacility = new Facility(fid, fname, fdesc, fPict);
                
            }
            return uniFacility;
        }

        //Delete one facility by id
        public int DeleteOne(int id)
        {
            string DBConnect = ConfigurationManager.ConnectionStrings["FunUniversityConnectionString"].ConnectionString;
            SqlConnection conn = new SqlConnection(DBConnect);

            string sqlstmt = "Delete campusFacility where facilityID = @paraFId";
            int iResult = 0;
            SqlCommand cmd = new SqlCommand(sqlstmt, conn);
            cmd.Parameters.AddWithValue("@paraFId", id);

            conn.Open();
            iResult = cmd.ExecuteNonQuery();
            conn.Close();

            return iResult;
        }

        //update one facility
        public int UpdateFacility(Facility uniFacility)
        {
            string DBConnect = ConfigurationManager.ConnectionStrings["FunUniversityConnectionString"].ConnectionString;
            SqlConnection conn = new SqlConnection(DBConnect);

            string sqlstmt = "UPDATE campusFacility Set facilityName = @paraFName, facilityDesc = @paraFDesc, facilityPict = @paraFPict where facilityID = @paraFId";

            int iResult = 0;
            SqlCommand cmd = new SqlCommand(sqlstmt, conn);

            cmd = new SqlCommand(sqlstmt.ToString(), conn);

            cmd.Parameters.AddWithValue("@paraFName", uniFacility.FName);
            cmd.Parameters.AddWithValue("@paraFDesc", uniFacility.FDesc);
            cmd.Parameters.AddWithValue("@paraFPict", uniFacility.FPict);
            cmd.Parameters.AddWithValue("@paraFId", uniFacility.FID);

            conn.Open();
            iResult = cmd.ExecuteNonQuery();

            conn.Close();
            return iResult;

        }

        //get top 3 facility in db
        public List<Facility> GetTop3()
        {
            string DBConnect = ConfigurationManager.ConnectionStrings["FunUniversityConnectionString"].ConnectionString;
            SqlConnection conn = new SqlConnection(DBConnect);

            string sqlstmt = "Select TOP 3 * from campusFacility";

            SqlDataAdapter da = new SqlDataAdapter(sqlstmt, conn);

            DataSet ds = new DataSet();
            da.Fill(ds);

            List<Facility> recList = new List<Facility>();

            int rec_cnt = ds.Tables[0].Rows.Count;
            if (rec_cnt == 0)
            {
                recList = null;
            }
            else
            {
                foreach (DataRow row in ds.Tables[0].Rows)
                {
                    int fid = Convert.ToInt32(row["facilityID"]);
                    string fname = Convert.ToString(row["facilityName"]);
                    string fdesc = Convert.ToString(row["facilityDesc"]);
                    string fPict = Convert.ToString(row["facilityPict"]);

                    Facility uniFacility = new Facility(fid, fname, fdesc, fPict);
                    recList.Add(uniFacility);
                }
            }
            return recList;
        }
        //searching facility
        public List<Facility> SearchFor(string search)
        {
            string DbConnect = ConfigurationManager.ConnectionStrings["FunUniversityConnectionString"].ConnectionString;
            SqlConnection conn = new SqlConnection(DbConnect);
            string sqlstmt = "Select * from campusFacility where facilityName LIKE @query or facilityDesc LIKE @query";

            SqlDataAdapter da = new SqlDataAdapter(sqlstmt, conn);

            da.SelectCommand.Parameters.AddWithValue("@query", "%" + search + "%");

            DataSet ds = new DataSet();
            da.Fill(ds);

            List<Facility> recList = new List<Facility>();

            int rec_cnt = ds.Tables[0].Rows.Count;
            if (rec_cnt == 0)
            {
                recList = null;
            }
            else
            {
                foreach (DataRow row in ds.Tables[0].Rows)
                {
                    int fid = Convert.ToInt32(row["facilityID"]);
                    string fname = Convert.ToString(row["facilityName"]);
                    string fdesc = Convert.ToString(row["facilityDesc"]);
                    string fPict = Convert.ToString(row["facilityPict"]);

                    Facility uniFacility = new Facility(fid, fname, fdesc, fPict);
                    recList.Add(uniFacility);

                }
            }
            return recList;
        }
    }
}