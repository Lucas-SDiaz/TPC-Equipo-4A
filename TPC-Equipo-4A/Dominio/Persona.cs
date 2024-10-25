using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public class Persona
    {
        public int Id_Usuario { get; set; }
        public int Id_Persona { get; set; }
        public string NombreYApellido { get; set; }
        public DateTime FechaNacimiento { get; set; }
        public int Dni { get; set; }
        public string Email { get; set; }
        public Domicilio Domicilio { get; set; }
        public int Telefono { get; set; }
        public bool Estado { get; set; }

    }
}
