using Negocio;
using Dominio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

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
                    dgvTurnos.DataSource = lista;
                    dgvTurnos.DataBind();
                }
            }
        }

        protected void ddlEstados_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void dgvTurnos_RowDataBound(object sender, GridViewRowEventArgs e)
        {

        }

        protected void dgvTurnosMedico_RowDataBound(object sender, GridViewRowEventArgs e)
        {

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
    }
}