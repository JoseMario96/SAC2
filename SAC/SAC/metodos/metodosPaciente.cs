using MySql.Data.MySqlClient;
using System;
using System.Data;
using System.Text.RegularExpressions;

namespace SAC.metodos
{
    public class metodosPaciente
    {
        consulta.consulta consultar = new consulta.consulta();
        conexion.conexion con = new conexion.conexion();

        public void agregarPaciente(String ced, String nom1, String nom2, String ape1, String ape2, String gen, String tel, String cel, String dir, String enc, String corr, String fechN, String fechI, String nom1Enc, String nom2Enc, String ape1Enc, String ape2Enc, String generoEnc, String telEnc, String celEnc, String dirEnc, String correoEnc, String parentezco)
        {
            if (enc.Equals(""))
            {
                consultar.ejecutar_consulta("INSERT INTO `bd_sac`.`tbl_paciente` (`cedulaPaciente`, `nombre1Paciente`, `nombre2Paciente`, `apellido1Paciente`, `apellido2Paciente`, `generoPaciente`, `telefonoPaciente`, `celularPaciente`, `direccionPaciente`, `correoPaciente`, `fechaNacimientoPaciente`, `fechaInscripcionPaciente`) VALUES('" + ced + "','" + nom1 + "','" + nom2 + "','" + ape1 + "','" + ape2 + "','" + gen + "','" + tel + "','" + cel + "','" + dir + "','" + corr + "','" + fechN + "','" + fechI + "');", con.abrir_conexion()).ExecuteNonQuery();
                con.cerrar_Conexion();
            }
            else
            {
                consultar.ejecutar_consulta("INSERT INTO `bd_sac`.`tbl_encargado` (`cedulaEncargado`, `nombre1Encargado`, `nombre2Encargado`, `apellido1Encargado`, `apellido2Encargado`, `generoEncargado`, `telefonoEncargado`, `celularEncargado`, `direccionEncargado`, `parentescoEncargado`, `correoEncargado`) VALUES('" + enc + "', '" + nom1Enc + "', '" + nom2Enc + "','" + ape1Enc + "','" + ape2Enc + "','" + generoEnc + "','" + telEnc + "','" + celEnc + "','" + dirEnc + "','" + parentezco + "','" + correoEnc + "');", con.abrir_conexion()).ExecuteNonQuery();
                con.cerrar_Conexion();
                consultar.ejecutar_consulta("INSERT INTO `bd_sac`.`tbl_paciente` (`cedulaPaciente`, `nombre1Paciente`, `nombre2Paciente`, `apellido1Paciente`, `apellido2Paciente`, `generoPaciente`, `telefonoPaciente`, `celularPaciente`, `direccionPaciente`, `cedulaEncargado`, `correoPaciente`, `fechaNacimientoPaciente`, `fechaInscripcionPaciente`) VALUES('" + ced + "','" + nom1 + "', '" + nom2 + "', '" + ape1 + "','" + ape2 + "','" + gen + "','" + tel + "','" + cel + "','" + dir + "','" + enc + "','" + corr + "','" + fechN + "','" + fechI + "');", con.abrir_conexion()).ExecuteNonQuery();
                con.cerrar_Conexion();
            }

        }
        public void agregarPaciente2(String ced, String nom1, String nom2, String ape1, String ape2, String gen, String tel, String cel, String dir, String enc, String corr, String fechN, String fechI, String nom1Enc, String nom2Enc, String ape1Enc, String ape2Enc, String generoEnc, String telEnc, String celEnc, String dirEnc, String correoEnc, String parentezco)
        {
            consultar.ejecutar_consulta("INSERT INTO `bd_sac`.`tbl_paciente` (`cedulaPaciente`, `nombre1Paciente`, `nombre2Paciente`, `apellido1Paciente`, `apellido2Paciente`, `generoPaciente`, `telefonoPaciente`, `celularPaciente`, `direccionPaciente`, `cedulaEncargado`, `correoPaciente`, `fechaNacimientoPaciente`, `fechaInscripcionPaciente`) VALUES('" + ced + "','" + nom1 + "', '" + nom2 + "', '" + ape1 + "','" + ape2 + "','" + gen + "','" + tel + "','" + cel + "','" + dir + "','" + enc + "','" + corr + "','" + fechN + "','" + fechI + "');", con.abrir_conexion()).ExecuteNonQuery();
            con.cerrar_Conexion();
        }

