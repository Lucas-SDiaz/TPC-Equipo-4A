using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public class Consulta
    {
        public int Id_Consulta {  get; set; }
        public int Id_Paciente { get; set; }
        public int Id_Medico { get; set; }
        public DateTime FechaConsulta { get; set; }
        public string Diagnostico { get; set; }
        public string Tratamiento { get; set; }
        public string Comentarios { get; set; }
    }
}
