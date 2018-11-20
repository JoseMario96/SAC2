using System;
using System.Collections;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using System.Net.Mail;
using System.Net;

namespace SAC.formularios
{
    public partial class frm_Calendario : System.Web.UI.Page
    {
        metodos.metodos_Citas objeto = new metodos.metodos_Citas();
        private Hashtable _sheduleData;
        public static String cedulaAA;
        public static String fechaAA;
        public static String horaAA;
        protected void Page_Load(object sender, EventArgs e)
        {
            _sheduleData = GetSchedule();
        }

        private Hashtable GetSchedule()
        {
            String[,] matriz = objeto.Cita();
            Hashtable schedule = new Hashtable();
            int cuerpo = 1;
            for (int i = 0; i <= matriz.GetLength(0) - 1; i++)
            {
                //String fecha = matriz[i, 2].Split(' ')[0];
                //schedule[fecha] = "▄";
                if (i == 0)
                {
                    String fecha = matriz[i, 2].Split(' ')[0];
                    schedule[fecha] = cuerpo.ToString();
                }
                if (i > 0)
                {
                    String fechaAnterior = matriz[i - 1, 2].Split(' ')[0];
                    String fecha = matriz[i, 2].Split(' ')[0];
                    if (fechaAnterior == fecha)
                    {
                        cuerpo = cuerpo + 1;
                        schedule[fecha] = cuerpo.ToString();
                    }
                    else
                    {
                        cuerpo = 1;
                        schedule[fecha] = cuerpo.ToString();
                    }
                }

            }
            //schedule["4/10/2018"] = "Hola probando <br/> código";
            return schedule;
        }

        protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        {
            try
            {
                string fecha = Calendar1.SelectedDate.ToString(@"yyyy-MM-dd");
                if (objeto.EstaCita(fecha) == true)
                {

                    string script = @"<script type='text/javascript'>
                    document.getElementById('cabecera').style.display = 'block';
                    document.getElementById('grid').style.display = 'block' ;  
                    document.getElementById('cabecera2').style.display = 'none' ;
                    document.getElementById('agregar').style.display = 'none' ;
                    document.getElementById('Actualizar_Eliminar').style.display = 'none' ;
                    </script>";
                    ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", script, false);
                    fechaCabecera.InnerText = fecha;
                    Gridview_Hoy.DataSource = objeto.CitaHoy(fecha);
                    Gridview_Hoy.DataBind();
                }
                else
                {
                    string script = @"<script type='text/javascript'>
                    document.getElementById('cabecera2').style.display = 'block' ;
                    document.getElementById('agregar').style.display = 'block' ;
                    document.getElementById('cabecera').style.display = 'none';
                    document.getElementById('grid').style.display = 'none' ;
                    document.getElementById('Actualizar_Eliminar').style.display = 'none' ;
                    document.getElementById('agregar').scrollIntoView(); 
                    </script>";
                    ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", script, false);
                    fechaC.Value = fecha;
                    fechaC.Disabled = true;
                    cedula.Focus();
                }
            }
            catch
            {

            } 
        }

        protected void Calendar1_DayRender(object sender, DayRenderEventArgs e)
        {
            if (_sheduleData[e.Day.Date.ToShortDateString()] != null)
            {
                Literal lit = new Literal();
                lit.Text = "<br/>";
                e.Cell.Controls.Add(lit);
                Label lbl = new Label();
                lbl.Text = (string)_sheduleData[e.Day.Date.ToShortDateString()];
                lbl.Font.Size = new FontUnit(FontSize.Medium);
                lbl.ForeColor = System.Drawing.Color.Red;
                e.Cell.Controls.Add(lbl);
            }
        }

