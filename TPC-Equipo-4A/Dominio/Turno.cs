using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public class Turno
    {
        public int ID_Turno { get; set; }
        public int Id_Paciente { get; set; }
        public int Id_Medico { get; set; }
        public DateTime FechaYHora { get; set; }
        public string Estado { get; set; } // "Nuevo", "Reprogramado", etc.
        //public TimeSpan Hora { get; set; }
        //public string Observaciones { get; set; }
    }
}
