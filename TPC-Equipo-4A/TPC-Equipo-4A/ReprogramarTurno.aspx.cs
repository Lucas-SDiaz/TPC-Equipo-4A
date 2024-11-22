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
	public partial class ReprogramarTurno : System.Web.UI.Page
	{

		protected void Page_Load(object sender, EventArgs e)
		{
            if (!IsPostBack)
            {

                if (Request.QueryString["id"] != null)
                {
                    TurnoNegocio turnoNegocio = new TurnoNegocio();
                    Turno turno = new Turno();
                    int id = int.Parse(Request.QueryString["id"]);
                    turno = turnoNegocio.listarTurnoPorID(id);
                    PacienteNegocio negocio = new PacienteNegocio();
                    Paciente aux = new Paciente();
                    aux = negocio.BuscarPorID(turno.Paciente.Id_Paciente);
                    txtIdPac.Text= aux.Id_Paciente.ToString();
                    txtPaciente.Text = aux.NombreCompleto.ToString();

                    MedicoNegocio medicoNegocio = new MedicoNegocio();
                    Medico medico = new Medico();
                    medico = medicoNegocio.buscarMedicoID(turno.Medico.Id_Medico);

                    txtIDmed.Text = turno.Medico.Id_Medico.ToString();
                    txtMedico.Text = medico.Apellido.ToString();
                        int idm = turno.Medico.Id_Medico;

                    CargarJornadasSegunMedico(idm);

                }

                }
                ddlHorario.Items.Insert(0, new ListItem("-- Seleccionar Horario --", "0"));
            }

        private void CargarHorarios(int idMedico)
        {
            try
            {
                MedicoNegocio negocio = new MedicoNegocio();
                Medico medico = negocio.listarHorariosDeMedicosConSP(idMedico, txtFechaTurno.Text);

                for (double i = medico.HorariosLaborables.FirstOrDefault().HoraInicio.TotalHours;
                        i < medico.HorariosLaborables.FirstOrDefault().HoraFin.TotalHours;
                        i++)
                {
                    if (!medico.TurnosAsignados.Any(x => x.Hora.TotalHours == i))
                    {
                        ListItem aux = new ListItem(i.ToString() + ":00hs", i.ToString());
                        ddlHorario.Items.Add(aux);
                    }
                }
            }
            catch (Exception)
            {
                Console.WriteLine("Error cargando lista de horarios de medicos");
            }
        }
        protected void btnAceptar_Click(object sender, EventArgs e)
        {
            Turno turno = new Turno();
            turno.Medico = new Medico();
            turno.Paciente = new Paciente();
            TurnoNegocio negocio = new TurnoNegocio();

            try
            {
                turno.ID_Turno = int.Parse(Request.QueryString["id"]);
                turno.Paciente.Id_Paciente = int.Parse(txtIdPac.Text.ToString());
                turno.Medico.Id_Medico = int.Parse(txtIDmed.Text.ToString());
                turno.Fecha = DateTime.Parse(txtFechaTurno.Text.ToString());
                turno.Hora = new TimeSpan(Convert.ToInt16(ddlHorario.SelectedValue), 0, 0);

                if (Request.QueryString["id"] != null)
                {
                    negocio.reprogramarTurno(turno);
                    Response.Redirect("Turnos.aspx");
                }
            }

            catch (Exception)
            {
                Console.WriteLine("Error agregando nuevo turno");
            }
        }

    

        protected void txtFechaTurno_TextChanged(object sender, EventArgs e)
        {
            var fecha = Convert.ToDateTime(txtFechaTurno.Text);
            if (fecha < DateTime.Today)
            {
                txtFechaTurno.Text = null;
                return;
            }

            int idMedico = int.Parse(txtIDmed.Text);
            CargarJornadasSegunMedico(idMedico);
        }

        private void CargarJornadasSegunMedico(int idMedico)
        {
            LimpiarHorarios();

            if (!string.IsNullOrWhiteSpace(txtFechaTurno.Text) && idMedico > 0)
            {
                CargarHorarios(idMedico);
            }
        }

        private void LimpiarHorarios()
        {
            ddlHorario.Items.Clear();
            ddlHorario.Items.Insert(0, new ListItem("-- Seleccionar Horario --", "0"));
        }

    }
}