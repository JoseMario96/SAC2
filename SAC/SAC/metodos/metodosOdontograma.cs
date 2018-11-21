﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MySql.Data.MySqlClient;
using System.Data;

namespace SAC.metodos
{
    public class metodosOdontograma
    {
        consulta.consulta consultar = new consulta.consulta();
        conexion.conexion con = new conexion.conexion();
        //Insertar colores en la BD
        public void agregarOdontograma(String col, String die, String secc, String codE, String fech, String odont)
        {
            string y = "";
            consultar.ejecutar_consulta("INSERT INTO tbl_odontograma (`colorOdontograma`, `dienteOdontograma`, `seccionOdontograma`, `tipoPacienteOdontograma`) VALUES ('" + col + "', '" + die + "', '" + secc + "', '" + odont + "');", con.abrir_conexion()).ExecuteNonQuery();
            MySqlDataReader contador = consultar.ejecutar_consulta("SELECT max(codigoOdontograma) from tbl_odontograma; ", con.abrir_conexion()).ExecuteReader();
            if (contador.Read())
            {
                y = contador.GetString(0);
            }
            consultar.ejecutar_consulta("INSERT INTO tbl_expedienteodontograma (`codigoExpediente`, `codigoOdontograma`, `fechaTratamientoOdontograma`) VALUES ('" + codE + "','" + y + "', '" + fech + "');", con.abrir_conexion()).ExecuteNonQuery();

            con.cerrar_Conexion();
        }
        public void borrarOdontograma(String col, String die, String secc, String codE)
        {
            string y = "";
            MySqlDataReader contador = consultar.ejecutar_consulta("SELECT tbl_odontograma.codigoOdontograma from tbl_odontograma, tbl_expedienteodontograma where codigoExpediente='" + codE + "' and tbl_odontograma.codigoOdontograma=tbl_expedienteodontograma.codigoOdontograma and colorOdontograma='" + col + "' and dienteOdontograma='" + die + "' and seccionOdontograma='" + secc + "';", con.abrir_conexion()).ExecuteReader();
            if (contador.Read())
            {
                y = contador.GetString(0);
            }
            consultar.ejecutar_consulta("DELETE FROM tbl_expedienteodontograma WHERE `codigoOdontograma`='" + y + "';", con.abrir_conexion()).ExecuteNonQuery();
            consultar.ejecutar_consulta("DELETE FROM tbl_odontograma WHERE `codigoOdontograma`='" + y + "';", con.abrir_conexion()).ExecuteNonQuery();

            con.cerrar_Conexion();

        }
        public void borrarOdontograma2(String marc, String codE)
        {
            string y = "";
            MySqlDataReader contador = consultar.ejecutar_consulta("SELECT tbl_odontograma.codigoOdontograma from tbl_odontograma, tbl_expedienteodontograma where codigoExpediente='" + codE + "' and tbl_odontograma.codigoOdontograma=tbl_expedienteodontograma.codigoOdontograma and marcaOdontograma='" + marc + "';", con.abrir_conexion()).ExecuteReader();
            if (contador.Read())
            {
                y = contador.GetString(0);
            }
            consultar.ejecutar_consulta("DELETE FROM tbl_expedienteodontograma WHERE `codigoOdontograma`='" + y + "';", con.abrir_conexion()).ExecuteNonQuery();
            consultar.ejecutar_consulta("DELETE FROM tbl_odontograma WHERE `codigoOdontograma`='" + y + "';", con.abrir_conexion()).ExecuteNonQuery();

            con.cerrar_Conexion();
        }

        public DataTable Paciente()
        {
            string consulta = "SELECT cedulaPaciente, nombre1Paciente , apellido1Paciente, apellido2Paciente FROM tbl_paciente";
            MySqlCommand comando = new MySqlCommand(consulta, con.abrir_conexion());
            MySqlDataAdapter da = new MySqlDataAdapter(comando);
            using (DataTable dt = new DataTable())
            {
                da.Fill(dt);
                return dt;
            }
        }

        public DataTable TratamientosRealizados(string numexpediente)
        {
            string consulta = "select DATE_FORMAT(fechaExpedienteTratamiento,'%d-%m-%Y'),tratamientoExpedienteTratamiento,piezaExpedienteTratamiento,descripcionExpedienteTratamiento from tbl_expedientetramiento where codigoExpediente='" + numexpediente + "'order by fechaExpedienteTratamiento desc;";
            MySqlCommand comando = new MySqlCommand(consulta, con.abrir_conexion());
            MySqlDataAdapter da = new MySqlDataAdapter(comando);
            using (DataTable dt = new DataTable())
            {
                da.Fill(dt);
                return dt;
            }
        }

