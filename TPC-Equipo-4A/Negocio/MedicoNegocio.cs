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
    }
}
