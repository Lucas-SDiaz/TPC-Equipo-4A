using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dominio;

namespace Negocio
{
    public class TurnoNegocio
    {
        AccesoDatos datos = new AccesoDatos();

        public Turno agregarTurno(Turno turno)
        {
            try
            {
                datos.setStoreProcedure("GuardarTurnoSP");
                datos.setParameters("@idPaciente", turno.IdPaciente.ToString());
                datos.setParameters("@idMedico", turno.IdMedico.ToString());
                datos.setParameters("@fechaTurno", turno.Fecha);
                datos.setParameters("@horaTurno", turno.Hora);

                datos.ejecutarAccion();
            }
            catch (Exception ex)
            {
                throw new Exception("Error de conexión de SQL: " + ex.Message, ex);
            }
            finally
            {
                datos.cerrarConexion();
            }
            return turno;
        }

        //public List<Turno> listarTurnos()
        //{
        //    List<Turno> listaTurnos = new List<Turno>();
        //    try
        //    {
        //        datos.setStoreProcedure("listarTurnosSP");
        //        datos.ejecutarLectura();
        //        while (datos.Lector.Read())
        //        {
        //            Turno aux = new Turno();
        //            aux.ID_Turno = (int)datos.Lector["ID_Turno"];
        //            aux.Paciente = new Paciente();
        //            aux.Paciente.Id_Paciente = (int)datos.Lector["ID_Paciente"];
        //            aux.Paciente.NombreYApellido = (string)datos.Lector["Nombre Y Apellido"];
        //        }

        //        return listaTurnos;
        //    }
        //}
    }
}
