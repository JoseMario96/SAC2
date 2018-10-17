using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using MySql.Data.MySqlClient;

namespace SAC.metodos
{
    public class metodos_Citas
    {
        consulta.consulta consultar = new consulta.consulta();
        conexion.conexion con = new conexion.conexion();
        public DataTable mostrarCita()
        {
            string consulta = "select * from tbl_cita ;";
            MySqlCommand comando = new MySqlCommand(consulta, con.abrir_conexion());
            MySqlDataAdapter da = new MySqlDataAdapter(comando);
            using (DataTable dt = new DataTable())
            {
                da.Fill(dt);
                return dt;
            }
        }
        public int cantidad()
        {
            int conteo = 0;
            MySqlDataReader busqueda = consultar.ejecutar_consulta("select count(*) from tbl_cita;", con.abrir_conexion()).ExecuteReader();
            while (busqueda.Read())
            {
                conteo = Convert.ToInt32(busqueda.GetString(0));
            }
            return conteo;
        }
    }
}