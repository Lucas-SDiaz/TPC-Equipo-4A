using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public class Usuario
    {
        //public int Id_Usuario { get; set; } 
        //public string Legajo { get; set; }
        //public string NombreYApellido { get; set; }
        //public string Email { get; set; }
        //public string Contraseña { get; set; }
        //public Perfil Perfil { get; set; }
        public int Id_Usuario { get; set; }
        public string NombreUsuario { get; set; }
        public string Contraseña { get; set; }
        public Perfil Perfil { get; set; }

    }
}