        public DataTable ReporteOdontograma(string numexpediente)
        {
            string consulta = "select date_format(fechaExpedienteTratamiento,'%Y-%m-%d'),tratamientoExpedienteTratamiento,piezaExpedienteTratamiento from tbl_expedientetramiento where codigoExpediente='" + numexpediente + "'order by fechaExpedienteTratamiento desc;";
            MySqlCommand comando = new MySqlCommand(consulta, con.abrir_conexion());
            MySqlDataAdapter da = new MySqlDataAdapter(comando);
            using (DataTable dt = new DataTable())
            {
                da.Fill(dt);
                return dt;
            }
        }



        public string NumTipoTratamiento(string nombreTratamiento)
        {
            string codigo = "";
            MySqlDataReader existencia = consultar.ejecutar_consulta("select codigoTipoTratamiento from tbl_tipotratamiento where  nombreTipoTratamiento='" + nombreTratamiento + "';", con.abrir_conexion()).ExecuteReader();
            if (existencia.Read())
            {
                codigo = existencia.GetString(0);
            }
            else
            {

            }
            return codigo;
        }
        public DataTable TiposdeTratamientos()
        {
            DataTable dt = new DataTable();
            string consulta = "select nombreTipoTratamiento from tbl_tipotratamiento;";
            MySqlCommand comando = new MySqlCommand(consulta, con.abrir_conexion());
            MySqlDataAdapter da = new MySqlDataAdapter(comando);
            da.Fill(dt);
            return dt;
        }
        public int obtenerPrecio(string tratamiento)
        {
            int numero = 0;
            string precio = "";

            MySqlDataReader existencia = consultar.ejecutar_consulta("select precioTratamiento from tbl_tratamiento where nombreTratamiento='" + tratamiento + "';", con.abrir_conexion()).ExecuteReader();
            if (existencia.Read())
            {
                precio = existencia.GetString(0);
            }
            else
            {

            }
            numero = Int32.Parse(precio);

            return numero;
        }
        public int buscarExpediente(int codigoE)
        {
            int estado = 0; string resultado = "";
            MySqlDataReader existencia = consultar.ejecutar_consulta("select codigoExpediente from tbl_expedienteodontograma where codigoExpediente = '" + codigoE + "'; ", con.abrir_conexion()).ExecuteReader();
            while (existencia.Read())
            {
                resultado = existencia.GetString(0);
            }
            if (resultado != "")
            {
                estado = 1;
            }

            return estado;

        }

