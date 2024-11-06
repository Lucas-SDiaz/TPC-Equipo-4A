using Dominio;
using Negocio;
using System;
using System.Collections;
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
            try
            {
                Medico med;
                if (!IsPostBack && Request.QueryString["id_m"] != null && Request.QueryString["id_u"] != null)
                {
                    MedicoNegocio negocioMed = new MedicoNegocio();
                    int id = int.Parse(Request.QueryString["id_m"]);
                    med = negocioMed.buscarMedicoID(id);
                    txtApellido.Text = med.Apellido;
                    txtNombre.Text = med.Nombre;
                    txtDNI.Text = med.DNI;
                    txtEmail.Text = med.Usuario.Email;
                    txtTelefono.Text = med.Telefono;
                }
                EspecialidadNegocio negocio = new EspecialidadNegocio();
                ddlEspecialidad.DataSource = negocio.listarConSP();
                ddlEspecialidad.DataTextField = "Descripcion";
                ddlEspecialidad.DataValueField = "Id_Especialidad";
                ddlEspecialidad.DataBind();
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
        protected void btnAceptar_Click(object sender, EventArgs e)
        {
            IngresarOModificarRegistro();
        }
        private void IngresarOModificarRegistro()
        {
            MedicoNegocio negocio = new MedicoNegocio();
            Medico medico = new Medico();
            medico.Usuario = new Usuario();
            medico.Apellido = txtApellido.Text;
            medico.Nombre = txtNombre.Text;
            medico.DNI = txtDNI.Text;
            medico.Usuario.Email = txtEmail.Text;
            medico.Telefono = txtTelefono.Text;
            if (Request.QueryString["id_m"] != null && Request.QueryString["id_u"] != null)
            {
                medico.Id_Medico = int.Parse(Request.QueryString["id_m"]);
                medico.Usuario.Id_Usuario = int.Parse(Request.QueryString["id_u"]);
                negocio.EditarMedico(medico);
            }
            else
            {
                negocio.IngresarMedico(medico);
            }
            Response.Redirect("MedicosABM.aspx", false);
        }

        protected void ddlEspecialidad_SelectedIndexChanged(object sender, EventArgs e)
        {
            switch (ddlEspecialidad.SelectedValue)
            {
             
                case "Ordenar por especialidad": 
                    
                    break;
                case "Ordenar alfabéticamente": 
                    break;
                default: // Opción predeterminada, sin filtro específico
                    //query = "SELECT * FROM Medicos";
                    break;
            }
        }
    }

}