using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using NTA.ServiceReference1;

namespace NTA
{
    public partial class Tobago : System.Web.UI.Page
    {
        static Configuration rootWebConfig = WebConfigurationManager.OpenWebConfiguration("/NTA");
        const string CONSTRINGNAME = "NTAConnectionString";
        ConnectionStringSettings conString = rootWebConfig.ConnectionStrings.ConnectionStrings[CONSTRINGNAME];
        SqlConnection con;
        public Member client;
        ServiceReference1.coursesStreamSoapClient clientt;
        public ScheduledCourse[] val;

        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["mem"] != null)
            {
                client = (Member)Session["mem"];
            }
            else
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
            clientt = new ServiceReference1.coursesStreamSoapClient();
            val = clientt.CoursesByLocation("Tobago");
            
        }
    }
}