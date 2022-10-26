using COMP3851B.DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace COMP3851B.BBL
{
    public class Facility
    {
        public int FID { get; set; }
        public string FName { get; set; }
        public string FDesc { get; set; }
        public string FPict { get; set; }


        public Facility()
        {

        }

        public Facility(string facilityname, string facilitydesc, string facilitypict)
        {
            this.FName = facilityname;
            this.FDesc = facilitydesc;
            this.FPict = facilitypict;
        }

        public Facility(string facilityname, string facilitydesc)
        {
            this.FName = facilityname;
            this.FDesc = facilitydesc;
        }
        public Facility(int facilityid, string facilityname, string facilitydesc, string facilitypict)
        {
            this.FID = facilityid;
            this.FName = facilityname;
            this.FDesc = facilitydesc;
            this.FPict = facilitypict;
        }
        //add facility
        public int AddFacility()
        {
            FacilityDAO dao = new FacilityDAO();
            return dao.Insert(this);
        }

        //Get list og all facility in db

        public List<Facility> GetAll()
        {
            FacilityDAO dao = new FacilityDAO();
            return dao.GetAll();
        }

        //Delete facility by id
        public int DeleteFacility(int id)
        {
            FacilityDAO dao = new FacilityDAO();
            return dao.DeleteOne(id);
        }

        //get one facility by id
        public Facility RetrieveOne(int id)
        {
            FacilityDAO dao = new FacilityDAO();
            return dao.RetrieveOne(id);
        }

        //update facility
        public int UpdateFeedback()
        {
            FacilityDAO dao = new FacilityDAO();
            return dao.UpdateFacility(this);
        }

        //Get top 3 facility from db
        public List<Facility> GetTop3()
        {
            FacilityDAO dao = new FacilityDAO();
            return dao.GetTop3();
        }

        //search facility
        public List<Facility> search(string search)
        {
            FacilityDAO dao = new FacilityDAO();
            return dao.SearchFor(search);
        }


    }
}