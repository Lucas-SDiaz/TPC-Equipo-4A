using Dominio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Negocio
{
    public class UsuarioNegocio
    {
        public bool Loguear (Usuario usuario)
        {
            AccesoDatos datos = new AccesoDatos ();
            try
            {
                datos.setQuery("SELECT ID_Usuario, ID_Perfil from Usuarios WHERE Email = @Email AND Contraseña = @Contraseña");
                datos.setParameters("@Email", usuario.Email);
                datos.setParameters("@Contraseña", usuario.Contraseña);
                datos.ejecutarLectura();
                while (datos.Lector.Read())
                {
                    usuario.Id_Usuario = (int)datos.Lector.GetInt64(0);
                    int perfil = (int)datos.Lector.GetInt32(1);
                    if (perfil == 1)
                        usuario.Perfil = Perfil.Administrador;
                    else if (perfil == 2)
                        usuario.Perfil = Perfil.Medico;
                    else if (perfil == 3)
                        usuario.Perfil = Perfil.PersonalAdministrativo;
                    else if (perfil == 4)
                        usuario.Perfil = Perfil.Paciente;

                    return true;
                }
                return false;
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

        public int Guardar(Usuario usuario)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setQuery("INSERT INTO Usuarios (ID_Perfil, Email, Contraseña, Estado)  VALUES (@ID_Perfil, @Email, @Contraseña, @Estado)");
                datos.setParameters("@ID_Perfil", (int)usuario.Perfil);
                datos.setParameters("@Email", usuario.Email);
                datos.setParameters("@Contraseña", usuario.Contraseña);
                datos.setParameters("@Estado", '1');

                int idUsuarioGenerado = (int)datos.ejecutarScalar();
                usuario.Id_Usuario = idUsuarioGenerado;

                return idUsuarioGenerado;
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

        public Usuario BuscarPorEmail(string email)
        {
            Usuario usuario = null;
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setQuery("SPBuscarUsuarioPorEmail");
                datos.setParameters("@Email", email);
                datos.ejecutarLectura();

                if (datos.Lector.Read())
                {
                    usuario = new Usuario
                    {
                        Email = datos.Lector["Email"].ToString(),
                        Contraseña = datos.Lector["Contraseña"].ToString()
                    };
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                datos.cerrarConexion();
            }

            return usuario;
        }


    }
}
