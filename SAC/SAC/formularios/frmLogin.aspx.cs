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

        }

        protected void btn_sesion_Click(object sender, EventArgs e)
        {
            if (entrar.Login(txt_usuario.Value.ToString(), txt_contraseña.Value.ToString()) == true)
            {
                String tipo = entrar.Permiso(txt_usuario.Value).ToString();
                //Session["usuario"] = txt_usuario.Value;
                Response.Redirect("\\index.aspx?dato="+tipo);
            }
            else
            {
                string script = @"<script type='text/javascript'>
                    alert('Usuario o contraseña incorrecto');
                    </script>";
                ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", script, false);
            }
        }
    }
}