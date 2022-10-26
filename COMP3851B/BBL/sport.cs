using COMP3851B.DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace COMP3851B.BBL
{
    public class sport
    {
        public int sportID { get; set; }
        public string sportName { get; set; }
        public string gameDate { get; set; }
        public string gameDesc { get; set; }

        public sport()
        {

        }

        public sport(int sportid, string sportname, string gamedate, string gamedesc)
        {
            this.sportID = sportid;
            this.sportName = sportname;
            this.gameDate = gamedate;
            this.gameDesc = gamedesc;

        }

        public sport(int sportid, string sportname, string gamedesc)
        {
            this.sportID = sportid;
            this.sportName = sportname;
            this.gameDesc = gamedesc;
        }

        public sport(string sportname, string gamedate, string gamedesc)
        {
            this.sportName = sportname;
            this.gameDate = gamedate;
            this.gameDesc = gamedesc;
        }

        //add new sports
        public int AddSport()
        {

            SportsDAO dao = new SportsDAO();
            return dao.Insert(this);
        }

        //Get list og all sports in db

        public List<sport> GetAll()
        {
            SportsDAO dao = new SportsDAO();
            return dao.GetAll();
        }

        //Delete sports by id
        public int DeleteSport(int id)
        {
            SportsDAO dao = new SportsDAO();
            return dao.DeleteOne(id);
        }

        //get one sports by id
        public sport RetrieveOne(int id)
        {
            SportsDAO dao = new SportsDAO();
            return dao.RetrieveOne(id);
        }

        //update sports
        public int UpdateSports()
        {
            SportsDAO dao = new SportsDAO();
            return dao.UpdateSports(this);
        }

        //Get top 3 products from db
        public List<sport> GetTop3()
        {
            SportsDAO dao = new SportsDAO();
            return dao.GetTop3();
        }

        public List<sport> search(string search)
        {
            SportsDAO dao = new SportsDAO();
            return dao.SearchFor(search);
        }

    }

}