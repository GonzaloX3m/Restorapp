
using System;
using System.Data;

namespace Restorapp.Model
{
    public class Pedido
    {
        private int id;
        private string nombreMesero;
        private int numMesa;
        private string nomPlato;
        private int precio;
        private DateTime fechaPedido;
        public Pedido(){}
        ~Pedido() { }

        public int Id { get => id; set => id = value; }
        public string NombreMesero { get => nombreMesero; set => nombreMesero = value; }
        public int NumMesa { get => numMesa; set => numMesa = value; }
        public string NomPlato { get => nomPlato; set => nomPlato = value; }
        public int Precio { get => precio; set => precio = value; }
        public DateTime FechaPedido { get => fechaPedido; set => fechaPedido = value; }
    }
}