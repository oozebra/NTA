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
    public partial class login : System.Web.UI.Page
    {
        static Configuration rootWebConfig = WebConfigurationManager.OpenWebConfiguration("/NTA");
        const string CONSTRINGNAME = "NTAConnectionString";
        ConnectionStringSettings conString = rootWebConfig.ConnectionStrings.ConnectionStrings[CONSTRINGNAME];
        SqlConnection con;
        string user, pass;
        static Member client;
        protected void Page_Load(object sender, EventArgs e)
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
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            user = userid.Text;
            pass = pwd.Text;

            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;

            cmd.CommandText = "SELECT * FROM Members WHERE ID=@id AND pword=@pw";
            cmd.Parameters.AddWithValue("@id", user);
            cmd.Parameters.AddWithValue("@pw", pass);

            try
            {
                SqlDataReader reader = cmd.ExecuteReader();

                if (reader.HasRows)
                {
                    client = new Member();
                    while (reader.Read())
                    {
                        client.ID = reader.GetInt32(reader.GetOrdinal("ID"));
                        client.fname = reader["fname"].ToString();
                        client.lname = reader["lname"].ToString();
                        client.adres = reader["adres"].ToString();
                        client.mem_tp = reader["mem_tp"].ToString();
                        client.dob = reader.GetDateTime(reader.GetOrdinal("dob"));
                        
                    }
                    Label3.Text = client.toString();
                    Session["mem"] = client;

                    Response.Redirect("index.aspx");
                }

            }
            catch (SqlException se)
            {
                Console.WriteLine(se.Message);
                Label3.Text = se.Message;
            }
        }
    }
}