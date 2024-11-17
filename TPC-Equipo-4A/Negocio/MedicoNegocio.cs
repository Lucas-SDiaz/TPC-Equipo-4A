using Dominio;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml;

namespace Negocio
{
    public class MedicoNegocio
    {
        public List<Medico> listarParaPacientesConSP()
        {
            AccesoDatos datos = new AccesoDatos();

            List<Medico> lista = new List<Medico>();
            try
            {
                datos.setStoreProcedure("storedProcedureListarMedicos");
                datos.ejecutarLectura();
                while (datos.Lector.Read())
                {
                    Medico aux = new Medico();
                    aux.Usuario = new Usuario();
                    aux.Usuario.Id_Usuario = (int)datos.Lector.GetInt64(0);
                    aux.Id_Medico = (int)datos.Lector.GetInt64(1);
                    aux.Apellido = (string)datos.Lector["Apellido"];
                    aux.Nombre = (string)datos.Lector["Nombre"];
                    aux.Usuario.Email = (string)datos.Lector["Email"];
                    aux.Especialidad = new Especialidad();
                    aux.Especialidad.Descripcion = (string)datos.Lector["Nombre_E"];
                    lista.Add(aux);
                }
                return lista;
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
        
        public List<Medico> listarParaPAdministrativoConSP(bool opc)
        {
            AccesoDatos datos = new AccesoDatos();

            List<Medico> lista = new List<Medico>();
            try
            {
                datos.setStoreProcedure("storedProcedureListarMedicosParaPersAdmin");
                datos.ejecutarLectura();
                while (datos.Lector.Read())
                {
                    Medico aux = new Medico();
                    aux.Usuario = new Usuario();
                    aux.Especialidad = new Especialidad();
                    aux.Usuario.Id_Usuario = (int)datos.Lector.GetInt64(0);
                    aux.Id_Medico = (int)datos.Lector.GetInt64(1);
                    aux.Legajo = (string)datos.Lector["Legajo"];
                    aux.Apellido = (string)datos.Lector["Apellido"];
                    aux.Nombre = (string)datos.Lector["Nombre"];
                    aux.Usuario.Email = (string)datos.Lector["Email"];
                    aux.Telefono = (string)datos.Lector["Celular"];
                    //aux.DNI = (string)datos.Lector["DNI"];
                    aux.Especialidad.Descripcion = (string)datos.Lector["Especialidad"];
                    aux.Especialidad.Id_Especialidad = (int)datos.Lector.GetInt64(9);
                    aux.Estado = (bool)datos.Lector["Estado"];
                    if(opc && aux.Estado)
                        lista.Add(aux);
                    else if(!opc && !aux.Estado)
                        lista.Add(aux);
                }
                return lista;
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        public List<Medico> listarMedicosConSP()
        {
            AccesoDatos datos = new AccesoDatos();
            List<Medico> lista = new List<Medico>();
            
            try
            {
                datos.setStoreProcedure("storedProcedureObtenerMedicos");
                datos.ejecutarLectura();
                while (datos.Lector.Read())
                {
                    Medico aux = new Medico();
                    aux.Id_Medico = (int)datos.Lector.GetInt64(0);
                    aux.Apellido = (string)datos.Lector["Apellido"];
                    aux.Nombre = (string)datos.Lector["Nombre"];
                    aux.Especialidad = new Especialidad();
                    aux.Especialidad.Id_Especialidad = (int)datos.Lector.GetInt64(3);
                    
                    lista.Add(aux);
                }
            }
            catch (Exception)
            {
                Console.WriteLine("Error obteniendo lista de medicos desde capa de negocio");
            }

            return lista;
        }

        public Medico listarHorariosDeMedicosConSP(int idMedico, string fechaDeTurno)
        {
            AccesoDatos datos = new AccesoDatos();
            Medico medico = new Medico();
            List<JornadaMedicos> jornadas = new List<JornadaMedicos>();
            List<Turno> turnos = new List<Turno>();

            try
            {
                datos.setStoreProcedure("storedProcedureObtenerJornadaDeMedicoSegunFecha");
                datos.setParameters("@idMedico", idMedico);
                datos.setParameters("@fechaTurno", fechaDeTurno);
                datos.ejecutarLectura();

                while (datos.Lector.Read())
                {
                    JornadaMedicos jornada = new JornadaMedicos();
                    jornada.Id_Medico = (int)datos.Lector.GetInt64(0);

                    if (!datos.Lector.IsDBNull(0))
                    {
                        jornada.DiaSemana = (byte)datos.Lector["DiaSemana"];
                        jornada.HoraInicio = (TimeSpan)datos.Lector["HoraEntrada"];
                        jornada.HoraFin = (TimeSpan)datos.Lector["HoraSalida"];
                        
                        if (!jornadas.Any(x => x.DiaSemana == jornada.DiaSemana && x.HoraInicio == jornada.HoraInicio))
                        {
                            jornadas.Add(jornada);
                        }
                    }

                    if (!datos.Lector.IsDBNull(6))
                    {
                        Turno turno = new Turno();
                        turno.Medico.Id_Medico = (int)datos.Lector.GetInt64(0);
                        turno.Hora = (TimeSpan)datos.Lector["Hora"];
                        turno.Fecha = (DateTime)datos.Lector["Fecha"];
                        turnos.Add(turno);
                    }


                    medico.Id_Medico = (int)datos.Lector.GetInt64(1);
                    medico.TurnosAsignados = turnos;
                    medico.HorariosLaborables = jornadas;
                }
            }
            catch (Exception)
            {
                Console.WriteLine("Error obteniendo lista de medicos desde capa de negocio");
            }




            return medico;
        }
        public int TraerUltimoIDMedico()
        {
            int Id_Medico;
            AccesoDatos datos = new AccesoDatos();
            datos.setStoreProcedure("storedProcedureTraerUltimoIDMedico");
            datos.ejecutarLectura();
            while (datos.Lector.Read())
            {
                Id_Medico = (int)datos.Lector.GetInt64(0);
                return Id_Medico;
            }
            return -1;
        }

        public Medico buscarMedicoID(int id_med)
        {
            AccesoDatos datos = new AccesoDatos();

            try
            {
                Medico aux = new Medico();
                datos.setStoreProcedure("storedProcedureBuscarMedicoID");
                datos.setParameters("@ID_Medico", id_med);
                datos.ejecutarLectura();
                while (datos.Lector.Read())
                {
                    aux.Usuario = new Usuario();
                    aux.Especialidad = new Especialidad();
                    aux.Usuario.Id_Usuario = (int)datos.Lector.GetInt64(0);
                    aux.Apellido = (string)datos.Lector["Apellido"];
                    aux.Nombre = (string)datos.Lector["Nombre"];
                    aux.Usuario.Email = (string)datos.Lector["Email"];
                    aux.DNI = (string)datos.Lector["DNI"];
                    aux.Telefono = (string)datos.Lector["Numero"];
                    aux.Especialidad.Id_Especialidad = (int)datos.Lector.GetInt64(3);
                }
                return aux;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public bool EditarMedico(Medico medico)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setStoreProcedure("storedProcedureEditarMedico");
                datos.setParameters("@ID_Medico", medico.Id_Medico);
                datos.setParameters("@ID_Usuario", medico.Usuario.Id_Usuario);
                datos.setParameters("@Nombre", medico.Nombre);
                datos.setParameters("@Apellido", medico.Apellido);
                datos.setParameters("@Email", medico.Usuario.Email);
                datos.setParameters("@DNI", medico.DNI);
                datos.setParameters("@Numero", medico.Telefono);
                datos.setParameters("@ID_Especialidad", medico.Especialidad.Id_Especialidad);
                datos.setParameters("@Estado", true);
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
        public bool IngresarMedico(Medico medico)
        {
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setStoreProcedure("storedProcedureInsertarMedico");
                datos.setParameters("@Nombre", medico.Nombre);
                datos.setParameters("@Apellido", medico.Apellido);
                datos.setParameters("@Email", medico.Usuario.Email);
                datos.setParameters("@DNI", medico.DNI);
                datos.setParameters("@Numero", medico.Telefono);
                datos.setParameters("@ID_Especialidad", medico.Especialidad.Id_Especialidad);
                datos.ejecutarAccion();
                return true;
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
        public bool EliminarMedico(int id_usuario)
        {
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setStoreProcedure("storedProcedureEliminarMedico");
                datos.setParameters("@ID_Usuario", id_usuario);
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
        public bool CargarHorariosMedico(Medico aux)
        {
            MedicoNegocio negocio = new MedicoNegocio();
            ///
            //Esto es provisorio
            //Medico medico = negocio.buscarMedicoID(1);
            ///
            AccesoDatos datos =new AccesoDatos();
            foreach (var item in aux.HorariosLaborables)
            {
                datos.setStoreProcedure("storedProcedureCargarHorarios");
                datos.setParameters("@ID_Medico", aux.Id_Medico);
                datos.setParameters("@DiaSemana", item.DiaSemana);
                datos.setParameters("@HoraEntrada", item.HoraInicio);
                datos.setParameters("@HoraSalida", item.HoraFin);
                datos.setParameters("@Estado", 1);
                datos.ejecutarAccion();
                datos.clearParameters();
            }
            return true;
        }
    }
}
