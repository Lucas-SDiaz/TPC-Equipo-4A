using Negocio;
using Dominio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace TPC_Equipo_4A
{
    public partial class Turnos : System.Web.UI.Page
    {
        TurnoNegocio turnoNegocio = new TurnoNegocio();
        MedicoNegocio medNegocio = new MedicoNegocio();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack && Session["Usuario"] != null && Session["ID_U"] != null)
            {
                if (((Dominio.Usuario)Session["Usuario"]).Perfil == Dominio.Perfil.Medico)
                {
                    List<Turno> lista = new List<Turno>();
                    int id_u = (int)Session["ID_U"];
                    lista = turnoNegocio.listarTurnosMedico(id_u);
                    dgvTurnosMedico.DataSource = lista;
                    dgvTurnosMedico.DataBind();
                }
                else
                {
                    List<Turno> lista = new List<Turno>();
                    lista = turnoNegocio.listarTurnos();
                    GvTurnos.DataSource = lista;
                    GvTurnos.DataBind();
                }
            }
        }


        protected void btnSeleccionar_Click(object sender, EventArgs e)
        {
            string fechaSeleccionada = Request.Form["datePicker"];
            if (DateTime.TryParse(fechaSeleccionada, out DateTime fecha))
            {
                List<Turno> lista = new List<Turno>();
                List<Turno> listaFiltradaFecha = new List<Turno>();
                int id_u = (int)Session["ID_U"];
                lista = turnoNegocio.listarTurnosMedico(id_u);
                foreach (var turno in lista)
                {
                    if (turno.Fecha.Date == fecha)
                        listaFiltradaFecha.Add(turno);
                }
                dgvTurnosMedico.DataSource = listaFiltradaFecha;
                dgvTurnosMedico.DataBind();
            }
            else
            {
                Response.Write("Fecha inválida");
            }

        }

        protected void dgvTurnosMedico_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            Turno aux = new Turno();
            int index = Convert.ToInt32(e.CommandArgument);
            GridViewRow row = dgvTurnosMedico.Rows[index];
            string id_turno = dgvTurnosMedico.DataKeys[index].Value.ToString();
            aux = turnoNegocio.listarTurnoPorID(int.Parse(id_turno));
            Session.Add("Turno", aux);
            if (e.CommandName == "Consulta")
            {
                Response.Redirect("NuevaConsulta.aspx", false);
            }

        }

        protected void GvTurnos_RowCommand1(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Reprogramar" || e.CommandName == "Cancelar")
            {

                int index = Convert.ToInt32(e.CommandArgument);
                int idTurno = Convert.ToInt32(GvTurnos.DataKeys[index].Value);


                if (e.CommandName == "Reprogramar")
                {
                    Response.Redirect("ReprogramarTurno.aspx?id=" + idTurno, false);
                }
                else if (e.CommandName == "Cancelar")
                {
                    turnoNegocio.cancelarTurno(idTurno);
                    Response.Redirect("Turnos.aspx");
                }
            }
        }
        protected void GvTurnos_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            // Verificamos si es una fila de datos
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                // Buscar el Label en la columna de "Estado"
                Label lblEstado = (Label)e.Row.FindControl("lblEstado");
                if (lblEstado != null)
                {
                    // Obtener el valor original (número) desde el DataItem
                    int estado = Convert.ToInt32(DataBinder.Eval(e.Row.DataItem, "Estado"));

                    // Traducir el número al texto correspondiente
                    switch (estado)
                    {
                        case 1:
                            lblEstado.Text = "Pendiente";
                            break;
                        case 2:
                            lblEstado.Text = "Cancelado";
                            break;
                        case 3:
                            lblEstado.Text = "Reprogramado";
                            break;
                        case 4:
                            lblEstado.Text = "Asistió";
                            break;
                        case 5:
                            lblEstado.Text = "No asistió";
                            break;
                        default:
                            lblEstado.Text = "Desconocido";
                            break;
                    }
                }
            }
        }
        protected void ddlEstados_SelectedIndexChanged(object sender, EventArgs e)
        {
          
        }

        protected void dgvTurnosMedico_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            // Verificamos si es una fila de datos
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                // Buscar el Label en la columna de "Estado"
                Label lblEstado = (Label)e.Row.FindControl("lblEstado");
                if (lblEstado != null)
                {
                    // Obtener el valor original (número) desde el DataItem
                    int estado = Convert.ToInt32(DataBinder.Eval(e.Row.DataItem, "Estado"));

                    // Traducir el número al texto correspondiente
                    switch (estado)
                    {
                        case 1:
                            lblEstado.Text = "Pendiente";
                            break;
                        case 2:
                            lblEstado.Text = "Cancelado";
                            break;
                        case 3:
                            lblEstado.Text = "Reprogramado";
                            break;
                        case 4:
                            lblEstado.Text = "Asistió";
                            break;
                        case 5:
                            lblEstado.Text = "No asistió";
                            break;
                        default:
                            lblEstado.Text = "Desconocido";
                            break;
                    }
                }
            }
        }
    }
}