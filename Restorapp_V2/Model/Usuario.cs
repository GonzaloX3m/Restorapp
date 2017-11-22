using System;

namespace Restorapp_V2.Model
{
    public class Usuario
    {
        private int id;
        private string nombre;
        private bool disponible;
        private string username;
        private string pass;
        private int tipoUsuario;

        ~Usuario() { }

        public int Id { get => id; set => id = value; }
        public string Nombre { get => nombre; set => nombre = value; }
        public bool Disponible { get => disponible; set => disponible = value; }
        public string Username { get => username; set => username = value; }
        public string Pass { get => pass; set => pass = value; }
        public int TipoUsuario { get => tipoUsuario; set => tipoUsuario = value; }

        public override string ToString() => nombre;

        public static implicit operator Usuario(Usuario v)
        {
            throw new NotImplementedException();
        }
    }
}