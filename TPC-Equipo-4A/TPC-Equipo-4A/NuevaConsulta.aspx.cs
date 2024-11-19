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
    public partial class NuevaConsulta : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack && Session["Turno"] != null)
            {
                CargarDatosTurno();
            }
        }
        private void CargarDatosTurno()
        {
            Turno aux = new Turno();
            aux = (Turno)Session["Turno"];
            txtFecha.Text = aux.Fecha.ToString("dd-MM-yyyy");
            txtPaciente.Text = aux.Paciente.NombreCompleto.ToString();
            txtMedico.Text = aux.Medico.NombreCompleto.ToString();
        }

        protected void btnGuardarConsulta_Click(object sender, EventArgs e)
        {
            GuardarConsulta();
        }
        private void GuardarConsulta()
        {
            ConsultaNegocio negocio = new ConsultaNegocio();
            Consulta consulta = new Consulta();
            consulta.Turno = new Turno();
            consulta.Turno = (Turno)Session["Turno"];
            consulta.Comentarios = txtComentarios.Text;
            consulta.Diagnostico = txtDiagnostico.Text; 
            consulta.Tratamiento = txtTratamiento.Text;
            if (negocio.AgregarConsulta(consulta))
                Response.Redirect("Default.aspx", false);
        }
    }
}