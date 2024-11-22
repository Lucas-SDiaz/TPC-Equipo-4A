using Negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TPC_Equipo_4A
{
    public partial class AdminSistemaAMB : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                AdminSystemNegocio negocio = new AdminSystemNegocio();
                dgvAdminSistema.DataSource = negocio.ListarAdmins();
                dgvAdminSistema.DataBind();
            }
        }

        protected void dgvAdministrativos_RowCommand(object sender, GridViewCommandEventArgs e)
        {

        }

        protected void btnAgregarAdmin_Click(object sender, EventArgs e)
        {
            Response.Redirect("SystemAdminABM.aspx", false);
        }
    }
}