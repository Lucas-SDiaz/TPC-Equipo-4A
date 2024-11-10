using Dominio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Negocio
{
    public class AdministrativoNegocio
    {
        public void AltaAdministrativo(PersonalAdministrativo personal)
        {
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setStoreProcedure("SPAltaAdminitrativo");
                datos.setParameters("@Nombre", personal.Nombre);
                datos.setParameters("@Apellido", personal.Apellido);
                datos.setParameters("@Email", personal.Usuario.Email);
                datos.setParameters("@DNI", personal.DNI);
                datos.setParameters("@Numero", personal.Telefono);
                datos.ejecutarAccion();
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
        public bool EliminarPersonalAdministrativo(int id_usuario)
        {
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setStoreProcedure("SPEliminarAdministrativo");
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
