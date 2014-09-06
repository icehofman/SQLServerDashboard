using SQLServerDashboard.Properties;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SQLServerDashboard
{
    public partial class Processes : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            sqlDataSource.ConnectionString = ConfigurationManager.ConnectionStrings[Request["c"]].ConnectionString;
            sqlDataSource.SelectCommand = Resources.ResourceManager.GetString("Processes");
        }
    }
}