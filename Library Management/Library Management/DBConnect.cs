using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Web.UI.WebControls;

namespace Library_Management
{
    public class DBConnect
    {
        private SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["cn"].ConnectionString);
        public SqlConnection GetCon()
        {
            return con;
        }
        public void OpenCon()
        {
            if (con.State == ConnectionState.Closed)
                con.Open();
        }
        public void CloseCon()
        {
            if (con.State == ConnectionState.Open)
                con.Close();
        }
        public DataTable Load_Data(SqlCommand cmd)
        {
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            try
            {
                da.Fill(dt);
                return dt;
            }
            catch
            {
                throw;
            }
            finally
            {
                dt.Dispose();
                da.Dispose();
                CloseCon();
            }
        }

        public Boolean InsertUpdateData(SqlCommand cmd)
        {
            bool recordSaved;
           
            try
            {
                OpenCon();
                cmd.ExecuteNonQuery();
                recordSaved = true;
            }
            catch
            {
                recordSaved = false;
            }
            finally
            {
                CloseCon();
            }
            return recordSaved;
        }
    }
}