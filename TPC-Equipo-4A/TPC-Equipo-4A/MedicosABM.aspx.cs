using Dominio;
using Negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TPC_Equipo_4A
{
    public partial class MedicosABM : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            MedicoNegocio medicoNegocio = new MedicoNegocio();

            if (((Dominio.Usuario)Session["Usuario"]).Perfil == Dominio.Perfil.Administrador)
            {
                Session.Add("listaMedicos", medicoNegocio.listarParaPAdministrativoConSP());
                dgvMedicos.DataSource = Session["listaMedicos"];
                dgvMedicos.DataBind();
            }
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            List<Medico> lista = (List<Medico>)Session["listaMedicos"];
            dgvMedicos.DataSource = lista.FindAll(x => x.Apellido.ToUpper().Contains(txtBuscar.Text.ToUpper()) || x.Nombre.ToUpper().Contains(txtBuscar.Text.ToUpper()));
            dgvMedicos.DataBind();
        }

        protected void ddlFiltro_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void btnAgregarMedico_Click(object sender, EventArgs e)
        {
            Response.Redirect("FormularioMedico.aspx", false);
        }

        protected void dgvMedicos_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow row = dgvMedicos.SelectedRow;
            string id_usuario = row.Cells[0].Text;
            string id_medico = dgvMedicos.SelectedDataKey.Value.ToString();
            Response.Redirect("FormularioMedico.aspx?id_m=" + id_medico + "&id_u=" + id_usuario, false);
        }
    }
}
