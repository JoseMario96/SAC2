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
            String[] paciente = new string[59];
            MySqlDataReader busqueda = consultar.ejecutar_consulta("select tbl_expediente.*, tbl_paciente.nombre1Paciente, tbl_paciente.nombre2Paciente, tbl_paciente.apellido1Paciente, tbl_paciente.apellido2Paciente, tbl_signosvitales.*, tbl_historialmedicomujeres.* from tbl_expediente, tbl_paciente, tbl_signosvitales, tbl_historialmedicomujeres where tbl_paciente.cedulaPaciente = tbl_expediente.cedulaPaciente and tbl_expediente.cedulaPaciente = " + ced + " and tbl_expediente.codigoExpediente = tbl_signosvitales.codigoExpediente and tbl_expediente.codigoExpediente = tbl_historialmedicomujeres.codigoExpediente;", con.abrir_conexion()).ExecuteReader();
            while (busqueda.Read())
            {
                for (int i = 0; i <= 58; i++)
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
            }
            con.cerrar_Conexion();
            return paciente;
        }
    }

}