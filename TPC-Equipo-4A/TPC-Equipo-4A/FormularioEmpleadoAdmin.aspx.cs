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
            }
            else
            {
                if (Request.QueryString["id_u"] != null)
                {
                    //EDITAR
                    EditarEmpleado(Request.QueryString["id_u"]);
                }
                else
                {
                    //INGRSAR
                    IngresarEmpleado();
                }
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
        private void IngresarEmpleado()
        {

        }

        protected void btnAceptar_Click(object sender, EventArgs e)
        {

        }
    }
}