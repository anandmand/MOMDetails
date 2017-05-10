/*
Authour  Name :ANAND MANDADI
DATE :3-APRIL-2017
DESCRIPTON :MOM Admin to  check all details related Users.

*/

using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;


namespace MOM.MOMUsers
{
    public partial class Mom_Admin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                MOMOverview.Visible = false;
                lblName.Visible = false;
                ddlCPassId.Items.Insert(0, new ListItem("--Select CPassId--", "0"));
                ddlApplicatonName.Items.Insert(0, new ListItem("--Select Application--", "0"));
                //ddlApplicatonName
                //   BindAllUserCPassIds();
                //  BindAdminNames();

            }
        }

        //public void BindAdminNames()
        //{

        //    try
        //    {
        //        //ddlUserName.Items.Insert(0, new ListItem("--Select Admin--", "0"));
        //        //ddlUserName.Items.Insert(1, new ListItem("ALL", "1"));

        //    }
        //    catch (System.Data.SqlClient.SqlException ex)
        //    {
        //        string msg = "Fetch Error:";
        //        msg += ex.Message;
        //        throw new Exception(msg);
        //    }


        //}


        public void BindAllUserCPassIds()
        {
            DataTable dt = new DataTable();
            string constr = ConfigurationManager.ConnectionStrings["constrMOM"].ConnectionString;

            try
            {

                using (SqlConnection con = new SqlConnection(constr))
                {
                    using (SqlCommand cmd = new SqlCommand("sp_FetchMomUserLoginName"))
                    {
                        cmd.Connection = con;
                        cmd.CommandType = CommandType.StoredProcedure;                       
                        using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                        {

                            sda.Fill(dt);
                        }
                    }
                }

                if (dt.Rows.Count > 0)
                {
                  
                    ddlCPassId.DataSource = dt;
                    ddlCPassId.DataTextField = "UserCpassId";
                    ddlCPassId.DataBind();
                    ddlCPassId.Items.Insert(0, new ListItem("--Select CPassId--", "0"));
                    ddlCPassId.Items.Insert(1, new ListItem("ALL", "1"));
                    //  txtUserName.Text = dt.Rows[0]["UserfullName"].ToString();
                }

            }
            catch (System.Data.SqlClient.SqlException ex)
            {
                string msg = "Fetch Error:";
                msg += ex.Message;
                throw new Exception(msg);
            }


        }

        public void BindMOMUserLoginUserName()
        {
            DataTable dt = new DataTable();
            string constr = ConfigurationManager.ConnectionStrings["constrMOM"].ConnectionString;
            try
            {
                using (SqlConnection con = new SqlConnection(constr))
                {
                    using (SqlCommand cmd = new SqlCommand("sp_FetchMOMUserFullName"))
                    {
                        cmd.Connection = con;
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@CPassId", ddlCPassId.SelectedItem.Text);
                        using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                        {

                            sda.Fill(dt);
                        }
                    }
                }

                if (dt.Rows.Count > 0)
                {
                   // txtUserName.Text = dt.Rows[0]["UserfullName"].ToString();                
                }
            }
            catch (System.Data.SqlClient.SqlException ex)
            {

                string msg = "Fetch Error:";
                msg += ex.Message;
                throw new Exception(msg);
            }


        }

        protected void ddlCPassId_SelectedIndexChanged(object sender, EventArgs e)
        {
            
            try
            {
                if(ddlAdmin.SelectedValue == "1")
                {
                    BindAllMOMApplications();
                }

                //BindMOMUserLoginUserName();//TO  Bind MOMUSerFullName.

                //using (SqlConnection con = new SqlConnection(constr))
                //{
                //    using (SqlCommand cmd = new SqlCommand("sp_FetchAllMOMUserDetails"))
                //    {
                //        cmd.Connection = con;
                //        cmd.CommandType = CommandType.StoredProcedure;
                //        cmd.Parameters.AddWithValue("@CPassId", ddlCPassId.SelectedItem.Text);
                //        using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                //        {

                //            sda.Fill(dtMOMUserInformation);
                //        }
                //    }
                //}

                //if (dtMOMUserInformation.Rows.Count > 0)
                //{
                //    lblName.Visible = true;
                //    grdMOMUserDetails.DataSource = dtMOMUserInformation;
                //    grdMOMUserDetails.DataBind();

                //}

             




            }
            catch (Exception ex)
            {

                this.LogError(ex);
            }
        }

        public void BindAllMOMApplications()
        {
            DataTable dtMOMUserInformation = new DataTable();
            string constr = ConfigurationManager.ConnectionStrings["constrMOM"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("usp_FetchAllMomApplicationNames"))
                {
                    cmd.Connection = con;
                    cmd.CommandType = CommandType.StoredProcedure;
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {

                        sda.Fill(dtMOMUserInformation);
                    }
                }
            }

            if (dtMOMUserInformation.Rows.Count > 0)
            {
                ddlApplicatonName.DataSource = dtMOMUserInformation;
                ddlApplicatonName.DataTextField = "AppName";
                ddlApplicatonName.DataBind();
                ddlApplicatonName.Items.Insert(0, new ListItem("--Select Application--", "0"));

            }
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

    
       public void BindMOMAdminName()
        {

            DataTable dtMOMUserInformation = new DataTable();
            string constr = ConfigurationManager.ConnectionStrings["constrMOM"].ConnectionString;
            try
            {               
                using (SqlConnection con = new SqlConnection(constr))
                {
                    using (SqlCommand cmd = new SqlCommand("sp_FetchMoMAdminName"))
                    {
                        cmd.Connection = con;
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@UserName", ddlAdmin.SelectedItem.Text);
                        using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                        {

                            sda.Fill(dtMOMUserInformation);
                        }
                    }
                }

                if (dtMOMUserInformation.Rows.Count > 0)
                {

                    ddlCPassId.DataSource = dtMOMUserInformation;
                    ddlCPassId.DataTextField = "UserfullName";
                    ddlCPassId.DataBind();
                    
                }
            }
            catch (Exception ex)
            {

                this.LogError(ex);
            }


        }

        protected void ddlAdmin_SelectedIndexChanged(object sender, EventArgs e)
        {

            try
            {


                if (ddlAdmin.SelectedItem.Text == "Admin")
                {
                    BindAllUserCPassIds();


                }
                else
                {
                    BindMOMAdminName();

                }
            }
            catch (Exception ex)
            {

                this.LogError(ex);
            }

        }
    }
}