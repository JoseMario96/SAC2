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
        public String[,] Cita()
        {
            String[,] matriz;
            string consulta = "select * from tbl_cita;";
            MySqlCommand comando = new MySqlCommand(consulta, con.abrir_conexion());
            MySqlDataAdapter da = new MySqlDataAdapter(comando);
            using (DataSet dt = new DataSet())
            {
                da.Fill(dt);
                matriz = new String[dt.Tables[0].Rows.Count, dt.Tables[0].Columns.Count];
                for (int i = 0; i <= dt.Tables[0].Rows.Count - 1; i++)
                {
                    for (int j = 0; j <= dt.Tables[0].Columns.Count - 1; j++)
                    {
                        matriz[i, j] = System.Convert.ToString(dt.Tables[0].Rows[i].ItemArray[j]);
                    }
                }
            }
            return matriz;

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

        public void AgregarCita(String cedula, String fecha, String hora, String telefono)
        {
            consultar.ejecutar_consulta("INSERT INTO `bd_sac`.`tbl_cita` (`cedulaPaciente`, `fechaReservaCita`, `horaCita`, `telefonoCita`) VALUES('" + cedula + "','" + fecha + "','" + hora + "','" + telefono + "');", con.abrir_conexion()).ExecuteNonQuery();
            con.cerrar_Conexion();
        }

        public void EliminarCita(String cedula, String fecha, String hora)
        {
            consultar.ejecutar_consulta("delete from tbl_cita where cedulaPaciente = '" + cedula + "' and fechaReservaCita = '" + fecha + "' and horaCita = '" + hora + "';", con.abrir_conexion()).ExecuteNonQuery();
            con.cerrar_Conexion();
        }

        public DataTable CitaHoy()
        {
            string consulta = "Select cedulaPaciente, horaCita, telefonoCita from tbl_cita where fechaReservaCita = curdate() order by horaCita;";
            MySqlCommand comando = new MySqlCommand(consulta, con.abrir_conexion());
            MySqlDataAdapter da = new MySqlDataAdapter(comando);
            using (DataTable dt = new DataTable())
            {
                da.Fill(dt);
                return dt;
            }


        }

        public String Codigo(String cedula, String fecha, String hora)
        {
            String codigo = "";
            MySqlDataReader busqueda = consultar.ejecutar_consulta("select codigoCita from tbl_Cita where cedulaPaciente = '" + cedula + "' and fechaReservaCita = '" + fecha + "' and horaCita = '" + hora + "';", con.abrir_conexion()).ExecuteReader();
            while (busqueda.Read())
            {
                codigo = busqueda.GetString(0);
            }
            return codigo;
        }

        public String[] MostrarCita(String codigo)
        {
            String[] tratamiento = new string[5];
            MySqlDataReader busqueda = consultar.ejecutar_consulta("select * from tbl_Cita where codigoCita = '"+codigo+"';", con.abrir_conexion()).ExecuteReader();
            while (busqueda.Read())
            {
                for (int i = 0; i <= 4; i++)
                {
                    if (busqueda.IsDBNull(i))
                    {
                        tratamiento[i] = "";
                    }
                    else
                    {
                        tratamiento[i] = busqueda.GetString(i);
                    }

                }
            }
            con.cerrar_Conexion();
            return tratamiento;
        }

        public void ActualizarCita(String codigo, String cedula, String fecha, String hora, String telefono)
        {
            consultar.ejecutar_consulta("UPDATE `bd_sac`.`tbl_Cita` SET `cedulaPaciente`='" + cedula + "', `fechaReservaCita`='" + fecha + "', `horaCita`='" + hora + "', `telefonoCita`='" + telefono + "' WHERE `codigoCita`='" + codigo + "';", con.abrir_conexion()).ExecuteNonQuery();
            con.cerrar_Conexion();
        }

        public Boolean EstaCita(String fecha)
        {
            Boolean esta = false;
            MySqlDataReader busqueda = consultar.ejecutar_consulta("select fechaReservaCita from tbl_Cita where fechaReservaCita = '" + fecha + "';", con.abrir_conexion()).ExecuteReader();
            while (busqueda.Read())
            {
                esta = true;
            }
                return esta;
        }

        public Boolean ValidarCita(String fecha, String hora)
        {
            Boolean esta = false;
            MySqlDataReader busqueda = consultar.ejecutar_consulta("select fechaReservaCita, horaCita from tbl_Cita where fechaReservaCita = '" + fecha + "' and horaCita = '" + hora + "';", con.abrir_conexion()).ExecuteReader();
            while (busqueda.Read())
            {
                esta = true;
            }
            return esta;
        }

        public String[,] BuscarCitasAutomaticas()
        {
            String[,] matriz;
            string consulta = "select tbl_cita.fechaReservaCita, tbl_cita.horaCita, tbl_paciente.nombre1Paciente, tbl_paciente.apellido1Paciente, tbl_paciente.correoPaciente  from tbl_Cita, tbl_paciente where fechaReservaCita = date_add(curdate(), interval 1 day) and tbl_cita.cedulaPaciente = tbl_paciente.cedulaPaciente;";
            MySqlCommand comando = new MySqlCommand(consulta, con.abrir_conexion());
            MySqlDataAdapter da = new MySqlDataAdapter(comando);
            using (DataSet dt = new DataSet())
            {
                da.Fill(dt);
                matriz = new String[dt.Tables[0].Rows.Count, dt.Tables[0].Columns.Count];
                for (int i = 0; i <= dt.Tables[0].Rows.Count - 1; i++)
                {
                    for (int j = 0; j <= dt.Tables[0].Columns.Count - 1; j++)
                    {
                        matriz[i, j] = System.Convert.ToString(dt.Tables[0].Rows[i].ItemArray[j]);
                    }
                }
            }
            return matriz;

        }
    }
}