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
                    //aux.Especialidad.Id_Especialidad = (int)datos.Lector
                    aux.Hora = (TimeSpan)datos.Lector["Hora"];
                    aux.Fecha = (DateTime)datos.Lector["Fecha"];
                    aux.Estado = (int)datos.Lector["Estado"];

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
        public List<Turno> listarTurnosMedico(int id_u)
        {
            List<Turno> listaTurnos = new List<Turno>();
            try
            {
                datos.setStoreProcedure("SPlistarTurnosMedico");
                datos.setParameters("@ID_Usuario", id_u);
                datos.ejecutarLectura();
                while (datos.Lector.Read())
                {
                    Turno aux = new Turno();
                    aux.Paciente = new Paciente();
                    aux.Medico = new Medico();      
                    aux.ID_Turno = (int)datos.Lector.GetInt64(0);
                    aux.Paciente.Apellido = (string)datos.Lector["AP PAC"];
                    aux.Paciente.Nombre = (string)datos.Lector["NOM PAC"];
                    aux.Medico.Apellido = (string)datos.Lector["AP MED"];
                    aux.Medico.Nombre = (string)datos.Lector["NOM MED"];
                    aux.Fecha = (DateTime)datos.Lector["Fecha"];
                    aux.Hora = (TimeSpan)datos.Lector["Hora"];
                    aux.Estado = (int)datos.Lector["Estado"];

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
        public Turno listarTurnoPorID(int id_t)
        {
            List<Turno> listaTurnos = new List<Turno>();
            try
            {
                Turno aux = new Turno();
                datos.setStoreProcedure("SPlistarTurnoPorID");
                datos.setParameters("@ID_Turno", id_t);
                datos.ejecutarLectura();
                while (datos.Lector.Read())
                {
                    aux.Paciente = new Paciente();
                    aux.Medico = new Medico();      
                    aux.ID_Turno = (int)datos.Lector.GetInt64(0);
                    aux.Paciente.Id_Paciente = (int)datos.Lector.GetInt64(1);
                    aux.Medico.Id_Medico = (int)datos.Lector.GetInt64(2);
                    aux.Paciente.Apellido = (string)datos.Lector["AP PAC"];
                    aux.Paciente.Nombre = (string)datos.Lector["NOM PAC"];
                    aux.Medico.Apellido = (string)datos.Lector["AP MED"];
                    aux.Medico.Nombre = (string)datos.Lector["NOM MED"];
                    aux.Fecha = (DateTime)datos.Lector["Fecha"];
                    aux.Hora = (TimeSpan)datos.Lector["Hora"];
                    aux.Estado = (int)datos.Lector["Estado"];

                }
                return aux;
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

        public bool cancelarTurno(int idTurno)
        {
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setStoreProcedure("SpCancelarTurno");
                datos.setParameters("@ID_Turno", idTurno);
                datos.ejecutarAccion();
                return true;
            }
            catch (Exception)
            {
                return false;
            }
            finally
            {
                datos.cerrarConexion();
            }
        }

        public bool reprogramarTurno(Turno turno)
        {
            try
            {
                datos.setStoreProcedure("ReprogramarTurnoSP");
                datos.setParameters("@idTurno", turno.ID_Turno.ToString());
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
            return true;
        }

    }
}
