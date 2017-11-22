using System.Collections.Generic;

namespace Restorapp_V2.Model
{
    public class Data
    {
        private Conexion con;

        public Data()
        {
            con = new Conexion("db_restoapp");
        }

        public List<Plato> GetPlatos()
        {
            List<Plato> listPlato = new List<Plato>();
            con.Ejecutar(query: "SELECT * FROM tbl_menu");
            Plato m;
            while (con.rs.Read())
            {
                m = new Plato
                {
                    Id = con.rs.GetInt32(0),
                    Nombre = con.rs.GetString(1),
                    Precio = con.rs.GetInt32(2)
                };
                listPlato.Add(m);
            }
            return listPlato;
        }

        public List<Plato> GetPlato(string filtro, int id)
        {
            List<Plato> listPlato = new List<Plato>();
            con.Ejecutar(query: $"SELECT * FROM tbl_menu WHERE nombre LIKE %{filtro}% OR id = {id}");
            Plato m;
            if (con.rs.Read())
            {
                m = new Plato
                {
                    Id = con.rs.GetInt32(0),
                    Nombre = con.rs.GetString(1),
                    Precio = con.rs.GetInt32(2)
                };
                listPlato.Add(m);
            }
            return listPlato;
        }

        public void AgregarMesa()
        {
            con.Ejecutar("INSERT INTO tbl_mesa VALUES(" + (GetAllMesas().Count + 1) + ");");
        }

        public void AgregarPlato(Plato m)
        {
            string query = $"INSERT INTO tbl_menu VALUES('{m.Nombre}',{m.Precio});";
            con.Ejecutar(query);
        }

        public void AgregarUsuario(Usuario m)
        {
            string query = $"INSERT INTO tbl_usuario VALUES('{m.Nombre}','{m.Username}', DEFAULT,'{m.Pass}',{m.TipoUsuario});";
            con.Ejecutar(query);
        }

        public List<TipoUsuario> GetTipoUsuario()
        {
            List<TipoUsuario> listTUsuario = new List<TipoUsuario>();
            TipoUsuario tipoUsuario;
            con.Ejecutar("SELECT * FROM tbl_tipoUsuario;");
            while (con.rs.Read())
            {
                tipoUsuario = new TipoUsuario
                {
                    Id = con.rs.GetInt32(0),
                    Descripcion = con.rs.GetString(1)
                };
                listTUsuario.Add(tipoUsuario);
            }
            return listTUsuario;
        }

        public List<Usuario> GetMeseros()
        {
            List<Usuario> listMeseros = new List<Usuario>();
            con.Ejecutar("SELECT * FROM tbl_usuario WHERE fk_tipoUsu = 3");
            Usuario m;
            while (con.rs.Read())
            {
                m = new Usuario
                {
                    Id = con.rs.GetInt32(0),
                    Nombre = con.rs.GetString(1),
                    Disponible = con.rs.GetBoolean(2),
                    Username = con.rs.GetString(3),
                    Pass = con.rs.GetString(4),
                    TipoUsuario = con.rs.GetInt32(5)
                };
                listMeseros.Add(m);
            }
            return listMeseros;
        }
        public List<Usuario> GetMeserosDisponibles()
        {
            List<Usuario> listMeseros = new List<Usuario>();
            foreach (Usuario u in GetMeseros())
            {
                if (u.Disponible)
                {
                    listMeseros.Add(u);
                }
            }
            return listMeseros;
        }

        public List<Usuario> GetAdmins()
        {
            List<Usuario> listAdmins = new List<Usuario>();
            con.Ejecutar("SELECT * FROM tbl_usuario WHERE fk_tipoUsu = 1");
            Usuario m;
            while (con.rs.Read())
            {
                m = new Usuario
                {
                    Id = con.rs.GetInt32(0),
                    Nombre = con.rs.GetString(1),
                    Disponible = con.rs.GetBoolean(2),
                    Username = con.rs.GetString(3),
                    Pass = con.rs.GetString(4),
                    TipoUsuario = con.rs.GetInt32(5)
                };
                listAdmins.Add(m);
            }
            return listAdmins;
        }

