using MySql.Data.MySqlClient;
using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SAC.metodos
{
    public class metodosExpediente
    {
        consulta.consulta consultar = new consulta.consulta();
        conexion.conexion con = new conexion.conexion();

        public void agregarExpediente(String ced, String fechT, String codT, String obs)
        {
            MySqlDataReader agregar = consultar.ejecutar_consulta("INSERT INTO `bd_sac`.`tbl_paciente` (`cedulaPaciente`, `nombre1Paciente`, `nombre2Paciente`, `apellido1Paciente`, `apellido2Paciente`, `generoPaciente`, `telefonoPaciente`, `celularPaciente`, `direccionPaciente`, `encargadoPaciente`, `correoPaciente`, `fechaNacimientoPaciente`, `fechaInscripcionPaciente`) VALUES(' " + ced + " ', ' " + fechT + " ', ' " + codT + " ', ' " + obs + " ');", con.abrir_conexion()).ExecuteReader();
            con.cerrar_Conexion();
        }

        public DataTable BuscarExpediente()
        {
            string consulta = "select tbl_expediente.codigoExpediente, tbl_expediente.cedulaPaciente, tbl_paciente.nombre1Paciente, tbl_paciente.apellido1Paciente, tbl_paciente.apellido2Paciente from tbl_expediente, tbl_paciente where tbl_paciente.cedulaPaciente = tbl_expediente.cedulaPaciente;";
            MySqlCommand comando = new MySqlCommand(consulta, con.abrir_conexion());
            MySqlDataAdapter da = new MySqlDataAdapter(comando);
            using (DataTable dt = new DataTable())
            {
                da.Fill(dt);
                return dt;
            }

        }

        public String[] BuscarPaciente(String ced)
        {
            string[] paciente = new string[5];
            MySqlDataReader busqueda = consultar.ejecutar_consulta("select tbl_expediente.cedulaPaciente, tbl_paciente.nombre1Paciente, tbl_paciente.nombre2Paciente, tbl_paciente.apellido1Paciente, tbl_paciente.apellido2Paciente from tbl_expediente, tbl_paciente where tbl_paciente.cedulaPaciente = tbl_expediente.cedulaPaciente and tbl_expediente.cedulaPaciente = "+ced+";", con.abrir_conexion()).ExecuteReader();
            while (busqueda.Read())
            {
                paciente[0] = busqueda.GetString(0);
                paciente[1] = busqueda.GetString(1);
                paciente[2] = busqueda.GetString(2);
                paciente[3] = busqueda.GetString(3);
                paciente[4] = busqueda.GetString(4);
            }
            con.cerrar_Conexion();
            return paciente;
        }
    }

}