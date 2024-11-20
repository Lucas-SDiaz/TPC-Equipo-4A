﻿using Dominio;
using Negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TPC_Equipo_4A
{
    public partial class PacientesEmpleados : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                PacienteNegocio pacienteNegocio = new PacienteNegocio();
                Session["listarPacientes"] = pacienteNegocio.listarConSP();

                if ((Usuario)Session["Usuario"] != null && ((Usuario)Session["Usuario"]).Perfil == Perfil.PersonalAdministrativo)
                {
                    dgvPacientes.DataSource = Session["listarPacientes"];
                    dgvPacientes.DataBind();
                }
            }
            // PacienteNegocio pacienteNegocio = new PacienteNegocio();
            // Session.Add("listarPacientes", pacienteNegocio.listarConSP());
            // if ((Usuario)Session["Usuario"] != null)
            //     if (((Usuario)Session["Usuario"]).Perfil == Perfil.PersonalAdministrativo)
            //     {
            //         dgvPacientes.DataSource = Session["listarPacientes"];
            //         dgvPacientes.DataBind();
            //     }
        }

        protected void dgvPacientes_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int index = Convert.ToInt32(e.CommandArgument);
            GridViewRow row = dgvPacientes.Rows[index];
            string id_paciente = dgvPacientes.DataKeys[index].Value.ToString();

            if (e.CommandName == "Editar")
            {
                Response.Redirect("FormularioPaciente.aspx?id_p=" + id_paciente, false);
            }
            else if (e.CommandName == "NuevoTurno")
            {
                Response.Redirect("NuevoTurno.aspx?id_p=" + id_paciente, false);

            }
        }

        protected void btnAgregarPaciente_Click(object sender, EventArgs e)
        {
            Response.Redirect("FormularioPaciente.aspx");
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            List<Paciente> lista = (List<Paciente>)Session["listarPacientes"];
            List<Paciente> listaFiltrada = lista.FindAll(x => x.Nombre.ToUpper().Contains(txtBuscar.Text.ToUpper()));
            dgvPacientes.DataSource = listaFiltrada;
            dgvPacientes.DataBind();

        }

        protected void btnMostrarTodos_Click(object sender, EventArgs e)
        {
            dgvPacientes.DataSource = Session["listarPacientes"];
            dgvPacientes.DataBind();
        }

        protected void ddlFiltro_SelectedIndexChanged(object sender, EventArgs e)
        {
            List<Paciente> listaPacientes = (List<Paciente>)Session["listarPacientes"];

            // Verificar la opción seleccionada y ordenar la lista de pacientes en consecuencia
            if (ddlFiltro.SelectedValue == "Alfabetico")
            {
                // Ordenar alfabéticamente por Nombre
                listaPacientes = listaPacientes.OrderBy(p => p.Nombre).ThenBy(p => p.Apellido).ToList();
            }
            else if (ddlFiltro.SelectedValue == "FechaNacimiento")
            {
                // Ordenar por Fecha de Nacimiento (ascendente)
                listaPacientes = listaPacientes.OrderBy(p => p.FechaNacimiento).ToList();
            }
            else
            {
                // Opción "Predeterminado" - puedes definir el orden predeterminado aquí si es necesario
                listaPacientes = (List<Paciente>)Session["listarPacientes"];
            }

            // Actualizar la grilla con la lista ordenada
            dgvPacientes.DataSource = listaPacientes;
            dgvPacientes.DataBind();
        }

    }
}