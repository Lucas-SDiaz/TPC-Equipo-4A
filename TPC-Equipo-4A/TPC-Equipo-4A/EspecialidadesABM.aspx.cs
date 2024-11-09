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
    public partial class EspecialidadesABM : System.Web.UI.Page
    {
        EspecialidadNegocio negocio = new EspecialidadNegocio();
        protected void Page_Load(object sender, EventArgs e)
        {
            cargarDgv();
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            try
            {
                if (Session["listaEspecialidad"] != null)
                {
                    List<Especialidad> lista = new List<Especialidad>();
                    lista = (List<Especialidad>)Session["listaEspecialidad"];
                    dgvEspecialidades.DataSource = lista.FindAll(x => x.Descripcion.ToUpper().Contains(txtBuscar.Text.ToUpper()));
                    dgvEspecialidades.DataBind();
                }
            }
            catch (Exception ex)
            {

                throw ex;
            } 
        }

        protected void btnAgregarEspecialidad_Click(object sender, EventArgs e)
        {
            Response.Redirect("FormularioEspecialidad.aspx", false);
        }

        protected void ddlFiltro_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void dgvEspecialidades_SelectedIndexChanged(object sender, EventArgs e)
        {
            string id_esp = dgvEspecialidades.SelectedDataKey.Value.ToString();
            Response.Redirect("ConfirmarAccion.aspx?id_esp=" + id_esp, false);
        }

        protected void dgvEspecialidades_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            dgvEspecialidades.PageIndex = e.NewPageIndex;
            cargarDgv();
        }
        protected void cargarDgv()
        {
            Session.Add("listaEspecialidad", negocio.listarConSP());
            dgvEspecialidades.DataSource = Session["listaEspecialidad"];
            dgvEspecialidades.DataBind();
        }

        protected void dgvEspecialidades_RowCreated(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Pager)
            {
                e.Row.CssClass = "pagination gridview-pagination";
            }
        }
    }
}