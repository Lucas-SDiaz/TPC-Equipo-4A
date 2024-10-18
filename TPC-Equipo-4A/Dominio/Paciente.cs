using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public class Paciente : Usuario
    {
        public int Id { get; set; }
        public int HistoriaClinica { get; set; }
        public int Documento { get; set; }
        public DateTime FechaNacimiento { get; set; }
        public string Celular { get; set; }
        public string Sexo { get; set; }
        public ObraSocial ObraSocial { get; set; }  // Relación con ObraSocial
        public List<Turno> Turnos { get; set; } //Relacion con Turno
    }
}
