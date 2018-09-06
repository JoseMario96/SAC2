using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace SAC.metodos
{
    public class Buscar
    {
        conexion.conexion con = new conexion.conexion();
        public DataTable Filtrar(String dato)
        {
            string consulta = "SELECT cedulaPaciente AS 'Cédula', nombre1Paciente AS 'Primer Nombre', apellido1Paciente AS 'Primer Apellido', apellido2Paciente AS 'Segundo Apellido' FROM tbl_paciente where cedulaPaciente like '" + dato + "%'; ";
            MySqlCommand comando = new MySqlCommand(consulta, con.abrir_conexion());
            MySqlDataAdapter da = new MySqlDataAdapter(comando);
            using (DataTable dt = new DataTable())
            {
                da.Fill(dt);
                return dt;
            }
        }
    }
}