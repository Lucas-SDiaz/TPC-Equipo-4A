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
                    //aux.Estado = (bool)datos.Lector["Estado"];
                    //if (aux.Estado)
                    
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
        public bool IngresarEspecialidad(Especialidad aux)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setStoreProcedure("storedProcedureInsertarEspecialidad");
                datos.setParameters("@Descripcion", aux.Descripcion);
                datos.ejecutarAccion();
                return true;
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
        public bool BajaEspecialidad(Especialidad especialidad)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setStoreProcedure("storedProcedureBajaEspecialidad");
                datos.setParameters("@ID_Especialidad", especialidad.Id_Especialidad);
                datos.ejecutarAccion();
                return true;
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
        //public int ContarRegistros()
        //{
        //    List<Especialidad> lista = new List<Especialidad>();
        //    try
        //    {
        //        datos.setStoreProcedure("storedProcedureListarEspecialidad");
        //        datos.ejecutarLectura();
        //        while (datos.Lector.Read())
        //        {
        //            Especialidad aux = new Especialidad();
        //            aux.Id_Especialidad = (int)datos.Lector.GetInt64(0);
        //            aux.Descripcion = (string)datos.Lector["Nombre_E"];
        //            aux.Estado = (bool)datos.Lector["Estado"];
        //            lista.Add(aux);
        //        }
        //        return lista.Count;
                
        //    }
        //    catch (Exception ex)
        //    {

        //        throw ex;
        //    }
        //    finally
        //    {
        //        datos.cerrarConexion();
        //    }
        //}
    }
}
