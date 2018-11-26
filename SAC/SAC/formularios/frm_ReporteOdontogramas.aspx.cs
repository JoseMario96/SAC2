using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using MySql.Data.MySqlClient;
using iTextSharp.text;
using iTextSharp.text.pdf;
using iTextSharp.text.html.simpleparser;
using System.IO;
using iTextSharp.text.html;
using System.Drawing;


namespace SAC.formularios
{
    public partial class frm_ReporteOdontogramas : System.Web.UI.Page
    {
        metodos.metodosExpediente expediente = new metodos.metodosExpediente();
        metodos.metodosPaciente objeto = new metodos.metodosPaciente();
        consulta.consulta consultar = new consulta.consulta();
        conexion.conexion con = new conexion.conexion();
        metodos.metodosOdontograma odontograma = new metodos.metodosOdontograma();
        static int codigocedula = 0;

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
            String ced;

            String[] datoss = new String[13];
            String[] datos2 = new String[10];

            GridView_reporteOdontograma.DataSource = odontograma.Pacienteinformacion(txtSearch.Text.Trim());
            GridView_reporteOdontograma.DataBind();

            foreach (GridViewRow row in GridView_reporteOdontograma.Rows)
            {
                if (row.RowIndex == GridView_reporteOdontograma.SelectedIndex)
                {
                    row.BackColor = ColorTranslator.FromHtml("#A1DCF2");
                    row.ToolTip = string.Empty;

                    ced = row.Cells[0].Text;
                    datoss = objeto.buscarPaciente(ced);

                    nombre1.Text = datoss[1] + " " + datoss[2] + " " + datoss[3] + " " + datoss[4];
                    cedulaP.Text = datoss[0];
                    correo.Text = datoss[10];
                    telefono.Text = datoss[7];
                    //-------------------------------------------------------------------------------------------------------------------------------------------
                    codigocedula = expediente.BuscarcodigoExpediente(ced.ToString());


                    GridView1.DataSource = odontograma.ReporteOdontograma(codigocedula.ToString());
                    GridView1.DataBind();


                    int cantidadO = 0;

                    cantidadO = odontograma.cantidadOdontograma(codigocedula.ToString());

                    string[] paciente = new string[cantidadO];
                    paciente = odontograma.buscarPaciente(codigocedula.ToString());

                    string[] datos = new string[5];
                    int counter = 0;

                    for (int x = 0; x < cantidadO; x++)
                    {
                        datos = odontograma.buscarOdontograma(paciente[x]);
                        var color = datos[0];
                        string diente = datos[1];
                        string seccion = datos[2];
                        string marca = datos[3];
                        counter++;
                        if (datos[4] == "1")
                        {
                            Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "Pintar" + counter.ToString(), "<script language='javascript'>$(document).ready(function() {pintarDiente('" + diente + "','" + seccion + "','" + color + "','" + marca + "');});</script>");
                        }
                       else if (datos[4] == "0")
                        {
                            Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "Pintar2" + counter.ToString(), "<script language='javascript'>$(document).ready(function() {pintarDienteNino('" + diente + "','" + seccion + "','" + color + "','" + marca + "');});</script>");
                        }
                    }

                    Panel1.Visible = true;

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
            GridView_reporteOdontograma.DataSource = odontograma.Pacienteinformacion(txtSearch.Text.Trim());
            GridView_reporteOdontograma.PageIndex = e.NewPageIndex;
            GridView_reporteOdontograma.DataBind();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {

        }

        protected void InvisButton_Click(object sender, EventArgs e)
        {
            txtSearch.Attributes["onfocus"] = "var value = this.value; this.value = ''; this.value = value; onfocus = null;";
            txtSearch.Focus();
            GridView_reporteOdontograma.DataSource = odontograma.Pacienteinformacion2(txtSearch.Text.Trim());
            GridView_reporteOdontograma.DataBind();
        }
    }
}
