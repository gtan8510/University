using COMP3851B.DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace COMP3851B.BBL
{
    public class Feedback
    {
        public int feedBackID { get; set; }
        public int stdID { get; set; }
        public string stdName { get; set; }
        public string stdFeedback { get; set; }
         public Feedback()
         {

         }  
        public Feedback(string stdname, string stdfeeddesc)
        {
            this.stdName = stdname;
            this.stdFeedback = stdfeeddesc;
        }

        public Feedback(int feedbackid, int stdid, string stdname, string stdfeedback)
        {
            this.feedBackID = feedbackid;
            this.stdID = stdid;
            this.stdName = stdname;
            this.stdFeedback = stdfeedback;
        }

        public Feedback(int stdid, string stdname, string stdfeedback)
        {
            this.stdID = stdid;
            this.stdName = stdname;
            this.stdFeedback = stdfeedback;
        }

        public Feedback(int stdid, int feedbackid, string stdfeedback)
        {
            this.stdID = stdid;
            this.feedBackID = feedbackid;
            this.stdFeedback = stdfeedback;
        }

        //add new feedback
        public int AddFeedback()
        {

            FeedbackDAO dao = new FeedbackDAO();
            return dao.insert(this);
        }

        //Get list og all feedback in db

        public List<Feedback> GetAll()
        {
            FeedbackDAO dao = new FeedbackDAO();
            return dao.GetAll();
        }

        //Delete feedback by id
        public int DeleteFeedback(int id)
        {
            FeedbackDAO dao = new FeedbackDAO();
            return dao.DeleteOne(id);
        }

        //get one product by id
        public Feedback RetrieveOne(int id)
        {
            FeedbackDAO dao = new FeedbackDAO();
            return dao.RetrieveOne(id);
        }

        //update feedback
        public int UpdateFeedback()
        {
            FeedbackDAO dao = new FeedbackDAO();
            return dao.UpdateFeedback(this);
        }

        //Get top 2 feedfback from db
        public List<Feedback> GetTop2()
        {
            FeedbackDAO dao = new FeedbackDAO();
            return dao.GetTop2();
        }

        public List<Feedback> search(string search)
        {
            FeedbackDAO dao = new FeedbackDAO();
            return dao.SearchFor(search);
        }


    }


}