using MySql.Data.MySqlClient;
using System;
using System.Data;

namespace SAC.metodos
{
    public class metodosPaciente
    {
        consulta.consulta consultar = new consulta.consulta();
        conexion.conexion con = new conexion.conexion();

        public void agregarPaciente(String ced, String nom1, String nom2, String ape1, String ape2, String gen, String tel, String cel, String dir, String enc, String corr, String fechN, String fechI)
        {
            if (enc.Equals(""))
            {
                consultar.ejecutar_consulta("INSERT INTO `bd_sac`.`tbl_paciente` (`cedulaPaciente`, `nombre1Paciente`, `nombre2Paciente`, `apellido1Paciente`, `apellido2Paciente`, `generoPaciente`, `telefonoPaciente`, `celularPaciente`, `direccionPaciente`, `correoPaciente`, `fechaNacimientoPaciente`, `fechaInscripcionPaciente`) VALUES(' " + ced + " ', ' " + nom1 + " ', ' " + nom2 + " ', ' " + ape1 + " ',' " + ape2 + " ',' " + gen + " ',' " + tel + " ',' " + cel + " ',' " + dir + " ',' " + corr + " ',' " + fechN + " ',' " + fechI + " ');", con.abrir_conexion()).ExecuteNonQuery();
                con.cerrar_Conexion();
            }
            else
            {
                consultar.ejecutar_consulta("INSERT INTO `bd_sac`.`tbl_paciente` (`cedulaPaciente`, `nombre1Paciente`, `nombre2Paciente`, `apellido1Paciente`, `apellido2Paciente`, `generoPaciente`, `telefonoPaciente`, `celularPaciente`, `direccionPaciente`, `cedulaEncargado`, `correoPaciente`, `fechaNacimientoPaciente`, `fechaInscripcionPaciente`) VALUES(' " + ced + " ', ' " + nom1 + " ', ' " + nom2 + " ', ' " + ape1 + " ',' " + ape2 + " ',' " + gen + " ',' " + tel + " ',' " + cel + " ',' " + dir + " ','" + enc + "',' " + corr + " ',' " + fechN + " ',' " + fechI + " ');", con.abrir_conexion()).ExecuteNonQuery();
                con.cerrar_Conexion();
            }

        }
        public void actualizarPaciente(String ced, String nom1, String nom2, String ape1, String ape2, String gen, String tel, String cel, String dir, String enc, String corr, String fechN, String fechI)
        {
            MySqlDataReader actualizar = consultar.ejecutar_consulta("UPDATE `bd_sac`.`tbl_paciente` SET ``nombre1Paciente`= ' " + nom1 + " ', `nombre2Paciente`= ' " + nom2 + " ', `apellido1Paciente`= ' " + ape1 + " ', `apellido2Paciente`= ' " + ape2 + " ', `generoPaciente`= ' " + gen + " ', `telefonoPaciente`= ' " + tel + " ', `celularPaciente`= ' " + cel + " ', `direccionPaciente`= ' " + dir + " ', `encargadoPaciente`= ' " + enc + " ', `correoPaciente`= ' " + corr + " ', `fechaNacimientoPaciente`= ' " + fechN + " ', `fechaInscripcionPaciente`== ' " + fechI + " ' WHERE `cedulaPaciente`=' " + ced + " ';);", con.abrir_conexion()).ExecuteReader();
            con.cerrar_Conexion();
        }

        public void agregarEncargado(String ced, String nom1, String nom2, String ape1, String ape2, String gen, String tel, String cel, String dir, String par, String corr)
        {
            MySqlDataReader agregar = consultar.ejecutar_consulta("INSERT INTO `bd_sac`.`tbl_encargado` (`cedulaEncargado`, `nombre1Encargado`, `nombre2Encargado`, `apellido1Encargado`, `apellido2Encargado`, `generoEncargado`, `telefonoEncargado`, `celularEncargado`, `direccionEncargado`, `parentescoEncargado`, `correoEncargado`) VALUES(' " + ced + " ', ' " + nom1 + " ', ' " + nom2 + " ', ' " + ape1 + " '' " + ape2 + " ',' " + gen + " ',' " + tel + " ',' " + cel + " ',' " + dir + " ',' " + par + " ',' " + corr + " ');", con.abrir_conexion()).ExecuteReader();
            con.cerrar_Conexion();
        }
        public void actualizarEncargado(String ced, String nom1, String nom2, String ape1, String ape2, String gen, String tel, String cel, String dir, String par, String corr)
        {
            MySqlDataReader agregar = consultar.ejecutar_consulta("UPDATE `bd_sac`.`tbl_encargado` SET `nombre1Encargado`= ' " + nom1 + " ', `nombre2Encargado`= ' " + nom2 + " ', `apellido1Encargado`= ' " + ape1 + " ', `apellido2Encargado`= ' " + ape2 + " ', `generoEncargado`= ' " + gen + " ', `telefonoEncargado`= ' " + tel + " ', `celularEncargado`= ' " + cel + " ', `direccionEncargado`= ' " + dir + " ', `parentescoEncargado`= ' " + par + " ', `correoEncargado`= ' " + corr + " ' WHERE `cedulaEncargado`=' " + ced + " ';);", con.abrir_conexion()).ExecuteReader();
            con.cerrar_Conexion();
        }

        public DataTable Paciente(String dato)
        {
            string consulta = "SELECT cedulaPaciente AS 'Cédula', nombre1Paciente AS 'Primer Nombre', apellido1Paciente AS 'Primer Apellido', apellido2Paciente AS 'Segundo Apellido' FROM tbl_paciente where cedulaPaciente like '" + dato + "%'; ";
            MySqlCommand comando = new MySqlCommand(consulta, con.abrir_conexion());
            MySqlDataAdapter da = new MySqlDataAdapter(comando);
            using (DataTable dt = new DataTable())
            {
                da.Fill(dt);
                return dt;
            }

        }
    }
}