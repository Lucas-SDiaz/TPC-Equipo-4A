using Dominio;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Negocio
{
    public class AdminSystemNegocio
    {
        public List<Usuario> ListarAdmins()
        {
            AccesoDatos datos = new AccesoDatos();  
            try
            {
                List<Usuario> lista = new List<Usuario>();
                datos.setQuery("SELECT U.ID_Usuario, U.Email FROM Usuarios U WHERE U.ID_Perfil = 1");
                datos.ejecutarLectura();
                while (datos.Lector.Read())
                {
                    Usuario aux = new Usuario();
                    aux.Id_Usuario = (int)datos.Lector.GetInt64(0);
                    aux.Email = (string)datos.Lector["Email"];
                   
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
        public bool IngresarAdminSistema(Usuario aux)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setStoreProcedure("SPIngresarAdminSistema");
                datos.setParameters("@Email", aux.Email);
                datos.setParameters("@Contraseña", aux.Contraseña);
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
