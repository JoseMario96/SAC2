using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SAC.formularios
{
    public partial class frm_AgregarPaciente : System.Web.UI.Page
    {
        metodos.metodosPaciente agregarP = new metodos.metodosPaciente();
        protected void Page_Load(object sender, EventArgs e)
        {
            

        }
        public void agregarPaciente()
        {
            string x = cedula.Value;
            
            
        }
    }
}