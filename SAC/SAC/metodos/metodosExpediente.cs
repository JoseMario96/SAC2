using MySql.Data.MySqlClient;
using System;
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
    }

}