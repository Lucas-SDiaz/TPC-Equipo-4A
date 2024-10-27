using Dominio;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
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
                    aux.NombreYApellido = (string)datos.Lector["Nombre Y apellido"];
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
    }
}
