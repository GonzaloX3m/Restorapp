﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
/*imports*/
using System.Data;
using System.Data.SqlClient;
/*imports*/

namespace Restorapp.Model
{
    public class Conexion
    {
        private SqlConnection con; // Connection
        private SqlCommand sen; // Statement
        public SqlDataReader rs; // ResultSet

        public Conexion(String bd)
        {
            try
            {
                con = new SqlConnection(
                            "Data Source=localhost;" +
                            "Initial Catalog=" + bd + "; " +
                            "User id=sa; " +
                            "Password=123456;"
                        );
            }
            catch (Exception)
            {
                con = new SqlConnection(
                    "Data Source=localhost;" +
                    "Initial Catalog=" + bd + ";" +
                    "Integrated Security=SSPI;"
                );

            }
        }

        public void Ejecutar(String query)
        {
            //Console.WriteLine("QUERY=" + query);

            con.Open();
            sen = new SqlCommand(query, con);

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
            con.Close();
        }
    }
}