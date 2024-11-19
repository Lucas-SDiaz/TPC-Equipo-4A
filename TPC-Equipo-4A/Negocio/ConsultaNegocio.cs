using Dominio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Negocio
{
    public class ConsultaNegocio
    {
        public bool AgregarConsulta(Consulta aux)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setStoreProcedure("SPAgregarConsulta");
                datos.setParameters("@FechaConsulta", DateTime.Now);
                datos.setParameters("@ID_Medico", aux.Turno.Medico.Id_Medico);
                datos.setParameters("@ID_Paciente", aux.Turno.Paciente.Id_Paciente);
                datos.setParameters("@Diagnostico", aux.Diagnostico);
                datos.setParameters("@Tratamiento", aux.Tratamiento);
                datos.setParameters("@Comentarios", aux.Comentarios);
                datos.ejecutarAccion();
                return true;
            }
            catch (Exception ex)
            {
                return false;   
                throw new Exception("Error de conexión de SQL: " + ex.Message, ex);
            }
            finally
            {
                datos.cerrarConexion();
            }
        }
    }
}
