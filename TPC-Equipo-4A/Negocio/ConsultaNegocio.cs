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
        public HistoriaClinica ListarConsultas(int id_pac)
        {
            AccesoDatos datos = new AccesoDatos();
            HistoriaClinica aux = new HistoriaClinica();
            aux.Consultas = new List<Consulta>();
            datos.setStoreProcedure("SPListarConsultasPorPaciente");
            datos.setParameters("@ID_Paciente", id_pac);
            datos.ejecutarLectura();

            while (datos.Lector.Read())
            {
                Consulta consulta = new Consulta();
                {
                    consulta.Turno = new Turno();
                    {
                        consulta.Turno.Fecha = (DateTime)datos.Lector["FechaConsulta"];
                        consulta.Turno.Medico = new Medico();
                        {
                            consulta.Turno.Medico.Especialidad = new Especialidad();
                            consulta.Turno.Medico.Nombre = (string)datos.Lector["med nombre"];
                            consulta.Turno.Medico.Apellido = (string)datos.Lector["med ap"];
                            consulta.Turno.Medico.Especialidad.Id_Especialidad = (int)datos.Lector.GetInt64(10);
                        }
                        consulta.Turno.Paciente = new Paciente();
                        {
                            consulta.Turno.Paciente.Nombre = (string)datos.Lector["pac nombre"];
                            consulta.Turno.Paciente.Apellido = (string)datos.Lector["pac ap"];
                        }
                    }
                    consulta.Diagnostico = (string)datos.Lector["Diagnostico"];
                    consulta.Tratamiento = (string)datos.Lector["Tratamiento"];
                    consulta.Comentarios = (string)datos.Lector["Comentarios"];
                };

                // Agregar consulta a la lista
                aux.Consultas.Add(consulta);
            }
            return aux;








            //while (datos.Lector.Read())
            //{

            //    aux.Consultas[index].Turno.Fecha = (DateTime)datos.Lector["FechaConsulta"];
            //    aux.Consultas[index].Turno.Paciente.Nombre = (string)datos.Lector["Nombre"];
            //    aux.Consultas[index].Turno.Paciente.Apellido = (string)datos.Lector["Apellido"];
            //    aux.Consultas[index].Diagnostico = (string)datos.Lector["Diagnostico"];
            //    aux.Consultas[index].Tratamiento = (string)datos.Lector["Tratamiento"];
            //    aux.Consultas[index].Comentarios = (string)datos.Lector["Comentarios"];

            //    index++;
            //}
            //return aux; 
        }
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
