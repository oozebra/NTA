using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NTA
{
    public partial class createCourseSchedule : System.Web.UI.Page
    {
        static Configuration rootWebConfig = WebConfigurationManager.OpenWebConfiguration("/NTA");
        const string CONSTRINGNAME = "NTAConnectionString";
        ConnectionStringSettings conString = rootWebConfig.ConnectionStrings.ConnectionStrings[CONSTRINGNAME];
        SqlConnection con;
        public Member client;
        //form data
        string course, trainer, room,t1,t2;
        int centre;
        protected void Page_Load(object sender, EventArgs e)
        {
            con = new SqlConnection(conString.ConnectionString);
            try
            {
                con.Open();

                if (Session["mem"] != null)
                {
                    client = (Member)Session["mem"];
                }

            }
            catch (SqlException ex)
            {
                Console.Write(ex.Message);
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            //get course, trainer,centre and room no
            course = DropDownList1.SelectedItem.Value;
            trainer = DropDownList2.SelectedItem.Value;
            room = DropDownList4.SelectedItem.Value;
            

            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;

            cmd.CommandText = "SELECT centre_no FROM Rooms WHERE RoomNo = @val";
            cmd.Parameters.AddWithValue("@val", room);

            SqlDataReader reader = cmd.ExecuteReader();
            try
            {
                if (!reader.IsClosed) { 
                while (reader.Read())
                {
                    centre = reader.GetInt32(0);
                   
                }
            }

            }catch(SqlException ex)
            {
                Console.Write(ex.Message + "");
            }
            reader.Close();

            //create new query to upDATE table
            cmd.CommandText = "INSERT INTO Roster(mem_ID,course_ID) VALUES (@v1,@v2)";
            cmd.Parameters.AddWithValue("@v1", trainer);
            cmd.Parameters.AddWithValue("@v2", course);
            try
            {
                int rowsAffected = cmd.ExecuteNonQuery();

                if (rowsAffected == 1)
                {                //Success notification
                                 //reset values
                    
                }
                else
                {

                    err.Text = "Data could not be submitted";
                }
            }
            catch (SqlException ex)
            {
                Console.Write(ex.Message);
                err.Text = ex.Message + "";
            }

            cmd.CommandText = "INSERT INTO TrainingRoom(course_ID,centre_ID,RoomNo) VALUES (@va1,@va2,@va3)";
            cmd.Parameters.AddWithValue("@va1", course);
            cmd.Parameters.AddWithValue("@va2", centre);
            cmd.Parameters.AddWithValue("@va3", room);
            
            try
            {
                int rowsAffected = cmd.ExecuteNonQuery();

                if (rowsAffected == 1)
                {                //Success notification
                                 //reset values
                    con.Close();
                    err.Text = "";
                }
                else
                {

                    err.Text = "Data could not be submitted";
                }
            }
            catch (SqlException ex)
            {
                Console.Write(ex.Message);
                err.Text = ex.Message + "";
            }
        }

       
    }
}