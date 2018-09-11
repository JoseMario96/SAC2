using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SAC.formularios
{
    public partial class frm_AgregarPaciente : System.Web.UI.Page
    {
        metodos.metodosPaciente agregarP = new metodos.metodosPaciente();
        protected void Page_Load(object sender, EventArgs e)
        {


        }
        public void agregarPaciente()
        {
            string tipo = "";
            if (masculino.Checked)
            {
                tipo = "masculino";
            }
            else if (femenino.Checked)
            {
                tipo = "femenino";
            }
            else if (otro.Checked)
            {
                tipo = "otro";
            }
            else
            {
                string script = @"<script type='text/javascript'>
                alert('Seleccione un género');
                </script>";
                ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", script, false);
            }
            //if(cedula_encargado.Value.Equals)
            agregarP.agregarPaciente(cedula.Value, nombre1.Value, nombre2.Value, apellido1.Value, apellido2.Value, tipo, telefono.Value, celular.Value, direccion.Value, cedula_encargado.Value, correo.Value, fecha_nacimiento.Value, fecha_ingreso.Value);

        }

        protected void Guardar_Click(object sender, EventArgs e)
        {
            try
            {
                agregarPaciente();
                string script = @"<script type='text/javascript'>
                alert('Se registro la información correctamente');
                </script>";
                ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", script, false);
                //Response.Redirect("Index.aspx");
            }
            catch
            {
                string script = @"<script type='text/javascript'>
                    alert('No se registro la información correctamente');
                    </script>";
                ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", script, false);
            }

        }

        protected void limpiar_Click(object sender, EventArgs e)
        {

        }

        //protected void Cancelar_Click(object sender, EventArgs e)
        //{
        //    string script = "<script type=text/javascript>urlVolver();</script>";
        //       ScriptManager.RegisterStartupScript(this, typeof(Page), "popup", script, true);
        //}

        //protected void Cancelar_Click(object sender, EventArgs e)
        //{
        //    //  string script = "window.close();";
        //    //  ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "Pop", "$('#myModal').modal('hide');", true);
        //    //ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "$('#myModal').modal('hide');", true);
        //    //ClientScript.RegisterStartupScript(this.GetType(), "Close", "CloseDialog();", true);
        //    //ScriptManager.RegisterStartupScript(this, GetType(), "Close Modal Popup", "Closepopup();", true);
        //    ////ScriptManager.RegisterStartupScript(this, GetType(), "Close Modal Popup", "Closepopup();", true);
        //    ////ScriptManager.RegisterStartupScript(this, GetType(), "Close Modal Popup", "CloseDialog();", true);
        //    //ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "Pop", "$('#myModal').modal('hide');", true);
        //    ////ScriptManager.RegisterStartupScript(this, GetType(), "script", "window.close();", true);
        //    //string script = @"<script type='text/javascript'>
        //    //   $('#addPayment').modal('close');
        //    //    </script>";
        //    //ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", script, false);

        //    //Response.Write("<script>window.close();</script>");

        //    string script = "window.close();";

        //    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "closewindows", script, true);




        //}
    }
}
