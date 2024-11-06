using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dominio;

namespace Negocio
{
    public class EspecialidadNegocio
    {
        AccesoDatos datos = new AccesoDatos();
        public List<Especialidad> listarConSP() {
            List<Especialidad> lista = new List<Especialidad>();
            try
            {
                datos.setStoreProcedure("storedProcedureListarEspecialidad");
                datos.ejecutarLectura();
                while (datos.Lector.Read())
                {
                    Especialidad aux = new Especialidad();
                    aux.Id_Especialidad = (int)datos.Lector.GetInt64(0);
                    aux.Descripcion = (string)datos.Lector["Nombre_E"];

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
