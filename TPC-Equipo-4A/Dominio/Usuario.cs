using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public enum Perfil
    {
        Administrador = 0,
        Medico = 1,
        PersonalAdministrativo = 2,
        Paciente = 3
    }
    public class Usuario
    {
        public int Id_Usuario { get; set; }
        public Perfil Perfil { get; set; }
        public string Email { get; set; }
        public string Contraseña { get; set; }
    }
}
