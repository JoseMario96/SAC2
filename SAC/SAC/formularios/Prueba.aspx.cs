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
            ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "text", "dibuja_seccion('" + contextoO + "','5','5','red')", true);
        }
        protected void Guardar_Click(object sender, EventArgs e)
        {
            try
            {
                string color = colorO.Value;
                string[] colorArray = color.Split(",".ToCharArray());
                int num = colorArray.Count();

                string diente = dienteO.Value;
                string[] dienteArray = diente.Split(",".ToCharArray());

                string posicion = dienteO.Value;
                string[] posicionArray = posicion.Split(",".ToCharArray());
                int prueba = 0;

                for (int x = 0; x < num; x++)
                {
                    objeto.agregarOdontograma(colorArray[x], dienteArray[x], posicionArray[x]);
                    prueba++;
                }

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

        protected void Button1_Click(object sender, EventArgs e)
        {
            ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "text", "dibuja_seccion('" + contextoO + "','5','5','red')", true);
            //ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "text", "Func()", true);
        }
    }
}