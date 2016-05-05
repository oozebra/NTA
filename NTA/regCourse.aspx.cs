using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NTA
{
    public partial class regCourse : System.Web.UI.Page
    {
        static Configuration rootWebConfig = WebConfigurationManager.OpenWebConfiguration("/NTA");
        const string CONSTRINGNAME = "NTAConnectionString";
        ConnectionStringSettings conString = rootWebConfig.ConnectionStrings.ConnectionStrings[CONSTRINGNAME];
        SqlConnection con;

        //form data
        string cid, name, desc,t1,t2;
        int credit;
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
            cid = txt_cid.Text;
            name = txt_name.Text;
            desc = txt_desc.Text;
            credit = Convert.ToInt32( DropDownList1.SelectedItem.Value);
            t1 = sdate.Text;

            DateTime dt = Convert.ToDateTime(t1);
            dt = dt.Add(new System.TimeSpan(36, 0, 0, 0));
            t2 = dt.ToShortDateString();



            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;

            cmd.CommandText = "INSERT INTO Courses(CID,course_name,description,credit,startdate,enddate) VALUES(@var,@var1,@var2,@var3,@var4,var5)";
            cmd.Parameters.AddWithValue("@var", cid);
            cmd.Parameters.AddWithValue("@var1", name);
            cmd.Parameters.AddWithValue("@var2", desc);
            cmd.Parameters.AddWithValue("@var3", credit);
            cmd.Parameters.AddWithValue("@var4", SqlDbType.Date).Value = t1;
            cmd.Parameters.AddWithValue("@var5", SqlDbType.Date).Value = t2;
            try
            {
                int rowsAffected = cmd.ExecuteNonQuery();

                if (rowsAffected == 1)
                {                //Success notification
                                 //reset values
                    txt_cid.Text = "";
                     txt_name.Text = "";
                    txt_desc.Text = "";
                    DropDownList1.ClearSelection();
                    err.Text = "";
                    con.Close();
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