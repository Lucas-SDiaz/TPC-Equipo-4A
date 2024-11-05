using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using Dominio;
using Negocio;

namespace TPC_Equipo_4A
{
    public partial class NuevoTurno : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnAceptar_Click(object sender, EventArgs e)
        {
            Turno nuevo = new Turno();
            TurnoNegocio negocio = new TurnoNegocio();

            try
            {
                nuevo.Paciente.Id_Paciente = int.Parse(ddlPaciente.SelectedValue.ToString());
                nuevo.Especialidad.Id_Especialidad = int.Parse(ddlEspecialidad.SelectedValue.ToString());
                nuevo.Medico.Id_Medico = int.Parse(ddlMedico.SelectedValue.ToString());
                nuevo.Fecha = DateTime.Parse(txtFechaTurno.Text.ToString());
                nuevo.Hora = float.Parse(txtHorario.Text.ToString());
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}