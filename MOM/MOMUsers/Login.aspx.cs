using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.Security;

namespace MOM
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                try
                {
                    // BindFunctionalMaster();

                }
                catch (Exception ex)
                {
                    this.LogError(ex);

                }

            }
        }



        protected void LogIn(object sender, EventArgs e)
        {
            DataTable dtMOMUserLogin = new DataTable();

            string constr = ConfigurationManager.ConnectionStrings["constrMOM"].ConnectionString;
            try
            {

                using (SqlConnection con = new SqlConnection(constr))
                {
                    using (SqlCommand cmd = new SqlCommand("sp_FetchMOMUserCpassLogin"))
                    {
                        cmd.Connection = con;
                        cmd.CommandType = CommandType.StoredProcedure;
                        using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                        {

                            sda.Fill(dtMOMUserLogin);
                        }
                    }
                }

                if (dtMOMUserLogin.Rows.Count > 0)
                {

                    if (dtMOMUserLogin.Rows[0]["UserName"].ToString() == txtUserName.Text)
                    {

                        Response.Redirect("~/MOMUsers/Mom_Admin.aspx");
                    }
                    else
                    {
                        Response.Redirect("~/MOMDetails/MOMDetailinformation.aspx");

                    }               
                }

            }

            catch (System.Data.SqlClient.SqlException ex)
            {
                string msg = "Fetch Error:";
                msg += ex.Message;
                throw new Exception(msg);
            }
        }

        public void AccessAdmin()
        {
            Roles.CreateRole("Admin");
            Roles.AddUserToRole("anandkalaskar", "Admin");
           
          
        }



        /// <summary>
        /// Log error Details in this Method
        /// </summary>
        /// <param name="ex"></param>
        private void LogError(Exception ex)
        {
            string message = string.Format("Time: {0}", DateTime.Now.ToString("dd/MM/yyyy hh:mm:ss tt"));
            message += Environment.NewLine;
            message += "-----------------------------------------------------------";
            message += Environment.NewLine;
            message += string.Format("Message: {0}", ex.Message);
            message += Environment.NewLine;
            message += string.Format("StackTrace: {0}", ex.StackTrace);
            message += Environment.NewLine;
            message += string.Format("Source: {0}", ex.Source);
            message += Environment.NewLine;
            message += string.Format("TargetSite: {0}", ex.TargetSite.ToString());
            message += Environment.NewLine;
            message += "-----------------------------------------------------------";
            message += Environment.NewLine;
            string path = Server.MapPath("~/ErrorLog/ErrorLog.txt");
            using (StreamWriter writer = new StreamWriter(path, true))
            {
                writer.WriteLine(message);
                writer.Close();
            }
        }
    }
}
