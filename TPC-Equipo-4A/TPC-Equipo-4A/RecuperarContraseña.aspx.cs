using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Dominio;
using Negocio;


namespace TPC_Equipo_4A
{
    public partial class RecuperarContraseña : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnRecuperar_Click(object sender, EventArgs e)
        {
            string email = txtEmail.Text;
            UsuarioNegocio negocio = new UsuarioNegocio();
            EmailService emailService = new EmailService();

            try
            {
                Usuario usuario = negocio.BuscarPorEmail(email);

                if (usuario != null)
                {
                    emailService.armarMailRecuperarContraseña(
                        emailDestino: usuario.Email,
                        contraseña: usuario.Contraseña 
                    );
                    emailService.enviarEmail();

                    lblMensaje.Text = "Se ha enviado un correo con tu contraseña.";
                }
                else
                {
                    lblMensaje.Text = "El correo ingresado no está asociado a ninguna cuenta.";
                }
            }
            catch (Exception ex)
            {
                lblMensaje.Text = "Ocurrió un error: " + ex.Message;
            }
        }
    }
}