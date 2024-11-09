using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Dominio;
using Negocio;

namespace TPC_Equipo_4A
{
    public partial class ABMPadministrativo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnAgregarAdmin_Click(object sender, EventArgs e)
        {
            Response.Redirect("FormularioAdministartivos.aspx", false);
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {

        }

        protected void dgvAdministrativos_SelectedIndexChanged(object sender, EventArgs e)
        {
            //GridViewRow row = dgvAdministrativos.SelectedRow;
            //string id_usuario = row.Cells[0].Text;
            //string id_empleado = dgvAdministrativos.SelectedDataKey.Value.ToString();
            //Response.Redirect("FormularioAdministrativos.aspx?id_m=" + id_empleado + "&id_u=" + id_usuario, false);
        }

        protected void dgvAdministrativos_SelectedIndexChanged1(object sender, EventArgs e)
        {

        }

        protected void ddlFiltro_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void btnAgregarAdmin_Click1(object sender, EventArgs e)
        {

        }

        protected void btnBuscar_Click1(object sender, EventArgs e)
        {

        }
    }
}