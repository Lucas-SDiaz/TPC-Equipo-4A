using Dominio;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;

namespace Negocio
{
    public class PacienteNegocio
    {
        AccesoDatos datos = new AccesoDatos();
        public List<Paciente> listarConSP()
        {
            List<Paciente> lista = new List<Paciente>();
            try
            {
                datos.setStoreProcedure("storedProcedureListarPacientes");
                datos.ejecutarLectura();
                while (datos.Lector.Read())
                {
                    Paciente aux = new Paciente();
                    aux.Usuario = new Usuario();   
                    aux.Id_Paciente = (int)datos.Lector.GetInt64(0);
                    aux.Usuario.Id_Usuario = (int)datos.Lector.GetInt64(1);
                    aux.FechaNacimiento = ((DateTime)datos.Lector["Fecha de nacimiento"]);
                    aux.Apellido = (string)datos.Lector["Apellido"];
                    aux.Nombre = (string)datos.Lector["Nombre"];
                    aux.DNI = (string)datos.Lector["DNI"];
                    aux.Usuario.Email = (string)datos.Lector["Email"];
                    aux.Telefono = (string)datos.Lector["Celular"];
                    lista.Add(aux);
                }
                return lista;
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        public void Agregar (Paciente nuevoPaciente)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                //Usuario
                datos.setQuery("INSERT INTO Usuarios (ID_Perfil, Email, Contraseña, Estado) OUTPUT INSERTED.ID_Usuario VALUES (@ID_Perfil, @Email, @Contraseña, @Estado)");
                datos.setParameters("@ID_Perfil", (int)nuevoPaciente.Usuario.Perfil);
                datos.setParameters("@Email", nuevoPaciente.Usuario.Email);
                datos.setParameters("@Contraseña", nuevoPaciente.Usuario.Contraseña);
                datos.setParameters("@Estado", 1); 

                //Scalar para capturar el Id del Usuario desde la base de datos
                object result = datos.ejecutarScalar();
                if (result == null)
                {
                    throw new Exception("No se pudo obtener el ID de Usuario al insertar. La consulta no devolvió ningún resultado.");
                }
                int idUsuarioGenerado = Convert.ToInt32(result);
                
                nuevoPaciente.Usuario.Id_Usuario = idUsuarioGenerado;

                //Domicilio
                datos.setQuery("INSERT INTO Domicilios (ID_Usuario, Calle, Numero, Piso, Depto, Ciudad, Provincia, CodigoPostal) VALUES (@ID_Usuario, @Calle, @Numero, @Piso, @Depto, @Ciudad, @Provincia, @CodigoPostal)");
                datos.clearParameters();
                datos.setParameters("@ID_Usuario", idUsuarioGenerado);
                datos.setParameters("@Calle", nuevoPaciente.Domicilio.Calle);
                datos.setParameters("@Numero", nuevoPaciente.Domicilio.Numero.ToString()); 
                datos.setParameters("@Piso", string.IsNullOrEmpty(nuevoPaciente.Domicilio.Piso) ? (object)DBNull.Value : nuevoPaciente.Domicilio.Piso);
                datos.setParameters("@Depto", string.IsNullOrEmpty(nuevoPaciente.Domicilio.Depto) ? (object)DBNull.Value : nuevoPaciente.Domicilio.Depto);
                datos.setParameters("@Ciudad", nuevoPaciente.Domicilio.Ciudad);
                datos.setParameters("@Provincia", nuevoPaciente.Domicilio.Provincia);
                datos.setParameters("@CodigoPostal", nuevoPaciente.Domicilio.CodigoPostal);

                datos.ejecutarAccion();

                //Paciente
                datos.setQuery("INSERT INTO Pacientes (ID_Usuario, Nombre, Apellido, DNI, FechaNacimiento, Estado) VALUES (@ID_Usuario, @Nombre, @Apellido, @DNI, @FechaNacimiento, @Estado)");
                datos.clearParameters();
                datos.setParameters("@ID_Usuario", idUsuarioGenerado);

                //string[] nombreApellido = nuevoPaciente.NombreYApellido.Split(' ');
                //string nombre = nombreApellido[0];
                //string apellido = nombreApellido.Length > 1 ? nombreApellido[1] : "";
                datos.setParameters("@Nombre", nuevoPaciente.Nombre);
                datos.setParameters("@Apellido", nuevoPaciente.Apellido);
                datos.setParameters("@DNI", nuevoPaciente.DNI);
                datos.setParameters("@FechaNacimiento", nuevoPaciente.FechaNacimiento);
                datos.setParameters("@Estado", 1); 

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

    }
}
