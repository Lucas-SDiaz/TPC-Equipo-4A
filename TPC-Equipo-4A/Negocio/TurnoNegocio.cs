using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dominio;

namespace Negocio
{
    public class TurnoNegocio
    {
        AccesoDatos datos = new AccesoDatos();

        public Turno agregarTurno(Turno turno)
        {
            try
            {
                datos.setStoreProcedure("GuardarTurnoSP");
                datos.setParameters("@ID_Paciente", turno.Paciente.Id_Paciente.ToString());
                datos.setParameters("ID_Especialidad", turno.Especialidad.Id_Especialidad.ToString());
                datos.setParameters("ID_Medico", turno.Medico.Id_Medico.ToString());
                datos.setParameters("Fecha", turno.Fecha);
                datos.setParameters("@Hora", turno.Hora);

                datos.ejecutarAccion();
                
            }
            catch (Exception ex)
            {
                
                throw new Exception("Error de conexión de SQL: " + ex.Message, ex);
            }
            finally
            {
                
                datos.cerrarConexion();
            }
            return turno;
        }

        //public List<Turno> listarTurnos()
        //{
        //    List<Turno> listaTurnos = new List<Turno>();
        //    try
        //    {
        //        datos.setStoreProcedure("listarTurnosSP");
        //        datos.ejecutarLectura();
        //        while (datos.Lector.Read())
        //        {
        //            Turno aux = new Turno();
        //            aux.ID_Turno = (int)datos.Lector["ID_Turno"];
        //            aux.Paciente = new Paciente();
        //            aux.Paciente.Id_Paciente = (int)datos.Lector["ID_Paciente"];
        //            aux.Paciente.NombreYApellido = (string)datos.Lector["Nombre Y Apellido"];
        //        }

        //        return listaTurnos;
        //    }
        //}
    }
}
