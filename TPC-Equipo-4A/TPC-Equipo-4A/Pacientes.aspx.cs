using Dominio;
using Negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
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
            Response.Redirect("FormularioPaciente.aspx");
        }

        protected void dgvPacientes_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int index = Convert.ToInt32(e.CommandArgument);
            GridViewRow row = dgvPacientes.Rows[index];
            string id_usuario = dgvPacientes.DataKeys[index]["Usuario.Id_Usuario"].ToString();
            string id_paciente = dgvPacientes.DataKeys[index].Value.ToString();

            if (e.CommandName == "Editar")
            {
                //Response.Redirect("FormularioPaciente.aspx?id_p=" + id_paciente + "&id_u=" + id_usuario, false);
                Response.Redirect("FormularioPaciente.aspx?id_p=" + id_paciente, false);
            }
            else if (e.CommandName == "Eliminar")
            {
                PacienteNegocio pacienteNegocio = new PacienteNegocio();
                pacienteNegocio.EliminarPaciente(int.Parse(id_usuario));

                Response.Redirect("Pacientes.aspx", false);
            }
        }

        protected void dgvPacientes2_SelectedIndexChanged(object sender, EventArgs e)
        {
            string id = dgvPacientes2.SelectedDataKey.Value.ToString();
            int id_p = int.Parse(id);
            PacienteNegocio negocio = new PacienteNegocio();
            Session.Add("Paciente", negocio.BuscarPorID(id_p));
            Response.Redirect("DetallePaciente.aspx", false);
        }

    }
}