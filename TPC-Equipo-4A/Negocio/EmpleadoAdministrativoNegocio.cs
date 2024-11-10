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
        public List<PersonalAdministrativo> listarPAdministrativoSP()
        {
			AccesoDatos datos = new AccesoDatos();
			List<PersonalAdministrativo> lista = new List<PersonalAdministrativo>();	
            PersonalAdministrativo aux = new PersonalAdministrativo();  
			try
			{
				datos.setStoreProcedure("storedProcedurelistarPAdministrativoSP");
				datos.ejecutarLectura();
                while (datos.Lector.Read())
                {
                    aux.Usuario = new Usuario();
                    aux.Usuario.Id_Usuario = (int)datos.Lector.GetInt64(0);
                    aux.Id_PersonalAdministrativo = (int)datos.Lector.GetInt64(1);
                    aux.Legajo = (string)datos.Lector["Legajo"];
                    aux.Apellido = (string)datos.Lector["Apellido"];
                    aux.Nombre = (string)datos.Lector["Nombre"];
                    aux.DNI = (string)datos.Lector["DNI"];
                    aux.Usuario.Email = (string)datos.Lector["Email"];
                    aux.Estado = (bool)datos.Lector["Estado"];
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
    }
}
