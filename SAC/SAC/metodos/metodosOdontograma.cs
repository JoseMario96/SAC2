using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

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
                //stringArray1[0] = actualizar.GetString(0);
                //stringArray1[1] = actualizar.GetString(1);
                //stringArray1[2] = actualizar.GetString(2);
                stringArray1[3] = actualizar.GetString(3);
            }
            con.cerrar_Conexion();
            return stringArray1;
        }
    }
}