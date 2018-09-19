using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
using System.Configuration;
using System.Data;


namespace SAC.formularios
{
    public partial class Prueba : System.Web.UI.Page
    {
        metodos.metodosPaciente objeto = new metodos.metodosPaciente();

        protected void Page_Load(object sender, EventArgs e)
        {

        }
    }
}