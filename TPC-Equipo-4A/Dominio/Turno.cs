using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public class Turno
    {
        public long ID_Turno { get; set; }
        public long IdMedico { get; set; }
        public long IdPaciente { get; set; }
        public DateTime Fecha{ get; set; }
        public TimeSpan Hora {  get; set; }
        public string Estado { get; set; } // "Nuevo", "Reprogramado", etc.
        //public TimeSpan Hora { get; set; }
        //public string Observaciones { get; set; }
    }
}
