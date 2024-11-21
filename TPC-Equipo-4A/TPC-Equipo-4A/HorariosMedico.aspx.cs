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
    public partial class HorariosMedico : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                List<JornadaMedicos> jornadas = new List<JornadaMedicos>();
                MedicoNegocio negocio = new MedicoNegocio();
                if (Request.QueryString["id_m"] != null)
                    jornadas = negocio.ListarJornadaMedico(int.Parse(Request.QueryString["id_m"]));

                lblNombreMedico.Text = negocio.buscarMedicoID(int.Parse(Request.QueryString["id_m"])).NombreCompleto;
                lblMail.Text = negocio.buscarMedicoID(int.Parse(Request.QueryString["id_m"])).Usuario.Email;
                lblTelefono.Text = negocio.buscarMedicoID(int.Parse(Request.QueryString["id_m"])).Telefono;
                
                lblHorarios.Text = CargarDiasHorarios(jornadas);
            }
        }

        protected void btnVolver_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx", false);
        }

        private string CargarDiasHorarios(List<JornadaMedicos> jornadas)
        {
            string textoJornadas = "";

            foreach (var jornada in jornadas)
            {
                string dia = "";
                switch (jornada.DiaSemana)
                {
                    case 1:
                        dia = "Lunes";
                        break;
                    case 2:
                        dia = "Martes";
                        break;
                    case 3:
                        dia = "Miercoles";
                        break;
                    case 4:
                        dia = "Jueves";
                        break;
                    case 5:
                        dia = "Viernes";
                        break;
                    case 6:
                        dia = "Sábado";
                        break;
                    default:
                        dia = "";
                        break;
                }
                textoJornadas += $"Día: {dia} Desde: {jornada.HoraInicio}, Hasta: {jornada.HoraFin} <br/>";
            }
            if(textoJornadas=="")
                return textoJornadas = "Este médico no posee horarios registrados";
            else
                return textoJornadas;
        }
    }
}