        public List<Usuario> GetCocineros()
        {
            List<Usuario> listCocineros = new List<Usuario>();
            con.Ejecutar("SELECT * FROM tbl_usuario WHERE fk_tipoUsu = 2");
            Usuario m;
            while (con.rs.Read())
            {
                m = new Usuario
                {
                    Id = con.rs.GetInt32(0),
                    Nombre = con.rs.GetString(1),
                    Disponible = con.rs.GetBoolean(2),
                    Username = con.rs.GetString(3),
                    Pass = con.rs.GetString(4),
                    TipoUsuario = con.rs.GetInt32(5)
                };
                listCocineros.Add(m);
            }
            return listCocineros;
        }

        public void ActualizarEstadoMesero(Usuario u)
        {
            con.Ejecutar("UPDATE tbl_usuario SET disponible = " + !u.Disponible + " WHERE id = " + u.Id + "");
        }

        public List<Usuario> GetCocinerosDisponibles()
        {
            List<Usuario> listCocineros = new List<Usuario>();
            foreach (Usuario u in GetCocineros())
            {
                if (u.Disponible)
                {
                    listCocineros.Add(u);
                }
            }

            return listCocineros;
        }

        public List<Pedido> GetPedidos()
        {
            List<Pedido> listPedido = new List<Pedido>();
            con.Ejecutar(query: "SELECT tbl_pedido.id,tbl_usuario.nombre AS Mesero," +
                "tbl_mesa.id AS Mesa, tbl_menu.nombre AS Plato,tbl_menu.valor " +
                "AS Precio, tbl_pedido.fecha AS[Fecha Pedido] FROM tbl_usuario, " +
                "tbl_mesa, tbl_menu, tbl_pedido WHERE tbl_usuario.id = tbl_pedido.fk_usuario " +
                "AND tbl_mesa.id = tbl_pedido.fk_mesa AND tbl_menu.id = tbl_pedido.fk_plato ORDER " +
                "BY tbl_pedido.fecha ASC");
            Pedido p;
            while (con.rs.Read())
            {
                p = new Pedido
                {
                    Id = con.rs.GetInt32(0),
                    NombreMesero = con.rs.GetString(1),
                    NumMesa = con.rs.GetInt32(2),
                    NomPlato = con.rs.GetString(3),
                    Precio = con.rs.GetInt32(4),
                    FechaPedido = con.rs.GetDateTime(5)
                };
                listPedido.Add(p);
            }
            return listPedido;
        }

        public int VerificarUsuario(string user, string pass)
        {
            int verificacor = 0;
            string query = $"SELECT COUNT(*) FROM tbl_usuario WHERE username = {user}AND pass = {pass}";
            con.Ejecutar(query);
            if (con.rs.Read())
            {
                verificacor = con.rs.GetInt32(0);
            }
            return verificacor;
        }

        public List<Mesa> GetAllMesas()
        {
            Mesa m;
            List<Mesa> listMesas = new List<Mesa>();
            string query = "SELECT * FROM tbl_mesa;";
            con.Ejecutar(query);
            while (con.rs.Read())
            {
                m = new Mesa
                {
                    Id = con.rs.GetInt32(0),
                    Dsponible = con.rs.GetBoolean(1)
                };
                listMesas.Add(m);
            }
            return listMesas;
        }

        public List<Mesa> GetMesasDisponibles()
        {
            List<Mesa> listMesasDisponibles = new List<Mesa>();
            foreach (Mesa m in GetAllMesas())
            {
                if (m.Dsponible)
                {
                    listMesasDisponibles.Add(m);
                }
            }
            return listMesasDisponibles;
        }
        public List<Mesa> GetMesasNoDisponibles()
        {
            List<Mesa> listMesasNoDisponibles = new List<Mesa>();
            foreach (Mesa m in GetAllMesas())
            {
                if (!m.Dsponible)
                {
                    listMesasNoDisponibles.Add(m);
                }
            }
            return listMesasNoDisponibles;
        }



    }
}