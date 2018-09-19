using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SAC.formularios
{
    public partial class frm_ActualizarExpediente : System.Web.UI.Page
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
            String[] datos = new string[59];

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
                    cardiaco.Text = datos[3];
                    presion.Text = datos[4];
                    if (datos[5].Equals("si"))
                    {
                        reumaticaS.Checked = true;
                    }
                    else
                    {
                        sidaS.Checked = true;
                    }
                    if (datos[6].Equals("si"))
                    {
                        sidaS.Checked = true;
                    }
                    else
                    {
                        reumaticaN.Checked = true;
                    }
                    if (datos[7].Equals("si"))
                    {
                        derrameS.Checked = true;
                    }
                    else
                    {
                        derrameN.Checked = true;
                    }
                    if (datos[8].Equals("si"))
                    {
                        anemiaS.Checked = true;
                    }
                    else
                    {
                        anemiaN.Checked = true;
                    }
                    if (datos[9].Equals("si"))
                    {
                        sangreS.Checked = true;
                    }
                    else
                    {
                        sangreN.Checked = true;
                    }
                    if (datos[10].Equals("si"))
                    {
                        paisS.Checked = true;
                    }
                    else
                    {
                        paisN.Checked = true;
                    }

                    donde.Text = datos[11];
                    tiempo.Text = datos[12];
                    if (datos[13].Equals("si"))
                    {
                        moretesS.Checked = true;
                    }
                    else
                    {
                        moretesN.Checked = true;
                    }

                    rinnon.Text = datos[14];
                    gastro.Text = datos[15];
                    if (datos[16].Equals("si"))
                    {
                        visionS.Checked = true;
                    }
                    else
                    {
                        visionN.Checked = true;
                    }

                    if (datos[17].Equals("si"))
                    {
                        corticoS.Checked = true;
                    }
                    else
                    {
                        corticoN.Checked = true;
                    }
                    if (datos[18].Equals("si"))
                    {
                        diabetesS.Checked = true;
                    }
                    else
                    {
                        diabetesS.Checked = true;
                    }
                    if (datos[19].Equals("si"))
                    {
                        epilepsiaS.Checked = true;
                    }
                    else
                    {
                        epilepsiaN.Checked = true;
                    }
                    if (datos[20].Equals("si"))
                    {
                        respiratoriaS.Checked = true;
                    }
                    else
                    {
                        respiratoriaN.Checked = true;
                    }
                    if (datos[21].Equals("si"))
                    {
                        quimioS.Checked = true;
                    }
                    else
                    {
                        quimioN.Checked = true;
                    }
                    if (datos[22].Equals("si"))
                    {
                        reumatismoS.Checked = true;
                    }
                    else
                    {

                        reumatismoN.Checked = true;
                    }
                    hepaticos.Text = datos[23];
                    if (datos[24].Equals("si"))
                    {
                        herpesS.Checked = true;
                    }
                    else
                    {
                        herpesN.Checked = true;
                    }
                    perdida_peso.Text = datos[25];
                    aumento_peso.Text = datos[26];
                    if (datos[27].Equals("si"))
                    {
                        artritisS.Checked = true;
                    }
                    else
                    {
                        artritisN.Checked = true;
                    }
                    if (datos[28].Equals("si"))
                    {
                        psiquiatricoS.Checked = true;
                    }
                    else
                    {
                        psiquitricoN.Checked = true;
                    }
                    tiroides.Text = datos[29];
                    if (datos[30].Equals("si"))
                    {
                        transmisionS.Checked = true;
                    }
                    else
                    {
                        transmisionN.Checked = true;
                    }
                    if (datos[31].Equals("si"))
                    {
                        osteoporosisS.Checked = true;
                    }
                    else
                    {
                        osteoporosisN.Checked = true;
                    }
                    if (datos[32].Equals("si"))
                    {
                        migrannaS.Checked = true;
                    }
                    else
                    {
                        migrannaN.Checked = true;
                    }

                    bifos.Text = datos[33];
                    drogas.Text = datos[34];
                    fuma.Text = datos[35];
                    cigarroDia.Text = datos[36];
                    cigarroPeriodo.Text = datos[37];
                    if (datos[38].Equals("si"))
                    {
                        alcoholS.Checked = true;
                    }
                    else
                    {
                        alcoholN.Checked = true;
                    }
                    frecuenciaAlcohol.Text = datos[39];

                    cicatriz.Text = datos[40];
                    if (datos[41].Equals("si"))
                    {
                        shockS.Checked = true;
                    }
                    else
                    {
                        shockN.Checked = true;
                    }
                    observaciones.InnerText = datos[42];

                    nombre1.InnerText = datos[43];
                    nombre2.InnerText = datos[44];
                    apellido1.InnerText = datos[45];
                    apellido2.InnerText = datos[46];
                    arterialSignos.Text = datos[48];
                    pulsoSignos.Text = datos[49];
                    frecuenciaSignos.Text = datos[50];
                    if (datos[52].Equals("si"))
                    {
                        embarazadaS.Checked = true;
                    }
                    else
                    {
                        embarazadaN.Checked = true;
                    }
                    semanas.Text = datos[53];
                    if (datos[54].Equals("si"))
                    {
                        anticoceptivosS.Checked = true;
                    }
                    else
                    {
                        anticoceptivosN.Checked = true;
                    }
                    gineco.Text = datos[55];
                    abortos.Text = datos[56];
                    cesareas.Text = datos[57];
                    observacionesMujer.Text = datos[58];
                }
                else
                {
                    row.BackColor = ColorTranslator.FromHtml("#FFFFFF");
                    row.ToolTip = "Click to select this row.";
                }
            }
        }

        protected void Guardar_Click(object sender, EventArgs e)
        {

        }

        protected void Cancelar_Click(object sender, EventArgs e)
        {

        }
    }
}