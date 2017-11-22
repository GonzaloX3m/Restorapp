namespace Restorapp_V2.Model
{
    public class TipoUsuario
    {
        private int id;
        private string descripcion;

        ~TipoUsuario() { }

        public int Id { get => id; set => id = value; }
        public string Descripcion { get => descripcion; set => descripcion = value; }

        public override string ToString() => descripcion;
    }
}