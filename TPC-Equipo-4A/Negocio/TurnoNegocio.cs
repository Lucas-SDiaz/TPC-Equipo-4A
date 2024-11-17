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
                datos.setParameters("@idPaciente", turno.Paciente.Id_Paciente.ToString());
                datos.setParameters("@idMedico", turno.Medico.Id_Medico.ToString());
                datos.setParameters("@fechaTurno", turno.Fecha);
                datos.setParameters("@horaTurno", turno.Hora);

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

        public List<Turno> listarTurnos()
        {
            List<Turno> listaTurnos = new List<Turno>();
            try
            {
                datos.setStoreProcedure("SPlistarTurnos");
                datos.ejecutarLectura();
                while (datos.Lector.Read())
                {
                    Turno aux = new Turno();
                    aux.Paciente = new Paciente();
                    aux.Medico = new Medico();      
                    aux.ID_Turno = (int)datos.Lector.GetInt64(0);
                    aux.Paciente.Apellido = (string)datos.Lector["ap pac"];
                    aux.Paciente.Nombre = (string)datos.Lector["nom pac"];
                    aux.Medico.Apellido = (string)datos.Lector["ap med"];
                    aux.Medico.Nombre = (string)datos.Lector["nom med"];
                    aux.Hora = (TimeSpan)datos.Lector["Hora"];
                    aux.Fecha = (DateTime)datos.Lector["Fecha"];
                    aux.Estado = (string)datos.Lector["Estado"];

                    listaTurnos.Add(aux);   
                }
                return listaTurnos;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                datos.cerrarConexion();
            }
        }
    }
}
