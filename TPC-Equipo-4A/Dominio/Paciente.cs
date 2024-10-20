﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public class Paciente
    {
        public int Id_Paciente { get; set; }
        public int HistoriaClinica { get; set; }
        public int DNI { get; set; }
        public string Sexo { get; set; }
        public DateTime FechaNacimiento { get; set; }
        public string Celular { get; set; }
        public string Telefono { get; set; }
        public List<Turno> Turnos { get; set; } //Relacion con Turno
    }
}
