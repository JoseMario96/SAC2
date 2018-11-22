using MySql.Data.MySqlClient;

namespace SAC.conexion
{
    public class conexion
    {
        MySql.Data.MySqlClient.MySqlConnection conn;

        private string myConnectionString = "server=204.93.216.11;user=alina23_jose;database=alina23_bd_sac;password=1234abcd;SslMode=none;";

        public MySqlConnection abrir_conexion()
        {
            try
            {
                conn = new MySqlConnection(myConnectionString);
                conn.Open();
            }
            catch (MySqlException)
            {
                conn = null;
            }
            return conn;
        }

        public MySqlConnection cerrar_Conexion()
        {
            conn.Close();
            return conn;
        }
    }
}