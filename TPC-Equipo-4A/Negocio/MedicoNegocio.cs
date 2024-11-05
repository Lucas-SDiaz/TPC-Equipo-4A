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
        AccesoDatos datos = new AccesoDatos();
        public List<Medico> listarParaPacientesConSP()
        {
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
                    aux.NombreYApellido = (string)datos.Lector["Nombre Y apellido"];
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
                    aux.NombreYApellido = (string)datos.Lector["Nombre Y apellido"];
                    aux.Usuario.Email = (string)datos.Lector["Email"];
                    aux.Telefono = (string)datos.Lector["Celular"];
                    aux.Especialidad = new Especialidad();
                    aux.Especialidad.Descripcion = (string)datos.Lector["Especialidad"];
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
            try
            {
                Medico aux = new Medico();
                datos.setQuery("select M.ID_Usuario, M.Apellido, M.Nombre, U.Email, M.DNI, T.Numero from Medicos M" +
                              " INNER JOIN Usuarios U ON U.ID_Usuario = M.ID_Usuario" +
                              " INNER JOIN Telefonos T ON T.ID_Usuario = M.ID_Usuario" +
                              " WHERE M.ID_Medico = @ID_Medico");
                datos.setParameters("@ID_Medico", id_med);
                datos.ejecutarLectura();
                while (datos.Lector.Read())
                {
                    aux.Usuario = new Usuario();
                    aux.Usuario.Id_Usuario = (int)datos.Lector.GetInt64(0);
                    aux.NombreYApellido = (string)datos.Lector["Apellido"];
                    aux.Legajo = (string)datos.Lector["Nombre"];
                    aux.Usuario = new Usuario();
                    aux.Usuario.Email = (string)datos.Lector["Email"];
                    aux.DNI = (string)datos.Lector["DNI"];
                    aux.Telefono = (string)datos.Lector["Numero"];
                }
                return aux;
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        public void editarMedico(Medico medico)
        {
            //datos.setStoreProcedure();
        }
    }
}
