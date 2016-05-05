using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.Services;

namespace NTA
{
    /// <summary>
    /// Summary description for coursesStream
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    // [System.Web.Script.Services.ScriptService]
    public class coursesStream : System.Web.Services.WebService
    {
        static Configuration rootWebConfig = WebConfigurationManager.OpenWebConfiguration("/NTA");
        const string CONSTRINGNAME = "NTAConnectionString";
        ConnectionStringSettings conString = rootWebConfig.ConnectionStrings.ConnectionStrings[CONSTRINGNAME];
        SqlConnection con;



        SqlCommand cmd = new SqlCommand();

        [WebMethod]
        public List<Course> allCourse()
        {

            con = new SqlConnection(conString.ConnectionString);
            try
            {
                con.Open();

            }
            catch (SqlException ex)
            {
                Console.Write(ex.Message);
            }
            List<Course> course = new List<Course>();
            cmd.Connection = con;
            cmd.CommandText = "SELECT DISTINCT Courses.CID, Courses.course_name, Courses.description, Courses.credit, TrainingRoom.RoomNo, Centres.locale, Members.fname, Courses.startdate, Courses.enddate FROM Centres INNER JOIN Courses INNER JOIN Roster ON Courses.CID = Roster.course_ID INNER JOIN TrainingRoom ON Courses.CID = TrainingRoom.course_ID ON Centres.centre_no = TrainingRoom.centre_ID INNER JOIN Members ON Roster.mem_ID = Members.ID WHERE (Members.mem_tp = 'trainer') AND (Courses.startdate <= CAST(GETDATE() AS DATE)) AND (Courses.enddate >= CAST(GETDATE() AS DATE))";

            Course c ;

            SqlDataReader reader = cmd.ExecuteReader();

            while (reader.Read())
            {
                c = new Course();

                c.cid = reader["CID"].ToString();
                c.name = reader["course_name"].ToString();
                c.description = reader["description"].ToString();
                c.credit = Convert.ToInt32( reader["credit"].ToString());

                course.Add(c);
            }

            return course;
        }

        [WebMethod]
        public List<Course> CoursesByLocation(string campus)
        {
            con = new SqlConnection(conString.ConnectionString);
            try
            {
                con.Open();

            }
            catch (SqlException ex)
            {
                Console.Write(ex.Message);
            }
            List<Course> course = new List<Course>();
            cmd.Connection = con;
            cmd.CommandText = "SELECT DISTINCT Courses.CID, Courses.course_name, Courses.description, Courses.credit, TrainingRoom.RoomNo, Centres.locale, Members.fname, Courses.startdate, Courses.enddate FROM Centres INNER JOIN Courses INNER JOIN Roster ON Courses.CID = Roster.course_ID INNER JOIN TrainingRoom ON Courses.CID = TrainingRoom.course_ID ON Centres.centre_no = TrainingRoom.centre_ID INNER JOIN Members ON Roster.mem_ID = Members.ID WHERE (Members.mem_tp = 'trainer') AND (Centres.locale = @loc) AND (Courses.startdate <= CAST(GETDATE() AS DATE)) AND (Courses.enddate >= CAST(GETDATE() AS DATE))";
            cmd.Parameters.AddWithValue("@loc", campus);

            Course c;

            SqlDataReader reader = cmd.ExecuteReader();

            while (reader.Read())
            {
                c = new Course();

                c.cid = reader["CID"].ToString();
                c.name = reader["course_name"].ToString();
                c.description = reader["description"].ToString();
                c.credit = Convert.ToInt32(reader["credit"].ToString());

                course.Add(c);
            }

            return course;
        }

    }
}
