using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public class Medico : Persona //Usuario
    {
        public int Id_Medico { get; set; }
        public int Matrícula { get; set; }
        public int Legajo { get; set; }
        public List<Especialidad> Especialidades { get; set; }
        public List<JornadaMedicos> HorariosLaborables { get; set; }
        public List<Turno> TurnosAsignados { get; set; } //La agenda es un listado de los turnos que un médico por día

    }
}
