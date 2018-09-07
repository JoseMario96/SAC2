using MySql.Data.MySqlClient;

namespace SAC.conexion
{
    public class conexion
    {
        MySql.Data.MySqlClient.MySqlConnection conn;

        private string myConnectionString = "server=127.0.0.1;user=root;database=bd_sac;password=Tuanis13;SslMode=none;";

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