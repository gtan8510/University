using COMP3851B.DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace COMP3851B.BBL
{
    public class eSport
    {
        public int eSportID { get; set; }
        public string gameName { get; set; }
        public string gameDate { get; set; }
        public string gameDesc { get; set; }

        public eSport()
        {

        }

        public eSport(int esportid, string gamename, string gamedate, string gamedesc)
        {
            this.eSportID = esportid;
            this.gameName = gamename;
            this.gameDate = gamedate;
            this.gameDesc = gamedesc;

        }

        public eSport(int esportid, string gamename, string gamedesc)
        {
            this.eSportID = esportid;
            this.gameName = gamename;
            this.gameDesc = gamedesc;
        }

        public eSport(string gamename, string gamedate, string gamedesc)
        {
            this.gameName = gamename;
            this.gameDate = gamedate;
            this.gameDesc = gamedesc;
        }

        //add new e-sports
        public int AddeSport()
        {

            eSportDAO dao = new eSportDAO();
            return dao.Insert(this);
        }

        //Get list og all e-sports in db

        public List<eSport> GetAll()
        {
            eSportDAO dao = new eSportDAO();
            return dao.GetAll();
        }

        //Delete e-sports by id
        public int DeleteESport(int id)
        {
            eSportDAO dao = new eSportDAO();
            return dao.DeleteOne(id);
        }

        //get one e-sports by id
        public eSport RetrieveOne(int id)
        {
            eSportDAO dao = new eSportDAO();
            return dao.RetrieveOne(id);
        }

        //update e-sport
        public int UpdateESports()
        {
            eSportDAO dao = new eSportDAO();
            return dao.UpdateESports(this);
        }

        //Get top 3 products from db
        public List<eSport> GetTop3()
        {
            eSportDAO dao = new eSportDAO();
            return dao.GetTop3();
        }

        public List<eSport> search(string search)
        {
            eSportDAO dao = new eSportDAO();
            return dao.SearchFor(search);
        }

    }
}
