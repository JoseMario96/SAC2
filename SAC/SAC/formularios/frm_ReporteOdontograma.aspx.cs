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
    public partial class frm_ReporteOdontograma : System.Web.UI.Page
    {
        metodos.metodosOdontograma objeto = new metodos.metodosOdontograma();
        consulta.consulta consultar = new consulta.consulta();
        conexion.conexion con = new conexion.conexion();

        public static object HtmlParser { get; private set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "text", "dibuja_seccion("+Context+"," + contextoO + "','5','5','red')", true);
           
        }
    

       
            public static void ConvertImageToPdf(string srcFilename, string dstFilename)
            {
                iTextSharp.text.Rectangle pageSize = null;

                using (var srcImage = new Bitmap(srcFilename))
                {
                    pageSize = new iTextSharp.text.Rectangle(0, 0, srcImage.Width, srcImage.Height);
                }
                using (var ms = new MemoryStream())
                {
                    var document = new iTextSharp.text.Document(pageSize, 0, 0, 0, 0);
                    iTextSharp.text.pdf.PdfWriter.GetInstance(document, ms).SetFullCompression();
                    document.Open();
                    var image = iTextSharp.text.Image.GetInstance(srcFilename);
                    document.Add(image);
                    document.Close();

                    File.WriteAllBytes(dstFilename, ms.ToArray());
                }
            }
        
            //// Creamos el documento PDF
            //string imagepath = Server.MapPath("Images");            //string path = Server.MapPath("images/ultimoOdontograma.png");     
            //iTextSharp.text.Document doc = new iTextSharp.text.Document(PageSize.LETTER);
            //PdfWriter.GetInstance (doc, new FileStream (path + "/Doc.pdf", FileMode.Create));
            //doc.Open();



            //// Creamos la imagen y le ajustamos el tamaño
            //iTextSharp.text.Image imagen = iTextSharp.text.Image.GetInstance(imagepath + "images/ultimoOdontograma.png");
            //imagen.BorderWidth = 0;
            //imagen.Alignment = Element.ALIGN_RIGHT;
            //float percentage = 0.0f;
            //percentage = 150 / imagen.Width;
            //imagen.ScalePercent(percentage * 100);

            //// Insertamos la imagen en el documento
            //doc.Add(imagen);

            //// Cerramos el documento
            //doc.Close();
        

        protected void Button1_Click(object sender, EventArgs e)
        {
            ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "text", "dibuja_seccion('" + contextoO + "','5','5','red')", true);
            //ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "text", "Func()", true);
        }

        protected void Guardar_Click1(object sender, EventArgs e)

        {
            Document doc = new Document(PageSize.A4, 10f, 10f, 100f, 0f);

            string pdfFilePath = Server.MapPath(".") + "/formualrios";

            PdfWriter writer = PdfWriter.GetInstance(doc, new FileStream(pdfFilePath + "/Default.pdf", FileMode.Create));

            doc.Open();

            try

            {

                Paragraph paragraph = new Paragraph("Getting Started ITextSharp.");

                string imageURL = Server.MapPath(".") + "/person2.jpg";

                iTextSharp.text.Image jpg = iTextSharp.text.Image.GetInstance(imageURL);

                //Resize image depend upon your need

                jpg.ScaleToFit(140f, 120f);

                //Give space before image

                jpg.SpacingBefore = 10f;

                //Give some space after the image

                jpg.SpacingAfter = 1f;

                jpg.Alignment = Element.ALIGN_LEFT;



                doc.Add(paragraph);

                doc.Add(jpg);



            }

            catch (Exception ex)

            { }

            finally

            {

                doc.Close();

            }

            //    Response.ContentType = "application/pdf";
            //    Response.AddHeader("content-disposition", "attachment;filename= prueba.pdf");
            //    Response.Cache.SetCacheability(HttpCacheability.NoCache);
            //    StringWriter sw = new StringWriter();
            //    HtmlTextWriter hw = new HtmlTextWriter(sw);
            //    Panel1.RenderControl(hw);
            //    StringReader sr = new StringReader(sw.ToString());
            //    Document pdfDoc = new Document(PageSize.LETTER.Rotate(), 36, 36, 36, 36);
            //    HTMLWorker htmlparser = new HTMLWorker(pdfDoc);
            //    PdfWriter.GetInstance(pdfDoc, Response.OutputStream);
            //    pdfDoc.Open();
            //    htmlparser.Parse(sr);
            //    pdfDoc.Close();
            //    Response.Write(pdfDoc);
            //    Response.End();

        }
    }
}
