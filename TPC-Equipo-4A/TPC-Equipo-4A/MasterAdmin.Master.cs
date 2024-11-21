using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TPC_Equipo_4A
{
    public partial class MasterAdmin : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
        }

        protected void btnCerrarSession_Click(object sender, EventArgs e)
        {
            Session.Remove("Usuario");
            if (Session["Usuario"]==null)
                Response.Redirect("Default.aspx");
        }
    }
}