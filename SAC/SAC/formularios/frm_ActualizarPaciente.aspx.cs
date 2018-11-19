using System;
using System.Collections.Generic;
using System.Drawing;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SAC.formularios
{
    public partial class frm_ActualizarPaciente : System.Web.UI.Page
    {
        metodos.metodosPaciente objeto = new metodos.metodosPaciente();
        public static string generoE;
        public static string genero;
        public static int estado = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            txtSearch.Focus();
            ImageButton1.ImageUrl = "/images/actualizarEncargado.png";
            if (!this.IsPostBack)
            {

                GridView1.DataSource = objeto.Paciente();
                GridView1.DataBind();

            }
        }
        //Llenar los formularios con la selección en el grid
        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            String ced;

            String[] datos = new String[13];
            String[] datos2 = new String[10];
            GridView1.DataSource = objeto.Paciente2(txtSearch.Text.Trim());
            GridView1.DataBind();

            string script = @"<script type='text/javascript'>
                document.getElementById('formularioP').style.display = 'block' ;
                document.getElementById('formularioP').scrollIntoView();                  
                document.getElementById('Botones').style.display = 'block';
            </script>";

            ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", script, false);
            foreach (GridViewRow row in GridView1.Rows)
            {

                if (row.RowIndex == GridView1.SelectedIndex)
                {
                    row.BackColor = ColorTranslator.FromHtml("#A1DCF2");
                    row.ToolTip = string.Empty;

                    ced = row.Cells[0].Text;
                    datos = objeto.buscarPaciente(ced);
                    if (datos[9] == null)
                    {
                        NoE.Checked = true;
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "ocultar()", true);

                        cedula.InnerHtml = datos[0];
                        nombre1.Text = datos[1];
                        nombre2.Text = datos[2];
                        apellido1.Text = datos[3];
                        apellido2.Text = datos[4];
                        if (datos[5].Equals("Masculino"))
                        {
                            generoF.Checked = false;
                            generoO.Checked = false;
                            generoM.Checked = true;
                        }
                        if (datos[5].Equals("Femenino"))
                        {
                            generoM.Checked = false;
                            generoO.Checked = false;
                            generoF.Checked = true;
                        }
                        if (datos[5].Equals("Otro"))
                        {
                            generoM.Checked = false;
                            generoF.Checked = false;
                            generoO.Checked = true;
                        }
                        telefono.Text = datos[6];
                        celular.Text = datos[7];
                        direccion.Text = datos[8];
                        correo.Text = datos[10];
                        fechaN.Text = datos[11].Substring(0, 9);
                        fechaI.Text = datos[12].Substring(0, 9);

                    }
                    else
                    {
                        NoE.Checked = false;
                        SiE.Checked = true;

                        cedula.InnerHtml = datos[0];
                        nombre1.Text = datos[1];
                        nombre2.Text = datos[2];
                        apellido1.Text = datos[3];
                        apellido2.Text = datos[4];
                        if (datos[5].Equals("Masculino"))
                        {
                            generoF.Checked = false;
                            generoO.Checked = false;
                            generoM.Checked = true;
                        }
                        if (datos[5].Equals("Femenino"))
                        {
                            generoM.Checked = false;
                            generoO.Checked = false;
                            generoF.Checked = true;
                        }
                        if (datos[5].Equals("Otro"))
                        {
                            generoM.Checked = false;
                            generoF.Checked = false;
                            generoO.Checked = true;
                        }
                        telefono.Text = datos[6];
                        celular.Text = datos[7];
                        direccion.Text = datos[8];
                        correo.Text = datos[10];
                        fechaN.Text = datos[11].Substring(0, 9);
                        fechaI.Text = datos[12].Substring(0, 9);

                        Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "mostrar()", true);

                        datos2 = objeto.buscarEncargado(datos[9]);

                        cedula_encargado.Text = datos2[0];
                        nombre1_encargado.Text = datos2[1];
                        nombre2_encargado.Text = datos2[2];
                        apellido1_encargado.Text = datos2[3];
                        apellido2_encargado.Text = datos2[4];
                        if (datos2[5].Equals("Masculino"))
                        {
                            generoEF.Checked = false;
                            generoEO.Checked = false;
                            generoEM.Checked = true;
                        }
                        else if (datos2[5].Equals("Femenino"))
                        {
                            generoEM.Checked = false;
                            generoEO.Checked = false;
                            generoEF.Checked = true;
                        }
                        else if (datos2[5].Equals("Otro"))
                        {
                            generoEM.Checked = false;
                            generoEF.Checked = false;
                            generoEO.Checked = true;
                        }
                        telefono_encargado.Text = datos2[6];
                        celular_encargado.Text = datos2[7];
                        direccion_encargado.Text = datos2[8];
                        parentezco.Text = datos2[9];
                        correo_encargado.Text = datos2[10];
                    }

                }
                else
                {
                    row.BackColor = ColorTranslator.FromHtml("#FFFFFF");
                    row.ToolTip = "Click to select this row.";

                }

            }

        }

        //Metodo para seleccionar una tabla
        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                //e.Row.Attributes["onmouseover"] = "this.style.backgroundColor='aquamarine';";
                //e.Row.Attributes["onmouseout"] = "this.style.backgroundColor='white';";
                e.Row.Attributes["onclick"] = Page.ClientScript.GetPostBackClientHyperlink(GridView1, "Select$" + e.Row.RowIndex);
                e.Row.ToolTip = "Click para seleccionar esta fila.";

            }
        }

        // Metodo con el header de la tabla para la busqueda
 

        protected void Guardar_Click(object sender, EventArgs e)
        {
            String[] datos = new String[13];
            if (generoEM.Checked)
            {
                //generoEM.Checked = true;
                generoE = "Masculino";
            }
            else if (generoEF.Checked)
            {
                //generoEF.Checked = true;
                generoE = "Femenino";
            }
            else if (generoEO.Checked)
            {
                //generoEO.Checked = true;
                generoE = "Otro";
            }

            if (generoM.Checked)
            {
                //generoM.Checked = true;
                genero = "Masculino";
            }
            else if (generoF.Checked)
            {
                //generoF.Checked = true;
                genero = "Femenino";
            }
            else if (generoO.Checked)
            {
                //generoO.Checked = true;
                genero = "Otro";
            }

            DateTime dt = Convert.ToDateTime(fechaN.Text);
            string fN = dt.ToString("yyyy-MM-dd");
            DateTime dt2 = Convert.ToDateTime(fechaI.Text);
            string fI = dt.ToString("yyyy-MM-dd");

            string corre = correo.Text;
            string correE = correo_encargado.Text;

            if (NoE.Checked & objeto.validacioncorreo(corre) == true)
            {
                objeto.actualizarPaciente(cedula.InnerHtml, nombre1.Text, nombre2.Text, apellido1.Text, apellido2.Text, genero, telefono.Text, celular.Text, direccion.Text, correo.Text, fN, fI);
                datos = objeto.buscarPaciente(cedula.InnerHtml);
                if (datos[9] == null & SiE.Checked & cedula_encargado.Text != "" & nombre1_encargado.Text != "" & nombre2_encargado.Text != "" & apellido1_encargado.Text != "" & apellido2_encargado.Text != "" & celular_encargado.Text != "" & direccion_encargado.Text != "" & correo_encargado.Text != "" & parentezco.Text != "")
                {

                    objeto.ActualizarPacienteNuevoEncargado(estado, cedula.InnerHtml, cedula_encargado.Text, nombre1_encargado.Text, nombre2_encargado.Text, apellido1_encargado.Text, apellido2_encargado.Text, generoE, telefono_encargado.Text, celular_encargado.Text, direccion_encargado.Text, correo_encargado.Text, parentezco.Text);
                }
            }
            else if (objeto.validacioncorreo(corre) == true & objeto.validacioncorreo(correE) == true & SiE.Checked)
            {
                if (cedula_encargado.Text != "" & nombre1_encargado.Text != "" & nombre2_encargado.Text != "" & apellido1_encargado.Text != "" & apellido2_encargado.Text != "" & celular_encargado.Text != "" & direccion_encargado.Text != "" & correo_encargado.Text != "" & parentezco.Text != "")
                {
                    objeto.actualizarEncargado(cedula_encargado.Text, nombre1_encargado.Text, nombre2_encargado.Text, apellido1_encargado.Text, apellido2_encargado.Text, generoE, telefono_encargado.Text, celular_encargado.Text, direccion_encargado.Text, parentezco.Text, correo_encargado.Text);
                    objeto.actualizarPaciente(cedula.InnerHtml, nombre1.Text, nombre2.Text, apellido1.Text, apellido2.Text, genero, telefono.Text, celular.Text, direccion.Text, correo.Text, fN, fI);
                }
                else
                {
                    string mensaje = @"<script type='text/javascript'>
                alert('Debe de completar los campos del encargado');
                document.getElementById('formularioP').style.display = 'block' ;
                document.getElementById('encargado').style.display = 'block' ;        
                document.getElementById('encargado').scrollIntoView(); 
                </script>";
                    ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", mensaje, false);
                }
                datos = objeto.buscarPaciente(cedula.InnerHtml);
                if (SiE.Checked & cedula_encargado.Text != "" & nombre1_encargado.Text != "" & nombre2_encargado.Text != "" & apellido1_encargado.Text != "" & apellido2_encargado.Text != "" & celular_encargado.Text != "" & direccion_encargado.Text != "" & correo_encargado.Text != "" & parentezco.Text != "")
                {
                    objeto.ActualizarPacienteNuevoEncargado(estado, cedula.InnerHtml, cedula_encargado.Text, nombre1_encargado.Text, nombre2_encargado.Text, apellido1_encargado.Text, apellido2_encargado.Text, generoE, telefono_encargado.Text, celular_encargado.Text, direccion_encargado.Text, correo_encargado.Text, parentezco.Text);
                }
            }
            else
            {
                string mensaje = @"<script type='text/javascript'>
                alert('Correo inválido');
                </script>";
                ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", mensaje, false);
                if ((NoE.Checked))
                {
                    correo_encargado.Focus();
                }
                else
                {
                    correo.Focus();
                }
            }

            GridView1.DataSource = objeto.Paciente2(txtSearch.Text.Trim());
            GridView1.DataBind();

            string script = @"<script type='text/javascript'>
                alert('Se han actualizado adecuadamente los datos');
                </script>";
            ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", script, false);

        }


        protected void actualizarE_Click(object sender, EventArgs e)
        {
            string script = @"<script type='text/javascript'>
            document.getElementById('formularioP').style.display = 'block' ;
            document.getElementById('encargado').style.display = 'block' ;        
            document.getElementById('encargado').scrollIntoView(); 
            </script>";
            ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", script, false);

            cedula_encargado.Text = "";
            nombre1_encargado.Text = "";
            nombre2_encargado.Text = "";
            apellido1_encargado.Text = "";
            apellido2_encargado.Text = "";
            telefono_encargado.Text = "";
            celular_encargado.Text = "";
            correo_encargado.Text = "";
            parentezco.Text = "";
            direccion_encargado.Text = "";
        }

        protected void cedula_encargado_TextChanged(object sender, EventArgs e)
        {
            string script = @"<script type='text/javascript'>
            document.getElementById('formularioP').style.display = 'block' ;
            document.getElementById('encargado').style.display = 'block' ;
            document.getElementById('encargado').scrollIntoView();   
            document.getElementById('Botones').style.display = 'block' ;
            </script>";

            ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", script, false);

            String[] encargado = new String[10];
            encargado = objeto.buscarEncargado(cedula_encargado.Text);

            string dinamica = encargado[0];
            if (dinamica == null)
            {
                dinamica = "";
            }

            if (dinamica.Equals(cedula_encargado.Text))
            {
                cedula_encargado.Text = encargado[0];
                nombre1_encargado.Text = encargado[1];
                nombre2_encargado.Text = encargado[2];
                apellido1_encargado.Text = encargado[3];
                apellido2_encargado.Text = encargado[4];
                if (encargado[5].Equals("Masculino"))
                {
                    generoEF.Checked = false;
                    generoEO.Checked = false;
                    generoEM.Checked = true;
                }
                else if (encargado[5].Equals("Femenino"))
                {
                    generoEM.Checked = false;
                    generoEO.Checked = false;
                    generoEF.Checked = true;
                }
                else if (encargado[5].Equals("Otro"))
                {
                    generoEM.Checked = false;
                    generoEF.Checked = false;
                    generoEO.Checked = true;
                }
                telefono_encargado.Text = encargado[6];
                celular_encargado.Text = encargado[7];
                direccion_encargado.Text = encargado[8];
                parentezco.Text = encargado[9];
                correo_encargado.Text = encargado[10];
            }
            else
            {
                estado = 1;
                nombre1_encargado.Focus();
            }
            ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", script, false);

        }
        protected void Cancelar_Click(object sender, EventArgs e)
        {
            GridView1.DataSource = objeto.Paciente();
            GridView1.DataBind();
            this.Controls.Clear();
            Response.Redirect("frm_ActualizarPaciente.aspx");
        }

        protected void InvisButton_Click(object sender, EventArgs e)
        {
            GridView1.DataSource = objeto.Paciente2(txtSearch.Text.Trim());
            GridView1.DataBind();
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.DataSource = objeto.Paciente2(txtSearch.Text.Trim());
            GridView1.PageIndex = e.NewPageIndex;
            GridView1.DataBind();
        }
    }
}
