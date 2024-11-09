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
    public partial class RegistrosEliminados : System.Web.UI.Page
    {
        MedicoNegocio negocio = new MedicoNegocio();
        protected void Page_Load(object sender, EventArgs e)
        {
            Session.Add("listaMedicos", negocio.listarParaPAdministrativoConSP(false));
            dgvMedicos.DataSource = Session["listaMedicos"];
            dgvMedicos.DataBind();
        }

        //protected void ddlFiltro_SelectedIndexChanged(object sender, EventArgs e)
        //{

        //}
        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            List<Medico> lista = (List<Medico>)Session["listaMedicos"];
            dgvMedicos.DataSource = lista.FindAll(x => x.Apellido.ToUpper().Contains(txtBuscar.Text.ToUpper()) || x.Nombre.ToUpper().Contains(txtBuscar.Text.ToUpper()));
            dgvMedicos.DataBind();
        }

        protected void dgvMedicos_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int index = Convert.ToInt32(e.CommandArgument);
            GridViewRow row = dgvMedicos.Rows[index];
            int id_usuario = int.Parse(row.Cells[0].Text);
            string id_medico = dgvMedicos.DataKeys[index].Value.ToString();
            Medico aux = new Medico();
            //aux.Usuario = new Usuario();
            //aux.Especialidad = new Especialidad();
            //aux.Usuario.Id_Usuario = id_usuario;
            aux.Id_Medico = int.Parse(id_medico);
            //aux.Legajo = row.Cells[1].Text;
            //aux.Nombre = HttpUtility.HtmlDecode(row.Cells[2].Text);
            //aux.Apellido = HttpUtility.HtmlDecode(row.Cells[3].Text);
            //aux.Usuario.Email = row.Cells[4].Text;
            //aux.Telefono = row.Cells[5].Text;
            //aux.Especialidad.Id_Especialidad = int.Parse(row.Cells[6].Text);
            //aux.Especialidad.Descripcion = HttpUtility.HtmlDecode(row.Cells[7].Text);
            //aux.DNI = row.Cells[8].Text;
            //aux.Estado = true;
            negocio.EditarMedico(aux);
            Response.Redirect("MedicosABM.aspx", false);

        }
    }
}