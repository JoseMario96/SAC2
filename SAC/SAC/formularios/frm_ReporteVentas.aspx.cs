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
            tabla1 = buscar.BuscarVenta(txt_fecha1.Value, txt_fecha2.Value);
            if (tabla1.Rows.Count > 0)
            {
                Gridview_Venta.DataSource = tabla1;
                Gridview_Venta.DataBind();
                string script = @"<script type='text/javascript'>
                            document.getElementById('busqueda').style.display = 'block';
                            </script>";
                ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", script, false);
                Double suma = 0;
                Double suma2 = 0;

                int limite = tabla1.Rows.Count - 1;
                for (int i = 0; i <= limite; i++)
                {
                    suma = suma + Convert.ToInt32(tabla1.Rows[i][4]);
                    suma2 = suma2 + Convert.ToInt32(tabla1.Rows[i][5]);
                }
                lbl_total.InnerText = suma.ToString() + " ";
                lbl_saldo.InnerText = suma2.ToString();
            }
            else
            {
                string script = @"<script type='text/javascript'>
                            alert('No hay registro de ventas en ese rango de fechas!');
                            </script>";
                ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", script, false);
                txt_fecha1.Value = "";
                txt_fecha2.Value = "";
                txt_fecha1.Focus();
            }
        }

        protected void btn_descargar_Click(object sender, EventArgs e)
        {
            int limite = tabla1.Rows.Count - 1;
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
            PdfPTable tbl_Imprimir = new PdfPTable(6);


            tbl_Imprimir.SetWidthPercentage(new float[] { 100, 100, 100, 100, 100, 100 }, PageSize.A4);
            //Encabezado de la tabla
            tbl_Imprimir.AddCell(new Paragraph("Código venta"));
            tbl_Imprimir.AddCell(new Paragraph("Cédula paciente"));
            tbl_Imprimir.AddCell(new Paragraph("Fecha venta"));
            tbl_Imprimir.AddCell(new Paragraph("Detalle de la venta"));
            tbl_Imprimir.AddCell(new Paragraph("Monto total de la venta"));
            tbl_Imprimir.AddCell(new Paragraph("Saldo de la venta"));

            //Fondo para que se note la diferencia
            foreach (PdfPCell celda in tbl_Imprimir.Rows[0].GetCells())
            {
                celda.BackgroundColor = BaseColor.LIGHT_GRAY;
                celda.HorizontalAlignment = 1;
                celda.Padding = 3;
            }
            for (int i = 0; i <= limite; i++)
            {
                PdfPCell celda1 = new PdfPCell(new Paragraph((tabla1.Rows[i][0]).ToString(), FontFactory.GetFont("Arial", 12)));
                PdfPCell celda2 = new PdfPCell(new Paragraph((tabla1.Rows[i][1]).ToString(), FontFactory.GetFont("Arial", 12)));
                PdfPCell celda3 = new PdfPCell(new Paragraph((tabla1.Rows[i][2]).ToString(), FontFactory.GetFont("Arial", 12)));
                PdfPCell celda4 = new PdfPCell(new Paragraph((tabla1.Rows[i][3]).ToString(), FontFactory.GetFont("Arial", 12)));
                PdfPCell celda5 = new PdfPCell(new Paragraph((tabla1.Rows[i][4]).ToString(), FontFactory.GetFont("Arial", 12)));
                PdfPCell celda6 = new PdfPCell(new Paragraph((tabla1.Rows[i][5]).ToString(), FontFactory.GetFont("Arial", 12)));

                tbl_Imprimir.AddCell(celda1);
                tbl_Imprimir.AddCell(celda2);
                tbl_Imprimir.AddCell(celda3);
                tbl_Imprimir.AddCell(celda4);
                tbl_Imprimir.AddCell(celda5);
                tbl_Imprimir.AddCell(celda6);
            }
            DateTime date = DateTime.Now;
            String date2 = date.ToShortDateString();
            int numero = 1;
            var pagina = new Paragraph("Pág." + numero);
            var titulo1 = new Paragraph("Clínica Dental\n Dra. Alina Camacho B.\n Reporte de ventas");
            var fecha = new Paragraph("Fecha: " + date2);
            var monto = new Paragraph("Total: ₡ " + lbl_total.InnerText+ "             Saldo: ₡" + lbl_saldo.InnerText +"           ");

            pagina.SpacingBefore = 1; //Espacio antes
            titulo1.SpacingBefore = 0;
            fecha.SpacingBefore = 0;
            monto.SpacingBefore = 1;

            pagina.SpacingAfter = 0; //Espacio después
            titulo1.SpacingAfter = 0;
            fecha.SpacingAfter = 3;
            monto.SpacingAfter = 2;

            pagina.Alignment = 2; //0-izquierda, 1-centro,2-derecho
            titulo1.Alignment = 1; 
            fecha.Alignment = 2;
            monto.Alignment = 2;

            pdfDoc.Add(pagina); //Agrega los elementos al pdf
            pdfDoc.Add(titulo1);
            pdfDoc.Add(fecha);
            pdfDoc.Add(tbl_Imprimir);
            pdfDoc.Add(monto);

            htmlparser.Parse(sr);
            pdfDoc.Close();
            Response.Write(pdfDoc);
            Response.End();
        }
    }
}