using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Restorapp.Model
{
    public class Menu
    {
        private int id;
        private string nombre;
        private int precio;

        public int Id { get => id; set => id = value; }
        public string Nombre { get => nombre; set => nombre = value; }
        public int Precio { get => precio; set => precio = value; }

        public override string ToString() => nombre;
    }
}