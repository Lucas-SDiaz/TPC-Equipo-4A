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
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                List<Turno> lista = new List<Turno>();
                lista = turnoNegocio.listarTurnos();
                //Session.Add("listaTurnos", lista);
                DgvTurno.DataSource = lista;
                DgvTurno.DataBind();
            }
        }


        protected void ddlEstados_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void DgvTurno_RowDataBound(object sender, GridViewRowEventArgs e)
        {

        }
    }
}