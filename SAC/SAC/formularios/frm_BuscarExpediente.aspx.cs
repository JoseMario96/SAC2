using System;
using System.Collections;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SAC.formularios
{
    public partial class frm_BuscarExpediente : System.Web.UI.Page
    {
        metodos.metodosExpediente metodo = new metodos.metodosExpediente();
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                GridView1.DataSource = metodo.BuscarExpediente();
                GridView1.DataBind();
            }
            catch
            {
                string script = @"<script type='text/javascript'>
                alert('No hay información en la base de datos');
                </script>";
                ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", script, false);
            }            
        }

        protected void OnDataBound(object sender, EventArgs e)
        {
            GridViewRow row = new GridViewRow(0, 0, DataControlRowType.Header, DataControlRowState.Normal);
            for (int i = 0; i < GridView1.Columns.Count; i++)
            {
                TableHeaderCell cell = new TableHeaderCell();
                TextBox txtSearch = new TextBox();
                txtSearch.Attributes["placeholder"] = GridView1.Columns[i].HeaderText;
                txtSearch.CssClass = "search_textbox";
                cell.Controls.Add(txtSearch);
                row.Controls.Add(cell);
            }
            GridView1.HeaderRow.Parent.Controls.AddAt(1, row);
        }


        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Attributes["onclick"] = Page.ClientScript.GetPostBackClientHyperlink(GridView1, "Select$" + e.Row.RowIndex);
                e.Row.ToolTip = "Click para seleccionar esta fila.";
            }
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            String ced;
            String[] datos = new string[47];

            foreach (GridViewRow row in GridView1.Rows)
            {
                if (row.RowIndex == GridView1.SelectedIndex)
                {
                    
                    row.BackColor = ColorTranslator.FromHtml("#A1DCF2");
                    row.ToolTip = string.Empty;
                    ced = row.Cells[1].Text;
                    datos = metodo.BuscarPaciente(ced);
                    expediente.InnerText = datos[0];
                    cedula.InnerText = datos[1];
                    fecha.InnerText = datos[2];
                    cardiaco.InnerText = datos[3];
                    presion.InnerText = datos[4];
                    reumatica.InnerText = datos[5];
                    sida.InnerText = datos[6];
                    derrame.InnerText = datos[7];
                    anemia.InnerText = datos[8];
                    sangre.InnerText = datos[9];
                    pais.InnerText = datos[10];
                    donde.InnerText = datos[11];
                    tiempo.InnerText = datos[12];
                    moretes.InnerText = datos[13];
                    rinnon.InnerText = datos[14];
                    gastro.InnerText = datos[15];
                    vision.InnerText = datos[16];
                    cortico.InnerText = datos[17];
                    diabetes.InnerText = datos[18];
                    epilepsia.InnerText = datos[19];
                    respiratorias.InnerText = datos[20];
                    radio_quimio.InnerText = datos[21];
                    reumatismo.InnerText = datos[22];
                    hepaticos.InnerText = datos[23];
                    herpes.InnerText = datos[24];
                    perdidaP.InnerText = datos[25];
                    aumentoP.InnerText = datos[26];
                    artritis.InnerText = datos[27];
                    psiquiatra.InnerText = datos[28];
                    tiroides.InnerText = datos[29];
                    transmision.InnerText = datos[30];
                    osteoporosis.InnerText = datos[31];
                    migranna.InnerText = datos[32];
                    bifos.InnerText = datos[33];
                    drogas.InnerText = datos[34];
                    fuma.InnerText = datos[35];
                    cigarroDia.InnerText = datos[36];
                    cigarroPeriodo.InnerText = datos[37];
                    alcohol.InnerText = datos[38];
                    frecuenciaAlcohol.InnerText = datos[39];
                    cicatrices.InnerText = datos[40];
                    shock.InnerText = datos[41];
                    observaciones.InnerText = datos[42];
                    nombre1.InnerText = datos[43];
                    nombre2.InnerText = datos[44];
                    apellido1.InnerText = datos[45];
                    apellido2.InnerText = datos[46];
                }
                else
                {
                    row.BackColor = ColorTranslator.FromHtml("#FFFFFF");
                    row.ToolTip = "Click to select this row.";
                }
            }
        }
    }
}