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
                dgvTurnos.DataSource = lista;
                dgvTurnos.DataBind();
            }
        }


        protected void ddlEstados_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void dgvTurnos_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            {

                if (e.CommandName == "Reprogramar" || e.CommandName == "Cancelar")
                {

                    int index = Convert.ToInt32(e.CommandArgument);
                    int idTurno = Convert.ToInt32(dgvTurnos.DataKeys[index].Value);


                    if (e.CommandName == "Reprogramar")
                    {
                        Response.Redirect("NuevoTurno.aspx?id=" + idTurno, false);
                    }
                    else if (e.CommandName == "Cancelar")
                    {
                        turnoNegocio.cancelarTurno(idTurno);
                    }
                }
            }
        }
    }
}