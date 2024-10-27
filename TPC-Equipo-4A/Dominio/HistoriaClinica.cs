using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public class HistoriaClinica
    {
        public int Id_HistoriaClinica { get; set; }
        public int Id_Paciente { get; set; }
        public List<Consulta> Consultas { get; set; }
        //public DateTime FechaConsulta { get; set; }
        //public string Diagnostico { get; set; }
        //public string Tratamiento { get; set; }
        //public string Comentarios { get; set; }
        //public Medico Medico { get; set; }
    }
}
