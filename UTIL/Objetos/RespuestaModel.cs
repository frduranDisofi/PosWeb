﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace UTIL.Objetos
{
    public class RespuestaModel
    {
        private bool _Verificador;
        private string _Mensaje;
        private int _NumInt;

        public bool Verificador { get => _Verificador; set => _Verificador = value; }
        public string Mensaje { get => _Mensaje; set => _Mensaje = value; }
        public int NumInt { get => _NumInt; set => _NumInt = value; }
    }
}
