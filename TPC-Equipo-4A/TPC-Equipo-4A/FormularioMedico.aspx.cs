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
            Medico med;
            if (!IsPostBack && Request.QueryString["id_m"] != null)
            {
                MedicoNegocio negocio = new MedicoNegocio();
                int id = int.Parse(Request.QueryString["id_m"]);
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
            if(Request.QueryString["id_m"] == null)
            {

            }
            else{
                editarRegistro();
            }
        }
        private void editarRegistro()
        {
            MedicoNegocio negocio = new MedicoNegocio();
            Medico medico = new Medico();
            medico.Id_Medico = int.Parse(Request.QueryString["id_m"]);
            medico.Usuario = new Usuario();
            medico.Usuario.Id_Usuario = int.Parse(Request.QueryString["id_u"]);
            medico.NombreYApellido = txtApellido.Text;
            medico.Legajo = txtNombre.Text;
            medico.DNI = txtDNI.Text;
            medico.Usuario.Email = txtEmail.Text;
            medico.Telefono = txtTelefono.Text;
            negocio.editarMedico(medico);

        }
    }

}