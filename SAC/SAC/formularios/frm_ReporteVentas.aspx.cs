using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using iTextSharp.text;
using iTextSharp.text.pdf;
using iTextSharp.text.html.simpleparser;
using System.IO;
using System.Data;

namespace SAC.formularios
{
    public partial class frm_ReporteVentas : System.Web.UI.Page
    {
        metodos.Metodos_Ventas buscar = new metodos.Metodos_Ventas();
        public static DataTable tabla1;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_buscar_Click(object sender, EventArgs e)
        {
            Gridview_Venta.DataSource = buscar.BuscarVenta(txt_fecha1.Value, txt_fecha2.Value);
            Gridview_Venta.DataBind();
            string script = @"<script type='text/javascript'>
                            document.getElementById('busqueda').style.display = 'block';
                            </script>";
            ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", script, false);
            Double suma = 0;
            Double suma2 = 0;
            for (int i = 0; i <= buscar.BuscarVenta(txt_fecha1.Value, txt_fecha2.Value).Rows.Count - 1; i++)
            {
                suma = suma + Convert.ToInt32(buscar.BuscarVenta(txt_fecha1.Value, txt_fecha2.Value).Rows[i][4]);
                suma2 = suma2 + Convert.ToInt32(buscar.BuscarVenta(txt_fecha1.Value, txt_fecha2.Value).Rows[i][5]);
            }
            lbl_total.InnerText = suma.ToString() + " ";
            lbl_saldo.InnerText = suma2.ToString();
            tabla1 = buscar.BuscarVenta(txt_fecha1.Value, txt_fecha2.Value);
        }

        protected void btn_descargar_Click(object sender, EventArgs e)
        {
            String nombrepdf = "Ventas del " +txt_fecha1.Value+ " al " +txt_fecha2.Value+ ".pdf";

            Response.ContentType = "application/pdf";
            Response.AddHeader("content-disposition", "attachment;filename= '" + nombrepdf + "'");
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            StringWriter sw = new StringWriter();
            HtmlTextWriter hw = new HtmlTextWriter(sw); 
            StringReader sr = new StringReader(sw.ToString());
            Document pdfDoc = new Document(PageSize.LETTER.Rotate(), 36, 36, 36, 36);
            HTMLWorker htmlparser = new HTMLWorker(pdfDoc);
            PdfWriter.GetInstance(pdfDoc, Response.OutputStream);
            pdfDoc.Open();
            PdfPTable unaTabla = new PdfPTable(6);


            unaTabla.SetWidthPercentage(new float[] { 100, 100, 100, 100, 100, 100 }, PageSize.A4);
            //Headers
            unaTabla.AddCell(new Paragraph("Código venta"));
            unaTabla.AddCell(new Paragraph("Cédula paciente"));
            unaTabla.AddCell(new Paragraph("Fecha venta"));
            unaTabla.AddCell(new Paragraph("Detalle de la venta"));
            unaTabla.AddCell(new Paragraph("Monto total de la venta"));
            unaTabla.AddCell(new Paragraph("Saldo de la venta"));

            //¿Le damos un poco de formato?
            foreach (PdfPCell celda in unaTabla.Rows[0].GetCells())
            {
                celda.BackgroundColor = BaseColor.LIGHT_GRAY;
                celda.HorizontalAlignment = 1;
                celda.Padding = 3;
            }
            for (int i = 0; i <= buscar.BuscarVenta(txt_fecha1.Value, txt_fecha2.Value).Rows.Count - 1; i++)
            {
                PdfPCell celda1 = new PdfPCell(new Paragraph((tabla1.Rows[i][0]).ToString(), FontFactory.GetFont("Arial", 10)));
                PdfPCell celda2 = new PdfPCell(new Paragraph((tabla1.Rows[i][1]).ToString(), FontFactory.GetFont("Arial", 10)));
                PdfPCell celda3 = new PdfPCell(new Paragraph((tabla1.Rows[i][2]).ToString(), FontFactory.GetFont("Arial", 10)));
                PdfPCell celda4 = new PdfPCell(new Paragraph((tabla1.Rows[i][3]).ToString(), FontFactory.GetFont("Arial", 10)));
                PdfPCell celda5 = new PdfPCell(new Paragraph((tabla1.Rows[i][4]).ToString(), FontFactory.GetFont("Arial", 10)));
                PdfPCell celda6 = new PdfPCell(new Paragraph((tabla1.Rows[i][5]).ToString(), FontFactory.GetFont("Arial", 10)));

                unaTabla.AddCell(celda1);
                unaTabla.AddCell(celda2);
                unaTabla.AddCell(celda3);
                unaTabla.AddCell(celda4);
                unaTabla.AddCell(celda5);
                unaTabla.AddCell(celda6);
            }
            
            pdfDoc.Add(unaTabla);

            htmlparser.Parse(sr);
            pdfDoc.Close();
            Response.Write(pdfDoc);
            Response.End();
        }
    }
}