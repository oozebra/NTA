using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Configuration;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

namespace NTA
{
    public partial class Register : System.Web.UI.Page
    {
        static Configuration rootWebConfig = WebConfigurationManager.OpenWebConfiguration("/NTA");
        const string CONSTRINGNAME = "NTAConnectionString";
        ConnectionStringSettings conString = rootWebConfig.ConnectionStrings.ConnectionStrings[CONSTRINGNAME];
        SqlConnection con;
        //form data
        string fname, lname, address, type, pwd1, pwd2, dob;

        protected void Page_Load(object sender, EventArgs e)
        {
            con = new SqlConnection(conString.ConnectionString);
            try
            {
                con.Open();
                if (con.State == ConnectionState.Open) // if connection.Open was successful
                {
                    Label1.Text = "You have been successfully connected to the database!";
                }
                else
                {
                    Label1.Text = "Connection failed.";
                }
            }
            catch (SqlException) { }

        }

        protected void sub_Click(object sender, EventArgs e)
        {
            //get form values
            fname = txt_fname.Text;
            lname = txt_lname.Text;
            address = txt_address.Text;
            type = RadioButtonList1.SelectedItem.Text;
            dob = txt_dob.Text;
            pwd1 = txt_pwd1.Text;

            //convert date and password values
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
  
            cmd.CommandText = "INSERT INTO Members(fname,lname,adres,mem_tp,dob,pword) Values (@var,@var1,@var2,@var3,@var4,@var5)";
            cmd.Parameters.AddWithValue("@var", fname);
            cmd.Parameters.AddWithValue("@var1", lname);
            cmd.Parameters.AddWithValue("@var2", address);
            cmd.Parameters.AddWithValue("@var3", type);
            cmd.Parameters.AddWithValue("@var4", SqlDbType.Date).Value = dob;
            cmd.Parameters.AddWithValue("@var5", pwd1);
            try {
                int rowsAffected = cmd.ExecuteNonQuery();

                if (rowsAffected == 1)
                {                //Success notification
                                 //reset values
                    txt_fname.Text = "";
                    txt_lname.Text = "";
                    txt_address.Text = "";
                    RadioButtonList1.ClearSelection();
                    txt_dob.Text = "";
                    txt_pwd1.Text = "";
                    txt_pwd2.Text = "";
                    err.Text = "";

                    con.Close();
                }
                else
                {

                    err.Text = "Data could not be submitted";
                }
            }catch(SqlException ex)
            {
                Console.Write(ex.Message);
                err.Text = ex.Message + "";
            }
        }
    }
}