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
    public partial class Cartilla : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            MedicoNegocio medicoNegocio= new MedicoNegocio();
            Session.Add("listaMedicos", medicoNegocio.listarConSP());
            dgvMedicos.DataSource = Session["listaMedicos"];
            dgvMedicos.DataBind();
        }

        protected void ddlFiltro_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            List<Medico> lista = (List<Medico>)Session["listaMedicos"];
            dgvMedicos.DataSource = lista.FindAll(x => x.NombreYApellido.ToUpper().Contains(txtBuscar.Text.ToUpper()));
            dgvMedicos.DataBind();
        }
        
    }
}