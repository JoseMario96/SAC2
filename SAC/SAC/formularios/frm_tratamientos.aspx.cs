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
                if (!IsPostBack)
                {

                    GridView2.DataSource = funciones.Grid1();
                    GridView2.DataBind();
                    DropDownList2.DataSource = funciones.TipoTratamiento();
                    DropDownList2.DataBind();
                    DropDownList2.DataTextField = "nombreTipoTratamiento";
                    DropDownList2.Items.Insert(0, new ListItem("Tipos de tratamientos", "0"));
                    DropDownList1.DataSource = funciones.TipoTratamiento();
                    DropDownList1.DataBind();
                    DropDownList1.DataTextField = "nombreTipoTratamiento";
                    DropDownList1.Items.Insert(0, new ListItem("Tipos de tratamientos", "0"));

                }


                txtTabla.Attributes.Add("style", "DISPLAY: none");

                //GridView1.DataSource = funciones.Grid1();
                //GridView1.DataBind();

            }
            catch
            {
                GridView2.DataSource = funciones.Grid1();
                GridView2.DataBind();
            }


        }

        protected void btn_guardar_Click(object sender, EventArgs e)
        {
            try
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
                        Response.Write("<script language='javascript'>window.alert('Se registró la información correctamente');window.location='frm_tratamientos.aspx';</script>");
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
                        Response.Write("<script language='javascript'>window.alert('Se registró la información correctamente');window.location='frm_tratamientos.aspx';</script>");
                    }
                }
            }
            catch
            {

            }
        }

        protected void btn_actualizar_Click(object sender, EventArgs e)
        {
            try
            {
                String codigo_tipo = "";
                Boolean validacion = false;
                if (txt_codigoTipoAct.Text != "" & txt_nombreTipoAct.Text != "" & txt_codigoTratamientoAct.Text != "" & txt_precioAct.Text != "")
                {
                    validacion = true;
                }
                if (DropDownList1.SelectedIndex == 0)
                {
                    codigo_tipo = txt_codigoTipoAct.Text;
                }
                else
                {
                    codigo_tipo = funciones.buscarCodigo(DropDownList1.SelectedItem.Text);
                }
                if (validacion == true)
                {
                    if (funciones.mostrarTipoTratamiento(txt_codigoTipoAct.Text) == "")
                    {
                        Response.Write("<script language='javascript'>window.alert('Este tratamiento no existe');window.location='frm_tratamientos.aspx';</script>");
                    }
                    else
                    {
                        funciones.actualizarTipoTratamiento(txt_codigoTipoAct.Text, txt_nombreTipoAct.Text);
                        funciones.actualizarTratamiento(txt_codigoTratamientoAct.Text, txt_nombreTratamientoAct.Text, Convert.ToDouble(txt_precioAct.Text), txt_descripcionAct.InnerText, codigo_tipo);
                        Response.Write("<script language='javascript'>window.alert('Se actualizó la información correctamente');window.location='frm_tratamientos.aspx';</script>");
                    }
                }
                else
                {
                    string scriptt = @"<script type='text/javascript'>
                    alert('No pueden haber campos vacíos');
                    </script>";
                    ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", scriptt, false);
                }
            }
            catch
            {

            }
        }

        protected void GridView2_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                String codigo;
                String[] datos = new string[6];
                if (txtTabla.Text == "modificar")
                {
                    string script = @"<script type='text/javascript'>
                document.getElementById('titulo1').style.display = 'block' ;
                    </script>";
                    ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", script, false);
                    foreach (GridViewRow row in GridView2.Rows)
                    {
                        if (row.RowIndex == GridView2.SelectedIndex)
                        {
                            row.BackColor = ColorTranslator.FromHtml("#A1DCF2");
                            row.ToolTip = string.Empty;
                            codigo = row.Cells[0].Text;
                            datos = funciones.mostrarDatos(codigo);
                            txt_codigoTipoAct.Text = datos[0];
                            txt_nombreTipoAct.Text = datos[1];
                            txt_codigoTratamientoAct.Text = datos[2];
                            txt_nombreTratamientoAct.Text = datos[3];
                            txt_precioAct.Text = datos[4];
                            txt_descripcionAct.InnerText = datos[5];
                            txt_codigoTipoAct.Enabled = false;
                            txt_codigoTratamientoAct.Enabled = false;
                        }
                        else
                        {
                            row.BackColor = ColorTranslator.FromHtml("#FFFFFF");
                            row.ToolTip = "Click to select this row.";
                        }
                    }
                    ScriptManager.RegisterStartupScript(Page, typeof(Page), "scrollTratamientoModi", "setTimeout(scrollTratamientoModi, 1);", true);

                }
                if (txtTabla.Text == "eliminar")
                {
                    string script = @"<script type='text/javascript'>
                    document.getElementById('titulo2').style.display = 'block' ;
                    </script>";
                    ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", script, false);
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
                    ScriptManager.RegisterStartupScript(Page, typeof(Page), "scrollTratamientoEli", "setTimeout(scrollTratamientoEli, 1);", true);
                }
            }
            catch
            {

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

        protected void btn_eliminar_Click(object sender, EventArgs e)
        {
            try
            {
                if (codigoTraEli.InnerText == "")
                {
                    Response.Write("<script language='javascript'>window.alert('No se ha seleccionado un tratamiento');window.location='frm_tratamientos.aspx';</script>");
                }
                else
                {
                    funciones.eliminarTratamiento(codigoTraEli.InnerText);
                    Response.Write("<script language='javascript'>window.alert('Se eliminó la información correctamente');window.location='frm_tratamientos.aspx';</script>");
                }
            }
            catch
            {

            }
        }

        protected void txt_codigoTipo_TextChanged1(object sender, EventArgs e)
        {
            try
            {
                if (funciones.tratamientoExiste(txt_codigoTipo.Text) == true)
                {
                    txt_nombreTipo.Text = funciones.mostrarTipoTratamiento(txt_codigoTipo.Text);
                    string cod = txt_codigoTipo.Text;
                    int codigo = Convert.ToInt32(cod);
                    DropDownList2.SelectedIndex = codigo;
                    DropDownList2.Enabled = false;
                }
                else
                {
                    DropDownList2.Enabled = false;
                }
                if (txt_codigoTipo.Text == "")
                {
                    DropDownList2.Enabled = true;
                    txt_nombreTipo.Text = "";
                }
            }
            catch
            {

            }
        }

        protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                if (DropDownList2.SelectedIndex != 0)
                {
                    txt_codigoTipo.Text = funciones.buscarCodigo(DropDownList2.SelectedItem.Text);
                    txt_nombreTipo.Text = DropDownList2.SelectedItem.Text;
                    txt_codigoTipo.Enabled = false;
                    txt_nombreTipo.Enabled = false;
                }
                if (DropDownList2.SelectedIndex == 0)
                {
                    txt_codigoTipo.Text = "";
                    txt_nombreTipo.Text = "";
                    txt_codigoTipo.Enabled = true;
                    txt_nombreTipo.Enabled = true;
                }
            }
            catch
            {

            }
        }

        protected void InvisButton_Click(object sender, EventArgs e)
        {
            GridView2.DataSource = funciones.Grid2(txtSearch.Text.Trim());
            GridView2.DataBind();
        }

        protected void GridView2_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView2.DataSource = funciones.Grid2(txtSearch.Text.Trim());
            GridView2.PageIndex = e.NewPageIndex;
            GridView2.DataBind();
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                if (DropDownList1.SelectedIndex != 0)
                {
                    txt_codigoTipoAct.Text = funciones.buscarCodigo(DropDownList1.SelectedItem.Text);
                    txt_nombreTipoAct.Text = DropDownList1.SelectedItem.Text;
                }
                if (DropDownList1.SelectedIndex == 0)
                {
                    txt_codigoTipoAct.Text = "";
                    txt_nombreTipoAct.Text = "";
                }
            }
            catch
            {

            }
        }
    }
}