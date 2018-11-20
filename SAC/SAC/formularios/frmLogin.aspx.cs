using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SAC.formularios
{
    public partial class frmLogin : System.Web.UI.Page
    {
        metodos.metodos_login entrar = new metodos.metodos_login();
        protected void Page_Load(object sender, EventArgs e)
        {
            txt_usuario.Focus();
        }

        protected void btn_sesion_Click(object sender, EventArgs e)
        {
            if (txt_usuario.Value.Contains("'") || txt_usuario.Value.Contains("="))
            {
                txt_usuario.Value = "";
                string script = @"<script type='text/javascript'>
                    alert('No se permite usar valores como ' o =');</script>";
                ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", script, false);
            }
            else if(txt_contrasena.Value.Contains("'") || txt_contrasena.Value.Contains("="))
            {
                string script = @"<script type='text/javascript'>
                    alert('No se permite usar valores como ' o =');</script>";
                ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", script, false);
            }
            else
            {
                if (entrar.Login(txt_usuario.Value.ToString(), txt_contrasena.Value.ToString()) == true)
                {
                    String tipo = entrar.Permiso(txt_usuario.Value).ToString();
                    Session["acceder"] = "entro";
                    Session["tipo"] = tipo;
                    Response.Redirect("\\index.aspx");
                    
                }
                else
                {
                    txt_usuario.Value = "";
                    string script = @"<script type='text/javascript'>
                    alert('Usuario o contraseña incorrecto');
                    </script>";
                    ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", script, false);
                }
            }
        }
    }
}