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
            if (!IsPostBack)
            {
                CargarPacientes();
                CargarEspecialidades();
                CargarMedicos();
                if (Request.QueryString["id_p"] != null){
                    PacienteNegocio negocio = new PacienteNegocio();
                    Paciente aux = new Paciente();
                    int id = int.Parse(Request.QueryString["id_p"]);
                    aux = negocio.BuscarPorID(id);
                    ddlPaciente.SelectedValue = aux.Id_Paciente.ToString();
                }

                ddlHorario.Items.Insert(0, new ListItem("-- Seleccionar Horario --", "0"));
            }
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

        private void CargarMedicos()
        {
            try
            {
                MedicoNegocio negocio = new MedicoNegocio();
                List<Medico> medicos = negocio.listarMedicosConSP();
                ddlMedico.Items.Insert(0, new ListItem("-- Seleccionar Medico --", "0"));

                Session["listaMedicos"] = medicos;
            }
            catch (Exception)
            {
                Console.WriteLine("Error cargando lista de medicos");
            }
        }

        private void CargarPacientes()
        {
            try
            {
                PacienteNegocio negocio = new PacienteNegocio();
                List<Paciente> pacientes = negocio.listarConSP();

                ddlPaciente.DataSource = pacientes;
                ddlPaciente.DataTextField = "NombreCompleto";
                ddlPaciente.DataValueField = "Id_Paciente";
                ddlPaciente.DataBind();
                ddlPaciente.Items.Insert(0, new ListItem("-- Seleccionar Paciente --", "0"));
            }
            catch (Exception)
            {
                Console.WriteLine("Error cargando lista de pacientes");
            }
        }

        private void CargarEspecialidades()
        {
            try
            {
                EspecialidadNegocio negocio = new EspecialidadNegocio();
                List<Especialidad> especialidades = negocio.listarConSP();

                ddlEspecialidad.DataSource = especialidades;
                ddlEspecialidad.DataTextField = "Descripcion";
                ddlEspecialidad.DataValueField = "Id_Especialidad";
                ddlEspecialidad.DataBind();
                ddlEspecialidad.Items.Insert(0, new ListItem("-- Seleccionar Especialidad --", "0"));
            }
            catch (Exception)
            {
                Console.WriteLine("Error cargando lista de especialidades");
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
                turno.Paciente.Id_Paciente = int.Parse(ddlPaciente.SelectedValue.ToString());
                turno.Medico.Id_Medico = int.Parse(ddlMedico.SelectedValue.ToString());
                turno.Fecha = DateTime.Parse(txtFechaTurno.Text.ToString());
                turno.Hora = new TimeSpan(Convert.ToInt16(ddlHorario.SelectedValue),0,0);

                if (Request.QueryString["id"] != null)
                {
                    negocio.reprogramarTurno(turno);
                    Response.Redirect("Turnos.aspx");
                }
                else { 
                    negocio.agregarTurno(turno);
                    EnviarMailConfirmacion(turno);

                    string script = "alert('Registro agregado exitosamente.'); window.location.href='Default.aspx';";
                    ClientScript.RegisterStartupScript(this.GetType(), "Hola mundo", script, true);
                }
            }
            catch (Exception)
            {
                Console.WriteLine("Error agregando nuevo turno");
            }
        }

        protected void ddlEspecialidad_SelectedIndexChanged(object sender, EventArgs e)
        {
            int id = int.Parse(ddlEspecialidad.SelectedItem.Value);
            ddlMedico.DataTextField = "NombreCompleto";
            ddlMedico.DataValueField = "ID_Medico";

            var medicosFiltrados = ((List<Medico>)Session["listaMedicos"]).FindAll(x => x.Especialidad.Id_Especialidad == id);
            if (medicosFiltrados.Any())
            {
                ddlMedico.DataSource = ((List<Medico>)Session["listaMedicos"]).FindAll(x => x.Especialidad.Id_Especialidad == id);
                CargarJornadasSegunMedico(medicosFiltrados.FirstOrDefault().Id_Medico);
            }
            else
            {
                LimpiarHorarios();
                ddlMedico.Items.Clear();
                ddlMedico.Items.Insert(0, new ListItem("-- Seleccionar Medico --", "0"));
            }

            ddlMedico.DataBind();
        }

        protected void txtFechaTurno_TextChanged(object sender, EventArgs e)
        { 
            var fecha = Convert.ToDateTime(txtFechaTurno.Text);
            if (fecha < DateTime.Today)
            {
                txtFechaTurno.Text = null;
                return;
            }

            int idMedico = int.Parse(ddlMedico.SelectedItem.Value);
            CargarJornadasSegunMedico(idMedico);
        }

        protected void ddlMedico_SelectedIndexChanged(object sender, EventArgs e)
        {
            int id = int.Parse(ddlMedico.SelectedItem.Value);

            CargarJornadasSegunMedico(id);
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

        private void EnviarMailConfirmacion(Turno turno)
        {
            var pacienteNegocio = new PacienteNegocio();
            var medicoNegocio = new MedicoNegocio();

            var medico = medicoNegocio.buscarMedicoID((int)turno.Medico.Id_Medico);
            var paciente = pacienteNegocio.BuscarPorID((int)turno.Paciente.Id_Paciente);

            if (string.IsNullOrEmpty(paciente.Usuario.Email))
            {
                return;
            }

            string nombreApellido = paciente.Apellido + ", " + paciente.Nombre;
            string emaildestino = paciente.Usuario.Email;
            string doctor = medico.Apellido + ", " + medico.Nombre;
            DateTime dia = turno.Fecha;
            TimeSpan hora = turno.Hora;

            EmailService emailService = new EmailService();
            emailService.armarMail(emaildestino, nombreApellido, doctor, dia, hora);
            try
            {
                emailService.enviarEmail();
            }
            catch (Exception ex)
            {
                Session.Add("error", ex);
            }
        }
    }
}