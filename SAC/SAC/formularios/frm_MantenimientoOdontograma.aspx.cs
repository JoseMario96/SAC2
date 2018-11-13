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
        static int codigocedula;
        static int codigoExpediente = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DropDownList1.DataSource = odontograma.TiposdeTratamientos();
                DropDownList1.DataBind();
                DropDownList1.DataTextField = "nombreTipoTratamiento";
                DropDownList1.Items.Insert(0, new ListItem("Tipo de tratamientos", "0"));

                DropDownList2.Items.Insert(0, new ListItem("Tratamientos", "0"));

            }
            fecha.Text = DateTime.Now.ToString("yyyy/MM/dd hh:mm:ss");
        }

        protected void guardar_Click(object sender, EventArgs e)
        {

        }

        protected void AgregarDetalle_Click(object sender, EventArgs e)
        {
            string codigoT = "";

            int codigoExpediente = 0;
            codigoExpediente = expediente.BuscarcodigoExpediente(BudquedaExp.Text);
            if (odontograma.buscarExpediente(codigoExpediente) != 0)
            {
                if (DropDownList2.SelectedItem.Text.Equals("Tratamientos") || String.IsNullOrEmpty(DropDownList2.SelectedItem.Text))
                {
                    string script = @"<script type='text/javascript'>
                       alert('Debe seleccionar un tratamiento');
                    </script>";
                    ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", script, false);
                    DropDownList2.Focus();
                }
                else
                {
                    codigoT = odontograma.codigoTratamiento(DropDownList2.SelectedItem.Text);
                    odontograma.agregarPacienteTratamiento(codigoExpediente, codigoT, fecha.Text, DropDownList2.SelectedItem.Text, diente.Value, descrip.Value, BudquedaExp.Text.ToString());
                    GridView1.DataSource = odontograma.TratamientosRealizados(codigocedula.ToString());
                    GridView1.DataBind();
                    DropDownList1.Items.Clear();
                    DropDownList1.DataSource = odontograma.TiposdeTratamientos();
                    DropDownList1.DataBind();
                    DropDownList1.DataTextField = "nombreTipoTratamiento";
                    DropDownList1.Items.Insert(0, new ListItem("Tipo de tratamientos", "0"));
                    DropDownList2.Items.Clear();
                    diente.Value = "";
                    descrip.Value = "";
                }
            }
        }

        protected void BudquedaExp_TextChanged(object sender, EventArgs e)
        {
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
            TextBox4.Text = borradoC;
            TextBox2.Text = borradoD;
            TextBox3.Text = borradoS;
            string[] BDborradoC = borradoC.Split(",".ToCharArray());
            string[] BDborradoD = borradoD.Split(",".ToCharArray());
            string[] BDborradoS = borradoS.Split(",".ToCharArray());
            string[] BDborradoM = borradoM.Split(",".ToCharArray());

            int num3 = BDborradoC.Count();
            int num4 = BDborradoM.Count();
            int cont = 0;
            if (!BDborradoC[0].Equals(""))
            {
                for (int x = 0; x < num3; x++)
                {
                    cont++;
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
                for (int y = 0; y < num2; y++)
                {

                    odontograma.agregarOdontograma2(marcaArray[y], marcaColorArray[y], codigoExpediente.ToString(), now.ToString("yyyy-MM-dd"));
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
            ////}


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
        protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
        {
            diente.Value = DropDownList2.SelectedItem.Text;

        }
        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.DataSource = odontograma.TratamientosRealizados(codigocedula.ToString());
            GridView1.PageIndex = e.NewPageIndex;
            GridView1.DataBind();
        }
    }
}