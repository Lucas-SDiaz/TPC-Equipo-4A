using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public class PersonalMedico : Usuario
    {
        public int Id_PersonalMedico { get; set; }
        public string Legajo { get; set; }
        public List<Especialidad> Especialidades { get; set; }
        public List<Turno> Turnos { get; set; } //La agenda es un listado de los turnos que un médico por día
       
        //public Agenda DiasYHorarios { get; set; } 

    }
}
