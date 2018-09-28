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
        public static string reumatica;
        public static string sida;
        public static string derrame;
        public static string anemia;
        public static string sangre;
        public static string pais;
        public static string moretes;
        public static string vision;
        public static string cortico;
        public static string diabetes;
        public static string epilepsia;
        public static string respiratoria;
        public static string quimio;
        public static string reumatismo;
        public static string herpes;
        public static string artritis;
        public static string psiquiatrico;
        public static string transmision;
        public static string osteoporosis;
        public static string migranna;
        public static string alcohol;
        public static string shock;
        public static string embarazada;
        public static string anticonceptivo;
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



                    if (datos[5].Equals("Si"))
                    {
                        reumaticaS.Checked = true;
                    }
                    else
                    {
                        reumaticaN.Checked = true;

                    }


                    if (datos[6].Equals("Si"))
                    {
                        sidaS.Checked = true;

                    }
                    else
                    {
                        sidaN.Checked = true;

                    }


                    if (datos[7].Equals("Si"))
                    {
                        derrameS.Checked = true;
                    }
                    else
                    {
                        derrameN.Checked = true;
                    }


                    if (datos[8].Equals("Si"))
                    {
                        anemiaS.Checked = true;
                    }
                    else
                    {
                        anemiaN.Checked = true;
                    }


                    if (datos[9].Equals("Si"))
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

                    if (datos[13].Equals("Si"))
                    {
                        moretesS.Checked = true;
                    }
                    else
                    {
                        moretesN.Checked = true;
                    }

                    rinnon.Text = datos[14];
                    gastro.Text = datos[15];

                    if (datos[16].Equals("Si"))
                    {
                        visionS.Checked = true;
                    }
                    else
                    {
                        visionN.Checked = true;
                    }


                    if (datos[17].Equals("Si"))
                    {
                        corticoS.Checked = true;
                    }
                    else
                    {
                        corticoN.Checked = true;
                    }


                    if (datos[18].Equals("Si"))
                    {
                        diabetesS.Checked = true;
                    }
                    else
                    {
                        diabetesN.Checked = true;
                    }


                    if (datos[19].Equals("Si"))
                    {
                        epilepsiaS.Checked = true;
                    }
                    else
                    {
                        epilepsiaN.Checked = true;
                    }


                    if (datos[20].Equals("Si"))
                    {
                        respiratoriaS.Checked = true;
                    }
                    else
                    {
                        respiratoriaN.Checked = true;
                    }


                    if (datos[21].Equals("Si"))
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


                    if (datos[24].Equals("Si"))
                    {
                        herpesS.Checked = true;
                    }
                    else
                    {
                        herpesN.Checked = true;
                    }

                    perdida_peso.Text = datos[25];
                    aumento_peso.Text = datos[26];


                    if (datos[27].Equals("Si"))
                    {
                        artritisS.Checked = true;
                    }
                    else
                    {
                        artritisN.Checked = true;
                    }


                    if (datos[28].Equals("Si"))
                    {
                        psiquiatricoS.Checked = true;
                    }
                    else
                    {
                        psiquiatricoN.Checked = true;
                    }

                    tiroides.Text = datos[29];


                    if (datos[30].Equals("Si"))
                    {
                        transmisionS.Checked = true;
                    }
                    else
                    {
                        transmisionN.Checked = true;
                    }


                    if (datos[31].Equals("Si"))
                    {
                        osteoporosisS.Checked = true;
                    }
                    else
                    {
                        osteoporosisN.Checked = true;
                    }


                    if (datos[32].Equals("Si"))
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

                    if (datos[38].Equals("Si"))
                    {
                        alcoholS.Checked = true;
                    }
                    else
                    {
                        alcoholN.Checked = true;
                    }

                    frecuenciaAlcohol.Text = datos[39];
                    cicatriz.Text = datos[40];

                    if (datos[41].Equals("Si"))
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

                    if (datos[52].Equals("Si"))
                    {
                        embarazadaS.Checked = true;
                    }
                    else
                    {
                        embarazadaN.Checked = true;
                    }


                    semanas.Text = datos[53];

                    if (datos[54].Equals("Si"))
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
                    row.ToolTip = "Click para seleccionar esta fila.";
                }
            }
        }

        protected void Guardar_Click(object sender, EventArgs e)
        {
            if (reumaticaS.Checked)
            {
                reumatica = "si";
            }
            else
            {
                reumatica = "No";
            }

            if (sidaS.Checked)
            {
                sida = "Si";
            }
            else
            {
                sida = "No";
            }
            if (derrameS.Checked)
            {
                derrame = "Si";
            }
            else
            {
                derrame = "No";
            }
            if (anemiaS.Checked)
            {
                anemia = "Si";
            }
            else
            {
                anemia = "No";
            }
            if (sangreS.Checked)
            {
                sangre = "Si";
            }
            else
            {
                sangre = "No";
            }
            if (paisS.Checked)
            {
                pais = "Si";
            }
            else
            {
                pais = "No";
            }
            if (moretesS.Checked)
            {
                moretes = "Si";
            }
            else
            {
                moretes = "No";
            }
            if (visionS.Checked)
            {
                vision = "Si";
            }
            else
            {
                vision = "No";
            }
            if (corticoS.Checked)
            {
                cortico = "Si";
            }
            else
            {
                cortico = "No";
            }
            if (diabetesS.Checked)
            {
                diabetes = "Si";
            }
            else
            {
                diabetes = "No";
            }
            if (epilepsiaS.Checked)
            {
                epilepsia = "Si";
            }
            else
            {
                epilepsia = "No";
            }
            if (respiratoriaS.Checked)
            {
                respiratoria = "Si";
            }
            else
            {
                respiratoria = "No";
            }
            if (quimioS.Checked)
            {
                quimio = "Si";
            }
            else
            {
                quimio = "No";
            }
            if (reumatismoS.Checked)
            {
                reumatismo = "Si";
            }
            else
            {
                reumatismo = "No";
            }
            if (herpesS.Checked)
            {
                herpes = "Si";
            }
            else
            {
                herpes = "No";
            }
            if (artritisS.Checked)
            {
                artritis = "Si";
            }
            else
            {
                artritis = "No";
            }
            if (psiquiatricoS.Checked)
            {
                psiquiatrico = "Si";
            }
            else
            {
                psiquiatrico = "No";
            }
            if (transmisionS.Checked)
            {
                transmision = "Si";
            }
            else
            {
                transmision = "No";
            }
            if (osteoporosisS.Checked)
            {
                osteoporosis = "Si";
            }
            else
            {
                osteoporosis = "No";
            }
            if (migrannaS.Checked)
            {
                migranna = "Si";
            }
            else
            {
                migranna = "No";
            }
            if (alcoholS.Checked)
            {
                alcohol = "Si";
            }
            else
            {
                alcohol = "No";
            }
            if (shockS.Checked)
            {
                shock = "Si";
            }
            else
            {
                shock = "No";
            }
            if (embarazadaS.Checked)
            {
                embarazada = "Si";
            }
            else
            {
                embarazada = "No";
            }
            if (anticoceptivosS.Checked)
            {
                anticonceptivo = "Si";
            }
            else
            {
                anticonceptivo = "No";
            }
            metodo.actualizarExpediente(expediente.InnerText, cardiaco.Text, presion.Text, reumatica, sida, derrame, anemia, sangre, pais, donde.Text, tiempo.Text, moretes, rinnon.Text, gastro.Text, vision, cortico, diabetes, epilepsia, respiratoria, quimio, reumatismo, hepaticos.Text, herpes, perdida_peso.Text, aumento_peso.Text, artritis, psiquiatrico, tiroides.Text, transmision, osteoporosis, migranna, bifos.Text, drogas.Text, fuma.Text, cigarroDia.Text, cigarroPeriodo.Text, alcohol, frecuenciaAlcohol.Text, cicatriz.Text, shock);
            string script = @"<script type='text/javascript'>
            alert('Se han actualizado adecuadamente los datos');
            </script>";
            ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", script, false);
        }

        protected void Cancelar_Click(object sender, EventArgs e)
        {

        }
    }
}