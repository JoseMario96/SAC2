using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using MySql.Data.MySqlClient;

namespace SAC.metodos
{
    public class metodos_login
    {
        consulta.consulta consultar = new consulta.consulta();
        conexion.conexion con = new conexion.conexion();

        public Boolean Estausuario(String usuario)
        {
            Boolean esta = false;
            MySqlDataReader busqueda = consultar.ejecutar_consulta("call bd_sac.pa_user('" + usuario + "');", con.abrir_conexion()).ExecuteReader();
            while (busqueda.Read())
            {
                esta = true;
            }
            con.cerrar_Conexion();
            return esta;
        }

        public String Correo(String usuario)
        {
            String esta = "";
            MySqlDataReader busqueda = consultar.ejecutar_consulta("call bd_sac.pa_user('" + usuario + "');", con.abrir_conexion()).ExecuteReader();
            while (busqueda.Read())
            {
                esta = busqueda.GetString(0);
            }
            con.cerrar_Conexion();
            return esta;
        }

        public Boolean EstaContra(String contrasena)
        {
            Boolean esta = false;
            MySqlDataReader busqueda = consultar.ejecutar_consulta("call bd_sac.pa_password('" + contrasena + "');", con.abrir_conexion()).ExecuteReader();
            while (busqueda.Read())
            {
                esta = true;
            }
            con.cerrar_Conexion();
            return esta;
        }

        public Boolean Login(String usuario, String contrasena)
        {
            Boolean esta = false;
            MySqlDataReader busqueda = consultar.ejecutar_consulta("call bd_sac.pa_login('" + usuario.ToString() + "', '" + contrasena.ToString() + "');", con.abrir_conexion()).ExecuteReader();
            while (busqueda.Read())
            {
                esta = true;
            }
            con.cerrar_Conexion();
            return esta;
        }

        public int Permiso(String usuario)
        {
            int retorno = 0;
            MySqlDataReader busqueda = consultar.ejecutar_consulta("call bd_sac.pa_permiso('" + usuario.ToString() + "');", con.abrir_conexion()).ExecuteReader();
            while (busqueda.Read())
            {
                retorno = Convert.ToInt32(busqueda.GetString(0));
            }
            con.cerrar_Conexion();
            return retorno;
        }

        public void TemporalC(String usuario, String contrasena)
        {
            consultar.ejecutar_consulta("call bd_sac.pa_temporal('"+usuario+"', '"+contrasena+"');", con.abrir_conexion()).ExecuteNonQuery();
            con.cerrar_Conexion();
        }

        public void AgregarUsuario(String usuario, String contrasena, String correo, int tipo)
        {
            consultar.ejecutar_consulta("call bd_sac.pa_agregarUsuario('"+usuario+"', '"+contrasena+"', '"+correo+"', "+tipo+");", con.abrir_conexion()).ExecuteNonQuery();
            con.cerrar_Conexion();
        }

        public DataTable BuscarUsuarios()
        {
            string consulta = "call bd_sac.pa_TodosUsuarios();";
            MySqlCommand comando = new MySqlCommand(consulta, con.abrir_conexion());
            MySqlDataAdapter da = new MySqlDataAdapter(comando);
            using (DataTable dt = new DataTable())
            {
                da.Fill(dt);
                con.cerrar_Conexion();
                return dt;
            }
        }

        public String BuscarEstado(String usuario)
        {
            String estado = "";
            MySqlDataReader busqueda = consultar.ejecutar_consulta("call bd_sac.pa_EstadoUsuario('"+usuario+"');", con.abrir_conexion()).ExecuteReader();
            while (busqueda.Read())
            {
                estado = busqueda.GetString(0);
            }
            con.cerrar_Conexion();
            return estado;
        }

        public void ActualizarUsuario(String usuario, String correo, int tipo)
        {
            consultar.ejecutar_consulta("call bd_sac.pa_ActUsuario('"+usuario+"', '"+correo+"', "+tipo+");", con.abrir_conexion()).ExecuteNonQuery();
            con.cerrar_Conexion();
        }

        public void HabilitacionUsuario(String usuario, int estado)
        {
            consultar.ejecutar_consulta("call bd_sac.pa_Habilitacion('" + usuario + "', " + estado + ");", con.abrir_conexion()).ExecuteNonQuery();
            con.cerrar_Conexion();
        }
    }
}