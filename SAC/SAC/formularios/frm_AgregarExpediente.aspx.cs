﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SAC.formularios
{
    public partial class frm_AgregarExpediente : System.Web.UI.Page
    {
        metodos.metodosExpediente objeto = new metodos.metodosExpediente();
        static Boolean estadoguardar;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["acceder"] == null)
            {
                Response.Redirect("frmLogin.aspx");
            }
            else
            {
                cedulaEx.Focus();
                lblfecha.Text = DateTime.Now.ToString("yyyy/MM/dd");
            }
        }

        
        //Este método agrega expedientes
         public Boolean agregar()
        {
            String pregunta1 = ""; String pregunta2 = ""; String donde = ""; String cuanto = ""; string pregunta9 = ""; string pregunta10 = ""; string pregunta18 = ""; string pregunta20 = ""; string pregunta23 = ""; string pregunta27 = ""; string pregunta28 = ""; string cigarros = "";
            string cuanto2 = ""; string pregunta29 = "No"; string pregunta30 = "No"; string pregunta31 = ""; string bebedor = "";

            string pregunta3 = "No"; string anemia = "No"; string pregunta4 = "No"; string pregunta5 = "No"; string pregunta6 = "No"; string pregunta7=""; string pregunta8 = "No"; string pregunta11 = "No";
            string pregunta12 = "No"; string pregunta13 = "No"; string pregunta14 = "No"; string pregunta15 = "No"; string pregunta16 = "No"; string pregunta17 = "No"; string pregunta19 = "No";
            string pregunta21 = "No"; string pregunta22 = "No"; string pregunta24 = "No"; string pregunta25 = "No"; string pregunta26 = "No"; string pregunta32 = "No"; string peso = "";
            string pregunta33 = "No"; int embarazo = 0; string pregunta34 = "No"; int cesarias = 0; int aborto = 0; int partos = 0;

            String presion = ""; string pulso = ""; string frecuencia = "";
            // Historial médico

            if (hmradi1.Checked)
            {
                pregunta1 = hmrespu1.Value;
            }
            else
            {
                pregunta1 = "";
            }
            if (hmradi2.Checked)
            {
                pregunta2 = hmrespu2.Value;
            }
            else
            {
                pregunta2 = "";
            }
            if (hmradi3.Checked)
            {
                pregunta3 = "Si";
            }
            else
            {
                pregunta3 = "No";
            }
            if (hmradi4.Checked)
            {
                pregunta4 = "Si";
            }
            else
            {
                pregunta4 = "No";
            }
            if (hmradi5.Checked)
            {
                pregunta5 = "Si";
            }
            else
            {
                pregunta5 = "No";
            }
            if (hmradi6.Checked)
            {
                anemia = "Si";
            }
            else
            {
                anemia = "No";
            }
            if (hmradi7.Checked)
            {
                pregunta6 = "Si";
            }
            else
            {
                pregunta6 = "No";
            }

            if (hmsi.Checked)
            {
                pregunta7 = "Si";
                donde = hmrespu3.Value;
                cuanto = hmrespu4.Value;
            }
            else if (hmnooo.Checked == true)
            {
                pregunta7 = "No";
            }





            if (hmradi8.Checked)
            {
                pregunta8 = "Si";
            }
            if (hmradi9.Checked)
            {
                pregunta9 = hmrespu5.Value;
            }
            if (hmradi10.Checked)
            {
                pregunta10 = hmrespu6.Value;
            }
            if (hmradi11.Checked)
            {
                pregunta11 = "Si";
            }
            if (hmradi12.Checked)
            {
                pregunta12 = "Si";
            }
            if (hmradi13.Checked)
            {
                pregunta13 = "Si";
            }
            if (hmradi14.Checked)
            {
                pregunta14 = "Si";
            }
            if (hmradi15.Checked)
            {
                pregunta15 = "Si";
            }
            if (hmradi16.Checked)
            {
                pregunta16 = "Si";
            }
            if (hmradi17.Checked)
            {
                pregunta17 = "Si";
            }
            if (hmradi18.Checked)
            {
                pregunta18 = hmrespu7.Value;
            }
            if (hmradi19.Checked)
            {
                pregunta19 = "Si";
            }
            if (hmradi20.Checked)
            {
                pregunta20 = hmrespu8.Value;
            }
            if (hmradioPeso.Checked)
            {
                peso = excesop.Value;
            }

            if (hmradi21.Checked)
            {
                pregunta21 = "Si";
            }
            if (hmradi22.Checked)
            {
                pregunta22 = "Si";
            }
            if (hmradi23.Checked)
            {
                pregunta23 = hmrespu9.Value;
            }
            if (hmradi24.Checked)
            {
                pregunta24 = "Si";
            }
            if (hmradi25.Checked)
            {
                pregunta25 = "Si";
            }
            if (hmradi26.Checked)
            {
                pregunta26 = "Si";
            }
            if (hmradi27.Checked)
            {
                pregunta27 = hmrespu10.Value;
            }
            if (hmradi28.Checked)
            {
                pregunta28 = hmrespu11.Value;
            }
            if (hmradi29.Checked)
            {
                pregunta29 = "Si";
                cigarros = hmrespu12.Value;
                cuanto2 = hmrespu13.Value;
            }
            if (hmradi30.Checked)
            {
                bebedor = "Si";
                pregunta30 = hmrespu14.Value;
            }
            else
            {
                bebedor = "No";
                pregunta30 = "";
            }
            if (hmradi31.Checked)
            {
                pregunta31 = hmrespu15.Value;
            }
            if (hmradi32.Checked)
            {
                pregunta32 = "Si";
            }

            // Historial de mujer

            if (smradi1.Checked)
            {
                pregunta33 = "Si";
                embarazo = Int32.Parse(smrespu1.Value);
            }
            if (smradi2.Checked)
            {
                pregunta34 = "Si";
            }
            if (smradi3.Checked)
            {
                partos = Int32.Parse(smrespu2.Value);
                aborto = Int32.Parse(smrespu3.Value);
                cesarias = Int32.Parse(smrespu4.Value);
            }

            // Signos vitales
            if (svrespu1.Value != "")
            {
                presion = svrespu1.Value;
            }
            if (svrespu2.Value != "")
            {
                pulso = svrespu2.Value;
            }
            if (svrespu3.Value != "")
            {
                frecuencia = svrespu3.Value;
            }

            if (hmnooo.Checked || hmsi.Checked)
            {         
                objeto.agregarExpediente(cedulaEx.Text, lblfecha.Text, pregunta1, pregunta2, pregunta3, pregunta4, pregunta5, anemia, pregunta6, pregunta7, donde, cuanto, pregunta8, pregunta9, pregunta10, pregunta11, pregunta12, pregunta13, pregunta14, pregunta15, pregunta16, pregunta17, pregunta18, pregunta19, pregunta20, peso, pregunta21, pregunta22, pregunta23, pregunta24, pregunta25, pregunta26, pregunta27, pregunta28, pregunta29, cigarros, cuanto2, bebedor, pregunta30, pregunta31, pregunta32, Text2.Value);
                int codigo = objeto.BuscarcodigoExpediente(cedulaEx.Text);
                objeto.agregarExpedienteMujer(codigo, pregunta33, embarazo, pregunta34, partos, aborto, cesarias, smrespu5.Value);
                objeto.agregarsignos(codigo, presion, pulso, frecuencia);
                estadoguardar = true;
            }
            return estadoguardar;
        }



        protected void Guardar_Click(object sender, EventArgs e)
        {
            try
            {
                if (agregar() == true)
                {
                    Response.Write("<script language='javascript'>window.alert('Expendiente guardado con exito');window.location='frm_AgregarExpediente.aspx';</script>");
                }
                else
                {
                    hmsi.Focus();
                    Response.Write("<script language='javascript'>window.alert('La pregunta 7 es obligatoria');</script>");
                }
            }
            catch
            {
                string scrippt = @"<script type='text/javascript'>
                alert('No se logró guardar la información');
                </script>";
                ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", scrippt, false);
            }

        }

        protected void cedulaEx_TextChanged(object sender, EventArgs e)
        {
            if (objeto.busquedacedula(cedulaEx.Text) == 1)
            {
                string scrippt = @"<script type='text/javascript'>
                alert('Ya existe este expediente');
                </script>";
                ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", scrippt, false);

            }
            else if (objeto.busquedacedula(cedulaEx.Text) == 3)
            {
                string scrippt = @"<script type='text/javascript'>
                alert('Debe ser registrado como paciente primero');
                </script>";
                ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", scrippt, false);
            }
            else
            {
                hmradi1.Focus();
            }
        }

        //protected void Cancelar_Click(object sender, EventArgs e)
        //{
        //    Response.Redirect("frm_AgregarExpediente.aspx");
        //}
    }
}
