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
    public partial class FormularioMedico : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            MedicoNegocio negocio = new MedicoNegocio();
            Medico med;
            if(!IsPostBack)
            {
                int id = int.Parse(Request.QueryString["id"]);
                med = negocio.buscarMedicoID(id);
                txtApellido.Text = med.NombreYApellido;
                txtNombre.Text = med.Legajo;
                txtDNI.Text = med.DNI;
                txtEmail.Text = med.Usuario.Email;
                txtTelefono.Text = med.Telefono;
            }
        }
        protected void btnAceptar_Click(object sender, EventArgs e)
        {

        }
    }
}