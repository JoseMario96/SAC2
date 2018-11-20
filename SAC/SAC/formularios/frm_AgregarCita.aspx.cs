using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SAC.formularios
{
    public partial class frm_AgregarCita : System.Web.UI.Page
    {
        metodos.metodos_Citas objeto = new metodos.metodos_Citas();
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                DateTime fecha = DateTime.Now;
                titulo.Text = fecha.ToString("d");
                if (objeto.CitaHoy(fecha.ToString("yyyy-MM-dd")).Rows.Count > 0)
                {
                    GridView1.DataSource = objeto.CitaHoy(fecha.ToString("yyyy-MM-dd"));
                    GridView1.DataBind();
                }
                else
                {
                    string scripts = @"<script type='text/javascript'>
                    alert('No hay citas para hoy!');
                    </script>";
                    ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", scripts, false);
                }
            }
            catch
            {
                string scripts = @"<script type='text/javascript'>
                    alert('No hay citas para hoy!');
                    </script>";
                ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", scripts, false);
            }
        }
    }
}