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
            Usuario nuevoUsuario = new Usuario();
            nuevoUsuario.Email = txtEmail.Text;
            nuevoUsuario.Contraseña = txtConfirmPassword.Text;
            nuevoUsuario.Perfil = Perfil.Paciente;

            UsuarioNegocio usuarioNegocio = new UsuarioNegocio();
            int idUsuarioGenerado = usuarioNegocio.Guardar(nuevoUsuario);

            //--------------------------------------------------------
            Persona nuevaPersona = new Persona();
            nuevaPersona.Id_Persona = idUsuarioGenerado;
            string nombre = txtNombre.Text;
            string Apellido = txtApellido.Text;
            nuevaPersona.NombreYApellido = nombre + " " + Apellido;
            nuevaPersona.Telefono = txtTelefono.Text;
            nuevaPersona.DNI = txtDNI.Text;

            Paciente nuevoPaciente = new Paciente();
            nuevoPaciente.FechaNacimiento = DateTime.Parse(txtFNac.Text);

            Domicilio nuevoDomicilio = new Domicilio();
            nuevoDomicilio.Calle = txtCalle.Text;
            nuevoDomicilio.Numero = int.Parse(txtNumero.Text);
            nuevoDomicilio.Piso = txtPiso.Text;
            nuevoDomicilio.Depto = txtDepto.Text;
            nuevoDomicilio.Ciudad = txtCiudad.Text;
            nuevoDomicilio.Provincia = txtProvincia.Text;
            nuevoDomicilio.CodigoPostal = txtCodigoPostal.Text;

        }
    }
}