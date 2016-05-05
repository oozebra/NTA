using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace NTA
{
    public partial class index : System.Web.UI.Page
    {
        public Member client;
        protected void Page_Load(object sender, EventArgs e)
        {


            if (Session["mem"] != null)
            {
                client = (Member)Session["mem"];
            }
        }
    }
}