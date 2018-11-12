using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;

namespace SAC.formularios
{
    public partial class frm_CuentasXCobrar : System.Web.UI.Page
    {
        metodos.Metodos_Ventas cuenta = new metodos.Metodos_Ventas();
        public static String codigoVenta = "";
        public static Double saldoVenta = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                Gridview_CxC.DataSource = cuenta.CuentaXCobrar();
                Gridview_CxC.DataBind();
            }
            catch
            {

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
                        saldoVenta = Convert.ToDouble(row.Cells[7].Text);
                        Gridview_Venta.DataSource = cuenta.DetalleAbono(codigoVenta);
                        Gridview_Venta.DataBind();
                        string script = @"<script type='text/javascript'>
                            document.getElementById('cabecera').style.display = 'block';
                            </script>";
                        ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", script, false);
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

        protected void Gridview_CxC_DataBound(object sender, EventArgs e)
        {
            GridViewRow row = new GridViewRow(0, 0, DataControlRowType.Header, DataControlRowState.Normal);
            for (int i = 0; i < Gridview_CxC.Columns.Count; i++)
            {
                TableHeaderCell cell = new TableHeaderCell();
                TextBox txtSearch = new TextBox();
                txtSearch.Attributes["placeholder"] = Gridview_CxC.Columns[i].HeaderText;
                txtSearch.CssClass = "search_textbox";
                cell.Controls.Add(txtSearch);
                row.Controls.Add(cell);
            }
            Gridview_CxC.HeaderRow.Parent.Controls.AddAt(1, row);
        }
    }
}