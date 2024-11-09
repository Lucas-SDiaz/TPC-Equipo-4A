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
    public partial class ConfirmarAccion : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.UrlReferrer != null)
                {
                    Session["urlAnterior"] = System.IO.Path.GetFileName(Request.UrlReferrer.LocalPath);
                }
            }
        }

        protected void btnVolver_Click(object sender, EventArgs e)
        {
            Volver();
        }

        protected void btnAceptar_Click(object sender, EventArgs e)
        {
            Confirmar();
        }



        private void Confirmar()
        {
            EspecialidadNegocio especialidadNegocio = new EspecialidadNegocio();
            MedicoNegocio medicoNegocio = new MedicoNegocio();
            Especialidad esp = new Especialidad();
            Medico med = new Medico();
            string urlAnterior = Session["urlAnterior"].ToString();
            if (!string.IsNullOrEmpty(urlAnterior))
            {
                switch (urlAnterior)
                {
                    case "MedicosABM":
                        if (Request.QueryString["id_u"] != null)
                        { 
                            med.Usuario = new Usuario();
                            med.Usuario.Id_Usuario = int.Parse(Request.QueryString["id_u"]);
                         //   medicoNegocio FALTA EL METODO DE BAJA DE MEDICO
                        }
                        break;
                    case "EspecialidadesABM":
                        if (Request.QueryString["id_esp"] != null)
                        {
                            esp.Id_Especialidad = int.Parse(Request.QueryString["id_esp"]);
                            especialidadNegocio.BajaEspecialidad(esp);
                        }
                        break;
                    default:
                        break;
                }
                Response.Redirect(urlAnterior);
            }
        }
        private void Volver()
        {
            string urlAnterior = Session["urlAnterior"].ToString();
            if (!string.IsNullOrEmpty(urlAnterior))
            {
                Response.Redirect(urlAnterior);
            }
            else
            {
                Response.Redirect("Dashboard.aspx");
            }
        }
    }

}


