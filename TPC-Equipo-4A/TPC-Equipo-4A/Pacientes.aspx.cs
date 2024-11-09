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
    public partial class Pacientes : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            PacienteNegocio pacienteNegocio = new PacienteNegocio();
            if((Usuario)Session["Usuario"] != null)
                if(((Usuario)Session["Usuario"]).Perfil == Perfil.PersonalAdministrativo)
                {
                    dgvPacientes.DataSource = pacienteNegocio.listarConSP();
                    dgvPacientes.DataBind();
                }
                else if(((Usuario)Session["Usuario"]).Perfil == Perfil.Administrador)
                {
                    dgvPacientes2.DataSource = pacienteNegocio.listarConSP();
                    dgvPacientes2.DataBind();
                }
        }

        protected void ddlFiltro_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void btnAgregarPaciente_Click(object sender, EventArgs e)
        {
            Response.Redirect("AgregarPaciente.aspx");
        }

        protected void dgvPacientes_RowCommand(object sender, GridViewCommandEventArgs e)
        {

        }

        protected void dgvPacientes2_SelectedIndexChanged(object sender, EventArgs e)
        {
            string id = dgvPacientes2.SelectedDataKey.Value.ToString();
            PacienteNegocio negocio = new PacienteNegocio();
            Session.Add("Paciente", negocio.BuscarPorID(id));
            Response.Redirect("DetallePaciente.aspx", false);
        }

    }
}