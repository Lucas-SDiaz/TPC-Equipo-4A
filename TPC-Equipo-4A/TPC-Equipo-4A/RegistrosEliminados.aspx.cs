using Dominio;
using Negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TPC_Equipo_4A
{
    public partial class RegistrosEliminados : System.Web.UI.Page
    {
        MedicoNegocio medicoNegocio = new MedicoNegocio();
        EmpleadoAdministrativoNegocio empNegocio = new EmpleadoAdministrativoNegocio();
        protected void Page_Load(object sender, EventArgs e)
        {
            string urlAnterior;
            if (Request.UrlReferrer != null)
            {
                urlAnterior = System.IO.Path.GetFileName(Request.UrlReferrer.LocalPath);
                if(urlAnterior == "ABMPadministrativo")
                {
                    Session.Add("listaEmpleadosBajas", empNegocio.listarPAdministrativoSP(false));
                    dgvEmpleados.DataSource = Session["listaEmpleadosBajas"];
                    dgvEmpleados.DataBind();
                }
                else if (urlAnterior == "MedicosABM")
                {
                    Session.Add("listaMedicos", medicoNegocio.listarParaPAdministrativoConSP(false));
                    dgvMedicos.DataSource = Session["listaMedicos"];
                    dgvMedicos.DataBind();
                }
            }
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
            //GridViewRow row = dgvMedicos.Rows[index];
            //int id_usuario = int.Parse(row.Cells[0].Text);
            string id_medico = dgvMedicos.DataKeys[index].Value.ToString();
            Medico aux = new Medico();
            aux = medicoNegocio.buscarMedicoID(int.Parse(id_medico));
            aux.Id_Medico = int.Parse(id_medico); 
            medicoNegocio.EditarMedico(aux);
            Response.Redirect("MedicosABM.aspx", false);

        }

        protected void dgvEmpleados_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int index = Convert.ToInt32(e.CommandArgument);
            GridViewRow row = dgvEmpleados.Rows[index];     // ver que pasa aca
            //int id_usuario = int.Parse(row.Cells[0].Text);

            PersonalAdministrativo aux = new PersonalAdministrativo();
            aux.Id_PersonalAdministrativo = empNegocio.buscarEmpleadoID(int.Parse(dgvEmpleados.DataKeys[index].Value.ToString())).Id_PersonalAdministrativo;

            empNegocio.EditarEmpleado(aux, empNegocio.buscarEmpleadoID(int.Parse(dgvEmpleados.DataKeys[index].Value.ToString())).Usuario.Id_Usuario.ToString());
            Response.Redirect("ABMPadministrativo.aspx", false);
        }
    }
}

