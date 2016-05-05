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
    public partial class stdRegCourse : System.Web.UI.Page
    {
        static Configuration rootWebConfig = WebConfigurationManager.OpenWebConfiguration("/NTA");
        const string CONSTRINGNAME = "NTAConnectionString";
        ConnectionStringSettings conString = rootWebConfig.ConnectionStrings.ConnectionStrings[CONSTRINGNAME];
        SqlConnection con;
        public Member client;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["mem"] != null)
            {
                client = (Member)Session["mem"];
            }else
            {
                Response.Redirect("index.aspx");
            }

            con = new SqlConnection(conString.ConnectionString);
            try
            {
                con.Open();

            }
            catch (SqlException ex)
            {
                Console.Write(ex.Message);
            }
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow row = GridView1.SelectedRow;
            string selecteditem = row.Cells[2].Text + "@ " + row.Cells[6].Text+ " Campus, Room #:"+ row.Cells[5].Text;
                        
               ListItem ans = selectedCourseList.Items.FindByText(selecteditem);
                if (ans == null)
                {
                
                selectedCourseList.Items.Add(selecteditem);
                selectedCourseList.Items.FindByText(selecteditem).Value = row.Cells[1].Text;
                }           
        }

        protected void remove_Click(object sender, EventArgs e)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandText = "INSERT INTO Roster(mem_ID,course_ID) VALUES (@v1,@v2)";

            foreach (ListItem item in selectedCourseList.Items)
            {
                cmd.Parameters.AddWithValue("@va1", client.ID);
                cmd.Parameters.AddWithValue("@va2", item.Value);

                int rowsAffected = cmd.ExecuteNonQuery();
                if (rowsAffected == 1)
                {                //Success notification
                                 //reset values
                    
                }
                else
                {

                    
                }
            }
            Response.Redirect("index.aspx");
        }
        
    }
}
