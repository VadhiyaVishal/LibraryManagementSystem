using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Library_Management.Admin
{
    public partial class Book_Issue_Return : System.Web.UI.Page
    {
        DBConnect dbcon = new DBConnect();
        SqlCommand cmd;
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!this.IsPostBack)
            {
                BindGridData();
            }
        }
        private void BindGridData()
        {
            cmd = new SqlCommand("GetIssueBook", dbcon.GetCon());
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.Clear();
            //cmd.Parameters.AddWithValue("@StatementType", "Select");
            GridView1.DataSource = dbcon.Load_Data(cmd);
            GridView1.DataBind();
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            if(IsValid)
            {
                GetMemName();
                GetBookName();
            }
            else
            {
                Response.Write("<script>alert('Validation Error plz enter MemberID or BookID ....try again');</script>");
            }
        }

        private void GetBookName()
        {
            cmd = new SqlCommand("sp_Insert_Up_Del_BookInventory", dbcon.GetCon());
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.Clear();  
            cmd.Parameters.AddWithValue("@book_id", txtBookID.Text.Trim());
            cmd.Parameters.AddWithValue("@StatementType", "SelectByID");
            DataTable dtt = dbcon.Load_Data(cmd);
            if (dtt.Rows.Count >= 1)
            {
                txtBookName.Text = dtt.Rows[0]["book_name"].ToString();
            }
            else
            {
                Response.Write("<script>alert('Wrong Book ID ....try again');</script>");
            }

        }

        private void GetMemName()
        {
            cmd = new SqlCommand("getMember_ByID", dbcon.GetCon());
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.Clear();
            cmd.Parameters.AddWithValue("@ID",txtMemID.Text.Trim());
            DataTable dtt = dbcon.Load_Data(cmd);
            if(dtt.Rows.Count>=1)
            {
                txtMemName.Text = dtt.Rows[0]["full_name"].ToString();

            }
            else
            {
                Response.Write("<script>alert('Wrong Member ID ....try again');</script>");
            }

        }

        protected void btnIssue_Click(object sender, EventArgs e)
        {
            if(ISBookExist() && IsMemberExist())
            {
                if(IsIssueEntryExist())
                {
                    Response.Write("<script>alert('This Member already has this Book');</script>");
                }
                else
                {
                    issueBook();
                    BindGridData();
                }
            }
            else
            {
                Response.Write("<script>alert('Wrong MemberID or BookID ....try again');</script>");
            }
        }

        private void issueBook()
        {
            cmd = new SqlCommand("InsertBookIssue", dbcon.GetCon());
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.Clear();
            cmd.Parameters.AddWithValue("@member_id", txtMemID.Text.Trim());
            cmd.Parameters.AddWithValue("@book_id", txtBookID.Text.Trim());
            cmd.Parameters.AddWithValue("@member_name", txtMemName.Text.Trim());
            cmd.Parameters.AddWithValue("@book_name", txtBookName.Text.Trim());
            cmd.Parameters.AddWithValue("@issue_date", txtIssueDate.Text.Trim());
            cmd.Parameters.AddWithValue("@due_date", txtDueDate.Text.Trim());
            if (dbcon.InsertUpdateData(cmd))
            {
                UpdateBookStock();
            }
            else
            {
                Response.Write("<script>alert('Book Not Issue');</script>");
            }
        }

        private void UpdateBookStock()
        {
            cmd = new SqlCommand("UpdateIssueBookStock", dbcon.GetCon());
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.Clear();
            cmd.Parameters.AddWithValue("@book_id", txtBookID.Text.Trim());
            if (dbcon.InsertUpdateData(cmd))
            {
                Response.Write("<script>alert('Book Issue Successfully');</script>");
            }
            else
            {
                Response.Write("<script>alert('current stock not updated');</script>");
            }
        }

        private bool IsIssueEntryExist()
        {
            cmd = new SqlCommand("checkIssueexistOrnot", dbcon.GetCon());
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Clear();
            cmd.Parameters.AddWithValue("@mid", txtMemID.Text.Trim());
            cmd.Parameters.AddWithValue("@bid", txtBookID.Text.Trim());
            DataTable dtt = dbcon.Load_Data(cmd);
            if (dtt.Rows.Count >= 1)
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        private bool ISBookExist()
        {
            cmd = new SqlCommand("sp_CBSE2", dbcon.GetCon());
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Clear();
            cmd.Parameters.AddWithValue("@book_id",txtBookID.Text.Trim());
            DataTable dtt = dbcon.Load_Data(cmd);
            if (dtt.Rows.Count >= 1)
            {
                return true;
            }
            else
            {
                return false;
            }
        }
        private bool IsMemberExist()
        {
            cmd = new SqlCommand("getMember_ByID", dbcon.GetCon());
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.Clear();
            cmd.Parameters.AddWithValue("@ID", txtMemID.Text.Trim());
            DataTable dtt = dbcon.Load_Data(cmd);
            if (dtt.Rows.Count >= 1)
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        protected void btnReturn_Click(object sender, EventArgs e)
        {

            if (ISBookExist() && IsMemberExist())
            {
                if (IsIssueEntryExist())
                {
                    if(checkFine())
                    {
                        ReturnBook();
                        BindGridData();
                    }
                    else
                    {
                        //open fine page where user can paid fine
                        Response.Redirect("BookFineEntry.aspx?bid="+txtBookID.Text+"&mid="+txtMemID.Text+ "&day=" + Session["day"].ToString());
                    }   
                }
                else
                {
                    Response.Write("<script>alert('This Entry does not Exits');</script>");
                }
            }
            else
            {
                Response.Write("<script>alert('Wrong MemberID or BookID ....try again');</script>");
            }
        }

        private void ReturnBook()
        {
            cmd = new SqlCommand("ReturnBook_Updatestock", dbcon.GetCon());
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Clear();
            cmd.Parameters.AddWithValue("@member_id", txtMemID.Text.Trim());
            cmd.Parameters.AddWithValue("@book_id", txtBookID.Text.Trim());
            if (dbcon.InsertUpdateData(cmd))
            {
                Response.Write("<script>alert('Book Return Successfully');</script>");
            }
            else
            {
                Response.Write("<script>alert('Book Not Return... try again');</script>");
            }
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            try
            {
                if (e.Row.RowType == DataControlRowType.DataRow)
                {
                    //check your condition here 
                    DateTime dt = Convert.ToDateTime(e.Row.Cells[5].Text);
                    DateTime today = DateTime.Today;
                    if (today > dt)
                    {
                        e.Row.BackColor = System.Drawing.Color.PaleVioletRed;
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
        private bool checkFine()
        {
            int days;
            cmd = new SqlCommand("GetNumofDay", dbcon.GetCon());
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@book_id",txtBookID.Text.Trim());
            cmd.Parameters.AddWithValue("@member_id", txtMemID.Text.Trim());
            DataTable dtt = dbcon.Load_Data(cmd);
            if (dtt.Rows.Count >= 1)
            {
                days = Convert.ToInt32(dtt.Rows[0]["number_of_day"].ToString());
                Session["day"] = days;
                if(days<=0)
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
            else
            {
                return false;
            }
        }

    }
}