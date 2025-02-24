using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Library_Management.Admin
{
    public partial class AdminBookInventory : System.Web.UI.Page
    {
        DBConnect dbcon = new DBConnect();
        SqlCommand cmd;
        static int actual_stock, current_stock, issued_books;
        static string filepath;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                Autogenrate();
                Bind_Author_Publisher();
                BindGridData();
            }
        }

        private void Bind_Author_Publisher()
        {
            cmd = new SqlCommand("spGetAuthor", dbcon.GetCon());
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            ddlAuthorName.DataSource = dbcon.Load_Data(cmd);
            ddlAuthorName.DataValueField = "author_name";
            ddlAuthorName.DataBind();
            ddlAuthorName.Items.Insert(0, new ListItem("--Select--"));

            cmd = new SqlCommand("sp_getPublisher", dbcon.GetCon());
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            ddlPublisherName.DataSource = dbcon.Load_Data(cmd);
            ddlPublisherName.DataValueField = "publisher_name";
            ddlPublisherName.DataBind();
            ddlPublisherName.Items.Insert(0, new ListItem("--Select--"));
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            if(CheckDuplicateBook())
            {
                Response.Write("<script>alert('Book Already Exists, Try other Book ID');</script>");
            }
            else
            {
                AddBook();
                BindGridData();
            }
        }

        private bool CheckDuplicateBook()
        {

            cmd = new SqlCommand("spgetBookBYID", dbcon.GetCon());
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.Clear();
            cmd.Parameters.AddWithValue("@book_id", txtBookID.Text);
            DataTable dt2 = new DataTable();
            dt2 = dbcon.Load_Data(cmd);
            if (dt2.Rows.Count >= 1)
            {
                return true;
            }
            else
            {
                return false;
            }


        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
          
            if(CheckDuplicateBook())
            {
                UpdateBook();
            }
            else
            {
                Response.Write("<script>alert('Invalid Book ID');</script>");
            }
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {

            if (CheckDuplicateBook())
            {
                DeleteBook();
            }
            else
            {
                Response.Write("<script>alert('Invalid Book ID');</script>");
            }
        }

        protected void btnGo_Click(object sender, EventArgs e)
        {
            SearchBooks();
        }
        private void AddBook()
        {
            string genres = "";
            foreach(int i in ListBoxGenre.GetSelectedIndices())
            {
                genres = genres + ListBoxGenre.Items[i] + ",";
            }
            genres = genres.Remove(genres.Length - 1);

            string filepath = "~/Books_img/ASP.NET.jpeg";
            string filename = Path.GetFileName(FileUpload1.PostedFile.FileName);
            FileUpload1.SaveAs(Server.MapPath("Books_img"+filename));
            filepath = "~/Books_img/" + filename;

            cmd =new SqlCommand("sp_Insert_Up_Del_BookInventory", dbcon.GetCon());
            cmd.CommandType = System.Data.CommandType.StoredProcedure;

            AddParameters();
            cmd.Parameters.AddWithValue("@StatementType", "Insert");
            cmd.Parameters.AddWithValue("@genre", genres);
            cmd.Parameters.AddWithValue("@book_img_link", filepath);

            if (dbcon.InsertUpdateData(cmd))
            {
                Response.Write("<script>alert('Book Added Successfully');</script>");
            }
            else
            {
                Response.Write("<script>alert('Record Not Inserted');</script>");
            }
            ClearControl();
            Autogenrate();
        }
        private void UpdateBook()
        {
            int A_stock = Convert.ToInt32(txtActualstock.Text.Trim());
            int c_stock= Convert.ToInt32(txtCurrentstock.Text.Trim());
            if(actual_stock==A_stock)
            {

            }
            else
            {
                if(A_stock < actual_stock)
                {
                    Response.Write("<script>alert('Actual stock value cannot be less than the');</script>");
                    return;
                }
                else
                {
                    current_stock = actual_stock - issued_books;
                    txtCurrentstock.Text = c_stock + "";
                }
            }

            string genres = "";
            foreach (int i in ListBoxGenre.GetSelectedIndices())
            {
                genres = genres + ListBoxGenre.Items[i] + ",";
            }
            genres = genres.Remove(genres.Length - 1);

            string F_path = "~/Books_img/ASP.NET.jpeg";
            string filename = Path.GetFileName(FileUpload1.PostedFile.FileName);

            if(filename=="" || filename==null)
            {
                F_path = filepath;
            }
            else
            {
                FileUpload1.SaveAs(Server.MapPath("Books_img" + filename));
                F_path = "~/Books_img/" + filename;
            }

            cmd = new SqlCommand("sp_Insert_Up_Del_BookInventory", dbcon.GetCon());
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            //AddParameters();
            cmd.Parameters.Clear();
            cmd.Parameters.AddWithValue("@StatementType", "Update");
            cmd.Parameters.AddWithValue("@book_id", txtBookID.Text);
            cmd.Parameters.AddWithValue("@book_name", txtBookName.Text);
            cmd.Parameters.AddWithValue("@author_name", ddlAuthorName.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@Publisher_name", ddlPublisherName.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@publish_date", txtPublishDate.Text);
            cmd.Parameters.AddWithValue("@language", ddlLanguage.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@edition", txtEdition.Text);
            cmd.Parameters.AddWithValue("@book_cost", txtbookcost.Text);
            cmd.Parameters.AddWithValue("@no_of_pages", txtpages.Text);
            cmd.Parameters.AddWithValue("@book_description", txtBookDesc.Text);
            cmd.Parameters.AddWithValue("@genre", genres);
            cmd.Parameters.AddWithValue("@actual_stock", A_stock.ToString());
            cmd.Parameters.AddWithValue("@current_stock", c_stock.ToString());
            cmd.Parameters.AddWithValue("@book_img_link", F_path);

            if (dbcon.InsertUpdateData(cmd))
            {
                Response.Write("<script>alert('Book Updated Successfully');</script>");
            }
            else
            {
                Response.Write("<script>alert('Record Not Updated');</script>");
            }
            ClearControl();
            Autogenrate();
            BindGridData();
        }
        private void DeleteBook()
        {
            cmd = new SqlCommand("sp_Insert_Up_Del_BookInventory", dbcon.GetCon());
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.Clear();
            cmd.Parameters.AddWithValue("@StatementType", "Delete");
            cmd.Parameters.AddWithValue("@book_id", txtBookID.Text.Trim());
            if (dbcon.InsertUpdateData(cmd))
            {
                Response.Write("<script>alert('Book Deleted Successfully');</script>");
            }
            else
            {
                Response.Write("<script>alert('Record Not  Deleted ');</script>");
            }
            ClearControl();
            Autogenrate();
            BindGridData();

        }
        public void Autogenrate()
        {
            {
                int r;
                dbcon.OpenCon();
                cmd = new SqlCommand("select MAX(book_id)as ID from book_master_tbl", dbcon.GetCon());
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    string d = dr[0].ToString();
                    if (d == "")
                    {
                        txtBookID.Text = "1";
                    }
                    else
                    {
                        r = Convert.ToInt32(dr[0].ToString());
                        r = r + 1;
                        txtBookID.Text = r.ToString();
                    }
                    //txtBookID.ReadOnly = true;
                    //txtID.BackColor = System.Drawing.Color.Red;
                }
                dbcon.CloseCon();
            }
        }
        public void ClearControl()
        {
            txtBookName.Text = txtActualstock.Text = txtbookcost.Text = txtBookDesc.Text = txtCurrentstock.Text = txtEdition.Text = txtbookcost.Text = txtpages.Text = txtBookDesc.Text = txtActualstock.Text = txtCurrentstock.Text;
            ddlAuthorName.SelectedIndex = -1;
            ddlPublisherName.SelectedIndex = -1;
            FileUpload1.PostedFile.InputStream.Dispose();
            ImgPhoto.ImageUrl = "../images/Books/images (1).jpeg";
        }
        public void AddParameters()
        {
            cmd.Parameters.Clear();
            cmd.Parameters.AddWithValue("@book_id", txtBookID.Text);
            cmd.Parameters.AddWithValue("@book_name", txtBookName.Text);
            cmd.Parameters.AddWithValue("@author_name", ddlAuthorName.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@Publisher_name", ddlPublisherName.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@publish_date", txtPublishDate.Text);
            cmd.Parameters.AddWithValue("@language", ddlLanguage.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@edition", txtEdition.Text);
            cmd.Parameters.AddWithValue("@book_cost", txtbookcost.Text);
            cmd.Parameters.AddWithValue("@no_of_pages", txtpages.Text);
            cmd.Parameters.AddWithValue("@book_description", txtBookDesc.Text);
            cmd.Parameters.AddWithValue("@actual_stock", txtActualstock.Text);
            cmd.Parameters.AddWithValue("@current_stock", txtActualstock.Text);
            
        }

        private void SearchBooks()
        {
            cmd = new SqlCommand("spgetBookBYID", dbcon.GetCon());
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.Clear();
            cmd.Parameters.AddWithValue("@book_id", txtBookID.Text);
            DataTable dt2 = new DataTable();
            dt2 = dbcon.Load_Data(cmd);
            if(dt2.Rows.Count>=1)
            {
                txtBookName.Text = dt2.Rows[0]["book_name"].ToString();
                txtPublishDate.Text = dt2.Rows[0]["publisher_date"].ToString();
                txtEdition.Text = dt2.Rows[0]["edition"].ToString();
                txtbookcost.Text = dt2.Rows[0]["book_cost"].ToString().Trim();
                txtpages.Text = dt2.Rows[0]["no_of_pages"].ToString().Trim();
                txtActualstock.Text = dt2.Rows[0]["actual_stock"].ToString().Trim();
                txtCurrentstock.Text = dt2.Rows[0]["current_stock"].ToString().Trim();
                txtBookDesc.Text = dt2.Rows[0]["book_description"].ToString();
                txtIssuedBook.Text = "" + (Convert.ToInt32(dt2.Rows[0]["actual_stock"].ToString())- Convert.ToInt32(dt2.Rows[0]["current_stock"].ToString()));
                ddlLanguage.SelectedValue = dt2.Rows[0]["language"].ToString().Trim();
                ddlPublisherName.SelectedValue = dt2.Rows[0]["publisher_name"].ToString().Trim();
                ddlAuthorName.SelectedValue = dt2.Rows[0]["author_name"].ToString().Trim();
                ListBoxGenre.ClearSelection();
                string[] genre = dt2.Rows[0]["genre"].ToString().Trim().Split(',');
                for(int i=0;i<genre.Length;i++)
                {
                    for(int j=0;j<ListBoxGenre.Items.Count;j++)
                    {
                        if(ListBoxGenre.Items[j].ToString()==genre[i])
                        {
                            ListBoxGenre.Items[j].Selected = true;
                        }
                    }
                }
                actual_stock=Convert.ToInt32(dt2.Rows[0]["actual_stock"].ToString().Trim());
                current_stock = Convert.ToInt32(dt2.Rows[0]["current_stock"].ToString().Trim());
                issued_books = actual_stock - current_stock;
                filepath = dt2.Rows[0]["book_img_link"].ToString();
                if(filepath!=""||filepath!=null)
                {
                    ImgPhoto.ImageUrl = filepath;
                }
            }
            else
            {
                Response.Write("<script>alert('Invalid Book ID');</script>");
                ClearControl();
            }
        }
        private void BindGridData()
        {
            cmd = new SqlCommand("sp_Insert_Up_Del_BookInventory", dbcon.GetCon());
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.Clear();
            cmd.Parameters.AddWithValue("@StatementType", "Select");
            GridView1.DataSource = dbcon.Load_Data(cmd);
            GridView1.DataBind();
        }

    }
}