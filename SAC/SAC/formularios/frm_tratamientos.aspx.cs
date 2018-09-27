using System;
using System.Collections;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SAC.formularios
{
    public partial class frm_tratamientos : System.Web.UI.Page
    {
        metodos.metodosTratamientos funciones = new metodos.metodosTratamientos();
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!Page.IsPostBack)

                {

                    DropDownList2.DataSource = funciones.TipoTratamiento();
                    DropDownList2.DataBind();
                    DropDownList2.DataTextField = "nombreTipoTratamiento";
                    DropDownList2.Items.Insert(0, new ListItem("Tipos de tratamientos", "0"));
                }

                GridView1.DataSource = funciones.Grid1();
                GridView1.DataBind();
                GridView2.DataSource = funciones.Grid1();
                GridView2.DataBind();
            }
            catch
            {

            }




        }

        protected void btn_guardar_Click(object sender, EventArgs e)
        {
            if (DropDownList2.SelectedIndex == 0)
            {
                if (txt_codigoTipo.Text == "")
                {
                    string scriptt = @"<script type='text/javascript'>
                    alert('Completa este campo');
                    </script>";
                    ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", scriptt, false);
                    txt_codigoTipo.Focus();
                }
                else if (txt_nombreTipo.Text == "")
                {
                    string scriptt = @"<script type='text/javascript'>
                    alert('Completa este campo');
                    </script>";
                    ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", scriptt, false);
                    txt_nombreTipo.Focus();
                }
                else if (txt_codigoTratamiento.Text == "")
                {
                    string scriptt = @"<script type='text/javascript'>
                    alert('Completa este campo');
                    </script>";
                    ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", scriptt, false);
                    txt_codigoTratamiento.Focus();
                }
                else if (txt_nombreTratamiento.Text == "")
                {
                    string scriptt = @"<script type='text/javascript'>
                    alert('Completa este campo');
                    </script>";
                    ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", scriptt, false);
                    txt_nombreTratamiento.Focus();
                }
                else if (txt_precioTratamiento.Text == "")
                {
                    string scriptt = @"<script type='text/javascript'>
                    alert('Completa este campo');
                    </script>";
                    ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", scriptt, false);
                    txt_precioTratamiento.Focus();
                }
                else
                {
                    funciones.agregarTipoTratamiento(txt_codigoTipo.Text, txt_nombreTipo.Text);
                    funciones.agregarTratamiento(txt_codigoTratamiento.Text, txt_nombreTratamiento.Text, Convert.ToDouble(txt_precioTratamiento.Text), txt_descripcion.Value, txt_codigoTipo.Text);
                    string scriptt = @"<script type='text/javascript'>
                    alert('Se registró la información correctamente');
                    </script>";
                    ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", scriptt, false);
                }
            }
            else
            {
                if (txt_codigoTratamiento.Text == "")
                {
                    string scriptt = @"<script type='text/javascript'>
                    alert('Completa este campo');
                    </script>";
                    ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", scriptt, false);
                    txt_codigoTratamiento.Focus();
                }
                else if (txt_nombreTratamiento.Text == "")
                {
                    string scriptt = @"<script type='text/javascript'>
                    alert('Completa este campo');
                    </script>";
                    ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", scriptt, false);
                    txt_nombreTratamiento.Focus();
                }
                else if (txt_precioTratamiento.Text == "")
                {
                    string scriptt = @"<script type='text/javascript'>
                    alert('Completa este campo');
                    </script>";
                    ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", scriptt, false);
                    txt_precioTratamiento.Focus();
                }
                else
                {
                    String codigo = funciones.buscarCodigo(DropDownList2.SelectedItem.Text);
                    funciones.agregarTratamiento(txt_codigoTratamiento.Text, txt_nombreTratamiento.Text, Convert.ToDouble(txt_precioTratamiento.Text), txt_descripcion.Value, codigo);
                    string scriptt = @"<script type='text/javascript'>
                    alert('Se registró la información correctamente');</script>";
                    ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", scriptt, false);
                }
            }
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            //if (e.Row.RowType == DataControlRowType.DataRow)
            //{
            //    e.Row.Attributes["onclick"] = Page.ClientScript.GetPostBackClientHyperlink(GridView1, "Select$" + e.Row.RowIndex);
            //    e.Row.ToolTip = "Click para seleccionar esta fila.";
            //}
        }

        // Metodo con el header de la tabla para la busqueda
        protected void OnDataBound(object sender, EventArgs e)
        {
            //GridViewRow row = new GridViewRow(0, 0, DataControlRowType.Header, DataControlRowState.Normal);
            //for (int i = 0; i < GridView1.Columns.Count; i++)
            //{
            //    TableHeaderCell cell = new TableHeaderCell();
            //    TextBox txtSearch = new TextBox();
            //    txtSearch.Attributes["placeholder"] = GridView1.Columns[i].HeaderText;
            //    txtSearch.CssClass = "search_textbox";
            //    cell.Controls.Add(txtSearch);
            //    row.Controls.Add(cell);
            //}
            //    GridView1.HeaderRow.Parent.Controls.AddAt(1, row);
        }

        protected void btn_actualizar_Click(object sender, EventArgs e)
        {

        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            //String codigo;
            //String[] datos = new string[6];
            ////string script = @"<script type='text/javascript'>
            ////        document.getElementById('camposModificar').style.display = 'block';
            ////        document.getElementById('camposModificar').scrollIntoView();
            ////        </ script > ";
            ////ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", script, false);

            //foreach (GridViewRow row in GridView1.Rows)
            //{
            //    if (row.RowIndex == GridView1.SelectedIndex)
            //    {
            //        row.BackColor = ColorTranslator.FromHtml("#A1DCF2");
            //        row.ToolTip = string.Empty;
            //        codigo = row.Cells[1].Text;
            //        datos = funciones.mostrarDatos(codigo);
            //        txt_codigoTipoAct.Text = datos[0];
            //        txt_nombreTipoAct.Text = datos[1];
            //        txt_codigoTratamientoAct.Text = datos[2];
            //        txt_nombreTratamientoAct.Text = datos[3];
            //        txt_precioAct.Text = datos[4];
            //        txt_descripcionAct.InnerText = datos[5];

            //    }
            //    else
            //    {
            //        row.BackColor = ColorTranslator.FromHtml("#FFFFFF");
            //        row.ToolTip = "Click to select this row.";
            //    }
            //}
        }

        protected void GridView2_SelectedIndexChanged(object sender, EventArgs e)
        {
            String codigo;
            String[] datos = new string[6];
            //string script = @"<script type='text/javascript'>
            //        document.getElementById('camposModificar').style.display = 'block';
            //        document.getElementById('camposModificar').scrollIntoView();
            //        </ script > ";
            //ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", script, false);

            foreach (GridViewRow row in GridView2.Rows)
            {
                if (row.RowIndex == GridView2.SelectedIndex)
                {
                    row.BackColor = ColorTranslator.FromHtml("#A1DCF2");
                    row.ToolTip = string.Empty;
                    codigo = row.Cells[0].Text;
                    datos = funciones.mostrarDatos(codigo);
                    codigoTipoTraEli.InnerText = datos[0];
                    nombreTipoTraEli.InnerText = datos[1];
                    codigoTraEli.InnerText = datos[2];
                    NombreTraEli.InnerText = datos[3];
                    PrecioTraEli.InnerText = datos[4];
                    DescriTraEli.InnerText = datos[5];

                }
                else
                {
                    row.BackColor = ColorTranslator.FromHtml("#FFFFFF");
                    row.ToolTip = "Click to select this row.";
                }
            }
        }

        protected void GridView2_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Attributes["onclick"] = Page.ClientScript.GetPostBackClientHyperlink(GridView2, "Select$" + e.Row.RowIndex);
                e.Row.ToolTip = "Click para seleccionar esta fila.";
            }
        }

        protected void GridView2_DataBound(object sender, EventArgs e)
        {
            GridViewRow row = new GridViewRow(0, 0, DataControlRowType.Header, DataControlRowState.Normal);
            for (int i = 0; i < GridView2.Columns.Count; i++)
            {
                TableHeaderCell cell = new TableHeaderCell();
                TextBox txtSearch = new TextBox();
                txtSearch.Attributes["placeholder"] = GridView2.Columns[i].HeaderText;
                txtSearch.CssClass = "search_textbox";
                cell.Controls.Add(txtSearch);
                row.Controls.Add(cell);
            }
            GridView2.HeaderRow.Parent.Controls.AddAt(1, row);
        }

        protected void btn_eliminar_Click(object sender, EventArgs e)
        {
            funciones.eliminarTratamiento(codigoTraEli.InnerText);
        }
    }
}