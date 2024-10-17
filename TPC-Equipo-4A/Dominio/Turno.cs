using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public class Turno
    {
        public int Id_Turno { get; set; }
        public DateTime Fecha { get; set; }
        public DateTime Hora { get; set; }
        public Paciente Paciente { get; set; }
        public PersonalMedico Medico { get; set; }
        public EstadoTurno Estado { get; set; }
        public string Observaciones { get; set; }
    }
}
