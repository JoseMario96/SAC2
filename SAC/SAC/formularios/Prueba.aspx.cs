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

            // ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "text", "dibuja_seccion('" + contextoO + "','5','5','red')", true);
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

                string posicion = seccionO.Value;
                string[] posicionArray = posicion.Split(",".ToCharArray());
                int prueba = 0;

                string marca = marcaO.Value;
                string[] marcaArray = marca.Split(",".ToCharArray());
                int num2 = marcaArray.Count();
                if (!colorArray[0].Equals(""))
                {
                    for (int x = 0; x < num; x++)
                    {
                        objeto.agregarOdontograma(colorArray[x], dienteArray[x], posicionArray[x]);
                        prueba++;
                    }
                }
                if (!marcaArray[0].Equals(""))
                {
                    for (int x = 0; x < num2; x++)
                    {
                        objeto.agregarOdontograma2(marcaArray[x]);
                        prueba++;
                    }
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
            string[] datos = new string[4];
            datos = objeto.buscarOdontograma("51");
            var color = datos[0];
            string diente = datos[1];
            string seccion = datos[2];
            string marca = datos[3];
            ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "text", "Func('" + diente + "','" + seccion + "','" + color + "','" + marca + "')", true);
        }
    }
}