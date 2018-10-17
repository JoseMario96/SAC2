using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MySql.Data.MySqlClient;
using System.Data;

namespace SAC.metodos
{
    public class metodosOdontograma
    {
        consulta.consulta consultar = new consulta.consulta();
        conexion.conexion con = new conexion.conexion();

        public void agregarOdontograma(String col, String die, String secc)
        {
            consultar.ejecutar_consulta("INSERT INTO `bd_sac`.`tbl_odontograma` (`colorOdontograma`, `dienteOdontograma`, `seccionOdontograma`) VALUES ('" + col + "', '" + die + "', '" + secc + "');", con.abrir_conexion()).ExecuteNonQuery();
            con.cerrar_Conexion();
        }

        public DataTable Paciente()
        {
            string consulta = "SELECT cedulaPaciente, nombre1Paciente , apellido1Paciente, apellido2Paciente FROM tbl_paciente";
            MySqlCommand comando = new MySqlCommand(consulta, con.abrir_conexion());
            MySqlDataAdapter da = new MySqlDataAdapter(comando);
            using (DataTable dt = new DataTable())
            {
                da.Fill(dt);
                return dt;
            }
        }
        public int buscarExpediente(int codigoE)
        {

            int estado = 0; string resultado = "";
            MySqlDataReader existencia = consultar.ejecutar_consulta("select codigoExpediente from tbl_expedienteodontograma where codigoExpediente = '" + codigoE + "'; ", con.abrir_conexion()).ExecuteReader();
            while (existencia.Read())
            {
                resultado = existencia.GetString(0);
            }
            if (resultado != "")
            {
                estado = 1;
            }

            return estado;
           
        }
    }
}