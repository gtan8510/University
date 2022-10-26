using COMP3851B.DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace COMP3851B.BBL
{
    public class Course
    {
        public int CId { get; set; }
        public string CName { get; set; }
        public string CDesc { get; set; }
        public string CPict { get; set; }

        public Course()
        {

        }

        public Course (string cname)
        {
            this.CName = cname;
        }

        public Course(string cname, string cdesc, string cpict)
        {
            this.CName = cname;
            this.CDesc = cdesc;
            this.CPict = cpict;
        }


        public Course(int cid, string cname, string cdesc, string cpict)
        {
            this.CId = cid;
            this.CName = cname;
            this.CDesc = cdesc;
            this.CPict = cpict;
        }

     
        public Course(int cid, string cname, string cdesc)
        {
            this.CId = cid;
            this.CName = cname;
            this.CDesc = cdesc;
        }

      
        //add new course
        public int AddCourse()
        {

            CourseDAO dao = new CourseDAO();
            return dao.Insert(this);
        }

        //Get list og all course in db

        public List<Course> GetAll()
        {
            CourseDAO dao = new CourseDAO();
            return dao.GetAll();
        }

        //Delete product by id
        public int DeleteCourse(int id)
        {
            CourseDAO dao = new CourseDAO();
            return dao.DeleteOne(id);
        }

        //get one product by id
        public Course RetrieveOne(int id)
        {
            CourseDAO dao = new CourseDAO();
            return dao.RetrieveOne(id);
        }

        //update course
        public int UpdateCourse(int id)
        {
            CourseDAO dao = new CourseDAO();
            return dao.UpdateCourse(this, id);
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