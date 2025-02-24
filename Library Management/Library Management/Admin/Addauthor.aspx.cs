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
    public partial class Addauthor : System.Web.UI.Page
    {

        DBConnect dbcon = new DBConnect();
        SqlCommand cmd;
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                Autogenrate();
                BindRepeater();
            }
            else
            {

            }
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            cmd = new SqlCommand("sp_InsertAuthor", dbcon.GetCon());
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@id",txtID.Text);
            cmd.Parameters.AddWithValue("@name",txtAuthorName.Text);
            dbcon.OpenCon();
            if(cmd.ExecuteNonQuery()==1)
            {
                dbcon.CloseCon();
                Response.Write("<script>alert('Saved Successfully');</script>");
                // ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "swal('Success','Saved Successfully','success')", true);
                clrcontrol();
                BindRepeater();
                Autogenrate();
            }
            else
            {
                dbcon.CloseCon();
                Response.Write("<script>alert('Error Try Again....');</script>");
                //ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "swal('Error','Error! Record not Inserted Try Again....','Error')", true);
            }
        }
        protected void clrcontrol()
        {
            txtAuthorName.Text = txtID.Text = string.Empty;
            txtID.Focus();
        }
        public void Autogenrate()
        {
            try
            {
                int r;
                dbcon.OpenCon();
                cmd = new SqlCommand("select MAX(author_id)as ID from author_master_tbl", dbcon.GetCon());
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    string d = dr[0].ToString();
                    if (d == "")
                    {
                        txtID.Text = "1";
                    }
                    else
                    {
                        r = Convert.ToInt32(dr[0].ToString());
                        r = r + 1;
                        txtID.Text = r.ToString();
                    }
                    txtID.ReadOnly = true;
                    //txtID.BackColor = System.Drawing.Color.Red;
                }
                dbcon.CloseCon();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert(" + ex.Message + ")</Script>");
            }
        }

        protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if(e.CommandName == "Edit")
            {
                string[] commandArgs = e.CommandArgument.ToString().Split(new char[] { '&' });
                string id = commandArgs[0];
                SearchDataforUpdate(Convert.ToInt32(id));
            }
            else if(e.CommandName == "Delete")
            {
                string[] commandArgs = e.CommandArgument.ToString().Split(new char[] { '&' });
                string id = commandArgs[0];
                cmd = new SqlCommand("sp_DeleteAuthor", dbcon.GetCon());
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Clear();
                cmd.Parameters.AddWithValue("@ID", id);
                dbcon.OpenCon();
                if (cmd.ExecuteNonQuery() == 1)
                {
                    dbcon.CloseCon();
                    Response.Write("<script>alert('Data Delete Successfully');</script>");
                    // ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "swal('Success','Saved Successfully','success')", true);
                    clrcontrol();
                    BindRepeater();
                    Autogenrate();
                    btnAdd.Visible = true;
                    btnupdate.Visible = false;
                    btncancle.Visible = false;
                }
                else
                {
                    dbcon.CloseCon();
                    Response.Write("<script>alert(' Record Not Delete Error Try Again....');</script>");
                    //ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "swal('Error','Error! Record not Inserted Try Again....','Error')", true);
                }

            }
        }

        private void SearchDataforUpdate(int idd)
        {
            cmd = new SqlCommand("sp_GetAuthorByID", dbcon.GetCon());
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Clear();
            cmd.Parameters.AddWithValue("@ID",idd);
            dbcon.OpenCon();
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
           // DataTable dt = new DataTable();
            DataSet ds = new DataSet();
            sda.Fill(ds, "dt");
            dbcon.CloseCon();
            if(ds.Tables[0].Rows.Count > 0)
            {
                Session["AuthorID"] = ds.Tables[0].Rows[0]["author_id"].ToString();
                txtID.Text = ds.Tables[0].Rows[0]["author_id"].ToString();
                txtAuthorName.Text = ds.Tables[0].Rows[0]["author_name"].ToString();
                btnAdd.Visible = false;
                btnupdate.Visible = true;
                btncancle.Visible = true;
            }
            else
            {
                Response.Write("<script>alert('Error No Record Found Try Again....')</script>");
            }
        }

        protected void BindRepeater()
        {
            cmd = new SqlCommand("spGetAuthor", dbcon.GetCon());
            cmd.CommandType = CommandType.StoredProcedure;
            DataTable dt = new DataTable();
            dbcon.OpenCon();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
            Repeater1.DataSource = dt;
            Repeater1.DataBind();

        }

        protected void btnupdate_Click(object sender, EventArgs e)
        {
            cmd = new SqlCommand("sp_UpdateAuthor", dbcon.GetCon());
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@id", txtID.Text);
            cmd.Parameters.AddWithValue("@name", txtAuthorName.Text);
            dbcon.OpenCon();
            if (cmd.ExecuteNonQuery() == 1)
            {
                dbcon.CloseCon();
                Response.Write("<script>alert('Data Update Successfully');</script>");
                // ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "swal('Success','Saved Successfully','success')", true);
                clrcontrol();
                BindRepeater();
                Autogenrate();
                btnAdd.Visible = true;
                btnupdate.Visible = false;
                btncancle.Visible = false;
            }
            else
            {
                dbcon.CloseCon();
                Response.Write("<script>alert(' Record Not Update Error Try Again....');</script>");
                //ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "swal('Error','Error! Record not Inserted Try Again....','Error')", true);
            }
        }

        protected void btncancle_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminHome.aspx");
        }
    }
}