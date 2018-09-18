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

        public void agregarExpediente(string cedulaEx, string fecharegistro, string pregunta1, string pregunta2, string pregunta3, string pregunta4, string pregunta5, string anemia, string pregunta6, string pregunta7, string donde, string cuanto, string pregunta8, string pregunta9, string pregunta10, string pregunta11, string pregunta12, string pregunta13, string pregunta14, string pregunta15, string pregunta16, string pregunta17, string pregunta18, string pregunta19, string pregunta20, string peso, string pregunta21, string pregunta22, string pregunta23, string pregunta24, string pregunta25, string pregunta26, string pregunta27, string pregunta28, string pregunta29, string cigarros, string cuanto2, string bebedor, string pregunta30, string pregunta31, string pregunta32, String descripción)
        {
            //try
            //{
            MySqlDataReader agregar = consultar.ejecutar_consulta("Insert into bd_sac.tbl_expediente (cedulaPaciente,fechaRegistro,enfermedadesCardiacos,presionArterial,fiebreReumatica,`VIH+SIDA`,derrame,anemia,transfusionSangre,fueraDelPais,lugarFueraDelPais,tiempoFueraDelPais,moretes,problemasDeRinnon,problemasGastrointestinales,problemasVision,tratamientosCorticoesteroides,diabetes,epilepsia,enfermedadesRespiratorias,radioterapiaQuimioterapia,reumatismo," +
                "problemasHepaticos,virusHerpes,perdidaDePeso,aumentoDePeso,artitris,tratamientoPsiquiatrico,problemaDeTiroides,enfermedadesTransmisionSexual,osteoporosis,migranna,tratamientoBifosfonados,consumeDrogas,fumador,cigarrosXdia,periodoFumado,bebedor" +
                ",frecuenciaBebedor,`cicatrices/tatuajes`,shockAnafilactico,observacionExpediente) values( '" + cedulaEx + "','" + fecharegistro + "', '" + pregunta1 + "', '" + pregunta2 + "', '" + pregunta3 + "', '" + pregunta4 + "', '" + pregunta5 + "', '" + anemia + "', " +
                "'" + pregunta6 + "', '" + pregunta7 + "', '" + donde + "', '" + cuanto + "', '" + pregunta8 + "','" + pregunta9 + "', '" + pregunta10 + "', '" + pregunta11 + "', '" + pregunta12 + "', '" + pregunta13 + "', '" + pregunta14 + "', '" + pregunta15 + "', '" + pregunta16 + "', '" + pregunta17 + "'," +
                " '" + pregunta18 + "', '" + pregunta19 + "', '" + pregunta20 + "' , '" + peso + "' ,'" + pregunta21 + "', '" + pregunta22 + "', '" + pregunta23 + "', '" + pregunta24 + "', '" + pregunta25 + "', '" + pregunta26 + "', '" + pregunta27 + "', '" + pregunta28 + "','" + pregunta29 + "'," +
                " '" + cigarros + "', '" + cuanto2 + "', '" + bebedor + "', '" + pregunta30 + "', '" + pregunta31 + "', '" + pregunta32 + "', '" + descripción + "');", con.abrir_conexion()).ExecuteReader();
            con.cerrar_Conexion();
            //}
            //catch
            //{

            //}
        }

        public void agregarExpedienteMujer(int codigoEx, string pregunta33, int embarazo, string pregunta34, int partos, int abortos, int cesarias, string observacion)
        {
            MySqlDataReader agregarMujer = consultar.ejecutar_consulta("Insert into bd_sac.tbl_historialmedicomujeres(codigoExpediente,embarazada,semanasEmbarazada,`tratamientoAnticonceptivo/hormonal`,ginecoobstetricos,abortos,cesareas,observasionesHM) value ('" + codigoEx + "','" + pregunta33 + "','" + embarazo + "','" + pregunta34 + "','" + partos + "','" + abortos + "','" + cesarias + "','" + observacion + "');", con.abrir_conexion()).ExecuteReader();
            con.cerrar_Conexion();
        }

        public void agregarsignos(int codigoEx, string presion, string pulso, string frecuenciaRespiratoria)
        {
            MySqlDataReader agregarsignos = consultar.ejecutar_consulta("Insert into bd_sac.tbl_signosvitales(codigoExpediente,presionArterial,pulso,frecuenciaRespiratoria) value('" + codigoEx + "','" + presion + "','" + pulso + "','" + frecuenciaRespiratoria + "');", con.abrir_conexion()).ExecuteReader();
            con.cerrar_Conexion();
        }

        public int BuscarcodigoExpediente(string cedula)
        {
            string codigo = ""; int cod = 0;

            MySqlDataReader existencia = consultar.ejecutar_consulta("Select codigoExpediente from tbl_expediente where cedulaPaciente= '" + cedula + "'; ", con.abrir_conexion()).ExecuteReader();
            if (existencia.Read())
            {
                codigo = existencia.GetString(0);
            }
            cod = Int32.Parse(codigo);
            return cod;
        }

        // Función que permite conocer si existe el expediente y que tenga sea un paciente del sistema
        public int busquedacedula(string cedula)
        {
            int estado = 0; string resultado = "";
            MySqlDataReader existencia = consultar.ejecutar_consulta("select cedulaPaciente from tbl_expediente where cedulaPaciente = '" + cedula + "'; ", con.abrir_conexion()).ExecuteReader();
            while (existencia.Read())
            {
                resultado = existencia.GetString(0);
            }
            if (resultado != "")
            {
                estado = 1;
            }
            else
            {
                MySqlDataReader existencia2 = consultar.ejecutar_consulta("select cedulaPaciente from tbl_paciente where cedulaPaciente = '" + cedula + "'; ", con.abrir_conexion()).ExecuteReader();
                while (existencia2.Read())
                {
                    resultado = existencia2.GetString(0);
                }
                if (resultado != "")
                {
                    estado = 2;
                }
                else
                {
                    estado = 3;
                }

            }

            con.cerrar_Conexion();
            return estado;

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