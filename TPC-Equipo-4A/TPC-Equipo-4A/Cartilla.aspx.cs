using Dominio;
using Negocio;
using System;
using System.Collections.Generic;
using System.Drawing.Imaging;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TPC_Equipo_4A
{
    public partial class Cartilla : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            mostrarDgvSegunPerfil();
        }

        protected void ddlFiltro_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            List<Medico> lista = (List<Medico>)Session["listaMedicos"];
                    
            dgvMedicos.DataSource = lista.FindAll(x => x.NombreCompleto.ToUpper().Contains(txtBuscar.Text.ToUpper()));
            dgvMedicos.DataBind();
        }
        
        protected void mostrarDgvSegunPerfil()
        {
            MedicoNegocio medicoNegocio = new MedicoNegocio();
            Usuario usuario = (Usuario)Session["Usuario"];
            if (usuario != null)
            {
                if (((Dominio.Usuario)Session["Usuario"]).Perfil == Dominio.Perfil.Paciente)
                {
                    Session.Add("listaMedicos", medicoNegocio.listarParaPacientesConSP());
                    dgvMedicos.DataSource = Session["listaMedicos"];
                    dgvMedicos.DataBind();
                }
                else if (((Dominio.Usuario)Session["Usuario"]).Perfil == Dominio.Perfil.PersonalAdministrativo)
                {
                    Session.Add("listaMedicos", medicoNegocio.listarParaPAdministrativoConSP(true));
                    dgvMedicosPersonalAdministrativo.DataSource = Session["listaMedicos"];
                    dgvMedicosPersonalAdministrativo.DataBind();
                }
            }
        }

        protected void btnAgregarMedico_Click(object sender, EventArgs e)
        {

        }
    }
}