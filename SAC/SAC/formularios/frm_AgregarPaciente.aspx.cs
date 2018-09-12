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
        limpiar.limpiar limpieza = new limpiar.limpiar();
        protected void Page_Load(object sender, EventArgs e)
        {


        }
        public void agregarPaciente()
        {
            string generoEncargado = "";
            string tipo = "";
            Boolean validar = false;
            Boolean validar2 = false;
            if (masculino.Checked)
            {
                tipo = "Masculino";
                validar = true;
            }
            else if (femenino.Checked)
            {
                tipo = "Femenino";
                validar = true;
            }
            else if (otro.Checked)
            {
                tipo = "Otro";
                validar = true;
            }
            else
            {
                string script = @"<script type='text/javascript'>
                alert('Seleccione un género para el paciente');
                </script>";
                ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", script, false);
                masculino.Focus();
            }
            if (Radio1.Checked)
            {
                if (Radio3.Checked)
                {
                    generoEncargado = "Masculino";
                    validar2 = true;
                }
                else if (Radio4.Checked)
                {
                    generoEncargado = "Femenino";
                    validar2 = true;
                }
                else if (Radio5.Checked)
                {
                    generoEncargado = "Otro";
                    validar2 = true;
                }
                else
                {
                    string script = @"<script type='text/javascript'>
                alert('Seleccione un género para el encargado');
                </script>";
                    ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", script, false);
                    Radio3.Focus();
                }
            }
            if (validar == true & Radio2.Checked)
            {
                agregarP.agregarPaciente(cedula.Value, nombre1.Value, nombre2.Value, apellido1.Value, apellido2.Value, tipo, telefono.Value, celular.Value, direccion.Value, cedula_encargado.Value, correo.Value, fecha_nacimiento.Value, fecha_ingreso.Value, nombre1_encargado.Value, nombre2_encargado.Value, apellido1_encargado.Value, apellido2_encargado.Value, generoEncargado, telefono_encargado.Value, celular_encargado.Value, direccion_encargado.Value, correo_encargado.Value, parentezco.Value);
            }
            else if (Radio1.Checked & validar2 == true)
            {
                agregarP.agregarPaciente(cedula.Value, nombre1.Value, nombre2.Value, apellido1.Value, apellido2.Value, tipo, telefono.Value, celular.Value, direccion.Value, cedula_encargado.Value, correo.Value, fecha_nacimiento.Value, fecha_ingreso.Value, nombre1_encargado.Value, nombre2_encargado.Value, apellido1_encargado.Value, apellido2_encargado.Value, generoEncargado, telefono_encargado.Value, celular_encargado.Value, direccion_encargado.Value, correo_encargado.Value, parentezco.Value);

            }

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
            //limpieza.CleanControl();
        }
    }
}