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
            DateTime fecha = DateTime.Now;
            titulo.Text = fecha.ToString("d");
            GridView1.DataSource = objeto.CitaHoy(fecha.ToString("d"));
            GridView1.DataBind();
            
        }
    }
}