﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public class JornadaMedicos
    {
        public int ID_Jornada { get; set; }
        public int Id_Medico { get; set; }
        //public string DiaSemana { get; set; } 
        public byte DiaSemana { get; set; }
        public TimeSpan HoraInicio { get; set; } // Hora de inicio
        public TimeSpan HoraFin { get; set; } // Hora de fin
        public List<string> HorariosDisponibles { get; set; }
        public bool Estado { get; set; } 
        public JornadaMedicos() { }
        public JornadaMedicos(byte dia, string he, string hs)
        {
            DiaSemana = dia;
            HoraInicio = TimeSpan.Parse(he);
            HoraFin = TimeSpan.Parse(hs);
        }
    }
}
