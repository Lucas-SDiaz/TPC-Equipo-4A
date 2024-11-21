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
    public partial class DetalleConsultas : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["historiaClinica"] != null)
                {
                    HistoriaClinica aux = new HistoriaClinica();
                    aux = (HistoriaClinica)Session["historiaClinica"];
                    GenerarAcordeon(aux);
                    CargarEspecialidades();
                }
            }
        }


        private void GenerarAcordeon(HistoriaClinica aux)
        {

            string acordeonHtml = "";
            int index = 0; 
            foreach (var consulta in aux.Consultas)
            {
                string collapseId = $"collapse{index}";
                acordeonHtml += $@"
            <div class='accordion-item'>
                <h2 class='accordion-header'>
                    <button class='accordion-button {(index == 0 ? "" : "collapsed")}' type='button' data-bs-toggle='collapse' data-bs-target='#{collapseId}' aria-expanded='{(index == 0).ToString().ToLower()}' aria-controls='{collapseId}'>
                        Consulta de {consulta.Turno.Paciente.Nombre} - {consulta.Turno.Fecha:dd/MM/yyyy}            -            Medico: {consulta.Turno.Medico.NombreCompleto}    
                    </button>
                </h2>
                <div id='{collapseId}' class='accordion-collapse collapse {(index == 0 ? "show" : "")}'>
                    <div class='accordion-body'>
                        <strong>Diagnóstico:</strong> {consulta.Diagnostico}<br>
                        <strong>Tratamiento:</strong> {consulta.Tratamiento}<br>
                        <strong>Comentarios:</strong> {consulta.Comentarios}
                    </div>
                </div>
            </div>";
                index++;
            }

            consultaAccordion.InnerHtml = acordeonHtml;
        }

        protected void ddlFiltro_SelectedIndexChanged(object sender, EventArgs e)
        {
            int id = int.Parse(ddlFiltro.SelectedItem.Value);
            AcordeonFiltrado(id);
        }
        private void CargarEspecialidades()
        {
            EspecialidadNegocio negocio = new EspecialidadNegocio();
            ddlFiltro.DataSource = negocio.listarConSP();
            ddlFiltro.DataTextField = "Descripcion";
            ddlFiltro.DataValueField = "Id_Especialidad";
            ddlFiltro.DataBind();
            ddlFiltro.Items.Insert(0, new ListItem("Filtrar especialidad", "0"));
        }
        private void AcordeonFiltrado(int id)
        {
            HistoriaClinica aux = new HistoriaClinica();
            aux = (HistoriaClinica)Session["historiaClinica"];
            string acordeonHtml = "";
            int index = 0;
            foreach (var consulta in aux.Consultas)
            {
                if(consulta.Turno.Medico.Especialidad.Id_Especialidad == id)
                {
                    string collapseId = $"collapse{index}";
                    acordeonHtml += $@"
                    <div class='accordion-item'>
                        <h2 class='accordion-header'>
                            <button class='accordion-button {(index == 0 ? "" : "collapsed")}' type='button' data-bs-toggle='collapse' data-bs-target='#{collapseId}' aria-expanded='{(index == 0).ToString().ToLower()}' aria-controls='{collapseId}'>
                                Consulta de {consulta.Turno.Paciente.Nombre} - {consulta.Turno.Fecha:dd/MM/yyyy}            -            Medico: {consulta.Turno.Medico.NombreCompleto}    
                            </button>
                        </h2>
                        <div id='{collapseId}' class='accordion-collapse collapse {(index == 0 ? "show" : "")}'>
                            <div class='accordion-body'>
                                <strong>Diagnóstico:</strong> {consulta.Diagnostico}<br>
                                <strong>Tratamiento:</strong> {consulta.Tratamiento}<br>
                                <strong>Comentarios:</strong> {consulta.Comentarios}
                            </div>
                        </div>
                    </div>";
                    index++;
                }
            }
            consultaAccordion.InnerHtml = acordeonHtml;
        }
    }
}