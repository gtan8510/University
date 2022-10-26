using COMP3851B.DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace COMP3851B.BBL
{
    public class Campus
    {
        public int campusID { get; set; }
        public  string campusLoc{ get; set; }
        public string campusImage { get; set; }
  
        public Campus()
        {

        }

        public Campus(int campusid, string campusloc, string campusimage)
        {
            this.campusID = campusid;
            this.campusLoc = campusloc;
            this.campusImage = campusimage;
        }

        public Campus(string campusloc, string campusimage)
        {
            this.campusLoc = campusloc;
            this.campusImage = campusimage;
        }

        //add new campus
        public int AddCampus()
        {

            campusDAO dao = new campusDAO();
            return dao.insert(this);
        }

        //Get list og all campus in db

        public List<Campus> GetAll()
        {
            campusDAO dao = new campusDAO();
            return dao.GetAll();
        }

        //Delete campus by id
        public int DeleteCampus(int id)
        {
            campusDAO dao = new campusDAO();
            return dao.DeleteOne(id);
        }

        //get one campus by id
        public Campus RetrieveOne(int id)
        {
            campusDAO dao = new campusDAO();
            return dao.RetrieveOne(id);
        }

        //update campus
        public int UpdateCampus()
        {
            campusDAO dao = new campusDAO();
            return dao.UpdateCampus(this);
        }

        //Get top 3 products from db
        public List<Course> GetTop3()
        {
            CourseDAO dao = new CourseDAO();
            return dao.GetTop3();
        }

        public List<Course> search(string search)
        {
            CourseDAO dao = new CourseDAO();
            return dao.SearchFor(search);
        }

    }
    
}