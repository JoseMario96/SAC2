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
            GridView_reporteOdontograma.DataSource = odontograma.Pacienteinformacion("das");
            GridView_reporteOdontograma.DataBind();
        }

        protected void OnDataBound(object sender, EventArgs e)
        {
            GridViewRow row = new GridViewRow(0, 0, DataControlRowType.Header, DataControlRowState.Normal);
            for (int i = 0; i < GridView_reporteOdontograma.Columns.Count; i++)
            {
                TableHeaderCell cell = new TableHeaderCell();
                TextBox txtSearch = new TextBox();
                txtSearch.Attributes["placeholder"] = GridView_reporteOdontograma.Columns[i].HeaderText;
                txtSearch.CssClass = "search_textbox";
                cell.Controls.Add(txtSearch);
                row.Controls.Add(cell);
            }
            GridView_reporteOdontograma.HeaderRow.Parent.Controls.AddAt(1, row);
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

            GridView_reporteOdontograma.DataSource = odontograma.Pacienteinformacion("sad");
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
                        else if(datos[4] == "0")
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
            GridView_reporteOdontograma.DataSource = odontograma.Pacienteinformacion("ads");
            GridView_reporteOdontograma.PageIndex = e.NewPageIndex;
            GridView_reporteOdontograma.DataBind();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {

        }
    }
}
//metodos.metodosExpediente expediente = new metodos.metodosExpediente();
//consulta.consulta consultar = new consulta.consulta();
//conexion.conexion con = new conexion.conexion();
//metodos.metodosOdontograma odontograma = new metodos.metodosOdontograma();
//static int codigocedula = 0;

//protected void Page_Load(object sender, EventArgs e)
//{
//    Cedula.Focus();
//}

//protected void Button1_Click(object sender, EventArgs e)
//{

//}

////protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
////{
////    GridView1.DataSource = odontograma.ReporteOdontograma(codigocedula.ToString());
////    GridView1.PageIndex = e.NewPageIndex;
////    GridView1.DataBind();
////}

//protected void Cedula_TextChanged(object sender, EventArgs e)
//{
//    string mycon = "server=127.0.0.1;user=root;database=bd_sac;password=sac;SslMode=none;";
//    String myquery = "SELECT * FROM bd_sac.tbl_paciente where cedulaPaciente=" + Cedula.Text;
//    MySqlConnection con = new MySqlConnection(mycon);
//    MySqlCommand cmd = new MySqlCommand();
//    cmd.CommandText = myquery;
//    cmd.Connection = con;
//    MySqlDataAdapter da = new MySqlDataAdapter();
//    da.SelectCommand = cmd;
//    DataSet ds = new DataSet();
//    da.Fill(ds);
//    if (ds.Tables[0].Rows.Count > 0)
//    {

//        codigocedula = expediente.BuscarcodigoExpediente(Cedula.Text.ToString());

//        GridView1.DataSource = odontograma.ReporteOdontograma(codigocedula.ToString());
//        GridView1.DataBind();

//        int cantidadO = 0;

//        cantidadO = odontograma.cantidadOdontograma(codigocedula.ToString());

//        string[] paciente = new string[cantidadO];
//        paciente = odontograma.buscarPaciente(codigocedula.ToString());
//        string[] datos = new string[4];
//        int counter = 0;

//        for (int x = 0; x < cantidadO; x++)
//        {
//            datos = odontograma.buscarOdontograma(paciente[x]);
//            var color = datos[0];
//            string diente = datos[1];
//            string seccion = datos[2];
//            string marca = datos[3];
//            counter++;
//            Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "Pintar" + counter.ToString(), "<script language='javascript'>$(document).ready(function() {pintarDiente('" + diente + "','" + seccion + "','" + color + "','" + marca + "');});</script>");
//        }

//        string scrippt = @"<script type='text/javascript'>
//        document.getElementById('Panel1').scrollIntoView(); 

//    </script>";
//        ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", scrippt, false);
//        Panel1.Visible = true;
//        cedulaP.Text = ds.Tables[0].Rows[0]["cedulaPaciente"].ToString();
//        nombre1.Text = ds.Tables[0].Rows[0]["nombre1Paciente"].ToString() + " " + ds.Tables[0].Rows[0]["nombre2Paciente"].ToString() + " " + ds.Tables[0].Rows[0]["apellido1Paciente"].ToString() + " " + ds.Tables[0].Rows[0]["apellido2Paciente"].ToString();
//        correo.Text = ds.Tables[0].Rows[0]["correoPaciente"].ToString();
//        telefono.Text = ds.Tables[0].Rows[0]["telefonoPaciente"].ToString();
//    }
//    else
//    {
//        string insertar = @"<script type='text/javascript'>
//        alert('No existe el paciente');
//        </script>";
//        ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", insertar, false);
//        Panel1.Visible = false;
//        Cedula.Text = "";
//        Cedula.Focus();

//    }
//    con.Close();
//}

//protected void GridView_reporteOdontograma_SelectedIndexChanged(object sender, EventArgs e)
//{

//}

//protected void GridView_reporteOdontograma_RowDataBound(object sender, GridViewRowEventArgs e)
//{

//}

//protected void OnDataBound(object sender, EventArgs e)
//{

//}

//protected void GridView_reporteOdontograma_PageIndexChanging(object sender, GridViewPageEventArgs e)
//{

//        //}
//    }
//}