        public void agregarOdontograma2(String marc, String col, String codE, String fech, String odont)
        {
            string y = "";
            consultar.ejecutar_consulta("INSERT INTO tbl_odontograma (`colorOdontograma`,`marcaOdontograma`,`tipoPacienteOdontograma`) VALUES ('" + col + "','" + marc + "','" + odont + "');", con.abrir_conexion()).ExecuteNonQuery();
            MySqlDataReader contador = consultar.ejecutar_consulta("SELECT max(codigoOdontograma) from tbl_odontograma; ", con.abrir_conexion()).ExecuteReader();
            if (contador.Read())
            {
                y = contador.GetString(0);
            }
            consultar.ejecutar_consulta("INSERT INTO tbl_expedienteodontograma (`codigoExpediente`, `codigoOdontograma`, `fechaTratamientoOdontograma`) VALUES ('" + codE + "','" + y + "', '" + fech + "');", con.abrir_conexion()).ExecuteNonQuery();

            con.cerrar_Conexion();
        }
        public String[] buscarOdontograma(String odo)
        {
            string[] stringArray1 = new string[5];
            MySqlDataReader actualizar = consultar.ejecutar_consulta("SELECT colorOdontograma, dienteOdontograma,seccionOdontograma,marcaOdontograma,tipoPacienteOdontograma FROM tbl_odontograma, tbl_expedienteodontograma  where tbl_odontograma.codigoOdontograma= tbl_expedienteodontograma.codigoOdontograma and tbl_odontograma.codigoOdontograma = '" + odo + "'; ", con.abrir_conexion()).ExecuteReader();


            while (actualizar.Read())
            {
                if (!actualizar.IsDBNull(1))
                {
                    stringArray1[0] = actualizar.GetString(0);
                    stringArray1[1] = actualizar.GetString(1);
                    stringArray1[2] = actualizar.GetString(2);
                    stringArray1[4] = actualizar.GetString(4);

                }
                else
                {
                    stringArray1[0] = actualizar.GetString(0);
                    stringArray1[3] = actualizar.GetString(3);
                    stringArray1[4] = actualizar.GetString(4);
                }

            }


            con.cerrar_Conexion();
            return stringArray1;
        }
        public int cantidadOdontograma(String codE)
        {

            string y = "";
            int z = 0;
            MySqlDataReader contador = consultar.ejecutar_consulta("select count(codigoOdontograma) from tbl_expedienteodontograma where codigoExpediente = '" + codE + "'; ", con.abrir_conexion()).ExecuteReader();
            if (contador.Read())
            {
                y = contador.GetString(0);
            }
            z = Int32.Parse(y);

            return z;
        }
        public string[] buscarPaciente(String codE)
        {
            int x = 0;
            int z = 0;
            z = cantidadOdontograma(codE);
            string[] stringArray1 = new string[z];
            MySqlDataReader actualizar = consultar.ejecutar_consulta("SELECT codigoOdontograma FROM tbl_expedienteodontograma where codigoExpediente = '" + codE + "'; ", con.abrir_conexion()).ExecuteReader();
            while (actualizar.Read())
            {
                stringArray1[x] = actualizar.GetString(0);
                x++;
            }
            con.cerrar_Conexion();
            return stringArray1;
        }
        public string codigoTratamiento(string nombreT)
        {
            string codi = "";

            MySqlDataReader existencia = consultar.ejecutar_consulta("select codigoTratamiento from tbl_tratamiento where nombreTratamiento='" + nombreT + "';", con.abrir_conexion()).ExecuteReader();
            if (existencia.Read())
            {
                codi = existencia.GetString(0);
            }

            return codi;

        }
        public void agregarPacienteTratamiento(int codigoEx, string tratamiento, string fecha, string tratamientorealizado, string pieza, string descripcion, string cedula)
        {
            consultar.ejecutar_consulta("INSERT INTO tbl_expedientetramiento (`codigoExpediente`, `codigoTratamiento`, `fechaExpedienteTratamiento`, `tratamientoExpedienteTratamiento`, `piezaExpedienteTratamiento`, `descripcionExpedienteTratamiento`, `EstadoPago`) VALUES('" + codigoEx + "', '" + tratamiento + "', '" + fecha + "', '" + tratamientorealizado + "','" + pieza + "','" + descripcion + "', false);", con.abrir_conexion()).ExecuteNonQuery();
            con.cerrar_Conexion();
        }
        public DataTable tratamientosEfectuados()
        {
            string consulta = "SELECT date_format(fechaExpedienteTratamiento,'%Y-%m-%d'), piezaExpedienteTratamiento , descripcionExpedienteTratamiento from tbl_expedientetramiento;";
            MySqlCommand comando = new MySqlCommand(consulta, con.abrir_conexion());
            MySqlDataAdapter da = new MySqlDataAdapter(comando);
            using (DataTable dt = new DataTable())
            {
                da.Fill(dt);
                return dt;
            }
        }
        public DataTable Pacienteinformacion(String ced)
        {
            string consulta = "Select tbl_paciente.cedulaPaciente, nombre1Paciente , apellido1Paciente, apellido2Paciente from tbl_paciente, tbl_expediente  where tbl_paciente.cedulaPaciente= tbl_expediente.cedulaPaciente;";
            MySqlCommand comando = new MySqlCommand(consulta, con.abrir_conexion());
            MySqlDataAdapter da = new MySqlDataAdapter(comando);
            using (DataTable dt = new DataTable())
            {
                da.Fill(dt);
                return dt;
            }

        }
        public DataTable Pacienteinformacion2(String nom)
        {
            DataTable dt = new DataTable();
            try
            {
                string consulta = "Select tbl_paciente.cedulaPaciente, nombre1Paciente , apellido1Paciente, apellido2Paciente from tbl_paciente, tbl_expediente  where tbl_paciente.nombre1Paciente like '%" + nom + "%' and  tbl_paciente.cedulaPaciente= tbl_expediente.cedulaPaciente;";
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
    }

}

