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
    public partial class Add_publisher : System.Web.UI.Page
    {
        DBConnect dbcon = new DBConnect();
        SqlCommand cmd;
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                Autogenrate();
                BindRecord();
                btnadd.Visible = true;
                btnupdate.Visible = false;
                btncancle.Visible = true;
            }
            else
            {

            }
        }

        protected void btnadd_Click(object sender, EventArgs e)
        {
            if (IsValid)
            {
                insertpublisher();
            }
            else
            {
                Response.Write("<script>alert('Please enter valid data Try Again...');</script>");
            }
        }

        protected void btnupdate_Click(object sender, EventArgs e)
        {
            cmd = new SqlCommand("sp_UpdatePublisher", dbcon.GetCon());
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@id", txtpublisherID.Text);
            cmd.Parameters.AddWithValue("@name", txtpublisherName.Text);
            dbcon.OpenCon();
            if (cmd.ExecuteNonQuery() == 1)
            {
                dbcon.CloseCon();
                Response.Write("<script>alert('Data Update Successfully');</script>");
                // ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "swal('Success','Saved Successfully','success')", true);
                clrcontrol();
                BindRecord();
                Autogenrate();
                btnadd.Visible = true;
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
        public void Autogenrate()
        {
            {
                int r;
                dbcon.OpenCon();
                cmd = new SqlCommand("select MAX(publisher_id)as ID from publisher_master_tbl", dbcon.GetCon());
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    string d = dr[0].ToString();
                    if (d == "")
                    {
                        txtpublisherID.Text = "1";
                    }
                    else
                    {
                        r = Convert.ToInt32(dr[0].ToString());
                        r = r + 1;
                        txtpublisherID.Text = r.ToString();
                    }
                    txtpublisherID.ReadOnly = true;
                    //txtID.BackColor = System.Drawing.Color.Red;
                }
                dbcon.CloseCon();
            }
        }

        protected void BindRecord()
        {
            cmd = new SqlCommand("sp_getPublisher", dbcon.GetCon());
            cmd.CommandType = CommandType.StoredProcedure;
            DataTable dt = new DataTable();
            dbcon.OpenCon();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
            RptPublisher.DataSource = dt;
            RptPublisher.DataBind();


        }
        protected void insertpublisher()
        {
            cmd = new SqlCommand("sp_InsertPublisher", dbcon.GetCon());
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@id", txtpublisherID.Text);
            cmd.Parameters.AddWithValue("@name", txtpublisherName.Text);
            dbcon.OpenCon();
            if (cmd.ExecuteNonQuery() == 1)
            {

                dbcon.CloseCon();
                Response.Write("<script>alert('Saved Successfully');</script>");
                // ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "swal('Success','Saved Successfully','success')", true);
                clrcontrol();
                BindRecord();
                Autogenrate();
            }
            else
            {
                dbcon.CloseCon();
                Response.Write("<script>alert('Error Try Again....');</script>");
                //ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "swal('Error','Error! Record not Inserted Try Again....','Error')", true);
            }
        }

        private void clrcontrol()
        {

            txtpublisherName.Text = txtpublisherID.Text = string.Empty;
            txtpublisherID.Focus();
        }
        protected void SearchrecordBy_ID(string idd)
        {

            cmd = new SqlCommand("sp_getPublisherByID", dbcon.GetCon());
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Clear();
            cmd.Parameters.AddWithValue("@id", idd);
            dbcon.OpenCon();
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            // DataTable dt = new DataTable();
            DataSet ds = new DataSet();
            sda.Fill(ds, "dt");
            dbcon.CloseCon();
            if (ds.Tables[0].Rows.Count > 0)
            {

                txtpublisherID.Text = ds.Tables[0].Rows[0]["publisher_id"].ToString();
                txtpublisherName.Text = ds.Tables[0].Rows[0]["publisher_name"].ToString();
                btnadd.Visible = false;
                btnupdate.Visible = true;
                btncancle.Visible = true;
            }
            else
            {
                Response.Write("<script>alert('Error No Record Found Try Again....')</script>");
            }
        }

        protected void Unnamed_ItemCommand(object source, RepeaterCommandEventArgs e)
        {

        }

        protected void RptPublisher_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "Edit")
            {
                string[] commandArgs = e.CommandArgument.ToString().Split(new char[] { '&' });
                string id = commandArgs[0];
                SearchrecordBy_ID(id);
            }
            else if (e.CommandName == "Delete")
            {
                string[] commandArgs = e.CommandArgument.ToString().Split(new char[] { '&' });
                string id = commandArgs[0];
                cmd = new SqlCommand("sp_DeletePublisherByID", dbcon.GetCon());
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Clear();
                cmd.Parameters.AddWithValue("@id", id);
                dbcon.OpenCon();
                if (cmd.ExecuteNonQuery() == 1)
                {
                    dbcon.CloseCon();
                    Response.Write("<script>alert('Data Delete Successfully');</script>");
                    // ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "swal('Success','Saved Successfully','success')", true);
                    clrcontrol();
                    BindRecord();
                    Autogenrate();
                    btnadd.Visible = true;
                    btnupdate.Visible = false;
                  //  btncancle.Visible = false;
                }
                else
                {
                    dbcon.CloseCon();
                    Response.Write("<script>alert(' Record Not Delete Error Try Again....');</script>");
                    //ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "swal('Error','Error! Record not Inserted Try Again....','Error')", true);
                }
            }
        }
    }
}
