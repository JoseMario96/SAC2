using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SAC.formularios
{
    public partial class frm_Odontograma : System.Web.UI.Page
    {
        metodos.metodosTratamientos funciones = new metodos.metodosTratamientos();
        metodos.metodosExpediente expediente = new metodos.metodosExpediente();
        metodos.metodosOdontograma odontograma = new metodos.metodosOdontograma();
        metodos.metodosTratamientos tratamiento = new metodos.metodosTratamientos();
        metodos.metodosPaciente objeto = new metodos.metodosPaciente();
        //static int codigocedula=0;
        //static int codigoExpediente = 0;
        static string ced = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["acceder"] == null)
            {
                Response.Redirect("frmLogin.aspx");
            }
            else
            {
                if (!this.IsPostBack)
                {
                    txtSearch.Focus();
                    GridView_reporteOdontograma.DataSource = odontograma.Pacienteinformacion("");
                    GridView_reporteOdontograma.DataBind();

                }
            }
        }

        protected void GridView_reporteOdontograma_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Attributes["onclick"] = Page.ClientScript.GetPostBackClientHyperlink(GridView_reporteOdontograma, "Select$" + e.Row.RowIndex);
                e.Row.ToolTip = "Click para seleccionar esta fila.";
            }
        }
        protected void GridView_reporteOdontograma_SelectedIndexChanged(object sender, EventArgs e)
        {       
            String[] datos2 = new String[10];
            GridView_reporteOdontograma.DataSource = odontograma.Pacienteinformacion2(txtSearch.Text.Trim());
            GridView_reporteOdontograma.DataBind();
            ScriptManager.RegisterStartupScript(Page, typeof(Page), "ScrollToADiv", "setTimeout(scrollToDiv, 1);", true);
            foreach (GridViewRow row in GridView_reporteOdontograma.Rows)
            {
                if (row.RowIndex == GridView_reporteOdontograma.SelectedIndex)
                {
                    row.BackColor = ColorTranslator.FromHtml("#A1DCF2");
                    row.ToolTip = string.Empty;
                    ced = row.Cells[0].Text;
                    Session["cedula"] = row.Cells[0].Text;

                    string script = @"<script type='text/javascript'>
            document.getElementById('dienteOdontograma').style.display = 'block' ;
 document.getElementById('dienteOdontograma').scrollIntoView();   
             </script>";
                    ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", script, false);
                    ScriptManager.RegisterStartupScript(Page, typeof(Page), "scrollOdonto", "setTimeout(scrollOdonto, 1);", true);
                }
                else
                {
                    row.BackColor = ColorTranslator.FromHtml("#FFFFFF");
                    row.ToolTip = "Click to select this row.";

                }

            }
        }

        protected void GridView_reporteOdontograma_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView_reporteOdontograma.DataSource = odontograma.Pacienteinformacion2(txtSearch.Text.Trim());
            GridView_reporteOdontograma.PageIndex = e.NewPageIndex;
            GridView_reporteOdontograma.DataBind();

            string script = @"<script type='text/javascript'>
            document.getElementById('dienteOdontograma').style.display = 'none' ;
            document.getElementById('dienteOdontograma').scrollIntoView();   
             </script>";
            ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", script, false);
        }
        protected void InvisButton_Click(object sender, EventArgs e)
        {
            // place your wanted code here
            GridView_reporteOdontograma.DataSource = odontograma.Pacienteinformacion2(txtSearch.Text.Trim());

            GridView_reporteOdontograma.DataBind();
            string script = @"<script type='text/javascript'>
            document.getElementById('dienteOdontograma').style.display = 'none' ;
            document.getElementById('dienteOdontograma').scrollIntoView();   
             </script>";
            ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", script, false);

        }
        protected void ibOdontogramaG_Click(object sender, ImageClickEventArgs e)
        {
            if (!ced.Equals(""))
            {
                ced = "";
                Response.Redirect("frm_MantenimientoOdontograma.aspx");
                GridView_reporteOdontograma.DataSource = odontograma.Pacienteinformacion("");
                GridView_reporteOdontograma.DataBind();
            }
            else
            {
                string script2 = @"<script type='text/javascript'>
          alert('Seleccione un expediente');
             </script>";
                ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", script2, false);

            }

        }

        protected void ibOdontogramaN_Click(object sender, ImageClickEventArgs e)
        {
            if (!ced.Equals(""))
            {
                ced = "";
                Response.Redirect("frm_MantenimientoOdontograma2.aspx");
                GridView_reporteOdontograma.DataSource = odontograma.Pacienteinformacion("");
                GridView_reporteOdontograma.DataBind();
            }
            else
            {
                string script2 = @"<script type='text/javascript'>
          alert('Seleccione un expediente');
             </script>";
                ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", script2, false);

            }
        }
    }
}