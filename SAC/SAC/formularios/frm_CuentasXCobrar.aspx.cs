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
    public partial class frm_CuentasXCobrar : System.Web.UI.Page
    {
        metodos.Metodos_Ventas cuenta = new metodos.Metodos_Ventas();
        public static String codigoVenta = "";
        public static Double saldoVenta = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["acceder"] == null)
            {
                Response.Redirect("frmLogin.aspx");
            }
            else
            {
                if (!this.IsPostBack)
                {
                    txtSearch.Focus();
                    try
                    {

                        if (cuenta.CuentaXCobrar().Rows.Count == 0)
                        {
                            string scripts = @"<script type='text/javascript'>
                    alert('No hay cuentas por cobrar');
                    </script>";
                            ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", scripts, false);
                        }
                        else
                        {
                            string scripts = @"<script type='text/javascript'>
                                document.getElementById('presentar').style.display = 'block';
                                </script>";
                            ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", scripts, false);


                            Gridview_CxC.DataSource = cuenta.CuentaXCobrar();
                            Gridview_CxC.DataBind();
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
            }
        }

        protected void Gridview_CxC_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                foreach (GridViewRow row in Gridview_CxC.Rows)
                {
                    if (row.RowIndex == Gridview_CxC.SelectedIndex)
                    {
                        row.BackColor = ColorTranslator.FromHtml("#A1DCF2");
                        row.ToolTip = string.Empty;
                        codigoVenta = row.Cells[0].Text;
                        saldoVenta = Convert.ToDouble(row.Cells[6].Text);
                        String detalle = cuenta.BuscarDetalle(codigoVenta);
                        DataTable tabla = cuenta.DetalleAbono(codigoVenta);
                        if (tabla.Rows.Count <= 0)
                        {
                            string scripts = @"<script type='text/javascript'>
                                document.getElementById('cabecera').style.display = 'none';
                                document.getElementById('abonosNo').style.display = 'block';
                                document.getElementById('seccionAbono').style.display = 'block';
                                </script>";
                            ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", scripts, false);
                            lbl_detalle1.Text = detalle;
                        }
                        else
                        {
                            string scriptt = @"<script type='text/javascript'>
                                    document.getElementById('abonosNo').style.display = 'none';
                                    document.getElementById('cabecera').style.display = 'block';
                                    document.getElementById('seccionAbono').style.display = 'block';
                                    </script>";
                            ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", scriptt, false);
                            ScriptManager.RegisterStartupScript(Page, typeof(Page), "scrollCXC", "setTimeout(scrollCXC, 1);", true);

                            lbl_detalle.Text = detalle;
                            Gridview_Venta.DataSource = tabla;
                            Gridview_Venta.DataBind();
                        }

                        txt_abono.Focus();
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
                string scripts = @"<script type='text/javascript'>
                    alert('No se pudo realizar la operación!');
                    </script>";
                ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", scripts, false);
            }
        }

        protected void Gridview_CxC_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Attributes["onclick"] = Page.ClientScript.GetPostBackClientHyperlink(Gridview_CxC, "select$" + e.Row.RowIndex);
                e.Row.ToolTip = "Click para seleccionar esta fila.";
            }
        }

        protected void btn_factura_Click(object sender, EventArgs e)
        {
            try
            {
                if (txt_abono.Value == "")
            {
                string scripts = @"<script type='text/javascript'>
                    alert('Para guardar un abono tiene que digitar un monto!');
                    document.getElementById('cabecera').style.display = 'block';
                    document.getElementById('seccionAbono').style.display = 'block';
                    </script>";
                ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", scripts, false);
                txt_abono.Focus();
            }
            else
            {
                DateTime date = DateTime.Now;
                String date2 = date.ToString("yyyy-MM-dd");
                Double abono = Convert.ToDouble(txt_abono.Value);
                if (abono > saldoVenta)
                {
                    string scripts = @"<script type='text/javascript'>
                            alert('El monto del abono no puede ser mayor al saldo pendiente!');
                            document.getElementById('cabecera').style.display = 'block';
                            </script>";
                    ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", scripts, false);
                    txt_abono.Value = "";
                    txt_abono.Focus();
                }
                else
                {
                    if (abono == saldoVenta)
                    {
                        cuenta.ActualizarSaldo(codigoVenta, 0);
                        cuenta.AgregarAbono(codigoVenta, abono.ToString(), date2);
                    }
                    else
                    {
                        cuenta.ActualizarSaldo(codigoVenta, saldoVenta - abono);
                        cuenta.AgregarAbono(codigoVenta, abono.ToString(), date2);
                    }
                    string script = @"<script type='text/javascript'>
                            alert('El abono se registró correctamente!');
                            </script>";
                    ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", script, false);
                    Gridview_CxC.DataSource = cuenta.CuentaXCobrar();
                    Gridview_CxC.DataBind();
                    txt_abono.Value = "";
                }

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
            Gridview_CxC.DataSource = cuenta.CuentaXCobrar2(txtSearch.Text.Trim());
            Gridview_CxC.DataBind();
        }

        protected void Gridview_CxC_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            Gridview_CxC.DataSource = cuenta.CuentaXCobrar2(txtSearch.Text.Trim());
            Gridview_CxC.PageIndex = e.NewPageIndex;
            Gridview_CxC.DataBind();
        }
    }
}