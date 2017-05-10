using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;

namespace MOM
{
    public class Global : System.Web.HttpApplication
    {
        protected void Application_Start(object sender, EventArgs e)
        {
        }


        protected void Application_Error(object sender, EventArgs e)
        {
            // Code that runs when an unhandled error occurs  
            //Exception Ex = Server.GetLastError();
            //Server.ClearError();
            //Server.Transfer("Error.aspx");
        }  
    }
}