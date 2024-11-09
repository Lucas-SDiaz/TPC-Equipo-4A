﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Dominio;
namespace TPC_Equipo_4A
{
    public partial class DetallePaciente : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Paciente"] != null)
            {
                cargarDatosPaciente();
            }
            else
            {
                Response.Redirect("Error.aspx", false);
            }
        }
        private void cargarDatosPaciente()
        {
            Paciente aux = (Paciente)Session["Paciente"];
            lblDireccion.Text = aux.Domicilio.Calle;
            lblEmail.Text = aux.Usuario.Email;
            lblFechaNacimiento.Text = aux.FechaNaciemiento();
            lblFechaRegistro.Text = aux.FechaReg();
            lblNombreApellido.Text = aux.Apellido + ", " + aux.Nombre;
            lblTelefono.Text = aux.Telefono.ToString();                                      
        }

    }
}