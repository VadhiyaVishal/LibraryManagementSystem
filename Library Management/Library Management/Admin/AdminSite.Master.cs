using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Library_Management.Admin
{
    public partial class AdminSite : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Adminrole"]!=null && Session["Adminrole"].Equals("Admin"))
            {
                if (!IsPostBack)
                {
                    lblUserName.Text = "Hi," + Session["Adminfullname"].ToString();
                }
            }
            else
            {
                Response.Redirect("~/signout.aspx");
            }
        }
    }
}