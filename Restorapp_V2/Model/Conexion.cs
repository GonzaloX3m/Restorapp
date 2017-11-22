using System;
/*imports*/
using System.Data.SqlClient;
/*imports*/

namespace Restorapp_V2.Model
{
    public class Conexion
    {
        private SqlConnection conn; // Connection
        private SqlCommand sen; // Statement
        public SqlDataReader rs; // ResultSet

        public Conexion(String bd)
        {
            try
            {
                conn = new SqlConnection(
                            "Data Source=localhost;" +
                            "Initial Catalog=" + bd + "; " +
                            "User id=sa; " +
                            "Password=123456;"
                        );
            }
            catch (Exception)
            {
                conn = new SqlConnection(
                    "Data Source=localhost;" +
                    "Initial Catalog=" + bd + ";" +
                    "Integrated Security=SSPI;"
                );

            }
        }

        public void Ejecutar(String query)
        {
            Cerrar();
            conn.Open();
            sen = new SqlCommand(query, conn);

            if (query.ToLower().Contains("select"))
            {
                rs = sen.ExecuteReader();
            }
            else
            { //insert, update, delete
                sen.ExecuteNonQuery();
                Cerrar();
            }
        }

        public void Cerrar()
        {
            conn.Close();
        }
    }
}