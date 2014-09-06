using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SQLServerDashboard
{
    public partial class Default : System.Web.UI.Page
    {
        protected string ConnectionString
        {
            get
            {
                return Request["c"] ?? ConfigurationManager.ConnectionStrings[0].Name;
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            ConnectionStrings.DataSource = ConfigurationManager.ConnectionStrings;
            ConnectionStrings.DataBind();
        }
    }
}