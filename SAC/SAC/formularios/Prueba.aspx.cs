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
        metodos.metodosOdontograma objeto = new metodos.metodosOdontograma();

        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void Guardar_Click(object sender, EventArgs e)
        {
            try
            {
                objeto.agregarOdontograma(colorO.Value, dienteO.Value, seccionO.Value, contextoO.Value);

                string script = @"<script type='text/javascript'>
                alert('Se ha insertado exitosamente');
                </script>";
                ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", script, false);
            }
            catch
            {
                string script = @"<script type='text/javascript'>
                alert('Realice cambios en el odontograma');
                </script>";
                ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", script, false);
            }


        }
    }
}