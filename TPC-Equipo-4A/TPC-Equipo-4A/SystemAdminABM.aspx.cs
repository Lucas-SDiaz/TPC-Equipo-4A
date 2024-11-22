using Dominio;
using Negocio;
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
        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            Usuario usuario = new Usuario();
            usuario.Email = txtEmail.Text;
            usuario.Contraseña = txtPassword.Text;
            string contraseña = usuario.Contraseña;
            string email = usuario.Email;

            if(ValidacionTxt(contraseña, email))
            {
                Usuario aux = new Usuario();
                aux.Email = email;
                aux.Contraseña = contraseña;
                AdminSystemNegocio negocio = new AdminSystemNegocio();
                if (negocio.IngresarAdminSistema(aux))
                {
                    Session.Add("accionExitosa", "Admin ingresado correctamente!");
                    Response.Redirect("insertExitoso.aspx", false);
                }
                else
                {
                    Session.Add("error", "Error al ingresar registro");
                    Response.Redirect("Error.aspx", false);
                }
            }

        }
        private bool ValidacionTxt(string contraseña, string email)
        {
            string patternContraseña = @"^(?=.*[a-zA-Z])(?=.*\d).+$";
            string patternEmail = @"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$";
            if (Regex.IsMatch(contraseña, patternContraseña) && Regex.IsMatch(email, patternEmail))
            {
                lblMensaje.Visible = false;
                lblMensajeEmail.Visible = false;
                return true;
            }
            else
            {
                lblMensaje.Visible = true;
                lblMensaje.Text = "La contraseña debe contener al menos una letra y un número.";
                lblMensajeEmail.Visible = true;
                lblMensajeEmail.Text = "El correo electrónico debe ser válido (ejemplo@dominio.com).";
                return false;
            }
        }

        protected void btnVerUsuarios_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminSistemaAMB.aspx", false);
        }
    }
}