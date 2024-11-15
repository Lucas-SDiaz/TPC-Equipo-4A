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
                Medico med = new Medico();
                med.Usuario = new Usuario();
                if (!IsPostBack)
                {
                    CargarEspecialidades();
                    MedicoNegocio negocioMed = new MedicoNegocio();
                    int id;
                    if (Request.QueryString["id_m"] != null && Request.QueryString["id_u"] != null)
                    {
                        id = int.Parse(Request.QueryString["id_m"]);
                        med = negocioMed.buscarMedicoID(id);
                        txtApellido.Text = med.Apellido;
                        txtNombre.Text = med.Nombre;
                        txtDNI.Text = med.DNI;
                        txtEmail.Text = med.Usuario.Email;
                        txtTelefono.Text = med.Telefono;
                        ddlEspecialidad.SelectedValue = med.Especialidad.Id_Especialidad.ToString();
                    }

                }
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
        protected void btnAceptar_Click(object sender, EventArgs e)
        {
            try
            {
                IngresarOModificarRegistro();
            }
            catch (Exception ex)
            {

                throw ex;
            }
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
            medico.Especialidad = new Especialidad();
            medico.Especialidad.Id_Especialidad = int.Parse(ddlEspecialidad.SelectedValue);
            if (Request.QueryString["id_m"] != null && Request.QueryString["id_u"] != null)
            {
                medico.Id_Medico = int.Parse(Request.QueryString["id_m"]);
                medico.Usuario.Id_Usuario = int.Parse(Request.QueryString["id_u"]);
                medico.Estado = true;
                if(negocio.EditarMedico(medico))                
                {
                    Session.Add("accionExitosa", "Registro modificado exitosamente!");
                    Response.Redirect("insertExitoso.aspx", false);
                }
            }
            else
            {
                if (negocio.IngresarMedico(medico)) //ME falta ver como recupero el id del registro recien ingresado para luego poder cargar horarios
                {
                    
                    Session.Add("accionExitosa", "Registro ingresado exitosamente!");
                    Session.Add("id_medico", negocio.TraerUltimoIDMedico());
                    Response.Redirect("insertExitoso.aspx", false);
                }
            }
        }

     
        private void CargarEspecialidades()
        {
            EspecialidadNegocio negocio = new EspecialidadNegocio();
            ddlEspecialidad.DataSource = negocio.listarConSP();
            ddlEspecialidad.DataTextField = "Descripcion";
            ddlEspecialidad.DataValueField = "Id_Especialidad";
            ddlEspecialidad.DataBind();
            ddlEspecialidad.Items.Insert(0, new ListItem("-- Seleccionar Especialidad --", "0"));
        }
    }

}