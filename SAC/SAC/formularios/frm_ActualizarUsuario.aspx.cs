using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;

namespace SAC.formularios
{
    public partial class frm_ActualizarUsuario : System.Web.UI.Page
    {
        metodos.metodos_login entrar = new metodos.metodos_login();
        public static String usuario;
        public static String estado;
        protected void Page_Load(object sender, EventArgs e)
        {
            txt_correo.Focus();
            if (entrar.BuscarUsuarios().Rows.Count > 0)
            {
                this.Gridview_Usuario.Columns[2].Visible = false;
                Gridview_Usuario.DataSource = entrar.BuscarUsuarios();
                Gridview_Usuario.DataBind();
            }
            else
            {
                string script = @"<script type='text/javascript'>
                        alert('No hay usuarios registrados!');                
                        </script>";
                ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", script, false);
            }
        }

        protected void btn_Guardar_Click(object sender, EventArgs e)
        {
            int tipo = 1;
            Boolean validar = false;
            if (admin.Checked)
            {
                tipo = 0;
                validar = true;
            }
            else if (asist.Checked)
            {
                tipo = 1;
                validar = true;
            }
            else
            {
                string scriptt = @"<script type='text/javascript'>
                    alert('Seleccione un tipo de usuario!');
                    </script>";
                ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", scriptt, false);
            }
            if (validar == true)
            {
                entrar.ActualizarUsuario(txt_usuario.Text, txt_correo.Value, tipo);
                string scriptt = @"<script type='text/javascript'>
                    alert('Se actualizó correctamente la información!');
                    </script>";
                ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", scriptt, false);
            }
        }

        protected void Gridview_Usuario_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                foreach (GridViewRow row in Gridview_Usuario.Rows)
                {
                    if (row.RowIndex == Gridview_Usuario.SelectedIndex)
                    {
                        row.BackColor = ColorTranslator.FromHtml("#A1DCF2");
                        row.ToolTip = string.Empty;
                        usuario = row.Cells[0].Text;
                        estado = entrar.BuscarEstado(usuario);
                        if (estado == "1")
                        {
                            btn_Estado.Text = "Inhabilitar";
                        }
                        else
                        {
                            btn_Estado.Text = "Habilitar";
                        }
                        txt_usuario.Text = row.Cells[0].Text;
                        txt_correo.Value = row.Cells[1].Text;
                        if (row.Cells[2].Text == "0")
                        {
                            asist.Checked = false;
                            admin.Checked = true;
                        }
                        else
                        {
                            admin.Checked = false;
                            asist.Checked = true;
                        }
                        txt_usuario.Enabled = false;
                        string script = @"<script type='text/javascript'>
                            document.getElementById('grid').style.display = 'none' ;             
                            document.getElementById('campos').style.display = 'block';
                        </script>";
                        ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", script, false);
                    }
                    else
                    {
                        row.BackColor = ColorTranslator.FromHtml("#FFFFFF");
                        row.ToolTip = "Click to select this row.";
                    }
                }
            }
            catch
            {
                string script = @"<script type='text/javascript'>
                        alert('No se pudo realizar la operación!');                
                        </script>";
                ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", script, false);
            }
        }

        protected void Gridview_Usuario_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Attributes["onclick"] = Page.ClientScript.GetPostBackClientHyperlink(Gridview_Usuario, "select$" + e.Row.RowIndex);
                e.Row.ToolTip = "Click para seleccionar esta fila.";
            }
        }

        protected void btn_Volver_Click(object sender, EventArgs e)
        {
            string script = @"<script type='text/javascript'>
                            document.getElementById('campos').style.display = 'none';
                            document.getElementById('grid').style.display = 'block' ;                                         
                        </script>";
            ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", script, false);
        }

        protected void btn_Estado_Click(object sender, EventArgs e)
        {
            String imprimir = "";
            try
            {
                if (usuario != "")
                {
                    if (estado == "0")
                    {
                        entrar.HabilitacionUsuario(usuario, 1);
                        imprimir = "habilitó";
                    }
                    else
                    {
                        entrar.HabilitacionUsuario(usuario, 0);
                        imprimir = "inhabilitó";
                    }
                    string script = @"<script type='text/javascript'>
                        alert('Se "+imprimir+" correctamente el usuario!');" +
                        "document.getElementById('campos').style.display = 'none';" +
                        "document.getElementById('grid').style.display = 'block';"+
                        "</script>";
                    ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", script, false);
                }
                else
                {
                    string script = @"<script type='text/javascript'>
                        alert('Asegúrese de selecionar un usuario!');                
                        </script>";
                    ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", script, false);
                }
            }
            catch
            {
                string script = @"<script type='text/javascript'>
                        alert('No se pudo realizar la operación!');                
                        </script>";
                ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", script, false);
            }
        }
    }
}