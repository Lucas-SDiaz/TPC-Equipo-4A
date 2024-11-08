using Dominio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

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
        public List<Medico> listarParaPAdministrativoConSP()
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
                    aux.Usuario.Id_Usuario = (int)datos.Lector.GetInt64(0);
                    aux.Id_Medico = (int)datos.Lector.GetInt64(1);
                    aux.Legajo = (string)datos.Lector["Legajo"];
                    aux.Apellido = (string)datos.Lector["Apellido"];
                    aux.Nombre = (string)datos.Lector["Nombre"];
                    aux.Usuario.Email = (string)datos.Lector["Email"];
                    aux.Telefono = (string)datos.Lector["Celular"];
                    aux.Especialidad = new Especialidad();
                    aux.Especialidad.Descripcion = (string)datos.Lector["Especialidad"];
                    aux.Estado = (bool)datos.Lector["Estado"];
                    if(aux.Estado)
                        lista.Add(aux);
                }
                return lista;
            }
            catch (Exception ex)
            {

                throw ex;
            }
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

        public void EditarMedico(Medico medico)
        {
            AccesoDatos datos = new AccesoDatos();

            datos.setStoreProcedure("storedProcedureEditarMedico");
            datos.setParameters("@ID_Usuario", medico.Usuario.Id_Usuario);
            datos.setParameters("@Nombre", medico.Nombre);
            datos.setParameters("@Apellido", medico.Apellido);
            datos.setParameters("@Email", medico.Usuario.Email);
            datos.setParameters("@DNI", medico.DNI);
            datos.setParameters("@Numero", medico.Telefono);
            datos.setParameters("@ID_Especialidad", medico.Especialidad.Id_Especialidad);
            datos.ejecutarAccion();
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
    }
}
