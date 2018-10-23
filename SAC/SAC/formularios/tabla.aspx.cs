using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SAC.formularios
{
    public partial class tabla : System.Web.UI.Page
    {
        metodos.metodosTratamientos funciones = new metodos.metodosTratamientos();
        metodos.metodosExpediente expediente = new metodos.metodosExpediente();
        metodos.metodosOdontograma odontograma = new metodos.metodosOdontograma();
        metodos.metodosTratamientos tratamiento = new metodos.metodosTratamientos();
        public static int precio;

        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (!IsPostBack)
            {
                DropDownList1.DataSource = odontograma.TiposdeTratamientos();
                DropDownList1.DataBind();
                DropDownList1.DataTextField = "nombreTipoTratamiento";
                DropDownList1.Items.Insert(0, new ListItem("Tipo de tratamientos", "0"));


                //DropDownList2.DataSource = funciones.TipoTratamiento();
                //DropDownList2.DataBind();
                //DropDownList2.DataTextField = "nombreTipoTratamiento";
                //DropDownList2.Items.Insert(0, new ListItem("Tratamientos", "0"));
            }
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
                codigoT = odontograma.codigoTratamiento(DropDownList2.SelectedItem.Text);
                odontograma.agregarPacienteTratamiento(codigoExpediente, codigoT, fecha.Text, DropDownList2.SelectedItem.Text, diente.Value, descrip.Value);
            }
            else
            {

            }
        }

        protected void BudquedaExp_TextChanged(object sender, EventArgs e)
        {
            fecha.Text = DateTime.Now.ToString("yyyy/MM/dd");
            TextBox1.Text = DateTime.Now.ToString("yyyy/MM/dd");
            if (!this.IsPostBack)
            {
                int codigocedula=0;
                codigocedula = expediente.BuscarcodigoExpediente(BudquedaExp.Text.ToString());
                GridView1.DataSource = odontograma.TratamientosRealizados(codigocedula.ToString());
                GridView1.DataBind();
            }
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
            string signo = "₡";
            precio = odontograma.obtenerPrecio(DropDownList2.SelectedItem.Text);
            preciost.InnerText = signo + " " + precio;

        }

        protected void abono_TextChanged(object sender, EventArgs e)
        {
            int total = 0, extraH, abonoH;

            extraH = Int32.Parse(extra.Value);
            if (abono.Text.Equals(""))
            {
                abono.Focus();
            }
            abonoH = Int32.Parse(abono.Text);
            total = (precio + extraH) - abonoH;
            saldo.InnerText = total.ToString();
        }
    }
}