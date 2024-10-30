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
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLoguear_Click(object sender, EventArgs e)
        {
            Usuario usuario = new Usuario();

            //   INGRESO COMO PERSONAL ADMINISTRATIVO
            usuario.Email = "admin@clinica.com.ar";
            usuario.Contraseña = "123";

            //usuario.Email = txtEmail.Text;
            //usuario.Contraseña = txtPassword.Text;
            LoginUsuario(usuario);   //ACA ESTA YA ARMADO LA VALIDACION DE INGRESO DE USUARIOS. LO COMENTO PARA INGRESAR MEDIANTE UN REDIRECT


            // INGRESO PROVISORIO
                        //Response.Redirect("Default.aspx", false);
        }


        private void LoginUsuario(Usuario usuario)
        {
            UsuarioNegocio negocio = new UsuarioNegocio();
            try
            {
                if (negocio.Loguear(usuario))
                {
                    Session.Add("Usuario", usuario);
                    if (Session["Usuario"] != null && ((Dominio.Usuario)Session["Usuario"]).Perfil != Dominio.Perfil.Administrador) 
                    {
                        Response.Redirect("Default.aspx", false);
                    }
                    else if(Session["Usuario"] != null && ((Dominio.Usuario)Session["Usuario"]).Perfil == Dominio.Perfil.Administrador)
                    {
                        Response.Redirect("Dashboard.aspx", false);
                        //Response.Redirect("Default.aspx", false);  ACA LO TENDRIA QUE REDIRECCIONAR A LA MASTER DE ADMINISTRADOR DE SISTEMA
                    }
                }
                else
                {
                    Session.Add("error", "Usuario o Contraseña Incorrectos");
                    Response.Redirect("Error.aspx", false);
                }
            }
            catch (Exception ex)
            {

                Session.Add("error", ex.ToString());
                Response.Redirect("Error.aspx", false);
            }
        }
    }
}