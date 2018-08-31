using MySql.Data.MySqlClient;
using System;


namespace SAC.metodosPaciente
{
    public class metodosPaciente
    {
        consulta.consulta consultar = new consulta.consulta();
        conexion.conexion con = new conexion.conexion();

        public void Agregarcita(String cedula, String fecha, String hora, String telefono)
        {
            MySqlDataReader insertar = consultar.ejecutar_consulta("INSERT INTO `bd_sac`.`tbl_cita` (cedulaPaciente, fechaReservaCita, horaCita, telefonoCita) values(' " + cedula + " ', ' " + fecha + " ', ' " + hora + " ', ' " + telefono + " ');", con.abrir_conexion()).ExecuteReader();
            con.cerrar_Conexion();
        }
    }
}