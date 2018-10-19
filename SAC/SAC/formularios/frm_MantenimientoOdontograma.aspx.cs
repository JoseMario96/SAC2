using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SAC.formularios
{
    public partial class frm_MantenimientoOdontograma : System.Web.UI.Page
    {
        metodos.metodosPaciente objeto = new metodos.metodosPaciente();
        metodos.metodosTratamientos funciones = new metodos.metodosTratamientos();
        metodos.metodosExpediente expediente = new metodos.metodosExpediente();
        metodos.metodosOdontograma odontograma = new metodos.metodosOdontograma();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                GridView1.DataSource = objeto.Paciente();
                GridView1.DataBind();
            }
            if (!IsPostBack)
            {
                DropDownList2.DataSource = funciones.TipoTratamiento();
                DropDownList2.DataBind();
                DropDownList2.DataTextField = "nombreTipoTratamiento";
                DropDownList2.Items.Insert(0, new ListItem("Tipos de tratamientos", "0"));
            }
        }

        protected void guardar_Click(object sender, EventArgs e)
        {

        }

        protected void AgregarDetalle_Click(object sender, EventArgs e)
        {
            string script = @"<script type='text/javascript'>
            document.getElementById('tablaDetalle').style.display = 'block' ;
            document.getElementById('tablaDetalle').scrollIntoView();
             </script>";
            ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", script, false);

            //Guardar de un solo y mostrar se en el gridview

        }

        protected void BudquedaExp_TextChanged(object sender, EventArgs e)
        {
            int codigoExpediente = 0;
            codigoExpediente = expediente.BuscarcodigoExpediente(BudquedaExp.Text);
            if (odontograma.buscarExpediente(codigoExpediente) == 0)
            {
                string script = @"<script type='text/javascript'>
            document.getElementById('odontograma').style.display = 'block' ;
             </script>";
                ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", script, false);
            }
            else
            {
                int cantidadO = 0;
                string script = @"<script type='text/javascript'>
            document.getElementById('odontograma').style.display = 'block' ;
             </script>";
                ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", script, false);
                cantidadO = odontograma.cantidadOdontograma(codigoExpediente.ToString());
                string[] paciente = new string[cantidadO];
                paciente = odontograma.buscarPaciente(codigoExpediente.ToString());
                string[] datos = new string[4];
                int counter = 0;
                for (int x = 0; x < cantidadO; x++)
                {
                    datos = odontograma.buscarOdontograma(paciente[x]);
                    var color = datos[0];
                    string diente = datos[1];
                    string seccion = datos[2];
                    string marca = datos[3];
                    counter++;            
                    // ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "text" + counter.ToString(), "Func('" + diente + "','" + seccion + "','" + color + "','" + marca + "','" + cantidadO + "')", true);
                    Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "Pintar" + counter.ToString(), "<script language='javascript'>$(document).ready(function() {pintarDiente('" + diente + "','" + seccion + "','" + color + "','" + marca + "');});</script>");             
                }
            }
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
                        odontograma.agregarOdontograma(colorArray[x], dienteArray[x], posicionArray[x]);
                        prueba++;
                    }
                }
                if (!marcaArray[0].Equals(""))
                {
                    for (int x = 0; x < num2; x++)
                    {
                        odontograma.agregarOdontograma2(marcaArray[x]);
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

        }
    }
}