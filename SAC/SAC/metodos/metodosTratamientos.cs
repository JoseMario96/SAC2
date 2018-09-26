using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using MySql.Data.MySqlClient;

namespace SAC.metodos
{
    public class metodosTratamientos
    {
        consulta.consulta consultar = new consulta.consulta();
        conexion.conexion con = new conexion.conexion();

        public DataTable TipoTratamiento()
        {
            string consulta = "Select nombreTipoTratamiento from tbl_tipotratamiento order by codigoTipoTratamiento;";
            MySqlCommand comando = new MySqlCommand(consulta, con.abrir_conexion());
            MySqlDataAdapter da = new MySqlDataAdapter(comando);
            using (DataTable dt = new DataTable())
            {
                da.Fill(dt);
                return dt;
            }

        }

        public DataTable Tratamiento(String codigo)
        {
            DataTable dt = new DataTable();
            string consulta = "Select nombreTratamiento from tbl_tratamiento where codigoTipoTratamiento = '" + codigo + "' order by codigoTratamiento;";
            MySqlCommand comando = new MySqlCommand(consulta, con.abrir_conexion());
            MySqlDataAdapter da = new MySqlDataAdapter(comando);
            da.Fill(dt);

            return dt;

        }

        public void agregarTratamiento(String codigoTratamiento, String nombre, Double precio, String descripcion, String codigoTipo)
        {
            consultar.ejecutar_consulta("INSERT INTO `bd_sac`.`tbl_tratamiento` (`codigoTratamiento`, `nombreTratamiento`, `precioTratamiento`, `descripcionTratamiento`, `codigoTipoTratamiento`) VALUES ('" + codigoTratamiento + "', '" + nombre + "', '" + precio + "', '" + descripcion + "', '" + codigoTipo + "');", con.abrir_conexion()).ExecuteNonQuery();
            con.cerrar_Conexion();
        }

        public void agregarTipoTratamiento(String codigo, String nombre)
        {
            consultar.ejecutar_consulta("INSERT INTO `bd_sac`.`tbl_tipotratamiento` (`codigoTipoTratamiento`, `nombreTipoTratamiento`) VALUES('" + codigo + "', '" + nombre + "');", con.abrir_conexion()).ExecuteNonQuery();
            con.cerrar_Conexion();
        }

        public void actualizarTratamiento(String codigoTratamiento, String nombre, Double precio, String descripcion, String codigoTipo)
        {

        }

        public String buscarCodigo(String nombre)
        {
            String codigo = "";
            MySqlDataReader buscar = consultar.ejecutar_consulta("Select codigoTipoTratamiento from tbl_tipotratamiento where nombreTipoTratamiento = '" + nombre + "';", con.abrir_conexion()).ExecuteReader();
            while (buscar.Read()) {
                codigo = buscar.GetString(0);
            }
            return codigo;
        }
        public DataTable Grid1()
        {
            DataTable dt = new DataTable();
            string consulta = "Select tbl_tratamiento.codigoTratamiento, tbl_tratamiento.nombreTratamiento, tbl_tratamiento.precioTratamiento, tbl_tipotratamiento.nombreTipoTratamiento from tbl_tratamiento, tbl_tipotratamiento where tbl_tratamiento.codigoTipoTratamiento = tbl_tipotratamiento.codigoTipoTratamiento order by codigoTratamiento;";
            MySqlCommand comando = new MySqlCommand(consulta, con.abrir_conexion());
            MySqlDataAdapter da = new MySqlDataAdapter(comando);
            da.Fill(dt);

            return dt;
        }
        public String[] mostrarDatos(String codigo)
        {
            String[] tratamiento = new string[6];
            MySqlDataReader busqueda = consultar.ejecutar_consulta("select tbl_tipotratamiento.codigoTipoTratamiento, tbl_tipotratamiento.nombreTipoTratamiento, tbl_tratamiento.codigoTratamiento, tbl_tratamiento.nombreTratamiento, tbl_tratamiento.precioTratamiento, tbl_tratamiento.descripcionTratamiento from tbl_tipotratamiento, tbl_tratamiento where tbl_tratamiento.codigoTratamiento = '"+codigo+"' and tbl_tratamiento.codigoTipoTratamiento = tbl_tipotratamiento.codigoTipoTratamiento;", con.abrir_conexion()).ExecuteReader();
            while (busqueda.Read())
            {
                for (int i = 0; i <= 5; i++)
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
        public void eliminarTratamiento(String codigo)
        {
            consultar.ejecutar_consulta("delete from tbl_tratamiento where codigoTratamiento = '"+codigo+"';", con.abrir_conexion()).ExecuteNonQuery();
            con.cerrar_Conexion();
        }
    }
}