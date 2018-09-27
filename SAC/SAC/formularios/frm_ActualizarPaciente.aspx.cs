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
        protected void Page_Load(object sender, EventArgs e)
        {

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
            GridView1.DataSource = objeto.Paciente();
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

                        cedula.Value = datos[0];
                        nombre1.Value = datos[1];
                        nombre2.Value = datos[2];
                        apellido1.Value = datos[3];
                        apellido2.Value = datos[4];
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
                        telefono.Value = datos[6];
                        celular.Value = datos[7];
                        direccion.Value = datos[8];
                        correo.Value = datos[10];
                        fechaN.Value = datos[11].Substring(0, 9);
                        fechaI.Value = datos[12].Substring(0, 9);

                    }
                    else
                    {
                        NoE.Checked = false;
                        SiE.Checked = true;

                        cedula.Value = datos[0];
                        nombre1.Value = datos[1];
                        nombre2.Value = datos[2];
                        apellido1.Value = datos[3];
                        apellido2.Value = datos[4];
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
                        telefono.Value = datos[6];
                        celular.Value = datos[7];
                        direccion.Value = datos[8];
                        correo.Value = datos[10];
                        fechaN.Value = datos[11].Substring(0, 9);
                        fechaI.Value = datos[12].Substring(0, 9);

                        Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "mostrar()", true);

                        datos2 = objeto.buscarEncargado(datos[9]);

                        cedula_encargado.Value = datos2[0];
                        nombre1_encargado.Value = datos2[1];
                        nombre2_encargado.Value = datos2[2];
                        apellido1_encargado.Value = datos2[3];
                        apellido2_encargado.Value = datos2[4];
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
                        telefono_encargado.Value = datos2[6];
                        celular_encargado.Value = datos2[7];
                        direccion_encargado.Value = datos2[8];
                        parentezco.Value = datos2[9];
                        correo_encargado.Value = datos2[10];
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
        protected void OnDataBound(object sender, EventArgs e)
        {
            GridViewRow row = new GridViewRow(0, 0, DataControlRowType.Header, DataControlRowState.Normal);
            for (int i = 0; i < GridView1.Columns.Count; i++)
            {
                TableHeaderCell cell = new TableHeaderCell();
                TextBox txtSearch = new TextBox();
                txtSearch.Attributes["placeholder"] = GridView1.Columns[i].HeaderText;
                txtSearch.CssClass = "search_textbox";
                cell.Controls.Add(txtSearch);
                row.Controls.Add(cell);
            }
            GridView1.HeaderRow.Parent.Controls.AddAt(1, row);
        }

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

            DateTime dt = Convert.ToDateTime(fechaN.Value);
            string fN = dt.ToString("yyyy-MM-dd");
            DateTime dt2 = Convert.ToDateTime(fechaI.Value);
            string fI = dt.ToString("yyyy-MM-dd");

            string corre = correo.Value;
            string correE = correo_encargado.Value;

            if (NoE.Checked & objeto.validacioncorreo(corre) == true)
            {
                objeto.actualizarPaciente(cedula.Value, nombre1.Value, nombre2.Value, apellido1.Value, apellido2.Value, genero, telefono.Value, celular.Value, direccion.Value, correo.Value, fN, fI);
                datos = objeto.buscarPaciente(cedula.Value);
                if (datos[9] == null & SiE.Checked & cedula_encargado.Value != "" & nombre1_encargado.Value != "" & nombre2_encargado.Value != "" & apellido1_encargado.Value != "" & apellido2_encargado.Value != "" & celular_encargado.Value != "" & direccion_encargado.Value != "" & correo_encargado.Value != "" & parentezco.Value != "")
                {
                    objeto.ActualizarPacienteNuevoEncargado(cedula.Value, cedula_encargado.Value, nombre1_encargado.Value, nombre2_encargado.Value, apellido1_encargado.Value, apellido2_encargado.Value, generoE, telefono_encargado.Value, celular_encargado.Value, direccion_encargado.Value, correo_encargado.Value, parentezco.Value);
                }
            }
            else if (objeto.validacioncorreo(corre) == true & objeto.validacioncorreo(correE) == true & SiE.Checked)
            {
                if (cedula_encargado.Value != "" & nombre1_encargado.Value != "" & nombre2_encargado.Value != "" & apellido1_encargado.Value != "" & apellido2_encargado.Value != "" & celular_encargado.Value != "" & direccion_encargado.Value != "" & correo_encargado.Value != "" & parentezco.Value != "")
                {
                    objeto.actualizarEncargado(cedula_encargado.Value, nombre1_encargado.Value, nombre2_encargado.Value, apellido1_encargado.Value, apellido2_encargado.Value, generoE, telefono_encargado.Value, celular_encargado.Value, direccion_encargado.Value, parentezco.Value, correo_encargado.Value);
                    objeto.actualizarPaciente(cedula.Value, nombre1.Value, nombre2.Value, apellido1.Value, apellido2.Value, genero, telefono.Value, celular.Value, direccion.Value, correo.Value, fN, fI);
                }
                else
                {
                    string mensaje = @"<script type='text/javascript'>
                alert('Debe de completar los campos del encargado');
                </script>";
                    ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", mensaje, false);
                }
                datos = objeto.buscarPaciente(cedula.Value);
                if (datos[9] == null & SiE.Checked & cedula_encargado.Value != "" & nombre1_encargado.Value != "" & nombre2_encargado.Value != "" & apellido1_encargado.Value != "" & apellido2_encargado.Value != "" & celular_encargado.Value != "" & direccion_encargado.Value != "" & correo_encargado.Value != "" & parentezco.Value != "")
                {
                    objeto.ActualizarPacienteNuevoEncargado(cedula.Value, cedula_encargado.Value, nombre1_encargado.Value, nombre2_encargado.Value, apellido1_encargado.Value, apellido2_encargado.Value, generoE, telefono_encargado.Value, celular_encargado.Value, direccion_encargado.Value, correo_encargado.Value, parentezco.Value);
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

            GridView1.DataSource = objeto.Paciente();
            GridView1.DataBind();

            string script = @"<script type='text/javascript'>
                alert('Se han actualizado adecuadamente los datos');
                </script>";
            ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", script, false);

        }

        protected void Cancelar_Click(object sender, EventArgs e)
        {
            GridView1.DataSource = objeto.Paciente();
            GridView1.DataBind();
            this.Controls.Clear();
            Response.Redirect("frm_ActualizarPaciente.aspx");
        }
    }
}