using Dominio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TPC_Equipo_4A
{
    public partial class SystemAdminABM : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnVerUsuarios_Click(object sender, EventArgs e)
        {

        }

        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            Usuario usuario = new Usuario();
            usuario.Email = txtEmail.Text;
            usuario.Contraseña = txtPassword.Text;
            string contraseña = usuario.Contraseña;
            string email = usuario.Email;

            string patternContraseña = @"^(?=.*[a-zA-Z])(?=.*\d).+$";
            if (Regex.IsMatch(contraseña, patternContraseña))
            {
                lblMensaje.Visible = false;
            }
            else
            {
                lblMensaje.Visible = true;
                lblMensaje.Text = "La contraseña debe contener al menos una letra y un número.";
            }

            string patternEmail = @"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$";
            if (Regex.IsMatch(email, patternEmail))
            {
                lblMensajeEmail.Visible = false;
            }
            else
            {
                lblMensajeEmail.Visible = true;
                lblMensajeEmail.Text = "El correo electrónico debe ser válido (ejemplo@dominio.com).";
            }
        }
    }
}