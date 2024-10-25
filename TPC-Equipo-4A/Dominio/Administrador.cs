using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public class Administrador : Usuario
    {
        public int Id_Administrador { get; set; }
        public int Legajo { get; set; }
    }
}
