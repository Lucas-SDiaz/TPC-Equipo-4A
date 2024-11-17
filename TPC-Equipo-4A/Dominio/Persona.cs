using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public class Persona
    {

        public int Id_Persona { get; set; }
        public string Nombre { get; set; }
        public string Apellido { get; set; }
        public string Telefono { get; set; }
        public string DNI { get; set; }
        public Usuario Usuario { get; set; }
        public bool Estado { get; set; }
        public DateTime FechaRegistro { get; set; }
        public string NombreCompleto => $"{Apellido}, {Nombre}";
        public string FechaReg()
        {
            return FechaRegistro.ToString("dd-MM-yyyy");
        }

    }
}
