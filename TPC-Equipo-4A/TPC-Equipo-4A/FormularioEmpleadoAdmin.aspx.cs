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
    public partial class FormularioEmpleadoAdmin : System.Web.UI.Page
    {
        EmpleadoAdministrativoNegocio negocio = new EmpleadoAdministrativoNegocio();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Usuario"] == null)
            {
                Session.Add("error", "Usted no tiene permiso para acceder");
            }else if (!IsPostBack)
            {
                if (Request.QueryString["id_u"] != null)
                {
                    //EDITAR
                    EditarEmpleado(Request.QueryString["id_u"]);
                }
            }
        }
        protected void btnAceptar_Click(object sender, EventArgs e)
        {
            if (Request.QueryString["id_u"] != null)
            {
                
            }
            else
            {
                //INGRSAR
                PersonalAdministrativo empleado = new PersonalAdministrativo();
                empleado.Usuario = new Usuario();
                empleado.Nombre = txtNombre.Text;
                empleado.Apellido = txtApellido.Text;
                empleado.Usuario.Email = txtEmail.Text;
                empleado.DNI = txtDNI.Text;
                IngresarEmpleado(empleado);
            }
        }
        private void EditarEmpleado(string id)
        { 
            PersonalAdministrativo empleado = new PersonalAdministrativo();
            empleado = negocio.buscarEmpleadoID(int.Parse(id));
            txtApellido.Text = empleado.Apellido;
            txtNombre.Text = empleado.Nombre;
            txtEmail.Text = empleado.Usuario.Email;
            txtDNI.Text = empleado.DNI;
        }
        private void IngresarEmpleado(PersonalAdministrativo empleado)
        {
            
            if(negocio.IngresarEmpleado(empleado))
            {
                Session.Add("accionExitosa", "Registro ingresado exitosamente!");
                Response.Redirect("insertExitoso.aspx", false);
            }
            else
            {
                Session.Add("error", "Error al ingresar registro");
                Response.Redirect("Error.apx", false);
            }
        }

    }
}