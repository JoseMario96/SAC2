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
            string generoEncargado = "";
            if (Radio3.Checked)
            {
                generoEncargado = "masculino";
            }
            else if (Radio4.Checked)
            {
                generoEncargado = "femenino";
            }
            else if (Radio5.Checked)
            {
                generoEncargado = "otro";
            }
            else
            {
                string script = @"<script type='text/javascript'>
                alert('Seleccione un género para el encargado');
                </script>";
                ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", script, false);
            }
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
                alert('Seleccione un género para el paciente');
                </script>";
                ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", script, false);
            }
            agregarP.agregarPaciente(cedula.Value, nombre1.Value, nombre2.Value, apellido1.Value, apellido2.Value, tipo, telefono.Value, celular.Value, direccion.Value, cedula_encargado.Value, correo.Value, fecha_nacimiento.Value, fecha_ingreso.Value, nombre1_encargado.Value, nombre2_encargado.Value, apellido1_encargado.Value, apellido2_encargado.Value, generoEncargado, telefono_encargado.Value, celular_encargado.Value, direccion_encargado.Value, correo_encargado.Value, parentezco.Value);

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

        protected void Cancelar_Click(object sender, EventArgs e)
        {
            nombre1.Value = cedula_encargado.Value;
        }
    }
}