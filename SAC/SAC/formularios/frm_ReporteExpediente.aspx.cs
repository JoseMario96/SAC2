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

namespace SAC.formularios
{
    public partial class frm_ReporteExpediente : System.Web.UI.Page
    {
        consulta.consulta consultar = new consulta.consulta();
        conexion.conexion con = new conexion.conexion();
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        protected void Button2_Click(object sender, EventArgs e)

        {

            String nombrepdf = Label3.Text + ".pdf";

            Response.ContentType = "application/pdf";
            Response.AddHeader("content-disposition", "attachment;filename= '" + nombrepdf + "'");
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            StringWriter sw = new StringWriter();
            HtmlTextWriter hw = new HtmlTextWriter(sw);
            Panel1.RenderControl(hw);
            StringReader sr = new StringReader(sw.ToString());
            Document pdfDoc = new Document(PageSize.LETTER.Rotate(),36, 36, 36, 36);
            HTMLWorker htmlparser = new HTMLWorker(pdfDoc);
            PdfWriter.GetInstance(pdfDoc, Response.OutputStream);
            pdfDoc.Open();
            htmlparser.Parse(sr);
            pdfDoc.Close();
            Response.Write(pdfDoc);
            Response.End();
        }

        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {
            string mycon = "server=127.0.0.1;user=root;database=bd_sac;password=sac;SslMode=none;";
            String myquery = "SELECT * FROM bd_sac.tbl_paciente where cedulaPaciente=" + TextBox1.Text;
            MySqlConnection con = new MySqlConnection(mycon);
            MySqlCommand cmd = new MySqlCommand();
            cmd.CommandText = myquery;
            cmd.Connection = con;
            MySqlDataAdapter da = new MySqlDataAdapter();
            da.SelectCommand = cmd;
            DataSet ds = new DataSet();
            da.Fill(ds);
            if (ds.Tables[0].Rows.Count > 0)
            {
                Panel1.Visible = true;
                // Label3.Text = "Data Found";
                Label3.Text = TextBox1.Text;
                Label4.Text = ds.Tables[0].Rows[0]["cedulaPaciente"].ToString();
                Label5.Text = ds.Tables[0].Rows[0]["nombre1Paciente"].ToString();
                Label2.Text = ds.Tables[0].Rows[0]["nombre2Paciente"].ToString();
                Label5.Text = ds.Tables[0].Rows[0]["apellido1Paciente"].ToString();
                ////Image1.ImageUrl = "http://localhost:1341/" + ds.Tables[0].Rows[0]["applicantimage"].ToString();
            }
            else
            {
                //Label6.Text = "Roll Number Not Found";

            }
            con.Close();
        }
    }
}