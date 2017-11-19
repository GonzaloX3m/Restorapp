using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Restorapp.Model
{
    public class Mesero
    {
        private int id;
        private string nombre;

        ~Mesero() { }

        public int Id { get => id; set => id = value; }
        public string Nombre { get => nombre; set => nombre = value; }

        public override string ToString() => nombre;
    }
}