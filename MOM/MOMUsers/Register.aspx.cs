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

namespace MOM
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (!this.IsPostBack)
            //{
            //}
        }

        protected void CreateUser_Click(object sender, EventArgs e)
        {
           

            string constr = ConfigurationManager.ConnectionStrings["constrMOM"].ConnectionString;
            try
            {
                SqlConnection con = new SqlConnection(constr);
                SqlCommand com = new SqlCommand("sp_InsertMomUserLoginDetails",con);  //creating  SqlCommand  object
                com.CommandType = CommandType.StoredProcedure;  //here we declaring command type as stored Procedure
                com.Parameters.AddWithValue("@flag","1");
                com.Parameters.AddWithValue("@UserCpassId", txtCPassId.Text.ToString());        
                com.Parameters.AddWithValue("@UserName", txtUserName.Text.ToString());     
                com.Parameters.AddWithValue("@UserPassword", txtPassword.Text.ToString());     
                com.Parameters.AddWithValue("@UserfullName", txtUserFullName.Text.ToString());
                com.Parameters.AddWithValue("@UserEmail", txtEmail.Text.ToString());
                con.Open();
                int k = com.ExecuteNonQuery(); 
                Label1.Visible = true;
                if (k != 0)
                {
                    Label1.Text = "MOM Login Details Inserted Succesfully";
                    Label1.ForeColor = System.Drawing.Color.CornflowerBlue;
                    txtUserFullName.Text = "";
                    txtUserName.Text = "";
                    txtEmail.Text = "";
                }

                con.Close();
            }

            catch (System.Data.SqlClient.SqlException ex)
            {
                string msg = "Fetch Error:";
                msg += ex.Message;
                throw new Exception(msg);
            }
        }
    }
}