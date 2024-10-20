using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public class JornadaMedicos
    {
        public int ID_Jornada { get; set; }
        public Medico Medico { get; set; }
        public string DiaSemana { get; set; } 
        public TimeSpan HoraInicio { get; set; } // Hora de inicio
        public TimeSpan HoraFin { get; set; } // Hora de fin
        public bool Estado { get; set; } 

    }
}
