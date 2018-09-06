using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SAC.formularios
{
    public partial class frmBuscar : System.Web.UI.Page
    {
        metodos.Buscar objeto = new metodos.Buscar();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void txt_cedula_TextChanged(object sender, EventArgs e)
        {
            GridView1.DataSource = objeto.Filtrar(txt_cedula.Text);
            GridView1.DataBind();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            GridView1.DataSource = objeto.Filtrar(txt_cedula.Text);
            GridView1.DataBind();
        }
    }
}