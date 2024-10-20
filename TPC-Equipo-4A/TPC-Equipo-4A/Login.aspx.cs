using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TPC_Equipo_4A
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string email = txtEmail.Text;
            string password = txtPassword.Text;

            // Lógica de autenticación (ejemplo simple)
            //if (IsValidUser(email, password)) // Implementa esta lógica según tu necesidad
            //{
            //    // Redirige al usuario al dashboard o página principal
               Response.Redirect("Default.aspx");
            //}
            //else
            //{
            //    lblError.Text = "Email o contraseña incorrectos.";
            //    lblError.Visible = true;
            //}
            
        }
    }
}