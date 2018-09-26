using System;
using System.Collections.Generic;
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
            if (!Page.IsPostBack)
            {
                DropDownList2.DataSource = funciones.TipoTratamiento();
                DropDownList2.DataBind();
                DropDownList2.DataTextField = "nombreTipoTratamiento";
                DropDownList2.Items.Insert(0, new ListItem("Tipos de tratamientos", "0"));
                GridView1.DataSource = funciones.Grid1();
                GridView1.DataBind();
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
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                //e.Row.Attributes["onmouseover"] = "this.style.backgroundColor='aquamarine';";
                //e.Row.Attributes["onmouseout"] = "this.style.backgroundColor='white';";
                e.Row.Attributes["onclick"] = Page.ClientScript.GetPostBackClientHyperlink(GridView1, "Select$" + e.Row.RowIndex);
                e.Row.ToolTip = "Click para seleccionar esta fila.";

            }
        }

        // Metodo con el header de la tabla para la busqueda
        protected void OnDataBound(object sender, EventArgs e)
        {
            GridViewRow row = new GridViewRow(0, 0, DataControlRowType.Header, DataControlRowState.Normal);
            for (int i = 0; i < GridView1.Columns.Count; i++)
            {
                TableHeaderCell cell = new TableHeaderCell();
                TextBox txtSearch = new TextBox();
                txtSearch.Attributes["placeholder"] = GridView1.Columns[i].HeaderText;
                txtSearch.CssClass = "search_textbox";
                cell.Controls.Add(txtSearch);
                row.Controls.Add(cell);
            }
            GridView1.HeaderRow.Parent.Controls.AddAt(1, row);
        }

        protected void btn_actualizar_Click(object sender, EventArgs e)
        {

        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}