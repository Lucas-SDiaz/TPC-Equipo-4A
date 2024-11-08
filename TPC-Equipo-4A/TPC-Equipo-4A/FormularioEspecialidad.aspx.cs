using Negocio;
using Dominio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TPC_Equipo_4A
{
    public partial class FormularioEspecialidad : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnAceptar_Click(object sender, EventArgs e)
        {
            EspecialidadNegocio negocio = new EspecialidadNegocio();
            Especialidad aux = new Especialidad();
            aux.Descripcion = txtEspecialidad.Text;
            if (negocio.IngresarEspecialidad(aux))
                Response.Redirect("insertExitoso.aspx");
            
        }
    }
}