        public String[] buscarPaciente(String ced)
        {
            string[] stringArray1 = new string[13];
            MySqlDataReader actualizar = consultar.ejecutar_consulta("SELECT * FROM bd_sac.tbl_paciente  where cedulaPaciente = '" + ced + "'; ", con.abrir_conexion()).ExecuteReader();
            while (actualizar.Read())
            {

                try
                {
                    stringArray1[0] = actualizar.GetString(0);
                    stringArray1[1] = actualizar.GetString(1);
                    stringArray1[2] = actualizar.GetString(2);
                    stringArray1[3] = actualizar.GetString(3);
                    stringArray1[4] = actualizar.GetString(4);
                    stringArray1[5] = actualizar.GetString(5);
                    stringArray1[6] = actualizar.GetString(6);
                    stringArray1[7] = actualizar.GetString(7);
                    stringArray1[8] = actualizar.GetString(8);
                    stringArray1[9] = actualizar.GetString(9);
                    stringArray1[10] = actualizar.GetString(10);
                    stringArray1[11] = actualizar.GetString(11);
                    stringArray1[12] = actualizar.GetString(12);
                }
                catch (System.Exception)
                {
                    stringArray1[0] = actualizar.GetString(0);
                    stringArray1[1] = actualizar.GetString(1);
                    stringArray1[2] = actualizar.GetString(2);
                    stringArray1[3] = actualizar.GetString(3);
                    stringArray1[4] = actualizar.GetString(4);
                    stringArray1[5] = actualizar.GetString(5);
                    stringArray1[6] = actualizar.GetString(6);
                    stringArray1[7] = actualizar.GetString(7);
                    stringArray1[8] = actualizar.GetString(8);
                    stringArray1[10] = actualizar.GetString(10);
                    stringArray1[11] = actualizar.GetString(11);
                    stringArray1[12] = actualizar.GetString(12);
                }

            }
            con.cerrar_Conexion();
            return stringArray1;
        }
        public void actualizarPaciente(String ced, String nom1, String nom2, String ape1, String ape2, String gen, String tel, String cel, String dir, String corr, String fechN, String fechI)
        {
            MySqlDataReader actualizar = consultar.ejecutar_consulta("UPDATE `bd_sac`.`tbl_paciente` SET `nombre1Paciente`='" + nom1 + "', `nombre2Paciente`='" + nom2 + "', `apellido1Paciente`='" + ape1 + "', `apellido2Paciente`='" + ape2 + "', `generoPaciente`='" + gen + "', `telefonoPaciente`='" + tel + "', `celularPaciente`='" + cel + "', `direccionPaciente`='" + dir + "', `correoPaciente`='" + corr + "', `fechaNacimientoPaciente`='" + fechN + "', `fechaInscripcionPaciente`='" + fechI + "' WHERE `cedulaPaciente`='" + ced + "'", con.abrir_conexion()).ExecuteReader();
            con.cerrar_Conexion();
        }

        //public void agregarEncargado(String ced, String nom1, String nom2, String ape1, String ape2, String gen, String tel, String cel, String dir, String par, String corr)
        //{
        //    MySqlDataReader agregar = consultar.ejecutar_consulta("INSERT INTO `bd_sac`.`tbl_encargado` (`cedulaEncargado`, `nombre1Encargado`, `nombre2Encargado`, `apellido1Encargado`, `apellido2Encargado`, `generoEncargado`, `telefonoEncargado`, `celularEncargado`, `direccionEncargado`, `parentescoEncargado`, `correoEncargado`) VALUES('"+ced+"', '"+nom1+"', '"+nom2+"', '"+ape1+"', '"+ape2+"', '"+gen+ " ',' " + tel + " ',' " + cel + " ',' " + dir + " ',' " + par + " ',' " + corr + " ');", con.abrir_conexion()).ExecuteReader();
        //    con.cerrar_Conexion();

        //}
        public String[] buscarEncargado(String ced)
        {
            string[] stringArray1 = new string[11];
            MySqlDataReader actualizar = consultar.ejecutar_consulta("SELECT * FROM bd_sac.tbl_encargado  where cedulaEncargado='" + ced + "'; ", con.abrir_conexion()).ExecuteReader();
            while (actualizar.Read())
            {
                stringArray1[0] = actualizar.GetString(0);
                stringArray1[1] = actualizar.GetString(1);
                stringArray1[2] = actualizar.GetString(2);
                stringArray1[3] = actualizar.GetString(3);
                stringArray1[4] = actualizar.GetString(4);
                stringArray1[5] = actualizar.GetString(5);
                stringArray1[6] = actualizar.GetString(6);
                stringArray1[7] = actualizar.GetString(7);
                stringArray1[8] = actualizar.GetString(8);
                stringArray1[9] = actualizar.GetString(9);
                stringArray1[10] = actualizar.GetString(10);
            }
            con.cerrar_Conexion();
            return stringArray1;
        }
        public void actualizarEncargado(String ced, String nom1, String nom2, String ape1, String ape2, String gen, String tel, String cel, String dir, String par, String corr)
        {
            MySqlDataReader agregar = consultar.ejecutar_consulta("UPDATE `bd_sac`.`tbl_encargado` SET `nombre1Encargado`='" + nom1 + "', `nombre2Encargado`='" + nom2 + "', `apellido1Encargado`='" + ape1 + "', `apellido2Encargado`= '" + ape2 + "', `generoEncargado`='" + gen + "', `telefonoEncargado`='" + tel + "', `celularEncargado`='" + cel + "', `direccionEncargado`='" + dir + "', `parentescoEncargado`='" + par + "', `correoEncargado`='" + corr + "' WHERE `cedulaEncargado`='" + ced + "';", con.abrir_conexion()).ExecuteReader();
            con.cerrar_Conexion();
        }

