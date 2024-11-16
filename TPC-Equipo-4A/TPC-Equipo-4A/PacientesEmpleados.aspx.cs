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
    public partial class PacientesEmpleados : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        { 
            PacienteNegocio pacienteNegocio = new PacienteNegocio();
            if ((Usuario)Session["Usuario"] != null)
                if (((Usuario)Session["Usuario"]).Perfil == Perfil.PersonalAdministrativo)
                {
                    dgvPacientes.DataSource = pacienteNegocio.listarConSP();
                    dgvPacientes.DataBind();
                }
        }

        protected void dgvPacientes_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int index = Convert.ToInt32(e.CommandArgument);
            GridViewRow row = dgvPacientes.Rows[index];
            string id_paciente = dgvPacientes.DataKeys[index].Value.ToString();

            if (e.CommandName == "Editar")
            {
                Response.Redirect("FormularioPaciente.aspx?id_p=" + id_paciente, false);
            }
            else if (e.CommandName == "NuevoTurno")
            {
                Response.Redirect("NuevoTurno.aspx?id_p=" + id_paciente, false);

            }
        }

        protected void btnAgregarPaciente_Click(object sender, EventArgs e)
        {
            Response.Redirect("FormularioPaciente.aspx");
        }

        protected void ddlFiltro_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}