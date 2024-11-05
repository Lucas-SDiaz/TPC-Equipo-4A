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
    public partial class AgregarPaciente : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void txtEmailRep_TextChanged(object sender, EventArgs e)
        {

        }

        protected void btnEnviar_Click(object sender, EventArgs e)
        {
            Paciente nuevoPaciente = new Paciente();
            PacienteNegocio nuevo = new PacienteNegocio();

            nuevoPaciente.Usuario = new Usuario();
            nuevoPaciente.Usuario.Email = txtEmail.Text;
            nuevoPaciente.Usuario.Contraseña = txtConfirmPassword.Text;
            nuevoPaciente.Usuario.Perfil = Perfil.Paciente;
            //--------------------------------------------------------
            //string nombre = txtNombre.Text;
            //string Apellido = txtApellido.Text;
            //nuevoPaciente.NombreYApellido = nombre + " " + Apellido;
            nuevoPaciente.Nombre = txtNombre.Text;
            nuevoPaciente.Apellido = txtApellido.Text;
            nuevoPaciente.Telefono = txtTelefono.Text;
            nuevoPaciente.DNI = txtDNI.Text;
            //--------------------------------------------------------
            nuevoPaciente.FechaNacimiento = DateTime.Parse(txtFNac.Text);
            //--------------------------------------------------------
            nuevoPaciente.Domicilio = new Domicilio();
            nuevoPaciente.Domicilio.Calle = txtCalle.Text;
            nuevoPaciente.Domicilio.Numero = int.Parse(txtNumero.Text);
            nuevoPaciente.Domicilio.Piso = txtPiso.Text;
            nuevoPaciente.Domicilio.Depto = txtDepto.Text;
            nuevoPaciente.Domicilio.Ciudad = txtCiudad.Text;
            nuevoPaciente.Domicilio.Provincia = txtProvincia.Text;
            nuevoPaciente.Domicilio.CodigoPostal = txtCodigoPostal.Text;
            //--------------------------------------------------------
            nuevo.Agregar(nuevoPaciente);
            Response.Redirect("Dashboard.aspx", false);
        }
    }
}