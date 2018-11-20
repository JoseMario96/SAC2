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
        public DataTable VentaPendiente2(String nom)
        {
            DataTable dt = new DataTable();
            try
            {
                string consulta = "select tbl_paciente.cedulaPaciente, tbl_paciente.nombre1Paciente, tbl_paciente.nombre2Paciente, tbl_paciente.apellido1Paciente, tbl_paciente.apellido2Paciente from tbl_paciente, tbl_expediente, tbl_expedientetramiento where nombre1Paciente like '%" + nom + "%' and tbl_paciente.cedulaPaciente = tbl_expediente.cedulaPaciente and tbl_expediente.codigoExpediente = tbl_expedientetramiento.codigoExpediente and tbl_expedientetramiento.EstadoPago = false group by tbl_expedientetramiento.codigoExpediente;";
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

        public DataTable DetalleVenta(String cedula)
        {
            string consulta = "select tbl_tratamiento.nombreTratamiento, tbl_expedientetramiento.fechaExpedienteTratamiento, tbl_expedientetramiento.descripcionExpedienteTratamiento, tbl_tratamiento.precioTratamiento from tbl_tratamiento, tbl_expedientetramiento, tbl_paciente, tbl_expediente where tbl_expediente.cedulaPaciente = '" + cedula + "' and tbl_expediente.codigoExpediente = tbl_expedientetramiento.codigoExpediente and tbl_expedientetramiento.EstadoPago = false and tbl_expedientetramiento.codigoTratamiento = tbl_tratamiento.codigoTratamiento group by tbl_expedientetramiento.fechaExpedienteTratamiento;";
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
            MySqlDataReader busqueda = consultar.ejecutar_consulta("select codigoExpedienteTratamiento from tbl_expedientetramiento where fechaExpedienteTratamiento = '" + fecha + "';", con.abrir_conexion()).ExecuteReader();
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
            string consulta = "select tbl_venta.codigoVenta, tbl_venta.cedulaPaciente, tbl_paciente.nombre1Paciente, tbl_paciente.apellido1Paciente, DATE_FORMAT(tbl_venta.fechaVenta,'%d-%m-%Y'), tbl_venta.montoTotalVenta, tbl_venta.saldoVenta from tbl_venta, tbl_paciente where tbl_venta.saldoVenta > 0 and tbl_venta.cedulaPaciente = tbl_paciente.cedulaPaciente order by tbl_venta.cedulaPaciente;";
            MySqlCommand comando = new MySqlCommand(consulta, con.abrir_conexion());
            MySqlDataAdapter da = new MySqlDataAdapter(comando);
            using (DataTable dt = new DataTable())
            {
                da.Fill(dt);
                return dt;
            }

        }

        public DataTable CuentaXCobrar2(String nom)
        {
            DataTable dt = new DataTable();
            try
            {
                string consulta = "select tbl_venta.codigoVenta, tbl_venta.cedulaPaciente, tbl_paciente.nombre1Paciente, tbl_paciente.apellido1Paciente, tbl_venta.fechaVenta, tbl_venta.montoTotalVenta, tbl_venta.saldoVenta from tbl_venta, tbl_paciente where nombre1Paciente like'%" + nom + "%' and tbl_venta.saldoVenta > 0 and tbl_venta.cedulaPaciente = tbl_paciente.cedulaPaciente order by tbl_venta.cedulaPaciente;";
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
        public String BuscarDetalle(String codigo)
        {
            String detalle = "";
            MySqlDataReader busqueda = consultar.ejecutar_consulta("select tbl_venta.detalleVenta from tbl_venta where tbl_venta.codigoVenta = '" + codigo + "';", con.abrir_conexion()).ExecuteReader();
            while (busqueda.Read())
            {
                detalle = busqueda.GetString(0);
            }
            return detalle;
        }

        public DataTable DetalleAbono(String codigo)
        {
            string consulta = "select tbl_abono.codigo_abono, tbl_abono.codigoVenta, DATE_FORMAT(fechaAbono,'%d-%m-%Y'), tbl_abono.montoAbono from tbl_abono where tbl_abono.codigoVenta = '" + codigo + "';";
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
            consultar.ejecutar_consulta("UPDATE `bd_sac`.`tbl_venta` SET `saldoVenta`= " + saldoVenta + " WHERE `codigoVenta`='" + codigoVenta + "';", con.abrir_conexion()).ExecuteNonQuery();
            con.cerrar_Conexion();
        }

        public DataTable BuscarVenta(String fecha1, String fecha2)
        {
            string consulta = "select tbl_venta.codigoVenta, tbl_venta.cedulaPaciente, DATE_FORMAT(tbl_venta.fechaVenta,'%d-%m-%Y'), tbl_venta.detalleVenta, tbl_venta.montoTotalVenta, tbl_venta.saldoVenta from tbl_venta where tbl_venta.fechaVenta between '" + fecha1 + "' and '" + fecha2 + "';";
            MySqlCommand comando = new MySqlCommand(consulta, con.abrir_conexion());
            MySqlDataAdapter da = new MySqlDataAdapter(comando);
            using (DataTable dt = new DataTable())
            {
                da.Fill(dt);
                return dt;
            }

        }

        public DataTable TodaslasVentas()
        {
            DataTable dt = new DataTable();
            try
            {
                string consulta = "select tbl_Venta.codigoVenta, tbl_Paciente.nombre1Paciente, tbl_paciente.apellido1Paciente, tbl_venta.fechaVenta from tbl_paciente, tbl_venta where tbl_paciente.cedulaPaciente = tbl_venta.cedulaPaciente;";
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


        public DataTable TodaslasVentas2(String nom)
        {
            DataTable dt = new DataTable();
            try
            {
                string consulta = "select tbl_Venta.codigoVenta, tbl_Paciente.nombre1Paciente, tbl_paciente.apellido1Paciente, tbl_venta.fechaVenta from tbl_paciente, tbl_venta where nombre1Paciente like '%" + nom + "%' and tbl_paciente.cedulaPaciente = tbl_venta.cedulaPaciente;";
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

        public String[] BuscarVenta(String codigo)
        {
            String[] vector = new String[6];
            MySqlDataReader busqueda = consultar.ejecutar_consulta("select tbl_venta.codigoVenta, tbl_venta.CedulaPaciente, tbl_venta.fechaVenta, tbl_venta.detalleVenta, tbl_venta.montoTotalVenta, tbl_venta.saldoVenta from tbl_venta where tbl_venta.codigoVenta = '" + codigo + "';", con.abrir_conexion()).ExecuteReader();
            while (busqueda.Read())
            {
                for (int i = 0; i <= 5; i++)
                {
                    if (busqueda.IsDBNull(i))
                    {
                        vector[i] = "";
                    }
                    else
                    {
                        vector[i] = busqueda.GetString(i);
                    }

                }
            }
            con.cerrar_Conexion();
            return vector;
        }

        public DataTable CuentaXCobrarReporte()
        {
            string consulta = "select tbl_venta.cedulaPaciente, tbl_paciente.nombre1Paciente, tbl_paciente.nombre2Paciente, tbl_paciente.apellido1Paciente, tbl_paciente.apellido2Paciente from tbl_venta, tbl_paciente where tbl_venta.saldoVenta > 0 and tbl_venta.cedulaPaciente = tbl_paciente.cedulaPaciente group by tbl_venta.cedulaPaciente;";
            MySqlCommand comando = new MySqlCommand(consulta, con.abrir_conexion());
            MySqlDataAdapter da = new MySqlDataAdapter(comando);
            using (DataTable dt = new DataTable())
            {
                da.Fill(dt);
                return dt;
            }

        }
        public DataTable CuentaXCobrarReporte2(String nom)
        {
            string consulta = "select tbl_venta.cedulaPaciente, tbl_paciente.nombre1Paciente, tbl_paciente.nombre2Paciente, tbl_paciente.apellido1Paciente, tbl_paciente.apellido2Paciente from tbl_venta, tbl_paciente where nombre1Paciente like '%" + nom + "%' and tbl_venta.saldoVenta > 0 and tbl_venta.cedulaPaciente = tbl_paciente.cedulaPaciente group by tbl_venta.cedulaPaciente;";
            MySqlCommand comando = new MySqlCommand(consulta, con.abrir_conexion());
            MySqlDataAdapter da = new MySqlDataAdapter(comando);
            using (DataTable dt = new DataTable())
            {
                da.Fill(dt);
                return dt;
            }

        }
        public DataTable CuentaXCobrarImprimir()
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

        public DataTable PersonaVenta(String cedula)
        {
            string consulta = "select tbl_venta.cedulaPaciente, tbl_paciente.nombre1Paciente, tbl_paciente.nombre2Paciente, tbl_paciente.apellido1Paciente, tbl_paciente.apellido2Paciente, tbl_venta.codigoVenta, tbl_venta.fechaVenta, tbl_venta.detalleVenta, tbl_venta.montoTotalVenta, tbl_venta.saldoVenta from tbl_venta, tbl_paciente where tbl_venta.saldoVenta > 0 and tbl_venta.cedulaPaciente = '" + cedula + "' and tbl_venta.cedulaPaciente = tbl_paciente.cedulaPaciente order by tbl_venta.codigoVenta;";
            MySqlCommand comando = new MySqlCommand(consulta, con.abrir_conexion());
            MySqlDataAdapter da = new MySqlDataAdapter(comando);
            using (DataTable dt = new DataTable())
            {
                da.Fill(dt);
                return dt;
            }
        }

        public DataTable PersonaCuenta(String codigo)
        {
            string consulta = "select tbl_abono.codigo_abono, tbl_abono.codigoVenta, tbl_abono.montoAbono, tbl_abono.fechaAbono from tbl_abono where tbl_abono.codigoVenta = '" + codigo + "' order by tbl_abono.codigoVenta;";
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