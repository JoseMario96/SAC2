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

        public void agregarOdontograma2(String marc)
        {

            consultar.ejecutar_consulta("INSERT INTO `bd_sac`.`tbl_odontograma` (`marcaOdontograma`) VALUES ('" + marc + "');", con.abrir_conexion()).ExecuteNonQuery();
            con.cerrar_Conexion();
        }
        public String[] buscarOdontograma(String odo)
        {
            string[] stringArray1 = new string[4];
            MySqlDataReader actualizar = consultar.ejecutar_consulta("SELECT colorOdontograma, dienteOdontograma,seccionOdontograma,marcaOdontograma FROM bd_sac.tbl_odontograma where codigoOdontograma = '" + odo + "'; ", con.abrir_conexion()).ExecuteReader();
            while (actualizar.Read())
            {
                stringArray1[0] = actualizar.GetString(0);
                stringArray1[1] = actualizar.GetString(1);
                stringArray1[2] = actualizar.GetString(2);
                stringArray1[3] = actualizar.GetString(3);
            }
            con.cerrar_Conexion();
            return stringArray1;
        }
        public int cantidadOdontograma(String codE)
        {
   
            string y = "";
            int z = 0;
            MySqlDataReader contador = consultar.ejecutar_consulta("select count(codigoOdontograma) from tbl_expedienteodontograma where codigoExpediente = '" + codE + "'; ", con.abrir_conexion()).ExecuteReader();
            if (contador.Read())
            {
                y = contador.GetString(0);
            }
            z = Int32.Parse(y);

            return z;
        }
        public string[] buscarPaciente(String codE)
        {
            int x = 0;
            int z = 0;
           z= cantidadOdontograma(codE);
            string[] stringArray1 = new string[z];
            MySqlDataReader actualizar = consultar.ejecutar_consulta("SELECT codigoOdontograma FROM bd_sac.tbl_expedienteodontograma where codigoExpediente = '" + codE + "'; ", con.abrir_conexion()).ExecuteReader();
            while (actualizar.Read())
            {
                stringArray1[x] = actualizar.GetString(0);
                x++;
            }
            con.cerrar_Conexion();
            return stringArray1;
        }
    }
}