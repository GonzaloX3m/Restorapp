using System;
namespace Restorapp.Model
{
    public class Historico
    {
        private int id;
        private int idDespachado;
        private string nomMesero;
        private int numMesa;
        private string nomPlato;
        private DateTime fechaPedido;
        private DateTime fechaDeDespacho;

        public Historico() { }
        ~Historico() { }

        public int Id { get => id; set => id = value; }
        public int IdDespachado { get => idDespachado; set => idDespachado = value; }
        public string NomMesero { get => nomMesero; set => nomMesero = value; }
        public int NumMesa { get => numMesa; set => numMesa = value; }
        public string NomPlato { get => nomPlato; set => nomPlato = value; }
        public DateTime FechaPedido { get => fechaPedido; set => fechaPedido = value; }
        public DateTime FechaDeDespacho { get => fechaDeDespacho; set => fechaDeDespacho = value; }
    }
}