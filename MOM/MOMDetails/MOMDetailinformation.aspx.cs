/*Authour Name :Anand Mandadi
 *Date         :28-04-2017
 *Descrition   : This Code is Used to Get and Insert all details of MOM Information.
 */
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;
using System.Text;
using System.Web.Script.Serialization;

namespace MOM.MOMDetails
{
    public partial class MOMDetailInformation : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                try
                {
                    lblName.Visible = false;
                    BindFunctionalMaster();

                }
                catch (Exception ex)
                {
                    this.LogError(ex);

                }

            }
        }


    

        protected void Button1_Click(object sender, EventArgs e)
        {
            //grdMOMDetails.Visible = false;
           
            string constr = ConfigurationManager.ConnectionStrings["constrMOM"].ConnectionString;
            try
            {
                SqlConnection con = new SqlConnection(constr);
                SqlCommand com = new SqlCommand("sp_InsertMomDetails", con);  //creating  SqlCommand  object
                com.CommandType = CommandType.StoredProcedure;  //here we declaring command type as stored Procedure
                com.Parameters.AddWithValue("@flag", "1");
                com.Parameters.AddWithValue("@UserCpassId", txtCPassId.Text.ToString());
                com.Parameters.AddWithValue("@UserfunctionalArea",ddlFunctionalArea.SelectedItem.Text);
                com.Parameters.AddWithValue("@UserApplicationName",ddlApplicatonName.SelectedItem.Text);
                com.Parameters.AddWithValue("@MOMStartDate", txtMOMStartDate.Text.ToString());
                com.Parameters.AddWithValue("@MOMEndDate", txtMOMEndDate.Text.ToString());
                com.Parameters.AddWithValue("@TypeofMOM", txtTypeOfMOM.Text.ToString());
                com.Parameters.AddWithValue("@MOMOrganiser", txtMOMOrganiser.Text.ToString());
                com.Parameters.AddWithValue("@MOMUserMominformation", txtUserinformation.Text.ToString());
                //@MOMUserMominformation
                con.Open();
                int k = com.ExecuteNonQuery();
                Label1.Visible = true;
                if (k != 0)
                {
                   // Label1.Text = "MOM Login Details Inserted Succesfully";

                    string message = "MOM Login Details Inserted Succesfully";
                    ScriptManager.RegisterStartupScript((sender as Control), this.GetType(), "Popup", "ShowPopup('" + message + "');", true);
                  //  Label1.ForeColor = System.Drawing.Color.CornflowerBlue;
                    MOMOverview1.Visible = false;
                    txtUserinformation.Text = "";
                    txtTypeOfMOM.Text = "";
                    txtMOMStartDate.Text = "";
                    txtMOMOrganiser.Text = "";
                    txtMOMEndDate.Text = "";
                    txtCPassId.Text = "";
                    txtUserinformation.Text = "";
                    lblName.Visible = true;
                    BindMOMUSerInformationDetails();//Calling this Method  to get loaded MOM Information  details against individual user.

                }

                con.Close();
            }
            catch (Exception ex)
            {
                this.LogError(ex);

            }

        }




        public string ConvertDataTableToJSON(DataTable dt)
        {
            JavaScriptSerializer jSonString = new JavaScriptSerializer();
            List<Dictionary<string, object>> rows = new List<Dictionary<string, object>>();
            Dictionary<string, object> row;
            foreach (DataRow dr in dt.Rows)
            {
                row = new Dictionary<string, object>();
                foreach (DataColumn col in dt.Columns)
                {
                    row.Add(col.ColumnName, dr[col]);
                }
                rows.Add(row);
            }
            return jSonString.Serialize(rows);
        }


        public void BindMOMUSerInformationDetails()
        {
            DataTable dtMOMDetails = new DataTable();
            string constr = ConfigurationManager.ConnectionStrings["constrMOM"].ConnectionString;
            try
            {
                using (SqlConnection con = new SqlConnection(constr))
                {
                    using (SqlCommand cmd = new SqlCommand("usp_FetchMomDetails"))
                    {
                        cmd.Connection = con;
                        cmd.CommandType = CommandType.StoredProcedure;
                        using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                        {

                            sda.Fill(dtMOMDetails);
                        }
                    }
                }

                if (dtMOMDetails.Rows.Count > 0)
                {
                  //  string jsonString = ConvertDataTableToJSON(dtMOMDetails);
                  //  grdMOMDetails.DataSource = ConvertDataTableToJSON(dtMOMDetails);
                    grdMOMDetails.DataSource = dtMOMDetails; ;
                    grdMOMDetails.DataBind();
                }

            }
            catch (Exception ex)
            {
                this.LogError(ex);

            }

        }

        public void BindFunctionalMaster()
        {
            DataTable dt = new DataTable();
            string constr = ConfigurationManager.ConnectionStrings["constrMOM"].ConnectionString;

            try
            {

                using (SqlConnection con = new SqlConnection(constr))
                {
                    using (SqlCommand cmd = new SqlCommand("usp_FetchMomFunctionalMaster"))
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

                    ddlFunctionalArea.DataSource = dt;
                    ddlFunctionalArea.DataTextField = "FunctionArea";
                    ddlFunctionalArea.DataBind();
                    ddlFunctionalArea.Items.Insert(0, new ListItem("--Select FunctionArea--", "0"));
                }

            }
            catch (System.Data.SqlClient.SqlException ex)
            {
                string msg = "Fetch Error:";
                msg += ex.Message;
                throw new Exception(msg);
            }


        }

        protected void ddlFunctionalArea_SelectedIndexChanged(object sender, EventArgs e)
        {
            DataTable dtApplicationName = new DataTable();

            string constr = ConfigurationManager.ConnectionStrings["constrMOM"].ConnectionString;
            try
            {

                using (SqlConnection con = new SqlConnection(constr))
                {
                    using (SqlCommand cmd = new SqlCommand("usp_FetchApplicationMaster"))
                    {
                        cmd.Connection = con;
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@functionalArea", ddlFunctionalArea.SelectedItem.Text);
                        using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                        {

                            sda.Fill(dtApplicationName);
                        }
                    }
                }

                if (dtApplicationName.Rows.Count > 0)
                {

                    ddlApplicatonName.DataSource = dtApplicationName;
                    ddlApplicatonName.DataTextField = "UserApplicationName";
                 //   ddlFunctionalArea.DataValueField = "ColumnName";
                    ddlApplicatonName.DataBind();
                  //  ddlApplicatonName.Items.Insert(0, new ListItem("--Select App--", "0"));
                }
            }
            catch (System.Data.SqlClient.SqlException ex)
            {
                string msg = "Fetch Error:";
                msg += ex.Message;
                throw new Exception(msg);
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


    }
}