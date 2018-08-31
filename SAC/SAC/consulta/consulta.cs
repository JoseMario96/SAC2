using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MySql.Data.MySqlClient;

namespace SAC.consulta
{
    public class consulta
    {
        public consulta()
        {
        }
        public MySqlCommand ejecutar_consulta(String consulta, MySqlConnection con)
        {

            MySqlCommand comando;
            try
            {
                comando = new MySqlCommand(consulta, con);
            }
            catch (MySqlException)
            {
                comando = null;
            }
            return comando;
        }
    }
}