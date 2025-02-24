using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Library_Management
{
    public partial class SignUp : System.Web.UI.Page
    {

        DBConnect dbcon = new DBConnect();
        SqlCommand cmd;
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                Autogenrate();
            }
        }

        protected void btnSignup_Click(object sender, EventArgs e)
        {
            //how to insert or Signup button code
            if(checkDuplicationMemberExist())
            {
                Response.Write("<script>alert('Member already exist with this ID and email');</script>");
            }
            else
            {
                createAccount();
            }
        }

        private void createAccount()
        {
            cmd = new SqlCommand("sp_InsertSignup", dbcon.GetCon());
            cmd.Parameters.AddWithValue("@full_name", txtFullName.Text);
            cmd.Parameters.AddWithValue("@dob", txtDOB.Text);
            cmd.Parameters.AddWithValue("@contact_no",txtContactNO.Text);
            cmd.Parameters.AddWithValue("@email",txtEmail.Text);
            cmd.Parameters.AddWithValue("@state",ddlState.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@city",txtCity.Text);
            cmd.Parameters.AddWithValue("@pincode",txtPIN.Text);
            cmd.Parameters.AddWithValue("@full_address",txtAddress.Text);
            cmd.Parameters.AddWithValue("@member_id",txtMemberID.Text);
            cmd.Parameters.AddWithValue("@password",txtPassword.Text);
            cmd.Parameters.AddWithValue("@account_status","Pending");
            dbcon.OpenCon();
            cmd.CommandType = CommandType.StoredProcedure;
            
            if(cmd.ExecuteNonQuery()==1)
            {
                //Response.Write("<script>alert('Account Created Successfully');</script>");
                ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "swal('Success','Account Created Successfully','success')", true);
                clrcontrol();
                Autogenrate();
            }
            else
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "swal('Error','Error! Record not Inserted Try Again....','Error')", true);
                //Response.Write("<script>alert('Error Try Again....');</script>");
            }
            dbcon.CloseCon();
        }

        protected bool checkDuplicationMemberExist()
        {
            cmd = new SqlCommand("sp_checkDuplicateMember", dbcon.GetCon());
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@member_id",txtMemberID.Text.Trim());
            cmd.Parameters.AddWithValue("@email",txtEmail.Text.Trim());
            dbcon.OpenCon();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            if(dt.Rows.Count>=1)
            {
                return true;
            }
            else
            {
                return false;
            }

        }
        public void Autogenrate()
        {
            try
            {
                int r;
                dbcon.OpenCon();
                 cmd = new SqlCommand("select MAX(member_id)as ID from member_master_tbl", dbcon.GetCon());
                SqlDataReader dr = cmd.ExecuteReader();
                if(dr.Read())
                {
                    string d = dr[0].ToString();
                    if(d=="")
                    {
                        txtMemberID.Text = "1";
                    }
                    else
                    {
                        r = Convert.ToInt32(dr[0].ToString());
                        r = r + 1;
                        txtMemberID.Text = r.ToString();
                    }
                    txtMemberID.ReadOnly=true;
                }
                dbcon.CloseCon();
            }
            catch(Exception ex)
            {
                Response.Write("<script>alert(" + ex.Message + ")</Script>");
            }
        }
        private void clrcontrol()
        {
            txtFullName.Text = txtAddress.Text = txtCity.Text = txtContactNO.Text = txtDOB.Text = txtEmail.Text = txtPassword.Text = txtPIN.Text = string.Empty;
            ddlState.SelectedIndex = 0;
            txtFullName.Focus();
        }
    }
}