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

            string script = @"<script type='text/javascript'>
                document.getElementById('formularioP').style.display = 'block' ;
                document.getElementById('formularioP').scrollIntoView();                  
             
            </script>";

            ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", script, false);


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
                        reumatica = "si";
                    }
                    else
                    {
                        reumaticaN.Checked = true;
                        reumatica = "no";
                    }


                    if (datos[6].Equals("si"))
                    {
                        sidaN.Checked = false;
                        sidaS.Checked = true;
                        sida = "si";
                    }
                    else if (datos[6].Equals("no"))
                    {
                        sidaS.Checked = false;
                        sidaN.Checked = true;
                        sida = "no";
                    }


                    if (datos[7].Equals("si"))
                    {
                        derrameS.Checked = true;
                        derrame = "si";
                    }
                    else
                    {
                        derrameN.Checked = true;
                        derrame = "no";
                    }


                    if (datos[8].Equals("si"))
                    {
                        anemiaS.Checked = true;
                        anemia = "si";
                    }
                    else
                    {
                        anemiaN.Checked = true;
                        anemia = "no";
                    }


                    if (datos[9].Equals("si"))
                    {
                        sangreS.Checked = true;
                        sangre = "si";
                    }
                    else
                    {
                        sangreN.Checked = true;
                        sangre = "no";
                    }


                    if (datos[10].Equals("si"))
                    {
                        paisS.Checked = true;
                        pais = "si";
                    }
                    else
                    {
                        paisN.Checked = true;
                        pais = "no";
                    }

                    donde.Text = datos[11];
                    tiempo.Text = datos[12];

                    if (datos[13].Equals("si"))
                    {
                        moretesS.Checked = true;
                        moretes = "si";
                    }
                    else
                    {
                        moretesN.Checked = true;
                        moretes = "no";
                    }

                    rinnon.Text = datos[14];
                    gastro.Text = datos[15];

                    if (datos[16].Equals("si"))
                    {
                        visionS.Checked = true;
                        vision = "si";
                    }
                    else
                    {
                        visionN.Checked = true;
                        vision = "no";
                    }


                    if (datos[17].Equals("si"))
                    {
                        corticoS.Checked = true;
                        cortico = "si";
                    }
                    else
                    {
                        corticoN.Checked = true;
                        cortico = "no";
                    }


                    if (datos[18].Equals("si"))
                    {
                        diabetesS.Checked = true;
                        diabetes = "si";
                    }
                    else
                    {
                        diabetesN.Checked = true;
                        diabetes = "no";
                    }


                    if (datos[19].Equals("si"))
                    {
                        epilepsiaS.Checked = true;
                        epilepsia = "si";
                    }
                    else
                    {
                        epilepsiaN.Checked = true;
                        epilepsia = "no";
                    }


                    if (datos[20].Equals("si"))
                    {
                        respiratoriaS.Checked = true;
                        respiratoria = "si";
                    }
                    else
                    {
                        respiratoriaN.Checked = true;
                        respiratoria = "no";
                    }


                    if (datos[21].Equals("si"))
                    {
                        quimioS.Checked = true;
                        quimio = "si";
                    }
                    else
                    {
                        quimioN.Checked = true;
                        quimio = "no";
                    }


                    if (datos[22].Equals("si"))
                    {
                        reumatismoS.Checked = true;
                        reumatismo = "si";
                    }
                    else
                    {
                        reumatismoN.Checked = true;
                        reumatismo = "no";
                    }

                    hepaticos.Text = datos[23];


                    if (datos[24].Equals("si"))
                    {
                        herpesS.Checked = true;
                        herpes = "si";
                    }
                    else
                    {
                        herpesN.Checked = true;
                        herpes = "no";
                    }

                    perdida_peso.Text = datos[25];
                    aumento_peso.Text = datos[26];


                    if (datos[27].Equals("si"))
                    {
                        artritisS.Checked = true;
                        artritis = "si";
                    }
                    else
                    {
                        artritisN.Checked = true;
                        artritis = "no";
                    }


                    if (datos[28].Equals("si"))
                    {
                        psiquiatricoS.Checked = true;
                        psiquiatrico = "si";
                    }
                    else
                    {
                        psiquiatricoN.Checked = true;
                        psiquiatrico = "no";
                    }

                    tiroides.Text = datos[29];


                    if (datos[30].Equals("si"))
                    {
                        transmisionS.Checked = true;
                        transmision = "si";
                    }
                    else
                    {
                        transmisionN.Checked = true;
                        transmision = "no";
                    }


                    if (datos[31].Equals("si"))
                    {
                        osteoporosisS.Checked = true;
                        osteoporosis = "si";
                    }
                    else
                    {
                        osteoporosisN.Checked = true;
                        osteoporosis = "no";
                    }


                    if (datos[32].Equals("si"))
                    {
                        migrannaS.Checked = true;
                        migranna = "si";
                    }
                    else
                    {
                        migrannaN.Checked = true;
                        migranna = "no";
                    }

                    bifos.Text = datos[33];
                    drogas.Text = datos[34];
                    fuma.Text = datos[35];
                    cigarroDia.Text = datos[36];
                    cigarroPeriodo.Text = datos[37];

                    if (datos[38].Equals("si"))
                    {
                        alcoholS.Checked = true;
                        alcohol = "si";
                    }
                    else
                    {
                        alcoholN.Checked = true;
                        alcohol = "no";
                    }

                    frecuenciaAlcohol.Text = datos[39];
                    cicatriz.Text = datos[40];

                    if (datos[41].Equals("si"))
                    {
                        shockS.Checked = true;
                        shock = "si";
                    }
                    else
                    {
                        shockN.Checked = true;
                        shock = "no";
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
                        embarazada = "si";
                    }
                    else
                    {
                        embarazadaN.Checked = true;
                        embarazada = "no";
                    }


                    semanas.Text = datos[53];

                    if (datos[54].Equals("si"))
                    {
                        anticoceptivosS.Checked = true;
                        anticonceptivo = "si";
                    }
                    else
                    {
                        anticoceptivosN.Checked = true;
                        anticonceptivo = "no";
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
            if (sidaS.Checked)
            {
                sida = "si";
            }
            else
            {
                sida = "no";
            }
            try
            {

                metodo.actualizarExpediente(expediente.InnerText, cardiaco.Text, presion.Text, reumatica, sida, derrame, anemia, sangre, pais, donde.Text, tiempo.Text, moretes, rinnon.Text, gastro.Text, vision, cortico, diabetes, epilepsia, respiratoria, quimio, reumatismo, hepaticos.Text, herpes, perdida_peso.Text, aumento_peso.Text, artritis, psiquiatrico, tiroides.Text, transmision, osteoporosis, migranna, bifos.Text, drogas.Text, fuma.Text, cigarroDia.Text, cigarroPeriodo.Text, alcohol, frecuenciaAlcohol.Text, cicatriz.Text, shock);
                string script = @"<script type='text/javascript'>
                alert('Se han actualizado adecuadamente los datos');
                </script>";
                ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", script, false);
            }
            catch
            {
                string script = @"<script type='text/javascript'>
                alert('No se actualizó adecuadamente los datos');
                </script>";
                ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", script, false);
            }
        }

        protected void Cancelar_Click(object sender, EventArgs e)
        {

        }
    }
}