        protected void Gridview_Hoy_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                String[] datos = new String[6];
                foreach (GridViewRow row in Gridview_Hoy.Rows)
                {
                    if (row.RowIndex == Gridview_Hoy.SelectedIndex)
                    {

                        row.BackColor = ColorTranslator.FromHtml("#A1DCF2");
                        row.ToolTip = string.Empty;
                        cedulaAA = row.Cells[0].Text;
                        fechaAA = Calendar1.SelectedDate.ToString(@"yyyy-MM-dd");
                        horaAA = row.Cells[2].Text;
                        String codigo = objeto.Codigo(cedulaAA, fechaAA, horaAA);
                        datos = objeto.MostrarCita(codigo);
                        cedulaA.Value = datos[0];
                        fechaA.Value = datos[1];
                        horaA.Value = datos[2];
                        telefonoA.Value = datos[3];
                        nombreA.Value = datos[4];
                        correoA.Value = datos[5];
                        string script = @"<script type='text/javascript'>
                        document.getElementById('Actualizar_Eliminar').style.display = 'block';
                        document.getElementById('Actualizar_Eliminar').scrollIntoView(); 
                        </script>";
                        ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", script, false);
                        cedulaA.Focus();
                    }
                    else
                    {
                        row.BackColor = ColorTranslator.FromHtml("#FFFFFF");
                        row.ToolTip = "Click para seleccionar esta fila.";
                    }
                }
            }
            catch
            {

            }  
        }

        protected void Gridview_Hoy_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Attributes["onclick"] = Page.ClientScript.GetPostBackClientHyperlink(Gridview_Hoy, "select$" + e.Row.RowIndex);
                e.Row.ToolTip = "Click para seleccionar esta fila.";
            }
        }

        protected void btn_Actualizar_Click(object sender, EventArgs e)
        {
            try
            {
                DateTime date = Convert.ToDateTime(fechaA.Value);
                String date2 = date.ToString(@"yyyy-MM-dd");
                if (cedulaA.Value == "")
                {
                    string script = @"<script type='text/javascript'>
                    alert('El campo cédula no puede estar vacío!');
                    </script>";
                    ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", script, false);
                    cedulaA.Focus();
                }
                else if (nombreA.Value == "")
                {
                    string script = @"<script type='text/javascript'>
                    alert('El campo nombre no puede estar vacío!');
                    </script>";
                    ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", script, false);
                    nombreA.Focus();
                }
                else if (fechaA.Value == "")
                {
                    string script = @"<script type='text/javascript'>
                    alert('El campo fecha no puede estar vacío!');
                    </script>";
                    ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", script, false);
                    fechaA.Focus();
                }
                else if (horaA.Value == "")
                {
                    string script = @"<script type='text/javascript'>
                    alert('El campo hora no puede estar vacío!');
                    </script>";
                    ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", script, false);
                    horaA.Focus();
                }
                else if (telefonoA.Value == "")
                {
                    string script = @"<script type='text/javascript'>
                    alert('El campo teléfono no puede estar vacío!');
                    </script>";
                    ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", script, false);
                    telefonoA.Focus();
                }
                else if (correoA.Value == "")
                {
                    string script = @"<script type='text/javascript'>
                    alert('El campo correo no puede estar vacío!');
                    </script>";
                    ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", script, false);
                    correoA.Focus();
                }
                else if (fechaAA == date2 & horaAA == horaA.Value)
                {
                    objeto.ActualizarCitaSFecha(objeto.Codigo(cedulaAA, fechaAA, horaAA), cedulaA.Value, telefonoA.Value, nombreA.Value, correoA.Value);
                    string script = @"<script type='text/javascript'>
                    alert('La información se actualizó correctamente!');
                    </script>";
                    ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", script, false);
                    this.Controls.Clear();
                    Response.Redirect("frm_Calendario.aspx");
                }
                else
                {
                    if (objeto.ValidarCita(date2, horaA.Value) == true)
                    {
                        string script = @"<script type='text/javascript'>
                    alert('Ya existe una cita en este horario, puedes intentarlo cambiando la hora!');
                    </script>";
                        ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", script, false);
                        horaA.Focus();
                    }
                    else
                    {
                        objeto.ActualizarCita(objeto.Codigo(cedulaAA, fechaAA, horaAA), cedulaA.Value, date2, horaA.Value, telefonoA.Value, nombreA.Value, correoA.Value);
                        string script = @"<script type='text/javascript'>
                    alert('La información se actualizó correctamente!');
                    </script>";
                        ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", script, false);
                        this.Controls.Clear();
                        Response.Redirect("frm_Calendario.aspx");
                    }

                }
            }
            catch
            {

            } 
        }

        protected void btn_Eliminar_Click(object sender, EventArgs e)
        {
            try
            {
                objeto.EliminarCita(cedulaAA, fechaAA, horaAA);
                string script = @"<script type='text/javascript'>
                    alert('La información se eliminó correctamente!');
                    </script>";
                ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", script, false);
                this.Controls.Clear();
                Response.Redirect("frm_Calendario.aspx");
            }
            catch
            {

            }
        }

        protected void btn_Agregar_Click(object sender, EventArgs e)
        {
            try
            {
                if (cedula.Value == "")
                {
                    string script = @"<script type='text/javascript'>
                    alert('El campo cédula no puede estar vacío!');
                    </script>";
                    ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", script, false);
                    cedula.Focus();
                }
                else if (nombre.Value == "")
                {
                    string script = @"<script type='text/javascript'>
                    alert('El campo nombre no puede estar vacío!');
                    </script>";
                    ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", script, false);
                    nombre.Focus();
                }
                else if (fechaC.Value == "")
                {
                    string script = @"<script type='text/javascript'>
                    alert('El campo fecha no puede estar vacío!');
                    </script>";
                    ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", script, false);
                    fechaC.Focus();
                }
                else if (hora.Value == "")
                {
                    string script = @"<script type='text/javascript'>
                    alert('El campo hora no puede estar vacío!');
                    </script>";
                    ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", script, false);
                    hora.Focus();
                }
                else if (telefono.Value == "")
                {
                    string script = @"<script type='text/javascript'>
                    alert('El campo teléfono no puede estar vacío!');
                    </script>";
                    ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", script, false);
                    telefonoA.Focus();
                }
                else if (correo.Value == "")
                {
                    string script = @"<script type='text/javascript'>
                    alert('El campo correo no puede estar vacío!');
                    </script>";
                    ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", script, false);
                    correo.Focus();
                }
                else if (objeto.ValidarCita(fechaC.Value, hora.Value) == true)
                {
                    string script = @"<script type='text/javascript'>
                    alert('Ya existe una cita en este horario, puedes intentarlo cambiando la hora!');
                    </script>";
                    ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", script, false);
                    hora.Focus();
                }
                else
                {
                    objeto.AgregarCita(cedula.Value, Calendar1.SelectedDate.ToString(@"yyyy-MM-dd"), hora.Value.ToString(), telefono.Value, nombre.Value, correo.Value);
                    string script = @"<script type='text/javascript'>
                    alert('Se agregó correctamente la información');
                    </script>";
                    ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", script, false);
                    this.Controls.Clear();
                    Response.Redirect("frm_Calendario.aspx");
                }
            }
            catch
            {

            }
        }

        protected void btn_Limpiar_Click(object sender, EventArgs e)
        {
            cedula.Value = "";
            nombre.Value = "";
            hora.Value = "";
            telefono.Value = "";
            correo.Value = "";
            cedula.Focus();
        }

        protected void btn_Nuevo_Click(object sender, EventArgs e)
        {
            string script = @"<script type='text/javascript'>
                    document.getElementById('cabecera2').style.display = 'block' ;
                    document.getElementById('agregar').style.display = 'block' ;
                    document.getElementById('cabecera').style.display = 'none';
                    document.getElementById('grid').style.display = 'none' ;
                    document.getElementById('Actualizar_Eliminar').style.display = 'none' ;
                    document.getElementById('agregar').scrollIntoView(); 
                    </script>";
            ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", script, false);
            fechaC.Value = Calendar1.SelectedDate.ToString(@"yyyy-MM-dd");
            cedula.Focus();
        }

        protected void btn_Notificación_Click(object sender, EventArgs e)
        {
            try
            {
                String fecha = "";
                DateTime f = Convert.ToDateTime(fechaA.Value);
                fecha = f.ToString("d");
                //Configuración del Mensaje
                MailMessage mail = new MailMessage();
                SmtpClient SmtpServer = new SmtpClient("smtp.gmail.com");
                //Especificamos el correo desde el que se enviará el Email y el nombre de la persona que lo envía
                mail.From = new MailAddress("clinicadental.alinacamacho@gmail.com");
                //Aquí ponemos el asunto del correo
                mail.Subject = "Recordatorio de su cita";
                //Aquí ponemos el mensaje que incluirá el correo
                mail.Body = "Estimado " + nombreA.Value + "! Este es un mensaje para recordarle su cita para la fecha: " + fecha + " y hora: " + horaA.Value + ". Sin más por el momento, le esperamos.\nClínica Dental Doctora Alina Camacho";
                //Especificamos a quien enviaremos el Email, no es necesario que sea Gmail, puede ser cualquier otro proveedor
                mail.To.Add(correoA.Value);
                

                //Configuracion del SMTP
                SmtpServer.Port = 587; //Puerto que utiliza Gmail para sus servicios
                //Especificamos las credenciales con las que enviaremos el mail
                SmtpServer.DeliveryMethod = System.Net.Mail.SmtpDeliveryMethod.Network;
                SmtpServer.Credentials = new System.Net.NetworkCredential("clinicadental.alinacamacho@gmail.com", "SAC-corredores.2018");
                SmtpServer.EnableSsl = true;
                SmtpServer.Send(mail);
                
            }
            catch
            {
                string script = @"<script type='text/javascript'>
                    alert('No se pudo enviar el correo!');
                    </script>";
                ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", script, false);
            }
        }
    }
}