using Dominio;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Security.AccessControl;
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
                    aux.FechaNacimiento = ((DateTime)datos.Lector["Fecha de nacimiento"]).Date;
                    aux.Apellido = (string)datos.Lector["Apellido"];
                    aux.Nombre = (string)datos.Lector["Nombre"];
                    aux.DNI = (string)datos.Lector["DNI"];
                    aux.Usuario.Email = (string)datos.Lector["Email"];
                    aux.Telefono = datos.Lector["Celular"] != DBNull.Value ? (string)datos.Lector["Celular"] : null;
                    lista.Add(aux);
                }
                return lista;
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        public Paciente BuscarPorID(int id)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                Paciente aux = new Paciente();
                datos.setStoreProcedure("storedProcedureBuscarPacienteID");
                datos.setParameters("@ID_Paciente", id);
                datos.ejecutarLectura();

                if (datos.Lector.Read())
                {
                    aux.Domicilio = new Domicilio();
                    aux.Usuario = new Usuario();

                    aux.Id_Paciente = (int)datos.Lector.GetInt64(0);
                    aux.Usuario.Id_Usuario = (int)datos.Lector.GetInt64(1);
                    aux.FechaNacimiento = ((DateTime)datos.Lector["FechaNacimiento"]).Date;
                    aux.Apellido = (string)datos.Lector["Apellido"];
                    aux.Nombre = (string)datos.Lector["Nombre"];
                    aux.DNI = (string)datos.Lector["DNI"];
                    aux.Usuario.Email = datos.Lector["Email"] != DBNull.Value ? (string)datos.Lector["Email"] : null;
                    aux.Usuario.Contraseña = (string)datos.Lector["Contraseña"];
                    aux.Telefono = (string)datos.Lector["Celular"];
                    aux.Estado = (bool)datos.Lector["Estado"];
                    aux.FechaRegistro = ((DateTime)datos.Lector["FechaRegistro"]).Date;
                    aux.Domicilio.Calle = (string)datos.Lector["Domicilio"];
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

        public Paciente BuscarParaModificar(int id)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                Paciente aux = new Paciente();
                datos.setStoreProcedure("storedProcedureBuscarPacienteID2");
                datos.setParameters("@ID_Paciente", id);
                datos.ejecutarLectura();

                if (datos.Lector.Read())
                {
                    aux.Domicilio = new Domicilio();
                    aux.Usuario = new Usuario();

                    aux.Id_Paciente = (int)datos.Lector.GetInt64(0);
                    aux.Usuario.Id_Usuario = (int)datos.Lector.GetInt64(1);
                    aux.FechaNacimiento = ((DateTime)datos.Lector["FechaNacimiento"]).Date;
                    aux.Apellido = (string)datos.Lector["Apellido"];
                    aux.Nombre = (string)datos.Lector["Nombre"];
                    aux.DNI = (string)datos.Lector["DNI"];
                    aux.Usuario.Email = datos.Lector["Email"] != DBNull.Value ? (string)datos.Lector["Email"] : null;
                    aux.Usuario.Contraseña = (string)datos.Lector["Contraseña"];
                    aux.Telefono = (string)datos.Lector["Celular"];
                    aux.Domicilio.Calle = (string)datos.Lector["Calle"];
                    aux.Domicilio.Numero = int.TryParse((string)datos.Lector["Numero"], out int numero) ? numero : 0;
                    aux.Domicilio.Ciudad = (string)datos.Lector["Ciudad"];
                    aux.Domicilio.Provincia = (string)datos.Lector["Provincia"];
                    aux.Domicilio.CodigoPostal = (string)datos.Lector["CodigoPostal"];
                    aux.Domicilio.Piso = datos.Lector["Piso"] != DBNull.Value ? (string)datos.Lector["Piso"] : null;
                    aux.Domicilio.Depto = datos.Lector["Depto"] != DBNull.Value ? (string)datos.Lector["Depto"] : null;
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

        public void ValidarPaciente(Paciente paciente)
        {
            //NOMBRE obligatorio, sin números
            if (string.IsNullOrWhiteSpace(paciente.Nombre))
                throw new ArgumentException("El nombre es obligatorio.");
            if (!Regex.IsMatch(paciente.Nombre, @"^[a-zA-ZÀ-ÿ\s]+$"))
                throw new ArgumentException("El nombre solo puede contener letras.");

            //APELLIDO obligatorio, sin números
            if (string.IsNullOrWhiteSpace(paciente.Apellido))
                throw new ArgumentException("El apellido es obligatorio.");
            if (!Regex.IsMatch(paciente.Apellido, @"^[a-zA-ZÀ-ÿ\s]+$"))
                throw new ArgumentException("El apellido solo puede contener letras.");

            //DNI obligatorio, solo números, de 7 a 8 dígitos
            if (string.IsNullOrWhiteSpace(paciente.DNI))
                throw new ArgumentException("El DNI es obligatorio.");
            if (!Regex.IsMatch(paciente.DNI, @"^\d{7,8}$"))
                throw new ArgumentException("El DNI debe tener entre 7 y 8 dígitos numéricos.");
            //Valido que el DNI no exista previamente
            if (ExisteDNI(paciente.DNI))
                throw new ArgumentException("El DNI ya está registrado en el sistema.");

            //FECHA, menor a la actual
            if (paciente.FechaNacimiento == null || paciente.FechaNacimiento > DateTime.Now)
                throw new ArgumentException("La fecha de nacimiento es inválida.");

            //MAIL si o si @
            if (!string.IsNullOrEmpty(paciente.Usuario.Email) &&
                !Regex.IsMatch(paciente.Usuario.Email, @"^[^@\s]+@[^@\s]+\.[^@\s]+$"))
            {
                throw new ArgumentException("El formato de email es inválido.");
            }

            //CONTRASEÑA obligatoria, al menos 8 caracteres y 1 número
            if (string.IsNullOrWhiteSpace(paciente.Usuario.Contraseña))
                throw new ArgumentException("La contraseña es obligatoria.");
            if (!Regex.IsMatch(paciente.Usuario.Contraseña, @"^(?=.*\d).{8,}$"))
                throw new ArgumentException("La contraseña debe tener al menos 8 caracteres y contener al menos un número.");
        }

        private bool ExisteDNI(string dni)
        {
            try
            {
                datos.setQuery("SELECT COUNT(*) FROM Pacientes WHERE DNI = @DNI");
                datos.setParameters("@DNI", dni);
                int count = (int)datos.ejecutarScalar();
                return count > 0;
            }
            catch (Exception ex)
            {
                throw new Exception("Error al verificar la existencia del DNI en la base de datos.", ex);
            }
        }


        public void Agregar(Paciente nuevoPaciente)
        {
            AccesoDatos datos = new AccesoDatos();

            ValidarPaciente(nuevoPaciente);

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
                datos.setParameters("@Nombre", nuevoPaciente.Nombre);
                datos.setParameters("@Apellido", nuevoPaciente.Apellido);
                datos.setParameters("@DNI", nuevoPaciente.DNI);
                datos.setParameters("@FechaNacimiento", nuevoPaciente.FechaNacimiento);
                datos.setParameters("@Estado", 1);
                
                datos.ejecutarAccion();

                //Teléfono
                datos.setQuery("INSERT INTO Telefonos (ID_Usuario, Numero) VALUES (@ID_Usuario, @Numero)");
                datos.clearParameters();
                datos.setParameters("@ID_Usuario", idUsuarioGenerado);
                datos.setParameters("@Numero", nuevoPaciente.Telefono);

                datos.ejecutarAccion();

                //Fecha Registro
                datos.setQuery("INSERT INTO FechaRegistro(ID_Usuario, FechaRegistro) VALUES(@ID_Usuario, @FechaRegistro)");
                datos.clearParameters();
                datos.setParameters("@ID_Usuario", idUsuarioGenerado);
                datos.setParameters("@FechaRegistro", DateTime.Now.Date);
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

        public bool Editar(Paciente paciente)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setStoreProcedure("storedProcedureEditarPaciente"); 

                datos.setParameters("@ID_Usuario", paciente.Usuario.Id_Usuario);
                datos.setParameters("@Nombre", paciente.Nombre);
                datos.setParameters("@Apellido", paciente.Apellido);
                datos.setParameters("@Email", paciente.Usuario.Email);
                datos.setParameters("@Contraseña", paciente.Usuario.Contraseña);
                datos.setParameters("@DNI", paciente.DNI);
                datos.setParameters("@Numero", paciente.Telefono);
                datos.setParameters("@FechaNacimiento", paciente.FechaNacimiento);
                datos.setParameters("@Calle", paciente.Domicilio.Calle);
                datos.setParameters("@NumeroCalle", paciente.Domicilio.Numero.ToString());
                datos.setParameters("@Piso", string.IsNullOrEmpty(paciente.Domicilio.Piso) ? (object)DBNull.Value : paciente.Domicilio.Piso);
                datos.setParameters("@Depto", string.IsNullOrEmpty(paciente.Domicilio.Depto) ? (object)DBNull.Value : paciente.Domicilio.Depto);
                datos.setParameters("@Ciudad", paciente.Domicilio.Ciudad);
                datos.setParameters("@Provincia", paciente.Domicilio.Provincia);
                datos.setParameters("@CodigoPostal", paciente.Domicilio.CodigoPostal);
                datos.setParameters("@Estado", paciente.Estado);
             
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


        public bool EliminarPaciente(int id_usuario)
        {
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setStoreProcedure("storedProcedureEliminarPaciente");
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
