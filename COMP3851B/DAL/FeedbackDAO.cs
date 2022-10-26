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
    public class FeedbackDAO
    {
        //insert feecback to db
        public int insert(Feedback feedback)
        {
            string DBConnect = ConfigurationManager.ConnectionStrings["FunUniversityConnectionString"].ConnectionString;
            SqlConnection conn = new SqlConnection(DBConnect);

            string sqlStmt = "INSERT INTO studentFeedback (studentID, studentName, studentFeedback) VALUES (@parastdID, @parastdName,  @parastdFeedback)";
            int iResult = 0;
            SqlCommand cmd = new SqlCommand(sqlStmt, conn);

            cmd.Parameters.AddWithValue("@parastdID", feedback.stdID);
            cmd.Parameters.AddWithValue("@parastdName", feedback.stdName);
            cmd.Parameters.AddWithValue("@parastdFeedback", feedback.stdFeedback);

            conn.Open();
            iResult = cmd.ExecuteNonQuery();
            conn.Close();

            return iResult;


        }
        //get list of all feedback
        public List<Feedback> GetAll()
        {
            string DBConnect = ConfigurationManager.ConnectionStrings["FunUniversityConnectionString"].ConnectionString;
            SqlConnection conn = new SqlConnection(DBConnect);

            string sqlStmt = "SELECT  feedbackID, studentID, studentName, studentFeedback FROM studentFeedback";

            SqlDataAdapter da = new SqlDataAdapter(sqlStmt, conn);

            DataSet ds = new DataSet();
            da.Fill(ds);

            List<Feedback> recList = new List<Feedback>();

            int rec_cnt = ds.Tables[0].Rows.Count;
            if (rec_cnt == 0)
            {
                recList = null;
            }
            else
            {
                foreach (DataRow row in ds.Tables[0].Rows)
                {
                    int feedbackid = Convert.ToInt32(row["feedbackID"]);
                    int stdid = Convert.ToInt32(row["studentID"]);
                    string stdname = Convert.ToString(row["studentName"]);
                    string stdfeedback = Convert.ToString(row["studentFeedback"]);

                    Feedback studentFeedback = new Feedback(feedbackid, stdid, stdname, stdfeedback);
                    recList.Add(studentFeedback);
                }
            }
            return recList;
        }
        
                //get one feedback by id
                public Feedback RetrieveOne(int id)
                {
                    string DBConnect = ConfigurationManager.ConnectionStrings["FunUniversityConnectionString"].ConnectionString;
                    SqlConnection conn = new SqlConnection(DBConnect);

                    string sqlstmt = "SELECT feedbackID, studentID, studentName, studentFeedback from studentFeedback where feedbackID = @paraFeedbackId";
                    SqlDataAdapter da = new SqlDataAdapter(sqlstmt, conn);

                    da.SelectCommand.Parameters.AddWithValue("@paraFeedbackId", id);

                    DataSet ds = new DataSet();
                    da.Fill(ds);

                    Feedback studentFeedback = null;
                    int rec_cnt = ds.Tables[0].Rows.Count;
                    if (rec_cnt == 1)
                    {
                        DataRow row = ds.Tables[0].Rows[0];
                        int feedbackid = Convert.ToInt32(row["feedbackID"]);
                        int stdid = Convert.ToInt32(row["studentID"]);
                        string stdname = Convert.ToString(row["studentName"]);
                        string stdfeedback = Convert.ToString(row["studentFeedback"]);

                        studentFeedback = new Feedback(feedbackid, stdid, stdname, stdfeedback);
                    }
                    return studentFeedback;
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

        //update one feedback
        public int UpdateFeedback(Feedback feedback)
        {
            string DBConnect = ConfigurationManager.ConnectionStrings["FunUniversityConnectionString"].ConnectionString;
            SqlConnection conn = new SqlConnection(DBConnect);

            string sqlstmt = "UPDATE studentFeedack Set studentID = @paraStdID, studentName = @paraStdName, studentFeedback = @paraStdFeedback where feedbackID = @paraFeedbackId";

            int iResult = 0;
            SqlCommand cmd = new SqlCommand(sqlstmt, conn);

            cmd = new SqlCommand(sqlstmt.ToString(), conn);

            cmd.Parameters.AddWithValue("@paraStdID", feedback.stdID);
            cmd.Parameters.AddWithValue("@paraStdName", feedback.stdName);
            cmd.Parameters.AddWithValue("@paraStdFeedback", feedback.stdFeedback);
            cmd.Parameters.AddWithValue("@paraFeedbackId", feedback.feedBackID);

            conn.Open();
            iResult = cmd.ExecuteNonQuery();

            conn.Close();
            return iResult;

        }

        //get top 2 feedback in db
        public List<Feedback> GetTop2()
        {
            string DBConnect = ConfigurationManager.ConnectionStrings["FunUniversityConnectionString"].ConnectionString;
            SqlConnection conn = new SqlConnection(DBConnect);

            string sqlstmt = "Select TOP 2 * from studentFeedback";

            SqlDataAdapter da = new SqlDataAdapter(sqlstmt, conn);

            DataSet ds = new DataSet();
            da.Fill(ds);

            List<Feedback> recList = new List<Feedback>();

            int rec_cnt = ds.Tables[0].Rows.Count;
            if (rec_cnt == 0)
            {
                recList = null;
            }
            else
            {
                foreach (DataRow row in ds.Tables[0].Rows)
                {
                    int feedbackid = Convert.ToInt32(row["feedbackID"]);
                    int stdid = Convert.ToInt32(row["studentID"]);
                    string stdname = Convert.ToString(row["studentName"]);
                    string stdfeedback = Convert.ToString(row["studentFeedback"]);

                    Feedback studentFeedback = new Feedback(feedbackid, stdid, stdname, stdfeedback);
                    recList.Add(studentFeedback);
                }
            }
            return recList;
        }
        //searching course
        public List<Feedback> SearchFor(string search)
        {
            string DbConnect = ConfigurationManager.ConnectionStrings["FunUniversityConnectionString"].ConnectionString;
            SqlConnection conn = new SqlConnection(DbConnect);
            string sqlstmt = "Select * from studentFeedback where studentFeedback LIKE @query or studentName LIKE @query";

            SqlDataAdapter da = new SqlDataAdapter(sqlstmt, conn);

            da.SelectCommand.Parameters.AddWithValue("@query", "%" + search + "%");

            DataSet ds = new DataSet();
            da.Fill(ds);

            List<Feedback> recList = new List<Feedback>();

            int rec_cnt = ds.Tables[0].Rows.Count;
            if (rec_cnt == 0)
            {
                recList = null;
            }
            else
            {
                foreach (DataRow row in ds.Tables[0].Rows)
                {
                    int feedbackid = Convert.ToInt32(row["feedbackID"]);
                    int stdid = Convert.ToInt32(row["studentID"]);
                    string stdname = Convert.ToString(row["studentName"]);
                    string stdfeedback = Convert.ToString(row["studentFeedback"]);

                    Feedback studentFeedback = new Feedback(feedbackid, stdid, stdname, stdfeedback);
                    recList.Add(studentFeedback);

                }
            }
            return recList;
        }


    }
}