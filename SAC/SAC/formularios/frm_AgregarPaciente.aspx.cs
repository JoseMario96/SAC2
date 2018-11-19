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
        public static Boolean enviar = false;
        public static string tipo;
        public static string generoEncargado;


        protected void Page_Load(object sender, EventArgs e)
        {
            cedula.Focus();
        }
        public void agregarPaciente()
        {
            if (enviar == false)
            {
                string generoEncargado = "";
                string tipo = "";
                Boolean validar = false;
                Boolean validar2 = false;
                Boolean validar3 = false;
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
                if (siE.Checked)
                {
                    if (cedula_encargad.Text != "" & nombre1_encargado.Value != "" & nombre2_encargado.Value != "" & apellido1_encargado.Value != "" & apellido2_encargado.Value != "" & celular_encargado.Value != "" & direccion_encargado.Value != "" & correo_encargado.Value != "" & parentezco.Value != "")
                    {
                        validar3 = true;
                    }
                    else
                    {
                        string informacionE = @"<script type='text/javascript'>
                alert('Complete la información del encargado');
                </script>";
                        ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", informacionE, false);
                    }
                    if (masculinoE.Checked)
                    {
                        generoEncargado = "Masculino";
                        validar2 = true;
                    }
                    else if (femeninoE.Checked)
                    {
                        generoEncargado = "Femenino";
                        validar2 = true;
                    }
                    else if (otroE.Checked)
                    {
                        generoEncargado = "Otro";
                        validar2 = true;
                    }
                    else
                    {
                        string Msgenero = @"<script type='text/javascript'>
                alert('Seleccione un género para el encargado');
                </script>";
                        ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", Msgenero, false);
                        masculinoE.Focus();
                    }
                }
                if (validar == true & noE.Checked)
                {
                    agregarP.agregarPaciente(cedula.Text, nombre1.Value, nombre2.Value, apellido1.Value, apellido2.Value, tipo, telefono.Value, celular.Value, direccion.Value, cedula_encargad.Text, correo.Value, fecha_nacimiento.Value, fecha_ingreso.Value, nombre1_encargado.Value, nombre2_encargado.Value, apellido1_encargado.Value, apellido2_encargado.Value, generoEncargado, telefono_encargado.Value, celular_encargado.Value, direccion_encargado.Value, correo_encargado.Value, parentezco.Value);
                }
                else if (siE.Checked & validar2 == true & validar3 == true & validar == true)
                {
                    agregarP.agregarPaciente(cedula.Text, nombre1.Value, nombre2.Value, apellido1.Value, apellido2.Value, tipo, telefono.Value, celular.Value, direccion.Value, cedula_encargad.Text, correo.Value, fecha_nacimiento.Value, fecha_ingreso.Value, nombre1_encargado.Value, nombre2_encargado.Value, apellido1_encargado.Value, apellido2_encargado.Value, generoEncargado, telefono_encargado.Value, celular_encargado.Value, direccion_encargado.Value, correo_encargado.Value, parentezco.Value);

                }
            }
        }

        protected void Guardar_Click(object sender, EventArgs e)
        {
            if (enviar == false)
            {
                try
                {
                    String corre = correo.Value;
                    string correE = correo_encargado.Value;

                    if (agregarP.validacioncorreo(corre) == true & noE.Checked)
                    {
                        agregarPaciente();
                        string scriptt = @"<script type='text/javascript'>
                alert('Se registro la información correctamente');
                </script>";
                        ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", scriptt, false);
                    }
                    else if (agregarP.validacioncorreo(corre) == true & agregarP.validacioncorreo(correE) == true & siE.Checked)
                    {
                        agregarPaciente();

                        string script = @"<script type='text/javascript'>
                alert('Se registro la información correctamente');
                </script>";
                        ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", script, false);
                        //Response.Redirect("Index.aspx");
                        //this.Controls.Clear();
                        //Response.Redirect("frm_AgregarPaciente.aspx");
                    }
                    else
                    {
                        string script = @"<script type='text/javascript'>
                alert('Correo inválido');
                </script>";
                        ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", script, false);

                        if (noE.Checked)
                        {
                            correo.Focus();
                        }
                        else if (siE.Checked & agregarP.validacioncorreo(corre) == true)
                        {
                            correo_encargado.Focus();
                        }
                    }
                }
                catch
                {
                    string script = @"<script type='text/javascript'>
                    alert('No se registro la información correctamente');
                    </script>";
                    ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", script, false);
                }
            }
            else
            {
                agregarP.agregarPaciente2(cedula.Text, nombre1.Value, nombre2.Value, apellido1.Value, apellido2.Value, tipo, telefono.Value, celular.Value, direccion.Value, cedula_encargad.Text, correo.Value, fecha_nacimiento.Value, fecha_ingreso.Value, nombre1_encargado.Value, nombre2_encargado.Value, apellido1_encargado.Value, apellido2_encargado.Value, generoEncargado, telefono_encargado.Value, celular_encargado.Value, direccion_encargado.Value, correo_encargado.Value, parentezco.Value);
                string insertar = @"<script type='text/javascript'>
                alert('Se registro la información correctamente');
                </script>";
                ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", insertar, false);

            }

        }

        protected void Cancelar_Click(object sender, EventArgs e)
        {
            //limpieza.CleanControl(this.Controls);
            this.Controls.Clear();
            Response.Redirect("frm_AgregarPaciente.aspx");
        }

        protected void cedula_TextChanged(object sender, EventArgs e)
        {
            if (agregarP.VerificarPaciente(cedula.Text) == true)
            {
                string insertar = @"<script type='text/javascript'>
                alert('Ya existe este paciente');
                </script>";
                ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", insertar, false);
                cedula.Text = "";
                cedula.Focus();
            }
            else
            {
                nombre1.Focus();
            }
        }

        protected void cedula_encargad_TextChanged(object sender, EventArgs e)
        {
            string scriptt = @"<script type='text/javascript'>
                document.getElementById('encargado').scrollIntoView();              
            </script>";
           
            string[] datos2 = new string[11];
            datos2 = agregarP.buscarEncargado(cedula_encargad.Text);

            //!cedula_encargad.Equals("")
            if (!String.IsNullOrEmpty(datos2[0]))
            {
                cedula_encargad.Focus();
                cedula_encargad.Text = datos2[0];
                nombre1_encargado.Value = datos2[1];
                nombre2_encargado.Value = datos2[2];
                apellido1_encargado.Value = datos2[3];
                apellido2_encargado.Value = datos2[4];

                if (datos2[5].Equals("Masculino"))
                {
                    masculinoE.Checked = true;
                    femeninoE.Checked = false;
                    otroE.Checked = false;
                }
                else if (datos2[5].Equals("Femenino"))
                {
                    masculinoE.Checked = false;
                    femeninoE.Checked = true;
                    otroE.Checked = false;
                }
                else if (datos2[5].Equals("Otro"))
                {
                    masculinoE.Checked = false;
                    femeninoE.Checked = false;
                    otroE.Checked = true;
                }
                telefono_encargado.Value = datos2[6];
                celular_encargado.Value = datos2[7];
                direccion_encargado.Value = datos2[8];
                parentezco.Value = datos2[9];
                correo_encargado.Value = datos2[10];

                // agregarP.agregarPaciente(cedula.Value, nombre1.Value, nombre2.Value, apellido1.Value, apellido2.Value, tipo, telefono.Value, celular.Value, direccion.Value, cedula_encargad.Text, correo.Value, fecha_nacimiento.Value, fecha_ingreso.Value, nombre1_encargado.Value, nombre2_encargado.Value, apellido1_encargado.Value, apellido2_encargado.Value, generoEncargado, telefono_encargado.Value, celular_encargado.Value, direccion_encargado.Value, correo_encargado.Value, parentezco.Value);


                enviar = true;
            }
            else
            {
                nombre1_encargado.Focus();

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

                if (masculinoE.Checked)
                {
                    generoEncargado = "Masculino";
                    validar2 = true;
                }
                else if (femeninoE.Checked)
                {
                    generoEncargado = "Femenino";
                    validar2 = true;
                }
                else if (otroE.Checked)
                {
                    generoEncargado = "Otro";
                    validar2 = true;
                }

            }
            ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", scriptt, false);
        }

        //protected void actualizarE_Click(object sender, EventArgs e)
        //{
        //    cedula_encargad.Text = "";
        //}
    }
}