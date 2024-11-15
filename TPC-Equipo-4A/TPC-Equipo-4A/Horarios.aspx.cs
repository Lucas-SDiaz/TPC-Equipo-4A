using Dominio;
using Negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Management;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TPC_Equipo_4A
{
    public partial class Horarios : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LlenarHorarios(ddlEntradaLunes);
                LlenarHorarios(ddlEntradaMartes);
                LlenarHorarios(ddlEntradaMiercoles);
                LlenarHorarios(ddlEntradaJueves);
                LlenarHorarios(ddlEntradaViernes);
                LlenarHorarios(ddlEntradaSabado);
                LlenarHorarios(ddlSalidaLunes);
                LlenarHorarios(ddlSalidaMartes);
                LlenarHorarios(ddlSalidaMiercoles);
                LlenarHorarios(ddlSalidaJueves);
                LlenarHorarios(ddlSalidaViernes);
                LlenarHorarios(ddlSalidaSabado);
            }
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            MedicoNegocio negocio = new MedicoNegocio();

            if (Session["id_medico"] != null)
            {

                ////ACA LE ESTOY PASANDO EL ID DE USUARIO PERO TIENE QUE IR EL ID DE MEDICO
                Medico medico = negocio.buscarMedicoID(int.Parse(Session["id_medico"].ToString()));

                medico.HorariosLaborables = new List<JornadaMedicos>();
                if (chkLunes.Checked)
                    medico.HorariosLaborables.Add(new JornadaMedicos(1, ddlEntradaLunes.SelectedValue, ddlSalidaLunes.SelectedValue));
                if (chkMartes.Checked)
                    medico.HorariosLaborables.Add(new JornadaMedicos(2, ddlEntradaMartes.SelectedValue, ddlSalidaMartes.SelectedValue));
                if (chkMiercoles.Checked)
                    medico.HorariosLaborables.Add(new JornadaMedicos(3, ddlEntradaMiercoles.SelectedValue, ddlSalidaMiercoles.SelectedValue));
                if (chkJueves.Checked)
                    medico.HorariosLaborables.Add(new JornadaMedicos(4, ddlEntradaJueves.SelectedValue, ddlSalidaJueves.SelectedValue));
                if (chkViernes.Checked)
                    medico.HorariosLaborables.Add(new JornadaMedicos(5, ddlEntradaViernes.SelectedValue, ddlSalidaViernes.SelectedValue));
                if (chkSabado.Checked)
                    medico.HorariosLaborables.Add(new JornadaMedicos(6, ddlEntradaSabado.SelectedValue, ddlSalidaSabado.SelectedValue));

                string id_medico = Session["id_medico"].ToString();
                medico.Id_Medico = int.Parse(id_medico);
                if (negocio.CargarHorariosMedico(medico))
                {
                    Session.Add("HorarioExitoso", "Carga de horarios exitosa!");
                    Response.Redirect("insertExitoso", false);
                }
            }


        }

        protected void chkLunes_CheckedChanged(object sender, EventArgs e)
        {
            ddlEntradaLunes.Enabled = chkLunes.Checked;
            ddlSalidaLunes.Enabled = chkLunes.Checked;
            ddlEntradaMartes.Enabled = chkMartes.Checked;
            ddlSalidaMartes.Enabled = chkMartes.Checked;
            ddlEntradaMiercoles.Enabled = chkMiercoles.Checked;
            ddlSalidaMiercoles.Enabled = chkMiercoles.Checked;
            ddlEntradaJueves.Enabled = chkJueves.Checked;
            ddlSalidaJueves.Enabled = chkJueves.Checked;
            ddlEntradaViernes.Enabled = chkViernes.Checked;
            ddlSalidaViernes.Enabled = chkViernes.Checked;
            ddlEntradaSabado.Enabled = chkSabado.Checked;
            ddlSalidaSabado.Enabled = chkSabado.Checked;
        }
        private void LlenarHorarios(DropDownList ddl)
        {
            DateTime horaInicial = DateTime.Today.AddHours(8); 
            DateTime horaFinal = DateTime.Today.AddHours(21);  

            while (horaInicial <= horaFinal)
            {
                ddl.Items.Add(new ListItem(horaInicial.ToString("HH:mm"), horaInicial.ToString("HH:mm")));
                horaInicial = horaInicial.AddMinutes(30); 
            }
        }
    }
}