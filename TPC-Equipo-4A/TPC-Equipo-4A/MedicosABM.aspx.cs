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
        MedicoNegocio medicoNegocio = new MedicoNegocio();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (((Dominio.Usuario)Session["Usuario"]).Perfil == Dominio.Perfil.Administrador)
                {
                    Session.Add("listaMedicos", medicoNegocio.listarParaPAdministrativoConSP(true));
                    dgvMedicos.DataSource = Session["listaMedicos"];
                    dgvMedicos.DataBind();
                }
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
        protected void dgvMedicos_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int index = Convert.ToInt32(e.CommandArgument);
            GridViewRow row = dgvMedicos.Rows[index];
            string id_usuario = row.Cells[0].Text;
            string id_medico = dgvMedicos.DataKeys[index].Value.ToString();
            if (e.CommandName == "Editar")
            {
                Response.Redirect("FormularioMedico.aspx?id_m=" + id_medico + "&id_u=" + id_usuario, false);
            }
            else if(e.CommandName == "Eliminar")
            {
                medicoNegocio.EliminarMedico(int.Parse(id_usuario));
                Response.Redirect("MedicosABM.aspx", false);
            }
        }

        protected void VerRegistrosEliminados_Click(object sender, EventArgs e)
        {
            Response.Redirect("RegistrosEliminados.aspx", false);
        }
    }
}
