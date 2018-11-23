using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;
using System.Data;

namespace SAC.formularios
{
    public partial class frm_AgregarVenta : System.Web.UI.Page
    {
        metodos.Metodos_Ventas venta = new metodos.Metodos_Ventas();
        public static String cedula = "";
        public static String[] vector = new string[100];
        public static DataTable tabla1;
        public static DataTable tblInicio;

        public static int limite = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                txtSearch.Focus();
                try
                {
                    tblInicio = venta.VentaPendiente();
                    if (tblInicio.Rows.Count > 0)
                    {
                        Gridview_Paciente.DataSource = tblInicio;
                        Gridview_Paciente.DataBind();
                        string script = @"<script type='text/javascript'>
                        document.getElementById('titulo1').style.display = 'block';
                        </script>";
                        ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", script, false);
                    }
                    else
                    {
                        string script = @"<script type='text/javascript'>
                        document.getElementById('titulo1').style.display = 'none';
                        </script>";
                        ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", script, false);

                    }
                    //else
                    //{
                    //    string script = @"<script type='text/javascript'>
                    //alert('No hay ventas nuevas sin terminar');
                    //</script>";
                    //    ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", script, false);
                    //}
                }
                catch
                {

                }
            }

        }

        protected void Gridview_Paciente_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                foreach (GridViewRow row in Gridview_Paciente.Rows)
                {

                    if (row.RowIndex == Gridview_Paciente.SelectedIndex)
                    {
                        row.BackColor = ColorTranslator.FromHtml("#A1DCF2");
                        row.ToolTip = string.Empty;
                        cedula = row.Cells[0].Text;
                        Gridview_Venta.DataSource = venta.DetalleVenta(cedula);
                        Gridview_Venta.DataBind();
                        Double suma = 0;
                        tabla1 = venta.DetalleVenta(cedula);
                        limite = tabla1.Rows.Count - 1;
                        for (int i = 0; i <= limite; i++)
                        {
                            suma = suma + Convert.ToInt32(tabla1.Rows[i][3]);
                        }
                        lbl_total.InnerText = suma.ToString();
                        string script = @"<script type='text/javascript'>
                        document.getElementById('cabecera').style.display = 'block';
                        </script>";
                        ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", script, false);
                        ScriptManager.RegisterStartupScript(Page, typeof(Page), "scrollVenta", "setTimeout(scrollVenta, 1);", true);

                    }
                    else
                    {
                        row.BackColor = ColorTranslator.FromHtml("#FFFFFF");
                        row.ToolTip = "Click para seleccionar esta fila.";
                    }
                }
            }
            catch
            {

            }
        }

        protected void Gridview_Paciente_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Attributes["onclick"] = Page.ClientScript.GetPostBackClientHyperlink(Gridview_Paciente, "select$" + e.Row.RowIndex);
                e.Row.ToolTip = "Click para seleccionar esta fila.";
            }
        }

        protected void btn_factura_Click(object sender, EventArgs e)
        {
            try
            {
                double abono = 0;
                double total = Convert.ToDouble(lbl_total.InnerText);
                double extra = 0;
                if (txt_extra.Value != "")
                {
                    extra = Convert.ToDouble(txt_extra.Value);
                }
                if (txt_abono.Value != "")
                {
                    abono = Convert.ToDouble(txt_abono.Value);
                }
                double totalFinal = total + extra;
                double saldo = totalFinal - abono;
                if (abono > totalFinal)
                {
                    string scripts = @"<script type='text/javascript'>
                    alert('El abono no puede ser mayor al total de la venta!');
                    document.getElementById('cabecera').style.display = 'block';
                    </script>";
                    ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", scripts, false);
                    txt_abono.Value = "";
                    txt_abono.Focus();
                }
                else
                {
                    String codigo = "";
                    String fecha2 = "";
                    String detalle = "";
                    DateTime date = DateTime.Now;
                    String date2 = date.ToString("yyyy-MM-dd HH:mm:ss");
                    for (int i = 0; i <= limite; i++)
                    {
                        DateTime fecha = Convert.ToDateTime(tabla1.Rows[i][1]);
                        fecha2 = fecha.ToString("yyyy-MM-dd HH:mm:ss");
                        codigo = venta.CodigoExpedienteTratamiento(fecha2);
                        vector[i] = codigo;
                        detalle = detalle + tabla1.Rows[i][0] + " | ";
                    }
                    venta.AgregarVenta(cedula, date2, detalle, totalFinal.ToString(), saldo.ToString());
                    // Si el queda saldo pendiente, se agrega la venta como un abono
                    if (abono < totalFinal & abono > 0)
                    {
                        String codigoVenta = venta.UltimaVenta();
                        venta.AgregarAbono(codigoVenta, txt_abono.Value, date2);
                    }

                    // Asigna valor de true a los tratamientos que ya se pagaron
                    for (int i = 0; i <= limite; i++)
                    {
                        venta.TerminarVenta(vector[i]);
                    }
                    txt_abono.Value = "";
                    txt_extra.Value = "";
                    Gridview_Paciente.DataSource = venta.VentaPendiente();
                    Gridview_Paciente.DataBind();
                }
            }
            catch
            {
                string scripts = @"<script type='text/javascript'>
                        alert('No se pudo realizar la operación!');
                        </script>";
                ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", scripts, false);
            }
        }


        protected void InvisButton_Click(object sender, EventArgs e)
        {
            Gridview_Paciente.DataSource = venta.VentaPendiente2(txtSearch.Text.Trim());
            Gridview_Paciente.DataBind();

            if (Gridview_Paciente.Rows.Count > 0)
            {
                string script = @"<script type='text/javascript'>
                        document.getElementById('cabecera').style.display = 'none';
                        document.getElementById('titulo1').style.display = 'block';
                        </script>";
                ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", script, false);
            }
            else
            {
                string script = @"<script type='text/javascript'>
                        document.getElementById('cabecera').style.display = 'none';
                        document.getElementById('titulo1').style.display = 'none';
                        </script>";
                ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", script, false);
            }


        }

        protected void Gridview_Paciente_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            Gridview_Paciente.DataSource = venta.VentaPendiente2(txtSearch.Text.Trim());
            Gridview_Paciente.PageIndex = e.NewPageIndex;
            Gridview_Paciente.DataBind();
            string script = @"<script type='text/javascript'>
                        document.getElementById('cabecera').style.display = 'none';
                        document.getElementById('titulo1').style.display = 'none';
                        </script>";
            ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", script, false);
        }
    }
}