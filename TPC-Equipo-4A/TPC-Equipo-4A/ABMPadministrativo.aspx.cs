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
    public partial class ABMPadministrativo : System.Web.UI.Page
    {
        EmpleadoAdministrativoNegocio negocio = new EmpleadoAdministrativoNegocio();
        protected void Page_Load(object sender, EventArgs e)
        {
            if ((Usuario)Session["Usuario"] != null) {
                if(((Usuario)Session["Usuario"]).Perfil == Perfil.Administrador)
                {
                    dgvAdministrativos.DataSource = negocio.listarPAdministrativoSP(true);
                    dgvAdministrativos.DataBind();
                }
            }
            else
            {
                Session.Add("error", "Usted no tiene permiso para acceder");
                Response.Redirect("Error.aspx", false);
            }
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {

        }

        protected void dgvAdministrativos_SelectedIndexChanged(object sender, EventArgs e)
        {
            //GridViewRow row = dgvAdministrativos.SelectedRow;
            //string id_usuario = row.Cells[0].Text;
            //string id_empleado = dgvAdministrativos.SelectedDataKey.Value.ToString();
            //Response.Redirect("FormularioAdministrativos.aspx?id_m=" + id_empleado + "&id_u=" + id_usuario, false);
        }

        protected void ddlFiltro_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void btnBuscar_Click1(object sender, EventArgs e)
        {

        }

        protected void dgvAdministrativos_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int index = Convert.ToInt32(e.CommandArgument);
            GridViewRow row = dgvAdministrativos.Rows[index];
            string id_emp = dgvAdministrativos.DataKeys[index].Value.ToString();
            if (e.CommandName == "Editar")
            {
                Response.Redirect("FormularioEmpleadoAdmin.aspx?id_u=" + id_emp, false);
            }
            else if (e.CommandName == "Eliminar")
            {
                //negocio.(int.Parse(id_usuario)); FALTA METODO PARA DAR DE BAJA EMPLEADOS
                negocio.EliminarEmpleado(negocio.buscarEmpleadoID(int.Parse(id_emp)));
                Response.Redirect("ABMPadministrativo.aspx", false);
            }
        }

        protected void btnAgregarAdmin_Click(object sender, EventArgs e)
        {
            Response.Redirect("FormularioEmpleadoAdmin.aspx", false);
        }

        protected void VerRegistrosEliminados_Click(object sender, EventArgs e)
        {
            Response.Redirect("RegistrosEliminados.aspx", false);
        }
    }
}