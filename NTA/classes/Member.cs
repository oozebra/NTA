using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace NTA
{
    public class Member
    {
        public int ID;
        public string fname, lname, adres, mem_tp;
        public DateTime dob;

        public string toString()
        {
            return " "+fname+" "+lname+" " +adres+" "+mem_tp+" " +ID+" "+dob;
        }

    }
}