using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public class Paciente : Persona
    {
       public int Id_Paciente { get; set; }
        public DateTime FechaNacimiento { get; set; }
        public HistoriaClinica HistoriaClinica { get; set; }
        public List<Turno> Turnos { get; set; } 
        public Domicilio Domicilio { get; set; }


        public string FechaNaciemiento()
        {
            return FechaNacimiento.ToString("yyyy-MM-dd");
        }
       // //public int HistoriaClinica { get; set; }
       // public string NombreYApellido { get; set; }
       // public string DNI { get; set; }
       // public string Email { get; set; }
       // //public string Sexo { get; set; }
       // public string Celular { get; set; }
       // public string Telefono { get; set; }
        //public ObraSocial ObraSocial { get; set; }
    }
}
