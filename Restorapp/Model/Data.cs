using System.Collections.Generic;

namespace Restorapp.Model
{
    public class Data
    {
        private List<Plato> listaPlatos;
        private List<Mesero> listMeseros;
        private List<Mesa> listMesas;
        private List<Pedido> listPedidos;
        private List<Historico> listHistorial;
        private Conexion con;

        public Data()
        {
            con = new Conexion("db_restoapp");
            listaPlatos = new List<Plato>();
            listMeseros = new List<Mesero>();
            listMesas = new List<Mesa>();
            listPedidos = new List<Pedido>();
            GetPlatos();
        }

        public List<Plato> GetPlatos()
        {   
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
                listaPlatos.Add(m);
            }
            return listaPlatos;
        }

        public void CrearPlato(Plato m)
        {
            string query = $"INSERT INTO tbl_menu VALUES('{m.Nombre}',{m.Precio});";
            con.Ejecutar(query);
        }

        public void CrearMesero(Mesero m)
        {
            string query = $"INSERT INTO tbl_mesero VALUES('{m.Nombre}');";
            con.Ejecutar(query);
        }

        public List<Mesero> GetMeseros()
        {
            
            con.Ejecutar("SELECT * FROM tbl_mesero");
            Mesero m;
            while (con.rs.Read())
            {
                m = new Mesero
                {
                    Id = con.rs.GetInt32(0),
                    Nombre = con.rs.GetString(1)
                };
                listMeseros.Add(m);
            }
            return listMeseros;
        }

        public List<Pedido> GetPedidos()
        {
            con.Ejecutar("SELECT tbl_pedido.id,tbl_mesero.nombre AS Mesero," +
                "tbl_mesa.id AS Mesa, tbl_menu.nombre AS Plato,tbl_menu.valor " +
                "AS Precio, tbl_pedido.fecha AS[Fecha Pedido] FROM tbl_mesero, " +
                "tbl_mesa, tbl_menu, tbl_pedido WHERE tbl_mesero.id = tbl_pedido.fk_mesero " +
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
                listPedidos.Add(p);
            }
            return listPedidos;
        }
    }
}