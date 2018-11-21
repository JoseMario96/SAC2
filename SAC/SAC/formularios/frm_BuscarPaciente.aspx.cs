using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SAC.formularios
{
    public partial class frmBuscar : System.Web.UI.Page
    {
        metodos.metodosPaciente objeto = new metodos.metodosPaciente();
        public static string generoE;
        public static string genero;

        protected void Page_Load(object sender, EventArgs e)
        {

            if (!this.IsPostBack)
            {
                txtSearch.Focus();
                GridView1.DataSource = objeto.Paciente();
                GridView1.DataBind();

            }


            ScriptManager.RegisterClientScriptBlock(this, GetType(), "myfunction", "mostrar();", true);
        }


        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.DataSource = objeto.Paciente2(txtSearch.Text.Trim());
            GridView1.PageIndex = e.NewPageIndex;
            GridView1.DataBind();

        }
        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Attributes["onclick"] = Page.ClientScript.GetPostBackClientHyperlink(GridView1, "Select$" + e.Row.RowIndex);
                e.Row.ToolTip = "Click para seleccionar esta fila.";
            }
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            String ced;

            String[] datos = new String[13];
            String[] datos2 = new String[10];
            GridView1.DataSource = objeto.Paciente2(txtSearch.Text.Trim());

            string script = @"<script type='text/javascript'>
                document.getElementById('formularioP').style.display = 'block' ;           
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
                    ScriptManager.RegisterStartupScript(Page, typeof(Page), "ScrollToADiv", "setTimeout(scrollToDiv, 1);", true);
                    if (datos[9] == null)
                    {
                        Label1.InnerHtml = "No";
                        ScriptManager.RegisterStartupScript(Page, typeof(Page), "Prueba", "ocultar();", true);

                        cedula.InnerText = datos[0];
                        nombre1.InnerText = datos[1];
                        nombre2.InnerText = datos[2];
                        apellido1.InnerText = datos[3];
                        apellido2.InnerText = datos[4];
                        if (datos[5].Equals("Masculino"))
                        {
                            sexo.InnerText = "Masculino";
                        }
                        if (datos[5].Equals("Femenino"))
                        {
                            sexo.InnerText = "Femenino";
                        }
                        if (datos[5].Equals("Otro"))
                        {
                            sexo.InnerText = "Otro";
                        }
                        telefono.InnerText = datos[6];
                        celular.InnerText = datos[7];
                        direcion.InnerText = datos[8];
                        correo.InnerText = datos[10];
                        fechaN.InnerText = datos[11].Substring(0, 9);
                        fechaI.InnerText = datos[12].Substring(0, 9);

                    }
                    else
                    {
                        Label1.InnerHtml = "Si";
                        string scriptt = @"<script type='text/javascript'>
                        document.getElementById('encargado').style.display = 'block' ;              
                        </script>";

                        ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", scriptt, false);
                        cedula.InnerText = datos[0];
                        nombre1.InnerText = datos[1];
                        nombre2.InnerText = datos[2];
                        apellido1.InnerText = datos[3];
                        apellido2.InnerText = datos[4];
                        if (datos[5].Equals("Masculino"))
                        {

                            sexo.InnerText = "Masculino";
                        }
                        if (datos[5].Equals("Femenino"))
                        {
                            sexo.InnerText = "Femenino";
                        }
                        if (datos[5].Equals("Otro"))
                        {
                            sexo.InnerText = "Otro";
                        }
                        telefono.InnerText = datos[6];
                        celular.InnerText = datos[7];
                        direcion.InnerText = datos[8];
                        correo.InnerText = datos[10];
                        fechaN.InnerText = datos[11].Substring(0, 9);
                        fechaI.InnerText = datos[12].Substring(0, 9);


                        //     Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "mostrar();", true);



                        datos2 = objeto.buscarEncargado(datos[9]);

                        cedula_encargado.InnerText = datos2[0];
                        nombre1_encargado.InnerText = datos2[1];
                        nombre2_encargado.InnerText = datos2[2];
                        apellido1_encargado.InnerText = datos2[3];
                        apellido2_encargado.InnerText = datos2[4];
                        if (datos2[5].Equals("Masculino"))
                        {

                            sexoE.InnerText = "Masculino";
                        }
                        else if (datos2[5].Equals("Femenino"))
                        {
                            sexoE.InnerText = "Femenino";
                        }
                        else if (datos2[5].Equals("Otro"))
                        {
                            sexoE.InnerText = "Otro";
                        }
                        telefono_encargado.InnerText = datos2[6];
                        celular_encargado.InnerText = datos2[7];
                        direccion_encargado.InnerText = datos2[8];
                        parentezco.InnerText = datos2[9];
                        correo_encargado.InnerText = datos2[10];
                    }
                }
                else
                {
                    row.BackColor = ColorTranslator.FromHtml("#FFFFFF");
                    row.ToolTip = "Click to select this row.";

                }

            }
        }

        protected void GridView1_PreRender(object sender, EventArgs e)
        {
            if (GridView1.Rows.Count > 0)
            {
                GridView1.HeaderRow.TableSection = TableRowSection.TableHeader;
            }
        }

        protected void InvisButton_Click(object sender, EventArgs e)
        {
            GridView1.DataSource = objeto.Paciente2(txtSearch.Text.Trim());
            GridView1.DataBind();

        }
    }
}
