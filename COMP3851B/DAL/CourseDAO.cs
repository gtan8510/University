using System;
using System.Collections.Generic;
using System.Linq;
using COMP3851B.BBL;
using System.Web;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

namespace COMP3851B.DAL
{
    public class CourseDAO
    {
        //insert course
        public int Insert(Course Course) 
        { 
            string DBConnect = ConfigurationManager.ConnectionStrings["FunUniversityConnectionString"].ConnectionString;
            SqlConnection conn = new SqlConnection(DBConnect);

            string sqlStmt = "INSERT INTO Course (courseName, courseDesc, coursePict) VALUES (@paraCName, @paraCDesc,  @paraCPict)";
            int iResult = 0;
            SqlCommand cmd = new SqlCommand(sqlStmt, conn);

            cmd.Parameters.AddWithValue("@paraCName", Course.CName);
            cmd.Parameters.AddWithValue("@paraCDesc", Course.CDesc);
            cmd.Parameters.AddWithValue("@paraCPict", Course.CPict);

            conn.Open();
            iResult = cmd.ExecuteNonQuery();
            conn.Close();

            return iResult;

        }

        //get list of all course
        public List<Course> GetAll()
        {
            string DBConnect = ConfigurationManager.ConnectionStrings["FunUniversityConnectionString"].ConnectionString;
            SqlConnection conn = new SqlConnection(DBConnect);

            string sqlStmt = "SELECT courseName, courseDesc, coursePict FROM Course";

            SqlDataAdapter da = new SqlDataAdapter(sqlStmt, conn);

            DataSet ds = new DataSet();
            da.Fill(ds);

            List<Course> recList = new List<Course>();

            int rec_cnt = ds.Tables[0].Rows.Count;
            if (rec_cnt == 0)
            {
                recList = null;
            }
            else
            {
                foreach (DataRow row in ds.Tables[0].Rows)
                {
                    int cid = Convert.ToInt32(row["courseID"]);
                    string cname = Convert.ToString(row["courseName"]);
                    string cdesc = Convert.ToString(row["courseDesc"]);
                    string filepath = Convert.ToString(row["coursePict"]);

                    Course uniCourse = new Course(cid, cname, cdesc, filepath);
                    recList.Add(uniCourse);
                }
            }
            return recList;
        }

        //get one course by id
        public Course RetrieveOne(int id)
        {
            string DBConnect = ConfigurationManager.ConnectionStrings["FunUniversityConnectionString"].ConnectionString;
            SqlConnection conn = new SqlConnection(DBConnect);

            string sqlstmt = "SELECT courseID, courseName, courseDesc, coursePict from Course where courseID = @paraCId";
            SqlDataAdapter da = new SqlDataAdapter(sqlstmt, conn);

            da.SelectCommand.Parameters.AddWithValue("@paraCId", id);

            DataSet ds = new DataSet();
            da.Fill(ds);

            Course uniCourse = null;
            int rec_cnt = ds.Tables[0].Rows.Count;
            if(rec_cnt == 1)
            {
                DataRow row = ds.Tables[0].Rows[0];
                int cid = Convert.ToInt32(row["courseID"]);
                string cname = Convert.ToString(row["courseName"]);
                string cdesc = Convert.ToString(row["courseDesc"]);
                string filepath = Convert.ToString(row["coursePict"]);

                uniCourse = new Course(cid, cname, cdesc, filepath);
            }
            return uniCourse;
        }

        //Delete one course by id
        public int DeleteOne(int id)
        {
           string DBConnect = ConfigurationManager.ConnectionStrings["FunUniversityConnectionString"].ConnectionString;
            SqlConnection conn = new SqlConnection(DBConnect);

            string sqlstmt = "Delete product where courseID = @paraCId";
            int iResult = 0;
            SqlCommand cmd = new SqlCommand(sqlstmt, conn);
            cmd.Parameters.AddWithValue("@paraCId", id);

            conn.Open();
            iResult = cmd.ExecuteNonQuery();
            conn.Close();

            return iResult;
        }

        //update one course
        public int UpdateCourse(Course uniCourse, int id)
        {
            string DBConnect = ConfigurationManager.ConnectionStrings["FunUniversityConnectionString"].ConnectionString;
            SqlConnection conn = new SqlConnection(DBConnect);

            string sqlstmt = "UPDATE Course Set courseName = @paraCName, courseDesc = @paraCDesc, coursePict = @paraCPict where courseID = @paraCId";

            int iResult = 0;
            SqlCommand cmd = new SqlCommand(sqlstmt, conn);

            cmd = new SqlCommand(sqlstmt.ToString(), conn);

            cmd.Parameters.AddWithValue("@paraCName", uniCourse.CName);
            cmd.Parameters.AddWithValue("@paraCDesc", uniCourse.CDesc);
            cmd.Parameters.AddWithValue("@paraCPict", uniCourse.CPict);
            cmd.Parameters.AddWithValue("@paraCId", uniCourse.CId);

            conn.Open();
            iResult = cmd.ExecuteNonQuery();

            conn.Close();
            return iResult;

        }

        //get top 3 course in db
        public List<Course> GetTop3()
        {
            string DBConnect = ConfigurationManager.ConnectionStrings["FunUniversityConnectionString"].ConnectionString;
            SqlConnection conn = new SqlConnection(DBConnect);

            string sqlstmt = "Select TOP 3 * from Course";

            SqlDataAdapter da = new SqlDataAdapter(sqlstmt, conn);

            DataSet ds = new DataSet();
            da.Fill(ds);

            List<Course> recList = new List<Course>();

            int rec_cnt = ds.Tables[0].Rows.Count;
            if (rec_cnt == 0)
            {
                recList = null;
            }
            else
            {
                foreach(DataRow row in ds.Tables[0].Rows)
                {
                    int courseId = Convert.ToInt32(row["courseID"]);
                    string coursename = Convert.ToString(row["courseName"]);
                    string coursedesc = Convert.ToString(row["courseDesc"]);
                    string coursepict = Convert.ToString(row["coursePict"]);

                    Course uniCourse = new Course(courseId, coursename, coursedesc, coursepict);
                    recList.Add(uniCourse);
                }
            }
            return recList;
        }
        //searching course
        public List<Course> SearchFor(string search)
        {
            string DbConnect = ConfigurationManager.ConnectionStrings["FunUniversityConnectionString"].ConnectionString;
            SqlConnection conn = new SqlConnection(DbConnect);
            string sqlstmt = "Select * from course where courseName LIKE @query or courseDesc LIKE @query";

            SqlDataAdapter da = new SqlDataAdapter(sqlstmt, conn);

            da.SelectCommand.Parameters.AddWithValue("@query", "%" + search + "%");

            DataSet ds = new DataSet();
            da.Fill(ds);

            List<Course> recList = new List<Course>();

            int rec_cnt = ds.Tables[0].Rows.Count;
            if(rec_cnt == 0)
            {
                recList = null;
            }
            else
            {
                foreach (DataRow row in ds.Tables[0].Rows)
                {
                    int courseId = Convert.ToInt32(row["courseID"]);
                    string coursename = Convert.ToString(row["courseName"]);
                    string coursedesc = Convert.ToString(row["courseDesc"]);
                    string coursepict = Convert.ToString(row["coursePict"]);

                    Course uniCourse = new Course(courseId, coursename, coursedesc, coursepict);
                    recList.Add(uniCourse);

                }
            }
            return recList;
        }
    }
}