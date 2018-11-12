using MySql.Data.MySqlClient;
using System;
using System.Collections;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SAC.metodos
{

    public class Metodos_Ventas
    {
        consulta.consulta consultar = new consulta.consulta();
        conexion.conexion con = new conexion.conexion();

        public DataTable VentaPendiente()
        {
            string consulta = "select tbl_paciente.cedulaPaciente, tbl_paciente.nombre1Paciente, tbl_paciente.nombre2Paciente, tbl_paciente.apellido1Paciente, tbl_paciente.apellido2Paciente from tbl_paciente, tbl_expediente, tbl_expedientetramiento where tbl_paciente.cedulaPaciente = tbl_expediente.cedulaPaciente and tbl_expediente.codigoExpediente = tbl_expedientetramiento.codigoExpediente and tbl_expedientetramiento.EstadoPago = false group by tbl_expedientetramiento.codigoExpediente;";
            MySqlCommand comando = new MySqlCommand(consulta, con.abrir_conexion());
            MySqlDataAdapter da = new MySqlDataAdapter(comando);
            using (DataTable dt = new DataTable())
            {
                da.Fill(dt);
                return dt;
            }

        }

        public DataTable DetalleVenta( String cedula)
        {
            string consulta = "select tbl_tratamiento.nombreTratamiento, tbl_expedientetramiento.fechaExpedienteTratamiento, tbl_expedientetramiento.descripcionExpedienteTratamiento, tbl_tratamiento.precioTratamiento from tbl_tratamiento, tbl_expedientetramiento, tbl_paciente, tbl_expediente where tbl_expediente.cedulaPaciente = '"+cedula+"' and tbl_expediente.codigoExpediente = tbl_expedientetramiento.codigoExpediente and tbl_expedientetramiento.EstadoPago = false and tbl_expedientetramiento.codigoTratamiento = tbl_tratamiento.codigoTratamiento group by tbl_expedientetramiento.fechaExpedienteTratamiento;";
            MySqlCommand comando = new MySqlCommand(consulta, con.abrir_conexion());
            MySqlDataAdapter da = new MySqlDataAdapter(comando);
            using (DataTable dt = new DataTable())
            {
                da.Fill(dt);
                return dt;
            }

        }

        public void TerminarVenta(String codigo)
        {
            consultar.ejecutar_consulta("UPDATE `bd_sac`.`tbl_expedientetramiento` SET `estadoPago`= true WHERE `codigoExpedienteTratamiento`='" + codigo + "';", con.abrir_conexion()).ExecuteNonQuery();
            con.cerrar_Conexion();
        }

        public void AgregarVenta(String cedula, String fecha, String detalle, String total, String saldo)
        {
            consultar.ejecutar_consulta("INSERT INTO `bd_sac`.`tbl_venta` (`cedulaPaciente`, `fechaVenta`, `detalleVenta`, `montoTotalVenta`, `saldoVenta`) VALUES('" + cedula + "','" + fecha + "','" + detalle + "','" + total + "','" + saldo + "');", con.abrir_conexion()).ExecuteNonQuery();
            con.cerrar_Conexion();
        }

        public String UltimaVenta()
        {
            String codigo = "";
            MySqlDataReader busqueda = consultar.ejecutar_consulta("select codigoVenta from tbl_venta order by codigoVenta desc limit 1;", con.abrir_conexion()).ExecuteReader();
            while (busqueda.Read())
            {
                codigo = busqueda.GetString(0);
            }
            return codigo;
        }

        public String CodigoExpedienteTratamiento(String fecha)
        {
            String codigo = "";
            MySqlDataReader busqueda = consultar.ejecutar_consulta("select codigoExpedienteTratamiento from tbl_expedientetramiento where fechaExpedienteTratamiento = '"+fecha+"';", con.abrir_conexion()).ExecuteReader();
            while (busqueda.Read())
            {
                codigo = busqueda.GetString(0);
            }
            return codigo;
        }

        public void AgregarAbono(String codigoVenta, String abono, String fecha)
        {
            consultar.ejecutar_consulta("INSERT INTO `bd_sac`.`tbl_abono` (`codigoVenta`, `montoAbono`, `fechaAbono`) VALUES('" + codigoVenta + "','" + abono + "','" + fecha + "');", con.abrir_conexion()).ExecuteNonQuery();
            con.cerrar_Conexion();
        }

        public DataTable CuentaXCobrar()
        {
            string consulta = "select tbl_venta.codigoVenta, tbl_venta.cedulaPaciente, tbl_paciente.nombre1Paciente, tbl_paciente.apellido1Paciente, tbl_venta.fechaVenta, tbl_venta.detalleVenta, tbl_venta.montoTotalVenta, tbl_venta.saldoVenta from tbl_venta, tbl_paciente where tbl_venta.saldoVenta > 0 and tbl_venta.cedulaPaciente = tbl_paciente.cedulaPaciente order by tbl_venta.cedulaPaciente;";
            MySqlCommand comando = new MySqlCommand(consulta, con.abrir_conexion());
            MySqlDataAdapter da = new MySqlDataAdapter(comando);
            using (DataTable dt = new DataTable())
            {
                da.Fill(dt);
                return dt;
            }

        }

        public DataTable DetalleAbono(String codigo)
        {
            string consulta = "select tbl_abono.codigo_abono, tbl_abono.codigoVenta, tbl_abono.fechaAbono, tbl_abono.montoAbono from tbl_abono where tbl_abono.codigoVenta = '"+codigo+"';";
            MySqlCommand comando = new MySqlCommand(consulta, con.abrir_conexion());
            MySqlDataAdapter da = new MySqlDataAdapter(comando);
            using (DataTable dt = new DataTable())
            {
                da.Fill(dt);
                return dt;
            }

        }
        public void ActualizarSaldo(String codigoVenta, Double saldoVenta)
        {
            consultar.ejecutar_consulta("UPDATE `bd_sac`.`tbl_venta` SET `saldoVenta`= "+saldoVenta+" WHERE `codigoVenta`='" + codigoVenta + "';", con.abrir_conexion()).ExecuteNonQuery();
            con.cerrar_Conexion();
        }

        public DataTable BuscarVenta(String fecha1, String fecha2)
        {
            string consulta = "select * from tbl_venta where tbl_venta.fechaVenta between '" + fecha1 + "' and '" + fecha2 + "';";
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