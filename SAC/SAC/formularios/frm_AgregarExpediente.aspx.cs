using System;
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

        protected void Page_Load(object sender, EventArgs e)
        {
            //fechaEx.Focus();
        }

        //Este método agrega expedientes
        public void agregar()
        {
            String pregunta1 = ""; String pregunta2 = ""; String donde = ""; String cuanto = ""; string pregunta9 = ""; string pregunta10 = ""; string pregunta18 = ""; string pregunta20 = ""; string pregunta23 = ""; string pregunta27 = ""; string pregunta28 = ""; string cigarros = "";
            string cuanto2 = ""; string pregunta29 = "No"; string pregunta30 = "No"; string pregunta31 = ""; string bebedor = "";

            string pregunta3 = "No"; string anemia = "No"; string pregunta4 = "No"; string pregunta5 = "No"; string pregunta6 = "No"; string pregunta7 = "No"; string pregunta8 = "No"; string pregunta11 = "No";
            string pregunta12 = "No"; string pregunta13 = "No"; string pregunta14 = "No"; string pregunta15 = "No"; string pregunta16 = "No"; string pregunta17 = "No"; string pregunta19 = "No";
            string pregunta21 = "No"; string pregunta22 = "No"; string pregunta24 = "No"; string pregunta25 = "No"; string pregunta26 = "No"; string pregunta32 = "No"; string peso = "";
            string pregunta33 = "No"; int embarazo = 0; string pregunta34 = "No"; int cesarias = 0; int aborto = 0; int partos = 0;

            String presion = ""; string pulso = ""; string frecuencia = "";
            // Historial médico
            if (hmradi1.Checked)
            {
                pregunta1 = hmrespu1.Value;
            }
            if (hmradi2.Checked)
            {
                pregunta2 = hmrespu2.Value;
            }
            if (hmradi3.Checked)
            {
                pregunta3 = "si";
            }
            if (hmradi4.Checked)
            {
                pregunta4 = "si";
            }
            if (hmradi5.Checked)
            {
                pregunta5 = "si";
            }
            if (hmradi6.Checked)
            {
                anemia = "si";
            }
            if (hmradi7.Checked)
            {
                pregunta6 = "si";
            }
            if (hmsi.Checked)
            {
                pregunta7 = "si";
                donde = hmrespu3.Value;
                cuanto = hmrespu4.Value;
            }
            else if (hmno.Checked)
            {
                pregunta7 = "no";
            }
            else
            {
                string script = @"<script type='text/javascript'>
                alert('Responda la pregunta 7');
                </script>";
                ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", script, false);
                hmsi.Focus();
            }
            if (hmradi8.Checked)
            {
                pregunta8 = "si";
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
                pregunta11 = "si";
            }
            if (hmradi12.Checked)
            {
                pregunta12 = "si";
            }
            if (hmradi13.Checked)
            {
                pregunta13 = "si";
            }
            if (hmradi14.Checked)
            {
                pregunta14 = "si";
            }
            if (hmradi15.Checked)
            {
                pregunta15 = "si";
            }
            if (hmradi16.Checked)
            {
                pregunta16 = "si";
            }
            if (hmradi17.Checked)
            {
                pregunta17 = "si";
            }
            if (hmradi18.Checked)
            {
                pregunta18 = hmrespu7.Value;
            }
            if (hmradi19.Checked)
            {
                pregunta19 = "si";
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
                pregunta21 = "si";
            }
            if (hmradi22.Checked)
            {
                pregunta22 = "si";
            }
            if (hmradi23.Checked)
            {
                pregunta23 = hmrespu9.Value;
            }
            if (hmradi24.Checked)
            {
                pregunta24 = "si";
            }
            if (hmradi25.Checked)
            {
                pregunta25 = "si";
            }
            if (hmradi26.Checked)
            {
                pregunta26 = "si";
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
                pregunta29 = "si";
                cigarros = hmrespu12.Value;
                cuanto2 = hmrespu13.Value;
            }
            if (hmradi30.Checked)
            {
                bebedor = "si";
                pregunta30 = hmrespu14.Value;
            }
            if (hmradi31.Checked)
            {
                pregunta31 = hmrespu15.Value;
            }
            if (hmradi32.Checked)
            {
                pregunta32 = "si";
            }

            // Historial de mujer

            if (smradi1.Checked)
            {
                pregunta33 = "si";
                embarazo = Int32.Parse(smrespu1.Value);
            }
            if (smradi2.Checked)
            {
                pregunta34 = "si";
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


            if (hmsi.Checked || hmno.Checked)
            {
                objeto.agregarExpediente(cedulaEx.Text, fechaEx.Value, pregunta1, pregunta2, pregunta3, pregunta4, pregunta5, anemia, pregunta6, pregunta7, donde, cuanto, pregunta8, pregunta9, pregunta10, pregunta11, pregunta12, pregunta13, pregunta14, pregunta15, pregunta16, pregunta17, pregunta18, pregunta19, pregunta20, peso, pregunta21, pregunta22, pregunta23, pregunta24, pregunta25, pregunta26, pregunta27, pregunta28, pregunta29, cigarros, cuanto2, bebedor, pregunta30, pregunta31, pregunta32, Text2.Value);
                int codigo = objeto.BuscarcodigoExpediente(cedulaEx.Text);
                objeto.agregarExpedienteMujer(codigo, pregunta33, embarazo, pregunta34, partos, aborto, cesarias, smrespu5.Value);
                objeto.agregarsignos(codigo, presion, pulso, frecuencia);
            }
        }



        protected void Guardar_Click(object sender, EventArgs e)
        {
            try
            {
                agregar();
                string script = @"<script type='text/javascript'>
            alert('Expediente guardado con éxito');
            </script>";
                ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", script, false);
               
                this.Controls.Clear();
                Response.Redirect("frm_AgregarExpediente.aspx");
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
    }
}
