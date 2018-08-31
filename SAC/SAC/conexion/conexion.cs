using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MySql.Data.MySqlClient;

namespace SAC.conexion
{
    public class conexion
    {
        private MySqlConnection con;

        public MySqlConnection Abrir_conexion()
        {
            try
            {
                con = new MySqlConnection("server=localhost;user id=root;password=Jose.150396;database=bd_sac; SslMode=none");
                con.Open();
            }
            catch (MySqlException)
            {
                con = null;
            }
            return con;
        }

        public MySqlConnection Cerrar_conexion()
        {
            con.Close();
            return con;
        }
    }
}