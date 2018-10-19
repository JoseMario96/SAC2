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
            codigoExpediente=expediente.BuscarcodigoExpediente(BudquedaExp.Text);
            if (odontograma.buscarExpediente(codigoExpediente) == 0)
            {
                string script = @"<script type='text/javascript'>
                alert('No tienes odontograma :c ');
                </script>";
                ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", script, false);
            }
            else
            {

            }
        }
    }
}