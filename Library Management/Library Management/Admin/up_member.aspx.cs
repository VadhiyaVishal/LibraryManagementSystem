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
    public partial class up_member : System.Web.UI.Page
    {

        DBConnect dbcon = new DBConnect();
        SqlCommand cmd;
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!this.IsPostBack)
            {
                BindGridview();
            }
        }

        private void BindGridview()
        {
            cmd = new SqlCommand("sp_getMember_AllRecords", dbcon.GetCon());
            cmd.CommandType = CommandType.StoredProcedure;
            GridView1.DataSource = dbcon.Load_Data(cmd);
            GridView1.DataBind();
        }

        protected void btnSearchMember_Click(object sender, EventArgs e)
        {
            if(IsValid)
            { 
                  Search_memberRecord();
            }
        }

        private void Search_memberRecord()
        {
            cmd = new SqlCommand("sp_getMemberByID", dbcon.GetCon());
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@id",txtMemberID.Text.Trim());
            dbcon.OpenCon();
            SqlDataReader dr = cmd.ExecuteReader();
            if(dr.HasRows)
            {
                while(dr.Read())
                {
                    txtFullName.Text = dr.GetValue(0).ToString();
                    txtDOB.Text = dr.GetValue(1).ToString();
                    txtContactNO.Text = dr.GetValue(2).ToString();
                    txtEmail.Text = dr.GetValue(3).ToString();
                    ddlState.SelectedValue = dr.GetValue(4).ToString();
                    txtCity.Text = dr.GetValue(5).ToString();
                    txtPIN.Text = dr.GetValue(6).ToString();
                    txtAddress.Text = dr.GetValue(7).ToString();
                }
            }
            else
            {
                Response.Write("<script>Alert('Record Not Found ...Try Again');</script>");
            }
            dbcon.CloseCon();

        }

        protected void btnActiveMember_Click(object sender, EventArgs e)
        {
            if(IsValid)
            {
                UpdateMemberStatus("Active");
            }
            else
            {
                Response.Write("<script>Alert('Validation Error ...Try Again');</script>");
            }
        }

        private void UpdateMemberStatus(string varstatus)
        {
            if(checkMemberExist_OR_Not())
            {
                cmd = new SqlCommand("sp_UpdateMemberStatus", dbcon.GetCon());
                cmd.Parameters.Clear();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@id", txtMemberID.Text.Trim());
                cmd.Parameters.AddWithValue("@qrType", varstatus);
                dbcon.OpenCon();
                if (cmd.ExecuteNonQuery()>0)
                {
                    Response.Write("<script>Alert('Member Status Updated');</script>");
                    //Response.Write("<script>Alert('Login Successfully');</script>");
                }
                else
                {
                    Response.Write("<script>Alert('Record Not Updated ...Try Again');</script>");
                }
                dbcon.CloseCon();

            }
            else
            {
                Response.Write("<script>Alert('Record Not Found ...Try Again');/script>");
            }
        }

        private bool checkMemberExist_OR_Not()
        {
            dbcon.OpenCon();
            cmd=new SqlCommand("sp_getMemberByID", dbcon.GetCon());
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@id", txtMemberID.Text.Trim());
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            dbcon.CloseCon();
            if (dt.Rows.Count >= 1)
            {
                return true;
            }
            else
            {
                return false;
            }
      
        }

        protected void btnPendingMember_Click(object sender, EventArgs e)
        {
            if (IsValid)
            {
                UpdateMemberStatus("pending");
            }
            else
            {
                Response.Write("<script>Alert('Validation Error ...Try Again');</script>");
            }
        }

        protected void btnDeactiveMember_Click(object sender, EventArgs e)
        {
            if (IsValid)
            {
                UpdateMemberStatus("Deactive");
            }
            else
            {
                Response.Write("<script>Alert('Validation Error ...Try Again');</script>");
            }
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            BindGridview();
        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            BindGridview();
        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            BindGridview();
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            Label mid = (Label)GridView1.Rows[e.RowIndex].FindControl("lblDisplayID");
            int ID = Convert.ToInt32(mid.Text);

            TextBox updatetxtName = (TextBox)GridView1.Rows[e.RowIndex].FindControl("txtEditName");
            TextBox updatetxtDOB = (TextBox)GridView1.Rows[e.RowIndex].FindControl("txtEditdob");
            TextBox updatetxtContact = (TextBox)GridView1.Rows[e.RowIndex].FindControl("txtEditContact");
            TextBox updatetxtEmail = (TextBox)GridView1.Rows[e.RowIndex].FindControl("txtEditEmail");
            DropDownList updatetxtddlState = (DropDownList)GridView1.Rows[e.RowIndex].FindControl("ddlEditState");
            TextBox updatetxtCity = (TextBox)GridView1.Rows[e.RowIndex].FindControl("txtEditCity");
            TextBox updatetxtPincode = (TextBox)GridView1.Rows[e.RowIndex].FindControl("txtEditPincode");
            TextBox updatetxtAddress = (TextBox)GridView1.Rows[e.RowIndex].FindControl("txtEditAddress");
            cmd =new  SqlCommand("sp_UpdateMember_Records", dbcon.GetCon());
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Clear();
            cmd.Parameters.AddWithValue("@full_name", updatetxtName.Text);
            cmd.Parameters.AddWithValue("@dob", updatetxtDOB.Text);
            cmd.Parameters.AddWithValue("@contact_no", updatetxtContact.Text);
            cmd.Parameters.AddWithValue("@email", updatetxtEmail.Text);
            cmd.Parameters.AddWithValue("@state", updatetxtddlState.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@city", updatetxtCity.Text);
            cmd.Parameters.AddWithValue("@pincode", updatetxtPincode.Text);
            cmd.Parameters.AddWithValue("@full_address", updatetxtAddress.Text);
            cmd.Parameters.AddWithValue("@member_id",ID);
            dbcon.OpenCon();
            cmd.ExecuteNonQuery();
            dbcon.CloseCon();
            GridView1.EditIndex = -1;
            BindGridview();
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            Label mid = (Label)GridView1.Rows[e.RowIndex].FindControl("lblDisplayID");
            int ID = Convert.ToInt32(mid.Text);
            cmd = new SqlCommand("sp_DeleteMemberByID", dbcon.GetCon());
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Clear();
            cmd.Parameters.AddWithValue("@member_id", ID);
            dbcon.OpenCon();
            cmd.ExecuteNonQuery();
            dbcon.CloseCon();
            BindGridview();

        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if(e.Row.RowType==DataControlRowType.DataRow && GridView1.EditIndex==e.Row.RowIndex)
            {
                DropDownList ddlEditState_value =(DropDownList) e.Row.FindControl("ddlEditState");
                Label lblstat = (Label)e.Row.FindControl("lblEditState");
                ddlEditState_value.SelectedValue = lblstat.Text;
            }
        }
    }
}