        ////public String[] buscarPaciente()
        ////{
        ////    string[] arrayPaciente = new string[4];
        ////  //  MySqlDataReader session = consultar.ejecutar_consulta(;", con.abrir_conexion()).ExecuteReader();
        ////    MySqlDataReader session = consultar.ejecutar_consulta("SELECT cedulaPaciente , nombre1Paciente, apellido1Paciente, apellido2Paciente FROM tbl_paciente;", con.abrir_conexion()).ExecuteReader();
        ////    while (session.Read())
        ////    {
        ////        arrayPaciente[0] = session.GetString(0);
        ////        arrayPaciente[1] = session.GetString(1);
        ////        arrayPaciente[2] = session.GetString(2);
        ////        arrayPaciente[3] = session.GetString(3);

        ////    }
        ////    con.cerrar_Conexion();
        ////    return arrayPaciente;

        ////}
        //public String[] buscarEncargado()
        //{

        //}
        public DataTable Paciente()
        {
            string consulta = "SELECT cedulaPaciente, nombre1Paciente , apellido1Paciente, apellido2Paciente FROM tbl_paciente";
            MySqlCommand comando = new MySqlCommand(consulta, con.abrir_conexion());
            MySqlDataAdapter da = new MySqlDataAdapter(comando);
            using (DataTable dt = new DataTable())
            {
                da.Fill(dt);
                con.cerrar_Conexion();
                return dt;
            }

        }

        public DataTable Paciente2(String nom)
        {
            DataTable dt = new DataTable();
            try
            {
                string consulta = "SELECT cedulaPaciente, nombre1Paciente , apellido1Paciente, apellido2Paciente FROM tbl_paciente where nombre1Paciente like '%" + nom + "%';";
                MySqlCommand comando = new MySqlCommand(consulta, con.abrir_conexion());
                MySqlDataAdapter da = new MySqlDataAdapter(comando);
                using (dt)
                {
                    da.Fill(dt);
                    return dt;
                }
            }
            catch
            {
                return dt;
            }
        }



        public void ActualizarPacienteNuevoEncargado(int estado, String ced, String cedEnc, String nom1Enc, String nom2Enc, String ape1Enc, String ape2Enc, String generoEnc, String telEnc, String celEnc, String dirEnc, String correoEnc, String parentezco)
        {

            if (estado == 1)
            {
                consultar.ejecutar_consulta("INSERT INTO `bd_sac`.`tbl_encargado` (`cedulaEncargado`, `nombre1Encargado`, `nombre2Encargado`, `apellido1Encargado`, `apellido2Encargado`, `generoEncargado`, `telefonoEncargado`, `celularEncargado`, `direccionEncargado`, `parentescoEncargado`, `correoEncargado`) VALUES('" + cedEnc + "', '" + nom1Enc + "', '" + nom2Enc + "','" + ape1Enc + "','" + ape2Enc + "','" + generoEnc + "','" + telEnc + "','" + celEnc + "','" + dirEnc + "','" + parentezco + "','" + correoEnc + "');", con.abrir_conexion()).ExecuteNonQuery();
                consultar.ejecutar_consulta("UPDATE `bd_sac`.`tbl_paciente` SET `cedulaEncargado`='" + cedEnc + "' WHERE `cedulaPaciente`='" + ced + "';", con.abrir_conexion()).ExecuteNonQuery();
                con.cerrar_Conexion();
            }
            else
            {
                consultar.ejecutar_consulta("UPDATE `bd_sac`.`tbl_paciente` SET `cedulaEncargado`='" + cedEnc + "' WHERE `cedulaPaciente`='" + ced + "';", con.abrir_conexion()).ExecuteNonQuery();
                con.cerrar_Conexion();
            }

           
        }

        public Boolean validacioncorreo(String email)
        {
            String expresion;
            expresion = "\\w+([-+.']\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*";
            if (Regex.IsMatch(email, expresion))
            {
                if (Regex.Replace(email, expresion, String.Empty).Length == 0)
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
            else
            {
                return false;
            }
        }
        public Boolean VerificarPaciente(String cedula)
        {
            Boolean confirmar = false;
            MySqlDataReader actualizar = consultar.ejecutar_consulta("SELECT cedulaPaciente FROM tbl_paciente  where cedulaPaciente='" + cedula + "'; ", con.abrir_conexion()).ExecuteReader();
            if (actualizar.Read())
            {
                confirmar = true;
            }
            con.cerrar_Conexion();
            return confirmar;
        }

    }
}