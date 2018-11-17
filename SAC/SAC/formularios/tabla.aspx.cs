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
        public static int precio, codigocedula;

        protected void Page_Load(object sender, EventArgs e)
        {


            if (!IsPostBack)
            {

                gvBanquet.DataSource = odontograma.Pacienteinformacion(txtSearch.Text.Trim());
                gvBanquet.DataBind();



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
                //  odontograma.agregarPacienteTratamiento(codigoExpediente, codigoT, fecha.Text, DropDownList2.SelectedItem.Text, diente.Value, descrip.Value);
                gvBanquet.DataSource = odontograma.Pacienteinformacion2(txtSearch.Text.Trim());
                gvBanquet.DataBind();
            }
            else
            {

            }
        }

        protected void BudquedaExp_TextChanged(object sender, EventArgs e)
        {

            codigocedula = 0;
            codigocedula = expediente.BuscarcodigoExpediente(BudquedaExp.Text.ToString());
            if (codigocedula > 0)
            {
                gvBanquet.DataSource = odontograma.Pacienteinformacion2(txtSearch.Text.Trim());
                gvBanquet.DataBind();
            }

        }


        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvBanquet.DataSource = odontograma.Pacienteinformacion2(txtSearch.Text.Trim());
            gvBanquet.PageIndex = e.NewPageIndex;
            gvBanquet.DataBind();
        }


        protected void InvisButton_Click(object sender, EventArgs e)
        {
            // place your wanted code here
            gvBanquet.DataSource = odontograma.Pacienteinformacion2(txtSearch.Text.Trim());
            gvBanquet.DataBind();

        }
    }
}