using Dominio;
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
                        Consulta de {consulta.Turno.Paciente.Nombre} - {consulta.Turno.Fecha:dd/MM/yyyy}
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
    }
}