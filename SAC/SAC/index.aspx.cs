using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SAC
{
	public partial class index : System.Web.UI.Page
	{
        metodos.metodos_login entrar = new metodos.metodos_login();
        protected void Page_Load(object sender, EventArgs e)
		{
            String tipo = Convert.ToString(Request.QueryString["dato"]);
            if (Session["acceder"] == null)
            {
                Response.Redirect("formularios/frmLogin.aspx");
            }
            else if (Session["tipo"].ToString() == "1")
            {
                string script = @"<script type='text/javascript'>                        
                        document.getElementById('ocultar').style.display = 'none';
                        document.getElementById('ocultar1').style.display = 'none';
                        </script>";
                ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", script, false);
                //string scriptt = @"<script type='text/javascript'>                        
                //        document.getElementById('ocultar1').style.display = 'none';
                //        </script>";
                //ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", scriptt, false);
            }
        }
        public void Ocultar()
        {
            string user2 = (String)Session["usuario"];
            if (entrar.Permiso(user2) == 1)
            {
                string script = @"<script type='text/javascript'>
                        document.getElementById('fh5co-about').style.display = 'none';                  
                        </script>";
                ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", script, false);
            }
        }

        protected void refrescar_Tick(object sender, EventArgs e)
        {
            if (Session["acceder"] == null)
            {
                Session.Contents.Remove("acceder");
                Response.Redirect("formularios/frmLogin.aspx");
            }
        }

        protected void img_cerrarsesion_Click(object sender, ImageClickEventArgs e)
        {
            Session.Contents.Remove("acceder");
            Response.Redirect("formularios/frmLogin.aspx");
        }
    }
}