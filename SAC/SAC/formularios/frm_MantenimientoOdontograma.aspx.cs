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
        metodos.metodosTratamientos funciones = new metodos.metodosTratamientos();
        metodos.metodosExpediente expediente = new metodos.metodosExpediente();
        metodos.metodosOdontograma odontograma = new metodos.metodosOdontograma();
        metodos.metodosTratamientos tratamiento = new metodos.metodosTratamientos();
        static int precio, codigocedula;
        static int codigoExpediente, monto, total = 0;
        static string signo = "₡";

        protected void Page_Load(object sender, EventArgs e)
        {
            abono.Text = "0";
            if (!IsPostBack)
            {
                DropDownList1.DataSource = odontograma.TiposdeTratamientos();
                DropDownList1.DataBind();
                DropDownList1.DataTextField = "nombreTipoTratamiento";
                DropDownList1.Items.Insert(0, new ListItem("Tipo de tratamientos", "0"));

            }
        }


        protected void AgregarDetalle_Click(object sender, EventArgs e)
        {
            string codigoT = "";

            int codigoExpediente = 0;
            codigoExpediente = expediente.BuscarcodigoExpediente(BudquedaExp.Text);
            if (odontograma.buscarExpediente(codigoExpediente) != 0)
            {
                codigoT = odontograma.codigoTratamiento(DropDownList2.SelectedItem.Text);
                odontograma.agregarPacienteTratamiento(codigoExpediente, codigoT, fecha.Text, DropDownList2.SelectedItem.Text, diente.Value, descrip.Value, BudquedaExp.Text.ToString(), descrip.Value, monto, total);
                GridView1.DataSource = odontograma.TratamientosRealizados(codigocedula.ToString());
                GridView1.DataBind();
            }
            else
            {

            }
        }

        protected void BudquedaExp_TextChanged(object sender, EventArgs e)
        {
            fecha.Text = DateTime.Now.ToString("yyyy/MM/dd hh:mm:ss");
            codigocedula = 0;
            codigocedula = expediente.BuscarcodigoExpediente(BudquedaExp.Text.ToString());
            if (codigocedula > 0)
            {
                GridView1.DataSource = odontograma.TratamientosRealizados(codigocedula.ToString());
                GridView1.DataBind();
            }

            codigoExpediente = expediente.BuscarcodigoExpediente(BudquedaExp.Text);

            if (codigoExpediente == 0)
            {
                string script = @"<script type='text/javascript'>
            alert('Este paciente no existe');
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
            //try
            //{
            string borradoC = BDcolorO.Value;
            string borradoD = BDdienteO.Value;
            string borradoS = BDseccionO.Value;
            string borradoM = BDdienteM.Value;
            string[] BDborradoC = borradoC.Split(",".ToCharArray());
            string[] BDborradoD = borradoD.Split(",".ToCharArray());
            string[] BDborradoS = borradoS.Split(",".ToCharArray());
            string[] BDborradoM = borradoM.Split(",".ToCharArray());

            int num3 = BDborradoC.Count();
            int num4 = BDborradoM.Count();

            if (!BDborradoC[0].Equals(""))
            {
                for (int x = 0; x < num3; x++)
                {
                    odontograma.borrarOdontograma(BDborradoC[x], BDborradoD[x], BDborradoS[x], codigoExpediente.ToString());
                }
            }
            else if (!BDborradoM[0].Equals(""))
            {
                for (int x = 0; x < num4; x++)
                {
                    odontograma.borrarOdontograma2(BDborradoM[x], codigoExpediente.ToString());
                }
            }



            DateTime now = DateTime.Now;
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
            string marcaColor = colorM.Value;
            string[] marcaColorArray = marcaColor.Split(",".ToCharArray());
            int num2 = marcaArray.Count();
            TextBox1.Text = color;
            if (!colorArray[0].Equals(""))
            {
                for (int x = 0; x < num; x++)
                {
                    odontograma.agregarOdontograma(colorArray[x], dienteArray[x], posicionArray[x], codigoExpediente.ToString(), now.ToString("yyyy-MM-dd"));
                    prueba++;
                }
            }
            if (!marcaArray[0].Equals(""))
            {
                for (int x = 0; x < num2; x++)
                {
                    odontograma.agregarOdontograma2(marcaArray[x], marcaColorArray[x], codigoExpediente.ToString(), now.ToString("yyyy-MM-dd"));
                    prueba++;
                }
            }

            string script = @"<script type='text/javascript'>
            alert('Se ha insertado exitosamente');
            </script>";
            ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", script, false);
            //}
            //catch
            //{
            //    string script = @"<script type='text/javascript'>
            //    alert('Realice cambios en el odontograma');
            //    </script>";
            //    ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", script, false);
            //}


        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            string codigotipo = "";
            if (DropDownList1.SelectedIndex != 0)
            {

                DropDownList2.Items.Clear();
                codigotipo = odontograma.NumTipoTratamiento(DropDownList1.SelectedItem.Text);
                DropDownList2.DataSource = tratamiento.Tratamiento(codigotipo);
                DropDownList2.DataBind();
                DropDownList2.DataTextField = "nombreTratamiento";
                DropDownList2.Items.Insert(0, new ListItem("Tratamientos", "0"));
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
           // Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "PruebaBD", "<script language='javascript'>$(document).ready(function() {guardarDiente();});</script>");
            string color = colorO.Value;
            string diente = dienteO.Value;
            string seccion = seccionO.Value;
            string borradoM = BDdienteM.Value;
            TextBox1.Text = borradoM;
            TextBox2.Text = diente;
            TextBox3.Text = seccion;
        }

        protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
        {

            precio = odontograma.obtenerPrecio(DropDownList2.SelectedItem.Text);
            preciost.InnerText = signo + " " + precio;

        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.DataSource = odontograma.TratamientosRealizados(codigocedula.ToString());
            GridView1.PageIndex = e.NewPageIndex;
            GridView1.DataBind();
        }

        protected void abono_TextChanged(object sender, EventArgs e)
        {
            int extraH, abonoH;

            if (extra.Value.Equals(""))
            {
                extra.Value = "0";
            }
            extraH = Int32.Parse(extra.Value);
            if (abono.Text.Equals(""))
            {
                abono.Focus();
            }


            abonoH = Int32.Parse(abono.Text);
            monto = precio + extraH;
            total = (precio + extraH) - abonoH;
            if (total < 0)
            {
                string script = @"<script type='text/javascript'>
                alert('El abono no puede ser superior a la deuda');
                </script>";
                ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", script, false);
            }
            saldo.InnerText = signo + total.ToString();
        }
    }
}