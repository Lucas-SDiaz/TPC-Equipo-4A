using System;
using System.Collections.Generic;
using System.Diagnostics;
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
            if (!IsPostBack)
            {
                int idPaciente;
                if (Request.QueryString["id_p"] != null)
                {
                    idPaciente = int.Parse(Request.QueryString["id_p"]);
                    CargarDatosPaciente(idPaciente);
                }
            }
        }
        private void CargarDatosPaciente(int idPaciente)
        {
            Paciente paciente = new Paciente();
            PacienteNegocio negocio = new PacienteNegocio();
            paciente = negocio.BuscarParaModificar(idPaciente);
            Session.Add("id_u", paciente.Usuario.Id_Usuario);

            if (paciente != null)
            {
                txtNombre.Text = paciente.Nombre;
                txtApellido.Text = paciente.Apellido;
                txtDNI.Text = paciente.DNI;
                txtFNac.Text = paciente.FechaNacimiento.ToString("yyyy-MM-dd");
                txtTelefono.Text = paciente.Telefono;
                  if (paciente.Usuario != null)
                 {
                    txtEmail.Text = paciente.Usuario.Email;
                    txtContraseña.Text = paciente.Usuario.Contraseña;
                 }
                    if (paciente.Domicilio != null)
                  {
                    txtCalle.Text = paciente.Domicilio.Calle;
                    txtNumero.Text = paciente.Domicilio.Numero.ToString();
                    txtPiso.Text = paciente.Domicilio.Piso;
                    txtDepto.Text = paciente.Domicilio.Depto;
                    txtCiudad.Text = paciente.Domicilio.Ciudad;
                    txtProvincia.Text = paciente.Domicilio.Provincia;
                    txtCodigoPostal.Text = paciente.Domicilio.CodigoPostal;
                  }
            }
        }
        protected void txtEmailRep_TextChanged(object sender, EventArgs e)
        {

        }


        protected void btnEnviar_Click(object sender, EventArgs e)
        {
            try
            {
                Page.Validate();
                if (!Page.IsValid)
                    return;

                IngresaroModificarPaciente();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

       protected void IngresaroModificarPaciente()
        {
            Paciente nuevoPaciente = new Paciente();
            PacienteNegocio nuevo = new PacienteNegocio();
            nuevoPaciente.Usuario = new Usuario();
            nuevoPaciente.Domicilio = new Domicilio();

            nuevoPaciente.Usuario.Email = txtEmail.Text;
            nuevoPaciente.Usuario.Contraseña = txtConfirmContraseña.Text;
            nuevoPaciente.Usuario.Perfil = Perfil.Paciente;
            //--------------------------------------------------------
            nuevoPaciente.Nombre = txtNombre.Text;
            nuevoPaciente.Apellido = txtApellido.Text;
            nuevoPaciente.Telefono = txtTelefono.Text;
            nuevoPaciente.DNI = txtDNI.Text;
            //--------------------------------------------------------
            nuevoPaciente.FechaNacimiento = DateTime.Parse(txtFNac.Text);
            //--------------------------------------------------------
            nuevoPaciente.Domicilio.Calle = txtCalle.Text;
            nuevoPaciente.Domicilio.Numero = int.Parse(txtNumero.Text);
            nuevoPaciente.Domicilio.Piso = txtPiso.Text;
            nuevoPaciente.Domicilio.Depto = txtDepto.Text;
            nuevoPaciente.Domicilio.Ciudad = txtCiudad.Text;
            nuevoPaciente.Domicilio.Provincia = txtProvincia.Text;
            nuevoPaciente.Domicilio.CodigoPostal = txtCodigoPostal.Text;
            //--------------------------------------------------------
            
            if (Request.QueryString["id_p"] != null)
            { 
                nuevoPaciente.Id_Paciente = int.Parse(Request.QueryString["id_p"]);
                string id_usuario = Session["id_u"].ToString();
                nuevoPaciente.Usuario.Id_Usuario = int.Parse(id_usuario);
                nuevoPaciente.Estado = true;

                if (nuevo.Editar(nuevoPaciente))
                {
                    Session.Add("accionExitosa", "Registro modificado exitosamente!");
                    Response.Redirect("PacientesEmpleados.aspx", false);
                }
                
            }
            else
            {
                nuevo.Agregar(nuevoPaciente);
                Response.Redirect("PacientesEmpleados.aspx", false);
            }
        }

        protected void btnEnviar_Click2(object sender, EventArgs e)
        {

        }
    }
}