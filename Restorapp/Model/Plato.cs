namespace Restorapp.Model
{
    public class Plato
    {
        private int id;
        private string nombre;
        private int precio;

        ~Plato() { }

        public int Id { get => id; set => id = value; }
        public string Nombre { get => nombre; set => nombre = value; }
        public int Precio { get => precio; set => precio = value; }

        public override string ToString() => nombre;
    }
}