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
            if (!IsPostBack)
            {
                PacienteNegocio pacienteNegocio = new PacienteNegocio();
                Session["listarPacientes"] = pacienteNegocio.listarConSP();

                if ((Usuario)Session["Usuario"] != null && ((Usuario)Session["Usuario"]).Perfil == Perfil.PersonalAdministrativo)
                {
                    dgvPacientes.DataSource = Session["listarPacientes"];
                    dgvPacientes.DataBind();
                }else if(((Usuario)Session["Usuario"]).Perfil == Perfil.Medico)
                {
                    int id_medico = (int)Session["ID_M"];
                    dgvPacientesMedicos.DataSource = pacienteNegocio.listarConSP(id_medico);
                    dgvPacientesMedicos.DataBind();
                }
            }
            // PacienteNegocio pacienteNegocio = new PacienteNegocio();
            // Session.Add("listarPacientes", pacienteNegocio.listarConSP());
            // if ((Usuario)Session["Usuario"] != null)
            //     if (((Usuario)Session["Usuario"]).Perfil == Perfil.PersonalAdministrativo)
            //     {
            //         dgvPacientes.DataSource = Session["listarPacientes"];
            //         dgvPacientes.DataBind();
            //     }
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

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            List<Paciente> lista = (List<Paciente>)Session["listarPacientes"];
            List<Paciente> listaFiltrada = lista.FindAll(x => x.Nombre.ToUpper().Contains(txtBuscar.Text.ToUpper()));
            dgvPacientes.DataSource = listaFiltrada;
            dgvPacientes.DataBind();

        }

        protected void btnMostrarTodos_Click(object sender, EventArgs e)
        {
            dgvPacientes.DataSource = Session["listarPacientes"];
            dgvPacientes.DataBind();
        }

        protected void ddlFiltro_SelectedIndexChanged(object sender, EventArgs e)
        {
            List<Paciente> listaPacientes = (List<Paciente>)Session["listarPacientes"];

            if (ddlFiltro.SelectedValue == "Alfabetico")
            {
                listaPacientes = listaPacientes.OrderBy(p => p.Nombre).ThenBy(p => p.Apellido).ToList();
            }
            else if (ddlFiltro.SelectedValue == "FechaNacimiento")
            {
                listaPacientes = listaPacientes.OrderBy(p => p.FechaNacimiento).ToList();
            }
            else
            {
                listaPacientes = (List<Paciente>)Session["listarPacientes"];
            }

            dgvPacientes.DataSource = listaPacientes;
            dgvPacientes.DataBind();
        }

        protected void dgvPacientesMedicos_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int index = Convert.ToInt32(e.CommandArgument);
            GridViewRow row = dgvPacientesMedicos.Rows[index];
            string id_paciente = dgvPacientesMedicos.DataKeys[index].Value.ToString();
            ConsultaNegocio negocio = new ConsultaNegocio();
            HistoriaClinica histClinica = new HistoriaClinica();
            histClinica = negocio.ListarConsultas(int.Parse(id_paciente));
            histClinica.Id_Paciente = int.Parse(id_paciente);
            Session.Add("historiaClinica", histClinica);
            Response.Redirect("DetalleConsultas.aspx", false);
        }
    }
}