using MySql.Data.MySqlClient;
using System;
using System.Collections;
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
            String[] paciente = new string[47];
            MySqlDataReader busqueda = consultar.ejecutar_consulta("select tbl_expediente.*, tbl_paciente.nombre1Paciente, tbl_paciente.nombre2Paciente, tbl_paciente.apellido1Paciente, tbl_paciente.apellido2Paciente from tbl_expediente, tbl_paciente where tbl_paciente.cedulaPaciente = tbl_expediente.cedulaPaciente and tbl_expediente.cedulaPaciente = " + ced +";", con.abrir_conexion()).ExecuteReader();
            while (busqueda.Read())
            {
                for (int i = 0; i <= 46; i++)
                {
                    if (busqueda.IsDBNull(i))
                    {
                        paciente[i] = "";
                    }
                    else
                    {
                        paciente[i] = busqueda.GetString(i);
                    }
                    
                }
                //paciente[0] = busqueda.GetString(0);
                //paciente[1] = busqueda.GetString(1);
                //paciente[2] = busqueda.GetString(2);
                //paciente[3] = busqueda.GetString(3);
                //paciente[4] = busqueda.GetString(4);
                //paciente[5] = busqueda.GetString(5);
                //paciente[6] = busqueda.GetString(6);
                //paciente[7] = busqueda.GetString(7);
                //paciente[8] = busqueda.GetString(8);
                //paciente[9] = busqueda.GetString(9);
                //paciente[10] = busqueda.GetString(10);
                //paciente[11] = busqueda.GetString(11);
                //paciente[12] = busqueda.GetString(12);
                //paciente[13] = busqueda.GetString(13);
                //paciente[14] = busqueda.GetString(14);
                //paciente[15] = busqueda.GetString(15);
                //paciente[16] = busqueda.GetString(16);
                //paciente[17] = busqueda.GetString(17);
                //paciente[18] = busqueda.GetString(18);
                //paciente[19] = busqueda.GetString(19);
                //paciente[20] = busqueda.GetString(20);
                //paciente[21] = busqueda.GetString(21);
                //paciente[22] = busqueda.GetString(22);
                //paciente[23] = busqueda.GetString(23);
                //paciente[24] = busqueda.GetString(24);
                //paciente[25] = busqueda.GetString(25);
                //paciente[26] = busqueda.GetString(26);
                //paciente[27] = busqueda.GetString(27);
                //paciente[28] = busqueda.GetString(28);
                //paciente[29] = busqueda.GetString(29);
                //paciente[30] = busqueda.GetString(30);
                //paciente[31] = busqueda.GetString(31);
                //paciente[32] = busqueda.GetString(32);
                //paciente[33] = busqueda.GetString(33);
                //paciente[34] = busqueda.GetString(34);
                //paciente[35] = busqueda.GetString(35);
                //paciente[36] = busqueda.GetString(36);
                //paciente[37] = busqueda.GetString(37);
                //paciente[38] = busqueda.GetString(38);
                //paciente[39] = busqueda.GetString(39);
                //paciente[40] = busqueda.GetString(40);
                //paciente[41] = busqueda.GetString(41);
                //paciente[42] = busqueda.GetString(42);
                //paciente[43] = busqueda.GetString(43);
                //paciente[44] = busqueda.GetString(44);
                //paciente[45] = busqueda.GetString(45);
                //paciente[46] = busqueda.GetString(46);
            }
            con.cerrar_Conexion();
            return paciente;
        }
    }

}