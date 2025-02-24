using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Library_Management.UserScreen
{
    public partial class uReport : System.Web.UI.Page
    {
        DBConnect dbcon = new DBConnect();
        SqlCommand cmd;
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["mid"] == null)
            {
                Response.Redirect("~/signout.aspx");

            }
            else
            {
                if (!this.IsPostBack)
                {
                    BindGridData();
                }
            }
        }
        private void BindGridData()
        {
            cmd = new SqlCommand("sp_GetUser_IssueBookDetails", dbcon.GetCon());
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.Clear();
            cmd.Parameters.AddWithValue("@mid", Session["mid"].ToString());
            GridView1.DataSource = dbcon.Load_Data(cmd);
            GridView1.DataBind();
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {

        }
    }
}