using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using System.Net.Mail;
using System.Net;

namespace SAC.formularios
{
    public partial class frmLogin : System.Web.UI.Page
    {
        metodos.metodos_login entrar = new metodos.metodos_login();
        metodos.metodos_Citas objeto = new metodos.metodos_Citas();
        protected void Page_Load(object sender, EventArgs e)
        {
            txt_usuario.Focus();
        }

        protected void btn_sesion_Click(object sender, EventArgs e)
        {
            if (txt_usuario.Value.Contains("'") || txt_usuario.Value.Contains("="))
            {
                txt_usuario.Value = "";
                string script = @"<script type='text/javascript'>
                    alert('No se permite usar valores como ' o =');</script>";
                ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", script, false);
            }
            else if(txt_contrasena.Value.Contains("'") || txt_contrasena.Value.Contains("="))
            {
                string script = @"<script type='text/javascript'>
                    alert('No se permite usar valores como ' o =');</script>";
                ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", script, false);
            }
            else
            {
                if (entrar.Login(txt_usuario.Value.ToString(), txt_contrasena.Value.ToString()) == true)
                {
                    String tipo = entrar.Permiso(txt_usuario.Value).ToString();
                    Session["acceder"] = "entro";
                    Session["tipo"] = tipo;
                    Response.Redirect("\\default.aspx");
                    
                }
                else
                {
                    txt_usuario.Value = "";
                    string script = @"<script type='text/javascript'>
                    alert('Usuario o contraseña incorrecto');
                    </script>";
                    ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", script, false);
                }
            }
        }

        protected void Timer1_Tick(object sender, EventArgs e)
        {
            try
            {
                String[,] matriz = objeto.BuscarCitasAutomaticas();
                String fecha = "";
                String hora = "";
                String nombre = "";
                String correo = "";

                for (int i = 0; i <= matriz.GetLength(0) - 1; i++)
                {
                    DateTime f = Convert.ToDateTime(matriz[i, 0]);
                    fecha = f.ToString("d");
                    hora = matriz[i, 1];
                    nombre = matriz[i, 2];
                    correo = matriz[i, 3];

                    //Configuración del Mensaje
                    MailMessage mail = new MailMessage();
                    SmtpClient SmtpServer = new SmtpClient("smtp.gmail.com");
                    //Especificamos el correo desde el que se enviará el Email y el nombre de la persona que lo envía
                    mail.From = new MailAddress("clinicadental.alinacamacho@gmail.com");
                    //Aquí ponemos el asunto del correo
                    mail.Subject = "Recordatorio de su cita";
                    //Aquí ponemos el mensaje que incluirá el correo
                    mail.Body = "Estimado " + nombre + "! Este es un mensaje para recordarle que su cita esta programada para la fecha: " + fecha + ", a las: " + hora + ".\nSin más por el momento, le esperamos.\nClínica Dental Doctora Alina Camacho";
                    //Especificamos a quien enviaremos el Email, no es necesario que sea Gmail, puede ser cualquier otro proveedor
                    mail.To.Add(correo);


                    //Configuracion del SMTP
                    SmtpServer.Port = 587; //Puerto que utiliza Gmail para sus servicios
                                           //Especificamos las credenciales con las que enviaremos el mail
                    SmtpServer.DeliveryMethod = System.Net.Mail.SmtpDeliveryMethod.Network;
                    SmtpServer.Credentials = new System.Net.NetworkCredential("clinicadental.alinacamacho@gmail.com", "SAC-corredores.2018");
                    SmtpServer.EnableSsl = true;
                    SmtpServer.Send(mail);
                }
            }
            catch (Exception ex)
            {
                string script = @"<script type='text/javascript'>
                    alert('No se pudo enviar el correo!');
                    </script>";
                ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", script, false);
            }
        }
    }
}