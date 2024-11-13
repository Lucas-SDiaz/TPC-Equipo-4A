using Dominio;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Negocio
{
    public class EmpleadoAdministrativoNegocio
    {
        public List<PersonalAdministrativo> listarPAdministrativoSP(bool opc)
        {
			AccesoDatos datos = new AccesoDatos();
			List<PersonalAdministrativo> lista = new List<PersonalAdministrativo>();	
			try
			{
				datos.setStoreProcedure("storedProcedurelistarPAdministrativoSP");
				datos.ejecutarLectura();
                while (datos.Lector.Read())
                {
                    PersonalAdministrativo aux = new PersonalAdministrativo();  
                    aux.Usuario = new Usuario();
                    aux.Usuario.Id_Usuario = (int)datos.Lector.GetInt64(0);
                    aux.Id_PersonalAdministrativo = (int)datos.Lector.GetInt64(1);
                    aux.Legajo = (string)datos.Lector["Legajo"];
                    aux.Apellido = (string)datos.Lector["Apellido"];
                    aux.Nombre = (string)datos.Lector["Nombre"];
                    aux.DNI = (string)datos.Lector["DNI"];
                    aux.Usuario.Email = (string)datos.Lector["Email"];
                    aux.Estado = (bool)datos.Lector["Estado"];
                    if (opc && aux.Estado)
                        lista.Add(aux);
                    else if (!opc && !aux.Estado)
                        lista.Add(aux);
                }
                return lista;
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
        public PersonalAdministrativo buscarEmpleadoID(int id_emp)
        {
            AccesoDatos datos = new AccesoDatos();

            try
            {
                PersonalAdministrativo aux = new PersonalAdministrativo();
                aux.Usuario = new Usuario();
                datos.setStoreProcedure("storedProcedureBuscarEmpleadoID");
                datos.setParameters("@ID_Administrativo", id_emp);
                datos.ejecutarLectura();
                while (datos.Lector.Read())
                {
                    aux.Usuario.Id_Usuario = (int)datos.Lector.GetInt64(0);
                    aux.Id_PersonalAdministrativo = (int)datos.Lector.GetInt64(1);
                    aux.Legajo = (string)datos.Lector["Legajo"];
                    aux.Apellido = (string)datos.Lector["Apellido"];
                    aux.Nombre = (string)datos.Lector["Nombre"];
                    aux.DNI = (string)datos.Lector["DNI"];
                    aux.Usuario.Email = (string)datos.Lector["Email"];
                    aux.Estado = (bool)datos.Lector["Estado"];
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
        public bool EditarEmpleado(PersonalAdministrativo aux, string id)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                if(aux.Nombre == null)
                {
                    aux = buscarEmpleadoID(aux.Id_PersonalAdministrativo);
                }
                datos.setStoreProcedure("storedProcedureEditarEmpleado");
                datos.setParameters("@ID_Usuario", id);
                datos.setParameters("@Nombre", aux.Nombre);
                datos.setParameters("@Apellido", aux.Apellido);
                datos.setParameters("@Email", aux.Usuario.Email);
                datos.setParameters("@DNI", aux.DNI);
                datos.setParameters("@Estado", 1);
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
        public bool EliminarEmpleado(PersonalAdministrativo aux)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setStoreProcedure("storedProcedureEliminarEmpleado");
                datos.setParameters("@ID_Usuario", aux.Usuario.Id_Usuario);
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
        public bool IngresarEmpleado(PersonalAdministrativo aux)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setStoreProcedure("storedProcedureIngresarEmpleado");
                datos.setParameters("@Nombre", aux.Nombre);
                datos.setParameters("@Apellido", aux.Apellido);
                datos.setParameters("@Email", aux.Usuario.Email);
                datos.setParameters("@DNI", aux.DNI);
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
