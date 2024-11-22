using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Dominio;

namespace TPC_Equipo_4A
{
    public partial class Dashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Usuario"] == null)
            {
                
                Session.Add("error", "Usted no tiene permiso para acceder");
                Response.Redirect("Error.aspx", false);
            }
        }

        protected void btnVerUsuarios_Click(object sender, EventArgs e)
        {

        }
    }
}